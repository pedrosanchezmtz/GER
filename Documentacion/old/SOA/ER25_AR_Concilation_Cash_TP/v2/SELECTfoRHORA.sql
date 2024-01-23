select qf.folio_preimpreso,
qf.SERVICIO_ID,
qf.empresa,
qf.importe_boleto,           
qf.tipo_operacion,
          qf.corte_id,
		  qf.fecha_hora_venta,
         qf.origen,
          qf.clave_corrida,
          qf.CAJA_ID,
          qf.CAJA from (SELECT tmsemp.empresa_id,
          tmsbol.empresa,
          TMSSER.SERVICIO_ID,
          CASE
             WHEN     TMSBOL.ORIGEN = 'ZOCALO'
                  AND TMSBOL.DESTINO IN ('CHOL',
                                         'VIRREYNAL',
                                         'NOCTURNO',
                                         'CLARA',
                                         'TRANVIA')
             THEN
                'TV'
             ELSE
                tmsser.servicio_clave
          END
             origen_destino,
          tmsest.estado_id,
          tmsbol.ciudad_venta origen,
          tmsdes.estado_id,
          TMSBOL.DESTINO,
          CASE
             --when TMSBOL.CAJA         in ('AEROBUS-HP','PV236')
             WHEN     TMSBOL.CAJA = 'AEROBUS-HP'
                  AND TMSBOL.TIPO_PAGO NOT IN ('BAB',
                                               'BAF',
                                               'CES',
                                               'BAU',
                                               'UNT',
                                               'UPP',
                                               'VOL')
             THEN
                19
             --WHEN TMSBOL.CAJA          = 'PV041' 16122014 Cambio de INTERMEC ViaSanAngel
             WHEN     TMSBOL.CAJA = 'PV366'
                  AND tmsbol.fecha_creacion >
                         TO_DATE ('01/11/2013 00:00:00',
                                  'DD/MM/RRRR HH24:MI:SS')
                  AND TMSBOL.TIPO_PAGO NOT IN ('BAB',
                                               'BAF',
                                               'CES',
                                               'BAU',
                                               'UNT',
                                               'UPP',
                                               'VOL')
             THEN
                19
             ELSE
                DECODE (TMSBOL.CLIENTE_ID, 22718, 17, TMSPAG.TIPO_PAGO_ID)
          END
             caja_tipo_pago,
          --DECODE(tmsbol.cliente_id,22718,'UPP',tmsbol.tipo_pago) tipo_pago,
          --DECODE(TMSBOL.ADICIONAL1,'AMEX','AMX',(DECODE(TMSBOL.CLIENTE_ID,22718,'UPP',TMSBOL.TIPO_PAGO))) TIPO_PAGO,
          CASE
             WHEN (TMSBOL.ADICIONAL1 = 'AMEX' AND TMSBOL.TIPO_PAGO = 'BBV')
             THEN
                'AMX'
             --WHEN TMSBOL.CAJA         IN ('AEROBUS-HP','PV236')
             WHEN     TMSBOL.CAJA = 'AEROBUS-HP'
                  AND TMSBOL.TIPO_PAGO NOT IN ('BAB',
                                               'BAF',
                                               'CES',
                                               'BAU',
                                               'UNT',
                                               'UPP',
                                               'VOL')
             THEN
                'CRE'
             WHEN     TMSBOL.CAJA = 'PV366'
                  AND TMSBOL.FECHA_CREACION >
                         TO_DATE ('01/11/2013 00:00:00',
                                  'DD/MM/RRRR HH24:MI:SS')
                  AND TMSBOL.TIPO_PAGO NOT IN ('BAB',
                                               'BAF',
                                               'CES',
                                               'BAU',
                                               'UNT',
                                               'UPP',
                                               'VOL')
             THEN
                'CRE'
             ELSE
                (DECODE (TMSBOL.CLIENTE_ID, 22718, 'UPP', TMSBOL.TIPO_PAGO))
          END
             caja_tipo_pago2,
          --DECODE (TMSBOL.TIPO_OPERACION, 'HO', 0, 'FO', 0, TMSBOL.IMPORTE_BOLETO ) IMPORTE_BOLETO,
          DECODE (
             tmsbol.tipo_operacion,
             'HO', 0,
             'FO', 0,
             'CN', (  (PCENTRAL.XER_TMS_PKG3.GET_DATO_IVA_DESGLOSADO_PRC (
                          tmsbol.folio_preimpreso,
                          'IMPORTE_BOLETO',
                          tmsbol.EMPRESA))
                    * -1),
             PCENTRAL.XER_TMS_PKG3.GET_DATO_IVA_DESGLOSADO_PRC (
                tmsbol.folio_preimpreso,
                'IMPORTE_BOLETO',
                tmsbol.EMPRESA)) importe_boleto,
          tmsbol.fecha_creacion,
          tmsbol.tipo_operacion || '-' || tmsbol.folio_preimpreso,
          tmsbol.tipo_operacion,
          tmscor.corte_id,
		  tmsbol.fecha_hora_venta,
          tmscor.fecha_creacion,
          tmsbol.clave_corrida,
          CAJ.CAJA_ID,
          TMSBOL.CAJA,
          CASE
             WHEN     TMSBOL.ORIGEN = 'ZOCALO'
                  AND TMSBOL.DESTINO IN ('CHOL',
                                         'VIRREYNAL',
                                         'NOCTURNO',
                                         'CLARA',
                                         'TRANVIA')
             THEN
             THEN
                'SERVICIO DE TURISMO TRANVIA'
             ELSE
                tmsser.SERVICIO_NOMBRE
          END
             CASE,
          tmsbol.origen  origenBol,
          --DECODE(tmsbol.FOLIO_PREIMPRESO,'49836584',527,'49836582',527,'49836583',527,'49832623',527,'49836581',521,'49836237',521,'49836238',521, tmsbol.CLIENTE_ID)
          CASE
             WHEN (TMSBOL.CIUDAD_VENTA = 'WEB' AND TMSBOL.TIPO_PAGO = 'OR1')
             THEN
                193
             WHEN TMSBOL.TIPO_PAGO = 'BAU'
             THEN
                118
             WHEN TMSBOL.CAJA = 'AEROBUS-HP'
             THEN
                1111
             --WHEN TMSBOL.CAJA = 'PV236'
             WHEN (    TMSBOL.CAJA = 'PV366'
                   AND TMSBOL.FECHA_CREACION >
                          TO_DATE ('01/11/2013 00:00:00',
                                   'DD/MM/RRRR HH24:MI:SS'))
             THEN
                1112
             WHEN TMSBOL.TIPO_PAGO = 'UPP'
             THEN
                97
             WHEN TMSBOL.CLIENTE_ID = 22718
             THEN
                97
             WHEN (    TMSBOL.CIUDAD_VENTA = 'WEB'
                   AND TMSBOL.CLIENTE_ID IN (70592, 70593, 70585))
             THEN
                3456
             WHEN (    TMSBOL.CIUDAD_VENTA = 'WEB'
                   AND TMSBOL.CLIENTE_ID IN (71837))
             THEN
                194
             WHEN TMSBOL.TIPO_PAGO = 'VJS' AND TMSBOL.CLIENTE_ID IS NULL
             THEN
                245
             ELSE
                TMSBOL.CLIENTE_ID
          END
             CASE                                          --tmsbol.CLIENTE_ID
                 ,
          NVL (
             DECODE (
                TMSBOL.TIPO_OPERACION,
                'CN', (  (PCENTRAL.XER_TMS_PKG3.GET_DATO_IVA_DESGLOSADO_PRC (
                             TMSBOL.FOLIO_PREIMPRESO,
                             'SUBTOTAL_BOLETO',
                             TMSBOL.EMPRESA))
                       * -1),
                PCENTRAL.XER_TMS_PKG3.GET_DATO_IVA_DESGLOSADO_PRC (
                   TMSBOL.FOLIO_PREIMPRESO,
                   'SUBTOTAL_BOLETO',
                   TMSBOL.EMPRESA)),
             TMSBOL.IMPORTE_BOLETO),
          DECODE (
             TMSBOL.TIPO_OPERACION,
             'CN', (  (PCENTRAL.XER_TMS_PKG3.GET_DATO_IVA_DESGLOSADO_PRC (
                          TMSBOL.FOLIO_PREIMPRESO,
                          'PORCENTAJE_IVA',
                          TMSBOL.EMPRESA))
                    * -1),
             PCENTRAL.XER_TMS_PKG3.GET_DATO_IVA_DESGLOSADO_PRC (
                TMSBOL.FOLIO_PREIMPRESO,
                'PORCENTAJE_IVA',
                TMSBOL.EMPRESA)),
          NVL (
             DECODE (
                TMSBOL.TIPO_OPERACION,
                'CN', (  (PCENTRAL.XER_TMS_PKG3.GET_DATO_IVA_DESGLOSADO_PRC (
                             TMSBOL.FOLIO_PREIMPRESO,
                             'IMPORTE_IVA_BOLETO',
                             TMSBOL.EMPRESA))
                       * -1),
                PCENTRAL.XER_TMS_PKG3.GET_DATO_IVA_DESGLOSADO_PRC (
                   TMSBOL.FOLIO_PREIMPRESO,
                   'IMPORTE_IVA_BOLETO',
                   TMSBOL.EMPRESA)),
             TMSBOL.IMPORTE_BOLETO),
          --XER_TMS_PKG3.GET_DATO_IVA_DESGLOSADO_PRC(tmsbol.folio_preimpreso,'SUBTOTAL_BOLETO') ,
          --XER_TMS_PKG3.GET_DATO_IVA_DESGLOSADO_PRC(TMSBOL.FOLIO_PREIMPRESO,'PORCENTAJE_IVA') ,
          --XER_TMS_PKG3.GET_DATO_IVA_DESGLOSADO_PRC(TMSBOL.FOLIO_PREIMPRESO,'IMPORTE_IVA_BOLETO') ,
          'BOLETOS DE AUTOBUS',
          tmsbol.folio_preimpreso
     FROM PCENTRAL.tms_boletos_venta_tbl tmsbol,
          PCENTRAL.tms_servicios_tbl tmsser,
          PCENTRAL.tms_vta_tipos_pago_tbl tmspag,
          PCENTRAL.tms_cortes_tbl tmscor,
          PCENTRAL.tms_empresas_tbl tmsemp,
          PCENTRAL.tms_estados_tbl tmsest,
          PCENTRAL.tms_estados_tbl tmsdes,
          PCENTRAL.tms_cajas_tbl caj
    WHERE     tmsbol.servicio = tmsser.servicio_nombre
          AND tmsbol.ciudad_venta = tmsest.estado_nombre
          AND tmsbol.tipo_pago = tmspag.clave
          AND tmsbol.tipo_transaccion = 'L'
          AND tmsbol.corte_id = tmscor.corte_id
          AND tmscor.estado_corte = 'R'
          AND tmsbol.empresa = tmsemp.empresa_nombre
          AND tmsbol.destino = tmsdes.estado_nombre
          AND TMSBOL.CAJA = CAJ.CAJA_NOMBRE(+)
          AND TMSBOL.TIPO_OPERACION NOT IN ('HO', 'FO')          -- IMM 020911
          AND TMSBOL.TIPO_PAGO != 'BRF'
  -- AND TMSBOL.BOLETO_ID          IN (115999160)
   UNION ALL
   SELECT tmsemp2.empresa_id,
          tmsbol2.empresa,
          tmsser2.SERVICIO_ID,
          CASE
             WHEN     tmsbol2.ORIGEN = 'ZOCALO'
                  AND tmsbol2.DESTINO IN ('CHOL',
                                          'VIRREYNAL',
                                          'NOCTURNO',
                                          'CLARA',
                                          'TRANVIA')
             THEN
                'TV'
             ELSE
                tmsser2.servicio_clave
          END
             origen_destino,
          tmsest2.estado_id,
          tmsbol2.ciudad_venta origen,
          TMSDES2.estado_id,
          tmsbol2.DESTINO,
          CASE
             --when tmsbol2.CAJA         in ('AEROBUS-HP','PV236')
             WHEN     tmsbol2.CAJA = 'AEROBUS-HP'
                  AND tmsbol2.TIPO_PAGO NOT IN ('BAB',
                                                'BAF',
                                                'CES',
                                                'BAU',
                                                'UNT',
                                                'UPP',
                                                'VOL')
             THEN
                19
             WHEN     tmsbol2.CAJA = 'PV366'
                  AND tmsbol2.fecha_creacion >
                         TO_DATE ('01/11/2013 00:00:00',
                                  'DD/MM/RRRR HH24:MI:SS')
                  AND tmsbol2.TIPO_PAGO NOT IN ('BAB',
                                                'BAF',
                                                'CES',
                                                'BAU',
                                                'UNT',
                                                'UPP',
                                                'VOL')
             THEN
                19
             ELSE
                DECODE (tmsbol2.CLIENTE_ID, 22718, 17, tmspag2.TIPO_PAGO_ID)
          END
             caja_tipo_pago,
          --DECODE(tmsbol2.cliente_id,22718,'UPP',tmsbol2.tipo_pago) tipo_pago,
          --DECODE(tmsbol2.ADICIONAL1,'AMEX','AMX',(DECODE(tmsbol2.CLIENTE_ID,22718,'UPP',tmsbol2.TIPO_PAGO))) TIPO_PAGO,
          CASE
             WHEN (tmsbol2.ADICIONAL1 = 'AMEX' AND tmsbol2.TIPO_PAGO = 'BBV')
             THEN
                'AMX'
             --WHEN tmsbol2.CAJA         IN ('AEROBUS-HP','PV236')
             WHEN     tmsbol2.CAJA = 'AEROBUS-HP'
                  AND tmsbol2.TIPO_PAGO NOT IN ('BAB',
                                                'BAF',
                                                'CES',
                                                'BAU',
                                                'UNT',
                                                'UPP',
                                                'VOL')
             THEN
                'CRE'
             WHEN     tmsbol2.CAJA = 'PV366'
                  AND tmsbol2.FECHA_CREACION >
                         TO_DATE ('01/11/2013 00:00:00',
                                  'DD/MM/RRRR HH24:MI:SS')
                  AND tmsbol2.TIPO_PAGO NOT IN ('BAB',
                                                'BAF',
                                                'CES',
                                                'BAU',
                                                'UNT',
                                                'UPP',
                                                'VOL')
             THEN
                'CRE'
             ELSE
                (DECODE (tmsbol2.CLIENTE_ID, 22718, 'UPP', tmsbol2.TIPO_PAGO))
          END
             caja_tipo_pago2,
          --DECODE (TMSBOL2.TIPO_OPERACION, 'HO', 0, 'FO', 0, TMSBOL2.IMPORTE_BOLETO ) IMPORTE_BOLETO,
          DECODE (
             tmsbol2.tipo_operacion,
             'HO', 0,
             'FO', 0,
             'CN', (  (PCENTRAL.XER_TMS_PKG3.GET_DATO_IVA_DESGLOSADO_PRC (
                          tmsbol2.folio_preimpreso,
                          'IMPORTE_ENTRADA',
                          tmsbol2.EMPRESA))
                    * -1),
             PCENTRAL.XER_TMS_PKG3.GET_DATO_IVA_DESGLOSADO_PRC (
                tmsbol2.folio_preimpreso,
                'IMPORTE_ENTRADA',
                tmsbol2.EMPRESA))        importe_boleto,
          tmsbol2.fecha_creacion,
          tmsbol2.tipo_operacion || '-' || tmsbol2.folio_preimpreso,
          tmsbol2.tipo_operacion,
          tmscor2.corte_id,
		  tmsbol2.fecha_hora_venta,
          tmscor2.fecha_creacion,
          tmsbol2.clave_corrida,
          CAJ2.CAJA_ID,
          tmsbol2.CAJA,
          CASE
             WHEN     tmsbol2.ORIGEN = 'ZOCALO'
                  AND tmsbol2.DESTINO IN ('CHOL',
                                          'VIRREYNAL',
                                          'NOCTURNO',
                                          'CLARA',
                                          'TRANVIA')
             THEN
                'SERVICIO DE TURISMO TRANVIA'
             ELSE
                tmsser2.SERVICIO_NOMBRE
          END
             CASE,
          tmsbol2.origenBol,
          --DECODE(tmsbol2.FOLIO_PREIMPRESO,'49836584',527,'49836582',527,'49836583',527,'49832623',527,'49836581',521,'49836237',521,'49836238',521, tmsbol2.CLIENTE_ID)
          CASE
             WHEN (tmsbol2.CIUDAD_VENTA = 'WEB' AND tmsbol2.TIPO_PAGO = 'OR1')
             THEN
                193
             WHEN tmsbol2.TIPO_PAGO = 'BAU'
             THEN
                118
             WHEN tmsbol2.CAJA = 'AEROBUS-HP'
             THEN
                1111
             --WHEN tmsbol2.CAJA = 'PV236'
             WHEN (    tmsbol2.CAJA = 'PV366'
                   AND tmsbol2.FECHA_CREACION >
                          TO_DATE ('01/11/2013 00:00:00',
                                   'DD/MM/RRRR HH24:MI:SS'))
             THEN
                1112
             WHEN tmsbol2.TIPO_PAGO = 'UPP'
             THEN
                97
             WHEN tmsbol2.CLIENTE_ID = 22718
             THEN
                97
             WHEN (    tmsbol2.CIUDAD_VENTA = 'WEB'
                   AND tmsbol2.CLIENTE_ID IN (70592, 70593, 70585))
             THEN
                3456
             WHEN (    tmsbol2.CIUDAD_VENTA = 'WEB'
                   AND tmsbol2.CLIENTE_ID IN (71837))
             THEN
                194
             WHEN tmsbol2.TIPO_PAGO = 'VJS' AND tmsbol2.CLIENTE_ID IS NULL
             THEN
                245
             ELSE
                tmsbol2.CLIENTE_ID
          END
             CASE                                         --tmsbol2.CLIENTE_ID
                 ,
          0,
          0,
          0,
          'BOLETOS DE PARQUE',
          tmsbol2.folio_preimpreso
     FROM PCENTRAL.tms_boletos_venta_tbl tmsbol2,
          PCENTRAL.tms_servicios_tbl tmsser2,
          PCENTRAL.tms_vta_tipos_pago_tbl tmspag2,
          PCENTRAL.tms_cortes_tbl tmscor2,
          PCENTRAL.tms_empresas_tbl tmsemp2,
          PCENTRAL.tms_estados_tbl tmsest2,
          PCENTRAL.TMS_ESTADOS_TBL TMSDES2,
          PCENTRAL.TMS_CAJAS_TBL CAJ2,
          PCENTRAL.TMS_RUTAS_TBL R2,
          PCENTRAL.TMS_CORRIDAS_TBL C2,
          PCENTRAL.TMS_PARAMETROS_CONFIG_TBL P2,
          PCENTRAL.TMS_RUTA_PARAMETROS_TBL RP2
    WHERE     tmsbol2.servicio = tmsser2.servicio_nombre
          AND tmsbol2.ciudad_venta = tmsest2.estado_nombre
          AND tmsbol2.tipo_pago = tmspag2.clave
          AND tmsbol2.tipo_transaccion = 'L'
          AND tmsbol2.corte_id = tmscor2.corte_id
          AND tmscor2.estado_corte = 'R'
          AND tmsbol2.empresa = tmsemp2.empresa_nombre
          AND tmsbol2.destino = TMSDES2.estado_nombre
          AND tmsbol2.CAJA = CAJ2.CAJA_NOMBRE(+)
          AND tmsbol2.TIPO_OPERACION NOT IN ('HO', 'FO')         -- IMM 020911
          AND tmsbol2.TIPO_PAGO != 'BRF'
          --AND TRUNC(tmsbol2.FECHA_CREACION) = TO_DATE('01/12/2013','DD/MM/RRRR')
          --and tmsbol2.servicio = 'SERVICIO DE TURISMO'
          AND C2.CLAVE_CORRIDA = tmsbol2.CLAVE_CORRIDA
          AND R2.RUTA_ID = C2.RUTA_ID
          AND NVL (R2.ADICIONAL4, 'N') = 'S'
          AND tmsbol2.TIPO_PASAJERO IN ('A', 'M')
          AND P2.PARAMETRO_CODIGO =
                 DECODE (tmsbol2.TIPO_PAsajero,
                         'A', 'P_BPARQUE_ADULTO',
                         'P_BPARQUE_MENOR')
          AND P2.PARAMETRO_CONFIG_ID = RP2.PARAMETRO_CONFIG_ID
          AND RP2.RUTA_ID = C2.RUTA_ID
--AND TMSBOL2.BOLETO_ID      IN (115999160)
)qf where 1=1
and rownum<=5
;
