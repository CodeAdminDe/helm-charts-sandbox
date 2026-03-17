

# ollama

![Version: 0.20.1](https://img.shields.io/badge/Version-0.20.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.18.1](https://img.shields.io/badge/AppVersion-0.18.1-informational?style=flat-square)

A Helm chart for an easier ollama (https://ollama.com) deployment on k8s. Please note that this is a private helm chart and not directly or indirectly affiliated with ollama or its authors.

**Homepage:** <https://github.com/CodeAdminDe/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Frederic Roggon | <frederic.roggon@codeadmin.de> | <https://github.com/CodeAdminDe> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://codeadminde.github.io/helm-charts | libchart-cnps(libchart-cnps) | 0.2.1 |

## TL;DR

You don't want to read through the docs? That's the quick and dirty way:

```bash
helm repo add codeadminde https://codeadminde.github.io/helm-charts/
helm repo update
helm install ollama codeadminde/ollama
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

> I'd recommend reading through the docs. Skip them at your own risk. ;-)

## Repository

In order to install / query / etc... the charts, you'll need to add the repository:

```bash
helm repo add codeadminde https://codeadminde.github.io/helm-charts/
helm repo update
```

## Installation

To install the chart with the release name `ollama`

```bash
helm install ollama codeadminde/ollama
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

## Uninstallation

To uninstall the chart release named `ollama`

```bash
helm uninstall ollama
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Take a look at the [values.yaml](./values.yaml) file of the chart. It contains the default configuration and additional notes.
So it would be a good idea to take a look at it, even if you already know what you would like to accomplish.

To configure the release (chart values), provide your own values via a *.yaml file and reference it with the `-f` flag.

> #### Sample
>
> ```bash
> helm install ollama codeadminde/ollama -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Then you have to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install ollama --set key=value --set keyTwo=secondValue codeadminde/ollama
> ```

## Values

<table height="800px" >
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td id="additionalEnvSecrets"><a href="./values.yaml#L180">additionalEnvSecrets</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td>Provide additonal env vars via one or more secretes... useful for API keys etc... Specifiy the ENV key used by ollama as KEY and the secret name as VALUE. The secret should contain the ENV key and the encrypted value: Sample secret ... apiVersion: v1 kind: Secret metadata: name: your-secret-name-to-slack-oidc-secrets type: Opaque stringData:   SLACK_KEY: "slack-key-value-goes-here"   SLACK_SECRET: "slack-secret-value-goes-here"</td>
		</tr>
		<tr>
			<td id="affinity"><a href="./values.yaml#L271">affinity</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{}
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="autoscaling"><a href="./values.yaml#L247">autoscaling</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "maxReplicas": 100,
  "minReplicas": 1,
  "targetCPUUtilizationPercentage": 80
}
</pre>
</div>
			</td>
			<td>This section is for setting up autoscaling more information can be found here: https://kubernetes.io/docs/concepts/workloads/autoscaling/</td>
		</tr>
		<tr>
			<td id="cnps"><a href="./values.yaml#L81">cnps</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "appTraffic": {
    "egress": {
      "allow": true,
      "matchLabels": {},
      "toEntities": []
    },
    "ingress": {
      "allow": true,
      "matchLabels": {}
    }
  }
}
</pre>
</div>
			</td>
			<td>Configure app-specific ingress policy. Note: Requires oppinionated CiliumNetworkPolicies. Otherwise these settings will be ignored. These settings are directly related to the application. This will not influence the namespace-wide policies (e.g. to allow egress dns traffic).</td>
		</tr>
		<tr>
			<td id="env"><a href="./values.yaml#L163">env</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td>Provide env vars to the deployment. Do not add secretes here... use additionalEnvSecrets instead!</td>
		</tr>
		<tr>
			<td id="fullnameOverride"><a href="./values.yaml#L29">fullnameOverride</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="image"><a href="./values.yaml#L19">image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "ollama/ollama",
  "tag": ""
}
</pre>
</div>
			</td>
			<td>This sets the container image more information can be found here: https://kubernetes.io/docs/concepts/containers/images/ Override the image tag, whose default is the chart appVersion.</td>
		</tr>
		<tr>
			<td id="imagePullSecrets"><a href="./values.yaml#L25">imagePullSecrets</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>This is for the secrets for pulling an image from a private repository more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/</td>
		</tr>
		<tr>
			<td id="ingress"><a href="./values.yaml#L188">ingress</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "className": "nginx",
  "enabled": false,
  "hosts": [
    {
      "host": "chart-example.local",
      "paths": [
        {
          "path": "/",
          "pathType": "ImplementationSpecific"
        }
      ]
    }
  ],
  "tls": [
    {
      "hosts": [
        "chart-example.local"
      ],
      "secretName": ""
    }
  ]
}
</pre>
</div>
			</td>
			<td>This block is for setting up the ollama ingress. More information about ingress in general can be found here: https://kubernetes.io/docs/concepts/services-networking/ingress/ To get a better understanding and some more explanation, take a look into the values.yaml provided with the chart. WARNING: You should not expose ollama externally, without an additional layer of protection (e.g. mTLS / OIDC-auth, etc...).</td>
		</tr>
		<tr>
			<td id="ingress--tls[0]--secretName"><a href="./values.yaml#L215">ingress.tls[0].secretName</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td>secretName of the certificate to use. When providing an empty string as secretNmae, the key will be skipped. That allowes to use the default ingress-nginx certificate for this ingress object.</td>
		</tr>
		<tr>
			<td id="libchartCnps"><a href="./values.yaml#L73">libchartCnps</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "deployAndYesIUnderstandAndAccceptTheRisk": false,
  "includeCnpgPolicies": false
}
</pre>
</div>
			</td>
			<td>Enable / Disable the installation of oppinionated CiliumNetworkPolicies. These are provided via dependency chart: libchart-cnps. Therefore you should *really* take a look into that chart and understand what will happen. And review if these are usable within your env.</td>
		</tr>
		<tr>
			<td id="livenessProbe"><a href="./values.yaml#L231">livenessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 3,
  "httpGet": {
    "path": "/",
    "port": "http"
  },
  "initialDelaySeconds": 30,
  "periodSeconds": 10
}
</pre>
</div>
			</td>
			<td>This is to setup the liveness and readiness probes more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/</td>
		</tr>
		<tr>
			<td id="nameOverride"><a href="./values.yaml#L28">nameOverride</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td>This is to override the chart name.</td>
		</tr>
		<tr>
			<td id="nodeSelector"><a href="./values.yaml#L267">nodeSelector</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{}
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="ollama"><a href="./values.yaml#L117">ollama</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "contextLength": "4096",
  "flashAttention": "1",
  "keepAlive": "5m0s",
  "kvCacheType": "q8_0",
  "logLevel": "INFO",
  "maxLoadedModels": "1"
}
</pre>
</div>
			</td>
			<td>This configures the logging level, context length, and keep-alive duration for the Ollama service. These are the default values at the moment.</td>
		</tr>
		<tr>
			<td id="persistence"><a href="./values.yaml#L140">persistence</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "accessModes": [
    "ReadWriteOnce"
  ],
  "cacheDirHomeSizeLimit": "2Mi",
  "cacheDirTmpSizeLimit": "2Mi",
  "emptyDirSizeLimit": "500Mi",
  "enabled": true,
  "size": "50Gi",
  "storageClass": ""
}
</pre>
</div>
			</td>
			<td>This configures the persistens of your release. Note that ollama needs a writeable data directory to store its models, furthermore a writeable home directory to store its temporary files.</td>
		</tr>
		<tr>
			<td id="persistence--accessModes"><a href="./values.yaml#L155">persistence.accessModes</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "ReadWriteOnce"
]
</pre>
</div>
			</td>
			<td>Define the accessModes to use when not providing a already existing PVC claim.</td>
		</tr>
		<tr>
			<td id="persistence--cacheDirHomeSizeLimit"><a href="./values.yaml#L149">persistence.cacheDirHomeSizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"2Mi"
</pre>
</div>
			</td>
			<td>Define the max directory size for the /home directory. We need to use an emptyDir, when require securtyContext.readOnlyRootFilesystem: true.</td>
		</tr>
		<tr>
			<td id="persistence--cacheDirTmpSizeLimit"><a href="./values.yaml#L147">persistence.cacheDirTmpSizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"2Mi"
</pre>
</div>
			</td>
			<td>Define the max directory size for the /tmp directory. We need to use an emptyDir, when require securtyContext.readOnlyRootFilesystem: true.</td>
		</tr>
		<tr>
			<td id="persistence--emptyDirSizeLimit"><a href="./values.yaml#L145">persistence.emptyDirSizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"500Mi"
</pre>
</div>
			</td>
			<td>Define the max directory size when using persistence.enabled: false</td>
		</tr>
		<tr>
			<td id="persistence--enabled"><a href="./values.yaml#L143">persistence.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
true
</pre>
</div>
			</td>
			<td>false -> app uses emptyDir (with persistence.emptyDirSizeLimit) // true -> app uses pvc created by helm. (or existingClaim, if provided). Important: If you're using persistence.enabled: false, you'd loose your stored models as soon as the container restarts.</td>
		</tr>
		<tr>
			<td id="persistence--size"><a href="./values.yaml#L151">persistence.size</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"50Gi"
</pre>
</div>
			</td>
			<td>Define the size of the PV when using persistence.enabled: true</td>
		</tr>
		<tr>
			<td id="persistence--storageClass"><a href="./values.yaml#L153">persistence.storageClass</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td>Define the storageClass to use when not providing a already existing PVC claim. Provide your cluster storageclass or leave it empty to use the default one.</td>
		</tr>
		<tr>
			<td id="podAnnotations"><a href="./values.yaml#L45">podAnnotations</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{}
</pre>
</div>
			</td>
			<td>This is for setting Kubernetes Annotations to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/</td>
		</tr>
		<tr>
			<td id="podLabels"><a href="./values.yaml#L48">podLabels</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{}
</pre>
</div>
			</td>
			<td>This is for setting Kubernetes Labels to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/</td>
		</tr>
		<tr>
			<td id="podSecurityContext"><a href="./values.yaml#L52">podSecurityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "fsGroup": 1000
}
</pre>
</div>
			</td>
			<td>This is for the pod-level security attributes and common container settings. More information: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/</td>
		</tr>
		<tr>
			<td id="prePullModelList"><a href="./values.yaml#L126">prePullModelList</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>This configures the models that ollama should pre-pull while starting the container. Note that this feature will increase the startup time of the container.</td>
		</tr>
		<tr>
			<td id="readinessProbe--failureThreshold"><a href="./values.yaml#L242">readinessProbe.failureThreshold</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="readinessProbe--httpGet--path"><a href="./values.yaml#L240">readinessProbe.httpGet.path</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="readinessProbe--httpGet--port"><a href="./values.yaml#L241">readinessProbe.httpGet.port</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"http"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="readinessProbe--initialDelaySeconds"><a href="./values.yaml#L244">readinessProbe.initialDelaySeconds</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
30
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="readinessProbe--periodSeconds"><a href="./values.yaml#L243">readinessProbe.periodSeconds</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
10
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="replicaCount"><a href="./values.yaml#L6">replicaCount</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
1
</pre>
</div>
			</td>
			<td>This will set the replicaset count more information can be found here: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/</td>
		</tr>
		<tr>
			<td id="resources"><a href="./values.yaml#L218">resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{}
</pre>
</div>
			</td>
			<td>Specify default resources (not recommended, see values.yaml)</td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L110">runtimeClass</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pods": "",
  "tests": ""
}
</pre>
</div>
			</td>
			<td>Set a RuntimeClass to execute the containers with a custom runtime configuration. Register a runtimeClass within your cluster beforehand.

<details>
<summary>Motivation (Expand)</summary>

> The container runtime configuration is used to run a Pod's containers. . . .
> For example, if part of your workload deserves a high level of information security assurance, you might choose to schedule those Pods so that they run in a container runtime that uses hardware virtualization.
> You'd then benefit from the extra isolation of the alternative runtime, at the expense of some additional overhead. . . .

<i>Source and more informations: https://kubernetes.io/docs/concepts/containers/runtime-class/ </i>

</details></td>
		</tr>
		<tr>
			<td id="runtimeClass--pods"><a href="./values.yaml#L112">runtimeClass.pods</a></td>
			<td>
<a href="#stringruntimeclassname" title="Click to get details">string/runtimeClassName</a>
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td>Sets the runtimeClass for the DaemonSet / ReplicaSet pods. Takes the runtimeClass name, or "" (default).</td>
		</tr>
		<tr>
			<td id="runtimeClass--tests"><a href="./values.yaml#L114">runtimeClass.tests</a></td>
			<td>
<a href="#stringruntimeclassname" title="Click to get details">string/runtimeClassName</a>
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td>Sets the runtimeClass for the containers which gets executed by the test hook. Takes the runtimeClass name, or "" (default).</td>
		</tr>
		<tr>
			<td id="securityContext"><a href="./values.yaml#L58">securityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "allowPrivilegeEscalation": false,
  "capabilities": {
    "drop": [
      "ALL"
    ]
  },
  "readOnlyRootFilesystem": true,
  "runAsGroup": 1000,
  "runAsNonRoot": true,
  "runAsUser": 1000,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}
</pre>
</div>
			</td>
			<td>This is for the scurityContext at container level. Note that container settings do not affect the Pod's Volumes. More information: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-container</td>
		</tr>
		<tr>
			<td id="service--port"><a href="./values.yaml#L14">service.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
11434
</pre>
</div>
			</td>
			<td>This sets the ports more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#field-spec-ports</td>
		</tr>
		<tr>
			<td id="service--targetPort"><a href="./values.yaml#L15">service.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
11434
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="service--type"><a href="./values.yaml#L12">service.type</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"ClusterIP"
</pre>
</div>
			</td>
			<td>This sets the service type more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types</td>
		</tr>
		<tr>
			<td id="serviceAccount"><a href="./values.yaml#L32">serviceAccount</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "automount": true,
  "create": true,
  "name": ""
}
</pre>
</div>
			</td>
			<td>This section builds out the service account more information can be found here: https://kubernetes.io/docs/concepts/security/service-accounts/</td>
		</tr>
		<tr>
			<td id="tolerations"><a href="./values.yaml#L269">tolerations</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="volumeMounts"><a href="./values.yaml#L262">volumeMounts</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>Additional volumeMounts on the output Deployment definition.</td>
		</tr>
		<tr>
			<td id="volumes"><a href="./values.yaml#L255">volumes</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>Additional volumes on the output Deployment definition.</td>
		</tr>
	</tbody>
</table>

## Value type details

The chart uses some value types for which I would like to add a further explanation / recommendation:

### string/runtimeClassName

Provide a valid name of a runtimeClass within your cluster.

If you want to get the current available runtimeClasses within your cluster, exec:

```
kubectl get -A runtimeClasses
```

_**Personal recommendation**: A runtime that I believe is worth trying is the Kata Container Runtime.
Take a look at [https://katacontainers.io](https://katacontainers.io) to get an overview about it.
Also take a look at the HowTo-Section within the kata-container GitHub Repository,
e.g. to learn [how to create a runtime class](https://github.com/kata-containers/kata-containers/blob/main/docs/how-to/run-kata-with-k8s.md#create-runtime-class-for-kata-containers)_

## Chart with experimental support for CiliumNetworkPolicies

Please note that this chart does not provide any production ready network policies itself.
Therefore, I recommend the implementation of network policies before using in prod environments.

> **If you're using Cilium CNI**: I've added experimental support for CNPs.
> Note that these are highly oppinionated and you should review them carefully before using.
> E.g. it's required that each release gets deployed within a separate namespace.

## Opinionated & Non-standard

Please note that this chart is highly opinionated and may therefore not be ideal for your environment and/or does not meet the typical standard for helm charts.

Therefore, I'm very happy if you find the chart/s provided here helpful and perhaps even use it in your environment,
but at the same time I strongly advise you to take a close look at it and adapt it to your needs where necessary.

If you would like to return any helpful changes, I would also be happy to receive a pull request or two ;-)

## Feedback & Security

Please reach out to me at frederic.roggon@codeadmin.de for feedback.

If you find security-related issues, please do not use the issue tracker instead, contact me via email.

----------------------------------------------
Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)
