SELECT
  title
FROM
  movies
  JOIN stars ON movies.id = stars.movie_id
WHERE
  stars.person_id = (
    SELECT
      id
    FROM
      people
    WHERE
      name = "Bradley Cooper"
  )
  AND title IN (
    SELECT
      title
    FROM
      movies
      JOIN stars ON movies.id = stars.movie_id
    WHERE
      stars.person_id = (
        SELECT
          people.id
        FROM
          people
        WHERE
          name = "Jennifer Lawrence"
      )
  );