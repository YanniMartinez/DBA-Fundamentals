# /bin/bash
# @Autor Martinez Martinez Yanni 
# @Fecha 06/09/2021
# @Descripcion Es el mensaje de ayuda que guiará al usuario para saber si llegó a equivocarse

#Mensaje default para presentar el error
echo "Para ejecutar el programa utilizar la siguiente sintaxis:\n
./s-01-procesa-imagenes.sh <path_archivo_imagen> <num_imagenes> [<nombre_archivo_zip>]
<path_archivo_imagen> Ruta y nombre donde se encuentra el archivo de texto que contiene un URL
por cada renglón de la imagen que será descargada de internet.\n
<num_imagenes> Total de imágenes a descargar, entre 1 y hasta 90 imágenes
[<nombre_archivo_zip>] Parámetro opcional que indica la ruta y nombre del archivo zip a generar.
En caso de no especificarse se empleará el nombre
imagenes-yyyy-mm-dd-hh:mi:ss.zip y estará ubicado en

/tmp/${USER}/imagenes. Si se especifica este parámetro, su valor
deberá incluir la ruta y el nombre del archivo zip a generar. La ruta
absoluta y el nombre del archivo zip generado deberá ser exportado empleando

una variable de entorno IMG_ZIP_FILE"