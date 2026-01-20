/* Exercise 1 — CTE
Using a CTE, calculate the average salary per department, then return
only departments with an average salary > 60,000
*/
WITH CTE_DepartmentAverageSalary as
(SELECT emp.DepartmentID, Salary, DepartmentName
FROM Employees as emp
JOIN Departments as dept
ON emp.DepartmentID = dept.DepartmentID)
SELECT DepartmentName, AVG(Salary) AS AvgSalary
FROM CTE_DepartmentAverageSalary
GROUP BY DepartmentName
HAVING AVG(Salary) > 60000
  
/* Exercise 2 — CTE + Window Function
Return employees whose salary is above the average salary of their
department
*/
WITH CTE_EmployeesAboveAverageDepartmentSalary as
(SELECT FirstName, DepartmentName, Salary, AVG(Salary) OVER
(PARTITION BY (DepartmentName)) as AVGSalary
FROM Employees
JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID)
SELECT FirstName, DepartmentName, Salary
FROM CTE_EmployeesAboveAverageDepartmentSalary
 WHERE Salary > AVGSalary
  
/* Exercise 3 — Temp Table
Create a temp table that stores: Department name Total number of
employees Average salary Then select all rows from the temp table.
*/
CREATE TABLE #temp_averagesalaryperdepartment
(DepartmentName varchar(50),
 EmployeeCount int, AvgSalary int)
INSERT #temp_averagesalaryperdepartment
SELECT DepartmentName, COUNT(*) DepartmentName, AVG(Salary)
as AvgSalary
FROM Employees as emp
JOIN Departments as dept
ON emp.DepartmentID = dept.DepartmentID
GROUP BY DepartmentName
SELECT * FROM #temp_averagesalaryperdepartment
  
/* Exercise 4 — String Cleaning
Clean and format employee names:
 Remove leading and trailing spaces from FirstName
 Convert LastName to uppercase
 Replace letter o with 0 in LastName
 Display only the first 3 letters of the cleaned FirstName
*/
SELECT SUBSTRING(TRIM(FirstName),1,3) as CleanFirstName,
REPLACE(UPPER(LastName),'o','0') as CleanLastName
FROM Employees
  
/* Exercise 5 — Stored Procedure Execution
Assume a stored procedure named GetEmployeesByDepartment exists.
It accepts a department name as a parameter and returns employees
from that department.
*/
EXEC GetEmployeesByDepartment @DepartmentName = 'IT'
  
/* Exercise 6 — Subquery in WHERE
Return employees whose salary is greater than the overall average
salary of all employees.
*/
SELECT FirstName, Salary
FROM Employees
WHERE Salary > (
 SELECT AVG(Salary)
 FROM Employees
);

/* Exercise 7 — Subquery in SELECT
Display each employee’s salary along with the company-wide average
salary.
*/
SELECT FirstName, Salary,
 (SELECT AVG(Salary) FROM Employees) as CompanyAvgSalary
FROM Employees
  
/* Exercise 8 — Subquery in FROM
Using a subquery in the FROM clause, return departments with an
average salary above 55,000.
*/
SELECT dept.DepartmentName, AvgSalary
FROM (SELECT DepartmentName, AVG(Salary) as AvgSalary FROM
Departments JOIN Employees
ON Departments.DepartmentID = Employees.DepartmentID
GROUP BY DepartmentName) dept
WHERE AvgSalary > 55000
