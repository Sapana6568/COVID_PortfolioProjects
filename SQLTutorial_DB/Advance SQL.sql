---------------ADVANCE SQL--------------
-------------------CTEs-----------------------
with CTE_Employee as
	(select FirstName, LastName, Gender, Salary
	from EmployeeDemographics ed
	join EmployeeSalary es
	on ed.EmployeeID = es.EmployeeID
	where Salary > '45000'
	)
select * from CTE_Employee;

with CTE_Employee as
	(select FirstName, LastName, Gender, Salary,
	COUNT(gender) over (partition by gender) as TotalGender,
	AVG(salary) over (partition by gender) as Avgsalary
	from EmployeeDemographics ed
	join EmployeeSalary es
	on ed.EmployeeID = es.EmployeeID
	where Salary > '45000'
	)
select * from CTE_Employee;

select * from CTE_Employee; --it should be called with cte table. CTE table is like a temp table but it is not stored anywhere.

-------------------------------Temp Table-------------------------------

create table #temp_Employee
(EmployeeID int, 
JobTitle varchar(100), 
Salary int );

select * from #temp_Employee;

insert into #temp_Employee values (1001, 'HR', 45000);

insert into #temp_Employee
select * from EmployeeSalary;

drop table if exists #temp_Employee2
create table #temp_Employee2
(JobTitle varchar (50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int);

insert into #temp_Employee2
select  JobTitle, count(JobTitle), AVG(Age), AVG(salary)
from EmployeeDemographics ed
inner join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID
group by JobTitle;

select * from #temp_Employee2;


/*

Today's Topic: String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

*/

--Drop Table EmployeeErrors;


CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors;

-- Using Trim, LTRIM, RTRIM

Select EmployeeID, TRIM(employeeID) AS IDTRIM
FROM EmployeeErrors ;

Select EmployeeID, RTRIM(employeeID) as IDRTRIM
FROM EmployeeErrors ;

Select EmployeeID, LTRIM(employeeID) as IDLTRIM
FROM EmployeeErrors ;

-- Using Replace
Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
FROM EmployeeErrors

-- Using Substring
select * from EmployeeErrors;
select * from EmployeeDemographics;

Select Substring(FirstName,1,3) as Firstname from EmployeeErrors;

--Select EmployeeID ,FirstName,LastName
--FROM EmployeeErrors err
--JOIN EmployeeDemographics dem
--	on err.EmployeeID = dem.EmployeeID

Select err.FirstName, Substring(err.FirstName,1,3), dem.FirstName, Substring(dem.FirstName,1,3),err.LastName, Substring(err.LastName,1,3), dem.LastName, Substring(dem.LastName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	--on err.EmployeeID = dem.EmployeeID
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3);

-- Using UPPER and lower

Select firstname, LOWER(firstname)
from EmployeeErrors;

Select Firstname, UPPER(FirstName)
from EmployeeErrors;

---------------------Procedure-------------------------------
create procedure test
as
select * from EmployeeDemographics;

exec test;

create procedure Temp_Employee
as
create table #temp_Employee2
(JobTitle varchar (50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int);

insert into #temp_Employee2
select  JobTitle, count(JobTitle), AVG(Age), AVG(salary)
from EmployeeDemographics ed
inner join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID
group by JobTitle;

select * from #temp_Employee2;

exec Temp_Employee @jobtitle = 'Salesman';

------------------Sub-Queries------------------
--Subquery in select
select EmployeeID, Salary, (select AVG(salary) from EmployeeSalary) as AllAvgSalary
from EmployeeSalary;

--How to do it with partition by
select EmployeeID, Salary, AVG(salary) over () as AllAvgSalary
from EmployeeSalary;

--Why group by doesn't work
select EmployeeID, Salary, AVG(salary) as AllAvgSalary
from EmployeeSalary
group by EmployeeID, Salary
order by 1, 2;

--Subquery in From
select a.EmployeeID, AllAvgSalary
from (select EmployeeID, Salary, AVG(salary) over () as AllAvgSalary
	from EmployeeSalary) a;

--Subquery in where
select EmployeeID, JobTitle, Salary
from EmployeeSalary
where EmployeeID in (select EmployeeID	
						from EmployeeDemographics
						where age > 30);
