#!/usr/bin/env bash

set -euo pipefail

readonly charts_dir="${CHARTS_DIR:-charts}"
readonly internal_repo_url="${INTERNAL_CHART_REPOSITORY_URL:-https://codeadminde.github.io/helm-charts}"
readonly release_packages_dir="${RELEASE_PACKAGES_DIR:-.cr-release-packages}"

print_usage() {
  cat <<'EOF'
Usage: package-release-charts.sh [chart-dir ...]

Without arguments, the script packages all charts changed since the latest tag.
With arguments, only the provided chart directories are packaged.
EOF
}

normalize_chart_dirs() {
  if [[ "$#" -eq 0 ]]; then
    return
  fi

  for arg in "$@"; do
    if [[ -f "$arg/Chart.yaml" ]]; then
      printf '%s\n' "$arg"
    elif [[ -f "$arg" && "$(basename "$arg")" == "Chart.yaml" ]]; then
      dirname "$arg"
    else
      printf 'Unknown chart path: %s\n' "$arg" >&2
      exit 1
    fi
  done | sort -u
}

lookup_latest_tag() {
  git fetch --tags >/dev/null 2>&1

  if ! git describe --tags --abbrev=0 HEAD~ 2>/dev/null; then
    git rev-list --max-parents=0 --first-parent HEAD
  fi
}

filter_charts() {
  while read -r chart; do
    [[ ! -d "$chart" ]] && continue

    if [[ -f "$chart/Chart.yaml" ]]; then
      echo "$chart"
    else
      echo "WARNING: $chart/Chart.yaml is missing, skipping." >&2
    fi
  done
}

lookup_changed_charts() {
  local commit="$1"
  local changed_files

  changed_files=$(git diff --find-renames --name-only "$commit" -- "$charts_dir")

  local depth
  depth=$(($(tr "/" "\n" <<<"$charts_dir" | sed '/^\(\.\)*$/d' | wc -l) + 1))
  local fields="1-${depth}"

  cut -d '/' -f "$fields" <<<"$changed_files" | uniq | filter_charts
}

chart_has_dependencies() {
  ruby -ryaml -e '
    data = YAML.load_file(ARGV[0]) || {}
    exit(Array(data["dependencies"]).empty? ? 1 : 0)
  ' "$1"
}

list_internal_dependencies() {
  ruby -ryaml -e '
    chart_file = ARGV[0]
    internal_repo_url = ARGV[1]
    data = YAML.load_file(chart_file) || {}

    Array(data["dependencies"]).each do |dep|
      repo = dep["repository"].to_s.strip
      next unless repo == internal_repo_url || repo.start_with?("file://")

      name = dep["name"].to_s.strip
      puts name unless name.empty?
    end
  ' "$1" "$2"
}

list_external_repositories() {
  ruby -ryaml -e '
    chart_file = ARGV[0]
    internal_repo_url = ARGV[1]
    data = YAML.load_file(chart_file) || {}

    Array(data["dependencies"]).each do |dep|
      repo = dep["repository"].to_s.strip
      next if repo.empty? || repo.start_with?("oci://") || repo == internal_repo_url || repo.start_with?("file://")

      puts repo
    end
  ' "$1" "$2"
}

rewrite_internal_repositories() {
  ruby -ryaml -e '
    chart_file = ARGV[0]
    internal_repo_url = ARGV[1]
    staged_root = ARGV[2]
    data = YAML.load_file(chart_file) || {}
    changed = false

    Array(data["dependencies"]).each do |dep|
      next unless dep["repository"].to_s.strip == internal_repo_url

      dep_name = dep["name"].to_s.strip
      next if dep_name.empty?

      dep["repository"] = "file://#{File.join(staged_root, dep_name)}"
      changed = true
    end

    File.write(chart_file, YAML.dump(data)) if changed
  ' "$1" "$2" "$3"
}

write_output() {
  if [[ -n "${GITHUB_OUTPUT-}" ]]; then
    printf '%s=%s\n' "$1" "$2" >>"$GITHUB_OUTPUT"
  fi
}

declare -a requested_chart_args=()
while [[ "$#" -gt 0 ]]; do
  case "$1" in
    -h|--help)
      print_usage
      exit 0
      ;;
    *)
      requested_chart_args+=("$1")
      shift
      ;;
  esac
done

declare -A source_chart_dirs_by_name=()
declare -A source_chart_names_by_dir=()

while IFS=$'\t' read -r chart_name chart_dir; do
  [[ -n "$chart_name" && -n "$chart_dir" ]] || continue
  source_chart_dirs_by_name["$chart_name"]="$chart_dir"
  source_chart_names_by_dir["$chart_dir"]="$chart_name"
done < <(
  ruby -ryaml -e '
    Dir[File.join(ARGV[0], "*/Chart.yaml")].sort.each do |path|
      data = YAML.load_file(path) || {}
      name = data["name"].to_s.strip
      next if name.empty?

      puts "#{name}\t#{File.dirname(path)}"
    end
  ' "$charts_dir"
)

declare -a changed_chart_dirs=()
latest_tag=""

if [[ "${#requested_chart_args[@]}" -gt 0 ]]; then
  mapfile -t changed_chart_dirs < <(normalize_chart_dirs "${requested_chart_args[@]}")
