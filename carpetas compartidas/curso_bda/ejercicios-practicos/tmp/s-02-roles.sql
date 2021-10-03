--@Autor: Martínez Martínez Yanni
--@Fecha creación: 21/09/2021
--@Descripción: Segundo ejercicio de acercamiento con SQL*Plus

--Lista de roles existentes
create table yanni0104.t02_db_roles as
select role_id,external_name
from dba_roles;

--Lista de privilegios asignados al rol DBA.
create table yanni0104.t03_dba_privs as
select privilege 
from dba_sys_privs where grantee='dba';
