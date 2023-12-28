 WITH
 CB AS(
select sm.num_pago_amex as Num_Pago,sm.identificacion_establecimiento as Num_Establecimiento,trs.num_factura_referencia as Referencia_Factura,TO_DATE(sm.fecha_pago,'YYYYMMDD')as Fecha_Pago,TO_DATE(trs.fecha_transaccion,'YYYYMMDD')as Fecha_Transaccion,
TO_NUMBER(sm.monto_bruto_pago)/100 as Monto_Pago,TO_NUMBER(sm.monto_neto_pago)/100 as Monto_Pago_Neto,
TO_NUMBER(trs.monto_transaccion)/100 Monto_Trasaccion,trs.moneda_pago as Moneda
from xxer_bancos_amex_header_tbl hd
INNER JOIN  xxer_bancos_amex_summary_tbl sm on hd.id=sm.id_header
INNER JOIN  xxer_bancos_amex_transactn_tbl trs on sm.num_pago_amex=trs.num_pago_amex
--LEFT JOIN  xxer_bancos_amex_adjustment_tbl ajs on sm.num_pago_amex=ajs.num_pago_amex
--WHERE sm.num_pago_amex=2520025031 --AND TO_DATE(trs.fecha_transaccion,'YYYYMMDD')=TO_DATE('31/08/2021','DD/MM/YYYY')
),
BV AS (SELECT REFERENCIA_AMX,TIPO_PAGO,ADICIONAL17,TIPO_OPERACION,REFERENCIA,SUBSTR(SUBSTR(REFERENCIA_PAGO,INSTR(REFERENCIA_PAGO,';')+1 ,LENGTH(REFERENCIA_PAGO)),1,INSTR(SUBSTR(REFERENCIA_PAGO,INSTR(REFERENCIA_PAGO,';')+1 ,LENGTH(REFERENCIA_PAGO)),';',-2)-1) REFERENCIA_PAGO,NUMERO_DOCUMENTO 
                FROM PCENTRAL.EXTRACCION_VENTA_TP_VIEW@PCENTRAL_LINK.ESTRELLAROJA.COM.MX
                WHERE TRUNC(CORTE_FECHA_CREACION) BETWEEN TO_DATE('01/08/2021','DD/MM/YYYY') AND TO_DATE('30/09/2021','DD/MM/YYYY')AND TIPO_PAGO != 'EFE'),
                 BVT AS(SELECT REFERENCIA_AMX,NUMERO_DOCUMENTO FROM BV  WHERE  TIPO_OPERACION != 'HO' AND NVL (TO_NUMBER(ADICIONAL17),0) = 0 
                      GROUP BY REFERENCIA_AMX,NUMERO_DOCUMENTO),
                 BVP AS(SELECT REFERENCIA_PAGO,NUMERO_DOCUMENTO FROM BV WHERE  TIPO_OPERACION = 'HO' 
                      GROUP BY REFERENCIA_PAGO,NUMERO_DOCUMENTO),
                BT AS (SELECT CB.Num_Pago,CB.Num_Establecimiento,
                CB.Monto_Pago,CB.Monto_Pago_Neto,
                SUM(CB.Monto_Trasaccion) AS Monto_Documento,Fecha_Pago,Fecha_Transaccion,BVT.NUMERO_DOCUMENTO,h.NUMERO_DOCUMENTO AS NUMERO_DOCUMENTO_SOA,sum(l.total) AS MONTO_DOC_SOA,
                LISTAGG(CB.Referencia_Factura, ',') WITHIN  GROUP (ORDER BY CB.Referencia_Factura) AS Referencias_Facturas
                FROM CB INNER JOIN BVT ON CB.Referencia_Factura = BVT.REFERENCIA_AMX
                INNER JOIN xxer_tbl_puente_header h
                             LEFT JOIN  xxer_tbl_puente_lines l
                                      on      h.tabla_puente_id=l.tabla_puente_id
                                       ON  BVT.NUMERO_DOCUMENTO =h.NUMERO_DOCUMENTO
                GROUP BY CB.Num_Pago,CB.Num_Establecimiento,Fecha_Transaccion,BVT.NUMERO_DOCUMENTO,h.NUMERO_DOCUMENTO,Monto_Pago,Fecha_Pago,Monto_Pago_Neto
                UNION ALL 
                SELECT CB.Num_Pago,CB.Num_Establecimiento,
                CB.Monto_Pago,CB.Monto_Pago_Neto,
                SUM(CB.Monto_Trasaccion) AS Monto_Documento,Fecha_Pago,Fecha_Transaccion,BVP.NUMERO_DOCUMENTO,h.NUMERO_DOCUMENTO AS NUMERO_DOCUMENTO_SOA,sum(l.total) AS MONTO_DOC_SOA,
                LISTAGG(CB.Referencia_Factura, ',') WITHIN  GROUP (ORDER BY CB.Referencia_Factura) AS Referencias_Facturas
                FROM CB INNER JOIN BVP ON CB.Referencia_Factura = BVP.REFERENCIA_PAGO
                INNER JOIN xxer_tbl_puente_header h
                             LEFT JOIN  xxer_tbl_puente_lines l
                                      on      h.tabla_puente_id=l.tabla_puente_id
                                       ON  BVP.NUMERO_DOCUMENTO =h.NUMERO_DOCUMENTO
                GROUP BY CB.Num_Pago,CB.Num_Establecimiento,Fecha_Transaccion,BVP.NUMERO_DOCUMENTO,h.NUMERO_DOCUMENTO,Monto_Pago,Fecha_Pago,Monto_Pago_Neto)
                SELECT Num_Pago,Num_Establecimiento,Monto_Pago,Monto_Pago_Neto,
                Monto_Pago-SUM(Monto_Documento) AS DIFERENCIA,
                SUM(Monto_Documento) AS Monto_Documentos,
                Fecha_Pago,
                LISTAGG(Fecha_Transaccion, ',') WITHIN  GROUP (ORDER BY Fecha_Transaccion) AS Fechas_Transacciones,
                LISTAGG(NUMERO_DOCUMENTO||'_'||Monto_Documento, ',') WITHIN  GROUP (ORDER BY NUMERO_DOCUMENTO) AS NUMEROS_DOCUMENTOS,
                LISTAGG(NUMERO_DOCUMENTO_SOA||'_'||MONTO_DOC_SOA, ',') WITHIN  GROUP (ORDER BY NUMERO_DOCUMENTO_SOA) AS NUMEROS_DOCUMENTOS_SOA,
                LISTAGG(Referencias_Facturas, ',') WITHIN  GROUP (ORDER BY Referencias_Facturas) AS Referencias_Facturas
                FROM BT 
                GROUP BY Fecha_Pago,Num_Pago,Num_Establecimiento,Monto_Pago,Monto_Pago_Neto
				
				
				
