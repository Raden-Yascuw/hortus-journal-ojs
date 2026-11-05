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
INSERT INTO `author_settings` VALUES (1,'','country','ID'),(1,'','orcid','https://orcid.org/0000-0002-1564-0003'),(1,'en_US','affiliation','Departemen Agrosains & Pusat Kajian Bioteknologi Tropika, Universitas Negeri Malang'),(1,'en_US','familyName','Syukurillah'),(1,'en_US','givenName','Nayla'),(2,'','country','ID'),(2,'','orcid','https://orcid.org/0000-0002-8423-0001'),(2,'en_US','affiliation','Departemen Agrosains & UPT Perpustakaan, Universitas Negeri Malang'),(2,'en_US','familyName','Rizky'),(2,'en_US','givenName','Mohammad Yanuar'),(3,'','country','ID'),(3,'','orcid','https://orcid.org/0000-0002-3861-0002'),(3,'en_US','affiliation','Departemen Agrosains, Universitas Negeri Malang'),(3,'en_US','familyName','Lestari'),(3,'en_US','givenName','Nirmala Dwi');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'nayla.syukurillah@hortus.ac.id',1,1,1.00,14),(2,'yanuar.rizky@hortus.ac.id',1,1,2.00,14),(3,'nirmala.lestari@hortus.ac.id',1,1,3.00,14);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citations`
--

LOCK TABLES `citations` WRITE;
/*!40000 ALTER TABLE `citations` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (1,1,0.00),(2,1,0.00),(3,1,0.00),(4,1,0.00),(5,1,0.00),(6,1,0.00),(7,1,0.00),(8,1,0.00),(9,1,0.00),(10,1,0.00),(41,2,1.00),(42,2,2.00),(43,2,3.00),(44,2,4.00),(45,2,5.00),(46,2,6.00);
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
INSERT INTO `controlled_vocab_entry_settings` VALUES (1,'','interest','Smart Plantation','string'),(2,'','interest','UAV Multispectral','string'),(3,'','interest','IoT Sensors','string'),(4,'','interest','Elaeis guineensis','string'),(5,'','interest','Precision Agriculture','string'),(6,'','interest','ISPO Sustainability','string'),(7,'','interest','Oil Palm Breeding','string'),(8,'','interest','Plantation Agronomy','string'),(9,'','interest','Peatland Management','string'),(10,'','interest','Crop Physiology','string'),(41,'en_US','submissionKeyword','Elaeis guineensis','string'),(42,'en_US','submissionKeyword','IoT Kanopi','string'),(43,'en_US','submissionKeyword','Multispektral UAV','string'),(44,'en_US','submissionKeyword','NDRE','string'),(45,'en_US','submissionKeyword','Smart Plantation','string'),(46,'en_US','submissionKeyword','ISPO','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT INTO `controlled_vocabs` VALUES (1,'interest',0,0),(6,'submissionAgency',1048588,1),(4,'submissionDiscipline',1048588,1),(2,'submissionKeyword',1048588,1),(5,'submissionLanguage',1048588,1),(3,'submissionSubject',1048588,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'journals/1/articles/1/6aec10e884050_Naskah_Submisi_Awal_Anonim.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(2,'journals/1/articles/1/6aec10e886733_Naskah_Review_Anonim_Round1.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(3,'journals/1/articles/1/6aec10e89044e_Naskah_Revisi_Author_Round1.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(4,'journals/1/articles/1/6aec10e891b48_Naskah_Final_Draft_Copyediting.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(5,'journals/1/articles/1/6aec10e892e48_Naskah_Copyedited_Final_Hortus_Journal.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(6,'journals/1/articles/1/6aec10e8940b6_Naskah_Production_Ready_Master.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(7,'journals/1/articles/1/6aec10e895a56_Galley_Final_HJ_Vol1_No1_2026.pdf','application/pdf');
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
INSERT INTO `journal_settings` VALUES (1,'','agencies','request',NULL),(1,'','citations','request',NULL),(1,'','contactEmail','yanuar.rizky@hortus.ac.id',NULL),(1,'','contactName','Mohammad Yanuar Rizky',NULL),(1,'','contactPhone','+62-341-551312',NULL),(1,'','copyrightHolderType','author',NULL),(1,'','copyrightYearBasis','submission',NULL),(1,'','defaultReviewMode','2',NULL),(1,'','disableSubmissions','0',NULL),(1,'','disciplines','request',NULL),(1,'','emailSignature','<br/>\n________________________________________________________________________<br/>\n<a href=\"http://localhost/ojs/index.php/Horsju\">Hortus Journal</a>',NULL),(1,'','enableAnnouncements','1',NULL),(1,'','enableClockss','1',NULL),(1,'','enableLockss','1',NULL),(1,'','enableOai','1',NULL),(1,'','itemsPerPage','25',NULL),(1,'','keywords','request',NULL),(1,'','licenseUrl','https://creativecommons.org/licenses/by/4.0',NULL),(1,'','mailingAddress','Jl. Semarang No. 5, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145, Indonesia',NULL),(1,'','membershipFee','0',NULL),(1,'','numAnnouncementsHomepage','3',NULL),(1,'','numPageLinks','10',NULL),(1,'','numWeeksPerResponse','1',NULL),(1,'','numWeeksPerReview','3',NULL),(1,'','onlineIssn','2988-741X',NULL),(1,'','printIssn','2988-7401',NULL),(1,'','publicationFee','0',NULL),(1,'','publisherInstitution','Departemen Agrosains & UPT Perpustakaan Universitas Negeri Malang',NULL),(1,'','publisherUrl','https://um.ac.id',NULL),(1,'','publishingMode','0',NULL),(1,'','purchaseArticleFee','0',NULL),(1,'','rateReviewerOnQuality','1',NULL),(1,'','restrictReviewerFileAccess','1',NULL),(1,'','showEnsuringLink','1',NULL),(1,'','styleSheet','{\"name\":\"styleSheet.css\",\"uploadName\":\"styleSheet.css\",\"dateUploaded\":\"2026-11-05 06:15:17\"}',NULL),(1,'','supportedFormLocales','[\"en_US\"]',NULL),(1,'','supportedLocales','[\"en_US\"]',NULL),(1,'','supportedSubmissionLocales','[\"en_US\"]',NULL),(1,'','supportEmail','support@hortus.ac.id',NULL),(1,'','supportName','Mohammad Yanuar Rizky',NULL),(1,'','supportPhone','+62-341-551313',NULL),(1,'','themePluginPath','default',NULL),(1,'en_US','abbreviation','Hortus J.',NULL),(1,'en_US','about','<h3>Visi &amp; Misi Jurnal</h3>\n<p><strong>Visi:</strong> Menjadi jurnal ilmiah Akses Terbuka terdepan dan bereputasi global di kawasan Asia Tenggara dalam memajukan ilmu pengetahuan, teknologi terapan, dan keberlanjutan ekosistem perkebunan tropika berbasis sains terbuka pada tahun 2032.</p>\n<p><strong>Misi:</strong></p>\n<ol>\n<li>Menyelenggarakan penerbitan berkala ilmiah Akses Terbuka Berlian (<em>Diamond Open Access</em>) yang mengedepankan integritas keilmuan, transparansi editorial, dan telaah sejawat bermutu tinggi (<em>double-blind peer review</em>) tanpa hambatan finansial.</li>\n<li>Memfasilitasi diseminasi dan preservasi temuan riset mutakhir di bidang sains tanaman perkebunan tropis, teknologi pertanian presisi, dan agroindustri sirkular ramah lingkungan.</li>\n<li>Membangun kolaborasi ilmiah lintas disiplin yang menghubungkan akademisi, balai penelitian pemerintah (BRIN/PPKS/ICCRI), praktisi industri agribisnis, dan asosiasi pekebun mandiri.</li>\n<li>Menerapkan tata kelola penerbitan berstandar internasional yang mematuhi pedoman etika publikasi COPE serta memenuhi kriteria indeksasi DOAJ dan akreditasi nasional SINTA.</li>\n</ol>\n\n<h3>Fokus dan Ruang Lingkup (Focus &amp; Scope)</h3>\n<p><strong>Hortus Journal</strong> mempublikasikan naskah ilmiah orisinal di bidang perkebunan tropika dan agroindustri berkelanjutan, meliputi 5 (lima) bagian subjek utama:</p>\n<ul>\n<li><strong>Agronomy, Physiology &amp; Plantation Breeding:</strong> Bioteknologi tanaman tahunan (sawit, karet, kopi, kakao, tebu, teh), kultur jaringan, marka molekuler, fisiologi cekaman iklim, serta manajemen kesuburan tanah gambut dan mineral.</li>\n<li><strong>Integrated Bio-Protection &amp; Ecosystem Health:</strong> Pengendalian hama dan penyakit tanaman perkebunan terpadu, agen antagonis hayati, epidemiologi patogen tropis, dan konservasi biodiversitas agroforestri.</li>\n<li><strong>Smart &amp; Precision Plantation Farming:</strong> Penginderaan jauh wahana UAV/drone multispektral dan hiperspektral, jaringan sensor Internet of Things (IoT) kanopi dan tanah, sistem informasi geografis (WebGIS), serta pemodelan kecerdasan buatan (AI/Machine Learning) estimasi hasil panen.</li>\n<li><strong>Postharvest, Biomass &amp; Circular Agro-Industry:</strong> Teknologi pengolahan pascapanen komoditas perkebunan, ekstraksi senyawa bioaktif, konversi limbah biomassa (tandan kosong kelapa sawit, POME, kulit kopi/kakao) menjadi bioproduk dan bioenergi sirkular.</li>\n<li><strong>Socio-Economics &amp; Sustainability Certification:</strong> Analisis rantai pasok agribisnis, tata kelola dan audit sertifikasi keberlanjutan (ISPO, RSPO, Rainforest Alliance), ekonomi karbon perkebunan, serta pemberdayaan kelembagaan pekebun swadaya.</li>\n</ul>\n\n<h3>Kebijakan Penelaahan Sejawat (Peer Review Policy)</h3>\n<p>Mengacu pada prinsip penjaminan mutu ilmiah (Solomon, 2008; Suber, 2012), <strong>Hortus Journal</strong> menerapkan model <strong>Double-Blind Peer Review</strong> (Penelaahan Sejawat Buta Ganda):</p>\n<ol>\n<li><strong>Kerahasiaan Identitas Ganda:</strong> Identitas penulis (<em>Author</em>) dan mitra bebestari (<em>Reviewer</em>) saling dirahasiakan selama seluruh tahapan evaluasi untuk mengeliminasi bias institusional, geografis, senioritas, maupun gender, sehingga naskah dinilai murni berdasarkan kebaruan ilmiah (<em>novelty</em>), ketepatan metodologi, dan kontribusi akademisnya.</li>\n<li><strong>Seleksi Awal (Initial Desk Screening):</strong> Setiap naskah yang diunggah melalui penyaringan awal oleh <em>Managing Editor</em> dan <em>Editor-in-Chief</em> dalam waktu <strong>3–5 hari kerja</strong> untuk memeriksa kesesuaian ruang lingkup (<em>Focus &amp; Scope</em>), kepatuhan struktur IMRAD, anonimitas berkas (<em>blind manuscript</em>), serta uji kemiripan menggunakan Turnitin/iThenticate dengan ambang batas maksimal <strong>&le; 20%</strong>.</li>\n<li><strong>Penugasan Mitra Bebestari:</strong> Naskah yang lolos seleksi awal diteruskan kepada <em>Section Editor</em> sesuai kepakaran untuk ditugaskan kepada minimal <strong>2 (dua) Reviewer independen</strong> bergelar Doktor (Ph.D.) atau pakar aktif bereputasi dengan rekam jejak publikasi terindeks di bidang terkait.</li>\n<li><strong>Target Waktu Evaluasi (Review SLA):</strong> Mitra bebestari diberikan waktu maksimal <strong>7 hari</strong> untuk merespons undangan, dan <strong>2–4 minggu (14–28 hari kalender)</strong> sejak penugasan diterima untuk menyelesaikan pengisian Formulir Evaluasi Terstruktur (<em>Structured Review Form</em>). Siklus putusan editorial pertama ditargetkan tuntas dalam <strong>4–6 minggu</strong> sejak pengajuan.</li>\n<li><strong>Kriteria Keputusan Editorial (Editorial Decisions):</strong>\n<ul>\n<li><strong>Accept Submission (Diterima Tanpa Revisi):</strong> Naskah memiliki orisinalitas sangat tinggi, metodologi dan analisis statistik valid tanpa cacat, pembahasan tajam, serta mematuhi gaya selingkung sepenuhnya sehingga langsung dilanjutkan ke tahap <em>Copyediting</em>.</li>\n<li><strong>Revisions Required (Diterima dengan Revisi Minor):</strong> Naskah memiliki substansi dan metodologi yang kuat namun memerlukan perbaikan minor pada kejelasan narasi, kelengkapan penyajian tabel/grafik, atau pemutakhiran referensi. Penulis diberi waktu <strong>7–14 hari</strong> untuk mengunggah revisi yang akan diverifikasi langsung oleh <em>Section Editor</em> tanpa perlu putaran review ulang.</li>\n<li><strong>Resubmit for Review (Revisi Mayor &amp; Telaah Ulang):</strong> Naskah memiliki potensi kebaruan topik yang relevan namun terdapat kelemahan substansial pada desain metodologi, kedalaman analisis statistik, atau argumentasi pembahasan. Penulis wajib melakukan perombakan komprehensif dalam waktu <strong>14–21 hari</strong> untuk dievaluasi kembali oleh Reviewer pada Putaran Kedua (<em>Round 2</em>).</li>\n<li><strong>Decline Submission (Ditolak):</strong> Naskah ditolak apabila berada di luar ruang lingkup jurnal (<em>out of scope</em>), memiliki cacat metodologi fatal, tidak memiliki kebaruan ilmiah, melampaui batas kemiripan plagiarisme (&gt;20%), atau tidak memenuhi standar mutu ilmiah berdasarkan rekomendasi objektif Reviewer.</li>\n</ul>\n</li>\n<li><strong>Penyelesaian Perbedaan Rekomendasi (Adjudication):</strong> Apabila kedua Reviewer memberikan rekomendasi yang bertolak belakang secara ekstrem (satu <em>Accept</em> dan satu <em>Decline</em>), <em>Section Editor</em> menugaskan <strong>Reviewer Ketiga (Adjudicator)</strong> sebelum <em>Editor-in-Chief</em> menetapkan keputusan akhir.</li>\n</ol>',NULL),(1,'en_US','acronym','HJ',NULL),(1,'en_US','authorGuidelines','<h3>Panduan Penulis (Instructions for Authors)</h3>\n<p>Penulis yang mengajukan naskah ke <strong>Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences</strong> wajib mematuhi ketentuan struktur penulisan, gaya selingkung, format sitasi, dan etika publikasi berikut:</p>\n\n<h4>1. Struktur Artikel Ilmiah (Format IMRAD)</h4>\n<p>Naskah harus disusun secara sistematis mengikuti struktur standar <strong>IMRAD (<em>Introduction, Methods, Results, and Discussion</em>)</strong> dengan panjang naskah antara <strong>4.000 hingga 7.500 kata</strong> (untuk <em>Original Research Article</em>) atau <strong>5.000 hingga 9.000 kata</strong> (untuk <em>Review Article</em>), termasuk tabel, gambar, dan daftar rujukan:</p>\n<ul>\n<li><strong>Judul Naskah (Title):</strong> Ringkas, spesifik, dan informatif (maksimal <strong>18 kata</strong> dalam Bahasa Indonesia atau Bahasa Inggris), mencantumkan nama ilmiah spesies tanaman secara cetak miring (<em>italics</em>), tanpa singkatan tidak baku.</li>\n<li><strong>Identitas &amp; Anonimitas (Blind Manuscript):</strong> Karena jurnal menerapkan <em>Double-Blind Peer Review</em>, berkas naskah utama (<em>Main Manuscript File</em>) yang diunggah pada Tahap 1 <strong>TIDAK BOLEH mencantumkan nama penulis, afiliasi, maupun ucapan terima kasih yang mengungkap identitas</strong>. Metadata lengkap penulis diinput pada formulir metadata OJS dan diunggah terpisah sebagai berkas <em>Title Page</em>.</li>\n<li><strong>Abstrak (Abstract) &amp; Kata Kunci (Keywords):</strong> Ditulis dalam satu paragraf terstruktur (<strong>150–250 kata</strong>) dalam Bahasa Indonesia dan Bahasa Inggris yang merangkum latar belakang singkat, tujuan, metode, temuan kuantitatif utama (nilai signifikansi/akurasi), dan implikasi kesimpulan. Dilengkapi <strong>4–6 kata kunci</strong> yang disusun alfabetis dan dipisahkan dengan tanda titik koma (;).</li>\n<li><strong>1. Pendahuluan (Introduction):</strong> Menguraikan konteks permasalahan strategis di sektor perkebunan/agroindustri, kajian pustaka mutakhir (<em>state of the art</em>), analisis kesenjangan riset (<em>research gap</em>), kebaruan ilmiah (<em>novelty</em>), dan rumusan tujuan penelitian secara eksplisit pada paragraf akhir.</li>\n<li><strong>2. Metode Penelitian (Materials and Methods):</strong> Menjelaskan lokasi dan waktu penelitian, bahan genetik/varietas tanaman, spesifikasi instrumen/sensor, rancangan percobaan, prosedur akuisisi data, serta metode analisis statistik atau algoritma pemodelan secara rinci agar penelitian dapat direplikasi (<em>reproducible</em>).</li>\n<li><strong>3. Hasil dan Pembahasan (Results and Discussion):</strong> Menyajikan temuan riset secara logis didukung tabel dan ilustrasi beresolusi tinggi (minimal 300 DPI), disertai interpretasi ilmiah mendalam yang mengaitkan hasil temuan dengan mekanisme fisiologis/agronomis serta membandingkannya terhadap literatur primer terkini.</li>\n<li><strong>4. Kesimpulan (Conclusion):</strong> Berisi jawaban ringkas atas tujuan penelitian dalam satu paragraf padat tanpa mengulang angka statistik secara berlebihan, dilengkapi rekomendasi aplikatif bagi industri perkebunan, pekebun, atau kebijakan keberlanjutan.</li>\n<li><strong>Daftar Rujukan (References):</strong> Memuat seluruh pustaka yang disitasi dalam teks. Minimal <strong>25 referensi</strong> untuk artikel riset (minimal <strong>80% berasal dari artikel jurnal bereputasi terbitan 10 tahun terakhir</strong> disertai tautan DOI aktif).</li>\n</ul>\n\n<h4>2. Gaya Selingkung &amp; Format Tipografi</h4>\n<ul>\n<li><strong>Format Berkas:</strong> Microsoft Word (<code>.docx</code> / <code>.doc</code>) atau OpenDocument (<code>.odt</code>), ukuran kertas A4 (210 &times; 297 mm), margin atas, bawah, kiri, dan kanan masing-masing <strong>2,5 cm</strong>.</li>\n<li><strong>Tipografi:</strong> Huruf <strong>Times New Roman ukuran 11 pt</strong> untuk teks utama, spasi <strong>1,15</strong>, perataan kanan-kiri (<em>justified</em>), satu kolom. Judul artikel 15 pt tebal (<em>bold</em>), dan abstrak 10 pt spasi 1,0.</li>\n<li><strong>Satuan &amp; Tata Nama Ilmiah:</strong> Wajib menggunakan Sistem Satuan Internasional (SI) seperti <code>ton/ha/tahun</code>, <code>mg/L</code>, <code>&mu;mol m<sup>-2</sup> s<sup>-1</sup></code>. Nama ilmiah tanaman, serangga, dan patogen ditulis miring sesuai kode tatanama binomial (contoh: <em>Elaeis guineensis</em> Jacq., <em>Ganoderma boninense</em>).</li>\n<li><strong>Tabel &amp; Gambar:</strong> Tabel menggunakan format garis horizontal terbuka (<em>three-line table</em> tanpa garis vertikal) dengan judul di atas tabel. Gambar/grafik diberi keterangan (<em>caption</em>) di bawah gambar.</li>\n</ul>\n\n<h4>3. Format Sitasi &amp; Daftar Rujukan (APA 7th Edition)</h4>\n<p><strong>Hortus Journal</strong> menerapkan gaya sitasi <strong>American Psychological Association (APA) Edisi ke-7 (<em>APA 7th Edition Style</em>)</strong> dengan sistem nama-tahun (<em>author-date</em>). Penulis sangat diwajibkan menggunakan perangkat lunak manajemen referensi seperti <strong>Mendeley, Zotero, atau EndNote</strong>:</p>\n<ul>\n<li><strong>Sitasi dalam Teks:</strong> Satu penulis: (Suber, 2012); Dua penulis: (Solomon &amp; Willinsky, 2008); Tiga penulis atau lebih: (Syukurillah et al., 2026).</li>\n<li><strong>Format Daftar Rujukan:</strong> Disusun alfabetis dan kronologis dengan indentasi menggantung (<em>hanging indent</em> 1,27 cm) serta mencantumkan URL DOI penuh (<code>https://doi.org/...</code>).</li>\n</ul>\n\n<h4>4. Etika Publikasi, Anti-Plagiarisme, dan Lisensi Terbuka</h4>\n<ul>\n<li><strong>Keaslian &amp; Anti-Plagiarisme:</strong> Naskah harus murni karya orisinal penulis, belum pernah dipublikasikan, dan tidak sedang dipertimbangkan di jurnal lain. Setiap naskah wajib melalui pemindaian kemiripan teks menggunakan <strong>Turnitin / iThenticate</strong> dengan batas toleransi kemiripan keseluruhan maksimal <strong>&le; 20%</strong> (dan maksimal 3% dari satu sumber tunggal). Tindak plagiarisme, fabrikasi data, falsifikasi, dan publikasi ganda akan ditindak tegas sesuai pedoman <strong>COPE (<em>Committee on Publication Ethics</em>)</strong>.</li>\n<li><strong>Pernyataan Bebas Konflik Kepentingan (Competing Interests):</strong> Seluruh penulis wajib mendeklarasikan sumber pendanaan riset dan menyatakan ketiadaan konflik kepentingan finansial maupun komersial yang dapat memengaruhi objektivitas hasil penelitian.</li>\n<li><strong>Hak Cipta &amp; Lisensi Creative Commons:</strong> Penulis memegang hak cipta penuh (<em>Author retains copyright</em>) atas karyanya dan memberikan hak publikasi pertama kepada <strong>Hortus Journal</strong>. Seluruh artikel diterbitkan di bawah lisensi <strong><a href=\"https://creativecommons.org/licenses/by/4.0/\" target=\"_blank\">Creative Commons Attribution 4.0 International (CC BY 4.0)</a></strong> yang mengizinkan siapa saja mengunduh, membagikan, menyadur, dan memanfaatkan karya untuk tujuan apa pun sepanjang mencantumkan kredit sitasi kepada penulis asli dan jurnal.</li>\n</ul>',NULL),(1,'en_US','authorInformation','Interested in submitting to this journal? We recommend that you review the <a href=\"http://localhost/ojs/index.php/Horsju/about\">About the Journal</a> page for the journal\'s section policies, as well as the <a href=\"http://localhost/ojs/index.php/Horsju/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/ojs/index.php/Horsju/user/register\">register</a> with the journal prior to submitting or, if already registered, can simply <a href=\"http://localhost/ojs/index.php/index/login\">log in</a> and begin the five-step process.',NULL),(1,'en_US','clockssLicense','This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://clockss.org/\">More...</a>',NULL),(1,'en_US','competingInterests','<p>Seluruh penulis (<em>Authors</em>) dan mitra bebestari (<em>Reviewers</em>) wajib mengungkapkan setiap potensi konflik kepentingan finansial, institusional, maupun personal (<em>Competing Interests / Conflict of Interest</em>) yang dapat memengaruhi objektivitas penelitian atau proses evaluasi naskah. Penulis wajib mencantumkan pernyataan bebas konflik kepentingan dan sumber pendanaan riset pada bagian akhir naskah.</p>',NULL),(1,'en_US','contactAffiliation','Departemen Agrosains & UPT Perpustakaan Universitas Negeri Malang',NULL),(1,'en_US','copyrightNotice','<p>Penulis yang mempublikasikan naskahnya pada <strong>Hortus Journal</strong> menyetujui ketentuan hak cipta dan lisensi berikut:</p>\n<ol>\n<li>Penulis tetap memegang hak cipta penuh (<em>Authors retain copyright</em>) dan memberikan hak publikasi pertama (<em>right of first publication</em>) kepada <strong>Hortus Journal</strong> di bawah lisensi <strong><a href=\"https://creativecommons.org/licenses/by/4.0/\" target=\"_blank\">Creative Commons Attribution 4.0 International License (CC BY 4.0)</a></strong>, yang mengizinkan pihak lain untuk membagikan dan mengadaptasi karya tersebut dengan syarat mencantumkan pengakuan kepenulisan asli dan publikasi awal pada jurnal ini.</li>\n<li>Penulis diperkenankan melakukan pengarsipan mandiri (<em>Green Open Access / Self-Archiving</em>) atas versi <em>preprint</em>, <em>postprint</em> (<em>Accepted Manuscript</em>), maupun <em>Version of Record</em> (Galley PDF terbitan) pada repositori institusi atau repositori subjek tanpa embargo.</li>\n</ol>',NULL),(1,'en_US','description','<p><strong>Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences</strong> (<em>Hortus J.</em> | p-ISSN: 2988-7401 | e-ISSN: 2988-741X) adalah jurnal ilmiah berkala Akses Terbuka Berlian (<em>Diamond Open Access</em>) yang diterbitkan dua kali setahun (Juni dan Desember) oleh Departemen Agrosains dan UPT Perpustakaan Universitas Negeri Malang. Jurnal ini mempublikasikan artikel riset orisinal, reviu literatur kritis, dan studi kasus terapan pada bidang sains perkebunan tropika berkelanjutan, bioteknologi pemuliaan tanaman tahunan, proteksi hayati terpadu, <em>Smart &amp; Precision Plantation Farming</em> (IoT, UAV multispektral, AI), pengolahan biomassa &amp; bioekonomi sirkular, serta sertifikasi keberlanjutan agribisnis (ISPO/RSPO).</p>\n<p>Seluruh naskah yang masuk dievaluasi secara ketat dan objektif menggunakan mekanisme <strong>Penelaahan Sejawat Buta Ganda (<em>Double-Blind Peer Review</em>)</strong> oleh sekurang-kurangnya dua mitra bebestari (<em>reviewer</em>) independen dengan target waktu evaluasi <strong>2–4 minggu</strong>. Jurnal ini sepenuhnya bebas biaya pengajuan maupun pemrosesan artikel (<em>Zero APC / Free of Charge</em>) dan dilisensikan di bawah <a href=\"https://creativecommons.org/licenses/by/4.0/\" target=\"_blank\">Creative Commons Attribution 4.0 International License (CC BY 4.0)</a>.</p>',NULL),(1,'en_US','editorialTeam','<h4>Pemimpin Redaksi</h4>\n<ul>\n<li><strong>Lidya Amalia Rahmania, S.Kom, M.Kom</strong> – <em>Universitas Negeri Malang, Indonesia</em><br/>Bertanggung jawab atas kebijakan strategis ilmiah, pengawasan etika publikasi COPE, seleksi kelayakan awal, dan penetapan keputusan akhir penerbitan naskah.</li>\n</ul>\n\n<h4>Journal Manager &amp; Managing Editor</h4>\n<ul>\n<li><strong>Mohammad Yanuar Rizky</strong> (NIM 250911718423) – <em>Universitas Negeri Malang, Indonesia</em><br/>Mengoordinasi arsitektur sistem OJS, konfigurasi hak akses peran pengguna (<em>user roles</em>), verifikasi kemiripan Turnitin (&le;20%), pengawasan SLA alur kerja editorial, dan manajemen terbitan berkala.</li>\n</ul>\n\n<h4>Section Editors</h4>\n<ul>\n<li><strong>Nirmala Dwi Lestari</strong> (NIM 250911723861) – <em>Universitas Negeri Malang, Indonesia</em><br/>Mengelola penelaahan sejawat buta ganda (<em>Double-Blind Peer Review</em>) pada bagian subjek keilmuan, menugaskan mitra bebestari, dan memvalidasi perbaikan revisi naskah penulis.</li>\n</ul>\n\n<h4>Layout Editor, Copyeditor &amp; Production Team</h4>\n<ul>\n<li><strong>Nayla Syukurillah</strong> (NIM 250911721564) – <em>Universitas Negeri Malang, Indonesia</em><br/>Bertanggung jawab atas penyuntingan bahasa ilmiah dan gaya selingkung (<em>Copyediting</em>), tata letak pracetak artikel, serta produksi berkas tampilan akhir (<em>Galley PDF</em>).</li>\n</ul>',NULL),(1,'en_US','favicon','{\"name\":\"favicon.png\",\"uploadName\":\"favicon.png\",\"width\":64,\"height\":64,\"dateUploaded\":\"2026-11-05 06:15:17\",\"altText\":\"HJ Favicon\"}',NULL),(1,'en_US','homepageImage','{\"name\":\"homepageImage.png\",\"uploadName\":\"homepageImage.png\",\"width\":1280,\"height\":340,\"dateUploaded\":\"2026-11-05 06:15:17\",\"altText\":\"Hortus Journal Editorial Spread\"}',NULL),(1,'en_US','journalThumbnail','{\"name\":\"journalThumbnail.png\",\"uploadName\":\"journalThumbnail.png\",\"width\":300,\"height\":400,\"dateUploaded\":\"2026-11-05 06:15:17\",\"altText\":\"Hortus Journal Thumbnail\"}',NULL),(1,'en_US','librarianInformation','We encourage research librarians to list this journal among their library\'s electronic journal holdings. As well, it may be worth noting that this journal\'s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).',NULL),(1,'en_US','licenseTerms','<p>This work is licensed under a <a rel=\"license\" href=\"https://creativecommons.org/licenses/by/4.0/\" target=\"_blank\">Creative Commons Attribution 4.0 International License (CC BY 4.0)</a>.</p>',NULL),(1,'en_US','lockssLicense','This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href=\"http://www.lockss.org/\">More...</a>',NULL),(1,'en_US','name','Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences',NULL),(1,'en_US','openAccessPolicy','<p><strong>Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences</strong> menerapkan kebijakan <strong>Akses Terbuka Berlian (<em>Diamond Open Access</em>)</strong> berdasarkan prinsip bahwa menyediakan hasil riset ilmiah secara bebas kepada publik akan mengakselerasi pertukaran pengetahuan global dan inovasi agrosains berkelanjutan (Suber, 2012; Willinsky, 2006). Seluruh artikel yang diterbitkan dapat dibaca, diunduh, disalin, didistribusikan, dan digunakan secara gratis sejak hari pertama penerbitan tanpa masa embargo dan tanpa memungut biaya pemrosesan artikel (<strong>Zero APC / Rp 0,-</strong>) kepada penulis maupun pembaca.</p>',NULL),(1,'en_US','pageFooter','<div style=\"padding: 10px 0; font-size: 0.9em; line-height: 1.6;\">\n<strong>Hortus Journal: Journal of Sustainable Plantation and Agro-Industrial Sciences</strong> (p-ISSN: 2988-7401 | e-ISSN: 2988-741X)<br/>\nDiterbitkan oleh <strong>Departemen Agrosains &amp; UPT Perpustakaan Universitas Negeri Malang</strong>, Jl. Semarang No. 5, Malang 65145, Indonesia.<br/>\nKontak Redaksi: <a href=\"mailto:yanuar.rizky@hortus.ac.id\">yanuar.rizky@hortus.ac.id</a> | Terbitan Akses Terbuka Berlian (<em>Diamond Open Access</em>) di bawah lisensi <a href=\"https://creativecommons.org/licenses/by/4.0/\" target=\"_blank\">Creative Commons Attribution 4.0 International (CC BY 4.0)</a>.\n</div>',NULL),(1,'en_US','pageHeaderLogoImage','{\"name\":\"pageHeaderLogoImage.png\",\"uploadName\":\"pageHeaderLogoImage.png\",\"width\":560,\"height\":96,\"dateUploaded\":\"2026-11-05 06:15:17\",\"altText\":\"Hortus Journal Logo\"}',NULL),(1,'en_US','privacyStatement','<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>',NULL),(1,'en_US','readerInformation','We encourage readers to sign up for the publishing notification service for this journal. Use the <a href=\"http://localhost/ojs/index.php/Horsju/user/register\">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal\'s <a href=\"http://localhost/ojs/index.php/Horsju/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.',NULL),(1,'en_US','reviewGuidelines','<h3>Panduan &amp; Rubrik Evaluasi Mitra Bebestari (Reviewer Guidelines)</h3>\n<p>Mitra bebestari (<em>Reviewer</em>) memegang peran kunci dalam menjaga mutu ilmiah <strong>Hortus Journal</strong> melalui mekanisme <strong>Double-Blind Peer Review</strong>. Reviewer diharapkan mengevaluasi naskah secara objektif, konstruktif, tepat waktu (<strong>2–4 minggu</strong>), dan menjaga kerahasiaan dokumen naskah sesuai pedoman etika COPE.</p>\n<h4>Aspek Evaluasi pada Formulir Penilaian OJS (Structured Review Form):</h4>\n<ol>\n<li><strong>Kesesuaian Fokus &amp; Ruang Lingkup (Focus &amp; Scope Alignment):</strong> Relevansi topik naskah dengan bidang sains perkebunan tropika berkelanjutan dan agroindustri.</li>\n<li><strong>Orisinalitas &amp; Kebaruan Ilmiah (Originality &amp; Scientific Novelty):</strong> Kontribusi temuan baru atau inovasi teknologi dalam memecahkan masalah strategis perkebunan.</li>\n<li><strong>Ketepatan Metodologi &amp; Desain Eksperimen (Methodological Rigor):</strong> Kejelasan rancangan percobaan, validitas instrumen/sensor, kecukupan ukuran sampel, dan ketepatan uji statistik.</li>\n<li><strong>Kualitas Penyajian Hasil &amp; Ketajaman Pembahasan (Results &amp; Discussion Quality):</strong> Keakuratan interpretasi data, kualitas visualisasi tabel/gambar, serta kedalaman sintesis pembahasan.</li>\n<li><strong>Kepatuhan Struktur IMRAD, Gaya Selingkung &amp; Kemutakhiran Referensi (APA 7th Edition):</strong> Keterbacaan bahasa ilmiah, ketepatan struktur IMRAD, dan proporsi rujukan jurnal primer mutakhir (&ge;80% 10 tahun terakhir).</li>\n<li><strong>Catatan Konstruktif &amp; Rekomendasi Putusan Editorial:</strong> Uraian perbaikan mayor/minor bagi penulis serta rekomendasi putusan (<em>Accept Submission, Revisions Required, Resubmit for Review,</em> atau <em>Decline Submission</em>).</li>\n</ol>',NULL),(1,'en_US','submissionChecklist','[{\"order\":1,\"content\":\"Naskah merupakan karya ilmiah orisinal, bebas plagiarisme (skor kemiripan Turnitin\\/iThenticate ≤ 20%), belum pernah diterbitkan, dan tidak sedang dalam proses evaluasi pada jurnal\\/terbitan berkala lain.\"},{\"order\":2,\"content\":\"Berkas naskah utama telah dianonimkan (Blind Manuscript: tanpa nama penulis, afiliasi, dan identitas pada properti dokumen) untuk keperluan evaluasi Double-Blind Peer Review.\"},{\"order\":3,\"content\":\"Struktur naskah telah mengikuti format IMRAD (Introduction, Methods, Results, and Discussion) dalam format Microsoft Word (.docx) dengan panjang 4.000–7.500 kata, font Times New Roman 11 pt, spasi 1,15.\"},{\"order\":4,\"content\":\"Sitasi dan Daftar Rujukan telah disusun menggunakan gaya APA 7th Edition dengan manajer referensi (Mendeley\\/Zotero), memuat minimal 25 pustaka primer mutakhir disertai tautan URL DOI aktif.\"},{\"order\":5,\"content\":\"Penulis menyetujui pernyataan bebas konflik kepentingan (Competing Interests) serta lisensi publikasi terbuka Creative Commons Attribution 4.0 International (CC BY 4.0).\"}]',NULL);
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
INSERT INTO `metrics` VALUES ('usage_events_20260831.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20260831','202608',NULL,NULL,NULL,NULL,'ojs::counter',7),('usage_events_20260911.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20260911','202609',NULL,NULL,NULL,NULL,'ojs::counter',11),('usage_events_20260914.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20260914','202609',NULL,NULL,NULL,NULL,'ojs::counter',3);
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
INSERT INTO `notes` VALUES (1,1048586,1,5,'2026-10-14 10:25:00','2026-11-05 06:15:20','Hasil Initial Desk Screening & Uji Kemiripan Turnitin (Lolos 11%)','<p>Yth. Penulis Korespondensi (Nayla Syukurillah),<br/>Naskah Anda telah lolos <strong>Initial Desk Screening</strong> oleh Pemimpin Redaksi (Lidya Amalia Rahmania, S.Kom, M.Kom) dan Managing Editor (Mohammad Yanuar Rizky) dengan skor kemiripan Turnitin sebesar <strong>11%</strong> (di bawah ambang batas maksimal &le; 20%), mematuhi struktur IMRAD, dan berkas telah anonim (<em>Blind Manuscript</em>). Naskah dilanjutkan ke tahap <strong>Double-Blind Peer Review</strong> oleh Section Editor (Nirmala Dwi Lestari).</p>'),(2,1048586,2,6,'2026-10-27 09:35:00','2026-11-05 06:15:20','Keputusan Editorial Putaran 1: Revisions Required (Revisi Minor)','<p>Berdasarkan hasil evaluasi <em>Double-Blind Peer Review</em> dari dua Mitra Bebestari independen, naskah dinilai memiliki kebaruan ilmiah sangat baik namun memerlukan <strong>Revisi Minor (Revisions Required)</strong> terkait detail kalibrasi radiometrik UAV, uji ANOVA/Tukey HSD, dan analisis SHAP value pada bagian Pembahasan. Mohon unggah berkas revisi pada panel <em>Revisions</em>.</p>'),(3,1048586,2,8,'2026-10-29 15:45:00','2026-11-05 06:15:20','Re: Penyampaian Revisi Naskah & Tanggapan atas Masukan Reviewer','<p>Terima kasih kepada Editor dan Mitra Bebestari atas masukan yang sangat konstruktif. Kami telah merevisi naskah secara menyeluruh (menambahkan detail kalibrasi radiometrik DJI Mavic 3M, uji ANOVA/Tukey HSD &alpha; = 0,05, serta interpretasi SHAP value kanal Red Edge 42,6% dan VWC tanah 31,8%) dan mengunggah berkas <code>Naskah_Revisi_Author_Terverifikasi_Hortus_Journal.docx</code>.</p>'),(4,1048586,3,9,'2026-11-02 13:30:00','2026-11-05 06:15:20','Selesai Copyediting & Validasi Sitasi APA 7th Edition + DOI','<p>Layout Editor, Copyeditor &amp; Production Team (Nayla Syukurillah) telah menyelesaikan penyuntingan keterbacaan bahasa ilmiah, keseragaman satuan SI, serta validasi daftar rujukan APA 7th Edition. Berkas hasil penyuntingan akhir (<code>Naskah_Copyedited_Final_Terverifikasi_HJ.docx</code>) telah diunggah pada panel <em>Copyedited</em> dan telah disetujui Penulis.</p>'),(5,1048586,3,8,'2026-11-03 09:15:00','2026-11-05 06:15:20','Re: Persetujuan Hasil Copyediting oleh Penulis','<p>Kami telah memeriksa berkas hasil <em>Copyediting</em> dan menyetujui seluruh perbaikan redaksional untuk dilanjutkan ke tahap pembuatan Galley PDF (<em>Production</em>).</p>'),(6,1048586,4,9,'2026-11-04 11:15:00','2026-11-05 06:15:20','Unggah File Galley PDF Siap Publikasi (Galley_Final_HJ_Vol1_No1_2026.pdf)','<p>File tampilan akhir <strong>Galley PDF</strong> telah selesai ditata letak sesuai template resmi <em>Hortus Journal</em> (lengkap dengan header volume/nomor, halaman 1–12, lisensi CC BY 4.0, dan identitas DOI) serta diunggah pada panel <em>Galleys</em>. Naskah telah dijadwalkan terbit pada <strong>Vol. 1 No. 1 (2026)</strong>.</p>');
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
INSERT INTO `plugin_settings` VALUES ('academicfreethemeplugin',1,'article_tracking_date','false','string'),('academicfreethemeplugin',1,'baseColour','#AC2A00','string'),('academicfreethemeplugin',1,'bootstrapTheme','yeti','string'),('academicfreethemeplugin',1,'crossmark_button','false','string'),('academicfreethemeplugin',1,'dimension_badge','false','string'),('academicfreethemeplugin',1,'doi_on_index','false','string'),('academicfreethemeplugin',1,'enabled','1','bool'),('academicfreethemeplugin',1,'galley_link_on_index','false','string'),('academicfreethemeplugin',1,'headerTheme','blue','string'),('academicfreethemeplugin',1,'maintenance_mode','false','string'),('academicfreethemeplugin',1,'statistics','false','string'),('acronplugin',0,'crontab','[{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.generic.usageStats.UsageStatsLoader\",\"frequency\":{\"hour\":24},\"args\":[\"autoStage\"]},{\"className\":\"plugins.importexport.crossref.CrossrefInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.doaj.DOAJInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"plugins.importexport.datacite.DataciteInfoSender\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.ReviewReminder\",\"frequency\":{\"hour\":24},\"args\":[]},{\"className\":\"lib.pkp.classes.task.StatisticsReport\",\"frequency\":{\"day\":\"1\"},\"args\":[]},{\"className\":\"classes.tasks.SubscriptionExpiryReminder\",\"frequency\":{\"day\":\"1\"},\"args\":[]}]','object'),('acronplugin',0,'enabled','1','bool'),('defaultmanuscriptchildthemeplugin',1,'accentColour','#F7BC4A','string'),('defaultmanuscriptchildthemeplugin',1,'enabled','0','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#F7F5F0','string'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',1,'showDescriptionInJournalIndex','1','bool'),('defaultthemeplugin',1,'typography','notoSerif_notoSans','string'),('defaultthemeplugin',1,'useHomepageImageAsHeader','0','bool'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('dublincoremetaplugin',1,'enabled','1','bool'),('googlescholarplugin',1,'enabled','1','bool'),('healthsciencesthemeplugin',1,'baseColour','#10BECA','string'),('healthsciencesthemeplugin',1,'enabled','1','bool'),('htmlarticlegalleyplugin',1,'enabled','1','bool'),('immersionthemeplugin',1,'abstractsOnIssuePage','noAbstracts','string'),('immersionthemeplugin',1,'enabled','1','bool'),('immersionthemeplugin',1,'immersionAnnouncementsColor','#000','string'),('immersionthemeplugin',1,'journalDescription','1','string'),('immersionthemeplugin',1,'journalDescriptionColour','#000','string'),('informationblockplugin',1,'enabled','1','bool'),('informationblockplugin',1,'seq','7','int'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('lensgalleyplugin',1,'enabled','1','bool'),('makesubmissionblockplugin',1,'enabled','1','bool'),('makesubmissionblockplugin',1,'seq','1','int'),('pdfjsviewerplugin',1,'enabled','1','bool'),('resolverplugin',1,'enabled','1','bool'),('subscriptionblockplugin',1,'enabled','1','bool'),('subscriptionblockplugin',1,'seq','2','int'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','6a952d9b20ce3','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','[\"city\",\"region\"]','object'),('webfeedplugin',1,'displayItems','1','bool'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galleys`
--

