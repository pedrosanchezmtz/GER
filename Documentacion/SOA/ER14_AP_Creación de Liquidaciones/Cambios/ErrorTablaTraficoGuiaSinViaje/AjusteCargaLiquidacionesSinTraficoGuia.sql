select distinct
      DN.UNIDAD_NEGOCIO        
      ,'LIQUIDACION' TIPO_DOC
      ,'PROPIO' TIPO_MOVIMIENTO
      ,dn.RFC RFC_DLIVER
      ,'CONTINGENTE' NOMBRE
      ,'CONTINGENTE' RFC 
      ,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1) desc_plaza
      ,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1)||'LIQ-'||TL.no_liquidacion NUMERO_DOCUMENTO
      ,TL.fecha_liquidacion FECHA_INGRESO
      ,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1)||'LIQ-'||TL.no_liquidacion REF_APLICACION
      ,TL.no_liquidacion ID_MOVIMIENTO
      ,'' no_guia
      ,TL.rowid
      ,'SIN ASIGNAR' destino_servicio
      ,'CRE' forma_pago
      ,'NUM LIQUIDACION:'||TL.NO_LIQUIDACION LINEA_PAGO
      ,'N/A' UNIDAD_MEDIDA
      ,TL.MONTO_GASTOS SUBTOTAL
      ,'AP_IVA16' AR_IVA_EXENTO
      ,TL.MONTO_GASTOS TOTAL
      ,TL.FECHA_INGRESO CREATION_DATE
      ,tv.id_personal_nombre PERSONAL_NOMBRE
 from XXER_DATOS_NEGOCIO_TBL DN
    ,ZAM_TRAFICO_LIQUIDACION tl
    ,ZAM_TRAFICO_VIAJE_LIQ tv
---------------SE DUPLICABA EL REGISTRO DE LA LIQUIDACIÓN 26/08/2019 GFC--------------------------
    /*,ZAM_TRAFICO_GUIA tg
where 1=1
   and DN.UNIDAD_NEGOCIO = 'DLIVER'
   --AND tl.no_liquidacion not in (47613,47610,47618,47611)
   and tl.no_liquidacion = tv.no_liquidacion
   and tv.no_viaje = tg.no_viaje
*/
-------CAMBIO 26/08/2019 SOLO SE CONSIDERA UN CIRCUITO POR CADA LIQUIDACIÓN GFC-------------------
    ,(SELECT L.no_liquidacion , LISTAGG(NVL(G.num_guia,G2.num_guia),'|') WITHIN GROUP (ORDER BY G.no_guia) num_guia
            FROM ZAM_TRAFICO_VIAJE_LIQ L 
            LEFT JOIN ZAM_TRAFICO_GUIA G ON L.no_viaje = G.no_viaje AND SUBSTR(G.num_guia,1,INSTR(G.num_guia,'-')-1) <> 'VCD'
            LEFT JOIN ZAM_TRAFICO_GUIA G2 ON L.no_viaje = G2.no_viaje AND SUBSTR(G2.num_guia,1,INSTR(G2.num_guia,'-')-1) = 'VCD'
            GROUP BY L.no_liquidacion) tg
where 1=1
   and DN.UNIDAD_NEGOCIO = 'DLIVER'
   and tl.no_liquidacion = tv.no_liquidacion
   and tv.no_liquidacion = tg.no_liquidacion
  AND tg.num_guia IS NOT NULL
