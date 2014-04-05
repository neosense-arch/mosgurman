-- MySQL dump 10.13  Distrib 5.6.10, for osx10.7 (x86_64)
--
-- Host: localhost    Database: mosgurman
-- ------------------------------------------------------
-- Server version	5.6.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user`
--

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;
INSERT INTO `fos_user` VALUES (1,'admin@admin.com','admin@admin.com','admin@admin.com','admin@admin.com',1,'dju24fp08oowo80gocc0k488ocs4w4c','odgAycgDmQMgOVnwmqbaLYoOfnSa/UCfrTi1DXvIdCBDBlK6NRwSdyKqwbPfwJJWnHgG70ilyv8BLB3mQ+y7CQ==','2014-04-05 14:38:21',0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}',0,NULL);
/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mg_checkout_mails`
--

DROP TABLE IF EXISTS `mg_checkout_mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mg_checkout_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mg_checkout_mails`
--

LOCK TABLES `mg_checkout_mails` WRITE;
/*!40000 ALTER TABLE `mg_checkout_mails` DISABLE KEYS */;
INSERT INTO `mg_checkout_mails` VALUES (1,'stmol@bk.ru');
/*!40000 ALTER TABLE `mg_checkout_mails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mg_checkouts`
--

DROP TABLE IF EXISTS `mg_checkouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mg_checkouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `is_delivered` tinyint(1) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_90147AE89395C3F3` (`customer_id`),
  CONSTRAINT `FK_90147AE89395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `mg_customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mg_checkouts`
--

LOCK TABLES `mg_checkouts` WRITE;
/*!40000 ALTER TABLE `mg_checkouts` DISABLE KEYS */;
INSERT INTO `mg_checkouts` VALUES (1,NULL,NULL,'Moscow','123-56-78',NULL,'2014-04-04 15:19:31',1,10),(2,'Yura','Developer','Moscow','123-56-78','lkfjldkjfsdfsdf','2014-04-04 18:21:22',1,14),(3,'Yura','Developer','Moscow','123-56-78','klfjsdlfsdfsdfs','2014-04-04 18:32:14',1,16),(4,NULL,NULL,'Moscow','123-56-78',NULL,'2014-04-04 18:37:31',1,18),(5,NULL,NULL,'Moscow','123-56-78',NULL,'2014-04-04 18:38:02',1,18),(6,NULL,NULL,'Moscow','123-56-78','cxf','2014-04-04 18:40:56',1,19),(7,NULL,NULL,'Moscow','123-56-78',NULL,'2014-04-04 18:41:38',1,19),(8,NULL,'daas','Moscow','123-56-78',NULL,'2014-04-04 18:42:23',1,20),(9,'Yura',NULL,'Moscow','123-56-78',NULL,'2014-04-04 19:44:23',1,20),(10,NULL,NULL,'Moscow','123-56-78',NULL,'2014-04-04 19:50:07',1,23),(11,NULL,NULL,'Moscow','123-56-78',NULL,'2014-04-04 20:01:46',1,26),(12,NULL,NULL,'Moscow','123-56-78',NULL,'2014-04-04 20:03:38',1,27),(13,'Yuri','Stmol','Moscow','123-56-78','123','2014-04-04 20:04:37',1,28),(14,'Yuri','Stmol','Moscow 2','123-56-78','Siiir','2014-04-04 20:05:19',1,29),(15,NULL,NULL,'Moscow 2','123-56-78',NULL,'2014-04-04 20:07:49',1,30),(16,NULL,NULL,'Moscow 2','111-11-11',NULL,'2014-04-04 20:08:27',0,31),(17,'Yura','Stmol','Moscow','111-11-11',NULL,'2014-04-04 20:19:24',0,32),(18,'Yurec','Stmol','Moscow','123-56-78',NULL,'2014-04-05 16:25:00',0,33);
/*!40000 ALTER TABLE `mg_checkouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mg_customers`
--

DROP TABLE IF EXISTS `mg_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mg_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7882AF78E3C68343` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mg_customers`
--

LOCK TABLES `mg_customers` WRITE;
/*!40000 ALTER TABLE `mg_customers` DISABLE KEYS */;
INSERT INTO `mg_customers` VALUES (2,'144cbaed2cbf0f20bb22be3ec2e6718b216eb072','2014-03-23 14:08:55'),(3,'61d7550af6315cfda3c0075f3de78c1c952366f9','2014-03-23 14:09:28'),(4,'d8b94bb3ff0a287384b84cd2c25d5921dec4eb4f','2014-03-23 15:07:58'),(5,'f004223d3e041ebe2fb6f8a42458398d7f0d731e','2014-03-26 22:06:49'),(6,'f1aeed339c9065200b45ef5d2786e07c3a01d70c','2014-03-27 00:26:55'),(7,'972cc6e2b76a042ffdf3b5e4dc2c93184718ba5b','2014-04-01 18:29:11'),(8,'68279379e89d6fc4ab462fb7299bce1a1cdf2653','2014-04-02 21:50:15'),(9,'0cf26f617cb752cf15a7526e28b503e7e73ff414','2014-04-03 00:54:22'),(10,'9e833315a49bb03d3ea951adae50146ee715d2df','2014-04-03 00:55:17'),(11,'309075f8adf3b5501a5e7249ebac2ecac9bbee97','2014-04-04 15:20:41'),(12,'b1f7f7a4a39b838165f20c7245ae1ed2bbc750b9','2014-04-04 18:15:12'),(13,'3b97c5640b2b797fb7a7606a2a1a56c1aaa5ee3a','2014-04-04 18:17:45'),(14,'d8c39cf8cbf4f6c9bae6050d1cd2c63a2d9b8cea','2014-04-04 18:20:52'),(15,'b6ee7f8c9f2f2910f874b2f236f0d5a56da1f816','2014-04-04 18:28:29'),(16,'6fffcb31f8870ba2a20e032a3e58d8a499cbf919','2014-04-04 18:31:46'),(17,'2cf8789c09d02ed384b9d7c4b846f0d78c2f2a8f','2014-04-04 18:35:48'),(18,'27a11e9d0d7790deaae67e3f3474e658da7ee0a6','2014-04-04 18:37:08'),(19,'b7a09941be8eccc53a75a144704b34e8023f348e','2014-04-04 18:40:35'),(20,'117347e6ac198324ec9326366b8b4c6dcbed379e','2014-04-04 18:42:04'),(21,'d71f02f5949fde97773a31950ec8cfa9e19a89bb','2014-04-04 19:44:52'),(22,'5e10309d7456b0efd6689e3c34dfd082e27d46d6','2014-04-04 19:46:48'),(23,'625d8a4a898f2348bd7f012880c561a5a5688bc9','2014-04-04 19:49:34'),(24,'c9c61ce87e19a2e0629d69a593220ae0695d43fb','2014-04-04 19:52:37'),(25,'b21b375cc897df5535ed137bbd7e5ce05bef0073','2014-04-04 19:59:50'),(26,'0300b10c109f415814db0e512b97247be614ce34','2014-04-04 20:01:31'),(27,'2949c004511241df886f10bd41ca152451dfe990','2014-04-04 20:03:20'),(28,'0551733fc16a86b7727f688cf0adb593267e055a','2014-04-04 20:03:58'),(29,'281d5c7f84a99550acd212644cfd669548674426','2014-04-04 20:04:52'),(30,'4d41453a1d19055a6dcd4f2f3560517daedd0d4d','2014-04-04 20:07:05'),(31,'3fb39bb35302837312228f84d5c2f9922afbd9e5','2014-04-04 20:08:09'),(32,'d828dbdea31da4f7b7e73e4639beb91be08d76a9','2014-04-04 20:18:52'),(33,'186048a4616da6061e8a3b6020e6416fe4f8d505','2014-04-04 20:21:13'),(34,'bb999a8dec764b743fcd5520e3d9fb830c42a22c','2014-04-05 20:59:57');
/*!40000 ALTER TABLE `mg_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mg_orders`
--

DROP TABLE IF EXISTS `mg_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mg_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `count` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `weight` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_107B1EEC126F525E` (`item_id`),
  KEY `IDX_107B1EEC9395C3F3` (`customer_id`),
  CONSTRAINT `FK_107B1EEC126F525E` FOREIGN KEY (`item_id`) REFERENCES `ns_catalog_items` (`id`),
  CONSTRAINT `FK_107B1EEC9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `mg_customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mg_orders`
--

LOCK TABLES `mg_orders` WRITE;
/*!40000 ALTER TABLE `mg_orders` DISABLE KEYS */;
INSERT INTO `mg_orders` VALUES (19,1,1,'2014-03-23 14:08:55',2,0),(20,1,1,'2014-03-23 14:09:28',3,0),(21,1,1,'2014-03-23 14:09:30',3,0),(22,1,1,'2014-03-23 14:18:11',2,0),(23,2,1,'2014-03-23 14:46:01',2,0),(31,1,1,'2014-03-26 22:06:49',5,0),(32,2,1,'2014-03-26 22:06:50',5,0),(33,3,1,'2014-03-26 22:06:51',5,0),(34,4,1,'2014-03-26 22:06:52',5,0),(97,1,1,'2014-03-27 00:26:55',6,800),(98,1,2,'2014-03-27 00:26:56',6,1000),(110,1,3,'2014-04-01 18:35:08',7,800),(111,2,3,'2014-04-01 18:35:11',7,800),(112,1,1,'2014-04-02 21:50:15',8,800),(113,1,1,'2014-04-03 00:54:23',9,800),(114,1,1,'2014-04-03 00:55:17',10,800),(115,5,1,'2014-04-04 15:20:41',11,800),(116,5,1,'2014-04-04 15:20:43',11,1000),(117,5,1,'2014-04-04 15:20:44',11,1200),(118,1,1,'2014-04-04 18:15:12',12,800),(119,1,1,'2014-04-04 18:17:45',13,800),(120,1,1,'2014-04-04 18:20:52',14,800),(121,1,1,'2014-04-04 18:28:30',15,800),(122,2,1,'2014-04-04 18:28:31',15,800),(123,3,1,'2014-04-04 18:28:32',15,800),(124,1,1,'2014-04-04 18:31:47',16,800),(125,2,1,'2014-04-04 18:31:48',16,800),(126,3,1,'2014-04-04 18:31:49',16,800),(127,4,2,'2014-04-04 18:35:48',17,800),(128,1,1,'2014-04-04 18:37:09',18,800),(129,5,1,'2014-04-04 18:40:35',19,800),(130,3,1,'2014-04-04 18:42:05',20,800),(131,1,2,'2014-04-04 19:44:52',21,800),(132,1,1,'2014-04-04 19:46:49',22,800),(133,1,1,'2014-04-04 19:49:34',23,1000),(134,3,1,'2014-04-04 19:52:38',24,1000),(135,1,1,'2014-04-04 19:59:50',25,800),(136,1,1,'2014-04-04 20:01:31',26,800),(137,1,1,'2014-04-04 20:03:20',27,800),(138,1,1,'2014-04-04 20:03:58',28,800),(139,2,1,'2014-04-04 20:04:53',29,800),(140,1,1,'2014-04-04 20:07:05',30,800),(141,2,1,'2014-04-04 20:08:09',31,800),(142,1,1,'2014-04-04 20:18:52',32,800),(143,1,1,'2014-04-04 20:18:56',32,1000),(144,1,1,'2014-04-04 20:18:57',32,1200),(145,1,1,'2014-04-04 20:21:13',33,800),(147,2,1,'2014-04-05 21:41:52',34,1200),(148,3,5,'2014-04-05 21:46:06',34,800);
/*!40000 ALTER TABLE `mg_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_catalog_catalogs`
--

DROP TABLE IF EXISTS `ns_catalog_catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_catalog_catalogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settingsFormTypeName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settingsModelClassName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_catalog_catalogs`
--

LOCK TABLES `ns_catalog_catalogs` WRITE;
/*!40000 ALTER TABLE `ns_catalog_catalogs` DISABLE KEYS */;
INSERT INTO `ns_catalog_catalogs` VALUES (1,'Каталог продуктов','goods','mg_front.catalog.item_settings_type','Mosgurman\\FrontBundle\\Catalog\\ItemSettingsModel');
/*!40000 ALTER TABLE `ns_catalog_catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_catalog_categories`
--

DROP TABLE IF EXISTS `ns_catalog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_catalog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `catalog_id` int(11) DEFAULT NULL,
  `t_left` int(11) NOT NULL,
  `t_level` int(11) NOT NULL,
  `t_right` int(11) NOT NULL,
  `t_root` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_649E8DF2989D9B62` (`slug`),
  KEY `IDX_649E8DF2727ACA70` (`parent_id`),
  KEY `IDX_649E8DF2CC3C66FC` (`catalog_id`),
  CONSTRAINT `FK_649E8DF2727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `ns_catalog_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_649E8DF2CC3C66FC` FOREIGN KEY (`catalog_id`) REFERENCES `ns_catalog_catalogs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_catalog_categories`
--

LOCK TABLES `ns_catalog_categories` WRITE;
/*!40000 ALTER TABLE `ns_catalog_categories` DISABLE KEYS */;
INSERT INTO `ns_catalog_categories` VALUES (1,NULL,NULL,1,0,14,1,'ns_catalog_categories_root_category','ns_catalog_categories_root_category','ns-catalog-categories-root-category',NULL,NULL),(2,1,1,2,1,3,1,'Осетинские пироги',NULL,'osietinskiie-piroghi',NULL,NULL),(3,1,1,4,1,5,1,'Сладкие пироги',NULL,'sladkiie-piroghi',NULL,NULL),(4,1,1,6,1,7,1,'Торты и десерты',NULL,'torty-i-diesierty',NULL,NULL),(5,1,1,8,1,9,1,'Кулинария',NULL,'kulinariia',NULL,NULL),(6,1,1,10,1,11,1,'Салаты',NULL,'salaty',NULL,NULL),(7,1,1,12,1,13,1,'Напитки',NULL,'napitki',NULL,NULL);
/*!40000 ALTER TABLE `ns_catalog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_catalog_items`
--

DROP TABLE IF EXISTS `ns_catalog_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_catalog_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C4BF31B1989D9B62` (`slug`),
  KEY `IDX_C4BF31B112469DE2` (`category_id`),
  CONSTRAINT `FK_C4BF31B112469DE2` FOREIGN KEY (`category_id`) REFERENCES `ns_catalog_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_catalog_items`
--

LOCK TABLES `ns_catalog_items` WRITE;
/*!40000 ALTER TABLE `ns_catalog_items` DISABLE KEYS */;
INSERT INTO `ns_catalog_items` VALUES (1,2,'Пирог с мясом','pirogh-s-miasom',1),(2,2,'Пирог с начинкой из сыра','pirogh-s-nachinkoi-iz-syra',1),(3,2,'Пирог с сыром и зеленым луком','pirogh-s-syrom-i-zielienym-lukom',1),(4,2,'Пирог с начинкой из свекольных листьев и сыра','pirogh-s-nachinkoi-iz-sviekol-nykh-list-iev-i-syra',1),(5,2,'Начинка - сыр и шпинат','nachinka-syr-i-shpinat',1);
/*!40000 ALTER TABLE `ns_catalog_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_catalog_settings`
--

DROP TABLE IF EXISTS `ns_catalog_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_catalog_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_B1ABF63D126F525E` (`item_id`),
  CONSTRAINT `FK_B1ABF63D126F525E` FOREIGN KEY (`item_id`) REFERENCES `ns_catalog_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_catalog_settings`
--

LOCK TABLES `ns_catalog_settings` WRITE;
/*!40000 ALTER TABLE `ns_catalog_settings` DISABLE KEYS */;
INSERT INTO `ns_catalog_settings` VALUES (1,1,'photos','532321f2ea14a4.48258770.jpg;532847c8149635.98546913.jpg'),(2,2,'photos','53233899775587.12423392.jpg'),(3,2,'photo','53233899775587.12423392.jpg'),(4,1,'photo','532321f2ea14a4.48258770.jpg'),(5,3,'photos','5323396552a752.94134614.jpg'),(6,3,'photo','5323396552a752.94134614.jpg'),(7,4,'photos','532339fc633610.98338775.jpg'),(8,4,'photo','532339fc633610.98338775.jpg'),(9,5,'photos','53233bd9b0bac0.00394311.jpg'),(10,5,'photo','53233bd9b0bac0.00394311.jpg'),(14,5,'brief','Состав:\r\nмука пшеничная в/с, молоко, яйцо, дрожжи, соль, сыр осетинский, шпинат, сметана, масло сливочное\r\n\r\nФорма:\r\nХарактерной особенностью осетинских пирогов является их форма и оригинальная техника завертывания. Пирог получается очень тонким и почти полностью закрытым сверху. Остается лишь небольшое отверстие в середине пирога. Во многом, благодаря именно этому старинному методу завертывания пирогов, осетинский пирог обладает столь нежным и насыщенным вкусом. Тем более, что сочетание тонкого теста и большого количества начинки, говорит само за себя.\r\n\r\nРецепт:\r\nНаш рецепт приготовления осетинского пирога с сыром и шпинатом. \r\n\r\nПшеничную муку высшего сорта просеять, в середине сделать углубление и налить в него кефир, положить размягченный маргарин, соль, дрожжи, и замесить тесто. Его необходимо будит накрыть и поставить в теплое место. Оставить тесто на 2 -3 часа, пока подойдет. Приготовление начинки: листья шпината, промыть в холодной воде, обрезать стебли, а сами листья тонко нарезать. Добавить нашинкованный зеленый лук, укроп и перемешать. Отдельно промять свежий осетинский сыр, положить в него нарезанные листья свеклы и перемешать, добавить сливки. Соль способствует выделению сока, поэтому солить начинку необхадима перед заворачиванием в тесто. Тесто нужно разделить на части и каждую часть раскатать на лепешки толщиной в 0,5 - 1 см. Заранее приготовленную начинку положить на середину лепешки, разровнять ее на поверхности на 3 - 4 см от края лепешки, затем, забирая концы лепешки, аккуратно стянуть концы на середину и соединить. Придавливая рукой разровнять поверхность пирога, перевернуть его, и так же разровнять поверхность. Повторить эти действия несколько раз, пока пирогу не будет придана округлая форма и ровная толщина. Положить на подогретую, смазанную маслом чугунную форму(сковороду). С верху пирога проделать небольшое отверстие в тесте, чтобы при выпекании пары не скапливались и не разорвали пирог. Выпекать в печи до образования румяной корочки (при 250 градусах - от 10 до 15 минут). Подавать к столу в горячем виде, смазав сливочным маслом. Можно полить и топленным маслом, но наши повара утверждают что при этом пироги теряют свой неповторимый аромат. \r\n\r\nОсетинские пироги с сыром и шпинатом.'),(15,5,'price',NULL),(16,5,'pricesString','[{\"weight\":\"800\",\"price\":\"410\"},{\"weight\":\"1000\",\"price\":\"460\"},{\"weight\":\"1200\",\"price\":\"500\"}]'),(17,1,'brief','Состав:\r\nТесто: мука - 230 гр., яйца - 1 шт., молоко или вода - 1,5 стакана.\r\nФарш:мясо 320 гр. (желательно смешать равными частями говядину первого сорта, свинину средней жирности, баранину без жира) , лук репчатый 30 гр., чеснок - 3 - 4 дол., перец, соль - по вкусу.\r\n\r\nФорма:\r\nХарактерной особенностью осетинских пирогов является их форма и оригинальная техника завертывания. Пирог получается очень тонким и почти полностью закрытым сверху. Остается лишь небольшое отверстие в середине пирога. Во многом, благодаря именно этому старинному методу завертывания пирогов, осетинский пирог обладает столь нежным и насыщенным вкусом. Тем более, что сочетание тонкого теста и большого количества начинки, говорит само за себя.\r\nНаш рецепт приготовления осетинского пирога с мясом:\r\n\r\nДля того чтобы приготовить осетинский пирог с мясом нужно сделать тесто: Пшеничную муку высшего сорта просеять, в середине сделать углубление и налить в него кефир, положить размягченный маргарин, соль, дрожжи, и замесить тесто. Его необходимо будит накрыть и поставить в теплое место. Оставить тесто на 2 -3 часа, пока подойдет. Немного промять перед разделкой.Тесто следует разделить на две неравные части, так как лепешка для нижнего слоя должна быть больше и толще. Раскатать нижнюю лепешку толщиной 0,5 - 1 см и положить ее на смазанную маслом чугунную форму(сковороду), так чтобы тесто покрывало края формы. Затем уложить равномерно мясную начинку по всей сковороде, раскатать вторую верхнюю лепешку толщиной 0,2 - 0,3 см. Посередине верхней лепешки проделать отверстие, или же сделать фигурные нарезы. Затем верхней лепешкой накрыть сковороду и провести по краям формы скалкой, срезая с краев излишки теста. Края зажать, чтобы при выпечке не вытек сок. Начинка: Мясо зачистить от сухожилий, пленок и секачем или топориком нарубить очень мелко (или пропустить через крупную решетку мясорубки). Добавить в мясо мелко нарезанного репчатого лука, чеснока, молотый черный перец, соль, влить бульона 30 - 35 процентов к весу мяса, и все как следует перемешать. Обратите внимание, если мясо жирное, то бульона надо меньше. Пирог выпекать в печи или жарочном шкафу при 250 градусах 13 - 17 минут до образования румяной корочки. Подавать к столу в горячем виде, смазав сливочным маслом. Можно полить и топленным маслом, но наши повара утверждают что при этом пироги теряют свой неповторимый аромат.'),(18,1,'price',NULL),(19,1,'pricesString','[{\"weight\":\"800\",\"price\":\"440\"},{\"weight\":\"1000\",\"price\":\"500\"},{\"weight\":\"1200\",\"price\":\"550\"}]'),(20,4,'brief','Состав:\r\nмука пшеничная в/с, молоко, яйцо, дрожжи, соль, сыр осетинский, листья свеклы, сметана, масло сливочное\r\n\r\nФорма:\r\nХарактерной особенностью осетинских пирогов со свекольной ботвой и сыром является их форма и оригинальная техника завертывания. Пирог получается очень тонким и почти полностью закрытым сверху. Остается лишь небольшое отверстие в середине пирога. Во многом, благодаря именно этому старинному методу завертывания пирогов, осетинский пирог обладает столь нежным и насыщенным вкусом. Тем более что сочетание тонкого теста и большого количества начинки, говорит само за себя.\r\nСостав:\r\n\r\nЛистья свеклы - 300 гр., сыр свежий - 150 гр., лук зеленый - 100 гр., укроп зеленый - 60 гр., масло сливочное или топленое - 35 гр., сметана - 50 гр., соль - по вкусу.\r\n\r\nНаш рецепт приготовления осетинского пирога со свекольной ботвой и сыром:\r\n\r\nПшеничную муку высшего сорта просеять, в середине сделать углубление и налить в него кефир, положить размягченный маргарин, соль, дрожжи, и замесить тесто. Его необходимо будит накрыть и поставить в теплое место. Оставить тесто на 2 -3 часа, пока подойдет. Приготовление начинки: листья свеклы, промыть в холодной воде, обрезать стебли, а сами листья тонко нарезать. Добавить нашинкованный зеленый лук, укроп и перемешать. Отдельно промять свежий осетинский сыр, положить в него нарезанные листья свеклы и перемешать, добавить сливки. Соль способствует выделению сока, поэтому солить начинку необходимо перед заворачиванием в тесто. Тесто нужно разделить на части и каждую часть раскатать на лепешки толщиной в 0,5 - 1 см. Заранее приготовленную начинку положить на середину лепешки, разровнять ее на поверхности на 3 - 4 см от края лепешки, затем, забирая концы лепешки, аккуратно стянуть концы на середину и соединить. Придавливая рукой разровнять поверхность пирога, перевернуть его, и так же разровнять поверхность. Повторить эти действия несколько раз, пока пирогу не будет придана округлая форма и ровная толщина. Положить на подогретую, смазанную маслом чугунную форму(сковороду). В верхушке пирога проделать небольшое отверстие в тесте, чтобы при выпекании пары не скапливались и не разорвали пирог. Выпекать в печи до образования румяной корочки (при 250 градусах - от 10 до 15 минут). Подавать к столу в горячем виде, смазав сливочным маслом. Можно полить и топленым маслом, но наши повара утверждают что при этом пироги теряют свой неповторимый аромат.'),(21,4,'price',NULL),(22,4,'pricesString','[{\"weight\":\"800\",\"price\":\"410\"},{\"weight\":\"1000\",\"price\":\"460\"},{\"weight\":\"1200\",\"price\":\"500\"}]'),(23,2,'brief','Состав:\r\nмука пшеничная в/с, молоко, яйцо, дрожжи, соль, сыр осетинский, масло сливочное.\r\n\r\nОсетинский сыр:\r\nИздревле осетины готовили сыр из коровьего, овечьего и козьего молока, который и поныне славится своим отменным вкусом на всей территории бывшего СССР. В настоящее время сыр готовится преимущественно из коровьего молока почти в каждой сельской семье, а также – на промышленной основе молочными заводами Осетии и других регионов Северного Кавказа.\r\n\r\nФорма:\r\nХарактерной особенностью осетинских пирогов с сыром является их форма и оригинальная техника завертывания. Пирог получается очень тонким и почти полностью закрытым сверху. Остается лишь небольшое отверстие в середине пирога. Во многом, благодаря именно этому старинному методу завертывания, осетинский пирог с сыром обладает столь нежным и насыщенным вкусом. Тем более что сочетание тонкого теста и большого количества начинки, говорит само за себя.\r\nРецепт приготовления осетинского пирога с сыром\r\nСостав:\r\n\r\nТесто: мука - 300 г., кефир - 2 стакана, сахар - 5 г., маргарин - 30 г., дрожжи - 5 г. \r\nНачинка: сыр свежий - 300 г., масло - 30 г., соль - по вкусу\r\n\r\nНаш рецепт приготовления осетинского пирога с сыром:\r\n\r\nПшеничную муку высшего сорта просеять, в середине сделать углубление и налить в него кефир, положить размягченный маргарин, соль, дрожжи, и замесить тесто. Его необходимо будит накрыть и поставить в теплое место. Оставить тесто на 2-3 часа, пока подойдет. Приготовление начинки: Сыр однодневной выдержки, приготовленный из свежего цельного молока, отжать от остатков сыворотки, тщательно размять, чтобы масса сыра стала маслянистой, посолить. Тесто нужно разделить на части и каждую часть раскатать на лепешки толщиной в 0,5 - 1 см. Заранее приготовленную начинку положить на середину лепешки, разровнять ее на поверхности на 3 - 4 см от края лепешки, затем, забирая концы лепешки, аккуратно стянуть концы на середину и соединить. Придавливая рукой разровнять поверхность пирога, перевернуть его, и так же разровнять поверхность. Повторить эти действия несколько раз, пока пирогу не будет придана округлая форма и ровная толщина. Положить на подогретую, смазанную маслом чугунную форму(сковороду). В верхушке пирога проделать небольшое отверстие в тесте, чтобы при выпекании пары не скапливались и не разорвали пирог. Выпекать в печи до образования румяной корочки (при 250 градусах - от 10 до 15 минут). Подавать к столу в горячем виде, смазав сливочным маслом. Можно полить и топленым маслом, но наши повара утверждают, что при этом пироги теряют свой неповторимый аромат.'),(24,2,'price',NULL),(25,2,'pricesString','[{\"weight\":\"800\",\"price\":\"410\"},{\"weight\":\"1000\",\"price\":\"460\"},{\"weight\":\"1200\",\"price\":\"500\"}]'),(26,3,'brief','Состав:\r\nмука пшеничная в/с, молоко, яйцо, дрожжи, соль, сыр осетинский, зеленый лук, масло сливочное.\r\n\r\nОсетинский сыр:\r\nИздревле осетины готовили сыр из коровьего, овечьего и козьего молока, который и поныне славится своим отменным вкусом на всей территории бывшего СССР. В настоящее время сыр готовится преимущественно из коровьего молока почти в каждой сельской семье, а также – на промышленой основе молочными заводами Осетии и других регионов Северного Кавказа.\r\n\r\nФорма:\r\nХарактерной особенностью осетинских пирогов является их форма и оригинальная техника завертывания. Пирог получается очень тонким и почти полностью закрытым сверху. Остается лишь небольшое отверстие в середине пирога. Во многом, благодаря именно этому старинному методу завертывания пирогов, осетинский пирог обладает столь нежным и насыщенным вкусом. Тем более, что сочетание тонкого теста и большого количества начинки, говорит само за себя.\r\nСостав:\r\n\r\nТесто: мука - 300 г., кефир - 2 стакана, сахар - 5 г., маргарин - 30 г., дрожжи - 5 г.\r\nНачинка: сыр свежий - 300 г., зеленый лук - 100г., масло - 30 г., соль - по вкусу\r\n\r\nНаш рецепт приготовления осетинского пирога с сыром и зеленным луком:\r\n\r\nПшеничную муку высшего сорта просеять, в середине сделать углубление и налить в него кефир, положить размягченный маргарин, соль, дрожжи, и замесить тесто. Его необходимо будит накрыть и поставить в теплое место. Оставить тесто на 2 -3 часа, пока подойдет. Приготовление начинки: Сыр однодневной выдержки, приготовленный из свежего цельного молока, отжать от остатков сыворотки, тщательно размять, чтобы масса сыра стала маслянистой, посолить.Перебрать, очистить и промыть перья зеленого лука и мелко его нашинковать. Хорошо перемешать сыр и мелко нарезанный зеленый лук. Тесто нужно разделить на части и каждую часть раскатать на лепешки толщиной в 0,5 - 1 см. Заранее приготовленную начинку положить на середину лепешки, разровнять ее на поверхности на 3 - 4 см от края лепешки, затем, забирая концы лепешки, аккуратно стянуть концы на середину и соединить. Придавливая рукой разровнять поверхность пирога, перевернуть его, и так же разровнять поверхность. Повторить эти действия несколько раз, пока пирогу не будет придана округлая форма и ровная толщина. Положить на подогретую, смазанную маслом чугунную форму(сковороду). С верху пирога проделать небольшое отверстие в тесте, чтобы при выпекании пары не скапливались и не разорвали пирог. Выпекать в печи до образования румяной корочки (при 250 градусах - от 10 до 15 минут). Подавать к столу в горячем виде, смазав сливочным маслом. Можно полить и топленным маслом, но наши повара утверждают что при этом пироги теряют свой неповторимый аромат. Осетинские пироги с сыром и зеленным луком.'),(27,3,'price',NULL),(28,3,'pricesString','[{\"weight\":\"800\",\"price\":\"410\"},{\"weight\":\"1000\",\"price\":\"460\"},{\"weight\":\"1200\",\"price\":\"500\"}]'),(29,1,'group','hot'),(30,1,'isNew',''),(31,1,'isSale','1'),(32,5,'group','sweet'),(33,5,'isNew','1'),(34,5,'isSale',''),(35,4,'group','nomeat'),(36,4,'isNew',''),(37,4,'isSale',''),(38,2,'group','season'),(39,2,'isNew',''),(40,2,'isSale',''),(41,3,'group','nomeat'),(42,3,'isNew',''),(43,3,'isSale','');
/*!40000 ALTER TABLE `ns_catalog_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_catalog_type_elements`
--

DROP TABLE IF EXISTS `ns_catalog_type_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_catalog_type_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_623C0EB9C54C8C93` (`type_id`),
  CONSTRAINT `FK_623C0EB9C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `ns_catalog_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_catalog_type_elements`
--

LOCK TABLES `ns_catalog_type_elements` WRITE;
/*!40000 ALTER TABLE `ns_catalog_type_elements` DISABLE KEYS */;
INSERT INTO `ns_catalog_type_elements` VALUES (1,1,'Вес','weight','text'),(2,1,'Стоимость','price','text');
/*!40000 ALTER TABLE `ns_catalog_type_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_catalog_types`
--

DROP TABLE IF EXISTS `ns_catalog_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_catalog_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_catalog_types`
--

LOCK TABLES `ns_catalog_types` WRITE;
/*!40000 ALTER TABLE `ns_catalog_types` DISABLE KEYS */;
INSERT INTO `ns_catalog_types` VALUES (1,'Товарное предложение','sellOffer');
/*!40000 ALTER TABLE `ns_catalog_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_cms_blocks`
--

DROP TABLE IF EXISTS `ns_cms_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_cms_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci,
  `typeName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `areaName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `shared` tinyint(1) NOT NULL,
  `useCache` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5C6208FCC4663E4` (`page_id`),
  CONSTRAINT `FK_5C6208FCC4663E4` FOREIGN KEY (`page_id`) REFERENCES `ns_cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_cms_blocks`
--

LOCK TABLES `ns_cms_blocks` WRITE;
/*!40000 ALTER TABLE `ns_cms_blocks` DISABLE KEYS */;
INSERT INTO `ns_cms_blocks` VALUES (1,NULL,'Блок меню','NSCmsBundle:Blocks:menuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','header',0,0,0),(2,NULL,'Блок меню',NULL,NULL,'NSCmsBundle:Blocks:menuBlock','footer',1,0,0),(3,NULL,'Текстовый блок',NULL,NULL,'NSCmsBundle:Blocks:contentBlock','footer',0,0,0),(5,NULL,'Текстовый блок',NULL,'O:53:\"NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\":1:{s:62:\"\0NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\0content\";s:451:\"<span><strong>© 2014 МосГурман</strong> — осетинские пироги с душой!</span>\r\n						<p>Все права на материалы, находящиеся на сайте, охраняются в соответствии с законодательством РФ. <br>\r\n						При любом использовании материалов сайта, письменное согласие обязательно.</p>\";}','NSCmsBundle:Blocks:contentBlock','copyright',0,0,0),(7,NULL,'Блок меню','NSCmsBundle:Blocks:footerMenuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','footer_menu',0,0,0),(8,NULL,'Меню категорий',NULL,'O:64:\"NS\\CatalogBundle\\Block\\Settings\\CategoriesMenuBlockSettingsModel\":5:{s:75:\"\0NS\\CatalogBundle\\Block\\Settings\\CategoriesMenuBlockSettingsModel\0sortOrder\";s:81:\"osietinskiie-piroghi,sladkiie-piroghi,torty-i-diesierty,kulinariia,salaty,napitki\";s:74:\"\0NS\\CatalogBundle\\Block\\Settings\\CategoriesMenuBlockSettingsModel\0template\";s:52:\"NSCatalogBundle:Blocks:categoriesMenuBlock.html.twig\";s:75:\"\0NS\\CatalogBundle\\Block\\Settings\\CategoriesMenuBlockSettingsModel\0isSubmenu\";b:0;s:75:\"\0NS\\CatalogBundle\\Block\\Settings\\CategoriesMenuBlockSettingsModel\0routeName\";s:19:\"ns_catalog_category\";s:85:\"\0NS\\CatalogBundle\\Block\\Settings\\CategoriesMenuBlockSettingsModel\0redirectToFirstItem\";b:0;}','NSCatalogBundle:Blocks:categoriesMenuBlock','catalog_menu',0,0,0),(9,2,'Слайдер с изображениями',NULL,NULL,'MGFrontBundle:Blocks:sliderBlock','slider',0,0,0),(11,10,'Заголовок страницы','NSCmsBundle:Blocks:headerMenuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','slider',0,0,0),(12,3,'Заголовок страницы','NSCmsBundle:Blocks:headerMenuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','slider',0,0,0),(13,4,'Заголовок страницы','NSCmsBundle:Blocks:headerMenuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','slider',0,0,0),(14,4,'Текстовый блок',NULL,'O:53:\"NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\":1:{s:62:\"\0NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\0content\";s:1182:\"<p>Наше предприятие занимается выпечкой осетинских пирогов с 2007г.</p>\r\n\r\n<p>Пироги выпекаются по оригинальному осетинскому рецепту с использованием ингредиентов высшего качества и при соблюдении всех санитарно-гигиенических норм и технических условий.</p>\r\n\r\n<h3><u>Минимальный заказ и район доставки уточняйте у оператора.</u></h3>\r\n\r\n<h3>Бесплатная доставка по Москве.</h3>\r\n\r\n<p><img alt=\"осетинские пироги телефон\" src=\"http://www.mosgurman.ru/images/stories/dostavka.jpg\" style=\"border:0px; float:left; height:93px; width:102px\" /></p>\r\n\r\n<p><strong>Прием заказов:</strong>&nbsp;с 09.00 до 21.00 без выходных.<br />\r\n<strong>Время доставки:</strong>&nbsp;1- 1,5 часа.<br />\r\n<strong>Оплата:</strong>&nbsp;наличными курьеру.<br />\r\n<strong>Телефоны:</strong>&nbsp;(495) 723-60-57 (495) 723-60-87</p>\";}','NSCmsBundle:Blocks:contentBlock','content',0,0,0),(15,5,'Текстовый блок',NULL,'O:53:\"NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\":1:{s:62:\"\0NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\0content\";s:3015:\"<div>Компания ООО &laquo;Тарон&raquo;&nbsp;- мы занимаемся приготовлением, продажей и доставкой осетинских приогов</div>\r\n\r\n<div class=\"adr\">Адрес производства: 127055&nbsp;г. Москва,&nbsp;ул. Сущевская, д. 21, 2 подъезд, 1 этаж, пекарня</div>\r\n\r\n<div>Адрес офиса: 115280, г. Москва, ул. Автозаводская, д. 17, корп. 3, офис 11</div>\r\n\r\n<div>Мы работаем&nbsp;с 9.00 до 21.00\r\n<p><img alt=\"осетинские пироги телефон\" src=\"http://www.mosgurman.ru/images/stories/telef.jpg\" style=\"border:0px; float:left; height:55px; width:32px\" /></p>\r\n<script src=\"http://api-maps.yandex.ru/1.1/?key=AO8Pb04BAAAAYkHucgIAQ5fuVe1_bNLp6mxReq0QfGYCfJ4AAAAAAAAAAAB1q351VGWU0y6a-X8nQcbMjAbIOA==&modules=pmap&wizard=constructor\" type=\"text/javascript\"></script> <script type=\"text/javascript\">\r\n    YMaps.jQuery(window).load(function () {\r\n        var map = new YMaps.Map(YMaps.jQuery(\"#YMapsID-1024\")[0]);\r\n        map.setCenter(new YMaps.GeoPoint(37.599658,55.782696), 16, YMaps.MapType.MAP);\r\n        map.addControl(new YMaps.Zoom());\r\n        map.addControl(new YMaps.ToolBar());\r\n        YMaps.MapType.PMAP.getName = function () { return \"Народная\"; };\r\n        map.addControl(new YMaps.TypeControl([\r\n            YMaps.MapType.MAP,\r\n            YMaps.MapType.SATELLITE,\r\n            YMaps.MapType.HYBRID,\r\n            YMaps.MapType.PMAP\r\n        ], [0, 1, 2, 3]));\r\n\r\n        YMaps.Styles.add(\"constructor#pmlbmPlacemark\", {\r\n            iconStyle : {\r\n                href : \"http://api-maps.yandex.ru/i/0.3/placemarks/pmlbm.png\",\r\n                size : new YMaps.Point(28,29),\r\n                offset: new YMaps.Point(-8,-27)\r\n            }\r\n        });\r\n\r\n       map.addOverlay(createObject(\"Placemark\", new YMaps.GeoPoint(37.600495,55.782309), \"constructor#pmlbmPlacemark\", \"Москва, ул. Сущевская, д. 21,  2 подъезд, 1 этаж\"));\r\n        \r\n        function createObject (type, point, style, description) {\r\n            var allowObjects = [\"Placemark\", \"Polyline\", \"Polygon\"],\r\n                index = YMaps.jQuery.inArray( type, allowObjects),\r\n                constructor = allowObjects[(index == -1) ? 0 : index];\r\n                description = description || \"\";\r\n            \r\n            var object = new YMaps[constructor](point, {style: style, hasBalloon : !!description});\r\n            object.description = description;\r\n            \r\n            return object;\r\n        }\r\n    });\r\n</script>\r\n\r\n<div id=\"YMapsID-1024\">&nbsp;</div>\r\n\r\n<div style=\"text-align:right\"><a href=\"http://api.yandex.ru/maps/tools/constructor/\" style=\"color:#1A3DC1\">Создано с помощью инструментов Яндекс.Карт</a></div>\r\n\r\n<div>+7 (495) 723-60-57</div>\r\n&nbsp;\r\n\r\n<div>+7 (495) 723-60-87</div>\r\n<br />\r\nБесплатная доставка по Москве!</div>\";}','NSCmsBundle:Blocks:contentBlock','content',0,0,0),(16,5,'Заголовок страницы','NSCmsBundle:Blocks:headerMenuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','slider',0,0,0),(17,6,'Заголовок страницы','NSCmsBundle:Blocks:headerMenuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','slider',0,0,0),(18,6,'Текстовый блок',NULL,NULL,'NSCmsBundle:Blocks:contentBlock','content',0,0,0),(19,3,'Текстовый блок',NULL,'O:53:\"NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\":1:{s:62:\"\0NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\0content\";s:2610:\"<h3>Наша фирма занимается осетинскими пирогами с 2007 года.</h3>\r\n\r\n<p>Мы были одними из первых, кто решил поделится с москвичами чудесным вкусом осетинских пирогов.<br />\r\nНачиная работу три года назад, мы решили, сделать акцент на качестве, и вкусе наших пирогов и до сих пор мы не изменяем своему выбору.\\</p>\r\n\r\n<h3>Мы НЕ экономим на продуктах, а значит мы НЕ экономим на вас наши дорогие.</h3>\r\n\r\n<p>Тщательный отбор и строжайший контроль качества ингредиентов для приготовления наших пирогов, был и остается главным принципом в нашей работе. Все это мы делаем лишь для того, что бы вы могли прочувствовать всю прелесть и изысканность вкуса Настоящих осетинских пирогов.<br />\r\n<br />\r\nРассказывая все это вам, дорогой посетитель нашего сайта, мы прекрасно отдаем себе отчет, что вы возможно посетили не одну подобную веб страничку в интернете, прежде чем нашли нас, и во всех них написанно практичесски одно и то же...<br />\r\nЧем же отличаемся мы от десятка подобных фирм?<br />\r\nЗнаете, почти ничем, отличие всего лишь в одном, наши пироги просто вкуснее.<br />\r\n<br />\r\nООО &quot;Тарон&quot; - Осетинкие пироги<br />\r\nОГРН: 1117746084653<br />\r\nИНН/КПП: 7725715288/772501001<br />\r\nАдрес производства : 127055 г. Москва,, ул. Сущевская, д. 21, 2 подъезд, 1 этаж, пекарня<br />\r\nАдрес офиса: 115280, г. Москва, ул. Автозаводская, д. 17, корп. 3, офис 11</p>\r\n\r\n<p><strong>Прием заказов:</strong> с 09.00 до 21.00 без выходных.<br />\r\n<strong>Время доставки:</strong> 1- 1,5 часа.<br />\r\n<strong>Оплата:</strong> наличными курьеру.<br />\r\n<strong>Телефоны:</strong> (495) 723-60-57 (495) 723-60-87</p>\";}','NSCmsBundle:Blocks:contentBlock','content',0,0,0),(20,10,'Товары',NULL,NULL,'NSCatalogBundle:Blocks:itemsBlock','content',0,0,0),(21,9,'Карточка товара',NULL,NULL,'NSCatalogBundle:Blocks:itemBlock','content',-1,0,0),(22,9,'Заголовок страницы','NSCmsBundle:Blocks:headerMenuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','slider',0,0,0),(23,11,'Заголовок страницы','NSCmsBundle:Blocks:headerMenuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','slider',0,0,0),(25,11,'Корзина посетителя',NULL,NULL,'MGFrontBundle:Blocks:cartBlock','content',0,0,0),(26,12,'Заголовок страницы','NSCmsBundle:Blocks:headerMenuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','slider',0,0,0),(31,12,'Блок оформления заказа',NULL,NULL,'MGFrontBundle:Blocks:checkoutBlock','content',0,0,0);
/*!40000 ALTER TABLE `ns_cms_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_cms_pages`
--

DROP TABLE IF EXISTS `ns_cms_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_cms_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `t_left` int(11) NOT NULL,
  `t_level` int(11) NOT NULL,
  `t_right` int(11) NOT NULL,
  `t_root` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templatePath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7D67FAB9727ACA70` (`parent_id`),
  CONSTRAINT `FK_7D67FAB9727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `ns_cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_cms_pages`
--

LOCK TABLES `ns_cms_pages` WRITE;
/*!40000 ALTER TABLE `ns_cms_pages` DISABLE KEYS */;
INSERT INTO `ns_cms_pages` VALUES (1,NULL,1,0,22,1,'ns_cms_pages_root_page','ns_cms_pages_root_page',NULL,0,1),(2,1,2,1,9,1,'Главная','main','NSCmsBundle:Pages:page.html.twig',0,0),(3,1,10,1,11,1,'О компании','about','NSCmsBundle:Pages:page.html.twig',1,1),(4,1,12,1,13,1,'Оплата и доставка','payment-delivery','NSCmsBundle:Pages:page.html.twig',2,1),(5,1,14,1,15,1,'Контакты','contacts','NSCmsBundle:Pages:page.html.twig',3,1),(6,1,16,1,17,1,'Организация выездных банкетов','bankety','NSCmsBundle:Pages:page.html.twig',4,1),(8,2,3,2,8,1,'Каталог','catalog',NULL,0,1),(9,8,4,3,5,1,'Наше меню','item',NULL,0,1),(10,8,6,3,7,1,'Наше меню','category','NSCmsBundle:Pages:page.html.twig',1,1),(11,1,18,1,19,1,'Корзина','cart','NSCmsBundle:Pages:page.html.twig',5,0),(12,1,20,1,21,1,'Оформление заказа','checkout','NSCmsBundle:Pages:page.html.twig',6,0);
/*!40000 ALTER TABLE `ns_cms_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_documents_categories`
--

DROP TABLE IF EXISTS `ns_documents_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_documents_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_documents_categories`
--

LOCK TABLES `ns_documents_categories` WRITE;
/*!40000 ALTER TABLE `ns_documents_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_documents_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_documents_documents`
--

DROP TABLE IF EXISTS `ns_documents_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_documents_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `document` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C35953EC12469DE2` (`category_id`),
  CONSTRAINT `FK_C35953EC12469DE2` FOREIGN KEY (`category_id`) REFERENCES `ns_documents_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_documents_documents`
--

LOCK TABLES `ns_documents_documents` WRITE;
/*!40000 ALTER TABLE `ns_documents_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_documents_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_feedback_forms`
--

DROP TABLE IF EXISTS `ns_feedback_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_feedback_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `emails` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6FB48534C54C8C93` (`type_id`),
  CONSTRAINT `FK_6FB48534C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `ns_catalog_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_feedback_forms`
--

LOCK TABLES `ns_feedback_forms` WRITE;
/*!40000 ALTER TABLE `ns_feedback_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_feedback_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_gallery_categories`
--

DROP TABLE IF EXISTS `ns_gallery_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_gallery_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_BE588E2F989D9B62` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_gallery_categories`
--

LOCK TABLES `ns_gallery_categories` WRITE;
/*!40000 ALTER TABLE `ns_gallery_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_gallery_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_gallery_galleries`
--

DROP TABLE IF EXISTS `ns_gallery_galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_gallery_galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E287F7A4989D9B62` (`slug`),
  KEY `IDX_E287F7A412469DE2` (`category_id`),
  CONSTRAINT `FK_E287F7A412469DE2` FOREIGN KEY (`category_id`) REFERENCES `ns_gallery_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_gallery_galleries`
--

LOCK TABLES `ns_gallery_galleries` WRITE;
/*!40000 ALTER TABLE `ns_gallery_galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_gallery_galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_gallery_photos`
--

DROP TABLE IF EXISTS `ns_gallery_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_gallery_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ACDF0BDD4E7AF8F` (`gallery_id`),
  CONSTRAINT `FK_ACDF0BDD4E7AF8F` FOREIGN KEY (`gallery_id`) REFERENCES `ns_gallery_galleries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_gallery_photos`
--

LOCK TABLES `ns_gallery_photos` WRITE;
/*!40000 ALTER TABLE `ns_gallery_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_gallery_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_news_item`
--

DROP TABLE IF EXISTS `ns_news_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_news_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_news_item`
--

LOCK TABLES `ns_news_item` WRITE;
/*!40000 ALTER TABLE `ns_news_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_news_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_property`
--

DROP TABLE IF EXISTS `ns_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_property` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_property`
--

LOCK TABLES `ns_property` WRITE;
/*!40000 ALTER TABLE `ns_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_routing_routes`
--

DROP TABLE IF EXISTS `ns_routing_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_routing_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaults` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `requirements` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `active` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_32F6F7175E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_routing_routes`
--

LOCK TABLES `ns_routing_routes` WRITE;
/*!40000 ALTER TABLE `ns_routing_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_routing_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_seo_meta`
--

DROP TABLE IF EXISTS `ns_seo_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_seo_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_97B66763F47645AE` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_seo_meta`
--

LOCK TABLES `ns_seo_meta` WRITE;
/*!40000 ALTER TABLE `ns_seo_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_seo_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_shop_order_items`
--

DROP TABLE IF EXISTS `ns_shop_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_shop_order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:object)',
  PRIMARY KEY (`id`),
  KEY `IDX_D6CEE346126F525E` (`item_id`),
  KEY `IDX_D6CEE3468D9F6D38` (`order_id`),
  CONSTRAINT `FK_D6CEE346126F525E` FOREIGN KEY (`item_id`) REFERENCES `ns_catalog_items` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_D6CEE3468D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `ns_shop_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_shop_order_items`
--

LOCK TABLES `ns_shop_order_items` WRITE;
/*!40000 ALTER TABLE `ns_shop_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_shop_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ns_shop_orders`
--

DROP TABLE IF EXISTS `ns_shop_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ns_shop_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comments` longtext COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:object)',
  PRIMARY KEY (`id`),
  KEY `IDX_D4261CD9A76ED395` (`user_id`),
  CONSTRAINT `FK_D4261CD9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_shop_orders`
--

LOCK TABLES `ns_shop_orders` WRITE;
/*!40000 ALTER TABLE `ns_shop_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_shop_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-05 21:48:14
