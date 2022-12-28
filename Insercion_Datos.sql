-- TABLA 1
INSERT INTO usuario VALUES
    ('rosalyn_matthams@gmail.com', 'Rosalyn','Matthams',3),
    ('miguel_boyce@gmail.com','Miguel','Boyce',1),
    ('refugio_reynolds@outlook.com','Refugio','Reynolds',5),
    ('hilde_milne@protonmail.com','Hilde','Milene',4),
    ('ardell_samuels@mail.com','Ardell','Samuels',7),
    ('lissette_silva@yandex.com','Lissette','Silva',2),
    ('tasia_lloyd@hotmail.com','Tasia','Lloyd',3),
    ('albertina_redman@yahoo.com','Albertina','Redman',1),
    ('levi_west@yandex.com','Levi','West',5),
    ('kelli_brett@protonmail.com','Kelli','Brett',7),
    ('maynard_penn@aol.com','Maynard','Penn',6)
    ;
-- TABLA 2
INSERT INTO reclamo VALUES
    (1,'maynard_penn@aol.com','2021-11-16','No se acredito mi suscripcion'),
    (2,'kelli_brett@protonmail.com','2022-12-23','Caidas intermitentes en el servicio'),
    (3,'hilde_milne@protonmail.com','2022-11-24','No es lo que esperaba'),
    (4,'ardell_samuels@mail.com','2022-07-06','Catalogo reducido y no cuenta con proteccion para menores')
    ;
-- TABLA 3
INSERT INTO pago VALUES 
    ('5HO85','rosalyn_matthams@gmail.com','Tarjeta','S.A. Banco Santander','HBOMAX'),
    ('MAR0X','miguel_boyce@gmail.com','Tarjeta','BANCO SUPERVIELLE S.A.','Soundcloud'),
    ('202WI','refugio_reynolds@outlook.com','Deposito','NULL','Drive'),
    ('ZKHYR','hilde_milne@protonmail.com','Deposito','NULL','YoutubeMusic'),
    ('V7VUL','ardell_samuels@mail.com','Deposito','NULL','Spotify'),
    ('L23E6','lissette_silva@yandex.com','Tarjeta','BANCO SUPERVIELLE S.A.','Spotify'),
    ('PXO5B','tasia_lloyd@hotmail.com','Tarjeta','BANCO DE LA CIUDAD DE BUENOS AIRES','Dropbox'),
    ('1ZJH6','albertina_redman@yahoo.com','Tarjeta','BANCO BBVA ARGENTINA S.A.','YoutubeMusic'),
    ('22N18','levi_west@yandex.com','Deposito','NULL','Netflix'),
    ('L9C39','kelli_brett@protonmail.com','Deposito','NULL','YoutubeMusic'),
    ('AMJB5','maynard_penn@aol.com','Tarjeta','BANCO BBVA ARGENTINA S.A.','Platzi')
    ;
-- TABLA 4
INSERT INTO sistema_operativo VALUES
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
-- TABLA 5
INSERT INTO plataforma VALUES
    ('Movil','rosalyn_matthams@gmail.com','¡OS_13','720X1280'),
    ('Movil','miguel_boyce@gmail.com','Android_12L','720X1280'),
    ('Web','refugio_reynolds@outlook.com','MAC_OS_Mojave','NULL'),
    ('Tv','hilde_milne@protonmail.com','Android_13','3840X2160'),
    ('Movil','ardell_samuels@mail.com','Android_11','720X1280'),
    ('Tv','lissette_silva@yandex.com','Android_12L','3840X2160'),
    ('Movil','tasia_lloyd@hotmail.com','¡OS_12','720X1280'),
    ('Pc','albertina_redman@yahoo.com','Windows_11','1920X1080'),
    ('Pc','levi_west@yandex.com','MAC_OS_Catalina','1920X1080'),
    ('Pc','kelli_brett@protonmail.com','Windows_11','1920X1080'),
    ('Tv','maynard_penn@aol.com','Android_12L','3840X2160')
    ;
-- TABLA 6
INSERT INTO servicio VALUES
    ('Platzi','Educacion','Web'),
    ('Udemy','Educacion','Web'),
    ('YoutubeMusic','Streaming','Web'),
    ('Spotify','Streaming','Web, Pc, Movil, Tv'),
    ('Netflix','Streaming','Web, Pc, Movil, Tv'),
    ('Dropbox','Nube','Web, Pc, Movil'),
    ('Drive','Nube','Web, Movil'),
    ('Mega','Nube','Web, Movil, Pc'),
    ('SoundCloud','Streaming','Web'),
    ('HBOMAX','Streaming','Web, Movil, Tv')
    ;
-- TABLA 7
INSERT INTO descuento VALUES
    (1,'maynard_penn@aol.com','REINTEGRO35%','Platzi','2022-12-04','35% reintegro con la suscripcion de un anio'),
    (2,'kelli_brett@protonmail.com','50%OFF','Soundcloud','2022-01-04','50% OFF en el segundo mes'),
    (3,'hilde_milne@protonmail.com','25%DESCUENTO','Drive','2022-12-02','25% descuento'),
    (4,'hilde_milne@protonmail.com','MESGRATIS','YoutubeMusic','2021-02-18','Primer mes GRATIS'),
    (5,'levi_west@yandex.com','MESESPRUEBA','HBOMAX','2022-09-27','Tres meses de PRUEBA'),
    (6,'miguel_boyce@gmail.com','50%OFFEN1ANIO','Udemy','2022-11-26','50% OFF pagando un anio'),
    (7,'lissette_silva@yandex.com','HBOMAXGRATIS','HBOMAX','2022-02-12','Suscripcion gratis en HBO MAX por un mes'),
    (8,'levi_west@yandex.com','REINTEGRO40%','Dropbox','2022-05-22','Reintegro del 40% de tu suscripcion'),
    (9,'refugio_reynolds@outlook.com','10%DESCUENTO','Mega','2022-01-16','10% de descuento'),
    (10,'rosalyn_matthams@gmail.com','65%OFF','Spotify','2021-03-25','65% OFF en seis meses')
    ;
