---------------------------------------------------------   OFFUTURE - "TEAM1 SELECT"   --------------------------------------------------
---------------------------------------------------------    SQL CODE FOR ANALYSIS   --------------------------------------------------
---------------------------------------------------------         22-01-2024         --------------------------------------------------  
-- This SQL file consist of the queries used for visualization analysis.


--  Slide 7 - QUANTITY SOLD PER CATEGORY

SELECT 
    category,
    SUM(quantity) AS "Sales_per_category"
FROM
    student.group_select
GROUP BY 
    category;

/* OUTPUT:
Furniture	    34954
Office Supplies	108182
Technology	    35176
*/

--  Slide 8 | QUANTITY SOLD PER SUB-CATEGORY

SELECT 
    gs.category,
    gs.sub_category,
    SUM(quantity) AS "Sales_per_category"
FROM
    student.group_select gs
GROUP BY 
    gs.category,
    gs.sub_category
ORDER BY 
    gs.category,
    SUM(quantity);

/*  OUTPUT:
category            sub_category    quantity
Furniture	        Tables	        3083
Furniture	        Bookcases	    8310
Furniture	        Furnishings	    11225
Furniture	        Chairs	        12336
Office Supplies	    Appliances	    6078
Office Supplies	    Envelopes	    8380
Office Supplies	    Fasteners	    8390
Office Supplies	    Supplies	    8543
Office Supplies	    Labels	        9322
Office Supplies	    Paper	        12822
Office Supplies	    Art	            16301
Office Supplies	    Storage	        16917
Office Supplies	    Binders	        21429
Technology	        Machines	    4906
Technology	        Copiers	        7454
Technology	        Accessories	    10946
Technology	        Phones	        11870
*/


-- Slide 10 | CHECKING PROFIT BY SUB-CATEGORY TO VERIFY LOSS DUE TO TABLES 

SELECT  
	SUM(profit) as sum_profit, 
	sub_category  
FROM  
    student.group_select gs 
GROUP BY  
    sub_category
ORDER BY
	sum_profit; 
    
/* OUTPUT:
sum_profit      sub_category
-64083.3887	    Tables
11525.4241	    Fasteners
15010.5120	    Labels
22583.2631	    Supplies
29601.1163	    Envelopes
46967.4255	    Furnishings
57953.9109	    Art
58867.8730	    Machines
59207.6827	    Paper
72449.8460	    Binders
108461.4898	    Storage
129626.3062	    Accessories
140396.2675	    Chairs
141680.5894	    Appliances
161924.4195	    Bookcases
216717.0058	    Phones
258567.54818	Copiers

*/

-- Slide 14 | SUM OF PROFIT/SALES GROUPED BY SEGMENT  

SELECT  
	SUM(sales) AS sum_of_sales, 
	segment 
FROM  
	student.group_select gs  
GROUP BY  
	Segment; 

/* OUTPUT:
6507949.41786	Consumer
3824697.52146	Corporate
2309854.97056	Home Office
*/
    
-- Slide 15 | SUM OF SALES COUNTRY

SELECT 
country,
	SUM(sales) as sum_sales
FROM
	student.group_select
GROUP BY
	country 
ORDER BY 
	sum_sales DESC;       

-- Slide 16 | SUM OF PROFIT COUNTRY

SELECT 
    country,
	SUM(profit) as sum_sales
FROM
	student.group_select
GROUP BY
	country 
ORDER BY 
	sum_sales DESC;
  
-- Slide 17 | SUM OF SALES PER MARKET
SELECT 
	market,
	SUM(sales) as sum_sales
FROM
	student.group_select
GROUP BY
	market 
ORDER BY 
	sum_sales DESC;

/* OUTPUT: 
APAC	3585744.1290
EU	2938089.0615
US	2297200.8603
LATAM	2164605.16708
EMEA	806161.311
Africa	783773.211
Canada	66928.17
*/

--  Slide 17 | SUM PROFIT PER MARKET
SELECT 
	market,
	SUM(profit) as sum_profit
FROM
	student.group_select
GROUP BY
	market 
ORDER BY 
	sum_profit DESC;

/* OUTPUT: 
APAC	436000.0490
EU	372829.7415
US	286397.0217
LATAM	221643.48708
Africa	88871.631
EMEA	43897.971
Canada	17817.39
*/


-- Slide 18 | TOP 5 COUNTRIES SALES

SELECT 
    country,
	SUM(sales) as sum_sales
FROM
	student.group_select
GROUP BY
	country 
ORDER BY 
	sum_sales DESC
LIMIT 5;

/* OUTPUT: 
United States	2297200.8603
Australia	925235.853
France	858931.0830
China	700562.025
Germany	628840.0305
*/

-- Slide 18 | TOP 5 COUNTRIES PROFIT
SELECT 
    country,
	SUM(profit) as sum_sales
FROM
	student.group_select
GROUP BY
	country 
ORDER BY 
	sum_sales DESC
LIMIT 5;
	
/* OUTPUT: 
United States	286397.0217
China	150683.085
India	129071.835
United Kingdom	111900.150
France	109029.0030
*/

-- Slide 19 | BOTTOM 5 COUNTRIES SALES

SELECT 
    country,
	SUM(sales) as sum_sales
FROM
	student.group_select
GROUP BY
	country 
ORDER BY 
	sum_sales ASC
LIMIT 5;

/* OUTPUT: 
Equatorial Guinea	150.51
Armenia	156.75
Eritrea	187.74
Macedonia	209.64
Tajikistan	242.784
*/

-- Slide 19 |  BOTTOM 5 COUNTRIES LOSS

SELECT 
    country,
	SUM(profit) as sum_sales
FROM
	student.group_select
GROUP BY
	country 
ORDER BY 
	sum_sales ASC
LIMIT 5;

/* OUTPUT:
Turkey	-98447.232
Nigeria	-80750.718
Netherlands	-41070.075
Honduras	-29482.37140
Pakistan	-22446.648
*/

-------------------------------------------------------------   END     ---------------------------------------------------------