LOCK TABLES `publication_galleys` WRITE;
/*!40000 ALTER TABLE `publication_galleys` DISABLE KEYS */;
INSERT INTO `publication_galleys` VALUES (1,'en_US',1,'PDF',7,1.00,NULL,1,'pdf');
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
INSERT INTO `publication_settings` VALUES (1,'','copyrightYear','2026'),(1,'','issueId','1'),(1,'','licenseUrl','https://creativecommons.org/licenses/by/4.0'),(1,'','pages','1-12'),(1,'','pub-id::publisher-id','hj-v1i1-01'),(1,'en_US','abstract','<p>Ketidakpastian iklim mikro dan heterogenitas nutrisi tanah gambut maupun mineral menjadi tantangan utama dalam menjaga stabilitas produksi Tandan Buah Segar (TBS) kelapa sawit (<em>Elaeis guineensis</em> Jacq.) di Indonesia. Penelitian ini bertujuan mengembangkan model estimasi produktivitas presisi berbasis integrasi jaringan sensor <em>Internet of Things</em> (IoT) iklim mikro kanopi dan citra multispektral <em>Unmanned Aerial Vehicle</em> (UAV). Eksperimen dilaksanakan pada blok kebun umur tanaman menghasilkan (TM-12) seluas 120 hektare selama dua musim panen. Indeks vegetasi <em>Normalized Difference Vegetation Index</em> (NDVI) dan <em>Normalized Difference Red Edge</em> (NDRE) diekstraksi dari wahana UAV dan dikombinasikan dengan parameter kelembapan tanah, suhu kanopi, serta radiasi aktif fotosintetik (PAR) menggunakan algoritma <em>Random Forest Regressor</em>. Evaluasi menggunakan <em>10-fold spatial cross-validation</em> membuktikan bahwa fusi fitur multispektral NDRE dan sensor IoT menghasilkan akurasi prediksi R<sup>2</sup> = 0,89 dan <em>Root Mean Square Error</em> (RMSE) = 1,42 ton/ha/tahun (<em>p</em> &lt; 0,001), mengungguli model satelit tunggal sebesar 18,4%. Kerangka kerja ini direkomendasikan bagi pengelola kebun dan pekebun swadaya dalam mengoptimalkan pemupukan presisi berorientasi keberlanjutan ISPO/RSPO.</p>'),(1,'en_US','copyrightHolder','Nayla Syukurillah, Mohammad Yanuar Rizky, Nirmala Dwi Lestari'),(1,'en_US','subtitle','Studi Eksperimental Pemodelan Spasial-Temporal Berorientasi Sertifikasi Keberlanjutan ISPO'),(1,'en_US','title','Integrasi Sensor IoT Kanopi dan Citra Multispektral UAV untuk Estimasi Presisi Produktivitas Kelapa Sawit (Elaeis guineensis Jacq.) Berkelanjutan');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,1,'2026-11-05',NULL,NULL,1,2,1.00,1,3,NULL,1);
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
INSERT INTO `query_participants` VALUES (1,5),(1,6),(1,8),(2,5),(2,6),(2,8),(3,6),(3,8),(3,9),(4,5),(4,8),(4,9);
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
INSERT INTO `review_assignments` VALUES (1,1,7,NULL,2,'2026-10-14 11:00:00','2026-10-14 11:05:00','2026-10-15 08:30:00','2026-10-25 14:20:00','2026-10-26 09:00:00','2026-11-04 23:59:59','2026-10-21 23:59:59','2026-10-26 09:00:00',0,0,0,NULL,NULL,NULL,5,1,3,2,1,4,1,0),(2,1,10,NULL,1,'2026-10-14 11:10:00','2026-10-14 11:12:00','2026-10-15 09:45:00','2026-10-26 16:10:00','2026-10-27 08:30:00','2026-11-04 23:59:59','2026-10-21 23:59:59','2026-10-27 08:30:00',0,0,0,NULL,NULL,NULL,5,1,3,2,1,4,1,0);
/*!40000 ALTER TABLE `review_assignments` ENABLE KEYS */;
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
INSERT INTO `scheduled_tasks` VALUES ('classes.tasks.SubscriptionExpiryReminder','2026-11-03 18:40:15'),('lib.pkp.classes.task.ReviewReminder','2026-11-05 05:23:55'),('lib.pkp.classes.task.StatisticsReport','2026-11-03 18:40:15'),('plugins.generic.usageStats.UsageStatsLoader','2026-11-05 05:23:54'),('plugins.importexport.crossref.CrossrefInfoSender','2026-11-05 05:23:54'),('plugins.importexport.datacite.DataciteInfoSender','2026-11-05 05:23:54'),('plugins.importexport.doaj.DOAJInfoSender','2026-11-05 05:23:54');
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
INSERT INTO `sessions` VALUES ('0t4ulf7dmgssno8vqean2bd012',1,'192.168.1.174','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36',1788162339,1788164100,1,'csrf|a:2:{s:9:\"timestamp\";i:1788164100;s:5:\"token\";s:32:\"212e05604891f05534148d9436f754c7\";}userId|i:1;username|s:5:\"admin\";','192.168.1.174'),('1vt5rjnms6l6u4j1jov3hfv4h2',NULL,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/155.0.0.0 Safari/537.36',1793855800,1793855808,0,'','localhost'),('3gpnvflk33l3nsus27oln0c1k1',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:154.0) Gecko/20100101 Firefox/154.0',1788161459,1788161459,0,'','localhost'),('52vdus58d9nsu14mhjeeru3l8q',NULL,'::1','curl/8.23.0',1793852634,1793852634,0,'csrf|a:2:{s:9:\"timestamp\";i:1793852634;s:5:\"token\";s:32:\"a72432addb8a5d951e27669aa6cc5071\";}','localhost'),('5rok9q89g26b6o301s3tjod3mh',1,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36',1789099263,1789350785,1,'csrf|a:2:{s:9:\"timestamp\";i:1789350785;s:5:\"token\";s:32:\"c98acf9ae13089dd9a6d68c188ae946e\";}userId|i:1;username|s:5:\"admin\";','localhost'),('8ni4oh5nr5hcr3k59hv2t0v8fc',NULL,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/155.0.0.0 Safari/537.36',1793856649,1793856657,0,'','localhost'),('asefocqbpaumhtm2fecceu9jae',NULL,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/155.0.0.0 Safari/537.36',1793855741,1793855749,0,'','localhost'),('c62o6k235mp595gnbq697o2bcs',NULL,'::1','curl/8.23.0',1793767221,1793767221,0,'','localhost'),('j18mj48jipkv276k7l2l2tgg45',3,'192.168.1.53','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36',1788163021,1788163082,0,'csrf|a:2:{s:9:\"timestamp\";i:1788163082;s:5:\"token\";s:32:\"dc60dca70b27b125be71900863ec1d4c\";}username|s:5:\"ilham\";userId|i:3;','192.168.1.174'),('kpng6gse8e4flgnsbjcspakoe1',NULL,'','',1793852934,1793852934,0,'','localhost'),('l7v65os99gsas0vq767nvcff1c',2,'192.168.1.54','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0',1788161907,1788164004,0,'csrf|a:2:{s:9:\"timestamp\";i:1788164004;s:5:\"token\";s:32:\"ba96399649e10ec844ec2d5103ead0c3\";}username|s:6:\"admin2\";userId|i:2;','192.168.1.174'),('mbnj3rqvurnvp1n681n3rpoi65',NULL,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36',1793727615,1793727615,0,'csrf|a:2:{s:9:\"timestamp\";i:1793727615;s:5:\"token\";s:32:\"45eb0553182eef074ae82bc2859e7175\";}','localhost'),('ptqdl5jhkm8a2n8c61dqffjt4h',NULL,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36',1793854000,1793858338,0,'csrf|a:2:{s:9:\"timestamp\";i:1793856594;s:5:\"token\";s:32:\"96bde1e9b2b2805deabfd0c40654036d\";}','localhost'),('rm8nvcuo6mm18lq89m4tjela92',NULL,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/155.0.0.0 Safari/537.36',1793856563,1793856572,0,'','localhost'),('vn6bjt5uqtkqg3vijrlcqvta9c',7,'::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/155.0.0.0 Safari/537.36',1793852894,1793854746,1,'csrf|a:2:{s:9:\"timestamp\";i:1793854746;s:5:\"token\";s:32:\"388a43092f274d3ab1b3da63d0902d04\";}username|s:11:\"reviewer_01\";userId|i:7;','localhost');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,2,4,'2026-11-05 06:15:20',0,1),(2,1,3,5,'2026-11-05 06:15:20',0,1),(3,1,5,6,'2026-11-05 06:15:20',0,1),(4,1,14,8,'2026-11-05 06:15:20',0,1),(5,1,11,9,'2026-11-05 06:15:20',0,0),(6,1,7,9,'2026-11-05 06:15:20',0,0);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
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
INSERT INTO `submission_file_settings` VALUES (1,'en_US','name','Naskah_Submisi_Awal_Anonim_Hortus_Journal.docx','string'),(2,'en_US','name','Naskah_Anonim_Evaluasi_DoubleBlind_Round1.docx','string'),(3,'en_US','name','Naskah_Revisi_Author_Terverifikasi_Hortus_Journal.docx','string'),(4,'en_US','name','Naskah_Diterima_Siap_Copyediting.docx','string'),(5,'en_US','name','Naskah_Copyedited_Final_Terverifikasi_HJ.docx','string'),(6,'en_US','name','Naskah_Master_Produksi_Galley_HJ.docx','string'),(7,'en_US','name','Galley_Final_HJ_Vol1_No1_2026.pdf','string');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,1,2,NULL,NULL,1,'2026-10-12 09:15:00','2026-10-12 09:15:00',8,NULL,NULL),(2,1,2,NULL,1,4,NULL,NULL,1,'2026-10-14 10:30:00','2026-10-14 10:30:00',5,523,1),(3,1,3,NULL,1,15,NULL,NULL,1,'2026-10-29 15:40:00','2026-10-29 15:40:00',8,523,1),(4,1,4,NULL,1,6,NULL,NULL,1,'2026-10-30 10:15:00','2026-10-30 10:15:00',6,NULL,NULL),(5,1,5,NULL,1,9,NULL,NULL,1,'2026-11-02 13:20:00','2026-11-02 13:20:00',9,NULL,NULL),(6,1,6,NULL,1,11,NULL,NULL,1,'2026-11-03 16:00:00','2026-11-03 16:00:00',9,NULL,NULL),(7,1,7,NULL,1,10,NULL,NULL,1,'2026-11-04 11:00:00','2026-11-04 11:00:00',9,521,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2026-11-05 06:15:20','2026-10-12 09:15:00','2026-11-05 06:15:20',5,'en_US',3,0,0);
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
INSERT INTO `user_interests` VALUES (7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(10,7),(10,8),(10,9),(10,10);
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
INSERT INTO `user_settings` VALUES (1,'en_US','affiliation',0,0,'Universitas Negeri Malang (NIM 250911718423)','string'),(1,'en_US','familyName',0,0,'Rizky','string'),(1,'en_US','givenName',0,0,'Mohammad Yanuar','string'),(4,'','orcid',0,0,'https://orcid.org/0000-0002-8423-0001','string'),(4,'en_US','affiliation',0,0,'Universitas Negeri Malang (NIM 250911718423)','string'),(4,'en_US','biography',0,0,'Journal Manager & Managing Editor Hortus Journal. Bertanggung jawab atas konfigurasi arsitektur OJS, manajemen hak akses peran pengguna (User Roles), dan pengawasan kualitas operasional penerbitan.','string'),(4,'en_US','familyName',0,0,'Rizky','string'),(4,'en_US','givenName',0,0,'Mohammad Yanuar','string'),(5,'','orcid',0,0,'https://orcid.org/0000-0002-1001-0001','string'),(5,'en_US','affiliation',0,0,'Universitas Negeri Malang','string'),(5,'en_US','biography',0,0,'Pemimpin Redaksi (Editor-in-Chief) Hortus Journal. Memimpin kebijakan ilmiah, seleksi kelayakan awal (Initial Screening), pengawasan etika publikasi COPE, dan penetapan keputusan akhir penerbitan naskah.','string'),(5,'en_US','familyName',0,0,'Rahmania, S.Kom, M.Kom','string'),(5,'en_US','givenName',0,0,'Lidya Amalia','string'),(6,'','orcid',0,0,'https://orcid.org/0000-0002-3861-0002','string'),(6,'en_US','affiliation',0,0,'Universitas Negeri Malang (NIM 250911723861)','string'),(6,'en_US','biography',0,0,'Section Editor Hortus Journal. Mengelola penugasan mitra bebestari (Double-Blind Peer Review) dan memvalidasi alur revisi naskah.','string'),(6,'en_US','familyName',0,0,'Lestari','string'),(6,'en_US','givenName',0,0,'Nirmala Dwi','string'),(7,'','orcid',0,0,'https://orcid.org/0000-0002-8423-0001','string'),(7,'en_US','affiliation',0,0,'Universitas Negeri Malang','string'),(7,'en_US','biography',0,0,'Akun simulasi Mitra Bebestari (Reviewer) pada proses evaluasi Double-Blind Peer Review di Hortus Journal.','string'),(7,'en_US','familyName',0,0,'Rizky','string'),(7,'en_US','givenName',0,0,'Mohammad Yanuar','string'),(8,'','orcid',0,0,'https://orcid.org/0000-0002-1564-0003','string'),(8,'en_US','affiliation',0,0,'Universitas Negeri Malang (NIM 250911721564)','string'),(8,'en_US','biography',0,0,'Akun simulasi Penulis (Author) untuk pengujian pengajuan naskah dan alur kerja penerbitan di Hortus Journal.','string'),(8,'en_US','familyName',0,0,'Syukurillah','string'),(8,'en_US','givenName',0,0,'Nayla','string'),(9,'','orcid',0,0,'https://orcid.org/0000-0002-1564-0003','string'),(9,'en_US','affiliation',0,0,'Universitas Negeri Malang (NIM 250911721564)','string'),(9,'en_US','biography',0,0,'Layout Editor, Copyeditor & Production Team Hortus Journal. Bertanggung jawab atas penyuntingan gaya selingkung (Copyediting), tata letak Galley PDF, dan kesiapan pracetak terbitan.','string'),(9,'en_US','familyName',0,0,'Syukurillah','string'),(9,'en_US','givenName',0,0,'Nayla','string'),(10,'','orcid',0,0,'https://orcid.org/0000-0002-3861-0002','string'),(10,'en_US','affiliation',0,0,'Universitas Negeri Malang','string'),(10,'en_US','biography',0,0,'Akun simulasi Mitra Bebestari (Reviewer) kedua pada proses evaluasi Double-Blind Peer Review di Hortus Journal.','string'),(10,'en_US','familyName',0,0,'Lestari','string'),(10,'en_US','givenName',0,0,'Nirmala Dwi','string');
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
INSERT INTO `user_user_groups` VALUES (1,1),(2,1),(2,4),(2,5),(3,4),(3,5),(4,9),(5,6),(7,9),(11,9),(13,9),(14,8),(16,7),(16,10);
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$YJ4D3oMHQ0xuCtD5DlARw.qpcXMOicpXkueQseft.fbt4Jbefimje','yansmurf7@gmail.com',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2026-08-31 08:59:39',NULL,'2026-09-11 06:01:12',0,NULL,NULL,0,NULL,1),(4,'Admin_jurnal','$2y$10$3X7v25Kz0/7A0fJG/B6XbeW78/5JSWMUPG2/Ybv9trXaNrCuDwUsq','yanuar.rizky@hortus.ac.id',NULL,'+62-812-3456-8423',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:36:33',0,NULL,NULL,0,NULL,1),(5,'editor_utama','$2y$10$6ZovLMeJXe1uXHzLWv1QVOqLQFJ8o0tAL749KHo6v6T.mBNO/5sHC','lidya.rahmania@hortus.ac.id',NULL,'+62-341-551312',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:58:34',0,NULL,NULL,0,NULL,1),(6,'editor_subjek','$2y$10$YkXRWDJex58W9NBGJuGd6.zwjNJ6gYKJiZ3.Ez.wivKxgmCc9OnA.','nirmala.lestari@hortus.ac.id',NULL,'+62-812-3456-3861',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:36:33',0,NULL,NULL,0,NULL,1),(7,'reviewer_01','$2y$10$PGYthrTKuh62om8zzgj6nO3jR2KtCYYmK9Rf/fS6czD4.bJEI1812','reviewer1@hortus.ac.id',NULL,'+62-812-3456-8424',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:59:04',0,NULL,NULL,0,NULL,1),(8,'author_test','$2y$10$1pyEvE8DmrTEgYQikZ3g..2HgAAMz4tOCkJXyAl0TBebCzX0xeNpi','nayla.syukurillah@hortus.ac.id',NULL,'+62-812-3456-1565',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:36:34',0,NULL,NULL,0,NULL,1),(9,'layout_edit','$2y$10$9thl3uGbe1O0wP3QWB1VBubGjOxuI2guKt3Ah3pBRiSG1J6T3m9pe','nayla.layout@hortus.ac.id',NULL,'+62-812-3456-1564',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:36:34',0,NULL,NULL,0,NULL,1),(10,'reviewer_02','$2y$10$5I/ZDoDnLXLwOYs2JiIBzuubAJmoH8o4DHq2xpD2.HxGJyXSffQJe','reviewer2@hortus.ac.id',NULL,'+62-812-3456-3862',NULL,NULL,'ID','',NULL,NULL,'2026-11-05 05:36:33','2026-11-05 06:15:17','2026-11-05 05:36:34',0,NULL,NULL,0,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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

-- Dump completed on 2026-11-05 13:07:48
