-- MySQL dump 10.13  Distrib 5.7.18, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: DBProject
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `group_post`
--

DROP TABLE IF EXISTS `group_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_post` (
  `idgroup_post` int(11) NOT NULL AUTO_INCREMENT,
  `user_num` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `post_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idgroup_post`),
  UNIQUE KEY `user_num_UNIQUE` (`user_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_post`
--

LOCK TABLES `group_post` WRITE;
/*!40000 ALTER TABLE `group_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_reply`
--

DROP TABLE IF EXISTS `group_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_reply` (
  `idgroup_reply` int(11) NOT NULL AUTO_INCREMENT,
  `idgroup_post` int(11) NOT NULL,
  `user_num` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `reply_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idgroup_reply`),
  UNIQUE KEY `user_num_UNIQUE` (`user_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_reply`
--

LOCK TABLES `group_reply` WRITE;
/*!40000 ALTER TABLE `group_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtag`
--

DROP TABLE IF EXISTS `hashtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hashtag` (
  `idhashtag` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(50) NOT NULL,
  PRIMARY KEY (`idhashtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag`
--

LOCK TABLES `hashtag` WRITE;
/*!40000 ALTER TABLE `hashtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `hashtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtag_connection`
--

DROP TABLE IF EXISTS `hashtag_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hashtag_connection` (
  `idhashtag_connection` int(11) NOT NULL AUTO_INCREMENT,
  `idreview` int(11) NOT NULL,
  `idhashtag` int(11) NOT NULL,
  `idrestaurant` int(11) NOT NULL,
  PRIMARY KEY (`idhashtag_connection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag_connection`
--

LOCK TABLES `hashtag_connection` WRITE;
/*!40000 ALTER TABLE `hashtag_connection` DISABLE KEYS */;
/*!40000 ALTER TABLE `hashtag_connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `idlocation` int(11) NOT NULL AUTO_INCREMENT,
  `loc_name` varchar(50) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`idlocation`),
  UNIQUE KEY `loc_name_UNIQUE` (`loc_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'학교',0),(2,'정문건너',10),(3,'영일중',15),(4,'서천동',25),(5,'영통중심상가',30);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `idmenu` int(11) NOT NULL AUTO_INCREMENT,
  `idrestaurant` int(11) NOT NULL,
  `menu_name` varchar(50) NOT NULL,
  `price` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,2,'돈코츠라멘','6500'),(2,2,'탄탄멘','7000'),(3,2,'차슈동','7000'),(4,2,'사케동','7500'),(5,2,'호카레','6000'),(6,2,'연어포케','8000'),(7,2,'만다린 샐러드','3500'),(8,5,'돈코츠라멘','6500'),(9,5,'츠케멘','7500'),(10,5,'부타동','6500'),(11,5,'아카라멘','7500'),(12,5,'소유라멘','7000'),(13,3,'미라멘-돈코츠라멘','6500'),(14,3,'특미라멘-돈코츠라멘','7500'),(15,3,'극라멘-닭스프라멘','7500'),(16,3,'츠케멘','7500'),(17,3,'규동-일본식 소고기덮밥','6500'),(18,3,'차슈동','7000'),(19,3,'특차슈동','8000'),(20,3,'부타동','6500'),(21,6,'하카타','6500'),(22,6,'큐슈','7000'),(23,6,'아사히카와','6500'),(24,6,'요코하마','6500'),(25,6,'아카사카','7000'),(26,6,'삿포로','7000'),(27,6,'미소탄탄멘','7500'),(28,6,'오이타라멘','7000'),(29,6,'가츠동','7000'),(30,6,'치즈가츠동','8000'),(31,6,'에비동','7000'),(32,6,'규동/매운규동','7000'),(33,7,'1인 소고기 전골','8900'),(34,7,'판모밀 + 대마끼 2ps','6900'),(35,7,'대왕유부초밥2ps','5000'),(36,7,'광어초밥4ps','6000'),(37,7,'연어초밥4ps','5000'),(38,7,'모듬사시미','35000'),(39,7,'산데모리 2인 사시미','20000'),(40,7,'참다랑어<아까미>사시미','30000'),(41,7,'생연어사시미','25000'),(42,7,'연어한마리Set','38000'),(43,7,'모듬초밥','15000'),(44,7,'활어초밥','15000'),(45,7,'참치초밥','18000'),(46,7,'연어초밥','14000'),(68,8,'특선초밥','25000'),(69,8,'광어세트','18000'),(70,8,'광어+연어','17000'),(71,8,'광어+소고기','16000'),(72,8,'모듬사시미','34000'),(73,8,'냉소바','6500'),(74,8,'새우튀김(5p)','5000'),(75,8,'타코야끼(5p)','5000'),(76,8,'왕새우튀김(1p)','2500'),(77,8,'타코와사비데마끼(1p)','2000'),(78,8,'새위튀김데마끼(1p)','2500'),(79,8,'어린이초밥','8000'),(80,8,'소고기초밥세트','16000'),(81,8,'광어+소고기','17000'),(82,8,'연어사시미','27000'),(83,8,'우동','6500'),(84,8,'사케동','12000'),(85,8,'치킨가라아게(5p)','6000'),(86,8,'고로케(5p)','6000'),(87,8,'날치알데마끼(1p)','2000'),(88,8,'연어알데마끼(1p)','4000'),(89,8,'성게알데마끼(1p)','6000');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_type`
--

DROP TABLE IF EXISTS `menu_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_type` (
  `idmenu_type` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`idmenu_type`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_type`
--

LOCK TABLES `menu_type` WRITE;
/*!40000 ALTER TABLE `menu_type` DISABLE KEYS */;
INSERT INTO `menu_type` VALUES (5,'분식'),(1,'아시안'),(3,'양식'),(4,'일식'),(7,'중식'),(6,'카페'),(8,'패스트푸드'),(2,'한식');
/*!40000 ALTER TABLE `menu_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `idrestaurant` int(11) NOT NULL AUTO_INCREMENT,
  `r_name` varchar(50) NOT NULL,
  `location` varchar(255) NOT NULL,
  `time` varchar(50) DEFAULT NULL,
  `idmenu_type` int(11) DEFAULT NULL,
  `reservation` int(11) DEFAULT '0',
  `phone` varchar(50) DEFAULT NULL,
  `idlocation` int(11) DEFAULT NULL,
  PRIMARY KEY (`idrestaurant`),
  UNIQUE KEY `idrestaurant_UNIQUE` (`idrestaurant`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (2,'호식당','경기 수원시 영통구 영일로 16-10','11:00 - 21:00',4,0,'01045234538',2),(3,'키와미루아지','경기 수원시 영통구 영일로 8','11:00 - 22:00',4,0,'312039015',2),(5,'온나무샤멘','경기도 수원시 영통구 덕영대로 1689',NULL,4,0,'0312025692',2),(6,'하코야','경기도 수원시 영통구 영통3동','11:00 - 22:00',4,0,'07077205677',5),(7,'작은집','경기도 수원시 영통구 청명북로7번길 16-2','15:00 - 02:00',4,1,'0313082222',3),(8,'초밥쟁이','경기 수원시 영통구 반달로 98','11:30 - 22:00',4,1,'0312042005',3);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `idreview` int(11) NOT NULL AUTO_INCREMENT,
  `user_num` int(11) NOT NULL,
  `idrestaurant` int(11) NOT NULL,
  `review` varchar(255) NOT NULL,
  `star` int(11) DEFAULT '0',
  `like` int(11) DEFAULT '0',
  PRIMARY KEY (`idreview`),
  UNIQUE KEY `user_num_UNIQUE` (`user_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_num` int(11) NOT NULL,
  `pw` varchar(255) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `birth` int(11) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  PRIMARY KEY (`user_num`),
  UNIQUE KEY `학번_UNIQUE` (`user_num`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-07 11:38:25
