/*1. Write a solution to find the number of times each student
attended each exam.*/
SELECT s.student_id,s.student_name,su.subject_name,COUNT(e.student_id)
AS attended_exams
FROM students s
CROSS JOIN subjects su
LEFT JOIN examinations e ON s.student_id=e.student_id
AND e.subject_name =su.subject_name
GROUP BY s.student_id,s.student_name,su.subject_name
ORDER BY s.student_id,su.subject_name;

/*2. Write a solution to report the customer ids from the Customer table
that bought all the products in the Product table. */
SELECT customer_id
FROM customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key)=(SELECT COUNT (product_key) 
FROM product);

/*3. Write a solution to report the type of each node in the tree.
Return the result table in any order. */
SELECT t.id,
CASE WHEN t.p_id IS NULL THEN 'Root'
WHEN(
     SELECT COUNT(*)
     FROM Tree c
     WHERE c.p_id=t.id
    )=0
     THEN 'Leaf'
ELSE 'Inner'
END AS type
FROM Tree t;

/*4. Write a solution to: 
Find the name of user who has rated the greatest number of movies. In case 
of tie, return the lexicograohically smaller user name.
Find the movie name with the highest average rating in Feb 2020. In case of a tie,
return the lexicographically smaller movie name. */
(SELECT name AS results
 FROM users u
 JOIN movierating m
 ON u.user_id=m.user_id
 GROUP BY name
 ORDER BY COUNT(*) DESC,name
 LIMIT 1)
UNION ALL
(SELECT title AS results
 FROM movies mo
 JOIN movierating m
 ON mo.movie_id=m.movie_id
 WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
 GROUP BY title
 ORDER BY AVG(rating) DESC, title
 LIMIT 1)

