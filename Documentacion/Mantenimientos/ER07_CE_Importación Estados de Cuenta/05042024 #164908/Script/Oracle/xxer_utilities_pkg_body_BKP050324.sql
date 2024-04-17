create or replace PACKAGE BODY            xxer_utilities_pkg AS
 
 /**
 * Procedimiento utilizado para el procesamiento de Receipt y de Invoice
 *
 * @param P_INFORMATION Información requerida para el procesamiento
 * @param P_MODULE R para Receipt e I para Invoice
 * @param P_RECEIPT regresa un tipo de Receipt
 * @param P_INVOICE regresa un tipo de Invoice
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */

    PROCEDURE get_information_receipt_invoice (
        p_information   IN xxer_ar_receipt_invoice_ttype,
        p_module        IN VARCHAR2,
                                            /*P_ORG         IN XXER_AR_RECEIPT_INVOICE_ORG_TTYPE DEFAULT NULL,*/
        p_receipt       OUT xxer_ar_receipt_ttype,
        p_invoice       OUT xxer_ar_get_inv_tb_typ,
        p_error         OUT NUMBER,
        p_error_desc    OUT VARCHAR2
    ) AS
        p_prepare_load_invoices_error        NUMBER;
        p_prepare_load_invoices_error_desc   VARCHAR2(3000);
    BEGIN
        IF
            p_module IS NOT NULL
        THEN
            IF
                p_module = 'R'
            THEN
                v_error_location := 'Llama al PROCEDIMIENTO GET_RECEIPT';
                xxer_utilities_pkg.get_receipt(p_information,
                                                /*P_ORG,*/p_receipt,p_error,p_error_desc);
            ELSE--- NOTAS DE CREDITO O FACTURAS
                 /*Se manda a actualizar las facturas candidatas  a cargar,se actualizaran con el estatus en 'P' y batch_id correspondiente*/
                xxer_utilities_pkg.prepare_process_load_invoices(p_module,p_prepare_load_invoices_error,p_prepare_load_invoices_error_desc);
              /*Se evalua que no haya errores en la preparación de las facturas para poder continuar con el flujo*/
             -- IF (P_PREPARE_LOAD_INVOICES_ERROR IS NULL AND P_PREPARE_LOAD_INVOICES_ERROR_DESC IS NULL) THEN
                v_error_location := 'Llama al PROCEDIMIENTO GET_INVOICE';
                xxer_utilities_pkg.get_invoices(p_information,p_module,p_invoice,p_error,p_error_desc);
              -- END IF;
            END IF;
        ELSE
            v_error_location := 'Se necesita el valor de P_MODULE';
        END IF;

        NULL;
    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_UTILITIES_PKG.GET_INFORMATION_RECEIPT_INVOICE'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);

    END get_information_receipt_invoice;

/**
 * Procedimiento utilizado para obtener los receipt
 *
 * @param P_INFORMATION Información requerida para el procesamiento
 * @param P_RECEIPT regresa un tipo de Receipt
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */

    PROCEDURE get_receipt (
        p_information   IN xxer_ar_receipt_invoice_ttype,
                       /*P_ORG         IN XXER_AR_RECEIPT_INVOICE_ORG_TTYPE DEFAULT NULL,*/
        p_receipt       OUT xxer_ar_receipt_ttype,
        p_error         OUT NUMBER,
        p_error_desc    OUT VARCHAR2
    ) AS

        CURSOR information_cursor (
            rfc_dest   IN xxer_tbl_puente_header.rfc_destino%TYPE,
            p_org_id   NUMBER
        ) IS SELECT
            xph.tabla_puente_id,
            xph.rfc_origen,
            xph.rfc_destino,
            xph.nombre_fiscal_origen,
            xph.fecha_movimiento AS deposit_date,
            xph.fecha_movimiento AS receipt_date,
            xph.numero_documento AS receipt_number,
            xpl.total AS amount,
            xci.receipt_method_id AS receipt_method_id,
            xci.organization_id AS organization_id,
            xci.metodo_recibo
             FROM
            xxer_tbl_puente_header xph,
            xxer_tbl_puente_lines xpl,
            xxer_cnf_interfase_ingresos_ar xci
             WHERE
            1 = 1
            AND xph.tabla_puente_id = xpl.tabla_puente_id
            AND nvl(xci.sistema_origen,1) = nvl(xph.sistema_origen,1)
            AND nvl(xci.tipo_documento,1) = nvl(xph.tipo_documento,1)
            AND nvl(xci.tipo_movimiento,1) = nvl(xph.tipo_movimiento,1)
            AND DECODE(nvl(xci.sistema_origen,1),'NOMINA',nvl(xph.rfc_origen,1),nvl(xci.rfc_origen,1) ) = nvl(xph.rfc_origen,1)
            AND DECODE(nvl(xci.origen_servicio,1),'TODOS',nvl(xpl.origen_servicio,1),nvl(xci.origen_servicio,1) ) = nvl(xpl.origen_servicio,1)
            AND DECODE(nvl(xci.destino_servicio,1),'TODOS',nvl(xpl.destino_servicio,1),nvl(xci.destino_servicio,1) ) = nvl(xpl.destino_servicio,1
)
            AND DECODE(nvl(xci.servicio,1),'TODOS',nvl(xpl.servicio,1),nvl(xci.servicio,1) ) = nvl(xpl.servicio,1)
            AND nvl(xci.concepto_modalidad,1) = nvl(xpl.concepto_modalidad,1)
            AND DECODE(nvl(xci.forma_pago,1),'TODOS',nvl(xpl.forma_pago,1),nvl(xci.forma_pago,1) ) = nvl(xpl.forma_pago,1)
            AND nvl(xci.adicional1,1) = nvl(xph.adicional1,1)
            AND nvl(xci.adicional2,1) = nvl(xph.adicional2,1)
            AND nvl(xci.adicional3,1) = nvl(xph.adicional3,1)
            AND nvl(xci.adicional4,1) = nvl(xph.adicional4,1)
            AND nvl(xci.adicional5,1) = nvl(xph.adicional5,1)
            AND nvl(xci.adicional6,1) = nvl(xph.adicional6,1)
            AND nvl(xci.adicional7,1) = nvl(xph.adicional7,1)
            AND nvl(xci.adicional8,1) = nvl(xph.adicional8,1)
            AND nvl(xci.adicional9,1) = nvl(xph.adicional9,1)
            AND nvl(xci.adicional10,1) = nvl(xph.adicional10,1)
            AND xph.sistema_origen NOT IN (
                'EAM',
                'INV',
                'PORTAL'
            )
            AND xph.tipo_documento NOT IN (
                'FACTURA'
            )
            AND nvl(xph.estatus,'x') NOT IN (
                'S',
                'E',
                'N'
            )
            AND xph.rfc_destino = rfc_dest
            AND xci.organization_id = p_org_id
            AND ROWNUM <= 10
             GROUP BY
            xph.tabla_puente_id,
            xph.rfc_origen,
            xph.rfc_destino,
            xph.nombre_fiscal_origen,
            xph.fecha_movimiento,
            xph.fecha_movimiento,
            xph.numero_documento,
            xpl.total,
            xci.receipt_method_id,
            xci.organization_id,
            xci.metodo_recibo
        ORDER BY
            1;

        inf_cur               information_cursor%rowtype;
        v_deposit_date        xxer_tbl_puente_header.fecha_movimiento%TYPE;
        v_receipt_date        xxer_tbl_puente_header.fecha_movimiento%TYPE;
        v_receipt_number      xxer_tbl_puente_header.numero_documento%TYPE;
        v_amount              xxer_tbl_puente_lines.total%TYPE;
        v_receipt_method_id   xxer_cnf_interfase_ingresos_ar.receipt_method_id%TYPE;
        v_tabla_puente_id     xxer_tbl_puente_header.tabla_puente_id%TYPE;
        v_organization_id     xxer_cnf_interfase_ingresos_ar.organization_id%TYPE;
        v_metodo_recibo       xxer_cnf_interfase_ingresos_ar.metodo_recibo%TYPE;
        v_cash_receipt_id     NUMBER := 0;
        v_reg_receipt         xxer_ar_receipt_tbl.tabla_puente_id%TYPE;
        v_receipt_type        xxer_ar_receipt_ttype := xxer_ar_receipt_ttype ();
    BEGIN
        FOR r IN (
            SELECT
                rt.*
            FROM
                TABLE ( p_information ) rt
        ) LOOP

    --Se limpian variable
            v_deposit_date := NULL;
            v_receipt_date := NULL;
            v_receipt_number := NULL;
            v_amount := NULL;
            v_receipt_method_id := NULL;
            v_tabla_puente_id := NULL;
            v_organization_id := NULL;
            v_metodo_recibo := NULL;
            FOR inf_cur IN information_cursor(r.rfc,r.org_id) LOOP
            --Obtiene valores adicionales de tablas custom
                v_deposit_date := inf_cur.deposit_date;
                v_receipt_date := inf_cur.receipt_date;
                v_receipt_number := inf_cur.receipt_number;
                v_amount := inf_cur.amount;
                v_receipt_method_id := inf_cur.receipt_method_id;
                v_tabla_puente_id := inf_cur.tabla_puente_id;
                v_organization_id := inf_cur.organization_id;
                v_metodo_recibo := inf_cur.metodo_recibo;
                IF
                    v_tabla_puente_id IS NOT NULL
                THEN
                    SELECT
                        nvl(COUNT(tabla_puente_id),0)
                    INTO v_reg_receipt
                    FROM
                        xxer_ar_receipt_tbl
                    WHERE
                        1 = 1
                        AND tabla_puente_id = v_tabla_puente_id;

                    v_error_location := 'Extiende XXER_AR_RECEIPT_TYPE';
                    v_receipt_type.extend;
                    v_error_location := 'Inserta valores en XXER_AR_RECEIPT_TYPE';
                    v_receipt_type(v_receipt_type.count) := xxer_ar_receipt_type(r.rfc,v_amount,r.site_use_id,v_deposit_date,r.cust_account_id,v_receipt_date
,v_receipt_method_id,v_receipt_number,v_cash_receipt_id,v_organization_id/*V_ORG_ID*/,v_tabla_puente_id);

                    IF
                        v_reg_receipt = 0
                    THEN
                        INSERT INTO xxer_ar_receipt_tbl (
                            tabla_puente_id,
                            rfc,
                            amount_recibo,
                            site_use_id,
                            deposit_date,
                            cust_account_id,
                            receipt_date,
                            receipt_method_id,
                            receipt_number,
                            organization_id,
                            receipt_id,
                            estatus,
                            error_description,
                            created_by,
                            creation_date,
                            last_updated_by,
                            last_update_date,
                            object_version_number,
                            party_name,
                            metodo_recibo
                        ) VALUES (
                            v_tabla_puente_id,
                            r.rfc,
                            v_amount,
                            r.site_use_id,
                            v_deposit_date,
                            r.cust_account_id,
                            v_receipt_date,
                            v_receipt_method_id,
                            v_receipt_number,
                            v_organization_id,
                            NULL,
                            NULL,
                            NULL,
                            'SOA_ADMIN',
                            SYSDATE,
                            'SOA_ADMIN',
                            SYSDATE,
                            1,
                            r.party_name,
                            v_metodo_recibo
                        );
                    --COMMIT;

                    END IF;

                END IF;

            END LOOP;

        END LOOP;

        v_error_location := 'Retorna valor GET_RECEIPT';
        p_receipt := v_receipt_type;
    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_UTILITIES_PKG.GET_RECEIPT'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);

    END get_receipt;

