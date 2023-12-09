/*wec19b Assignment 2*/
/*I affirm that this is *MY* code!*/

/*Problem 1*/
/*1a*/
SELECT
	*
FROM
	employees
INNER JOIN
	jobs
ON 
	employees.job_id = jobs.job_id
ORDER BY
	job_id ASC;

/*1b*/
SELECT
	*
FROM
	employees
LEFT OUTER JOIN
	jobs
ON 
	employees.job_id = jobs.job_id
ORDER BY
	job_id ASC;

/*1c*/

/*All job titles are present and accounted for in both the jobs and employees table.
As both tables have same amount of job_ids, and at least one employee has each possible
job id, it follows that the methods from 1a and 1b will match in this respect. */

--Extra note; I wrote job_id ASC so I could also manually count job ids and make sure 
--this is true.

/*1d*/
SELECT
	*
FROM
	jobs
LEFT OUTER JOIN
	employees
ON 
	jobs.job_id = employees.job_id
ORDER BY
	job_id ASC;

/*1e*/
SELECT
	i.first_name,
	i.last_name,
	i.phone_number,
	c.job_id,
	c.job_title,
	c.max_salary
FROM
	employees AS i
INNER JOIN
	jobs AS c
ON
	i.job_id = c.job_id;
	
/*1f*/
SELECT
	i.first_name,
	i.last_name,
	i.phone_number,
	c.job_id,
	c.job_title,
	c.max_salary
FROM
	employees AS i
INNER JOIN
	jobs AS c
ON
	i.job_id = c.job_id
WHERE
	c.max_salary >= 9000
ORDER BY
	c.job_id ASC
LIMIT 15;
	


/*Problem 2*/
/*2a*/
SELECT
	c.location_id,
	c.city,
	c.country_id,
	b.department_id,
	b.department_name,
	a.first_name,
	a.last_name,
	a.email
FROM
	employees AS a
INNER JOIN
	departments AS b
ON
	a.department_id = b.department_id
INNER JOIN
	locations AS c
ON 
	b.location_id = c.location_id;
	
/*2b*/
SELECT
	d.country_name,
	c.location_id,
	c.city,
	c.country_id,
	b.department_id,
	b.department_name,
	a.first_name,
	a.last_name,
	a.email
FROM
	employees AS a
INNER JOIN
	departments AS b
ON
	a.department_id = b.department_id
INNER JOIN
	locations AS c
ON 
	b.location_id = c.location_id
INNER JOIN
	countries AS d
ON
	c.country_id = d.country_id;

-- WELL, it does have country_name as asked. It just happens to have country_id as well. 
	
/*2c*/
SELECT 
	*
FROM 
	employees
LEFT OUTER JOIN
	dependents
ON
	employees.employee_id = dependents.employee_id
WHERE
	dependent_id IS NULL;

/*2d*/
--First query
SELECT
	*
FROM
	countries
WHERE
	country_name LIKE '%s%';

--Second query
SELECT
	*
FROM
	countries
WHERE
	region_id=1 OR region_id=2
ORDER BY
	region_id ASC;

--Combined QUERY
SELECT
	*
FROM
	countries
WHERE
	country_name LIKE '%s%'
UNION ALL
SELECT
	*
FROM
	countries
WHERE
	region_id=1 OR region_id=2
ORDER BY
	region_id ASC;

/*2e*/
SELECT
	*
FROM
	countries
WHERE
	country_name LIKE '%s%'
INTERSECT
SELECT
	*
FROM
	countries
WHERE
	region_id=1 OR region_id=2
ORDER BY
	region_id ASC;

--The table using UNION ALL stacks both tables on top of each other, resulting in duplicate records.
--The table using INTERSECT gives us a table that only gives us records present in both tables.

/*Problem 3*/
/*3a*/
SELECT
	COUNT(salary) AS [under_10]
FROM
	employees
WHERE
	salary < 10000;

/*3b*/
SELECT
	last_name,
	LENGTH(last_name) AS [Last Name Length]
FROM
	employees
WHERE
	LENGTH(last_name) > 8
ORDER BY
	[Last Name Length] ASC;
	
/*3c*/
SELECT
	(SUBSTR(first_name, 1, 1) || '.' || last_name || ':' || email) AS [Name + Email]
FROM
	employees;
	
--I added spaces in the next version of the query for the sake of kerning and legibility.

SELECT
	(SUBSTR(first_name, 1, 1) || '. ' || last_name || ': ' || email) AS [Name + Email]
FROM
	employees;

/*3d*/
SELECT
	STRFTIME('%Y-%m-%d', '1977-08-16') - 
	STRFTIME('%Y-%m-%d', '1935-01-08') AS [Age at Death];

/*Problem 4*/
/*4a*/
SELECT
	AVG(salary) AS [Average Salary],
	MIN(salary) AS [Minimum Salary],
	MAX(salary) AS [Maximum Salary]
FROM
	employees;

/*4b*/
SELECT
	department_id,
	AVG(salary) AS [Average Salary]
FROM
	employees
GROUP BY
	department_id
ORDER BY
	department_id ASC;

/*4c*/
SELECT
	department_id,
	ROUND(AVG(salary),1) AS [Average Salary]
FROM
	employees
GROUP BY
	department_id
ORDER BY
	department_id ASC;


/*4d*/
SELECT
	department_id,
	ROUND(AVG(salary),1) AS [Average Salary]
FROM
	employees
GROUP BY
	department_id
HAVING
	AVG(salary) > 9000
ORDER BY
	department_id ASC;

/*4e*/
SELECT
	department_id,
	job_id,
	ROUND(AVG(salary),1) AS [Average Salary]
FROM
	employees
GROUP BY
	department_id, job_id
ORDER BY
	department_id, job_id;
