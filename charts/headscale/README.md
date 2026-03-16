

# headscale

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.28.0](https://img.shields.io/badge/AppVersion-0.28.0-informational?style=flat-square)

A Helm chart for an easier headscale (https://headscale.net) deployment on Kubernetes. Please note that this is a private helm chart and not directly or indirectly affiliated with headscale or its authors.

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
helm install headscale codeadminde/headscale
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

To install the chart with the release name `headscale`

```bash
helm install headscale codeadminde/headscale
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

## Uninstallation

To uninstall the chart release named `headscale`

```bash
helm uninstall headscale
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
> helm install headscale codeadminde/headscale -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Then you have to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install headscale --set key=value --set keyTwo=secondValue codeadminde/headscale
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
			<td id="additionalEnvSecrets"><a href="./values.yaml#L561">additionalEnvSecrets</a></td>
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
			<td>Additional env vars from existing secrets. @description Supports either map style (`ENV: secretName`) or list style entries (`[{name, secretName, secretKey}]`).</td>
		</tr>
		<tr>
			<td id="affinity"><a href="./values.yaml#L600">affinity</a></td>
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
			<td id="applyHealthChecks"><a href="./values.yaml#L510">applyHealthChecks</a></td>
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
			<td>Enable liveness and readiness probes.</td>
		</tr>
		<tr>
			<td id="applySecurity"><a href="./values.yaml#L490">applySecurity</a></td>
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
			<td>Apply default pod/container security settings.</td>
		</tr>
		<tr>
			<td id="autoscaling"><a href="./values.yaml#L542">autoscaling</a></td>
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
			<td id="cnps"><a href="./values.yaml#L569">cnps</a></td>
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
      "toEntities": [],
      "toPorts": [
        {
          "port": "443",
          "protocol": "TCP"
        }
      ]
    },
    "ingress": {
      "allow": true,
      "includeGrpcPort": false,
      "includeMetricsPort": false,
      "matchLabels": {}
    }
  },
  "cnpgTraffic": {
    "instanceExtraEgress": []
  }
}
</pre>
</div>
			</td>
			<td>App-specific CiliumNetworkPolicies settings.</td>
		</tr>
		<tr>
			<td id="cnps--cnpgTraffic--instanceExtraEgress"><a href="./values.yaml#L572">cnps.cnpgTraffic.instanceExtraEgress</a></td>
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
			<td>Additional Cilium egress rules for CNPG instance pods when libchartCnps.includeCnpgPolicies=true.</td>
		</tr>
		<tr>
			<td id="config"><a href="./values.yaml#L109">config</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "existingSecret": {
    "key": "config.yaml",
    "name": ""
  }
}
</pre>
</div>
			</td>
			<td>Config source control.</td>
		</tr>
		<tr>
			<td id="config--existingSecret--key"><a href="./values.yaml#L115">config.existingSecret.key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"config.yaml"
