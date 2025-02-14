-- 124 * 7 + 45

SELECT 124 * 7 + 45;

-- 2 ^ 20

SELECT POW(2, 20);

-- √3

SELECT SQRT(3);

-- π

SELECT PI();

--------------------------------------------------------
-- DATABASE employees

-- current_dept_emp?????: emp_no dept_no from_date to_date | 2204 (without NULL and without repetitions)
-- departments: dept_no dept_name | 9
-- dept_emp: emp_no dept_no from_date to_date | 16611 (duplicate 1605 emp_no 16611 - 1605 = 15006 -> employees)
-- dept_emp_latest_date: emp_no from_date to_date | 15006
-- dept_manager: emp_no dept_no from_date to_date | 24
-- employees: emp_no birth_date first_name last_name gender hire_date | 15006
-- salaries: emp_no salary from_date to_date | 138482
-- titles: emo_no title from_date to_date | 21646

-- repetitive (nothing is repeated more than 2 times)
SELECT emp_no FROM dept_emp GROUP BY emp_no HAVING COUNT(*) > 1;
SELECT COUNT(*) FROM (SELECT emp_no FROM dept_emp GROUP BY emp_no HAVING COUNT(*) > 1)  AS subquery; -- 1605
SELECT DISTINCT emp_no FROM current_dept_emp ORDER BY emp_no ASC; -- 2204
-- working
SELECT emp_no FROM dept_emp where to_date IS NULL; -- 12802
SELECT COUNT(*) FROM dept_emp WHERE to_date IS NULL; -- 12802
SELECT DISTINCT emp_no FROM dept_emp where to_date IS NULL; -- 12802 
-- finished
SELECT emp_no FROM dept_emp where to_date IS NOT NULL; -- 3809 | 16611 - 3809 = 12802
SELECT DISTINCT emp_no FROM dept_emp where to_date IS NOT NULL; -- 3586


-- Write a query that:

-- displays a list of all employees (name, surname, date of birth) sorted by last name descending

SELECT first_name, last_name, birth_date FROM employees ORDER BY last_name DESC;


-- displays a list of female employees (name and surname)

SELECT first_name, last_name FROM employees WHERE gender="f";


-- displays a list of employees sorted by surname ascending and by age descending

SELECT last_name, birth_date FROM employees ORDER BY last_name ASC, birth_date ASC;


-- displays an alphabetically sorted list of company positions as 'Company titles'

SELECT DISTINCT title AS "Company titles" FROM titles ORDER BY title ASC;


-- In what year was the oldest person born?

SELECT last_name, birth_date FROM employees ORDER BY birth_date ASC LIMIT 10;
-- SELECT min(birth_date) FROM employees;


-- How many people were employed on February 29?

SELECT last_name, hire_date FROM employees WHERE DATE_FORMAT(hire_date, "%m-%d") = "02-29";
SELECT COUNT(*) FROM employees WHERE DATE_FORMAT(hire_date, "%m-%d") = "02-29";


-- How many people have names starting with the letter 'S'?

SELECT first_name, last_name FROM employees WHERE first_name LIKE "s%";
SELECT COUNT(*) FROM employees WHERE first_name LIKE "s%";


-- How many people were hired on their birthday?

SELECT last_name, birth_date, hire_date FROM employees WHERE DATE_FORMAT(birth_date, "%m-%d") = DATE_FORMAT(hire_date, "%m-%d");
SELECT COUNT(*) FROM employees WHERE DATE_FORMAT(birth_date, "%m-%d") = DATE_FORMAT(hire_date, "%m-%d");


-- How many people are currently employed by the company?

SELECT COUNT(DISTINCT emp_no) FROM dept_emp WHERE to_date IS NULL;


-- How many people, during their career in the company, had a salary below 100 thousand?

SELECT COUNT(DISTINCT emp_no) FROM salaries WHERE salary < 100000;


-- How many female employees are there who meet all of the following conditions:
-- were hired on Monday
-- have a first name beginning with the letter 'M' or a last name beginning with the letter 'K'
-- were hired after 1986?

SELECT * FROM employees WHERE gender = "f" AND weekday(hire_date) = 0 AND (first_name LIKE "m%" OR last_name LIKE "k%") AND year(hire_date) > "1986";
SELECT COUNT(*) FROM employees WHERE gender = "f" AND weekday(hire_date) = 0 AND (first_name LIKE "m%" OR last_name LIKE "k%") AND year(hire_date) > "1986";


-- What is the longest (full years) that a person has worked continuously in one position?

SELECT TIMESTAMPDIFF(YEAR, from_date, ifnull(to_date, current_date())) AS "years" FROM titles ORDER BY years DESC LIMIT 1;