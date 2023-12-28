<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:ns0="http://soa.estrellaroja.com.mx/DigitalStampTec" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:cmn="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" xmlns:cfdi="http://soa.estrellaroja.com.mx/cfd/3" xmlns:ns1="http://soa.estrellaroja.com.mx/sitio_internet/cfd/tipoDatos/tdCFDI" xmlns:ns2="http://soa.estrellaroja.com.mx/TimbreFiscalDigital" xmlns:nxsd="http://xmlns.oracle.com/pcbpel/nxsd">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/DigitalStampTec.xsd"/>
            <oracle-xsl-mapper:rootElement name="createTrxCFDIRq" namespace="http://soa.estrellaroja.com.mx/DigitalStampTec"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/NXSDs/nxsd_createCFDI_JsonRq_VW.xsd"/>
            <oracle-xsl-mapper:rootElement name="invoice" namespace="http://soa.estrellaroja.com.mx/DigitalStampTec"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [WED FEB 07 13:25:13 CST 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <ns0:invoice>
         <ns0:invoice>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:id_rfc">
               <ns0:id_rfc>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:id_rfc"/>
               </ns0:id_rfc>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:certificate_number">
               <ns0:certificate_number>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:certificate_number"/>
               </ns0:certificate_number>
            </xsl:if>
            <ns0:issuer_rfc>
               <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_rfc"/>
            </ns0:issuer_rfc>
            <ns0:issuer_name>
               <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_name"/>
            </ns0:issuer_name>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_street">
               <ns0:issuer_street>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_street"/>
               </ns0:issuer_street>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_ext_number">
               <ns0:issuer_ext_number>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_ext_number"/>
               </ns0:issuer_ext_number>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_int_number">
               <ns0:issuer_int_number>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_int_number"/>
               </ns0:issuer_int_number>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_colony">
               <ns0:issuer_colony>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_colony"/>
               </ns0:issuer_colony>
            </xsl:if>
            <ns0:issuer_zip_code>
               <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_zip_code"/>
            </ns0:issuer_zip_code>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_municipality">
               <ns0:issuer_municipality>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_municipality"/>
               </ns0:issuer_municipality>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_state">
               <ns0:issuer_state>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_state"/>
               </ns0:issuer_state>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_phone">
               <ns0:issuer_phone>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_phone"/>
               </ns0:issuer_phone>
            </xsl:if>
            <ns0:issuer_country>
               <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_country"/>
            </ns0:issuer_country>
            <ns0:invoice_date>
               <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:invoice_date"/>
            </ns0:invoice_date>
            <ns0:document_type>
               <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:document_type"/>
            </ns0:document_type>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:additional_information">
               <ns0:additional_information>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:additional_information"/>
               </ns0:additional_information>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:cancellation_date">
               <ns0:cancellation_date>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:cancellation_date"/>
               </ns0:cancellation_date>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:total_words">
               <ns0:total_words>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:total_words"/>
               </ns0:total_words>
            </xsl:if>
            <xsl:for-each select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:invoice_items/ns0:Item">
               <ns0:invoice_items>
                  <ns0:description>
                     <xsl:value-of select="ns0:description"/>
                  </ns0:description>
                  <xsl:if test="ns0:prod_serv_key">
                     <ns0:prod_serv_key>
                        <xsl:value-of select="ns0:prod_serv_key"/>
                     </ns0:prod_serv_key>
                  </xsl:if>
                  <xsl:if test="ns0:quantity">
                     <ns0:quantity>
                        <xsl:value-of select="ns0:quantity"/>
                     </ns0:quantity>
                  </xsl:if>
                  <xsl:if test="ns0:discount">
                     <ns0:discount>
                        <xsl:value-of select="ns0:discount"/>
                     </ns0:discount>
                  </xsl:if>
                  <xsl:if test="ns0:vat_percentage">
                     <ns0:vat_percentage>
                        <xsl:value-of select="ns0:vat_percentage"/>
                     </ns0:vat_percentage>
                  </xsl:if>
                  <xsl:if test="ns0:unit">
                     <ns0:unit>
                        <xsl:value-of select="ns0:unit"/>
                     </ns0:unit>
                  </xsl:if>
                  <xsl:if test="ns0:unit_key">
                     <ns0:unit_key>
                        <xsl:value-of select="ns0:unit_key"/>
                     </ns0:unit_key>
                  </xsl:if>
                  <xsl:if test="ns0:unit_price">
                     <ns0:unit_price>
                        <xsl:value-of select="ns0:unit_price"/>
                     </ns0:unit_price>
                  </xsl:if>
                  <xsl:if test="ns0:tax_base">
                     <ns0:tax_base>
                        <xsl:value-of select="ns0:tax_base"/>
                     </ns0:tax_base>
                  </xsl:if>
                  <xsl:if test="ns0:tax">
                     <ns0:tax>
                        <xsl:value-of select="ns0:tax"/>
                     </ns0:tax>
                  </xsl:if>
                  <xsl:if test="ns0:factor_type">
                     <ns0:factor_type>
                        <xsl:value-of select="ns0:factor_type"/>
                     </ns0:factor_type>
                  </xsl:if>
                  <xsl:if test="ns0:rate_fee">
                     <ns0:rate_fee>
                        <xsl:value-of select="ns0:rate_fee"/>
                     </ns0:rate_fee>
                  </xsl:if>
                  <xsl:if test="ns0:stps_percentage">
                     <ns0:stps_percentage>
                        <xsl:value-of select="ns0:stps_percentage"/>
                     </ns0:stps_percentage>
                  </xsl:if>
                  <xsl:if test="ns0:imp_percentage">
                     <ns0:imp_percentage>
                        <xsl:value-of select="ns0:imp_percentage"/>
                     </ns0:imp_percentage>
                  </xsl:if>
                  <xsl:if test="ns0:retention_vat_percentage">
                     <ns0:retention_vat_percentage>
                        <xsl:value-of select="ns0:retention_vat_percentage"/>
                     </ns0:retention_vat_percentage>
                  </xsl:if>
                  <xsl:if test="ns0:retention_rt_percentage">
                     <ns0:retention_rt_percentage>
                        <xsl:value-of select="ns0:retention_rt_percentage"/>
                     </ns0:retention_rt_percentage>
                  </xsl:if>
                  <ns0:amount>
                     <xsl:value-of select="ns0:amount"/>
                  </ns0:amount>
                  <ns0:subtotal>
                     <xsl:value-of select="ns0:subtotal"/>
                  </ns0:subtotal>
                  <xsl:if test="ns0:vat">
                     <ns0:vat>
                        <xsl:value-of select="ns0:vat"/>
                     </ns0:vat>
                  </xsl:if>
                  <xsl:if test="ns0:stps">
                     <ns0:stps>
                        <xsl:value-of select="ns0:stps"/>
                     </ns0:stps>
                  </xsl:if>
                  <xsl:if test="ns0:imp">
                     <ns0:imp>
                        <xsl:value-of select="ns0:imp"/>
                     </ns0:imp>
                  </xsl:if>
                  <xsl:if test="ns0:retention_vat">
                     <ns0:retention_vat>
                        <xsl:value-of select="ns0:retention_vat"/>
                     </ns0:retention_vat>
                  </xsl:if>
                  <xsl:if test="ns0:retention_rt">
                     <ns0:retention_rt>
                        <xsl:value-of select="ns0:retention_rt"/>
                     </ns0:retention_rt>
                  </xsl:if>
                  <ns0:total>
                     <xsl:value-of select="ns0:total"/>
                  </ns0:total>
                  <xsl:if test="ns0:st">
                     <ns0:st>
                        <xsl:value-of select="ns0:st"/>
                     </ns0:st>
                  </xsl:if>
                  <xsl:if test="ns0:addendum_interface_apply">
                     <ns0:addendum_interface_apply>
                        <xsl:value-of select="ns0:addendum_interface_apply"/>
                     </ns0:addendum_interface_apply>
                  </xsl:if>
                  <xsl:if test="ns0:addendum_interface_type">
                     <ns0:addendum_interface_type>
                        <xsl:value-of select="ns0:addendum_interface_type"/>
                     </ns0:addendum_interface_type>
                  </xsl:if>
                  <xsl:if test="ns0:addendum_interface_concept">
                     <ns0:addendum_interface_concept>
                        <xsl:value-of select="ns0:addendum_interface_concept"/>
                     </ns0:addendum_interface_concept>
                  </xsl:if>
               </ns0:invoice_items>
            </xsl:for-each>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:total_items">
               <ns0:total_items>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:total_items"/>
               </ns0:total_items>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:local_retention_name">
               <ns0:local_retention_name>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:local_retention_name"/>
               </ns0:local_retention_name>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:local_retention_percentage">
               <ns0:local_retention_percentage>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:local_retention_percentage"/>
               </ns0:local_retention_percentage>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:local_retencion_amount">
               <ns0:local_retencion_amount>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:local_retencion_amount"/>
               </ns0:local_retencion_amount>
            </xsl:if>
            <ns0:local_retention_amount>
               <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:local_retention_amount"/>
            </ns0:local_retention_amount>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:total_vat">
               <ns0:total_vat>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:total_vat"/>
               </ns0:total_vat>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:total_stps">
               <ns0:total_stps>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:total_stps"/>
               </ns0:total_stps>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:total_st">
               <ns0:total_st>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:total_st"/>
               </ns0:total_st>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:total_tip">
               <ns0:total_tip>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:total_tip"/>
               </ns0:total_tip>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:retention_vat">
               <ns0:retention_vat>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:retention_vat"/>
               </ns0:retention_vat>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:retention_rt">
               <ns0:retention_rt>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:retention_rt"/>
               </ns0:retention_rt>
            </xsl:if>
            <ns0:subtotal>
               <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:subtotal"/>
            </ns0:subtotal>
            <ns0:total>
               <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:total"/>
            </ns0:total>
            <ns0:serie>
               <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:serie"/>
            </ns0:serie>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_id">
               <ns0:branch_id>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_id"/>
               </ns0:branch_id>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_number">
               <ns0:branch_number>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_number"/>
               </ns0:branch_number>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_name">
               <ns0:branch_name>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_name"/>
               </ns0:branch_name>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_street">
               <ns0:branch_street>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_street"/>
               </ns0:branch_street>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_ext_number">
               <ns0:branch_ext_number>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_ext_number"/>
               </ns0:branch_ext_number>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_int_number">
               <ns0:branch_int_number>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_int_number"/>
               </ns0:branch_int_number>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_colony">
               <ns0:branch_colony>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_colony"/>
               </ns0:branch_colony>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_zip_code">
               <ns0:branch_zip_code>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_zip_code"/>
               </ns0:branch_zip_code>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_municipality">
               <ns0:branch_municipality>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_municipality"/>
               </ns0:branch_municipality>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_state">
               <ns0:branch_state>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_state"/>
               </ns0:branch_state>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_reference">
               <ns0:branch_reference>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_reference"/>
               </ns0:branch_reference>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_phone">
               <ns0:branch_phone>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_phone"/>
               </ns0:branch_phone>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_country">
               <ns0:branch_country>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:branch_country"/>
               </ns0:branch_country>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_name">
               <ns0:receiver_name>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_name"/>
               </ns0:receiver_name>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_email">
               <ns0:receiver_email>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_email"/>
               </ns0:receiver_email>
            </xsl:if>
            <ns0:receiver_rfc>
               <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_rfc"/>
            </ns0:receiver_rfc>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_phone">
               <ns0:receiver_phone>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_phone"/>
               </ns0:receiver_phone>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_street">
               <ns0:receiver_street>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_street"/>
               </ns0:receiver_street>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_ext_number">
               <ns0:receiver_ext_number>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_ext_number"/>
               </ns0:receiver_ext_number>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_int_number">
               <ns0:receiver_int_number>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_int_number"/>
               </ns0:receiver_int_number>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_colony">
               <ns0:receiver_colony>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_colony"/>
               </ns0:receiver_colony>
            </xsl:if>
            <ns0:receiver_zip_code>
               <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_zip_code"/>
            </ns0:receiver_zip_code>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_municipality">
               <ns0:receiver_municipality>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_municipality"/>
               </ns0:receiver_municipality>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_state">
               <ns0:receiver_state>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_state"/>
               </ns0:receiver_state>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_country">
               <ns0:receiver_country>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_country"/>
               </ns0:receiver_country>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_passport">
               <ns0:receiver_passport>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_passport"/>
               </ns0:receiver_passport>
            </xsl:if>
            <ns0:receiver_cfdi_use>
               <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:receiver_cfdi_use"/>
            </ns0:receiver_cfdi_use>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:payment_method">
               <ns0:payment_method>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:payment_method"/>
               </ns0:payment_method>
            </xsl:if>
            <ns0:currency>
               <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:currency"/>
            </ns0:currency>
            <ns0:issuer_tax_regime>
               <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:issuer_tax_regime"/>
            </ns0:issuer_tax_regime>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:currency_exchange_rate">
               <ns0:currency_exchange_rate>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:currency_exchange_rate"/>
               </ns0:currency_exchange_rate>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:payment_method_select">
               <ns0:payment_method_select>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:payment_method_select"/>
               </ns0:payment_method_select>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:added_payment_methods">
               <ns0:added_payment_methods>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:added_payment_methods"/>
               </ns0:added_payment_methods>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:payment_form">
               <ns0:payment_form>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:payment_form"/>
               </ns0:payment_form>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:payment_condition">
               <ns0:payment_condition>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:payment_condition"/>
               </ns0:payment_condition>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:payment_status">
               <ns0:payment_status>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:payment_status"/>
               </ns0:payment_status>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:payment_account_number">
               <ns0:payment_account_number>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:payment_account_number"/>
               </ns0:payment_account_number>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:discount">
               <ns0:discount>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:discount"/>
               </ns0:discount>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:comments">
               <ns0:comments>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:comments"/>
               </ns0:comments>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:service">
               <ns0:service>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:service"/>
               </ns0:service>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:relationship_type">
               <ns0:relationship_type>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:relationship_type"/>
               </ns0:relationship_type>
            </xsl:if>
            <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:related_cfdi">
               <ns0:related_cfdi>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:related_cfdi"/>
               </ns0:related_cfdi>
            </xsl:if>
         </ns0:invoice>
         <ns0:addendas>
            <ns0:psv_vw>
               <ns0:cancelaciones>
                  <ns0:cancelaSustituye>
                     <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:cancelaciones/ns0:cancelaSustituye"/>
                  </ns0:cancelaSustituye>
               </ns0:cancelaciones>
               <ns0:moneda>
                  <ns0:tipoMoneda>
                     <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:moneda/ns0:tipoMoneda"/>
                  </ns0:tipoMoneda>
                  <ns0:tipoCambio>
                     <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:moneda/ns0:tipoCambio"/>
                  </ns0:tipoCambio>
                  <ns0:codigoImpuesto>
                     <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:moneda/ns0:codigoImpuesto"/>
                  </ns0:codigoImpuesto>
               </ns0:moneda>
               <ns0:proveedor>
                  <ns0:codigo>
                     <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:proveedor/ns0:codigo"/>
                  </ns0:codigo>
                  <ns0:nombre>
                     <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:proveedor/ns0:nombre"/>
                  </ns0:nombre>
                  <ns0:correoContacto>
                     <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:proveedor/ns0:correoContacto"/>
                  </ns0:correoContacto>
               </ns0:proveedor>
               <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:origen">
                  <ns0:origen>
                     <ns0:codigo>
                        <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:origen/ns0:codigo"/>
                     </ns0:codigo>
                     <ns0:nombre>
                        <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:origen/ns0:nombre"/>
                     </ns0:nombre>
                  </ns0:origen>
               </xsl:if>
               <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:destino">
                  <ns0:destino>
                     <ns0:codigo>
                        <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:destino/ns0:codigo"/>
                     </ns0:codigo>
                     <ns0:naveReciboMaterial>
                        <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:destino/ns0:naveReciboMaterial"/>
                     </ns0:naveReciboMaterial>
                  </ns0:destino>
               </xsl:if>
               <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:medidas">
                  <ns0:medidas>
                     <ns0:pesoBruto>
                        <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:medidas/ns0:pesoBruto"/>
                     </ns0:pesoBruto>
                     <ns0:pesoNeto>
                        <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:medidas/ns0:pesoNeto"/>
                     </ns0:pesoNeto>
                     <ns0:volumen>
                        <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:medidas/ns0:volumen"/>
                     </ns0:volumen>
                     <ns0:numeroPiezas>
                        <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:medidas/ns0:numeroPiezas"/>
                     </ns0:numeroPiezas>
                     <ns0:descripcion>
                        <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:medidas/ns0:descripcion"/>
                     </ns0:descripcion>
                  </ns0:medidas>
               </xsl:if>
               <ns0:referencias>
                  <ns0:referenciaProveedor>
                     <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:referencias/ns0:referenciaProveedor"/>
                  </ns0:referenciaProveedor>
                  <ns0:remision>
                     <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:referencias/ns0:remision"/>
                  </ns0:remision>
                  <ns0:numeroASN>
                     <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:referencias/ns0:numeroASN"/>
                  </ns0:numeroASN>
                  <ns0:unidadNegocios>
                     <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:referencias/ns0:unidadNegocios"/>
                  </ns0:unidadNegocios>
               </ns0:referencias>
               <ns0:solicitante>
                  <ns0:nombre>
                     <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:solicitante/ns0:nombre"/>
                  </ns0:nombre>
                  <ns0:correo>
                     <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:solicitante/ns0:correo"/>
                  </ns0:correo>
               </ns0:solicitante>
               <xsl:for-each select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:notas">
                  <ns0:notas>
                     <ns0:nota>
                        <xsl:value-of select="ns0:nota"/>
                     </ns0:nota>
                  </ns0:notas>
               </xsl:for-each>
               <xsl:for-each select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:archivo">
                  <ns0:archivo>
                     <ns0:datos>
                        <xsl:value-of select="ns0:datos"/>
                     </ns0:datos>
                     <ns0:tipo>
                        <xsl:value-of select="ns0:tipo"/>
                     </ns0:tipo>
                  </ns0:archivo>
               </xsl:for-each>
               <xsl:for-each select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:partes">
                  <ns0:partes>
                     <ns0:referencias>
                        <ns0:ordenCompra>
                           <xsl:value-of select="ns0:referencias/ns0:ordenCompra"/>
                        </ns0:ordenCompra>
                     </ns0:referencias>
                     <xsl:for-each select="ns0:notas">
                        <ns0:notas>
                           <ns0:nota>
                              <xsl:value-of select="ns0:nota"/>
                           </ns0:nota>
                        </ns0:notas>
                     </xsl:for-each>
                     <ns0:posicion>
                        <xsl:value-of select="ns0:posicion"/>
                     </ns0:posicion>
                     <ns0:numeroMaterial>
                        <xsl:value-of select="ns0:numeroMaterial"/>
                     </ns0:numeroMaterial>
                     <ns0:descripcionMaterial>
                        <xsl:value-of select="ns0:descripcionMaterial"/>
                     </ns0:descripcionMaterial>
                     <ns0:cantidadMaterial>
                        <xsl:value-of select="ns0:cantidadMaterial"/>
                     </ns0:cantidadMaterial>
                     <ns0:unidadMedida>
                        <xsl:value-of select="ns0:unidadMedida"/>
                     </ns0:unidadMedida>
                     <ns0:precioUnitario>
                        <xsl:value-of select="ns0:precioUnitario"/>
                     </ns0:precioUnitario>
                     <ns0:montoLinea>
                        <xsl:value-of select="ns0:montoLinea"/>
                     </ns0:montoLinea>
                     <ns0:pesoBruto>
                        <xsl:value-of select="ns0:pesoBruto"/>
                     </ns0:pesoBruto>
                     <ns0:pesoNeto>
                        <xsl:value-of select="ns0:pesoNeto"/>
                     </ns0:pesoNeto>
                     <ns0:codigoImpuesto>
                        <xsl:value-of select="ns0:codigoImpuesto"/>
                     </ns0:codigoImpuesto>
                  </ns0:partes>
               </xsl:for-each>
               <ns0:version>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:version"/>
               </ns0:version>
               <ns0:tipoDocumentoFiscal>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:tipoDocumentoFiscal"/>
               </ns0:tipoDocumentoFiscal>
               <ns0:tipoDocumentoVWM>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:tipoDocumentoVWM"/>
               </ns0:tipoDocumentoVWM>
               <ns0:division>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:addendaVW/ns0:psv_vw/ns0:division"/>
               </ns0:division>
            </ns0:psv_vw>
         </ns0:addendas>
         <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:bus">
            <ns0:bus>
               <ns0:ticket_numer>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:bus/ns0:ticket_numer"/>
               </ns0:ticket_numer>
               <ns0:destination>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:bus/ns0:destination"/>
               </ns0:destination>
               <ns0:sale_date>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:bus/ns0:sale_date"/>
               </ns0:sale_date>
               <ns0:amount>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:bus/ns0:amount"/>
               </ns0:amount>
               <ns0:billing_code>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:bus/ns0:billing_code"/>
               </ns0:billing_code>
               <ns0:service>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:bus/ns0:service"/>
               </ns0:service>
            </ns0:bus>
         </xsl:if>
         <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:parking">
            <ns0:parking>
               <ns0:ticket_number>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:parking/ns0:ticket_number"/>
               </ns0:ticket_number>
               <ns0:service_date>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:parking/ns0:service_date"/>
               </ns0:service_date>
               <ns0:service>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:parking/ns0:service"/>
               </ns0:service>
            </ns0:parking>
         </xsl:if>
         <xsl:if test="/ns0:createTrxCFDIRq/ns0:invoice/ns0:taxi">
            <ns0:taxi>
               <ns0:ticket_number>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:taxi/ns0:ticket_number"/>
               </ns0:ticket_number>
               <ns0:purchae_date>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:taxi/ns0:purchae_date"/>
               </ns0:purchae_date>
               <ns0:service>
                  <xsl:value-of select="/ns0:createTrxCFDIRq/ns0:invoice/ns0:taxi/ns0:service"/>
               </ns0:service>
            </ns0:taxi>
         </xsl:if>
      </ns0:invoice>
   </xsl:template>
</xsl:stylesheet>