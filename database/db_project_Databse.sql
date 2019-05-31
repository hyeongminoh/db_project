CREATE DATABASE  IF NOT EXISTS `DBProject` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `DBProject`;
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
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `idlocation` int(11) NOT NULL AUTO_INCREMENT,
  `loc_name` varchar(50) NOT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idlocation`),
  UNIQUE KEY `loc_name_UNIQUE` (`loc_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `idrestaurant` int(11) NOT NULL AUTO_INCREMENT,
  `r_name` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `time` varchar(50) DEFAULT NULL,
  `idmenu_type` int(11) DEFAULT NULL,
  `reservation` int(11) DEFAULT '0',
  `phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`idrestaurant`),
  UNIQUE KEY `idrestaurant_UNIQUE` (`idrestaurant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-31 18:54:29
