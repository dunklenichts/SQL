USE vk;

/*
	1. Пусть задан некоторый пользователь. Из всех друзей этого пользователя 
	   найдите человека, который больше всех общался с нашим пользователем.
*/

SELECT 
	from_user_id, 
	(SELECT CONCAT(firstname, ' ', lastname) FROM users 
		WHERE id = m.from_user_id) AS name,
	COUNT(*) AS cnt
FROM messages m
WHERE to_user_id = 1
-- отправитель при этом соответствует:
-- отправитель может быть как инициатором запроса в друзья, так и целью
AND from_user_id IN (
	-- выбрать инициатора дружбы из запросов в друзья
	SELECT initiator_user_id FROM friend_requests
	-- который отправил заявку нужному пользователю и она была одобрена
	WHERE (target_user_id = 1) AND status='approved'
	UNION 
	-- или же найти человека, которому нужный пользователь сам отправил запрос и был одобрен
	SELECT target_user_id FROM friend_requests
	WHERE (initiator_user_id = 1) AND status='approved'
)
GROUP BY from_user_id 
ORDER BY cnt DESC
LIMIT 1;


/*
	Подсчитать общее количество лайков, которые получили пользователи младше 11 лет.
*/

SELECT 
	COUNT(*)
FROM likes
WHERE media_id IN (
	-- если медиа получила лайк, то и пользователь тоже
	-- выбрать медиа
	SELECT id
	FROM media
	-- в котором пользователь обязательно соответствует:
	WHERE user_id IN (
		-- из профилей выбрать пользователей младше 11
		SELECT
			user_id
		FROM profiles AS p
		WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 11
	)
);

/*
	Определить кто больше поставил лайков (всего): мужчины или женщины.
*/

SELECT 
	gender,
	COUNT(*)
FROM (
	-- выводим пол пользователя, поставившего лайк
	SELECT
		-- выбираем пользователя
		user_id AS user,
		(
			-- также вбыираем гендер
			SELECT gender
			FROM profiles 
			WHERE user_id = user
		) AS gender
	-- опоставляем поставившего лайк пользователя с его гендером
	FROM likes
) as dummy
GROUP BY gender
LIMIT 1;

