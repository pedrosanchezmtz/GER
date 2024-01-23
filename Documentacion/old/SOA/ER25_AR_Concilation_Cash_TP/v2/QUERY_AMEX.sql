 WITH
 VC AS (SELECT inv.REFERENCE_PAYMENT,inv.METODO_RECIBO,max(inv.TOLERANCIA)as TOLERANCIA,TO_DATE(SUBSTR(inv.REFERENCE_PAYMENT, -8,8),'DDMMYYYY') AS FECHA,TO_NUMBER(SUBSTR(inv.REFERENCE_PAYMENT, -19,10)) AS AMEX
     FROM XXER_AR_INVOICES_CONCILIACION_V inv
     where 1=1 AND TRUNC(inv.FECHA_MOVIMIENTO)>= TRUNC(inv.FECHA_MOVIMIENTO) AND NVL(inv.unidad_negocio_origen,1)=unidad_negocio_origen
     and inv.reference_payment=inv.reference_payment AND inv.METODO_RECIBO=inv.METODO_RECIBO AND SUBSTR(inv.reference_payment,1,9) IN ( 'AMEXCO SE')
     group by inv.METODO_RECIBO,inv.REFERENCE_PAYMENT),
 CB AS(
select VC.REFERENCE_PAYMENT,VC.METODO_RECIBO,VC.TOLERANCIA,sm.num_pago_amex as Num_Pago,sm.identificacion_establecimiento as Num_Establecimiento,trs.num_factura_referencia as Referencia_Factura,TO_DATE(sm.fecha_pago,'YYYYMMDD')as Fecha_Pago,TO_DATE(trs.fecha_transaccion,'YYYYMMDD')as Fecha_Transaccion,
TO_NUMBER(sm.monto_bruto_pago)/100 as Monto_Pago,TO_NUMBER(sm.monto_neto_pago)/100 as Monto_Pago_Neto,
TO_NUMBER(trs.monto_transaccion)/100 Monto_Trasaccion,trs.moneda_pago as Moneda
from xxer_bancos_amex_header_tbl hd
INNER JOIN  xxer_bancos_amex_summary_tbl sm on hd.id=sm.id_header
INNER JOIN  xxer_bancos_amex_transactn_tbl trs on sm.num_pago_amex=trs.num_pago_amex
--LEFT JOIN  xxer_bancos_amex_adjustment_tbl ajs on sm.num_pago_amex=ajs.num_pago_amex
INNER JOIN VC ON sm.identificacion_establecimiento=VC.AMEX AND TO_DATE(SM.FECHA_PAGO,'YYYYMMDD')=TRUNC(VC.FECHA)
WHERE --sm.num_pago_amex=2520025031 --AND 
TO_DATE(sm.fecha_pago,'YYYYMMDD')<TO_DATE('30/09/2021','DD/MM/YYYY')
),
BV AS (SELECT REFERENCIA_AMX,NUMERO_DOCUMENTO
 ,LISTAGG(FOLIO_PREIMPRESO_SOLO, ',') WITHIN  GROUP (ORDER BY FOLIO_PREIMPRESO_SOLO) AS FOLIO_PREIMPRESOS
                FROM PCENTRAL.EXTRACCION_VENTA_TP_VIEW@PCENTRAL_LINK.ESTRELLAROJA.COM.MX
                WHERE TRUNC(CORTE_FECHA_CREACION) BETWEEN TO_DATE('20/08/2021','DD/MM/YYYY') AND TO_DATE('01/10/2021','DD/MM/YYYY')AND TIPO_PAGO != 'EFE'
				AND TIPO_OPERACION NOT IN ('HO','FO') --AND NVL (TO_NUMBER(ADICIONAL17),0) = 0 
				GROUP BY REFERENCIA_AMX,NUMERO_DOCUMENTO
				),
BVM AS(
			 SELECT
	VM.NUMERO_DOCUMENTO,SUBSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO))
