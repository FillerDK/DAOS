use cykling

-- Opgave 14

go
create or alter view placeringer
as
select init, aarstal, isnull (CAST (plac as varchar), 'Udgået') as placering
from placering

go
select *
from placeringer
where init = 'AJ'