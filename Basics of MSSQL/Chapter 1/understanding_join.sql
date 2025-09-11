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




    --TASK 1

    SELECT o.order_no, u.user_id, b.product_id, u.email, u.name, b.title, b.price FROM orders o
    INNER JOIN users u ON u.user_id = o.user_id
    INNER JOIN books b ON b.product_id = o.product_id;

    --TASK 2

    SELECT o.order_no, u.name, b.title, b.price FROM orders o
    INNER JOIN users u ON u.user_id = o.user_id
    INNER JOIN books b ON b.product_id = o.product_id;

    --TASK 3

    SELECT u.user_id, u.name, u.email FROM Users u
    JOIN orders o ON u.user_id = o.user_id
    WHERE o.product_id = 103;

    --TASK 4

    SELECT b.title, b.price FROM orders o
    JOIN books b ON o.product_id = b.product_id
    WHERE o.user_id = 2;

    --Task 5

    SELECT u.name, SUM(b.price) AS Total_Spent FROM Users u
    JOIN orders o ON u.user_id = o.user_id
    JOIN books b ON b.product_id = o.product_id
    GROUP BY u.name;

    --TASK 6

    SELECT TOP 1 u.name, SUM(b.price) AS Total_Spent FROM Users u
    JOIN orders o ON u.user_id = o.user_id
    JOIN books b ON b.product_id = o.product_id
    GROUP BY u.name
    ORDER BY Total_Spent DESC;

    --TASK 7

    SELECT * FROM books ORDER BY price DESC;

    --TASK 8

    SELECT TOP 1 * FROM books ORDER BY price DESC;

    --TASK 9

    SELECT TOP 1 * FROM books ORDER BY price;

    --TASK 10

    SELECT * FROM books ORDER BY product_id DESC;



use joins;
select * from books;

-- Assignment 1 (Top N Books per User)
SELECT *
FROM (
    SELECT
        u.user_id,u.name,b.title,b.price,
        ROW_NUMBER() OVER (PARTITION BY u.user_id ORDER BY b.price DESC) AS RowNum,
        RANK() OVER (PARTITION BY u.user_id ORDER BY b.price DESC) AS RankNum,
        DENSE_RANK() OVER (PARTITION BY u.user_id ORDER BY b.price DESC) AS DenseRankNum
    FROM orders o
    INNER JOIN users u ON o.user_id = u.user_id
    INNER JOIN books b ON o.product_id = b.product_id
) ranked
WHERE ranked.RowNum <= 2
ORDER BY user_id, price DESC;

-- Assignment 2 (Ranking Users by Total Spending)
SELECT
    u.user_id,
    u.name, SUM(b.price) AS Total_Spending,
    RANK() OVER (ORDER BY SUM(b.price) DESC) AS RankNum,
    DENSE_RANK() OVER (ORDER BY SUM(b.price) DESC) AS DenseRankNum
FROM orders o
INNER JOIN users u ON o.user_id = u.user_id
INNER JOIN books b ON o.product_id = b.product_id
GROUP BY u.user_id, u.name
ORDER BY Total_Spending DESC;
