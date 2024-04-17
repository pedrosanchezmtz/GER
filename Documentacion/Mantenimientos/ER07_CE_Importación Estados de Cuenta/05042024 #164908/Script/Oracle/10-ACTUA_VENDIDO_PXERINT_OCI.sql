create or replace PROCEDURE ACTUA_VENDIDO_PXERINT_OCI IS

   COUNTER1        NUMBER ;
   COUNTER2        NUMBER ;
   COUNTER3        NUMBER ;
 
BEGIN

COUNTER1:=0;
COUNTER2:=0;
COUNTER3:=0;

COMMIT;

/************************************************************************************************************************/
/****************************** PASO 1 XXER_TBL_PUENTE_AUXILIAR *******************************************************************/
		  
		  SELECT COUNT(*) INTO COUNTER1
          FROM XXER.XXER_TBL_PUENTE_AUXILIAR@SUMASII_LINK.ESTRELLAROJA.COM.MX A1,
          XXER.XXER_TBL_PUENTE_HEADER@SUMASII_LINK.ESTRELLAROJA.COM.MX H1,
          XXER.XXER_TBL_PUENTE_LINES@SUMASII_LINK.ESTRELLAROJA.COM.MX L1
          WHERE L1.TABLA_PUENTE_ID = H1.TABLA_PUENTE_ID
          AND TRUNC(H1.FECHA_MOVIMIENTO)= TRUNC(SYSDATE-2)
          AND A1.TABLA_PUENTE_LINEA_ID = L1.TABLA_PUENTE_LINEA_ID
          AND A1.TABLA_PUENTE_AUXILIAR_ID not in (
              select A1.TABLA_PUENTE_AUXILIAR_ID
              from XXER_TBL_PUENTE_AUXILIAR A1);

          COMMIT;

           IF COUNTER1 > 0 THEN
           
          INSERT INTO XXER_TBL_PUENTE_AUXILIAR
          (
		  SELECT A1.* 
          FROM XXER.XXER_TBL_PUENTE_AUXILIAR@SUMASII_LINK.ESTRELLAROJA.COM.MX A1,
          XXER.XXER_TBL_PUENTE_HEADER@SUMASII_LINK.ESTRELLAROJA.COM.MX H1,
          XXER.XXER_TBL_PUENTE_LINES@SUMASII_LINK.ESTRELLAROJA.COM.MX L1
          WHERE L1.TABLA_PUENTE_ID = H1.TABLA_PUENTE_ID
          AND TRUNC(H1.FECHA_MOVIMIENTO)= TRUNC(SYSDATE-2)
          AND A1.TABLA_PUENTE_LINEA_ID = L1.TABLA_PUENTE_LINEA_ID
          AND A1.TABLA_PUENTE_AUXILIAR_ID not in (
              select A1.TABLA_PUENTE_AUXILIAR_ID
              from XXER_TBL_PUENTE_AUXILIAR A1)
          );
          
          END IF;
           
           COMMIT;                                 	           
           
/************************************************************************************************************************/
/*********************** PASO 2 XXER_TBL_PUENTE_LINES *******************************************************************/


           SELECT COUNT(*) INTO COUNTER2
           FROM XXER.XXER_TBL_PUENTE_LINES@SUMASII_LINK.ESTRELLAROJA.COM.MX L1,
             XXER.XXER_TBL_PUENTE_HEADER@SUMASII_LINK.ESTRELLAROJA.COM.MX H1 
             WHERE L1.TABLA_PUENTE_ID = H1.TABLA_PUENTE_ID
             AND TRUNC(H1.FECHA_MOVIMIENTO) = TRUNC(SYSDATE-2)
             AND L1.TABLA_PUENTE_LINEA_ID not in (
              select L1.TABLA_PUENTE_LINEA_ID
              from XXER_TBL_PUENTE_LINES L1);   

           COMMIT;

           IF COUNTER2 > 0 THEN
           
             INSERT INTO XXER_TBL_PUENTE_LINES 
             (
             SELECT L1.* 
             FROM XXER.XXER_TBL_PUENTE_LINES@SUMASII_LINK.ESTRELLAROJA.COM.MX L1,
             XXER.XXER_TBL_PUENTE_HEADER@SUMASII_LINK.ESTRELLAROJA.COM.MX H1 
             WHERE L1.TABLA_PUENTE_ID = H1.TABLA_PUENTE_ID
             AND TRUNC(H1.FECHA_MOVIMIENTO) = TRUNC(SYSDATE-2)
             AND L1.TABLA_PUENTE_LINEA_ID not in (
              select L1.TABLA_PUENTE_LINEA_ID
              from XXER_TBL_PUENTE_LINES L1)
             );
           
           COMMIT;
           
           END IF;
                              
