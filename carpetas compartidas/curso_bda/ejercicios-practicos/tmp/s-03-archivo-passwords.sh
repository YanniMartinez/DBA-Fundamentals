# /bin/bash
#@Autor: Martínez Martínez Yanni
#@Fecha creación: 21/09/2021
#@Descripción: Tercer ejercicio de bash

#Crear un respaldo del archivo de passwords
archivoPasswords= $ORACLE_HOME/dbs/orapwymmbda1

if [ -f "${archivoPasswords}" ] ; then
  mkdir /home/oracle/backups
  cp "${archivoPasswords}" /home/oracle/backups/orapwymmbda1
  rm "${archivoPasswords}"
  touch "${archivoPasswords}"
  startup
  
  echo "El archivoPasswords "${archivoPasswords}" existe"
else
  echo "El archivoPasswords "${archivoPasswords}" no existe"
fi 

cp archivo archivocopia