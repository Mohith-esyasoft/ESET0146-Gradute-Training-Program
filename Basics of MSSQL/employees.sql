use employees;
CREATE TABLE employees (
    EmpID int ,
    name VARCHAR(100) ,
    branch VARCHAR(50) ,
    salary float
);
select * from employees
INSERT INTO employees (EmpID, name, branch, salary) VALUES
(1, 'Rishi ', 'CSE', 100000.00),
(2, 'Alan', 'ECE', 200000.00),
(3, 'Sam', 'CSE', 300000.00),
(4, 'Deepika','IT',400000.00),
(5, 'Ram','Robotics',500000.00);

select * from employees where salary>100000

update employees set name = 'Shivam' where EmpID=4;

delete from employees where name = 'Shivam';
alter table employees add phonenumber varchar(50)
alter table employees
alter column phonenumber bigint

exec sp_help employees;

alter table employees drop column phonenumber


exec sp_rename 'employees.name' , 'Emp_name','column'


exec sp_rename 'employees' , 'Employee'


