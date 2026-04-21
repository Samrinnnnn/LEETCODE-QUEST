/* 1.Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:
have same tiv_2015 value as one or more other policyholders, and are not 
located in same city as any other policyholder(i.e the(lat,lon) attribute 
pairs must be unique).
Round tiv_2016 to two decimal places. */
WITH CheckedRows AS(
  SELECT tiv_2016,
  COUNT(*) OVER (PARTITION BY tiv_2015)
  AS tiv_2015_count,
  COUNT(*) OVER (PARTITION BY lat,lon)
  AS loc_count
  FROM
  Insurance
  )
SELECT ROUND(SUM(tiv_2016)::numeric,2)
AS tiv_2016
FROM 
CheckedRows
WHERE
tiv_2015_count>1
AND loc_count=1;

