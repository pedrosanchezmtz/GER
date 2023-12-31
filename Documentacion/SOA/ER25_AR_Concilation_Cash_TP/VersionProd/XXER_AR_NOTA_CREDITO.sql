SELECT
	H.CUSTOMER_TRX_ID
	,H.ATTRIBUTE9 METODO_RECIBO
	,H.ATTRIBUTE11 REFERENCE_PAYMENT
	,H.TRX_NUMBER NUMERO_DOCUMENTO
	,H.TRX_DATE
	,SUM(L.EXTENDED_AMOUNT) TOTAL
FROM RA_CUSTOMER_TRX_ALL H , RA_CUSTOMER_TRX_LINES_ALL L
WHERE H.TRX_CLASS  != 'INV' AND H.CUSTOMER_TRX_ID = L.CUSTOMER_TRX_ID
AND H.ATTRIBUTE9 IS NOT NULL AND H.ATTRIBUTE11 IS NOT NULL
AND H.ATTRIBUTE9 = NVL(:P_MET_REC,H.ATTRIBUTE9) AND H.ATTRIBUTE11 = NVL(:P_REF_PAY,H.ATTRIBUTE11)
GROUP BY H.CUSTOMER_TRX_ID ,H.ATTRIBUTE9 ,H.ATTRIBUTE11 ,H.TRX_NUMBER ,H.TRX_DATE
ORDER BY H.CUSTOMER_TRX_ID DESC