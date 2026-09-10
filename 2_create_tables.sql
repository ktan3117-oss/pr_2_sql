-- PR. 2 DATA TRANSFORMER
-- CREATE TABLES

USE corporate_data_analysis;

-- =========================================
-- CUSTOMERS TABLE
-- =========================================

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    RegistrationDate DATE NOT NULL
);

--Query OK, 0 rows affected (0.01 sec)

-- =========================================
-- ORDERS TABLE
-- =========================================

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL
);

-- Query OK, 0 rows affected (0.01 sec)



-- EMPLOYEES TABLE


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
);

-- Query OK, 0 rows affected (0.01 sec)


SHOW TABLES;

-- -----------------------------------+
| Tables_in_corporate_data_analysis |
+-----------------------------------+
| Customers                         |
| Employees                         |
| Orders                            |
+-----------------------------------+
3 rows in set (0.00 sec)