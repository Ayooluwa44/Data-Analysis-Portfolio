--(1) All Pizza that has RED ONION in its ingredient
SELECT pizza_ingredients
  FROM pizza_sales$
  WHERE pizza_ingredients LIKE '%Red Onions%'
  ORDER BY pizza_ingredients

--(2) All PIZZA NAME ID that start with BBQ
SELECT pizza_name_id
  FROM pizza_sales$
  WHERE pizza_name_id LIKE 'bbq%'
  ORDER BY pizza_name_id

--(3) All MEDIUM, LARGE and SMALL sized pizza
SELECT order_id, pizza_id, pizza_name, pizza_size, unit_price, total_price
  FROM pizza_sales$
  WHERE pizza_size in ('M', 'L', 'S')
  ORDER BY unit_price DESC

--(4) All LARGE above 25 dollars
SELECT pizza_id, pizza_name, pizza_category, order_date, pizza_size, total_price
  FROM pizza_sales$
  WHERE pizza_size in ('L') and total_price >= 25
  ORDER BY unit_price DESC

--(5) All orders made in after 1st October 2015
select CONVERT(date, order_date, 102) as Order_date
  FROM pizza_sales$
  WHERE order_date > 2015-09-30

--(6) All made in FIRST QUATER of 2015
SELECT CONVERT(date, order_date, 102) as Order_date, DATEPART(quarter, order_date) as First_Quater
 FROM pizza_sales$
 WHERE DATEPART(quarter, order_date) in ('1')

--(7) SUPREME orders made in JULY 2015 
select DATENAME(MONTH, order_date) as Month, DATENAME(YEAR, order_date) as Year, pizza_category
  FROM pizza_sales$
  WHERE DATENAME(MONTH, order_date) in ('July') and pizza_category in ('Supreme')

--(8) All LARGE sized CHICKEN orders BETWEEN 15 and 50
SELECT order_id, pizza_name, order_date, pizza_category, pizza_size, quantity, total_price
  FROM pizza_sales$
  WHERE pizza_size in ('L') and total_price between 15 and 50
  ORDER BY total_price DESC

--(9) All orders with ORDER_ID 100, 115, 132, 295, 444, 599, and 900
SELECT order_id
  FROM pizza_sales$
  WHERE order_id in ('100', '115', '132', '295', '444', '599', '900')

--(10) All orders made in MAY 2015, CHICKEN category
  SELECT datename(MONTH, order_date) as Month, datename(year, order_date) as Year, pizza_category, order_id
  FROM pizza_sales$
  WHERE pizza_category in ('Chicken') and datename(MONTH, order_date) in ('May')

  SELECT order_date, pizza_category, order_id
  FROM pizza_sales$
  WHERE pizza_category in ('Chicken') and order_date in ('%2015-03%')

select CONVERT(date, order_date, 102) as Order_date
  FROM pizza_sales$
  

