-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: iblis
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adhoc_configs`
--

DROP TABLE IF EXISTS `adhoc_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adhoc_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `option` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adhoc_configs`
--

LOCK TABLES `adhoc_configs` WRITE;
/*!40000 ALTER TABLE `adhoc_configs` DISABLE KEYS */;
INSERT INTO `adhoc_configs` VALUES (1,'Report',1),(2,'ULIN',1),(3,'Clinician_UI',2);
/*!40000 ALTER TABLE `adhoc_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytic_specimen_rejection_reasons`
--

DROP TABLE IF EXISTS `analytic_specimen_rejection_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytic_specimen_rejection_reasons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `specimen_id` int(10) unsigned NOT NULL,
  `rejection_id` int(10) unsigned NOT NULL,
  `reason_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `analytic_specimen_rejection_reasons_specimen_id_foreign` (`specimen_id`),
  KEY `analytic_specimen_rejection_reasons_rejection_id_foreign` (`rejection_id`),
  KEY `analytic_specimen_rejection_reasons_reason_id_foreign` (`reason_id`),
  CONSTRAINT `analytic_specimen_rejection_reasons_reason_id_foreign` FOREIGN KEY (`reason_id`) REFERENCES `rejection_reasons` (`id`),
  CONSTRAINT `analytic_specimen_rejection_reasons_rejection_id_foreign` FOREIGN KEY (`rejection_id`) REFERENCES `analytic_specimen_rejections` (`id`),
  CONSTRAINT `analytic_specimen_rejection_reasons_specimen_id_foreign` FOREIGN KEY (`specimen_id`) REFERENCES `analytic_specimen_rejections` (`specimen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytic_specimen_rejection_reasons`
--

LOCK TABLES `analytic_specimen_rejection_reasons` WRITE;
/*!40000 ALTER TABLE `analytic_specimen_rejection_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytic_specimen_rejection_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytic_specimen_rejections`
--

DROP TABLE IF EXISTS `analytic_specimen_rejections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytic_specimen_rejections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_id` int(10) unsigned NOT NULL,
  `specimen_id` int(10) unsigned NOT NULL,
  `rejected_by` int(10) unsigned NOT NULL,
  `rejection_reason_id` int(10) unsigned DEFAULT NULL,
  `reject_explained_to` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_rejected` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `analytic_specimen_rejections_rejected_by_index` (`rejected_by`),
  KEY `analytic_specimen_rejections_test_id_foreign` (`test_id`),
  KEY `analytic_specimen_rejections_specimen_id_foreign` (`specimen_id`),
  KEY `analytic_specimen_rejections_rejection_reason_id_foreign` (`rejection_reason_id`),
  CONSTRAINT `analytic_specimen_rejections_rejection_reason_id_foreign` FOREIGN KEY (`rejection_reason_id`) REFERENCES `rejection_reasons` (`id`),
  CONSTRAINT `analytic_specimen_rejections_specimen_id_foreign` FOREIGN KEY (`specimen_id`) REFERENCES `specimens` (`id`),
  CONSTRAINT `analytic_specimen_rejections_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `unhls_tests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytic_specimen_rejections`
--

LOCK TABLES `analytic_specimen_rejections` WRITE;
/*!40000 ALTER TABLE `analytic_specimen_rejections` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytic_specimen_rejections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assigned_roles`
--

DROP TABLE IF EXISTS `assigned_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assigned_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assigned_roles_user_id_foreign` (`user_id`),
  KEY `assigned_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `assigned_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `assigned_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned_roles`
--

