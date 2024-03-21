--------------------------------------------------------
-- Archivo creado  - martes-marzo-19-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body XXER_CONCILIATION_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PXERINTUSER"."XXER_CONCILIATION_PKG" AS
	 
	 /**
	 *  * Procedimiento usado para obtener los pagos a conciliar y generar los totales de cada pago en tabla puente
	 */
	 PROCEDURE get_conciliation_cash(  
	  p_businessUnit   IN VARCHAR2,
	 p_fromDate  IN VARCHAR2,
	 p_paymentReference   IN VARCHAR2,
	 p_metodo_recibo   IN VARCHAR2,
			p_cash_conciliation     OUT XXER_AR_GET_CASH_CONC_TTYPE,
			p_error        OUT NUMBER,
			p_error_desc   OUT VARCHAR2
		) AS

--cursor que trae Referencias de los pagos
	CURSOR XXER_AR_INVOICES_CONCILIACION_V_CR  IS
		 SELECT
			  inv.REFERENCE_PAYMENT,
			  inv.METODO_RECIBO,
              inv.FECHA_PAGO
		 FROM XXER_AR_INVOICES_CONCILIACION_V inv
		 where 1=1
		 and TRUNC(inv.FECHA_MOVIMIENTO)>= NVL(TRUNC(TO_DATE(p_fromDate,'DD/MM/YYYY')),TRUNC(ADD_MONTHS(SYSDATE,-1)))
		 and inv.unidad_negocio_origen=NVL(p_businessUnit,inv.unidad_negocio_origen)
		 and inv.reference_payment=NVL(p_paymentReference,inv.reference_payment)
		 and inv.METODO_RECIBO=NVL(p_metodo_recibo,inv.METODO_RECIBO)
		 and SUBSTR(inv.reference_payment,1,4) NOT IN ( 'AFIL')
		 and SUBSTR(inv.reference_payment,1,9) NOT IN ( 'AMEXCO SE')
		 group by 
			  inv.METODO_RECIBO,inv.REFERENCE_PAYMENT,inv.FECHA_PAGO;

	--cursor que trae Referencias de los pagos AFIL SE LIMITA 
	CURSOR XXER_AR_INVOICES_CONCILIACION_AFIL_CR  IS
	 WITH
	VC AS (SELECT inv.REFERENCE_PAYMENT,inv.METODO_RECIBO,TO_DATE(SUBSTR(inv.REFERENCE_PAYMENT, -8,8),'DDMMYYYY') AS FECHA,TO_NUMBER(SUBSTR(inv.REFERENCE_PAYMENT, -18,9)) AS AFIL
		 FROM XXER_AR_INVOICES_CONCILIACION_V inv
		 where 1=1 AND TRUNC(inv.FECHA_MOVIMIENTO)>= NVL(TRUNC(TO_DATE(p_fromDate,'DD/MM/YYYY')),TRUNC(ADD_MONTHS(SYSDATE,-1)))
		 AND NVL(inv.unidad_negocio_origen,1)=NVL(p_businessUnit,inv.unidad_negocio_origen)
		 and inv.reference_payment=NVL(p_paymentReference,inv.reference_payment)
		 AND inv.METODO_RECIBO=NVL(p_metodo_recibo,inv.METODO_RECIBO)
		 AND SUBSTR(inv.reference_payment,1,4) IN ( 'AFIL')
		 group by inv.METODO_RECIBO,inv.REFERENCE_PAYMENT)
		 SELECT VC.REFERENCE_PAYMENT,VC.METODO_RECIBO,AFILIACION,SUM(IMPORTE) AS IMPORTE,TRUNC(FECHA_DEPOSITO) as FECHA_DEPOSITO
					FROM VC INNER JOIN TMS_COCILIACION_BANCOS_TBL ON TRUNC(FECHA_DEPOSITO) = TRUNC(VC.FECHA) AND AFILIACION = VC.AFIL AND USUARIO NOT IN('0670GGZM0')
					GROUP BY  VC.REFERENCE_PAYMENT,VC.METODO_RECIBO,AFILIACION,FECHA_DEPOSITO;
						--cursor que trae Referencias de los pagos AMEXCO SE SE LIMITA 
	CURSOR XXER_AR_INVOICES_CONCILIACION_AMEX_CR  IS
	 WITH
 VC AS (SELECT inv.REFERENCE_PAYMENT,inv.METODO_RECIBO,TO_DATE(SUBSTR(inv.REFERENCE_PAYMENT, -8,8),'DDMMYYYY') AS FECHA,TO_NUMBER(SUBSTR(inv.REFERENCE_PAYMENT, -19,10)) AS AMEX
     FROM XXER_AR_INVOICES_CONCILIACION_V inv
     where 1=1 AND TRUNC(inv.FECHA_MOVIMIENTO)>= NVL(TRUNC(TO_DATE(p_fromDate,'DD/MM/YYYY')),TRUNC(ADD_MONTHS(SYSDATE,-1)))
		 AND NVL(inv.unidad_negocio_origen,1)=NVL(p_businessUnit,inv.unidad_negocio_origen)
		 and inv.reference_payment=NVL(p_paymentReference,inv.reference_payment)
		 AND inv.METODO_RECIBO=NVL(p_metodo_recibo,inv.METODO_RECIBO)
		 AND SUBSTR(inv.reference_payment,1,9) IN ( 'AMEXCO SE')
     group by inv.METODO_RECIBO,inv.REFERENCE_PAYMENT)
select VC.REFERENCE_PAYMENT,VC.METODO_RECIBO,VC.FECHA FECHA_DEPOSITO,TO_NUMBER(sm.monto_bruto_pago)/100 as Monto_Pago,TO_NUMBER(sm.monto_neto_pago)/100 as Monto_Pago_Neto
FROM  xxer_bancos_amex_summary_tbl sm 
INNER JOIN VC ON sm.identificacion_establecimiento=VC.AMEX AND TO_DATE(SM.FECHA_PAGO,'YYYYMMDD')=TRUNC(VC.FECHA);


			v_error_msg        VARCHAR2(300) := NULL;
			v_error_location   VARCHAR2(255);
			v_ReferencePayment VARCHAR2(50) := NULL;
			v_MetodoRecibo     VARCHAR2(50) := NULL;
            v_FechaPago        VARCHAR2(50) := NULL;
			v_cash_conciliation  XXER_AR_GET_CASH_CONC_TTYPE:=XXER_AR_GET_CASH_CONC_TTYPE();                      

	BEGIN
			--Recorremos las refenrecias de pagos a conciliar
			FOR v_payments IN XXER_AR_INVOICES_CONCILIACION_V_CR LOOP

					v_ReferencePayment:=v_payments.REFERENCE_PAYMENT;
					v_MetodoRecibo:=v_payments.METODO_RECIBO;                  
                    v_FechaPago:=v_payments.FECHA_PAGO;
   				    DBMS_OUTPUT.PUT_LINE('v_ReferencePayment: '||v_payments.REFERENCE_PAYMENT||'  v_Metodo_Recibo: '||v_payments.METODO_RECIBO||' v_fecha: '||v_payments.FECHA_PAGO);          

				 v_cash_conciliation.extend;     
				  v_cash_conciliation(v_cash_conciliation.count):=
				  XXER_AR_GET_CASH_CONC_TYPE(v_ReferencePayment,v_MetodoRecibo,''||v_FechaPago);
				  --DBMS_OUTPUT.PUT_LINE('v_ReferencePayment: '||v_ReferencePayment); 
			END LOOP;
			--Recorremos las refenrecias de pagos a conciliar AFIL
			FOR v_payments IN XXER_AR_INVOICES_CONCILIACION_AFIL_CR LOOP

					v_ReferencePayment:=v_payments.REFERENCE_PAYMENT;
					v_MetodoRecibo:=v_payments.METODO_RECIBO;
                     v_FechaPago:=TO_CHAR(v_payments.FECHA_DEPOSITO,'DD/MM/YYYY');
				    DBMS_OUTPUT.PUT_LINE('v_ReferencePayment: '||v_ReferencePayment||'  v_Metodo_Recibo: '||v_MetodoRecibo||' v_fecha: '||v_FechaPago);          

				  v_cash_conciliation.extend;     
				  v_cash_conciliation(v_cash_conciliation.count):=
				  XXER_AR_GET_CASH_CONC_TYPE(v_ReferencePayment,v_MetodoRecibo,''||v_FechaPago);
				  --DBMS_OUTPUT.PUT_LINE('v_ReferencePayment: '||v_FechaPago); 
			END LOOP;
			--Recorremos las refenrecias de pagos a conciliar AMEXCO SE
			FOR v_payments IN XXER_AR_INVOICES_CONCILIACION_AMEX_CR LOOP

					v_ReferencePayment:=v_payments.REFERENCE_PAYMENT;
					v_MetodoRecibo:=v_payments.METODO_RECIBO;
                    v_FechaPago:=TO_CHAR(v_payments.FECHA_DEPOSITO,'DD/MM/YYYY');
				    DBMS_OUTPUT.PUT_LINE('v_ReferencePayment: '||v_ReferencePayment||'  v_Metodo_Recibo: '||v_MetodoRecibo||' v_fecha: '||v_FechaPago);          
				  v_cash_conciliation.extend;     
				  v_cash_conciliation(v_cash_conciliation.count):=
				  XXER_AR_GET_CASH_CONC_TYPE(v_ReferencePayment,v_MetodoRecibo,''||v_FechaPago);
				  --DBMS_OUTPUT.PUT_LINE('v_ReferencePayment: '||v_ReferencePayment); 
			END LOOP;
			p_cash_conciliation:=v_cash_conciliation;


