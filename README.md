# Walmart Sales Data Analysis

## Introduction
The main purpose of this project is to gain insights into various factors impacting the sales of different branches, and eventually explore how sales strategies can be enhanced and optimized. The data for this study comes from the [Kaggle Walmart Sales Forecasting Competition](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting).

## Approaches
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
  - Month with the largest COGS (cost of goods sold)?
  - Product line with the largest revenue?
  - City with the largest revenue?
  - Product line with the largest VAT (value-added tax)?
  - Which branch sold more products than the average?
  - Most common product line by gender?
  - Average rating of each product line?
- Customer
  - How many unique customer types does the data have?
  - How many unique payment methods does the data have?
  - What is the most common customer type?
  - Which customer type buys the most?
  - What is the gender of most of the customers?
  - What is the gender distribution per branch?
  - Which time of the day do customers give the most ratings?
  - Which time of the day do customers give the most ratings per branch?
  - Which day of the week has the best average ratings?
  - Which day of the week has the best average ratings per branch?
- Sales
  - Number of sales made in each time of the day per weekday
  - Which of the customer types brings the most revenue?
  - Which city has the largest tax percent/ VAT (Value Added Tax)?
  - Which customer type pays the most in VAT?

