	 /* 
	   1. Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, 
	   задав в нем логин и пароль, который указывался при установке.
	 */

-- БД установлена и файл создан
	 
	 /* 
	    2. Создайте базу данных example, разместите в ней таблицу users, 
	    состоящую из двух столбцов, числового id и строкового name.
	 */
	 
-- создание БД
CREATE DATABASE example;
USE example;
-- создание таблицы
CREATE TABLE users (
	id INT PRIMARY KEY,
	name VARCHAR(255)
);

	/* 
	   3. Создайте дамп базы данных example из предыдущего задания, 
	   разверните содержимое дампа в новую базу данных sample.
	*/

-- создание новой бд sample
CREATE DATABASE sample;
-- создание дампа базы данных example
C:\Program Files\MySQL\MySQL Server 5.7\bin>mysqldump -u root -p example > example.SQL
-- развертывание дампа в базе данных sample
C:\Program Files\MySQL\MySQL Server 5.7\bin>mysql -u root -p sample < example.sql

	/* 
	  4. Ознакомьтесь более подробно с документацией утилиты mysqldump. 
	   Создайте дамп единственной таблицы help_keyword базы данных mysql. 
	   Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
	*/

C:\Program Files\MySQL\MySQL Server 5.7\bin>mysqldump -u root -p --where="1 limit 100" mysql help_keyword > hk100.sql
-- используем where, чтобы обозначить диапазон
-- mysql - бд, из которой берем дамп таблицы help_keyword
-- hk100.sql - куда сохраняем все