v_error_location:=' merge ';
	--Creamos y ponemos en estatus process
	MERGE INTO XXER_AR_CONCILIACION_TBL c USING ( SELECT
			  inv.REFERENCE_PAYMENT,
			  inv.METODO_RECIBO,
			  max(inv.TOLERANCIA)as TOLERANCIA,
			  sum(inv.TOTAL)as TOTAL,
              inv.FECHA_PAGO,
			  LISTAGG(inv.NUMERO_DOCUMENTO||'_'||inv.TOTAL, ',') WITHIN  GROUP (ORDER BY inv.NUMERO_DOCUMENTO) as NUMEROS_DOCUMENTOS,
			  LISTAGG(inv.TABLA_PUENTE_ID, ',') WITHIN  GROUP (ORDER BY inv.TABLA_PUENTE_ID)as TABLA_PUENTE_IDs
		 FROM XXER_AR_INVOICES_CONCILIACION_V inv
		 where 1=1
		 and TRUNC(inv.FECHA_MOVIMIENTO)>= NVL(TRUNC(TO_DATE(p_fromDate,'DD/MM/YYYY')),TRUNC(ADD_MONTHS(SYSDATE,-1)))
		 and inv.unidad_negocio_origen=NVL(p_businessUnit,inv.unidad_negocio_origen)
		 and inv.reference_payment=NVL(p_paymentReference,inv.reference_payment)
		 and inv.METODO_RECIBO=NVL(p_metodo_recibo,inv.METODO_RECIBO)
		 and SUBSTR(inv.reference_payment,1,4) NOT IN ( 'AFIL')
         and SUBSTR(inv.reference_payment,1,9) NOT IN ( 'AMEXCO SE')
		 group by (
			  inv.REFERENCE_PAYMENT,
			  inv.METODO_RECIBO
              ,inv.FECHA_PAGO
              )) vc
	ON (c.REFERENCE_PAYMENT = vc.REFERENCE_PAYMENT and c.METODO_RECIBO=vc.METODO_RECIBO)
	WHEN MATCHED THEN
	UPDATE SET 
	c.AMOUNT_TRANSACTIONS=vc.TOTAL,
	c.AMOUNT_PAYMENT=null,
	c.STATUS='P',
	c.MSJ_VALIDATION=null,
	c.REFERENCE_TRANSACTIONS_ID=vc.TABLA_PUENTE_IDs,
	c.REFERENCE_TRANSACTIONS=vc.NUMEROS_DOCUMENTOS,
	c.FECHA_CONCILIACION=sysdate
    ,c.FECHA_PAGO=TO_DATE(vc.FECHA_PAGO,'DD/MM/YYYY')
	WHEN NOT MATCHED THEN
	INSERT (REFERENCE_PAYMENT, AMOUNT_TRANSACTIONS, AMOUNT_PAYMENT,TOLERANCE, STATUS, MSJ_VALIDATION, REFERENCE_TRANSACTIONS_ID, REFERENCE_TRANSACTIONS, FECHA_CONCILIACION, METODO_RECIBO
    ,FECHA_PAGO
    )
	VALUES (vc.REFERENCE_PAYMENT,vc.TOTAL,null, vc.TOLERANCIA,'P',null,vc.TABLA_PUENTE_IDs,vc.NUMEROS_DOCUMENTOS,sysdate, vc.METODO_RECIBO
    ,TO_DATE(vc.FECHA_PAGO,'DD/MM/YYYY')
    );

	commit;


	  EXCEPTION
			WHEN OTHERS THEN
				v_error_msg := substr(sqlerrm,1,250);
				p_error := 1;
				p_error_desc := substr('ERROR EN XXER_CONCILIATION_PKG.get_conciliation_cash-'
										 || v_error_location
										 || ' ** '
										 || v_error_msg,1,400);
	END get_conciliation_cash;
		 /**
	 *  * PROCESO QUE OBTIENE LAS CONCILIACIONES DE TMS
	 */
	 PROCEDURE get_conciliation_tms( 
	 p_businessUnit   IN VARCHAR2,
	 p_fromDate  IN VARCHAR2,
	 p_paymentReference   IN VARCHAR2,
	 p_metodo_recibo   IN VARCHAR2,
			p_error        OUT NUMBER,
			p_error_desc   OUT VARCHAR2
		) AS

			v_error_msg        VARCHAR2(300) := NULL;
			v_error_location   VARCHAR2(255);
			v_ReferencePayment VARCHAR2(50) := NULL;
			v_MetodoRecibo     VARCHAR2(50) := NULL;
            v_FechaInicio   VARCHAR2(50) := NULL;
            v_FechaFin     VARCHAR2(50) := NULL;

	BEGIN
