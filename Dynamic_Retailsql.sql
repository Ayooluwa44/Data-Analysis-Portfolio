--Sales trend over time--
SELECT COUNT (*) AS Row_No
FROM Dynamic_Retail$

SELECT *
FROM Dynamic_Retail$

--Sales trend over time--
--// Total sales by year 
SELECT
      YEAR([Order Date]) AS Year, 
      ROUND (SUM([Sales]), 2) AS Total_Sales 
FROM Dynamic_Retail$
GROUP BY 
      YEAR([Order Date])
ORDER BY
      YEAR([Order Date])

--// Total sales by month
SELECT 
    ROUND(SUM(Sales),2) AS Total_Sales,
    DATENAME(MONTH, [Order Date]) AS Monthname
FROM Dynamic_Retail$
GROUP BY 
    DATENAME(MONTH, [Order Date]),
    MONTH([Order Date])
ORDER BY 
    MONTH([Order Date])

--// Total sales by quater --//
SELECT 'Q' + CAST(DATEPART(QUARTER,[Order Date]) AS VARCHAR) AS Quater, ROUND(SUM([Sales]),2) AS Total_Sales
FROM Dynamic_Retail$
GROUP BY DATEPART(QUARTER,[Order Date])
ORDER BY DATEPART(QUARTER,[Order Date])

--// Total sales by day --//
SELECT 
    ROUND(SUM(Sales),2) AS Total_Sales,
    DATENAME(WEEKDAY, [Order Date]) AS Dayname
FROM Dynamic_Retail$
GROUP BY 
    DATENAME(WEEKDAY, [Order Date]),
    DATEPART(WEEKDAY, [Order Date])
ORDER BY 
    DATEPART(WEEKDAY, [Order Date]) DESC

--Month-Year---
----
SELECT 
    SUM(Sales) AS Total_Sales,
    FORMAT([Order Date], 'MMM-yyyy') AS MONTHNAME
FROM Dynamic_Retail$
GROUP BY 
    FORMAT([Order Date], 'MMM-yyyy'),
    YEAR([Order Date]),
    MONTH([Order Date])
ORDER BY 
    YEAR([Order Date]),
    MONTH([Order Date])

-----------------------------
--Total_Sales by Segement--
SELECT Segment, 
       ROUND(SUM(Sales),2) AS Total_Sales
FROM Dynamic_Retail$
GROUP BY Segment

------------------------------
--Total_Sales by Category
SELECT Category, 
       CONCAT(ROUND(SUM([Profit]) *100 / SUM([Sales]),2), '%') AS Profit_Margin_Pct
FROM Dynamic_Retail$
GROUP BY Category

------------------------------
--Top 10 Customers with heavy discount
SELECT TOP 10 [Customer Name], 
           SUM(Discount) AS Total_Discount
FROM Dynamic_Retail$
GROUP BY [Customer Name]
ORDER BY Total_Discount DESC

-----------------------------
--Best selling product by quantity
SELECT [Product Name], 
           SUM(Quantity) AS Total_Quantity
FROM Dynamic_Retail$
GROUP BY [Product Name]
ORDER BY Total_Quantity DESC

--------------------------Profitability Analysis------------------------------------
--Profit Contribution by Sub-Categories
SELECT TOP 7 [Sub-Category], 
           ROUND(SUM(Profit),2) AS Total_Profit
FROM Dynamic_Retail$
GROUP BY [Sub-Category]
ORDER BY Total_Profit DESC

--Profit_Margin% across Ship Mode
SELECT [Ship Mode], 
       CONCAT(ROUND(SUM([Profit]) *100 / 
       SUM([Sales]),2), '%') AS Profit_Margin_Pct
FROM Dynamic_Retail$
GROUP BY [Ship Mode]

--Profit Distribution by Segment
SELECT [Segment], 
       ROUND(SUM([Profit]),2) AS Total_Profit
FROM Dynamic_Retail$
GROUP BY [Segment]

--Shipment Volume by Shipping Mode
SELECT [Ship Mode], COUNT(*) AS Volume
FROM Dynamic_Retail$
GROUP BY [Ship Mode]

-------------Customer Insight------------------
--Customer Segmentation Analysis
SELECT [Segment], COUNT([Customer ID]) AS Volume
FROM Dynamic_Retail$
GROUP BY [Segment]

--Best selling product by volume
SELECT [Ship Mode], COUNT([Customer ID]) AS Volume
FROM Dynamic_Retail$
GROUP BY [Ship Mode]


--REPEEAT CUSTOMERS 
SELECT COUNT(*) AS Repeat_Customers
FROM (
SELECT [Customer Name]
FROM Dynamic_Retail$
GROUP BY [Customer Name]
HAVING COUNT(*) > 1
) AS SUBQUERY

--REPEAT CUSTOMERS COUNT
SELECT [Customer Name], COUNT(*) AS Repeat_Customers_Count
FROM Dynamic_Retail$
GROUP BY [Customer Name]
HAVING COUNT(*) > 1
ORDER BY Repeat_Customers_Count DESC

--TOP REGIONAL MANAGER BY SALES
SELECT [Region Managers], SUM(Sales) AS Total_Sales
FROM Dynamic_Retail$
GROUP BY [Region Managers] 
ORDER BY Total_Sales DESC

--PROFIT BY STATES
SELECT [State], SUM(Profit) AS Total_Profit
FROM Dynamic_Retail$
GROUP BY [State] 
ORDER BY Total_Profit DESC

--ORDER BY CITY
SELECT City, count(*) AS Total_Order
FROM Dynamic_Retail$
GROUP BY [City] 
ORDER BY Total_Order DESC

--customer count
SELECT COUNT (*)
FROM (
SELECT [Customer Name]
FROM Dynamic_Retail$
GROUP BY [Customer Name]
) AS SUB