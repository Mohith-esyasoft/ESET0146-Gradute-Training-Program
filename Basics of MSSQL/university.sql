

select * from university

drop table university

create table university (ID int primary key identity (1 ,1) , Names varchar(100), dept varchar(100), fees float)

insert into university values('shivam' , 'Mech' , 45000.09)

alter table university add mail_id varchar(55) unique

update university 
set mail_id = 'shivam.mech@university.com' 

INSERT INTO university (Names, dept, fees, mail_id) VALUES 
('Priya Sharma', 'Computer Science', 55000.00, 'priya.cs@university.com'),
('Rahul Singh', 'Electrical', 50000.00, 'rahul.ee@university.com'),
('Sneha Patel', 'Civil', 48000.00, 'sneha.civil@university.com'),
('Amit Kumar', 'Mechanical', 47000.00, 'amit.mech@university.com');

create table student (s_id int , Name varchar(50), class varchar(10) , foreign key (s_id) references university (id))