---------------------------------------------AFIL-----------------------------------------------------------
WITH
    VC AS (SELECT inv.REFERENCE_PAYMENT,inv.METODO_RECIBO,max(inv.TOLERANCIA)as TOLERANCIA,TO_DATE(SUBSTR(inv.REFERENCE_PAYMENT, -8,8),'DDMMYYYY') AS FECHA,TO_NUMBER(SUBSTR(inv.REFERENCE_PAYMENT, -18,9)) AS AFIL
         FROM XXER_AR_INVOICES_CONCILIACION_V inv
         where 1=1 
		 and TRUNC(inv.FECHA_MOVIMIENTO)>= NVL(TRUNC(TO_DATE(p_fromDate,'DD/MM/YYYY')),TRUNC(ADD_MONTHS(SYSDATE,-1)))
		 and inv.unidad_negocio_origen=NVL(p_businessUnit,inv.unidad_negocio_origen)
		 and inv.reference_payment =NVL(p_paymentReference,inv.reference_payment)
		 and inv.METODO_RECIBO=NVL(p_metodo_recibo,inv.METODO_RECIBO)
		 AND SUBSTR(inv.reference_payment,1,4) IN ( 'AFIL')
         group by inv.METODO_RECIBO,inv.REFERENCE_PAYMENT),
            CB as (SELECT VC.REFERENCE_PAYMENT,VC.METODO_RECIBO,VC.TOLERANCIA,AFILIACION,IMPORTE,TRUNC(FECHA_DEPOSITO) as FECHA_DEPOSITO,REFERENCIA,NO_OPERACION
                    FROM  VC INNER JOIN TMS_COCILIACION_BANCOS_TBL ON TRUNC(FECHA_DEPOSITO) = TRUNC(VC.FECHA) AND AFILIACION = VC.AFIL AND USUARIO NOT IN('0670GGZM0'))
                    SELECT MAX(CB.FECHA_DEPOSITO)+1,ADD_MONTHS(MIN(CB.FECHA_DEPOSITO),-1)
                    INTO v_FechaFin,v_FechaInicio
                    FROM CB;
                    DBMS_OUTPUT.PUT_LINE('FECHA PARA AFILES'); 
                    DBMS_OUTPUT.PUT_LINE('v_FechaInicio: '||v_FechaInicio); 
                    DBMS_OUTPUT.PUT_LINE('v_FechaFin: '||v_FechaFin); 

	--Creamos y ponemos en estatus process AFIL
	MERGE INTO XXER_AR_CONCILIACION_TBL c USING (WITH vc AS (
    SELECT
        inv.reference_payment,
        inv.metodo_recibo,
        MAX(inv.tolerancia)                                                    AS tolerancia,
        to_date(substr(inv.reference_payment, - 8, 8), 'DDMMYYYY')                AS fecha,
        to_number(substr(inv.reference_payment, - 18, 9))                        AS afil
    FROM
        xxer_ar_invoices_conciliacion_v inv
    WHERE
            1 = 1
        AND trunc(inv.fecha_movimiento) >= nvl(TRUNC(TO_DATE(p_fromDate,'DD/MM/YYYY')), trunc(add_months(sysdate, - 1)))
        AND inv.unidad_negocio_origen = nvl(p_businessUnit, inv.unidad_negocio_origen)
        AND inv.reference_payment = nvl(p_paymentReference, inv.reference_payment)
        AND inv.metodo_recibo = nvl(p_metodo_recibo, inv.metodo_recibo)
        AND substr(inv.reference_payment, 1, 4) IN ( 'AFIL' )
    GROUP BY
        inv.metodo_recibo,
        inv.reference_payment
), cb AS (
    SELECT
        vc.reference_payment,
        vc.metodo_recibo,
        vc.tolerancia,
        afiliacion,
        importe,
        trunc(fecha_deposito) AS fecha_deposito,
        referencia,
        no_operacion
    FROM
             vc
        INNER JOIN tms_cociliacion_bancos_tbl ON trunc(fecha_deposito) = trunc(vc.fecha)
                                                 AND afiliacion = vc.afil
                                                 AND usuario NOT IN ( '0670GGZM0' )
), bv AS (
    SELECT
        ve.numero_documento,
        ve.referencia,
        SUM(ve.importe_boleto)       importe_tms,
        LISTAGG(ve.folio_preimpreso||'_'||ve.importe_boleto, ',') WITHIN GROUP(
            ORDER BY
                ve.folio_preimpreso
        ) AS folio_preimpresos
    FROM
        pcentral.extraccion_venta_tp_view@pcentral_link.estrellaroja.com.mx ve
    WHERE
        ve.corte_fecha_creacion BETWEEN TO_DATE(v_FechaInicio||' 00:00:00','DD/MM/YY HH24:mi:ss')   AND  TO_DATE(v_FechaFin||' 23:59:59', 'DD/MM/YY HH24:mi:ss') 
        AND ve.tipo_pago NOT IN ( 'EFE', 'AMX','BRF' )
        AND tipo_operacion NOT IN ( 'HO', 'FO' )
    GROUP BY
        ve.numero_documento,
        ve.referencia
), bvm AS (
    SELECT
        vm.numero_documento,
        substr(substr(br.referencia_pago, instr(br.referencia_pago, ';') + 1, length(br.referencia_pago)), 1, instr(substr(br.referencia_pago,
        instr(br.referencia_pago, ';') + 1, length(br.referencia_pago)), ';', - 2) - 1)                                                               referencia_pago,
		SUM(vm.total) importe_tms,
        LISTAGG(br.folio_preimpreso||'_'||vm.total, ',') WITHIN GROUP(
            ORDER BY
                br.folio_preimpreso
        )                                                                                                                                                                                                                                                                     AS folio_preimpresos
    FROM
             extraccion_miscelanea_tp_view@pcentral_link.estrellaroja.com.mx vm
        INNER JOIN tms_cortes_tbl@pcentral_link.estrellaroja.com.mx                 cr ON ( cr.corte_id = vm.corte_id )
        INNER JOIN tms_boletos_venta_tbl@pcentral_link.estrellaroja.com.mx          vt ON ( vt.folio_preimpreso = vm.no_folio
                                                                                   AND vt.fecha_creacion BETWEEN TO_DATE(v_FechaInicio||' 00:00:00','DD/MM/YY HH24:mi:ss')   AND  TO_DATE(v_FechaFin||' 23:59:59', 'DD/MM/YY HH24:mi:ss')  )
        INNER JOIN tms_boletos_venta_tbl@pcentral_link.estrellaroja.com.mx          br ON br.boleto_relacionado_id = vt.boleto_id
                                                                                 AND br.tipo_pago NOT IN ( 'EFE' )
    WHERE
            1 = 1 --AND SUBSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO)),1,INSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO)),';',-2)-1)='356087540'
        AND vm.corte_fecha_creacion BETWEEN TO_DATE(v_FechaInicio||' 00:00:00','DD/MM/YY HH24:mi:ss')   AND  TO_DATE(v_FechaFin||' 23:59:59', 'DD/MM/YY HH24:mi:ss') 
    GROUP BY
        vm.numero_documento,
        substr(substr(br.referencia_pago, instr(br.referencia_pago, ';') + 1, length(br.referencia_pago)), 1, instr(substr(br.referencia_pago,
        instr(br.referencia_pago, ';') + 1, length(br.referencia_pago)), ';', - 2) - 1)
		UNION ALL
-- se agrega onion para transacciones de prepago		
		SELECT VM.NUMERO_DOCUMENTO,
       PTXMS.NUM_OPERACION    referencia_pago,
       SUM(vm.total) importe_tms,
       LISTAGG(VM.NO_FOLIO||'_'||vm.total, ',') WITHIN GROUP(
            ORDER BY
                VM.NO_FOLIO
        )                  FOLIO_PREIMPRESOS 
  FROM EXTRACCION_MISCELANEA_TP_VIEW@PCENTRAL_LINK.ESTRELLAROJA.COM.MX  VM
       INNER JOIN TMS_CORTES_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX CR ON CR.CORTE_ID = VM.CORTE_ID
       LEFT JOIN XER_TRANSACCION_MISCELANEA_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX TXMS
          ON TXMS.VENTA_MISCELANEA_ID = VM.VM_ID
       LEFT JOIN XER_PAGOS_TRANSACCION_MISC_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX PTXMS
          ON PTXMS.NUMERO_TRANSACCION = TXMS.NUMERO_TRANSACCION
