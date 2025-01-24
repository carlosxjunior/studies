-- Laptop vs. Mobile Viewership
-- https://datalemur.com/questions/laptop-mobile-viewership

-- MY SOLUTION
WITH device_views AS (
  SELECT 
    device_type, 
    COUNT(user_id) AS viewers
  FROM viewership
  GROUP BY device_type
)
SELECT
  SUM(CASE WHEN device_type = 'laptop' THEN viewers END) AS laptop_views,
  SUM(CASE WHEN device_type IN ('phone', 'tablet') THEN viewers END) AS mobile_views
FROM device_views

  
-- OTHER SOLUTION
-- Simpler than mine, using the COUNT() aggregation function with FILTER clause
SELECT 
  COUNT(*) FILTER (WHERE device_type = 'laptop') AS laptop_views,
  COUNT(*) FILTER (WHERE device_type IN ('tablet', 'phone'))  AS mobile_views 
FROM viewership;

-- YET ANOTHER SOLUTION
-- Also simpler than mine but similar using SUM() and CASE statement
-- Here, if the device_type is the one being filtered, 1 is added to the count
SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views, 
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views 
FROM viewership;


-- YET ANOTHER SOLUTION
-- I found this one interesting, but probably not very performatic as the table is selected twice
SELECT 
COUNT(DISTINCT a.user_id) as laptop_views,
COUNT(DISTINCT b.user_id) as mobile_views
FROM viewership as a, viewership as b
where a.device_type IN ('laptop')
and b.device_type IN ('tablet','phone');