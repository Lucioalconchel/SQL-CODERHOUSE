-- VIEW 1
CREATE VIEW vw_discount AS
SELECT 
	D.discount_name AS Name,
	D.description AS Description,
    D.service_name AS Service,
    S.plataform AS Plataform
FROM descuento AS D
INNER JOIN servicio AS S ON
(D.service_name = S.service_name);

-- VIEW 2
CREATE VIEW vw_claim AS
SELECT
	R.claim_id AS ClaimId,
    R.description AS Descripcion,
    C.email_user AS Email, 
    P.payment_code AS PaymentCode,
    C.service_name AS Service 
FROM reclamo AS R
INNER JOIN cuenta AS C ON
(R.id_user = C.id_user)
INNER JOIN pago AS P ON
(R.id_user = P.id_user);

-- VIEW 3
CREATE VIEW vw_user AS
SELECT
	U.first_name AS Name,
    U.email_user AS Email,
    C.service_name AS Service
FROM usuario AS U
INNER JOIN tarjeta AS T ON
(U.dni = T.dni)
INNER JOIN cuenta AS C ON
(T.card_number = C.card_number)
WHERE C.service_name = 'Spotify';

-- VIEW 4
CREATE VIEW vw_plataform AS
SELECT
	C.user AS User,
    C.email_user AS Email,
    P.plataform AS Plataform,
    P.resolution AS Resolution
FROM plataforma AS P
INNER JOIN cuenta AS C ON
(P.id_user = C.id_user)
WHERE P.plataform LIKE '%Movil%';

-- VIEW 5
CREATE VIEW vw_acount AS
SELECT
	C.user AS User,
    C.service_name AS Service,
    T.type_card AS TypeCard,
    T.bank_name AS Bank,
    T.extension AS Extension
FROM cuenta AS C
INNER JOIN tarjeta AS T ON
(C.card_number = T.card_number)
WHERE T.extension = 0;

-- VIEW 6
CREATE VIEW vw_payment AS
select
	P.payment_code,
    C.email_user,
    C.service_name
 from pago AS P
 INNER JOIN cuenta AS C ON
 (P.id_user = C.id_user);
