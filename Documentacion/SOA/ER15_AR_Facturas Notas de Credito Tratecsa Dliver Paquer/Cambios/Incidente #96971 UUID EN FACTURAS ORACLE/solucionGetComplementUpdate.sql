/*Procedimiento usado para recuperar el organization_id tomando como base base al TRX_NUMBER
  se traera el organization_id solo de aquellos registros de entrada que esten con estado LOADED
  se omitiran los que esten en error.*/

    PROCEDURE get_complement_to_upd_uuid (
        p_invoices_to_update       IN xxer_invoices_to_update_ttype,
        p_complement_upd_uuid_id   OUT xxer_complement_upd_uuid_ttype,
        p_error                    OUT NUMBER,
        p_error_desc               OUT VARCHAR2
    ) AS

        v_status_loaded            VARCHAR2(10) := 'S';
        v_organization_id          INER_XXER_CNF_INTERFASE_INGRESOS_AR_TBL.organization_id%TYPE := NULL;
        v_complement_upd_uuid_tb   xxer_complement_upd_uuid_ttype := xxer_complement_upd_uuid_ttype ();
        v_exist_record             NUMBER := 0;
        v_uuid                     INER_XXER_PUENTE_AUX_TBL.uuid%TYPE := '';
        v_error_msg                VARCHAR2(300) := NULL;
        v_error_location           VARCHAR2(255);
    BEGIN
--V_TRX_NUM_AND_ORG_ID_TB

/*Se evalua que el parámetro de registros para encontrar complementos,no venga nulo*/
        IF
            p_invoices_to_update.count > 0
        THEN
            FOR i IN 1..p_invoices_to_update.count LOOP
                IF
                    p_invoices_to_update(i).status = v_status_loaded
                THEN
                    v_error_location := 'Error when search record to search organization_id';
                    /*SELECT DISTINCT
                        COUNT(*)
                    INTO v_exist_record
                    FROM
                        INER_XXER_AR_INVOICES_V inv
                    WHERE
                        1 = 1
                        AND inv."Transaction_Number" = p_invoices_to_update(i).trx_number
                        AND ROWNUM = 1;*/
                    select DISTINCT count(*) 
                    INTO v_exist_record
                    from INER_XXER_PUENTE_HEADER_TBL header,INER_XXER_CNF_INTERFASE_INGRESOS_AR_TBL cnf,INER_XXER_PUENTE_AUX_TBL aux  
                        where 1=1 and cnf.tipo_documento=header.tipo_documento and cnf.sistema_origen=header.sistema_origen 
                           and header.tabla_puente_id= aux.tabla_puente_header_id
                           and header.numero_documento=p_invoices_to_update(i).trx_number
                           AND cnf.organization_id is NOT NULL
                           AND (NVL (header.estatus, 'P') = 'P') 
                           AND ROWNUM = 1;
                        
                        
                /*Se compara si existe el registro para recuperar el ORG_ID*/

                    IF
                        v_exist_record > 0
                    THEN
                        v_error_location := 'Error when obtaining organization_id for transaction_number: ' || p_invoices_to_update(i).trx_number;
                        /*SELECT DISTINCT
                            nvl(inv.organization_id,0),
                            nvl(inv.uuid,'Default')
                        INTO
                            v_organization_id,
                            v_uuid
                        FROM
                            INER_XXER_AR_INVOICES_V inv
                        WHERE
                            1 = 1
                            AND inv."Transaction_Number" = p_invoices_to_update(i).trx_number
                            AND ROWNUM = 1;*/
                            
                        select DISTINCT nvl(cnf.organization_id,0),nvl(aux.UUID,'Default')
                        INTO v_organization_id,v_uuid
                        from INER_XXER_PUENTE_HEADER_TBL header,INER_XXER_CNF_INTERFASE_INGRESOS_AR_TBL cnf,INER_XXER_PUENTE_AUX_TBL aux  
                        where 1=1 and cnf.tipo_documento=header.tipo_documento and cnf.sistema_origen=header.sistema_origen 
                           and header.tabla_puente_id= aux.tabla_puente_header_id
                           and header.numero_documento=p_invoices_to_update(i).trx_number
                           AND cnf.organization_id is NOT NULL
                           AND (NVL (header.estatus, 'P') = 'P') 
                           AND ROWNUM = 1;

                    /*Se agrega el TRX_NUMBER y ORGANIZATION_ID  ala varible de salida */

                        v_complement_upd_uuid_tb.extend;
                        v_complement_upd_uuid_tb(v_complement_upd_uuid_tb.count) := xxer_complement_upd_uuid_type(p_invoices_to_update(i).trx_number,v_organization_id
,v_uuid);
                    ELSE
                        p_error_desc := ',The Invoice with TRX_NUMBER '
                                        || p_invoices_to_update(i).trx_number
                                        || ' could not be update,because not found the ORG_ID. ';
                    END IF;
                ELSE
          /*Agregar mensaje o funcionalidad para cuando el registro es error*/
                    NULL;
                END IF; /*Fin de IF que evalua si el estado de la factura fue cargado (LOADED)*/
            END LOOP;
        END IF; /*Fin de if que evalua la nularidad de del parametro de facturas a guardar*/
  /*Se asigna la varible de TRX_NUMBER y ORG_ID encontrados a la varible de salida*/
        p_complement_upd_uuid_id := v_complement_upd_uuid_tb;
    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_AR_UTILITIES_PKG.PREPARE_PROCESS_LOAD_INVOICES'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);
    END get_complement_to_upd_uuid;