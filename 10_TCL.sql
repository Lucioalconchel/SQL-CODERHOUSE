USE TP_ALCONCHEL;
-- ------------------------ SEGUNDA TABLA --------------------------------------------------------------------------------
START TRANSACTION;
	INSERT INTO pago( payment_code, id_user)
		VALUES ('AJCTMQC2', 6);
	INSERT INTO pago( payment_code, id_user)
		VALUES ('FZW9L7UX', 11);
	INSERT INTO pago( payment_code, id_user)
		VALUES ('MQZLUS6W', 3);
	INSERT INTO pago( payment_code, id_user)
		VALUES ('68XXKF4H', 10);

	SAVEPOINT POINT_4;

	INSERT INTO pago( payment_code, id_user)
		VALUES ('T7SJXEAY', 3);
	INSERT INTO pago( payment_code, id_user)
		VALUES ('NKKWNFXN', 12);
	INSERT INTO pago( payment_code, id_user)
		VALUES ('AH7L9LKK', 7);
	INSERT INTO pago( payment_code, id_user)
		VALUES ('FHBMTC56', 9);

	SAVEPOINT POINT_8;

-- ROLLBACK TO POINT_4;

/*
Aca hay un conflicto el cual es que cuando se inserta datos en la tabla pago se refleja en la tabla log_pay,
por lo tanto llegado el caso de querer repetir el codigo / verificacion es necesario truncar las dos tablas e insertar los
datos originales de la tabla pago. A continuacion dejo el script:

	truncate table log_pay;
	truncate table pago;
    
    INSERT INTO pago( payment_code, id_user)
VALUES
	('B4H9UMZK', 1),
    ('LCBHMVBY', 2),
    ('D6BG9AZU', 3),
    ('2FWYBYRB', 4),
    ('XNUTUJ9K', 5),
    ('LBF2NNWF', 6),
    ('7PE8DLNC', 7),
    ('EW6BPHPV', 8),
    ('DUCK982T', 9),
    ('AFUS3D73', 10),
    ('Q6FFPS9P', 11),
    ('JY574JYK', 12),
    ('TCRR8FL9', 13),
    ('TPUP6MQL', 14),
    ('7WHGBQAW', 15)
    ;
*/

-- ------------------------ PRIMERA TABLA --------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE sp_TCL_1 ()
BEGIN
	DECLARE var INT;
    SELECT COUNT(claim_id) INTO var FROM reclamo;
    IF var <> 0 THEN
		START TRANSACTION;
			TRUNCATE TABLE reclamo;
    ELSE
		START TRANSACTION;
			INSERT INTO reclamo ( id_user, date, description)
				VALUES (1, '2021-11-16', 'No se acredito mi suscripcion');
			INSERT INTO reclamo ( id_user, date, description)
				VALUES(12, '2022-12-23', 'Caidas intermitentes en el servicio');
			INSERT INTO reclamo ( id_user, date, description)
				VALUES(7, '2022-11-24', 'No es lo que esperaba');
			INSERT INTO reclamo ( id_user, date, description)
				VALUES(9, '2022-07-06', 'Catalogo reducido y no cuenta con proteccion para menores');
    END IF;
END
$$

-- ROLLBACK;
-- COMMIT;

/*
En este caso no supe como validar de otra manera, por lo tanto implemente un SP,
es sencillo, no tiene parametros IN y OUT, solamente se ejecuta como un metodo.
El mismo hace la validacion y si encuentra que la cantidad de id de reclamo es distinto a 0
trunca la tabla, en caso contrario lo inserta
*/
