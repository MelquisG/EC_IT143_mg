-- With this Script Drops any existing view with the same name and creates 
-- a view encapsulating the AVG and GROUP BY query.

DROP VIEW IF EXISTS dbo.v_car_price_by_transmission_load;
GO

CREATE VIEW dbo.v_car_price_by_transmission_load
AS

SELECT c.transmission
     , AVG(CAST(c.selling_price AS BIGINT)) AS avg_selling_price
  FROM dbo.[CAR DETAILS FROM CAR DEKHO] AS c
 WHERE c.transmission IS NOT NULL
   AND c.selling_price IS NOT NULL
 GROUP BY c.transmission;
GO