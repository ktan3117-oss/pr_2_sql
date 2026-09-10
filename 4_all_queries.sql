USE corporate_data_analysis;

-- Q1. INNER JOIN

SELECT
    o.OrderID,
    o.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    o.OrderDate,
    o.TotalAmount
FROM Orders AS o
INNER JOIN Customers AS c
ON o.CustomerID = c.CustomerID
ORDER BY o.OrderID;

--+---------+------------+-----------+----------+-----------------------+------------+-------------+
| OrderID | CustomerID | FirstName | LastName | Email                 | OrderDate  | TotalAmount |
+---------+------------+-----------+----------+-----------------------+------------+-------------+
|     101 |          1 | John      | Doe      | john.doe@email.com    | 2023-07-01 |      150.50 |
|     102 |          2 | Jane      | Smith    | jane.smith@email.com  | 2023-07-03 |      200.75 |
|     103 |          1 | John      | Doe      | john.doe@email.com    | 2023-08-15 |     1200.00 |
|     104 |          3 | Alice     | Brown    | alice.brown@email.com | 2023-09-10 |      650.00 |
+---------+------------+-----------+----------+-----------------------+------------+-------------+
4 rows in set (0.01 sec)

-- Q2. LEFT JOIN

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID, o.OrderID;

--+------------+-----------+----------+---------+------------+-------------+
| CustomerID | FirstName | LastName | OrderID | OrderDate  | TotalAmount |
+------------+-----------+----------+---------+------------+-------------+
|          1 | John      | Doe      |     101 | 2023-07-01 |      150.50 |
|          1 | John      | Doe      |     103 | 2023-08-15 |     1200.00 |
|          2 | Jane      | Smith    |     102 | 2023-07-03 |      200.75 |
|          3 | Alice     | Brown    |     104 | 2023-09-10 |      650.00 |
+------------+-----------+----------+---------+------------+-------------+
4 rows in set (0.00 sec)


-- Q3. RIGHT JOIN

SELECT
    o.OrderID,
    o.CustomerID,
    o.OrderDate,
    o.TotalAmount,
    c.FirstName,
    c.LastName,
    c.Email
FROM Customers AS c
RIGHT JOIN Orders AS o
ON c.CustomerID = o.CustomerID
ORDER BY o.OrderID;

-- +---------+------------+------------+-------------+-----------+----------+-----------------------+
| OrderID | CustomerID | OrderDate  | TotalAmount | FirstName | LastName | Email                 |
+---------+------------+------------+-------------+-----------+----------+-----------------------+
|     101 |          1 | 2023-07-01 |      150.50 | John      | Doe      | john.doe@email.com    |
|     102 |          2 | 2023-07-03 |      200.75 | Jane      | Smith    | jane.smith@email.com  |
|     103 |          1 | 2023-08-15 |     1200.00 | John      | Doe      | john.doe@email.com    |
|     104 |          3 | 2023-09-10 |      650.00 | Alice     | Brown    | alice.brown@email.com |
|     105 |         99 | 2023-10-05 |      300.00 | NULL      | NULL     | NULL                  |
+---------+------------+------------+-------------+-----------+----------+-----------------------+
5 rows in set (0.00)

-- Q4. FULL OUTER JOIN EQUIVALENT

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerID

UNION

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers AS c
RIGHT JOIN Orders AS o
ON c.CustomerID = o.CustomerID

ORDER BY CustomerID, OrderID;

--+------------+-----------+----------+---------+------------+-------------+
| CustomerID | FirstName | LastName | OrderID | OrderDate  | TotalAmount |
+------------+-----------+----------+---------+------------+-------------+
|       NULL | NULL      | NULL     |     105 | 2023-10-05 |      300.00 |
|          1 | John      | Doe      |     101 | 2023-07-01 |      150.50 |
|          1 | John      | Doe      |     103 | 2023-08-15 |     1200.00 |
|          2 | Jane      | Smith    |     102 | 2023-07-03 |      200.75 |
|          3 | Alice     | Brown    |     104 | 2023-09-10 |      650.00 |
+------------+-----------+----------+---------+------------+-------------+
5 rows in set (0.01 sec)

-- Q5. CUSTOMERS WITH ORDERS ABOVE AVERAGE

SELECT DISTINCT
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM Customers AS c
INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (
    SELECT AVG(TotalAmount)
    FROM Orders
);

