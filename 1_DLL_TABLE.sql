CREATE SCHEMA TP_ALCONCHEL;
USE TP_ALCONCHEL;

-- Tabla Servicio (1)
CREATE TABLE servicio(
	service_name VARCHAR(30) PRIMARY KEY NOT NULL,
    type_service VARCHAR(30),
    price float NOT NULL,
    plataform VARCHAR(30) NOT NULL
);
-- Tabla Usuario (2)
CREATE TABLE usuario(
	dni VARCHAR(8) NOT NULL PRIMARY KEY DEFAULT '99999999',
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    age int NOT NULL,
    email_user VARCHAR(50) NOT NULL
);
-- Tabla Tarjeta (3)
CREATE TABLE tarjeta(
	card_number VARCHAR(30) NOT NULL PRIMARY KEY,
    bank_name VARCHAR(50) NOT NULL,
    security_code INT NOT NULL,
    expiration_date date NOT NULL,
    type_card VARCHAR(30) NOT NULL DEFAULT 'Master Card',
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
    dni VARCHAR(8) NOT NULL DEFAULT '99999999',
    extension INT DEFAULT 0,
    FOREIGN KEY (dni) REFERENCES usuario (dni)
    );
-- Tabla Cuenta (4)
CREATE TABLE cuenta(
	id_user INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email_user VARCHAR(50) NOT NULL,
    user VARCHAR(30),
    password VARCHAR(30) NOT NULL,
    card_number VARCHAR(30) NOT NULL,
    service_name VARCHAR(30) NOT NULL,
    type_service VARCHAR(30),
    FOREIGN KEY (service_name) REFERENCES servicio (service_name),
    FOREIGN KEY (card_number) REFERENCES tarjeta (card_number)
);
-- Tabla pago (5)
CREATE TABLE pago(
    payment_code VARCHAR(20) NOT NULL PRIMARY KEY,
    id_user INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES cuenta (id_user)
);
-- Tabla Reclamo (6)
CREATE TABLE reclamo (
    claim_id int NOT NULL auto_increment PRIMARY KEY,
    id_user INT NOT NULL,
    date DATE,
    description VARCHAR(200) NOT NULL,
    FOREIGN KEY (id_user) REFERENCES cuenta (id_user)
);
-- Tabla Sistema Operativo (7)
CREATE TABLE sistema_operativo(
    so_name VARCHAR(20) NOT NULL PRIMARY KEY,
    so_version VARCHAR(10)
);
-- Tabla Plataforma (8)
CREATE TABLE plataforma(
    plataform VARCHAR(30) NOT NULL ,
    id_user INT NOT NULL,
    so_name VARCHAR(20) NOT NULL,
    resolution VARCHAR(10),
    FOREIGN KEY (so_name) REFERENCES sistema_operativo (so_name),
    FOREIGN KEY (id_user) REFERENCES cuenta (id_user)
);
-- Tabla Descuento (9)
CREATE TABLE descuento(
	discount_id int NOT NULL PRIMARY KEY ,
    id_user INT NOT NULL,
    discount_name VARCHAR(30),
    service_name VARCHAR(30) NOT NULL,
    expiration_date date NOT NULL,
    description VARCHAR(200) NOT NULL,
    FOREIGN KEY (id_user) REFERENCES cuenta (id_user),
    FOREIGN KEY (service_name) REFERENCES cuenta (service_name)
);