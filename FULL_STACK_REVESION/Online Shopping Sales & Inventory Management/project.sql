CREATE DATABASE shopping_management;

USE shopping_management;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    supplier VARCHAR(100),
    created_date DATE
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    age INT,
    registration_date DATE
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10,2),
    payment_mode VARCHAR(30),
    sale_date DATE
);
INSERT INTO products VALUES
(101,'Laptop','Electronics',55000,15,'TechWorld','2026-01-01'),
(102,'Smartphone','Electronics',30000,20,'MobileHub','2026-01-02'),
(103,'Headphones','Electronics',2000,50,'SoundTech','2026-01-03'),
(104,'Smart Watch','Electronics',15000,25,'TechWorld','2026-01-04'),
(105,'Printer','Electronics',8000,12,'PrintZone','2026-01-05'),
(106,'Office Chair','Furniture',7000,18,'FurniMart','2026-01-06'),
(107,'Study Table','Furniture',9000,10,'FurniMart','2026-01-07'),
(108,'Sofa','Furniture',25000,8,'HomeDecor','2026-01-08'),
(109,'Refrigerator','Appliances',40000,6,'CoolHome','2026-01-09'),
(110,'Microwave','Appliances',12000,15,'KitchenPro','2026-01-10'),
(111,'Air Conditioner','Appliances',45000,5,'CoolHome','2026-01-11'),
(112,'Mixer Grinder','Appliances',3500,22,'KitchenPro','2026-01-12'),
(113,'T-Shirt','Clothing',1000,60,'FashionHub','2026-01-13'),
(114,'Jeans','Clothing',2500,40,'FashionHub','2026-01-14'),
(115,'Shoes','Clothing',3000,35,'StyleMart','2026-01-15');
INSERT INTO customers VALUES
(201,'Anjali','anjali@gmail.com','Bangalore',22,'2026-01-01'),
(202,'Rahul','rahul@gmail.com','Mysore',25,'2026-01-02'),
(203,'Amit','amit@gmail.com','Chennai',28,'2026-01-03'),
(204,'Sneha','sneha@gmail.com','Hyderabad',24,'2026-01-04'),
(205,'Kiran','kiran@gmail.com','Mumbai',30,'2026-01-05'),
(206,'Divya','divya@gmail.com','Pune',23,'2026-01-06'),
(207,'Arjun','arjun@gmail.com','Delhi',27,'2026-01-07'),
(208,'Meena','meena@gmail.com','Bangalore',26,'2026-01-08'),
(209,'Ravi','ravi@gmail.com','Chennai',31,'2026-01-09'),
(210,'Manoj','manoj@gmail.com','Mysore',29,'2026-01-10'),
(211,'Akash','akash@gmail.com','Hyderabad',24,'2026-01-11'),
(212,'Pooja','pooja@gmail.com','Pune',21,'2026-01-12'),
(213,'Nithin','nithin@gmail.com','Mumbai',32,'2026-01-13'),
(214,'Bhavana','bhavana@gmail.com','Delhi',27,'2026-01-14'),
(215,'Charan','charan@gmail.com','Bangalore',23,'2026-01-15');

INSERT INTO sales VALUES
(301,201,101,1,55000,'UPI','2026-02-01'),
(302,202,102,1,30000,'Card','2026-02-01'),
(303,203,103,2,4000,'Cash','2026-02-02'),
(304,204,104,1,15000,'UPI','2026-02-02'),
(305,205,105,1,8000,'Card','2026-02-03'),
(306,206,106,2,14000,'Cash','2026-02-03'),
(307,207,107,1,9000,'UPI','2026-02-04'),
(308,208,108,1,25000,'Card','2026-02-04'),
(309,209,109,1,40000,'UPI','2026-02-05'),
(310,210,110,1,12000,'Cash','2026-02-05'),
(311,211,111,1,45000,'Card','2026-02-06'),
(312,212,112,2,7000,'UPI','2026-02-06'),
(313,213,113,3,3000,'Cash','2026-02-07'),
(314,214,114,2,5000,'Card','2026-02-07'),
(315,215,115,1,3000,'UPI','2026-02-08'),
(316,201,102,1,30000,'Card','2026-02-08'),
(317,202,104,1,15000,'UPI','2026-02-09'),
(318,203,106,1,7000,'Cash','2026-02-09'),
(319,204,109,1,40000,'UPI','2026-02-10'),
(320,205,113,2,2000,'Card','2026-02-10'),
(321,206,115,2,6000,'UPI','2026-02-11'),
(322,207,103,3,6000,'Cash','2026-02-11'),
(323,208,110,1,12000,'Card','2026-02-12'),
(324,209,101,1,55000,'UPI','2026-02-12'),
(325,210,112,1,3500,'Cash','2026-02-13');
SHOW DATABASES;