--+------------+-----------+----------+
| CustomerID | FirstName | LastName |
+------------+-----------+----------+
|          1 | John      | Doe      |
|          3 | Alice     | Brown    |
+------------+-----------+----------+
2 rows in set (0.01 sec)

-- Q6. EMPLOYEES ABOVE AVERAGE SALARY

SELECT
    EmployeeID,
    FirstName,
    LastName,
    Department,
    Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
)
ORDER BY Salary DESC;

--------------+-----------+----------+------------+----------+
| EmployeeID | FirstName | LastName | Department | Salary   |
+------------+-----------+----------+------------+----------+
|          3 | David     | Patel    | IT         | 75000.00 |
+------------+-----------+----------+------------+----------+
1 row in set (0.00 sec)



-- Q7. EXTRACT YEAR AND MONTH

SELECT
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM Orders
ORDER BY OrderID;

--+---------+------------+-----------+------------+
| OrderID | OrderDate  | OrderYear | OrderMonth |
+---------+------------+-----------+------------+
|     101 | 2023-07-01 |      2023 |          7 |
|     102 | 2023-07-03 |      2023 |          7 |
|     103 | 2023-08-15 |      2023 |          8 |
|     104 | 2023-09-10 |      2023 |          9 |
|     105 | 2023-10-05 |      2023 |         10 |
+---------+------------+-----------+------------+
5 rows in set (0.00 sec)

-- Q8. DIFFERENCE IN DAYS

SELECT
    OrderID,
    OrderDate,
    CURRENT_DATE() AS CurrentDate,
    DATEDIFF(
        CURRENT_DATE(),
        OrderDate
    ) AS DifferenceInDays
FROM Orders
ORDER BY OrderID;

--+---------+------------+-------------+------------------+
| OrderID | OrderDate  | CurrentDate | DifferenceInDays |
+---------+------------+-------------+------------------+
|     101 | 2023-07-01 | 2026-09-10  |             1167 |
|     102 | 2023-07-03 | 2026-09-10  |             1165 |
|     103 | 2023-08-15 | 2026-09-10  |             1122 |
|     104 | 2023-09-10 | 2026-09-10  |             1096 |
|     105 | 2023-10-05 | 2026-09-10  |             1071 |
+---------+------------+-------------+------------------+
5 rows in set (0.00 sec)

-- Q9. FORMAT ORDER DATE

SELECT
    OrderID,
    OrderDate,
    DATE_FORMAT(
        OrderDate,
        '%d-%b-%Y'
    ) AS FormattedOrderDate
FROM Orders
ORDER BY OrderID;

---------+------------+--------------------+
| OrderID | OrderDate  | FormattedOrderDate |
+---------+------------+--------------------+
|     101 | 2023-07-01 | 01-Jul-2023        |
|     102 | 2023-07-03 | 03-Jul-2023        |
|     103 | 2023-08-15 | 15-Aug-2023        |
|     104 | 2023-09-10 | 10-Sep-2023        |
|     105 | 2023-10-05 | 05-Oct-2023        |
+---------+------------+--------------------+
5 rows in set (0.00 sec)

-- Q10. CONCATENATE FULL NAME

SELECT
    CustomerID,
    FirstName,
    LastName,
    CONCAT(
        FirstName,
        ' ',
        LastName
    ) AS FullName
FROM Customers
ORDER BY CustomerID;

-- ------------+-----------+----------+-------------+
| CustomerID | FirstName | LastName | FullName    |
+------------+-----------+----------+-------------+
|          1 | John      | Doe      | John Doe    |
|          2 | Jane      | Smith    | Jane Smith  |
|          3 | Alice     | Brown    | Alice Brown |
+------------+-----------+----------+-------------+
3 rows in set (0.00 sec)

-- Q11. REPLACE STRING

SELECT
    CustomerID,
    FirstName,
    REPLACE(
        FirstName,
        'John',
        'Jonathan'
    ) AS UpdatedFirstName,
    LastName
FROM Customers
ORDER BY CustomerID;

--+------------+-----------+------------------+----------+
| CustomerID | FirstName | UpdatedFirstName | LastName |
+------------+-----------+------------------+----------+
|          1 | John      | Jonathan         | Doe      |
|          2 | Jane      | Jane             | Smith    |
|          3 | Alice     | Alice            | Brown    |
+------------+-----------+------------------+----------+
3 rows in set (0.00 sec)

