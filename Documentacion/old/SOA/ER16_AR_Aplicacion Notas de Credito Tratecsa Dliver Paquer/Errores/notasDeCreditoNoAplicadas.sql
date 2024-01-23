select config.unidad_operativa BusinessUnit
            ,H.NUMERO_DOCUMENTO CreditMemoTrxNumber
            ,SUBSTR(L.REFERENCIA_APLICACION,1,INSTR(L.REFERENCIA_APLICACION,'_')-1) InvoiceTrxNumber
            ,SUBSTR(L.REFERENCIA_APLICACION,INSTR(L.REFERENCIA_APLICACION,'_')+1) AmountApplied
            ,H.FECHA_MOVIMIENTO GlDate
            ,h.tabla_puente_id
            ,L.TOTAL
        from INER_XXER_PUENTE_HEADER_TBL h
          ,INER_XXER_PUENTE_LINES_TBL l
          ,INER_XXER_CNF_INTERFASE_INGRESOS_AR_TBL config
        WHERE 1=1
          AND H.TABLA_PUENTE_ID = L.TABLA_PUENTE_ID(+)
          AND NVL(config.sistema_origen,1) = NVL(H.sistema_origen,1)
          AND NVL(config.tipo_documento,1) = NVL(H.tipo_documento,1)
          AND NVL(config.tipo_movimiento,1) = NVL(H.tipo_movimiento,1)
          AND NVL(config.rfc_origen,1) = NVL(H.rfc_origen,1)
          AND DECODE(NVL(config.sucursal_venta,1),'TODOS', NVL(H.sucursal_venta,1),NVL(config.sucursal_venta,1)) = NVL(H.sucursal_venta,1)
          AND DECODE(NVL(config.origen_servicio,1),'TODOS', NVL(L.origen_servicio,1), NVL(config.origen_servicio,1)) = NVL(L.origen_servicio,1)
          AND DECODE(NVL(config.destino_servicio,1),'TODOS', NVL(L.destino_servicio,1), NVL(config.destino_servicio,1)) = NVL(L.destino_servicio,1)
          AND DECODE(NVL(config.servicio,1),'TODOS', NVL(L.servicio,1), NVL(config.servicio,1)) = NVL(L.servicio,1) AND NVL(config.concepto_modalidad,1) = NVL(L.concepto_modalidad,1)
          AND DECODE(NVL(config.forma_pago,1),'TODOS', NVL(L.forma_pago,1),NVL(config.forma_pago,1)) = NVL(L.forma_pago,1)
          and H.TIPO_DOCUMENTO = 'NOTA DE CREDITO'
          and h.sistema_origen = NVL('TRATECSA',h.sistema_origen)
          --and trunc(H.FECHA_MOVIMIENTO) = trunc(NVL(P_FECHA_PROCESO,H.FECHA_MOVIMIENTO))
          --and trunc(H.FECHA_MOVIMIENTO) >= trunc(SYSDATE-5)
          and H.ESTATUS = 'S' -- Notas de Credito ya procesadas
          and H.ADICIONAL3 IS NULL -- ReceivableApplicationId no existe
          ---and H.NUMERO_DOCUMENTO ='NC-361'
        order by h.tabla_puente_id;