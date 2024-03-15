SELECT
  name
FROM
  people
  JOIN stars ON id = stars.person_id
WHERE
  stars.movie_id = (
    SELECT
      id
    FROM
      movies
    WHERE
      title LIKE "%Toy Story%"
  );