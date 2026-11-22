
-- Q: What is the current database and server name?

-- A: Let's use built-in system functions to ask SQL Server...

-- This code runs a SELECT query that returns the current database name and SQL server instance name --
SELECT DB_NAME() AS database_name
     , @@SERVERNAME AS server_name;