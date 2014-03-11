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
INSERT INTO `fos_user` VALUES (1,'admin@admin.com','admin@admin.com','admin@admin.com','admin@admin.com',1,'dju24fp08oowo80gocc0k488ocs4w4c','odgAycgDmQMgOVnwmqbaLYoOfnSa/UCfrTi1DXvIdCBDBlK6NRwSdyKqwbPfwJJWnHgG70ilyv8BLB3mQ+y7CQ==','2014-03-11 17:39:04',0,0,NULL,NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}',0,NULL);
/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
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
INSERT INTO `ns_catalog_catalogs` VALUES (1,'Каталог продуктов','goods','mg_front.catalog.item_settings_type','MG\\FrontBundle\\Catalog\\ItemSettingsModel');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_catalog_items`
--

LOCK TABLES `ns_catalog_items` WRITE;
/*!40000 ALTER TABLE `ns_catalog_items` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_catalog_settings`
--

LOCK TABLES `ns_catalog_settings` WRITE;
/*!40000 ALTER TABLE `ns_catalog_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ns_catalog_settings` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_cms_blocks`
--

LOCK TABLES `ns_cms_blocks` WRITE;
/*!40000 ALTER TABLE `ns_cms_blocks` DISABLE KEYS */;
INSERT INTO `ns_cms_blocks` VALUES (1,NULL,'Блок меню','NSCmsBundle:Blocks:menuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','header',0,0,0),(2,NULL,'Блок меню',NULL,NULL,'NSCmsBundle:Blocks:menuBlock','footer',1,0,0),(3,NULL,'Текстовый блок',NULL,NULL,'NSCmsBundle:Blocks:contentBlock','footer',0,0,0),(5,NULL,'Текстовый блок',NULL,'O:53:\"NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\":1:{s:62:\"\0NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\0content\";s:451:\"<span><strong>© 2014 МосГурман</strong> — осетинские пироги с душой!</span>\r\n						<p>Все права на материалы, находящиеся на сайте, охраняются в соответствии с законодательством РФ. <br>\r\n						При любом использовании материалов сайта, письменное согласие обязательно.</p>\";}','NSCmsBundle:Blocks:contentBlock','copyright',0,0,0),(7,NULL,'Блок меню','NSCmsBundle:Blocks:footerMenuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','footer_menu',0,0,0),(8,NULL,'Меню категорий',NULL,'O:64:\"NS\\CatalogBundle\\Block\\Settings\\CategoriesMenuBlockSettingsModel\":5:{s:75:\"\0NS\\CatalogBundle\\Block\\Settings\\CategoriesMenuBlockSettingsModel\0sortOrder\";s:81:\"osietinskiie-piroghi,sladkiie-piroghi,torty-i-diesierty,kulinariia,salaty,napitki\";s:74:\"\0NS\\CatalogBundle\\Block\\Settings\\CategoriesMenuBlockSettingsModel\0template\";s:52:\"NSCatalogBundle:Blocks:categoriesMenuBlock.html.twig\";s:75:\"\0NS\\CatalogBundle\\Block\\Settings\\CategoriesMenuBlockSettingsModel\0isSubmenu\";b:0;s:75:\"\0NS\\CatalogBundle\\Block\\Settings\\CategoriesMenuBlockSettingsModel\0routeName\";s:19:\"ns_catalog_category\";s:85:\"\0NS\\CatalogBundle\\Block\\Settings\\CategoriesMenuBlockSettingsModel\0redirectToFirstItem\";b:0;}','NSCatalogBundle:Blocks:categoriesMenuBlock','catalog_menu',0,0,0),(9,2,'Слайдер с изображениями',NULL,NULL,'MGFrontBundle:Blocks:sliderBlock','slider',0,0,0),(11,10,'Заголовок страницы','NSCmsBundle:Blocks:headerMenuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','slider',0,0,0),(12,3,'Заголовок страницы','NSCmsBundle:Blocks:headerMenuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','slider',0,0,0),(13,4,'Заголовок страницы','NSCmsBundle:Blocks:headerMenuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','slider',0,0,0),(14,4,'Текстовый блок',NULL,'O:53:\"NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\":1:{s:62:\"\0NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\0content\";s:1182:\"<p>Наше предприятие занимается выпечкой осетинских пирогов с 2007г.</p>\r\n\r\n<p>Пироги выпекаются по оригинальному осетинскому рецепту с использованием ингредиентов высшего качества и при соблюдении всех санитарно-гигиенических норм и технических условий.</p>\r\n\r\n<h3><u>Минимальный заказ и район доставки уточняйте у оператора.</u></h3>\r\n\r\n<h3>Бесплатная доставка по Москве.</h3>\r\n\r\n<p><img alt=\"осетинские пироги телефон\" src=\"http://www.mosgurman.ru/images/stories/dostavka.jpg\" style=\"border:0px; float:left; height:93px; width:102px\" /></p>\r\n\r\n<p><strong>Прием заказов:</strong>&nbsp;с 09.00 до 21.00 без выходных.<br />\r\n<strong>Время доставки:</strong>&nbsp;1- 1,5 часа.<br />\r\n<strong>Оплата:</strong>&nbsp;наличными курьеру.<br />\r\n<strong>Телефоны:</strong>&nbsp;(495) 723-60-57 (495) 723-60-87</p>\";}','NSCmsBundle:Blocks:contentBlock','content',0,0,0),(15,5,'Текстовый блок',NULL,'O:53:\"NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\":1:{s:62:\"\0NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\0content\";s:3015:\"<div>Компания ООО &laquo;Тарон&raquo;&nbsp;- мы занимаемся приготовлением, продажей и доставкой осетинских приогов</div>\r\n\r\n<div class=\"adr\">Адрес производства: 127055&nbsp;г. Москва,&nbsp;ул. Сущевская, д. 21, 2 подъезд, 1 этаж, пекарня</div>\r\n\r\n<div>Адрес офиса: 115280, г. Москва, ул. Автозаводская, д. 17, корп. 3, офис 11</div>\r\n\r\n<div>Мы работаем&nbsp;с 9.00 до 21.00\r\n<p><img alt=\"осетинские пироги телефон\" src=\"http://www.mosgurman.ru/images/stories/telef.jpg\" style=\"border:0px; float:left; height:55px; width:32px\" /></p>\r\n<script src=\"http://api-maps.yandex.ru/1.1/?key=AO8Pb04BAAAAYkHucgIAQ5fuVe1_bNLp6mxReq0QfGYCfJ4AAAAAAAAAAAB1q351VGWU0y6a-X8nQcbMjAbIOA==&modules=pmap&wizard=constructor\" type=\"text/javascript\"></script> <script type=\"text/javascript\">\r\n    YMaps.jQuery(window).load(function () {\r\n        var map = new YMaps.Map(YMaps.jQuery(\"#YMapsID-1024\")[0]);\r\n        map.setCenter(new YMaps.GeoPoint(37.599658,55.782696), 16, YMaps.MapType.MAP);\r\n        map.addControl(new YMaps.Zoom());\r\n        map.addControl(new YMaps.ToolBar());\r\n        YMaps.MapType.PMAP.getName = function () { return \"Народная\"; };\r\n        map.addControl(new YMaps.TypeControl([\r\n            YMaps.MapType.MAP,\r\n            YMaps.MapType.SATELLITE,\r\n            YMaps.MapType.HYBRID,\r\n            YMaps.MapType.PMAP\r\n        ], [0, 1, 2, 3]));\r\n\r\n        YMaps.Styles.add(\"constructor#pmlbmPlacemark\", {\r\n            iconStyle : {\r\n                href : \"http://api-maps.yandex.ru/i/0.3/placemarks/pmlbm.png\",\r\n                size : new YMaps.Point(28,29),\r\n                offset: new YMaps.Point(-8,-27)\r\n            }\r\n        });\r\n\r\n       map.addOverlay(createObject(\"Placemark\", new YMaps.GeoPoint(37.600495,55.782309), \"constructor#pmlbmPlacemark\", \"Москва, ул. Сущевская, д. 21,  2 подъезд, 1 этаж\"));\r\n        \r\n        function createObject (type, point, style, description) {\r\n            var allowObjects = [\"Placemark\", \"Polyline\", \"Polygon\"],\r\n                index = YMaps.jQuery.inArray( type, allowObjects),\r\n                constructor = allowObjects[(index == -1) ? 0 : index];\r\n                description = description || \"\";\r\n            \r\n            var object = new YMaps[constructor](point, {style: style, hasBalloon : !!description});\r\n            object.description = description;\r\n            \r\n            return object;\r\n        }\r\n    });\r\n</script>\r\n\r\n<div id=\"YMapsID-1024\">&nbsp;</div>\r\n\r\n<div style=\"text-align:right\"><a href=\"http://api.yandex.ru/maps/tools/constructor/\" style=\"color:#1A3DC1\">Создано с помощью инструментов Яндекс.Карт</a></div>\r\n\r\n<div>+7 (495) 723-60-57</div>\r\n&nbsp;\r\n\r\n<div>+7 (495) 723-60-87</div>\r\n<br />\r\nБесплатная доставка по Москве!</div>\";}','NSCmsBundle:Blocks:contentBlock','content',0,0,0),(16,5,'Заголовок страницы','NSCmsBundle:Blocks:headerMenuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','slider',0,0,0),(17,6,'Заголовок страницы','NSCmsBundle:Blocks:headerMenuBlock.html.twig',NULL,'NSCmsBundle:Blocks:menuBlock','slider',0,0,0),(18,6,'Текстовый блок',NULL,NULL,'NSCmsBundle:Blocks:contentBlock','content',0,0,0),(19,3,'Текстовый блок',NULL,'O:53:\"NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\":1:{s:62:\"\0NS\\CmsBundle\\Block\\Settings\\ContentBlockSettingsModel\0content\";s:2610:\"<h3>Наша фирма занимается осетинскими пирогами с 2007 года.</h3>\r\n\r\n<p>Мы были одними из первых, кто решил поделится с москвичами чудесным вкусом осетинских пирогов.<br />\r\nНачиная работу три года назад, мы решили, сделать акцент на качестве, и вкусе наших пирогов и до сих пор мы не изменяем своему выбору.\\</p>\r\n\r\n<h3>Мы НЕ экономим на продуктах, а значит мы НЕ экономим на вас наши дорогие.</h3>\r\n\r\n<p>Тщательный отбор и строжайший контроль качества ингредиентов для приготовления наших пирогов, был и остается главным принципом в нашей работе. Все это мы делаем лишь для того, что бы вы могли прочувствовать всю прелесть и изысканность вкуса Настоящих осетинских пирогов.<br />\r\n<br />\r\nРассказывая все это вам, дорогой посетитель нашего сайта, мы прекрасно отдаем себе отчет, что вы возможно посетили не одну подобную веб страничку в интернете, прежде чем нашли нас, и во всех них написанно практичесски одно и то же...<br />\r\nЧем же отличаемся мы от десятка подобных фирм?<br />\r\nЗнаете, почти ничем, отличие всего лишь в одном, наши пироги просто вкуснее.<br />\r\n<br />\r\nООО &quot;Тарон&quot; - Осетинкие пироги<br />\r\nОГРН: 1117746084653<br />\r\nИНН/КПП: 7725715288/772501001<br />\r\nАдрес производства : 127055 г. Москва,, ул. Сущевская, д. 21, 2 подъезд, 1 этаж, пекарня<br />\r\nАдрес офиса: 115280, г. Москва, ул. Автозаводская, д. 17, корп. 3, офис 11</p>\r\n\r\n<p><strong>Прием заказов:</strong> с 09.00 до 21.00 без выходных.<br />\r\n<strong>Время доставки:</strong> 1- 1,5 часа.<br />\r\n<strong>Оплата:</strong> наличными курьеру.<br />\r\n<strong>Телефоны:</strong> (495) 723-60-57 (495) 723-60-87</p>\";}','NSCmsBundle:Blocks:contentBlock','content',0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ns_cms_pages`
--

LOCK TABLES `ns_cms_pages` WRITE;
/*!40000 ALTER TABLE `ns_cms_pages` DISABLE KEYS */;
INSERT INTO `ns_cms_pages` VALUES (1,NULL,1,0,18,1,'ns_cms_pages_root_page','ns_cms_pages_root_page',NULL,0,1),(2,1,2,1,9,1,'Главная','main','NSCmsBundle:Pages:page.html.twig',0,0),(3,1,10,1,11,1,'О компании','about','NSCmsBundle:Pages:page.html.twig',1,1),(4,1,12,1,13,1,'Оплата и доставка','payment-delivery','NSCmsBundle:Pages:page.html.twig',2,1),(5,1,14,1,15,1,'Контакты','contacts','NSCmsBundle:Pages:page.html.twig',3,1),(6,1,16,1,17,1,'Организация выездных банкетов','bankety','NSCmsBundle:Pages:page.html.twig',4,1),(8,2,3,2,8,1,'Каталог','catalog',NULL,0,1),(9,8,4,3,5,1,'Страница товара','item',NULL,0,1),(10,8,6,3,7,1,'Наше меню','category','NSCmsBundle:Pages:page.html.twig',1,1);
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

-- Dump completed on 2014-03-11 19:33:32