WHERE  1=1    
      AND CORTE_FECHA_CREACION BETWEEN TO_DATE(v_FechaInicio||' 00:00:00','DD/MM/YY HH24:mi:ss')   AND  TO_DATE(v_FechaFin||' 23:59:59', 'DD/MM/YY HH24:mi:ss') 
      AND PTXMS.NUM_OPERACION IS NOT NULL
      --AND VM.PRODUCTO NOT IN ('BONIFICACION')
      AND VM.PRODUCTO  IN ('TPRRECARGA','JUCONI')
      GROUP BY
        vm.numero_documento,PTXMS.NUM_OPERACION		
), tb AS (
    SELECT
        cb.afiliacion,
        cb.fecha_deposito,
        SUM(cb.importe) AS importe,
		SUM(bv.importe_tms) importe_tms,
        bv.numero_documento,
        hd.tabla_puente_id
    FROM
             cb
        INNER JOIN bv ON cb.referencia = bv.referencia
        LEFT JOIN xxer_tbl_puente_header hd ON bv.numero_documento = hd.numero_documento
    GROUP BY
        cb.afiliacion,
        bv.numero_documento,
        cb.fecha_deposito,
        hd.tabla_puente_id
    UNION ALL
    SELECT
        cb.afiliacion,
        cb.fecha_deposito,
        SUM(cb.importe) AS importe,
		SUM(bvm.importe_tms) importe_tms,
        bvm.numero_documento,
        hd.tabla_puente_id
    FROM
             cb
        INNER JOIN bvm ON cb.no_operacion = bvm.referencia_pago
        LEFT JOIN xxer_tbl_puente_header hd ON bvm.numero_documento = hd.numero_documento
    GROUP BY
        cb.afiliacion,
        bvm.numero_documento,
        cb.fecha_deposito,
        hd.tabla_puente_id
), bct AS (
    SELECT
        cb.reference_payment,
        cb.metodo_recibo,
        cb.tolerancia,
        afiliacion,
        SUM(importe)              AS importe,
        trunc(fecha_deposito)     AS fecha_deposito
    FROM
        cb
    GROUP BY
        cb.reference_payment,
        cb.metodo_recibo,
        cb.tolerancia,
        afiliacion,
        fecha_deposito
)
SELECT
    bct.reference_payment,
    bct.metodo_recibo,
    bct.afiliacion,
    bct.fecha_deposito,
    SUM(tb.importe)                           AS importe,
    SUM(tb.importe_tms)                           AS importe_tms,
    bct.importe                               AS importe_banco,
    ( SUM(tb.importe) - bct.importe )             AS diferencia,
    bct.tolerancia,
    LISTAGG(tb.numero_documento
            || '_'
            || tb.importe_tms, ',') WITHIN GROUP(
        ORDER BY
            tb.numero_documento
    )                                         AS numeros_documentos,
    LISTAGG(nvl(tb.tabla_puente_id, 0), ',') WITHIN GROUP(
        ORDER BY
            tb.tabla_puente_id
    )                                         AS tabla_puente_ids
FROM
         tb
    INNER JOIN bct ON trunc(tb.fecha_deposito) = trunc(bct.fecha_deposito)
                      AND tb.afiliacion = bct.afiliacion
GROUP BY
    bct.fecha_deposito,
    bct.afiliacion,
    bct.importe,
    bct.reference_payment,
    bct.metodo_recibo,
    bct.tolerancia	) vc
	ON (c.REFERENCE_PAYMENT = vc.REFERENCE_PAYMENT and c.METODO_RECIBO=vc.METODO_RECIBO)
	WHEN MATCHED THEN
	UPDATE SET 
	c.AMOUNT_TRANSACTIONS=vc.IMPORTE,
	c.AMOUNT_PAYMENT=null,
	c.STATUS='P',
	c.MSJ_VALIDATION=null,
	c.REFERENCE_TRANSACTIONS_ID=vc.TABLA_PUENTE_IDs,
	c.REFERENCE_TRANSACTIONS=vc.NUMEROS_DOCUMENTOS,
	c.FECHA_CONCILIACION=sysdate,
    c.FECHA_PAGO=vc.FECHA_DEPOSITO,
    c.AMOUNT_TRANSACTIONS_TMS=vc.IMPORTE_TMS
	WHEN NOT MATCHED THEN
	INSERT (REFERENCE_PAYMENT, AMOUNT_TRANSACTIONS, AMOUNT_PAYMENT,TOLERANCE, STATUS, MSJ_VALIDATION, REFERENCE_TRANSACTIONS_ID, REFERENCE_TRANSACTIONS, FECHA_CONCILIACION, METODO_RECIBO,FECHA_PAGO,AMOUNT_TRANSACTIONS_TMS)
	VALUES (vc.REFERENCE_PAYMENT,vc.IMPORTE,null, vc.TOLERANCIA,'P',null,vc.TABLA_PUENTE_IDs,vc.NUMEROS_DOCUMENTOS,sysdate, vc.METODO_RECIBO,VC.FECHA_DEPOSITO,vc.IMPORTE_TMS);
    
   commit;
    DBMS_OUTPUT.PUT_LINE('Merge AFILES Ejecutado'); 
 
---------------------------------------------AMEXCO-----------------------------------------------------------
     WITH
 VC AS (SELECT inv.REFERENCE_PAYMENT,inv.METODO_RECIBO,max(inv.TOLERANCIA)as TOLERANCIA,TO_DATE(SUBSTR(inv.REFERENCE_PAYMENT, -8,8),'DDMMYYYY') AS FECHA,TO_NUMBER(SUBSTR(inv.REFERENCE_PAYMENT, -19,10)) AS AMEX
     FROM XXER_AR_INVOICES_CONCILIACION_V inv
     where 1=1 
     AND  TRUNC(inv.FECHA_MOVIMIENTO)>= NVL(TRUNC(TO_DATE(p_fromDate,'DD/MM/YYYY')),TRUNC(ADD_MONTHS(SYSDATE,-1)))
		 and inv.unidad_negocio_origen=NVL(p_businessUnit,inv.unidad_negocio_origen)
		 and inv.reference_payment =NVL(p_paymentReference,inv.reference_payment)
		 and inv.METODO_RECIBO=NVL(p_metodo_recibo,inv.METODO_RECIBO)
     AND SUBSTR(inv.reference_payment,1,9) IN ( 'AMEXCO SE')
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
)SELECT MAX(CB.Fecha_Pago)+1,ADD_MONTHS(MIN(CB.Fecha_Pago),-1)
                    INTO v_FechaFin,v_FechaInicio
                    FROM CB;

                    DBMS_OUTPUT.PUT_LINE('FECHA PARA AMEX'); 
                    DBMS_OUTPUT.PUT_LINE('v_FechaInicio: '||v_FechaInicio); 
                    DBMS_OUTPUT.PUT_LINE('v_FechaFin: '||v_FechaFin); 
	--Creamos y ponemos en estatus process AMEXCO
	MERGE INTO XXER_AR_CONCILIACION_TBL c USING (
	 WITH
	 VC AS (SELECT inv.REFERENCE_PAYMENT,inv.METODO_RECIBO,max(inv.TOLERANCIA)as TOLERANCIA,TO_DATE(SUBSTR(inv.REFERENCE_PAYMENT, -8,8),'DDMMYYYY') AS FECHA,TO_NUMBER(SUBSTR(inv.REFERENCE_PAYMENT, -19,10)) AS AMEX
		 FROM XXER_AR_INVOICES_CONCILIACION_V inv
		 where 1=1 
          AND  TRUNC(inv.FECHA_MOVIMIENTO)>= NVL(TRUNC(TO_DATE(p_fromDate,'DD/MM/YYYY')),TRUNC(ADD_MONTHS(SYSDATE,-1)))
		 and inv.unidad_negocio_origen=NVL(p_businessUnit,inv.unidad_negocio_origen)
		 and inv.reference_payment =NVL(p_paymentReference,inv.reference_payment)
		 and inv.METODO_RECIBO=NVL(p_metodo_recibo,inv.METODO_RECIBO)
         AND SUBSTR(inv.reference_payment,1,9) IN ( 'AMEXCO SE')
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
	BV AS (SELECT REFERENCIA_AMX,NUMERO_DOCUMENTO
    ,SUM(importe_boleto)       importe_tms
	 ,LISTAGG(FOLIO_PREIMPRESO_SOLO, ',') WITHIN  GROUP (ORDER BY FOLIO_PREIMPRESO_SOLO) AS FOLIO_PREIMPRESOS
					FROM PCENTRAL.EXTRACCION_VENTA_TP_VIEW@PCENTRAL_LINK.ESTRELLAROJA.COM.MX
					WHERE CORTE_FECHA_CREACION BETWEEN TO_DATE(v_FechaInicio||' 00:00:00','DD/MM/YY HH24:mi:ss')   AND  TO_DATE(v_FechaFin||' 23:59:59', 'DD/MM/YY HH24:mi:ss')  
					AND TIPO_PAGO NOT IN ( 'EFE','BRF' )
					AND TIPO_OPERACION NOT IN ('HO','FO') --AND NVL (TO_NUMBER(ADICIONAL17),0) = 0 
					GROUP BY REFERENCIA_AMX,NUMERO_DOCUMENTO
					),
	BVM AS(
     SELECT
		VM.NUMERO_DOCUMENTO,
        SUM(vm.total) importe_tms,
		SUBSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO))
	,1,INSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO)),';',-2)-1) REFERENCIA_AMX
		,LISTAGG(BR.FOLIO_PREIMPRESO, ',') WITHIN  GROUP (ORDER BY BR.FOLIO_PREIMPRESO) AS FOLIO_PREIMPRESOS
		FROM EXTRACCION_MISCELANEA_TP_VIEW@PCENTRAL_LINK.ESTRELLAROJA.COM.MX VM
		INNER JOIN TMS_CORTES_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX CR
		ON (CR.CORTE_ID = VM.CORTE_ID)
		INNER JOIN TMS_BOLETOS_VENTA_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX VT
		ON (VT.FOLIO_PREIMPRESO = VM.NO_FOLIO
		AND VT.FECHA_CREACION BETWEEN TO_DATE(v_FechaInicio||' 00:00:00','DD/MM/YY HH24:mi:ss')   AND  TO_DATE(v_FechaFin||' 23:59:59', 'DD/MM/YY HH24:mi:ss')  
		--AND VT.TIPO_TRANSACCION = 'L'
		--AND VT.TIPO_PAGO IN ('BBV','BAB')
		)
		INNER JOIN TMS_BOLETOS_VENTA_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX BR
		ON BR.BOLETO_RELACIONADO_ID = VT.BOLETO_ID AND BR.TIPO_PAGO NOT IN ('EFE')
		where 1=1
		--AND SUBSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO)),1,INSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO)),';',-2)-1)='356087540'
		and  VM.CORTE_FECHA_CREACION BETWEEN TO_DATE(v_FechaInicio||' 00:00:00','DD/MM/YY HH24:mi:ss')   AND  TO_DATE(v_FechaFin||' 23:59:59', 'DD/MM/YY HH24:mi:ss')  
		GROUP BY VM.NUMERO_DOCUMENTO,SUBSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO))
	,1,INSTR(SUBSTR(BR.REFERENCIA_PAGO,INSTR(BR.REFERENCIA_PAGO,';')+1 ,LENGTH(BR.REFERENCIA_PAGO)),';',-2)-1)
	UNION ALL
	-- se agrega onion para transacciones de prepago		
