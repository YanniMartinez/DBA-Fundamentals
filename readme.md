# Bases de Datos Avanzadas

Requisitos:
* Tener sólidos los conceptos de SQL.
* DDM
* DDL
* Programación en Shell
* Conocimiento en PLSQL

## Tema 1: Conceptos básicos en administración de Bases de Datos

### Ejercicio 1

Instalar SO Oracle linux (es un SO basado en RedHat) para cuestiones administrativas y ambitos productivos es muy recomendable tenerlo. En el siguiente [manual]() encontraremos la manera de como instalar el SO. Es recomendable instalarlo de forma nativa para tener una experiencia completa e irnos familiarizando con el Sistema. 
Si ya se tiene instalado ese SO puede actualizarlo con el comando: `dnf update` si ya se tiene una base de datos instalada es posible usar `dbca remove` que es una GUI que nos puede ayudar a borrar las bases.

¿Creen que un administrador de BD lo hará mediante una VM? 

### ¿Qué se aprenderá?

* Comprender el funcionamiento de una BD.
* Ser capaz de contar con una BD que opere de manera óptima.
* Capacidad de prevenir y resolver problemas asociados a su correcto funcionamiento "Salud de la BD".
* Datos consistentes, veríditos y completos.

Aunque no se quiera ser un DBA es súper recomendable aprender estos conceptos, dado que nos permite conocer el funcionamiento interno y la forma en la que se debe emplear una base de datos para que opere de una manera adecuada, esto nos permitirá desarrollar aplicaciones que sacen el mejor provecho a una BD, generando una armonía entre las aplicaciones, DBMS y la misma BD.

El software se beneficia mucho si conocemos más acerca de nuestra BD.

### Tareas fundamentales de un BDA (Admnistrador de base de datos)

Nos encontraremos con problemas como los siguientes:

Tarea: Evaluar el hardware en el que Sistema de la BD está operando. Se debe responder preguntas como:

* ¿Cuántos discos serán necesarios?
* ¿Cuántos cartucos de cinta se requieren para aplicar respaldos?
* 

Tarea: Instalación del software de la BD:

* Instalación y configuración del software necesario para crear una BD.
* Instalación de herramientas de administración, generalmente en ubicaciones remotas (Es decir, toda la interacción con la BD es mediante comandos). 

Tarea: Planeación de la BD:

* Capacidad de revisar y aprobar modelos lógicos de la BD. (Si se aprueba un modelo mal hecho nos echamos la zoga al cuello, aveces es más dañino un mal diseño que un malware dentro de la BD).
* Diseño de las estructuras físicas de almacenamiento, es decir, nosotros definiremos el número de data files,  las particiones, los tablespaces y la distribución en discos.
* Establecer una correcta relación entre el diseño lógico(Modelo relacional) y el diseño físico. Con ello podemos garantizar la armonia entre ambos diseños para que se dempeñen de la mejor manera, a esto se le conoce como **correcta correspondencia**.
* Estrategía de respaldos, cualquier BD productiva necesita almenos un esquema sencillo de respaldos (incluye politicas).
* Planear o considerar el crecimiento de la BD a largo plazo. A medida que pasa el tiempo la BD crece y el volumen de datos puede afectar el funcionamiento, no es admitible que una tabla crezca al infinito, de hecho cada tabla debe tener su propio analisis respecto a su crecimiento. ¿Qué pasa si diario maneja 1tb de datos?. Las NOSQL nos permiten manejar grandisimas cantidades de datos, erroneamente empresas se vuelcan erroneamente a las NOSQL sin antes analizar el buen diseño de la BD relacional.

Tarea: Planeación de funciones básicas de la BD:

* Creación de bases de datos.
* Respaldar.
* Actualizas el software de la BD.
* Parches para corregir errores.
* Administración de usuarios en la BD.
* Replicación o clonación de la BD en otros servidores, para poder tener un analisis aislado o un ambiente de desarrollo.
* Trabajar constantemente ene l **afinamiento y desempeño** de la BD. A medida de lo posible evitar que surgan errores y en caso de acontecer el error solucionarlo lo antes posible.

A medida de lo posible buscamos automatizar tareas para evitar errores humanos y reducir tiempo.

### Herramientas de administración.

Existen 2 herramientas para la administración de la BD.

* A linea de comandos: (90% del curso empleará este tipo de herramientas)
    - Empleando sentencias SQL y comandos propios en SQL*plus.
    - Empleando Scripts SQL, shell Scripts, RMAN scripts, Perl scripts.

* A través de uso de herramientas gráficas:
    - SQL developer.
    - Oracle Enterprise Manager Data Base Express (EM Express).
    - Interfaces de administración para servicios cloud computing.
    - A través de herramientas de administración proporcionados por terceros.

### Programación PL/SQL

La programación mediante Scripts es una excelente habilidad para realizar la administración dado que la gran mayoria de tareas suelen automatizarse mediante el uso de programas PL/SQL, de forma básica es indispensable contar con los siguientes conocimientos:

* Manejo de elementos básicos de programaicón: Uso de variables, sentencia de control, operadores.
* Programación de bloques anónimos, procedimientos almacenados y funciones.
* Manejo de cursores.
* Manejo de Excepciones.
* Ejecución de código SQL de forma dinámica.
* Conocimiento sólido en SQL y manejo de funciones.

### Programación en Shell

Como administrador es indispensable la programación en shell. Los conceptos básicos son:
* Lógica básica de programación.
* Manejo de variables de entorno.
* Manipulación de archivos.
* Maneo de comandos básicos como: `cat, grep, find, ps, chgrp, chown, more, cp, mv, ln, redireccionamiento de salida, etc`.

### Uso de SQL*Plus

Es una herramienta de línea de comandos para administrar una instancia BD Oracle.

* De forma local: Servidor alojado en la misma maquina.
* De forma remota: El cliente remotoinstala un cliente de oracle.

| Variable | Descripción |
| --- | --- |
| `ORACLE_SID` | Indica el nombre la da instancia de la BD a la que se quiere conectar |
| `ORACLE_HOME` | Directorio donde se encuentra la instalación y ejecutables de la base de datos |
| `LD_LIBRARY_PATH` | Lista de directorios donde se encuentran librerias del sistema |

### Ejercicio práctico 2:

Se trata de un programa en shell, para homologar el conocimiento.