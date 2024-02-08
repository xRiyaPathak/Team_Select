---------------------------------------------------------   OFFUTURE - "TEAM1 SELECT"   --------------------------------------------------
--------------------------------------------------   OFFUTURE QUALITY CONTROL CHECK DOCUMENT    --------------------------------------------------
---------------------------------------------------------          17-01-2024         --------------------------------------------------  

-- SQL01 | Checking the total number of columns in source CSV and destination table

SELECT 
	COUNT(*)
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_SCHEMA = 'student' AND 
	TABLE_NAME = 'group_select' ;    -- Output: 24 columns in source and destination
    
-- SQL02 | Checking the total number of rows in source CSV and destination table

SELECT 
	COUNT(row_id),
	COUNT(DISTINCT row_id)	
FROM
	student.group_select gs ;   -- Output: 51290 rows in source and destination

-- SQL03 | Checking for duplicates and uniqueness of row_id 
SELECT 
	row_id,
	COUNT(*)
FROM
	 student.group_select
GROUP BY
	row_id
HAVING 
	COUNT(*) > 1;   -- Output: 0 No duplicate data found.

-- SQL04 | Checking that special characters are loaded from Source CSV to destination table

SELECT 
	city,
	state  
FROM 
	student.group_select
WHERE 
	city ilike '%?%'
	OR city ilike '%á%'
	OR city ilike '%ã%'
	OR city ilike '%é%' 
	OR city ilike '%í%' 
	OR city ilike '%ç%'
	OR city ilike '%ë%';    -- Output: All the values are consistent.

    
-- SQL05 | Checking the data truncation for string data type with MAX-LENGTH function, so no data is lost.

SELECT 
	MAX(LENGTH(row_id::VARCHAR)) AS ROW_ID_MAX_LEN,
	MAX(LENGTH(order_id)) AS ORDER_ID_MAX_LEN, 
	MAX(LENGTH(ship_mode)) AS SHIP_MODE_MAX_LEN, 
	MAX(LENGTH(customer_id::VARCHAR)) AS CUSTOMER_ID_MAX_LEN, 
	MAX(LENGTH(customer_name::VARCHAR)) AS CUSTOMER_NAME_MAX_LEN, 
	MAX(LENGTH(segment)) AS SEGMENT_MAX_LEN, 
	MAX(LENGTH(city)) AS CITY_MAX_LEN, 
	MAX(LENGTH(state)) AS STATE_MAX_LEN, 
	MAX(LENGTH(country)) AS COUNTRY_MAX_LEN, 
	MAX(LENGTH(postal_code::VARCHAR)) AS POSTAL_CODE_MAX_LEN, 
	MAX(LENGTH(market)) AS MARKET_MAX_LEN, 
	MAX(LENGTH(region)) AS REGION_MAX_LEN, 
	MAX(LENGTH(product_id)) AS PRODUCT_ID_MAX_LEN, 
	MAX(LENGTH(category)) AS CATEGORY_MAX_LEN, 
	MAX(LENGTH(sub_category)) AS SUB_CATEGORY_MAX_LEN, 
	MAX(LENGTH(product_name)) AS PRODUCT_NAME_MAX_LEN, 
	MAX(LENGTH(order_priority)) AS ORDER_PRIORITY_MAX_LEN
FROM 
	student.group_select;   -- Output: All the MAX data length are consistent.
    
-- SQL06 | Randomly comparing 5 rows from source CSV and destincation table for data consistency

SELECT 
	*
FROM 
	student.group_select
WHERE 
	row_id IN (38956, 38867, 44477, 3232, 18557 );  -- Output: Data is consistent

-- SQL07 | Checking the number of nulls in a column to ensure no data has gone missing or been changed

