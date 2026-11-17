USE SQLIn10Minutes

-- Opgave 1
-- I denne opgave skal du omforme nedenstående domæneklassediagram til tabeller.

-- Første skridt er at sikre, at alle klasser har nøgler. Vælg derfor for hver klasse en nøgle. Hvis der er
-- klasser, hvor du ikke kan finde en brugbar nøgle, tilføjer du en ikke-informationsbærende (dum) nøgle.

-- Når dette er gjort, omformer du klassediagrammet til tabeller, samt laver create tables til at oprette
-- tabellerne i SQL Server - prøv at køre tabellerne ind i SQL Server.

DROP TABLE IF EXISTS booking
DROP TABLE IF EXISTS lejer
DROP TABLE IF EXISTS feriehus
DROP TABLE IF EXISTS område

GO

CREATE TABLE område
(
    PK_postNr TINYINT PRIMARY KEY NOT NULL,
    områdenavn VARCHAR(25) NOT NULL,
    land VARCHAR(25) NOT NULL
)

CREATE TABLE kunde
(
    PK_kundeID INT PRIMARY KEY NOT NULL,
    navn VARCHAR(25) NOT NULL,
    adresse VARCHAR(30) NOT NULL
)

CREATE TABLE ejer
(
    PK_ejerNr INT PRIMARY KEY NOT NULL,
    kontoNr INT NOT NULL,
    FK_kundeID INT NOT NULL,
    FOREIGN KEY (FK_kundeID) REFERENCES kunde
)

CREATE TABLE lejer
(
    PK_lejerNr INT PRIMARY KEY NOT NULL,
    rabatprocent DECIMAL(4,2) NOT NULL,
    FK_kundeID INT NOT NULL,
    FOREIGN KEY (FK_kundeID) REFERENCES kunde
)

CREATE TABLE feriehus
(
    PK_feriehusID INT PRIMARY KEY NOT NULL,
    navn VARCHAR(4) NOT NULL,
    adresse VARCHAR(30) NOT NULL,
    ugepris SMALLINT NOT NULL,
    FK_postNr TINYINT NOT NULL,
    FOREIGN KEY (FK_postNr) REFERENCES område,
    FK_ejerNr INT NOT NULL,
    FOREIGN KEY (FK_ejerNr) REFERENCES ejer
)

CREATE TABLE booking
(
    PK_bookingID INT PRIMARY KEY NOT NULL,
    ugeNr TINYINT NOT NULL,
    FK_feriehusID INT NOT NULL,
    FOREIGN KEY (FK_feriehusID) REFERENCES feriehus,
    FK_lejerNr INT NOT NULL,
    FOREIGN KEY (FK_lejerNr) REFERENCES lejer
)