--------------------------------------------------------------------------------------------------
   and TL.REPLICADO_AR = 'N'
   and TL.STATUS_LIQ = 'A'
   --and SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1) = 'CLN'
   and trunc(TL.FECHA_INGRESO) = TRUNC(SYSDATE-1)
   --and trunc(TL.FECHA_INGRESO) = to_date('07/07/2019','DD/MM/RRRR')
   --and tl.no_liquidacion in ( 47666,  47667,47668,47669)  --PARA PROCESAR POR NÚMERO DE LIQUIDACIÓN
   and 1=1
   union  
 -- Este select considera las liquidaciones que tienen un estus nulo en trafico Guia de soa por lo que consuta este dato de trafico guia directamente en ZAM  
   select distinct
      DN.UNIDAD_NEGOCIO        
      ,'LIQUIDACION' TIPO_DOC
      ,'PROPIO' TIPO_MOVIMIENTO
      ,dn.RFC RFC_DLIVER
      ,'CONTINGENTE' NOMBRE
      ,'CONTINGENTE' RFC 
      ,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1) desc_plaza
      ,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1)||'LIQ-'||TL.no_liquidacion NUMERO_DOCUMENTO
      ,TL.fecha_liquidacion FECHA_INGRESO
      ,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1)||'LIQ-'||TL.no_liquidacion REF_APLICACION
      ,TL.no_liquidacion ID_MOVIMIENTO
      ,'' no_guia
      ,TL.rowid
      ,'SIN ASIGNAR' destino_servicio
      ,'CRE' forma_pago
      ,'NUM LIQUIDACION:'||TL.NO_LIQUIDACION LINEA_PAGO
      ,'N/A' UNIDAD_MEDIDA
      ,TL.MONTO_GASTOS SUBTOTAL
      ,'AP_IVA16' AR_IVA_EXENTO
      ,TL.MONTO_GASTOS TOTAL
      ,TL.FECHA_INGRESO CREATION_DATE
      ,tv.id_personal_nombre PERSONAL_NOMBRE
 from XXER_DATOS_NEGOCIO_TBL DN
    ,ZAM_TRAFICO_LIQUIDACION tl
    ,ZAM_TRAFICO_VIAJE_LIQ tv
---------------SE DUPLICABA EL REGISTRO DE LA LIQUIDACIÓN 26/08/2019 GFC--------------------------
    /*,ZAM_TRAFICO_GUIA tg
where 1=1
   and DN.UNIDAD_NEGOCIO = 'DLIVER'
   --AND tl.no_liquidacion not in (47613,47610,47618,47611)
   and tl.no_liquidacion = tv.no_liquidacion
   and tv.no_viaje = tg.no_viaje
*/

-------CAMBIO 26/08/2019 SOLO SE CONSIDERA UN CIRCUITO POR CADA LIQUIDACIÓN GFC-------------------
    ,(SELECT L.no_liquidacion , LISTAGG(NVL(G."num_guia",G2."num_guia"),'|') WITHIN GROUP (ORDER BY G."no_guia") num_guia
            FROM ZAM_TRAFICO_VIAJE_LIQ L 
            LEFT JOIN TRAFICO_GUIA@HSMSSQLDLV.ESTRELLAROJA.COM.MX  G ON L.no_viaje = G."no_viaje" AND SUBSTR(G."num_guia",1,INSTR(G."num_guia",'-')-1) <> 'VCD'
            LEFT JOIN TRAFICO_GUIA@HSMSSQLDLV.ESTRELLAROJA.COM.MX  G2 ON L.no_viaje = G2."no_viaje" AND SUBSTR(G2."num_guia",1,INSTR(G2."num_guia",'-')-1) = 'VCD'
            GROUP BY L.no_liquidacion) tg
where 1=1
   and DN.UNIDAD_NEGOCIO = 'DLIVER'
   and tl.no_liquidacion = tv.no_liquidacion
   and tv.no_liquidacion = tg.no_liquidacion
   AND tg.num_guia IS NOT NULL
--------------------------------------------------------------------------------------------------
   and TL.REPLICADO_AR = 'N'
   and TL.STATUS_LIQ = 'A'
   --and SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1) = 'CLN'
   --and trunc(TL.FECHA_INGRESO) = TRUNC(SYSDATE-1)
   --and trunc(TL.FECHA_INGRESO) = to_date('07/07/2019','DD/MM/RRRR')
   and tl.no_liquidacion in ( 
   select distinct
      TL.no_liquidacion    
 from XXER_DATOS_NEGOCIO_TBL DN
    ,ZAM_TRAFICO_LIQUIDACION tl
    ,ZAM_TRAFICO_VIAJE_LIQ tv
    ,(SELECT L.no_liquidacion , LISTAGG(NVL(G.num_guia,G2.num_guia),'|') WITHIN GROUP (ORDER BY G.no_guia) num_guia
            FROM ZAM_TRAFICO_VIAJE_LIQ L 
            LEFT JOIN ZAM_TRAFICO_GUIA G ON L.no_viaje = G.no_viaje AND SUBSTR(G.num_guia,1,INSTR(G.num_guia,'-')-1) <> 'VCD'
            LEFT JOIN ZAM_TRAFICO_GUIA G2 ON L.no_viaje = G2.no_viaje AND SUBSTR(G2.num_guia,1,INSTR(G2.num_guia,'-')-1) = 'VCD'
            GROUP BY L.no_liquidacion) tg
where 1=1
   and DN.UNIDAD_NEGOCIO = 'DLIVER'
   and tl.no_liquidacion = tv.no_liquidacion
   and tv.no_liquidacion = tg.no_liquidacion
  --AND tg.num_guia IS NOT NULL
--------------------------------------------------------------------------------------------------
   and TL.REPLICADO_AR = 'N'
   and TL.STATUS_LIQ = 'A'
   and tg.num_guia is null
   --and SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1) = 'CLN'
   and trunc(TL.FECHA_INGRESO) = TRUNC(SYSDATE-1)
