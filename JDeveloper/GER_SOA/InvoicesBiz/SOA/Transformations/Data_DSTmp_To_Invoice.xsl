<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://soa.estrellaroja.com.mx/InvoicesBiz"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                exclude-result-prefixes=" oracle-xsl-mapper xsi xsd xsl ns0 socket dvm mhdr oraxsl oraext xp20 xref"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns1="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:ns2="http://soa.estrellaroja.com.mx/SOAUtilitiesTec"
                xmlns:client="http://soa.estrellaroja.com.mx/InvoicesBiz/bpelDigitalStamp"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns3="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec"
                xmlns:ns4="http://soa.estrellaroja.com.mx/DigitalStampGERTec"
                xmlns:ns5="http://soa.estrellaroja.com.mx/InvoicesBiz/ERPIntegrationServiceTec"
                xmlns:ns6="http://soa.estrellaroja.com.mx/InvoicesBiz/StampInvoice">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/bpelDigitalStamp.wsdl"/>
            <oracle-xsl-mapper:rootElement name="DATA_DS" namespace="http://soa.estrellaroja.com.mx/InvoicesBiz"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/bpelDigitalStamp.wsdl"/>
            <oracle-xsl-mapper:rootElement name="DATA_DS" namespace="http://soa.estrellaroja.com.mx/InvoicesBiz"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [TUE JAN 30 12:32:29 CST 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <ns0:DATA_DS>
         <xsl:for-each select="/ns0:DATA_DS/invoice">
            <ns0:invoice>
               <ns0:CUSTOMER_TRX_ID>
                  <xsl:value-of select="CUSTOMER_TRX_ID"/>
               </ns0:CUSTOMER_TRX_ID>
               <ns0:TRX_NUMBER>
                  <xsl:value-of select="TRX_NUMBER"/>
               </ns0:TRX_NUMBER>
               <ns0:TRANSACTION_SOURCE>
                  <xsl:value-of select="TRANSACTION_SOURCE"/>
               </ns0:TRANSACTION_SOURCE>
               <ns0:BUSINESS_UNIT>
                  <xsl:value-of select="BUSINESS_UNIT"/>
               </ns0:BUSINESS_UNIT>
               <ns0:retention_vat>
                  <xsl:value-of select="retention_vat"/>
               </ns0:retention_vat>
               <ns0:retention_rt>
                  <xsl:value-of select="retention_rt"/>
               </ns0:retention_rt>
               <ns0:subtotal>
                  <xsl:value-of select="subtotal"/>
               </ns0:subtotal>
               <ns0:total>
                  <xsl:value-of select="total"/>
               </ns0:total>
               <ns0:id_rfc>
                  <xsl:value-of select="id_rfc"/>
               </ns0:id_rfc>
               <ns0:certificate_number>
                  <xsl:value-of select="certificate_number"/>
               </ns0:certificate_number>
               <ns0:issuer_rfc>
                  <xsl:value-of select="issuer_rfc"/>
               </ns0:issuer_rfc>
               <ns0:issuer_name>
                  <xsl:value-of select="issuer_name"/>
               </ns0:issuer_name>
               <ns0:issuer_street>
                  <xsl:value-of select="issuer_street"/>
               </ns0:issuer_street>
               <ns0:issuer_ext_number>
                  <xsl:value-of select="issuer_ext_number"/>
               </ns0:issuer_ext_number>
               <ns0:issuer_int_number>
                  <xsl:value-of select="issuer_int_number"/>
               </ns0:issuer_int_number>
               <ns0:issuer_colony>
                  <xsl:value-of select="issuer_colony"/>
               </ns0:issuer_colony>
               <ns0:issuer_zip_code>
                  <xsl:value-of select="issuer_zip_code"/>
               </ns0:issuer_zip_code>
               <ns0:issuer_municipality>
                  <xsl:value-of select="issuer_municipality"/>
               </ns0:issuer_municipality>
               <ns0:issuer_state>
                  <xsl:value-of select="issuer_state"/>
               </ns0:issuer_state>
               <ns0:issuer_phone>
                  <xsl:value-of select="issuer_phone"/>
               </ns0:issuer_phone>
               <ns0:issuer_country>
                  <xsl:value-of select="issuer_country"/>
               </ns0:issuer_country>
               <ns0:invoice_date>
                  <xsl:value-of select="invoice_date"/>
               </ns0:invoice_date>
               <ns0:document_type>
                  <xsl:value-of select="document_type"/>
               </ns0:document_type>
               <ns0:additional_information>
                  <xsl:value-of select="additional_information"/>
               </ns0:additional_information>
               <ns0:cancellation_date>
                  <xsl:value-of select="cancellation_date"/>
               </ns0:cancellation_date>
               <ns0:total_words>
                  <xsl:value-of select="total_words"/>
               </ns0:total_words>
               <ns0:total_items>
                  <xsl:value-of select="total_items"/>
               </ns0:total_items>
               <ns0:local_retention_name>
                  <xsl:value-of select="local_retention_name"/>
               </ns0:local_retention_name>
               <ns0:local_retention_percentage>
                  <xsl:value-of select="local_retention_percentage"/>
               </ns0:local_retention_percentage>
               <ns0:local_retencion_amount>
                  <xsl:value-of select="local_retencion_amount"/>
               </ns0:local_retencion_amount>
               <ns0:local_retention_amount>
                  <xsl:value-of select="local_retention_amount"/>
               </ns0:local_retention_amount>
               <ns0:total_vat>
                  <xsl:value-of select="total_vat"/>
               </ns0:total_vat>
               <ns0:total_stps>
                  <xsl:value-of select="total_stps"/>
               </ns0:total_stps>
               <ns0:total_st>
                  <xsl:value-of select="total_st"/>
               </ns0:total_st>
               <ns0:total_tips>
                  <xsl:value-of select="total_tips"/>
               </ns0:total_tips>
               <ns0:serie>
                  <xsl:value-of select="serie"/>
               </ns0:serie>
               <ns0:branch_id>
                  <xsl:value-of select="branch_id"/>
               </ns0:branch_id>
               <ns0:branch_number>
                  <xsl:value-of select="branch_number"/>
               </ns0:branch_number>
               <ns0:branch_name>
                  <xsl:value-of select="branch_name"/>
               </ns0:branch_name>
               <ns0:branch_street>
                  <xsl:value-of select="branch_street"/>
               </ns0:branch_street>
               <ns0:branch_ext_number>
                  <xsl:value-of select="branch_ext_number"/>
               </ns0:branch_ext_number>
               <ns0:branch_int_number>
                  <xsl:value-of select="branch_int_number"/>
               </ns0:branch_int_number>
               <ns0:branch_colony>
                  <xsl:value-of select="branch_colony"/>
               </ns0:branch_colony>
               <ns0:branch_zip_code>
                  <xsl:value-of select="branch_zip_code"/>
               </ns0:branch_zip_code>
               <ns0:branch_municipality>
                  <xsl:value-of select="branch_municipality"/>
               </ns0:branch_municipality>
               <ns0:branch_state>
                  <xsl:value-of select="branch_state"/>
               </ns0:branch_state>
               <ns0:branch_reference>
                  <xsl:value-of select="branch_reference"/>
               </ns0:branch_reference>
               <ns0:discount>
                  <xsl:value-of select="discount"/>
               </ns0:discount>
               <ns0:branch_phone>
                  <xsl:value-of select="branch_phone"/>
               </ns0:branch_phone>
               <ns0:branch_country>
                  <xsl:value-of select="branch_country"/>
               </ns0:branch_country>
               <ns0:receiver_name>
                  <xsl:value-of select="receiver_name"/>
               </ns0:receiver_name>
               <ns0:receiver_email>
                  <xsl:value-of select="receiver_email"/>
               </ns0:receiver_email>
               <ns0:receiver_rfc>
                  <xsl:value-of select="receiver_rfc"/>
               </ns0:receiver_rfc>
               <ns0:receiver_phone>
                  <xsl:value-of select="receiver_phone"/>
               </ns0:receiver_phone>
               <ns0:receiver_street>
                  <xsl:value-of select="receiver_street"/>
               </ns0:receiver_street>
               <ns0:receiver_ext_number>
                  <xsl:value-of select="receiver_ext_number"/>
               </ns0:receiver_ext_number>
               <ns0:receiver_int_number>
                  <xsl:value-of select="receiver_int_number"/>
               </ns0:receiver_int_number>
               <ns0:receiver_colony>
                  <xsl:value-of select="receiver_colony"/>
               </ns0:receiver_colony>
               <ns0:receiver_zip_code>
                  <xsl:value-of select="receiver_zip_code"/>
               </ns0:receiver_zip_code>
               <ns0:receiver_municipality>
                  <xsl:value-of select="receiver_municipality"/>
               </ns0:receiver_municipality>
               <ns0:receiver_state>
                  <xsl:value-of select="receiver_state"/>
               </ns0:receiver_state>
               <ns0:receiver_country>
                  <xsl:value-of select="receiver_country"/>
               </ns0:receiver_country>
               <ns0:receiver_passport>
                  <xsl:value-of select="receiver_passport"/>
               </ns0:receiver_passport>
               <ns0:receiver_cfdi_use>
                  <xsl:value-of select="receiver_cfdi_use"/>
               </ns0:receiver_cfdi_use>
               <ns0:payment_method>
                  <xsl:value-of select="payment_method"/>
               </ns0:payment_method>
               <ns0:currency>
                  <xsl:value-of select="currency"/>
               </ns0:currency>
               <ns0:issuer_tax_regime>
                  <xsl:value-of select="issuer_tax_regime"/>
               </ns0:issuer_tax_regime>
               <ns0:currency_exchange_rate>
                  <xsl:value-of select="currency_exchange_rate"/>
               </ns0:currency_exchange_rate>
               <ns0:payment_method_select>
                  <xsl:value-of select="payment_method_select"/>
               </ns0:payment_method_select>
               <ns0:added_payment_methods>
                  <xsl:value-of select="added_payment_methods"/>
               </ns0:added_payment_methods>
               <ns0:payment_form>
                  <xsl:value-of select="payment_form"/>
               </ns0:payment_form>
               <ns0:payment_condition>
                  <xsl:value-of select="payment_condition"/>
               </ns0:payment_condition>
               <ns0:payment_status>
                  <xsl:value-of select="payment_status"/>
               </ns0:payment_status>
               <ns0:payment_account_number>
                  <xsl:value-of select="payment_account_number"/>
               </ns0:payment_account_number>
               <ns0:comments>
                  <xsl:value-of select="comments"/>
               </ns0:comments>
               <ns0:service>
                  <xsl:value-of select="service"/>
               </ns0:service>
               <ns0:relationship_type>
                  <xsl:value-of select="relationship_type"/>
               </ns0:relationship_type>
               <ns0:related_cfdi>
                  <xsl:value-of select="related_cfdi"/>
               </ns0:related_cfdi>
               <ns0:exportacion>
                  <xsl:value-of select="exportacion"/>
               </ns0:exportacion>
               <ns0:RECEIVER_TAX_REGIME>
                  <xsl:value-of select="RECEIVER_TAX_REGIME"/>
               </ns0:RECEIVER_TAX_REGIME>
               <xsl:for-each select="item">
                  <ns0:item>
                     <ns0:CUSTOMER_TRX_ID>
                        <xsl:value-of select="CUSTOMER_TRX_ID"/>
                     </ns0:CUSTOMER_TRX_ID>
                     <ns0:discount>
                        <xsl:value-of select="discount"/>
                     </ns0:discount>
                     <ns0:subtotal>
                        <xsl:value-of select="subtotal"/>
                     </ns0:subtotal>
                     <ns0:retention_vat>
                        <xsl:value-of select="retention_vat"/>
                     </ns0:retention_vat>
                     <ns0:retention_rt>
                        <xsl:value-of select="retention_rt"/>
                     </ns0:retention_rt>
                     <ns0:total>
                        <xsl:value-of select="total"/>
                     </ns0:total>
                     <ns0:description>
                        <xsl:value-of select="description"/>
                     </ns0:description>
                     <ns0:prod_serv_key>
                        <xsl:value-of select="prod_serv_key"/>
                     </ns0:prod_serv_key>
                     <ns0:quantity>
                        <xsl:value-of select="quantity"/>
                     </ns0:quantity>
                     <ns0:vat_percentage>
                        <xsl:value-of select="vat_percentage"/>
                     </ns0:vat_percentage>
                     <ns0:unit>
                        <xsl:value-of select="unit"/>
                     </ns0:unit>
                     <ns0:unit_key>
                        <xsl:value-of select="unit_key"/>
                     </ns0:unit_key>
                     <ns0:unit_price>
                        <xsl:value-of select="unit_price"/>
                     </ns0:unit_price>
                     <ns0:tax_base>
                        <xsl:value-of select="tax_base"/>
                     </ns0:tax_base>
                     <ns0:tax>
                        <xsl:value-of select="tax"/>
                     </ns0:tax>
                     <ns0:factor_type>
                        <xsl:value-of select="factor_type"/>
                     </ns0:factor_type>
                     <ns0:rate_fee>
                        <xsl:value-of select="rate_fee"/>
                     </ns0:rate_fee>
                     <ns0:stps_percentage>
                        <xsl:value-of select="stps_percentage"/>
                     </ns0:stps_percentage>
                     <ns0:imp_percentage>
                        <xsl:value-of select="imp_percentage"/>
                     </ns0:imp_percentage>
                     <ns0:retention_vat_percentage>
                        <xsl:value-of select="retention_vat_percentage"/>
                     </ns0:retention_vat_percentage>
                     <ns0:retention_rt_percentage>
                        <xsl:value-of select="retention_rt_percentage"/>
                     </ns0:retention_rt_percentage>
                     <ns0:amount>
                        <xsl:value-of select="amount"/>
                     </ns0:amount>
                     <ns0:vat>
                        <xsl:value-of select="vat"/>
                     </ns0:vat>
                     <ns0:stps>
                        <xsl:value-of select="stps"/>
                     </ns0:stps>
                     <ns0:imp>
                        <xsl:value-of select="imp"/>
                     </ns0:imp>
                     <ns0:st>
                        <xsl:value-of select="st"/>
                     </ns0:st>
                     <ns0:addendum_interface_apply>
                        <xsl:value-of select="addendum_interface_apply"/>
                     </ns0:addendum_interface_apply>
                     <ns0:addendum_interface_type>
                        <xsl:value-of select="addendum_interface_type"/>
                     </ns0:addendum_interface_type>
                     <ns0:addendum_interface_concept>
                        <xsl:value-of select="addendum_interface_concept"/>
                     </ns0:addendum_interface_concept>
                     <ns0:retention_rt_name>
                        <xsl:value-of select="retention_rt_name"/>
                     </ns0:retention_rt_name>
                     <ns0:propertyAccount>
                        <xsl:value-of select="propertyAccount"/>
                     </ns0:propertyAccount>
                     <ns0:taxObject>
                        <xsl:value-of select="taxObject"/>
                     </ns0:taxObject>
                     <ns0:identificationNumber>
                        <xsl:value-of select="identificationNumber"/>
                     </ns0:identificationNumber>
                  </ns0:item>
               </xsl:for-each>
               <xsl:for-each select="psv_vw">
                  <ns0:psv_vw>
                     <ns0:CUSTOMER_TRX_ID>
                        <xsl:value-of select="CUSTOMER_TRX_ID"/>
                     </ns0:CUSTOMER_TRX_ID>
                     <ns0:version>
                        <xsl:value-of select="version"/>
                     </ns0:version>
                     <ns0:tipoDocumentoFiscal>
                        <xsl:value-of select="tipoDocumentoFiscal"/>
                     </ns0:tipoDocumentoFiscal>
                     <ns0:tipoDocumentoVWM>
                        <xsl:value-of select="tipoDocumentoVWM"/>
                     </ns0:tipoDocumentoVWM>
                     <ns0:division>
                        <xsl:value-of select="division"/>
                     </ns0:division>
                     <ns0:xmlns_PSV>
                        <xsl:value-of select="xmlns_PSV"/>
                     </ns0:xmlns_PSV>
                     <ns0:moneda>
                        <ns0:CUSTOMER_TRX_ID>
                           <xsl:value-of select="moneda/CUSTOMER_TRX_ID"/>
                        </ns0:CUSTOMER_TRX_ID>
                        <ns0:tipoMoneda>
                           <xsl:value-of select="moneda/tipoMoneda"/>
                        </ns0:tipoMoneda>
                        <ns0:tipoCambio>
                           <xsl:value-of select="moneda/tipoCambio"/>
                        </ns0:tipoCambio>
                        <ns0:codigoImpuesto>
                           <xsl:value-of select="moneda/codigoImpuesto"/>
                        </ns0:codigoImpuesto>
                     </ns0:moneda>
                     <ns0:proveedor>
                        <ns0:CUSTOMER_TRX_ID>
                           <xsl:value-of select="proveedor/CUSTOMER_TRX_ID"/>
                        </ns0:CUSTOMER_TRX_ID>
                        <ns0:nombre>
                           <xsl:value-of select="proveedor/nombre"/>
                        </ns0:nombre>
                        <ns0:codigo>
                           <xsl:value-of select="proveedor/codigo"/>
                        </ns0:codigo>
                        <ns0:correoContacto>
                           <xsl:value-of select="proveedor/correoContacto"/>
                        </ns0:correoContacto>
                     </ns0:proveedor>
                     <ns0:destino>
                        <ns0:CUSTOMER_TRX_ID>
                           <xsl:value-of select="destino/CUSTOMER_TRX_ID"/>
                        </ns0:CUSTOMER_TRX_ID>
                        <ns0:codigo>
                           <xsl:value-of select="destino/codigo"/>
                        </ns0:codigo>
                     </ns0:destino>
                     <ns0:referencias>
                        <ns0:CUSTOMER_TRX_ID>
                           <xsl:value-of select="referencias/CUSTOMER_TRX_ID"/>
                        </ns0:CUSTOMER_TRX_ID>
                        <ns0:referenciaProveedor>
                           <xsl:value-of select="referencias/referenciaProveedor"/>
                        </ns0:referenciaProveedor>
                        <ns0:numeroASN>
                           <xsl:value-of select="referencias/numeroASN"/>
                        </ns0:numeroASN>
                     </ns0:referencias>
                     <ns0:solicitante>
                        <ns0:CUSTOMER_TRX_ID>
                           <xsl:value-of select="solicitante/CUSTOMER_TRX_ID"/>
                        </ns0:CUSTOMER_TRX_ID>
                        <ns0:nombre>
                           <xsl:value-of select="solicitante/nombre"/>
                        </ns0:nombre>
                        <ns0:correo>
                           <xsl:value-of select="solicitante/correo"/>
                        </ns0:correo>
                     </ns0:solicitante>
                     <ns0:partes>
                        <ns0:CUSTOMER_TRX_ID>
                           <xsl:value-of select="partes/CUSTOMER_TRX_ID"/>
                        </ns0:CUSTOMER_TRX_ID>
                        <ns0:referencia>
                           <ns0:ordenCompra>
                              <xsl:value-of select="partes/referencia/ordenCompra"/>
                           </ns0:ordenCompra>
                           <ns0:parte>
                              <ns0:codigoImpuesto>
                                 <xsl:value-of select="partes/referencia/parte/
                                 codigoImpuesto"/>
                              </ns0:codigoImpuesto>
                              <ns0:posicion>
                                 <xsl:value-of select="partes/referencia/parte/posicion"/>
                              </ns0:posicion>
                              <ns0:numeroMaterial>
                                 <xsl:value-of select="partes/referencia/parte/numeroMaterial"/>
                              </ns0:numeroMaterial>
                              <ns0:descripcionMaterial>
                                 <xsl:value-of select="partes/referencia/parte/descripcionMaterial"/>
                              </ns0:descripcionMaterial>
                              <ns0:cantidadMaterial>
                                 <xsl:value-of select="partes/referencia/parte/cantidadMaterial"/>
                              </ns0:cantidadMaterial>
                              <ns0:unidadMedida>
                                 <xsl:value-of select="partes/referencia/parte/unidadMedida"/>
                              </ns0:unidadMedida>
                              <ns0:precioUnitario>
                                 <xsl:value-of select="partes/referencia/parte/precioUnitario"/>
                              </ns0:precioUnitario>
                              <ns0:montoLinea>
                                 <xsl:value-of select="partes/referencia/parte/montoLinea"/>
                              </ns0:montoLinea>
                              <ns0:pesoBruto>
                                 <xsl:value-of select="partes/referencia/parte/pesoBruto"/>
                              </ns0:pesoBruto>
                              <ns0:pesoNeto>
                                 <xsl:value-of select="partes/referencia/parte/pesoNeto"/>
                              </ns0:pesoNeto>
                           </ns0:parte>
                        </ns0:referencia>
                     </ns0:partes>
                  </ns0:psv_vw>
               </xsl:for-each>
               <xsl:for-each select="grupo_ado">
                  <ns0:grupo_ado>
                     <ns0:CUSTOMER_TRX_ID>
                        <xsl:value-of select="CUSTOMER_TRX_ID"/>
                     </ns0:CUSTOMER_TRX_ID>
                     <ns0:tipoAddenda>
                        <xsl:value-of select="tipoAddenda"/>
                     </ns0:tipoAddenda>
                     <ns0:addendaValor>
                        <xsl:value-of select="addendaValor"/>
                     </ns0:addendaValor>
                  </ns0:grupo_ado>
               </xsl:for-each>
            </ns0:invoice>
         </xsl:for-each>
      </ns0:DATA_DS>
   </xsl:template>
</xsl:stylesheet>
