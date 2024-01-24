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

	select FirstName,ProjectName,DepartmentName,salary from Employees as e inner join Projects as p on e.ProjectID=p.ProjectID
	inner join Departments as d on d.DepartmentID=e.DepartmentID; 

	select sum(salary) from Employees;	
	select count(salary) from Employees;
	select avg(salary) from Employees;
	select min(salary) from Employees;
	select max(salary) from Employees;

	create login affan with password ='111';
	
	create view emp as
	SELECT firstname,lastname 
from Employees;

update Employees set FirstName= 'oppo' where EmployeeID =5;

	select * from Emp;

	sp_helptext emp;

	select OBJECT_DEFINITION(object_id ('emp'));

	--scalar function

	create function emmp()
	returns varchar(90)
	begin
	return 'affan'
	end

	select dbo.emmp();

	select dbo.firstname() as firstname;

	--scalar function with varible

	create function addition(@num1 as int, @num2 as int)
	returns int
	begin
	return (@num1 + @num2)
	end

	select dbo.addition(09 ,9) as addition;

	--scalar function with variable or condition
	create function std(@age as int)
	returns varchar(222)
	begin
	declare @str varchar(89)
	if(@age >= 16)
	begin
	set @str = 'you can take'
	end
	else
	begin 
	set @str='you can not take'
	end
	return @str
	end

	select dbo.std(9) as your_age;
	select dbo.std(19) as your_age;
	
	--table-value function
	create function short()
	returns table
	as
	return select * from Employees

	select * from short();

	create function male (@gender as varchar(90))
	returns table 
	as 
	return select distinct firstname from Employees where lastname = @gender

	select * from male('smith');

	
	alter function project()
	returns table 
	as 
	return 	select FirstName,ProjectName,DepartmentName,salary from Employees as e inner join Projects as p on e.ProjectID=p.ProjectID
	inner join Departments as d on d.DepartmentID=e.DepartmentID; 
	
	select * from sal();
	
	--STORED PROCEDURE
	create procedure spmaleemp
	as
	begin
	select * from Employees 
	end

	exec spmaleemp;

	create procedure spjoin
	as
	begin
	select * from Employees as e inner join  projects as p on e.ProjectID= p.ProjectID;
	end

	exec spjoin;

	alter procedure spinnerjoin
	as
	begin
	select FirstName,LastName,Salary,ProjectName,StartDate,DepartmentName from Employees as e
	inner join  projects as p on e.ProjectID= p.ProjectID
	inner join Departments as d on e.DepartmentID=d.DepartmentID;
	end

	exec spinnerjoin;

	alter procedure spresult
	as
	begin
	select ProjectName,FirstName,LastName,Salary,DepartmentName,StartDate from Employees as e
	inner join  projects as p on e.ProjectID= p.ProjectID
	inner join Departments as d on e.DepartmentID=d.DepartmentID;
	end

	exec spresult;

	
	--STORED PROCEDURE WITH VARIABLE
	create procedure sppra
	@id varchar(90)
	as
	begin
	select * from Employees where EmployeeID = @id;
	end

	exec sppra @id = 2;

	--sp with prameters	
	create procedure spgen
	@pname varchar(90) , @dname varchar(90)
	as
	begin
	select * from Employees as e inner join  projects as p on e.ProjectID= p.ProjectID
	inner join Departments as d on e.DepartmentID=d.DepartmentID where ProjectName=@pname or DepartmentName=@dname; 
	end

	exec spgen @pname = courier , @dname=hr;

	--incr
	alter procedure spincr
	@id int , @fname varchar(90)
	as
	begin
	UPDATE Employees SET Salary = Salary * 5  WHERE EmployeeID = @id or FirstName=@fname;
	end
	
	exec spincr @id = 2 , @fname='j';

	alter procedure spvara
	@id int , @fname varchar(90)
	as
	begin
	UPDATE Employees SET Salary = Salary *5/100 WHERE EmployeeID = @id or FirstName=@fname;
	end

	exec spvara @id = 2 , @fname='jane';

	select * from Employees;

alter procedure pro
	@id int , @fname varchar(90)
	as
	begin
	UPDATE Employees SET Salary = Salary *1.05 WHERE EmployeeID = @id or FirstName=@fname;
	select * from Employees where EmployeeID=@id;
	end

	exec pro @id =3, @fname=firstName;
	select * from Employees;

	--TRIGGER AFTER TRIGGER
	create trigger tr_emp on Employees
	for insert
	as
	begin
	print'data insert'
	end

	INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID,ProjectID,Salary)
	VALUES(100, 'arbab', 'ali', 2,2, 6000);

	select * from Employees;

   --DELETE AFTER TRIGGER
	create trigger tr_employee on Employees
	for delete
	as
	begin
	print'data insert'
	end

	Delete from Employees where EmployeeID = 100;

	create trigger tr_update on Employees
	for update
	as
	begin
	select * from  inserted
	select * from deleted
	end

	update Employees set FirstName='rohan' where EmployeeID=7;

	--insert anothr table
	create table insert_trigger(
	id int primary key identity,
	info varchar(99)
	)
	alter trigger tr_table on Employees
	for insert
	as
	declare @id int , @info varchar(90)
	begin
	select @id =EmployeeID ,@info=FirstName from inserted
	insert into insert_trigger values('user with id  ' + CAST(@id as varchar(111)) + '   with name ' +@info) 
	end
	
	INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID,ProjectID,Salary)
	VALUES(103, 'khan', 'ali', 2,2, 6000);

	select * from insert_trigger;

	--delete triger
	create table delete_trigger(
	id int primary key identity,
	info varchar(99)
	)

	create trigger trdelete on Employees
	for insert
	as
	declare @id int , @info varchar(90)
	begin
	select @id =EmployeeID ,@info=FirstName from deleted
	insert into delete_trigger values('user with id  ' + CAST(@id as varchar(111)) + '   with name ' +@info) 
	end

	delete from Employees where EmployeeID=1;

	select * from delete_trigger;

	create trigger tr_del on Employees
	for delete
	as
	begin
	select * from deleted
	end
	
	--instead of trigger

	create trigger insead_tr on Employees
	instead of insert
	as 
	begin
	select * from inserted
	print 'oye bhag yhn se'
	end
		
	INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID,ProjectID,Salary)
	VALUES(105, 'khan', 'ali', 2,2, 6000);

	select * from Employees;

	--instead of table varible
	create table audit_info(
	id int primary key identity,
	info varchar(99)
	);

	create trigger audit_tr on Employees
	instead of insert
	as
	declare @id int , @info varchar(90)
	begin
	select @id =EmployeeID ,@info=FirstName from inserted
	insert into audit_info values('user with id  ' + CAST(@id as varchar(111)) + '   with name ' +@info) 
	end
	
	INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID,ProjectID,Salary)
	VALUES(107, 'noman', 'ali', 2,3, 44000);

	select * from audit_info;

	select * from Employees;

	sp_helptext audit_tr;
