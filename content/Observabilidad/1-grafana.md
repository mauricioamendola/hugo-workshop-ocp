---
title: "Despliegue de Grafana"
draft: false
weight: 1
---

## Despliegue usando Operators

En la pantalla de Operators Hub, se puede buscar e instalar el operator "Grafana Community". Este operator es el que usaremos para deployar todos los componentes de Grafana, pero no lo usaremos luego de tener desplegado el sistema.  

Operator Hub -> Grafana Community -> Install

![grafana install](/images/grafana-0.png)

![grafana install](/images/grafana-1.png)

En la ventana de Installed Operators deberíamos de ver el operator recién instalado. Luego hay que crear dos instancias, una propiamente de Grafana y otra para el Data Source, en este caso el conector de Thanos / Prometheus.  

![grafana install](/images/grafana-2.png)

### Configurar permisos

Dar permisos a la service account de Grafana creada junto con el despliegue del operator.  

```bash

oc adm policy add-cluster-role-to-user cluster-monitoring-view -z grafana-serviceaccount -n project-name

```
Obtener el token y configurarlo en el datasource

```bash
oc serviceaccounts get-token grafana-serviceaccount -n project-name
```

En la ventana del Operator, en el recurso "Grafana Data Source" crear una nueva instancia con el siguiente código:  

```yaml
apiVersion: integreatly.org/v1alpha1
kind: GrafanaDataSource
metadata:
  name: prometheus-grafanadatasource
  namespace: my-grafana
spec:
  datasources:
    - access: proxy
      editable: true
      isDefault: true
      jsonData:
        httpHeaderName1: 'Authorization'
        timeInterval: 5s
        tlsSkipVerify: true
      name: Prometheus
      secureJsonData:
        httpHeaderValue1: 'Bearer ${BEARER_TOKEN}' ## acá va el token obetnido en el comando anterior. (Reemplazar ${BEARER_TOKEN})
      type: prometheus
      url: 'https://thanos-querier.openshift-monitoring.svc.cluster.local:9091'
  name: prometheus-grafanadatasource.yaml
  ```

Y..voilá. Con esto tenemos una instancia de Grafana desplegada y lista para usar. Cabe agregar que esta instancia está completamente gestionada por el operator, y si necesitamos realizar algún cambio, eventualmente deberemos hacerlo por medio del Operator.   
Esto tiene ventajas y desventajas, pero en este escenario, lo recomendable es prescindir del Operator para tener la flexibilidad que necesitamos hoy, por lo que, vamos a eliminar el Operator, desde la ventana de "installed Operators" pero sin eliminar el contenido que el genera y crea. De esta forma, engañamos al Operator y nos quedamos solo con el contenido.

### Persistir dashboards creados 

Crear un PVC de 10Gi para montar en el /var/

```yaml
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: grafana-data ## Nombre del pvc
  namespace: project-name ## Proyecto / Namespace
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
  storageClassName: thin ## StorageClass
  volumeMode: Filesystem
status:
  phase: Bound
  accessModes:
    - ReadWriteOnce ## Access Modes
  capacity:
    storage: 10Gi ## Size

```
