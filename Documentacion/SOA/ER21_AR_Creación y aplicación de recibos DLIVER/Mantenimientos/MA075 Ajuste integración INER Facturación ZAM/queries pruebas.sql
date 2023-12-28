delete from xxer_ar_receipt_apply_tbl where tabla_puente_id in(50939,50943);
delete from xxer_ar_receipt_tbl where tabla_puente_id in(50939,50943);
update  INER_XXER_PUENTE_HEADER_TBL set estatus = null where tabla_puente_id in(50939,50943);
commit;



INSERT INTO XERINTUSER.INER_XXER_PUENTE_HEADER_TBL
          (select * from PXERINTUSER.INER_XXER_PUENTE_HEADER_TBL where NUMERO_DOCUMENTO in (select
TG.NUM_GUIA from PXERINTUSER.ZAM_TRAFICO_RENGLON_MOVIMIENTO rm ,PXERINTUSER.ZAM_TRAFICO_GUIA tg
where RM.NO_GUIA = TG.NO_GUIA
and RM.ID_DEPOSITO = 3595));
          
           COMMIT;	
INSERT INTO XERINTUSER.INER_XXER_PUENTE_LINES_TBL
          (select * from PXERINTUSER.INER_XXER_PUENTE_LINES_TBL WHERE TABLA_PUENTE_ID in (select TABLA_PUENTE_ID from PXERINTUSER.INER_XXER_PUENTE_HEADER_TBL where NUMERO_DOCUMENTO in (select
TG.NUM_GUIA from PXERINTUSER.ZAM_TRAFICO_RENGLON_MOVIMIENTO rm ,PXERINTUSER.ZAM_TRAFICO_GUIA tg
where RM.NO_GUIA = TG.NO_GUIA
and RM.ID_DEPOSITO = 3595)));
          
           COMMIT;	

INSERT INTO INER_XXER_PUENTE_AUX_TBL
          (select * from PXERINTUSER.INER_XXER_PUENTE_AUX_TBL WHERE TABLA_PUENTE_HEADER_ID in (select TABLA_PUENTE_ID from PXERINTUSER.INER_XXER_PUENTE_HEADER_TBL where NUMERO_DOCUMENTO in (select
TG.NUM_GUIA from PXERINTUSER.ZAM_TRAFICO_RENGLON_MOVIMIENTO rm ,PXERINTUSER.ZAM_TRAFICO_GUIA tg
where RM.NO_GUIA = TG.NO_GUIA
and RM.ID_DEPOSITO = 3595)));
          
           COMMIT;
		   
update  INER_XXER_PUENTE_HEADER_TBL set estatus = null where tabla_puente_id in(select TABLA_PUENTE_ID from PXERINTUSER.INER_XXER_PUENTE_HEADER_TBL where NUMERO_DOCUMENTO in (select
TG.NUM_GUIA from PXERINTUSER.ZAM_TRAFICO_RENGLON_MOVIMIENTO rm ,PXERINTUSER.ZAM_TRAFICO_GUIA tg
where RM.NO_GUIA = TG.NO_GUIA
and RM.ID_DEPOSITO = 3583));


select
TG.NUM_GUIA as factura,
RM.MONTO as monto,
HED.numero_documento,
hed.creation_date
--SUM(RM."monto") as monto
from PXERINTUSER.ZAM_TRAFICO_RENGLON_MOVIMIENTO rm ,PXERINTUSER.ZAM_TRAFICO_GUIA tg
left join XERINTUSER.iner_xxer_puente_header_tbl HED ON HED.numero_documento = TG.num_guia
where RM.NO_GUIA = TG.NO_GUIA
--AND HED.numero_documento IS NULL
and RM.ID_DEPOSITO = 3595

select
TG."num_guia" as factura,
RM."monto" as monto,
HED.numero_documento,
hed.creation_date
--SUM(RM."monto") as monto
from xer_trafico_renglon_mov_v@HSMSSQLDLV.ESTRELLAROJA.COM.MX rm ,TRAFICO_GUIA@HSMSSQLDLV.ESTRELLAROJA.COM.MX tg
left join XERINTUSER.iner_xxer_puente_header_tbl HED ON HED.numero_documento = TG."num_guia"
where RM."no_guia" = TG."no_guia"
AND HED.numero_documento IS NULL
and RM."id_deposito" =  3583


----query de comprativa de montos a aplicar y monto disponibles facturas

with 
	hd as (select h.numero_documento ,sum(l.total)as total,	h.fecha_movimiento
	from iner_xxer_puente_header_tbl h
	LEFT JOIN  INER_XXER_PUENTE_LINES_TBL l
		on      h.tabla_puente_id=l.tabla_puente_id
	group by h.numero_documento,
	h.fecha_movimiento)
select
TG."num_guia" as factura,
RM."monto" as monto,
numero_documento,
total
--SUM(RM."monto") as monto
from xer_trafico_renglon_mov_v@HSMSSQLDLV.ESTRELLAROJA.COM.MX rm ,TRAFICO_GUIA@HSMSSQLDLV.ESTRELLAROJA.COM.MX tg
left join hd ON numero_documento = TG."num_guia"
where RM."no_guia" = TG."no_guia"
AND total != RM."monto"
and RM."id_deposito" =  3583