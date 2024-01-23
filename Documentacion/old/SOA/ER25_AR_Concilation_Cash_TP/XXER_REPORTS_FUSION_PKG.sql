SET SERVEROUTPUT ON;
DECLARE

END;

-------------------------------------------------------------------------
create or replace TYPE XXER_AR_TRANSACTIONS_RECONCILE_TTYPE 
AS TABLE OF XXER_AR_TRANSACTIONS_RECONCILE_TYPE;

create or replace TYPE XXER_AR_TRANSACTIONS_RECONCILE_TYPE AS OBJECT
(
       REFERENCE_PAYMENT  VARCHAR2 (50 CHAR),
       RECEIPT_METHOD      VARCHAR2 (50 CHAR),
       RECEIPT_METHOD_ID      VARCHAR2 (50 CHAR),
       ORGANIZATION_ID      VARCHAR2 (50 CHAR),
	   TOLERANCE         VARCHAR2 (50 CHAR),
       FREQUENCY        VARCHAR2 (50 CHAR),
       RFC         VARCHAR2 (50 CHAR),
	   TRANSACTIONS     XXER_AR_TRANSACTION_RECONCILE_TTYPE
 );
 
 
 
 
 create or replace TYPE XXER_AR_CONCILIACION_TYYPE 
AS TABLE OF XXER_AR_CONCILIACION_TYPE;
 create or replace TYPE XXER_AR_CONCILIACION_TYPE AS OBJECT
(
       REFERENCE_PAYMENT  VARCHAR2 (50 CHAR),
	   PAYMENT_NUMBER  VARCHAR2 (50 CHAR),
       AMOUNT_TRANSACTIONS      NUMBER,
       AMOUNT_PAYMENT      NUMBER,
       TOLERANCE     NUMBER,
	   STATUS CHAR(3 BYTE), 
	   MSJ_VALIDATION         VARCHAR2 (500 CHAR),
	   REFERENCE_TRANSACTIONS_ID      VARCHAR2 (500 CHAR),
	   REFERENCE_TRANSACTIONS         VARCHAR2 (500 CHAR),
       FECHA_CONCILIACION        TIMESTAMP (6), 
       METODO_RECIBO         VARCHAR2 (50 CHAR)
 );
        
 
 create or replace TYPE XXER_AR_TRANSACTION_RECONCILE_TTYPE 
AS TABLE OF XXER_AR_TRANSACTION_RECONCILE_TYPE;

create or replace TYPE XXER_AR_TRANSACTION_RECONCILE_TYPE AS OBJECT
(
       INVOICE_NUMBER     VARCHAR2 (50 CHAR) ,
       INVOICE_ID              NUMBER   (18) ,
	   INVOICE_DATE     VARCHAR2 (50 CHAR) ,
       AMOUNT_LINE      VARCHAR2 (50 CHAR)	   
 );
---------------------------------------------------------------------------------------

 /**
 * Procedimiento usado para obtener los datos 
 necesarios para realizar la conciliacion en SOA
 */
 PROCEDURE get_transactions_reconcile( 
 p_businessUnit   IN VARCHAR2,
 p_fromDate  IN VARCHAR2,
 p_paymentReference   IN VARCHAR2,
        p_transactions_reconcile     OUT XXER_AR_TRANSACTIONS_RECONCILE_TTYPE,
        p_error        OUT NUMBER,
        p_error_desc   OUT VARCHAR2
    ) AS

--cursor que trae Referencias de los pagos
CURSOR XXER_AR_INVOICES_CONCILIACION_V_CR  IS
     SELECT DISTINCT 
          inv.REFERENCE_PAYMENT,
          inv.METODO_RECIBO,
          inv.TOLERANCIA,     
          inv.RECEIPT_METHOD_ID,
          inv.ORGANIZATION_ID,
          inv.FRECUENCIA,
          inv.RFC_ORIGEN
     FROM XXER_AR_INVOICES_CONCILIACION_V inv
     where 
     TRUNC(inv.FECHA_MOVIMIENTO)>= NVL(TRUNC(TO_DATE(p_fromDate,'DD/MM/YYYY')),TRUNC(inv.FECHA_MOVIMIENTO))
     and NVL(inv.unidad_negocio_origen,1)=NVL(p_businessUnit,inv.unidad_negocio_origen)
     and inv.reference_payment=NVL(p_paymentReference,inv.reference_payment);

        v_error_msg        VARCHAR2(300) := NULL;
        v_error_location   VARCHAR2(255);
		v_ReferencePayment VARCHAR2(50) := NULL;
		v_MetodoRecibo     VARCHAR2(50) := NULL;
        v_transactions_reconcile  XXER_AR_TRANSACTIONS_RECONCILE_TTYPE:=XXER_AR_TRANSACTIONS_RECONCILE_TTYPE();
        v_transaction_reconcile  XXER_AR_TRANSACTION_RECONCILE_TTYPE:=XXER_AR_TRANSACTION_RECONCILE_TTYPE();

