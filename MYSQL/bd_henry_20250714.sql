-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-07-2025 a las 17:28:58
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_henry_20250714`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(11) DEFAULT NULL,
  `doc` char(1) DEFAULT NULL,
  `nro` varchar(8) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `apellido` varchar(80) DEFAULT NULL,
  `telefono_hab` varchar(20) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `doc`, `nro`, `nombre`, `apellido`, `telefono_hab`, `direccion`, `correo_electronico`, `fecha_nacimiento`, `sexo`) VALUES
(1, 'V', '1234', 'ANA', 'VASQUEZ', '0212-1234567', 'SANTA FE', 'av@gmail.com', '1960-08-15', 'F'),
(2, 'E', '8100', 'PEDRO', 'ALMODOVAR', '0212-9871234', 'CARICUAO', 'pa@gmail.com', '1950-09-01', 'M'),
(3, 'P', '9100', 'SARA', 'SUAREZ', '0212-5651234', 'CHACAITO', 'ss@hotmail.com', '1990-06-20', 'F'),
(4, 'V', '5678', 'YOLANDA', 'TORTOZA', '0212-9791234', 'CATIA LA MAR', 'yt@gmail.com', '1978-10-15', 'F');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
