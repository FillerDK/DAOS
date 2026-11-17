use eksempeldb

-- Opgave 9
-- Denne opgave handler om SQL-queries mod eksempeldatabasen. Opgaverne 1-8 handler alle om
-- aggregates og/eller group by. De tre resterende handler om lidt af hvert og er generelt lidt tricky.

-- 9.1 Find gennemsnitlønnen i Person.
select avg(loen) as 'gennemsnitsløn'
from person

select *
from person

-- 9.2 Find gennemsnitslønnen per postnummer.
select pn.postnr, avg(loen) as 'gennemsnitsløn'
from postnummer pn
join person p on pn.postnr = p.postnr
group by pn.postnr

select *
from postnummer pn
join person p on pn.postnr = p.postnr

-- 9.3 Find antal personer per stilling.
select stilling, count(*) as 'antal'
from person
group by stilling

select *
from person

-- 9.4 Find gennemtsnitslønnen per stilling, som mindst to har, medtages.
select stilling, avg(loen) as 'gennemsnitsløn'
from person
group by stilling
having count(*) > 1

select *
from person

-- 9.5 Find firmanavne og antal ansatte - firmanavn skal kun vises, hvis firmaaet har ansatte.
select firmanavn, count(*) as 'antal ansatte'
from firma f
join ansati a on f.firmanr = a.firmanr
group by firmanavn

select *
from ansati

-- 9.6 Find de firmaer, der har præcist to ansatte.
select firmanavn, count(*) as 'antal ansatte'
from firma f
join ansati a on f.firmanr = a.firmanr
group by firmanavn
having count(*) >=2

select *
from ansati

-- 9.7 Find antal firmaer per postnummer.
select pn.postnr, count(*) as 'antal firmaer'
from postnummer pn
join firma f on pn.postnr = f.postnr
group by pn.postnr

select *
from firma

-- 9.8 Find de stillinger, som mindst to personer har.
select stilling, count(*) as 'antal personer'
from person
group by stilling
having count(*) >= 2

-- 9.9 Find de personer, der bor i samme postnr som det firma, de er ansat i.
select navn, p.postnr, firmanavn, f.postnr
from person p
join ansati a on p.cpr = a.cpr
join firma f on a.firmanr = f.firmanr
where p.postnr = f.postnr

select navn, p.postnr, firmanavn, f.postnr
from person p
join ansati a on p.cpr = a.cpr
join firma f on a.firmanr = f.firmanr

-- 9.10 Find de personer der har et navn, hvor a indgår eller bor i et postdistrikt, hvor a indgår.
select navn
from person
where navn like '%A%'

select *
from person

-- 9.11 Find de personer, der ikke er ansat i et firma (lav den med det du har lært til nu).
select *
from person p
left join ansati a on p.cpr = a.cpr
where firmanr is null

select *
from person p
left join ansati a on p.cpr = a.cpr