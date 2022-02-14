# Trabajo Fin Bootcamp Devops

## Introducción

El proyecto lo he enfocado a una integración continua, para una empresa pequeña o un proyecto en local, y demostrar que la metodología ágil esta al alcance de cualquiera. 

## Entorno

Se ha utilizado una máquina en local, con un sistema operativo Linux, más concretamente un Ubuntu 20.04.3 LTS, con 2 CPU, 8GB de RAM y 30 GB de disco.
Esta máquina utilizando de aprovisionamiento docker-compose, se ha levantado la app, un jenkins, un esclavo de jenkins (se ha utilizado la propia máquina), una bbdd, y un sistema de monitorización, tanto para monitorizar la app como el entorno. Todas las conexiones se han realizado a través del hostname de docker.

## App

La aplicación es una página web, realizada en nodeJS,  que se conecta a una bbdd, y es una agenda.

## Database

La base de datos es una mysql, dockerizada y con una persistencia, para no perder los datos.

## Jenkins

El jenkins lo hemos utilizado para el tema de integración continua.
Se ha conectado el github a mi jenkins en local, y cada vez que se realiza una subida, realizaría todo el proceso.
Limpieza de imágenes, buildeo (se realiza dentro de un docker), luego se pasarían los tests, después sonar, se subiría a nuestro repositorio local o a dockerhub y por último, si es la rama develop se nos desplegaría en local y, si es la rama main, en el entorno de producción.

## Monitorización

Esta parte la he dividido en dos, la monitorización de la máquina y, la de la app.

## Monitorización Máquina

Para esta parte, he utilizado node exporter, prometheus y grafana.
Con node-exporter realizamos la exposición de las métricas, prometheus se encarga de llamar a estas métricas, y grafana de la parte visual.
Además, me hubiera gustado montar la parte del alertmanager, para poner alertas por si la máquina sube de recursos, o principalmente por si se cae la app.

## Monitorización App

Utilizando el driver de docker, gelf, y la tecnología de ELK, lo que hace es exponer los logs, y a través de kibana podemos consultarlos.

## Conclusión

Utilizando docker-compose, no habría problema montar este sistema de CI/CD, incluso si queremos realizarlo en una máquina más pequeña solo habría que introducir límites a los docker.

### Realizado por Sergio González Jiménez
