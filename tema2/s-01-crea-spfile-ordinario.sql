--Autenticando como sys en sysdba
connect sys/hola1234* as sysdba

--Iniciando la instancia en formato nomount
startup nomount

--Creando un SPfile mediante un PFile
--create spfile from pfile;

--Creando SPfile mediante PFile
create spfile='/u01/oracle/dbs/test_spfile.ora'
from pfile='/u01/oracle/dbs/test_init.ora';

--Para verificar la creación de SPFILE desde PFile
!ls $ORACLE_HOME/dbs/spfile<iniciales>bda2.ora


