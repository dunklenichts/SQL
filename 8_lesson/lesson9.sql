/*
	1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
	   Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте 
	   транзакции.
*/

START TRANSACTION;

INSERT INTO users 
SELECT id, name
FROM shop.users 
WHERE id = 1;
DELETE FROM shop.users
WHERE id = 1
LIMIT 1;

COMMIT;


SELECT * FROM shop.users;
SELECT * FROM users;

/*
	Пусть имеется любая таблица с календарным полем created_at. 
	Создайте запрос, который удаляет устаревшие записи из таблицы, 
	оставляя только 5 самых свежих записей.
*/

INSERT INTO shop.users (name, created_at)
VALUES ('Name', '1984-11-12'), ('Name2', '1984-11-12'), ('Name3', '1984-11-12')

UPDATE shop.users 
SET created_at = '2018-06-23 11:07:33'
WHERE id < 7
UPDATE shop.users 
SET created_at = '2022-10-23 11:07:33'
WHERE id = 4

START TRANSACTION;
-- DELETE FROM shop.users
-- WHERE created_at < NOW()
-- LIMIT 5;
DELETE FROM shop.users
ORDER BY created_at
LIMIT 5;

COMMIT;

/*
	2. Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
	   в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна 
	   возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать 
	   фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — 
	   "Доброй ночи".
*/

SELECT NOW(), HOUR(NOW())

CREATE FUNCTION hello()
RETURNS TINYTEXT NOT DETERMINISTIC
BEGIN
	DECLARE hour INT;
	SET hour = HOUR(NOW());
	CASE 
		WHEN hour BETWEEN 0 AND 5 
			THEN RETURN "Доброй ночи";
		WHEN hour BETWEEN 6 AND 11
			THEN RETURN "Доброе утро";
		WHEN hour BETWEEN 12 AND 17
			THEN RETURN "Добрый день";
		WHEN hour BETWEEN 18 AND 23
			THEN RETURN "Добрый вечер";
	END CASE;
END

SELECT NOW(), hello()


