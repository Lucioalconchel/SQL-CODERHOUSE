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