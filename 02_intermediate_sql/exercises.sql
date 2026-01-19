/* Exercise 1 - INNER JOIN - Return only employees who belong to an existing department.*/
SELECT FirstName, DepartmentName
FROM Employees
JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID
  
/* Exercise 2 - LEFT JOIN - Return all employees, including those without a department*/
SELECT FirstName, DepartmentName
FROM Employees
LEFT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID
  
/* Exercise 3 - RIGHT JOIN - Return all departments, including those with no employees. */
SELECT FirstName, DepartmentName
FROM Employees
RIGHT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID
  
/* Exercise 4 - FULL JOIN - Return all employees and all departments, matched where possible.*/
SELECT FirstName, DepartmentName
FROM Employees
FULL JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID
  
/* Exercise 5 - UNION - Return a unique list of first names from employees and contractors.*/
SELECT FirstName
FROM Employees
UNION
SELECT FirstName
FROM Contractors
  
/* Exercise 6 - UNION ALL - Return all first names from employees and contractors, including duplicates.*/
SELECT FirstName
FROM Employees
UNION ALL
SELECT FirstName
FROM Contractors
  
/* Exercise 7 - CASE STATEMENT
Classify employees based on salary
        %Ï Salary "e 70,000 !’ High
        %Ï Salary between 50,000 and 69,999 !’ Medium
        %Ï Salary < 50,000 !’ Low
*/
  
SELECT FirstName, Salary,
CASE N Salary >= 70000 THEN 'High'
 WHEN Salary BETWEEN 50000 AND 69999 THEN 'Medium'
 ELSE 'Low'
END AS SalaryLevel
FROM Employees
  
/* Exercise 8 - HAVING - Return departments that have more than 2 employees. */
SELECT DepartmentName, COUNT(Employees.DepartmentID) AS
EmployeeCount
FROM Employees
JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID
GROUP By DepartmentName
HAVING COUNT(Employees.DepartmentID) > 2
  
/* Exercise 9 - ALIASING - Return department name and average salary. Use clear, meaningful column aliases. */
SELECT DepartmentName AS Deparment, AVG(Salary) AS AVGSalary
FROM CompanyAnalytics.dbo.Employees AS Emp
JOIN CompanyAnalytics.dbo.Departments AS Dept
ON Emp.DepartmentID = Dept.DepartmentID
GROUP BY DepartmentName
  
/* Exercise 10 - PARTITION BY - Show each employee’s salary along with the average salary of their department.*/
SELECT FirstName, DepartmentName, Salary, AVG(Salary) OVER
(PARTITION BY (DepartmentName)) AS DeptAVGSalary
FROM Employees
JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID
  
/* Exercise 11 — PARTITION BY + CASE
Classify each employee’s salary relative to the average salary within their own department.
Within each department, label employees as: Above Avg and Below Avg.
*/
SELECT FirstName, DepartmentName, Salary,
CASE
 WHEN Salary > AVG(Salary) OVER (PARTITION BY
(DepartmentName)) THEN 'Above AVG'
 ELSE 'Below AVG'
END AS Comparison
FROM Employees
JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID
