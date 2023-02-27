-- DROP SCHEMA tp_alconchel;
CREATE SCHEMA TP_ALCONCHEL;
USE TP_ALCONCHEL;

-- Tabla Servicio (1)
CREATE TABLE servicio(
	service_name VARCHAR(30) PRIMARY KEY NOT NULL,
    type_service VARCHAR(30),
    price FLOAT NOT NULL,
    plataform VARCHAR(30) NOT NULL
);
-- Tabla Pais (2)
CREATE TABLE pais(
	id_country VARCHAR(5) PRIMARY KEY,
	name_country VARCHAR(20) NOT NULL,
    currency VARCHAR(10) NOT NULL DEFAULT 'U$D',
    change_dollar FLOAT NOT NULL DEFAULT 1
);
-- Tabla Usuario (2)
CREATE TABLE usuario(
	dni VARCHAR(8) NOT NULL PRIMARY KEY DEFAULT '99999999',
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    age INT NOT NULL,
    nationality VARCHAR(5),
    email_user VARCHAR(50) NOT NULL
);
	ALTER TABLE usuario ADD CONSTRAINT fk_nationality
		FOREIGN KEY (nationality) REFERENCES pais (id_country) ON DELETE CASCADE;

-- Tabla Tarjeta (3)
CREATE TABLE tarjeta(
	card_number VARCHAR(30) NOT NULL PRIMARY KEY,
    bank_name VARCHAR(50) NOT NULL,
    security_code INT NOT NULL,
    expiration_date date NOT NULL,
    type_card VARCHAR(30) NOT NULL DEFAULT 'MASTERCARD',
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
    dni VARCHAR(8) DEFAULT '99999999',
    extension INT DEFAULT 0
    );
	ALTER TABLE tarjeta ADD CONSTRAINT fk_documento
		FOREIGN KEY (dni) REFERENCES usuario (dni) ON DELETE CASCADE;

-- Tabla Cuenta (4)
CREATE TABLE cuenta(
	id_user INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email_user VARCHAR(50) NOT NULL,
    user VARCHAR(30),
    password VARCHAR(30) NOT NULL,
    card_number VARCHAR(30) ,
    service_name VARCHAR(30) ,
    type_service VARCHAR(30)
);
	ALTER TABLE cuenta ADD CONSTRAINT fk_card
		FOREIGN KEY (card_number) REFERENCES tarjeta (card_number) ON DELETE CASCADE;
	ALTER TABLE cuenta ADD CONSTRAINT fk_servicio
		FOREIGN KEY (service_name) REFERENCES servicio (service_name) ON DELETE CASCADE;
        
-- Tabla pago (5)
CREATE TABLE pago(
    payment_code VARCHAR(20) NOT NULL PRIMARY KEY,
    id_user INT
);
	ALTER TABLE pago ADD CONSTRAINT fk_user
		FOREIGN KEY (id_user) REFERENCES cuenta (id_user) ON DELETE CASCADE;

-- Tabla Reclamo (6)
CREATE TABLE reclamo (
    claim_id INT NOT NULL auto_increment PRIMARY KEY,
    id_user INT ,
    date DATE,
    description VARCHAR(200) NOT NULL
);
	ALTER TABLE reclamo ADD CONSTRAINT fk_user_1
		FOREIGN KEY (id_user) REFERENCES cuenta (id_user) ON DELETE CASCADE;

-- Tabla Sistema Operativo (7)
CREATE TABLE sistema_operativo(
    so_name VARCHAR(20) NOT NULL PRIMARY KEY,
    so_version VARCHAR(10)
);

-- Tabla Plataforma (8)
CREATE TABLE plataforma(
    plataform VARCHAR(30) NOT NULL ,
    id_user INT ,
    so_name VARCHAR(20) NOT NULL,
    resolution VARCHAR(10)
);
	ALTER TABLE plataforma ADD CONSTRAINT fk_user_2
		FOREIGN KEY (id_user) REFERENCES cuenta (id_user) ON DELETE CASCADE;
    ALTER TABLE plataforma ADD CONSTRAINT fk_so
        FOREIGN KEY (so_name) REFERENCES sistema_operativo (so_name);

-- Tabla Descuento (9)
CREATE TABLE descuento(
	discount_id INT NOT NULL PRIMARY KEY ,
    id_user INT ,
    discount_name VARCHAR(30),
    service_name VARCHAR(30),
    expiration_date DATE NOT NULL,
    description VARCHAR(200) NOT NULL
);
	ALTER TABLE descuento ADD CONSTRAINT fk_user_3
		FOREIGN KEY (id_user) REFERENCES cuenta (id_user) ON DELETE CASCADE;
	ALTER TABLE descuento ADD CONSTRAINT fk_servicio_1
		FOREIGN KEY (service_name) REFERENCES servicio (service_name) ON DELETE CASCADE;

-- Creacion de Tablas LOG
-- LOG 1
CREATE TABLE log_pay(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	payment_code VARCHAR(20),
    id_user INT,
    pay_day TIMESTAMP,
    user VARCHAR(30)
);

-- LOG 2
CREATE TABLE log_service(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(30) NOT NULL,
    price FLOAT NOT NULL,
    date TIMESTAMP,
    state VARCHAR(6),
     user VARCHAR(30)
);

-- LOG 3
CREATE TABLE log_pais(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_country VARCHAR(20) NOT NULL,
    change_dollar FLOAT DEFAULT 1,
    date TIMESTAMP,
    state VARCHAR(6),
    user VARCHAR(30)
);

-- LOG 4
CREATE TABLE log_descuento(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	discount_id INT,
    discount_name VARCHAR(30),
    service_name VARCHAR(30),
    expiration_date DATE,
    date TIMESTAMP,
    state VARCHAR(6),
    user VARCHAR(30)
);

