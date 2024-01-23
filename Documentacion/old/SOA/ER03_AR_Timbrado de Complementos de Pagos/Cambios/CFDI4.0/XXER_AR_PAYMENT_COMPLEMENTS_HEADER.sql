SELECT
cra.CASH_RECEIPT_ID,
cra.RECEIPT_NUMBER,
xr.REGISTRATION_NUMBER issuer_rfc,
xr.REGISTERED_NAME issuer_name,
hl.POSTAL_CODE issuer_zip_code,
TO_CHAR(systimestamp AT TIME ZONE 'America/Mexico_City', 'yyyy-mm-dd"T"hh24:mi:ss') invoice_date, 
'P' document_type, -- DVM 'P'
'' additional_information,
'' total_words,
'Pago' description_itm,--DVM 'Pago'
'84111506' prod_serv_key_itm,--DVM 84111506
1  quantity_itm,
0  vat_percentage_itm,
'ACT' unit_key_itm, --DVM ACT
0  amount_itm,
0  subtotal_itm,
0  vat_itm	,
0  total_itm,
0  total_vat,
0  subtotal,
0  total,
              ( CASE WHEN xr.REGISTRATION_NUMBER = 'CIT071219IH4' THEN 'CTIT'
			         WHEN xr.REGISTRATION_NUMBER = 'ACP100428EXA' THEN 'ACP'
                     WHEN xr.REGISTRATION_NUMBER = 'TTP050504P51' THEN 'TTP'
					 WHEN xr.REGISTRATION_NUMBER = 'TTE020806LF4' THEN 'TTE'	
					 WHEN xr.REGISTRATION_NUMBER = 'ENE0410255W7' THEN 'ENE'	
					 WHEN xr.REGISTRATION_NUMBER = 'CTE060224DA3' THEN 'CTE'
					 WHEN xr.REGISTRATION_NUMBER = 'AMP521016875' THEN 'AMP'	
					 WHEN xr.REGISTRATION_NUMBER = 'IPB0912082X8' THEN 'IPBD'
					 WHEN xr.REGISTRATION_NUMBER = 'KMT020927F45' THEN 'KER'
                     WHEN xr.REGISTRATION_NUMBER = 'TER111123FI2' THEN 'TER'	
                     WHEN xr.REGISTRATION_NUMBER = 'VER870629GN3' THEN 'VER'
                     WHEN xr.REGISTRATION_NUMBER = 'TEC1004288S4' THEN 'TEC'
                ELSE NULL   
            END ) serie, -- DVM PQ
'MATRIZ' branch_name,   --modif JRM 110719  MATRIZ DVM
hl.POSTAL_CODE branch_zip_code, -- Mismo dato que issuer_zip_code
hp.POSTAL_CODE receiver_zip_code,
hp.PARTY_NAME receiver_name,
DECODE(hp.party_type,'ORGANIZATION', op.JGZZ_FISCAL_CODE, pp.JGZZ_FISCAL_CODE) receiver_rfc,
'' receiver_phone, --NI EX
hzl.ADDRESS1 receiver_address,
'' receiver_ext_number,
'' receiver_int_number,
hzl.ADDR_ELEMENT_ATTRIBUTE3||' '|| hzl.POSTAL_CODE receiver_colony, --modif JRM 031419
hzl.ADDR_ELEMENT_ATTRIBUTE2 receiver_county,
NVL(cra.ATTRIBUTE3,'CP01') receiver_cfdi_use, --DEBE SER 'P01', modif IM 301118
'XXX' currency, --DVM VALOR POR DEFECTO
	   (CASE 
		WHEN xr.REGISTRATION_NUMBER in ('AMP521016875','CTE060224DA3','TTE020806LF4','VER870629GN3','MLO120419J96','ATM000204JJ2','TTP050504P51','CIT071219IH4','IPB0912082X8') THEN '624'
		ELSE '601'
		END ) AS issuer_tax_regime, --'' issuer_tax_regime, --DVM 624 --modif JRM 012419 
'' payment_status,--No va
cra.COMMENTS comments,
         ( CASE WHEN xr.REGISTRATION_NUMBER = 'CIT071219IH4' THEN 'CTIT'
			         WHEN xr.REGISTRATION_NUMBER = 'ACP100428EXA' THEN 'PAQUER'
                     WHEN xr.REGISTRATION_NUMBER = 'TTP050504P51' THEN 'PORTAL*'
					 WHEN xr.REGISTRATION_NUMBER = 'TTE020806LF4' THEN 'TRATECSA'	
					 WHEN xr.REGISTRATION_NUMBER = 'ENE0410255W7' THEN 'PAQUER'	
					 WHEN xr.REGISTRATION_NUMBER = 'CTE060224DA3' THEN 'VENTOUR'
					 WHEN xr.REGISTRATION_NUMBER = 'AMP521016875' THEN 'PAQUER'	
					 WHEN xr.REGISTRATION_NUMBER = 'IPB0912082X8' THEN 'PAQUER'
					 WHEN xr.REGISTRATION_NUMBER = 'KMT020927F45' THEN 'PAQUER'
                     WHEN xr.REGISTRATION_NUMBER = 'TER111123FI2' THEN 'PAQUER'	
                     WHEN xr.REGISTRATION_NUMBER = 'VER870629GN3' THEN 'DLIVER'
                     WHEN xr.REGISTRATION_NUMBER = 'TEC1004288S4' THEN 'PAQUER'
                ELSE NULL   
            END ) service, --DVM PAQUER
