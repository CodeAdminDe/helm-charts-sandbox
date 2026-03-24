

# anything-llm

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.11.2](https://img.shields.io/badge/AppVersion-1.11.2-informational?style=flat-square)

A Helm chart for deploying AnythingLLM on Kubernetes.

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
helm install anything-llm codeadminde/anything-llm
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

To install the chart with the release name `anything-llm`

```bash
helm install anything-llm codeadminde/anything-llm
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

## Uninstallation

To uninstall the chart release named `anything-llm`

```bash
helm uninstall anything-llm
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
> helm install anything-llm codeadminde/anything-llm -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Then you have to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install anything-llm --set key=value --set keyTwo=secondValue codeadminde/anything-llm
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
			<td id="additionalEnvSecrets"><a href="./values.yaml#L280">additionalEnvSecrets</a></td>
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
			<td>Additional env vars from existing secrets. @description Supports both map and list forms.
```yaml
additionalEnvSecrets:
  TOKEN: my-secret
  PASSWORD:
    secretName: my-secret
    secretKey: password

additionalEnvSecrets:
  - name: TOKEN
    secretName: my-secret
    secretKey: token
```</td>
		</tr>
		<tr>
			<td id="affinity"><a href="./values.yaml#L381">affinity</a></td>
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
			<td id="anythingllm"><a href="./values.yaml#L159">anythingllm</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "chromiumArgs": "",
  "collectorAllowAnyIp": false,
  "disableSwaggerDocs": true,
  "disableTelemetry": true,
  "nodeEnv": "production",
  "security": {
    "enableSysAdminCapability": false
  },
  "storageDir": "/app/server/storage",
  "ttsProvider": "native",
  "vectorDb": "lancedb",
  "whisperProvider": "local"
}
</pre>
</div>
			</td>
			<td>AnythingLLM runtime options.</td>
		</tr>
		<tr>
			<td id="anythingllm--chromiumArgs"><a href="./values.yaml#L174">anythingllm.chromiumArgs</a></td>
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
			<td>Optional Chromium runtime flags (`ANYTHINGLLM_CHROMIUM_ARGS`). @description Use this when running without SYS_ADMIN and you still need web-scraping functionality.</td>
		</tr>
		<tr>
			<td id="anythingllm--collectorAllowAnyIp"><a href="./values.yaml#L178">anythingllm.collectorAllowAnyIp</a></td>
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
			<td>Optional local-IP scraping override (`COLLECTOR_ALLOW_ANY_IP`).</td>
		</tr>
		<tr>
			<td id="anythingllm--disableSwaggerDocs"><a href="./values.yaml#L176">anythingllm.disableSwaggerDocs</a></td>
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
			<td>Disable Swagger docs endpoint (`DISABLE_SWAGGER_DOCS`).</td>
		</tr>
		<tr>
			<td id="anythingllm--disableTelemetry"><a href="./values.yaml#L165">anythingllm.disableTelemetry</a></td>
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
			<td>Disable telemetry (`DISABLE_TELEMETRY`).</td>
		</tr>
		<tr>
			<td id="anythingllm--nodeEnv"><a href="./values.yaml#L163">anythingllm.nodeEnv</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"production"
</pre>
</div>
			</td>
			<td>Node environment (`NODE_ENV`).</td>
		</tr>
		<tr>
			<td id="anythingllm--security"><a href="./values.yaml#L180">anythingllm.security</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enableSysAdminCapability": false
}
</pre>
</div>
			</td>
			<td>Security-related runtime toggles.</td>
		</tr>
		<tr>
			<td id="anythingllm--security--enableSysAdminCapability"><a href="./values.yaml#L183">anythingllm.security.enableSysAdminCapability</a></td>
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
			<td>Add `SYS_ADMIN` capability for Chromium sandbox-based scraping. @description Keep disabled by default. Enable only if you explicitly need scraper behavior that requires this capability.</td>
		</tr>
		<tr>
			<td id="anythingllm--storageDir"><a href="./values.yaml#L161">anythingllm.storageDir</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/app/server/storage"
