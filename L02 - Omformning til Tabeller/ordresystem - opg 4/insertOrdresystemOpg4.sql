USE ordresystem

-- Opgave 4.3
-- Lav et script med en række inserts, så der er lidt data i tabellerne.

GO

INSERT INTO vare VALUES(1, 'Fodbold', 175, 10)
INSERT INTO vare VALUES(2, 'Håndbold', 125, 15)
INSERT INTO vare VALUES(3, 'Basketball', 150, 0)
INSERT INTO vare VALUES(4, 'Baseball', 45, 15)
INSERT INTO vare VALUES(5, 'Bordtennis bold', 2, 100)

INSERT INTO kunde VALUES(100001, 'Hans Sørensen', 'Hobrovej 3')
INSERT INTO kunde VALUES(100002, 'Søren Hansen', 'Randersvej 7')
INSERT INTO kunde VALUES(100003, 'Mads Jørgensen', 'Aarhusvej 89')
INSERT INTO kunde VALUES(100004, 'Jørgen Madsen', 'Viborgvej 12')
INSERT INTO kunde VALUES(100005, 'Jens Lauristsen', 'Hadsundvej 300')
INSERT INTO kunde VALUES(100006, 'Laurits Jensen', 'Greenåvej 43')

INSERT INTO ordre VALUES(358308, '2024-05-23', 1, 100001)
INSERT INTO ordre VALUES(356987, '2024-05-04', 1, 100002)
INSERT INTO ordre VALUES(337691, '2024-01-09', 1, 100003)
INSERT INTO ordre VALUES(362509, '2024-07-16', 0, 100004)
INSERT INTO ordre VALUES(350826, '2024-04-25', 1, 100005)
INSERT INTO ordre VALUES(375036, '2024-08-30', 0, 100006)

INSERT INTO ordrelinje VALUES(3000000, 3, 337691, 2)
INSERT INTO ordrelinje VALUES(3000001, 1, 362509, 4)
INSERT INTO ordrelinje VALUES(3000002, 2, 358308, 2)
INSERT INTO ordrelinje VALUES(3000003, 4, 350826, 1)
INSERT INTO ordrelinje VALUES(3000004, 3, 375036, 2)
INSERT INTO ordrelinje VALUES(3000005, 5, 356987, 5)
