ora_integracion	ZKU8v2fY%?_b+X};
---consultamos el numero que debemos colocar en la secuencia
select ("PXERINTUSER".xxer_invoice_batch_id_seq.nextval - "XERINTUSER".xxer_invoice_batch_id_seq.nextval)  from dual;
--lo colocamos en la sigiente consulta
alter sequence "XERINTUSER".xxer_invoice_batch_id_seq increment by 6532;
--Actualizar estatus para repocesar transacciones. 
UPDATE xxer_tbl_puente_header set estatus=null , detalle_error=null where trunc(fecha_movimiento)=TO_DATE('05/03/24','DD/MM/RR');

commit;