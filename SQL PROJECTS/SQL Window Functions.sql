-- Window Functions

-- windows functions are really powerful and are somewhat like a group by - except they don't roll everything up into 1 row when grouping. 
-- windows functions allow us to look at a partition or a group, but they each keep their own unique rows in the output
-- we will also look at things like Row Numbers, rank, and dense rank

-- Let's start by creating the table

CREATE TABLE Sales_Data (
    Employee_ID INT,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Sales_Amount INT
);

INSERT INTO Sales_Data (Employee_ID, Name, Department, Sales_Amount) VALUES
(101, 'John', 'Electronics', 9500),
(102, 'Sarah', 'Electronics', 12000),
(103, 'Mike', 'Electronics', 12000),
(104, 'David', 'Electronics', 8700),
(105, 'Emma', 'Electronics', 7000),

(106, 'James', 'Fashion', 15000),
(107, 'Sophia', 'Fashion', 13500),
(108, 'Daniel', 'Fashion', 13500),
(109, 'Olivia', 'Fashion', 9000),
(110, 'Liam', 'Fashion', 7500),

(111, 'Noah', 'Grocery', 11000),
(112, 'Ava', 'Grocery', 11000),
(113, 'Mason', 'Grocery', 9800),
(114, 'Isabella', 'Grocery', 8200),
(115, 'Ethan', 'Grocery', 6000);

--First let's see how the table looks like
SELECT *
FROM Sales_Data

--ROW_NUMBER, RANK, DENSE_RANK
SELECT Department, 
ROW_NUMBER() OVER(ORDER BY Sales_Amount DESC) AS Rank_1,
RANK() OVER(ORDER BY Sales_Amount DESC) AS Rank_2,
DENSE_RANK() OVER(ORDER BY Sales_Amount DESC) AS Rank_3
FROM Sales_Data
ORDER BY Sales_Amount DESC

--PARTITION BY
SELECT Name, Department, 
ROW_NUMBER() OVER(PARTITION BY Department ORDER BY Sales_Amount DESC) AS Rank_1
FROM Sales_Data
ORDER BY Sales_Amount DESC