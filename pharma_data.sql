

select * from pharma

create table Pharma (Distributor varchar(100),	Customer_Name varchar(100),	
City varchar(50),	Country varchar(50), Channel varchar(50),	Sub_channel	varchar(50),
Product_Name varchar(50),	Product_Class varchar(50),	Quantity int,	Price int,	Sales decimal,	
Month varchar(50),	Year float,	Sales_Rep varchar(100),	Manager varchar(100),	Sales_Team varchar(50))

-- How many unique countries are represented in the dataset? 
select count(distinct country)
from Pharma

--Select the names of all the customers on the 'Retail' channel.
select customer_name, sub_channel
from Pharma
where sub_channel='Retail'

--Find the total quantity sold for the ' Antibiotics' product class. 
select sum(quantity) as qty_of_anibiotics_sold
from Pharma
where product_class='Antibiotics'

-- List all the distinct months present in the dataset. 
select distinct month
from Pharma

--Calculate the total sales for each year. 
select year, round(sum(sales),2) as total_sales
from Pharma
group by year

-- Find the customer with the highest sales value.
select customer_name, round(sum(sales),0) as sales_value
from Pharma
group by 1
order by sales_value desc
limit 1

--Get the names of all employees who are Sales Reps and are managed by 'James Goodwill'. 
select sales_rep
from Pharma
where manager = 'James Goodwill'
and sales_rep IS NOT NULL

--Retrieve the top 5 cities with the highest sales. 
select city,round(sum(sales),0) as total_sales
from Pharma
group by city
order by total_sales desc
limit 5

--Calculate the average price of products in each sub-channel.
select sub_channel, round(avg(price),2) as avg_price
from Pharma
group by sub_channel

-- Calculate the total sales for each product class, for each month, and order the results by 
--year, month, and product class. 
select month, product_class, sum(sales)as total_sales
from Pharma
group by 1,2

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
select sales_rep, round(sum(sales),2) as total_sales
from Pharma
where year = 2019
group by 1
order by total_sales desc
limit 3

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
select product_class,round(sum(sales),2) as total_sales,
round(avg(price),2) as avg_price, sum(quantity) as total_quantity
from Pharma
group by 1



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
 WITH ranked_sales as
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
           (select country, sub_channel, sum(sales) AS total_sales,
           ROW_NUMBER() OVER (PARTITION BY sub_channel ORDER BY sum(sales) desc) as SalesRank
           from Pharma
           group by 1,2)
select 
country, sub_channel, total_sales
from RankedSales
where salesRank=1

