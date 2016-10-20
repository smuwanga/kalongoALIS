-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2016 at 12:00 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iblis`
--
DROP DATABASE `iblis`;
CREATE DATABASE IF NOT EXISTS `iblis` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `iblis`;

-- --------------------------------------------------------

--
-- Table structure for table `assigned_roles`
--

DROP TABLE IF EXISTS `assigned_roles`;
CREATE TABLE `assigned_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `assigned_roles`
--

INSERT INTO `assigned_roles` (`id`, `user_id`, `role_id`) VALUES(1, 1, 1);
INSERT INTO `assigned_roles` (`id`, `user_id`, `role_id`) VALUES(2, 1, 1);
INSERT INTO `assigned_roles` (`id`, `user_id`, `role_id`) VALUES(3, 1, 2);
INSERT INTO `assigned_roles` (`id`, `user_id`, `role_id`) VALUES(4, 1, 3);
INSERT INTO `assigned_roles` (`id`, `user_id`, `role_id`) VALUES(5, 1, 1);
INSERT INTO `assigned_roles` (`id`, `user_id`, `role_id`) VALUES(6, 1, 2);
INSERT INTO `assigned_roles` (`id`, `user_id`, `role_id`) VALUES(7, 1, 3);
INSERT INTO `assigned_roles` (`id`, `user_id`, `role_id`) VALUES(8, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `barcode_settings`
--

DROP TABLE IF EXISTS `barcode_settings`;
CREATE TABLE `barcode_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `encoding_format` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `barcode_width` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `barcode_height` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `text_size` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `barcode_settings`
--

INSERT INTO `barcode_settings` (`id`, `encoding_format`, `barcode_width`, `barcode_height`, `text_size`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, 'code39', '2', '30', '11', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `commodities`
--

DROP TABLE IF EXISTS `commodities`;
CREATE TABLE `commodities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `metric_id` int(10) UNSIGNED NOT NULL,
  `unit_price` decimal(8,2) NOT NULL,
  `item_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `storage_req` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `min_level` int(11) NOT NULL,
  `max_level` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `commodities`
--

INSERT INTO `commodities` (`id`, `name`, `description`, `metric_id`, `unit_price`, `item_code`, `storage_req`, `min_level`, `max_level`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, 'Ampicillin', 'Capsule 250mg', 1, '500.00', 'no clue', 'no clue', 100000, 400000, NULL, '2016-08-01 07:32:08', '2016-08-01 07:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `control_measure_ranges`
--

DROP TABLE IF EXISTS `control_measure_ranges`;
CREATE TABLE `control_measure_ranges` (
  `id` int(10) UNSIGNED NOT NULL,
  `upper_range` decimal(6,2) DEFAULT NULL,
  `lower_range` decimal(6,2) DEFAULT NULL,
  `alphanumeric` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `control_measure_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `control_measure_ranges`
--

INSERT INTO `control_measure_ranges` (`id`, `upper_range`, `lower_range`, `alphanumeric`, `control_measure_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, '2.63', '7.19', NULL, 1, NULL, '2016-08-01 07:32:10', '2016-08-01 07:32:10');
INSERT INTO `control_measure_ranges` (`id`, `upper_range`, `lower_range`, `alphanumeric`, `control_measure_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(2, '11.65', '15.43', NULL, 2, NULL, '2016-08-01 07:32:10', '2016-08-01 07:32:10');
INSERT INTO `control_measure_ranges` (`id`, `upper_range`, `lower_range`, `alphanumeric`, `control_measure_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(3, '12.13', '19.11', NULL, 3, NULL, '2016-08-01 07:32:10', '2016-08-01 07:32:10');
INSERT INTO `control_measure_ranges` (`id`, `upper_range`, `lower_range`, `alphanumeric`, `control_measure_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(4, '15.73', '25.01', NULL, 4, NULL, '2016-08-01 07:32:10', '2016-08-01 07:32:10');
INSERT INTO `control_measure_ranges` (`id`, `upper_range`, `lower_range`, `alphanumeric`, `control_measure_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(5, '17.63', '20.12', NULL, 5, NULL, '2016-08-01 07:32:11', '2016-08-01 07:32:11');
INSERT INTO `control_measure_ranges` (`id`, `upper_range`, `lower_range`, `alphanumeric`, `control_measure_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(6, '6.50', '7.50', NULL, 6, NULL, '2016-08-01 07:32:11', '2016-08-01 07:32:11');
INSERT INTO `control_measure_ranges` (`id`, `upper_range`, `lower_range`, `alphanumeric`, `control_measure_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(7, '4.36', '5.78', NULL, 7, NULL, '2016-08-01 07:32:11', '2016-08-01 07:32:11');
INSERT INTO `control_measure_ranges` (`id`, `upper_range`, `lower_range`, `alphanumeric`, `control_measure_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(8, '13.80', '17.30', NULL, 8, NULL, '2016-08-01 07:32:11', '2016-08-01 07:32:11');
INSERT INTO `control_measure_ranges` (`id`, `upper_range`, `lower_range`, `alphanumeric`, `control_measure_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(9, '81.00', '95.00', NULL, 9, NULL, '2016-08-01 07:32:11', '2016-08-01 07:32:11');
INSERT INTO `control_measure_ranges` (`id`, `upper_range`, `lower_range`, `alphanumeric`, `control_measure_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(10, '1.99', '2.63', NULL, 10, NULL, '2016-08-01 07:32:11', '2016-08-01 07:32:11');
INSERT INTO `control_measure_ranges` (`id`, `upper_range`, `lower_range`, `alphanumeric`, `control_measure_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(11, '27.60', '33.00', NULL, 11, NULL, '2016-08-01 07:32:11', '2016-08-01 07:32:11');
INSERT INTO `control_measure_ranges` (`id`, `upper_range`, `lower_range`, `alphanumeric`, `control_measure_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(12, '32.80', '36.40', NULL, 12, NULL, '2016-08-01 07:32:11', '2016-08-01 07:32:11');
INSERT INTO `control_measure_ranges` (`id`, `upper_range`, `lower_range`, `alphanumeric`, `control_measure_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(13, '141.00', '320.00', NULL, 13, NULL, '2016-08-01 07:32:11', '2016-08-01 07:32:11');

-- --------------------------------------------------------

--
-- Table structure for table `control_measures`
--

DROP TABLE IF EXISTS `control_measures`;
CREATE TABLE `control_measures` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `control_id` int(10) UNSIGNED NOT NULL,
  `control_measure_type_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `control_measures`
--

INSERT INTO `control_measures` (`id`, `name`, `unit`, `control_id`, `control_measure_type_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, 'ca', 'mmol', 1, 1, NULL, '2016-08-01 07:32:09', '2016-08-01 07:32:09');
INSERT INTO `control_measures` (`id`, `name`, `unit`, `control_id`, `control_measure_type_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(2, 'pi', 'mmol', 1, 1, NULL, '2016-08-01 07:32:09', '2016-08-01 07:32:09');
INSERT INTO `control_measures` (`id`, `name`, `unit`, `control_id`, `control_measure_type_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(3, 'mg', 'mmol', 1, 1, NULL, '2016-08-01 07:32:09', '2016-08-01 07:32:09');
INSERT INTO `control_measures` (`id`, `name`, `unit`, `control_id`, `control_measure_type_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(4, 'na', 'mmol', 1, 1, NULL, '2016-08-01 07:32:10', '2016-08-01 07:32:10');
INSERT INTO `control_measures` (`id`, `name`, `unit`, `control_id`, `control_measure_type_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(5, 'K', 'mmol', 1, 1, NULL, '2016-08-01 07:32:10', '2016-08-01 07:32:10');
INSERT INTO `control_measures` (`id`, `name`, `unit`, `control_id`, `control_measure_type_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(6, 'WBC', 'x 103/uL', 2, 1, NULL, '2016-08-01 07:32:10', '2016-08-01 07:32:10');
INSERT INTO `control_measures` (`id`, `name`, `unit`, `control_id`, `control_measure_type_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(7, 'RBC', 'x 106/uL', 2, 1, NULL, '2016-08-01 07:32:10', '2016-08-01 07:32:10');
INSERT INTO `control_measures` (`id`, `name`, `unit`, `control_id`, `control_measure_type_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(8, 'HGB', 'g/dl', 2, 1, NULL, '2016-08-01 07:32:10', '2016-08-01 07:32:10');
INSERT INTO `control_measures` (`id`, `name`, `unit`, `control_id`, `control_measure_type_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(9, 'HCT', '%', 2, 1, NULL, '2016-08-01 07:32:10', '2016-08-01 07:32:10');
INSERT INTO `control_measures` (`id`, `name`, `unit`, `control_id`, `control_measure_type_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(10, 'MCV', 'fl', 2, 1, NULL, '2016-08-01 07:32:10', '2016-08-01 07:32:10');
INSERT INTO `control_measures` (`id`, `name`, `unit`, `control_id`, `control_measure_type_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(11, 'MCH', 'pg', 2, 1, NULL, '2016-08-01 07:32:10', '2016-08-01 07:32:10');
INSERT INTO `control_measures` (`id`, `name`, `unit`, `control_id`, `control_measure_type_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(12, 'MCHC', 'g/dl', 2, 1, NULL, '2016-08-01 07:32:10', '2016-08-01 07:32:10');
INSERT INTO `control_measures` (`id`, `name`, `unit`, `control_id`, `control_measure_type_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(13, 'PLT', 'x 103/uL', 2, 1, NULL, '2016-08-01 07:32:10', '2016-08-01 07:32:10');

-- --------------------------------------------------------

--
-- Table structure for table `control_results`
--

DROP TABLE IF EXISTS `control_results`;
CREATE TABLE `control_results` (
  `id` int(10) UNSIGNED NOT NULL,
  `results` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `control_measure_id` int(10) UNSIGNED NOT NULL,
  `control_test_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `control_results`
--

INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(1, '2.78', 1, 1, '2016-07-21 21:00:00', '2016-08-01 07:32:12');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(2, '13.56', 2, 1, '2016-07-21 21:00:00', '2016-08-01 07:32:13');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(3, '14.77', 3, 1, '2016-07-21 21:00:00', '2016-08-01 07:32:13');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(4, '25.92', 4, 1, '2016-07-21 21:00:00', '2016-08-01 07:32:13');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(5, '18.87', 5, 1, '2016-07-21 21:00:00', '2016-08-01 07:32:13');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(6, '6.78', 1, 2, '2016-07-22 21:00:00', '2016-08-01 07:32:13');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(7, '15.56', 2, 2, '2016-07-22 21:00:00', '2016-08-01 07:32:13');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(8, '18.77', 3, 2, '2016-07-22 21:00:00', '2016-08-01 07:32:13');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(9, '30.92', 4, 2, '2016-07-22 21:00:00', '2016-08-01 07:32:13');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(10, '17.87', 5, 2, '2016-07-22 21:00:00', '2016-08-01 07:32:13');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(11, '8.78', 1, 3, '2016-07-23 21:00:00', '2016-08-01 07:32:13');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(12, '17.56', 2, 3, '2016-07-23 21:00:00', '2016-08-01 07:32:13');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(13, '21.77', 3, 3, '2016-07-23 21:00:00', '2016-08-01 07:32:13');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(14, '27.92', 4, 3, '2016-07-23 21:00:00', '2016-08-01 07:32:13');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(15, '22.87', 5, 3, '2016-07-23 21:00:00', '2016-08-01 07:32:13');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(16, '6.78', 1, 4, '2016-07-24 21:00:00', '2016-08-01 07:32:13');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(17, '18.56', 2, 4, '2016-07-24 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(18, '19.77', 3, 4, '2016-07-24 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(19, '12.92', 4, 4, '2016-07-24 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(20, '22.87', 5, 4, '2016-07-24 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(21, '3.78', 1, 5, '2016-07-25 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(22, '16.56', 2, 5, '2016-07-25 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(23, '17.77', 3, 5, '2016-07-25 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(24, '28.92', 4, 5, '2016-07-25 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(25, '19.87', 5, 5, '2016-07-25 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(26, '5.78', 1, 6, '2016-07-26 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(27, '15.56', 2, 6, '2016-07-26 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(28, '11.77', 3, 6, '2016-07-26 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(29, '29.92', 4, 6, '2016-07-26 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(30, '14.87', 5, 6, '2016-07-26 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(31, '9.78', 1, 7, '2016-07-27 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(32, '11.56', 2, 7, '2016-07-27 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(33, '19.77', 3, 7, '2016-07-27 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(34, '32.92', 4, 7, '2016-07-27 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(35, '29.87', 5, 7, '2016-07-27 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(36, '5.45', 6, 8, '2016-07-28 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(37, '5.01', 7, 8, '2016-07-28 21:00:00', '2016-08-01 07:32:14');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(38, '12.3', 8, 8, '2016-07-28 21:00:00', '2016-08-01 07:32:15');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(39, '89.7', 9, 8, '2016-07-28 21:00:00', '2016-08-01 07:32:15');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(40, '2.15', 10, 8, '2016-07-28 21:00:00', '2016-08-01 07:32:15');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(41, '34.0', 11, 8, '2016-07-28 21:00:00', '2016-08-01 07:32:15');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(42, '37.2', 12, 8, '2016-07-28 21:00:00', '2016-08-01 07:32:15');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(43, '141.5', 13, 8, '2016-07-28 21:00:00', '2016-08-01 07:32:15');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(44, '7.45', 6, 9, '2016-07-29 21:00:00', '2016-08-01 07:32:15');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(45, '9.01', 7, 9, '2016-07-29 21:00:00', '2016-08-01 07:32:15');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(46, '9.3', 8, 9, '2016-07-29 21:00:00', '2016-08-01 07:32:15');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(47, '94.7', 9, 9, '2016-07-29 21:00:00', '2016-08-01 07:32:15');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(48, '12.15', 10, 9, '2016-07-29 21:00:00', '2016-08-01 07:32:15');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(49, '37.0', 11, 9, '2016-07-29 21:00:00', '2016-08-01 07:32:15');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(50, '30.2', 12, 9, '2016-07-29 21:00:00', '2016-08-01 07:32:15');
INSERT INTO `control_results` (`id`, `results`, `control_measure_id`, `control_test_id`, `created_at`, `updated_at`) VALUES(51, '121.5', 13, 9, '2016-07-29 21:00:00', '2016-08-01 07:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `control_tests`
--

DROP TABLE IF EXISTS `control_tests`;
CREATE TABLE `control_tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `entered_by` int(10) UNSIGNED NOT NULL,
  `control_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `control_tests`
--

INSERT INTO `control_tests` (`id`, `entered_by`, `control_id`, `created_at`, `updated_at`) VALUES(1, 3, 1, '2016-07-21 21:00:00', '2016-08-01 07:32:11');
INSERT INTO `control_tests` (`id`, `entered_by`, `control_id`, `created_at`, `updated_at`) VALUES(2, 3, 1, '2016-07-22 21:00:00', '2016-08-01 07:32:11');
INSERT INTO `control_tests` (`id`, `entered_by`, `control_id`, `created_at`, `updated_at`) VALUES(3, 3, 1, '2016-07-23 21:00:00', '2016-08-01 07:32:12');
INSERT INTO `control_tests` (`id`, `entered_by`, `control_id`, `created_at`, `updated_at`) VALUES(4, 3, 1, '2016-07-24 21:00:00', '2016-08-01 07:32:12');
INSERT INTO `control_tests` (`id`, `entered_by`, `control_id`, `created_at`, `updated_at`) VALUES(5, 3, 1, '2016-07-25 21:00:00', '2016-08-01 07:32:12');
INSERT INTO `control_tests` (`id`, `entered_by`, `control_id`, `created_at`, `updated_at`) VALUES(6, 3, 1, '2016-07-26 21:00:00', '2016-08-01 07:32:12');
INSERT INTO `control_tests` (`id`, `entered_by`, `control_id`, `created_at`, `updated_at`) VALUES(7, 3, 1, '2016-07-27 21:00:00', '2016-08-01 07:32:12');
INSERT INTO `control_tests` (`id`, `entered_by`, `control_id`, `created_at`, `updated_at`) VALUES(8, 1, 2, '2016-07-28 21:00:00', '2016-08-01 07:32:12');
INSERT INTO `control_tests` (`id`, `entered_by`, `control_id`, `created_at`, `updated_at`) VALUES(9, 1, 2, '2016-07-29 21:00:00', '2016-08-01 07:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `controls`
--

DROP TABLE IF EXISTS `controls`;
CREATE TABLE `controls` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lot_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `controls`
--

INSERT INTO `controls` (`id`, `name`, `description`, `lot_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(1, 'Humatrol P', 'HUMATROL P control serum has been designed to provide a suitable basis for the quality control (imprecision, inaccuracy) in the clinical chemical laboratory.', 1, '2016-08-01 07:32:09', '2016-08-01 07:32:09', NULL);
INSERT INTO `controls` (`id`, `name`, `description`, `lot_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(2, 'Full Blood Count', 'Né pas touchér', 1, '2016-08-01 07:32:09', '2016-08-01 07:32:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `culture_worksheet`
--

DROP TABLE IF EXISTS `culture_worksheet`;
CREATE TABLE `culture_worksheet` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `test_id` int(10) UNSIGNED NOT NULL,
  `observation` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

DROP TABLE IF EXISTS `diseases`;
CREATE TABLE `diseases` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`id`, `name`) VALUES(1, 'Malaria');
INSERT INTO `diseases` (`id`, `name`) VALUES(2, 'Typhoid');
INSERT INTO `diseases` (`id`, `name`) VALUES(3, 'Shigella Dysentry');

-- --------------------------------------------------------

--
-- Table structure for table `drug_susceptibility`
--

DROP TABLE IF EXISTS `drug_susceptibility`;
CREATE TABLE `drug_susceptibility` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `test_id` int(10) UNSIGNED NOT NULL,
  `organism_id` int(10) UNSIGNED NOT NULL,
  `drug_id` int(10) UNSIGNED NOT NULL,
  `zone` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `interpretation` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

DROP TABLE IF EXISTS `drugs`;
CREATE TABLE `drugs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equip_config`
--

DROP TABLE IF EXISTS `equip_config`;
CREATE TABLE `equip_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `equip_id` int(10) UNSIGNED NOT NULL,
  `prop_id` int(10) UNSIGNED NOT NULL,
  `prop_value` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `equip_config`
--

INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, 1, 1, '5150', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(2, 1, 2, 'client', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(3, 1, 3, 'chameleon', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(4, 1, 4, 'yes', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(5, 3, 5, '10', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(6, 3, 6, '9600', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(7, 3, 7, 'None', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(8, 3, 8, '1', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(9, 3, 9, 'No', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(10, 3, 10, '8', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(11, 3, 11, 'No', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(12, 2, 12, 'create ODBC datasource to the equipment db and put', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(13, 2, 13, '0', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(14, 4, 5, '10', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(15, 4, 6, '9600', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(16, 4, 7, 'None', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(17, 4, 8, '1', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(18, 4, 9, 'No', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(19, 4, 10, '8', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(20, 4, 11, 'No', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(21, 5, 1, '5150', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(22, 5, 2, 'server', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(23, 5, 3, 'no', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(24, 5, 4, 'set the Analyzer PC IP address here', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(25, 6, 14, '', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(26, 6, 15, '', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(27, 6, 16, '', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(28, 6, 17, '', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(29, 6, 18, '', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(30, 6, 19, '', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(31, 7, 5, '10', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(32, 7, 6, '9600', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(33, 7, 7, 'None', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(34, 7, 8, '1', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(35, 7, 9, 'No', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(36, 7, 10, '8', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(37, 7, 11, 'No', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(38, 8, 5, '10', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(39, 8, 6, '9600', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(40, 8, 7, 'None', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(41, 8, 8, '1', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(42, 8, 9, 'No', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(43, 8, 10, '8', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(44, 8, 11, 'No', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(45, 9, 1, '5150', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(46, 9, 2, 'server', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(47, 9, 3, 'no', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(48, 9, 4, 'set the Analyzer PC IP address here', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(49, 10, 5, '10', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(50, 10, 6, '9600', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(51, 10, 7, 'None', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(52, 10, 8, '1', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(53, 10, 9, 'No', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(54, 10, 10, '8', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(55, 10, 11, 'No', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(56, 11, 1, '5150', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(57, 11, 2, 'server', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(58, 11, 3, 'no', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(59, 11, 4, 'set the Analyzer PC IP address here', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(60, 12, 1, '5150', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(61, 12, 2, 'server', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(62, 12, 3, 'no', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `equip_config` (`id`, `equip_id`, `prop_id`, `prop_value`, `deleted_at`, `created_at`, `updated_at`) VALUES(63, 12, 4, 'set the Analyzer PC IP address here', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `external_dump`
--

DROP TABLE IF EXISTS `external_dump`;
CREATE TABLE `external_dump` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `external_dump`
--

INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(1, 596699, 0, 16, 'frankenstein Dr', 'Urinalysis', '', '2014-10-14 07:20:35', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:58', '2016-08-01 07:31:58');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(2, 596700, 596699, NULL, 'frankenstein Dr', 'Urine microscopy', '', '2014-10-14 07:20:35', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:58', '2016-08-01 07:31:58');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(3, 596701, 596700, NULL, 'frankenstein Dr', 'Pus cells', '', '2014-10-14 07:20:35', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:58', '2016-08-01 07:31:58');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(4, 596702, 596700, NULL, 'frankenstein Dr', 'S. haematobium', '', '2014-10-14 07:20:35', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:58', '2016-08-01 07:31:58');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(5, 596703, 596700, NULL, 'frankenstein Dr', 'T. vaginalis', '', '2014-10-14 07:20:35', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:58', '2016-08-01 07:31:58');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(6, 596704, 596700, NULL, 'frankenstein Dr', 'Yeast cells', '', '2014-10-14 07:20:35', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:58', '2016-08-01 07:31:58');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(7, 596705, 596700, NULL, 'frankenstein Dr', 'Red blood cells', '', '2014-10-14 07:20:35', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:58', '2016-08-01 07:31:58');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(8, 596706, 596700, NULL, 'frankenstein Dr', 'Bacteria', '', '2014-10-14 07:20:36', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:58', '2016-08-01 07:31:58');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(9, 596707, 596700, NULL, 'frankenstein Dr', 'Spermatozoa', '', '2014-10-14 07:20:36', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:58', '2016-08-01 07:31:58');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(10, 596708, 596700, NULL, 'frankenstein Dr', 'Epithelial cells', '', '2014-10-14 07:20:36', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:58', '2016-08-01 07:31:58');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(11, 596709, 596700, NULL, 'frankenstein Dr', 'ph', '', '2014-10-14 07:20:36', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:59', '2016-08-01 07:31:59');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(12, 596710, 596699, NULL, 'frankenstein Dr', 'Urine chemistry', '', '2014-10-14 07:20:36', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:59', '2016-08-01 07:31:59');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(13, 596711, 596710, NULL, 'frankenstein Dr', 'Glucose', '', '2014-10-14 07:20:36', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:59', '2016-08-01 07:31:59');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(14, 596712, 596710, NULL, 'frankenstein Dr', 'Ketones', '', '2014-10-14 07:20:36', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:59', '2016-08-01 07:31:59');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(15, 596713, 596710, NULL, 'frankenstein Dr', 'Proteins', '', '2014-10-14 07:20:36', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:59', '2016-08-01 07:31:59');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(16, 596714, 596710, NULL, 'frankenstein Dr', 'Blood', '', '2014-10-14 07:20:36', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:59', '2016-08-01 07:31:59');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(17, 596715, 596710, NULL, 'frankenstein Dr', 'Bilirubin', '', '2014-10-14 07:20:36', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:31:59', '2016-08-01 07:31:59');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(18, 596716, 596710, NULL, 'frankenstein Dr', 'Urobilinogen Phenlpyruvic acid', '', '2014-10-14 07:20:37', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:32:00', '2016-08-01 07:32:00');
INSERT INTO `external_dump` (`id`, `lab_no`, `parent_lab_no`, `test_id`, `requesting_clinician`, `investigation`, `provisional_diagnosis`, `request_date`, `order_stage`, `result`, `result_returned`, `patient_visit_number`, `patient_id`, `full_name`, `dob`, `gender`, `address`, `postal_code`, `phone_number`, `city`, `cost`, `receipt_number`, `receipt_type`, `waiver_no`, `system_id`, `created_at`, `updated_at`) VALUES(19, 596717, 596710, NULL, 'frankenstein Dr', 'pH', '', '2014-10-14 07:20:37', 'ip', NULL, NULL, 643660, 326983, 'Macau Macau', '1996-10-09 00:00:00', 'Female', NULL, '', '', NULL, NULL, NULL, NULL, '', 'sanitas', '2016-08-01 07:32:00', '2016-08-01 07:32:00');

-- --------------------------------------------------------

--
-- Table structure for table `external_users`
--

DROP TABLE IF EXISTS `external_users`;
CREATE TABLE `external_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `internal_user_id` int(10) UNSIGNED NOT NULL,
  `external_user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
CREATE TABLE `facilities` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ownership` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `code`, `name`, `level`, `ownership`, `created_at`, `updated_at`) VALUES(1, '', 'WALTER REED', '', '', '2016-08-01 07:32:07', '2016-08-01 07:32:07');
INSERT INTO `facilities` (`id`, `code`, `name`, `level`, `ownership`, `created_at`, `updated_at`) VALUES(2, 'BHG', 'Bihanga HC II', 'HCII', 'Private', '2016-08-01 07:32:07', '2016-08-01 07:32:07');
INSERT INTO `facilities` (`id`, `code`, `name`, `level`, `ownership`, `created_at`, `updated_at`) VALUES(3, '', 'TEL AVIV GENERAL HOSPITAL', '', '', '2016-08-01 07:32:07', '2016-08-01 07:32:07');
INSERT INTO `facilities` (`id`, `code`, `name`, `level`, `ownership`, `created_at`, `updated_at`) VALUES(4, '', 'GK PRISON DISPENSARY', '', '', '2016-08-01 07:32:07', '2016-08-01 07:32:07');
INSERT INTO `facilities` (`id`, `code`, `name`, `level`, `ownership`, `created_at`, `updated_at`) VALUES(5, '', 'KEMRI ALUPE', '', '', '2016-08-01 07:32:07', '2016-08-01 07:32:07');
INSERT INTO `facilities` (`id`, `code`, `name`, `level`, `ownership`, `created_at`, `updated_at`) VALUES(6, '', 'AMPATH', '', '', '2016-08-01 07:32:08', '2016-08-01 07:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `ii_quickcodes`
--

DROP TABLE IF EXISTS `ii_quickcodes`;
CREATE TABLE `ii_quickcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `feed_source` tinyint(4) NOT NULL,
  `config_prop` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ii_quickcodes`
--

INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, 1, 'PORT', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(2, 1, 'MODE', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(3, 1, 'CLIENT_RECONNECT', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(4, 1, 'EQUIPMENT_IP', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(5, 0, 'COMPORT', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(6, 0, 'BAUD_RATE', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(7, 0, 'PARITY', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(8, 0, 'STOP_BITS', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(9, 0, 'APPEND_NEWLINE', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(10, 0, 'DATA_BITS', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(11, 0, 'APPEND_CARRIAGE_RETURN', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(12, 2, 'DATASOURCE', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(13, 2, 'DAYS', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(14, 4, 'BASE_DIRECTORY', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(15, 4, 'USE_SUB_DIRECTORIES', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(16, 4, 'SUB_DIRECTORY_FORMAT', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(17, 4, 'FILE_NAME_FORMAT', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(18, 4, 'FILE_EXTENSION', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');
INSERT INTO `ii_quickcodes` (`id`, `feed_source`, `config_prop`, `deleted_at`, `created_at`, `updated_at`) VALUES(19, 4, 'FILE_SEPERATOR', NULL, '2016-08-01 07:32:15', '2016-08-01 07:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `instrument_testtypes`
--

DROP TABLE IF EXISTS `instrument_testtypes`;
CREATE TABLE `instrument_testtypes` (
  `instrument_id` int(10) UNSIGNED NOT NULL,
  `test_type_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `instrument_testtypes`
--

INSERT INTO `instrument_testtypes` (`instrument_id`, `test_type_id`) VALUES(1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `instruments`
--

DROP TABLE IF EXISTS `instruments`;
CREATE TABLE `instruments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hostname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `driver_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `instruments`
--

INSERT INTO `instruments` (`id`, `name`, `ip`, `hostname`, `description`, `driver_name`, `created_at`, `updated_at`) VALUES(1, 'Celltac F Mek 8222', '192.168.1.12', 'HEMASERVER', 'Automatic analyzer with 22 parameters and WBC 5 part diff Hematology Analyzer', 'KBLIS\\Plugins\\CelltacFMachine', '2016-08-01 07:31:58', '2016-08-01 07:31:58');

-- --------------------------------------------------------

--
-- Table structure for table `interfaced_equipment`
--

DROP TABLE IF EXISTS `interfaced_equipment`;
CREATE TABLE `interfaced_equipment` (
  `id` int(10) UNSIGNED NOT NULL,
  `equipment_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `comm_type` tinyint(4) NOT NULL,
  `equipment_version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lab_section` int(10) UNSIGNED NOT NULL,
  `feed_source` tinyint(4) NOT NULL,
  `config_file` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `interfaced_equipment`
--

INSERT INTO `interfaced_equipment` (`id`, `equipment_name`, `comm_type`, `equipment_version`, `lab_section`, `feed_source`, `config_file`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, 'Mindray BS-200E', 2, '01.00.07', 1, 1, '\\BLISInterfaceClient\\configs\\BT3000Plus\\bt3000pluschameleon.xml', NULL, '2016-08-01 07:32:16', '2016-08-01 07:32:16');
INSERT INTO `interfaced_equipment` (`id`, `equipment_name`, `comm_type`, `equipment_version`, `lab_section`, `feed_source`, `config_file`, `deleted_at`, `created_at`, `updated_at`) VALUES(2, 'ABX Pentra 60 C+', 2, '', 1, 2, '\\BLISInterfaceClient\\configs\\pentra\\pentra60cplus.xml', NULL, '2016-08-01 07:32:16', '2016-08-01 07:32:16');
INSERT INTO `interfaced_equipment` (`id`, `equipment_name`, `comm_type`, `equipment_version`, `lab_section`, `feed_source`, `config_file`, `deleted_at`, `created_at`, `updated_at`) VALUES(3, 'ABX MACROS 60', 1, '', 1, 0, '\\BLISInterfaceClient\\configs\\micros60\\abxmicros60.xml', NULL, '2016-08-01 07:32:16', '2016-08-01 07:32:16');
INSERT INTO `interfaced_equipment` (`id`, `equipment_name`, `comm_type`, `equipment_version`, `lab_section`, `feed_source`, `config_file`, `deleted_at`, `created_at`, `updated_at`) VALUES(4, 'BT 3000 Plus', 1, '', 1, 0, '\\BLISInterfaceClient\\configs\\BT3000Plus\\bt3000plus.xml', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `interfaced_equipment` (`id`, `equipment_name`, `comm_type`, `equipment_version`, `lab_section`, `feed_source`, `config_file`, `deleted_at`, `created_at`, `updated_at`) VALUES(5, 'Sysmex SX 500i', 1, '', 1, 1, '\\BLISInterfaceClient\\configs\\SYSMEX\\SYSMEXXS500i.xml', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `interfaced_equipment` (`id`, `equipment_name`, `comm_type`, `equipment_version`, `lab_section`, `feed_source`, `config_file`, `deleted_at`, `created_at`, `updated_at`) VALUES(6, 'BD FACSCalibur', 1, '', 1, 4, '\\BLISInterfaceClient\\configs\\BDFACSCalibur\\bdfacscalibur.xml', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `interfaced_equipment` (`id`, `equipment_name`, `comm_type`, `equipment_version`, `lab_section`, `feed_source`, `config_file`, `deleted_at`, `created_at`, `updated_at`) VALUES(7, 'Mindray BC 3600', 1, '', 1, 0, '\\BLISInterfaceClient\\configs\\mindray\\mindraybc3600.xml', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `interfaced_equipment` (`id`, `equipment_name`, `comm_type`, `equipment_version`, `lab_section`, `feed_source`, `config_file`, `deleted_at`, `created_at`, `updated_at`) VALUES(8, 'Selectra Junior', 1, '', 1, 0, '\\BLISInterfaceClient\\configs\\selectrajunior\\selectrajunior.xml', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `interfaced_equipment` (`id`, `equipment_name`, `comm_type`, `equipment_version`, `lab_section`, `feed_source`, `config_file`, `deleted_at`, `created_at`, `updated_at`) VALUES(9, 'GeneXpert', 2, '', 1, 1, '\\BLISInterfaceClient\\configs\\geneXpert\\genexpert.xml', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `interfaced_equipment` (`id`, `equipment_name`, `comm_type`, `equipment_version`, `lab_section`, `feed_source`, `config_file`, `deleted_at`, `created_at`, `updated_at`) VALUES(10, 'ABX Pentra 80', 2, '', 1, 0, '\\BLISInterfaceClient\\configs\\pentra80\\abxpentra80.xml', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `interfaced_equipment` (`id`, `equipment_name`, `comm_type`, `equipment_version`, `lab_section`, `feed_source`, `config_file`, `deleted_at`, `created_at`, `updated_at`) VALUES(11, 'Sysmex XT 2000i', 1, '', 1, 1, '\\BLISInterfaceClient\\configs\\SYSMEX\\SYSMEXXT2000i.xml', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');
INSERT INTO `interfaced_equipment` (`id`, `equipment_name`, `comm_type`, `equipment_version`, `lab_section`, `feed_source`, `config_file`, `deleted_at`, `created_at`, `updated_at`) VALUES(12, 'Vitalex Flexor', 1, '', 1, 1, '\\BLISInterfaceClient\\configs\\flexorE\\flexore.xml', NULL, '2016-08-01 07:32:17', '2016-08-01 07:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
CREATE TABLE `issues` (
  `id` int(10) UNSIGNED NOT NULL,
  `receipt_id` int(10) UNSIGNED NOT NULL,
  `topup_request_id` int(10) UNSIGNED NOT NULL,
  `quantity_issued` int(11) NOT NULL,
  `issued_to` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `remarks` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `receipt_id`, `topup_request_id`, `quantity_issued`, `issued_to`, `user_id`, `remarks`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, 1, 1, 1700, 1, 1, '-', NULL, '2016-08-01 07:32:08', '2016-08-01 07:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `lots`
--

DROP TABLE IF EXISTS `lots`;
CREATE TABLE `lots` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry` date NOT NULL,
  `instrument_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lots`
--

INSERT INTO `lots` (`id`, `number`, `description`, `expiry`, `instrument_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, '0001', 'First lot', '2017-02-01', 1, NULL, '2016-08-01 07:32:09', '2016-08-01 07:32:09');
INSERT INTO `lots` (`id`, `number`, `description`, `expiry`, `instrument_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(2, '0002', 'Second lot', '2017-03-01', 1, NULL, '2016-08-01 07:32:09', '2016-08-01 07:32:09');

-- --------------------------------------------------------

--
-- Table structure for table `measure_ranges`
--

DROP TABLE IF EXISTS `measure_ranges`;
CREATE TABLE `measure_ranges` (
  `id` int(10) UNSIGNED NOT NULL,
  `measure_id` int(10) UNSIGNED NOT NULL,
  `age_min` int(10) UNSIGNED DEFAULT NULL,
  `age_max` int(10) UNSIGNED DEFAULT NULL,
  `gender` tinyint(3) UNSIGNED DEFAULT NULL,
  `range_lower` decimal(7,3) DEFAULT NULL,
  `range_upper` decimal(7,3) DEFAULT NULL,
  `alphanumeric` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interpretation` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `measure_ranges`
--

INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(1, 1, NULL, NULL, NULL, NULL, NULL, 'No mps seen', 'Negative', NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(2, 1, NULL, NULL, NULL, NULL, NULL, '+', 'Positive', NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(3, 1, NULL, NULL, NULL, NULL, NULL, '++', 'Positive', NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(4, 1, NULL, NULL, NULL, NULL, NULL, '+++', 'Positive', NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(5, 2, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(6, 2, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(7, 3, NULL, NULL, NULL, NULL, NULL, 'Low', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(8, 3, NULL, NULL, NULL, NULL, NULL, 'High', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(9, 3, NULL, NULL, NULL, NULL, NULL, 'Normal', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(10, 4, NULL, NULL, NULL, NULL, NULL, 'High', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(11, 4, NULL, NULL, NULL, NULL, NULL, 'Low', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(12, 4, NULL, NULL, NULL, NULL, NULL, 'Normal', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(13, 5, NULL, NULL, NULL, NULL, NULL, 'High', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(14, 5, NULL, NULL, NULL, NULL, NULL, 'Low', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(15, 5, NULL, NULL, NULL, NULL, NULL, 'Normal', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(16, 6, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(17, 6, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(18, 7, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(19, 7, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(20, 8, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(21, 8, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(22, 26, NULL, NULL, NULL, NULL, NULL, 'O-', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(23, 26, NULL, NULL, NULL, NULL, NULL, 'O+', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(24, 26, NULL, NULL, NULL, NULL, NULL, 'A-', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(25, 26, NULL, NULL, NULL, NULL, NULL, 'A+', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(26, 26, NULL, NULL, NULL, NULL, NULL, 'B-', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(27, 26, NULL, NULL, NULL, NULL, NULL, 'B+', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(28, 26, NULL, NULL, NULL, NULL, NULL, 'AB-', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(29, 26, NULL, NULL, NULL, NULL, NULL, 'AB+', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(30, 46, 0, 100, 2, '4.000', '11.000', NULL, NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(31, 47, 0, 100, 2, '1.500', '4.000', NULL, NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(32, 48, 0, 100, 2, '0.100', '9.000', NULL, NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(33, 49, 0, 100, 2, '2.500', '7.000', NULL, NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(34, 50, 0, 100, 2, '0.000', '6.000', NULL, NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(35, 51, 0, 100, 2, '0.000', '2.000', NULL, NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(36, 52, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(37, 52, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(38, 53, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(39, 53, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(40, 54, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(41, 54, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(42, 55, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(43, 55, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(44, 56, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(45, 56, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(46, 57, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(47, 57, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(48, 58, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(49, 58, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(50, 59, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(51, 59, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(52, 60, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL);
INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`) VALUES(53, 60, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `measure_types`
--

DROP TABLE IF EXISTS `measure_types`;
CREATE TABLE `measure_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `measure_types`
--

INSERT INTO `measure_types` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, 'Numeric Range', NULL, '2016-08-01 07:31:39', '2016-08-01 07:31:39');
INSERT INTO `measure_types` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES(2, 'Alphanumeric Values', NULL, '2016-08-01 07:31:39', '2016-08-01 07:31:39');
INSERT INTO `measure_types` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES(3, 'Autocomplete', NULL, '2016-08-01 07:31:39', '2016-08-01 07:31:39');
INSERT INTO `measure_types` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES(4, 'Free Text', NULL, '2016-08-01 07:31:39', '2016-08-01 07:31:39');

-- --------------------------------------------------------

--
-- Table structure for table `measures`
--

DROP TABLE IF EXISTS `measures`;
CREATE TABLE `measures` (
  `id` int(10) UNSIGNED NOT NULL,
  `measure_type_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `unit` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `measures`
--

INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(1, 2, 'BS for mps', '', NULL, '2016-08-01 07:31:39', '2016-08-01 07:31:39', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(2, 2, 'Grams stain', '', NULL, '2016-08-01 07:31:39', '2016-08-01 07:31:39', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(3, 2, 'SERUM AMYLASE', '', NULL, '2016-08-01 07:31:39', '2016-08-01 07:31:39', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(4, 2, 'calcium', '', NULL, '2016-08-01 07:31:39', '2016-08-01 07:31:39', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(5, 2, 'SGOT', '', NULL, '2016-08-01 07:31:39', '2016-08-01 07:31:39', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(6, 2, 'Indirect COOMBS test', '', NULL, '2016-08-01 07:31:39', '2016-08-01 07:31:39', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(7, 2, 'Direct COOMBS test', '', NULL, '2016-08-01 07:31:39', '2016-08-01 07:31:39', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(8, 2, 'Du test', '', NULL, '2016-08-01 07:31:39', '2016-08-01 07:31:39', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(9, 1, 'URIC ACID', 'mg/dl', NULL, '2016-08-01 07:31:41', '2016-08-01 07:31:41', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(10, 4, 'CSF for biochemistry', '', NULL, '2016-08-01 07:31:41', '2016-08-01 07:31:41', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(11, 4, 'PSA', '', NULL, '2016-08-01 07:31:41', '2016-08-01 07:31:41', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(12, 1, 'Total', 'mg/dl', NULL, '2016-08-01 07:31:41', '2016-08-01 07:31:41', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(13, 1, 'Alkaline Phosphate', 'u/l', NULL, '2016-08-01 07:31:41', '2016-08-01 07:31:41', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(14, 1, 'Direct', 'mg/dl', NULL, '2016-08-01 07:31:41', '2016-08-01 07:31:41', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(15, 1, 'Total Proteins', '', NULL, '2016-08-01 07:31:41', '2016-08-01 07:31:41', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(16, 4, 'LFTS', 'NULL', NULL, '2016-08-01 07:31:41', '2016-08-01 07:31:41', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(17, 1, 'Chloride', 'mmol/l', NULL, '2016-08-01 07:31:41', '2016-08-01 07:31:41', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(18, 1, 'Potassium', 'mmol/l', NULL, '2016-08-01 07:31:41', '2016-08-01 07:31:41', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(19, 1, 'Sodium', 'mmol/l', NULL, '2016-08-01 07:31:41', '2016-08-01 07:31:41', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(20, 4, 'Electrolytes', '', NULL, '2016-08-01 07:31:41', '2016-08-01 07:31:41', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(21, 1, 'Creatinine', 'mg/dl', NULL, '2016-08-01 07:31:41', '2016-08-01 07:31:41', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(22, 1, 'Urea', 'mg/dl', NULL, '2016-08-01 07:31:41', '2016-08-01 07:31:41', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(23, 4, 'RFTS', '', NULL, '2016-08-01 07:31:41', '2016-08-01 07:31:41', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(24, 4, 'TFT', '', NULL, '2016-08-01 07:31:41', '2016-08-01 07:31:41', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(25, 4, 'GXM', '', NULL, '2016-08-01 07:31:42', '2016-08-01 07:31:42', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(26, 2, 'Blood Grouping', '', NULL, '2016-08-01 07:31:42', '2016-08-01 07:31:42', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(27, 1, 'HB', 'g/dL', NULL, '2016-08-01 07:31:42', '2016-08-01 07:31:42', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(28, 4, 'Urine microscopy', '', NULL, '2016-08-01 07:31:42', '2016-08-01 07:31:42', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(29, 4, 'Pus cells', '', NULL, '2016-08-01 07:31:42', '2016-08-01 07:31:42', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(30, 4, 'S. haematobium', '', NULL, '2016-08-01 07:31:42', '2016-08-01 07:31:42', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(31, 4, 'T. vaginalis', '', NULL, '2016-08-01 07:31:42', '2016-08-01 07:31:42', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(32, 4, 'Yeast cells', '', NULL, '2016-08-01 07:31:42', '2016-08-01 07:31:42', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(33, 4, 'Red blood cells', '', NULL, '2016-08-01 07:31:42', '2016-08-01 07:31:42', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(34, 4, 'Bacteria', '', NULL, '2016-08-01 07:31:42', '2016-08-01 07:31:42', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(35, 4, 'Spermatozoa', '', NULL, '2016-08-01 07:31:42', '2016-08-01 07:31:42', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(36, 4, 'Epithelial cells', '', NULL, '2016-08-01 07:31:43', '2016-08-01 07:31:43', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(37, 4, 'ph', '', NULL, '2016-08-01 07:31:43', '2016-08-01 07:31:43', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(38, 4, 'Urine chemistry', '', NULL, '2016-08-01 07:31:43', '2016-08-01 07:31:43', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(39, 4, 'Glucose', '', NULL, '2016-08-01 07:31:43', '2016-08-01 07:31:43', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(40, 4, 'Ketones', '', NULL, '2016-08-01 07:31:43', '2016-08-01 07:31:43', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(41, 4, 'Proteins', '', NULL, '2016-08-01 07:31:43', '2016-08-01 07:31:43', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(42, 4, 'Blood', '', NULL, '2016-08-01 07:31:43', '2016-08-01 07:31:43', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(43, 4, 'Bilirubin', '', NULL, '2016-08-01 07:31:43', '2016-08-01 07:31:43', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(44, 4, 'Urobilinogen Phenlpyruvic acid', '', NULL, '2016-08-01 07:31:43', '2016-08-01 07:31:43', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(45, 4, 'pH', '', NULL, '2016-08-01 07:31:43', '2016-08-01 07:31:43', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(46, 1, 'WBC', 'x10³/µL', NULL, '2016-08-01 07:31:43', '2016-08-01 07:31:43', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(47, 1, 'Lym', 'L', NULL, '2016-08-01 07:31:43', '2016-08-01 07:31:43', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(48, 1, 'Mon', '*', NULL, '2016-08-01 07:31:43', '2016-08-01 07:31:43', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(49, 1, 'Neu', '*', NULL, '2016-08-01 07:31:43', '2016-08-01 07:31:43', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(50, 1, 'Eos', '', NULL, '2016-08-01 07:31:43', '2016-08-01 07:31:43', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(51, 1, 'Baso', '', NULL, '2016-08-01 07:31:43', '2016-08-01 07:31:43', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(52, 2, 'Salmonella Antigen Test', '', NULL, '2016-08-01 07:32:02', '2016-08-01 07:32:02', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(53, 2, 'Direct COOMBS Test', '', NULL, '2016-08-01 07:32:02', '2016-08-01 07:32:02', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(54, 2, 'Du Test', '', NULL, '2016-08-01 07:32:02', '2016-08-01 07:32:02', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(55, 2, 'Sickling Test', '', NULL, '2016-08-01 07:32:02', '2016-08-01 07:32:02', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(56, 2, 'Borrelia', '', NULL, '2016-08-01 07:32:02', '2016-08-01 07:32:02', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(57, 2, 'VDRL', '', NULL, '2016-08-01 07:32:02', '2016-08-01 07:32:02', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(58, 2, 'Pregnancy Test', '', NULL, '2016-08-01 07:32:02', '2016-08-01 07:32:02', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(59, 2, 'Brucella', '', NULL, '2016-08-01 07:32:02', '2016-08-01 07:32:02', NULL);
INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES(60, 2, 'H. Pylori', '', NULL, '2016-08-01 07:32:02', '2016-08-01 07:32:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
CREATE TABLE `metrics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `metrics`
--

INSERT INTO `metrics` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, 'mg', 'milligram', NULL, '2016-08-01 07:32:08', '2016-08-01 07:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES('2014_07_24_082711_CreatekBLIStables', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2014_09_02_114206_entrust_setup_tables', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2014_10_09_162222_externaldumptable', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2015_02_04_004704_add_index_to_parentlabno', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2015_02_11_112608_remove_unique_constraint_on_patient_number', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2015_02_17_104134_qc_tables', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2015_02_23_112018_create_microbiology_tables', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2015_02_27_084341_createInventoryTables', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2015_03_16_155558_create_surveillance', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2015_06_24_145526_update_test_types_table', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2015_06_24_154426_FreeTestsColumn', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2016_03_30_145749_lab_config_settings', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2016_07_26_093733_create_unhls_districts_table', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2016_07_26_095236_create_unhls_facilities_table', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2016_07_26_095319_create_unhls_financial_years_table', 1);
INSERT INTO `migrations` (`migration`, `batch`) VALUES('2016_07_26_095409_create_unhls_drugs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `organism_drugs`
--

DROP TABLE IF EXISTS `organism_drugs`;
CREATE TABLE `organism_drugs` (
  `id` int(10) UNSIGNED NOT NULL,
  `organism_id` int(10) UNSIGNED NOT NULL,
  `drug_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organisms`
--

DROP TABLE IF EXISTS `organisms`;
CREATE TABLE `organisms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE `patients` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_patient_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `patient_number`, `name`, `dob`, `gender`, `email`, `address`, `phone_number`, `external_patient_number`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, '1002', 'Jam Felicia', '2000-01-01', 1, 'fj@x.com', NULL, NULL, NULL, 2, NULL, '2016-08-01 07:31:46', '2016-08-01 07:31:46');
INSERT INTO `patients` (`id`, `patient_number`, `name`, `dob`, `gender`, `email`, `address`, `phone_number`, `external_patient_number`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES(2, '1003', 'Emma Wallace', '1990-03-01', 1, 'emma@snd.com', NULL, NULL, NULL, 2, NULL, '2016-08-01 07:31:47', '2016-08-01 07:31:47');
INSERT INTO `patients` (`id`, `patient_number`, `name`, `dob`, `gender`, `email`, `address`, `phone_number`, `external_patient_number`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES(3, '1004', 'Jack Tee', '1999-12-18', 0, 'info@jt.co.ke', NULL, NULL, NULL, 1, NULL, '2016-08-01 07:31:47', '2016-08-01 07:31:47');
INSERT INTO `patients` (`id`, `patient_number`, `name`, `dob`, `gender`, `email`, `address`, `phone_number`, `external_patient_number`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES(4, '1005', 'Hu Jintao', '1956-10-28', 0, 'hu@.un.org', NULL, NULL, NULL, 2, NULL, '2016-08-01 07:31:47', '2016-08-01 07:31:47');
INSERT INTO `patients` (`id`, `patient_number`, `name`, `dob`, `gender`, `email`, `address`, `phone_number`, `external_patient_number`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES(5, '2150', 'Lance Opiyo', '2012-01-01', 0, 'lance@x.com', NULL, NULL, NULL, 1, NULL, '2016-08-01 07:31:47', '2016-08-01 07:31:47');
INSERT INTO `patients` (`id`, `patient_number`, `name`, `dob`, `gender`, `email`, `address`, `phone_number`, `external_patient_number`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES(6, '999', 'robert mugabe', '2016-05-09', 0, '', '', '', NULL, 5, NULL, '2016-09-15 14:26:01', '2016-09-15 14:26:01');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(1, 1, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(2, 2, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(3, 3, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(4, 4, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(5, 5, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(6, 6, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(7, 7, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(8, 8, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(9, 9, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(10, 10, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(11, 11, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(12, 12, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(13, 13, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(14, 14, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(15, 15, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(16, 16, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(17, 17, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(18, 18, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(19, 19, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(20, 20, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(21, 1, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(22, 2, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(23, 3, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(24, 4, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(25, 5, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(26, 6, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(27, 7, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(28, 8, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(29, 9, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(30, 10, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(31, 11, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(32, 12, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(33, 13, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(34, 14, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(35, 15, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(36, 16, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(37, 17, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(38, 18, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(39, 19, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(40, 20, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(41, 21, 1);
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES(42, 22, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(1, 'view_names', 'Can view patient names', '2016-08-01 07:31:54', '2016-08-01 07:31:54');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(2, 'manage_patients', 'Can add patients', '2016-08-01 07:31:54', '2016-08-01 07:31:54');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(3, 'receive_external_test', 'Can receive test requests', '2016-08-01 07:31:54', '2016-08-01 07:31:54');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(4, 'request_test', 'Can request new test', '2016-08-01 07:31:54', '2016-08-01 07:31:54');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(5, 'accept_test_specimen', 'Can accept test specimen', '2016-08-01 07:31:54', '2016-08-01 07:31:54');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(6, 'reject_test_specimen', 'Can reject test specimen', '2016-08-01 07:31:54', '2016-08-01 07:31:54');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(7, 'change_test_specimen', 'Can change test specimen', '2016-08-01 07:31:55', '2016-08-01 07:31:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(8, 'start_test', 'Can start tests', '2016-08-01 07:31:55', '2016-08-01 07:31:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(9, 'enter_test_results', 'Can enter tests results', '2016-08-01 07:31:55', '2016-08-01 07:31:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(10, 'edit_test_results', 'Can edit test results', '2016-08-01 07:31:55', '2016-08-01 07:31:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(11, 'verify_test_results', 'Can verify test results', '2016-08-01 07:31:55', '2016-08-01 07:31:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(12, 'send_results_to_external_system', 'Can send test results to external systems', '2016-08-01 07:31:55', '2016-08-01 07:31:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(13, 'refer_specimens', 'Can refer specimens', '2016-08-01 07:31:55', '2016-08-01 07:31:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(14, 'manage_users', 'Can manage users', '2016-08-01 07:31:55', '2016-08-01 07:31:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(15, 'manage_test_catalog', 'Can manage test catalog', '2016-08-01 07:31:55', '2016-08-01 07:31:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(16, 'manage_lab_configurations', 'Can manage lab configurations', '2016-08-01 07:31:55', '2016-08-01 07:31:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(17, 'view_reports', 'Can view reports', '2016-08-01 07:31:55', '2016-08-01 07:31:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(18, 'manage_inventory', 'Can manage inventory', '2016-08-01 07:31:55', '2016-08-01 07:31:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(19, 'request_topup', 'Can request top-up', '2016-08-01 07:31:55', '2016-08-01 07:31:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(20, 'manage_qc', 'Can manage Quality Control', '2016-08-01 07:31:55', '2016-08-01 07:31:55');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(21, 'manage_bbincidences', 'Can Manage BB Incidences', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES(22, 'create_bbincidences', 'Can Create BB Incidences', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

DROP TABLE IF EXISTS `receipts`;
CREATE TABLE `receipts` (
  `id` int(10) UNSIGNED NOT NULL,
  `commodity_id` int(10) UNSIGNED NOT NULL,
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `batch_no` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `receipts`
--

INSERT INTO `receipts` (`id`, `commodity_id`, `supplier_id`, `quantity`, `batch_no`, `expiry_date`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, 1, 1, 130000, '002720', '2018-10-14', 1, NULL, '2016-08-01 07:32:08', '2016-08-01 07:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

DROP TABLE IF EXISTS `referrals`;
CREATE TABLE `referrals` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(10) UNSIGNED NOT NULL,
  `facility_id` int(10) UNSIGNED NOT NULL,
  `person` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `contacts` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rejection_reasons`
--

DROP TABLE IF EXISTS `rejection_reasons`;
CREATE TABLE `rejection_reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `reason` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rejection_reasons`
--

INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(1, 'Poorly labelled');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(2, 'Over saturation');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(3, 'Insufficient Sample');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(4, 'Scattered');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(5, 'Clotted Blood');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(6, 'Two layered spots');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(7, 'Serum rings');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(8, 'Scratched');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(9, 'Haemolysis');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(10, 'Spots that cannot elute');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(11, 'Leaking');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(12, 'Broken Sample Container');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(13, 'Mismatched sample and form labelling');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(14, 'Missing Labels on container and tracking form');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(15, 'Empty Container');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(16, 'Samples without tracking forms');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(17, 'Poor transport');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(18, 'Lipaemic');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(19, 'Wrong container/Anticoagulant');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(20, 'Request form without samples');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(21, 'Missing collection date on specimen / request form.');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(22, 'Name and signature of requester missing');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(23, 'Mismatched information on request form and specimen container.');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(24, 'Request form contaminated with specimen');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(25, 'Duplicate specimen received');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(26, 'Delay between specimen collection and arrival in the laboratory');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(27, 'Inappropriate specimen packing');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(28, 'Inappropriate specimen for the test');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(29, 'Inappropriate test for the clinical condition');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(30, 'No Label');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(31, 'Leaking');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(32, 'No Sample in the Container');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(33, 'No Request Form');
INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES(34, 'Missing Information Required');

-- --------------------------------------------------------

--
-- Table structure for table `report_diseases`
--

DROP TABLE IF EXISTS `report_diseases`;
CREATE TABLE `report_diseases` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_type_id` int(10) UNSIGNED NOT NULL,
  `disease_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `report_diseases`
--

INSERT INTO `report_diseases` (`id`, `test_type_id`, `disease_id`) VALUES(1, 1, 1);
INSERT INTO `report_diseases` (`id`, `test_type_id`, `disease_id`) VALUES(3, 2, 3);
INSERT INTO `report_diseases` (`id`, `test_type_id`, `disease_id`) VALUES(2, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES(1, 'Superadmin', NULL, '2016-08-01 07:31:56', '2016-08-01 07:31:56');
INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES(2, 'Technologist', NULL, '2016-08-01 07:31:56', '2016-08-01 07:31:56');
INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES(3, 'Receptionist', NULL, '2016-08-01 07:31:56', '2016-08-01 07:31:56');

-- --------------------------------------------------------

--
-- Table structure for table `specimen_statuses`
--

DROP TABLE IF EXISTS `specimen_statuses`;
CREATE TABLE `specimen_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `specimen_statuses`
--

INSERT INTO `specimen_statuses` (`id`, `name`) VALUES(1, 'specimen-not-collected');
INSERT INTO `specimen_statuses` (`id`, `name`) VALUES(2, 'specimen-accepted');
INSERT INTO `specimen_statuses` (`id`, `name`) VALUES(3, 'specimen-rejected');

-- --------------------------------------------------------

--
-- Table structure for table `specimen_types`
--

DROP TABLE IF EXISTS `specimen_types`;
CREATE TABLE `specimen_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `specimen_types`
--

INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, 'Ascitic Tap', NULL, NULL, '2016-08-01 07:31:37', '2016-08-01 07:31:37');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(2, 'Aspirate', NULL, NULL, '2016-08-01 07:31:37', '2016-08-01 07:31:37');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(3, 'CSF', NULL, NULL, '2016-08-01 07:31:37', '2016-08-01 07:31:37');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(4, 'Dried Blood Spot', NULL, NULL, '2016-08-01 07:31:37', '2016-08-01 07:31:37');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(5, 'High Vaginal Swab', NULL, NULL, '2016-08-01 07:31:37', '2016-08-01 07:31:37');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(6, 'Nasal Swab', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(7, 'Plasma', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(8, 'Plasma EDTA', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(9, 'Pleural Tap', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(10, 'Pus Swab', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(11, 'Rectal Swab', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(12, 'Semen', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(13, 'Serum', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(14, 'Skin', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(15, 'Sputum', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(16, 'Stool', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(17, 'Synovial Fluid', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(18, 'Throat Swab', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(19, 'Urethral Smear', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(20, 'Urine', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(21, 'Vaginal Smear', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(22, 'Water', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(23, 'Whole Blood', NULL, NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');

-- --------------------------------------------------------

--
-- Table structure for table `specimens`
--

DROP TABLE IF EXISTS `specimens`;
CREATE TABLE `specimens` (
  `id` int(10) UNSIGNED NOT NULL,
  `specimen_type_id` int(10) UNSIGNED NOT NULL,
  `specimen_status_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `accepted_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rejected_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rejection_reason_id` int(10) UNSIGNED DEFAULT NULL,
  `reject_explained_to` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referral_id` int(10) UNSIGNED DEFAULT NULL,
  `time_accepted` timestamp NULL DEFAULT NULL,
  `time_rejected` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `specimens`
--

INSERT INTO `specimens` (`id`, `specimen_type_id`, `specimen_status_id`, `accepted_by`, `rejected_by`, `rejection_reason_id`, `reject_explained_to`, `referral_id`, `time_accepted`, `time_rejected`) VALUES(1, 23, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `specimens` (`id`, `specimen_type_id`, `specimen_status_id`, `accepted_by`, `rejected_by`, `rejection_reason_id`, `reject_explained_to`, `referral_id`, `time_accepted`, `time_rejected`) VALUES(2, 23, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `specimens` (`id`, `specimen_type_id`, `specimen_status_id`, `accepted_by`, `rejected_by`, `rejection_reason_id`, `reject_explained_to`, `referral_id`, `time_accepted`, `time_rejected`) VALUES(3, 23, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `specimens` (`id`, `specimen_type_id`, `specimen_status_id`, `accepted_by`, `rejected_by`, `rejection_reason_id`, `reject_explained_to`, `referral_id`, `time_accepted`, `time_rejected`) VALUES(4, 23, 2, 2, 0, NULL, NULL, NULL, '2016-08-01 07:31:51', NULL);
INSERT INTO `specimens` (`id`, `specimen_type_id`, `specimen_status_id`, `accepted_by`, `rejected_by`, `rejection_reason_id`, `reject_explained_to`, `referral_id`, `time_accepted`, `time_rejected`) VALUES(5, 23, 2, 3, 0, NULL, NULL, NULL, '2016-08-01 07:31:51', NULL);
INSERT INTO `specimens` (`id`, `specimen_type_id`, `specimen_status_id`, `accepted_by`, `rejected_by`, `rejection_reason_id`, `reject_explained_to`, `referral_id`, `time_accepted`, `time_rejected`) VALUES(6, 23, 2, 4, 0, NULL, NULL, NULL, '2016-08-01 07:31:51', NULL);
INSERT INTO `specimens` (`id`, `specimen_type_id`, `specimen_status_id`, `accepted_by`, `rejected_by`, `rejection_reason_id`, `reject_explained_to`, `referral_id`, `time_accepted`, `time_rejected`) VALUES(7, 23, 2, 4, 0, NULL, NULL, NULL, '2016-08-01 07:31:51', NULL);
INSERT INTO `specimens` (`id`, `specimen_type_id`, `specimen_status_id`, `accepted_by`, `rejected_by`, `rejection_reason_id`, `reject_explained_to`, `referral_id`, `time_accepted`, `time_rejected`) VALUES(8, 23, 2, 3, 0, NULL, NULL, NULL, '2016-08-01 07:31:51', NULL);
INSERT INTO `specimens` (`id`, `specimen_type_id`, `specimen_status_id`, `accepted_by`, `rejected_by`, `rejection_reason_id`, `reject_explained_to`, `referral_id`, `time_accepted`, `time_rejected`) VALUES(9, 23, 2, 3, 0, NULL, NULL, NULL, '2016-08-01 07:31:52', NULL);
INSERT INTO `specimens` (`id`, `specimen_type_id`, `specimen_status_id`, `accepted_by`, `rejected_by`, `rejection_reason_id`, `reject_explained_to`, `referral_id`, `time_accepted`, `time_rejected`) VALUES(10, 23, 3, 0, 1, 13, NULL, NULL, NULL, '2016-08-01 07:31:52');
INSERT INTO `specimens` (`id`, `specimen_type_id`, `specimen_status_id`, `accepted_by`, `rejected_by`, `rejection_reason_id`, `reject_explained_to`, `referral_id`, `time_accepted`, `time_rejected`) VALUES(11, 23, 2, 3, 0, NULL, NULL, NULL, '2016-08-01 07:31:52', NULL);
INSERT INTO `specimens` (`id`, `specimen_type_id`, `specimen_status_id`, `accepted_by`, `rejected_by`, `rejection_reason_id`, `reject_explained_to`, `referral_id`, `time_accepted`, `time_rejected`) VALUES(12, 23, 3, 0, 2, 20, NULL, NULL, NULL, '2016-08-01 07:31:52');
INSERT INTO `specimens` (`id`, `specimen_type_id`, `specimen_status_id`, `accepted_by`, `rejected_by`, `rejection_reason_id`, `reject_explained_to`, `referral_id`, `time_accepted`, `time_rejected`) VALUES(13, 23, 3, 0, 2, 23, NULL, NULL, NULL, '2016-08-01 07:31:52');
INSERT INTO `specimens` (`id`, `specimen_type_id`, `specimen_status_id`, `accepted_by`, `rejected_by`, `rejection_reason_id`, `reject_explained_to`, `referral_id`, `time_accepted`, `time_rejected`) VALUES(14, 23, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `specimens` (`id`, `specimen_type_id`, `specimen_status_id`, `accepted_by`, `rejected_by`, `rejection_reason_id`, `reject_explained_to`, `referral_id`, `time_accepted`, `time_rejected`) VALUES(15, 23, 1, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `specimens` (`id`, `specimen_type_id`, `specimen_status_id`, `accepted_by`, `rejected_by`, `rejection_reason_id`, `reject_explained_to`, `referral_id`, `time_accepted`, `time_rejected`) VALUES(16, 23, 2, 3, 0, NULL, NULL, NULL, '2016-08-01 07:31:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `physical_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone_no`, `email`, `physical_address`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, 'UNICEF', '0775112233', 'uni@unice.org', 'un-hqtr', NULL, '2016-08-01 07:32:08', '2016-08-01 07:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `test_categories`
--

DROP TABLE IF EXISTS `test_categories`;
CREATE TABLE `test_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `test_categories`
--

INSERT INTO `test_categories` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, 'PARASITOLOGY', '', NULL, '2016-08-01 07:31:38', '2016-08-01 07:31:38');
INSERT INTO `test_categories` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(2, 'MICROBIOLOGY', '', NULL, '2016-08-01 07:31:39', '2016-08-01 07:31:39');
INSERT INTO `test_categories` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(3, 'HEMATOLOGY', '', NULL, '2016-08-01 07:32:00', '2016-08-01 07:32:00');
INSERT INTO `test_categories` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(4, 'SEROLOGY', '', NULL, '2016-08-01 07:32:00', '2016-08-01 07:32:00');
INSERT INTO `test_categories` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES(5, 'BLOOD TRANSFUSION', '', NULL, '2016-08-01 07:32:00', '2016-08-01 07:32:00');

-- --------------------------------------------------------

--
-- Table structure for table `test_phases`
--

DROP TABLE IF EXISTS `test_phases`;
CREATE TABLE `test_phases` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `test_phases`
--

INSERT INTO `test_phases` (`id`, `name`) VALUES(1, 'Pre-Analytical');
INSERT INTO `test_phases` (`id`, `name`) VALUES(2, 'Analytical');
INSERT INTO `test_phases` (`id`, `name`) VALUES(3, 'Post-Analytical');

-- --------------------------------------------------------

--
-- Table structure for table `test_results`
--

DROP TABLE IF EXISTS `test_results`;
CREATE TABLE `test_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `test_id` int(10) UNSIGNED NOT NULL,
  `measure_id` int(10) UNSIGNED NOT NULL,
  `result` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `test_results`
--

INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(1, 9, 1, '+++', '2016-08-01 07:31:52');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(2, 8, 1, '++', '2016-08-01 07:31:53');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(3, 5, 25, 'COMPATIBLE WITH 061832914 B/G A POS.EXPIRY19/8/14', '2016-08-01 07:31:53');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(4, 5, 26, 'A+', '2016-08-01 07:31:53');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(5, 6, 27, '13.7', '2016-08-01 07:31:53');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(6, 13, 1, 'No mps seen', '2016-08-01 07:31:53');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(7, 16, 28, '050', '2016-08-01 07:31:53');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(8, 16, 29, '150', '2016-08-01 07:31:53');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(9, 16, 30, '250', '2016-08-01 07:31:53');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(10, 16, 31, '350', '2016-08-01 07:31:53');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(11, 16, 32, '450', '2016-08-01 07:31:53');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(12, 16, 33, '550', '2016-08-01 07:31:53');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(13, 16, 34, '650', '2016-08-01 07:31:53');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(14, 16, 35, '750', '2016-08-01 07:31:53');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(15, 16, 36, '850', '2016-08-01 07:31:53');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(16, 16, 37, '950', '2016-08-01 07:31:53');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(17, 16, 38, '1050', '2016-08-01 07:31:54');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(18, 16, 39, '1150', '2016-08-01 07:31:54');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(19, 16, 40, '1250', '2016-08-01 07:31:54');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(20, 16, 41, '1350', '2016-08-01 07:31:54');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(21, 16, 42, '1450', '2016-08-01 07:31:54');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(22, 16, 43, '1550', '2016-08-01 07:31:54');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(23, 16, 44, '1650', '2016-08-01 07:31:54');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(24, 16, 45, '1750', '2016-08-01 07:31:54');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(25, 17, 52, 'Positive', '2016-08-01 07:32:06');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(26, 18, 53, 'Positive', '2016-08-01 07:32:06');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(27, 19, 54, 'Positive', '2016-08-01 07:32:06');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(28, 20, 55, 'Positive', '2016-08-01 07:32:06');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(29, 21, 56, 'Positive', '2016-08-01 07:32:06');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(30, 22, 57, 'Positive', '2016-08-01 07:32:06');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(31, 23, 58, 'Positive', '2016-08-01 07:32:06');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(32, 24, 59, 'Positive', '2016-08-01 07:32:06');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(33, 25, 60, 'Positive', '2016-08-01 07:32:06');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(34, 26, 52, 'Positive', '2016-08-01 07:32:06');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(35, 27, 53, 'Negative', '2016-08-01 07:32:06');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(36, 28, 54, 'Positive', '2016-08-01 07:32:07');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(37, 29, 55, 'Positive', '2016-08-01 07:32:07');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(38, 30, 56, 'Negative', '2016-08-01 07:32:07');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(39, 31, 57, 'Negative', '2016-08-01 07:32:07');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(40, 32, 58, 'Negative', '2016-08-01 07:32:07');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(41, 33, 59, 'Positive', '2016-08-01 07:32:07');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(42, 34, 60, 'Positive', '2016-08-01 07:32:07');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(43, 35, 58, 'Negative', '2016-08-01 07:32:07');
INSERT INTO `test_results` (`id`, `test_id`, `measure_id`, `result`, `time_entered`) VALUES(44, 36, 58, 'Positive', '2016-08-01 07:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `test_statuses`
--

DROP TABLE IF EXISTS `test_statuses`;
CREATE TABLE `test_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `test_phase_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `test_statuses`
--

INSERT INTO `test_statuses` (`id`, `name`, `test_phase_id`) VALUES(1, 'not-received', 1);
INSERT INTO `test_statuses` (`id`, `name`, `test_phase_id`) VALUES(2, 'pending', 1);
INSERT INTO `test_statuses` (`id`, `name`, `test_phase_id`) VALUES(3, 'started', 2);
INSERT INTO `test_statuses` (`id`, `name`, `test_phase_id`) VALUES(4, 'completed', 3);
INSERT INTO `test_statuses` (`id`, `name`, `test_phase_id`) VALUES(5, 'verified', 3);

-- --------------------------------------------------------

--
-- Table structure for table `test_types`
--

DROP TABLE IF EXISTS `test_types`;
CREATE TABLE `test_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `test_category_id` int(10) UNSIGNED NOT NULL,
  `targetTAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderable_test` int(11) DEFAULT NULL,
  `prevalence_threshold` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accredited` tinyint(4) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `test_types`
--

INSERT INTO `test_types` (`id`, `name`, `description`, `test_category_id`, `targetTAT`, `orderable_test`, `prevalence_threshold`, `accredited`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, 'BS for mps', NULL, 1, NULL, 1, NULL, NULL, NULL, '2016-08-01 07:31:44', '2016-08-01 07:31:44');
INSERT INTO `test_types` (`id`, `name`, `description`, `test_category_id`, `targetTAT`, `orderable_test`, `prevalence_threshold`, `accredited`, `deleted_at`, `created_at`, `updated_at`) VALUES(2, 'Stool for C/S', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2016-08-01 07:31:44', '2016-08-01 07:31:44');
INSERT INTO `test_types` (`id`, `name`, `description`, `test_category_id`, `targetTAT`, `orderable_test`, `prevalence_threshold`, `accredited`, `deleted_at`, `created_at`, `updated_at`) VALUES(3, 'GXM', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2016-08-01 07:31:44', '2016-08-01 07:31:44');
INSERT INTO `test_types` (`id`, `name`, `description`, `test_category_id`, `targetTAT`, `orderable_test`, `prevalence_threshold`, `accredited`, `deleted_at`, `created_at`, `updated_at`) VALUES(4, 'HB', NULL, 1, NULL, 1, NULL, NULL, NULL, '2016-08-01 07:31:44', '2016-08-01 07:31:44');
INSERT INTO `test_types` (`id`, `name`, `description`, `test_category_id`, `targetTAT`, `orderable_test`, `prevalence_threshold`, `accredited`, `deleted_at`, `created_at`, `updated_at`) VALUES(5, 'Urinalysis', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2016-08-01 07:31:44', '2016-08-01 07:31:44');
INSERT INTO `test_types` (`id`, `name`, `description`, `test_category_id`, `targetTAT`, `orderable_test`, `prevalence_threshold`, `accredited`, `deleted_at`, `created_at`, `updated_at`) VALUES(6, 'WBC', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2016-08-01 07:31:44', '2016-08-01 07:31:44');
INSERT INTO `test_types` (`id`, `name`, `description`, `test_category_id`, `targetTAT`, `orderable_test`, `prevalence_threshold`, `accredited`, `deleted_at`, `created_at`, `updated_at`) VALUES(7, 'Salmonella Antigen Test', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2016-08-01 07:32:00', '2016-08-01 07:32:00');
INSERT INTO `test_types` (`id`, `name`, `description`, `test_category_id`, `targetTAT`, `orderable_test`, `prevalence_threshold`, `accredited`, `deleted_at`, `created_at`, `updated_at`) VALUES(8, 'Direct COOMBS Test', NULL, 5, NULL, NULL, NULL, NULL, NULL, '2016-08-01 07:32:00', '2016-08-01 07:32:00');
INSERT INTO `test_types` (`id`, `name`, `description`, `test_category_id`, `targetTAT`, `orderable_test`, `prevalence_threshold`, `accredited`, `deleted_at`, `created_at`, `updated_at`) VALUES(9, 'DU Test', NULL, 5, NULL, NULL, NULL, NULL, NULL, '2016-08-01 07:32:00', '2016-08-01 07:32:00');
INSERT INTO `test_types` (`id`, `name`, `description`, `test_category_id`, `targetTAT`, `orderable_test`, `prevalence_threshold`, `accredited`, `deleted_at`, `created_at`, `updated_at`) VALUES(10, 'Sickling Test', NULL, 3, NULL, NULL, NULL, NULL, NULL, '2016-08-01 07:32:01', '2016-08-01 07:32:01');
INSERT INTO `test_types` (`id`, `name`, `description`, `test_category_id`, `targetTAT`, `orderable_test`, `prevalence_threshold`, `accredited`, `deleted_at`, `created_at`, `updated_at`) VALUES(11, 'Borrelia', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2016-08-01 07:32:01', '2016-08-01 07:32:01');
INSERT INTO `test_types` (`id`, `name`, `description`, `test_category_id`, `targetTAT`, `orderable_test`, `prevalence_threshold`, `accredited`, `deleted_at`, `created_at`, `updated_at`) VALUES(12, 'VDRL', NULL, 4, NULL, NULL, NULL, NULL, NULL, '2016-08-01 07:32:01', '2016-08-01 07:32:01');
INSERT INTO `test_types` (`id`, `name`, `description`, `test_category_id`, `targetTAT`, `orderable_test`, `prevalence_threshold`, `accredited`, `deleted_at`, `created_at`, `updated_at`) VALUES(13, 'Pregnancy Test', NULL, 4, NULL, NULL, NULL, NULL, NULL, '2016-08-01 07:32:01', '2016-08-01 07:32:01');
INSERT INTO `test_types` (`id`, `name`, `description`, `test_category_id`, `targetTAT`, `orderable_test`, `prevalence_threshold`, `accredited`, `deleted_at`, `created_at`, `updated_at`) VALUES(14, 'Brucella', NULL, 4, NULL, NULL, NULL, NULL, NULL, '2016-08-01 07:32:01', '2016-08-01 07:32:01');
INSERT INTO `test_types` (`id`, `name`, `description`, `test_category_id`, `targetTAT`, `orderable_test`, `prevalence_threshold`, `accredited`, `deleted_at`, `created_at`, `updated_at`) VALUES(15, 'H. Pylori', NULL, 4, NULL, NULL, NULL, NULL, NULL, '2016-08-01 07:32:01', '2016-08-01 07:32:01');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `visit_id` bigint(20) UNSIGNED NOT NULL,
  `test_type_id` int(10) UNSIGNED NOT NULL,
  `specimen_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `interpretation` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `test_status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL,
  `tested_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `verified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `requested_by` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_started` timestamp NULL DEFAULT NULL,
  `time_completed` timestamp NULL DEFAULT NULL,
  `time_verified` timestamp NULL DEFAULT NULL,
  `time_sent` timestamp NULL DEFAULT NULL,
  `external_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(1, 6, 1, 1, '', 1, 2, 0, 0, 'Dr. Abou Meyang', '2016-08-01 07:31:50', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(2, 1, 4, 2, '', 2, 1, 0, 0, 'Dr. Abou Meyang', '2016-08-01 07:31:51', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(3, 1, 3, 3, '', 2, 4, 0, 0, 'Dr. Abou Meyang', '2016-08-01 07:31:51', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(4, 4, 1, 4, '', 2, 3, 0, 0, 'Dr. Abou Meyang', '2016-08-01 07:31:51', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(5, 1, 3, 5, 'Perfect match.', 4, 2, 1, 0, 'Dr. Abou Meyang', '2016-08-01 07:31:51', '2016-08-01 07:31:50', '2016-08-01 07:43:58', NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(6, 5, 4, 6, 'Do nothing!', 4, 2, 1, 0, 'Genghiz Khan', '2016-08-01 07:31:51', '2016-08-01 07:43:58', '2016-08-01 07:49:21', NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(7, 1, 3, 7, '', 3, 1, 0, 0, 'Dr. Abou Meyang', '2016-08-01 07:31:51', '2016-08-01 07:49:21', NULL, NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(8, 5, 1, 8, 'Positive', 4, 1, 1, 0, 'Ariel Smith', '2016-08-01 07:31:51', '2016-08-01 07:49:21', '2016-08-01 07:56:55', NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(9, 2, 1, 9, 'Very high concentration of parasites.', 5, 4, 4, 3, 'Genghiz Khan', '2016-08-01 07:31:52', '2016-08-01 09:54:45', '2016-08-01 08:02:12', '2016-08-01 09:54:45', NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(10, 5, 1, 10, '', 2, 3, 0, 0, 'Dr. Abou Meyang', '2016-08-01 07:31:52', '2016-08-01 09:54:45', NULL, NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(11, 4, 6, 11, '', 2, 3, 0, 0, 'Fred Astaire', '2016-08-01 07:31:52', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(12, 3, 1, 12, '', 3, 4, 0, 0, 'Bony Em', '2016-08-01 07:31:52', '2016-08-01 09:54:45', NULL, NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(13, 1, 1, 13, 'Budda Boss', 4, 1, 4, 0, 'Ed Buttler', '2016-08-01 07:31:52', '2016-08-01 09:54:45', '2016-08-01 10:24:49', NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(14, 4, 5, 14, '', 2, 3, 0, 0, 'Dr. Abou Meyang', '2016-08-01 07:31:52', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(15, 3, 6, 15, '', 2, 1, 0, 0, 'Dr. Abou Meyang', '2016-08-01 07:31:52', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(16, 2, 5, 16, 'Whats this !!!! ###%%% ^ *() /', 4, 4, 3, 0, 'Dr. Abou Meyang', '2016-08-01 07:31:52', '2016-08-01 10:24:49', '2016-08-01 10:36:57', NULL, NULL, 596699);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(17, 1, 7, 4, 'Budda Boss', 4, 2, 3, 0, 'Ariel Smith', '2014-07-23 12:16:15', '2014-07-23 13:07:15', '2014-07-23 13:17:19', NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(18, 2, 8, 3, 'Budda Boss', 4, 2, 3, 0, 'Ariel Smith', '2014-07-26 07:16:15', '2014-07-26 10:27:15', '2014-07-26 10:57:01', NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(19, 3, 9, 2, 'Budda Boss', 4, 2, 3, 0, 'Ariel Smith', '2014-08-13 06:16:15', '2014-08-13 07:07:15', '2014-08-13 07:18:11', NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(20, 4, 10, 1, 'Budda Boss', 4, 2, 3, 0, 'Ariel Smith', '2014-08-16 06:06:53', '2014-08-16 06:09:15', '2014-08-16 06:23:37', NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(21, 5, 11, 1, 'Budda Boss', 4, 2, 3, 0, 'Ariel Smith', '2014-08-23 07:16:15', '2014-08-23 08:54:39', '2014-08-23 09:07:18', NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(22, 6, 12, 2, 'Budda Boss', 4, 2, 3, 0, 'Ariel Smith', '2014-09-07 04:23:15', '2014-09-07 05:07:20', '2014-09-07 05:41:13', NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(23, 7, 13, 3, 'Budda Boss', 4, 2, 3, 0, 'Ariel Smith', '2014-10-03 08:52:15', '2014-10-03 09:31:04', '2014-10-03 09:45:18', NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(24, 1, 14, 4, 'Budda Boss', 4, 2, 3, 0, 'Ariel Smith', '2014-10-15 14:01:15', '2014-10-15 14:05:24', '2014-10-15 15:07:15', NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(25, 2, 15, 4, 'Budda Boss', 4, 2, 3, 0, 'Ariel Smith', '2014-10-23 13:06:15', '2014-10-23 13:07:15', '2014-10-23 13:39:02', NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(26, 4, 7, 3, 'Budda Boss', 4, 2, 3, 0, 'Ariel Smith', '2014-10-21 16:16:15', '2014-10-21 16:17:15', '2014-10-21 16:52:40', NULL, NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(27, 3, 8, 2, 'Budda Boss', 5, 3, 2, 3, 'Genghiz Khan', '2014-07-21 16:16:15', '2014-07-21 16:17:15', '2014-07-21 16:52:40', '2014-07-21 16:53:48', NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(28, 2, 9, 1, 'Budda Boss', 5, 3, 2, 3, 'Genghiz Khan', '2014-08-21 16:16:15', '2014-08-21 16:17:15', '2014-08-21 16:52:40', '2014-08-21 16:53:48', NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(29, 3, 10, 4, 'Budda Boss', 5, 3, 2, 3, 'Genghiz Khan', '2014-08-26 16:16:15', '2014-08-26 16:17:15', '2014-08-26 16:52:40', '2014-08-26 16:53:48', NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(30, 4, 11, 2, 'Budda Boss', 5, 3, 2, 3, 'Genghiz Khan', '2014-09-21 16:16:15', '2014-09-21 16:17:15', '2014-09-21 16:52:40', '2014-09-21 16:53:48', NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(31, 1, 12, 3, 'Budda Boss', 5, 3, 2, 3, 'Genghiz Khan', '2014-09-22 16:16:15', '2014-09-22 16:17:15', '2014-09-22 16:52:40', '2014-09-22 16:53:48', NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(32, 1, 13, 4, 'Budda Boss', 5, 3, 2, 3, 'Genghiz Khan', '2014-09-23 16:16:15', '2014-09-23 16:17:15', '2014-09-23 16:52:40', '2014-09-23 16:53:48', NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(33, 1, 14, 2, 'Budda Boss', 5, 3, 2, 3, 'Genghiz Khan', '2014-09-27 16:16:15', '2014-09-27 16:17:15', '2014-09-27 16:52:40', '2014-09-27 16:53:48', NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(34, 3, 15, 4, 'Budda Boss', 5, 3, 2, 3, 'Genghiz Khan', '2014-10-22 16:16:15', '2014-10-22 16:17:15', '2014-10-22 16:52:40', '2014-10-22 16:53:48', NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(35, 4, 13, 3, 'Budda Boss', 5, 3, 2, 3, 'Genghiz Khan', '2014-10-17 16:16:15', '2014-10-17 16:17:15', '2014-10-17 16:52:40', '2014-10-17 16:53:48', NULL, NULL);
INSERT INTO `tests` (`id`, `visit_id`, `test_type_id`, `specimen_id`, `interpretation`, `test_status_id`, `created_by`, `tested_by`, `verified_by`, `requested_by`, `time_created`, `time_started`, `time_completed`, `time_verified`, `time_sent`, `external_id`) VALUES(36, 2, 13, 1, 'Budda Boss', 5, 3, 2, 3, 'Genghiz Khan', '2014-10-02 16:16:15', '2014-10-02 16:17:15', '2014-10-02 16:52:40', '2014-10-02 16:53:48', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testtype_measures`
--

DROP TABLE IF EXISTS `testtype_measures`;
CREATE TABLE `testtype_measures` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_type_id` int(10) UNSIGNED NOT NULL,
  `measure_id` int(10) UNSIGNED NOT NULL,
  `ordering` tinyint(4) DEFAULT NULL,
  `nesting` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `testtype_measures`
--

INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(1, 1, 1, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(2, 3, 25, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(3, 3, 26, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(4, 4, 27, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(5, 5, 28, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(6, 5, 29, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(7, 5, 30, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(8, 5, 31, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(9, 5, 32, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(10, 5, 33, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(11, 5, 34, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(12, 5, 35, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(13, 5, 36, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(14, 5, 37, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(15, 5, 38, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(16, 5, 39, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(17, 5, 40, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(18, 5, 41, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(19, 5, 42, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(20, 5, 43, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(21, 5, 44, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(22, 5, 45, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(23, 6, 46, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(24, 6, 47, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(25, 6, 48, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(26, 6, 49, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(27, 6, 50, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(28, 6, 51, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(29, 7, 52, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(30, 8, 53, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(31, 9, 54, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(32, 10, 55, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(33, 11, 56, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(34, 12, 57, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(35, 13, 58, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(36, 14, 59, NULL, NULL);
INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES(37, 15, 60, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testtype_organisms`
--

DROP TABLE IF EXISTS `testtype_organisms`;
CREATE TABLE `testtype_organisms` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_type_id` int(10) UNSIGNED NOT NULL,
  `organism_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testtype_specimentypes`
--

DROP TABLE IF EXISTS `testtype_specimentypes`;
CREATE TABLE `testtype_specimentypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_type_id` int(10) UNSIGNED NOT NULL,
  `specimen_type_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `testtype_specimentypes`
--

INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(1, 1, 23);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(19, 2, 16);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(2, 3, 23);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(4, 4, 7);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(5, 4, 8);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(6, 4, 13);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(3, 4, 23);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(7, 5, 20);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(8, 5, 21);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(9, 6, 23);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(10, 7, 13);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(11, 8, 23);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(12, 9, 23);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(13, 10, 23);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(14, 11, 23);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(15, 12, 13);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(16, 13, 20);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(17, 14, 13);
INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES(18, 15, 13);

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `topup_requests`
--

DROP TABLE IF EXISTS `topup_requests`;
CREATE TABLE `topup_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `commodity_id` int(10) UNSIGNED NOT NULL,
  `test_category_id` int(10) UNSIGNED NOT NULL,
  `order_quantity` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `remarks` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `topup_requests`
--

INSERT INTO `topup_requests` (`id`, `commodity_id`, `test_category_id`, `order_quantity`, `user_id`, `remarks`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, 1, 1, 1500, 1, '-', NULL, '2016-08-01 07:32:08', '2016-08-01 07:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `unhls_bbactions`
--

DROP TABLE IF EXISTS `unhls_bbactions`;
CREATE TABLE `unhls_bbactions` (
  `id` int(11) NOT NULL,
  `actionname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unhls_bbactions`
--

INSERT INTO `unhls_bbactions` (`id`, `actionname`) VALUES(1, 'Reported to administration for further action');
INSERT INTO `unhls_bbactions` (`id`, `actionname`) VALUES(2, 'Referred to mental department');
INSERT INTO `unhls_bbactions` (`id`, `actionname`) VALUES(3, 'Gave first aid (e.g. arrested bleeding)');
INSERT INTO `unhls_bbactions` (`id`, `actionname`) VALUES(4, 'Referred to clinician for further management');

-- --------------------------------------------------------

--
-- Table structure for table `unhls_bbcauses`
--

DROP TABLE IF EXISTS `unhls_bbcauses`;
CREATE TABLE `unhls_bbcauses` (
  `id` int(11) NOT NULL,
  `causename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unhls_bbcauses`
--

INSERT INTO `unhls_bbcauses` (`id`, `causename`) VALUES(1, 'Defective Equipment');
INSERT INTO `unhls_bbcauses` (`id`, `causename`) VALUES(2, 'Hazardous Chemicals');
INSERT INTO `unhls_bbcauses` (`id`, `causename`) VALUES(3, 'Unsafe Procedure');
INSERT INTO `unhls_bbcauses` (`id`, `causename`) VALUES(4, 'Psychological causes (e.g. emotional condition, depression, mental confusion)');

-- --------------------------------------------------------

--
-- Table structure for table `unhls_bbincidences`
--

DROP TABLE IF EXISTS `unhls_bbincidences`;
CREATE TABLE `unhls_bbincidences` (
  `id` int(10) UNSIGNED NOT NULL,
  `facility_id` int(10) UNSIGNED NOT NULL,
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
  `intervention_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intervention_time` time NOT NULL,
  `intervention_followup` text COLLATE utf8_unicode_ci NOT NULL,
  `mo_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mo_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mo_designation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mo_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cause` text COLLATE utf8_unicode_ci NOT NULL,
  `corrective_action` text COLLATE utf8_unicode_ci NOT NULL,
  `referral_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `analysis_date` date NOT NULL,
  `analysis_time` time NOT NULL,
  `bo_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bo_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bo_designation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bo_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `findings` text COLLATE utf8_unicode_ci NOT NULL,
  `improvement_plan` text COLLATE utf8_unicode_ci NOT NULL,
  `response_date` date DEFAULT NULL,
  `response_time` time DEFAULT NULL,
  `brm_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brm_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brm_designation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brm_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdby` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updatedby` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unhls_bbincidences`
--

INSERT INTO `unhls_bbincidences` (`id`, `facility_id`, `serial_no`, `occurrence_date`, `occurrence_time`, `personnel_id`, `personnel_surname`, `personnel_othername`, `personnel_gender`, `personnel_dob`, `personnel_age`, `personnel_category`, `personnel_telephone`, `personnel_email`, `nok_name`, `nok_telephone`, `nok_email`, `lab_section`, `occurrence`, `ulin`, `equip_name`, `equip_code`, `task`, `description`, `officer_fname`, `officer_lname`, `officer_cadre`, `officer_telephone`, `extent`, `firstaid`, `intervention`, `intervention_date`, `intervention_time`, `intervention_followup`, `mo_fname`, `mo_lname`, `mo_designation`, `mo_telephone`, `cause`, `corrective_action`, `referral_status`, `status`, `analysis_date`, `analysis_time`, `bo_fname`, `bo_lname`, `bo_designation`, `bo_telephone`, `findings`, `improvement_plan`, `response_date`, `response_time`, `brm_fname`, `brm_lname`, `brm_designation`, `brm_telephone`, `createdby`, `updatedby`, `created_at`, `updated_at`, `deleted_at`) VALUES(48, 2, 'BB/AGAH/2016/48', '2016-09-26', '12:00:00', '', '', '', 'Not Applicable', '0000-00-00', '', '', '', '', '', '', '', '', '5', '', '', '', '', 'Desc is here', '', '', '', '', '', '', '', '', '00:00:00', '', '', '', '', '', '', '', '', 'Ongoing', '0000-00-00', '00:00:00', '', '', '', '', '', '', '0000-00-00', '00:00:00', '', '', '', '', '5', '', '2016-09-26 10:01:47', '2016-09-26 10:01:48', NULL);
INSERT INTO `unhls_bbincidences` (`id`, `facility_id`, `serial_no`, `occurrence_date`, `occurrence_time`, `personnel_id`, `personnel_surname`, `personnel_othername`, `personnel_gender`, `personnel_dob`, `personnel_age`, `personnel_category`, `personnel_telephone`, `personnel_email`, `nok_name`, `nok_telephone`, `nok_email`, `lab_section`, `occurrence`, `ulin`, `equip_name`, `equip_code`, `task`, `description`, `officer_fname`, `officer_lname`, `officer_cadre`, `officer_telephone`, `extent`, `firstaid`, `intervention`, `intervention_date`, `intervention_time`, `intervention_followup`, `mo_fname`, `mo_lname`, `mo_designation`, `mo_telephone`, `cause`, `corrective_action`, `referral_status`, `status`, `analysis_date`, `analysis_time`, `bo_fname`, `bo_lname`, `bo_designation`, `bo_telephone`, `findings`, `improvement_plan`, `response_date`, `response_time`, `brm_fname`, `brm_lname`, `brm_designation`, `brm_telephone`, `createdby`, `updatedby`, `created_at`, `updated_at`, `deleted_at`) VALUES(51, 2, 'BB/AGAH/2016/51', '2016-09-06', '12:23:00', '', '', '', 'Not Applicable', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', 'desc is here', '', '', '', '', '', '', '', '', '00:00:00', '', '', '', '', '', '', '', '', 'Ongoing', '0000-00-00', '00:00:00', '', '', '', '', '', '', '0000-00-00', '00:00:00', '', '', '', '', '5', '', '2016-09-26 10:17:23', '2016-09-26 10:17:23', NULL);
INSERT INTO `unhls_bbincidences` (`id`, `facility_id`, `serial_no`, `occurrence_date`, `occurrence_time`, `personnel_id`, `personnel_surname`, `personnel_othername`, `personnel_gender`, `personnel_dob`, `personnel_age`, `personnel_category`, `personnel_telephone`, `personnel_email`, `nok_name`, `nok_telephone`, `nok_email`, `lab_section`, `occurrence`, `ulin`, `equip_name`, `equip_code`, `task`, `description`, `officer_fname`, `officer_lname`, `officer_cadre`, `officer_telephone`, `extent`, `firstaid`, `intervention`, `intervention_date`, `intervention_time`, `intervention_followup`, `mo_fname`, `mo_lname`, `mo_designation`, `mo_telephone`, `cause`, `corrective_action`, `referral_status`, `status`, `analysis_date`, `analysis_time`, `bo_fname`, `bo_lname`, `bo_designation`, `bo_telephone`, `findings`, `improvement_plan`, `response_date`, `response_time`, `brm_fname`, `brm_lname`, `brm_designation`, `brm_telephone`, `createdby`, `updatedby`, `created_at`, `updated_at`, `deleted_at`) VALUES(52, 2, 'BB/AGAH/2016/52', '2016-09-27', '12:12:00', '', '', '', 'Not Applicable', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', 'dsc', '', '', '', '', '', '', '', '', '00:00:00', '', '', '', '', '', '', '', '', 'Ongoing', '0000-00-00', '00:00:00', '', '', '', '', '', '', '0000-00-00', '00:00:00', '', '', '', '', '5', '', '2016-09-27 07:11:54', '2016-09-27 07:11:54', NULL);
INSERT INTO `unhls_bbincidences` (`id`, `facility_id`, `serial_no`, `occurrence_date`, `occurrence_time`, `personnel_id`, `personnel_surname`, `personnel_othername`, `personnel_gender`, `personnel_dob`, `personnel_age`, `personnel_category`, `personnel_telephone`, `personnel_email`, `nok_name`, `nok_telephone`, `nok_email`, `lab_section`, `occurrence`, `ulin`, `equip_name`, `equip_code`, `task`, `description`, `officer_fname`, `officer_lname`, `officer_cadre`, `officer_telephone`, `extent`, `firstaid`, `intervention`, `intervention_date`, `intervention_time`, `intervention_followup`, `mo_fname`, `mo_lname`, `mo_designation`, `mo_telephone`, `cause`, `corrective_action`, `referral_status`, `status`, `analysis_date`, `analysis_time`, `bo_fname`, `bo_lname`, `bo_designation`, `bo_telephone`, `findings`, `improvement_plan`, `response_date`, `response_time`, `brm_fname`, `brm_lname`, `brm_designation`, `brm_telephone`, `createdby`, `updatedby`, `created_at`, `updated_at`, `deleted_at`) VALUES(53, 2, 'BB/AGAH/2016/53', '2016-09-20', '12:12:00', '', '', '', 'Not Applicable', '0000-00-00', '', '', '', '', '', '', '', '', '4,2', '', '', '', '', 'desc', '', '', '', '', '', '', '', '', '00:00:00', '', '', '', '', '', '', '', '', 'Ongoing', '0000-00-00', '00:00:00', '', '', '', '', '', '', '0000-00-00', '00:00:00', '', '', '', '', '5', '', '2016-09-27 07:20:33', '2016-09-27 07:20:33', NULL);
INSERT INTO `unhls_bbincidences` (`id`, `facility_id`, `serial_no`, `occurrence_date`, `occurrence_time`, `personnel_id`, `personnel_surname`, `personnel_othername`, `personnel_gender`, `personnel_dob`, `personnel_age`, `personnel_category`, `personnel_telephone`, `personnel_email`, `nok_name`, `nok_telephone`, `nok_email`, `lab_section`, `occurrence`, `ulin`, `equip_name`, `equip_code`, `task`, `description`, `officer_fname`, `officer_lname`, `officer_cadre`, `officer_telephone`, `extent`, `firstaid`, `intervention`, `intervention_date`, `intervention_time`, `intervention_followup`, `mo_fname`, `mo_lname`, `mo_designation`, `mo_telephone`, `cause`, `corrective_action`, `referral_status`, `status`, `analysis_date`, `analysis_time`, `bo_fname`, `bo_lname`, `bo_designation`, `bo_telephone`, `findings`, `improvement_plan`, `response_date`, `response_time`, `brm_fname`, `brm_lname`, `brm_designation`, `brm_telephone`, `createdby`, `updatedby`, `created_at`, `updated_at`, `deleted_at`) VALUES(54, 2, 'BB/AGAH/2016/54', '2016-09-27', '12:12:00', '', '', '', 'Not Applicable', '0000-00-00', '', '', '', '', '', '', '', '', '5,3,1', '', '', '', '', 'desc', '', '', '', '', '', '', '', '', '00:00:00', '', '', '', '', '', '1,2,3', '4,2,1', '', 'Ongoing', '0000-00-00', '00:00:00', '', '', '', '', '', '', '0000-00-00', '00:00:00', '', '', '', '', '5', '', '2016-09-27 07:26:07', '2016-09-27 07:26:07', NULL);
INSERT INTO `unhls_bbincidences` (`id`, `facility_id`, `serial_no`, `occurrence_date`, `occurrence_time`, `personnel_id`, `personnel_surname`, `personnel_othername`, `personnel_gender`, `personnel_dob`, `personnel_age`, `personnel_category`, `personnel_telephone`, `personnel_email`, `nok_name`, `nok_telephone`, `nok_email`, `lab_section`, `occurrence`, `ulin`, `equip_name`, `equip_code`, `task`, `description`, `officer_fname`, `officer_lname`, `officer_cadre`, `officer_telephone`, `extent`, `firstaid`, `intervention`, `intervention_date`, `intervention_time`, `intervention_followup`, `mo_fname`, `mo_lname`, `mo_designation`, `mo_telephone`, `cause`, `corrective_action`, `referral_status`, `status`, `analysis_date`, `analysis_time`, `bo_fname`, `bo_lname`, `bo_designation`, `bo_telephone`, `findings`, `improvement_plan`, `response_date`, `response_time`, `brm_fname`, `brm_lname`, `brm_designation`, `brm_telephone`, `createdby`, `updatedby`, `created_at`, `updated_at`, `deleted_at`) VALUES(55, 2, 'BB/AGAH/2016/55', '2016-09-27', '12:30:00', '', '', '', 'Not Applicable', '0000-00-00', '', '', '', '', '', '', '', '', '4,3,1', '', '', '', '', 'desc', '', '', '', '', '', '', '', '', '00:00:00', '', '', '', '', '', '', '', '', 'Ongoing', '0000-00-00', '00:00:00', '', '', '', '', '', '', '0000-00-00', '00:00:00', '', '', '', '', '5', '', '2016-09-27 09:29:31', '2016-09-27 09:29:31', NULL);
INSERT INTO `unhls_bbincidences` (`id`, `facility_id`, `serial_no`, `occurrence_date`, `occurrence_time`, `personnel_id`, `personnel_surname`, `personnel_othername`, `personnel_gender`, `personnel_dob`, `personnel_age`, `personnel_category`, `personnel_telephone`, `personnel_email`, `nok_name`, `nok_telephone`, `nok_email`, `lab_section`, `occurrence`, `ulin`, `equip_name`, `equip_code`, `task`, `description`, `officer_fname`, `officer_lname`, `officer_cadre`, `officer_telephone`, `extent`, `firstaid`, `intervention`, `intervention_date`, `intervention_time`, `intervention_followup`, `mo_fname`, `mo_lname`, `mo_designation`, `mo_telephone`, `cause`, `corrective_action`, `referral_status`, `status`, `analysis_date`, `analysis_time`, `bo_fname`, `bo_lname`, `bo_designation`, `bo_telephone`, `findings`, `improvement_plan`, `response_date`, `response_time`, `brm_fname`, `brm_lname`, `brm_designation`, `brm_telephone`, `createdby`, `updatedby`, `created_at`, `updated_at`, `deleted_at`) VALUES(56, 2, 'BB/BHG/2016/56', '2016-09-20', '12:11:00', '', '', '', 'Not Applicable', '0000-00-00', '', '', '', '', '', '', '', '', '5,3', '', '', '', '', 'desc', '', '', '', '', '', '', '', '', '00:00:00', '', '', '', '', '', '2,4', '', '', 'Ongoing', '0000-00-00', '00:00:00', '', '', '', '', '', '', '0000-00-00', '00:00:00', '', '', '', '', '5', '', '2016-09-27 19:29:04', '2016-09-27 19:29:04', NULL);
INSERT INTO `unhls_bbincidences` (`id`, `facility_id`, `serial_no`, `occurrence_date`, `occurrence_time`, `personnel_id`, `personnel_surname`, `personnel_othername`, `personnel_gender`, `personnel_dob`, `personnel_age`, `personnel_category`, `personnel_telephone`, `personnel_email`, `nok_name`, `nok_telephone`, `nok_email`, `lab_section`, `occurrence`, `ulin`, `equip_name`, `equip_code`, `task`, `description`, `officer_fname`, `officer_lname`, `officer_cadre`, `officer_telephone`, `extent`, `firstaid`, `intervention`, `intervention_date`, `intervention_time`, `intervention_followup`, `mo_fname`, `mo_lname`, `mo_designation`, `mo_telephone`, `cause`, `corrective_action`, `referral_status`, `status`, `analysis_date`, `analysis_time`, `bo_fname`, `bo_lname`, `bo_designation`, `bo_telephone`, `findings`, `improvement_plan`, `response_date`, `response_time`, `brm_fname`, `brm_lname`, `brm_designation`, `brm_telephone`, `createdby`, `updatedby`, `created_at`, `updated_at`, `deleted_at`) VALUES(57, 2, 'BB/BHG/2016/57', '2016-09-20', '12:11:00', '', '', '', 'Not Applicable', '0000-00-00', '', '', '', '', '', '', '', '', '5,3', '', '', '', '', 'desc', '', '', '', '', '', '', '', '', '00:00:00', '', '', '', '', '', '2,4', '', '', 'Ongoing', '0000-00-00', '00:00:00', '', '', '', '', '', '', '0000-00-00', '00:00:00', '', '', '', '', '5', '', '2016-09-27 19:30:05', '2016-09-27 19:30:05', NULL);
INSERT INTO `unhls_bbincidences` (`id`, `facility_id`, `serial_no`, `occurrence_date`, `occurrence_time`, `personnel_id`, `personnel_surname`, `personnel_othername`, `personnel_gender`, `personnel_dob`, `personnel_age`, `personnel_category`, `personnel_telephone`, `personnel_email`, `nok_name`, `nok_telephone`, `nok_email`, `lab_section`, `occurrence`, `ulin`, `equip_name`, `equip_code`, `task`, `description`, `officer_fname`, `officer_lname`, `officer_cadre`, `officer_telephone`, `extent`, `firstaid`, `intervention`, `intervention_date`, `intervention_time`, `intervention_followup`, `mo_fname`, `mo_lname`, `mo_designation`, `mo_telephone`, `cause`, `corrective_action`, `referral_status`, `status`, `analysis_date`, `analysis_time`, `bo_fname`, `bo_lname`, `bo_designation`, `bo_telephone`, `findings`, `improvement_plan`, `response_date`, `response_time`, `brm_fname`, `brm_lname`, `brm_designation`, `brm_telephone`, `createdby`, `updatedby`, `created_at`, `updated_at`, `deleted_at`) VALUES(58, 2, 'BB/BHG/2016/58', '2016-09-20', '12:11:00', '', '', '', 'Not Applicable', '0000-00-00', '', '', '', '', '', '', '', '', '4,1', '', '', '', '', 'desc', '', '', '', '', 'Very big effect', '', 'injections administered', '2016-09-27', '12:00:00', 'Follow up intervention indicates that...', 'Jovias', 'Ssembatya', 'Nurse', '0703334456', '1,3', '4,1', 'Ressolved and not referred', 'Completed', '2016-09-28', '23:00:00', 'Willy', 'Kasule', 'Biosafety Officer', '0754446600', '', '', '0000-00-00', '00:00:00', '', '', '', '', '5', '5', '2016-09-27 19:30:33', '2016-09-27 21:04:39', NULL);
INSERT INTO `unhls_bbincidences` (`id`, `facility_id`, `serial_no`, `occurrence_date`, `occurrence_time`, `personnel_id`, `personnel_surname`, `personnel_othername`, `personnel_gender`, `personnel_dob`, `personnel_age`, `personnel_category`, `personnel_telephone`, `personnel_email`, `nok_name`, `nok_telephone`, `nok_email`, `lab_section`, `occurrence`, `ulin`, `equip_name`, `equip_code`, `task`, `description`, `officer_fname`, `officer_lname`, `officer_cadre`, `officer_telephone`, `extent`, `firstaid`, `intervention`, `intervention_date`, `intervention_time`, `intervention_followup`, `mo_fname`, `mo_lname`, `mo_designation`, `mo_telephone`, `cause`, `corrective_action`, `referral_status`, `status`, `analysis_date`, `analysis_time`, `bo_fname`, `bo_lname`, `bo_designation`, `bo_telephone`, `findings`, `improvement_plan`, `response_date`, `response_time`, `brm_fname`, `brm_lname`, `brm_designation`, `brm_telephone`, `createdby`, `updatedby`, `created_at`, `updated_at`, `deleted_at`) VALUES(59, 2, 'BB/BHG/2016/59', '2016-09-05', '12:12:00', '', '', '', 'Female', '1990-06-01', '26', '', '', '', '', '', '', '', '3,1', '', 'printer', '', '', 'This is the description', '', '', '', '', '', '', '', '', '00:00:00', '', '', '', '', '', '', '', '', '', '0000-00-00', '00:00:00', '', '', '', '', '', '', NULL, NULL, '', '', '', '', '5', '5', '2016-09-27 21:36:34', '2016-09-27 21:50:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unhls_bbincidences_action`
--

DROP TABLE IF EXISTS `unhls_bbincidences_action`;
CREATE TABLE `unhls_bbincidences_action` (
  `id` int(11) NOT NULL,
  `bbincidence_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unhls_bbincidences_action`
--

INSERT INTO `unhls_bbincidences_action` (`id`, `bbincidence_id`, `action_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(8, 58, 4, '2016-09-27 21:04:39', '2016-09-27 21:04:39', NULL);
INSERT INTO `unhls_bbincidences_action` (`id`, `bbincidence_id`, `action_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(9, 58, 1, '2016-09-27 21:04:39', '2016-09-27 21:04:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unhls_bbincidences_cause`
--

DROP TABLE IF EXISTS `unhls_bbincidences_cause`;
CREATE TABLE `unhls_bbincidences_cause` (
  `id` int(11) NOT NULL,
  `bbincidence_id` int(11) NOT NULL,
  `cause_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unhls_bbincidences_cause`
--

INSERT INTO `unhls_bbincidences_cause` (`id`, `bbincidence_id`, `cause_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(13, 58, 1, '2016-09-27 21:04:39', '2016-09-27 21:04:39', NULL);
INSERT INTO `unhls_bbincidences_cause` (`id`, `bbincidence_id`, `cause_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(14, 58, 3, '2016-09-27 21:04:39', '2016-09-27 21:04:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unhls_bbincidences_nature`
--

DROP TABLE IF EXISTS `unhls_bbincidences_nature`;
CREATE TABLE `unhls_bbincidences_nature` (
  `id` int(11) NOT NULL,
  `bbincidence_id` int(11) NOT NULL,
  `nature_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unhls_bbincidences_nature`
--

INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(1, 48, 5, '2016-09-26 10:01:48', '2016-09-26 10:01:48', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(2, 51, 4, '2016-09-26 10:17:23', '2016-09-26 10:17:23', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(3, 51, 5, '2016-09-26 10:17:23', '2016-09-26 10:17:23', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(4, 52, 5, '2016-09-27 07:11:54', '2016-09-27 07:11:54', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(5, 52, 3, '2016-09-27 07:11:54', '2016-09-27 07:11:54', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(6, 53, 4, '2016-09-27 07:20:33', '2016-09-27 07:20:33', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(7, 53, 2, '2016-09-27 07:20:33', '2016-09-27 07:20:33', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(8, 54, 5, '2016-09-27 07:26:07', '2016-09-27 07:26:07', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(9, 54, 3, '2016-09-27 07:26:07', '2016-09-27 07:26:07', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(10, 54, 1, '2016-09-27 07:26:07', '2016-09-27 07:26:07', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(11, 55, 4, '2016-09-27 09:29:31', '2016-09-27 09:29:31', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(12, 55, 3, '2016-09-27 09:29:31', '2016-09-27 09:29:31', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(13, 55, 1, '2016-09-27 09:29:32', '2016-09-27 09:29:32', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(14, 56, 5, '2016-09-27 19:29:04', '2016-09-27 19:29:04', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(15, 56, 3, '2016-09-27 19:29:04', '2016-09-27 19:29:04', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(16, 57, 5, '2016-09-27 19:30:05', '2016-09-27 19:30:05', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(17, 57, 3, '2016-09-27 19:30:05', '2016-09-27 19:30:05', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(26, 58, 4, '2016-09-27 20:39:57', '2016-09-27 20:39:57', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(27, 58, 1, '2016-09-27 20:39:57', '2016-09-27 20:39:57', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(34, 59, 3, '2016-09-27 21:50:39', '2016-09-27 21:50:39', NULL);
INSERT INTO `unhls_bbincidences_nature` (`id`, `bbincidence_id`, `nature_id`, `created_at`, `updated_at`, `deleted_at`) VALUES(35, 59, 1, '2016-09-27 21:50:39', '2016-09-27 21:50:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unhls_bbnatures`
--

DROP TABLE IF EXISTS `unhls_bbnatures`;
CREATE TABLE `unhls_bbnatures` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `priority` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unhls_bbnatures`
--

INSERT INTO `unhls_bbnatures` (`id`, `name`, `class`, `priority`) VALUES(1, 'Fighting among staff', 'Psychological', 'Major');
INSERT INTO `unhls_bbnatures` (`id`, `name`, `class`, `priority`) VALUES(2, 'Fainting', 'Psychological', 'Minor');
INSERT INTO `unhls_bbnatures` (`id`, `name`, `class`, `priority`) VALUES(3, 'Roof leakages', 'Physical', 'Major');
INSERT INTO `unhls_bbnatures` (`id`, `name`, `class`, `priority`) VALUES(4, 'Machine cuts/bruises', 'Mechanical', 'Minor');
INSERT INTO `unhls_bbnatures` (`id`, `name`, `class`, `priority`) VALUES(5, 'Electric shock/burn', 'Mechanical', 'Major');

-- --------------------------------------------------------

--
-- Table structure for table `unhls_districts`
--

DROP TABLE IF EXISTS `unhls_districts`;
CREATE TABLE `unhls_districts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_drugs`
--

DROP TABLE IF EXISTS `unhls_drugs`;
CREATE TABLE `unhls_drugs` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_facilities`
--

DROP TABLE IF EXISTS `unhls_facilities`;
CREATE TABLE `unhls_facilities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `district_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_financial_years`
--

DROP TABLE IF EXISTS `unhls_financial_years`;
CREATE TABLE `unhls_financial_years` (
  `id` int(10) UNSIGNED NOT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `facility_id` int(10) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT '0',
  `designation` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `facility_id`, `username`, `password`, `email`, `name`, `gender`, `designation`, `image`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES(1, 3, 'administrator', '$2y$10$EYvF6HX.FCt.hyZiOCSukOQwdMVxT8lFvMwrOhACqTgz5JJ/5e5Wq', 'admin@kblis.org', 'kBLIS Administrator', 0, 'Programmer', NULL, 'tf7Pk4GqS1QKnjkU5jPrIUJSrzK2IlkqbXUW2eqQPj7cPZeB9GTjIBYGqMuA', NULL, '2016-08-01 07:31:36', '2016-08-23 08:04:08');
INSERT INTO `users` (`id`, `facility_id`, `username`, `password`, `email`, `name`, `gender`, `designation`, `image`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES(2, 0, 'external', '$2y$10$1CeIt2IBS9HqFTSsYO0BleRVoL8rLksEZn4uxqSb91/F3TytPlM5a', 'admin@kblis.org', 'External System User', 0, 'Administrator', '/i/users/user-2.jpg', NULL, NULL, '2016-08-01 07:31:37', '2016-08-01 07:31:37');
INSERT INTO `users` (`id`, `facility_id`, `username`, `password`, `email`, `name`, `gender`, `designation`, `image`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES(3, 0, 'lmorena', '$2y$10$aBiaXzEv8qBlJH0S9dxtPuTpai8af4I.8hXtq723trfAnjAgG40py', 'lmorena@kblis.org', 'L. Morena', 0, 'Lab Technologist', '/i/users/user-3.png', NULL, NULL, '2016-08-01 07:31:37', '2016-08-01 07:31:37');
INSERT INTO `users` (`id`, `facility_id`, `username`, `password`, `email`, `name`, `gender`, `designation`, `image`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES(4, 0, 'abumeyang', '$2y$10$TGnK6m3ZeVSzNXdyXQITSeXEmV41Yd6meTwi8UJZZy3HjZBxRGkTa', 'abumeyang@kblis.org', 'A. Abumeyang', 0, 'Doctor', NULL, NULL, NULL, '2016-08-01 07:31:37', '2016-08-01 07:31:37');
INSERT INTO `users` (`id`, `facility_id`, `username`, `password`, `email`, `name`, `gender`, `designation`, `image`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES(5, 2, 'justusashaba', '$2y$10$DEQdlTIrQZ8FRaWjevlI9eirqGb04OjV2L95wqMxarQIY8nn7Kfke', 'justusashaba@gmail.com', 'Justus Ashaba', 0, 'Programmer', NULL, '8yX3LF1whmBdLRheMe29n8WKOPp2bjE0a9Z8zC1LRZrwoEDmSnMVb0fsDTP1', NULL, '2016-08-17 09:55:28', '2016-08-25 09:34:17');

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
CREATE TABLE `visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `visit_type` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Out-patient',
  `visit_number` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `visits`
--

INSERT INTO `visits` (`id`, `patient_id`, `visit_type`, `visit_number`, `created_at`, `updated_at`) VALUES(1, 1, 'Out-patient', NULL, '2016-08-01 07:31:48', '2016-08-01 07:31:48');
INSERT INTO `visits` (`id`, `patient_id`, `visit_type`, `visit_number`, `created_at`, `updated_at`) VALUES(2, 4, 'Out-patient', NULL, '2016-08-01 07:31:48', '2016-08-01 07:31:48');
INSERT INTO `visits` (`id`, `patient_id`, `visit_type`, `visit_number`, `created_at`, `updated_at`) VALUES(3, 2, 'Out-patient', NULL, '2016-08-01 07:31:48', '2016-08-01 07:31:48');
INSERT INTO `visits` (`id`, `patient_id`, `visit_type`, `visit_number`, `created_at`, `updated_at`) VALUES(4, 1, 'Out-patient', NULL, '2016-08-01 07:31:48', '2016-08-01 07:31:48');
INSERT INTO `visits` (`id`, `patient_id`, `visit_type`, `visit_number`, `created_at`, `updated_at`) VALUES(5, 5, 'Out-patient', NULL, '2016-08-01 07:31:48', '2016-08-01 07:31:48');
INSERT INTO `visits` (`id`, `patient_id`, `visit_type`, `visit_number`, `created_at`, `updated_at`) VALUES(6, 2, 'Out-patient', NULL, '2016-08-01 07:31:48', '2016-08-01 07:31:48');
INSERT INTO `visits` (`id`, `patient_id`, `visit_type`, `visit_number`, `created_at`, `updated_at`) VALUES(7, 2, 'Out-patient', NULL, '2016-08-01 07:31:48', '2016-08-01 07:31:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assigned_roles`
--
ALTER TABLE `assigned_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_roles_user_id_foreign` (`user_id`),
  ADD KEY `assigned_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `barcode_settings`
--
ALTER TABLE `barcode_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commodities`
--
ALTER TABLE `commodities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commodities_metric_id_foreign` (`metric_id`);

--
-- Indexes for table `control_measure_ranges`
--
ALTER TABLE `control_measure_ranges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `control_measure_ranges_control_measure_id_foreign` (`control_measure_id`);

--
-- Indexes for table `control_measures`
--
ALTER TABLE `control_measures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `control_measures_control_measure_type_id_foreign` (`control_measure_type_id`),
  ADD KEY `control_measures_control_id_foreign` (`control_id`);

--
-- Indexes for table `control_results`
--
ALTER TABLE `control_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `control_results_control_test_id_foreign` (`control_test_id`),
  ADD KEY `control_results_control_measure_id_foreign` (`control_measure_id`);

--
-- Indexes for table `control_tests`
--
ALTER TABLE `control_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `control_tests_control_id_foreign` (`control_id`),
  ADD KEY `control_tests_entered_by_foreign` (`entered_by`);

--
-- Indexes for table `controls`
--
ALTER TABLE `controls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `controls_name_unique` (`name`),
  ADD KEY `controls_lot_id_foreign` (`lot_id`);

--
-- Indexes for table `culture_worksheet`
--
ALTER TABLE `culture_worksheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `culture_worksheet_user_id_foreign` (`user_id`),
  ADD KEY `culture_worksheet_test_id_foreign` (`test_id`);

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drug_susceptibility`
--
ALTER TABLE `drug_susceptibility`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drug_susceptibility_user_id_foreign` (`user_id`),
  ADD KEY `drug_susceptibility_test_id_foreign` (`test_id`),
  ADD KEY `drug_susceptibility_organism_id_foreign` (`organism_id`),
  ADD KEY `drug_susceptibility_drug_id_foreign` (`drug_id`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `drugs_name_unique` (`name`);

--
-- Indexes for table `equip_config`
--
ALTER TABLE `equip_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equip_config_equip_id_foreign` (`equip_id`),
  ADD KEY `equip_config_prop_id_foreign` (`prop_id`);

--
-- Indexes for table `external_dump`
--
ALTER TABLE `external_dump`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `external_dump_lab_no_unique` (`lab_no`),
  ADD KEY `external_dump_parent_lab_no_index` (`parent_lab_no`);

--
-- Indexes for table `external_users`
--
ALTER TABLE `external_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `external_users_internal_user_id_unique` (`internal_user_id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ii_quickcodes`
--
ALTER TABLE `ii_quickcodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instrument_testtypes`
--
ALTER TABLE `instrument_testtypes`
  ADD UNIQUE KEY `instrument_testtypes_instrument_id_test_type_id_unique` (`instrument_id`,`test_type_id`),
  ADD KEY `instrument_testtypes_test_type_id_foreign` (`test_type_id`);

--
-- Indexes for table `instruments`
--
ALTER TABLE `instruments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interfaced_equipment`
--
ALTER TABLE `interfaced_equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interfaced_equipment_lab_section_foreign` (`lab_section`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issues_topup_request_id_foreign` (`topup_request_id`),
  ADD KEY `issues_receipt_id_foreign` (`receipt_id`),
  ADD KEY `issues_issued_to_foreign` (`issued_to`),
  ADD KEY `issues_user_id_foreign` (`user_id`);

--
-- Indexes for table `lots`
--
ALTER TABLE `lots`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lots_number_unique` (`number`),
  ADD KEY `lots_instrument_id_foreign` (`instrument_id`);

--
-- Indexes for table `measure_ranges`
--
ALTER TABLE `measure_ranges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `measure_ranges_alphanumeric_index` (`alphanumeric`),
  ADD KEY `measure_ranges_measure_id_foreign` (`measure_id`);

--
-- Indexes for table `measure_types`
--
ALTER TABLE `measure_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `measure_types_name_unique` (`name`);

--
-- Indexes for table `measures`
--
ALTER TABLE `measures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `measures_measure_type_id_foreign` (`measure_type_id`);

--
-- Indexes for table `metrics`
--
ALTER TABLE `metrics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organism_drugs`
--
ALTER TABLE `organism_drugs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organism_drugs_organism_id_drug_id_unique` (`organism_id`,`drug_id`),
  ADD KEY `organism_drugs_drug_id_foreign` (`drug_id`);

--
-- Indexes for table `organisms`
--
ALTER TABLE `organisms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organisms_name_unique` (`name`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patients_external_patient_number_index` (`external_patient_number`),
  ADD KEY `patients_created_by_index` (`created_by`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receipts_commodity_id_foreign` (`commodity_id`),
  ADD KEY `receipts_supplier_id_foreign` (`supplier_id`),
  ADD KEY `receipts_user_id_foreign` (`user_id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referrals_user_id_foreign` (`user_id`),
  ADD KEY `referrals_facility_id_foreign` (`facility_id`);

--
-- Indexes for table `rejection_reasons`
--
ALTER TABLE `rejection_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_diseases`
--
ALTER TABLE `report_diseases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `report_diseases_test_type_id_disease_id_unique` (`test_type_id`,`disease_id`),
  ADD KEY `report_diseases_disease_id_foreign` (`disease_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `specimen_statuses`
--
ALTER TABLE `specimen_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specimen_types`
--
ALTER TABLE `specimen_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specimens`
--
ALTER TABLE `specimens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specimens_accepted_by_index` (`accepted_by`),
  ADD KEY `specimens_rejected_by_index` (`rejected_by`),
  ADD KEY `specimens_specimen_type_id_foreign` (`specimen_type_id`),
  ADD KEY `specimens_specimen_status_id_foreign` (`specimen_status_id`),
  ADD KEY `specimens_rejection_reason_id_foreign` (`rejection_reason_id`),
  ADD KEY `specimens_referral_id_foreign` (`referral_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_categories`
--
ALTER TABLE `test_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `test_categories_name_unique` (`name`);

--
-- Indexes for table `test_phases`
--
ALTER TABLE `test_phases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_results`
--
ALTER TABLE `test_results`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `test_results_test_id_measure_id_unique` (`test_id`,`measure_id`),
  ADD KEY `test_results_measure_id_foreign` (`measure_id`);

--
-- Indexes for table `test_statuses`
--
ALTER TABLE `test_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_statuses_test_phase_id_foreign` (`test_phase_id`);

--
-- Indexes for table `test_types`
--
ALTER TABLE `test_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_types_test_category_id_foreign` (`test_category_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tests_created_by_index` (`created_by`),
  ADD KEY `tests_tested_by_index` (`tested_by`),
  ADD KEY `tests_verified_by_index` (`verified_by`),
  ADD KEY `tests_visit_id_foreign` (`visit_id`),
  ADD KEY `tests_test_type_id_foreign` (`test_type_id`),
  ADD KEY `tests_specimen_id_foreign` (`specimen_id`),
  ADD KEY `tests_test_status_id_foreign` (`test_status_id`);

--
-- Indexes for table `testtype_measures`
--
ALTER TABLE `testtype_measures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `testtype_measures_test_type_id_measure_id_unique` (`test_type_id`,`measure_id`),
  ADD KEY `testtype_measures_measure_id_foreign` (`measure_id`);

--
-- Indexes for table `testtype_organisms`
--
ALTER TABLE `testtype_organisms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `testtype_organisms_test_type_id_organism_id_unique` (`test_type_id`,`organism_id`),
  ADD KEY `testtype_organisms_organism_id_foreign` (`organism_id`);

--
-- Indexes for table `testtype_specimentypes`
--
ALTER TABLE `testtype_specimentypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `testtype_specimentypes_test_type_id_specimen_type_id_unique` (`test_type_id`,`specimen_type_id`),
  ADD KEY `testtype_specimentypes_specimen_type_id_foreign` (`specimen_type_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD KEY `tokens_email_index` (`email`),
  ADD KEY `tokens_token_index` (`token`);

--
-- Indexes for table `topup_requests`
--
ALTER TABLE `topup_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topup_requests_test_category_id_foreign` (`test_category_id`),
  ADD KEY `topup_requests_commodity_id_foreign` (`commodity_id`),
  ADD KEY `topup_requests_user_id_foreign` (`user_id`);

--
-- Indexes for table `unhls_bbactions`
--
ALTER TABLE `unhls_bbactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_bbcauses`
--
ALTER TABLE `unhls_bbcauses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_bbincidences`
--
ALTER TABLE `unhls_bbincidences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_bbincidences_action`
--
ALTER TABLE `unhls_bbincidences_action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_bbincidences_cause`
--
ALTER TABLE `unhls_bbincidences_cause`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_bbincidences_nature`
--
ALTER TABLE `unhls_bbincidences_nature`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_bbnatures`
--
ALTER TABLE `unhls_bbnatures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_districts`
--
ALTER TABLE `unhls_districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_drugs`
--
ALTER TABLE `unhls_drugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_facilities`
--
ALTER TABLE `unhls_facilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unhls_facilities_district_id_foreign` (`district_id`);

--
-- Indexes for table `unhls_financial_years`
--
ALTER TABLE `unhls_financial_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visits_visit_number_index` (`visit_number`),
  ADD KEY `visits_patient_id_foreign` (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assigned_roles`
--
ALTER TABLE `assigned_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `barcode_settings`
--
ALTER TABLE `barcode_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `commodities`
--
ALTER TABLE `commodities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `control_measure_ranges`
--
ALTER TABLE `control_measure_ranges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `control_measures`
--
ALTER TABLE `control_measures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `control_results`
--
ALTER TABLE `control_results`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `control_tests`
--
ALTER TABLE `control_tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `controls`
--
ALTER TABLE `controls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `culture_worksheet`
--
ALTER TABLE `culture_worksheet`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `diseases`
--
ALTER TABLE `diseases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `drug_susceptibility`
--
ALTER TABLE `drug_susceptibility`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `equip_config`
--
ALTER TABLE `equip_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `external_dump`
--
ALTER TABLE `external_dump`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `external_users`
--
ALTER TABLE `external_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ii_quickcodes`
--
ALTER TABLE `ii_quickcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `instruments`
--
ALTER TABLE `instruments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `interfaced_equipment`
--
ALTER TABLE `interfaced_equipment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `lots`
--
ALTER TABLE `lots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `measure_ranges`
--
ALTER TABLE `measure_ranges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `measures`
--
ALTER TABLE `measures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `metrics`
--
ALTER TABLE `metrics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `organism_drugs`
--
ALTER TABLE `organism_drugs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `organisms`
--
ALTER TABLE `organisms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rejection_reasons`
--
ALTER TABLE `rejection_reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `report_diseases`
--
ALTER TABLE `report_diseases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `specimen_types`
--
ALTER TABLE `specimen_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `specimens`
--
ALTER TABLE `specimens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `test_categories`
--
ALTER TABLE `test_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `test_results`
--
ALTER TABLE `test_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `test_types`
--
ALTER TABLE `test_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `testtype_measures`
--
ALTER TABLE `testtype_measures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `testtype_organisms`
--
ALTER TABLE `testtype_organisms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `testtype_specimentypes`
--
ALTER TABLE `testtype_specimentypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `topup_requests`
--
ALTER TABLE `topup_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `unhls_bbactions`
--
ALTER TABLE `unhls_bbactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `unhls_bbcauses`
--
ALTER TABLE `unhls_bbcauses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `unhls_bbincidences`
--
ALTER TABLE `unhls_bbincidences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT for table `unhls_bbincidences_action`
--
ALTER TABLE `unhls_bbincidences_action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `unhls_bbincidences_cause`
--
ALTER TABLE `unhls_bbincidences_cause`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `unhls_bbincidences_nature`
--
ALTER TABLE `unhls_bbincidences_nature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `unhls_bbnatures`
--
ALTER TABLE `unhls_bbnatures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `unhls_districts`
--
ALTER TABLE `unhls_districts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_drugs`
--
ALTER TABLE `unhls_drugs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_facilities`
--
ALTER TABLE `unhls_facilities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_financial_years`
--
ALTER TABLE `unhls_financial_years`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `assigned_roles`
--
ALTER TABLE `assigned_roles`
  ADD CONSTRAINT `assigned_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `assigned_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `commodities`
--
ALTER TABLE `commodities`
  ADD CONSTRAINT `commodities_metric_id_foreign` FOREIGN KEY (`metric_id`) REFERENCES `metrics` (`id`);

--
-- Constraints for table `control_measure_ranges`
--
ALTER TABLE `control_measure_ranges`
  ADD CONSTRAINT `control_measure_ranges_control_measure_id_foreign` FOREIGN KEY (`control_measure_id`) REFERENCES `control_measures` (`id`);

--
-- Constraints for table `control_measures`
--
ALTER TABLE `control_measures`
  ADD CONSTRAINT `control_measures_control_id_foreign` FOREIGN KEY (`control_id`) REFERENCES `controls` (`id`),
  ADD CONSTRAINT `control_measures_control_measure_type_id_foreign` FOREIGN KEY (`control_measure_type_id`) REFERENCES `measure_types` (`id`);

--
-- Constraints for table `control_results`
--
ALTER TABLE `control_results`
  ADD CONSTRAINT `control_results_control_measure_id_foreign` FOREIGN KEY (`control_measure_id`) REFERENCES `control_measures` (`id`),
  ADD CONSTRAINT `control_results_control_test_id_foreign` FOREIGN KEY (`control_test_id`) REFERENCES `control_tests` (`id`);

--
-- Constraints for table `control_tests`
--
ALTER TABLE `control_tests`
  ADD CONSTRAINT `control_tests_control_id_foreign` FOREIGN KEY (`control_id`) REFERENCES `controls` (`id`),
  ADD CONSTRAINT `control_tests_entered_by_foreign` FOREIGN KEY (`entered_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `controls`
--
ALTER TABLE `controls`
  ADD CONSTRAINT `controls_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`);

--
-- Constraints for table `culture_worksheet`
--
ALTER TABLE `culture_worksheet`
  ADD CONSTRAINT `culture_worksheet_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`),
  ADD CONSTRAINT `culture_worksheet_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `drug_susceptibility`
--
ALTER TABLE `drug_susceptibility`
  ADD CONSTRAINT `drug_susceptibility_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`),
  ADD CONSTRAINT `drug_susceptibility_organism_id_foreign` FOREIGN KEY (`organism_id`) REFERENCES `organisms` (`id`),
  ADD CONSTRAINT `drug_susceptibility_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`),
  ADD CONSTRAINT `drug_susceptibility_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `equip_config`
--
ALTER TABLE `equip_config`
  ADD CONSTRAINT `equip_config_equip_id_foreign` FOREIGN KEY (`equip_id`) REFERENCES `interfaced_equipment` (`id`),
  ADD CONSTRAINT `equip_config_prop_id_foreign` FOREIGN KEY (`prop_id`) REFERENCES `ii_quickcodes` (`id`);

--
-- Constraints for table `external_users`
--
ALTER TABLE `external_users`
  ADD CONSTRAINT `external_users_internal_user_id_foreign` FOREIGN KEY (`internal_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `instrument_testtypes`
--
ALTER TABLE `instrument_testtypes`
  ADD CONSTRAINT `instrument_testtypes_instrument_id_foreign` FOREIGN KEY (`instrument_id`) REFERENCES `instruments` (`id`),
  ADD CONSTRAINT `instrument_testtypes_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`);

--
-- Constraints for table `interfaced_equipment`
--
ALTER TABLE `interfaced_equipment`
  ADD CONSTRAINT `interfaced_equipment_lab_section_foreign` FOREIGN KEY (`lab_section`) REFERENCES `test_categories` (`id`);

--
-- Constraints for table `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `issues_issued_to_foreign` FOREIGN KEY (`issued_to`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `issues_receipt_id_foreign` FOREIGN KEY (`receipt_id`) REFERENCES `receipts` (`id`),
  ADD CONSTRAINT `issues_topup_request_id_foreign` FOREIGN KEY (`topup_request_id`) REFERENCES `topup_requests` (`id`),
  ADD CONSTRAINT `issues_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `lots`
--
ALTER TABLE `lots`
  ADD CONSTRAINT `lots_instrument_id_foreign` FOREIGN KEY (`instrument_id`) REFERENCES `instruments` (`id`);

--
-- Constraints for table `measure_ranges`
--
ALTER TABLE `measure_ranges`
  ADD CONSTRAINT `measure_ranges_measure_id_foreign` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`);

--
-- Constraints for table `measures`
--
ALTER TABLE `measures`
  ADD CONSTRAINT `measures_measure_type_id_foreign` FOREIGN KEY (`measure_type_id`) REFERENCES `measure_types` (`id`);

--
-- Constraints for table `organism_drugs`
--
ALTER TABLE `organism_drugs`
  ADD CONSTRAINT `organism_drugs_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`),
  ADD CONSTRAINT `organism_drugs_organism_id_foreign` FOREIGN KEY (`organism_id`) REFERENCES `organisms` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `receipts`
--
ALTER TABLE `receipts`
  ADD CONSTRAINT `receipts_commodity_id_foreign` FOREIGN KEY (`commodity_id`) REFERENCES `commodities` (`id`),
  ADD CONSTRAINT `receipts_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `receipts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `referrals`
--
ALTER TABLE `referrals`
  ADD CONSTRAINT `referrals_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`),
  ADD CONSTRAINT `referrals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `report_diseases`
--
ALTER TABLE `report_diseases`
  ADD CONSTRAINT `report_diseases_disease_id_foreign` FOREIGN KEY (`disease_id`) REFERENCES `diseases` (`id`),
  ADD CONSTRAINT `report_diseases_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`);

--
-- Constraints for table `specimens`
--
ALTER TABLE `specimens`
  ADD CONSTRAINT `specimens_referral_id_foreign` FOREIGN KEY (`referral_id`) REFERENCES `referrals` (`id`),
  ADD CONSTRAINT `specimens_rejection_reason_id_foreign` FOREIGN KEY (`rejection_reason_id`) REFERENCES `rejection_reasons` (`id`),
  ADD CONSTRAINT `specimens_specimen_status_id_foreign` FOREIGN KEY (`specimen_status_id`) REFERENCES `specimen_statuses` (`id`),
  ADD CONSTRAINT `specimens_specimen_type_id_foreign` FOREIGN KEY (`specimen_type_id`) REFERENCES `specimen_types` (`id`);

--
-- Constraints for table `test_results`
--
ALTER TABLE `test_results`
  ADD CONSTRAINT `test_results_measure_id_foreign` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`),
  ADD CONSTRAINT `test_results_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`);

--
-- Constraints for table `test_statuses`
--
ALTER TABLE `test_statuses`
  ADD CONSTRAINT `test_statuses_test_phase_id_foreign` FOREIGN KEY (`test_phase_id`) REFERENCES `test_phases` (`id`);

--
-- Constraints for table `test_types`
--
ALTER TABLE `test_types`
  ADD CONSTRAINT `test_types_test_category_id_foreign` FOREIGN KEY (`test_category_id`) REFERENCES `test_categories` (`id`);

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `tests_specimen_id_foreign` FOREIGN KEY (`specimen_id`) REFERENCES `specimens` (`id`),
  ADD CONSTRAINT `tests_test_status_id_foreign` FOREIGN KEY (`test_status_id`) REFERENCES `test_statuses` (`id`),
  ADD CONSTRAINT `tests_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`),
  ADD CONSTRAINT `tests_visit_id_foreign` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`);

--
-- Constraints for table `testtype_measures`
--
ALTER TABLE `testtype_measures`
  ADD CONSTRAINT `testtype_measures_measure_id_foreign` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`),
  ADD CONSTRAINT `testtype_measures_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`);

--
-- Constraints for table `testtype_organisms`
--
ALTER TABLE `testtype_organisms`
  ADD CONSTRAINT `testtype_organisms_organism_id_foreign` FOREIGN KEY (`organism_id`) REFERENCES `organisms` (`id`),
  ADD CONSTRAINT `testtype_organisms_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`);

--
-- Constraints for table `testtype_specimentypes`
--
ALTER TABLE `testtype_specimentypes`
  ADD CONSTRAINT `testtype_specimentypes_specimen_type_id_foreign` FOREIGN KEY (`specimen_type_id`) REFERENCES `specimen_types` (`id`),
  ADD CONSTRAINT `testtype_specimentypes_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`);

--
-- Constraints for table `topup_requests`
--
ALTER TABLE `topup_requests`
  ADD CONSTRAINT `topup_requests_commodity_id_foreign` FOREIGN KEY (`commodity_id`) REFERENCES `commodities` (`id`),
  ADD CONSTRAINT `topup_requests_test_category_id_foreign` FOREIGN KEY (`test_category_id`) REFERENCES `test_categories` (`id`),
  ADD CONSTRAINT `topup_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `unhls_facilities`
--
ALTER TABLE `unhls_facilities`
  ADD CONSTRAINT `unhls_facilities_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `unhls_districts` (`id`);

--
-- Constraints for table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
