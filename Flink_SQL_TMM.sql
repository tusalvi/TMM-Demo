--Calculate the average watch duration for each movie title across all users
SELECT
      movie_id,
      title,
      avg(duration) as AVG_duration
  FROM `TMM-Demo`.`demo-kafka-cluster-AWS`.`dbovodclickstream_uk_movies_03`
 Group by movie_id, title;

--Analyze daily engagement patterns for each movie title. 
--Calculate daily view counts and total watch time for each title to track how user interest fluctuates day by day.

