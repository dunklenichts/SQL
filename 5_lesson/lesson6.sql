USE vk;

/*
	1. Пусть задан некоторый пользователь. Из всех друзей этого пользователя 
	   найдите человека, который больше всех общался с нашим пользователем.
*/
-- обновление таблицы, чтобы выводилось более одного сообщения от отправителя
UPDATE messages SET to_user_id = 1 WHERE id <= 10
-- SELECT from_user_id 
-- FROM messages WHERE to_user_id = 1

SELECT from_user_id id_sender,
	COUNT(*) amount
FROM messages WHERE to_user_id = 1
GROUP BY from_user_id 
LIMIT 1;

/*
	Подсчитать общее количество лайков, которые получили пользователи младше 11 лет.
*/

-- SELECT birthday 
-- FROM profiles
-- WHERE (YEAR(NOW())-YEAR(birthday)) < 11

SELECT
	COUNT(*) AS amount
FROM profiles 
WHERE (YEAR(NOW())-YEAR(birthday)) < 11;

/*
	Определить кто больше поставил лайков (всего): мужчины или женщины.
*/

SELECT 
	gender AS gender,
	COUNT(*) AS amount
FROM profiles 
GROUP BY gender
LIMIT 1;

