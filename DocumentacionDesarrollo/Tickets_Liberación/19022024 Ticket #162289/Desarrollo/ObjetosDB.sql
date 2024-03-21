SET serveroutput ON
declare
  v_count number;
  v_schema varchar(50);
begin 
v_count:= 0;
v_schema:='PREPCONTROL';

DBMS_OUTPUT.PUT_LINE('Creando la tabla ER_CTRL_API_TBL');
  select count(1) into v_count from user_tables where table_name='ER_CTRL_API_TBL';
  if v_count= 0 then 
   execute immediate 'CREATE TABLE "'||v_schema||'"."ER_CTRL_API_TBL" 
   ("ID" NUMBER, 
   "TRANSACTION_NUMBER" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"API" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"DESCRIPCION" VARCHAR2(500 BYTE), 
	"ESTATUS" VARCHAR2(100 BYTE), 
    "FECHA_CREACION" DATE , 
	"ULTIMA_FECHA_ACTUALIZACION" DATE , 
	 CONSTRAINT "ER_CTRL_API_TBL_PK" PRIMARY KEY ("TRANSACTION_NUMBER", "API"))
  TABLESPACE "REPCONTROL_DATA_TBS" ';
  else
  DBMS_OUTPUT.PUT_LINE('La tabla ya existe');
  end if;
  v_count:= 0;
  DBMS_OUTPUT.PUT_LINE('Creando sequence ER_CTRL_API_SEQ');
  select count(1) into v_count from all_sequences where sequence_name='ER_CTRL_API_SEQ';
  if v_count= 0 then 
   execute immediate 'CREATE SEQUENCE  "'||v_schema||'"."ER_CTRL_API_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE';
  commit;
  else
  DBMS_OUTPUT.PUT_LINE('La sequence ya existe');
  end if;
   v_count:= 0;
  DBMS_OUTPUT.PUT_LINE('Creando trigger AUDIT_TRIGGER_ER_CTRL_API_TBL');
  select count(1) into v_count from ALL_TRIGGERS  where trigger_name='AUDIT_TRIGGER_ER_CTRL_API_TBL';
  if v_count= 0 then 
   execute immediate 'CREATE OR REPLACE  TRIGGER "'||v_schema||'"."AUDIT_TRIGGER_ER_CTRL_API_TBL" BEFORE INSERT OR UPDATE
  ON "'||v_schema||'"."ER_CTRL_API_TBL" FOR EACH ROW
  DECLARE
BEGIN
  IF INSERTING THEN
  IF :new.ID is NULL THEN
  :new.ID :="'||v_schema||'"."ER_CTRL_API_SEQ".nextval;
  END IF;
  :new."FECHA_CREACION":=sysdate;
  ELSIF UPDATING THEN
  :new."ULTIMA_FECHA_ACTUALIZACION":=sysdate;
  END IF;
END;';
  commit;
  else
  DBMS_OUTPUT.PUT_LINE('El Trigger ya existe');
  end if;
end;
/
