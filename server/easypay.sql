-- MySQL dump 10.16  Distrib 10.1.19-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.19-MariaDB

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
-- Table structure for table `details`
--

DROP TABLE IF EXISTS `details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detailsid` varchar(100) NOT NULL,
  `detailsimg` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details`
--

LOCK TABLES `details` WRITE;
/*!40000 ALTER TABLE `details` DISABLE KEYS */;
INSERT INTO `details` VALUES (1,'1','33fc86bdbb03e50f92cf235f59631aa0.png'),(2,'1','e9d74364034642d3d943362f698ba417.png'),(3,'1','0f7c35fc72f4134b14cbdc76e51ba701.png'),(4,'2','a9005809f8ccae428201a5602e15fe93.png'),(5,'3','351a126ba69f7d843792d17f33a0778e.jpg'),(6,'4','9ab9da7abc99dbf23635c0bf05dbfd88.jpg'),(7,'4','804a91b37f719496ab695567653bc401.jpg'),(8,'4','6913e9e8b9a86cbed90e6f1878d435c4.jpg'),(9,'5','2c74927e37a16cce2913e09a9f0389a5.jpg'),(10,'5','11b98eff5c6809b0959e49a6a347e717.jpg'),(11,'5','a159080fb5672188215807e91abe7173.jpg'),(12,'6','55bc07d05b682cb3ef98e52e381bfdc2.jpg'),(13,'6','download4.jpg'),(14,'7','download5.jpg'),(15,'7','e3e370be0ea40c21e88b9d154014401b.jpg'),(16,'8','download.jpg'),(17,'8','4b98a3f037a541275bd8c32f357ecc0c.jpg'),(18,'8','48cea1ccc23b2dbcbbd825824221fe88.jpg'),(19,'9','3216fbeed18bc9c28fae865642b9d61c.jpg'),(20,'9','download3.jpg'),(21,'10','2e8133cfb14977b1e5a78c639dd10eed.jpg'),(22,'10','90d4b9e4c21c5cf45cb38230dafd979c.jpg'),(23,'10','cfca657d38076ee4310742ea4ef40162.jpg');
/*!40000 ALTER TABLE `details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro`
--

DROP TABLE IF EXISTS `pro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regionid` varchar(10) NOT NULL,
  `moreid` varchar(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `marketprice` decimal(8,2) DEFAULT NULL,
  `sale` varchar(10) DEFAULT NULL,
  `stock` varchar(10) DEFAULT NULL,
  `taxation` decimal(8,5) DEFAULT NULL,
  `listimg` varchar(100) NOT NULL,
  `highcomments` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `relation` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro`
--

LOCK TABLES `pro` WRITE;
/*!40000 ALTER TABLE `pro` DISABLE KEYS */;
INSERT INTO `pro` VALUES (1,'cn','travel','成都+峨眉山+乐山+都江堰6日5晚跟团游',1950.00,2300.00,'0','1000',27.30000,'33fc86bdbb03e50f92cf235f59631aa0.png',0,0,'sichuangtravel'),(2,'cn','travel','北京5日4晚跟团游',2537.00,3245.00,'0','1000',35.51800,'a9005809f8ccae428201a5602e15fe93.png',0,0,'beijing'),(3,'asia','travel','海南三亚+海口5日4晚跟团游',2020.00,2630.00,'0','1000',28.28000,'351a126ba69f7d843792d17f33a0778e.jpg',0,0,'sanya'),(4,'0','food','Date&Fate巧遇 牛奶星座饼干',13.50,25.00,'2','999',1.60650,'804a91b37f719496ab695567653bc401.jpg',0,0,'milk'),(5,'0','food','巧遇芝士巧克力星座饼干80克+芝士海盐时尚酥80克',19.90,25.00,'1','1000',2.36810,'b65329c6f26e7cacde4b2faef96f6eb7.jpg',0,0,'constellation'),(6,'0','food','老四川 山椒味 牛肉干',8.80,15.00,'16','984',1.04720,'2fd15a71e4126ef10c218384ed45aa63.jpg',0,0,'beef'),(7,'0','food',' 台湾手工牛轧糖礼盒',68.00,75.00,'1','999',8.09200,'398cef68e38e35973898b6f8be841e83.jpg',0,0,'nougat'),(8,'','luxury','圆环腰带侧开叉风衣',2145.00,2569.00,'0','1000',255.25500,'ac926bcad8190654189cc0bb41e41a58.jpg',0,0,'clothes'),(9,'','luxury','字母22K金项链套链吊坠',1690.00,1780.00,'0','1000',201.11000,'e23381ac6b063772cd9d61126f18aeee.jpg',0,0,'necklace'),(10,'','luxury','22K金手链',1596.00,1680.00,'0','1000',189.92400,'f316ecda5920436942ddf60d03df823d.jpg',0,0,'bracelet');
/*!40000 ALTER TABLE `pro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) NOT NULL,
  `password` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'13890635657','12345678abc'),(2,'1228375094@qq.com','12345678abc'),(3,'12306@qq.com','123456a'),(4,'1008611@qq.com','asdasd');
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

-- Dump completed on 2020-10-27 21:11:19
