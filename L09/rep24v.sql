use tempdb
drop table if exists udlejning
drop table if exists bil
drop table if exists lejer
go
create table  lejer
(
lejernr int identity primary key,
navn varchar(30),
postnr char(4)
)

create table bil
(regnr char(7) primary key,
navn varchar(20) unique,
beskrivelse varchar(300)
)

create table udlejning
(udlejningsnr int primary key identity(1000,1), 
lejernr int foreign key references lejer not null,
regnr char(7) foreign key references bil on delete cascade not null,
start datetime,
slut datetime,
check (datediff(minute, start, slut) >= 20)
)

insert into lejer values('Jens Jensen','8270')
insert into lejer values('Hans Hansen','8210') 
insert into lejer values('Ib Ibsen','8000') 
insert into lejer values('Poul Poulsen','8270') 
insert into lejer values('Bent Bentsen','8270') 

insert into bil values ('DC98564','Freja','Grå Up')
insert into bil values ('EE76342','Anna','Blå C1')
insert into bil values ('CD76544','Anja','Rød Corsa')
insert into bil values ('EF76774','Julie','Hvid Corolla')
insert into bil values ('CY97594','Emma','Sort Up')

insert into udlejning values(1,'DC98564','2024.09.27 11:08','2024.09.27 14:00')
insert into udlejning values(2,'DC98564','2024.09.28 10:03','2024.09.28 13:42')
insert into udlejning values(1,'DC98564','2024.10.02 08:00','2024.10.02 14:44')
insert into udlejning values(4,'CY97594','2024.10.01 08:30','2024.10.01 14:00')
insert into udlejning values(5,'CY97594','2024.10.02 08:30','2024.10.02 12:00')
insert into udlejning values(5,'CD76544','2024.10.02 07:30','2024.10.02 12:40')
insert into udlejning values(5,'CD76544','2024.10.05 09:33','2024.10.05 12:07')


go
--
-- Opgave 1:
-- Når man har en mange til mange tabel (i dette tilfælde udlejning) vil man ofte vælge at
-- lade kombinationen af de to fremmednøgler være primary key - det har jeg ikke gjort i dette tilfælde
-- ville det have været en god ide at gøre det?

-- Nej det ville det ikke.
-- En lejer kan kun leje en bil en enkelt gang.
-- Næste gang skal en anden bil lejes.


-- Opgave 2
-- I øjeblikket er det ikke muligt at slette en elbil eller en lejer, hvis der er en udlejning på de pågældende
-- Ret i tabeldefinitionerne så følgende gælder:
-- Hvis man sletter en bil skal alle bilen udlejninger også slettes
-- Det skal til gengæld ikke være muligt at slette en lejer, hvis den pågældende har udlejninger

-- Tilføjet "on delete cascade" i udlejnings tabellen.


-- Opgave 3:
-- Lav en constraint, så det kontrolleres at starttidspunkt for en udlejning er før sluttidspunkt og 
-- den korteste mulige udlejningstid er 20 minutter.

-- Tilføjet 1 checks til sidst i udlejning.


-- Opgave 4
-- 1. Prøv at indsætte en bil, der ikke har noget navn (navn er null) - kan man det ?
insert into bil values ('DJ83501', null, 'Grøn Fiesta')
-- Ja det kan man godt.

-- 2. Prøv at indsætte en bil mere, der ikke har noget navn (navn er null) - kan man det ?
insert into bil values('GG72856', null, 'Pink Ka')
-- Nej det kan man ikke da de skal have unikke navne.


-- Opgave 5:
-- Lav en query, der givet et regnr skriver navne på dem, der har haft lejet den pågældende bil 
-- hver lejers navn, skal kun komme en gang
select distinct l.navn
from udlejning u
join lejer l on u.lejernr = l.lejernr
where regnr = 'CY97594'


