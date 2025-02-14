-- Write queries displaying information about candy boxes (name, price), along with data on:

-- total value of boxes (based on candy cost) that are in stock.
-- What is the "idpudelka" with the highest stock value?

-- GROUP has to be so that it doesn't add up all together
-- SELECT IDPudelka, p.nazwa, cena, SUM(Sztuk*Koszt*Stan) as koszt_cukr FROM pudelka as p NATURAL JOIN zawartosc JOIN cukierki USING(IDCukierka) GROUP BY IDPudelka ORDER BY koszt_cukr DESC;
SELECT p.IDPudelka, p.Nazwa, p.Cena, SUM(p.Stan * c.Koszt * z.Sztuk) AS wartosc FROM pudelka p JOIN zawartosc z ON p.IDPudelka = z.IDPudelka JOIN cukierki c ON z.IDCukierka = c.IDCukierka GROUP BY IDPudelka ORDER BY wartosc DESC;


-- total mass of candies with a primary key value starting with 'C' that are in the boxes.
-- What is the largest mass of these candies in one box?

-- p.=z. IMPORTANT!!!
SELECT p.IDPudelka, p.Nazwa, p.Cena, SUM(z.Sztuk * c.Masa) AS suma FROM pudelka p JOIN zawartosc z ON p.IDPudelka = z.IDPudelka JOIN cukierki c ON z.IDCukierka = c.IDCukierka AND c.IDCukierka LIKE "c%" GROUP BY IDPudelka ORDER BY suma DESC;


-- Write a query that calculates:
-- the mass of all the candies in the stock, what is it?

SELECT SUM(p.Stan * z.Sztuk * c.Masa) AS suma FROM pudelka p JOIN zawartosc z ON p.IDPudelka = z.IDPudelka JOIN cukierki c ON z.IDCukierka = c.IDCukierka;


-- the largest number of candies in one box, what number is it?

SELECT IDPudelka, SUM(Sztuk) AS sztuki FROM zawartosc GROUP BY IDPudelka ORDER BY sztuki DESC;


-- average weight of candy in individual boxes, what is the largest average weight of candy in a box?
-- total weight/candies

SELECT IDPudelka, IDCukierka, Sztuk, Masa, SUM(Sztuk * Masa)/SUM(Sztuk) as srednia FROM zawartosc NATURAL JOIN cukierki GROUP BY IDPudelka ORDER BY srednia DESC;

-- Write a query that displays information about the average order price, rounded to the nearest "złoty". What is this value?

SELECT ROUND(AVG(Suma)) FROM (SELECT SUM(Sztuk * Cena) AS Suma FROM artykuly NATURAL JOIN pudelka GROUP BY IDZamowienia) AS subquery;


-- Write a query that displays information about the candies that come in the most types of boxes.
-- How many of these candies are there?

SELECT * FROM pudelka NATURAL JOIN zawartosc;
SELECT IDCukierka, COUNT(DISTINCT IDPudelka) AS LiczbaPudelek FROM zawartosc GROUP BY IDCukierka ORDER BY LiczbaPudelek DESC;

SELECT COUNT(*) FROM (SELECT IDCukierka, COUNT(DISTINCT IDPudelka) AS LiczbaPudelek FROM zawartosc GROUP BY IDCukierka HAVING LiczbaPudelek = 4 ORDER BY LiczbaPudelek DESC) AS subquery;
SELECT COUNT(*) FROM (SELECT IDCukierka, COUNT(DISTINCT IDPudelka) AS LiczbaPudelek FROM zawartosc GROUP BY IDCukierka ORDER BY LiczbaPudelek DESC) AS subquery WHERE LiczbaPudelek = 4;


-- Write a query that returns the box that is most frequently ordered by customers
-- (appears in the most orders). What is its "idpudelka"?
-- it's not about how many there are, but how many orders it appears in!!!!!!

SELECT IDPudelka, COUNT(IDPudelka) as Suma FROM artykuly GROUP BY IDPudelka ORDER BY Suma DESC;