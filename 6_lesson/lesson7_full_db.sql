-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_23
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
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`(10))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'Процессоры'),(2,'Материнские платы'),(3,'Видеокарты'),(4,'Жесткие диски'),(5,'Оперативная память');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL COMMENT 'Величина скидки от 0.0 до 1.0',
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_user_id` (`user_id`),
  KEY `index_of_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Скидки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,3,7,45425,'1987-09-21 15:27:34','2000-07-04 13:34:12','1993-09-05 06:25:25','2014-07-15 17:09:09'),(2,2,7,2,'1995-12-07 19:44:54','2013-05-22 23:26:55','1999-06-19 03:17:13','2002-02-22 21:33:47'),(3,1,5,9330100,'2000-12-02 04:06:54','1982-08-18 16:33:53','2008-02-20 18:17:48','1976-04-02 06:07:26'),(4,1,4,479,'1992-08-12 18:27:26','2019-11-17 12:11:00','2017-03-07 17:27:54','1999-10-12 23:39:09'),(5,3,5,1,'2003-02-24 01:44:46','1977-04-09 14:59:31','1991-06-26 13:29:10','1992-03-19 10:23:31');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,'2005-02-28 18:28:31','2002-02-01 18:17:03'),(2,2,'1991-03-30 14:05:01','2006-04-27 07:45:09'),(3,5,'1977-08-09 14:30:43','2004-01-13 09:58:30'),(4,4,'1983-05-23 05:34:16','1991-07-07 18:03:29'),(5,6,'2021-06-11 06:12:52','2008-11-13 21:24:35'),(6,4,'2006-01-26 12:09:27','2004-11-24 20:03:17'),(7,6,'1978-12-23 15:18:31','1992-12-18 02:17:13'),(8,2,'2000-08-05 21:58:47','2021-09-28 22:51:16'),(9,6,'1983-09-13 08:38:59','2008-08-10 07:06:57'),(10,6,'1990-09-30 10:19:24','1980-09-21 19:42:57'),(11,2,'2017-06-22 23:58:22','2017-05-15 19:14:46'),(12,2,'2004-06-23 15:04:03','2010-10-25 13:36:02'),(13,1,'1976-08-02 22:31:44','1977-05-06 11:51:55'),(14,5,'1989-05-18 07:36:03','1979-09-24 23:27:05'),(15,4,'1974-05-25 20:32:14','1992-08-21 06:12:36'),(16,5,'1990-05-16 16:51:27','1973-03-23 09:12:17'),(17,5,'1977-05-19 20:37:39','2011-04-10 09:23:50'),(18,5,'2009-04-21 07:11:06','1984-07-17 01:17:08'),(19,3,'2011-03-26 23:39:19','2019-05-12 06:40:27'),(20,5,'1977-04-12 19:23:48','1986-02-09 17:37:50'),(21,3,'1987-08-16 15:15:21','1980-10-14 08:57:17'),(22,5,'1999-06-08 00:50:54','2005-08-05 05:36:52'),(23,2,'1995-09-18 15:49:00','2000-11-07 20:39:03'),(24,5,'2016-08-20 10:29:36','1984-10-06 10:07:22'),(25,6,'1977-02-23 02:41:08','2001-02-23 17:18:41');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `total` int(10) unsigned DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Состав заказа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
INSERT INTO `orders_products` VALUES (1,5,4,1,'1999-11-07 19:24:58','2001-11-29 12:21:19'),(2,19,7,1,'1988-12-03 13:43:29','2000-05-09 07:07:10'),(3,6,4,1,'2002-11-30 09:53:57','1979-04-10 08:49:31'),(4,23,2,1,'1999-10-26 11:40:33','1983-09-23 10:38:18'),(5,24,3,1,'2009-04-21 21:29:09','2020-09-07 20:01:18'),(6,12,3,1,'2006-10-17 19:08:35','2020-10-20 00:37:25'),(7,6,2,1,'2002-04-09 19:56:48','2000-05-11 19:17:02'),(8,18,3,1,'2008-03-16 01:13:35','1993-06-03 06:41:26'),(9,25,2,1,'2001-12-27 03:13:05','2010-07-13 14:53:42'),(10,1,1,1,'1990-04-14 15:14:05','2018-04-16 22:52:13'),(11,21,4,1,'1994-08-03 07:27:24','2016-09-27 08:33:55'),(12,16,3,1,'1988-03-03 10:14:04','2002-06-10 11:36:26'),(13,21,6,1,'2010-01-23 20:10:00','2009-10-28 17:44:51'),(14,19,1,1,'1991-06-23 03:34:22','2021-05-19 21:54:27'),(15,7,3,1,'1982-07-22 06:30:03','1980-04-22 22:45:09'),(16,10,3,1,'2007-01-09 11:03:18','1978-08-10 04:17:47'),(17,21,1,1,'2006-05-15 18:24:04','2013-01-20 18:50:57'),(18,10,1,1,'2012-03-22 19:51:30','1993-05-17 03:07:06'),(19,17,3,1,'2020-02-15 11:16:52','1975-12-27 23:22:30'),(20,8,5,1,'2019-09-03 23:00:25','1979-09-22 02:50:22'),(21,17,6,1,'1991-04-06 11:34:20','1989-11-16 20:40:28'),(22,1,7,1,'2002-01-19 11:05:33','1972-01-09 14:36:28'),(23,23,6,1,'1973-04-24 16:02:35','1993-01-31 01:55:57'),(24,5,7,1,'2001-01-24 23:56:59','1970-03-07 05:14:49'),(25,23,2,1,'2020-09-09 17:54:13','2006-04-30 23:00:11');
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `desription` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `catalog_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_catalog_id` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Товарные позиции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Intel Core i3-8100','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',7890.00,1,'2022-10-07 12:12:00','2022-10-07 12:12:00'),(2,'Intel Core i5-7400','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',12700.00,1,'2022-10-07 12:12:00','2022-10-07 12:12:00'),(3,'AMD FX-8320E','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',4780.00,1,'2022-10-07 12:12:00','2022-10-07 12:12:00'),(4,'AMD FX-8320','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',7120.00,1,'2022-10-07 12:12:00','2022-10-07 12:12:00'),(5,'ASUS ROG MAXIMUS X HERO','Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX',19310.00,2,'2022-10-07 12:12:00','2022-10-07 12:12:00'),(6,'Gigabyte H310M S2H','Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX',4790.00,2,'2022-10-07 12:12:00','2022-10-07 12:12:00'),(7,'MSI B250M GAMING PRO','Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX',5060.00,2,'2022-10-07 12:12:00','2022-10-07 12:12:00');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubrics`
--

