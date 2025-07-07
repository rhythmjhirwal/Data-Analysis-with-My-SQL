-- Total employees in each department

select d.department_name,
count(e.employee_id) as
total_employees
from employees e
join departments d on
e.department_id = d.department_id
group by d.department_name;


-- top 5 highest paid employees

select employee_id, name,salary 
from employees
order by salary desc
limit 5;


-- Monthly Payroll Summary

select month,
		sum(basic_pay) as
total_basic_pay,
		sum(deductions) as
total_deductions ,
		sum(net_pay) as total_net_pay
from payroll
group by month
order by month;


-- Employees with Deductions > 20% of basic pay

select employee_id, month,
basic_pay, deductions,
		round((deductions/
basic_pay)*100,2) as
deduction_percent
from payroll
where (deductions/basic_pay) > 0.20;


-- Attendance Analysis

select employee_id,
		round(sum(case when status = 
'Present' then 1 else 0 end)*
100.0 / count(*) , 2) as
attendance_present
from Attendance
group by employee_id;


-- Employees Who Joined in the Last 6 Months

select *
from employees
where join_date >=
date_sub(curdate(),interval 6 month);


-- Department with Highest Average Salary

select d.department_name,
avg(e.salary) as avg_salary
from employees e 
join departments d on 
e.department_id = d.department_id
group by d.department_name
order by avg_salary desc
limit 1;