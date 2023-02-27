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