-- LOG 5
CREATE TABLE log_usuario(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(8) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    age INT NOT NULL,
    nationality VARCHAR(5) NOT NULL,
    email VARCHAR(50) NOT NULL,
    date TIMESTAMP NOT NULL,
    state VARCHAR(6) NOT NULL,
    user VARCHAR(30)
);

-- LOG 6
CREATE TABLE log_cuenta(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    user VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    card_number VARCHAR(30) NOT NULL,
    date TIMESTAMP NOT NULL,
    state VARCHAR(6) NOT NULL,
    user_1 VARCHAR(30)
);

-- LOG 7
CREATE TABLE log_tarjeta(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    card_number VARCHAR(30),
    bank_name VARCHAR(50),
    dni VARCHAR(8),
    extension INT,
    expiration_date DATE,
    date_operation TIMESTAMP,
    state VARCHAR(6),
    user VARCHAR(30)
);

-- ***********************************************************************************
-- TABLA 1
INSERT INTO servicio (service_name, type_service, price, plataform)
VALUES
    ('Platzi', 'Educacion', 2.99, 'Web'),
    ('Udemy', 'Educacion', 14.99, 'Web'),
    ('YoutubeMusic', 'Streaming', 7.99, 'Web'),
    ('Spotify', 'Streaming', 5.99, 'Web, Pc, Movil, Tv'),
    ('Netflix', 'Streaming', 20, 'Web, Pc, Movil, Tv'),
    ('Dropbox', 'Nube', 11.99, 'Web, Pc, Movil'),
    ('Drive', 'Nube', 2.99, 'Web, Movil'),
    ('Mega', 'Nube', 5.44, 'Web, Movil, Pc'),
    ('SoundCloud', 'Streaming', 12, 'Web'),
    ('HBOMAX', 'Streaming', 14.99, 'Web, Movil, Tv')
    ;
-- TABLA 2
INSERT INTO pais (id_country, name_country, currency, change_dollar)
VALUES
	('ARG','Argentina','Peso AR',189.14),
    ('MEX','Mexico','Peso MX',19.17),
    ('BR','Brasil','Real',5.15),
    ('COL','Colombia','Peso CL',4714.27),
    ('CR','Costa Rica','CRC',566.86),
    ('ESP','Espania','Euro',0.93),
    ('USA','Estados Unidos','U$D',1),
    ('UY','Uruguay','Peso UY',39.13)
    ;
-- TABLA 3
INSERT INTO usuario (dni, first_name, last_name, age, nationality, email_user) 
VALUES
	(39458059, 'Rosalyn','Matthams',17, 'ARG','rosalyn_matthams@gmail.com'),
	(39681299,'Miguel','Boyce',19, 'MEX','miguel_boyce@gmail.com'),
	(44570437,'Refugio','Reynolds',23, 'CR','refugio_reynolds@outlook.com'),
	(39559124,'Hilde','Milene',25, 'ESP','hilde_milne@protonmail.com'),
	(40589745,'Ardell','Samuels',20, 'USA','ardell_samuels@mail.com'),
	(44165687,'Lissette','Silva',23, 'UY','lissette_silva@yandex.com'),
	(43900273,'Tasia','Lloyd',15, 'MEX','tasia_lloyd@hotmail.com'),
    (42754535,'Albertina','Redman',15, 'BR','albertina_redman@yahoo.com'),
    (43296287,'Levi','West',29, 'BR','levi_west@yandex.com'),
	(44419722,'Kelli','Brett',15, 'COL','kelli_brett@protonmail.com'),
	(39478272,'Maynard','Penn',16, 'ESP','maynard_penn@aol.com')
    ;

-- TABLA 4
INSERT INTO tarjeta( card_number, bank_name, security_code, expiration_date, type_card, first_name, last_name, dni, extension)
VALUES
	('4201-6811-9381-2100', 'BBVA', 847, '2024-08-01', 'VISA', 'Rosalyn', 'Matthams', 39458059, 1),
    ('5030-6937-1756-2651', 'Wizink', 414, '2026-11-01', 'MASTERCARD', 'Miguel', 'Boyce', 39681299, 0),
    ('4204-2672-6934-7929', 'Banco Sabadell', 427, '2024-05-01', 'VISA', 'Refugio', 'Reynolds', 44570437, 0),
    ('5086-3467-5068-2166', 'Banco Santander', 324, '2026-09-01', 'MASTERCARD', 'Hilde', 'Milene', 39559124, 0),
    ('5025-8381-1770-9900', 'Banco Sabadell', 209, '2027-08-01', 'MASTERCARD', 'Ardell', 'Samuels', 40589745, 0),
    ('4146-7691-1911-4632', 'BBVA', 801, '2025-11-01', 'VISA', 'Lissette', 'Silva', 44165687, 0),
    ('3597-7985-3560-3668', 'American Express Bank', 317, '2027-06-01', 'EXPRESS', 'Tasia', 'Lloyd', 43900273, 1),
    ('3536-8288-6563-3243', 'American Express Bank', 635, '2027-06-01', 'EXPRESS', 'Albertina', 'Redman', 42754535, 1),
    ('4953-1354-8126-0076', 'Evo Banco', 087, '2028-10-01', 'VISA', 'Levi', 'West', 43296287, 0),
    ('3546-9540-5360-2564', 'American Express Bank', 079, '2028-04-01', 'EXPRESS', 'Kelli', 'Brett', 44419722, 1),
    ('5317-6612-0661-0764', 'Wizink', 138, '2027-02-01', 'MASTERCARD', 'Maynard', 'Penn', 39478272, 1)
    ;

