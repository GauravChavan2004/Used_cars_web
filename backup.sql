-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: one_point_car_mall_db
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add car',7,'add_car'),(26,'Can change car',7,'change_car'),(27,'Can delete car',7,'delete_car'),(28,'Can view car',7,'view_car'),(29,'Can add car image',8,'add_carimage'),(30,'Can change car image',8,'change_carimage'),(31,'Can delete car image',8,'delete_carimage'),(32,'Can view car image',8,'view_carimage'),(33,'Can add test drive booking',9,'add_testdrivebooking'),(34,'Can change test drive booking',9,'change_testdrivebooking'),(35,'Can delete test drive booking',9,'delete_testdrivebooking'),(36,'Can view test drive booking',9,'view_testdrivebooking'),(37,'Can add car submission',10,'add_carsubmission'),(38,'Can change car submission',10,'change_carsubmission'),(39,'Can delete car submission',10,'delete_carsubmission'),(40,'Can view car submission',10,'view_carsubmission'),(41,'Can add user profile',11,'add_userprofile'),(42,'Can change user profile',11,'change_userprofile'),(43,'Can delete user profile',11,'delete_userprofile'),(44,'Can view user profile',11,'view_userprofile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$mDTjYL1YumcDTKc8W7qE4N$sFisOWyMRfkFveeJNGn4eItM7DzCr6CABYmxbKM+G/s=','2025-04-25 15:58:06.102999',1,'admin','Gaurav','Chavan','gc6781655@gmail.com',1,1,'2025-03-18 15:33:16.037020'),(2,'pbkdf2_sha256$720000$VkSJuCw6oeDqgnGVbUk0k6$EmL61kQui8Z21w1IUWIlAnCojttI2jf/2gg+0Va4CfU=','2026-04-23 16:39:03.552179',0,'gc2004','Gaurav','Chavan','gc6781655@gmail.com',0,1,'2025-03-19 14:40:09.805894'),(3,'pbkdf2_sha256$720000$jv09e0gRiicYzESbfP9tt1$FLSbQ07QNlh/pNRSi1OEGRuAwcz3kZl6is6hTFKkcyI=','2025-03-19 14:45:21.432660',0,'Sahil_11','Sahil','Mestri','SahilMetri02@gmail.com',0,1,'2025-03-19 14:43:15.531430'),(5,'pbkdf2_sha256$720000$PdigguxsPkj6Bg5VWAwvAl$ygoQ+eYvo8NcJFHyy0gvGQZvdhyU4IqPZAy6/UL13p4=','2025-03-26 08:14:37.552823',0,'vc2006','Vaishali','chavan','vaishalichavan676@gmail.com',0,1,'2025-03-19 15:17:20.682440'),(6,'pbkdf2_sha256$720000$sQWWbayDnS4zBpXiBfCHtY$ARTerkXOX0PzflhwpGJo2PbsOau9riM/7yc+LxRoiU0=','2025-03-27 05:25:03.364274',0,'Suraj23#','harshawardhan ','gawade','harshawardhangawade@gmail.com',0,1,'2025-03-27 05:24:42.248481');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_car`
--

