-- How many employees are there whose first name starts with 'A' and last name ends with 'Y'?

SELECT first_name, last_name FROM employees WHERE first_name LIKE "a%" AND last_name LIKE "%y";
SELECT COUNT(*) FROM employees WHERE first_name LIKE "a%" AND last_name LIKE "%y";
SELECT COUNT(*) FROM employees WHERE first_name RLIKE "^a" AND last_name RLIKE "y$";

-- How many job titles are there that consist of at least two words?

SELECT DISTINCT title FROM titles WHERE title LIKE "% %";
SELECT COUNT(DISTINCT title) FROM titles WHERE title LIKE "% %";


-- How many employees are there whose name (total):
-- contains the letter 'B' or 'C',
-- does not contain the letter 'E',
-- does not end with the letter 'N'.

-- start -> RLIKE "^s"
-- end -> RLIKE "i$"

-- RLIKE
SELECT first_name FROM employees WHERE first_name RLIKE "[bc]" AND first_name NOT RLIKE "e" AND first_name NOT RLIKE "n$";
SELECT COUNT(*) FROM employees WHERE first_name RLIKE "[bc]" AND first_name NOT RLIKE "e" AND first_name NOT RLIKE "n$";
SELECT COUNT(*) FROM employees WHERE (first_name RLIKE "b" OR first_name RLIKE "c") AND first_name NOT RLIKE "e" AND first_name NOT RLIKE "n$";

-- LIKE
SELECT COUNT(*) FROM employees WHERE (first_name LIKE "%b%" OR first_name LIKE "%c%") AND first_name NOT LIKE "%e%" AND first_name NOT LIKE "%n";              -- nie kończy się na literę 'N'


-- How many employees are there whose name starts with "S" and contains exactly three vowels (a, e, i, o, u, y)?

SELECT COUNT(*) FROM employees WHERE first_name RLIKE "^s" AND LENGTH(REGEXP_REPLACE(first_name, "[^aeiouy]", "")) = 3;
-- [^aeiouy]: Matches anything that isn't a vowel. Removes anything but vowels,
-- to easily count them with LENGTH().


-- How many employees are there whose name is a palindrome?

SELECT COUNT(*) FROM employees WHERE first_name = REVERSE(first_name);


-- What is the name of an employee whose name consists only of consonants?

SELECT first_name FROM employees WHERE first_name NOT RLIKE "[aeiouy]";
SELECT DISTINCT first_name FROM employees WHERE first_name NOT RLIKE "[aeiouy]";


-- How many employees were employed between 01.01.1990 and 31.12.1995 who ever worked in the position of 'Senior Staff'?
-- "JOIN" AND "ON"
-- possibly with DISTINCT

SELECT COUNT(e.emp_no) FROM employees e JOIN titles t ON e.emp_no = t.emp_no WHERE e.hire_date BETWEEN "1990-01-01" AND "1995-12-31" AND t.title = "Senior Staff";
SELECT COUNT(e.emp_no) FROM employees e JOIN titles t ON e.emp_no = t.emp_no WHERE hire_date BETWEEN "1990-01-01" AND "1995-12-31" AND title = "Senior Staff";


-- How many workers have been hired since employee salaries exceeded $120,000?

SELECT from_date FROM salaries WHERE salary > 120000 ORDER BY from_date LIMIT 1;
SELECT COUNT(*) FROM employees WHERE hire_date >= (SELECT from_date FROM salaries WHERE salary > 120000 ORDER BY from_date ASC LIMIT 1);


-- How many employees currently work in a managerial position?

SELECT COUNT(*) FROM employees WHERE hire_date >= (SELECT from_date FROM salaries WHERE salary > 120000 ORDER BY from_date LIMIT 1);
SELECT COUNT(e.emp_no) FROM employees e JOIN titles t ON e.emp_no = t.emp_no WHERE title = "Manager" AND hire_date >= (SELECT from_date FROM salaries WHERE salary > 120000 ORDER BY from_date ASC LIMIT 1) AND to_date IS NULL;
SELECT COUNT(e.emp_no) FROM employees e JOIN titles t ON e.emp_no = t.emp_no WHERE title = "Manager" AND hire_date >= "1989-05-22" AND to_date IS NULL;


-- How many employees are there who are (currently) working in positions previously held by current managers?

SELECT emp_no FROM titles WHERE to_date IS NULL AND title= "Manager";
-- The number of the person who is in "titles" and is currently the Manager.

SELECT DISTINCT title from titles WHERE emp_no IN (...) AND NOT title='Manager';
-- Titles "abandoned" by current managers

SELECT title from titles WHERE emp_no IN (SELECT emp_no FROM titles WHERE to_date IS NULL AND title= "Manager") AND NOT title='Manager';
-- Positions

SELECT COUNT(*) FROM titles WHERE title IN (SELECT title from titles WHERE emp_no IN (SELECT emp_no FROM titles WHERE to_date IS NULL AND title= "Manager") AND NOT title='Manager') AND to_date IS NULL;
-- Current total of positions previously occupied by Managers