</pre>
</div>
			</td>
			<td>Secret key containing the config file content.</td>
		</tr>
		<tr>
			<td id="config--existingSecret--name"><a href="./values.yaml#L113">config.existingSecret.name</a></td>
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
			<td>Existing secret containing headscale config file. When set, generated ConfigMap is skipped and this secret is mounted instead.</td>
		</tr>
		<tr>
			<td id="database"><a href="./values.yaml#L118">database</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "gorm": {
    "debug": false,
    "parameterizedQueries": true,
    "prepareStmt": true,
    "skipErrRecordNotFound": true,
    "slowThreshold": 1000
  },
  "mode": "sqlite",
  "postgres": {
    "connMaxIdleTimeSecs": 3600,
    "host": "",
    "maxIdleConns": 10,
    "maxOpenConns": 10,
    "name": "headscale",
    "passwordSecret": {
      "key": "password",
      "name": ""
    },
    "port": 5432,
    "ssl": "require",
    "user": "headscale"
  },
  "sqlite": {
    "path": "/var/lib/headscale/db.sqlite",
    "walAutocheckpoint": 1000,
    "writeAheadLog": true
  },
  "useCnpgCluster": {
    "appConnectionSecretName": "",
    "clusterName": "cnpg-cluster",
    "enabled": false,
    "port": 5432,
    "secretKeys": {
      "database": "dbname",
      "password": "password",
      "username": "username"
    },
    "ssl": "require"
  }
}
</pre>
</div>
			</td>
			<td>Database configuration.</td>
		</tr>
		<tr>
			<td id="database--gorm"><a href="./values.yaml#L159">database.gorm</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "debug": false,
  "parameterizedQueries": true,
  "prepareStmt": true,
  "skipErrRecordNotFound": true,
  "slowThreshold": 1000
}
</pre>
</div>
			</td>
			<td>GORM tuning for headscale DB layer.</td>
		</tr>
		<tr>
			<td id="database--mode"><a href="./values.yaml#L120">database.mode</a></td>
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
			<td>Database mode for headscale runtime (`sqlite` or `postgres`).</td>
		</tr>
		<tr>
			<td id="database--postgres"><a href="./values.yaml#L129">database.postgres</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "connMaxIdleTimeSecs": 3600,
  "host": "",
  "maxIdleConns": 10,
  "maxOpenConns": 10,
  "name": "headscale",
  "passwordSecret": {
    "key": "password",
    "name": ""
  },
  "port": 5432,
  "ssl": "require",
  "user": "headscale"
}
</pre>
</div>
			</td>
			<td>Postgres configuration.</td>
		</tr>
		<tr>
			<td id="database--postgres--passwordSecret--key"><a href="./values.yaml#L143">database.postgres.passwordSecret.key</a></td>
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
			<td>Secret key for the postgres password value.</td>
		</tr>
		<tr>
			<td id="database--postgres--passwordSecret--name"><a href="./values.yaml#L141">database.postgres.passwordSecret.name</a></td>
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
			<td>Existing secret containing the postgres password key.</td>
		</tr>
		<tr>
			<td id="database--postgres--ssl"><a href="./values.yaml#L135">database.postgres.ssl</a></td>
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
			<td>SSL mode for direct/external Postgres usage.</td>
		</tr>
		<tr>
			<td id="database--sqlite"><a href="./values.yaml#L123">database.sqlite</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "path": "/var/lib/headscale/db.sqlite",
  "walAutocheckpoint": 1000,
  "writeAheadLog": true
}
</pre>
</div>
			</td>
			<td>SQLite configuration.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster"><a href="./values.yaml#L146">database.useCnpgCluster</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "appConnectionSecretName": "",
  "clusterName": "cnpg-cluster",
  "enabled": false,
  "port": 5432,
  "secretKeys": {
    "database": "dbname",
    "password": "password",
    "username": "username"
  },
  "ssl": "require"
}
</pre>
</div>
			</td>
			<td>Use an in-cluster CNPG app secret as postgres datasource input.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--ssl"><a href="./values.yaml#L152">database.useCnpgCluster.ssl</a></td>
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
			<td>SSL mode override for CNPG connectivity.</td>
		</tr>
		<tr>
			<td id="env"><a href="./values.yaml#L557">env</a></td>
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
			<td>Extra environment variables. @description Avoid putting plaintext credentials here.</td>
		</tr>
		<tr>
			<td id="fullnameOverride"><a href="./values.yaml#L7">fullnameOverride</a></td>
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
			<td id="headscale"><a href="./values.yaml#L22">headscale</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "args": [
    "serve"
  ],
  "derp": {
    "autoUpdateEnabled": true,
    "paths": [],
    "updateFrequency": "3h",
    "urls": [
      "https://controlplane.tailscale.com/derpmap/default"
    ]
  },
  "disableCheckUpdates": true,
  "dns": {
    "baseDomain": "",
    "magicDns": false,
    "nameserversGlobal": [],
    "nameserversSplit": {},
    "overrideLocalDns": false,
    "searchDomains": []
  },
  "ephemeralNodeInactivityTimeout": "30m",
  "extraConfig": {},
  "grpcAllowInsecure": false,
  "listeners": {
    "grpcBindAddress": "0.0.0.0",
    "httpBindAddress": "0.0.0.0",
    "metricsBindAddress": "0.0.0.0"
  },
  "log": {
    "format": "text",
    "level": "info"
  },
  "noise": {
    "privateKeyPath": "/var/lib/headscale/noise_private.key"
  },
  "policy": {
    "mode": "database",
    "path": ""
  },
  "prefixes": {
    "allocation": "sequential",
    "v4": "100.64.0.0/10",
    "v6": "fd7a:115c:a1e0::/48"
  },
  "serverUrl": "https://headscale.example.com",
  "tls": {
    "certPath": "",
    "keyPath": "",
    "letsencrypt": {
      "acmeEmail": "",
      "acmeUrl": "https://acme-v02.api.letsencrypt.org/directory",
      "cacheDir": "/var/lib/headscale/cache",
      "challengeType": "HTTP-01",
      "hostname": "",
      "listen": ":http"
    }
  },
  "unixSocket": {
    "path": "/var/run/headscale/headscale.sock",
    "permission": "0770"
  }
}
</pre>
</div>
			</td>
			<td>Headscale runtime configuration rendered into `/etc/headscale/config.yaml`.</td>
		</tr>
		<tr>
			<td id="headscale--args"><a href="./values.yaml#L28">headscale.args</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "serve"
]
</pre>
</div>
			</td>
			<td>Container args for headscale runtime. Keep `serve` for server mode.</td>
		</tr>
		<tr>
			<td id="headscale--derp"><a href="./values.yaml#L58">headscale.derp</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "autoUpdateEnabled": true,
  "paths": [],
  "updateFrequency": "3h",
  "urls": [
    "https://controlplane.tailscale.com/derpmap/default"
  ]
}
</pre>
</div>
			</td>
			<td>DERP map source configuration.</td>
		</tr>
		<tr>
			<td id="headscale--disableCheckUpdates"><a href="./values.yaml#L42">headscale.disableCheckUpdates</a></td>
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
			<td>Disable update checks at startup.</td>
		</tr>
		<tr>
			<td id="headscale--dns"><a href="./values.yaml#L91">headscale.dns</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "baseDomain": "",
  "magicDns": false,
  "nameserversGlobal": [],
  "nameserversSplit": {},
  "overrideLocalDns": false,
  "searchDomains": []
}
</pre>
</div>
			</td>
			<td>DNS settings exposed to clients.</td>
		</tr>
		<tr>
			<td id="headscale--ephemeralNodeInactivityTimeout"><a href="./values.yaml#L45">headscale.ephemeralNodeInactivityTimeout</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"30m"
</pre>
</div>
			</td>
			<td>Duration before inactive ephemeral nodes are deleted.</td>
		</tr>
		<tr>
			<td id="headscale--extraConfig"><a href="./values.yaml#L106">headscale.extraConfig</a></td>
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
			<td>Additional raw top-level config keys to merge into generated config. @description Use this for advanced upstream options not explicitly exposed by chart values.</td>
		</tr>
		<tr>
			<td id="headscale--grpcAllowInsecure"><a href="./values.yaml#L39">headscale.grpcAllowInsecure</a></td>
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
			<td>Allow insecure gRPC admin listener. @description Disable in production unless strictly required.</td>
		</tr>
		<tr>
			<td id="headscale--listeners"><a href="./values.yaml#L32">headscale.listeners</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "grpcBindAddress": "0.0.0.0",
  "httpBindAddress": "0.0.0.0",
  "metricsBindAddress": "0.0.0.0"
}
</pre>
</div>
			</td>
			<td>Listener bind configuration.</td>
		</tr>
		<tr>
			<td id="headscale--log"><a href="./values.yaml#L79">headscale.log</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "format": "text",
  "level": "info"
}
</pre>
</div>
			</td>
			<td>Logging configuration.</td>
		</tr>
		<tr>
			<td id="headscale--noise"><a href="./values.yaml#L48">headscale.noise</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "privateKeyPath": "/var/lib/headscale/noise_private.key"
}
</pre>
</div>
			</td>
			<td>Noise protocol configuration.</td>
		</tr>
		<tr>
			<td id="headscale--policy"><a href="./values.yaml#L84">headscale.policy</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "mode": "database",
  "path": ""
}
</pre>
</div>
			</td>
			<td>ACL policy backend.</td>
		</tr>
		<tr>
			<td id="headscale--policy--mode"><a href="./values.yaml#L86">headscale.policy.mode</a></td>
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
			<td>`database` or `file`.</td>
		</tr>
		<tr>
			<td id="headscale--policy--path"><a href="./values.yaml#L88">headscale.policy.path</a></td>
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
			<td>Path to ACL file when using file mode.</td>
		</tr>
		<tr>
			<td id="headscale--prefixes"><a href="./values.yaml#L52">headscale.prefixes</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "allocation": "sequential",
  "v4": "100.64.0.0/10",
  "v6": "fd7a:115c:a1e0::/48"
}
</pre>
</div>
			</td>
			<td>Tailnet prefix allocation configuration.</td>
		</tr>
		<tr>
			<td id="headscale--serverUrl"><a href="./values.yaml#L25">headscale.serverUrl</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"https://headscale.example.com"
