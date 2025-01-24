-- Unfinished parts
-- https://datalemur.com/questions/tesla-unfinished-parts

-- MY SOLUTION
-- This is a very very simple problem
SELECT
  part,
  assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;