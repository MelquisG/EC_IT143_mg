-- First, we drop any existing view with the name we are going to use, just in case

DROP VIEW IF EXISTS dbo.v_personality_counts_load;
GO

-- Second, we create a view encapsulating the combined UNION ALL and GROUP BY query that we 
-- created in the last step

CREATE VIEW dbo.v_personality_counts_load
AS


WITH combined_personality AS
(
    SELECT d.Personality
      FROM dbo.personality_datasert AS d

    UNION ALL

    SELECT t.Personality
      FROM dbo.personality_dataset AS t
)
SELECT c.Personality
     , COUNT(*) AS person_count
  FROM combined_personality AS c
 GROUP BY c.Personality;
GO