,1,INSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO)),';',-2)-1) REFERENCIA_AMX
	,LISTAGG(BR.FOLIO_PREIMPRESO, ',') WITHIN  GROUP (ORDER BY BR.FOLIO_PREIMPRESO) AS FOLIO_PREIMPRESOS
	FROM EXTRACCION_MISCELANEA_TP_VIEW@PCENTRAL_LINK.ESTRELLAROJA.COM.MX VM
	INNER JOIN TMS_CORTES_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX CR
	ON (CR.CORTE_ID = VM.CORTE_ID)
	INNER JOIN TMS_BOLETOS_VENTA_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX VT
	ON (VT.FOLIO_PREIMPRESO = VM.NO_FOLIO
	AND TRUNC(VT.FECHA_CREACION) BETWEEN TO_DATE('01/08/2021','DD/MM/YYYY') AND TO_DATE('01/10/2021','DD/MM/YYYY')
	--AND VT.TIPO_TRANSACCION = 'L'
	--AND VT.TIPO_PAGO IN ('BBV','BAB')
	)
	INNER JOIN TMS_BOLETOS_VENTA_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX BR
	ON BR.BOLETO_RELACIONADO_ID = VT.BOLETO_ID AND BR.TIPO_PAGO NOT IN ('EFE')
	where 1=1
	--AND SUBSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO)),1,INSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO)),';',-2)-1)='356087540'
	and  TRUNC(VM.CORTE_FECHA_CREACION) BETWEEN TO_DATE('01/08/2021','DD/MM/YYYY') AND TO_DATE('01/10/2021','DD/MM/YYYY')
	GROUP BY VM.NUMERO_DOCUMENTO,SUBSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO))
,1,INSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO)),';',-2)-1)
					),
                BT AS (SELECT CB.REFERENCE_PAYMENT,CB.METODO_RECIBO,CB.TOLERANCIA,CB.Num_Pago,CB.Num_Establecimiento,
                CB.Monto_Pago,CB.Monto_Pago_Neto,
                SUM(CB.Monto_Trasaccion) AS Monto_Documento,Fecha_Pago,Fecha_Transaccion,BV.NUMERO_DOCUMENTO,
                LISTAGG(CB.Referencia_Factura, ',') WITHIN  GROUP (ORDER BY CB.Referencia_Factura) AS Referencias_Facturas
                FROM CB INNER JOIN BV ON CB.Referencia_Factura = BV.REFERENCIA_AMX                
                GROUP BY CB.REFERENCE_PAYMENT,CB.METODO_RECIBO,CB.TOLERANCIA,CB.Num_Pago,CB.Num_Establecimiento,Fecha_Transaccion,BV.NUMERO_DOCUMENTO,Monto_Pago,Fecha_Pago,Monto_Pago_Neto
                UNION ALL 
                SELECT CB.REFERENCE_PAYMENT,CB.METODO_RECIBO,CB.TOLERANCIA,CB.Num_Pago,CB.Num_Establecimiento,
                CB.Monto_Pago,CB.Monto_Pago_Neto,
                SUM(CB.Monto_Trasaccion) AS Monto_Documento,Fecha_Pago,Fecha_Transaccion,BVM.NUMERO_DOCUMENTO,
                LISTAGG(CB.Referencia_Factura, ',') WITHIN  GROUP (ORDER BY CB.Referencia_Factura) AS Referencias_Facturas
                FROM CB INNER JOIN BVM ON CB.Referencia_Factura = BVM.REFERENCIA_AMX
                GROUP BY CB.REFERENCE_PAYMENT,CB.METODO_RECIBO,CB.TOLERANCIA,CB.Num_Pago,CB.Num_Establecimiento,Fecha_Transaccion,BVM.NUMERO_DOCUMENTO,Monto_Pago,Fecha_Pago,Monto_Pago_Neto)
                SELECT BT.REFERENCE_PAYMENT,BT.METODO_RECIBO,
				Num_Pago,Num_Establecimiento,
				Monto_Pago,
				Monto_Pago_Neto,
                Monto_Pago-SUM(Monto_Documento) AS DIFERENCIA,
                SUM(Monto_Documento)-(Monto_Pago-Monto_Pago_Neto) AS IMPORTE_TMS,
				BT.TOLERANCIA,
                Fecha_Pago,
               -- LISTAGG(BT.Fecha_Transaccion, ',') WITHIN  GROUP (ORDER BY BT.Fecha_Transaccion) AS Fechas_Transacciones,
                LISTAGG(BT.NUMERO_DOCUMENTO||'_'||BT.Monto_Documento, ',') WITHIN  GROUP (ORDER BY BT.NUMERO_DOCUMENTO) AS NUMEROS_DOCUMENTOS,
                LISTAGG(h.tabla_puente_id, ',') WITHIN  GROUP (ORDER BY h.tabla_puente_id) AS TABLA_PUENTE_IDs
                --,LISTAGG(BT.Referencias_Facturas, ',') WITHIN  GROUP (ORDER BY BT.Referencias_Facturas) AS Referencias_Facturas
                FROM BT INNER JOIN xxer_tbl_puente_header h
                      ON BT.NUMERO_DOCUMENTO=H.NUMERO_DOCUMENTO
                GROUP BY BT.REFERENCE_PAYMENT,BT.METODO_RECIBO,BT.TOLERANCIA,BT.Monto_Pago,BT.Monto_Pago_Neto,BT.Fecha_Pago,BT.Num_Establecimiento,BT.Num_Pago
				ORDER BY DIFERENCIA ASC
				
				
