WITH
TRX AS(SELECT CUSTOMER_TRX_ID
       ,TRX_NUMBER
       ,ATTRIBUTE3
       ,ORG_ID
       ,CUST_TRX_TYPE_SEQ_ID
	   ,BATCH_SOURCE_SEQ_ID
	   ,TRX_CLASS
  FROM RA_CUSTOMER_TRX_ALL
  WHERE 1 = 1
   --AND ATTRIBUTE1 IS NOT NULL
    AND TRX_NUMBER                 IN(:P_TRX_NUMBER)
  AND ORG_ID                              =NVL( :P_ORG_ID,ORG_ID  )
),
TYP AS (SELECT CUST_TRX_TYPE_ID,
         NAME,TYPE,CUST_TRX_TYPE_SEQ_ID
		 FROM RA_CUST_TRX_TYPES_ALL
WHERE 1=1
--AND NAME IN ('TRANSACCIONES PQ','FACTURA PQ CREDITO')
		 
),
TBS AS (SELECT BATCH_SOURCE_SEQ_ID,NAME FROM RA_BATCH_SOURCES_ALL),
BUN AS (SELECT ORGANIZATION_ID,NAME
FROM HR_ORGANIZATION_UNITS_F_TL 
WHERE 1=1
--AND SOURCE_LANG='US'
GROUP BY ORGANIZATION_ID,NAME
ORDER BY ORGANIZATION_ID)
SELECT 
TRX.TRX_NUMBER AS Transaction_Number,	
TRX.CUSTOMER_TRX_ID AS CUSTOMER_TRX_ID,
TRX.ORG_ID,
TBS.NAME AS Transaction_Source,
TYP.NAME AS Transaction_Type,
BUN.NAME AS Business_Unit
FROM TRX
LEFT JOIN TYP ON TRX.CUST_TRX_TYPE_SEQ_ID = TYP.CUST_TRX_TYPE_SEQ_ID
LEFT JOIN TBS ON TRX.BATCH_SOURCE_SEQ_ID = TBS.BATCH_SOURCE_SEQ_ID
LEFT JOIN BUN ON TRX.ORG_ID = BUN.ORGANIZATION_ID
WHERE 1=1 
AND TYP.NAME IN ('TRANSACCIONES PQ','FACTURA PQ  CREDITO')