</pre>
</div>
			</td>
			<td>Storage directory (`STORAGE_DIR`). Must match `persistence.mountPath`.</td>
		</tr>
		<tr>
			<td id="anythingllm--ttsProvider"><a href="./values.yaml#L171">anythingllm.ttsProvider</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"native"
</pre>
</div>
			</td>
			<td>Text-to-speech provider (`TTS_PROVIDER`).</td>
		</tr>
		<tr>
			<td id="anythingllm--vectorDb"><a href="./values.yaml#L167">anythingllm.vectorDb</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"lancedb"
</pre>
</div>
			</td>
			<td>Vector backend (`VECTOR_DB`).</td>
		</tr>
		<tr>
			<td id="anythingllm--whisperProvider"><a href="./values.yaml#L169">anythingllm.whisperProvider</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"local"
</pre>
</div>
			</td>
			<td>Whisper provider (`WHISPER_PROVIDER`).</td>
		</tr>
		<tr>
			<td id="applyHealthChecks"><a href="./values.yaml#L295">applyHealthChecks</a></td>
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
			<td>Enable liveness/readiness/startup probes.</td>
		</tr>
		<tr>
			<td id="args"><a href="./values.yaml#L260">args</a></td>
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
			<td id="auth"><a href="./values.yaml#L204">auth</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false
}
</pre>
</div>
			</td>
			<td>Authentication options.</td>
		</tr>
		<tr>
			<td id="auth--enabled"><a href="./values.yaml#L206">auth.enabled</a></td>
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
			<td>Enable auth token protection (`AUTH_TOKEN`) for remote/cloud exposure.</td>
		</tr>
		<tr>
			<td id="autoscaling"><a href="./values.yaml#L354">autoscaling</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enableMemoryUtilization": false,
  "enabled": false,
  "maxReplicas": 3,
  "minReplicas": 1,
  "targetCPUUtilizationPercentage": 80,
  "targetMemoryUtilizationPercentage": 80
}
</pre>
</div>
			</td>
			<td>HorizontalPodAutoscaler configuration.</td>
		</tr>
		<tr>
			<td id="autoscaling--enableMemoryUtilization"><a href="./values.yaml#L364">autoscaling.enableMemoryUtilization</a></td>
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
			<td>Enable memory utilization metric.</td>
		</tr>
		<tr>
			<td id="autoscaling--enabled"><a href="./values.yaml#L356">autoscaling.enabled</a></td>
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
			<td id="autoscaling--maxReplicas"><a href="./values.yaml#L360">autoscaling.maxReplicas</a></td>
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
			<td>Maximum replicas.</td>
		</tr>
		<tr>
			<td id="autoscaling--minReplicas"><a href="./values.yaml#L358">autoscaling.minReplicas</a></td>
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
			<td>Minimum replicas.</td>
		</tr>
		<tr>
			<td id="autoscaling--targetCPUUtilizationPercentage"><a href="./values.yaml#L362">autoscaling.targetCPUUtilizationPercentage</a></td>
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
			<td>Target CPU utilization percentage.</td>
		</tr>
		<tr>
			<td id="autoscaling--targetMemoryUtilizationPercentage"><a href="./values.yaml#L366">autoscaling.targetMemoryUtilizationPercentage</a></td>
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
			<td id="cnps"><a href="./values.yaml#L391">cnps</a></td>
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
      "toEntities": [
        "cluster",
        "world"
      ],
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
			<td id="cnps--appTraffic--egress--allow"><a href="./values.yaml#L407">cnps.appTraffic.egress.allow</a></td>
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
			<td>Allow egress traffic from app pods.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toEntities"><a href="./values.yaml#L409">cnps.appTraffic.egress.toEntities</a></td>
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
			<td>Optional destination entities.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toPorts"><a href="./values.yaml#L414">cnps.appTraffic.egress.toPorts</a></td>
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
			<td>DNS (53/UDP) is already covered by the namespace-wide libchart policy.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--allow"><a href="./values.yaml#L399">cnps.appTraffic.ingress.allow</a></td>
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
			<td>Allow ingress traffic to app pods.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEndpoints"><a href="./values.yaml#L402">cnps.appTraffic.ingress.fromEndpoints</a></td>
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
			<td>Allowed ingress endpoint label sets. @description Leave empty to use conditional defaults from template logic: ingress-nginx labels when ingress.enabled=true, gatewayApi.controllerSelector labels when gatewayApi.enabled=true, or both when both are enabled.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEntities"><a href="./values.yaml#L404">cnps.appTraffic.ingress.fromEntities</a></td>
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
			<td id="cnps--cnpgTraffic"><a href="./values.yaml#L393">cnps.cnpgTraffic</a></td>
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
			<td>Additional CNPG Cilium policy tuning used by libchart-cnps when includeCnpgPolicies=true.</td>
		</tr>
		<tr>
			<td id="cnps--cnpgTraffic--instanceExtraEgress"><a href="./values.yaml#L395">cnps.cnpgTraffic.instanceExtraEgress</a></td>
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
			<td id="command"><a href="./values.yaml#L257">command</a></td>
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
			<td id="database"><a href="./values.yaml#L209">database</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "mode": "sqlite",
  "postgres": {
    "connectionStringSecret": {
      "key": "connectionString",
      "name": ""
    },
    "database": "anythingllm",
    "host": "",
    "passwordSecret": {
      "key": "password",
      "name": ""
    },
    "pgVectorTable": "",
    "port": 5432,
    "ssl": "require",
    "user": "anythingllm"
  },
  "useCnpgCluster": {
    "appConnectionSecretName": "",
    "clusterName": "cnpg-cluster",
    "enabled": false,
    "port": 5432,
    "secretKeys": {
      "connectionString": "uri",
      "database": "dbname",
      "password": "password",
      "username": "user"
    }
  }
}
</pre>
</div>
			</td>
			<td>Database options for application metadata storage.</td>
		</tr>
		<tr>
			<td id="database--mode"><a href="./values.yaml#L212">database.mode</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"sqlite"
