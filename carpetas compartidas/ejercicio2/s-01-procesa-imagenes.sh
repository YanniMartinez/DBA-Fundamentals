# /bin/bash
# @Autor Martinez Martinez Yanni 
# @Fecha 06/09/2021
# @Descripcion Script de Bash que incluye uso de banderas, manejo de errores, creación de archivos, lectura de archivos y permisos.

#Parametros de entrada
archivoImagenes="${1}" 
numImagenes="$2"
archivoZip="${3}"

# Función ayuda
function ayuda(){
  codigoError="${1}"
  cat s-02-ayuda.sh
  exit "${codigoError}"
}

#Validación de los parámetros
# Parámetro 1
if [ -z "${archivoImagenes}" ] ; then
  echo "ERROR: El nombre del archivo de Imagenes no fue especificado"
  ayuda 100
else
  if ! [ -f "${archivoImagenes}" ] ; then
    echo "ERROR: El archivo ${archivoImagenes} no existe"
    ayuda 101
  fi;
fi; 

# Parámetro 2
if ! [[ "${numImagenes}" =~ [0-9]+ && "${numImagenes}" -gt 0 && 
  "${numImagenes}" -le 90 ]] ; then
  echo "ERROR: Número de imágenes incorrecta ${numImagenes}"
  ayuda 102
fi;


#Parámetro 3
if [ -n "${archivoZip}" ] ; then
  dirSalida=$(dirname, "${archivoZip}") 
  nombreZip=$(basename, "${archivoZip}")
  
  if ! [ -d "${dirSalida}" ] ; then
    echo "ERROR: El directorio ${dirSalida} no existe"
    ayuda 103
  fi;
else
  dirSalida="/tmp/${USER}/imagenes"
  mkdir -p "${dirSalida}"
  nombreZip="imagenes-$(date "+%Y-%m-%d-%H-%M-%s").Zip"
fi;

echo "Obteniendo imágenes,  guardando en ${dirSalida}"
rm -rf "${dirSalida}"/*.jpg

count=1
while read -r linea
do
  echo "Descargando imagen ${linea}"
  
  wget -q -P "${dirSalida}" "${linea}"
  status=$?
  if ! [ "${status}" -eq 0 ] ; then
    echo "Error: La imagen no se descargó correctamente"
    ayuda 104
  fi;

  if  [ $count -eq "${numImagenes}" ] ; then 
    break
  fi;

  count=$((count + 1))
done < "${archivoImagenes}"

echo "Generando un archivo zip"
export IMG_ZIP_FILE="${dirSalida}/${nombreZip}"

#Generando un archivo zip 
rm -f "${dirSalida}"/"${nombreZip}"
zip -j ${IMG_ZIP_FILE} "${dirSalida}"/*.jpg

echo "Modificando permisos"
chmod 600 "${IMG_ZIP_FILE}"

rm -f "${dirSalida}"/s-00-lista-archivos.txt
unzip -Z1 "${IMG_ZIP_FILE}" > "${dirSalida}"/s-00-lista-archivos.txt

rm -rf "${dirSalida}"/*.jpg