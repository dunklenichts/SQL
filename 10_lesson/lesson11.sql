USE shop;

/*
	1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
	catalogs и products в таблицу logs помещается время и дата создания записи, название 
	таблицы, идентификатор первичного ключа и содержимое поля name.
*/

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
		created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
		table_name VARCHAR(50),
		primary_key_id INT(100),
		name_input TEXT
) ENGINE = Archive;

-- SHOW TABLE STATUS LIKE 'logs'

INSERT INTO users (name, birthday_at)
VALUES ('Name3', '2020-10-31');

INSERT INTO catalogs (name)
VALUES ('Name');

INSERT INTO products (name, desription, price)
VALUES ('New Item Name', 'Item description', '9999');

/*
	2.  Создайте SQL-запрос, который помещает в таблицу users миллион записей.
*/

DROP PROCEDURE IF EXISTS insert_million;
DELIMITER //
CREATE PROCEDURE insert_million ()
BEGIN
	DECLARE i INT DEFAULT 1000000;
	-- DECLARE i INT DEFAULT 5;
	DECLARE j INT DEFAULT 0;
	WHILE i > 0 DO
		INSERT INTO users(name, birthday_at, created_at) 
		VALUES (CONCAT('user', j), NOW(), NOW());
		SET i = i - 1;
		SET j = j + 1;
	END WHILE;
END // 
DELIMITER ;

CALL insert_million ();
