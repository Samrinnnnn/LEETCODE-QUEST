/*1.Write a solution to find the customer_number for the 
customer_number for the customer who has placed the largest
number of orders. */
SELECT customer_number
FROM orders
GROUP BY customer_number
ORDER BY COUNT(customer_number) DESC LIMIT 1;

/*2. Write a solution to find all the classes that have at least
five students. */
SELECT class
FROM courses
GROUP BY class
HAVING COUNT(student)>=5;

/*3. Write an SQL query to find for each month and country,the number
of transactions and their total amount,the number of approved transactions and their 
total amount. */
SELECT TO_CHAR(trans_date,'YYYY-MM') AS month,country, COUNT(id)
::NUMERIC AS trans_count,COUNT(state) FILTER (WHERE state='approved')
::NUMERIC AS approved_count, SUM(amount) AS trans_total_amount,
COALESCE(SUM(amount) FILTER (WHERE state='approved'),0) AS 
  approved_total_amount
FROM transactions
GROUP BY month,country;
  
/*4. Write a solution to find the daily active user count for a
period of 30 days ending 2019-07-27 inclusively. A user was active
on someday if they made at least one activity on that day. */
SELECT activity_date AS day,COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date> '2019-07-27'::date-INTERVAL '30 days'
AND activity_date<='2019-07-27'
GROUP BY 1;



