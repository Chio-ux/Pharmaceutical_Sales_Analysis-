# Project Report: Comprehensive Analysis of Pharma Sales Data

## Table Of Contents

- [Aim of Project](#aim-of-project)
- [Tools](#tools)
- [Dataset Overview](#dataset-overview)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Key Insights](#key-insights)
- [Recommendations](#recommendations)
- [Conclusion](#conclusion)
  

## Aim of Project

The aim of this project is to analyze the sales data from the Pharma dataset to extract key insights and trends, and provide recommendations for improving sales strategies. The analysis includes examining sales by product class, sub-channel, customer performance, country-specific sales trends, and year-over-year growth.

## Tools

Postgresql

## Dataset Overview

The Pharma dataset  which was already clean contains sales information with the following columns:
- Distributor
- Customer Name
- City
- Country
- Channel
- Sub-channel
- Product Name
- Product Class
- Quantity
- Price
- Sales
- Month
- Year
- Sales Rep
- Manager
- Sales Team

## Exploratory Data Analysis
  
Some of the key questions answered are;
1. How many unique countries are represented in the dataset? 
2. Select the names of all the customers on the 'Retail' channel. 
3. Find the total quantity sold for the ' Antibiotics' product class. 
4. List all the distinct months present in the dataset. 
5. Calculate the total sales for each year. 
6. Find the customer with the highest sales value. 
7. Get the names of all employees who are Sales Reps and are managed by 'James Goodwill'. 
8. Retrieve the top 5 cities with the highest sales. 
9. Calculate the average price of products in each sub-channel. 
10. Calculate the total sales for each product class, for each month, and order the results by 
    year, month, and product class. 
11. Find the top 3 sales reps with the highest sales in 2019. 
12. Calculate the monthly total sales for each sub-channel, and then calculate the average 
    monthly sales for each sub-channel over the years. 
13. Create a summary report that includes the total sales, average price, and total quantity 
    sold for each product class. 
14. Find the top 5 customers with the highest sales for each year. 
15. Calculate the year-over-year growth in sales for each country. 
17. List the months with the lowest sales for each year
18. Calculate the total sales for each sub-channel in each country, and then find the country 
    with the highest total sales for each sub-channel.

### Key Insights

Key Insights
1. Unique Countries: Acoording to the data provided sales were only made to Germany and Poland.
2. Top 5 Cities: The top 5 cities with the highest sales are all from Germany.
3. Customer Channels: The highest monthly sales come from the 'Retail' sub-channel.
4. Top Sales Reps in 2019: The three top sales reps are Jimmy Grey, Sheila Stones and Daniel Gates.
5. Monthly Trends: The months with the lowest sales for each year are:
  - 2017: January
  - 2018: December
  - 2019: January
2020: April
6. Yearly Sales Trends: Most sales come from Germany, generating over 2 billion dollars each year. The only sales made in the Poland were in 2018, generating over 680 million dollars.
7. Year-over-Year Growth Analysis
   - 2017 to 2018: Germany experienced a growth rate of 4.61%. This indicates that sales increased compared to the previous year.
   - 2018 to 2019: The growth rate decreased to 3.71%. Although there was still growth, the rate of increase slowed down compared to the previous year. This could be due to market saturation, increased 
     competition, or other economic factors.
   - 2019 to 2020: There was a decline in growth rate to -9.26%. This indicates a significant drop in sales compared to the previous year. Factors that could contribute to this decline include economic 
      downturns, increased competition, changes in customer preferences, or external factors such as global events affecting the market.
8. Top Product Classes: Analgesics generated the most sales with 2.4 billion dollars, followed by Antiseptics with 2.2 billion dollars. The least sales were from Antibiotics (1.8 billion dollars) and 
   Antimalarials (1.5 billion dollars).
9. Addressing Declines: Investigate the reasons behind the YoY decline in countries like Germany and develop strategies to counteract these declines, such as market research to understand changing customer 
   preferences or exploring new markets.
 

### Recommendations

1. Targeted Marketing: Implement targeted promotions during low-sales months and towards top-performing customers to boost retention and sales.
2. Inventory Management: Adjust inventory levels according to sales trends to optimize stock levels and reduce costs.
3. Channel Strategies: Develop specific strategies for different sub-channels based on their performance and average price metrics.
4. Geographical Focus: Focus marketing and sales efforts on top-performing cities and countries to maximize returns.
5. Performance Review: Regularly review sales reps' performance and provide targeted training or incentives to improve overall sales.

### Conclusion

This comprehensive analysis of the Pharma dataset has provided valuable insights into sales trends, customer behavior, and market performance. By leveraging these insights, businesses can implement strategic changes to enhance sales performance, optimize inventory, and better engage with customers. The recommendations provided aim to address identified issues and capitalize on opportunities for growth.









  
