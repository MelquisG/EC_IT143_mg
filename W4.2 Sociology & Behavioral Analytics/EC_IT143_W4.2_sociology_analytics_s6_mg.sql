-- This script cleares the existing rows and inserts fresh counts

TRUNCATE TABLE dbo.t_personality_counts;

INSERT INTO dbo.t_personality_counts
    SELECT v.Personality
         , v.person_count
      FROM dbo.v_personality_counts_load AS v;

-- At last, we select all rows to verify the results

SELECT t.*
  FROM dbo.t_personality_counts AS t;