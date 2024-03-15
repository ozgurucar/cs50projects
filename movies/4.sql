SELECT
  COUNT(*) AS n
FROM
  movies
  JOIN ratings ON id = ratings.movie_id
WHERE
  ratings.rating = 10;