--------------------------------------------------------
-- Archivo creado  - martes-marzo-05-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure ACTUA_VENDIDO_PXERINT_OCI
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PXERINTUSER"."ACTUA_VENDIDO_PXERINT_OCI" IS
   
   

   COUNTER5        NUMBER ;
   COUNTER6        NUMBER ;
   COUNTER7        NUMBER ;
   COUNTER8        NUMBER ;
   COUNTER9        NUMBER ;
   COUNTER10       NUMBER ;
   
   

BEGIN






COUNTER5:=0;
COUNTER6:=0;
COUNTER7:=0;
COUNTER8:=0;
COUNTER9:=0;
COUNTER10:=0;

COMMIT;

           
/************************************************************************************************************************/
/****************************** PASO 1 Y 2 LO VENDIDO *******************************************************************/


/*
  
insert into XXER_TBL_PUENTE_AUXILIAR_2(
 select a1.TABLA_PUENTE_AUXILIAR_ID,
        h1.TABLA_PUENTE_ID,
        a1.FOLIO_FACTURA_FISCAL,
        a1.RFC,
        a1.UUID,
        a1.SERIE,
        sum(a1.SUBTOTAL) SUBTOTAL,
        sum(a1.TOTAL-a1.SUBTOTAL) IVA,
        sum(a1.IVA_RETENIDO) IVA_RETENIDO,
        sum(a1.RET_5MILLAR) RET_5MILLAR,
        sum(a1.DESCUENTO) DESCUENTO,
        sum(a1.TOTAL) TOTAL,
        a1.FOLIO_FACTURA_AR,
        a1.ADICIONAL1,
        a1.ADICIONAL2,
        a1.ADICIONAL3,
        a1.ADICIONAL4,
        a1.ADICIONAL5,
        a1.ADICIONAL6,
        a1.ADICIONAL7,
        a1.ADICIONAL8,
        a1.ADICIONAL9,
        a1.ADICIONAL10,
        a1.CREADO_POR,
        trunc(a1.FECHA_CREACION) FECHA_CREACION,
        a1.ULTIMA_ACTUALIZACION_POR,
        trunc(a1.ULTIMA_FECHA_ACTUALIZACION) ULTIMA_FECHA_ACTUALIZACION
  from XXER.XXER_TBL_PUENTE_AUXILIAR a1
      ,XXER.XXER_TBL_PUENTE_HEADER h1 
      ,XXER.XXER_TBL_PUENTE_LINES l1
where a1.tabla_puente_linea_id = l1.tabla_puente_linea_id
  and l1.tabla_puente_id = h1.tabla_puente_id
  AND H1.SISTEMA_ORIGEN != 'DLIVER'
  and trunc(h1.FECHA_MOVIMIENTO)= TRUNC(SYSDATE-2)
  AND h1.tabla_puente_id not in (
              select h1.tabla_puente_id
              from XXER.XXER_TBL_PUENTE_AUXILIAR_2 a2
                   ,XXER.XXER_TBL_PUENTE_HEADER h1 
              where a2.tabla_puente_header_id = h1.tabla_puente_id
              AND TRUNC(h1.FECHA_MOVIMIENTO)= TRUNC(SYSDATE-2))  
group by a1.TABLA_PUENTE_AUXILIAR_ID,
        h1.TABLA_PUENTE_ID,
        a1.FOLIO_FACTURA_FISCAL,
        a1.RFC,
        a1.UUID,
        a1.SERIE,
        a1.FOLIO_FACTURA_AR,
        a1.ADICIONAL1,
        a1.ADICIONAL2,
        a1.ADICIONAL3,
        a1.ADICIONAL4,
        a1.ADICIONAL5,
        a1.ADICIONAL6,
        a1.ADICIONAL7,
        a1.ADICIONAL8,
        a1.ADICIONAL9,
        a1.ADICIONAL10,
        a1.CREADO_POR,
        trunc(a1.FECHA_CREACION),
        a1.ULTIMA_ACTUALIZACION_POR,
        trunc(a1.ULTIMA_FECHA_ACTUALIZACION)
        );


COMMIT;

*/


          SELECT COUNT(*) INTO COUNTER9
          FROM XXER.XXER_TBL_PUENTE_AUXILIAR_2@SUMASII_LINK.ESTRELLAROJA.COM.MX A2,
          XXER.XXER_TBL_PUENTE_HEADER@SUMASII_LINK.ESTRELLAROJA.COM.MX H1 
          WHERE A2.TABLA_PUENTE_HEADER_ID = H1.TABLA_PUENTE_ID
          AND TRUNC(H1.FECHA_MOVIMIENTO) = TRUNC(SYSDATE-2)
          AND H1.SISTEMA_ORIGEN != 'DLIVER';

          SELECT COUNT(*) INTO COUNTER10
          FROM PXERINTUSER.XXER_TBL_PUENTE_AUXILIAR_2 A2,
          PXERINTUSER.XXER_TBL_PUENTE_HEADER H1 
          WHERE A2.TABLA_PUENTE_HEADER_ID = H1.TABLA_PUENTE_ID
          AND TRUNC(H1.FECHA_MOVIMIENTO) = TRUNC(SYSDATE-2)
          AND H1.SISTEMA_ORIGEN != 'DLIVER';

          COMMIT;

           IF COUNTER9 > COUNTER10 THEN
           
          INSERT INTO PXERINTUSER.XXER_TBL_PUENTE_AUXILIAR_2
          (SELECT A2.* 
          FROM XXER.XXER_TBL_PUENTE_AUXILIAR_2@SUMASII_LINK.ESTRELLAROJA.COM.MX A2,
          XXER.XXER_TBL_PUENTE_HEADER@SUMASII_LINK.ESTRELLAROJA.COM.MX H1 
          WHERE A2.TABLA_PUENTE_HEADER_ID = H1.TABLA_PUENTE_ID
          AND TRUNC(H1.FECHA_MOVIMIENTO)= TRUNC(SYSDATE-2)
          AND A2.tabla_puente_header_id not in (
              select A2.tabla_puente_header_id
              from PXERINTUSER.XXER_TBL_PUENTE_AUXILIAR_2 a2
                   ,XXER_TBL_PUENTE_HEADER h1 
              where A2.tabla_puente_header_id = h1.tabla_puente_id
              AND TRUNC(h1.FECHA_MOVIMIENTO)= TRUNC(SYSDATE-2)
              AND H1.SISTEMA_ORIGEN != 'DLIVER')
          );
          
          END IF;
           
           COMMIT;
           
           
           
           
           
