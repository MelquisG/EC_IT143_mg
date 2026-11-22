

DROP VIEW IF EXISTS dbo.v_hello_world_load;
GO

CREATE VIEW dbo.v_hello_world_load
AS
/*****************************************************************************************************************
NAME:    dbo.v_hello_world_load
PURPOSE: Create the Hello World - Load view
NOTE: The query above safely removes any existing version of the view and then saves the SELECT query as 
a reusable database view along with documentation.
******************************************************************************************************************/
SELECT DB_NAME() AS database_name
     , @@SERVERNAME AS server_name;
GO