UPDATE "XXER_INVOICES_AP_CONF_TBL" 
SET ACTION = 'CANCELAR',
PROCCESS_DESC='Se valida que el estatus que retorna el web service del SAT sea el definido en el PARAMETRO 1 de no ser asi valida si el estatus es igual al configurado en PARAMETRO 2 si es igual la factura se intentara validar el numero configurado en el PARAMETRO 3 de veces por dia y se repetira el numero configurado en el PARAMETRO 4 de dias enviando notifiacion del error configurado en PARAMETRO 5, en caso de ser otro estatus diferente o termino el numero de dias configurado procede al envio del mensaje de error.',
PARAMETER1='Vigente',	
PARAMETER2='No Encontrado',	
PARAMETER3='3',	
PARAMETER4='1',	
PARAMETER5='Factura con estatus @STATUS_SAT@ en el SAT debe ser @STATUS_SAT_CONF@, Este es el intento @REINTENTO_D_DIA@ de @REINT_DIA_CONF@ este es el dia @DIAS_INTENTADOS@ de @DIAS_INTENT_CONF@ dias configurados.'
WHERE ID = '81' ;

commit;