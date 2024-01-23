create or replace PACKAGE XXER_UTILITIES_PKG AS 

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

/*Procedimiento usado consultar relaciones de CFDIS de ingreso y cartas porte.*/                               
 PROCEDURE GET_RELATIONS_CFDIS(P_TRANSACTION  IN  VARCHAR2,
                                   P_RELATIONS_CFDIS OUT XXER_RELATIONS_CFDIS_TTYPE,
                                   P_ERROR       OUT NUMBER,
                                   P_ERROR_DESC  OUT VARCHAR2); 

END XXER_UTILITIES_PKG;