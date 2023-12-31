<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/EAMSelectWorkOrdersByUnit" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" exclude-result-prefixes=" oracle-xsl-mapper xsi xsd xsl ns0 socket dvm mhdr oraxsl oraext xp20 xref"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/OSB_ESTRELLA_ROJA/DEV_EAMWorkOrdersTec/EAMSelectWorkOrdersByUnit">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/TransactionalWorkOrders/EAMSelectWorkOrdersByUnit.wsdl"/>
            <oracle-xsl-mapper:rootElement name="EAMSelectWorkOrdersByUnitOutputCollection" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/EAMSelectWorkOrdersByUnit"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/TransactionalWorkOrders/EAMSelectWorkOrdersByUnit.wsdl"/>
            <oracle-xsl-mapper:rootElement name="EAMSelectWorkOrdersByUnitOutputCollection" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/EAMSelectWorkOrdersByUnit"/>
            <oracle-xsl-mapper:param name="WorkOrderNumVar"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/TransactionalWorkOrders/EAMSelectWorkOrdersByUnit.wsdl"/>
            <oracle-xsl-mapper:rootElement name="EAMSelectWorkOrdersByUnitOutputCollection" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/EAMSelectWorkOrdersByUnit"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [SUN FEB 09 13:13:27 CST 2020].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="WorkOrderNumVar"/>
   <xsl:template match="/">
      <ns0:EAMSelectWorkOrdersByUnitOutputCollection>
         <xsl:for-each select="/ns0:EAMSelectWorkOrdersByUnitOutputCollection/ns0:EAMSelectWorkOrdersByUnitOutput">
            <xsl:if test="ns0:ORA_WO_NUMBER != $WorkOrderNumVar/ns0:EAMSelectWorkOrdersByUnitOutputCollection/ns0:EAMSelectWorkOrdersByUnitOutput/ns0:ORA_WO_NUMBER">
               <ns0:EAMSelectWorkOrdersByUnitOutput>
                  <ns0:BLK_ID>
                     <xsl:value-of select="ns0:BLK_ID"/>
                  </ns0:BLK_ID>
                  <ns0:ORA_WO_NUMBER>
                     <xsl:value-of select="ns0:ORA_WO_ASSET_NUMBER"/>
                  </ns0:ORA_WO_NUMBER>
                  <ns0:ORA_WO_ASSET_NUMBER>
                     <xsl:value-of select="ns0:ORA_WO_ASSET_NUMBER"/>
                  </ns0:ORA_WO_ASSET_NUMBER>
                  <ns0:ORA_WO_RELEASED_DATE>
                     <xsl:value-of select="ns0:ORA_WO_RELEASED_DATE"/>
                  </ns0:ORA_WO_RELEASED_DATE>
                  <ns0:ORA_WO_COMPLETED_DATE>
                     <xsl:value-of select="ns0:ORA_WO_COMPLETED_DATE"/>
                  </ns0:ORA_WO_COMPLETED_DATE>
                  <ns0:ORA_WO_CLOSED_DATE>
                     <xsl:value-of select="ns0:ORA_WO_CLOSED_DATE"/>
                  </ns0:ORA_WO_CLOSED_DATE>
                  <ns0:ORA_WO_ORG_NAME>
                     <xsl:value-of select="ns0:ORA_WO_ORG_NAME"/>
                  </ns0:ORA_WO_ORG_NAME>
                  <ns0:ORA_WO_COST_CLAS>
                     <xsl:value-of select="ns0:ORA_WO_COST_CLAS"/>
                  </ns0:ORA_WO_COST_CLAS>
                  <ns0:ZAM_WO_NUMBER>
                     <xsl:value-of select="ns0:ZAM_WO_NUMBER"/>
                  </ns0:ZAM_WO_NUMBER>
                  <ns0:ZAM_BLOCK_DATE>
                     <xsl:value-of select="ns0:ZAM_BLOCK_DATE"/>
                  </ns0:ZAM_BLOCK_DATE>
                  <ns0:ZAM_UNBLOCK_DATE>
                     <xsl:value-of select="ns0:ZAM_UNBLOCK_DATE"/>
                  </ns0:ZAM_UNBLOCK_DATE>
                  <ns0:PROCESS_STATUS>
                     <xsl:value-of select="ns0:PROCESS_STATUS"/>
                  </ns0:PROCESS_STATUS>
                  <ns0:MESSAGE>
                     <xsl:value-of select="ns0:MESSAGE"/>
                  </ns0:MESSAGE>
                  <ns0:CREATION_DATE>
                     <xsl:value-of select="ns0:CREATION_DATE"/>
                  </ns0:CREATION_DATE>
                  <ns0:CREATED_BY>
                     <xsl:value-of select="ns0:CREATED_BY"/>
                  </ns0:CREATED_BY>
                  <ns0:CREATED_BY_USER>
                     <xsl:value-of select="ns0:CREATED_BY_USER"/>
                  </ns0:CREATED_BY_USER>
                  <ns0:RUN_ID>
                     <xsl:value-of select="ns0:RUN_ID"/>
                  </ns0:RUN_ID>
               </ns0:EAMSelectWorkOrdersByUnitOutput>
            </xsl:if>
         </xsl:for-each>
      </ns0:EAMSelectWorkOrdersByUnitOutputCollection>
   </xsl:template>
</xsl:stylesheet>
