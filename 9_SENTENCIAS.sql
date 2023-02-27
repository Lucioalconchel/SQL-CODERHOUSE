- Creacion de usuarios
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