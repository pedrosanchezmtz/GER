--------------------------------------------------------
-- Archivo creado  - martes-febrero-13-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table XXER_EAM_ORIGIN_PRIORITY_TBL
--------------------------------------------------------

  CREATE TABLE "PXERINTUSER"."XXER_EAM_ORIGIN_PRIORITY_TBL" 
   (	"ID" NUMBER, 
	"ORIGIN" VARCHAR2(20 BYTE), 
	"PRIORITY" NUMBER, 
	"ASSET_NUMBER" VARCHAR2(60 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "XERINTUSER_TBS" ;
