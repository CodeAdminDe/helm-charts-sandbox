#!/usr/bin/env bash

set -euo pipefail

repos_only=false
if [[ "${1-}" == "--repos-only" ]]; then
  repos_only=true
  shift
fi

normalize_chart_dirs() {
  if [[ "$#" -eq 0 ]]; then
    find charts -mindepth 2 -maxdepth 2 -type f -name Chart.yaml -print | sed 's#/Chart.yaml$##' | sort
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

chart_has_dependencies() {
  ruby -ryaml -e '
    data = YAML.load_file(ARGV[0]) || {}
    exit(Array(data["dependencies"]).empty? ? 1 : 0)
  ' "$1"
}

mapfile -t chart_dirs < <(normalize_chart_dirs "$@")

if [[ "${#chart_dirs[@]}" -eq 0 ]]; then
  echo "No charts to process."
  exit 0
fi

mapfile -t helm_repos < <(
  ruby -ryaml -e '
    ARGV.each do |chart_dir|
      chart_file = File.join(chart_dir, "Chart.yaml")
      next unless File.file?(chart_file)

      data = YAML.load_file(chart_file) || {}
      Array(data["dependencies"]).each do |dep|
        repo = dep["repository"].to_s.strip
        next if repo.empty? || repo.start_with?("oci://")

        puts repo
      end
    end
  ' "${chart_dirs[@]}" | sort -u
)

if [[ "${#helm_repos[@]}" -gt 0 ]]; then
  echo "Configuring ${#helm_repos[@]} Helm repositories..."
  for idx in "${!helm_repos[@]}"; do
    repo="${helm_repos[$idx]}"
    alias="chart-repo-$((idx + 1))"

    echo "  ${alias} -> ${repo}"
    helm repo add --force-update "$alias" "$repo" >/dev/null
  done

  helm repo update >/dev/null
else
  echo "No non-OCI Helm repositories required."
fi

if [[ "$repos_only" == true ]]; then
  exit 0
fi

for chart_dir in "${chart_dirs[@]}"; do
  chart_yaml="${chart_dir}/Chart.yaml"

  if ! chart_has_dependencies "$chart_yaml"; then
    echo "Skipping ${chart_dir}: no dependencies declared."
    continue
  fi

  if [[ -f "${chart_dir}/Chart.lock" ]]; then
    echo "Validating locked dependencies for ${chart_dir}"
    helm dependency build "$chart_dir" >/dev/null
  else
    echo "Validating dependency resolution for ${chart_dir}"
    helm dependency update "$chart_dir" >/dev/null
  fi
done