SHOW TABLES;

DESC products;

DESC customers;

DESC sales;

SELECT * FROM products;

SELECT * FROM customers;

SELECT * FROM sales;

SELECT * FROM products;

SELECT product_name, price
FROM products;

SELECT DISTINCT category
FROM products;

SELECT *
FROM products
WHERE price > 5000;

SELECT *
FROM products
WHERE price < 2000;

SELECT *
FROM products
WHERE category = 'Electronics';

SELECT *
FROM products
WHERE stock_quantity < 10;

SELECT *
FROM products
WHERE category = 'Electronics'
AND price > 10000;

SELECT *
FROM products
WHERE category = 'Electronics'
OR category = 'Furniture';

SELECT *
FROM products
WHERE NOT category = 'Clothing';

SELECT *
FROM products
WHERE product_name LIKE 'S%';

SELECT *
FROM products
WHERE product_name LIKE '%e';

SELECT *
FROM products
WHERE product_name LIKE '%Phone%';

SELECT *
FROM customers
WHERE customer_name LIKE 'A%';

SELECT *
FROM customers
WHERE city IN ('Bangalore','Chennai','Mysore');

SELECT *
FROM products
WHERE price BETWEEN 1000 AND 10000;

SELECT *
FROM customers
WHERE age BETWEEN 20 AND 30;

SELECT *
FROM products
WHERE supplier LIKE '%Tech%';

SELECT *
FROM products
ORDER BY price ASC;

SELECT *
FROM products
ORDER BY price DESC;

SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

SELECT *
FROM products
ORDER BY price ASC
LIMIT 5;

SELECT *
FROM customers
ORDER BY customer_name ASC;

SELECT *
FROM sales
ORDER BY sale_date DESC
LIMIT 10;

SELECT *
FROM products
ORDER BY stock_quantity ASC;

UPDATE products
SET price = 60000
WHERE product_id = 101;

UPDATE products
SET price = price * 1.10
WHERE category = 'Electronics';

UPDATE products
SET stock_quantity = 20
WHERE product_id = 105;

UPDATE customers
SET city = 'Hyderabad'
WHERE customer_id = 202;

UPDATE customers
SET email = 'rahul_new@gmail.com'
WHERE customer_id = 202;

UPDATE sales
SET payment_mode = 'UPI'
WHERE sale_id = 302;

DELETE FROM products
WHERE product_id = 115;

DELETE FROM customers
WHERE customer_id = 215;

DELETE FROM sales
WHERE sale_date < '2026-02-01';
ALTER TABLE products
ADD discount_percentage DECIMAL(5,2);

ALTER TABLE customers
ADD mobile_number VARCHAR(15);

ALTER TABLE products
MODIFY supplier VARCHAR(150);

ALTER TABLE products
RENAME COLUMN created_date TO product_added_date;

ALTER TABLE products
ADD product_status VARCHAR(20) DEFAULT 'Available';

ALTER TABLE products
DROP COLUMN discount_percentage;

DESC products;

DESC customers;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_sales
FROM sales;

SELECT SUM(total_amount) AS total_revenue
FROM sales;

SELECT AVG(price) AS average_product_price
FROM products;

