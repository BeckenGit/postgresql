DROP TABLE scores;
CREATE TABLE scores (
  name text,
  course text,
  score int,
  term int
);
COPY scores FROM '/home/becken/postgresql/scores.csv' WITH(FORMAT csv);


WITH part1 AS (
  SELECT name, term, s_en.score AS english, s_sc.score AS science
  FROM  (SELECT * FROM scores WHERE scores.course = 'English') AS s_en JOIN
        (SELECT * FROM scores WHERE scores.course = 'Science') AS s_sc
  USING(name, term)
)
SELECT name, term, part1.english, part1.science, s_ch.score AS chinese
FROM part1 JOIN (SELECT * FROM scores WHERE scores.course = 'Chinese') AS s_ch
USING(name, term);
