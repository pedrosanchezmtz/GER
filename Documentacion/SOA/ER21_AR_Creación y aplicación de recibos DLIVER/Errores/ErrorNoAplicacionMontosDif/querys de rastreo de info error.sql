--Rsatreo de informacion 
select  h.estatus,h.numero_documento,sum(l.total),
h.fecha_movimiento,h.tabla_puente_id,
h.sistema_origen,h.tipo_documento,h.sucursal_venta,h.referencia_aplicacion,h.creation_date,h.adicional2
from iner_xxer_puente_header_tbl h
LEFT JOIN  iner_xxer_puente_lines_tbl l
    on      h.tabla_puente_id=l.tabla_puente_id
where 1=1
--and h.tabla_puente_id=''
and h.tipo_documento='RECIBO'--'FACTURA'--'LIQUIDACION'
and numero_documento in('0993152955')--'TT-4189','TT-4188','TT-4187','TT-4186','TT-4184','TT-4183')
--and trunc(fecha_movimiento) = to_date('06/03/2019','DD/MM/RRRR')
and h.estatus='E'
group by h.estatus,h.numero_documento,
h.fecha_movimiento,h.referencia_aplicacion,h.tabla_puente_id,
h.sistema_origen,h.tipo_documento,h.sucursal_venta,h.creation_date,h.adicional2
order by h.fecha_movimiento desc

--rastreo en tablas de creacion y aplicacion de recibos

with
RE as
(select tabla_puente_id,amount_recibo,receipt_number,receipt_id,estatus,error_description , creation_date
from xxer_ar_receipt_tbl
where 1=1
--and receipt_number='0993152955'
),
REA as
(select tabla_puente_id,amount,trx_number,estatus,error_description 
from xxer_ar_receipt_apply_tbl
where 1=1
and estatus='E')
select
RE.tabla_puente_id,
RE.amount_recibo "Monto Recibo",
RE.receipt_number "Numero Recibo",
RE.estatus "Estatus Recibo",
REA.trx_number "Transacccion",
REA.amount "Monto Aplicacion",
REA.estatus "Estatus Aplicacion",
RE.error_description "Descripcion error Recibo",
REA.error_description "Descripcion error Aplicacion"
from RE LEFT JOIN REA on REA.tabla_puente_id=RE.tabla_puente_id
order by creation_date desc



--se ubica el recibo para saber su id de moviento  
   select 
      DN.UNIDAD_NEGOCIO        
      ,'RECIBO' TIPO_DOC
      ,'PROPIO' TIPO_MOVIMIENTO
      ,dn.RFC RFC_DLIVER
      ,cl.NOMBRE
      ,cl.RFC 
      ,'PUEBLA' desc_plaza
      ,TD.REFERENCIA_DEPOSITO NUMERO_DOCUMENTO
      ,TD.FECHA_DEPOSITO FECHA_INGRESO
      ,TD.REFERENCIA_DEPOSITO REF_APLICACION
      ,TD.ID_DEPOSITO ID_MOVIMIENTO
      ,'' no_guia
      ,td.rowid
      ,'SIN ASIGNAR' destino_servicio
      ,'CRE' forma_pago
      ,'NUM DEPOSITO:'||TD.NUM_DEPOSITO LINEA_PAGO
      ,'N/A' UNIDAD_MEDIDA
      ,TD.MONTO_DEPOSITO SUBTOTAL
      ,'AR_IVA_EXENTO' AR_IVA_EXENTO
      ,TD.MONTO_DEPOSITO TOTAL
      ,TD.FECHA_INGRESO CREATION_DATE
      ,TB.DESCRIPCION_BANCO
  from XXER_DATOS_NEGOCIO_TBL DN
    ,ZAMTRA_TRAFICO_DEPOSITO TD
    ,ZAMTRA_TRAFICO_CLIENTE CL
    ,ZAMTRA_TRAFICO_BANCO TB
 where DN.UNIDAD_NEGOCIO = 'TRATECSA'
   and TD.ID_CLIENTE = CL.ID_CLIENTE
   --and TD.REPLICADO_AR = 'N'
   and TD.STATUS_DEPOSITO in ('A','R')
   AND TD.ID_BANCO = TB.ID_BANCO
   and to_char(TD.FECHA_DEPOSITO,'RRRR/MM/DD') = '2021/04/29' -- TEMPORAL 130519
  order by TD.FECHA_DEPOSITO;


