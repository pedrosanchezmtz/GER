
      qry :=
         ' Select fac.no_guia'
      || ' ,REPLACE(fac.num_guia,''700000'',''DL'') FAC_NUMERO'
      || ' ,TO_CHAR(FAC.FECHA_INGRESO,''DD/MM/YYYY'') FECHA '
      || ' ,CLI.NOMBRE'
      || ' ,CLI.RFC'
      || ' ,''DLIVER'' sucursal'
      || ' ,fac.tipo_cobro'
      || ' ,TFE.num_guia'
      ||', TFE.folio || ''|'' || CLI.RFC || ''|'' || TFE.uuid || ''|'' || TFE.serie || ''|'' || FAC.subtotal || ''|'' || FAC.iva_guia || ''|'' || fac.monto_retencion || ''|0|0|'' || (fac.subtotal+fac.iva_guia-fac.monto_retencion) || ''|1'' '
      || ' From ZAM_TRAFICO_GUIA FAC'
      || ' ,ZAM_TRAFICO_CLIENTE cli'
      || ' ,ZAM_TRAFICO_FACTURA_ELECTRON TFE'  
      || ' Where FAC.ID_CLIENTE  = CLI.ID_CLIENTE '
      || ' And fac.REPLICADO_AR = ''N''  ' -- TEMPORAL 130419
      || ' And fac.id_area_facturacion IN ( ''1'',''0'')'
      || ' And fac.no_viaje = ''0'' '
      || ' And fac.tipo_doc =''1''  '
      || ' And fac.STATUS_GUIA = ''C''  '
      || ' and FAC.FOLIO_FACTURA Is Null '
      || ' And FAC.no_guia = TFE.no_guia'
      --|| ' And TO_CHAR(FAC.FECHA_INGRESO,''RRRR/MM'') = ''2019/03'' '; -- TEMPORAL 130419
      || ' And FAC.num_guia = TFE.num_guia'
      -- || ' And FAC.num_guia = ''VER-19627'' '
      || ' And to_char(TFE.FECHA_INGRESO,''DD/MM/RRRR'') = '''||P_FECHA_PROCESO||''' '
      || ' AND not exists (select 1 '
      || '            from ZAM_TRAFICO_FACTURA_ELECTRON TFE2 '
      || '           where TFE2.num_guia = TFE.num_guia '
      || '             and TFE2.status_cancel = 5) ';

-----------------------------------------------------------------------
qry :=
            ' Select fac."no_guia"'
      || ' ,REPLACE(fac."num_guia",''700000'',''DL'') FAC_NUMERO'
      || ' ,TO_CHAR(FAC."fecha_ingreso",''DD/MM/YYYY'') FECHA '
      || ' ,cli."nombre"'
      || ' ,cli."rfc"'
      || ' ,''DLIVER'' sucursal'
      || ' ,fac."tipo_cobro"'
      || ' ,TFE."num_guia"'
      ||', TFE."folio" || ''|'' || cli."rfc" || ''|'' || TFE."uuid" || ''|'' || TFE."serie" || ''|'' || FAC."subtotal" || ''|'' || FAC."iva_guia" || ''|'' || fac."monto_retencion" || ''|0|0|'' || (fac."subtotal"+fac."iva_guia"-fac."monto_retencion") || ''|1'' '
      || ' From TRAFICO_GUIA@hsmssqldlv.estrellaroja.com.mx fac'
      || ' ,TRAFICO_CLIENTE@hsmssqldlv.estrellaroja.com.mx cli'
      || ' ,TRAFICO_FACTURA_ELECTRONICA@hsmssqldlv.estrellaroja.com.mx TFE'  
      || ' Where fac."id_cliente"  = cli."id_cliente" '
      --|| ' And fac.REPLICADO_AR = ''N''  ' -- TEMPORAL 130419
      || ' And fac."num_guia" IN (''VER-24566'') ' -- TEMPORAL 130419
      || ' And fac."id_area_facturacion" IN ( ''1'',''0'') '
      || ' And fac."no_viaje" = ''0'' '
      || ' And fac."tipo_doc" =''1''  '
      || ' And fac."status_guia" = ''C''  '
      --|| ' and FAC."FOLIO_FACTURA" Is Null '
      || ' And fac."no_guia" = TFE."no_guia"'
      --|| ' And TRUNC(FAC.FECHA_INGRESO) >= TO_DATE(''2022/01/01'',''RRRR/MM/DD'')' -- TEMPORAL 130419
	  || ' AND not exists (select 1 '
      || '            from iner_xxer_puente_header_tbl tp  '
      || '           where tp.numero_documento = TFE."num_guia" ) '	  
      || ' AND not exists (select 1 '
      || '            from TRAFICO_FACTURA_ELECTRONICA@hsmssqldlv.estrellaroja.com.mx TFE2 '
      || '           where TFE2."num_guia" = TFE."num_guia" '
      || '             and TFE2."status_cancel" = 5) ';
	  
	  
	  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	  
	  	Select fac.no_guia
      ,REPLACE(fac.num_guia,'700000','DL') FAC_NUMERO
      ,TO_CHAR(FAC.FECHA_INGRESO,'DD/MM/YYYY') FECHA 
      ,CLI.NOMBRE
      ,CLI.RFC
      ,'DLIVER' sucursal
      ,fac.tipo_cobro
      ,TFE.num_guia
      , TFE.folio || CLI.RFC || TFE.uuid || TFE.serie ||FAC.subtotal || FAC.iva_guia ||fac.monto_retencion ||0||0||(fac.subtotal+fac.iva_guia-fac.monto_retencion) ||1
       From ZAM_TRAFICO_GUIA FAC
      ,ZAM_TRAFICO_CLIENTE cli
     ,ZAM_TRAFICO_FACTURA_ELECTRON TFE 
      Where FAC.ID_CLIENTE  = CLI.ID_CLIENTE
     --And fac.REPLICADO_AR = 'N' -- TEMPORAL 130419
     And FAC.num_guia IN ('VERP-234') -- TEMPORAL 130419
     And fac.id_area_facturacion in ( '1','0')
     And fac.no_viaje = '0'
     And fac.tipo_doc ='1'
     And fac.STATUS_GUIA = 'C' 
     and FAC.FOLIO_FACTURA Is Null 
     And FAC.no_guia = TFE.no_guia
     --And TO_CHAR(FAC.FECHA_INGRESO,'RRRR/MM/DD') = '2021/03/30' -- TEMPORAL 130419
     And FAC.num_guia = TFE.num_guia
	 AND not exists (select 1 
               from ZAM_TRAFICO_FACTURA_ELECTRON TFE2 
              where TFE2.num_guia = TFE.num_guia 
                 and TFE2.status_cancel = 5) ;
	  
	  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	select fac."no_guia"
      ,replace(fac."num_guia",'700000','DL') fac_numero
      ,to_char(fac."fecha_ingreso",'DD/MM/YYYY') fecha 
      ,cli."nombre"
      ,cli."rfc"
      ,'DLIVER' sucursal
      ,fac."tipo_cobro"
      ,tfe."num_guia"
      , tfe."folio" || cli."rfc" || tfe."uuid" || tfe."serie" ||fac."subtotal" || fac."iva_guia" ||fac."monto_retencion" ||0||0||(fac."subtotal"+fac."iva_guia"-fac."monto_retencion") ||1
       
       
       select count(fac."no_guia")
       from trafico_guia@hsmssqldlv.estrellaroja.com.mx fac
      ,trafico_cliente@hsmssqldlv.estrellaroja.com.mx cli
     ,trafico_factura_electronica@hsmssqldlv.estrellaroja.com.mx tfe 
      where fac."id_cliente"  = cli."id_cliente"
     --And fac.REPLICADO_AR = 'N' -- TEMPORAL 130419
    --and fac."num_guia" in ('VERP-3289')--,'VER-23531','VER-23532','VER-23534','VER-23535','VER-23536','VER-23547','VER-23538') -- TEMPORAL 130419
     and fac."id_area_facturacion" in( '1','0')
     and fac."no_viaje" = '0'
     and fac."tipo_doc" ='1'
     and fac."status_guia" = 'C' 
     --and tfe."uuid"!=''
     and tfe."status"='2'
     --and FAC."folio_factura" Is Null 
     and fac."no_guia" = tfe."no_guia"
     And TO_CHAR(fac."fecha_ingreso",'RRRR/MM/DD')>= '2021/02/01' -- TEMPORAL 130419
     and fac."num_guia" = tfe."num_guia"
	 --and not exists (select 1               from  iner_xxer_puente_header_tbl tp           where tp.numero_documento = tfe."num_guia") 
    and not exists (select 1 
                 from  iner_xxer_puente_header_tbl tp 
                where tp.numero_documento = tfe."num_guia")
     and not exists (select 1 
               from trafico_factura_electronica@hsmssqldlv.estrellaroja.com.mx tfe2 
              where tfe2."num_guia" = tfe."num_guia" 
                 and tfe2."status_cancel" = 5) ;
----------------------------------------------------------------------------------------------------------------------------------------------------------

         qrylineas :=
                      'SELECT TG.NO_GUIA TRX_LINE_ID,'
                       ||'      NVL (TOP.DESC_PRODUCTO, ''NO USAR'') CONCEPTO,'
                       ||'      ''FLETE_''|| NVL (gui.num_guia, TG.num_guia)||''_''||TO_CHAR (SYSDATE, ''DD/MM/RRRR'') description,'
                       ||'      to_number(nvl(GUI.flete,tg.flete),''99999999.999999'') unit_selling_price,'
                       ||'      to_number(nvl(GUI.iva_guia,tg.iva_guia) - NVL((select sum(tgo.monto_iva_otro) from ZAM_TRAFICO_GUIA_OTRO tgo where tgo.no_guia = GUI.no_guia),0),''99999999.999999'') MONTO_IVA,'
                       ||'      to_number(nvl(GUI.monto_retencion,tg.monto_retencion) - NVL((select sum(tgo.monto_retencion) from ZAM_TRAFICO_GUIA_OTRO tgo where tgo.no_guia = GUI.no_guia),0),''99999999.999999'') MONTO_IVA_RETENIDO,'
                       ||'      DECODE(TIPO_IVA,''IVA 16%'',''AR_IVA16'',''IVA 11%'',''AR_IVA11'',''IVA Exento'',''AR_IVA_EXENTO'') strCodigoIva,'
                       ||'      DECODE(RET.DESCRIPCION,''Retencion del 4%'',''AR_RET04'') strcodigoretencion,'
                       ||'      (IV.FACTOR_IVA *100) strCodigoIva,'
                       ||'      (RET.FACTOR_RETENCION*100) strCodigoRetencion,'
                       ||'      SUBSTR(GUI.num_guia,1,INSTR(GUI.num_guia,''-'')-1) strOrigenServicio '
                       ||'     FROM ZAM_TRAFICO_GUIA TG,'
                       ||'      ZAM_TRAFICO_GUIA GUI,'
                       ||'      ZAM_TRAFICO_PRODUCTO top,'
                       ||'      ZAM_GENERAL_IVAS iv,'
                       ||'      ZAM_GENERAL_RETENCIONES ret'
                       ||'      WHERE     1 = 1'
                             --and tg.no_guia = ' 9299 ''
                       ||'      AND TG.NO_GUIA ='||no_guia1
                       ||'      AND TG.ID_IVA=IV.ID_IVA'
                       ||'      AND TG.ID_RETENCION=RET.ID_RETENCION'
                       ||'      AND TG.NUM_GUIA = GUI.NUM_GUIA_ASIGNADO'
                       --||'      AND GUI.ID_TIPO_OPERACION = top.ID_TIPO_OPERACION'
                       --||'      AND GUI.ID_FRACCION = top.ID_FRACCION(+)'
                       --||'      AND top.id_producto = ''1'' ' -- IMM Temporal 091115
                       ||'      AND TG.flete > 0 '
                       --||'  GROUP BY tg.no_guia,'
                       --||'      NVL (TOP.TIPO_OPERACION, ''SIN ASIGNAR''),'
                       --||'      ''FLETE_''|| NVL (gui.num_guia, TG.num_guia)||''_''||TO_CHAR (SYSDATE, ''DD/MM/RRRR''),'
                       --||'      DECODE(TIPO_IVA,''IVA 16%'',''AR_IVA16'',''IVA 11%'',''AR_IVA11'',''IVA Exento'',''AR_IVA_EXENTO''),'
                       --||'      DECODE(RET.DESCRIPCION,''Retencion del 4%'',''AR_RET04''),'
                       --||'      (IV.FACTOR_IVA *100),'
                       --||'      (RET.FACTOR_RETENCION*100)'
                       ||'   UNION ALL'
                       ||'   SELECT TGO.NO_GUIA TRX_LINE_ID,'
                       ||'    tgo.desc_otro concepto,'
                       ||'    tgo.desc_otro ||''_'' || TO_CHAR (SYSDATE, ''DD/MM/RRRR'') description,'
                       ||'    to_number(tgo.monto,''99999999.999999'') unit_selling_price,'
                       ||'   to_number(tgo.monto_iva_otro,''99999999.999999'') MONTO_IVA,'
                       ||'    to_number(tgo.monto_retencion,''99999999.999999'') MONTO_IVA_RETENIDO,'
                       ||'    DECODE(TIPO_IVA,''IVA 16%'',''AR_IVA16'',''IVA 11%'',''AR_IVA11'',''IVA Exento'',''AR_IVAEXENTO'') strCodigoIva,'
                       ||'    DECODE(RET.DESCRIPCION,''Retencion del 4%'',''AR_RET04'') strcodigoretencion, '
                       ||'    (IV.FACTOR_IVA *100) strtasa_iva,'
                       ||'    (RET.FACTOR_RETENCION*100) strtasa_retension,'
                       ||'    SUBSTR(tgo.num_guiacp,1,INSTR(tgo.num_guiacp,''-'')-1) strOrigenServicio '
                       ||'    FROM ZAM_TRAFICO_GUIA_OTRO tgo,'
                       ||'    ZAM_GENERAL_IVAS iv,'
                       ||'    ZAM_GENERAL_RETENCIONES ret'
                       ||'    WHERE 1 = 1 '
                       ||'    AND tgo.no_guia ='||no_guia1
                       ||'    AND tgo.ID_IVA=IV.ID_IVA'
                       ||'    AND tgo.ID_RETENCION=RET.ID_RETENCION';
					   
	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------				   
					   qrylineas :='select tg."no_guia" trx_line_id,'
                            --||'nvl (top."desc_producto", ''NO USAR'') concepto,'
							||' NULL concepto,'
                             ||' ''FLETE_''|| nvl (gui."num_guia", tg."num_guia")||''_''||to_char (sysdate,''DD/MM/RRRR'') description,'
                             ||' to_number(nvl(gui."flete",tg."flete"),''99999999.999999'') unit_selling_price,'
                            ||' to_number(nvl(gui."iva_guia",tg."iva_guia")- NVL((select sum(tgo."monto_iva_otro") from TRAFICO_GUIA_OTRO@hsmssqldlv.estrellaroja.com.mx tgo where tgo."no_guia" = GUI."no_guia"),0),''99999999.999999'') monto_iva,'
                             ||' to_number(nvl(gui."monto_retencion",tg."monto_retencion") - NVL((select sum(tgo."monto_retencion") from TRAFICO_GUIA_OTRO@hsmssqldlv.estrellaroja.com.mx tgo where tgo."no_guia" = GUI."no_guia"),0),''99999999.999999'') monto_iva_retenido,'
                             ||' decode("tipo_iva",''IVA 16%'',''AR_IVA16'',''IVA 11%'',''AR_IVA11'',''IVA Exento'',''AR_IVA_EXENTO'') strcodigoiva,'
                             ||' decode(ret."descripcion",''Retencion del 4%'',''AR_RET04'') strcodigoretencion,'
                             ||' (iv."factor_iva" *100) strcodigoiva,'
                             ||' (ret."factor_retencion"*100) strcodigoretencion,'					 
                            ||'      SUBSTR(GUI."num_guia",1,INSTR(GUI."num_guia",''-'')-1) strOrigenServicio '
                            ||' from trafico_guia@hsmssqldlv.estrellaroja.com.mx tg,'
                             ||' trafico_guia@hsmssqldlv.estrellaroja.com.mx gui,'
                             --||'trafico_producto@hsmssqldlv.estrellaroja.com.mx top,'
                             ||' general_ivas@hsmssqldlv.estrellaroja.com.mx iv,'
                             ||' general_retenciones@hsmssqldlv.estrellaroja.com.mx ret'
                             ||' where     1 = 1'
                             ||' and tg."no_guia"='||no_guia1
                             ||' and tg."id_iva"=iv."id_iva"'
                             ||' and tg."id_retencion"=ret."id_retencion"'
                             ||' and tg."num_guia" = gui."num_guia_asignado"'
                             ||' and tg."id_area_facturacion" in ( ''1'',''0'') '
                            -- ||'AND GUI.ID_TIPO_OPERACION = top.ID_TIPO_OPERACION'''
                             --||'and gui."id_fraccion" = top."id_fraccion"(+)
                             --||'and top."id_producto" = ''1''' -- IMM Temporal 091115
                             ||' and tg."flete" > 0 '
                        -- ||'GROUP BY tg.no_guia,'
                            -- ||'NVL (TOP.TIPO_OPERACION, ''SIN ASIGNAR''),'
                            -- ||''FLETE_ NVL (gui.num_guia, TG.num_guia)''_TO_CHAR (SYSDATE, ''DD/MM/RRRR''),'
                            -- ||'DECODE(TIPO_IVA,''IVA 16%'',''AR_IVA16'',''IVA 11%'',''AR_IVA11'',''IVA Exento'',''AR_IVA_EXENTO''),'
                            -- ||'DECODE(RET.DESCRIPCION,''Retencion del 4%'',''AR_RET04''),'
                            -- ||'(IV.FACTOR_IVA *100),'
                            -- ||'(RET.FACTOR_RETENCION*100)'''
                          ||' union all'
                          ||' select tgo."no_guia" trx_line_id,'
                           ||' tgo."desc_otro" concepto,'
                           ||' tgo."desc_otro"|| ''_'' || to_char (sysdate, ''DD/MM/RRRR'') description,'
                           ||' to_number(tgo."monto",''99999999.999999'') unit_selling_price,'
                          ||' to_number(tgo."monto_iva_otro",''99999999.999999'') monto_iva,'
                           ||' to_number(tgo."monto_retencion",''99999999.999999'') monto_iva_retenido,'
                           ||' decode("tipo_iva",''IVA 16%'',''AR_IVA16'',''IVA 11%'',''AR_IVA11'',''IVA Exento'',''AR_IVAEXENTO'') strcodigoiva,'
                           ||' decode(ret."descripcion",''Retencion del 4%'',''AR_RET04'') strcodigoretencion,'
                           ||' (iv."factor_iva" *100) strtasa_iva,'
                           ||' (ret."factor_retencion"*100) strtasa_retension,'
						   ||'    SUBSTR(tgo."num_guiacp",1,INSTR(tgo."num_guiacp",''-'')-1) strOrigenServicio '
                           ||' from trafico_guia_otro@hsmssqldlv.estrellaroja.com.mx tgo,'
                           ||' general_ivas@hsmssqldlv.estrellaroja.com.mx iv,'
                           ||' general_retenciones@hsmssqldlv.estrellaroja.com.mx ret'
                           ||' where 1 = 1 '
                           ||' and tgo."no_guia" ='||no_guia1
                           ||' and tgo."id_iva"=iv."id_iva"'
                           ||' and tgo."id_retencion"=ret."id_retencion"';
					   
					   ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
					   
					   
					    
				  SELECT TG.NO_GUIA TRX_LINE_ID,
                             NVL (TOP.DESC_PRODUCTO, 'NO USAR') CONCEPTO,
                             'FLETE_'|| NVL (gui.num_guia, TG.num_guia)||'_'||TO_CHAR (SYSDATE, 'DD/MM/RRRR') description,
                             to_number(nvl(GUI.flete,tg.flete),'99999999.999999') unit_selling_price,
                             to_number(nvl(GUI.iva_guia,tg.iva_guia) - NVL((select sum(tgo.monto_iva_otro) from ZAM_TRAFICO_GUIA_OTRO tgo where tgo.no_guia = GUI.no_guia),0),'99999999.999999') MONTO_IVA,
                             to_number(nvl(GUI.monto_retencion,tg.monto_retencion) - NVL((select sum(tgo.monto_retencion) from ZAM_TRAFICO_GUIA_OTRO tgo where tgo.no_guia = GUI.no_guia),0),'99999999.999999') MONTO_IVA_RETENIDO,
                             DECODE(TIPO_IVA,'IVA 16%','AR_IVA16','IVA 11%','AR_IVA11','IVA Exento','AR_IVA_EXENTO') strCodigoIva,
                             DECODE(RET.DESCRIPCION,'Retencion del 4%','AR_RET04') strcodigoretencion,
                             (IV.FACTOR_IVA *100) strCodigoIva,
                             (RET.FACTOR_RETENCION*100) strCodigoRetencion
                            FROM ZAM_TRAFICO_GUIA TG,
                             ZAM_TRAFICO_GUIA GUI,
                             ZAM_TRAFICO_PRODUCTO top,
                             ZAM_GENERAL_IVAS iv,
                             ZAM_GENERAL_RETENCIONES ret
                             WHERE     1 = 1
                             --and tg.no_guia = ' 9299 '
                             AND TG.NO_GUIA =216998
                             AND TG.ID_IVA=IV.ID_IVA
                             AND TG.ID_RETENCION=RET.ID_RETENCION
                             AND TG.NUM_GUIA = GUI.NUM_GUIA_ASIGNADO
                       --      AND GUI.ID_TIPO_OPERACION = top.ID_TIPO_OPERACION'
                             AND GUI.ID_FRACCION = top.ID_FRACCION(+)
                             AND top.id_producto = '1' -- IMM Temporal 091115
                             AND TG.flete > 0 
                       --  GROUP BY tg.no_guia,
                       --      NVL (TOP.TIPO_OPERACION, 'SIN ASIGNAR'),
                       --      'FLETE_ NVL (gui.num_guia, TG.num_guia)'_TO_CHAR (SYSDATE, 'DD/MM/RRRR'),
                       --      DECODE(TIPO_IVA,'IVA 16%','AR_IVA16','IVA 11%','AR_IVA11','IVA Exento','AR_IVA_EXENTO'),
                       --      DECODE(RET.DESCRIPCION,'Retencion del 4%','AR_RET04'),
                       --      (IV.FACTOR_IVA *100),
                       --      (RET.FACTOR_RETENCION*100)'
                          UNION ALL
                          SELECT TGO.NO_GUIA TRX_LINE_ID,
                           tgo.desc_otro concepto,
                           tgo.desc_otro|| '_' || TO_CHAR (SYSDATE, 'DD/MM/RRRR') description,
                           to_number(tgo.monto,'99999999.999999') unit_selling_price,
                          to_number(tgo.monto_iva_otro,'99999999.999999') MONTO_IVA,
                           to_number(tgo.monto_retencion,'99999999.999999') MONTO_IVA_RETENIDO,
                           DECODE(TIPO_IVA,'IVA 16%','AR_IVA16','IVA 11%','AR_IVA11','IVA Exento','AR_IVAEXENTO') strCodigoIva,
                           DECODE(RET.DESCRIPCION,'Retencion del 4%','AR_RET04') strcodigoretencion,
                           (IV.FACTOR_IVA *100) strtasa_iva,
                           (RET.FACTOR_RETENCION*100) strtasa_retension
                           FROM ZAM_TRAFICO_GUIA_OTRO tgo,
                           ZAM_GENERAL_IVAS iv,
                           ZAM_GENERAL_RETENCIONES ret
                           WHERE 1 = 1 
                           AND tgo.no_guia =216998
                           AND tgo.ID_IVA=IV.ID_IVA
                           AND tgo.ID_RETENCION=RET.ID_RETENCION;
					   ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
					   
					   	   select tg."no_guia" trx_line_id,
                            --nvl (top."desc_producto", 'NO USAR') concepto,
							NULL concepto,
                             'FLETE_'|| nvl (gui."num_guia", tg."num_guia")||'_'||to_char (sysdate, 'DD/MM/RRRR') description,
                             to_number(nvl(gui."flete",tg."flete"),'99999999.999999') unit_selling_price,
                             to_number(nvl(gui."iva_guia",tg."iva_guia")- NVL((select sum(tgo."monto_iva_otro") from TRAFICO_GUIA_OTRO@hsmssqldlv.estrellaroja.com.mx tgo where tgo."no_guia" = GUI."no_guia"),0),'99999999.999999') monto_iva,
                             to_number(nvl(gui."monto_retencion",tg."monto_retencion") - NVL((select sum(tgo."monto_retencion") from TRAFICO_GUIA_OTRO@hsmssqldlv.estrellaroja.com.mx tgo where tgo."no_guia" = GUI."no_guia"),0),'99999999.999999') monto_iva_retenido,
                             decode("tipo_iva",'IVA 16%','AR_IVA16','IVA 11%','AR_IVA11','IVA Exento','AR_IVA_EXENTO') strcodigoiva,
                             decode(ret."descripcion",'Retencion del 4%','AR_RET04') strcodigoretencion,
                             (iv."factor_iva" *100) strcodigoiva,
                             (ret."factor_retencion"*100) strcodigoretencion,
							 SUBSTR(GUI."num_guia",1,INSTR(GUI."num_guia",'-')-1) strOrigenServicio 
                            from trafico_guia@hsmssqldlv.estrellaroja.com.mx tg,
                             trafico_guia@hsmssqldlv.estrellaroja.com.mx gui,
                             --trafico_producto@hsmssqldlv.estrellaroja.com.mx top,
                             general_ivas@hsmssqldlv.estrellaroja.com.mx iv,
                             general_retenciones@hsmssqldlv.estrellaroja.com.mx ret
                             where     1 = 1
                             and tg."no_guia" =274231
                             and tg."id_iva"=iv."id_iva"
                             and tg."id_retencion"=ret."id_retencion"
                             and tg."num_guia" = gui."num_guia_asignado"
                             and tg."id_area_facturacion" in ( '1','0') 
                            -- AND GUI.ID_TIPO_OPERACION = top.ID_TIPO_OPERACION'
                             --and gui."id_fraccion" = top."id_fraccion"(+)
                             --and top."id_producto" = '1' -- IMM Temporal 091115
                             and tg."flete" > 0 
                        -- GROUP BY tg.no_guia,
                            -- NVL (TOP.TIPO_OPERACION, 'SIN ASIGNAR'),
                            -- 'FLETE_ NVL (gui.num_guia, TG.num_guia)'_TO_CHAR (SYSDATE, 'DD/MM/RRRR'),
                            -- DECODE(TIPO_IVA,'IVA 16%','AR_IVA16','IVA 11%','AR_IVA11','IVA Exento','AR_IVA_EXENTO'),
                            -- DECODE(RET.DESCRIPCION,'Retencion del 4%','AR_RET04'),
                            -- (IV.FACTOR_IVA *100),
                            -- (RET.FACTOR_RETENCION*100)'
                          union all
                          select tgo."no_guia" trx_line_id,
                           tgo."desc_otro" concepto,
                           tgo."desc_otro"|| '_' || to_char (sysdate, 'DD/MM/RRRR') description,
                           to_number(tgo."monto",'99999999.999999') unit_selling_price,
                          to_number(tgo."monto_iva_otro",'99999999.999999') monto_iva,
                           to_number(tgo."monto_retencion",'99999999.999999') monto_iva_retenido,
                           decode("tipo_iva",'IVA 16%','AR_IVA16','IVA 11%','AR_IVA11','IVA Exento','AR_IVAEXENTO') strcodigoiva,
                           decode(ret."descripcion",'Retencion del 4%','AR_RET04') strcodigoretencion,
                           (iv."factor_iva" *100) strtasa_iva,
                           (ret."factor_retencion"*100) strtasa_retension,
						   SUBSTR(tgo."num_guiacp",1,INSTR(tgo."num_guiacp",'-')-1) strOrigenServicio 
                           from trafico_guia_otro@hsmssqldlv.estrellaroja.com.mx tgo,
                           general_ivas@hsmssqldlv.estrellaroja.com.mx iv,
                           general_retenciones@hsmssqldlv.estrellaroja.com.mx ret
                           where 1 = 1 
                           and tgo."no_guia" =274231
                           and tgo."id_iva"=iv."id_iva"
                           and tgo."id_retencion"=ret."id_retencion";
						   
						   
						   
						   
						   
						   -----------------------------------------------------------TRATECSA-----------------------------------------------------------
						   
					 qry :=
         ' Select fac.no_guia'
      || ' ,REPLACE(fac.num_guia,''700000'',''DL'') FAC_NUMERO'
      || ' ,TO_CHAR(FAC.FECHA_INGRESO,''DD/MM/YYYY'') FECHA '
      || ' ,CLI.NOMBRE'
      || ' ,CLI.RFC'
      || ' ,''TRATECSA'' sucursal'
      || ' ,fac.tipo_cobro'
      || ' ,TFE.num_guia'
      ||', TFE.folio || ''|'' || CLI.RFC || ''|'' || TFE.uuid || ''|'' || TFE.serie || ''|'' || FAC.subtotal || ''|'' || FAC.iva_guia || ''|'' || fac.monto_retencion || ''|0|0|'' || (fac.subtotal+fac.iva_guia-fac.monto_retencion) || ''|1'' '
      || ' From ZAMTRA_TRAFICO_GUIA FAC'
      || ' ,ZAMTRA_TRAFICO_CLIENTE cli'
      || ' ,ZAMTRA_TRAFICO_FACTURA_ELEC TFE'  
      || ' Where FAC.ID_CLIENTE  = CLI.ID_CLIENTE '
      || ' And fac.REPLICADO_AR = ''N''  ' -- TEMPORAL 130419
      --|| ' And FAC.num_guia = ''TT-5672''  ' -- TEMPORAL 130419
      || ' And fac.id_area_facturacion IN ( ''1'',''0'')'
      || ' And fac.no_viaje = ''0'' '
      || ' And fac.tipo_doc =''1''  '
      || ' And fac.STATUS_GUIA = ''C''  '
      || ' and FAC.FOLIO_FACTURA Is Null '
      || ' And FAC.no_guia = TFE.no_guia'
      --|| ' And TO_CHAR(FAC.FECHA_INGRESO,''RRRR/MM'') = ''2019/03'' '; -- TEMPORAL 130519
      || ' And TRUNC(FAC.FECHA_INGRESO) >= TO_DATE(''01/01/2022'',''DD/MM/RRRR'') '  --INSERT POR FECHA DE GUIA
      || ' AND not exists (select 1 '
      || '            from ZAMTRA_TRAFICO_FACTURA_ELEC TFE2 '
      || '           where TFE2.num_guia = TFE.num_guia '
      || '             and TFE2.status_cancel = 5) ';
	  
	  
	  
	  qry :=
            ' Select fac."no_guia"'
      || ' ,REPLACE(fac."num_guia",''700000'',''DL'') FAC_NUMERO'
      || ' ,TO_CHAR(FAC."fecha_ingreso",''DD/MM/YYYY'') FECHA '
      || ' ,cli."nombre"'
      || ' ,cli."rfc"'
      || ' ,''TRATECSA'' sucursal'
      || ' ,fac."tipo_cobro"'
      || ' ,TFE."num_guia"'
      ||', TFE."folio" || ''|'' || cli."rfc" || ''|'' || TFE."uuid" || ''|'' || TFE."serie" || ''|'' || FAC."subtotal" || ''|'' || FAC."iva_guia" || ''|'' || fac."monto_retencion" || ''|0|0|'' || (fac."subtotal"+fac."iva_guia"-fac."monto_retencion") || ''|1'' '
      || ' From TRAFICO_GUIA@HSMSSQLTRA.ESTRELLAROJA.COM.MX fac'
      || ' ,TRAFICO_CLIENTE@HSMSSQLTRA.ESTRELLAROJA.COM.MX cli'
      || ' ,TRAFICO_FACTURA_ELECTRONICA@HSMSSQLTRA.ESTRELLAROJA.COM.MX TFE'  
      || ' Where fac."id_cliente"  = cli."id_cliente" '
      --|| ' And fac.REPLICADO_AR = ''N''  ' -- TEMPORAL 130419
      || ' And fac."num_guia" IN (''VER-24566'') ' -- TEMPORAL 130419
      || ' And fac."id_area_facturacion" IN ( ''1'',''0'') '
      || ' And fac."no_viaje" = ''0'' '
      || ' And fac."tipo_doc" =''1''  '
      || ' And fac."status_guia" = ''C''  '
      --|| ' and FAC."FOLIO_FACTURA" Is Null '
      || ' And fac."no_guia" = TFE."no_guia"'
      --|| ' And TRUNC(FAC.FECHA_INGRESO) >= TO_DATE(''2022/01/01'',''RRRR/MM/DD'')' -- TEMPORAL 130419
      || ' AND not exists (select 1 '
      || '            from iner_xxer_puente_header_tbl tp  '
      || '           where tp.numero_documento = TFE."num_guia" ) '	  
      || ' AND not exists (select 1 '
      || '            from TRAFICO_FACTURA_ELECTRONICA@HSMSSQLTRA.ESTRELLAROJA.COM.MX TFE2 '
      || '           where TFE2."num_guia" = TFE."num_guia" '
      || '             and TFE2."status_cancel" = 5) ';
	   
						   
						   
		  Select fac.no_guia
      ,REPLACE(fac.num_guia,'700000','DL') FAC_NUMERO
      ,TO_CHAR(FAC.FECHA_INGRESO,'DD/MM/YYYY') FECHA 
      ,CLI.NOMBRE
      ,CLI.RFC
      ,'TRATECSA' sucursal
      ,fac.tipo_cobro
      ,TFE.num_guia
      From ZAMTRA_TRAFICO_GUIA FAC
      ,ZAMTRA_TRAFICO_CLIENTE cli
      ,ZAMTRA_TRAFICO_FACTURA_ELEC TFE
      Where FAC.ID_CLIENTE  = CLI.ID_CLIENTE
      And fac.REPLICADO_AR = 'N' -- TEMPORAL 130419
      --And FAC.num_guia = 'TT-615' -- TEMPORAL 130419
      And fac.id_area_facturacion in ( '0','1')
      And fac.no_viaje = '0' 
      And fac.tipo_doc ='1'  
      And fac.STATUS_GUIA = 'C'  
      and FAC.FOLIO_FACTURA Is Null 
      And FAC.no_guia = TFE.no_guia
      --And TO_CHAR(FAC.FECHA_INGRESO,'RRRR/MM') = '2019/03' '; -- TEMPORAL 130519
      And FAC.num_guia = TFE.num_guia
      And to_char(TFE.FECHA_INGRESO,'DD/MM/RRRR') = '25/02/2021'
      AND not exists (select 1 
                 from ZAMTRA_TRAFICO_FACTURA_ELEC TFE2 
                where TFE2.num_guia = TFE.num_guia 
                  and TFE2.status_cancel = 5) ;						   

						   
                 
                 