,   --and tl.no_liquidacion in ( 47666,  47667,47668,47669)  --PARA PROCESAR POR NÚMERO DE LIQUIDACIÓN
   and 1=1)  --PARA PROCESAR POR NÚMERO DE LIQUIDACIÓN
   and 1=1;
   
   --query select directo a trafico guia zam  
WITH
TL AS (SELECT FECHA_LIQUIDACION ,NO_LIQUIDACION ,ROWID ,MONTO_GASTOS ,FECHA_INGRESO
FROM ZAM_TRAFICO_LIQUIDACION WHERE 
--no_liquidacion in ( 47666,  47667,47668,47669) and --busqueda por numero de liquidacion
TRUNC(FECHA_INGRESO) = TRUNC(SYSDATE-1) AND
--trunc(FECHA_INGRESO) = to_date('06/03/2019','DD/MM/RRRR') and  --busqueda por fecha de liquidacion 
REPLICADO_AR = 'N' AND 
STATUS_LIQ = 'A')
,LQ AS (SELECT VL.NO_LIQUIDACION ,VL.NO_VIAJE ,ID_PERSONAL_NOMBRE FROM ZAM_TRAFICO_VIAJE_LIQ VL , TL WHERE VL.NO_LIQUIDACION = TL.NO_LIQUIDACION )
,GU AS (SELECT "no_viaje" ,"num_guia" ,"no_guia" FROM TRAFICO_GUIA@HSMSSQLDLV.ESTRELLAROJA.COM.MX G,LQ WHERE G."no_viaje" = LQ.NO_VIAJE )
SELECT DISTINCT
DN.UNIDAD_NEGOCIO
,'LIQUIDACION' TIPO_DOC
,'PROPIO' TIPO_MOVIMIENTO
,DN.RFC RFC_DLIVER
,'CONTINGENTE' NOMBRE
,'CONTINGENTE' RFC
,SUBSTR(TG.NUM_GUIA,1,INSTR(TG.NUM_GUIA,'-')-1) DESC_PLAZA
,SUBSTR(TG.NUM_GUIA,1,INSTR(TG.NUM_GUIA,'-')-1)||'LIQ-'||TL.NO_LIQUIDACION NUMERO_DOCUMENTO
,TL.FECHA_LIQUIDACION FECHA_INGRESO
,SUBSTR(TG.NUM_GUIA,1,INSTR(TG.NUM_GUIA,'-')-1)||'LIQ-'||TL.NO_LIQUIDACION REF_APLICACION
,TL.NO_LIQUIDACION ID_MOVIMIENTO
,'' NO_GUIA
,TL.ROWID
,'SIN ASIGNAR' DESTINO_SERVICIO
,'CRE' FORMA_PAGO
,'NUM LIQUIDACION:'||TL.NO_LIQUIDACION LINEA_PAGO
,'N/A' UNIDAD_MEDIDA
,TL.MONTO_GASTOS SUBTOTAL
,'AP_IVA16' AR_IVA_EXENTO
,TL.MONTO_GASTOS TOTAL
,TL.FECHA_INGRESO CREATION_DATE
,TG.ID_PERSONAL_NOMBRE PERSONAL_NOMBRE
FROM XXER_DATOS_NEGOCIO_TBL DN, TL
,(SELECT L.NO_LIQUIDACION , LISTAGG(NVL(G."num_guia",G2."num_guia"),'|') WITHIN GROUP (ORDER BY G."no_guia") NUM_GUIA ,L.ID_PERSONAL_NOMBRE
FROM LQ L
LEFT JOIN GU G ON L.NO_VIAJE = G."no_viaje" AND SUBSTR(G."num_guia",1,INSTR(G."num_guia",'-')-1) <> 'VCD'
LEFT JOIN GU G2 ON L.NO_VIAJE = G2."no_viaje" AND SUBSTR(G2."num_guia",1,INSTR(G2."num_guia",'-')-1) = 'VCD'
GROUP BY L.NO_LIQUIDACION ,L.ID_PERSONAL_NOMBRE) TG
WHERE 1=1
AND DN.UNIDAD_NEGOCIO = 'DLIVER'
AND TL.NO_LIQUIDACION = TG.NO_LIQUIDACION
AND TG.NUM_GUIA IS NOT NULL;

