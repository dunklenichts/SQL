# SQL
LESSON 1
1. Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.
2. Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
3. Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
4. Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной таблицы help_keyword базы данных mysql. 
   Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.

LESSON 2
1. Написать cкрипт, добавляющий в БД vk, которую создали на 3 вебинаре, 3-4 новые таблицы (с перечнем полей, указанием индексов и внешних ключей).

LESSON 3
1. Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице).
2. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке.
3. Первые пять пользователей пометить как удаленные.
4. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней).
4. Написать название темы курсового проекта.

LESSON 4
«Операторы, фильтрация, сортировка и ограничение»
1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 
   20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе 
   имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако нулевые запасы должны 
   выводиться в конце, после всех записей.
4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий (may, august)
5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном 
   в списке IN.

«Агрегация данных»
1. Подсчитайте средний возраст пользователей в таблице users.
2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.
3. (по желанию) Подсчитайте произведение чисел в столбце таблицы.

LESSON 5
1. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
2. Подсчитать общее количество лайков, которые получили пользователи младше 11 лет.
3. Определить кто больше поставил лайков (всего): мужчины или женщины.

LESSON 6
1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
2. Выведите список товаров products и разделов catalogs, который соответствует товару.
3. Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле 
   name — русское. Выведите список рейсов flights с русскими названиями городов.

LESSON 7
1. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
2. Подсчитать общее количество лайков, которые получили пользователи младше 11 лет.
3. Определить кто больше поставил лайков (всего): мужчины или женщины.

LESSON 8
“Транзакции, переменные, представления”
1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. 
   Используйте транзакции.
2. Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.

“Хранимые процедуры и функции, триггеры"
1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу 
   "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

LESSON 9
1. DDL-команды;
2. Скрипт наполнения таблиц данными, 10-100 строк в каждой таблице.

LESSON 10
1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи, 
   название таблицы, идентификатор первичного ключа и содержимое поля name.
2. Создайте SQL-запрос, который помещает в таблицу users миллион записей.

LESSON 11
Курсовой проект
