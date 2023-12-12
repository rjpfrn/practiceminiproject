-- number of male and female; show in bar graph
SELECT 
    gender, COUNT(*) AS 'Population'
FROM
    shop.shop_info
GROUP BY Gender;

-- percentage of sizes through pie chart
SELECT 
    Size,
    ROUND(((COUNT(*) / (SELECT 
                    COUNT(*)
                FROM
                    shop.shop_info)) * 100),
            2) AS 'Percentage of sizes'
FROM
    shop.shop_info
GROUP BY Size;

-- histogram of age
SELECT 
    age, COUNT(*) AS 'Count/Density'
FROM
    shop.shop_info
GROUP BY Age
ORDER BY 1;

-- bar graph count of items per category
SELECT 
    category, COUNT(*) AS 'Number of Occurence'
FROM
    shop.shop_info
GROUP BY Category
ORDER BY 2 DESC;

-- horizontal bar graph count/number of 'item purchased'
SELECT 
    Item_Purchased, COUNT(*) AS `Number of Occurences`
FROM
    shop.shop_info
GROUP BY Item_Purchased
ORDER BY 2 DESC;

-- bar graph of location column
SELECT 
    location, COUNT(*) AS 'Count'
FROM
    shop.shop_info
GROUP BY Location
ORDER BY 2 DESC;

-- horizontal bar graph of 'color' column
SELECT 
    color, COUNT(*) AS 'Count'
FROM
    shop.shop_info
GROUP BY Color
ORDER BY 2 DESC;

-- bar graph of 'season' column
SELECT 
    season, COUNT(*) AS 'Count'
FROM
    shop.shop_info
GROUP BY Season
ORDER BY 2 DESC;

-- pie chart percentage of occurences in 'season' column
SELECT 
    season,
    ROUND(((COUNT(*) / (SELECT 
                    COUNT(*)
                FROM
                    shop.shop_info)) * 100),
            2) AS 'Percentage'
FROM
    shop.shop_info
GROUP BY Season
ORDER BY 2 DESC;

-- pie chart percentage for subscription status
SELECT 
    Subscription_Status,
    ROUND(((COUNT(*) / (SELECT 
                    COUNT(*)
                FROM
                    shop.shop_info)) * 100),
            2) AS 'Percentage'
FROM
    shop.shop_info
GROUP BY Subscription_Status
ORDER BY 2 DESC;

-- bar graph of number of occurences of a particular mode in payment method
SELECT 
    Payment_Method, COUNT(*) AS 'Count'
FROM
    shop.shop_info
GROUP BY Payment_Method
ORDER BY 2 DESC;

-- pie chart percentage of count in payment method column from the data set
SELECT 
    Payment_Method,
    ROUND(((COUNT(*) / (SELECT 
                    COUNT(*)
                FROM
                    shop.shop_info)) * 100),
            2) AS 'Percentage Count'
FROM
    shop.shop_info
GROUP BY Payment_Method
ORDER BY 2 DESC;

-- bar graph of 'shipping type' column
SELECT 
    Shipping_Type, COUNT(*) AS 'Count'
FROM
    shop.shop_info
GROUP BY Shipping_Type
ORDER BY 2 DESC;

-- pie chart of 'shipping type' column
SELECT 
    Shipping_Type, COUNT(*) AS 'Count'
FROM
    shop.shop_info
GROUP BY Shipping_Type
ORDER BY 2 DESC;

-- bar graph of 'frequency of purchases' column
SELECT 
    Frequency_of_Purchases, COUNT(*) AS 'Count'
FROM
    shop.shop_info
GROUP BY Frequency_of_Purchases
ORDER BY 2 DESC;

-- histogram of age distribution
SELECT 
    age, COUNT(*) AS 'Frequency'
FROM
    shop.shop_info
GROUP BY Age
ORDER BY 1;

-- pie chart of 'Frequency of Purchase' column
SELECT 
    Frequency_of_Purchases,
    ROUND(((COUNT(*) / (SELECT 
                    COUNT(*)
                FROM
                    shop.shop_info)) * 100),
            2) AS 'Percentage frequency'
FROM
    shop.shop_info
GROUP BY Frequency_of_Purchases
ORDER BY 2 DESC;

-- box plot of purchase amount by gender
SELECT 
    gender,
    MAX(Purchase_Amount_USD) AS MAX,
    MIN(Purchase_Amount_USD) AS MIN
FROM
    shop.shop_info
GROUP BY Gender;

-- scatter plot of age vs review rating column
SELECT 
    Review_Rating, age
FROM
    shop.shop_info
ORDER BY age DESC , Review_Rating DESC;

-- stacked bar chart of subscription status by gender
SELECT 
    gender,
    COUNT(*) AS GenderCount,
    Subscription_Status,
    COUNT(*) AS SubcriptionCount
FROM
    shop.shop_info
GROUP BY gender , Subscription_Status;

-- area plot of total purch amt by category
SELECT 
    category, COUNT(*) AS 'Total Purch Amt'
FROM
    shop.shop_info
GROUP BY Category
ORDER BY 1;

-- hexbin plot of age vs purch amt
SELECT 
    age, COUNT(Purchase_Amount_USD) AS 'Count'
FROM
    shop.shop_info
GROUP BY age
ORDER BY 1;
