DROP USER IF EXISTS "michael";
CREATE USER "michael" WITH password 'stonebreaker';
DROP DATABASE IF EXISTS "todo_app";
CREATE DATABASE "todo_app";
  \c todo_app
DROP TABLE IF EXISTS "tasks";
CREATE TABLE "tasks" (
  id serial,
  title varchar(255),
  description text,
  created_at timestamp WITHOUT TIME ZONE DEFAULT now(),
  updated_at timestamp WITHOUT TIME ZONE,
  completed boolean);

ALTER TABLE tasks DROP COLUMN completed;
ALTER TABLE tasks ADD COLUMN completed_at timestamp WITHOUT TIME ZONE DEFAULT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT now();
INSERT INTO tasks VALUES(DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);
INSERT INTO tasks VALUES(DEFAULT, 'Study PostgreSQL', 'Read all the documentation');
SELECT * FROM tasks WHERE completed_at IS NULL;
UPDATE tasks
SET completed_at = now() WHERE title = 'Study SQL';
SELECT * FROM tasks WHERE completed_at IS NULL;
SELECT * FROM tasks ORDER BY created_at DESC;
INSERT INTO tasks VALUES(DEFAULT, 'mistake 1', 'test entry');
INSERT INTO tasks VALUES(DEFAULT, 'mistake 2', 'another test entry');
INSERT INTO tasks VALUES(DEFAULT, 'third mistake', 'another test entry');
SELECT title, description FROM tasks WHERE title LIKE '%mistake%';
DELETE FROM tasks WHERE title LIKE '%mistake%';
SELECT * FROM tasks ORDER BY title;