</pre>
</div>
			</td>
			<td>Database mode. @description Supported values: `sqlite`, `postgres`.</td>
		</tr>
		<tr>
			<td id="database--postgres--connectionStringSecret--key"><a href="./values.yaml#L234">database.postgres.connectionStringSecret.key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"connectionString"
</pre>
</div>
			</td>
			<td>Secret key containing full PostgreSQL connection string.</td>
		</tr>
		<tr>
			<td id="database--postgres--connectionStringSecret--name"><a href="./values.yaml#L232">database.postgres.connectionStringSecret.name</a></td>
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
			<td>Existing secret name containing full PostgreSQL connection string.</td>
		</tr>
		<tr>
			<td id="database--postgres--database"><a href="./values.yaml#L219">database.postgres.database</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"anythingllm"
</pre>
</div>
			</td>
			<td>PostgreSQL database name.</td>
		</tr>
		<tr>
			<td id="database--postgres--host"><a href="./values.yaml#L215">database.postgres.host</a></td>
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
			<td>PostgreSQL host when database.mode=postgres and CNPG mode is disabled.</td>
		</tr>
		<tr>
			<td id="database--postgres--passwordSecret--key"><a href="./values.yaml#L229">database.postgres.passwordSecret.key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"password"
</pre>
</div>
			</td>
			<td>Secret key containing PostgreSQL password.</td>
		</tr>
		<tr>
			<td id="database--postgres--passwordSecret--name"><a href="./values.yaml#L227">database.postgres.passwordSecret.name</a></td>
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
			<td>Existing secret name containing PostgreSQL password.</td>
		</tr>
		<tr>
			<td id="database--postgres--pgVectorTable"><a href="./values.yaml#L236">database.postgres.pgVectorTable</a></td>
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
			<td>Optional PGVector table override.</td>
		</tr>
		<tr>
			<td id="database--postgres--port"><a href="./values.yaml#L217">database.postgres.port</a></td>
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
			<td>PostgreSQL port.</td>
		</tr>
		<tr>
			<td id="database--postgres--ssl"><a href="./values.yaml#L224">database.postgres.ssl</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"require"