-- TABLA 5
INSERT INTO cuenta ( email_user, user, password, card_number, service_name, type_service)
VALUES
	('maynard_penn@aol.com', 'maybard_penn', 'NAtontLeAMil', '5317-6612-0661-0764', 'Platzi', 'Educacion'), 
    ('kelli_brett@protonmail.com', 'BrettKel', 'bUtMATINdo', '3546-9540-5360-2564', 'SoundCloud', 'Streaming'), 
    ('hilde_milne@protonmail.com', 'milnehilde', 'stOrANIaNc', '5086-3467-5068-2166', 'Drive', 'Nube'),
    ('hilde_milne@protonmail.com', 'milnehilde', 'PIRflAtegI', '5086-3467-5068-2166', 'YoutubeMusic', 'Streaming'),
    ('levi_west@yandex.com', 'wevi', 'ArDAbcarIN', '4953-1354-8126-0076', 'HBOMAX', 'Streaming'),
    ('levi_west@yandex.com', 'levi_west', 'ComPEneriL', '4953-1354-8126-0076', 'Udemy', 'Educacion'),
    ('miguel_boyce@gmail.com', 'boycemig', 'opyaNAnETA', '5030-6937-1756-2651', 'HBOMAX', 'Streaming'),
    ('lissette_silva@yandex.com', 'Silvalissette', 'oUgeNdRaPO', '4146-7691-1911-4632', 'Dropbox', 'Nube'),
    ('refugio_reynolds@outlook.com', NULL, 'nfiRsTICEo', '4204-2672-6934-7929', 'Mega', 'Nube'),
    ('rosalyn_matthams@gmail.com', 'mattrosa', 'RpSEdGeNta', '4201-6811-9381-2100', 'Spotify', 'Streaming'),
	('ardell_samuels@mail.com', NULL, 'acaNTAwmaTiv', '5025-8381-1770-9900', 'Mega', 'Nube'), 
	('albertina_redman@yahoo.com', 'albertinaman', 'escUBsIBluSc', '3536-8288-6563-3243', 'Spotify', 'Streaming'), 
	('ardell_samuels@mail.com', 'elsard', 'teRnaPORnOrM', '5025-8381-1770-9900', 'Spotify', 'Streaming'), 
	('albertina_redman@yahoo.com', 'albertina_redman', 'CASpiSeCieSt', '3536-8288-6563-3243', 'Platzi', 'Educacion'), 
	('tasia_lloyd@hotmail.com', NULL, 'cTiaLdUMPReC', '3597-7985-3560-3668', 'SoundCloud', 'Streaming') 
    ;

-- TABLA 6
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

-- TABLA 7
INSERT INTO reclamo ( id_user, date, description)
VALUES
    (1, '2021-11-16', 'No se acredito mi suscripcion'),
    (12, '2022-12-23', 'Caidas intermitentes en el servicio'),
    (7, '2022-11-24', 'No es lo que esperaba'),
    (9, '2022-07-06', 'Catalogo reducido y no cuenta con proteccion para menores')
    ;

-- TABLA 8
INSERT INTO sistema_operativo (so_name, so_version) 
VALUES
    ('Windows_8.1','6.3'),
    ('Windows_10','22h2'),
    ('Windows_11','22h2'),
    ('MAC_OS_Mojave','10.14'),
    ('MAC_OS_Catalina','10.15'),
    ('Android_11','11'),
    ('Android_12L','12.1'),
    ('Android_13','13'),
    ('¡OS_12','12.5.5'),
    ('¡OS_13','13.7')
    ;

-- TABLA 9
INSERT INTO plataforma( plataform, id_user, so_name, resolution)
VALUES
    ('Movil', 1, '¡OS_13', '720X1280'),
    ('Movil', 2, 'Android_12L', '720X1280'),
    ('Web', 3, 'MAC_OS_Mojave', NULL),
    ('Tv', 4, 'Android_13', '3840X2160'),
    ('Movil', 5, 'Android_11', '720X1280'),
    ('Tv', 6, 'Android_12L', '3840X2160'),
    ('Movil', 7, '¡OS_12', '720X1280'),
    ('Pc', 8, 'Windows_11', '1920X1080'),
    ('Pc', 9, 'MAC_OS_Catalina', '1920X1080'),
    ('Pc', 10, 'Windows_11', '1920X1080'),
    ('Tv', 11, 'Android_12L', NULL),
	('Pc', 12, 'Windows_11', '1920X1080'),
    ('Pc', 13, 'MAC_OS_Catalina', '1920X1080'),
    ('Pc', 14, 'Windows_11', '1920X1080'),
    ('Tv', 15, 'Android_12L', NULL)
    ;
    
-- TABLA 10
INSERT INTO descuento (discount_id, id_user, discount_name, service_name, expiration_date, description)
VALUES
    (181, 1, 'REINTEGRO35%', 'Platzi', '2022-12-04', '35% reintegro con la suscripcion de un anio'),
    (126, 3, '50%OFF', 'Soundcloud', '2022-01-04', '50% OFF en el segundo mes'),
    (152, 4, '25%DESCUENTO', 'Drive', '2022-12-02', '25% descuento'),
    (117, 5, 'MESGRATIS', 'YoutubeMusic', '2021-02-18', 'Primer mes GRATIS'),
    (121, 8, 'MESESPRUEBA', 'HBOMAX', '2022-09-27', 'Tres meses de PRUEBA'),
    (171, 1, '50%OFFEN1ANIO', 'Udemy', '2022-11-26', '50% OFF pagando un anio'),
    (168, 15, 'HBOMAXGRATIS', 'HBOMAX', '2022-02-12', 'Suscripcion gratis en HBO MAX por un mes'),
    (140, 11, 'REINTEGRO40%', 'Dropbox', '2022-05-22', 'Reintegro del 40% de tu suscripcion'),
    (158, 2, '10%DESCUENTO', 'Mega', '2022-01-16', '10% de descuento'),
    (191, 4, '65%OFF', 'Spotify', '2021-03-25', '65% OFF en seis meses')
    ;