-- Q12. UPPERCASE AND LOWERCASE

SELECT
    CustomerID,
    UPPER(FirstName) AS FirstNameUpper,
    LOWER(LastName) AS LastNameLower
FROM Customers
ORDER BY CustomerID;

--+------------+----------------+---------------+
| CustomerID | FirstNameUpper | LastNameLower |
+------------+----------------+---------------+
|          1 | JOHN           | doe           |
|          2 | JANE           | smith         |
|          3 | ALICE          | brown         |
+------------+----------------+---------------+
3 rows in set (0.00 sec)

-- Q13. TRIM EMAIL

SELECT
    CustomerID,
    Email AS OriginalEmail,
    TRIM(Email) AS TrimmedEmail
FROM Customers
ORDER BY CustomerID;

+------------+-----------------------+-----------------------+
| CustomerID | OriginalEmail         | TrimmedEmail          |
+------------+-----------------------+-----------------------+
|          1 | john.doe@email.com    | john.doe@email.com    |
|          2 | jane.smith@email.com  | jane.smith@email.com  |
|          3 | alice.brown@email.com | alice.brown@email.com |
+------------+-----------------------+-----------------------+
3 rows in set (0.00 sec)

-- Q14. RUNNING TOTAL

SELECT
    OrderID,
    OrderDate,
    TotalAmount,

    SUM(TotalAmount) OVER (
        ORDER BY OrderDate, OrderID
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS RunningTotal

FROM Orders

ORDER BY OrderDate, OrderID;

--+---------+------------+-------------+--------------+
| OrderID | OrderDate  | TotalAmount | RunningTotal |
+---------+------------+-------------+--------------+
|     101 | 2023-07-01 |      150.50 |       150.50 |
|     102 | 2023-07-03 |      200.75 |       351.25 |
|     103 | 2023-08-15 |     1200.00 |      1551.25 |
|     104 | 2023-09-10 |      650.00 |      2201.25 |
|     105 | 2023-10-05 |      300.00 |      2501.25 |
+---------+------------+-------------+--------------+
5 rows in set (0.00 sec)

-- Q15. RANK ORDERS

SELECT
    OrderID,
    TotalAmount,

    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS OrderRank

FROM Orders

ORDER BY OrderRank, OrderID;

--+---------+-------------+-----------+
| OrderID | TotalAmount | OrderRank |
+---------+-------------+-----------+
|     103 |     1200.00 |         1 |
|     104 |      650.00 |         2 |
|     105 |      300.00 |         3 |
|     102 |      200.75 |         4 |
|     101 |      150.50 |         5 |
+---------+-------------+-----------+
5 rows in set (0.00 sec)

-- Q16. DISCOUNT

SELECT
    OrderID,
    TotalAmount,

    CASE
        WHEN TotalAmount > 1000 THEN '10% Off'
        WHEN TotalAmount > 500 THEN '5% Off'
        ELSE 'No Discount'
    END AS Discount

FROM Orders

ORDER BY OrderID;

+---------+-------------+-------------+
| OrderID | TotalAmount | Discount    |
+---------+-------------+-------------+
|     101 |      150.50 | No Discount |
|     102 |      200.75 | No Discount |
|     103 |     1200.00 | 10% Off     |
|     104 |      650.00 | 5% Off      |
|     105 |      300.00 | No Discount |
+---------+-------------+-------------+
5 rows in set (0.00 sec)

-- Q17. SALARY CATEGORY

SELECT
    EmployeeID,
    FirstName,
    LastName,
    Department,
    Salary,

    CASE
        WHEN Salary >= 70000 THEN 'High'
        WHEN Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory

FROM Employees

ORDER BY Salary DESC;

-- +------------+-----------+----------+------------+----------+----------------+
| EmployeeID | FirstName | LastName | Department | Salary   | SalaryCategory |
+------------+-----------+----------+------------+----------+----------------+
|          3 | David     | Patel    | IT         | 75000.00 | High           |
|          2 | Susan     | Lee      | HR         | 55000.00 | Medium         |
|          1 | Mark      | Johnson  | Sales      | 50000.00 | Medium         |
|          4 | Emily     | Wilson   | Finance    | 45000.00 | Low            |
+------------+-----------+----------+------------+--------