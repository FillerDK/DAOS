use bankdb

drop table if exists postering
drop table if exists konto
drop table if exists bankkunde
go
create table bankkunde
(
cpr char(10) primary key,
navn varchar(30) not null
)
create table konto
(
kontonr int identity(1001,1) primary key,
kontoejer char(10) foreign key references bankkunde not null, 
oprettet date not null,
saldo decimal(14,2) not null
)
create table postering
(
posteringsnr int identity primary key,
kontonr int foreign key references konto not null, 
dato date not null,
beloeb decimal(14,2) not null -- positivt beloeb = inds�ttelse, negativt = h�vning
)
