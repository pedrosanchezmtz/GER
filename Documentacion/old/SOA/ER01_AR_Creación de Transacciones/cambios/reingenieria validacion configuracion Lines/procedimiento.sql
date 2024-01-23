PROCEDURE VALIDATION_LINES_INVOICE_CONFIG (
        p_validation_inv_lines     OUT XXER_AR_VALIDATION_INVOICE_TTYPE,
        p_error        OUT NUMBER,
        p_error_desc   OUT VARCHAR2
    ) AS
        
        
        
        col_val_lines_invoice XXER_AR_VALIDATION_INVOICE_TTYPE:=XXER_AR_VALIDATION_INVOICE_TTYPE();
        v_error_msg        VARCHAR2(300) := NULL;
        v_error_location   VARCHAR2(255);
        v_details_error    VARCHAR2(300);
        v_commit          NUMBER := 0;--contador para hacer commit
        
        
        CURSOR cur_all_invoicesLines_not_conf IS WITH
TXN AS (SELECT 
        H.NUMERO_DOCUMENTO,
        H.TABLA_PUENTE_ID, 
        TRUNC(H.FECHA_MOVIMIENTO) FECHA_MOVIMIENTO , 
        H.NOMBRE_FISCAL_ORIGEN , 
        H.SISTEMA_ORIGEN , 
        H.TIPO_DOCUMENTO , 
        H.TIPO_MOVIMIENTO , 
        H.SUCURSAL_VENTA , 
        L.ORIGEN_SERVICIO, 
        L.total, 
        L.DESTINO_SERVICIO , 
        L.no_linea, L.SERVICIO , 
        L.CONCEPTO_MODALIDAD , 
        L.FORMA_PAGO , 
        H.RFC_ORIGEN , 
        H.ADICIONAL1 , H.ADICIONAL3 , H.ADICIONAL4 , H.ADICIONAL5 , H.ADICIONAL6, H.ADICIONAL7 , H.ADICIONAL8 , H.ADICIONAL9 , H.ADICIONAL10
		FROM 
        XXER_TBL_PUENTE_HEADER H, 
        XXER_TBL_PUENTE_LINES L 
        WHERE  
        H.TABLA_PUENTE_ID = L.TABLA_PUENTE_ID 
        AND H.SISTEMA_ORIGEN NOT IN ('EAM', 'INV', 'PORTAL')
        AND H.TIPO_DOCUMENTO NOT IN ('RECIBO', 'REVERSO RECIBO') 
        AND ESTATUS IS NULL 
         AND TRUNC(H.FECHA_MOVIMIENTO) >= TO_DATE('13/05/2021','DD/MM/RRRR') 
        --and H.NUMERO_DOCUMENTO ='310720TLAEFEF'
        ) 
,CNF AS (SELECT * FROM XXER_CNF_INTERFASE_INGRESOS_AR)
SELECT
	CNF.ID_INTERFAZ
    ,TXN.no_linea
    ,TXN.total
    ,TXN.TABLA_PUENTE_ID
    ,TXN.NUMERO_DOCUMENTO
    ,TXN.FECHA_MOVIMIENTO
	,TXN.NOMBRE_FISCAL_ORIGEN
	,TXN.SISTEMA_ORIGEN
	,TXN.TIPO_DOCUMENTO
	,TXN.TIPO_MOVIMIENTO
	,TXN.SUCURSAL_VENTA
	,TXN.ORIGEN_SERVICIO
	,TXN.DESTINO_SERVICIO
	,TXN.SERVICIO
	,TXN.CONCEPTO_MODALIDAD
	,TXN.FORMA_PAGO
