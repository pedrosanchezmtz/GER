<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:tns="http://soa.estrellaroja.com.mx/MessageTec" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:ns0="http://soa.estrellaroja.com.mx/ValidationPaymentsAPBiz" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:ns1="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:strClass="http://www.oracle.com/XSL/Transform/java/java.lang.String" xmlns:client="http://soa.estrellaroja.com.mx/ValidationPaymentsAPBiz/BpelSendNotifications" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:ns2="http://soa.estrellaroja.com.mx/Reports/XXER_ValidationComplement">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/External/BpelSendNotifications.wsdl"/>
        <oracle-xsl-mapper:rootElement name="SendNotificationsRq" namespace="http://soa.estrellaroja.com.mx/ValidationPaymentsAPBiz"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="oramds:/apps/SOA/MessageTec/MessageTec.wsdl"/>
        <oracle-xsl-mapper:rootElement name="MessageRq" namespace="http://soa.estrellaroja.com.mx/MessageTec"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [TUE JUN 14 11:58:25 CDT 2022].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:param name="varInstance"/>
  <xsl:template match="/">
    <tns:MessageRq>
      <tns:Message>
        <xsl:choose>
          <xsl:when test="dvm:lookupValue('DVMs/dvmValidationPaymentsBizConfigs.dvm','Code','Pruebas','Value','false','Component','NotificacionAP')='true'">
            <tns:Addresses>
              <tns:AddressFrom>
                <xsl:value-of select="dvm:lookupValue('DVMs/dvmValidationPaymentsBizConfigs.dvm','Code','EmailEmisorPruebas','Value','ger.notificaciones@forteinnovation.mx','Component','NotificacionAP')"/>
              </tns:AddressFrom>
              <tns:AddressTo>
                <xsl:value-of select="dvm:lookupValue('DVMs/dvmValidationPaymentsBizConfigs.dvm','Code','EmailPruebas','Value','pedro.sanchez@forteinnovation.mx','Component','NotificacionAP')"/>
              </tns:AddressTo>
            </tns:Addresses>
          </xsl:when>
          <xsl:otherwise>
            <tns:Addresses>
              <tns:AddressFrom>
                <xsl:value-of select="dvm:lookupValue('DVMs/dvmValidationPaymentsBizConfigs.dvm','Code','EmailEmisor','Value','complementosap@estrellaroja.com.mx','Component','NotificacionAP')"/>
              </tns:AddressFrom>
              <tns:AddressTo>
                <xsl:value-of select="/ns0:SendNotificationsRq/ns0:EMAIL_NOTIFICACION"/>
              </tns:AddressTo>
              <tns:AddressBCC>
                <xsl:value-of select="dvm:lookupValue('DVMs/dvmValidationPaymentsBizConfigs.dvm','Code','Emails','Value','pedro.sanchez@forteinnovation.mx','Component','NotificacionAP')"/>
              </tns:AddressBCC>
            </tns:Addresses>
          </xsl:otherwise>
        </xsl:choose>
        <tns:Subject>
          <xsl:value-of select="/ns0:SendNotificationsRq/ns0:ESTATUS"/>
        </tns:Subject>
        <tns:Body>
        <xsl:value-of select=" strClass:replaceAll( strClass:replaceAll( strClass:replaceAll( strClass:replaceAll( strClass:replaceAll( strClass:replaceAll( strClass:replaceAll( strClass:replaceAll( strClass:replaceAll( strClass:replaceAll( strClass:replaceAll( strClass:replaceAll( strClass:replaceAll( strClass:replaceAll( dvm:lookupValue('DVMs/dvmValidationPaymentsBizConfigs.dvm','Code','TemplateEmail','Value','','Component','NotificacionAP'), '@URL_LOGO@',dvm:lookupValue('DVMs/dvmValidationPaymentsBizConfigs.dvm','Code','logoURL','Value','','Component','NotificacionAP')), '@LOGO_ANCHO@',dvm:lookupValue('DVMs/dvmValidationPaymentsBizConfigs.dvm','Code','v_logoAncho','Value','','Component','NotificacionAP')), '@LOGO_LARGO@',dvm:lookupValue('DVMs/dvmValidationPaymentsBizConfigs.dvm','Code','v_logoLargo','Value','','Component','NotificacionAP')), '@ESTATUS@',/ns0:SendNotificationsRq/ns0:ESTATUS), '@ESTATUS_MSJ@',/ns0:SendNotificationsRq/ns0:ESTATUS_MSJ), '@NOMBRE_PROVEEDOR@',/ns0:SendNotificationsRq/ns0:NOMBRE_PROVEEDOR), '@ID_PAGO@',/ns0:SendNotificationsRq/ns0:ID_PAGO), '@MONTO_PAGO@',/ns0:SendNotificationsRq/ns0:MONTO_PAGO), '@NUMERO_PAGO@',/ns0:SendNotificationsRq/ns0:NUMERO_PAGO), '@FECHA_PAGO@',/ns0:SendNotificationsRq/ns0:FECHA_PAGO), '@NUMERO_NOTIFICACION@',/ns0:SendNotificationsRq/ns0:NUMERO_NOTIFICACION), '@DETAIL_LINES@',/ns0:SendNotificationsRq/ns0:DETAIL_LINES), '@CORREO_DUDAS@',dvm:lookupValue('DVMs/dvmValidationPaymentsBizConfigs.dvm','Code','EmailsDudas','Value','','Component','NotificacionAP')), '@INSTANCE@',$varInstance) "/>
        </tns:Body>
        <xsl:if test="string-length(/ns0:SendNotificationsRq/ns0:COMPROBANTE )>0">
          <tns:Attachment>
            <tns:FileName>
              <xsl:value-of select="/ns0:SendNotificationsRq/ns0:COMPROBANTE_NAME"/>
            </tns:FileName>
            <tns:TypeName>pdf</tns:TypeName>
            <tns:AttachmentBase64>
              <xsl:value-of select="/ns0:SendNotificationsRq/ns0:COMPROBANTE"/>
            </tns:AttachmentBase64>
          </tns:Attachment>
        </xsl:if>
      </tns:Message>
    </tns:MessageRq>
  </xsl:template>
</xsl:stylesheet>