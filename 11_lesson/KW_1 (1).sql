DROP DATABASE IF EXISTS music_groups;
CREATE DATABASE music_groups;

USE music_groups;


DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	town VARCHAR(50),
	created_year INT,
	group_genre VARCHAR(10)
);

-- DROP TABLE IF EXISTS genre;
CREATE TABLE genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	town VARCHAR(50),
	raitnig INT,
	group_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (group_id) REFERENCES `groups`(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- DROP TABLE IF EXISTS participants;
CREATE TABLE participants (
	id SERIAL PRIMARY KEY,
	group_id BIGINT UNSIGNED NOT NULL,
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	town VARCHAR(50),
	join_date DATETIME,
	FOREIGN KEY (group_id) REFERENCES `groups`(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- DROP TABLE IF EXISTS albums;
CREATE TABLE albums (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	INDEX albums_index(name)
);

-- DROP TABLE IF EXISTS songs;
CREATE TABLE songs (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	INDEX songs_index(name)
);

-- DROP TABLE IF EXISTS group_albums;
CREATE TABLE group_albums (
	group_id BIGINT UNSIGNED NOT NULL,
	song_id BIGINT UNSIGNED NOT NULL,
	album_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(50),
	PRIMARY KEY (group_id, song_id, album_id),
	FOREIGN KEY (group_id) REFERENCES `groups`(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (song_id) REFERENCES songs(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (album_id) REFERENCES albums(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- DROP TABLE IF EXISTS group_songs;
CREATE TABLE group_songs (
	group_id BIGINT UNSIGNED NOT NULL,
	song_id BIGINT UNSIGNED NOT NULL,
	album_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(50),
	PRIMARY KEY (group_id, song_id),
	FOREIGN KEY (group_id) REFERENCES `groups`(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (song_id) REFERENCES songs(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- DROP TABLE IF EXISTS trailers;
CREATE TABLE trailers (
	id SERIAL PRIMARY KEY,
	group_id  BIGINT UNSIGNED NOT NULL,
	url TEXT,
	`size` INT,
	uploaded_at DATETIME DEFAULT NOW(),
	FOREIGN KEY (group_id) REFERENCES `groups`(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- DROP TABLE IF EXISTS photo;
CREATE TABLE photo (
	id SERIAL PRIMARY KEY,
	album_id BIGINT UNSIGNED NOT NULL,
	filename TEXT,
	`size` INT,
	uploaded_at DATETIME DEFAULT NOW(),
	FOREIGN KEY (album_id) REFERENCES albums(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS concert;
CREATE TABLE concert (
	id SERIAL PRIMARY KEY,
	group_id BIGINT UNSIGNED NOT NULL,
	town VARCHAR(50),
	concert_date DATETIME,
	FOREIGN KEY (group_id) REFERENCES `groups`(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO `groups` 
VALUES (1,'possimus','East Rhiannon',1986,'rerum'),(2,'doloribus','East Candelario',1971,'veritatis'),(3,'veritatis','Port Adelle',1988,'dolorum'),(4,'aut','Pfeffermouth',2012,'et'),(5,'eius','West Kylahaven',1979,'amet'),(6,'dolorum','New Elliottfurt',1984,'commodi'),(7,'itaque','East Seth',1990,'et'),(8,'hic','North Franciscaland',2018,'harum'),(9,'laborum','West Reesemouth',1990,'commodi'),(10,'sunt','Sporerview',2005,'debitis'),(11,'similique','Jessiechester',1989,'occaecati'),(12,'sit','West Jacinthe',1992,'quod'),(13,'possimus','North Tremainemouth',2006,'laborum'),(14,'et','West Glenda',1995,'aut'),(15,'consequatur','Andersonstad',1977,'iure'),(16,'est','South Bradley',2012,'vel'),(17,'adipisci','North Oliver',2004,'quibusdam'),(18,'exercitationem','Rosettaton',1979,'suscipit'),(19,'occaecati','New Sarahberg',1975,'fuga'),(20,'ut','Bahringermouth',1979,'dicta'),(21,'minima','East Serenity',1989,'amet'),(22,'vitae','South Providenciside',2003,'nam'),(23,'consequuntur','East Mikeport',1998,'accusamus'),(24,'eos','East Raleighland',1993,'molestias'),(25,'velit','Schuppeborough',1990,'id'),(26,'similique','Cruickshankberg',2020,'earum'),(27,'omnis','New Delilah',2000,'aut'),(28,'aspernatur','South Nicholeview',2013,'consectetu'),(29,'est','West Joannyville',1996,'in'),(30,'veritatis','Hayesland',2016,'consequunt');

INSERT INTO `participants` 
VALUES (1,22,'Tia','Schaden','Brendenville','1992-01-18 16:26:36'),(2,27,'Kurt','Haley','Effieborough','1986-02-13 04:27:37'),(3,7,'Elenor','Hauck','Casimirstad','1989-02-08 19:24:23'),(4,10,'Kellen','Moen','Lakinshire','1994-10-16 22:23:54'),(5,10,'Russel','Wunsch','East Lilyhaven','1996-04-19 02:24:13'),(6,11,'Jude','Heaney','Viviannestad','1997-11-04 08:11:30'),(7,7,'Tad','Spencer','Carlosfort','2008-06-20 20:49:18'),(8,23,'Calista','Nolan','South Adellbury','1999-03-08 20:25:30'),(9,24,'Halie','Oberbrunner','Wallaceville','2013-02-24 12:29:02'),(10,18,'Claudine','Rohan','East Kalebhaven','1981-07-18 22:17:59'),(11,21,'Charlie','Franecki','New Ryannville','2013-08-27 08:20:21'),(12,5,'Moshe','Greenfelder','East George','2020-10-02 19:04:51'),(13,27,'Esta','Kuhic','South Reid','1989-07-23 20:06:02'),(14,20,'Dena','Kunze','Bogisichhaven','1989-01-23 22:24:10'),(15,10,'Lacy','Koss','Willmsburgh','1991-01-17 15:44:41'),(16,29,'Jada','Goldner','North Maritza','1994-06-14 19:40:41'),(17,15,'Casper','Stroman','East Melbafort','1989-06-12 08:25:34'),(18,18,'Floy','Torp','Port Filomena','1993-04-25 15:40:49'),(19,11,'Myra','Walter','New Jettie','1999-05-16 09:21:39'),(20,30,'Cordie','Willms','North Juneton','1993-08-16 16:16:57');

INSERT INTO `albums` 
VALUES (7,'animi'),(25,'architecto'),(1,'aut'),(22,'aut'),(19,'commodi'),(11,'consequatur'),(2,'corporis'),(29,'eligendi'),(24,'est'),(15,'et'),(30,'et'),(5,'exercitationem'),(9,'exercitationem'),(20,'explicabo'),(4,'fuga'),(21,'id'),(27,'impedit'),(28,'molestias'),(17,'natus'),(6,'qui'),(18,'quo'),(13,'recusandae'),(26,'rem'),(14,'repellendus'),(8,'sunt'),(12,'temporibus'),(3,'unde'),(16,'vel'),(10,'velit'),(23,'velit');

INSERT INTO `songs` 
VALUES (6,'accusantium'),(8,'aspernatur'),(17,'aut'),(22,'aut'),(40,'aut'),(7,'consequatur'),(35,'consequatur'),(16,'culpa'),(14,'dolor'),(27,'doloremque'),(5,'ea'),(30,'eligendi'),(4,'est'),(38,'est'),(29,'et'),(31,'et'),(33,'et'),(21,'fugiat'),(24,'incidunt'),(23,'inventore'),(25,'iste'),(1,'minus'),(39,'nam'),(2,'non'),(13,'perspiciatis'),(9,'placeat'),(20,'possimus'),(3,'qui'),(34,'quia'),(36,'quia'),(26,'quisquam'),(32,'rerum'),(37,'rerum'),(28,'sapiente'),(10,'sed'),(15,'sed'),(11,'similique'),(12,'tempore'),(18,'totam'),(19,'velit');

INSERT INTO `group_songs` 
VALUES (1,10,21,'sit'),(1,24,11,'dolores'),(1,40,8,'ut'),(2,19,11,'incidunt'),(3,11,2,'amet'),(4,8,19,'sint'),(5,14,16,'hic'),(5,37,29,'dolore'),(6,3,25,'neque'),(6,5,8,'et'),(8,3,8,'et'),(8,7,20,'quis'),(9,1,13,'atque'),(9,28,24,'et'),(11,32,18,'ea'),(13,2,16,'minus'),(13,11,7,'ut'),(15,32,26,'at'),(15,35,15,'iste'),(16,22,9,'ut'),(18,8,15,'reprehenderit'),(18,25,21,'dolores'),(18,38,2,'culpa'),(19,10,7,'minima'),(19,22,5,'molestiae'),(20,34,2,'similique'),(21,22,26,'quis'),(22,2,9,'dolore'),(22,14,10,'dolore'),(24,40,5,'et'),(25,16,25,'illum'),(26,10,25,'est'),(26,26,14,'corporis'),(27,13,18,'rerum'),(27,18,11,'et'),(28,3,16,'recusandae'),(29,21,12,'dolor'),(30,17,21,'est');

INSERT INTO `genre` 
VALUES (1,'laudantium','South Natashashire',1,29),(2,'quae','Weberfurt',0,7),(3,'quam','Nienowfurt',10,7),(4,'modi','Port Koby',3,13),(5,'ut','East Verdie',5,30),(6,'porro','Port Lincolnmouth',2,24),(7,'velit','Effieland',0,1),(8,'inventore','West Aglae',6,28),(9,'aut','Port Raymundoside',10,12),(10,'voluptatem','South Soledad',4,26);

INSERT INTO `concert` 
VALUES (1,26,'South Kirstenland','2017-07-21 16:17:30'),(2,6,'West Macfort','1987-07-03 21:38:13'),(3,27,'Kutchview','1991-05-11 01:01:53'),(4,8,'Port Clareside','2000-01-15 00:46:43'),(5,23,'North Bennettland','2021-12-14 23:22:20'),(6,11,'Taureanville','2003-09-02 20:11:58'),(7,9,'Hermantown','1994-05-08 19:32:38'),(8,29,'South Lavadaside','1987-12-04 01:42:09'),(9,24,'Kochberg','1986-07-07 22:00:10'),(10,25,'Blandafurt','1974-04-19 08:50:15');

INSERT INTO `group_albums` 
VALUES (1,25,8,'possimus'),(2,17,17,'neque'),(2,20,15,'esse'),(2,38,27,'debitis'),(3,4,7,'voluptatum'),(4,17,27,'hic'),(5,8,11,'dicta'),(6,3,10,'et'),(6,28,19,'non'),(7,29,17,'dolores'),(7,34,18,'non'),(8,24,27,'fugiat'),(8,39,17,'excepturi'),(10,6,18,'voluptatum'),(12,37,9,'aut'),(13,2,9,'quae'),(14,18,26,'repellendus'),(14,35,11,'eos'),(15,7,23,'fugit'),(16,5,29,'amet'),(18,8,15,'doloribus'),(18,15,15,'est'),(19,16,2,'repellat'),(19,40,25,'necessitatibus'),(20,8,6,'in'),(21,1,22,'blanditiis'),(21,18,12,'porro'),(23,4,3,'ipsum'),(23,24,20,'dolor'),(24,12,16,'omnis'),(25,11,4,'exercitationem'),(25,14,15,'corporis'),(26,6,13,'maxime'),(26,37,9,'dolorem'),(26,39,3,'est'),(27,16,14,'officiis'),(28,23,19,'labore'),(29,8,7,'tenetur'),(29,10,29,'aut'),(29,15,30,'vero');

INSERT INTO `photo` 
VALUES (1,30,'dolorem',766302,'1977-05-29 21:58:08'),(2,23,'atque',0,'1981-03-22 08:23:10'),(3,13,'accusantium',91343341,'1988-05-22 05:25:29'),(4,5,'quidem',2,'1982-04-28 04:21:54'),(5,28,'velit',0,'1985-07-04 22:59:53'),(6,14,'praesentium',4,'2018-06-30 05:43:53'),(7,14,'minima',6530,'2010-09-05 17:03:22'),(8,16,'incidunt',855789879,'1999-07-30 19:10:43'),(9,20,'est',612729242,'2006-09-13 04:05:14'),(10,29,'est',20,'1979-06-11 07:38:07');

INSERT INTO `trailers` 
VALUES (1,1,'http://www.harris.com/',5301544,'1977-11-14 00:51:57'),(2,6,'http://roob.biz/',2921,'1996-01-11 10:29:04'),(3,30,'http://lednerkovacek.com/',7412885,'1992-08-15 14:50:33'),(4,24,'http://www.walsh.com/',78066,'1994-06-11 20:03:58'),(5,3,'http://www.torp.com/',6,'1984-08-30 15:53:52'),(6,10,'http://www.dietrichbeahan.com/',0,'2016-11-17 15:33:25'),(7,4,'http://wunschgutkowski.com/',4620,'1987-02-15 12:39:18'),(8,29,'http://andersonkautzer.net/',138082365,'2016-12-18 13:34:07'),(9,20,'http://www.turcotte.info/',43440463,'1977-09-27 23:49:52'),(10,12,'http://hickle.org/',0,'2006-05-27 08:35:58'),(11,30,'http://www.satterfieldroberts.com/',190729,'1999-12-18 00:01:34'),(12,29,'http://www.homenickhermiston.net/',8249,'1970-07-16 21:50:14'),(13,16,'http://www.bahringer.com/',13469,'1979-03-18 08:06:34'),(14,3,'http://www.beier.biz/',9016315,'2000-08-20 08:47:19'),(15,20,'http://schmittquitzon.net/',14261015,'2010-02-21 07:07:19'),(16,2,'http://sawayn.info/',29,'2008-02-05 07:42:40'),(17,16,'http://parisian.com/',46,'1990-03-15 01:17:36'),(18,6,'http://www.bartoletti.info/',97679,'1990-08-31 23:56:53'),(19,8,'http://www.schoenmarvin.com/',5,'2018-11-25 10:54:52'),(20,1,'http://www.ziemann.org/',3,'2019-11-29 11:41:06'),(21,6,'http://www.cummings.com/',96749,'2016-10-22 03:08:26'),(22,4,'http://www.torp.com/',79240,'2009-02-04 13:41:28'),(23,7,'http://www.lehnermertz.org/',4,'1999-03-24 22:08:13'),(24,3,'http://ruecker.com/',173,'2010-08-21 14:11:56'),(25,11,'http://satterfield.info/',4,'1973-02-06 18:34:12'),(26,29,'http://graham.com/',178656,'1989-05-18 05:38:09'),(27,14,'http://www.marks.com/',215546,'1972-03-22 03:01:55'),(28,20,'http://orn.com/',933019,'1984-03-13 15:40:05'),(29,28,'http://mcglynn.org/',2560,'1973-03-29 20:35:24'),(30,7,'http://bergstromsimonis.net/',59820525,'2016-01-03 04:41:07');

-- 1. вывести все песни, которые соответствуют каждому альбому
SELECT 
	a.name AS ALBUM_NAME, 
	group_concat(gs.name SEPARATOR ', ') AS SONG
FROM albums a , group_songs gs 
WHERE a.id = gs.album_id 
GROUP BY a.name

-- 2. отображает музыканта и его соответствие группе
SELECT 
	concat(firstname, ' ', lastname) AS PARTICIPANT_NAME,
	town AS TOWN,
	(SELECT name FROM `groups` WHERE id = participants.group_id) AS GROUP_NAME
FROM participants
ORDER BY GROUP_NAME

-- 3. отобразить музыкантов, которые вступили в группы менее пяти лет назад
SELECT 
	concat(firstname, ' ', lastname) AS PARTICIPANT_NAME,
	(SELECT name FROM `groups` WHERE id = participants.group_id) AS GROUP_NAME,
	join_date
FROM participants
WHERE TIMESTAMPDIFF(YEAR, join_date, NOW()) < 5
ORDER BY join_date DESC 

-- 4. альбомы групп, жанр которых более 5
SELECT gr.*, g.raitnig AS GENRE_RAITING
FROM `groups` gr 
JOIN genre g 
ON gr.id = g.group_id 
WHERE g.raitnig > 5
ORDER BY g.group_id

-- 1. представление: мызкант и его группа
CREATE VIEW participand_and_group
AS SELECT 
		concat(firstname, ' ', lastname) AS PARTICIPANT_NAME,
		(SELECT name FROM `groups` WHERE id = participants.group_id) AS GROUP_NAME
	FROM participants
	ORDER BY GROUP_NAME

-- 2. представление группа и ее песни
CREATE VIEW group_and_songs
AS SELECT 
	    g.name AS GROUP_NAME, 
		group_concat(gs.name SEPARATOR ', ') AS SONG
	FROM `groups` g, group_songs gs 
	WHERE g.id = gs.group_id 
	GROUP BY g.name

-- 1. триггер на автоматическое добавление даты в концерты при их создании
DROP TRIGGER auto_insert
CREATE TRIGGER auto_insert
BEFORE INSERT
ON concert FOR EACH ROW
BEGIN 
	IF NEW.concert_date IS NULL THEN 
		SET NEW.concert_date = current_date();
	END IF; 
END

INSERT INTO concert (group_id, town)
VALUES (12, 'NewTown')
 

-- 2. процедура на запись пяти новых участников групп
DROP PROCEDURE IF EXISTS insert_participants;
CREATE PROCEDURE insert_participants ()
BEGIN
	DECLARE i INT DEFAULT 5;
	DECLARE j INT DEFAULT 0;
	WHILE i > 0 DO
		INSERT INTO participants (group_id, firstname, lastname, town, join_date) 
		VALUES (i, 'Иван', CONCAT('Иванович ', j), CONCAT('NewTown  ', j), NOW());
		SET i = i - 1;
		SET j = j + 1;
	END WHILE;
END

CALL insert_participants();
