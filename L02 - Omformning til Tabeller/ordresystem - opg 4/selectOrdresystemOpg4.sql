USE ordresystem

-- Opgave 4.4
-- Lav SELECT-sætninger til følgende:

-- 4.4.1 Find datoer, hvor der har været odrer.
SELECT dato
FROM ordre

-- 4.4.2 Find de varer, der er udsolgt (antalpaalager = 0).
SELECT antalpaalager
FROM vare
WHERE antalpaalager = 0

-- 4.4.3 Lav en liste med alle varer ordnet efter pris, så den dyreste kommer først.
SELECT *
FROM vare
ORDER BY pris DESC

-- 4.4.4 Lav en liste med alle ikke udsolgte varer ordnet efter pris, så den billigste kommer først.
SELECT *
FROM vare
WHERE antalpaalager != 0
ORDER BY pris
