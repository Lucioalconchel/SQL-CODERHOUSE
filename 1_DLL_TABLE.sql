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
