USE vk;

/* 
	1. Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице). 
*/

/* 
 	 2. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке.
*/

SELECT DISTINCT firstname FROM users


/*
	3. Первые пять пользователей пометить как удаленные.
*/

UPDATE users 
SET 
	is_deleted = 1
WHERE id <= 5;

/*
 	4. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней).
*/
-- изменение некоторых записей на дату, большую текущей
UPDATE messages  
SET 
	created_at = '2023-04-22 23:54:08'
WHERE created_at < '2001-04-22 23:54:08';

DELETE FROM messages
WHERE created_at > now();

/*
 	5. Написать название темы курсового проекта.
*/

-- Хотела бы связать курсовую работу с моей дипломной. Тема: "Социально-экологическое пространство на примере г. Екатеринбург".
-- То есть исследование того, каким образом городская среда влияет на уровень жизнь людей. Работа сама основывается на социально-экологических 
-- индексах (власть, экология, жкх и тд). Пока практическая часть выглядит как просто собранные новостные данные о тех или иных событиях, произошедних 
-- на территории города и его области. Возможно, в качестве таблиц можно использовать индекс, а в атрибутах: сама новость, время ее публикации и 
-- балл новости (1 - положительная, 0 - нейтральная, -1 - отрицательная). Правда, тогда получится много таблиц с маленьким количеством данных.
-- Если такая работа не подходит, то опишу модель хранения данных кинопоиска