//en base a este se busca en las siguientes tablas montos y facturas que deben aplicarse a estas facturas    


   select TG.NUM_GUIA
  ,RM.MONTO
  from ZAMTRA_TRAFICO_RENGLON_MOV rm
    ,ZAMTRA_TRAFICO_GUIA tg
 where RM.NO_GUIA = TG.NO_GUIA 
   and RM.ID_DEPOSITO = 1322;
   
   
   
//el monto de las facturas sale de las suiguientes tablas
select * from iner_xxer_puente_lines_tbl where tabla_puente_id=117683

 Select fac.no_guia
      ,REPLACE(fac.num_guia,'700000','DL') FAC_NUMERO
      ,TO_CHAR(FAC.FECHA_INGRESO,'DD/MM/YYYY') FECHA 
      ,CLI.NOMBRE
      ,CLI.RFC
      ,'TRATECSA' sucursal
      ,fac.tipo_cobro
      ,TFE.num_guia
      From ZAMTRA_TRAFICO_GUIA FAC
      ,ZAMTRA_TRAFICO_CLIENTE cli
      ,ZAMTRA_TRAFICO_FACTURA_ELEC TFE
      Where FAC.ID_CLIENTE  = CLI.ID_CLIENTE
      And fac.REPLICADO_AR = 'N' -- TEMPORAL 130419
      And FAC.num_guia = 'TT-4189' -- TEMPORAL 130419
      And fac.id_area_facturacion = '1'
      And fac.no_viaje = '0' 
      And fac.tipo_doc ='1'  
      And fac.STATUS_GUIA = 'C'  
      and FAC.FOLIO_FACTURA Is Null 
      And FAC.no_guia = TFE.no_guia
      --And TO_CHAR(FAC.FECHA_INGRESO,'RRRR/MM') = '2019/03' '; -- TEMPORAL 130519
      And FAC.num_guia = TFE.num_guia
      --And to_char(TFE.FECHA_INGRESO,'DD/MM/RRRR') = '25/02/2021'
      AND not exists (select 1 
                 from ZAMTRA_TRAFICO_FACTURA_ELEC TFE2 
                where TFE2.num_guia = TFE.num_guia 
                  and TFE2.status_cancel = 5) ;
                  
                 --- lineas
                  
                  
                  SELECT TG.NO_GUIA TRX_LINE_ID,
                             NVL (TOP.DESC_PRODUCTO, 'NO USAR') CONCEPTO,
                             'FLETE_'|| NVL (gui.num_guia, TG.num_guia)||'_'||TO_CHAR (SYSDATE, 'DD/MM/RRRR') description,
                             to_number(nvl(GUI.flete,tg.flete),'99999999.999999') unit_selling_price,
                             to_number(nvl(GUI.iva_guia,tg.iva_guia) - NVL((select sum(tgo.monto_iva_otro) from ZAM_TRAFICO_GUIA_OTRO tgo where tgo.no_guia = GUI.no_guia),0),'99999999.999999') MONTO_IVA,
                             to_number(nvl(GUI.monto_retencion,tg.monto_retencion) - NVL((select sum(tgo.monto_retencion) from ZAM_TRAFICO_GUIA_OTRO tgo where tgo.no_guia = GUI.no_guia),0),'99999999.999999') MONTO_IVA_RETENIDO,
                             DECODE(TIPO_IVA,'IVA 16%','AR_IVA16','IVA 11%','AR_IVA11','IVA Exento','AR_IVA_EXENTO') strCodigoIva,
                             DECODE(RET.DESCRIPCION,'Retencion del 4%','AR_RET04') strcodigoretencion,
                             (IV.FACTOR_IVA *100) strCodigoIva,
                             (RET.FACTOR_RETENCION*100) strCodigoRetencion
                            FROM ZAMTRA_TRAFICO_GUIA TG,
                             ZAMTRA_TRAFICO_GUIA GUI,
                             ZAMTRA_TRAFICO_PRODUCTO top,
                             ZAMTRA_GENERAL_IVAS iv,
                             ZAMTRA_GENERAL_RETENCIONES ret
                             WHERE     1 = 1
                             --and tg.no_guia = ' 9299 '
                             AND TG.NO_GUIA =17750
                             AND TG.ID_IVA=IV.ID_IVA
                             AND TG.ID_RETENCION=RET.ID_RETENCION
                             AND TG.NUM_GUIA = GUI.NUM_GUIA_ASIGNADO
                       --      AND GUI.ID_TIPO_OPERACION = top.ID_TIPO_OPERACION'
                             AND GUI.ID_FRACCION = top.ID_FRACCION(+)
                             AND top.id_producto = '1' -- IMM Temporal 091115
                             AND TG.flete > 0 
                       --  GROUP BY tg.no_guia,
                       --      NVL (TOP.TIPO_OPERACION, 'SIN ASIGNAR'),
                       --      'FLETE_ NVL (gui.num_guia, TG.num_guia)'_TO_CHAR (SYSDATE, 'DD/MM/RRRR'),
                       --      DECODE(TIPO_IVA,'IVA 16%','AR_IVA16','IVA 11%','AR_IVA11','IVA Exento','AR_IVA_EXENTO'),
                       --      DECODE(RET.DESCRIPCION,'Retencion del 4%','AR_RET04'),
                       --      (IV.FACTOR_IVA *100),
                       --      (RET.FACTOR_RETENCION*100)'
                          UNION ALL
                          SELECT TGO.NO_GUIA TRX_LINE_ID,
                           tgo.desc_otro concepto,
                           tgo.desc_otro|| '_' || TO_CHAR (SYSDATE, 'DD/MM/RRRR') description,
                           to_number(tgo.monto,'99999999.999999') unit_selling_price,
                          to_number(tgo.monto_iva_otro,'99999999.999999') MONTO_IVA,
                           to_number(tgo.monto_retencion,'99999999.999999') MONTO_IVA_RETENIDO,
                           DECODE(TIPO_IVA,'IVA 16%','AR_IVA16','IVA 11%','AR_IVA11','IVA Exento','AR_IVAEXENTO') strCodigoIva,
                           DECODE(RET.DESCRIPCION,'Retencion del 4%','AR_RET04') strcodigoretencion,
                           (IV.FACTOR_IVA *100) strtasa_iva,
                           (RET.FACTOR_RETENCION*100) strtasa_retension
                           FROM ZAMTRA_TRAFICO_GUIA_OTRO tgo,
                           ZAMTRA_GENERAL_IVAS iv,
                           ZAMTRA_GENERAL_RETENCIONES ret
                           WHERE 1 = 1 
                           AND tgo.no_guia =17750
                           AND tgo.ID_IVA=IV.ID_IVA
                           AND tgo.ID_RETENCION=RET.ID_RETENCION;
   
   -- CALCULOS apolo
      select 
      sum("Transaction_Line_Amount")  Lines,
      sum(case v."Tax_Classification_Code" 
      when 'TAS-IVAAR16%' 
      then v."Transaction_Line_Amount"*.16
      when 'TAS-RETAR04%' 
      then -v."Transaction_Line_Amount"*.04
      ELSE 0
      end ) Tax
      from iner_xxer_ar_invoices_v v
      where v."Transaction_Number"='TT-4184'--