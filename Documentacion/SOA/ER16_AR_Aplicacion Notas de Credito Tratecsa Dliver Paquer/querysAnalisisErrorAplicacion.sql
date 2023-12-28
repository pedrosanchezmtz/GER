
select h.fecha_movimiento,h.estatus,h.numero_documento,h.tipo_documento,h.* 
from iner_xxer_puente_header_tbl h where 
numero_documento in ('1500073244','VER-23582','VER-23583','VER-23584')

select h.fecha_movimiento,h.estatus,h.numero_documento,h.tipo_documento,h.* from iner_xxer_puente_header_tbl h
where numero_documento in ('PAGO ELECT','VER-23502') 
and fecha_movimiento in('20/04/21','19/03/21')


select h.fecha_movimiento,h.estatus,h.numero_documento,h.tipo_documento,h.*
from iner_xxer_puente_header_tbl h where 
numero_documento in ('NC-361','TT-4207')

select * 
from iner_xxer_puente_lines_tbl
where 
tabla_puente_id in (select h.tabla_puente_id 
from iner_xxer_puente_header_tbl h where 
numero_documento in ('NC-361','TT-4207'))

select * 
from iner_xxer_puente_aux_tbl
where 
tabla_puente_header_id in (select h.tabla_puente_id 
from iner_xxer_puente_header_tbl h where 
numero_documento in ('NC-361','TT-4207'))

UPDATE  INER_XXER_PUENTE_HEADER_TBL  SET estatus='S' , detalle_error= null where numero_documento IN ('TT-4207');
commit