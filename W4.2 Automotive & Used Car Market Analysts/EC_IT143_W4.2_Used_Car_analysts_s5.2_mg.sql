-- We drop the existing table to improve the code and table architecture

DROP TABLE IF EXISTS dbo.t_car_price_by_transmission;
GO

-- We create the table again but indicating data types, NOT NULL constraints and a clustered primary key

CREATE TABLE dbo.t_car_price_by_transmission
(
    transmission      VARCHAR(25) NOT NULL,
    avg_selling_price BIGINT      NOT NULL,
    CONSTRAINT PK_t_car_price_by_transmission PRIMARY KEY CLUSTERED (transmission ASC)
);
GO