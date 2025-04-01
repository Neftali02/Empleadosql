-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 31-03-2025 a las 20:53:59
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empleados`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `Actualizar_salario`$$
CREATE DEFINER=`´root´`@`´localhost´` PROCEDURE `Actualizar_salario` (IN `Actualizar salario` TEXT)   UPDATE empleado_general SET salario = 2200.00 WHERE nombre = 'Luis Sánchez'$$

DROP PROCEDURE IF EXISTS `Borrar Productos`$$
CREATE DEFINER=`´root´`@`´localhost´` PROCEDURE `Borrar Productos` (IN `Eliminar muebles` INT)   DELETE FROM miscelanea WHERE categoria = 'mobiliario'$$

DROP PROCEDURE IF EXISTS `BuscarEmpleadoSalario`$$
CREATE DEFINER=`´root´`@`´localhost´` PROCEDURE `BuscarEmpleadoSalario` (IN `Buscar` DECIMAL(10,2))   BEGIN 
  SELECT * FROM empleado_general WHERE salario > salario_limite;
END$$

DROP PROCEDURE IF EXISTS `Consulta Miscelanea`$$
CREATE DEFINER=`´root´`@`´localhost´` PROCEDURE `Consulta Miscelanea` (IN `Stok` DECIMAL(10))   SELECT * FROM miscelanea WHERE stok < 10$$

DROP PROCEDURE IF EXISTS `ContarEmpleados`$$
CREATE DEFINER=`´root´`@`´localhost´` PROCEDURE `ContarEmpleados` (IN `Contar` INT)   SELECT puesto, COUNT(*) AS total_empleados FROM empleado_general GROUP BY puesto$$

DROP PROCEDURE IF EXISTS `Eliminacion de productos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminacion de productos` (IN `Electronica` TEXT)   CALL EliminarProductoCategoria('Tecnología')$$

DROP PROCEDURE IF EXISTS `ModificarLaptopPrecio`$$
CREATE DEFINER=`´root´`@`´localhost´` PROCEDURE `ModificarLaptopPrecio` (IN `PrecioLaptop` INT(10))   UPDATE miscelanea SET precio = 1200.00 WHERE producto = 'Laptop HP'$$

DROP PROCEDURE IF EXISTS `QuitarEmpleado`$$
CREATE DEFINER=`´root´`@`´localhost´` PROCEDURE `QuitarEmpleado` (IN `Eliminar` TEXT)   DELETE FROM empleado_general WHERE nombre = 'Pedro Torres'$$

DROP PROCEDURE IF EXISTS `Reemplazar precio escritorio`$$
CREATE DEFINER=`´root´`@`´localhost´` PROCEDURE `Reemplazar precio escritorio` (IN `mouse` INT)   CALL ActualizarPrecioProducto('Escritorio', 200.00)$$

DROP PROCEDURE IF EXISTS `Ver empleados`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Ver empleados` (IN `Contratos` DATE)   SELECT * FROM empleado_general WHERE fecha_ingreso > '2022-06-01'$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_general`
--

DROP TABLE IF EXISTS `empleado_general`;
CREATE TABLE IF NOT EXISTS `empleado_general` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `puesto` varchar(100) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleado_general`
--

INSERT INTO `empleado_general` (`id`, `nombre`, `apellido`, `puesto`, `salario`, `fecha_ingreso`) VALUES
(1, 'Juan', 'Pérez', 'Gerente', 3500.00, '2021-01-15'),
(2, 'Ana', 'Gómez', 'Asistente', 1800.00, '2022-06-01'),
(3, 'Carlos', 'López', 'Jefe de Proyecto', 3000.00, '2020-03-12'),
(4, 'Marta', 'Martínez', 'Desarrollador', 2500.00, '2021-08-23'),
(5, 'Luis', 'Sánchez', 'Contador', 2200.00, '2021-11-03'),
(6, 'Sofía', 'Rodríguez', 'HR', 2700.00, '2022-02-19'),
(7, 'Pedro', 'Torres', 'Analista', 2300.00, '2020-07-09'),
(8, 'Raquel', 'García', 'Desarrollador', 2400.00, '2021-05-13'),
(9, 'Andrés', 'Jiménez', 'Desarrollador', 2600.00, '2020-10-10'),
(10, 'Elena', 'Díaz', 'Jefa de Marketing', 3200.00, '2019-12-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miscelanea`
--

DROP TABLE IF EXISTS `miscelanea`;
CREATE TABLE IF NOT EXISTS `miscelanea` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) DEFAULT NULL,
  `producto` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `cantidad` int DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `fecha_entrada` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `miscelanea`
--

INSERT INTO `miscelanea` (`id`, `categoria`, `producto`, `cantidad`, `precio`, `fecha_entrada`) VALUES
(1, 'Tecnología', 'Laptop HP', 10, 1200.00, '2023-01-01'),
(2, 'Tecnología', 'Smartphone Samsung', 20, 800.00, '2023-02-15'),
(3, 'Mobiliario', 'Silla ergonómica', 30, 150.00, '2023-01-05'),
(4, 'Mobiliario', 'Escritorio', 15, 200.00, '2023-03-10'),
(5, 'Papelería', 'Papel A4', 500, 5.00, '2023-02-20'),
(6, 'Papelería', 'Bolígrafos', 1000, 0.50, '2023-01-25'),
(7, 'Tecnología', 'Proyector Epson', 5, 600.00, '2023-03-15'),
(8, 'Tecnología', 'Teclado mecánico', 25, 75.00, '2023-02-18'),
(9, 'Mobiliario', 'Archivo metálico', 12, 350.00, '2023-03-05'),
(10, 'Papelería', 'Cartuchos de tinta', 30, 50.00, '2023-01-30'),
(11, 'Mobiliario', 'Silla de oficina', 18, 180.00, '2023-02-10'),
(12, 'Tecnología', 'Monitor 24 pulgadas', 8, 250.00, '2023-01-13'),
(13, 'Papelería', 'Tijeras', 50, 3.00, '2023-03-01'),
(14, 'Tecnología', 'Cámara web Logitech', 20, 100.00, '2023-02-25'),
(15, 'Mobiliario', 'Estantería', 10, 120.00, '2023-01-20');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