</pre>
</div>
			</td>
			<td>PostgreSQL SSL mode used for both standalone and CNPG-backed postgres connections. @description For CNPG, keep at least `require` unless your platform policy explicitly differs.</td>
		</tr>
		<tr>
			<td id="database--postgres--user"><a href="./values.yaml#L221">database.postgres.user</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"anythingllm"
</pre>
</div>
			</td>
			<td>PostgreSQL username.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--appConnectionSecretName"><a href="./values.yaml#L245">database.useCnpgCluster.appConnectionSecretName</a></td>
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
			<td>Explicit CNPG app secret name (defaults to `<clusterName>-app`).</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--clusterName"><a href="./values.yaml#L241">database.useCnpgCluster.clusterName</a></td>
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
			<td>CNPG cluster name (RW service `<clusterName>-rw`).</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--enabled"><a href="./values.yaml#L239">database.useCnpgCluster.enabled</a></td>
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
			<td>Resolve PostgreSQL credentials from an existing CNPG cluster app secret.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--port"><a href="./values.yaml#L243">database.useCnpgCluster.port</a></td>
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
			<td id="database--useCnpgCluster--secretKeys--connectionString"><a href="./values.yaml#L254">database.useCnpgCluster.secretKeys.connectionString</a></td>
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
			<td>Key for full connection string in app secret.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--secretKeys--database"><a href="./values.yaml#L248">database.useCnpgCluster.secretKeys.database</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"dbname"
</pre>
</div>
			</td>
			<td>Key for database name in app secret.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--secretKeys--password"><a href="./values.yaml#L252">database.useCnpgCluster.secretKeys.password</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"password"
</pre>
</div>
			</td>
			<td>Key for password in app secret.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--secretKeys--username"><a href="./values.yaml#L250">database.useCnpgCluster.secretKeys.username</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"user"
</pre>
</div>
			</td>
			<td>Key for username in app secret.</td>
		</tr>
		<tr>
			<td id="envFromConfigMaps"><a href="./values.yaml#L286">envFromConfigMaps</a></td>
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
			<td id="envFromSecrets"><a href="./values.yaml#L283">envFromSecrets</a></td>
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
			<td id="extraEnv"><a href="./values.yaml#L263">extraEnv</a></td>
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
			<td id="extraVolumeMounts"><a href="./values.yaml#L292">extraVolumeMounts</a></td>
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
			<td id="extraVolumes"><a href="./values.yaml#L289">extraVolumes</a></td>
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
			<td id="gatewayApi"><a href="./values.yaml#L90">gatewayApi</a></td>
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
    "anything-llm.example.com"
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
  ]
}
</pre>
</div>
			</td>
			<td>Gateway API HTTPRoute configuration (for example Envoy Gateway).</td>
		</tr>
		<tr>
			<td id="gatewayApi--annotations"><a href="./values.yaml#L99">gatewayApi.annotations</a></td>
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
			<td id="gatewayApi--backendRefs"><a href="./values.yaml#L118">gatewayApi.backendRefs</a></td>
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
			<td>Optional backend references. Defaults to this chart service when empty.</td>
		</tr>
		<tr>
			<td id="gatewayApi--controllerSelector"><a href="./values.yaml#L95">gatewayApi.controllerSelector</a></td>
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
			<td>Labels for the Gateway API controller pods, used to generate CiliumNetworkPolicies ingress rules. If empty, you must provide explicit `cnps.appTraffic.ingress.fromEndpoints` when gatewayApi is enabled.</td>
		</tr>
		<tr>
			<td id="gatewayApi--enabled"><a href="./values.yaml#L92">gatewayApi.enabled</a></td>
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
			<td id="gatewayApi--filters"><a href="./values.yaml#L116">gatewayApi.filters</a></td>
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
			<td id="gatewayApi--hostnames"><a href="./values.yaml#L108">gatewayApi.hostnames</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "anything-llm.example.com"
]
</pre>
</div>
			</td>
			<td>Hostnames served by this route.</td>
		</tr>
		<tr>
			<td id="gatewayApi--labels"><a href="./values.yaml#L101">gatewayApi.labels</a></td>
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
			<td id="gatewayApi--matches"><a href="./values.yaml#L111">gatewayApi.matches</a></td>
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
			<td>Match rules for the HTTPRoute rule.</td>
		</tr>
		<tr>
			<td id="gatewayApi--parentRefs"><a href="./values.yaml#L103">gatewayApi.parentRefs</a></td>
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
			<td>ParentRefs for HTTPRoute.</td>
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
  "postgresTag": "pg-1.11.1",
  "pullPolicy": "IfNotPresent",
  "repository": "mintplexlabs/anythingllm",
  "tag": ""
}
</pre>
</div>
			</td>
			<td>Container image configuration.</td>
		</tr>
		<tr>
			<td id="image--postgresTag"><a href="./values.yaml#L18">image.postgresTag</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"pg-1.11.1"
