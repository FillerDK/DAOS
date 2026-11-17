USE eksempeldb

-- Opgave 5
-- I denne opgave skal du arbejde med eksempeldatabasen.

-- Lav følgende SQL-queries:

-- 5.1 Find cpr på alle systemudviklere.
SELECT cpr, navn
FROM person
WHERE stilling = 'systemudvikler'

-- 5.2 Find alle postnumre. hvor der bor personer.
SELECT postnr
FROM person

-- 5.3 Find navne på de, der tjener mere end 400000 kr.
SELECT navn
FROM person
WHERE loen > 400000

-- 5.4 Find nav, løn og arbejdsmarkedsbidrag for alle personer (arbejdsmarkedsbidrag er 8% af
-- lønnen).
SELECT navn, loen, loen * 0.08 AS arbejdsmarkedsbidrag
FROM person

-- 5.5 Find navne på de personer, der bor i 'Aarhus C'
SELECT navn, postdistrikt
FROM person p
JOIN postnummer pn ON pn.postnr = p.postnr
WHERE pn.postdistrikt = 'Aarhus C'

SELECT *
FROM person

-- 5.6 Find de postdristrikter, hvor der bor personer, der tjener mere end 400000 kr.
SELECT postdistrikt
FROM postnummer pn
JOIN person p ON p.postnr = pn.postnr
WHERE loen > 400000

-- 5.7 Find de firmaer, der bor i 'Risskov'
SELECT firmanavn
FROM firma f
JOIN postnummer pn ON f.postnr = pn.postnr
WHERE pn.postdistrikt = 'Risskov'

-- 5.8 Find navne på personer og hvilket firma, de arbejder i.
SELECT p.navn, f.firmanavn
FROM person p
LEFT JOIN ansati a ON p.cpr = a.cpr 
LEFT JOIN firma f ON a.firmanr = f.firmanr

SELECT * FROM person

-- 5.9 Find navne på de personer, der er ansat i et Firma.
SELECT p.navn
FROM person p
JOIN ansati a ON p.cpr = a.cpr

SELECT navn FROM person