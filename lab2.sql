CREATE DATABASE laboratory2;

CREATE TABLE countries (
  country_id SERIAL PRIMARY KEY,
  country_name VARCHAR(50),
  region_id INT,
  population INT
);
INSERT INTO countries VALUES (DEFAULT, 'Korea', 111, 50000000);

INSERT INTO countries VALUES (DEFAULT, 'KZ', 123, 17000000);

ALTER TABLE countries
    ALTER column region_id SET DEFAULT NULL;

INSERT INTO countries VALUES (DEFAULT, 'Russia', DEFAULT, 10000 );
INSERT INTO countries VALUES (DEFAULT, 'France', DEFAULT, 40000 );
INSERT INTO countries VALUES (DEFAULT, 'China', DEFAULT, 60000 );

ALTER TABLE countries
    ALTER COLUMN country_name SET DEFAULT  'Kazakhstan';

INSERT INTO countries VALUES (DEFAULT, DEFAULT , DEFAULT, 45000 );

CREATE TABLE countries_new (
  LIKE countries
);

INSERT INTO countries_new
SELECT * FROM countries;

SELECT * FROM countries_new;

UPDATE countries_new SET region_id=1 WHERE region_id ISNULL;

UPDATE countries_new SET population= population*1.1
RETURNING country_name,population AS "New Population" ;

DELETE FROM countries_new
WHERE population<100000
RETURNING *;

SELECT * FROM countries_new;

DELETE FROM countries_new AS cn USING countries c
WHERE c.country_id= cn.country_id
RETURNING *;

DELETE FROM countries
RETURNING *;
