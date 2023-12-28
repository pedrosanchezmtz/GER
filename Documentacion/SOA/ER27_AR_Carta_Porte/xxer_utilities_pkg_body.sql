create or replace PACKAGE BODY            xxer_utilities_pkg AS
 
 /**
 * Procedimiento utilizado para el procesamiento de Receipt y de Invoice
 *
 * @param P_INFORMATION Información requerida para el procesamiento
 * @param P_MODULE R para Receipt e I para Invoice
 * @param P_RECEIPT regresa un tipo de Receipt
 * @param P_INVOICE regresa un tipo de Invoice
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */
    
    PROCEDURE get_relations_cfdis (P_TRANSACTION  IN  VARCHAR2,
                                   P_RELATIONS_CFDIS OUT XXER_RELATIONS_CFDIS_TTYPE,
                                   P_ERROR       OUT NUMBER,
                                   P_ERROR_DESC  OUT VARCHAR2) AS
       
	   V_XXER_RELATIONS_CFDIS   XXER_RELATIONS_CFDIS_TTYPE := XXER_RELATIONS_CFDIS_TTYPE ();
	   
CURSOR CUR_RELATIONS_CFDIs IS
SELECT
    descripcion,
    vt_monto,
    sucursal_id,
    importe,
    iva,
    importe_iva,
    importe_retencion,
    numero_producto,
    referencia_producto,
    unidad_medida,
    numero_documento,
    total_factura,
    uuid,
    NULL  estatus,
    xml_pdf_ingreso,
    url_pdf_ingreso,
    fecha_factura_ingreso,
    uuid_cartaporte,
    NULL  estatus_cp,
    xml_pdf_cartaporte,
    url_pdf_cartaporte,
    fecha_timbrado_trasalado,
    tipo_factura,
    venta_fecha_creacion
FROM PCENTRAL.FAC_INGRESO_CARTAP_TPAK_VEW@PCENTRAL_LINK.ESTRELLAROJA.COM.MX
WHERE 1=1
AND TRUNC(VENTA_FECHA_CREACION) > TO_DATE ('01/06/2021', 'DD/MM/YYYY')
AND NUMERO_DOCUMENTO=P_TRANSACTION
AND UNIDAD_MEDIDA in ('UNIDAD DE SERVICIO','UNIDAD')
;	
	   
    BEGIN
	
       FOR rec IN CUR_RELATIONS_CFDIs LOOP  
           V_XXER_RELATIONS_CFDIS.extend;
V_XXER_RELATIONS_CFDIS(V_XXER_RELATIONS_CFDIS.count) := 
		   XXER_RELATIONS_CFDIS_TYPE(
           rec.DESCRIPCION,
           rec.VT_MONTO,
           rec.SUCURSAL_ID,
           rec.IMPORTE,
           rec.IVA,
           rec.IMPORTE_IVA,
           rec.IMPORTE_RETENCION,
           rec.NUMERO_PRODUCTO,
           rec.REFERENCIA_PRODUCTO,
           rec.UNIDAD_MEDIDA,
		   rec.NUMERO_DOCUMENTO,
		   rec.TOTAL_FACTURA,
		   rec.UUID,
           rec.estatus,
		   rec.xml_pdf_ingreso,
		   rec.URL_PDF_INGRESO,
		   rec.FECHA_FACTURA_INGRESO,
		   rec.UUID_CARTAPORTE,
           rec.estatus_cp ,
		   rec.XML_PDF_CARTAPORTE,
		   rec.URL_PDF_CARTAPORTE,
		   rec.FECHA_TIMBRADO_TRASALADO,
           rec.TIPO_FACTURA ,
           rec.venta_fecha_creacion);
           --dbms_output.put_line('Guia: '||rec.NUMERO_PRODUCTO);

		 END LOOP;

		 P_RELATIONS_CFDIS := V_XXER_RELATIONS_CFDIS;

  
  
    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_UTILITIES_PKG.GET_RELATIONS_CFDIS'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);
END get_relations_cfdis;
  
END xxer_utilities_pkg;