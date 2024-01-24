create database affan;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
	ProjectID INT,
    Salary DECIMAL(10, 2),
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
	FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID,ProjectID,Salary)
VALUES
    (1, 'John', 'Doe', 1,4, 60000.00),
    (2, 'Jane', 'Smith', 2, 3, 55000.00),
    (3,'Mike', 'Johnson', 1, 3, 65000.00),
    (4, 'Emily', 'Williams', 3, 2, 70000.00),
    (5, 'David', 'Brown', 2,2, 50000.00),
    (6, 'Sarah', 'Miller', 1, 3, 62000.00),
    (7, 'Chris', 'Wilson', 3, 4, 75000.00),
    (8, 'Anna', 'Jones', 2, 4, 53000.00),
    (9, 'Brian', 'Taylor', 1,2, 58000.00),
    (10, 'Laura', 'Anderson', 3, 4, 72000.00);


-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);


INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');
	
CREATE TABLE Projects(
    ProjectID INT PRIMARY KEY identity,
    ProjectName VARCHAR(50),
	StartDate date
	);
	
INSERT INTO Projects (ProjectName, StartDate)
VALUES
    ('com','5-2-2');

	select * from Employees;

	 -- 4 Assign each employee to a department in the Employees table
	 SELECT * FROM Employees  INNER JOIN Projects ON Employees.projectID = Projects.projectID
	INNER JOIN Departments  ON Employees.DepartmentID = Departments.DepartmentID;

	 -- 5REtrieve the details of employees whose salary is above 50000.
	select Salary from Employees where Salary>=50000;

 -- 6 Fetch a list of all employees along with the department they belong to.
	SELECT FirstName,LastName,DepartmentName FROM Employees	INNER JOIN Departments  ON Employees.DepartmentID = Departments.DepartmentID;

	--7. Retrieve the employees whose last name starts with 'S'.
	SELECT * FROM Employees	WHERE LastName LIKE 'S%';

	--8. Retrieve the projects with names containing the word 'Database'
	
	 SELECT  FirstName,LastName,ProjectName FROM Employees  INNER JOIN Projects ON Employees.projectID = Projects.projectID;

	--9. Calculate the total salary of all employees.
	select sum(salary) from Employees;

	--10.Find the department with the highest average salary.
     Select AVG(salary) from Employees;


 SELECT  sum(salary) FROM Employees group by(LastName);

  SELECT DepartmentName , sum(salary) as salary FROM Employees
  INNER JOIN Projects ON Employees.projectID = Projects.projectID
INNER JOIN Departments  ON Employees.DepartmentID = Departments.DepartmentID group by (DepartmentName);

SELECT projectName,sum(salary) as salary FROM Employees
INNER JOIN Projects  ON Employees.projectID = Projects.projectID group by (projectName) with rollup;

SELECT projectName,sum(salary) as salary FROM Employees
INNER JOIN Projects  ON Employees.projectID = Projects.projectID group by (projectName) with cube;

SELECT DepartmentName , sum(salary) as salary FROM Employees
INNER JOIN Departments  ON Employees.DepartmentID = Departments.DepartmentID group by cube(DepartmentName , salary);