-- ************************************************************************************************************************
-- VIEW 1
CREATE VIEW vw_discount AS
SELECT 
	D.discount_name AS Name,
	D.description AS Description,
    D.service_name AS Service,
    S.plataform AS Plataform
FROM descuento AS D
INNER JOIN servicio AS S ON
(D.service_name = S.service_name);

-- VIEW 2
CREATE VIEW vw_claim AS
SELECT
	R.claim_id AS ClaimId,
    R.description AS Descripcion,
    C.email_user AS Email, 
    P.payment_code AS PaymentCode,
    C.service_name AS Service 
FROM reclamo AS R
INNER JOIN cuenta AS C ON
(R.id_user = C.id_user)
INNER JOIN pago AS P ON
(R.id_user = P.id_user);

-- VIEW 3
CREATE VIEW vw_user AS
SELECT
	U.first_name AS Name,
    U.email_user AS Email,
    C.service_name AS Service
FROM usuario AS U
INNER JOIN tarjeta AS T ON
(U.dni = T.dni)
INNER JOIN cuenta AS C ON
(T.card_number = C.card_number)
WHERE C.service_name = 'Spotify';

-- VIEW 4
CREATE VIEW vw_plataform AS
SELECT
	C.user AS User,
    C.email_user AS Email,
    P.plataform AS Plataform,
    P.resolution AS Resolution
FROM plataforma AS P
INNER JOIN cuenta AS C ON
(P.id_user = C.id_user)
WHERE P.plataform LIKE '%Movil%';

-- VIEW 5
CREATE VIEW vw_acount AS
SELECT
	C.user AS User,
    C.service_name AS Service,
    T.type_card AS TypeCard,
    T.bank_name AS Bank,
    T.extension AS Extension
FROM cuenta AS C
INNER JOIN tarjeta AS T ON
(C.card_number = T.card_number)
WHERE T.extension = 0;

-- VIEW 6
CREATE VIEW vw_payment AS
select
	P.payment_code,
    C.email_user,
    C.service_name
 from pago AS P
 INNER JOIN cuenta AS C ON
 (P.id_user = C.id_user);
-- ****************************************************************************************************
-- FUNCTION 1
DELIMITER $$
CREATE FUNCTION fc_price (service_name_param VARCHAR(30)) RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE result_price FLOAT;
    SELECT
	price INTO result_price
	FROM servicio
	WHERE service_name = service_name_param;
	RETURN result_price;
END
$$

-- FUNCTION 2
DELIMITER $$
CREATE FUNCTION fc_user (dni_param VARCHAR(8)) RETURNS VARCHAR(60)
DETERMINISTIC
BEGIN
	DECLARE complet_name VARCHAR(60);
    SELECT
		CONCAT(first_name,' ', last_name) INTO complet_name
	FROM usuario
    WHERE dni = dni_param;
    RETURN complet_name;
END
$$

-- FUNCTION 3
DELIMITER $$
CREATE FUNCTION fc_suscription (service_name_param VARCHAR(30),monts_param INT, country_param VARCHAR(5)) RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE total FLOAT;
    DECLARE currency FLOAT;
    SELECT
		price INTO total
	FROM servicio
    WHERE service_name = service_name_param;
    SELECT
		change_dollar INTO currency
	FROM pais
    WHERE id_country = country_param;
    SET total  = (total * currency)* monts_param;
    RETURN ROUND(total, 2);
END
$$

-- FUNCTION 4
CREATE FUNCTION fc_dollar (country_param VARCHAR(5)) RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE dollar FLOAT;
    SELECT
		change_dollar INTO dollar
	FROM pais
    WHERE id_country = country_param;
    
    RETURN ROUND(dollar, 2);
END
$$

-- FUNCTION 5
CREATE FUNCTION fc_associated_card (dni_param VARCHAR(8)) RETURNS VARCHAR (30)
DETERMINISTIC
BEGIN
	DECLARE verify INT;
    DECLARE conclusion VARCHAR(30);
    SELECT
		COUNT(T.card_number) INTO verify
	FROM usuario AS U
    INNER JOIN tarjeta AS T 
    ON (U.dni = T.dni)
    WHERE U.dni = dni_param;
    
    IF verify > 0 THEN
		SET conclusion = 'This user has associated cards';
    ELSE
		SET conclusion = 'This user has no associated cards';
	END IF;
    RETURN conclusion;
END
$$

-- ************************************************************************************************
-- STORE PROCEDURE 1
DELIMITER $$
CREATE PROCEDURE sp_exist_acount (IN id_param INT)
BEGIN
	DECLARE clausula INT;
    SELECT COUNT(*) INTO clausula FROM cuenta;
	IF id_param <= clausula THEN
		SELECT
			email_user AS Email,
            user AS User,
            service_name AS Service,
            type_service AS Type
		FROM cuenta
		WHERE id_user = id_param;
    ELSE
		SELECT 'This user not exist.' AS Warning;
	END IF;
END
$$

-- STORE PROCEDURE 2
DELIMITER $$
CREATE PROCEDURE sp_new_claim (IN id_user_param INT, date_param DATE, description_param VARCHAR(200))
BEGIN
	INSERT INTO reclamo (id_user, date, description)
	VALUES	(id_user_param, date_param, description_param);
    SELECT * FROM reclamo;
END
$$

-- STORE PROCEDURE 3
DELIMITER $$
CREATE PROCEDURE sp_new_servicio (IN service_name_param VARCHAR(30), type_service_param VARCHAR(30), price_param FLOAT, plataform_param VARCHAR(30))
BEGIN
	DECLARE usuario VARCHAR(30);
    SELECT USER() INTO usuario;
	IF  usuario = 'senior@localhost' THEN
		INSERT INTO servicio (service_name, type_service, price, plataform)
		VALUES	(service_name_param, type_service_param, price_param, plataform_param);
		SELECT * FROM servicio;
    ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END
