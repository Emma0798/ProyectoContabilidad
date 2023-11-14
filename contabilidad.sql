-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-11-2023 a las 11:44:04
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
  `id` int NOT NULL,
  `nroAsiento` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `debe` double DEFAULT NULL,
  `haber` double DEFAULT NULL,
  `FK_mayor` int DEFAULT NULL,
  `FK_plan_de_cuentas` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mayor` (`FK_mayor`),
  KEY `FK_plan_de_cuentas` (`FK_plan_de_cuentas`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `libro_diario`
--

INSERT INTO `libro_diario` (`nroAsiento`, `fecha`, `debe`, `haber`, `FK_mayor`, `FK_plan_de_cuentas`) VALUES
(1, '2023-01-01', 100, 0, 1, 1001),
(2, '2023-01-01', 50, 0, 2, 1002),
(3, '2023-01-01', 100, 0, 3, 1004),
(4, '2023-01-01', 0, 250, 4, 3001),
(5, '2023-01-02', 150, 0, 3, 1004),
(6, '2023-01-02', 0, 100, 1, 1001),
(7, '2023-01-02', 0, 50, 2, 1002),
(8, '2023-01-03', 200, 0, 1, 1001),
(9, '2023-01-03', 0, 200, 5, 4001),
(10, '2023-01-03', 100, 0, 6, 5002),
(11, '2023-01-03', 0, 100, 3, 1004),
(12, '2023-01-04', 1000, 0, 2, 1002),
(13, '2023-01-04', 0, 1000, 7, 2002),
(14, '2023-01-05', 1000, 0, 1, 1001),
(15, '2023-01-05', 0, 1000, 7, 2002),
(16, '2023-01-06', 1500, 0, 8, 1003),
(17, '2023-01-06', 0, 1000, 2, 1002),
(18, '2023-01-06', 0, 500, 1, 1001),
(19, '2023-01-07', 100, 0, 1, 1001),
(20, '2023-01-07', 0, 100, 5, 4001),
(21, '2023-01-07', 50, 0, 6, 5002),
(22, '2023-01-07', 0, 50, 3, 1004);

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
('A', 1003, 'Rodados'),
('A', 1004, 'Mercaderia'),
('P', 2001, 'Cuentas por Pagar'),
('P', 2002, 'Préstamos'),
('PN', 3001, 'Capital Social'),
('I', 4001, 'Ventas'),
('E', 5001, 'Sueldos'),
('E', 5002, 'Costo de Mercaderia');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