/**
 * Procedimiento utilizado para llevar el registro de los Recibos Procesados
 * seeguido de inserción de información de los recibos que se aplicarán
 *
 * @param P_REG_RECEIPT Información procesada de crear recibos
 * @param P_REG_APPLY_RECEIPT regresa un tipo de Receipt para ser aplicados
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */

    PROCEDURE processed_receipt (
        p_reg_receipt         IN xxer_ar_proc_rec_ttype,
        p_reg_apply_receipt   OUT xxer_ar_apply_receipt_ttype,
        p_error               OUT NUMBER,
        p_error_desc          OUT VARCHAR2
    ) AS

        CURSOR facturas_cursor (
            factu   IN xxer_tbl_puente_header.referencia_aplicacion%TYPE
        ) IS SELECT
            regexp_substr(factu,'[^|]+',1,level) cadena_comp
             FROM
            dual
        CONNECT BY
            level <= regexp_count(factu,'[^|]+');

        fact_cur               facturas_cursor%rowtype;
        CURSOR detalle_fact_cursor (
            detalle   IN xxer_tbl_puente_header.referencia_aplicacion%TYPE
        ) IS SELECT
            regexp_substr(detalle,'[^_]+',1,level) cadena_detalle
             FROM
            dual
        CONNECT BY
            level <= regexp_count(detalle,'[^_]+');

        deta_fact_cur          detalle_fact_cursor%rowtype;
        v_receipt_id           xxer_ar_receipt_tbl.receipt_id%TYPE;
        v_receipt_number       xxer_ar_receipt_tbl.receipt_number%TYPE;
        v_customer_name        xxer_ar_receipt_tbl.party_name%TYPE;
        v_application_date     xxer_ar_receipt_tbl.deposit_date%TYPE;
        v_accounting_date      xxer_ar_receipt_tbl.receipt_date%TYPE;
        v_cust_account_id      xxer_ar_receipt_tbl.cust_account_id%TYPE;
        v_organization_id      xxer_ar_receipt_tbl.organization_id%TYPE;
        v_metodo_recibo        xxer_ar_receipt_tbl.metodo_recibo%TYPE;
        v_cadena_facturas      xxer_tbl_puente_header.referencia_aplicacion%TYPE;
        v_amount               xxer_ar_receipt_apply_tbl.amount%TYPE;
        v_trx_number           xxer_ar_receipt_apply_tbl.trx_number%TYPE;
        v_count                NUMBER;
        v_receipt_apply_type   xxer_ar_apply_receipt_ttype := xxer_ar_apply_receipt_ttype ();
        v_exist_apply          NUMBER;
        v_sum_fact             NUMBER;
        v_seq                  xxer_ar_receipt_apply_tbl.receipt_apply_id%TYPE;
        v_total                xxer_tbl_puente_lines.total%TYPE;
        v_total_upd            xxer_tbl_puente_lines.total%TYPE;
        CURSOR receipt_upd_cursor (
            receiptupd   IN xxer_ar_receipt_apply_tbl.tabla_puente_id%TYPE
        ) IS SELECT
            receipt_apply_id,
            tabla_puente_id,
            amount,
            party_name,
            customer_trx_id,
            trx_number
             FROM
            xxer_ar_receipt_apply_tbl
             WHERE
            1 = 1
            AND tabla_puente_id = receiptupd
            AND nvl(estatus,'X') NOT IN (
                'S',
                'E',
                'N'
            );

        upd_cur                receipt_upd_cursor%rowtype;
    BEGIN
        dbms_output.put_line('inicia PROCESSED_RECEIPT');
        v_error_location := 'Inicia Procedimiento PROCESSED_RECEIPT';
        FOR reg IN (
            SELECT
                prr.*
            FROM
                TABLE ( p_reg_receipt ) prr
        ) LOOP
            v_error_location := 'Actualiza Row de la tabla XXER_AR_RECEIPT_TBL con clave: '
                                || reg.tabla_puente_id
                                || ' y Clave Reccibo: '
                                || reg.receipt_id;
      ----##############
            dbms_output.put_line('reg.ESTATUS: ' || reg.estatus);
            dbms_output.put_line('reg.TABLA_PUENTE_ID: ' || reg.tabla_puente_id);
            dbms_output.put_line('reg.RECEIPT_ID: ' || reg.receipt_id);
      ---###############
            UPDATE xxer_ar_receipt_tbl
            SET
                receipt_id = reg.receipt_id,
                estatus = reg.estatus,
                error_description = substr(reg.errordescripcion,1,499),
                last_updated_by = 'SOA_ADMIN',
                last_update_date = SYSDATE,
                object_version_number = object_version_number + 1
            WHERE
                1 = 1
                AND tabla_puente_id = reg.tabla_puente_id;

          --COMMIT;

        --Arma la información necesaria para consumir el servicio CreateApplyReceipt

            IF
                reg.receipt_id IS NOT NULL
            THEN
                v_error_location := 'Construye type XXER_AR_APPLY_RECEIPT_TYPE para la clave de recibo: ' || reg.receipt_id;
                v_error_location := 'Obtiene el total del recibo';
                BEGIN
                    SELECT
                        total
                    INTO v_total
                    FROM
                        xxer_tbl_puente_lines
                    WHERE
                        1 = 1
                        AND tabla_puente_id = reg.tabla_puente_id
                        AND ROWNUM = 1;

                EXCEPTION
                    WHEN OTHERS THEN
                        v_error_location := 'No encuentra registra en la tabla XXER_TBL_PUENTE_LINES';
                        v_total := 0;
                END;

                v_error_location := 'Se consulta si es reintento o primer intento';
                v_exist_apply := 0;
                SELECT
                    COUNT(receipt_apply_id)
                INTO v_exist_apply
                FROM
                    xxer_ar_receipt_apply_tbl
                WHERE
                    1 = 1
                    AND tabla_puente_id = reg.tabla_puente_id;

                dbms_output.put_line('V_EXIST_APPLY:' || v_exist_apply);
                IF
                    v_exist_apply = 0
                THEN
                    v_error_location := 'No existen registros de Apply Receipt por lo que se considera como primer intento';
                    SELECT
                        receipt_id,
                        receipt_number,
                        party_name,
                        deposit_date,
                        receipt_date,
                        cust_account_id,
                        organization_id,
                        metodo_recibo
                    INTO
                        v_receipt_id,
                        v_receipt_number,
                        v_customer_name,
                        v_application_date,
                        v_accounting_date,
                        v_cust_account_id,
                        v_organization_id,
                        v_metodo_recibo
                    FROM
                        xxer_ar_receipt_tbl
                    WHERE
                        1 = 1
                        AND tabla_puente_id = reg.tabla_puente_id;

                    v_error_location := 'Consulta cadena de facturas y monto por factura';
                    SELECT
                        referencia_aplicacion
                    INTO v_cadena_facturas
                    FROM
                        xxer_tbl_puente_header
                    WHERE
                        1 = 1
                        AND tabla_puente_id = reg.tabla_puente_id;

                    v_error_location := 'Obtiene el consecutivo';
                     --- ***** ******
                     --- actualizar todos los recibos que no tengan aplicaciones en la tabla puente
                    dbms_output.put_line('UPDATE XXER_TBL_PUENTE_HEADER estatus:' || reg.estatus);
                    UPDATE xxer_tbl_puente_header
                    SET
                        estatus = reg.estatus,
                        last_update_date = SYSDATE,
                        last_updated_by = 1
                    WHERE
                        tabla_puente_id = reg.tabla_puente_id
                        --AND referencia_aplicacion IS NULL
                        ;                      
                     --- ***** ******

                    SELECT
                        nvl(MAX(receipt_apply_id),0) sequ
                    INTO v_seq
                    FROM
                        xxer_ar_receipt_apply_tbl;

                    v_seq := v_seq + 1;
                    v_sum_fact := 0;
                    v_error_location := 'Se itera para obtener por token cada factura';
                    FOR fact_cur IN facturas_cursor(v_cadena_facturas) LOOP
                        v_error_location := 'Factura - Monto: ' || fact_cur.cadena_comp;
                        IF
                            fact_cur.cadena_comp IS NOT NULL
                        THEN
                            v_amount := NULL;
                            v_trx_number := NULL;
                            v_count := 1;
                            FOR deta_fact_cur IN detalle_fact_cursor(fact_cur.cadena_comp) LOOP
                                IF
                                    v_count = 1 AND deta_fact_cur.cadena_detalle IS NOT NULL
                                THEN
                                    v_trx_number := deta_fact_cur.cadena_detalle;
                                    v_error_location := 'Num Factura: ' || v_trx_number;
                                ELSIF v_count = 2 AND deta_fact_cur.cadena_detalle IS NOT NULL THEN
                                    v_amount := deta_fact_cur.cadena_detalle;
                                    v_error_location := 'Monto Factura: ' || v_amount;
                                END IF;

                                v_count := v_count + 1;
                            END LOOP;

                            v_sum_fact := v_sum_fact + v_amount;
                            IF
                                v_trx_number IS NOT NULL AND v_amount IS NOT NULL AND v_sum_fact <= v_total
                            THEN
                                v_receipt_apply_type.extend;
                                v_error_location := 'Inserta valores en XXER_AR_APPLY_RECEIPT_TYPE';
                                v_receipt_apply_type(v_receipt_apply_type.count) := xxer_ar_apply_receipt_type(v_amount,v_receipt_id,v_receipt_number,v_trx_number,
v_customer_name,v_application_date,v_accounting_date,v_cust_account_id,v_organization_id,v_metodo_recibo,v_seq);

                                INSERT INTO xxer_ar_receipt_apply_tbl (
                                    receipt_apply_id,
                                    tabla_puente_id,
                                    amount,
                                    party_name,
                                    customer_trx_id,
                                    trx_number,
                                    estatus,
                                    error_description,
                                    created_by,
                                    creation_date,
                                    last_updated_by,
                                    last_update_date,
                                    object_version_number
                                ) VALUES (
                                    v_seq,
                                    reg.tabla_puente_id,
                                    v_amount,
                                    v_customer_name,
                                    NULL,
                                    v_trx_number,
                                    NULL,
                                    NULL,
                                    'SOA_ADMIN',
                                    SYSDATE,
                                    'SOA_ADMIN',
                                    SYSDATE,
                                    1
                                );                       

                                                  --COMMIT;

                                v_seq := v_seq + 1;
                            END IF;

                        END IF;

                    END LOOP;

                ELSE
                    v_error_location := 'Ya existen registros de Apply Receipt por lo que es un reintento';
                    --se agrega la actualización para los registros en headers de tabla puente
                    UPDATE xxer_tbl_puente_header
                    SET
                        estatus = reg.estatus,
                        last_update_date = SYSDATE,
                        last_updated_by = 1
                    WHERE
                        tabla_puente_id = reg.tabla_puente_id;

                    SELECT
                        nvl(SUM(amount),0)
                    INTO v_total_upd
                    FROM
                        xxer_ar_receipt_apply_tbl
                    WHERE
                        1 = 1
                        AND estatus = 'S'
                        AND tabla_puente_id = reg.tabla_puente_id;

                    IF
                        v_total_upd < v_amount
                    THEN
                        FOR upd_cur IN receipt_upd_cursor(reg.tabla_puente_id) LOOP
                            IF
                                ( upd_cur.amount + v_total_upd ) < v_amount
                            THEN
                                v_total_upd := upd_cur.amount + v_total_upd;
                                SELECT
                                    receipt_id,
                                    receipt_number,
                                    party_name,
                                    deposit_date,
                                    receipt_date,
                                    cust_account_id,
                                    organization_id,
                                    metodo_recibo
                                INTO
                                    v_receipt_id,
                                    v_receipt_number,
                                    v_customer_name,
                                    v_application_date,
                                    v_accounting_date,
                                    v_cust_account_id,
                                    v_organization_id,
                                    v_metodo_recibo
                                FROM
                                    xxer_ar_receipt_tbl
                                WHERE
                                    1 = 1
                                    AND tabla_puente_id = reg.tabla_puente_id;

                                v_receipt_apply_type.extend;
                                v_error_location := 'Inserta valores en XXER_AR_APPLY_RECEIPT_TYPE';
                                v_receipt_apply_type(v_receipt_apply_type.count) := xxer_ar_apply_receipt_type(upd_cur.amount,v_receipt_id,v_receipt_number,upd_cur
.trx_number,v_customer_name,v_application_date,v_accounting_date,v_cust_account_id,v_organization_id,v_metodo_recibo,upd_cur.receipt_apply_id
);

                            END IF;
                        END LOOP;
                    END IF;

                END IF;

            ELSE
                UPDATE xxer_tbl_puente_header
                SET
                    estatus = reg.estatus,
                    last_update_date = SYSDATE,
                    last_updated_by = 1
                WHERE
                    tabla_puente_id = reg.tabla_puente_id;

            END IF;
      --   aaaa 

        END LOOP;

        p_reg_apply_receipt := v_receipt_apply_type;
        v_error_location := 'Termina Procedimiento PROCESSED_RECEIPT';
        dbms_output.put_line('Termina PROCESSED_RECEIPT');
    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_UTILITIES_PKG.PROCESSED_RECEIPT'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);

    END processed_receipt;

 /**
 * Procedimiento utilizado para llevar el registro de los Recibos Aplicados Procesados
 *
 * @param P_REG_APPLY_RECEIPT Información procesada de aplicar recibos
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */

    PROCEDURE processed_apply_receipt (
        p_reg_apply_receipt   IN xxer_ar_proc_app_rec_ttype,
        p_error               OUT NUMBER,
        p_error_desc          OUT VARCHAR2
    ) AS
        v_tabla_puente_id   xxer_ar_receipt_apply_tbl.tabla_puente_id%TYPE;
        v_estatus           xxer_ar_receipt_tbl.estatus%TYPE;
    BEGIN
        v_error_location := 'Inicia Procedimiento PROCESSED_APPLY_RECEIPT';
        FOR reg IN (
            SELECT
                rg.*
            FROM
                TABLE ( p_reg_apply_receipt ) rg
        ) LOOP
            BEGIN
                v_error_location := 'Actualiza registros de Apply Receipt que ya fueron procesados';
                v_error_location := 'RECEIPT_APPLY_ID: ' || reg.receipt_apply_id;
                UPDATE xxer_ar_receipt_apply_tbl
                SET
                    estatus = reg.estatus,
                    error_description = reg.errordescripcion,
                    last_updated_by = 'SOA_ADMIN',
                    last_update_date = SYSDATE,
                    object_version_number = object_version_number + 1
                WHERE
                    receipt_apply_id = reg.receipt_apply_id;

            END;
        END LOOP;

        v_error_location := 'Se inicia bloque para cerrar recibos de XXER_TBL_PUENTE_HEADER';
        FOR reg IN (
            SELECT
                rg.*
            FROM
                TABLE ( p_reg_apply_receipt ) rg
        ) LOOP
            BEGIN
                v_error_location := 'Se obtiene el valor de TABLA_PUENTE_ID';
                SELECT
                    tabla_puente_id
                INTO v_tabla_puente_id
                FROM
                    xxer_ar_receipt_apply_tbl
                WHERE
                    1 = 1
                    AND receipt_apply_id = reg.receipt_apply_id
                    AND ROWNUM = 1;

                v_error_location := 'Se obtiene el Estatus de la transacción';
                SELECT
                    nvl(estatus,'x')
                INTO v_estatus
                FROM
                    xxer_ar_receipt_tbl
                WHERE
                    1 = 1
                    AND tabla_puente_id = v_tabla_puente_id
                    AND ROWNUM = 1;

                v_error_location := 'Actualliza Registro de la tabla XXER_TBL_PUENTE_HEADER';
                IF
                    v_estatus <> 'x'
                THEN
                    UPDATE xxer_tbl_puente_header
                    SET
                        estatus = v_estatus,
                        last_update_date = SYSDATE,
                        last_updated_by = 1
                    WHERE
                        tabla_puente_id = v_tabla_puente_id;

                END IF;

            END;
        END LOOP;

    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_UTILITIES_PKG.PROCESSED_APPLY_RECEIPT '
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);

    END processed_apply_receipt;                             

   /**
 * Procedimiento utilizado para obtener facturas
 *
 * @param P_INFORMATION Información de data model requerida para el procesamiento
 * @param P_INVOICES regresa objeto TYPE de facturas
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */

    PROCEDURE get_invoices (
        p_information   IN xxer_ar_receipt_invoice_ttype,
        p_doc_type      IN VARCHAR2,
        p_invoices      OUT xxer_ar_get_inv_tb_typ,
        p_error         OUT NUMBER,
        p_error_desc    OUT VARCHAR2
    ) AS

        collection_invoices      xxer_ar_get_inv_tb_typ := xxer_ar_get_inv_tb_typ ();
        v_rfc_previous           xxer_ar_invoices_v.rfc%TYPE;
        v_acc_num_previous       VARCHAR2(50);
        v_par_sit_num_previous   VARCHAR2(50);
        v_bu_previous            VARCHAR2(150);
        v_payment_terms          VARCHAR2(500);
        v_flag_equal_rfc         BOOLEAN := false;
        v_invoices_not_derived   VARCHAR2(4000) := '';
        v_error_msg              VARCHAR2(255);
        v_error_location         VARCHAR2(255);
        CURSOR cur_get_client_bu (
            p_tab_puent_id NUMBER
        ) IS SELECT
            headers.rfc_destino,
            headers.tipo_documento,
            config.unidad_operativa
             FROM
            xxer_tbl_puente_header headers,
            xxer_cnf_interfase_ingresos_ar config
             WHERE
            1 = 1
            AND nvl(config.sistema_origen,1) = nvl(headers.sistema_origen,1)
            AND nvl(config.tipo_documento,1) = nvl(headers.tipo_documento,1)
            AND nvl(config.tipo_movimiento,1) = nvl(headers.tipo_movimiento,1)
            AND DECODE(nvl(config.sistema_origen,1),'NOMINA',nvl(headers.rfc_origen,1),nvl(config.rfc_origen,1) ) = nvl(headers.rfc_origen,1)
            AND DECODE(nvl(config.sucursal_venta,1),'TODOS',nvl(headers.sucursal_venta,1),nvl(config.sucursal_venta,1) ) = nvl(headers.sucursal_venta
,1)
            AND nvl(config.adicional1,1) = nvl(headers.adicional1,1)
            AND nvl(config.adicional3,1) = nvl(headers.adicional3,1)
            AND nvl(config.adicional4,1) = nvl(headers.adicional4,1)
            AND nvl(config.adicional5,1) = nvl(headers.adicional5,1)
            AND nvl(config.adicional6,1) = nvl(headers.adicional6,1)
            AND nvl(config.adicional7,1) = nvl(headers.adicional7,1)
            AND nvl(config.adicional8,1) = nvl(headers.adicional8,1)
            AND nvl(config.adicional9,1) = nvl(headers.adicional9,1)
            AND nvl(config.adicional10,1) = nvl(headers.adicional10,1)
            AND headers.sistema_origen NOT IN (
                'EAM',
                'INV',
                'PORTAL'
            )
   -- AND
     --   HEADERS.tipo_documento NOT IN (
     --       'RECIBO','REVERSO RECIBO'
            AND headers.tipo_documento = p_doc_type
     --   )
            AND nvl(upper(headers.estatus),'P') NOT IN (
                'S',
                'E',
                'N'
            )
            AND headers.tabla_puente_id = p_tab_puent_id
             GROUP BY
            headers.rfc_destino,
            headers.tipo_documento,
            config.unidad_operativa;

    BEGIN
        v_error_location := 'Error to set value to COLLECTION_INVOICES variable.';
        SELECT
            xxer_ar_get_inv_typ(invoices."RFC",invoices."Business_Unit_Name",invoices."Trans_Batch_Source_Name",invoices."Transaction_Type_Name"
,invoices."Payment_Terms",invoices."Transaction_Date",invoices."Accounting_Date",invoices."Transaction_Number",invoices."Orig_Sys_Bill_to_Cst_Ref"
,invoices."Orig_Sys_Bill_to_Cst_Ad_Ref",invoices."Orig_Sys_Bill_to_Cst_Co_Ref",invoices."Orig_Sys_Ship_to_Cst_Ref",invoices."Orig_Sys_Ship_to_Cst_Ad_Ref"
,invoices."Orig_Sys_Ship_to_Cst_Co_Ref",invoices."Orig_Sys_Shp_to_Cst_Acc_Ref",invoices."Ori_Sys_Shp_to_Cst_Ac_Ad_Ref",invoices."Ori_Sys_Shp_to_Cst_Ac_Co_Rf"
,invoices."Orig_Sys_Sold_to_Cst_Ref",invoices."Orig_Sys_Sold_to_Cst_Acc_Rf",invoices."Bill_to_Cust_Account_Nmbr",invoices."Bill_to_Customer_Site_Nmbr"
,invoices."Bill_to_Contact_Party_Nmbr",invoices."Ship_to_Cust_Account_Nmbr",invoices."Ship_to_Customer_Site_Nmbr",invoices."Ship_to_Contact_Party_Nmbr"
,invoices."Sold_to_Cust_Account_Nmbr",invoices."Transaction_Line_Type",invoices."Transaction_Line_Desc",invoices."Currency_Code",
invoices."Currency_Conversion_Type",invoices."Currency_Conversion_Date",invoices."Currency_Conversion_Rate",invoices."Transaction_Line_Amount"
,invoices."Transaction_Line_Quantity",invoices."Customer_Ordered_Quantity",invoices."Unit_Selling_Price",invoices."Unit_Standard_Price"
,invoices."Line_Trans_Flxfld_Context",invoices."Line_Trans_Flxfld_Sgmnt_1",invoices."Line_Trans_Flxfld_Sgmnt_2",invoices."Line_Trans_Flxfld_Sgmnt_3"
,invoices."Line_Trans_Flxfld_Sgmnt_4",invoices."Line_Trans_Flxfld_Sgmnt_5",invoices."Line_Trans_Flxfld_Sgmnt_6",invoices."Line_Trans_Flxfld_Sgmnt_7"
,invoices."Line_Trans_Flxfld_Sgmnt_8",invoices."Line_Trans_Flxfld_Sgmnt_9",invoices."Line_Trans_Flxfld_Sgmnt_10",invoices."Line_Trans_Flxfld_Sgmnt_11"
,invoices."Line_Trans_Flxfld_Sgmnt_12",invoices."Line_Trans_Flxfld_Sgmnt_13",invoices."Line_Trans_Flxfld_Sgmnt_14",invoices."Line_Trans_Flxfld_Sgmnt_15"
,invoices."Primary_Salesperson_Number",invoices."Tax_Classification_Code",invoices."Legal_Entity_Identifier",invoices."Accd_Amount_in_Led_Crrncy"
,invoices."Sales_Order_Number",invoices."Sales_Order_Date",invoices."Actual_Ship_Date",invoices."Warehouse_Code",invoices."Unit_of_Measure_Code"
,invoices."Unit_of_Measure_Name",invoices."Invoicing_Rule_Name",invoices."Reve_Scheduling_Rule_Name",invoices."Number_of_Revenue_Periods"
,invoices."Rev_Schdlng_Rule_Start_Date",invoices."Rev_Schdlng_Rule_End_Date",invoices."Reason_Code_Meaning",invoices."Last_Period_to_Credit"
,invoices."Trans_Biss_Category_Code",invoices."Prod_Fisc_Classifictn_Code",invoices."Product_Category_Code",invoices."Product_Type"
,invoices."Line_Intended_Use_Code",invoices."Assessable_Value",invoices."Document_Sub_Type",invoices."Default_Taxation_Country",invoices
."User_Defnd_Fisc_Classifictn",invoices."Tax_Invoice_Number",invoices."Tax_Invoice_Date",invoices."Tax_Regime_Code",invoices."Tax"
,invoices."Tax_Status_Code",invoices."Tax_Rate_Code",invoices."Tax_Jurisdiction_Code",invoices."First_Party_Registratn_Nmbr",invoices
."Third_Party_Registratn_Nmbr",invoices."Final_Discharge_Location",invoices."Taxable_Amount",invoices."Taxable_Flag",invoices."Tax_Exemption_Flag"
,invoices."Tax_Exemption_Reason_Code",invoices."Tax_Exemptn_Rson_Code_Mng",invoices."Tax_Exemptn_Certifict_Nmbr",invoices."Line_Amount_Inclds_Tax_Flag"
,invoices."Tax_Precedence",invoices."Cr_Mt_2B_Us_4_Ls_Wt_Rv_Sc_Rs",invoices."Cr_Mt_2B_Us_4_Tr_Wt_Sp_Py_Tr",invoices."Reason_Code"
,invoices."Tax_Rate",invoices."FOB_Point",invoices."Carrier",invoices."Shipping_Reference",invoices."Sales_Order_Line_Number",invoices
."Sales_Order_Source",invoices."Sales_Order_Revision_Number",invoices."Purchase_Order_Number",invoices."Purchase_Order_Revsn_Nmbr"
,invoices."Purchase_Order_Date",invoices."Agreement_Name",invoices."Memo_Line_Name",invoices."Document_Number",invoices."Original_System_Batch_Name"
,invoices."Link_to_Trans_Flxfld_Cntxt",invoices."Lnk_to_Trans_Flxfld_Sgmnt_1",invoices."Lnk_to_Trans_Flxfld_Sgmnt_2",invoices."Lnk_to_Trans_Flxfld_Sgmnt_3"
,invoices."Lnk_to_Trans_Flxfld_Sgmnt_4",invoices."Lnk_to_Trans_Flxfld_Sgmnt_5",invoices."Lnk_to_Trans_Flxfld_Sgmnt_6",invoices."Lnk_to_Trans_Flxfld_Sgmnt_7"
,invoices."Lnk_to_Trans_Flxfld_Sgmnt_8",invoices."Lnk_to_Trans_Flxfld_Sgmnt_9",invoices."Lnk_to_Trans_Flxfld_Sgmnt_10",invoices."Lnk_to_Trans_Flxfld_Sgmnt_11"
,invoices."Lnk_to_Trans_Flxfld_Sgmnt_12",invoices."Lnk_to_Trans_Flxfld_Sgmnt_13",invoices."Lnk_to_Trans_Flxfld_Sgmnt_14",invoices
."Lnk_to_Trans_Flxfld_Sgmnt_15",invoices."Ref_Trans_Flxfld_Cntxt",invoices."Ref_Trans_Flxfld_Sgmnt_1",invoices."Ref_Trans_Flxfld_Sgmnt_2"
,invoices."Ref_Trans_Flxfld_Sgmnt_3",invoices."Ref_Trans_Flxfld_Sgmnt_4",invoices."Ref_Trans_Flxfld_Sgmnt_5",invoices."Ref_Trans_Flxfld_Sgmnt_6"
,invoices."Ref_Trans_Flxfld_Sgmnt_7",invoices."Ref_Trans_Flxfld_Sgmnt_8",invoices."Ref_Trans_Flxfld_Sgmnt_9",invoices."Ref_Trans_Flxfld_Sgmnt_10"
,invoices."Ref_Trans_Flxfld_Sgmnt_11",invoices."Ref_Trans_Flxfld_Sgmnt_12",invoices."Ref_Trans_Flxfld_Sgmnt_13",invoices."Ref_Trans_Flxfld_Sgmnt_14"
,invoices."Ref_Trans_Flxfld_Sgmnt_15",invoices."Lnk_To_Parent_Line_Context",invoices."Lnk_To_Parent_Line_Sgmnt_1",invoices."Lnk_To_Parent_Line_Sgmnt_2"
,invoices."Lnk_To_Parent_Line_Sgmnt_3",invoices."Lnk_To_Parent_Line_Sgmnt_4",invoices."Lnk_To_Parent_Line_Sgmnt_5",invoices."Lnk_To_Parent_Line_Sgmnt_6"
,invoices."Lnk_To_Parent_Line_Sgmnt_7",invoices."Lnk_To_Parent_Line_Sgmnt_8",invoices."Lnk_To_Parent_Line_Sgmnt_9",invoices."Lnk_To_Parent_Line_Sgmnt_10"
,invoices."Lnk_To_Parent_Line_Sgmnt_11",invoices."Lnk_To_Parent_Line_Sgmnt_12",invoices."Lnk_To_Parent_Line_Sgmnt_13",invoices."Lnk_To_Parent_Line_Sgmnt_14"
,invoices."Lnk_To_Parent_Line_Sgmnt_15",invoices."Receipt_Method_Name",invoices."Printing_Option",invoices."Related_Batch_Source_Name"
,invoices."Related_Transaction_Number",invoices."Inventory_Item_Number",invoices."Inventory_Item_Segment_2",invoices."Inventory_Item_Segment_3"
,invoices."Inventory_Item_Segment_4",invoices."Inventory_Item_Segment_5",invoices."Inventory_Item_Segment_6",invoices."Inventory_Item_Segment_7"
,invoices."Inventory_Item_Segment_8",invoices."Inventory_Item_Segment_9",invoices."Inventory_Item_Segment_10",invoices."Inventory_Item_Segment_11"
,invoices."Inventory_Item_Segment_12",invoices."Inventory_Item_Segment_13",invoices."Inventory_Item_Segment_14",invoices."Inventory_Item_Segment_15"
,invoices."Inventory_Item_Segment_16",invoices."Inventory_Item_Segment_17",invoices."Inventory_Item_Segment_18",invoices."Inventory_Item_Segment_19"
,invoices."Inventory_Item_Segment_20",invoices."Bill_To_Cust_Bank_Acc_Name",invoices."Reset_Transaction_Date_Flag",invoices."Payment_Server_Order_Number"
,invoices."Last_Trans_on_Debit_Autztn",invoices."Approval_Code",invoices."Address_Verification_Code",invoices."Trans_Line_Translated_Desc"
,invoices."Consolidated_Billing_Number",invoices."Promised_Commitment_Amount",invoices."Payment_Set_Identifier",invoices."Original_Accounting_Date"
,invoices."Invoiced_Line_Acc_Level",invoices."Override_AutoAccounting_Flag",invoices."Historical_Flag",invoices."Deferral_Exclusion_Flag"
,invoices."Payment_Attributes",invoices."Invoice_Billing_Date",invoices."Invoice_Lines_Flxfld_Cntxt",invoices."Invoice_Lns_Flxfld_Sgmnt_1"
,invoices."Invoice_Lns_Flxfld_Sgmnt_2",invoices."Invoice_Lns_Flxfld_Sgmnt_3",invoices."Invoice_Lns_Flxfld_Sgmnt_4",invoices."Invoice_Lns_Flxfld_Sgmnt_5"
,invoices."Invoice_Lns_Flxfld_Sgmnt_6",invoices."Invoice_Lns_Flxfld_Sgmnt_7",invoices."Invoice_Lns_Flxfld_Sgmnt_8",invoices."Invoice_Lns_Flxfld_Sgmnt_9"
,invoices."Invoice_Lns_Flxfld_Sgmnt_10",invoices."Invoice_Lns_Flxfld_Sgmnt_11",invoices."Invoice_Lns_Flxfld_Sgmnt_12",invoices."Invoice_Lns_Flxfld_Sgmnt_13"
,invoices."Invoice_Lns_Flxfld_Sgmnt_14",invoices."Invoice_Lns_Flxfld_Sgmnt_15",invoices."Invoice_Trans_Flxfld_Cntxt",invoices."Inv_Trans_Flxfld_Sgmnt_1"
,invoices."Inv_Trans_Flxfld_Sgmnt_2",invoices."Inv_Trans_Flxfld_Sgmnt_3",invoices."Inv_Trans_Flxfld_Sgmnt_4",invoices."Inv_Trans_Flxfld_Sgmnt_5"
,invoices."Inv_Trans_Flxfld_Sgmnt_6",invoices."Inv_Trans_Flxfld_Sgmnt_7",invoices."Inv_Trans_Flxfld_Sgmnt_8",invoices."Inv_Trans_Flxfld_Sgmnt_9"
,invoices."Inv_Trans_Flxfld_Sgmnt_10",invoices."Inv_Trans_Flxfld_Sgmnt_11",invoices."Inv_Trans_Flxfld_Sgmnt_12",invoices."Inv_Trans_Flxfld_Sgmnt_13"
,invoices."Inv_Trans_Flxfld_Sgmnt_14",invoices."Inv_Trans_Flxfld_Sgmnt_15",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Cntxt",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_1"
,invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_2",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_3",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_4",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_5"
,invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_6",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_7",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_8",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_9"
,invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_10",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_11",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_12",invoices
."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_13",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_14",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_15",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_16"
,invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_17",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_18",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_19",invoices
."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_20",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_21",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_22",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_23"
,invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_24",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_25",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_26",invoices
."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_27",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_28",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_29",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_30"
,invoices."Ln_Glb_Dsc_Flxfld_Attr_Cat",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_2",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_3"
,invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_4",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_5",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_6",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_7"
,invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_8",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_9",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_10",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_11"
,invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_12",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_13",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_14",invoices
."Ln_Glb_Dsc_Flxfld_Sgmnt_1_15",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_16",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_17",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_18"
,invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_19",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_20",invoices."Comments",invoices."Notes_from_Source"
,invoices."Enforce_Chronlgcl_Doc_Seqng",invoices.organization_id)
        BULK COLLECT
        INTO collection_invoices
        FROM
            xxer_ar_invoices_v invoices;

        dbms_output.put_line('Tamaño de la variable COLLECTION_INVOICES: ' || collection_invoices.count);

  /*Se evalua nularidad de tipo Data Model*/
        IF
            ( p_information.count > 0 )
        THEN
            dbms_output.put_line('Tamaño del parametro P_INFORMATION: ' || p_information.count);
            FOR h IN 1..p_information.count LOOP
                dbms_output.put_line('RFCs de DM: ' || p_information(h).rfc);
            END LOOP;



  /*Se evalua nularidad de tipo On premise*/

            IF
                ( collection_invoices.count > 0 )
            THEN
                FOR i IN 1..collection_invoices.count LOOP
                    FOR j IN 1..p_information.count LOOP


              --DBMS_OUTPUT.PUT_LINE('Se comienza a evaluar si estan llenas las variables provisionales');
            /*If para evaluar que no esten vacías las variables de RFC_prvious,acc_num_previous,par_sit_num_prvious y V_BU_PREVIOUS*/
                        IF
                            ( ( v_acc_num_previous <> NULL ) AND ( v_par_sit_num_previous <> NULL ) AND ( v_rfc_previous <> NULL ) )
                        THEN              


              /*Se reinicia bandera para salir de loop interno*/
                            v_flag_equal_rfc := false;

              /*IF para evaluar si el RFC actual del On Premise y el Business_Unit_Name son igual a la variable V_RFC_PREVIOUS
              y a V_BU_PREVIOUS respectivamente
                si es así entonces se asignan los datos derivados,y si no se continua con la iteracion de 
                los datos del data model para que se compare con otro rfc de otro registro*/
                            IF
                                ( ( collection_invoices(i).rfc = v_rfc_previous ) AND ( collection_invoices(i).business_unit_name = v_bu_previous ) )
                            THEN
                                v_error_location := 'Error to set derived values from (previuous variables)';

                   /*Se establecen los datos de las variables al los registros de On premise */
                                collection_invoices(i).bill_to_cust_account_nmbr := v_acc_num_previous;
                                collection_invoices(i).bill_to_customer_site_nmbr := v_par_sit_num_previous; 

                  -- si es nota de credito no lleva terminos de pago
                                IF
                                    collection_invoices(i).transaction_type_name NOT LIKE 'NOTA%'
                                THEN
                                    collection_invoices(i).payment_terms := v_payment_terms;
                                ELSE
                                    collection_invoices(i).payment_terms := NULL;
                                END IF;

                   -->
                   --COLLECTION_INVOICES(i).TRANSACTION_NUMBER := CONCAT(COLLECTION_INVOICES(i).TRANSACTION_NUMBER,'Z');  

                   /*Se remplazan los valores derivados del RFC ya que se hacen pruebas,terminando pruebas dejar 
                     los del RFC*/
                   --COLLECTION_INVOICES(i).BILL_TO_CUSTOMER_ACCOUNT_NUMBER := '17405';             
                   --COLLECTION_INVOICES(i).BILL_TO_CUSTOMER_SITE_NUMBER := '16009';   

                                v_flag_equal_rfc := true;
                            ELSE

                        /*IF para comparar los RFCs  y Bu de datamodel y de On Premise*/
                       -- DBMS_OUTPUT.PUT_LINE('Datos en comparación en primer else: RFC: ' || P_INFORMATION(j).RFC || ',BU: ' || P_INFORMATION(j).BU_NAME);
                                IF
                                    ( ( collection_invoices(i).rfc = p_information(j).rfc ) AND ( collection_invoices(i).business_unit_name = p_information(j).bu_name ) )
                                THEN
                                    v_error_location := 'Error to set derived values from (Parameter)';

                            /*Se establecen los datos del Data Model al los registros de On premise */
                                    collection_invoices(i).bill_to_cust_account_nmbr := p_information(j).account_number;
                                    collection_invoices(i).bill_to_customer_site_nmbr := p_information(j).party_site_number;

                           --  COLLECTION_INVOICES(i).PAYMENT_TERMS := P_INFORMATION(j).PAYMENT_TERMS;

                                 -- si es nota de credito no lleva terminos de pago
                                    IF
                                        collection_invoices(i).transaction_type_name NOT LIKE 'NOTA%'
                                    THEN
                                        collection_invoices(i).payment_terms := p_information(j).payment_terms;
                                    ELSE
                                        collection_invoices(i).payment_terms := NULL;
                                    END IF;

                             -->
                             --COLLECTION_INVOICES(i).TRANSACTION_NUMBER := CONCAT(COLLECTION_INVOICES(i).TRANSACTION_NUMBER,'Z');                             

                            /*Se remplazan los valores derivados del RFC ya que se hacen pruebas,terminando pruebas dejar 
                              los del RFC*/
                             --COLLECTION_INVOICES(i).BILL_TO_CUSTOMER_ACCOUNT_NUMBER := '17405';             
                             --COLLECTION_INVOICES(i).BILL_TO_CUSTOMER_SITE_NUMBER := '16009';  

                                    v_rfc_previous := p_information(j).rfc;
                                    v_acc_num_previous := p_information(j).account_number;
                                    v_par_sit_num_previous := p_information(j).party_site_number;
                                    v_payment_terms := p_information(j).payment_terms;
                                    v_bu_previous := p_information(j).bu_name;

                             --V_ACC_NUM_PREVIOUS     := '17405';
                             --V_PAR_SIT_NUM_PREVIOUS := '16009'; 
                                    v_flag_equal_rfc := true;
                                END IF;

                                EXIT WHEN v_flag_equal_rfc = true;
                            END IF; --fin if que compara igualdad de RFC con variable  V_RFC_PREVIOUS

                        ELSE-- else de if que evalua nularidad de variables previos
                        /*Se reinicia bandera para salir de loop interno*/
                            v_flag_equal_rfc := false;

                        /*IF para comparar los RFCs  y Bu de datamodel y de On Premise*/
                           -- DBMS_OUTPUT.PUT_LINE('Datos en comparación en segundo else : RFC: ' || P_INFORMATION(j).RFC || ',BU: ' || P_INFORMATION(j).BU_NAME);                                                                
                           -- DBMS_OUTPUT.PUT_LINE('RFC collection: ' || COLLECTION_INVOICES(i).RFC || '  RFC p_information: ' || P_INFORMATION(j).RFC || '   BU coll: ' || COLLECTION_INVOICES(i).Business_Unit_Name || '  BU info: ' || P_INFORMATION(j).BU_NAME );                            
                           -- DBMS_OUTPUT.PUT_LINE('');
                            IF
                                ( ( collection_invoices(i).rfc = p_information(j).rfc ) AND ( collection_invoices(i).business_unit_name = p_information(j).bu_name ) )
                            THEN
                                v_error_location := 'Error to set derived values from (Parameter)';

                            /*Se establecen los datos del Data Model al los registros de On premise */
                                collection_invoices(i).bill_to_cust_account_nmbr := p_information(j).account_number;
                                collection_invoices(i).bill_to_customer_site_nmbr := p_information(j).party_site_number;

               --              COLLECTION_INVOICES(i).PAYMENT_TERMS := P_INFORMATION(j).PAYMENT_TERMS;

                  -- si es nota de credito no lleva terminos de pago
                                IF
                                    collection_invoices(i).transaction_type_name NOT LIKE 'NOTA%'
                                THEN
                                    collection_invoices(i).payment_terms := p_information(j).payment_terms;
                                ELSE
                                    collection_invoices(i).payment_terms := NULL;
                                END IF;



                             -->
                             --COLLECTION_INVOICES(i).TRANSACTION_NUMBER := CONCAT(COLLECTION_INVOICES(i).TRANSACTION_NUMBER,'Z');                             

                            /*Se remplazan los valores derivados del RFC ya que se hacen pruebas,terminando pruebas dejar 
                              los del RFC*/
                             --COLLECTION_INVOICES(i).BILL_TO_CUSTOMER_ACCOUNT_NUMBER := '17405';             
                             --COLLECTION_INVOICES(i).BILL_TO_CUSTOMER_SITE_NUMBER := '16009';

                                v_rfc_previous := p_information(j).rfc;
                                v_acc_num_previous := p_information(j).account_number;
                                v_par_sit_num_previous := p_information(j).party_site_number;
                                v_payment_terms := p_information(j).payment_terms;
                                v_bu_previous := p_information(j).bu_name;

                            -- V_ACC_NUM_PREVIOUS     := '17405';
                            -- V_PAR_SIT_NUM_PREVIOUS := '16009';
                                v_flag_equal_rfc := true;
                            ELSE                        

                             /*If que evalua si el registro de valores de datamodel es el último,sí es así entonces
                               el registro de facturas no pudo ser derivado por lo tanto no debería enviarse al ERP-Cloud
                               Entonces se agrega a los mensajes de error y se elimina el registro de la lista de 
                               factura para mandar a cargar.*/
                                IF
                                    ( j = p_information.count )
                                THEN

                                /*Se agrega la factura que no pudo derivarse a los mensajes de error*/
                                    v_invoices_not_derived := v_invoices_not_derived
                                                              || ','
                                                              || collection_invoices(i).transaction_number;

                                     /*Se elimina el registro de la lista de facturas ya que no pudo derivarse*/
                                    collection_invoices.DELETE(i);
                                END IF;
                            END IF;

                            EXIT WHEN v_flag_equal_rfc = true;
                        END IF; --fin if que evalua nularidad de variables         
                    END LOOP;
                END LOOP;
            END IF;--Fin de if que evalua nularidad de tipo On Premise

        END IF;--Fin de if que evalua nularidad de tipo Data Model

        p_invoices := collection_invoices;
  --P_ERROR_DESC := V_INVOICES_NOT_DERIVED;
    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_UTILITIES_PKG.GET_INVOICES'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);

    END get_invoices;