WITH
 VC AS (SELECT inv.REFERENCE_PAYMENT,inv.METODO_RECIBO,TO_DATE(SUBSTR(inv.REFERENCE_PAYMENT, -8,8),'DDMMYYYY') AS FECHA,TO_NUMBER(SUBSTR(inv.REFERENCE_PAYMENT, -19,10)) AS AMEX
     FROM XXER_AR_INVOICES_CONCILIACION_V inv
     where 1=1 AND TRUNC(inv.FECHA_MOVIMIENTO)>= TRUNC(inv.FECHA_MOVIMIENTO) AND NVL(inv.unidad_negocio_origen,1)=unidad_negocio_origen
     and inv.reference_payment=inv.reference_payment AND inv.METODO_RECIBO=inv.METODO_RECIBO AND SUBSTR(inv.reference_payment,1,9) IN ( 'AMEXCO SE')
     group by inv.METODO_RECIBO,inv.REFERENCE_PAYMENT)
select VC.REFERENCE_PAYMENT,VC.METODO_RECIBO,TO_NUMBER(sm.monto_bruto_pago)/100 as Monto_Pago,TO_NUMBER(sm.monto_neto_pago)/100 as Monto_Pago_Neto
FROM  xxer_bancos_amex_summary_tbl sm 
INNER JOIN VC ON sm.identificacion_establecimiento=VC.AMEX AND TO_DATE(SM.FECHA_PAGO,'YYYYMMDD')=TRUNC(VC.FECHA)



