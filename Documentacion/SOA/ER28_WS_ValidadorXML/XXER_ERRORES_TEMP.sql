  CREATE TABLE "XXER_ERRORES_TEMP_TBL" 
   ("ID" NUMBER GENERATED BY DEFAULT AS IDENTITY ( START WITH 1 NOCACHE ORDER ) NOT NULL ENABLE, 
    "INTEGRACION"           VARCHAR2(50 BYTE),
    "ACTION"                VARCHAR2(50 BYTE),
    "NAME"             VARCHAR2(2000 BYTE),
    "TYPE"         VARCHAR2(150 BYTE),
    "VERSION"          VARCHAR2(50 BYTE),
    "MESSAGE"  VARCHAR2(3000 BYTE),
    "PARAMETER1"            VARCHAR2(3000 BYTE),
    "PARAMETER2"            VARCHAR2(3000 BYTE),
    "PARAMETER3"            VARCHAR2(3000 BYTE),
    "PARAMETER4"            VARCHAR2(3000 BYTE),
    "PARAMETER5"            VARCHAR2(3000 BYTE),
        "PARAMETER6"            VARCHAR2(3000 BYTE),
    "PARAMETER7"            VARCHAR2(3000 BYTE),
    "PARAMETER8"            VARCHAR2(3000 BYTE),
    "PARAMETER9"            VARCHAR2(3000 BYTE),
    "PARAMETER10"            VARCHAR2(3000 BYTE),
        "PARAMETER11"            VARCHAR2(3000 BYTE),
    "PARAMETER12"            VARCHAR2(3000 BYTE),
    "PARAMETER13"            VARCHAR2(3000 BYTE),
    "PARAMETER14"            VARCHAR2(3000 BYTE),
    "PARAMETER15"            VARCHAR2(3000 BYTE),
        "PARAMETER16"            VARCHAR2(3000 BYTE),
    "PARAMETER17"            VARCHAR2(3000 BYTE),
    "PARAMETER18"            VARCHAR2(3000 BYTE),
    "PARAMETER19"            VARCHAR2(3000 BYTE),
    "PARAMETER20"            VARCHAR2(3000 BYTE),
    "CREATION_DATE"         DATE,
    "CREATED_BY"            VARCHAR2(150 BYTE),
    "LAST_UPDATE_DATE"      DATE,
    "LAST_UPDATED_BY"       VARCHAR2(150 BYTE), 
	 
   CONSTRAINT "XXER_ERRORES_TEMP_TBL_PK" PRIMARY KEY ("ID")
   ) ;
      COMMENT ON COLUMN "XXER_ERRORES_TEMP_TBL"."ID" IS 'id generado del registro';


  CREATE OR REPLACE EDITIONABLE TRIGGER "AUDIT_TRIGGER_ERRORES_TEMP_TBL" BEFORE INSERT OR UPDATE
  ON XXER_ERRORES_TEMP_TBL FOR EACH ROW
  DECLARE
  v_user varchar(50):=null;
BEGIN
if (NVL(APEX_UTIL.GET_CURRENT_USER_ID,0)=0)
  then
     v_user:=SYS_CONTEXT('USERENV', 'HOST', 30);
  else
    v_user:=APEX_UTIL.GET_USERNAME(APEX_UTIL.GET_CURRENT_USER_ID);
  end if; 
  IF INSERTING THEN
  :new.CREATION_DATE:=sysdate;
   :new.CREATED_BY:=v_user;
  ELSIF UPDATING THEN
  :new.LAST_UPDATE_DATE:=sysdate;
   :new.LAST_UPDATED_BY:=v_user; 
  END IF;
END;

DROP TABLE  "XXER_ERRORES_TEMP_TBL"  CASCADE CONSTRAINTS;   


SELECT * FROM wwv_flow_group_users wf
 where USER_ID =APEX_UTIL.GET_CURRENT_USER_ID 
and GROUP_NAME in ('CNF_INTEGRACIONES','ADMIN')