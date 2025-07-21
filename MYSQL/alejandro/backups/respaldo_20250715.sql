-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bd_alejandro_20250714
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Current Database: `bd_alejandro_20250714`
--

--CREATE DATABASE /*!32312 IF NOT EXISTS*/ `bd_alejandro_20250714` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

--USE `bd_alejandro_20250714`;

--re
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `id` int(11) DEFAULT NULL,
  `doc` char(1) DEFAULT NULL,
  `nro` varchar(8) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `apellido` varchar(80) DEFAULT NULL,
  `telefono_hab` varchar(20) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (NULL,'V','1234','ANA','VASQUEZ',NULL,'SANTA FE','av@gmail.com','1960-08-15'),(NULL,'E','8100','PEDRO','ALMODOVAR',NULL,'CARICUAO','pa@gmail.com','1950-09-01'),(NULL,'P','9100','SARA','SUAREZ',NULL,'CHACAITO','ss@hotmail.com','1990-06-20'),(NULL,'V','5678','YOLANDA','TORTOZA',NULL,'CATIA LA MAR','yt@gmail.com','1978-10-15');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas1`
--

DROP TABLE IF EXISTS `personas1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc` char(1) DEFAULT NULL,
  `nro` int(11) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `apellido` varchar(80) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas1`
--

LOCK TABLES `personas1` WRITE;
/*!40000 ALTER TABLE `personas1` DISABLE KEYS */;
INSERT INTO `personas1` VALUES (1,'V',1234,'ANA','VASQUEZ','SANTA FE','av@gmail.com','1960-08-15'),(2,'E',8100,'PEDRO','ALMODOVAR','CARICUAO','pa@gmail.com','1950-09-01'),(3,'P',9100,'SARA','SUAREZ','CHACAITO','ss@hotmail.com','1990-06-20'),(4,'V',5678,'YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','1978-10-15'),(9,'V',9012,'NELLY','CONTRERAS','LA VEGA','nc@gmail.com','1968-07-16');
/*!40000 ALTER TABLE `personas1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas2`
--

DROP TABLE IF EXISTS `personas2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc` char(1) DEFAULT NULL,
  `nro` int(11) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `apellido` varchar(80) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `doc` (`doc`,`nro`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas2`
--

LOCK TABLES `personas2` WRITE;
/*!40000 ALTER TABLE `personas2` DISABLE KEYS */;
INSERT INTO `personas2` VALUES (1,'V',1234,'ANA','VASQUEZ','SANTA FE','av@gmail.com','1960-08-15'),(2,'E',8100,'PEDRO','ALMODOVAR','CARICUAO','pa@gmail.com','1950-09-01'),(3,'P',9100,'SARA','SUAREZ','CHACAITO','ss@hotmail.com','1990-06-20'),(4,'V',5678,'YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','1978-10-15'),(8,'V',9012,'nelly','contreras','la vega','nc@gmail.com','1960-08-15');
/*!40000 ALTER TABLE `personas2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(11) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `precio` decimal(13,2) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` varchar(80) DEFAULT NULL,
  `persona_contacto` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-16  8:46:49
