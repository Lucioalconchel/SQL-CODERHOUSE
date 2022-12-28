CREATE VIEW vw_discount AS
SELECT 
	D.discount_name AS Name,
	D.description AS Description,
    D.service_name AS Service,
    S.plataform AS Plataform
FROM descuento AS D
INNER JOIN servicio AS S ON
(D.service_name = S.service_name)
;

CREATE VIEW vw_claim AS
SELECT
	R.claim_id AS ClaimId,
    R.description AS Descripcion,
    R.email_user AS Email,
    P.payment_code AS PaymentCode, 
    -- Deberia ir un DISTINCT pero como tengo pocos datos no es necesario de momento
    P.service_name AS Service
FROM reclamo AS R
INNER JOIN usuario AS U ON
(R.email_user = U.email)
INNER JOIN pago AS P ON
(R.email_user = P.email_user)
;

CREATE VIEW vw_user AS
SELECT
	U.first_name AS Name,
    U.email AS Email,
    P.service_name AS Service
FROM usuario AS U
INNER JOIN pago AS P ON
(U.email = P.email_user)
WHERE P.service_name = 'YoutubeMusic'
;

CREATE VIEW vw_plataform AS
SELECT
	U.last_name AS LastName,
    U.first_name AS FirstName,
    P.plataform AS Plataform,
    P.resolution AS Resolution
FROM plataforma AS P
INNER JOIN usuario AS U ON
(P.email_user = U.email)
WHERE P.resolution LIKE '%80%'
ORDER BY U.last_name ASC
;

CREATE VIEW vw_payment AS
SELECT
	U.last_name AS LastName,
    P.payment_method AS Payment,
    P.bank_name AS Bank,
    P.service_name AS Service
FROM pago AS P
INNER JOIN usuario AS U ON
(P.email_user = U.email)
;