/************************************************************************************************************************/


/*********************** PASO 3 ********************************************************************************************/


           SELECT COUNT(*) INTO COUNTER7
           FROM XXER.XXER_TBL_PUENTE_LINES@SUMASII_LINK.ESTRELLAROJA.COM.MX L1,
           XXER.XXER_TBL_PUENTE_HEADER@SUMASII_LINK.ESTRELLAROJA.COM.MX H1 
           WHERE L1.TABLA_PUENTE_ID = H1.TABLA_PUENTE_ID
           AND TRUNC(H1.FECHA_MOVIMIENTO)= TRUNC(SYSDATE-2)
           AND H1.SISTEMA_ORIGEN != 'DLIVER';   

           SELECT COUNT(*) INTO COUNTER8
           FROM PXERINTUSER.XXER_TBL_PUENTE_LINES L1,
           PXERINTUSER.XXER_TBL_PUENTE_HEADER H1 
           WHERE L1.TABLA_PUENTE_ID = H1.TABLA_PUENTE_ID
           AND TRUNC(H1.FECHA_MOVIMIENTO)= TRUNC(SYSDATE-2)
           AND H1.SISTEMA_ORIGEN != 'DLIVER';

           COMMIT;

           IF COUNTER7 > COUNTER8 THEN
           
             INSERT INTO PXERINTUSER.XXER_TBL_PUENTE_LINES 
             (
             SELECT L1.* 
             FROM XXER.XXER_TBL_PUENTE_LINES@SUMASII_LINK.ESTRELLAROJA.COM.MX L1,
             XXER.XXER_TBL_PUENTE_HEADER@SUMASII_LINK.ESTRELLAROJA.COM.MX H1 
             WHERE L1.TABLA_PUENTE_ID = H1.TABLA_PUENTE_ID
             AND TRUNC(H1.FECHA_MOVIMIENTO) = TRUNC(SYSDATE-2)
             AND H1.SISTEMA_ORIGEN != 'DLIVER'
             );
           
           COMMIT;
           
           END IF;
           
           
           