$$

-- STORED PROCEDURE 4
DELIMITER $$
CREATE PROCEDURE sp_update_price_servicio (IN service_name_param VARCHAR(30), price_param FLOAT)
BEGIN
	DECLARE verify INT;
    SELECT COUNT(service_name) INTO verify FROM servicio WHERE service_name = service_name_param;
    IF verify = 1 THEN
		UPDATE servicio
        SET price = price_param
        WHERE service_name = service_name_param;
        
        SELECT * FROM servicio
       WHERE service_name = service_name_param;
    ELSE
		SELECT "This service not exist." AS Warning;
    END IF;
END
$$

-- STORED PRODCEDURE 5
DELIMITER $$
CREATE PROCEDURE sp_delete_servicio (IN service_name_param VARCHAR(30))
BEGIN
    DECLARE usuario VARCHAR(30);
    SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		DELETE FROM servicio
		WHERE service_name = service_name_param;
		SELECT * FROM servicio;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END
$$

-- STORE PROCEDURE 6
DELIMITER $$
CREATE PROCEDURE sp_new_pais (IN id_country_param VARCHAR(5), name_country_param VARCHAR(20), currency_param VARCHAR(10), change_dollar_param FLOAT)
BEGIN
	DECLARE usuario VARCHAR(30);
    SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		INSERT INTO pais (id_country, name_country, currency, change_dollar)
		VALUES	(id_country_param, name_country_param, currency_param, change_dollar_param);
		SELECT * FROM pais;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END
$$

-- STORED PROCEDURE 7
DELIMITER $$
CREATE PROCEDURE sp_update_change_dollar_pais (IN id_country_param VARCHAR(5), dollar_param FLOAT)
BEGIN
	DECLARE verify INT;
	DECLARE usuario VARCHAR(30);
    SELECT count(*) INTO verify FROM pais WHERE id_country = id_country_param;
    SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		IF verify = 1 THEN
			UPDATE pais
			SET change_dollar = dollar_param
			WHERE id_country = id_country_param;
			
			SELECT * FROM pais
			WHERE id_country = id_country_param;
			
		ELSE
			SELECT 'The country not exist.' AS Warning;
		END IF;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END    
$$
-- STORED PROCEDURE 8
DELIMITER $$
CREATE PROCEDURE sp_delete_pais (IN id_country_param VARCHAR(30))
BEGIN
	DECLARE usuario VARCHAR(30);
	SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		DELETE FROM pais
		WHERE id_country = id_country_param;
		SELECT * FROM pais;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END
$$

-- STORE PROCEDURE 9
DELIMITER $$
CREATE PROCEDURE sp_new_descuento (IN discount_id_param INT, id_user_param INT, discount_name_param VARCHAR(30),
	service_name_param VARCHAR(30), expiration_date_param DATE, description_param VARCHAR(200))
BEGIN
	INSERT INTO descuento (discount_id, id_user, discount_name, service_name, expiration_date, description)
	VALUES	(discount_id_param, id_user_param, discount_name_param,
		service_name_param , expiration_date_param, description_param);
    SELECT * FROM descuento;
END
$$

-- STORED PROCEDURE 10
DELIMITER $$
CREATE PROCEDURE sp_update_expiration_date_descuento (IN discount_id_param INT, date_param DATE)
BEGIN
	DECLARE today DATE;
    SELECT expiration_date INTO today FROM descuento WHERE discount_id = discount_id_param;
    IF today < date_param THEN
		UPDATE descuento
        SET expiration_date = date_param
        WHERE discount_id =  discount_id_param;
        SELECT * FROM descuento
        WHERE discount_id = discount_id_param;
    ELSE
		SELECT "This date not is valid" AS Warning;
    END IF;
END
$$

-- STORED PRODCEDURE 11
DELIMITER $$
CREATE PROCEDURE sp_delete_descuento ()
BEGIN
	DECLARE today DATE;
    SET today = current_date();
    DELETE FROM descuento
    WHERE expiration_date < today;
END
$$

-- STORE PROCEDURE 12
DELIMITER $$
CREATE PROCEDURE sp_new_usuario (IN dni_param VARCHAR(8), first_name_param VARCHAR(20), last_name_param VARCHAR(20),
	age_param INT, nationality_param VARCHAR(5), email_user_param VARCHAR(50))
BEGIN
	DECLARE usuario VARCHAR(30);
	SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		INSERT INTO usuario (dni, first_name, last_name, age, nationality, email_user) 
		VALUES
			(dni_param, first_name_param, last_name_param, age_param, nationality_param, email_user_param);
		SELECT * FROM usuario;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END
$$

-- STORED PROCEDURE 13
DELIMITER $$
CREATE PROCEDURE sp_update_age_usuario (IN dni_param VARCHAR(8), age_param INT)
BEGIN
	DECLARE verify INT;
    SELECT count(dni) INTO verify FROM usuario WHERE dni = dni_param;
    IF verify = 1 THEN
		UPDATE usuario
        SET age = age_param
        WHERE dni =  dni_param;
        SELECT * FROM usuario
        WHERE dni =  dni_param;
    ELSE
		SELECT "This user not is exist" AS Warning;
    END IF;
END
$$

-- STORED PROCEDURE 14
DELIMITER $$
CREATE PROCEDURE sp_update_email_usuario (IN dni_param VARCHAR(8), email_param VARCHAR(50))
BEGIN
	DECLARE verify INT;
    SELECT count(dni) INTO verify FROM usuario WHERE dni = dni_param;
    IF verify = 1 THEN
		UPDATE usuario
        SET email_user = email_param
        WHERE dni =  dni_param;
        SELECT * FROM usuario
        WHERE dni =  dni_param;
    ELSE
		SELECT "This user not is exist" AS Warning;
    END IF;
