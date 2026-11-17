use bankdb

-- Opgave 18
-- Denne opgave anvender bankdatabasen - på CANVAS findes et script til oprettelse af tabellerne og
-- indsættelse af testdata.

-- Kør scriptet ind i en ny database og kig tabellerne igennem.

-- 18.1 Lav en stored procedure, der udskriver kontohavers navn, kontonummer og saldo
-- for alle konti.

go
create or alter proc udskrivKonti
as
select navn, kontonr, saldo
from konto
join bankkunde on kontoejer = cpr

-- Execute

go
exec udskrivKonti

-- 18.2 Lav en stored procedure, der givet et cpr-nummer, udskriver kontohavers navn,
-- kontonummer og saldo for hveraf den pågældende kontohavers konti.

go
create or alter proc udskrivKundesKonti
@cpr char(10)
as
select navn, kontonr, saldo
from bankkunde
join (
    select kontonr, saldo, kontoejer
    from konto
    where kontoejer = @cpr
) y on cpr = y.kontoejer

-- Execute

go
exec udskrivKundesKonti '12'

-- 18.3 Lav en stored procedure, der givet et cpr-nummer udskriver kontohavers samlede
-- indestående.

go
create or alter proc udskrivSamletIndestående
@cpr char(10)
as
select sum(saldo) as 'Samlet indestående'
from (
    select saldo
    from konto
    where kontoejer = @cpr
) y

-- Execute

go
exec udskrivSamletIndestående '12'

-- 18.4 Lav en stored procedure, der givet et cpr-nummer, returnerer (i en output
-- parameter), kontohaveres samlede indestående.

go
create or alter proc udskrivSamletIndeståendeOutput (@cpr char(10), @samlet decimal(14,2) output)
as
select @samlet = sum(saldo)
from (
    select saldo
    from konto
    where kontoejer = @cpr
) y

-- Execute

go
declare @x decimal(14,2)
exec udskrivSamletIndeståendeOutput '12', @x output
select @x

-- 18.5 Lav en stored procedure, der givet et kontonummer og et beløb laver insert af
-- en postering på det pågældende beløb og retter saldoen på konto tilsvarende.

go
create or alter proc indsætBeløb
@kontonummer int,
@beløb decimal(14,2)
as
insert into postering values(@kontonummer, GETDATE(), @beløb)

-- Execute

go
exec indsætBeløb 1005, 500

select * from postering order by kontonr

-- 18.6 Lav en stored procedure, der givet et cpr på en kunne, sletter alle kundens
-- konti inklusive posteringer og kunden selv.

go
create or alter proc sletKundeOgKonti
@cpr char(10)
as
begin
    delete from postering
        where kontonr in (
            select kontonr
            from konto
            where kontoejer = @cpr
    )
    delete from konto
    where kontoejer = @cpr

    delete from bankkunde
    where cpr = @cpr
end

-- Execute

go
select * from bankkunde
exec sletKundeOgKonti '14'
select * from bankkunde

-- Alle de seks stored procedures skal naturligvis testes.