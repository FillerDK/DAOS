use cykledb

-- Repetition af GROUP BY
select init,count(*) as 'Antal deltagelser',min(plac) 'Bedste pladsering'
from placering
group by init

-- Svarer sådan logisk set til en lang række selects
select 'RS',count(*) as 'Antal deltagelser',min(plac) 'Bedste pladsering'
from placering
where init = 'RS'

select 'JM',count(*) as 'Antal deltagelser',min(plac) 'Bedste pladering'
from placering
where init = 'JM'

-- osv lige så mange selects som der er forskellige initialer

-- Hvordan ser RS-gruppen ud - dvs med group by init
select *
from placering
where init = 'RS'

-- Ovenstående nu med fulde navn og sted for vm 
select *
from placering p join rytter r on p.init=r.init
                 join vm on p.aarstal=vm.aarstal
where p.init = 'RS'


select p.init,count(*) as 'Antal deltagelser',min(plac) 'Bedste pladsering'
from placering p join rytter r on p.init = r.init                 
group by p.init

-- vi kan ikke bare sætte rytternavn på
select p.init,rytternavn,count(*) as 'Antal deltagelser',min(plac) 'Bedste pladsering'
from placering p join rytter r on p.init = r.init
group by p.init
--

-- et lille trick
select p.init,max(rytternavn),count(*) as 'Antal deltagelser',min(plac) 'Bedste pladering'
from placering p join rytter r on p.init = r.init
group by p.init
--
-- eller
--
select p.init,rytternavn,count(*) as 'Antal deltagelser',min(plac) 'Bedste placering'
from placering p join rytter r on p.init = r.init
group by p.init,rytternavn


use eksempeldb
-- SUBQUERIES
--
-- sidst så vi
select *
from person
where postnr IN ('8000','8210','8250')
--
-- Med subqueries kan jeg indsætte en SELECT-sætning i (...) 

select *
from person
where postnr not IN (select postnr from firma)

-- en del af anvendelserne med IN kan bedre klares med en almindelig join
-- til gengæld vil en del NOT IN ikke kunne klares på anden vis.
--

-- find den højeste løn

select max(loen)
from person

-- find navn og loen på den, der tjener den højeste løn
select navn,loen
from person 
where loen = (select max(loen) from person)
--
-- vigtigt at det den inderste returnerer passer til
-- betingelsen i WHERE
-- 
-- Hvis den inderste kun returnerer et resultat kan der i WHERE
-- sammenlignes med =, >, < , !=, osv
--
select navn,loen
from person 
where loen > (select avg(loen) from person)
--
-- Hvis den inderste returnerer flere resultater skal der I WHERE
-- sammenlignes med IN eller NOT IN 


-- Subqueries kan også placeres som en tabel i from-delen
--
-- For hver stilling vil jeg gerne have den, der tjener mest
--
-- finder først den højeste loen i hver stilling
select stilling,max(loen) as maxloen
from person
group by stilling

-- bruger denne query som "tabel" i en ny query
select navn,p.stilling,loen
from person p join
  (select stilling,max(loen) as maxloen
   from person
   group by stilling
  ) as højløn 
on p.stilling=højløn.stilling and
p.loen = højløn.maxloen
--
--
-- Mængdeoperationer
--
-- UNION, INTERSECT og EXCEPT
--
select postnr
from person
union -- kunne også være INTERSECT eller EXCEPT
select postnr 
from firma
--
--  
select postnr,navn
from person
where stilling ='programmør'
union-- kunne også være INTERSECT eller EXCEPT
select postnr,navn
from person p join ansati a on p.cpr=a.cpr
where loen >350000 
-- 
-- krav til mængdeopeationer er at de to indgående select-sætninger skal
-- returnere samme antal kolonner OG
-- kolonnerne skal parvis passe sammen typemæssigt.

-- Erfaringsmæssigt bruges UNION nok mest med EXCEPT på 2. pladsen

-- Nogle NOT IN kunne laves med except

-- eksemplet fra tidligere
select *
from person
where postnr not IN (select postnr from firma)

-- er ikke helt nemt at lave til EXCEPT, men hvis 
-- den i stedet var

select postnr
from person
where postnr not IN (select postnr from firma)

-- var den nem at lave med EXCEPT
select postnr
from person
EXCEPT
select postnr 
from firma















