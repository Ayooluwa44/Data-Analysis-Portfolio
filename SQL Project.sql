--Q1. Retrieve the FirstName, LastName, and EmailAddress of all customers from DimCustomer.
SELECT FirstName, LastName, EmailAddress
FROM DimCustomer

--Q2. Show all distinct values of EnglishOccupation from DimCustomer.
SELECT DISTINCT EnglishOccupation
FROM DimCustomer

--Q3. Return the top 10 products from DimProduct ordered by ListPrice descending.
SELECT TOP 10 EnglishProductName
FROM DimProduct
ORDER BY ListPrice DESC

--Q4. List all customers whose YearlyIncome is between 50,000 and 100,000.
SELECT FirstName, LastName, YearlyIncome
FROM DimCustomer
WHERE YearlyIncome BETWEEN 50000.00 AND 100000.00

--Q5. Find all customers where MiddleName is NULL.
SELECT FirstName, LastName
FROM DimCustomer
WHERE MiddleName IS NULL

--Q6. Retrieve all products where Color is either 'Red', 'Blue', or 'Black' using IN.
SELECT EnglishProductName, Color
FROM DimProduct
WHERE Color IN ('Red','Blue','Black')

--Q7. List all customers whose LastName starts with the letter 'M'.
SELECT LastName
FROM DimCustomer
WHERE LastName LIKE 'M%'

--Q8. Show all customers who are 'Married' AND have an EnglishEducation of 'Bachelors'.
SELECT FirstName, LastName
FROM DimCustomer
WHERE MaritalStatus = 'M' AND EnglishEducation = 'Bachelors'

--Q9. Retrieve all sales records from FactInternetSales where SalesAmount is greater than 1,000.
SELECT SalesOrderNumber
FROM FactInternetSales
WHERE SalesAmount > 1000

--Q10. Display all products from DimProduct where ListPrice is NOT NULL and Color is NOT 'Silver'.
SELECT EnglishProductName
FROM DimProduct
WHERE ListPrice IS NOT NULL AND Color <> 'Silver'

--Q11. List all customers from DimCustomer ordered by LastName ascending, then FirstName ascending.
SELECT FirstName, LastName
FROM DimCustomer 
ORDER BY LastName ASC, FirstName ASC

/*Q12. From FactInternetSales, calculate a GrossProfit column as SalesAmount TotalProductCost. 
Return SalesOrderNumber, SalesAmount, TotalProductCost, and GrossProfit. */
SELECT SalesOrderNumber, SalesAmount, TotalProductCost, SalesAmount - TotalProductCost AS GrossProfit
FROM FactInternetSales

/*Q13. Return the top 5 most expensive products from DimProduct by ListPrice, 
showing EnglishProductName and ListPrice. */
SELECT TOP 5 EnglishProductName
FROM DimProduct
ORDER BY ListPrice DESC

/*Q14. Write a query that labels customers based on YearlyIncome:
• 'Low' for under 40,000
• 'Mid' for 40,000–99,999
• 'High' for 100,000 and above
Alias the label column as IncomeGroup.*/
SELECT YearlyIncome,
CASE 
	WHEN YearlyIncome < 40000 THEN 'Low'
	WHEN YearlyIncome <= 99999 THEN 'Mid'
	WHEN YearlyIncome >= 100000 THEN 'High'
END AS IncomeGroup
FROM DimCustomer

/*Q15. From DimCustomer, use ISNULL() to replace any NULL MiddleName with the text
'N/A'. Return FirstName, MiddleName, and LastName.*/
SELECT FirstName, ISNULL(MiddleName,'N/A') AS MiddleName, LastName
FROM DimCustomer

/*Q16. From FactInternetSales, compute TaxAmt + Freight as AdditionalCharges and return it
alongside SalesOrderNumber and SalesAmount.*/
SELECT SalesOrderNumber,SalesAmount,TaxAmt + Freight AS AdditionalCharges
FROM FactInternetSales

/*Q17. Write a CASE statement on DimProduct that labels products as 'Affordable' if
ListPrice < 100, 'Mid-Range' if between 100 and 999, and 'Premium' if 1,000 or above. Alias
it as PriceCategory.*/
SELECT EnglishProductName,
CASE WHEN ListPrice < 100 THEN 'Affordable'
	 WHEN ListPrice < 1000 THEN  'Mid-Range'
	 WHEN ListPrice > 1000 THEN 'Premium'
END AS PriceCategory
FROM DimProduct

/*Q18. From DimCustomer, use COALESCE() to return the first non-null value among Phone,
EmailAddress as a single column called PrimaryContact.*/
SELECT
    COALESCE(Phone, EmailAddress) AS PrimaryContact
FROM DimCustomer

/*Q19. List all records from FactInternetSales sorted by OrderDateKey ascending and
SalesAmount descending.*/
SELECT *
FROM FactInternetSales
ORDER BY OrderDateKey ASC, SalesAmount DESC

/*Q20. From DimEmployee, write a CASE statement that returns 'Active' if Status = 'Current',
otherwise 'Inactive'. Alias it as EmployeeStatus. Order results by LastName.*/
SELECT Status, 
CASE WHEN Status = 'Current' THEN 'Active'
	 ELSE 'Inactive'
END AS EmployeeStatus
FROM DimEmployee
ORDER BY LastName

/*Q21. Count the total number of customers in DimCustomer.*/
SELECT COUNT(CustomerKey) AS Customer_No
FROM DimCustomer

/*Q22. Find the total SalesAmount from FactInternetSales.*/
SELECT SUM(SalesAmount) AS Total_Sales
FROM FactInternetSales 

/*Q23. Calculate the average YearlyIncome of customers grouped by EnglishOccupation.*/
SELECT AVG(YearlyIncome) AS Avg_YearlyIncome
FROM DimCustomer
GROUP BY EnglishOccupation 

/*Q24. Find the highest and lowest ListPrice in DimProduct.*/
SELECT MAX (ListPrice) AS Highest_Price, MIN (ListPrice) AS Lowest_Price
FROM DimProduct

/*Q25. From DimCustomer, count how many customers fall into each EnglishEducation
level. Order by count descending.*/
SELECT EnglishEducation, COUNT(*) AS CustomerCount
FROM DimCustomer
GROUP BY EnglishEducation
ORDER BY CustomerCount DESC