select (
(case when nullable='N' then ' @NotNull '||chr(10) else null end) 
|| ' @Column(name = "'||COLUMN_NAME||'") '||chr(10)
|| ' private '||(case when data_type='VARCHAR2' then 'String ' 
                      when data_type='DATE' then 'Date ' 
                      when data_type='NUMBER' then 'BigInteger '
                      when data_type='BLOB' then 'Clob ' 
                      else '' end)
||substr(lower(COLUMN_NAME),1,1)||substr(replace(initcap(COLUMN_NAME),'_'),2)||';' )

from ALL_TAB_COLUMNS    where table_name ='TMS_PRODUCTOS_ER_TBL' and owner='PCENTRAL' ;