USE joins;
SELECT * FROM users;

SELECT *
FROM users
INNER JOIN orders ON users.user_id = orders.user_id 
INNER JOIN books ON books.product_id = orders.product_id;


/* Query 1: Retrieve all data from users, orders, and books */
SELECT *
FROM users u1
FULL OUTER JOIN orders u2 ON u1.user_id = u2.user_id
FULL OUTER JOIN books u3 ON u3.product_id = u2.product_id;

/* Query 2: get all orders table. */
SELECT *
FROM orders;

/* Query 3: Find particular user who has order these books. */
SELECT *
FROM users u1
INNER JOIN orders u2 ON u1.user_id = u2.user_id
INNER JOIN books u3 ON u3.product_id = u2.product_id
WHERE u3.title IN ('black magic', 'HALF girlfriend');

/* Query 4: Find books users has order */
SELECT u1.user_id, u1.name, u3.title
FROM users u1
INNER JOIN orders u2 ON u1.user_id = u2.user_id
INNER JOIN books u3 ON u3.product_id = u2.product_id
ORDER BY u1.user_id;

/* Query 5: Find total price of books user has order */
SELECT u1.user_id, SUM(u3.price)
FROM users u1
INNER JOIN orders u2 ON u1.user_id = u2.user_id
INNER JOIN books u3 ON u3.product_id = u2.product_id
GROUP BY u1.user_id;

/* Query 6: Find the most valuable user*/
SELECT SUM(u31.price)
FROM users u11
INNER JOIN orders u21 ON u11.user_id = u21.user_id
INNER JOIN books u31 ON u31.product_id = u21.product_id
GROUP BY u11.user_id
ORDER BY SUM(u31.price) DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;

/* Query 7: Find the range of books from high to low */
SELECT *
FROM books
ORDER BY price DESC;

/* Query 8: Find the highest price book */
SELECT MAX(price)
FROM books;

/* Query 9: Find the cheapest book */
SELECT MIN(price)
FROM books;

/* Query 10:Find newly added books */
SELECT user_id, MAX(order_no)
FROM orders
GROUP BY user_id
ORDER BY user_id DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;


select * from orders union select * from orders;

select * from orders union all * from orders;