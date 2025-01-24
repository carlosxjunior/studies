-- Page With No Likes
-- https://datalemur.com/questions/sql-page-with-no-likes

-- MY SOLUTION
-- Probably a bit too complicated, there is no real need for using a join, a group by and an aggregation function, but I wanted the count of likes first
SELECT 
  pages.page_id
FROM pages
LEFT JOIN page_likes
ON pages.page_id = page_likes.page_id
GROUP BY pages.page_id, pages.page_name
HAVING COUNT(page_likes.page_id) = 0
ORDER BY pages.page_id ASC

-- OTHER SOLUTION
-- Very simple one using EXCEPT
SELECT page_id FROM pages
EXCEPT 
SELECT page_id FROM page_likes;

-- YET ANOTHER SOLUTION
SELECT page_id
FROM pages
WHERE page_id NOT IN (
  SELECT page_id
  FROM page_likes
  WHERE page_id IS NOT NULL
);