SELECT VM.NUMERO_DOCUMENTO,
       SUM(vm.total) importe_tms,
       PTXMS.NUM_OPERACION    REFERENCIA_AMX,
       LISTAGG(VM.NO_FOLIO, ',') WITHIN  GROUP (ORDER BY VM.NO_FOLIO) AS FOLIO_PREIMPRESOS
  FROM EXTRACCION_MISCELANEA_TP_VIEW@PCENTRAL_LINK.ESTRELLAROJA.COM.MX  VM
       INNER JOIN TMS_CORTES_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX CR ON CR.CORTE_ID = VM.CORTE_ID
       LEFT JOIN XER_TRANSACCION_MISCELANEA_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX TXMS
          ON TXMS.VENTA_MISCELANEA_ID = VM.VM_ID
       LEFT JOIN XER_PAGOS_TRANSACCION_MISC_TBL@PCENTRAL_LINK.ESTRELLAROJA.COM.MX PTXMS
          ON PTXMS.NUMERO_TRANSACCION = TXMS.NUMERO_TRANSACCION
WHERE  1=1    
      AND PTXMS.NUM_OPERACION IS NOT NULL
      --AND VM.PRODUCTO NOT IN ('BONIFICACION')
      AND VM.PRODUCTO  IN ('TPRRECARGA','JUCONI')
      AND VM.CORTE_FECHA_CREACION BETWEEN TO_DATE(v_FechaInicio||' 00:00:00','DD/MM/YY HH24:mi:ss')   AND  TO_DATE(v_FechaFin||' 23:59:59', 'DD/MM/YY HH24:mi:ss') 
      GROUP BY VM.NUMERO_DOCUMENTO,PTXMS.NUM_OPERACION
						),
					BT AS (SELECT CB.REFERENCE_PAYMENT,CB.METODO_RECIBO,CB.TOLERANCIA,CB.Num_Pago,CB.Num_Establecimiento,
					CB.Monto_Pago,CB.Monto_Pago_Neto,
                    SUM(BV.importe_tms) importe_tms,
					SUM(CB.Monto_Trasaccion) AS Monto_Documento,Fecha_Pago,Fecha_Transaccion,BV.NUMERO_DOCUMENTO,
					LISTAGG(CB.Referencia_Factura, ',') WITHIN  GROUP (ORDER BY CB.Referencia_Factura) AS Referencias_Facturas
					FROM CB INNER JOIN BV ON CB.Referencia_Factura = BV.REFERENCIA_AMX                
					GROUP BY CB.REFERENCE_PAYMENT,CB.METODO_RECIBO,CB.TOLERANCIA,CB.Num_Pago,CB.Num_Establecimiento,Fecha_Transaccion,BV.NUMERO_DOCUMENTO,Monto_Pago,Fecha_Pago,Monto_Pago_Neto
					UNION ALL 
					SELECT CB.REFERENCE_PAYMENT,CB.METODO_RECIBO,CB.TOLERANCIA,CB.Num_Pago,CB.Num_Establecimiento,
					CB.Monto_Pago,CB.Monto_Pago_Neto,
                    SUM(BVM.importe_tms) importe_tms,
					SUM(CB.Monto_Trasaccion) AS Monto_Documento,Fecha_Pago,Fecha_Transaccion,BVM.NUMERO_DOCUMENTO,
					LISTAGG(CB.Referencia_Factura, ',') WITHIN  GROUP (ORDER BY CB.Referencia_Factura) AS Referencias_Facturas
					FROM CB INNER JOIN BVM ON CB.Referencia_Factura = BVM.REFERENCIA_AMX
					GROUP BY CB.REFERENCE_PAYMENT,CB.METODO_RECIBO,CB.TOLERANCIA,CB.Num_Pago,CB.Num_Establecimiento,Fecha_Transaccion,BVM.NUMERO_DOCUMENTO,Monto_Pago,Fecha_Pago,Monto_Pago_Neto)
					SELECT BT.REFERENCE_PAYMENT,BT.METODO_RECIBO,
					Num_Pago,Num_Establecimiento,
					Monto_Pago,
					Monto_Pago_Neto,
					Monto_Pago-SUM(Monto_Documento) AS DIFERENCIA,
					SUM(Monto_Documento)-(Monto_Pago-Monto_Pago_Neto) AS IMPORTE_BC,
                    SUM(BT.importe_tms) importe_tms,
					BT.TOLERANCIA,
					Fecha_Pago,
				   --LISTAGG(BT.Fecha_Transaccion, ',') WITHIN  GROUP (ORDER BY BT.Fecha_Transaccion) AS Fechas_Transacciones,
					LISTAGG(BT.NUMERO_DOCUMENTO||'_'||BT.Monto_Documento, ',') WITHIN  GROUP (ORDER BY BT.NUMERO_DOCUMENTO) AS NUMEROS_DOCUMENTOS,
					LISTAGG(NVL(h.tabla_puente_id,0), ',') WITHIN  GROUP (ORDER BY h.tabla_puente_id) AS TABLA_PUENTE_IDs
					--,LISTAGG(BT.Referencias_Facturas, ',') WITHIN  GROUP (ORDER BY BT.Referencias_Facturas) AS Referencias_Facturas
					FROM BT LEFT JOIN xxer_tbl_puente_header h
						  ON BT.NUMERO_DOCUMENTO=H.NUMERO_DOCUMENTO
					GROUP BY BT.REFERENCE_PAYMENT,BT.METODO_RECIBO,BT.TOLERANCIA,BT.Monto_Pago,BT.Monto_Pago_Neto,BT.Fecha_Pago,BT.Num_Establecimiento,BT.Num_Pago
				--ORDER BY DIFERENCIA ASC
	) vc
	ON (c.REFERENCE_PAYMENT = vc.REFERENCE_PAYMENT and c.METODO_RECIBO=vc.METODO_RECIBO)
	WHEN MATCHED THEN
	UPDATE SET 
	c.AMOUNT_TRANSACTIONS=vc.IMPORTE_BC,
	c.AMOUNT_PAYMENT=null,
	c.STATUS='P',
	c.MSJ_VALIDATION=null,
	c.REFERENCE_TRANSACTIONS_ID=vc.TABLA_PUENTE_IDs,
	c.REFERENCE_TRANSACTIONS=vc.NUMEROS_DOCUMENTOS,
	c.FECHA_CONCILIACION=sysdate,
    c.FECHA_PAGO=TO_DATE(vc.Fecha_Pago,'DD/MM/YYYY'),
    c.AMOUNT_TRANSACTIONS_TMS=vc.IMPORTE_TMS
	WHEN NOT MATCHED THEN
	INSERT (REFERENCE_PAYMENT, AMOUNT_TRANSACTIONS, AMOUNT_PAYMENT,TOLERANCE, STATUS, MSJ_VALIDATION, REFERENCE_TRANSACTIONS_ID, REFERENCE_TRANSACTIONS, FECHA_CONCILIACION, METODO_RECIBO,FECHA_PAGO,AMOUNT_TRANSACTIONS_TMS)
	VALUES (vc.REFERENCE_PAYMENT,vc.IMPORTE_BC,null, vc.TOLERANCIA,'P',null,vc.TABLA_PUENTE_IDs,vc.NUMEROS_DOCUMENTOS,sysdate, vc.METODO_RECIBO,TO_DATE(vc.Fecha_Pago,'DD/MM/YYYY'),vc.IMPORTE_TMS);
 commit;
 DBMS_OUTPUT.PUT_LINE('Merge AMEXCO Ejecutado'); 


	  EXCEPTION
			WHEN OTHERS THEN
				v_error_msg := substr(sqlerrm,1,250);
				p_error := 1;
				p_error_desc := substr('ERROR EN XXER_CONCILIATION_PKG.get_conciliation_tms-'
										 || v_error_location
										 || ' ** '
										 || v_error_msg,1,400);
	END get_conciliation_tms;
	  /**
	 * Procedimiento usado para conciliar los CASH con TRANSACIONES TP
	 */
	 PROCEDURE conciliation_cash( 
			p_cash     IN XXER_AR_CASH_TTYPE,
			p_conciliation_result  OUT XXER_AR_CONCILIACION_RESULT_TTYPE,
			p_error        OUT NUMBER,
			p_error_desc   OUT VARCHAR2
		) AS



			v_error_msg        VARCHAR2(300) := NULL;
			v_error_location   VARCHAR2(255);
			v_ReferencePayment VARCHAR2(50) := NULL;
			v_MetodoRecibo     VARCHAR2(50) := NULL;
			v_statusCode    VARCHAR2(3) := NULL;
			 v_status      VARCHAR2(255) := NULL;
		   -- p_cash  XXER_AR_CASH_TTYPE:=XXER_AR_CASH_TTYPE();
			v_conciliation_result XXER_AR_CONCILIACION_RESULT_TTYPE:=XXER_AR_CONCILIACION_RESULT_TTYPE();

			 --cursor que trae Referencias de los pagos
	CURSOR XXER_AR_TRANSACTIONS_CR IS   
	select c.amount_transactions,
			  c.tolerance
			  from XXER_AR_CONCILIACION_TBL c
			  where 1=1
			  and c.REFERENCE_PAYMENT =v_ReferencePayment
			  and c.METODO_RECIBO =v_MetodoRecibo;



	BEGIN
	/*prueba
	p_cash.extend;   
	p_cash(p_cash.count):=XXER_AR_CASH_TYPE('08052021CAPUT','08052021CAPUT9','SANTANDER_3550',368919);
	 p_cash.extend; 
	p_cash(p_cash.count):=XXER_AR_CASH_TYPE('11052021CAPUT','11052021CAPUT4','SANTANDER_3550',339495);
		p_cash.extend; 
	p_cash(p_cash.count):=XXER_AR_CASH_TYPE('26052021CAPSETEXT','26052021CAPSETEXT','SANTANDER_8285',8498);
	*/

	 --Recorremos los pagos en 
			FOR i in p_cash.FIRST..p_cash.LAST LOOP

			  DBMS_OUTPUT.PUT_LINE(p_cash(i).REFERENCE_PAYMENT); 
			  v_ReferencePayment:=p_cash(i).REFERENCE_PAYMENT;
			 v_MetodoRecibo:=p_cash(i).RECEIPT_METHOD;
			  --recorremos el cursor    
			  FOR TRANSACTIONS IN XXER_AR_TRANSACTIONS_CR
		   LOOP
		   --conciliamos
			   if p_cash(i).TOTAL=0
				   then v_statusCode:='NC';
				   v_status:='El Pago No se encuentra en APOLO Cash';
			   ELSIF ABS(TRANSACTIONS.amount_transactions - p_cash(i).TOTAL) > TRANSACTIONS.tolerance
					and (TRANSACTIONS.amount_transactions - p_cash(i).TOTAL) > 0
				   then v_statusCode:='NCL';
				   v_status:='EL Pago en Cash es Menor a la sumatoria de las Transaciones en TP';
			   ELSIF ABS(TRANSACTIONS.amount_transactions - p_cash(i).TOTAL) > TRANSACTIONS.tolerance
					and (p_cash(i).TOTAL - TRANSACTIONS.amount_transactions) > 0
				then v_statusCode:='NCM';
				   v_status:='EL Pago en Cash es Mayor a la sumatoria de las Transaciones en TP';
			  else v_statusCode:='C';
				   v_status:='Pago Conciliado Correctamente'; 
				end if;

			 DBMS_OUTPUT.PUT_LINE('Total Transactions: '||TRANSACTIONS.amount_transactions);
			 DBMS_OUTPUT.PUT_LINE('Total CASH: '||p_cash(i).TOTAL);
			 DBMS_OUTPUT.PUT_LINE('Tolerancia: '||TRANSACTIONS.tolerance);
			 DBMS_OUTPUT.PUT_LINE('Diferencia: '||(TRANSACTIONS.amount_transactions - p_cash(i).TOTAL));
			 DBMS_OUTPUT.PUT_LINE('status: '|| v_statusCode);
			 v_conciliation_result.extend;
			 v_conciliation_result(v_conciliation_result.count):=
			 XXER_AR_CONCILIACION_RESULT_TYPE(v_ReferencePayment,v_MetodoRecibo,v_statusCode);

	UPDATE  XXER_AR_CONCILIACION_TBL  SET 
	PAYMENT_NUMBER=p_cash(i).PAYMENT_NUMBER,
	AMOUNT_PAYMENT=p_cash(i).TOTAL,
	TOLERANCE = TRANSACTIONS.tolerance,
	STATUS=v_statusCode,
	MSJ_VALIDATION=v_status,
    FECHA_PAGO=TO_DATE(p_cash(i).PAYMENT_DATE,'RRRR-MM-DD')
	 where 1=1
	 and REFERENCE_PAYMENT =v_ReferencePayment
	 and METODO_RECIBO=v_MetodoRecibo;
		   commit;         
		   END LOOP;
			END LOOP;

		  p_conciliation_result:=v_conciliation_result;
	  EXCEPTION
			WHEN OTHERS THEN
				v_error_msg := substr(sqlerrm,1,250);
				p_error := 1;
				p_error_desc := substr('ERROR EN XXER_CONCILIATION_PKG.conciliation_cash-'
										 || v_error_location
										 || ' ** '
										 || v_error_msg,1,400);	
	END conciliation_cash;
	  /**
	 * Procedimiento usado para conciliar los transacciones APOLO con TRANSACIONES TP y CASH
	 */
	 PROCEDURE conciliation_transactions( 
			 p_transactions     IN XXER_AR_CONC_TRANSACTION_TTYPE,
			p_conciliation_result  OUT XXER_AR_CONCILIACION_RESULT_TTYPE,
			p_error        OUT NUMBER,
			p_error_desc   OUT VARCHAR2
		) AS



			v_error_msg        VARCHAR2(300) := NULL;
			v_error_location   VARCHAR2(255);
			v_ReferencePayment VARCHAR2(50) := NULL;
			v_MetodoRecibo     VARCHAR2(50) := NULL;
			v_statusCode    VARCHAR2(3) := NULL;
			 v_status      VARCHAR2(255) := NULL;
			 v_referenceTransactions        VARCHAR2(300) := NULL;
			 v_referenceTransactionsId       VARCHAR2(300) := NULL;
			 v_montoTransactions number;
			--p_transactions  XXER_AR_CONC_TRANSACTION_TTYPE:=XXER_AR_CONC_TRANSACTION_TTYPE();
			v_conciliation_result XXER_AR_CONCILIACION_RESULT_TTYPE:=XXER_AR_CONCILIACION_RESULT_TTYPE();

			 --cursor que trae Referencias de los pagos
	CURSOR XXER_AR_TRANSACTIONS_CR IS   
	select c.amount_transactions,
			  c.tolerance,
			  c.reference_transactions_id,
			  c.reference_transactions,
			  c.amount_payment
			  from XXER_AR_CONCILIACION_TBL c
			  where 1=1
			  and c.REFERENCE_PAYMENT =v_ReferencePayment
			  and c.METODO_RECIBO =v_MetodoRecibo;



	BEGIN
	/*prueba  
	p_transactions.extend;   
	p_transactions(p_transactions.count):=XXER_AR_CONC_TRANSACTION_TYPE('09052021CAPUT','SANTANDER_8285','300000034987280','4604022',-26);
	 p_transactions.extend; 
	p_transactions(p_transactions.count):=XXER_AR_CONC_TRANSACTION_TYPE('11052021CAPUT','SANTANDER_3550','300000034987243','4605018',-418.01);
	   */


	 --Recorremos los pagos en 
			FOR i in p_transactions.FIRST..p_transactions.LAST LOOP

			  DBMS_OUTPUT.PUT_LINE(p_transactions(i).REFERENCE_PAYMENT); 
			  v_ReferencePayment:=p_transactions(i).REFERENCE_PAYMENT;
			 v_MetodoRecibo:=p_transactions(i).RECEIPT_METHOD;

			  --recorremos el cursor
			  FOR TRANSACTIONS IN XXER_AR_TRANSACTIONS_CR
		   LOOP

			 v_referenceTransactionsId:=p_transactions(i).REFERENCE_TRANSACTIONS_ID||','||TRANSACTIONS.reference_transactions_id;
			 v_referenceTransactions:=p_transactions(i).REFERENCE_TRANSACTIONS||'_'||p_transactions(i).TOTAL||','||TRANSACTIONS.reference_transactions;
			 v_montoTransactions:=(TRANSACTIONS.amount_transactions + p_transactions(i).TOTAL);
		   --conciliamos
			   if TRANSACTIONS.amount_payment=0
				   then v_statusCode:='NC';
				   v_status:='El Pago No se encuentra en APOLO Cash';
			   ELSIF ABS(v_montoTransactions - TRANSACTIONS.amount_payment) > TRANSACTIONS.tolerance
					and (v_montoTransactions - TRANSACTIONS.amount_payment) > 0
				   then v_statusCode:='NCL';
				   v_status:='EL Pago en Cash es Menor a la sumatoria de las Transaciones en TP';
			   ELSIF ABS(v_montoTransactions - TRANSACTIONS.amount_payment) > TRANSACTIONS.tolerance
					and (TRANSACTIONS.amount_payment - v_montoTransactions) > 0
				then v_statusCode:='NCM';
				   v_status:='EL Pago en Cash es Mayor a la sumatoria de las Transaciones en TP';
			  else v_statusCode:='C';
				   v_status:='Pago Conciliado Correctamente'; 
				end if;

			 DBMS_OUTPUT.PUT_LINE('Total Transactions: '||TRANSACTIONS.amount_transactions);
			 DBMS_OUTPUT.PUT_LINE('Total agregar: '||p_transactions(i).TOTAL);
			 DBMS_OUTPUT.PUT_LINE('Tolerancia: '||TRANSACTIONS.tolerance);
			 DBMS_OUTPUT.PUT_LINE('Total en CASH: '||TRANSACTIONS.amount_payment);
			 DBMS_OUTPUT.PUT_LINE('Diferencia: '||(v_montoTransactions-TRANSACTIONS.amount_payment));
			 DBMS_OUTPUT.PUT_LINE('status: '|| v_statusCode);

			 v_conciliation_result.extend;
			 v_conciliation_result(v_conciliation_result.count):=
			 XXER_AR_CONCILIACION_RESULT_TYPE(v_ReferencePayment,v_MetodoRecibo,v_statusCode);

	UPDATE  XXER_AR_CONCILIACION_TBL  SET 
	amount_transactions=v_montoTransactions,
	reference_transactions_id=v_referenceTransactionsId,
	reference_transactions=v_referenceTransactions,
	STATUS=v_statusCode,
	MSJ_VALIDATION=v_status
	 where 1=1
	 and REFERENCE_PAYMENT =v_ReferencePayment
	 and METODO_RECIBO=v_MetodoRecibo;
		   commit;       

		   END LOOP;
			END LOOP;

		  p_conciliation_result:=v_conciliation_result;
	  EXCEPTION
			WHEN OTHERS THEN
				v_error_msg := substr(sqlerrm,1,250);
				p_error := 1;
				p_error_desc := substr('ERROR EN XXER_CONCILIATION_PKG.conciliation_transactions-'
										 || v_error_location
										 || ' ** '
										 || v_error_msg,1,400);	
	END conciliation_transactions;

