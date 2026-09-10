USE corporate_data_analysis;

-- =========================================
-- INSERT CUSTOMERS
-- =========================================

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, RegistrationDate)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
(3, 'Alice', 'Brown', 'alice.brown@email.com', '2023-01-10');

--Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

SELECT*FROM Customers;

--- ------------+-----------+----------+-----------------------+------------------+
| CustomerID | FirstName | LastName | Email                 | RegistrationDate |
+------------+-----------+----------+-----------------------+------------------+
|          1 | John      | Doe      | john.doe@email.com    | 2022-03-15       |
|          2 | Jane      | Smith    | jane.smith@email.com  | 2021-11-02       |
|          3 | Alice     | Brown    | alice.brown@email.com | 2023-01-10       |
+------------+-----------+----------+-----------------------+------------------+
3 rows in set (0.00 sec)

-- =========================================
-- INSERT ORDERS
-- =========================================

INSERT INTO Orders
(OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 1, '2023-08-15', 1200.00),
(104, 3, '2023-09-10', 650.00);

-- Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

SELECT*FROM Orders;

--+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|     101 |          1 | 2023-07-01 |      150.50 |
|     102 |          2 | 2023-07-03 |      200.75 |
|     103 |          1 | 2023-08-15 |     1200.00 |
|     104 |          3 | 2023-09-10 |      650.00 |
+---------+------------+------------+-------------+
4 rows in set (0.00 sec)

-- =========================================
-- INSERT EMPLOYEES
-- =========================================

INSERT INTO Employees
(EmployeeID, FirstName, LastName, Department, HireDate, Salary)
VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
(3, 'David', 'Patel', 'IT', '2019-07-01', 75000.00),
(4, 'Emily', 'Wilson', 'Finance', '2022-06-10', 45000.00);

--Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

SELECT*FROM Employees;

--+------------+-----------+----------+------------+------------+----------+
| EmployeeID | FirstName | LastName | Department | HireDate   | Salary   |
+------------+-----------+----------+------------+------------+----------+
|          1 | Mark      | Johnson  | Sales      | 2020-01-15 | 50000.00 |
|          2 | Susan     | Lee      | HR         | 2021-03-20 | 55000.00 |
|          3 | David     | Patel    | IT         | 2019-07-01 | 75000.00 |
|          4 | Emily     | Wilson   | Finance    | 2022-06-10 | 45000.00 |
+------------+-----------+----------+------------+------------+----------+
4 rows in set (0.00 sec)

-- =========================================
-- UNMATCHED ORDER
-- =========================================

INSERT INTO Orders
(OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(105, 99, '2023-10-05', 300.00);

--Query OK, 1 row affected (0.00 sec)

SELECT*FROM Orders;

-- +---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|     101 |          1 | 2023-07-01 |      150.50 |
|     102 |          2 | 2023-07-03 |      200.75 |
|     103 |          1 | 2023-08-15 |     1200.00 |
|     104 |          3 | 2023-09-10 |      650.00 |
|     105 |         99 | 2023-10-05 |      300.00 |
+---------+------------+------------+-------------+
5 rows in set (0.00 sec)


