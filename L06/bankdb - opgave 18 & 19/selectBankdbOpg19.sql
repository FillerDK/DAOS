use bankdb

-- Opgave 19
-- Dette er en repetitionsopgave i SQL. Opgaven anvender bankdatabasen (fra opgave 18).

-- Lav SQL-queries til følgende:

-- 19.1 Find kontonummer på alle konti, hvor saldo er større end 1000 kr.

select kontonr
from konto
where saldo > 1000

select *
from konto

-- 19.2 Lav en oversigt der viser alle posteringer i datoorden - ældste postering først.

select *
from postering
order by dato

-- 19.3 Find de bankkunder, der et eller andet sted i deres navn har et a.

select *
from bankkunde
where navn like '%A%'

select *
from bankkunde

-- 19.4 Find navne på bankkunder, der har en konto, der har overtræk (dvs saldo < 0).

select navn, saldo
from bankkunde
join konto on cpr = kontoejer
where saldo < 0

select *
from bankkunde
join konto on cpr = kontoejer

-- 19.5 Find navne på kunder, der har oprettet en konto dette år.
-- (Hint Google: YEAR SQL SERVER).

select navn, oprettet, kontonr
from bankkunde b
join konto k on cpr = kontoejer
where year(k.oprettet) = 2022

select *
from konto

-- 19.6 Find navne på kunder, der har en postering dette år.
-- (Hint Google: YEAR SQL SERVER).

select navn, dato
from bankkunde b
join konto k on cpr = kontoejer
join postering p on k.kontonr = p.kontonr
where year(p.dato) = 2022

select *
from postering

-- 19.7 Find navne på kunder, der har oprettet en konto dette år eller en postering
-- dette år. (Hint Google: YEAR SQL SERVER).

select navn
from bankkunde b
join konto k on cpr = kontoejer
join postering p on k.kontonr = p.kontonr
where year(k.oprettet) = 2022 or year(p.dato) = 2022

-- 19.8 Find det samlede indestående for alle konti i banken.

select sum(saldo) as 'Samlet indestående'
from konto

select *
from konto

-- 19.9 Find det samlede indestående kunde med cpr '12' har.

select sum(saldo) as 'Samlet indestående'
from konto
where kontoejer = 12

-- 19.10 Find for hver kunde det samlede indestående.

select navn, sum(saldo) as 'Samlet indestående'
from bankkunde b
join konto k on cpr = kontoejer
group by navn

select *
from konto

-- 19.11 Find de kunder der samlet set skylder banken penge, dvs.
-- hvor kundens samlede indestående er < 0.

select navn, sum(saldo) as 'Samlet indestående'
from bankkunde b
join konto k on cpr = kontoejer
group by navn
having sum(saldo) < 0

select *
from konto

-- 19.12 Find navne på de kunder, der ikke har nogen konti.

select navn, kontonr
from bankkunde b
left join konto k on cpr = kontoejer
where kontonr is null

select *
from bankkunde
left join konto on cpr = kontoejer

-- 19.13 Find navnet på den kunde, der har kontoen med den største saldo.

--------------------TODO--------------------
select navn, max(saldo)
from konto
join bankkunde on kontoejer = cpr
group by navn, saldo
HAVING saldo = max(saldo)
order by max(saldo) DESC