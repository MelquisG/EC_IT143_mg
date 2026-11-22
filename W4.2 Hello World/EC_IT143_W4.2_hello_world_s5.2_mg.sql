-- We drop the previous quick table created in te previous step --

DROP TABLE IF EXISTS dbo.t_hello_world;
GO
-- This query creates the same table but with explicit data types, NOT NULL rules, a DEFAULT constraint,
-- and a clustered primary key on database_name
CREATE TABLE dbo.t_hello_world
(
    database_name VARCHAR(50)  NOT NULL,
    server_name   VARCHAR(100) NOT NULL DEFAULT @@SERVERNAME,
    CONSTRAINT PK_t_hello_world PRIMARY KEY CLUSTERED (database_name ASC)
);
GO