---
title: "KubeConfig"
draft: false
weight: 6
---

## Kubeconf

Openshif esta construído sobre Kubernetes, y en este sentido, es posible ir contra el cluster de Kubernetes / Openshift usando el archivo kubeconfig. Este archivo contiene los datos necesarios para organizar uno o varios cluster, usuarios y namespaces usando certificados.  
Por omisión, si usamos ***kubectl*** este busca por el archivo `./kube/config`.  

### Contenido del kubeconfig

```yaml
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURRRENDQWlpZ0F3SUJBZ0lJTm05SUdjS1FVVXN3RFFZSktvWklodmNOQVFFTEJRQXdQakVTTUJBR0ExVUUKQ3hNSmIzQmxibk5vYVdaME1TZ3dKZ1lEVlFRREV4OXJkV0psTFdGd2FYTmxjblpsY2kxc2IyTmhiR2h2YzNRdApjMmxuYm1WeU1CNFhEVEl3TURZeE56RXpOVEl3TTFvWERUTXdNRFl4TlRFek5USXdNMW93UGpFU01CQUdBMVVFCkN4TUpiM0JsYm5Ob2FXWjBNU2d3SmdZRFZRUURFeDlyZFdKbExXRndhWE5sY25abGNpMXNiMk5oYkdodmMzUXQKYzJsbmJtVnlNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQTJEZWRtVS95TXZZeQpNWHN1MVhkalJaZzc4UHNIb3lFZG53R2htbVI4Z241djNZVTZTUWZFT3ZsMlRDKzl2MG1YaEU3ZUFXZVRjVHN4Ckp1bmlpNm5BL2hTOUwxVFNld3dkMld4cmljZU0xZW9lcUN1NWxZcEYzL04rRU1KK2NSM2tsRjJDYitkQzZrQXYKY1B0c28zWHl1MWZpUElvdWN3UitRVnlLQXNEMW5JQ2JrY0d1TnNqVHdxM1dOM3MxQlJZS1BIeXZiK0h4Z3ptdwphUy9PYVNhaFYxajNHWVJFMVEwQVQxamRueURMRkR6WkVGcTR4RFBKUFBQTndtdW9iVStYcUtXUDFPRi80VXNjCkg1TFhEQXAvUGRHTngwRXhhMWlrc0lH
    .
    .
    .
    .
    .
    .
    server: https://api.ocp01.corp.ute.com.uy:6443
  name: api-ocp01-corp-ute-com-uy:6443
- cluster:
    certificate-authority-data: DZZZkxWVWRCVmtiMlJJQ1l0cDRsdEU4bjByZ0dHSnB3NGkrNnpyMWdDTHMyZDY4alFKM21KWkJaeQp1SWRkZE4wL0RQUHlKTVlpcjZ6R2Q3VXVBeUxRUmFwREQzZWZkZ0l2UzFBPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCi0tLS0tQkVHSU4gQ0VSVElGSUNBVEUtLS0tLQpNSUlETWpDQ0FocWdBd0lCQWdJSUxhVWVrMis0TWFBd0RRWUpLb1pJaHZjTkFRRUxCUUF3TnpFU01CQUdBMVVFCkN4TUpiM0JsYm5Ob2FXWjBNU0V3SHdZRFZRUURFeGhyZFdKbExXRndhWE5sY25abGNpMXNZaTF6YVdkdVpYSXcKSGhjTk1qQXdOakUzTVRNMU1qQXpXaGNOTXpBd05qRTFNVE0xTWpBeldqQTNNUkl3RUFZRFZRUUxFd2x2Y0dWdQpjMmhwWm5ReElUQWZCZ05WQkFNVEdHdDFZbVV0WVhCcGMyVnlkbVZ5TFd4aUxYTnBaMjVsY2pDQ0FTSXdEUVlKCktvWklodmNOQVFFQkJRQURnZ0VQQURDQ0FRb0NnZ0VCQUt5UFdOek9EemxvWHNGeTNmTTJLT0xTQzhVb291YjAKZE82RWtoanBOVVRYTmdTZTZxWE1lMDZnVThrVTE2NWR2RW5Pd1ZsTzAvYlhYY0tldDdqRlY0Z2NaWklVejFmSwpGeXZzZW12SWs1TjJ3RVlZQ3JGbjgrUzJkdFBmbXVqUGFTNmlSUlc2Q0hPbTIyQ0V2Z1I3RW5KTDBLWVVlaVBwCmo4WWdhYUtvQVNJcjc4eEpzUHRSbG91U0lacVFZcmd6RldPeE1acDdHVXRTTXBqckNNcVQwajZQeUpFVmhQbWgKMm8wWXBUZmFHMHJYN21CRSs4WGo4Vko4ZWMxOU1ZOWNqdk1PalhVMTg0elkzaHlMQ0JCMHRGUFRoYnlDRUhlMgptQnJDUzlGSVZwM1BHUHpxQnlEdmoyRjl6MGZzWTFmMkM0YmlvUVRzdUhGRUpHVm0yamMzeWNFQ0F3RUFBYU5DCk1FQXdEZ1lEVlIwUEFRSC9CQVFEQWdLa01BOEdBMVVkRXdFQi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZQSE4KSzV2V1g4OHdhY2NrTVFFaHBuVFFYSlMvTUEwR0NTcUdTSWIzRFFFQkN3VUFBNElCQVFDaVVUTEZTaTB2QS9aVgpZV05ST0Y4ZXdVR29aQ1V3WFRqMVQvWlF6ZVJQaTIvcm5Mb0JFbGs0SlphZEh2OXVCRUhBN2NVeHdhdGNHNHByClF4aWpZMlRYRHE3aGRuQ2ZidW5WbCtqVjR2K3RNQXBtRnl4YnlFOEpOeUs5R0NWcTdvZmh2TFgzQ282OEMvbGIKczFveUJiRi9TU1ZyU0JMWE91N0FLOE9XK2hmMW8xZlZUNHVzMWpzVXBHVDVCbm90emlQNGlhR0xQbDZFcFhHYQpQa2gyTFVaYyt4RmlCQ2pvRWNlbCtqUTlqalNRVDR2d1A4NXdoVm8xdTNBbVNNSGtIMi9nTEprL3NKM28yYVYxClUwNS96dXU0ZVhud0lITERFTEtwWWZxSDV2UVg1ZUlobEpOVVVDZmJybTVnQytvVzFabzRWaUNmQnBPYkxPamwKY0kyZ2RDaTkKLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=
    .
    .
    ...
    server: https://api.ocp01.corp.ute.com.uy:6443
  name: ocp01
contexts:
- context:
    cluster: ocp01
    user: admin
  name: admin
- context:
    cluster: api-ocp01-corp-ute-com-uy:6443
    namespace: default
    user: system:admin/api-ocp01-corp-ute-com-uy:6443
  name: default/api-ocp01-corp-ute-com-uy:6443/system:admin
```

Es posible tener múltiples clusters, múltiples namespaces y múltiples usuarios. A este grupo se le conoce como ***contexto***.  

## Log-in en un cluster usando Kubeconfig

En ambos clusters (Test y Prod), luego de la instalación, se dejaron en los bastiones, los archivos Kubeconf de acceso a cada cluster.  

```bash
[root@ovwbastion ~]# export KUBECONFIG=/root/ocp02/auth/kubeconfig

[root@ovwbastion ~]# oc whoami
system:admin
```