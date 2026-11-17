use tempdb

-- UNION
SELECT instruktorid AS id, navn, NULL AS udgivelsesAar, adresse FROM instruktor
UNION
SELECT NULL AS id, titel AS navn, udgivelsesAar, NULL AS adresse FROM film
UNION
SELECT skuespillerid AS id, navn, NULL AS udgivelsesAar, adresse FROM skuespiller

SELECT *
FROM film i
FULL OUTER JOIN instruktor f on i.instruktorid = f.instruktorid

select instruktorid as id, navn, null as udgivelsesaar
from instruktor
UNION
select instruktorid as id, titel as navn, udgivelsesaar
from film

select *
from instruktor i
full outer join film f on i.instruktorid = f.instruktorid

-- EXCEPT
SELECT *
FROM instruktor
WHERE instruktorid NOT IN
(
    SELECT instruktorid
    FROM film
)

select *
from instruktor
where instruktorid NOT IN
(
    select instruktorid
    from film
)

select navn from instruktor
intersect
select navn from skuespiller

select *
from film
where udgivelsesAar not in (2008, 2019, 2011)

-- INTERSECT
select *
from instruktor
where instruktorid in
(
    select instruktorid
    from film
)