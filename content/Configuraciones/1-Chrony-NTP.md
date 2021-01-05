---
title: "NTP Conf"
draft: false
weight: 1
---

Red Hat CoreOS usa chrony para sincronizar la hora contra un servidor de Reloj. La conf por omisión usa *.rhel.pool.ntp.org. Para cambiar a uno custom debemos hacer lo siguiente:

## Generar el archivo chrony.conf

Debemos de generar el archivo chrony.conf en base64:

```bash
cat << EOF | base64
server 192.168.9.10
driftfile /var/lib/chrony/drift
makestep 1.0 3
rtcsync
logdir /var/log/chrony
EOF
```

La salida deberia ser algo similar a:

```base64
c2VydmVyIDE5Mi4xNjguOS4xMApkcmlmdGZpbGUgL3Zhci9saWIvY2hyb255L2RyaWZ0Cm1ha2Vz
dGVwIDEuMCAzCnJ0Y3N5bmMKbG9nZGlyIC92YXIvbG9nL2Nocm9ueQo=
```

## Generar MachineConfig Object

En source hay que agregar el string en base64:

```yaml
cat << EOF > ./masters-chrony-configuration.yaml
apiVersion: machineconfiguration.openshift.io/v1
kind: MachineConfig
metadata:
labels:
machineconfiguration.openshift.io/role: master
name: masters-chrony-configuration
spec:
config:
ignition:
config: {}
  security:
    tls: {}
  timeouts: {}
  version: 2.2.0
networkd: {}
passwd: {}
storage:
  files:
  - contents:
      source: data:text/plain;charset=utf-8;base64,c2VydmVyIDE5Mi4xNjguOS4xMApkcmlmdGZpbGUgL3Zhci9saWIvY2hyb255L2RyaWZ0Cm1ha2Vz
dGVwIDEuMCAzCnJ0Y3N5bmMKbG9nZGlyIC92YXIvbG9nL2Nocm9ueQo=
      verification: {}
    filesystem: root
    mode: 420
    path: /etc/chrony.conf
osImageURL: ""
EOF
```
Análogamente, se puede generar el object para los Workers, basta con generar un nuevo archivo y reemplazar el label **machineconfiguration.openshift.io/role: master** por **machineconfiguration.openshift.io/role: worker** y el nombre del objeto por **workers-chrony-configuration**

## Impactar el archivo

```bash
oc apply -f {masters,workers}-chrony-configuration.yaml
```
