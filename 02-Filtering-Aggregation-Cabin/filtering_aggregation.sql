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
  


