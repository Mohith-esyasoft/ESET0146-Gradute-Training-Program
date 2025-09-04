
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

update Employee set Phno = 9248765375 where ID = 1;





