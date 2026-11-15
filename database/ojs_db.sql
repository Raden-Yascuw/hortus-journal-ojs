-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ojs_db
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
-- Table structure for table `access_keys`
--

DROP TABLE IF EXISTS `access_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_keys` (
  `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY (`access_key_id`),
  KEY `access_keys_hash` (`key_hash`,`user_id`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_keys`
--

LOCK TABLES `access_keys` WRITE;
/*!40000 ALTER TABLE `access_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_settings`
--

DROP TABLE IF EXISTS `announcement_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_settings` (
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_settings`
--

LOCK TABLES `announcement_settings` WRITE;
/*!40000 ALTER TABLE `announcement_settings` DISABLE KEYS */;
INSERT INTO `announcement_settings` VALUES (3,'en_US','description','<p>Dewan Redaksi <strong>Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences</strong> mengumumkan bahwa Edisi Perdana Vol. 1 No. 1 (Desember 2026) telah resmi diterbitkan secara terbuka. Kami mengundang para peneliti, akademisi, dan praktisi perkebunan untuk mengirimkan naskah riset orisinal maupun artikel reviu untuk Volume 1 Nomor 2. Seluruh naskah diproses melalui evaluasi <em>Double-Blind Peer Review</em> (2–4 minggu) tanpa biaya publikasi (<em>Zero APC</em>).</p>',NULL),(3,'en_US','descriptionShort','<p><strong>Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences</strong> resmi menerbitkan Edisi Perdana Vol. 1 No. 1 (2026) secara <em>Diamond Open Access</em> (Bebas Biaya APC) dan membuka penerimaan naskah baru untuk edisi berikutnya.</p>',NULL),(3,'en_US','title','Penerbitan Edisi Perdana Vol. 1 No. 1 (2026) & Panggilan Naskah (Call for Papers) Vol. 1 No. 2',NULL);
/*!40000 ALTER TABLE `announcement_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_type_settings`
--

DROP TABLE IF EXISTS `announcement_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_type_settings`
--

LOCK TABLES `announcement_type_settings` WRITE;
/*!40000 ALTER TABLE `announcement_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_types`
--

DROP TABLE IF EXISTS `announcement_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_types`
--

LOCK TABLES `announcement_types` WRITE;
/*!40000 ALTER TABLE `announcement_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES (3,256,1,NULL,NULL,'2026-11-05 08:00:00');
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sources` (
  `auth_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` smallint(6) NOT NULL DEFAULT 0,
  `settings` text DEFAULT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_settings`
--

DROP TABLE IF EXISTS `author_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_settings` (
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES (1,'','country','ID'),(1,'','orcid','https://orcid.org/0000-0002-1564-0003'),(1,'en_US','affiliation','Departemen Agrosains & Pusat Kajian Bioteknologi Tropika, Universitas Negeri Malang'),(1,'en_US','familyName','Syukurillah'),(1,'en_US','givenName','Nayla'),(2,'','country','ID'),(2,'','orcid','https://orcid.org/0000-0002-8423-0001'),(2,'en_US','affiliation','Departemen Agrosains & UPT Perpustakaan, Universitas Negeri Malang'),(2,'en_US','familyName','Rizky'),(2,'en_US','givenName','Mohammad Yanuar'),(3,'','country','ID'),(3,'','orcid','https://orcid.org/0000-0002-3861-0002'),(3,'en_US','affiliation','Departemen Agrosains, Universitas Negeri Malang'),(3,'en_US','familyName','Lestari'),(3,'en_US','givenName','Nirmala Dwi'),(31,'','country','ID'),(31,'','orcid','https://orcid.org/0000-0002-8423-0001'),(31,'en_US','affiliation','Departemen Agrosains & UPT Perpustakaan, Universitas Negeri Malang'),(31,'en_US','familyName','Rizky'),(31,'en_US','givenName','Mohammad Yanuar'),(32,'','country','ID'),(32,'','orcid','https://orcid.org/0000-0003-1122-4401'),(32,'en_US','affiliation','Pusat Penelitian Kopi dan Kakao Indonesia (ICCRI), Jember'),(32,'en_US','familyName','Setiawan'),(32,'en_US','givenName','Bagus'),(33,'','country','ID'),(33,'','orcid','https://orcid.org/0000-0002-3861-0002'),(33,'en_US','affiliation','Departemen Agrosains, Universitas Negeri Malang'),(33,'en_US','familyName','Lestari'),(33,'en_US','givenName','Nirmala Dwi'),(34,'','country','ID'),(34,'','orcid','https://orcid.org/0000-0001-9940-2211'),(34,'en_US','affiliation','Pusat Riset Tanaman Perkebunan, Badan Riset dan Inovasi Nasional (BRIN)'),(34,'en_US','familyName','Kusumawati'),(34,'en_US','givenName','Ratna'),(35,'','country','ID'),(35,'','orcid','https://orcid.org/0000-0002-3861-0002'),(35,'en_US','affiliation','Departemen Agrosains, Universitas Negeri Malang'),(35,'en_US','familyName','Lestari'),(35,'en_US','givenName','Nirmala Dwi'),(36,'','country','ID'),(36,'','orcid','https://orcid.org/0000-0002-4410-8832'),(36,'en_US','affiliation','Pusat Riset Tanaman Perkebunan, BRIN, Bogor'),(36,'en_US','familyName','Sudarmono'),(36,'en_US','givenName','Sudarmono'),(37,'','country','MY'),(37,'','orcid','https://orcid.org/0000-0002-7701-5512'),(37,'en_US','affiliation','Faculty of Agriculture, Universiti Putra Malaysia (UPM), Serdang'),(37,'en_US','familyName','Mohd. Noor'),(37,'en_US','givenName','Ahmad Kamal'),(38,'','country','ID'),(38,'','orcid','https://orcid.org/0000-0002-1564-0003'),(38,'en_US','affiliation','Departemen Agrosains & Pusat Kajian Bioteknologi Tropika, Universitas Negeri Malang'),(38,'en_US','familyName','Syukurillah'),(38,'en_US','givenName','Nayla'),(39,'','country','ID'),(39,'','orcid','https://orcid.org/0000-0003-2901-7710'),(39,'en_US','affiliation','Departemen Ilmu Tanah dan Sumberdaya Lahan, IPB University, Bogor'),(39,'en_US','familyName','Budiman'),(39,'en_US','givenName','Arif'),(40,'','country','ID'),(40,'','orcid','https://orcid.org/0000-0002-6612-3041'),(40,'en_US','affiliation','Pusat Penelitian Kelapa Sawit (PPKS), Medan, Sumatera Utara'),(40,'en_US','familyName','Wijaya'),(40,'en_US','givenName','Hendra'),(41,'','country','ID'),(41,'','orcid','https://orcid.org/0000-0002-3861-0002'),(41,'en_US','affiliation','Departemen Agrosains, Universitas Negeri Malang'),(41,'en_US','familyName','Lestari'),(41,'en_US','givenName','Nirmala Dwi'),(42,'','country','ID'),(42,'','orcid','https://orcid.org/0000-0001-8824-9102'),(42,'en_US','affiliation','Departemen Hama dan Penyakit Tumbuhan, Universitas Gadjah Mada'),(42,'en_US','familyName','Aminah'),(42,'en_US','givenName','Siti'),(43,'','country','ID'),(43,'','orcid','https://orcid.org/0000-0002-5104-8820'),(43,'en_US','affiliation','Pusat Penelitian Kopi dan Kakao Indonesia (ICCRI), Jember'),(43,'en_US','familyName','Haryono'),(43,'en_US','givenName','Didik'),(44,'','country','ID'),(44,'','orcid','https://orcid.org/0000-0003-4420-1193'),(44,'en_US','affiliation','Fakultas Pertanian, Universitas Brawijaya, Malang'),(44,'en_US','familyName','Kartikasari'),(44,'en_US','givenName','Rina'),(45,'','country','ID'),(45,'','orcid','https://orcid.org/0000-0002-8423-0001'),(45,'en_US','affiliation','Departemen Agrosains & UPT Perpustakaan, Universitas Negeri Malang'),(45,'en_US','familyName','Rizky'),(45,'en_US','givenName','Mohammad Yanuar'),(46,'','country','ID'),(46,'','orcid','https://orcid.org/0000-0002-9031-4510'),(46,'en_US','affiliation','Departemen Teknik Kimia, Institut Teknologi Sepuluh Nopember (ITS), Surabaya'),(46,'en_US','familyName','Pratama'),(46,'en_US','givenName','Fajar'),(47,'','country','ID'),(47,'','orcid','https://orcid.org/0000-0002-1564-0003'),(47,'en_US','affiliation','Departemen Agrosains & Pusat Kajian Bioteknologi Tropika, Universitas Negeri Malang'),(47,'en_US','familyName','Syukurillah'),(47,'en_US','givenName','Nayla'),(48,'','country','ID'),(48,'','orcid','https://orcid.org/0000-0003-1988-2045'),(48,'en_US','affiliation','Departemen Kimia, Universitas Negeri Malang'),(48,'en_US','familyName','Anggraini'),(48,'en_US','givenName','Dewi'),(49,'','country','FR'),(49,'','orcid','https://orcid.org/0000-0001-7640-3320'),(49,'en_US','affiliation','UMR QualiSud, CIRAD, Montpellier, France'),(49,'en_US','familyName','Sanchez-Cortes'),(49,'en_US','givenName','Maria'),(50,'','country','ID'),(50,'','orcid','https://orcid.org/0000-0003-1122-4401'),(50,'en_US','affiliation','Pusat Penelitian Kopi dan Kakao Indonesia (ICCRI), Jember'),(50,'en_US','familyName','Setiawan'),(50,'en_US','givenName','Bagus'),(51,'','country','ID'),(51,'','orcid','https://orcid.org/0000-0002-1564-0003'),(51,'en_US','affiliation','Departemen Agrosains & Pusat Kajian Bioteknologi Tropika, Universitas Negeri Malang'),(51,'en_US','familyName','Syukurillah'),(51,'en_US','givenName','Nayla'),(52,'','country','ID'),(52,'','orcid','https://orcid.org/0000-0002-8423-0001'),(52,'en_US','affiliation','Departemen Agrosains & UPT Perpustakaan, Universitas Negeri Malang'),(52,'en_US','familyName','Rizky'),(52,'en_US','givenName','Mohammad Yanuar'),(53,'','country','ID'),(53,'','orcid','https://orcid.org/0000-0002-3108-7764'),(53,'en_US','affiliation','Departemen Agribisnis, Fakultas Ekonomi dan Manajemen, IPB University'),(53,'en_US','familyName','Wulandari'),(53,'en_US','givenName','Lestari'),(54,'','country','ID'),(54,'','orcid','https://orcid.org/0000-0001-5520-9001'),(54,'en_US','affiliation','Departemen Agrosains, Universitas Negeri Malang'),(54,'en_US','familyName','Rahmania'),(54,'en_US','givenName','Lidya Amalia'),(55,'','country','ID'),(55,'','orcid','https://orcid.org/0000-0002-3861-0002'),(55,'en_US','affiliation','Departemen Agrosains, Universitas Negeri Malang'),(55,'en_US','familyName','Lestari'),(55,'en_US','givenName','Nirmala Dwi'),(56,'','country','ID'),(56,'','orcid','https://orcid.org/0000-0002-4091-6621'),(56,'en_US','affiliation','Balai Penelitian Sembawa, Pusat Penelitian Karet, Sumatera Selatan'),(56,'en_US','familyName','Supriyadi'),(56,'en_US','givenName','Bambang'),(57,'','country','ID'),(57,'','orcid','https://orcid.org/0000-0002-8423-0001'),(57,'en_US','affiliation','Departemen Agrosains & UPT Perpustakaan, Universitas Negeri Malang'),(57,'en_US','familyName','Rizky'),(57,'en_US','givenName','Mohammad Yanuar');
/*!40000 ALTER TABLE `author_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `include_in_browse` smallint(6) NOT NULL DEFAULT 1,
  `publication_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `user_group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `authors_publication_id` (`publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'nayla.syukurillah@hortus.ac.id',1,1,1.00,14),(2,'yanuar.rizky@hortus.ac.id',1,1,2.00,14),(3,'nirmala.lestari@hortus.ac.id',1,1,3.00,14),(31,'yanuar.rizky@hortus.ac.id',1,2,1.00,14),(32,'bagus.setiawan@iccri.net',1,2,2.00,14),(33,'nirmala.lestari@hortus.ac.id',1,2,3.00,14),(34,'ratna.kusumawati@brin.go.id',1,3,1.00,14),(35,'nirmala.lestari@hortus.ac.id',1,3,2.00,14),(36,'sudarmono@brin.go.id',1,3,3.00,14),(37,'akamal.noor@upm.edu.my',1,4,1.00,14),(38,'nayla.syukurillah@hortus.ac.id',1,4,2.00,14),(39,'arif.budiman@apps.ipb.ac.id',1,4,3.00,14),(40,'hendra.wijaya@iopri.org',1,5,1.00,14),(41,'nirmala.lestari@hortus.ac.id',1,5,2.00,14),(42,'siti.aminah@ugm.ac.id',1,5,3.00,14),(43,'didik.haryono@iccri.net',1,6,1.00,14),(44,'rina.kartikasari@ub.ac.id',1,6,2.00,14),(45,'yanuar.rizky@hortus.ac.id',1,6,3.00,14),(46,'fajar.pratama@its.ac.id',1,7,1.00,14),(47,'nayla.syukurillah@hortus.ac.id',1,7,2.00,14),(48,'dewi.anggraini@um.ac.id',1,7,3.00,14),(49,'maria.sanchez-cortes@cirad.fr',1,8,1.00,14),(50,'bagus.setiawan@iccri.net',1,8,2.00,14),(51,'nayla.syukurillah@hortus.ac.id',1,8,3.00,14),(52,'yanuar.rizky@hortus.ac.id',1,9,1.00,14),(53,'lestari.wulandari@apps.ipb.ac.id',1,9,2.00,14),(54,'lidya.rahmania@hortus.ac.id',1,9,3.00,14),(55,'nirmala.lestari@hortus.ac.id',1,10,1.00,14),(56,'bambang.supriyadi@puslitkaret.id',1,10,2.00,14),(57,'yanuar.rizky@hortus.ac.id',1,10,3.00,14);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_settings`
--

DROP TABLE IF EXISTS `category_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_settings` (
  `category_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `category_settings_pkey` (`category_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_settings`
--

DROP TABLE IF EXISTS `citation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citation_settings` (
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citation_settings`
--

LOCK TABLES `citation_settings` WRITE;
/*!40000 ALTER TABLE `citation_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `citation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citations`
--

DROP TABLE IF EXISTS `citations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citations` (
  `citation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publication_id` bigint(20) NOT NULL DEFAULT 0,
  `raw_citation` text NOT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  KEY `citations_publication` (`publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citations`
--

LOCK TABLES `citations` WRITE;
/*!40000 ALTER TABLE `citations` DISABLE KEYS */;
INSERT INTO `citations` VALUES (42,1,'Chong, K. L., Kanniah, K. D., Pohl, C., & Tan, K. P. (2017). A review of remote sensing applications for oil palm studies. Geo-spatial Information Science, 20(2), 184–200. https://doi.org/10.1080/10095020.2017.1337317',1),(43,1,'Committee on Publication Ethics (COPE). (2018). Principles of transparency and best practice in scholarly publishing. https://doi.org/10.24318/cope.2019.1.12',2),(44,1,'Santoso, H., Gunawan, T., Jatmiko, R. H., Darmosarkoro, W., & Minasny, B. (2019). Mapping and identifying basal stem rot disease in oil palms in North Sumatra with QuickBird imagery. Precision Agriculture, 12(2), 233–248. https://doi.org/10.1007/s11119-010-9172-7',3),(45,1,'Solomon, D. J. (2008). Developing open access journals: A practical guide. Chandos Publishing.',4),(46,1,'Suber, P. (2012). Open access. The MIT Press. https://doi.org/10.7551/mitpress/9286.001.0001',5),(47,2,'DaMatta, F. M., Rakocevic, M., Ricci, R. A., & Ramalho, J. C. (2019). Physiological traits of coffee trees under drought stress. Plant Physiology and Biochemistry, 138, 121–134. https://doi.org/10.1016/j.plaphy.2019.02.020',1),(48,2,'Ghozali, M. R., & Setiawan, B. (2023). Low-power LoRaWAN telemetry for smallholder coffee farms in East Java. Smart Agricultural Technology, 4, 100182. https://doi.org/10.1016/j.atech.2023.100182',2),(49,2,'Jones, H. G. (2018). Irrigation scheduling: Advantages and pitfalls of plant-based methods. Journal of Experimental Botany, 55(407), 2427–2436. https://doi.org/10.1093/jxb/erh213',3),(50,2,'Vereecken, H., Huisman, J. A., & Bogena, H. (2021). Soil moisture sensing for precision agriculture. Vadose Zone Journal, 20(3), e20112. https://doi.org/10.1002/vzj2.20112',4),(51,3,'Bates, L. S., Waldren, R. P., & Teare, I. D. (1973). Rapid determination of free proline for water-stress studies. Plant and Soil, 39(1), 205–207. https://doi.org/10.1007/BF00018060',1),(52,3,'Lahive, F., Hadley, P., & Daymond, A. J. (2019). The physiological responses of cacao to the environment and the implications for climate change resilience. Agronomy for Sustainable Development, 39(1), 5. https://doi.org/10.1007/s13593-018-0552-0',2),(53,3,'Munns, R., & Tester, M. (2008). Mechanisms of salinity tolerance. Annual Review of Plant Biology, 59, 651–681. https://doi.org/10.1146/annurev.arplant.59.032607.092911',3),(54,3,'Susilo, A. W., & Anita-Sari, I. (2021). Physiological screening of Indonesian cocoa clones under tidal swamp conditions. Pelita Perkebunan, 37(2), 89–101. https://doi.org/10.22302/iccri.jur.pelitaperkebunan.v37i2.478',4),(55,4,'Agegnehu, G., Srivastava, A. K., & Bird, M. I. (2017). The role of biochar and biochar-compost in improving soil quality and crop performance: A review. Applied Soil Ecology, 119, 156–170. https://doi.org/10.1016/j.apsoil.2017.06.008',1),(56,4,'Lehmann, J., & Joseph, S. (2015). Biochar for environmental management: Science, technology and implementation (2nd ed.). Routledge. https://doi.org/10.4324/9780203762264',2),(57,4,'Mohd. Noor, A. K., & Yusoff, M. K. (2022). Peatland nutrient dynamics under oil palm cultivation in Southeast Asia. Geoderma Regional, 29, e00514. https://doi.org/10.1016/j.geodrs.2022.e00514',3),(58,4,'Woittiez, L. S., van Wijk, M. T., Slingerland, M., van Noordwijk, M., & Giller, K. E. (2017). Yield gaps in oil palm: A quantitative review of contributing factors. European Journal of Agronomy, 83, 57–77. https://doi.org/10.1016/j.eja.2016.11.002',4),(59,5,'Alexander, A., Sipaut, C. S., Dayou, J., & Chong, K. P. (2017). Oil palm roots colonization by Ganoderma boninense: An insight. Journal of Oil Palm Research, 29(2), 180–191. https://doi.org/10.21894/jopr.2017.2902.04',1),(60,5,'Goh, Y. K., Marzuki, N. F., Paiko, A. S., & Goh, K. J. (2020). Biological control of Ganoderma basal stem rot using Trichoderma consortia. Biological Control, 149, 104318. https://doi.org/10.1016/j.biocontrol.2020.104318',2),(61,5,'Paterson, R. R. M. (2019). Ganoderma boninense disease of oil palm to significantly reduce production after 2050 in Sumatra. Microorganisms, 7(1), 24. https://doi.org/10.3390/microorganisms7010024',3),(62,5,'Susanto, A., Sudharto, P. S., & Purba, R. Y. (2018). Enhancing biological control of basal stem rot in North Sumatra oil palm plantations. Crop Protection, 108, 45–53. https://doi.org/10.1016/j.cropro.2018.02.011',4),(63,6,'Aristizábal, L. F., Bustillo, A. E., & Arthurs, S. P. (2016). Integrated pest management of coffee berry borer: Strategies from Latin America that could be useful for coffee farmers in Hawaii. Insects, 7(1), 6. https://doi.org/10.3390/insects7010006',1),(64,6,'Jaramillo, J., Setamou, M., Muchugu, E., Chabi-Olaye, A., & Borgemeister, C. (2013). Climate change or urbanization? Impacts on a traditional coffee production system in East Africa. PLoS ONE, 8(1), e51815. https://doi.org/10.1371/journal.pone.0051815',2),(65,6,'Perfecto, I., Vandermeer, J., & Philpott, S. M. (2014). Complex ecological interactions in the coffee agroecosystem. Annual Review of Ecology, Evolution, and Systematics, 45, 137–158. https://doi.org/10.1146/annurev-ecolsys-120213-091923',3),(66,6,'Vega, F. E., Infante, F., & Johnson, A. J. (2015). The genus Hypothenemus, with emphasis on H. hampei, the coffee berry borer. In Bark beetles (pp. 427–494). Academic Press. https://doi.org/10.1016/B978-0-12-417156-5.00011-3',4),(67,7,'Abdullah, N., & Sulaiman, F. (2013). The oil palm wastes in Malaysia. In Biomass now: Sustainable growth and use (pp. 75–100). InTech. https://doi.org/10.5772/55302',1),(68,7,'Bridgewater, A. V. (2012). Review of fast pyrolysis of biomass and product upgrading. Biomass and Bioenergy, 38, 68–94. https://doi.org/10.1016/j.biombioe.2011.01.048',2),(69,7,'Liew, W. L., Kassim, M. A., Muda, K., Loh, S. K., & Affam, A. C. (2015). Conventional methods and emerging wastewater polishing technologies for palm oil mill effluent treatment: A review. Journal of Environmental Management, 149, 222–235. https://doi.org/10.1016/j.jenvman.2014.10.016',3),(70,7,'Pratama, F., & Syukurillah, N. (2024). Synergistic co-pyrolysis of empty fruit bunch and cocoa pod husk. Bioresource Technology Reports, 25, 101742. https://doi.org/10.1016/j.biteb.2024.101742',4),(71,8,'De Bruyn, F., Zhang, S. J., Pothakos, V., Torres, J., Lambot, C., Moroni, A. V., & De Vuyst, L. (2017). Exploring the impacts of postharvest processing on the microbiota and metabolite profiles during green coffee bean production. Applied and Environmental Microbiology, 83(1), e02398-16. https://doi.org/10.1128/AEM.02398-16',1),(72,8,'Pereira, G. V. M., Neto, D. P. C., Júnior, A. I. M., Vásquez, Z. S., Medeiros, A. B. P., Vandenberghe, L. P. S., & Soccol, C. R. (2019). Exploring the impacts of postharvest processing on the aroma formation of coffee beans. Food Chemistry, 272, 441–452. https://doi.org/10.1016/j.foodchem.2018.08.061',2),(73,8,'Prakash, I., & Setiawan, B. (2023). Controlled anaerobic fermentation of Indonesian Fine Robusta. Food Research International, 165, 112504. https://doi.org/10.1016/j.foodres.2023.112504',3),(74,8,'Silva, C. F., Batista, L. R., Abreu, L. M., Dias, E. S., & Schwan, R. F. (2008). Succession of bacterial and fungal communities during natural coffee fermentation. Food Microbiology, 25(8), 951–957. https://doi.org/10.1016/j.fm.2008.07.003',4),(75,9,'Brandi, C., Cabani, T., Hosang, C., Schirmbeck, S., Westermann, L., & Wiese, H. (2015). Sustainability standards for palm oil: Challenges for smallholder certification under the RSPO. The Journal of Environment & Development, 24(3), 292–314. https://doi.org/10.1177/1070496515593775',1),(76,9,'Hutabarat, S., Slingerland, M., Rietberg, P., & Dries, L. (2018). Costs and benefits of certification of independent oil palm smallholders in Indonesia. International Food and Agribusiness Management Review, 21(6), 681–700. https://doi.org/10.22434/IFAMR2016.0162',2),(77,9,'Rizky, M. Y., & Wulandari, L. (2024). Digital traceability readiness for Indonesian palm oil smallholders under EUDR. Forest Policy and Economics, 160, 103152. https://doi.org/10.1016/j.forpol.2024.103152',3),(78,9,'Watts, J. D., Pasaribu, K., Irawan, S., Tacconi, L., & Martanila, H. (2021). Challenges faced by smallholders in achieving sustainable palm oil certification in Indonesia. World Development, 146, 105565. https://doi.org/10.1016/j.worlddev.2021.105565',4),(79,10,'Jawjit, W., Kroeze, C., & Rattanapan, S. (2010). Greenhouse gas emissions from rubber industry in Thailand. Journal of Cleaner Production, 18(5), 403–411. https://doi.org/10.1016/j.jclepro.2009.12.003',1),(80,10,'Kamilaris, A., Fonts, A., & Prenafeta-Boldʊ, F. X. (2019). The rise of blockchain technology in agriculture and food supply chains. Trends in Food Science & Technology, 91, 640–652. https://doi.org/10.1016/j.tifs.2019.07.034',2),(81,10,'Lestari, N. D., & Supriyadi, B. (2025). Carbon footprint and EUDR geolocation readiness in South Sumatra smallholder rubber. Sustainable Production and Consumption, 46, 112–125. https://doi.org/10.1016/j.spc.2025.01.009',3),(82,10,'Musikavong, C., & Gheewala, S. H. (2017). Ecological footprint assessment towards eco-efficient palm oil and rubber production. Journal of Cleaner Production, 140, 581–589. https://doi.org/10.1016/j.jclepro.2016.07.152',4);
/*!40000 ALTER TABLE `citations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completed_payments`
--

DROP TABLE IF EXISTS `completed_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`completed_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_payments`
--

LOCK TABLES `completed_payments` WRITE;
/*!40000 ALTER TABLE `completed_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `completed_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entries`
--

DROP TABLE IF EXISTS `controlled_vocab_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (1,1,0.00),(2,1,0.00),(3,1,0.00),(4,1,0.00),(5,1,0.00),(6,1,0.00),(7,1,0.00),(8,1,0.00),(9,1,0.00),(10,1,0.00),(174,57,1.00),(175,57,2.00),(176,57,3.00),(177,57,4.00),(178,57,5.00),(179,57,6.00),(180,58,1.00),(181,58,2.00),(182,58,3.00),(183,59,1.00),(184,59,2.00),(185,60,1.00),(186,61,1.00),(187,61,2.00),(188,62,1.00),(189,62,2.00),(190,62,3.00),(191,62,4.00),(192,62,5.00),(193,63,1.00),(194,63,2.00),(195,63,3.00),(196,64,1.00),(197,64,2.00),(198,65,1.00),(199,66,1.00),(200,66,2.00),(201,67,1.00),(202,67,2.00),(203,67,3.00),(204,67,4.00),(205,67,5.00),(206,68,1.00),(207,68,2.00),(208,68,3.00),(209,69,1.00),(210,69,2.00),(211,70,1.00),(212,71,1.00),(213,71,2.00),(214,72,1.00),(215,72,2.00),(216,72,3.00),(217,72,4.00),(218,72,5.00),(219,73,1.00),(220,73,2.00),(221,73,3.00),(222,74,1.00),(223,74,2.00),(224,75,1.00),(225,76,1.00),(226,77,1.00),(227,77,2.00),(228,77,3.00),(229,77,4.00),(230,77,5.00),(231,78,1.00),(232,78,2.00),(233,78,3.00),(234,79,1.00),(235,79,2.00),(236,80,1.00),(237,81,1.00),(238,81,2.00),(239,82,1.00),(240,82,2.00),(241,82,3.00),(242,82,4.00),(243,82,5.00),(244,83,1.00),(245,83,2.00),(246,83,3.00),(247,84,1.00),(248,84,2.00),(249,85,1.00),(250,86,1.00),(251,86,2.00),(252,87,1.00),(253,87,2.00),(254,87,3.00),(255,87,4.00),(256,87,5.00),(257,88,1.00),(258,88,2.00),(259,88,3.00),(260,89,1.00),(261,89,2.00),(262,90,1.00),(263,91,1.00),(264,92,1.00),(265,92,2.00),(266,92,3.00),(267,92,4.00),(268,92,5.00),(269,93,1.00),(270,93,2.00),(271,93,3.00),(272,94,1.00),(273,94,2.00),(274,95,1.00),(275,96,1.00),(276,97,1.00),(277,97,2.00),(278,97,3.00),(279,97,4.00),(280,97,5.00),(281,98,1.00),(282,98,2.00),(283,98,3.00),(284,99,1.00),(285,99,2.00),(286,100,1.00),(287,101,1.00),(288,102,1.00),(289,102,2.00),(290,102,3.00),(291,102,4.00),(292,102,5.00),(293,103,1.00),(294,103,2.00),(295,103,3.00),(296,104,1.00),(297,104,2.00),(298,105,1.00),(299,106,1.00),(300,106,2.00);
/*!40000 ALTER TABLE `controlled_vocab_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entry_settings`
--

DROP TABLE IF EXISTS `controlled_vocab_entry_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entry_settings` VALUES (1,'','interest','Smart Plantation','string'),(2,'','interest','UAV Multispectral','string'),(3,'','interest','IoT Sensors','string'),(4,'','interest','Elaeis guineensis','string'),(5,'','interest','Precision Agriculture','string'),(6,'','interest','ISPO Sustainability','string'),(7,'','interest','Oil Palm Breeding','string'),(8,'','interest','Plantation Agronomy','string'),(9,'','interest','Peatland Management','string'),(10,'','interest','Crop Physiology','string'),(174,'en_US','submissionKeyword','Elaeis guineensis','string'),(175,'en_US','submissionKeyword','IoT Kanopi','string'),(176,'en_US','submissionKeyword','Multispektral UAV','string'),(177,'en_US','submissionKeyword','NDRE','string'),(178,'en_US','submissionKeyword','Smart Plantation','string'),(179,'en_US','submissionKeyword','ISPO','string'),(180,'en_US','submissionSubject','Precision Agriculture','string'),(181,'en_US','submissionSubject','Tropical Plantation Science','string'),(182,'en_US','submissionSubject','Remote Sensing','string'),(183,'en_US','submissionDiscipline','Agricultural Engineering','string'),(184,'en_US','submissionDiscipline','Agronomy','string'),(185,'en_US','submissionLanguage','id','string'),(186,'en_US','submissionAgency','LPPM Universitas Negeri Malang (Hibah Riset Sawit Berkelanjutan 2025)','string'),(187,'en_US','submissionAgency','Lidya Amalia Rahmania (Editor)','string'),(188,'en_US','submissionKeyword','Coffea canephora','string'),(189,'en_US','submissionKeyword','Irigasi Tetes Presisi','string'),(190,'en_US','submissionKeyword','LoRaWAN','string'),(191,'en_US','submissionKeyword','Cekaman Kekeringan','string'),(192,'en_US','submissionKeyword','Water Use Efficiency','string'),(193,'en_US','submissionSubject','Smart Irrigation','string'),(194,'en_US','submissionSubject','Coffee Agronomy','string'),(195,'en_US','submissionSubject','IoT Telemetry','string'),(196,'en_US','submissionDiscipline','Agricultural Engineering','string'),(197,'en_US','submissionDiscipline','Soil Physics','string'),(198,'en_US','submissionLanguage','id','string'),(199,'en_US','submissionAgency','Pusat Penelitian Kopi dan Kakao Indonesia (ICCRI)','string'),(200,'en_US','submissionAgency','Departemen Agrosains UM','string'),(201,'en_US','submissionKeyword','Theobroma cacao','string'),(202,'en_US','submissionKeyword','Akumulasi Prolin','string'),(203,'en_US','submissionKeyword','Cekaman Salinitas','string'),(204,'en_US','submissionKeyword','Lahan Pasang Surut','string'),(205,'en_US','submissionKeyword','Fisiologi Tanaman','string'),(206,'en_US','submissionSubject','Plant Physiology','string'),(207,'en_US','submissionSubject','Crop Breeding','string'),(208,'en_US','submissionSubject','Abiotic Stress','string'),(209,'en_US','submissionDiscipline','Agronomy','string'),(210,'en_US','submissionDiscipline','Plant Biotechnology','string'),(211,'en_US','submissionLanguage','id','string'),(212,'en_US','submissionAgency','Pusat Riset Tanaman Perkebunan BRIN','string'),(213,'en_US','submissionAgency','Konsorsium Pemuliaan Kakao Tropika','string'),(214,'en_US','submissionKeyword','Biochar','string'),(215,'en_US','submissionKeyword','Tropical Peatland','string'),(216,'en_US','submissionKeyword','Elaeis guineensis','string'),(217,'en_US','submissionKeyword','Nutrient Retention','string'),(218,'en_US','submissionKeyword','Cation Exchange Capacity','string'),(219,'en_US','submissionSubject','Soil Fertility','string'),(220,'en_US','submissionSubject','Peatland Management','string'),(221,'en_US','submissionSubject','Plantation Nursery','string'),(222,'en_US','submissionDiscipline','Soil Science','string'),(223,'en_US','submissionDiscipline','Agronomy','string'),(224,'en_US','submissionLanguage','en','string'),(225,'en_US','submissionAgency','ASEAN Tropical Plantation Research Grant (UM–UPM–IPB)','string'),(226,'en_US','submissionKeyword','Ganoderma boninense','string'),(227,'en_US','submissionKeyword','Trichoderma asperellum','string'),(228,'en_US','submissionKeyword','Burkholderia cepacia','string'),(229,'en_US','submissionKeyword','Pengendalian Hayati','string'),(230,'en_US','submissionKeyword','Kelapa Sawit','string'),(231,'en_US','submissionSubject','Biological Control','string'),(232,'en_US','submissionSubject','Plant Pathology','string'),(233,'en_US','submissionSubject','Plantation Ecosystem Health','string'),(234,'en_US','submissionDiscipline','Plant Pathology','string'),(235,'en_US','submissionDiscipline','Microbiology','string'),(236,'en_US','submissionLanguage','id','string'),(237,'en_US','submissionAgency','Pusat Penelitian Kelapa Sawit (PPKS) Medan','string'),(238,'en_US','submissionAgency','Laboratorium Proteksi Hayati UM','string'),(239,'en_US','submissionKeyword','Hypothenemus hampei','string'),(240,'en_US','submissionKeyword','Coffea arabica','string'),(241,'en_US','submissionKeyword','Agroforestri','string'),(242,'en_US','submissionKeyword','Cephalonomia stephanoderis','string'),(243,'en_US','submissionKeyword','Konservasi Hayati','string'),(244,'en_US','submissionSubject','Agroforestry Ecology','string'),(245,'en_US','submissionSubject','Integrated Pest Management','string'),(246,'en_US','submissionSubject','Coffee Entomology','string'),(247,'en_US','submissionDiscipline','Entomology','string'),(248,'en_US','submissionDiscipline','Agroecology','string'),(249,'en_US','submissionLanguage','id','string'),(250,'en_US','submissionAgency','ICCRI Jember','string'),(251,'en_US','submissionAgency','Dinas Perkebunan Provinsi Jawa Timur','string'),(252,'en_US','submissionKeyword','Biomassa Sirkular','string'),(253,'en_US','submissionKeyword','Pirolisis','string'),(254,'en_US','submissionKeyword','Karbon Aktif','string'),(255,'en_US','submissionKeyword','POME','string'),(256,'en_US','submissionKeyword','Biorefinery','string'),(257,'en_US','submissionSubject','Biomass Valorization','string'),(258,'en_US','submissionSubject','Circular Agro-Industry','string'),(259,'en_US','submissionSubject','Wastewater Remediation','string'),(260,'en_US','submissionDiscipline','Chemical Engineering','string'),(261,'en_US','submissionDiscipline','Bioenergy','string'),(262,'en_US','submissionLanguage','id','string'),(263,'en_US','submissionAgency','Direktorat Riset, Teknologi, dan Pengabdian kepada Masyarakat (DRTPM)','string'),(264,'en_US','submissionKeyword','Postharvest Fermentation','string'),(265,'en_US','submissionKeyword','Lactobacillus plantarum','string'),(266,'en_US','submissionKeyword','Saccharomyces cerevisiae','string'),(267,'en_US','submissionKeyword','Coffea liberica','string'),(268,'en_US','submissionKeyword','Flavor Metabolomics','string'),(269,'en_US','submissionSubject','Postharvest Biotechnology','string'),(270,'en_US','submissionSubject','Coffee Processing','string'),(271,'en_US','submissionSubject','Sensory Metabolomics','string'),(272,'en_US','submissionDiscipline','Food Science','string'),(273,'en_US','submissionDiscipline','Bioprocess Engineering','string'),(274,'en_US','submissionLanguage','en','string'),(275,'en_US','submissionAgency','CIRAD-ICCRI Bilateral Postharvest Innovation Program','string'),(276,'en_US','submissionKeyword','ISPO','string'),(277,'en_US','submissionKeyword','RSPO','string'),(278,'en_US','submissionKeyword','Pekebun Swadaya','string'),(279,'en_US','submissionKeyword','Pembiayaan Hijau','string'),(280,'en_US','submissionKeyword','Keberlanjutan Agribisnis','string'),(281,'en_US','submissionSubject','Sustainability Certification','string'),(282,'en_US','submissionSubject','Agribusiness Policy','string'),(283,'en_US','submissionSubject','Smallholder Governance','string'),(284,'en_US','submissionDiscipline','Agricultural Economics','string'),(285,'en_US','submissionDiscipline','Public Policy','string'),(286,'en_US','submissionLanguage','id','string'),(287,'en_US','submissionAgency','UPT Perpustakaan & Departemen Agrosains Universitas Negeri Malang','string'),(288,'en_US','submissionKeyword','Hevea brasiliensis','string'),(289,'en_US','submissionKeyword','Blockchain Traceability','string'),(290,'en_US','submissionKeyword','Life Cycle Assessment','string'),(291,'en_US','submissionKeyword','Karet Alam Berkelanjutan','string'),(292,'en_US','submissionKeyword','EUDR','string'),(293,'en_US','submissionSubject','Supply Chain Traceability','string'),(294,'en_US','submissionSubject','Life Cycle Assessment','string'),(295,'en_US','submissionSubject','Natural Rubber Agro-Industry','string'),(296,'en_US','submissionDiscipline','Industrial Engineering','string'),(297,'en_US','submissionDiscipline','Agribusiness','string'),(298,'en_US','submissionLanguage','id','string'),(299,'en_US','submissionAgency','Pusat Penelitian Karet Sembawa','string'),(300,'en_US','submissionAgency','Departemen Agrosains UM','string');
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocabs`
--

DROP TABLE IF EXISTS `controlled_vocabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT INTO `controlled_vocabs` VALUES (1,'interest',0,0),(61,'submissionAgency',1048588,1),(66,'submissionAgency',1048588,2),(71,'submissionAgency',1048588,3),(76,'submissionAgency',1048588,4),(81,'submissionAgency',1048588,5),(86,'submissionAgency',1048588,6),(91,'submissionAgency',1048588,7),(96,'submissionAgency',1048588,8),(101,'submissionAgency',1048588,9),(106,'submissionAgency',1048588,10),(59,'submissionDiscipline',1048588,1),(64,'submissionDiscipline',1048588,2),(69,'submissionDiscipline',1048588,3),(74,'submissionDiscipline',1048588,4),(79,'submissionDiscipline',1048588,5),(84,'submissionDiscipline',1048588,6),(89,'submissionDiscipline',1048588,7),(94,'submissionDiscipline',1048588,8),(99,'submissionDiscipline',1048588,9),(104,'submissionDiscipline',1048588,10),(57,'submissionKeyword',1048588,1),(62,'submissionKeyword',1048588,2),(67,'submissionKeyword',1048588,3),(72,'submissionKeyword',1048588,4),(77,'submissionKeyword',1048588,5),(82,'submissionKeyword',1048588,6),(87,'submissionKeyword',1048588,7),(92,'submissionKeyword',1048588,8),(97,'submissionKeyword',1048588,9),(102,'submissionKeyword',1048588,10),(60,'submissionLanguage',1048588,1),(65,'submissionLanguage',1048588,2),(70,'submissionLanguage',1048588,3),(75,'submissionLanguage',1048588,4),(80,'submissionLanguage',1048588,5),(85,'submissionLanguage',1048588,6),(90,'submissionLanguage',1048588,7),(95,'submissionLanguage',1048588,8),(100,'submissionLanguage',1048588,9),(105,'submissionLanguage',1048588,10),(58,'submissionSubject',1048588,1),(63,'submissionSubject',1048588,2),(68,'submissionSubject',1048588,3),(73,'submissionSubject',1048588,4),(78,'submissionSubject',1048588,5),(83,'submissionSubject',1048588,6),(88,'submissionSubject',1048588,7),(93,'submissionSubject',1048588,8),(98,'submissionSubject',1048588,9),(103,'submissionSubject',1048588,10);
/*!40000 ALTER TABLE `controlled_vocabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_issue_orders`
--

DROP TABLE IF EXISTS `custom_issue_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_issue_orders` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  UNIQUE KEY `custom_issue_orders_pkey` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_issue_orders`
--

LOCK TABLES `custom_issue_orders` WRITE;
/*!40000 ALTER TABLE `custom_issue_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_issue_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_section_orders`
--

DROP TABLE IF EXISTS `custom_section_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_section_orders` (
  `issue_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  UNIQUE KEY `custom_section_orders_pkey` (`issue_id`,`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_section_orders`
--

LOCK TABLES `custom_section_orders` WRITE;
/*!40000 ALTER TABLE `custom_section_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_section_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_oai_set_objects`
--

DROP TABLE IF EXISTS `data_object_tombstone_oai_set_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_oai_set_objects`
--

LOCK TABLES `data_object_tombstone_oai_set_objects` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_settings`
--

DROP TABLE IF EXISTS `data_object_tombstone_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tombstone_settings` (
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_settings`
--

LOCK TABLES `data_object_tombstone_settings` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstones`
--

DROP TABLE IF EXISTS `data_object_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_object_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `data_object_tombstones_data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstones`
--

LOCK TABLES `data_object_tombstones` WRITE;
/*!40000 ALTER TABLE `data_object_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_decisions`
--

DROP TABLE IF EXISTS `edit_decisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` smallint(6) NOT NULL,
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES (1,1,0,1,0,5,8,'2026-10-14 10:30:00'),(2,1,1,3,1,6,2,'2026-10-27 09:30:00'),(3,1,1,3,1,5,1,'2026-10-30 10:15:00'),(4,1,0,4,0,5,7,'2026-11-03 15:45:00');
/*!40000 ALTER TABLE `edit_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text DEFAULT NULL,
  `cc_recipients` text DEFAULT NULL,
  `bcc_recipients` text DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log_users` (
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `context_id` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default`
--

DROP TABLE IF EXISTS `email_templates_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `can_disable` smallint(6) NOT NULL DEFAULT 0,
  `can_edit` smallint(6) NOT NULL DEFAULT 0,
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `email_templates_default_email_key` (`email_key`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,1,NULL,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,1,NULL,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL,NULL),(4,'USER_REGISTER',0,1,NULL,NULL,NULL),(5,'USER_VALIDATE',0,1,NULL,NULL,NULL),(6,'REVIEWER_REGISTER',0,1,NULL,NULL,NULL),(7,'PUBLISH_NOTIFY',0,1,NULL,NULL,NULL),(8,'LOCKSS_EXISTING_ARCHIVE',0,1,NULL,NULL,NULL),(9,'LOCKSS_NEW_ARCHIVE',0,1,NULL,NULL,NULL),(10,'SUBMISSION_ACK',1,1,NULL,65536,1),(11,'SUBMISSION_ACK_NOT_USER',1,1,NULL,65536,1),(12,'EDITOR_ASSIGN',1,1,16,16,1),(13,'REVIEW_CANCEL',1,1,16,4096,3),(14,'REVIEW_REINSTATE',1,1,16,4096,3),(15,'REVIEW_REQUEST',1,1,16,4096,3),(16,'REVIEW_REQUEST_SUBSEQUENT',1,1,16,4096,3),(17,'REVIEW_REQUEST_ONECLICK',1,1,16,4096,3),(18,'REVIEW_REQUEST_ONECLICK_SUBSEQUENT',1,1,16,4096,3),(19,'REVIEW_REQUEST_ATTACHED',0,1,16,4096,3),(20,'REVIEW_REQUEST_ATTACHED_SUBSEQUENT',0,1,16,4096,3),(21,'REVIEW_REQUEST_REMIND_AUTO',0,1,NULL,4096,3),(22,'REVIEW_REQUEST_REMIND_AUTO_ONECLICK',0,1,NULL,4096,3),(23,'REVIEW_CONFIRM',1,1,4096,16,3),(24,'REVIEW_DECLINE',1,1,4096,16,3),(25,'REVIEW_ACK',1,1,16,4096,3),(26,'REVIEW_REMIND',0,1,16,4096,3),(27,'REVIEW_REMIND_AUTO',0,1,NULL,4096,3),(28,'REVIEW_REMIND_ONECLICK',0,1,16,4096,3),(29,'REVIEW_REMIND_AUTO_ONECLICK',0,1,NULL,4096,3),(30,'EDITOR_DECISION_ACCEPT',0,1,16,65536,3),(31,'EDITOR_DECISION_SEND_TO_EXTERNAL',0,1,16,65536,3),(32,'EDITOR_DECISION_SEND_TO_PRODUCTION',0,1,16,65536,5),(33,'EDITOR_DECISION_REVISIONS',0,1,16,65536,3),(34,'EDITOR_DECISION_RESUBMIT',0,1,16,65536,3),(35,'EDITOR_DECISION_DECLINE',0,1,16,65536,3),(36,'EDITOR_DECISION_INITIAL_DECLINE',0,1,16,65536,1),(37,'EDITOR_RECOMMENDATION',0,1,16,16,3),(38,'COPYEDIT_REQUEST',1,1,16,4097,4),(39,'LAYOUT_REQUEST',1,1,16,4097,5),(40,'LAYOUT_COMPLETE',1,1,4097,16,5),(41,'EMAIL_LINK',0,1,1048576,NULL,NULL),(42,'SUBSCRIPTION_NOTIFY',0,1,NULL,1048576,NULL),(43,'OPEN_ACCESS_NOTIFY',0,1,NULL,1048576,NULL),(44,'SUBSCRIPTION_BEFORE_EXPIRY',0,1,NULL,1048576,NULL),(45,'SUBSCRIPTION_AFTER_EXPIRY',0,1,NULL,1048576,NULL),(46,'SUBSCRIPTION_AFTER_EXPIRY_LAST',0,1,NULL,1048576,NULL),(47,'SUBSCRIPTION_PURCHASE_INDL',0,1,NULL,2097152,NULL),(48,'SUBSCRIPTION_PURCHASE_INSTL',0,1,NULL,2097152,NULL),(49,'SUBSCRIPTION_RENEW_INDL',0,1,NULL,2097152,NULL),(50,'SUBSCRIPTION_RENEW_INSTL',0,1,NULL,2097152,NULL),(51,'CITATION_EDITOR_AUTHOR_QUERY',0,1,NULL,NULL,4),(52,'REVISED_VERSION_NOTIFY',0,1,NULL,16,3),(53,'STATISTICS_REPORT_NOTIFICATION',1,1,16,17,NULL),(54,'ANNOUNCEMENT',0,1,16,1048576,NULL),(55,'ORCID_COLLECT_AUTHOR_ID',0,1,NULL,NULL,NULL),(56,'ORCID_REQUEST_AUTHOR_AUTHORIZATION',0,1,NULL,NULL,NULL),(57,'MANUAL_PAYMENT_NOTIFICATION',0,1,NULL,NULL,NULL),(58,'PAYPAL_INVESTIGATE_PAYMENT',0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `email_templates_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES ('ANNOUNCEMENT','en_US','{$title}','<b>{$title}</b><br />\n<br />\n{$summary}<br />\n<br />\nVisit our website to read the <a href=\"{$url}\">full announcement</a>.','This email is sent when a new announcement is created.'),('CITATION_EDITOR_AUTHOR_QUERY','en_US','Citation Editing','{$authorFirstName},<br />\n<br />\nCould you please verify or provide us with the proper citation for the following reference from your article, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nThanks!<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}<br />\n','This email allows copyeditors to request additional information about references from authors.'),('COPYEDIT_REQUEST','en_US','Copyediting Request','{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Open any files available under Draft Files and do your copyediting, while adding any Copyediting Discussions as needed.<br />\n3. Save copyedited file(s), and upload to Copyedited panel.<br />\n4. Notify the Editor that all files have been prepared, and that the Production process may begin.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}','This email is sent by a Section Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),('EDITOR_ASSIGN','en_US','Editorial Assignment','{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as Section Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you.','This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.'),('EDITOR_DECISION_ACCEPT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission','This email from the Editor or Section Editor to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),('EDITOR_DECISION_DECLINE','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission','This email from the Editor or Section Editor to an Author notifies them of a final \"decline\" decision regarding their submission.'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Editor Decision','\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission','This email is sent to the author if the editor declines their submission initially, before the review stage'),('EDITOR_DECISION_RESUBMIT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Resubmit for Review','This email from the Editor or Section Editor to an Author notifies them of a final \"resubmit\" decision regarding their submission.'),('EDITOR_DECISION_REVISIONS','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is: Revisions Required','This email from the Editor or Section Editor to an Author notifies them of a final \"revisions required\" decision regarding their submission.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Send to Review<br />\n<br />\nSubmission URL: {$submissionUrl}','This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to an external review.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','en_US','Editor Decision','{$authorName}:<br />\n<br />\nThe editing of your submission, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nSubmission URL: {$submissionUrl}','This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to production.'),('EDITOR_RECOMMENDATION','en_US','Editor Recommendation','{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}','This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.'),('EMAIL_LINK','en_US','Article of Possible Interest','Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$articleUrl}&quot;.','This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.'),('LAYOUT_COMPLETE','en_US','Galleys Complete','{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$participantName}','This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.'),('LAYOUT_REQUEST','en_US','Request Galleys','{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the journal and use the Production Ready files to create the galleys according to the journal\'s standards.<br />\n3. Upload the galleys to the Galley Files section.<br />\n4. Notify the Editor using Production Discussions that the galleys are uploaded and ready.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.','This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),('LOCKSS_EXISTING_ARCHIVE','en_US','Archiving Request for {$contextName}','Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member], serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe URL to the LOCKSS Publisher Manifest for our journal is: {$contextUrl}/gateway/lockss<br />\n<br />\nWe understand that you are already participating in LOCKSS. If we can provide any additional metadata for purposes of registering our journal with your version of LOCKSS, we would be happy to provide it.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal\'s LOCKSS Publisher Manifest.'),('LOCKSS_NEW_ARCHIVE','en_US','Archiving Request for {$contextName}','Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member] serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe LOCKSS Program &amp;lt;http://lockss.org/&amp;gt;, an international library/publisher initiative, is a working example of a distributed preservation and archiving repository, additional details are below. The software, which runs on an ordinary personal computer is free; the system is easily brought on-line; very little ongoing maintenance is required.<br />\n<br />\nTo assist in the archiving of our journal, we invite you to become a member of the LOCKSS community, to help collect and preserve titles produced by your faculty and by other scholars worldwide. To do so, please have someone on your staff visit the LOCKSS site for information on how this system operates. I look forward to hearing from you on the feasibility of providing this archiving support for this journal.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.'),('MANUAL_PAYMENT_NOTIFICATION','en_US','Manual Payment Notification','A manual payment needs to be processed for the journal {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems\' Manual Payment plugin.','This email template is used to notify a journal manager contact that a manual payment was requested.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$contextName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('OPEN_ACCESS_NOTIFY','en_US','Issue Now Open Access','Readers:<br />\n<br />\n{$contextName} has just made available in an open access format the following issue. We invite you to review the Table of Contents here and then visit our web site ({$contextUrl}) to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.'),('ORCID_COLLECT_AUTHOR_ID','en_US','Submission ORCID','Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','This email template is used to collect the ORCID id\'s from authors.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','en_US','Requesting ORCID record access','Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n','This email template is used to request ORCID record access from authors.'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PAYPAL_INVESTIGATE_PAYMENT','en_US','Unusual PayPal Activity','Open Journal Systems has encountered unusual activity relating to PayPal payment support for the journal {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by Open Journal Systems\' PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n','This email template is used to notify a journal\'s primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),('PUBLISH_NOTIFY','en_US','New Issue Published','Readers:<br />\n<br />\n{$contextName} has just published its latest issue at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.'),('REVIEWER_REGISTER','en_US','Registration as Reviewer with {$contextName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),('REVIEW_ACK','en_US','Article Review Acknowledgement','{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.','This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),('REVIEW_CANCEL','en_US','Request for Review Cancelled','{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal\'s review process in the future.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),('REVIEW_CONFIRM','en_US','Able to Review','Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been accepted and will be completed by the specified date.'),('REVIEW_DECLINE','en_US','Unable to Review','Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been declined.'),('REVIEW_REINSTATE','en_US','Request for Review Reinstated','{$reviewerName}:<br />\n<br />\nWe would like to reinstate our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We hope that you will be able to assist with this journal\'s review process.<br />\n<br />\nIf you have any questions, please contact me.','This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that a cancelled review has been reinstated.'),('REVIEW_REMIND','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Section Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND_AUTO','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO_ONECLICK','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_ONECLICK','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Section Editor to remind a reviewer that their review is due.'),('REVIEW_REQUEST','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST_ATTACHED','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n','This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)'),('REVIEW_REQUEST_ATTACHED_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nThe Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n','This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission for a second or greater round of review. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_SUBSEQUENT.)'),('REVIEW_REQUEST_ONECLICK','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),('REVIEW_REQUEST_ONECLICK_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),('REVIEW_REQUEST_REMIND_AUTO','en_US','Article Review Request Reminder','{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REQUEST_REMIND_AUTO_ONECLICK','en_US','Article Review Request','{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REQUEST_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),('REVISED_VERSION_NOTIFY','en_US','Revised Version Uploaded','Editors:<br />\n<br />\nA revised version of &quot;{$submissionTitle}&quot; has been uploaded by the author {$authorName}.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent to the assigned editor when author uploads a revised version of an article.'),('STATISTICS_REPORT_NOTIFICATION','en_US','Editorial activity for {$month}, {$year}','\n{$name}, <br />\n<br />\nYour journal health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the journal to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published article stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$principalContactSignature}','This email is automatically sent monthly to editors and journal managers to provide them a system health overview.'),('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to an author when they complete the process of submitting a manuscript to the journal. It provides information about tracking the submission through the process and thanks the author for the submission.'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to the other authors who are not users within OJS specified during the submission process.'),('SUBSCRIPTION_AFTER_EXPIRY','en_US','Subscription Expired','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','en_US','Subscription Expired - Final Reminder','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_BEFORE_EXPIRY','en_US','Notice of Subscription Expiry','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription will soon expire. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_NOTIFY','en_US','Subscription Notification','{$subscriberName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$contextName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_PURCHASE_INDL','en_US','Subscription Purchase: Individual','An individual subscription has been purchased online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an individual subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),('SUBSCRIPTION_PURCHASE_INSTL','en_US','Subscription Purchase: Institutional','An institutional subscription has been purchased online for {$contextName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an institutional subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),('SUBSCRIPTION_RENEW_INDL','en_US','Subscription Renewal: Individual','An individual subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an individual subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),('SUBSCRIPTION_RENEW_INSTL','en_US','Subscription Renewal: Institutional','An institutional subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an institutional subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),('USER_REGISTER','en_US','Journal Registration','{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal\'s list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_VALIDATE','en_US','Validate Your Account','{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to validate their email account.');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_settings`
--

DROP TABLE IF EXISTS `email_templates_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_settings` (
  `email_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `email_settings_pkey` (`email_id`,`locale`,`setting_name`),
  KEY `email_settings_email_id` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_settings`
--

LOCK TABLES `email_templates_settings` WRITE;
/*!40000 ALTER TABLE `email_templates_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_translated` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log_settings` (
  `log_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`),
  KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'journals/1/articles/1/6aec10e884050_Naskah_Submisi_Awal_Anonim.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(2,'journals/1/articles/1/6aec10e886733_Naskah_Review_Anonim_Round1.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(3,'journals/1/articles/1/6aec10e89044e_Naskah_Revisi_Author_Round1.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(4,'journals/1/articles/1/6aec10e891b48_Naskah_Final_Draft_Copyediting.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(5,'journals/1/articles/1/6aec10e892e48_Naskah_Copyedited_Final_Hortus_Journal.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(6,'journals/1/articles/1/6aec10e8940b6_Naskah_Production_Ready_Master.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(7,'journals/1/articles/1/6aec10e895a56_Galley_Final_HJ_Vol1_No1_2026.pdf','application/pdf'),(17,'journals/1/articles/2/hj_galley_art02_v1i1_2026.pdf','application/pdf'),(18,'journals/1/articles/3/hj_galley_art03_v1i1_2026.pdf','application/pdf'),(19,'journals/1/articles/4/hj_galley_art04_v1i1_2026.pdf','application/pdf'),(20,'journals/1/articles/5/hj_galley_art05_v1i1_2026.pdf','application/pdf'),(21,'journals/1/articles/6/hj_galley_art06_v1i1_2026.pdf','application/pdf'),(22,'journals/1/articles/7/hj_galley_art07_v1i1_2026.pdf','application/pdf'),(23,'journals/1/articles/8/hj_galley_art08_v1i1_2026.pdf','application/pdf'),(24,'journals/1/articles/9/hj_galley_art09_v1i1_2026.pdf','application/pdf'),(25,'journals/1/articles/10/hj_galley_art10_v1i1_2026.pdf','application/pdf');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_groups`
--

DROP TABLE IF EXISTS `filter_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`),
  UNIQUE KEY `filter_groups_symbolic` (`symbolic`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'article=>dc11','plugins.metadata.dc11.articleAdapter.displayName','plugins.metadata.dc11.articleAdapter.description','class::classes.submission.Submission','metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),(2,'issue=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.issue.Issue[]','xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),(3,'article=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),(4,'article=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(5,'native-xml=>article','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(6,'issue=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.Issue[]','xml::schema(plugins/importexport/native/native.xsd)'),(7,'native-xml=>issue','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.Issue[]'),(8,'issuegalley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.IssueGalley[]','xml::schema(plugins/importexport/native/native.xsd)'),(9,'native-xml=>issuegalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.IssueGalley[]'),(10,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.article.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(11,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.article.Author[]'),(12,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(13,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SubmissionFile'),(14,'article-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.article.ArticleGalley','xml::schema(plugins/importexport/native/native.xsd)'),(15,'native-xml=>ArticleGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.article.ArticleGalley[]'),(16,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(17,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication'),(18,'article=>doaj-xml','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),(19,'article=>doaj-json','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.submission.Submission','primitive::string'),(20,'issue=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.issue.Issue','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(21,'article=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.submission.Submission','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(22,'galley=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.article.ArticleGalley','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(23,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(24,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),(25,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(26,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]'),(27,'article=>pubmed-xml','plugins.importexport.pubmed.displayName','plugins.importexport.pubmed.description','class::classes.submission.Submission[]','xml::dtd');
/*!40000 ALTER TABLE `filter_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_settings` (
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_settings`
--

LOCK TABLES `filter_settings` WRITE;
/*!40000 ALTER TABLE `filter_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filters` (
  `filter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filter_group_id` bigint(20) NOT NULL DEFAULT 0,
  `context_id` bigint(20) NOT NULL DEFAULT 0,
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` smallint(6) NOT NULL DEFAULT 0,
  `parent_filter_id` bigint(20) NOT NULL DEFAULT 0,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'Extract metadata from a(n) Submission','plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter',0,0,0),(2,2,0,'Crossref XML issue export','plugins.importexport.crossref.filter.IssueCrossrefXmlFilter',0,0,0),(3,3,0,'Crossref XML issue export','plugins.importexport.crossref.filter.ArticleCrossrefXmlFilter',0,0,0),(4,4,0,'Native XML submission export','plugins.importexport.native.filter.ArticleNativeXmlFilter',0,0,0),(5,5,0,'Native XML submission import','plugins.importexport.native.filter.NativeXmlArticleFilter',0,0,0),(6,6,0,'Native XML issue export','plugins.importexport.native.filter.IssueNativeXmlFilter',0,0,0),(7,7,0,'Native XML issue import','plugins.importexport.native.filter.NativeXmlIssueFilter',0,0,0),(8,8,0,'Native XML issue galley export','plugins.importexport.native.filter.IssueGalleyNativeXmlFilter',0,0,0),(9,9,0,'Native XML issue galley import','plugins.importexport.native.filter.NativeXmlIssueGalleyFilter',0,0,0),(10,10,0,'Native XML author export','plugins.importexport.native.filter.AuthorNativeXmlFilter',0,0,0),(11,11,0,'Native XML author import','plugins.importexport.native.filter.NativeXmlAuthorFilter',0,0,0),(12,13,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlArticleFileFilter',0,0,0),(13,12,0,'Native XML submission file export','lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter',0,0,0),(14,14,0,'Native XML representation export','plugins.importexport.native.filter.ArticleGalleyNativeXmlFilter',0,0,0),(15,15,0,'Native XML representation import','plugins.importexport.native.filter.NativeXmlArticleGalleyFilter',0,0,0),(16,16,0,'Native XML Publication export','plugins.importexport.native.filter.PublicationNativeXmlFilter',0,0,0),(17,17,0,'Native XML publication import','plugins.importexport.native.filter.NativeXmlPublicationFilter',0,0,0),(18,18,0,'DOAJ XML export','plugins.importexport.doaj.filter.DOAJXmlFilter',0,0,0),(19,19,0,'DOAJ JSON export','plugins.importexport.doaj.filter.DOAJJsonFilter',0,0,0),(20,20,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0),(21,21,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0),(22,22,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0),(23,23,0,'User XML user export','lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter',0,0,0),(24,24,0,'User XML user import','lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter',0,0,0),(25,25,0,'Native XML user group export','lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter',0,0,0),(26,26,0,'Native XML user group import','lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter',0,0,0),(27,27,0,'ArticlePubMedXmlFilter','plugins.importexport.pubmed.filter.ArticlePubMedXmlFilter',0,0,0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_settings`
--

DROP TABLE IF EXISTS `genre_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre_settings` (
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `genre_settings_pkey` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_settings`
--

LOCK TABLES `genre_settings` WRITE;
/*!40000 ALTER TABLE `genre_settings` DISABLE KEYS */;
INSERT INTO `genre_settings` VALUES (1,'en_US','name','Article Text','string'),(2,'en_US','name','Research Instrument','string'),(3,'en_US','name','Research Materials','string'),(4,'en_US','name','Research Results','string'),(5,'en_US','name','Transcripts','string'),(6,'en_US','name','Data Analysis','string'),(7,'en_US','name','Data Set','string'),(8,'en_US','name','Source Texts','string'),(9,'en_US','name','Multimedia','string'),(10,'en_US','name','Image','string'),(11,'en_US','name','HTML Stylesheet','string'),(12,'en_US','name','Other','string');
/*!40000 ALTER TABLE `genre_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `genre_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `seq` bigint(20) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1,
  `category` bigint(20) NOT NULL DEFAULT 1,
  `dependent` smallint(6) NOT NULL DEFAULT 0,
  `supplementary` smallint(6) NOT NULL DEFAULT 0,
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,1,0,1,1,0,0,'SUBMISSION'),(2,1,1,1,3,0,1,'RESEARCHINSTRUMENT'),(3,1,2,1,3,0,1,'RESEARCHMATERIALS'),(4,1,3,1,3,0,1,'RESEARCHRESULTS'),(5,1,4,1,3,0,1,'TRANSCRIPTS'),(6,1,5,1,3,0,1,'DATAANALYSIS'),(7,1,6,1,3,0,1,'DATASET'),(8,1,7,1,3,0,1,'SOURCETEXTS'),(9,1,8,1,1,1,1,'MULTIMEDIA'),(10,1,9,1,2,1,0,'IMAGE'),(11,1,10,1,1,1,0,'STYLE'),(12,1,11,1,3,0,1,'OTHER');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutional_subscription_ip`
--

DROP TABLE IF EXISTS `institutional_subscription_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutional_subscription_ip` (
  `institutional_subscription_ip_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint(20) NOT NULL,
  `ip_end` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_ip_id`),
  KEY `institutional_subscription_ip_subscription_id` (`subscription_id`),
  KEY `institutional_subscription_ip_start` (`ip_start`),
  KEY `institutional_subscription_ip_end` (`ip_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutional_subscription_ip`
--

LOCK TABLES `institutional_subscription_ip` WRITE;
/*!40000 ALTER TABLE `institutional_subscription_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscription_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutional_subscriptions`
--

DROP TABLE IF EXISTS `institutional_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutional_subscriptions` (
  `institutional_subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_id`),
  KEY `institutional_subscriptions_subscription_id` (`subscription_id`),
  KEY `institutional_subscriptions_domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutional_subscriptions`
--

LOCK TABLES `institutional_subscriptions` WRITE;
/*!40000 ALTER TABLE `institutional_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_files`
--

DROP TABLE IF EXISTS `issue_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `content_type` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `issue_files_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_files`
--

LOCK TABLES `issue_files` WRITE;
/*!40000 ALTER TABLE `issue_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_galley_settings`
--

DROP TABLE IF EXISTS `issue_galley_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `issue_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `issue_galley_settings_galley_id` (`galley_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_galley_settings`
--

LOCK TABLES `issue_galley_settings` WRITE;
/*!40000 ALTER TABLE `issue_galley_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_galley_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_galleys`
--

DROP TABLE IF EXISTS `issue_galleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `issue_galleys_issue_id` (`issue_id`),
  KEY `issue_galleys_url_path` (`url_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_galleys`
--

LOCK TABLES `issue_galleys` WRITE;
/*!40000 ALTER TABLE `issue_galleys` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_settings`
--

DROP TABLE IF EXISTS `issue_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_settings` (
  `issue_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_settings_pkey` (`issue_id`,`locale`,`setting_name`),
  KEY `issue_settings_issue_id` (`issue_id`),
  KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_settings`
--

LOCK TABLES `issue_settings` WRITE;
/*!40000 ALTER TABLE `issue_settings` DISABLE KEYS */;
INSERT INTO `issue_settings` VALUES (1,'en_US','coverImage','cover_issue_1.png','string'),(1,'en_US','coverImageAltText','Cover Hortus Journal Vol. 1 No. 1 (2026)','string'),(1,'en_US','description','<p><strong>Edisi Perdana (Vol. 1 No. 1, Desember 2026)</strong> dari <em>Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences</em> menyajikan hasil-hasil riset unggulan terkait integrasi teknologi <em>Smart &amp; Precision Plantation</em> (wahana UAV multispektral dan jaringan sensor IoT kanopi), pemuliaan dan fisiologi tanaman perkebunan tropika, pengendalian hayati terpadu, serta valorisasi biomassa menuju agroindustri sirkular berkelanjutan berstandar ISPO/RSPO.</p>','string'),(1,'en_US','title','Inaugural Edition: Precision Plantation, Biotechnology & Circular Agro-Industry','string');
/*!40000 ALTER TABLE `issue_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `issue_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `volume` smallint(6) DEFAULT NULL,
  `number` varchar(40) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `published` smallint(6) NOT NULL DEFAULT 0,
  `current` smallint(6) NOT NULL DEFAULT 0,
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `access_status` smallint(6) NOT NULL DEFAULT 1,
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` smallint(6) NOT NULL DEFAULT 0,
  `show_number` smallint(6) NOT NULL DEFAULT 0,
  `show_year` smallint(6) NOT NULL DEFAULT 0,
  `show_title` smallint(6) NOT NULL DEFAULT 0,
  `style_file_name` varchar(90) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL,
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `issues_journal_id` (`journal_id`),
  KEY `issues_url_path` (`url_path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,1,1,'1',2026,1,1,'2026-11-05 10:00:00','2026-11-05 10:05:00','2026-11-05 06:15:20',1,NULL,1,1,1,1,NULL,NULL,'vol1-no1-2026');
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_views`
--

DROP TABLE IF EXISTS `item_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_views` (
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_last_viewed` datetime DEFAULT NULL,
  UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_views`
--

LOCK TABLES `item_views` WRITE;
/*!40000 ALTER TABLE `item_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_settings`
--

DROP TABLE IF EXISTS `journal_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_settings` (
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  `setting_type` varchar(6) DEFAULT NULL,
  UNIQUE KEY `journal_settings_pkey` (`journal_id`,`locale`,`setting_name`),
  KEY `journal_settings_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_settings`
--

LOCK TABLES `journal_settings` WRITE;
/*!40000 ALTER TABLE `journal_settings` DISABLE KEYS */;
INSERT INTO `journal_settings` VALUES (1,'','agencies','request',NULL),(1,'','citations','request',NULL),(1,'','contactEmail','yanuar.rizky@hortus.ac.id',NULL),(1,'','contactName','Mohammad Yanuar Rizky',NULL),(1,'','contactPhone','+62-341-551312',NULL),(1,'','copyrightHolderType','author',NULL),(1,'','copyrightYearBasis','submission',NULL),(1,'','coverage','request',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','disciplines','request',NULL),(1,'','emailSignature','<br/>\n________________________________________________________________________<br/>\n<a href=\"http://localhost/ojs/index.php/Horsju\">Hortus Journal</a>',NULL),(1,'','enableAnnouncements','1',NULL),(1,'','enableClockss','1',NULL),(1,'','enableLockss','1',NULL),(1,'','enableOai','1',NULL),(1,'','enablePublisherId','[\"publication\"]',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','languages','request',NULL),(1,'','licenseUrl','https://creativecommons.org/licenses/by/4.0',NULL),(1,'','mailingAddress','Jl. Semarang No. 5, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145, Indonesia',NULL),(1,'','membershipFee','0',NULL),(1,'','numAnnouncementsHomepage','3',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','1',NULL),(1,'','numWeeksPerReview','3',NULL),(1,'','onlineIssn','2988-741X',NULL),(1,'','printIssn','2988-7401',NULL),(1,'','publicationFee','0',NULL),(1,'','publisherInstitution','Departemen Agrosains & UPT Perpustakaan Universitas Negeri Malang',NULL),(1,'','publisherUrl','https://um.ac.id',NULL),(1,'','publishingMode','0',NULL),(1,'','purchaseArticleFee','0',NULL),(1,'','rateReviewerOnQuality','1',NULL),(1,'','restrictReviewerFileAccess','1',NULL),(1,'','rights','request',NULL),(1,'','showEnsuringLink','1',NULL),(1,'','source','request',NULL),(1,'','styleSheet','{\"name\":\"styleSheet.css\",\"uploadName\":\"styleSheet.css\",\"dateUploaded\":\"2026-11-05 06:15:17\"}',NULL),(1,'','subjects','request',NULL),(1,'','supportedFormLocales','[\"en_US\"]',NULL),(1,'','supportedLocales','[\"en_US\"]',NULL),(1,'','supportedSubmissionLocales','[\"en_US\"]',NULL),(1,'','supportEmail','support@hortus.ac.id',NULL),(1,'','supportName','Mohammad Yanuar Rizky',NULL),(1,'','supportPhone','+62-341-551313',NULL),(1,'','themePluginPath','default',NULL),(1,'','type','request',NULL),(1,'en_US','abbreviation','Hortus J.',NULL),(1,'en_US','about','<h3>Visi &amp; Misi Jurnal</h3>\n<p><strong>Visi:</strong> Menjadi jurnal ilmiah Akses Terbuka terdepan dan bereputasi global di kawasan Asia Tenggara dalam memajukan ilmu pengetahuan, teknologi terapan, dan keberlanjutan ekosistem perkebunan tropika berbasis sains terbuka pada tahun 2032.</p>\n<p><strong>Misi:</strong></p>\n<ol>\n<li>Menyelenggarakan penerbitan berkala ilmiah Akses Terbuka Berlian (<em>Diamond Open Access</em>) yang mengedepankan integritas keilmuan, transparansi editorial, dan telaah sejawat bermutu tinggi (<em>double-blind peer review</em>) tanpa hambatan finansial.</li>\n<li>Memfasilitasi diseminasi dan preservasi temuan riset mutakhir di bidang sains tanaman perkebunan tropis, teknologi pertanian presisi, dan agroindustri sirkular ramah lingkungan.</li>\n<li>Membangun kolaborasi ilmiah lintas disiplin yang menghubungkan akademisi, balai penelitian pemerintah (BRIN/PPKS/ICCRI), praktisi industri agribisnis, dan asosiasi pekebun mandiri.</li>\n<li>Menerapkan tata kelola penerbitan berstandar internasional yang mematuhi pedoman etika publikasi COPE serta memenuhi kriteria indeksasi DOAJ dan akreditasi nasional SINTA.</li>\n</ol>\n\n<h3>Fokus dan Ruang Lingkup (Focus &amp; Scope)</h3>\n<p><strong>Hortus Journal</strong> mempublikasikan naskah ilmiah orisinal di bidang perkebunan tropika dan agroindustri berkelanjutan, meliputi 5 (lima) bagian subjek utama:</p>\n<ul>\n<li><strong>Agronomy, Physiology &amp; Plantation Breeding:</strong> Bioteknologi tanaman tahunan (sawit, karet, kopi, kakao, tebu, teh), kultur jaringan, marka molekuler, fisiologi cekaman iklim, serta manajemen kesuburan tanah gambut dan mineral.</li>\n<li><strong>Integrated Bio-Protection &amp; Ecosystem Health:</strong> Pengendalian hama dan penyakit tanaman perkebunan terpadu, agen antagonis hayati, epidemiologi patogen tropis, dan konservasi biodiversitas agroforestri.</li>\n<li><strong>Smart &amp; Precision Plantation Farming:</strong> Penginderaan jauh wahana UAV/drone multispektral dan hiperspektral, jaringan sensor Internet of Things (IoT) kanopi dan tanah, sistem informasi geografis (WebGIS), serta pemodelan kecerdasan buatan (AI/Machine Learning) estimasi hasil panen.</li>\n<li><strong>Postharvest, Biomass &amp; Circular Agro-Industry:</strong> Teknologi pengolahan pascapanen komoditas perkebunan, ekstraksi senyawa bioaktif, konversi limbah biomassa (tandan kosong kelapa sawit, POME, kulit kopi/kakao) menjadi bioproduk dan bioenergi sirkular.</li>\n<li><strong>Socio-Economics &amp; Sustainability Certification:</strong> Analisis rantai pasok agribisnis, tata kelola dan audit sertifikasi keberlanjutan (ISPO, RSPO, Rainforest Alliance), ekonomi karbon perkebunan, serta pemberdayaan kelembagaan pekebun swadaya.</li>\n</ul>\n\n<h3>Kebijakan Penelaahan Sejawat (Peer Review Policy)</h3>\n<p>Mengacu pada prinsip penjaminan mutu ilmiah (Solomon, 2008; Suber, 2012), <strong>Hortus Journal</strong> menerapkan model <strong>Double-Blind Peer Review</strong> (Penelaahan Sejawat Buta Ganda):</p>\n<ol>\n<li><strong>Kerahasiaan Identitas Ganda:</strong> Identitas penulis (<em>Author</em>) dan mitra bebestari (<em>Reviewer</em>) saling dirahasiakan selama seluruh tahapan evaluasi untuk mengeliminasi bias institusional, geografis, senioritas, maupun gender, sehingga naskah dinilai murni berdasarkan kebaruan ilmiah (<em>novelty</em>), ketepatan metodologi, dan kontribusi akademisnya.</li>\n<li><strong>Seleksi Awal (Initial Desk Screening):</strong> Setiap naskah yang diunggah melalui penyaringan awal oleh <em>Managing Editor</em> dan <em>Editor-in-Chief</em> dalam waktu <strong>3–5 hari kerja</strong> untuk memeriksa kesesuaian ruang lingkup (<em>Focus &amp; Scope</em>), kepatuhan struktur IMRAD, anonimitas berkas (<em>blind manuscript</em>), serta uji kemiripan menggunakan Turnitin/iThenticate dengan ambang batas maksimal <strong>&le; 20%</strong>.</li>\n<li><strong>Penugasan Mitra Bebestari:</strong> Naskah yang lolos seleksi awal diteruskan kepada <em>Section Editor</em> sesuai kepakaran untuk ditugaskan kepada minimal <strong>2 (dua) Reviewer independen</strong> bergelar Doktor (Ph.D.) atau pakar aktif bereputasi dengan rekam jejak publikasi terindeks di bidang terkait.</li>\n<li><strong>Target Waktu Evaluasi (Review SLA):</strong> Mitra bebestari diberikan waktu maksimal <strong>7 hari</strong> untuk merespons undangan, dan <strong>2–4 minggu (14–28 hari kalender)</strong> sejak penugasan diterima untuk menyelesaikan pengisian Formulir Evaluasi Terstruktur (<em>Structured Review Form</em>). Siklus putusan editorial pertama ditargetkan tuntas dalam <strong>4–6 minggu</strong> sejak pengajuan.</li>\n<li><strong>Kriteria Keputusan Editorial (Editorial Decisions):</strong>\n<ul>\n<li><strong>Accept Submission (Diterima Tanpa Revisi):</strong> Naskah memiliki orisinalitas sangat tinggi, metodologi dan analisis statistik valid tanpa cacat, pembahasan tajam, serta mematuhi gaya selingkung sepenuhnya sehingga langsung dilanjutkan ke tahap <em>Copyediting</em>.</li>\n<li><strong>Revisions Required (Diterima dengan Revisi Minor):</strong> Naskah memiliki substansi dan metodologi yang kuat namun memerlukan perbaikan minor pada kejelasan narasi, kelengkapan penyajian tabel/grafik, atau pemutakhiran referensi. Penulis diberi waktu <strong>7–14 hari</strong> untuk mengunggah revisi yang akan diverifikasi langsung oleh <em>Section Editor</em> tanpa perlu putaran review ulang.</li>\n<li><strong>Resubmit for Review (Revisi Mayor &amp; Telaah Ulang):</strong> Naskah memiliki potensi kebaruan topik yang relevan namun terdapat kelemahan substansial pada desain metodologi, kedalaman analisis statistik, atau argumentasi pembahasan. Penulis wajib melakukan perombakan komprehensif dalam waktu <strong>14–21 hari</strong> untuk dievaluasi kembali oleh Reviewer pada Putaran Kedua (<em>Round 2</em>).</li>\n<li><strong>Decline Submission (Ditolak):</strong> Naskah ditolak apabila berada di luar ruang lingkup jurnal (<em>out of scope</em>), memiliki cacat metodologi fatal, tidak memiliki kebaruan ilmiah, melampaui batas kemiripan plagiarisme (&gt;20%), atau tidak memenuhi standar mutu ilmiah berdasarkan rekomendasi objektif Reviewer.</li>\n</ul>\n</li>\n<li><strong>Penyelesaian Perbedaan Rekomendasi (Adjudication):</strong> Apabila kedua Reviewer memberikan rekomendasi yang bertolak belakang secara ekstrem (satu <em>Accept</em> dan satu <em>Decline</em>), <em>Section Editor</em> menugaskan <strong>Reviewer Ketiga (Adjudicator)</strong> sebelum <em>Editor-in-Chief</em> menetapkan keputusan akhir.</li>\n</ol>',NULL),(1,'en_US','acronym','HJ',NULL),(1,'en_US','authorGuidelines','<h3>Panduan Penulis (Instructions for Authors)</h3>\n<p>Penulis yang mengajukan naskah ke <strong>Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences</strong> wajib mematuhi ketentuan struktur penulisan, gaya selingkung, format sitasi, dan etika publikasi berikut:</p>\n\n<h4>1. Struktur Artikel Ilmiah (Format IMRAD)</h4>\n<p>Naskah harus disusun secara sistematis mengikuti struktur standar <strong>IMRAD (<em>Introduction, Methods, Results, and Discussion</em>)</strong> dengan panjang naskah antara <strong>4.000 hingga 7.500 kata</strong> (untuk <em>Original Research Article</em>) atau <strong>5.000 hingga 9.000 kata</strong> (untuk <em>Review Article</em>), termasuk tabel, gambar, dan daftar rujukan:</p>\n<ul>\n<li><strong>Judul Naskah (Title):</strong> Ringkas, spesifik, dan informatif (maksimal <strong>18 kata</strong> dalam Bahasa Indonesia atau Bahasa Inggris), mencantumkan nama ilmiah spesies tanaman secara cetak miring (<em>italics</em>), tanpa singkatan tidak baku.</li>\n<li><strong>Identitas &amp; Anonimitas (Blind Manuscript):</strong> Karena jurnal menerapkan <em>Double-Blind Peer Review</em>, berkas naskah utama (<em>Main Manuscript File</em>) yang diunggah pada Tahap 1 <strong>TIDAK BOLEH mencantumkan nama penulis, afiliasi, maupun ucapan terima kasih yang mengungkap identitas</strong>. Metadata lengkap penulis diinput pada formulir metadata OJS dan diunggah terpisah sebagai berkas <em>Title Page</em>.</li>\n<li><strong>Abstrak (Abstract) &amp; Kata Kunci (Keywords):</strong> Ditulis dalam satu paragraf terstruktur (<strong>150–250 kata</strong>) dalam Bahasa Indonesia dan Bahasa Inggris yang merangkum latar belakang singkat, tujuan, metode, temuan kuantitatif utama (nilai signifikansi/akurasi), dan implikasi kesimpulan. Dilengkapi <strong>4–6 kata kunci</strong> yang disusun alfabetis dan dipisahkan dengan tanda titik koma (;).</li>\n<li><strong>1. Pendahuluan (Introduction):</strong> Menguraikan konteks permasalahan strategis di sektor perkebunan/agroindustri, kajian pustaka mutakhir (<em>state of the art</em>), analisis kesenjangan riset (<em>research gap</em>), kebaruan ilmiah (<em>novelty</em>), dan rumusan tujuan penelitian secara eksplisit pada paragraf akhir.</li>\n<li><strong>2. Metode Penelitian (Materials and Methods):</strong> Menjelaskan lokasi dan waktu penelitian, bahan genetik/varietas tanaman, spesifikasi instrumen/sensor, rancangan percobaan, prosedur akuisisi data, serta metode analisis statistik atau algoritma pemodelan secara rinci agar penelitian dapat direplikasi (<em>reproducible</em>).</li>\n<li><strong>3. Hasil dan Pembahasan (Results and Discussion):</strong> Menyajikan temuan riset secara logis didukung tabel dan ilustrasi beresolusi tinggi (minimal 300 DPI), disertai interpretasi ilmiah mendalam yang mengaitkan hasil temuan dengan mekanisme fisiologis/agronomis serta membandingkannya terhadap literatur primer terkini.</li>\n<li><strong>4. Kesimpulan (Conclusion):</strong> Berisi jawaban ringkas atas tujuan penelitian dalam satu paragraf padat tanpa mengulang angka statistik secara berlebihan, dilengkapi rekomendasi aplikatif bagi industri perkebunan, pekebun, atau kebijakan keberlanjutan.</li>\n<li><strong>Daftar Rujukan (References):</strong> Memuat seluruh pustaka yang disitasi dalam teks. Minimal <strong>25 referensi</strong> untuk artikel riset (minimal <strong>80% berasal dari artikel jurnal bereputasi terbitan 10 tahun terakhir</strong> disertai tautan DOI aktif).</li>\n</ul>\n\n<h4>2. Gaya Selingkung &amp; Format Tipografi</h4>\n<ul>\n<li><strong>Format Berkas:</strong> Microsoft Word (<code>.docx</code> / <code>.doc</code>) atau OpenDocument (<code>.odt</code>), ukuran kertas A4 (210 &times; 297 mm), margin atas, bawah, kiri, dan kanan masing-masing <strong>2,5 cm</strong>.</li>\n<li><strong>Tipografi:</strong> Huruf <strong>Times New Roman ukuran 11 pt</strong> untuk teks utama, spasi <strong>1,15</strong>, perataan kanan-kiri (<em>justified</em>), satu kolom. Judul artikel 15 pt tebal (<em>bold</em>), dan abstrak 10 pt spasi 1,0.</li>\n<li><strong>Satuan &amp; Tata Nama Ilmiah:</strong> Wajib menggunakan Sistem Satuan Internasional (SI) seperti <code>ton/ha/tahun</code>, <code>mg/L</code>, <code>&mu;mol m<sup>-2</sup> s<sup>-1</sup></code>. Nama ilmiah tanaman, serangga, dan patogen ditulis miring sesuai kode tatanama binomial (contoh: <em>Elaeis guineensis</em> Jacq., <em>Ganoderma boninense</em>).</li>\n<li><strong>Tabel &amp; Gambar:</strong> Tabel menggunakan format garis horizontal terbuka (<em>three-line table</em> tanpa garis vertikal) dengan judul di atas tabel. Gambar/grafik diberi keterangan (<em>caption</em>) di bawah gambar.</li>\n</ul>\n\n<h4>3. Format Sitasi &amp; Daftar Rujukan (APA 7th Edition)</h4>\n<p><strong>Hortus Journal</strong> menerapkan gaya sitasi <strong>American Psychological Association (APA) Edisi ke-7 (<em>APA 7th Edition Style</em>)</strong> dengan sistem nama-tahun (<em>author-date</em>). Penulis sangat diwajibkan menggunakan perangkat lunak manajemen referensi seperti <strong>Mendeley, Zotero, atau EndNote</strong>:</p>\n<ul>\n<li><strong>Sitasi dalam Teks:</strong> Satu penulis: (Suber, 2012); Dua penulis: (Solomon &amp; Willinsky, 2008); Tiga penulis atau lebih: (Syukurillah et al., 2026).</li>\n<li><strong>Format Daftar Rujukan:</strong> Disusun alfabetis dan kronologis dengan indentasi menggantung (<em>hanging indent</em> 1,27 cm) serta mencantumkan URL DOI penuh (<code>https://doi.org/...</code>).</li>\n</ul>\n\n<h4>4. Etika Publikasi, Anti-Plagiarisme, dan Lisensi Terbuka</h4>\n<ul>\n<li><strong>Keaslian &amp; Anti-Plagiarisme:</strong> Naskah harus murni karya orisinal penulis, belum pernah dipublikasikan, dan tidak sedang dipertimbangkan di jurnal lain. Setiap naskah wajib melalui pemindaian kemiripan teks menggunakan <strong>Turnitin / iThenticate</strong> dengan batas toleransi kemiripan keseluruhan maksimal <strong>&le; 20%</strong> (dan maksimal 3% dari satu sumber tunggal). Tindak plagiarisme, fabrikasi data, falsifikasi, dan publikasi ganda akan ditindak tegas sesuai pedoman <strong>COPE (<em>Committee on Publication Ethics</em>)</strong>.</li>\n<li><strong>Pernyataan Bebas Konflik Kepentingan (Competing Interests):</strong> Seluruh penulis wajib mendeklarasikan sumber pendanaan riset dan menyatakan ketiadaan konflik kepentingan finansial maupun komersial yang dapat memengaruhi objektivitas hasil penelitian.</li>\n<li><strong>Hak Cipta &amp; Lisensi Creative Commons:</strong> Penulis memegang hak cipta penuh (<em>Author retains copyright</em>) atas karyanya dan memberikan hak publikasi pertama kepada <strong>Hortus Journal</strong>. Seluruh artikel diterbitkan di bawah lisensi <strong><a href=\"https://creativecommons.org/licenses/by/4.0/\" target=\"_blank\">Creative Commons Attribution 4.0 International (CC BY 4.0)</a></strong> yang mengizinkan siapa saja mengunduh, membagikan, menyadur, dan memanfaatkan karya untuk tujuan apa pun sepanjang mencantumkan kredit sitasi kepada penulis asli dan jurnal.</li>\n</ul>',NULL),(1,'en_US','authorInformation','Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost/ojs/index.php/Horsju/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost/ojs/index.php/Horsju/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/ojs/index.php/Horsju/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost/ojs/index.php/index/login\">log in</a> and begin the five-step process.',NULL),(1,'en_US','clockssLicense','This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>',NULL),(1,'en_US','competingInterests','<p>Seluruh penulis (<em>Authors</em>) dan mitra bebestari (<em>Reviewers</em>) wajib mengungkapkan setiap potensi konflik kepentingan finansial, institusional, maupun personal (<em>Competing Interests / Conflict of Interest</em>) yang dapat memengaruhi objektivitas penelitian atau proses evaluasi naskah. Penulis wajib mencantumkan pernyataan bebas konflik kepentingan dan sumber pendanaan riset pada bagian akhir naskah.</p>',NULL),(1,'en_US','contactAffiliation','Departemen Agrosains & UPT Perpustakaan Universitas Negeri Malang',NULL),(1,'en_US','copyrightNotice','<div class=\"policy_section\"><h3 class=\"policy_h2\">1. Perjanjian Publikasi (Author Agreement) &amp; Retensi Hak Cipta (Rights Retention)</h3><ul class=\"policy_list\"><li><strong>Kepemilikan Hak Cipta Penuh (Rights Retention):</strong> Penulis yang menerbitkan artikel pada <em>Hortus Journal</em> tetap memegang 100% hak cipta (<em>copyright owner</em>) tanpa pengalihan hak cipta eksklusif kepada jurnal (Solomon, 2008).</li><li><strong>Izin Publikasi Pertama (License to Publish):</strong> Penulis memberikan hak publikasi pertama non-eksklusif (<em>first publication rights</em>) kepada <em>Hortus Journal</em> untuk menyunting, memproduksi Galley PDF, dan mengindeks artikel di basis data internasional (DOAJ, Crossref, Dimensions, GARUDA).</li><li><strong>Pengarsipan Mandiri (Self-Archiving / Green OA):</strong> Penulis diizinkan mengarsipkan versi <em>Preprint</em>, <em>Postprint (Accepted Manuscript)</em>, dan <em>Version of Record (VoR / Publisher\'s PDF)</em> ke Repositori Institusi atau repositori subjek dengan <strong>Zero Embargo</strong>.</li></ul><div class=\"cc_badge_box\"><div class=\"cc_logo_pill\">CC BY 4.0</div><div>Seluruh artikel diterbitkan di bawah lisensi <strong>Creative Commons Attribution 4.0 International (CC BY 4.0)</strong> (<a href=\"https://creativecommons.org/licenses/by/4.0/\" target=\"_blank\">https://creativecommons.org/licenses/by/4.0/</a>) yang mengizinkan penggunaan kembali, pengubahan, dan redistribusi bebas selama mencantumkan atribusi penulis asli &amp; DOI.</div></div></div><div class=\"policy_section\"><h3 class=\"policy_h2\">2. Kebijakan Keberlanjutan Finansial &amp; Transparansi Biaya <span class=\"badge_diamond\">Diamond / Platinum OA — Rp 0 APC</span></h3><p class=\"policy_p\">Mengacu pada kerangka ekonomi Akses Terbuka (Suber, 2012), <em>Hortus Journal</em> menerapkan model <strong>Diamond Open Access (Subsidi Kelembagaan)</strong> yang didanai penuh oleh konsorsium anggaran publikasi <strong>Departemen Agrosains &amp; UPT Perpustakaan Universitas Negeri Malang</strong>:</p><table class=\"cost_table\"><thead><tr><th>Komponen Layanan Penerbitan</th><th>Biaya Penulis / Pembaca</th><th>Sumber Pembiayaan &amp; Alokasi Subsidi Institusi</th></tr></thead><tbody><tr><td><strong>Submission &amp; Peer Review Fee</strong> (Uji Turnitin &amp; <em>Double-Blind Review</em>)</td><td><strong>Rp 0 (Gratis / Free)</strong></td><td>Subsidi Kelembagaan (40% — Sistem Editorial &amp; Insentif Mitra Bebestari)</td></tr><tr><td><strong>Article Processing Charge (APC)</strong> (<em>Copyediting</em> &amp; Layout Galley PDF/XML)</td><td><strong>Rp 0 (Gratis / Free)</strong></td><td>Subsidi Kelembagaan (30% — Produksi Tata Letak &amp; Penyuntingan Bahasa)</td></tr><tr><td><strong>Registrasi DOI Crossref, Hosting OJS &amp; Preservasi PKP PN / LOCKSS</strong></td><td><strong>Rp 0 (Gratis / Free)</strong></td><td>Subsidi Kelembagaan (30% — Infrastruktur Server UPT Perpustakaan &amp; DOI)</td></tr></tbody></table></div><div class=\"policy_section\"><h3 class=\"policy_h2\">3. Kebijakan Pembebasan Biaya (APC Waiver Policy) &amp; Financial-Editorial Firewall</h3><ul class=\"policy_list\"><li><strong>Pembebasan Biaya Otomatis 100% (Universal Full Waiver):</strong> Seluruh penulis dalam dan luar negeri (termasuk peneliti independen, mahasiswa, dan peneliti tanpa hibah riset) memperoleh <strong>pembebasan biaya publikasi 100% secara otomatis</strong>. Apabila di masa mendatang diberlakukan skema kontribusi biaya, penulis tanpa dana riset atau dari negara berkembang (<em>low-income countries</em>) tetap dijamin memperoleh 100% <em>APC Waiver</em> melalui pernyataan tertulis saat submisi.</li><li><strong>Independensi Keputusan Editorial (Financial-Editorial Firewall):</strong> Keputusan penerimaan atau penolakan naskah ditetapkan <strong>secara independen</strong> oleh Dewan Editor dan Mitra Bebestari murni berdasarkan bobot mutu ilmiah, validitas metodologi, dan etika COPE. Tim editor dan reviewer tidak memiliki akses terhadap status pendanaan penulis sehingga bebas dari konflik kepentingan finansial.</li></ul></div>',NULL),(1,'en_US','description','<p><strong>Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences</strong> (<em>Hortus J.</em> | p-ISSN: 2988-7401 | e-ISSN: 2988-741X) adalah jurnal ilmiah berkala Akses Terbuka Berlian (<em>Diamond Open Access</em>) yang diterbitkan dua kali setahun (Juni dan Desember) oleh Departemen Agrosains dan UPT Perpustakaan Universitas Negeri Malang. Jurnal ini mempublikasikan artikel riset orisinal, reviu literatur kritis, dan studi kasus terapan pada bidang sains perkebunan tropika berkelanjutan, bioteknologi pemuliaan tanaman tahunan, proteksi hayati terpadu, <em>Smart &amp; Precision Plantation Farming</em> (IoT, UAV multispektral, AI), pengolahan biomassa &amp; bioekonomi sirkular, serta sertifikasi keberlanjutan agribisnis (ISPO/RSPO).</p>\n<p>Seluruh naskah yang masuk dievaluasi secara ketat dan objektif menggunakan mekanisme <strong>Penelaahan Sejawat Buta Ganda (<em>Double-Blind Peer Review</em>)</strong> oleh sekurang-kurangnya dua mitra bebestari (<em>reviewer</em>) independen dengan target waktu evaluasi <strong>2–4 minggu</strong>. Jurnal ini sepenuhnya bebas biaya pengajuan maupun pemrosesan artikel (<em>Zero APC / Free of Charge</em>) dan dilisensikan di bawah <a href=\"https://creativecommons.org/licenses/by/4.0/\" target=\"_blank\">Creative Commons Attribution 4.0 International License (CC BY 4.0)</a>.</p>',NULL),(1,'en_US','editorialTeam','<h4>Pemimpin Redaksi</h4>\n<ul>\n<li><strong>Lidya Amalia Rahmania, S.Kom, M.Kom</strong> – <em>Universitas Negeri Malang, Indonesia</em><br/>Bertanggung jawab atas kebijakan strategis ilmiah, pengawasan etika publikasi COPE, seleksi kelayakan awal, dan penetapan keputusan akhir penerbitan naskah.</li>\n</ul>\n\n<h4>Journal Manager &amp; Managing Editor</h4>\n<ul>\n<li><strong>Mohammad Yanuar Rizky</strong> (NIM 250911718423) – <em>Universitas Negeri Malang, Indonesia</em><br/>Mengoordinasi arsitektur sistem OJS, konfigurasi hak akses peran pengguna (<em>user roles</em>), verifikasi kemiripan Turnitin (&le;20%), pengawasan SLA alur kerja editorial, dan manajemen terbitan berkala.</li>\n</ul>\n\n<h4>Section Editors</h4>\n<ul>\n<li><strong>Nirmala Dwi Lestari</strong> (NIM 250911723861) – <em>Universitas Negeri Malang, Indonesia</em><br/>Mengelola penelaahan sejawat buta ganda (<em>Double-Blind Peer Review</em>) pada bagian subjek keilmuan, menugaskan mitra bebestari, dan memvalidasi perbaikan revisi naskah penulis.</li>\n</ul>\n\n<h4>Layout Editor, Copyeditor &amp; Production Team</h4>\n<ul>\n<li><strong>Nayla Syukurillah</strong> (NIM 250911721564) – <em>Universitas Negeri Malang, Indonesia</em><br/>Bertanggung jawab atas penyuntingan bahasa ilmiah dan gaya selingkung (<em>Copyediting</em>), tata letak pracetak artikel, serta produksi berkas tampilan akhir (<em>Galley PDF</em>).</li>\n</ul>',NULL),(1,'en_US','favicon','{\"name\":\"favicon.png\",\"uploadName\":\"favicon.png\",\"width\":64,\"height\":64,\"dateUploaded\":\"2026-11-05 06:15:17\",\"altText\":\"HJ Favicon\"}',NULL),(1,'en_US','homepageImage','{\"name\":\"homepageImage.png\",\"uploadName\":\"homepageImage.png\",\"width\":1280,\"height\":340,\"dateUploaded\":\"2026-11-05 06:15:17\",\"altText\":\"Hortus Journal Editorial Spread\"}',NULL),(1,'en_US','journalThumbnail','{\"name\":\"journalThumbnail.png\",\"uploadName\":\"journalThumbnail.png\",\"width\":300,\"height\":400,\"dateUploaded\":\"2026-11-05 06:15:17\",\"altText\":\"Hortus Journal Thumbnail\"}',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),(1,'en_US','licenseTerms','<p>This work is licensed under a <a rel=\"license\" href=\"https://creativecommons.org/licenses/by/4.0/\" target=\"_blank\">Creative Commons Attribution 4.0 International License (CC BY 4.0)</a>.</p><p><strong>1. Retensi Hak Cipta (Rights Retention):</strong> Penulis yang menerbitkan artikel pada <em>Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences</em> tetap memegang hak cipta penuh (100% <em>copyright ownership</em>) dan hak moral atas karyanya tanpa pengalihan hak cipta eksklusif kepada penerbit (Solomon, 2008; Suber, 2012).</p><p><strong>2. Izin Publikasi Pertama (License to Publish):</strong> Penulis memberikan izin non-eksklusif kepada <em>Hortus Journal</em> sebagai penerbit pertama (<em>first publication rights</em>) untuk menyunting, memproduksi Galley PDF, mendistribusikan secara daring dalam skema <em>Diamond Open Access (Rp 0 APC)</em>, dan mengindeks artikel pada basis data ilmiah internasional (DOAJ, Crossref, Google Scholar, Dimensions, GARUDA).</p><p><strong>3. Lisensi Terbuka (CC BY 4.0):</strong> Setiap artikel diterbitkan di bawah lisensi <strong>Creative Commons Attribution 4.0 International (CC BY 4.0)</strong> yang mengizinkan siapa saja membaca, mengunduh, menyalin, mendistribusikan, dan mengadaptasi karya untuk tujuan apa pun (termasuk komersial) dengan wajib mencantumkan atribusi penulis asli dan DOI artikel.</p><p><strong>4. Pengarsipan Mandiri (Self-Archiving):</strong> Penulis diizinkan mengarsipkan versi <em>Preprint</em>, <em>Postprint (Accepted Manuscript)</em>, maupun <em>Version of Record (VoR / Publisher\'s PDF)</em> ke dalam Repositori Institusi atau repositori subjek segera saat terbit (<strong>Zero Embargo</strong>).</p>',NULL),(1,'en_US','lockssLicense','This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>',NULL),(1,'en_US','name','Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences',NULL),(1,'en_US','openAccessPolicy','<p><strong>Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences</strong> menerapkan kebijakan <strong>Akses Terbuka Berlian (<em>Diamond Open Access</em>)</strong> berdasarkan prinsip bahwa menyediakan hasil riset ilmiah secara bebas kepada publik akan mengakselerasi pertukaran pengetahuan global dan inovasi agrosains berkelanjutan (Suber, 2012; Willinsky, 2006). Seluruh artikel yang diterbitkan dapat dibaca, diunduh, disalin, didistribusikan, dan digunakan secara gratis sejak hari pertama penerbitan tanpa masa embargo dan tanpa memungut biaya pemrosesan artikel (<strong>Zero APC / Rp 0,-</strong>) kepada penulis maupun pembaca.</p>',NULL),(1,'en_US','pageFooter','<div style=\"padding: 10px 0; font-size: 0.9em; line-height: 1.6;\">\n<strong>Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences</strong> (p-ISSN: 2988-7401 | e-ISSN: 2988-741X)<br/>\nDiterbitkan oleh <strong>Departemen Agrosains &amp; UPT Perpustakaan Universitas Negeri Malang</strong>, Jl. Semarang No. 5, Malang 65145, Indonesia.<br/>\nKontak Redaksi: <a href=\"mailto:yanuar.rizky@hortus.ac.id\">yanuar.rizky@hortus.ac.id</a> | Terbitan Akses Terbuka Berlian (<em>Diamond Open Access</em>) di bawah lisensi <a href=\"https://creativecommons.org/licenses/by/4.0/\" target=\"_blank\">Creative Commons Attribution 4.0 International (CC BY 4.0)</a>.\n</div>',NULL),(1,'en_US','pageHeaderLogoImage','{\"name\":\"pageHeaderLogoImage.png\",\"uploadName\":\"pageHeaderLogoImage.png\",\"width\":560,\"height\":96,\"dateUploaded\":\"2026-11-05 06:15:17\",\"altText\":\"Hortus Journal Logo\"}',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost/ojs/index.php/Horsju/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost/ojs/index.php/Horsju/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','reviewGuidelines','<h3>Panduan &amp; Rubrik Evaluasi Mitra Bebestari (Reviewer Guidelines)</h3>\n<p>Mitra bebestari (<em>Reviewer</em>) memegang peran kunci dalam menjaga mutu ilmiah <strong>Hortus Journal</strong> melalui mekanisme <strong>Double-Blind Peer Review</strong>. Reviewer diharapkan mengevaluasi naskah secara objektif, konstruktif, tepat waktu (<strong>2–4 minggu</strong>), dan menjaga kerahasiaan dokumen naskah sesuai pedoman etika COPE.</p>\n<h4>Aspek Evaluasi pada Formulir Penilaian OJS (Structured Review Form):</h4>\n<ol>\n<li><strong>Kesesuaian Fokus &amp; Ruang Lingkup (Focus &amp; Scope Alignment):</strong> Relevansi topik naskah dengan bidang sains perkebunan tropika berkelanjutan dan agroindustri.</li>\n<li><strong>Orisinalitas &amp; Kebaruan Ilmiah (Originality &amp; Scientific Novelty):</strong> Kontribusi temuan baru atau inovasi teknologi dalam memecahkan masalah strategis perkebunan.</li>\n<li><strong>Ketepatan Metodologi &amp; Desain Eksperimen (Methodological Rigor):</strong> Kejelasan rancangan percobaan, validitas instrumen/sensor, kecukupan ukuran sampel, dan ketepatan uji statistik.</li>\n<li><strong>Kualitas Penyajian Hasil &amp; Ketajaman Pembahasan (Results &amp; Discussion Quality):</strong> Keakuratan interpretasi data, kualitas visualisasi tabel/gambar, serta kedalaman sintesis pembahasan.</li>\n<li><strong>Kepatuhan Struktur IMRAD, Gaya Selingkung &amp; Kemutakhiran Referensi (APA 7th Edition):</strong> Keterbacaan bahasa ilmiah, ketepatan struktur IMRAD, dan proporsi rujukan jurnal primer mutakhir (&ge;80% 10 tahun terakhir).</li>\n<li><strong>Catatan Konstruktif &amp; Rekomendasi Putusan Editorial:</strong> Uraian perbaikan mayor/minor bagi penulis serta rekomendasi putusan (<em>Accept Submission, Revisions Required, Resubmit for Review,</em> atau <em>Decline Submission</em>).</li>\n</ol>',NULL),(1,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"Naskah merupakan karya ilmiah orisinal, bebas plagiarisme (skor kemiripan Turnitin\\/iThenticate ≤ 20%), belum pernah diterbitkan, dan tidak sedang dalam proses evaluasi pada jurnal\\/terbitan berkala lain.\"},{\"order\":2,\"content\":\"Berkas naskah utama telah dianonimkan (Blind Manuscript: tanpa nama penulis, afiliasi, dan identitas pada properti dokumen) untuk keperluan evaluasi Double-Blind Peer Review.\"},{\"order\":3,\"content\":\"Struktur naskah telah mengikuti format IMRAD (Introduction, Methods, Results, and Discussion) dalam format Microsoft Word (.docx) dengan panjang 4.000–7.500 kata, font Times New Roman 11 pt, spasi 1,15.\"},{\"order\":4,\"content\":\"Sitasi dan Daftar Rujukan telah disusun menggunakan gaya APA 7th Edition dengan manajer referensi (Mendeley\\/Zotero), memuat minimal 25 pustaka primer mutakhir disertai tautan URL DOI aktif.\"},{\"order\":5,\"content\":\"Penulis menyetujui pernyataan bebas konflik kepentingan (Competing Interests) serta lisensi publikasi terbuka Creative Commons Attribution 4.0 International (CC BY 4.0).\"}]',NULL);
/*!40000 ALTER TABLE `journal_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals` (
  `journal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Used to order lists of journals',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT 1 COMMENT 'Controls whether or not the journal is considered "live" and will appear on the website. (Note that disabled journals may still be accessible, but only if the user knows the URL.)',
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journals_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,'Horsju',1.00,'en_US',1);
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_file_settings`
--

DROP TABLE IF EXISTS `library_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_file_settings`
--

LOCK TABLES `library_file_settings` WRITE;
/*!40000 ALTER TABLE `library_file_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_files`
--

DROP TABLE IF EXISTS `library_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `type` smallint(6) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `public_access` smallint(6) DEFAULT 0,
  PRIMARY KEY (`file_id`),
  KEY `library_files_context_id` (`context_id`),
  KEY `library_files_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_files`
--

LOCK TABLES `library_files` WRITE;
/*!40000 ALTER TABLE `library_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata_description_settings`
--

DROP TABLE IF EXISTS `metadata_description_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata_description_settings` (
  `metadata_description_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  KEY `metadata_description_settings_id` (`metadata_description_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_description_settings`
--

LOCK TABLES `metadata_description_settings` WRITE;
/*!40000 ALTER TABLE `metadata_description_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_description_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata_descriptions`
--

DROP TABLE IF EXISTS `metadata_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata_descriptions` (
  `metadata_description_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`metadata_description_id`),
  KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_descriptions`
--

LOCK TABLES `metadata_descriptions` WRITE;
/*!40000 ALTER TABLE `metadata_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics` (
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `pkp_section_id` bigint(20) DEFAULT NULL,
  `assoc_object_type` bigint(20) DEFAULT NULL,
  `assoc_object_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `file_type` smallint(6) DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `metric_type` varchar(255) NOT NULL,
  `metric` int(11) NOT NULL,
  KEY `metrics_load_id` (`load_id`),
  KEY `metrics_metric_type_context_id` (`metric_type`,`context_id`),
  KEY `metrics_metric_type_submission_id_assoc_type` (`metric_type`,`submission_id`,`assoc_type`),
  KEY `metrics_metric_type_submission_id_assoc` (`metric_type`,`context_id`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics`
--

LOCK TABLES `metrics` WRITE;
/*!40000 ALTER TABLE `metrics` DISABLE KEYS */;
INSERT INTO `metrics` VALUES ('usage_events_20260831.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20260831','202608',NULL,NULL,NULL,NULL,'ojs::counter',7),('usage_events_20260911.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20260911','202609',NULL,NULL,NULL,NULL,'ojs::counter',11),('usage_events_20260914.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20260914','202609',NULL,NULL,NULL,NULL,'ojs::counter',3),('usage_events_20261105.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20261105','202611',NULL,NULL,NULL,NULL,'ojs::counter',8),('usage_events_20261105.log',1,NULL,NULL,NULL,NULL,NULL,259,1,'20261105','202611',NULL,NULL,NULL,NULL,'ojs::counter',7),('usage_events_20261105.log',1,2,259,1,1,1,515,7,'20261105','202611',2,NULL,NULL,NULL,'ojs::counter',3),('usage_events_20261110.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20261110','202611',NULL,NULL,NULL,NULL,'ojs::counter',3);
/*!40000 ALTER TABLE `metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignment_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_assignment_settings_pkey` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `assignment_settings_navigation_menu_item_assignment_id` (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignment_settings`
--

LOCK TABLES `navigation_menu_item_assignment_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignments`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `navigation_menu_id` bigint(20) NOT NULL,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT 0,
  PRIMARY KEY (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignments`
--

LOCK TABLES `navigation_menu_item_assignments` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignments` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_assignments` VALUES (1,1,1,0,0),(2,1,2,0,1),(3,1,3,0,2),(4,1,4,3,0),(5,1,5,3,1),(6,1,6,3,2),(7,1,7,3,3),(8,2,8,0,0),(9,2,9,0,1),(10,2,10,0,2),(11,2,11,10,0),(12,2,12,10,1),(13,2,13,10,2),(14,2,14,10,3),(15,3,15,0,0),(16,3,16,0,1),(17,3,17,0,2),(18,3,18,0,3),(19,3,19,18,0),(20,3,20,18,1),(21,3,21,18,2),(22,3,22,18,3),(23,3,23,18,4);
/*!40000 ALTER TABLE `navigation_menu_item_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_settings_pkey` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_id` (`navigation_menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_settings`
--

LOCK TABLES `navigation_menu_item_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_settings` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_settings` VALUES (1,'','titleLocaleKey','navigation.register','string'),(2,'','titleLocaleKey','navigation.login','string'),(3,'','titleLocaleKey','{$loggedInUsername}','string'),(4,'','titleLocaleKey','navigation.dashboard','string'),(5,'','titleLocaleKey','common.viewProfile','string'),(6,'','titleLocaleKey','navigation.admin','string'),(7,'','titleLocaleKey','user.logOut','string'),(8,'','titleLocaleKey','navigation.register','string'),(9,'','titleLocaleKey','navigation.login','string'),(10,'','titleLocaleKey','{$loggedInUsername}','string'),(11,'','titleLocaleKey','navigation.dashboard','string'),(12,'','titleLocaleKey','common.viewProfile','string'),(13,'','titleLocaleKey','navigation.admin','string'),(14,'','titleLocaleKey','user.logOut','string'),(15,'','titleLocaleKey','navigation.current','string'),(16,'','titleLocaleKey','navigation.archives','string'),(17,'','titleLocaleKey','manager.announcements','string'),(18,'','titleLocaleKey','navigation.about','string'),(19,'','titleLocaleKey','about.aboutContext','string'),(20,'','titleLocaleKey','about.submissions','string'),(21,'','titleLocaleKey','about.editorialTeam','string'),(22,'','titleLocaleKey','manager.setup.privacyStatement','string'),(23,'','titleLocaleKey','about.contact','string'),(24,'','titleLocaleKey','common.search','string');
/*!40000 ALTER TABLE `navigation_menu_item_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_items`
--

DROP TABLE IF EXISTS `navigation_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  PRIMARY KEY (`navigation_menu_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_items`
--

LOCK TABLES `navigation_menu_items` WRITE;
/*!40000 ALTER TABLE `navigation_menu_items` DISABLE KEYS */;
INSERT INTO `navigation_menu_items` VALUES (1,0,NULL,'NMI_TYPE_USER_REGISTER'),(2,0,NULL,'NMI_TYPE_USER_LOGIN'),(3,0,NULL,'NMI_TYPE_USER_DASHBOARD'),(4,0,NULL,'NMI_TYPE_USER_DASHBOARD'),(5,0,NULL,'NMI_TYPE_USER_PROFILE'),(6,0,NULL,'NMI_TYPE_ADMINISTRATION'),(7,0,NULL,'NMI_TYPE_USER_LOGOUT'),(8,1,NULL,'NMI_TYPE_USER_REGISTER'),(9,1,NULL,'NMI_TYPE_USER_LOGIN'),(10,1,NULL,'NMI_TYPE_USER_DASHBOARD'),(11,1,NULL,'NMI_TYPE_USER_DASHBOARD'),(12,1,NULL,'NMI_TYPE_USER_PROFILE'),(13,1,NULL,'NMI_TYPE_ADMINISTRATION'),(14,1,NULL,'NMI_TYPE_USER_LOGOUT'),(15,1,NULL,'NMI_TYPE_CURRENT'),(16,1,NULL,'NMI_TYPE_ARCHIVES'),(17,1,NULL,'NMI_TYPE_ANNOUNCEMENTS'),(18,1,NULL,'NMI_TYPE_ABOUT'),(19,1,NULL,'NMI_TYPE_ABOUT'),(20,1,NULL,'NMI_TYPE_SUBMISSIONS'),(21,1,NULL,'NMI_TYPE_EDITORIAL_TEAM'),(22,1,NULL,'NMI_TYPE_PRIVACY'),(23,1,NULL,'NMI_TYPE_CONTACT'),(24,1,NULL,'NMI_TYPE_SEARCH');
/*!40000 ALTER TABLE `navigation_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menus`
--

DROP TABLE IF EXISTS `navigation_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`navigation_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menus`
--

LOCK TABLES `navigation_menus` WRITE;
/*!40000 ALTER TABLE `navigation_menus` DISABLE KEYS */;
INSERT INTO `navigation_menus` VALUES (1,0,'user','User Navigation Menu'),(2,1,'user','User Navigation Menu'),(3,1,'primary','Primary Navigation Menu');
/*!40000 ALTER TABLE `navigation_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1048586,1,5,'2026-10-14 10:25:00','2026-11-05 06:15:20','Hasil Initial Desk Screening & Uji Kemiripan Turnitin (Lolos 11%)','<p>Yth. Penulis Korespondensi (Nayla Syukurillah),<br/>Naskah Anda telah lolos <strong>Initial Desk Screening</strong> oleh Pemimpin Redaksi (Lidya Amalia Rahmania, S.Kom, M.Kom) dan Managing Editor (Mohammad Yanuar Rizky) dengan skor kemiripan Turnitin sebesar <strong>11%</strong> (di bawah ambang batas maksimal &le; 20%), mematuhi struktur IMRAD, dan berkas telah anonim (<em>Blind Manuscript</em>). Naskah dilanjutkan ke tahap <strong>Double-Blind Peer Review</strong> oleh Section Editor (Nirmala Dwi Lestari).</p>'),(2,1048586,2,6,'2026-10-27 09:35:00','2026-11-05 06:15:20','Keputusan Editorial Putaran 1: Revisions Required (Revisi Minor)','<p>Berdasarkan hasil evaluasi <em>Double-Blind Peer Review</em> dari dua Mitra Bebestari independen, naskah dinilai memiliki kebaruan ilmiah sangat baik namun memerlukan <strong>Revisi Minor (Revisions Required)</strong> terkait detail kalibrasi radiometrik UAV, uji ANOVA/Tukey HSD, dan analisis SHAP value pada bagian Pembahasan. Mohon unggah berkas revisi pada panel <em>Revisions</em>.</p>'),(3,1048586,2,9,'2026-10-29 15:45:00','2026-11-05 06:15:20','Re: Penyampaian Revisi Naskah & Tanggapan atas Masukan Reviewer','<p>Terima kasih kepada Editor dan Mitra Bebestari atas masukan yang sangat konstruktif. Kami telah merevisi naskah secara menyeluruh (menambahkan detail kalibrasi radiometrik DJI Mavic 3M, uji ANOVA/Tukey HSD &alpha; = 0,05, serta interpretasi SHAP value kanal Red Edge 42,6% dan VWC tanah 31,8%) dan mengunggah berkas <code>Naskah_Revisi_Author_Terverifikasi_Hortus_Journal.docx</code>.</p>'),(4,1048586,3,9,'2026-11-02 13:30:00','2026-11-05 06:15:20','Selesai Copyediting & Validasi Sitasi APA 7th Edition + DOI','<p>Layout Editor, Copyeditor &amp; Production Team (Nayla Syukurillah) telah menyelesaikan penyuntingan keterbacaan bahasa ilmiah, keseragaman satuan SI, serta validasi daftar rujukan APA 7th Edition. Berkas hasil penyuntingan akhir (<code>Naskah_Copyedited_Final_Terverifikasi_HJ.docx</code>) telah diunggah pada panel <em>Copyedited</em> dan telah disetujui Penulis.</p>'),(5,1048586,3,9,'2026-11-03 09:15:00','2026-11-05 06:15:20','Re: Persetujuan Hasil Copyediting oleh Penulis','<p>Kami telah memeriksa berkas hasil <em>Copyediting</em> dan menyetujui seluruh perbaikan redaksional untuk dilanjutkan ke tahap pembuatan Galley PDF (<em>Production</em>).</p>'),(6,1048586,4,9,'2026-11-04 11:15:00','2026-11-05 06:15:20','Unggah File Galley PDF Siap Publikasi (Galley_Final_HJ_Vol1_No1_2026.pdf)','<p>File tampilan akhir <strong>Galley PDF</strong> telah selesai ditata letak sesuai template resmi <em>Hortus Journal</em> (lengkap dengan header volume/nomor, halaman 1–12, lisensi CC BY 4.0, dan identitas DOI) serta diunggah pada panel <em>Galleys</em>. Naskah telah dijadwalkan terbit pada <strong>Vol. 1 No. 1 (2026)</strong>.</p>');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_mail_list`
--

DROP TABLE IF EXISTS `notification_mail_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_mail_list` (
  `notification_mail_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `confirmed` smallint(6) NOT NULL DEFAULT 0,
  `token` varchar(40) NOT NULL,
  `context` bigint(20) NOT NULL,
  PRIMARY KEY (`notification_mail_list_id`),
  UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_mail_list`
--

LOCK TABLES `notification_mail_list` WRITE;
/*!40000 ALTER TABLE `notification_mail_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_mail_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_settings` (
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_settings`
--

LOCK TABLES `notification_settings` WRITE;
/*!40000 ALTER TABLE `notification_settings` DISABLE KEYS */;
INSERT INTO `notification_settings` VALUES (17,'','contents','This is a kind reminder for you to check your journal\'s health through the editorial report.','string'),(18,'','contents','This is a kind reminder for you to check your journal\'s health through the editorial report.','string'),(19,'','contents','This is a kind reminder for you to check your journal\'s health through the editorial report.','string');
/*!40000 ALTER TABLE `notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_subscription_settings`
--

DROP TABLE IF EXISTS `notification_subscription_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_subscription_settings`
--

LOCK TABLES `notification_subscription_settings` WRITE;
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_subscription_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  KEY `notifications_user_id_level` (`user_id`,`level`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (17,1,1,3,16777258,'2026-11-03 18:40:15',NULL,0,0),(18,1,2,3,16777258,'2026-11-03 18:40:15',NULL,0,0),(19,1,3,3,16777258,'2026-11-03 18:40:15',NULL,0,0);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text DEFAULT NULL,
  UNIQUE KEY `oai_resumption_tokens_pkey` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_resumption_tokens`
--

LOCK TABLES `oai_resumption_tokens` WRITE;
/*!40000 ALTER TABLE `oai_resumption_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_resumption_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_settings`
--

DROP TABLE IF EXISTS `plugin_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_settings` (
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES ('academicfreethemeplugin',1,'article_tracking_date','false','string'),('academicfreethemeplugin',1,'baseColour','#AC2A00','string'),('academicfreethemeplugin',1,'bootstrapTheme','yeti','string'),('academicfreethemeplugin',1,'crossmark_button','false','string'),('academicfreethemeplugin',1,'dimension_badge','false','string'),('academicfreethemeplugin',1,'doi_on_index','false','string'),('academicfreethemeplugin',1,'enabled','1','bool'),('academicfreethemeplugin',1,'galley_link_on_index','false','string'),('academicfreethemeplugin',1,'headerTheme','blue','string'),('academicfreethemeplugin',1,'maintenance_mode','false','string'),('academicfreethemeplugin',1,'statistics','false','string'),('acronplugin',0,'crontab','[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"classes.tasks.SubscriptionExpiryReminder\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('defaultmanuscriptchildthemeplugin',1,'accentColour','#F7BC4A','string'),('defaultmanuscriptchildthemeplugin',1,'enabled','0','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#F7F5F0','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showDescriptionInJournalIndex','1','bool'),('defaultthemeplugin',1,'typography','notoSerif_notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','0','bool'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('doipubidplugin',1,'doiPrefix','10.17977','string'),('doipubidplugin',1,'doiSuffix','customId','string'),('doipubidplugin',1,'enabled','1','bool'),('doipubidplugin',1,'enableIssueDoi','0','bool'),('doipubidplugin',1,'enablePublicationDoi','1','bool'),('doipubidplugin',1,'enableRepresentationDoi','0','bool'),('dublincoremetaplugin',1,'enabled','1','bool'),('googlescholarplugin',1,'enabled','1','bool'),('healthsciencesthemeplugin',1,'baseColour','#10BECA','string'),('healthsciencesthemeplugin',1,'enabled','1','bool'),('htmlarticlegalleyplugin',1,'enabled','1','bool'),('immersionthemeplugin',1,'abstractsOnIssuePage','noAbstracts','string'),('immersionthemeplugin',1,'enabled','1','bool'),('immersionthemeplugin',1,'immersionAnnouncementsColor','#000','string'),('immersionthemeplugin',1,'journalDescription','1','string'),('immersionthemeplugin',1,'journalDescriptionColour','#000','string'),('informationblockplugin',1,'enabled','1','bool'),('informationblockplugin',1,'seq','7','int'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('lensgalleyplugin',1,'enabled','1','bool'),('makesubmissionblockplugin',1,'enabled','1','bool'),('makesubmissionblockplugin',1,'seq','1','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('resolverplugin',1,'enabled','1','bool'),('subscriptionblockplugin',1,'enabled','1','bool'),('subscriptionblockplugin',1,'seq','2','int'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','6a952d9b20ce3','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','[\"city\",\"region\"]','object'),('webfeedplugin',1,'displayItems','1','bool'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_categories`
--

DROP TABLE IF EXISTS `publication_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_categories` (
  `publication_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_categories`
--

LOCK TABLES `publication_categories` WRITE;
/*!40000 ALTER TABLE `publication_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_galley_settings`
--

DROP TABLE IF EXISTS `publication_galley_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `publication_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `publication_galley_settings_galley_id` (`galley_id`),
  KEY `publication_galley_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galley_settings`
--

LOCK TABLES `publication_galley_settings` WRITE;
/*!40000 ALTER TABLE `publication_galley_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_galley_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_galleys`
--

DROP TABLE IF EXISTS `publication_galleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `publication_id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `submission_file_id` bigint(20) unsigned DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` smallint(6) NOT NULL DEFAULT 0,
  `url_path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `publication_galleys_publication_id` (`publication_id`),
  KEY `publication_galleys_url_path` (`url_path`),
  KEY `publication_galleys_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `publication_galleys_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galleys`
--

LOCK TABLES `publication_galleys` WRITE;
/*!40000 ALTER TABLE `publication_galleys` DISABLE KEYS */;
INSERT INTO `publication_galleys` VALUES (1,'en_US',1,'PDF',7,1.00,NULL,1,'pdf'),(2,'en_US',2,'PDF',17,1.00,NULL,1,'pdf'),(3,'en_US',3,'PDF',18,1.00,NULL,1,'pdf'),(4,'en_US',4,'PDF',19,1.00,NULL,1,'pdf'),(5,'en_US',5,'PDF',20,1.00,NULL,1,'pdf'),(6,'en_US',6,'PDF',21,1.00,NULL,1,'pdf'),(7,'en_US',7,'PDF',22,1.00,NULL,1,'pdf'),(8,'en_US',8,'PDF',23,1.00,NULL,1,'pdf'),(9,'en_US',9,'PDF',24,1.00,NULL,1,'pdf'),(10,'en_US',10,'PDF',25,1.00,NULL,1,'pdf');
/*!40000 ALTER TABLE `publication_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_settings`
--

DROP TABLE IF EXISTS `publication_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_settings` (
  `publication_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `publication_settings_pkey` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_publication_id` (`publication_id`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES (1,'','citationsRaw','Chong, K. L., Kanniah, K. D., Pohl, C., & Tan, K. P. (2017). A review of remote sensing applications for oil palm studies. Geo-spatial Information Science, 20(2), 184–200. https://doi.org/10.1080/10095020.2017.1337317\nCommittee on Publication Ethics (COPE). (2018). Principles of transparency and best practice in scholarly publishing. https://doi.org/10.24318/cope.2019.1.12\nSantoso, H., Gunawan, T., Jatmiko, R. H., Darmosarkoro, W., & Minasny, B. (2019). Mapping and identifying basal stem rot disease in oil palms in North Sumatra with QuickBird imagery. Precision Agriculture, 12(2), 233–248. https://doi.org/10.1007/s11119-010-9172-7\nSolomon, D. J. (2008). Developing open access journals: A practical guide. Chandos Publishing.\nSuber, P. (2012). Open access. The MIT Press. https://doi.org/10.7551/mitpress/9286.001.0001'),(1,'','copyrightYear','2026'),(1,'','issueId','1'),(1,'','licenseUrl','https://creativecommons.org/licenses/by/4.0'),(1,'','pages','1-12'),(1,'','pub-id::doi','10.17977/um.hj.v1i1.2026.01'),(1,'','pub-id::publisher-id','hj-v1i1-01'),(1,'en_US','abstract','<p>Ketidakpastian iklim mikro dan heterogenitas nutrisi tanah gambut maupun mineral menjadi tantangan utama dalam menjaga stabilitas produksi Tandan Buah Segar (TBS) kelapa sawit (<em>Elaeis guineensis</em> Jacq.) di Indonesia. Penelitian ini bertujuan mengembangkan model estimasi produktivitas presisi berbasis integrasi jaringan sensor <em>Internet of Things</em> (IoT) iklim mikro kanopi dan citra multispektral <em>Unmanned Aerial Vehicle</em> (UAV). Eksperimen dilaksanakan pada blok kebun umur tanaman menghasilkan (TM-12) seluas 120 hektare selama dua musim panen. Indeks vegetasi <em>Normalized Difference Vegetation Index</em> (NDVI) dan <em>Normalized Difference Red Edge</em> (NDRE) diekstraksi dari wahana UAV dan dikombinasikan dengan parameter kelembapan tanah, suhu kanopi, serta radiasi aktif fotosintetik (PAR) menggunakan algoritma <em>Random Forest Regressor</em>. Evaluasi menggunakan <em>10-fold spatial cross-validation</em> membuktikan bahwa fusi fitur multispektral NDRE dan sensor IoT menghasilkan akurasi prediksi R<sup>2</sup> = 0,89 dan <em>Root Mean Square Error</em> (RMSE) = 1,42 ton/ha/tahun (<em>p</em> &lt; 0,001), mengungguli model satelit tunggal sebesar 18,4%. Kerangka kerja ini direkomendasikan bagi pengelola kebun dan pekebun swadaya dalam mengoptimalkan pemupukan presisi berorientasi keberlanjutan ISPO/RSPO.</p>'),(1,'en_US','copyrightHolder','Nayla Syukurillah, Mohammad Yanuar Rizky, Nirmala Dwi Lestari'),(1,'en_US','coverage','Kalimantan Tengah, Indonesia (120 ha blok TM-12); Musim Panen 2024–2026'),(1,'en_US','rights','Copyright (c) 2026 Nayla Syukurillah, Mohammad Yanuar Rizky, Nirmala Dwi Lestari. Licensed under Creative Commons Attribution 4.0 International (CC BY 4.0) (https://creativecommons.org/licenses/by/4.0/).'),(1,'en_US','source','Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences; Vol. 1, No. 1 (2026); pp. 1–12; e-ISSN: 2988-741X; p-ISSN: 2988-7401'),(1,'en_US','sponsor','LPPM Universitas Negeri Malang (Hibah Riset Sawit Berkelanjutan 2025); Lidya Amalia Rahmania (Editor)'),(1,'en_US','subtitle','Studi Eksperimental Pemodelan Spasial-Temporal Berorientasi Sertifikasi Keberlanjutan ISPO'),(1,'en_US','title','Integrasi Sensor IoT Kanopi dan Citra Multispektral UAV untuk Estimasi Presisi Produktivitas Kelapa Sawit (Elaeis guineensis Jacq.) Berkelanjutan'),(1,'en_US','type','Peer-reviewed Article; Original Research Article'),(2,'','citationsRaw','DaMatta, F. M., Rakocevic, M., Ricci, R. A., & Ramalho, J. C. (2019). Physiological traits of coffee trees under drought stress. Plant Physiology and Biochemistry, 138, 121–134. https://doi.org/10.1016/j.plaphy.2019.02.020\nGhozali, M. R., & Setiawan, B. (2023). Low-power LoRaWAN telemetry for smallholder coffee farms in East Java. Smart Agricultural Technology, 4, 100182. https://doi.org/10.1016/j.atech.2023.100182\nJones, H. G. (2018). Irrigation scheduling: Advantages and pitfalls of plant-based methods. Journal of Experimental Botany, 55(407), 2427–2436. https://doi.org/10.1093/jxb/erh213\nVereecken, H., Huisman, J. A., & Bogena, H. (2021). Soil moisture sensing for precision agriculture. Vadose Zone Journal, 20(3), e20112. https://doi.org/10.1002/vzj2.20112'),(2,'','copyrightYear','2026'),(2,'','issueId','1'),(2,'','licenseUrl','https://creativecommons.org/licenses/by/4.0'),(2,'','pages','13-24'),(2,'','pub-id::doi','10.17977/um.hj.v1i1.2026.02'),(2,'','pub-id::publisher-id','hj-v1i1-02'),(2,'en_US','abstract','<p>Defisit air musiman selama fase pembungaan dan pengisian buah sering menurunkan hasil kopi Robusta (Coffea canephora) hingga 32% pada lahan kering di Jawa Timur. Riset ini merancang dan menguji sistem aktuasi irigasi tetes otomatis berbasis telemetri Long Range (LoRa-IoT) 915 MHz yang terintegrasi dengan indeks Crop Water Stress Index (CWSI). Percobaan lapangan rancangan acak kelompok dilaksanakan selama enam bulan pada kebun kopi produktif seluas 8 hektare dengan membandingkan kontrol irigasi terjadwal konvensional dan tiga ambang batas potensial matriks tanah (−25 kPa, −40 kPa, dan −55 kPa). Hasil menunjukkan ambang aktuasi −40 kPa menghemat konsumsi air irigasi sebesar 37,4% (p &lt; 0,001) sekaligus meningkatkan bobot kering biji HS sebesar 21,8% (2,14 ton/ha vs 1,76 ton/ha pada kontrol), dengan keandalan pengiriman paket LoRa mencapai 98,6% pada jarak 2,4 km di bawah kanopi naungan.</p>'),(2,'en_US','copyrightHolder','Mohammad Yanuar Rizky, Bagus Setiawan, Nirmala Dwi Lestari'),(2,'en_US','coverage','Jember & Malang Selatan, Jawa Timur, Indonesia; Musim Kemarau 2025'),(2,'en_US','rights','Copyright (c) 2026 Mohammad Yanuar Rizky, Bagus Setiawan, Nirmala Dwi Lestari. Licensed under Creative Commons Attribution 4.0 International (CC BY 4.0) (https://creativecommons.org/licenses/by/4.0/).'),(2,'en_US','source','Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences; Vol. 1, No. 1 (2026); pp. 13–24; e-ISSN: 2988-741X; p-ISSN: 2988-7401'),(2,'en_US','sponsor','Pusat Penelitian Kopi dan Kakao Indonesia (ICCRI); Departemen Agrosains UM'),(2,'en_US','subtitle','Optimasi Efisiensi Penggunaan Air dan Produktivitas Berkelanjutan di Agroekosistem Lahan Kering'),(2,'en_US','title','Sistem Deteksi Dini Cekaman Kekeringan dan Manajemen Irigasi Tetes Cerdas Berbasis LoRa-IoT pada Perkebunan Kopi Robusta (Coffea canephora)'),(2,'en_US','type','Peer-reviewed Article; Original Research Article'),(3,'','citationsRaw','Bates, L. S., Waldren, R. P., & Teare, I. D. (1973). Rapid determination of free proline for water-stress studies. Plant and Soil, 39(1), 205–207. https://doi.org/10.1007/BF00018060\nLahive, F., Hadley, P., & Daymond, A. J. (2019). The physiological responses of cacao to the environment and the implications for climate change resilience. Agronomy for Sustainable Development, 39(1), 5. https://doi.org/10.1007/s13593-018-0552-0\nMunns, R., & Tester, M. (2008). Mechanisms of salinity tolerance. Annual Review of Plant Biology, 59, 651–681. https://doi.org/10.1146/annurev.arplant.59.032607.092911\nSusilo, A. W., & Anita-Sari, I. (2021). Physiological screening of Indonesian cocoa clones under tidal swamp conditions. Pelita Perkebunan, 37(2), 89–101. https://doi.org/10.22302/iccri.jur.pelitaperkebunan.v37i2.478'),(3,'','copyrightYear','2026'),(3,'','issueId','1'),(3,'','licenseUrl','https://creativecommons.org/licenses/by/4.0'),(3,'','pages','25-36'),(3,'','pub-id::doi','10.17977/um.hj.v1i1.2026.03'),(3,'','pub-id::publisher-id','hj-v1i1-03'),(3,'en_US','abstract','<p>Intrusi air laut dan genangan pasang surut menghambat ekspansi budidaya kakao (Theobroma cacao L.) di lahan sub-optimal pesisir Sumatera. Studi ini mengevaluasi ketahanan fisiologis dan biokimia empat klon kakao unggul (MCC 02, Sulawesi 1, Scavina 6, dan TSH 858) terhadap kombinasi cekaman salinitas NaCl (0, 50, 100 mM) dan durasi genangan (0, 7, 14 hari) menggunakan rancangan petak terbagi faktorial. Parameter kandungan prolin bebas, malondialdehid (MDA), klorofil SPAD, serta rasio Na⁺/K⁺ daun diukur secara spektrofotometrik dan flame photometry. Klon MCC 02 menunjukkan toleransi tertinggi dengan peningkatan akumulasi prolin sebesar 3,8 kali lipat (42,6 μmol/g bobot segar), mempertahankan rasio Na⁺/K⁺ terendah (0,41), serta menekan kerusakan membran MDA di bawah 18,2 nmol/g pada perlakuan 100 mM NaCl + genangan 14 hari (p &lt; 0,01).</p>'),(3,'en_US','copyrightHolder','Ratna Kusumawati, Nirmala Dwi Lestari, Sudarmono Sudarmono'),(3,'en_US','coverage','Kabupaten Banyuasin, Sumatera Selatan, Indonesia; 2024–2025'),(3,'en_US','rights','Copyright (c) 2026 Ratna Kusumawati, Nirmala Dwi Lestari, Sudarmono Sudarmono. Licensed under Creative Commons Attribution 4.0 International (CC BY 4.0) (https://creativecommons.org/licenses/by/4.0/).'),(3,'en_US','source','Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences; Vol. 1, No. 1 (2026); pp. 25–36; e-ISSN: 2988-741X; p-ISSN: 2988-7401'),(3,'en_US','sponsor','Pusat Riset Tanaman Perkebunan BRIN; Konsorsium Pemuliaan Kakao Tropika'),(3,'en_US','subtitle','Seleksi Penanda Biokimia Toleransi Abiotik untuk Ekspansi Perkebunan Adaptif Iklim'),(3,'en_US','title','Respons Fisiologis dan Akumulasi Prolin Klon Unggul Kakao (Theobroma cacao L.) terhadap Cekaman Salinitas dan Genangan Periodik di Lahan Pasang Surut'),(3,'en_US','type','Peer-reviewed Article; Original Research Article'),(4,'','citationsRaw','Agegnehu, G., Srivastava, A. K., & Bird, M. I. (2017). The role of biochar and biochar-compost in improving soil quality and crop performance: A review. Applied Soil Ecology, 119, 156–170. https://doi.org/10.1016/j.apsoil.2017.06.008\nLehmann, J., & Joseph, S. (2015). Biochar for environmental management: Science, technology and implementation (2nd ed.). Routledge. https://doi.org/10.4324/9780203762264\nMohd. Noor, A. K., & Yusoff, M. K. (2022). Peatland nutrient dynamics under oil palm cultivation in Southeast Asia. Geoderma Regional, 29, e00514. https://doi.org/10.1016/j.geodrs.2022.e00514\nWoittiez, L. S., van Wijk, M. T., Slingerland, M., van Noordwijk, M., & Giller, K. E. (2017). Yield gaps in oil palm: A quantitative review of contributing factors. European Journal of Agronomy, 83, 57–77. https://doi.org/10.1016/j.eja.2016.11.002'),(4,'','copyrightYear','2026'),(4,'','issueId','1'),(4,'','licenseUrl','https://creativecommons.org/licenses/by/4.0'),(4,'','pages','37-48'),(4,'','pub-id::doi','10.17977/um.hj.v1i1.2026.04'),(4,'','pub-id::publisher-id','hj-v1i1-04'),(4,'en_US','abstract','<p>Acidic tropical peat soils suffer from severe phosphorus (P) and potassium (K) leaching, resulting in high fertilizer losses during the main-nursery stage of oil palm (Elaeis guineensis Jacq.). This study optimized empty fruit bunch (EFB)-derived biochar enriched with humic compost at ratios of 0%, 5%, 10%, and 15% (w/w) in a 9-month main-nursery experiment across Riau and Selangor peat substrates. Amending sapric peat with 10% EFB-biochar increased soil pH from 3.72 to 5.18, elevated effective cation exchange capacity (ECEC) by 46.2%, and reduced nitrate and K⁺ leaching losses by 38.9% compared to unamended NPK controls (p &lt; 0.001). Consequently, Dickson Quality Index (DQI) of Tenera seedlings improved by 34.5%, establishing an environmentally sound nursery fertilization protocol for sustainable peatland management.</p>'),(4,'en_US','copyrightHolder','Ahmad Kamal Mohd. Noor, Nayla Syukurillah, Arif Budiman'),(4,'en_US','coverage','Riau Peatland Station, Indonesia & Selangor, Malaysia; 2025'),(4,'en_US','rights','Copyright (c) 2026 Ahmad Kamal Mohd. Noor, Nayla Syukurillah, Arif Budiman. Licensed under Creative Commons Attribution 4.0 International (CC BY 4.0) (https://creativecommons.org/licenses/by/4.0/).'),(4,'en_US','source','Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences; Vol. 1, No. 1 (2026); pp. 37–48; e-ISSN: 2988-741X; p-ISSN: 2988-7401'),(4,'en_US','sponsor','ASEAN Tropical Plantation Research Grant (UM–UPM–IPB)'),(4,'en_US','subtitle','Enhancing Cation Exchange Capacity and Phosphorus Availability in Tropical Sapric Peatlands'),(4,'en_US','title','Optimization of Biochar-Enriched Organic Ameliorants on Peat Soil Nutrient Retention and Oil Palm (Elaeis guineensis) Seedling Vigour'),(4,'en_US','type','Peer-reviewed Article; Original Research Article'),(5,'','citationsRaw','Alexander, A., Sipaut, C. S., Dayou, J., & Chong, K. P. (2017). Oil palm roots colonization by Ganoderma boninense: An insight. Journal of Oil Palm Research, 29(2), 180–191. https://doi.org/10.21894/jopr.2017.2902.04\nGoh, Y. K., Marzuki, N. F., Paiko, A. S., & Goh, K. J. (2020). Biological control of Ganoderma basal stem rot using Trichoderma consortia. Biological Control, 149, 104318. https://doi.org/10.1016/j.biocontrol.2020.104318\nPaterson, R. R. M. (2019). Ganoderma boninense disease of oil palm to significantly reduce production after 2050 in Sumatra. Microorganisms, 7(1), 24. https://doi.org/10.3390/microorganisms7010024\nSusanto, A., Sudharto, P. S., & Purba, R. Y. (2018). Enhancing biological control of basal stem rot in North Sumatra oil palm plantations. Crop Protection, 108, 45–53. https://doi.org/10.1016/j.cropro.2018.02.011'),(5,'','copyrightYear','2026'),(5,'','issueId','1'),(5,'','licenseUrl','https://creativecommons.org/licenses/by/4.0'),(5,'','pages','49-60'),(5,'','pub-id::doi','10.17977/um.hj.v1i1.2026.05'),(5,'','pub-id::publisher-id','hj-v1i1-05'),(5,'en_US','abstract','<p>Penyakit Busuk Pangkal Batang (BPB) yang disebabkan oleh Ganoderma boninense menjadi ancaman utama pada perkebunan kelapa sawit peremajaan generasi kedua dan ketiga di Sumatera Utara dengan tingkat kematian tanaman mencapai 45%. Penelitian ini menguji sinergisme konsorsium Trichoderma asperellum isolat T-As12 dan bakteri endofit Burkholderia cepacia Bc-09 dalam menghambat koloni patogen secara in-vitro serta menekan insidensi penyakit di pembibitan dan kebun. Uji biakan ganda menunjukkan daya hambat radial konsorsium mencapai 84,6%, melampaui aplikasi tunggal T. asperellum (71,2%) maupun fungisida sintetik heksakonazol (68,4%). Pada pengamatan kebun selama 18 bulan di Asahan, inokulasi konsorsium menekan keparahan penyakit BPB hingga 64,2% (p &lt; 0,001) disertai peningkatan aktivitas enzim pertahanan peroksidase dan kitinase sebesar 2,4 kali lipat.</p>'),(5,'en_US','copyrightHolder','Hendra Wijaya, Nirmala Dwi Lestari, Siti Aminah'),(5,'en_US','coverage','Kabupaten Asahan, Sumatera Utara, Indonesia (Lahan Replanting Generasi III); 2024–2026'),(5,'en_US','rights','Copyright (c) 2026 Hendra Wijaya, Nirmala Dwi Lestari, Siti Aminah. Licensed under Creative Commons Attribution 4.0 International (CC BY 4.0) (https://creativecommons.org/licenses/by/4.0/).'),(5,'en_US','source','Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences; Vol. 1, No. 1 (2026); pp. 49–60; e-ISSN: 2988-741X; p-ISSN: 2988-7401'),(5,'en_US','sponsor','Pusat Penelitian Kelapa Sawit (PPKS) Medan; Laboratorium Proteksi Hayati UM'),(5,'en_US','subtitle','Evaluasi Antagonisme In-Vitro, Induksi Ketahanan Sistemik, dan Uji Lapangan Generasi Ketiga'),(5,'en_US','title','Efikasi Konsorsium Trichoderma asperellum dan Burkholderia cepacia sebagai Agens Pengendali Hayati Penyakit Busuk Pangkal Batang (Ganoderma boninense) pada Kelapa Sawit'),(5,'en_US','type','Peer-reviewed Article; Original Research Article'),(6,'','citationsRaw','Aristizábal, L. F., Bustillo, A. E., & Arthurs, S. P. (2016). Integrated pest management of coffee berry borer: Strategies from Latin America that could be useful for coffee farmers in Hawaii. Insects, 7(1), 6. https://doi.org/10.3390/insects7010006\nJaramillo, J., Setamou, M., Muchugu, E., Chabi-Olaye, A., & Borgemeister, C. (2013). Climate change or urbanization? Impacts on a traditional coffee production system in East Africa. PLoS ONE, 8(1), e51815. https://doi.org/10.1371/journal.pone.0051815\nPerfecto, I., Vandermeer, J., & Philpott, S. M. (2014). Complex ecological interactions in the coffee agroecosystem. Annual Review of Ecology, Evolution, and Systematics, 45, 137–158. https://doi.org/10.1146/annurev-ecolsys-120213-091923\nVega, F. E., Infante, F., & Johnson, A. J. (2015). The genus Hypothenemus, with emphasis on H. hampei, the coffee berry borer. In Bark beetles (pp. 427–494). Academic Press. https://doi.org/10.1016/B978-0-12-417156-5.00011-3'),(6,'','copyrightYear','2026'),(6,'','issueId','1'),(6,'','licenseUrl','https://creativecommons.org/licenses/by/4.0'),(6,'','pages','61-72'),(6,'','pub-id::doi','10.17977/um.hj.v1i1.2026.06'),(6,'','pub-id::publisher-id','hj-v1i1-06'),(6,'en_US','abstract','<p>Penggerek Buah Kopi (PBKo, Hypothenemus hampei) dapat merusak hingga 40% panen kopi Arabika (Coffea arabica L.) jika tidak dikendalikan secara ekologis. Penelitian ini menganalisis dinamika populasi H. hampei dan tingkat parasitisasi alami oleh parasitoid Cephalonomia stephanoderis pada tiga tipe naungan di dataran tinggi Ijen-Raung: monokultur terbuka (&lt;15% naungan), naungan tunggal lamtoro (35–45%), dan agroforestri multi-strata (50–65% dengan alpukat, dadap, dan pinus). Pengamatan terhadap 18.000 buah kopi sepanjang tahun 2025 membuktikan bahwa sistem agroforestri multi-strata menekan tingkat serangan PBKo menjadi 6,8% dibandingkan 24,5% pada monokultur terbuka (p &lt; 0,001), dengan laju parasitisasi alami C. stephanoderis mencapai 28,4% dan insidensi cendawan entomopatogen Beauveria bassiana alami sebesar 19,2%.</p>'),(6,'en_US','copyrightHolder','Didik Haryono, Rina Kartikasari, Mohammad Yanuar Rizky'),(6,'en_US','coverage','Dataran Tinggi Ijen-Raung, Jawa Timur, Indonesia (1.200–1.550 m dpl); 2025'),(6,'en_US','rights','Copyright (c) 2026 Didik Haryono, Rina Kartikasari, Mohammad Yanuar Rizky. Licensed under Creative Commons Attribution 4.0 International (CC BY 4.0) (https://creativecommons.org/licenses/by/4.0/).'),(6,'en_US','source','Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences; Vol. 1, No. 1 (2026); pp. 61–72; e-ISSN: 2988-741X; p-ISSN: 2988-7401'),(6,'en_US','sponsor','ICCRI Jember; Dinas Perkebunan Provinsi Jawa Timur'),(6,'en_US','subtitle','Analisis Struktur Penaung Multi-Strata dan Konservasi Parasitoid Cephalonomia stephanoderis'),(6,'en_US','title','Dinamika Populasi Penggerek Buah Kopi (Hypothenemus hampei) dan Peran Musuh Alami Parasitoid pada Sistem Agroforestri Kopi Arabika Dataran Tinggi'),(6,'en_US','type','Peer-reviewed Article; Original Research Article'),(7,'','citationsRaw','Abdullah, N., & Sulaiman, F. (2013). The oil palm wastes in Malaysia. In Biomass now: Sustainable growth and use (pp. 75–100). InTech. https://doi.org/10.5772/55302\nBridgewater, A. V. (2012). Review of fast pyrolysis of biomass and product upgrading. Biomass and Bioenergy, 38, 68–94. https://doi.org/10.1016/j.biombioe.2011.01.048\nLiew, W. L., Kassim, M. A., Muda, K., Loh, S. K., & Affam, A. C. (2015). Conventional methods and emerging wastewater polishing technologies for palm oil mill effluent treatment: A review. Journal of Environmental Management, 149, 222–235. https://doi.org/10.1016/j.jenvman.2014.10.016\nPratama, F., & Syukurillah, N. (2024). Synergistic co-pyrolysis of empty fruit bunch and cocoa pod husk. Bioresource Technology Reports, 25, 101742. https://doi.org/10.1016/j.biteb.2024.101742'),(7,'','copyrightYear','2026'),(7,'','issueId','1'),(7,'','licenseUrl','https://creativecommons.org/licenses/by/4.0'),(7,'','pages','73-84'),(7,'','pub-id::doi','10.17977/um.hj.v1i1.2026.07'),(7,'','pub-id::publisher-id','hj-v1i1-07'),(7,'en_US','abstract','<p>Limbah padat tandan kosong kelapa sawit (TKKS) dan kulit buah kakao (KBK) berpotensi dikonversi menjadi produk bernilai tambah tinggi dalam konsep agroindustri sirkular. Penelitian ini mengevaluasi ko-pirolisis TKKS dan KBK (rasio 70:30) pada variasi suhu 450 °C, 550 °C, dan 650 °C dalam reaktor unggun tetap beratmosfer N₂ untuk menghasilkan bio-oil dan biochar, yang selanjutnya diaktivasi menggunakan KOH (1:3) menjadi karbon aktif mesopori untuk remediasi Palm Oil Mill Effluent (POME). Rendemen bio-oil maksimum tercapai pada suhu 550 °C (41,8% berat) dengan nilai kalor 24,6 MJ/kg, sedangkan karbon aktif asal 650 °C memiliki luas permukaan BET 912 m²/g. Aplikasi adsorben karbon aktif dosis 4 g/L mampu menurunkan Chemical Oxygen Demand (COD) POME sebesar 82,4% dan kekeruhan sebesar 91,7% mengikuti model isoterm Freundlich (R² = 0,97).</p>'),(7,'en_US','copyrightHolder','Fajar Pratama, Nayla Syukurillah, Dewi Anggraini'),(7,'en_US','coverage','Jawa Timur & Kalimantan Selatan, Indonesia; 2025–2026'),(7,'en_US','rights','Copyright (c) 2026 Fajar Pratama, Nayla Syukurillah, Dewi Anggraini. Licensed under Creative Commons Attribution 4.0 International (CC BY 4.0) (https://creativecommons.org/licenses/by/4.0/).'),(7,'en_US','source','Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences; Vol. 1, No. 1 (2026); pp. 73–84; e-ISSN: 2988-741X; p-ISSN: 2988-7401'),(7,'en_US','sponsor','Direktorat Riset, Teknologi, dan Pengabdian kepada Masyarakat (DRTPM)'),(7,'en_US','subtitle','Pendekatan Biorefinery Sirkular dengan Aktivasi Kimia KOH dan Karakterisasi Isoterm Adsorpsi'),(7,'en_US','title','Pirolisis Terkontrol Tandan Kosong Kelapa Sawit dan Kulit Buah Kakao menjadi Bio-Oil dan Karbon Aktif Berpori untuk Remediasi Limbah Cair Pabrik Kelapa Sawit (POME)'),(7,'en_US','type','Peer-reviewed Article; Original Research Article'),(8,'','citationsRaw','De Bruyn, F., Zhang, S. J., Pothakos, V., Torres, J., Lambot, C., Moroni, A. V., & De Vuyst, L. (2017). Exploring the impacts of postharvest processing on the microbiota and metabolite profiles during green coffee bean production. Applied and Environmental Microbiology, 83(1), e02398-16. https://doi.org/10.1128/AEM.02398-16\nPereira, G. V. M., Neto, D. P. C., Júnior, A. I. M., Vásquez, Z. S., Medeiros, A. B. P., Vandenberghe, L. P. S., & Soccol, C. R. (2019). Exploring the impacts of postharvest processing on the aroma formation of coffee beans. Food Chemistry, 272, 441–452. https://doi.org/10.1016/j.foodchem.2018.08.061\nPrakash, I., & Setiawan, B. (2023). Controlled anaerobic fermentation of Indonesian Fine Robusta. Food Research International, 165, 112504. https://doi.org/10.1016/j.foodres.2023.112504\nSilva, C. F., Batista, L. R., Abreu, L. M., Dias, E. S., & Schwan, R. F. (2008). Succession of bacterial and fungal communities during natural coffee fermentation. Food Microbiology, 25(8), 951–957. https://doi.org/10.1016/j.fm.2008.07.003'),(8,'','copyrightYear','2026'),(8,'','issueId','1'),(8,'','licenseUrl','https://creativecommons.org/licenses/by/4.0'),(8,'','pages','85-96'),(8,'','pub-id::doi','10.17977/um.hj.v1i1.2026.08'),(8,'','pub-id::publisher-id','hj-v1i1-08'),(8,'en_US','abstract','<p>Spontaneous mucilage fermentation in Robusta (Coffea canephora) and Liberica (Coffea liberica) processing frequently yields inconsistent sensory quality and excessive bitter-phenolic notes. This study investigated controlled co-inoculation kinetics using indigenous starter cultures of Lactobacillus plantarum (10⁷ CFU/mL) and Saccharomyces cerevisiae (10⁶ CFU/mL) over 36, 48, and 60 hours at 28 °C in anaerobic bioreactors. Sugar consumption, organic acid accumulation (HPLC), and volatile ester generation (HS-SPME-GC-MS) were correlated with Q-Grader sensory evaluations. Co-inoculation for 48 hours accelerated mucilage pectin degradation by 35%, increased fruity ethyl-acetate and isoamyl-acetate esters by 2.6-fold, and elevated SCA/CQI fine cupping scores from 78.25 (spontaneous control) to 84.75 for Fine Robusta and 85.10 for Liberica (p &lt; 0,001).</p>'),(8,'en_US','copyrightHolder','Maria Sanchez-Cortes, Bagus Setiawan, Nayla Syukurillah'),(8,'en_US','coverage','Banyuwangi & Jambi, Indonesia; Montpellier Laboratory Analysis; 2025'),(8,'en_US','rights','Copyright (c) 2026 Maria Sanchez-Cortes, Bagus Setiawan, Nayla Syukurillah. Licensed under Creative Commons Attribution 4.0 International (CC BY 4.0) (https://creativecommons.org/licenses/by/4.0/).'),(8,'en_US','source','Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences; Vol. 1, No. 1 (2026); pp. 85–96; e-ISSN: 2988-741X; p-ISSN: 2988-7401'),(8,'en_US','sponsor','CIRAD-ICCRI Bilateral Postharvest Innovation Program'),(8,'en_US','subtitle','Metabolomic Profiling of Volatile Esters, Organic Acids, and Specialty Cupping Scores'),(8,'en_US','title','Controlled Fermentation Kinetics Using Indigenous Lactobacillus plantarum and Saccharomyces cerevisiae to Enhance Flavor Precursors of Fine Robusta and Liberica Beans'),(8,'en_US','type','Peer-reviewed Article; Original Research Article'),(9,'','citationsRaw','Brandi, C., Cabani, T., Hosang, C., Schirmbeck, S., Westermann, L., & Wiese, H. (2015). Sustainability standards for palm oil: Challenges for smallholder certification under the RSPO. The Journal of Environment & Development, 24(3), 292–314. https://doi.org/10.1177/1070496515593775\nHutabarat, S., Slingerland, M., Rietberg, P., & Dries, L. (2018). Costs and benefits of certification of independent oil palm smallholders in Indonesia. International Food and Agribusiness Management Review, 21(6), 681–700. https://doi.org/10.22434/IFAMR2016.0162\nRizky, M. Y., & Wulandari, L. (2024). Digital traceability readiness for Indonesian palm oil smallholders under EUDR. Forest Policy and Economics, 160, 103152. https://doi.org/10.1016/j.forpol.2024.103152\nWatts, J. D., Pasaribu, K., Irawan, S., Tacconi, L., & Martanila, H. (2021). Challenges faced by smallholders in achieving sustainable palm oil certification in Indonesia. World Development, 146, 105565. https://doi.org/10.1016/j.worlddev.2021.105565'),(9,'','copyrightYear','2026'),(9,'','issueId','1'),(9,'','licenseUrl','https://creativecommons.org/licenses/by/4.0'),(9,'','pages','97-108'),(9,'','pub-id::doi','10.17977/um.hj.v1i1.2026.09'),(9,'','pub-id::publisher-id','hj-v1i1-09'),(9,'en_US','abstract','<p>Mandatori sertifikasi Indonesian Sustainable Palm Oil (ISPO) bagi pekebun swadaya sering terhambat tingginya biaya audit awal, ketidaklengkapan legalitas lahan (STDB), dan lemahnya sistem pencatatan kebun. Studi kasus ini memetakan kesenjangan kepatuhan pada 240 pekebun swadaya di Siak dan Kotawaringin Barat serta merancang model skema pembiayaan hijau terpadu (blended green finance) berbasis koperasi. Analisis regresi logistik biner membuktikan bahwa legalitas Surat Tanda Daftar Budidaya (STDB) dan pendampingan koperasi berpengaruh paling signifikan terhadap kesiapan audit ISPO-RSPO (OR = 4,82; p &lt; 0,001). Simulasi finansial menunjukkan insentif premium harga TBS bersertifikat (+Rp 125/kg) dan kredit karbon agroforestri mampu menutup biaya sertifikasi dalam 1,7 tahun dengan peningkatan pendapatan bersih pekebun sebesar 19,6%.</p>'),(9,'en_US','copyrightHolder','Mohammad Yanuar Rizky, Lestari Wulandari, Lidya Amalia Rahmania'),(9,'en_US','coverage','Kabupaten Siak (Riau) & Kotawaringin Barat (Kalimantan Tengah), Indonesia; 2024–2025'),(9,'en_US','rights','Copyright (c) 2026 Mohammad Yanuar Rizky, Lestari Wulandari, Lidya Amalia Rahmania. Licensed under Creative Commons Attribution 4.0 International (CC BY 4.0) (https://creativecommons.org/licenses/by/4.0/).'),(9,'en_US','source','Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences; Vol. 1, No. 1 (2026); pp. 97–108; e-ISSN: 2988-741X; p-ISSN: 2988-7401'),(9,'en_US','sponsor','UPT Perpustakaan & Departemen Agrosains Universitas Negeri Malang'),(9,'en_US','subtitle','Studi Kebijakan Rantai Pasok Berkelanjutan dan Kelembagaan Koperasi di Riau dan Kalimantan Tengah'),(9,'en_US','title','Analisis Kesenjangan Kepatuhan dan Model Insentif Pembiayaan Hijau dalam Akselerasi Sertifikasi ISPO-RSPO bagi Pekebun Swadaya Kelapa Sawit'),(9,'en_US','type','Peer-reviewed Article; Review & Case Study Article'),(10,'','citationsRaw','Jawjit, W., Kroeze, C., & Rattanapan, S. (2010). Greenhouse gas emissions from rubber industry in Thailand. Journal of Cleaner Production, 18(5), 403–411. https://doi.org/10.1016/j.jclepro.2009.12.003\nKamilaris, A., Fonts, A., & Prenafeta-Boldʊ, F. X. (2019). The rise of blockchain technology in agriculture and food supply chains. Trends in Food Science & Technology, 91, 640–652. https://doi.org/10.1016/j.tifs.2019.07.034\nLestari, N. D., & Supriyadi, B. (2025). Carbon footprint and EUDR geolocation readiness in South Sumatra smallholder rubber. Sustainable Production and Consumption, 46, 112–125. https://doi.org/10.1016/j.spc.2025.01.009\nMusikavong, C., & Gheewala, S. H. (2017). Ecological footprint assessment towards eco-efficient palm oil and rubber production. Journal of Cleaner Production, 140, 581–589. https://doi.org/10.1016/j.jclepro.2016.07.152'),(10,'','copyrightYear','2026'),(10,'','issueId','1'),(10,'','licenseUrl','https://creativecommons.org/licenses/by/4.0'),(10,'','pages','109-120'),(10,'','pub-id::doi','10.17977/um.hj.v1i1.2026.10'),(10,'','pub-id::publisher-id','hj-v1i1-10'),(10,'en_US','abstract','<p>Rantai pasok bahan olah karet (bokar) rakyat di Indonesia melibatkan banyak perantara sehingga menyulitkan verifikasi asal-usul bebas deforestasi (EUDR) serta audit jejak karbon produk SIR-20. Studi ini mengembangkan arsitektur buku besar terdistribusi (blockchain ringan berizin berbasis Hyperledger Fabric) yang dihubungkan dengan kode QR lot bokar di Unit Pengolahan dan Pemasaran Bokar (UPPB), sekaligus melaksanakan Life Cycle Assessment (LCA) cradle-to-gate untuk 1 ton produk karet remah kering. Hasil LCA menunjukkan total emisi gas rumah kaca sebesar 1.184 kg CO₂-eq/ton SIR-20, dengan kontributor terbesar berasal dari konsumsi energi termal pengeringan dan listrik pabrik (52,4%) serta pemupukan kebun (29,1%). Penerapan sistem blockchain ringan memangkas waktu verifikasi ketelusuran audit dari 14 hari menjadi &lt; 5 detik per lot dengan integritas data 100%.</p>'),(10,'en_US','copyrightHolder','Nirmala Dwi Lestari, Bambang Supriyadi, Mohammad Yanuar Rizky'),(10,'en_US','coverage','Kabupaten Musi Banyuasin, Sumatera Selatan, Indonesia; 2025–2026'),(10,'en_US','rights','Copyright (c) 2026 Nirmala Dwi Lestari, Bambang Supriyadi, Mohammad Yanuar Rizky. Licensed under Creative Commons Attribution 4.0 International (CC BY 4.0) (https://creativecommons.org/licenses/by/4.0/).'),(10,'en_US','source','Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences; Vol. 1, No. 1 (2026); pp. 109–120; e-ISSN: 2988-741X; p-ISSN: 2988-7401'),(10,'en_US','sponsor','Pusat Penelitian Karet Sembawa; Departemen Agrosains UM'),(10,'en_US','subtitle','Audit Emisi Karbon Cradle-to-Gate dan Validasi Asal-Usul Bahan Olah Karet (Bokar)'),(10,'en_US','title','Ketelusuran Rantai Pasok Karet Alam Berkelanjutan Berbasis Blockchain Ringan dan Penilaian Siklus Hidup (Life Cycle Assessment) pada Agroindustri Karet Rakyat'),(10,'en_US','type','Peer-reviewed Article; Review & Case Study Article');
/*!40000 ALTER TABLE `publication_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publications` (
  `publication_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_status` bigint(20) DEFAULT 0,
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `primary_contact_id` bigint(20) DEFAULT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `submission_id` bigint(20) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_section_id` (`section_id`),
  KEY `publications_url_path` (`url_path`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,1,'2026-11-05','2026-11-05 06:15:20',NULL,1,2,1.00,1,3,NULL,1),(2,0,'2026-11-05','2026-11-05 06:15:20',NULL,31,2,2.00,2,3,NULL,1),(3,0,'2026-11-05','2026-11-05 06:15:20',NULL,34,1,3.00,3,3,NULL,1),(4,0,'2026-11-05','2026-11-05 06:15:20',NULL,37,1,4.00,4,3,NULL,1),(5,0,'2026-11-05','2026-11-05 06:15:20',NULL,40,3,5.00,5,3,NULL,1),(6,0,'2026-11-05','2026-11-05 06:15:20',NULL,43,3,6.00,6,3,NULL,1),(7,0,'2026-11-05','2026-11-05 06:15:20',NULL,46,4,7.00,7,3,NULL,1),(8,0,'2026-11-05','2026-11-05 06:15:20',NULL,49,4,8.00,8,3,NULL,1),(9,0,'2026-11-05','2026-11-05 06:15:20',NULL,52,5,9.00,9,3,NULL,1),(10,0,'2026-11-05','2026-11-05 06:15:20',NULL,55,5,10.00,10,3,NULL,1);
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `query_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`query_id`),
  KEY `queries_assoc_id` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES (1,1048585,1,1,1.00,NULL,NULL,0),(2,1048585,1,3,1.00,NULL,NULL,0),(3,1048585,1,4,1.00,NULL,NULL,0),(4,1048585,1,5,1.00,NULL,NULL,0);
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_participants`
--

DROP TABLE IF EXISTS `query_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_participants` (
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_participants`
--

LOCK TABLES `query_participants` WRITE;
/*!40000 ALTER TABLE `query_participants` DISABLE KEYS */;
INSERT INTO `query_participants` VALUES (1,5),(1,6),(1,9),(2,5),(2,6),(2,9),(3,6),(3,9),(4,5),(4,9);
/*!40000 ALTER TABLE `query_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queued_payments`
--

DROP TABLE IF EXISTS `queued_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text DEFAULT NULL,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queued_payments`
--

LOCK TABLES `queued_payments` WRITE;
/*!40000 ALTER TABLE `queued_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `queued_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_assignments`
--

DROP TABLE IF EXISTS `review_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_assignments` (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text DEFAULT NULL,
  `recommendation` smallint(6) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` smallint(6) NOT NULL DEFAULT 0,
  `declined` smallint(6) NOT NULL DEFAULT 0,
  `cancelled` smallint(6) NOT NULL DEFAULT 0,
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint(6) DEFAULT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `review_method` smallint(6) NOT NULL DEFAULT 1,
  `round` smallint(6) NOT NULL DEFAULT 1,
  `step` smallint(6) NOT NULL DEFAULT 1,
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
INSERT INTO `review_assignments` VALUES (1,1,4,NULL,2,'2026-10-14 11:00:00','2026-10-14 11:05:00','2026-10-15 08:30:00','2026-10-25 14:20:00','2026-10-26 09:00:00','2026-11-04 23:59:59','2026-10-21 23:59:59','2026-10-26 09:00:00',0,0,0,NULL,NULL,NULL,5,1,3,2,1,4,1,0),(2,1,6,NULL,1,'2026-10-14 11:10:00','2026-10-14 11:12:00','2026-10-15 09:45:00','2026-10-26 16:10:00','2026-10-27 08:30:00','2026-11-04 23:59:59','2026-10-21 23:59:59','2026-10-27 08:30:00',0,0,0,NULL,NULL,NULL,5,1,3,2,1,4,1,0);
/*!40000 ALTER TABLE `review_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_assignments_backup`
--

DROP TABLE IF EXISTS `review_assignments_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_assignments_backup` (
  `review_id` bigint(20) NOT NULL DEFAULT 0,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `recommendation` smallint(6) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` smallint(6) NOT NULL DEFAULT 0,
  `declined` smallint(6) NOT NULL DEFAULT 0,
  `cancelled` smallint(6) NOT NULL DEFAULT 0,
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint(6) DEFAULT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `review_method` smallint(6) NOT NULL DEFAULT 1,
  `round` smallint(6) NOT NULL DEFAULT 1,
  `step` smallint(6) NOT NULL DEFAULT 1,
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments_backup`
--

LOCK TABLES `review_assignments_backup` WRITE;
/*!40000 ALTER TABLE `review_assignments_backup` DISABLE KEYS */;
INSERT INTO `review_assignments_backup` VALUES (1,1,7,NULL,2,'2026-10-14 11:00:00','2026-10-14 11:05:00','2026-10-15 08:30:00','2026-10-25 14:20:00','2026-10-26 09:00:00','2026-11-04 23:59:59','2026-10-21 23:59:59','2026-10-26 09:00:00',0,0,0,NULL,NULL,NULL,5,1,3,2,1,4,1,0),(2,1,10,NULL,1,'2026-10-14 11:10:00','2026-10-14 11:12:00','2026-10-15 09:45:00','2026-10-26 16:10:00','2026-10-27 08:30:00','2026-11-04 23:59:59','2026-10-21 23:59:59','2026-10-27 08:30:00',0,0,0,NULL,NULL,NULL,5,1,3,2,1,4,1,0);
/*!40000 ALTER TABLE `review_assignments_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_files`
--

DROP TABLE IF EXISTS `review_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_files` (
  `review_id` bigint(20) NOT NULL,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `review_files_pkey` (`review_id`,`submission_file_id`),
  KEY `review_files_review_id` (`review_id`),
  KEY `review_files_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
INSERT INTO `review_files` VALUES (1,2),(2,2);
/*!40000 ALTER TABLE `review_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_element_settings`
--

DROP TABLE IF EXISTS `review_form_element_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_element_settings`
--

LOCK TABLES `review_form_element_settings` WRITE;
/*!40000 ALTER TABLE `review_form_element_settings` DISABLE KEYS */;
INSERT INTO `review_form_element_settings` VALUES (1,'en_US','description','Sejauh mana topik naskah relevan dengan cakupan keilmuan Hortus Journal (agronomi & pemuliaan perkebunan, proteksi hayati, smart plantation IoT/UAV, pascapanen/biomassa sirkular, atau keberlanjutan ISPO/RSPO)?','string'),(1,'en_US','possibleResponses','[\"Sangat Baik (5) – Memenuhi standar publikasi internasional tanpa cacat\",\"Baik (4) – Substansi kuat, hanya memerlukan penyempurnaan minor\",\"Cukup (3) – Memerlukan revisi moderat pada beberapa bagian\",\"Kurang (2) – Memiliki kelemahan mayor yang harus dirombak ulang\",\"Sangat Kurang (1) – Tidak memenuhi standar kelayakan ilmiah\"]','object'),(1,'en_US','question','1. Kesesuaian Fokus & Ruang Lingkup Jurnal (Focus & Scope Alignment)','string'),(2,'en_US','description','Apakah naskah menyajikan kebaruan ilmiah (novelty), analisis state-of-the-art yang jelas, serta kontribusi nyata bagi pemecahan masalah sains perkebunan tropika?','string'),(2,'en_US','possibleResponses','[\"Sangat Baik (5) – Memenuhi standar publikasi internasional tanpa cacat\",\"Baik (4) – Substansi kuat, hanya memerlukan penyempurnaan minor\",\"Cukup (3) – Memerlukan revisi moderat pada beberapa bagian\",\"Kurang (2) – Memiliki kelemahan mayor yang harus dirombak ulang\",\"Sangat Kurang (1) – Tidak memenuhi standar kelayakan ilmiah\"]','object'),(2,'en_US','question','2. Orisinalitas, Kebaruan Ilmiah (Novelty), dan Kontribusi Akademis','string'),(3,'en_US','description','Apakah desain penelitian, spesifikasi instrumen/sensor, ukuran sampel, prosedur kalibrasi, dan metode analisis statistik/pemodelan telah dijelaskan secara akurat dan dapat direplikasi (reproducible)?','string'),(3,'en_US','possibleResponses','[\"Sangat Baik (5) – Memenuhi standar publikasi internasional tanpa cacat\",\"Baik (4) – Substansi kuat, hanya memerlukan penyempurnaan minor\",\"Cukup (3) – Memerlukan revisi moderat pada beberapa bagian\",\"Kurang (2) – Memiliki kelemahan mayor yang harus dirombak ulang\",\"Sangat Kurang (1) – Tidak memenuhi standar kelayakan ilmiah\"]','object'),(3,'en_US','question','3. Ketepatan Metodologi, Rancangan Percobaan, dan Validitas Analisis Statistik','string'),(4,'en_US','description','Apakah data disajikan secara jernih melalui tabel/visualisasi yang informatif, serta dibahas secara tajam dengan membandingkan temuan terhadap literatur primer terkini?','string'),(4,'en_US','possibleResponses','[\"Sangat Baik (5) – Memenuhi standar publikasi internasional tanpa cacat\",\"Baik (4) – Substansi kuat, hanya memerlukan penyempurnaan minor\",\"Cukup (3) – Memerlukan revisi moderat pada beberapa bagian\",\"Kurang (2) – Memiliki kelemahan mayor yang harus dirombak ulang\",\"Sangat Kurang (1) – Tidak memenuhi standar kelayakan ilmiah\"]','object'),(4,'en_US','question','4. Kualitas Penyajian Hasil, Tabel/Gambar, dan Ketajaman Pembahasan','string'),(5,'en_US','description','Apakah naskah mematuhi struktur IMRAD, tata bahasa ilmiah yang baku, batas kata (4.000–7.500 kata), serta menggunakan minimal 25 referensi primer mutakhir (≥80% 10 tahun terakhir) berformat APA 7th Edition?','string'),(5,'en_US','possibleResponses','[\"Sangat Baik (5) – Memenuhi standar publikasi internasional tanpa cacat\",\"Baik (4) – Substansi kuat, hanya memerlukan penyempurnaan minor\",\"Cukup (3) – Memerlukan revisi moderat pada beberapa bagian\",\"Kurang (2) – Memiliki kelemahan mayor yang harus dirombak ulang\",\"Sangat Kurang (1) – Tidak memenuhi standar kelayakan ilmiah\"]','object'),(5,'en_US','question','5. Kepatuhan Struktur IMRAD, Gaya Selingkung, dan Sitasi (APA 7th Edition)','string'),(6,'en_US','description','Centang seluruh aspek kepatuhan etika yang telah terpenuhi pada draf naskah ini:','string'),(6,'en_US','possibleResponses','[\"Berkas naskah telah sepenuhnya anonim (Blind Manuscript tanpa identitas penulis)\",\"Bebas indikasi plagiarisme, duplikasi, atau manipulasi\\/fabrikasi data empiris\",\"Satuan Internasional (SI) dan tata nama ilmiah binomial (italics) telah digunakan dengan benar\",\"Kesimpulan menjawab tujuan penelitian secara spesifik dan didukung data empiris\"]','object'),(6,'en_US','question','6. Verifikasi Kepatuhan Etika Publikasi & Anonimitas Naskah (Double-Blind Check)','string'),(7,'en_US','description','Tuliskan masukan substantif, metodologis, dan teknis secara terperinci (poin demi poin) sebagai pedoman revisi bagi Penulis:','string'),(7,'en_US','question','7. Catatan Evaluasi Konstruktif & Daftar Perbaikan bagi Penulis (Comments to Author)','string');
/*!40000 ALTER TABLE `review_form_element_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_elements`
--

DROP TABLE IF EXISTS `review_form_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` smallint(6) DEFAULT NULL,
  `included` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_elements`
--

LOCK TABLES `review_form_elements` WRITE;
/*!40000 ALTER TABLE `review_form_elements` DISABLE KEYS */;
INSERT INTO `review_form_elements` VALUES (1,1,1.00,5,1,1),(2,1,2.00,5,1,1),(3,1,3.00,5,1,1),(4,1,4.00,5,1,1),(5,1,5.00,5,1,1),(6,1,6.00,4,1,1),(7,1,7.00,3,1,1);
/*!40000 ALTER TABLE `review_form_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_responses`
--

DROP TABLE IF EXISTS `review_form_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text DEFAULT NULL,
  KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_responses`
--

LOCK TABLES `review_form_responses` WRITE;
/*!40000 ALTER TABLE `review_form_responses` DISABLE KEYS */;
INSERT INTO `review_form_responses` VALUES (1,1,'int','0'),(2,1,'int','0'),(3,1,'int','1'),(4,1,'int','0'),(5,1,'int','0'),(6,1,'object','[0,1,2,3]'),(7,1,'string','Naskah ini memiliki kebaruan ilmiah (novelty) yang sangat baik dalam mengintegrasikan sensor IoT iklim mikro kanopi LoRaWAN dengan citra multispektral UAV untuk estimasi produktivitas kelapa sawit (Elaeis guineensis Jacq.). Struktur IMRAD dan sitasi APA 7th Edition telah dipatuhi dengan rapi.\n\nCatatan Perbaikan Minor (Revisions Required) sebelum diterbitkan:\n1. Pada Bagian 2 (Metode Penelitian): Mohon tambahkan rincian prosedur kalibrasi radiometrik panel reflektansi wahana UAV DJI Mavic 3 Multispectral serta cantumkan uji signifikansi statistik (ANOVA dan uji lanjut Tukey HSD α = 0,05).\n2. Pada Bagian 3 (Hasil dan Pembahasan): Pertajam interpretasi kontribusi variabel menggunakan nilai SHAP (SHapley Additive exPlanations) untuk menjelaskan mengapa kanal Red Edge (NDRE) dan kelembapan volumetrik tanah (VWC) lebih sensitif mendeteksi defisiensi hara dibandingkan NDVI.\n3. Pada Abstrak: Cantumkan nilai p-value dan persentase peningkatan akurasi model secara eksplisit.'),(1,2,'int','0'),(2,2,'int','0'),(3,2,'int','0'),(4,2,'int','0'),(5,2,'int','0'),(6,2,'object','[0,1,2,3]'),(7,2,'string','Naskah sangat relevan dengan peta jalan perkebunan presisi berkelanjutan (ISPO). Metodologi eksperimental pada kebun kelapa sawit TM-12 seluas 120 ha sangat representatif. Direkomendasikan diterima (Accept) setelah penulis melengkapi detail kalibrasi radiometrik sesuai masukan penelaah.');
/*!40000 ALTER TABLE `review_form_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_settings`
--

DROP TABLE IF EXISTS `review_form_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_settings` (
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_settings`
--

LOCK TABLES `review_form_settings` WRITE;
/*!40000 ALTER TABLE `review_form_settings` DISABLE KEYS */;
INSERT INTO `review_form_settings` VALUES (1,'en_US','description','<p>Instrumen penilaian terstandar bagi Mitra Bebestari (<em>Reviewer</em>) <strong>Hortus Journal</strong> untuk mengevaluasi kelayakan naskah secara objektif berdasarkan orisinalitas, ketepatan metodologi, kualitas analisis data, kepatuhan struktur IMRAD, dan kemutakhiran sitasi APA 7th Edition.</p>','string'),(1,'en_US','title','Formulir Evaluasi Substantif & Metodologis Naskah (Double-Blind Peer Review Form – Hortus Journal)','string');
/*!40000 ALTER TABLE `review_form_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_forms`
--

DROP TABLE IF EXISTS `review_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_forms` (
  `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `seq` double(8,2) DEFAULT NULL,
  `is_active` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_forms`
--

LOCK TABLES `review_forms` WRITE;
/*!40000 ALTER TABLE `review_forms` DISABLE KEYS */;
INSERT INTO `review_forms` VALUES (1,256,1,1.00,1);
/*!40000 ALTER TABLE `review_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_round_files`
--

DROP TABLE IF EXISTS `review_round_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_round_files` (
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` smallint(6) NOT NULL,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`submission_file_id`),
  KEY `review_round_files_submission_id` (`submission_id`),
  KEY `review_round_files_submission_file_id_foreign` (`submission_file_id`),
  CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_files`
--

LOCK TABLES `review_round_files` WRITE;
/*!40000 ALTER TABLE `review_round_files` DISABLE KEYS */;
INSERT INTO `review_round_files` VALUES (1,1,3,2),(1,1,3,3);
/*!40000 ALTER TABLE `review_round_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_rounds`
--

DROP TABLE IF EXISTS `review_rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_rounds` (
  `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` smallint(6) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_rounds`
--

LOCK TABLES `review_rounds` WRITE;
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
INSERT INTO `review_rounds` VALUES (1,1,3,1,NULL,4);
/*!40000 ALTER TABLE `review_rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_tasks`
--

DROP TABLE IF EXISTS `scheduled_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  UNIQUE KEY `scheduled_tasks_pkey` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_tasks`
--

LOCK TABLES `scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `scheduled_tasks` DISABLE KEYS */;
INSERT INTO `scheduled_tasks` VALUES ('classes.tasks.SubscriptionExpiryReminder','2026-11-03 18:40:15'),('lib.pkp.classes.task.ReviewReminder','2026-11-15 13:02:56'),('lib.pkp.classes.task.StatisticsReport','2026-11-03 18:40:15'),('plugins.generic.usageStats.UsageStatsLoader','2026-11-15 13:02:56'),('plugins.importexport.crossref.CrossrefInfoSender','2026-11-15 13:02:56'),('plugins.importexport.datacite.DataciteInfoSender','2026-11-15 13:02:56'),('plugins.importexport.doaj.DOAJInfoSender','2026-11-15 13:02:56');
/*!40000 ALTER TABLE `scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_settings`
--

DROP TABLE IF EXISTS `section_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_settings` (
  `section_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_settings`
--

LOCK TABLES `section_settings` WRITE;
/*!40000 ALTER TABLE `section_settings` DISABLE KEYS */;
INSERT INTO `section_settings` VALUES (1,'en_US','abbrev','AGR','string'),(1,'en_US','identifyType','Original Research Article','string'),(1,'en_US','policy','Menerima artikel riset orisinal di bidang agronomi tanaman perkebunan tropika, fisiologi tanaman tahunan, bioteknologi pemuliaan, dan manajemen kesuburan tanah gambut/mineral. Evaluasi menggunakan Double-Blind Peer Review (2–4 minggu) dengan struktur IMRAD (4.000–7.500 kata).','string'),(1,'en_US','title','Original Research Articles (Agronomy, Physiology & Plantation Breeding)','string'),(2,'en_US','abbrev','SPP','string'),(2,'en_US','identifyType','Original Research Article','string'),(2,'en_US','policy','Menerima artikel riset orisinal di bidang penginderaan jauh UAV/drone multispektral, jaringan sensor IoT kanopi/tanah, pemetaan WebGIS, dan pemodelan kecerdasan buatan (AI/Machine Learning) untuk perkebunan presisi. Evaluasi menggunakan Double-Blind Peer Review.','string'),(2,'en_US','title','Smart & Precision Plantation Farming (IoT, UAV & AI Modeling)','string'),(3,'en_US','abbrev','IBP','string'),(3,'en_US','identifyType','Original Research Article','string'),(3,'en_US','policy','Menerima artikel riset di bidang pengendalian hayati terpadu, epidemiologi hama dan patogen tanaman perkebunan, serta kesehatan ekosistem agroforestri tropika.','string'),(3,'en_US','title','Integrated Bio-Protection & Plantation Ecosystem Health','string'),(4,'en_US','abbrev','PBC','string'),(4,'en_US','identifyType','Original Research Article','string'),(4,'en_US','policy','Menerima artikel riset di bidang pengolahan pascapanen perkebunan, ekstraksi senyawa bioaktif, dan valorisasi biomassa limbah (TKKS, POME, kulit kopi/kakao) menuju bioekonomi sirkular.','string'),(4,'en_US','title','Postharvest Technology, Biomass Valorization & Circular Agro-Industry','string'),(5,'en_US','abbrev','SES','string'),(5,'en_US','identifyType','Review & Case Study Article','string'),(5,'en_US','policy','Menerima artikel riset, reviu kritis, dan studi kasus kebijakan rantai pasok agribisnis, sertifikasi keberlanjutan ISPO/RSPO/Rainforest Alliance, serta pemberdayaan pekebun swadaya.','string'),(5,'en_US','title','Socio-Economics, Agribusiness Supply Chain & Sustainability Certification (ISPO/RSPO)','string');
/*!40000 ALTER TABLE `section_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `section_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double(8,2) NOT NULL DEFAULT 0.00,
  `editor_restricted` smallint(6) NOT NULL DEFAULT 0,
  `meta_indexed` smallint(6) NOT NULL DEFAULT 0,
  `meta_reviewed` smallint(6) NOT NULL DEFAULT 1,
  `abstracts_not_required` smallint(6) NOT NULL DEFAULT 0,
  `hide_title` smallint(6) NOT NULL DEFAULT 0,
  `hide_author` smallint(6) NOT NULL DEFAULT 0,
  `is_inactive` smallint(6) NOT NULL DEFAULT 0,
  `abstract_word_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,1,1,1.00,0,1,1,0,0,0,0,250),(2,1,1,2.00,0,1,1,0,0,0,0,250),(3,1,1,3.00,0,1,1,0,0,0,0,250),(4,1,1,4.00,0,1,1,0,0,0,0,250),(5,1,1,5.00,0,1,1,0,0,0,0,250);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT 0,
  `last_used` bigint(20) NOT NULL DEFAULT 0,
  `remember` smallint(6) NOT NULL DEFAULT 0,
  `data` text NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  UNIQUE KEY `sessions_pkey` (`session_id`),
  KEY `sessions_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('1mf2mo769fs25unvbf7ghkma4r',NULL,'::1','python-requests/2.33.0',1794746309,1794746309,0,'','localhost'),('1vt5rjnms6l6u4j1jov3hfv4h2',NULL,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/155.0.0.0 Safari/537.36',1793855800,1793855808,0,'','localhost'),('22hhtkrclvsdqchtmsme600s5b',NULL,'::1','curl/8.23.0',1793858869,1793858869,0,'','localhost'),('4blf8jnu0o7lo6ih20eimg3rl9',NULL,'::1','curl/8.23.0',1793858870,1793858870,0,'csrf|a:2:{s:9:\"timestamp\";i:1793858870;s:5:\"token\";s:32:\"d7d3b7ba027f2e36e8b22920d21bfa84\";}','localhost'),('4kgcb4ntjq91v9l322gld50c14',NULL,'::1','curl/8.23.0',1793858870,1793858870,0,'','localhost'),('52vdus58d9nsu14mhjeeru3l8q',NULL,'::1','curl/8.23.0',1793852634,1793852634,0,'csrf|a:2:{s:9:\"timestamp\";i:1793852634;s:5:\"token\";s:32:\"a72432addb8a5d951e27669aa6cc5071\";}','localhost'),('55p0jic24mchgt9nk6010a9lh2',NULL,'::1','curl/8.23.0',1793858870,1793858870,0,'','localhost'),('64t2t4d6m4uaqfjsetrpolv0eb',NULL,'::1','curl/8.23.0',1794746320,1794746320,0,'','localhost'),('65e6h0oo9745ejrflgu7lfi262',NULL,'::1','curl/8.23.0',1793858868,1793858868,0,'','localhost'),('6vtofpti7gqlfar8ta626c3u7a',NULL,'::1','curl/8.23.0',1793866066,1793866066,0,'','localhost'),('7f0h3uueljsv71ill50as8q7tq',NULL,'::1','curl/8.23.0',1794744451,1794744451,0,'','localhost'),('7kd33j1oiv2igd05ut047tqdl0',NULL,'::1','curl/8.23.0',1794746320,1794746320,0,'','localhost'),('8g78dfhprk70dp5lnqbh0lgva0',NULL,'::1','curl/8.23.0',1793858870,1793858870,0,'','localhost'),('8ni4oh5nr5hcr3k59hv2t0v8fc',NULL,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/155.0.0.0 Safari/537.36',1793856649,1793856657,0,'','localhost'),('9l32emquhmj6rf3jjo4jc8ke2v',NULL,'::1','python-requests/2.33.0',1794746310,1794746310,0,'','localhost'),('amqnfmgilqqftlo6n0lrrbjoqi',NULL,'::1','curl/8.23.0',1794746330,1794746330,0,'','localhost'),('asefocqbpaumhtm2fecceu9jae',NULL,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/155.0.0.0 Safari/537.36',1793855741,1793855749,0,'','localhost'),('bsd71h6q2lclvocmlvalg9l658',NULL,'::1','curl/8.23.0',1793858871,1793858871,0,'','localhost'),('cojf8f7401oel8t2lm5h68f8l5',NULL,'::1','curl/8.23.0',1793858869,1793858869,0,'','localhost'),('cpbrms0qg9gqf3kg26r4k1lgi3',NULL,'::1','curl/8.23.0',1793858869,1793858869,0,'','localhost'),('dh8n20p91dbo2jj6m1m0e2vdr6',NULL,'::1','python-requests/2.33.0',1794746308,1794746308,0,'','localhost'),('gekhvb1pfv9485prqd1hrtkgo6',NULL,'::1','curl/8.23.0',1794744176,1794744176,0,'','localhost'),('hnm89nnp3kn1kpe77e1v40fa3l',NULL,'::1','curl/8.23.0',1794744594,1794744594,0,'','localhost'),('hoqh6enak74u0hnktrhvrvo43c',NULL,'::1','python-requests/2.33.0',1794746310,1794746310,0,'','localhost'),('hrivmolb2suekfqcptfaltojhm',NULL,'::1','curl/8.23.0',1793858869,1793858869,0,'','localhost'),('kpng6gse8e4flgnsbjcspakoe1',NULL,'','',1793852934,1793852934,0,'','localhost'),('kspamtj1hfohkbj9n0ik8iqqr5',NULL,'::1','curl/8.23.0',1793858871,1793858871,0,'csrf|a:2:{s:9:\"timestamp\";i:1793858871;s:5:\"token\";s:32:\"010ccc5c80b2e4d1b9613942d0eee347\";}','localhost'),('l92mcag2einanvs4k17r1b2unv',NULL,'::1','python-requests/2.33.0',1794746310,1794746310,0,'','localhost'),('mfnsdlgqtpcfnp8ubo6cf8drj2',NULL,'::1','curl/8.23.0',1793885882,1793885882,0,'','localhost'),('nohud0q3ocptuuull4icpc04c4',NULL,'::1','python-requests/2.33.0',1794746309,1794746309,0,'','localhost'),('polcd30tbf1hkdrjaugm2orp1h',NULL,'::1','curl/8.23.0',1793858870,1793858870,0,'','localhost'),('ptqdl5jhkm8a2n8c61dqffjt4h',NULL,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36',1793854000,1793859740,0,'csrf|a:2:{s:9:\"timestamp\";i:1793856594;s:5:\"token\";s:32:\"96bde1e9b2b2805deabfd0c40654036d\";}','localhost'),('r8ufgckbor9a35j2he8cc4g84m',NULL,'::1','curl/8.23.0',1794746321,1794746321,0,'','localhost'),('rm8nvcuo6mm18lq89m4tjela92',NULL,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/155.0.0.0 Safari/537.36',1793856563,1793856572,0,'','localhost'),('rotagneu4kcp7v48lcjq38r38v',4,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36',1794326279,1794327748,1,'csrf|a:2:{s:9:\"timestamp\";i:1794327749;s:5:\"token\";s:32:\"8b061061681a3200a0d25bcb542dc6e5\";}userId|i:4;username|s:6:\"yanuar\";','localhost'),('tji1ucbmc9jn7na76jvoitvues',NULL,'::1','curl/8.23.0',1793858869,1793858869,0,'','localhost'),('vn6bjt5uqtkqg3vijrlcqvta9c',7,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/155.0.0.0 Safari/537.36',1793852894,1793854746,1,'csrf|a:2:{s:9:\"timestamp\";i:1793854746;s:5:\"token\";s:32:\"388a43092f274d3ab1b3da63d0902d04\";}username|s:11:\"reviewer_01\";userId|i:7;','localhost');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `redirect` bigint(20) NOT NULL DEFAULT 0 COMMENT 'If not 0, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(14) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint(6) NOT NULL DEFAULT 6,
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en_US' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (0,'en_US',6,'[\"en_US\"]','[\"en_US\"]',NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` text DEFAULT NULL,
  UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES ('contactEmail','en_US','yansmurf7@gmail.com'),('contactName','en_US','Open Journal Systems'),('themePluginPath','','default');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_assignments`
--

DROP TABLE IF EXISTS `stage_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stage_assignments` (
  `stage_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` smallint(6) NOT NULL DEFAULT 0,
  `can_change_metadata` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,2,4,'2026-11-05 06:15:20',0,1),(2,1,3,5,'2026-11-05 06:15:20',0,1),(3,1,5,6,'2026-11-05 06:15:20',0,1),(4,1,14,9,'2026-11-05 06:15:20',0,1),(5,1,11,9,'2026-11-05 06:15:20',0,0),(6,1,7,9,'2026-11-05 06:15:20',0,0),(43,2,2,4,'2026-11-05 06:15:20',0,1),(44,2,3,5,'2026-11-05 06:15:20',0,1),(45,2,5,6,'2026-11-05 06:15:20',0,1),(46,2,14,4,'2026-11-05 06:15:20',0,1),(47,3,2,4,'2026-11-05 06:15:20',0,1),(48,3,3,5,'2026-11-05 06:15:20',0,1),(49,3,5,6,'2026-11-05 06:15:20',0,1),(50,3,14,9,'2026-11-05 06:15:20',0,1),(51,4,2,4,'2026-11-05 06:15:20',0,1),(52,4,3,5,'2026-11-05 06:15:20',0,1),(53,4,5,6,'2026-11-05 06:15:20',0,1),(54,4,14,9,'2026-11-05 06:15:20',0,1),(55,5,2,4,'2026-11-05 06:15:20',0,1),(56,5,3,5,'2026-11-05 06:15:20',0,1),(57,5,5,6,'2026-11-05 06:15:20',0,1),(58,5,14,9,'2026-11-05 06:15:20',0,1),(59,6,2,4,'2026-11-05 06:15:20',0,1),(60,6,3,5,'2026-11-05 06:15:20',0,1),(61,6,5,6,'2026-11-05 06:15:20',0,1),(62,6,14,9,'2026-11-05 06:15:20',0,1),(63,7,2,4,'2026-11-05 06:15:20',0,1),(64,7,3,5,'2026-11-05 06:15:20',0,1),(65,7,5,6,'2026-11-05 06:15:20',0,1),(66,7,14,9,'2026-11-05 06:15:20',0,1),(67,8,2,4,'2026-11-05 06:15:20',0,1),(68,8,3,5,'2026-11-05 06:15:20',0,1),(69,8,5,6,'2026-11-05 06:15:20',0,1),(70,8,14,9,'2026-11-05 06:15:20',0,1),(71,9,2,4,'2026-11-05 06:15:20',0,1),(72,9,3,5,'2026-11-05 06:15:20',0,1),(73,9,5,6,'2026-11-05 06:15:20',0,1),(74,9,14,4,'2026-11-05 06:15:20',0,1),(75,10,2,4,'2026-11-05 06:15:20',0,1),(76,10,3,5,'2026-11-05 06:15:20',0,1),(77,10,5,6,'2026-11-05 06:15:20',0,1),(78,10,14,6,'2026-11-05 06:15:20',0,1);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_assignments_backup`
--

DROP TABLE IF EXISTS `stage_assignments_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stage_assignments_backup` (
  `stage_assignment_id` bigint(20) NOT NULL DEFAULT 0,
  `submission_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` smallint(6) NOT NULL DEFAULT 0,
  `can_change_metadata` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments_backup`
--

LOCK TABLES `stage_assignments_backup` WRITE;
/*!40000 ALTER TABLE `stage_assignments_backup` DISABLE KEYS */;
INSERT INTO `stage_assignments_backup` VALUES (1,1,2,4,'2026-11-05 06:15:20',0,1),(2,1,3,5,'2026-11-05 06:15:20',0,1),(3,1,5,6,'2026-11-05 06:15:20',0,1),(4,1,14,8,'2026-11-05 06:15:20',0,1),(5,1,11,9,'2026-11-05 06:15:20',0,0),(6,1,7,9,'2026-11-05 06:15:20',0,0);
/*!40000 ALTER TABLE `stage_assignments_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page_settings`
--

DROP TABLE IF EXISTS `static_page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  KEY `static_page_settings_static_page_id` (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_page_settings`
--

LOCK TABLES `static_page_settings` WRITE;
/*!40000 ALTER TABLE `static_page_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_page_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_pages`
--

DROP TABLE IF EXISTS `static_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_pages` (
  `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_pages`
--

LOCK TABLES `static_pages` WRITE;
/*!40000 ALTER TABLE `static_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subeditor_submission_group`
--

DROP TABLE IF EXISTS `subeditor_submission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subeditor_submission_group` (
  `context_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`context_id`,`assoc_id`,`assoc_type`,`user_id`),
  KEY `section_editors_context_id` (`context_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  KEY `subeditor_submission_group_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
INSERT INTO `subeditor_submission_group` VALUES (1,1,530,5),(1,1,530,6),(1,2,530,5),(1,2,530,6),(1,3,530,5),(1,3,530,6),(1,4,530,5),(1,4,530,6),(1,5,530,5),(1,5,530,6);
/*!40000 ALTER TABLE `subeditor_submission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_comments`
--

DROP TABLE IF EXISTS `submission_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` text NOT NULL,
  `comments` text DEFAULT NULL,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
INSERT INTO `submission_comments` VALUES (3,1,4096,1,1,7,'Evaluasi Substantif & Metodologis Naskah #1','Naskah ini memiliki kebaruan ilmiah (novelty) yang sangat baik dalam mengintegrasikan sensor IoT iklim mikro kanopi LoRaWAN dengan citra multispektral UAV untuk estimasi produktivitas kelapa sawit (Elaeis guineensis Jacq.). Struktur IMRAD dan sitasi APA 7th Edition telah dipatuhi dengan rapi.<br />\n<br />\nCatatan Perbaikan Minor (Revisions Required) sebelum diterbitkan:<br />\n1. Pada Bagian 2 (Metode Penelitian): Mohon tambahkan rincian prosedur kalibrasi radiometrik panel reflektansi wahana UAV DJI Mavic 3 Multispectral serta cantumkan uji signifikansi statistik (ANOVA dan uji lanjut Tukey HSD α = 0,05).<br />\n2. Pada Bagian 3 (Hasil dan Pembahasan): Pertajam interpretasi kontribusi variabel menggunakan nilai SHAP (SHapley Additive exPlanations) untuk menjelaskan mengapa kanal Red Edge (NDRE) dan kelembapan volumetrik tanah (VWC) lebih sensitif mendeteksi defisiensi hara dibandingkan NDVI.<br />\n3. Pada Abstrak: Cantumkan nilai p-value dan persentase peningkatan akurasi model secara eksplisit.','2026-10-25 14:20:00',NULL,1);
/*!40000 ALTER TABLE `submission_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_revisions`
--

DROP TABLE IF EXISTS `submission_file_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_file_revisions` (
  `revision_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint(20) unsigned NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`revision_id`),
  KEY `submission_file_revisions_submission_file_id_foreign` (`submission_file_id`),
  KEY `submission_file_revisions_file_id_foreign` (`file_id`),
  CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`),
  CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (17,1,1),(18,2,2),(19,3,3),(20,4,4),(21,5,5),(22,6,6),(23,7,7);
/*!40000 ALTER TABLE `submission_file_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_file_settings` (
  `submission_file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL DEFAULT 'string' COMMENT '(bool|int|float|string|object|date)',
  UNIQUE KEY `submission_file_settings_pkey` (`submission_file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_id` (`submission_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (1,'en_US','name','Naskah_Submisi_Awal_Anonim_Hortus_Journal.docx','string'),(2,'en_US','name','Naskah_Anonim_Evaluasi_DoubleBlind_Round1.docx','string'),(3,'en_US','name','Naskah_Revisi_Author_Terverifikasi_Hortus_Journal.docx','string'),(4,'en_US','name','Naskah_Diterima_Siap_Copyediting.docx','string'),(5,'en_US','name','Naskah_Copyedited_Final_Terverifikasi_HJ.docx','string'),(6,'en_US','name','Naskah_Master_Produksi_Galley_HJ.docx','string'),(7,'en_US','name','Galley_Final_HJ_Vol1_No1_2026.pdf','string'),(17,'en_US','name','Galley_Final_HJ_Vol1_No1_2026_Art02.pdf','string'),(18,'en_US','name','Galley_Final_HJ_Vol1_No1_2026_Art03.pdf','string'),(19,'en_US','name','Galley_Final_HJ_Vol1_No1_2026_Art04.pdf','string'),(20,'en_US','name','Galley_Final_HJ_Vol1_No1_2026_Art05.pdf','string'),(21,'en_US','name','Galley_Final_HJ_Vol1_No1_2026_Art06.pdf','string'),(22,'en_US','name','Galley_Final_HJ_Vol1_No1_2026_Art07.pdf','string'),(23,'en_US','name','Galley_Final_HJ_Vol1_No1_2026_Art08.pdf','string'),(24,'en_US','name','Galley_Final_HJ_Vol1_No1_2026_Art09.pdf','string'),(25,'en_US','name','Galley_Final_HJ_Vol1_No1_2026_Art10.pdf','string');
/*!40000 ALTER TABLE `submission_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_files`
--

DROP TABLE IF EXISTS `submission_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_files` (
  `submission_file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `source_submission_file_id` bigint(20) DEFAULT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`submission_file_id`),
  KEY `submission_files_submission_id` (`submission_id`),
  KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  KEY `submission_files_file_id_foreign` (`file_id`),
  CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,1,2,NULL,NULL,1,'2026-10-12 09:15:00','2026-10-12 09:15:00',8,NULL,NULL),(2,1,2,NULL,1,4,NULL,NULL,1,'2026-10-14 10:30:00','2026-10-14 10:30:00',5,523,1),(3,1,3,NULL,1,15,NULL,NULL,1,'2026-10-29 15:40:00','2026-10-29 15:40:00',8,523,1),(4,1,4,NULL,1,6,NULL,NULL,1,'2026-10-30 10:15:00','2026-10-30 10:15:00',6,NULL,NULL),(5,1,5,NULL,1,9,NULL,NULL,1,'2026-11-02 13:20:00','2026-11-02 13:20:00',9,NULL,NULL),(6,1,6,NULL,1,11,NULL,NULL,1,'2026-11-03 16:00:00','2026-11-03 16:00:00',9,NULL,NULL),(7,1,7,NULL,1,10,NULL,NULL,1,'2026-11-04 11:00:00','2026-11-04 11:00:00',9,521,1),(17,2,17,NULL,1,10,NULL,NULL,1,'2026-11-05 06:15:20','2026-11-05 06:15:20',4,521,2),(18,3,18,NULL,1,10,NULL,NULL,1,'2026-11-05 06:15:20','2026-11-05 06:15:20',4,521,3),(19,4,19,NULL,1,10,NULL,NULL,1,'2026-11-05 06:15:20','2026-11-05 06:15:20',4,521,4),(20,5,20,NULL,1,10,NULL,NULL,1,'2026-11-05 06:15:20','2026-11-05 06:15:20',4,521,5),(21,6,21,NULL,1,10,NULL,NULL,1,'2026-11-05 06:15:20','2026-11-05 06:15:20',4,521,6),(22,7,22,NULL,1,10,NULL,NULL,1,'2026-11-05 06:15:20','2026-11-05 06:15:20',4,521,7),(23,8,23,NULL,1,10,NULL,NULL,1,'2026-11-05 06:15:20','2026-11-05 06:15:20',4,521,8),(24,9,24,NULL,1,10,NULL,NULL,1,'2026-11-05 06:15:20','2026-11-05 06:15:20',4,521,9),(25,10,25,NULL,1,10,NULL,NULL,1,'2026-11-05 06:15:20','2026-11-05 06:15:20',4,521,10);
/*!40000 ALTER TABLE `submission_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_keyword_list`
--

DROP TABLE IF EXISTS `submission_search_keyword_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `submission_search_keyword_text` (`keyword_text`)
) ENGINE=InnoDB AUTO_INCREMENT=1791 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (1770,'10-fold'),(1195,'10⁶'),(1193,'10⁷'),(1396,'1200–1550'),(1133,'2024–2025'),(1487,'2024–2026'),(1033,'2025–2026'),(1217,'26-fold'),(1371,'35–45'),(1372,'50–65'),(1547,'9-month'),(1650,'abiotic'),(1603,'abiotik'),(1681,'acak'),(1210,'accelerated'),(1202,'accumulation'),(1201,'acid'),(1525,'acidic'),(1172,'acids'),(1605,'adaptif'),(1306,'adsorben'),(1266,'adsorpsi'),(1744,'aerial'),(1417,'agens'),(1035,'agribisnis'),(1024,'agribusiness'),(1130,'agricultural'),(1493,'agriculture'),(1019,'agro-industry'),(1395,'agroecology'),(1664,'agroekosistem'),(1116,'agroforestri'),(1388,'agroforestry'),(934,'agroindustri'),(1575,'agronomy'),(900,'agrosains'),(1488,'ahmad'),(1608,'air'),(1052,'akselerasi'),(1253,'aktif'),(1262,'aktivasi'),(1470,'aktivitas'),(1670,'aktuasi'),(1587,'akumulasi'),(1775,'akurasi'),(921,'alam'),(1338,'alami'),(1766,'algoritma'),(1373,'alpukat'),(1042,'amalia'),(1692,'ambang'),(1507,'ameliorants'),(1551,'amending'),(1404,'aminah'),(1197,'anaerobic'),(1044,'analisis'),(1234,'analysis'),(1436,'ancaman'),(1245,'anggraini'),(1425,'antagonisme'),(1305,'aplikasi'),(1353,'arabica'),(1340,'arabika'),(1499,'arif'),(962,'arsitektur'),(1026,'article'),(1466,'asahan'),(1300,'asal'),(941,'asal-usul'),(1413,'asperellum'),(932,'assessment'),(936,'audit'),(1521,'availability'),(1076,'awal'),(1580,'badan'),(1055,'bagi'),(1141,'bagus'),(942,'bahan'),(1098,'bahwa'),(1447,'bakteri'),(906,'balai'),(904,'bambang'),(947,'banyak'),(1032,'banyuasin'),(1231,'banyuwangi'),(1087,'barat'),(1387,'bassiana'),(1421,'batang'),(1693,'batas'),(1644,'bawah'),(1449,'bc-09'),(1166,'beans'),(1386,'beauveria'),(952,'bebas'),(995,'berasal'),(1296,'berat'),(1284,'beratmosfer'),(923,'berbasis'),(966,'berizin'),(922,'berkelanjutan'),(1272,'bernilai'),(1728,'berorientasi'),(1104,'berpengaruh'),(1254,'berpori'),(1270,'berpotensi'),(1114,'bersertifikat'),(1122,'bersih'),(1739,'bertujuan'),(964,'besar'),(1304,'bet'),(1454,'biakan'),(1075,'biaya'),(1702,'biji'),(1096,'biner'),(1252,'bio-oil'),(1286,'biochar'),(1506,'biochar-enriched'),(1322,'bioenergy'),(1601,'biokimia'),(1477,'biological'),(1316,'biomass'),(1321,'biomassa'),(1228,'bioprocess'),(1198,'bioreactors'),(1260,'biorefinery'),(1223,'biotechnology'),(1150,'bioteknologi'),(1187,'bitter-phenolic'),(1091,'blended'),(924,'blockchain'),(1747,'blok'),(1638,'bobot'),(1504,'bogor'),(944,'bokar'),(1423,'boninense'),(1434,'bpb'),(1021,'brasiliensis'),(1330,'brawijaya'),(1649,'breeding'),(1583,'brin'),(1251,'buah'),(1102,'budidaya'),(1500,'budiman'),(963,'buku'),(1465,'bulan'),(1541,'bunch'),(1414,'burkholderia'),(1419,'busuk'),(1592,'cacao'),(1257,'cair'),(1179,'canephora'),(1519,'capacity'),(1028,'case'),(1517,'cation'),(1593,'cekaman'),(1384,'cendawan'),(1415,'cepacia'),(1346,'cephalonomia'),(1658,'cerdas'),(1159,'cerevisiae'),(1124,'certification'),(1194,'cfu'),(1015,'chain'),(1309,'chemical'),(1138,'cirad'),(1318,'circular'),(1721,'citra'),(1190,'co-inoculation'),(1312,'cod'),(1178,'coffea'),(1224,'coffee'),(1557,'compared'),(1545,'compost'),(1200,'consumption'),(1221,'control'),(1152,'controlled'),(1560,'controls'),(1207,'correlated'),(992,'co₂-eq'),(1220,'cqi'),(939,'cradle-to-gate'),(1648,'crop'),(1772,'cross-validation'),(1192,'cultures'),(1174,'cupping'),(1679,'cwsi'),(931,'cycle'),(1374,'dadap'),(1101,'daftar'),(1051,'dalam'),(926,'dan'),(1349,'dapat'),(996,'dari'),(1013,'data'),(1341,'dataran'),(1631,'daun'),(1456,'daya'),(1665,'defisit'),(953,'deforestasi'),(1212,'degradation'),(1311,'demand'),(971,'dengan'),(899,'departemen'),(1653,'deteksi'),(1011,'detik'),(1244,'dewi'),(1288,'diaktivasi'),(1380,'dibandingkan'),(1561,'dickson'),(1325,'didik'),(1759,'diekstraksi'),(1753,'difference'),(970,'dihubungkan'),(1356,'dikendalikan'),(1761,'dikombinasikan'),(1271,'dikonversi'),(1683,'dilaksanakan'),(1331,'dinamika'),(1654,'dini'),(1785,'direkomendasikan'),(1435,'disebabkan'),(1469,'disertai'),(1632,'diukur'),(1307,'dosis'),(1397,'dpl'),(1563,'dqi'),(1750,'dua'),(1619,'durasi'),(897,'dwi'),(1554,'ecec'),(1389,'ecology'),(1131,'economics'),(1481,'ecosystem'),(1757,'edge'),(1552,'efb-biochar'),(1542,'efb-derived'),(1553,'effective'),(1715,'efficiency'),(1292,'effluent'),(1410,'efikasi'),(1661,'efisiensi'),(1358,'ekologis'),(1037,'ekonomi'),(1604,'ekspansi'),(1746,'eksperimen'),(1725,'eksperimental'),(1512,'elaeis'),(1218,'elevated'),(937,'emisi'),(1612,'empat'),(1539,'empty'),(1684,'enam'),(1448,'endofit'),(998,'energi'),(1023,'engineering'),(1160,'enhance'),(1516,'enhancing'),(1543,'enriched'),(1393,'entomology'),(1385,'entomopatogen'),(1568,'environmentally'),(1471,'enzim'),(1779,'error'),(1567,'establishing'),(1204,'ester'),(1170,'esters'),(1724,'estimasi'),(1215,'ethyl-acetate'),(954,'eudr'),(1424,'evaluasi'),(1209,'evaluations'),(1186,'excessive'),(1518,'exchange'),(1548,'experiment'),(968,'fabric'),(1492,'faculty'),(1235,'fajar'),(1623,'faktorial'),(1036,'fakultas'),(1667,'fase'),(1153,'fermentation'),(1574,'fertility'),(1571,'fertilization'),(1533,'fertilizer'),(1093,'finance'),(1110,'finansial'),(1163,'fine'),(1652,'fisiologi'),(1586,'fisiologis'),(1774,'fitur'),(1634,'flame'),(1161,'flavor'),(1226,'food'),(1768,'forest'),(1764,'fotosintetik'),(1140,'france'),(1181,'frequently'),(1315,'freundlich'),(1540,'fruit'),(1214,'fruity'),(1461,'fungisida'),(1773,'fusi'),(1408,'gadjah'),(1733,'gambut'),(1455,'ganda'),(1422,'ganoderma'),(988,'gas'),(1595,'genangan'),(1432,'generasi'),(1205,'generation'),(1127,'governance'),(1092,'green'),(1513,'guineensis'),(1405,'hama'),(1457,'hambat'),(1335,'hampei'),(1112,'harga'),(1009,'hari'),(1326,'haryono'),(985,'hasil'),(1394,'hayati'),(1482,'health'),(1463,'heksakonazol'),(1687,'hektare'),(1398,'hendra'),(1731,'heterogenitas'),(1020,'hevea'),(929,'hidup'),(1532,'high'),(1050,'hijau'),(1351,'hingga'),(1196,'hours'),(1203,'hplc'),(1206,'hs-spme-gc-ms'),(1544,'humic'),(967,'hyperledger'),(1334,'hypothenemus'),(1145,'iccri'),(1486,'iii'),(1366,'ijen-raung'),(1606,'iklim'),(1501,'ilmu'),(1566,'improved'),(1426,'in-vitro'),(1183,'inconsistent'),(1213,'increased'),(1677,'indeks'),(1562,'index'),(1155,'indigenous'),(945,'indonesia'),(1067,'indonesian'),(1427,'induksi'),(1022,'industrial'),(960,'ini'),(1467,'inokulasi'),(1581,'inovasi'),(1048,'insentif'),(1383,'insidensi'),(1239,'institut'),(1719,'integrasi'),(1390,'integrated'),(1012,'integritas'),(1741,'internet'),(1607,'intrusi'),(1189,'investigated'),(1711,'iot'),(1039,'ipb'),(1656,'irigasi'),(1710,'irrigation'),(1216,'isoamyl-acetate'),(1445,'isolat'),(1265,'isoterm'),(1071,'ispo'),(1054,'ispo-rspo'),(1537,'jacq'),(1232,'jambi'),(1707,'jarak'),(1740,'jaringan'),(1323,'jawa'),(956,'jejak'),(1146,'jember'),(1354,'jika'),(1030,'kabupaten'),(990,'kaca'),(1149,'kajian'),(1144,'kakao'),(1475,'kali'),(1064,'kalimantan'),(1298,'kalor'),(1489,'kamal'),(1625,'kandungan'),(1708,'kanopi'),(1264,'karakterisasi'),(938,'karbon'),(910,'karet'),(1328,'kartikasari'),(1083,'kasus'),(1269,'kbk'),(1703,'keandalan'),(1129,'keberlanjutan'),(1060,'kebijakan'),(1004,'kebun'),(1440,'kedua'),(1655,'kekeringan'),(1313,'kekeruhan'),(1058,'kelapa'),(1061,'kelembagaan'),(1762,'kelembapan'),(1682,'kelompok'),(1718,'kemarau'),(1441,'kematian'),(1468,'keparahan'),(1046,'kepatuhan'),(1783,'kerangka'),(984,'kering'),(1784,'kerja'),(1642,'kerusakan'),(1045,'kesenjangan'),(1108,'kesiapan'),(1428,'ketahanan'),(918,'ketelusuran'),(1077,'ketidaklengkapan'),(1729,'ketidakpastian'),(1433,'ketiga'),(1238,'kimia'),(1154,'kinetics'),(1474,'kitinase'),(1589,'klon'),(1628,'klorofil'),(1277,'ko-pirolisis'),(972,'kode'),(1263,'koh'),(1451,'koloni'),(1617,'kombinasi'),(1275,'konsep'),(1345,'konservasi'),(1411,'konsorsium'),(997,'konsumsi'),(993,'kontributor'),(1689,'kontrol'),(1691,'konvensional'),(1062,'koperasi'),(1143,'kopi'),(1249,'kosong'),(1086,'kotawaringin'),(1697,'kpa'),(1115,'kredit'),(1250,'kulit'),(1578,'kusumawati'),(1233,'laboratory'),(1156,'lactobacillus'),(1079,'lahan'),(1381,'laju'),(1370,'lamtoro'),(1431,'lapangan'),(1609,'laut'),(980,'lca'),(1530,'leaching'),(1078,'legalitas'),(1081,'lemahnya'),(898,'lestari'),(1165,'liberica'),(1041,'lidya'),(930,'life'),(1256,'limbah'),(1476,'lipat'),(1001,'listrik'),(1095,'logistik'),(1673,'long'),(1706,'lora'),(1659,'lora-iot'),(1714,'lorawan'),(1534,'losses'),(973,'lot'),(1302,'luas'),(1409,'mada'),(1535,'main-nursery'),(1294,'maksimum'),(903,'malang'),(1496,'malaysia'),(1626,'malondialdehid'),(1117,'mampu'),(1392,'management'),(1038,'manajemen'),(1066,'mandatori'),(1134,'maria'),(1695,'matriks'),(1460,'maupun'),(1613,'mcc'),(1627,'mda'),(1401,'medan'),(979,'melaksanakan'),(1459,'melampaui'),(946,'melibatkan'),(1007,'memangkas'),(1688,'membandingkan'),(1643,'membran'),(1097,'membuktikan'),(1084,'memetakan'),(1301,'memiliki'),(1640,'mempertahankan'),(1382,'mencapai'),(1378,'menekan'),(1359,'menganalisis'),(961,'mengembangkan'),(1276,'mengevaluasi'),(1289,'menggunakan'),(1450,'menghambat'),(1285,'menghasilkan'),(1700,'menghemat'),(1314,'mengikuti'),(1787,'mengoptimalkan'),(1443,'menguji'),(1781,'mengungguli'),(1701,'meningkatkan'),(1010,'menjadi'),(1736,'menjaga'),(986,'menunjukkan'),(1308,'menurunkan'),(1118,'menutup'),(950,'menyulitkan'),(1088,'merancang'),(1350,'merusak'),(1290,'mesopori'),(1167,'metabolomic'),(1225,'metabolomics'),(1675,'mhz'),(1484,'microbiology'),(1730,'mikro'),(1291,'mill'),(1734,'mineral'),(1047,'model'),(913,'mohammad'),(1490,'mohd'),(1367,'monokultur'),(1139,'montpellier'),(1177,'mucilage'),(1344,'multi-strata'),(1722,'multispektral'),(1031,'musi'),(1717,'musim'),(1666,'musiman'),(1337,'musuh'),(1618,'nacl'),(1582,'nasional'),(1017,'natural'),(1365,'naungan'),(1147,'nayla'),(1630,'na⁺'),(1758,'ndre'),(1755,'ndvi'),(902,'negeri'),(1297,'nilai'),(896,'nirmala'),(1556,'nitrate'),(1645,'nmol'),(1491,'noor'),(1242,'nopember'),(1752,'normalized'),(1188,'notes'),(1559,'npk'),(1570,'nursery'),(1510,'nutrient'),(1732,'nutrisi'),(1070,'oil'),(943,'olah'),(1362,'oleh'),(1660,'optimasi'),(1505,'optimization'),(1538,'optimized'),(1171,'organic'),(1229,'original'),(1671,'otomatis'),(1310,'oxygen'),(1002,'pabrik'),(933,'pada'),(1267,'padat'),(1705,'paket'),(1105,'paling'),(1069,'palm'),(1352,'panen'),(1420,'pangkal'),(1765,'par'),(1624,'parameter'),(1361,'parasitisasi'),(1339,'parasitoid'),(1597,'pasang'),(920,'pasok'),(1479,'pathology'),(1452,'patogen'),(1348,'pbko'),(1508,'peat'),(1573,'peatland'),(1524,'peatlands'),(1211,'pectin'),(1025,'peer-reviewed'),(1056,'pekebun'),(976,'pemasaran'),(1049,'pembiayaan'),(1453,'pembibitan'),(1668,'pembungaan'),(1726,'pemodelan'),(1003,'pemupukan'),(1600,'penanda'),(1343,'penaung'),(1082,'pencatatan'),(1103,'pendampingan'),(1121,'pendapatan'),(1259,'pendekatan'),(907,'penelitian'),(1005,'penerapan'),(1376,'pengamatan'),(1786,'pengelola'),(1418,'pengendali'),(1483,'pengendalian'),(1000,'pengeringan'),(1333,'penggerek'),(1662,'penggunaan'),(1704,'pengiriman'),(1669,'pengisian'),(975,'pengolahan'),(927,'penilaian'),(1120,'peningkatan'),(1406,'penyakit'),(1336,'peran'),(948,'perantara'),(1680,'percobaan'),(1439,'peremajaan'),(1596,'periodik'),(1438,'perkebunan'),(1646,'perlakuan'),(1303,'permukaan'),(1473,'peroksidase'),(917,'perpustakaan'),(1472,'pertahanan'),(1329,'pertanian'),(1611,'pesisir'),(1391,'pest'),(1621,'petak'),(1520,'phosphorus'),(1635,'photometry'),(1716,'physics'),(1647,'physiology'),(1375,'pinus'),(1246,'pirolisis'),(1478,'plant'),(1157,'plantarum'),(1480,'plantation'),(1125,'policy'),(1258,'pome'),(1332,'populasi'),(1222,'postharvest'),(1529,'potassium'),(1694,'potensial'),(1400,'ppks'),(1236,'pratama'),(1788,'precision'),(1162,'precursors'),(1776,'prediksi'),(1111,'premium'),(1713,'presisi'),(1180,'processing'),(957,'produk'),(1738,'produksi'),(1685,'produktif'),(1663,'produktivitas'),(1168,'profiling'),(1588,'prolin'),(1572,'protocol'),(1132,'public'),(909,'pusat'),(1495,'putra'),(1208,'q-grader'),(1137,'qualisud'),(1185,'quality'),(1458,'radial'),(1763,'radiasi'),(1043,'rahmania'),(935,'rakyat'),(1620,'rancangan'),(1767,'random'),(1674,'range'),(919,'rantai'),(1278,'rasio'),(1546,'ratios'),(1577,'ratna'),(1281,'reaktor'),(1756,'red'),(1555,'reduced'),(1094,'regresi'),(1769,'regressor'),(983,'remah'),(1255,'remediasi'),(1320,'remediation'),(1789,'remote'),(1293,'rendemen'),(1485,'replanting'),(1230,'research'),(1585,'respons'),(1531,'resulting'),(1511,'retention'),(1027,'review'),(1063,'riau'),(1327,'rina'),(925,'ringan'),(1579,'riset'),(915,'rizky'),(1780,'rmse'),(1164,'robusta'),(1777,'root'),(1128,'rspo'),(1018,'rubber'),(989,'rumah'),(1158,'saccharomyces'),(1594,'salinitas'),(1135,'sanchez-cortes'),(1523,'sapric'),(1782,'satelit'),(1059,'sawit'),(1219,'sca'),(1615,'scavina'),(1227,'science'),(1175,'scores'),(1416,'sebagai'),(991,'sebesar'),(1357,'secara'),(1299,'sedangkan'),(1514,'seedling'),(1565,'seedlings'),(1639,'segar'),(949,'sehingga'),(978,'sekaligus'),(1464,'selama'),(1549,'selangor'),(1287,'selanjutnya'),(912,'selatan'),(1599,'seleksi'),(1686,'seluas'),(908,'sembawa'),(1790,'sensing'),(1720,'sensor'),(1184,'sensory'),(1377,'sepanjang'),(1241,'sepuluh'),(1379,'serangan'),(1498,'serdang'),(1072,'sering'),(955,'serta'),(1053,'sertifikasi'),(1142,'setiawan'),(1528,'severe'),(1085,'siak'),(1106,'signifikan'),(928,'siklus'),(1109,'simulasi'),(1444,'sinergisme'),(1462,'sintetik'),(958,'sir-20'),(1261,'sirkular'),(1006,'sistem'),(1429,'sistemik'),(1403,'siti'),(1089,'skema'),(1126,'smallholder'),(1709,'smart'),(1509,'soil'),(1526,'soils'),(1569,'sound'),(1629,'spad'),(1727,'spasial-temporal'),(1771,'spatial'),(1173,'specialty'),(1633,'spektrofotometrik'),(1176,'spontaneous'),(1778,'square'),(1737,'stabilitas'),(1536,'stage'),(1191,'starter'),(1576,'station'),(1080,'stdb'),(1347,'stephanoderis'),(1651,'stress'),(1342,'struktur'),(959,'studi'),(1029,'study'),(1610,'sub-optimal'),(1550,'substrates'),(1584,'sudarmono'),(1527,'suffer'),(1199,'sugar'),(1280,'suhu'),(1614,'sulawesi'),(911,'sumatera'),(1503,'sumberdaya'),(1014,'supply'),(905,'supriyadi'),(1243,'surabaya'),(1099,'surat'),(1598,'surut'),(1123,'sustainability'),(1068,'sustainable'),(1057,'swadaya'),(1148,'syukurillah'),(1446,'t-as12'),(1119,'tahun'),(1273,'tambah'),(1502,'tanah'),(1442,'tanaman'),(1100,'tanda'),(1248,'tandan'),(1735,'tantangan'),(1113,'tbs'),(1237,'teknik'),(1240,'teknologi'),(1672,'telemetri'),(1712,'telemetry'),(1564,'tenera'),(1065,'tengah'),(1622,'terbagi'),(994,'terbesar'),(1368,'terbuka'),(1295,'tercapai'),(965,'terdistribusi'),(1641,'terendah'),(1107,'terhadap'),(1073,'terhambat'),(1676,'terintegrasi'),(1690,'terjadwal'),(1247,'terkontrol'),(999,'termal'),(1090,'terpadu'),(1636,'tertinggi'),(1283,'tetap'),(1657,'tetes'),(1591,'theobroma'),(1742,'things'),(1355,'tidak'),(1363,'tiga'),(1324,'timur'),(1274,'tinggi'),(1074,'tingginya'),(1360,'tingkat'),(1364,'tipe'),(1268,'tkks'),(1749,'tm-12'),(1602,'toleransi'),(982,'ton'),(987,'total'),(1016,'traceability'),(1412,'trichoderma'),(1522,'tropical'),(1151,'tropika'),(1616,'tsh'),(1407,'tumbuhan'),(1369,'tunggal'),(1723,'uav'),(1430,'uji'),(1136,'umr'),(1748,'umur'),(1558,'unamended'),(1590,'unggul'),(1282,'unggun'),(974,'unit'),(901,'universitas'),(1494,'universiti'),(1040,'university'),(1743,'unmanned'),(981,'untuk'),(1497,'upm'),(977,'uppb'),(916,'upt'),(1437,'utama'),(1402,'utara'),(940,'validasi'),(1317,'valorization'),(1279,'variasi'),(1751,'vegetasi'),(1754,'vegetation'),(1745,'vehicle'),(951,'verifikasi'),(1515,'vigour'),(1169,'volatile'),(1760,'wahana'),(1008,'waktu'),(1319,'wastewater'),(1678,'water'),(1399,'wijaya'),(1034,'wulandari'),(969,'yang'),(914,'yanuar'),(1182,'yields'),(1637,'μmol'),(1696,'−25'),(1698,'−40'),(1699,'−55');
/*!40000 ALTER TABLE `submission_search_keyword_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_object_keywords`
--

DROP TABLE IF EXISTS `submission_search_object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL COMMENT 'Word position of the keyword in the object.',
  UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (81,896,0),(121,896,10),(137,896,12),(145,896,20),(153,896,21),(81,897,1),(121,897,11),(137,897,13),(145,897,21),(153,897,22),(81,898,2),(89,898,10),(121,898,12),(137,898,14),(145,898,22),(153,898,23),(81,899,3),(81,899,21),(89,899,3),(89,899,12),(89,899,23),(97,899,19),(105,899,2),(105,899,12),(105,899,23),(113,899,20),(121,899,13),(121,899,20),(129,899,13),(129,899,24),(137,899,15),(145,899,3),(145,899,23),(153,899,2),(153,899,14),(153,899,24),(81,900,4),(81,900,22),(89,900,4),(89,900,24),(97,900,20),(105,900,13),(113,900,21),(121,900,14),(129,900,14),(137,900,16),(145,900,4),(145,900,24),(153,900,3),(153,900,15),(153,900,25),(81,901,5),(81,901,25),(89,901,7),(89,901,25),(97,901,25),(105,901,18),(105,901,25),(113,901,14),(113,901,24),(121,901,15),(121,901,25),(129,901,19),(137,901,17),(145,901,7),(145,901,25),(153,901,8),(153,901,18),(153,901,26),(81,902,6),(81,902,26),(89,902,8),(89,902,26),(97,902,26),(105,902,19),(105,902,26),(113,902,25),(121,902,16),(129,902,20),(137,902,18),(145,902,8),(145,902,26),(153,902,9),(153,902,19),(153,902,27),(81,903,7),(81,903,27),(89,903,9),(89,903,27),(97,903,27),(105,903,20),(105,903,27),(113,903,16),(113,903,26),(121,903,17),(129,903,21),(137,903,19),(145,903,9),(145,903,27),(152,903,1),(153,903,10),(153,903,20),(153,903,28),(81,904,8),(81,905,9),(81,906,10),(81,907,11),(81,907,14),(97,907,10),(107,907,23),(113,907,3),(115,907,19),(121,907,3),(123,907,29),(145,907,13),(155,907,27),(81,908,12),(81,909,13),(97,909,9),(97,909,21),(105,909,14),(113,909,2),(121,909,2),(129,909,15),(137,909,2),(137,909,22),(145,909,12),(153,909,4),(81,910,15),(82,910,3),(82,910,18),(82,910,29),(83,910,4),(83,910,59),(85,910,7),(81,911,16),(88,911,3),(121,911,8),(123,911,22),(128,911,2),(139,911,16),(144,911,2),(81,912,17),(88,912,4),(112,912,3),(144,912,3),(152,912,2),(81,913,18),(89,913,0),(113,913,17),(145,913,0),(153,913,11),(81,914,19),(89,914,1),(113,914,18),(145,914,1),(153,914,12),(81,915,20),(89,915,2),(113,915,19),(145,915,2),(153,915,13),(81,916,23),(89,916,5),(113,916,22),(145,916,5),(153,916,16),(81,917,24),(89,917,6),(113,917,23),(145,917,6),(153,917,17),(82,918,0),(83,918,96),(82,919,1),(83,919,0),(90,919,19),(82,920,2),(83,920,1),(90,920,20),(82,921,4),(85,921,8),(82,922,5),(85,922,9),(90,922,21),(146,922,24),(154,922,17),(82,923,6),(83,923,34),(91,923,48),(146,923,10),(147,923,32),(155,923,35),(82,924,7),(83,924,31),(83,924,91),(85,924,2),(82,925,8),(83,925,32),(83,925,92),(82,926,9),(82,926,24),(83,926,45),(83,926,83),(89,926,16),(90,926,3),(90,926,22),(90,926,26),(91,926,20),(91,926,35),(91,926,62),(91,926,80),(97,926,12),(106,926,6),(106,926,12),(106,926,31),(107,926,7),(107,926,28),(107,926,34),(107,926,43),(107,926,92),(113,926,5),(114,926,7),(114,926,23),(115,926,25),(115,926,47),(115,926,54),(115,926,82),(121,926,22),(122,926,4),(122,926,26),(123,926,20),(123,926,38),(123,926,55),(123,926,93),(129,926,27),(137,926,8),(138,926,2),(138,926,13),(139,926,3),(139,926,22),(139,926,31),(139,926,38),(139,926,62),(145,926,15),(146,926,5),(146,926,22),(147,926,6),(147,926,25),(147,926,68),(147,926,79),(154,926,4),(155,926,3),(155,926,45),(155,926,74),(155,926,84),(155,926,113),(155,926,119),(155,926,138),(82,927,10),(82,928,11),(82,929,12),(82,930,13),(83,930,51),(84,930,3),(85,930,4),(82,931,14),(83,931,52),(84,931,4),(85,931,5),(82,932,15),(83,932,53),(84,932,5),(85,932,6),(82,933,16),(91,933,31),(107,933,31),(107,933,65),(114,933,12),(115,933,33),(115,933,73),(122,933,17),(123,933,13),(123,933,74),(139,933,91),(146,933,12),(147,933,17),(147,933,56),(147,933,101),(147,933,109),(155,933,54),(82,934,17),(107,934,21),(82,935,19),(83,935,6),(82,936,20),(83,936,19),(83,936,97),(91,936,14),(91,936,70),(82,937,21),(83,937,66),(82,938,22),(83,938,21),(91,938,82),(106,938,13),(107,938,51),(107,938,72),(107,938,81),(109,938,3),(82,939,23),(83,939,55),(82,940,25),(82,941,26),(83,941,14),(82,942,27),(83,942,2),(82,943,28),(83,943,3),(82,944,30),(83,944,5),(83,944,42),(83,944,47),(83,945,7),(88,945,5),(96,945,7),(97,945,14),(104,945,2),(112,945,4),(113,945,7),(120,945,5),(128,945,4),(136,945,3),(144,945,4),(145,945,17),(152,945,5),(155,945,26),(160,945,2),(83,946,8),(83,947,9),(83,948,10),(83,949,11),(83,950,12),(83,951,13),(83,951,95),(83,952,15),(139,952,50),(83,953,16),(83,954,17),(85,954,10),(83,955,18),(83,955,86),(91,955,38),(123,955,50),(139,955,55),(139,955,84),(155,955,92),(83,956,20),(83,957,22),(83,957,58),(107,957,15),(83,958,23),(83,958,73),(83,959,24),(90,959,17),(91,959,25),(139,959,17),(154,959,18),(83,960,25),(91,960,27),(107,960,24),(115,960,20),(123,960,30),(139,960,18),(147,960,23),(155,960,28),(155,960,133),(83,961,26),(155,961,30),(83,962,27),(83,963,28),(83,964,29),(83,965,30),(83,966,33),(83,967,35),(83,968,36),(83,969,37),(107,969,45),(123,969,5),(147,969,38),(83,970,38),(83,971,39),(83,971,74),(83,971,103),(91,971,90),(106,971,27),(107,971,68),(115,971,51),(115,971,76),(123,971,24),(139,971,70),(147,971,40),(147,971,62),(147,971,103),(155,971,86),(83,972,40),(83,973,41),(83,973,102),(83,974,43),(83,975,44),(83,976,46),(83,977,48),(83,978,49),(147,978,93),(83,979,50),(83,980,54),(83,980,63),(83,981,56),(106,981,16),(107,981,40),(107,981,54),(138,981,24),(154,981,8),(83,982,57),(83,982,72),(147,982,99),(147,982,100),(155,982,124),(83,983,60),(83,984,61),(146,984,27),(147,984,19),(147,984,96),(83,985,62),(147,985,11),(147,985,82),(83,986,64),(91,986,74),(123,986,60),(139,986,67),(147,986,83),(83,987,65),(83,988,67),(83,989,68),(83,990,69),(83,991,70),(91,991,95),(107,991,91),(107,991,94),(115,991,89),(123,991,95),(139,991,74),(147,991,92),(147,991,98),(155,991,130),(83,992,71),(83,993,75),(83,994,76),(83,995,77),(83,996,78),(83,996,98),(155,996,81),(83,997,79),(147,997,89),(83,998,80),(83,999,81),(83,1000,82),(83,1001,84),(83,1002,85),(106,1002,20),(83,1003,87),(155,1003,143),(83,1004,88),(91,1004,24),(123,1004,56),(123,1004,76),(147,1004,57),(155,1004,56),(155,1004,137),(83,1005,89),(83,1006,90),(91,1006,22),(114,1006,13),(115,1006,64),(146,1006,0),(147,1006,27),(83,1007,93),(83,1008,94),(83,1009,99),(139,1009,41),(139,1009,95),(83,1010,100),(106,1010,10),(107,1010,14),(107,1010,50),(115,1010,71),(123,1010,10),(155,1010,10),(83,1011,101),(83,1012,104),(83,1013,105),(84,1014,0),(84,1015,1),(84,1016,2),(85,1016,3),(84,1017,6),(84,1018,7),(84,1019,8),(108,1019,3),(85,1020,0),(85,1021,1),(86,1022,0),(86,1023,1),(102,1023,3),(110,1023,1),(150,1023,1),(158,1023,1),(86,1024,2),(92,1024,2),(87,1025,0),(95,1025,0),(103,1025,0),(111,1025,0),(119,1025,0),(127,1025,0),(135,1025,0),(143,1025,0),(151,1025,0),(159,1025,0),(87,1026,1),(87,1026,5),(95,1026,1),(95,1026,5),(103,1026,1),(103,1026,4),(111,1026,1),(111,1026,4),(119,1026,1),(119,1026,4),(127,1026,1),(127,1026,4),(135,1026,1),(135,1026,4),(143,1026,1),(143,1026,4),(151,1026,1),(151,1026,4),(159,1026,1),(159,1026,4),(87,1027,2),(95,1027,2),(87,1028,3),(95,1028,3),(87,1029,4),(95,1029,4),(99,1029,18),(131,1029,20),(88,1030,0),(96,1030,0),(128,1030,0),(144,1030,0),(88,1031,1),(88,1032,2),(144,1032,1),(88,1033,6),(112,1033,5),(89,1034,11),(89,1035,13),(93,1035,7),(89,1036,14),(113,1036,12),(89,1037,15),(89,1038,17),(146,1038,6),(89,1039,18),(129,1039,30),(89,1040,19),(129,1040,31),(89,1041,20),(89,1042,21),(89,1043,22),(90,1044,0),(91,1044,50),(114,1044,19),(90,1045,1),(91,1045,29),(90,1046,2),(91,1046,30),(90,1047,4),(91,1047,40),(107,1047,96),(155,1047,31),(155,1047,127),(90,1048,5),(91,1048,75),(90,1049,6),(91,1049,42),(93,1049,4),(90,1050,7),(91,1050,43),(93,1050,5),(90,1051,8),(91,1051,88),(107,1051,19),(107,1051,35),(123,1051,44),(155,1051,13),(155,1051,141),(90,1052,9),(90,1053,10),(91,1053,1),(91,1053,87),(154,1053,23),(90,1054,11),(91,1054,71),(90,1055,12),(91,1055,7),(155,1055,135),(90,1056,13),(91,1056,8),(91,1056,32),(91,1056,94),(93,1056,2),(155,1056,139),(90,1057,14),(91,1057,9),(91,1057,33),(93,1057,3),(155,1057,140),(90,1058,15),(106,1058,4),(106,1058,21),(107,1058,4),(121,1058,4),(122,1058,18),(123,1058,15),(125,1058,8),(154,1058,12),(155,1058,21),(90,1059,16),(106,1059,5),(106,1059,22),(107,1059,5),(121,1059,5),(122,1059,19),(123,1059,16),(125,1059,9),(154,1059,13),(155,1059,22),(90,1060,18),(90,1061,23),(90,1062,24),(91,1062,49),(91,1062,64),(90,1063,25),(96,1063,2),(131,1063,34),(136,1063,0),(90,1064,27),(96,1064,5),(112,1064,2),(160,1064,0),(90,1065,28),(96,1065,6),(160,1065,1),(91,1066,0),(91,1067,2),(91,1068,3),(131,1068,71),(91,1069,4),(107,1069,56),(130,1069,9),(131,1069,16),(91,1070,5),(107,1070,57),(130,1070,8),(131,1070,15),(91,1071,6),(93,1071,0),(154,1071,25),(155,1071,147),(157,1071,9),(91,1072,10),(147,1072,9),(91,1073,11),(91,1074,12),(91,1075,13),(91,1075,86),(91,1076,15),(91,1077,16),(91,1078,17),(91,1078,56),(91,1079,18),(128,1079,5),(129,1079,29),(138,1079,16),(139,1079,13),(141,1079,6),(146,1079,26),(147,1079,18),(91,1080,19),(91,1080,61),(91,1081,21),(91,1082,23),(91,1083,26),(91,1084,28),(91,1085,34),(96,1085,1),(91,1086,36),(96,1086,3),(91,1087,37),(96,1087,4),(91,1088,39),(147,1088,24),(91,1089,41),(91,1090,44),(91,1091,45),(91,1092,46),(91,1093,47),(91,1094,51),(91,1095,52),(91,1096,53),(91,1097,54),(115,1097,62),(155,1097,107),(91,1098,55),(115,1098,63),(155,1098,108),(91,1099,57),(91,1100,58),(91,1101,59),(91,1102,60),(139,1102,9),(91,1103,63),(91,1104,65),(91,1105,66),(91,1106,67),(91,1107,68),(115,1107,57),(138,1107,10),(139,1107,33),(91,1108,69),(91,1109,72),(91,1110,73),(91,1111,76),(91,1112,77),(91,1113,78),(155,1113,20),(91,1114,79),(91,1115,81),(91,1116,83),(114,1116,14),(115,1116,48),(115,1116,65),(117,1116,4),(91,1117,84),(107,1117,84),(91,1118,85),(91,1119,89),(115,1119,61),(155,1119,125),(91,1120,91),(123,1120,88),(139,1120,71),(91,1121,92),(91,1122,93),(92,1123,0),(92,1124,1),(92,1125,3),(94,1125,3),(92,1126,4),(92,1127,5),(93,1128,1),(155,1128,148),(93,1129,6),(154,1129,24),(155,1129,146),(94,1130,0),(150,1130,0),(158,1130,0),(94,1131,1),(94,1132,2),(96,1133,8),(144,1133,5),(97,1134,0),(97,1135,1),(97,1136,2),(97,1137,3),(97,1138,4),(97,1139,5),(104,1139,3),(97,1140,6),(97,1141,7),(145,1141,10),(97,1142,8),(145,1142,11),(97,1143,11),(113,1143,4),(114,1143,4),(114,1143,15),(115,1143,2),(115,1143,10),(115,1143,59),(145,1143,14),(146,1143,14),(147,1143,12),(147,1143,58),(97,1144,13),(106,1144,9),(107,1144,10),(113,1144,6),(138,1144,7),(139,1144,10),(139,1144,26),(145,1144,16),(97,1145,15),(113,1145,8),(145,1145,18),(97,1146,16),(113,1146,9),(145,1146,19),(152,1146,0),(97,1147,17),(105,1147,10),(129,1147,11),(153,1147,0),(97,1148,18),(105,1148,11),(129,1148,12),(153,1148,1),(97,1149,22),(105,1149,15),(129,1149,16),(153,1149,5),(97,1150,23),(105,1150,16),(129,1150,17),(153,1150,6),(97,1151,24),(105,1151,17),(129,1151,18),(153,1151,7),(98,1152,0),(99,1152,20),(98,1153,1),(99,1153,2),(101,1153,1),(98,1154,2),(99,1154,22),(98,1155,3),(99,1155,23),(98,1156,4),(99,1156,26),(101,1156,2),(98,1157,5),(99,1157,27),(101,1157,3),(98,1158,6),(99,1158,30),(101,1158,4),(98,1159,7),(99,1159,31),(101,1159,5),(98,1160,8),(98,1161,9),(101,1161,8),(98,1162,10),(98,1163,11),(99,1163,66),(99,1163,71),(98,1164,12),(99,1164,3),(99,1164,72),(146,1164,15),(147,1164,13),(98,1165,13),(99,1165,6),(99,1165,8),(99,1165,73),(101,1165,7),(98,1166,14),(98,1167,15),(98,1168,16),(98,1169,17),(99,1169,43),(98,1170,18),(99,1170,61),(98,1171,19),(99,1171,39),(130,1171,2),(98,1172,20),(98,1173,21),(98,1174,22),(99,1174,67),(98,1175,23),(99,1175,68),(99,1176,0),(99,1176,69),(99,1177,1),(99,1177,54),(99,1178,4),(99,1178,7),(101,1178,6),(115,1178,12),(117,1178,2),(146,1178,16),(147,1178,14),(149,1178,0),(99,1179,5),(146,1179,17),(147,1179,15),(149,1179,1),(99,1180,9),(100,1180,3),(99,1181,10),(99,1182,11),(99,1183,12),(99,1184,13),(99,1184,49),(100,1184,4),(99,1185,14),(131,1185,59),(99,1186,15),(99,1187,16),(99,1188,17),(99,1189,19),(99,1190,21),(99,1190,51),(99,1191,24),(99,1192,25),(99,1193,28),(99,1194,29),(99,1194,33),(99,1195,32),(99,1196,34),(99,1196,52),(99,1197,35),(99,1198,36),(99,1199,37),(99,1200,38),(99,1201,40),(99,1202,41),(99,1203,42),(99,1204,44),(99,1205,45),(99,1206,46),(99,1207,47),(99,1208,48),(99,1209,50),(99,1210,53),(99,1211,55),(99,1212,56),(99,1213,57),(131,1213,42),(99,1214,58),(99,1215,59),(99,1216,60),(99,1217,62),(99,1218,63),(131,1218,44),(99,1219,64),(99,1220,65),(99,1221,70),(124,1221,1),(100,1222,0),(101,1222,0),(100,1223,1),(142,1223,2),(100,1224,2),(116,1224,5),(148,1224,2),(100,1225,5),(101,1225,9),(102,1226,0),(102,1227,1),(134,1227,1),(156,1227,4),(102,1228,2),(103,1229,2),(111,1229,2),(119,1229,2),(127,1229,2),(135,1229,2),(143,1229,2),(151,1229,2),(159,1229,2),(103,1230,3),(111,1230,3),(119,1230,3),(127,1230,3),(135,1230,3),(143,1230,3),(151,1230,3),(159,1230,3),(104,1231,0),(104,1232,1),(104,1233,4),(104,1234,5),(105,1235,0),(105,1236,1),(105,1237,3),(105,1238,4),(105,1238,24),(106,1238,29),(105,1239,5),(105,1240,6),(105,1241,7),(105,1242,8),(105,1243,9),(105,1244,21),(105,1245,22),(106,1246,0),(109,1246,2),(106,1247,1),(106,1248,2),(107,1248,2),(155,1248,17),(106,1249,3),(107,1249,3),(106,1250,7),(107,1250,8),(106,1251,8),(107,1251,9),(114,1251,3),(115,1251,1),(115,1251,58),(147,1251,8),(155,1251,18),(106,1252,11),(107,1252,42),(107,1252,62),(106,1253,14),(107,1253,52),(107,1253,73),(107,1253,82),(109,1253,4),(155,1253,94),(106,1254,15),(106,1255,17),(107,1255,55),(106,1256,18),(107,1256,0),(106,1257,19),(106,1258,23),(107,1258,60),(107,1258,90),(109,1258,5),(106,1259,24),(106,1260,25),(109,1260,6),(106,1261,26),(107,1261,22),(109,1261,1),(106,1262,28),(106,1263,30),(107,1263,49),(106,1264,32),(106,1265,33),(107,1265,97),(106,1266,34),(107,1267,1),(107,1268,6),(107,1268,27),(107,1269,11),(107,1269,29),(107,1270,12),(107,1271,13),(107,1272,16),(107,1273,17),(107,1274,18),(114,1274,18),(115,1274,38),(120,1274,1),(107,1275,20),(107,1276,25),(139,1276,19),(107,1277,26),(107,1278,30),(139,1278,56),(139,1278,81),(107,1279,32),(107,1280,33),(107,1280,66),(155,1280,90),(107,1281,36),(107,1282,37),(107,1283,38),(107,1284,39),(107,1285,41),(155,1285,59),(155,1285,116),(107,1286,44),(131,1286,26),(133,1286,0),(107,1287,46),(107,1288,47),(107,1289,48),(139,1289,42),(155,1289,97),(155,1289,103),(107,1290,53),(107,1291,58),(107,1292,59),(107,1293,61),(107,1294,63),(107,1295,64),(107,1296,67),(107,1297,69),(107,1298,70),(107,1299,71),(107,1300,74),(107,1301,75),(107,1302,76),(107,1303,77),(107,1304,78),(107,1305,79),(123,1305,67),(107,1306,80),(107,1307,83),(107,1308,85),(147,1308,10),(107,1309,86),(110,1309,0),(107,1310,87),(107,1311,88),(107,1312,89),(107,1313,93),(107,1314,95),(107,1315,98),(108,1316,0),(108,1317,1),(108,1318,2),(108,1319,4),(108,1320,5),(109,1321,0),(110,1322,2),(112,1323,0),(120,1323,3),(147,1323,20),(152,1323,3),(112,1324,1),(120,1324,4),(147,1324,21),(152,1324,4),(113,1325,0),(113,1326,1),(113,1327,10),(113,1328,11),(113,1329,13),(113,1330,15),(114,1331,0),(115,1331,22),(114,1332,1),(115,1332,23),(114,1333,2),(115,1333,0),(114,1334,5),(115,1334,4),(117,1334,0),(114,1335,6),(115,1335,5),(115,1335,24),(117,1335,1),(114,1336,8),(114,1337,9),(114,1338,10),(115,1338,28),(115,1338,79),(115,1338,88),(114,1339,11),(114,1339,25),(115,1339,30),(114,1340,16),(115,1340,11),(114,1341,17),(115,1341,37),(120,1341,0),(114,1342,20),(114,1343,21),(114,1344,22),(115,1344,49),(115,1344,66),(114,1345,24),(117,1345,7),(114,1346,26),(115,1346,31),(117,1346,5),(114,1347,27),(115,1347,32),(115,1347,80),(117,1347,6),(115,1348,3),(115,1348,70),(115,1349,6),(115,1350,7),(115,1351,8),(123,1351,86),(147,1351,16),(115,1352,9),(155,1352,66),(160,1352,6),(115,1353,13),(117,1353,3),(115,1354,14),(115,1355,15),(115,1356,16),(115,1357,17),(123,1357,48),(139,1357,60),(115,1358,18),(115,1359,21),(115,1360,26),(115,1360,68),(123,1360,25),(115,1361,27),(115,1361,78),(115,1362,29),(123,1362,7),(115,1363,34),(147,1363,69),(115,1364,35),(115,1365,36),(115,1365,42),(115,1365,43),(147,1365,113),(115,1366,39),(120,1366,2),(115,1367,40),(115,1367,74),(115,1368,41),(115,1368,75),(115,1369,44),(123,1369,68),(155,1369,129),(115,1370,45),(115,1371,46),(115,1372,50),(115,1373,52),(115,1374,53),(115,1375,55),(115,1376,56),(123,1376,75),(115,1377,60),(115,1378,67),(123,1378,51),(123,1378,82),(139,1378,85),(115,1379,69),(115,1380,72),(115,1381,77),(115,1382,81),(123,1382,28),(123,1382,65),(147,1382,108),(115,1383,83),(123,1383,52),(115,1384,84),(115,1385,85),(115,1386,86),(115,1387,87),(116,1388,0),(116,1389,1),(116,1390,2),(116,1391,3),(116,1392,4),(131,1392,73),(132,1392,3),(116,1393,6),(118,1393,0),(117,1394,8),(122,1394,10),(125,1394,7),(118,1395,1),(120,1396,6),(120,1397,7),(121,1398,0),(121,1399,1),(121,1400,6),(121,1401,7),(121,1402,9),(123,1402,23),(128,1402,3),(121,1403,18),(121,1404,19),(121,1405,21),(121,1406,23),(122,1406,11),(123,1406,0),(123,1406,53),(123,1406,84),(121,1407,24),(121,1408,26),(121,1409,27),(122,1410,0),(122,1411,1),(123,1411,33),(123,1411,64),(123,1411,81),(122,1412,2),(123,1412,34),(125,1412,2),(122,1413,3),(123,1413,35),(123,1413,69),(125,1413,3),(122,1414,5),(123,1414,41),(125,1414,4),(122,1415,6),(123,1415,42),(125,1415,5),(122,1416,7),(122,1417,8),(122,1418,9),(122,1419,12),(123,1419,1),(122,1420,13),(123,1420,2),(122,1421,14),(123,1421,3),(122,1422,15),(123,1422,8),(125,1422,0),(122,1423,16),(123,1423,9),(125,1423,1),(122,1424,20),(155,1424,102),(122,1425,21),(122,1426,22),(123,1426,49),(122,1427,23),(122,1428,24),(139,1428,20),(122,1429,25),(122,1430,27),(123,1430,57),(122,1431,28),(147,1431,48),(122,1432,29),(123,1432,18),(128,1432,7),(122,1433,30),(123,1433,21),(123,1434,4),(123,1434,85),(123,1435,6),(123,1436,11),(123,1437,12),(155,1437,12),(123,1438,14),(137,1438,5),(137,1438,25),(138,1438,26),(146,1438,13),(123,1439,17),(123,1440,19),(123,1441,26),(123,1442,27),(137,1442,4),(137,1442,24),(141,1442,10),(155,1442,58),(123,1443,31),(147,1443,26),(123,1444,32),(123,1445,36),(123,1446,37),(123,1447,39),(123,1448,40),(123,1449,43),(123,1450,45),(139,1450,7),(123,1451,46),(123,1452,47),(123,1453,54),(123,1454,58),(123,1455,59),(123,1456,61),(123,1457,62),(123,1458,63),(123,1459,66),(123,1460,70),(155,1460,8),(123,1461,71),(123,1462,72),(123,1463,73),(123,1464,77),(147,1464,3),(147,1464,53),(155,1464,63),(123,1465,78),(147,1465,55),(123,1466,79),(128,1466,1),(123,1467,80),(123,1468,83),(123,1469,87),(123,1470,89),(123,1471,90),(123,1472,91),(123,1473,92),(123,1474,94),(123,1475,96),(139,1475,75),(123,1476,97),(139,1476,76),(124,1477,0),(124,1478,2),(126,1478,0),(140,1478,0),(142,1478,1),(124,1479,3),(126,1479,1),(124,1480,4),(132,1480,4),(156,1480,3),(157,1480,8),(124,1481,5),(124,1482,6),(125,1483,6),(126,1484,2),(128,1485,6),(128,1486,8),(128,1487,9),(160,1487,7),(129,1488,0),(129,1489,1),(129,1490,2),(129,1491,3),(129,1492,4),(129,1493,5),(156,1493,1),(129,1494,6),(129,1495,7),(129,1496,8),(136,1496,5),(129,1497,9),(129,1498,10),(129,1499,22),(129,1500,23),(129,1501,25),(129,1502,26),(147,1502,74),(155,1502,6),(155,1502,89),(129,1503,28),(129,1504,32),(137,1504,27),(130,1505,0),(130,1506,1),(130,1507,3),(130,1508,4),(131,1508,2),(131,1508,36),(131,1508,40),(130,1509,5),(131,1509,43),(132,1509,0),(134,1509,0),(150,1509,2),(130,1510,6),(133,1510,5),(130,1511,7),(133,1511,6),(130,1512,10),(131,1512,17),(133,1512,3),(154,1512,14),(155,1512,23),(157,1512,0),(130,1513,11),(131,1513,18),(133,1513,4),(154,1513,15),(155,1513,24),(157,1513,1),(130,1514,12),(130,1515,13),(130,1516,14),(130,1517,15),(131,1517,46),(133,1517,7),(130,1518,16),(131,1518,47),(133,1518,8),(130,1519,17),(131,1519,48),(133,1519,9),(130,1520,18),(131,1520,6),(130,1521,19),(130,1522,20),(131,1522,1),(133,1522,1),(156,1522,2),(130,1523,21),(131,1523,39),(130,1524,22),(131,1525,0),(131,1526,3),(131,1527,4),(131,1528,5),(131,1529,7),(131,1530,8),(131,1530,52),(131,1531,9),(131,1532,10),(131,1533,11),(131,1534,12),(131,1534,53),(131,1535,13),(131,1535,32),(131,1536,14),(131,1537,19),(154,1537,16),(155,1537,25),(131,1538,21),(131,1539,22),(131,1540,23),(131,1541,24),(131,1542,25),(131,1543,27),(131,1544,28),(131,1545,29),(131,1546,30),(131,1547,31),(131,1548,33),(131,1549,35),(136,1549,4),(131,1550,37),(131,1551,38),(131,1552,41),(131,1553,45),(131,1554,49),(131,1555,50),(131,1556,51),(131,1557,54),(131,1558,55),(131,1559,56),(131,1560,57),(131,1561,58),(131,1562,60),(147,1562,45),(155,1562,72),(131,1563,61),(131,1564,62),(131,1565,63),(131,1566,64),(131,1567,65),(131,1568,66),(131,1569,67),(131,1570,68),(132,1570,5),(131,1571,69),(131,1572,70),(131,1573,72),(132,1573,2),(133,1573,2),(136,1573,1),(132,1574,1),(134,1575,2),(142,1575,0),(148,1575,3),(158,1575,2),(136,1576,2),(137,1577,0),(137,1578,1),(137,1579,3),(137,1579,7),(137,1579,23),(147,1579,22),(137,1580,6),(137,1581,9),(137,1582,10),(137,1583,11),(137,1583,26),(137,1584,20),(137,1584,21),(138,1585,0),(138,1586,1),(139,1586,21),(138,1587,3),(139,1587,72),(141,1587,2),(138,1588,4),(139,1588,49),(139,1588,73),(141,1588,3),(138,1589,5),(139,1589,25),(139,1589,65),(138,1590,6),(139,1590,27),(138,1591,8),(139,1591,11),(141,1591,0),(138,1592,9),(139,1592,12),(141,1592,1),(138,1593,11),(139,1593,35),(141,1593,4),(146,1593,3),(149,1593,6),(138,1594,12),(139,1594,36),(141,1594,5),(138,1595,14),(139,1595,4),(139,1595,40),(139,1595,94),(138,1596,15),(138,1597,17),(139,1597,5),(141,1597,7),(138,1598,18),(139,1598,6),(141,1598,8),(138,1599,19),(138,1600,20),(138,1601,21),(139,1601,23),(138,1602,22),(139,1602,68),(138,1603,23),(138,1604,25),(139,1604,8),(138,1605,27),(138,1606,28),(155,1606,1),(155,1606,42),(139,1607,0),(139,1608,1),(146,1608,21),(147,1608,1),(147,1608,90),(139,1609,2),(139,1610,14),(139,1611,15),(139,1612,24),(139,1613,28),(139,1613,66),(139,1614,29),(139,1615,30),(139,1616,32),(139,1617,34),(139,1618,37),(139,1618,93),(139,1619,39),(139,1620,43),(147,1620,49),(139,1621,44),(139,1622,45),(139,1623,46),(139,1624,47),(155,1624,87),(139,1625,48),(139,1626,51),(139,1627,52),(139,1627,88),(139,1628,53),(139,1629,54),(139,1630,57),(139,1630,82),(139,1631,58),(139,1632,59),(139,1633,61),(139,1634,63),(139,1635,64),(139,1636,69),(139,1637,77),(139,1638,78),(147,1638,95),(139,1639,79),(155,1639,19),(139,1640,80),(139,1641,83),(139,1642,86),(139,1643,87),(139,1644,89),(147,1644,111),(139,1645,90),(139,1646,92),(140,1647,1),(140,1648,2),(147,1648,42),(140,1649,3),(140,1650,4),(140,1651,5),(147,1651,44),(141,1652,9),(146,1653,1),(146,1654,2),(146,1655,4),(149,1655,7),(146,1656,7),(147,1656,29),(147,1656,65),(147,1656,91),(149,1656,2),(146,1657,8),(147,1657,30),(149,1657,3),(146,1658,9),(146,1659,11),(147,1659,36),(146,1660,18),(146,1661,19),(146,1662,20),(146,1663,23),(154,1663,11),(155,1663,33),(146,1664,25),(147,1665,0),(147,1666,2),(147,1667,4),(147,1668,5),(147,1669,7),(147,1670,28),(147,1670,85),(147,1671,31),(147,1672,33),(147,1673,34),(147,1674,35),(147,1675,37),(147,1676,39),(147,1677,41),(155,1677,67),(147,1678,43),(149,1678,8),(147,1679,46),(147,1680,47),(147,1681,50),(147,1682,51),(147,1683,52),(155,1683,53),(147,1684,54),(147,1685,59),(147,1686,60),(155,1686,61),(147,1687,61),(155,1687,62),(147,1688,63),(147,1689,64),(147,1689,102),(147,1690,66),(147,1691,67),(147,1692,70),(147,1692,84),(147,1693,71),(147,1694,72),(147,1695,73),(147,1696,75),(147,1697,76),(147,1697,78),(147,1697,81),(147,1697,87),(147,1698,77),(147,1698,86),(147,1699,80),(147,1700,88),(147,1701,94),(147,1702,97),(147,1703,104),(147,1704,105),(147,1705,106),(147,1706,107),(147,1707,110),(147,1708,112),(154,1708,3),(155,1708,44),(155,1708,91),(157,1708,3),(148,1709,0),(157,1709,7),(148,1710,1),(148,1711,4),(154,1711,2),(155,1711,41),(155,1711,115),(157,1711,2),(148,1712,5),(149,1713,4),(154,1713,10),(155,1713,34),(155,1713,144),(149,1714,5),(149,1715,9),(150,1716,3),(152,1717,6),(155,1717,65),(160,1717,5),(152,1718,7),(154,1719,0),(155,1719,36),(154,1720,1),(155,1720,38),(155,1720,114),(154,1721,5),(155,1721,46),(154,1722,6),(155,1722,47),(155,1722,111),(157,1722,4),(154,1723,7),(155,1723,51),(155,1723,83),(157,1723,5),(154,1724,9),(155,1724,32),(154,1725,19),(154,1726,20),(154,1727,21),(154,1728,22),(155,1728,145),(155,1729,0),(155,1730,2),(155,1730,43),(155,1731,4),(155,1732,5),(155,1733,7),(155,1734,9),(155,1735,11),(155,1736,14),(155,1737,15),(155,1738,16),(155,1739,29),(155,1740,37),(155,1741,39),(155,1742,40),(155,1743,48),(155,1744,49),(155,1745,50),(155,1746,52),(155,1747,55),(160,1747,3),(155,1748,57),(155,1749,60),(160,1749,4),(155,1750,64),(155,1751,68),(155,1752,69),(155,1752,75),(155,1753,70),(155,1753,76),(155,1754,71),(155,1755,73),(155,1756,77),(155,1757,78),(155,1758,79),(155,1758,112),(157,1758,6),(155,1759,80),(155,1760,82),(155,1761,85),(155,1762,88),(155,1763,93),(155,1764,95),(155,1765,96),(155,1766,98),(155,1767,99),(155,1768,100),(155,1769,101),(155,1770,104),(155,1771,105),(155,1772,106),(155,1773,109),(155,1774,110),(155,1775,117),(155,1776,118),(155,1777,120),(155,1778,121),(155,1779,122),(155,1780,123),(155,1781,126),(155,1782,128),(155,1783,131),(155,1784,132),(155,1785,134),(155,1786,136),(155,1787,142),(156,1788,0),(156,1789,5),(156,1790,6);
/*!40000 ALTER TABLE `submission_search_object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_objects`
--

DROP TABLE IF EXISTS `submission_search_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_search_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'Type of item. E.g., abstract, fulltext, etc.',
  `assoc_id` bigint(20) DEFAULT NULL COMMENT 'Optional ID of an associated record (e.g., a file_id)',
  PRIMARY KEY (`object_id`),
  KEY `submission_search_object_submission` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (81,10,1,0),(82,10,2,0),(83,10,4,0),(84,10,16,0),(85,10,17,0),(86,10,8,0),(87,10,32,0),(88,10,64,0),(89,9,1,0),(90,9,2,0),(91,9,4,0),(92,9,16,0),(93,9,17,0),(94,9,8,0),(95,9,32,0),(96,9,64,0),(97,8,1,0),(98,8,2,0),(99,8,4,0),(100,8,16,0),(101,8,17,0),(102,8,8,0),(103,8,32,0),(104,8,64,0),(105,7,1,0),(106,7,2,0),(107,7,4,0),(108,7,16,0),(109,7,17,0),(110,7,8,0),(111,7,32,0),(112,7,64,0),(113,6,1,0),(114,6,2,0),(115,6,4,0),(116,6,16,0),(117,6,17,0),(118,6,8,0),(119,6,32,0),(120,6,64,0),(121,5,1,0),(122,5,2,0),(123,5,4,0),(124,5,16,0),(125,5,17,0),(126,5,8,0),(127,5,32,0),(128,5,64,0),(129,4,1,0),(130,4,2,0),(131,4,4,0),(132,4,16,0),(133,4,17,0),(134,4,8,0),(135,4,32,0),(136,4,64,0),(137,3,1,0),(138,3,2,0),(139,3,4,0),(140,3,16,0),(141,3,17,0),(142,3,8,0),(143,3,32,0),(144,3,64,0),(145,2,1,0),(146,2,2,0),(147,2,4,0),(148,2,16,0),(149,2,17,0),(150,2,8,0),(151,2,32,0),(152,2,64,0),(153,1,1,0),(154,1,2,0),(155,1,4,0),(156,1,16,0),(157,1,17,0),(158,1,8,0),(159,1,32,0),(160,1,64,0);
/*!40000 ALTER TABLE `submission_search_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_settings`
--

DROP TABLE IF EXISTS `submission_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_settings` (
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext DEFAULT NULL,
  UNIQUE KEY `submission_settings_pkey` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_settings`
--

LOCK TABLES `submission_settings` WRITE;
/*!40000 ALTER TABLE `submission_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_tombstones`
--

DROP TABLE IF EXISTS `submission_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `submission_tombstones_journal_id` (`journal_id`),
  KEY `submission_tombstones_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_tombstones`
--

LOCK TABLES `submission_tombstones` WRITE;
/*!40000 ALTER TABLE `submission_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_tombstones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions` (
  `submission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `current_publication_id` bigint(20) DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint(20) NOT NULL DEFAULT 1,
  `locale` varchar(14) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `submission_progress` smallint(6) NOT NULL DEFAULT 1,
  `work_type` smallint(6) DEFAULT 0,
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_publication_id` (`current_publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2026-11-05 06:15:20','2026-10-12 09:15:00','2026-11-05 06:15:20',5,'en_US',3,0,0),(2,1,2,'2026-11-05 06:15:20','2026-10-14 09:15:00','2026-11-05 06:15:20',5,'en_US',3,0,0),(3,1,3,'2026-11-05 06:15:20','2026-10-15 09:15:00','2026-11-05 06:15:20',5,'en_US',3,0,0),(4,1,4,'2026-11-05 06:15:20','2026-10-16 09:15:00','2026-11-05 06:15:20',5,'en_US',3,0,0),(5,1,5,'2026-11-05 06:15:20','2026-10-17 09:15:00','2026-11-05 06:15:20',5,'en_US',3,0,0),(6,1,6,'2026-11-05 06:15:20','2026-10-18 09:15:00','2026-11-05 06:15:20',5,'en_US',3,0,0),(7,1,7,'2026-11-05 06:15:20','2026-10-20 09:15:00','2026-11-05 06:15:20',5,'en_US',3,0,0),(8,1,8,'2026-11-05 06:15:20','2026-10-21 09:15:00','2026-11-05 06:15:20',5,'en_US',3,0,0),(9,1,9,'2026-11-05 06:15:20','2026-10-23 09:15:00','2026-11-05 06:15:20',5,'en_US',3,0,0),(10,1,10,'2026-11-05 06:15:20','2026-10-25 09:15:00','2026-11-05 06:15:20',5,'en_US',3,0,0);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_type_settings`
--

DROP TABLE IF EXISTS `subscription_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `subscription_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `subscription_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_type_settings`
--

LOCK TABLES `subscription_type_settings` WRITE;
/*!40000 ALTER TABLE `subscription_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_types`
--

DROP TABLE IF EXISTS `subscription_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `cost` double(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` smallint(6) NOT NULL DEFAULT 0,
  `membership` smallint(6) NOT NULL DEFAULT 0,
  `disable_public_display` smallint(6) NOT NULL,
  `seq` double(8,2) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_types`
--

LOCK TABLES `subscription_types` WRITE;
/*!40000 ALTER TABLE `subscription_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `membership` varchar(40) DEFAULT NULL,
  `reference_number` varchar(40) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary_files`
--

DROP TABLE IF EXISTS `temporary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporary_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `temporary_files_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_files`
--

LOCK TABLES `temporary_files` WRITE;
/*!40000 ALTER TABLE `temporary_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_stats_temporary_records` (
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `day` bigint(20) NOT NULL,
  `entry_time` bigint(20) NOT NULL,
  `metric` bigint(20) NOT NULL DEFAULT 1,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_temporary_records`
--

LOCK TABLES `usage_stats_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_settings`
--

DROP TABLE IF EXISTS `user_group_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_settings` (
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES (1,'en_US','name','Site Admin','string'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),(2,'','nameLocaleKey','default.groups.name.manager','string'),(2,'en_US','abbrev','JM','string'),(2,'en_US','name','Journal manager','string'),(3,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),(3,'','nameLocaleKey','default.groups.name.editor','string'),(3,'en_US','abbrev','JE','string'),(3,'en_US','name','Journal editor','string'),(4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),(4,'','nameLocaleKey','default.groups.name.productionEditor','string'),(4,'en_US','abbrev','ProdE','string'),(4,'en_US','name','Production editor','string'),(5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),(5,'','nameLocaleKey','default.groups.name.sectionEditor','string'),(5,'en_US','abbrev','SecE','string'),(5,'en_US','name','Section editor','string'),(6,'','abbrevLocaleKey','default.groups.abbrev.guestEditor','string'),(6,'','nameLocaleKey','default.groups.name.guestEditor','string'),(6,'en_US','abbrev','GE','string'),(6,'en_US','name','Guest editor','string'),(7,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),(7,'','nameLocaleKey','default.groups.name.copyeditor','string'),(7,'en_US','abbrev','CE','string'),(7,'en_US','name','Copyeditor','string'),(8,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),(8,'','nameLocaleKey','default.groups.name.designer','string'),(8,'en_US','abbrev','Design','string'),(8,'en_US','name','Designer','string'),(9,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),(9,'','nameLocaleKey','default.groups.name.funding','string'),(9,'en_US','abbrev','FC','string'),(9,'en_US','name','Funding coordinator','string'),(10,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),(10,'','nameLocaleKey','default.groups.name.indexer','string'),(10,'en_US','abbrev','IND','string'),(10,'en_US','name','Indexer','string'),(11,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),(11,'','nameLocaleKey','default.groups.name.layoutEditor','string'),(11,'en_US','abbrev','LE','string'),(11,'en_US','name','Layout Editor','string'),(12,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),(12,'','nameLocaleKey','default.groups.name.marketing','string'),(12,'en_US','abbrev','MS','string'),(12,'en_US','name','Marketing and sales coordinator','string'),(13,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),(13,'','nameLocaleKey','default.groups.name.proofreader','string'),(13,'en_US','abbrev','PR','string'),(13,'en_US','name','Proofreader','string'),(14,'','abbrevLocaleKey','default.groups.abbrev.author','string'),(14,'','nameLocaleKey','default.groups.name.author','string'),(14,'en_US','abbrev','AU','string'),(14,'en_US','name','Author','string'),(15,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),(15,'','nameLocaleKey','default.groups.name.translator','string'),(15,'en_US','abbrev','Trans','string'),(15,'en_US','name','Translator','string'),(16,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),(16,'','nameLocaleKey','default.groups.name.externalReviewer','string'),(16,'en_US','abbrev','R','string'),(16,'en_US','name','Reviewer','string'),(17,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),(17,'','nameLocaleKey','default.groups.name.reader','string'),(17,'en_US','abbrev','Read','string'),(17,'en_US','name','Reader','string'),(18,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager','string'),(18,'','nameLocaleKey','default.groups.name.subscriptionManager','string'),(18,'en_US','abbrev','SubM','string'),(18,'en_US','name','Subscription Manager','string');
/*!40000 ALTER TABLE `user_group_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_stage`
--

DROP TABLE IF EXISTS `user_group_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_stage` (
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_group_stage_pkey` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_stage`
--

LOCK TABLES `user_group_stage` WRITE;
/*!40000 ALTER TABLE `user_group_stage` DISABLE KEYS */;
INSERT INTO `user_group_stage` VALUES (1,3,1),(1,3,3),(1,3,4),(1,3,5),(1,4,4),(1,4,5),(1,5,1),(1,5,3),(1,5,4),(1,5,5),(1,6,1),(1,6,3),(1,6,4),(1,6,5),(1,7,4),(1,8,5),(1,9,1),(1,9,3),(1,10,5),(1,11,5),(1,12,4),(1,13,5),(1,14,1),(1,14,3),(1,14,4),(1,14,5),(1,15,1),(1,15,3),(1,15,4),(1,15,5),(1,16,3);
/*!40000 ALTER TABLE `user_group_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT 0,
  `show_title` smallint(6) NOT NULL DEFAULT 1,
  `permit_self_registration` smallint(6) NOT NULL DEFAULT 0,
  `permit_metadata_edit` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_group_id`),
  KEY `user_groups_user_group_id` (`user_group_id`),
  KEY `user_groups_context_id` (`context_id`),
  KEY `user_groups_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,0,1,1,0,0,0),(2,1,16,1,0,0,1),(3,1,16,1,0,0,1),(4,1,16,1,0,0,1),(5,1,17,1,0,0,1),(6,1,17,1,0,0,0),(7,1,4097,1,0,0,0),(8,1,4097,1,0,0,0),(9,1,4097,1,0,0,0),(10,1,4097,1,0,0,0),(11,1,4097,1,0,0,0),(12,1,4097,1,0,0,0),(13,1,4097,1,0,0,0),(14,1,65536,1,0,1,0),(15,1,65536,1,0,0,0),(16,1,4096,1,0,1,0),(17,1,1048576,1,0,1,0),(18,1,2097152,1,0,0,0);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_interests` (
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interests`
--

LOCK TABLES `user_interests` WRITE;
/*!40000 ALTER TABLE `user_interests` DISABLE KEYS */;
INSERT INTO `user_interests` VALUES (4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(6,7),(6,8),(6,9),(6,10);
/*!40000 ALTER TABLE `user_interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_settings` (
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT 0,
  `assoc_id` bigint(20) NOT NULL DEFAULT 0,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,'en_US','affiliation',0,0,'Universitas Negeri Malang (NIM 250911718423)','string'),(1,'en_US','familyName',0,0,'Rizky','string'),(1,'en_US','givenName',0,0,'Mohammad Yanuar','string'),(4,'','orcid',0,0,'https://orcid.org/0000-0002-8423-0001','string'),(4,'en_US','affiliation',0,0,'Universitas Negeri Malang (NIM 250911718423)','string'),(4,'en_US','biography',0,0,'Journal Manager & Managing Editor Hortus Journal. Bertanggung jawab atas konfigurasi arsitektur OJS, manajemen hak akses peran pengguna (User Roles), dan pengawasan kualitas operasional penerbitan.','string'),(4,'en_US','familyName',0,0,'Rizky','string'),(4,'en_US','givenName',0,0,'Mohammad Yanuar','string'),(5,'','orcid',0,0,'https://orcid.org/0000-0002-1001-0001','string'),(5,'en_US','affiliation',0,0,'Universitas Negeri Malang','string'),(5,'en_US','biography',0,0,'Pemimpin Redaksi (Editor-in-Chief) Hortus Journal. Memimpin kebijakan ilmiah, seleksi kelayakan awal (Initial Screening), pengawasan etika publikasi COPE, dan penetapan keputusan akhir penerbitan naskah.','string'),(5,'en_US','familyName',0,0,'Rahmania, S.Kom, M.Kom','string'),(5,'en_US','givenName',0,0,'Lidya Amalia','string'),(6,'','orcid',0,0,'https://orcid.org/0000-0002-3861-0002','string'),(6,'en_US','affiliation',0,0,'Universitas Negeri Malang (NIM 250911723861)','string'),(6,'en_US','biography',0,0,'Section Editor Hortus Journal. Mengelola penugasan mitra bebestari (Double-Blind Peer Review) dan memvalidasi alur revisi naskah.','string'),(6,'en_US','familyName',0,0,'Lestari','string'),(6,'en_US','givenName',0,0,'Nirmala Dwi','string'),(8,'en_US','affiliation',0,0,'Universitas Negeri Malang (NIM 250911721564)','string'),(8,'en_US','familyName',0,0,'Syukurillah (Author)','string'),(8,'en_US','givenName',0,0,'Nayla','string'),(9,'','orcid',0,0,'https://orcid.org/0000-0002-1564-0003','string'),(9,'en_US','affiliation',0,0,'Universitas Negeri Malang (NIM 250911721564)','string'),(9,'en_US','biography',0,0,'Layout Editor, Copyeditor & Production Team Hortus Journal. Bertanggung jawab atas penyuntingan gaya selingkung (Copyediting), tata letak Galley PDF, dan kesiapan pracetak terbitan.','string'),(9,'en_US','familyName',0,0,'Syukurillah','string'),(9,'en_US','givenName',0,0,'Nayla','string');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_user_groups_pkey` (`user_group_id`,`user_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES (1,1),(2,1),(2,4),(2,5),(2,6),(2,9),(3,4),(3,5),(3,6),(3,9),(4,9),(5,6),(7,9),(11,9),(13,9),(14,4),(14,6),(14,8),(14,9),(16,4),(16,6),(16,9);
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups_backup`
--

DROP TABLE IF EXISTS `user_user_groups_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user_groups_backup` (
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups_backup`
--

LOCK TABLES `user_user_groups_backup` WRITE;
/*!40000 ALTER TABLE `user_user_groups_backup` DISABLE KEYS */;
INSERT INTO `user_user_groups_backup` VALUES (1,1),(2,1),(2,4),(2,5),(2,11),(3,4),(3,5),(3,11),(4,9),(5,6),(7,9),(11,9),(13,9),(14,8),(16,7),(16,10);
/*!40000 ALTER TABLE `user_user_groups_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) DEFAULT NULL,
  `gossip` text DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` smallint(6) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint(6) NOT NULL DEFAULT 0,
  `disabled_reason` text DEFAULT NULL,
  `inline_help` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$3X7v25Kz0/7A0fJG/B6XbeW78/5JSWMUPG2/Ybv9trXaNrCuDwUsq','yansmurf7@gmail.com',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2026-08-31 08:59:39',NULL,'2026-09-11 06:01:12',0,NULL,NULL,0,NULL,1),(4,'yanuar','$2y$10$3X7v25Kz0/7A0fJG/B6XbeW78/5JSWMUPG2/Ybv9trXaNrCuDwUsq','yanuar.rizky@hortus.ac.id',NULL,'+62-812-3456-8423',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-10 16:58:23',0,NULL,NULL,0,NULL,1),(5,'editor_utama','$2y$10$3X7v25Kz0/7A0fJG/B6XbeW78/5JSWMUPG2/Ybv9trXaNrCuDwUsq','lidya.rahmania@hortus.ac.id',NULL,'+62-341-551312',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:58:34',0,NULL,NULL,0,NULL,1),(6,'nirmala','$2y$10$3X7v25Kz0/7A0fJG/B6XbeW78/5JSWMUPG2/Ybv9trXaNrCuDwUsq','nirmala.lestari@hortus.ac.id',NULL,'+62-812-3456-3861',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:36:33',0,NULL,NULL,0,NULL,1),(8,'author_test','$2y$10$3X7v25Kz0/7A0fJG/B6XbeW78/5JSWMUPG2/Ybv9trXaNrCuDwUsq','author.test@hortus.ac.id',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-11-05 20:54:01',NULL,'2026-11-05 20:54:01',NULL,NULL,NULL,0,NULL,NULL),(9,'nayla','$2y$10$3X7v25Kz0/7A0fJG/B6XbeW78/5JSWMUPG2/Ybv9trXaNrCuDwUsq','nayla.syukurillah@hortus.ac.id',NULL,'+62-812-3456-1564',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:36:34',0,NULL,NULL,0,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_backup`
--

DROP TABLE IF EXISTS `users_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_backup` (
  `user_id` bigint(20) NOT NULL DEFAULT 0,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(2047) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mailing_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `billing_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `country` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `locales` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gossip` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` smallint(6) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `disabled` smallint(6) NOT NULL DEFAULT 0,
  `disabled_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `inline_help` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_backup`
--

LOCK TABLES `users_backup` WRITE;
/*!40000 ALTER TABLE `users_backup` DISABLE KEYS */;
INSERT INTO `users_backup` VALUES (1,'admin','$2y$10$YJ4D3oMHQ0xuCtD5DlARw.qpcXMOicpXkueQseft.fbt4Jbefimje','yansmurf7@gmail.com',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2026-08-31 08:59:39',NULL,'2026-09-11 06:01:12',0,NULL,NULL,0,NULL,1),(4,'Admin_jurnal','$2y$10$3X7v25Kz0/7A0fJG/B6XbeW78/5JSWMUPG2/Ybv9trXaNrCuDwUsq','yanuar.rizky@hortus.ac.id',NULL,'+62-812-3456-8423',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:36:33',0,NULL,NULL,0,NULL,1),(5,'editor_utama','$2y$10$6ZovLMeJXe1uXHzLWv1QVOqLQFJ8o0tAL749KHo6v6T.mBNO/5sHC','lidya.rahmania@hortus.ac.id',NULL,'+62-341-551312',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:58:34',0,NULL,NULL,0,NULL,1),(6,'editor_subjek','$2y$10$YkXRWDJex58W9NBGJuGd6.zwjNJ6gYKJiZ3.Ez.wivKxgmCc9OnA.','nirmala.lestari@hortus.ac.id',NULL,'+62-812-3456-3861',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:36:33',0,NULL,NULL,0,NULL,1),(7,'reviewer_01','$2y$10$PGYthrTKuh62om8zzgj6nO3jR2KtCYYmK9Rf/fS6czD4.bJEI1812','reviewer1@hortus.ac.id',NULL,'+62-812-3456-8424',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:59:04',0,NULL,NULL,0,NULL,1),(8,'author_test','$2y$10$1pyEvE8DmrTEgYQikZ3g..2HgAAMz4tOCkJXyAl0TBebCzX0xeNpi','nayla.syukurillah@hortus.ac.id',NULL,'+62-812-3456-1565',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:36:34',0,NULL,NULL,0,NULL,1),(9,'layout_edit','$2y$10$9thl3uGbe1O0wP3QWB1VBubGjOxuI2guKt3Ah3pBRiSG1J6T3m9pe','nayla.layout@hortus.ac.id',NULL,'+62-812-3456-1564',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:36:34',0,NULL,NULL,0,NULL,1),(10,'reviewer_02','$2y$10$5I/ZDoDnLXLwOYs2JiIBzuubAJmoH8o4DHq2xpD2.HxGJyXSffQJe','reviewer2@hortus.ac.id',NULL,'+62-812-3456-3862',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:36:34',0,NULL,NULL,0,NULL,1),(11,'admin_journal','$2y$10$3X7v25Kz0/7A0fJG/B6XbeW78/5JSWMUPG2/Ybv9trXaNrCuDwUsq','admin_journal@hortus.ac.id',NULL,'+62-812-3456-8423',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:36:33',0,NULL,NULL,0,NULL,1);
/*!40000 ALTER TABLE `users_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `major` int(11) NOT NULL DEFAULT 0 COMMENT 'Major component of version number, e.g. the 2 in OJS 2.3.8-0',
  `minor` int(11) NOT NULL DEFAULT 0 COMMENT 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0',
  `revision` int(11) NOT NULL DEFAULT 0 COMMENT 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0',
  `build` int(11) NOT NULL DEFAULT 0 COMMENT 'Build component of version number, e.g. the 0 in OJS 2.3.8-0',
  `date_installed` datetime NOT NULL,
  `current` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.',
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itelf',
  `product` varchar(30) DEFAULT NULL COMMENT 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.',
  `product_class_name` varchar(80) DEFAULT NULL COMMENT 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.',
  `lazy_load` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a lazy-load plugin; 0 otherwise',
  `sitewide` smallint(6) NOT NULL DEFAULT 0 COMMENT '1 iff the row describes a site-wide plugin; 0 otherwise',
  UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,0,0,0,'2026-08-31 08:59:39',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,1,0,'2026-08-31 08:59:39',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,1,0,0,'2026-08-31 08:59:39',1,'plugins.blocks','subscription','SubscriptionBlockPlugin',1,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.gateways','resolver','',0,0),(1,0,1,0,'2026-08-31 08:59:39',1,'plugins.generic','lensGalley','LensGalleyPlugin',1,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.generic','recommendByAuthor','RecommendByAuthorPlugin',1,1),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(1,2,0,0,'2026-08-31 08:59:39',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.generic','announcementFeed','AnnouncementFeedPlugin',1,0),(1,1,3,12,'2026-08-31 08:59:39',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(1,0,1,0,'2026-08-31 08:59:39',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,2,0,0,'2026-08-31 08:59:39',1,'plugins.generic','acron','AcronPlugin',1,1),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.generic','driver','DRIVERPlugin',1,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,1,0,0,'2026-08-31 08:59:39',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.generic','htmlArticleGalley','HtmlArticleGalleyPlugin',1,0),(0,1,0,0,'2026-08-31 08:59:39',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(1,2,0,0,'2026-08-31 08:59:39',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.generic','usageEvent','',0,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.generic','recommendBySimilarity','RecommendBySimilarityPlugin',1,1),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(2,1,0,0,'2026-08-31 08:59:39',1,'plugins.importexport','crossref','',0,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.importexport','native','',0,0),(1,1,0,0,'2026-08-31 08:59:39',1,'plugins.importexport','doaj','',0,0),(2,0,0,0,'2026-08-31 08:59:39',1,'plugins.importexport','datacite','',0,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.importexport','users','',0,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.importexport','pubmed','',0,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.oaiMetadataFormats','marc','',0,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.oaiMetadataFormats','rfc1807','',0,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.oaiMetadataFormats','marcxml','',0,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.paymethod','manual','',0,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.paymethod','paypal','',0,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.pubIds','urn','URNPubIdPlugin',1,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.pubIds','doi','DOIPubIdPlugin',1,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.reports','views','',0,0),(1,1,0,0,'2026-08-31 08:59:39',1,'plugins.reports','counterReport','',0,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.reports','articles','',0,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.reports','subscriptions','',0,0),(2,0,0,0,'2026-08-31 08:59:39',1,'plugins.reports','reviewReport','',0,0),(1,0,0,0,'2026-08-31 08:59:39',1,'plugins.themes','default','DefaultThemePlugin',1,0),(3,3,0,16,'2026-08-31 08:59:37',1,'core','ojs2','',0,1),(3,3,1,2,'2026-09-11 06:01:53',1,'plugins.themes','academicFree','AcademicFreeThemePlugin',0,0),(1,0,3,2,'2026-09-11 06:11:08',1,'plugins.themes','defaultManuscript','DefaultManuscriptChildThemePlugin',1,0),(1,1,1,1,'2026-09-11 06:14:21',1,'plugins.themes','healthSciences','HealthSciencesThemePlugin',1,0),(1,1,1,1,'2026-09-11 06:15:42',1,'plugins.themes','immersion','ImmersionThemePlugin',1,0);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-15 19:39:27
