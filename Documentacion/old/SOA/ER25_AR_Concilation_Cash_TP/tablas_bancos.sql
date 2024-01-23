drop table TMS_COCILIACION_BANCOS_TBL;
CREATE TABLE TMS_COCILIACION_BANCOS_TBL
(ID                NUMBER NOT NULL ENABLE,
 NO_OPERACION      NUMBER,
 SUCURSAL          VARCHAR2(100),
 REFERENCIA        VARCHAR2(200), 
 USUARIO           VARCHAR2(200),
 USRTRX            VARCHAR2(100),
 TIPO_PAGO         VARCHAR2(50),
 LOTE              NUMBER,
 NOMBRE_ARCHIVO    VARCHAR2(300),
 TARJETA           NUMBER,
 NOMBRE_TH         VARCHAR2(150),
 AUTORIZACION      VARCHAR2(150),
 AFILIACION        NUMBER,
 NOMBRE_AFILIACION VARCHAR2(200),
 IMPORTE           NUMBER,
 MONEDA            VARCHAR2(50),
 FECHA_OPERACION   DATE,
 HORA_OPERACION    VARCHAR2(200),
 TIPO_TARJETA      VARCHAR2(200),
 MARCA_TARJETA     VARCHAR2(50),
 BANCO_EMISOR      VARCHAR2(50),
 TIPO_OPERACION    VARCHAR2(50),
 FECHA_DEPOSITO    DATE, 
 TIPO_BUZON        VARCHAR2(150),
 FECHA_CREACION    DATE 
);

select * from XXER_BANCOS_AMEX_HEADER_TBL;
select * from XXER_BANCOS_AMEX_SUMMARY_TBL;
select * from XXER_BANCOS_AMEX_TXNPRICING_TBL
select * from XXER_BANCOS_AMEX_ADJUSTMENT_TBL
select * from XXER_BANCOS_AMEX_CHARGEBACK_TBL
select * from XXER_BANCOS_AMEX_SUBMISSION_TBL
select * from XXER_BANCOS_AMEX_TRANSACTN_TBL

delete from XXER_BANCOS_AMEX_HEADER_TBL;
delete from XXER_BANCOS_AMEX_SUMMARY_TBL;
delete from XXER_BANCOS_AMEX_TXNPRICING_TBL;
delete from XXER_BANCOS_AMEX_ADJUSTMENT_TBL;
delete from XXER_BANCOS_AMEX_CHARGEBACK_TBL;
delete from XXER_BANCOS_AMEX_SUBMISSION_TBL;
delete from XXER_BANCOS_AMEX_TRANSACTN_TBL;

alter session set ddl_lock_timeout = 600;
drop table XXER_BANCOS_AMEX_HEADER_TBL;
	CREATE TABLE XXER_BANCOS_AMEX_HEADER_TBL
	(
	ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
	FECHA_CREACION_ARCHIVO VARCHAR2(20),
	HORA_CREACION_ARCHIVO   VARCHAR2(20),
	NUM_SECUENCIAL          VARCHAR2(20),
	IDENTIDIACION_ARCHIVO   VARCHAR2(20),
	NOMBRE_ARCHIVO          VARCHAR2(40),
	NUM_VERSION_ARCHIVO     VARCHAR2(8),
	SUMA_TOTAL_REGISTROS VARCHAR2(30),
	FECHA_CREACION DATE  DEFAULT sysdate NOT NULL
	);
