use eksempeldb

-- Opgave 10
-- Denne opgave handler om subqueries/mængdeoperationer mod eksempeldatabasen.

-- 10.1 Find de personer, der ikke er ansat i noget firma.
select navn, cpr
from person
where cpr not in (select cpr
                  from ansati
                 )

select *
from person

select *
from ansati

-- 10.2 Find de postnumre, hvor der hverken bor personer eller firmaer.
select postnr
from postnummer
where postnr not in (select postnr
                     from person
                     UNION
                     select postnr
                     from firma
                    )

select * from postnummer

select postnr from postnummer
union
select postnr from person

-- 10.3 Find de firmaer, der ikke har ansatte.
select *
from firma
where firmanr not in (select firmanr
                      from ansati
                     )

-- 10.4 Find navne på alle personer, der tjener mere end gennemsnittet.
select navn, loen
from person
where loen > (select avg(loen)
              from person
             )

-- 10.5 Find for hver stilling den højeste løn nogen har (ikke subqueries)-
select stilling, max(loen)
from person
group by stilling

-- 10.6 Find for hver stilling navnet på den, der har den højeste løn (*).
select navn, loen, stilling
from person
where loen in (select max(loen)
               from person
               group by stilling
              )
