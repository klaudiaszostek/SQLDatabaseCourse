-- Write a query that displays information about customers (name, street, city) who:

-- placed orders with "DataRealizacji" -> September 2016

SELECT * FROM klienci NATURAL JOIN zamowienia;
-- "Y" not "y"
SELECT IDKlienta, Nazwa, Ulica, Miejscowosc, DataRealizacji FROM klienci NATURAL JOIN zamowienia WHERE DATE_FORMAT(DataRealizacji, "%Y-%m")="2016-09";


-- ordered a box of „Zestaw lizakow” or „Pianki ogniskowe”

SELECT Nazwa, Ulica, Miejscowosc FROM klienci WHERE IDKlienta IN(SELECT IDKlienta FROM zamowienia WHERE IDZamowienia IN(SELECT IDZamowienia FROM artykuly WHERE IDPudelka IN(SELECT IDPudelka FROM pudelka WHERE Nazwa = "Zestaw lizakow" OR Nazwa = "Pianki ogniskowe")));


-- ordered at least 2 boxes of „Czekoladowe melodie” or at least 2 boxes of „Lizaki swiateczne” 
-- within one order

SELECT Nazwa, Ulica, Miejscowosc FROM klienci WHERE IDKlienta IN(SELECT IDKlienta FROM zamowienia WHERE IDZamowienia IN(SELECT IDZamowienia FROM artykuly WHERE Sztuk > 1 AND IDPudelka IN(SELECT IDPudelka FROM pudelka WHERE Nazwa = "Czekoladowe melodie" OR Nazwa = "Lizaki swiateczne")));


-- ordered boxes that contain candies with blue dye

SELECT Nazwa, Ulica, Miejscowosc FROM klienci WHERE IDKlienta IN(SELECT IDKlienta FROM zamowienia WHERE IDZamowienia IN(SELECT IDZamowienia FROM artykuly WHERE IDPudelka IN(SELECT IDPudelka FROM zawartosc WHERE IDCukierka IN(SELECT IDCukierka FROM cukierki WHERE Barwniki RLIKE "niebieski"))));


-- have placed at least one order

SELECT Nazwa, Ulica, Miejscowosc FROM klienci WHERE IDKlienta IN(SELECT IDKlienta FROM zamowienia);


-- didn't place any orders

SELECT Nazwa, Ulica, Miejscowosc FROM klienci WHERE IDKlienta NOT IN(SELECT IDKlienta FROM zamowienia);


-- placed exactly 5 orders

SELECT * FROM zamowienia GROUP BY IDKlienta HAVING COUNT(*)=5;
SELECT Nazwa, Ulica, Miejscowosc FROM klienci WHERE IDKlienta IN(SELECT IDKlienta FROM zamowienia GROUP BY IDKlienta HAVING COUNT(*)=5);
-- SELECT Nazwa, Ulica, Miejscowosc FROM klienci WHERE IDKlienta IN (SELECT IDKlienta FROM zamowienia GROUP BY IDKlienta HAVING COUNT(IDKlienta) = 5);
