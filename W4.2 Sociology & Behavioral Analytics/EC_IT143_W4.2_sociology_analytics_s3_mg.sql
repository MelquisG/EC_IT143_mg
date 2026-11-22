-- In this script we are using UNION ALL to stack rows from both tables, then groups by 
-- by personality and runs COUNT(*) to return a combined total.

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