</pre>
</div>
			</td>
			<td>PostgreSQL runtime image tag. @description Set the tag portion only (for example `pg-1.11.1`). Official docs often show `mintplexlabs/anythingllm:pg`, but this chart pins by default for reproducibility.</td>
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
"mintplexlabs/anythingllm"
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
			<td>SQLite/default runtime image tag (defaults to .Chart.AppVersion when empty).</td>
		</tr>
		<tr>
			<td id="imagePullSecrets"><a href="./values.yaml#L21">imagePullSecrets</a></td>
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
			<td>Image pull secrets (for private registries).</td>
		</tr>
		<tr>
			<td id="ingress"><a href="./values.yaml#L59">ingress</a></td>
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
      "host": "anything-llm.example.com",
      "paths": [
        {
          "path": "/",
          "pathType": "Prefix"
        }
      ]
    }
  ],
  "secureDefaults": {
    "enabled": true,
    "proxyBuffering": "off",
    "proxyHttpVersion": "1.1",
    "proxyReadTimeoutSeconds": 3600,
    "proxyRequestBuffering": "off",
    "proxySendTimeoutSeconds": 3600
  },
  "tls": []
}
</pre>
</div>
			</td>
			<td>Ingress configuration (ingress-nginx style).</td>
		</tr>
		<tr>
			<td id="ingress--annotations"><a href="./values.yaml#L65">ingress.annotations</a></td>
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
			<td id="ingress--className"><a href="./values.yaml#L63">ingress.className</a></td>
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
			<td id="ingress--enabled"><a href="./values.yaml#L61">ingress.enabled</a></td>
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
			<td id="ingress--hosts"><a href="./values.yaml#L81">ingress.hosts</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "host": "anything-llm.example.com",
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
			<td id="ingress--secureDefaults"><a href="./values.yaml#L67">ingress.secureDefaults</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "proxyBuffering": "off",
  "proxyHttpVersion": "1.1",
  "proxyReadTimeoutSeconds": 3600,
  "proxyRequestBuffering": "off",
  "proxySendTimeoutSeconds": 3600
}
</pre>
</div>
			</td>
			<td>Secure defaults for websocket and long-lived responses.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--enabled"><a href="./values.yaml#L69">ingress.secureDefaults.enabled</a></td>
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
			<td id="ingress--secureDefaults--proxyBuffering"><a href="./values.yaml#L75">ingress.secureDefaults.proxyBuffering</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"off"
</pre>
</div>
			</td>
			<td>Disable proxy buffering.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--proxyHttpVersion"><a href="./values.yaml#L79">ingress.secureDefaults.proxyHttpVersion</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"1.1"
</pre>
</div>
			</td>
			<td>HTTP version for proxy upstream.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--proxyReadTimeoutSeconds"><a href="./values.yaml#L71">ingress.secureDefaults.proxyReadTimeoutSeconds</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3600
</pre>
</div>
			</td>
			<td>Proxy read timeout in seconds.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--proxyRequestBuffering"><a href="./values.yaml#L77">ingress.secureDefaults.proxyRequestBuffering</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"off"
</pre>
</div>
			</td>
			<td>Disable request buffering.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--proxySendTimeoutSeconds"><a href="./values.yaml#L73">ingress.secureDefaults.proxySendTimeoutSeconds</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3600