-- Opgave 6:  
-- Lav en query, der givet et navn på en bil skriver navne på dem, der har haft lejet den pågældende bil 
-- hver lejers navn, skal kun komme en gang
select distinct l.navn
from udlejning u
join lejer l on u.lejernr = l.lejernr
join bil b on u.regnr = b.regnr
where b.navn = 'Freja'


-- Opgave 7
-- Find alle biler, der er udlejet lige nu
select b.navn
from udlejning u
join bil b on u.regnr = b.regnr
where start < GETDATE() and slut > GETDATE()


-- Opgave 8
-- Lav en query, der for alle biler skriver alle udlejninger. Biler der aldrig har været udlejet skal medtages med "tomme"
-- værdier i udlejningsattributternne. 
select b.navn, b.regnr, isnull(cast(udlejningsnr as varchar(10)), 'ingen') as "udlejningsnr"
from bil b
left join udlejning u on b.regnr = u.regnr


-- Opgave 9
-- Lav en query, der viser alle lejere og antallet af udlejninger den pågældende lejer har foretaget
-- lejere, der endnu ikke har lejet noget medtages med 0 i antal udlejninger
select l.navn, COUNT(u.lejernr) as 'antal udlejninger'
from lejer l
left join udlejning u on l.lejernr = u.lejernr
group by l.navn


-- Opgave 10
-- Lav en query, der viser hvor mange minutter alle biler samlet set har været udlejet (dvs kun et tal)
select sum(datediff(mi, start, slut)) as 'udl. min'
from udlejning


-- Opgave 11
-- Lav en query, der viser hvor mange minutter alle biler, hvis navn starter med A samlet set har været udlejet (dvs kun et tal)
select sum(datediff(mi, start, slut)) as 'udl. min'
from bil b
join udlejning u on b.regnr = u.regnr
where b.navn like 'A%'


-- Opgave 12
-- Lav en query, der viser hvor mange minutter hver bil har været udlejet. 
-- Listen skal være sorteret, så de mest udlejede biler kommer først
select b.navn, sum(datediff(mi, start, slut)) as 'udl. min'
from bil b
left join udlejning u on b.regnr = u.regnr
group by b.navn
order by 'udl. min' desc


-- Opgave 13
-- Lav en query, der viser hvor mange minutter hver bil har været udlejet. 
-- Kun biler, der har været udlejet mindst 10 timer skal medtages
select b.navn, sum(datediff(mi, start, slut)) as 'udl. min'
from bil b
join udlejning u on b.regnr = u.regnr
group by b.navn
having sum(datediff(mi, start, slut)) >= 600


-- Opgave 14
-- Lav en query, der viser den gennemsnitlige udlejningstid
select avg(datediff(mi, start, slut)) as 'gns. udl. min'
from udlejning


-- Opgave 15 
-- Lav en query, der viser hvor længe den længste udlejning har varet.
select max(datediff(mi, start, slut)) as 'længste udl. min'
from udlejning


-- Opgave 16
-- Lav en query, der viser navnet på den bil, der har haft den længste udlejning.
select b.navn, max(datediff(mi, start, slut)) as 'længste udl. min'
from bil b
join udlejning u on b.regnr = u.regnr
group by b.navn
having 'længste udl. min' = max(datediff(mi, start, slut))


-- Opgave 17
-- Lav en query, der viser hvor mange minutter, den bil med den st�rste samlede udlejning har v�ret udlejet

-- Opgave 18
-- Lav en query, der viser de lejere, der aldrig har lejet nogen biler - lav queryen p� to m�der

-- Opgave 20
-- Lav et view, der viser navnet p� lejer, navnet p� bil og hvilken dato udlejningen har v�ret 
-- Brug viewet til at vise alle udlejninger p� en bestemt dag

-- Opgave 21 
-- Lav en stored procedure, der givet en dato udskriver alle udlejniger p� den dag
-- Der skal udskrives navnet p� lejer og navnet p� bilen
-- vis et kald af proceduren

-- Opgave 22
-- Lav en trigger, der forbyder at den samme lejer kan leje mere end 3 biler p� en dag.