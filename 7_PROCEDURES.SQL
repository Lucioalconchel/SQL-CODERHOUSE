-- STORE PROCEDURE 1
DELIMITER $$
CREATE PROCEDURE sp_exist_acount (IN id_param INT)
BEGIN
	DECLARE clausula INT;
    SELECT COUNT(*) INTO clausula FROM cuenta;
	IF id_param <= clausula THEN
		SELECT
			*
		FROM cuenta
		WHERE id_user = id_param;
    ELSE
		SELECT 'This user not exist.' AS Warning;
	END IF;
END
$$
-- STORE PROCEDURE 2
DELIMITER $$
CREATE PROCEDURE sp_new_claim (IN id_user_param INT, date_param DATE, description_param VARCHAR(200))
BEGIN
	INSERT INTO reclamo (id_user, date, description)
	VALUES	(id_user_param, date_param, description_param);
    SELECT * FROM reclamo;
END
$$