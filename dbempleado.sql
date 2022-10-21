-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.39-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para dbempleado
CREATE DATABASE IF NOT EXISTS `dbempleado` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbempleado`;

-- Volcando estructura para tabla dbempleado.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Telefono` varchar(8) DEFAULT NULL,
  `idPuesto` int(11) DEFAULT NULL,
  `DPI` varchar(13) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `FechaIngresoRegistro` datetime DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `id_puesto_puesto_empleado_idx` (`idPuesto`),
  CONSTRAINT `id_puesto_puesto_empleado` FOREIGN KEY (`idPuesto`) REFERENCES `puestos` (`idPuesto`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbempleado.empleados: ~1 rows (aproximadamente)
INSERT IGNORE INTO `empleados` (`idEmpleado`, `Nombre`, `Apellido`, `Direccion`, `Telefono`, `idPuesto`, `DPI`, `FechaNacimiento`, `FechaIngresoRegistro`) VALUES
	(1, 'Christopher Orlandoq', 'Jimenez Perez', 'Antigua', '45123654', 1, '2221332621120', '1996-01-17', '2022-01-01 00:00:00');

-- Volcando estructura para tabla dbempleado.puestos
CREATE TABLE IF NOT EXISTS `puestos` (
  `idPuesto` int(11) NOT NULL AUTO_INCREMENT,
  `Puesto` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idPuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbempleado.puestos: ~4 rows (aproximadamente)
INSERT IGNORE INTO `puestos` (`idPuesto`, `Puesto`) VALUES
	(1, 'Programador'),
	(2, 'Administrador'),
	(3, 'Secretaria'),
	(4, 'Consultor');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