PROCEDURE XXER_AR_CARGA_PAGOS_PRC(ERRBUF OUT VARCHAR2, RETCODE OUT NUMBER) IS

  strRefAplicacion varchar2(200):='0';
  strTotal number:=0;


  CURSOR c_header IS     

 WITH
CNC AS (SELECT  PAYMENT_NUMBER, AMOUNT_PAYMENT ,TO_CHAR(REFERENCE_TRANSACTIONS_ID) REFERENCE_TRANSACTIONS_ID,CONCILIACION_ID ,FECHA_PAGO ,METODO_RECIBO 
FROM XXER_AR_CONCILIACION_TBL --WHERE 
            WHERE STATUS IN ('C') 
			--AND TO_DATE(fecha_pago) >= '01/01/2022' 
			and (
            (PAYMENT_NUMBER like 'AMEXCO%' 
            AND trunc( fecha_pago) >= to_date('22-06-23','DD-MM-RR')) 
            or 
            (PAYMENT_NUMBER like 'AFIL%' 
            AND trunc( fecha_pago) >= to_date('01-08-23','DD-MM-RR')) 
            AND MOD(TO_CHAR(fecha_pago,'J'),7) <> 0
            )
			 --and CONCILIACION_ID in (310224,310219,310223,5789,5788,5787) 
            )              
