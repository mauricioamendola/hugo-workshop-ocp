---
title: "Eventos"
draft: false
weight: 1
---

### Eventos a nivel del Proyecto  

![Events Project View](/images/events-project.png)  

Podemos filtrar por tipo de Evento. Particularmente util cuando buscamos problemas.  

![Events filtered](/images/events-filtered.png)  


### Eventos a nivel del POD   

![Events POD's View](/images/events-pod.png)  

## Usando la Cli

Obtener los eventos ordenado por timestamp de todos los namespaces.  

```bash
[root@ovwbastion ~]# oc get event -A --sort-by=.metadata.creationTimestamp
NAMESPACE               LAST SEEN   TYPE      REASON                         OBJECT                                         MESSAGE
utemueve-prod           3m5s        Warning   FailedGetResourceMetric        horizontalpodautoscaler/utemueve-blue          missing request for cpu
utemueve-prod           3m5s        Warning   FailedGetResourceMetric        horizontalpodautoscaler/utemueve-green         missing request for cpu
cluster-ops             167m        Normal    Scheduled                      pod/cronjob-ldap-group-sync-1610463600-2v6sg   Successfully assigned cluster-ops/cronjob-ldap-group-sync-1610463600-2v6sg to ovwworker-2.ocp01.corp.ute.com.uy
cluster-ops             167m        Normal    SuccessfulCreate               job/cronjob-ldap-group-sync-1610463600         Created pod: cronjob-ldap-group-sync-1610463600-2v6sg
cluster-ops             167m        Normal    SuccessfulCreate               cronjob/cronjob-ldap-group-sync                Created job cronjob-ldap-group-sync-1610463600
cluster-ops             167m        Normal    Created                        pod/cronjob-ldap-group-sync-1610463600-2v6sg   Created container cronjob-ldap-group-sync
cluster-ops             167m        Normal    Started                        pod/cronjob-ldap-group-sync-1610463600-2v6sg   Started container cronjob-ldap-group-sync
cluster-ops             167m        Normal    Pulled                         pod/cronjob-ldap-group-sync-1610463600-2v6sg   Container image "registry.access.redhat.com/openshift3/ose-cli:v3.11" already present on machine
cluster-ops             167m        Normal    SuccessfulDelete               cronjob/cronjob-ldap-group-sync                Deleted job cronjob-ldap-group-sync-1610445600
cluster-ops             167m        Normal    SawCompletedJob                cronjob/cronjob-ldap-group-sync                Saw completed job: cronjob-ldap-group-sync-1610463600, status: Complete
utemueve-prod           128m        Warning   FailedComputeMetricsReplicas   horizontalpodautoscaler/utemueve-green         invalid metrics (1 invalid out of 1), first error is: failed to get cpu utilization: missing request for cpu
cluster-ops             107m        Normal    SuccessfulCreate               job/cronjob-ldap-group-sync-1610467200         Created pod: cronjob-ldap-group-sync-1610467200-f4c92
cluster-ops             107m        Normal    Scheduled                      pod/cronjob-ldap-group-sync-1610467200-f4c92   Successfully assigned cluster-ops/cronjob-ldap-group-sync-1610467200-f4c92 to ovwworker-2.ocp01.corp.ute.com.uy
cluster-ops             107m        Normal    SuccessfulCreate               cronjob/cronjob-ldap-group-sync                Created job cronjob-ldap-group-sync-1610467200
cluster-ops             107m        Normal    Created                        pod/cronjob-ldap-group-sync-1610467200-f4c92   Created container cronjob-ldap-group-sync
cluster-ops             107m        Normal    Started                        pod/cronjob-ldap-group-sync-1610467200-f4c92   Started container cronjob-ldap-group-sync
cluster-ops             107m        Normal    Pulled                         pod/cronjob-ldap-group-sync-1610467200-f4c92   Container image "registry.access.redhat.com/openshift3/ose-cli:v3.11" already present on machine
.
.
...
```
