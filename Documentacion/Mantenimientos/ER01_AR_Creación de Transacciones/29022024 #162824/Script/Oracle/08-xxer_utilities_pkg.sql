--------------------------------------------------------
-- Archivo creado  - martes-marzo-05-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package XXER_UTILITIES_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PXERINTUSER"."XXER_UTILITIES_PKG" AS 

  V_ERROR_LOCATION VARCHAR2(500)  := NULL;
  V_ERROR_MSG      VARCHAR2(3200) := NULL;

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
 PROCEDURE GET_INFORMATION_RECEIPT_INVOICE(P_INFORMATION IN XXER_AR_RECEIPT_INVOICE_TTYPE,
                                           P_MODULE      IN VARCHAR2,
                                           /*P_ORG         IN XXER_AR_RECEIPT_INVOICE_ORG_TTYPE DEFAULT NULL,*/
                                           P_RECEIPT     OUT XXER_AR_RECEIPT_TTYPE,
                                           P_INVOICE     OUT XXER_AR_GET_INV_TB_TYP,
                                           P_ERROR       OUT NUMBER,
                                           P_ERROR_DESC  OUT VARCHAR2);

 /**
 * Procedimiento utilizado para obtener los receipt
 *
 * @param P_INFORMATION Información requerida para el procesamiento
 * @param P_RECEIPT regresa un tipo de Receipt
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */                                           
 PROCEDURE GET_RECEIPT(P_INFORMATION IN XXER_AR_RECEIPT_INVOICE_TTYPE,
                       /*P_ORG         IN XXER_AR_RECEIPT_INVOICE_ORG_TTYPE DEFAULT NULL,*/
                       P_RECEIPT     OUT XXER_AR_RECEIPT_TTYPE,
                       P_ERROR       OUT NUMBER,
                       P_ERROR_DESC  OUT VARCHAR2);                                           

 /**
 * Procedimiento utilizado para llevar el registro de los Recibos Procesados
 *
 * @param P_REG_RECEIPT Información procesada de crear recibos
 * @param P_REG_APPLY_RECEIPT regresa un tipo de Receipt para ser aplicados
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */                                           
 PROCEDURE PROCESSED_RECEIPT(P_REG_RECEIPT       IN XXER_AR_PROC_REC_TTYPE,
                             P_REG_APPLY_RECEIPT OUT XXER_AR_APPLY_RECEIPT_TTYPE,
                             P_ERROR       OUT NUMBER,
                             P_ERROR_DESC  OUT VARCHAR2);

 /**
 * Procedimiento utilizado para llevar el registro de los Recibos Aplicados Procesados
 *
 * @param P_REG_APPLY_RECEIPT Información procesada de aplicar recibos
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */                                           
 PROCEDURE PROCESSED_APPLY_RECEIPT(P_REG_APPLY_RECEIPT IN XXER_AR_PROC_APP_REC_TTYPE,
                             P_ERROR       OUT NUMBER,
                             P_ERROR_DESC  OUT VARCHAR2);                              


 /**
 * Procedimiento utilizado para obtener facturas
 *
 * @param P_INFORMATION Información de data model requerida para el procesamiento
 * @param P_INVOICES regresa objeto TYPE de facturas
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */
 PROCEDURE GET_INVOICES(P_INFORMATION IN XXER_AR_RECEIPT_INVOICE_TTYPE,
                       P_DOC_TYPE IN VARCHAR2,
                       P_INVOICES     OUT XXER_AR_GET_INV_TB_TYP,
                       P_ERROR       OUT NUMBER,
                       P_ERROR_DESC  OUT VARCHAR2);

/**
 * Funcion utilizado para obtener pólizas viajado gl y actulizar batch
 *
 * @param P_SOURCE Información de source para la consulta
 * @param P_STATUS Información del estatus para la consulta
 * @param P_BATCH_ID Información del batch para la consulta
 * @param P_JOURNALS regresa objeto TYPE de pólizas
 */

 FUNCTION MERGE_JOURNALS_TMS(P_SOURCE IN VARCHAR2,
                       P_STATUS IN VARCHAR2,
                       P_BATCH_ID IN VARCHAR2
                     ) RETURN XXER_GL_INTERFACE_TYPE_T;