select fac."no_guia"
      ,replace(fac."num_guia",'700000','DL') fac_numero
      ,to_char(fac."fecha_ingreso",'DD/MM/YYYY') fecha 
      ,cli."nombre"
      ,cli."rfc"
      ,'TRATECSA' sucursal
      ,fac."tipo_cobro"
      ,tfe."num_guia"
	  
	  select count(fac."no_guia")
      from trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX fac
      ,trafico_cliente@HSMSSQLTRA.ESTRELLAROJA.COM.MX cli
      ,trafico_factura_electronica@HSMSSQLTRA.ESTRELLAROJA.COM.MX tfe   
      where fac."id_cliente"  = cli."id_cliente"
      --and fac."replicado_ar" = 'N' -- TEMPORAL 130419
     -- And fac."num_guia" = 'TTP-229' -- TEMPORAL 130419
      and fac."id_area_facturacion" in ( '0','1')
      and fac."no_viaje" = '0' 
      and fac."tipo_doc" ='1'  
      and fac."status_guia" = 'C'  
	  and tfe."status"='2'
      --and fac."folio_factura" is null 
      and fac."no_guia" = tfe."no_guia"
      And TO_CHAR(fac."fecha_ingreso",'RRRR/MM/DD')>= '2021/02/01'
      and fac."num_guia" = tfe."num_guia"
      --And to_char(TFE.FECHA_INGRESO,'DD/MM/RRRR') = '25/02/2021'
      and not exists (select 1 
                 from  iner_xxer_puente_header_tbl tp 
                where tp.numero_documento = tfe."num_guia") 
      and not exists (select 1 
                 from trafico_factura_electronica@HSMSSQLTRA.ESTRELLAROJA.COM.MX tfe2 
                where tfe2."num_guia" = tfe."num_guia" 
                  and tfe2."status_cancel" = 5) ;
                  
				  
				  
				  
				  
				  ----  Trae las lineas de la factura
         qrylineas :=
                      'SELECT TG.NO_GUIA TRX_LINE_ID,'
                       --||'      NVL (TOP.DESC_PRODUCTO, ''NO USAR'') CONCEPTO,'
                       ||'      NULL CONCEPTO,'
                       ||'      ''FLETE_''|| NVL (gui.num_guia, TG.num_guia)||''_''||TO_CHAR (SYSDATE, ''DD/MM/RRRR'') description,'
                       ||'      to_number(nvl(GUI.flete,tg.flete),''99999999.999999'') unit_selling_price,'
                       --||'      to_number(nvl(GUI.iva_guia,tg.iva_guia) - NVL((select sum(tgo.monto_iva_otro) from ZAMTRA_TRAFICO_GUIA_OTRO tgo where tgo.no_guia = GUI.no_guia),0),''99999999.999999'') MONTO_IVA,'
                       --||'      to_number(nvl(GUI.monto_retencion,tg.monto_retencion) - NVL((select sum(tgo.monto_retencion) from ZAMTRA_TRAFICO_GUIA_OTRO tgo where tgo.no_guia = GUI.no_guia),0),''99999999.999999'') MONTO_IVA_RETENIDO,'
                       ||'      round(nvl(GUI.flete,tg.flete)*IV.FACTOR_IVA,2) MONTO_IVA, '
                       ||'      round(nvl(GUI.flete,tg.flete)*RET.FACTOR_RETENCION,2) MONTO_IVA_RETENIDO, '
                       ||'      DECODE(TIPO_IVA,''IVA 16%'',''AR_IVA16'',''IVA 11%'',''AR_IVA11'',''IVA Exento'',''AR_IVA_EXENTO'') strCodigoIva,'
                       ||'      DECODE(RET.DESCRIPCION,''Retencion del 4%'',''AR_RET04'') strcodigoretencion,'
                       ||'      (IV.FACTOR_IVA *100) strCodigoIva,'
                       ||'      (RET.FACTOR_RETENCION*100) strCodigoRetencion,'
                       ||'      SUBSTR(GUI.num_guia,1,INSTR(GUI.num_guia,''-'')-1) strOrigenServicio '
                       ||'     FROM ZAMTRA_TRAFICO_GUIA TG,'
                       ||'      ZAMTRA_TRAFICO_GUIA GUI,'
                       --||'      ZAMTRA_TRAFICO_PRODUCTO top,'
                       ||'      ZAMTRA_GENERAL_IVAS iv,'
                       ||'      ZAMTRA_GENERAL_RETENCIONES ret'
                       ||'      WHERE     1 = 1'
                             --and tg.no_guia = ' 9299 ''
                       ||'      AND TG.NO_GUIA ='||no_guia1
                       ||'      AND TG.ID_IVA=IV.ID_IVA'
                       ||'      AND TG.ID_RETENCION=RET.ID_RETENCION'
                       ||'      AND TG.NUM_GUIA = GUI.NUM_GUIA_ASIGNADO'
                       --||'      AND GUI.ID_TIPO_OPERACION = top.ID_TIPO_OPERACION'
                       --||'      AND GUI.ID_FRACCION = top.ID_FRACCION(+)'
                       --||'      AND top.id_producto = ''1'' ' -- IMM Temporal 091115
                       ||'      AND TG.flete > 0 '
                       --||'  GROUP BY tg.no_guia,'
                       --||'      NVL (TOP.TIPO_OPERACION, ''SIN ASIGNAR''),'
                       --||'      ''FLETE_''|| NVL (gui.num_guia, TG.num_guia)||''_''||TO_CHAR (SYSDATE, ''DD/MM/RRRR''),'
                       --||'      DECODE(TIPO_IVA,''IVA 16%'',''AR_IVA16'',''IVA 11%'',''AR_IVA11'',''IVA Exento'',''AR_IVA_EXENTO''),'
                       --||'      DECODE(RET.DESCRIPCION,''Retencion del 4%'',''AR_RET04''),'
                       --||'      (IV.FACTOR_IVA *100),'
                       --||'      (RET.FACTOR_RETENCION*100)'
                       ||'   UNION ALL'
                       ||'   SELECT TGO.NO_GUIA TRX_LINE_ID,'
                       ||'    tgo.desc_otro concepto,'
                       ||'    tgo.desc_otro ||''_'' || TO_CHAR (SYSDATE, ''DD/MM/RRRR'') description,'
                       ||'    to_number(tgo.monto,''99999999.999999'') unit_selling_price,'
                       ||'    to_number(tgo.monto_iva_otro,''99999999.999999'') monto_iva,'
                       ||'    to_number(tgo.monto_retencion,''99999999.999999'') monto_iva_retenido,'
                       ||'    DECODE(TIPO_IVA,''IVA 16%'',''AR_IVA16'',''IVA 11%'',''AR_IVA11'',''IVA Exento'',''AR_IVAEXENTO'') strCodigoIva,'
                       ||'    DECODE(RET.DESCRIPCION,''Retencion del 4%'',''AR_RET04'') strcodigoretencion, '
                       ||'    (IV.FACTOR_IVA *100) strtasa_iva,'
                       ||'    (RET.FACTOR_RETENCION*100) strtasa_retension,'
                       ||'    SUBSTR(tgo.num_guiacp,1,INSTR(tgo.num_guiacp,''-'')-1) strOrigenServicio '
                       ||'    FROM ZAMTRA_TRAFICO_GUIA_OTRO tgo,'
                       ||'    ZAMTRA_GENERAL_IVAS iv,'
                       ||'    ZAMTRA_GENERAL_RETENCIONES ret'
                       ||'    WHERE 1 = 1 '
                       ||'    AND tgo.no_guia ='||no_guia1
                       ||'    AND tgo.ID_IVA=IV.ID_IVA'
                       ||'    AND tgo.ID_RETENCION=RET.ID_RETENCION';
					   
					   
					   
					   SELECT TG.NO_GUIA TRX_LINE_ID,
                           --NVL (TOP.DESC_PRODUCTO, 'NO USAR') CONCEPTO,
                             NULL CONCEPTO,
                             'FLETE_'|| NVL (gui.num_guia, TG.num_guia)||'_'||TO_CHAR (SYSDATE, 'DD/MM/RRRR') description,
                             to_number(nvl(GUI.flete,tg.flete),'99999999.999999') unit_selling_price,
                       --      to_number(nvl(GUI.iva_guia,tg.iva_guia) - NVL((select sum(tgo.monto_iva_otro) from ZAMTRA_TRAFICO_GUIA_OTRO tgo where tgo.no_guia = GUI.no_guia),0),'99999999.999999') MONTO_IVA,'
                       --      to_number(nvl(GUI.monto_retencion,tg.monto_retencion) - NVL((select sum(tgo.monto_retencion) from ZAMTRA_TRAFICO_GUIA_OTRO tgo where tgo.no_guia = GUI.no_guia),0),'99999999.999999') MONTO_IVA_RETENIDO,'
                             round(nvl(GUI.flete,tg.flete)*IV.FACTOR_IVA,2) MONTO_IVA, 
                             round(nvl(GUI.flete,tg.flete)*RET.FACTOR_RETENCION,2) MONTO_IVA_RETENIDO, 
                             DECODE(TIPO_IVA,'IVA 16%','AR_IVA16','IVA 11%','AR_IVA11','IVA Exento','AR_IVA_EXENTO') strCodigoIva,
                             DECODE(RET.DESCRIPCION,'Retencion del 4%','AR_RET04') strcodigoretencion,
                             (IV.FACTOR_IVA *100) strCodigoIva,
                             (RET.FACTOR_RETENCION*100) strCodigoRetencion,
                             SUBSTR(GUI.num_guia,1,INSTR(GUI.num_guia,'-')-1) strOrigenServicio 
                            FROM ZAMTRA_TRAFICO_GUIA TG,
                             ZAMTRA_TRAFICO_GUIA GUI,
                       --      ZAMTRA_TRAFICO_PRODUCTO top,
                             ZAMTRA_GENERAL_IVAS iv,
                             ZAMTRA_GENERAL_RETENCIONES ret
                             WHERE     1 = 1
                             --and tg.no_guia = 299 
                             AND TG.NO_GUIA =27474
                             AND TG.ID_IVA=IV.ID_IVA
                             AND TG.ID_RETENCION=RET.ID_RETENCION
                             AND TG.NUM_GUIA = GUI.NUM_GUIA_ASIGNADO
                       --      AND GUI.ID_TIPO_OPERACION = top.ID_TIPO_OPERACION
                       --      AND GUI.ID_FRACCION = top.ID_FRACCION(+)'
                       --      AND top.id_producto = '1' ' -- IMM Temporal 091115
                             AND TG.flete > 0 
                       --  GROUP BY tg.no_guia,'
                       --      NVL (TOP.TIPO_OPERACION, 'SIN ASIGNAR'),'
                       --      'FLETE_'|| NVL (gui.num_guia, TG.num_guia)'_'||TO_CHAR (SYSDATE, 'DD/MM/RRRR'),'
                       --      DECODE(TIPO_IVA,'IVA 16%','AR_IVA16','IVA 11%','AR_IVA11','IVA Exento','AR_IVA_EXENTO'),'
                       --      DECODE(RET.DESCRIPCION,'Retencion del 4%','AR_RET04'),'
                       --      (IV.FACTOR_IVA *100),'
                       --      (RET.FACTOR_RETENCION*100)
                          UNION ALL
                          SELECT TGO.NO_GUIA TRX_LINE_ID,
                           tgo.desc_otro concepto,
                           tgo.desc_otro|| '_' || TO_CHAR (SYSDATE, 'DD/MM/RRRR') description,
                           to_number(tgo.monto,'99999999.999999') unit_selling_price,
                           to_number(tgo.monto_iva_otro,'99999999.999999') monto_iva,
                           to_number(tgo.monto_retencion,'99999999.999999') monto_iva_retenido,
                           DECODE(TIPO_IVA,'IVA 16%','AR_IVA16','IVA 11%','AR_IVA11','IVA Exento','AR_IVAEXENTO') strCodigoIva,
                           DECODE(RET.DESCRIPCION,'Retencion del 4%','AR_RET04') strcodigoretencion, 
                           (IV.FACTOR_IVA *100) strtasa_iva,
                           (RET.FACTOR_RETENCION*100) strtasa_retension,
                           SUBSTR(tgo.num_guiacp,1,INSTR(tgo.num_guiacp,'-')-1) strOrigenServicio
                           FROM ZAMTRA_TRAFICO_GUIA_OTRO tgo,
                           ZAMTRA_GENERAL_IVAS iv,
                           ZAMTRA_GENERAL_RETENCIONES ret
                           WHERE 1 = 1 
                           AND tgo.no_guia =27474
                           AND tgo.ID_IVA=IV.ID_IVA
                           AND tgo.ID_RETENCION=RET.ID_RETENCION;
					   
					   qrylineas :='select tg."no_guia" trx_line_id,'
                            --||'nvl (top."desc_producto", ''NO USAR'') concepto,'
							||' NULL concepto,'
                             ||' ''FLETE_''|| nvl (gui."num_guia", tg."num_guia")||''_''||to_char (sysdate,''DD/MM/RRRR'') description,'
                             ||' to_number(nvl(gui."flete",tg."flete"),''99999999.999999'') unit_selling_price,'
                            --||' to_number(nvl(gui."iva_guia",tg."iva_guia")- NVL((select sum(tgo."monto_iva_otro") from TRAFICO_GUIA_OTRO@hsmssqldlv.estrellaroja.com.mx tgo where tgo."no_guia" = GUI."no_guia"),0),''99999999.999999'') monto_iva,'
                             --||' to_number(nvl(gui."monto_retencion",tg."monto_retencion") - NVL((select sum(tgo."monto_retencion") from TRAFICO_GUIA_OTRO@hsmssqldlv.estrellaroja.com.mx tgo where tgo."no_guia" = GUI."no_guia"),0),''99999999.999999'') monto_iva_retenido,'
							 ||'      round(nvl(gui."flete",tg."flete")*iv."factor_iva",2) monto_iva, '
                              ||'      round(nvl(gui."flete",tg."flete")*ret."factor_retencion",2) monto_iva_retenido, '
                             ||' decode("tipo_iva",''IVA 16%'',''AR_IVA16'',''IVA 11%'',''AR_IVA11'',''IVA Exento'',''AR_IVA_EXENTO'') strcodigoiva,'
                             ||' decode(ret."descripcion",''Retencion del 4%'',''AR_RET04'') strcodigoretencion,'
                             ||' (iv."factor_iva" *100) strcodigoiva,'
                             ||' (ret."factor_retencion"*100) strcodigoretencion,'					 
                            ||'      SUBSTR(GUI."num_guia",1,INSTR(GUI."num_guia",''-'')-1) strOrigenServicio '
                            ||' from trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX tg,'
                             ||' trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX gui,'
                             --||'trafico_producto@HSMSSQLTRA.ESTRELLAROJA.COM.MX top,'
                             ||' general_ivas@HSMSSQLTRA.ESTRELLAROJA.COM.MX iv,'
                             ||' general_retenciones@HSMSSQLTRA.ESTRELLAROJA.COM.MX ret'
                             ||' where     1 = 1'
                             ||' and tg."no_guia"='||no_guia1
                             ||' and tg."id_iva"=iv."id_iva"'
                             ||' and tg."id_retencion"=ret."id_retencion"'
                             ||' and tg."num_guia" = gui."num_guia_asignado"'
                             ||' and tg."id_area_facturacion" in ( ''1'',''0'') '
                            -- ||'AND GUI.ID_TIPO_OPERACION = top.ID_TIPO_OPERACION'''
                             --||'and gui."id_fraccion" = top."id_fraccion"(+)
                             --||'and top."id_producto" = ''1''' -- IMM Temporal 091115
                             ||' and tg."flete" > 0 '
                        -- ||'GROUP BY tg.no_guia,'
                            -- ||'NVL (TOP.TIPO_OPERACION, ''SIN ASIGNAR''),'
                            -- ||''FLETE_ NVL (gui.num_guia, TG.num_guia)''_TO_CHAR (SYSDATE, ''DD/MM/RRRR''),'
                            -- ||'DECODE(TIPO_IVA,''IVA 16%'',''AR_IVA16'',''IVA 11%'',''AR_IVA11'',''IVA Exento'',''AR_IVA_EXENTO''),'
                            -- ||'DECODE(RET.DESCRIPCION,''Retencion del 4%'',''AR_RET04''),'
                            -- ||'(IV.FACTOR_IVA *100),'
                            -- ||'(RET.FACTOR_RETENCION*100)'''
                          ||' union all'
                          ||' select tgo."no_guia" trx_line_id,'
                           ||' tgo."desc_otro" concepto,'
                           ||' tgo."desc_otro"|| ''_'' || to_char (sysdate, ''DD/MM/RRRR'') description,'
                           ||' to_number(tgo."monto",''99999999.999999'') unit_selling_price,'
                          ||' to_number(tgo."monto_iva_otro",''99999999.999999'') monto_iva,'
                           ||' to_number(tgo."monto_retencion",''99999999.999999'') monto_iva_retenido,'
                           ||' decode("tipo_iva",''IVA 16%'',''AR_IVA16'',''IVA 11%'',''AR_IVA11'',''IVA Exento'',''AR_IVAEXENTO'') strcodigoiva,'
                           ||' decode(ret."descripcion",''Retencion del 4%'',''AR_RET04'') strcodigoretencion,'
                           ||' (iv."factor_iva" *100) strtasa_iva,'
                           ||' (ret."factor_retencion"*100) strtasa_retension,'
						   ||'    SUBSTR(tgo."num_guiacp",1,INSTR(tgo."num_guiacp",''-'')-1) strOrigenServicio '
                           ||' from trafico_guia_otro@HSMSSQLTRA.ESTRELLAROJA.COM.MX tgo,'
                           ||' general_ivas@HSMSSQLTRA.ESTRELLAROJA.COM.MX iv,'
                           ||' general_retenciones@HSMSSQLTRA.ESTRELLAROJA.COM.MX ret'
                           ||' where 1 = 1 '
                           ||' and tgo."no_guia" ='||no_guia1
                           ||' and tgo."id_iva"=iv."id_iva"'
                           ||' and tgo."id_retencion"=ret."id_retencion"'
						   
						   
						   
						   
						select tg."no_guia" trx_line_id,
                            nvl (null, 'NO USAR') concepto,
							 NULL concepto,
                              'FLETE_'|| nvl (gui."num_guia", tg."num_guia")||'_'||to_char (sysdate,'DD/MM/RRRR') description,
                              to_number(nvl(gui."flete",tg."flete"),'99999999.999999') unit_selling_price,
                            -- to_number(nvl(gui."iva_guia",tg."iva_guia")- NVL((select sum(tgo."monto_iva_otro") from TRAFICO_GUIA_OTRO@hsmssqldlv.estrellaroja.com.mx tgo where tgo."no_guia" = GUI."no_guia"),0),''99999999.999999'') monto_iva,
                             -- to_number(nvl(gui."monto_retencion",tg."monto_retencion") - NVL((select sum(tgo."monto_retencion") from TRAFICO_GUIA_OTRO@hsmssqldlv.estrellaroja.com.mx tgo where tgo."no_guia" = GUI."no_guia"),0),''99999999.999999'') monto_iva_retenido,
							       round(nvl(gui."flete",tg."flete")*iv."factor_iva",2) monto_iva, 
                                    round(nvl(gui."flete",tg."flete")*ret."factor_retencion",2) monto_iva_retenido, 
                              decode("tipo_iva",'IVA 16%','AR_IVA16','IVA 11%','AR_IVA11','IVA Exento','AR_IVA_EXENTO') strcodigoiva,
                              decode(ret."descripcion",'Retencion del 4%','AR_RET04') strcodigoretencion,
                              (iv."factor_iva" *100) strcodigoiva,
                              (ret."factor_retencion"*100) strcodigoretencion,			 
                                  SUBSTR(GUI."num_guia",1,INSTR(GUI."num_guia",'-')-1) strOrigenServicio
                             from trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX tg,
                              trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX gui,
                             --trafico_producto@HSMSSQLTRA.ESTRELLAROJA.COM.MX top,
                              general_ivas@HSMSSQLTRA.ESTRELLAROJA.COM.MX iv,
                              general_retenciones@HSMSSQLTRA.ESTRELLAROJA.COM.MX ret
                              where     1 = 1
                              and tg."no_guia"=27474
                              and tg."id_iva"=iv."id_iva"
                              and tg."id_retencion"=ret."id_retencion"
                              and tg."num_guia" = gui."num_guia_asignado"
                              and tg."id_area_facturacion" in ( '1','0') 
                            -- AND GUI.ID_TIPO_OPERACION = top.ID_TIPO_OPERACION
                             --and gui."id_fraccion" = top."id_fraccion"(+)
                             --and top."id_producto" = ''1''' -- IMM Temporal 091115
                              and tg."flete" > 0 
                        -- GROUP BY tg.no_guia,
                            -- NVL (TOP.TIPO_OPERACION, ''SIN ASIGNAR''),
                            -- 'FLETE_ NVL (gui.num_guia, TG.num_guia)'_TO_CHAR (SYSDATE, 'DD/MM/RRRR'),
                            -- DECODE(TIPO_IVA,''IVA 16%'',''AR_IVA16'',''IVA 11%'',''AR_IVA11'',''IVA Exento'',''AR_IVA_EXENTO''),
                            -- DECODE(RET.DESCRIPCION,''Retencion del 4%'',''AR_RET04''),
                            -- (IV.FACTOR_IVA *100),
                            -- (RET.FACTOR_RETENCION*100)'
                           union all
                           select tgo."no_guia" trx_line_id,
                            null concepto,
                            tgo."desc_otro"|| '_' || to_char (sysdate, 'DD/MM/RRRR') description,
                            to_number(tgo."monto",'99999999.999999') unit_selling_price,
                           to_number(tgo."monto_iva_otro",'99999999.999999') monto_iva,
                            to_number(tgo."monto_retencion",'99999999.999999') monto_iva_retenido,
                            decode("tipo_iva",'IVA 16%','AR_IVA16','IVA 11%','AR_IVA11','IVA Exento','AR_IVAEXENTO') strcodigoiva,
                            decode(ret."descripcion",'Retencion del 4%','AR_RET04') strcodigoretencion,
                            (iv."factor_iva" *100) strtasa_iva,
                            (ret."factor_retencion"*100) strtasa_retension,
						       SUBSTR(tgo."num_guiacp",1,INSTR(tgo."num_guiacp",'-')-1) strOrigenServicio 
                            from trafico_guia_otro@HSMSSQLTRA.ESTRELLAROJA.COM.MX tgo,
                            general_ivas@HSMSSQLTRA.ESTRELLAROJA.COM.MX iv,
                            general_retenciones@HSMSSQLTRA.ESTRELLAROJA.COM.MX ret
                            where 1 = 1 
                            and tgo."no_guia" =27474
                            and tgo."id_iva"=iv."id_iva"
                            and tgo."id_retencion"=ret."id_retencion";
							
							
							
							select tg."no_guia" trx_line_id,
                            null concepto,
                            null consecutivo,
                              'FLETE_'|| nvl (gui."num_guia", tg."num_guia")||'_'||to_char (sysdate,'DD/MM/RRRR') description,
                              to_number(nvl(gui."flete",tg."flete"),'99999999.999999') unit_selling_price,
                            -- to_number(nvl(gui."iva_guia",tg."iva_guia")- NVL((select sum(tgo."monto_iva_otro") from TRAFICO_GUIA_OTRO@hsmssqldlv.estrellaroja.com.mx tgo where tgo."no_guia" = GUI."no_guia"),0),''99999999.999999'') monto_iva,
                             -- to_number(nvl(gui."monto_retencion",tg."monto_retencion") - NVL((select sum(tgo."monto_retencion") from TRAFICO_GUIA_OTRO@hsmssqldlv.estrellaroja.com.mx tgo where tgo."no_guia" = GUI."no_guia"),0),''99999999.999999'') monto_iva_retenido,
							       round(nvl(gui."flete",tg."flete")*iv."factor_iva",2) monto_iva, 
                                    round(nvl(gui."flete",tg."flete")*ret."factor_retencion",2) monto_iva_retenido, 
                              decode("tipo_iva",'IVA 16%','AR_IVA16','IVA 11%','AR_IVA11','IVA Exento','AR_IVA_EXENTO') strcodigoiva,
                              decode(ret."descripcion",'Retencion del 4%','AR_RET04') strcodigoretencion,
                              (iv."factor_iva" *100) strcodigoiva,
                              (ret."factor_retencion"*100) strcodigoretencion,			 
                                  SUBSTR(GUI."num_guia",1,INSTR(GUI."num_guia",'-')-1) strOrigenServicio
                             from trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX tg,
                              trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX gui,
                             --trafico_producto@HSMSSQLTRA.ESTRELLAROJA.COM.MX top,
                              general_ivas@HSMSSQLTRA.ESTRELLAROJA.COM.MX iv,
                              general_retenciones@HSMSSQLTRA.ESTRELLAROJA.COM.MX ret
                              where     1 = 1
                              and tg."no_guia"=27474
                              and tg."id_iva"=iv."id_iva"
                              and tg."id_retencion"=ret."id_retencion"
                              and tg."num_guia" = gui."num_guia_asignado"
                              and tg."id_area_facturacion" in ( '1','0') 
                            -- AND GUI.ID_TIPO_OPERACION = top.ID_TIPO_OPERACION
                             --and gui."id_fraccion" = top."id_fraccion"(+)
                             --and top."id_producto" = ''1''' -- IMM Temporal 091115
                              and tg."flete" > 0 
                        -- GROUP BY tg.no_guia,
                            -- NVL (TOP.TIPO_OPERACION, ''SIN ASIGNAR''),
                            -- 'FLETE_ NVL (gui.num_guia, TG.num_guia)'_TO_CHAR (SYSDATE, 'DD/MM/RRRR'),
                            -- DECODE(TIPO_IVA,''IVA 16%'',''AR_IVA16'',''IVA 11%'',''AR_IVA11'',''IVA Exento'',''AR_IVA_EXENTO''),
                            -- DECODE(RET.DESCRIPCION,''Retencion del 4%'',''AR_RET04''),
                            -- (IV.FACTOR_IVA *100),
                            -- (RET.FACTOR_RETENCION*100)'
                           union all
                           select tgo."no_guia" trx_line_id,
                            null concepto,
                            tgo."consecutivo" consecutivo,
                            tgo."desc_otro"|| '_' || to_char (sysdate, 'DD/MM/RRRR') description,
                            to_number(tgo."monto",'99999999.999999') unit_selling_price,
                           to_number(tgo."monto_iva_otro",'99999999.999999') monto_iva,
                            to_number(tgo."monto_retencion",'99999999.999999') monto_iva_retenido,
                            decode("tipo_iva",'IVA 16%','AR_IVA16','IVA 11%','AR_IVA11','IVA Exento','AR_IVAEXENTO') strcodigoiva,
                            decode(ret."descripcion",'Retencion del 4%','AR_RET04') strcodigoretencion,
                            (iv."factor_iva" *100) strtasa_iva,
                            (ret."factor_retencion"*100) strtasa_retension,
						       SUBSTR(tgo."num_guiacp",1,INSTR(tgo."num_guiacp",'-')-1) strOrigenServicio 
                          -- select *  
                           from trafico_guia_otro@HSMSSQLTRA.ESTRELLAROJA.COM.MX  
                           --where "no_guia" =27474 
                           tgo,
                            general_ivas@HSMSSQLTRA.ESTRELLAROJA.COM.MX iv,
                            general_retenciones@HSMSSQLTRA.ESTRELLAROJA.COM.MX ret
                            where 1 = 1 
                            and tgo."no_guia" =27474
                            and tgo."id_iva"=iv."id_iva"
                            and tgo."id_retencion"=ret."id_retencion";
							
					   --------------------------------------------------
					   select fac."no_guia"
      ,replace(fac."num_guia",'700000','DL') fac_numero
      ,to_char(fac."fecha_ingreso",'DD/MM/YYYY') fecha 
	  ,to_char(tfe."fecha_timbre",'DD/MM/YYYY') fecha 
      ,cli."nombre"
      ,cli."rfc"
      ,'DLIVER' sucursal
      ,fac."tipo_cobro"
      ,tfe."num_guia"
	  ,tfe."uuid" 
	  ,fac."subtotal" 
      --, tfe."folio" || cli."rfc" || tfe."uuid" || tfe."serie" ||fac."subtotal" || fac."iva_guia" ||fac."monto_retencion" ||0||0||(fac."subtotal"+fac."iva_guia"-fac."monto_retencion") ||1
       from trafico_guia@hsmssqldlv.estrellaroja.com.mx fac
      ,trafico_cliente@hsmssqldlv.estrellaroja.com.mx cli
     ,trafico_factura_electronica@hsmssqldlv.estrellaroja.com.mx tfe 
      where fac."id_cliente"  = cli."id_cliente"
     --And fac.REPLICADO_AR = 'N' -- TEMPORAL 130419
    --and fac."num_guia" in ('VERP-3289')--,'VER-23531','VER-23532','VER-23534','VER-23535','VER-23536','VER-23547','VER-23538') -- TEMPORAL 130419
     and fac."id_area_facturacion" in( '1','0')
     and fac."no_viaje" = '0'
     and fac."tipo_doc" ='1'
     and fac."status_guia" = 'C' 
     --and tfe."uuid"!=''
     and tfe."status"='2'
     --and FAC."folio_factura" Is Null 
     and fac."no_guia" = tfe."no_guia"
     And TO_CHAR(fac."fecha_ingreso",'RRRR/MM/DD')>= '2021/02/01' -- TEMPORAL 130419
     and fac."num_guia" = tfe."num_guia"
	 --and not exists (select 1               from  iner_xxer_puente_header_tbl tp           where tp.numero_documento = tfe."num_guia") 
    and not exists (select 1 
                 from  iner_xxer_puente_header_tbl tp 
                where tp.numero_documento = tfe."num_guia")
     and not exists (select 1 
               from trafico_factura_electronica@hsmssqldlv.estrellaroja.com.mx tfe2 
              where tfe2."num_guia" = tfe."num_guia" 
                 and tfe2."status_cancel" = 5) 
                 union all
            select fac."no_guia"
      ,replace(fac."num_guia",'700000','DL') fac_numero
      ,to_char(tfe."fecha_timbre",'DD/MM/YYYY') fecha 
      ,cli."nombre"
      ,cli."rfc"
      ,'DLIVER' sucursal
      ,fac."tipo_cobro"
      ,tfe."num_guia"
	  ,tfe."uuid" 
	  ,fac."subtotal" 
      --, tfe."folio" || cli."rfc" || tfe."uuid" || tfe."serie" ||fac."subtotal" || fac."iva_guia" ||fac."monto_retencion" ||0||0||(fac."subtotal"+fac."iva_guia"-fac."monto_retencion") ||1
      --select count(fac."no_guia")
      from trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX fac
      ,trafico_cliente@HSMSSQLTRA.ESTRELLAROJA.COM.MX cli
      ,trafico_factura_electronica@HSMSSQLTRA.ESTRELLAROJA.COM.MX tfe   
      where fac."id_cliente"  = cli."id_cliente"
      --and fac."replicado_ar" = 'N' -- TEMPORAL 130419
     -- And fac."num_guia" = 'TTP-229' -- TEMPORAL 130419
      and fac."id_area_facturacion" in ( '0','1')
      and fac."no_viaje" = '0' 
      and fac."tipo_doc" ='1'  
      and fac."status_guia" = 'C'  
	  and tfe."status"='2'
      --and fac."folio_factura" is null 
      and fac."no_guia" = tfe."no_guia"
      And TO_CHAR(fac."fecha_ingreso",'RRRR/MM/DD')>= '2021/02/01'
      and fac."num_guia" = tfe."num_guia"
      --And to_char(TFE.FECHA_INGRESO,'DD/MM/RRRR') = '25/02/2021'
      and not exists (select 1 
                 from  iner_xxer_puente_header_tbl tp 
                where tp.numero_documento = tfe."num_guia") 
      and not exists (select 1 
                 from trafico_factura_electronica@HSMSSQLTRA.ESTRELLAROJA.COM.MX tfe2 
                where tfe2."num_guia" = tfe."num_guia" 
                  and tfe2."status_cancel" = 5) ;
				  
				  
				  
				  'with '
                                                    ||'conc as (select tgo.no_guia,tgo.desc_otro,tgo.id_iva,tfo."clasificacion" clasificacion from zamtra_trafico_guia_otro tgo '
                                                    ||'    left join trafico_fact_otro@HSMSSQLTRA.ESTRELLAROJA.COM.MX tfo on tgo.id_otro = tfo."id_otro" '
                                                    ||'    where tgo.no_guia = '||no_guia1 
                                                    ||'     group by tgo.no_guia,tgo.desc_otro,tgo.id_iva,tfo."clasificacion"), '
                                                    ||'fac as (select no_guia,num_guia from zamtra_trafico_guia '
                                                    ||'    where no_guia = '||no_guia1
                                                    ||'     )'
                                                    ||' SELECT NULL concepto,aux.concepto monto_concepto,round(aux.monto_iva,2) monto_iva,aux.strorigenservicio from ('
                                                    ||'    (select conc.no_guia,sum(tg.autopistas) concepto,conc.desc_otro,sum(tg.autopistas*tg.factor_iva) monto_iva,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,''-'')-1) strOrigenServicio '
                                                    ||'        from zamtra_trafico_guia tg,fac,conc '
                                                    ||'        where num_guia_asignado = fac.num_guia '
                                                    ||'        and conc.clasificacion = ''A'' '
                                                    ||'        group by conc.no_guia,conc.desc_otro,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,''-'')-1) )'
                                                    ||'        ) aux '
                                                    ||'    where aux.concepto > 0 '	
                                                    ||'union all '
                                                    ||'SELECT NULL concepto,aux1.concepto monto_concepto,round(aux1.monto_iva,2) monto_iva,aux1.strOrigenServicio from ('
                                                    ||'    (select conc.no_guia,sum(tg.seguro) concepto,conc.desc_otro,sum(tg.seguro*tg.factor_iva) monto_iva,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,''-'')-1) strOrigenServicio ' 
                                                    ||'        from zamtra_trafico_guia tg,fac,conc ' 
                                                    ||'        where num_guia_asignado = fac.num_guia '
                                                    ||'        and conc.clasificacion = ''S'' '
                                                    ||'        group by conc.no_guia,conc.desc_otro,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,''-'')-1))'
                                                    ||'        ) aux1 '
                                                    ||'    where aux1.concepto > 0 '
                                                    ||'union all '
                                                    ||'SELECT NULL concepto,aux1.concepto monto_concepto,round(aux1.monto_iva,2) monto_iva,aux1.strOrigenServicio from ('
                                                    ||'    (select conc.no_guia,sum(tg.maniobras) concepto,conc.desc_otro,sum(tg.maniobras*tg.factor_iva) monto_iva,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,''-'')-1) strOrigenServicio ' 
                                                    ||'        from zamtra_trafico_guia tg,fac,conc '
                                                    ||'        where num_guia_asignado = fac.num_guia '
                                                    ||'        and conc.clasificacion = ''M'' '
                                                    ||'        group by conc.no_guia,conc.desc_otro,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,''-'')-1))'
                                                    ||'        ) aux1 '
                                                    ||'    where aux1.concepto > 0 '
                                                    ||'union all '
                                                    ||'SELECT NULL concepto,aux1.concepto monto_concepto,round(aux1.monto_iva,2) monto_iva,aux1.strOrigenServicio from ('
                                                    ||'    (select conc.no_guia,sum(tg.otros) concepto,conc.desc_otro,sum(tg.otros*tg.factor_iva) monto_iva,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,''-'')-1) strOrigenServicio '
                                                    ||'        from zamtra_trafico_guia tg,fac,conc '
                                                    ||'        where num_guia_asignado = fac.num_guia '
                                                    ||'        and conc.clasificacion = ''O'' '
                                                    ||'        group by conc.no_guia,conc.desc_otro,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,''-'')-1))'
                                                    ||'        ) aux1 '
                                                    ||'    where aux1.concepto > 0'
				  
				  
				  
				  
				  
				  
				  
				  with 
 conc as (select tgo.no_guia,tgo.desc_otro,tgo.id_iva,tfo."clasificacion" clasificacion from zamtra_trafico_guia_otro tgo 
     left join trafico_fact_otro@HSMSSQLTRA.ESTRELLAROJA.COM.MX tfo on tgo.id_otro = tfo."id_otro" 
     where tgo.no_guia = '27188' group by tgo.no_guia,tgo.desc_otro,tgo.id_iva,tfo."clasificacion"), 
 fac as (select no_guia,num_guia from zamtra_trafico_guia  where no_guia = '27188' )
  SELECT aux.desc_otro concepto,aux.concepto monto_concepto,round(aux.monto_iva,2) monto_iva,aux.strorigenservicio from (
     (select conc.no_guia,sum(tg.autopistas) concepto,conc.desc_otro,sum(tg.autopistas*tg.factor_iva) monto_iva,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1) strOrigenServicio 
         from zamtra_trafico_guia tg,fac,conc 
         where num_guia_asignado = fac.num_guia 
         and conc.clasificacion = 'A' 
         group by conc.no_guia,conc.desc_otro,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1) )
         ) aux where aux.concepto > 0 
 union all 
 SELECT aux1.desc_otro concepto,aux1.concepto monto_concepto,round(aux1.monto_iva,2) monto_iva,aux1.strOrigenServicio from (
     (select conc.no_guia,sum(tg.seguro) concepto,conc.desc_otro,sum(tg.seguro*tg.factor_iva) monto_iva,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1) strOrigenServicio 
         from zamtra_trafico_guia tg,fac,conc 
         where num_guia_asignado = fac.num_guia 
         and conc.clasificacion = 'S' 
         group by conc.no_guia,conc.desc_otro,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1))
         ) aux1 where aux1.concepto > 0 
 union all 
 SELECT aux1.desc_otro concepto,aux1.concepto monto_concepto,round(aux1.monto_iva,2) monto_iva,aux1.strOrigenServicio from (
     (select conc.no_guia,sum(tg.maniobras) concepto,conc.desc_otro,sum(tg.maniobras*tg.factor_iva) monto_iva,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1) strOrigenServicio 
         from zamtra_trafico_guia tg,fac,conc 
         where num_guia_asignado = fac.num_guia 
         and conc.clasificacion = 'M' 
         group by conc.no_guia,conc.desc_otro,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1))
         ) aux1  where aux1.concepto > 0 
 union all 
 SELECT aux1.desc_otro concepto,aux1.concepto monto_concepto,round(aux1.monto_iva,2) monto_iva,aux1.strOrigenServicio from (
     (select conc.no_guia,sum(tg.otros) concepto,conc.desc_otro,sum(tg.otros*tg.factor_iva) monto_iva,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1) strOrigenServicio 
         from zamtra_trafico_guia tg,fac,conc 
         where num_guia_asignado = fac.num_guia 
         and conc.clasificacion = 'O' 
         group by conc.no_guia,conc.desc_otro,SUBSTR(tg.num_guia,1,INSTR(tg.num_guia,'-')-1))
         ) aux1 where aux1.concepto > 0;
		 
		 
		 
		 
