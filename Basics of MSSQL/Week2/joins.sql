create database joins;
use joins;
create table users(user_id int primary key, email VARCHAR(20),name Varchar(20));
select * from users;

create table books(product_id int primary key, title VARCHAR(50),price float);
select * from books;

create table orders(order_no int primary key, 
					user_id int foreign key references users(user_id),
					product_id int foreign key references books(product_id));
select * from books;

insert into users values (1,'bhai@gmail.com','Gopal');
insert into users values (2,'toxic@gmail.com','Manjit');
insert into users values (3,'vimalpan@gmail.com','saumyadeep')
insert into users values (4,'jaisai@gmail.com','jaisai')
insert into users values (5,'laugh@gmail.com','namitha')

DELETE FROM users;
select * from users;

insert into books values (101,'SQL',100);
insert into books values (102,'Half Girlfriend',699);
insert into books values (103,'blackmagic',700)
insert into books values (104,'marfa',2000)
insert into books values (105,'how to laugh',2001)

DELETE FROM books;
select * from books;

insert into orders values (401,1,101);
insert into orders values (402,2,103);
insert into orders values (403,2,102);
insert into orders values (404,3,103);
insert into orders values (405,3,104);
insert into orders values (406,4,102);
insert into orders values (407,5,105);
insert into orders values (408,5,102);

DELETE FROM orders;
select * from orders;

select * from users inner join orders on users.user_id=orders.user_id 
inner join books  on books.product_id=orders.product_id where title ='blackmagic'; 


select * from (select * from users inner join orders on users.user_id=orders.user_id 
inner join books on books.product_id=orders.product_id) where price=(select max(price) from books);


  SELECT users.user_id, users.email, users.name, books.price
  FROM users
  INNER JOIN orders ON users.user_id = orders.user_id 
  INNER JOIN books ON books.product_id = orders.product_id   
  WHERE price = (SELECT MAX(price) FROM books);



  
select * from  orders union select * from orders ;

select * from orders union all select * from orders ;


  
select * from users union select * from users;

select * from users union all select * from users;



SELECT upper(name) AS uppertext, lower(name) AS lowertext, LEN(name) AS length FROM users;

select substring (name , 2,3) as substrings from users

select substring (reverse (name), 2,3) as reversesubstrings from users

select replace (name, a , o) as replacement from users

select concat (name , 'likes cow perhaps') from users



-- Step 1: Drop the OrderLog Table if it exists
IF OBJECT_ID('dbo.OrderLog', 'U') IS NOT NULL
    DROP TABLE dbo.OrderLog;

-- Step 2: Drop the Trigger if it exists
IF OBJECT_ID('trg_InsertOrder', 'TR') IS NOT NULL
    DROP TRIGGER trg_InsertOrder;  -- Removed ON orders

-- Step 3: Create OrderLog Table
CREATE TABLE OrderLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    OrderNo INT,
    UserID INT,
    ProductID INT,
    OrderDate DATETIME DEFAULT GETDATE()
);

-- Step 4: Create Trigger with PRINT Statement
CREATE TRIGGER trg_InsertOrder
ON orders
AFTER INSERT
AS
BEGIN
    
    INSERT INTO OrderLog (OrderNo, UserID, ProductID)
    SELECT order_no, user_id, product_id FROM inserted;

    -- Print message indicating a new record has been added
    PRINT 'New record added to orders table';
END;