</pre>
</div>
			</td>
			<td>Public URL clients use to connect to headscale. Must start with `http://` or `https://`.</td>
		</tr>
		<tr>
			<td id="headscale--tls"><a href="./values.yaml#L67">headscale.tls</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "certPath": "",
  "keyPath": "",
  "letsencrypt": {
    "acmeEmail": "",
    "acmeUrl": "https://acme-v02.api.letsencrypt.org/directory",
    "cacheDir": "/var/lib/headscale/cache",
    "challengeType": "HTTP-01",
    "hostname": "",
    "listen": ":http"
  }
}
</pre>
</div>
			</td>
			<td>TLS settings for direct TLS termination in headscale. @description Leave cert/key empty when terminating TLS at ingress/reverse proxy.</td>
		</tr>
		<tr>
			<td id="headscale--unixSocket"><a href="./values.yaml#L100">headscale.unixSocket</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "path": "/var/run/headscale/headscale.sock",
  "permission": "0770"
}
</pre>
</div>
			</td>
			<td>Unix socket settings used by local CLI inside container.</td>
		</tr>
		<tr>
			<td id="image"><a href="./values.yaml#L10">image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "headscale/headscale",
  "tag": ""
}
</pre>
</div>
			</td>
			<td>Container image configuration.</td>
		</tr>
		<tr>
			<td id="image--pullPolicy"><a href="./values.yaml#L14">image.pullPolicy</a></td>
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
			<td id="image--repository"><a href="./values.yaml#L12">image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"headscale/headscale"
</pre>
</div>
			</td>
			<td>Image repository.</td>
		</tr>
		<tr>
			<td id="image--tag"><a href="./values.yaml#L16">image.tag</a></td>
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
			<td>Image tag override (defaults to .Chart.AppVersion when empty).</td>
		</tr>
		<tr>
			<td id="imagePullSecrets"><a href="./values.yaml#L19">imagePullSecrets</a></td>
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
			<td id="ingress"><a href="./values.yaml#L447">ingress</a></td>
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
      "host": "chart-example.local",
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
    "proxySendTimeoutSeconds": 3600,
    "websocket": {
      "annotationKey": "",
      "enabled": false
    }
  },
  "tls": []
}
</pre>
</div>
			</td>
			<td>Ingress configuration for headscale HTTP endpoint.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults"><a href="./values.yaml#L453">ingress.secureDefaults</a></td>
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
  "proxySendTimeoutSeconds": 3600,
  "websocket": {
    "annotationKey": "",
    "enabled": false
  }
}
</pre>
</div>
			</td>
			<td>Secure-by-default ingress annotation settings. @description Applied by default and merged with ingress.annotations (custom annotations win on key conflicts).</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--websocket--annotationKey"><a href="./values.yaml#L465">ingress.secureDefaults.websocket.annotationKey</a></td>
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
			<td>Annotation key to use when websocket annotation injection is enabled. Example for NGINX Plus: nginx.org/websocket-services</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--websocket--enabled"><a href="./values.yaml#L462">ingress.secureDefaults.websocket.enabled</a></td>
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
			<td>Inject websocket annotation. Keep disabled for ingress-nginx defaults.</td>
		</tr>
		<tr>
			<td id="libchartCnps"><a href="./values.yaml#L564">libchartCnps</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "includeCnpgPolicies": false
}
</pre>
</div>
			</td>
			<td>CiliumNetworkPolicies dependency toggle.</td>
		</tr>
		<tr>
			<td id="livenessProbe"><a href="./values.yaml#L513">livenessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 3,
  "httpGet": {
    "path": "/health",
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
			<td id="nameOverride"><a href="./values.yaml#L6">nameOverride</a></td>
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
			<td id="nodeSelector"><a href="./values.yaml#L594">nodeSelector</a></td>
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
			<td id="persistence"><a href="./values.yaml#L167">persistence</a></td>
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
  "emptyDirSizeLimit": "2Gi",
  "enabled": true,
  "existingClaim": "",
  "runDirSizeLimit": "16Mi",
  "size": "1Gi",
  "storageClass": "",
  "tmpDirSizeLimit": "32Mi"
}
</pre>
</div>
			</td>
			<td>Persistent storage for `/var/lib/headscale`.</td>
		</tr>
		<tr>
			<td id="persistence--accessModes"><a href="./values.yaml#L177">persistence.accessModes</a></td>
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
			<td>PVC accessModes when creating a claim.</td>
		</tr>
		<tr>
			<td id="persistence--emptyDirSizeLimit"><a href="./values.yaml#L180">persistence.emptyDirSizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"2Gi"
</pre>
</div>
			</td>
			<td>emptyDir size limit for `/var/lib/headscale` when persistence.enabled=false.</td>
		</tr>
		<tr>
			<td id="persistence--enabled"><a href="./values.yaml#L169">persistence.enabled</a></td>
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
			<td>Enable persistence with PVC for headscale state and keys.</td>
		</tr>
		<tr>
			<td id="persistence--existingClaim"><a href="./values.yaml#L171">persistence.existingClaim</a></td>
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
			<td>Existing claim to use instead of creating a new PVC.</td>
		</tr>
		<tr>
			<td id="persistence--runDirSizeLimit"><a href="./values.yaml#L182">persistence.runDirSizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"16Mi"
