use bankdb

-- Opgave 20
-- Denne opgave anvender bankdatabasen. Denne opgave er en opgave i triggere.

-- 20.1 Lav en trigger der forbyder sletning af en konto, hvis saldo ikke er 0
-- (med andre ord man må kun slette en konto, hvis saldo er 0).

go
create or alter trigger forbydSletningAfKonto
on konto
instead of delete
as
if exists(
    select saldo
    from konto
    where saldo != 0
)
begin
    raiserror ('Sletning annulleret - der står penge på kontoen', 16, 1)
    rollback tran
end

select * from konto

-- 20.2 Lav en trigger, der styrer redundansen af saldo, dvs en trigger
-- der ved indsættelse af en postering opdaterer kontoens saldo korrekt.

go
create or alter trigger opdaterSaldo
on postering
after insert
as
declare @beloeb as decimal(14,2)
set @beloeb = (select beloeb from inserted)
begin
    update konto
    set saldo = saldo + @beloeb
    where kontonr in (
        select kontonr
        from inserted
    )
end

select * from konto
exec indsætBeløb 1005, -1000
select * from konto

-- 20.3 Lav en trigger/ret i triggeren fra spørgsmål 2, så redundansen også styres ved
-- opdatering og sletning af en postering.

go
create or alter trigger opdaterSaldo
on postering
after insert, update, delete
as
declare @beloeb as decimal(14,2)
if exists (select top 1 * from inserted)
begin
SELECT * FROM INSERTED
    -- update konto
    -- set @beloeb = (select beloeb from inserted)
    -- where kontonr in (
    --     select kontonr
    --     from inserted
    -- )
end
else if exists (
    select beloeb
    from deleted
    where beloeb != 0
    )
begin
    update konto
    set saldo = saldo - @beloeb
    where kontonr in (
        select kontonr
        from deleted
    )
end


select top 3 * from postering
select top 3 * from konto

exec indsætBeløb 1002, 500
delete from postering
where posteringsnr = '9'

select top 5 * from postering
select * from konto

-- 20.4 Lav en trigger, der sikrer, at en kunde højst kan have tre konti.
