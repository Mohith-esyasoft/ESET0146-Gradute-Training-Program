
drop table Employee



create table Employee( ID int primary key identity (1,1) ,Name varchar(50) , dept varchar(50), salary varchar(100))

INSERT INTO Employee (Name, dept, salary) VALUES 
('Navibulla', 'IT', '100000'),
('Soumyadeep', 'IOT', '100000'),
('Manjit', 'AI' , '150000' ),
('Sahil' , 'Marketing' , '150000'),
('Poojita', 'SDE', '125000');

select * from Employee

alter table Employee add Phno bigint;

update Employee set Phno = 8548649557 where ID = 5;


select * from Employee where ID in (6,7)

select * from Employee where salary between 100000 and 125000

select * from Employee where name like '%m%' and name not like '%i%'


INSERT INTO Employee (Name, dept, salary, Phno) VALUES
('Priya Sharma', 'Marketing', '75000', NULL),
('Rajesh Kumar', 'Sales', '80000', NULL),
('Sneha Singh', 'HR', '60000', NULL),
('Amit Patel', 'Finance', '120000', NULL),
('Deepika Gupta', 'Operations', '95000', NULL),
('Mohit Joshi', 'IT', '180000', NULL),
('Divya Rao', 'Marketing', '70000', NULL),
('Sanjay Verma', 'Sales', '110000', NULL),
('Kavita Devi', 'HR', '55000', NULL),
('Rahul Khanna', 'Finance', '150000', NULL),
('Anjali Reddy', 'Operations', '85000', NULL),
('Vikram Singh', 'IT', '190000', NULL),
('Pooja Shah', 'Marketing', '65000', NULL),
('Arjun Das', 'Sales', '105000', NULL),
('Nisha Choudhary', 'HR', '50000', NULL),
('Gaurav Mehta', 'Finance', '160000', NULL),
('Shruti Nair', 'Operations', '90000', NULL),
('Vivek Sharma', 'IT', '170000', NULL),
('Meena Kumari', 'Marketing', '72000', NULL),
('Ravi Kumar', 'Sales', '98000', NULL);

alter table Employee add Branch varchar(100);

select max(salary) as salary from Employee

select * from Employee

alter table Employee alter column salary int;

select min(salary) as salary from Employee

select avg(salary) as salary from Employee

select count ('Phno') as totl_entry from Employee;

