CREATE TABLE Employees (
 EmployeeID int,
 FirstName varchar(50),
 LastName varchar(50),
 DepartmentID int,
 Salary int)
  
CREATE TABLE Departments (
 DepartmentID int,
 DepartmentName varchar(50)
)
  
CREATE TABLE SalariesHistory (
 EmployeeID int,
 Year int,
 Salary int
)