</pre>
</div>
			</td>
			<td>Proxy send timeout in seconds.</td>
		</tr>
		<tr>
			<td id="ingress--tls"><a href="./values.yaml#L87">ingress.tls</a></td>
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
			<td id="libchartCnps"><a href="./values.yaml#L384">libchartCnps</a></td>
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
			<td id="libchartCnps--enabled"><a href="./values.yaml#L386">libchartCnps.enabled</a></td>
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
			<td>Enable libchart-cnps templates.</td>
		</tr>
		<tr>
			<td id="libchartCnps--includeCnpgPolicies"><a href="./values.yaml#L388">libchartCnps.includeCnpgPolicies</a></td>
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
			<td>Include CNPG policy set from library.</td>
		</tr>
		<tr>
			<td id="livenessProbe"><a href="./values.yaml#L298">livenessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 6,
  "httpGet": {
    "path": "/api/ping",
    "port": "http"
  },
  "initialDelaySeconds": 20,
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
			<td id="nodeSelector"><a href="./values.yaml#L375">nodeSelector</a></td>
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
			<td id="persistence"><a href="./values.yaml#L128">persistence</a></td>
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
  "annotations": {},
  "enabled": true,
  "existingClaim": "",
  "mountPath": "/app/server/storage",
  "retain": false,
  "size": "20Gi",
  "storageClass": "",
  "volumeName": ""
}
</pre>
</div>
			</td>
			<td>Persistence settings for AnythingLLM storage (`STORAGE_DIR`).</td>
		</tr>
		<tr>
			<td id="persistence--accessModes"><a href="./values.yaml#L140">persistence.accessModes</a></td>
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
			<td>PVC access modes.</td>
		</tr>
		<tr>
			<td id="persistence--annotations"><a href="./values.yaml#L143">persistence.annotations</a></td>
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
			<td>PVC annotations.</td>
		</tr>
		<tr>
			<td id="persistence--enabled"><a href="./values.yaml#L130">persistence.enabled</a></td>
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
			<td>Enable persistent storage.</td>
		</tr>
		<tr>
			<td id="persistence--existingClaim"><a href="./values.yaml#L134">persistence.existingClaim</a></td>
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
			<td>Existing PVC to use instead of creating one.</td>
		</tr>
		<tr>
			<td id="persistence--mountPath"><a href="./values.yaml#L147">persistence.mountPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/app/server/storage"
</pre>
</div>
			</td>
			<td>Mount path inside container.</td>
		</tr>
		<tr>
			<td id="persistence--retain"><a href="./values.yaml#L132">persistence.retain</a></td>
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
			<td>Keep PVC when Helm release is deleted (`true` keeps data on uninstall; scale up/down does not delete PVCs either way).</td>
		</tr>
		<tr>
			<td id="persistence--size"><a href="./values.yaml#L136">persistence.size</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"20Gi"
