-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-07-2025 a las 17:31:28
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
-- Base de datos: `bd_henry_20250718`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas2`
--

CREATE TABLE `personas2` (
  `id` int(11) NOT NULL,
  `doc` char(1) NOT NULL,
  `nro` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) NOT NULL,
  `direccion` text NOT NULL,
  `correo_electronico` varchar(80) NOT NULL,
  `fecha_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas2`
--

INSERT INTO `personas2` (`id`, `doc`, `nro`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `fecha_nacimiento`) VALUES
(1, 'V', 1234, 'ANA', 'VASQUEZ', 'SANTA FE', 'anavasquez@gmail.com', '1965-08-15'),
(3, 'P', 9100, 'SARA', 'SUAREZ', 'CHACAITO', 'ss@hotmail.com', '1990-06-20'),
(4, 'V', 5678, 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '1978-10-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `precio` decimal(13,2) NOT NULL,
  `existencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `proveedor_id`, `nombre`, `precio`, `existencia`) VALUES
(1, 1, 'NEVERA', 500.25, 6),
(2, 1, 'CONGELADOR', 250.75, 3),
(3, 1, 'LAVADORA 10KG', 300.00, 8),
(4, 1, 'COCINA A GAS', 120.00, 10),
(5, 2, 'CONGELADOR', 275.00, 5),
(6, 2, 'HORNO ELECTRICO', 450.00, 3),
(7, 2, 'LAVADORA 10KG', 295.00, 12),
(8, 2, 'COCINA ELECTRICA', 350.00, 2),
(9, 3, 'NEVERA', 450.00, 3),
(10, 3, 'LAVADORA', 380.00, 6),
(11, 3, 'COCINA A GAS', 230.00, 12),
(12, 3, 'COCINA ELECTRICA', 390.00, 8),
(13, 4, 'NEVERA', 590.75, 3),
(14, 4, 'CONGELADOR', 249.99, 6),
(15, 4, 'LAVADORA 10KG', 310.00, 3),
(16, 4, 'COCINA A GAS', 170.00, 8),
(17, 4, 'AA', 500.00, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `direccion` text NOT NULL,
  `correo_electronico` varchar(80) NOT NULL,
  `telefono` varchar(80) NOT NULL,
  `persona_contacto` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `direccion`, `correo_electronico`, `telefono`, `persona_contacto`) VALUES
(1, 'GENERAL ELECTRIC', 'AV. LECUNA', 'info@ge.com', '0212-5431234', 'ANA VASQUEZ'),
(2, 'WHIRPOOL', 'AV. ROMULO GALLEGOS', 'info@whirpool.com', '0212-9871234', 'YOLANDA TORTOZA'),
(3, 'ELECTROLUX', 'AV. PPAL. DE LAS MERCEDES', 'info@electrolux.com', '0212-2671234', 'NELLY CONTRERAS'),
(4, 'LG', 'AV. SAN MARTIN', 'info@lg.com', '0212-4431234', 'MAIBA ROMERO'),
(5, 'DAMASCO', 'AV. FCO. DE MIRANDA', 'info@damasco.com', '0212-2431234', 'RORAIMA ROJAS'),
(6, 'HAIR', 'AV. PPAL. DEL VALLE', 'info@hair.com', '0212-6431234', 'SOFIA CHAN'),
(7, 'SONY', 'AV. FCO. DE MIRANDA', 'info@sony.com', '0212-2431234', 'SUSANA MIR'),
(8, 'MABE', 'BOLEITA NORTE', 'info@mabe.com', '0212-7431234', 'NORMA GAINFA');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_prov_prod_02`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_prov_prod_02` (
`proveedor` varchar(80)
,`direccion` text
,`correo_electronico` varchar(80)
,`contacto` varchar(80)
,`telefono` varchar(80)
,`producto` varchar(80)
,`precio` decimal(13,2)
,`existencia` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_prov_prod_02`
--
DROP TABLE IF EXISTS `vista_prov_prod_02`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_prov_prod_02`  AS SELECT `a`.`nombre` AS `proveedor`, `a`.`direccion` AS `direccion`, `a`.`correo_electronico` AS `correo_electronico`, `a`.`persona_contacto` AS `contacto`, `a`.`telefono` AS `telefono`, `b`.`nombre` AS `producto`, `b`.`precio` AS `precio`, `b`.`existencia` AS `existencia` FROM (`proveedores` `a` join `productos` `b` on(`b`.`proveedor_id` = `a`.`id`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `personas2`
--
ALTER TABLE `personas2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_cedula` (`doc`,`nro`),
  ADD UNIQUE KEY `uk_correo` (`correo_electronico`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `personas2`
--
ALTER TABLE `personas2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