/**
 * Procedire utilizado para actulizar batch de gl
 *
 * @param P_SOURCE Información de source para la consulta
 * @param P_STATUS Información del estatus para la consulta
 * @param P_BATCH_ID Información del batch para la consulta
 * @param P_JOURNALS regresa objeto TYPE de pólizas
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */

    PROCEDURE update_journals_tms (
        p_source       IN VARCHAR2,
        p_status       IN VARCHAR2,
        p_batch_id     IN VARCHAR2,
        p_error        OUT NUMBER,
        p_error_desc   OUT VARCHAR2
    )
        AS
    BEGIN
        v_error_location := 'Llama al PROCEDIMIENTO MERGE_JOURNALS';
              DBMS_OUTPUT.PUT_LINE('-------MAPEO CUENTAS TABLA GL------');     

        XER_MAPEO_CC_PRC2();
                      DBMS_OUTPUT.PUT_LINE('-------FIN MAPEO CUENTAS TABLA GL------');     


   DBMS_OUTPUT.PUT_LINE('-------insertando tabla control------');     
        INSERT INTO xxer_gl_interface_ctrl (
    "ID",
    "ACCOUNTING_DATE",
    "STATUS",
    "USER_JE_SOURCE_NAME",
    "GROUP_ID",
    "DATE_CREATED",
    "PROCCESS_DATE",
    "JE_BATCH_ID",
    "ENTERED_DR",
    "RECORDS"
)
    SELECT
        NULL,
        accounting_date,
        status,
        user_je_source_name,
        group_id,
        trunc(date_created),
        sysdate,
        nvl((
        SELECT
            glc.je_batch_id
        FROM
            xxer_gl_interface_ctrl glc
        WHERE
                trunc(glc.accounting_date) = gl.accounting_date
            AND glc.group_id = gl.group_id
			AND glc.je_batch_id!=p_batch_id
            AND status = p_status
            AND reprocess='N'
            AND user_je_source_name = p_source
            AND ROWNUM = 1
    ),
                      p_batch_id),
        SUM(entered_dr),
        COUNT(*)
    FROM
        xxer_gl_interface gl
    WHERE
            1 = 1
        AND je_batch_id is NULL
        AND status = p_status
        AND user_je_source_name = p_source
    GROUP BY
        accounting_date,
        je_batch_id,
        trunc(date_created),
        group_id,
        status,
        user_je_source_name
    ORDER BY
        accounting_date;        
   
     DBMS_OUTPUT.PUT_LINE('-------FIN insertando tabla control------');     
      DBMS_OUTPUT.PUT_LINE('-------actualizando GL------');     

