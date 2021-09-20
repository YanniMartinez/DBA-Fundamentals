
Prompt Proporcionar el password de SYS
connect sys as sysdba
set serveroutput on

@s-00-funciones-validacion.plb

create or replace procedure spv_valida_datos_instancia wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
61f 378
7pjMI0IlIsOLZjn1Ny7tdCSwWSYwgwLDs0gTfI5Vx2P5ahB1XaLmITEzwskKoqlhETaAQJHQ
hfuADTZXghQJsORHvGtPUCwTLtPmZvHxW1nPcr7BcZoePq9hHkfjmUMntiAR1F6rsKDTAUdt
wlHpFT4w7s2yqQDvqBuSlAVX5xc/kc2/puaxv83nNMpf2N2fht3sU9SCy4xVJ7nxUGqv7qQk
/8+atKiU38JaIRPU97BmlMeKrWCEIa9K9lNKH97O++6GmtEpADowfjoyrCJUqKC8KDfQNq5w
+TrdyaDmYMR4C/76mfV9jMLpic5eICLU6+2YKXpB05bj4OQKB4eikzU1xznJxtZhuuDf//iM
0Tlc6pM76pAwlbhpnVVgV2FPYiXvi6H3aewZQzpVCiOPQ0PZxPhumpxs/L8XTp/BhUUqsSOu
/zsTbPNEpdKsXaTZuYpF7uTKZh8pgGbSWL8DS4nqcb2+ZuCa1audCxER2Hz1oXfr3vXpuu1w
DunyB4vxE/Zc75F08DgsHHBQIXaSr5niG6gLQ2refYiuypsCkQ5WHLAHHxP+qifiNvzfgYn0
RNfRMsN55VX8jEi6Ec5V5CfL0iivrsqL+tgNv/AD7dRdbvrxnZ2Uoz9gOIoWKfTI8WyU7Q4Q
jKixKJFPHnscpx5WmBhkDd+LIHLNKCdy+AULcCEMIbBYyIDv4SvDCWlVdk7SHKMDn+wpziSs
Z8PP+rbFN42UHRtj4MNEo6EtkWOjnQnOA+L2K08jYLdFX2yEeav6d82S/nMunHiwRLegXA+2
z56Zo2UCrKJllNSeAFbhfhdoPPR0pBWXjWZUaQSKxNFHP+UDPsSU1VTFXYALHjncELsmKA12
EJIoy3tjhA==

/
show errors
exec spv_print_header
exec spv_valida_datos_instancia

prompt Validando configuración en glogin.sql
!chmod 755 s-02-validador-glogin*.sh
!./s-02-validador-glogin-main-enc.sh

drop procedure spv_valida_datos_instancia;
drop function fv_hash;
drop procedure spv_crea_secuencia;
drop procedure spv_print_ok;
drop procedure spv_throw_error;
drop  procedure spv_assert;
drop procedure spv_print_header;


Prompt Listo!
exit