USE shop;

/*
	1. Подсчитайте средний возраст пользователей в таблице users.
*/

SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age
FROM users;

/*
	2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
	   Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/
-- получаем месяцы и дни
SELECT MONTH(birthday_at), DAY(birthday_at)
FROM users;

-- получение текущего года
SELECT YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at) 
FROM users;

-- объединение компонентов
SELECT DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))) AS day 
FROM users; 

-- извлечение дня недели
SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day 
FROM users
GROUP BY day;

-- подсчет кол-ва дней
SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day,
COUNT(*) AS total
FROM users
GROUP BY day;

-- сортировка
SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day,
COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC;

/*
	3. Подсчитайте произведение чисел в столбце таблицы.
*/

SELECT id 
FROM catalogs;

SELECT ROUND(EXP(SUM(LN(id))))
FROM catalogs;