select  distinct
      hd.SISTEMA_ORIGEN UNIDAD_NEGOCIO        
      ,'RECIBO' TIPO_DOC
      ,hd.TIPO_MOVIMIENTO TIPO_MOVIMIENTO
      ,hd.RFC_ORIGEN RFC_DLIVER
      ,'PUBLICO EN GENERAL' NOMBRE
      ,hd.RFC_DESTINO RFC 
      ,'PUEBLA' desc_plaza
      ,case when CNC.PAYMENT_NUMBER like 'AMEXCO%'
      THEN  regexp_substr( CNC.PAYMENT_NUMBER, '[^-]+') 
      when CNC.PAYMENT_NUMBER like 'AFIL%'
      THEN  regexp_substr( CNC.PAYMENT_NUMBER, '[^-]+')||'-'||regexp_substr( CNC.PAYMENT_NUMBER, '[^-]+',1,2) 
      END NUMERO_DOCUMENTO
      ,CNC.FECHA_PAGO FECHA_INGRESO
      ,CNC.PAYMENT_NUMBER REF_APLICACION
      ,CNC.CONCILIACION_ID ID_MOVIMIENTO
      ,'' no_guia
      ,CNC.rowid
      ,'SIN ASIGNAR' destino_servicio
      ,'CRE' forma_pago
      ,'NUM DEPOSITO:'||CNC.CONCILIACION_ID LINEA_PAGO
      ,'N/A' UNIDAD_MEDIDA
      ,CNC.AMOUNT_PAYMENT SUBTOTAL
      ,'AR_IVA_EXENTO' AR_IVA_EXENTO
      ,CNC.AMOUNT_PAYMENT TOTAL
      ,CNC.FECHA_PAGO CREATION_DATE
      ,CNC.METODO_RECIBO DESCRIPCION_BANCO
  from CNC cnc,xxer_tbl_puente_header hd
  where   hd.tabla_puente_id =(select regexp_substr (  CNC.REFERENCE_TRANSACTIONS_ID, '[^,]+', 1, level ) value 
from   dual
  connect by level <= length ( CNC.REFERENCE_TRANSACTIONS_ID ) - length ( replace ( CNC.REFERENCE_TRANSACTIONS_ID, ',' ) ) + 1 and rownum=1
  )
       AND not exists (select 1 from iner_xxer_puente_header_tbl hdi where to_char(CNC.CONCILIACION_ID) = hdi.REFERENCIA_APLICACION
       and  (
       hdi.NUMERO_DOCUMENTO=regexp_substr( CNC.PAYMENT_NUMBER, '[^-]+')||'-'||regexp_substr( CNC.PAYMENT_NUMBER, '[^-]+',1,2) 
       OR
        hdi.NUMERO_DOCUMENTO=regexp_substr( CNC.PAYMENT_NUMBER, '[^-]+')
        )
       )
           -- and rownum=1