</pre>
</div>
			</td>
			<td>emptyDir size limit for `/var/run/headscale`.</td>
		</tr>
		<tr>
			<td id="persistence--size"><a href="./values.yaml#L173">persistence.size</a></td>
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
			<td>PVC size when creating a claim.</td>
		</tr>
		<tr>
			<td id="persistence--storageClass"><a href="./values.yaml#L175">persistence.storageClass</a></td>
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
			<td>PVC storageClass when creating a claim.</td>
		</tr>
		<tr>
			<td id="persistence--tmpDirSizeLimit"><a href="./values.yaml#L184">persistence.tmpDirSizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"32Mi"
</pre>
</div>
			</td>
			<td>emptyDir size limit for `/tmp`.</td>
		</tr>
		<tr>
			<td id="podAnnotations"><a href="./values.yaml#L588">podAnnotations</a></td>
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
			<td id="podLabels"><a href="./values.yaml#L591">podLabels</a></td>
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
			<td id="podSecurityContext"><a href="./values.yaml#L493">podSecurityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "fsGroup": 65532
}
</pre>
</div>
			</td>
			<td>Pod-level security context for workload pods.</td>
		</tr>
		<tr>
			<td id="rbac"><a href="./values.yaml#L481">rbac</a></td>
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
			<td>RBAC settings.</td>
		</tr>
		<tr>
			<td id="rbac--create"><a href="./values.yaml#L483">rbac.create</a></td>
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
			<td>Create namespace-scoped role + rolebinding.</td>
		</tr>
		<tr>
			<td id="rbac--namespace"><a href="./values.yaml#L485">rbac.namespace</a></td>
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
			<td>Namespace override for RBAC objects. Empty means release namespace.</td>
		</tr>
		<tr>
			<td id="rbac--rules"><a href="./values.yaml#L487">rbac.rules</a></td>
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
			<td>RBAC rules for Role when rbac.create=true.</td>
		</tr>
		<tr>
			<td id="readinessProbe"><a href="./values.yaml#L523">readinessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 3,
  "httpGet": {
    "path": "/health",
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
			<td id="replicaCount"><a href="./values.yaml#L3">replicaCount</a></td>
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
			<td>Number of headscale pod replicas. Note: SQLite mode is single-writer. Keep this at 1 when database.mode=sqlite.</td>
		</tr>
		<tr>
			<td id="resources"><a href="./values.yaml#L533">resources</a></td>
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
    "cpu": "100m",
    "memory": "128Mi"
  }
}
</pre>
</div>
			</td>
			<td>Resource requests/limits.</td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L551">runtimeClass</a></td>
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
			<td id="securityContext"><a href="./values.yaml#L497">securityContext</a></td>
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
  "runAsGroup": 65532,
  "runAsNonRoot": true,
  "runAsUser": 65532,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}