--cursor que trae trasaciones por referecia de pago
CURSOR XXER_AR_INVOICES_CONCILIACION_V2_CR  IS
    SELECT inv.NUMERO_DOCUMENTO,
          inv.TABLA_PUENTE_ID,
          inv.FECHA_MOVIMIENTO,
          inv.TOTAL
    FROM XXER_AR_INVOICES_CONCILIACION_V inv
    where 1=1 
    and inv.REFERENCE_PAYMENT= v_ReferencePayment
	and NVL(inv.METODO_RECIBO,1)=NVL(v_MetodoRecibo,1);                           

BEGIN
        --Recorremos las refenrecias de pagos a conciliar
        FOR v_payments IN XXER_AR_INVOICES_CONCILIACION_V_CR LOOP
                
                v_ReferencePayment:=v_payments.REFERENCE_PAYMENT;
				v_MetodoRecibo:=v_payments.METODO_RECIBO    ;
                DBMS_OUTPUT.PUT_LINE('v_ReferencePayment: '||v_ReferencePayment||'  v_Metodo_Recibo: '||v_MetodoRecibo||
                'TOLERANCIA: '||v_payments.TOLERANCIA||'  RECEIPT_METHOD_ID: '||v_payments.RECEIPT_METHOD_ID||
                'ORGANIZATION_ID: '||v_payments.ORGANIZATION_ID||'  FRECUENCIA: '||v_payments.FRECUENCIA||
                '  RFC_ORIGEN: '||v_payments.RFC_ORIGEN
                );               
           v_transaction_reconcile:=XXER_AR_TRANSACTION_RECONCILE_TTYPE(); 
            --agrupamos las trasaciones por pago    
           FOR v_payment IN XXER_AR_INVOICES_CONCILIACION_V2_CR LOOP
           
DBMS_OUTPUT.PUT_LINE('          Transaciones dentro de : '
|| v_payment.NUMERO_DOCUMENTO||', trx id: '||v_payment.TABLA_PUENTE_ID||', monto: '||v_payment.TOTAL||'  FECHA_MOVIMIENTO: '||v_payment.FECHA_MOVIMIENTO);

              v_transaction_reconcile.extend;
              v_transaction_reconcile(v_transaction_reconcile.count):=
              XXER_AR_TRANSACTION_RECONCILE_TYPE(v_payment.NUMERO_DOCUMENTO,v_payment.TABLA_PUENTE_ID,''||v_payment.FECHA_MOVIMIENTO,''||v_payment.TOTAL);

            END LOOP;

              v_transactions_reconcile.extend;     
              v_transactions_reconcile(v_transactions_reconcile.count):=
XXER_AR_TRANSACTIONS_RECONCILE_TYPE(v_ReferencePayment,v_MetodoRecibo,
v_payments.RECEIPT_METHOD_ID,v_payments.ORGANIZATION_ID,v_payments.TOLERANCIA,
v_payments.FRECUENCIA,v_payments.RFC_ORIGEN,v_transaction_reconcile);
        END LOOP;
        p_transactions_reconcile:=v_transactions_reconcile;
        
        --Creamos y ponemos en estatus process
MERGE INTO XXER_AR_CONCILIACION_TBL c USING (SELECT DISTINCT 
          inv.REFERENCE_PAYMENT,
          inv.METODO_RECIBO,
          inv.TOLERANCIA
     FROM XXER_AR_INVOICES_CONCILIACION_V inv
     where 
     TRUNC(inv.FECHA_MOVIMIENTO)>= NVL(TRUNC(TO_DATE(p_fromDate,'DD/MM/YYYY')),TRUNC(inv.FECHA_MOVIMIENTO))
     and NVL(inv.unidad_negocio_origen,1)=NVL(p_businessUnit,inv.unidad_negocio_origen)
     and inv.reference_payment=NVL(p_paymentReference,inv.reference_payment)) vc
