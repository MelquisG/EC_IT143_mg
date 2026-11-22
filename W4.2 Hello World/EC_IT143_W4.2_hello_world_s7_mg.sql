CREATE PROCEDURE dbo.usp_hello_world_load
AS
/*****************************************************************************************************************
NAME:    dbo.usp_hello_world_load
PURPOSE: Hello World - Load user stored procedure
NOTE: This wraps the the previous step inside a stored procedure in the database so the reload logic
      can be reused cleanly.
******************************************************************************************************************/
BEGIN

    -- With this query we clear existing rows and insert fresh data to check if the database or server name changed lately --

    TRUNCATE TABLE dbo.t_hello_world;

    INSERT INTO dbo.t_hello_world
        SELECT v.database_name
             , v.server_name
          FROM dbo.v_hello_world_load AS v;

    -- Review results

    SELECT t.*
      FROM dbo.t_hello_world AS t;

END;
GO