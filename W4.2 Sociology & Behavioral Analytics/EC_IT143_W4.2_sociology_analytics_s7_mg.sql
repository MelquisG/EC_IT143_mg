-- We wrap the previos code logic inside a stored procedure to be reused inside the database

CREATE PROCEDURE dbo.usp_personality_counts_load
AS


BEGIN

    -- 1) Refresh data

    TRUNCATE TABLE dbo.t_personality_counts;

    INSERT INTO dbo.t_personality_counts
        SELECT v.Personality
             , v.person_count
          FROM dbo.v_personality_counts_load AS v;

    -- 2) Review results

    SELECT t.*
      FROM dbo.t_personality_counts AS t;

END;
GO