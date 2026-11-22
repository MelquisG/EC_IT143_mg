

-- We clear the columns from the table created in the previous step to insert fresh rows.

TRUNCATE TABLE dbo.t_car_price_by_transmission;

INSERT INTO dbo.t_car_price_by_transmission
    SELECT v.transmission
         , v.avg_selling_price
      FROM dbo.v_car_price_by_transmission_load AS v;

-- Review results

SELECT t.*
  FROM dbo.t_car_price_by_transmission AS t;