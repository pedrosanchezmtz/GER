<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:ns0="http://soa.estrellaroja.com.mx/SOAUtilitiesTec" xmlns:tns="http://impl.utilities.cloud.estrellaroja.com.mx/" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns1="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:ns2="http://schemas.oracle.com/bpel/extension" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:client="http://soa.estrellaroja.com.mx/SOAUtilitiesTec/bpelbpelGenerateZipFile"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:ns3="http://impl.utilities.cloud.estrellaroja.com.mx/types"
                xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/bpelGenerateZipFile.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GenerateZipFileRq" namespace="http://soa.estrellaroja.com.mx/SOAUtilitiesTec"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/SOAUtilitiesImpl.wsdl"/>
            <oracle-xsl-mapper:rootElement name="createZipFile" namespace="http://impl.utilities.cloud.estrellaroja.com.mx/"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [WED JAN 03 13:35:17 CST 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:createZipFile>
         <arg0>
            <fileNameZip>
               <xsl:value-of select="/ns0:GenerateZipFileRq/ns0:FileNameToZip"/>
            </fileNameZip>
            <xsl:for-each select="/ns0:GenerateZipFileRq/ns0:FilesCompress/ns0:FileToCompress">
               <listFilesContentType>
                  <fileNameToCompress>
                     <xsl:value-of select="ns0:FileName"/>
                  </fileNameToCompress>
                  <pathFileNameToCompress>
                     <xsl:value-of select="ns0:PathFile"/>
                  </pathFileNameToCompress>
               </listFilesContentType>
            </xsl:for-each>
            <pathFileNameZip>
               <xsl:value-of select="/ns0:GenerateZipFileRq/ns0:PathFileToZip"/>
            </pathFileNameZip>
         </arg0>
      </tns:createZipFile>
   </xsl:template>
</xsl:stylesheet>