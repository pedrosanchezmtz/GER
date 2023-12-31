WITH
SCH AS (SELECT H.BANK_ACCOUNT_ID ,H.BALANCE_CHECK ,L.VALUE_DATE ,L.AMOUNT ,L.CUSTOMER_REFERENCE ,L.TRX_CODE_ID
		FROM CE_STATEMENT_HEADERS H , CE_STATEMENT_LINES L WHERE H.STATEMENT_HEADER_ID = L.STATEMENT_HEADER_ID
		and L.FLOW_INDICATOR='CRDT')
SELECT 
	SCH.VALUE_DATE AS FECHA,
	cba.BANK_ACCOUNT_NUM AS CUENTA,
	cba.BANK_ACCOUNT_NAME AS METODO_RECIBO,
	ctc.DESCRIPTION AS DESCRIPCION,
	CASE WHEN sch.BALANCE_CHECK < 0 THEN '-' ELSE '+' END AS CARGO_ABONO,
	--SUM(SCH.AMOUNT) AS IMPORTE,
	SCH.AMOUNT AS IMPORTE,
	:p_concepto as PAYMENT_REFERENCE,
	(CASE WHEN SUBSTR(TRIM(SCH.CUSTOMER_REFERENCE),1,4) = 'AFIL' THEN TRIM(SCH.CUSTOMER_REFERENCE)||TO_CHAR(SCH.VALUE_DATE,'-DDMMYYYY')
	      WHEN SUBSTR(TRIM(SCH.CUSTOMER_REFERENCE),1,9) = 'AMEXCO SE' THEN TRIM(SCH.CUSTOMER_REFERENCE)||TO_CHAR(SCH.VALUE_DATE,'-DDMMYYYY')
		ELSE TRIM(SCH.CUSTOMER_REFERENCE) END) AS CONCEPTO
		
FROM CE_BANK_ACCOUNTS cba 
	LEFT JOIN SCH on cba.BANK_ACCOUNT_ID = SCH.BANK_ACCOUNT_ID
	LEFT JOIN CE_TRANSACTION_CODES ctc on SCH.TRX_CODE_ID = ctc.TRANSACTION_CODE_ID
	LEFT JOIN CE_BANK_ACCT_USES_ALL cbau ON cba.BANK_ACCOUNT_ID = cbau.BANK_ACCOUNT_ID
	--LEFT JOIN AR_CASH_RECEIPTS_ALL acr ON cbau.BANK_ACCT_USE_ID = acr.REMIT_BANK_ACCT_USE_ID
	WHERE 1=1
	--and acr.ORG_ID = 300000002753747
	and ((CASE 
	WHEN SUBSTR(TRIM(SCH.CUSTOMER_REFERENCE),1,4) = 'AFIL' THEN TRIM(SCH.CUSTOMER_REFERENCE)||TO_CHAR(SCH.VALUE_DATE,'-DDMMYYYY')
	WHEN SUBSTR(TRIM(SCH.CUSTOMER_REFERENCE),1,9) = 'AMEXCO SE' THEN TRIM(SCH.CUSTOMER_REFERENCE)||TO_CHAR(SCH.VALUE_DATE,'-DDMMYYYY')
		ELSE TRIM(SCH.CUSTOMER_REFERENCE) END) like concat (:p_concepto,'%') or :p_concepto is null)
	and cba.BANK_ACCOUNT_NAME =NVL(:p_metodo_recibo ,cba.BANK_ACCOUNT_NAME)
	--GROUP BY SCH.VALUE_DATE,CTC.DESCRIPTION,cba.BANK_ACCOUNT_NUM,SCH.CUSTOMER_REFERENCE,SCH.BALANCE_CHECK,cba.BANK_ACCOUNT_NAME
	ORDER BY SCH.VALUE_DATE DESC