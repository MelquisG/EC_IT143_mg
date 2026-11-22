-- With this query we create a table and populate it with the views returned by the view --
SELECT v.database_name
     , v.server_name
  INTO dbo.t_hello_world
  FROM dbo.v_hello_world_load AS v;