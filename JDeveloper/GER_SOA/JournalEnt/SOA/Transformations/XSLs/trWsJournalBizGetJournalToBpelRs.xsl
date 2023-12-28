<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:tns="http://soa.estrellaroja.com.mx/JournalEnt" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ns0="http://soa.estrellaroja.com.mx/JournalBiz" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:ns1="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:ns2="http://soa.estrellaroja.com.mx/JournalBiz/types"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:client="http://soa.estrellaroja.com.mx/JournalEnt/bpelSendFileJournal"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns3="http://schemas.oracle.com/bpel/extension">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/JournalBizWrapper.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetJournalRs" namespace="http://soa.estrellaroja.com.mx/JournalBiz"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelSendFileJournal.wsdl"/>
            <oracle-xsl-mapper:rootElement name="SendFileJournalRs" namespace="http://soa.estrellaroja.com.mx/JournalEnt"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [MON DEC 18 12:41:01 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:SendFileJournalRs>
         <xsl:if test="/ns0:GetJournalRs/ns1:Errors">
            <ns1:Errors>
               <xsl:for-each select="/ns0:GetJournalRs/ns1:Errors/ns1:Error">
                  <ns1:Error>
                     <ns1:ErrorCode>
                        <xsl:value-of select="ns1:ErrorCode"/>
                     </ns1:ErrorCode>
                     <ns1:ShortDescription>
                        <xsl:value-of select="ns1:ShortDescription"/>
                     </ns1:ShortDescription>
                     <ns1:Description>
                        <xsl:value-of select="ns1:Description"/>
                     </ns1:Description>
                     <ns1:BusinessProcess>
                        <xsl:value-of select="ns1:BusinessProcess"/>
                     </ns1:BusinessProcess>
                     <ns1:FailedService>
                        <xsl:value-of select="ns1:FailedService"/>
                     </ns1:FailedService>
                     <ns1:TimeStamp>
                        <xsl:value-of select="ns1:TimeStamp"/>
                     </ns1:TimeStamp>
                  </ns1:Error>
               </xsl:for-each>
            </ns1:Errors>
         </xsl:if>
      </tns:SendFileJournalRs>
   </xsl:template>
</xsl:stylesheet>