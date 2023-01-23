CREATE USER 'Junior' IDENTIFIED BY 'Junior1234';
CREATE USER 'Pasante' IDENTIFIED BY 'Pasante9999';

-- El usuario Pasante solo puede ver todas las tablas y vistas
GRANT SELECT ON tp_alconchel.* TO  'Pasante';

-- El usuario Junior puede ver, modificar e insertar en las tablas
-- usuario, tarjeta, reclamo y cuenta pertenecientes a la DB tp_alconchel
GRANT SELECT, UPDATE, INSERT ON tp_alconchel.usuario TO 'Junior';
GRANT SELECT, UPDATE, INSERT ON tp_alconchel.tarjeta TO 'Junior';
GRANT SELECT, UPDATE, INSERT ON tp_alconchel.reclamo TO 'Junior';
GRANT SELECT, UPDATE, INSERT ON tp_alconchel.cuenta TO 'Junior';
