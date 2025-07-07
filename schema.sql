create database Employee_Database ;
use Employee_Database;

create table employees(
employee_id int primary key,
name varchar(100),
age int,
gender varchar(10),
department_id int,
join_date date,
salary decimal(10,2)
);

create table Departments (
department_id int primary key,
department_name varchar(100)
);

create table Attendance (
employee_id int,
date date,
status enum('Present','Absent','Leave'),
foreign key (employee_id)
references employees(employee_id)
);

create table payroll (
employee_id int,
month varchar(7),
basic_pay decimal(10,2),
deductions decimal(10,2),
net_pay decimal(10,2),
foreign key(employee_id)
references employees(employee_id)
);