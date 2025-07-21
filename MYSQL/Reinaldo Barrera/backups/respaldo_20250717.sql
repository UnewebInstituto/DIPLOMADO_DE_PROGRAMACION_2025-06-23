-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bd_reinaldo_20250714
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
-- Current Database: `bd_reinaldo_20250714`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `bd_reinaldo_20250714` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `bd_reinaldo_20250714`;

--
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
INSERT INTO `personas` VALUES (NULL,'V','1234','Ana','Vasquez',NULL,'Santa Fe','av@gmail.com','1960-08-01'),(NULL,'E','8100','Pedro','Almodovar',NULL,'Caricuao','pa@gmail.com','1950-09-15'),(NULL,'P','9100','Sara','Suarez',NULL,'Chacaito','ss@hotmail.com','1990-06-20'),(NULL,'V','5678','Yolanda','Tortoza',NULL,'catia la mar','yt@hotmail.com','1978-10-15');
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
INSERT INTO `personas1` VALUES (1,'V',1234,'Ana','Vasquez','Santa Fe','av@gmail.com','1960-08-01'),(2,'E',8100,'Pedro','Almodovar','Caricuao','pa@gmail.com','1950-09-15'),(3,'P',9100,'Sara','Suarez','Chacaito','ss@hotmail.com','1990-06-20'),(4,'V',5678,'Yolanda','Tortoza','catia la mar','yt@hotmail.com','1978-10-15'),(10,'V',9012,'Nelly','Contreras','La vega','nc@gmail.com','1968-07-16');
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
INSERT INTO `personas2` VALUES (1,'V',1234,'Ana','Vasquez','Santa Fe','av@gmail.com','1960-08-01'),(2,'E',8100,'Pedro','Almodovar','Caricuao','pa@gmail.com','1950-09-15'),(3,'P',9100,'Sara','Suarez','Chacaito','ss@hotmail.com','1990-06-20'),(4,'V',5678,'Yolanda','Tortoza','catia la mar','yt@hotmail.com','1978-10-15'),(8,'V',9012,'Nelly','Contreras','La vega','nc@gmail.com','1968-07-16');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,'NEVERA',500.25,6),(2,1,'CONGELADOR',250.75,3),(3,1,'LAVADORA 10KG',300.00,8),(4,1,'COCINA DE GAS',120.00,10),(5,2,'CONGELADOR',275.00,5),(6,2,'HORNO ELECTRICO',450.00,3),(7,2,'LAVADORA 10KG',295.00,12),(8,2,'COCINA ELECTRICA',350.00,2),(9,3,'NEVERA',450.00,3),(10,3,'LAVADORA',380.00,6),(11,3,'COCINA DE GAS',230.00,12),(12,3,'COCINA ELECTRICA',120.00,8),(13,4,'NEVERA',590.75,3),(14,4,'CONGELADOR',249.99,6),(15,4,'LAVADORA 10KG',310.00,3),(16,4,'COCINA DE GAS',170.00,8),(18,5,'NEVERA',400.25,9);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_sin_fk`
--

DROP TABLE IF EXISTS `productos_sin_fk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos_sin_fk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(11) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `precio` decimal(13,2) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_sin_fk`
--

LOCK TABLES `productos_sin_fk` WRITE;
/*!40000 ALTER TABLE `productos_sin_fk` DISABLE KEYS */;
INSERT INTO `productos_sin_fk` VALUES (1,1,'NEVERA',500.25,6),(2,1,'CONGELADOR',250.75,3),(3,1,'LAVADORA 10KG',300.00,8),(4,5,'COCINA DE GAS',120.00,10),(5,2,'CONGELADOR',275.00,5),(6,2,'HORNO ELECTRICO',450.00,3),(7,2,'LAVADORA 10KG',295.00,12),(8,6,'COCINA ELECTRICA',350.00,2),(9,3,'NEVERA',450.00,3),(10,3,'LAVADORA',380.00,6),(11,3,'COCINA DE GAS',230.00,12),(12,7,'COCINA ELECTRICA',120.00,8),(13,4,'NEVERA',590.75,3),(14,4,'CONGELADOR',249.99,6),(15,4,'LAVADORA 10KG',310.00,3),(16,8,'COCINA DE GAS',170.00,8),(17,8,'',1.50,100);
/*!40000 ALTER TABLE `productos_sin_fk` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'General Electric','AV. LECUNA','info@ge.com','0212-5431234','Ana Vasquez'),(2,'Whirpool','AV. ROMULO GALLEGOS','info@whirpool.com','0212-9871234','Yolanda Tortoza'),(3,'Electrolux','AV. DE LAS MERCEDES','info@electrolux.com','0212-2671234','Nelly Contreras'),(4,'LG','AV. SAN MARTIN','info@gmail.com','0212-4431234','Maiba Romero'),(5,'DAMASCO','AV. FCO. DE MIRANDA','info@damasco.com','0212-2431234','Roraima Rojas'),(6,'HAIR','AV. DEL VALLE','info@hair.com','0212-645123','Rosa Gonzales'),(7,'SONY','AV. FRANCISCO DE MIRANDA','info@sony.com','0212-1234098','Ssana Mir'),(9,'MAVE','BOLEITA NORTE','info@mave.com','0212-56789432','Norma Gainfa');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vista_prov_pro_01`
--

