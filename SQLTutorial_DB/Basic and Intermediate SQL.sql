

--Table 1 Query:
Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

--Table 2 Query:
Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
)



--Table 1 Insert:
Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

--Table 2 Insert:
Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

--------------------------SQL Basics--------------------------
select * from EmployeeDemographics;
select * from EmployeeSalary;


select *
from EmployeeDemographics
where Age <= 32 and Gender='Male';

select *
from EmployeeDemographics
where Age <= 32 or Gender='Male';

select *
from EmployeeDemographics
where LastName like 's%';

select *
from EmployeeDemographics
where LastName like 's%c%ot';

select *
from EmployeeDemographics
where LastName like 's%c%ot%';

select * 
from EmployeeDemographics
where FirstName in ('Jim', 'Michael', 'pam' );

------------------------------------------------------------------

select distinct (Gender)
from EmployeeDemographics;

select gender, count(gender) as gendercount
from EmployeeDemographics
group by Gender;

select gender, age, count(gender) as genderagecount
from EmployeeDemographics
group by Gender, age;


select gender,count(gender) as gendercount
from EmployeeDemographics
where age > 30
group by Gender
order by gendercount desc;


select *
from EmployeeDemographics
order by  age, gender desc;

select firstname, gender, age, count(gender) as gendercount
from EmployeeDemographics
where age > 31
group by firstname, gender, age
order by 2 desc;

select firstname, gender, age, count(gender) as gendercount
from EmployeeDemographics
where age > 31
group by firstname, gender, age
order by 2 desc, 3 desc ;

-------------------------------------SQL Intermediate-------------------------

--Table 1 Insert:
Insert into EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

--Table 3 Query:
Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

--Table 3 Insert:
Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

select *
from EmployeeDemographics;

select * 
from EmployeeSalary;

select *
from WareHouseEmployeeDemographics;

-----------------------------JOIN---------------------------------

select *
from EmployeeDemographics ed
inner join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID;

select *
from EmployeeDemographics ed
full outer join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID;

select *
from EmployeeDemographics ed
left outer join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID;

select *
from EmployeeDemographics ed
right outer join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID;

select ed.EmployeeID, FirstName, LastName, JobTitle, Salary
from EmployeeDemographics ed
inner join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID;

--OR

select es.EmployeeID, FirstName, LastName, JobTitle, Salary
from EmployeeDemographics ed
inner join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID;

--Here in both ed and es it shows the same result because we have used inner join.

select es.EmployeeID, FirstName, LastName, JobTitle, Salary
from EmployeeDemographics ed
right outer join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID;

select * from EmployeeSalary;

select ed.EmployeeID, FirstName, LastName, JobTitle, Salary
from EmployeeDemographics ed
left outer join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID;

select * from EmployeeDemographics;

---------------

select * from EmployeeDemographics;
select * from EmployeeSalary;

select ed.EmployeeID, FirstName, LastName, Salary
from EmployeeDemographics ed
inner join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID
where FirstName <> 'Michael'
order by Salary desc;

select  JobTitle, Salary
from EmployeeDemographics ed
inner join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID
where es.JobTitle = 'Salesman';
--group by JobTitle;

select  JobTitle, sum(Salary)
from EmployeeDemographics ed
inner join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID
where es.JobTitle = 'Salesman'
group by JobTitle; 

select 156000/3; --avg(salary)

select  JobTitle, Avg(Salary)
from EmployeeDemographics ed
inner join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID
where es.JobTitle = 'Salesman'
group by JobTitle;

-----------------------------Union--------------------------
select * from EmployeeDemographics;
select * from WareHouseEmployeeDemographics;

select * 
from EmployeeDemographics ed
full outer join WareHouseEmployeeDemographics wed
on ed.EmployeeID = wed.EmployeeID;

select * from EmployeeDemographics
union 
select * from WareHouseEmployeeDemographics;

