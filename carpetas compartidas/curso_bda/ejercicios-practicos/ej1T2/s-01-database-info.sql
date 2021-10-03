--@Autor: Martínez Martínez Yanni
--@Fecha creación: 28/09/2021
--@Descripción: Ejercicio 1 tema 2 de creación de usuario y base de datos

connect sys/system1 as sysdba  --Conecta como usuario Sysdba

declare
  v_count number;
  v_username varchar2(20) := 'YANNI0201';
begin
  select count(*) into v_count from all_users where username=v_username;
  if v_count >0 then
    execute immediate 'drop user '||v_username|| 'cascade';
  end if;
end;


create user yanni0201 identified by yanni quota unlimited on users;
grant create session, create table to yanni0201;

create table yanni0201.database_info(
  instance_name varchar2(16),
  db_domain varchar2(20),
  db_charset varchar2(15),
  sys_timestamp varchar2(40),
  timezone_offset varchar2(10),
  db_block_size_bytes number(5,0),
  os_block_size_bytes number(5,0),
  redo_block_size_bytes number(5,0),
  total_components number(5,0),
  total_components_mb number(10,2),
  max_component_name varchar2(30),
  max_component_desc varchar2(64),
  max_component_mb number(10,0)
);

insert into yanni0201.database_info(instance_name,db_domain,db_charset,sys_timestamp,timezone_offset,db_block_size_bytes,os_block_size_bytes,redo_block_size_bytes,total_components,total_components_mb,max_component_name,max_component_desc,max_component_mb) values (
  --instance_name
  (select instance_name from v$instance),
  --db_domain
  (select value from v$parameter where name='db_domain'),
  --characterset
  (select value from nls_database_parameters where parameter='NLS_CHARACTERSET'),
  --sys_timestamp
  (select systimestamp from dual),
  --timezone_offset
  (select tz_offset((select sessiontimezone from dual)) from dual),
  --db_block_size_bytes
  (select value from v$parameter where name='db_block_size'),
  --os_block_size_bytes
  '0000',
  --redo_block_size_bytes
  (select blocksize from v$log where status='CURRENT'),
  --total_components
  (select count(*) from v$sysaux_occupants),
  --total_components_mb
  (select round(SUM(SPACE_USAGE_KBYTES)/1024,2) from v$sysaux_occupants),
  --max_component_name
  (select OCCUPANT_NAME from v$sysaux_occupants where SPACE_USAGE_KBYTES=(Select max(SPACE_USAGE_KBYTES) from v$sysaux_occupants)),
  --max_component_desc
  (select OCCUPANT_DESC from v$sysaux_occupants where SPACE_USAGE_KBYTES=(Select max(SPACE_USAGE_KBYTES) from v$sysaux_occupants)),
  --max_component_mb
  (select SPACE_USAGE_KBYTES/1024 from v$sysaux_occupants where SPACE_USAGE_KBYTES=(Select max(SPACE_USAGE_KBYTES) from v$sysaux_occupants))
);


--Mostrando el contenido de la tabla:
Prompt mostrando datos parte 1
set linesize window

select instance_name,db_domain,db_charset,sys_timestamp,timezone_offset
from yanni0201.database_info;

Prompt mostrando datos parte 2

select db_block_size_bytes,os_block_size_bytes,redo_block_size_bytes,
total_components,total_components_mb
from yanni0201.database_info;

Prompt mostrando datos parte 3;

select max_component_name,max_component_desc,max_component_mb
from yanni0201.database_info;