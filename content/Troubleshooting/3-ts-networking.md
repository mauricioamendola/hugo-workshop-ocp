---
title: "Networking"
draft: false
weight: 1
---

## Diagnosticando conectividad

### A nivel del POD  


Se puede verificar que la aplicación esté respondiendo accediendo directamente a la terminal del POD y usando herramientas como curl o ping podemos determinar si la aplicación está respondiendo o no.  
Para acceder a la terminal basta con ir al **POD** en cuestión y seleccionar el tab **terminal**. Para probar la aplicación podemos ejecutar el siguiente comando:  

```
curl -v http://localhost:port #reemplazar por el puerto de la aplicación
``` 

![Check Port](/images/check-port-1.png)  


También se puede verificar la aplicación a nivel de la capa de servicio, es decir, usando la **IP** de **"balanceo"**.  

![Check Service ](/images/check-svc.png)  

Luego de que obetenemos la IP del Service, podemos hacer la prueba con curl usando esa **IP**. Con esto verificamos que la capa de servicio de **Openshift** esta, a priori, funcionando correctamente.  

![Check Service](/images/check-svc-2.png)  

Por ultimo, podemos verificar que la resolución DNS interna este funcionando, usando el nombre del **Service** en lugar de su IP. Podemos verificar esto desde el mismo POD, similar a la prueba anterior:

![Check Service Hostname](/images/check-svc-hostname.png)


Incluso podemos consultar por el hostname de otro POD, en otro Namespace (Proyecto), en este último caso, la **Service layer** le asigna un hostname usando el siguiente formato:  
```
service-name.nombre-proyecto-openshift.svc
```

Por ejemplo, si quisieramos probar resolver el hostname de un **Service** del proyecto **workshop-openshift-docu** estando parados en un **POD** del proyecto **taller-sop1** el hostname seria: 

```
http://nombre-servicio.workshop-openshift-docu.svc:puerto
```

![Check Service Hostname](/images/check-svc-namespace.png)