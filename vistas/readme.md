# Vistas

| Vista | Función |
| --- | --- |
| `v$diag_info;`  |  muestra todos los directorios donde hay bitacoras. |
| `select blocksize from v$log;` | Muestra el tamño de bloque de un redolog |
| ``select name, value from v$sysstat where name = 'REDO WASTAGE';`` | Muestra el tamaño de bloque que está siendo desperdiciado |
|PARAMETROS|PARAMETROS|
|`v$parameter`|Muestra los valores de los parámetros empleados para la sesión actual del usuario.|
|`v$parameter2` (no muy usada)|La diferencia con la anterior, es que los parámetros que aceptan una lista de valores son mostrados como registros de la vista (cada elemento de la lista es un registro). Es decir, nos muestra en una linea diferente  cada parámetro|
|`v$system_parameter`|Muestra los valores de los parámetros empleados pero ahora a nivel de instancia.|
|`v$system_parameter2` (no muy usada)|La diferencia con la anterior, es que los parámetros que aceptan una lista de valores son mostrados como registros de la vista (cada elemento de la lista es un registro).|
|`v$spparameter`|Contiene la lista de parámetros especificados en el SPFILE|