</pre>
</div>
			</td>
			<td>PVC storage size.</td>
		</tr>
		<tr>
			<td id="persistence--storageClass"><a href="./values.yaml#L138">persistence.storageClass</a></td>
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
			<td>PVC storageClass.</td>
		</tr>
		<tr>
			<td id="persistence--volumeName"><a href="./values.yaml#L145">persistence.volumeName</a></td>
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
			<td>PVC volumeName binding.</td>
		</tr>
		<tr>
			<td id="podAnnotations"><a href="./values.yaml#L369">podAnnotations</a></td>
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
			<td id="podLabels"><a href="./values.yaml#L372">podLabels</a></td>
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
			<td id="podSecurityContext"><a href="./values.yaml#L328">podSecurityContext</a></td>
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
			<td>Pod-level security context.</td>
		</tr>
		<tr>
			<td id="rbac"><a href="./values.yaml#L35">rbac</a></td>
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
			<td id="rbac--create"><a href="./values.yaml#L37">rbac.create</a></td>
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
			<td>Create Role + RoleBinding.</td>
		</tr>
		<tr>
			<td id="rbac--namespace"><a href="./values.yaml#L39">rbac.namespace</a></td>
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
			<td>Namespace override for RBAC resources.</td>
		</tr>
		<tr>
			<td id="rbac--rules"><a href="./values.yaml#L41">rbac.rules</a></td>
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
			<td>Explicit RBAC rules required when rbac.create=true.</td>
		</tr>
		<tr>
			<td id="readinessProbe"><a href="./values.yaml#L308">readinessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 6,
  "httpGet": {
    "path": "/api/ping",
    "port": "http"
  },
  "initialDelaySeconds": 10,
  "periodSeconds": 10,
  "timeoutSeconds": 5
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
1
</pre>
</div>
			</td>
			<td>Number of application pod replicas.</td>
		</tr>
		<tr>
			<td id="resources"><a href="./values.yaml#L345">resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "cpu": "2000m",
    "memory": "4Gi"
  },
  "requests": {
    "cpu": "500m",
    "memory": "1Gi"
  }
}
</pre>
</div>
			</td>
			<td>Resource requests and limits.</td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L121">runtimeClass</a></td>
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
			<td id="runtimeClass--pods"><a href="./values.yaml#L123">runtimeClass.pods</a></td>
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
			<td id="runtimeClass--tests"><a href="./values.yaml#L125">runtimeClass.tests</a></td>
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
			<td>RuntimeClass for test pods.</td>
		</tr>
		<tr>
			<td id="secrets"><a href="./values.yaml#L186">secrets</a></td>
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
    "authToken": "AUTH_TOKEN",
    "jwtSecret": "JWT_SECRET",
    "sigKey": "SIG_KEY",
    "sigSalt": "SIG_SALT"
  },
  "name": ""
}
</pre>
</div>
			</td>
			<td>Secret handling for required runtime secrets.</td>
		</tr>
		<tr>
			<td id="secrets--create"><a href="./values.yaml#L188">secrets.create</a></td>
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
			<td>Create chart-managed secret with generated secure values.</td>
		</tr>
		<tr>
			<td id="secrets--existingSecret"><a href="./values.yaml#L190">secrets.existingSecret</a></td>
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
			<td id="secrets--keys--authToken"><a href="./values.yaml#L201">secrets.keys.authToken</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"AUTH_TOKEN"
</pre>
</div>
			</td>
			<td>Key name for optional auth token.</td>
		</tr>
		<tr>
			<td id="secrets--keys--jwtSecret"><a href="./values.yaml#L195">secrets.keys.jwtSecret</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"JWT_SECRET"
</pre>
</div>
			</td>
			<td>Key name for JWT secret.</td>
		</tr>
		<tr>
			<td id="secrets--keys--sigKey"><a href="./values.yaml#L197">secrets.keys.sigKey</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"SIG_KEY"
</pre>
</div>
			</td>
			<td>Key name for signature key.</td>
		</tr>
		<tr>
			<td id="secrets--keys--sigSalt"><a href="./values.yaml#L199">secrets.keys.sigSalt</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"SIG_SALT"
</pre>
</div>
			</td>
			<td>Key name for signature salt.</td>
		</tr>
		<tr>
			<td id="secrets--name"><a href="./values.yaml#L192">secrets.name</a></td>
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
			<td id="securityContext"><a href="./values.yaml#L332">securityContext</a></td>
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
  "readOnlyRootFilesystem": false,
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
			<td>Container-level security context.</td>
		</tr>
		<tr>
			<td id="service"><a href="./values.yaml#L44">service</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "labels": {},
  "port": 3001,
  "targetPort": 3001,
  "targetProtocol": "TCP",
  "type": "ClusterIP"
}
</pre>
</div>
			</td>
			<td>Kubernetes Service configuration.</td>
		</tr>
		<tr>
			<td id="service--annotations"><a href="./values.yaml#L48">service.annotations</a></td>
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
			<td id="service--labels"><a href="./values.yaml#L50">service.labels</a></td>
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
			<td id="service--port"><a href="./values.yaml#L52">service.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3001
</pre>
</div>
			</td>
			<td>Service port.</td>
		</tr>
		<tr>
			<td id="service--targetPort"><a href="./values.yaml#L54">service.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3001