SELECT *
FROM products
ORDER BY price DESC
LIMIT 1;

SELECT *
FROM products
ORDER BY price ASC
LIMIT 1;

SELECT MAX(total_amount) AS highest_sales_transaction
FROM sales;

SELECT SUM(quantity) AS total_quantity_sold
FROM sales;

SELECT AVG(total_amount) AS average_sales_value
FROM sales;

SELECT category,
       COUNT(*) AS product_count
FROM products
GROUP BY category;

SELECT category,
       AVG(price) AS average_price
FROM products
GROUP BY category;

SELECT category,
       SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category;

SELECT p.category,
       SUM(s.total_amount) AS total_revenue
FROM products p
INNER JOIN sales s
ON p.product_id = s.product_id
GROUP BY p.category;

SELECT payment_mode,
       COUNT(*) AS transaction_count
FROM sales
GROUP BY payment_mode;

SELECT p.product_name,
       SUM(s.quantity) AS total_quantity_sold
FROM products p
INNER JOIN sales s
ON p.product_id = s.product_id
GROUP BY p.product_name;

SELECT category,
       COUNT(*) AS product_count
FROM products
GROUP BY category
HAVING COUNT(*) > 3;

SELECT p.product_name,
       SUM(s.quantity) AS total_quantity_sold
FROM products p
INNER JOIN sales s
ON p.product_id = s.product_id
GROUP BY p.product_name
HAVING SUM(s.quantity) > 5;

SELECT payment_mode,
       COUNT(*) AS transaction_count
FROM sales
GROUP BY payment_mode
HAVING COUNT(*) > 5;

SELECT c.customer_name, s.*
FROM customers c
INNER JOIN sales s
ON c.customer_id = s.customer_id;

SELECT p.product_name, s.quantity
FROM products p
INNER JOIN sales s
ON p.product_id = s.product_id;

SELECT c.customer_name,
       p.product_name,
       s.total_amount
FROM customers c
INNER JOIN sales s
ON c.customer_id = s.customer_id
INNER JOIN products p
ON p.product_id = s.product_id;

SELECT c.customer_name,
       p.product_name
FROM customers c
INNER JOIN sales s
ON c.customer_id = s.customer_id
INNER JOIN products p
ON p.product_id = s.product_id;

SELECT c.customer_name,
       p.product_name
FROM customers c
LEFT JOIN sales s
ON c.customer_id = s.customer_id
LEFT JOIN products p
ON s.product_id = p.product_id;

SELECT p.product_name,
       s.quantity
FROM products p
LEFT JOIN sales s
ON p.product_id = s.product_id;

SELECT s.*,
       c.customer_name,
       c.city
FROM customers c
RIGHT JOIN sales s
ON c.customer_id = s.customer_id;

SELECT c.customer_name,
       p.product_name,
       p.category,
       s.quantity,
       s.payment_mode,
       s.total_amount
FROM sales s
INNER JOIN customers c
ON c.customer_id = s.customer_id
INNER JOIN products p
ON p.product_id = s.product_id;

SELECT *
FROM products
WHERE stock_quantity > 0;

SELECT *
FROM products
WHERE stock_quantity < 10;

SELECT category,
       COUNT(*) AS product_count
FROM products
GROUP BY category;

SELECT MAX(price) AS highest_price,
       MIN(price) AS lowest_price
FROM products;

SELECT *
FROM customers;

SELECT *
FROM sales;

SELECT SUM(total_amount) AS total_revenue
FROM sales;

SELECT payment_mode,
       SUM(total_amount) AS payment_revenue
FROM sales
GROUP BY payment_mode;

SELECT p.product_name,
       SUM(s.quantity) AS total_quantity_sold
FROM products p
INNER JOIN sales s
ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC;

SELECT c.customer_name,
       SUM(s.total_amount) AS purchase_total
FROM customers c
INNER JOIN sales s
ON c.customer_id = s.customer_id
GROUP BY c.customer_name;