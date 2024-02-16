xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ass="http://soa.estrellaroja.com.mx/AssetMetricReadings";
(:: import schema at "../Schemas/AssetMetricReadings.xsd" ::)
declare namespace rep="http://soa.estrellaroja.com.mx/ReportAsset";
(:: import schema at "../Schemas/Asset_Data.xsd" ::)
declare namespace rep1="http://soa.estrellaroja.com.mx/ReportReadings";
(:: import schema at "../Schemas/Readings_Data.xsd" ::)
declare namespace eop="http://xmlns.oracle.com/pcbpel/adapter/db/EAMOriginPriority";
(:: import schema at "../Schemas/OriginPriority/EAMOriginPriority.xsd" ::)
declare namespace esr="http://xmlns.oracle.com/pcbpel/adapter/db/EAMSelectRecordBS";
(:: import schema at "../Schemas/ErrorRecord/EAMSelectRecordBS.xsd" ::)
declare namespace eam="http://xmlns.oracle.com/pcbpel/adapter/db/top/EAMInsertErrorRecord";
(:: import schema at "../Schemas/ErrorRecord/EAMInsertErrorRecord_table.xsd" ::)

declare variable $AssetMetricReadingsVar as element() (:: schema-element(ass:AssetMetricReading) ::) external;
declare variable $Asset_DATAVar as element() (:: schema-element(rep:DATA_DS) ::) external;
declare variable $Readings_DATAVar as element() (:: schema-element(rep1:DATA_DS) ::) external;
declare variable $Out_OriginPriority as element() (:: schema-element(eop:EAMOriginPriorityOutputCollection) ::) external;
declare variable $EAMSelectRecordRs as element() (:: schema-element(esr:EAMSelectRecordBSOutputCollection) ::) external;
declare variable $v_name_medidor as xs:string external;