else
  latest_tag=$(lookup_latest_tag)
  echo "Discovering changed charts since '${latest_tag}'..."
  mapfile -t changed_chart_dirs < <(lookup_changed_charts "$latest_tag")
fi

if [[ "${#changed_chart_dirs[@]}" -eq 0 ]]; then
  echo "No changed charts to package."
  write_output "has_changes" "false"
  write_output "changed_charts" ""
  write_output "latest_tag" "$latest_tag"
  exit 0
fi

temp_root=$(mktemp -d)
trap 'rm -rf "$temp_root"' EXIT

staged_charts_root="$temp_root/staged-charts"
mkdir -p "$staged_charts_root"

export HELM_REPOSITORY_CONFIG="$temp_root/helm/repositories.yaml"
export HELM_REPOSITORY_CACHE="$temp_root/helm/repository-cache"
export HELM_REGISTRY_CONFIG="$temp_root/helm/registry.json"
export HELM_CACHE_HOME="$temp_root/helm/cache"
export HELM_CONFIG_HOME="$temp_root/helm/config"
export HELM_DATA_HOME="$temp_root/helm/data"
mkdir -p "$HELM_REPOSITORY_CACHE" "$HELM_CACHE_HOME" "$HELM_CONFIG_HOME" "$HELM_DATA_HOME"

declare -A staged_chart_dirs_by_name=()
declare -A prepared_chart_names=()
declare -a staged_chart_names=()
declare -a changed_chart_names=()

stage_chart_tree() {
  local chart_name="$1"

  if [[ -n "${staged_chart_dirs_by_name[$chart_name]-}" ]]; then
    return
  fi

  local source_dir="${source_chart_dirs_by_name[$chart_name]-}"
  if [[ -z "$source_dir" ]]; then
    echo "Unable to locate chart source for '${chart_name}'." >&2
    exit 1
  fi

  local staged_dir="${staged_charts_root}/${chart_name}"
  mkdir -p "$staged_dir"
  cp -R "$source_dir/." "$staged_dir"

  while IFS= read -r dep_name; do
    [[ -z "$dep_name" ]] && continue
    stage_chart_tree "$dep_name"
  done < <(list_internal_dependencies "$staged_dir/Chart.yaml" "$internal_repo_url")

  rewrite_internal_repositories "$staged_dir/Chart.yaml" "$internal_repo_url" "$staged_charts_root"

  staged_chart_dirs_by_name["$chart_name"]="$staged_dir"
  staged_chart_names+=("$chart_name")
}

prepare_chart() {
  local chart_name="$1"

  if [[ "${prepared_chart_names[$chart_name]-}" == "1" ]]; then
    return
  fi

  local staged_dir="${staged_chart_dirs_by_name[$chart_name]-}"
  if [[ -z "$staged_dir" ]]; then
    echo "Chart '${chart_name}' was not staged." >&2
    exit 1
  fi

  while IFS= read -r dep_name; do
    [[ -z "$dep_name" ]] && continue
    prepare_chart "$dep_name"
  done < <(list_internal_dependencies "$staged_dir/Chart.yaml" "$internal_repo_url")

  if chart_has_dependencies "$staged_dir/Chart.yaml"; then
    echo "Resolving dependencies for ${chart_name}"
    helm dependency update "$staged_dir" >/dev/null
  else
    echo "Skipping dependency resolution for ${chart_name}: no dependencies declared."
  fi

  prepared_chart_names["$chart_name"]=1
}

for chart_dir in "${changed_chart_dirs[@]}"; do
  chart_name="${source_chart_names_by_dir[$chart_dir]-}"
  if [[ -z "$chart_name" ]]; then
    echo "Unable to map chart directory '${chart_dir}' to a chart name." >&2
    exit 1
  fi

  changed_chart_names+=("$chart_name")
  stage_chart_tree "$chart_name"
done

mapfile -t external_repos < <(
  for chart_name in "${staged_chart_names[@]}"; do
    list_external_repositories "${staged_chart_dirs_by_name[$chart_name]}/Chart.yaml" "$internal_repo_url"
  done | sort -u
)

if [[ "${#external_repos[@]}" -gt 0 ]]; then
  echo "Configuring ${#external_repos[@]} external Helm repositories..."
  for idx in "${!external_repos[@]}"; do
    repo="${external_repos[$idx]}"
    alias="chart-repo-$((idx + 1))"
    echo "  ${alias} -> ${repo}"
    helm repo add --force-update "$alias" "$repo" >/dev/null
  done
  helm repo update >/dev/null
else
  echo "No external Helm repositories required."
fi

rm -rf "$release_packages_dir"
mkdir -p "$release_packages_dir"

for chart_name in "${changed_chart_names[@]}"; do
  prepare_chart "$chart_name"
  echo "Packaging ${chart_name}"
  helm package "${staged_chart_dirs_by_name[$chart_name]}" --destination "$release_packages_dir" >/dev/null
done

changed_chart_csv=$(IFS=,; echo "${changed_chart_names[*]}")
write_output "has_changes" "true"
write_output "changed_charts" "$changed_chart_csv"
write_output "latest_tag" "$latest_tag"
echo "Packaged charts: ${changed_chart_csv}"
