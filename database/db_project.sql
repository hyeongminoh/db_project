-- MySQL dump 10.13  Distrib 5.7.18, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: db_project
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
  PRIMARY KEY (`idgroup_post`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_post`
--

LOCK TABLES `group_post` WRITE;
/*!40000 ALTER TABLE `group_post` DISABLE KEYS */;
INSERT INTO `group_post` VALUES (1,0,'자대에서 같이 배달 시키실 분?','ㅈㄱㄴ 난 컴공동방임','2019-06-09 04:10:56'),(2,1,'정건에서 고기 구워먹을분','고기먹고싶','2019-06-09 04:20:12');
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
  PRIMARY KEY (`idgroup_reply`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_reply`
--

LOCK TABLES `group_reply` WRITE;
/*!40000 ALTER TABLE `group_reply` DISABLE KEYS */;
INSERT INTO `group_reply` VALUES (1,1,1,'저요~','2019-06-09 04:41:59'),(2,7,0,'오 고기 고','2019-06-09 04:42:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag`
--

LOCK TABLES `hashtag` WRITE;
/*!40000 ALTER TABLE `hashtag` DISABLE KEYS */;
INSERT INTO `hashtag` VALUES (1,'#가성비'),(2,'#경희대'),(3,'#경희대맛집'),(4,'#감성'),(5,'#영통역맛집'),(6,'#경희대국제캠퍼스'),(7,'#사케동'),(8,'#일식'),(9,'#힐링'),(10,'#데이트맛집'),(11,'#영통역'),(12,'#영통맛집'),(13,'#럽스타그램');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag_connection`
--

LOCK TABLES `hashtag_connection` WRITE;
/*!40000 ALTER TABLE `hashtag_connection` DISABLE KEYS */;
INSERT INTO `hashtag_connection` VALUES (1,1,1,2),(2,2,1,2),(3,3,1,2),(4,4,1,2),(5,5,1,2),(6,6,1,7),(7,7,2,5),(8,8,4,3),(9,9,3,2),(10,10,5,7),(11,11,9,9),(12,12,8,10),(13,13,2,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,2,'돈코츠라멘','6500'),(2,2,'탄탄멘','7000'),(3,2,'차슈동','7000'),(4,2,'사케동','7500'),(5,2,'호카레','6000'),(6,2,'연어포케','8000'),(7,2,'만다린 샐러드','3500'),(8,5,'돈코츠라멘','6500'),(9,5,'츠케멘','7500'),(10,5,'부타동','6500'),(11,5,'아카라멘','7500'),(12,5,'소유라멘','7000'),(13,3,'미라멘-돈코츠라멘','6500'),(14,3,'특미라멘-돈코츠라멘','7500'),(15,3,'극라멘-닭스프라멘','7500'),(16,3,'츠케멘','7500'),(17,3,'규동-일본식 소고기덮밥','6500'),(18,3,'차슈동','7000'),(19,3,'특차슈동','8000'),(20,3,'부타동','6500'),(21,6,'하카타','6500'),(22,6,'큐슈','7000'),(23,6,'아사히카와','6500'),(24,6,'요코하마','6500'),(25,6,'아카사카','7000'),(26,6,'삿포로','7000'),(27,6,'미소탄탄멘','7500'),(28,6,'오이타라멘','7000'),(29,6,'가츠동','7000'),(30,6,'치즈가츠동','8000'),(31,6,'에비동','7000'),(32,6,'규동/매운규동','7000'),(33,7,'1인 소고기 전골','8900'),(34,7,'판모밀 + 대마끼 2ps','6900'),(35,7,'대왕유부초밥2ps','5000'),(36,7,'광어초밥4ps','6000'),(37,7,'연어초밥4ps','5000'),(38,7,'모듬사시미','35000'),(39,7,'산데모리 2인 사시미','20000'),(40,7,'참다랑어<아까미>사시미','30000'),(41,7,'생연어사시미','25000'),(42,7,'연어한마리Set','38000'),(43,7,'모듬초밥','15000'),(44,7,'활어초밥','15000'),(45,7,'참치초밥','18000'),(46,7,'연어초밥','14000'),(68,8,'특선초밥','25000'),(69,8,'광어세트','18000'),(70,8,'광어+연어','17000'),(71,8,'광어+소고기','16000'),(72,8,'모듬사시미','34000'),(73,8,'냉소바','6500'),(74,8,'새우튀김(5p)','5000'),(75,8,'타코야끼(5p)','5000'),(76,8,'왕새우튀김(1p)','2500'),(77,8,'타코와사비데마끼(1p)','2000'),(78,8,'새위튀김데마끼(1p)','2500'),(79,8,'어린이초밥','8000'),(80,8,'소고기초밥세트','16000'),(81,8,'광어+소고기','17000'),(82,8,'연어사시미','27000'),(83,8,'우동','6500'),(84,8,'사케동','12000'),(85,8,'치킨가라아게(5p)','6000'),(86,8,'고로케(5p)','6000'),(87,8,'날치알데마끼(1p)','2000'),(88,8,'연어알데마끼(1p)','4000'),(89,8,'성게알데마끼(1p)','6000'),(90,9,'팟타이','11800'),(91,9,'팟시유','11800'),(92,9,'매운 해물 팟타이','12800'),(93,9,'해물 팟시유','12800'),(94,9,'치킨 팟타이','12800'),(95,9,'미고랭','11800'),(96,10,'닭쌀국수','8900'),(97,10,'넴','6900'),(98,10,'쌀국수 차돌','1300'),(99,10,'쌀국수 불고기','1200'),(100,10,'쌀국수 양지','9800'),(101,10,'짜까','22000'),(102,10,'볶음밥','9800'),(103,10,'야채볶음','9000'),(104,10,'분짜','15000'),(105,10,'반쎼오','18000'),(106,11,'소고기쌀국수','4500'),(107,11,'(곱)소고기쌀국수','5500'),(108,11,'사이공 볶음면','4500'),(109,11,'(곱)사이공 볶음면','5500'),(110,11,'사이공 볶음밥','4500'),(111,11,'(곱)사이공볶음밥 ','5500'),(112,11,'매운쌀국수','5000'),(113,11,'(곱)매운쌀국수','6000'),(114,11,'새우볼','4000'),(115,11,'사이공딤섬','4000'),(116,11,'사이공 치킨봉','4000'),(117,11,'분짜','8000'),(118,11,'짜조','4000'),(119,11,'콜라','1500'),(120,11,'스프라이트','1500'),(121,12,'생삼겹살(180g)','13000'),(122,12,'특목살(180g)','13000'),(123,12,'갈매기살(150g)','13000'),(124,12,'모둠한판(600g)','38000'),(125,12,'생갈비(200g)','13000'),(126,13,'안동/매콤 찜닭(소)','19000'),(127,13,'안동/매콤 찜닭(대)','37000'),(128,13,'신불찜닭(중)','29000'),(129,13,'안동/매콤 찜닭(중)','28000'),(130,13,'신불찜닭(소)','20000'),(131,14,'런치숯불갈비살 한정식(점심특선)','23000'),(132,14,'런치보리굴비 정식(점심특선)','26000'),(133,14,'상견례한정식','55000'),(134,14,'한우설화꽃등심 코스','86000'),(135,14,'양념갈비 세트','41000'),(136,14,'주류 반입비','20000'),(137,15,'알리오올리오','8000'),(138,15,'까르보나라','8500'),(139,15,'빠네','10000'),(140,15,'HELL파스타','9500'),(141,15,'갈릭파스타','8500'),(142,15,'디아블로파스타','9500'),(143,15,'할라피뇨파스타','9500'),(144,15,'갈릭스노윙피자','13000'),(145,15,'봉골레','8500'),(146,15,'로제','8500'),(147,15,'토마토칠리','8500'),(148,15,'크림카레파스타','9000'),(149,15,'고르곤졸라피자','9500'),(150,15,'멜팅치즈피자','12000'),(151,15,'갈릭포테이토피자','11000'),(152,16,'감바스','16000'),(153,16,'런치세트(파스타+미니샐러드+음료)','10000'),(154,16,'파스타(디너)','15000'),(155,16,'햄&치즈 플래터','14000'),(156,16,'찹스테이크','20000'),(157,16,'트러플오일 감자튀김 with 프로슈토','8000'),(158,17,'부리또','3500'),(159,17,'불고기부리또','4000'),(160,17,'퀘사디아','10000'),(161,17,'칠리새우부리또','5000'),(162,17,'타코','4000'),(163,17,'과카몰리 퀘사디아','13000'),(164,17,'떡갈비 부리또','5000'),(165,17,'데낄라','5000'),(166,18,'마퐁순살떡볶이','19000'),(167,18,'마퐁국물떡볶이','15000'),(168,18,'떡볶이+계란찜+모둠튀김+쿨피스','20000'),(169,18,'국물떡볶이+계란찜+모둠튀김+쿨피스','15000'),(170,18,'국물떡볶이+주먹밥+모둠튀김+쿨피스','20000'),(171,18,'마퐁치즈떡볶이','18000'),(172,18,'마퐁오뎅떡볶이','16000'),(173,18,'국물떡볶이+계란찜+모둠튀김+쿨피스','15000'),(174,18,'떡볶이+주먹밥+모둠튀김+쿨피스','15000'),(175,18,'계란찜','3000'),(176,18,'떡볶이+계란찜+주먹밥+모둠튀김+쿨피스','23000'),(177,18,'국물떡볶이+계란찜+주먹밥+쿨피스','15000'),(178,18,'셀프주먹밥','3000'),(179,18,'김말이','2000'),(180,19,'물냉면','5000'),(181,19,'비빔냉면','5000'),(182,19,'사리','2000'),(183,19,'좌우지간칼국수','6000'),(184,19,'왕만두','5000'),(185,19,'떡만두국','5000'),(186,19,'공기밥','1000'),(187,19,'만두전골(4인분)','25000'),(188,19,'만두전골(2인분-중)','20000'),(189,19,'만두전골(2인분-소)','15000'),(190,19,'칼국수사리','2000'),(191,19,'라면사리','1000'),(192,19,'맥주/소주','4000'),(193,19,'음료수','1000'),(194,20,'오뎅','2000'),(195,20,'모듬튀김','2500'),(196,20,'양념튀김','3000'),(197,20,'순대','3000'),(198,20,'떡볶이','3000'),(199,20,'라볶이','4000'),(200,20,'즉석김밥','2000'),(201,20,'참치김밥','3000'),(202,20,'치즈김밥','3000'),(203,20,'소고기김밥','3000'),(204,20,'라면','3000'),(205,20,'쫄면','4500'),(206,20,'비빔밥','4500'),(207,20,'돌솥비빔밥','5500'),(208,21,'마카롱','2200'),(209,22,'씨리얼빙수','5000~13000'),(210,22,'오레오빙수','6000~16000'),(211,22,'녹차빙수','5000~13000'),(212,23,'브륄레 밀크티','4300'),(213,23,'치즈커버 티','4100'),(214,23,'아메리카노','3800'),(215,23,'벨기에와플','2100'),(216,23,'밀크티 + 펄 콤비','4000'),(217,23,'타이치 밀크티','5000'),(218,23,'젤라또','3500'),(219,24,'양고기 80g','3000'),(220,24,'소양 80g','3000'),(221,24,'하얼빈홍창','2000'),(222,24,'소고기 80g','3000'),(223,24,'막창 80g','3000'),(224,24,'마라탕 100g','1500'),(225,24,'마라상궈 100g','2200'),(226,25,'짜장면','5000'),(227,25,'짬뽕','6000'),(228,25,'탕수육','12000~19000'),(229,26,'탕수육정식','6500'),(230,26,'깐풍기정식','7000'),(231,26,'짜장면','3500'),(232,26,'짬뽕','4500'),(233,26,'간짜장','5000'),(234,26,'우동','5000'),(235,26,'울면','5000'),(236,26,'삼선간짜장','7000'),(237,26,'삼선짬뽕','7000'),(238,27,'빅맥세트','4900-6400'),(239,27,'슈슈버거 세트','4900-6400'),(240,27,'더블 불고기 버거 세트','4900-6400'),(241,27,'골든 에그 치즈버거 세트','8900-9800'),(242,27,'골든 에그 치즈 버거(단품)','7500 - 8100'),(243,27,'그릴드 머쉬룸 버거 세트','8900-9800'),(244,27,'그릴드 머쉬룸 버거(단품)','7500 - 8100'),(245,27,'빅맥(단품)','4500 - 5100'),(246,27,'슈슈버거(단품) ','4500 - 5100'),(247,27,'더블 불고기 버거(단품)','4500 - 5100'),(248,27,'1955 버거 세트','6900 - 7800'),(249,27,'1955 버거 (단품)','5500 - 6100'),(250,27,'맥스파이시 상하이 버거 세트','5500 - 6400'),(251,27,'맥스파이시 상하이 버거(단품)','4500 - 5100'),(252,27,'슈비버거 세트','6900 - 7800'),(253,27,'슈비버거 (단품)','5500 - 6100'),(254,27,'쿼터파운더 치즈 세트','6500 - 7400'),(255,27,'쿼터파운더 치즈(단품)','5000 - 5600');
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
  `image` text,
  PRIMARY KEY (`idrestaurant`),
  UNIQUE KEY `idrestaurant_UNIQUE` (`idrestaurant`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (2,'호식당','경기 수원시 영통구 영일로 16-10','11:00 - 21:00',4,0,'01045234538',2,'http://mblogthumb4.phinf.naver.net/MjAxODA0MTFfMjQ2/MDAxNTIzNDIxNTA2OTA3.kuWe_KFiNfJDtgZhylY63L00ByFukluvHFR9WsTuCo0g.9vNpcnNGnGZHZNKKmyJ9cbqOwYXorVJObpYRBytXvEog.JPEG.vkehv11/image_7592698731523421421408.jpg?type=w800'),(3,'키와미루아지','경기 수원시 영통구 영일로 8','11:00 - 22:00',4,0,'312039015',2,'http://mblogthumb2.phinf.naver.net/MjAxODAzMTJfMTg2/MDAxNTIwODMzMDY1NTE0.WZBx4GaD45MXgVhq6F29R2q4ry7FpxbZgMpDahTACVYg.Lggh5kBWdoddeioij2inRbvdrhIk-oKv_XoxGvGBP4gg.JPEG.mylovelysun13/P1250672.JPG?type=w2'),(5,'온나무샤멘','경기도 수원시 영통구 덕영대로 1689',NULL,4,0,'0312025692',2,'http://mblogthumb3.phinf.naver.net/MjAxNjExMTVfMTA4/MDAxNDc5MTg0OTEwODA5.93Tju3hQ2Ky0AOXQG6AkvBXeuBoRWvZjUIHQ96Tfxyog.xNjAoeRsHNadJ8X4kiOQoMdfJ2HwQMJms8tBzoQ-sKUg.JPEG.m_m_b_/2016_1111_20051900.jpg?type=w800'),(6,'하코야','경기도 수원시 영통구 영통3동','11:00 - 22:00',4,0,'07077205677',5,'http://mblogthumb4.phinf.naver.net/20150826_299/mghsh1004_1440585983520rc3fD_JPEG/20150820_155450-1.jpg?type=w2'),(7,'작은집','경기도 수원시 영통구 청명북로7번길 16-2','15:00 - 02:00',4,1,'0313082222',3,'https://mblogthumb-phinf.pstatic.net/MjAxODA3MDVfMTc0/MDAxNTMwNzk4MDMyNzM4.Xn3dgRu-f3uanFgjHFUVI31KraX65FwQw1w3XsaYH_0g.dHD9T4sFxvVhnOTfefjFhZKwky40dvC7HxsrZhjfAUEg.JPEG.rashness7/image_991680861530795844553.jpg?type=w800'),(8,'초밥쟁이','경기 수원시 영통구 반달로 98','11:30 - 22:00',4,1,'0312042005',3,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThxY8snSvRdtDPC4eRiiIKCWK-eIfQY9zF63UMeSQ876RGQkgd'),(9,'메콩타이','경기 수원시 영통구 반달로 26 천마빌딩 2층 208호','10:30 - 21:30',1,0,'0312737111',5,'https://mblogthumb-phinf.pstatic.net/MjAxODA1MjJfOTgg/MDAxNTI2OTg2MjU1MTM0.3IgF56ub1reBcjuCcSmuNHUWj5zJOgfZqdrx7CCCurgg.glb88iHR2Z061bVaNUdTKA8D26mDEU15VkFRXae_FqIg.JPEG.tmfal0808/IMG_1967.jpg?type=w2'),(10,'에머이','경기 수원시 영통구 반달로 105','11:00 - 22:00',1,0,'0312037174',3,'http://mblogthumb3.phinf.naver.net/MjAxODAzMjBfNTAg/MDAxNTIxNTU1OTE2Njcy.labwcY3SgktKC8OiDdf2EqmUE4XFbRtvM3n-XOMnfVog.sjR5MgCikTUr1DJoPoAOGXYkO8fVN5WkVs0xzsixKlYg.JPEG.eunzzangg2/image_2516870911521555655197.jpg?type=w800'),(11,'미스사이공','경기도 수원시 영통구 봉영로 1612','09:30 - 22:00',1,0,'0312030420',5,'https://t1.daumcdn.net/cfile/tistory/99C43F3359A03FF73A'),(12,'하남돼지집 수원영통점','경기도 수원시 영통구 매영로 426','17:00 - 24:00',2,1,'0312053392',2,'https://t1.daumcdn.net/cfile/tistory/2201954A573BCAFD30'),(13,'꽃찬찜닭 영통점','경기 수원시 영통구 매영로 414','11:00 - 22:00',2,1,'0312027702',2,'https://t1.daumcdn.net/cfile/tistory/2365F04D58D5CF0708'),(14,'경복궁 수원점','경기 수원시 영통구 반달로 31','11:30 - 22:00',2,1,'0312057778',3,'http://mblogthumb2.phinf.naver.net/20151220_237/lovelysuns_1450620693343NLtCq_JPEG/20151220_141427_HDR.jpg?type=w800'),(15,'익스프레스 파스타 앤 피자','경기 수원시 영통구 매영로425번길 1','12:00 - 21:00',3,0,'0312026523',2,'https://scontent-atl3-1.cdninstagram.com/vp/13743431cfa602be2bace755f103cc45/5CFFC2D9/t51.2885-15/e35/19985631_750100001827933_8631364026925842432_n.jpg?_nc_ht=scontent-atl3-1.cdninstagram.com'),(16,'비스트로221','경기 수원시 영통구 청명남로 4번길 16','12:00 - 24:00',3,1,'0312731999',3,'https://scontent-lhr3-1.cdninstagram.com/vp/21cc43116bc0de630182bad303cf68b6/5D9636C0/t51.2885-15/e35/51240574_413716229376816_5080606136227717462_n.jpg?_nc_ht=scontent-lhr3-1.cdninstagram.com&se=7&ig_cache_key=MTk4NzAwMzE4ODY0MjE0MzcxNw%3D%3D.2'),(17,'멕시모부리또','경기 수원시 영통구 덕영대로 1681번길 14','09:00 - 23:00',3,1,'0312029976',2,'http://mblogthumb3.phinf.naver.net/MjAxNzA2MDVfMjE0/MDAxNDk2NjczODIwNTIx.Bqcz41g4Vn0Y-5eUvJo7tsepvDRz1QkVwOoEi-0AQoMg.mvWWawyWwN-A5-phb-sownjur5Cyd6gyA8u8ed20qiwg.JPEG.chaerine90/IMG_1437.jpg?type=w800'),(18,'마퐁떡볶이','경기 용인시 기흥구 서그내로 15번길 33','11:30 - 01:00',5,0,'05074601682',1,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZEFxLECp6SasMp2HV3_MDyxc1sibFQdpHqFJO9cWemyDKLueXoA'),(19,'좌우지간','경기 수원시 영통구 매영로 416','09:30 - 21:30',5,0,'0312027117',2,'https://postfiles.pstatic.net/20131024_171/alvin9393_13825427711584n9xG_JPEG/IMG_9055.jpg?type=w1'),(20,'분식나라 김밥마을','경기 수원시 영통구 덕영대로 1699',NULL,5,0,'0312060599',2,'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory&fname=http%3A%2F%2Fcfile21.uf.tistory.com%2Fimage%2F9935CB435AD31C3B29EFBE'),(21,'로코블링','경기 수원시 영통구 영일로 16-10','11:30 - 19:00',6,0,'01023527334',2,'https://postfiles.pstatic.net/MjAxNzEwMjNfNyAg/MDAxNTA4NzIyMzg3MDMz.a5x4pa0lkR17ujahueUxNlY0FUOE-h4cZ9yMGOMnXQEg.KANgMlOWfmmX7t-Z8tCZZw1_Gb_6fjn2YjsJO6hjpwgg.JPEG.specimenlook/IMG_9056.JPG?type=w1'),(22,'화이트스노우빙수 영통점','경기 수원시 영통구 영일로 5','11:00 - 23:00',6,0,'0312069111',2,'http://mblogthumb1.phinf.naver.net/20140515_108/s_tassimusic_1400154450091l1PJ6_JPEG/%BA%F92.jpg?type=w2'),(23,'스위티두','경기 수원시 영통구 영일로6번길 35','10:00 - 02:00',6,0,'07042409992',2,'https://mblogthumb-phinf.pstatic.net/MjAxODA3MDlfMTEz/MDAxNTMxMTE3NTQ3NDg3.KpoNjds1agvbEY-niS6uvLyByD2h9sE26hjOr9HIMTEg.qCkSwUZUjowSf7pp4AKlH-ZZnJMdex0mPRGVMqqH5hgg.JPEG.hsj721224/KakaoTalk_Moim_5xQGqydlPomjpVv3i1lXgvWMUr5omC.jpg?type=w800'),(24,'얜시부촨미훠궈','경기 수원시 영통구 영일로6번길 47',NULL,7,0,'0312054225',2,'https://mblogthumb-phinf.pstatic.net/MjAxODA3MTJfOTIg/MDAxNTMxMzUzNTY0NTM3.BisCaDWGkaNRXl0yWkwjRt9pA5TRXK_PmPgIYgSZDh8g.IrRrhEGH_8ARyxQJ4u2UrXBV7OTArwxexOKYGyaR7lcg.JPEG.loving7002/image_7273366851531353321671.jpg?type=w800'),(25,'짬뽕타임 영통점','경기 수원시 영통구 매영로 390','00:00 - 24:00',7,0,'0312060223',3,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBmosQzZFgp_XF9srCwsL-06RMRmijqUbQ31RSGXB2yG3Y24V72Q'),(26,'미챠이','경기 용인시 기흥구 서그내로15번길 34',NULL,7,0,'0312054546',1,'https://t1.daumcdn.net/cfile/tistory/252BFF4D5551E60E1E'),(27,'맥도날드','경기 수원시 영통구 덕영대로 1703','00:00 - 24:00',8,0,'07072091056',2,'http://img.khan.co.kr/news/2018/03/02/l_2018030101000134300004501.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,2,2,'그냥 그럼.가게가 작다',3,2),(2,3,2,'개 맛있음',5,1),(3,4,2,'가성비 좋다',4,2),(4,5,2,'자리가 좁다',2,2),(5,6,2,'카레가 맛있다.',3,0),(6,7,3,'초밥 좋아하면 꼭 가야됨.',4,2),(7,8,2,'일본 감성 뿜뿜',4,2),(8,9,2,'사케동 먹고 싶으면 가는 곳',5,6),(9,10,2,'라멘 먹고싶은면 항상 방문',5,2),(10,11,2,'사장님이 친절하시다',3,1),(11,12,2,'내 입맛에는 별로...',1,3),(12,13,3,'라멘은 여기가 제일 맛있음',5,3),(13,14,3,'전형적인 라멘짐',3,1);
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
INSERT INTO `user` VALUES (0,'0621','오형민',960621,'치즈사이다'),(1,'0715','정선교',910715,'사랑꾼'),(2,'1213', '김철수', 971213,'학식요정'),(3,'0505','이영희', 940505, '밤샘야식');
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

-- Dump completed on 2019-06-09 15:24:26
