DROP DATABASE IF EXISTS lesson5;
CREATE DATABASE lesson5;
USE lesson5;

/* 
  1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
     Заполните их текущими датой и временем.
*/

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
    name  VARCHAR(255),
    birthday_at DATE,
    created_at DATETIME,
    updated_at DATETIME
);

INSERT INTO users (name, birthday_at, created_at, updated_at)
VALUES 
('Геннадий', '1990-10-05', NULL, NULL),
('Наталья', '1984-11-12', NULL, NULL),
('Александр', '1985-05-20', NULL, NULL),
('Сергей', '1988-02-14', NULL, NULL),
('Иван', '1998-01-12', NULL, NULL),
('Мария', '2006-08-29', NULL,  NULL);

UPDATE users SET created_at = NOW(), updated_at = NOW()

/* 
  2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были 
  заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. 
  Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
*/

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
    name  VARCHAR(255),
    birthday_at DATE,
    created_at VARCHAR(255),
    updated_at VARCHAR(255)
);

INSERT INTO users (name, birthday_at, created_at, updated_at)
VALUES 
('Геннадий', '1990-10-05', '07.01.2016 12:05', '07.01.2016 12:05'),
('Наталья', '1984-11-12', '20.05.2016 16:32', '20.05.2016 16:32'),
('Александр', '1985-05-20', '14.08.2016 20:10', '14.08.2016 20:10'),
('Сергей', '1988-02-14', '21.10.2016 9:14', '21.10.2016 9:14'),
('Иван', '1998-01-12', '15.12.2016 12:45', '15.12.2016 12:45'),
('Мария', '2006-08-29', '12.01.2017 8:56',  '12.01.2017 8:56');

SELECT STR_TO_DATE(created_at, '%d.%m.%Y %k:%i') FROM users;

UPDATE users SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'), 
				 updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');

ALTER TABLE users 
CHANGE updated_at
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE users 
CHANGE created_at
created_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

DESCRIBE users;		

/*
	3. В таблице складских запасов storehouses_products в поле value могут встречаться 
	самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. 
	Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения 
	значения value. Однако нулевые запасы должны выводиться в конце, после всех записей.
*/

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
	id SERIAL PRIMARY KEY,
    store_id INT UNSIGNED,
    product_id INT UNSIGNED,
    value INT UNSIGNED,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO storehouses_products (store_id, product_id, value)
VALUES
(1, 543, 0),
(1, 789, 2500),
(1, 3432, 0),
(1, 826, 30),
(1, 719, 500),
(1, 638, 1);

SELECT * FROM storehouses_products 
ORDER BY value;

-- SELECT id, value, IF(value > 0, 0, 1) AS sort FROM storehouses_products
-- ORDER BY value;

SELECT * FROM storehouses_products
ORDER BY IF(value > 0, 0, 1), value;

/* 
	4. Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
	   Месяцы заданы в виде списка английских названий (may, august)
*/

SELECT * FROM users
SELECT name -- birthday_at  
FROM users WHERE DATE_FORMAT(birthday_at, '%M') IN ('may', 'august');

/* 
	5. Из таблицы catalogs извлекаются записи при помощи запроса. 
	   SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
	   Отсортируйте записи в порядке, заданном в списке IN.
*/

SELECT * FROM shop.catalogs WHERE id IN (5, 1, 2)
ORDER BY FIELD(id, 5, 1, 2)

-- SELECT * FROM shop.catalogs where id IN (5, 1, 2);
-- SELECT id, name, FIELD(id, 5, 1, 2) AS pos FROM shop.catalogs 
-- WHERE id IN (5, 1, 2);
-- FIELD сравнивает первый аргумент со всеми остальными.
-- Возвращает 0, если арг. не входит в список, иначе - возвр. позицию в списке