CREATE TABLE Employees (
 EmployeeID int,
 FirstName varchar(50),
 LastName varchar(50),
 DepartmentID int,
 Salary int,
 Age int
)

CREATE TABLE Departments (
 DepartmentID int,
 DepartmentName varchar(50)
)
  
CREATE TABLE Contractors (
 ContractorID int,
 FirstName varchar(50),
 DepartmentID int,
 HourlyRate int
)
