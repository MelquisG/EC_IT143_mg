-- This script creates a table and loads the combined counts from the view 

SELECT v.Personality
     , v.person_count
  INTO dbo.t_personality_counts
  FROM dbo.v_personality_counts_load AS v;