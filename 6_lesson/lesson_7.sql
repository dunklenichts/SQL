USE shop;
/*
	1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
*/
-- изменение таблицы путем добавления пользователей, не совершивших заказ
INSERT INTO users (name)
VALUES ('User1'), ('USER2'), ('uSER3');

SELECT
	u.name AS user_name
FROM
	users AS u
RIGHT JOIN 
	orders AS o
ON
	u.id = o.user_id 
GROUP BY u.name
	

/* 
   2. Выведите список товаров products и разделов catalogs, который 
   соответствует товару.
*/
	
SELECT 
	p.name AS product_name,
	c.name AS catalogue_name
FROM
	products AS p
INNER JOIN 
	catalogs AS c
ON (p.catalog_id = c.id)

/*
	3. Пусть имеется таблица рейсов flights (id, from, to) и таблица 
	городов cities (label, name). Поля from, to и label содержат 
	английские названия городов, поле name — русское. Выведите список 
	рейсов flights с русскими названиями городов.
*/
 
 DROP TABLE IF EXISTS flights;
 CREATE TABLE flights (
   id SERIAL PRIMARY KEY,
   country_from VARCHAR(100),
   country_to VARCHAR(100)
 );
 DROP TABLE IF EXISTS cities;
 CREATE TABLE cities (
   id SERIAL PRIMARY KEY,
   label VARCHAR(100),
   name VARCHAR(100)
 );

INSERT INTO flights (id, country_from, country_to)
VALUES (1, 'moscow', 'omsk'), (2, 'novgorod', 'kazan'), (3, 'irkutsk', 'moscow'), (4, 'omsk', 'irkutsk'), (5, 'moscow', 'kazan')
INSERT INTO cities (label, name)
VALUES ('moscow', 'Москва'), ('irkutsk', 'Иркутск'), ('novgorod', 'Новгород'), ('kazan', 'Казань'), ('omsk', 'Омск')

SELECT
	(SELECT name FROM cities WHERE label = country_from) AS country_from,
	(SELECT name FROM cities WHERE label = country_to)  AS country_to
FROM
	flights