WITH HEADER AS (
SELECT DISTINCT  "RA_CUSTOMER_TRX_ALL"."CUSTOMER_TRX_ID" AS "CUSTOMER_TRX_ID",
       "RA_CUSTOMER_TRX_ALL"."TRX_NUMBER" AS "TRX_NUMBER",
       "RA_BATCH_SOURCES_ALL"."NAME" AS "TRANSACTION_SOURCE",
	   "HR_ALL_ORGANIZATION_UNITS"."NAME" AS "BUSINESS_UNIT",
       '' AS "id_rfc",
       '' AS "certificate_number",
       "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" AS "issuer_rfc",
       --"XLE_REGISTRATIONS"."REGISTERED_NAME" AS "issuer_name", 
	   "XLE_ENTITY_PROFILES"."ATTRIBUTE1" AS "issuer_name", 
       "HZ_LOCATIONS"."ADDRESS1" AS "issuer_street", 
       '' AS "issuer_ext_number",--"HZ_LOCATIONS"."ADDRESS2" AS "issuer_ext_number", 
       "HZ_LOCATIONS"."ADDRESS3" AS "issuer_int_number", 
       "HZ_LOCATIONS"."ADDR_ELEMENT_ATTRIBUTE3" AS "issuer_colony", 
       "HZ_LOCATIONS"."POSTAL_CODE" AS "issuer_zip_code", 
       "HZ_LOCATIONS"."ADDR_ELEMENT_ATTRIBUTE2" AS "issuer_municipality", 
       "HZ_LOCATIONS"."STATE" AS "issuer_state", 
       '' AS "issuer_phone", 
       (SELECT "FND_TERRITORIES_VL"."ISO_TERRITORY_CODE" 
          FROM "FUSION"."FND_TERRITORIES_VL" "FND_TERRITORIES_VL" 
         WHERE "FND_TERRITORIES_VL"."TERRITORY_CODE"="HZ_LOCATIONS"."COUNTRY"
           AND ROWNUM=1) AS "issuer_country", 
       TO_CHAR( FROM_TZ(CAST(SYSDATE AS TIMESTAMP), 'GMT') AT TIME ZONE (TZ_OFFSET('America/Mexico_City')), 'YYYY-MM-DD"T"HH24:MI:SS') as "invoice_date",
       --'I' AS "document_type", Modif 261118
	   --(CASE WHEN "RA_CUST_TRX_TYPES_ALL"."TYPE" = 'CM' THEN 'E' ELSE 'I' END) AS "document_type",
        (CASE WHEN SUBSTR("AR_PAYMENT_SCHEDULES_ALL"."AMOUNT_DUE_ORIGINAL",0,1) = '-' THEN 'E' ELSE 'I' END) AS "document_type",
	   '' AS "additional_information",
       '' AS "cancellation_date",
       '' as "total_words",
       (SELECT COUNT("LINES"."CUSTOMER_TRX_LINE_ID") 
          FROM "FUSION"."RA_CUSTOMER_TRX_LINES_ALL" "LINES",
               "FUSION"."AR_MEMO_LINES_ALL_B" "AR_MEMO_LINES_ALL_B"
         WHERE "RA_CUSTOMER_TRX_ALL"."CUSTOMER_TRX_ID"="LINES"."CUSTOMER_TRX_ID"
           AND "AR_MEMO_LINES_ALL_B"."MEMO_LINE_SEQ_ID"="LINES"."MEMO_LINE_SEQ_ID"
           AND "LINES"."LINE_TYPE"='LINE'
           AND "AR_MEMO_LINES_ALL_B"."ATTRIBUTE3" IS NULL 
		   AND (upper("LINES"."DESCRIPTION") NOT LIKE '%MILLAR%' AND upper("LINES"."DESCRIPTION") NOT LIKE '%FLETE%')  -- Modifico 231118
		   ) AS "total_items",
		   ''  AS "local_retention_name",
		   
		   NVL((SELECT ABS(SUM("LINES"."TAX_RATE")) 
          FROM "FUSION"."RA_CUSTOMER_TRX_LINES_ALL" "LINES"
         WHERE "LINES"."CUSTOMER_TRX_ID"="RA_CUSTOMER_TRX_ALL"."CUSTOMER_TRX_ID"
           --AND "LINES"."LINE_TYPE"='TAX' 
		   AND upper("LINES"."TAX_CLASSIFICATION_CODE") LIKE '%MILLAR%'
           AND "LINES"."TAX_RATE" < 0),0)  AS "local_retention_percentage",
		   
		   NVL((SELECT ABS(SUM("LINES"."EXTENDED_AMOUNT")) 
          FROM "FUSION"."RA_CUSTOMER_TRX_LINES_ALL" "LINES"
         WHERE "LINES"."CUSTOMER_TRX_ID"="RA_CUSTOMER_TRX_ALL"."CUSTOMER_TRX_ID"
           --AND "LINES"."LINE_TYPE"='TAX' 
		   AND upper("LINES"."TAX_CLASSIFICATION_CODE") LIKE '%MILLAR%'
           AND "LINES"."TAX_RATE" < 0),0) AS "local_retention_amount",
		   
       (SELECT ABS(SUM("LINES"."EXTENDED_AMOUNT")) 
          FROM "FUSION"."RA_CUSTOMER_TRX_LINES_ALL" "LINES"
         WHERE "LINES"."CUSTOMER_TRX_ID"="RA_CUSTOMER_TRX_ALL"."CUSTOMER_TRX_ID"
           --AND "LINES"."LINE_TYPE"='TAX'
		   AND upper("LINES"."TAX_CLASSIFICATION_CODE") NOT LIKE '%MILLAR%'
           AND UPPER(NVL("LINES"."TAX_CLASSIFICATION_CODE", 'IVA')) LIKE '%IVA%') AS "total_vat",
       '' AS "total_stps",
       '' AS "total_st",
       '' AS "total_tips",
       /*(SELECT ABS(SUM("LINES"."EXTENDED_AMOUNT"))
          FROM "FUSION"."RA_CUSTOMER_TRX_LINES_ALL" "LINES",
               "FUSION"."AR_MEMO_LINES_ALL_B"       "MEMO"
         WHERE "LINES"."CUSTOMER_TRX_ID"="RA_CUSTOMER_TRX_ALL"."CUSTOMER_TRX_ID"
           AND "MEMO"."MEMO_LINE_SEQ_ID"="LINES"."MEMO_LINE_SEQ_ID"
           AND "LINES"."LINE_TYPE"='LINE'
           AND NVL("MEMO"."ATTRIBUTE2",'N') = 'Y'
           AND UPPER("LINES"."DESCRIPTION") LIKE '%FLETE%') as "retention_vat", --Flete*/ -- Corregir Subtotal para Timbrado 201118
	   (SELECT ABS(SUM("LINES"."EXTENDED_AMOUNT")) 
          FROM "FUSION"."RA_CUSTOMER_TRX_LINES_ALL" "LINES"
         WHERE "LINES"."CUSTOMER_TRX_ID"="RA_CUSTOMER_TRX_ALL"."CUSTOMER_TRX_ID"
           --AND "LINES"."LINE_TYPE"='TAX' 
		   AND upper("LINES"."DESCRIPTION") NOT LIKE '%MILLAR%'
           AND "LINES"."TAX_RATE" < 0) AS "retention_vat",  --monto
       --'' as "retention_rt",  --monto
	   ABS(t1.retention_rt) as "retention_rt",  --monto
       (SELECT ABS(SUM("LINES"."EXTENDED_AMOUNT")) 
          FROM "FUSION"."RA_CUSTOMER_TRX_LINES_ALL" "LINES",
               "FUSION"."AR_MEMO_LINES_ALL_B" "MEMO"
         WHERE "LINES"."CUSTOMER_TRX_ID"="RA_CUSTOMER_TRX_ALL"."CUSTOMER_TRX_ID"
           AND "MEMO"."MEMO_LINE_SEQ_ID"="LINES"."MEMO_LINE_SEQ_ID"
           AND NVL("MEMO"."ATTRIBUTE2", 'N') != 'Y'
           AND "LINES"."LINE_TYPE"='LINE')
        + ABS(NVL(t1.retention_rt,0)) 
		--+ ABS(NVL(t1.retention_vat,0))
        + ABS(NVL(t1.local_retencion_amount,0)) as "subtotal", -- Corregir Subtotal para Timbrado 201118
       ((SELECT ABS(SUM("LINES"."EXTENDED_AMOUNT"))
          FROM "FUSION"."RA_CUSTOMER_TRX_LINES_ALL" "LINES",
               "FUSION"."AR_MEMO_LINES_ALL_B" "MEMO"
         WHERE "LINES"."CUSTOMER_TRX_ID"="RA_CUSTOMER_TRX_ALL"."CUSTOMER_TRX_ID"
           AND "LINES"."MEMO_LINE_SEQ_ID"= "MEMO"."MEMO_LINE_SEQ_ID"(+)
           AND "MEMO"."ATTRIBUTE3" IS NULL)-(SELECT NVL(ABS(SUM("LINES"."EXTENDED_AMOUNT")), 0)
                                               FROM "FUSION"."RA_CUSTOMER_TRX_LINES_ALL" "LINES",
                                                    "FUSION"."AR_MEMO_LINES_ALL_B" "MEMO"
                                              WHERE "LINES"."CUSTOMER_TRX_ID"="RA_CUSTOMER_TRX_ALL"."CUSTOMER_TRX_ID"
                                                AND "MEMO"."MEMO_LINE_SEQ_ID"="LINES"."MEMO_LINE_SEQ_ID"
                                                AND "MEMO"."ATTRIBUTE2" = 'Y')) as "total",
      ( CASE WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'CIT071219IH4' THEN 'CTIT'
			  WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'ACP100428EXA' THEN 'ACP'
              WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'TTP050504P51' THEN 'TTP'
              WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'TTE020806LF4' THEN 'TTE'	
              WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'ENE0410255W7' THEN 'ENE'	
              WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'CTE060224DA3' AND "RA_CUST_TRX_TYPES_ALL"."NAME" = 'FACTURA TR' THEN 'TRD'
			  WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'CTE060224DA3' AND "RA_CUST_TRX_TYPES_ALL"."NAME" = 'FACTURA TOP' THEN 'TOPD'
			  WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'CTE060224DA3' AND "RA_CUST_TRX_TYPES_ALL"."NAME" = 'FACTURA CTE' THEN 'CTE'
			  WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'CTE060224DA3' AND "RA_CUST_TRX_TYPES_ALL"."NAME" = 'FACTURA TDF' THEN 'TDFD'
			  WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'CTE060224DA3' AND "RA_CUST_TRX_TYPES_ALL"."NAME" = 'FACTURA INTERCO' THEN 'CTE'
			  WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'CTE060224DA3' THEN 'TRD'
              WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'AMP521016875' THEN 'AMP'	
			  WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'IPB0912082X8' THEN 'IPBD'
              WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'KMT020927F45' THEN 'KER'
              WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'TER111123FI2' THEN 'TER'	
              WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'VER870629GN3' THEN 'VER'
              WHEN "XLE_REGISTRATIONS"."REGISTRATION_NUMBER" = 'TEC1004288S4' THEN 'TEC'
      ELSE NULL   
    END ) AS "serie",
       '' AS "branch_id",
       '' AS "branch_number",
       'MATRIZ' AS "branch_name",
       "HZ_LOCATIONS_SHIP_TO"."ADDRESS1" AS "branch_street",
       '' AS "branch_ext_number",
       "HZ_LOCATIONS_SHIP_TO"."ADDRESS3" AS "branch_int_number",
       "HZ_LOCATIONS_SHIP_TO"."ADDRESS4" AS "branch_colony",
       "HZ_LOCATIONS_SHIP_TO"."POSTAL_CODE" AS "branch_zip_code",
       "HZ_LOCATIONS_SHIP_TO"."CITY" AS "branch_municipality",
       "HZ_LOCATIONS_SHIP_TO"."STATE" AS "branch_state",
       "HZ_LOCATIONS_SHIP_TO"."PROVINCE" AS "branch_reference",
       '' AS "branch_phone",
       (SELECT "FND_TERRITORIES_VL"."ISO_TERRITORY_CODE" 
          FROM "FUSION"."FND_TERRITORIES_VL" "FND_TERRITORIES_VL" 
         WHERE "FND_TERRITORIES_VL"."TERRITORY_CODE"="HZ_LOCATIONS_SHIP_TO"."COUNTRY"
           AND ROWNUM=1) AS "branch_country", -- modif IMM 041218	   
        "HZ_PARTIES_BILL"."PARTY_NAME" AS "receiver_name",
       "HZ_PARTY_SITES_SHIP"."MAILSTOP" AS "receiver_email",
       --(SELECT NVL("HP"."JGZZ_FISCAL_CODE", "HO"."JGZZ_FISCAL_CODE") FROM "HZ_PARTIES" "HP", "HZ_ORGANIZATION_PROFILES" "HO" WHERE "HZ_PARTY_SITES_BILL"."PARTY_ID"= "HP"."PARTY_ID" AND "HO"."PARTY_ID"="HP"."PARTY_ID") AS "receiver_rfc", --Cambio por rfc JRm 050320 
	   (SELECT "HP"."JGZZ_FISCAL_CODE" FROM "HZ_PARTIES" "HP" WHERE "HZ_PARTY_SITES_BILL"."PARTY_ID"= "HP"."PARTY_ID") AS "receiver_rfc",
       '' AS "receiver_phone",
       "HZ_LOCATIONS_BILL_TO"."ADDRESS1" AS "receiver_street",
       '' AS "receiver_ext_number",--"HZ_LOCATIONS_BILL_TO"."ADDRESS2" AS "receiver_ext_number",
       "HZ_LOCATIONS_BILL_TO"."ADDRESS3" AS "receiver_int_number",
       "HZ_LOCATIONS_BILL_TO"."ADDRESS4" AS "receiver_colony",
       "HZ_LOCATIONS_BILL_TO"."POSTAL_CODE" AS "receiver_zip_code",
       "HZ_LOCATIONS_BILL_TO"."CITY" AS "receiver_municipality",
       "HZ_LOCATIONS_BILL_TO"."STATE" AS "receiver_state",
       --"HZ_LOCATIONS_BILL_TO"."COUNTRY" AS "receiver_country", -- modif IMM 311118
       (SELECT "FND_TERRITORIES_VL"."ISO_TERRITORY_CODE" 
          FROM "FUSION"."FND_TERRITORIES_VL" "FND_TERRITORIES_VL" 
         WHERE "FND_TERRITORIES_VL"."TERRITORY_CODE"="HZ_LOCATIONS_SHIP_TO"."COUNTRY"
           AND ROWNUM=1) AS "receiver_country",  -- modif IMM 041218	   
       '' AS "receiver_passport",
       "RA_CUSTOMER_TRX_ALL"."ATTRIBUTE1" AS "receiver_cfdi_use",
       "RA_CUSTOMER_TRX_ALL"."ATTRIBUTE12" AS "payment_method",
       "RA_CUSTOMER_TRX_ALL"."INVOICE_CURRENCY_CODE" AS "currency",
       --'601' AS "issuer_tax_regime",
	   "XLE_ENTITY_PROFILES"."ATTRIBUTE2" AS "issuer_tax_regime", -- modif IMM 041218	   
       DECODE("RA_CUSTOMER_TRX_ALL"."INVOICE_CURRENCY_CODE",'USD','1','') AS "currency_exchange_rate",
       NVL("RA_CUSTOMER_TRX_ALL"."ATTRIBUTE10",'99') AS "payment_method_select", 
       '' AS "added_payment_methods",
       NVL("RA_CUSTOMER_TRX_ALL"."ATTRIBUTE10",'99') AS "payment_form",
       '' AS "payment_condition",
       '' AS "payment_status",
       '' AS "payment_account_number",
       '' AS "discount",
       '' AS "comments",
       '' AS "service",
	   /*
       CASE
          WHEN "RA_CUSTOMER_TRX_ALL"."ATTRIBUTE7" = 6 THEN '07' 
          ELSE NULL 
       END 
	   */
	   "RA_CUSTOMER_TRX_ALL"."ATTRIBUTE14" AS "relationship_type",
	   NVL("RA_CUSTOMER_TRX_ALL"."ATTRIBUTE11",'01') AS "exportacion",
	   		(SELECT 
(CASE WHEN HOP.party_id IS NOT NULL
THEN HOP.ATTRIBUTE1
ELSE HPP.ATTRIBUTE1 END
) receiver_tax_regime
FROM HZ_PARTIES HP
left join HZ_ORGANIZATION_PROFILES HOP ON HP.party_id=HOP.party_id
left join HZ_PERSON_PROFILES HPP ON HP.party_id=HPP.party_id
WHERE 1=1 --and PARTY_NAME='PRICE RES SAPI DE CV'
and HP.party_id = "HZ_PARTY_SITES_BILL"."PARTY_ID") AS "receiver_tax_regime",
/*      
	  CASE
          WHEN "RA_CUSTOMER_TRX_ALL"."ATTRIBUTE7" = 6 THEN (select REPLACE(LISTAGG ("FND_DOCUMENTS_TL"."TITLE" , ',') WITHIN GROUP (ORDER BY "FND_DOCUMENTS_TL"."TITLE" ), 'UUID_I_') from "FUSION"."AR_RECEIVABLE_APPLICATIONS_ALL"   "AR_RECEIVABLE_APPLICATIONS_ALL", "FUSION"."AR_CASH_RECEIPTS_ALL" "AR_CASH_RECEIPTS_ALL", "FUSION"."AR_RECEIPT_METHODS" "AR_RECEIPT_METHODS", "FUSION"."AR_RECEIPT_CLASSES" "AR_RECEIPT_CLASSES", "FUSION"."FND_ATTACHED_DOCUMENTS" "FND_ATTACHED_DOCUMENTS", "FUSION"."FND_DOCUMENTS" "FND_DOCUMENTS", "FUSION"."FND_DOCUMENTS_TL" "FND_DOCUMENTS_TL" where "RA_CUSTOMER_TRX_ALL"."CUSTOMER_TRX_ID" ="AR_RECEIVABLE_APPLICATIONS_ALL"."APPLIED_CUSTOMER_TRX_ID" AND "AR_RECEIVABLE_APPLICATIONS_ALL"."CASH_RECEIPT_ID"="AR_CASH_RECEIPTS_ALL"."CASH_RECEIPT_ID" AND "AR_CASH_RECEIPTS_ALL"."RECEIPT_METHOD_ID"="AR_RECEIPT_METHODS"."RECEIPT_METHOD_ID" AND "AR_RECEIPT_METHODS"."RECEIPT_CLASS_ID"="AR_RECEIPT_CLASSES"."RECEIPT_CLASS_ID" AND NVL("AR_RECEIPT_CLASSES"."ATTRIBUTE1", 'N') = 'Y' AND TO_CHAR("AR_CASH_RECEIPTS_ALL"."CASH_RECEIPT_ID") = "FND_ATTACHED_DOCUMENTS"."PK1_VALUE" AND "FND_ATTACHED_DOCUMENTS"."DOCUMENT_ID" = "FND_DOCUMENTS"."DOCUMENT_ID" AND "FND_DOCUMENTS"."DOCUMENT_ID" = "FND_DOCUMENTS_TL"."DOCUMENT_ID" AND "FND_DOCUMENTS"."DATATYPE_CODE" = 'TEXT' AND "FND_DOCUMENTS_TL"."LANGUAGE" = 'US' AND "FND_DOCUMENTS_TL"."TITLE" LIKE 'UUID_I%')
          ELSE NULL 
       END 
*/
       "RA_CUSTOMER_TRX_ALL"."ATTRIBUTE8" AS "related_cfdi"
  FROM "FUSION"."RA_CUSTOMER_TRX_ALL" "RA_CUSTOMER_TRX_ALL",
       "FUSION"."AR_PAYMENT_SCHEDULES_ALL" "AR_PAYMENT_SCHEDULES_ALL",
       "FUSION"."RA_BATCH_SOURCES_ALL" "RA_BATCH_SOURCES_ALL",
       "FUSION"."HZ_CUST_ACCOUNTS" "HZ_CUST_ACCOUNTS_BILL",
       "FUSION"."HZ_CUST_ACCT_SITES_ALL" "HZ_CUST_ACCT_SITES_BILL",
       "FUSION"."HZ_CUST_SITE_USES_ALL" "HZ_CUST_SITE_USES_BILL", 
       "FUSION"."HZ_CUST_ACCT_SITES_ALL" "SHIP_TO_SITES_ALL",
	  "FUSION"."HZ_PARTY_SITE_USES" "PARTY_SITE_USES_SHIP_TO",
       "FUSION"."HZ_PARTY_SITES" "HZ_PARTY_SITES_BILL",
       "FUSION"."HZ_LOCATIONS" "HZ_LOCATIONS_BILL_TO",
       "FUSION"."HZ_PARTY_SITE_USES" "HZ_PARTY_SITE_USES_SHIP",
       "FUSION"."HZ_PARTY_SITES" "HZ_PARTY_SITES_SHIP",
       "FUSION"."HZ_PARTIES" "HZ_PARTIES_SHIP",
       "FUSION"."HZ_PARTIES" "HZ_PARTIES_BILL",
       "FUSION"."HZ_LOCATIONS" "HZ_LOCATIONS_SHIP_TO",
       "FUSION"."RA_TERMS_VL" "RA_TERMS_VL",
       "FUSION"."RA_TERMS_LINES" "RA_TERMS_LINES",
       "FUSION"."RA_CUST_TRX_TYPES_ALL" "RA_CUST_TRX_TYPES_ALL",
       "FUSION"."XLE_ENTITY_PROFILES" "XLE_ENTITY_PROFILES",
       "FUSION"."XLE_REGISTRATIONS" "XLE_REGISTRATIONS",
       "FUSION"."HZ_LOCATIONS" "HZ_LOCATIONS",
       "FUSION"."HZ_PARTIES" "HZ_PARTIES",
       "FUSION"."HZ_GEOGRAPHIES" "HZ_GEOGRAPHIES",
       "FUSION"."HR_ALL_ORGANIZATION_UNITS" "HR_ALL_ORGANIZATION_UNITS",
       "FUSION"."HR_LOCATIONS" "HR_LOCATIONS"
	   ,( SELECT ctla.CUSTOMER_TRX_ID
			,(CASE WHEN upper(ctla.DESCRIPTION) LIKE '%MILLAR%' THEN upper(ctla.DESCRIPTION) ELSE NULL END) AS local_retencion_name
			,(CASE WHEN upper(ctla.DESCRIPTION) LIKE '%MILLAR%' THEN sum(ctla.EXTENDED_AMOUNT) ELSE NULL END) AS local_retencion_amount
			,(CASE WHEN upper(ctla.DESCRIPTION) LIKE '%MILLAR%' THEN '0.5' ELSE NULL END) AS local_retention_percentage
			,(CASE WHEN upper(ctla.DESCRIPTION) = 'FLETE RET 4%' THEN upper(ctla.DESCRIPTION)
				   WHEN upper(ctla.DESCRIPTION) = 'FLETE RET 6%' THEN upper(ctla.DESCRIPTION)
					ELSE NULL END) AS retencion_vat_name
			,(CASE WHEN upper(ctla.DESCRIPTION) = 'FLETE RET 4%' THEN sum(ctla.EXTENDED_AMOUNT)
				   WHEN upper(ctla.DESCRIPTION) = 'FLETE RET 6%' THEN sum(ctla.EXTENDED_AMOUNT) 
					ELSE NULL END) AS retention_vat
			,(CASE WHEN upper(ctla.DESCRIPTION) = 'FLETE RET 4%' THEN '0.04' 
				   WHEN upper(ctla.DESCRIPTION) = 'FLETE RET 6%' THEN '0.06'
					ELSE NULL END) AS retention_vat_percentage
			,NULL AS retention_rt_name
			,NULL AS retention_rt
			,NULL AS retention_rt_percentage
		FROM
			"FUSION"."RA_CUSTOMER_TRX_LINES_ALL" ctla,
			"FUSION"."EGP_ITEM_TEXT_VL" "EGP_ITEM_TEXT_VL",
			"FUSION"."EGP_ITEM_RELATIONSHIPS_VL" "EGP_ITEM_RELATIONSHIPS_VL",
			"FUSION"."EGP_SYSTEM_ITEMS_V" "EGP_SYSTEM_ITEMS_V",
			"FUSION"."INV_UNITS_OF_MEASURE_VL" "INV_UNITS_OF_MEASURE_VL",
			"FUSION"."AR_MEMO_LINES_ALL_B" "AR_MEMO_LINES_ALL_B"
		WHERE ctla."INVENTORY_ITEM_ID" = "EGP_SYSTEM_ITEMS_V"."INVENTORY_ITEM_ID" (+)
			AND ctla."WAREHOUSE_ID" = "EGP_SYSTEM_ITEMS_V"."ORGANIZATION_ID" (+)
			AND ctla."INVENTORY_ITEM_ID" = "EGP_ITEM_RELATIONSHIPS_VL"."INVENTORY_ITEM_ID" (+)
			AND "EGP_SYSTEM_ITEMS_V"."INVENTORY_ITEM_ID" = "EGP_ITEM_TEXT_VL"."ITEM_ID" (+)
			AND "EGP_SYSTEM_ITEMS_V"."ORGANIZATION_ID" = "EGP_ITEM_TEXT_VL"."ORG_ID" (+)
			AND ctla."UOM_CODE" = "INV_UNITS_OF_MEASURE_VL"."UOM_CODE" (+)
			--AND ctla."UNIT_SELLING_PRICE" < 0
			AND ctla."SALES_ORDER_LINE" IS NULL
			AND ctla."MEMO_LINE_SEQ_ID" = "AR_MEMO_LINES_ALL_B"."MEMO_LINE_SEQ_ID"
			AND nvl("AR_MEMO_LINES_ALL_B"."ATTRIBUTE2",'N') != 'Y'
			AND (upper(ctla.DESCRIPTION) LIKE '%MILLAR%' OR upper(ctla.DESCRIPTION) LIKE '%FLETE%')
			--AND upper(ctla.DESCRIPTION) LIKE '%FLETE%'
		    --AND TAX_RECOVERABLE IS NOT NULL
			AND ctla.TAX_RECOVERABLE NOT IN (0)
			--AND ctla.CUSTOMER_TRX_ID = '300000029012246'
		   GROUP BY ctla.CUSTOMER_TRX_ID
		    ,upper(ctla.DESCRIPTION)
		    ,ctla.TAX_CLASSIFICATION_CODE
		    ,ctla.TAX_RECOVERABLE
			,ctla.EXTENDED_AMOUNT
			) T1
 WHERE "RA_CUSTOMER_TRX_ALL"."CREATION_DATE">=TO_DATE('06/09/2017', 'DD/MM/YYYY')
   AND "RA_CUSTOMER_TRX_ALL"."BATCH_SOURCE_SEQ_ID"="RA_BATCH_SOURCES_ALL"."BATCH_SOURCE_SEQ_ID"
   AND "RA_CUSTOMER_TRX_ALL"."BILL_TO_CUSTOMER_ID"="HZ_CUST_ACCOUNTS_BILL"."CUST_ACCOUNT_ID"
   AND "HZ_CUST_ACCOUNTS_BILL"."PARTY_ID"="HZ_PARTIES_BILL"."PARTY_ID"
   AND  "AR_PAYMENT_SCHEDULES_ALL"."CUSTOMER_TRX_ID" = "RA_CUSTOMER_TRX_ALL"."CUSTOMER_TRX_ID" 
   AND "HZ_CUST_ACCOUNTS_BILL"."CUST_ACCOUNT_ID"="HZ_CUST_ACCT_SITES_BILL"."CUST_ACCOUNT_ID"
   AND "RA_CUSTOMER_TRX_ALL"."BILL_TO_SITE_USE_ID"="HZ_CUST_SITE_USES_BILL"."SITE_USE_ID"
   AND "HZ_CUST_SITE_USES_BILL"."CUST_ACCT_SITE_ID"="HZ_CUST_ACCT_SITES_BILL"."CUST_ACCT_SITE_ID" 
   AND "HZ_CUST_ACCT_SITES_BILL"."PARTY_SITE_ID"="HZ_PARTY_SITES_BILL"."PARTY_SITE_ID"
   AND "HZ_PARTY_SITES_BILL"."LOCATION_ID"="HZ_LOCATIONS_BILL_TO"."LOCATION_ID"
   AND "RA_CUSTOMER_TRX_ALL"."SHIP_TO_PARTY_SITE_USE_ID"="HZ_PARTY_SITE_USES_SHIP"."PARTY_SITE_USE_ID"
   AND "HZ_PARTY_SITE_USES_SHIP"."PARTY_SITE_ID"="HZ_PARTY_SITES_SHIP"."PARTY_SITE_ID"
   AND "HZ_PARTY_SITES_SHIP"."PARTY_ID"="HZ_PARTIES_SHIP"."PARTY_ID"
   AND "HZ_PARTY_SITES_SHIP"."LOCATION_ID"="HZ_LOCATIONS_SHIP_TO"."LOCATION_ID"
   AND "RA_CUSTOMER_TRX_ALL"."SHIP_TO_PARTY_SITE_USE_ID"="PARTY_SITE_USES_SHIP_TO"."PARTY_SITE_USE_ID"
   AND "PARTY_SITE_USES_SHIP_TO"."PARTY_SITE_ID"="SHIP_TO_SITES_ALL"."PARTY_SITE_ID"
   AND "RA_CUSTOMER_TRX_ALL"."TERM_ID"="RA_TERMS_VL"."TERM_ID"(+)
   AND "RA_TERMS_VL"."TERM_ID"="RA_TERMS_LINES"."TERM_ID"(+)
   AND "RA_CUSTOMER_TRX_ALL"."CUST_TRX_TYPE_SEQ_ID"="RA_CUST_TRX_TYPES_ALL"."CUST_TRX_TYPE_SEQ_ID"
   AND "RA_CUSTOMER_TRX_ALL"."LEGAL_ENTITY_ID"="XLE_ENTITY_PROFILES"."LEGAL_ENTITY_ID"
   AND "XLE_ENTITY_PROFILES"."LEGAL_ENTITY_ID"="XLE_REGISTRATIONS"."SOURCE_ID"
   AND "XLE_REGISTRATIONS"."LOCATION_ID"="HZ_LOCATIONS"."LOCATION_ID"
   AND "XLE_ENTITY_PROFILES"."PARTY_ID"="HZ_PARTIES"."PARTY_ID"
   AND "XLE_ENTITY_PROFILES"."GEOGRAPHY_ID"="HZ_GEOGRAPHIES"."GEOGRAPHY_ID"
   AND "RA_CUSTOMER_TRX_ALL"."ORG_ID"="HR_ALL_ORGANIZATION_UNITS"."ORGANIZATION_ID"
   AND "HR_ALL_ORGANIZATION_UNITS"."LOCATION_ID"="HR_LOCATIONS"."LOCATION_ID"        
   --AND "RA_CUSTOMER_TRX_ALL"."CT_REFERENCE" IS NULL --MODIFY JRM 28/01/19
   --AND "RA_CUSTOMER_TRX_ALL"."TRX_NUMBER" IN ('6441030')
   --AND "RA_CUSTOMER_TRX_ALL"."TRX_NUMBER" = :pNumber
   AND "RA_CUSTOMER_TRX_ALL"."ATTRIBUTE7" IN (3, 4, 6)
   --AND "RA_CUSTOMER_TRX_ALL"."ATTRIBUTE3" is null
   --AND "RA_CUSTOMER_TRX_ALL"."GLOBAL_ATTRIBUTE1" is null
   /*AND ( "RA_CUSTOMER_TRX_ALL"."ATTRIBUTE7" IN (3, 4, 6) OR (EXISTS (SELECT 1 
                                                                   FROM "RA_CUSTOMER_TRX_ALL" "SUBRA"
                                                                  WHERE "SUBRA"."ATTRIBUTE3" = "RA_CUSTOMER_TRX_ALL"."ATTRIBUTE3"
                                                                    AND "SUBRA"."CUSTOMER_TRX_ID"!="RA_CUSTOMER_TRX_ALL"."CUSTOMER_TRX_ID" 
                                                                    AND "RA_CUSTOMER_TRX_ALL"."CREATION_DATE">"SUBRA"."CREATION_DATE")))
   AND (("RA_CUSTOMER_TRX_ALL"."ATTRIBUTE3" IS NULL) OR EXISTS (SELECT 1 
                                                                   FROM "RA_CUSTOMER_TRX_ALL" "SUBRA"
                                                                  WHERE "SUBRA"."ATTRIBUTE3" = "RA_CUSTOMER_TRX_ALL"."ATTRIBUTE3"
                                                                    AND "SUBRA"."CUSTOMER_TRX_ID"!="RA_CUSTOMER_TRX_ALL"."CUSTOMER_TRX_ID") )*/
   AND "RA_CUSTOMER_TRX_ALL"."CREATION_DATE" >= '2018/01/04'
   AND "RA_CUSTOMER_TRX_ALL"."COMPLETE_FLAG"='Y'
 --AND nvl("RA_CUSTOMER_TRX_ALL"."INTERFACE_HEADER_CONTEXT",'X')!='INTEGRACION_TRX' ----MODIFY JRM 28/01/19
AND "HZ_CUST_ACCT_SITES_BILL"."SET_ID" = "SHIP_TO_SITES_ALL"."SET_ID" 
--and "RA_CUSTOMER_TRX_ALL"."TRX_NUMBER" not in ('124133')
AND "RA_CUSTOMER_TRX_ALL"."CUSTOMER_TRX_ID" = T1.CUSTOMER_TRX_ID(+)
),
LINES AS (
    SELECT
        RCTL2.CUSTOMER_TRX_ID ,
        RCTL2.LINE_NUMBER,
        RCTL2.DESCRIPTION,
        RCTL2.CUSTOMER_TRX_LINE_ID,
        RCTL2.QUANTITY_INVOICED,
        RCTL2.UNIT_SELLING_PRICE,
        RCTL2.LINE_TYPE,
        RCTL2.EXTENDED_AMOUNT,
        RCTL2.REVENUE_AMOUNT,
		RCTL2.UOM_CODE,
        RCTL.LINK_TO_CUST_TRX_LINE_ID,
        RCTL.TAX_RATE,
        RCTL.VAT_TAX_ID,
        RCTL2.TAX_EXEMPT_FLAG,
        RCTL.TAXABLE_AMOUNT,
        RCTL.TAX_LINE_ID,
        RCTL2.TAX_RECOVERABLE,
        RCTL2.TAX_CLASSIFICATION_CODE,
		RCTL2.MEMO_LINE_SEQ_ID
    FROM
        RA_CUSTOMER_TRX_LINES_ALL  RCTL
        LEFT JOIN RA_CUSTOMER_TRX_LINES_ALL  RCTL2 ON RCTL.LINK_TO_CUST_TRX_LINE_ID = RCTL2.CUSTOMER_TRX_LINE_ID
		inner join HEADER hd on RCTL2.CUSTOMER_TRX_ID =hd."CUSTOMER_TRX_ID" 
    WHERE 1=1
        --AND RCTL2.CUSTOMER_TRX_ID =RCTL2.CUSTOMER_TRX_ID 
		  --AND RCTL2.CUSTOMER_TRX_ID IN ( 300000062196100, 300000062622184, 300000062622211,300000062196116 )
    UNION ALL
    SELECT
        RCTL2.CUSTOMER_TRX_ID,
        RCTL2.LINE_NUMBER,
        RCTL2.DESCRIPTION,
        RCTL2.CUSTOMER_TRX_LINE_ID,
        RCTL2.QUANTITY_INVOICED,
        RCTL2.UNIT_SELLING_PRICE,
        RCTL2.LINE_TYPE,
        RCTL2.EXTENDED_AMOUNT,
        RCTL2.REVENUE_AMOUNT,
        RCTL2.UOM_CODE,
        RCTL2.LINK_TO_CUST_TRX_LINE_ID,
        RCTL2.TAX_RATE,
        RCTL2.VAT_TAX_ID,
        RCTL2.TAX_EXEMPT_FLAG,
        RCTL2.TAXABLE_AMOUNT,
        RCTL2.TAX_LINE_ID,
        RCTL2.TAX_RECOVERABLE,
        RCTL2.TAX_CLASSIFICATION_CODE,
		RCTL2.MEMO_LINE_SEQ_ID
    FROM
        RA_CUSTOMER_TRX_LINES_ALL RCTL2
		inner join HEADER hd on RCTL2.CUSTOMER_TRX_ID =hd."CUSTOMER_TRX_ID" 
    WHERE
	1=1
         --AND RCTL2.CUSTOMER_TRX_ID =RCTL2.CUSTOMER_TRX_ID --
		 --AND RCTL2.CUSTOMER_TRX_ID IN ( 300000062196100, 300000062622184, 300000062622211,300000062196116)
        AND RCTL2.LINE_TYPE = 'LINE'
        AND RCTL2.TAX_RECOVERABLE IS NULL
)
select 
hd."CUSTOMER_TRX_ID" AS "CUSTOMER_TRX_ID",
       hd."TRX_NUMBER" AS "TRX_NUMBER",
       hd."TRANSACTION_SOURCE"AS "TRANSACTION_SOURCE",
	   hd."BUSINESS_UNIT" AS "BUSINESS_UNIT",
       '' AS "id_rfc",
       '' AS "certificate_number",
       hd."issuer_rfc" AS "issuer_rfc",
       hd."issuer_name"  AS "issuer_name", 
       hd."issuer_street" AS "issuer_street", 
       '' AS "issuer_ext_number",
       hd."issuer_int_number" AS "issuer_int_number", 
       hd."issuer_colony" AS "issuer_colony", 
       hd."issuer_zip_code" AS "issuer_zip_code", 
       hd."issuer_municipality" AS "issuer_municipality", 
       hd."issuer_state" AS "issuer_state", 
       '' AS "issuer_phone", 
       hd."issuer_country" AS "issuer_country", 
      hd. "invoice_date" as "invoice_date",
        hd."document_type" AS "document_type",
	   '' AS "additional_information",
       '' AS "cancellation_date",
       '' as "total_words",
       hd."total_items" AS "total_items",   
	   --(case when hd."local_retention_percentage" = 0 then null else hd."local_retention_percentage" * 10 ||' AL MILLAR'end) as  "local_retention_name",
	   
	    (case when  NVL((SELECT ABS(SUM("LINES"."TAX_RATE")) 
          FROM LINES "LINES"
         WHERE "LINES"."CUSTOMER_TRX_ID"=hd."CUSTOMER_TRX_ID"
           --AND "LINES"."LINE_TYPE"='TAX' 
		   AND upper("LINES"."TAX_CLASSIFICATION_CODE") LIKE '%MILLAR%'
           --AND "LINES"."TAX_RATE" < 0
		   ),0) = 0
	   then null
	   else  NVL((SELECT ABS(SUM("LINES"."TAX_RATE")) 
          FROM LINES "LINES"
         WHERE "LINES"."CUSTOMER_TRX_ID"=hd."CUSTOMER_TRX_ID"
           --AND "LINES"."LINE_TYPE"='TAX' 
		   AND upper("LINES"."TAX_CLASSIFICATION_CODE") LIKE '%MILLAR%'
           --AND "LINES"."TAX_RATE" < 0
		   ),0) * 10 ||' AL MILLAR'end ) as  "local_retention_name",
	   
	   		   ABS(NVL((SELECT ABS(SUM("LINES"."TAX_RATE"))
          FROM LINES "LINES"
         WHERE "LINES"."CUSTOMER_TRX_ID"=hd."CUSTOMER_TRX_ID"
           --AND "LINES"."LINE_TYPE"='TAX' 
		   AND upper("LINES"."TAX_CLASSIFICATION_CODE") LIKE '%MILLAR%'
           --AND "LINES"."TAX_RATE" < 0
		   ),0) ) AS "local_retention_percentage",
		   
		   ABS(NVL((SELECT ABS(SUM("LINES"."TAX_RECOVERABLE")) 
          FROM LINES "LINES"
         WHERE "LINES"."CUSTOMER_TRX_ID"=hd."CUSTOMER_TRX_ID"
           --AND "LINES"."LINE_TYPE"='TAX' 
		   AND upper("LINES"."TAX_CLASSIFICATION_CODE") LIKE '%MILLAR%'
           --AND "LINES"."TAX_RATE" < 0
		   ),0 )) AS "local_retention_amount",
		   
       ABS(NVL((SELECT ABS(SUM("LINES"."TAX_RECOVERABLE")) 
          FROM LINES "LINES"
         WHERE "LINES"."CUSTOMER_TRX_ID"=hd."CUSTOMER_TRX_ID"
           --AND "LINES"."LINE_TYPE"='TAX'
		   --AND upper("LINES"."TAX_CLASSIFICATION_CODE") NOT LIKE '%ALMILLAR%'
           AND UPPER("LINES"."TAX_CLASSIFICATION_CODE") LIKE '%IVA%'),0)) AS "total_vat",
