# pr_2_sql
PR. 2 – Data Transformer
Corporate Data Analysis System
Project Overview
The Corporate Data Analysis System is a MySQL-based project developed to demonstrate how SQL can be used to store, retrieve, transform, and analyze corporate data.
The system consists of three main tables: Customers, Orders, and Employees. The project performs 17 different operations using SQL JOINs, subqueries, date functions, string functions, window functions, ranking, and conditional statements.
Objectives
The main objectives of this project are:
To understand relational database concepts.
To create and manage tables using SQL.
To retrieve useful information from databases.
To understand relationships between tables.
To perform data transformation using SQL functions.
To analyze business data using subqueries and window functions.
To apply conditional business rules using CASE.
Operations and Concepts
1. INNER JOIN – Orders with Customer Details
An INNER JOIN returns only the records that have matching values in both tables.
In this operation, the Orders and Customers tables are connected using CustomerID.
Purpose: To display orders for customers whose information exists in the Customers table.
2. LEFT JOIN – All Customers and Their Orders
A LEFT JOIN returns all records from the left table and matching records from the right table.
Here, all customers are displayed even if they have not placed an order.
Purpose: To identify customers with or without orders.
3. RIGHT JOIN – All Orders and Customers
A RIGHT JOIN returns all records from the right table and matching records from the left table.
Here, all orders are displayed, even when corresponding customer information is unavailable.
Purpose: To identify every order and check whether customer details are available.
4. FULL OUTER JOIN – All Customers and Orders
A FULL OUTER JOIN returns matching as well as unmatched records from both tables.
MySQL does not directly support FULL OUTER JOIN, so it can be achieved using a combination of:
LEFT JOIN + UNION + RIGHT JOIN
Purpose: To obtain a complete view of customers and orders, including unmatched records.
5. Subquery – Orders Above Average
A subquery is a query written inside another query.
First, the average order amount is calculated using AVG(). The outer query then finds customers whose order amount is greater than the calculated average.
Purpose: To identify high-value customers or transactions.
6. Subquery – Employees Above Average Salary
This operation calculates the average employee salary using a subquery and then finds employees whose salary is greater than that average.
Purpose: To identify employees earning more than the organization's average salary.
7. YEAR() and MONTH() – Date Extraction
The YEAR() and MONTH() functions extract specific parts of a date.
For example:
2023-07-01
can be separated into:
Year → 2023
Month → 7
Purpose: Useful for monthly and yearly sales analysis.
8. DATEDIFF() – Date Difference
DATEDIFF() calculates the number of days between two dates.
In this project, it is used to calculate the difference between the order date and the current date.
Purpose: Useful for determining how old an order is or measuring time intervals.
9. DATE_FORMAT() – Date Formatting
DATE_FORMAT() changes the way a date is displayed without changing the actual stored date.
For example:
2023-07-01
can be displayed as:
01-Jul-2023
Purpose: Makes dates easier to understand and present in reports.
10. CONCAT() – Combining Strings
CONCAT() combines two or more strings into a single string.
For example:
John + Doe
becomes:
John Doe
Purpose: Used to create complete names or combine different text fields.
11. REPLACE() – Replacing Text
REPLACE() searches for a particular piece of text and replaces it with another value.
For example:
John
can be changed to:
Jonathan
Purpose: Useful for correcting or transforming existing text data.
12. UPPER() and LOWER() – Changing Text Case
UPPER() converts text into uppercase, while LOWER() converts text into lowercase.
Example:
John Doe
can become:
JOHN doe
Purpose: Useful for standardizing text data.
13. TRIM() – Removing Extra Spaces
TRIM() removes unnecessary spaces from the beginning and end of a string.
For example:
" john.doe@email.com "
becomes:
"john.doe@email.com"
Purpose: Helps clean and standardize data.
14. SUM() OVER() – Running Total
A window function performs calculations across related rows without combining them into one row.
SUM() OVER() is used to calculate a running or cumulative total.
For example, if order amounts are:
150.50 → 200.75 → 650.00
the running total becomes:
150.50 → 351.25 → 1001.25
Purpose: Useful for analyzing cumulative sales over time.
15. RANK() OVER() – Ranking Orders
RANK() is a window function that assigns a ranking to records based on a specified value.
In this project, orders are ranked according to TotalAmount.
The highest order amount receives Rank 1.
Purpose: Useful for identifying the highest-value orders.
16. CASE – Discount Calculation
The CASE statement provides conditional logic in SQL.
In this project:
Amount greater than 1000 → 10% Off
Amount greater than 500 → 5% Off
Otherwise → No Discount
Purpose: Used to apply business rules automatically to data.
17. CASE – Salary Categorization
The CASE statement is also used to classify employee salaries.
Salary ≥ 70000 → High
Salary ≥ 50000 → Medium
Salary < 50000 → Low
Purpose: Makes it easier to analyze employees based on salary levels.
Key Concepts Demonstrated
This project covers:
Database Concepts
Tables
Records
Primary Keys
Relationships
JOIN Concepts
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN equivalent
Analytical Concepts
Subqueries
Aggregate functions
Window functions
Ranking
Running totals
Data Transformation
Date transformation
String transformation
Conditional transformation



Learning Outcomes
After completing this project, I learned how to:
Design and work with relational tables.
Retrieve data using SQL.
Combine data from multiple tables.
Use subqueries for comparisons.
Manipulate dates and strings.
Calculate averages and running totals.
Rank records using window functions.
Apply business conditions using CASE.
Transform raw database data into meaningful information.


Conclusion
The Corporate Data Analysis System demonstrates the practical application of SQL for corporate data management and analysis. The 17 operations cover important SQL concepts from basic queries and JOINs to advanced techniques such as subqueries, window functions, ranking, and conditional data transformation.
This project provides a strong foundation for working with Database Management Systems, SQL, Data Analytics, and Business Intelligence.