--VERSION QUE CONCILIA CON VISTA 

 WITH
 VC AS (SELECT inv.REFERENCE_PAYMENT,inv.METODO_RECIBO,max(inv.TOLERANCIA)as TOLERANCIA,TO_DATE(SUBSTR(inv.REFERENCE_PAYMENT, -8,8),'DDMMYYYY') AS FECHA,TO_NUMBER(SUBSTR(inv.REFERENCE_PAYMENT, -19,10)) AS AMEX
     FROM XXER_AR_INVOICES_CONCILIACION_V inv
     where 1=1 AND TRUNC(inv.FECHA_MOVIMIENTO)>= TRUNC(inv.FECHA_MOVIMIENTO) AND NVL(inv.unidad_negocio_origen,1)=unidad_negocio_origen
     and inv.reference_payment=inv.reference_payment AND inv.METODO_RECIBO=inv.METODO_RECIBO AND SUBSTR(inv.reference_payment,1,9) IN ( 'AMEXCO SE')
     group by inv.METODO_RECIBO,inv.REFERENCE_PAYMENT),
 CB AS(
select sm.num_pago_amex as Num_Pago,sm.identificacion_establecimiento as Num_Establecimiento,trs.num_factura_referencia as Referencia_Factura,TO_DATE(sm.fecha_pago,'YYYYMMDD')as Fecha_Pago,TO_DATE(trs.fecha_transaccion,'YYYYMMDD')as Fecha_Transaccion,
TO_NUMBER(sm.monto_bruto_pago)/100 as Monto_Pago,TO_NUMBER(sm.monto_neto_pago)/100 as Monto_Pago_Neto,
TO_NUMBER(trs.monto_transaccion)/100 Monto_Trasaccion,trs.moneda_pago as Moneda
from xxer_bancos_amex_header_tbl hd
LEFT JOIN  xxer_bancos_amex_summary_tbl sm on hd.id=sm.id_header
LEFT JOIN  xxer_bancos_amex_transactn_tbl trs on sm.num_pago_amex=trs.num_pago_amex
--LEFT JOIN  xxer_bancos_amex_adjustment_tbl ajs on sm.num_pago_amex=ajs.num_pago_amex
INNER JOIN VC ON sm.identificacion_establecimiento=VC.AMEX AND TO_DATE(trs.fecha_transaccion,'YYYYMMDD')=TRUNC(VC.FECHA)
--WHERE sm.num_pago_amex=2430050005 AND TO_DATE(trs.fecha_transaccion,'YYYYMMDD')=TO_DATE('31/08/2021','DD/MM/YYYY')
),
BV AS (SELECT REFERENCIA_AMX,TIPO_PAGO,ADICIONAL17,TIPO_OPERACION,REFERENCIA,SUBSTR(SUBSTR(REFERENCIA_PAGO,INSTR(REFERENCIA_PAGO,';')+1 ,LENGTH(REFERENCIA_PAGO)),1,INSTR(SUBSTR(REFERENCIA_PAGO,INSTR(REFERENCIA_PAGO,';')+1 ,LENGTH(REFERENCIA_PAGO)),';',-2)-1) REFERENCIA_PAGO,NUMERO_DOCUMENTO 
                FROM PCENTRAL.EXTRACCION_VENTA_TP_VIEW@PCENTRAL_LINK.ESTRELLAROJA.COM.MX
                WHERE TRUNC(CORTE_FECHA_CREACION) BETWEEN TO_DATE('01/08/2021','DD/MM/YYYY') AND TO_DATE('30/09/2021','DD/MM/YYYY')AND TIPO_PAGO != 'EFE'),
                 BVT AS(SELECT REFERENCIA_AMX,NUMERO_DOCUMENTO FROM BV  WHERE  TIPO_OPERACION != 'HO' AND NVL (TO_NUMBER(ADICIONAL17),0) = 0 
                      GROUP BY REFERENCIA_AMX,NUMERO_DOCUMENTO),
                 BVP AS(SELECT REFERENCIA_PAGO,NUMERO_DOCUMENTO FROM BV WHERE  TIPO_OPERACION = 'HO' 
                      GROUP BY REFERENCIA_PAGO,NUMERO_DOCUMENTO),
                BT AS (SELECT CB.Num_Pago,CB.Num_Establecimiento,
                CB.Monto_Pago,CB.Monto_Pago_Neto,
                SUM(CB.Monto_Trasaccion) AS Monto_Documento,Fecha_Pago,Fecha_Transaccion,BVT.NUMERO_DOCUMENTO,h.NUMERO_DOCUMENTO AS NUMERO_DOCUMENTO_SOA,sum(l.total) AS MONTO_DOC_SOA,
                LISTAGG(CB.Referencia_Factura, ',') WITHIN  GROUP (ORDER BY CB.Referencia_Factura) AS Referencias_Facturas
                FROM CB INNER JOIN BVT ON CB.Referencia_Factura = BVT.REFERENCIA_AMX
                INNER JOIN xxer_tbl_puente_header h
                             LEFT JOIN  xxer_tbl_puente_lines l
                                      on      h.tabla_puente_id=l.tabla_puente_id
                                       ON  BVT.NUMERO_DOCUMENTO =h.NUMERO_DOCUMENTO
                GROUP BY CB.Num_Pago,CB.Num_Establecimiento,Fecha_Transaccion,BVT.NUMERO_DOCUMENTO,h.NUMERO_DOCUMENTO,Monto_Pago,Fecha_Pago,Monto_Pago_Neto)
                SELECT Num_Pago,Num_Establecimiento,Monto_Pago,Monto_Pago_Neto,
                Monto_Pago-SUM(Monto_Documento) AS DIFERENCIA,
                SUM(Monto_Documento) AS Monto_Documentos,
                Fecha_Pago,
                LISTAGG(Fecha_Transaccion, ',') WITHIN  GROUP (ORDER BY Fecha_Transaccion) AS Fechas_Transacciones,
                LISTAGG(NUMERO_DOCUMENTO||'_'||Monto_Documento, ',') WITHIN  GROUP (ORDER BY NUMERO_DOCUMENTO) AS NUMEROS_DOCUMENTOS,
                LISTAGG(NUMERO_DOCUMENTO_SOA||'_'||MONTO_DOC_SOA, ',') WITHIN  GROUP (ORDER BY NUMERO_DOCUMENTO_SOA) AS NUMEROS_DOCUMENTOS_SOA,
                LISTAGG(Referencias_Facturas, ',') WITHIN  GROUP (ORDER BY Referencias_Facturas) AS Referencias_Facturas
                FROM BT 
                GROUP BY Fecha_Pago,Num_Pago,Num_Establecimiento,Monto_Pago,Monto_Pago_Neto
				

