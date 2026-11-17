USE ordresystem

-- Opgave 4.2
-- Omform klassediagrammet til tabeller.
-- Lav et script der opretter tabellerne i database. Prøv at anvende nogle constraints.

DROP TABLE IF EXISTS ordrelinje
DROP TABLE IF EXISTS ordre
DROP TABLE IF EXISTS kunde
DROP TABLE IF EXISTS vare

GO

CREATE TABLE vare
(
    PK_varenummer INT PRIMARY KEY NOT NULL,
    varenavn VARCHAR(25) NOT NULL,
    pris SMALLINT NOT NULL,
    antalpaalager SMALLINT NOT NULL
)

CREATE TABLE kunde
(
    PK_kundeNr INT PRIMARY KEY NOT NULL,
    navn VARCHAR(25) NOT NULL,
    adresse VARCHAR(30) NOT NULL
)

CREATE TABLE ordre
(
    PK_ordrenummer INT PRIMARY KEY NOT NULL,
    dato DATE NOT NULL,
    betalt BIT NOT NULL,
    FK_kundeNr INT NOT NULL,
    FOREIGN KEY (FK_kundeNr) REFERENCES kunde
)

CREATE TABLE ordrelinje
(
    PK_oLnummer INT PRIMARY KEY NOT NULL,
    antal TINYINT NOT NULL,
    FK_ordrenummer INT NOT NULL,
    FOREIGN KEY (FK_ordrenummer) REFERENCES ordre,
    FK_varenummer INT NOT NULL,
    FOREIGN KEY (FK_varenummer) REFERENCES vare
)
