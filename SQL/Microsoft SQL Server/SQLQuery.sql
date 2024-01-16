USE BikeStores;
GO





SELECT * FROM sales.customers;

SELECT first_name FROM sales.customers;

SELECT first_name, last_name FROM sales.customers;

/* WHERE */

SELECT * FROM sales.customers WHERE state = 'NY';

SELECT * FROM sales.customers WHERE state = 'NY' AND city = 'New York';

SELECT * FROM sales.customers WHERE zip_code BETWEEN 10000 AND 11000;

SELECT * FROM sales.customers WHERE zip_code IN (10950,10562);

SELECT * FROM sales.customers WHERE email LIKE '%yahoo.com%';

SELECT * FROM sales.customers WHERE last_name LIKE '%l';

SELECT * FROM sales.customers WHERE email LIKE 'de%';

SELECT * FROM sales.customers WHERE last_name LIKE 'd%l';

SELECT * FROM sales.customers WHERE last_name LIKE '_a%';

SELECT * FROM sales.customers WHERE last_name LIKE '[BC][ae]%';

SELECT * FROM sales.customers WHERE last_name LIKE '[B-F]%';

SELECT * FROM sales.customers WHERE phone IS NULL;

SELECT * FROM sales.customers WHERE email LIKE '%30!%%' ESCAPE '!';

/* ORDER BY */

SELECT * FROM sales.customers WHERE state = 'NY' ORDER BY first_name;

SELECT * FROM sales.customers WHERE state = 'NY' ORDER BY first_name ASC;

SELECT * FROM sales.customers WHERE state = 'NY' ORDER BY first_name DESC;

SELECT * FROM sales.customers WHERE state = 'NY' ORDER BY first_name ASC, last_name ASC;

SELECT * FROM sales.customers WHERE state = 'NY' ORDER BY len(first_name) ASC;

/* COUNT nel SELECT */

SELECT city, COUNT(*) FROM sales.customers WHERE state = 'NY' GROUP BY city ORDER BY city;

SELECT city, COUNT(*) FROM sales.customers WHERE state = 'NY' GROUP BY city HAVING COUNT(*) > 10 ORDER BY city;

/* OFFSET e FETCH */

SELECT * FROM sales.customers WHERE state = 'NY' ORDER BY first_name OFFSET 10 ROWS ;

SELECT * FROM sales.customers WHERE state = 'NY' ORDER BY first_name OFFSET 10 ROWS FETCH FIRST 10 ROWS ONLY;

/* SELECT TOP */

SELECT TOP 10 product_name, list_price FROM production.products ORDER BY list_price DESC;

SELECT TOP 5 WITH TIES product_name, list_price FROM production.products ORDER BY list_price DESC;

SELECT TOP 5 PERCENT product_name, list_price FROM production.products ORDER BY list_price DESC;

/* SELECT DISTINCT */

SELECT DISTINCT city FROM sales.customers WHERE state = 'NY';

SELECT DISTINCT first_name, city FROM sales.customers WHERE state = 'NY';

/* ALIAS */

SELECT first_name + ' ' +  last_name FROM sales.customers;

SELECT first_name + ' ' +  last_name AS 'full_name' FROM sales.customers;

SELECT first_name, last_name FROM sales.customers AS sc;

/* JOIN */

SELECT product_name, category_name, list_price
FROM production.products p INNER JOIN production.categories c ON c.category_id = p.category_id
ORDER BY product_name DESC;


SELECT product_name, order_id
FROM production.products p LEFT JOIN sales.order_items o ON o.product_id = p.product_id
WHERE order_id IS NULL

SELECT product_name, order_id
FROM sales.order_items o RIGHT JOIN production.products p ON o.product_id = p.product_id
ORDER BY order_id;

SELECT m.name member, p.title project
FROM pm.members m FULL OUTER JOIN pm.projects p ON p.id = m.project_id;

SELECT product_id, product_name, store_id 
FROM production.products CROSS JOIN sales.stores
ORDER BY product_name, store_id;

SELECT e.first_name + ' ' + e.last_name employee, m.first_name + ' ' + m.last_name manager
FROM sales.staffs e INNER JOIN sales.staffs m ON m.staff_id = e.manager_id
ORDER BY manager;

SELECT c1.city, c1.first_name + ' ' + c1.last_name customer_1, c2.first_name + ' ' + c2.last_name customer_2
FROM sales.customers c1 INNER JOIN sales.customers c2 ON c1.customer_id > c2.customer_id AND c1.city = c2.city
ORDER BY city, customer_1, customer_2;

/* SUBQUERIES */

SELECT order_id, order_date, (SELECT MAX (list_price) FROM sales.order_items i WHERE i.order_id = o.order_id) AS max_list_price
FROM sales.orders o
order by order_date desc;

SELECT product_id, product_name
FROM production.products
WHERE category_id IN (SELECT category_id 
					  FROM production.categories 
					  WHERE category_name = 'Mountain Bikes' OR category_name = 'Road Bikes');

SELECT product_name, list_price
FROM production.products
WHERE list_price >= ANY (SELECT AVG (list_price)
						 FROM production.products
						 GROUP BY brand_id);

SELECT product_name, list_price
FROM production.products
WHERE list_price >= ALL (SELECT AVG (list_price)
        FROM production.products
        GROUP BY brand_id);

SELECT customer_id, first_name, last_name, city
FROM sales.customers c
WHERE EXISTS (SELECT customer_id
        FROM sales.orders o
        WHERE o.customer_id = c.customer_id AND YEAR (order_date) = 2017)
ORDER BY first_name, last_name;

SELECT AVG(order_count) average_order_count_by_staff
FROM (SELECT staff_id, COUNT(order_id) order_count
      FROM sales.orders
      GROUP BY staff_id) t;


/* INSIEMISTICA */

SELECT first_name, last_name
FROM sales.staffs
UNION
SELECT first_name, last_name
FROM sales.customers;

SELECT first_name, last_name
FROM sales.staffs
UNION ALL
SELECT first_name, last_name
FROM sales.customers;


SELECT first_name, last_name
FROM sales.staffs
INTERSECT
SELECT first_name, last_name
FROM sales.customers;

SELECT first_name, last_name
FROM sales.staffs
EXCEPT
SELECT first_name, last_name
FROM sales.customers;




SELECT first_name, last_name, state, CASE
  WHEN state = 'NY' THEN 'New York'
  ELSE 'Not New York'
  END AS NY
FROM sales.customers;

/* Procedures */

CREATE PROCEDURE nome_procedura
AS 
BEGIN
	SELECT * FROM sales.customers;
END;

/* Variables */


DECLARE @model_year INT;

SET @model_year = 2018;

SET @product_count = (
    SELECT COUNT(*) 
    FROM production.products);


/* Cicli */


IF @sales > 10000000
BEGIN
PRINT 'Great! The sales amount in 2018 is greater than 10,000,000';
END
ELSE
BEGIN
PRINT 'Sales amount in 2017 did not reach 10,000,000';
END


DECLARE @counter INT = 1;
WHILE @counter <= 5
BEGIN
    PRINT @counter;
    SET @counter = @counter + 1;
END