FROM TXN
    LEFT JOIN CNF ON NVL (TXN.SISTEMA_ORIGEN, 1) = NVL (CNF.SISTEMA_ORIGEN, 1)
         AND NVL (TXN.TIPO_DOCUMENTO, 1) = NVL (CNF.TIPO_DOCUMENTO, 1)
         AND NVL (TXN.TIPO_MOVIMIENTO, 1) = NVL (CNF.TIPO_MOVIMIENTO, 1)
         AND NVL (TXN.RFC_ORIGEN, 1) = DECODE (NVL (CNF.SISTEMA_ORIGEN, 1),'NOMINA', NVL (TXN.RFC_ORIGEN, 1),NVL (CNF.RFC_ORIGEN, 1))
         AND NVL (TXN.SUCURSAL_VENTA, 1) = DECODE (NVL (CNF.SUCURSAL_VENTA, 1),'TODOS', NVL (TXN.SUCURSAL_VENTA, 1),NVL (CNF.SUCURSAL_VENTA, 1))
         AND NVL (TXN.ORIGEN_SERVICIO, 1) = DECODE (NVL (CNF.ORIGEN_SERVICIO, 1),'TODOS', NVL (TXN.ORIGEN_SERVICIO, 1),NVL (CNF.ORIGEN_SERVICIO, 1))
         AND NVL (TXN.DESTINO_SERVICIO, 1) = DECODE (NVL (CNF.DESTINO_SERVICIO, 1),'TODOS', NVL (TXN.DESTINO_SERVICIO, 1),NVL (CNF.DESTINO_SERVICIO, 1))
         AND NVL (TXN.SERVICIO, 1) = DECODE (NVL (CNF.SERVICIO, 1),'TODOS', NVL (TXN.SERVICIO, 1),NVL (CNF.SERVICIO, 1))
         AND NVL (TXN.CONCEPTO_MODALIDAD, 1) = NVL (CNF.CONCEPTO_MODALIDAD, 1) 
         AND NVL (TXN.FORMA_PAGO, 1) = DECODE (NVL (CNF.FORMA_PAGO, 1),'TODOS', NVL (TXN.FORMA_PAGO, 1),NVL (CNF.FORMA_PAGO, 1))
         AND NVL (TXN.ADICIONAL1, 1) = NVL (CNF.ADICIONAL1, 1)
         AND NVL (TXN.ADICIONAL3, 1) = NVL (CNF.ADICIONAL3, 1)
         AND NVL (TXN.ADICIONAL4, 1) = NVL (CNF.ADICIONAL4, 1)
         AND NVL (TXN.ADICIONAL5, 1) = NVL (CNF.ADICIONAL5, 1)
         AND NVL (TXN.ADICIONAL6, 1) = NVL (CNF.ADICIONAL6, 1)
         AND NVL (TXN.ADICIONAL7, 1) = NVL (CNF.ADICIONAL7, 1)
         AND NVL (TXN.ADICIONAL8, 1) = NVL (CNF.ADICIONAL8, 1)
         AND NVL (TXN.ADICIONAL9, 1) = NVL (CNF.ADICIONAL9, 1)
         AND NVL (TXN.ADICIONAL10, 1) = NVL (CNF.ADICIONAL10, 1)       
         WHERE 
         CNF.ID_INTERFAZ IS NULL
;

    BEGIN

        FOR rec IN cur_all_invoicesLines_not_conf LOOP      
        --consultamos si ya tenemos el estatus 
            select detalle_error into v_details_error from xxer_tbl_puente_header where tabla_puente_id = rec.tabla_puente_id;
            IF(SUBSTR(v_details_error,1,24) ='Linea sin configuracion:')
            THEN
                v_error_location := 'Error to update status de Error Validacion';
   				  /*Se evalua si ya registramos la linea en la salida y actualizamos*/

               IF ( col_val_lines_invoice.count > 0 )
               THEN
                    FOR i IN 1..col_val_lines_invoice.count LOOP
				
				     --si ya existe el Recibo actualizamos el valor detalles error para no duplicar
				       IF(col_val_lines_invoice(i).INVOICE_NUMBER = rec.NUMERO_DOCUMENTO)
                            THEN
                                v_error_location := 'Error to set derived values from (previuous variables)';

                                col_val_lines_invoice(i).DETAILS_ERROR := v_details_error||','||rec.no_linea;
                                
				       END IF;              
               END LOOP;
            END IF;			
/*Se actualizan los registros de la tabla header de las lineas que no tienen configuracion*/
   
                UPDATE xxer_tbl_puente_header
                SET
                    estatus = 'E'
                   ,detalle_error = v_details_error||','||rec.no_linea
                WHERE  tabla_puente_id = rec.tabla_puente_id
                    AND numero_documento = rec.NUMERO_DOCUMENTO;
                        
            else 
            v_error_location := 'Error to update status de Error Validacion';
            col_val_lines_invoice.extend;
            
            col_val_lines_invoice(col_val_lines_invoice.count):=XXER_AR_VALIDATION_INVOICE_TYPE(rec.NUMERO_DOCUMENTO,rec.total,'Linea sin configuracion: '||rec.no_linea);

                UPDATE xxer_tbl_puente_header
                SET
                    estatus = 'E'
                   ,detalle_error = 'Linea sin configuracion: '||rec.no_linea
                WHERE  tabla_puente_id = rec.tabla_puente_id
                    AND numero_documento = rec.NUMERO_DOCUMENTO;        
                    
         
            END IF;
            v_commit:=v_commit+1;
        END LOOP;
        
IF (v_commit<0)
THEN
          v_error_location := 'Error to apply COMMIT';
        COMMIT;/*Se confirma la actualización de los datos*/
        END IF;
		p_validation_inv_lines:=col_val_lines_invoice;

        
    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_AR_UTILITIES_PKG.VALIDATION_LINES_INVOICE_CONFIG-'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);
                                     

    END VALIDATION_LINES_INVOICE_CONFIG;
	
	 /**
 * Procedimiento utilizado para cambiar el estado de las facturas a "P" para
 * indicar que serán los datos que estan en proceso
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error 
 */
 PROCEDURE VALIDATION_LINES_INVOICE_CONFIG(
                                       P_DOC_TYPE IN VARCHAR2,
                                       P_ERROR       OUT NUMBER,
                                       P_ERROR_DESC  OUT VARCHAR2); 

create or replace TYPE XXER_AR_VALIDATION_INVOICE_TTYPE 
AS TABLE OF XXER_AR_VALIDATION_INVOICE_TYPE;	

create or replace TYPE XXER_AR_VALIDATION_INVOICE_TYPE AS OBJECT 
(
       INVOICE_NUMBER     VARCHAR2 (50 CHAR) ,
       AMOUNT             NUMBER   (18) ,
       DETAILS_ERROR      VARCHAR2 (250 CHAR)
 );							   