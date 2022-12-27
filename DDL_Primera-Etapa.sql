CREATE TABLE usuario (
    email VARCHAR(50) NOT NULL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    service_count int NOT NULL
);

CREATE TABLE reclamo (
    claim_id int NOT NULL auto_increment PRIMARY KEY,
    email_user VARCHAR(50) NOT NULL,
    date DATE,
    description VARCHAR(200) NOT NULL,
    FOREIGN KEY (email_user) REFERENCES usuario(email)
);

CREATE TABLE pago(
    payment_code VARCHAR(20) NOT NULL PRIMARY KEY,
    email_user VARCHAR(50) NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    bank_name VARCHAR(50) ,
    service_name  VARCHAR(30) NOT NULL,
    FOREIGN KEY (email_user) REFERENCES usuario (email)
);

CREATE TABLE sistema_operativo(
    so_name VARCHAR(20) PRIMARY KEY,
    so_version VARCHAR(10)
);

CREATE TABLE plataforma(
    plataform VARCHAR(30) NOT NULL ,
    email_user VARCHAR(50) NOT NULL,
    so_name VARCHAR(20) NOT NULL,
    resolution VARCHAR(10),
    FOREIGN KEY (so_name) REFERENCES sistema_operativo (so_name),
    FOREIGN KEY (email_user) REFERENCES usuario (email)
);

CREATE TABLE servicio(
	service_name VARCHAR(30) PRIMARY KEY NOT NULL,
    type_service VARCHAR(30),
    plataform VARCHAR(30) NOT NULL
);

CREATE TABLE descuento(
   discount_id int NOT NULL PRIMARY KEY ,
    email_user VARCHAR(50) NOT NULL,
    discount_name VARCHAR(30),
    service_name VARCHAR(30) NOT NULL,
    expiration_date date NOT NULL,
    description VARCHAR(200) NOT NULL,
    FOREIGN KEY (email_user) REFERENCES usuario (email)
);