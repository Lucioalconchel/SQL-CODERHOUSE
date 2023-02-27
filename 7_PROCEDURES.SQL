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
	INSERT INTO servicio (service_name, type_service, price, plataform)
	VALUES	(service_name_param, type_service_param, price_param, plataform_param);
    SELECT * FROM servicio;
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
    DELETE FROM servicio
    WHERE service_name = service_name_param;
    SELECT * FROM servicio;
END
$$

-- STORE PROCEDURE 6
DELIMITER $$
CREATE PROCEDURE sp_new_pais (IN id_country_param VARCHAR(5), name_country_param VARCHAR(20), currency_param VARCHAR(10), change_dollar_param FLOAT)
BEGIN
	INSERT INTO pais (id_country, name_country, currency, change_dollar)
	VALUES	(id_country_param, name_country_param, currency_param, change_dollar_param);
    SELECT * FROM pais;
END
$$

-- STORED PROCEDURE 7
DELIMITER $$
CREATE PROCEDURE sp_update_change_dollar_pais (IN id_country_param VARCHAR(5), dollar_param FLOAT)
BEGIN
	DECLARE verify INT;
    SELECT count(*) INTO verify FROM pais WHERE id_country = id_country_param;
    IF verify = 1 THEN
		UPDATE pais
        SET change_dollar = dollar_param
        WHERE id_country = id_country_param;
        
        SELECT * FROM pais
        WHERE id_country = id_country_param;
        
    ELSE
		SELECT 'The country not exist.' AS Warning;
    END IF;
END    
$$

-- STORED PROCEDURE 8
DELIMITER $$
CREATE PROCEDURE sp_delete_pais (IN id_country_param VARCHAR(30))
BEGIN
    DELETE FROM pais
    WHERE id_country = id_country_param;
    SELECT * FROM pais;
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
	INSERT INTO usuario (dni, first_name, last_name, age, nationality, email_user) 
	VALUES
		(dni_param, first_name_param, last_name_param, age_param, nationality_param, email_user_param);
    SELECT * FROM usuario;
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
	DELETE FROM usuario
    WHERE dni = dni_param;
    SELECT * FROM usuario;
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
    SELECT count(id_user) INTO verify FROM cuenta WHERE id_user = id_param;
    IF verify = 1 THEN
		UPDATE cuenta
        SET password = password_param
        WHERE id_user =  id_param;
        SELECT * FROM cuenta
           WHERE id_user =  id_param;
    ELSE
		SELECT "This acount not exist" AS Warning;
    END IF;
END
$$
-- STORED PROCEDURE 20
DELIMITER $$
CREATE PROCEDURE sp_update_card_number_cuenta (IN id_param INT, card_number_param VARCHAR(30))
BEGIN
	DECLARE verify_card INT;
    DECLARE verify INT;
    SELECT count(card_number) INTO verify_card FROM tarjeta WHERE card_number = card_number_param;
    SELECT count(id_user) INTO verify FROM cuenta WHERE id_user = id_param;
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
END
$$

-- STORED PRODCEDURE 21
DELIMITER $$
CREATE PROCEDURE sp_delete_cuenta (IN id_param INT)
BEGIN
	DELETE FROM cuenta
    WHERE id_user = id_param;
    SELECT * FROM cuenta;
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
	DELETE FROM tarjeta
    WHERE card_number = card_number_param;
    SELECT * FROM tarjeta;
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