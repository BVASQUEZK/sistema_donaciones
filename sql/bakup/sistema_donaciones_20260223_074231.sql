-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sistema_donaciones
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
-- Table structure for table `asignacion_voluntario_entrega`
--

DROP TABLE IF EXISTS `asignacion_voluntario_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignacion_voluntario_entrega` (
  `id_entrega` int(11) NOT NULL,
  `id_voluntario` int(11) NOT NULL,
  PRIMARY KEY (`id_entrega`,`id_voluntario`),
  KEY `id_voluntario` (`id_voluntario`),
  CONSTRAINT `asignacion_voluntario_entrega_ibfk_1` FOREIGN KEY (`id_entrega`) REFERENCES `entrega_donacion` (`id_entrega`),
  CONSTRAINT `asignacion_voluntario_entrega_ibfk_2` FOREIGN KEY (`id_voluntario`) REFERENCES `voluntario` (`id_voluntario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion_voluntario_entrega`
--

LOCK TABLES `asignacion_voluntario_entrega` WRITE;
/*!40000 ALTER TABLE `asignacion_voluntario_entrega` DISABLE KEYS */;
INSERT INTO `asignacion_voluntario_entrega` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `asignacion_voluntario_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_sistema`
--

DROP TABLE IF EXISTS `auditoria_sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_sistema` (
  `id_auditoria` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `accion` varchar(200) DEFAULT NULL,
  `tabla_afectada` varchar(100) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_auditoria`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `auditoria_sistema_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario_sistema` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_sistema`
--

LOCK TABLES `auditoria_sistema` WRITE;
/*!40000 ALTER TABLE `auditoria_sistema` DISABLE KEYS */;
INSERT INTO `auditoria_sistema` VALUES (1,1,'Carga inicial de datos','sistema_donaciones','2026-02-18 16:57:17');
/*!40000 ALTER TABLE `auditoria_sistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campania`
--

DROP TABLE IF EXISTS `campania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campania` (
  `id_campania` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` varchar(30) NOT NULL,
  `monto_objetivo` decimal(12,2) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_campania`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campania`
--

LOCK TABLES `campania` WRITE;
/*!40000 ALTER TABLE `campania` DISABLE KEYS */;
INSERT INTO `campania` VALUES (2,'Invierno Solidario','Recoleccion de abrigo y alimentos','2026-01-01','2026-03-31','Activa',5000.00,1),(3,'Regreso a Clases','Apoyo educativo para comunidades','2026-02-01','2026-04-30','Activa',5000.00,1),(4,'Ruta Solidaria Andina','Apoyo alimentario y medico para zonas altoandinas','2026-01-15','2026-05-30','Activa',5000.00,1),(5,'Invierno Seguro','Entrega de abrigo a familias en riesgo','2026-02-01','2026-06-15','Activa',5000.00,1),(6,'Aulas con Futuro','Dotacion de materiales para estudiantes','2026-03-01','2026-08-31','Activa',5000.00,1),(8,'Agua Limpia Sur','Instalacion de filtros y tanques de agua para familias rurales','2026-02-15','2026-07-31','Activa',18000.00,1),(9,'Brigadas Medicas Sierra','Jornadas de salud preventiva y entrega de botiquines en zonas altoandinas','2026-01-10','2026-04-30','Activa',2000.00,1),(10,'Alimentos para Comedores 2025','Cobertura de viveres para comedores comunitarios durante el ultimo trimestre','2025-09-01','2025-12-20','Finalizada',15000.00,1);
/*!40000 ALTER TABLE `campania` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_recurso_donado`
--

DROP TABLE IF EXISTS `categoria_recurso_donado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_recurso_donado` (
  `id_categoria_recurso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id_categoria_recurso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_recurso_donado`
--

LOCK TABLES `categoria_recurso_donado` WRITE;
/*!40000 ALTER TABLE `categoria_recurso_donado` DISABLE KEYS */;
INSERT INTO `categoria_recurso_donado` VALUES (1,'Alimentos','Productos alimenticios no perecibles'),(2,'Salud','Medicinas e insumos medicos'),(3,'Educacion','Material escolar y educativo'),(4,'Abrigo','Ropa y abrigo para clima frio'),(5,'Higiene','Kits de aseo e higiene personal');
/*!40000 ALTER TABLE `categoria_recurso_donado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comunidad_vulnerable`
--

DROP TABLE IF EXISTS `comunidad_vulnerable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comunidad_vulnerable` (
  `id_comunidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `ubicacion` varchar(200) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `cantidad_beneficiarios` int(11) DEFAULT NULL,
  `id_pais` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_comunidad`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `comunidad_vulnerable_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunidad_vulnerable`
--

LOCK TABLES `comunidad_vulnerable` WRITE;
/*!40000 ALTER TABLE `comunidad_vulnerable` DISABLE KEYS */;
INSERT INTO `comunidad_vulnerable` VALUES (1,'Comunidad Los Andes','Zona rural, provincia de Pichincha','Necesitan alimentos, medicinas y apoyo educativo',250,31,1),(2,'Asentamiento San Jose','Zona urbana periferica','Comunidad en expansion con necesidades de abrigo',180,31,1),(3,'Refugio Temporal','Centro de la ciudad','Atencion prioritaria a familias desplazadas',120,31,1),(5,'Comunidad Nueva Esperanza','Distrito de Chota, Cajamarca','Comunidad altoandina con acceso limitado a agua potable y abrigo',310,31,1),(6,'Barrio 12 de Octubre','El Alto, La Paz','Zona urbana vulnerable con alta migracion interna',205,32,1),(7,'Sector El Mirador','Valparaiso periferia','Familias afectadas por incendios estacionales y desempleo temporal',145,35,1);
/*!40000 ALTER TABLE `comunidad_vulnerable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_donacion_recurso`
--

DROP TABLE IF EXISTS `detalle_donacion_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_donacion_recurso` (
  `id_detalle_donacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_donacion` int(11) NOT NULL,
  `id_recurso` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_detalle_donacion`),
  KEY `id_donacion` (`id_donacion`),
  KEY `id_recurso` (`id_recurso`),
  CONSTRAINT `detalle_donacion_recurso_ibfk_1` FOREIGN KEY (`id_donacion`) REFERENCES `donacion` (`id_donacion`),
  CONSTRAINT `detalle_donacion_recurso_ibfk_2` FOREIGN KEY (`id_recurso`) REFERENCES `recurso_donado` (`id_recurso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_donacion_recurso`
--

LOCK TABLES `detalle_donacion_recurso` WRITE;
/*!40000 ALTER TABLE `detalle_donacion_recurso` DISABLE KEYS */;
INSERT INTO `detalle_donacion_recurso` VALUES (1,3,5,180,'Mantas nuevas'),(2,4,1,600,'Sacos de arroz y legumbres'),(3,4,2,300,'Complemento alimenticio'),(4,7,6,120,'Kits individuales'),(5,9,3,95,'Cajas surtidas');
/*!40000 ALTER TABLE `detalle_donacion_recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donacion`
--

DROP TABLE IF EXISTS `donacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donacion` (
  `id_donacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_donante` int(11) NOT NULL,
  `id_campania` int(11) DEFAULT NULL,
  `tipo_donacion` varchar(30) NOT NULL,
  `estado_donacion` varchar(30) NOT NULL,
  `fecha_donacion` date NOT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_donacion`),
  KEY `id_donante` (`id_donante`),
  KEY `id_campania` (`id_campania`),
  CONSTRAINT `donacion_ibfk_1` FOREIGN KEY (`id_donante`) REFERENCES `donante` (`id_donante`),
  CONSTRAINT `donacion_ibfk_2` FOREIGN KEY (`id_campania`) REFERENCES `campania` (`id_campania`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donacion`
--

LOCK TABLES `donacion` WRITE;
/*!40000 ALTER TABLE `donacion` DISABLE KEYS */;
INSERT INTO `donacion` VALUES (2,6,4,'Monetaria','Entregado','2026-01-25',12000.00,'Aporte para compra de alimentos',1),(3,7,5,'Recurso','En transito','2026-01-28',NULL,'Mantas para zonas frias',1),(4,8,4,'Recurso','Pendiente','2026-02-02',NULL,'Alimentos secos para comunidades rurales',1),(5,9,6,'Monetaria','Pendiente','2026-02-05',8400.00,'Fondo para utiles escolares',1),(6,10,NULL,'Monetaria','Entregado','2026-02-08',950.00,'Donacion personal mensual',1),(7,11,5,'Recurso','En transito','2026-02-10',NULL,'Kit de higiene para albergues',1),(8,12,6,'Monetaria','Pendiente','2026-02-12',500.00,'Apoyo para compra de cuadernos y libros ',1),(9,13,NULL,'Recurso','Pendiente','2026-02-14',10000.00,'Medicinas basicas y analgesicos',1),(12,15,8,'Monetaria','Entregado','2026-02-18',3400.00,'Transferencia para compra de tanques de agua',1),(13,16,9,'Recurso','En transito','2026-02-18',5008.94,'Envio de 120 kits medicos y material de curacion',0),(14,17,10,'Monetaria','Pendiente','2025-11-15',2750.00,'Aporte para compra de viveres no perecibles',1),(15,18,6,'Monetaria','Entregado','2026-02-18',200000.00,'Txt.-\r\n',1),(16,19,10,'Monetaria','Entregado','2026-02-19',1000000.00,'txt\r\n',1),(21,6,2,'Monetaria','Pendiente','2026-02-19',321.00,'Prueba DAO post-fix',1),(22,11,8,'Monetaria','Pendiente','2026-02-19',100000.00,'txt 2',1);
/*!40000 ALTER TABLE `donacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donante`
--

DROP TABLE IF EXISTS `donante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donante` (
  `id_donante` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `tipo_donante` varchar(30) NOT NULL,
  `id_pais` int(11) NOT NULL,
  `fecha_registro` date NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_donante`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `donante_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donante`
--

LOCK TABLES `donante` WRITE;
/*!40000 ALTER TABLE `donante` DISABLE KEYS */;
INSERT INTO `donante` VALUES (6,'Fundacion Manos Unidas','contacto@manosunidas.org','+593-2-456-1001','Quito, Ecuador','Institucion',33,'2025-11-10',1),(7,'Global Relief Network','latin@globalrelief.net','+1-305-555-2100','Miami, USA','Institucion',38,'2025-12-05',1),(8,'Parroquia San Miguel','parroquia@sanmiguel.ec','+593-7-222-4455','Cuenca, Ecuador','Institucion',33,'2026-01-08',1),(9,'Cooperacion Iberica','equipo@coopiberica.es','+34-91-400-8899','Madrid, España','Institucion',39,'2026-01-14',1),(10,'Carlos Mendoza','carlos.mendoza@email.com','+593-9-888-1111','Ambato, Ecuador','Persona Natural',33,'2026-01-20',1),(11,'Andrea Rios','andrea.rios@email.com','+57-301-555-4400','Bogota, Colombia','Persona Natural',34,'2026-01-26',1),(12,'Jorge Paredes','jorge.paredes@email.com','+51-987-000-111','Lima, Peru','Persona Natural',31,'2026-02-02',1),(13,'Lucia Herrera','lucia.herrera@email.com','+56-9-7777-2233','Santiago, Chile','Persona Natural',35,'2026-02-06',1),(15,'Asociacion Horizonte Verde','contacto@horizonteverde.org','+51-987-456-210','Av. Primavera 2450, Lima','ONG',31,'2026-02-15',1),(16,'Fundacion Puentes del Norte','donaciones@puentesnorte.org','+57-310-555-8899','Cra 45 #12-18, Medellin','Fundacion',34,'2026-02-16',1),(17,'Red Solidaria Fronteras','info@redfronteras.org','+34-91-455-6677','Calle Alcala 220, Madrid','Organizacion Internacional',39,'2026-02-17',1),(18,'Asociacion Horizonte Rojo','AsociacionHorizonteRojo@gmail.com','901555555','jirÃ³n nueve de enero','ONG',31,'2026-02-18',1),(19,'Institucion Donante','institucion@donaciones.org','999-100-200','Lima, Peru','Institucion',31,'2026-02-19',1),(20,'Persona Natural','persona@email.com','999-100-201','Lima, Peru','Persona Natural',31,'2026-02-19',1);
/*!40000 ALTER TABLE `donante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega_donacion`
--

DROP TABLE IF EXISTS `entrega_donacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrega_donacion` (
  `id_entrega` int(11) NOT NULL AUTO_INCREMENT,
  `id_donacion` int(11) NOT NULL,
  `id_comunidad` int(11) NOT NULL,
  `fecha_programada` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `id_estado_entrega` int(11) NOT NULL,
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_entrega`),
  KEY `id_donacion` (`id_donacion`),
  KEY `id_comunidad` (`id_comunidad`),
  KEY `id_estado_entrega` (`id_estado_entrega`),
  CONSTRAINT `entrega_donacion_ibfk_1` FOREIGN KEY (`id_donacion`) REFERENCES `donacion` (`id_donacion`),
  CONSTRAINT `entrega_donacion_ibfk_2` FOREIGN KEY (`id_comunidad`) REFERENCES `comunidad_vulnerable` (`id_comunidad`),
  CONSTRAINT `entrega_donacion_ibfk_3` FOREIGN KEY (`id_estado_entrega`) REFERENCES `estado_entrega` (`id_estado_entrega`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega_donacion`
--

LOCK TABLES `entrega_donacion` WRITE;
/*!40000 ALTER TABLE `entrega_donacion` DISABLE KEYS */;
INSERT INTO `entrega_donacion` VALUES (1,2,1,'2026-01-30','2026-01-30',3,'Entrega completada sin incidencias'),(2,3,2,'2026-02-18',NULL,2,'Traslado en ruta interprovincial'),(3,4,3,'2026-02-21',NULL,1,'Pendiente de consolidacion de carga'),(4,5,6,'2026-02-23','2026-02-19',1,'Programada para coordinacion educativa');
/*!40000 ALTER TABLE `entrega_donacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_entrega`
--

DROP TABLE IF EXISTS `estado_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_entrega` (
  `id_estado_entrega` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estado_entrega`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_entrega`
--

LOCK TABLES `estado_entrega` WRITE;
/*!40000 ALTER TABLE `estado_entrega` DISABLE KEYS */;
INSERT INTO `estado_entrega` VALUES (1,'Pendiente'),(2,'En transito'),(3,'Entregado'),(4,'Cancelado');
/*!40000 ALTER TABLE `estado_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (31,'Peru'),(32,'Bolivia'),(33,'Ecuador'),(34,'Colombia'),(35,'Chile'),(36,'Argentina'),(37,'Mexico'),(38,'Estados Unidos'),(39,'España');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permiso` (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(80) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_permiso`),
  UNIQUE KEY `uk_permiso_codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=1233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (1,'DASHBOARD_VER','Ver Dashboard','Acceso al panel principal',1),(2,'DONACIONES_GESTIONAR','Gestionar Donaciones','Crear, editar y cambiar estado de donaciones',1),(3,'COMUNIDADES_GESTIONAR','Gestionar Comunidades','Crear, editar y cambiar estado de comunidades',1),(4,'INSTITUCIONES_GESTIONAR','Gestionar Instituciones','Crear, editar y cambiar estado de instituciones',1),(5,'VOLUNTARIOS_GESTIONAR','Gestionar Voluntarios','Crear, editar y cambiar estado de voluntarios',1),(6,'CAMPANIAS_GESTIONAR','Gestionar Campanias','Crear, editar y cambiar estado de campanias',1),(7,'ROLES_PERMISOS_GESTIONAR','Gestionar Roles y Permisos','Administrar roles y su matriz de permisos',1),(8,'REPORTES_VER','Ver Reportes','Acceso a reportes del sistema',1);
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso_donado`
--

DROP TABLE IF EXISTS `recurso_donado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurso_donado` (
  `id_recurso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `unidad_medida` varchar(50) DEFAULT NULL,
  `id_categoria_recurso` int(11) NOT NULL,
  PRIMARY KEY (`id_recurso`),
  KEY `id_categoria_recurso` (`id_categoria_recurso`),
  CONSTRAINT `recurso_donado_ibfk_1` FOREIGN KEY (`id_categoria_recurso`) REFERENCES `categoria_recurso_donado` (`id_categoria_recurso`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso_donado`
--

LOCK TABLES `recurso_donado` WRITE;
/*!40000 ALTER TABLE `recurso_donado` DISABLE KEYS */;
INSERT INTO `recurso_donado` VALUES (1,'Arroz','Sacos de arroz de 50kg','kg',1),(2,'Lentejas','Legumbres en bolsas','kg',1),(3,'Antibioticos','Tratamientos basicos','cajas',2),(4,'Cuadernos','Cuadernos escolares','unidades',3),(5,'Mantas termicas','Mantas para temporada fria','unidades',4),(6,'Kit de higiene','Jabon, pasta dental y cepillo','kits',5);
/*!40000 ALTER TABLE `recurso_donado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_permiso`
--

DROP TABLE IF EXISTS `rol_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_permiso` (
  `id_rol` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `permitido` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_rol`,`id_permiso`),
  KEY `fk_rol_permiso_permiso` (`id_permiso`),
  CONSTRAINT `fk_rol_permiso_permiso` FOREIGN KEY (`id_permiso`) REFERENCES `permiso` (`id_permiso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rol_permiso_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol_usuario` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_permiso`
--

LOCK TABLES `rol_permiso` WRITE;
/*!40000 ALTER TABLE `rol_permiso` DISABLE KEYS */;
INSERT INTO `rol_permiso` VALUES (1,1,1),(1,2,1),(1,3,1),(1,4,1),(1,5,1),(1,6,1),(1,7,1),(1,8,1),(2,1,1),(2,2,1),(2,3,0),(2,4,0),(2,5,0),(2,6,1),(2,7,0),(2,8,0),(3,1,1),(3,2,1),(3,3,0),(3,4,0),(3,5,0),(3,6,1),(3,7,0),(3,8,0),(4,1,1),(4,2,0),(4,3,1),(4,4,0),(4,5,0),(4,6,1),(4,7,0),(4,8,0);
/*!40000 ALTER TABLE `rol_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_usuario`
--

DROP TABLE IF EXISTS `rol_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_usuario` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_usuario`
--

LOCK TABLES `rol_usuario` WRITE;
/*!40000 ALTER TABLE `rol_usuario` DISABLE KEYS */;
INSERT INTO `rol_usuario` VALUES (1,'Administrador'),(2,'Institucion Donante'),(3,'Persona Natural'),(4,'Comunidad');
/*!40000 ALTER TABLE `rol_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_sistema`
--

DROP TABLE IF EXISTS `usuario_sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_sistema` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `estado` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuario_sistema_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol_usuario` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_sistema`
--

LOCK TABLES `usuario_sistema` WRITE;
/*!40000 ALTER TABLE `usuario_sistema` DISABLE KEYS */;
INSERT INTO `usuario_sistema` VALUES (1,'Administrador','admin@donaciones.org','123456',1,1),(2,'Institucion Donante','institucion@donaciones.org','123456',2,1),(3,'Persona Natural','persona@email.com','123456',3,1),(4,'Comunidad','comunidad@donaciones.org','123456',4,1);
/*!40000 ALTER TABLE `usuario_sistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voluntario`
--

DROP TABLE IF EXISTS `voluntario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voluntario` (
  `id_voluntario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_voluntario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voluntario`
--

LOCK TABLES `voluntario` WRITE;
/*!40000 ALTER TABLE `voluntario` DISABLE KEYS */;
INSERT INTO `voluntario` VALUES (1,'Luis Torres','999-111-222','luis@donaciones.org','2026-01-10',1),(2,'Ana Rojas','999-333-444','ana@donaciones.org','2026-01-18',1),(3,'Miguel Alvarado','999-555-101','miguel@donaciones.org','2026-01-22',1),(4,'Daniela Pozo','999-555-102','daniela@donaciones.org','2026-01-29',1),(5,'Raul Quispe','999-555-103','raul@donaciones.org','2026-02-03',0),(6,'Prueba SP Voluntario Editado','999-777-000','sp.voluntario.editado@test.org','2026-02-18',0),(8,'Karla Nunez','999-888-201','karla.nunez@donaciones.org','2026-02-11',1),(9,'Jhonatan Vega','999-888-202','jhonatan.vega@donaciones.org','2026-02-12',1),(10,'Patricia Salazar','999-888-203','patricia.salazar@donaciones.org','2026-02-13',1);
/*!40000 ALTER TABLE `voluntario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sistema_donaciones'
--

--
-- Dumping routines for database 'sistema_donaciones'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_campania_contar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_campania_contar`(
    IN p_q VARCHAR(255),
    IN p_estado VARCHAR(30),
    IN p_activo INT
)
BEGIN
    SELECT COUNT(*) AS total
    FROM campania c
    WHERE
        (
            p_q IS NULL OR p_q = '' OR
            UPPER(c.nombre) LIKE CONCAT('%', UPPER(p_q), '%') OR
            UPPER(COALESCE(c.descripcion, '')) LIKE CONCAT('%', UPPER(p_q), '%')
        )
        AND (
            p_estado IS NULL OR p_estado = '' OR UPPER(p_estado) = 'TODAS' OR
            UPPER(COALESCE(c.estado, '')) = UPPER(p_estado)
        )
        AND (p_activo IS NULL OR c.activo = p_activo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_campania_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_campania_crear`(
    IN p_nombre VARCHAR(150),
    IN p_descripcion TEXT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_estado VARCHAR(30),
    IN p_monto_objetivo DECIMAL(12,2)
)
BEGIN
    INSERT INTO campania (nombre, descripcion, fecha_inicio, fecha_fin, estado, monto_objetivo, activo)
    VALUES (p_nombre, p_descripcion, p_fecha_inicio, p_fecha_fin, p_estado, p_monto_objetivo, 1);

    SELECT LAST_INSERT_ID() AS new_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_campania_detalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_campania_detalle`(
    IN p_id_campania INT
)
BEGIN
    SELECT
        c.id_campania,
        c.nombre,
        COALESCE(c.descripcion, '') AS descripcion,
        c.fecha_inicio,
        c.fecha_fin,
        COALESCE(c.estado, 'Activa') AS estado,
        COALESCE(c.monto_objetivo, 0) AS monto_objetivo,
        c.activo,
        DATE_FORMAT(c.fecha_inicio, '%Y-%m-%d') AS fecha_inicio_fmt,
        DATE_FORMAT(c.fecha_fin, '%Y-%m-%d') AS fecha_fin_fmt,
        FORMAT(COALESCE(c.monto_objetivo, 0), 2) AS monto_objetivo_fmt,
        FORMAT(COALESCE(SUM(COALESCE(d.monto, 0)), 0), 2) AS monto_recaudado_fmt,
        COALESCE(SUM(COALESCE(d.monto, 0)), 0) AS monto_recaudado,
        CASE
            WHEN COALESCE(c.monto_objetivo, 0) <= 0 THEN 0
            ELSE LEAST(100, ROUND(COALESCE(SUM(COALESCE(d.monto, 0)), 0) * 100 / c.monto_objetivo, 0))
        END AS progreso,
        COUNT(DISTINCT d.id_donacion) AS total_donaciones
    FROM campania c
    LEFT JOIN donacion d ON d.id_campania = c.id_campania
        AND (d.activo = 1 OR d.activo IS NULL)
    WHERE c.id_campania = p_id_campania
    GROUP BY
        c.id_campania, c.nombre, c.descripcion, c.estado,
        c.fecha_inicio, c.fecha_fin, c.monto_objetivo, c.activo
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_campania_editar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_campania_editar`(
    IN p_id_campania INT,
    IN p_nombre VARCHAR(150),
    IN p_descripcion TEXT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_estado VARCHAR(30),
    IN p_monto_objetivo DECIMAL(12,2)
)
BEGIN
    UPDATE campania
    SET
        nombre = p_nombre,
        descripcion = p_descripcion,
        fecha_inicio = p_fecha_inicio,
        fecha_fin = p_fecha_fin,
        estado = p_estado,
        monto_objetivo = p_monto_objetivo
    WHERE id_campania = p_id_campania;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_campania_eliminar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_campania_eliminar`(
    IN p_id_campania INT
)
BEGIN
    UPDATE campania
    SET activo = 0
    WHERE id_campania = p_id_campania;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_campania_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_campania_listar`(
    IN p_q VARCHAR(255),
    IN p_estado VARCHAR(30),
    IN p_activo INT,
    IN p_offset INT,
    IN p_limit INT
)
BEGIN
    SELECT
        c.id_campania,
        c.nombre,
        COALESCE(c.descripcion, '') AS descripcion,
        c.fecha_inicio,
        c.fecha_fin,
        COALESCE(c.estado, 'Activa') AS estado,
        COALESCE(c.monto_objetivo, 0) AS monto_objetivo,
        c.activo,
        DATE_FORMAT(c.fecha_inicio, '%Y-%m-%d') AS fecha_inicio_fmt,
        DATE_FORMAT(c.fecha_fin, '%Y-%m-%d') AS fecha_fin_fmt,
        FORMAT(COALESCE(c.monto_objetivo, 0), 2) AS monto_objetivo_fmt,
        FORMAT(COALESCE(SUM(COALESCE(d.monto, 0)), 0), 2) AS monto_recaudado_fmt,
        COALESCE(SUM(COALESCE(d.monto, 0)), 0) AS monto_recaudado,
        CASE
            WHEN COALESCE(c.monto_objetivo, 0) <= 0 THEN 0
            ELSE LEAST(100, ROUND(COALESCE(SUM(COALESCE(d.monto, 0)), 0) * 100 / c.monto_objetivo, 0))
        END AS progreso,
        COUNT(DISTINCT d.id_donacion) AS total_donaciones
    FROM campania c
    LEFT JOIN donacion d ON d.id_campania = c.id_campania
        AND (d.activo = 1 OR d.activo IS NULL)
    WHERE
        (
            p_q IS NULL OR p_q = '' OR
            UPPER(c.nombre) LIKE CONCAT('%', UPPER(p_q), '%') OR
            UPPER(COALESCE(c.descripcion, '')) LIKE CONCAT('%', UPPER(p_q), '%')
        )
        AND (
            p_estado IS NULL OR p_estado = '' OR UPPER(p_estado) = 'TODAS' OR
            UPPER(COALESCE(c.estado, '')) = UPPER(p_estado)
        )
        AND (p_activo IS NULL OR c.activo = p_activo)
    GROUP BY
        c.id_campania, c.nombre, c.descripcion, c.estado,
        c.fecha_inicio, c.fecha_fin, c.monto_objetivo, c.activo
    ORDER BY c.id_campania DESC
    LIMIT p_offset, p_limit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_campania_restaurar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_campania_restaurar`(
    IN p_id_campania INT
)
BEGIN
    UPDATE campania
    SET activo = 1
    WHERE id_campania = p_id_campania;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_comunidad_contar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_comunidad_contar`(
    IN p_q VARCHAR(255),
    IN p_activo INT
)
BEGIN
    SELECT COUNT(*) AS total
    FROM comunidad_vulnerable c
    WHERE
        (
            p_q IS NULL OR p_q = '' OR
            UPPER(c.nombre) LIKE CONCAT('%', UPPER(p_q), '%') OR
            UPPER(COALESCE(c.ubicacion, '')) LIKE CONCAT('%', UPPER(p_q), '%')
        )
        AND (p_activo IS NULL OR c.activo = p_activo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_comunidad_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_comunidad_crear`(
    IN p_nombre VARCHAR(150),
    IN p_ubicacion VARCHAR(200),
    IN p_descripcion TEXT,
    IN p_cantidad_beneficiarios INT,
    IN p_id_pais INT
)
BEGIN
    INSERT INTO comunidad_vulnerable (
        nombre, ubicacion, descripcion, cantidad_beneficiarios, id_pais, activo
    ) VALUES (
        p_nombre, p_ubicacion, p_descripcion, p_cantidad_beneficiarios, p_id_pais, 1
    );

    SELECT LAST_INSERT_ID() AS new_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_comunidad_detalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_comunidad_detalle`(
    IN p_id_comunidad INT
)
BEGIN
    SELECT
        c.id_comunidad,
        c.nombre,
        COALESCE(c.ubicacion, '') AS ubicacion,
        COALESCE(c.descripcion, '') AS descripcion,
        COALESCE(c.cantidad_beneficiarios, 0) AS cantidad_beneficiarios,
        c.id_pais,
        p.nombre AS pais,
        c.activo,
        COUNT(DISTINCT ed.id_donacion) AS donaciones_recibidas
    FROM comunidad_vulnerable c
    INNER JOIN pais p ON p.id_pais = c.id_pais
    LEFT JOIN entrega_donacion ed ON ed.id_comunidad = c.id_comunidad
    WHERE c.id_comunidad = p_id_comunidad
    GROUP BY
        c.id_comunidad, c.nombre, c.ubicacion, c.descripcion,
        c.cantidad_beneficiarios, c.id_pais, p.nombre, c.activo
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_comunidad_editar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_comunidad_editar`(
    IN p_id_comunidad INT,
    IN p_nombre VARCHAR(150),
    IN p_ubicacion VARCHAR(200),
    IN p_descripcion TEXT,
    IN p_cantidad_beneficiarios INT,
    IN p_id_pais INT
)
BEGIN
    UPDATE comunidad_vulnerable
    SET
        nombre = p_nombre,
        ubicacion = p_ubicacion,
        descripcion = p_descripcion,
        cantidad_beneficiarios = p_cantidad_beneficiarios,
        id_pais = p_id_pais
    WHERE id_comunidad = p_id_comunidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_comunidad_inactivar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_comunidad_inactivar`(
    IN p_id_comunidad INT
)
BEGIN
    UPDATE comunidad_vulnerable
    SET activo = 0
    WHERE id_comunidad = p_id_comunidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_comunidad_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_comunidad_listar`(
    IN p_q VARCHAR(255),
    IN p_activo INT,
    IN p_offset INT,
    IN p_limit INT
)
BEGIN
    SELECT
        c.id_comunidad,
        c.nombre,
        COALESCE(c.ubicacion, '') AS ubicacion,
        COALESCE(c.descripcion, '') AS descripcion,
        COALESCE(c.cantidad_beneficiarios, 0) AS cantidad_beneficiarios,
        c.id_pais,
        p.nombre AS pais,
        c.activo,
        COUNT(DISTINCT ed.id_donacion) AS donaciones_recibidas
    FROM comunidad_vulnerable c
    INNER JOIN pais p ON p.id_pais = c.id_pais
    LEFT JOIN entrega_donacion ed ON ed.id_comunidad = c.id_comunidad
    WHERE
        (
            p_q IS NULL OR p_q = '' OR
            UPPER(c.nombre) LIKE CONCAT('%', UPPER(p_q), '%') OR
            UPPER(COALESCE(c.ubicacion, '')) LIKE CONCAT('%', UPPER(p_q), '%')
        )
        AND (p_activo IS NULL OR c.activo = p_activo)
    GROUP BY
        c.id_comunidad, c.nombre, c.ubicacion, c.descripcion,
        c.cantidad_beneficiarios, c.id_pais, p.nombre, c.activo
    ORDER BY c.nombre ASC
    LIMIT p_offset, p_limit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_comunidad_restaurar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_comunidad_restaurar`(
    IN p_id_comunidad INT
)
BEGIN
    UPDATE comunidad_vulnerable
    SET activo = 1
    WHERE id_comunidad = p_id_comunidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_donacion_contar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_donacion_contar`(
    IN p_q VARCHAR(255),
    IN p_estado VARCHAR(30),
    IN p_activo INT
)
BEGIN
    SELECT COUNT(*) AS total
    FROM donacion d
    WHERE
        (
            p_q IS NULL OR p_q = '' OR
            CAST(d.id_donacion AS CHAR) LIKE CONCAT('%', REPLACE(REPLACE(UPPER(p_q), 'DON-', ''), ' ', ''), '%') OR
            CONCAT('DON-', LPAD(d.id_donacion, 3, '0')) LIKE CONCAT('%', UPPER(p_q), '%') OR
            UPPER(d.descripcion) LIKE CONCAT('%', UPPER(p_q), '%')
        )
        AND
        (
            p_estado IS NULL OR p_estado = '' OR UPPER(p_estado) = 'TODAS' OR
            UPPER(d.estado_donacion) = UPPER(p_estado)
        )
        AND
        (
            p_activo IS NULL OR d.activo = p_activo
        );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_donacion_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_donacion_crear`(
    IN p_id_donante INT,
    IN p_id_campania INT,
    IN p_tipo_donacion VARCHAR(30),
    IN p_estado_donacion VARCHAR(30),
    IN p_fecha_donacion DATE,
    IN p_monto DECIMAL(10,2),
    IN p_descripcion TEXT
)
BEGIN
    INSERT INTO donacion (
        id_donante, id_campania, tipo_donacion, estado_donacion,
        fecha_donacion, monto, descripcion, activo
    ) VALUES (
        p_id_donante, p_id_campania, p_tipo_donacion, p_estado_donacion,
        p_fecha_donacion, p_monto, p_descripcion, 1
    );

    SELECT LAST_INSERT_ID() AS new_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_donacion_detalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_donacion_detalle`(
    IN p_id_donacion INT
)
BEGIN
    SELECT
        d.id_donacion,
        d.id_donante,
        d.id_campania,
        d.tipo_donacion,
        d.estado_donacion,
        d.fecha_donacion,
        d.monto,
        d.descripcion,
        d.activo,
        DATE_FORMAT(d.fecha_donacion, '%Y-%m-%d') AS fecha_donacion_fmt,
        COALESCE(CONCAT('S/ ', FORMAT(d.monto, 2)), 'N/A') AS monto_fmt,
        dn.nombre AS donante,
        COALESCE(dn.email, 'N/A') AS email,
        COALESCE(c.nombre, 'Sin campania') AS campania
    FROM donacion d
    INNER JOIN donante dn ON dn.id_donante = d.id_donante
    LEFT JOIN campania c ON c.id_campania = d.id_campania
    WHERE d.id_donacion = p_id_donacion
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_donacion_editar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_donacion_editar`(
    IN p_id_donacion INT,
    IN p_id_donante INT,
    IN p_id_campania INT,
    IN p_tipo_donacion VARCHAR(30),
    IN p_estado_donacion VARCHAR(30),
    IN p_fecha_donacion DATE,
    IN p_monto DECIMAL(10,2),
    IN p_descripcion TEXT
)
BEGIN
    UPDATE donacion
    SET
        id_donante = p_id_donante,
        id_campania = p_id_campania,
        tipo_donacion = p_tipo_donacion,
        estado_donacion = p_estado_donacion,
        fecha_donacion = p_fecha_donacion,
        monto = p_monto,
        descripcion = p_descripcion
    WHERE id_donacion = p_id_donacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_donacion_inactivar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_donacion_inactivar`(
    IN p_id_donacion INT
)
BEGIN
    UPDATE donacion
    SET activo = 0
    WHERE id_donacion = p_id_donacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_donacion_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_donacion_listar`(
    IN p_q VARCHAR(255),
    IN p_estado VARCHAR(30),
    IN p_activo INT,
    IN p_offset INT,
    IN p_limit INT
)
BEGIN
    SELECT
        d.id_donacion,
        d.id_donante,
        d.id_campania,
        d.tipo_donacion,
        d.estado_donacion,
        d.fecha_donacion,
        d.monto,
        d.descripcion,
        d.activo,
        COALESCE(CONCAT('S/ ', FORMAT(d.monto, 2)), d.tipo_donacion) AS detalle,
        dn.nombre AS donante
    FROM donacion d
    INNER JOIN donante dn ON dn.id_donante = d.id_donante
    WHERE
        (
            p_q IS NULL OR p_q = '' OR
            CAST(d.id_donacion AS CHAR) LIKE CONCAT('%', REPLACE(REPLACE(UPPER(p_q), 'DON-', ''), ' ', ''), '%') OR
            CONCAT('DON-', LPAD(d.id_donacion, 3, '0')) LIKE CONCAT('%', UPPER(p_q), '%') OR
            UPPER(d.descripcion) LIKE CONCAT('%', UPPER(p_q), '%')
        )
        AND
        (
            p_estado IS NULL OR p_estado = '' OR UPPER(p_estado) = 'TODAS' OR
            UPPER(d.estado_donacion) = UPPER(p_estado)
        )
        AND
        (
            p_activo IS NULL OR d.activo = p_activo
        )
    ORDER BY d.fecha_donacion DESC, d.id_donacion DESC
    LIMIT p_offset, p_limit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_donacion_restaurar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_donacion_restaurar`(
    IN p_id_donacion INT
)
BEGIN
    UPDATE donacion
    SET activo = 1
    WHERE id_donacion = p_id_donacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_entrega_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_entrega_cambiar_estado`(
    IN p_id_entrega INT,
    IN p_id_estado_entrega INT,
    IN p_fecha_entrega DATE,
    IN p_observaciones TEXT
)
BEGIN
    UPDATE entrega_donacion
    SET id_estado_entrega = p_id_estado_entrega,
        fecha_entrega = p_fecha_entrega,
        observaciones = p_observaciones
    WHERE id_entrega = p_id_entrega;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_entrega_contar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_entrega_contar`(
    IN p_q VARCHAR(255),
    IN p_estado VARCHAR(50)
)
BEGIN
    SELECT COUNT(*) AS total
    FROM entrega_donacion e
    INNER JOIN estado_entrega ee ON ee.id_estado_entrega = e.id_estado_entrega
    INNER JOIN donacion d ON d.id_donacion = e.id_donacion
    INNER JOIN comunidad_vulnerable c ON c.id_comunidad = e.id_comunidad
    WHERE
        (p_q IS NULL OR p_q = '' OR
         UPPER(c.nombre) LIKE CONCAT('%', UPPER(p_q), '%') OR
         UPPER(COALESCE(d.descripcion, '')) LIKE CONCAT('%', UPPER(p_q), '%'))
        AND
        (p_estado IS NULL OR p_estado = '' OR UPPER(p_estado) = 'TODOS' OR
         UPPER(ee.descripcion) = UPPER(p_estado));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_entrega_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_entrega_crear`(
    IN p_id_donacion INT,
    IN p_id_comunidad INT,
    IN p_id_estado_entrega INT,
    IN p_fecha_programada DATE,
    IN p_fecha_entrega DATE,
    IN p_observaciones TEXT
)
BEGIN
    INSERT INTO entrega_donacion (
        id_donacion, id_comunidad, id_estado_entrega,
        fecha_programada, fecha_entrega, observaciones
    ) VALUES (
        p_id_donacion, p_id_comunidad, p_id_estado_entrega,
        p_fecha_programada, p_fecha_entrega, p_observaciones
    );
    SELECT LAST_INSERT_ID() AS new_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_entrega_detalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_entrega_detalle`(
    IN p_id_entrega INT
)
BEGIN
    SELECT
        e.id_entrega,
        e.id_donacion,
        e.id_comunidad,
        e.fecha_programada,
        e.fecha_entrega,
        e.id_estado_entrega,
        COALESCE(e.observaciones, '') AS observaciones
    FROM entrega_donacion e
    WHERE e.id_entrega = p_id_entrega
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_entrega_editar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_entrega_editar`(
    IN p_id_entrega INT,
    IN p_id_donacion INT,
    IN p_id_comunidad INT,
    IN p_id_estado_entrega INT,
    IN p_fecha_programada DATE,
    IN p_fecha_entrega DATE,
    IN p_observaciones TEXT
)
BEGIN
    UPDATE entrega_donacion
    SET id_donacion = p_id_donacion,
        id_comunidad = p_id_comunidad,
        id_estado_entrega = p_id_estado_entrega,
        fecha_programada = p_fecha_programada,
        fecha_entrega = p_fecha_entrega,
        observaciones = p_observaciones
    WHERE id_entrega = p_id_entrega;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_entrega_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_entrega_listar`(
    IN p_q VARCHAR(255),
    IN p_estado VARCHAR(50),
    IN p_offset INT,
    IN p_limit INT
)
BEGIN
    SELECT
        e.id_entrega,
        e.id_donacion,
        e.id_comunidad,
        e.fecha_programada,
        e.fecha_entrega,
        e.id_estado_entrega,
        COALESCE(e.observaciones, '') AS observaciones
    FROM entrega_donacion e
    INNER JOIN estado_entrega ee ON ee.id_estado_entrega = e.id_estado_entrega
    INNER JOIN donacion d ON d.id_donacion = e.id_donacion
    INNER JOIN comunidad_vulnerable c ON c.id_comunidad = e.id_comunidad
    WHERE
        (p_q IS NULL OR p_q = '' OR
         UPPER(c.nombre) LIKE CONCAT('%', UPPER(p_q), '%') OR
         UPPER(COALESCE(d.descripcion, '')) LIKE CONCAT('%', UPPER(p_q), '%'))
        AND
        (p_estado IS NULL OR p_estado = '' OR UPPER(p_estado) = 'TODOS' OR
         UPPER(ee.descripcion) = UPPER(p_estado))
    ORDER BY e.id_entrega DESC
    LIMIT p_offset, p_limit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_finanzas_por_campania` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_finanzas_por_campania`()
BEGIN
    SELECT
        c.id_campania,
        c.nombre,
        COALESCE(c.monto_objetivo, 0) AS meta,
        COALESCE(SUM(COALESCE(d.monto, 0)), 0) AS recaudado,
        COALESCE(c.monto_objetivo, 0) - COALESCE(SUM(COALESCE(d.monto, 0)), 0) AS saldo,
        COUNT(DISTINCT d.id_donacion) AS donaciones
    FROM campania c
    LEFT JOIN donacion d ON d.id_campania = c.id_campania AND d.activo = 1
    WHERE c.activo = 1
    GROUP BY c.id_campania, c.nombre, c.monto_objetivo
    ORDER BY recaudado DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_finanzas_por_comunidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_finanzas_por_comunidad`()
BEGIN
    SELECT
        cv.id_comunidad,
        cv.nombre,
        cv.cantidad_beneficiarios,
        COUNT(DISTINCT e.id_entrega) AS entregas_totales,
        COUNT(DISTINCT CASE WHEN UPPER(ee.descripcion) = 'ENTREGADO' THEN e.id_entrega END) AS entregas_completadas,
        COALESCE(SUM(
            CASE WHEN UPPER(ee.descripcion) = 'ENTREGADO' THEN COALESCE(d.monto, 0) ELSE 0 END
        ), 0) AS monto_recibido
    FROM comunidad_vulnerable cv
    LEFT JOIN entrega_donacion e ON e.id_comunidad = cv.id_comunidad
    LEFT JOIN estado_entrega ee ON ee.id_estado_entrega = e.id_estado_entrega
    LEFT JOIN donacion d ON d.id_donacion = e.id_donacion
    WHERE cv.activo = 1
    GROUP BY cv.id_comunidad, cv.nombre, cv.cantidad_beneficiarios
    ORDER BY monto_recibido DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_finanzas_resumen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_finanzas_resumen`()
BEGIN
    SELECT
        COALESCE(SUM(CASE WHEN d.activo = 1 THEN COALESCE(d.monto, 0) ELSE 0 END), 0) AS total_recaudado,
        COALESCE((
            SELECT SUM(COALESCE(d2.monto, 0))
            FROM donacion d2
            WHERE d2.activo = 1
              AND d2.id_donacion IN (
                  SELECT e2.id_donacion
                  FROM entrega_donacion e2
                  INNER JOIN estado_entrega ee2 ON ee2.id_estado_entrega = e2.id_estado_entrega
                  WHERE UPPER(ee2.descripcion) = 'ENTREGADO'
              )
        ), 0) AS total_entregado,
        COUNT(DISTINCT CASE WHEN d.activo = 1 THEN d.id_donacion END) AS total_donaciones,
        COUNT(DISTINCT e.id_entrega) AS total_entregas
    FROM donacion d
    LEFT JOIN entrega_donacion e ON e.id_donacion = d.id_donacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_institucion_contar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_institucion_contar`(
    IN p_q VARCHAR(255),
    IN p_activo INT
)
BEGIN
    SELECT COUNT(*) AS total
    FROM donante d
    INNER JOIN pais p ON p.id_pais = d.id_pais
    WHERE
        UPPER(d.tipo_donante) NOT LIKE 'PERSONA%'
        AND (
            p_q IS NULL OR p_q = '' OR
            UPPER(d.nombre) LIKE CONCAT('%', UPPER(p_q), '%') OR
            UPPER(p.nombre) LIKE CONCAT('%', UPPER(p_q), '%') OR
            UPPER(COALESCE(d.direccion, '')) LIKE CONCAT('%', UPPER(p_q), '%')
        )
        AND (p_activo IS NULL OR d.activo = p_activo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_institucion_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_institucion_crear`(
    IN p_nombre VARCHAR(150),
    IN p_email VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_direccion VARCHAR(200),
    IN p_tipo_donante VARCHAR(30),
    IN p_id_pais INT,
    IN p_fecha_registro DATE
)
BEGIN
    INSERT INTO donante (
        nombre, email, telefono, direccion, tipo_donante, id_pais, fecha_registro, activo
    ) VALUES (
        p_nombre, p_email, p_telefono, p_direccion, p_tipo_donante, p_id_pais, p_fecha_registro, 1
    );

    SELECT LAST_INSERT_ID() AS new_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_institucion_detalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_institucion_detalle`(
    IN p_id_donante INT
)
BEGIN
    SELECT
        d.id_donante,
        d.nombre,
        COALESCE(d.email, '') AS email,
        COALESCE(d.telefono, '') AS telefono,
        COALESCE(d.direccion, '') AS direccion,
        COALESCE(d.tipo_donante, 'Institucion') AS tipo_donante,
        d.id_pais,
        d.fecha_registro,
        d.activo,
        p.nombre AS pais,
        DATE_FORMAT(d.fecha_registro, '%Y-%m-%d') AS fecha_registro_fmt,
        COUNT(DISTINCT dn.id_donacion) AS total_donaciones
    FROM donante d
    INNER JOIN pais p ON p.id_pais = d.id_pais
    LEFT JOIN donacion dn ON dn.id_donante = d.id_donante
    WHERE d.id_donante = p_id_donante
      AND UPPER(d.tipo_donante) NOT LIKE 'PERSONA%'
    GROUP BY
        d.id_donante, d.nombre, d.email, d.telefono, d.direccion,
        d.tipo_donante, d.id_pais, d.fecha_registro, d.activo, p.nombre
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_institucion_editar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_institucion_editar`(
    IN p_id_donante INT,
    IN p_nombre VARCHAR(150),
    IN p_email VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_direccion VARCHAR(200),
    IN p_tipo_donante VARCHAR(30),
    IN p_id_pais INT
)
BEGIN
    UPDATE donante
    SET
        nombre = p_nombre,
        email = p_email,
        telefono = p_telefono,
        direccion = p_direccion,
        tipo_donante = p_tipo_donante,
        id_pais = p_id_pais
    WHERE id_donante = p_id_donante
      AND UPPER(tipo_donante) NOT LIKE 'PERSONA%';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_institucion_inactivar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_institucion_inactivar`(
    IN p_id_donante INT
)
BEGIN
    UPDATE donante
    SET activo = 0
    WHERE id_donante = p_id_donante
      AND UPPER(tipo_donante) NOT LIKE 'PERSONA%';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_institucion_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_institucion_listar`(
    IN p_q VARCHAR(255),
    IN p_activo INT,
    IN p_offset INT,
    IN p_limit INT
)
BEGIN
    SELECT
        d.id_donante,
        d.nombre,
        COALESCE(d.email, '') AS email,
        COALESCE(d.telefono, '') AS telefono,
        COALESCE(d.direccion, '') AS direccion,
        COALESCE(d.tipo_donante, 'Institucion') AS tipo_donante,
        d.id_pais,
        d.fecha_registro,
        d.activo,
        p.nombre AS pais,
        COUNT(DISTINCT dn.id_donacion) AS total_donaciones
    FROM donante d
    INNER JOIN pais p ON p.id_pais = d.id_pais
    LEFT JOIN donacion dn ON dn.id_donante = d.id_donante
    WHERE
        UPPER(d.tipo_donante) NOT LIKE 'PERSONA%'
        AND (
            p_q IS NULL OR p_q = '' OR
            UPPER(d.nombre) LIKE CONCAT('%', UPPER(p_q), '%') OR
            UPPER(p.nombre) LIKE CONCAT('%', UPPER(p_q), '%') OR
            UPPER(COALESCE(d.direccion, '')) LIKE CONCAT('%', UPPER(p_q), '%')
        )
        AND (p_activo IS NULL OR d.activo = p_activo)
    GROUP BY
        d.id_donante, d.nombre, d.email, d.telefono, d.direccion,
        d.tipo_donante, d.id_pais, p.nombre, d.activo
    ORDER BY d.nombre ASC
    LIMIT p_offset, p_limit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_institucion_restaurar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_institucion_restaurar`(
    IN p_id_donante INT
)
BEGIN
    UPDATE donante
    SET activo = 1
    WHERE id_donante = p_id_donante
      AND UPPER(tipo_donante) NOT LIKE 'PERSONA%';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_voluntario_buscar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_voluntario_buscar`(
    IN p_id_voluntario INT
)
BEGIN
    SELECT
        id_voluntario,
        nombre,
        telefono,
        email,
        fecha_ingreso,
        estado
    FROM voluntario
    WHERE id_voluntario = p_id_voluntario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_voluntario_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_voluntario_cambiar_estado`(
    IN p_id_voluntario INT,
    IN p_estado TINYINT
)
BEGIN
    UPDATE voluntario
    SET estado = IF(p_estado IS NULL, 0, p_estado)
    WHERE id_voluntario = p_id_voluntario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_voluntario_contar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_voluntario_contar`(
    IN p_q VARCHAR(255),
    IN p_estado INT
)
BEGIN
    SELECT COUNT(*) AS total
    FROM voluntario v
    WHERE
        (
            p_q IS NULL OR p_q = '' OR
            UPPER(v.nombre) LIKE CONCAT('%', UPPER(p_q), '%') OR
            UPPER(COALESCE(v.email, '')) LIKE CONCAT('%', UPPER(p_q), '%') OR
            UPPER(COALESCE(v.telefono, '')) LIKE CONCAT('%', UPPER(p_q), '%')
        )
        AND (p_estado IS NULL OR v.estado = p_estado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_voluntario_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_voluntario_crear`(
    IN p_nombre VARCHAR(150),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_fecha_ingreso DATE
)
BEGIN
    INSERT INTO voluntario (nombre, telefono, email, fecha_ingreso, estado)
    VALUES (p_nombre, p_telefono, p_email, p_fecha_ingreso, 1);

    SELECT LAST_INSERT_ID() AS new_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_voluntario_detalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_voluntario_detalle`(
    IN p_id_voluntario INT
)
BEGIN
    SELECT
        v.id_voluntario,
        v.nombre,
        COALESCE(v.email, '') AS email,
        COALESCE(v.telefono, '') AS telefono,
        v.fecha_ingreso,
        v.estado,
        DATE_FORMAT(v.fecha_ingreso, '%Y-%m-%d') AS fecha_ingreso_fmt,
        COUNT(DISTINCT ave.id_entrega) AS total_entregas,
        SUM(CASE WHEN UPPER(COALESCE(ee.descripcion, '')) = 'ENTREGADO' THEN 1 ELSE 0 END) AS entregas_completadas
    FROM voluntario v
    LEFT JOIN asignacion_voluntario_entrega ave ON ave.id_voluntario = v.id_voluntario
    LEFT JOIN entrega_donacion ed ON ed.id_entrega = ave.id_entrega
    LEFT JOIN estado_entrega ee ON ee.id_estado_entrega = ed.id_estado_entrega
    WHERE v.id_voluntario = p_id_voluntario
    GROUP BY
        v.id_voluntario, v.nombre, v.email, v.telefono, v.fecha_ingreso, v.estado
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_voluntario_editar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_voluntario_editar`(
    IN p_id_voluntario INT,
    IN p_nombre VARCHAR(150),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_fecha_ingreso DATE
)
BEGIN
    UPDATE voluntario
    SET
        nombre = p_nombre,
        telefono = p_telefono,
        email = p_email,
        fecha_ingreso = p_fecha_ingreso
    WHERE id_voluntario = p_id_voluntario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_voluntario_eliminar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_voluntario_eliminar`(
    IN p_id_voluntario INT
)
BEGIN
    UPDATE voluntario
    SET estado = 0
    WHERE id_voluntario = p_id_voluntario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_voluntario_eliminar_logico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_voluntario_eliminar_logico`(
    IN p_id_voluntario INT
)
BEGIN
    UPDATE voluntario
    SET estado = 0
    WHERE id_voluntario = p_id_voluntario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_voluntario_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_voluntario_listar`(
    IN p_q VARCHAR(255),
    IN p_estado INT,
    IN p_offset INT,
    IN p_limit INT
)
BEGIN
    SELECT
        v.id_voluntario,
        v.nombre,
        COALESCE(v.email, '') AS email,
        COALESCE(v.telefono, '') AS telefono,
        v.fecha_ingreso,
        v.estado,
        DATE_FORMAT(v.fecha_ingreso, '%Y-%m-%d') AS fecha_ingreso_fmt,
        COUNT(DISTINCT ave.id_entrega) AS total_entregas,
        SUM(CASE WHEN UPPER(COALESCE(ee.descripcion, '')) = 'ENTREGADO' THEN 1 ELSE 0 END) AS entregas_completadas
    FROM voluntario v
    LEFT JOIN asignacion_voluntario_entrega ave ON ave.id_voluntario = v.id_voluntario
    LEFT JOIN entrega_donacion ed ON ed.id_entrega = ave.id_entrega
    LEFT JOIN estado_entrega ee ON ee.id_estado_entrega = ed.id_estado_entrega
    WHERE
        (
            p_q IS NULL OR p_q = '' OR
            UPPER(v.nombre) LIKE CONCAT('%', UPPER(p_q), '%') OR
            UPPER(COALESCE(v.email, '')) LIKE CONCAT('%', UPPER(p_q), '%') OR
            UPPER(COALESCE(v.telefono, '')) LIKE CONCAT('%', UPPER(p_q), '%')
        )
        AND (p_estado IS NULL OR v.estado = p_estado)
    GROUP BY
        v.id_voluntario, v.nombre, v.email, v.telefono, v.fecha_ingreso, v.estado
    ORDER BY v.nombre ASC
    LIMIT p_offset, p_limit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_voluntario_listar_paginar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_voluntario_listar_paginar`(
    IN p_buscar VARCHAR(150),
    IN p_pagina INT,
    IN p_registros_por_pagina INT,
    OUT p_total_registros INT
)
BEGIN
    DECLARE v_buscar VARCHAR(150);
    DECLARE v_offset INT;
    DECLARE v_registros INT;

    SET v_buscar = IFNULL(TRIM(p_buscar), '');
    SET v_registros = GREATEST(IFNULL(p_registros_por_pagina, 10), 1);
    SET v_offset = GREATEST(IFNULL(p_pagina, 0), 0) * v_registros;

    SELECT COUNT(*)
      INTO p_total_registros
    FROM voluntario
    WHERE estado = 1
      AND (
            v_buscar = ''
            OR nombre   LIKE CONCAT('%', v_buscar, '%')
            OR telefono LIKE CONCAT('%', v_buscar, '%')
            OR email    LIKE CONCAT('%', v_buscar, '%')
          );

    SELECT
        id_voluntario,
        nombre,
        telefono,
        email,
        fecha_ingreso,
        estado
    FROM voluntario
    WHERE estado = 1
      AND (
            v_buscar = ''
            OR nombre   LIKE CONCAT('%', v_buscar, '%')
            OR telefono LIKE CONCAT('%', v_buscar, '%')
            OR email    LIKE CONCAT('%', v_buscar, '%')
          )
    ORDER BY id_voluntario DESC
    LIMIT v_offset, v_registros;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_voluntario_registrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_voluntario_registrar`(
    IN p_nombre VARCHAR(150),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_fecha_ingreso DATE
)
BEGIN
    INSERT INTO voluntario(nombre, telefono, email, fecha_ingreso, estado)
    VALUES (p_nombre, p_telefono, p_email, p_fecha_ingreso, 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_voluntario_restaurar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_voluntario_restaurar`(
    IN p_id_voluntario INT
)
BEGIN
    UPDATE voluntario
    SET estado = 1
    WHERE id_voluntario = p_id_voluntario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-23  7:42:32
