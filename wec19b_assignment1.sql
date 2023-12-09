/*wec19b Assignment 1*/
/*I affirm that this is *MY* code!*/

/*Problem 1*/
/*1a*/
SELECT
	last_name,
	first_name,
	phone_number
FROM
	employees;

/*Hmm...looks like some of these people have no phone numbers on record.
I wonder if this will be important later.*/

/*1b*/
--To start, we have 40 records/rows displayed in the code for 1(a).

/*1c*/
SELECT
	last_name AS [Last Name],
	first_name AS [First Name],
	phone_number AS [Contact]
FROM
	employees;

/*1d*/
SELECT
	first_name AS [First Name],
	last_name AS [Last Name],
	phone_number AS [Contact]
FROM
	employees;

/*1e*/
SELECT
	employee_id,
	department_id,
	salary
FROM
	employees
ORDER BY
	department_id ASC;
	
/*1f*/
SELECT
	employee_id,
	department_id,
	salary
FROM
	employees
ORDER BY
	department_id DESC,
	salary DESC;

/*1g*/
SELECT
	employee_id,
	salary
FROM
	employees
ORDER BY
	salary DESC
LIMIT 6;

/*1h*/
--The employee ID of the person with the fourth-highest salary is 145.

/*Problem 2*/
/*2a*/
SELECT
	employee_id,
	salary,
	salary/12 AS [monthly_salary],
	(salary/12)*0.062 AS [social_security],
	(salary/12)*0.0145 AS [medicare]
FROM
	employees;

--I ran a few of these arithmetically myself, and they should be correct.
	
/*2b*/
SELECT
	employee_id,
	salary,
	(salary*1.055)+1200 AS [new_salary]
FROM
	employees
ORDER BY
	new_salary ASC;

/*2c*/
SELECT
	last_name,
	first_name,
	email,
	employee_id,
	salary,
	(salary*1.055)+1200 AS [new_salary]
FROM
	employees
WHERE
	department_id IS 10
ORDER BY
	salary DESC;

/*2d*/
SELECT
	last_name,
	first_name,
	hire_date
FROM
	employees
WHERE
	(Date(hire_date) > '1994-12-31') AND (Date(hire_date) < '1998-01-01')
ORDER BY
	hire_date ASC;

/*2e*/
--The last employee hired in 1996 was John Russell

/*2f*/
SELECT
	last_name,
	first_name,
	job_id
FROM
	employees
WHERE
	job_id = 5 OR job_id=6 OR job_id=14 OR job_id=17
ORDER BY
	job_id ASC;

/*2g*/
SELECT
	first_name,
	last_name
FROM
	employees
WHERE
	last_name LIKE '%y'
ORDER BY
	last_name DESC;

/*2h*/
--With the above query, the first name that appears in the table is Den Raphaely

/*Problem 3*/
/*3a*/
SELECT
	employee_id,
	email,
	salary,
	department_id
FROM
	employees
WHERE
	(department_id = 8 OR department_id = 10) AND salary > 10000;
	
/*3b*/
--Three employees were pulled with the above query.

/*3c*/
SELECT
	first_name,
	last_name,
	job_id
FROM
	employees
WHERE
	(job_id = 9 OR job_id = 13 OR job_id = 19) AND (first_name LIKE 'A%' OR last_name LIKE '%s%')
ORDER BY
	job_id ASC,
	last_name ASC;

/*3d*/
--The name of the last employee returned with the above query is Matthew Weiss.

/*3e*/
SELECT
	employee_id,
	salary,
CASE
	WHEN salary < 4500 THEN 'Low'
	WHEN salary BETWEEN 4501 AND 8000 THEN 'Below Average'
	WHEN salary BETWEEN 8001 AND 10000 THEN 'Above Average'
	ELSE 'High'
END AS salary_class
FROM
	employees
ORDER BY
	salary ASC;
