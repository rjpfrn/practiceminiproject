-- make a schema / database first
create database if not exists salesDataWalmart;

-- make table for the database
create table if not exists sales (
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);


-- ADDING ADDITIONAL COLUMN FOR CLEARER DATA ORGANIZATION

-- time_of_day column to tell if it is morning, afternoon, or evening
select time,
	(case 
		when `time` between '00:00:00' and "12:00:00" then "Morning"
		when `time` between '12:01:00' and "16:00:00" then 'Afternoon'
        else "Evening"
	end) as time_of_day
from salesdatawalmart.sales;

-- add the time_of_day column
alter table salesdatawalmart.sales add column time_of_day varchar(20);

-- update the table to put the values
update salesdatawalmart.sales set time_of_day = (case 
		when `time` between '00:00:00' and "12:00:00" then "Morning"
		when `time` between '12:01:00' and "16:00:00" then 'Afternoon'
        else "Evening"
	end);

-- day_name column to tell if it is monday, tuesday, etc
select date, dayname(date) as day_name from salesdatawalmart.sales;

-- add the day_name column in the table
alter table salesdatawalmart.sales add column day_name varchar(10);

-- update the table to insert the values
update salesdatawalmart.sales set day_name = dayname(date);

-- day_name column to identify if it is January, February, etc
select date, monthname(date) from salesdatawalmart.sales;

-- add the month_name column
alter table salesdatawalmart.sales add column month_name varchar(10);

-- update the table to insert the values
update salesdatawalmart.sales set month_name = monthname(date);

-- GENERIC QUESTION
-- how many unique cities does the data have?
select count(distinct city) as number_of_unique_cities from salesdatawalmart.sales;

-- which city is each branch
select distinct city, branch from salesdatawalmart.sales;

-- PRODUCT
-- ---------------------------------------------------
-- how many unique product lines does the data have?
select distinct product_line from salesdatawalmart.sales;

-- what is the most common payment method?
select payment, count(*) as Count from salesdatawalmart.sales group by payment order by 2 desc;

-- what is the most selling product line?
select product_line, count(*) as 'Number of Item Sold' from salesdatawalmart.sales group by product_line order by 2 desc;

-- total revenue by month
select month_name, sum(total) as 'Total revenue' from salesdatawalmart.sales group by month_name order by 2 desc;

-- what month had the largest COGS?
select month_name as Month, sum(cogs) as 'Number of COGS' from salesdatawalmart.sales group by month_name order by 2 desc;

-- what product line had the largest revenue?
select product_line, sum(total) as Revenue from salesdatawalmart.sales group by product_line order by 2 desc;

-- what is the city with the largest revenue?
select branch, city, sum(total) as "Total Revenue" from salesdatawalmart.sales group by city, branch order by 3 desc;

-- what product line had the largest VAT?
select product_line, avg(tax_pct) as VAT from salesdatawalmart.sales group by product_line order by VAT desc;

-- fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
select avg(quantity) from sales;
-- the '6' came from the computed avg of quantity from the query above it is 5.4995 which can be count as 6
select product_line, avg(quantity), case when avg(quantity) > 6 then "Good" else "Bad" end as Remark from salesdatawalmart.sales group by product_line;

-- which branch sold more products than average product sold?
select branch, sum(quantity) as qty from salesdatawalmart.sales group by branch having sum(quantity) > (select avg(quantity) from salesdatawalmart.sales) order by 2 desc;

-- what is the most common product line by gender?
select gender, product_line, count(*) as Count from salesdatawalmart.sales group by gender, product_line order by 3 desc;

-- what is the average rating of each product line?
select product_line, round(avg(rating), 2) as AVG_Rating from salesdatawalmart.sales group by product_line order by 2 desc;


-- SALES -------------------------------------------------------------
-- -------------------------------------------------------------------
-- number of sales made in each time of the day per weekday
select time_of_day, count(*) as 'Number of Sales' from salesdatawalmart.sales where day_name = "Sunday" group by time_of_day order by 2 desc;
	-- we can say that the store is filled with customers who buys in evening hours compare to the morning and afternoon time --

-- which of the customer types brings the most revenue?
select customer_type, sum(total) as Revenue from salesdatawalmart.sales group by customer_type order by 2 desc;

-- which city has the largest tax percent/ VAT (Value Added Tax)?
select city, round(avg(tax_pct), 2) as VAT from salesdatawalmart.sales group by city order by 2 desc;

-- which customer type pays the most in VAT?
select customer_type, round(avg(tax_pct), 2) as VAT from salesdatawalmart.sales group by customer_type order by 2 desc;



-- CUSTOMERS ------------------------------------------------
-- ----------------------------------------------------------
-- how many unique customer types does the data have?
select distinct customer_type from salesdatawalmart.sales;

-- how many unique payment methods does the data have?
select distinct payment from salesdatawalmart.sales;

-- What is the most common customer type?
select customer_type, count(*) as COunt from salesdatawalmart.sales group by customer_type order by 2 desc;

-- Which customer type buys the most?
select customer_type, quantity, count(*) as Count from salesdatawalmart.sales group by customer_type, quantity order by 3 desc;

-- what is the gender of most of the customers?
select gender, count(*) as Count from salesdatawalmart.sales group by gender order by 2 desc;

-- what is the gender distribution per branch?
select branch, gender, count(*) as 'Gender Distribution' from salesdatawalmart.sales group by branch, gender order by 1, 2 desc;

-- which time of the day do customers give most ratings?
select time_of_day, avg(rating) as AVG_RATING from salesdatawalmart.sales group by time_of_day order by 2 desc;

-- which time of the day do customers give most ratings per branch?
select branch, time_of_day, avg(rating) as AVG_RATING from salesdatawalmart.sales group by branch, time_of_day order by 1;

-- which day of the week has the best avg ratings?
select day_name, avg(rating) as AVG_Rating from salesdatawalmart.sales group by day_name order by 2 desc;

-- which day of the week has the best average ratings per branch?
select branch, day_name, avg(rating) as AVG_Rating from salesdatawalmart.sales group by branch, day_name order by 3 desc;