TO_CHAR(cra.RECEIPT_DATE, 'yyyy-mm-dd"T"hh24:mi:ss') payment_date_pc, --pc (payment complements), modif IM 301118
NVL(cra.ATTRIBUTE4,'01') payment_way_pc, 
cra.CURRENCY_CODE currency_pc, 
0  currency_exchange_pc, 
 (SELECT SUM(ara.amount_applied)
     FROM ar_receivable_applications_all ara
     WHERE 1=1
	     AND ara.status = 'APP'
         AND ara.cash_receipt_id = cra.cash_receipt_id
     GROUP BY ara.status
 ) amount_pc,
1  operation_number_pc, 
'' bank_name_pc,
'' payer_account_pc,
'' ben_acc_issuer_rfc_pc,
'' beneficiary_account_pc,
'' payment_string_type_pc,
'' payment_cert_pc,
'' payment_string_pc,
'' payment_seal_pc,
1 version_pc,
hp.PARTY_NUMBER AS CUSTOMER_NUMBER,
hca.ACCOUNT_NUMBER,
csu.LOCATION AS SITE_NUMBER,
cra.LAST_UPDATE_DATE AS LAST_UPDATE_DATE,
cra.LAST_UPDATED_BY AS LAST_UPDATED_BY,
ho.name BUSINESS_UNIT,
rm.name RECEIPT_METHOD,
cra.RECON_FLAG,
NVL(NULL,'01') EXPORTACION,	
cra.ATTRIBUTE1 as ESTATUS_CFDI,
(SELECT 
(CASE WHEN HOP.party_id IS NOT NULL
THEN HOP.ATTRIBUTE1
ELSE HPP.ATTRIBUTE1 END
) receiver_tax_regime
FROM HZ_PARTIES HP
left join HZ_ORGANIZATION_PROFILES HOP ON HP.party_id=HOP.party_id
left join HZ_PERSON_PROFILES HPP ON HP.party_id=HPP.party_id
WHERE 1=1 --and PARTY_NAME='PRICE RES SAPI DE CV'
and HP.party_id = hca1.PARTY_ID) AS RECEIVER_TAX_REGIME,
NVL(NULL,'01') as TAX_OBJECT_ITM
FROM HR_OPERATING_UNITS ho,
     XLE_ENTITY_PROFILES xe,
     XLE_REGISTRATIONS xr,
	 HZ_LOCATIONS hl,
	 AR_CASH_RECEIPTS_ALL cra,
	 HZ_CUST_ACCOUNTS hca,
	 HZ_PARTIES hp,
	 HZ_organization_profiles op,
         HZ_person_profiles pp,
	 HZ_CUST_SITE_USES_ALL csu,
	 HZ_CUST_ACCT_SITES_ALL cas,
	 HZ_CUST_ACCOUNTS hca1,
	 HZ_PARTIES hp1,
	 HZ_PARTY_SITES ps,
	 HZ_LOCATIONS hzl,
	 AR_RECEIPT_METHODS rm,
 AR_RECEIPT_CLASSES rc
WHERE 1=1
AND cra.ORG_ID = ho.ORGANIZATION_ID
AND xe.LEGAL_ENTITY_ID           =  ho.DEFAULT_LEGAL_CONTEXT_ID
AND xe.LEGAL_ENTITY_ID           =  xr.SOURCE_ID
AND hl.LOCATION_ID = xr.LOCATION_ID
AND hp.party_id = hca.party_id
AND op.party_id(+)=hp.party_id
AND pp.party_id(+)=hp.party_id
AND cra.PAY_FROM_CUSTOMER = hca.CUST_ACCOUNT_ID
AND cra.ATTRIBUTE1 in ('01','03')    --Listo para timbrar
AND cra.GLOBAL_ATTRIBUTE1 is null   --No tenga un UUID
AND csu.SITE_USE_ID = cra.CUSTOMER_SITE_USE_ID
AND csu.CUST_ACCT_SITE_ID =cas.CUST_ACCT_SITE_ID
AND hca1.CUST_ACCOUNT_ID = cas.CUST_ACCOUNT_ID
AND hp1.party_id = hca1.party_id
AND cas.PARTY_SITE_ID= ps.PARTY_SITE_ID
AND ps.LOCATION_ID=hzl.LOCATION_ID
AND rm.RECEIPT_METHOD_ID =cra.RECEIPT_METHOD_ID
AND rm.RECEIPT_CLASS_ID=rc.RECEIPT_CLASS_ID
AND NVL(rc.ATTRIBUTE1,'N')<> 'Y' --Es anticipo
AND NVL(cra.ATTRIBUTE6,'X') <>'Y' -- Es recibo Manual, no proviene de la super interface
AND cra.RECEIPT_DATE > TO_TIMESTAMP('2021-02-01 20:21:09.000', 'yyyy-MM-dd hh24:mi:SS.FF9') --visualizamos a partir de tal fecha
--AND cra.RECEIPT_NUMBER = 'RENTA DE 2 UNIDADES A PARTIR O'
--AND cra.CASH_RECEIPT_ID = '300000045981569'