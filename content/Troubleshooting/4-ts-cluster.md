---
title: "Cluster"
draft: false
weight: 1
---

## Validar el estado del cluster

Algunos comandos sencillos para validar el estado del cluster usando la consola.

* Listar Nodos
* Traerse los últimos eventos de los nodos
* Ver información específica de un nodo/s

### Loguearse al Cluster

Login con un usuario con permisos de **cluster-admin**  

```bash
[root@ovwbastion ~]# oc login -u kubeadmin --server=https://api.cap01.corp.ute.com.uy:6443
Authentication required for https://api.cap01.corp.ute.com.uy:6443 (openshift)
Username: kubeadmin
Password:
Login successful.

You have access to 101 projects, the list has been suppressed. You can list all projects with 'oc projects'

Using project "openshift-authentication".
```
  
### Listar Nodos / Estado de Nodos

Revisar si los nodos estan **Ready** o **NotReady**  

```bash
[root@ovwbastion ~]# oc get nodes
NAME                                STATUS   ROLES    AGE    VERSION
ovwmaster-0.cap01.corp.ute.com.uy   Ready    master   400d   v1.17.1+9d33dd3
ovwmaster-1.cap01.corp.ute.com.uy   Ready    master   400d   v1.17.1+9d33dd3
ovwmaster-2.cap01.corp.ute.com.uy   Ready    master   400d   v1.17.1+9d33dd3
ovwworker-0.cap01.corp.ute.com.uy   Ready    worker   400d   v1.17.1+9d33dd3
ovwworker-1.cap01.corp.ute.com.uy   Ready    worker   400d   v1.17.1+9d33dd3
ovwworker-2.cap01.corp.ute.com.uy   Ready    worker   400d   v1.17.1+9d33dd3
ovwworker-3.cap01.corp.ute.com.uy   Ready    worker   400d   v1.17.1+9d33dd3
ovwworker-4.cap01.corp.ute.com.uy   Ready    worker   398d   v1.17.1+9d33dd3
```

### Describe de un nodo


La orden Describe muestra información útil a la hora de revisar si hay problemas con un nodo en particular.  
Entre otros datos, se ven las etiquetas (útiles a la hora de crear reglas de afinidad de PODs), eventos, estado del nodo, cantidad de PODs, etc.