END
$$

-- STORED PRODCEDURE 15
DELIMITER $$
CREATE PROCEDURE sp_delete_usuario (IN dni_param VARCHAR(8))
BEGIN
	DECLARE usuario VARCHAR(30);
	SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		DELETE FROM usuario
		WHERE dni = dni_param;
		SELECT * FROM usuario;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END
$$

-- STORE PROCEDURE 16
DELIMITER $$
CREATE PROCEDURE sp_new_cuenta (IN email_param VARCHAR(50), user_param VARCHAR(30), password_param VARCHAR(30),
	card_number_param VARCHAR(30), service_name_param VARCHAR(30), type_service_param VARCHAR(30))
BEGIN
	INSERT INTO cuenta (email_user, user, password, card_number, service_name, type_service) 
	VALUES
		(email_param , user_param , password_param , card_number_param , service_name_param , type_service_param);
    SELECT * FROM cuenta;
END
$$

-- STORED PROCEDURE 17
DELIMITER $$
CREATE PROCEDURE sp_update_email_cuenta (IN id_param INT, email_param VARCHAR(50))
BEGIN
	DECLARE verify INT;
    SELECT count(id_user) INTO verify FROM cuenta WHERE id_user = id_param;
    IF verify = 1 THEN
		UPDATE cuenta
        SET email_user = email_param
        WHERE id_user =  id_param;
        SELECT * FROM cuenta
           WHERE id_user =  id_param;
    ELSE
		SELECT "This acount not exist" AS Warning;
    END IF;
END
$$

-- STORED PROCEDURE 18
DELIMITER $$
CREATE PROCEDURE sp_update_user_cuenta (IN id_param INT, user_param VARCHAR(20))
BEGIN
	DECLARE verify INT;
    SELECT count(id_user) INTO verify FROM cuenta WHERE id_user = id_param;
    IF verify = 1 THEN
		UPDATE cuenta
        SET user = user_param
        WHERE id_user =  id_param;
        SELECT * FROM cuenta
           WHERE id_user =  id_param;
    ELSE
		SELECT "This acount not exist" AS Warning;
    END IF;
END
$$

-- STORED PROCEDURE 19
DELIMITER $$
CREATE PROCEDURE sp_update_password_cuenta (IN id_param INT, password_param VARCHAR(20))
BEGIN
	DECLARE verify INT;
    DECLARE usuario VARCHAR(30);
    SELECT count(id_user) INTO verify FROM cuenta WHERE id_user = id_param;
	SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		IF verify = 1 THEN
			UPDATE cuenta
			SET password = password_param
			WHERE id_user =  id_param;
			SELECT * FROM cuenta
			   WHERE id_user =  id_param;
		ELSE
			SELECT "This acount not exist" AS Warning;
		END IF;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END
$$

-- STORED PROCEDURE 20
DELIMITER $$
CREATE PROCEDURE sp_update_card_number_cuenta (IN id_param INT, card_number_param VARCHAR(30))
BEGIN
	DECLARE verify_card INT;
    DECLARE verify INT;
    DECLARE usuario VARCHAR(30);
    SELECT count(card_number) INTO verify_card FROM tarjeta WHERE card_number = card_number_param;
    SELECT count(id_user) INTO verify FROM cuenta WHERE id_user = id_param;
    SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		IF verify_card = 1 AND verify = 1 THEN
			UPDATE cuenta
			SET card_number = card_number_param
			WHERE id_user =  id_param;
			SELECT * FROM cuenta
			WHERE id_user =  id_param;
		END IF;
		IF verify_card = 0 AND verify = 0 THEN
			SELECT 'Acount and Card not exist.' AS Warning;
			ELSE 
				IF verify_card = 1 AND verify = 0 THEN
					SELECT 'Acount not exist.' AS Warning;
					ELSE 
						IF verify_card = 0 AND verify = 1 THEN
							SELECT 'Card not exist.' AS Warning;
						END IF;
					END IF;
				END IF;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END
$$

-- STORED PRODCEDURE 21
DELIMITER $$
CREATE PROCEDURE sp_delete_cuenta (IN id_param INT)
BEGIN
	DECLARE usuario VARCHAR(30);
    SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		DELETE FROM cuenta
		WHERE id_user = id_param;
		SELECT * FROM cuenta;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;
END
$$

-- STORE PROCEDURE 22
DELIMITER $$
CREATE PROCEDURE sp_new_tarjeta (IN card_number_param VARCHAR(30), bank_name_param VARCHAR(50), security_code_param INT, expiration_date_param DATE,type_card_param VARCHAR(30), first_name_param VARCHAR(20), last_name_param VARCHAR(20), dni_param VARCHAR(8), extension_param INT)
BEGIN
    DECLARE verify INT;
    SELECT COUNT(*) INTO verify FROM tarjeta WHERE card_number = card_number_param;
    
    IF verify = 0 THEN
		INSERT INTO tarjeta  (card_number, bank_name, security_code, expiration_date, type_card, first_name, last_name, dni, extension)
		VALUES
			(card_number_param, bank_name_param, security_code_param,
			expiration_date_param, type_card_param, first_name_param, last_name_param, dni_param, extension_param);
		SELECT * FROM tarjeta;
	ELSE
		SELECT 'Tarjeta is already exist' AS WARNING;
	END IF;
END
$$

-- STORED PRODCEDURE 23
DELIMITER $$
CREATE PROCEDURE sp_delete_tarjeta (IN card_number_param VARCHAR(30))
BEGIN
	DECLARE usuario VARCHAR(30);
    SELECT USER() INTO usuario;
    IF usuario = 'senior@localhost' THEN
		DELETE FROM tarjeta
		WHERE card_number = card_number_param;
		SELECT * FROM tarjeta;
	ELSE
		SELECT 'Access denied' AS Warning;
	END IF;	