/************************************************************************************************************************/


/********************** PASO 4 **************************************************************************************************/



           SELECT COUNT(*) INTO COUNTER5
           FROM XXER.XXER_TBL_PUENTE_HEADER@SUMASII_LINK.ESTRELLAROJA.COM.MX H1 
           WHERE TRUNC(H1.FECHA_MOVIMIENTO) = TRUNC(SYSDATE-2)
           AND H1.SISTEMA_ORIGEN != 'DLIVER';

           SELECT COUNT(*) INTO COUNTER6
           FROM PXERINTUSER.XXER_TBL_PUENTE_HEADER H1 
           WHERE TRUNC(H1.FECHA_MOVIMIENTO) = TRUNC(SYSDATE-2)
           AND H1.SISTEMA_ORIGEN != 'DLIVER';

           COMMIT;

           IF COUNTER5 > COUNTER6 THEN
           
           /* Modificacion por la venta cruzada JRM 12032020
           INSERT INTO PXERINTUSER.XXER_TBL_PUENTE_HEADER@ERSEPDB1.SNPRODUCCIN.VCNER.ORACLEVCN.COM 
           (
           SELECT H1.* 
           FROM XXER.XXER_TBL_PUENTE_HEADER H1 
           WHERE TRUNC(H1.FECHA_MOVIMIENTO)  = TRUNC(SYSDATE-2)
           AND H1.SISTEMA_ORIGEN != 'DLIVER'
           );
           */
           
           INSERT INTO PXERINTUSER.XXER_TBL_PUENTE_HEADER (TABLA_PUENTE_ID,SISTEMA_ORIGEN,TIPO_DOCUMENTO,TIPO_MOVIMIENTO,UNIDAD_NEGOCIO_ORIGEN,NOMBRE_FISCAL_ORIGEN,EMPRESA_ORIGEN,RFC_ORIGEN,UNIDAD_NEGOCIO_DESTINO,NOMBRE_FISCAL_DESTINO,EMPRESA_DESTINO,RFC_DESTINO,SUCURSAL_VENTA,NUMERO_DOCUMENTO,FECHA_MOVIMIENTO,REFERENCIA_APLICACION,CREATION_DATE,CREATED_BY,LAST_UPDATE_DATE,LAST_UPDATED_BY,LAST_UPDATE_LOGIN)   
           (
           SELECT H1.TABLA_PUENTE_ID,H1.SISTEMA_ORIGEN,H1.TIPO_DOCUMENTO,H1.TIPO_MOVIMIENTO,H1.UNIDAD_NEGOCIO_ORIGEN,H1.NOMBRE_FISCAL_ORIGEN,H1.EMPRESA_ORIGEN,H1.RFC_ORIGEN,H1.UNIDAD_NEGOCIO_DESTINO,H1.NOMBRE_FISCAL_DESTINO,H1.EMPRESA_DESTINO,H1.RFC_DESTINO,H1.SUCURSAL_VENTA,H1.NUMERO_DOCUMENTO,H1.FECHA_MOVIMIENTO,
                   H1.REFERENCIA_APLICACION,H1.CREATION_DATE,H1.CREATED_BY,H1.LAST_UPDATE_DATE,H1.LAST_UPDATED_BY,H1.LAST_UPDATE_LOGIN   
           FROM XXER.XXER_TBL_PUENTE_HEADER@SUMASII_LINK.ESTRELLAROJA.COM.MX H1 
           WHERE TRUNC(H1.FECHA_MOVIMIENTO)  = TRUNC(SYSDATE-2)
           AND H1.SISTEMA_ORIGEN != 'DLIVER'
           );

           
           COMMIT;
           
           END IF;
           
           
           
/************************************************************************************************************************/
   COMMIT;
   
   
END ACTUA_VENDIDO_PXERINT_OCI;

/