</pre>
</div>
			</td>
			<td>Container-level security context for workload containers.</td>
		</tr>
		<tr>
			<td id="service"><a href="./values.yaml#L187">service</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "grpc": {
    "enabled": false,
    "port": 50443,
    "targetPort": 50443,
    "targetProtocol": "TCP"
  },
  "http": {
    "port": 8080,
    "targetPort": 8080,
    "targetProtocol": "TCP"
  },
  "metrics": {
    "enabled": true,
    "port": 9090,
    "targetPort": 9090,
    "targetProtocol": "TCP"
  },
  "type": "ClusterIP"
}
</pre>
</div>
			</td>
			<td>Kubernetes Service configuration.</td>
		</tr>
		<tr>
			<td id="service--annotations"><a href="./values.yaml#L191">service.annotations</a></td>
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
			<td id="service--type"><a href="./values.yaml#L189">service.type</a></td>
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
			<td id="serviceAccount"><a href="./values.yaml#L474">serviceAccount</a></td>
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
			<td>Create service account.</td>
		</tr>
		<tr>
			<td id="tolerations"><a href="./values.yaml#L597">tolerations</a></td>
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
		<tr>
			<td id="ui"><a href="./values.yaml#L208">ui</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "affinity": {},
  "enabled": false,
  "env": {},
  "headplane": {
    "apiKeySecret": {
      "key": "api-key",
      "name": ""
    },
    "config": {
      "baseUrl": "",
      "cookieDomain": "",
      "cookieMaxAge": 86400,
      "cookieSecure": true,
      "dataPath": "/var/lib/headplane",
      "extraConfig": {},
      "headscaleConfigPath": "",
      "headscaleConfigStrict": true,
      "headscaleDnsRecordsPath": "",
      "headscalePublicUrl": "",
      "headscaleTlsCertPath": "",
      "headscaleUrl": "",
      "infoSecret": "",
      "integration": {
        "agent": {
          "cachePath": "/var/lib/headplane/agent_cache.json",
          "cacheTtl": 180000,
          "enabled": false,
          "hostName": "headplane-agent",
          "preAuthKey": "",
          "workDir": "/var/lib/headplane/agent"
        },
        "docker": {
          "containerLabel": "me.tale.headplane.target=headscale",
          "containerName": "",
          "enabled": false,
          "socket": "unix:///var/run/docker.sock"
        },
        "kubernetes": {
          "enabled": false,
          "podName": "",
          "validateManifest": true
        },
        "proc": {
          "enabled": false
        }
      },
      "oidc": {
        "authorizationEndpoint": "",
        "clientId": "",
        "clientSecret": "",
        "clientSecretPath": "",
        "disableApiKeyLogin": false,
        "enabled": false,
        "extraParams": {},
        "headscaleApiKey": "",
        "headscaleApiKeyPath": "",
        "issuer": "",
        "profilePictureSource": "oidc",
        "scope": "openid email profile",
        "tokenEndpoint": "",
        "tokenEndpointAuthMethod": "",
        "usePkce": false,
        "userinfoEndpoint": ""
      },
      "publicUrl": "",
      "serverHost": "0.0.0.0"
    },
    "env": {},
    "image": {
      "pullPolicy": "IfNotPresent",
      "repository": "ghcr.io/tale/headplane",
      "tag": "0.6.2"
    },
    "secret": {
      "cookieKey": "cookie-secret",
      "name": ""
    },
    "service": {
      "annotations": {},
      "port": 3000,
      "targetPort": 3000,
      "targetProtocol": "TCP",
      "type": "ClusterIP"
    }
  },
  "image": {
    "pullPolicy": "IfNotPresent",
    "repository": "ghcr.io/gurucomputing/headscale-ui",
    "tag": "2026.03.17"
  },
  "ingress": {
    "annotations": {},
    "className": "",
    "enabled": false,
    "hosts": [
      {
        "host": "chart-example.local",
        "paths": [
          {
            "path": "/web",
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
  },
  "livenessProbe": {
    "failureThreshold": 3,
    "initialDelaySeconds": 30,
    "periodSeconds": 10,
    "tcpSocket": {
      "port": "http"
    },
    "timeoutSeconds": 5
  },
  "nodeSelector": {},
  "podAnnotations": {},
  "podLabels": {},
  "podSecurityContext": {},
  "provider": "headscale-ui",
  "readinessProbe": {
    "failureThreshold": 3,
    "initialDelaySeconds": 10,
    "periodSeconds": 5,
    "tcpSocket": {
      "port": "http"
    },
    "timeoutSeconds": 3
  },
  "replicaCount": 1,
  "resources": {
    "limits": {
      "cpu": "500m",
      "memory": "256Mi"
    },
    "requests": {
      "cpu": "50m",
      "memory": "64Mi"
    }
  },
  "securityContext": {
    "allowPrivilegeEscalation": false,
    "capabilities": {
      "drop": [
        "ALL"
      ]
    },
    "readOnlyRootFilesystem": true,
    "runAsNonRoot": true,
    "seccompProfile": {
      "type": "RuntimeDefault"
    }
  },
  "service": {
    "annotations": {},
    "port": 8080,
    "targetPort": 8080,
    "targetProtocol": "TCP",
    "type": "ClusterIP"
  },
  "storage": {
    "dataDirSizeLimit": "128Mi",
    "tmpDirSizeLimit": "32Mi"
  },
  "tolerations": []
}
</pre>
</div>
			</td>
			<td>Optional Headscale UI deployment.</td>
		</tr>
		<tr>
			<td id="ui--affinity"><a href="./values.yaml#L444">ui.affinity</a></td>
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
			<td>Workload affinity for UI pods.</td>
		</tr>
		<tr>
			<td id="ui--enabled"><a href="./values.yaml#L210">ui.enabled</a></td>
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
			<td>Enable UI deployment.</td>
		</tr>
		<tr>
			<td id="ui--env"><a href="./values.yaml#L224">ui.env</a></td>
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
			<td>Additional environment variables for `headscale-ui` container.</td>
		</tr>
		<tr>
			<td id="ui--headplane"><a href="./values.yaml#L226">ui.headplane</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "apiKeySecret": {
    "key": "api-key",
    "name": ""
  },
  "config": {
    "baseUrl": "",
    "cookieDomain": "",
    "cookieMaxAge": 86400,
    "cookieSecure": true,
    "dataPath": "/var/lib/headplane",
    "extraConfig": {},
    "headscaleConfigPath": "",
    "headscaleConfigStrict": true,
    "headscaleDnsRecordsPath": "",
    "headscalePublicUrl": "",
    "headscaleTlsCertPath": "",
    "headscaleUrl": "",
    "infoSecret": "",
    "integration": {
      "agent": {
        "cachePath": "/var/lib/headplane/agent_cache.json",
        "cacheTtl": 180000,
        "enabled": false,
        "hostName": "headplane-agent",
        "preAuthKey": "",
        "workDir": "/var/lib/headplane/agent"
      },
      "docker": {
        "containerLabel": "me.tale.headplane.target=headscale",
        "containerName": "",
        "enabled": false,
        "socket": "unix:///var/run/docker.sock"
      },
      "kubernetes": {
        "enabled": false,
        "podName": "",
        "validateManifest": true
      },
      "proc": {
        "enabled": false
      }
    },
    "oidc": {
      "authorizationEndpoint": "",
      "clientId": "",
      "clientSecret": "",
      "clientSecretPath": "",
      "disableApiKeyLogin": false,
      "enabled": false,
      "extraParams": {},
      "headscaleApiKey": "",
      "headscaleApiKeyPath": "",
      "issuer": "",
      "profilePictureSource": "oidc",
      "scope": "openid email profile",
      "tokenEndpoint": "",
      "tokenEndpointAuthMethod": "",
      "usePkce": false,
      "userinfoEndpoint": ""
    },
    "publicUrl": "",
    "serverHost": "0.0.0.0"
  },
  "env": {},
  "image": {
    "pullPolicy": "IfNotPresent",
    "repository": "ghcr.io/tale/headplane",
    "tag": "0.6.2"
  },
  "secret": {
    "cookieKey": "cookie-secret",
    "name": ""
  },
  "service": {
    "annotations": {},
    "port": 3000,
    "targetPort": 3000,
    "targetProtocol": "TCP",
    "type": "ClusterIP"
  }
}
</pre>
</div>
			</td>
			<td>`headplane` specific settings (https://github.com/tale/headplane).</td>
		</tr>
		<tr>
			<td id="ui--headplane--apiKeySecret"><a href="./values.yaml#L356">ui.headplane.apiKeySecret</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "key": "api-key",
  "name": ""
}
</pre>
</div>
			</td>
			<td>Optional existing secret with a headscale API key for simple mode auth. @description Legacy helper for `HEADPLANE_HEADSCALE__API_KEY` env injection.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config"><a href="./values.yaml#L248">ui.headplane.config</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "baseUrl": "",
  "cookieDomain": "",
  "cookieMaxAge": 86400,
  "cookieSecure": true,
  "dataPath": "/var/lib/headplane",
  "extraConfig": {},
  "headscaleConfigPath": "",
  "headscaleConfigStrict": true,
  "headscaleDnsRecordsPath": "",
  "headscalePublicUrl": "",
  "headscaleTlsCertPath": "",
  "headscaleUrl": "",
  "infoSecret": "",
  "integration": {
    "agent": {
      "cachePath": "/var/lib/headplane/agent_cache.json",
      "cacheTtl": 180000,
      "enabled": false,
      "hostName": "headplane-agent",
      "preAuthKey": "",
      "workDir": "/var/lib/headplane/agent"
    },
    "docker": {
      "containerLabel": "me.tale.headplane.target=headscale",
      "containerName": "",
      "enabled": false,
      "socket": "unix:///var/run/docker.sock"
    },
    "kubernetes": {
      "enabled": false,
      "podName": "",
      "validateManifest": true
    },
    "proc": {
      "enabled": false
    }
  },
  "oidc": {
    "authorizationEndpoint": "",
    "clientId": "",
    "clientSecret": "",
    "clientSecretPath": "",
    "disableApiKeyLogin": false,
    "enabled": false,
    "extraParams": {},
    "headscaleApiKey": "",
    "headscaleApiKeyPath": "",
    "issuer": "",
    "profilePictureSource": "oidc",
    "scope": "openid email profile",
    "tokenEndpoint": "",
    "tokenEndpointAuthMethod": "",
    "usePkce": false,
    "userinfoEndpoint": ""
  },
  "publicUrl": "",
  "serverHost": "0.0.0.0"
}
</pre>
</div>
			</td>
			<td>Headplane runtime config rendering settings.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--baseUrl"><a href="./values.yaml#L265">ui.headplane.config.baseUrl</a></td>
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
			<td>Optional base URL for headplane (server.base_url), without `/admin` suffix.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--cookieDomain"><a href="./values.yaml#L274">ui.headplane.config.cookieDomain</a></td>
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
			<td>Optional cookie domain.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--cookieMaxAge"><a href="./values.yaml#L272">ui.headplane.config.cookieMaxAge</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
86400
</pre>
</div>
			</td>
			<td>Session cookie max age in seconds.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--cookieSecure"><a href="./values.yaml#L270">ui.headplane.config.cookieSecure</a></td>
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
			<td>Whether cookies should be marked secure.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--dataPath"><a href="./values.yaml#L276">ui.headplane.config.dataPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/var/lib/headplane"
</pre>
</div>
			</td>
			<td>Writable data path inside container (server.data_path).</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--extraConfig"><a href="./values.yaml#L348">ui.headplane.config.extraConfig</a></td>
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
			<td>Additional raw config to merge into generated config.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--headscaleConfigPath"><a href="./values.yaml#L255">ui.headplane.config.headscaleConfigPath</a></td>
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
			<td>Optional path to headscale config file (headscale.config_path).</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--headscaleConfigStrict"><a href="./values.yaml#L257">ui.headplane.config.headscaleConfigStrict</a></td>
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
			<td>Strict validation mode for headscale config parsing.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--headscaleDnsRecordsPath"><a href="./values.yaml#L261">ui.headplane.config.headscaleDnsRecordsPath</a></td>
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
			<td>Optional path to headscale DNS records file (headscale.dns_records_path).</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--headscalePublicUrl"><a href="./values.yaml#L253">ui.headplane.config.headscalePublicUrl</a></td>
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
			<td>Optional public URL for headscale shown in UI (headscale.public_url).</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--headscaleTlsCertPath"><a href="./values.yaml#L259">ui.headplane.config.headscaleTlsCertPath</a></td>
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
			<td>Optional path to headscale TLS cert (headscale.tls_cert_path).</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--headscaleUrl"><a href="./values.yaml#L251">ui.headplane.config.headscaleUrl</a></td>
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
			<td>Override internal URL for connecting to headscale API. @description Empty uses in-cluster service URL.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--infoSecret"><a href="./values.yaml#L278">ui.headplane.config.infoSecret</a></td>
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
			<td>Optional info secret value.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--integration--agent--cachePath"><a href="./values.yaml#L290">ui.headplane.config.integration.agent.cachePath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/var/lib/headplane/agent_cache.json"
</pre>
</div>
			</td>
			<td>Optional agent cache file path.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--integration--agent--cacheTtl"><a href="./values.yaml#L288">ui.headplane.config.integration.agent.cacheTtl</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
180000
</pre>
</div>
			</td>
			<td>Optional cache TTL in milliseconds.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--integration--agent--enabled"><a href="./values.yaml#L282">ui.headplane.config.integration.agent.enabled</a></td>
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
			<td>Enable headplane agent integration.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--integration--agent--hostName"><a href="./values.yaml#L286">ui.headplane.config.integration.agent.hostName</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"headplane-agent"
</pre>
</div>
			</td>
			<td>Optional agent hostname.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--integration--agent--preAuthKey"><a href="./values.yaml#L284">ui.headplane.config.integration.agent.preAuthKey</a></td>
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
			<td>Pre-auth key for agent integration.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--integration--agent--workDir"><a href="./values.yaml#L292">ui.headplane.config.integration.agent.workDir</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/var/lib/headplane/agent"
</pre>
</div>
			</td>
			<td>Optional agent work directory.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--integration--docker--containerLabel"><a href="./values.yaml#L299">ui.headplane.config.integration.docker.containerLabel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"me.tale.headplane.target=headscale"
</pre>
</div>
			</td>
			<td>Target container label selector.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--integration--docker--containerName"><a href="./values.yaml#L297">ui.headplane.config.integration.docker.containerName</a></td>
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
			<td>Optional target container name.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--integration--docker--enabled"><a href="./values.yaml#L295">ui.headplane.config.integration.docker.enabled</a></td>
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
			<td>Enable docker integration.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--integration--docker--socket"><a href="./values.yaml#L301">ui.headplane.config.integration.docker.socket</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"unix:///var/run/docker.sock"
</pre>
</div>
			</td>
			<td>Docker socket URL.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--integration--kubernetes--enabled"><a href="./values.yaml#L304">ui.headplane.config.integration.kubernetes.enabled</a></td>
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
			<td>Enable kubernetes integration.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--integration--kubernetes--podName"><a href="./values.yaml#L308">ui.headplane.config.integration.kubernetes.podName</a></td>
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
			<td>Target pod name for integrated mode.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--integration--kubernetes--validateManifest"><a href="./values.yaml#L306">ui.headplane.config.integration.kubernetes.validateManifest</a></td>
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
			<td>Validate target pod manifest for required properties.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--integration--proc--enabled"><a href="./values.yaml#L311">ui.headplane.config.integration.proc.enabled</a></td>
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
			<td>Enable native /proc integration.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--oidc--authorizationEndpoint"><a href="./values.yaml#L338">ui.headplane.config.oidc.authorizationEndpoint</a></td>
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
			<td>Optional OIDC authorization endpoint override.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--oidc--clientId"><a href="./values.yaml#L318">ui.headplane.config.oidc.clientId</a></td>
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
			<td>OIDC client ID.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--oidc--clientSecret"><a href="./values.yaml#L322">ui.headplane.config.oidc.clientSecret</a></td>
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
			<td>OIDC client secret value.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--oidc--clientSecretPath"><a href="./values.yaml#L324">ui.headplane.config.oidc.clientSecretPath</a></td>
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
			<td>OIDC client secret path (alternative to clientSecret).</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--oidc--disableApiKeyLogin"><a href="./values.yaml#L332">ui.headplane.config.oidc.disableApiKeyLogin</a></td>
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
			<td>Disable API key login when OIDC enabled.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--oidc--enabled"><a href="./values.yaml#L314">ui.headplane.config.oidc.enabled</a></td>
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
			<td>Enable OIDC SSO.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--oidc--extraParams"><a href="./values.yaml#L346">ui.headplane.config.oidc.extraParams</a></td>
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
			<td>Optional extra OIDC authorization query parameters.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--oidc--headscaleApiKey"><a href="./values.yaml#L326">ui.headplane.config.oidc.headscaleApiKey</a></td>
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
			<td>Headscale API key for SSO session login.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--oidc--headscaleApiKeyPath"><a href="./values.yaml#L328">ui.headplane.config.oidc.headscaleApiKeyPath</a></td>
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
			<td>Headscale API key path (alternative to headscaleApiKey).</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--oidc--issuer"><a href="./values.yaml#L316">ui.headplane.config.oidc.issuer</a></td>
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
			<td>OIDC issuer URL.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--oidc--profilePictureSource"><a href="./values.yaml#L336">ui.headplane.config.oidc.profilePictureSource</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"oidc"
</pre>
</div>
			</td>
			<td>Profile picture source (`oidc` or `gravatar`).</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--oidc--scope"><a href="./values.yaml#L334">ui.headplane.config.oidc.scope</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"openid email profile"
</pre>
</div>
			</td>
			<td>OIDC scope list.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--oidc--tokenEndpoint"><a href="./values.yaml#L340">ui.headplane.config.oidc.tokenEndpoint</a></td>
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
			<td>Optional OIDC token endpoint override.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--oidc--tokenEndpointAuthMethod"><a href="./values.yaml#L344">ui.headplane.config.oidc.tokenEndpointAuthMethod</a></td>
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
			<td>Optional token endpoint auth method.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--oidc--usePkce"><a href="./values.yaml#L330">ui.headplane.config.oidc.usePkce</a></td>
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
			<td>Use PKCE for OIDC auth.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--oidc--userinfoEndpoint"><a href="./values.yaml#L342">ui.headplane.config.oidc.userinfoEndpoint</a></td>
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
			<td>Optional OIDC userinfo endpoint override.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--publicUrl"><a href="./values.yaml#L268">ui.headplane.config.publicUrl</a></td>
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
			<td>Optional legacy alias for public headscale URL. @description Deprecated. Prefer `headscalePublicUrl`.</td>
		</tr>
		<tr>
			<td id="ui--headplane--config--serverHost"><a href="./values.yaml#L263">ui.headplane.config.serverHost</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"0.0.0.0"
</pre>
</div>
			</td>
			<td>Bind host for headplane server (server.host).</td>
		</tr>
		<tr>
			<td id="ui--headplane--env"><a href="./values.yaml#L235">ui.headplane.env</a></td>
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
			<td>Additional environment variables for `headplane` container.</td>
		</tr>
		<tr>
			<td id="ui--headplane--image--pullPolicy"><a href="./values.yaml#L231">ui.headplane.image.pullPolicy</a></td>
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
			<td id="ui--headplane--image--repository"><a href="./values.yaml#L229">ui.headplane.image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"ghcr.io/tale/headplane"
</pre>
</div>
			</td>
			<td>Image repository.</td>
		</tr>
		<tr>
			<td id="ui--headplane--image--tag"><a href="./values.yaml#L233">ui.headplane.image.tag</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"0.6.2"
</pre>
</div>
			</td>
			<td>Image tag.</td>
		</tr>
		<tr>
			<td id="ui--headplane--secret"><a href="./values.yaml#L351">ui.headplane.secret</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "cookieKey": "cookie-secret",
  "name": ""
}
</pre>
</div>
			</td>
			<td>Existing secret containing headplane session secrets. @description Must contain the cookie key when provider=headplane.</td>
		</tr>
		<tr>
			<td id="ui--headplane--service--annotations"><a href="./values.yaml#L240">ui.headplane.service.annotations</a></td>
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
			<td id="ui--headplane--service--port"><a href="./values.yaml#L242">ui.headplane.service.port</a></td>
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
			<td>Service port.</td>
		</tr>
		<tr>
			<td id="ui--headplane--service--targetPort"><a href="./values.yaml#L244">ui.headplane.service.targetPort</a></td>
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
			<td>Container target port.</td>
		</tr>
		<tr>
			<td id="ui--headplane--service--targetProtocol"><a href="./values.yaml#L246">ui.headplane.service.targetProtocol</a></td>
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
			<td id="ui--headplane--service--type"><a href="./values.yaml#L238">ui.headplane.service.type</a></td>
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
			<td id="ui--image"><a href="./values.yaml#L216">ui.image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "ghcr.io/gurucomputing/headscale-ui",
  "tag": "2026.03.17"
}
</pre>
</div>
			</td>
			<td>`headscale-ui` image configuration.</td>
		</tr>
		<tr>
			<td id="ui--image--pullPolicy"><a href="./values.yaml#L220">ui.image.pullPolicy</a></td>
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
			<td id="ui--image--repository"><a href="./values.yaml#L218">ui.image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"ghcr.io/gurucomputing/headscale-ui"