declare function local:funcXqtransform_validateerp($AssetMetricReadingsVar as element() (:: schema-element(ass:AssetMetricReading) ::), 
                                                   $Asset_DATAVar as element() (:: schema-element(rep:DATA_DS) ::), 
                                                   $Readings_DATAVar as element() (:: schema-element(rep1:DATA_DS) ::), 
                                                   $Out_OriginPriority as element() (:: schema-element(eop:EAMOriginPriorityOutputCollection) ::), 
                                                   $EAMSelectRecordRs as element() (:: schema-element(esr:EAMSelectRecordBSOutputCollection) ::))
                                                   as element() (:: schema-element(eam:XxerEamErrorLogCollection) ::) {
    <eam:XxerEamErrorLogCollection>
        {
            for $Reading in $AssetMetricReadingsVar/ass:Reading
            return 
            if(count($Asset_DATAVar/rep:G_1[$Reading/ass:assetNumber= rep:ASSET_NUMBER]/rep:ASSET_NUMBER)=0)
            then
                <eam:XxerEamErrorLog>                
                <eam:assetNumber>{fn:data($Reading/ass:assetNumber)}</eam:assetNumber>
                <eam:readingDate>{fn:data($Reading/ass:Records[1]/ass:readingDate)}</eam:readingDate>
                <eam:readingValue>{fn:data($Reading/ass:Records[1]/ass:readingValue)}</eam:readingValue>
                <eam:readingDateOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:readingDateOracle>
                <eam:readingValueOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)}</eam:readingValueOracle>
                <eam:readingDateCloud>{fn:data($Reading/ass:Records[1]/ass:readingDate)}</eam:readingDateCloud>
                <eam:readingValueCloud>{fn:data($Reading/ass:Records[1]/ass:readingValue)}</eam:readingValueCloud>
                <eam:readingDateCal>{fn:data($Reading/ass:Records[1]/ass:readingDate)}</eam:readingDateCal>
                <eam:readingValueCal>{fn:data($Reading/ass:Records[1]/ass:readingValue)}</eam:readingValueCal>
                <eam:difDates>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES)}</eam:difDates>
                <eam:priority>{fn:data(0)}</eam:priority>
                <eam:meterName>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:meterName>
                <eam:description>{1}</eam:description>
                <eam:errorMessage>El activo no se encuentra registrado en Oracle Fusion</eam:errorMessage>
                <eam:origin>{fn:data($Reading/ass:Records[1]/ass:origin)}</eam:origin>
                </eam:XxerEamErrorLog> 
                
                
            else(
            if(count($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor]/rep1:ASSET_NUMBER )=0)
            then
                <eam:XxerEamErrorLog>
                <eam:assetNumber>{fn:data($Reading/ass:assetNumber)}</eam:assetNumber>
                <eam:readingDate>{fn:data($Reading/ass:Records[1]/ass:readingDate)}</eam:readingDate>
                <eam:readingValue>{fn:data($Reading/ass:Records[1]/ass:readingValue)}</eam:readingValue>
                <eam:readingDateOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:readingDateOracle>
                <eam:readingValueOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)}</eam:readingValueOracle>
                <eam:readingDateCloud>{fn:data($Reading/ass:Records[1]/ass:readingDate)}</eam:readingDateCloud>
                <eam:readingValueCloud>{fn:data($Reading/ass:Records[1]/ass:readingValue)}</eam:readingValueCloud>
                <eam:readingDateCal>{fn:data($Reading/ass:Records[1]/ass:readingDate)}</eam:readingDateCal>
                <eam:readingValueCal>{fn:data($Reading/ass:Records[1]/ass:readingValue)}</eam:readingValueCal>
                <eam:difDates>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES)}</eam:difDates>
                <eam:priority>{fn:data(0)}</eam:priority>
                <eam:meterName>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:meterName>
                <eam:description>{1}</eam:description>
                <eam:errorMessage>El activo no esta asociado a un medidor configurado en la integracion</eam:errorMessage>
                <eam:origin>{fn:data($Reading/ass:Records[1]/ass:origin)}</eam:origin>
                </eam:XxerEamErrorLog>  
            else(
             if(
                 
                  count($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER =$Reading/ass:assetNumber and rep1:NAME = $v_name_medidor]/rep1:ACTIVE_END_DATE ) > 0
              
                 
             )
            then
            <eam:XxerEamErrorLog>
                <eam:assetNumber>{fn:data($Reading/ass:assetNumber)}</eam:assetNumber>
                <eam:readingDate>{fn:data($Reading/ass:Records[1]/ass:readingDate)}</eam:readingDate>
                <eam:readingValue>{fn:data($Reading/ass:Records[1]/ass:readingValue)}</eam:readingValue>
                <eam:readingDateOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:readingDateOracle>
                <eam:readingValueOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)}</eam:readingValueOracle>
                <eam:readingDateCloud>{fn:data($Reading/ass:Records[1]/ass:readingDate)}</eam:readingDateCloud>
                <eam:readingValueCloud>{fn:data($Reading/ass:Records[1]/ass:readingValue)}</eam:readingValueCloud>
                <eam:readingDateCal>{fn:data($Reading/ass:Records[1]/ass:readingDate)}</eam:readingDateCal>
                <eam:readingValueCal>{fn:data($Reading/ass:Records[1]/ass:readingValue)}</eam:readingValueCal>
                <eam:difDates>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES)}</eam:difDates>
                <eam:priority>{fn:data(0)}</eam:priority>
                <eam:meterName>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:meterName>
                <eam:description>{1}</eam:description>
                <eam:errorMessage>El activo no esta asociado a un medidor activo</eam:errorMessage>
                <eam:origin>{fn:data($Reading/ass:Records[1]/ass:origin)}</eam:origin>
                </eam:XxerEamErrorLog>               
            else(
             if (count($Out_OriginPriority/eop:EAMOriginPriorityOutput[eop:ASSET_NUMBER= $Reading/ass:assetNumber])>0)
                    then 
      (:------- Bloque para validar  prioridad -----:) 
                     for $OriginPrioritys in $Out_OriginPriority/eop:EAMOriginPriorityOutput[eop:ASSET_NUMBER= $Reading/ass:assetNumber]
                     return 
                           for $Record in $Reading/ass:Records[ass:origin=$OriginPrioritys/eop:ORIGIN]
                           return 
                      if(
             $Record/ass:readingDate               
                 <
              $Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER =$Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA
             )
            then
            
            <eam:XxerEamErrorLog>
                <eam:assetNumber>{fn:data($Reading/ass:assetNumber)}</eam:assetNumber>
                <eam:readingDate>{fn:data($Record/ass:readingDate)}</eam:readingDate>
                <eam:readingValue>{fn:data($Record/ass:readingValue)}</eam:readingValue>
                <eam:readingDateOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:readingDateOracle>
                <eam:readingValueOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)}</eam:readingValueOracle>
                <eam:readingDateCloud>{fn:data($Record/ass:readingDate)}</eam:readingDateCloud>
                <eam:readingValueCloud>{fn:data($Record/ass:readingValue)}</eam:readingValueCloud>
                <eam:readingDateCal>{fn:data($Record/ass:readingDate)}</eam:readingDateCal>
                <eam:readingValueCal>{fn:round(fn:data($Record/ass:readingValue)*10) div 10}</eam:readingValueCal>
                <eam:difDates>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES)}</eam:difDates>
                <eam:priority>{fn:data(0)}</eam:priority>
                <eam:meterName>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:meterName>
                <eam:description>{10}</eam:description>
                <eam:errorMessage>Error de validación, la fecha de carga es menor al último registro existente en Oracle Fusion</eam:errorMessage>
                <eam:origin>{fn:data($Record/ass:origin)}</eam:origin>
                </eam:XxerEamErrorLog>
           
            else(
             (:------- Bloque para definir escenario 1-----:) 
            if (number($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO) = 0)
            then
            <eam:XxerEamErrorLog>
                <eam:assetNumber>{fn:data($Reading/ass:assetNumber)}</eam:assetNumber>
                <eam:readingDate>{fn:data($Record/ass:readingDate)}</eam:readingDate>
                <eam:readingValue>{fn:data($Record/ass:readingValue)}</eam:readingValue>
                <eam:readingDateOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:readingDateOracle>
                <eam:readingValueOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)}</eam:readingValueOracle>
                <eam:readingDateCloud>{fn:data($Record/ass:readingDate)}</eam:readingDateCloud>
                <eam:readingValueCloud>{fn:data($Record/ass:readingValue)}</eam:readingValueCloud>
                <eam:readingDateCal>{fn:data($Record/ass:readingDate)}</eam:readingDateCal>
                <eam:readingValueCal>{fn:round(fn:data($Record/ass:readingValue)*10) div 10}</eam:readingValueCal>
                <eam:difDates>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES)}</eam:difDates>
                <eam:priority>{fn:data(0)}</eam:priority>
                <eam:meterName>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:meterName>
                <eam:description>{10}</eam:description>
                <eam:errorMessage>Success</eam:errorMessage>
                <eam:origin>{fn:data($Record/ass:origin)}</eam:origin>
                </eam:XxerEamErrorLog>
                (:-------FIN Bloque para definir escenario 1-----:) 
                
                else (
                (:------- Bloque para definir escenario 2-----:) 
                if (number($Record/ass:readingValue) > number($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)  )
            then
            <eam:XxerEamErrorLog>
                <eam:assetNumber>{fn:data($Reading/ass:assetNumber)}</eam:assetNumber>
                <eam:readingDate>{fn:data($Record/ass:readingDate)}</eam:readingDate>
                <eam:readingValue>{fn:data($Record/ass:readingValue)}</eam:readingValue>
                <eam:readingDateOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:readingDateOracle>
                <eam:readingValueOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)}</eam:readingValueOracle>
                <eam:readingDateCloud>{fn:data($Record/ass:readingDate)}</eam:readingDateCloud>
                <eam:readingValueCloud>{fn:data($Record/ass:readingValue)}</eam:readingValueCloud>
                <eam:readingDateCal>{fn:data($Record/ass:readingDate)}</eam:readingDateCal>
                <eam:readingValueCal>{fn:round((number($Record/ass:readingValue) - number($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO))*10) div 10}</eam:readingValueCal>
                <eam:difDates>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES)}</eam:difDates>
                <eam:priority>{fn:data(0)}</eam:priority>
                <eam:meterName>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:meterName>
                <eam:description>{20}</eam:description>
                <eam:errorMessage>Success</eam:errorMessage>
                <eam:origin>{fn:data($Record/ass:origin)}</eam:origin>
                </eam:XxerEamErrorLog>
                
                (:-------FIN Bloque para definir escenario 2-----:) 
                
                else(
                                (:------- Bloque para definir escenario 3-----:) 
                if (count($EAMSelectRecordRs/esr:EAMSelectRecordBSOutput[esr:ASSET_NUMBER=$Reading/ass:assetNumber])=0)
            then
            <eam:XxerEamErrorLog>
                <eam:assetNumber>{fn:data($Reading/ass:assetNumber)}</eam:assetNumber>
                <eam:readingDate>{fn:data($Record/ass:readingDate)}</eam:readingDate>
                <eam:readingValue>{fn:data($Record/ass:readingValue)}</eam:readingValue>
                <eam:readingDateOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:readingDateOracle>
                <eam:readingValueOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)}</eam:readingValueOracle>
                <eam:readingDateCloud>{fn:data($Record/ass:readingDate)}</eam:readingDateCloud>
                <eam:readingValueCloud>{fn:data($Record/ass:readingValue)}</eam:readingValueCloud>
                <eam:readingDateCal>{fn:data($Record/ass:readingDate)}</eam:readingDateCal>
                <eam:readingValueCal>{fn:round((number($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO) div  number($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES))*10) div 10}</eam:readingValueCal>
                <eam:difDates>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES)}</eam:difDates>
                <eam:priority>{fn:data(0)}</eam:priority>
                <eam:meterName>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:meterName>
                <eam:description>{30}</eam:description>
                <eam:errorMessage>Success</eam:errorMessage>
                <eam:origin>{fn:data($Record/ass:origin)}</eam:origin>
                </eam:XxerEamErrorLog>
                (:-------FIN Bloque para definir escenario 3-----:) 
                
                else(
               (:------- Bloque para definir escenario 4-----:) 
                if (number($EAMSelectRecordRs/esr:EAMSelectRecordBSOutput[esr:ASSET_NUMBER=$Reading/ass:assetNumber]/esr:READING_VALUE_CLOUD) > number($Record/ass:readingValue))
            then
            <eam:XxerEamErrorLog>
                <eam:assetNumber>{fn:data($Reading/ass:assetNumber)}</eam:assetNumber>
                <eam:readingDate>{fn:data($Record/ass:readingDate)}</eam:readingDate>
                <eam:readingValue>{fn:data($Record/ass:readingValue)}</eam:readingValue>
                <eam:readingDateOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:readingDateOracle>
                <eam:readingValueOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)}</eam:readingValueOracle>
                <eam:readingDateCloud>{fn:data($Record/ass:readingDate)}</eam:readingDateCloud>
                <eam:readingValueCloud>{fn:data($Record/ass:readingValue)}</eam:readingValueCloud>
                <eam:readingDateCal>{fn:data($Record/ass:readingDate)}</eam:readingDateCal>
                <eam:readingValueCal>{fn:round((number($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO) div  number($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES))*10) div 10}</eam:readingValueCal>
                <eam:difDates>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES)}</eam:difDates>
                <eam:priority>{fn:data(0)}</eam:priority>
                <eam:meterName>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:meterName>
                <eam:description>{40}</eam:description>
                <eam:errorMessage>Success</eam:errorMessage>
                <eam:origin>{fn:data($Record/ass:origin)}</eam:origin>
                </eam:XxerEamErrorLog>
                
                (:-------FIN Bloque para definir escenario 4-----:) 
                
                else(
                   (:------- Bloque para definir escenario 5-----:) 
            <eam:XxerEamErrorLog>
                <eam:assetNumber>{fn:data($Reading/ass:assetNumber)}</eam:assetNumber>
                <eam:readingDate>{fn:data($Record/ass:readingDate)}</eam:readingDate>
                <eam:readingValue>{fn:data($Record/ass:readingValue)}</eam:readingValue>
                <eam:readingDateOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:readingDateOracle>
                <eam:readingValueOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)}</eam:readingValueOracle>
                <eam:readingDateCloud>{fn:data($Record/ass:readingDate)}</eam:readingDateCloud>
                <eam:readingValueCloud>{fn:data($Record/ass:readingValue)}</eam:readingValueCloud>
                <eam:readingDateCal>{fn:data($Record/ass:readingDate)}</eam:readingDateCal>
                <eam:readingValueCal>{fn:round((number($Record/ass:readingValue) -  number($EAMSelectRecordRs/esr:EAMSelectRecordBSOutput[esr:ASSET_NUMBER=$Reading/ass:assetNumber]/esr:READING_VALUE_CLOUD))*10) div 10}</eam:readingValueCal>
                <eam:difDates>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES)}</eam:difDates>
                <eam:priority>{fn:data(0)}</eam:priority>
                <eam:meterName>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:meterName>
                <eam:description>{50}</eam:description>
                <eam:errorMessage>Success</eam:errorMessage>
                <eam:origin>{fn:data($Record/ass:origin)}</eam:origin>
                </eam:XxerEamErrorLog>
                (:-------FIN Bloque para definir escenario 5-----:) 
                )
                )
                )
                )
                )
      (:-------FIN Bloque para validar prioridad -----:) 
                    else (
      (:------- Bloque para validar sin prioridad -----:)          
          for $Record in $Reading/ass:Records[last()]
            return 
             if(
             $Record/ass:readingDate < $Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER =$Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA
             )
            then
            
            <eam:XxerEamErrorLog>
                <eam:assetNumber>{fn:data($Reading/ass:assetNumber)}</eam:assetNumber>
                <eam:readingDate>{fn:data($Record/ass:readingDate)}</eam:readingDate>
                <eam:readingValue>{fn:data($Record/ass:readingValue)}</eam:readingValue>
                <eam:readingDateOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:readingDateOracle>
                <eam:readingValueOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)}</eam:readingValueOracle>
                <eam:readingDateCloud>{fn:data($Record/ass:readingDate)}</eam:readingDateCloud>
                <eam:readingValueCloud>{fn:data($Record/ass:readingValue)}</eam:readingValueCloud>
                <eam:readingDateCal>{fn:data($Record/ass:readingDate)}</eam:readingDateCal>
                <eam:readingValueCal>{fn:round(fn:data($Record/ass:readingValue)*10) div 10}</eam:readingValueCal>
                <eam:difDates>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES)}</eam:difDates>
                <eam:priority>{fn:data(0)}</eam:priority>
                <eam:meterName>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:meterName>
                <eam:description>{1}</eam:description>
                <eam:errorMessage>Error de validación, la fecha de carga es menor al último registro existente en Oracle Fusion</eam:errorMessage>
                <eam:origin>{fn:data($Record/ass:origin)}</eam:origin>
                </eam:XxerEamErrorLog>
           
            else(
             (:------- Bloque para definir escenario 1-----:) 
            if (number($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO) = 0)
            then
            <eam:XxerEamErrorLog>
                <eam:assetNumber>{fn:data($Reading/ass:assetNumber)}</eam:assetNumber>
                <eam:readingDate>{fn:data($Record/ass:readingDate)}</eam:readingDate>
                <eam:readingValue>{fn:data($Record/ass:readingValue)}</eam:readingValue>
                <eam:readingDateOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:readingDateOracle>
                <eam:readingValueOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)}</eam:readingValueOracle>
                <eam:readingDateCloud>{fn:data($Record/ass:readingDate)}</eam:readingDateCloud>
                <eam:readingValueCloud>{fn:data($Record/ass:readingValue)}</eam:readingValueCloud>
                <eam:readingDateCal>{fn:data($Record/ass:readingDate)}</eam:readingDateCal>
                <eam:readingValueCal>{fn:round(fn:data($Record/ass:readingValue)*10) div 10}</eam:readingValueCal>
                <eam:difDates>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES)}</eam:difDates>
                <eam:priority>{fn:data(0)}</eam:priority>
                <eam:meterName>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:meterName>
                <eam:description>{1}</eam:description>
                <eam:errorMessage>Success</eam:errorMessage>
                <eam:origin>{fn:data($Record/ass:origin)}</eam:origin>
                </eam:XxerEamErrorLog>
                (:-------FIN Bloque para definir escenario 1-----:) 
                
                else (
                (:------- Bloque para definir escenario 2-----:) 
                if (number($Record/ass:readingValue) > number($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)  )
            then
            <eam:XxerEamErrorLog>
                <eam:assetNumber>{fn:data($Reading/ass:assetNumber)}</eam:assetNumber>
                <eam:readingDate>{fn:data($Record/ass:readingDate)}</eam:readingDate>
                <eam:readingValue>{fn:data($Record/ass:readingValue)}</eam:readingValue>
                <eam:readingDateOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:readingDateOracle>
                <eam:readingValueOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)}</eam:readingValueOracle>
                <eam:readingDateCloud>{fn:data($Record/ass:readingDate)}</eam:readingDateCloud>
                <eam:readingValueCloud>{fn:data($Record/ass:readingValue)}</eam:readingValueCloud>
                <eam:readingDateCal>{fn:data($Record/ass:readingDate)}</eam:readingDateCal>
                <eam:readingValueCal>{fn:round((number($Record/ass:readingValue) - number($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO))*10) div 10 }</eam:readingValueCal>
                <eam:difDates>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES)}</eam:difDates>
                <eam:priority>{fn:data(0)}</eam:priority>
                <eam:meterName>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:meterName>
                <eam:description>{2}</eam:description>
                <eam:errorMessage>Success</eam:errorMessage>
                <eam:origin>{fn:data($Record/ass:origin)}</eam:origin>
                </eam:XxerEamErrorLog>
                (:-------FIN Bloque para definir escenario 2-----:) 
                else(
                                (:------- Bloque para definir escenario 3-----:) 
                if (count($EAMSelectRecordRs/esr:EAMSelectRecordBSOutput[esr:ASSET_NUMBER=$Reading/ass:assetNumber])=0)
            then
            <eam:XxerEamErrorLog>
                <eam:assetNumber>{fn:data($Reading/ass:assetNumber)}</eam:assetNumber>
                <eam:readingDate>{fn:data($Record/ass:readingDate)}</eam:readingDate>
                <eam:readingValue>{fn:data($Record/ass:readingValue)}</eam:readingValue>
                <eam:readingDateOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:readingDateOracle>
                <eam:readingValueOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)}</eam:readingValueOracle>
                <eam:readingDateCloud>{fn:data($Record/ass:readingDate)}</eam:readingDateCloud>
                <eam:readingValueCloud>{fn:data($Record/ass:readingValue)}</eam:readingValueCloud>
                <eam:readingDateCal>{fn:data($Record/ass:readingDate)}</eam:readingDateCal>
                <eam:readingValueCal>{fn:round((number($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO) div  number($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES))*10) div 10}</eam:readingValueCal>
                <eam:difDates>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES)}</eam:difDates>
                <eam:priority>{fn:data(0)}</eam:priority>
                <eam:meterName>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:meterName>
                <eam:description>{3}</eam:description>
                <eam:errorMessage>Success</eam:errorMessage>
                <eam:origin>{fn:data($Record/ass:origin)}</eam:origin>
                </eam:XxerEamErrorLog>
                (:-------FIN Bloque para definir escenario 3-----:) 
                
                else(
               (:------- Bloque para definir escenario 4-----:) 
                if (number($EAMSelectRecordRs/esr:EAMSelectRecordBSOutput[esr:ASSET_NUMBER=$Reading/ass:assetNumber]/esr:READING_VALUE_CLOUD) > number($Record/ass:readingValue))
            then
            <eam:XxerEamErrorLog>
                <eam:assetNumber>{fn:data($Reading/ass:assetNumber)}</eam:assetNumber>
                <eam:readingDate>{fn:data($Record/ass:readingDate)}</eam:readingDate>
                <eam:readingValue>{fn:data($Record/ass:readingValue)}</eam:readingValue>
                <eam:readingDateOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:readingDateOracle>
                <eam:readingValueOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)}</eam:readingValueOracle>
                <eam:readingDateCloud>{fn:data($Record/ass:readingDate)}</eam:readingDateCloud>
                <eam:readingValueCloud>{fn:data($Record/ass:readingValue)}</eam:readingValueCloud>
                <eam:readingDateCal>{fn:data($Record/ass:readingDate)}</eam:readingDateCal>
                <eam:readingValueCal>{fn:round((number($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO) div  number($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES))*10) div 10}</eam:readingValueCal>
                <eam:difDates>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES)}</eam:difDates>
                <eam:priority>{fn:data(0)}</eam:priority>
                <eam:meterName>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:meterName>
                <eam:description>{4}</eam:description>
                <eam:errorMessage>Success</eam:errorMessage>
                <eam:origin>{fn:data($Record/ass:origin)}</eam:origin>
                </eam:XxerEamErrorLog>
                
                (:-------FIN Bloque para definir escenario 4-----:) 
                
                else(
                   (:------- Bloque para definir escenario 5-----:) 
            <eam:XxerEamErrorLog>
                <eam:assetNumber>{fn:data($Reading/ass:assetNumber)}</eam:assetNumber>
                <eam:readingDate>{fn:data($Record/ass:readingDate)}</eam:readingDate>
                <eam:readingValue>{fn:data($Record/ass:readingValue)}</eam:readingValue>
                <eam:readingDateOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:readingDateOracle>
                <eam:readingValueOracle>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:VALOR_MOSTRADO)}</eam:readingValueOracle>
                <eam:readingDateCloud>{fn:data($Record/ass:readingDate)}</eam:readingDateCloud>
                <eam:readingValueCloud>{fn:data($Record/ass:readingValue)}</eam:readingValueCloud>
                <eam:readingDateCal>{fn:data($Record/ass:readingDate)}</eam:readingDateCal>
                <eam:readingValueCal>{fn:round((number($Record/ass:readingValue) -  number($EAMSelectRecordRs/esr:EAMSelectRecordBSOutput[esr:ASSET_NUMBER=$Reading/ass:assetNumber]/esr:READING_VALUE_CLOUD))*10) div 10}</eam:readingValueCal>
                <eam:difDates>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:DIF_DATES)}</eam:difDates>
                <eam:priority>{fn:data(0)}</eam:priority>
                <eam:meterName>{fn:data($Readings_DATAVar/rep1:G_2[rep1:ASSET_NUMBER = $Reading/ass:assetNumber and rep1:NAME = $v_name_medidor][1]/rep1:FECHA)}</eam:meterName>
                <eam:description>{5}</eam:description>
                <eam:errorMessage>Success</eam:errorMessage>
                <eam:origin>{fn:data($Record/ass:origin)}</eam:origin>
                </eam:XxerEamErrorLog>
                (:-------FIN Bloque para definir escenario 5-----:) 
                )
                )
                )
                )
            )
      (:------- FIN Bloque para validar sin prioridad -----:) 
             )

           )
           )
            )
        }
    </eam:XxerEamErrorLogCollection>
};

local:funcXqtransform_validateerp($AssetMetricReadingsVar, $Asset_DATAVar, $Readings_DATAVar , $Out_OriginPriority,$EAMSelectRecordRs)
