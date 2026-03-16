

# derper

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.94.2](https://img.shields.io/badge/AppVersion-1.94.2-informational?style=flat-square)

A Helm chart for running a Tailscale DERP relay on Kubernetes.

**Homepage:** <https://github.com/CodeAdminDe/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Frederic Roggon | <frederic.roggon@codeadmin.de> | <https://github.com/CodeAdminDe> |

## TL;DR

You don't want to read through the docs? That's the quick and dirty way:

```bash
helm repo add codeadminde https://codeadminde.github.io/helm-charts/
helm repo update
helm install derper codeadminde/derper
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

To install the chart with the release name `derper`

```bash
helm install derper codeadminde/derper
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

## Uninstallation

To uninstall the chart release named `derper`

```bash
helm uninstall derper
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
> helm install derper codeadminde/derper -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Then you have to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install derper --set key=value --set keyTwo=secondValue codeadminde/derper
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
			<td id="affinity"><a href="./values.yaml#L244">affinity</a></td>
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
			<td id="applyHealthChecks"><a href="./values.yaml#L71">applyHealthChecks</a></td>
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
			<td>Apply readiness and liveness probes from values.</td>
		</tr>
		<tr>
			<td id="applySecurity"><a href="./values.yaml#L68">applySecurity</a></td>
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
			<td id="certificates"><a href="./values.yaml#L125">certificates</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "acmeEmail": "",
  "certDir": "/var/lib/derper/certs",
  "manual": {
    "crtKey": "tls.crt",
    "existingSecret": "",
    "keyKey": "tls.key"
  },
  "mode": "letsencrypt"
}
</pre>
</div>
			</td>
			<td>Certificate management configuration.</td>
		</tr>
		<tr>
			<td id="certificates--acmeEmail"><a href="./values.yaml#L131">certificates.acmeEmail</a></td>
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
			<td>Optional ACME contact email for `letsencrypt`.</td>
		</tr>
		<tr>
			<td id="certificates--certDir"><a href="./values.yaml#L129">certificates.certDir</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/var/lib/derper/certs"
</pre>
</div>
			</td>
			<td>Certificate directory passed to `-certdir`.</td>
		</tr>
		<tr>
			<td id="certificates--manual--crtKey"><a href="./values.yaml#L136">certificates.manual.crtKey</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"tls.crt"
</pre>
</div>
			</td>
			<td>Secret key containing the PEM certificate.</td>
		</tr>
		<tr>
			<td id="certificates--manual--existingSecret"><a href="./values.yaml#L134">certificates.manual.existingSecret</a></td>
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
			<td>Existing secret providing certificate material for `manual` mode.</td>
		</tr>
		<tr>
			<td id="certificates--manual--keyKey"><a href="./values.yaml#L138">certificates.manual.keyKey</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"tls.key"
</pre>
</div>
			</td>
			<td>Secret key containing the PEM private key.</td>
		</tr>
		<tr>
			<td id="certificates--mode"><a href="./values.yaml#L127">certificates.mode</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"letsencrypt"
</pre>
</div>
			</td>
			<td>Certificate mode passed to `-certmode`. Supported values: `letsencrypt`, `manual`.</td>
		</tr>
		<tr>
			<td id="cnps"><a href="./values.yaml#L209">cnps</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "egress": {
    "dnsEndpoints": [
      {
        "matchLabels": {
          "io.kubernetes.pod.namespace": "kube-system",
          "k8s-app": "kube-dns"
        }
      },
      {
        "matchLabels": {
          "app.kubernetes.io/name": "coredns",
          "io.kubernetes.pod.namespace": "kube-system"
        }
      }
    ],
    "extraRules": [],
    "worldPorts": [
      {
        "port": "443",
        "protocol": "TCP"
      }
    ]
  },
  "enabled": false,
  "ingress": {
    "extraRules": []
  }
}
</pre>
</div>
			</td>
			<td>Optional native CiliumNetworkPolicy configuration. This chart intentionally does not depend on `libchart-cnps`.</td>
		</tr>
		<tr>
			<td id="cnps--egress--dnsEndpoints"><a href="./values.yaml#L217">cnps.egress.dnsEndpoints</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "matchLabels": {
      "io.kubernetes.pod.namespace": "kube-system",
      "k8s-app": "kube-dns"
    }
  },
  {
    "matchLabels": {
      "app.kubernetes.io/name": "coredns",
      "io.kubernetes.pod.namespace": "kube-system"
    }
  }
]
</pre>
</div>
			</td>
			<td>Default DNS endpoint selectors for kube-dns/CoreDNS.</td>
		</tr>
		<tr>
			<td id="cnps--egress--extraRules"><a href="./values.yaml#L229">cnps.egress.extraRules</a></td>
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
			<td>Additional egress rules appended after the built-in DNS and world egress rules.</td>
		</tr>
		<tr>
			<td id="cnps--egress--worldPorts"><a href="./values.yaml#L225">cnps.egress.worldPorts</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "port": "443",
    "protocol": "TCP"
  }
]
</pre>
</div>
			</td>
			<td>Default world egress ports for ACME, `verify-client-url`, and optional DERP mesh traffic.</td>
		</tr>
		<tr>
			<td id="cnps--enabled"><a href="./values.yaml#L211">cnps.enabled</a></td>
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
			<td>Enable DERP-specific CiliumNetworkPolicy rendering.</td>
		</tr>
		<tr>
			<td id="cnps--ingress--extraRules"><a href="./values.yaml#L214">cnps.ingress.extraRules</a></td>
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
			<td>Additional ingress rules appended after the built-in world-to-DERP rule.</td>
		</tr>
		<tr>
			<td id="derper"><a href="./values.yaml#L96">derper</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "addr": ":443",
  "configPath": "/var/lib/derper/derper.key",
  "extraArgs": [],
  "home": "blank",
  "hostname": "derp.example.com",
  "httpPort": 8080,
  "mesh": {
    "enabled": false,
    "pskSecret": {
      "key": "mesh-psk",
      "name": ""
    },
    "with": []
  },
  "verifyClientUrl": "",
  "verifyClientUrlFailOpen": false
}
</pre>
</div>
			</td>
			<td>DERP process configuration.</td>
		</tr>
		<tr>
			<td id="derper--addr"><a href="./values.yaml#L100">derper.addr</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
":443"
</pre>
</div>
			</td>
			<td>DERP HTTPS listen address passed to `-a`. `letsencrypt` requires `:443`.</td>
		</tr>
		<tr>
			<td id="derper--configPath"><a href="./values.yaml#L104">derper.configPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/var/lib/derper/derper.key"
</pre>
</div>
			</td>
			<td>Persistent DERP config file passed to `-c`.</td>
		</tr>
		<tr>
			<td id="derper--extraArgs"><a href="./values.yaml#L112">derper.extraArgs</a></td>
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
			<td>Extra DERP arguments appended verbatim to the container args list.</td>
		</tr>
		<tr>
			<td id="derper--home"><a href="./values.yaml#L106">derper.home</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"blank"
</pre>
</div>
			</td>
			<td>Value passed to `-home`. Use `blank` for an empty landing page.</td>
		</tr>
		<tr>
			<td id="derper--hostname"><a href="./values.yaml#L98">derper.hostname</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"derp.example.com"
</pre>
</div>
			</td>
			<td>Public DERP hostname used for TLS and DERP map entries.</td>
		</tr>
		<tr>
			<td id="derper--httpPort"><a href="./values.yaml#L102">derper.httpPort</a></td>
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
			<td>DERP HTTP listen port passed to `-http-port` when `service.http.enabled=true`.</td>
		</tr>
		<tr>
			<td id="derper--mesh--enabled"><a href="./values.yaml#L115">derper.mesh.enabled</a></td>
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
			<td>Enable DERP mesh configuration.</td>
		</tr>
		<tr>
			<td id="derper--mesh--pskSecret--key"><a href="./values.yaml#L120">derper.mesh.pskSecret.key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"mesh-psk"
</pre>
</div>
			</td>
			<td>Secret key containing the DERP mesh PSK value.</td>
		</tr>
		<tr>
			<td id="derper--mesh--pskSecret--name"><a href="./values.yaml#L118">derper.mesh.pskSecret.name</a></td>
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
			<td>Existing secret containing the DERP mesh PSK.</td>
		</tr>
		<tr>
			<td id="derper--mesh--with"><a href="./values.yaml#L122">derper.mesh.with</a></td>
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
			<td>List of DERP peers passed to `-mesh-with` as a comma-separated list.</td>
		</tr>
		<tr>
			<td id="derper--verifyClientUrl"><a href="./values.yaml#L108">derper.verifyClientUrl</a></td>
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
			<td>Optional Headscale admission controller URL passed to `-verify-client-url`.</td>
		</tr>
		<tr>
			<td id="derper--verifyClientUrlFailOpen"><a href="./values.yaml#L110">derper.verifyClientUrlFailOpen</a></td>
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
			<td>Fail-open setting for `-verify-client-url-fail-open`.</td>
		</tr>
		<tr>
			<td id="extraEnv"><a href="./values.yaml#L206">extraEnv</a></td>
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
			<td>Extra environment variables passed to the DERP container.</td>
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
			<td id="image"><a href="./values.yaml#L9">image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "ghcr.io/codeadminde/derper",
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
			<td>DERP image pull policy.</td>
		</tr>
		<tr>
			<td id="image--repository"><a href="./values.yaml#L11">image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"ghcr.io/codeadminde/derper"
</pre>
</div>
			</td>
			<td>DERP image repository.</td>
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
			<td>DERP image tag override (defaults to `.Chart.AppVersion` when empty).</td>
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
			<td id="nodeSelector"><a href="./values.yaml#L238">nodeSelector</a></td>
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
			<td id="persistence"><a href="./values.yaml#L141">persistence</a></td>
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
  "emptyDirSizeLimit": "16Mi",
  "enabled": true,
  "existingClaim": "",
  "retain": false,
  "size": "16Mi",
  "storageClass": "",
  "volumeName": ""
}
</pre>
</div>
			</td>
			<td>Persistence settings for the DERP config file and ACME cache.</td>
		</tr>
		<tr>
			<td id="persistence--accessModes"><a href="./values.yaml#L151">persistence.accessModes</a></td>
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
			<td id="persistence--annotations"><a href="./values.yaml#L154">persistence.annotations</a></td>
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
			<td id="persistence--emptyDirSizeLimit"><a href="./values.yaml#L160">persistence.emptyDirSizeLimit</a></td>
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
			<td>`emptyDir` size limit when `persistence.enabled=false`.</td>
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
			<td>Enable persistent storage for DERP state.</td>
		</tr>
		<tr>
			<td id="persistence--existingClaim"><a href="./values.yaml#L145">persistence.existingClaim</a></td>
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
			<td>Existing PVC name to reuse instead of creating one.</td>
		</tr>
		<tr>
			<td id="persistence--retain"><a href="./values.yaml#L158">persistence.retain</a></td>
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
			<td>Keep the PVC on uninstall.</td>
		</tr>
		<tr>
			<td id="persistence--size"><a href="./values.yaml#L147">persistence.size</a></td>
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
			<td>PVC size when the chart creates a claim.</td>
		</tr>
		<tr>
			<td id="persistence--storageClass"><a href="./values.yaml#L149">persistence.storageClass</a></td>
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
			<td>PVC storage class. Empty uses the cluster default.</td>
		</tr>
		<tr>
			<td id="persistence--volumeName"><a href="./values.yaml#L156">persistence.volumeName</a></td>
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
			<td>Optional PVC volume name.</td>
		</tr>
		<tr>
			<td id="podAnnotations"><a href="./values.yaml#L232">podAnnotations</a></td>
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
			<td id="podLabels"><a href="./values.yaml#L235">podLabels</a></td>
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
			<td id="podSecurityContext"><a href="./values.yaml#L74">podSecurityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "fsGroup": 65532,
  "sysctls": [
    {
      "name": "net.ipv4.ip_unprivileged_port_start",
      "value": "443"
    }
  ]
}
</pre>
</div>
			</td>
			<td>Pod-level security context for DERP pods.</td>
		</tr>
		<tr>
			<td id="podSecurityContext--sysctls"><a href="./values.yaml#L78">podSecurityContext.sysctls</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "name": "net.ipv4.ip_unprivileged_port_start",
    "value": "443"
  }
]
</pre>
</div>
			</td>
			<td>Safe sysctls applied to the DERP pod. @description `net.ipv4.ip_unprivileged_port_start=443` keeps the container non-root while still allowing DERP to bind `:443` for `certificates.mode=letsencrypt`.</td>
		</tr>
		<tr>
			<td id="probes"><a href="./values.yaml#L172">probes</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "liveness": {
    "enabled": true,
    "failureThreshold": 3,
    "initialDelaySeconds": 30,
    "periodSeconds": 10,
    "tcpSocket": {
      "port": "https"
    },
    "timeoutSeconds": 5
  },
  "readiness": {
    "enabled": true,
    "failureThreshold": 3,
    "initialDelaySeconds": 10,
    "periodSeconds": 5,
    "tcpSocket": {
      "port": "https"
    },
    "timeoutSeconds": 3
  }
}
</pre>
</div>
			</td>
			<td>DERP health probe configuration. TCP probes are the safest default because kubelet probes the Pod IP directly.</td>
		</tr>
		<tr>
			<td id="probes--liveness--enabled"><a href="./values.yaml#L175">probes.liveness.enabled</a></td>
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
			<td>Enable liveness probe.</td>
		</tr>
		<tr>
			<td id="probes--readiness--enabled"><a href="./values.yaml#L184">probes.readiness.enabled</a></td>
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
			<td>Enable readiness probe.</td>
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
			<td>Number of DERP pod replicas. This chart only supports a single replica.</td>
		</tr>
		<tr>
			<td id="resources"><a href="./values.yaml#L193">resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "memory": "512Mi"
  },
  "requests": {
    "cpu": "100m",
    "memory": "128Mi"
  }
}
</pre>
</div>
			</td>
			<td>Resource requests and limits.</td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L201">runtimeClass</a></td>
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
			<td id="securityContext"><a href="./values.yaml#L83">securityContext</a></td>
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
			<td>Container-level security context for the DERP container.</td>
		</tr>
		<tr>
			<td id="service"><a href="./values.yaml#L21">service</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "allocateLoadBalancerNodePorts": true,
  "annotations": {},
  "externalIPs": [],
  "externalTrafficPolicy": "Local",
  "http": {
    "enabled": true,
    "port": 80,
    "targetPort": 8080
  },
  "https": {
    "enabled": true,
    "port": 443,
    "targetPort": 443
  },
  "internalTrafficPolicy": "Cluster",
  "loadBalancerIP": "",
  "type": "LoadBalancer"
}
</pre>
</div>
			</td>
			<td>Kubernetes Service configuration for direct DERP exposure.</td>
		</tr>
		<tr>
			<td id="service--allocateLoadBalancerNodePorts"><a href="./values.yaml#L31">service.allocateLoadBalancerNodePorts</a></td>
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
			<td>Disable node port allocation for `LoadBalancer` services when supported by the cluster.</td>
		</tr>
		<tr>
			<td id="service--annotations"><a href="./values.yaml#L25">service.annotations</a></td>
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
			<td>Service annotations, for example provider-specific load balancer configuration.</td>
		</tr>
		<tr>
			<td id="service--externalIPs"><a href="./values.yaml#L35">service.externalIPs</a></td>
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
			<td>Optional list of external IPs.</td>
		</tr>
		<tr>
			<td id="service--externalTrafficPolicy"><a href="./values.yaml#L27">service.externalTrafficPolicy</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"Local"
</pre>
</div>
			</td>
			<td>External traffic policy for `LoadBalancer` or `NodePort` services.</td>
		</tr>
		<tr>
			<td id="service--http--enabled"><a href="./values.yaml#L38">service.http.enabled</a></td>
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
			<td>Expose TCP/80 for ACME HTTP-01 and optional plain HTTP handling.</td>
		</tr>
		<tr>
			<td id="service--http--port"><a href="./values.yaml#L40">service.http.port</a></td>
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
			<td>Service port for HTTP.</td>
		</tr>
		<tr>
			<td id="service--http--targetPort"><a href="./values.yaml#L42">service.http.targetPort</a></td>
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
			<td>Container target port for HTTP.</td>
		</tr>
		<tr>
			<td id="service--https--enabled"><a href="./values.yaml#L45">service.https.enabled</a></td>
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
			<td>Expose TCP/443 for DERP-over-TLS traffic.</td>
		</tr>
		<tr>
			<td id="service--https--port"><a href="./values.yaml#L47">service.https.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
443
</pre>
</div>
			</td>
			<td>Service port for HTTPS.</td>
		</tr>
		<tr>
			<td id="service--https--targetPort"><a href="./values.yaml#L49">service.https.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
443
</pre>
</div>
			</td>
			<td>Container target port for HTTPS. `letsencrypt` requires DERP itself to listen on `443`.</td>
		</tr>
		<tr>
			<td id="service--internalTrafficPolicy"><a href="./values.yaml#L29">service.internalTrafficPolicy</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"Cluster"
</pre>
</div>
			</td>
			<td>Internal traffic policy. Empty omits the field.</td>
		</tr>
		<tr>
			<td id="service--loadBalancerIP"><a href="./values.yaml#L33">service.loadBalancerIP</a></td>
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
			<td>Optional static load balancer IP.</td>
		</tr>
		<tr>
			<td id="service--type"><a href="./values.yaml#L23">service.type</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"LoadBalancer"
</pre>
</div>
			</td>
			<td>Service type. `LoadBalancer` is the intended default for direct DERP exposure.</td>
		</tr>
		<tr>
			<td id="serviceAccount"><a href="./values.yaml#L61">serviceAccount</a></td>
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
			<td id="stun"><a href="./values.yaml#L52">stun</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "port": 3478,
  "targetPort": 3478
}
</pre>
</div>
			</td>
			<td>Integrated STUN listener configuration. Keep disabled when STUN is provided by an external Coturn deployment.</td>
		</tr>
		<tr>
			<td id="stun--enabled"><a href="./values.yaml#L54">stun.enabled</a></td>
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
			<td>Enable integrated STUN and expose UDP on the Service.</td>
		</tr>
		<tr>
			<td id="stun--port"><a href="./values.yaml#L56">stun.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3478
</pre>
</div>
			</td>
			<td>Service port for STUN.</td>
		</tr>
		<tr>
			<td id="stun--targetPort"><a href="./values.yaml#L58">stun.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3478
</pre>
</div>
			</td>
			<td>Container target port for STUN.</td>
		</tr>
		<tr>
			<td id="tmpVolume"><a href="./values.yaml#L163">tmpVolume</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "mountPath": "/tmp",
  "sizeLimit": "64Mi"
}
</pre>
</div>
			</td>
			<td>Temporary writable volume configuration for `/tmp`.</td>
		</tr>
		<tr>
			<td id="tmpVolume--enabled"><a href="./values.yaml#L165">tmpVolume.enabled</a></td>
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
			<td>Enable a writable `emptyDir` for `/tmp`.</td>
		</tr>
		<tr>
			<td id="tmpVolume--mountPath"><a href="./values.yaml#L167">tmpVolume.mountPath</a></td>
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
			<td>Mount path for the tmp volume.</td>
		</tr>
		<tr>
			<td id="tmpVolume--sizeLimit"><a href="./values.yaml#L169">tmpVolume.sizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"64Mi"
</pre>
</div>
			</td>
			<td>Optional tmp volume size limit.</td>
		</tr>
		<tr>
			<td id="tolerations"><a href="./values.yaml#L241">tolerations</a></td>
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

## Chart without NetworkPolicies

Please note that this chart does not provide any network policies itself.
Therefore, I recommend the implementation of network policies before using in prod environments.

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

* This chart intentionally renders no `Ingress` and no `HTTPRoute`. `derper` must be exposed directly via the Kubernetes `Service`.
* Default `letsencrypt` mode binds DERP directly on container port `443/tcp`; the chart keeps non-root by setting `net.ipv4.ip_unprivileged_port_start=443` instead of adding extra Linux capabilities.
* Plain HTTP stays on `8080/tcp` by default and is exposed via Service port `80` for ACME HTTP-01.
* The chart always passes `-c /var/lib/derper/derper.key` to preserve DERP node key behavior in non-root mode. Keep this path on persistent storage for stable node identity.
* `certificates.mode=letsencrypt` requires `derper` itself to listen on `:443`; mapping Service port `443` to a higher in-container port is not sufficient.
* `certificates.mode=manual` mounts an existing secret so that DERP sees files as `/var/lib/derper/certs/<hostname>.crt` and `/var/lib/derper/certs/<hostname>.key`, matching upstream expectations.
* `stun.enabled=false` is the intended default when STUN comes from an external `coturn` deployment.
* `derper.verifyClientUrl` is the preferred admission path for Headscale in this repo. The chart intentionally does not expose `--verify-clients`, which would require a colocated `tailscaled`.
* The chart ships an optional native `CiliumNetworkPolicy` instead of depending on `libchart-cnps`, because DERP is not an ingress-controller-backed HTTP application.
* Upstream `/debug/` endpoints are only intended for localhost or Tailscale-reachable access. This chart does not expose them separately.

### Headscale integration

Use a static DERP map in Headscale and disable the default DERP feed:

```yaml
derp:
  server:
    enabled: false
  urls: []
  paths:
    - /etc/headscale/derp.yaml
  auto_update_enabled: false
  update_frequency: 0s
```

### Example values for the first rollout

```yaml
image:
  repository: ghcr.io/codeadminde/derper
  tag: "1.94.2"

service:
  type: LoadBalancer
  externalTrafficPolicy: Local
  externalIPs:
    - 91.99.10.12
  http:
    enabled: true
    port: 80
    targetPort: 8080
  https:
    enabled: true
    port: 443
    targetPort: 443

stun:
  enabled: false

derper:
  hostname: relst01.codeadmin.de
  addr: ":443"
  httpPort: 8080
  configPath: /var/lib/derper/derper.key
  verifyClientUrl: https://canet.codeadmin.de/verify
  verifyClientUrlFailOpen: false
  home: blank

certificates:
  mode: letsencrypt
  certDir: /var/lib/derper/certs

persistence:
  enabled: true
  storageClass: local-path
  size: 16Mi

resources:
  requests:
    cpu: 100m
    memory: 128Mi
  limits:
    memory: 512Mi
```