END
$$

-- STORED PROCEDURE 24
DELIMITER $$
CREATE PROCEDURE sp_cards (IN dni_param VARCHAR(8))
BEGIN
	DECLARE usuarios INT;
    SELECT COUNT(dni) INTO usuarios FROM usuario WHERE dni = dni_param;
    
	IF usuarios = 1 THEN
		SELECT
			*
		FROM tarjeta AS T
		WHERE T.dni = dni_param;
    ELSE
		SELECT 'This user not exist.' AS Warning;
	END IF;
END
$$
-- **************************************************************************************************************
-- TRIGGER 1
DELIMITER $$
CREATE TRIGGER tr_insert_new_pay_after
AFTER INSERT ON pago
FOR EACH ROW
BEGIN
	INSERT INTO log_pay (payment_code, id_user, pay_day,user)
    VALUES (NEW.payment_code, NEW.id_user, current_timestamp(), USER());
END
$$

-- TRIGGER 2
DELIMITER $$
CREATE TRIGGER tr_insert_new_service_after
AFTER INSERT ON servicio
FOR EACH ROW
BEGIN
	INSERT INTO log_service (service_name, price, date, state, user)
    VALUES (NEW.service_name, NEW.price, current_timestamp(), 'INSERT', USER());
END
$$

-- TRIGGER 3
DELIMITER $$
CREATE TRIGGER tr_update_price_service_before
BEFORE UPDATE ON servicio
FOR EACH ROW
BEGIN
	INSERT INTO log_service (service_name, price, date, state, user)
    VALUES (OLD.service_name, OLD.price, current_timestamp(), 'UPDATE', USER());
END
$$

-- TRIGGER 4
DELIMITER $$
CREATE TRIGGER tr_delete_service_before
BEFORE DELETE ON servicio
FOR EACH ROW
BEGIN
	INSERT INTO log_service (service_name, price, date, state, user)
    VALUES (OLD.service_name, OLD.price, current_timestamp(), 'DELETE', USER());
END
$$

-- TRIGGER 5
DELIMITER $$
CREATE TRIGGER tr_insert_new_pais_after
AFTER INSERT ON pais
FOR EACH ROW
BEGIN
	INSERT INTO log_pais (name_country, change_dollar, date, state, user)
    VALUES (NEW.name_country, NEW.change_dollar, current_timestamp(), 'INSERT', USER());
END
$$

-- TRIGGER 6
DELIMITER $$
CREATE TRIGGER tr_update_old_dollar_pais_before
BEFORE UPDATE ON pais
FOR EACH ROW
BEGIN
	INSERT INTO log_pais (name_country, change_dollar, date, state, user)
    VALUES (OLD.name_country, OLD.change_dollar, current_timestamp(), 'UPDATE', USER());
END
$$

-- TRIGGER 7
DELIMITER $$
CREATE TRIGGER tr_delete_pais_before
BEFORE DELETE ON pais
FOR EACH ROW
BEGIN
		INSERT INTO log_pais (name_country, change_dollar, date, state, user)
    VALUES (OLD.name_country, OLD.change_dollar, current_timestamp(), 'DELETE', USER());
END
$$

-- TRIGGER 8
DELIMITER $$
CREATE TRIGGER tr_insert_new_descuento_after
AFTER INSERT ON descuento
FOR EACH ROW
BEGIN
	INSERT INTO log_descuento (discount_id, discount_name, service_name, expiration_date, date, state, user)
    VALUES (NEW.discount_id, NEW.discount_name, NEW.service_name, NEW.expiration_date, current_timestamp(),'INSERT', USER());
END
$$

-- TRIGGER 9
DELIMITER $$
CREATE TRIGGER tr_update_expiration_date_descuento_before
BEFORE UPDATE ON descuento
FOR EACH ROW
BEGIN
	INSERT INTO log_descuento (discount_id, discount_name, service_name, expiration_date, date, state, user)
    VALUES (OLD.discount_id, OLD.discount_name, OLD.service_name, OLD.expiration_date, current_timestamp(),'UPDATE', USER());
END
$$

-- TRIGGER 10
DELIMITER $$
CREATE TRIGGER tr_delete_descuento_before
BEFORE DELETE ON descuento
FOR EACH ROW
BEGIN
	INSERT INTO log_descuento (discount_id, discount_name, service_name, expiration_date, date, state, user)
    VALUES (OLD.discount_id, OLD.discount_name, OLD.service_name, OLD.expiration_date, current_timestamp(),'DELETE', USER());
END
$$

-- TRIGGER 11
DELIMITER $$
CREATE TRIGGER tr_insert_new_usuario_after
AFTER INSERT ON usuario
FOR EACH ROW
BEGIN
	INSERT INTO log_usuario (dni, first_name, last_name, age, nationality, email, date, state, user)
    VALUES (NEW.dni, NEW.first_name, NEW.last_name, NEW.age, NEW.nationality, NEW.email_user, current_timestamp(), 'INSERT', USER());
END
$$

-- TRIGGER 12
DELIMITER $$
CREATE TRIGGER tr_update_usuario_before
BEFORE UPDATE ON usuario
FOR EACH ROW
BEGIN
	INSERT INTO log_usuario (dni, first_name, last_name, age, nationality, email, date, state, user)
    VALUES (OLD.dni, OLD.first_name, OLD.last_name, OLD.age, OLD.nationality, OLD.email_user, current_timestamp(), 'UPDATE', USER());
END
$$

-- TRIGGER 13
DELIMITER $$
CREATE TRIGGER tr_delete_usuario_before
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
	INSERT INTO log_usuario (dni, first_name, last_name, age, nationality, email, date, state, user)
    VALUES (OLD.dni, OLD.first_name, OLD.last_name, OLD.age, OLD.nationality, OLD.email_user, current_timestamp(), 'DELETE', USER());
