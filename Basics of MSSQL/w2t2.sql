use master;

exec sp_tables;

select * from Employee;

 
SELECT TOP 5 ID, Name, dept, salary
FROM Employee
ORDER BY salary DESC;

SELECT ID, Name, dept, salary
FROM Employee
ORDER BY salary ASC
OFFSET 3 ROWS
FETCH NEXT 5 ROWS ONLY;