directo

 with 
 conc as (select tgo."no_guia",tgo."desc_otro",tgo."id_iva",tfo."clasificacion" clasificacion from trafico_guia_otro@HSMSSQLTRA.ESTRELLAROJA.COM.MX tgo 
     left join trafico_fact_otro@HSMSSQLTRA.ESTRELLAROJA.COM.MX tfo on tgo."id_otro" = tfo."id_otro" 
     where tgo."no_guia" = 27474 group by tgo."no_guia",tgo."desc_otro",tgo."id_iva",tfo."clasificacion"), 
 fac as (select "no_guia","num_guia" from trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX  where "no_guia" = 27474 )
  SELECT aux1."desc_otro" concepto,aux1.concepto monto_concepto,round(aux1.monto_iva,2) monto_iva,aux1.strOrigenServicio from (
     (select conc."no_guia",sum(tg."autopistas") concepto,conc."desc_otro",sum(tg."autopistas"*tg."factor_iva") monto_iva,SUBSTR(tg."num_guia",1,INSTR(tg."num_guia",'-')-1) strOrigenServicio 
         from trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX tg,fac,conc 
         where "num_guia_asignado" = fac."num_guia"
         and conc.clasificacion = 'A' 
         group by conc."no_guia",conc."desc_otro",SUBSTR(tg."num_guia",1,INSTR(tg."num_guia",'-')-1))
         ) aux1 where aux1.concepto > 0
 union all 
 SELECT aux1."desc_otro" concepto,aux1.concepto monto_concepto,round(aux1.monto_iva,2) monto_iva,aux1.strOrigenServicio from (
     (select conc."no_guia",sum(tg."seguro") concepto,conc."desc_otro",sum(tg."seguro"*tg."factor_iva") monto_iva,SUBSTR(tg."num_guia",1,INSTR(tg."num_guia",'-')-1) strOrigenServicio
         from trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX tg,fac,conc 
         where "num_guia_asignado" = fac."num_guia"
         and conc.clasificacion = 'S' 
         group by conc."no_guia",conc."desc_otro",SUBSTR(tg."num_guia",1,INSTR(tg."num_guia",'-')-1))
         ) aux1 where aux1.concepto > 0
 union all 
 SELECT aux1."desc_otro" concepto,aux1.concepto monto_concepto,round(aux1.monto_iva,2) monto_iva,aux1.strOrigenServicio from (
     (select conc."no_guia",sum(tg."maniobras") concepto,conc."desc_otro",sum(tg."maniobras"*tg."factor_iva") monto_iva,SUBSTR(tg."num_guia",1,INSTR(tg."num_guia",'-')-1) strOrigenServicio
         from trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX tg,fac,conc 
         where "num_guia_asignado" = fac."num_guia"
         and conc.clasificacion = 'M' 
         group by conc."no_guia",conc."desc_otro",SUBSTR(tg."num_guia",1,INSTR(tg."num_guia",'-')-1))
         ) aux1 where aux1.concepto > 0
 union all 
 SELECT aux1."desc_otro" concepto,aux1.concepto monto_concepto,round(aux1.monto_iva,2) monto_iva,aux1.strOrigenServicio from (
     (select conc."no_guia",sum(tg."otros") concepto,conc."desc_otro",sum(tg."otros"*tg."factor_iva") monto_iva,SUBSTR(tg."num_guia",1,INSTR(tg."num_guia",'-')-1) strOrigenServicio 
         from trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX tg,fac,conc 
         where "num_guia_asignado" = fac."num_guia"
         and conc.clasificacion = 'O' 
         group by conc."no_guia",conc."desc_otro",SUBSTR(tg."num_guia",1,INSTR(tg."num_guia",'-')-1))
         ) aux1 where aux1.concepto > 0;
		 
		 
		 
		 aptimizado
		 
		 
		 'with '
 ||'conc as (select tgo."no_guia",tgo."desc_otro",tgo."id_iva",tfo."clasificacion" clasificacion from trafico_guia_otro@HSMSSQLTRA.ESTRELLAROJA.COM.MX tgo '
  ||'   left join trafico_fact_otro@HSMSSQLTRA.ESTRELLAROJA.COM.MX tfo on tgo."id_otro" = tfo."id_otro" '
    ||' where tgo."no_guia" = '||no_guia1 ||' group by tgo."no_guia",tgo."desc_otro",tgo."id_iva",tfo."clasificacion"), '
 ||'fac as (select "no_guia","num_guia" from trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX  where "no_guia" = '||no_guia1 
 ||')'
 ||' SELECT   aux1."desc_otro" concepto,  aux1.concepto monto_concepto,  round(aux1.monto_iva,2) monto_iva,  aux1.strOrigenServicio '
  ||'from ('
   ||'  (select conc."no_guia",sum((case conc.clasificacion when ''A'' then  tg."autopistas" when ''S'' then  tg."seguro" when ''M'' then  tg."maniobras" else tg."otros" end )) concepto,     conc."desc_otro", sum((case conc.clasificacion when ''A'' then  tg."autopistas" when ''S'' then  tg."seguro" when ''M'' then  tg."maniobras" else tg."otros" end)*tg."factor_iva") monto_iva ,SUBSTR(tg."num_guia",1,INSTR(tg."num_guia",''-'')-1) strOrigenServicio '
  ||'       from trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX tg,fac,conc '
  ||'       where "num_guia_asignado" = fac."num_guia"'
   ||'      group by conc."no_guia",conc."desc_otro",SUBSTR(tg."num_guia",1,INSTR(tg."num_guia",''-'')-1))'
   ||'      ) aux1 where aux1.concepto > 0'
   
   
   
   		 with 
 conc as (select tgo."no_guia",tgo."desc_otro",tgo."id_iva",tfo."clasificacion" clasificacion from trafico_guia_otro@HSMSSQLTRA.ESTRELLAROJA.COM.MX tgo 
     left join trafico_fact_otro@HSMSSQLTRA.ESTRELLAROJA.COM.MX tfo on tgo."id_otro" = tfo."id_otro" 
     where tgo."no_guia" = 27474 group by tgo."no_guia",tgo."desc_otro",tgo."id_iva",tfo."clasificacion"), 
 fac as (select "no_guia","num_guia" from trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX  where "no_guia" = 27474 )
  SELECT   aux1."desc_otro" concepto,  aux1.concepto monto_concepto,  round(aux1.monto_iva,2) monto_iva,  aux1.strOrigenServicio 
  from (
     (select conc."no_guia",sum((case conc.clasificacion when 'A' then  tg."autopistas" when 'S' then  tg."seguro" when 'M' then  tg."maniobras" else tg."otros" end )) concepto,     conc."desc_otro", sum((case conc.clasificacion when 'A' then  tg."autopistas" when 'S' then  tg."seguro" when 'M' then  tg."maniobras" else tg."otros" end)*tg."factor_iva") monto_iva ,SUBSTR(tg."num_guia",1,INSTR(tg."num_guia",'-')-1) strOrigenServicio 
         from trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX tg,fac,conc 
         where "num_guia_asignado" = fac."num_guia"
         group by conc."no_guia",conc."desc_otro",SUBSTR(tg."num_guia",1,INSTR(tg."num_guia",'-')-1))
         ) aux1 where aux1.concepto > 0
		 
		 
		 
		 with 
 conc as (select tgo."no_guia",tgo."desc_otro",tgo."id_iva",tfo."clasificacion" clasificacion from trafico_guia_otro@HSMSSQLTRA.ESTRELLAROJA.COM.MX tgo 
     left join trafico_fact_otro@HSMSSQLTRA.ESTRELLAROJA.COM.MX tfo on tgo."id_otro" = tfo."id_otro" 
     where tgo."no_guia" = 27474 and tgo."consecutivo"=1 group by tgo."no_guia",tgo."desc_otro",tgo."id_iva",tfo."clasificacion" ), 
 fac as (select "no_guia","num_guia" from trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX  where "no_guia" = 27474 )
  SELECT   aux1."desc_otro" concepto,  aux1.concepto monto_concepto,  round(aux1.monto_iva,2) monto_iva,  aux1.strOrigenServicio 
  from (
     (select conc."no_guia",sum((case conc.clasificacion when 'A' then  tg."autopistas" when 'S' then  tg."seguro" when 'M' then  tg."maniobras" else tg."otros" end )) concepto,     conc."desc_otro", sum((case conc.clasificacion when 'A' then  tg."autopistas" when 'S' then  tg."seguro" when 'M' then  tg."maniobras" else tg."otros" end)*tg."factor_iva") monto_iva ,SUBSTR(tg."num_guia",1,INSTR(tg."num_guia",'-')-1) strOrigenServicio 
         from trafico_guia@HSMSSQLTRA.ESTRELLAROJA.COM.MX tg,fac,conc 
         where "num_guia_asignado" = fac."num_guia"
         group by conc."no_guia",conc."desc_otro",SUBSTR(tg."num_guia",1,INSTR(tg."num_guia",'-')-1))
         ) aux1 where aux1.concepto > 0
		 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		--CABECERA NOTAS DE CREDITO
		
		'SELECT NC.NO_GUIA'
       ||',REPLACE(NC.num_ncredito,''700000'',''DL'') FAC_NUMERO'
       ||',TO_CHAR(NC.FECHA_INGRESO,''DD/MM/YYYY'') FECHA' 
       ||',CLI.NOMBRE'
       ||',CLI.RFC'
       || ',NC.num_guia'
       || ',TG.TIPO_COBRO'
       || ',flo.nombre sucursal'
       || ',NC.MONTO_CREDITO'
       || ',NC.IVA_CREDITO'
       || ',NC.MONTO_RETENCION'
       ||', TFE.folio || ''|'' || CLI.RFC || ''|'' || TFE.uuid || ''|'' || TFE.serie || ''|'' || NC.monto_credito || ''|'' ||NC.iva_credito || ''|'' ||NC.monto_retencion || ''|0|0|'' || ( NC.monto_credito+NC.iva_credito-NC.monto_retencion) || ''|1'' '
       ||'  FROM ZAMTRA_TRAFICO_NOTA_CREDITO NC,'
       ||'  ZAMTRA_TRAFICO_CLIENTE CLI,'
       ||' ZAMTRA_TRAFICO_GUIA TG,'
       ||' ZAMTRA_MTTO_UNIDADES mtto,'
       ||' ZAMTRA_DESP_FLOTAS flo'
       || ',ZAMTRA_TRAFICO_FACTURA_ELEC TFE'  
       ||'  WHERE 1=1'
       ||' AND STATUS_NCRED=''A'''
       ||' AND CLI.ID_CLIENTE=NC.ID_CLIENTE'
       ||' AND NC.NO_GUIA=TG.NO_GUIA'
       ||' AND TG.id_unidad = mtto.id_unidad'
       ||' AND mtto.id_flota = flo.id_flota'
       --||' AND NC.REPLICADO_AR=''N''' -- TEMPORAL 130519
      -- IMM 041115, se prueba un join diferente con la tabla de Facturación Electronica   
      || ' And TFE.no_guia = 0'
      || ' And NC.num_ncredito in (''NC-490'')  ' -- TEMPORAL 130419
   -- || ' And TO_CHAR(NC.FECHA_INGRESO,''RRRR/MM/DD'') = ''2020/06/30'' ' -- TEMPORAL 130519
      || ' And NC.num_ncredito = TFE.num_guia';
		
		 
		 SELECT NC.NO_GUIA
       ,REPLACE(NC.num_ncredito,'700000','DL') FAC_NUMERO
       ,TO_CHAR(NC.FECHA_INGRESO,'DD/MM/YYYY') FECHA 
       ,CLI.NOMBRE
       ,CLI.RFC
        ,NC.num_guia
        ,TG.TIPO_COBRO
        ,flo.nombre sucursal
        ,NC.MONTO_CREDITO
        ,NC.IVA_CREDITO
        ,NC.MONTO_RETENCION
       , TFE.folio || '|' || CLI.RFC || '|' || TFE.uuid || '|' || TFE.serie || '|' || NC.monto_credito || '|' ||NC.iva_credito || '|' ||NC.monto_retencion || '|0|0|' || ( NC.monto_credito+NC.iva_credito-NC.monto_retencion) || '|1' 
         FROM ZAM_TRAFICO_NOTA_CREDITO@HSMSSQLTRA.ESTRELLAROJA.COM.MX NC,
         ZAM_TRAFICO_CLIENTE@HSMSSQLTRA.ESTRELLAROJA.COM.MX CLI,
        ZAM_TRAFICO_GUIA@HSMSSQLTRA.ESTRELLAROJA.COM.MX TG,
        ZAM_MTTO_UNIDADE@HSMSSQLTRA.ESTRELLAROJA.COM.MXS mtto,
        ZAM_DESP_FLOTAS@HSMSSQLTRA.ESTRELLAROJA.COM.MX flo
        ,ZAM_TRAFICO_FACTURA_ELECTRON@HSMSSQLTRA.ESTRELLAROJA.COM.MX TFE  
         WHERE 1=1
        AND STATUS_NCRED='A'
        AND CLI.ID_CLIENTE=NC.ID_CLIENTE
        AND NC.NO_GUIA=TG.NO_GUIA
        AND TG.id_unidad = mtto.id_unidad
        AND mtto.id_flota = flo.id_flota
        AND NC.REPLICADO_AR='N' -- TEMPORAL 130519
      -- IMM 041115, se prueba un join diferente con la tabla de Facturación Electronica   
        And TFE.no_guia = 0
     --   And NC.num_ncredito = 'CREDI-1783'   -- TEMPORAL 130419
        And TO_CHAR(NC.FECHA_INGRESO,'RRRR/MM/DD') = '2020/09/19'  -- TEMPORAL 130519
        And NC.num_ncredito = TFE.num_guia;  
		
		
		select nc."no_guia"
       ,replace(nc."num_ncredito",'700000','dl') fac_numero
       ,to_char(nc."fecha_ingreso",'dd/mm/yyyy') fecha 
       ,cli."nombre"
       ,cli."rfc"
        ,nc."num_guia"
        ,tg."tipo_cobro"
        ,flo."nombre"
        ,nc."monto_credito"
        ,nc."iva_credito"
        ,nc."monto_retencion"
       , tfe."folio" || '|' || cli."rfc" || '|' || tfe."uuid" || '|' || tfe."serie" || '|' || nc."monto_credito" || '|' ||nc."iva_credito" || '|' ||nc."monto_retencion" || '|0|0|' || ( nc."monto_credito"+nc."iva_credito"-nc."monto_retencion") || '|1' 
         from trafico_nota_credito@hsmssqltra.estrellaroja.com.mx nc,
         trafico_cliente@hsmssqltra.estrellaroja.com.mx cli,
        trafico_guia@hsmssqltra.estrellaroja.com.mx tg,
        mtto_unidades@hsmssqltra.estrellaroja.com.mx mtto,
       desp_flotas@hsmssqltra.estrellaroja.com.mx flo
        ,trafico_factura_electronica@hsmssqltra.estrellaroja.com.mx tfe 
         where 1=1
        and "status_ncred"='A'
        and cli."id_cliente"=nc."id_cliente"
        and nc."no_guia"=tg."no_guia"
        and tg."id_unidad" = mtto."id_unidad"
        and mtto."id_flota" = flo."id_flota"
       -- and nc.replicado_ar='n' -- temporal 130519
      -- imm 041115, se prueba un join diferente con la tabla de facturación electronica   
        and tfe."no_guia" = 0
        and nc."num_ncredito" = 'NC-490'   -- temporal 130419
        --and to_char(nc.fecha_ingreso,'rrrr/mm/dd') = '2020/09/19'  -- temporal 130519
        and nc."num_ncredito" = tfe."num_guia"
		and not exists (select 1 from  iner_xxer_puente_header_tbl tp where tp.numero_documento = nc."num_ncredito") ;
		
		
		
		
        'select nc."no_guia" '
       ||' ,replace(nc."num_ncredito",''700000'',''dl'') fac_numero'
       ||' ,to_char(nc."fecha_ingreso",''dd/mm/yyyy'') fecha '
       ||' ,cli."nombre"'
       ||' ,cli."rfc"'
       ||' ,nc."num_guia"'
        ||' ,tg."tipo_cobro"'
        ||' ,flo."nombre"'
        ||' ,nc."monto_credito"'
        ||' ,nc."iva_credito"'
        ||' ,nc."monto_retencion"'
       ||' , tfe."folio" || ''|'' || cli."rfc" || ''|'' || tfe."uuid" || ''|'' || tfe."serie" || ''|'' || nc."monto_credito" || ''|'' ||nc."iva_credito" || ''|'' ||nc."monto_retencion" || ''|0|0|'' || ( nc."monto_credito"+nc."iva_credito"-nc."monto_retencion") || ''|1'' '
        ||' from trafico_nota_credito@hsmssqltra.estrellaroja.com.mx nc,'
        ||' trafico_cliente@hsmssqltra.estrellaroja.com.mx cli,'
        ||' trafico_guia@hsmssqltra.estrellaroja.com.mx tg,'
        ||' mtto_unidades@hsmssqltra.estrellaroja.com.mx mtto,'
       ||' desp_flotas@hsmssqltra.estrellaroja.com.mx flo'
        ||' ,trafico_factura_electronica@hsmssqltra.estrellaroja.com.mx tfe '
         ||' where 1=1'
		 ||'and "status_ncred"=''A'''
        ||' and cli."id_cliente"=nc."id_cliente"'
        ||' and nc."no_guia"=tg."no_guia"'
        ||' and tg."id_unidad" = mtto."id_unidad"'
        ||' and mtto."id_flota" = flo."id_flota"'
		||' and tfe."no_guia" = 0'
        ||' and nc."num_ncredito" = ''NC-490'''   -- temporal 130419
        --and to_char(nc.fecha_ingreso,'rrrr/mm/dd') = '2020/09/19'  -- temporal 130519
        ||' and nc."num_ncredito" = tfe."num_guia"'
		||' and not exists (select 1 from  iner_xxer_puente_header_tbl tp where tp.numero_documento = nc."num_ncredito")';  
		
