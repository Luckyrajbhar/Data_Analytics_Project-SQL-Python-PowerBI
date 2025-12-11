use customer_behavior;
SELECT * FROM customer_behavior_data;
DESCRIBE customer_behavior_data;


select gender, sum(purchase_amount)as revenev from customer_behavior_data
group by gender;

-- Q2. Which customers used a discount but still spent more than the average purchase amount?

select customer_id, purchase_amount from customer_behavior_data
where discount_applied= 'yes' and purchase_amount> (select avg(purchase_amount) from customer_behavior_data);

-- Q3. Which are the top 5 products with the highest average review rating?




SELECT item_purchased, AVG(review_rating) AS avg_rating
FROM customer_behavior_data
GROUP BY item_purchased
ORDER BY avg_rating DESC
LIMIT 5;

-- -Q4. Compare the average Purchase Amounts between Standard and Express Shipping.

SELECT shipping_type, COUNT(*) AS total_count
FROM customer_behavior_data
WHERE shipping_type IN ('Standard', 'Express')
GROUP BY shipping_type
ORDER BY total_count DESC;

-- Q5. Do subscribed customers spend more? Compare average spend and total revenue between subscribers and non-subscribers.

SELECT 
    subscription_status,
    AVG(purchase_amount) AS avg_spend,
    SUM(purchase_amount) AS total_revenue,
    COUNT(*) AS total_orders
FROM customer_behavior_data
GROUP BY subscription_status
ORDER BY avg_spend DESC;

-- Q6. Which 5 products have the highest percentage of purchases with discounts applied?

SELECT item_purchased,
       ROUND(100.0 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS discount_rate
FROM customer_behavior_data
GROUP BY item_purchased
ORDER BY discount_rate DESC 
LIMIT 5;

-- Q7. Segment customers into New, Returning, and Loyal based on their total 
-- number of previous purchases, and show the count of each segment. 
-- with customer_type as 

SELECT customer_segment, COUNT(*) AS Number_of_Customers
FROM (
    SELECT customer_id,
           previous_purchases,
           CASE 
               WHEN previous_purchases = 1 THEN 'New'
               WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
               ELSE 'Loyal'
           END AS customer_segment
    FROM customer_behavior_data
) AS customer_type
GROUP BY customer_segment;

-- Q9. Are customers who are repeat buyers (more than 5 previous purchases) also likely to subscribe?
SELECT subscription_status,
       COUNT(customer_id) AS repeat_buyers
FROM customer_behavior_data
WHERE previous_purchases > 5
GROUP BY subscription_status;

-- Q10. What is the revenue contribution of each age group? 
SELECT 
    age_group,
    SUM(purchase_amount) AS total_revenue
FROM customer_behavior_data
GROUP BY age_group
ORDER BY total_revenue desc;
















 