--DETALLE 


						  
						  
						  --QUERY FINAL NO ENCONTRADO TRANSCION 
 WITH
 CB AS(
select sm.num_pago_amex as Num_Pago,sm.identificacion_establecimiento as Num_Establecimiento,trs.num_factura_referencia as Referencia_Factura,TO_DATE(sm.fecha_pago,'YYYYMMDD')as Fecha_Pago,TO_DATE(trs.fecha_transaccion,'YYYYMMDD')as Fecha_Transaccion,
TO_NUMBER(sm.monto_bruto_pago)/100 as Monto_Pago,TO_NUMBER(sm.monto_neto_pago)/100 as Monto_Pago_Neto,
TO_NUMBER(trs.monto_transaccion)/100 Monto_Trasaccion,trs.moneda_pago as Moneda
from xxer_bancos_amex_header_tbl hd
INNER JOIN  xxer_bancos_amex_summary_tbl sm on hd.id=sm.id_header
INNER JOIN  xxer_bancos_amex_transactn_tbl trs on sm.num_pago_amex=trs.num_pago_amex
--LEFT JOIN  xxer_bancos_amex_adjustment_tbl ajs on sm.num_pago_amex=ajs.num_pago_amex
WHERE --sm.num_pago_amex=2520025031 --AND 
TO_DATE(sm.fecha_pago,'YYYYMMDD')<TO_DATE('30/09/2021','DD/MM/YYYY')
),
BV AS (SELECT REFERENCIA_AMX,TIPO_PAGO,ADICIONAL17,TIPO_OPERACION,REFERENCIA,SUBSTR(SUBSTR(REFERENCIA_PAGO,INSTR(REFERENCIA_PAGO,';')+1 ,LENGTH(REFERENCIA_PAGO)),1,INSTR(SUBSTR(REFERENCIA_PAGO,INSTR(REFERENCIA_PAGO,';')+1 ,LENGTH(REFERENCIA_PAGO)),';',-2)-1) REFERENCIA_PAGO,NUMERO_DOCUMENTO 
                FROM PCENTRAL.EXTRACCION_VENTA_TP_VIEW@PCENTRAL_LINK.ESTRELLAROJA.COM.MX
                WHERE TRUNC(CORTE_FECHA_CREACION) BETWEEN TO_DATE('20/08/2021','DD/MM/YYYY') AND TO_DATE('01/10/2021','DD/MM/YYYY')AND TIPO_PAGO != 'EFE'),
                 BVT AS(SELECT REFERENCIA_AMX,NUMERO_DOCUMENTO FROM BV  WHERE  TIPO_OPERACION != 'HO' AND NVL (TO_NUMBER(ADICIONAL17),0) = 0 
                      GROUP BY REFERENCIA_AMX,NUMERO_DOCUMENTO),
                 BVP AS(SELECT REFERENCIA_PAGO,NUMERO_DOCUMENTO FROM BV WHERE  TIPO_OPERACION = 'HO' 
                      GROUP BY REFERENCIA_PAGO,NUMERO_DOCUMENTO),
                BT AS (SELECT CB.Num_Pago,CB.Num_Establecimiento,
                CB.Monto_Pago,CB.Monto_Pago_Neto,
                SUM(CB.Monto_Trasaccion) AS Monto_Documento,Fecha_Pago,Fecha_Transaccion,BVT.NUMERO_DOCUMENTO,
                LISTAGG(CB.Referencia_Factura, ',') WITHIN  GROUP (ORDER BY CB.Referencia_Factura) AS Referencias_Facturas
                FROM CB INNER JOIN BVT ON CB.Referencia_Factura = BVT.REFERENCIA_AMX                
                GROUP BY CB.Num_Pago,CB.Num_Establecimiento,Fecha_Transaccion,BVT.NUMERO_DOCUMENTO,Monto_Pago,Fecha_Pago,Monto_Pago_Neto
                UNION ALL 
                SELECT CB.Num_Pago,CB.Num_Establecimiento,
                CB.Monto_Pago,CB.Monto_Pago_Neto,
                SUM(CB.Monto_Trasaccion) AS Monto_Documento,Fecha_Pago,Fecha_Transaccion,BVP.NUMERO_DOCUMENTO,
                LISTAGG(CB.Referencia_Factura, ',') WITHIN  GROUP (ORDER BY CB.Referencia_Factura) AS Referencias_Facturas
                FROM CB INNER JOIN BVP ON CB.Referencia_Factura = BVP.REFERENCIA_PAGO
                GROUP BY CB.Num_Pago,CB.Num_Establecimiento,Fecha_Transaccion,BVP.NUMERO_DOCUMENTO,Monto_Pago,Fecha_Pago,Monto_Pago_Neto)
                SELECT Num_Pago,Num_Establecimiento,Monto_Pago,Monto_Pago_Neto,
                Monto_Pago-SUM(Monto_Documento) AS DIFERENCIA,
                SUM(Monto_Documento) AS Monto_Documentos,
                Fecha_Pago,
                LISTAGG(BT.Fecha_Transaccion, ',') WITHIN  GROUP (ORDER BY BT.Fecha_Transaccion) AS Fechas_Transacciones,
                LISTAGG(BT.NUMERO_DOCUMENTO||'_'||BT.Monto_Documento, ',') WITHIN  GROUP (ORDER BY BT.NUMERO_DOCUMENTO) AS NUMEROS_DOCUMENTOS,
                LISTAGG(h.tabla_puente_id, ',') WITHIN  GROUP (ORDER BY h.tabla_puente_id) AS IDS_TABLA_PUENTE,
                LISTAGG(BT.Referencias_Facturas, ',') WITHIN  GROUP (ORDER BY BT.Referencias_Facturas) AS Referencias_Facturas
                FROM BT INNER JOIN xxer_tbl_puente_header h
                      ON BT.NUMERO_DOCUMENTO=H.NUMERO_DOCUMENTO
                GROUP BY BT.Fecha_Pago,BT.Num_Pago,BT.Num_Establecimiento,BT.Monto_Pago,BT.Monto_Pago_Neto
				
				