/**
 * Procedire utilizado para actulizar batch de gl
 *
 * @param P_SOURCE Información de source para la consulta
 * @param P_STATUS Información del estatus para la consulta
 * @param P_BATCH_ID Información del batch para la consulta
 * @param P_JOURNALS regresa objeto TYPE de pólizas
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */

 PROCEDURE UPDATE_JOURNALS_TMS(P_SOURCE IN VARCHAR2,
                       P_STATUS IN VARCHAR2,
                       P_BATCH_ID IN VARCHAR2,
                       P_ERROR       OUT NUMBER,
                       P_ERROR_DESC  OUT VARCHAR2);                                           

 /**
 * Procedimiento utilizado para cambiar el estado de las facturas a "P" para
 * indicar que serán los datos que estan en proceso
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error 
 */
 PROCEDURE PREPARE_PROCESS_LOAD_INVOICES(
                                       P_DOC_TYPE IN VARCHAR2,
                                       P_ERROR       OUT NUMBER,
                                       P_ERROR_DESC  OUT VARCHAR2);
	 /**
 * Procedimiento validar que todas las lineas tengan config
 * indicar que serán los datos que estan en proceso
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error 
 */
 PROCEDURE VALIDATION_LINES_INVOICE_CONFIG(
                                       p_validation_inv_lines     OUT XXER_AR_VALIDATION_INVOICE_TTYPE,
                                       P_ERROR       OUT NUMBER,
                                       P_ERROR_DESC  OUT VARCHAR2); 
  /**
 * Procedimiento usado para procesar los resultados de carga de facturas
 * y devolver el detalle numero de facturas cargadas, el número de fallos y el total de 
 * registros procesados, tambien traera los mensages de error que se hayan tenido
 */
 PROCEDURE GET_RESULT_OF_LOAD_INVOICES(P_INVOICE_LOAD_STATUS  XXER_INVOICE_LOAD_STATUS_TTYPE,
                                       P_TOTAL_SUCCESSFUL OUT NUMBER,
                                       P_TOTAL_ERRORS     OUT NUMBER,
                                       P_TOTAL_PROCESSED  OUT NUMBER,
                                       P_ERROR_MESSAGES_INV OUT XXER_ERROR_MESSAGES_INV_TTYPE,
                                       P_ERROR      OUT NUMBER,
                                       P_ERROR_DESC OUT VARCHAR2);  

 /*
 * Procedimiento usado para actualizar el status de las facturas
 * en las tablas custom, tomando como base el parametro de tipo XXER_INVOICE_LOAD_STATUS_TTYPE
 * que contiene el transaction_number y el batch_id.
 */                                       
PROCEDURE UPDATE_STATUS_INVOICES(P_LOAD_RESULTS IN XXER_AR_PARAMS_UPD_INV_TTYPE,
                                 P_ERROR       OUT NUMBER,
                                 P_ERROR_DESC  OUT VARCHAR2); 

  /*Procedimiento usado para recuperar el organization_id tomando como base base al TRX_NUMBER
    se traera el organization_id solo de aquellos registros de entrada que esten con estado LOADED
    se omitiran los que esten en error.*/                               
 PROCEDURE GET_COMPLEMENT_TO_UPD_UUID(P_INVOICES_TO_UPDATE IN XXER_INVOICES_TO_UPDATE_TTYPE,
                                   P_COMPLEMENT_UPD_UUID_ID OUT XXER_COMPLEMENT_UPD_UUID_TTYPE,
                                   P_ERROR       OUT NUMBER,
                                   P_ERROR_DESC  OUT VARCHAR2);
/*Procedimiento usado consultar relaciones de CFDIS de ingreso y cartas porte.*/                               
 PROCEDURE GET_RELATIONS_CFDIS(P_TRANSACTION  IN  VARCHAR2,
                                   P_RELATIONS_CFDIS OUT XXER_RELATIONS_CFDIS_TTYPE,
                                   P_ERROR       OUT NUMBER,
                                   P_ERROR_DESC  OUT VARCHAR2); 
PROCEDURE XER_MAPEO_CC_PRC2;
END XXER_UTILITIES_PKG;

/
