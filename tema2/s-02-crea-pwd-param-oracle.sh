# /bin/bash
# @Autor Martinez Martinez Yanni 
# @Fecha 06/09/2021
# @Descripcion Script que crea el archivo PFILE

archivoParam = "${ORACLE_HOME}"/dbs/initymmbda2.ora

touch ${archivoParam}

echo "db_name=ymmbda2" >> ${archivoParam}

echo "control_files=(/u01/app/oracle/oradata/YMMBDA2/control01.ctl,
                    /u02/app/oracle/oradata/YMMBDA2/control02.ctl,
                    /u03/app/oracle/oradata/YMMBDA2/control03.ctl)" >> ${archivoParam}

echo "memory_target=768MB" >> ${archivoParam}
