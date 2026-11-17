-- Opgave 11
-- Denne opgave anvender cykelrytterdatabasen. Denne opgave er en opgave i
-- subqueries og opgaverne 1-4 skal i første omgang laves med subqueries.
use cykling

-- 11.1 Lav en oversigt, der viser initialer på ryttere, der aldrig har fuldført et VM.
select init
from rytter
where init not in (select init
                   from placering
                   where plac is not null)

select *
from placering
order by init

-- 11.2 Lav en oversigt, der viser initialer på ryttere, der har fuldført hver gang de har deltaget
-- i et VM.
select init
from rytter r
where init not in (select init
                   from placering
                   where plac is null)

select *
from placering
order by init

-- 11.3 Lav en oversigt, der viser initialer og navn på ryttere, der har fuldført alle de VM,
-- de har deltager i, i 1970'erne.
select init, rytternavn
from rytter r
where init in (select init
               from placering
               where aarstal between 1970 and 1979
               EXCEPT
               select init
               from placering
               where plac is null and aarstal BETWEEN 1970 and 1979)

select *
from placering
order by init

-- 11.4 Find de VM, hvor der ikke har været dansk deltagelse.
select *
from vm
where aarstal not in (select aarstal
                      from placering)

select *
from placering

-- 11.5 Overvej om nogle af de 4 ovenstående kunne være lavet med mængdeoperationer.
-- I opgave 11.3