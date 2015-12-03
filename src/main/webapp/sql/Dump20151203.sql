-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	5.7.9-log

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
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` int(11) DEFAULT NULL,
  `food` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jn3tyi7j8mcs3urad6ua71jt2` (`image`),
  KEY `FK_sta00ydvcijypnkxd3q2n82k4` (`food`),
  CONSTRAINT `FK_jn3tyi7j8mcs3urad6ua71jt2` FOREIGN KEY (`image`) REFERENCES `image` (`id`),
  CONSTRAINT `FK_sta00ydvcijypnkxd3q2n82k4` FOREIGN KEY (`food`) REFERENCES `food` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificated`
--

DROP TABLE IF EXISTS `certificated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificated` (
  `id` int(11) NOT NULL,
  `biological` int(11) DEFAULT NULL,
  `chemitry` int(11) DEFAULT NULL,
  `conduct` varchar(255) DEFAULT NULL,
  `english` int(11) DEFAULT NULL,
  `literity` int(11) DEFAULT NULL,
  `math` int(11) DEFAULT NULL,
  `physical` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificated`
--

LOCK TABLES `certificated` WRITE;
/*!40000 ALTER TABLE `certificated` DISABLE KEYS */;
INSERT INTO `certificated` VALUES (11,80,80,'best',80,80,80,80);
/*!40000 ALTER TABLE `certificated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `food` int(11) DEFAULT NULL,
  `store` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_r4bhghs8ci1kkf5o1q1hc9ubs` (`food`),
  KEY `FK_otjquiueks2h4lncn50048xp5` (`store`),
  KEY `FK_4ivt42gn164dv18bc7kd6ofkv` (`user`),
  CONSTRAINT `FK_4ivt42gn164dv18bc7kd6ofkv` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_otjquiueks2h4lncn50048xp5` FOREIGN KEY (`store`) REFERENCES `store` (`id`),
  CONSTRAINT `FK_r4bhghs8ci1kkf5o1q1hc9ubs` FOREIGN KEY (`food`) REFERENCES `food` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5mhmcbw3duykwyy6s9lx1s9t9` (`image`),
  CONSTRAINT `FK_5mhmcbw3duykwyy6s9lx1s9t9` FOREIGN KEY (`image`) REFERENCES `image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (13,'District 1','District 1',5),(14,'District 2','District 2',6),(15,'District 3','District 3',7),(16,'District 4','District 4',8),(17,'District 5','District 5',9),(18,'  District 6',' District 6',10),(19,'District 7','District 7',11),(20,'District 8','District 8',12),(21,'  District 9',' District 9',13),(22,' District 10','  District 10',14),(23,' District 11','  District 11',15),(24,' District 12','  District 12',16),(25,'  Binh Thanh',' Binh Thanh',17),(26,'  Tan Binh',' Tan Binh',18),(27,'  Phu Nhuan ',' Phu Nhuan ',19);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Everything about Business Analysis','Business Analysis'),(3,'Mathematics Faculty Of Greenwich University','Mathematics'),(4,'Bachelor of Computing','Bachelor of Computing'),(18,'Everything it reaches chemistry','Chemistry');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fileattached`
--

DROP TABLE IF EXISTS `fileattached`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fileattached` (
  `id` int(11) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fileattached`
--

LOCK TABLES `fileattached` WRITE;
/*!40000 ALTER TABLE `fileattached` DISABLE KEYS */;
/*!40000 ALTER TABLE `fileattached` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `foodType` int(11) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  `store` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3jltmsqadosrb7v30f00el2e1` (`foodType`),
  KEY `FK_dim0wva49xyo3oepgayu8qjns` (`image`),
  KEY `FK_mx1li15wtayu2u0lh0iw30bru` (`store`),
  CONSTRAINT `FK_3jltmsqadosrb7v30f00el2e1` FOREIGN KEY (`foodType`) REFERENCES `foodtype` (`id`),
  CONSTRAINT `FK_dim0wva49xyo3oepgayu8qjns` FOREIGN KEY (`image`) REFERENCES `image` (`id`),
  CONSTRAINT `FK_mx1li15wtayu2u0lh0iw30bru` FOREIGN KEY (`store`) REFERENCES `store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'','vasvas',6,45,1),(2,'','vává',6,40,1),(3,'','vasvasvas',6,46,1),(4,'','fadsfá',6,42,1),(5,'','vsaváá',6,47,1),(6,'','fà',6,44,1);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodtype`
--

DROP TABLE IF EXISTS `foodtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foodtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `foodType` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_nk2hgmochayja3m9m8e1ihsbv` (`foodType`),
  CONSTRAINT `FK_nk2hgmochayja3m9m8e1ihsbv` FOREIGN KEY (`foodType`) REFERENCES `foodtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodtype`
--

LOCK TABLES `foodtype` WRITE;
/*!40000 ALTER TABLE `foodtype` DISABLE KEYS */;
INSERT INTO `foodtype` VALUES (2,'Sea Food','Sea Food',NULL,'0'),(3,'River Food','River Food',2,'0'),(4,'vasvas','fsafas',2,'0'),(5,' bdasbasba',' badbasb',2,'0'),(6,'Món','Món',NULL,'1'),(7,'  Xào',' Xào',6,'0');
/*!40000 ALTER TABLE `foodtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ext` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `absolutely_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (5,'jpg','dis1.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis1.jpg','/project/resources/default/images/dis1.jpg'),(6,'jpg','dis2.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis2.jpg','/project/resources/default/images/dis2.jpg'),(7,'jpg','dis3.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis3.jpg','/project/resources/default/images/dis3.jpg'),(8,'jpg','dis4.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis4.jpg','/project/resources/default/images/dis4.jpg'),(9,'jpg','dis5.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis5.jpg','/project/resources/default/images/dis5.jpg'),(10,'jpg','dis6.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis6.jpg','/project/resources/default/images/dis6.jpg'),(11,'jpg','dis7.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis7.jpg','/project/resources/default/images/dis7.jpg'),(12,'jpg','dis8.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis8.jpg','/project/resources/default/images/dis8.jpg'),(13,'jpg','dis9.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis9.jpg','/project/resources/default/images/dis9.jpg'),(14,'jpg','dis10.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis10.jpg','/project/resources/default/images/dis10.jpg'),(15,'jpg','dis11.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis11.jpg','/project/resources/default/images/dis11.jpg'),(16,'png','dis12.png','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis12.png','/project/resources/default/images/dis12.png'),(17,'jpg','binhthanh.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\binhthanh.jpg','/project/resources/default/images/binhthanh.jpg'),(18,'jpg','tanbinh.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\tanbinh.jpg','/project/resources/default/images/tanbinh.jpg'),(19,'jpg','phu nhuan.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\phu nhuan.jpg','/project/resources/default/images/phu nhuan.jpg'),(22,'jpg','phu nhuan.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\phu nhuan.jpg','/project/resources/default/images/phu nhuan.jpg'),(24,'jpg','ad1.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\ad1.jpg','/project/resources/default/images/ad1.jpg'),(25,'jpg','mon1.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\mon1.jpg','/project/resources/default/images/mon1.jpg'),(26,'jpg','mon1.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\mon1.jpg','/project/resources/default/images/mon1.jpg'),(34,'jpg','dis8.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis8.jpg','/project/resources/default/images/dis8.jpg'),(35,'jpg','dis8.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis8.jpg','/project/resources/default/images/dis8.jpg'),(36,'jpg','dis8.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis8.jpg','/project/resources/default/images/dis8.jpg'),(37,'jpg','dis8.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis8.jpg','/project/resources/default/images/dis8.jpg'),(38,'jpg','dis8.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\dis8.jpg','/project/resources/default/images/dis8.jpg'),(39,'jpg','m3.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\m3.jpg','/project/resources/default/images/m3.jpg'),(40,'jpg','m3.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\m3.jpg','/project/resources/default/images/m3.jpg'),(41,'jpg','m3.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\m3.jpg','/project/resources/default/images/m3.jpg'),(42,'jpg','m3.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\m3.jpg','/project/resources/default/images/m3.jpg'),(43,'jpg','m3.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\m3.jpg','/project/resources/default/images/m3.jpg'),(44,'jpg','m3.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\m3.jpg','/project/resources/default/images/m3.jpg'),(45,'jpg','m2.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\m2.jpg','/project/resources/default/images/m2.jpg'),(46,'jpg','m2.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\m2.jpg','/project/resources/default/images/m2.jpg'),(47,'jpg','m2.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\m2.jpg','/project/resources/default/images/m2.jpg'),(48,'jpg','m2.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\m2.jpg','/project/resources/default/images/m2.jpg'),(49,'jpg','m3.jpg','D:\\up4d\\Example\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\project\\resources\\default\\images\\m3.jpg','/project/resources/default/images/m3.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_dlt_read` bit(1) DEFAULT NULL,
  `is_ee_read` bit(1) DEFAULT NULL,
  `is_pl_read` bit(1) DEFAULT NULL,
  `is_pvc_read` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (2,'New Report: \n Url: http://localhost/ewsd/report/2','New Report Added: Nguyen Anh Tu join program vavsvá','\0','','\0','');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `code` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ee` int(11) DEFAULT NULL,
  `faculty` int(11) DEFAULT NULL,
  `pl` int(11) DEFAULT NULL,
  `academic_year` varchar(255) DEFAULT NULL,
  `type_conduct` varchar(255) DEFAULT NULL,
  `type_grade` varchar(255) DEFAULT NULL,
  `isHot` bit(1) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_9q2aao5u4l1mnqx43m0huwxnn` (`ee`),
  KEY `FK_jf832u9j9sckmlpsl2mr3jets` (`faculty`),
  KEY `FK_jpwesoitj19tt0b5jine2muam` (`pl`),
  CONSTRAINT `FK_9q2aao5u4l1mnqx43m0huwxnn` FOREIGN KEY (`ee`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_jf832u9j9sckmlpsl2mr3jets` FOREIGN KEY (`faculty`) REFERENCES `faculty` (`id`),
  CONSTRAINT `FK_jpwesoitj19tt0b5jine2muam` FOREIGN KEY (`pl`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `point` int(11) DEFAULT NULL,
  `food` int(11) DEFAULT NULL,
  `store` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lxd0cq9f71y467yi87gyh97i0` (`food`),
  KEY `FK_swxvi65ow1uuy7hhjqg90evbm` (`store`),
  KEY `FK_mljpjh5vu18fmshuuni30uhlp` (`user`),
  CONSTRAINT `FK_lxd0cq9f71y467yi87gyh97i0` FOREIGN KEY (`food`) REFERENCES `food` (`id`),
  CONSTRAINT `FK_mljpjh5vu18fmshuuni30uhlp` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_swxvi65ow1uuy7hhjqg90evbm` FOREIGN KEY (`store`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isApproved` bit(1) DEFAULT NULL,
  `program` varchar(20) DEFAULT NULL,
  `student` int(11) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `isOverdue` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9s065l8i674emofwtdmwf4xae` (`program`),
  KEY `FK_j7krnuix5au29ief4mdaiir0a` (`student`),
  CONSTRAINT `FK_9s065l8i674emofwtdmwf4xae` FOREIGN KEY (`program`) REFERENCES `program` (`code`),
  CONSTRAINT `FK_j7krnuix5au29ief4mdaiir0a` FOREIGN KEY (`student`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator','admin'),(7,'Moderator','moderator'),(8,'User','user');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `close_hour` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `open_hour` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `price_limit` varchar(255) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  `storeType` int(11) DEFAULT NULL,
  `is_confirm` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6f70b50wcrmc9eekpoin1okyv` (`district`),
  KEY `FK_ilg97ij9lxonghg7s5jd6i2bg` (`image`),
  KEY `FK_pa0nuucgbxqsrjsxmaiquv9ma` (`storeType`),
  CONSTRAINT `FK_6f70b50wcrmc9eekpoin1okyv` FOREIGN KEY (`district`) REFERENCES `district` (`id`),
  CONSTRAINT `FK_ilg97ij9lxonghg7s5jd6i2bg` FOREIGN KEY (`image`) REFERENCES `image` (`id`),
  CONSTRAINT `FK_pa0nuucgbxqsrjsxmaiquv9ma` FOREIGN KEY (`storeType`) REFERENCES `foodtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'11A Le Thuc Hoach, P Phu Tho Hoa , Quan Tan Phu','11:00PM','<p>sdasdsadsa</p>','vdas','1:00AM','0912312412','100',13,48,3,NULL),(2,'11A Le Thuc Hoach, P Phu Tho Hoa , Quan Tan Phu','11:00PM','',' vsavasvasvas','1:00AM','0912312412','100',13,49,3,NULL);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `birthdate` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'190/3 Sư Vạn Hạnh, P9, Q5','11/03/2015','Nguyễn Trọng Nghĩa','\0','$2a$11$iZ4OP67cmyFH96MONZN7zOD1nHb4vZvH3PDJxhSpQECNWVO0yYiLe','0909076619','active','admin','trongnghia@gmail.com'),(17,'1 Moderator','02/11/1986','Mô đê ra to','\0','$2a$11$ayjipSKD5O/DN706m6JooOMFJ5ximoD77cHAti.4ghlOfXz1KLe9u','0909076622','active','moderator','moderator@gmail.com'),(18,'11A Le Thuc Hoach, P Phu Tho Hoa , Quan Tan Phu','01/01/1984','phan tuan tu','\0','$2a$11$exOSdHaIZUtKvtbiuQp9AOwQrSSjZ8fz.6WLT3hRRX8PsE42rp/Mq','0909076619','active','user1','user1@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `role_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  UNIQUE KEY `UK_g1uebn6mqk9qiaw45vnacmyo2` (`user_id`),
  CONSTRAINT `FK_5q4rc4fh1on6567qk69uesvyf` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_g1uebn6mqk9qiaw45vnacmyo2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1),(7,17),(8,18);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-03 17:01:44
