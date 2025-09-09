create database users;

use users;
drop table users;

CREATE TABLE users ( 
    user_id INT PRIMARY KEY, 
    email VARCHAR(50),
    name VARCHAR(50)
);

CREATE TABLE books (
    product_id INT PRIMARY KEY, 
    title VARCHAR(50),
    price FLOAT
);

CREATE TABLE orders (
    order_no INT PRIMARY KEY IDENTITY(1,1), 
    user_id INT,
    product_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id), 
    FOREIGN KEY (product_id) REFERENCES books(product_id)
);

select * from users

select * from books

select * from orders

insert into users (user_id, email , name)
values (1 , 'callmebhai@gmail.com' , 'gopi bahu'),
(2 , ' toxicmanji@gmail.com' , 'Manjit' ),
(3 , ' kalajadu@gmail.com' ,'Soumyadeep' ),
(4 , 'vimalpan@gmail.com', 'Jai Sai' ),
(5, 'ghostlaugh@gmail.com' , 'Namitha');


insert into books(product_id,title,price)
values(101 , 'mssql', 100.00),
(102, 'half girlfriend' , 699.00),
(103 , 'black magic', 700.00),
(104 , 'how to marfa' , 2000.00),
(105 , 'how to laugh' , 2001.99);

set identity_insert orders on;

insert into orders (order_no, user_id, product_id)
values
(401 , 1 , 101),
(402 , 2 , 102),  -- Corrected duplicate order number
(403 , 2 , 102),
(404 , 3 , 103),
(405 , 3 , 104),
(406 , 4 , 102),
(407 , 5 , 105); -- Corrected invalid product ID
GO



set identity_insert orders off;

-- Show all records

select * from orders o
inner join users u on u.user_id = o.user_id
inner join books b on b.product_id = o.product_id;


-- people who bought the blackmagic book

SELECT *
FROM orders AS o
INNER JOIN users AS u ON u.user_id = o.user_id
INNER JOIN books AS b ON b.product_id = o.product_id
WHERE b.title = 'black magic';

-- info of the person who bought the most expensive book
SELECT *
FROM orders AS o
INNER JOIN users AS u ON u.user_id = o.user_id
INNER JOIN books AS b ON b.product_id = o.product_id
WHERE b.price = (SELECT MAX(price) FROM books);