END
$$

-- TRIGGER 14
DELIMITER $$
CREATE TRIGGER tr_insert_new_cuenta_after
AFTER INSERT ON cuenta
FOR EACH ROW
BEGIN
	INSERT INTO log_cuenta (email, user, password, card_number, date, state, user_1)
    VALUES (NEW.email_user,NEW.user, NEW.password, NEW.card_number, current_timestamp(), 'INSERT', USER());
END
$$

-- TRIGGER 15
DELIMITER $$
CREATE TRIGGER tr_update_cuenta_before
BEFORE UPDATE ON cuenta
FOR EACH ROW
BEGIN
	INSERT INTO log_cuenta (email, user, password, card_number, date, state, user_1)
    VALUES (OLD.email_user, OLD.user, OLD.password, OLD.card_number, current_timestamp(), 'UPDATE', USER());
END
$$

-- TRIGGER 16
DELIMITER $$
CREATE TRIGGER tr_delete_cuenta_before
BEFORE DELETE ON cuenta
FOR EACH ROW
BEGIN
	INSERT INTO log_cuenta (email, user, password, card_number, date, state, user_1)
    VALUES (OLD.email_user, OLD.user, OLD.password, OLD.card_number, current_timestamp(), 'DELETE', USER());
END
$$

-- TRIGGER 17
DELIMITER $$
CREATE TRIGGER tr_insert_new_tarjeta_after
AFTER INSERT ON tarjeta
FOR EACH ROW
BEGIN
	INSERT INTO log_tarjeta (card_number, bank_name, dni, extension, expiration_date, date_operation, state, user)
    VALUES (NEW.card_number, NEW.bank_name, NEW.dni, NEW.extension, NEW.expiration_date, current_timestamp(), 'INSERT', USER());
END
$$

-- TRIGGER 18
DELIMITER $$
CREATE TRIGGER tr_delete_tarjeta_before
BEFORE DELETE ON tarjeta
FOR EACH ROW
BEGIN
	INSERT INTO log_tarjeta (card_number, bank_name, dni, extension, expiration_date, date_operation, state, user)
    VALUES (OLD.card_number, OLD.bank_name, OLD.dni, OLD.extension, OLD.expiration_date, current_timestamp(), 'DELETE', USER());
END
$$
-- **************************************************************************************************************

-- Creacion de usuarios
CREATE USER 'usuario'@'localhost' IDENTIFIED BY 'usuario@1234';
    GRANT SELECT (email_user) ON tp_alconchel.cuenta TO 'usuario'@'localhost';
    GRANT SELECT (user) ON tp_alconchel.cuenta TO 'usuario'@'localhost';
    GRANT SELECT (service_name) ON tp_alconchel.cuenta TO 'usuario'@'localhost';
    GRANT SELECT (type_service) ON tp_alconchel.cuenta TO 'usuario'@'localhost';
    
    GRANT SELECT (discount_name) ON tp_alconchel.descuento TO 'usuario'@'localhost';
    GRANT SELECT (service_name) ON tp_alconchel.descuento TO 'usuario'@'localhost';
    GRANT SELECT (expiration_date) ON tp_alconchel.descuento TO 'usuario'@'localhost';
    GRANT SELECT (description) ON tp_alconchel.descuento TO 'usuario'@'localhost';
    
    GRANT SELECT ON tp_alconchel.vw_payment TO 'usuario'@'localhost';
    
    GRANT SELECT ON tp_alconchel.vw_claim TO 'usuario'@'localhost';
    
    GRANT SELECT ON tp_alconchel.servicio TO 'usuario'@'localhost';
    
    GRANT SELECT (card_number) ON tp_alconchel.tarjeta TO 'usuario'@'localhost';
    GRANT SELECT (bank_name) ON tp_alconchel.tarjeta TO 'usuario'@'localhost';
    GRANT SELECT (type_card) ON tp_alconchel.tarjeta TO 'usuario'@'localhost';
    GRANT SELECT (extension) ON tp_alconchel.tarjeta TO 'usuario'@'localhost';
	
    GRANT SELECT (first_name) ON tp_alconchel.usuario TO 'usuario'@'localhost';
    GRANT SELECT (age) ON tp_alconchel.usuario TO 'usuario'@'localhost';
    GRANT SELECT (nationality) ON tp_alconchel.usuario TO 'usuario'@'localhost';
    GRANT SELECT (email_user) ON tp_alconchel.usuario TO 'usuario'@'localhost';

-- Junior
CREATE USER 'junior'@'localhost' IDENTIFIED BY 'PasanteCoder';
	GRANT SELECT ON tp_alconchel.* TO 'junior'@'localhost';

-- Semi Senior
CREATE USER 'semi_senior'@'localhost' IDENTIFIED BY 'Lucas2334';
    GRANT CREATE  ON tp_alconchel.* TO 'semi_senior'@'localhost';
    GRANT ALTER ON tp_alconchel.* TO 'semi_senior'@'localhost';
    GRANT SELECT ON tp_alconchel.* TO 'semi_senior'@'localhost';
	GRANT INSERT ON tp_alconchel.* TO 'semi_senior'@'localhost';
    GRANT UPDATE ON tp_alconchel.* TO 'semi_senior'@'localhost';
    GRANT EXECUTE ON tp_alconchel.* TO 'semi_senior'@'localhost';
    GRANT CREATE VIEW ON tp_alconchel.* TO 'semi_senior'@'localhost';

-- Senior
CREATE USER 'senior'@'localhost' IDENTIFIED BY 'Jefedeproyecto';
	GRANT ALL ON tp_alconchel.* TO 'senior'@'localhost';