</pre>
</div>
			</td>
			<td>Image repository.</td>
		</tr>
		<tr>
			<td id="ui--image--tag"><a href="./values.yaml#L222">ui.image.tag</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"2026.03.17"
</pre>
</div>
			</td>
			<td>Image tag.</td>
		</tr>
		<tr>
			<td id="ui--ingress"><a href="./values.yaml#L416">ui.ingress</a></td>
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
      "host": "chart-example.local",
      "paths": [
        {
          "path": "/web",
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
			<td>Ingress configuration for selected UI provider. @description Use path `/web` for `headscale-ui` and `/admin` for `headplane` unless your reverse proxy setup differs.</td>
		</tr>
		<tr>
			<td id="ui--ingress--secureDefaults"><a href="./values.yaml#L422">ui.ingress.secureDefaults</a></td>
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
			<td>Secure-by-default ingress annotation settings. @description Applied by default and merged with ui.ingress.annotations (custom annotations win on key conflicts).</td>
		</tr>
		<tr>
			<td id="ui--livenessProbe"><a href="./values.yaml#L386">ui.livenessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 3,
  "initialDelaySeconds": 30,
  "periodSeconds": 10,
  "tcpSocket": {
    "port": "http"
  },
  "timeoutSeconds": 5
}
</pre>
</div>
			</td>
			<td>Liveness probe for UI container.</td>
		</tr>
		<tr>
			<td id="ui--nodeSelector"><a href="./values.yaml#L440">ui.nodeSelector</a></td>
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
			<td>Workload node selector for UI pods.</td>
		</tr>
		<tr>
			<td id="ui--podAnnotations"><a href="./values.yaml#L436">ui.podAnnotations</a></td>
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
			<td>Pod annotations for UI pods.</td>
		</tr>
		<tr>
			<td id="ui--podLabels"><a href="./values.yaml#L438">ui.podLabels</a></td>
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
			<td>Pod labels for UI pods.</td>
		</tr>
		<tr>
			<td id="ui--podSecurityContext"><a href="./values.yaml#L369">ui.podSecurityContext</a></td>
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
			<td>Pod-level security context for UI pods. @description When empty, the chart injects provider-specific writable-volume defaults: `fsGroup: 1000` for `headscale-ui` and `fsGroup: 65532` for `headplane`.</td>
		</tr>
		<tr>
			<td id="ui--provider"><a href="./values.yaml#L212">ui.provider</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"headscale-ui"
</pre>
</div>
			</td>
			<td>UI provider (`headscale-ui` or `headplane`).</td>
		</tr>
		<tr>
			<td id="ui--readinessProbe"><a href="./values.yaml#L394">ui.readinessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 3,
  "initialDelaySeconds": 10,
  "periodSeconds": 5,
  "tcpSocket": {
    "port": "http"
  },
  "timeoutSeconds": 3
}
</pre>
</div>
			</td>
			<td>Readiness probe for UI container.</td>
		</tr>
		<tr>
			<td id="ui--replicaCount"><a href="./values.yaml#L214">ui.replicaCount</a></td>
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
			<td>Number of UI pod replicas.</td>
		</tr>
		<tr>
			<td id="ui--resources"><a href="./values.yaml#L360">ui.resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "cpu": "500m",
    "memory": "256Mi"
  },
  "requests": {
    "cpu": "50m",
    "memory": "64Mi"
  }
}
</pre>
</div>
			</td>
			<td>UI resource requests/limits.</td>
		</tr>
		<tr>
			<td id="ui--securityContext"><a href="./values.yaml#L372">ui.securityContext</a></td>
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
  "runAsNonRoot": true,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}
