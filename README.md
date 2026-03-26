# SANDBOX REPO

> WARNING: THIS IS A TESTING AND DEBUGGING REPO

## Usage

[Helm](https://helm.sh) must be installed to use the charts. Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

  helm repo add codeadminde-sandbox https://codeadminde.github.io/helm-charts-sandbox/

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages. You can then run `helm search repo
codeadminde-sandbox` to see the charts.

To install the <chart-name> chart:

    helm install my-release-name codeadminde-sandbox/<chart-name>

To uninstall the chart:

    helm uninstall my-release-name

### Collection

> Please note that this is a private Helm chart repository and neither my work nor I am directly or indirectly affiliated with the packaged applications or their authors, unless otherwise stated.

The following charts are currently available:

| Name | Version | AppVersion | Description |
|------|---------|------------|-------------|
| actual-budget | 0.1.0 | 26.3.0 | A Helm chart for actual-budget deployment on Kubernetes. |
| agent-zero | 0.1.4 | v0.9.8.2 | A Helm chart for deploying Agent Zero (AI Operating System) on Kubernetes. |
| anything-llm | 0.1.1 | 1.11.2 | A Helm chart for deploying AnythingLLM on Kubernetes. |
| bind9-hidden-primary | 0.4.3 | 9.20 | A Helm chart for bind9 to use as hidden primary, based on the offical Docker Image by InternetSystemsConsortium (ISC) |
| coder | 0.2.0 | v2.31.5 | A Helm chart for deploying Coder on Kubernetes. |
| coturn-server | 0.4.0 | 4.9.0 | A Helm chart for an easier coturn deployment at kubernetes. |
| derper | 0.1.1 | 1.94.2 | A Helm chart for running a Tailscale DERP relay on Kubernetes. |
| documenso | 0.1.1 | v2.8.1 | A Helm chart for deploying Documenso on Kubernetes. |
| envoy-gateway | 0.4.5 | v1.7.1 | A Helm chart for deploying Envoy Gateway (Gateway API implementation) on Kubernetes. |
| envoy-gateway-dataplane-policies | 0.2.3 | v1.7.1 | A Helm chart for Envoy Gateway dataplane CiliumNetworkPolicies on Kubernetes. |
| envoy-gateway-instance | 0.1.1 | v1.7.1 | A Helm chart for deploying Envoy Gateway Gateway and EnvoyProxy instances on Kubernetes. |
| envoy-gateway-instance-policies | 0.1.2 | v1.7.1 | A Helm chart for Envoy Gateway Gateway-instance policy resources on Kubernetes. |
| garage | 0.1.1 | v2.2.0 | A Helm chart for an easier Garage (https://garagehq.deuxfleurs.fr) deployment on Kubernetes. Please note that this is a private helm chart and not directly or indirectly affiliated with Garage or its authors. |
| headscale | 0.2.0 | 0.28.0 | A Helm chart for an easier headscale (https://headscale.net) deployment on Kubernetes. Please note that this is a private helm chart and not directly or indirectly affiliated with headscale or its authors. |
| kasm-agent | 0.1.0 | 1.18.1 | A Helm chart for deploying a Kasm agent workload in Kubernetes (advanced/unsupported static-agent model). |
| kasm-ws | 0.1.0 | 1.18.1 | A Helm chart for an easier Kasm Workspaces (https://kasm.com) deployment on Kubernetes. Please note that this is a private helm chart and not directly or indirectly affiliated with Kasm Technologies, Inc. or its authors. |
| libchart-cnps | 0.2.1 | 0.2.0 | A (experimental) Helm chart of cilium network policies for usage as a library chart. |
| local-agi | 0.1.2 | v2.8.1 | A Helm chart for deploying LocalAGI on Kubernetes. |
| local-recall | 0.1.3 | v0.5.8 | A Helm chart for deploying LocalRecall on Kubernetes. |
| mastodon | 0.1.2 | v4.5.7 | A Helm chart for deploying Mastodon on Kubernetes with repo-aligned secure defaults and integrations. |
| netbird-agent | 0.11.3 | 0.66.3 | A Helm chart for an easier NetBird agent (https://netbird.io) deployment at kubernetes. |
| netbird-management | 1.16.0 | 0.66.3 | A Helm chart for an easier NetBird management stack (https://netbird.io) deployment at kubernetes. |
| ollama | 0.20.1 | 0.18.1 | A Helm chart for an easier ollama (https://ollama.com) deployment on k8s. Please note that this is a private helm chart and not directly or indirectly affiliated with ollama or its authors. |
| outline | 1.13.0 | 1.6.1 | A Helm chart for an easier outline (https://getoutline.com) deployment at kubernetes. |
| paperless-ngx | 0.3.1 | 2.20.13 | A Helm chart for deploying Paperless-ngx on Kubernetes. |
| redis | 0.4.1 | 8.6.1 | A Helm chart for Redis k8s deployment, based on library/redis |
| sonarqube | 0.3.0 | 26.3.0.120487-community | A Helm chart for deploying SonarQube Server on Kubernetes. |
| supabase | 0.4.3 | 0.4.3 | A proxy chart for an easier supabase deployment at kubernetes. Take a look at the dependency chart values.yaml (see https://github.com/CodeAdminDe/supabase-kubernetes) and update at least security related values!! |
| webfinger | 0.5.1 | 0.10.0 | A Helm chart for an easy webfinger deployment at kubernetes. |

