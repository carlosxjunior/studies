-- Data Science Skills
-- https://datalemur.com/questions/matching-skills

-- MY SOLUTION
SELECT candidate_id 
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT(skill)) = 3
ORDER BY candidate_id;

-- OTHER SOLUTION
SELECT candidate_id FROM candidates WHERE skill = 'Python'
INTERSECT 
SELECT candidate_id FROM candidates WHERE skill = 'Tableau'
INTERSECT  
SELECT candidate_id FROM candidates WHERE skill = 'PostgreSQL'
ORDER BY candidate_id ASC;

-- YET ANOTHER SOLUTION
-- This one is a bit fancier, you can create an aggreation of the skills using array_agg(skill) and then compare it to the array of skills you want, in this case ['Python', 'Tableau', 'PostgreSQL']
SELECT
  candidate_id
FROM
  candidates
GROUP BY
  candidate_id
HAVING
  array_agg(skill)::text[] @> ARRAY['Python', 'Tableau', 'PostgreSQL']
ORDER BY
  candidate_id;