</pre>
</div>
			</td>
			<td>Container-level security context for UI container. @description The chart adds provider-specific numeric `runAsUser`/`runAsGroup` defaults when they are not set: `1000` for `headscale-ui` (Alpine appuser) and `65532` for `headplane` (Distroless-compatible non-root runtime).</td>
		</tr>
		<tr>
			<td id="ui--service"><a href="./values.yaml#L402">ui.service</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "port": 8080,
  "targetPort": 8080,
  "targetProtocol": "TCP",
  "type": "ClusterIP"
}
</pre>
</div>
			</td>
			<td>Kubernetes Service configuration for `headscale-ui` provider.</td>
		</tr>
		<tr>
			<td id="ui--service--annotations"><a href="./values.yaml#L406">ui.service.annotations</a></td>
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
			<td id="ui--service--port"><a href="./values.yaml#L408">ui.service.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
8080
</pre>
</div>
			</td>
			<td>Service port.</td>
		</tr>
		<tr>
			<td id="ui--service--targetPort"><a href="./values.yaml#L411">ui.service.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
8080
</pre>
</div>
			</td>
			<td>Container target port. @description If you override this, also set ui.env.HTTP_PORT to the same value.</td>
		</tr>
		<tr>
			<td id="ui--service--targetProtocol"><a href="./values.yaml#L413">ui.service.targetProtocol</a></td>
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
			<td id="ui--service--type"><a href="./values.yaml#L404">ui.service.type</a></td>
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
			<td id="ui--storage"><a href="./values.yaml#L382">ui.storage</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "dataDirSizeLimit": "128Mi",
  "tmpDirSizeLimit": "32Mi"
}
</pre>
</div>
			</td>
			<td>Ephemeral directory sizing for UI runtime.</td>
		</tr>
		<tr>
			<td id="ui--tolerations"><a href="./values.yaml#L442">ui.tolerations</a></td>
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
			<td>Workload tolerations for UI pods.</td>
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

### Important operational notes

* Upstream headscale currently recommends SQLite for most setups. This chart therefore defaults to `database.mode=sqlite`.
* PostgreSQL support stays optional for integration scenarios and is exposed via `database.mode=postgres`.
* Service exposure is intentionally ClusterIP-only. External access should be done via ingress/reverse-proxy according to your platform standards.
* The chart supports consuming an existing in-namespace CNPG app secret (`database.useCnpgCluster.*`) for PostgreSQL credentials.
* Optional UI deployment is available under `ui.enabled=true` and stays disabled by default.
* `ui.provider` supports `headscale-ui` (default) and `headplane`.
* `headscale-ui` should usually be exposed on the same host via `/web` (for CORS compatibility with headscale API), using `ui.ingress.*`.
* `headplane` config is rendered against upstream 0.6.1 schema and requires an existing secret (`ui.headplane.secret.*`) for session cookie secret path support.
* The chart injects provider-specific numeric UI runtime IDs by default so Kubernetes can enforce `runAsNonRoot`: `1000:1000` for `headscale-ui` and `65532:65532` for `headplane`.
