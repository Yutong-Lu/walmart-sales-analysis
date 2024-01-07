# Walmart Sales Data Analysis

## About
This project delves into Walmart Sales data to identify top-performing branches and products, analyze sales trends across different products, and understand customer behaviour. The objective is to explore how sales strategies can be enhanced and optimized. The data for this study comes from the Kaggle Walmart Sales Forecasting Competition[https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting].

## Purposes Of The Project
The primary goal of this project is to gain insights into Walmart's sales data to understand the various factors impacting the sales of different branches.

## Approach Used
1. **Data Wrangling**: Inspecting data for NULL or missing values and applying data replacement methods.
   - Build a database.
   - Create tables and insert data.
   - Ensure there are no null values (fields are set to NOT NULL).

2. **Feature Engineering**: Generating new columns from existing data.
   - Add `time_of_day` to indicate sales in the Morning, Afternoon, and Evening.
   - Add `day_name` with the day of the week for each transaction.
   - Add `month_name` with the month of the year for each transaction.

3. **Exploratory Data Analysis (EDA)**: Conducting EDA to address the project's questions and aims.

### Business Questions To Answer
- General
  - How many unique cities are in the data?
  - Which city has which branch?
- Product
  - How many unique product lines are there?
  - What is the most common payment method?
  - What is the most selling product line?
  - Total revenue by month?
  - Month with the largest COGS?
  - Product line with the largest revenue?
  - City with the largest revenue?
  - Product line with the largest VAT?
  - Classify each product line as "Good" or "Bad" based on average sales.
  - Which branch sold more products than the average?
  - Most common product line by gender?
  - Average rating of each product line?
