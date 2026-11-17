USE ordresystem

-- Opgave 6
-- I denne opgave skal du arbejde videre på den kunde-ordre-vare database, som du lavede i opgave 4.

-- Opgaverne 4-8 handler om joins.

-- Lav SQL-queries til følgende:

-- 6.1 Find alle de varer, hvis varenavn starter med a.
SELECT *
FROM vare
WHERE varenavn like 'B%'

SELECT *
FROM vare

-- 6.2 Find alle de varer, hvor a indgår i varenavnet.
SELECT *
FROM vare
WHERE varenavn like '%A%'

-- 6.3 Find alle de varer, der koster mellem 5 og 100 kroner.
SELECT *
FROM vare
WHERE pris BETWEEN 5 AND 100

-- 6.4 Lav en oversigt, der viser ordrenummer, ordredato og kundens navn for alle ordrer.
SELECT PK_ordrenummer, dato, navn
FROM ordre o
JOIN kunde k ON k.PK_kundeNr = o.FK_kundeNr

SELECT *
FROM ordre

-- 6.5 Vis navne på alle kunder, der har mindst en ordre.
SELECT DISTINCT navn
FROM ordre o
JOIN kunde k ON k.PK_kundeNr = o.FK_kundeNr

SELECT *
FROM kunde

-- 6.6 Vis alle ordrer der indeholder en bestemt vare identificeret med varenavn. Oversigten skal
-- indeholde ordrenr, ordredato og det solgte antal.
SELECT FK_ordrenummer, dato, antal
FROM vare v
JOIN ordrelinje ol ON v.PK_varenummer = ol.FK_varenummer
JOIN ordre o ON ol.FK_ordrenummer = o.PK_ordrenummer
WHERE varenavn = 'Håndbold'

-- 6.7 Vis navne på de kunder, der har købt en bestemt vare.
SELECT navn
FROM kunde
JOIN ordre ON FK_kundeNr = PK_kundeNr
JOIN ordrelinje ON FK_ordrenummer = PK_ordrenummer
JOIN vare ON FK_varenummer = PK_varenummer
WHERE varenavn = 'Håndbold'

-- 6.8 Vis en oversigt med alle varer og alle deres tilhørende ordrer. Hvis en vare overhovedet ikke
-- er blevet solgt, skal den også med i visningen med ordrenummer 0.
SELECT v.varenavn, ISNULL (ol.FK_ordrenummer, 0) AS 'ordrenummer'
FROM vare v
LEFT JOIN ordrelinje ol ON ol.FK_varenummer = v.PK_varenummer
ORDER BY PK_varenummer