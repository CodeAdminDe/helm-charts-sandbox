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
