CREATE DATABASE lab1;
CREATE TABLE users(
  id SERIAL,
  firstname VARCHAR (50),
  lastname VARCHAR (50)
);
ALTER TABLE users ADD COLUMN isadmin int;
ALTER TABLE users
    ALTER COLUMN isadmin TYPE boolean USING users.isadmin::boolean;
ALTER TABLE users
    ALTER COLUMN isadmin SET DEFAULT FALSE ;
ALTER TABLE users ADD PRIMARY KEY(id);

CREATE TABLE tasks (
  id SERIAL,
  name varchar(50),
  user_id int
);
DROP TABLE tasks;
DROP DATABASE lab1;
INSERT INTO users(firstname, lastname) VALUES ('Ulbo','Kozhakova');
SELECT * from users;