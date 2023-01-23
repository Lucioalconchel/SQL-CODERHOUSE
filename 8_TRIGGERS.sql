CREATE TABLE log_price(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(30),
    price FLOAT,
    change_date TIMESTAMP
);

CREATE TABLE log_pay(
	payment_code VARCHAR(20) PRIMARY KEY,
    id_user INT,
    pay_day TIMESTAMP
);

-- ----------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER tr_update_old_price_before
BEFORE UPDATE ON servicio
FOR EACH ROW
BEGIN
	INSERT INTO log_price (service_name, price, change_date)
    VALUES (OLD.service_name, OLD.price, current_timestamp());
END
$$
-- -----------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER tr_insert_new_pay_after
AFTER INSERT ON pago
FOR EACH ROW
BEGIN
	INSERT INTO log_pay (payment_code, id_user, pay_day)
    VALUES (NEW.payment_code, NEW.id_user, current_timestamp());
END
$$
-- -----------------------------------------------------------------
-- Para probar los triggers esta lo siguiente:

-- tr_update_old_price_before
SELECT * FROM servicio;
SELECT * FROM log_price;

UPDATE servicio
	SET price = 20.19
WHERE service_name = 'Spotify';

SELECT * FROM servicio;
SELECT * FROM log_price;

-- tr_insert_new_pay_after
SELECT * FROM pago;
SELECT * FROM log_pay;

INSERT INTO pago( payment_code, id_user)
VALUES
	('B4H9JMZK', 3);
    
SELECT * FROM pago;
SELECT * FROM log_pay;
