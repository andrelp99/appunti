USE BikeStores;
GO

-- FROM --> WHERE --> GROUP BY --> SELECT --> ORDER BY --> HAVING.

/* Vedere le tabelle come sono */

SELECT TOP 20 * FROM sales.customers
SELECT TOP 20 * FROM sales.order_items
SELECT TOP 20 * FROM sales.orders
SELECT TOP 20 * FROM sales.staffs
SELECT TOP 20 * FROM sales.stores

SELECT TOP 20 * FROM hr.candidates
SELECT TOP 20 * FROM hr.employees

SELECT TOP 20 * FROM production.brands
SELECT TOP 20 * FROM production.categories
SELECT TOP 20 * FROM production.products
SELECT TOP 20 * FROM production.stocks



/* Prove WHERE */

SELECT * FROM sales.customers WHERE phone IS NULL;
SELECT * FROM sales.customers WHERE phone IS NOT NULL;

SELECT * FROM sales.customers WHERE phone LIKE '%38%';   -- per 38 in qualsiasi punto della stringa
SELECT * FROM sales.customers WHERE phone LIKE '%38';    -- per 38 alla fine della stringa
SELECT * FROM sales.customers WHERE phone LIKE '(3%';    -- per (3 all'inizio della stringa
SELECT * FROM sales.customers WHERE phone LIKE '(4%%)%'  -- per (4__) in posizioni 1/2 e 5
SELECT * FROM sales.customers WHERE phone LIKE '([2-3]%' -- per 2 o 3 nella 2° posizione

SELECT * FROM sales.customers WHERE zip_code BETWEEN '10000' AND '11000' -- per zipcode in range
SELECT * FROM sales.customers WHERE first_name = 'Neil' -- per nome uguale a qualcosa


/* Prove COUNT() */

SELECT city, COUNT(*) FROM sales.customers GROUP BY city -- contare quante volte ogni città compare
SELECT city, COUNT(*) FROM sales.customers GROUP BY city ORDER BY COUNT(*) -- in ordine per COUNT
SELECT city, COUNT(*) FROM sales.customers GROUP BY city ORDER BY COUNT(*) DESC -- in ordine per COUNT disc
SELECT city, COUNT(*) FROM sales.customers GROUP BY city HAVING COUNT(*) > 10 ORDER BY COUNT(*) DESC -- con condizione

SELECT TOP 10 city, COUNT(*) FROM sales.customers GROUP BY city ORDER BY COUNT(*) DESC  -- solo le prime 10
SELECT TOP 10 PERCENT city, COUNT(*) FROM sales.customers GROUP BY city ORDER BY COUNT(*) DESC  -- solo il primo 10%	


/* Altre prove */

SELECT DISTINCT city FROM sales.customers -- per le diverse città

SELECT * FROM sales.customers ORDER BY first_name OFFSET 100 -- per saltare le prime 100 righe
SELECT * FROM sales.customers ORDER BY first_name OFFSET 100 ROWS FETCH FIRST 10 ROWS ONLY -- per 10 righe dopo 100 saltate


/* Prove Join */

SELECT p.product_name, c.category_name, p.list_price
FROM production.products p INNER JOIN production.categories c ON c.category_id = p.category_id
ORDER BY p.list_price DESC, p.product_name DESC;

-- numero di ordini per cliente
SELECT sc.first_name + ' ' + sc.last_name AS customer_name, COUNT(*) AS n_orders
FROM sales.orders as so INNER JOIN sales.customers as sc ON so.customer_id = sc.customer_id
GROUP BY sc.customer_id, sc.first_name + ' ' + sc.last_name ORDER BY COUNT(*) DESC


-- numero di oggetti ordinati per cliente
SELECT sc.first_name + ' ' + sc.last_name AS customer_name, COUNT(*) AS n_objects_ordered
FROM sales.orders as so INNER JOIN sales.customers as sc ON so.customer_id = sc.customer_id 
INNER JOIN sales.order_items as soi ON so.order_id = soi.order_id
GROUP BY sc.customer_id, sc.first_name + ' ' + sc.last_name ORDER BY COUNT(*) DESC


-- spesa totale per cliente
SELECT sc.first_name + ' ' + sc.last_name AS customer_name, COUNT(*) AS n_objects_ordered, SUM(soi.list_price*soi.quantity*soi.discount) AS total
FROM sales.orders as so INNER JOIN sales.customers as sc ON so.customer_id = sc.customer_id 
INNER JOIN sales.order_items as soi ON so.order_id = soi.order_id
GROUP BY sc.customer_id, sc.first_name + ' ' + sc.last_name ORDER BY SUM(soi.list_price*soi.quantity*soi.discount) DESC, COUNT(*) DESC

/* Prove viste */



CREATE VIEW sales.customers_sales AS 
SELECT sc.first_name + ' ' + sc.last_name AS customer_name, COUNT(*) AS n_objects_ordered, SUM(soi.list_price*soi.quantity*soi.discount) AS total
FROM sales.orders as so INNER JOIN sales.customers as sc ON so.customer_id = sc.customer_id 
INNER JOIN sales.order_items as soi ON so.order_id = soi.order_id
GROUP BY sc.customer_id, sc.first_name + ' ' + sc.last_name

-- usare la vista in una query (nella vista no order by, non consentiti: se si vuole si usano quando si richiama)
SELECT * FROM sales.customers_sales ORDER BY total DESC, n_objects_ordered DESC


SELECT OBJECT_SCHEMA_NAME(v.object_id) schema_name, v.name
FROM sys.views as v;
