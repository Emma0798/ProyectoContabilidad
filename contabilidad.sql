-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-11-2023 a las 23:19:45
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `contabilidad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro_diario`
--

DROP TABLE IF EXISTS `libro_diario`;
CREATE TABLE IF NOT EXISTS `libro_diario` (
  `nroAsiento` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `debe` double DEFAULT NULL,
  `haber` double DEFAULT NULL,
  `FK_mayor` int DEFAULT NULL,
  `FK_plan_de_cuentas` int NOT NULL,
  PRIMARY KEY (`nroAsiento`),
  KEY `FK_mayor` (`FK_mayor`),
  KEY `FK_plan_de_cuentas` (`FK_plan_de_cuentas`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mayor`
--

DROP TABLE IF EXISTS `mayor`;
CREATE TABLE IF NOT EXISTS `mayor` (
  `id` int NOT NULL,
  `anio` int DEFAULT NULL,
  `mes` int DEFAULT NULL,
  `nroCuenta` varchar(255) DEFAULT NULL,
  `debe` double DEFAULT NULL,
  `haber` double DEFAULT NULL,
  `saldo` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_de_cuentas`
--

DROP TABLE IF EXISTS `plan_de_cuentas`;
CREATE TABLE IF NOT EXISTS `plan_de_cuentas` (
  `rubro` enum('A','E','I','P','PN') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nroCuenta` int NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nroCuenta`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `plan_de_cuentas`
--

INSERT INTO `plan_de_cuentas` (`rubro`, `nroCuenta`, `descripcion`) VALUES
('A', 1001, 'Caja'),
('A', 1002, 'Bancos'),
('A', 1003, 'Cuentas por Cobrar'),
('A', 1004, 'Inventario'),
('P', 2001, 'Cuentas por Pagar'),
('P', 2002, 'Préstamos'),
('PN', 3001, 'Capital Social'),
('I', 4001, 'Ventas'),
('E', 5001, 'Sueldos'),
('E', 5002, 'Suministros'),
('E', 1111111, 'ADQDQ'),
('A', 435, 'saads');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
