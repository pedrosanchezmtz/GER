--------------------------------------------------------
-- Archivo creado  - jueves-marzo-07-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table XXER_TBL_PUENTE_LINES
--------------------------------------------------------

  CREATE TABLE "XXER_TBL_PUENTE_LINES" 
   (	"TABLA_PUENTE_LINEA_ID" NUMBER, 
	"TABLA_PUENTE_ID" NUMBER, 
	"ORIGEN_SERVICIO" VARCHAR2(240 BYTE), 
	"DESTINO_SERVICIO" VARCHAR2(240 BYTE), 
	"SERVICIO" VARCHAR2(240 BYTE), 
	"CONCEPTO_MODALIDAD" VARCHAR2(240 BYTE), 
	"FORMA_PAGO" VARCHAR2(15 BYTE), 
	"CANTIDAD" NUMBER, 
	"NO_LINEA" NUMBER, 
	"LINEA_ARTICULO" VARCHAR2(100 BYTE), 
	"UNIDAD_MEDIDA" VARCHAR2(25 BYTE), 
	"REFERENCIA_APLICACION" VARCHAR2(150 BYTE), 
	"SUBTOTAL" NUMBER, 
	"CODIGO_IVA" VARCHAR2(25 BYTE), 
	"TASA_IVA" NUMBER, 
	"MONTO_IVA" NUMBER, 
	"CODIGO_RETENCION_IVA" VARCHAR2(25 BYTE), 
	"TASA_RET_IVA" NUMBER, 
	"MONTO_RET_IVA" NUMBER, 
	"CODIGO_RETENCION_ISR" VARCHAR2(25 BYTE), 
	"TASA_RET_ISR" NUMBER, 
	"MONTO_RET_ISR" NUMBER, 
	"TOTAL" NUMBER, 
	"CREATION_DATE" DATE, 
	"CREATED_BY" NUMBER, 
	"LAST_UPDATE_DATE" DATE, 
	"LAST_UPDATED_BY" NUMBER, 
	"LAST_UPDATE_LOGIN" NUMBER
   );
--------------------------------------------------------
--  Constraints for Table XXER_TBL_PUENTE_LINES
--------------------------------------------------------

  ALTER TABLE "XXER_TBL_PUENTE_LINES" MODIFY ("TABLA_PUENTE_LINEA_ID" NOT NULL ENABLE);
  ALTER TABLE "XXER_TBL_PUENTE_LINES" MODIFY ("TABLA_PUENTE_ID" NOT NULL ENABLE);
