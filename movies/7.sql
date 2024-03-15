SELECT
  rating,
  title
FROM
  movies
  JOIN ratings ON id = ratings.movie_id
WHERE
  YEAR = 2010
ORDER BY
  rating DESC,
  title;