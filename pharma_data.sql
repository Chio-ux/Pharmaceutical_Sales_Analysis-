

select * from pharma

CREATE TABLE Pharma (Distributor varchar(100),	Customer_Name varchar(100),	
City varchar(50),	Country varchar(50), Channel varchar(50),	Sub_channel	varchar(50),
Product_Name varchar(50),	Product_Class varchar(50),	Quantity int,	Price int,	Sales decimal,	
Month varchar(50),	Year float,	Sales_Rep varchar(100),	Manager varchar(100),	Sales_Team varchar(50))

-- How many unique countries are represented in the dataset? 
SELECT COUNT(DISTINCT country)
FROM Pharma

--Select the names of all the customers on the 'Retail' channel.
SELECT customer_name, sub_channel
FROM Pharma
WHERE sub_channel='Retail'

--Find the total quantity sold for the ' Antibiotics' product class. 
SELECT SUM(quantity) AS qty_of_anibiotics_sold
FROM Pharma
WHERE product_class='Antibiotics'

-- List all the distinct months present in the dataset. 
SELECT DISTINCT month
FROM Pharma

--Calculate the total sales for each year. 
SELECT year, round(SUM(sales),2)AS total_sales
FROM Pharma
GROUP BY year

-- Find the customer with the highest sales value.
SELECT customer_name, round(SUM(sales),0) AS sales_value
FROM Pharma
GROUP BY  1
ORDER BY sales_value DESC
LIMIT 1

--Get the names of all employees who are Sales Reps and are managed by 'James Goodwill'. 
SELECT sales_rep
FROM Pharma
WHERE manager = 'James Goodwill'
AND sales_rep IS NOT NULL

--Retrieve the top 5 cities with the highest sales. 
SELECT city,round(SUM(sales),0) AS total_sales
FROM Pharma
GROUP BY city
ORDER BY total_sales DESC
LIMIT 5

--Calculate the average price of products in each sub-channel.
SELECT sub_channel, ROUND(AVG(price),2) AS avg_price
FROM Pharma
GROUP BY sub_channel

-- Calculate the total sales for each product class, for each month, and order the results by 
--year, month, and product class. 

SELECT
    Year,
    Month,
    Product_Class,
    SUM(Sales) AS Total_Sales
FROM Pharma
GROUP BY
    Year,
    Month,
    Product_Class
ORDER BY
    Year,
    Month,
    Product_Class;

--Find the top 3 sales reps with the highest sales in 2019. 
SELECT sales_rep, round(SUM(sales),2) AS total_sales
FROM Pharma
WHERE year = 2019
GROUP BY 1
ORDER BY total_sales DESC
LIMIT 3

--Calculate the monthly total sales for each sub-channel, and then calculate the average 
--monthly sales for each sub-channel over the years.
WITH MonthlyTotalSales AS (
    SELECT
        Year,
        Month,
        Sub_channel,
        SUM(Sales) AS Total_Sales
    FROM Pharma
    GROUP BY
        Year,
        Month,
        Sub_channel
),
AverageMonthlySales AS (
    SELECT
        Sub_channel,
        AVG(Total_Sales) AS Average_Monthly_Sales
    FROM MonthlyTotalSales
    GROUP BY Sub_channel
)
SELECT * FROM AverageMonthlySales;

--Create a summary report that includes the total sales, average price, and total quantity 
--sold for each product class. 
SELECT product_class,round(SUM(sales),2)AS total_sales,
round(AVG(price),2) AS avg_price, SUM(quantity) AS total_quantity
FROM Pharma
GROUP BY 1



--Find the top 5 customers with the highest sales for each year. 

WITH RankedSales AS (
    SELECT
        Year,
        Customer_Name,
        SUM(Sales) AS Total_Sales,
        ROW_NUMBER() OVER (PARTITION BY Year ORDER BY SUM(Sales) DESC) AS SalesRank
    FROM Pharma
    GROUP BY Year, Customer_Name
)
SELECT
    Year,
    Customer_Name,
    Total_Sales
FROM RankedSales
WHERE SalesRank <= 5
ORDER BY Year, SalesRank;

--Calculate the year-over-year growth in sales for each country. 
WITH CountryYearSales AS (
    SELECT
        Country,
        Year,
        SUM(Sales) AS Total_Sales
    FROM Pharma
    GROUP BY Country, Year
),
CountrySalesWithLag AS (
    SELECT
        Country,
        Year,
        Total_Sales,
        LAG(Total_Sales) OVER (PARTITION BY Country ORDER BY Year) AS Previous_Year_Sales
    FROM CountryYearSales
)
SELECT
    Country,
    Year,
    Total_Sales,
    Previous_Year_Sales,
    CASE
        WHEN Previous_Year_Sales IS NULL THEN NULL
        ELSE (Total_Sales - Previous_Year_Sales) / Previous_Year_Sales * 100
    END AS YoY_Growth_Percentage
FROM CountrySalesWithLag
ORDER BY Country, Year;

--List the months with the lowest sales for each year 
 WITH ranked_salesAS
 (SELECT
        Year,
       month,
        SUM(Sales) AS Total_Sales,
        ROW_NUMBER() OVER (PARTITION BY Year ORDER BY SUM(Sales) ASC) AS SalesRank
    FROM Pharma
    GROUP BY Year, month)
	SELECT
    Year,
    month,
    Total_Sales
FROM ranked_sales
WHERE SalesRank = 1
ORDER BY Year, SalesRank;

--Calculate the total sales for each sub-channel in each country, and then find the country 
--with the highest total sales for each sub-channel.
WITH RankedSales AS
           (SELECT country, sub_channel, SUM(sales) AS total_sales,
           ROW_NUMBER() OVER (PARTITION BY sub_channel ORDER BY SUM(sales) DESC)AS SalesRank
           FROM Pharma
           GROUP BY 1,2)
SELECT 
country, sub_channel, total_sales
FROM RankedSales
WHERE salesRank=1

---top product class
SELECT product_class, SUM(sales) AS sales
FROM pharma
GROUP BY 1
ORDER BY sales DESC
