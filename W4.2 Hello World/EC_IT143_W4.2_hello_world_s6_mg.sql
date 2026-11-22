-- Q: What is the current database and server name?

-- A: Let's use built-in system functions to ask SQL Server...

-- With this query we clear existing rows and insert fresh data to check if the database or server name changed lately --

TRUNCATE TABLE dbo.t_hello_world;

INSERT INTO dbo.t_hello_world
    SELECT v.database_name
         , v.server_name
      FROM dbo.v_hello_world_load AS v;

-- Review results

SELECT t.*
  FROM dbo.t_hello_world AS t;