-- Opgave 17
-- Vi tager udgangspunkt i eksempeldatabasen.

-- Lav et view, der viser alle personer med navn, stilling, det postdistrikt han/hun bor i samt hvilket
-- firma han/hun er ansat i - personer, der ikke er ansat nogen steder medtages med firmanavn ukendt.

USE eksempeldb

go
create or alter view ansatte
AS
select navn, stilling, postdistrikt, isnull (firmanavn, 'ukendt') as firmanavn
from person p
left join postnummer pn on p.postnr = pn.postnr
left join ansati a on p.cpr = a.cpr
left join firma f on a.firmanr = f.firmanr

-- Afprøv viewet.

go
select *
from ansatte

-- Brug viewet til at lave en query, der viser navn, postdistrikt og firma for alle programmører.

USE eksempeldb
GO
select navn, postdistrikt, firmanavn
from ansatte
where stilling = 'programmør'

-- Lav et nyt view, der ligner det tidligere, men nu skal firmaets postdistrikt også vises. Endvidere skal
-- personer uden firma ikke længere med.

USE eksempeldb

go
create or ALTER view alleAnsatte
AS
select navn,
       stilling,
       pn.postdistrikt,
       y.firmanavn,
       y.postdistrikt as firmapostdistrikt
from person p
left join postnummer pn on p.postnr = pn.postnr
join (
    select cpr, firmanavn, postdistrikt
    from ansati a
    join firma f on a.firmanr = f.firmanr
    join postnummer pn on pn.postnr = f.postnr
) y on p.cpr = y.cpr

-- Afprøv viewet.

go
select *
from alleAnsatte
