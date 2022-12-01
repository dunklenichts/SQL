-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_20
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'modi',1),(2,'corrupti',2),(3,'illum',3),(4,'unde',4),(5,'aut',5),(6,'voluptas',6),(7,'necessitatibus',7),(8,'sint',8),(9,'quae',9),(10,'omnis',10),(11,'tenetur',11),(12,'qui',12),(13,'laboriosam',13),(14,'error',14),(15,'aut',15),(16,'velit',16),(17,'non',17),(18,'quos',18),(19,'eos',19),(20,'dicta',20),(21,'et',21),(22,'incidunt',22),(23,'error',23),(24,'veniam',24),(25,'dignissimos',25),(26,'corrupti',26),(27,'accusantium',27),(28,'amet',28),(29,'enim',29),(30,'sint',30),(31,'molestiae',31),(32,'et',32),(33,'quia',33),(34,'sint',34),(35,'natus',35),(36,'quia',36),(37,'nihil',37),(38,'omnis',38),(39,'occaecati',39),(40,'numquam',40),(41,'cum',41),(42,'qui',42),(43,'architecto',43),(44,'consequatur',44),(45,'ipsum',45),(46,'dolor',46),(47,'est',47),(48,'vel',48),(49,'voluptatem',49),(50,'nihil',50);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'название учебного заведения',
  PRIMARY KEY (`id`),
  KEY `education_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (10,'blanditiis'),(9,'consequatur'),(4,'cum'),(6,'dicta'),(1,'dolorum'),(5,'earum'),(7,'eos'),(8,'in'),(2,'odit'),(3,'quibusdam');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (4,2,'requested','1989-01-04 03:22:10','2000-08-14 01:26:41'),(6,41,'declined','1998-10-17 10:50:46','1981-09-14 22:45:04'),(8,8,'requested','2019-07-18 22:12:29','2011-04-09 12:55:33'),(10,1,'declined','2002-05-16 01:11:04','1995-01-10 11:47:59'),(12,57,'unfriended','2003-04-17 18:05:20','2008-08-07 02:03:30'),(18,41,'declined','2014-02-28 05:26:36','1985-07-04 14:14:08'),(31,82,'requested','2009-05-31 18:49:51','2000-09-01 04:17:53'),(34,5,'approved','1990-10-30 02:47:08','1996-09-12 01:37:08'),(42,21,'requested','1998-07-01 19:55:33','1970-07-14 02:22:42'),(50,95,'declined','1970-05-02 18:40:52','2013-04-23 16:02:25'),(54,22,'approved','2010-09-01 04:28:24','2005-12-27 23:35:13'),(58,88,'approved','1990-02-01 09:26:48','1981-12-14 18:56:02'),(61,17,'declined','2019-12-01 02:50:00','2007-11-07 18:21:10'),(70,45,'approved','2008-07-09 20:59:50','2006-11-29 00:06:18'),(76,93,'unfriended','1988-02-07 06:17:12','1983-08-30 17:15:50'),(77,14,'approved','2010-01-19 17:13:47','2003-03-28 09:49:52'),(84,43,'unfriended','1994-02-05 09:55:52','2001-08-07 17:01:58'),(89,8,'declined','2000-04-20 16:56:51','1992-04-09 09:57:15'),(92,69,'unfriended','1980-04-11 09:47:29','2019-03-24 16:38:44'),(94,16,'approved','2018-08-01 21:13:09','2004-03-19 14:21:13');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1,'1988-12-03 21:13:42'),(2,2,2,'2005-05-21 04:08:16'),(3,3,3,'2015-09-16 21:12:27'),(4,4,4,'1986-05-16 12:41:36'),(5,5,5,'1982-03-07 01:47:47'),(6,6,6,'1979-05-10 19:50:48'),(7,7,7,'1989-11-06 15:09:44'),(8,8,8,'1984-05-11 23:37:00'),(9,9,9,'2020-01-21 13:54:06'),(10,10,10,'1994-06-15 19:11:37'),(11,11,11,'2011-02-16 15:05:25'),(12,12,12,'1996-10-16 05:13:07'),(13,13,13,'1982-12-01 21:31:46'),(14,14,14,'1985-08-13 06:51:34'),(15,15,15,'1997-08-09 12:45:14'),(16,16,16,'1979-12-23 02:23:17'),(17,17,17,'1970-08-06 08:09:01'),(18,18,18,'2000-06-15 12:56:40'),(19,19,19,'1974-02-21 00:47:22'),(20,20,20,'1989-05-26 23:09:40'),(21,21,21,'2005-10-15 20:15:12'),(22,22,22,'2000-02-14 00:21:25'),(23,23,23,'2010-04-06 21:22:49'),(24,24,24,'1974-05-20 20:41:38'),(25,25,25,'2006-10-02 20:34:01'),(26,26,26,'2018-10-21 05:56:32'),(27,27,27,'1980-07-27 15:51:37'),(28,28,28,'1996-10-26 17:10:24'),(29,29,29,'2008-07-03 11:37:03'),(30,30,30,'1995-05-05 10:01:29'),(31,31,1,'1985-01-08 09:27:54'),(32,32,2,'1974-06-28 05:57:28'),(33,33,3,'1978-08-01 20:57:22'),(34,34,4,'1989-04-12 02:11:48'),(35,35,5,'1974-12-19 16:01:48'),(36,36,6,'2014-12-09 03:28:44'),(37,37,7,'1990-03-02 19:08:39'),(38,38,8,'2011-02-17 05:19:18'),(39,39,9,'1991-07-24 15:41:21'),(40,40,10,'1971-10-14 17:00:41'),(41,41,11,'2020-04-23 00:13:13'),(42,42,12,'1999-01-01 02:28:18'),(43,43,13,'2015-06-12 01:34:46'),(44,44,14,'1999-10-27 03:56:45'),(45,45,15,'2020-09-13 19:38:30'),(46,46,16,'1997-04-12 16:32:50'),(47,47,17,'1984-03-11 18:46:31'),(48,48,18,'1974-05-20 03:35:06'),(49,49,19,'2007-04-03 19:45:10'),(50,50,20,'1996-12-15 07:16:29'),(51,51,21,'2017-11-26 23:24:45'),(52,52,22,'1981-11-24 09:36:28'),(53,53,23,'1996-04-29 07:52:15'),(54,54,24,'1995-08-07 09:43:58'),(55,55,25,'1981-11-01 00:10:04'),(56,56,26,'2006-09-06 20:11:21'),(57,57,27,'2004-12-06 05:27:03'),(58,58,28,'1982-05-10 04:37:00'),(59,59,29,'2012-10-01 01:31:27'),(60,60,30,'1998-09-25 19:08:48'),(61,61,1,'2006-05-08 10:13:24'),(62,62,2,'1998-12-28 16:13:37'),(63,63,3,'1972-04-26 04:19:49'),(64,64,4,'1980-05-21 06:10:40'),(65,65,5,'1994-02-13 09:29:30'),(66,66,6,'1992-12-02 13:05:55'),(67,67,7,'1975-11-25 09:23:48'),(68,68,8,'1988-07-01 17:18:55'),(69,69,9,'1970-11-18 23:18:07'),(70,70,10,'2020-09-28 01:37:38'),(71,71,11,'2015-02-05 14:51:17'),(72,72,12,'1979-11-29 19:34:41'),(73,73,13,'2022-09-01 23:48:03'),(74,74,14,'1986-04-24 11:53:16'),(75,75,15,'1976-02-22 18:46:53'),(76,76,16,'2015-08-07 22:28:49'),(77,77,17,'1995-08-06 13:09:48'),(78,78,18,'2016-05-28 18:18:33'),(79,79,19,'2017-04-06 03:57:17'),(80,80,20,'2006-01-18 02:34:29'),(81,81,21,'1999-02-15 14:52:06'),(82,82,22,'1992-05-06 00:01:39'),(83,83,23,'2010-02-20 23:15:15'),(84,84,24,'1993-08-19 23:35:06'),(85,85,25,'1994-08-25 16:23:19'),(86,86,26,'1972-04-08 17:28:58'),(87,87,27,'1971-10-13 19:42:44'),(88,88,28,'2000-10-11 07:16:00'),(89,89,29,'1972-12-04 11:48:31'),(90,90,30,'1978-05-27 14:57:04'),(91,91,1,'1992-11-08 13:37:03'),(92,92,2,'2005-11-20 12:49:30'),(93,93,3,'1995-09-27 04:36:55'),(94,94,4,'1973-03-16 19:49:27'),(95,95,5,'2017-12-21 02:28:58'),(96,96,6,'1971-02-18 17:14:57'),(97,97,7,'1995-02-13 01:48:39'),(98,98,8,'1998-12-31 18:43:54'),(99,99,9,'2021-04-17 06:26:53'),(100,100,10,'2013-10-23 14:18:43');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_idx` (`country_name`,`town_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (2,'at','non'),(18,'autem','ut'),(4,'blanditiis','assumenda'),(9,'dolorem','laudantium'),(7,'eaque','culpa'),(16,'est','est'),(20,'et','quasi'),(19,'ipsum','sequi'),(11,'labore','sit'),(6,'laborum','suscipit'),(1,'nam','minus'),(15,'numquam','mollitia'),(3,'perferendis','rem'),(17,'qui','ducimus'),(5,'rerum','fugit'),(12,'sunt','omnis'),(13,'tempora','sapiente'),(14,'unde','aut'),(10,'unde','sunt'),(8,'voluptatem','praesentium');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Labore doloremque et et sit expedita velit. Dolor quisquam dolorem quia aut. Reprehenderit ut dignissimos nobis sit necessitatibus.','enim',0,NULL,'1971-04-02 04:15:50','1972-09-21 09:20:38'),(2,2,2,'Eveniet aut est et quis assumenda ea. Accusantium ut nulla sint magnam impedit quasi perferendis. Odit quia vel totam est.','id',1702,NULL,'1990-12-08 05:56:21','1981-03-05 04:31:09'),(3,3,3,'Autem doloremque qui ut culpa. Vero quam sapiente atque autem error. Quas delectus in ut.','et',4492920,NULL,'1974-03-27 04:16:36','2005-01-09 20:32:09'),(4,4,4,'Ut iste neque facilis at eaque. Dolorem autem ratione amet iusto dolore et. Mollitia sint dicta velit perspiciatis error molestiae.','nostrum',186148,NULL,'1977-08-11 04:24:57','2010-06-11 06:26:38'),(5,1,5,'Amet dolorum ex amet voluptate at quisquam. Corrupti accusantium sapiente et delectus. Libero molestiae laborum dignissimos praesentium et. Sunt distinctio deleniti sed itaque.','vitae',31,NULL,'2015-11-13 14:05:33','2015-12-24 20:02:38'),(6,2,6,'Doloremque perspiciatis id ratione cum quo. Et veniam tempora quasi amet qui et voluptates. Eligendi voluptas aut sed odio eum. Aut saepe provident sit officiis veniam.','et',48498048,NULL,'1991-01-16 19:37:29','2001-07-06 02:14:11'),(7,3,7,'Adipisci sit voluptatibus deleniti. Repellat quae non incidunt dolorum quo laboriosam. Illum dolores error eum nobis voluptatem alias veritatis. Nemo consequuntur accusamus facilis distinctio est dolores.','quod',0,NULL,'1976-10-09 02:53:36','1983-01-13 13:00:35'),(8,4,8,'Facere sint placeat voluptatum aut. Sint ut alias ipsum voluptas est. Dolores enim deleniti qui non architecto ut cupiditate. Omnis rerum voluptatem et odit. Et dolore consequuntur repudiandae blanditiis vitae.','dolorem',0,NULL,'1983-02-26 23:47:52','2015-05-28 03:10:44'),(9,1,9,'Aspernatur temporibus unde delectus ea. Temporibus aut atque suscipit voluptate. Eveniet distinctio sint dolores optio laborum odio sit. Maxime et explicabo id voluptatem.','labore',354137827,NULL,'1997-07-10 03:20:26','2002-04-16 09:02:39'),(10,2,10,'Autem autem maiores nulla ratione ex. Ea voluptatibus omnis aperiam atque et nesciunt. Nihil ipsum qui eos unde dicta error.','dolor',958,NULL,'1992-09-10 01:25:11','2003-01-01 05:59:55'),(11,3,11,'Quia et officia molestiae occaecati illo esse. Eos ea consectetur temporibus corrupti et nihil sunt. Doloremque sed voluptas et eum. Molestiae dolor non ut enim inventore doloremque officia.','quia',8046,NULL,'2021-05-28 20:31:34','2010-10-04 23:58:11'),(12,4,12,'Qui quas possimus accusantium vel unde quidem dolorem. Ea officiis ea eius quibusdam.','praesentium',0,NULL,'2003-11-06 18:31:34','1982-02-04 18:23:27'),(13,1,13,'Nihil repudiandae non eius dolor. Rerum neque in atque. Ducimus recusandae eligendi rerum. Sed eum et qui.','commodi',408490348,NULL,'1985-11-15 17:35:55','2002-03-20 18:54:02'),(14,2,14,'Quas sit ut sit. Vel nostrum quia qui et officia enim dolorum. Et consequatur quia inventore porro facere unde optio architecto.','nihil',77,NULL,'2006-04-27 01:40:18','1974-11-15 18:09:44'),(15,3,15,'Laborum quibusdam ipsum enim at eos. Inventore ut odit vero fugit. Non atque nobis qui qui sed recusandae.','numquam',241778,NULL,'1987-07-21 01:23:54','2001-10-21 11:06:05'),(16,4,16,'Et adipisci ducimus quidem. Atque omnis sed perspiciatis laboriosam.','et',41967,NULL,'1979-11-08 22:06:34','1981-08-06 02:34:01'),(17,1,17,'Ut accusantium quibusdam quia et commodi dolorem. Consequatur consequuntur id corrupti est magni voluptatem. Excepturi rerum itaque molestiae. Velit adipisci minus asperiores dolorum esse non alias.','et',65276160,NULL,'2007-05-13 03:05:06','2011-01-12 04:48:37'),(18,2,18,'Harum ut ullam earum voluptatum ab ullam voluptatem consequatur. Ea a et enim repellat nisi. Corporis voluptas esse nobis magnam numquam quo. Et quia aut nemo hic repellat aut.','laborum',19086612,NULL,'1996-06-22 05:23:42','1980-01-07 06:07:38'),(19,3,19,'Et voluptatem aut beatae debitis. Et non labore quod expedita tempore alias. Distinctio et voluptatem fugiat dolorem et fugit. Quae quasi quia iure enim laboriosam.','repellat',2894,NULL,'1991-02-27 18:07:45','1989-06-29 05:15:06'),(20,4,20,'Quia corrupti dolores aliquid odit et quis quaerat et. Odit fuga aliquam ipsam quod qui. Autem omnis tenetur incidunt suscipit dicta.','excepturi',8819049,NULL,'1972-11-12 12:18:00','2002-04-18 06:18:20'),(21,1,21,'Possimus non tenetur quibusdam. Quia aperiam et eos itaque doloremque. Incidunt quaerat possimus quibusdam ipsum sed aut consequatur.','sunt',0,NULL,'2002-09-18 04:44:04','2021-01-01 18:32:53'),(22,2,22,'Explicabo nemo at natus repellat quis et. Veritatis minima atque numquam eaque occaecati. Corporis quasi quos deserunt praesentium ipsum commodi perferendis. Quos officia quaerat velit error sequi beatae. Facilis et ut voluptas voluptas qui doloremque labore.','mollitia',3480,NULL,'1976-05-19 18:25:06','1983-07-11 13:07:47'),(23,3,23,'Sequi ab dicta officiis esse. Deserunt sit illum sequi laboriosam. Voluptate quia provident cupiditate iure aperiam expedita officia inventore.','inventore',543,NULL,'1971-10-08 09:46:21','1976-01-01 12:11:07'),(24,4,24,'Eveniet ut et nisi sunt culpa. Minus possimus placeat natus ea facilis cumque minima. Dolor voluptas asperiores aliquam maiores. Eos magnam velit dolorum dolorum eum illo. Dolor qui sit non mollitia.','amet',38,NULL,'1973-04-29 21:09:00','1982-09-06 23:12:15'),(25,1,25,'Omnis eum eveniet beatae nihil recusandae. Minus eos et culpa. Omnis necessitatibus excepturi voluptas.','ab',224,NULL,'2015-05-06 13:00:13','1971-12-11 23:26:43'),(26,2,26,'Perferendis pariatur quae amet. Numquam nostrum autem repellat ab sint. Quia dicta nisi magni error et neque. Nobis laboriosam molestias accusamus deleniti.','consequatur',0,NULL,'2022-07-26 17:41:58','1988-10-31 13:05:18'),(27,3,27,'Aut sed soluta eos ut. Veniam quia quo sequi quidem ut magni autem. Sed suscipit et iure autem impedit enim a. Officiis sequi eum tenetur et necessitatibus.','vitae',267,NULL,'1991-05-31 17:30:06','1976-06-05 04:41:43'),(28,4,28,'Eum adipisci inventore eum quaerat quisquam eveniet cumque iusto. Consectetur voluptate quia corrupti error. Ipsam et ullam sequi possimus. Laudantium et suscipit totam nobis.','voluptas',76510366,NULL,'1985-11-29 04:15:44','2003-03-02 21:59:26'),(29,1,29,'Neque exercitationem magnam dolorum. Fuga aspernatur adipisci sed quam qui nostrum. Quis nobis et reprehenderit inventore.','occaecati',1323,NULL,'2008-08-06 18:42:55','1989-08-15 19:05:05'),(30,2,30,'Cum voluptas dolores ea dolor cupiditate. Quia odit et totam. Minima ipsa tempore magnam.','quidem',13690,NULL,'1996-04-24 17:54:20','2018-05-07 05:37:29');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'consectetur','2003-06-28 20:11:19','1987-04-11 06:53:45'),(2,'deserunt','2019-11-13 14:43:40','2017-08-17 05:23:52'),(3,'nihil','2008-09-22 21:55:10','2020-02-12 17:16:53'),(4,'quis','2018-01-08 13:19:08','1986-07-24 13:46:10');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,78,9,'Ab ipsa corporis tempora quos. Consequuntur voluptatem voluptatem et rem minus. In atque et voluptas.','2013-07-20 12:05:03'),(2,74,82,'Corrupti assumenda qui architecto officiis qui. Asperiores id dignissimos sint commodi voluptatem officiis rerum. Eum sit mollitia sit ut excepturi porro.','2010-07-03 07:50:35'),(3,37,65,'Accusamus impedit quo hic est error qui ut. Aut iusto qui nobis qui iusto. Hic voluptas ut fuga quia. Sapiente ut at magni ex velit deserunt eveniet voluptatem.','2001-04-22 23:54:08'),(4,59,15,'Illum tempora maxime esse perspiciatis repellendus. Harum ipsa voluptatum facilis iste officia. Officia quasi est dolores.','1985-07-08 22:39:02'),(5,50,29,'Et voluptates et vel facilis molestiae. Autem ut ut exercitationem ducimus ut. Dolores rerum nulla necessitatibus sint quis corporis.','1992-09-20 13:23:01'),(6,34,74,'Consequuntur eum qui nam quod aut. Et est aut accusantium illum laudantium. Earum dignissimos numquam porro officiis.','2012-05-23 12:28:07'),(7,15,4,'Non voluptatum qui nihil hic qui totam veniam culpa. Quod molestiae optio molestiae. Ad est deserunt nihil est qui iste. Consequatur et quaerat id repellendus.','1999-02-25 11:36:43'),(8,72,15,'Occaecati et corrupti animi. Ex deserunt esse animi quaerat architecto aliquam. Omnis est velit animi qui repellat.','2003-06-16 08:26:09'),(9,49,54,'Optio at veritatis occaecati ut et dolore voluptas quia. Et voluptatem dolorem ut assumenda. Accusantium ea ducimus velit alias sit ad. Aliquam non dolores expedita nulla modi voluptates.','1989-10-09 10:35:01'),(10,87,61,'Eum quas quod nihil ullam similique ut. Quod est dolore doloribus. Culpa veniam maiores architecto.','1977-05-06 14:42:00'),(11,39,66,'Et assumenda rerum similique. Corporis velit eius occaecati rerum a ipsum. Culpa doloremque dolorum magnam omnis adipisci. Unde saepe error velit.','2016-05-13 07:04:24'),(12,59,84,'Non quasi harum tempora qui. Odio voluptates non commodi corporis atque unde. Est rem eum modi quasi.','1998-02-01 22:06:41'),(13,90,53,'Sapiente ut nisi aut rerum repudiandae debitis deserunt. Pariatur sint veniam eligendi molestias ut inventore sint. Eveniet et libero sit. Placeat veritatis esse amet nobis nihil.','2007-06-01 03:41:21'),(14,83,27,'Accusamus asperiores nobis magnam tenetur perspiciatis pariatur. Unde tempora nisi quisquam nisi incidunt. Quae ipsum porro reiciendis quis non voluptas. Consequatur et at ea fugit consequatur tempore.','2016-07-06 13:53:53'),(15,39,88,'Odio totam perferendis natus eos. Expedita vel ut vitae eligendi ex sed eos.','1984-03-07 03:22:24'),(16,23,17,'Laudantium hic excepturi in aut. In quia blanditiis nemo atque consequatur. Ipsam tempore dolor deserunt saepe quod praesentium.','1973-05-28 20:28:29'),(17,96,97,'Est qui neque enim dolores. Id sunt eaque corporis inventore. Officia omnis esse fugiat facilis.','1979-05-29 06:11:54'),(18,99,32,'Sit ipsa labore id dignissimos. Qui voluptates nesciunt eum ipsa nobis sunt. Placeat ratione possimus et sunt amet occaecati nam.','1993-01-21 07:33:37'),(19,61,58,'Delectus reiciendis corrupti nisi dolorem nesciunt laboriosam. Omnis aliquid a voluptatum perferendis. Odit velit ad quis et reprehenderit enim est voluptate. Excepturi et ut quaerat.','1976-10-18 06:52:06'),(20,47,10,'At rerum corrupti accusamus suscipit et quo mollitia. Minus vel voluptate necessitatibus neque dolores accusantium consequatur. Ut eius consequatur vel omnis.','1986-03-24 13:09:21'),(21,86,80,'Ut consequatur ipsum sit iusto sit aut et. Id eos quo dolore quos quod quae. Cum eaque qui sed aliquam sit temporibus. Inventore rerum aspernatur magnam assumenda et.','2011-05-01 16:16:19'),(22,83,1,'Voluptatem rerum fugit dicta commodi dolorem. Repudiandae eius voluptatum occaecati suscipit maiores labore. Architecto fugit accusantium dolor optio temporibus. Quo fugiat illo suscipit quae adipisci omnis accusamus.','1983-10-09 08:50:01'),(23,84,54,'Non eos molestiae voluptas. Sunt aperiam voluptas rerum facere est iusto eum. Illum in enim unde aut ipsa quos in. Qui aut aliquid consequatur saepe omnis distinctio ea. Nihil laudantium error et eum nostrum eligendi voluptas.','1992-07-11 10:08:15'),(24,16,33,'Suscipit iure nulla odit autem rerum fugiat magni. Dolores aut iure dolorem qui quam voluptatem. Repellat veritatis iste perferendis exercitationem in saepe. Distinctio dignissimos ratione voluptas mollitia repellat et.','2016-11-28 06:11:23'),(25,8,2,'Rerum est ut exercitationem et. Amet rem aliquam reiciendis ea ut quas earum. Quam quis dolorem itaque commodi aliquam molestiae aperiam.','2017-07-30 10:55:54'),(26,94,47,'Quis asperiores saepe corporis doloribus inventore ea illum veniam. Et totam unde accusantium. Itaque id itaque est voluptate consectetur qui. Quas blanditiis unde sequi esse enim qui quae. Aut sed omnis ab odio qui fugit voluptas.','2019-12-28 22:40:13'),(27,68,52,'Repellendus doloribus a et tempore dolore deleniti. Qui enim omnis et. Nostrum alias animi et ut vero quis dicta quisquam. Rerum tempora laudantium reiciendis non.','2001-07-26 22:45:41'),(28,30,57,'Provident repellat omnis hic et voluptate. Officiis sunt dolorem iste dolore. Ea voluptatum ut impedit facilis quo est qui sint. Ut ipsam iusto et a qui.','2010-08-18 19:11:22'),(29,4,13,'Nesciunt iusto aliquam sed omnis earum cum soluta. Sit eum minus est. Provident explicabo et placeat minima repudiandae deleniti blanditiis quo. Aut repudiandae qui vero explicabo et reiciendis.','1997-06-06 08:25:58'),(30,84,43,'Laborum aspernatur aut blanditiis nihil quas qui. Et commodi perferendis nihil voluptatem dolorem quia. Asperiores rerum earum qui. Laboriosam non neque accusantium id ut.','2010-07-15 18:54:19'),(31,100,6,'Autem non quos blanditiis quod nobis perspiciatis officia. Omnis neque voluptate vero consequatur tempora. Ut ut distinctio facilis deleniti.','1970-04-13 17:14:39'),(32,60,95,'Quidem facere est repellat vero. Quia et aliquid tempore voluptatem quis et nihil. Aut qui distinctio repudiandae porro. Quod aut ut nam consequatur.','1992-08-11 02:35:24'),(33,3,58,'Labore est natus cupiditate autem sed. Vitae ratione qui consequuntur rerum veniam minus et. Modi nihil sint quibusdam et. Odio ut atque et.','1987-03-13 02:12:38'),(34,27,63,'Sint rem iure ex voluptas sunt voluptate. Doloribus consequatur dolores non commodi consectetur.','1993-03-11 00:24:08'),(35,15,74,'Architecto dolor accusamus rerum dolores. Quia rerum possimus quasi quae voluptates. Ipsam veritatis eum commodi quaerat et quia quia. Sint cumque eius aut.','2018-03-17 05:25:49'),(36,73,1,'Dolor molestiae at rerum ipsum doloremque sit odio veniam. Nesciunt eaque odit ullam eligendi nihil atque. Eos numquam corporis perferendis inventore provident qui. Delectus vel voluptatibus sequi quidem fugit aperiam molestiae odio.','1974-12-11 11:09:39'),(37,53,55,'Molestiae recusandae corporis itaque ad quam repellat aliquid. Accusantium est quia possimus voluptas. Non quia quidem possimus consequatur eum non quia.','1970-03-02 02:15:02'),(38,1,37,'Ea magnam aut est quam voluptates numquam. Sit hic atque consectetur quam est occaecati molestias. Ut asperiores esse accusamus sint exercitationem pariatur dolor atque.','2009-04-04 00:23:47'),(39,9,16,'Quia soluta est sit. Aut neque dolore fuga animi. Autem iure sint accusamus non culpa est.','2012-07-02 06:31:15'),(40,69,17,'Totam quia doloremque itaque veniam. Voluptas quis vel dicta nostrum dolore omnis atque. Cumque veritatis et optio laborum deserunt molestias dolorum. Ad ea vitae ut reiciendis soluta culpa.','2017-01-21 02:38:05'),(41,18,62,'Illum ut alias voluptate neque id dolorem maxime. Necessitatibus vel repudiandae et modi. Sequi est dolore minima possimus incidunt culpa. Rerum mollitia officia aut.','2001-09-19 03:07:37'),(42,63,85,'Est provident autem quibusdam totam alias magnam mollitia unde. Aut ab ex ipsum. Provident non pariatur voluptate velit.','1999-12-25 20:13:12'),(43,13,93,'Ut praesentium laudantium praesentium vitae rerum est rerum. Voluptatem fugit et nisi. Possimus consequuntur minima in. Labore saepe enim qui et voluptas.','1974-08-18 16:22:43'),(44,42,17,'Aperiam quo dolores dolorem quisquam neque quis cum. Voluptas voluptatum ea eaque aliquam hic adipisci. Molestiae aut ea repudiandae ea totam maiores rem quia. Odit tempore non quasi voluptate.','2004-09-19 19:02:09'),(45,5,25,'Nostrum unde ratione ut adipisci provident veniam. Cum tempora consequatur voluptas eaque. Voluptates consequatur nisi laborum quia sed at. Vero quas nisi aspernatur quia accusantium animi. Exercitationem ad molestias occaecati animi tempora.','1992-02-26 05:47:08'),(46,60,5,'Sit laboriosam quos hic rerum aut quisquam aut distinctio. Non atque ea autem recusandae qui numquam. Inventore aliquid fugit id et eaque.','1976-07-18 18:16:41'),(47,31,19,'Animi facilis enim sed et. Ut incidunt laudantium modi. Aspernatur aut consequatur rerum dolorem eligendi laboriosam harum. Deleniti veniam necessitatibus accusamus sed aliquam eum pariatur.','1990-08-12 23:17:46'),(48,100,33,'Eligendi similique debitis aut consequatur qui accusamus molestiae. Et alias consequatur voluptas animi. Impedit odit est autem dolore eaque minima voluptatem. Doloremque necessitatibus iusto repellat veritatis et voluptas explicabo.','1997-03-09 19:17:24'),(49,77,26,'Rerum nesciunt non quia in dolore amet. Sint unde adipisci autem et. Dolorem enim fugiat non nihil laborum ea porro. Eius earum velit voluptatibus eius itaque nam eaque.','1995-10-08 23:47:32'),(50,95,91,'Doloremque fuga aspernatur quae quas qui recusandae. Dolorem omnis atque et. Nulla vitae alias doloremque. Tenetur sunt tempora eligendi.','1979-08-24 10:20:48'),(51,99,68,'Cum voluptatem animi quo aut sed aut dolorem est. Cupiditate corrupti est dolor nemo.','2016-01-30 21:00:56'),(52,92,52,'Ea quas maiores officiis perferendis. Excepturi neque voluptatem occaecati ea ratione est. Dignissimos nam sint enim temporibus fuga. Et ut placeat error tenetur. Dolor voluptatem in nemo ut voluptates excepturi quod.','2019-01-07 10:34:42'),(53,22,92,'Saepe porro dolore laudantium quo. Et et odio odio alias. Nihil et minus pariatur aut. Nihil ut reprehenderit facere sunt ullam facere.','1987-11-16 15:49:37'),(54,88,31,'Voluptatem eaque reiciendis quos labore. Nemo dolorem sed voluptatem ratione doloribus maiores. Quae quia officia ratione esse. Sed qui aut vitae quibusdam optio enim sit.','1979-01-29 10:34:04'),(55,7,57,'Dolores sapiente blanditiis eos aut ab. Id ea adipisci impedit recusandae saepe at.','1970-01-24 01:41:19'),(56,48,24,'Magni et omnis est in occaecati ex alias error. Eius distinctio fuga occaecati. Deserunt dicta omnis quis explicabo error. Harum cumque facilis neque omnis quia dolores possimus.','1997-08-09 23:11:20'),(57,18,10,'Ea dignissimos voluptas esse est sequi earum maxime. Vitae maxime ea in odit et. Ad et nihil molestiae omnis qui.','1998-04-03 15:15:41'),(58,9,31,'Iste et placeat voluptatum tenetur nihil voluptas mollitia. Ullam quis facilis rem dolores laboriosam ut et saepe. Nulla ipsa tempore vel.','2014-11-09 12:43:47'),(59,3,50,'Delectus qui facilis sint velit aut est. Aliquam corrupti porro ut numquam earum eum nam. Saepe adipisci aut culpa ipsum provident quam.','2019-02-03 19:37:34'),(60,48,8,'Dolorum illo mollitia modi sit. Ipsum minima culpa libero. Dolorum vel dicta aut qui omnis sit. Quia iure nisi quaerat.','1986-05-14 03:47:08');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `downloaded_at` datetime DEFAULT current_timestamp() COMMENT 'когда добавлено',
  `added_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'в случае, если пользователь загружает музыку извне',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `music_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES (1,49,'1974-02-10 20:29:11','1999-10-04 04:36:28'),(2,75,'1995-06-21 20:02:47','1971-10-21 16:20:17'),(3,21,'1972-03-20 04:11:17','2005-08-08 02:10:13'),(4,48,'1981-05-27 23:14:43','2020-08-29 13:41:44'),(5,66,'2002-03-11 01:12:43','2003-07-24 02:54:19'),(6,55,'1998-04-26 02:30:36','1976-05-17 05:25:04'),(7,37,'1988-08-18 21:45:35','1972-08-25 13:35:41'),(8,25,'2008-12-17 22:19:14','1987-06-10 06:03:23'),(9,8,'1989-07-07 17:54:14','2019-11-04 01:38:08'),(10,82,'1985-08-04 01:27:32','1971-07-03 14:31:29'),(11,16,'1973-01-21 20:27:39','1998-09-28 14:05:40'),(12,82,'1987-01-07 02:28:49','1972-07-16 03:48:36'),(13,92,'1996-02-10 14:35:59','1974-02-03 14:11:17'),(14,87,'2000-12-06 16:19:52','1982-08-16 13:13:19'),(15,58,'2019-04-29 11:21:37','2004-07-21 01:44:36'),(16,7,'1974-07-10 20:30:12','2002-01-10 20:09:02'),(17,11,'2013-05-06 18:47:54','2014-06-07 21:22:36'),(18,2,'2010-08-27 21:39:46','2017-07-02 20:19:51'),(19,33,'1979-02-24 15:24:23','1994-06-05 16:50:02'),(20,18,'1974-08-21 23:36:10','2020-02-12 14:43:22'),(21,47,'2006-01-15 07:35:13','2020-11-17 01:55:47'),(22,98,'2016-02-01 07:55:48','2006-03-06 23:19:27'),(23,14,'1999-03-29 01:55:35','1999-04-10 12:44:16'),(24,43,'1980-08-09 08:37:06','2007-11-20 09:49:10'),(25,50,'1988-03-15 15:23:24','2008-07-31 09:14:12'),(26,25,'2018-03-15 00:11:16','1994-03-17 17:33:09'),(27,22,'1986-06-27 07:32:34','2015-03-23 18:44:07'),(28,86,'2009-05-10 14:47:33','2017-09-29 19:05:27'),(29,29,'2009-10-27 21:22:36','1994-05-26 08:08:45'),(30,79,'2021-11-16 09:14:29','2022-02-08 21:05:44'),(31,68,'1985-01-19 19:14:21','2000-01-30 05:47:36'),(32,78,'1976-07-29 22:44:17','2014-09-04 15:25:00'),(33,54,'2007-09-05 00:51:21','1985-02-20 11:06:36'),(34,88,'2008-06-15 16:37:23','1978-10-10 10:18:01'),(35,26,'2006-08-14 04:41:34','2001-06-23 04:36:30'),(36,20,'2007-02-23 09:07:27','1981-02-18 14:18:44'),(37,43,'1994-12-13 05:23:23','1994-01-08 02:12:19'),(38,62,'1976-03-20 04:40:36','2014-10-13 09:38:11'),(39,44,'2015-09-12 20:50:35','1983-06-23 16:02:06'),(40,50,'2008-11-23 17:40:43','2000-04-26 09:13:03'),(41,43,'2008-11-30 08:37:52','2017-10-06 06:12:24'),(42,59,'2014-02-15 00:20:29','1997-04-26 06:38:51'),(43,32,'1973-07-17 13:35:47','1975-09-19 00:41:13'),(44,35,'2019-09-29 19:40:22','1996-04-10 07:13:25'),(45,46,'2014-11-20 19:36:27','2004-06-10 02:36:16'),(46,89,'1998-03-22 21:20:37','2014-09-23 12:26:02'),(47,41,'1996-07-04 18:45:27','1974-11-11 22:18:59'),(48,57,'1999-08-02 03:34:26','2012-06-11 23:32:17'),(49,91,'2016-04-25 13:08:09','2022-09-06 23:51:40'),(50,74,'1997-12-17 20:03:01','1996-09-29 14:22:49');
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'distinctio',1),(2,'repudiandae',2),(3,'voluptas',3),(4,'voluptatem',4),(5,'dignissimos',5),(6,'esse',6),(7,'exercitationem',7),(8,'sunt',8),(9,'qui',9),(10,'molestiae',10),(11,'rerum',11),(12,'inventore',12),(13,'ullam',13),(14,'autem',14),(15,'amet',15),(16,'qui',16),(17,'corrupti',17),(18,'incidunt',18),(19,'velit',19),(20,'et',20),(21,'unde',21),(22,'enim',22),(23,'qui',23),(24,'excepturi',24),(25,'voluptatem',25),(26,'nihil',26),(27,'occaecati',27),(28,'nobis',28),(29,'id',29),(30,'odit',30),(31,'omnis',31),(32,'ut',32),(33,'quibusdam',33),(34,'cumque',34),(35,'consequatur',35),(36,'similique',36),(37,'amet',37),(38,'hic',38),(39,'animi',39),(40,'tempora',40);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,17,1),(2,28,2),(3,15,3),(4,13,4),(5,31,5),(6,5,6),(7,10,7),(8,35,8),(9,27,9),(10,11,10),(11,36,11),(12,30,12),(13,15,13),(14,24,14),(15,8,15),(16,12,16),(17,30,17),(18,32,18),(19,18,19),(20,33,20),(21,32,21),(22,12,22),(23,11,23),(24,34,24),(25,28,25),(26,23,26),(27,27,27),(28,9,28),(29,32,29),(30,7,30);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_photo_id` (`photo_id`),
  CONSTRAINT `fk_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'f','1972-10-10',1,'1992-02-25 04:02:51',NULL),(2,'f','1975-10-06',2,'2016-10-04 18:54:17',NULL),(3,'f','2001-11-09',3,'2022-08-22 13:03:36',NULL),(4,'f','1997-12-03',4,'1975-10-05 23:22:17',NULL),(5,'f','1980-01-17',5,'1970-08-23 23:05:39',NULL),(6,'m','1976-04-21',6,'2007-06-30 18:36:36',NULL),(7,'f','1983-09-04',7,'2001-12-13 19:53:09',NULL),(8,'m','2015-11-04',8,'1996-11-03 18:35:52',NULL),(9,'m','2018-09-26',9,'2000-03-22 00:44:28',NULL),(10,'f','2017-12-30',10,'1989-04-24 00:04:29',NULL),(11,'m','1992-07-24',11,'1981-05-04 21:36:54',NULL),(12,'m','2013-09-26',12,'1979-03-12 17:25:19',NULL),(13,'m','1995-04-12',13,'1988-12-14 11:05:38',NULL),(14,'f','1975-01-24',14,'2013-10-15 10:44:02',NULL),(15,'f','1977-02-22',15,'2020-01-28 00:32:04',NULL),(16,'m','2012-09-07',16,'2007-01-18 02:12:31',NULL),(17,'m','2005-01-23',17,'1984-11-22 21:33:48',NULL),(18,'f','2012-01-24',18,'2011-06-18 17:04:08',NULL),(19,'f','1975-11-07',19,'1975-10-01 05:41:40',NULL),(20,'f','1971-12-10',20,'2005-08-31 23:57:17',NULL),(21,'m','1984-01-12',21,'2012-06-27 10:29:54',NULL),(22,'m','1999-09-05',22,'1984-10-28 03:57:52',NULL),(23,'f','2020-06-16',23,'1972-04-23 08:28:04',NULL),(24,'m','1983-04-10',24,'1971-05-01 16:45:42',NULL),(25,'f','1995-11-26',25,'2014-04-21 21:22:20',NULL),(26,'f','1981-11-16',26,'1987-06-29 13:35:59',NULL),(27,'m','2012-09-10',27,'2009-11-15 10:08:49',NULL),(28,'f','2017-09-15',28,'1970-01-02 12:12:25',NULL),(29,'f','1993-11-26',29,'1989-11-24 03:28:28',NULL),(30,'f','1984-02-21',30,'1994-04-21 03:33:21',NULL),(31,'f','2015-06-16',1,'1979-09-06 03:34:40',NULL),(32,'m','2019-11-02',2,'1980-04-25 10:20:26',NULL),(33,'f','2014-07-31',3,'2013-12-23 04:19:49',NULL),(34,'f','1994-02-12',4,'1986-05-09 12:10:42',NULL),(35,'f','2011-01-20',5,'1991-04-21 10:12:31',NULL),(36,'f','2008-09-08',6,'1972-12-08 01:03:51',NULL),(37,'f','1976-04-07',7,'2009-08-28 21:02:50',NULL),(38,'f','2011-05-14',8,'1989-08-04 04:05:28',NULL),(39,'m','1979-09-01',9,'2009-12-27 23:56:22',NULL),(40,'m','1992-10-23',10,'1993-05-30 01:17:38',NULL),(41,'m','1998-10-21',11,'2003-09-16 20:23:24',NULL),(42,'f','1992-03-24',12,'1992-05-24 08:28:40',NULL),(43,'f','2001-04-27',13,'1988-07-14 21:14:45',NULL),(44,'f','1999-07-16',14,'2012-09-30 10:37:46',NULL),(45,'m','2006-08-25',15,'1977-06-21 22:23:08',NULL),(46,'f','2006-08-15',16,'1972-03-08 00:22:48',NULL),(47,'m','2008-06-23',17,'2018-07-26 03:52:28',NULL),(48,'m','1976-09-03',18,'2012-02-09 02:51:27',NULL),(49,'f','2021-06-01',19,'1998-06-11 09:24:37',NULL),(50,'m','1988-09-02',20,'1995-07-22 07:33:09',NULL),(51,'m','1974-04-17',21,'1988-04-17 10:41:44',NULL),(52,'m','1996-10-29',22,'1994-01-30 14:09:03',NULL),(53,'m','2007-10-10',23,'2007-06-15 07:03:52',NULL),(54,'m','2012-10-16',24,'2020-08-15 02:36:44',NULL),(55,'f','2017-08-06',25,'2018-05-01 20:45:36',NULL),(56,'f','2018-09-10',26,'2017-03-31 09:36:39',NULL),(57,'f','1972-09-04',27,'1997-08-27 21:26:39',NULL),(58,'m','1973-08-23',28,'1970-03-09 01:20:20',NULL),(59,'m','1974-03-27',29,'2006-01-26 13:54:23',NULL),(60,'f','2019-04-02',30,'2008-05-25 21:13:44',NULL),(61,'f','1983-08-21',1,'1999-10-04 15:54:05',NULL),(62,'f','1983-09-16',2,'2018-09-02 02:21:45',NULL),(63,'m','1993-12-09',3,'2008-07-10 20:18:07',NULL),(64,'f','1979-11-18',4,'1976-04-24 03:08:17',NULL),(65,'m','2001-02-19',5,'2003-04-14 13:10:10',NULL),(66,'f','2022-09-09',6,'2008-11-14 20:31:37',NULL),(67,'f','2016-01-14',7,'1971-12-28 08:51:23',NULL),(68,'f','1972-06-26',8,'1986-02-19 22:42:50',NULL),(69,'f','2012-11-17',9,'1991-09-18 17:21:37',NULL),(70,'f','2015-01-06',10,'1975-01-08 15:47:41',NULL),(71,'m','2005-07-14',11,'1985-01-28 05:46:34',NULL),(72,'m','1999-08-08',12,'2018-03-15 22:51:04',NULL),(73,'m','2016-04-05',13,'1978-07-17 17:30:12',NULL),(74,'f','1995-02-25',14,'2014-04-15 14:58:38',NULL),(75,'m','2000-11-01',15,'2014-11-02 14:36:52',NULL),(76,'m','2004-02-28',16,'2017-08-24 06:01:15',NULL),(77,'m','2016-07-20',17,'1983-07-09 14:43:45',NULL),(78,'f','2008-04-24',18,'1994-08-11 09:19:15',NULL),(79,'m','1985-06-09',19,'1977-12-05 02:13:23',NULL),(80,'m','2001-07-21',20,'2003-04-08 11:08:54',NULL),(81,'m','1997-06-24',21,'2019-06-21 05:19:41',NULL),(82,'f','1989-04-11',22,'1971-08-21 03:47:55',NULL),(83,'m','1980-08-13',23,'2019-08-15 09:21:51',NULL),(84,'f','2002-08-08',24,'2001-04-16 22:07:44',NULL),(85,'f','1975-06-07',25,'1993-12-08 13:51:25',NULL),(86,'m','1975-08-08',26,'1997-03-16 05:09:54',NULL),(87,'m','2013-11-19',27,'2018-11-10 05:42:13',NULL),(88,'m','2016-05-09',28,'1976-12-09 22:08:16',NULL),(89,'f','2001-12-22',29,'2002-12-14 19:04:05',NULL),(90,'f','2015-03-06',30,'1985-01-13 07:42:12',NULL),(91,'f','1992-11-06',1,'1985-05-04 19:26:13',NULL),(92,'m','1990-10-17',2,'2013-08-15 23:48:20',NULL),(93,'m','1998-10-31',3,'1993-02-08 20:46:28',NULL),(94,'f','1995-04-20',4,'2012-04-05 07:31:31',NULL),(95,'f','2007-08-16',5,'1979-10-03 04:52:40',NULL),(96,'f','2012-07-24',6,'1992-03-12 21:44:23',NULL),(97,'f','2000-02-27',7,'1979-01-24 13:43:31',NULL),(98,'m','1971-09-04',8,'2021-08-20 01:39:34',NULL),(99,'f','1993-11-20',9,'2018-06-20 18:24:40',NULL),(100,'m','1990-06-13',10,'2015-06-27 07:44:02',NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_education`
--

DROP TABLE IF EXISTS `user_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_education` (
  `user_id` bigint(20) unsigned NOT NULL,
  `education_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`education_id`),
  KEY `education_id` (`education_id`),
  CONSTRAINT `user_education_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_education_ibfk_2` FOREIGN KEY (`education_id`) REFERENCES `education` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_education`
--

LOCK TABLES `user_education` WRITE;
/*!40000 ALTER TABLE `user_education` DISABLE KEYS */;
INSERT INTO `user_education` VALUES (6,5),(6,10),(13,1),(18,8),(19,4),(29,4),(34,5),(53,1),(53,5),(55,9),(56,7),(61,5),(66,9),(71,7),(71,9),(72,3),(74,4),(80,2),(81,8),(82,10),(83,10),(88,3),(95,3),(97,3),(100,7);
/*!40000 ALTER TABLE `user_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_location`
--

DROP TABLE IF EXISTS `user_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_location` (
  `user_id` bigint(20) unsigned NOT NULL,
  `location_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`location_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `user_location_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_location_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_location`
--

LOCK TABLES `user_location` WRITE;
/*!40000 ALTER TABLE `user_location` DISABLE KEYS */;
INSERT INTO `user_location` VALUES (1,8),(2,3),(2,7),(3,1),(5,8),(7,10),(11,17),(12,16),(15,5),(18,4),(18,8),(20,12),(27,7),(29,2),(29,7),(33,5),(35,18),(37,1),(39,15),(45,6),(45,19),(47,7),(47,9),(48,17),(50,10),(51,12),(52,8),(54,14),(58,17),(59,11),(64,15),(66,14),(66,17),(66,20),(67,2),(72,16),(75,3),(75,20),(85,11),(85,17),(87,4),(89,11),(91,14),(92,11),(93,5),(93,16),(94,13),(96,11),(99,16),(99,19);
/*!40000 ALTER TABLE `user_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Фамилия',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Filiberto','Veum','jaiden38@example.net','98105ae4477ac4b4598b62da6fb9ebbcfd7ef4ff',97574202142,'\0'),(2,'Rosa','Boehm','miles98@example.org','06ccc045de3cc2c4f67b95f7c9c9de11d59a51c7',96866664814,'\0'),(3,'Alda','Nienow','mohr.brenna@example.org','ba1e1883e9585f459e55e1b47c55d2f3afb4c3b3',91491961806,'\0'),(4,'Taurean','Kris','zieme.jon@example.com','d94e056817ed1382af58ff52a1177dd2adc19450',91819159301,''),(5,'Herman','Hegmann','brad.mills@example.com','5ca92675cd1d737c15a0db91d52c2d682a6e434b',90900531495,'\0'),(6,'Helga','Thiel','nayeli60@example.net','30f3e86e5fb71312b4b4d6595b7a506338f751c7',91573690069,'\0'),(7,'Millie','Hoppe','sophia.murray@example.com','874faa224faaa2b3e366f48c9cdbc51dedd8b5c1',90826087375,''),(8,'Marge','Prosacco','tiara77@example.org','494ec0cda91365b7695d21bcba1abc0ad18b81d5',90479227184,'\0'),(9,'Velma','Will','jakubowski.annabel@example.org','0904af45217b9362f6ad780cc6f7199fb5a89b9d',94497551645,'\0'),(10,'Selmer','Torphy','janae.medhurst@example.org','ed38c41a5fa8f2c75f7bc96ce9abc9854c9ea2ca',94139920805,''),(11,'Elmer','Ratke','erunolfsdottir@example.net','7565d26229de706d45cfc03b65cfd5f6ba470095',91989891581,'\0'),(12,'Cecelia','Homenick','o\'connell.jessie@example.com','d6c835e0b2823d73c70bcb42ede6643ded5c85f9',92510345980,'\0'),(13,'Jennifer','Runte','minnie95@example.net','ec7efacddc691221c56fa5a2631dd170022ab970',96789669909,''),(14,'Branson','Stokes','tremblay.sister@example.net','7e9d7978c08d403567e13ed2c9d6ffefda4e4d2a',99472542446,'\0'),(15,'Nicholas','White','ryley.white@example.com','deddf3a12cae7d36b9c48366e6b70963c58b7c99',94740141949,''),(16,'Margret','Ledner','wiley.kunze@example.org','e783822842c8876c522ef0024494537136661cf1',90017030444,'\0'),(17,'Kurtis','Lind','beatty.london@example.com','d4f2152ab7a5793326330feb6c2199e8d2615867',92902215404,''),(18,'Cathryn','Weissnat','vschaefer@example.net','3249db502bf0896e8b5c84c1614be7a5e6bd8966',91612673659,'\0'),(19,'Dawson','Rempel','monique59@example.org','7a4a134906de62d3723c84559f5c65e561ae262d',99401948418,'\0'),(20,'Linda','Sawayn','vschamberger@example.net','9c8c20a93fe04b460925ce16d5aab8264824a061',97177198984,'\0'),(21,'Milton','Schmitt','lynch.keon@example.org','c9bdf3c3267e750114ac43a27cd6ddc2f6ecb0c8',93551800299,'\0'),(22,'Cloyd','Zieme','fahey.hollie@example.net','c3d2a6f23fb75c65026e972b4ae520b4536d18d7',96157259548,'\0'),(23,'Lera','Morar','leonard76@example.com','2791fc42e92e6e996b1600f391ec4fb6e1c9b336',99906770972,''),(24,'Reva','Kuhlman','sabryna.champlin@example.com','ece1ac4db721a660fc1b829e91ce86e922a2494d',92121946193,''),(25,'Lukas','Wiza','strosin.leonie@example.net','f63c6f791bd76e4a27ba3244c12941493a9edc96',94445421860,''),(26,'Augustine','Rice','twila24@example.org','ccd60ce39d6d20c93d1bc55b8130d191276932d5',99015702553,''),(27,'Sincere','Boehm','kristopher42@example.org','5097c9d6e77686ca19382b165d77e14346d09885',93587865980,''),(28,'Stephania','Ziemann','lfritsch@example.com','15eec4a2900e99fd8c6a1ce48419e85216659cb4',92398898495,'\0'),(29,'Camron','Ebert','jaltenwerth@example.org','a1d13685a68bba1c8706d0e1a392eecef7869aaa',94164477639,'\0'),(30,'Mertie','Jenkins','kohler.monica@example.net','fb359641ffd2779f7d2dcb00048076059eb52c7c',98767949607,''),(31,'Jaquelin','Ondricka','sherman@example.org','2885b8334f69724a91171c93caa1e1bec4c1e75d',91068486344,''),(32,'Lulu','Koepp','trantow.brock@example.org','08bd8db1cdc45fd864221f25ea358ae8e4bcb8d3',98643565460,''),(33,'Hubert','Lynch','altenwerth.therese@example.org','18b60dfdd55df8d61263a60e149cdc83d5aa7a22',96472756334,''),(34,'Rhea','Emard','adolphus.gaylord@example.net','c0ab82ae23e813fde32d00268472801cfa1adb6c',91119087725,'\0'),(35,'Reed','Moore','manley99@example.net','905fb1d4387e92f15fbe58bbbd4128779daf65d6',98853639614,'\0'),(36,'Mohammad','Reynolds','reichel.cecilia@example.org','c6b75a5e4d53a3d8f5778bf62da6e08256e6165c',94249659429,''),(37,'Marlin','McDermott','calista.hansen@example.org','bca8eae96e04d625252e616055266e516041e638',91734859427,''),(38,'Margie','Ankunding','eryn90@example.org','08e8d6f62eb397d522d8701985aa6909c0b05a3c',93609049210,'\0'),(39,'Cecilia','Hickle','emilio36@example.org','c93dbcd3ab3b22f3ebc076d67ad63f8a6d70e86f',92082219050,''),(40,'Frankie','Cremin','mcdermott.leilani@example.org','43ab992e07a3990997b967946b0158c53f499419',93258418666,''),(41,'Dax','Kreiger','nroob@example.net','5462e34831ff7653b09a685dc9246829a61b2b2f',94063199131,''),(42,'Toby','Konopelski','batz.aidan@example.com','0e81fb70d9f924a9c13ff395f466d9f589804397',90524676899,'\0'),(43,'Megane','Kiehn','ellis.cruickshank@example.org','2d6f93e4f5eef5051d440a92181df9a99d6c7d3a',97659533455,'\0'),(44,'Jalyn','Bednar','bradtke.mable@example.org','f4213034778a5ceb90ac7327c6d3ac239f8db72f',99023014175,'\0'),(45,'Alvina','Cole','emerson.murazik@example.org','d7d0747874f60308a0e8e7b3c67636bd7fa2932d',95022746294,'\0'),(46,'Molly','Miller','emard.eusebio@example.com','da0892363a71f562526aaf4ab71bf24a6990c608',98745114383,''),(47,'Patsy','Bergstrom','angelina.powlowski@example.com','b25b389f7b4bffca06dee110880d14ce2505b44f',93976424673,''),(48,'Grayson','Corwin','lionel45@example.com','54865955551745aafe18d1385a14a61801d6ba96',90398324072,'\0'),(49,'Leann','Erdman','lowe.amara@example.com','1c95f09b9c1ef3c2766572ad0e1060d504761983',99108681310,''),(50,'Cristal','Rodriguez','kara.johns@example.org','32224bef7ed5f102f8572192d9698ac39e2b5db5',98849960871,''),(51,'Martine','Kovacek','okunze@example.org','ea07214bd658f0e615839cff9cfa38ed008ba880',91981107044,'\0'),(52,'Ethyl','Rolfson','cyrus.gaylord@example.org','dfcca5ccf77741868c294383765b6dacfb266fc1',96612717386,''),(53,'Ariel','Johnson','gerson90@example.com','f11b48580db72d1b6155053d8b00080475b2f144',96083665646,'\0'),(54,'Lea','Herzog','ally.braun@example.org','e7a83013841775241f07fb4cacc4f5f2ddfc249a',93095078511,''),(55,'Emely','Konopelski','donato.powlowski@example.com','9d60d6abc7044575580601fdbed3db1976197b1e',97601401948,'\0'),(56,'Brigitte','Borer','elijah40@example.com','ea3d04260124dc12618c58374c5f862ef58a8dab',94126438486,''),(57,'Cruz','Johnson','amely.satterfield@example.org','34324b9f77ca44d5c02e402f07ad77ca56c06a7b',95808291805,''),(58,'Daron','Beier','gustave34@example.net','d4dfff91b52739d7f245a55f7e8d00e5a1828a02',90007122508,''),(59,'Jessie','Lubowitz','nlarkin@example.com','162021f6cdbb5a9ecf06cf6d447aa1a7e0602a39',98071548998,'\0'),(60,'Kamryn','Jerde','ila.shanahan@example.com','bbcce1d2fb639ca0ed2b578548ba63715990c8e0',99732253150,''),(61,'Gunner','Kuhic','ellis30@example.com','445302e30f72eb640a57805d2ede74c87e069ae7',99743793769,'\0'),(62,'Cecelia','Hessel','lamar14@example.net','f776431926cd3706267a4d47c54e7d1685aca3b3',94630192203,''),(63,'Geoffrey','Hyatt','jlangosh@example.org','937560b0799f2e1ab616704ebfc48f4c5e2023f0',96265918820,'\0'),(64,'Braxton','Reynolds','rkoelpin@example.org','78dc40f8ee2bfbdac3afe3aaa881e504f29ab7e0',99665563846,'\0'),(65,'Jacinthe','Hilpert','harber.maximus@example.org','25cf832cac9128272d0597de79b2c7ba448fbc55',94767497933,''),(66,'Lori','Kuvalis','madisen76@example.net','f7f713e4eafb8f486953ccbfafa8e595af952dc3',90831078887,'\0'),(67,'Dell','Rohan','hector21@example.org','7ad9cb275965916650f4aff6330935990d556f13',95570350776,''),(68,'Haylie','Cronin','glover.esmeralda@example.org','9ffe92d60b6a02738ee76b11199898be216ab0c5',90584942196,''),(69,'Alysson','Bernhard','arturo.dooley@example.org','ed145aee87daea645deb752bc5419fb6f28b12c7',94250682026,'\0'),(70,'America','Hand','jparisian@example.net','53d66cb88a7ca1766bbd65fda08b9e3655b9bc69',95236742652,'\0'),(71,'Eugenia','White','jude.prosacco@example.net','792159a6e8eeaf70bed728cf80df2d29ca60c375',93619503366,''),(72,'Tressie','Mayer','winston.hauck@example.com','4fd3e5e6e8919e31b3421345ffa8dd8fe5e46c2a',99840636336,''),(73,'Mittie','Klein','weber.molly@example.org','9ddc75da6877a544df7bfadc6c58988658c5b0b6',97381755489,''),(74,'Brisa','King','chaya04@example.net','caa1f2e8296e283ab55155d4a55f1e862ccb41bf',95519584396,''),(75,'Quinton','Kessler','eryn24@example.org','c09d0babe5c001bfc2aa954ea9d62b3c88b59282',98208910891,'\0'),(76,'Misael','Hayes','schumm.sierra@example.org','cf67588a6bb771fb139bc17474f1bb815a356e7d',96820788800,''),(77,'Bethany','Marquardt','cruickshank.dessie@example.com','fd14744bdab22bcb47a7b23cdffad75b242abf22',95183871516,'\0'),(78,'Dwight','Hagenes','kautzer.roderick@example.org','0ed069f2d3d45300d740dcb9b7a413ccac7bf356',96873127844,''),(79,'Juliet','Legros','nickolas.hahn@example.com','c9446c4a8091e62b5ab8b36e7944b92778754d23',95318402692,'\0'),(80,'Amara','King','brooklyn.abbott@example.com','7b272482b3c583d5200ee8c8ea3e22c96dbdf5bb',95158604385,'\0'),(81,'Emelia','Jenkins','isidro.deckow@example.com','08d6119910da82a4d900730c73bb6ce4b5111d29',90900512189,''),(82,'Hans','Wilderman','adelbert00@example.org','90906a3d9cf5bae9571a305836ca9fe786b482b9',91462284527,'\0'),(83,'Garfield','Wintheiser','braun.tessie@example.org','e1960e9bf439ba732c222f4f3a6283b301e73fff',98193674542,'\0'),(84,'Moriah','Satterfield','grayce.zulauf@example.org','4685c2b0e101c68cec8fefbb5e2b79e71393680f',99785744361,'\0'),(85,'Deven','Swaniawski','ludwig93@example.net','bc7c6da518e9814593376b268c346acc4042742b',94702399924,''),(86,'Frances','Kassulke','ybarrows@example.net','3b06950267329a48d6fc7f252ed7196086165136',92263915912,''),(87,'Lempi','Brekke','kuhn.cory@example.org','fa392f15b73683aefcc00affb9bd647ac6c8d787',92775671683,''),(88,'Obie','Aufderhar','walker.johann@example.com','3b007b5d2fa179c341daacfc4e9ea8888e38df96',93782473655,'\0'),(89,'Alyson','Steuber','mara11@example.org','6170e36986aac8859400e3c1d5f83a43860fe043',92458102443,'\0'),(90,'Kianna','Effertz','ehuel@example.com','d96f3e00b5b23cefe1e398d5c181620240a374e4',90742925951,''),(91,'Trent','Skiles','danielle.bahringer@example.com','9c8b10136d8dacc9c7df8ac2f86ca8a2aceb2a4a',97593321640,'\0'),(92,'Ryleigh','Beatty','hope00@example.org','49e1815109303605381779740623239ef995dc82',92384202858,''),(93,'Bennie','Swaniawski','quinton89@example.net','3a771894ab6a3d17ccb46703709b90d77617f928',90576019623,''),(94,'Andre','Huel','mkub@example.org','6042969d2c402f7d0a7048951b4f4ed863d884ea',96378604851,''),(95,'Zackery','Ryan','jazmyn.hodkiewicz@example.net','13a319a314c7e81e363eaed41df00b9d164f8a78',97866407333,'\0'),(96,'Minerva','White','charles34@example.org','fcd17ef49ad99eca6ef4e8b53ca8ea540c351ed0',99111309404,'\0'),(97,'Hallie','Hilll','willie.langosh@example.net','de76a52954d5ede98e14e6264c51cd9ab74ee377',99546519121,''),(98,'Olaf','Parisian','eino44@example.org','919e246131b8ede642c4962fe591c05b48564704',92202776848,'\0'),(99,'Clemmie','Wisoky','urohan@example.net','c266b9f74104cbee4c52496b301c40b56352bcf5',94268391567,'\0'),(100,'Lincoln','Auer','kiel04@example.org','bc8f1cfc1ae2d16e59aa8690a559459f692ec4ca',91482568579,'');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (1,27),(5,7),(6,41),(9,21),(9,43),(15,15),(15,27),(16,8),(17,15),(20,26),(20,31),(21,18),(26,22),(27,35),(31,11),(31,34),(34,24),(35,18),(35,30),(37,48),(38,24),(39,5),(39,50),(42,23),(44,6),(44,12),(45,14),(47,17),(59,3),(60,33),(60,37),(66,10),(67,29),(68,45),(69,44),(72,1),(73,40),(73,45),(74,9),(76,36),(77,11),(78,34),(79,30),(80,32),(80,41),(80,43),(81,37),(82,30),(82,48),(83,3),(87,30),(89,24),(98,45),(100,28);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-07 10:51:32
