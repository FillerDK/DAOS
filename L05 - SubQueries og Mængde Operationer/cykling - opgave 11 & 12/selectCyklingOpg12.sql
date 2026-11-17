use cykling

-- Opgave 12
-- Denne opgave anvender cykelrytterdatabasen. I denne opgave anvendes et bredt
-- udsnit af det du har lært indtil nu. Nogle af opgaverne er decideret svære.

-- 12.1 Lav en oversigt, der for hvert VM viser den bedste danske placering. Oversigten skal
-- indeholde både navnet på rytteren, der opnåede placeringen og placeringen (er en udvidelse af 8.7)(**)

select
    vm.aarstal,
    rytternavn,
    plac as 'Bedste placering'
from vm
join placering p on vm.aarstal = p.aarstal
join rytter r on p.init = r.init
where plac = (
    select min(p2.plac)
    from placering p2
    where vm.aarstal = p2.aarstal
)

-- 12.2 Lav en oversigt, der for hver rytter viser rytterens navn og det første og sidste år,
-- han har deltaget i VM.

select
    rytternavn,
    min(aarstal) as 'Første år',
    max(aarstal) as 'Sidste år'
from rytter r
join placering p on r.init = p.init
group by rytternavn

select *
from placering
order by init, aarstal

-- 12.3 Udvid oversigten, så også antallet af gange, han har fuldført og antal gange,
-- han ikke har fuldført kommer med.

select
    rytternavn,
    min(aarstal) as 'Første år',
    max(aarstal) as 'Sidste år',
    count(plac) as 'Fuldført',
    count(*)-count(plac) as 'Ikke fuldførte'
from rytter r
join placering p on r.init = p.init
group by rytternavn

select *
from placering
order by init, aarstal

-- 12.4 Udvid yderligere oversigten så også bedste placering kommer med (kun selve placeringen).

select
    rytternavn,
    min(aarstal) as 'Første år',
    max(aarstal) as 'Sidste år',
    count(plac) as 'Fuldført',
    count(*)-count(plac) as 'Ikke fuldførte',
    min(plac) as 'Bedste placering'
from rytter r
join placering p on r.init = p.init
group by rytternavn

select *
from placering
order by init, aarstal

-- 12.5 Lav en oversigt, der for hvert VM viser aarstal, antal danske deltagere, bedste danske
-- placering og navnet på rytteren, der opnåede bedste danske placering (er en udvidelse af 8.4 og 12.1-**).

select
    vm.aarstal,
    count(*) as 'Deltagelser',
    plac as 'Bedste placering'
from vm
join placering p on vm.aarstal = p.aarstal
where plac = (
    select min(p2.plac)
    from placering p2
    where vm.aarstal = p2.aarstal
)
group by vm. aarstal, plac
    

-- 12.6 Lav en oversigt med rytternavn og antal gange den pågældende er blevet den bedst
-- placerede dansker (**).


-- 12.7 Lav en oversigt, der for hver rytter viser antal deltagelser, samt årstal for første
-- og sidste deltagelse.


-- 12.8 Lav med udgangspunkt i løsningen fra 12.7 en liste over ryttere, der har haft alle
-- deres deltagelser i træk (dvs har deltaget hvert år fra første og sidste deltagelse).
-- Listen skal kun omfatte ryttere med mindst tre deltagelser og skal være sorteret,
-- så ryttere med flest deltagelser kommer først. (*)