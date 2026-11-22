-- We calculate the average selling price for each transmission type 
-- using a SELECT statement with GROUP BY.

SELECT c.transmission
     , AVG(CAST(c.selling_price AS BIGINT)) AS avg_selling_price
  FROM dbo.[CAR DETAILS FROM CAR DEKHO] AS c
 WHERE c.transmission IS NOT NULL
   AND c.selling_price IS NOT NULL
 GROUP BY c.transmission;