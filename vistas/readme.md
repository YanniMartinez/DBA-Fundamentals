# Vistas

| Vista | Función |
| --- | --- |
| `v$diag_info;`  |  muestra todos los directorios donde hay bitacoras. |
| `select blocksize from v$log;` | Muestra el tamño de bloque de un redolog |
| ``select name, value from v$sysstat where name = 'REDO WASTAGE';`` | Muestra el tamaño de bloque que está siendo desperdiciado |