DROP TABLE IF EXISTS `vista_prov_pro_01`;
/*!50001 DROP VIEW IF EXISTS `vista_prov_pro_01`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_prov_pro_01` AS SELECT
 1 AS `proveedor`,
  1 AS `contacto`,
  1 AS `telefono`,
  1 AS `producto`,
  1 AS `precio` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_prov_pro_02`
--

DROP TABLE IF EXISTS `vista_prov_pro_02`;
/*!50001 DROP VIEW IF EXISTS `vista_prov_pro_02`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_prov_pro_02` AS SELECT
 1 AS `proveedor`,
  1 AS `direccion`,
  1 AS `correo_electronico`,
  1 AS `contacto`,
  1 AS `telefono`,
  1 AS `producto`,
  1 AS `precio`,
  1 AS `existencia` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_prov_pro_null`
--

DROP TABLE IF EXISTS `vista_prov_pro_null`;
/*!50001 DROP VIEW IF EXISTS `vista_prov_pro_null`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_prov_pro_null` AS SELECT
 1 AS `proveedor`,
  1 AS `contacto`,
  1 AS `telefono`,
  1 AS `producto`,
  1 AS `precio` */;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `bd_reinaldo_20250714`
--

USE `bd_reinaldo_20250714`;

--
-- Final view structure for view `vista_prov_pro_01`
--

/*!50001 DROP VIEW IF EXISTS `vista_prov_pro_01`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_prov_pro_01` AS select `a`.`nombre` AS `proveedor`,`a`.`persona_contacto` AS `contacto`,`a`.`telefono` AS `telefono`,`b`.`nombre` AS `producto`,`b`.`precio` AS `precio` from (`proveedores` `a` join `productos` `b` on(`b`.`proveedor_id` = `a`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_prov_pro_02`
--

/*!50001 DROP VIEW IF EXISTS `vista_prov_pro_02`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_prov_pro_02` AS select `a`.`nombre` AS `proveedor`,`a`.`direccion` AS `direccion`,`a`.`correo_electronico` AS `correo_electronico`,`a`.`persona_contacto` AS `contacto`,`a`.`telefono` AS `telefono`,`b`.`nombre` AS `producto`,`b`.`precio` AS `precio`,`b`.`existencia` AS `existencia` from (`proveedores` `a` join `productos` `b` on(`b`.`proveedor_id` = `a`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_prov_pro_null`
--

/*!50001 DROP VIEW IF EXISTS `vista_prov_pro_null`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_prov_pro_null` AS select `proveedores`.`nombre` AS `proveedor`,`proveedores`.`persona_contacto` AS `contacto`,`proveedores`.`telefono` AS `telefono`,`productos_sin_fk`.`nombre` AS `producto`,`productos_sin_fk`.`precio` AS `precio` from (`proveedores` left join `productos_sin_fk` on(`productos_sin_fk`.`proveedor_id` = `proveedores`.`id`)) union select `proveedores`.`nombre` AS `proveedor`,`proveedores`.`persona_contacto` AS `contacto`,`proveedores`.`telefono` AS `telefono`,`productos_sin_fk`.`nombre` AS `producto`,`productos_sin_fk`.`precio` AS `precio` from (`productos_sin_fk` left join `proveedores` on(`productos_sin_fk`.`proveedor_id` = `proveedores`.`id`)) */;
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

-- Dump completed on 2025-07-17 11:15:18
