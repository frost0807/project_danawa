-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: danawa
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `questionId` int unsigned NOT NULL,
  `writerId` int unsigned NOT NULL,
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `writtenDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `answer_question_key_idx` (`questionId`),
  KEY `answer_user_key_idx` (`writerId`),
  CONSTRAINT `answer_question_key` FOREIGN KEY (`questionId`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answer_user_key` FOREIGN KEY (`writerId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_user_info`
--

DROP TABLE IF EXISTS `business_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_user_info` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `userId` int unsigned NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nickname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `company` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `representative` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `corporate_number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  CONSTRAINT `buser_user_key` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_user_info`
--

LOCK TABLES `business_user_info` WRITE;
/*!40000 ALTER TABLE `business_user_info` DISABLE KEYS */;
INSERT INTO `business_user_info` VALUES (2,8,'사준석','사업자','business@gmail.com','123','사업자회사','사업자','123');
/*!40000 ALTER TABLE `business_user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `main_category` varchar(45) NOT NULL,
  `large_category` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `middle_category` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sub_category` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `specification` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'가전,TV','TV','TV전체상품','선택안함',''),(2,'가전,TV','TV','TV전체상품','203cm(80인치) 이상',''),(3,'가전,TV','TV','TV전체상품','176cm(70인치)대',''),(4,'가전,TV','TV','TV전체상품','151cm(60인치)대',''),(5,'가전,TV','프로젝터/스크린','프로젝터전체상품','선택안함',NULL),(6,'가전,TV','프로젝터/스크린','가정용','선택안함',NULL),(7,'가전,TV','프로젝터/스크린','휴대용','선택안함',NULL),(8,'컴퓨터,노트북,조립PC','노트북','노트북전체','인텔가성비노트북',NULL),(9,'컴퓨터,노트북,조립PC','노트북','애플맥북','2022년형',NULL),(10,'컴퓨터,노트북,조립PC','노트북','AMD노트북','5세대램브란트',NULL),(11,'컴퓨터,노트북,조립PC','노트북','노트북전체','선택안함','제조사/CPU종류/화면크기대/메모리용량/저장용량대/운영체제/무게');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_user_info`
--

DROP TABLE IF EXISTS `general_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `general_user_info` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `userId` int unsigned NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nickname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  CONSTRAINT `guser_user_key` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_user_info`
--

LOCK TABLES `general_user_info` WRITE;
/*!40000 ALTER TABLE `general_user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `general_user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `specification` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `categoryId` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_category_key_idx` (`categoryId`),
  CONSTRAINT `item_category_key` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (8,'123','','/img/item/searchBar.png',11),(11,'123','','/img/item/dogey.jpg',11),(12,'123','제조사=123/CPU종류=12/화면크기대=3324/메모리용량=33/저장용량대=131/운영체제=432545/무게=4523/','/img/item/dogey.jpg',11),(13,'123','제조사=123/CPU종류=42/화면크기대=3/메모리용량=ㄷㅅㄳ/저장용량대=2/운영체제=343/무게=453/','/img/item/dogey.jpg',11),(14,'지민아','제조사=123/CPU종류=ㅇㄹ/화면크기대=ㄱㄷㄱ/메모리용량=ㅇㅁㄴ/저장용량대=ㅇ/운영체제=ㅁㅇ/무게=ㅁㄴㅇ/','/img/item/dogey.jpg',11),(15,'aaa','제조사=asd/CPU종류=asd/화면크기대=asd/메모리용량=asd/저장용량대=a/운영체제=sd/무게=asd/','/img/item/',11);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nested_reply`
--

DROP TABLE IF EXISTS `nested_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nested_reply` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `replyId` int unsigned NOT NULL,
  `writerId` int unsigned NOT NULL,
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `writtenDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nested_reply`
--

LOCK TABLES `nested_reply` WRITE;
/*!40000 ALTER TABLE `nested_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `nested_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posting`
--

DROP TABLE IF EXISTS `posting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posting` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `itemId` int unsigned NOT NULL,
  `title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `written_date` datetime NOT NULL,
  `post_image_path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemId_UNIQUE` (`itemId`),
  CONSTRAINT `posting_item_key` FOREIGN KEY (`itemId`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posting`
--

LOCK TABLES `posting` WRITE;
/*!40000 ALTER TABLE `posting` DISABLE KEYS */;
INSERT INTO `posting` VALUES (1,12,'533241','gafadsf','2022-07-20 10:57:55','dsfdfdsf'),(14,13,'ㅂㅂㅂㅂ','ㅂㅂㅂㅂㅂㅂㅂㅂ','2022-07-21 10:22:02',NULL);
/*!40000 ALTER TABLE `posting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `postingId` int unsigned NOT NULL,
  `writerId` int unsigned NOT NULL,
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `writtenDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_posting_key_idx` (`postingId`),
  KEY `question_user_key_idx` (`writerId`),
  CONSTRAINT `question_posting_key` FOREIGN KEY (`postingId`) REFERENCES `posting` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_user_key` FOREIGN KEY (`writerId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `postingId` int unsigned NOT NULL,
  `writerId` int unsigned NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `grade` int unsigned NOT NULL,
  `writtenDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `review_posting_key_idx` (`postingId`),
  KEY `review_user_key_idx` (`writerId`),
  CONSTRAINT `review_posting_key` FOREIGN KEY (`postingId`) REFERENCES `posting` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_user_key` FOREIGN KEY (`writerId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_page_info`
--

DROP TABLE IF EXISTS `seller_page_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_page_info` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `postingId` int unsigned NOT NULL,
  `itemId` int unsigned NOT NULL,
  `price` int unsigned NOT NULL,
  `delivery_charge` int unsigned NOT NULL,
  `site_url` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `logo_url` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `seller_posting_key_idx` (`postingId`),
  KEY `seller_item_key_idx` (`itemId`),
  CONSTRAINT `seller_item_key` FOREIGN KEY (`itemId`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `seller_posting_key` FOREIGN KEY (`postingId`) REFERENCES `posting` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_page_info`
--

LOCK TABLES `seller_page_info` WRITE;
/*!40000 ALTER TABLE `seller_page_info` DISABLE KEYS */;
INSERT INTO `seller_page_info` VALUES (1,1,12,100000,3000,'https://prod.danawa.com/info/?pcode=16318025&cate=13241019','/img/logo/gmarket.gif'),(3,1,12,112431,2000,'https://prod.danawa.com/info/?pcode=16318025&cate=13241019','/img/logo/gmarket.gif');
/*!40000 ALTER TABLE `seller_page_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` int unsigned NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'admin','0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c'),(8,3,'사업자','0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'danawa'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-21 20:52:12
