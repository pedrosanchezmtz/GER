SELECT 
cra.CASH_RECEIPT_ID,
rct.TRX_NUMBER INVOICE_NUMBER,
rct.ATTRIBUTE3 DOCUMENT_ID,
--'PQ' SERIE, --DVM PQ
SUBSTR(ho.name,1,3) SERIE, -- Agrego IMM 051218
rct.ATTRIBUTE5 FOLIO,
--'306542' FOLIO,
rct.INVOICE_CURRENCY_CODE CURRENCY, 
0 CURRENCY_EXCHANGE,
rct.ATTRIBUTE12 PAYMENT_METHOD,
(SELECT TO_CHAR(COUNT(ara.APPLIED_CUSTOMER_TRX_ID))
          FROM AR_RECEIVABLE_APPLICATIONS_ALL arai
          WHERE 1 = 1
            AND arai.APPLIED_CUSTOMER_TRX_ID = rct.CUSTOMER_TRX_ID
            AND arai.RECEIVABLE_APPLICATION_ID <= ara.RECEIVABLE_APPLICATION_ID
        )AS PARTIALITY_NUMBER,
TO_CHAR( (SELECT SUM(rctl.EXTENDED_AMOUNT)
         FROM RA_CUSTOMER_TRX_LINES_ALL rctl
         WHERE 1 = 1
           AND rctl.CUSTOMER_TRX_ID = rct.CUSTOMER_TRX_ID) - (SELECT NVL(SUM(arai.AMOUNT_APPLIED),0)
                                                              FROM AR_RECEIVABLE_APPLICATIONS_ALL arai
                                                              WHERE 1 = 1
                                                                AND arai.APPLIED_CUSTOMER_TRX_ID = rct.CUSTOMER_TRX_ID
                                                                AND arai.RECEIVABLE_APPLICATION_ID < ara.RECEIVABLE_APPLICATION_ID
        ),'fm9999999990.00') AS PREVIOUS_BALANCE,
TO_CHAR(ara.AMOUNT_APPLIED,'fm9999999990.00') PAID_AMOUNT,
(SELECT SUM(rctl.EXTENDED_AMOUNT)
         FROM RA_CUSTOMER_TRX_LINES_ALL rctl
         WHERE 1 = 1
           AND rctl.CUSTOMER_TRX_ID = rct.CUSTOMER_TRX_ID) - (SELECT NVL(SUM(arai.AMOUNT_APPLIED),0)
                                                              FROM AR_RECEIVABLE_APPLICATIONS_ALL arai
                                                              WHERE 1 = 1
                                                                AND arai.APPLIED_CUSTOMER_TRX_ID = rct.CUSTOMER_TRX_ID
                                                                AND arai.RECEIVABLE_APPLICATION_ID <= ara.RECEIVABLE_APPLICATION_ID
        ) AS OUTSTANDING_BALANCE,
rct.CUSTOMER_TRX_ID CUSTOMER_TRX_LINE_ID,
cra.RECEIPT_NUMBER,
 (SELECT COUNT(ara.APPLIED_CUSTOMER_TRX_ID)
         FROM AR_RECEIVABLE_APPLICATIONS_ALL arai
         WHERE 1 = 1
           AND arai.APPLIED_CUSTOMER_TRX_ID = rct.CUSTOMER_TRX_ID
           AND arai.RECEIVABLE_APPLICATION_ID <= ara.RECEIVABLE_APPLICATION_ID
        ) AS INSTALLMENT_NUMBER,
        ara.RECEIVABLE_APPLICATION_ID AS RECEIVABLE_APPLICATION_ID,
        rct.TRX_NUMBER AS TRX_NUMBER
FROM AR_RECEIVABLE_APPLICATIONS_ALL ara,
       RA_CUSTOMER_TRX_ALL rct,
	    AR_CASH_RECEIPTS_ALL cra,
	   AR_RECEIPT_METHODS rm,
	   AR_RECEIPT_CLASSES rc
	   ,HR_OPERATING_UNITS ho
  WHERE 1 = 1
    AND ara.APPLIED_CUSTOMER_TRX_ID = rct.CUSTOMER_TRX_ID
	AND rm.RECEIPT_METHOD_ID =cra.RECEIPT_METHOD_ID
    AND rm.RECEIPT_CLASS_ID=rc.RECEIPT_CLASS_ID
	AND rct.ATTRIBUTE3 is not null --UUID no es nulo
	AND rct.ATTRIBUTE10 = '99'  --Tipo de pago
    AND rct.TRX_CLASS = 'INV'  --Solo facturas
	AND ara.DISPLAY IN ('Y') --Estatus que muestra las aplicaciones mostradas
	AND ara.CASH_RECEIPT_ID = cra.CASH_RECEIPT_ID
    AND ara.ORG_ID = cra.ORG_ID
	AND cra.ORG_ID = ho.ORGANIZATION_ID