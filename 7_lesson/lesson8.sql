USE vk;

/*
	1. Пусть задан некоторый пользователь. Из всех друзей этого пользователя 
	   найдите человека, который больше всех общался с нашим пользователем.
*/

SELECT 
	(SELECT CONCAT(firstname, ' ', lastname) FROM users 
		WHERE id = m.from_user_id) AS name,
	COUNT(*) AS cnt
FROM users u
JOIN messages m ON u.id = from_user_id
WHERE to_user_id = 41
AND from_user_id IN (
	SELECT initiator_user_id FROM friend_requests
	WHERE (target_user_id = 41) AND status='approved'
	UNION 
	SELECT target_user_id FROM friend_requests
	WHERE (initiator_user_id = 41) AND status='approved'
)
GROUP BY from_user_id 
ORDER BY cnt DESC
LIMIT 1;

/*
	Подсчитать общее количество лайков, которые получили пользователи младше 11 лет.
*/

SELECT 
	COUNT(*)
FROM likes l
JOIN profiles p ON l.user_id = p.user_id 
WHERE media_id IN (
	SELECT id
	FROM media
	WHERE user_id IN (
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
	COUNT(*) AS amount
FROM likes l
JOIN profiles p ON l.user_id = p.user_id 
GROUP BY p.gender
LIMIT 1;
