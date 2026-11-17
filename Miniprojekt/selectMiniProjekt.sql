-- 7. Trigger
-- a. Lav en trigger, der forhindrer indsættelse af en karakter for en studerende på en
-- eksamen, som den opgældende studerende allerede har bestået.

go
create or alter trigger alleredeBestået
on eksamensforsøg
instead of insert
as
declare @studieNr as int
set @studieNr = (select studieNr from inserted)

declare @eksamensforsøgID as int
set @eksamensforsøgID = (select afvikling from inserted)

if exists(
    select *
    from eksamensforsøg ef
    join (
        select *
        from afvikling a
        where a.id = @eksamensforsøgID
    ) a on ef.afvikling = a.id
    join eksamen e on a.eksamen = e.id
    where ef.studieNr = '1001'
          and ef.karakter not in ('[-3, 0, IM, IA, SY]')
)
begin
    raiserror ('Tilføjelse af karakter kunne ikke gennemføres da den
                studerende allerede har bestået', 16, 1)
    rollback tran
end

-- b. Lavn en trigger, der udskriver en besked hvis status på udmeldt, ændre for en studerende.
-- Beskeden skal udskrives i konsollen. Beskeden skal indeholde om den studerende er
-- udmeldt eller indmeldt.



go
create or alter trigger statusPåUdmeldt
on studerende
after update
as

if exists(
    select 1
    from inserted i
    join deleted d on i.studieNr = d.studieNr
    where i.aktiv != d.aktiv
)

begin
    declare @studID int
    set @studID = (select studieNr from inserted)

    declare @aktiv int
    set @aktiv = (select aktiv from inserted)

    declare @msg varchar(50)

    if (@aktiv = 1)
        set @msg = 'Studerende ' + cast(@studID as varchar(10)) + ' er indmeldt!'
    if (@aktiv = 0)
        set @msg = 'Studerende ' + cast(@studID as varchar(10)) + ' er udmeldt!'



    raiserror (@msg, 16, 1)
end

update studerende
set aktiv = 0
where studieNr = '1000'

select * from studerende





-- f. Find for hver eksamen antallet af lektioner en eksamen dækker over. F.eks. hvis en eksamen
-- indeholder to fag på hver 100 lektioner, dækker eksamen over 200 lektioner

select *
from eksamen e
join fag f on e.fagNavn = f.navn