/*1. Write a solution to report the first name, last name, city, and state of each person in the Person table.
If the address of a personId is not present in the Address table, report null instead. */
SELECT p.firstname,p.lastname,a.city,a.state
FROM person p
LEFT JOIN address a ON p.personId=a.personId;

/* 2. Write a solution to find the employees who earn more than their managers.Return table in any 
order. */
SELECT e.name AS Employee FROM Employee e
INNER JOIN Employee m ON e.ManagerId=m.Id
WHERE e.salary > m.salary;

/* 3. Write a solution to report the movies with an odd_numbered ID and a description
that is not "boring". Return result table ordered by rating in descending order. */
SELECT id,movie,description,rating
FROM cinema
WHERE id % 2 !=0 AND description!= 'boring'
ORDER BY rating DESC;

/* 4. Find names of customer that are either:
1.referred by any customer with id !=2
2.not referred by any customer.
Return the result in any order. */
SELECT name
FROM Customer
WHERE COALESCE(referee_id,0) !=2;