LOCK TABLES `assigned_roles` WRITE;
/*!40000 ALTER TABLE `assigned_roles` DISABLE KEYS */;
INSERT INTO `assigned_roles` VALUES (1,1,1);
/*!40000 ALTER TABLE `assigned_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barcode_settings`
--

DROP TABLE IF EXISTS `barcode_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barcode_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `encoding_format` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `barcode_width` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `barcode_height` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `text_size` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcode_settings`
--

LOCK TABLES `barcode_settings` WRITE;
/*!40000 ALTER TABLE `barcode_settings` DISABLE KEYS */;
INSERT INTO `barcode_settings` VALUES (1,'code39','2','30','11',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01');
/*!40000 ALTER TABLE `barcode_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodities`
--

DROP TABLE IF EXISTS `commodities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commodities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `metric_id` int(10) unsigned NOT NULL,
  `unit_price` decimal(8,2) NOT NULL,
  `item_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `storage_req` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `min_level` int(11) NOT NULL,
  `max_level` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `commodities_metric_id_foreign` (`metric_id`),
  CONSTRAINT `commodities_metric_id_foreign` FOREIGN KEY (`metric_id`) REFERENCES `metrics` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodities`
--

LOCK TABLES `commodities` WRITE;
/*!40000 ALTER TABLE `commodities` DISABLE KEYS */;
/*!40000 ALTER TABLE `commodities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_measure_ranges`
--

DROP TABLE IF EXISTS `control_measure_ranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `control_measure_ranges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upper_range` decimal(6,2) DEFAULT NULL,
  `lower_range` decimal(6,2) DEFAULT NULL,
  `alphanumeric` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `control_measure_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `control_measure_ranges_control_measure_id_foreign` (`control_measure_id`),
  CONSTRAINT `control_measure_ranges_control_measure_id_foreign` FOREIGN KEY (`control_measure_id`) REFERENCES `control_measures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_measure_ranges`
--

LOCK TABLES `control_measure_ranges` WRITE;
/*!40000 ALTER TABLE `control_measure_ranges` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_measure_ranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_measures`
--

DROP TABLE IF EXISTS `control_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `control_measures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `control_id` int(10) unsigned NOT NULL,
  `control_measure_type_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `control_measures_control_measure_type_id_foreign` (`control_measure_type_id`),
  KEY `control_measures_control_id_foreign` (`control_id`),
  CONSTRAINT `control_measures_control_id_foreign` FOREIGN KEY (`control_id`) REFERENCES `controls` (`id`),
  CONSTRAINT `control_measures_control_measure_type_id_foreign` FOREIGN KEY (`control_measure_type_id`) REFERENCES `measure_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_measures`
--

LOCK TABLES `control_measures` WRITE;
/*!40000 ALTER TABLE `control_measures` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_results`
--

DROP TABLE IF EXISTS `control_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `control_results` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `results` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `control_measure_id` int(10) unsigned NOT NULL,
  `control_test_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `control_results_control_test_id_foreign` (`control_test_id`),
  KEY `control_results_control_measure_id_foreign` (`control_measure_id`),
  CONSTRAINT `control_results_control_measure_id_foreign` FOREIGN KEY (`control_measure_id`) REFERENCES `control_measures` (`id`),
  CONSTRAINT `control_results_control_test_id_foreign` FOREIGN KEY (`control_test_id`) REFERENCES `control_tests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_results`
--

LOCK TABLES `control_results` WRITE;
/*!40000 ALTER TABLE `control_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_tests`
--

DROP TABLE IF EXISTS `control_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `control_tests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entered_by` int(10) unsigned NOT NULL,
  `control_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `control_tests_control_id_foreign` (`control_id`),
  KEY `control_tests_entered_by_foreign` (`entered_by`),
  CONSTRAINT `control_tests_control_id_foreign` FOREIGN KEY (`control_id`) REFERENCES `controls` (`id`),
  CONSTRAINT `control_tests_entered_by_foreign` FOREIGN KEY (`entered_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_tests`
--

LOCK TABLES `control_tests` WRITE;
/*!40000 ALTER TABLE `control_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controls`
--

DROP TABLE IF EXISTS `controls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lot_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `controls_name_unique` (`name`),
  KEY `controls_lot_id_foreign` (`lot_id`),
  CONSTRAINT `controls_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controls`
--

LOCK TABLES `controls` WRITE;
/*!40000 ALTER TABLE `controls` DISABLE KEYS */;
/*!40000 ALTER TABLE `controls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `culture_durations`
--

DROP TABLE IF EXISTS `culture_durations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `culture_durations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `duration` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `culture_durations`
--

LOCK TABLES `culture_durations` WRITE;
/*!40000 ALTER TABLE `culture_durations` DISABLE KEYS */;
/*!40000 ALTER TABLE `culture_durations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `culture_observations`
--

DROP TABLE IF EXISTS `culture_observations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `culture_observations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `test_id` int(10) unsigned NOT NULL,
  `observation` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `culture_observations_user_id_foreign` (`user_id`),
  KEY `culture_observations_test_id_foreign` (`test_id`),
  CONSTRAINT `culture_observations_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `unhls_tests` (`id`),
  CONSTRAINT `culture_observations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `culture_observations`
--

LOCK TABLES `culture_observations` WRITE;
/*!40000 ALTER TABLE `culture_observations` DISABLE KEYS */;
/*!40000 ALTER TABLE `culture_observations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_alphanumeric_counts`
--

DROP TABLE IF EXISTS `daily_alphanumeric_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_alphanumeric_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_test_type_count_id` int(10) unsigned NOT NULL,
  `measure_id` int(10) unsigned NOT NULL,
  `measure_range_id` int(10) unsigned NOT NULL,
  `result_interpretation_id` int(10) unsigned DEFAULT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `daily_alphanumeric_counts_daily_test_type_count_id_foreign` (`daily_test_type_count_id`),
  KEY `daily_alphanumeric_counts_measure_id_foreign` (`measure_id`),
  KEY `daily_alphanumeric_counts_measure_range_id_foreign` (`measure_range_id`),
  KEY `daily_alphanumeric_counts_result_interpretation_id_foreign` (`result_interpretation_id`),
  CONSTRAINT `daily_alphanumeric_counts_daily_test_type_count_id_foreign` FOREIGN KEY (`daily_test_type_count_id`) REFERENCES `daily_test_type_counts` (`id`),
  CONSTRAINT `daily_alphanumeric_counts_measure_id_foreign` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`),
  CONSTRAINT `daily_alphanumeric_counts_measure_range_id_foreign` FOREIGN KEY (`measure_range_id`) REFERENCES `measure_ranges` (`id`),
  CONSTRAINT `daily_alphanumeric_counts_result_interpretation_id_foreign` FOREIGN KEY (`result_interpretation_id`) REFERENCES `result_interpretations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_alphanumeric_counts`
--

LOCK TABLES `daily_alphanumeric_counts` WRITE;
/*!40000 ALTER TABLE `daily_alphanumeric_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_alphanumeric_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_gram_stain_result_counts`
--

DROP TABLE IF EXISTS `daily_gram_stain_result_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_gram_stain_result_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_test_type_count_id` int(10) unsigned NOT NULL,
  `gram_stain_range_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `daily_gram_stain_result_counts_daily_test_type_count_id_foreign` (`daily_test_type_count_id`),
  CONSTRAINT `daily_gram_stain_result_counts_daily_test_type_count_id_foreign` FOREIGN KEY (`daily_test_type_count_id`) REFERENCES `daily_test_type_counts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_gram_stain_result_counts`
--

LOCK TABLES `daily_gram_stain_result_counts` WRITE;
/*!40000 ALTER TABLE `daily_gram_stain_result_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_gram_stain_result_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_hiv_counts`
--

DROP TABLE IF EXISTS `daily_hiv_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_hiv_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_test_type_count_id` int(10) unsigned NOT NULL,
  `purpose` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count` int(10) unsigned NOT NULL,
  `measure_id` int(10) unsigned DEFAULT NULL,
  `measure_range_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `daily_hiv_counts_daily_test_type_count_id_foreign` (`daily_test_type_count_id`),
  CONSTRAINT `daily_hiv_counts_daily_test_type_count_id_foreign` FOREIGN KEY (`daily_test_type_count_id`) REFERENCES `daily_test_type_counts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_hiv_counts`
--

LOCK TABLES `daily_hiv_counts` WRITE;
/*!40000 ALTER TABLE `daily_hiv_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_hiv_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_negative_cultures`
--

DROP TABLE IF EXISTS `daily_negative_cultures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_negative_cultures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `organism_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_negative_cultures`
--

LOCK TABLES `daily_negative_cultures` WRITE;
/*!40000 ALTER TABLE `daily_negative_cultures` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_negative_cultures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_negative_gram_stains`
--

DROP TABLE IF EXISTS `daily_negative_gram_stains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_negative_gram_stains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gram_stain_range_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_negative_gram_stains`
--

LOCK TABLES `daily_negative_gram_stains` WRITE;
/*!40000 ALTER TABLE `daily_negative_gram_stains` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_negative_gram_stains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_numeric_range_counts`
--

DROP TABLE IF EXISTS `daily_numeric_range_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_numeric_range_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_test_type_count_id` int(10) unsigned NOT NULL,
  `measure_id` int(10) unsigned NOT NULL,
  `result` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `result_interpretation_id` int(10) unsigned DEFAULT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `daily_numeric_range_counts_daily_test_type_count_id_foreign` (`daily_test_type_count_id`),
  KEY `daily_numeric_range_counts_measure_id_foreign` (`measure_id`),
  KEY `daily_numeric_range_counts_result_interpretation_id_foreign` (`result_interpretation_id`),
  CONSTRAINT `daily_numeric_range_counts_daily_test_type_count_id_foreign` FOREIGN KEY (`daily_test_type_count_id`) REFERENCES `daily_test_type_counts` (`id`),
  CONSTRAINT `daily_numeric_range_counts_measure_id_foreign` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`),
  CONSTRAINT `daily_numeric_range_counts_result_interpretation_id_foreign` FOREIGN KEY (`result_interpretation_id`) REFERENCES `result_interpretations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_numeric_range_counts`
--

LOCK TABLES `daily_numeric_range_counts` WRITE;
/*!40000 ALTER TABLE `daily_numeric_range_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_numeric_range_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_organism_counts`
--

DROP TABLE IF EXISTS `daily_organism_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_organism_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_test_type_count_id` int(10) unsigned NOT NULL,
  `organism_id` int(10) unsigned NOT NULL,
  `result_interpretation_id` int(10) unsigned DEFAULT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `daily_organism_counts_organism_id_foreign` (`organism_id`),
  KEY `daily_organism_counts_result_interpretation_id_foreign` (`result_interpretation_id`),
  CONSTRAINT `daily_organism_counts_organism_id_foreign` FOREIGN KEY (`organism_id`) REFERENCES `organisms` (`id`),
  CONSTRAINT `daily_organism_counts_result_interpretation_id_foreign` FOREIGN KEY (`result_interpretation_id`) REFERENCES `result_interpretations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_organism_counts`
--

LOCK TABLES `daily_organism_counts` WRITE;
/*!40000 ALTER TABLE `daily_organism_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_organism_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_rejection_reason_counts`
--

DROP TABLE IF EXISTS `daily_rejection_reason_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_rejection_reason_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_specimen_count_id` int(10) unsigned NOT NULL,
  `reason_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `daily_rejection_reason_counts_daily_specimen_count_id_foreign` (`daily_specimen_count_id`),
  KEY `daily_rejection_reason_counts_reason_id_foreign` (`reason_id`),
  CONSTRAINT `daily_rejection_reason_counts_daily_specimen_count_id_foreign` FOREIGN KEY (`daily_specimen_count_id`) REFERENCES `daily_specimen_counts` (`id`),
  CONSTRAINT `daily_rejection_reason_counts_reason_id_foreign` FOREIGN KEY (`reason_id`) REFERENCES `rejection_reasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_rejection_reason_counts`
--

LOCK TABLES `daily_rejection_reason_counts` WRITE;
/*!40000 ALTER TABLE `daily_rejection_reason_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_rejection_reason_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_specimen_counts`
--

DROP TABLE IF EXISTS `daily_specimen_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_specimen_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `all` int(10) unsigned NOT NULL,
  `accepted` int(10) unsigned NOT NULL,
  `rejected` int(10) unsigned NOT NULL,
  `referred_in` int(10) unsigned DEFAULT NULL,
  `referred_out` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `daily_specimen_counts_date_unique` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_specimen_counts`
--

LOCK TABLES `daily_specimen_counts` WRITE;
/*!40000 ALTER TABLE `daily_specimen_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_specimen_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_specimen_type_counts`
--

DROP TABLE IF EXISTS `daily_specimen_type_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_specimen_type_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_specimen_count_id` int(10) unsigned NOT NULL,
  `specimen_type_id` int(10) unsigned NOT NULL,
  `all` int(10) unsigned NOT NULL,
  `accepted` int(10) unsigned NOT NULL,
  `rejected` int(10) unsigned NOT NULL,
  `referred_in` int(10) unsigned NOT NULL,
  `referred_out` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `daily_specimen_type_counts_daily_specimen_count_id_foreign` (`daily_specimen_count_id`),
  KEY `daily_specimen_type_counts_specimen_type_id_foreign` (`specimen_type_id`),
  CONSTRAINT `daily_specimen_type_counts_daily_specimen_count_id_foreign` FOREIGN KEY (`daily_specimen_count_id`) REFERENCES `daily_specimen_counts` (`id`),
  CONSTRAINT `daily_specimen_type_counts_specimen_type_id_foreign` FOREIGN KEY (`specimen_type_id`) REFERENCES `specimen_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_specimen_type_counts`
--

LOCK TABLES `daily_specimen_type_counts` WRITE;
/*!40000 ALTER TABLE `daily_specimen_type_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_specimen_type_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_susceptibility_counts`
--

DROP TABLE IF EXISTS `daily_susceptibility_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_susceptibility_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_organism_count_id` int(10) unsigned NOT NULL,
  `antibiotic_id` int(10) unsigned NOT NULL,
  `interpretation_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `daily_susceptibility_counts_daily_organism_count_id_foreign` (`daily_organism_count_id`),
  KEY `daily_susceptibility_counts_antibiotic_id_foreign` (`antibiotic_id`),
  KEY `daily_susceptibility_counts_interpretation_id_foreign` (`interpretation_id`),
  CONSTRAINT `daily_susceptibility_counts_antibiotic_id_foreign` FOREIGN KEY (`antibiotic_id`) REFERENCES `drugs` (`id`),
  CONSTRAINT `daily_susceptibility_counts_daily_organism_count_id_foreign` FOREIGN KEY (`daily_organism_count_id`) REFERENCES `daily_organism_counts` (`id`),
  CONSTRAINT `daily_susceptibility_counts_interpretation_id_foreign` FOREIGN KEY (`interpretation_id`) REFERENCES `drug_susceptibility_measures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_susceptibility_counts`
--

LOCK TABLES `daily_susceptibility_counts` WRITE;
/*!40000 ALTER TABLE `daily_susceptibility_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_susceptibility_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_test_counts`
--

DROP TABLE IF EXISTS `daily_test_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_test_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `all` int(10) unsigned NOT NULL,
  `referred_in` int(10) unsigned NOT NULL,
  `referred_out` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `daily_test_counts_date_unique` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_test_counts`
--

LOCK TABLES `daily_test_counts` WRITE;
/*!40000 ALTER TABLE `daily_test_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_test_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_test_type_counts`
--

DROP TABLE IF EXISTS `daily_test_type_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_test_type_counts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_test_count_id` int(10) unsigned NOT NULL,
  `test_type_id` int(10) unsigned NOT NULL,
  `age_upper_limit` int(10) unsigned NOT NULL,
  `age_lower_limit` int(10) unsigned NOT NULL,
  `gender` int(10) unsigned NOT NULL,
  `all` int(10) unsigned NOT NULL,
  `referred_in` int(10) unsigned NOT NULL,
  `referred_out` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `daily_test_type_counts_test_type_id_foreign` (`test_type_id`),
  KEY `daily_test_type_counts_daily_test_count_id_foreign` (`daily_test_count_id`),
  CONSTRAINT `daily_test_type_counts_daily_test_count_id_foreign` FOREIGN KEY (`daily_test_count_id`) REFERENCES `daily_test_counts` (`id`),
  CONSTRAINT `daily_test_type_counts_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_test_type_counts`
--

LOCK TABLES `daily_test_type_counts` WRITE;
/*!40000 ALTER TABLE `daily_test_type_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_test_type_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_turn_around_time`
--

DROP TABLE IF EXISTS `daily_turn_around_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_turn_around_time` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_test_type_count_id` int(10) unsigned NOT NULL,
  `avg_reception_tostart` int(10) unsigned NOT NULL,
  `avg_start_tocompletion` int(10) unsigned NOT NULL,
  `avg_reception_tocompletion` int(10) unsigned NOT NULL,
  `avg_start_tovarification` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `daily_turn_around_time_daily_test_type_count_id_foreign` (`daily_test_type_count_id`),
  CONSTRAINT `daily_turn_around_time_daily_test_type_count_id_foreign` FOREIGN KEY (`daily_test_type_count_id`) REFERENCES `daily_test_type_counts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_turn_around_time`
--

LOCK TABLES `daily_turn_around_time` WRITE;
/*!40000 ALTER TABLE `daily_turn_around_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_turn_around_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseases`
--

DROP TABLE IF EXISTS `diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diseases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseases`
--

LOCK TABLES `diseases` WRITE;
/*!40000 ALTER TABLE `diseases` DISABLE KEYS */;
/*!40000 ALTER TABLE `diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_susceptibility`
--

DROP TABLE IF EXISTS `drug_susceptibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_susceptibility` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `drug_id` int(10) unsigned NOT NULL,
  `isolated_organism_id` int(10) unsigned NOT NULL,
  `drug_susceptibility_measure_id` int(10) unsigned NOT NULL,
  `zone_diameter` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `drug_susceptibility_user_id_foreign` (`user_id`),
  KEY `drug_susceptibility_drug_id_foreign` (`drug_id`),
  KEY `drug_susceptibility_isolated_organism_id_foreign` (`isolated_organism_id`),
  KEY `drug_susceptibility_drug_susceptibility_measure_id_foreign` (`drug_susceptibility_measure_id`),
  CONSTRAINT `drug_susceptibility_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`),
  CONSTRAINT `drug_susceptibility_drug_susceptibility_measure_id_foreign` FOREIGN KEY (`drug_susceptibility_measure_id`) REFERENCES `drug_susceptibility_measures` (`id`),
  CONSTRAINT `drug_susceptibility_isolated_organism_id_foreign` FOREIGN KEY (`isolated_organism_id`) REFERENCES `isolated_organisms` (`id`),
  CONSTRAINT `drug_susceptibility_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_susceptibility`
--

LOCK TABLES `drug_susceptibility` WRITE;
/*!40000 ALTER TABLE `drug_susceptibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug_susceptibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_susceptibility_measures`
--

DROP TABLE IF EXISTS `drug_susceptibility_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_susceptibility_measures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `symbol` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `interpretation` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_susceptibility_measures`
--

LOCK TABLES `drug_susceptibility_measures` WRITE;
/*!40000 ALTER TABLE `drug_susceptibility_measures` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug_susceptibility_measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugs`
--

DROP TABLE IF EXISTS `drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drugs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `drugs_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drugs`
--

LOCK TABLES `drugs` WRITE;
/*!40000 ALTER TABLE `drugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equip_config`
--

DROP TABLE IF EXISTS `equip_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equip_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `equip_id` int(10) unsigned NOT NULL,
  `prop_id` int(10) unsigned NOT NULL,
  `prop_value` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `equip_config_equip_id_foreign` (`equip_id`),
  KEY `equip_config_prop_id_foreign` (`prop_id`),
  CONSTRAINT `equip_config_equip_id_foreign` FOREIGN KEY (`equip_id`) REFERENCES `interfaced_equipment` (`id`),
  CONSTRAINT `equip_config_prop_id_foreign` FOREIGN KEY (`prop_id`) REFERENCES `ii_quickcodes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equip_config`
--

LOCK TABLES `equip_config` WRITE;
/*!40000 ALTER TABLE `equip_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `equip_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_dump`
--

DROP TABLE IF EXISTS `external_dump`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_dump` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lab_no` int(11) NOT NULL,
  `parent_lab_no` int(11) NOT NULL,
  `test_id` int(11) DEFAULT NULL,
  `requesting_clinician` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `investigation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provisional_diagnosis` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_date` timestamp NULL DEFAULT NULL,
  `order_stage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result` text COLLATE utf8_unicode_ci,
  `result_returned` int(11) DEFAULT NULL,
  `patient_visit_number` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dob` datetime DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receipt_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receipt_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `waiver_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `system_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_dump_lab_no_unique` (`lab_no`),
  KEY `external_dump_parent_lab_no_index` (`parent_lab_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_dump`
--

LOCK TABLES `external_dump` WRITE;
/*!40000 ALTER TABLE `external_dump` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_dump` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_users`
--

DROP TABLE IF EXISTS `external_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `internal_user_id` int(10) unsigned NOT NULL,
  `external_user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_users_internal_user_id_unique` (`internal_user_id`),
  CONSTRAINT `external_users_internal_user_id_foreign` FOREIGN KEY (`internal_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_users`
--

LOCK TABLES `external_users` WRITE;
/*!40000 ALTER TABLE `external_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facilities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gram_break_points`
--

DROP TABLE IF EXISTS `gram_break_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gram_break_points` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `drug_id` int(10) unsigned NOT NULL,
  `gram_stain_range_id` int(10) unsigned NOT NULL,
  `resistant_max` decimal(4,1) DEFAULT NULL,
  `intermediate_min` decimal(4,1) DEFAULT NULL,
  `intermediate_max` decimal(4,1) DEFAULT NULL,
  `sensitive_min` decimal(4,1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gram_break_points_drug_id_foreign` (`drug_id`),
  KEY `gram_break_points_gram_stain_range_id_foreign` (`gram_stain_range_id`),
  CONSTRAINT `gram_break_points_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`),
  CONSTRAINT `gram_break_points_gram_stain_range_id_foreign` FOREIGN KEY (`gram_stain_range_id`) REFERENCES `gram_stain_ranges` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gram_break_points`
--

LOCK TABLES `gram_break_points` WRITE;
/*!40000 ALTER TABLE `gram_break_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `gram_break_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gram_drug_susceptibility`
--

DROP TABLE IF EXISTS `gram_drug_susceptibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gram_drug_susceptibility` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `drug_id` int(10) unsigned NOT NULL,
  `gram_stain_result_id` int(10) unsigned NOT NULL,
  `drug_susceptibility_measure_id` int(10) unsigned NOT NULL,
  `zone_diameter` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `gram_drug_susceptibility_user_id_foreign` (`user_id`),
  KEY `gram_drug_susceptibility_drug_id_foreign` (`drug_id`),
  KEY `gram_drug_susceptibility_gram_stain_result_id_foreign` (`gram_stain_result_id`),
  KEY `gram_drug_susceptibility_drug_susceptibility_measure_id_foreign` (`drug_susceptibility_measure_id`),
  CONSTRAINT `gram_drug_susceptibility_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`),
  CONSTRAINT `gram_drug_susceptibility_drug_susceptibility_measure_id_foreign` FOREIGN KEY (`drug_susceptibility_measure_id`) REFERENCES `drug_susceptibility_measures` (`id`),
  CONSTRAINT `gram_drug_susceptibility_gram_stain_result_id_foreign` FOREIGN KEY (`gram_stain_result_id`) REFERENCES `gram_stain_results` (`id`),
  CONSTRAINT `gram_drug_susceptibility_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gram_drug_susceptibility`
--

LOCK TABLES `gram_drug_susceptibility` WRITE;
/*!40000 ALTER TABLE `gram_drug_susceptibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `gram_drug_susceptibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gram_stain_ranges`
--

DROP TABLE IF EXISTS `gram_stain_ranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gram_stain_ranges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gram_stain_ranges`
--

LOCK TABLES `gram_stain_ranges` WRITE;
/*!40000 ALTER TABLE `gram_stain_ranges` DISABLE KEYS */;
/*!40000 ALTER TABLE `gram_stain_ranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gram_stain_results`
--

DROP TABLE IF EXISTS `gram_stain_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gram_stain_results` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `test_id` int(10) unsigned NOT NULL,
  `gram_stain_range_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gram_stain_results_user_id_foreign` (`user_id`),
  KEY `gram_stain_results_test_id_foreign` (`test_id`),
  KEY `gram_stain_results_gram_stain_range_id_foreign` (`gram_stain_range_id`),
  CONSTRAINT `gram_stain_results_gram_stain_range_id_foreign` FOREIGN KEY (`gram_stain_range_id`) REFERENCES `gram_stain_ranges` (`id`),
  CONSTRAINT `gram_stain_results_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `unhls_tests` (`id`),
  CONSTRAINT `gram_stain_results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gram_stain_results`
--

LOCK TABLES `gram_stain_results` WRITE;
/*!40000 ALTER TABLE `gram_stain_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `gram_stain_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ii_quickcodes`
--

DROP TABLE IF EXISTS `ii_quickcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ii_quickcodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `feed_source` tinyint(4) NOT NULL,
  `config_prop` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ii_quickcodes`
--

LOCK TABLES `ii_quickcodes` WRITE;
/*!40000 ALTER TABLE `ii_quickcodes` DISABLE KEYS */;
INSERT INTO `ii_quickcodes` VALUES (1,1,'PORT',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(2,1,'MODE',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(3,1,'CLIENT_RECONNECT',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(4,1,'EQUIPMENT_IP',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(5,0,'COMPORT',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(6,0,'BAUD_RATE',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(7,0,'PARITY',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(8,0,'STOP_BITS',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(9,0,'APPEND_NEWLINE',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(10,0,'DATA_BITS',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(11,0,'APPEND_CARRIAGE_RETURN',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(12,2,'DATASOURCE',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(13,2,'DAYS',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(14,4,'BASE_DIRECTORY',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(15,4,'USE_SUB_DIRECTORIES',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(16,4,'SUB_DIRECTORY_FORMAT',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(17,4,'FILE_NAME_FORMAT',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(18,4,'FILE_EXTENSION',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(19,4,'FILE_SEPERATOR',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01');
/*!40000 ALTER TABLE `ii_quickcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrument_testtypes`
--

DROP TABLE IF EXISTS `instrument_testtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instrument_testtypes` (
  `instrument_id` int(10) unsigned NOT NULL,
  `test_type_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `instrument_testtypes_instrument_id_test_type_id_unique` (`instrument_id`,`test_type_id`),
  KEY `instrument_testtypes_test_type_id_foreign` (`test_type_id`),
  CONSTRAINT `instrument_testtypes_instrument_id_foreign` FOREIGN KEY (`instrument_id`) REFERENCES `instruments` (`id`),
  CONSTRAINT `instrument_testtypes_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrument_testtypes`
--

LOCK TABLES `instrument_testtypes` WRITE;
/*!40000 ALTER TABLE `instrument_testtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `instrument_testtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruments`
--

DROP TABLE IF EXISTS `instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instruments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hostname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `driver_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruments`
--

LOCK TABLES `instruments` WRITE;
/*!40000 ALTER TABLE `instruments` DISABLE KEYS */;
/*!40000 ALTER TABLE `instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interfaced_equipment`
--

DROP TABLE IF EXISTS `interfaced_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interfaced_equipment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `equipment_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `comm_type` tinyint(4) NOT NULL,
  `equipment_version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lab_section` int(10) unsigned NOT NULL,
  `feed_source` tinyint(4) NOT NULL,
  `config_file` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `interfaced_equipment_lab_section_foreign` (`lab_section`),
  CONSTRAINT `interfaced_equipment_lab_section_foreign` FOREIGN KEY (`lab_section`) REFERENCES `test_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interfaced_equipment`
--

LOCK TABLES `interfaced_equipment` WRITE;
/*!40000 ALTER TABLE `interfaced_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `interfaced_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isolated_organisms`
--

DROP TABLE IF EXISTS `isolated_organisms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `isolated_organisms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `test_id` int(10) unsigned NOT NULL,
  `organism_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `isolated_organisms_user_id_foreign` (`user_id`),
  KEY `isolated_organisms_test_id_foreign` (`test_id`),
  KEY `isolated_organisms_organism_id_foreign` (`organism_id`),
  CONSTRAINT `isolated_organisms_organism_id_foreign` FOREIGN KEY (`organism_id`) REFERENCES `organisms` (`id`),
  CONSTRAINT `isolated_organisms_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `unhls_tests` (`id`),
  CONSTRAINT `isolated_organisms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isolated_organisms`
--

LOCK TABLES `isolated_organisms` WRITE;
/*!40000 ALTER TABLE `isolated_organisms` DISABLE KEYS */;
/*!40000 ALTER TABLE `isolated_organisms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `receipt_id` int(10) unsigned NOT NULL,
  `topup_request_id` int(10) unsigned NOT NULL,
  `quantity_issued` int(11) NOT NULL,
  `issued_to` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `remarks` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `issues_topup_request_id_foreign` (`topup_request_id`),
  KEY `issues_receipt_id_foreign` (`receipt_id`),
  KEY `issues_issued_to_foreign` (`issued_to`),
  KEY `issues_user_id_foreign` (`user_id`),
  CONSTRAINT `issues_issued_to_foreign` FOREIGN KEY (`issued_to`) REFERENCES `users` (`id`),
  CONSTRAINT `issues_receipt_id_foreign` FOREIGN KEY (`receipt_id`) REFERENCES `receipts` (`id`),
  CONSTRAINT `issues_topup_request_id_foreign` FOREIGN KEY (`topup_request_id`) REFERENCES `topup_requests` (`id`),
  CONSTRAINT `issues_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lots`
--

DROP TABLE IF EXISTS `lots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry` date NOT NULL,
  `instrument_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lots_number_unique` (`number`),
  KEY `lots_instrument_id_foreign` (`instrument_id`),
  CONSTRAINT `lots_instrument_id_foreign` FOREIGN KEY (`instrument_id`) REFERENCES `instruments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lots`
--

LOCK TABLES `lots` WRITE;
/*!40000 ALTER TABLE `lots` DISABLE KEYS */;
/*!40000 ALTER TABLE `lots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure_name_mappings`
--

DROP TABLE IF EXISTS `measure_name_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_name_mappings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_name_mapping_id` int(10) unsigned NOT NULL,
  `measure_id` int(10) unsigned DEFAULT NULL,
  `standard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `system_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `measure_name_mappings_system_name_unique` (`system_name`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure_name_mappings`
--

LOCK TABLES `measure_name_mappings` WRITE;
/*!40000 ALTER TABLE `measure_name_mappings` DISABLE KEYS */;
INSERT INTO `measure_name_mappings` VALUES (1,1,NULL,'WBC','wbc'),(2,1,NULL,'RBC','rbc'),(3,1,NULL,'hgb','hgb'),(4,2,NULL,'Hb','hb'),(5,3,NULL,'ESR','esr'),(6,4,NULL,'Bleeding time','bleeding_time'),(7,5,NULL,'Prothrombin Time','prothrombin_time'),(8,6,NULL,'Clotting Time','clotting_time'),(9,7,NULL,'ABO Grouping','abo_grouping'),(10,8,NULL,'Combs','combs'),(11,9,NULL,'Cross Matching','cross_matching'),(12,10,NULL,'Malaria Microscopy','malaria_microscopy'),(13,11,NULL,'Malaria RDTs','malaria_rdts'),(14,12,NULL,'Stool Microscopy','stool_microscopy'),(15,13,NULL,'VDRL/RPR','vdrl_rpr'),(16,14,NULL,'TPHA','tpha'),(17,15,NULL,'Shigella Dysentery','shigella_dysentery'),(18,16,NULL,'Hepatitis B','hepatitis_b'),(19,17,NULL,'Brucella','brucella'),(20,18,NULL,'Pregnancy Test','pregnancy_test'),(21,19,NULL,'Rheumatoid Factor','rheumatoid_factor'),(22,20,NULL,'CD4 tests','cd4_tests'),(23,21,NULL,'Viral Load Tests','viral_load_tests'),(24,22,NULL,'ZN for AFBs','zn_for_afbs'),(25,23,NULL,'Culture & Sensitivity','culture_sensitivity'),(26,24,NULL,'Gram Stain','gram_stain'),(27,25,NULL,'India Ink','india_ink'),(28,26,NULL,'Wet Preps','wet_preps'),(29,27,NULL,'Urine Microscopy','urine_microscopy'),(30,28,NULL,'Urea','urea'),(31,28,NULL,'Calcium','calcium'),(32,28,NULL,'Potassium','potassium'),(33,28,NULL,'Sodium','sodium'),(34,28,NULL,'Creatinine','creatinine'),(35,29,NULL,'ALT','alt'),(36,29,NULL,'AST','ast'),(37,29,NULL,'Albumin','albumin'),(38,29,NULL,'Total Protein','total_protein'),(39,30,NULL,'Triglycerides','triglycerides'),(40,30,NULL,'Cholesterol','cholesterol'),(41,30,NULL,'CK','ck'),(42,30,NULL,'LDH','ldh'),(43,30,NULL,'HDL','hdl'),(44,31,NULL,'Alkaline Phosphates','alkaline_phosphates'),(45,32,NULL,'Amylase','amylase'),(46,33,NULL,'Glucose','glucose'),(47,34,NULL,'Uric Acid','uric_acid'),(48,35,NULL,'Lactate','lactate'),(49,36,NULL,'Determine','determine'),(50,36,NULL,'Stat-pak','stat_pak'),(51,36,NULL,'Unigold','unigold');
/*!40000 ALTER TABLE `measure_name_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure_ranges`
--

DROP TABLE IF EXISTS `measure_ranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_ranges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `measure_id` int(10) unsigned NOT NULL,
  `age_min` decimal(8,2) DEFAULT NULL,
  `age_max` decimal(8,2) DEFAULT NULL,
  `gender` tinyint(3) unsigned DEFAULT NULL,
  `range_lower` decimal(7,3) DEFAULT NULL,
  `range_upper` decimal(7,3) DEFAULT NULL,
  `alphanumeric` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interpretation` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `result_interpretation_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `measure_ranges_alphanumeric_index` (`alphanumeric`),
  KEY `measure_ranges_measure_id_foreign` (`measure_id`),
  CONSTRAINT `measure_ranges_measure_id_foreign` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure_ranges`
--

LOCK TABLES `measure_ranges` WRITE;
/*!40000 ALTER TABLE `measure_ranges` DISABLE KEYS */;
/*!40000 ALTER TABLE `measure_ranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure_types`
--

DROP TABLE IF EXISTS `measure_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure_types` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `measure_types_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure_types`
--

LOCK TABLES `measure_types` WRITE;
/*!40000 ALTER TABLE `measure_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `measure_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measures`
--

DROP TABLE IF EXISTS `measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `measure_type_id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `unit` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `measures_measure_type_id_foreign` (`measure_type_id`),
  CONSTRAINT `measures_measure_type_id_foreign` FOREIGN KEY (`measure_type_id`) REFERENCES `measure_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measures`
--

LOCK TABLES `measures` WRITE;
/*!40000 ALTER TABLE `measures` DISABLE KEYS */;
/*!40000 ALTER TABLE `measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics`
--

LOCK TABLES `metrics` WRITE;
/*!40000 ALTER TABLE `metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_07_24_082711_CreatekBLIStables',1),('2014_09_02_114206_entrust_setup_tables',1),('2014_10_09_162222_externaldumptable',1),('2015_02_04_004704_add_index_to_parentlabno',1),('2015_02_11_112608_remove_unique_constraint_on_patient_number',1),('2015_02_17_104134_qc_tables',1),('2015_02_23_112018_create_microbiology_tables',1),('2015_02_27_084341_createInventoryTables',1),('2015_03_16_155558_create_surveillance',1),('2015_06_24_145526_update_test_types_table',1),('2015_06_24_154426_FreeTestsColumn',1),('2016_03_30_145749_lab_config_settings',1),('2016_07_26_095319_create_unhls_financial_years_table',1),('2016_07_26_095409_create_unhls_drugs_table',1),('2016_08_17_181955_create_rejection_reasons',1),('2016_08_31_135348_create_unhls_stockcard',1),('2016_08_31_135420_create_unhls_stockrequisition',1),('2016_09_28_091952_create_unhls_warehouse',1),('2016_09_28_095327_create_unhls_staff',1),('2016_10_03_220056_create_bbincidences_table',1),('2016_10_03_220511_create_bbactions_table',1),('2016_10_03_220622_create_bbcauses_table',1),('2016_10_03_220702_create_bbnatures_table',1),('2016_10_03_220852_create_bbincidences_action_table',1),('2016_10_03_220959_create_bbincidences_cause_table',1),('2016_10_03_221055_create_bbincidences_nature_table',1),('2016_10_13_170615_create_unhls_equipment_suppliers_table',1),('2016_10_19_115152_create_referral_reasons',1),('2017_01_16_103507_create_equipment_inventory_table',1),('2017_01_16_103533_create_equipment_maintenance_table',1),('2017_01_16_103546_create_equipment_breakdown_table',1),('2017_04_27_134821_create_wards_table',1),('2017_04_27_144035_update_visits_table',1),('2017_04_27_160407_create_therapy_table',1),('2017_05_25_131728_updateUNHLSBreakdown',1),('2017_06_19_094902_update_equipment_inventory_table',1),('2017_06_19_111831_update_equipment_breakdown_table',1),('2017_06_19_115028_update_unhls_stockcard_table',1),('2017_06_20_043838_alter_stockcard_table',1),('2017_06_30_183112_update_microbiology_functionalities',1),('2017_07_31_020011_create_uuids_table',1),('2018_03_06_194838_create_poc_tables',1),('2017_07_05_170430_create_reports_tables',2),('2017_07_27_160147_create_visit_status_table',2),('2017_07_27_160228_add_status_column_to_visit_table',2),('2017_07_28_113854_add_clinical_notes_column_to_table',2),('2017_07_28_120834_add_phone_contact_column_to_table',2),('2017_08_02_192917_alter_specimen_id_nullable_unhls_tests',2),('2017_08_22_080201_create_test_name_mappings_table',2),('2017_10_10_094958_update_hiv_report_table',2),('2017_10_15_122554_adhoc_configs_table',2),('2017_11_07_160414_create_instrument_column_tables',2),('2017_11_15_121513_update_visit_table',2),('2018_01_12_152202_add_column_range_interpretion',2),('2018_03_15_090759_alter_test_results_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organisms`
--

DROP TABLE IF EXISTS `organisms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `organisms_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisms`
--

LOCK TABLES `organisms` WRITE;
/*!40000 ALTER TABLE `organisms` DISABLE KEYS */;
/*!40000 ALTER TABLE `organisms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_foreign` (`permission_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1),(23,23,1),(24,24,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'manage_incidents','Can Manage Biorisk & Biosecurity Incidents','2018-03-07 07:28:01','2018-03-07 07:28:01'),(2,'view_names','Can view patient names','2018-03-07 07:28:01','2018-03-07 07:28:01'),(3,'manage_patients','Can add patients','2018-03-07 07:28:01','2018-03-07 07:28:01'),(4,'receive_external_test','Can receive test requests','2018-03-07 07:28:01','2018-03-07 07:28:01'),(5,'request_test','Can request new test','2018-03-07 07:28:01','2018-03-07 07:28:01'),(6,'accept_test_specimen','Can accept test specimen','2018-03-07 07:28:01','2018-03-07 07:28:01'),(7,'reject_test_specimen','Can reject test specimen','2018-03-07 07:28:01','2018-03-07 07:28:01'),(8,'change_test_specimen','Can change test specimen','2018-03-07 07:28:01','2018-03-07 07:28:01'),(9,'start_test','Can start tests','2018-03-07 07:28:01','2018-03-07 07:28:01'),(10,'enter_test_results','Can enter tests results','2018-03-07 07:28:01','2018-03-07 07:28:01'),(11,'edit_test_results','Can edit test results','2018-03-07 07:28:01','2018-03-07 07:28:01'),(12,'verify_test_results','Can verify test results','2018-03-07 07:28:01','2018-03-07 07:28:01'),(13,'send_results_to_external_system','Can send test results to external systems','2018-03-07 07:28:01','2018-03-07 07:28:01'),(14,'refer_specimens','Can refer specimens','2018-03-07 07:28:01','2018-03-07 07:28:01'),(15,'manage_users','Can manage users','2018-03-07 07:28:01','2018-03-07 07:28:01'),(16,'manage_test_catalog','Can manage test catalog','2018-03-07 07:28:01','2018-03-07 07:28:01'),(17,'manage_lab_configurations','Can manage lab configurations','2018-03-07 07:28:01','2018-03-07 07:28:01'),(18,'view_reports','Can view reports','2018-03-07 07:28:01','2018-03-07 07:28:01'),(19,'manage_inventory','Can manage inventory','2018-03-07 07:28:01','2018-03-07 07:28:01'),(20,'request_topup','Can request top-up','2018-03-07 07:28:01','2018-03-07 07:28:01'),(21,'manage_qc','Can manage Quality Control','2018-03-07 07:28:01','2018-03-07 07:28:01'),(22,'manage_appointments','Can manage appointments with Clinician','2018-03-16 13:56:26','2018-03-16 13:56:26'),(23,'make_labrequests','Can make lab requests(Only for Clinicians)','2018-03-16 13:56:26','2018-03-16 13:56:26'),(24,'manage_visits','Can manage visit content','2018-03-16 13:56:26','2018-03-16 13:56:26');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poc_tables`
--

DROP TABLE IF EXISTS `poc_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poc_tables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facility_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `exp_no` int(11) NOT NULL,
  `caretaker_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admission_date` date DEFAULT NULL,
  `entry_point` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mother_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `infant_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `breastfeeding_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mother_hiv_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `collection_date` date NOT NULL,
  `pcr_level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sample_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mother_pmtctarv` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` date DEFAULT NULL,
  `created_by` varchar(90) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poc_tables`
--

LOCK TABLES `poc_tables` WRITE;
/*!40000 ALTER TABLE `poc_tables` DISABLE KEYS */;
INSERT INTO `poc_tables` VALUES (1,1,1,'Male',3,0,'0700576401','0000-00-00','not known','Kalemba Gwanga Jennfier','Kayemba John Bosco','','1','2018-03-07','2nd PCR','Uasd-012','','2018-03-07 07:28:50','2018-03-07 07:28:50',NULL,NULL),(2,1,1,'Female',9,0,'09231231','0000-00-00','','sdad','kajksdja','','1','2018-03-01','2nd PCR','A-LIS Admin','','2018-03-15 15:01:53','2018-03-15 15:01:53',NULL,NULL),(3,1,1,'Female',15,0,'912312','0000-00-00','','kimigisha Annet','Annet Nalujja','','1','2018-03-15','1st PCR','A-LIS Admin','','2018-03-15 15:37:47','2018-03-15 15:37:47',NULL,NULL),(4,1,1,'Female',4,0,'0700576401','0000-00-00','','Kamugen Jane','Janet Mpumudde','','1','2018-03-14','R1','A-LIS Admin','','2018-03-15 15:39:33','2018-03-15 15:39:33',NULL,NULL),(5,1,1,'Male',7,0,'0891231231','0000-00-00','','Kalungi Daphine','Mukulu Ronald','','2','2018-03-15','R2','UNHLS01','','2018-03-15 15:40:56','2018-03-15 15:40:56',NULL,NULL),(6,1,1,'Male',6,0,'0712889000',NULL,'','NAKANJAKO JANE','KIBIRIGE JOSEPH','','1','2018-03-14','R1','lbk0012/LKA','','2018-03-15 15:49:11','2018-03-15 15:49:11',NULL,NULL),(7,1,1,'Female',3,12344555,'0709876575',NULL,'','nakafeero','mukasa mbidde','','1','2018-03-13','1st PCR','U0976','','2018-03-16 13:16:35','2018-03-16 13:16:35',NULL,'1'),(8,1,1,'Male',6,5646,'098958473',NULL,'','Nakyun Pauline','Kapio Pan','','2','2018-03-13','2nd PCR','67575','','2018-03-16 13:19:57','2018-03-16 13:19:57',NULL,'1'),(9,1,1,'Female',2,0,'0192312',NULL,'','nnasdasd','kasdasd','','1','2018-03-16','R1','Kirinya2018','','2018-03-16 13:22:35','2018-03-16 13:22:35',NULL,'1'),(10,1,1,'Female',2,0,'0192312',NULL,'','nnasdasd','kasdasd','','1','2018-03-16','R1','Kirinya2018','','2018-03-16 13:23:42','2018-03-16 13:23:42',NULL,'1'),(11,1,1,'Female',2,0,'0192312',NULL,'','nnasdasd','kasdasd','','1','2018-03-16','R1','Kirinya2018','','2018-03-16 13:24:18','2018-03-16 13:24:18',NULL,'1'),(12,1,1,'Male',7,0,'0772689665',NULL,'','Poni Agustina','kittutu paul','','1','2018-03-16','2nd PCR','Mubiru','','2018-03-16 13:25:38','2018-03-16 13:25:38',NULL,'1'),(13,1,1,'Male',7,0,'0772689665',NULL,'','Poni Agustina','kittutu paul','','1','2018-03-16','2nd PCR','Mubiru','','2018-03-16 13:28:44','2018-03-16 13:28:44',NULL,'1'),(14,1,1,'Male',5,0,'0924423424243',NULL,'','Jann','John Kasibante','','1','2018-03-16','R2','hhasd','','2018-03-16 13:29:25','2018-03-16 13:29:25',NULL,'1'),(15,1,1,'Female',5,0,'8709877',NULL,'uyu','katun isa','Pike','','2','2018-03-21','2nd PCR','7686544','','2018-03-16 13:33:01','2018-03-16 13:33:01',NULL,'1'),(16,1,1,'Male',2,0,'0773334343',NULL,'','jjjadan','Wamwiza','','3','2018-03-16','2nd PCR','012017020BG','','2018-03-16 14:30:50','2018-03-16 14:30:50',NULL,'1');
/*!40000 ALTER TABLE `poc_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_analytic_specimen_rejections`
--

DROP TABLE IF EXISTS `pre_analytic_specimen_rejections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pre_analytic_specimen_rejections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `specimen_id` int(10) unsigned NOT NULL,
  `rejected_by` int(10) unsigned NOT NULL,
  `rejection_reason_id` int(10) unsigned DEFAULT NULL,
  `reject_explained_to` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_rejected` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pre_analytic_specimen_rejections_rejected_by_index` (`rejected_by`),
  KEY `pre_analytic_specimen_rejections_specimen_id_foreign` (`specimen_id`),
  KEY `pre_analytic_specimen_rejections_rejection_reason_id_foreign` (`rejection_reason_id`),
  CONSTRAINT `pre_analytic_specimen_rejections_rejection_reason_id_foreign` FOREIGN KEY (`rejection_reason_id`) REFERENCES `rejection_reasons` (`id`),
  CONSTRAINT `pre_analytic_specimen_rejections_specimen_id_foreign` FOREIGN KEY (`specimen_id`) REFERENCES `specimens` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_analytic_specimen_rejections`
--

LOCK TABLES `pre_analytic_specimen_rejections` WRITE;
/*!40000 ALTER TABLE `pre_analytic_specimen_rejections` DISABLE KEYS */;
/*!40000 ALTER TABLE `pre_analytic_specimen_rejections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipts`
--

DROP TABLE IF EXISTS `receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `commodity_id` int(10) unsigned NOT NULL,
  `supplier_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `batch_no` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `receipts_commodity_id_foreign` (`commodity_id`),
  KEY `receipts_supplier_id_foreign` (`supplier_id`),
  KEY `receipts_user_id_foreign` (`user_id`),
  CONSTRAINT `receipts_commodity_id_foreign` FOREIGN KEY (`commodity_id`) REFERENCES `commodities` (`id`),
  CONSTRAINT `receipts_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  CONSTRAINT `receipts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipts`
--

LOCK TABLES `receipts` WRITE;
/*!40000 ALTER TABLE `receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral_reasons`
--

DROP TABLE IF EXISTS `referral_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referral_reasons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral_reasons`
--

LOCK TABLES `referral_reasons` WRITE;
/*!40000 ALTER TABLE `referral_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `referral_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referrals`
--

DROP TABLE IF EXISTS `referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referrals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sample_obtainer` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cadre_obtainer` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `sample_date` date NOT NULL,
  `sample_time` timestamp NULL DEFAULT NULL,
  `time_dispatch` timestamp NULL DEFAULT NULL,
  `storage_condition` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `transport_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `referral_reason` int(10) unsigned NOT NULL,
  `priority_specimen` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `facility_id` int(10) unsigned NOT NULL,
  `person` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `contacts` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `referrals_user_id_foreign` (`user_id`),
  KEY `referrals_facility_id_foreign` (`facility_id`),
  CONSTRAINT `referrals_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`),
  CONSTRAINT `referrals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrals`
--

LOCK TABLES `referrals` WRITE;
/*!40000 ALTER TABLE `referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rejection_reasons`
--

DROP TABLE IF EXISTS `rejection_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rejection_reasons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rejection_reasons`
--

LOCK TABLES `rejection_reasons` WRITE;
/*!40000 ALTER TABLE `rejection_reasons` DISABLE KEYS */;
INSERT INTO `rejection_reasons` VALUES (1,'Inadequate sample volume'),(2,'Haemolysed sample'),(3,'Specimen without lab request form'),(4,'No test ordered on  lab request form of sample'),(5,'No sample label or identifier'),(6,'Wrong sample label'),(7,'Unclear sample label'),(8,'Sample in wrong container'),(9,'Damaged/broken/leaking sample container'),(10,'Too old sample'),(11,'Date of sample collection not specified'),(12,'Time of sample collection not specified'),(13,'Improper transport media'),(14,'Sample type unacceptable for required test'),(15,'Other');
/*!40000 ALTER TABLE `rejection_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_diseases`
--

DROP TABLE IF EXISTS `report_diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_diseases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_type_id` int(10) unsigned NOT NULL,
  `disease_id` int(10) unsigned NOT NULL,
  `result_interpretation_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `report_diseases_test_type_id_disease_id_unique` (`test_type_id`,`disease_id`),
  KEY `report_diseases_disease_id_foreign` (`disease_id`),
  CONSTRAINT `report_diseases_disease_id_foreign` FOREIGN KEY (`disease_id`) REFERENCES `diseases` (`id`),
  CONSTRAINT `report_diseases_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_diseases`
--

LOCK TABLES `report_diseases` WRITE;
/*!40000 ALTER TABLE `report_diseases` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_interpretations`
--

DROP TABLE IF EXISTS `result_interpretations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result_interpretations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_interpretations`
--

LOCK TABLES `result_interpretations` WRITE;
/*!40000 ALTER TABLE `result_interpretations` DISABLE KEYS */;
INSERT INTO `result_interpretations` VALUES (1,'High'),(2,'Normal'),(3,'Low'),(4,'HGB<8'),(5,'HGB≥8'),(6,'Positive'),(7,'Negative');
/*!40000 ALTER TABLE `result_interpretations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Superadmin',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(2,'Technologist',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(3,'Receptionist',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specimen_statuses`
--

DROP TABLE IF EXISTS `specimen_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specimen_statuses` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specimen_statuses`
--

LOCK TABLES `specimen_statuses` WRITE;
/*!40000 ALTER TABLE `specimen_statuses` DISABLE KEYS */;
INSERT INTO `specimen_statuses` VALUES (1,'specimen-not-collected'),(2,'specimen-accepted'),(3,'specimen-rejected');
/*!40000 ALTER TABLE `specimen_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specimen_types`
--

DROP TABLE IF EXISTS `specimen_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specimen_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specimen_types`
--

LOCK TABLES `specimen_types` WRITE;
/*!40000 ALTER TABLE `specimen_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `specimen_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specimens`
--

DROP TABLE IF EXISTS `specimens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specimens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `specimen_type_id` int(10) unsigned NOT NULL,
  `specimen_status_id` int(10) unsigned NOT NULL DEFAULT '2',
  `accepted_by` int(10) unsigned NOT NULL DEFAULT '0',
  `referral_id` int(10) unsigned DEFAULT NULL,
  `time_collected` timestamp NULL DEFAULT NULL,
  `time_accepted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `specimens_accepted_by_index` (`accepted_by`),
  KEY `specimens_specimen_type_id_foreign` (`specimen_type_id`),
  KEY `specimens_specimen_status_id_foreign` (`specimen_status_id`),
  KEY `specimens_referral_id_foreign` (`referral_id`),
  CONSTRAINT `specimens_referral_id_foreign` FOREIGN KEY (`referral_id`) REFERENCES `referrals` (`id`),
  CONSTRAINT `specimens_specimen_status_id_foreign` FOREIGN KEY (`specimen_status_id`) REFERENCES `specimen_statuses` (`id`),
  CONSTRAINT `specimens_specimen_type_id_foreign` FOREIGN KEY (`specimen_type_id`) REFERENCES `specimen_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specimens`
--

LOCK TABLES `specimens` WRITE;
/*!40000 ALTER TABLE `specimens` DISABLE KEYS */;
/*!40000 ALTER TABLE `specimens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `physical_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_categories`
--

DROP TABLE IF EXISTS `test_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test_categories_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_categories`
--

LOCK TABLES `test_categories` WRITE;
/*!40000 ALTER TABLE `test_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_name_mappings`
--

DROP TABLE IF EXISTS `test_name_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_name_mappings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_type_id` int(10) unsigned DEFAULT NULL,
  `standard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `system_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `test_name_mappings_system_name_unique` (`system_name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_name_mappings`
--

LOCK TABLES `test_name_mappings` WRITE;
/*!40000 ALTER TABLE `test_name_mappings` DISABLE KEYS */;
INSERT INTO `test_name_mappings` VALUES (1,NULL,'CBC','cbc'),(2,NULL,'Hb','hb'),(3,NULL,'ESR','esr'),(4,NULL,'Bleeding time','bleeding_time'),(5,NULL,'Prothrombin Time','prothrombin_time'),(6,NULL,'Clotting Time','clotting_time'),(7,NULL,'ABO Grouping','abo_grouping'),(8,NULL,'Combs','combs'),(9,NULL,'Cross Matching','cross_matching'),(10,NULL,'Malaria Microscopy','malaria_microscopy'),(11,NULL,'Malaria RDTs','malaria_rdts'),(12,NULL,'Stool Microscopy','stool_microscopy'),(13,NULL,'VDRL/RPR','vdrl_rpr'),(14,NULL,'TPHA','tpha'),(15,NULL,'Shigella Dysentery','shigella_dysentery'),(16,NULL,'Hepatitis B','hepatitis_b'),(17,NULL,'Brucella','brucella'),(18,NULL,'Pregnancy Test','pregnancy_test'),(19,NULL,'Rheumatoid Factor','rheumatoid_factor'),(20,NULL,'CD4 tests','cd4_tests'),(21,NULL,'Viral Load Tests','viral_load_tests'),(22,NULL,'ZN for AFBs','zn_for_afbs'),(23,NULL,'Culture & Sensitivity','culture_sensitivity'),(24,NULL,'Gram Stain','gram_stain'),(25,NULL,'India Ink','india_ink'),(26,NULL,'Wet Preps','wet_preps'),(27,NULL,'Urine Microscopy','urine_microscopy'),(28,NULL,'Renal Profile','renal_profile'),(29,NULL,'Liver Profile','liver_profile'),(30,NULL,'Lipid/Cardiac Profile','lipid_cardiac_profile'),(31,NULL,'Alkaline Phosphates','alkaline_phosphates'),(32,NULL,'Amylase','amylase'),(33,NULL,'Glucose','glucose'),(34,NULL,'Uric Acid','uric_acid'),(35,NULL,'Lactate','lactate'),(36,NULL,'HIV','hiv');
/*!40000 ALTER TABLE `test_name_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_phases`
--

DROP TABLE IF EXISTS `test_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_phases` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_phases`
--

LOCK TABLES `test_phases` WRITE;
/*!40000 ALTER TABLE `test_phases` DISABLE KEYS */;
INSERT INTO `test_phases` VALUES (1,'Pre-Analytical'),(2,'Analytical'),(3,'Post-Analytical');
/*!40000 ALTER TABLE `test_phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_statuses`
--

DROP TABLE IF EXISTS `test_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_statuses` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `test_phase_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test_statuses_test_phase_id_foreign` (`test_phase_id`),
  CONSTRAINT `test_statuses_test_phase_id_foreign` FOREIGN KEY (`test_phase_id`) REFERENCES `test_phases` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_statuses`
--

LOCK TABLES `test_statuses` WRITE;
/*!40000 ALTER TABLE `test_statuses` DISABLE KEYS */;
INSERT INTO `test_statuses` VALUES (1,'not-received',1),(2,'pending',1),(3,'started',2),(4,'completed',3),(5,'verified',3),(6,'specimen-rejected-at-analysis',3);
/*!40000 ALTER TABLE `test_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_types`
--

DROP TABLE IF EXISTS `test_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `test_category_id` int(10) unsigned NOT NULL,
  `targetTAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderable_test` int(11) DEFAULT NULL,
  `prevalence_threshold` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accredited` tinyint(4) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `test_types_test_category_id_foreign` (`test_category_id`),
  CONSTRAINT `test_types_test_category_id_foreign` FOREIGN KEY (`test_category_id`) REFERENCES `test_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_types`
--

LOCK TABLES `test_types` WRITE;
/*!40000 ALTER TABLE `test_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testtype_measures`
--

DROP TABLE IF EXISTS `testtype_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testtype_measures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_type_id` int(10) unsigned NOT NULL,
  `measure_id` int(10) unsigned NOT NULL,
  `ordering` tinyint(4) DEFAULT NULL,
  `nesting` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `testtype_measures_test_type_id_measure_id_unique` (`test_type_id`,`measure_id`),
  KEY `testtype_measures_measure_id_foreign` (`measure_id`),
  CONSTRAINT `testtype_measures_measure_id_foreign` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`),
  CONSTRAINT `testtype_measures_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testtype_measures`
--

LOCK TABLES `testtype_measures` WRITE;
/*!40000 ALTER TABLE `testtype_measures` DISABLE KEYS */;
/*!40000 ALTER TABLE `testtype_measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testtype_specimentypes`
--

DROP TABLE IF EXISTS `testtype_specimentypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testtype_specimentypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_type_id` int(10) unsigned NOT NULL,
  `specimen_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `testtype_specimentypes_test_type_id_specimen_type_id_unique` (`test_type_id`,`specimen_type_id`),
  KEY `testtype_specimentypes_specimen_type_id_foreign` (`specimen_type_id`),
  CONSTRAINT `testtype_specimentypes_specimen_type_id_foreign` FOREIGN KEY (`specimen_type_id`) REFERENCES `specimen_types` (`id`),
  CONSTRAINT `testtype_specimentypes_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testtype_specimentypes`
--

LOCK TABLES `testtype_specimentypes` WRITE;
/*!40000 ALTER TABLE `testtype_specimentypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `testtype_specimentypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `therapy`
--

DROP TABLE IF EXISTS `therapy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `therapy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visit_id` int(10) unsigned NOT NULL,
  `patient_id` int(10) unsigned NOT NULL,
  `previous_therapy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_therapy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clinical_notes` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clinician` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `therapy`
--

LOCK TABLES `therapy` WRITE;
/*!40000 ALTER TABLE `therapy` DISABLE KEYS */;
/*!40000 ALTER TABLE `therapy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `tokens_email_index` (`email`),
  KEY `tokens_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topup_requests`
--

DROP TABLE IF EXISTS `topup_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topup_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `commodity_id` int(10) unsigned NOT NULL,
  `test_category_id` int(10) unsigned NOT NULL,
  `order_quantity` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `remarks` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `topup_requests_test_category_id_foreign` (`test_category_id`),
  KEY `topup_requests_commodity_id_foreign` (`commodity_id`),
  KEY `topup_requests_user_id_foreign` (`user_id`),
  CONSTRAINT `topup_requests_commodity_id_foreign` FOREIGN KEY (`commodity_id`) REFERENCES `commodities` (`id`),
  CONSTRAINT `topup_requests_test_category_id_foreign` FOREIGN KEY (`test_category_id`) REFERENCES `test_categories` (`id`),
  CONSTRAINT `topup_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topup_requests`
--

LOCK TABLES `topup_requests` WRITE;
/*!40000 ALTER TABLE `topup_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `topup_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_bbactions`
--

DROP TABLE IF EXISTS `unhls_bbactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_bbactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `actionname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_bbactions`
--

LOCK TABLES `unhls_bbactions` WRITE;
/*!40000 ALTER TABLE `unhls_bbactions` DISABLE KEYS */;
INSERT INTO `unhls_bbactions` VALUES (1,'Reported to administration for further action','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(2,'Referred to mental department','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(3,'Gave first aid (e.g. arrested bleeding)','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(4,'Referred to clinician for further management','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(5,'Conducted risk assessment','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(6,'Intervened to interrupt/arrest progress of incident (e.g. Used neutralizing agent, stopping a fight)','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(7,'Disposed off broken container to designated waste bin/sharps','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(8,'Patient sample taken & referred to testing lab Isolated suspected patient','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(9,'Reported to or engaged national level BRM for intervention','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(10,'Victim counseled','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(11,'Contacted Police','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(12,'Used spill kit','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(13,'Administered PEP','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(14,'Referred to disciplinary committee','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(15,'Contained the spillage','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(16,'Disinfected the place','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(17,'Switched off the Electricity Mains','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(18,'Washed punctured area','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(19,'Others','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL);
/*!40000 ALTER TABLE `unhls_bbactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_bbcauses`
--

DROP TABLE IF EXISTS `unhls_bbcauses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_bbcauses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `causename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_bbcauses`
--

LOCK TABLES `unhls_bbcauses` WRITE;
/*!40000 ALTER TABLE `unhls_bbcauses` DISABLE KEYS */;
INSERT INTO `unhls_bbcauses` VALUES (1,'Defective Equipment','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(2,'Hazardous Chemicals','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(3,'Unsafe Procedure','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(4,'Psychological causes (e.g. emotional condition, depression, mental confusion)','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(5,'Unsafe storage of laboratory chemicals','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(6,'Lack of Skill or Knowledge','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(7,'Lack of Personal Protective Equipment','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(8,'Unsafe Working Environment','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(9,'Lack of Adequate Physical Security','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(10,'Unsafe location of laboratory equipment','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL),(11,'Other','2018-03-07 07:28:00','2018-03-07 07:28:00',NULL);
/*!40000 ALTER TABLE `unhls_bbcauses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_bbincidences`
--

DROP TABLE IF EXISTS `unhls_bbincidences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_bbincidences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facility_id` int(10) unsigned NOT NULL,
  `serial_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `occurrence_date` date NOT NULL,
  `occurrence_time` time NOT NULL,
  `personnel_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `personnel_surname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `personnel_othername` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `personnel_gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `personnel_dob` date NOT NULL,
  `personnel_age` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `personnel_category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `personnel_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `personnel_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nok_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nok_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nok_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lab_section` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `occurrence` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ulin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `equip_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `equip_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `task` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `officer_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `officer_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `officer_cadre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `officer_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstaid` text COLLATE utf8_unicode_ci NOT NULL,
  `intervention` text COLLATE utf8_unicode_ci NOT NULL,
  `intervention_date` date NOT NULL,
  `intervention_time` time NOT NULL,
  `intervention_followup` text COLLATE utf8_unicode_ci NOT NULL,
  `mo_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mo_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mo_designation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mo_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cause` text COLLATE utf8_unicode_ci NOT NULL,
  `corrective_action` text COLLATE utf8_unicode_ci NOT NULL,
  `referral_status` text COLLATE utf8_unicode_ci NOT NULL,
  `status` text COLLATE utf8_unicode_ci NOT NULL,
  `analysis_date` date NOT NULL,
  `analysis_time` time NOT NULL,
  `bo_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bo_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bo_designation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bo_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `findings` text COLLATE utf8_unicode_ci NOT NULL,
  `improvement_plan` text COLLATE utf8_unicode_ci NOT NULL,
  `response_date` date NOT NULL,
  `response_time` time NOT NULL,
  `brm_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brm_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brm_designation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brm_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdby` int(10) unsigned DEFAULT NULL,
  `updatedby` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `unhls_bbincidences_facility_id_foreign` (`facility_id`),
  KEY `unhls_bbincidences_createdby_foreign` (`createdby`),
  CONSTRAINT `unhls_bbincidences_createdby_foreign` FOREIGN KEY (`createdby`) REFERENCES `users` (`id`),
  CONSTRAINT `unhls_bbincidences_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `unhls_facilities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_bbincidences`
--

LOCK TABLES `unhls_bbincidences` WRITE;
/*!40000 ALTER TABLE `unhls_bbincidences` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_bbincidences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_bbincidences_action`
--

DROP TABLE IF EXISTS `unhls_bbincidences_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_bbincidences_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bbincidence_id` int(10) unsigned NOT NULL,
  `action_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `unhls_bbincidences_action_bbincidence_id_foreign` (`bbincidence_id`),
  KEY `unhls_bbincidences_action_action_id_foreign` (`action_id`),
  CONSTRAINT `unhls_bbincidences_action_action_id_foreign` FOREIGN KEY (`action_id`) REFERENCES `unhls_bbactions` (`id`),
  CONSTRAINT `unhls_bbincidences_action_bbincidence_id_foreign` FOREIGN KEY (`bbincidence_id`) REFERENCES `unhls_bbincidences` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_bbincidences_action`
--

LOCK TABLES `unhls_bbincidences_action` WRITE;
/*!40000 ALTER TABLE `unhls_bbincidences_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_bbincidences_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_bbincidences_cause`
--

DROP TABLE IF EXISTS `unhls_bbincidences_cause`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_bbincidences_cause` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bbincidence_id` int(10) unsigned NOT NULL,
  `cause_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `unhls_bbincidences_cause_bbincidence_id_foreign` (`bbincidence_id`),
  KEY `unhls_bbincidences_cause_cause_id_foreign` (`cause_id`),
  CONSTRAINT `unhls_bbincidences_cause_bbincidence_id_foreign` FOREIGN KEY (`bbincidence_id`) REFERENCES `unhls_bbincidences` (`id`),
  CONSTRAINT `unhls_bbincidences_cause_cause_id_foreign` FOREIGN KEY (`cause_id`) REFERENCES `unhls_bbcauses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_bbincidences_cause`
--

LOCK TABLES `unhls_bbincidences_cause` WRITE;
/*!40000 ALTER TABLE `unhls_bbincidences_cause` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_bbincidences_cause` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_bbincidences_nature`
--

DROP TABLE IF EXISTS `unhls_bbincidences_nature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_bbincidences_nature` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bbincidence_id` int(10) unsigned NOT NULL,
  `nature_id` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `unhls_bbincidences_nature_bbincidence_id_foreign` (`bbincidence_id`),
  KEY `unhls_bbincidences_nature_nature_id_foreign` (`nature_id`),
  CONSTRAINT `unhls_bbincidences_nature_bbincidence_id_foreign` FOREIGN KEY (`bbincidence_id`) REFERENCES `unhls_bbincidences` (`id`),
  CONSTRAINT `unhls_bbincidences_nature_nature_id_foreign` FOREIGN KEY (`nature_id`) REFERENCES `unhls_bbnatures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_bbincidences_nature`
--

LOCK TABLES `unhls_bbincidences_nature` WRITE;
/*!40000 ALTER TABLE `unhls_bbincidences_nature` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_bbincidences_nature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_bbnatures`
--

DROP TABLE IF EXISTS `unhls_bbnatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_bbnatures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_bbnatures`
--

LOCK TABLES `unhls_bbnatures` WRITE;
/*!40000 ALTER TABLE `unhls_bbnatures` DISABLE KEYS */;
INSERT INTO `unhls_bbnatures` VALUES (1,'Assault/Fight among staff','Physical','Minor',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(2,'Fainting','Physical','Minor',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(3,'Roof leakages','Physical','Minor',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(4,'Machine cuts/bruises','Mechanical','Minor',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(5,'Electric shock/burn','Mechanical','Major',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(6,'Death within lab','Ergonometric and Medical','Major',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(7,'Slip or fall','Physical','Minor',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(8,'Unnecessary destruction of lab material','Physical','Minor',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(9,'Theft of laboratory consumables','Physical','Minor',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(10,'Breakage of sample container','Physical','Minor',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(11,'Prick/cut by unused sharps','Physical','Minor',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(12,'Injury caused by laboratory objects','Physical','Minor',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(13,'Chemical burn','Chemical','Minor',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(14,'Theft of chemical','Chemical','Minor',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(15,'Chemical spillage','Chemical','Major',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(16,'Theft of equipment','Physical','Major',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(17,'Attack on the Lab','Physical','Major',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(18,'Collapsing building','Physical','Major',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(19,'Bike rider accident','Physical','Major',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(20,'Fire','Physical','Major',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(21,'Needle prick or cuts by used sharps','Biological','Minor',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(22,'Sample spillage','Biological','Minor',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(23,'Theft of samples','Biological','Major',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(24,'Contact with VHF suspect','Biological','Major',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(25,'Contact with radiological materials','Radiological','Major',NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00'),(26,'Theft of radiological materials','Radiological','Major',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(27,'Poor disposal of radiological materials','Radiological','Major',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(28,'Poor vision from inadequate light','Ergonometric and Medical','Minor',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(29,'Back pain from posture effects','Ergonometric and Medical','Minor',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(30,'Other occupational hazard','Ergonometric and Medical','Minor',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01'),(31,'Other','Other','Other',NULL,'2018-03-07 07:28:01','2018-03-07 07:28:01');
/*!40000 ALTER TABLE `unhls_bbnatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_districts`
--

DROP TABLE IF EXISTS `unhls_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_districts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_districts`
--

LOCK TABLES `unhls_districts` WRITE;
/*!40000 ALTER TABLE `unhls_districts` DISABLE KEYS */;
INSERT INTO `unhls_districts` VALUES (1,'Kampala','2018-03-07 07:27:59','2018-03-07 07:27:59'),(2,'Buikwe','2018-03-07 07:27:59','2018-03-07 07:27:59'),(3,'Bukomansimbi','2018-03-07 07:27:59','2018-03-07 07:27:59'),(4,'Butambala','2018-03-07 07:27:59','2018-03-07 07:27:59'),(5,'Buvuma','2018-03-07 07:27:59','2018-03-07 07:27:59'),(6,'Gomba','2018-03-07 07:27:59','2018-03-07 07:27:59'),(7,'Kalangala','2018-03-07 07:27:59','2018-03-07 07:27:59'),(8,'Kalungu','2018-03-07 07:27:59','2018-03-07 07:27:59'),(9,'Kayunga','2018-03-07 07:27:59','2018-03-07 07:27:59'),(10,'Kiboga','2018-03-07 07:27:59','2018-03-07 07:27:59'),(11,'Kyankwanzi','2018-03-07 07:27:59','2018-03-07 07:27:59'),(12,'Luweero','2018-03-07 07:27:59','2018-03-07 07:27:59'),(13,'Lwengo','2018-03-07 07:27:59','2018-03-07 07:27:59'),(14,'Lyantonde','2018-03-07 07:27:59','2018-03-07 07:27:59'),(15,'Masaka','2018-03-07 07:27:59','2018-03-07 07:27:59'),(16,'Mityana','2018-03-07 07:27:59','2018-03-07 07:27:59'),(17,'Mpigi','2018-03-07 07:27:59','2018-03-07 07:27:59'),(18,'Mubende','2018-03-07 07:27:59','2018-03-07 07:27:59'),(19,'Mukono','2018-03-07 07:27:59','2018-03-07 07:27:59'),(20,'Nakaseke','2018-03-07 07:27:59','2018-03-07 07:27:59'),(21,'Nakasongola','2018-03-07 07:27:59','2018-03-07 07:27:59'),(22,'Rakai','2018-03-07 07:27:59','2018-03-07 07:27:59'),(23,'Ssembabule','2018-03-07 07:27:59','2018-03-07 07:27:59'),(24,'Wakiso','2018-03-07 07:27:59','2018-03-07 07:27:59'),(25,'Amuria','2018-03-07 07:27:59','2018-03-07 07:27:59'),(26,'Budaka','2018-03-07 07:27:59','2018-03-07 07:27:59'),(27,'Bududa','2018-03-07 07:28:00','2018-03-07 07:28:00'),(28,'Bugiri','2018-03-07 07:28:00','2018-03-07 07:28:00'),(29,'Bukedea','2018-03-07 07:28:00','2018-03-07 07:28:00'),(30,'Bukwa','2018-03-07 07:28:00','2018-03-07 07:28:00'),(31,'Bulambuli','2018-03-07 07:28:00','2018-03-07 07:28:00'),(32,'Busia','2018-03-07 07:28:00','2018-03-07 07:28:00'),(33,'Butaleja','2018-03-07 07:28:00','2018-03-07 07:28:00'),(34,'Buyende','2018-03-07 07:28:00','2018-03-07 07:28:00'),(35,'Iganga','2018-03-07 07:28:00','2018-03-07 07:28:00'),(36,'Jinja','2018-03-07 07:28:00','2018-03-07 07:28:00'),(37,'Kaberamaido','2018-03-07 07:28:00','2018-03-07 07:28:00'),(38,'Kaliro','2018-03-07 07:28:00','2018-03-07 07:28:00'),(39,'Kamuli','2018-03-07 07:28:00','2018-03-07 07:28:00'),(40,'Kapchorwa','2018-03-07 07:28:00','2018-03-07 07:28:00'),(41,'Katakwi','2018-03-07 07:28:00','2018-03-07 07:28:00'),(42,'Kibuku','2018-03-07 07:28:00','2018-03-07 07:28:00'),(43,'Kumi','2018-03-07 07:28:00','2018-03-07 07:28:00'),(44,'Kween','2018-03-07 07:28:00','2018-03-07 07:28:00'),(45,'Luuka','2018-03-07 07:28:00','2018-03-07 07:28:00'),(46,'Manafwa','2018-03-07 07:28:00','2018-03-07 07:28:00'),(47,'Mayuge','2018-03-07 07:28:00','2018-03-07 07:28:00'),(48,'Mbale','2018-03-07 07:28:00','2018-03-07 07:28:00'),(49,'Namayingo','2018-03-07 07:28:00','2018-03-07 07:28:00'),(50,'Namutumba','2018-03-07 07:28:00','2018-03-07 07:28:00'),(51,'Ngora','2018-03-07 07:28:00','2018-03-07 07:28:00'),(52,'Pallisa','2018-03-07 07:28:00','2018-03-07 07:28:00'),(53,'Serere','2018-03-07 07:28:00','2018-03-07 07:28:00'),(54,'Sironko','2018-03-07 07:28:00','2018-03-07 07:28:00'),(55,'Soroti','2018-03-07 07:28:00','2018-03-07 07:28:00'),(56,'Tororo','2018-03-07 07:28:00','2018-03-07 07:28:00'),(57,'Abim','2018-03-07 07:28:00','2018-03-07 07:28:00'),(58,'Adjumani','2018-03-07 07:28:00','2018-03-07 07:28:00'),(59,'Agago','2018-03-07 07:28:00','2018-03-07 07:28:00'),(60,'Alebtong','2018-03-07 07:28:00','2018-03-07 07:28:00'),(61,'Amolatar','2018-03-07 07:28:00','2018-03-07 07:28:00'),(62,'Amudat','2018-03-07 07:28:00','2018-03-07 07:28:00'),(63,'Amuru','2018-03-07 07:28:00','2018-03-07 07:28:00'),(64,'Apac','2018-03-07 07:28:00','2018-03-07 07:28:00'),(65,'Arua','2018-03-07 07:28:00','2018-03-07 07:28:00'),(66,'Dokolo','2018-03-07 07:28:00','2018-03-07 07:28:00'),(67,'Gulu','2018-03-07 07:28:00','2018-03-07 07:28:00'),(68,'Kaabong','2018-03-07 07:28:00','2018-03-07 07:28:00'),(69,'Kitgum','2018-03-07 07:28:00','2018-03-07 07:28:00'),(70,'Koboko','2018-03-07 07:28:00','2018-03-07 07:28:00'),(71,'Kole','2018-03-07 07:28:00','2018-03-07 07:28:00'),(72,'Kotido','2018-03-07 07:28:00','2018-03-07 07:28:00'),(73,'Lamwo','2018-03-07 07:28:00','2018-03-07 07:28:00'),(74,'Lira','2018-03-07 07:28:00','2018-03-07 07:28:00'),(75,'Maracha','2018-03-07 07:28:00','2018-03-07 07:28:00'),(76,'Moroto','2018-03-07 07:28:00','2018-03-07 07:28:00'),(77,'Moyo','2018-03-07 07:28:00','2018-03-07 07:28:00'),(78,'Nakapiripirit','2018-03-07 07:28:00','2018-03-07 07:28:00'),(79,'Napak','2018-03-07 07:28:00','2018-03-07 07:28:00'),(80,'Nebbi','2018-03-07 07:28:00','2018-03-07 07:28:00'),(81,'Nwoya','2018-03-07 07:28:00','2018-03-07 07:28:00'),(82,'Otuke','2018-03-07 07:28:00','2018-03-07 07:28:00'),(83,'Oyam','2018-03-07 07:28:00','2018-03-07 07:28:00'),(84,'Pader','2018-03-07 07:28:00','2018-03-07 07:28:00'),(85,'Yumbe','2018-03-07 07:28:00','2018-03-07 07:28:00'),(86,'Zombo','2018-03-07 07:28:00','2018-03-07 07:28:00'),(87,'Buhweju','2018-03-07 07:28:00','2018-03-07 07:28:00'),(88,'Buliisa','2018-03-07 07:28:00','2018-03-07 07:28:00'),(89,'Bundibugyo','2018-03-07 07:28:00','2018-03-07 07:28:00'),(90,'Bushenyi','2018-03-07 07:28:00','2018-03-07 07:28:00'),(91,'Hoima','2018-03-07 07:28:00','2018-03-07 07:28:00'),(92,'Ibanda','2018-03-07 07:28:00','2018-03-07 07:28:00'),(93,'Isingiro','2018-03-07 07:28:00','2018-03-07 07:28:00'),(94,'Kabale','2018-03-07 07:28:00','2018-03-07 07:28:00'),(95,'Kabarole','2018-03-07 07:28:00','2018-03-07 07:28:00'),(96,'Kamwenge','2018-03-07 07:28:00','2018-03-07 07:28:00'),(97,'Kanungu','2018-03-07 07:28:00','2018-03-07 07:28:00'),(98,'Kasese','2018-03-07 07:28:00','2018-03-07 07:28:00'),(99,'Kibaale','2018-03-07 07:28:00','2018-03-07 07:28:00'),(100,'Kiruhura','2018-03-07 07:28:00','2018-03-07 07:28:00'),(101,'Kiryandongo','2018-03-07 07:28:00','2018-03-07 07:28:00'),(102,'Kisoro','2018-03-07 07:28:00','2018-03-07 07:28:00'),(103,'Kyegegwa','2018-03-07 07:28:00','2018-03-07 07:28:00'),(104,'Kyenjojo','2018-03-07 07:28:00','2018-03-07 07:28:00'),(105,'Masindi','2018-03-07 07:28:00','2018-03-07 07:28:00'),(106,'Mbarara','2018-03-07 07:28:00','2018-03-07 07:28:00'),(107,'Mitooma','2018-03-07 07:28:00','2018-03-07 07:28:00'),(108,'Ntoroko','2018-03-07 07:28:00','2018-03-07 07:28:00'),(109,'Ntungamo','2018-03-07 07:28:00','2018-03-07 07:28:00'),(110,'Rubirizi','2018-03-07 07:28:00','2018-03-07 07:28:00'),(111,'Rukungiri','2018-03-07 07:28:00','2018-03-07 07:28:00'),(112,'Sheema','2018-03-07 07:28:00','2018-03-07 07:28:00'),(113,'Omoro','2018-03-07 07:28:00','2018-03-07 07:28:00'),(114,'Kagadi','2018-03-07 07:28:00','2018-03-07 07:28:00'),(115,'Kakumiro','2018-03-07 07:28:00','2018-03-07 07:28:00'),(116,'Rubanda','2018-03-07 07:28:00','2018-03-07 07:28:00'),(117,'Bukwo','2018-03-07 07:28:00','2018-03-07 07:28:00');
/*!40000 ALTER TABLE `unhls_districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_drugs`
--

DROP TABLE IF EXISTS `unhls_drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_drugs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `formulation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `strength` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pack_size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unit_of_issue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `max_stock_level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `min_stock_level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_drugs`
--

LOCK TABLES `unhls_drugs` WRITE;
/*!40000 ALTER TABLE `unhls_drugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_equipment_breakdown`
--

DROP TABLE IF EXISTS `unhls_equipment_breakdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_equipment_breakdown` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `district_id` int(10) unsigned NOT NULL,
  `facility_id` int(10) unsigned NOT NULL,
  `year_id` int(10) unsigned NOT NULL,
  `equipment_id` int(10) unsigned NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `action_taken` text COLLATE utf8_unicode_ci NOT NULL,
  `hsd_request` text COLLATE utf8_unicode_ci NOT NULL,
  `in_charge_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `report_date` datetime DEFAULT NULL,
  `restored_by` int(11) DEFAULT NULL,
  `restore_date` datetime DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `breakdown_type` int(11) NOT NULL,
  `reported_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `breakdown_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unhls_equipment_breakdown_district_id_foreign` (`district_id`),
  KEY `unhls_equipment_breakdown_facility_id_foreign` (`facility_id`),
  KEY `unhls_equipment_breakdown_year_id_foreign` (`year_id`),
  KEY `unhls_equipment_breakdown_equipment_id_foreign` (`equipment_id`),
  CONSTRAINT `unhls_equipment_breakdown_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `unhls_districts` (`id`),
  CONSTRAINT `unhls_equipment_breakdown_equipment_id_foreign` FOREIGN KEY (`equipment_id`) REFERENCES `unhls_equipment_inventory` (`id`),
  CONSTRAINT `unhls_equipment_breakdown_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `unhls_facilities` (`id`),
  CONSTRAINT `unhls_equipment_breakdown_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `unhls_financial_years` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_equipment_breakdown`
--

LOCK TABLES `unhls_equipment_breakdown` WRITE;
/*!40000 ALTER TABLE `unhls_equipment_breakdown` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_equipment_breakdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_equipment_inventory`
--

DROP TABLE IF EXISTS `unhls_equipment_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_equipment_inventory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `district_id` int(10) unsigned NOT NULL,
  `facility_id` int(10) unsigned NOT NULL,
  `year_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serial_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` int(11) NOT NULL,
  `procurement_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_date` datetime NOT NULL,
  `delivery_date` datetime NOT NULL,
  `verification_date` datetime NOT NULL,
  `installation_date` datetime NOT NULL,
  `spare_parts` tinyint(1) NOT NULL,
  `warranty` int(11) NOT NULL,
  `life_span` int(11) NOT NULL,
  `service_frequency` tinyint(1) NOT NULL,
  `service_contract` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `supplier_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unhls_equipment_inventory_district_id_foreign` (`district_id`),
  KEY `unhls_equipment_inventory_facility_id_foreign` (`facility_id`),
  KEY `unhls_equipment_inventory_year_id_foreign` (`year_id`),
  KEY `unhls_equipment_inventory_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `unhls_equipment_inventory_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `unhls_districts` (`id`),
  CONSTRAINT `unhls_equipment_inventory_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `unhls_facilities` (`id`),
  CONSTRAINT `unhls_equipment_inventory_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `unhls_equipment_suppliers` (`id`),
  CONSTRAINT `unhls_equipment_inventory_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `unhls_financial_years` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_equipment_inventory`
--

LOCK TABLES `unhls_equipment_inventory` WRITE;
/*!40000 ALTER TABLE `unhls_equipment_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_equipment_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_equipment_maintenance`
--

DROP TABLE IF EXISTS `unhls_equipment_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_equipment_maintenance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `district_id` int(10) unsigned NOT NULL,
  `facility_id` int(10) unsigned NOT NULL,
  `year_id` int(10) unsigned NOT NULL,
  `equipment_id` int(10) unsigned NOT NULL,
  `last_service_date` datetime NOT NULL,
  `next_service_date` datetime NOT NULL,
  `serviced_by_name` text COLLATE utf8_unicode_ci NOT NULL,
  `serviced_by_contact` text COLLATE utf8_unicode_ci NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `unhls_equipment_maintenance_district_id_foreign` (`district_id`),
  KEY `unhls_equipment_maintenance_facility_id_foreign` (`facility_id`),
  KEY `unhls_equipment_maintenance_year_id_foreign` (`year_id`),
  KEY `unhls_equipment_maintenance_equipment_id_foreign` (`equipment_id`),
  CONSTRAINT `unhls_equipment_maintenance_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `unhls_districts` (`id`),
  CONSTRAINT `unhls_equipment_maintenance_equipment_id_foreign` FOREIGN KEY (`equipment_id`) REFERENCES `unhls_equipment_inventory` (`id`),
  CONSTRAINT `unhls_equipment_maintenance_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `unhls_facilities` (`id`),
  CONSTRAINT `unhls_equipment_maintenance_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `unhls_financial_years` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_equipment_maintenance`
--

LOCK TABLES `unhls_equipment_maintenance` WRITE;
/*!40000 ALTER TABLE `unhls_equipment_maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_equipment_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_equipment_suppliers`
--

DROP TABLE IF EXISTS `unhls_equipment_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_equipment_suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_equipment_suppliers`
--

LOCK TABLES `unhls_equipment_suppliers` WRITE;
/*!40000 ALTER TABLE `unhls_equipment_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_equipment_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_facilities`
--

DROP TABLE IF EXISTS `unhls_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_facilities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `district_id` int(10) unsigned NOT NULL,
  `level_id` int(10) unsigned NOT NULL,
  `ownership_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `unhls_facilities_level_id_foreign` (`level_id`),
  KEY `unhls_facilities_district_id_foreign` (`district_id`),
  KEY `unhls_facilities_ownership_id_foreign` (`ownership_id`),
  CONSTRAINT `unhls_facilities_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `unhls_districts` (`id`),
  CONSTRAINT `unhls_facilities_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `unhls_facility_level` (`id`),
  CONSTRAINT `unhls_facilities_ownership_id_foreign` FOREIGN KEY (`ownership_id`) REFERENCES `unhls_facility_ownership` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_facilities`
--

LOCK TABLES `unhls_facilities` WRITE;
/*!40000 ALTER TABLE `unhls_facilities` DISABLE KEYS */;
INSERT INTO `unhls_facilities` VALUES (1,'LBK1','CENTRAL PUBLIC HEALTH LABORATORIES',1,1,1,'2018-03-07 07:28:00','2018-03-07 07:28:00');
/*!40000 ALTER TABLE `unhls_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_facility_level`
--

DROP TABLE IF EXISTS `unhls_facility_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_facility_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_facility_level`
--

LOCK TABLES `unhls_facility_level` WRITE;
/*!40000 ALTER TABLE `unhls_facility_level` DISABLE KEYS */;
INSERT INTO `unhls_facility_level` VALUES (1,'Public NRH','2018-03-07 07:28:00','2018-03-07 07:28:00'),(2,'Public RRH','2018-03-07 07:28:00','2018-03-07 07:28:00'),(3,'Public GH','2018-03-07 07:28:00','2018-03-07 07:28:00'),(4,'Public HCIV','2018-03-07 07:28:00','2018-03-07 07:28:00'),(5,'Public HCIII','2018-03-07 07:28:00','2018-03-07 07:28:00'),(6,'Hospital','2018-03-07 07:28:00','2018-03-07 07:28:00');
/*!40000 ALTER TABLE `unhls_facility_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_facility_ownership`
--

DROP TABLE IF EXISTS `unhls_facility_ownership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_facility_ownership` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_facility_ownership`
--

LOCK TABLES `unhls_facility_ownership` WRITE;
/*!40000 ALTER TABLE `unhls_facility_ownership` DISABLE KEYS */;
INSERT INTO `unhls_facility_ownership` VALUES (1,'Public','2018-03-07 07:28:00','2018-03-07 07:28:00'),(2,'PFP','2018-03-07 07:28:00','2018-03-07 07:28:00'),(3,'PNFP','2018-03-07 07:28:00','2018-03-07 07:28:00'),(4,'Other','2018-03-07 07:28:00','2018-03-07 07:28:00');
/*!40000 ALTER TABLE `unhls_facility_ownership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_financial_years`
--

DROP TABLE IF EXISTS `unhls_financial_years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_financial_years` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_financial_years`
--

LOCK TABLES `unhls_financial_years` WRITE;
/*!40000 ALTER TABLE `unhls_financial_years` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_financial_years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_patients`
--

DROP TABLE IF EXISTS `unhls_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_patients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `patient_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ulin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `village_residence` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `village_workplace` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `occupation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_patient_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `unhls_patients_external_patient_number_index` (`external_patient_number`),
  KEY `unhls_patients_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_patients`
--

LOCK TABLES `unhls_patients` WRITE;
/*!40000 ALTER TABLE `unhls_patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_rejection_reasons`
--

DROP TABLE IF EXISTS `unhls_rejection_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_rejection_reasons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_rejection_reasons`
--

LOCK TABLES `unhls_rejection_reasons` WRITE;
/*!40000 ALTER TABLE `unhls_rejection_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_rejection_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_staff`
--

DROP TABLE IF EXISTS `unhls_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facility_id` int(10) unsigned NOT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `unhls_staff_facility_id_foreign` (`facility_id`),
  CONSTRAINT `unhls_staff_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `unhls_facilities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_staff`
--

LOCK TABLES `unhls_staff` WRITE;
/*!40000 ALTER TABLE `unhls_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_stockcard`
--

DROP TABLE IF EXISTS `unhls_stockcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_stockcard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `district_id` int(10) unsigned NOT NULL,
  `facility_id` int(10) unsigned NOT NULL,
  `year_id` int(10) unsigned NOT NULL,
  `commodity_id` int(10) unsigned NOT NULL,
  `to_from` int(11) NOT NULL,
  `to_from_type` int(11) NOT NULL,
  `voucher_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `issue_date` datetime NOT NULL,
  `expiry_date` datetime NOT NULL,
  `initials` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `balance` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `transaction_date` datetime DEFAULT NULL,
  `quantity_in` int(11) DEFAULT NULL,
  `quantity_out` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unhls_stockcard_district_id_foreign` (`district_id`),
  KEY `unhls_stockcard_facility_id_foreign` (`facility_id`),
  KEY `unhls_stockcard_year_id_foreign` (`year_id`),
  KEY `unhls_stockcard_commodity_id_foreign` (`commodity_id`),
  CONSTRAINT `unhls_stockcard_commodity_id_foreign` FOREIGN KEY (`commodity_id`) REFERENCES `commodities` (`id`),
  CONSTRAINT `unhls_stockcard_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `unhls_districts` (`id`),
  CONSTRAINT `unhls_stockcard_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `unhls_facilities` (`id`),
  CONSTRAINT `unhls_stockcard_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `unhls_financial_years` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_stockcard`
--

LOCK TABLES `unhls_stockcard` WRITE;
/*!40000 ALTER TABLE `unhls_stockcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_stockcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_stockrequisition`
--

DROP TABLE IF EXISTS `unhls_stockrequisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_stockrequisition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `district_id` int(10) unsigned NOT NULL,
  `facility_id` int(10) unsigned NOT NULL,
  `year_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `issued_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `voucher_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity_required` int(11) NOT NULL,
  `quantity_issued` int(11) NOT NULL,
  `issue_date` datetime NOT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `unhls_stockrequisition_district_id_foreign` (`district_id`),
  KEY `unhls_stockrequisition_facility_id_foreign` (`facility_id`),
  KEY `unhls_stockrequisition_year_id_foreign` (`year_id`),
  KEY `unhls_stockrequisition_item_id_foreign` (`item_id`),
  CONSTRAINT `unhls_stockrequisition_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `unhls_districts` (`id`),
  CONSTRAINT `unhls_stockrequisition_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `unhls_facilities` (`id`),
  CONSTRAINT `unhls_stockrequisition_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `commodities` (`id`),
  CONSTRAINT `unhls_stockrequisition_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `unhls_financial_years` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_stockrequisition`
--

LOCK TABLES `unhls_stockrequisition` WRITE;
/*!40000 ALTER TABLE `unhls_stockrequisition` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_stockrequisition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_test_results`
--

DROP TABLE IF EXISTS `unhls_test_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_test_results` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `test_id` int(10) unsigned NOT NULL,
  `measure_id` int(10) unsigned NOT NULL,
  `result` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sample_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unhls_test_results_test_id_measure_id_unique` (`test_id`,`measure_id`),
  KEY `unhls_test_results_measure_id_foreign` (`measure_id`),
  CONSTRAINT `unhls_test_results_measure_id_foreign` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`),
  CONSTRAINT `unhls_test_results_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `unhls_tests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_test_results`
--

LOCK TABLES `unhls_test_results` WRITE;
/*!40000 ALTER TABLE `unhls_test_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_test_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_tests`
--

DROP TABLE IF EXISTS `unhls_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_tests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visit_id` bigint(20) unsigned NOT NULL,
  `test_type_id` int(10) unsigned NOT NULL,
  `specimen_id` int(10) unsigned DEFAULT NULL,
  `interpretation` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `test_status_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned NOT NULL,
  `tested_by` int(10) unsigned NOT NULL DEFAULT '0',
  `verified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `requested_by` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `purpose` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_started` timestamp NULL DEFAULT NULL,
  `time_completed` timestamp NULL DEFAULT NULL,
  `time_verified` timestamp NULL DEFAULT NULL,
  `time_sent` timestamp NULL DEFAULT NULL,
  `external_id` int(11) DEFAULT NULL,
  `instrument` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unhls_tests_created_by_index` (`created_by`),
  KEY `unhls_tests_tested_by_index` (`tested_by`),
  KEY `unhls_tests_verified_by_index` (`verified_by`),
  KEY `unhls_tests_visit_id_foreign` (`visit_id`),
  KEY `unhls_tests_test_type_id_foreign` (`test_type_id`),
  KEY `unhls_tests_specimen_id_foreign` (`specimen_id`),
  KEY `unhls_tests_test_status_id_foreign` (`test_status_id`),
  CONSTRAINT `unhls_tests_specimen_id_foreign` FOREIGN KEY (`specimen_id`) REFERENCES `specimens` (`id`),
  CONSTRAINT `unhls_tests_test_status_id_foreign` FOREIGN KEY (`test_status_id`) REFERENCES `test_statuses` (`id`),
  CONSTRAINT `unhls_tests_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`),
  CONSTRAINT `unhls_tests_visit_id_foreign` FOREIGN KEY (`visit_id`) REFERENCES `unhls_visits` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_tests`
--

LOCK TABLES `unhls_tests` WRITE;
/*!40000 ALTER TABLE `unhls_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_visits`
--

DROP TABLE IF EXISTS `unhls_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_visits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int(10) unsigned NOT NULL,
  `visit_type` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Out-patient',
  `visit_number` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ward_id` int(11) DEFAULT NULL,
  `bed_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visit_status_id` int(11) DEFAULT NULL,
  `hospitalized` int(10) unsigned DEFAULT NULL,
  `on_antibiotics` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unhls_visits_visit_number_index` (`visit_number`),
  KEY `unhls_visits_patient_id_foreign` (`patient_id`),
  CONSTRAINT `unhls_visits_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `unhls_patients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_visits`
--

LOCK TABLES `unhls_visits` WRITE;
/*!40000 ALTER TABLE `unhls_visits` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_warehouse`
--

DROP TABLE IF EXISTS `unhls_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unhls_warehouse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_warehouse`
--

LOCK TABLES `unhls_warehouse` WRITE;
/*!40000 ALTER TABLE `unhls_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT '0',
  `designation` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facility_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `phone_contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_facility_id_foreign` (`facility_id`),
  CONSTRAINT `users_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `unhls_facilities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'administrator','$2y$10$ywwQ0ixtAOexXHZ2SnTXVumi4qwWYEHyLJJCco02HuqioakETSprW','','A-LIS Admin',0,'Systems Administrator',NULL,NULL,1,NULL,'2018-03-07 07:28:00','2018-03-07 07:28:00',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uuids`
--

DROP TABLE IF EXISTS `uuids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uuids` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `counter` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uuids`
--

LOCK TABLES `uuids` WRITE;
/*!40000 ALTER TABLE `uuids` DISABLE KEYS */;
/*!40000 ALTER TABLE `uuids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_statuses`
--

DROP TABLE IF EXISTS `visit_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_statuses`
--

LOCK TABLES `visit_statuses` WRITE;
/*!40000 ALTER TABLE `visit_statuses` DISABLE KEYS */;
INSERT INTO `visit_statuses` VALUES (1,'appointment-made'),(2,'test-request-made'),(3,'specimen_received'),(4,'tests-completed');
/*!40000 ALTER TABLE `visit_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wards`
--

DROP TABLE IF EXISTS `wards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wards`
--

LOCK TABLES `wards` WRITE;
/*!40000 ALTER TABLE `wards` DISABLE KEYS */;
/*!40000 ALTER TABLE `wards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone_diameters`
--

DROP TABLE IF EXISTS `zone_diameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone_diameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `drug_id` int(10) unsigned NOT NULL,
  `organism_id` int(10) unsigned NOT NULL,
  `resistant_max` decimal(4,1) DEFAULT NULL,
  `intermediate_min` decimal(4,1) DEFAULT NULL,
  `intermediate_max` decimal(4,1) DEFAULT NULL,
  `sensitive_min` decimal(4,1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zone_diameters_drug_id_foreign` (`drug_id`),
  KEY `zone_diameters_organism_id_foreign` (`organism_id`),
  CONSTRAINT `zone_diameters_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`),
  CONSTRAINT `zone_diameters_organism_id_foreign` FOREIGN KEY (`organism_id`) REFERENCES `organisms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_diameters`
--

LOCK TABLES `zone_diameters` WRITE;
/*!40000 ALTER TABLE `zone_diameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `zone_diameters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-16 18:37:16
