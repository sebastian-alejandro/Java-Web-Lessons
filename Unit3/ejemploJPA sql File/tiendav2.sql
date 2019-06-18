-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2019 a las 14:01:33
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--
CREATE DATABASE IF NOT EXISTS `tienda` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tienda`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `codigocategoria` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`codigocategoria`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'almacenamiento', 'pendrive hdd, ssd', 1),
(2, 'celulares', 'smartphone', 1),
(3, 'computadoras', 'notebooks', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `codigodetalle` int(11) NOT NULL,
  `codigoproducto` int(11) DEFAULT NULL,
  `codigoventa` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigoproducto` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `codigocategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigoproducto`, `nombre`, `precio`, `stock`, `estado`, `codigocategoria`) VALUES
(1, 'pendrive hp 4gb', 5000, 10, 1, 1),
(2, 'disco duro toshiba 500 gb', 45000, 30, 1, 1),
(3, 'celular sony experia c3', 150000, 9, 1, 2),
(4, 'Macbook Pro 13', 650000, 3, 1, 3),
(5, 'Notebook Sony Vaio 500GB 8GB Ram i5', 450000, 2, 1, 3),
(6, 'pendrive 8gb kingstone', 12000, 10, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `rut` varchar(50) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `clave` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`rut`, `nombre`, `apellido`, `email`, `clave`, `tipo`) VALUES
('1234-5', 'Juanita', 'Perez', 'jperez@gmail.com', '123', 'cliente'),
('3456-7', 'Pablo', 'Soto', 'psoto@gmail.com', '123', 'vendedor'),
('5678-9', 'Manuel', 'Morales', 'mm@gmail.com', '123', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `codigoventa` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `rutcliente` varchar(50) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codigocategoria`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`codigodetalle`),
  ADD KEY `codigoproducto` (`codigoproducto`),
  ADD KEY `codigoventa` (`codigoventa`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigoproducto`),
  ADD KEY `codigocategoria` (`codigocategoria`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`rut`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`codigoventa`),
  ADD KEY `rutcliente` (`rutcliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `codigocategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle`
--
ALTER TABLE `detalle`
  MODIFY `codigodetalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codigoproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `codigoventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`codigoproducto`) REFERENCES `producto` (`codigoproducto`) ON DELETE SET NULL,
  ADD CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`codigoventa`) REFERENCES `venta` (`codigoventa`) ON DELETE SET NULL;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`codigocategoria`) REFERENCES `categoria` (`codigocategoria`) ON DELETE SET NULL;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`rutcliente`) REFERENCES `usuario` (`rut`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