UPDATE xxer_gl_interface gl
SET
    je_batch_id = nvl((
        SELECT
            glc.je_batch_id
        FROM
            xxer_gl_interface_ctrl glc
        WHERE
            trunc(glc.accounting_date) = gl.accounting_date
            AND glc.group_id = gl.group_id
            AND glc.je_batch_id!=p_batch_id
            AND status = p_status
            AND reprocess='N'
            AND user_je_source_name = p_source
            AND ROWNUM = 1
    ),
                      p_batch_id)
WHERE
    je_batch_id IS NULL
    AND status = p_status
    AND user_je_source_name = p_source;


      DBMS_OUTPUT.PUT_LINE('-------FIN actualizando GL------');     

    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_UTILITIES_PKG.MERGE_JOURNALS'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);
                                        
    END update_journals_tms;

  /**
 * Funcion utilizado para obtener pólizas viajado gl y actulizar batch_id
 *
 * @param P_SOURCE Información de source para la consulta
 * @param P_STATUS Información del estatus para la consulta
 * @param P_BATCH_ID Información del batch para la consulta
 * @param P_JOURNALS regresa objeto TYPE de pólizas
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */

    FUNCTION merge_journals_tms (
        p_source     IN VARCHAR2,
        p_status     IN VARCHAR2,
        p_batch_id   IN VARCHAR2
    ) RETURN xxer_gl_interface_type_t AS

        t_gl_interface   xxer_gl_interface_type_t := xxer_gl_interface_type_t ();
        CURSOR c_gl_journals IS SELECT
            reference4,
            status,
            ledger_id,
            accounting_date,
            user_je_source_name,
            user_je_category_name,
            currency_code,
            date_created,
            actual_flag,
            segment1,
            segment2,
            segment3,
            segment4,
            segment5,
            segment6,
            segment7,
            segment8,
            segment9,
            segment10,
            segment11,
            segment12,
            segment13,
            segment14,
            segment15,
            segment16,
            segment17,
            segment18,
            segment19,
            segment20,
            segment21,
            segment22,
            segment23,
            segment24,
            segment25,
            segment26,
            segment27,
            segment28,
            segment29,
            segment30,
            SUM(entered_dr) entered_dr,
            SUM(entered_cr) entered_cr,
            SUM(accounted_dr) accounted_dr,
            SUM(accounted_cr) accounted_cr,
            user_currency_conversion_type,
            currency_conversion_date,
            currency_conversion_rate,
            average_journal_flag,
            group_id
                                FROM
            --xxer_gl_interface_v
            XXER_GL_INTERFACE
                                WHERE
            status = p_status
            AND je_batch_id = p_batch_id
            AND user_je_source_name = p_source
                                GROUP BY
            reference4,
            status,
            ledger_id,
            accounting_date,
            user_je_source_name,
            user_je_category_name,
            currency_code,
            date_created,
            actual_flag,
            segment1,
            segment2,
            segment3,
            segment4,
            segment5,
            segment6,
            segment7,
            segment8,
            segment9,
            segment10,
            segment11,
            segment12,
            segment13,
            segment14,
            segment15,
            segment16,
            segment17,
            segment18,
            segment19,
            segment20,
            segment21,
            segment22,
            segment23,
            segment24,
            segment25,
            segment26,
            segment27,
            segment28,
            segment29,
            segment30,
            user_currency_conversion_type,
            currency_conversion_date,
            currency_conversion_rate,
            average_journal_flag,
            group_id
        ORDER BY
            reference4;

    BEGIN
        FOR c_gl IN c_gl_journals LOOP
            t_gl_interface.extend;
            t_gl_interface(t_gl_interface.last) := xxer_gl_interface_type(c_gl.status,c_gl.ledger_id,c_gl.accounting_date,c_gl.currency_code,c_gl
.date_created,NULL,c_gl.actual_flag,c_gl.user_je_category_name,c_gl.user_je_source_name,c_gl.currency_conversion_date,NULL,NULL,c_gl
.user_currency_conversion_type,c_gl.currency_conversion_rate,c_gl.average_journal_flag,NULL,c_gl.segment1,c_gl.segment2,c_gl.segment3
,c_gl.segment4,c_gl.segment5,c_gl.segment6,c_gl.segment7,c_gl.segment8,c_gl.segment9,c_gl.segment10,c_gl.segment11,c_gl.segment12
,c_gl.segment13,c_gl.segment14,c_gl.segment15,c_gl.segment16,c_gl.segment17,c_gl.segment18,c_gl.segment19,c_gl.segment20,c_gl.segment21
,c_gl.segment22,c_gl.segment23,c_gl.segment24,c_gl.segment25,c_gl.segment26,c_gl.segment27,c_gl.segment28,c_gl.segment29,c_gl.segment30
,c_gl.entered_dr,c_gl.entered_cr,c_gl.accounted_dr,c_gl.accounted_cr,NULL,NULL,NULL,NULL,c_gl.reference4,NULL,NULL,NULL,NULL,NULL
,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
,NULL,NULL,NULL,NULL,NULL,NULL,c_gl.group_id,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

        END LOOP;

        RETURN t_gl_interface;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN t_gl_interface;
            dbms_output.put_line('Error en:' || sqlerrm);
    END merge_journals_tms;


/**
 * Procedimiento utilizado para cambiar el estado de las facturas a "P" para
 * indicar que serán los datos que estan en proceso
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error 
 */

    PROCEDURE prepare_process_load_invoices (
        p_doc_type     IN VARCHAR2,
        p_error        OUT NUMBER,
        p_error_desc   OUT VARCHAR2
    ) AS

        v_processing       xxer_tbl_puente_header.estatus%TYPE := 'P';
        v_factura          VARCHAR2(10) := 'FACTURA';
        v_error_msg        VARCHAR2(300) := NULL;
        v_error_location   VARCHAR2(255);
        v_batch_id         VARCHAR2(300);-----variable del batch_id  jgr10052018
        
        CURSOR cur_all_invoices_to_work IS SELECT DISTINCT
           "Line_Trans_Flxfld_Sgmnt_2",
            "Transaction_Number",
            v_batch_id AS "Line_Transactions_Flexfield_Segment_1"
  FROM
            xxer_ar_invoices_v ; 

    BEGIN
        v_batch_id := TO_CHAR(xxer_invoice_batch_id_seq.nextval);---obtencion del batch_id jgr10052018
        FOR rec IN cur_all_invoices_to_work LOOP
            IF
                ( ( rec."Line_Trans_Flxfld_Sgmnt_2" IS NOT NULL ) AND ( rec."Transaction_Number" IS NOT NULL ) )
            THEN
                v_error_location := 'Error to update status invoices to (P)';

      /*Se actualizan los registros de la tabla header para ponerlos en estado processing y se les agrega el batch_id*/
                UPDATE xxer_tbl_puente_header
                SET
                    estatus = v_processing,
                    adicional2 = rec."Line_Transactions_Flexfield_Segment_1"  ----asignacion batch_id jgr100518
                WHERE
                    tabla_puente_id = rec."Line_Trans_Flxfld_Sgmnt_2"
                    AND numero_documento = rec."Transaction_Number"; 
        --null;

            END IF;
        END LOOP;

        v_error_location := 'Error to apply COMMIT';
        COMMIT;/*Se confirma la actualización de los datos*/
    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_AR_UTILITIES_PKG.PREPARE_PROCESS_LOAD_INVOICES'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);

    END prepare_process_load_invoices;
    
      --VALIDATION_LINES_INVOICE_CONFIG
      
PROCEDURE validation_lines_invoice_config(
        p_validation_inv_lines     OUT XXER_AR_VALIDATION_INVOICE_TTYPE,
        p_error        OUT NUMBER,
        p_error_desc   OUT VARCHAR2
    ) AS
        
        
        
        col_val_lines_invoice XXER_AR_VALIDATION_INVOICE_TTYPE:=XXER_AR_VALIDATION_INVOICE_TTYPE();
        v_error_msg        VARCHAR2(300) := NULL;
        v_error_location   VARCHAR2(255);
        v_details_error    VARCHAR2(300);
        v_commit          NUMBER := 0;--contador para hacer commit
        
        
        CURSOR cur_all_invoicesLines_not_conf IS WITH
TXN AS (SELECT 
        H.NUMERO_DOCUMENTO,
        H.TABLA_PUENTE_ID, 
        TRUNC(H.FECHA_MOVIMIENTO) FECHA_MOVIMIENTO , 
        H.NOMBRE_FISCAL_ORIGEN , 
        H.SISTEMA_ORIGEN , 
        H.TIPO_DOCUMENTO , 
        H.TIPO_MOVIMIENTO , 
        H.SUCURSAL_VENTA , 
        L.ORIGEN_SERVICIO, 
        L.total, 
        L.DESTINO_SERVICIO , 
        L.no_linea, L.SERVICIO , 
        L.CONCEPTO_MODALIDAD , 
        L.FORMA_PAGO , 
        H.RFC_ORIGEN , 
        H.ADICIONAL1 , H.ADICIONAL3 , H.ADICIONAL4 , H.ADICIONAL5 , H.ADICIONAL6, H.ADICIONAL7 , H.ADICIONAL8 , H.ADICIONAL9 , H.ADICIONAL10
		FROM 
        XXER_TBL_PUENTE_HEADER H, 
        XXER_TBL_PUENTE_LINES L 
        WHERE  
        H.TABLA_PUENTE_ID = L.TABLA_PUENTE_ID 
        AND H.SISTEMA_ORIGEN NOT IN ('EAM', 'INV', 'PORTAL')
        AND H.TIPO_DOCUMENTO NOT IN ('RECIBO', 'REVERSO RECIBO') 
        AND ESTATUS IS NULL 
         AND TRUNC(H.FECHA_MOVIMIENTO) >= TO_DATE('13/05/2021','DD/MM/RRRR') 
        --and H.NUMERO_DOCUMENTO ='310720TLAEFEF'
        ) 
,CNF AS (SELECT * FROM XXER_CNF_INTERFASE_INGRESOS_AR)
SELECT
	CNF.ID_INTERFAZ
    ,TXN.no_linea
    ,TXN.total
    ,TXN.TABLA_PUENTE_ID
    ,TXN.NUMERO_DOCUMENTO
    ,TXN.FECHA_MOVIMIENTO
	,TXN.NOMBRE_FISCAL_ORIGEN
	,TXN.SISTEMA_ORIGEN
	,TXN.TIPO_DOCUMENTO
	,TXN.TIPO_MOVIMIENTO
	,TXN.SUCURSAL_VENTA
	,TXN.ORIGEN_SERVICIO
	,TXN.DESTINO_SERVICIO
	,TXN.SERVICIO
	,TXN.CONCEPTO_MODALIDAD
	,TXN.FORMA_PAGO
FROM TXN
    LEFT JOIN CNF ON NVL (TXN.SISTEMA_ORIGEN, 1) = NVL (CNF.SISTEMA_ORIGEN, 1)
         AND NVL (TXN.TIPO_DOCUMENTO, 1) = NVL (CNF.TIPO_DOCUMENTO, 1)
         AND NVL (TXN.TIPO_MOVIMIENTO, 1) = NVL (CNF.TIPO_MOVIMIENTO, 1)
         AND NVL (TXN.RFC_ORIGEN, 1) = DECODE (NVL (CNF.SISTEMA_ORIGEN, 1),'NOMINA', NVL (TXN.RFC_ORIGEN, 1),NVL (CNF.RFC_ORIGEN, 1))
         AND NVL (TXN.SUCURSAL_VENTA, 1) = DECODE (NVL (CNF.SUCURSAL_VENTA, 1),'TODOS', NVL (TXN.SUCURSAL_VENTA, 1),NVL (CNF.SUCURSAL_VENTA, 1))
         AND NVL (TXN.ORIGEN_SERVICIO, 1) = DECODE (NVL (CNF.ORIGEN_SERVICIO, 1),'TODOS', NVL (TXN.ORIGEN_SERVICIO, 1),NVL (CNF.ORIGEN_SERVICIO, 1))
         AND NVL (TXN.DESTINO_SERVICIO, 1) = DECODE (NVL (CNF.DESTINO_SERVICIO, 1),'TODOS', NVL (TXN.DESTINO_SERVICIO, 1),NVL (CNF.DESTINO_SERVICIO, 1))
         AND NVL (TXN.SERVICIO, 1) = DECODE (NVL (CNF.SERVICIO, 1),'TODOS', NVL (TXN.SERVICIO, 1),NVL (CNF.SERVICIO, 1))
         AND NVL (TXN.CONCEPTO_MODALIDAD, 1) = NVL (CNF.CONCEPTO_MODALIDAD, 1) 
         AND NVL (TXN.FORMA_PAGO, 1) = DECODE (NVL (CNF.FORMA_PAGO, 1),'TODOS', NVL (TXN.FORMA_PAGO, 1),NVL (CNF.FORMA_PAGO, 1))
         AND NVL (TXN.ADICIONAL1, 1) = NVL (CNF.ADICIONAL1, 1)
         AND NVL (TXN.ADICIONAL3, 1) = NVL (CNF.ADICIONAL3, 1)
         AND NVL (TXN.ADICIONAL4, 1) = NVL (CNF.ADICIONAL4, 1)
         AND NVL (TXN.ADICIONAL5, 1) = NVL (CNF.ADICIONAL5, 1)
         AND NVL (TXN.ADICIONAL6, 1) = NVL (CNF.ADICIONAL6, 1)
         AND NVL (TXN.ADICIONAL7, 1) = NVL (CNF.ADICIONAL7, 1)
         AND NVL (TXN.ADICIONAL8, 1) = NVL (CNF.ADICIONAL8, 1)
         AND NVL (TXN.ADICIONAL9, 1) = NVL (CNF.ADICIONAL9, 1)
         AND NVL (TXN.ADICIONAL10, 1) = NVL (CNF.ADICIONAL10, 1)       
         WHERE 
         CNF.ID_INTERFAZ IS NULL
;

    BEGIN
    
    
        FOR rec IN cur_all_invoicesLines_not_conf LOOP      
        --consultamos si ya tenemos el estatus 
        select distinct detalle_error into v_details_error from xxer_tbl_puente_header where tabla_puente_id = rec.tabla_puente_id AND ROWNUM=1 ;-- AND ESTATUS IS NULL; 
            
            IF(SUBSTR(v_details_error,1,24) ='Linea sin configuracion:')
            THEN
                v_error_location := 'Error to update status de Error Validacion';
   				  /*Se evalua si ya registramos la linea en la salida y actualizamos*/

               IF ( col_val_lines_invoice.count > 0 )
               THEN
                    FOR i IN 1..col_val_lines_invoice.count LOOP
				
				     --si ya existe el Recibo actualizamos el valor detalles error para no duplicar
				       IF(col_val_lines_invoice(i).INVOICE_NUMBER = rec.NUMERO_DOCUMENTO)
                            THEN
                                v_error_location := 'Error to set derived values from (previuous variables)';
                                dbms_output.put_line('lines_invoice: ' || v_details_error||','||rec.no_linea);
                                col_val_lines_invoice(i).DETAILS_ERROR := v_details_error||','||rec.no_linea;
                                
				       END IF;              
               END LOOP;
            END IF;			
/*Se actualizan los registros de la tabla header de las lineas que no tienen configuracion*/
   
                UPDATE xxer_tbl_puente_header
                SET
                    estatus = 'E'
                   ,detalle_error = v_details_error||','||rec.no_linea
                WHERE  tabla_puente_id = rec.tabla_puente_id
                    AND numero_documento = rec.NUMERO_DOCUMENTO;
                        
            ELSE 
            
            dbms_output.put_line('Linea sin configuracion: '||rec.no_linea);
            v_error_location := 'Error to update status de Error Validacion';
            col_val_lines_invoice.extend;
            
            col_val_lines_invoice(col_val_lines_invoice.count):=XXER_AR_VALIDATION_INVOICE_TYPE(rec.NUMERO_DOCUMENTO,rec.total,'Linea sin configuracion: '||rec.no_linea);
                     

                UPDATE xxer_tbl_puente_header
                SET
                    estatus = 'E'
                   ,detalle_error = 'Linea sin configuracion: '||rec.no_linea
                WHERE  tabla_puente_id = rec.tabla_puente_id
                    AND numero_documento = rec.NUMERO_DOCUMENTO;        
                    
         
            END IF;
            v_commit:=v_commit+1;
        END LOOP;
        
IF (v_commit<0)
THEN
          v_error_location := 'Error to apply COMMIT';
        COMMIT;/*Se confirma la actualización de los datos*/
        END IF;
		p_validation_inv_lines:=col_val_lines_invoice;

        
    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_AR_UTILITIES_PKG.VALIDATION_LINES_INVOICE_CONFIG-'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);
    dbms_output.put_line(p_error_desc);

                                     

    END validation_lines_invoice_config;

   /**
 * Procedimiento usado para procesar los resultados de carga de facturas
 * y devolver el detalle numero de facturas cargadas,el número de fallos y el total de 
 * registros procesados,tambien traera los mensages de error que se hayan tenido
 */

    PROCEDURE get_result_of_load_invoices (
        p_invoice_load_status   xxer_invoice_load_status_ttype,
        p_total_successful      OUT NUMBER,
        p_total_errors          OUT NUMBER,
        p_total_processed       OUT NUMBER,
        p_error_messages_inv    OUT xxer_error_messages_inv_ttype,
        p_error                 OUT NUMBER,
        p_error_desc            OUT VARCHAR2
    ) AS

        v_trx_number_error_previous   VARCHAR2(100) := 'X';
        v_cont_total_trx_number       NUMBER := 0;
        v_cont_error_trx_number       NUMBER := 0;
        v_cont_load_trx_number        NUMBER := 0;
        c_loaded                      VARCHAR2(10) := 'LOADED';
        v_message_error               VARCHAR2(500);
        v_data_value_error            VARCHAR(250);
        error_messages_tb             xxer_error_messages_inv_ttype := xxer_error_messages_inv_ttype ();
    BEGIN
 /* Evalua nularidad de lista de resultados de carga*/
        IF
            p_invoice_load_status.count > 0
        THEN
            FOR i IN 1..p_invoice_load_status.count LOOP
    /*Evalua si el registro de factura (TRX_NUMBER) fue cargado correctamente*/
                IF
                    p_invoice_load_status(i).status = c_loaded
                THEN
                    v_cont_load_trx_number := v_cont_load_trx_number + 1;        

    /*Evalua si el TRX_NUMBER en ERROR es diferente al anterior,si es diferente es considerado como una diferente factura en error
      pero si es igual es considerado como una factura repetidad que intento cargarse y se descarta su conteo en el total de facturas a procesar*/
                ELSIF p_invoice_load_status(i).trx_number <> v_trx_number_error_previous THEN
                    v_cont_error_trx_number := v_cont_error_trx_number + 1; 

        /*Se asigna el nuevo registro de factura en error para comparar la nueva factura en error*/
                    v_trx_number_error_previous := p_invoice_load_status(i).trx_number;
                    v_message_error := 'Error load in : '
                                       || p_invoice_load_status(i).trx_number
                                       || '; '
                                       || 'INVALID_VALUE: '
                                       || p_invoice_load_status(i).invalid_value
                                       || '; '
                                       || 'MESSAGE_TEXT: '
                                       || p_invoice_load_status(i).message_text;

                    v_data_value_error := 'INVALID_VALUE: ' || p_invoice_load_status(i).invalid_value;
                    error_messages_tb.extend;
                    error_messages_tb(error_messages_tb.count) := xxer_error_messages_inv_type(v_message_error,v_data_value_error);
                END IF;
            END LOOP;

            v_cont_total_trx_number := v_cont_load_trx_number + v_cont_error_trx_number;

    /*Asignación de valores a prámetros de salida*/
            p_total_successful := v_cont_load_trx_number;
            p_total_errors := v_cont_error_trx_number;
            p_total_processed := v_cont_total_trx_number;
            p_error_messages_inv := error_messages_tb;
        END IF; /*Fin de IF que evalua nularidad de lista de resultados*/
    END get_result_of_load_invoices;

 /*
 * Procedimiento usado para actualizar el status de las facturas
 * en las tablas custom,tomando como base el parametro de tipo XXER_INVOICE_LOAD_STATUS_TTYPE
 * que contiene el transaction_number y el batch_id.
 */

    PROCEDURE update_status_invoices (
        p_load_results   IN xxer_ar_params_upd_inv_ttype,
        p_error          OUT NUMBER,
        p_error_desc     OUT VARCHAR2
    ) AS

        v_load_results_tb            xxer_ar_params_upd_inv_ttype := xxer_ar_params_upd_inv_ttype ();
        v_exist_rec_to_update        NUMBER := 0;
        v_status_success             VARCHAR2(1) := 'S';
        v_status_error               VARCHAR2(1) := 'E';
        v_status_load_error          VARCHAR2(10) := 'E';
        v_status_load_success        VARCHAR2(10) := 'S';
        v_flag_process_some_record   BOOLEAN := false;
        v_params_null                VARCHAR2(3000) := '';
        v_error_msg                  VARCHAR2(300) := NULL;
        v_error_location             VARCHAR2(255);
        v_commit                     NUMBER := 0;--contador para hacer commit
        PRAGMA autonomous_transaction;
    BEGIN
/*  
P_ERROR := 555;
P_ERROR_DESC := 'Hellow World';
*/
        v_load_results_tb := p_load_results;

  /*Se evalua la nularidad del parámetro que contiene la colección de resultados de carga*/
        IF
            v_load_results_tb.count > 0
        THEN
            FOR i IN 1..v_load_results_tb.count LOOP
                v_commit := v_commit + 1;---contando registros para hacer comit cada 10 transacciones
                v_error_location := 'Error when evaluating the nullity of parameters';
    /*Se revisa que todos los campos de los registros de V_LOAD_RESULTS_TB esten llenos para continuar con el proceso
      de actualización*/
                IF
                    ( v_load_results_tb(i).batch_id IS NOT NULL ) AND ( v_load_results_tb(i).transaction_number IS NOT NULL ) AND ( v_load_results_tb(i).status IS NOT
NULL )
                THEN
                    v_error_location := 'Error when verify the exist record to update.'; 
         /*Se revisa que exista el registro a modificar en la tabla header*/
                    SELECT
                        COUNT(*)
                    INTO v_exist_rec_to_update
                    FROM
                        xxer_tbl_puente_header
                    WHERE
                        1 = 1
                        AND tipo_documento NOT IN (
                            'RECIBO',
                            'REVERSO RECIBO'
                        )
                        AND numero_documento = v_load_results_tb(i).transaction_number
                        AND adicional2 = v_load_results_tb(i).batch_id;

                    IF
                        ( v_exist_rec_to_update > 0 )
                    THEN
                        dbms_output.put_line('Se encontro el valor a registrar');
                        dbms_output.put_line('El status entrante es: ' || v_load_results_tb(i).status);
                        IF
                            ( v_load_results_tb(i).status = v_status_load_success )
                        THEN
                            v_error_location := 'Error when update record with trx_number: '
                                                || v_load_results_tb(i).transaction_number
                                                || ' to Successs';

                /*Se ejecuta la sentencia para actualizar el registro y establecer su estado de carga*/
                            UPDATE xxer_tbl_puente_header
                            SET
                                estatus = v_status_success
                            WHERE
                                numero_documento = v_load_results_tb(i).transaction_number
                                AND adicional2 = v_load_results_tb(i).batch_id;

                            v_flag_process_some_record := true;
                        ELSE
                            v_error_location := 'Error when update record with trx_number: '
                                                || v_load_results_tb(i).transaction_number
                                                || ' to Error';
                            UPDATE xxer_tbl_puente_header
                            SET
                                estatus = v_status_error
                            WHERE
                                numero_documento = v_load_results_tb(i).transaction_number
                                AND adicional2 = v_load_results_tb(i).batch_id;

                            v_flag_process_some_record := true;
                        END IF;

                    ELSE
         /*Se agrega a la varible de error el mensaje de que registros no pueden actualizarse 
           por que no se encontraron*/
                        p_error_desc := p_error_desc
                                        || '; No exist the record to update with NUMERO_DOCUMENTO = '
                                        || v_load_results_tb(i).transaction_number
                                        || ' y ADICIONAL2 = '
                                        || v_load_results_tb(i).batch_id
                                        || ' in XXER_TBL_PUENTE_HEADER ';
                    END IF; /*Fin if que compara si hay dato a actualizar en la BD*/
       --P_ERROR_DESC :=   P_ERROR_DESC || ',Exist null fiel'

                ELSE

        /* Agregan al mensaje de error los campos nulos del registro que se quiere actualizar*/
                    IF
                        v_load_results_tb(i).batch_id IS NULL
                    THEN
                        v_params_null := v_params_null
                                         || ','
                                         || v_load_results_tb(i).batch_id;
                    END IF;

                    IF
                        v_load_results_tb(i).transaction_number IS NULL
                    THEN
                        v_params_null := v_params_null
                                         || ','
                                         || v_load_results_tb(i).transaction_number;
                    END IF;

                    IF
                        v_load_results_tb(i).status IS NULL
                    THEN
                        v_params_null := v_params_null
                                         || ','
                                         || v_load_results_tb(i).status;
                    END IF;

                    p_error_desc := p_error_desc
                                    || '; The param P_LOAD_RESULTS in the next fields is null: '
                                    || v_params_null;
                END IF; /*Fin de IF que evalua que los campos del registro a actualizar vengan llenos*/

                IF
                    v_commit = 10
                THEN
                    COMMIT;
                    v_commit := 0;
                END IF;
            END LOOP;

        ELSE
            p_error_desc := 'The param P_LOAD_RESULTS is null,is not possible continue with update.';
        END IF; /*Fin de if que evalua ue el parametro de resultados venga lleno*/

        IF
            v_flag_process_some_record = true
        THEN
  /*Si se actualizó al menos un registro se aplica commit*/
   --         NULL;
    COMMIT;
        END IF;
        UPDATE xxer_tbl_puente_header
        SET
            estatus = 'E',
            detalle_error = 'Error de datos(clientes,terminos de pagos,etc)'
        WHERE
            estatus = 'P';

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_AR_UTILITIES_PKG.UPDATE_STATUS_INVOICES'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);

    END update_status_invoices;  


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
        v_organization_id          xxer_cnf_interfase_ingresos_ar.organization_id%TYPE := NULL;
        v_complement_upd_uuid_tb   xxer_complement_upd_uuid_ttype := xxer_complement_upd_uuid_ttype ();
        v_exist_record             NUMBER := 0;
        v_uuid                     xxer_tbl_puente_aux.uuid%TYPE := '';
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
                    SELECT DISTINCT
                        COUNT(*)
                    INTO v_exist_record
                    FROM
                        xxer_ar_invoices_v inv
                    WHERE
                        1 = 1
                        AND inv."Transaction_Number" = p_invoices_to_update(i).trx_number
                        AND ROWNUM = 1;
                /*Se compara si existe el registro para recuperar el ORG_ID*/

                    IF
                        v_exist_record > 0
                    THEN
                        v_error_location := 'Error when obtaining organization_id for transaction_number: ' || p_invoices_to_update(i).trx_number;
                        SELECT DISTINCT
                            nvl(inv.organization_id,0),
                            nvl(inv.uuid,'Default')
                        INTO
                            v_organization_id,
                            v_uuid
                        FROM
                            xxer_ar_invoices_v inv
                        WHERE
                            1 = 1
                            AND inv."Transaction_Number" = p_invoices_to_update(i).trx_number
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
    
    PROCEDURE get_relations_cfdis (P_TRANSACTION  IN  VARCHAR2,
                                   P_RELATIONS_CFDIS OUT XXER_RELATIONS_CFDIS_TTYPE,
                                   P_ERROR       OUT NUMBER,
                                   P_ERROR_DESC  OUT VARCHAR2) AS
       
	   V_XXER_RELATIONS_CFDIS   XXER_RELATIONS_CFDIS_TTYPE := XXER_RELATIONS_CFDIS_TTYPE ();
	   
CURSOR CUR_RELATIONS_CFDIs IS
SELECT
    descripcion,
    vt_monto,
    sucursal_id,
    importe,
    iva,
    importe_iva,
    importe_retencion,
    numero_producto,
    referencia_producto,
    unidad_medida,
    numero_documento,
    total_factura,
    uuid,
    ESTADO_FACTURA_INGRESO  estatus,
    xml_pdf_ingreso,
    url_pdf_ingreso,
    fecha_factura_ingreso,
    uuid_cartaporte,
    ESTADO_FACTURA_CARTA_PORTE  estatus_cp,
    xml_pdf_cartaporte,
    url_pdf_cartaporte,
    fecha_timbrado_trasalado,
    tipo_factura,
    venta_fecha_creacion
FROM PCENTRAL.FAC_INGRESO_CARTAP_TPAK_VEW@PCENTRAL_LINK.ESTRELLAROJA.COM.MX
WHERE 1=1
AND TRUNC(fecha_factura_ingreso) > TO_DATE ('01/06/2021', 'DD/MM/YYYY')
AND NUMERO_DOCUMENTO=P_TRANSACTION
AND UNIDAD_MEDIDA in ('UNIDAD DE SERVICIO','UNIDAD')
;	
	   
    BEGIN
	
       FOR rec IN CUR_RELATIONS_CFDIs LOOP  
           V_XXER_RELATIONS_CFDIS.extend;
V_XXER_RELATIONS_CFDIS(V_XXER_RELATIONS_CFDIS.count) := 
		   XXER_RELATIONS_CFDIS_TYPE(
           rec.DESCRIPCION,
           rec.VT_MONTO,
           rec.SUCURSAL_ID,
           rec.IMPORTE,
           rec.IVA,
           rec.IMPORTE_IVA,
           rec.IMPORTE_RETENCION,
           rec.NUMERO_PRODUCTO,
           rec.REFERENCIA_PRODUCTO,
           rec.UNIDAD_MEDIDA,
		   rec.NUMERO_DOCUMENTO,
		   rec.TOTAL_FACTURA,
		   rec.UUID,
           rec.estatus,
		   rec.xml_pdf_ingreso,
		   rec.URL_PDF_INGRESO,
		   rec.FECHA_FACTURA_INGRESO,
		   rec.UUID_CARTAPORTE,
           rec.estatus_cp ,
		   rec.XML_PDF_CARTAPORTE,
		   rec.URL_PDF_CARTAPORTE,
		   rec.FECHA_TIMBRADO_TRASALADO,
           rec.TIPO_FACTURA ,
           rec.venta_fecha_creacion);
           --dbms_output.put_line('Guia: '||rec.NUMERO_PRODUCTO);

		 END LOOP;

		 P_RELATIONS_CFDIS := V_XXER_RELATIONS_CFDIS;

  
  
    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_UTILITIES_PKG.GET_RELATIONS_CFDIS'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);
END get_relations_cfdis;
  
PROCEDURE XER_MAPEO_CC_PRC2 IS
tmpVar NUMBER;
/******************************************************************************
   NAME:       XER_MAPEO_CC_PRC
   PURPOSE:    

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        09/01/2018   imunoz       1. Created this procedure.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     XER_MAPEO_CC_PRC
      Sysdate:         09/01/2018
      Date and Time:   09/01/2018, 11:21:11 p.m., and 09/01/2018 11:21:11 p.m.
      Username:        imunoz (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
cursor c1 is
select gl.accounting_date
    ,gl.reference4
    ,gl.reference5
    ,gl.reference10
    --,gl.reference11
    ,gl.segment1||'-'||gl.segment2||'-'||gl.segment3||'-'||gl.segment4||'-'||gl.segment5||'-'||gl.segment6||'-'||gl.segment7||'-'||gl.segment8||'-'||gl.segment9||'-'||gl.segment10 combinacion
from XXER_GL_INTERFACE gl
--where TRUNC(gl.accounting_date) = (TRUNC(sysdate)-1)
where TRUNC(gl.accounting_date) >= trunc(add_months(sysdate,-12)) and segment6 is not null
--where TRUNC(gl.accounting_date) between TO_DATE('29/07/2019','DD/MM/RRRR') and TO_DATE('29/07/2019','DD/MM/RRRR')
--AND UPPER(REFERENCE4) LIKE '%ESTRELLAS%'
group by gl.accounting_date
    ,gl.reference4
    ,gl.reference5
    ,gl.reference10
    --,gl.reference11
    ,gl.segment1||'-'||gl.segment2||'-'||gl.segment3||'-'||gl.segment4||'-'||gl.segment5||'-'||gl.segment6||'-'||gl.segment7||'-'||gl.segment8||'-'||gl.segment9||'-'||gl.segment10
order by 1,2,3,4,5;
    
vAccountingDate GL_INTERFACE.ACCOUNTING_DATE%TYPE;
vReference4 GL_INTERFACE.REFERENCE4%TYPE;
vReference5 GL_INTERFACE.REFERENCE5%TYPE;
vReference10 GL_INTERFACE.REFERENCE10%TYPE;
--vReference11 GL_INTERFACE.REFERENCE11%TYPE;
vCombinacion VARCHAR2(44);

vS1 XER_MAPEO_CC_TBL.S1%TYPE;
vS2 XER_MAPEO_CC_TBL.S2%TYPE;
vS3 XER_MAPEO_CC_TBL.S3%TYPE;
vS4 XER_MAPEO_CC_TBL.S4%TYPE;
vS5 XER_MAPEO_CC_TBL.S5%TYPE;

BEGIN
    DBMS_OUTPUT.ENABLE(1000000);
   tmpVar := 0;
   dbms_output.put_line('INICIO');
   open c1;
   loop
   fetch c1 into vAccountingDate,vReference4,vReference5,vReference10,vCombinacion;
   exit when c1%notfound;
   
   dbms_output.put_line('c1:'||vAccountingDate||'-'||vReference4||'-'||vReference5||'-'||vReference10||'-'||vCombinacion);
   
   vS1 := '';
   vS2 := '';
   vS3 := '';
   vS4 := '';
   vS5 := '';
   
       begin
            select distinct t2.s1
                ,t2.s2
                ,t2.s3
                ,t2.s4
                ,t2.s5
              into vS1,vS2,vS3,vS4,vS5
              from PXERINTUSER.XER_MAPEO_CC_TBL t2
             where t2.compania ||'-'|| t2.unidad_negocio ||'-'|| t2.interco ||'-'|| t2.ubicacion ||'-'|| t2.servicio ||'-'|| t2.modalidad ||'-'|| t2.cc ||'-'|| t2.cuenta ||'-'|| t2.futuro1 ||'-'|| t2.futuro2 = vCombinacion;    
             
             -- Actualizar registro
               update XXER_GL_INTERFACE gl
                   set gl.segment1 = vS1
                    ,gl.segment2 = vS2
                    ,gl.segment3 = vS3
                    ,gl.segment4 = vS4
                    ,gl.segment5 = vS5
                    ,gl.segment6 = ''
                    ,gl.segment7 = ''
                    ,gl.segment8 = ''
                    ,gl.segment9 = ''
                    ,gl.segment10 = '' 
                where 1=1
                  and gl.accounting_date = vAccountingDate
                  and gl.reference4 = vReference4
                  and gl.reference5 = vReference5
                  and gl.reference10 = vReference10
                  --and gl.reference11 = vReference11
                  and gl.segment1||'-'||gl.segment2||'-'||gl.segment3||'-'||gl.segment4||'-'||gl.segment5||'-'||gl.segment6||'-'||gl.segment7||'-'||gl.segment8||'-'||gl.segment9||'-'||gl.segment10 = vCombinacion; 
               
                  COMMIT;
               
               dbms_output.put_line(SQL%ROWCOUNT||' registros cctualizados con:'||vS1||'-'||vS2||'-'||vS3||'-'||vS4||'-'||vS5);
       
       exception
       when no_data_found then
            dbms_output.put_line('NO ENCONTRO COMBINACION');
       when others then
        raise;
       end;

   -- limpiar variables
   vAccountingDate := '';
   vReference4 := '';
   vReference5 := '';
   vReference10 := '';
   --vReference11 := '';
   vCombinacion := '';
   
   end loop;
   
   COMMIT;
   
   dbms_output.put_line('FIN');
   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       NULL;
     WHEN OTHERS THEN
       -- Consider logging the error and then re-raise
       RAISE;
END XER_MAPEO_CC_PRC2;
  
END xxer_utilities_pkg;