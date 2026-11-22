-- This script creates a stored procedure in which we wrap the previous script 
-- to be used inside the database.

CREATE PROCEDURE dbo.usp_car_price_by_transmission_load
AS


BEGIN

    -- 1) Reload data

    TRUNCATE TABLE dbo.t_car_price_by_transmission;

    INSERT INTO dbo.t_car_price_by_transmission
        SELECT v.transmission
             , v.avg_selling_price
          FROM dbo.v_car_price_by_transmission_load AS v;

    -- 2) Review results

    SELECT t.*
      FROM dbo.t_car_price_by_transmission AS t;

END;
GO