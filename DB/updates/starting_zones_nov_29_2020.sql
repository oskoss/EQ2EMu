-- MySQL dump 10.17  Distrib 10.3.25-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: eq2emu
-- ------------------------------------------------------
-- Server version	10.3.25-MariaDB-0ubuntu0.20.04.1

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
-- Table structure for table `starting_zones`
--

DROP TABLE IF EXISTS `starting_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `starting_zones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` tinyint(3) unsigned NOT NULL DEFAULT 255,
  `race_id` tinyint(3) unsigned NOT NULL DEFAULT 255,
  `choice` tinyint(3) unsigned NOT NULL DEFAULT 255,
  `zone_id` int(11) unsigned NOT NULL DEFAULT 253,
  `is_instance` tinyint(1) NOT NULL DEFAULT 0,
  `min_version` int(10) NOT NULL DEFAULT 0,
  `max_version` int(10) NOT NULL DEFAULT 0,
  `x` float NOT NULL DEFAULT -999999,
  `y` float NOT NULL DEFAULT -999999,
  `z` float NOT NULL DEFAULT -999999,
  `heading` float NOT NULL DEFAULT -999999,
  `deity` int(11) NOT NULL DEFAULT 255,
  `ruleflag` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex` (`class_id`,`race_id`,`zone_id`,`choice`),
  KEY `FK_starting_zones` (`zone_id`),
  CONSTRAINT `FK_starting_zones` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `starting_zones`
--

LOCK TABLES `starting_zones` WRITE;
/*!40000 ALTER TABLE `starting_zones` DISABLE KEYS */;
INSERT INTO `starting_zones` VALUES (2,255,255,1,253,0,0,0,-999999,-999999,-999999,-999999,1,3,'Queens Colony, Good Deity/Alignment, skip tutorial'),(3,255,255,0,27,1,0,0,-999999,-999999,-999999,-999999,255,3,'Far Journey Tutorial which leads to Queens Colony, Outpost of the Overlord or Isle of Refuge'),(4,255,255,4,114,0,60085,65535,-999999,-999999,-999999,-999999,255,4,'Greater Faydark aka Kelethin'),(5,255,255,8,184,0,60085,65535,-999999,-999999,-999999,-999999,255,4,'Timorous Deep aka Gorowyn'),(6,255,255,16,34,0,60085,65535,-999999,-999999,-999999,-999999,255,4,'Darklight Wood aka Neriak'),(7,255,255,32,470,0,60085,65535,-999999,-999999,-999999,-999999,255,4,'Frostfang Sea aka New Halas'),(8,255,255,1,278,0,0,0,-999999,-999999,-999999,-999999,0,3,'Outpost of Overlord, Evil Deity/Alignment, skip tutorial');
/*!40000 ALTER TABLE `starting_zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-29 22:33:31
