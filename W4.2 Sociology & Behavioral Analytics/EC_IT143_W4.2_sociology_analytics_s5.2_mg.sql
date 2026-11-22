-- We drop the intial table

DROP TABLE IF EXISTS dbo.t_personality_counts;
GO

-- Next, we create a new table indicating data types, NOT NULL constraint, and
-- a clustered primary key.

CREATE TABLE dbo.t_personality_counts
(
    Personality  VARCHAR(25) NOT NULL,
    person_count INT         NOT NULL,
    CONSTRAINT PK_t_personality_counts PRIMARY KEY CLUSTERED (Personality ASC)
);
GO