;  

    l_pk_h                NUMBER;
    l_pk_l                NUMBER;

BEGIN

    DBMS_OUTPUT.PUT_LINE('COMENZADO PAGOS ER');

    FOR h IN c_header LOOP

        BEGIN     

            --
            -- INSERCION DE CABECEROS
            --    
            strTotal:=h.TOTAL;
            DBMS_OUTPUT.PUT_LINE('Referencia generada: '||strTotal);
            --strRefAplicacion:=H.REF_APLICACION||'_'||strTotal;
            strRefAplicacion:=h.ID_MOVIMIENTO;
            --strRefAplicacion:='';

            select   INER_XXER_PUENTE_HEADER_SEQ.NEXTVAL
            into     l_pk_h
            from     dual;


            INSERT INTO INER_XXER_PUENTE_HEADER_TBL(
                                                    TABLA_PUENTE_ID,
                                                    SISTEMA_ORIGEN,
                                                    TIPO_DOCUMENTO,
                                                    TIPO_MOVIMIENTO,
                                                    RFC_ORIGEN,    
                                                    NOMBRE_FISCAL_DESTINO,    
                                                    RFC_DESTINO,
                                                    SUCURSAL_VENTA,
                                                    NUMERO_DOCUMENTO,
                                                    FECHA_MOVIMIENTO,
                                                    REFERENCIA_APLICACION,
                                                    CREATION_DATE,
                                                    LAST_UPDATE_DATE,
                                                    CREATED_BY,
                                                    LAST_UPDATED_BY,
                                                    ADICIONAL1
            )     VALUES (
                                                    l_pk_h,
                                                    h.UNIDAD_NEGOCIO,        
                                                    h.TIPO_DOC,
                                                    h.TIPO_MOVIMIENTO,
                                                    h.RFC_DLIVER,
                                                    h.NOMBRE,
                                                    h.RFC,        
                                                    h.DESC_PLAZA,
                                                    h.NUMERO_DOCUMENTO,
                                                    h.FECHA_INGRESO,
                                                    strRefAplicacion,
                                                    SYSDATE,
                                                    SYSDATE,
                                                    --nvl (apps.fnd_profile.value('USER_ID'),1),
                                                    --nvl (apps.fnd_profile.value('USER_ID'),1),
                                                    1,
                                                    2,
                                                    h.DESCRIPCION_BANCO
            );

            --
            -- INSERCION DE LINEAS
            --
            select    INER_XXER_PUENTE_LINES_SEQ.NEXTVAL
            into     l_pk_l
            from     dual;

            INSERT INTO INER_XXER_PUENTE_LINES_TBL(
                                                    TABLA_PUENTE_LINEA_ID,
                                                    TABLA_PUENTE_ID,
                                                    SERVICIO,
                                                    FORMA_PAGO,
                                                    LINEA_ARTICULO,
                                                    UNIDAD_MEDIDA,
                                                    REFERENCIA_APLICACION,
                                                    SUBTOTAL,
                                                    CODIGO_IVA,
                                                    TOTAL,
                                                    CREATION_DATE,
                                                    LAST_UPDATE_DATE,
                                                    CREATED_BY,
                                                    LAST_UPDATED_BY
            )
            VALUES (
                                                    l_pk_l,
                                                    l_pk_h,
                                                    h.DESTINO_SERVICIO,
                                                    h.FORMA_PAGO,
                                                    h.LINEA_PAGO,
                                                    h.UNIDAD_MEDIDA,
                                                    strRefAplicacion,
                                                    h.SUBTOTAL,
                                                    h.AR_IVA_EXENTO,
                                                    h.TOTAL,
                                                    SYSDATE,
                                                    SYSDATE,
                                                    --nvl (apps.fnd_profile.value('USER_ID'),1),
                                                    --nvl (apps.fnd_profile.value('USER_ID'),1)
                                                    1,
                                                    1
            ); 



            COMMIT;
            DBMS_OUTPUT.PUT_LINE('El registro con ROWID:'||h.ROWID||' ha sido copiado.');

            l_pk_h     := NULL;
            l_pk_l    := NULL;

        EXCEPTION WHEN OTHERS THEN     
            ROLLBACK;
        END;

    END LOOP;

    DBMS_OUTPUT.PUT_LINE('TERMINANDO PAGOS DE CONCILIACION');

    COMMIT;

EXCEPTION WHEN OTHERS THEN
    ROLLBACK;
END XXER_AR_CARGA_PAGOS_PRC;

	END XXER_CONCILIATION_PKG;

/