DROP TABLE IF EXISTS `rubrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubrics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubrics`
--

LOCK TABLES `rubrics` WRITE;
/*!40000 ALTER TABLE `rubrics` DISABLE KEYS */;
INSERT INTO `rubrics` VALUES (1,'Видеокарты'),(2,'Память');
/*!40000 ALTER TABLE `rubrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses`
--

DROP TABLE IF EXISTS `storehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Склады';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses`
--

LOCK TABLES `storehouses` WRITE;
/*!40000 ALTER TABLE `storehouses` DISABLE KEYS */;
INSERT INTO `storehouses` VALUES (1,'quo','2017-12-24 05:36:23','1974-04-15 20:23:41'),(2,'dolores','2006-02-18 03:03:41','2010-12-02 04:34:07'),(3,'ut','1983-01-25 18:46:57','1993-10-30 08:43:31'),(4,'sed','1986-09-29 22:46:11','1971-08-01 07:16:31'),(5,'similique','1995-12-27 17:30:00','1992-06-11 13:27:56'),(6,'sint','1989-07-16 02:26:45','1980-04-11 17:20:48'),(7,'necessitatibus','1992-10-15 11:03:51','1987-06-19 14:28:29'),(8,'impedit','2022-06-19 06:26:06','1981-09-29 18:10:03'),(9,'sed','1980-11-29 16:25:16','2022-03-06 14:48:21'),(10,'sit','2016-05-03 16:31:45','1970-06-03 15:29:53');
/*!40000 ALTER TABLE `storehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses_products`
--

DROP TABLE IF EXISTS `storehouses_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouses_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `storehouse_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `value` int(10) unsigned DEFAULT NULL COMMENT 'Запас товарной позиции на складе',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Запасы на складе';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses_products`
--

LOCK TABLES `storehouses_products` WRITE;
/*!40000 ALTER TABLE `storehouses_products` DISABLE KEYS */;
INSERT INTO `storehouses_products` VALUES (1,5,4,NULL,'2014-10-14 19:27:23','2008-07-06 06:55:18'),(2,9,5,NULL,'1994-07-28 12:48:06','1984-07-21 19:42:18'),(3,9,6,NULL,'2005-02-17 08:44:25','1995-07-25 11:31:55'),(4,8,2,NULL,'2000-08-29 18:17:36','2014-05-04 05:44:50'),(5,1,1,NULL,'1993-06-26 02:03:07','1988-10-10 20:01:58'),(6,5,3,NULL,'1971-06-25 10:29:12','2000-10-05 04:16:49'),(7,5,2,NULL,'1996-04-03 04:28:39','1994-01-31 19:39:27'),(8,4,4,NULL,'1994-04-07 00:43:31','2014-09-28 03:49:45'),(9,1,1,NULL,'2021-10-30 23:42:16','1987-05-22 07:57:51'),(10,4,3,NULL,'1973-05-10 18:41:03','1985-12-17 11:52:10'),(11,10,2,NULL,'1990-03-18 03:19:05','2000-08-29 20:36:14'),(12,5,2,NULL,'1972-08-29 18:18:10','1971-09-02 19:52:30'),(13,3,5,NULL,'1994-03-02 03:09:25','1992-06-11 14:17:12'),(14,4,3,NULL,'2007-06-11 06:06:40','1990-11-29 22:09:36'),(15,5,5,NULL,'2011-01-18 15:31:52','2015-05-04 23:26:11');
/*!40000 ALTER TABLE `storehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Имя покупателя',
  `birthday_at` date DEFAULT NULL COMMENT 'Дата рождения',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Покупатели';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Геннадий','1990-10-05','2022-10-07 12:12:00','2022-10-07 12:12:00'),(2,'Наталья','1984-11-12','2022-10-07 12:12:00','2022-10-07 12:12:00'),(3,'Александр','1985-05-20','2022-10-07 12:12:00','2022-10-07 12:12:00'),(4,'Сергей','1988-02-14','2022-10-07 12:12:00','2022-10-07 12:12:00'),(5,'Иван','1998-01-12','2022-10-07 12:12:00','2022-10-07 12:12:00'),(6,'Мария','1992-08-29','2022-10-07 12:12:00','2022-10-07 12:12:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-07 12:13:44
