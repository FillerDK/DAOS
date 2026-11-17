use tempdb

-- Instruktører
insert into instruktor (navn, adresse) values ('Joe Johnston', 'Instruktørvej 1')
insert into instruktor (navn, adresse) values ('Anna Boden', 'Instruktørvej 2')
insert into instruktor (navn, adresse) values ('Ryan Felck', 'Instruktørvej 3')
insert into instruktor (navn, adresse) values ('Jon Favreau', 'Instruktørvej 4')
insert into instruktor (navn, adresse) values ('Shane Black', 'Instruktørvej 5')

-- Film
insert into film (titel, udgivelsesAar, laengde, instruktorId) values ('Captain America: The First Avenger', 2011, 124, 1)
insert into film (titel, udgivelsesAar, laengde, instruktorId) values ('Captain Marvel', 2019, 123, 2)
insert into film (titel, udgivelsesAar, laengde, instruktorId) values ('Iron Man', 2008, 126, 4)
insert into film (titel, udgivelsesAar, laengde, instruktorId) values ('Iron Man 2', 2010, 124, 4)
insert into film (titel, udgivelsesAar, laengde, instruktorId) values ('Iron Man 3', 2013, 130, 5)

-- Skuespillere
insert into skuespiller (navn, adresse) values ('Chris Evans', 'Skuespillervej 1')
insert into skuespiller (navn, adresse) values ('Hugo Weaving', 'Skuespillervej 2')
insert into skuespiller (navn, adresse) values ('Samuel L. Jackson', 'Skuespillervej 3')
insert into skuespiller (navn, adresse) values ('Brie Larson', 'Skuespillervej 4')
insert into skuespiller (navn, adresse) values ('Ben Mendelsohn', 'Skuespillervej 5')
insert into skuespiller (navn, adresse) values ('Robert Downey Jr.', 'Skuespillervej 6')
insert into skuespiller (navn, adresse) values ('Gwyneth Paltrow', 'Skuespillervej 7')
insert into skuespiller (navn, adresse) values ('Terrence Howard', 'Skuespillervej 8')
insert into skuespiller (navn, adresse) values ('Mickey Rourke', 'Skuespillervej 9')
insert into skuespiller (navn, adresse) values ('Guy Pearce', 'Skuespillervej 10')

-- Medvirkende
insert into medvirkende (skuespillerid, titel) values (1, 'Captain America: The First Avenger')
insert into medvirkende (skuespillerid, titel) values (2, 'Captain America: The First Avenger')
insert into medvirkende (skuespillerid, titel) values (3, 'Captain America: The First Avenger')
insert into medvirkende (skuespillerid, titel) values (4 , 'Captain Marvel')
insert into medvirkende (skuespillerid, titel) values (3 , 'Captain Marvel')
insert into medvirkende (skuespillerid, titel) values (5 , 'Captain Marvel')
insert into medvirkende (skuespillerid, titel) values (6 , 'Iron Man')
insert into medvirkende (skuespillerid, titel) values (7 , 'Iron Man')
insert into medvirkende (skuespillerid, titel) values (8 , 'Iron Man')
insert into medvirkende (skuespillerid, titel) values (6 , 'Iron Man 2')
insert into medvirkende (skuespillerid, titel) values (9 , 'Iron Man 2')
insert into medvirkende (skuespillerid, titel) values (7 , 'Iron Man 2')
insert into medvirkende (skuespillerid, titel) values (6 , 'Iron Man 3')
insert into medvirkende (skuespillerid, titel) values (10 , 'Iron Man 3')
insert into medvirkende (skuespillerid, titel) values (7 , 'Iron Man 3')