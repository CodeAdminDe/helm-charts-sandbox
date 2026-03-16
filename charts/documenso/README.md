

# documenso

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.8.1](https://img.shields.io/badge/AppVersion-v2.8.1-informational?style=flat-square)

A Helm chart for deploying Documenso on Kubernetes.

**Homepage:** <https://github.com/CodeAdminDe/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Frederic Roggon | <frederic.roggon@codeadmin.de> | <https://github.com/CodeAdminDe> |

## Requirements

Kubernetes: `>=1.24.0`

| Repository | Name | Version |
|------------|------|---------|
| https://codeadminde.github.io/helm-charts | libchart-cnps(libchart-cnps) | 0.2.1 |

## TL;DR

You don't want to read through the docs? That's the quick and dirty way:

```bash
helm repo add codeadminde https://codeadminde.github.io/helm-charts/
helm repo update
helm install documenso codeadminde/documenso
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

To install the chart with the release name `documenso`

```bash
helm install documenso codeadminde/documenso
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

## Uninstallation

To uninstall the chart release named `documenso`

```bash
helm uninstall documenso
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
> helm install documenso codeadminde/documenso -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Then you have to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install documenso --set key=value --set keyTwo=secondValue codeadminde/documenso
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
			<td id="additionalEnvSecrets"><a href="./values.yaml#L255">additionalEnvSecrets</a></td>
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
			<td>Additional environment variables from existing secrets. @description Supports both map and list forms.
```yaml
additionalEnvSecrets:
  CUSTOM_TOKEN: my-secret
  CUSTOM_PASSWORD:
    secretName: my-secret
    secretKey: password

additionalEnvSecrets:
  - name: CUSTOM_TOKEN
    secretName: my-secret
    secretKey: token
```</td>
		</tr>
		<tr>
			<td id="affinity"><a href="./values.yaml#L393">affinity</a></td>
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
			<td>Workload affinity.</td>
		</tr>
		<tr>
			<td id="applyHealthChecks"><a href="./values.yaml#L273">applyHealthChecks</a></td>
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
			<td>Apply health checks from values.</td>
		</tr>
		<tr>
			<td id="applySecurity"><a href="./values.yaml#L270">applySecurity</a></td>
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
			<td>Apply default pod and container security settings.</td>
		</tr>
		<tr>
			<td id="args"><a href="./values.yaml#L235">args</a></td>
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
			<td>Optional args override.</td>
		</tr>
		<tr>
			<td id="autoscaling"><a href="./values.yaml#L341">autoscaling</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "behavior": {
    "scaleDown": {
      "policies": [
        {
          "periodSeconds": 60,
          "type": "Percent",
          "value": 10
        }
      ],
      "stabilizationWindowSeconds": 300
    },
    "scaleUp": {
      "policies": [
        {
          "periodSeconds": 15,
          "type": "Percent",
          "value": 100
        },
        {
          "periodSeconds": 15,
          "type": "Pods",
          "value": 4
        }
      ],
      "selectPolicy": "Max",
      "stabilizationWindowSeconds": 0
    }
  },
  "enableMemoryUtilization": true,
  "enabled": false,
  "maxReplicas": 10,
  "minReplicas": 2,
  "targetCPUUtilizationPercentage": 70,
  "targetMemoryUtilizationPercentage": 80
}
</pre>
</div>
			</td>
			<td>HorizontalPodAutoscaler configuration.</td>
		</tr>
		<tr>
			<td id="autoscaling--behavior"><a href="./values.yaml#L355">autoscaling.behavior</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "scaleDown": {
    "policies": [
      {
        "periodSeconds": 60,
        "type": "Percent",
        "value": 10
      }
    ],
    "stabilizationWindowSeconds": 300
  },
  "scaleUp": {
    "policies": [
      {
        "periodSeconds": 15,
        "type": "Percent",
        "value": 100
      },
      {
        "periodSeconds": 15,
        "type": "Pods",
        "value": 4
      }
    ],
    "selectPolicy": "Max",
    "stabilizationWindowSeconds": 0
  }
}
</pre>
</div>
			</td>
			<td>Optional raw HPA behavior block.</td>
		</tr>
		<tr>
			<td id="autoscaling--enableMemoryUtilization"><a href="./values.yaml#L351">autoscaling.enableMemoryUtilization</a></td>
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
			<td>Enable memory utilization metric.</td>
		</tr>
		<tr>
			<td id="autoscaling--enabled"><a href="./values.yaml#L343">autoscaling.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td>Enable autoscaling.</td>
		</tr>
		<tr>
			<td id="autoscaling--maxReplicas"><a href="./values.yaml#L347">autoscaling.maxReplicas</a></td>
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
			<td>Maximum replicas.</td>
		</tr>
		<tr>
			<td id="autoscaling--minReplicas"><a href="./values.yaml#L345">autoscaling.minReplicas</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
2
</pre>
</div>
			</td>
			<td>Minimum replicas.</td>
		</tr>
		<tr>
			<td id="autoscaling--targetCPUUtilizationPercentage"><a href="./values.yaml#L349">autoscaling.targetCPUUtilizationPercentage</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
70
</pre>
</div>
			</td>
			<td>Target CPU utilization percentage.</td>
		</tr>
		<tr>
			<td id="autoscaling--targetMemoryUtilizationPercentage"><a href="./values.yaml#L353">autoscaling.targetMemoryUtilizationPercentage</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
80
</pre>
</div>
			</td>
			<td>Target memory utilization percentage.</td>
		</tr>
		<tr>
			<td id="cnps"><a href="./values.yaml#L403">cnps</a></td>
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
      "extraRules": [],
      "toEndpoints": [],
      "toEntities": [
        "cluster",
        "world"
      ],
      "toFQDNs": [],
      "toPorts": [
        {
          "port": "80",
          "protocol": "TCP"
        },
        {
          "port": "443",
          "protocol": "TCP"
        }
      ]
    },
    "ingress": {
      "allow": true,
      "fromEndpoints": [],
      "fromEntities": []
    }
  },
  "cnpgTraffic": {
    "instanceExtraEgress": []
  }
}
</pre>
</div>
			</td>
			<td>App-specific Cilium policy settings.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--allow"><a href="./values.yaml#L419">cnps.appTraffic.egress.allow</a></td>
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
			<td>Allow egress traffic from Documenso pods.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--extraRules"><a href="./values.yaml#L437">cnps.appTraffic.egress.extraRules</a></td>
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
			<td>Additional raw Cilium egress rules appended after the chart-managed ones.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toEndpoints"><a href="./values.yaml#L422">cnps.appTraffic.egress.toEndpoints</a></td>
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
			<td>Additional egress endpoint selectors rendered as a dedicated CNP egress rule. @description Accepts either flat label maps or Cilium-style entries with `matchLabels`.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toEntities"><a href="./values.yaml#L426">cnps.appTraffic.egress.toEntities</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "cluster",
  "world"
]
</pre>
</div>
			</td>
			<td>Additional egress entities.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toFQDNs"><a href="./values.yaml#L424">cnps.appTraffic.egress.toFQDNs</a></td>
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
			<td>Additional egress FQDN selectors for external services such as SMTP, S3, or managed PostgreSQL.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toPorts"><a href="./values.yaml#L431">cnps.appTraffic.egress.toPorts</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "port": "80",
    "protocol": "TCP"
  },
  {
    "port": "443",
    "protocol": "TCP"
  }
]
</pre>
</div>
			</td>
			<td>Ports for the user-configured endpoint/FQDN/entity egress rules. @description The chart appends the configured PostgreSQL and SMTP ports automatically.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--allow"><a href="./values.yaml#L411">cnps.appTraffic.ingress.allow</a></td>
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
			<td>Allow ingress traffic to Documenso pods.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEndpoints"><a href="./values.yaml#L414">cnps.appTraffic.ingress.fromEndpoints</a></td>
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
			<td>Additional ingress endpoint selectors. @description Accepts either flat label maps or Cilium-style entries with `matchLabels`.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEntities"><a href="./values.yaml#L416">cnps.appTraffic.ingress.fromEntities</a></td>
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
			<td>Optional allowed ingress entities.</td>
		</tr>
		<tr>
			<td id="cnps--cnpgTraffic"><a href="./values.yaml#L405">cnps.cnpgTraffic</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "instanceExtraEgress": []
}
</pre>
</div>
			</td>
			<td>Additional CNPG Cilium policy tuning used by libchart-cnps when `includeCnpgPolicies=true`.</td>
		</tr>
		<tr>
			<td id="cnps--cnpgTraffic--instanceExtraEgress"><a href="./values.yaml#L407">cnps.cnpgTraffic.instanceExtraEgress</a></td>
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
			<td>Extra egress rules appended to CNPG instance policy set.</td>
		</tr>
		<tr>
			<td id="command"><a href="./values.yaml#L232">command</a></td>
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
			<td>Optional command override.</td>
		</tr>
		<tr>
			<td id="database"><a href="./values.yaml#L171">database</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "externalSecret": {
    "directUrlKey": "NEXT_PRIVATE_DIRECT_DATABASE_URL",
    "name": "documenso-postgresql",
    "urlKey": "NEXT_PRIVATE_DATABASE_URL"
  },
  "port": 5432,
  "useCnpgCluster": {
    "appConnectionSecretName": "",
    "clusterName": "cnpg-cluster",
    "enabled": false,
    "port": 5432,
    "secretKeys": {
      "connectionString": "uri"
    }
  }
}
</pre>
</div>
			</td>
			<td>PostgreSQL connectivity configuration.</td>
		</tr>
		<tr>
			<td id="database--externalSecret--directUrlKey"><a href="./values.yaml#L179">database.externalSecret.directUrlKey</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"NEXT_PRIVATE_DIRECT_DATABASE_URL"
</pre>
</div>
			</td>
			<td>Secret key containing `NEXT_PRIVATE_DIRECT_DATABASE_URL`. Leave empty to reuse `urlKey`.</td>
		</tr>
		<tr>
			<td id="database--externalSecret--name"><a href="./values.yaml#L175">database.externalSecret.name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"documenso-postgresql"
</pre>
</div>
			</td>
			<td>Existing secret name containing the PostgreSQL connection URLs. @description This chart expects `NEXT_PRIVATE_DATABASE_URL` and, optionally, `NEXT_PRIVATE_DIRECT_DATABASE_URL` style secrets. If `directUrlKey` is empty, the chart reuses `urlKey` for both env vars. This reference is ignored when `database.useCnpgCluster.enabled=true`.</td>
		</tr>
		<tr>
			<td id="database--externalSecret--urlKey"><a href="./values.yaml#L177">database.externalSecret.urlKey</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"NEXT_PRIVATE_DATABASE_URL"
</pre>
</div>
			</td>
			<td>Secret key containing `NEXT_PRIVATE_DATABASE_URL`.</td>
		</tr>
		<tr>
			<td id="database--port"><a href="./values.yaml#L181">database.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
5432
</pre>
</div>
			</td>
			<td>PostgreSQL port used for Cilium policy defaults when not using CNPG.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--appConnectionSecretName"><a href="./values.yaml#L190">database.useCnpgCluster.appConnectionSecretName</a></td>
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
			<td>Explicit CNPG app secret name. Defaults to `<clusterName>-app`.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--clusterName"><a href="./values.yaml#L186">database.useCnpgCluster.clusterName</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"cnpg-cluster"
</pre>
</div>
			</td>
			<td>CNPG cluster name. The RW service is derived as `<clusterName>-rw`.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--enabled"><a href="./values.yaml#L184">database.useCnpgCluster.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td>Resolve PostgreSQL credentials from an existing CNPG app secret.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--port"><a href="./values.yaml#L188">database.useCnpgCluster.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
5432
</pre>
</div>
			</td>
			<td>CNPG RW service port.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--secretKeys--connectionString"><a href="./values.yaml#L193">database.useCnpgCluster.secretKeys.connectionString</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"uri"
</pre>
</div>
			</td>
			<td>Key containing the PostgreSQL connection string used for both pooled and direct Documenso URLs.</td>
		</tr>
		<tr>
			<td id="documenso"><a href="./values.yaml#L121">documenso</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "disableSignup": false,
  "internalWebappUrl": "http://localhost:3000",
  "url": ""
}
</pre>
</div>
			</td>
			<td>Core Documenso runtime configuration.</td>
		</tr>
		<tr>
			<td id="documenso--disableSignup"><a href="./values.yaml#L127">documenso.disableSignup</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td>Disable public user signups (`NEXT_PUBLIC_DISABLE_SIGNUP`).</td>
		</tr>
		<tr>
			<td id="documenso--internalWebappUrl"><a href="./values.yaml#L125">documenso.internalWebappUrl</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"http://localhost:3000"
</pre>
</div>
			</td>
			<td>Internal URL Documenso uses to call itself (`NEXT_PRIVATE_INTERNAL_WEBAPP_URL`).</td>
		</tr>
		<tr>
			<td id="documenso--url"><a href="./values.yaml#L123">documenso.url</a></td>
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
			<td>Explicit public URL (`NEXT_PUBLIC_WEBAPP_URL`). When empty, the chart derives it from Gateway API or Ingress when possible and otherwise falls back to `documenso.internalWebappUrl`.</td>
		</tr>
		<tr>
			<td id="envFromConfigMaps"><a href="./values.yaml#L261">envFromConfigMaps</a></td>
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
			<td>Import all keys from listed existing configmaps.</td>
		</tr>
		<tr>
			<td id="envFromSecrets"><a href="./values.yaml#L258">envFromSecrets</a></td>
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
			<td>Import all keys from listed existing secrets.</td>
		</tr>
		<tr>
			<td id="extraEnv"><a href="./values.yaml#L238">extraEnv</a></td>
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
			<td>Additional non-sensitive environment variables.</td>
		</tr>
		<tr>
			<td id="extraVolumeMounts"><a href="./values.yaml#L267">extraVolumeMounts</a></td>
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
			<td>Additional volume mounts.</td>
		</tr>
		<tr>
			<td id="extraVolumes"><a href="./values.yaml#L264">extraVolumes</a></td>
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
			<td>Additional volumes.</td>
		</tr>
		<tr>
			<td id="fullnameOverride"><a href="./values.yaml#L6">fullnameOverride</a></td>
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
			<td id="gatewayApi"><a href="./values.yaml#L81">gatewayApi</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "backendRefs": [],
  "controllerSelector": {
    "app.kubernetes.io/name": "envoy-gateway",
    "io.kubernetes.pod.namespace": "envoy-gateway-system"
  },
  "enabled": false,
  "filters": [],
  "hostnames": [
    "sign.example.com"
  ],
  "labels": {},
  "matches": [
    {
      "path": {
        "type": "PathPrefix",
        "value": "/"
      }
    }
  ],
  "parentRefs": [
    {
      "name": "envoy-gateway",
      "namespace": "envoy-gateway-system",
      "sectionName": "http"
    }
  ],
  "scheme": "https"
}
</pre>
</div>
			</td>
			<td>Gateway API HTTPRoute configuration.</td>
		</tr>
		<tr>
			<td id="gatewayApi--annotations"><a href="./values.yaml#L92">gatewayApi.annotations</a></td>
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
			<td>HTTPRoute annotations.</td>
		</tr>
		<tr>
			<td id="gatewayApi--backendRefs"><a href="./values.yaml#L111">gatewayApi.backendRefs</a></td>
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
			<td>Optional backend references. Defaults to the main Documenso service when empty.</td>
		</tr>
		<tr>
			<td id="gatewayApi--controllerSelector"><a href="./values.yaml#L88">gatewayApi.controllerSelector</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "app.kubernetes.io/name": "envoy-gateway",
  "io.kubernetes.pod.namespace": "envoy-gateway-system"
}
</pre>
</div>
			</td>
			<td>Labels for the Gateway API controller pods, used to generate default CiliumNetworkPolicies ingress rules. If empty, you must provide explicit `cnps.appTraffic.ingress.fromEndpoints` when `gatewayApi.enabled=true`.</td>
		</tr>
		<tr>
			<td id="gatewayApi--enabled"><a href="./values.yaml#L83">gatewayApi.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td>Enable HTTPRoute resource creation.</td>
		</tr>
		<tr>
			<td id="gatewayApi--filters"><a href="./values.yaml#L109">gatewayApi.filters</a></td>
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
			<td>Optional filters for the HTTPRoute rule.</td>
		</tr>
		<tr>
			<td id="gatewayApi--hostnames"><a href="./values.yaml#L101">gatewayApi.hostnames</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "sign.example.com"
]
</pre>
</div>
			</td>
			<td>Hostnames served by this route.</td>
		</tr>
		<tr>
			<td id="gatewayApi--labels"><a href="./values.yaml#L94">gatewayApi.labels</a></td>
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
			<td>HTTPRoute labels.</td>
		</tr>
		<tr>
			<td id="gatewayApi--matches"><a href="./values.yaml#L104">gatewayApi.matches</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "path": {
      "type": "PathPrefix",
      "value": "/"
    }
  }
]
</pre>
</div>
			</td>
			<td>Match rules for the default HTTPRoute rule.</td>
		</tr>
		<tr>
			<td id="gatewayApi--parentRefs"><a href="./values.yaml#L96">gatewayApi.parentRefs</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "name": "envoy-gateway",
    "namespace": "envoy-gateway-system",
    "sectionName": "http"
  }
]
</pre>
</div>
			</td>
			<td>ParentRefs for the HTTPRoute.</td>
		</tr>
		<tr>
			<td id="gatewayApi--scheme"><a href="./values.yaml#L85">gatewayApi.scheme</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"https"
</pre>
</div>
			</td>
			<td>Public URL scheme used when deriving `documenso.url` from Gateway API.</td>
		</tr>
		<tr>
			<td id="image"><a href="./values.yaml#L9">image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "documenso/documenso",
  "tag": ""
}
</pre>
</div>
			</td>
			<td>Container image configuration.</td>
		</tr>
		<tr>
			<td id="image--pullPolicy"><a href="./values.yaml#L13">image.pullPolicy</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"IfNotPresent"
</pre>
</div>
			</td>
			<td>Image pull policy.</td>
		</tr>
		<tr>
			<td id="image--repository"><a href="./values.yaml#L11">image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"documenso/documenso"
</pre>
</div>
			</td>
			<td>Image repository.</td>
		</tr>
		<tr>
			<td id="image--tag"><a href="./values.yaml#L15">image.tag</a></td>
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
			<td>Image tag override (defaults to `.Chart.AppVersion` when empty).</td>
		</tr>
		<tr>
			<td id="imagePullSecrets"><a href="./values.yaml#L18">imagePullSecrets</a></td>
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
			<td>Image pull secrets for private registries.</td>
		</tr>
		<tr>
			<td id="ingress"><a href="./values.yaml#L56">ingress</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "className": "",
  "enabled": false,
  "hosts": [
    {
      "host": "sign.example.com",
      "paths": [
        {
          "path": "/",
          "pathType": "Prefix"
        }
      ]
    }
  ],
  "secureDefaults": {
    "annotations": {
      "nginx.ingress.kubernetes.io/proxy-body-size": "50m",
      "nginx.ingress.kubernetes.io/proxy-read-timeout": "300",
      "nginx.ingress.kubernetes.io/proxy-send-timeout": "300"
    },
    "enabled": true
  },
  "tls": []
}
</pre>
</div>
			</td>
			<td>Ingress configuration (ingress-nginx style).</td>
		</tr>
		<tr>
			<td id="ingress--annotations"><a href="./values.yaml#L62">ingress.annotations</a></td>
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
			<td>Additional ingress annotations.</td>
		</tr>
		<tr>
			<td id="ingress--className"><a href="./values.yaml#L60">ingress.className</a></td>
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
			<td>Ingress class name.</td>
		</tr>
		<tr>
			<td id="ingress--enabled"><a href="./values.yaml#L58">ingress.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td>Enable ingress resource creation.</td>
		</tr>
		<tr>
			<td id="ingress--hosts"><a href="./values.yaml#L72">ingress.hosts</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "host": "sign.example.com",
    "paths": [
      {
        "path": "/",
        "pathType": "Prefix"
      }
    ]
  }
]
</pre>
</div>
			</td>
			<td>Host/path rules.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults"><a href="./values.yaml#L64">ingress.secureDefaults</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {
    "nginx.ingress.kubernetes.io/proxy-body-size": "50m",
    "nginx.ingress.kubernetes.io/proxy-read-timeout": "300",
    "nginx.ingress.kubernetes.io/proxy-send-timeout": "300"
  },
  "enabled": true
}
</pre>
</div>
			</td>
			<td>Secure default ingress annotations for uploads and long-running requests.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--enabled"><a href="./values.yaml#L66">ingress.secureDefaults.enabled</a></td>
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
			<td>Enable secure default ingress annotations.</td>
		</tr>
		<tr>
			<td id="ingress--tls"><a href="./values.yaml#L78">ingress.tls</a></td>
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
			<td>TLS host/secret blocks.</td>
		</tr>
		<tr>
			<td id="libchartCnps"><a href="./values.yaml#L396">libchartCnps</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "includeCnpgPolicies": false
}
</pre>
</div>
			</td>
			<td>Cilium policy library toggle.</td>
		</tr>
		<tr>
			<td id="libchartCnps--enabled"><a href="./values.yaml#L398">libchartCnps.enabled</a></td>
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
			<td>Enable `libchart-cnps` templates.</td>
		</tr>
		<tr>
			<td id="libchartCnps--includeCnpgPolicies"><a href="./values.yaml#L400">libchartCnps.includeCnpgPolicies</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td>Include CNPG policy set from the library.</td>
		</tr>
		<tr>
			<td id="livenessProbe"><a href="./values.yaml#L311">livenessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 3,
  "httpGet": {
    "path": "/api/health",
    "port": "http"
  },
  "initialDelaySeconds": 30,
  "periodSeconds": 10,
  "timeoutSeconds": 5
}
</pre>
</div>
			</td>
			<td>Liveness probe.</td>
		</tr>
		<tr>
			<td id="nameOverride"><a href="./values.yaml#L5">nameOverride</a></td>
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
			<td>Override release-based naming.</td>
		</tr>
		<tr>
			<td id="nodeSelector"><a href="./values.yaml#L387">nodeSelector</a></td>
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
			<td>Workload node selector.</td>
		</tr>
		<tr>
			<td id="podAnnotations"><a href="./values.yaml#L381">podAnnotations</a></td>
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
			<td>Pod annotations.</td>
		</tr>
		<tr>
			<td id="podDisruptionBudget"><a href="./values.yaml#L374">podDisruptionBudget</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "minAvailable": 1
}
</pre>
</div>
			</td>
			<td>PodDisruptionBudget configuration.</td>
		</tr>
		<tr>
			<td id="podDisruptionBudget--enabled"><a href="./values.yaml#L376">podDisruptionBudget.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td>Enable a PodDisruptionBudget.</td>
		</tr>
		<tr>
			<td id="podDisruptionBudget--minAvailable"><a href="./values.yaml#L378">podDisruptionBudget.minAvailable</a></td>
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
			<td>Minimum number of available pods.</td>
		</tr>
		<tr>
			<td id="podLabels"><a href="./values.yaml#L384">podLabels</a></td>
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
			<td>Pod labels.</td>
		</tr>
		<tr>
			<td id="podSecurityContext"><a href="./values.yaml#L276">podSecurityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "fsGroup": 1001
}
</pre>
</div>
			</td>
			<td>Pod-level security context for Documenso pods.</td>
		</tr>
		<tr>
			<td id="rbac"><a href="./values.yaml#L32">rbac</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "create": false,
  "namespace": "",
  "rules": []
}
</pre>
</div>
			</td>
			<td>Optional namespace-scoped RBAC configuration.</td>
		</tr>
		<tr>
			<td id="rbac--create"><a href="./values.yaml#L34">rbac.create</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td>Create Role and RoleBinding.</td>
		</tr>
		<tr>
			<td id="rbac--namespace"><a href="./values.yaml#L36">rbac.namespace</a></td>
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
			<td>Namespace override for Role and RoleBinding resources. The ServiceAccount remains in the release namespace.</td>
		</tr>
		<tr>
			<td id="rbac--rules"><a href="./values.yaml#L38">rbac.rules</a></td>
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
			<td>Explicit RBAC rules required when `rbac.create=true`.</td>
		</tr>
		<tr>
			<td id="readinessProbe"><a href="./values.yaml#L321">readinessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 3,
  "httpGet": {
    "path": "/api/health",
    "port": "http"
  },
  "initialDelaySeconds": 10,
  "periodSeconds": 5,
  "timeoutSeconds": 3
}
</pre>
</div>
			</td>
			<td>Readiness probe.</td>
		</tr>
		<tr>
			<td id="replicaCount"><a href="./values.yaml#L2">replicaCount</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
2
</pre>
</div>
			</td>
			<td>Number of Documenso application pod replicas.</td>
		</tr>
		<tr>
			<td id="resources"><a href="./values.yaml#L302">resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "cpu": "1000m",
    "memory": "1Gi"
  },
  "requests": {
    "cpu": "250m",
    "memory": "512Mi"
  }
}
</pre>
</div>
			</td>
			<td>Resource requests and limits.</td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L114">runtimeClass</a></td>
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
			<td>RuntimeClass names.</td>
		</tr>
		<tr>
			<td id="runtimeClass--pods"><a href="./values.yaml#L116">runtimeClass.pods</a></td>
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
			<td>RuntimeClass for deployment pods.</td>
		</tr>
		<tr>
			<td id="runtimeClass--tests"><a href="./values.yaml#L118">runtimeClass.tests</a></td>
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
			<td>RuntimeClass for Helm test pods.</td>
		</tr>
		<tr>
			<td id="securityContext"><a href="./values.yaml#L280">securityContext</a></td>
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
  "runAsGroup": 1001,
  "runAsNonRoot": true,
  "runAsUser": 1001,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}
</pre>
</div>
			</td>
			<td>Container-level security context for the Documenso container.</td>
		</tr>
		<tr>
			<td id="securitySecrets"><a href="./values.yaml#L130">securitySecrets</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "create": true,
  "existingSecret": "",
  "keys": {
    "encryptionKey": "NEXT_PRIVATE_ENCRYPTION_KEY",
    "encryptionSecondaryKey": "NEXT_PRIVATE_ENCRYPTION_SECONDARY_KEY",
    "nextAuthSecret": "NEXTAUTH_SECRET"
  },
  "name": ""
}
</pre>
</div>
			</td>
			<td>Generated application secrets used by Documenso.</td>
		</tr>
		<tr>
			<td id="securitySecrets--create"><a href="./values.yaml#L132">securitySecrets.create</a></td>
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
			<td>Create a chart-managed Secret for `NEXTAUTH_SECRET` and the encryption keys.</td>
		</tr>
		<tr>
			<td id="securitySecrets--existingSecret"><a href="./values.yaml#L134">securitySecrets.existingSecret</a></td>
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
			<td>Existing secret name to use when `create=false`.</td>
		</tr>
		<tr>
			<td id="securitySecrets--keys--encryptionKey"><a href="./values.yaml#L141">securitySecrets.keys.encryptionKey</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"NEXT_PRIVATE_ENCRYPTION_KEY"
</pre>
</div>
			</td>
			<td>Key name for `NEXT_PRIVATE_ENCRYPTION_KEY`.</td>
		</tr>
		<tr>
			<td id="securitySecrets--keys--encryptionSecondaryKey"><a href="./values.yaml#L143">securitySecrets.keys.encryptionSecondaryKey</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"NEXT_PRIVATE_ENCRYPTION_SECONDARY_KEY"
</pre>
</div>
			</td>
			<td>Key name for `NEXT_PRIVATE_ENCRYPTION_SECONDARY_KEY`.</td>
		</tr>
		<tr>
			<td id="securitySecrets--keys--nextAuthSecret"><a href="./values.yaml#L139">securitySecrets.keys.nextAuthSecret</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"NEXTAUTH_SECRET"
</pre>
</div>
			</td>
			<td>Key name for `NEXTAUTH_SECRET`.</td>
		</tr>
		<tr>
			<td id="securitySecrets--name"><a href="./values.yaml#L136">securitySecrets.name</a></td>
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
			<td>Secret name override when `create=true`.</td>
		</tr>
		<tr>
			<td id="service"><a href="./values.yaml#L41">service</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "labels": {},
  "port": 80,
  "targetPort": 3000,
  "targetProtocol": "TCP",
  "type": "ClusterIP"
}
</pre>
</div>
			</td>
			<td>Kubernetes Service configuration.</td>
		</tr>
		<tr>
			<td id="service--annotations"><a href="./values.yaml#L45">service.annotations</a></td>
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
			<td>Service annotations.</td>
		</tr>
		<tr>
			<td id="service--labels"><a href="./values.yaml#L47">service.labels</a></td>
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
			<td>Service labels.</td>
		</tr>
		<tr>
			<td id="service--port"><a href="./values.yaml#L49">service.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
80
</pre>
</div>
			</td>
			<td>Service port exposed to the cluster.</td>
		</tr>
		<tr>
			<td id="service--targetPort"><a href="./values.yaml#L51">service.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3000
</pre>
</div>
			</td>
			<td>Container target port used by Documenso.</td>
		</tr>
		<tr>
			<td id="service--targetProtocol"><a href="./values.yaml#L53">service.targetProtocol</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"TCP"
</pre>
</div>
			</td>
			<td>Service protocol.</td>
		</tr>
		<tr>
			<td id="service--type"><a href="./values.yaml#L43">service.type</a></td>
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
			<td>Service type. This chart enforces `ClusterIP`.</td>
		</tr>
		<tr>
			<td id="serviceAccount"><a href="./values.yaml#L21">serviceAccount</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "automountServiceAccountToken": false,
  "create": true,
  "name": ""
}
</pre>
</div>
			</td>
			<td>Service account configuration.</td>
		</tr>
		<tr>
			<td id="serviceAccount--annotations"><a href="./values.yaml#L25">serviceAccount.annotations</a></td>
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
			<td>ServiceAccount annotations.</td>
		</tr>
		<tr>
			<td id="serviceAccount--automountServiceAccountToken"><a href="./values.yaml#L29">serviceAccount.automountServiceAccountToken</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td>Automount the ServiceAccount token.</td>
		</tr>
		<tr>
			<td id="serviceAccount--create"><a href="./values.yaml#L23">serviceAccount.create</a></td>
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
			<td>Create a dedicated ServiceAccount.</td>
		</tr>
		<tr>
			<td id="serviceAccount--name"><a href="./values.yaml#L27">serviceAccount.name</a></td>
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
			<td>ServiceAccount name override.</td>
		</tr>
		<tr>
			<td id="signing"><a href="./values.yaml#L196">signing</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "certificateSecret": {
    "key": "cert.p12",
    "name": ""
  },
  "localFilePath": "/opt/documenso/cert.p12",
  "passphraseSecret": {
    "key": "NEXT_PRIVATE_SIGNING_PASSPHRASE",
    "name": ""
  }
}
</pre>
</div>
			</td>
			<td>Signing certificate configuration.</td>
		</tr>
		<tr>
			<td id="signing--certificateSecret--key"><a href="./values.yaml#L204">signing.certificateSecret.key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"cert.p12"
</pre>
</div>
			</td>
			<td>Secret key containing the certificate file bytes.</td>
		</tr>
		<tr>
			<td id="signing--certificateSecret--name"><a href="./values.yaml#L202">signing.certificateSecret.name</a></td>
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
			<td>Existing secret name containing the `.p12` signing certificate. @description If left empty, Documenso still starts, but document signing remains unavailable.</td>
		</tr>
		<tr>
			<td id="signing--localFilePath"><a href="./values.yaml#L198">signing.localFilePath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/opt/documenso/cert.p12"
</pre>
</div>
			</td>
			<td>Path used inside the container for the signing certificate (`NEXT_PRIVATE_SIGNING_LOCAL_FILE_PATH`).</td>
		</tr>
		<tr>
			<td id="signing--passphraseSecret--key"><a href="./values.yaml#L209">signing.passphraseSecret.key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"NEXT_PRIVATE_SIGNING_PASSPHRASE"
</pre>
</div>
			</td>
			<td>Secret key containing the signing passphrase.</td>
		</tr>
		<tr>
			<td id="signing--passphraseSecret--name"><a href="./values.yaml#L207">signing.passphraseSecret.name</a></td>
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
			<td>Existing secret name containing `NEXT_PRIVATE_SIGNING_PASSPHRASE`.</td>
		</tr>
		<tr>
			<td id="smtp"><a href="./values.yaml#L146">smtp</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "credentialsSecret": {
    "name": "documenso-smtp",
    "passwordKey": "NEXT_PRIVATE_SMTP_PASSWORD",
    "usernameKey": "NEXT_PRIVATE_SMTP_USERNAME"
  },
  "fromAddress": "noreply@example.com",
  "fromName": "Documenso",
  "host": "smtp.example.com",
  "port": 587,
  "secure": false,
  "transport": "smtp-auth"
}
</pre>
</div>
			</td>
			<td>SMTP configuration for Documenso email delivery.</td>
		</tr>
		<tr>
			<td id="smtp--credentialsSecret--name"><a href="./values.yaml#L164">smtp.credentialsSecret.name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"documenso-smtp"
</pre>
</div>
			</td>
			<td>Existing secret name containing SMTP credentials.</td>
		</tr>
		<tr>
			<td id="smtp--credentialsSecret--passwordKey"><a href="./values.yaml#L168">smtp.credentialsSecret.passwordKey</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"NEXT_PRIVATE_SMTP_PASSWORD"
</pre>
</div>
			</td>
			<td>Secret key containing `NEXT_PRIVATE_SMTP_PASSWORD`.</td>
		</tr>
		<tr>
			<td id="smtp--credentialsSecret--usernameKey"><a href="./values.yaml#L166">smtp.credentialsSecret.usernameKey</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"NEXT_PRIVATE_SMTP_USERNAME"
</pre>
</div>
			</td>
			<td>Secret key containing `NEXT_PRIVATE_SMTP_USERNAME`.</td>
		</tr>
		<tr>
			<td id="smtp--fromAddress"><a href="./values.yaml#L161">smtp.fromAddress</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"noreply@example.com"
</pre>
</div>
			</td>
			<td>Sender address (`NEXT_PRIVATE_SMTP_FROM_ADDRESS`). @description Replace `noreply@example.com` with the real sender address your SMTP provider accepts for Documenso mail delivery.</td>
		</tr>
		<tr>
			<td id="smtp--fromName"><a href="./values.yaml#L158">smtp.fromName</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"Documenso"
</pre>
</div>
			</td>
			<td>Sender name (`NEXT_PRIVATE_SMTP_FROM_NAME`).</td>
		</tr>
		<tr>
			<td id="smtp--host"><a href="./values.yaml#L152">smtp.host</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"smtp.example.com"
</pre>
</div>
			</td>
			<td>SMTP host (`NEXT_PRIVATE_SMTP_HOST`). @description Replace `smtp.example.com` with your real SMTP server hostname. SMTP credentials are sourced from `smtp.credentialsSecret.name` using `smtp.credentialsSecret.usernameKey` and `smtp.credentialsSecret.passwordKey`.</td>
		</tr>
		<tr>
			<td id="smtp--port"><a href="./values.yaml#L154">smtp.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
587
</pre>
</div>
			</td>
			<td>SMTP port (`NEXT_PRIVATE_SMTP_PORT`).</td>
		</tr>
		<tr>
			<td id="smtp--secure"><a href="./values.yaml#L156">smtp.secure</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td>Force TLS for SMTP (`NEXT_PRIVATE_SMTP_SECURE`).</td>
		</tr>
		<tr>
			<td id="smtp--transport"><a href="./values.yaml#L149">smtp.transport</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"smtp-auth"
</pre>
</div>
			</td>
			<td>SMTP transport (`NEXT_PRIVATE_SMTP_TRANSPORT`). @description Supported values documented by Documenso include `smtp-auth`, `smtp-api`, `resend`, and `mailchannels`.</td>
		</tr>
		<tr>
			<td id="startupProbe"><a href="./values.yaml#L331">startupProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 30,
  "httpGet": {
    "path": "/api/health",
    "port": "http"
  },
  "initialDelaySeconds": 10,
  "periodSeconds": 5,
  "timeoutSeconds": 3
}
</pre>
</div>
			</td>
			<td>Startup probe.</td>
		</tr>
		<tr>
			<td id="storage"><a href="./values.yaml#L212">storage</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "s3": {
    "bucket": "",
    "credentialsSecret": {
      "accessKeyIdKey": "NEXT_PRIVATE_UPLOAD_ACCESS_KEY_ID",
      "name": "",
      "secretAccessKeyKey": "NEXT_PRIVATE_UPLOAD_SECRET_ACCESS_KEY"
    },
    "endpoint": "",
    "region": ""
  },
  "transport": "database"
}
</pre>
</div>
			</td>
			<td>Document upload storage configuration.</td>
		</tr>
		<tr>
			<td id="storage--s3--bucket"><a href="./values.yaml#L222">storage.s3.bucket</a></td>
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
			<td>S3 bucket (`NEXT_PRIVATE_UPLOAD_BUCKET`).</td>
		</tr>
		<tr>
			<td id="storage--s3--credentialsSecret--accessKeyIdKey"><a href="./values.yaml#L227">storage.s3.credentialsSecret.accessKeyIdKey</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"NEXT_PRIVATE_UPLOAD_ACCESS_KEY_ID"
</pre>
</div>
			</td>
			<td>Secret key containing `NEXT_PRIVATE_UPLOAD_ACCESS_KEY_ID`.</td>
		</tr>
		<tr>
			<td id="storage--s3--credentialsSecret--name"><a href="./values.yaml#L225">storage.s3.credentialsSecret.name</a></td>
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
			<td>Existing secret name containing S3 credentials.</td>
		</tr>
		<tr>
			<td id="storage--s3--credentialsSecret--secretAccessKeyKey"><a href="./values.yaml#L229">storage.s3.credentialsSecret.secretAccessKeyKey</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"NEXT_PRIVATE_UPLOAD_SECRET_ACCESS_KEY"
</pre>
</div>
			</td>
			<td>Secret key containing `NEXT_PRIVATE_UPLOAD_SECRET_ACCESS_KEY`.</td>
		</tr>
		<tr>
			<td id="storage--s3--endpoint"><a href="./values.yaml#L218">storage.s3.endpoint</a></td>
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
			<td>S3 endpoint (`NEXT_PRIVATE_UPLOAD_ENDPOINT`).</td>
		</tr>
		<tr>
			<td id="storage--s3--region"><a href="./values.yaml#L220">storage.s3.region</a></td>
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
			<td>S3 region (`NEXT_PRIVATE_UPLOAD_REGION`).</td>
		</tr>
		<tr>
			<td id="storage--transport"><a href="./values.yaml#L215">storage.transport</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"database"
</pre>
</div>
			</td>
			<td>Upload transport (`NEXT_PUBLIC_UPLOAD_TRANSPORT`). @description Supported values in the official docs are `database` and `s3`.</td>
		</tr>
		<tr>
			<td id="tmpVolume"><a href="./values.yaml#L293">tmpVolume</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "mountPath": "/tmp",
  "sizeLimit": "1Gi"
}
</pre>
</div>
			</td>
			<td>Optional writable `/tmp` mount for read-only root filesystem mode.</td>
		</tr>
		<tr>
			<td id="tmpVolume--enabled"><a href="./values.yaml#L295">tmpVolume.enabled</a></td>
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
			<td>Mount writable `emptyDir` at `/tmp`.</td>
		</tr>
		<tr>
			<td id="tmpVolume--mountPath"><a href="./values.yaml#L297">tmpVolume.mountPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/tmp"
</pre>
</div>
			</td>
			<td>Mount path inside the container.</td>
		</tr>
		<tr>
			<td id="tmpVolume--sizeLimit"><a href="./values.yaml#L299">tmpVolume.sizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"1Gi"
</pre>
</div>
			</td>
			<td>Optional size limit.</td>
		</tr>
		<tr>
			<td id="tolerations"><a href="./values.yaml#L390">tolerations</a></td>
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
			<td>Workload tolerations.</td>
		</tr>
	</tbody>
</table>

## Value type details

The chart uses some value types for which I would like to add a further explanation / recommendation:

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
<hr /><hr />

## Appendix - Chart-specifics

### Scope and runtime model

* This chart deploys the official `documenso/documenso` image and keeps the runtime stateless by default.
* The application requires PostgreSQL and SMTP configuration. This chart can source PostgreSQL URLs either from an existing Secret or from an existing CNPG app Secret.
* The signing certificate is optional at chart level because the official Documenso startup flow continues without it, but document-signing features stay unavailable until you mount a valid certificate and passphrase.

### Secrets and GitOps behavior

* `securitySecrets.create=true` generates and preserves `NEXTAUTH_SECRET`, `NEXT_PRIVATE_ENCRYPTION_KEY`, and `NEXT_PRIVATE_ENCRYPTION_SECONDARY_KEY`.
* SMTP credentials, database URLs, signing material, and optional S3 credentials are always sourced from existing Secrets so sensitive values stay out of `values.yaml`.
* Changes to externally managed Secrets are only consumed through environment variables at container start. Secret reconciliation alone will not refresh running pods, so trigger a rollout/restart or use a secret-reloader pattern when those values change.

### Exposure model

* The Service stays `ClusterIP` only.
* North-south traffic is exposed through either `Ingress` or `HTTPRoute`.
* The `gatewayApi` values are wired for Envoy Gateway by default via `gatewayApi.controllerSelector`, while still allowing other Gateway API controllers through explicit selector overrides.
* `documenso.url` can be set explicitly. If left empty, the chart derives the public URL from Gateway API or Ingress where possible and otherwise falls back to `documenso.internalWebappUrl`.
* The default ingress annotations follow the upstream Documenso Kubernetes guide for uploads and long-running requests.

### Storage and uploads

* `storage.transport=database` keeps uploaded content in PostgreSQL and requires no extra storage setup.
* `storage.transport=s3` enables the upstream S3-compatible upload path and expects endpoint, region, bucket, and credentials to be provided explicitly.
* `database.useCnpgCluster.enabled=true` switches the application to an existing CNPG app Secret and takes precedence over the `database.externalSecret` reference so CNPG-enabled installs do not need to clear the external Secret placeholder first.
* Additional Documenso env flags that are not modeled directly by the chart can be added via `extraEnv`, `additionalEnvSecrets`, `envFromSecrets`, or `envFromConfigMaps`, subject to the reserved env validation rules.

### Security defaults

* The main workload defaults to `runAsNonRoot`, numeric UID/GID `1001`, dropped Linux capabilities, `RuntimeDefault` seccomp, and `readOnlyRootFilesystem=true`.
* A writable `/tmp` `emptyDir` is mounted by default because the hardened container still needs a small writable scratch area.
* `libchartCnps.enabled=true` is supported out of the box. Default policy generation includes ingress-nginx or Gateway-controller source selectors when those exposure modes are enabled.
* PostgreSQL and SMTP ports are appended automatically to the app egress ports. Additional external egress can be declared via `cnps.appTraffic.egress.toEntities`, `toEndpoints`, `toFQDNs`, or raw `extraRules`.
