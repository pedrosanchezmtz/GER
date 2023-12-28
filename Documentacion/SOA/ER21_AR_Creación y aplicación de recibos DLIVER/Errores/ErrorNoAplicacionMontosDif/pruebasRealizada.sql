select  h.estatus,h.numero_documento,
h.fecha_movimiento,h.tabla_puente_id,
h.sistema_origen,h.tipo_documento,h.sucursal_venta,h.referencia_aplicacion,h.creation_date,h.adicional2,h.*
from iner_xxer_puente_header_tbl h
LEFT JOIN  iner_xxer_puente_lines_tbl l
    on      h.tabla_puente_id=l.tabla_puente_id
where 1=1
--and h.tabla_puente_id=''
and h.tipo_documento='RECIBO'
--and numero_documento in('TT-4189','TT-4188','TT-4187','TT-4186','TT-4184','TT-4183')
--and trunc(fecha_movimiento) = to_date('06/03/2019','DD/MM/RRRR')
--and h.estatus='P'

order by h.fecha_movimiento desc;   

Insert into INER_XXER_PUENTE_HEADER_TBL (TABLA_PUENTE_ID,SISTEMA_ORIGEN,TIPO_DOCUMENTO,TIPO_MOVIMIENTO,UNIDAD_NEGOCIO_ORIGEN,NOMBRE_FISCAL_ORIGEN,EMPRESA_ORIGEN,RFC_ORIGEN,UNIDAD_NEGOCIO_DESTINO,NOMBRE_FISCAL_DESTINO,EMPRESA_DESTINO,RFC_DESTINO,SUCURSAL_VENTA,NUMERO_DOCUMENTO,FECHA_MOVIMIENTO,REFERENCIA_APLICACION,ADICIONAL1,ADICIONAL2,ADICIONAL3,ADICIONAL4,ADICIONAL5,ADICIONAL6,ADICIONAL7,ADICIONAL8,ADICIONAL9,ADICIONAL10,ESTATUS,DETALLE_ERROR,CREATION_DATE,CREATED_BY,LAST_UPDATE_DATE,LAST_UPDATED_BY,LAST_UPDATE_LOGIN) values (131493,'TRATECSA','RECIBO','PROPIO',null,null,null,'TTE020806LF4',null,'PEMEX TRANSFORMACIÓN INDUSTRIAL',null,'PTI151101TE5','PUEBLA','PETROLEOS',to_date('12/07/21','DD/MM/RR'),'TT-4371_92654.21|TT-4369_60330.68|TT-4370_72286.82|','BANORTE DEPOSITOS',null,null,null,null,null,null,null,null,null,null,null,to_date('14/07/21','DD/MM/RR'),1,to_date('14/07/21','DD/MM/RR'),1,null);

Insert into INER_XXER_PUENTE_LINES_TBL (TABLA_PUENTE_LINEA_ID,TABLA_PUENTE_ID,ORIGEN_SERVICIO,DESTINO_SERVICIO,SERVICIO,CONCEPTO_MODALIDAD,FORMA_PAGO,CANTIDAD,NO_LINEA,LINEA_ARTICULO,UNIDAD_MEDIDA,REFERENCIA_APLICACION,SUBTOTAL,CODIGO_IVA,TASA_IVA,MONTO_IVA,CODIGO_RETENCION_IVA,TASA_RET_IVA,MONTO_RET_IVA,CODIGO_RETENCION_ISR,TASA_RET_ISR,MONTO_RET_ISR,TOTAL,CREATION_DATE,CREATED_BY,LAST_UPDATE_DATE,LAST_UPDATED_BY,LAST_UPDATE_LOGIN) values (577693,131493,null,null,'SIN ASIGNAR',null,'CRE',null,null,'NUM DEPOSITO:1389','N/A','TT-4371_92654.21|TT-4369_60330.68|TT-4370_72286.82|',225271.7,'AR_IVA_EXENTO',null,null,null,null,null,null,null,null,225271.7,to_date('12/07/21','DD/MM/RR'),1,to_date('16/06/21','DD/MM/RR'),1,null);

commit

UPDATE INER_XXER_PUENTE_LINES_TBL SET referencia_aplicacion='TT-4371_92654.21|TT-4369_60330.68|TT-4370_72286.82|' 
where tabla_puente_id= 131493;
UPDATE  INER_XXER_PUENTE_HEADER_TBL  SET estatus=null,referencia_aplicacion='TT-4371_92654.21|TT-4369_60330.68|TT-4370_72286.82|'
where tabla_puente_id= 131493;
commit;

delete from xxer_ar_receipt_tbl where tabla_puente_id= 131493;
delete from xxer_ar_receipt_apply_tbl where tabla_puente_id= 131493;
commit;