----hd."local_retention_percentage" AS "local_retention_percentage",
--hd."local_retention_amount" AS "local_retention_amount",
--hd."total_vat" AS "total_vat",
       '' AS "total_stps",
       '' AS "total_st",
       '' AS "total_tips",
       ABS(NVL(hd."retention_vat",0)) as "retention_vat",  
       ABS(NVL(hd."retention_rt",0)) as "retention_rt", 
       ABS(NVL(hd."subtotal",0)) as "subtotal", 
       ABS(NVL(hd."total",0))  as "total",
      hd."serie" AS "serie",
       '' AS "branch_id",
       '' AS "branch_number",
       'MATRIZ' AS "branch_name",
       hd."branch_street" AS "branch_street",
       '' AS "branch_ext_number",
       hd."branch_int_number" AS "branch_int_number",
       hd."branch_colony" AS "branch_colony",
       hd."branch_zip_code" AS "branch_zip_code",
       hd."branch_municipality" AS "branch_municipality",
       hd."branch_state" AS "branch_state",
       hd."branch_reference" AS "branch_reference",
       '' AS "branch_phone",
       hd."branch_country" AS "branch_country",    
       hd."receiver_name" AS "receiver_name",
       hd."receiver_email" AS "receiver_email",
       hd."receiver_rfc" AS "receiver_rfc",
       '' AS "receiver_phone",
       hd."receiver_street" AS "receiver_street",
       '' AS "receiver_ext_number",
       hd."receiver_int_number" AS "receiver_int_number",
       hd."receiver_colony" AS "receiver_colony",
       hd."receiver_zip_code" AS "receiver_zip_code",
       hd."receiver_municipality" AS "receiver_municipality",
       hd."receiver_state" AS "receiver_state",
       hd."receiver_country" AS "receiver_country",     
       '' AS "receiver_passport",
       hd."receiver_cfdi_use" AS "receiver_cfdi_use",
       hd."payment_method" AS "payment_method",
       hd."currency" AS "currency",
       hd."issuer_tax_regime" AS "issuer_tax_regime",   
       hd."currency_exchange_rate" AS "currency_exchange_rate",
       hd."payment_method_select" AS "payment_method_select", 
       '' AS "added_payment_methods",
       hd."payment_form" AS "payment_form",
       '' AS "payment_condition",
       '' AS "payment_status",
       '' AS "payment_account_number",
       '' AS "discount",
       '' AS "comments",
       '' AS "service",
	   hd."relationship_type" AS "relationship_type",
	   hd."exportacion" AS "exportacion",
	   		hd."receiver_tax_regime" AS "RECEIVER_TAX_REGIME",
			hd."related_cfdi" AS "related_cfdi"
			from  HEADER hd 
			--where ROWNUM = 0
			--inner join LINES l
			--on l.CUSTOMER_TRX_ID =hd."CUSTOMER_TRX_ID"