DROP TABLE IF EXISTS `core_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_car` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `make` varchar(20) NOT NULL,
  `model` varchar(100) NOT NULL,
  `registration_month` varchar(20) NOT NULL,
  `registration_year` int NOT NULL,
  `manufacture_year` int NOT NULL,
  `owner` int NOT NULL,
  `km_driven` int NOT NULL,
  `transmission_type` varchar(20) NOT NULL,
  `fuel_type` varchar(20) NOT NULL,
  `insurance_validity` varchar(100) DEFAULT NULL,
  `insurance_type` varchar(20) NOT NULL,
  `RTO` varchar(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `car_location` varchar(100) NOT NULL,
  `car_img` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_car`
--

LOCK TABLES `core_car` WRITE;
/*!40000 ALTER TABLE `core_car` DISABLE KEYS */;
INSERT INTO `core_car` VALUES (1,'Hyundai','Creta E PLUS 1.6 PETROL','April',2018,2018,2,74088,'Manual','Petrol','Sep2025','Third-Party','MH-03',696000.00,'Mumbai','title_car/creta_title.png','AVAILABLE'),(2,'Maruti','Ciaz VXI+','March',2016,2016,1,90753,'Manual','Petrol','May2025','Comprehensive','MH-03',400000.00,'Mumbai','title_car/ciaz_title.png','SOLD'),(3,'Maruti','Baleno ALPHA PETROL 1.2','Aug',2018,2018,1,16932,'Manual','Petrol','Aug 2025','Comprehensive','MH-05',564000.00,'Mumbai','title_car/beleno_title.png','AVAILABLE'),(4,'Maruti','Ertiga VXI CNG','June',2017,2017,1,51341,'Manual','CNG','May2025','Comprehensive','MH-05',712000.00,'sindhudurg','title_car/Ertiga_title.png','AVAILABLE'),(5,'Tata','NEXON XZA PLUS DIESEL DARK EDITION','May',2023,2023,1,16925,'Automatic','Diesel','May 2025','Comprehensive','MH-09',1037000.00,'Mumbai','title_car/Nexon_title.png','AVAILABLE'),(6,'Honda','City 1.5L I-VTEC ZX CVT','May',2017,2017,1,59984,'Automatic','Petrol','May2025','Comprehensive','MH-03',672000.00,'Mumbai','title_car/city_title.png','BOOKED'),(7,'Skoda','Rapid AMBITION 1.6 MPI MT','June',2017,2017,1,51159,'Manual','Petrol','June 2025','Third-Party','MH-05',440000.00,'Mumbai','title_car/Rapid_title.png','AVAILABLE'),(8,'Hyundai','Verna 1.6 VTVT SX O','May',2019,2019,2,98245,'Manual','Petrol','May2025','Comprehensive','MH-05',723000.00,'Mumbai','title_car/verna_title.png','AVAILABLE'),(9,'Toyota','URBAN CRUISER HIGH GRADE AT','Nov',2020,2020,1,29181,'Automatic','Petrol','Nov 2025','Comprehensive','MH-05',760000.00,'Mumbai','title_car/urban_title.png','AVAILABLE'),(10,'Toyota','Etios VX-D','Oct',2015,2015,2,57957,'Manual','Diesel','Oct 2025','Comprehensive','MH-09',466000.00,'sindhudurg','title_car/etios_title.png','AVAILABLE'),(11,'Mahindra','Thar LX D AT 4WD HT','Aug',2021,2021,1,14435,'Automatic','Diesel','Aug 2025','Comprehensive','MH-03',1377000.00,'sindhudurg','title_car/Thar_title.png','AVAILABLE'),(12,'Mahindra','XUV300 W6 1.2 PETROL','Oct',2020,2020,1,31522,'Manual','Petrol','Oct 2025','Comprehensive','MH-03',724000.00,'Mumbai','title_car/XUV300_title.png','AVAILABLE'),(13,'Tata','PUNCH ACCOMPLISHED DAZZLE','Sep',2023,2023,1,17159,'Manual','CNG','Sep 2025','Comprehensive','mh-07',853000.00,'Mumbai','title_car/punch_title.png','AVAILABLE'),(14,'Hyundai','NEW SANTRO SPORTZ CNG','March',2019,2019,1,74267,'Manual','CNG','March 2026','Comprehensive','mh-07',365000.00,'Mumbai','title_car/santro_title.png','AVAILABLE'),(15,'Tata','TIAGO NRG XT ICNG','Jan',2023,2022,1,46518,'Manual','CNG','Jan 2026','Comprehensive','mh-46',568000.00,'Mumbai','title_car/tiagoNRG_title.png','AVAILABLE'),(16,'Honda','Amaze 1.2L I-VTEC VX','March',2022,2022,1,20841,'Manual','Petrol','March 2026','Comprehensive','MH-09',733000.00,'Mumbai','title_car/Amaze_title.png','AVAILABLE'),(17,'Tata','TIGOR XZ PLUS CNG','Nov',2022,2022,1,28039,'Manual','CNG','March 2026','Comprehensive','mh-02',679000.00,'sindhudurg','title_car/tigor_title.png','AVAILABLE'),(18,'Kia','SELTOS GTX PLUS AT 1.5 DIESEL','Aug',2021,2021,1,74489,'Automatic','Diesel','Need Renewal','No Insurance','MH-02',1390000.00,'Mumbai','title_car/seltos_title.png','AVAILABLE'),(19,'Kia','SONET GTX PLUS 1.0 DCT','Nov',2020,2020,1,14049,'Automatic','Petrol','Need Renewal','No Insurance','MH-09',960000.00,'Mumbai','title_car/sonet_title.png','AVAILABLE'),(20,'Renault','TRIBER RXL AMT','April',2021,2021,1,61069,'Automatic','Petrol','Need Renewal','No Insurance','mh-02',451000.00,'Mumbai','title_car/triber_title.png','AVAILABLE'),(21,'Volkswagen','TAIGUN HIGHLINE 1.0 TSI AT','March',2022,2022,1,53673,'Automatic','Petrol','Need Renewal','No Insurance','MH-03',985000.00,'sindhudurg','title_car/taigun_title.png','AVAILABLE'),(22,'Volkswagen','Ameo HIGHLINE1.5L','April',2017,2017,1,86892,'Manual','Diesel','Need Renewal','No Insurance','MH-03',388000.00,'sindhudurg','title_car/ameo_title.png','AVAILABLE'),(23,'Nissan','MAGNITE XV PREMIUM TURBO CVT','Jan',2021,2021,1,17529,'Automatic','Petrol','Need Renewal','No Insurance','mh-46',708000.00,'sindhudurg','title_car/magnite_title.png','AVAILABLE'),(24,'Ford','FREESTYLE TITANIUM 1.2','Jan',2019,2018,2,56235,'Manual','Petrol','Need Renewal','No Insurance','mh-02',417500.00,'sindhudurg','title_car/freestyle_title.png','AVAILABLE'),(25,'Jeep','Compass LIMITED 2.0 4X4','March',2019,2018,1,70440,'Manual','Diesel','Need Renewal','No Insurance','MH-03',966000.00,'sindhudurg','title_car/compass_title.png','AVAILABLE'),(26,'Tata','SELTOS HTK PLUS 1.5 IMT','Jan',2015,2014,1,20000,'Manual','Petrol','May2025','Comprehensive','mh-07',200000.00,'sindhudurg','title_car/2-Right-Front-Diagonal.png','AVAILABLE');
/*!40000 ALTER TABLE `core_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_carimage`
--

DROP TABLE IF EXISTS `core_carimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_carimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `car_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_carimage_car_id_980997b9_fk_core_car_id` (`car_id`),
  CONSTRAINT `core_carimage_car_id_980997b9_fk_core_car_id` FOREIGN KEY (`car_id`) REFERENCES `core_car` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_carimage`
--

LOCK TABLES `core_carimage` WRITE;
/*!40000 ALTER TABLE `core_carimage` DISABLE KEYS */;
INSERT INTO `core_carimage` VALUES (1,'cars/create_1.png','',1),(2,'cars/creta_2.png','',1),(3,'cars/creta_3.png','',1),(4,'cars/creta_4.png','',1),(5,'cars/creta_5.png','',1),(6,'cars/creta_6.png','',1),(7,'cars/creta_7.png','',1),(8,'cars/creta_8.png','',1),(9,'cars/creta_9.png','',1),(10,'cars/creta_10.png','',1),(11,'cars/creta_11.png','',1),(12,'cars/ciaz_1.png','',2),(13,'cars/ciaz_2.png','',2),(14,'cars/ciaz_3.png','',2),(15,'cars/ciaz_4.png','',2),(16,'cars/ciaz_5.png','',2),(17,'cars/ciaz_6.png','',2),(18,'cars/ciaz_7.png','',2),(19,'cars/ciaz_8.png','',2),(20,'cars/ciaz_9.png','',2),(21,'cars/ciaz_10.png','',2),(22,'cars/ciaz_11.png','',2),(23,'cars/baleno_1.png','',3),(24,'cars/baleno_2.png','',3),(25,'cars/baleno_3.png','',3),(26,'cars/baleno_4.png','',3),(27,'cars/baleno_5.png','',3),(28,'cars/baleno_6.png','',3),(29,'cars/baleno_7.png','',3),(30,'cars/baleno_8.png','',3),(31,'cars/baleno_9.png','',3),(32,'cars/baleno_10.png','',3),(33,'cars/baleno_11.png','',3),(34,'cars/Ertiga_1.png','',4),(35,'cars/Ertiga_2.png','',4),(36,'cars/Ertiga_3.png','',4),(37,'cars/Ertiga_4.png','',4),(38,'cars/Ertiga_5.png','',4),(39,'cars/Ertiga_6.png','',4),(40,'cars/Ertiga_7.png','',4),(41,'cars/Ertiga_8.png','',4),(42,'cars/Ertiga_9.png','',4),(43,'cars/Ertiga_10.png','',4),(44,'cars/Ertiga_11.png','',4),(45,'cars/Nexon_1.png','',5),(46,'cars/Nexon_2.png','',5),(47,'cars/Nexon_3.png','',5),(48,'cars/Nexon_4.png','',5),(49,'cars/Nexon_5.png','',5),(50,'cars/Nexon_6.png','',5),(51,'cars/Nexon_7.png','',5),(52,'cars/Nexon_8.png','',5),(53,'cars/Nexon_9.png','',5),(54,'cars/Nexon_10.png','',5),(55,'cars/Nexon_11.png','',5),(56,'cars/city_1.png','',6),(57,'cars/city_2.png','',6),(58,'cars/city_3.png','',6),(59,'cars/city_4.png','',6),(60,'cars/city_5.png','',6),(61,'cars/city_6.png','',6),(62,'cars/city_7.png','',6),(63,'cars/city_8.png','',6),(64,'cars/city_9.png','',6),(65,'cars/city_10.png','',6),(66,'cars/city_11.png','',6),(67,'cars/Rapid_1.png','',7),(68,'cars/Rapid_2.png','',7),(69,'cars/Rapid_3.png','',7),(70,'cars/Rapid_4.png','',7),(71,'cars/Rapid_5.png','',7),(72,'cars/Rapid_6.png','',7),(73,'cars/Rapid_7.png','',7),(74,'cars/Rapid_8.png','',7),(75,'cars/Rapid_9.png','',7),(76,'cars/Rapid_10.png','',7),(77,'cars/Rapid_11.png','',7),(78,'cars/verna_1.png','',8),(79,'cars/verna_2.png','',8),(80,'cars/verna_3.png','',8),(81,'cars/verna_4.png','',8),(82,'cars/verna_5.png','',8),(83,'cars/verna_6.png','',8),(84,'cars/verna_7.png','',8),(85,'cars/verna_8.png','',8),(86,'cars/verna_9.png','',8),(87,'cars/verna_10.png','',8),(88,'cars/verna_11.png','',8),(89,'cars/urban_1.png','',9),(90,'cars/urban_2.png','',9),(91,'cars/urban_3.png','',9),(92,'cars/urban_4.png','',9),(93,'cars/urban_5.png','',9),(94,'cars/urban_6.png','',9),(95,'cars/urban_7.png','',9),(96,'cars/urban_8.png','',9),(97,'cars/urban_9.png','',9),(98,'cars/urban_10.png','',9),(99,'cars/urban_11.png','',9),(100,'cars/etios_1.png','',10),(101,'cars/etios_2.png','',10),(102,'cars/etios_3.png','',10),(103,'cars/etios_4.png','',10),(104,'cars/etios_5.png','',10),(105,'cars/etios_6.png','',10),(106,'cars/etios_7.png','',10),(107,'cars/etios_8.png','',10),(108,'cars/etios_9.png','',10),(109,'cars/etios_10.png','',10),(110,'cars/etios_11.png','',10),(111,'cars/Thar_1.png','',11),(112,'cars/Thar_2.png','',11),(113,'cars/Thar_3.png','',11),(114,'cars/Thar_4.png','',11),(115,'cars/Thar_5.png','',11),(116,'cars/Thar_6.png','',11),(117,'cars/Thar_7.png','',11),(118,'cars/Thar_8.png','',11),(119,'cars/Thar_9.png','',11),(120,'cars/Thar_10.png','',11),(121,'cars/Thar_11.png','',11),(122,'cars/XUV300_1.png','',12),(123,'cars/XUV300_2.png','',12),(124,'cars/XUV300_3.png','',12),(125,'cars/XUV300_4.png','',12),(126,'cars/XUV300_5.png','',12),(127,'cars/XUV300_6.png','',12),(128,'cars/XUV300_7.png','',12),(129,'cars/XUV300_8.png','',12),(130,'cars/XUV300_9.png','',12),(131,'cars/XUV300_10.png','',12),(132,'cars/XUV300_11.png','',12),(133,'cars/punch_1.png','',13),(134,'cars/punch_2.png','',13),(135,'cars/punch_3.png','',13),(136,'cars/punch_4.png','',13),(137,'cars/punch_5.png','',13),(138,'cars/punch_6.png','',13),(139,'cars/punch_7.png','',13),(140,'cars/punch_8.png','',13),(141,'cars/punch_9.png','',13),(142,'cars/punch_10.png','',13),(143,'cars/punch_11.png','',13),(144,'cars/santro_1.png','',14),(145,'cars/santro_2.png','',14),(146,'cars/santro_3.png','',14),(147,'cars/santro_4.png','',14),(148,'cars/santro_5.png','',14),(149,'cars/santro_6.png','',14),(150,'cars/santro_7.png','',14),(151,'cars/santro_8.png','',14),(152,'cars/santro_9.png','',14),(153,'cars/santro_10.png','',14),(154,'cars/santro_11.png','',14),(155,'cars/tiagoNRG_1.png','',15),(156,'cars/tiagoNRG_.png','',15),(157,'cars/tiagoNRG_3.png','',15),(158,'cars/tiagoNRG_4.png','',15),(159,'cars/tiagoNRG_5.png','',15),(160,'cars/tiagoNRG_6.png','',15),(161,'cars/tiagoNRG_7.png','',15),(162,'cars/tiagoNRG_8.png','',15),(163,'cars/tiagoNRG_9.png','',15),(164,'cars/tiagoNRG_10.png','',15),(165,'cars/tiagoNRG_11.png','',15),(166,'cars/Amaze_1.png','',16),(167,'cars/Amaze_2.png','',16),(168,'cars/Amaze_3.png','',16),(169,'cars/Amaze_4.png','',16),(170,'cars/Amaze_5.png','',16),(171,'cars/Amaze_6.png','',16),(172,'cars/Amaze_7.png','',16),(173,'cars/Amaze_8.png','',16),(174,'cars/Amaze_9.png','',16),(175,'cars/Amaze_10.png','',16),(176,'cars/Amaze_11.png','',16),(177,'cars/tigor_1.png','',17),(178,'cars/tigor_2.png','',17),(179,'cars/tigor_4.png','',17),(180,'cars/tigor_3.png','',17),(181,'cars/tigor_5.png','',17),(182,'cars/tigor_6.png','',17),(183,'cars/tigor_7.png','',17),(184,'cars/tigor_8.png','',17),(185,'cars/tigor_9.png','',17),(186,'cars/tigor_10.png','',17),(187,'cars/tigor_11.png','',17),(188,'cars/seltos_1.png','',18),(189,'cars/seltos_2.png','',18),(190,'cars/seltos_3.png','',18),(191,'cars/seltos_4.png','',18),(192,'cars/seltos_5.png','',18),(193,'cars/seltos_6.png','',18),(194,'cars/seltos_7.png','',18),(195,'cars/seltos_8.png','',18),(196,'cars/seltos_9.png','',18),(197,'cars/seltos_10.png','',18),(198,'cars/seltos_11.png','',18),(199,'cars/sonet_1.png','',19),(200,'cars/sonet_2.png','',19),(201,'cars/sonet_3.png','',19),(202,'cars/sonet_4.png','',19),(203,'cars/sonet_5.png','',19),(204,'cars/sonet_6.png','',19),(205,'cars/sonet_7.png','',19),(206,'cars/sonet_8.png','',19),(207,'cars/sonet_9.png','',19),(208,'cars/sonet_10.png','',19),(209,'cars/sonet_11.png','',19),(210,'cars/triber_1.png','',20),(211,'cars/triber_2.png','',20),(212,'cars/triber_3.png','',20),(213,'cars/triber_4.png','',20),(214,'cars/triber_5.png','',20),(215,'cars/triber_6.png','',20),(216,'cars/triber_7.png','',20),(217,'cars/triber_8.png','',20),(218,'cars/triber_9.png','',20),(219,'cars/triber_10.png','',20),(220,'cars/triber_11.png','',20),(221,'cars/taigun_1.png','',21),(222,'cars/taigun_2.png','',21),(223,'cars/taigun_3.png','',21),(224,'cars/taigun_4.png','',21),(225,'cars/taigun_5.png','',21),(226,'cars/taigun_6.png','',21),(227,'cars/taigun_7.png','',21),(228,'cars/taigun_8.png','',21),(229,'cars/taigun_9.png','',21),(230,'cars/taigun_10.png','',21),(231,'cars/taigun_11.png','',21),(232,'cars/ameo_1.png','',22),(233,'cars/ameo_2.png','',22),(234,'cars/ameo_3.png','',22),(235,'cars/ameo_4.png','',22),(236,'cars/ameo_5.png','',22),(237,'cars/ameo_6.png','',22),(238,'cars/ameo_7.png','',22),(239,'cars/ameo_8.png','',22),(240,'cars/ameo_9.png','',22),(241,'cars/ameo_10.png','',22),(242,'cars/ameo_11.png','',22),(243,'cars/magnite_1.png','',23),(244,'cars/magnite_2.png','',23),(245,'cars/magnite_3.png','',23),(246,'cars/magnite_4.png','',23),(247,'cars/magnite_5.png','',23),(248,'cars/magnite_6.png','',23),(249,'cars/magnite_7.png','',23),(250,'cars/magnite_8.png','',23),(251,'cars/magnite_9.png','',23),(252,'cars/magnite_10.png','',23),(253,'cars/magnite_11.png','',23),(254,'cars/freestyle_1.png','',24),(255,'cars/freestyle_2.png','',24),(256,'cars/freestyle_3.png','',24),(257,'cars/freestyle_4.png','',24),(258,'cars/freestyle_5.png','',24),(259,'cars/freestyle_6.png','',24),(260,'cars/freestyle_7.png','',24),(261,'cars/freestyle_8.png','',24),(262,'cars/freestyle_9.png','',24),(263,'cars/freestyle_10.png','',24),(264,'cars/freestyle_11.png','',24),(265,'cars/compass_1.png','',25),(266,'cars/compass_2.png','',25),(267,'cars/compass_3.png','',25),(268,'cars/compass_4.png','',25),(269,'cars/compass_5.png','',25),(270,'cars/compass_6.png','',25),(271,'cars/compass_7.png','',25),(272,'cars/compass_8.png','',25),(273,'cars/compass_9.png','',25),(274,'cars/compass_10.png','',25),(275,'cars/compass_11.png','',25),(276,'cars/swift.png','',26),(277,'cars/swift1.png','',26);
/*!40000 ALTER TABLE `core_carimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_carsubmission`
--

DROP TABLE IF EXISTS `core_carsubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_carsubmission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `make` varchar(50) NOT NULL,
  `model` varchar(100) NOT NULL,
  `registration_year` int NOT NULL,
  `fuel_type` varchar(20) NOT NULL,
  `price` int NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `kilometers_driven` varchar(20) NOT NULL,
  `transmission_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_carsubmission_user_id_f999c774_fk_auth_user_id` (`user_id`),
  CONSTRAINT `core_carsubmission_user_id_f999c774_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_carsubmission`
--

LOCK TABLES `core_carsubmission` WRITE;
/*!40000 ALTER TABLE `core_carsubmission` DISABLE KEYS */;
INSERT INTO `core_carsubmission` VALUES (1,'Maruti','Swift Dzire VXI',2015,'Petrol',350000,'Good Condition','car_submissions/Dzire_title.png','APPROVED','2025-03-19 15:33:45.600030',5,'43581','Manual');
/*!40000 ALTER TABLE `core_carsubmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_testdrivebooking`
--

DROP TABLE IF EXISTS `core_testdrivebooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_testdrivebooking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `car_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_testdrivebooking_car_id_32c10fa1_fk_core_car_id` (`car_id`),
  KEY `core_testdrivebooking_user_id_17fa5322_fk_auth_user_id` (`user_id`),
  CONSTRAINT `core_testdrivebooking_car_id_32c10fa1_fk_core_car_id` FOREIGN KEY (`car_id`) REFERENCES `core_car` (`id`),
  CONSTRAINT `core_testdrivebooking_user_id_17fa5322_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_testdrivebooking`
--

LOCK TABLES `core_testdrivebooking` WRITE;
/*!40000 ALTER TABLE `core_testdrivebooking` DISABLE KEYS */;
INSERT INTO `core_testdrivebooking` VALUES (2,'2025-03-20','11 AM - 12 PM','PENDING','2025-03-19 15:36:28.386264',2,5),(4,'2025-03-22','11 AM - 12 PM','PENDING','2025-03-20 03:47:16.985161',3,2),(5,'2025-03-28','10 AM - 11 AM','PENDING','2025-03-26 08:15:38.401202',1,5),(6,'2025-03-28','11 AM - 12 PM','PENDING','2025-03-27 05:25:57.767044',11,6),(19,'2025-03-31','10 AM - 11 AM','PENDING','2025-03-30 16:42:14.426277',3,2),(20,'2025-04-01','11 AM - 12 PM','PENDING','2025-03-30 16:43:03.606783',3,2),(21,'2025-04-19','11 AM - 12 PM','PENDING','2025-04-17 14:57:59.455674',9,2),(27,'2025-04-20','2 PM - 3 PM','PENDING','2025-04-17 15:37:09.975959',5,2),(28,'2025-04-22','10 AM - 11 AM','PENDING','2025-04-21 06:41:29.125931',1,2),(29,'2025-04-25','10 AM - 11 AM','PENDING','2025-04-25 15:04:44.595818',1,2),(30,'2025-04-28','11 AM - 12 PM','PENDING','2025-04-25 15:05:35.654592',3,2),(31,'2025-04-26','10 AM - 11 AM','PENDING','2025-04-25 15:14:41.570497',1,2),(32,'2025-04-25','10 AM - 11 AM','PENDING','2025-04-25 15:18:28.163930',1,2),(33,'2025-04-26','10 AM - 11 AM','PENDING','2025-04-25 15:20:10.909216',1,2),(34,'2025-04-26','10 AM - 11 AM','PENDING','2025-04-25 15:20:32.068148',1,2),(35,'2025-04-26','11 AM - 12 PM','PENDING','2025-04-25 15:21:21.245989',1,2),(36,'2025-04-26','10 AM - 11 AM','PENDING','2025-04-25 15:22:20.241233',1,2),(37,'2025-04-26','10 AM - 11 AM','PENDING','2025-04-25 15:54:39.166559',1,2),(38,'2025-04-26','10 AM - 11 AM','PENDING','2025-04-25 15:54:40.944669',1,2),(39,'2025-04-26','10 AM - 11 AM','PENDING','2025-04-25 15:54:41.459758',1,2),(40,'2025-04-26','10 AM - 11 AM','PENDING','2025-04-25 15:54:41.622528',1,2),(41,'2025-04-26','10 AM - 11 AM','PENDING','2025-04-25 15:54:46.105713',1,2),(42,'2025-04-26','10 AM - 11 AM','PENDING','2025-04-25 15:54:47.897801',1,2),(43,'2025-04-26','10 AM - 11 AM','PENDING','2025-04-25 15:54:48.120012',1,2),(44,'2025-04-25','10 AM - 11 AM','PENDING','2025-04-25 15:55:13.395937',1,2),(45,'2025-04-25','10 AM - 11 AM','PENDING','2025-04-25 15:55:14.184439',1,2),(46,'2025-04-25','10 AM - 11 AM','PENDING','2025-04-25 15:55:14.411118',1,2),(47,'2025-04-25','10 AM - 11 AM','PENDING','2025-04-25 15:55:15.050948',1,2),(48,'2025-04-25','10 AM - 11 AM','PENDING','2025-04-25 15:55:15.285938',1,2),(49,'2025-08-11','11 AM - 12 PM','PENDING','2025-08-10 07:29:59.224966',18,2),(50,'2025-12-04','10 AM - 11 AM','PENDING','2025-12-02 18:39:55.850689',14,2),(52,'2026-04-23','11 AM - 12 PM','PENDING','2026-04-21 15:17:01.862084',1,2);
/*!40000 ALTER TABLE `core_testdrivebooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-03-18 15:42:06.361894','1','Hyundai Creta E PLUS 1.6 PETROL (2018)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Creta E PLUS 1.6 PETROL (1)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Creta E PLUS 1.6 PETROL (2)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Creta E PLUS 1.6 PETROL (3)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Creta E PLUS 1.6 PETROL (4)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Creta E PLUS 1.6 PETROL (5)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Creta E PLUS 1.6 PETROL (6)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Creta E PLUS 1.6 PETROL (7)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Creta E PLUS 1.6 PETROL (8)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Creta E PLUS 1.6 PETROL (9)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Creta E PLUS 1.6 PETROL (10)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Creta E PLUS 1.6 PETROL (11)\"}}]',7,1),(2,'2025-03-18 15:53:30.721284','2','Maruti Ciaz VXI+ (2016)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ciaz VXI+ (12)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ciaz VXI+ (13)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ciaz VXI+ (14)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ciaz VXI+ (15)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ciaz VXI+ (16)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ciaz VXI+ (17)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ciaz VXI+ (18)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ciaz VXI+ (19)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ciaz VXI+ (20)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ciaz VXI+ (21)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ciaz VXI+ (22)\"}}]',7,1),(3,'2025-03-18 16:55:37.981332','3','Maruti Baleno ALPHA PETROL 1.2 (2018)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Baleno ALPHA PETROL 1.2 (23)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Baleno ALPHA PETROL 1.2 (24)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Baleno ALPHA PETROL 1.2 (25)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Baleno ALPHA PETROL 1.2 (26)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Baleno ALPHA PETROL 1.2 (27)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Baleno ALPHA PETROL 1.2 (28)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Baleno ALPHA PETROL 1.2 (29)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Baleno ALPHA PETROL 1.2 (30)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Baleno ALPHA PETROL 1.2 (31)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Baleno ALPHA PETROL 1.2 (32)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Baleno ALPHA PETROL 1.2 (33)\"}}]',7,1),(4,'2025-03-18 17:07:51.278532','4','Maruti Ertiga VXI CNG (2017)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ertiga VXI CNG (34)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ertiga VXI CNG (35)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ertiga VXI CNG (36)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ertiga VXI CNG (37)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ertiga VXI CNG (38)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ertiga VXI CNG (39)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ertiga VXI CNG (40)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ertiga VXI CNG (41)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ertiga VXI CNG (42)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ertiga VXI CNG (43)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Maruti Ertiga VXI CNG (44)\"}}]',7,1),(5,'2025-03-18 17:19:26.125883','5','Tata NEXON XZA PLUS DIESEL DARK EDITION (2023)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata NEXON XZA PLUS DIESEL DARK EDITION (45)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata NEXON XZA PLUS DIESEL DARK EDITION (46)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata NEXON XZA PLUS DIESEL DARK EDITION (47)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata NEXON XZA PLUS DIESEL DARK EDITION (48)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata NEXON XZA PLUS DIESEL DARK EDITION (49)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata NEXON XZA PLUS DIESEL DARK EDITION (50)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata NEXON XZA PLUS DIESEL DARK EDITION (51)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata NEXON XZA PLUS DIESEL DARK EDITION (52)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata NEXON XZA PLUS DIESEL DARK EDITION (53)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata NEXON XZA PLUS DIESEL DARK EDITION (54)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata NEXON XZA PLUS DIESEL DARK EDITION (55)\"}}]',7,1),(6,'2025-03-18 17:31:46.277087','6','Honda City 1.5L I-VTEC ZX CVT (2017)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda City 1.5L I-VTEC ZX CVT (56)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda City 1.5L I-VTEC ZX CVT (57)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda City 1.5L I-VTEC ZX CVT (58)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda City 1.5L I-VTEC ZX CVT (59)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda City 1.5L I-VTEC ZX CVT (60)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda City 1.5L I-VTEC ZX CVT (61)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda City 1.5L I-VTEC ZX CVT (62)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda City 1.5L I-VTEC ZX CVT (63)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda City 1.5L I-VTEC ZX CVT (64)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda City 1.5L I-VTEC ZX CVT (65)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda City 1.5L I-VTEC ZX CVT (66)\"}}]',7,1),(7,'2025-03-18 17:41:25.045376','7','Skoda Rapid AMBITION 1.6 MPI MT (2017)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Skoda Rapid AMBITION 1.6 MPI MT (67)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Skoda Rapid AMBITION 1.6 MPI MT (68)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Skoda Rapid AMBITION 1.6 MPI MT (69)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Skoda Rapid AMBITION 1.6 MPI MT (70)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Skoda Rapid AMBITION 1.6 MPI MT (71)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Skoda Rapid AMBITION 1.6 MPI MT (72)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Skoda Rapid AMBITION 1.6 MPI MT (73)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Skoda Rapid AMBITION 1.6 MPI MT (74)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Skoda Rapid AMBITION 1.6 MPI MT (75)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Skoda Rapid AMBITION 1.6 MPI MT (76)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Skoda Rapid AMBITION 1.6 MPI MT (77)\"}}]',7,1),(8,'2025-03-19 14:47:43.915318','2','gc2004',2,'[{\"changed\": {\"fields\": [\"Mobile number\"]}}]',11,1),(9,'2025-03-19 15:16:38.127837','4','vc2006',3,'',4,1),(10,'2025-03-19 15:19:23.220973','6','Honda City 1.5L I-VTEC ZX CVT (2017)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(11,'2025-03-19 15:51:25.603863','2','Maruti Ciaz VXI+ (2016)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',7,1),(12,'2025-03-24 15:19:24.294226','8','Hyundai Verna 1.6 VTVT SX O (2019)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Verna 1.6 VTVT SX O (78)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Verna 1.6 VTVT SX O (79)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Verna 1.6 VTVT SX O (80)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Verna 1.6 VTVT SX O (81)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Verna 1.6 VTVT SX O (82)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Verna 1.6 VTVT SX O (83)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Verna 1.6 VTVT SX O (84)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Verna 1.6 VTVT SX O (85)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Verna 1.6 VTVT SX O (86)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Verna 1.6 VTVT SX O (87)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai Verna 1.6 VTVT SX O (88)\"}}]',7,1),(13,'2025-03-24 15:28:14.422861','9','Toyoto URBAN CRUISER HIGH GRADE AT (2020)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto URBAN CRUISER HIGH GRADE AT (89)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto URBAN CRUISER HIGH GRADE AT (90)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto URBAN CRUISER HIGH GRADE AT (91)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto URBAN CRUISER HIGH GRADE AT (92)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto URBAN CRUISER HIGH GRADE AT (93)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto URBAN CRUISER HIGH GRADE AT (94)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto URBAN CRUISER HIGH GRADE AT (95)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto URBAN CRUISER HIGH GRADE AT (96)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto URBAN CRUISER HIGH GRADE AT (97)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto URBAN CRUISER HIGH GRADE AT (98)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto URBAN CRUISER HIGH GRADE AT (99)\"}}]',7,1),(14,'2025-03-24 15:36:38.666013','10','Toyoto Etios VX-D (2015)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto Etios VX-D (100)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto Etios VX-D (101)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto Etios VX-D (102)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto Etios VX-D (103)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto Etios VX-D (104)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto Etios VX-D (105)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto Etios VX-D (106)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto Etios VX-D (107)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto Etios VX-D (108)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto Etios VX-D (109)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Toyoto Etios VX-D (110)\"}}]',7,1),(15,'2025-03-24 16:27:45.435562','11','Mahindra Thar LX D AT 4WD HT (2021)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra Thar LX D AT 4WD HT (111)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra Thar LX D AT 4WD HT (112)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra Thar LX D AT 4WD HT (113)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra Thar LX D AT 4WD HT (114)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra Thar LX D AT 4WD HT (115)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra Thar LX D AT 4WD HT (116)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra Thar LX D AT 4WD HT (117)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra Thar LX D AT 4WD HT (118)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra Thar LX D AT 4WD HT (119)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra Thar LX D AT 4WD HT (120)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra Thar LX D AT 4WD HT (121)\"}}]',7,1),(16,'2025-03-24 16:54:04.784150','12','Mahindra XUV300 W6 1.2 PETROL (2020)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra XUV300 W6 1.2 PETROL (122)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra XUV300 W6 1.2 PETROL (123)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra XUV300 W6 1.2 PETROL (124)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra XUV300 W6 1.2 PETROL (125)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra XUV300 W6 1.2 PETROL (126)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra XUV300 W6 1.2 PETROL (127)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra XUV300 W6 1.2 PETROL (128)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra XUV300 W6 1.2 PETROL (129)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra XUV300 W6 1.2 PETROL (130)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra XUV300 W6 1.2 PETROL (131)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Mahindra XUV300 W6 1.2 PETROL (132)\"}}]',7,1),(17,'2025-03-24 17:13:18.617231','13','Tata PUNCH ACCOMPLISHED DAZZLE SUNROOF (2023)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata PUNCH ACCOMPLISHED DAZZLE SUNROOF (133)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata PUNCH ACCOMPLISHED DAZZLE SUNROOF (134)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata PUNCH ACCOMPLISHED DAZZLE SUNROOF (135)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata PUNCH ACCOMPLISHED DAZZLE SUNROOF (136)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata PUNCH ACCOMPLISHED DAZZLE SUNROOF (137)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata PUNCH ACCOMPLISHED DAZZLE SUNROOF (138)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata PUNCH ACCOMPLISHED DAZZLE SUNROOF (139)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata PUNCH ACCOMPLISHED DAZZLE SUNROOF (140)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata PUNCH ACCOMPLISHED DAZZLE SUNROOF (141)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata PUNCH ACCOMPLISHED DAZZLE SUNROOF (142)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata PUNCH ACCOMPLISHED DAZZLE SUNROOF (143)\"}}]',7,1),(18,'2025-03-24 17:15:15.566968','13','Tata PUNCH ACCOMPLISHED DAZZLE (2023)',2,'[{\"changed\": {\"fields\": [\"Model\"]}}]',7,1),(19,'2025-03-24 17:28:34.578495','14','Hyundai NEW SANTRO SPORTZ CNG (2019)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai NEW SANTRO SPORTZ CNG (144)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai NEW SANTRO SPORTZ CNG (145)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai NEW SANTRO SPORTZ CNG (146)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai NEW SANTRO SPORTZ CNG (147)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai NEW SANTRO SPORTZ CNG (148)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai NEW SANTRO SPORTZ CNG (149)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai NEW SANTRO SPORTZ CNG (150)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai NEW SANTRO SPORTZ CNG (151)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai NEW SANTRO SPORTZ CNG (152)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai NEW SANTRO SPORTZ CNG (153)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Hyundai NEW SANTRO SPORTZ CNG (154)\"}}]',7,1),(20,'2025-03-25 14:45:34.910465','15','Tata TIAGO NRG XT ICNG (2023)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIAGO NRG XT ICNG (155)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIAGO NRG XT ICNG (156)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIAGO NRG XT ICNG (157)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIAGO NRG XT ICNG (158)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIAGO NRG XT ICNG (159)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIAGO NRG XT ICNG (160)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIAGO NRG XT ICNG (161)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIAGO NRG XT ICNG (162)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIAGO NRG XT ICNG (163)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIAGO NRG XT ICNG (164)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIAGO NRG XT ICNG (165)\"}}]',7,1),(21,'2025-03-25 16:05:12.289248','16','Honda Amaze 1.2L I-VTEC VX (2022)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda Amaze 1.2L I-VTEC VX (166)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda Amaze 1.2L I-VTEC VX (167)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda Amaze 1.2L I-VTEC VX (168)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda Amaze 1.2L I-VTEC VX (169)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda Amaze 1.2L I-VTEC VX (170)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda Amaze 1.2L I-VTEC VX (171)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda Amaze 1.2L I-VTEC VX (172)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda Amaze 1.2L I-VTEC VX (173)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda Amaze 1.2L I-VTEC VX (174)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda Amaze 1.2L I-VTEC VX (175)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Honda Amaze 1.2L I-VTEC VX (176)\"}}]',7,1),(22,'2025-03-26 06:22:49.380810','17','Tata TIGOR XZ PLUS CNG (2022)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIGOR XZ PLUS CNG (177)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIGOR XZ PLUS CNG (178)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIGOR XZ PLUS CNG (179)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIGOR XZ PLUS CNG (180)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIGOR XZ PLUS CNG (181)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIGOR XZ PLUS CNG (182)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIGOR XZ PLUS CNG (183)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIGOR XZ PLUS CNG (184)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIGOR XZ PLUS CNG (185)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIGOR XZ PLUS CNG (186)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata TIGOR XZ PLUS CNG (187)\"}}]',7,1),(23,'2025-03-26 07:24:47.918076','10','Toyota Etios VX-D (2015)',2,'[{\"changed\": {\"fields\": [\"Make\"]}}]',7,1),(24,'2025-03-26 07:25:07.483249','9','Toyota URBAN CRUISER HIGH GRADE AT (2020)',2,'[{\"changed\": {\"fields\": [\"Make\"]}}]',7,1),(25,'2025-03-26 07:28:12.151224','18','Kia SELTOS GTX PLUS AT 1.5 DIESEL (2021)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SELTOS GTX PLUS AT 1.5 DIESEL (188)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SELTOS GTX PLUS AT 1.5 DIESEL (189)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SELTOS GTX PLUS AT 1.5 DIESEL (190)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SELTOS GTX PLUS AT 1.5 DIESEL (191)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SELTOS GTX PLUS AT 1.5 DIESEL (192)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SELTOS GTX PLUS AT 1.5 DIESEL (193)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SELTOS GTX PLUS AT 1.5 DIESEL (194)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SELTOS GTX PLUS AT 1.5 DIESEL (195)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SELTOS GTX PLUS AT 1.5 DIESEL (196)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SELTOS GTX PLUS AT 1.5 DIESEL (197)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SELTOS GTX PLUS AT 1.5 DIESEL (198)\"}}]',7,1),(26,'2025-03-26 07:29:20.016875','18','Kia SELTOS GTX PLUS AT 1.5 DIESEL (2021)',2,'[{\"changed\": {\"fields\": [\"RTO\"]}}]',7,1),(27,'2025-03-26 07:48:35.779155','19','Kia SONET GTX PLUS 1.0 DCT (2020)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SONET GTX PLUS 1.0 DCT (199)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SONET GTX PLUS 1.0 DCT (200)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SONET GTX PLUS 1.0 DCT (201)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SONET GTX PLUS 1.0 DCT (202)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SONET GTX PLUS 1.0 DCT (203)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SONET GTX PLUS 1.0 DCT (204)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SONET GTX PLUS 1.0 DCT (205)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SONET GTX PLUS 1.0 DCT (206)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SONET GTX PLUS 1.0 DCT (207)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SONET GTX PLUS 1.0 DCT (208)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Kia SONET GTX PLUS 1.0 DCT (209)\"}}]',7,1),(28,'2025-03-26 15:37:05.644605','20','Renault TRIBER RXL AMT (2021)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Renault TRIBER RXL AMT (210)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Renault TRIBER RXL AMT (211)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Renault TRIBER RXL AMT (212)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Renault TRIBER RXL AMT (213)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Renault TRIBER RXL AMT (214)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Renault TRIBER RXL AMT (215)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Renault TRIBER RXL AMT (216)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Renault TRIBER RXL AMT (217)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Renault TRIBER RXL AMT (218)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Renault TRIBER RXL AMT (219)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Renault TRIBER RXL AMT (220)\"}}]',7,1),(29,'2025-03-27 05:03:24.645927','21','Volkswagen TAIGUN HIGHLINE 1.0 TSI AT (2022)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen TAIGUN HIGHLINE 1.0 TSI AT (221)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen TAIGUN HIGHLINE 1.0 TSI AT (222)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen TAIGUN HIGHLINE 1.0 TSI AT (223)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen TAIGUN HIGHLINE 1.0 TSI AT (224)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen TAIGUN HIGHLINE 1.0 TSI AT (225)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen TAIGUN HIGHLINE 1.0 TSI AT (226)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen TAIGUN HIGHLINE 1.0 TSI AT (227)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen TAIGUN HIGHLINE 1.0 TSI AT (228)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen TAIGUN HIGHLINE 1.0 TSI AT (229)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen TAIGUN HIGHLINE 1.0 TSI AT (230)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen TAIGUN HIGHLINE 1.0 TSI AT (231)\"}}]',7,1),(30,'2025-03-27 05:32:10.183155','22','Volkswagen Ameo HIGHLINE1.5L (2017)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen Ameo HIGHLINE1.5L (232)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen Ameo HIGHLINE1.5L (233)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen Ameo HIGHLINE1.5L (234)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen Ameo HIGHLINE1.5L (235)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen Ameo HIGHLINE1.5L (236)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen Ameo HIGHLINE1.5L (237)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen Ameo HIGHLINE1.5L (238)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen Ameo HIGHLINE1.5L (239)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen Ameo HIGHLINE1.5L (240)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen Ameo HIGHLINE1.5L (241)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Volkswagen Ameo HIGHLINE1.5L (242)\"}}]',7,1),(31,'2025-03-27 15:11:50.551733','23','Nissan MAGNITE XV PREMIUM TURBO CVT (2021)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Nissan MAGNITE XV PREMIUM TURBO CVT (243)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Nissan MAGNITE XV PREMIUM TURBO CVT (244)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Nissan MAGNITE XV PREMIUM TURBO CVT (245)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Nissan MAGNITE XV PREMIUM TURBO CVT (246)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Nissan MAGNITE XV PREMIUM TURBO CVT (247)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Nissan MAGNITE XV PREMIUM TURBO CVT (248)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Nissan MAGNITE XV PREMIUM TURBO CVT (249)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Nissan MAGNITE XV PREMIUM TURBO CVT (250)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Nissan MAGNITE XV PREMIUM TURBO CVT (251)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Nissan MAGNITE XV PREMIUM TURBO CVT (252)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Nissan MAGNITE XV PREMIUM TURBO CVT (253)\"}}]',7,1),(32,'2025-03-27 15:52:02.812657','24','Ford FREESTYLE TITANIUM 1.2 (2019)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Ford FREESTYLE TITANIUM 1.2 (254)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Ford FREESTYLE TITANIUM 1.2 (255)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Ford FREESTYLE TITANIUM 1.2 (256)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Ford FREESTYLE TITANIUM 1.2 (257)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Ford FREESTYLE TITANIUM 1.2 (258)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Ford FREESTYLE TITANIUM 1.2 (259)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Ford FREESTYLE TITANIUM 1.2 (260)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Ford FREESTYLE TITANIUM 1.2 (261)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Ford FREESTYLE TITANIUM 1.2 (262)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Ford FREESTYLE TITANIUM 1.2 (263)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Ford FREESTYLE TITANIUM 1.2 (264)\"}}]',7,1),(33,'2025-03-27 17:25:30.175661','25','Jeep Compass LIMITED 2.0 4X4 (2019)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Jeep Compass LIMITED 2.0 4X4 (265)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Jeep Compass LIMITED 2.0 4X4 (266)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Jeep Compass LIMITED 2.0 4X4 (267)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Jeep Compass LIMITED 2.0 4X4 (268)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Jeep Compass LIMITED 2.0 4X4 (269)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Jeep Compass LIMITED 2.0 4X4 (270)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Jeep Compass LIMITED 2.0 4X4 (271)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Jeep Compass LIMITED 2.0 4X4 (272)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Jeep Compass LIMITED 2.0 4X4 (273)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Jeep Compass LIMITED 2.0 4X4 (274)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Jeep Compass LIMITED 2.0 4X4 (275)\"}}]',7,1),(34,'2025-03-30 15:22:13.358693','6','Honda City 1.5L I-VTEC ZX CVT (2017)',2,'[]',7,1),(35,'2025-03-30 15:38:09.849563','1','Maruti Swift Dzire VXI - APPROVED',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',10,1),(36,'2025-04-21 06:52:35.590947','26','Tata SELTOS HTK PLUS 1.5 IMT (2015)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata SELTOS HTK PLUS 1.5 IMT (276)\"}}, {\"added\": {\"name\": \"car image\", \"object\": \"Image of Tata SELTOS HTK PLUS 1.5 IMT (277)\"}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'core','car'),(8,'core','carimage'),(10,'core','carsubmission'),(9,'core','testdrivebooking'),(6,'sessions','session'),(11,'users','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-03-18 15:25:27.923931'),(2,'auth','0001_initial','2025-03-18 15:25:28.977742'),(3,'admin','0001_initial','2025-03-18 15:25:29.246504'),(4,'admin','0002_logentry_remove_auto_add','2025-03-18 15:25:29.260813'),(5,'admin','0003_logentry_add_action_flag_choices','2025-03-18 15:25:29.276454'),(6,'contenttypes','0002_remove_content_type_name','2025-03-18 15:25:29.419842'),(7,'auth','0002_alter_permission_name_max_length','2025-03-18 15:25:29.539605'),(8,'auth','0003_alter_user_email_max_length','2025-03-18 15:25:29.580267'),(9,'auth','0004_alter_user_username_opts','2025-03-18 15:25:29.596468'),(10,'auth','0005_alter_user_last_login_null','2025-03-18 15:25:29.705874'),(11,'auth','0006_require_contenttypes_0002','2025-03-18 15:25:29.711873'),(12,'auth','0007_alter_validators_add_error_messages','2025-03-18 15:25:29.728769'),(13,'auth','0008_alter_user_username_max_length','2025-03-18 15:25:29.856633'),(14,'auth','0009_alter_user_last_name_max_length','2025-03-18 15:25:29.984226'),(15,'auth','0010_alter_group_name_max_length','2025-03-18 15:25:30.017515'),(16,'auth','0011_update_proxy_permissions','2025-03-18 15:25:30.033187'),(17,'auth','0012_alter_user_first_name_max_length','2025-03-18 15:25:30.150436'),(18,'core','0001_initial','2025-03-18 15:25:30.319554'),(19,'core','0002_alter_car_car_img_testdrivebooking','2025-03-18 15:25:30.583635'),(20,'core','0003_alter_testdrivebooking_options','2025-03-18 15:25:30.597849'),(21,'core','0004_alter_testdrivebooking_options_alter_car_make_and_more','2025-03-18 15:25:30.780487'),(22,'core','0005_alter_car_status','2025-03-18 15:25:30.790041'),(23,'core','0006_carsubmission_kilometers_driven_and_more','2025-03-18 15:25:30.898043'),(24,'sessions','0001_initial','2025-03-18 15:25:30.960674'),(25,'users','0001_initial','2025-03-18 15:25:31.151243'),(26,'users','0002_alter_userprofile_mobile_number','2025-03-18 15:25:31.270771'),(27,'core','0007_alter_car_fuel_type_alter_car_insurance_type_and_more','2026-05-21 04:44:03.878995');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3tjhamad8s7tr1azdhoit2xocu11ilt4','.eJxVjDsOwyAQBe9CHSGzYD4p0_sMCJYlOIlAMnYV5e6xJRdJOzPvvZkP21r81mnxc2JXBuzyy2LAJ9VDpEeo98ax1XWZIz8SftrOp5bodTvbv4MSetnXqBXYrJUZcCQUSuacJaLJRqHbOYF1GkR2A6IOGqwiF4WEqAncmCz7fAHlCzfD:1wFCq7:CYxdv50uhfdif7SngtwXvTadHVHVoB2KNZN0DWmdsCg','2026-05-05 15:16:39.877990'),('7exosy87hm8rvudfrxqjhk7x81ub6zes','.eJxVjDsOwyAQBe9CHSGzYD4p0_sMCJYlOIlAMnYV5e6xJRdJOzPvvZkP21r81mnxc2JXBuzyy2LAJ9VDpEeo98ax1XWZIz8SftrOp5bodTvbv4MSetnXqBXYrJUZcCQUSuacJaLJRqHbOYF1GkR2A6IOGqwiF4WEqAncmCz7fAHlCzfD:1tyuYI:2BBIIUfX2UDurQcoPuyO3Zz7MmX7Ku2i85fmMzaYSTk','2025-04-13 15:26:22.347183'),('7qppaj0eneu7hgeus1u51d2w9v84nwck','.eJxVjMsOwiAQRf-FtSHDW1y69xvIwIBUDSSlXRn_3TbpQrf3nHPfLOC61LCOPIeJ2IUJdvrdIqZnbjugB7Z756m3ZZ4i3xV-0MFvnfLrerh_BxVH3WpwshCgMuIMDhWBoQzSS2GsFyABtXdQSrRaKp-NcTaRFVqWjFtoiX2-sVI3AQ:1tuYwt:XUiUBVkRVgn34V0dJKUPfXY0cLMYculbBawrlHTpF7o','2025-04-01 15:33:47.604014'),('mhq9b1gegerpgy0r7ve7xpwp454natlj','.eJxVjDsOwyAQBe9CHSGzYD4p0_sMCJYlOIlAMnYV5e6xJRdJOzPvvZkP21r81mnxc2JXBuzyy2LAJ9VDpEeo98ax1XWZIz8SftrOp5bodTvbv4MSetnXqBXYrJUZcCQUSuacJaLJRqHbOYF1GkR2A6IOGqwiF4WEqAncmCz7fAHlCzfD:1vobdA:zOl-zFLwHSh0HIRlYnwFflzcHHF6UWLwx-d_9S97bKs','2026-02-21 06:17:20.643842'),('s10gkdm8g9pzefe2nr2k1njsmzfvqqh9','.eJxVjDsOwyAQBe9CHSGzYD4p0_sMCJYlOIlAMnYV5e6xJRdJOzPvvZkP21r81mnxc2JXBuzyy2LAJ9VDpEeo98ax1XWZIz8SftrOp5bodTvbv4MSetnXqBXYrJUZcCQUSuacJaLJRqHbOYF1GkR2A6IOGqwiF4WEqAncmCz7fAHlCzfD:1vQVHY:7XJh1copTlandDxxVkT4VasKL-XJ0CeGSemcxguDoUs','2025-12-16 18:39:24.180609'),('t9stv39efcb5s7hgdld0x2e4hhsxcye0','.eJxVjDEOwjAMRe-SGUVOipWUkZ0zRHFskwJqpaadKu4OlTrA-t97fzMpr0tNa5M5DWwuxpnT70a5PGXcAT_yeJ9smcZlHsjuij1os7eJ5XU93L-Dmlv91kVI1KEHZFVAIK9I3BeIhYLkQhIFset8QAcQoqpwyLE_ewHHoub9ARKBOO0:1u8LRG:Ai-wGfcI0ltggAqr5LqMgkybFbKPOQyv_bljUmjBnyw','2025-05-09 15:58:06.115478'),('w3prhupfj84emvdlxcxyrhvyediy0o2r','.eJxVjDsOwyAQBe9CHSGzYD4p0_sMCJYlOIlAMnYV5e6xJRdJOzPvvZkP21r81mnxc2JXBuzyy2LAJ9VDpEeo98ax1XWZIz8SftrOp5bodTvbv4MSetnXqBXYrJUZcCQUSuacJaLJRqHbOYF1GkR2A6IOGqwiF4WEqAncmCz7fAHlCzfD:1wFx4x:GHG697old5mCyLG8CrFhpQG-4BYIn9LNbYhO8O8kKmA','2026-05-07 16:39:03.585709');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mobile_number` varchar(10) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `mobile_number` (`mobile_number`),
  CONSTRAINT `users_userprofile_user_id_87251ef1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'9859456525',1),(2,'7499584148',2),(4,'7522449918',3),(8,'9356632445',5),(9,'8010877657',6);
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-22  0:06:19