SELECT
CORTE_FECHA_CREACION,
NUMERO_DOCUMENTO,
SUBSTR(SUBSTR(REFERENCIA_PAGO,INSTR(REFERENCIA_PAGO,';')+1 ,LENGTH(REFERENCIA_PAGO))
,1,INSTR(SUBSTR(REFERENCIA_PAGO,INSTR(REFERENCIA_PAGO,';')+1 ,LENGTH(REFERENCIA_PAGO)),';',-2)-1) REFERENCIA_PAGO,
REFERENCIA_AMX,
FOLIO_PREIMPRESO,
TIPO_PAGO
FROM(SELECT
VM.CORTE_FECHA_CREACION,
VM.NUMERO_DOCUMENTO,
BR.REFERENCIA_PAGO ,
BR.ADICIONAL2 REFERENCIA_AMX,
BR.FOLIO_PREIMPRESO,
BR.TIPO_PAGO
FROM EXTRACCION_MISCELANEA_TP_VIEW@PCENTRAL_LINK.ESTRELLAROJA.COM.MX VM
INNER JOIN TMS_CORTES_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX CR
ON (CR.CORTE_ID = VM.CORTE_ID)
INNER JOIN TMS_BOLETOS_VENTA_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX VT
ON (VT.FOLIO_PREIMPRESO = VM.NO_FOLIO
AND VT.CORTE_ID = CR.CORTE_ID--AND TO_DATE(VT.F) = TO_DATE('01/06/2021','DD/MM/YYYY')
AND VT.TIPO_TRANSACCION = 'L'
AND VT.TIPO_PAGO = 'BBV' )
INNER JOIN TMS_BOLETOS_VENTA_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX BR
ON BR.BOLETO_RELACIONADO_ID = VT.BOLETO_ID
WHERE TO_DATE(CORTE_FECHA_CREACION) = TO_DATE('02/06/2021','DD/MM/YYYY'))
WHERE TIPO_PAGO NOT IN 'EFE'


 WITH
 VC AS (SELECT inv.REFERENCE_PAYMENT,inv.METODO_RECIBO,max(inv.TOLERANCIA)as TOLERANCIA,TO_DATE(SUBSTR(inv.REFERENCE_PAYMENT, -8,8),'DDMMYYYY') AS FECHA,TO_NUMBER(SUBSTR(inv.REFERENCE_PAYMENT, -19,10)) AS AMEX
     FROM XXER_AR_INVOICES_CONCILIACION_V inv
     where 1=1 AND TRUNC(inv.FECHA_MOVIMIENTO)>= TRUNC(inv.FECHA_MOVIMIENTO) AND NVL(inv.unidad_negocio_origen,1)=unidad_negocio_origen
     and inv.reference_payment=inv.reference_payment AND inv.METODO_RECIBO=inv.METODO_RECIBO AND SUBSTR(inv.reference_payment,1,9) IN ( 'AMEXCO SE')
     group by inv.METODO_RECIBO,inv.REFERENCE_PAYMENT),
 CB AS(
select VC.REFERENCE_PAYMENT,VC.METODO_RECIBO,VC.TOLERANCIA,sm.num_pago_amex as Num_Pago,sm.identificacion_establecimiento as Num_Establecimiento,trs.num_factura_referencia as Referencia_Factura,TO_DATE(sm.fecha_pago,'YYYYMMDD')as Fecha_Pago,TO_DATE(trs.fecha_transaccion,'YYYYMMDD')as Fecha_Transaccion,
TO_NUMBER(sm.monto_bruto_pago)/100 as Monto_Pago,TO_NUMBER(sm.monto_neto_pago)/100 as Monto_Pago_Neto,
TO_NUMBER(trs.monto_transaccion)/100 Monto_Trasaccion,trs.moneda_pago as Moneda
from xxer_bancos_amex_header_tbl hd
INNER JOIN  xxer_bancos_amex_summary_tbl sm on hd.id=sm.id_header
INNER JOIN  xxer_bancos_amex_transactn_tbl trs on sm.num_pago_amex=trs.num_pago_amex
--LEFT JOIN  xxer_bancos_amex_adjustment_tbl ajs on sm.num_pago_amex=ajs.num_pago_amex
INNER JOIN VC ON sm.identificacion_establecimiento=VC.AMEX AND TO_DATE(SM.FECHA_PAGO,'YYYYMMDD')=TRUNC(VC.FECHA)
--WHERE --sm.num_pago_amex=2520025031 --AND 
--TO_DATE(sm.fecha_pago,'YYYYMMDD')<TO_DATE('30/09/2021','DD/MM/YYYY')
),
BV AS (SELECT REFERENCIA_AMX,TIPO_PAGO,ADICIONAL17,TIPO_OPERACION,REFERENCIA,SUBSTR(SUBSTR(REFERENCIA_PAGO,INSTR(REFERENCIA_PAGO,';')+1 ,LENGTH(REFERENCIA_PAGO)),1,INSTR(SUBSTR(REFERENCIA_PAGO,INSTR(REFERENCIA_PAGO,';')+1 ,LENGTH(REFERENCIA_PAGO)),';',-2)-1) REFERENCIA_PAGO,NUMERO_DOCUMENTO 
                FROM PCENTRAL.EXTRACCION_VENTA_TP_VIEW@PCENTRAL_LINK.ESTRELLAROJA.COM.MX
                WHERE TRUNC(CORTE_FECHA_CREACION) BETWEEN TO_DATE('20/08/2021','DD/MM/YYYY') AND TO_DATE('01/10/2021','DD/MM/YYYY')AND TIPO_PAGO != 'EFE'),
                 BVT AS(SELECT REFERENCIA_AMX,NUMERO_DOCUMENTO FROM BV  WHERE  TIPO_OPERACION NOT IN ('HO','FO') AND NVL (TO_NUMBER(ADICIONAL17),0) = 0 
                      GROUP BY REFERENCIA_AMX,NUMERO_DOCUMENTO),
                 BVP AS(SELECT REFERENCIA_PAGO,NUMERO_DOCUMENTO FROM BV WHERE  TIPO_OPERACION  IN ('HO','FO')  
                      GROUP BY REFERENCIA_PAGO,NUMERO_DOCUMENTO),
                BT AS (SELECT CB.REFERENCE_PAYMENT,CB.METODO_RECIBO,CB.TOLERANCIA,CB.Num_Pago,CB.Num_Establecimiento,
                CB.Monto_Pago,CB.Monto_Pago_Neto,
                SUM(CB.Monto_Trasaccion) AS Monto_Documento,Fecha_Pago,Fecha_Transaccion,BVT.NUMERO_DOCUMENTO,
                LISTAGG(CB.Referencia_Factura, ',') WITHIN  GROUP (ORDER BY CB.Referencia_Factura) AS Referencias_Facturas
                FROM CB INNER JOIN BVT ON CB.Referencia_Factura = BVT.REFERENCIA_AMX                
                GROUP BY CB.REFERENCE_PAYMENT,CB.METODO_RECIBO,CB.TOLERANCIA,CB.Num_Pago,CB.Num_Establecimiento,Fecha_Transaccion,BVT.NUMERO_DOCUMENTO,Monto_Pago,Fecha_Pago,Monto_Pago_Neto
                UNION ALL 
                SELECT CB.REFERENCE_PAYMENT,CB.METODO_RECIBO,CB.TOLERANCIA,CB.Num_Pago,CB.Num_Establecimiento,
                CB.Monto_Pago,CB.Monto_Pago_Neto,
                SUM(CB.Monto_Trasaccion) AS Monto_Documento,Fecha_Pago,Fecha_Transaccion,BVP.NUMERO_DOCUMENTO,
                LISTAGG(CB.Referencia_Factura, ',') WITHIN  GROUP (ORDER BY CB.Referencia_Factura) AS Referencias_Facturas
                FROM CB INNER JOIN BVP ON CB.Referencia_Factura = BVP.REFERENCIA_PAGO
                GROUP BY CB.REFERENCE_PAYMENT,CB.METODO_RECIBO,CB.TOLERANCIA,CB.Num_Pago,CB.Num_Establecimiento,Fecha_Transaccion,BVP.NUMERO_DOCUMENTO,Monto_Pago,Fecha_Pago,Monto_Pago_Neto)
                SELECT BT.REFERENCE_PAYMENT,BT.METODO_RECIBO,
				--Num_Pago,Num_Establecimiento,
				Monto_Pago,
				Monto_Pago_Neto,
                Monto_Pago-SUM(Monto_Documento) AS DIFERENCIA,
                SUM(Monto_Documento)-(Monto_Pago-Monto_Pago_Neto) AS IMPORTE_TMS,
				BT.TOLERANCIA,
               --Fecha_Pago,
               -- LISTAGG(BT.Fecha_Transaccion, ',') WITHIN  GROUP (ORDER BY BT.Fecha_Transaccion) AS Fechas_Transacciones,
                LISTAGG(BT.NUMERO_DOCUMENTO||'_'||BT.Monto_Documento, ',') WITHIN  GROUP (ORDER BY BT.NUMERO_DOCUMENTO) AS NUMEROS_DOCUMENTOS,
                LISTAGG(h.tabla_puente_id, ',') WITHIN  GROUP (ORDER BY h.tabla_puente_id) AS TABLA_PUENTE_IDs
                --,LISTAGG(BT.Referencias_Facturas, ',') WITHIN  GROUP (ORDER BY BT.Referencias_Facturas) AS Referencias_Facturas
                FROM BT INNER JOIN xxer_tbl_puente_header h
                      ON BT.NUMERO_DOCUMENTO=H.NUMERO_DOCUMENTO
                GROUP BY BT.REFERENCE_PAYMENT,BT.METODO_RECIBO,BT.TOLERANCIA,BT.Monto_Pago,BT.Monto_Pago_Neto--,BT.Fecha_Pago,BT.Num_Establecimiento,BT.Num_Pago
				ORDER BY DIFERENCIA ASC
				
				
				
				
				
				--TODOS PAGOS AMEX VERSION 1
				 WITH
 CB AS(
select sm.num_pago_amex as Num_Pago,sm.identificacion_establecimiento as Num_Establecimiento,trs.num_factura_referencia as Referencia_Factura,TO_DATE(sm.fecha_pago,'YYYYMMDD')as Fecha_Pago,TO_DATE(trs.fecha_transaccion,'YYYYMMDD')as Fecha_Transaccion,
TO_NUMBER(sm.monto_bruto_pago)/100 as Monto_Pago,TO_NUMBER(sm.monto_neto_pago)/100 as Monto_Pago_Neto,
TO_NUMBER(trs.monto_transaccion)/100 Monto_Trasaccion,trs.moneda_pago as Moneda
from xxer_bancos_amex_header_tbl hd
INNER JOIN  xxer_bancos_amex_summary_tbl sm on hd.id=sm.id_header
INNER JOIN  xxer_bancos_amex_transactn_tbl trs on sm.num_pago_amex=trs.num_pago_amex
--LEFT JOIN  xxer_bancos_amex_adjustment_tbl ajs on sm.num_pago_amex=ajs.num_pago_amex
--INNER JOIN VC ON sm.identificacion_establecimiento=VC.AMEX AND TO_DATE(SM.FECHA_PAGO,'YYYYMMDD')=TRUNC(VC.FECHA)
WHERE --sm.num_pago_amex=2520025031 --AND 
TO_DATE(sm.fecha_pago,'YYYYMMDD')<TO_DATE('30/09/2021','DD/MM/YYYY')
),
BV AS (SELECT REFERENCIA_AMX,TIPO_PAGO,ADICIONAL17,TIPO_OPERACION,REFERENCIA,SUBSTR(SUBSTR(REFERENCIA_PAGO,INSTR(REFERENCIA_PAGO,';')+1 ,LENGTH(REFERENCIA_PAGO)),1,INSTR(SUBSTR(REFERENCIA_PAGO,INSTR(REFERENCIA_PAGO,';')+1 ,LENGTH(REFERENCIA_PAGO)),';',-2)-1) REFERENCIA_PAGO,NUMERO_DOCUMENTO 
                FROM PCENTRAL.EXTRACCION_VENTA_TP_VIEW@PCENTRAL_LINK.ESTRELLAROJA.COM.MX
                WHERE TRUNC(CORTE_FECHA_CREACION) BETWEEN TO_DATE('20/08/2021','DD/MM/YYYY') AND TO_DATE('30/09/2021','DD/MM/YYYY')AND TIPO_PAGO != 'EFE'),
                 BVT AS(SELECT REFERENCIA_AMX,NUMERO_DOCUMENTO FROM BV  WHERE  TIPO_OPERACION NOT IN ('HO','FO') AND NVL (TO_NUMBER(ADICIONAL17),0) = 0 
                      GROUP BY REFERENCIA_AMX,NUMERO_DOCUMENTO),
                 BVP AS(SELECT REFERENCIA_PAGO,NUMERO_DOCUMENTO FROM BV WHERE  TIPO_OPERACION  IN ('HO','FO')  
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
                SELECT 
				Num_Pago,Num_Establecimiento,
				Monto_Pago,
				Monto_Pago_Neto,
                Monto_Pago-SUM(Monto_Documento) AS DIFERENCIA,
                SUM(Monto_Documento)-(Monto_Pago-Monto_Pago_Neto) AS IMPORTE_TMS,
				--BT.TOLERANCIA,
                Fecha_Pago,
               -- LISTAGG(BT.Fecha_Transaccion, ',') WITHIN  GROUP (ORDER BY BT.Fecha_Transaccion) AS Fechas_Transacciones,
                LISTAGG(BT.NUMERO_DOCUMENTO||'_'||BT.Monto_Documento, ',') WITHIN  GROUP (ORDER BY BT.NUMERO_DOCUMENTO) AS NUMEROS_DOCUMENTOS
                --,LISTAGG(h.tabla_puente_id, ',') WITHIN  GROUP (ORDER BY h.tabla_puente_id) AS TABLA_PUENTE_IDs
                --,LISTAGG(BT.Referencias_Facturas, ',') WITHIN  GROUP (ORDER BY BT.Referencias_Facturas) AS Referencias_Facturas
                FROM BT --INNER JOIN xxer_tbl_puente_header h
                      --ON BT.NUMERO_DOCUMENTO=H.NUMERO_DOCUMENTO
                GROUP BY BT.Monto_Pago,BT.Monto_Pago_Neto,BT.Fecha_Pago,BT.Num_Establecimiento,BT.Num_Pago
				ORDER BY DIFERENCIA ASC
				
				--CONCULTA TODOS LOS PAGOS AMEX VERSION MISELANEO
WITH

 CB AS(
select sm.num_pago_amex as Num_Pago,sm.identificacion_establecimiento as Num_Establecimiento,trs.num_factura_referencia as Referencia_Factura,TO_DATE(sm.fecha_pago,'YYYYMMDD')as Fecha_Pago,TO_DATE(trs.fecha_transaccion,'YYYYMMDD')as Fecha_Transaccion,
TO_NUMBER(sm.monto_bruto_pago)/100 as Monto_Pago,TO_NUMBER(sm.monto_neto_pago)/100 as Monto_Pago_Neto,
TO_NUMBER(trs.monto_transaccion)/100 Monto_Trasaccion,trs.moneda_pago as Moneda
from xxer_bancos_amex_header_tbl hd
INNER JOIN  xxer_bancos_amex_summary_tbl sm on hd.id=sm.id_header
INNER JOIN  xxer_bancos_amex_transactn_tbl trs on sm.num_pago_amex=trs.num_pago_amex
--LEFT JOIN  xxer_bancos_amex_adjustment_tbl ajs on sm.num_pago_amex=ajs.num_pago_amex
--INNER JOIN VC ON sm.identificacion_establecimiento=VC.AMEX AND TO_DATE(SM.FECHA_PAGO,'YYYYMMDD')=TRUNC(VC.FECHA)
WHERE --sm.num_pago_amex=2520025031 --AND 
TO_DATE(sm.fecha_pago,'YYYYMMDD')<TO_DATE('30/09/2021','DD/MM/YYYY')
),
BV AS (SELECT REFERENCIA_AMX,NUMERO_DOCUMENTO
                FROM PCENTRAL.EXTRACCION_VENTA_TP_VIEW@PCENTRAL_LINK.ESTRELLAROJA.COM.MX
                WHERE 
				TRUNC(CORTE_FECHA_CREACION) BETWEEN TO_DATE('20/08/2021','DD/MM/YYYY') AND TO_DATE('01/10/2021','DD/MM/YYYY')
				AND TIPO_PAGO != 'EFE' AND  TIPO_OPERACION NOT IN ('HO','FO') AND NVL (TO_NUMBER(ADICIONAL17),0) = 0 
               GROUP BY REFERENCIA_AMX,NUMERO_DOCUMENTO
                ) ,
BVM AS(
			 SELECT
	VM.NUMERO_DOCUMENTO,SUBSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO))
