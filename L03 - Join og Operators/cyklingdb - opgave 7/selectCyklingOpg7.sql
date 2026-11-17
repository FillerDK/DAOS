USE cykling

-- Opgave 7
-- Denne opgave vedrører en database over samtlige placeringer for danske (professionelle)
-- cykelryttere ved verdensmesterskaberne i perioden 1967 til og med 2021. Script til oprettelse af
-- tabeller, samt indsættelse af data findes på Canvas.

-- Bemærk der er kun oplysninger om danske cykelryttere i databasen.

-- Lav SQL-queries til følgende:

-- 7.1 Lav en oversigt, der viser initialer, årstal og placeringer for alle ryttere, der har fuldførst.
SELECT TOP 10 init, aarstal, plac
FROM placering
WHERE plac IS NOT NULL

SELECT * FROM placering

-- 7.2 Udvid oversigten så rytterens fulde navn er med.
SELECT TOP 10 p.init, rytternavn, aarstal, plac
FROM placering p
JOIN rytter r ON p.init = r.init
WHERE plac IS NOT NULL

SELECT p.init, rytternavn, aarstal, plac
FROM placering p
JOIN rytter r ON p.init = r.init

-- 7.3 Udvid yderligere oversigten, så bynavn og land for det pågældende VM er med.
SELECT p.init, rytternavn, p.aarstal, plac, bynavn, land
FROM placering p
JOIN rytter r ON p.init = r.init
JOIN vm ON p.aarstal = vm.aarstal
WHERE plac IS NOT NULL

SELECT p.init, rytternavn, p.aarstal, plac, bynavn, land
FROM placering p
JOIN rytter r ON p.init = r.init
JOIN vm ON p.aarstal = vm.aarstal

-- 7.4 Lav en oversigt, der viser alle placeringer med rytterens navn, placering og årstal.
-- Oversigten skal være sorteret så de bedste placeringer kommer først, I tilfælde af ens
-- placeringer skal placeringen i det ældste årstal komme først.
SELECT rytternavn, plac, aarstal
FROM rytter r
JOIN placering p ON r.init = p.init
WHERE plac IS NOT NULL
ORDER BY plac, aarstal

SELECT rytternavn, plac, aarstal
FROM rytter r
JOIN placering p ON r.init = p.init
ORDER BY plac, aarstal

-- 7.5 Lav en oversigt, der viser det fulde navn på de ryttere, der har fuldførst mindst et VM.
SELECT DISTINCT rytternavn
FROM rytter r
JOIN placering p ON r.init = p.init
WHERE plac IS NOT NULL

SELECT DISTINCT rytternavn, plac
FROM rytter r
JOIN placering p ON r.init = p.init

-- 7.6 Lav en oversigt, der viser det fulde navn på de ryttere, der mindst en gang ikke har fuldført
-- et VM i Italien.
SELECT DISTINCT rytternavn, land, plac
FROM rytter r
JOIN placering p ON p.init = r.init
JOIN vm ON vm.aarstal = p.aarstal
WHERE plac IS NULL and land = 'Italien'
ORDER BY rytternavn

SELECT rytternavn, land, plac
FROM rytter r
JOIN placering p ON p.init = r.init
JOIN vm ON vm.aarstal = p.aarstal
ORDER BY rytternavn

-- 7.7 Lav en oversigt, der viser det fulde navn på de ryttere, der har opnået medalje (dvs er blevet
-- 1, 2 eller 3).
SELECT DISTINCT rytternavn
FROM rytter r
JOIN placering p ON p.init = r.init
WHERE plac BETWEEN 1 AND 3

SELECT rytternavn, plac
FROM rytter r
JOIN placering p ON p.init = r.init

-- 7.8 Find den dårligste placering (bare placeringen - ikke hvem eller hvornår).
SELECT MAX(plac) AS 'Dårligste placering'
FROM placering

SELECT *
FROM placering

-- 7.9 Find antallet af deltagelser.
SELECT COUNT(*) AS 'Deltagelser'
FROM placering

SELECT *
FROM placering
WHERE plac IS NOT NULL

-- 7.10 Find antallet af deltagelser, hvor rytteren ikke har fuldført.
SELECT COUNT(*) AS 'Deltagelser uden fuldførelse'
FROM placering
WHERE plac IS NULL

SELECT *
FROM placering
WHERE plac IS NULL

-- 7.11 Find ud af fuldførselsprocenten for deltagelser.
SELECT COUNT(plac) * 100.0 / COUNT(*) as 'Fuldførselsprocent'
FROM placering

SELECT COUNT(*)
FROM placering