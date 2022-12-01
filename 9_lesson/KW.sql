DROP DATABASE IF EXISTS music_groups;
CREATE DATABASE music_groups;

USE music_groups;

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `group` (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	town VARCHAR(50),
	created_year INT,
	group_genre VARCHAR(10)
);

DROP TABLE IF EXISTS genre;
CREATE TABLE genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	town VARCHAR(50),
	raitnig INT,
	group_id  BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (group_id) REFERENCES `group`(id) ON UPDATE CASCADE ON DELETE CASCADE

);

DROP TABLE IF EXISTS participants;
CREATE TABLE participants (
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	town VARCHAR(50),
	join_date DATETIME
);

DROP TABLE IF EXISTS albums;
CREATE TABLE albums (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	INDEX albums_index(name)
);

DROP TABLE IF EXISTS songs;
CREATE TABLE songs (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	INDEX songs_index(name)
);

DROP TABLE IF EXISTS group_albums;
CREATE TABLE group_albums (
	group_id BIGINT UNSIGNED NOT NULL,
	song_id BIGINT UNSIGNED NOT NULL,
	album_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(50),
	PRIMARY KEY (group_id, song_id, album_id),
	FOREIGN KEY (group_id) REFERENCES `group`(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (song_id) REFERENCES songs(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (album_id) REFERENCES albums(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS group_songs;
CREATE TABLE group_songs (
	group_id BIGINT UNSIGNED NOT NULL,
	song_id BIGINT UNSIGNED NOT NULL,
	album_id BIGINT UNSIGNED NOT NULL,
	name VARCHAR(50),
	PRIMARY KEY (group_id, song_id),
	FOREIGN KEY (group_id) REFERENCES `group`(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (song_id) REFERENCES songs(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS trailers;
CREATE TABLE trailers (
	id SERIAL PRIMARY KEY,
	group_id  BIGINT UNSIGNED NOT NULL,
	url TEXT,
	`size` INT,
	uploaded_at DATETIME DEFAULT NOW(),
	FOREIGN KEY (group_id) REFERENCES `group`(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS photo;
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
	FOREIGN KEY (group_id) REFERENCES `group`(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO `albums` VALUES (7,'animi'),(25,'architecto'),(1,'aut'),(22,'aut'),(19,'commodi'),(11,'consequatur'),(2,'corporis'),(29,'eligendi'),(24,'est'),(15,'et'),(30,'et'),(5,'exercitationem'),(9,'exercitationem'),(20,'explicabo'),(4,'fuga'),(21,'id'),(27,'impedit'),(28,'molestias'),(17,'natus'),(6,'qui'),(18,'quo'),(13,'recusandae'),(26,'rem'),(14,'repellendus'),(8,'sunt'),(12,'temporibus'),(3,'unde'),(16,'vel'),(10,'velit'),(23,'velit');
INSERT INTO `concert` VALUES (1,26,'South Kirstenland','2017-07-21 16:17:30'),(2,6,'West Macfort','1987-07-03 21:38:13'),(3,27,'Kutchview','1991-05-11 01:01:53'),(4,8,'Port Clareside','2000-01-15 00:46:43'),(5,23,'North Bennettland','2021-12-14 23:22:20'),(6,11,'Taureanville','2003-09-02 20:11:58'),(7,9,'Hermantown','1994-05-08 19:32:38'),(8,29,'South Lavadaside','1987-12-04 01:42:09'),(9,24,'Kochberg','1986-07-07 22:00:10'),(10,25,'Blandafurt','1974-04-19 08:50:15');
INSERT INTO `genre` VALUES (1,'laudantium','South Natashashire',1,29),(2,'quae','Weberfurt',0,7),(3,'quam','Nienowfurt',10,7),(4,'modi','Port Koby',3,13),(5,'ut','East Verdie',5,30),(6,'porro','Port Lincolnmouth',2,24),(7,'velit','Effieland',0,1),(8,'inventore','West Aglae',6,28),(9,'aut','Port Raymundoside',10,12),(10,'voluptatem','South Soledad',4,26);
INSERT INTO `group` VALUES (1,'consectetur','Keiraborough',2017,'magni'),(2,'voluptate','Sabrinaport',1993,'repudianda'),(3,'aut','Botsfordstad',1998,'quaerat'),(4,'in','East Ninaburgh',1994,'expedita'),(5,'ut','Port Ivashire',2018,'nesciunt'),(6,'corporis','East Jackeline',2005,'eaque'),(7,'est','Streichstad',1983,'saepe'),(8,'aut','Maiaberg',2005,'suscipit'),(9,'commodi','Wilburnchester',2016,'temporibus'),(10,'debitis','West Dakota',2006,'rem'),(11,'ullam','North Aleenchester',1979,'qui'),(12,'quam','New Kasandra',1984,'nobis'),(13,'quia','Gleasonside',1979,'est'),(14,'quasi','Genetown',1987,'fuga'),(15,'possimus','New Ariview',1997,'commodi'),(16,'aut','Port Yasmineport',1988,'praesentiu'),(17,'doloremque','North Rodrickmouth',1974,'ut'),(18,'quia','Port Tyra',1979,'quia'),(19,'nam','Lake Magnus',1970,'est'),(20,'molestias','Bogisichburgh',2009,'dolor'),(21,'sint','Martyfurt',1976,'vero'),(22,'et','West Nicolas',1986,'molestiae'),(23,'culpa','Kraigside',1975,'distinctio'),(24,'ut','Thielmouth',1991,'et'),(25,'ad','South Joebury',1982,'unde'),(26,'aut','Sadieborough',1994,'id'),(27,'fuga','Port Elenora',1975,'dolorum'),(28,'laboriosam','Marquardtfort',2015,'quaerat'),(29,'est','Casperchester',1983,'et'),(30,'id','Hodkiewiczfort',2018,'dolorum');
INSERT INTO `group_albums` VALUES (1,25,8,'possimus'),(2,17,17,'neque'),(2,20,15,'esse'),(2,38,27,'debitis'),(3,4,7,'voluptatum'),(4,17,27,'hic'),(5,8,11,'dicta'),(6,3,10,'et'),(6,28,19,'non'),(7,29,17,'dolores'),(7,34,18,'non'),(8,24,27,'fugiat'),(8,39,17,'excepturi'),(10,6,18,'voluptatum'),(12,37,9,'aut'),(13,2,9,'quae'),(14,18,26,'repellendus'),(14,35,11,'eos'),(15,7,23,'fugit'),(16,5,29,'amet'),(18,8,15,'doloribus'),(18,15,15,'est'),(19,16,2,'repellat'),(19,40,25,'necessitatibus'),(20,8,6,'in'),(21,1,22,'blanditiis'),(21,18,12,'porro'),(23,4,3,'ipsum'),(23,24,20,'dolor'),(24,12,16,'omnis'),(25,11,4,'exercitationem'),(25,14,15,'corporis'),(26,6,13,'maxime'),(26,37,9,'dolorem'),(26,39,3,'est'),(27,16,14,'officiis'),(28,23,19,'labore'),(29,8,7,'tenetur'),(29,10,29,'aut'),(29,15,30,'vero');
INSERT INTO `group_songs` VALUES (1,10,21,'sit'),(1,24,11,'dolores'),(1,40,8,'ut'),(2,19,11,'incidunt'),(3,11,2,'amet'),(4,8,19,'sint'),(5,14,16,'hic'),(5,37,29,'dolore'),(6,3,25,'neque'),(6,5,8,'et'),(8,3,8,'et'),(8,7,20,'quis'),(9,1,13,'atque'),(9,28,24,'et'),(11,32,18,'ea'),(13,2,16,'minus'),(13,11,7,'ut'),(15,32,26,'at'),(15,35,15,'iste'),(16,22,9,'ut'),(18,8,15,'reprehenderit'),(18,25,21,'dolores'),(18,38,2,'culpa'),(19,10,7,'minima'),(19,22,5,'molestiae'),(20,34,2,'similique'),(21,22,26,'quis'),(22,2,9,'dolore'),(22,14,10,'dolore'),(24,40,5,'et'),(25,16,25,'illum'),(26,10,25,'est'),(26,26,14,'corporis'),(27,13,18,'rerum'),(27,18,11,'et'),(28,3,16,'recusandae'),(29,21,12,'dolor'),(30,17,21,'est');
INSERT INTO `participants` VALUES (1,'Augustus','Nolan','Port Mohammadmouth','1979-08-08 07:07:44'),(2,'Rossie','Langworth','New Jorge','2003-09-22 05:01:11'),(3,'Shanel','Ullrich','Port Oriebury','1974-02-25 21:35:56'),(4,'Karli','Leffler','New Casimir','1989-09-27 01:54:11'),(5,'Junius','Collier','Jamisonborough','2001-12-31 02:39:24'),(6,'Alanis','Rohan','Port Xanderbury','1975-10-28 16:51:09'),(7,'Ruben','Bashirian','Jaymetown','1979-08-01 11:00:29'),(8,'Albert','Blick','Letabury','1970-03-18 14:55:48'),(9,'Santina','Nienow','East Elzamouth','2019-11-20 06:40:08'),(10,'Anibal','Towne','Mantemouth','1970-09-15 00:33:34'),(11,'Madeline','Kovacek','Daisybury','2011-02-11 13:41:37'),(12,'Jettie','Kub','Port Princessside','2016-10-29 17:08:42'),(13,'Marlin','Steuber','Elsechester','2016-11-02 18:47:39'),(14,'Deonte','Keeling','Pricefort','2001-12-16 10:40:05'),(15,'Virginie','Wiegand','Dickistad','2004-07-23 17:31:58'),(16,'Lucious','Gutkowski','Kingborough','1987-04-15 19:45:23'),(17,'Ashly','Kohler','Framifurt','2001-09-01 19:59:57'),(18,'Destinee','Osinski','South Daphnee','1989-04-13 10:56:38'),(19,'Darrel','Erdman','New Cristian','1996-03-06 17:37:02'),(20,'Clementine','Runte','Landenhaven','1992-09-25 05:06:26');
INSERT INTO `photo` VALUES (1,30,'dolorem',766302,'1977-05-29 21:58:08'),(2,23,'atque',0,'1981-03-22 08:23:10'),(3,13,'accusantium',91343341,'1988-05-22 05:25:29'),(4,5,'quidem',2,'1982-04-28 04:21:54'),(5,28,'velit',0,'1985-07-04 22:59:53'),(6,14,'praesentium',4,'2018-06-30 05:43:53'),(7,14,'minima',6530,'2010-09-05 17:03:22'),(8,16,'incidunt',855789879,'1999-07-30 19:10:43'),(9,20,'est',612729242,'2006-09-13 04:05:14'),(10,29,'est',20,'1979-06-11 07:38:07');
INSERT INTO `songs` VALUES (6,'accusantium'),(8,'aspernatur'),(17,'aut'),(22,'aut'),(40,'aut'),(7,'consequatur'),(35,'consequatur'),(16,'culpa'),(14,'dolor'),(27,'doloremque'),(5,'ea'),(30,'eligendi'),(4,'est'),(38,'est'),(29,'et'),(31,'et'),(33,'et'),(21,'fugiat'),(24,'incidunt'),(23,'inventore'),(25,'iste'),(1,'minus'),(39,'nam'),(2,'non'),(13,'perspiciatis'),(9,'placeat'),(20,'possimus'),(3,'qui'),(34,'quia'),(36,'quia'),(26,'quisquam'),(32,'rerum'),(37,'rerum'),(28,'sapiente'),(10,'sed'),(15,'sed'),(11,'similique'),(12,'tempore'),(18,'totam'),(19,'velit');
INSERT INTO `trailers` VALUES (1,1,'http://www.harris.com/',5301544,'1977-11-14 00:51:57'),(2,6,'http://roob.biz/',2921,'1996-01-11 10:29:04'),(3,30,'http://lednerkovacek.com/',7412885,'1992-08-15 14:50:33'),(4,24,'http://www.walsh.com/',78066,'1994-06-11 20:03:58'),(5,3,'http://www.torp.com/',6,'1984-08-30 15:53:52'),(6,10,'http://www.dietrichbeahan.com/',0,'2016-11-17 15:33:25'),(7,4,'http://wunschgutkowski.com/',4620,'1987-02-15 12:39:18'),(8,29,'http://andersonkautzer.net/',138082365,'2016-12-18 13:34:07'),(9,20,'http://www.turcotte.info/',43440463,'1977-09-27 23:49:52'),(10,12,'http://hickle.org/',0,'2006-05-27 08:35:58'),(11,30,'http://www.satterfieldroberts.com/',190729,'1999-12-18 00:01:34'),(12,29,'http://www.homenickhermiston.net/',8249,'1970-07-16 21:50:14'),(13,16,'http://www.bahringer.com/',13469,'1979-03-18 08:06:34'),(14,3,'http://www.beier.biz/',9016315,'2000-08-20 08:47:19'),(15,20,'http://schmittquitzon.net/',14261015,'2010-02-21 07:07:19'),(16,2,'http://sawayn.info/',29,'2008-02-05 07:42:40'),(17,16,'http://parisian.com/',46,'1990-03-15 01:17:36'),(18,6,'http://www.bartoletti.info/',97679,'1990-08-31 23:56:53'),(19,8,'http://www.schoenmarvin.com/',5,'2018-11-25 10:54:52'),(20,1,'http://www.ziemann.org/',3,'2019-11-29 11:41:06'),(21,6,'http://www.cummings.com/',96749,'2016-10-22 03:08:26'),(22,4,'http://www.torp.com/',79240,'2009-02-04 13:41:28'),(23,7,'http://www.lehnermertz.org/',4,'1999-03-24 22:08:13'),(24,3,'http://ruecker.com/',173,'2010-08-21 14:11:56'),(25,11,'http://satterfield.info/',4,'1973-02-06 18:34:12'),(26,29,'http://graham.com/',178656,'1989-05-18 05:38:09'),(27,14,'http://www.marks.com/',215546,'1972-03-22 03:01:55'),(28,20,'http://orn.com/',933019,'1984-03-13 15:40:05'),(29,28,'http://mcglynn.org/',2560,'1973-03-29 20:35:24'),(30,7,'http://bergstromsimonis.net/',59820525,'2016-01-03 04:41:07');