,1,INSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO)),';',-2)-1) REFERENCIA_AMX
	,LISTAGG(BR.FOLIO_PREIMPRESO, ',') WITHIN  GROUP (ORDER BY BR.FOLIO_PREIMPRESO) AS FOLIO_PREIMPRESOS
	FROM EXTRACCION_MISCELANEA_TP_VIEW@PCENTRAL_LINK.ESTRELLAROJA.COM.MX VM
	INNER JOIN TMS_CORTES_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX CR
	ON (CR.CORTE_ID = VM.CORTE_ID)
	INNER JOIN TMS_BOLETOS_VENTA_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX VT
	ON (VT.FOLIO_PREIMPRESO = VM.NO_FOLIO
	AND TRUNC(VT.FECHA_CREACION) BETWEEN TO_DATE('01/08/2021','DD/MM/YYYY') AND TO_DATE('01/10/2021','DD/MM/YYYY')
	--AND VT.TIPO_TRANSACCION = 'L'
	--AND VT.TIPO_PAGO IN ('BBV','BAB')
	)
	INNER JOIN TMS_BOLETOS_VENTA_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX BR
	ON BR.BOLETO_RELACIONADO_ID = VT.BOLETO_ID AND BR.TIPO_PAGO NOT IN ('EFE')
	where 1=1
	--AND SUBSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO)),1,INSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO)),';',-2)-1)='356087540'
	and  TRUNC(VM.CORTE_FECHA_CREACION) BETWEEN TO_DATE('01/08/2021','DD/MM/YYYY') AND TO_DATE('01/10/2021','DD/MM/YYYY')
	GROUP BY VM.NUMERO_DOCUMENTO,SUBSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO))
