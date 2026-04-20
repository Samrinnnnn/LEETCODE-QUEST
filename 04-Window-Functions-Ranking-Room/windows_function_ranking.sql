/*1 Write a solution to find the cancellation rate of requests with unbanned users (both client
and driver must not be banned) each day between "2013-10-01" and "2013-10-03" with at least one trip.
Round cancellation rate to two decimal points. */
SELECT request_at as Day,
round(SUM(CASE WHEN status != 'completed' THEN 1 ELSE 0 END )/ COUNT(*)::numeric,2) AS
"Cancellation Rate"
FROM trips t
JOIN users d ON t.driver_id=d.users_id
JOIN users c ON t.client_id=c.users_id
WHERE d.banned='No'
AND c.banned='No'
AND request_at between '2013-10-01' AND '2013-10-03'
GROUP BY 1;

/*2. Write a solution to find the rank of scores. The ranking should be calculated according
to following rules:
Scores should be ranked from highest to lowest.If there is tie between 2 scores,both should
have the same ranking.After a tie, next ranking number should be next consecutive integer value. In other words,
there should be no holes between ranks.
Return the result table ordered by score in descending order. */
SELECT score,DENSE_RANK() OVER (ORDER BY score DESC) AS rank
FROM Scores
ORDER BY score DESC;

/*3.Find all numbers that appear at least three times consecutively. Return the table in
any order. */
SELECT distinct l1.num as ConsecutiveNums FROM logs l1
JOIN logs l2 ON l1.id=l2.id-1
JOIN logs l3 ON l1.id=l3.id-2
WHERE l1.num=l2.num AND l2.num=l3.num;