NO SE ENCUENTRA EN TMS
PAGO:2520025031 , 13/09/21
NO ENCONTRADA :378619271
  
  
select sm.num_pago_amex as Num_Pago,sm.identificacion_establecimiento as Num_Establecimiento,trs.num_factura_referencia as Referencia_Factura,TO_DATE(sm.fecha_pago,'YYYYMMDD')as Fecha_Pago,TO_DATE(trs.fecha_transaccion,'YYYYMMDD')as Fecha_Transaccion,
TO_NUMBER(sm.monto_bruto_pago)/100 as Monto_Pago,TO_NUMBER(sm.monto_neto_pago)/100 as Monto_Pago_Neto,
TO_NUMBER(trs.monto_transaccion)/100 Monto_Trasaccion,trs.moneda_pago as Moneda
from xxer_bancos_amex_header_tbl hd
INNER JOIN  xxer_bancos_amex_summary_tbl sm on hd.id=sm.id_header
INNER JOIN  xxer_bancos_amex_transactn_tbl trs on sm.num_pago_amex=trs.num_pago_amex
--LEFT JOIN  xxer_bancos_amex_adjustment_tbl ajs on sm.num_pago_amex=ajs.num_pago_amex
WHERE sm.num_pago_amex=2520025031 
AND TO_DATE(sm.fecha_pago,'YYYYMMDD')=TO_DATE('13/09/2021','DD/MM/YYYY')