use cykling

-- Opgave 8
-- Denne opgave anvender cykelrytterdatabasen fra opgave 7. Opgaven handler om group by og
-- aggregates.

-- Lav SQL-queries til følgende:

-- 8.1 Lav en oversigt, der viser initialer på rytteren og det antal gange, han har deltaget i VM.
-- Oversigten skal være sorteret, så ryttere med flest gange deltagelse kommer først.
SELECT r.init, COUNT(*) AS 'antal deltagelser'
FROM rytter r
JOIN placering p ON r.init = p.init
GROUP BY r.init
ORDER BY [antal deltagelser] DESC

SELECT r.init
FROM rytter r
JOIN placering p ON r.init = p.init
ORDER BY rytternavn

-- 8.2 Lav oversigten fra 1 om, så vi kun tæller de VM, hvor rytteren har fuldført. Denne kan laves
-- på to måder - vis dem begge.
SELECT top 5 r.init, COUNT(*) AS 'fuldførte vm'
FROM rytter r
JOIN placering p ON r.init = p.init
WHERE plac IS NOT NULL
GROUP BY r.init

select top 5 r.init, COUNT(*) as 'fuldførte vm'
from rytter r
left join placering p on r.init = p.init
where plac is not NULL
group by r.init

select r.init
from rytter r
join placering p on r.init = p.init
order by rytternavn

-- 8.3 Udvid yderligere oversigten fra spørgsmål 2, så rytterens bedste og dårligste placering
-- kommer med. Oversigten skal nu kun omfatte ryttere, der har fuldført mindst to gange.
select top 5 r.init,
       count(*) as 'fuldførte vm',
       min(plac) as 'bedste plac',
       max(plac) as 'dårligste plac'
from rytter r
join placering p on r.init = p.init
where plac is not NULL
group by r.init
having COUNT(*) >= 2
order by r.init

select top 20 *
from rytter r
join placering p on r.init = p.init
order by r.init

-- 8.4 Lav en oversigt, der for hvert VM viser aarstal og antal danske deltagere.
select vm.aarstal, count(*) as deltagelser
from vm
join placering p on vm.aarstal = p.aarstal
group by vm.aarstal
order by vm.aarstal

select *
from vm
join placering p on vm.aarstal = p.aarstal

-- 8.5 Lav en oversigt, der for hvert VM viser antallet af fuldførende danskere.
select top 10 vm.aarstal, count(plac) as fuldførte
from vm
join placering p on vm.aarstal = p.aarstal
where plac is not null
group by vm.aarstal

select top 20 *
from vm
join placering p on vm.aarstal = p.aarstal

-- 8.6 Lav en oversigt, der for hvert VM viser antallet af ikke-fuldførende danskere.
select top 10 vm.aarstal, count(*) - count(plac) as 'ikke fuldførte'
from vm
join placering p on vm.aarstal = p.aarstal
group by vm.aarstal

select top 20 *
from vm
join placering p on vm.aarstal = p.aarstal

-- 8.7 Lav en oversigt, der for hvert VM viser den bedste danske placering.
-- 0 = ingen fuldførte.
select vm.aarstal, bynavn, land, isnull (min(plac), 0) as 'bedste danske placering'
from vm
join placering p on vm.aarstal = p.aarstal
group by vm.aarstal, bynavn, land

select *
from vm
join placering p on vm.aarstal = p.aarstal

-- 8.8 Lav en oversigt, der viser de ryttere, der på et eller andet tidspunkt er udgået og det antal
-- gange de ikke har fuldført - kun ryttere, der mindst tre gange ikke har fuldført, skal medtages.
select rytternavn, count(*) as 'gange ikke fuldførte'
from rytter r
join placering p on r.init = p.init
group by rytternavn
having count(*) >= 3

select *
from rytter r
join placering p on r.init = p.init

-- 8.9 Lav en oversigt, der viser de lande, hvor der har været afholdt VM og hvor mange gange,
-- der har været VM i landet.
select land, count(*) as 'antal vm'
from vm
group by land

select *
from vm