</pre>
</div>
			</td>
			<td>Container target port.</td>
		</tr>
		<tr>
			<td id="service--targetProtocol"><a href="./values.yaml#L56">service.targetProtocol</a></td>
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
			<td id="service--type"><a href="./values.yaml#L46">service.type</a></td>
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
			<td>Service type. This chart enforces ClusterIP.</td>
		</tr>
		<tr>
			<td id="serviceAccount"><a href="./values.yaml#L24">serviceAccount</a></td>
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
			<td id="serviceAccount--annotations"><a href="./values.yaml#L28">serviceAccount.annotations</a></td>
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
			<td id="serviceAccount--automountServiceAccountToken"><a href="./values.yaml#L32">serviceAccount.automountServiceAccountToken</a></td>
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
			<td>Automount SA token.</td>
		</tr>
		<tr>
			<td id="serviceAccount--create"><a href="./values.yaml#L26">serviceAccount.create</a></td>
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
			<td>Create a service account.</td>
		</tr>
		<tr>
			<td id="serviceAccount--name"><a href="./values.yaml#L30">serviceAccount.name</a></td>
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
			<td id="startupProbe"><a href="./values.yaml#L318">startupProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 60,
  "httpGet": {
    "path": "/api/ping",
    "port": "http"
  },
  "initialDelaySeconds": 20,
  "periodSeconds": 10,
  "timeoutSeconds": 5
}
</pre>
</div>
			</td>
			<td>Startup probe.</td>
		</tr>
		<tr>
			<td id="tmpVolume"><a href="./values.yaml#L150">tmpVolume</a></td>
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
			<td>Optional tmp volume.</td>
		</tr>
		<tr>
			<td id="tmpVolume--enabled"><a href="./values.yaml#L152">tmpVolume.enabled</a></td>
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
			<td>Mount writable emptyDir at /tmp.</td>
		</tr>
		<tr>
			<td id="tmpVolume--mountPath"><a href="./values.yaml#L154">tmpVolume.mountPath</a></td>
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
			<td>Mount path inside container.</td>
		</tr>
		<tr>
			<td id="tmpVolume--sizeLimit"><a href="./values.yaml#L156">tmpVolume.sizeLimit</a></td>
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
			<td id="tolerations"><a href="./values.yaml#L378">tolerations</a></td>
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

### Upstream behavior and chart scope

* This chart follows official AnythingLLM Docker deployment guidance and maps the same env/runtime model into Kubernetes.
* `STORAGE_DIR` persistence is a first-class requirement in this chart and is bound to `persistence.mountPath`.
* External controller installation (Ingress controller / Gateway controller / CNPG operator) is out of scope.
* Service exposure is intentionally ClusterIP-only; use ingress or Gateway API resources for north-south traffic.

### Database model (SQLite and PostgreSQL/CNPG)

* Default mode is `database.mode=sqlite` with AnythingLLM local storage (`VECTOR_DB=lancedb`).
* PostgreSQL mode is enabled with `database.mode=postgres` and switches runtime to the official `:pg` image variant by default.
* For PostgreSQL mode this chart sets both:
  * `DATABASE_URL`
  * `PGVECTOR_CONNECTION_STRING`
  and forces `VECTOR_DB=pgvector`.
* CNPG integration is supported via `database.useCnpgCluster.*` using an existing CNPG app secret.

### Security defaults

* Chart-managed secret generation is enabled by default (`secrets.create=true`) and persisted across upgrades.
* Required runtime secrets are injected from Secret refs (`JWT_SECRET`, `SIG_KEY`, `SIG_SALT`) and optional `AUTH_TOKEN`.
* Pod/container hardening defaults are enabled (`runAsNonRoot`, dropped capabilities, no privilege escalation, `RuntimeDefault` seccomp).
* `SYS_ADMIN` capability is disabled by default and must be explicitly enabled (`anythingllm.security.enableSysAdminCapability=true`) only when needed.

### Operational notes

* Health checks use `/api/ping`, matching upstream container healthcheck behavior.
* If web scraping features require Chromium sandbox behavior, evaluate `SYS_ADMIN` tradeoffs vs `ANYTHINGLLM_CHROMIUM_ARGS` for restricted environments.
* PVC lifecycle follows Kubernetes behavior: scaling keeps PVC; uninstall deletes PVC unless `persistence.retain=true`.