SELECT 
    COUNT(*) - COUNT(gs.row_id) AS ROW_ID_NULLS,
    COUNT(*) - COUNT(gs.order_id) AS ORDER_ID_NULLS,
    COUNT(*) - COUNT(gs.order_date) AS ORDER_DATE_NULLS, 
    COUNT(*) - COUNT(gs.ship_date) AS SHIP_DATE_NULLS, 
    COUNT(*) - COUNT(gs.ship_mode) AS SHIP_MODE_NULLS, 
    COUNT(*) - COUNT(gs.customer_id) AS CUSTOMER_ID_NULLS, 
    COUNT(*) - COUNT(gs.customer_name) AS CUSTOMER_NAME_NULLS,
    COUNT(*) - COUNT(gs.segment) AS SEGMENT_NULLS, 
    COUNT(*) - COUNT(gs.city) AS CITY_NULLS,
    COUNT(*) - COUNT(gs.state) AS STATE_NULLS, 
    COUNT(*) - COUNT(gs.country) AS COUNTRY_NULLS, 
    COUNT(*) - COUNT(gs.postal_code) AS POSTAL_CODE_NULLS, 
    COUNT(*) - COUNT(gs.market) AS MARKET_NULLS, 
    COUNT(*) - COUNT(gs.region) AS REGION_NULLS, 
    COUNT(*) - COUNT(gs.product_id) AS PRODUCT_ID_NULLS, 
    COUNT(*) - COUNT(gs.category) AS CATEGORY_NULLS,
    COUNT(*) - COUNT(gs.sub_category) AS SUB_CATEGORY_NULLS, 
    COUNT(*) - COUNT(gs.product_name) AS PRODUCT_NAME_NULLS, 
    COUNT(*) - COUNT(gs.sales) AS SALES_NULLS, 
    COUNT(*) - COUNT(gs.quantity) AS QUANTITY_NULLS, 
    COUNT(*) - COUNT(gs.discount) AS DISCOUNT_NULLS, 
    COUNT(*) - COUNT(gs.profit) AS PROFIT_NULLS, 
    COUNT(*) - COUNT(gs.shipping_cost) AS SHIPPING_COST_NULLS, 
    COUNT(*) - COUNT(gs.order_priority) AS ORDER_PRIORITY_NULLS
FROM 
	student.group_select gs; -- Output: 41296 values are NULL for POSTAL_CODE, and is consistent with source data. No other NULLS found.
    
-- SQL08 | Checking the SUM of column SUMS for numeric columns

SELECT  
    SUM(row_id)
    + SUM(sales)
    + SUM(quantity)
    + SUM(discount)
    + SUM(profit)
    + SUM(shipping_cost) SUM_OF_SUMS
FROM student.group_select gs;    --Output: 1331006116.61916, same result as SUM of numeric columns in CSV

-- SQL09 | Checking the SUM of row SUMS for numeric columns

SELECT
	SUM(row_id 
	+ sales 
	+ quantity 
	+ discount 
	+ profit 
	+ shipping_cost) AS SUM_OF_ROW
FROM
	student.group_select gs;  --1331006116.61916, same result as SUM of numeric columns per rows in CSV
    
-- SQL10 | Checking the DATE format for order_date & ship_date 
    
SELECT 
	row_id ,
	order_date ,
	ship_date 
FROM 
	student.group_select gs
WHERE 
	row_id IN (38895, 21583, 4625, 42136, 50430);   -- Output: DD-MM-YYYY

-- SQL11 | Checking the SUM , MAX, MIN for numeric columns in source and destination to ensure the same result is obtained

SELECT 
	SUM(row_id) ROW_ID_SUM,
	MAX(row_id) ROW_ID_MAX,
	MIN(row_id) ROW_ID__MIN,
	SUM(sales) SALES_SUM,
	MAX(sales) SALES_MAX,
	MIN(sales) SALES_MIN,
	SUM(quantity) QUANTITY_SUM,
	MAX(quantity) QUANTITY_MAX,
	MIN(quantity) QUANTITY_MIN,
	SUM(discount) DISCOUNT_SUM,
	MAX(discount) DISCOUNT_MAX,
	MIN(discount) DISCOUNT_MIN,
	SUM(profit) PROFIT_SUM,
	MAX(profit) PROFIT_MAX,
	MIN(profit) PROFIT_MIN,
	SUM(shipping_cost) SHIPPING_COST_SUM,
	MAX(shipping_cost) SHIPPING_COST_MAX,
	MIN(shipping_cost) SHIPPING_COST_MIN
FROM 
	student.group_select gs;   -- Output: All the values are consistent
    
    
------------------------------------------------------------------------    END    ------------------------------------------------------------------------