drop table XXER_BANCOS_AMEX_SUMMARY_TBL;
	CREATE TABLE XXER_BANCOS_AMEX_SUMMARY_TBL
	(
	 ID  NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
	 ID_HEADER NUMBER NOT NULL ENABLE,
	 IDENTIFICACION_ESTABLECIMIENTO VARCHAR2(30),
	CODIGO_TIPO_CUENTA VARCHAR2(30),
	NUM_PAGO VARCHAR2(30),
	FECHA_PAGO VARCHAR2(30),
	MONEDA_PAGO VARCHAR2(30),
	NUM_UNICO_REFERENCIA_PAGO VARCHAR2(30),
	MONTO_NETO_PAGO VARCHAR2(30),
	MONTO_BRUTO_PAGO VARCHAR2(30),
	MONTO_DESCUENTO VARCHAR2(30),
	MONTO_SERVICIO VARCHAR2(30),
	MONTO_AJUSTE VARCHAR2(30),
	MONTO_IMPUESTOS VARCHAR2(30),
	MONTO_SALDO_DEBITO_INICIAL VARCHAR2(30),
	NUM_DEPOSITO_DIRECTO VARCHAR2(30),
	NUM_CUENTA_BANCARIA VARCHAR2(60),
	NUM_CUENTA_BANCARIA_INTERNACIONAL VARCHAR2(60),
	CODIGO_BANCO VARCHAR2(30),
	FECHA_CREACION DEFAULT sysdate NOT NULL
	);
drop table XXER_BANCOS_AMEX_SUBMISSION_TBL;
	CREATE TABLE XXER_BANCOS_AMEX_SUBMISSION_TBL
	(
	 ID   NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
	 NUM_ESTABLECIMIENTO VARCHAR2(30),
	CODIGO_TIPO_CUENTA VARCHAR2(30),
	NUM_PAGO_AMEX VARCHAR2(30),
	FECHA_PAGO VARCHAR2(30),
	MONEDA_PAGO VARCHAR2(30),
	NUM_ESTABLECIMIENTO_PRESENTION VARCHAR2(30),
	FECHA_ENVIO_COMERCIAL VARCHAR2(30),
	FECHA_PROCESAMIENTO_AMEX VARCHAR2(30),
	NUM_FACTURA VARCHAR2(30),
	MONEDA VARCHAR2(30),
	RELLENO VARCHAR2(30),
	TASA_CAMBIO VARCHAR2(30),
	MONTO_BRUTO_MONEDA_PRESENTACION VARCHAR2(30),
	MONTO_BRUTO_MONEDA_PAGO VARCHAR2(30),
	MONTO_DESCUENTO_RSENTCION VARCHAR2(30),
	MONTO_CARGO_SERVICIO VARCHAR2(30),
	MONTO_IMPUESTO VARCHAR2(30),
	MONTO_NETO VARCHAR2(30),
	TASA_DESCUENTO VARCHAR2(30),
	TASA_IMPUESTO VARCHAR2(30),
	SUMA_TRANSACCIONES VARCHAR2(30),
	IDENTIFICACION_SEGUIMIENTO VARCHAR2(30),
	NUM_CUOTA VARCHAR2(30),
	NUM_ACELERACION VARCHAR2(30),
	FECHA_LIQUIDACION_ORIGINAL VARCHAR2(30),
	FECHA_ACELERACION VARCHAR2(30),
	CANTIDAD_DIAS_ADELANTADOS VARCHAR2(30),
	MONTO_CARGO_ACELERACION VARCHAR2(30),
	MONTO_NETO_CARGO_ACELERACION VARCHAR2(30),
	MONTO_BRUTO_DEBITO VARCHAR2(30),
	MONTO_BRUTO_CREDITO VARCHAR2(30),
	FECHA_CREACION DEFAULT sysdate NOT NULL
	);
