---
title: "Nodos"
draft: false
weight: 1
---

## Debuguear a nivel del Nodo


### Logs del Nodo

```bash
oc adm node-logs <nodo>
```

### Logs del Nodo - Tail
```bash
oc adm node-logs --tail=20  <node> #por ejemplo las ultimas 20 lineas
```

### Logs del nodo - Solo Kubelet

```bash
 oc adm node-logs -u kubelet.service <nodo>
 ```

 ### Logs del nodo - Listar archivos de logs 

```bash
oc adm node-logs --path=/ <nodo>

[root@ovwbastion ~] oc adm node-logs --path=/ ovwworker-0.cap01.corp.ute.com.uy
audit/
btmp
chrony/
containers/
crio/
es-containers.log.pos
fluentd/
glusterfs/
journal/
journal_pos.json
lastlog
openvswitch/
pods/
private/
rhsm/
samba/
sssd/
vmware-network.log
vmware-vgauthsvc.log.0
vmware-vmsvc.1.log
vmware-vmsvc.10.log
vmware-vmsvc.2.log
vmware-vmsvc.3.log
vmware-vmsvc.4.log
vmware-vmsvc.5.log
vmware-vmsvc.6.log
vmware-vmsvc.7.log
vmware-vmsvc.8.log
vmware-vmsvc.9.log
vmware-vmsvc.log
wtmp
```

### Logs del nodo - Obetener un log en particular

```bash
oc adm node-logs --path=audit/audit.log <node>
```

## Tools de diagnóstico sobre el Nodo

Openshift 4.x esta corre sobre RedHat CoreOS, lo cual hace que debamos de buscar alternativas si necesitamos ejecutar tareas de diagnostico como tcpdump. Para esto, es viable usar un container con privilegios sobre el nodo en cuestión y ejecutar en ese sandbox las tareas de diagnóstico necesarias.  

```bash
oc debug node/<node> --image=rhel7/rhel-tools
```