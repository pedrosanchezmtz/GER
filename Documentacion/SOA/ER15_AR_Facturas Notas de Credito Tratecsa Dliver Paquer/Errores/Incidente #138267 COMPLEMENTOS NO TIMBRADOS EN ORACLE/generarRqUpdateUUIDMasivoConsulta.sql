select 
'<ns1:UpdateUuidRq xmlns:ns1="http://soa.estrellaroja.com.mx/InvoicesBiz">' from dual;
select
'	<ns1:ListUpdateUuidRq>
		<ns1:Document xmlns:ns2="http://soa.estrellaroja.com.mx/InvoicesBiz/ERPIntegrationServiceTec">
			<ns2:Content xmlns:ns3="http://www.w3.org/2001/XMLSchema-instance" ns3:nil="true"/>
			<ns2:FileName/>
		</ns1:Document>
		<ns1:OperationMode>single</ns1:OperationMode>
		<ns1:Object xmlns:ns2="http://soa.estrellaroja.com.mx/InvoicesBiz/ERPIntegrationServiceTec">
			<ns2:EntityName>Receivables Invoice</ns2:EntityName>
			<ns2:ContextValue>Contabilidad Electronica (MX)</ns2:ContextValue>
			<ns2:UserKeyA>'||tp.numero_documento||'</ns2:UserKeyA>
			<ns2:UserKeyB>#NULL</ns2:UserKeyB>
			<ns2:UserKeyC>#NULL</ns2:UserKeyC>
			<ns2:UserKeyD>#NULL</ns2:UserKeyD>
			<ns2:UserKeyE>#NULL</ns2:UserKeyE>
			<ns2:DFFAttributes>{"ATTRIBUTE3":"'||tpa.uuid||'","ATTRIBUTE5":"'||SUBSTR(tp.numero_documento,INSTR(tp.numero_documento, '-')+1)||'"}</ns2:DFFAttributes>
		</ns1:Object>
		<ns1:NotificationCode>10</ns1:NotificationCode>
		<ns1:CallbackUrl/>
	</ns1:ListUpdateUuidRq>
	<ns1:ListUpdateUuidRq>
		<ns1:Document xmlns:ns2="http://soa.estrellaroja.com.mx/InvoicesBiz/ERPIntegrationServiceTec">
			<ns2:Content xmlns:ns3="http://www.w3.org/2001/XMLSchema-instance" ns3:nil="true"/>
			<ns2:FileName/>
		</ns1:Document>
		<ns1:OperationMode>single</ns1:OperationMode>
		<ns1:Object xmlns:ns2="http://soa.estrellaroja.com.mx/InvoicesBiz/ERPIntegrationServiceTec">
			<ns2:EntityName>Receivables Invoice</ns2:EntityName>
			<ns2:ContextValue>JLxMXReceivablesInformation</ns2:ContextValue>
			<ns2:UserKeyA>'||tp.numero_documento||'</ns2:UserKeyA>
			<ns2:UserKeyB>#NULL</ns2:UserKeyB>
			<ns2:UserKeyC>#NULL</ns2:UserKeyC>
			<ns2:UserKeyD>#NULL</ns2:UserKeyD>
			<ns2:UserKeyE>#NULL</ns2:UserKeyE>
			<ns2:DFFAttributes>{"GLOBAL_ATTRIBUTE1":"'||tpa.uuid||'"}</ns2:DFFAttributes>
		</ns1:Object>
		<ns1:NotificationCode>10</ns1:NotificationCode>
		<ns1:CallbackUrl/>
	</ns1:ListUpdateUuidRq>' as spoolname 
from iner_xxer_puente_header_tbl tp
inner join 
iner_xxer_puente_aux_tbl tpa
on tp.tabla_puente_id=tpa.tabla_puente_header_id
where 1=1
and numero_documento in ('VER27739','VER27740','VER27743','VER27745','VER27746','VER27747','VER-61604','VER-61296','VER-60775','VER-60774')
and tipo_documento='FACTURA';
--and trunc(last_update_date)='28/12/22';
select 
'</ns1:UpdateUuidRq>' from dual;