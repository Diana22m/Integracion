-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: timefast
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `asociacionvehiculo`
--

DROP TABLE IF EXISTS `asociacionvehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asociacionvehiculo` (
  `idUnidad` int NOT NULL,
  `idConductor` int NOT NULL,
  `curp` varchar(45) NOT NULL,
  `fechaAsignacion` date NOT NULL,
  `fechaDesasignacion` date NOT NULL,
  `idasociacionvehiculo` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idasociacionvehiculo`),
  KEY `asociacionvehiculo_ibfk1_idx` (`idUnidad`),
  KEY `asociacionvehiculo_ibfk2_idx` (`idConductor`),
  KEY `asociacionvehiculo_ibfk3_idx` (`curp`),
  CONSTRAINT `asociacionvehiculo_ibfk1` FOREIGN KEY (`idUnidad`) REFERENCES `unidad` (`idUnidad`),
  CONSTRAINT `asociacionvehiculo_ibfk2` FOREIGN KEY (`idConductor`) REFERENCES `conductor` (`idConductor`),
  CONSTRAINT `asociacionvehiculo_ibfk3` FOREIGN KEY (`curp`) REFERENCES `colaborador` (`curp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asociacionvehiculo`
--

LOCK TABLES `asociacionvehiculo` WRITE;
/*!40000 ALTER TABLE `asociacionvehiculo` DISABLE KEYS */;
INSERT INTO `asociacionvehiculo` VALUES (1,3,'CIMU141201HVZRRRA0','2024-11-03','2024-11-10',1);
/*!40000 ALTER TABLE `asociacionvehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidoPaterno` varchar(50) NOT NULL,
  `apellidoMaterno` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `codigoPostal` varchar(10) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `colonia` varchar(100) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Luis','Justo','Mendez','luis21@gmail.com','2315931111','73800','Av Hidaldo','15','Centro'),(2,'Mariel','Mendoza','Ramos','ramos@gmail.com','2311529523','93660','24 de febrero','64','Jalacingo'),(3,'Hugo','Morales','Perez','przh34@gmail.com','2261537890','93664','5 de mayo','71','Cuartel tercero'),(4,'Uriel','Marcos','Sanchez','uri332@gmai.com','2311529523','93660','16 de septiembre','45','Centro');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaborador`
--

DROP TABLE IF EXISTS `colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colaborador` (
  `curp` varchar(40) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidoPaterno` varchar(50) NOT NULL,
  `apellidoMaterno` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `foto` longblob,
  `numPersonal` varchar(10) NOT NULL,
  `numLicencia` varchar(50) DEFAULT NULL,
  `idRol` int DEFAULT NULL,
  `idColaborador` varchar(45) NOT NULL,
  PRIMARY KEY (`curp`),
  KEY `idRol` (`idRol`),
  CONSTRAINT `colaborador_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador`
--

LOCK TABLES `colaborador` WRITE;
/*!40000 ALTER TABLE `colaborador` DISABLE KEYS */;
INSERT INTO `colaborador` VALUES ('CIMMD00222MVZRRNA4','Fernando','Perez','Morales','fer@timefast.com','45678',NULL,'tf12','CIM123456',1,'2'),('CIMU141201HVZRRRA0','Jesus','Reyes','Sanches','jesus14@timefast.com','56789',NULL,'tf13','CID987654',3,'3'),('JUS0022850315HDFRN','Mario','Perdomo','Justo','mario@timefast.com','1234',NULL,'tf11','LIC987654',2,'1');
/*!40000 ALTER TABLE `colaborador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conductor`
--

DROP TABLE IF EXISTS `conductor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conductor` (
  `idConductor` int NOT NULL AUTO_INCREMENT,
  `numLicencia` varchar(45) NOT NULL,
  `curp` varchar(45) NOT NULL,
  PRIMARY KEY (`idConductor`),
  KEY `conductor_ibfk_1_idx` (`curp`),
  CONSTRAINT `conductor_ibfk_1` FOREIGN KEY (`curp`) REFERENCES `colaborador` (`curp`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conductor`
--

LOCK TABLES `conductor` WRITE;
/*!40000 ALTER TABLE `conductor` DISABLE KEYS */;
INSERT INTO `conductor` VALUES (3,'CID987654','CIMU141201HVZRRRA0');
/*!40000 ALTER TABLE `conductor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciondestino`
--

DROP TABLE IF EXISTS `direcciondestino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciondestino` (
  `idDestino` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `colonia` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  PRIMARY KEY (`idDestino`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciondestino`
--

LOCK TABLES `direcciondestino` WRITE;
/*!40000 ALTER TABLE `direcciondestino` DISABLE KEYS */;
INSERT INTO `direcciondestino` VALUES (1,'Av. Principal','75','Residencial San Jorge','Ciudad de México','CDMX'),(2,'Calle Secundaria','200','Fraccionamiento Los Pinos','Puebla','Puebla'),(3,'Camino Real','300','Villa Universitaria','Guadalajara','Jalisco');
/*!40000 ALTER TABLE `direcciondestino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccionorigen`
--

DROP TABLE IF EXISTS `direccionorigen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccionorigen` (
  `idOrigen` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `colonia` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  PRIMARY KEY (`idOrigen`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccionorigen`
--

LOCK TABLES `direccionorigen` WRITE;
/*!40000 ALTER TABLE `direccionorigen` DISABLE KEYS */;
INSERT INTO `direccionorigen` VALUES (1,'Av. Industria','100','Parque Industrial','Guadalajara','Jalisco'),(2,'Calle Comercio','250','Zona Empresarial','Monterrey','Nuevo León'),(3,'Boulevar Tecnológico','50','Parque Tecnológico','Querétaro','Querétaro');
/*!40000 ALTER TABLE `direccionorigen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio`
--

DROP TABLE IF EXISTS `envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio` (
  `idEnvio` int NOT NULL AUTO_INCREMENT,
  `idCliente` int NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `numGuia` int NOT NULL,
  `idOrigen` int NOT NULL,
  `idDestino` int NOT NULL,
  `idEstatus` int NOT NULL,
  `curp` varchar(18) NOT NULL,
  PRIMARY KEY (`idEnvio`),
  UNIQUE KEY `numGuia` (`numGuia`),
  KEY `idCliente` (`idCliente`),
  KEY `idOrigen` (`idOrigen`),
  KEY `idDestino` (`idDestino`),
  KEY `idEstatus` (`idEstatus`),
  KEY `curp` (`curp`),
  CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `envio_ibfk_2` FOREIGN KEY (`idOrigen`) REFERENCES `direccionorigen` (`idOrigen`),
  CONSTRAINT `envio_ibfk_3` FOREIGN KEY (`idDestino`) REFERENCES `direcciondestino` (`idDestino`),
  CONSTRAINT `envio_ibfk_4` FOREIGN KEY (`idEstatus`) REFERENCES `estatus` (`idEstatus`),
  CONSTRAINT `envio_ibfk_5` FOREIGN KEY (`curp`) REFERENCES `colaborador` (`curp`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio`
--

LOCK TABLES `envio` WRITE;
/*!40000 ALTER TABLE `envio` DISABLE KEYS */;
INSERT INTO `envio` VALUES (1,1,400.00,22,1,1,1,'CIMMD00222MVZRRNA4'),(2,2,255.00,23,2,2,2,'JUS0022850315HDFRN'),(3,3,500.00,24,3,3,3,'CIMU141201HVZRRRA0');
/*!40000 ALTER TABLE `envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatus`
--

DROP TABLE IF EXISTS `estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estatus` (
  `idEstatus` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) NOT NULL DEFAULT 'Pendiente',
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `curp` varchar(18) NOT NULL,
  PRIMARY KEY (`idEstatus`),
  KEY `curp` (`curp`),
  CONSTRAINT `estatus_ibfk_1` FOREIGN KEY (`curp`) REFERENCES `colaborador` (`curp`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatus`
--

LOCK TABLES `estatus` WRITE;
/*!40000 ALTER TABLE `estatus` DISABLE KEYS */;
INSERT INTO `estatus` VALUES (1,'Detenido','2024-10-01','11:00:00','CIMMD00222MVZRRNA4'),(2,'En transito ','0202-10-24','09:30:12','JUS0022850315HDFRN'),(3,'Detenido','2024-11-01','11:00:00','CIMU141201HVZRRRA0');
/*!40000 ALTER TABLE `estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquete`
--

DROP TABLE IF EXISTS `paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquete` (
  `idPaquete` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `peso` float NOT NULL,
  `alto` float NOT NULL,
  `profundidad` float NOT NULL,
  `ancho` float NOT NULL,
  `numGuia` varchar(50) NOT NULL,
  `idEnvio` int DEFAULT NULL,
  PRIMARY KEY (`idPaquete`),
  UNIQUE KEY `numGuia` (`numGuia`),
  KEY `idEnvio` (`idEnvio`),
  CONSTRAINT `paquete_ibfk_1` FOREIGN KEY (`idEnvio`) REFERENCES `envio` (`idEnvio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquete`
--

LOCK TABLES `paquete` WRITE;
/*!40000 ALTER TABLE `paquete` DISABLE KEYS */;
INSERT INTO `paquete` VALUES (1,'Paquete de electronica',5,30,20,25,'22',1),(2,'Paquete productos',10,50,25,35,'23',2),(3,'Paquete Ropa',23,40,25,45,'24',3);
/*!40000 ALTER TABLE `paquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `descripcionRol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Ejecutivo de ventas'),(3,'Conductor');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `idTipo` int NOT NULL AUTO_INCREMENT,
  `descripcionTipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'Gasolina'),(2,'Diesel'),(3,'Electrica'),(4,'Hibrida');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad`
--

DROP TABLE IF EXISTS `unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad` (
  `idUnidad` int NOT NULL AUTO_INCREMENT,
  `vin` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `idTipo` int NOT NULL,
  `idInterno` varchar(45) NOT NULL,
  `anio` varchar(45) NOT NULL,
  `motivo` varchar(45) NOT NULL,
  PRIMARY KEY (`idUnidad`),
  KEY `unidad_ibfk1_idx` (`idTipo`),
  CONSTRAINT `unidad_ibfk1` FOREIGN KEY (`idTipo`) REFERENCES `tipo` (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad`
--

LOCK TABLES `unidad` WRITE;
/*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
INSERT INTO `unidad` VALUES (1,'\'JT123456789012345','Toyota','Corolla',1,'2010JT12','2010','Fin de vida util');
/*!40000 ALTER TABLE `unidad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-07 23:25:51
