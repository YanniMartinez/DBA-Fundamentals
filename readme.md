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
| `ORACLE_HOME` | Directorio donde se encuentra la instalación y ejecutables de la base de datos, es decir el directorio raíz. Primero se instala el software y despues la base de datos |
| `LD_LIBRARY_PATH` | Es una variable de entorno, normalmnete Lista de directorios donde se encuentran librerias del sistema(Típicamente ) |

## Personalización de SQL*Plus

`sqlplus /nolog` es para acceder a la interfaz de sqlplus

Corrección del comando `sudo yum install rlwrap` es `sudo dnf install wrap`, no es necesario usar el comando `sudo nano /etc/profile.d/oracle..`

Se recomienda leer el previo de la práctica 7 en la carpeta `BD/p7`

### Ejercicio práctico 2:

Se trata de un programa en shell, para homologar el conocimiento.

### Ejercicio 01

Al inicio va primero el interprete, en este caso bash e indicamos la ruta.

Para una variable en bash usamos `$var1 $myvar`

Si no indicamos que esté entre comillas dobles podemos recibir `rm -r /` estariamos perdiendo todo nuestro linux, entonces debemos decirlo.

Para crear una función en shell script podemos poner la siguiente sintaxis:

```
function ayuda(){

}
```

A pesar de que podamos enviar parametros, no se los enviaremos, los recopilaremos de la siguiente manera.


```
function ayuda(){
  codigoError="${1}"
  cat s-02-ayuda.sh
  exit "${codigoError}"
}
```

Con el comando `cat` lee el archivo y se muestra el contenido del archivo.
Cuando un shell termina podemos mostrar el código de salida. Cuando un comando se ejecuta correctamente nos devolverá **0**. Para indicar un problema con el programa el comando `exit` nos permite saberlo.

Para validar un valor usamos:
```
if [ -z "${archivoImagenes}" ]; then
  echo "ERROR: El nombre del archivo de imágenes no fue especificado"
  ayuda 100
else
fi
```

El `-z` nos ayuda a validar si el valor de la variable está vacia, le damos espacio y ponemos el nombre de la variable.
Para terminar un `if` debemos poner un  **`fi`**.

Para **imprimir un mensaje en consola** usamos el comando `echo`

Cuando el archivo de imagenes no fue especificado o no existe, le indicamos que existió un error y le indicamos el código 100.

```
if [ -z "${archivoImagenes}" ]; then
  echo "ERROR: El nombre del archivo de imágenes no fue especificado"
  ayuda 100
else
fi
```

Podemos poner un if negado y usar `-f` nos ayuda a verificar si existe un archivo con ese nombre.

```
if [ -z "${archivoImagenes}" ]; then
  echo "ERROR: El nombre del archivo de imágenes no fue especificado"
  ayuda 100
else
  if ! [ -f "${archivoImagenes}"]; then
    echo "ERROR: EL archivo ${archivoImagenes} no existe"
    ayuda 101
  fi
fi
```

#### Validando 2do parametro

```
#parámetro2
if ! [[ "${numImagenes}" =~ [0-9]+ && "${numImagenes}" -gt 0 &&
  "${numImagenes}" -le 90]]; then
    echo "ERROR: El archivo ${archivoImagenes} no existe"
    ayuda 102
  fi
fi
```

La sintaxis con doble corchete nos permite validar expresiones regulares. Para indicar que se trata de una expresión regular. Le dice, evalua la siguiente condición booleana para la cadena. Con esto ya estamos validando que no esté vacio y validamos con `&&` diciendo que esté entre 0 y 90.

#### Verificando 3 parametro

Nos ayuda a extraer el nombre del directorio en la ruta. `if [ -n "${archivoZip}" ]; then``.

Hay veces en las que necesitamos usar directorios o archivos temporales, para ello existe el directorio `tmp` donde almacena todo eso que es opcional.

Haciendo limpieza:

`rm -rf "${dirSalida}"/*.jpg`

Siempre que queramos borrar algo hay que ser lo más especificos posible.

Una manera facil de leer archivos y leer el valor de cada línea usamos

```

```

La salida de este comando `echo "hola"` redirecciona a `>` el archivo o variable `${archivoImagenes}`

La Versión contraria es entonces una entrada. `done < "${archivoImagenes}"` signfica que el `archivoImagenes` es la entrada del while.

El comando para **obtener recurso de internet** es el comando `wget`, le podemos indicar el directorio de salida.

Para **Validar si el comando anterior se ejecutó correctamente** usamos `status=$?`

```
count=1
while read -r linea #El ciclo se va a detener cuando termine de leer
do 
  echo "Descargando Imagen ${linea}"
  wget -q -P "${dirSalida}" "${linea}"
  #Validando status
  status=$?
  if ! [ "${status}" -eq 0]; then 
    #Completar
  fi;

  #Validar el número de imagenes
  # Si ya se cuenta con el número de imagenes solicitadas
  # Entonces salimos del ciclo
  # Si ya se cuenta con el número de imagenes solicitadas => break;

  count=$((coun+1))
done < "${archivoImagenes}"
```

Hasta este punto ya generamos las imagenes.

Para indicar que una variable es de entorno lo especificamos como `export`, Cuando un programa tiene un Export.


`source` lo que hará es mostrar el valor de la variable de entorno.

Con `chmod 6 ` indicamos los permisos en este caso el 6 hace referencia al estilo binario, por ejemplo `110` ese primero es para los permisos del usuario, recordemos que están listados como `rwd`

| Flag | Significado |
| --- | --- |
|`gt`| Greater Then si es mayor que, entonces |
|`le`| Less or Equal menor o igual |
|`-n`| Si el valor del parametro tiene un valor entonces... Es el contrario del `-z`|
|`-d`| Verifica si el directorio existe |
|`-p`| Genera todos los archivos de jalón 
|`rm`| Remueve |
|`rf`| Fuerza la acción|
|`-q`|  |
|`-P`| En que directorio quieres guardar, o directorio de salida |
|`-j`| Va a incluir a todos los archivos pero sin que tenga la estructura de directorios. Si no la especificamos puede generarnos directorios dentro del directorio especificado |
|`rm -f`| Cuando ponemos ese con el f no nos manda una mensaje de error, si no existe pues que no pase nada |
|`Z1`|Muestra el contenido del zip pero sin la ruta del contenido que puede tener su interior|