---
title: "Guia"
menu: "main"
---

### Crear documentación nueva

Para generar un nuevo item en el menu, se debe crear un directorio, en el cual se debe crear un archivo `_index.md` con el siguiente codigo al principio:
``` 
---
title: "Nombre_Menu" # Este campo le da el titulo en el menu
--- 
```

*Existe la posibilidad de ordenar los items sin ser alfabeticamente, agregando el campo `weight: *` donde el aterisco hacer referencia a la altura donde se va a ubicar el item, este campo es numerico.*

Ya debajo de ese codigo se comienza a escribir la documentación en MarkDown.

##### Ejemplo de documentación nueva

El repositorio deberia quedar con la siguiente arquitectura:

```
+-- image_version.txt
+-- _index.md
+-- guia.md
+-- Hugo Deploy Openshift
|   +-- _index.md
|   +-- Paso 1-2.md
|   +-- Paso 3.md
|   +-- Paso 4.md
|   +-- Paso 5.md
|   +-- Paso 6.md
+-- DocumentacionTEST1
|   +-- _index.md
|   +-- test.md
+-- DocumentacionTEST2
|   +-- _index.md
|   +-- test1.md
|   +-- test2.md
+-- DocumentacionTEST3
|   +-- _index.md
+-- DocumentacionTEST4
|   +-- _index.md
```

Los archivos dentro de ese directorio que no sean el `_index.md`, seran items hijos.


#### Crear sub-menues

Para crear sub-menues en los items del menu principal, lo que se debe hacer un nuevo directorio dentro de los directorios que se encuentran en raiz del repositorio.

```
+-- image_version.txt
+-- _index.md
+-- guia.md
+-- Hugo Deploy Openshift
|   +-- _index.md
|   +-- Paso 1-2.md
|   +-- Paso 3.md
|   +-- Paso 4.md
|   +-- Paso 5.md
|   +-- Paso 6.md
+-- DocumentacionTEST1
|   +-- _index.md
|   +-- test.md
+-- DocumentacionTEST2
|   +-- _index.md
|   +-- test1.md
|   +-- test2.md
+-- DocumentacionTEST3
|   +-- _index.md
|   +-- submenu1
|   |   +-- _index_.md
|   |   +-- sub1.md
|   |   +-- sub2.md
|   |   +-- submenu2
|   |   |   +-- _index_.md
|   |   |   +-- 2sub1.md
|   |   |   +-- 2sub2.md
|   |   |   +-- 2sub3.md
|   |   |   +-- 2sub4.md
|   |   |   +-- submenu3
|   |   |   |   +-- _index.md
+-- DocumentacionTEST4
|   +-- _index.md
```

*Este proceso se puede repetir N veces.*

### Crear item en menu superior

Para crear un item en el menu superior, solo basta con crear un archivo `*.md` en el directorio raiz del repositorio con el siguiente formato:

```
---
title: ITEM # TITULO
menu: main # SIN ESTE CAMPO NO SE VISUALIZA EN EL MENU SUPERIOR
---
```

### Eliminando documentación

Quizas no sea la mejor practica, pero lo que recomiendo es cambiar la extension al archivo ```*.md``` a ```*.mdd```.

De esta manera se puede bajar la documentación de HUGO sin la necesidad de eliminarla.

## Guardar cambios

Para guardar los cambios, se debe realizar un **push** con los cambios al repositorio. 