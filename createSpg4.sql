use tempdb

drop table if exists medvirkende
drop table if exists skuespiller
drop table if exists film
drop table if exists instruktor

create table instruktor
(
    instruktorId int IDENTITY(1, 1) PRIMARY KEY,
    navn varchar(40) not null,
    adresse varchar(40) not null
)

create table film
(
    titel varchar(40) PRIMARY KEY,
    udgivelsesAar int not null,
    laengde int not null,
    instruktorId int FOREIGN KEY REFERENCES instruktor not null
)

create table skuespiller
(
    skuespillerId int IDENTITY(1,1) PRIMARY KEY,
    navn varchar(40) not null,
    adresse varchar(40) not null
)

create table medvirkende
(
    skuespillerId int,
    titel varchar(40),
    PRIMARY KEY (skuespillerId, titel),
    constraint skuespillerForeign FOREIGN KEY (skuespillerId) REFERENCES skuespiller (skuespillerId),
    constraint titelForeign FOREIGN KEY (titel) REFERENCES film (titel)
)