,1,INSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO)),';',-2)-1)
					),
                BT AS (SELECT CB.Num_Pago,CB.Num_Establecimiento,
                CB.Monto_Pago,CB.Monto_Pago_Neto,
                SUM(CB.Monto_Trasaccion) AS Monto_Documento,Fecha_Pago,Fecha_Transaccion,BV.NUMERO_DOCUMENTO,
                LISTAGG(CB.Referencia_Factura, ',') WITHIN  GROUP (ORDER BY CB.Referencia_Factura) AS Referencias_Facturas
                FROM CB INNER JOIN BV ON CB.Referencia_Factura = BV.REFERENCIA_AMX                
                GROUP BY CB.Num_Pago,CB.Num_Establecimiento,Fecha_Transaccion,BV.NUMERO_DOCUMENTO,Monto_Pago,Fecha_Pago,Monto_Pago_Neto
                UNION ALL 
                SELECT CB.Num_Pago,CB.Num_Establecimiento,
                CB.Monto_Pago,CB.Monto_Pago_Neto,
                SUM(CB.Monto_Trasaccion) AS Monto_Documento,Fecha_Pago,Fecha_Transaccion,BVM.NUMERO_DOCUMENTO,
                LISTAGG(CB.Referencia_Factura, ',') WITHIN  GROUP (ORDER BY CB.Referencia_Factura) AS Referencias_Facturas
                FROM CB INNER JOIN BVM ON CB.Referencia_Factura = BVM.REFERENCIA_AMX
                GROUP BY CB.Num_Pago,CB.Num_Establecimiento,Fecha_Transaccion,BVM.NUMERO_DOCUMENTO,Monto_Pago,Fecha_Pago,Monto_Pago_Neto)
                SELECT 
				Num_Pago,Num_Establecimiento,
				Monto_Pago,
				Monto_Pago_Neto,
                Monto_Pago-SUM(Monto_Documento) AS DIFERENCIA,
                SUM(Monto_Documento)-(Monto_Pago-Monto_Pago_Neto) AS IMPORTE_TMS,
				--BT.TOLERANCIA,
               Fecha_Pago,
               -- LISTAGG(BT.Fecha_Transaccion, ',') WITHIN  GROUP (ORDER BY BT.Fecha_Transaccion) AS Fechas_Transacciones,
                LISTAGG(BT.NUMERO_DOCUMENTO||'_'||BT.Monto_Documento, ',') WITHIN  GROUP (ORDER BY BT.NUMERO_DOCUMENTO) AS NUMEROS_DOCUMENTOS
                --,LISTAGG(h.tabla_puente_id, ',') WITHIN  GROUP (ORDER BY h.tabla_puente_id) AS TABLA_PUENTE_IDs
                ,LISTAGG(BT.Referencias_Facturas, ',') WITHIN  GROUP (ORDER BY BT.Referencias_Facturas) AS Referencias_Facturas
                FROM BT --INNER JOIN xxer_tbl_puente_header h
                      --ON BT.NUMERO_DOCUMENTO=H.NUMERO_DOCUMENTO
                GROUP BY BT.Monto_Pago,BT.Monto_Pago_Neto,BT.Fecha_Pago,BT.Num_Establecimiento,BT.Num_Pago
				ORDER BY DIFERENCIA ASC