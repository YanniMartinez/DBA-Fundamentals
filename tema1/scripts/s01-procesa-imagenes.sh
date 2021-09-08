#!/bin/bash
# @Autor Yanni Martinez Martinez
# @Fecha 06/09/2021
# @Descripcion Script de Bash que incluye uso de banderas, manejo de errores, creación de archivos, lectura de archivos y permisos.

#parámetros de entrada
archivoImagenes="${1}" 
numImagenes="$2"
archivoZip="${3}"

#
#Función ayuda
#
function ayuda(){
  codigoError="${1}"
  cat s-02-ayuda.sh
  exit "${codigoError}"
}

#Validación de los parámetros

#Parametro 1
if [ -z "${archivoImagenes}" ]; then
  echo "ERROR: El nombre del archivo de imágenes no fue especificado"
  ayuda 100
else
  if ! [ -f "${archivoImagenes}"]; then
    echo "ERROR: EL archivo ${archivoImagenes} no existe"
    ayuda 101
  fi
fi;

#parámetro 2
if ! [[ "${numImagenes}" =~ [0-9]+ && "${numImagenes}" -gt 0 && 
  "${numImagenes}" -le 90 ]] ; then
  echo "ERROR: Número de imágenes incorrecta ${numImagenes}"
  ayuda 102
fi;

#parámetro 3
if [ -n "${archivoZip}" ]; then
  dirSalida = $(dirname, "${archivoZip}")
  nombreZip = $(basename, "${archivoZip}")

  if ! [ -d "${dirSalida}" ] ; then
    echo "ERROR: El directorío ${dirSalida} no existe"
    ayuda 103
  fi
else 
  dirSalida="/tmp/${USER}/imagenes"
  mkdir -p "${dirSalida}"
  nombreZip="imagenes-$(date '+%Y-%m-%d-%H-%M-%S').zip"
fi;

echo "Obteniendo imágenes, guardando en ${dirSalida}"
rm -rf "${dirSalida}"/*.jpg

count=1
while read -r linea #El ciclo se va a detener cuando termine de leer
do 
  echo "Descargando Imagen ${linea}"
  wget -q -P "${dirSalida}" "${linea}"
  #Validando status
  status=$?
  if ! [ "${status}" -eq 0]; then 
    echo "Error: La imagen no se descargó correctamente"
    ayuda 104
  fi;

  #Validar el número de imagenes
  # Si ya se cuenta con el número de imagenes solicitadas
  # Entonces salimos del ciclo
  # Si ya se cuenta con el número de imagenes solicitadas => break;
  if  [ $count -eq "${numImagenes}" ] ; then 
    break
  fi;

  count=$((coun+1))
done < "${archivoImagenes}"

echo "Generando el archivo Zip"
export IMG_ZIP_FILE="${dirSalida}/${nombreZip}"

rm -f "${dirSalida}"/"${nombreZip}"

zip -j ${IMG_ZIP_FILE} "${dirSalida}"/*.jpg

echo "Modificando permisos"
chmod 600 "${IMG_ZIP_FILE}"

#Generando la lista de imagenes y guardarla en el archivo s-00-lista-archivos.txt
rm -f "${dirSalida}"/s-00-lista-archivos.txt

unzip -Z1 "${IMG_ZIP_FILE}" > "${dirSalida}"/s-00-lista-archivos.txt

#Eliminando imágenes
rm -rf "${dirSalida}"/*.jpg