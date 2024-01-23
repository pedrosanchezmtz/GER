create or replace PACKAGE BODY             INER_XXER_STAGE_EXTRACT_PKG AS
/******************************************************************************
   NAME:       INER_XXER_STAGE_EXTRACT_PKG
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        09/07/2019      IM       1. Created this package body.
******************************************************************************/

  PROCEDURE EXTRACT_ZAM_CF_PRC(P_FECHA_PROCESO DATE) AS

    CURSOR TRAFICO_GUIA_CR IS 
    SELECT "id_area"
          ,"no_guia"
          ,"num_guia"
      FROM TRAFICO_GUIA@HSMSSQLDLV.ESTRELLAROJA.COM.MX 
     WHERE ( TRUNC("fecha_cancelacion") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_confirmacion") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_contabilizado") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_documentador") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_facturacion") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_guia") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_ingreso") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_modifico") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_pago") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_vencimiento") = TRUNC(P_FECHA_PROCESO)
           ); 
         
    CURSOR TRAFICO_GUIA_UDP_CR(prNumGuia VARCHAR2) IS
    SELECT tg."id_area"
            ,tg."no_guia"
      FROM TRAFICO_GUIA@HSMSSQLDLV.ESTRELLAROJA.COM.MX tg
     WHERE tg."num_guia_asignado" = prNumGuia;
         
    CURSOR TRAFICO_VIAJE_CR IS
    SELECT "id_area"
          ,"no_viaje"
      FROM trafico_viaje@HSMSSQLDLV.ESTRELLAROJA.COM.MX
     WHERE TRUNC("fecha_ingreso") = TRUNC(P_FECHA_PROCESO);
     
    CURSOR TRAFICO_DEPOSITO_CR IS
    SELECT "id_deposito"
      FROM trafico_deposito@HSMSSQLDLV.ESTRELLAROJA.COM.MX
     WHERE ( TRUNC("fecha_deposito") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_ingreso") = TRUNC(P_FECHA_PROCESO)
           );
         
    CURSOR TRAFICO_MOVIMIENTO_CR IS
    SELECT "id_movimiento"
      FROM trafico_movimiento@HSMSSQLDLV.ESTRELLAROJA.COM.MX
     WHERE ( TRUNC("fecha_movimiento")  = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_ingreso")  = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_mov")  = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_modifico")  = TRUNC(P_FECHA_PROCESO)
           );

    CURSOR TRAFICO_LIQUIDACION_CR IS
    SELECT "id_area"
          ,"no_liquidacion"
      FROM trafico_liquidacion@HSMSSQLDLV.ESTRELLAROJA.COM.MX
    WHERE TRUNC("fecha_ingreso") = TRUNC(P_FECHA_PROCESO);

    CURSOR TRAFICO_CLIENTE_CR IS
    SELECT "id_cliente"
      FROM trafico_cliente@HSMSSQLDLV.ESTRELLAROJA.COM.MX  
     WHERE ( TRUNC("fecha_ingreso") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_modifico") = TRUNC(P_FECHA_PROCESO)
           );
         
    CURSOR TRAFICO_PRODUCTO_CR IS
    SELECT "id_fraccion"
            ,"id_producto"
      FROM trafico_producto@HSMSSQLDLV.ESTRELLAROJA.COM.MX
     WHERE "id_producto" = 0
       AND ( TRUNC("fecha_ingreso") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_modifico") = TRUNC(P_FECHA_PROCESO)
           );

    CURSOR TRAFICO_NCREDITO_CR IS
    SELECT "id_ncredito"
      FROM TRAFICO_NOTA_CREDITO@HSMSSQLDLV.ESTRELLAROJA.COM.MX
     WHERE TRUNC("fecha") = TRUNC(P_FECHA_PROCESO);

    CURSOR DESP_FLOTAS_CR IS
    SELECT "id_flota"
      FROM desp_flotas@HSMSSQLDLV.ESTRELLAROJA.COM.MX; 

    CURSOR MTTO_UNIDADES_CR IS
    SELECT TRIM("id_unidad")
      FROM mtto_unidades@HSMSSQLDLV.ESTRELLAROJA.COM.MX;
     --WHERE (TRUNC("fecha_ingreso") = TRUNC(P_FECHA_PROCESO)
     --  OR TRUNC("fecha_servicio_ultimo") = TRUNC(P_FECHA_PROCESO)
     --  OR TRUNC("fecha_servicio_sig") = TRUNC(P_FECHA_PROCESO)
     --  OR TRUNC("fecha_ultima_rev") = TRUNC(P_FECHA_PROCESO)
     --  OR TRUNC("fecha_emision") = TRUNC(P_FECHA_PROCESO)
     --  OR TRUNC("fecha_estatus") = TRUNC(P_FECHA_PROCESO)
     --  OR TRUNC("fecha_baja") = TRUNC(P_FECHA_PROCESO)
    --     );

    CURSOR TRAFICO_BANCO_CR IS
    SELECT "id_banco"
      FROM TRAFICO_BANCO@HSMSSQLDLV.ESTRELLAROJA.COM.MX;
      
    CURSOR TRAFICO_FACTURA_ELECTRONICA_CR IS
    SELECT "id_factura"
      FROM TRAFICO_FACTURA_ELECTRONICA@HSMSSQLDLV.ESTRELLAROJA.COM.MX
     WHERE TRUNC("fecha_ingreso") = TRUNC(P_FECHA_PROCESO);
      
    CURSOR GENERAL_IVAS_CR IS
    SELECT "id_iva"
      FROM GENERAL_IVAS@HSMSSQLDLV.ESTRELLAROJA.COM.MX;

    CURSOR GENERAL_RETENCIONES_CR IS
    SELECT "id_retencion"
      FROM GENERAL_RETENCIONES@HSMSSQLDLV.ESTRELLAROJA.COM.MX;

      DEBUGFLAG varchar2(1);
      vFechaStart date;
      vFechaEnd date;
      vClaveId_1 number;
      vClaveId_2 number;
      vClaveId_3 number;
      vClaveId_4 number;
      vClaveId_5 NUMBER;
      vClaveId_6 varchar2(50);
      vCountRegs NUMBER;
      vClaveIdUDP_1 NUMBER;
      vClaveIdUDP_2 NUMBER;
      vNumGuia ZAM_TRAFICO_GUIA.NUM_GUIA%TYPE;

    BEGIN

          DebugFlag := 'N';

          DBMS_OUTPUT.PUT_LINE('Empieza Inserts');

          
          -- ZAM_TRAFICO_GUIA
          BEGIN
              DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_GUIA');
               vFechaStart := null; vFechaEnd := null; vClaveId_1 := null; vClaveId_2 := null; vClaveId_3 := null; vClaveId_4 := null; vClaveId_5 := null;
               vCountRegs := 0;
               OPEN TRAFICO_GUIA_CR;
               LOOP
                FETCH TRAFICO_GUIA_CR INTO vClaveId_1,vClaveId_2,vNumGuia;
                EXIT when TRAFICO_GUIA_CR%NOTFOUND;
                vCountRegs := vCountRegs + 1;
                    delete from ZAM_TRAFICO_GUIA where id_area = vClaveId_1 and no_guia = vClaveId_2;
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_GUIA - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
                    insert into ZAM_TRAFICO_GUIA (select T1.*,'N','',sysdate from xer_trafico_guia_v@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 where T1."id_area" = vClaveId_1 and t1."no_guia" = vClaveId_2);
                    ------------------------------------------------------------------------------------------------------------------------
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_GUIA - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
                    OPEN TRAFICO_GUIA_UDP_CR(vNumGuia);
                    loop
                      fetch TRAFICO_GUIA_UDP_CR INTO vClaveIdUDP_1,vClaveIdUDP_2;
                      EXIT when TRAFICO_GUIA_UDP_CR%NOTFOUND;
                      vCountRegs := vCountRegs + 1;
                      delete from ZAM_TRAFICO_GUIA where id_area = vClaveIdUDP_1 and no_guia = vClaveIdUDP_2;
                      insert into ZAM_TRAFICO_GUIA (select T1.*,'N','',sysdate from xer_trafico_guia_v@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 WHERE T1."id_area" = vClaveIdUDP_1 and t1."no_guia" = vClaveIdUDP_2);
                    ------------------------------------------------------------------------------------------------------------------------
                      
                    end loop;
                    CLOSE TRAFICO_GUIA_UDP_CR;
                    -- TERMINA
                    
                    
                    BEGIN
                        -- ZAM_TRAFICO_GUIA_OTRO
                        delete from ZAM_TRAFICO_GUIA_OTRO where id_area = vClaveId_1 and no_guia = vClaveId_2;
                        if DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_GUIA_OTRO - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        END IF; 
                        insert into ZAM_TRAFICO_GUIA_OTRO (select * from xer_trafico_guia_otro_v@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 where t1."id_area" = vClaveId_1 and t1."no_guia" = vClaveId_2);
                        IF DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_GUIA_OTRO - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        end if;  
                        DBMS_OUTPUT.PUT_LINE('ERP - ZAM_TRAFICO_GUIA_OTRO Actualizado');
                    EXCEPTION
                    when OTHERS then
                        DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_TRAFICO_GUIA_OTRO:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
                    END;

               END LOOP;
               COMMIT;     
               close TRAFICO_GUIA_CR;
               DBMS_OUTPUT.PUT_LINE('ERP - ZAM_TRAFICO_GUIA:('||vCountRegs||') Registros Leidos');
          EXCEPTION 
          when OTHERS then
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_TRAFICO_GUIA:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            rollback;
          END; 

          -- ZAM_TRAFICO_DEPOSITO
          BEGIN
              DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_DEPOSITO');
               vFechaStart := null;vFechaEnd := null;vClaveId_1 := null;vClaveId_2 := null;vClaveId_3 := null;vClaveId_4 := null;vClaveId_5 := null;
               vCountRegs := 0;
               OPEN TRAFICO_DEPOSITO_CR;
               LOOP
                FETCH TRAFICO_DEPOSITO_CR INTO vClaveId_1;
                EXIT when TRAFICO_DEPOSITO_CR%NOTFOUND;
                vCountRegs := vCountRegs + 1;
                    delete from ZAM_TRAFICO_DEPOSITO where id_deposito = vClaveId_1;
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_DEPOSITO - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    END IF;  
                    --insert into ZAM_TRAFICO_DEPOSITO (select t1.*,'N',SYSDATE from trafico_deposito@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 where T1."id_deposito" = vClaveId_1);
                    insert into ZAM_TRAFICO_DEPOSITO (select t1.*,'N',SYSDATE from xer_trafico_deposito_v@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 where T1."id_deposito" = vClaveId_1);
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_DEPOSITO - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
               END LOOP;
               COMMIT;     
               close TRAFICO_DEPOSITO_CR;
               DBMS_OUTPUT.PUT_LINE('ERP - ZAM_TRAFICO_DEPOSITO:('||vCountRegs||') Registros Leidos');
          EXCEPTION 
          when OTHERS then
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_TRAFICO_DEPOSITO:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            rollback;
          END; 

          -- ZAM_TRAFICO_MOVIMIENTO
          BEGIN
              DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_MOVIMIENTO');
               vFechaStart := null;vFechaEnd := null;vClaveId_1 := null;vClaveId_2 := null;vClaveId_3 := null;vClaveId_4 := null;vClaveId_5 := null;
               vCountRegs := 0;
               OPEN TRAFICO_MOVIMIENTO_CR;
               LOOP
                FETCH TRAFICO_MOVIMIENTO_CR INTO vClaveId_1;
                EXIT when TRAFICO_MOVIMIENTO_CR%NOTFOUND;
                vCountRegs := vCountRegs + 1;
                    delete from ZAM_TRAFICO_MOVIMIENTO where id_movimiento = vClaveId_1;
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_MOVIMIENTO - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    END IF;  
                    insert into ZAM_TRAFICO_MOVIMIENTO (select * from trafico_movimiento@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 where T1."id_movimiento" = vClaveId_1);
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_MOVIMIENTO - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
                    BEGIN
                        -- ZAM_TRAFICO_RENGLON_MOVIMIENTO
                        delete from ZAM_TRAFICO_RENGLON_MOVIMIENTO where id_movimiento = vClaveId_1;
                        if DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_RENGLON_MOVIMIENTO - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        END IF;  
                        insert into ZAM_TRAFICO_RENGLON_MOVIMIENTO (select t1.*,'N',SYSDATE from xer_trafico_renglon_mov_v@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 where T1."id_movimiento" = vClaveId_1);
                        IF DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_RENGLON_MOVIMIENTO - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        end if;  
                        DBMS_OUTPUT.PUT_LINE('ERP - ZAM_TRAFICO_RENGLON_MOVIMIENTO Actualizado');
                    EXCEPTION
                    when OTHERS then
                        DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_TRAFICO_RENGLON_MOVIMIENTO:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
                    END;
                    
               END LOOP;
               COMMIT;     
               close TRAFICO_MOVIMIENTO_CR;
               DBMS_OUTPUT.PUT_LINE('ERP - ZAM_TRAFICO_MOVIMIENTO:('||vCountRegs||') Registros Leidos');
          EXCEPTION 
          when OTHERS then
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_TRAFICO_MOVIMIENTO:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            ROLLBACK;
          END; 
          
          -- ZAM_TRAFICO_GUIA_LIQUIDACION
          BEGIN
              DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_GUIA_LIQUIDACION');
               vFechaStart := null;vFechaEnd := null;vClaveId_1 := null;vClaveId_2 := null;vClaveId_3 := null;vClaveId_4 := null;vClaveId_5 := null;
               vCountRegs := 0;
               OPEN TRAFICO_LIQUIDACION_CR;
               LOOP
                FETCH TRAFICO_LIQUIDACION_CR INTO vClaveId_1,vClaveId_2;
                EXIT when TRAFICO_LIQUIDACION_CR%NOTFOUND;
                vCountRegs := vCountRegs + 1;
                    delete from ZAM_TRAFICO_LIQUIDACION where id_area = vClaveId_1 and no_liquidacion = vClaveId_2;
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_LIQUIDACION - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    END IF;  
                    insert into ZAM_TRAFICO_LIQUIDACION (select t1.*,'N',SYSDATE from xer_trafico_liquidacion_v@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 where T1."id_area" = vClaveId_1 and t1."no_liquidacion" = vClaveId_2);
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_LIQUIDACION - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
                    
                    BEGIN
                        -- ZAM_TRAFICO_RENGLON_LIQ
                        delete from ZAM_TRAFICO_RENGLON_LIQ where id_area = vClaveId_1 and no_liquidacion = vClaveId_2;
                        if DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_RENGLON_LIQ - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        END IF;  
                        insert into ZAM_TRAFICO_RENGLON_LIQ (select * from xer_trafico_renglon_liq_v@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 where t1."id_area" = vClaveId_1 and t1."no_liquidacion" = vClaveId_2);
                        IF DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_RENGLON_LIQ - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        end if;  
                        DBMS_OUTPUT.PUT_LINE('ERP - ZAM_TRAFICO_RENGLON_LIQ Actualizado');
                    EXCEPTION
                    when OTHERS then
                        DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_TRAFICO_RENGLON_LIQ:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
                    END;
                    
                    -- Para asegurarse que estan los registros en la tabla de Liquidacion
                    BEGIN
                        -- ZAM_TRAFICO_VIAJE_LIQ
                        delete from ZAM_TRAFICO_VIAJE_LIQ where id_area = vClaveId_1 and no_liquidacion = vClaveId_2;
                        if DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_VIAJE_LIQ - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        END IF;  
                        insert into ZAM_TRAFICO_VIAJE_LIQ (select T1."id_area",T1."no_viaje",T1."id_sector",T1."id_subsector",T1."confirmacion_iave",T1."id_area_liq",T1."id_personal",T1."kms_camion_vacio",T1."kms_camion_lleno",T1."kms_operador",T1."kms_real",T1."no_liquidacion",T1."viaje_ant",T1."no_liquidacion_rend",T1."hrs_realthermo1",T1."hrs_realthermo2",T1."puntaje_viaje",T1."id_ruta",T1."no_ejes_viaje",T1."id_operador2",T1."id_status_unidad",T1."id_origen",T1."id_destino",T1."liquidacion_operador2",T1."cd1",T1."cd2",T1."id_area_liq2",T1."id_depto",T1."fecha_viaje",T1."fecha_fin_viaje",T1."fecha_real_viaje",T1."fecha_real_fin_viaje",T1."fecha_ingreso",T1."f_prog_ini_viaje",T1."f_prog_fin_viaje",T1."f_despachado",T1."f_status_unidad",T1."sueldo_operador",T1."compensaciones",T1."compensacion_operador2",T1."lts_viaje",T1."rendimiento_viaje",T1."rendimiento_real",T1."lts_empresa",T1."rend_esperado",T1."lts_empthermo1",T1."lts_empthermo2",T1."lts_viajethermo1",T1."lts_viajethermo2",T1."rend_espthermo1",T1."rend_espthermo2",T1."rend_realthermo1",T1."rend_realthermo2",T1."ton_viaje",T1."sueldo_operador2",T1."no_kit",T1."id_unidad",T1."id_remolque1",T1."id_remolque2",T1."id_dolly",T1."id_ingreso",T1."thermo1",T1."thermo2",T1."id_linearem1",T1."id_linearem2",T1."status_viaje",T1."confirma_viaje",T1."status_desp",T1."viajeactual",T1."status_cs",T1."id_confirmacion",T1."num_confirmacion",T1."liberado",T1."centro_costo",T1."capacidad_cajas",T1."no_tarjeta_llave",T1."id_configuracionviaje",T1."tipo_pago01",T1."batch",T1."tipo_pago02",T1."id_tipoviaje",T1."num_shipment",T1."kms_viaje",T1."observacionesviaje",T1."id_area_conc",T1."id_areaviaje",T1."id_areapago",T1."rendimiento_reseteo",T1."proporcional_flete",T1."no_transferencia",T1."status_liberado",T1."tipo_cargado",T1."tipo_vacio",T1."tipo_tractor",T1."lts_reseteo",T1."id_statusviaje",T1."f_ini_status",T1."cargadovacio_rem1",T1."cargadovacio_rem2",T1."id_contrato",T1."id_tipo_servicio",T1."pagar_sueldo",T1."rend_reseteo_thermo1",T1."rend_reseteo_thermo2",T1."tipo_sueldo",T1."id_cliente",T1."id_tipo_operacion",T1."incentivo",T1."monto_incentivo",T1."descuento_transbordo",T1."cupon",T1."lugar_cita",T2."nombre"
						from TRAFICO_VIAJE@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1, PERSONAL_PERSONAL@HSMSSQLDLV.ESTRELLAROJA.COM.MX T2 WHERE t1."id_personal" = t2."id_personal"(+) and T1."id_area" = vClaveId_1 and t1."no_liquidacion" = vClaveId_2);
                        IF DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_VIAJE_LIQ - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        end if;  
                        DBMS_OUTPUT.PUT_LINE('ERP - ZAM_TRAFICO_VIAJE_LIQ Actualizado');
                    EXCEPTION
                    when OTHERS then
                        DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_TRAFICO_VIAJE_LIQ:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
                    END;

               END LOOP;

               COMMIT;     
               close TRAFICO_LIQUIDACION_CR;
               DBMS_OUTPUT.PUT_LINE('ZAM - ZAM_TRAFICO_LIQUIDACION:('||vCountRegs||') Registros Leidos');
          EXCEPTION 
          WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR EN ZAM - ZAM_TRAFICO_LIQUIDACION:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            ROLLBACK;
          end;       
        
          -- ZAM_TRAFICO_CLIENTE
          BEGIN
              DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_CLIENTE');
               vFechaStart := null;vFechaEnd := null;vClaveId_1 := null;vClaveId_2 := null;vClaveId_3 := null;vClaveId_4 := null;vClaveId_5 := null;
               vCountRegs := 0;
               OPEN TRAFICO_CLIENTE_CR;
               LOOP
                FETCH TRAFICO_CLIENTE_CR INTO vClaveId_1;
                EXIT when TRAFICO_CLIENTE_CR%NOTFOUND;
                vCountRegs := vCountRegs + 1;
                    delete from ZAM_TRAFICO_CLIENTE where id_cliente = vClaveId_1;
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_CLIENTE - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
                    insert into ZAM_TRAFICO_CLIENTE 
    (ID_CLIENTE,DIAS_CREDITO,ID_GPOCLIENTE,ID_PLAZA,CONSEC_COBRANZA,MATRIZ,AREA_COBRANZA,TIEMPO_CARGA,TIEMPO_DESCARGA,FACTOR_IVA,VALOR_PAGO_OPERADOR,LATPOS,
    LONPOS,MONTO_MANIOBRAS,NOMBRE,RFC,DOMICILIO,TEL,FAX,CONTACTO1,CONTACTO2,CUENTA_CLIENTE,SUBCTA_CLIENTE,PR_NOMBRE,OBSERVACIONES_CLIENTE,TIPO_CLIENTE,TIPO_CREDITO,
    PRIORIDAD,LUNES,MARTES,OMNIONLINE,MIERCOLES,JUEVES,VIERNES,SABADO,CONTROLAR_PAGO,TIPO_PAGO,INSTRUCCIONES,FACTOR_KMSCOBRO,NUM_CLIENTE,ID_CLIENTEPLANTA,
    SIST_ORIGEN,PERSONAFISICA,EMAIL1,EMAIL2,EMAIL3,MONTO_CREDITO,MONTO_ADVERTENCIA,CREDITO_ACTIVO,TIPO_RETENCION,CLIENTE_QUE_PAGA,ID_IVA,ID_RETENCION,ID_SEGURO,
    AUXILIAR_CLIENTE,CLIENTE_SINCOBRO,EXTRANJERO,ID_DESCTOSUTERM,PORC_DESCTOSUTERM,ID_DESCTOFIDE,PORC_DESCTOFIDE,ID_ADDENDA,CP,TIPO_XML,ID_COBRADOR,ID_INGRESO,
    ID_MODIFICO,FECHA_INGRESO,FECHA_MODIFICO,ID_CLIENTE_PERM,ESTATUS,REPETIR_REMISION,ID_COMPANIA,NRA,UBICACION1,UBICACION2,UBICACION3,COMENTARIOS,CODIGO_DINET,
    ID_EJECUTIVO,INSTRUCCIONES1,INSTRUCCIONES2,NUM_CLIENTEXT,NOMBREXT,ASEGURADO,ADDENDA_AMECE,CTE_ASEGURADORA,MOSTRAR_IEPS,REDONDEO,ID_CLIENTE_PEMEX,
    CONTACTO3,CONTACTO4,CONTACTO5,CONTACTO6,REFERENCIA,CLIENTE_SCMT,PROCESADO,ID_USO_CFDI,RESPONSABLE_CLIENTE,CARTACOBROAUTO,ENVIO_EVIDENCIAS_AUTO,REFERENCIA_CLIENTE,HORAS_CARGA,HORAS_DESCARGA,FACTURA_CP_SINLIQ,
    CONTRIBUYENTE_RIF,SECTOR_PRIMARIO,INTEGRANTE_SISTEMA_FINANCIERO,MOSTRAR_BANCO,MONTO_ADVERTENCIA_USD,MONTO_CREDITO_USD,REPLICADO_AR,ORIG_SYSTEM_REFERENCE,ULTIMA_FECHA_ACTUALIZACION)
                    (select 
t1."id_cliente",T1."dias_credito",T1."id_gpocliente",T1."id_plaza",T1."consec_cobranza",T1."matriz",T1."area_cobranza",T1."tiempo_carga",T1."tiempo_descarga",T1."factor_iva",T1."valor_pago_operador",T1."latpos",T1."lonpos",T1."monto_maniobras",T1."nombre",T1."rfc",T1."domicilio",T1."tel",T1."fax",T1."contacto1",T1."contacto2",T1."cuenta_cliente",T1."subcta_cliente",T1."pr_nombre",T1."observaciones_cliente",T1."tipo_cliente",T1."tipo_credito",T1."prioridad",T1."lunes",T1."martes",T1."omnionline",T1."miercoles",T1."jueves",T1."viernes",T1."sabado",T1."controlar_pago",T1."tipo_pago",T1."instrucciones",T1."factor_kmscobro",T1."num_cliente",T1."id_clienteplanta",T1."sist_origen",T1."personafisica",T1."email1",T1."email2",T1."email3",T1."monto_credito",T1."monto_advertencia",T1."credito_activo",T1."tipo_retencion",T1."cliente_que_paga",T1."id_iva",T1."id_retencion",T1."id_seguro",T1."auxiliar_cliente",T1."cliente_sincobro",T1."extranjero",T1."id_desctosuterm",T1."porc_desctosuterm",T1."id_desctofide",T1."porc_desctofide",T1."id_addenda",T1."cp",T1."tipo_xml",T1."id_cobrador",T1."id_ingreso",T1."id_modifico",T1."fecha_ingreso",T1."fecha_modifico",T1."id_cliente_perm",T1."estatus",T1."repetir_remision",T1."id_compania",T1."nra",T1."ubicacion1",T1."ubicacion2",T1."ubicacion3",T1."comentarios",T1."codigo_dinet",T1."id_ejecutivo",T1."instrucciones1",T1."instrucciones2",T1."num_clientext",T1."nombrext",T1."asegurado",T1."addenda_amece",T1."cte_aseguradora",T1."mostrar_ieps",T1."redondeo",T1."id_cliente_pemex",T1."contacto3",T1."contacto4",T1."contacto5",T1."contacto6",T1."referencia",T1."cliente_scmt",T1."procesado",T1."id_uso_cfdi",T1."responsable_cliente",T1."cartacobroauto",T1."envio_evidencias_auto",T1."referencia_cliente",T1."horas_carga",T1."horas_descarga",T1."factura_cp_sinliq",T1."contribuyente_RIF",T1."sector_primario",T1."integrante_sistema_financiero",T1."mostrar_banco",T1."monto_advertencia_usd",T1."monto_credito_usd",'N',NULL,SYSDATE from trafico_cliente@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 where T1."id_cliente" = vClaveId_1);
                    -- (select t1.*,SYSDATE from trafico_cliente@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 where T1."id_cliente" = vClaveId_1);
                    -- Moficiacion JRM 20/03/20 tabla de trafico_cliente@HSMSSQLDLV.ESTRELLAROJA.COM.MX         
                    -- (select t1.*,'N',NULL,SYSDATE from trafico_cliente@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 where T1."id_cliente" = vClaveId_1);
                    -- Moficiacion JRM 05/03/20 tabla de trafico_cliente@HSMSSQLDLV.ESTRELLAROJA.COM.MX               
                    
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_CLIENTE - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
               END LOOP;
               COMMIT;     
               close TRAFICO_CLIENTE_CR;
               DBMS_OUTPUT.PUT_LINE('ERP - ZAM_TRAFICO_CLIENTE:('||vCountRegs||') Registros Leidos');
          EXCEPTION 
          when OTHERS then
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_TRAFICO_CLIENTE:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            rollback;
          END; 

          -- ZAM_TRAFICO_PRODUCTO
          BEGIN
              DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_PRODUCTO');
               vFechaStart := null;vFechaEnd := null;vClaveId_1 := null;vClaveId_2 := null;vClaveId_3 := null;vClaveId_4 := null;vClaveId_5 := null;
               vCountRegs := 0;
               OPEN TRAFICO_PRODUCTO_CR;
               LOOP
                FETCH TRAFICO_PRODUCTO_CR INTO vClaveId_1,vClaveId_2;
                EXIT when TRAFICO_PRODUCTO_CR%NOTFOUND;
                vCountRegs := vCountRegs + 1;
                    delete from ZAM_TRAFICO_PRODUCTO where id_fraccion = vClaveId_1 and id_producto = vClaveId_2;
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_PRODUCTO - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
                    insert into ZAM_TRAFICO_PRODUCTO (select * from trafico_producto@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 where T1."id_fraccion" = vClaveId_1 and T1."id_producto" = vClaveId_2);
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_PRODUCTO - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
               END LOOP;
               COMMIT;     
               close TRAFICO_PRODUCTO_CR;
               DBMS_OUTPUT.PUT_LINE('ERP - ZAM_TRAFICO_PRODUCTO:('||vCountRegs||') Registros Leidos');
          EXCEPTION 
          when OTHERS then
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_TRAFICO_PRODUCTO:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            rollback;
          END; 

          -- ZAM_TRAFICO_NOTA_CREDITO
          BEGIN
              DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_NOTA_CREDITO');
               vFechaStart := null;vFechaEnd := null;vClaveId_1 := null;vClaveId_2 := null;vClaveId_3 := null;vClaveId_4 := null;vClaveId_5 := null;
               vCountRegs := 0;
               OPEN TRAFICO_NCREDITO_CR;
               LOOP
                FETCH TRAFICO_NCREDITO_CR INTO vClaveId_1;
                EXIT when TRAFICO_NCREDITO_CR%NOTFOUND;
                vCountRegs := vCountRegs + 1;
                    delete from ZAM_TRAFICO_NOTA_CREDITO where ID_NCREDITO = vClaveId_1;
                    if DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_NOTA_CREDITO - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
                    insert into ZAM_TRAFICO_NOTA_CREDITO (select t1.*,'N',SYSDATE from xer_trafico_nota_credito_v@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 where T1."id_ncredito" = vClaveId_1);
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_NOTA_CREDITO - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
                    BEGIN
                        -- ZAM_TRAFICO_RENGLON_NCREDITO
                        delete from ZAM_TRAFICO_RENGLON_NCREDITO where id_ncredito = vClaveId_1;
                        if DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_RENGLON_NCREDITO - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        END IF;  
                        insert into ZAM_TRAFICO_RENGLON_NCREDITO (select * from xer_trafico_renglon_ncredito_v@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 where T1."id_ncredito" = vClaveId_1);
                        IF DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_RENGLON_NCREDITO - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        end if;  
                        DBMS_OUTPUT.PUT_LINE('ERP - ZAM_TRAFICO_RENGLON_NCREDITO Actualizado');
                    EXCEPTION
                    when OTHERS then
                        DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_TRAFICO_RENGLON_NCREDITO:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 1500));
                    END;
                    
               END LOOP;
               COMMIT;     
               close TRAFICO_NCREDITO_CR;
               DBMS_OUTPUT.PUT_LINE('ERP - ZAM_TRAFICO_NOTA_CREDITO:('||vCountRegs||') Registros Leidos');
          EXCEPTION 
          when OTHERS then
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_TRAFICO_NOTA_CREDITO:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            rollback;
          END; 

       -- ZAM_DESP_FLOTAS
          BEGIN
              DBMS_OUTPUT.PUT_LINE('ZAM_DESP_FLOTAS');
               vFechaStart := null;vFechaEnd := null;vClaveId_1 := null;vClaveId_2 := null;vClaveId_3 := null;vClaveId_4 := null;vClaveId_5 := null;
               vCountRegs := 0;
               OPEN DESP_FLOTAS_CR;
               LOOP
                FETCH DESP_FLOTAS_CR INTO vClaveId_1;
                EXIT when DESP_FLOTAS_CR%NOTFOUND;
                vCountRegs := vCountRegs + 1;
                    delete from ZAM_DESP_FLOTAS where id_flota = vClaveId_1;
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAM_DESP_FLOTAS - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    END IF;  
                    insert into ZAM_DESP_FLOTAS (select * from desp_flotas@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 where T1."id_flota" = vClaveId_1);
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAM_DESP_FLOTAS - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
               END LOOP;
               COMMIT;     
               close DESP_FLOTAS_CR;
               DBMS_OUTPUT.PUT_LINE('ERP - ZAM_DESP_FLOTAS:('||vCountRegs||') Registros Leidos');
          EXCEPTION 
          when OTHERS then
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_DESP_FLOTAS:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            rollback;
          end;   
          
       -- ZAM_MTTO_UNIDADES
          IF TO_CHAR(SYSDATE,'D') = 7 THEN -- SOLO EJECUTARSE LOS DOMINGOS
              BEGIN
                  DBMS_OUTPUT.PUT_LINE('ZAM_MTTO_UNIDADES');
                   vFechaStart := null;vFechaEnd := null;vClaveId_1 := null;vClaveId_2 := null;vClaveId_3 := null;vClaveId_4 := null;vClaveId_5 := null;
                   vCountRegs := 0;
                   OPEN MTTO_UNIDADES_CR;
                   LOOP
                    FETCH MTTO_UNIDADES_CR INTO vClaveId_6;
                    EXIT when MTTO_UNIDADES_CR%NOTFOUND;
                    vCountRegs := vCountRegs + 1;
                        delete from ZAM_MTTO_UNIDADES where id_unidad = vClaveId_6;
                        IF DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAM_MTTO_UNIDADES - SE BORRO REG:'||vClaveId_6||' => '||sql%ROWCOUNT);
                        END IF; 
                        insert into ZAM_MTTO_UNIDADES (select T1."id_unidad",T1."total_llantas",T1."tipo_unidad",T1."id_tipo_motor",T1."id_marca_unidad",T1."id_tipo_unidad",T1."kms_acumulados",T1."r_f_v",T1."id_centro_costo",T1."llantas_extras",T1."no_permiso",T1."no_inciso_seguro",T1."id_operador",T1."kms_servicio_ultimo",T1."kms_servicio_sig",T1."id_area",T1."id_depto",T1."kms_inicio_ciclo",T1."secuencia_inicio",T1."idcia",T1."hrs_inicio_ciclo",T1."no_cilindros",T1."prov_carroceria",T1."secuencia_ult",T1."secuencia_sig",T1."no_circula",T1."doble_no_circula",T1."id_tercero",T1."id_status",T1."status_comm",T1."msg_pend",T1."id_ruta",T1."id_area_viaje",T1."no_viaje",T1."id_pedido",T1."id_flota",T1."id_origen",T1."id_destino",T1."id_remitente",T1."id_destinatario",T1."id_macro_ult",T1."costo_tenencia",T1."no_poliza",T1."prima_neta",T1."recargos",T1."der_poliza",T1."iva",T1."costo_unidad",T1."costo_carroceria",T1."ultima_tenencia",T1."ultimo_refrendo",T1."ultimo_permiso",T1."vence_seguro",T1."fecha_kms",T1."fecha_servicio_ultimo",T1."fecha_servicio_sig",T1."fecha_adquisicion",T1."fecha_ultima_rev",T1."fecha_inicio_ciclo",T1."fecha_emision",T1."fecha_desde",T1."fecha_hasta",T1."fecha_adq_carr",T1."fecha_estatus",T1."fecha_baja",T1."posdate",T1."f_real_salida",T1."f_prog_llegada",T1."f_entrada_patio",T1."f_mismapos",T1."TEA",T1."rendimiento_esperado",T1."lts_combustible",T1."lts_aceite",T1."kms_por_dia",T1."dim_ancho",T1."dim_largo",T1."dim_altura",T1."rendimiento_aceite",T1."hrs_acumuladas",T1."hrs_por_dia",T1."hrs_servicio_ultimo",T1."hrs_servicio_sig",T1."proveedor",T1."peso_unidades",T1."lts_relleno",T1."lts_saldocomb",T1."no_serie",T1."modelo",T1."id_ciclo_preventivo",T1."placas",T1."observaciones",T1."no_economico",T1."id_servicio_ultimo",T1."id_servicio_sig",T1."id_servicio_inicio",T1."tarjeta_circulacion",T1."no_factura",T1."tipo_motor",T1."potencia_motor",T1."pulgadas_cubicas",T1."no_motor",T1."color",T1."no_carroceria",T1."obs_carroceria",T1."fecha_vence_placas",T1."poliza",T1."fecha_vence_tenencia",T1."status_unidad",T1."viaje",T1."fecha_vence_seguro",T1."id_thermo",T1."fecha_vence_verificacion",T1."no_kit",T1."desc_marcamotor",T1."desc_provcarroceria",T1."desc_provunidad",T1."tarjeta_llave",T1."no_tarjeta_llave",T1."mctnumber",T1."posicion",T1."poslat",T1."poslon",T1."operador",T1."id_unidad_as",T1."id_remolque1",T1."id_dolly",T1."id_remolque2",T1."origen",T1."destino",T1."id_despachador",T1."tipo_combustible",T1."estado",T1."estado_adquisicion",T1."datos_generales",T1."tipo_moneda",T1."forma_pago",T1."kms_hrs",T1."hrs_automaticas",T1."estatus",T1."tipo_programacion",T1."equipo_omnitracs",T1."tercero",T1."causa_baja",T1."tipo",T1."status",T1."status_caja1",T1."status_caja2",T1."en_patio",T1."mismapos",T1."f_status_unidad",T1."subcta",T1."tipomacro_ult",T1."kms_actuales",T1."ruta",T1."peso_bruto",T1."fecha_instalacion",T1."kmshrsinicialaparmed",T1."no_medidor",T1."tipo_medida",T1."id_operador2",T1."hrs_actuales",T1."id_ingreso",T1."fecha_ingreso",T1."kms_hrs_actuales",T1."fecha_disponible",T1."id_plazadestino",T1."id_tipo_operacion",T1."id_movimiento",T1."clas_uni",T1."cta_consumo",T1."id_status_rem",T1."ultimo_id_destinatario",T1."ultimo_id_area_viaje",T1."ultimo_no_viaje",T1."id_estacion",T1."ultimo_id_areapedido",T1."ultimo_id_pedido",T1."origen_status",T1."cargadovacio",T1."kms_ultima_rev",T1."id_transponder",T1."num_soporte",T1."vehunitnum",T1."nacionalidad",T1."id_localidaddestino",T1."id_circuito",T1."id_compania",T1."kms_arribo",T1."ultimo_id_pedidopk",T1."alarmasnuevas",T1."mensajesnuevos",T1."id_linearem1",T1."id_linearem2",T1."modulo",T1."id_asignacion",T1."kms_actualesvale",T1."kms_recorridosvale",T1."modelo_unidad",T1."madre",T1."hija",T1."asignado",T1."unidad_asignado",T1."hija_asignada",T1."FECHA_LOGISTICA",T1."valor_convenido",T1."deducible_xrobo",T1."deducible_xdmateriales",T1."faset",T1."jefe_flota",T1."id_plazasigdestino",T1."id_sector",T1."id_subflota",T1."EM_email",T1."no_orsan",T1."valida_cargacomb",T1."procesado",T1."poliza2",T1."no_inciso_seguro2",T1."vence_seguro2",T1."id_aseguradora" from MTTO_UNIDADES@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 where T1."id_unidad" = vClaveId_6);
                         --Moficiacion JRM 05/03/20 tambla de MTTO_UNIDADES@HSMSSQLDLV.ESTRELLAROJA.COM.MX 
                        IF DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAM_MTTO_UNIDADES - SE INSERTO REG:'||vClaveId_6||' => '||sql%ROWCOUNT);
                        end if;  
                   END LOOP;
                   COMMIT;     
                   close MTTO_UNIDADES_CR;
                   DBMS_OUTPUT.PUT_LINE('ERP - ZAM_MTTO_UNIDADES:('||vCountRegs||') Registros Leidos');
              EXCEPTION 
              when OTHERS then
                DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_MTTO_UNIDADES:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
                rollback;
              end;
          END IF;   

        -- ZAM_TRAFICO_BANCO
        BEGIN
          DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_BANCO');
          vFechaStart := null; vFechaEnd := null; vClaveId_1 := null; vClaveId_2 := null; vClaveId_3 := null; vClaveId_4 := null; vClaveId_5 := null;
          vCountRegs := 0;
          OPEN TRAFICO_BANCO_CR;
          LOOP 
              FETCH TRAFICO_BANCO_CR INTO vClaveId_1;
              EXIT WHEN TRAFICO_BANCO_CR%NOTFOUND;
              vCountRegs := vCountRegs + 1;
              DELETE FROM ZAM_TRAFICO_BANCO Where id_banco = vClaveId_1;
              IF DEBUGFLAG = 'Y' THEN
                DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_BANCO - SE BORRO REG:'||vClaveId_1||' => '||SQL%ROWCOUNT);
              END IF;  
              INSERT INTO ZAM_TRAFICO_BANCO (SELECT  T1."id_banco",T1."descripcion_banco",T1."sucursal",T1."num_cta",T1."status_banco",T1."id_tipo_moneda",T1."fecha_apertura",T1."dia_corte",T1."tipo_cta",T1."consecutivo_cheque",T1."saldo_inicial",T1."saldo_conciliado",T1."saldo_actual",T1."funcionario",T1."telefono",T1."num_chequera",T1."nombre_corto",T1."plazo_cuenta",T1."interes_fijo",T1."id_ctaclasif",T1."cuenta",T1."subcta",T1."aux1",T1."id_areacont",T1."cuenta_regimen",T1."fecha_conciliacion",T1."id_sucursalbanco",T1."titular",T1."id_polizareclasificacion",T1."consecutivo",T1."id_cuenta",T1."leyenda_moneda",T1."id_compania",T1."num_plaza_bco",T1."id_institucion_bancaria",T1."num_orden",T1."leyenda",T1."num_cta_sat",T1."cuenta_default"
              FROM TRAFICO_BANCO@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 WHERE T1."id_banco" = vClaveId_1);
              IF DEBUGFLAG = 'Y' then
                DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_BANCO - SE INSERTO REG:'||vClaveId_1||' => '||SQL%ROWCOUNT);
              END IF;  
          END LOOP;
          COMMIT;     
          CLOSE TRAFICO_BANCO_CR;
          DBMS_OUTPUT.PUT_LINE('ERP - ZAM_TRAFICO_BANCO:('||vCountRegs||') Registros Leidos');
          EXCEPTION
          WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_TRAFICO_BANCO:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            ROLLBACK;
        END;   
        
        -- ZAM_TRAFICO_FACTURA_ELECTRONIC
        BEGIN
          DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_FACTURA_ELECTRONIC');
          vFechaStart := null; vFechaEnd := null; vClaveId_1 := null; vClaveId_2 := null; vClaveId_3 := null; vClaveId_4 := null; vClaveId_5 := null;
          vCountRegs := 0;
          OPEN TRAFICO_FACTURA_ELECTRONICA_CR;
          LOOP 
              FETCH TRAFICO_FACTURA_ELECTRONICA_CR INTO vClaveId_1;
              EXIT WHEN TRAFICO_FACTURA_ELECTRONICA_CR%NOTFOUND;
              vCountRegs := vCountRegs + 1;
              DELETE FROM ZAM_TRAFICO_FACTURA_ELECTRON Where id_factura = vClaveId_1;
              IF DEBUGFLAG = 'Y' THEN
                DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_FACTURA_ELECTRONIC - SE BORRO REG:'||vClaveId_1||' => '||SQL%ROWCOUNT);
              END IF;  
              INSERT INTO ZAM_TRAFICO_FACTURA_ELECTRON (SELECT T1."id_factura",T1."num_guia",T1."status",T1."mensaje_error",T1."tipo_doc",T1."accion",T1."id_ingreso",T1."fecha_ingreso",T1."id_area",T1."no_guia",T1."no_credito",T1."no_cargo",T1."interfase",T1."num_guia_original",T1."no_aprobacion",T1."ano_aprobacion",T1."no_certificado",T1."serie",T1."folio",T1."id_addenda",T1."id_formato",T1."email",T1."reimprimir_reenviar",T1."origen_datos",	T1."tipo_cadena",T1."cadena_sat_1",T1."cadena_sat_2",T1."valor_qr",T1."uuid",T1."no_certificado_sat",T1."fecha_timbrado",T1."sello_contribuyente",T1."sello_proveedor",T1."error_desc_resp",T1."file_name_resp",T1."estatus_resp",T1."nombre_archivo",T1."complemento_nomina",T1."referencia_origen",T1."id_referencia_origen",T1."id_agrupacion",T1."tipo_nomina",T1."reexpedida",T1."desc_estatus_cancelacion",T1."fecha_solicitud_cancelacion",T1."status_cancel" FROM TRAFICO_FACTURA_ELECTRONICA@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 WHERE T1."id_factura" = vClaveId_1);
              IF DEBUGFLAG = 'Y' then
                DBMS_OUTPUT.PUT_LINE('ZAM_TRAFICO_FACTURA_ELECTRONIC - SE INSERTO REG:'||vClaveId_1||' => '||SQL%ROWCOUNT);
              END IF;  
          END LOOP;
          COMMIT;     
          CLOSE TRAFICO_FACTURA_ELECTRONICA_CR;
          DBMS_OUTPUT.PUT_LINE('ERP - ZAM_TRAFICO_FACTURA_ELECTRONIC:('||vCountRegs||') Registros Leidos');
          EXCEPTION
          WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_TRAFICO_FACTURA_ELECTRONIC:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            ROLLBACK;
        END;       

        -- ZAM_GENERAL_IVAS
        BEGIN
          DBMS_OUTPUT.PUT_LINE('ZAM_GENERAL_IVAS');
          vFechaStart := null; vFechaEnd := null; vClaveId_1 := null; vClaveId_2 := null; vClaveId_3 := null; vClaveId_4 := null; vClaveId_5 := null;
          vCountRegs := 0;
          OPEN GENERAL_IVAS_CR;
          LOOP 
              FETCH GENERAL_IVAS_CR INTO vClaveId_1;
              EXIT WHEN GENERAL_IVAS_CR%NOTFOUND;
              vCountRegs := vCountRegs + 1;
              DELETE FROM ZAM_GENERAL_IVAS Where id_iva = vClaveId_1;
              IF DEBUGFLAG = 'Y' THEN
                DBMS_OUTPUT.PUT_LINE('ZAM_GENERAL_IVAS - SE BORRO REG:'||vClaveId_1||' => '||SQL%ROWCOUNT);
              END IF;  
              INSERT INTO ZAM_GENERAL_IVAS (SELECT * FROM xer_general_ivas_v@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 WHERE T1."id_iva" = vClaveId_1);
              IF DEBUGFLAG = 'Y' then
                DBMS_OUTPUT.PUT_LINE('ZAM_GENERAL_IVAS - SE INSERTO REG:'||vClaveId_1||' => '||SQL%ROWCOUNT);
              END IF;  
          END LOOP;
          COMMIT;     
          CLOSE GENERAL_IVAS_CR;
          DBMS_OUTPUT.PUT_LINE('ERP - ZAM_GENERAL_IVAS:('||vCountRegs||') Registros Leidos');
          EXCEPTION
          WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_GENERAL_IVAS:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            ROLLBACK;
        END;   

        -- ZAM_GENERAL_RETENCIONES
        BEGIN
          DBMS_OUTPUT.PUT_LINE('ZAM_GENERAL_RETENCIONES');
          vFechaStart := null; vFechaEnd := null; vClaveId_1 := null; vClaveId_2 := null; vClaveId_3 := null; vClaveId_4 := null; vClaveId_5 := null;
          vCountRegs := 0;
          OPEN GENERAL_RETENCIONES_CR;
          LOOP 
              FETCH GENERAL_RETENCIONES_CR INTO vClaveId_1;
              EXIT WHEN GENERAL_RETENCIONES_CR%NOTFOUND;
              vCountRegs := vCountRegs + 1;
              DELETE FROM ZAM_GENERAL_RETENCIONES Where id_retencion = vClaveId_1;
              IF DEBUGFLAG = 'Y' THEN
                DBMS_OUTPUT.PUT_LINE('ZAM_GENERAL_RETENCIONES - SE BORRO REG:'||vClaveId_1||' => '||SQL%ROWCOUNT);
              END IF;  
              INSERT INTO ZAM_GENERAL_RETENCIONES (SELECT * FROM xer_general_retenciones_v@HSMSSQLDLV.ESTRELLAROJA.COM.MX T1 WHERE T1."id_retencion" = vClaveId_1);
              IF DEBUGFLAG = 'Y' then
                DBMS_OUTPUT.PUT_LINE('ZAM_GENERAL_RETENCIONES - SE INSERTO REG:'||vClaveId_1||' => '||SQL%ROWCOUNT);
              END IF;  
          END LOOP;
          COMMIT;     
          CLOSE GENERAL_RETENCIONES_CR;
          DBMS_OUTPUT.PUT_LINE('ERP - ZAM_GENERAL_IVAS:('||vCountRegs||') Registros Leidos');
          EXCEPTION
          WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAM_GENERAL_RETENCIONES:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            ROLLBACK;
        END;   
     
          -- TERMINA
       dbms_output.put_line('HI');
      exception
      WHEN OTHERS THEN    
          DBMS_OUTPUT.PUT_LINE('OTHERS ERROR EN ERP:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
          ROLLBACK;
          raise;

    END EXTRACT_ZAM_CF_PRC;
  
  PROCEDURE EXTRACT_ZAMTRA_CF_PRC(P_FECHA_PROCESO DATE)  AS

    CURSOR TRAFICO_GUIA_CR IS 
    SELECT "id_area"
          ,"no_guia"
          ,"num_guia"
      FROM TRAFICO_GUIA@HSMSSQLTRA.ESTRELLAROJA.COM.MX 
     WHERE ( TRUNC("fecha_cancelacion") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_confirmacion") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_contabilizado") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_documentador") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_facturacion") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_guia") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_ingreso") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_modifico") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_pago") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_vencimiento") = TRUNC(P_FECHA_PROCESO)
           ); 
         
    CURSOR TRAFICO_GUIA_UDP_CR(prNumGuia VARCHAR2) IS
    SELECT tg."id_area"
            ,tg."no_guia"
      FROM TRAFICO_GUIA@HSMSSQLTRA.ESTRELLAROJA.COM.MX tg
     WHERE tg."num_guia_asignado" = prNumGuia;
         
    CURSOR TRAFICO_VIAJE_CR IS
    SELECT "id_area"
          ,"no_viaje"
      FROM trafico_viaje@HSMSSQLTRA.ESTRELLAROJA.COM.MX
     WHERE TRUNC("fecha_ingreso") = TRUNC(P_FECHA_PROCESO);

    CURSOR TRAFICO_DEPOSITO_CR IS
    SELECT "id_deposito"
      FROM trafico_deposito@HSMSSQLTRA.ESTRELLAROJA.COM.MX
     WHERE ( TRUNC("fecha_deposito") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_ingreso") = TRUNC(P_FECHA_PROCESO)
           );
         
    CURSOR TRAFICO_MOVIMIENTO_CR IS
    SELECT "id_movimiento"
      FROM trafico_movimiento@HSMSSQLTRA.ESTRELLAROJA.COM.MX
     WHERE ( TRUNC("fecha_movimiento")  = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_ingreso")  = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_mov")  = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_modifico")  = TRUNC(P_FECHA_PROCESO)
           );

    CURSOR TRAFICO_LIQUIDACION_CR IS
    SELECT "id_area"
          ,"no_liquidacion"
      FROM trafico_liquidacion@HSMSSQLTRA.ESTRELLAROJA.COM.MX  
     WHERE TRUNC("fecha_ingreso") = TRUNC(P_FECHA_PROCESO);

    CURSOR TRAFICO_CLIENTE_CR IS
    SELECT "id_cliente"
      FROM trafico_cliente@HSMSSQLTRA.ESTRELLAROJA.COM.MX  
     WHERE ( TRUNC("fecha_ingreso") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_modifico") = TRUNC(P_FECHA_PROCESO)
           );
         
    CURSOR TRAFICO_PRODUCTO_CR IS
    SELECT "id_fraccion"
            ,"id_producto"
      FROM trafico_producto@HSMSSQLTRA.ESTRELLAROJA.COM.MX
     WHERE "id_producto" = 0
       AND ( TRUNC("fecha_ingreso") = TRUNC(P_FECHA_PROCESO)
        OR   TRUNC("fecha_modifico") = TRUNC(P_FECHA_PROCESO)
           );

    CURSOR TRAFICO_NCREDITO_CR IS
    SELECT "id_ncredito"
      FROM TRAFICO_NOTA_CREDITO@HSMSSQLTRA.ESTRELLAROJA.COM.MX
     WHERE TRUNC("fecha") = TRUNC(P_FECHA_PROCESO);

    CURSOR DESP_FLOTAS_CR IS
    SELECT "id_flota"
      FROM desp_flotas@HSMSSQLTRA.ESTRELLAROJA.COM.MX; 

    CURSOR MTTO_UNIDADES_CR IS
    SELECT TRIM("id_unidad")
      FROM mtto_unidades@HSMSSQLTRA.ESTRELLAROJA.COM.MX;

    CURSOR TRAFICO_BANCO_CR IS
    SELECT "id_banco"
      FROM TRAFICO_BANCO@HSMSSQLTRA.ESTRELLAROJA.COM.MX;
      
    CURSOR TRAFICO_FACTURA_ELECTRONICA_CR IS
    SELECT "id_factura"
      FROM TRAFICO_FACTURA_ELECTRONICA@HSMSSQLTRA.ESTRELLAROJA.COM.MX
     WHERE TRUNC("fecha_ingreso") = TRUNC(P_FECHA_PROCESO);
      
    CURSOR GENERAL_IVAS_CR IS
    SELECT "id_iva"
      FROM GENERAL_IVAS@HSMSSQLTRA.ESTRELLAROJA.COM.MX;

    CURSOR GENERAL_RETENCIONES_CR IS
    SELECT "id_retencion"
      FROM GENERAL_RETENCIONES@HSMSSQLTRA.ESTRELLAROJA.COM.MX;
      
      DEBUGFLAG varchar2(1);
      vFechaStart date;
      vFechaEnd date;
      vClaveId_1 number;
      vClaveId_2 number;
      vClaveId_3 number;
      vClaveId_4 number;
      vClaveId_5 NUMBER;
      vClaveId_6 varchar2(50);
      vCountRegs NUMBER;
      vClaveIdUDP_1 NUMBER;
      vClaveIdUDP_2 NUMBER;
      vNumGuia ZAMTRA_TRAFICO_GUIA.NUM_GUIA%TYPE;

    BEGIN

          DebugFlag := 'N';

          DBMS_OUTPUT.PUT_LINE('Empieza Inserts');

          -- ZAMTRA_TRAFICO_GUIA
          BEGIN
              DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_GUIA');
               vFechaStart := null; vFechaEnd := null; vClaveId_1 := null; vClaveId_2 := null; vClaveId_3 := null; vClaveId_4 := null; vClaveId_5 := null;
               vCountRegs := 0;
               OPEN TRAFICO_GUIA_CR;
               LOOP
                FETCH TRAFICO_GUIA_CR INTO vClaveId_1,vClaveId_2,vNumGuia;
                EXIT when TRAFICO_GUIA_CR%NOTFOUND;
                vCountRegs := vCountRegs + 1;
                    delete from ZAMTRA_TRAFICO_GUIA where id_area = vClaveId_1 and no_guia = vClaveId_2;
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_GUIA - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
                    insert into ZAMTRA_TRAFICO_GUIA (select T1.*,'N','',sysdate from xer_trafico_guia_v@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 where T1."id_area" = vClaveId_1 and t1."no_guia" = vClaveId_2);
                    ------------------------------------------------------------------------------------------------------------------------
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_GUIA - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
                    -- INICIA guias que cambiaron de factura
                    OPEN TRAFICO_GUIA_UDP_CR(vNumGuia);
                    loop
                      fetch TRAFICO_GUIA_UDP_CR INTO vClaveIdUDP_1,vClaveIdUDP_2;
                      EXIT when TRAFICO_GUIA_UDP_CR%NOTFOUND;
                      vCountRegs := vCountRegs + 1;
                      delete from ZAMTRA_TRAFICO_GUIA where id_area = vClaveIdUDP_1 and no_guia = vClaveIdUDP_2;
                      insert into ZAMTRA_TRAFICO_GUIA (select T1.*,'N','',sysdate from xer_trafico_guia_v@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 WHERE T1."id_area" = vClaveIdUDP_1 and t1."no_guia" = vClaveIdUDP_2);
                    ------------------------------------------------------------------------------------------------------------------------
                      
                    end loop;
                    CLOSE TRAFICO_GUIA_UDP_CR;
                    -- TERMINA
                    
                    BEGIN
                        -- ZAMTRA_TRAFICO_GUIA_OTRO
                        delete from ZAMTRA_TRAFICO_GUIA_OTRO where id_area = vClaveId_1 and no_guia = vClaveId_2;
                        if DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_GUIA_OTRO - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        END IF; 
                        insert into ZAMTRA_TRAFICO_GUIA_OTRO (select * from xer_trafico_guia_otro_v@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 where t1."id_area" = vClaveId_1 and t1."no_guia" = vClaveId_2);
                        IF DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_GUIA_OTRO - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        end if;  
                        DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_TRAFICO_GUIA_OTRO Actualizado');
                    EXCEPTION
                    when OTHERS then
                        DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_TRAFICO_GUIA_OTRO:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
                    END;

               END LOOP;
               COMMIT;     
               close TRAFICO_GUIA_CR;
               DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_TRAFICO_GUIA:('||vCountRegs||') Registros Leidos');
          EXCEPTION 
          when OTHERS then
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_TRAFICO_GUIA:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            rollback;
          END; 
     

         
          -- ZAMTRA_TRAFICO_DEPOSITO
          BEGIN
              DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_DEPOSITO');
               vFechaStart := null;vFechaEnd := null;vClaveId_1 := null;vClaveId_2 := null;vClaveId_3 := null;vClaveId_4 := null;vClaveId_5 := null;
               vCountRegs := 0;
               OPEN TRAFICO_DEPOSITO_CR;
               LOOP
                FETCH TRAFICO_DEPOSITO_CR INTO vClaveId_1;
                EXIT when TRAFICO_DEPOSITO_CR%NOTFOUND;
                vCountRegs := vCountRegs + 1;
                    delete from ZAMTRA_TRAFICO_DEPOSITO where id_deposito = vClaveId_1;
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_DEPOSITO - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    END IF;  
                    --insert into ZAMTRA_TRAFICO_DEPOSITO (select t1.*,'N',SYSDATE from trafico_deposito@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 where T1."id_deposito" = vClaveId_1);
                    insert into ZAMTRA_TRAFICO_DEPOSITO (select t1.*,'N',SYSDATE from xer_trafico_deposito_v@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 where T1."id_deposito" = vClaveId_1);
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_DEPOSITO - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
               END LOOP;
               COMMIT;     
               close TRAFICO_DEPOSITO_CR;
               DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_TRAFICO_DEPOSITO:('||vCountRegs||') Registros Leidos');
          EXCEPTION 
          when OTHERS then
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_TRAFICO_DEPOSITO:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            rollback;
          END; 

          -- ZAMTRA_TRAFICO_MOVIMIENTO
          BEGIN
              DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_MOVIMIENTO');
               vFechaStart := null;vFechaEnd := null;vClaveId_1 := null;vClaveId_2 := null;vClaveId_3 := null;vClaveId_4 := null;vClaveId_5 := null;
               vCountRegs := 0;
               OPEN TRAFICO_MOVIMIENTO_CR;
               LOOP
                FETCH TRAFICO_MOVIMIENTO_CR INTO vClaveId_1;
                EXIT when TRAFICO_MOVIMIENTO_CR%NOTFOUND;
                vCountRegs := vCountRegs + 1;
                    delete from ZAMTRA_TRAFICO_MOVIMIENTO where id_movimiento = vClaveId_1;
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_MOVIMIENTO - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    END IF;  
                    insert into ZAMTRA_TRAFICO_MOVIMIENTO (select * from trafico_movimiento@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 where T1."id_movimiento" = vClaveId_1);
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_MOVIMIENTO - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
                    BEGIN
                        -- ZAMTRA_TRAFICO_RENGLON_MOV
                        delete from ZAMTRA_TRAFICO_RENGLON_MOV where id_movimiento = vClaveId_1;
                        if DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_RENGLON_MOV - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        END IF;  
                        insert into ZAMTRA_TRAFICO_RENGLON_MOV (select t1.*,'N',SYSDATE from xer_trafico_renglon_mov_v@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 where T1."id_movimiento" = vClaveId_1);
                        IF DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_RENGLON_MOV - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        end if;  
                        DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_TRAFICO_RENGLON_MOV Actualizado');
                    EXCEPTION
                    when OTHERS then
                        DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_TRAFICO_RENGLON_MOV:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
                    END;
                    
               END LOOP;
               COMMIT;     
               close TRAFICO_MOVIMIENTO_CR;
               DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_TRAFICO_MOVIMIENTO:('||vCountRegs||') Registros Leidos');
          EXCEPTION 
          when OTHERS then
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_TRAFICO_MOVIMIENTO:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            ROLLBACK;
          END; 
          
          -- ZAMTRA_TRAFICO_GUIA_LIQUIDA
          BEGIN
              DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_GUIA_LIQUIDA');
               vFechaStart := null;vFechaEnd := null;vClaveId_1 := null;vClaveId_2 := null;vClaveId_3 := null;vClaveId_4 := null;vClaveId_5 := null;
               vCountRegs := 0;
               OPEN TRAFICO_LIQUIDACION_CR;
               LOOP
                FETCH TRAFICO_LIQUIDACION_CR INTO vClaveId_1,vClaveId_2;
                EXIT when TRAFICO_LIQUIDACION_CR%NOTFOUND;
                vCountRegs := vCountRegs + 1;
                    delete from ZAMTRA_TRAFICO_LIQUIDACION where id_area = vClaveId_1 and no_liquidacion = vClaveId_2;
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_LIQUIDACION - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    END IF;  
                    insert into ZAMTRA_TRAFICO_LIQUIDACION (select t1.*,'N',SYSDATE from xer_trafico_liquidacion_v@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 where T1."id_area" = vClaveId_1 and t1."no_liquidacion" = vClaveId_2);
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_LIQUIDACION - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
                    
                    BEGIN
                        -- ZAMTRA_TRAFICO_RENGLON_LIQ
                        delete from ZAMTRA_TRAFICO_RENGLON_LIQ where id_area = vClaveId_1 and no_liquidacion = vClaveId_2;
                        if DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_RENGLON_LIQ - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        END IF;  
                        insert into ZAMTRA_TRAFICO_RENGLON_LIQ (select * from xer_trafico_renglon_liq_v@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 where t1."id_area" = vClaveId_1 and t1."no_liquidacion" = vClaveId_2);
                        IF DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_RENGLON_LIQ - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        end if;  
                        DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_TRAFICO_RENGLON_LIQ Actualizado');
                    EXCEPTION
                    when OTHERS then
                        DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_TRAFICO_RENGLON_LIQ:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
                    END;
                    
                    -- Para asegurarse que estan los registros en la tabla de Liquidacion
                    BEGIN
                        -- ZAMTRA_TRAFICO_VIAJE_LIQ
                        delete from ZAMTRA_TRAFICO_VIAJE_LIQ where id_area = vClaveId_1 and no_liquidacion = vClaveId_2;
                        if DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_VIAJE_LIQ - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        END IF;  
                        insert into ZAMTRA_TRAFICO_VIAJE_LIQ 
						(select T1."id_area",T1."no_viaje",T1."id_sector",T1."id_subsector",T1."confirmacion_iave",T1."id_area_liq",T1."id_personal",T1."kms_camion_vacio",T1."kms_camion_lleno",T1."kms_operador",T1."kms_real",T1."no_liquidacion",T1."viaje_ant",T1."no_liquidacion_rend",T1."hrs_realthermo1",T1."hrs_realthermo2",T1."puntaje_viaje",T1."id_ruta",T1."no_ejes_viaje",T1."id_operador2",T1."id_status_unidad",T1."id_origen",T1."id_destino",T1."liquidacion_operador2",T1."cd1",T1."cd2",T1."id_area_liq2",T1."id_depto",T1."fecha_viaje",T1."fecha_fin_viaje",T1."fecha_real_viaje",T1."fecha_real_fin_viaje",T1."fecha_ingreso",T1."f_prog_ini_viaje",T1."f_prog_fin_viaje",T1."f_despachado",T1."f_status_unidad",T1."sueldo_operador",T1."compensaciones",T1."compensacion_operador2",T1."lts_viaje",T1."rendimiento_viaje",T1."rendimiento_real",T1."lts_empresa",T1."rend_esperado",T1."lts_empthermo1",T1."lts_empthermo2",T1."lts_viajethermo1",T1."lts_viajethermo2",T1."rend_espthermo1",T1."rend_espthermo2",T1."rend_realthermo1",T1."rend_realthermo2",T1."ton_viaje",T1."sueldo_operador2",T1."no_kit",T1."id_unidad",T1."id_remolque1",T1."id_remolque2",T1."id_dolly",T1."id_ingreso",T1."thermo1",T1."thermo2",T1."id_linearem1",T1."id_linearem2",T1."status_viaje",T1."confirma_viaje",T1."status_desp",T1."viajeactual",T1."status_cs",T1."id_confirmacion",T1."num_confirmacion",T1."liberado",T1."centro_costo",T1."capacidad_cajas",T1."no_tarjeta_llave",T1."id_configuracionviaje",T1."tipo_pago01",T1."batch",T1."tipo_pago02",T1."id_tipoviaje",T1."num_shipment",T1."kms_viaje",T1."observacionesviaje",T1."id_area_conc",T1."id_areaviaje",T1."id_areapago",T1."rendimiento_reseteo",T1."proporcional_flete",T1."no_transferencia",T1."status_liberado",T1."tipo_cargado",T1."tipo_vacio",T1."tipo_tractor",T1."lts_reseteo",T1."id_statusviaje",T1."f_ini_status",T1."cargadovacio_rem1",T1."cargadovacio_rem2",T1."id_contrato",T1."id_tipo_servicio",T1."pagar_sueldo",T1."rend_reseteo_thermo1",T1."rend_reseteo_thermo2",T1."tipo_sueldo",T1."TEA",T1."id_cliente",T1."id_tipo_operacion",T1."incentivo",T1."monto_incentivo",T1."descuento_transbordo",T1."cupon",T1."lugar_cita",T2."nombre"
						from TRAFICO_VIAJE@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1, PERSONAL_PERSONAL@HSMSSQLTRA.ESTRELLAROJA.COM.MX T2
						WHERE t1."id_personal" = t2."id_personal"(+) and T1."id_area" = vClaveId_1 and t1."no_liquidacion" = vClaveId_2);
                        IF DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_VIAJE_LIQ - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        end if;  
                        DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_TRAFICO_VIAJE_LIQ Actualizado');
                    EXCEPTION
                    when OTHERS then
                        DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_TRAFICO_VIAJE_LIQ:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
                    END;
               END LOOP;
               COMMIT;     
               close TRAFICO_LIQUIDACION_CR;
               DBMS_OUTPUT.PUT_LINE('ZAM - ZAMTRA_TRAFICO_LIQUIDACION:('||vCountRegs||') Registros Leidos');
          EXCEPTION 
          WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR EN ZAM - ZAMTRA_TRAFICO_LIQUIDACION:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            ROLLBACK;
          end;       
          
          -- ZAMTRA_TRAFICO_CLIENTE
          BEGIN
              DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_CLIENTE');
               vFechaStart := null;vFechaEnd := null;vClaveId_1 := null;vClaveId_2 := null;vClaveId_3 := null;vClaveId_4 := null;vClaveId_5 := null;
               vCountRegs := 0;
               OPEN TRAFICO_CLIENTE_CR;
               LOOP
                FETCH TRAFICO_CLIENTE_CR INTO vClaveId_1;
                EXIT when TRAFICO_CLIENTE_CR%NOTFOUND;
                vCountRegs := vCountRegs + 1;
                    delete from ZAMTRA_TRAFICO_CLIENTE where id_cliente = vClaveId_1;
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_CLIENTE - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
                    insert into ZAMTRA_TRAFICO_CLIENTE 
    (ID_CLIENTE,DIAS_CREDITO,ID_GPOCLIENTE,ID_PLAZA,CONSEC_COBRANZA,MATRIZ,AREA_COBRANZA,TIEMPO_CARGA,TIEMPO_DESCARGA,FACTOR_IVA,VALOR_PAGO_OPERADOR,LATPOS,LONPOS,
    MONTO_MANIOBRAS,NOMBRE,RFC,DOMICILIO,TEL,FAX,CONTACTO1,CONTACTO2,CUENTA_CLIENTE,SUBCTA_CLIENTE,PR_NOMBRE,OBSERVACIONES_CLIENTE,TIPO_CLIENTE,TIPO_CREDITO,PRIORIDAD,
    LUNES,MARTES,OMNIONLINE,MIERCOLES,JUEVES,VIERNES,SABADO,CONTROLAR_PAGO,TIPO_PAGO,INSTRUCCIONES,FACTOR_KMSCOBRO,NUM_CLIENTE,ID_CLIENTEPLANTA,SIST_ORIGEN,PERSONAFISICA,
    EMAIL1,EMAIL2,EMAIL3,MONTO_CREDITO,MONTO_ADVERTENCIA,CREDITO_ACTIVO,TIPO_RETENCION,CLIENTE_QUE_PAGA,ID_IVA,ID_RETENCION,ID_SEGURO,AUXILIAR_CLIENTE,CLIENTE_SINCOBRO,
    EXTRANJERO,ID_DESCTOSUTERM,PORC_DESCTOSUTERM,ID_DESCTOFIDE,PORC_DESCTOFIDE,ID_ADDENDA,CP,TIPO_XML,ID_COBRADOR,ID_INGRESO,ID_MODIFICO,FECHA_INGRESO,FECHA_MODIFICO,
    ID_CLIENTE_PERM,ESTATUS,REPETIR_REMISION,ID_COMPANIA,NRA,UBICACION1,UBICACION2,UBICACION3,COMENTARIOS,CODIGO_DINET,ID_EJECUTIVO,INSTRUCCIONES1,INSTRUCCIONES2,NUM_CLIENTEXT,
    NOMBREXT,ASEGURADO,ADDENDA_AMECE,CTE_ASEGURADORA,MOSTRAR_IEPS,REDONDEO,ID_CLIENTE_PEMEX,CONTACTO3,CONTACTO4,CONTACTO5,CONTACTO6,REFERENCIA,CLIENTE_SCMT,PROCESADO,
    ID_USO_CFDI,RESPONSABLE_CLIENTE,FORMA_PAGO,CARTACOBROAUTO,ENVIO_EVIDENCIAS_AUTO,REFERENCIA_CLIENTE,HORAS_CARGA,HORAS_DESCARGA,FACTURA_CP_SINLIQ,CONTRIBUYENTE_RIF,
    SECTOR_PRIMARIO,INTEGRANTE_SISTEMA_FINANCIERO,MOSTRAR_BANCO,MONTO_ADVERTENCIA_USD,MONTO_CREDITO_USD,REPLICADO_AR,ORIG_SYSTEM_REFERENCE,ULTIMA_FECHA_ACTUALIZACION)
                      (select T1."id_cliente",T1."dias_credito",T1."id_gpocliente",T1."id_plaza",T1."consec_cobranza"
,T1."matriz",T1."area_cobranza",T1."tiempo_carga",T1."tiempo_descarga",T1."factor_iva"
,T1."valor_pago_operador",T1."latpos",T1."lonpos",T1."monto_maniobras",T1."nombre",T1."rfc"
,T1."domicilio",T1."tel",T1."fax",T1."contacto1",T1."contacto2",T1."cuenta_cliente"
,T1."subcta_cliente",T1."pr_nombre",T1."observaciones_cliente",T1."tipo_cliente",T1."tipo_credito"
,T1."prioridad",T1."lunes",T1."martes",T1."omnionline",T1."miercoles",T1."jueves",T1."viernes"
,T1."sabado",T1."controlar_pago",T1."tipo_pago",T1."instrucciones",T1."factor_kmscobro"
,T1."num_cliente",T1."id_clienteplanta",T1."sist_origen",T1."personafisica",T1."email1"
,T1."email2",T1."email3",T1."monto_credito",T1."monto_advertencia",T1."credito_activo"
,T1."tipo_retencion",T1."cliente_que_paga",T1."id_iva",T1."id_retencion",T1."id_seguro"
,T1."auxiliar_cliente",T1."cliente_sincobro",T1."extranjero",T1."id_desctosuterm",T1."porc_desctosuterm"
,T1."id_desctofide",T1."porc_desctofide",T1."id_addenda",T1."cp",T1."tipo_xml",T1."id_cobrador"
,T1."id_ingreso",T1."id_modifico",T1."fecha_ingreso",T1."fecha_modifico",T1."id_cliente_perm"
,T1."estatus",T1."repetir_remision",T1."id_compania",T1."nra",T1."ubicacion1",T1."ubicacion2"
,T1."ubicacion3",T1."comentarios",T1."codigo_dinet",T1."id_ejecutivo",T1."instrucciones1"
,T1."instrucciones2",T1."num_clientext",T1."nombrext",T1."asegurado",T1."addenda_amece"
,T1."cte_aseguradora",T1."mostrar_ieps",T1."redondeo",T1."id_cliente_pemex",T1."contacto3"
,T1."contacto4",T1."contacto5",T1."contacto6",T1."referencia",T1."cliente_scmt",T1."procesado"
,T1."id_uso_cfdi",T1."responsable_cliente",NULL,T1."cartacobroauto",T1."envio_evidencias_auto"
,T1."referencia_cliente",T1."horas_carga",T1."horas_descarga",T1."factura_cp_sinliq"
,T1."contribuyente_RIF",T1."sector_primario",T1."integrante_sistema_financiero"
,T1."mostrar_banco",T1."monto_advertencia_usd",T1."monto_credito_usd",'N',NULL,SYSDATE from trafico_cliente@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 where T1."id_cliente" = vClaveId_1);
                    -- (select t1.*,SYSDATE from trafico_cliente@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 where T1."id_cliente" = vClaveId_1);
                    -- Moficiacion JRM 20/03/20 tabla de trafico_cliente@HSMSSQLDLV.ESTRELLAROJA.COM.MX
                     --(select t1.*,'N',NULL,SYSDATE from trafico_cliente@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 where T1."id_cliente" = vClaveId_1);
                     -- Moficiacion JRM 05/03/20 tabla de trafico_cliente@HSMSSQLDLV.ESTRELLAROJA.COM.MX  
                    
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_CLIENTE - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
               END LOOP;
               COMMIT;     
               close TRAFICO_CLIENTE_CR;
               DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_TRAFICO_CLIENTE:('||vCountRegs||') Registros Leidos');
          EXCEPTION 
          when OTHERS then
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_TRAFICO_CLIENTE:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            rollback;
          END; 

          -- ZAMTRA_TRAFICO_PRODUCTO
          BEGIN
              DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_PRODUCTO');
               vFechaStart := null;vFechaEnd := null;vClaveId_1 := null;vClaveId_2 := null;vClaveId_3 := null;vClaveId_4 := null;vClaveId_5 := null;
               vCountRegs := 0;
               OPEN TRAFICO_PRODUCTO_CR;
               LOOP
                FETCH TRAFICO_PRODUCTO_CR INTO vClaveId_1,vClaveId_2;
                EXIT when TRAFICO_PRODUCTO_CR%NOTFOUND;
                vCountRegs := vCountRegs + 1;
                    delete from ZAMTRA_TRAFICO_PRODUCTO where id_fraccion = vClaveId_1 and id_producto = vClaveId_2;
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_PRODUCTO - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
                    insert into ZAMTRA_TRAFICO_PRODUCTO (select * from trafico_producto@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 where T1."id_fraccion" = vClaveId_1 and T1."id_producto" = vClaveId_2);
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_PRODUCTO - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
               END LOOP;
               COMMIT;     
               close TRAFICO_PRODUCTO_CR;
               DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_TRAFICO_PRODUCTO:('||vCountRegs||') Registros Leidos');
          EXCEPTION 
          when OTHERS then
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_TRAFICO_PRODUCTO:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            rollback;
          END; 
       
          -- ZAMTRA_TRAFICO_NOTA_CREDITO
          BEGIN
              DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_NOTA_CREDITO');
               vFechaStart := null;vFechaEnd := null;vClaveId_1 := null;vClaveId_2 := null;vClaveId_3 := null;vClaveId_4 := null;vClaveId_5 := null;
               vCountRegs := 0;
               OPEN TRAFICO_NCREDITO_CR;
               LOOP
                FETCH TRAFICO_NCREDITO_CR INTO vClaveId_1;
                EXIT when TRAFICO_NCREDITO_CR%NOTFOUND;
                vCountRegs := vCountRegs + 1;
                    delete from ZAMTRA_TRAFICO_NOTA_CREDITO where ID_NCREDITO = vClaveId_1;
                    if DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_NOTA_CREDITO - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
                    insert into ZAMTRA_TRAFICO_NOTA_CREDITO (select t1.*,'N',SYSDATE from xer_trafico_nota_credito_v@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 where T1."id_ncredito" = vClaveId_1);
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_NOTA_CREDITO - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
                    BEGIN
                        -- ZAMTRA_TRAFICO_RENGLON_NCREDI
                        delete from ZAMTRA_TRAFICO_RENGLON_NCREDI where id_ncredito = vClaveId_1;
                        if DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_RENGLON_NCREDI - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        END IF;  
                        insert into ZAMTRA_TRAFICO_RENGLON_NCREDI (select * from xer_trafico_renglon_ncredito_v@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 where T1."id_ncredito" = vClaveId_1);
                        IF DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_RENGLON_NCREDI - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                        end if;  
                        DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_TRAFICO_RENGLON_NCREDI Actualizado');
                    EXCEPTION
                    when OTHERS then
                        DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_TRAFICO_RENGLON_NCREDI:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 1500));
                    END;
                    
               END LOOP;
               COMMIT;     
               close TRAFICO_NCREDITO_CR;
               DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_TRAFICO_NOTA_CREDITO:('||vCountRegs||') Registros Leidos');
          EXCEPTION 
          when OTHERS then
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_TRAFICO_NOTA_CREDITO:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            rollback;
          END; 

       -- ZAMTRA_DESP_FLOTAS
          BEGIN
              DBMS_OUTPUT.PUT_LINE('ZAMTRA_DESP_FLOTAS');
               vFechaStart := null;vFechaEnd := null;vClaveId_1 := null;vClaveId_2 := null;vClaveId_3 := null;vClaveId_4 := null;vClaveId_5 := null;
               vCountRegs := 0;
               OPEN DESP_FLOTAS_CR;
               LOOP
                FETCH DESP_FLOTAS_CR INTO vClaveId_1;
                EXIT when DESP_FLOTAS_CR%NOTFOUND;
                vCountRegs := vCountRegs + 1;
                    delete from ZAMTRA_DESP_FLOTAS where id_flota = vClaveId_1;
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAMTRA_DESP_FLOTAS - SE BORRO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    END IF;  
                    insert into ZAMTRA_DESP_FLOTAS (select * from desp_flotas@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 where T1."id_flota" = vClaveId_1);
                    IF DEBUGFLAG = 'Y' then
                      DBMS_OUTPUT.PUT_LINE('ZAMTRA_DESP_FLOTAS - SE INSERTO REG:'||vClaveId_1||' => '||sql%ROWCOUNT);
                    end if;  
               END LOOP;
               COMMIT;     
               close DESP_FLOTAS_CR;
               DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_DESP_FLOTAS:('||vCountRegs||') Registros Leidos');
          EXCEPTION 
          when OTHERS then
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_DESP_FLOTAS:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            rollback;
          end;   
          
       -- ZAMTRA_MTTO_UNIDADES
          IF TO_CHAR(SYSDATE,'D') = 7 THEN -- SOLO EJECUTARSE LOS DOMINGOS
              BEGIN
                  DBMS_OUTPUT.PUT_LINE('ZAMTRA_MTTO_UNIDADES');
                   vFechaStart := null;vFechaEnd := null;vClaveId_1 := null;vClaveId_2 := null;vClaveId_3 := null;vClaveId_4 := null;vClaveId_5 := null;
                   vCountRegs := 0;
                   OPEN MTTO_UNIDADES_CR;
                   LOOP
                    FETCH MTTO_UNIDADES_CR INTO vClaveId_6;
                    EXIT when MTTO_UNIDADES_CR%NOTFOUND;
                    vCountRegs := vCountRegs + 1;
                        delete from ZAMTRA_MTTO_UNIDADES where id_unidad = vClaveId_6;
                        IF DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAMTRA_MTTO_UNIDADES - SE BORRO REG:'||vClaveId_6||' => '||sql%ROWCOUNT);
                        END IF; 
                        insert into ZAMTRA_MTTO_UNIDADES (select T1."id_unidad",T1."total_llantas",T1."tipo_unidad",T1."id_tipo_motor",T1."id_marca_unidad",T1."id_tipo_unidad",T1."kms_acumulados",T1."r_f_v",T1."id_centro_costo",T1."llantas_extras",T1."no_permiso",T1."no_inciso_seguro",T1."id_operador",T1."kms_servicio_ultimo",T1."kms_servicio_sig",T1."id_area",T1."id_depto",T1."kms_inicio_ciclo",T1."secuencia_inicio",T1."idcia",T1."hrs_inicio_ciclo",T1."no_cilindros",T1."prov_carroceria",T1."secuencia_ult",T1."secuencia_sig",T1."no_circula",T1."doble_no_circula",T1."id_tercero",T1."id_status",T1."status_comm",T1."msg_pend",T1."id_ruta",T1."id_area_viaje",T1."no_viaje",T1."id_pedido",T1."id_flota",T1."id_origen",T1."id_destino",T1."id_remitente",T1."id_destinatario",T1."id_macro_ult",T1."costo_tenencia",T1."no_poliza",T1."prima_neta",T1."recargos",T1."der_poliza",T1."iva",T1."costo_unidad",T1."costo_carroceria",T1."ultima_tenencia",T1."ultimo_refrendo",T1."ultimo_permiso",T1."vence_seguro",T1."fecha_kms",T1."fecha_servicio_ultimo",T1."fecha_servicio_sig",T1."fecha_adquisicion",T1."fecha_ultima_rev",T1."fecha_inicio_ciclo",T1."fecha_emision",T1."fecha_desde",T1."fecha_hasta",T1."fecha_adq_carr",T1."fecha_estatus",T1."fecha_baja",T1."posdate",T1."f_real_salida",T1."f_prog_llegada",T1."f_entrada_patio",T1."f_mismapos",T1."TEA",T1."rendimiento_esperado",T1."lts_combustible",T1."lts_aceite",T1."kms_por_dia",T1."dim_ancho",T1."dim_largo",T1."dim_altura",T1."rendimiento_aceite",T1."hrs_acumuladas",T1."hrs_por_dia",T1."hrs_servicio_ultimo",T1."hrs_servicio_sig",T1."proveedor",T1."peso_unidades",T1."lts_relleno",T1."lts_saldocomb",T1."no_serie",T1."modelo",T1."id_ciclo_preventivo",T1."placas",T1."observaciones",T1."no_economico",T1."id_servicio_ultimo",T1."id_servicio_sig",T1."id_servicio_inicio",T1."tarjeta_circulacion",T1."no_factura",T1."tipo_motor",T1."potencia_motor",T1."pulgadas_cubicas",T1."no_motor",T1."color",T1."no_carroceria",T1."obs_carroceria",T1."fecha_vence_placas",T1."poliza",T1."fecha_vence_tenencia",T1."status_unidad",T1."viaje",T1."fecha_vence_seguro",T1."id_thermo",T1."fecha_vence_verificacion",T1."no_kit",T1."desc_marcamotor",T1."desc_provcarroceria",T1."desc_provunidad",T1."tarjeta_llave",T1."no_tarjeta_llave",T1."mctnumber",T1."posicion",T1."poslat",T1."poslon",T1."operador",T1."id_unidad_as",T1."id_remolque1",T1."id_dolly",T1."id_remolque2",T1."origen",T1."destino",T1."id_despachador",T1."tipo_combustible",T1."estado",T1."estado_adquisicion",T1."datos_generales",T1."tipo_moneda",T1."forma_pago",T1."kms_hrs",T1."hrs_automaticas",T1."estatus",T1."tipo_programacion",T1."equipo_omnitracs",T1."tercero",T1."causa_baja",T1."tipo",T1."status",T1."status_caja1",T1."status_caja2",T1."en_patio",T1."mismapos",T1."f_status_unidad",T1."subcta",T1."tipomacro_ult",T1."kms_actuales",T1."ruta",T1."peso_bruto",T1."fecha_instalacion",T1."kmshrsinicialaparmed",T1."no_medidor",T1."tipo_medida",T1."id_operador2",T1."hrs_actuales",T1."id_ingreso",T1."fecha_ingreso",T1."kms_hrs_actuales",T1."fecha_disponible",T1."id_plazadestino",T1."id_tipo_operacion",T1."id_movimiento",T1."clas_uni",T1."cta_consumo",T1."id_status_rem",T1."ultimo_id_destinatario",T1."ultimo_id_area_viaje",T1."ultimo_no_viaje",T1."id_estacion",T1."ultimo_id_areapedido",T1."ultimo_id_pedido",T1."origen_status",T1."cargadovacio",T1."kms_ultima_rev",T1."id_transponder",T1."num_soporte",T1."vehunitnum",T1."nacionalidad",T1."id_localidaddestino",T1."id_circuito",T1."id_compania",T1."kms_arribo",T1."ultimo_id_pedidopk",T1."alarmasnuevas",T1."mensajesnuevos",T1."id_linearem1",T1."id_linearem2",T1."modulo",T1."id_asignacion",T1."kms_actualesvale",T1."kms_recorridosvale",T1."modelo_unidad",T1."madre",T1."hija",T1."asignado",T1."unidad_asignado",T1."hija_asignada",T1."FECHA_LOGISTICA",T1."valor_convenido",T1."deducible_xrobo",T1."deducible_xdmateriales",T1."faset",T1."jefe_flota",T1."id_plazasigdestino",T1."id_sector",T1."id_subflota",T1."EM_email",T1."no_orsan",T1."valida_cargacomb",T1."procesado",T1."disponibilidad",T1."capacidad_aliado",T1."marca_cap_eje_delantero",T1."marca_cap_eje_trasero",T1."marca_modelo_tipo_transmision",T1."marca_suspension",T1."medida_llanta",T1."tipo_ejes",T1."tipo_suspension",T1."marca_aliado",T1."ano_fabricacion",T1."id_histograma_sig",T1."id_histograma_ultimo",T1."fecha_fin_garantia",T1."id_accion",T1."id_project",T1."ccosto",T1."id_tipo_servicio_unidad",T1."poliza2",T1."no_inciso_seguro2",T1."vence_seguro2",T1."id_aseguradora" from MTTO_UNIDADES@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 where T1."id_unidad" = vClaveId_6);
                        --Moficiacion JRM 05/03/20 tambla de trafico_banco@HSMSSQLTRA.ESTRELLAROJA.COM.MX 
                        IF DEBUGFLAG = 'Y' then
                          DBMS_OUTPUT.PUT_LINE('ZAMTRA_MTTO_UNIDADES - SE INSERTO REG:'||vClaveId_6||' => '||sql%ROWCOUNT);
                        end if;  
                   END LOOP;
                   COMMIT;     
                   close MTTO_UNIDADES_CR;
                   DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_MTTO_UNIDADES:('||vCountRegs||') Registros Leidos');
              EXCEPTION 
              when OTHERS then
                DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_MTTO_UNIDADES:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
                rollback;
              end;
          END IF;   

        -- ZAMTRA_TRAFICO_BANCO
        BEGIN
          DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_BANCO');
          vFechaStart := null; vFechaEnd := null; vClaveId_1 := null; vClaveId_2 := null; vClaveId_3 := null; vClaveId_4 := null; vClaveId_5 := null;
          vCountRegs := 0;
          OPEN TRAFICO_BANCO_CR;
          LOOP 
              FETCH TRAFICO_BANCO_CR INTO vClaveId_1;
              EXIT WHEN TRAFICO_BANCO_CR%NOTFOUND;
              vCountRegs := vCountRegs + 1;
              DELETE FROM ZAMTRA_TRAFICO_BANCO Where id_banco = vClaveId_1;
              IF DEBUGFLAG = 'Y' THEN
                DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_BANCO - SE BORRO REG:'||vClaveId_1||' => '||SQL%ROWCOUNT);
              END IF;  
              INSERT INTO ZAMTRA_TRAFICO_BANCO (SELECT "id_banco","descripcion_banco","sucursal","num_cta","status_banco","id_tipo_moneda","fecha_apertura","dia_corte","tipo_cta","consecutivo_cheque","saldo_inicial","saldo_conciliado","saldo_actual","funcionario","telefono","num_chequera","nombre_corto","plazo_cuenta","interes_fijo","id_ctaclasif","cuenta","subcta","aux1","id_areacont","cuenta_regimen","fecha_conciliacion","id_sucursalbanco","titular","id_polizareclasificacion","consecutivo","id_cuenta","leyenda_moneda","id_compania","num_plaza_bco","id_institucion_bancaria","num_orden","leyenda","pago_proveedores","num_cta_sat" FROM TRAFICO_BANCO@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 WHERE T1."id_banco" = vClaveId_1);
             --Moficiacion JRM 05/03/20 tambla de trafico_banco@HSMSSQLTRA.ESTRELLAROJA.COM.MX 
              IF DEBUGFLAG = 'Y' then
                DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_BANCO - SE INSERTO REG:'||vClaveId_1||' => '||SQL%ROWCOUNT);
              END IF;  
          END LOOP;
          COMMIT;     
          CLOSE TRAFICO_BANCO_CR;
          DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_TRAFICO_BANCO:('||vCountRegs||') Registros Leidos');
          EXCEPTION
          WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_TRAFICO_BANCO:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            ROLLBACK;
        END;   
        
        -- ZAMTRA_TRAFICO_FACTURA_ELECIC
        BEGIN
          DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_FACTURA_ELECIC');
          vFechaStart := null; vFechaEnd := null; vClaveId_1 := null; vClaveId_2 := null; vClaveId_3 := null; vClaveId_4 := null; vClaveId_5 := null;
          vCountRegs := 0;
          OPEN TRAFICO_FACTURA_ELECTRONICA_CR;
          LOOP 
              FETCH TRAFICO_FACTURA_ELECTRONICA_CR INTO vClaveId_1;
              EXIT WHEN TRAFICO_FACTURA_ELECTRONICA_CR%NOTFOUND;
              vCountRegs := vCountRegs + 1;
              DELETE FROM ZAMTRA_TRAFICO_FACTURA_ELEC Where id_factura = vClaveId_1;
              IF DEBUGFLAG = 'Y' THEN
                DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_FACTURA_ELECIC - SE BORRO REG:'||vClaveId_1||' => '||SQL%ROWCOUNT);
              END IF;  
              INSERT INTO ZAMTRA_TRAFICO_FACTURA_ELEC (SELECT T1."id_factura",T1."num_guia",T1."status",T1."mensaje_error",T1."tipo_doc",T1."accion",T1."id_ingreso",
T1."fecha_ingreso",T1."id_area",T1."no_guia",T1."no_credito",T1."no_cargo",T1."interfase",T1."num_guia_original",T1."no_aprobacion",T1."ano_aprobacion",
T1."no_certificado",T1."serie",T1."folio",T1."id_addenda",T1."id_formato",T1."email",T1."reimprimir_reenviar",T1."origen_datos",
T1."tipo_cadena",T1."cadena_sat_1",T1."cadena_sat_2",T1."valor_qr",T1."uuid",T1."no_certificado_sat",T1."fecha_timbrado",T1."sello_contribuyente",
T1."sello_proveedor",T1."error_desc_resp",T1."file_name_resp",T1."estatus_resp",T1."nombre_archivo",T1."complemento_nomina",T1."referencia_origen",
T1."id_referencia_origen",T1."id_agrupacion",T1."tipo_nomina",T1."reexpedida",T1."desc_estatus_cancelacion",T1."fecha_solicitud_cancelacion",T1."status_cancel" FROM TRAFICO_FACTURA_ELECTRONICA@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 WHERE T1."id_factura" = vClaveId_1);
              IF DEBUGFLAG = 'Y' then
                DBMS_OUTPUT.PUT_LINE('ZAMTRA_TRAFICO_FACTURA_ELECIC - SE INSERTO REG:'||vClaveId_1||' => '||SQL%ROWCOUNT);
              END IF;  
          END LOOP;
          COMMIT;     
          CLOSE TRAFICO_FACTURA_ELECTRONICA_CR;
          DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_TRAFICO_FACTURA_ELECIC:('||vCountRegs||') Registros Leidos');
          EXCEPTION
          WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_TRAFICO_FACTURA_ELECIC:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            ROLLBACK;
        END;       

        -- ZAMTRA_GENERAL_IVAS
        BEGIN
          DBMS_OUTPUT.PUT_LINE('ZAMTRA_GENERAL_IVAS');
          vFechaStart := null; vFechaEnd := null; vClaveId_1 := null; vClaveId_2 := null; vClaveId_3 := null; vClaveId_4 := null; vClaveId_5 := null;
          vCountRegs := 0;
          OPEN GENERAL_IVAS_CR;
          LOOP 
              FETCH GENERAL_IVAS_CR INTO vClaveId_1;
              EXIT WHEN GENERAL_IVAS_CR%NOTFOUND;
              vCountRegs := vCountRegs + 1;
              DELETE FROM ZAMTRA_GENERAL_IVAS Where id_iva = vClaveId_1;
              IF DEBUGFLAG = 'Y' THEN
                DBMS_OUTPUT.PUT_LINE('ZAMTRA_GENERAL_IVAS - SE BORRO REG:'||vClaveId_1||' => '||SQL%ROWCOUNT);
              END IF;  
              INSERT INTO ZAMTRA_GENERAL_IVAS (SELECT * FROM xer_general_ivas_v@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 WHERE T1."id_iva" = vClaveId_1);
              IF DEBUGFLAG = 'Y' then
                DBMS_OUTPUT.PUT_LINE('ZAMTRA_GENERAL_IVAS - SE INSERTO REG:'||vClaveId_1||' => '||SQL%ROWCOUNT);
              END IF;  
          END LOOP;
          COMMIT;     
          CLOSE GENERAL_IVAS_CR;
          DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_GENERAL_IVAS:('||vCountRegs||') Registros Leidos');
          EXCEPTION
          WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_GENERAL_IVAS:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            ROLLBACK;
        END;   

        -- ZAMTRA_GENERAL_RETENCIONES
        BEGIN
          DBMS_OUTPUT.PUT_LINE('ZAMTRA_GENERAL_RETENCIONES');
          vFechaStart := null; vFechaEnd := null; vClaveId_1 := null; vClaveId_2 := null; vClaveId_3 := null; vClaveId_4 := null; vClaveId_5 := null;
          vCountRegs := 0;
          OPEN GENERAL_RETENCIONES_CR;
          LOOP 
              FETCH GENERAL_RETENCIONES_CR INTO vClaveId_1;
              EXIT WHEN GENERAL_RETENCIONES_CR%NOTFOUND;
              vCountRegs := vCountRegs + 1;
              DELETE FROM ZAMTRA_GENERAL_RETENCIONES Where id_retencion = vClaveId_1;
              IF DEBUGFLAG = 'Y' THEN
                DBMS_OUTPUT.PUT_LINE('ZAMTRA_GENERAL_RETENCIONES - SE BORRO REG:'||vClaveId_1||' => '||SQL%ROWCOUNT);
              END IF;  
              INSERT INTO ZAMTRA_GENERAL_RETENCIONES (SELECT * FROM xer_general_retenciones_v@HSMSSQLTRA.ESTRELLAROJA.COM.MX T1 WHERE T1."id_retencion" = vClaveId_1);
              IF DEBUGFLAG = 'Y' then
                DBMS_OUTPUT.PUT_LINE('ZAMTRA_GENERAL_RETENCIONES - SE INSERTO REG:'||vClaveId_1||' => '||SQL%ROWCOUNT);
              END IF;  
          END LOOP;
          COMMIT;     
          CLOSE GENERAL_RETENCIONES_CR;
          DBMS_OUTPUT.PUT_LINE('ERP - ZAMTRA_GENERAL_IVAS:('||vCountRegs||') Registros Leidos');
          EXCEPTION
          WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR EN ERP - ZAMTRA_GENERAL_RETENCIONES:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
            ROLLBACK;
        END;   
     
          -- TERMINA
       dbms_output.put_line('HI');
      exception
      WHEN OTHERS THEN    
          DBMS_OUTPUT.PUT_LINE('OTHERS ERROR EN ERP:'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 200));
          ROLLBACK;
          raise;

    END EXTRACT_ZAMTRA_CF_PRC;

    PROCEDURE RUN_EXTRACT IS

      P_FECHA_PROCESO DATE;

    BEGIN 
      P_FECHA_PROCESO := TRUNC(SYSDATE-1);

      BEGIN
        dbms_output.put_line('INICIA EXTRACT_ZAM_CF_PRC');
        INER_XXER_STAGE_EXTRACT_PKG.EXTRACT_ZAM_CF_PRC ( P_FECHA_PROCESO );
        COMMIT;
        dbms_output.put_line('TERMINO EXTRACT_ZAM_CF_PRC');
      EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        dbms_output.put_line('EEROR EN EXTRACT_ZAM_CF_PRC('||to_char(P_FECHA_PROCESO,'DD/MM/RRRR')||'):'||SQLERRM);    
      END;
      
      BEGIN
        dbms_output.put_line('INICIA EXTRACT_ZAMTRA_CF_PRC');
        INER_XXER_STAGE_EXTRACT_PKG.EXTRACT_ZAMTRA_CF_PRC ( P_FECHA_PROCESO );
        COMMIT; 
        dbms_output.put_line('TERMINO EXTRACT_ZAMTRA_CF_PRC');
      EXCEPTION  
      WHEN OTHERS THEN
        ROLLBACK;
        dbms_output.put_line('EEROR EN EXTRACT_ZAMTRA_CF_PRC('||to_char(P_FECHA_PROCESO,'DD/MM/RRRR')||'):'||SQLERRM);    
      END;
  
    END RUN_EXTRACT; 
    
END INER_XXER_STAGE_EXTRACT_PKG;