```bash
[root@ovwbastion ~]# oc describe node ovwworker-0.cap01.corp.ute.com.uy
Name:               ovwworker-0.cap01.corp.ute.com.uy
Roles:              worker
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/os=linux
                    elasticsearch=true
                    kubernetes.io/arch=amd64
                    kubernetes.io/hostname=ovwworker-0.cap01.corp.ute.com.uy
                    kubernetes.io/os=linux
                    node-role.kubernetes.io/worker=
                    node.openshift.io/os_id=rhcos
Annotations:        machineconfiguration.openshift.io/currentConfig: rendered-worker-e6216c14c54fab8cec59a5cb6135f678
                    machineconfiguration.openshift.io/desiredConfig: rendered-worker-e6216c14c54fab8cec59a5cb6135f678
                    machineconfiguration.openshift.io/reason:
                    machineconfiguration.openshift.io/state: Done
                    volumes.kubernetes.io/controller-managed-attach-detach: true
CreationTimestamp:  Wed, 04 Dec 2019 16:29:03 -0300
Taints:             <none>
Unschedulable:      false
Conditions:
  Type             Status  LastHeartbeatTime                 LastTransitionTime                Reason                       Message
  ----             ------  -----------------                 ------------------                ------                       -------
  MemoryPressure   False   Thu, 07 Jan 2021 17:40:00 -0300   Tue, 05 Jan 2021 16:47:32 -0300   KubeletHasSufficientMemory   kubelet has sufficient memory available
  DiskPressure     False   Thu, 07 Jan 2021 17:40:00 -0300   Tue, 05 Jan 2021 16:47:32 -0300   KubeletHasNoDiskPressure     kubelet has no disk pressure
  PIDPressure      False   Thu, 07 Jan 2021 17:40:00 -0300   Tue, 05 Jan 2021 16:47:32 -0300   KubeletHasSufficientPID      kubelet has sufficient PID available
  Ready            True    Thu, 07 Jan 2021 17:40:00 -0300   Tue, 05 Jan 2021 16:47:42 -0300   KubeletReady                 kubelet is posting ready status
Addresses:
  ExternalIP:  172.26.174.41
  InternalIP:  172.26.174.41
  Hostname:    ovwworker-0.cap01.corp.ute.com.uy
Capacity:
 cpu:                4
 ephemeral-storage:  124768236Ki
 hugepages-1Gi:      0
 hugepages-2Mi:      0
 memory:             32936448Ki
 pods:               250
Allocatable:
 cpu:                3500m
 ephemeral-storage:  113912664284
 hugepages-1Gi:      0
 hugepages-2Mi:      0
 memory:             31785472Ki
 pods:               250
System Info:
 Machine ID:                              17e6f36f835f4581bc9e48d815ac7b38
 System UUID:                             1bfb0242-6d78-cd41-fa61-4061c2a71403
 Boot ID:                                 ac932398-ab09-4412-9e84-4500e0962695
 Kernel Version:                          4.18.0-147.20.1.el8_1.x86_64
 OS Image:                                Red Hat Enterprise Linux CoreOS 44.81.202006220834-0 (Ootpa)
 Operating System:                        linux
 Architecture:                            amd64
 Container Runtime Version:               cri-o://1.17.4-18.dev.rhaos4.4.gitfb8131a.el8
 Kubelet Version:                         v1.17.1+9d33dd3
 Kube-Proxy Version:                      v1.17.1+9d33dd3
ProviderID:                               vsphere://4202fb1b-786d-41cd-fa61-4061c2a71403
Non-terminated Pods:                      (28 in total)
  Namespace                               Name                                             CPU Requests  CPU Limits   Memory Requests  Memory Limits  AGE
  ---------                               ----                                             ------------  ----------   ---------------  -------------  ---
  cap-usuarios-backend                    jenkins-4-tg4fw                                  100m (2%)     100m (2%)    500Mi (1%)       500Mi (1%)     2d
  encuestas-dev                           adminbackend-3-49gxs                             100m (2%)     100m (2%)    512Mi (1%)       512Mi (1%)     2d
  idealx-dev                              usuario-backend-11-mskxl                         100m (2%)     100m (2%)    64Mi (0%)        512Mi (1%)     2d
  idealx-prod                             presentacion-admin-9-lqfj4                       100m (2%)     100m (2%)    64Mi (0%)        512Mi (1%)     2d
  idealx-test                             presentacion-usuarios-8-dbphl                    100m (2%)     100m (2%)    64Mi (0%)        512Mi (1%)     2d
  nexus                                   nexus-6-2wmgs                                    300m (8%)     500m (14%)   1Gi (3%)         2Gi (6%)       2d
  omnicanalsms                            omnicanalsms-1-z96v4                             100m (2%)     100m (2%)    512Mi (1%)       512Mi (1%)     2d
  openshift-cluster-node-tuning-operator  tuned-lpr7q                                      10m (0%)      0 (0%)       50Mi (0%)        0 (0%)         111d
  .
  .
  .
  .
  .
  .
Allocated resources:
  (Total limits may be over 100 percent, i.e., overcommitted.)
  Resource           Requests       Limits
  --------           --------       ------
  cpu                3178m (90%)    6628m (189%)
  memory             18799Mi (60%)  18879Mi (60%)
  ephemeral-storage  0 (0%)         0 (0%)
Events:              <none>

```

En particular, debemos de verificar las **Conditions** y **Eventos**.  

```bash
Conditions:
  Type             Status  LastHeartbeatTime                 LastTransitionTime                Reason                       Message
  ----             ------  -----------------                 ------------------                ------                       -------
  MemoryPressure   False   Thu, 07 Jan 2021 17:40:00 -0300   Tue, 05 Jan 2021 16:47:32 -0300   KubeletHasSufficientMemory   kubelet has sufficient memory available
  DiskPressure     False   Thu, 07 Jan 2021 17:40:00 -0300   Tue, 05 Jan 2021 16:47:32 -0300   KubeletHasNoDiskPressure     kubelet has no disk pressure
  PIDPressure      False   Thu, 07 Jan 2021 17:40:00 -0300   Tue, 05 Jan 2021 16:47:32 -0300   KubeletHasSufficientPID      kubelet has sufficient PID available
  Ready            True    Thu, 07 Jan 2021 17:40:00 -0300   Tue, 05 Jan 2021 16:47:42 -0300   KubeletReady                 kubelet is posting ready status
```


* MemoryPressure: Si es True, es posible que no haya suficiente RAM disponible. Esto puede provocar un OOM
* DiskPressure: Si es True, es posible que haya degradación en las IOPS o disco insuficiente.
* PIDPressure: si es True es posible que hayan demasiados procesos en ejecución.
* Ready: Si es True, significa que el Kubelet esta encendido y funcionando correctamente. En caso de que no este **Ready**, en ***Reason*** debería de figurar la causa por la cual no esta listo.  