---------------------Differences UNION and UNION ALL----------
select * from EmployeeDemographics
union all
select * from WareHouseEmployeeDemographics; --1013	Darryl	Philbin	NULL	Male (The chances of duplicate value, integrity will be there while doing union all)

select EmployeeID, FirstName, Null as Jobtitle, Age, Null as Salary
from EmployeeDemographics
union
select EmployeeID, Null, JobTitle, Null, Salary
from EmployeeSalary;


------------------Case Statement---------------
select FirstName, LastName, Age,
case
	when age > 30 then 'Old'
	else 'Young'
end as Agedesc
from EmployeeDemographics
where age is not null
order by Age;

select FirstName, LastName, Age,
case
	when age > 30 then 'Old'
	when age between 27 and 30 then 'Young'
	else 'Baby'
end as Agedesc
from EmployeeDemographics
where age is not null
order by Age;

select FirstName, LastName, Age,
case
	when age > 30 then 'Old'
	when age = 38 then 'Stanley'
	else 'Baby'
end as Agedesc
from EmployeeDemographics
where age is not null
order by Age; --here 1st condition is already met so it will be old in age 38 too.

select FirstName, LastName, Age,
case
	when age = 38 then 'Stanley'
	when age > 30 then 'Old'
	else 'Baby'
end as Agedesc
from EmployeeDemographics
where age is not null
order by Age;

select FirstName, LastName, JobTitle, Salary,
case
	when JobTitle = 'Salesman' then Salary + (Salary * 0.10)
	when JobTitle = 'Accountant' then Salary + (Salary * 0.5)
	else Salary + (Salary * 0.3)
end as SalaryRaise
from EmployeeDemographics ed
join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID;

--------------Having Clause-------------------------
select JobTitle, COUNT(jobtitle) as count
from EmployeeDemographics ed
join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID
where COUNT(jobtitle) > 1
group by JobTitle
order by count; --aggregate may not appear in the where clause

select JobTitle, COUNT(jobtitle) as count
from EmployeeDemographics ed
join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID
group by JobTitle
having COUNT(jobtitle) > 1
order by count;

select JobTitle, AVG(salary)
from EmployeeDemographics ed
join EmployeeSalary es
on ed.EmployeeID = es.EmployeeID
group by JobTitle
having AVG(salary) > 45000
order by AVG(salary);

--------------------Updating and Deleting Data----------------
--Insert into is iserting a new row in the table
--Updating is alter a pre-existing row
--Deleting is what row you wanna remove from the table

select *
from EmployeeDemographics;

update EmployeeDemographics
set EmployeeID = 1012
where FirstName = 'Holly' and LastName = 'Flax';

update EmployeeDemographics
set Age = 31, Gender = 'Female'
where FirstName = 'Holly' and LastName = 'Flax';

delete from EmployeeDemographics
where EmployeeID = 1005;

begin tran
rollback;

------------Aliasing-----------
select * from EmployeeDemographics;

select FirstName as Fname
from EmployeeDemographics;

select FirstName Fname
from EmployeeDemographics;

select FirstName + ' ' + LastName as FullName
from EmployeeDemographics;

select * from EmployeeDemographics;
select * from EmployeeSalary;
select * from WareHouseEmployeeDemographics;

select demo.EmployeeID, demo.FirstName, sal.JobTitle, ware.Age
from EmployeeDemographics demo
left join EmployeeSalary sal
on demo.EmployeeID = sal.EmployeeID
left join WareHouseEmployeeDemographics ware
on demo.EmployeeID = ware.EmployeeID;

----------------------------Partition By---------------------
select FirstName, LastName, Gender, Salary,
		count(gender) over (partition by gender) as TotalGender
from EmployeeDemographics demo
join EmployeeSalary sal
on demo.EmployeeID = sal.EmployeeID; --no need group by function

select  Gender, count(gender) TotalGender
from EmployeeDemographics demo
join EmployeeSalary sal
on demo.EmployeeID = sal.EmployeeID
group by Gender;
