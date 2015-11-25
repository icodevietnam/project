-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: exam
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
INSERT INTO `certificated` VALUES (10,28,99,'best',100,77,88,88);
/*!40000 ALTER TABLE `certificated` ENABLE KEYS */;
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
INSERT INTO `program` VALUES ('P000001','sacsacas','cascas',5,1,4,'2015','best','21',NULL),('P000002','vasvasvas','svdsvsvs',5,1,4,'2015','best','12',NULL),('P000003','vsấvsa','vavsvá',5,1,4,'2015','best','80',NULL),('P000004',' vsavsavá',' vsavá',5,3,4,'2015','good','89',NULL),('P000005',' vcxvcxvcx',' vaáđsdsds',5,1,4,'2015','normal','90',NULL);
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator','admin'),(2,'Pro-Vice Chancellor','pvc'),(3,'Director of Learning and Quality','dlt'),(4,'Programme Leader','pl'),(5,'External Examiner ','ee'),(6,'Student','student');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'190/3 Sư Vạn Hạnh, P9, Q5','11/03/2015','Nguyễn Trọng Nghĩa','\0','$2a$11$iZ4OP67cmyFH96MONZN7zOD1nHb4vZvH3PDJxhSpQECNWVO0yYiLe','0909076619','active','admin','trongnghia@gmail.com'),(2,'7A Tan Trao Quan 7','11/03/1973','Vu Quoc Hoan','\0','$2a$11$W8kJD8tikwfsil0zAXvyReFfX5P817MyS/7CNXiiVI/Rbtj3BwYgG','0909079922','active','hoan.vu','hoan.vu2@gmail.com'),(3,'7A Tran Hung Dao','02/02/1987','Nguyen Quang Binh','\0','$2a$11$oXCplC3Due0NE.POnMD.TOyBW7qn0J5JBcfCTbrMrLm/kAOdKfqpe','0909080808','active','binh.nguyen','quang.binh@gmail.com'),(4,'2 Le Duan ','11/03/2015','Quang Nhat','\0','$2a$11$q8kEvw8sfRGxbEMXS2bipucdfdv4/EMXUBJrXQVY0pL7FknUvq0vq','0909020304','active','quang.nhat','quang.nhat@gmail.com'),(5,'12 Le Duan','01/01/1987','Hong Thuy','\0','$2a$11$lS15PYBecdDWOYUjBBsr9u7EPCoIyLwMs3Nz4D/zlfMh1UdO605Wi','0907989891','active','hong.thuy','hong.thuy@gmail.com'),(6,'11 Thanh Duc','11/10/1986','Thanh Duc a b c','\0','$2a$11$e7zF2KixEZ7BdLZIv0HC4eqJdlnSg7a.oVRfTp/Bggxr43EKiWAm2','0123111222','active','thanh.duc','thanh.duc@gmail.con'),(8,'1 Alexander Rhodes','11/10/2015','Khue Nguyen','\0','$2a$11$kLr17vQXciveLa3p3oPcH.c1Y1SgOCb978753d1pIekvmuwBMUt9K','0121345123','active','khue.nguyen','icoding.active@gmail.com'),(9,'1 Thanh Do','12/12/1993','Thanh Do ','\0','$2a$11$WiOmyc6bhUXY3vpWOUwOJ.Kda3ZluwPyDlNGCyKYoEyGriVTlkWj2','0909333222','active','thanh.do','thanh.do@gmail.com'),(10,'12 Anh Tu','12/12/1991','Nguyen Anh Tu','\0','$2a$11$Y7e9Hin4UH76f.jkowbaAeWdmaSwYZOo/cYmuiqFL8o3eeIy015TS','01234124124','active','anh.tu','anh.tu@gmail.com'),(11,'12 Anh Tu','12/12/1991','Nguyen Anh Tu','\0','$2a$11$hOiugoGKQe9zb1HPdjU8NOn5MI/hMQMheRo5EET4jChW4qDqJqEgO','01234124124','active','anh.tu','anh.tu@gmail.com'),(13,'12 Lanh Luu','01/01/1981','Luu Lanh','\0','$2a$11$RCG8/2GT1rHzvCqvhrJd0e4/RTgDFjVVQIQUxwe1R.a34kaAOnalW','0909090909','active','lanh.luu','lanh.luu@gmail.com'),(14,'12 Abavá','12/01/1984','Nguyen Nhat','\0','$2a$11$JPn/d/WBX1.0OHtR9xZJ2uaZXkPlna6wE0hbQmWKZvPI.clBIDzl.','0123124112','active','nhat.nguyen','nhat.nguyen@gmail.com');
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
INSERT INTO `user_roles` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(6,8),(6,9),(6,10),(6,11),(6,13),(6,14);
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

-- Dump completed on 2015-11-11 19:47:13
