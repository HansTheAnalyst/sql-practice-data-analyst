/*Part 1 — SELECT Basics*/

/* Exercise 1 - Retrieve all data from the Employees table*/
SELECT * FROM Employees

/* Exercise 2 - Retrieve only the first 5 rows*/
SELECT TOP 5 * FROM Employees

/* Exercise 3 - Retrieve all unique department names*/
SELECT DISTINCT (Department) FROM Employees

/*Part 2 — WHERE Clause*/

/* Exercise 4 - Retrieve employees older than 30*/
SELECT * FROM Employees WHERE Age > 30;

/* Exercise 5 - Retrieve employees not working in the IT department*/
SELECT * FROM Employees WHERE Department <> 'IT';

/* Exercise 6 - Retrieve employees whose age is between 25 and 35*/
SELECT * FROM Employees WHERE Age BETWEEN 25 AND 35;

/* Exercise 7 - Retrieve employees working in HR or Finance*/
SELECT * FROM Employees WHERE Department IN ('HR', 'Finance');

/*Part 3 — NULL Handling*/
/* Exercise 8 - Retrieve employees whose last name is missing*/
SELECT * FROM Employees WHERE LastName IS NULL;

/* Exercise 9 - Retrieve employees whose age is present*/
SELECT * FROM Employees WHERE Age IS NOT NULL;

/*Part 4 — LIKE & IN*/
/* Exercise 10 - Retrieve employees whose first name starts with the letter J*/
SELECT * FROM Employees WHERE FirstName LIKE 'J%';

/* Exercise 11 - ️Retrieve employees working in IT or HR*/
SELECT * FROM Employees WHERE Department IN ('IT', 'HR');

/*Part 5 — Aggregate Functions*/
/* Exercise 12 - Count the total number of employees*/
SELECT COUNT(*) as TotalNumberOfEmployees FROM Employees;

/* Exercise 13 - ️Count employees who have an age value*/
SELECT COUNT(Age) AS EmployeesWithAge FROM Employees;

/* Exercise 14 - ️Retrieve the highest salary*/
SELECT MAX(Salary) FROM Employees;

/* Exercise 15 - ️Retrieve the lowest salary*/
SELECT MIN(Salary) FROM Employees;

/* Exercise 16 - ️Retrieve the average salary*/
SELECT AVG(Salary) FROM Employees;

/*Part 6 — GROUP BY*/
/* Exercise 17 - Retrieve the number of employees per department*/
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;

/* Exercise 18 - ️Retrieve the average salary per department*/
SELECT Department, AVG(Salary) AS AvgSalaryPerDept
FROM Employees
GROUP BY Department;

/* Exercise 19 - ️Retrieve the highest salary per department*/
SELECT Department, MAX(Salary) AS MaxSalaryPerDept
FROM Employees
GROUP BY Department;

/*Part 7 —  ORDER BY*/
/* Exercise 20 -  Retrieve employees ordered by salary from highest to lowest*/
SELECT *
FROM Employees
ORDER BY Salary DESC;

/* Exercise 21 - ️Retrieve departments ordered by average salary (highest first)*/
SELECT Department, AVG(Salary)
FROM Employees
GROUP BY Department
ORDER BY AVG(Salary) DESC;





