--------------------------------------------------------------------------------------------------------------------------
LINEAS NOTAS TRATECSA

 'SELECT NC.NUM_NCREDITO strCade1'
                         ||'  ,nvl (TOP.DESC_PRODUCTO, ''NO USAR'') strConcepto'
                         ||'  ,''FLETE_''|| (NC.num_guia)||''_''||TO_CHAR (SYSDATE, ''DD/MM/RRRR'') strDescripcion'
                         ||'  ,nvl(MAX (RNC.MONTO),0) importe'
                         ||' ,nvl(MAX (RNC.MONTO_IVA),0) strMonto_iva'
                         ||'  ,nvl(MAX (RNC.monto_retencion),0) strMonto_retencion'
                         ||'  ,NVL(DECODE(RNC.FACTOR_IVA,''16'',''AR_IVA16'',''11'',''AR_IVA11'',''0'',''AR_IVA_EXENTO''),'''') strCodigoIva'
                         ||'  ,NVL(MAX(DECODE(RNC.PORC_RETENCION,''4'',''AR_RET04'')),'''') strcodigoretencion'
                         ||'  ,(RNC.FACTOR_IVA) strtasa_iva'
                         ||'  ,(RNC.PORC_RETENCION) strtasa_retencion'
                       ||' FROM ZAMTRA_TRAFICO_NOTA_CREDITO NC,'
                         ||'  ZAMTRA_TRAFICO_RENGLON_NCREDI RNC,'
                         ||'  ZAMTRA_TRAFICO_CLIENTE CLI,'
                         --||'  ZAMTRA_DESP_TIPOOPERACION TOP,'
                         ||'  (select topIn.ID_FRACCION, topIn.DESC_PRODUCTO from ZAM_TRAFICO_PRODUCTO TOPIn where topIn.id_producto = 1) TOP,'
                         ||'  ZAMTRA_GENERAL_IVAS IV,'
                         ||'  ZAMTRA_GENERAL_RETENCIONES RET,'
                         ||'  ZAMTRA_TRAFICO_GUIA TG'
                     ||' WHERE NC.ID_NCREDITO = RNC.ID_NCREDITO'
                       ||' AND NC.NO_GUIA='||NO_GUIA1
                       ||' AND STATUS_NCRED=''A'''
                       ||' AND CLI.ID_CLIENTE=NC.ID_CLIENTE'
                       ||' AND NC.NO_GUIA=TG.NO_GUIA'
                       ||' AND TG.ID_FRACCION = top.ID_FRACCION(+)'
                       ||' AND IV.ID_IVA=RNC.ID_IVA'
                       ||' AND RET.ID_RETENCION=RNC.ID_RETENCION'
                        ||' AND NC.REPLICADO_AR=''N''' -- TEMPORAL 150519
                    ||' GROUP BY NC.NUM_NCREDITO'
                         ||'  ,nvl (TOP.DESC_PRODUCTO, ''NO USAR'')'
                         ||'  ,''FLETE_''|| (NC.num_guia)||''_''||TO_CHAR (SYSDATE, ''DD/MM/RRRR'')'
                         ||'  ,NVL(DECODE(RNC.FACTOR_IVA,''16'',''AR_IVA16'',''11'',''AR_IVA11'',''0'',''AR_IVA_EXENTO''),'''')'
                         ||'  ,(RNC.FACTOR_IVA)'
                         ||'  ,(RNC.PORC_RETENCION)';		
		
		SELECT NC.NUM_NCREDITO strCade1
                          ,nvl (TOP.DESC_PRODUCTO, 'NO USAR') strConcepto
                           ,'FLETE_'|| (NC.num_guia)||'_'||TO_CHAR (SYSDATE, 'DD/MM/RRRR') strDescripcion
                         ,nvl(MAX (RNC.MONTO),0) importe
                         ,nvl(MAX (RNC.MONTO_IVA),0) strMonto_iva
                          ,nvl(MAX (RNC.monto_retencion),0) strMonto_retencion
                          ,NVL(DECODE(RNC.FACTOR_IVA,'16','AR_IVA16','11','AR_IVA11','0','AR_IVA_EXENTO'),'') strCodigoIva
                          ,NVL(MAX(DECODE(RNC.PORC_RETENCION,'4','AR_RET04')),'') strcodigoretencion
                         ,(RNC.FACTOR_IVA) strtasa_iva
                          ,(RNC.PORC_RETENCION) strtasa_retencion
                       FROM ZAMTRA_TRAFICO_NOTA_CREDITO NC,
                          ZAMTRA_TRAFICO_RENGLON_NCREDI RNC,
                         ZAMTRA_TRAFICO_CLIENTE CLI,
                         -- ZAMTRA_DESP_TIPOOPERACION TOP,
                         (select topIn.ID_FRACCION, topIn.DESC_PRODUCTO from ZAM_TRAFICO_PRODUCTO TOPIn where topIn.id_producto = 2) TOP,
                          ZAMTRA_GENERAL_IVAS IV,
                          ZAMTRA_GENERAL_RETENCIONES RET,
                        ZAMTRA_TRAFICO_GUIA TG
                     WHERE NC.ID_NCREDITO = RNC.ID_NCREDITO
                       AND NC.NO_GUIA=26109
                       AND STATUS_NCRED='A'
                        AND CLI.ID_CLIENTE=NC.ID_CLIENTE
                       AND NC.NO_GUIA=TG.NO_GUIA
                        AND TG.ID_FRACCION = top.ID_FRACCION(+)
                        AND IV.ID_IVA=RNC.ID_IVA
                        AND RET.ID_RETENCION=RNC.ID_RETENCION
                         --AND NC.REPLICADO_AR='N' -- TEMPORAL 150519
                     GROUP BY NC.NUM_NCREDITO
                           ,nvl (TOP.DESC_PRODUCTO, 'NO USAR')
                           ,'FLETE_'|| (NC.num_guia)||'_'||TO_CHAR (SYSDATE, 'DD/MM/RRRR')
                           ,NVL(DECODE(RNC.FACTOR_IVA,'16','AR_IVA16','11','AR_IVA11','0','AR_IVA_EXENTO'),'')
                           ,(RNC.FACTOR_IVA)
                           ,(RNC.PORC_RETENCION);
						   
						   
						   
						   
						   
SELECT nc."num_ncredito" strcade1
                          ,nvl (top."desc_producto", 'NO USAR') strconcepto
                           ,'FLETE_'|| (nc."num_guia")||'_'||to_char (sysdate, 'DD/MM/RRRR') strdescripcion
                         ,nvl(MAX (trunc(rnc."monto",2)),0) importe
                         ,nvl(MAX (trunc(rnc."monto_iva",2)),0) strmonto_iva
                          ,nvl(MAX (trunc(rnc."monto_retencion",2) ),0) strmonto_retencion
                          ,nvl(decode(CAST(rnc."factor_iva" AS INT),'16','AR_IVA16','11','AR_IVA11','0','AR_IVA_EXENTO'),'') strcodigoiva
                          ,nvl(MAX(decode(CAST(rnc."porc_retencion" AS INT),'4','AR_RET04')),'') strcodigoretencion
                         ,CAST(rnc."factor_iva"  AS INT) strtasa_iva
                          ,CAST(rnc."porc_retencion"  AS INT) strtasa_retencion
                       FROM trafico_nota_credito@hsmssqltra.estrellaroja.COM.mx nc,
                          xer_trafico_renglon_ncredito_v@hsmssqltra.estrellaroja.COM.mx rnc,
                         trafico_cliente@hsmssqltra.estrellaroja.COM.mx cli,
                         --DESP_TIPOOPERACION@hsmssqltra.estrellaroja.com.mx TOP,
                         (SELECT topin."id_fraccion", topin."desc_producto" FROM trafico_producto@hsmssqltra.estrellaroja.COM.mx topin WHERE topin."id_producto" = 1) top,
                          general_ivas@hsmssqltra.estrellaroja.COM.mx iv,
                          general_retenciones@hsmssqltra.estrellaroja.COM.mx ret,
                        trafico_guia@hsmssqltra.estrellaroja.COM.mx tg
                     WHERE nc."id_ncredito" = rnc."id_ncredito"
                       AND nc."no_guia"=26109
                       AND "status_ncred"='A'
                        AND cli."id_cliente"=nc."id_cliente"
                       AND nc."no_guia"=tg."no_guia"
                        AND tg."id_fraccion" = top."id_fraccion"(+)
                        AND iv."id_iva"=rnc."id_iva"
                        AND ret."id_retencion"=rnc."id_retencion"
                         --AND NC.REPLICADO_AR='N' -- TEMPORAL 150519
                     GROUP BY nc."num_ncredito"
                           ,nvl (top."desc_producto", 'NO USAR')
                           ,'FLETE_'|| (nc."num_guia")||'_'||to_char (sysdate, 'DD/MM/RRRR')
                           ,nvl(decode(rnc."factor_iva",'16','AR_IVA16','11','AR_IVA11','0','AR_IVA_EXENTO'),'')
                           ,(rnc."factor_iva")
                           ,(rnc."porc_retencion");
						   
						   
						   
						   'SELECT nc."num_ncredito" strcade1'
                          ||' ,nvl (top."desc_producto", ''NO USAR'') strconcepto'
                           ||' ,''FLETE_''|| (nc."num_guia")||''_''||to_char (sysdate, ''DD/MM/RRRR'') strdescripcion'
                         ||' ,nvl(MAX (trunc(rnc."monto",2)),0) importe'
                         ||' ,nvl(MAX (trunc(rnc."monto_iva",2)),0) strmonto_iva'
                          ||' ,nvl(MAX (trunc(rnc."monto_retencion",2) ),0) strmonto_retencion'
                          ||' ,nvl(decode(CAST(rnc."factor_iva" AS INT),''16'',''AR_IVA16'',''11'',''AR_IVA11'',''0'',''AR_IVA_EXENTO''),'''') strcodigoiva'
                          ||' ,nvl(MAX(decode(CAST(rnc."porc_retencion" AS INT),''4'',''AR_RET04'')),'''') strcodigoretencion'
                         ||' ,CAST(rnc."factor_iva"  AS INT) strtasa_iva'
                          ||' ,CAST(rnc."porc_retencion"  AS INT) strtasa_retencion'
                       ||' FROM trafico_nota_credito@hsmssqltra.estrellaroja.COM.mx nc,'
                          ||' xer_trafico_renglon_ncredito_v@hsmssqltra.estrellaroja.COM.mx rnc,'
                         ||' trafico_cliente@hsmssqltra.estrellaroja.COM.mx cli,'
                         --DESP_TIPOOPERACION@hsmssqltra.estrellaroja.com.mx TOP,
                         ||' (SELECT topin."id_fraccion", topin."desc_producto" FROM trafico_producto@hsmssqltra.estrellaroja.COM.mx topin WHERE topin."id_producto" = 1) top,'
                          ||' general_ivas@hsmssqltra.estrellaroja.COM.mx iv,'
                          ||' general_retenciones@hsmssqltra.estrellaroja.COM.mx ret,'
                        ||' trafico_guia@hsmssqltra.estrellaroja.COM.mx tg'
                     ||' WHERE nc."id_ncredito" = rnc."id_ncredito"'
                       ||' AND nc."no_guia"=26109'
                       ||' AND "status_ncred"=''A'''
                        ||' AND cli."id_cliente"=nc."id_cliente"'
                       ||' AND nc."no_guia"=tg."no_guia"'
                       ||'  AND tg."id_fraccion" = top."id_fraccion"(+)'
                        ||' AND iv."id_iva"=rnc."id_iva"'
                        ||' AND ret."id_retencion"=rnc."id_retencion"'
                         --AND NC.REPLICADO_AR=''N'' -- TEMPORAL 150519
                     ||' GROUP BY nc."num_ncredito"'
                           ||' ,nvl (top."desc_producto", ''NO USAR'')'
                           ||' ,''FLETE_''|| (nc."num_guia")||''_''||to_char (sysdate, ''DD/MM/RRRR'')'
                           ||' ,nvl(decode(rnc."factor_iva",''16'',''AR_IVA16'',''11'',''AR_IVA11'',''0'',''AR_IVA_EXENTO''),'''')'
                           ||' ,(rnc."factor_iva")'
                           ||' ,(rnc."porc_retencion")';
						   