/************************************************************************************************************************/
/********************** PASO 3 XXER_TBL_PUENTE_HEADER *******************************************************************/

           SELECT COUNT(*) INTO COUNTER3  
           FROM XXER.XXER_TBL_PUENTE_HEADER@SUMASII_LINK.ESTRELLAROJA.COM.MX H1 
           WHERE TRUNC(H1.FECHA_MOVIMIENTO)  = TRUNC(SYSDATE-2)
           AND H1.TABLA_PUENTE_ID not in (
              select H1.TABLA_PUENTE_ID
              from XXER_TBL_PUENTE_HEADER H1);

           COMMIT;

           IF COUNTER3 > 0 THEN
                      
           INSERT INTO XXER_TBL_PUENTE_HEADER (TABLA_PUENTE_ID,SISTEMA_ORIGEN,TIPO_DOCUMENTO,TIPO_MOVIMIENTO,UNIDAD_NEGOCIO_ORIGEN,NOMBRE_FISCAL_ORIGEN,EMPRESA_ORIGEN,RFC_ORIGEN,UNIDAD_NEGOCIO_DESTINO,NOMBRE_FISCAL_DESTINO,EMPRESA_DESTINO,RFC_DESTINO,SUCURSAL_VENTA,NUMERO_DOCUMENTO,FECHA_MOVIMIENTO,REFERENCIA_APLICACION,CREATION_DATE,CREATED_BY,LAST_UPDATE_DATE,LAST_UPDATED_BY,LAST_UPDATE_LOGIN)   
           (
           SELECT H1.TABLA_PUENTE_ID,H1.SISTEMA_ORIGEN,H1.TIPO_DOCUMENTO,H1.TIPO_MOVIMIENTO,H1.UNIDAD_NEGOCIO_ORIGEN,H1.NOMBRE_FISCAL_ORIGEN,H1.EMPRESA_ORIGEN,H1.RFC_ORIGEN,H1.UNIDAD_NEGOCIO_DESTINO,H1.NOMBRE_FISCAL_DESTINO,H1.EMPRESA_DESTINO,H1.RFC_DESTINO,H1.SUCURSAL_VENTA,H1.NUMERO_DOCUMENTO,H1.FECHA_MOVIMIENTO,
                   H1.REFERENCIA_APLICACION,H1.CREATION_DATE,H1.CREATED_BY,H1.LAST_UPDATE_DATE,H1.LAST_UPDATED_BY,H1.LAST_UPDATE_LOGIN   
           FROM XXER.XXER_TBL_PUENTE_HEADER@SUMASII_LINK.ESTRELLAROJA.COM.MX H1 
           WHERE TRUNC(H1.FECHA_MOVIMIENTO)  = TRUNC(SYSDATE-2)
           AND H1.TABLA_PUENTE_ID not in (
              select H1.TABLA_PUENTE_ID
              from XXER_TBL_PUENTE_HEADER H1)		   
           );
          
           COMMIT;
           
           END IF;
                              
/************************************************************************************************************************/
   COMMIT;
   
END ACTUA_VENDIDO_PXERINT_OCI;
/