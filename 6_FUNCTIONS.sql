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