ON (c.REFERENCE_PAYMENT = vc.REFERENCE_PAYMENT)
WHEN MATCHED THEN
UPDATE SET 
c.AMOUNT_TRANSACTIONS=null,
c.AMOUNT_PAYMENT=null,
c.TOLERANCE = vc.TOLERANCIA,
c.STATUS='P',
c.MSJ_VALIDATION=null,
c.REFERENCE_TRANSACTIONS_ID=null,
c.REFERENCE_TRANSACTIONS=null,
c.FECHA_CONCILIACION=sysdate
WHEN NOT MATCHED THEN
INSERT (REFERENCE_PAYMENT, AMOUNT_TRANSACTIONS, AMOUNT_PAYMENT,TOLERANCE, STATUS, MSJ_VALIDATION, REFERENCE_TRANSACTIONS_ID, REFERENCE_TRANSACTIONS, FECHA_CONCILIACION, METODO_RECIBO)
VALUES (vc.REFERENCE_PAYMENT,null,null, vc.TOLERANCIA,'P',null,null,null,sysdate, vc.METODO_RECIBO);

commit;
        

  EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_AR_UTILITIES_PKG.get_transactions_reconcile-'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);	
END get_transactions_reconcile;

/*
 * Procedimiento usado para actualizar datos de las conciliciones
 */                                   
PROCEDURE update_conciliations(P_CONCILIATIONS IN XXER_AR_CONCILIACION_TYYPE,
                                 P_ERROR       OUT NUMBER,
                                 P_ERROR_DESC  OUT VARCHAR2)
        AS
    BEGIN
        v_error_location := 'Llama al PROCEDIMIENTO update_conciliations';

FOR i IN P_CONCILIATIONS.FIRST..P_CONCILIATIONS.LAST  LOOP

UPDATE  XXER_AR_CONCILIACION_TBL  SET 
PAYMENT_NUMBER=P_CONCILIATIONS(i).PAYMENT_NUMBER,
AMOUNT_TRANSACTIONS=P_CONCILIATIONS(i).AMOUNT_TRANSACTIONS,
AMOUNT_PAYMENT=P_CONCILIATIONS(i).AMOUNT_PAYMENT,
TOLERANCE = P_CONCILIATIONS(i).TOLERANCE,
STATUS=P_CONCILIATIONS(i).STATUS,
MSJ_VALIDATION=P_CONCILIATIONS(i).MSJ_VALIDATION,
REFERENCE_TRANSACTIONS_ID=P_CONCILIATIONS(i).REFERENCE_TRANSACTIONS_ID,
REFERENCE_TRANSACTIONS=P_CONCILIATIONS(i).REFERENCE_TRANSACTIONS,
FECHA_CONCILIACION=sysdate
 where 1=1
 and REFERENCE_PAYMENT =P_CONCILIATIONS(i).REFERENCE_PAYMENT
 and METODO_RECIBO=P_CONCILIATIONS(i).METODO_RECIBO;
 
 commit;

END LOOP;


    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_UTILITIES_PKG.update_conciliations'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);

    END update_conciliations;

-------------------------------------------------------------------------------------------	
/**
 * Procedimiento usado para obtener los datos 
 necesarios para realizar la conciliacion en SOA
 */
 PROCEDURE GET_TRANSACTIONS_RECONCILE(
  p_businessUnit   IN VARCHAR2,
 p_fromDate  IN VARCHAR2,
 p_paymentReference   IN VARCHAR2,
        p_transactions_reconcile     OUT XXER_AR_TRANSACTIONS_RECONCILE_TTYPE,
        p_error        OUT NUMBER,
        p_error_desc   OUT VARCHAR2
    );

	     /*
 * Procedimiento usado para actualizar datos de las conciliciones
 */                                       
PROCEDURE UPDATE_CONCILIATIONS(P_CONCILIATIONS IN XXER_AR_CONCILIACION_TYYPE,
                                 P_ERROR       OUT NUMBER,
                                 P_ERROR_DESC  OUT VARCHAR2); 