show databases;
use project_customer_segmentation;
show tables;
select *from customer;
describe customer;
select sum(price) from customer group by gender;
select gender , count(quantity) as total_prodect_sold from customer group by gender order by total_prodect_sold desc;
select gender , sum(quantity) as total_prodect_sold from customer group by gender ;
SELECT 
    category,
    SUM(price) AS total_revenue
FROM customer
GROUP BY category
ORDER BY total_revenue DESC;

SELECT 
    category,
    gender,
    COUNT(*) AS total_orders
FROM customer
GROUP BY category, gender
ORDER BY category, total_orders DESC;

SELECT 
    category,
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS age_group,
    COUNT(*) AS total_orders
FROM customer
GROUP BY category, age_group
ORDER BY category, total_orders DESC;



SELECT 
    category,
    SUM(price) AS total_revenue
FROM customer
GROUP BY category
ORDER BY total_revenue DESC;

select  category, sum(price) total_revenue from customer group by category order by total_revenue desc;

SELECT 
    c.category,
    COUNT(*) AS total_orders,
    ROUND(
        (COUNT(*) * 100.0) / 
        (SELECT COUNT(*) FROM customer),
    2) AS percentage
FROM customer c
GROUP BY c.category
ORDER BY percentage DESC;

SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS age_group,
    COUNT(*) AS total_orders
FROM customer
GROUP BY age_group
ORDER BY total_orders DESC;


SELECT 
    age_group,
    SUM(quantity) AS total_products
FROM (
    SELECT 
        CASE 
            WHEN age BETWEEN 18 AND 25 THEN '18-25'
            WHEN age BETWEEN 26 AND 35 THEN '26-35'
            WHEN age BETWEEN 36 AND 45 THEN '36-45'
            WHEN age BETWEEN 46 AND 55 THEN '46-55'
            ELSE '56+'
        END AS age_group,
        quantity
    FROM customer
) AS age_data
GROUP BY age_group
ORDER BY total_products DESC;


SELECT 
    age_group,
    SUM(price) AS total_revenue
FROM (
    SELECT 
        CASE 
			when age between 7 and 17 then ' 7- 17'
            WHEN age BETWEEN 18 AND 25 THEN '18-25'
            WHEN age BETWEEN 26 AND 35 THEN '26-35'
            WHEN age BETWEEN 36 AND 45 THEN '36-45'
            WHEN age BETWEEN 46 AND 55 THEN '46-55'
            ELSE '56+'
        END AS age_group,
        price
    FROM customer
) AS age_data
GROUP BY age_group
ORDER BY total_revenue DESC;

SELECT 
    category,
    gender,
    SUM(price) AS total_revenue
FROM customer
GROUP BY category, gender
ORDER BY category, total_revenue DESC;

SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS age_group,
    category,
    COUNT(*) AS total_orders
FROM customer
GROUP BY age_group, category
ORDER BY age_group, total_orders DESC;


SELECT 
    shopping_mall,
    category,
    COUNT(*) AS total_orders
FROM customer
GROUP BY shopping_mall, category
ORDER BY shopping_mall, total_orders DESC;

SELECT 
    payment_method,
    category,
    COUNT(*) AS total_orders
FROM customer
GROUP BY payment_method, category
ORDER BY payment_method, total_orders DESC;

SELECT 
    c.category,
    COUNT(*) AS total_orders,
    ROUND(
        (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM customer),
        2
    ) AS percentage_share
FROM customer c
GROUP BY c.category
ORDER BY percentage_share DESC;



SELECT 
    payment_method,
    gender,
    COUNT(*) AS total_transactions
FROM customer
GROUP BY payment_method, gender
ORDER BY payment_method, total_transactions DESC;

SELECT 
    age_group,
    payment_method,
    COUNT(*) AS total_transactions
FROM (
    SELECT 
        CASE 
            WHEN age BETWEEN 18 AND 25 THEN '18-25'
            WHEN age BETWEEN 26 AND 35 THEN '26-35'
            WHEN age BETWEEN 36 AND 45 THEN '36-45'
            WHEN age BETWEEN 46 AND 55 THEN '46-55'
            ELSE '56+'
        END AS age_group,
        payment_method
    FROM customer
) t
GROUP BY age_group, payment_method
ORDER BY age_group, total_transactions DESC;

SELECT 
    payment_method,
    category,
    COUNT(*) AS total_orders
FROM customer
GROUP BY payment_method, category
ORDER BY payment_method, total_orders DESC;

 
SELECT 
    payment_method,
    SUM(price) AS total_revenue
FROM customer
GROUP BY payment_method
ORDER BY total_revenue DESC;

SELECT 
    c.payment_method,
    COUNT(*) AS total_transactions,
    ROUND(
        (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM customer),
        2
    ) AS percentage_share
FROM customer c
GROUP BY c.payment_method
ORDER BY percentage_share DESC;


SELECT 
    payment_method,
    COUNT(*) AS total_transactions,
    ROUND(
        (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM customer),
        2
    ) AS percentage
FROM customer
GROUP BY payment_method
ORDER BY percentage DESC;