drop table XXER_BANCOS_AMEX_TRANSACTN_TBL;
	CREATE TABLE XXER_BANCOS_AMEX_TRANSACTN_TBL
	(
	 ID  NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
	 NUM_ESTABLECIMIENTO VARCHAR2(30),
	CODIGO_TIPO_CUENTA VARCHAR2(30),
	NUM_PAGO_AMEX VARCHAR2(30),
	FECHA_PAGO_AMEX VARCHAR2(30),
	MONEDA_PAGO VARCHAR2(30),
	NUM_ESTABLECIMIENTO2 VARCHAR2(30),
	FECHA_PRESENTACION VARCHAR2(30),
	FECHA_PROCESAMIENTO_AMEX VARCHAR2(30),
	NUM_FACTURA VARCHAR2(30),
	MONEDA_PRESENTACION VARCHAR2(30),
	IDENTIFICACION_UBICACION_ESTABLECIMIENTO VARCHAR2(30),
	NUM_FACTURA_REFERENCIA VARCHAR2(60),
	NUM_VENDEDOR VARCHAR2(30),
	NUM_TARJETA VARCHAR2(30),
	NUM_REFERENCIA_ESPECIFICO_INDUSTRIA VARCHAR2(60),
	MONTO_BRUTO_PRESENTACION VARCHAR2(30),
	MONTO_TRANSACCION VARCHAR2(30),
	FECHA_TRANSACCION VARCHAR2(30),
	HORA_TRANSACCION VARCHAR2(30),
	NUM_TRANSACCION VARCHAR2(30),
	CODIGO_APROBACION VARCHAR2(30),
	NUM_TERMINAL VARCHAR2(30),
	CODIGO_CATEGORIA_ESTABLECIMIENTO VARCHAR2(30),
	NUM_REFERENCIA_SOCIO VARCHAR2(60),
	NUM_REFERENCIA_ADQUIRENTE VARCHAR2(30),
	CODIGO_ERROR_INCUMPLIMIENTO_CALIDAD_DATOS VARCHAR2(30),
	CODIGO_ERROR_INCUMPLIMIENTO_CALIDAD_DATOS1 VARCHAR2(30),
	CODIGO_ERROR_INCUMPLIMIENTO_CALIDAD_DATOS2 VARCHAR2(30),
	CODIGO_ERROR_INCUMPLIMIENTO_CALIDAD_DATOS3 VARCHAR2(30),
	CODIGO_ERROR_INCUMPLIMIENTO_CALIDAD_DATOS4 VARCHAR2(30),
	INDICADOR_LECTURA_BANDA VARCHAR2(30),
	INDICADOR_TRANSACCION_RECHAZADA VARCHAR2(30),
	MONTO_PRIMERA_CUOTA VARCHAR2(30),
	MONTO_CUOTA_SIGUIENTE VARCHAR2(30),
	CANTIDAD_CUOTAS VARCHAR2(30),
	NUM_CUOTA VARCHAR2(30),
	RELLENO VARCHAR2(30),
	MONTO_SERVICIO VARCHAR2(30),
	MONTO_ACELERACION VARCHAR2(30),
	FECHA_CREACION DEFAULT sysdate NOT NULL
	);
	drop table XXER_BANCOS_AMEX_CHARGEBACK_TBL;
	CREATE TABLE XXER_BANCOS_AMEX_CHARGEBACK_TBL
	(
	 ID  NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
	 NUM_ESTABLECIMIENTO VARCHAR2(30),
	CODIGO_TIPO_CUENTA_ VARCHAR2(30),
	NUM_PAGO_AMEX VARCHAR2(30),
	FECHA_PAGO VARCHAR2(30),
	MONEDA_PAGO VARCHAR2(30),
	NUM_ESTABLECIMIENTO_PRESENTACION VARCHAR2(30),
	FECHA_PRESENTACION VARCHAR2(30),
	UBICACION_ESTABLECIMIENTO VARCHAR2(30),
	NUM_FACTURA_O_REFERENCIA VARCHAR2(60),
	IDENTIFICACION_VENDEDOR VARCHAR2(30),
	NUM_TARJETA VARCHAR2(30),
	NUM_REFERENCIA_INDUSTRIA VARCHAR2(60),
	FECHA_PROCESAMIENTO_AMEX VARCHAR2(30),
	NUM_FACTURA VARCHAR2(30),
	MONEDA_PRESENTACION VARCHAR2(30),
	NUM_CONTRACARGO VARCHAR2(60),
	CODIGO_MOTIVO_CONTRACARGO VARCHAR2(30),
	DESCRIPCION_MOTIVO_CONTRACARGO VARCHAR2(300),
	MONTO_BRUTO VARCHAR2(30),
	MONTO_DESCUENTO VARCHAR2(30),
	MONTO_CARGO_SERVICIO VARCHAR2(30),
	MONTO_IMPUESTO VARCHAR2(30),
	MONTO_NETO VARCHAR2(30),
	TASA_DESCUENTO VARCHAR2(30),
	TASA_CARGO_SERVICIO VARCHAR2(30),
	CODIGO_LOTE VARCHAR2(30),
	CODIGO_FACTURA VARCHAR2(30),
	FECHA_CREACION DEFAULT sysdate NOT NULL
	);
	drop table XXER_BANCOS_AMEX_ADJUSTMENT_TBL;
	CREATE TABLE XXER_BANCOS_AMEX_ADJUSTMENT_TBL
	(
	 ID  NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
	 NUM_ESTABLECIMIENTO VARCHAR2(30),
	CODIGO_TIPO_CUENTA VARCHAR2(30),
	NUM_PAGO_AMEX VARCHAR2(30),
	FECHA_PAGO VARCHAR2(30),
	MONEDA_PAGO VARCHAR2(30),
	NUM_ESTABLECIMIENTO_PRESENTACION VARCHAR2(30),
	FECHA_ENVIO VARCHAR2(30),
	UBICACION_ESTABLECIMIENTO VARCHAR2(30),
	NUM_FACTURA_REFERENCIA VARCHAR2(60),
	IDENTIFICACION_VENDEDOR VARCHAR2(30),
	NUM_TARJETA VARCHAR2(30),
	NUM_REFERENCIA_INDUSTRIA VARCHAR2(60),
	FECHA_PROCESAMIENTO_AMEX VARCHAR2(30),
	NUM_FACTURA VARCHAR2(30),
	MONEDA_PRESENTACION VARCHAR2(30),
	NUM_AJUSTE VARCHAR2(60),
	CODIGO_MOTIVO_AJUSTE VARCHAR2(30),
	DESCRIPCION_MOTIVO_AJUSTE VARCHAR2(300),
	MONTO_BRUTO VARCHAR2(30),
	MONTO_DESCUENTO VARCHAR2(30),
	MONTO_CARGO_SERVICIO VARCHAR2(30),
	MONTO_IMPUESTO VARCHAR2(30),
	MONTO_NETO VARCHAR2(30),
	TASA_DESCUENTO VARCHAR2(30),
	TASA_CARGO_SERVICIO VARCHAR2(30),
	CODIGO_LOTE VARCHAR2(30),
	CODIGO_FACTURA VARCHAR2(30),
	FECHA_CREACION DEFAULT sysdate NOT NULL
 	);
	drop table XXER_BANCOS_AMEX_TXNPRICING_TBL;
	CREATE TABLE XXER_BANCOS_AMEX_TXNPRICING_TBL
	(
	 ID  NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
	NUMERO_ESTABLCIMIENTO VARCHAR2(30),
	CODIGO_CUENTA VARCHAR2(30),
	NUM_PAGO_AMEX VARCHAR2(30),
	FECHA_PAGO VARCHAR2(30),
	MONEDA_PAGO VARCHAR2(30),
	NUM_ESTABLECIMENTO_PRESENTACION VARCHAR2(30),
	UBICACION_ESTABLECIMIENTO VARCHAR2(30),
	RELLENO VARCHAR2(30),
	NUM_FACTURA_REFERENCIA VARCHAR2(60),
	NUMERO_VENDEDOR VARCHAR2(30),
	NUM_TARJETA VARCHAR2(30),
	MONTO_TRANSACCION VARCHAR2(30),
	FECHA_TRANSACCION VARCHAR2(30),
	CODIGO_CARGO VARCHAR2(30),
	RELLENO2 VARCHAR2(30),
	MONTO_CARGO VARCHAR2(30),
	TASA_DESCUENTO VARCHAR2(30),
	MONTO_DESCUENTO VARCHAR2(30),
	FECHA_CREACION DEFAULT sysdate NOT NULL
	);
	