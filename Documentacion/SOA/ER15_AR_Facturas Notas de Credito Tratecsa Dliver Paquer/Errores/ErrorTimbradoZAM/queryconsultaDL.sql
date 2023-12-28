WITH DAT AS (
    SELECT TO_CHAR(REGEXP_SUBSTR('VERP-23151,VERP-23621,VERP-23552,VERP-23557,VER-35792,VER-35800,VERP-27605,VER-37057,VERP-30338,VERP-30336,VERP-30343,VERP-30184,VERP-30342,VERP-30739'||',', '[^,]+', 1, LEVEL, 'i')) DATOS FROM DUAL
    
    CONNECT BY LEVEL <= REGEXP_COUNT('VERP-23151,VERP-23621,VERP-23552,VERP-23557,VER-35792,VER-35800,VERP-27605,VER-37057,VERP-30338,VERP-30336,VERP-30343,VERP-30184,VERP-30342,VERP-30739', ',', 1)+1 AND PRIOR DBMS_RANDOM.VALUE != 1
    )--SELECT DATOS FROM DAT where rownum=0
SELECT
    fac."no_guia" as "No Guia",
    replace(fac."num_guia", '700000', 'DL') as "Numero Factura Guia",
	fac."status_guia" as "Estatus Guia",
	fac."subtotal" as "Subtotal Guia",
    to_char(fac."fecha_ingreso", 'DD/MM/YYYY') as "Fecha Guia",
	fac."tipo_cobro" as "Tipo Cobro Guia" ,
	tfe."num_guia" "Numero Factura Timbrado",
    tfe."status" as  "Estatus Timbrado",
	tfe."status_cancel" as  "Estatus Cancelacion Timbrado",
	tfe."uuid" as "UUID Timbrado",
	tfe."fecha_timbrado"as "Fecha Timbrado",
    tp.numero_documento as "Numero Factura Apolo",
	tp.estatus as "Estatus Apolo",
    'DLIVER' as "Sucursal",
    cli."nombre" as "Nombre Cliente",
    cli."rfc"as "RFC Cliente"
    
FROM
trafico_cliente@hsmssqldlv.estrellaroja.com.mx cli
	inner join trafico_guia@hsmssqldlv.estrellaroja.com.mx fac
    on  fac."id_cliente" = cli."id_cliente"
    left join trafico_factura_electronica@hsmssqldlv.estrellaroja.com.mx tfe
    on fac."no_guia" = tfe."no_guia" AND fac."num_guia" = tfe."num_guia"
    left join iner_xxer_puente_header_tbl tp
    on fac."num_guia" = tp.numero_documento,
     DAT dat1
WHERE
fac."num_guia" in (NVL2('VERP-23151,VERP-23621,VERP-23552,VERP-23557,VER-35792,VER-35800,VERP-27605,VER-37057,VERP-30338,VERP-30336,VERP-30343,VERP-30184,VERP-30342,VERP-30739',dat1.DATOS,NVL2(null,fac."num_guia",'')))
    AND fac."id_area_facturacion" IN ( '1', '0' )
    AND fac."no_viaje" = '0'
    AND fac."tipo_doc" = '1'
    --AND fac."status_guia" = 'C'
    --AND tfe."status" = '2'
    --AND fac."no_guia" = tfe."no_guia"
    AND to_DATE(fac."fecha_ingreso", 'RRRR/MM/DD') >= 
	to_DATE(NVL2(null,null,NVL2('VERP-23151,VERP-23621,VERP-23552,VERP-23557,VER-35792,VER-35800,VERP-27605,VER-37057,VERP-30338,VERP-30336,VERP-30343,VERP-30184,VERP-30342,VERP-30739',fac."fecha_ingreso",'')), 'RRRR/MM/DD') 
    --AND fac."num_guia" = tfe."num_guia"
   -- AND NOT EXISTS ( SELECT 1 FROM iner_xxer_puente_header_tbl tp WHERE tp.numero_documento = tfe."num_guia" )
    --AND NOT EXISTS ( SELECT  1 FROM trafico_factura_electronica@hsmssqldlv.estrellaroja.com.mx tfe2  WHERE tfe2."num_guia" = tfe."num_guia" AND tfe2."status_cancel" = 5  )
	;