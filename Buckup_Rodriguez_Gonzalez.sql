-- En este backup se incluyen las tablas originales (carreras, clases, contacto_estudiantes, contacto_prof, cursos, estudiantes, pagos, profesores)
-- También se incluyen las tablas LOG para auditoría (deleted_carreras, new estudiantes).



CREATE DATABASE  IF NOT EXISTS `noe` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `noe`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: noe
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
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carreras` (
  `id_carrera` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_carrera`),
  UNIQUE KEY `id_carrera` (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,'Programacion'),(2,'Data'),(3,'Marketing Digital'),(4,'Diseño UX/UI'),(6,'Community Manager'),(10,'Digital Advertising'),(11,'Product Design');
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_carrera` AFTER DELETE ON `carreras` FOR EACH ROW INSERT INTO `new_carreras` (id_carrera, nombre, acciono_usuario, fecha, hora)
VALUES (OLD.id_carrera, OLD.nombre, session_user(), current_date(), current_time()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clases`
--

DROP TABLE IF EXISTS `clases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clases` (
  `id_clase` int NOT NULL AUTO_INCREMENT,
  `id_curso` int NOT NULL,
  `id_profesor` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_clase`),
  UNIQUE KEY `id_clase` (`id_clase`),
  KEY `id_curso` (`id_curso`),
  KEY `id_profesor` (`id_profesor`),
  CONSTRAINT `clases_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clases_ibfk_2` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clases`
--

LOCK TABLES `clases` WRITE;
/*!40000 ALTER TABLE `clases` DISABLE KEYS */;
INSERT INTO `clases` VALUES (1,1,1,'JavaScript'),(2,1,2,'SQL'),(3,1,1,'Back-End Development'),(4,2,2,'Desarrollo Web'),(5,2,1,'JavaScript'),(6,2,1,'React'),(7,3,1,'Fundamentos React'),(8,3,1,'Programacion con React'),(9,4,1,'Introduccion Python'),(10,4,1,'Programacion con Python'),(11,4,1,'Operadores y Controladores'),(12,5,2,'Data Analytics'),(13,5,2,'SQL'),(14,6,2,'Lenguaje SQL'),(15,6,2,'Consultas y Subconsultas'),(16,6,2,'Sublenguajes'),(17,7,2,'Introducción Power Bi'),(18,7,2,'Visualización de Datos'),(19,8,3,'Community Manager y Publicidad'),(20,8,3,'Customer Experience'),(21,8,3,'Inbound Marketing'),(22,9,3,'Facebook Ads'),(23,9,3,'Google Ads'),(24,10,4,'Diseño UX/UI'),(25,10,4,'Desarrollo Web');
/*!40000 ALTER TABLE `clases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto_estudiantes`
--

DROP TABLE IF EXISTS `contacto_estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto_estudiantes` (
  `id_contacto` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_contacto`),
  UNIQUE KEY `id_contacto` (`id_contacto`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `telefono` (`telefono`),
  KEY `id_estudiante` (`id_estudiante`),
  CONSTRAINT `contacto_estudiantes_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto_estudiantes`
--

LOCK TABLES `contacto_estudiantes` WRITE;
/*!40000 ALTER TABLE `contacto_estudiantes` DISABLE KEYS */;
INSERT INTO `contacto_estudiantes` VALUES (1,1,'noe91@hotmail.com','333-432-2324'),(2,2,'andream@gmail.com','412-452-5675'),(3,3,'richardg@yahoo.com','333-568-9356'),(4,4,'robertm@hotmail.com','612-234-5345'),(5,5,'wicha2010@yahoo.com','919-654-7867'),(6,6,'pedrop@hotmail.com','333-453-4890'),(7,7,'sergio91@hotmail.com','333-876-4623'),(8,8,'germano91@gmail.com','333-432-6720'),(9,9,'gabob@hotmail.com','333-023-9465'),(10,10,'jackson5@hotmail.com','333-455-2232'),(11,11,'jordan2000@gmail.com','333-889-9978'),(12,12,'paulmc@gmail.com','413-455-6455'),(13,13,'lenno_on@gmail.com','614-545-6657'),(14,14,'ringo_s@gmail.com','819-232-2234'),(15,15,'harrisong@hotmail.com','333-554-4445'),(16,16,'rafam9@hotmail.com','333-666-5656'),(17,17,'rigo_2000@hotmail.com','333-090-7878'),(18,18,'alfredoa@gmail.com','333-333-2323'),(19,19,'pablom@hotmail.com','333-778-7776'),(20,20,'cartman_colorado@hotmail.com','333-344-5633'),(21,21,'snowj@hotmail.com','333-787-2321'),(22,22,'pitt_b@gmail.com','333-999-0903'),(23,23,'chespirito@hotmail.com','333-111-2121');
/*!40000 ALTER TABLE `contacto_estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto_prof`
--

DROP TABLE IF EXISTS `contacto_prof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto_prof` (
  `id_contacto` int NOT NULL AUTO_INCREMENT,
  `id_profesor` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_contacto`),
  UNIQUE KEY `id_contacto` (`id_contacto`),
  UNIQUE KEY `email` (`email`),
  KEY `id_profesor` (`id_profesor`),
  CONSTRAINT `contacto_prof_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto_prof`
--

LOCK TABLES `contacto_prof` WRITE;
/*!40000 ALTER TABLE `contacto_prof` DISABLE KEYS */;
INSERT INTO `contacto_prof` VALUES (1,1,'messi10@hotmail.com','412-222-0000'),(2,2,'memoo1@gmail.com','333-122-3211'),(3,3,'salah_liv@hotmail.com','612-111-7756'),(4,4,'chichah10@hotmail.com','333-122-3344'),(5,5,'becker_liv@hotmail.com','412-440-6561');
/*!40000 ALTER TABLE `contacto_prof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `id_carrera` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_curso`),
  UNIQUE KEY `id_curso_UNIQUE` (`id_curso`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id_carrera`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,1,'Back-End Development'),(2,1,'Fron-End Development'),(3,1,'React'),(4,1,'Python'),(5,2,'Data Science'),(6,2,'SQL'),(7,2,'Power Bi'),(8,3,'Product Marketing'),(9,3,'Social Media Ads'),(10,4,'UX/UI Development');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deleted_carreras`
--

DROP TABLE IF EXISTS `deleted_carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deleted_carreras` (
  `id_carrera` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `acciono_usuario` char(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted_carreras`
--

LOCK TABLES `deleted_carreras` WRITE;
/*!40000 ALTER TABLE `deleted_carreras` DISABLE KEYS */;
INSERT INTO `deleted_carreras` VALUES (5,'Artes Digitales','root@localhost','2022-09-06','10:42:55');
/*!40000 ALTER TABLE `deleted_carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `id_estudiante` int NOT NULL AUTO_INCREMENT,
  `id_curso` int DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `curso_aprobado` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_estudiante`),
  UNIQUE KEY `id_estudiante` (`id_estudiante`),
  KEY `estudiantes_ibfk_1` (`id_curso`),
  CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,1,'Noe','Rodriguez',1),(2,1,'Andrea','Mendivil',1),(3,1,'Ricardo','Garcia',1),(4,1,'Roberto','Mendivil',1),(5,1,'Luisa','Lopez',1),(6,2,'Pedro','Puga',1),(7,2,'Sergio','Caballero',1),(8,2,'German','Ortega',1),(9,2,'Gabriel','Bravo',1),(10,2,'Michael','Jackson',1),(11,3,'Michael','Jordan',1),(12,3,'Paul','McCartney',1),(13,3,'John','Lennon',1),(14,3,'Ringo','Star',1),(15,3,'George','Harrison',1),(16,4,'Rafael','Marquez',1),(17,4,'Rigo','Tovar',1),(18,4,'Alfredo','Adame',1),(19,4,'Pablo','Marmol',1),(20,5,'Eric','Cartman',1),(21,5,'John','Snow',1),(22,5,'Brad','Pitt',1),(23,5,'Roberto','Bolaños',1),(24,NULL,'Barack','Obama',0);
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_add_estudiante` BEFORE INSERT ON `estudiantes` FOR EACH ROW INSERT INTO `new_estudiantes` (id_estudiante, first_name, last_name, acciono_usuario, fecha, hora)
VALUES (NEW.id_estudiante, NEW.first_name, NEW.last_name, session_user(), current_date(), current_time()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `new_estudiantes`
--

DROP TABLE IF EXISTS `new_estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_estudiantes` (
  `id_estudiante` int NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `acciono_usuario` char(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_estudiantes`
--

LOCK TABLES `new_estudiantes` WRITE;
/*!40000 ALTER TABLE `new_estudiantes` DISABLE KEYS */;
INSERT INTO `new_estudiantes` VALUES (0,'Barack','Obama','root@localhost','2022-09-06','10:29:46');
/*!40000 ALTER TABLE `new_estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int NOT NULL,
  `id_curso` int NOT NULL,
  `pagado` tinyint NOT NULL DEFAULT '0',
  `fecha_hora_pago` timestamp NULL DEFAULT NULL,
  `monto` int DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `id_pago` (`id_pago`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,1,1,0,NULL,0),(2,2,1,1,'2021-11-23 06:00:00',5939),(3,3,1,1,'2021-12-09 06:00:00',5000),(4,4,1,1,'2021-11-17 06:00:00',6050),(5,5,1,0,NULL,0),(6,6,2,1,'2022-06-18 05:00:00',4500),(7,7,2,0,NULL,0),(8,8,2,1,'2022-07-05 05:00:00',6500),(9,9,2,1,'2022-07-09 05:00:00',6500),(10,10,2,1,'2022-05-23 05:00:00',5000),(11,11,3,1,'2022-07-27 05:00:00',5394),(12,12,3,0,NULL,0),(13,13,3,0,NULL,0),(14,14,3,0,NULL,0),(15,15,3,1,'2022-08-20 05:00:00',5400),(16,16,4,1,'2022-08-18 05:00:00',5933),(17,17,4,1,'2022-08-20 05:00:00',7000),(18,18,4,1,'2022-08-21 05:00:00',7000),(19,19,4,0,NULL,0),(20,20,5,1,'2022-07-28 05:00:00',6340),(21,21,5,0,NULL,0),(22,22,5,1,'2021-06-03 05:00:00',4299),(23,23,5,0,NULL,0);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `id_profesor` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_profesor`),
  UNIQUE KEY `id_profesor` (`id_profesor`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,'Lionel','Messi'),(2,'Guillermo','Ochoa'),(3,'Mohamed','Salah'),(4,'Chicharito','Hernandez'),(5,'Alisson','Becker'),(6,'Jorge','Campos'),(7,'Elvis','Presley'),(8,'Ringo','Star'),(9,'Hugo','Sanchez'),(10,'Elton','Jhon'),(11,'Gustavo','Cerati'),(19,'Michael','Jackson'),(20,'Pedro','Picapiedra'),(21,'Juan','Perez'),(22,'Buggs','Bunny');
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vclases_profesores`
--

DROP TABLE IF EXISTS `vclases_profesores`;
/*!50001 DROP VIEW IF EXISTS `vclases_profesores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vclases_profesores` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `clase`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vcount_cursos`
--

DROP TABLE IF EXISTS `vcount_cursos`;
/*!50001 DROP VIEW IF EXISTS `vcount_cursos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vcount_cursos` AS SELECT 
 1 AS `Carrera`,
 1 AS `no. de Cursos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vemail_estudiantes`
--

DROP TABLE IF EXISTS `vemail_estudiantes`;
/*!50001 DROP VIEW IF EXISTS `vemail_estudiantes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vemail_estudiantes` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vestudiantes_cursos`
--

DROP TABLE IF EXISTS `vestudiantes_cursos`;
/*!50001 DROP VIEW IF EXISTS `vestudiantes_cursos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vestudiantes_cursos` AS SELECT 
 1 AS `curso`,
 1 AS `first_name`,
 1 AS `last_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vestudiantes_pagados`
--

DROP TABLE IF EXISTS `vestudiantes_pagados`;
/*!50001 DROP VIEW IF EXISTS `vestudiantes_pagados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vestudiantes_pagados` AS SELECT 
 1 AS `Estudiante`,
 1 AS `Status`,
 1 AS `Fecha y Hora`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vestudiantes_pago_2022`
--

DROP TABLE IF EXISTS `vestudiantes_pago_2022`;
/*!50001 DROP VIEW IF EXISTS `vestudiantes_pago_2022`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vestudiantes_pago_2022` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `Pagos 2022`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'noe'
--

--
-- Dumping routines for database 'noe'
--
/*!50003 DROP FUNCTION IF EXISTS `add_iva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `add_iva`(monto_bruto DECIMAL) RETURNS decimal(9,2)
    DETERMINISTIC
BEGIN
	DECLARE monto_iva DECIMAL(9, 2);
    DECLARE iva DECIMAL(4, 2);
    
    SET monto_iva = 0.00;
    SET iva = 1.16;
    SET monto_iva = monto_bruto * iva;
    
RETURN monto_iva;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `nombre_estudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nombre_estudiante`(id INT) RETURNS varchar(50) CHARSET utf8mb4
    READS SQL DATA
BEGIN
	DECLARE nombre VARCHAR (20);
    
    SET nombre = ' ';
    
    SELECT CONCAT (first_name, ' ', last_name) AS Estudiante INTO nombre
    FROM estudiantes
    WHERE id_estudiante = id;
    
    RETURN nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_profesor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_profesor`(IN nombre CHAR(50), IN apellido CHAR(50))
BEGIN    
    IF nombre AND apellido = '' THEN
		SET @mensaje = 'SELECT "ERROR: No product created"';
	ELSE
		SET @mensaje = CONCAT('INSERT INTO noe.profesores (first_name, last_name) VALUES ("', nombre, '", ', '"', apellido, '")');
        SET @seleccionar = 'SELECT * FROM noe.profesores ORDER BY id_profesor DESC';
	END IF;
    
    PREPARE querySQL FROM @mensaje;
    EXECUTE querySQL;
    DEALLOCATE PREPARE querySQL;
    
    PREPARE querySQL FROM @seleccionar;
    EXECUTE querySQL;
    DEALLOCATE PREPARE querySQL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_profesor3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_profesor3`(IN nombre CHAR(50), IN apellido CHAR(50))
BEGIN
	INSERT INTO noe.profesores (first_name, last_name) VALUES (nombre, apellido);
    SELECT * FROM noe.profesores;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_order_clases2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_order_clases2`(IN orderColumn CHAR(20), ASC_or_DESC CHAR(5))
BEGIN

    SET @clausula = CONCAT('SELECT * FROM noe.clases ORDER BY ', orderColumn, ' ', ASC_or_DESC);
    /* @clausila = 'SELECT * FROM noe.clases ORDER BY nombre ASC' */
    
    PREPARE querySQL FROM @clausula;
    EXECUTE querySQL;
    DEALLOCATE PREPARE querySQL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_queYaPagaron` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_queYaPagaron`(IN idEstudiante CHAR(5))
BEGIN
	SET @clausula = CONCAT("SELECT CONCAT(first_name, " ", last_name) AS Estudiante, IF (p.pagado = 0, 'No ha pagado', 'Ya pagó') AS Status, fecha_hora_pago AS 'Fecha y Hora'
	FROM pagos p
	JOIN estudiantes e ON p.id_estudiante = e.id_estudiante
    WHERE id_estudiante = ", idEstudiante, ";");
    
	PREPARE querySQL FROM @clausula;
    EXECUTE querySQL;
    DEALLOCATE PREPARE querySQL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vclases_profesores`
--

/*!50001 DROP VIEW IF EXISTS `vclases_profesores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vclases_profesores` AS select `p`.`first_name` AS `first_name`,`p`.`last_name` AS `last_name`,`c`.`nombre` AS `clase` from (`profesores` `p` join `clases` `c` on((`p`.`id_profesor` = `c`.`id_profesor`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vcount_cursos`
--

/*!50001 DROP VIEW IF EXISTS `vcount_cursos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vcount_cursos` AS select `ca`.`nombre` AS `Carrera`,count(`cu`.`nombre`) AS `no. de Cursos` from (`carreras` `ca` join `cursos` `cu` on((`ca`.`id_carrera` = `cu`.`id_carrera`))) group by `cu`.`id_carrera` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vemail_estudiantes`
--

/*!50001 DROP VIEW IF EXISTS `vemail_estudiantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vemail_estudiantes` AS select `e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`c`.`email` AS `email` from (`estudiantes` `e` join `contacto_estudiantes` `c` on((`e`.`id_estudiante` = `c`.`id_estudiante`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vestudiantes_cursos`
--

/*!50001 DROP VIEW IF EXISTS `vestudiantes_cursos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vestudiantes_cursos` AS select `c`.`nombre` AS `curso`,`e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name` from (`cursos` `c` join `estudiantes` `e` on((`c`.`id_curso` = `e`.`id_curso`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vestudiantes_pagados`
--

/*!50001 DROP VIEW IF EXISTS `vestudiantes_pagados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vestudiantes_pagados` AS select concat(`e`.`first_name`,' ',`e`.`last_name`) AS `Estudiante`,if((`p`.`pagado` = 0),'No ha pagado','Ya pagó') AS `Status`,`p`.`fecha_hora_pago` AS `Fecha y Hora` from (`pagos` `p` join `estudiantes` `e` on((`p`.`id_estudiante` = `e`.`id_estudiante`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vestudiantes_pago_2022`
--

/*!50001 DROP VIEW IF EXISTS `vestudiantes_pago_2022`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vestudiantes_pago_2022` AS select `e`.`first_name` AS `first_name`,`e`.`last_name` AS `last_name`,`p`.`fecha_hora_pago` AS `Pagos 2022` from (`pagos` `p` join `estudiantes` `e` on((`e`.`id_estudiante` = `p`.`id_estudiante`))) where (`p`.`fecha_hora_pago` >= '2022-01-01') */;
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

-- Dump completed on 2022-09-19 20:33:56
