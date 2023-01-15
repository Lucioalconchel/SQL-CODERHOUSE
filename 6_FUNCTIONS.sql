-- FUNCTION 1
DELIMITER $$
CREATE FUNCTION fc_price (service_name_param VARCHAR(30)) RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE result_price FLOAT;
    SELECT
	price INTO result_price
	FROM servicio
	WHERE service_name = 'YoutubeMusic';
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
