-- This query turns the view into a table

SELECT v.transmission
     , v.avg_selling_price
  INTO dbo.t_car_price_by_transmission
  FROM dbo.v_car_price_by_transmission_load AS v;