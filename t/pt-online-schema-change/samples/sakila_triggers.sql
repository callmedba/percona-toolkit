USE sakila;

CREATE TABLE IF NOT EXISTS deletes (
  film_id INT
);
  
DROP TRIGGER IF EXISTS sakila.triggers_migration_test_insert;
DROP TRIGGER IF EXISTS sakila.triggers_migration_test_update;
DROP TRIGGER IF EXISTS sakila.triggers_migration_test_delete;

CREATE TRIGGER sakila.triggers_migration_test_insert
BEFORE
-- a comment here
  INSERT ON sakila.film
-- just to make things harder
  FOR EACH ROW SET NEW.length = 60
-- for pt_osc
;

CREATE TRIGGER sakila.triggers_migration_test_update
BEFORE
-- a comment here
  UPDATE ON sakila.film
-- just to make things harder
  FOR EACH ROW SET NEW.length = length - 1
-- for pt_osc
;

CREATE TRIGGER sakila.triggers_migration_test_delete
BEFORE
-- a comment here
  DELETE ON sakila.film
-- just to make things harder
  FOR EACH ROW INSERT INTO sakila.deletes values (film_id)
-- for pt_osc
;
