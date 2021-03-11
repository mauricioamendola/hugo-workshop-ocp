---
title: "Dashboards"
draft: false
weight: 2
---

## Vista General

### Sección Misc

![Misc](/images/dashboard-0.png)   

Datos relevantes:  

* Cantidad de updates pendientes dentro de la minor version
* Versión del cluster
* Total de cores de los workers
* Total de RAM de los workers
* Disponibilidad de nodos. Si algun nodo reporta un evento "kubelet not ready" varía el porcentaje
* ETCD Líder: Si hay un member del ETCD que sea master y cuál
* Alertas por estado
* RAM Disponible


### Sección General

![General](/images/dashboard-1.png)   

Datos relevantes:  

* NTP Offset por nodo
* Estado por nodo
* Alertas configuradas en Grafana
* Eventos por Nodo
* Uso de disco por nodo
* Porcentaje de uso de PersistentVolumes


### Sección Masters y Workers

![Nodos](/images/dashboard-2.png)    

Datos Relevantes:  

* Uso de CPU por nodo
* Uso de RAM por nodo
* Uso de Red por nodo

