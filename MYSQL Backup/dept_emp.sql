-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ch6
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept` (
  `dno` varchar(3) NOT NULL,
  `dname` varchar(45) DEFAULT NULL,
  `budget` int DEFAULT NULL,
  PRIMARY KEY (`dno`),
  UNIQUE KEY `dname_UNIQUE` (`dname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES ('d1','Marketing',10),('d2','Development',12),('d3','Research',5);
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp` (
  `eno` varchar(5) NOT NULL,
  `ename` varchar(45) DEFAULT NULL,
  `dno` varchar(3) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`eno`),
  KEY `fk_dno_idx` (`dno`),
  KEY `idx_ename` (`ename`) /*!80000 INVISIBLE */,
  KEY `idx_salary` (`salary`),
  CONSTRAINT `fk_dno` FOREIGN KEY (`dno`) REFERENCES `dept` (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES ('e1','Lopez','d1',40),('e2','Cheng','d1',42),('e3','Finzi','d2',30),('e4','Saito','d2',35),('e5','Edward','d3',40);
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `used_goods_board`
--

DROP TABLE IF EXISTS `used_goods_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `used_goods_board` (
  `BOARD_ID` varchar(5) NOT NULL,
  `WRITER_ID` varchar(50) DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `CONTENTS` varchar(1000) DEFAULT NULL,
  `PRICE` int DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `VIEWS` int DEFAULT NULL,
  PRIMARY KEY (`BOARD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `used_goods_board`
--

LOCK TABLES `used_goods_board` WRITE;
/*!40000 ALTER TABLE `used_goods_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `used_goods_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `used_goods_reply`
--

DROP TABLE IF EXISTS `used_goods_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `used_goods_reply` (
  `REPLY_ID` varchar(10) NOT NULL,
  `BOARD_ID` varchar(50) DEFAULT NULL,
  `WRITER_ID` varchar(50) DEFAULT NULL,
  `CONTENTS` varchar(1000) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`REPLY_ID`),
  KEY `fk_board_id_idx` (`BOARD_ID`),
  CONSTRAINT `fk_board_id` FOREIGN KEY (`BOARD_ID`) REFERENCES `used_goods_board` (`BOARD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `used_goods_reply`
--

LOCK TABLES `used_goods_reply` WRITE;
/*!40000 ALTER TABLE `used_goods_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `used_goods_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vemp`
--

DROP TABLE IF EXISTS `vemp`;
/*!50001 DROP VIEW IF EXISTS `vemp`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vemp` AS SELECT 
 1 AS `DNAME`,
 1 AS `ENO`,
 1 AS `ENAME`,
 1 AS `SALARY`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vemp2`
--

DROP TABLE IF EXISTS `vemp2`;
/*!50001 DROP VIEW IF EXISTS `vemp2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vemp2` AS SELECT 
 1 AS `eno`,
 1 AS `ename`,
 1 AS `salary`,
 1 AS `dname`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vemp`
--

/*!50001 DROP VIEW IF EXISTS `vemp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vemp` AS select `d`.`dname` AS `DNAME`,`e`.`eno` AS `ENO`,`e`.`ename` AS `ENAME`,`e`.`salary` AS `SALARY` from (`dept` `d` join `emp` `e`) where (`d`.`dno` = `e`.`dno`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vemp2`
--

/*!50001 DROP VIEW IF EXISTS `vemp2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vemp2` AS select `b`.`eno` AS `eno`,`b`.`ename` AS `ename`,`b`.`salary` AS `salary`,`a`.`dname` AS `dname` from (`dept` `a` join `emp` `b`) where (`a`.`dno` = `b`.`dno`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-29 10:42:04
