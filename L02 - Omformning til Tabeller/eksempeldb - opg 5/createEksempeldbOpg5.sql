USE eksempeldb

DROP TABLE IF EXISTS ansati
DROP TABLE IF EXISTS person
DROP TABLE IF EXISTS firma
DROP TABLE IF EXISTS postnummer

GO

CREATE TABLE postnummer
(
    postnr CHAR(4) PRIMARY KEY,
    postdistrikt VARCHAR(25)
)

CREATE TABLE person
(
    cpr CHAR(10) PRIMARY KEY,
    navn VARCHAR(25),
    stilling VARCHAR(25),
    loen INT NOT NULL CHECK(loen > 0),
    postnr CHAR(4) REFERENCES postnummer NOT NULL
)

CREATE TABLE firma
(
    firmanr INT PRIMARY KEY,
    firmanavn VARCHAR(25),
    postnr CHAR(4) NOT NULL,
    FOREIGN KEY (postnr) REFERENCES postnummer
)

CREATE TABLE ansati
(
    cpr CHAR(10) CONSTRAINT cprforeign FOREIGN KEY REFERENCES person,
    firmanr INT CONSTRAINT firmaforeign FOREIGN KEY REFERENCES firma,
    PRIMARY KEY(cpr, firmanr)
)