--Calculate the average watch duration for each movie title across all users
SELECT
      movie_id,
      title,
      avg(duration) as AVG_duration
  FROM `TMM-Demo`.`demo-kafka-cluster-AWS`.`dbovodclickstream_uk_movies_03`
 Group by movie_id, title;

--Analyze daily engagement patterns for each movie title. 
--Calculate daily view counts and total watch time for each title to track how user interest fluctuates day by day.

/*
Here’s a SQL query to help you analyze daily engagement patterns for each movie title from the Netflix UK clickstream dataset:

Assuming the dataset has a table (say netflix_clickstream) with columns similar to:

title (movie/show title)
date (date of the view)
duration or watch_time (watch time in seconds or minutes — depending on the schema)
user_id or session identifier
Here’s a SQL query that gives you daily view counts and total watch time per movie title:
*/

 SELECT
    title,
    datetime AS view_date,
    COUNT(*) AS daily_view_count,
    SUM(duration) AS total_watch_time
   FROM `TMM-Demo`.`demo-kafka-cluster-AWS`.`dbovodclickstream_uk_movies_03`
GROUP BY title,  datetime;


/*
Notes:
duration: Replace with the actual column name that indicates the time watched.
date: Replace with the actual timestamp column name (e.g., watch_time_start, session_start, etc.).
COUNT(*): Counts the number of views per day per title.
SUM(duration): Aggregates total watch time to track engagement.
If you'd like to also track unique viewers per day:
*/

SELECT
    title,
    datetime AS view_date,
    COUNT(*) AS daily_view_count,
    COUNT(DISTINCT user_id) AS unique_viewers,
    SUM(duration) AS total_watch_time
  FROM `TMM-Demo`.`demo-kafka-cluster-AWS`.`dbovodclickstream_uk_movies_03`
GROUP BY title, datetime;
