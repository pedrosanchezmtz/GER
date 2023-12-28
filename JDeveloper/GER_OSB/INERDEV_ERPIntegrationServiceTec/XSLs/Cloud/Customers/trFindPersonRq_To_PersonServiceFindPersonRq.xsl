<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:tns="http://xmlns.oracle.com/apps/cdm/foundation/parties/personService/applicationModule/types/" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:ns0="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:ns1="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/partySite/" xmlns:ns2="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountContact/" xmlns:ns3="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountContactRole/" xmlns:ns4="http://xmlns.oracle.com/adf/svc/errors/" xmlns:ns5="http://xmlns.oracle.com/adf/svc/types/" xmlns:ns6="commonj.sdo/xml" xmlns:ns7="commonj.sdo/java" xmlns:ns8="http://xmlns.oracle.com/apps/cdm/foundation/parties/customerAccountService/" xmlns:ns9="http://xmlns.oracle.com/apps/cdm/foundation/parties/relationshipService/" xmlns:cus="http://soa.estrellaroja.com.mx/Customers/Types" xmlns:ns10="http://xmlns.oracle.com/apps/financials/receivables/customers/customerProfileService/" xmlns:ns11="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/orgContact/" xmlns:ns12="http://xmlns.oracle.com/apps/cdm/foundation/parties/personService/" xmlns:ns13="http://xmlns.oracle.com/apps/cdm/foundation/parties/partyService/" xmlns:ns14="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/relationship/" xmlns:ns15="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountSiteUse/" xmlns:cmn="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" xmlns:ns16="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/person/" xmlns:ns17="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountRel/" xmlns:ns18="http://xmlns.oracle.com/apps/financials/receivables/customerSetup/customerProfiles/model/flex/CustomerProfileGdf/" xmlns:ns19="http://xmlns.oracle.com/apps/cdm/foundation/parties/contactPointService/" xmlns:ns20="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccount/" xmlns:ns21="http://xmlns.oracle.com/apps/cdm/foundation/parties/organizationService/" xmlns:ns22="commonj.sdo" xmlns:ns23="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/organization/" xmlns:ns24="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/sourceSystemRef/" xmlns:ns25="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountSite/" xmlns:ns26="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/contactPoint/" xmlns:ordx="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec/Orders" xmlns:ns27="http://xmlns.oracle.com/apps/financials/receivables/customerSetup/customerProfiles/model/flex/CustomerProfileDff/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../../../Schemas/ERPIntegrationServiceTec.xsd"/>
            <oracle-xsl-mapper:rootElement name="FindPersonRq" namespace="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../../../Schemas/Modules/Cloud/Customers/PersonService.xsd"/>
            <oracle-xsl-mapper:rootElement name="findPerson" namespace="http://xmlns.oracle.com/apps/cdm/foundation/parties/personService/applicationModule/types/"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [WED DEC 06 17:02:52 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:findPerson>
          <tns:findCriteria>
            <ns5:fetchStart>
               <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:fetchStart"/>
            </ns5:fetchStart>
            <ns5:fetchSize>
               <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:fetchSize"/>
            </ns5:fetchSize>
            <xsl:if test="/ns0:FindPersonRq/ns0:findCriteria/ns0:filter">
               <ns5:filter>
                  <xsl:if test="/ns0:FindPersonRq/ns0:findCriteria/ns0:filter/ns0:conjunction">
                     <ns5:conjunction>
                        <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:filter/ns0:conjunction"/>
                     </ns5:conjunction>
                  </xsl:if>
                  <xsl:for-each select="/ns0:FindPersonRq/ns0:findCriteria/ns0:filter/ns0:group">
                     <ns5:group>
                        <xsl:if test="ns0:conjunction">
                           <ns5:conjunction>
                              <xsl:value-of select="ns0:conjunction"/>
                           </ns5:conjunction>
                        </xsl:if>
                        <ns5:upperCaseCompare>
                           <xsl:value-of select="ns0:upperCaseCompare"/>
                        </ns5:upperCaseCompare>
                        <xsl:for-each select="ns0:item">
                           <ns5:item>
                              <xsl:if test="ns0:conjunction">
                                 <ns5:conjunction>
                                    <xsl:value-of select="ns0:conjunction"/>
                                 </ns5:conjunction>
                              </xsl:if>
                              <ns5:upperCaseCompare>
                                 <xsl:value-of select="ns0:upperCaseCompare"/>
                              </ns5:upperCaseCompare>
                              <ns5:attribute>
                                 <xsl:value-of select="ns0:attribute"/>
                              </ns5:attribute>
                              <ns5:operator>
                                 <xsl:value-of select="ns0:operator"/>
                              </ns5:operator>
                              <xsl:for-each select="ns0:value">
                                 <ns5:value>
                                    <xsl:value-of select="."/>
                                 </ns5:value>
                              </xsl:for-each>
                              <xsl:if test="ns0:nested">
                                 <ns5:nested>
                                    <xsl:if test="ns0:nested/ns0:conjunction">
                                       <ns5:conjunction>
                                          <xsl:value-of select="ns0:nested/ns0:conjunction"/>
                                       </ns5:conjunction>
                                    </xsl:if>
                                    <xsl:for-each select="ns0:nested/ns0:group">
                                       <ns5:group>
                                          <xsl:if test="ns0:conjunction">
                                             <ns5:conjunction>
                                                <xsl:value-of select="ns0:conjunction"/>
                                             </ns5:conjunction>
                                          </xsl:if>
                                          <ns5:upperCaseCompare>
                                             <xsl:value-of select="ns0:upperCaseCompare"/>
                                          </ns5:upperCaseCompare>
                                          <xsl:for-each select="ns0:item">
                                             <ns5:item>
                                                <xsl:if test="ns0:conjunction">
                                                   <ns5:conjunction>
                                                      <xsl:value-of select="ns0:conjunction"/>
                                                   </ns5:conjunction>
                                                </xsl:if>
                                                <ns5:upperCaseCompare>
                                                   <xsl:value-of select="ns0:upperCaseCompare"/>
                                                </ns5:upperCaseCompare>
                                                <ns5:attribute>
                                                   <xsl:value-of select="ns0:attribute"/>
                                                </ns5:attribute>
                                                <ns5:operator>
                                                   <xsl:value-of select="ns0:operator"/>
                                                </ns5:operator>
                                                <xsl:for-each select="ns0:value">
                                                   <ns5:value>
                                                      <xsl:value-of select="."/>
                                                   </ns5:value>
                                                </xsl:for-each>
                                             </ns5:item>
                                          </xsl:for-each>
                                       </ns5:group>
                                    </xsl:for-each>
                                    <xsl:for-each select="ns0:nested/ns0:nested">
                                       <ns5:nested>
                                          <xsl:if test="ns0:conjunction">
                                             <ns5:conjunction>
                                                <xsl:value-of select="ns0:conjunction"/>
                                             </ns5:conjunction>
                                          </xsl:if>
                                          <xsl:for-each select="/ns0:FindPersonRq/ns0:findCriteria/ns0:filter/ns0:group/ns0:item/ns0:nested/ns0:group/ns0:item/ns0:nested/ns0:group">
                                             <ns5:group>
                                                <xsl:if test="ns0:conjunction">
                                                   <ns5:conjunction>
                                                      <xsl:value-of select="ns0:conjunction"/>
                                                   </ns5:conjunction>
                                                </xsl:if>
                                                <ns5:upperCaseCompare>
                                                   <xsl:value-of select="ns0:upperCaseCompare"/>
                                                </ns5:upperCaseCompare>
                                                <xsl:for-each select="ns0:item">
                                                   <ns5:item>
                                                      <xsl:if test="ns0:conjunction">
                                                         <ns5:conjunction>
                                                            <xsl:value-of select="ns0:conjunction"/>
                                                         </ns5:conjunction>
                                                      </xsl:if>
                                                      <ns5:upperCaseCompare>
                                                         <xsl:value-of select="ns0:upperCaseCompare"/>
                                                      </ns5:upperCaseCompare>
                                                      <ns5:attribute>
                                                         <xsl:value-of select="ns0:attribute"/>
                                                      </ns5:attribute>
                                                      <ns5:operator>
                                                         <xsl:value-of select="ns0:operator"/>
                                                      </ns5:operator>
                                                      <xsl:for-each select="ns0:value">
                                                         <ns5:value>
                                                            <xsl:value-of select="."/>
                                                         </ns5:value>
                                                      </xsl:for-each>
                                                   </ns5:item>
                                                </xsl:for-each>
                                             </ns5:group>
                                          </xsl:for-each>
                                       </ns5:nested>
                                    </xsl:for-each>
                                 </ns5:nested>
                              </xsl:if>
                           </ns5:item>
                        </xsl:for-each>
                     </ns5:group>
                  </xsl:for-each>
                  <xsl:for-each select="/ns0:FindPersonRq/ns0:findCriteria/ns0:filter/ns0:nested">
                     <ns5:nested>
                        <xsl:if test="ns0:conjunction">
                           <ns5:conjunction>
                              <xsl:value-of select="ns0:conjunction"/>
                           </ns5:conjunction>
                        </xsl:if>
                        <xsl:for-each select="ns0:group">
                           <ns5:group>
                              <xsl:if test="ns0:conjunction">
                                 <ns5:conjunction>
                                    <xsl:value-of select="ns0:conjunction"/>
                                 </ns5:conjunction>
                              </xsl:if>
                              <ns5:upperCaseCompare>
                                 <xsl:value-of select="ns0:upperCaseCompare"/>
                              </ns5:upperCaseCompare>
                              <xsl:for-each select="ns0:item">
                                 <ns5:item>
                                    <xsl:if test="ns0:conjunction">
                                       <ns5:conjunction>
                                          <xsl:value-of select="ns0:conjunction"/>
                                       </ns5:conjunction>
                                    </xsl:if>
                                    <ns5:upperCaseCompare>
                                       <xsl:value-of select="ns0:upperCaseCompare"/>
                                    </ns5:upperCaseCompare>
                                    <ns5:attribute>
                                       <xsl:value-of select="ns0:attribute"/>
                                    </ns5:attribute>
                                    <ns5:operator>
                                       <xsl:value-of select="ns0:operator"/>
                                    </ns5:operator>
                                    <xsl:for-each select="ns0:value">
                                       <ns5:value>
                                          <xsl:value-of select="."/>
                                       </ns5:value>
                                    </xsl:for-each>
                                 </ns5:item>
                              </xsl:for-each>
                           </ns5:group>
                        </xsl:for-each>
                     </ns5:nested>
                  </xsl:for-each>
               </ns5:filter>
            </xsl:if>
            <xsl:if test="/ns0:FindPersonRq/ns0:findCriteria/ns0:sortOrder">
               <ns5:sortOrder>
                  <xsl:for-each select="/ns0:FindPersonRq/ns0:findCriteria/ns0:sortOrder/ns0:sortAttribute">
                     <ns5:sortAttribute>
                        <ns5:name>
                           <xsl:value-of select="ns0:name"/>
                        </ns5:name>
                        <ns5:descending>
                           <xsl:value-of select="ns0:descending"/>
                        </ns5:descending>
                     </ns5:sortAttribute>
                  </xsl:for-each>
               </ns5:sortOrder>
            </xsl:if>
            <xsl:for-each select="/ns0:FindPersonRq/ns0:findCriteria/ns0:findAttribute">
               <ns5:findAttribute>
                  <xsl:value-of select="."/>
               </ns5:findAttribute>
            </xsl:for-each>
            <ns5:excludeAttribute>
               <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:excludeAttribute"/>
            </ns5:excludeAttribute>
            <xsl:for-each select="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria">
               <ns5:childFindCriteria>
                  <ns5:fetchStart>
                     <xsl:value-of select="ns0:fetchStart"/>
                  </ns5:fetchStart>
                  <ns5:fetchSize>
                     <xsl:value-of select="ns0:fetchSize"/>
                  </ns5:fetchSize>
                  <xsl:if test="ns0:filter">
                     <ns5:filter>
                        <xsl:if test="ns0:filter/ns0:conjunction">
                           <ns5:conjunction>
                              <xsl:value-of select="ns0:filter/ns0:conjunction"/>
                           </ns5:conjunction>
                        </xsl:if>
                        <xsl:for-each select="ns0:filter/ns0:group">
                           <ns5:group>
                              <xsl:if test="ns0:conjunction">
                                 <ns5:conjunction>
                                    <xsl:value-of select="ns0:conjunction"/>
                                 </ns5:conjunction>
                              </xsl:if>
                              <ns5:upperCaseCompare>
                                 <xsl:value-of select="ns0:upperCaseCompare"/>
                              </ns5:upperCaseCompare>
                              <xsl:for-each select="ns0:item">
                                 <ns5:item>
                                    <xsl:if test="ns0:conjunction">
                                       <ns5:conjunction>
                                          <xsl:value-of select="ns0:conjunction"/>
                                       </ns5:conjunction>
                                    </xsl:if>
                                    <ns5:upperCaseCompare>
                                       <xsl:value-of select="ns0:upperCaseCompare"/>
                                    </ns5:upperCaseCompare>
                                    <ns5:attribute>
                                       <xsl:value-of select="ns0:attribute"/>
                                    </ns5:attribute>
                                    <ns5:operator>
                                       <xsl:value-of select="ns0:operator"/>
                                    </ns5:operator>
                                    <xsl:for-each select="ns0:value">
                                       <ns5:value>
                                          <xsl:value-of select="."/>
                                       </ns5:value>
                                    </xsl:for-each>
                                    <xsl:if test="ns0:nested">
                                       <ns5:nested>
                                          <xsl:if test="ns0:nested/ns0:conjunction">
                                             <ns5:conjunction>
                                                <xsl:value-of select="ns0:nested/ns0:conjunction"/>
                                             </ns5:conjunction>
                                          </xsl:if>
                                          <xsl:for-each select="ns0:nested/ns0:group">
                                             <ns5:group>
                                                <xsl:if test="ns0:conjunction">
                                                   <ns5:conjunction>
                                                      <xsl:value-of select="ns0:conjunction"/>
                                                   </ns5:conjunction>
                                                </xsl:if>
                                                <ns5:upperCaseCompare>
                                                   <xsl:value-of select="ns0:upperCaseCompare"/>
                                                </ns5:upperCaseCompare>
                                                <xsl:for-each select="ns0:item">
                                                   <ns5:item>
                                                      <xsl:if test="ns0:conjunction">
                                                         <ns5:conjunction>
                                                            <xsl:value-of select="ns0:conjunction"/>
                                                         </ns5:conjunction>
                                                      </xsl:if>
                                                      <ns5:upperCaseCompare>
                                                         <xsl:value-of select="ns0:upperCaseCompare"/>
                                                      </ns5:upperCaseCompare>
                                                      <ns5:attribute>
                                                         <xsl:value-of select="ns0:attribute"/>
                                                      </ns5:attribute>
                                                      <ns5:operator>
                                                         <xsl:value-of select="ns0:operator"/>
                                                      </ns5:operator>
                                                      <xsl:for-each select="ns0:value">
                                                         <ns5:value>
                                                            <xsl:value-of select="."/>
                                                         </ns5:value>
                                                      </xsl:for-each>
                                                   </ns5:item>
                                                </xsl:for-each>
                                             </ns5:group>
                                          </xsl:for-each>
                                          <xsl:for-each select="ns0:nested/ns0:nested">
                                             <ns5:nested>
                                                <xsl:if test="ns0:conjunction">
                                                   <ns5:conjunction>
                                                      <xsl:value-of select="ns0:conjunction"/>
                                                   </ns5:conjunction>
                                                </xsl:if>
                                                <xsl:for-each select="ns0:group">
                                                   <ns5:group>
                                                      <xsl:if test="ns0:conjunction">
                                                         <ns5:conjunction>
                                                            <xsl:value-of select="ns0:conjunction"/>
                                                         </ns5:conjunction>
                                                      </xsl:if>
                                                      <ns5:upperCaseCompare>
                                                         <xsl:value-of select="ns0:upperCaseCompare"/>
                                                      </ns5:upperCaseCompare>
                                                      <xsl:for-each select="ns0:item">
                                                         <ns5:item>
                                                            <xsl:if test="ns0:conjunction">
                                                               <ns5:conjunction>
                                                                  <xsl:value-of select="ns0:conjunction"/>
                                                               </ns5:conjunction>
                                                            </xsl:if>
                                                            <ns5:upperCaseCompare>
                                                               <xsl:value-of select="ns0:upperCaseCompare"/>
                                                            </ns5:upperCaseCompare>
                                                            <ns5:attribute>
                                                               <xsl:value-of select="ns0:attribute"/>
                                                            </ns5:attribute>
                                                            <ns5:operator>
                                                               <xsl:value-of select="ns0:operator"/>
                                                            </ns5:operator>
                                                            <xsl:for-each select="ns0:value">
                                                               <ns5:value>
                                                                  <xsl:value-of select="."/>
                                                               </ns5:value>
                                                            </xsl:for-each>
                                                         </ns5:item>
                                                      </xsl:for-each>
                                                   </ns5:group>
                                                </xsl:for-each>
                                             </ns5:nested>
                                          </xsl:for-each>
                                       </ns5:nested>
                                    </xsl:if>
                                 </ns5:item>
                              </xsl:for-each>
                           </ns5:group>
                        </xsl:for-each>
                        <xsl:for-each select="ns0:filter/ns0:nested">
                           <ns5:nested>
                              <xsl:if test="ns0:conjunction">
                                 <ns5:conjunction>
                                    <xsl:value-of select="ns0:conjunction"/>
                                 </ns5:conjunction>
                              </xsl:if>
                              <xsl:for-each select="ns0:group">
                                 <ns5:group>
                                    <xsl:if test="ns0:conjunction">
                                       <ns5:conjunction>
                                          <xsl:value-of select="ns0:conjunction"/>
                                       </ns5:conjunction>
                                    </xsl:if>
                                    <ns5:upperCaseCompare>
                                       <xsl:value-of select="ns0:upperCaseCompare"/>
                                    </ns5:upperCaseCompare>
                                    <xsl:for-each select="ns0:item">
                                       <ns5:item>
                                          <xsl:if test="ns0:conjunction">
                                             <ns5:conjunction>
                                                <xsl:value-of select="ns0:conjunction"/>
                                             </ns5:conjunction>
                                          </xsl:if>
                                          <ns5:upperCaseCompare>
                                             <xsl:value-of select="ns0:upperCaseCompare"/>
                                          </ns5:upperCaseCompare>
                                          <ns5:attribute>
                                             <xsl:value-of select="ns0:attribute"/>
                                          </ns5:attribute>
                                          <ns5:operator>
                                             <xsl:value-of select="ns0:operator"/>
                                          </ns5:operator>
                                          <xsl:for-each select="ns0:value">
                                             <ns5:value>
                                                <xsl:value-of select="."/>
                                             </ns5:value>
                                          </xsl:for-each>
                                       </ns5:item>
                                    </xsl:for-each>
                                 </ns5:group>
                              </xsl:for-each>
                           </ns5:nested>
                        </xsl:for-each>
                     </ns5:filter>
                  </xsl:if>
                  <xsl:if test="ns0:sortOrder">
                     <ns5:sortOrder>
                        <xsl:for-each select="ns0:sortOrder/ns0:sortAttribute">
                           <ns5:sortAttribute>
                              <ns5:name>
                                 <xsl:value-of select="ns0:name"/>
                              </ns5:name>
                              <ns5:descending>
                                 <xsl:value-of select="ns0:descending"/>
                              </ns5:descending>
                           </ns5:sortAttribute>
                        </xsl:for-each>
                     </ns5:sortOrder>
                  </xsl:if>
                  <xsl:for-each select="ns0:findAttribute">
                     <ns5:findAttribute>
                        <xsl:value-of select="."/>
                     </ns5:findAttribute>
                  </xsl:for-each>
                  <ns5:excludeAttribute>
                     <xsl:value-of select="ns0:excludeAttribute"/>
                  </ns5:excludeAttribute>
                  <xsl:for-each select="ns0:childFindCriteria">
                     <ns5:childFindCriteria>
                        <ns5:fetchStart>
                           <xsl:value-of select="ns0:fetchStart"/>
                        </ns5:fetchStart>
                        <ns5:fetchSize>
                           <xsl:value-of select="ns0:fetchSize"/>
                        </ns5:fetchSize>
                        <xsl:if test="ns0:filter">
                           <ns5:filter>
                              <xsl:if test="ns0:filter/ns0:conjunction">
                                 <ns5:conjunction>
                                    <xsl:value-of select="ns0:filter/ns0:conjunction"/>
                                 </ns5:conjunction>
                              </xsl:if>
                              <xsl:for-each select="ns0:filter/ns0:group">
                                 <ns5:group>
                                    <xsl:if test="ns0:conjunction">
                                       <ns5:conjunction>
                                          <xsl:value-of select="ns0:conjunction"/>
                                       </ns5:conjunction>
                                    </xsl:if>
                                    <ns5:upperCaseCompare>
                                       <xsl:value-of select="ns0:upperCaseCompare"/>
                                    </ns5:upperCaseCompare>
                                    <xsl:for-each select="ns0:filter/ns0:group/ns0:item">
                                       <ns5:item>
                                          <xsl:if test="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:group/ns0:item/ns0:conjunction">
                                             <ns5:conjunction>
                                                <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:group/ns0:item/ns0:conjunction"/>
                                             </ns5:conjunction>
                                          </xsl:if>
                                          <ns5:upperCaseCompare>
                                             <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:group/ns0:item/ns0:upperCaseCompare"/>
                                          </ns5:upperCaseCompare>
                                          <ns5:attribute>
                                             <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:group/ns0:item/ns0:attribute"/>
                                          </ns5:attribute>
                                          <ns5:operator>
                                             <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:group/ns0:item/ns0:operator"/>
                                          </ns5:operator>
                                          <xsl:for-each select="ns0:filter/ns0:group/ns0:item/ns0:value">
                                             <ns5:value>
                                                <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:group/ns0:item/ns0:value"/>
                                             </ns5:value>
                                          </xsl:for-each>
                                          <xsl:if test="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:group/ns0:item/ns0:nested">
                                             <ns5:nested>
                                                <xsl:if test="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:group/ns0:item/ns0:nested/ns0:conjunction">
                                                   <ns5:conjunction>
                                                      <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:group/ns0:item/ns0:nested/ns0:conjunction"/>
                                                   </ns5:conjunction>
                                                </xsl:if>
                                             </ns5:nested>
                                          </xsl:if>
                                       </ns5:item>
                                    </xsl:for-each>
                                 </ns5:group>
                              </xsl:for-each>
                              <xsl:for-each select="ns0:filter/ns0:nested">
                                 <ns5:nested>
                                    <xsl:if test="ns0:conjunction">
                                       <ns5:conjunction>
                                          <xsl:value-of select="ns0:conjunction"/>
                                       </ns5:conjunction>
                                    </xsl:if>
                                    <xsl:for-each select="ns0:filter/ns0:nested/ns0:group">
                                       <ns5:group>
                                          <xsl:if test="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:nested/ns0:group/ns0:conjunction">
                                             <ns5:conjunction>
                                                <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:nested/ns0:group/ns0:conjunction"/>
                                             </ns5:conjunction>
                                          </xsl:if>
                                          <ns5:upperCaseCompare>
                                             <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:nested/ns0:group/ns0:upperCaseCompare"/>
                                          </ns5:upperCaseCompare>
                                          <xsl:for-each select="ns0:filter/ns0:nested/ns0:group/ns0:item">
                                             <ns5:item>
                                                <xsl:if test="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:nested/ns0:group/ns0:item/ns0:conjunction">
                                                   <ns5:conjunction>
                                                      <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:nested/ns0:group/ns0:item/ns0:conjunction"/>
                                                   </ns5:conjunction>
                                                </xsl:if>
                                                <ns5:upperCaseCompare>
                                                   <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:nested/ns0:group/ns0:item/ns0:upperCaseCompare"/>
                                                </ns5:upperCaseCompare>
                                                <ns5:attribute>
                                                   <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:nested/ns0:group/ns0:item/ns0:attribute"/>
                                                </ns5:attribute>
                                                <ns5:operator>
                                                   <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:nested/ns0:group/ns0:item/ns0:operator"/>
                                                </ns5:operator>
                                                <xsl:for-each select="ns0:filter/ns0:nested/ns0:group/ns0:item/ns0:value">
                                                   <ns5:value>
                                                      <xsl:value-of select="/ns0:FindPersonRq/ns0:findCriteria/ns0:childFindCriteria/ns0:childFindCriteria/ns0:filter/ns0:nested/ns0:group/ns0:item/ns0:value"/>
                                                   </ns5:value>
                                                </xsl:for-each>
                                             </ns5:item>
                                          </xsl:for-each>
                                       </ns5:group>
                                    </xsl:for-each>
                                 </ns5:nested>
                              </xsl:for-each>
                           </ns5:filter>
                        </xsl:if>
                        <xsl:if test="ns0:sortOrder">
                           <ns5:sortOrder>
                              <xsl:for-each select="ns0:sortOrder/ns0:sortAttribute">
                                 <ns5:sortAttribute>
                                    <ns5:name>
                                       <xsl:value-of select="ns0:name"/>
                                    </ns5:name>
                                    <ns5:descending>
                                       <xsl:value-of select="ns0:descending"/>
                                    </ns5:descending>
                                 </ns5:sortAttribute>
                              </xsl:for-each>
                           </ns5:sortOrder>
                        </xsl:if>
                        <xsl:for-each select="ns0:findAttribute">
                           <ns5:findAttribute>
                              <xsl:value-of select="."/>
                           </ns5:findAttribute>
                        </xsl:for-each>
                        <ns5:excludeAttribute>
                           <xsl:value-of select="ns0:excludeAttribute"/>
                        </ns5:excludeAttribute>
                        <ns5:childAttrName>
                           <xsl:value-of select="ns0:childAttrName"/>
                        </ns5:childAttrName>
                     </ns5:childFindCriteria>
                  </xsl:for-each>
                  <ns5:childAttrName>
                     <xsl:value-of select="ns0:childAttrName"/>
                  </ns5:childAttrName>
               </ns5:childFindCriteria>
            </xsl:for-each>
         </tns:findCriteria>
         <tns:findControl>
            <ns5:retrieveAllTranslations>
               <xsl:value-of select="/ns0:FindPersonRq/ns0:findControl/ns0:retrieveAllTranslations"/>
            </ns5:retrieveAllTranslations>
         </tns:findControl>
      </tns:findPerson>
   </xsl:template>
</xsl:stylesheet>