--query select directo a trafico guia zam  
WITH
TL AS (SELECT FECHA_LIQUIDACION ,NO_LIQUIDACION ,ROWID ,MONTO_GASTOS ,FECHA_INGRESO
FROM ZAMTRA_TRAFICO_LIQUIDACION WHERE 
--no_liquidacion in ( 332,334,330,327) and --busqueda por numero de liquidacion
TRUNC(FECHA_INGRESO) = TRUNC(SYSDATE-1) AND 
--trunc(FECHA_INGRESO) = to_date('06/03/2019','DD/MM/RRRR') and  --busqueda por fecha de liquidacion
REPLICADO_AR = 'N' AND 
STATUS_LIQ = 'A')
,LQ AS (SELECT VL.NO_LIQUIDACION ,VL.NO_VIAJE ,ID_PERSONAL_NOMBRE FROM ZAMTRA_TRAFICO_VIAJE_LIQ VL , TL WHERE VL.NO_LIQUIDACION = TL.NO_LIQUIDACION )
,GU AS (SELECT "no_viaje" ,"num_guia" ,"no_guia" FROM TRAFICO_GUIA@HSMSSQLTRA.ESTRELLAROJA.COM.MX G,LQ WHERE G."no_viaje" = LQ.NO_VIAJE )
SELECT DISTINCT
DN.UNIDAD_NEGOCIO
,'LIQUIDACION' TIPO_DOC
,'PROPIO' TIPO_MOVIMIENTO
,DN.RFC RFC_DLIVER
,'CONTINGENTE' NOMBRE
,'CONTINGENTE' RFC
,SUBSTR(TG.NUM_GUIA,1,INSTR(TG.NUM_GUIA,'-')-1) DESC_PLAZA
,SUBSTR(TG.NUM_GUIA,1,INSTR(TG.NUM_GUIA,'-')-1)||'LIQ-'||TL.NO_LIQUIDACION NUMERO_DOCUMENTO
,TL.FECHA_LIQUIDACION FECHA_INGRESO
,SUBSTR(TG.NUM_GUIA,1,INSTR(TG.NUM_GUIA,'-')-1)||'LIQ-'||TL.NO_LIQUIDACION REF_APLICACION
,TL.NO_LIQUIDACION ID_MOVIMIENTO
,'' NO_GUIA
,TL.ROWID
,'SIN ASIGNAR' DESTINO_SERVICIO
,'CRE' FORMA_PAGO
,'NUM LIQUIDACION:'||TL.NO_LIQUIDACION LINEA_PAGO
,'N/A' UNIDAD_MEDIDA
,TL.MONTO_GASTOS SUBTOTAL
,'AP_IVA16' AR_IVA_EXENTO
,TL.MONTO_GASTOS TOTAL
,TL.FECHA_INGRESO CREATION_DATE
,TG.ID_PERSONAL_NOMBRE PERSONAL_NOMBRE
FROM XXER_DATOS_NEGOCIO_TBL DN, TL
,(SELECT L.NO_LIQUIDACION , LISTAGG(NVL(G."num_guia",G2."num_guia"),'|') WITHIN GROUP (ORDER BY G."no_guia") NUM_GUIA ,L.ID_PERSONAL_NOMBRE
FROM LQ L
LEFT JOIN GU G ON L.NO_VIAJE = G."no_viaje" AND SUBSTR(G."num_guia",1,INSTR(G."num_guia",'-')-1) <> 'VCT'
LEFT JOIN GU G2 ON L.NO_VIAJE = G2."no_viaje" AND SUBSTR(G2."num_guia",1,INSTR(G2."num_guia",'-')-1) = 'VCT'
GROUP BY L.NO_LIQUIDACION ,L.ID_PERSONAL_NOMBRE) TG
WHERE 1=1
AND DN.UNIDAD_NEGOCIO = 'TRATECSA'
AND TL.NO_LIQUIDACION = TG.NO_LIQUIDACION
AND TG.NUM_GUIA IS NOT NULL;