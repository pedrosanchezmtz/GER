SET serveroutput ON
declare
  v_count number;
  v_schema varchar(50);
begin 
v_count:= 0;
v_schema:='PREPCONTROL';

DBMS_OUTPUT.PUT_LINE('Eliminando la tabla ER_CTRL_API_TBL y trigger AUDIT_TRIGGER_ER_CTRL_API_TBL');
  select count(1) into v_count from user_tables where table_name='ER_CTRL_API_TBL';
  if v_count>0 then 
   execute immediate 'DROP TABLE  "'||v_schema||'"."ER_CTRL_API_TBL"  CASCADE CONSTRAINTS';
  else
DBMS_OUTPUT.PUT_LINE('La tabla ER_CTRL_API_TBL y trigger AUDIT_TRIGGER_ER_CTRL_API_TBL no Existen');
  end if;
  v_count:= 0;
  DBMS_OUTPUT.PUT_LINE('Eliminando sequence ER_CTRL_API_SEQ');
  select count(1) into v_count from all_sequences where sequence_name='ER_CTRL_API_SEQ';
  if v_count> 0 then 
   execute immediate 'DROP SEQUENCE "'||v_schema||'"."ER_CTRL_API_SEQ"';
  commit;
  else
  DBMS_OUTPUT.PUT_LINE('La tabla ER_CTRL_API_TBL y trigger AUDIT_TRIGGER_ER_CTRL_API_TBL no Existen');
  end if;
end;
/
