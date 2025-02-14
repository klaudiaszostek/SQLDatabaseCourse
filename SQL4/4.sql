-- Please "get a job in the company" in any department, in any position with a salary of 102 000

INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date) VALUES ((SELECT MAX(emp_no) + 1 FROM employees), '1990-01-01', 'Jan', 'Kowalski', 'M', CURDATE());
INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date) VALUES ((SELECT MAX(emp_no) FROM employees), 'd001', CURDATE(), NULL);
INSERT INTO titles (emp_no, title, from_date, to_date) VALUES ((SELECT MAX(emp_no) FROM employees), 'Senior Engineer', CURDATE(), NULL);
INSERT INTO salaries (emp_no, salary, from_date, to_date) VALUES ((SELECT MAX(emp_no) FROM employees), 102000, CURDATE(), NULL);


-- Please "quit" the company by deleting the appropriate entry in the employees table.

DELETE FROM employees WHERE first_name = 'Jan' AND last_name = 'Kowalski';


-- Write a query to create IT section 'd010'

SELECT * FROM departments ORDER BY dept_no ASC;
INSERT INTO departments VALUES ('d010', 'IT');


-- Assign the highest-paid employee among the longest-serving (current) employees as the department manager,
-- who has not been a manager yet. What is their number?

SELECT * FROM employees NATURAL JOIN salaries WHERE to_date IS NULL AND emp_no NOT IN (SELECT emp_no FROM titles WHERE title = "Manager") ORDER BY hire_date ASC, salary DESC LIMIT 10;
INSERT INTO dept_manager VALUES((SELECT emp_no FROM employees NATURAL JOIN salaries WHERE to_date IS NULL AND emp_no NOT IN (SELECT emp_no FROM titles WHERE title = "Manager") ORDER BY hire_date ASC, salary DESC LIMIT 1), "d010", "2025-01-26", NULL);


-- Update and add entries in other tables (titles, dept_emp)

INSERT INTO titles VALUES(296555, 'Manager', "2025-01-26", NULL);
INSERT INTO dept_emp VALUES(296555, 'd010', "2025-01-26", NULL);


-- Write and execute queries that restore the database to its previous state

DELETE FROM dept_manager WHERE from_date="2025-01-26";
DELETE FROM departments WHERE dept_no="d010";
DELETE FROM salaries WHERE from_date="2025-01-26";
DELETE FROM titles WHERE from_date="2025-01-26";


-------------------------------------------------------------------------------

-- cukierki.sql

-- Please write a query that displays all possible pairs (the order in the pair matters)
-- different customers from the same city, how many such pairs are there?

SELECT k1.nazwa, k2.nazwa, k1.miejscowosc, k2.miejscowosc FROM klienci k1 JOIN klienci k2 ON k1.miejscowosc = k2.miejscowosc AND NOT k1.idklienta = k2.idklienta;
-- Please modify the query to ignore the order in the pair
-- (two people in one row should appear only once)
SELECT k1.nazwa, k2.nazwa, k1.miejscowosc, k2.miejscowosc FROM klienci k1 JOIN klienci k2 ON k1.miejscowosc = k2.miejscowosc AND k1.idklienta < k2.idklienta;


-- Please create a query that returns all possible pairs of customers,
-- where one has a name starting with the letter 'J' and the other with the letter 'C' or 'D'. How many such pairs are there?

SELECT k1.nazwa, k2.nazwa FROM klienci k1 JOIN klienci k2 ON k1.nazwa LIKE "j%" AND (k2.nazwa LIKE "c%" OR k2.nazwa LIKE "d%");


-- Please write a query (using joins) that returns information about orders (IDZamowienia),
-- which contain marshmallows or lollipops. How many such orders are there?

-- SELECT * FROM artykuly NATURAL JOIN pudelka WHERE nazwa RLIKE "Pian|Lizak";
SELECT DISTINCT IDZamowienia FROM artykuly NATURAL JOIN pudelka WHERE nazwa RLIKE "Pian|Lizak";