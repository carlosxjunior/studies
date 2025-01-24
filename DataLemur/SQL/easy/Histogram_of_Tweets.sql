-- Histogram of Tweets
-- https://datalemur.com/questions/sql-histogram-tweets

-- MY SOLUTION
WITH messages_by_user AS (
  SELECT 
    user_id,
    COUNT(tweet_id) AS n_of_messages -- could use the msg column too here, but it is likely more performatic using an integer column
  FROM tweets
  WHERE tweet_date BETWEEN '2022-01-01' AND '2023-01-01'
  GROUP BY user_id
)
SELECT
  n_of_messages AS tweet_bucket,
  COUNT(n_of_messages) AS users_num
FROM messages_by_user
GROUP BY n_of_messages;