-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for golden_ratio
USE `busines2_golden_ratio`;

-- Dumping structure for table golden_ratio.account_transactions
DROP TABLE IF EXISTS `account_transactions`;
CREATE TABLE IF NOT EXISTS `account_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_transaction_auto_id` bigint unsigned NOT NULL,
  `voucher_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `coa_id` bigint unsigned NOT NULL,
  `coa_head_code` bigint NOT NULL,
  `narration` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `debit_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `credit_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posted` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `approved_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_transactions_account_transaction_auto_id_foreign` (`account_transaction_auto_id`),
  KEY `account_transactions_coa_id_foreign` (`coa_id`),
  KEY `account_transactions_approved_by_foreign` (`approved_by`),
  KEY `account_transactions_created_by_foreign` (`created_by`),
  KEY `account_transactions_updated_by_foreign` (`updated_by`),
  KEY `account_transactions_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.account_transactions: ~46 rows (approximately)
DELETE FROM `account_transactions`;
INSERT INTO `account_transactions` (`id`, `account_transaction_auto_id`, `voucher_no`, `voucher_type`, `date`, `coa_id`, `coa_head_code`, `narration`, `debit_amount`, `credit_amount`, `document`, `posted`, `approved`, `approved_by`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 5, 'CC2602001', 'Client Collection', '2026-02-22', 262, 301, 'Client collection against Payment No - CC2602001', 22.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 00:07:51', '2026-02-22 00:07:51'),
	(2, 6, 'CC2602001', 'Client Collection', '2026-02-22', 254, 401, 'Client collection against Payment No - CC2602001', 0.00, 22.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 00:07:51', '2026-02-22 00:07:51'),
	(3, 3, 'CS2602001', 'Client Sales', '2026-02-22', 254, 401, 'Client Sales Against Invoice No - CS2602001', 22.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 00:07:55', '2026-02-22 00:07:55'),
	(4, 4, 'CS2602001', 'Client Sales', '2026-02-22', 254, 3, 'Client Sales Against Invoice No - CS2602001', 0.00, 22.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 00:07:55', '2026-02-22 00:07:55'),
	(5, 7, 'CS2602002', 'Client Sales', '2026-02-22', 254, 401, 'Client Sales Against Invoice No - CS2602002', 22.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 00:23:22', '2026-02-22 00:23:22'),
	(6, 8, 'CS2602002', 'Client Sales', '2026-02-22', 254, 3, 'Client Sales Against Invoice No - CS2602002', 0.00, 22.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 00:23:22', '2026-02-22 00:23:22'),
	(7, 9, 'CS2602003', 'Client Sales', '2026-02-22', 254, 401, 'Client Sales Against Invoice No - CS2602003', 22.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 00:30:47', '2026-02-22 00:30:47'),
	(8, 10, 'CS2602003', 'Client Sales', '2026-02-22', 254, 3, 'Client Sales Against Invoice No - CS2602003', 0.00, 22.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 00:30:47', '2026-02-22 00:30:47'),
	(9, 12, 'EXP-2602001', 'Expense', '2026-02-22', 254, 401, '222', 13.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, '2026-02-22 00:46:44', '2026-02-22 00:46:40', '2026-02-22 00:46:44'),
	(10, 11, 'EXP-2602001', 'Expense', '2026-02-22', 262, 301, '222', 0.00, 13.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 00:46:44', '2026-02-22 00:46:44'),
	(11, 13, 'IP2602001', 'Investor Payment', '2026-02-22', 257, 102, 'Investor Payment against payment no - IP2602001', 1000.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 01:14:37', '2026-02-22 01:14:37'),
	(12, 14, 'IP2602001', 'Investor Payment', '2026-02-22', 262, 301, 'Investor Payment against payment no - IP2602001', 0.00, 1000.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 01:14:37', '2026-02-22 01:14:37'),
	(13, 17, 'CS2602004', 'Client Sales', '1970-01-01', 266, 3, 'Client Sales Against Invoice No - CS2602004', 22.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 02:44:00', '2026-02-22 02:44:00'),
	(14, 18, 'CS2602004', 'Client Sales', '1970-01-01', 3, 3, 'Client Sales Against Invoice No - CS2602004', 0.00, 22.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 02:44:00', '2026-02-22 02:44:00'),
	(15, 19, 'CS2602005', 'Client Sales', '1970-01-01', 269, 8, 'Client Sales Against Invoice No - CS2602005', 22.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 02:52:02', '2026-02-22 02:52:02'),
	(16, 20, 'CS2602005', 'Client Sales', '1970-01-01', 3, 3, 'Client Sales Against Invoice No - CS2602005', 0.00, 22.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 02:52:02', '2026-02-22 02:52:02'),
	(17, 21, 'EXP-2602002', 'Expense', '2026-02-23', 9, 10103, NULL, 0.00, 25.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:08:00', '2026-02-22 21:08:00'),
	(18, 22, 'EXP-2602002', 'Expense', '2026-02-23', 180, 40247, NULL, 25.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:08:00', '2026-02-22 21:08:00'),
	(19, 23, 'CC2602002', 'Client Collection', '2026-02-23', 13, 1010201, 'Client collection against payment no - CC2602002', 44.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:10:10', '2026-02-22 21:10:10'),
	(20, 24, 'CC2602002', 'Client Collection', '2026-02-23', 254, 404, 'Client collection against payment no - CC2602002', 0.00, 44.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:10:10', '2026-02-22 21:10:10'),
	(21, 15, 'IP2602002', 'Investor Payment', '2026-02-22', 257, 102, 'Investor Payment against payment no - IP2602002', 980.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:10:15', '2026-02-22 21:10:15'),
	(22, 16, 'IP2602002', 'Investor Payment', '2026-02-22', 262, 301, 'Investor Payment against payment no - IP2602002', 0.00, 980.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:10:15', '2026-02-22 21:10:15'),
	(23, 25, 'CC2602003', 'Client Collection', '2026-02-23', 26, 301, 'Client collection against payment no - CC2602003', 22.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:20:51', '2026-02-22 21:20:51'),
	(24, 26, 'CC2602003', 'Client Collection', '2026-02-23', 269, 20102, 'Client collection against payment no - CC2602003', 0.00, 22.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:20:51', '2026-02-22 21:20:51'),
	(25, 27, 'EXP-2602003', 'Expense', '2026-02-23', 8, 10102, 'Expense', 0.00, 14.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:22:05', '2026-02-22 21:22:05'),
	(26, 28, 'EXP-2602003', 'Expense', '2026-02-23', 70, 20202, 'Expense', 14.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:22:05', '2026-02-22 21:22:05'),
	(27, 29, 'EXP-2602004', 'Expense', '2026-02-23', 8, 10102, NULL, 0.00, 16.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:24:02', '2026-02-22 21:24:02'),
	(28, 30, 'EXP-2602004', 'Expense', '2026-02-23', 94, 40302, NULL, 16.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:24:02', '2026-02-22 21:24:02'),
	(29, 31, 'EXP-2602005', 'Expense', '2026-02-23', 8, 10102, 'Khabar babod', 0.00, 17.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:26:16', '2026-02-22 21:26:16'),
	(30, 32, 'EXP-2602005', 'Expense', '2026-02-23', 270, 405, 'Khabar babod', 17.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:26:16', '2026-02-22 21:26:16'),
	(31, 33, 'CC2602004', 'Client Collection', '2026-02-23', 26, 301, 'Client collection against payment no - CC2602004', 22.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:36:29', '2026-02-22 21:36:29'),
	(32, 34, 'CC2602004', 'Client Collection', '2026-02-23', 266, 40281, 'Client collection against payment no - CC2602004', 0.00, 22.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:36:29', '2026-02-22 21:36:29'),
	(33, 37, 'CC2602005', 'Client Collection', '2026-02-23', 8, 10102, 'Client collection against Payment No - CC2602005', 90.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:43:48', '2026-02-22 21:43:48'),
	(34, 38, 'CC2602005', 'Client Collection', '2026-02-23', 254, 404, 'Client collection against Payment No - CC2602005', 0.00, 90.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:43:48', '2026-02-22 21:43:48'),
	(35, 35, 'CS2602006', 'Client Sales', '2026-02-23', 254, 404, 'Client Sales Against Invoice No - CS2602006', 90.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:45:31', '2026-02-22 21:45:31'),
	(36, 36, 'CS2602006', 'Client Sales', '2026-02-23', 254, 3, 'Client Sales Against Invoice No - CS2602006', 0.00, 90.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:45:31', '2026-02-22 21:45:31'),
	(37, 41, 'CC2602006', 'Client Collection', '2026-02-23', 26, 301, 'Client collection against Payment No - CC2602006', 99.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:55:33', '2026-02-22 21:55:33'),
	(38, 42, 'CC2602006', 'Client Collection', '2026-02-23', 254, 404, 'Client collection against Payment No - CC2602006', 0.00, 99.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:55:33', '2026-02-22 21:55:33'),
	(39, 39, 'CS2602007', 'Client Sales', '2026-02-23', 254, 404, 'Client Sales Against Invoice No - CS2602007', 99.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:55:36', '2026-02-22 21:55:36'),
	(40, 40, 'CS2602007', 'Client Sales', '2026-02-23', 254, 3, 'Client Sales Against Invoice No - CS2602007', 0.00, 99.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:55:36', '2026-02-22 21:55:36'),
	(41, 43, 'EXP-2602006', 'Expense', '2026-02-23', 8, 10102, 'Food babod', 0.00, 20.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 22:07:01', '2026-02-22 22:07:01'),
	(42, 44, 'EXP-2602006', 'Expense', '2026-02-23', 271, 9, 'Food babod', 20.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 22:07:01', '2026-02-22 22:07:01'),
	(43, 47, 'EXP-2602007', 'Expense', '2026-02-23', 8, 10102, 'test exp', 0.00, 10.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 22:19:15', '2026-02-22 22:19:15'),
	(44, 48, 'EXP-2602007', 'Expense', '2026-02-23', 271, 9, 'test exp', 10.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 22:19:15', '2026-02-22 22:19:15'),
	(45, 45, 'CS2602008', 'Client Sales', '2026-02-23', 271, 9, 'Client Sales Against Invoice No - CS2602008', 44.00, 0.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 22:19:20', '2026-02-22 22:19:20'),
	(46, 46, 'CS2602008', 'Client Sales', '2026-02-23', 271, 3, 'Client Sales Against Invoice No - CS2602008', 0.00, 44.00, NULL, 1, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 22:19:20', '2026-02-22 22:19:20');

-- Dumping structure for table golden_ratio.account_transaction_autos
DROP TABLE IF EXISTS `account_transaction_autos`;
CREATE TABLE IF NOT EXISTS `account_transaction_autos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `voucher_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `coa_id` bigint unsigned NOT NULL,
  `coa_head_code` bigint NOT NULL,
  `narration` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `debit_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `credit_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posted` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `approved_by` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_transaction_autos_coa_id_foreign` (`coa_id`),
  KEY `account_transaction_autos_approved_by_foreign` (`approved_by`),
  KEY `account_transaction_autos_created_by_foreign` (`created_by`),
  KEY `account_transaction_autos_updated_by_foreign` (`updated_by`),
  KEY `account_transaction_autos_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.account_transaction_autos: ~53 rows (approximately)
DELETE FROM `account_transaction_autos`;
INSERT INTO `account_transaction_autos` (`id`, `voucher_no`, `voucher_type`, `date`, `coa_id`, `coa_head_code`, `narration`, `debit_amount`, `credit_amount`, `document`, `posted`, `approved`, `approved_by`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(3, 'CS2602001', 'Client Sales', '2026-02-22', 254, 401, 'Client Sales Against Invoice No - CS2602001', 22.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 00:06:16', '2026-02-22 00:07:55'),
	(4, 'CS2602001', 'Client Sales', '2026-02-22', 254, 3, 'Client Sales Against Invoice No - CS2602001', 0.00, 22.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 00:06:16', '2026-02-22 00:07:55'),
	(5, 'CC2602001', 'Client Collection', '2026-02-22', 262, 301, 'Client collection against Payment No - CC2602001', 22.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 00:06:16', '2026-02-22 00:07:51'),
	(6, 'CC2602001', 'Client Collection', '2026-02-22', 254, 401, 'Client collection against Payment No - CC2602001', 0.00, 22.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 00:06:16', '2026-02-22 00:07:51'),
	(7, 'CS2602002', 'Client Sales', '2026-02-22', 254, 401, 'Client Sales Against Invoice No - CS2602002', 22.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 00:17:32', '2026-02-22 00:23:22'),
	(8, 'CS2602002', 'Client Sales', '2026-02-22', 254, 3, 'Client Sales Against Invoice No - CS2602002', 0.00, 22.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 00:17:32', '2026-02-22 00:23:22'),
	(9, 'CS2602003', 'Client Sales', '2026-02-22', 254, 401, 'Client Sales Against Invoice No - CS2602003', 22.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 00:30:06', '2026-02-22 00:30:47'),
	(10, 'CS2602003', 'Client Sales', '2026-02-22', 254, 3, 'Client Sales Against Invoice No - CS2602003', 0.00, 22.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 00:30:06', '2026-02-22 00:30:47'),
	(11, 'EXP-2602001', 'E', '2026-02-22', 262, 301, '222', 0.00, 13.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 00:44:51', '2026-02-22 00:46:44'),
	(12, 'EXP-2602001', 'Expense', '2026-02-22', 254, 401, '222', 13.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 00:44:51', '2026-02-22 00:46:40'),
	(13, 'IP2602001', 'Investor Payment', '2026-02-22', 257, 102, 'Investor Payment against payment no - IP2602001', 1000.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 01:11:57', '2026-02-22 01:14:37'),
	(14, 'IP2602001', 'Investor Payment', '2026-02-22', 262, 301, 'Investor Payment against payment no - IP2602001', 0.00, 1000.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 01:11:57', '2026-02-22 01:14:37'),
	(15, 'IP2602002', 'Investor Payment', '2026-02-22', 257, 102, 'Investor Payment against payment no - IP2602002', 980.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 01:20:23', '2026-02-22 21:10:15'),
	(16, 'IP2602002', 'Investor Payment', '2026-02-22', 262, 301, 'Investor Payment against payment no - IP2602002', 0.00, 980.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 01:20:23', '2026-02-22 21:10:15'),
	(17, 'CS2602004', 'Client Sales', '1970-01-01', 266, 3, 'Client Sales Against Invoice No - CS2602004', 22.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 02:41:36', '2026-02-22 02:44:00'),
	(18, 'CS2602004', 'Client Sales', '1970-01-01', 3, 3, 'Client Sales Against Invoice No - CS2602004', 0.00, 22.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 02:41:36', '2026-02-22 02:44:00'),
	(19, 'CS2602005', 'Client Sales', '1970-01-01', 269, 8, 'Client Sales Against Invoice No - CS2602005', 22.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 02:50:44', '2026-02-22 02:52:02'),
	(20, 'CS2602005', 'Client Sales', '1970-01-01', 3, 3, 'Client Sales Against Invoice No - CS2602005', 0.00, 22.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 02:50:44', '2026-02-22 02:52:02'),
	(21, 'EXP-2602002', 'Expense', '2026-02-23', 9, 10103, NULL, 0.00, 25.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:07:33', '2026-02-22 21:08:00'),
	(22, 'EXP-2602002', 'Expense', '2026-02-23', 180, 40247, NULL, 25.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:07:33', '2026-02-22 21:08:00'),
	(23, 'CC2602002', 'Client Collection', '2026-02-23', 13, 1010201, 'Client collection against payment no - CC2602002', 44.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:09:51', '2026-02-22 21:10:10'),
	(24, 'CC2602002', 'Client Collection', '2026-02-23', 254, 404, 'Client collection against payment no - CC2602002', 0.00, 44.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:09:51', '2026-02-22 21:10:10'),
	(25, 'CC2602003', 'Client Collection', '2026-02-23', 26, 301, 'Client collection against payment no - CC2602003', 22.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:20:36', '2026-02-22 21:20:51'),
	(26, 'CC2602003', 'Client Collection', '2026-02-23', 269, 20102, 'Client collection against payment no - CC2602003', 0.00, 22.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:20:36', '2026-02-22 21:20:51'),
	(27, 'EXP-2602003', 'Expense', '2026-02-23', 8, 10102, 'Expense', 0.00, 14.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:21:46', '2026-02-22 21:22:05'),
	(28, 'EXP-2602003', 'Expense', '2026-02-23', 70, 20202, 'Expense', 14.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:21:46', '2026-02-22 21:22:05'),
	(29, 'EXP-2602004', 'Expense', '2026-02-23', 8, 10102, NULL, 0.00, 16.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:23:43', '2026-02-22 21:24:02'),
	(30, 'EXP-2602004', 'Expense', '2026-02-23', 94, 40302, NULL, 16.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:23:43', '2026-02-22 21:24:02'),
	(31, 'EXP-2602005', 'Expense', '2026-02-23', 8, 10102, 'Khabar babod', 0.00, 17.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:25:59', '2026-02-22 21:26:16'),
	(32, 'EXP-2602005', 'Expense', '2026-02-23', 270, 405, 'Khabar babod', 17.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:25:59', '2026-02-22 21:26:16'),
	(33, 'CC2602004', 'Client Collection', '2026-02-23', 26, 301, 'Client collection against payment no - CC2602004', 22.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:36:13', '2026-02-22 21:36:29'),
	(34, 'CC2602004', 'Client Collection', '2026-02-23', 266, 40281, 'Client collection against payment no - CC2602004', 0.00, 22.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:36:13', '2026-02-22 21:36:29'),
	(35, 'CS2602006', 'Client Sales', '2026-02-23', 254, 404, 'Client Sales Against Invoice No - CS2602006', 90.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:42:39', '2026-02-22 21:45:31'),
	(36, 'CS2602006', 'Client Sales', '2026-02-23', 254, 3, 'Client Sales Against Invoice No - CS2602006', 0.00, 90.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:42:39', '2026-02-22 21:45:31'),
	(37, 'CC2602005', 'Client Collection', '2026-02-23', 8, 10102, 'Client collection against Payment No - CC2602005', 90.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:42:39', '2026-02-22 21:43:48'),
	(38, 'CC2602005', 'Client Collection', '2026-02-23', 254, 404, 'Client collection against Payment No - CC2602005', 0.00, 90.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:42:39', '2026-02-22 21:43:48'),
	(39, 'CS2602007', 'Client Sales', '2026-02-23', 254, 404, 'Client Sales Against Invoice No - CS2602007', 99.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:55:16', '2026-02-22 21:55:36'),
	(40, 'CS2602007', 'Client Sales', '2026-02-23', 254, 3, 'Client Sales Against Invoice No - CS2602007', 0.00, 99.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:55:16', '2026-02-22 21:55:36'),
	(41, 'CC2602006', 'Client Collection', '2026-02-23', 26, 301, 'Client collection against Payment No - CC2602006', 99.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:55:16', '2026-02-22 21:55:33'),
	(42, 'CC2602006', 'Client Collection', '2026-02-23', 254, 404, 'Client collection against Payment No - CC2602006', 0.00, 99.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:55:16', '2026-02-22 21:55:33'),
	(43, 'EXP-2602006', 'Expense', '2026-02-23', 8, 10102, 'Food babod', 0.00, 20.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 22:06:48', '2026-02-22 22:07:01'),
	(44, 'EXP-2602006', 'Expense', '2026-02-23', 271, 9, 'Food babod', 20.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 22:06:48', '2026-02-22 22:07:01'),
	(45, 'CS2602008', 'Client Sales', '2026-02-23', 271, 9, 'Client Sales Against Invoice No - CS2602008', 44.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 22:08:02', '2026-02-22 22:19:20'),
	(46, 'CS2602008', 'Client Sales', '2026-02-23', 271, 3, 'Client Sales Against Invoice No - CS2602008', 0.00, 44.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 22:08:02', '2026-02-22 22:19:20'),
	(47, 'EXP-2602007', 'Expense', '2026-02-23', 8, 10102, 'test exp', 0.00, 10.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 22:19:00', '2026-02-22 22:19:15'),
	(48, 'EXP-2602007', 'Expense', '2026-02-23', 271, 9, 'test exp', 10.00, 0.00, NULL, 1, 1, 1, 1, NULL, NULL, NULL, '2026-02-22 22:19:00', '2026-02-22 22:19:15'),
	(49, 'CC2602007', 'Client Collection', '2026-02-23', 26, 301, 'Client collection against payment no - CC2602007', 4.00, 0.00, NULL, 0, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 22:57:17', '2026-02-22 22:57:17'),
	(50, 'CC2602007', 'Client Collection', '2026-02-23', 271, 9, 'Client collection against payment no - CC2602007', 0.00, 4.00, NULL, 0, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 22:57:17', '2026-02-22 22:57:17'),
	(51, 'EXP-2602008', 'Expense', '2026-02-23', 8, 10102, NULL, 0.00, 7.00, NULL, 0, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 23:08:36', '2026-02-22 23:08:36'),
	(52, 'EXP-2602008', 'Expense', '2026-02-23', 242, 40275, NULL, 2.00, 0.00, NULL, 0, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 23:08:37', '2026-02-22 23:08:37'),
	(53, 'EXP-2602008', 'Expense', '2026-02-23', 271, 9, NULL, 5.00, 0.00, NULL, 0, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 23:08:37', '2026-02-22 23:08:37'),
	(54, 'CS2602009', 'Client Sales', '2026-02-23', 271, 9, 'Client Sales Against Invoice No - CS2602009', 66.00, 0.00, NULL, 0, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 23:34:56', '2026-02-22 23:34:56'),
	(55, 'CS2602009', 'Client Sales', '2026-02-23', 271, 3, 'Client Sales Against Invoice No - CS2602009', 0.00, 66.00, NULL, 0, 0, NULL, 1, NULL, NULL, NULL, '2026-02-22 23:34:56', '2026-02-22 23:34:56');

-- Dumping structure for table golden_ratio.admin_menus
DROP TABLE IF EXISTS `admin_menus`;
CREATE TABLE IF NOT EXISTS `admin_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_deletable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_menus_permission_id_foreign` (`permission_id`),
  KEY `admin_menus_parent_id_foreign` (`parent_id`),
  CONSTRAINT `admin_menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_menus_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.admin_menus: ~56 rows (approximately)
DELETE FROM `admin_menus`;
INSERT INTO `admin_menus` (`id`, `permission_id`, `parent_id`, `name`, `route`, `icon`, `order`, `status`, `is_deletable`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 'Dashboard', 'admin.dashboard', '<span class="material-symbols-outlined fs-22"> home_app_logo </span>', 1, 1, 1, '2025-06-17 05:07:50', '2025-06-17 05:31:46'),
	(2, 2, NULL, 'Business Setup', NULL, '<span class="material-symbols-outlined fs-22"> settings_cinematic_blur </span>', 2, 1, 1, '2025-06-17 05:10:14', '2026-02-23 02:44:01'),
	(3, 3, 2, 'Roles', 'admin.role.index', NULL, 1, 1, 1, '2025-06-17 05:10:36', '2025-06-17 05:10:36'),
	(4, 4, 2, 'Users', 'admin.user.index', NULL, 2, 1, 1, '2025-06-17 05:11:10', '2025-06-17 05:11:10'),
	(5, 5, 2, 'Admin Menu', 'admin.admin-menu.index', NULL, 3, 1, 1, '2025-06-17 05:11:51', '2026-02-23 03:03:08'),
	(6, 6, 2, 'Admin Settings', 'admin.admin-settings.index', NULL, 4, 1, 1, '2025-06-17 05:12:59', '2025-06-17 05:12:59'),
	(7, 7, 68, 'Investors', 'admin.investor.index', NULL, 5, 1, 1, '2025-06-17 05:13:38', '2026-02-18 03:46:02'),
	(8, 27, 68, 'Invest Process', 'admin.invest.index', '<span class="material-symbols-outlined fs-24"> finance_mode </span>', 6, 1, 1, '2025-06-17 05:37:47', '2026-02-18 03:47:18'),
	(9, 32, 68, 'Sattlement', 'admin.invest-sattlement.index', '<span class="material-symbols-outlined fs-24"> inventory </span>', 9, 1, 1, '2025-06-17 05:40:52', '2026-02-18 03:50:32'),
	(10, 37, NULL, 'General Accounting', NULL, '<span class="material-symbols-outlined fs-24"> calculate </span>', 4, 1, 1, '2025-06-17 05:42:20', '2026-02-23 03:23:10'),
	(11, 38, 10, 'Transaction', NULL, NULL, 1, 1, 1, '2025-06-17 05:42:51', '2025-06-17 05:42:51'),
	(12, 39, 10, 'Reports', NULL, NULL, 2, 1, 1, '2025-06-17 05:43:04', '2025-06-17 05:43:04'),
	(13, 40, 11, 'Chart of Accounts', 'admin.coa-setup.index', NULL, 1, 1, 1, '2025-06-17 05:43:37', '2026-02-09 22:50:52'),
	(14, 44, 11, 'Debit Voucher', 'admin.debit-voucher.index', NULL, 2, 1, 1, '2025-06-17 05:45:02', '2025-06-17 05:45:02'),
	(15, 49, 11, 'Credit Voucher', 'admin.credit-voucher.index', NULL, 3, 1, 1, '2025-06-17 05:46:11', '2025-06-17 05:46:11'),
	(16, 54, 11, 'Journal Voucher', 'admin.journal-voucher.index', NULL, 4, 1, 1, '2025-06-17 05:46:57', '2025-06-17 05:46:57'),
	(17, 59, 11, 'Voucher Approve', 'admin.voucher-approve.index', NULL, 5, 1, 1, '2025-06-17 05:48:10', '2025-06-17 05:56:08'),
	(18, 62, 11, 'Voucher Refuse', 'admin.voucher-refuse.index', NULL, 6, 1, 1, '2025-06-17 05:50:19', '2025-06-17 05:56:21'),
	(19, 65, 11, 'Automation Approve', 'admin.automation-approve.index', NULL, 7, 1, 1, '2025-06-17 05:51:28', '2025-06-17 05:56:39'),
	(21, 71, 12, 'Chart of Accounts', 'admin.coa-list.index', NULL, 1, 1, 1, '2025-06-17 06:02:09', '2025-06-17 06:02:09'),
	(22, 72, 12, 'Daily Voucher List', 'admin.voucher-list.index', NULL, 2, 1, 1, '2025-06-17 06:02:32', '2025-06-17 06:02:32'),
	(23, 73, 12, 'Daily Cash Book', 'admin.cash-book.index', NULL, 3, 1, 1, '2025-06-17 06:03:05', '2025-06-17 06:03:05'),
	(24, 74, 12, 'Bank Book', 'admin.bank-book.index', NULL, 4, 1, 1, '2025-06-17 06:03:16', '2025-06-17 06:03:16'),
	(25, 75, 12, 'Transaction Ledger', 'admin.transaction-ledger.index', NULL, 5, 1, 1, '2025-06-17 06:03:37', '2025-06-17 06:03:37'),
	(26, 76, 12, 'General Ledger', 'admin.general-ledger.index', NULL, 6, 1, 1, '2025-06-17 06:03:52', '2025-06-17 06:03:52'),
	(27, 77, 12, 'Cash Flow Statement', 'admin.cash-flow-statement.index', NULL, 7, 1, 1, '2025-06-17 06:04:23', '2025-06-17 06:04:23'),
	(29, 79, 12, 'Income Statement', 'admin.income-statement.index', NULL, 9, 1, 1, '2025-06-17 06:04:58', '2025-06-17 06:04:58'),
	(32, 100, 69, 'UI Settings', 'admin.settings.index', '<span class="material-symbols-outlined fs-24"> menu_book </span>', 5, 1, 1, '2025-06-22 08:35:45', '2026-02-23 03:01:11'),
	(40, 139, 74, 'Productions', 'admin.production.index', NULL, 1, 1, 1, '2025-07-17 04:01:15', '2026-02-23 03:11:53'),
	(42, 156, 73, 'Clients', 'admin.client.index', NULL, 1, 1, 1, '2025-07-19 04:49:14', '2026-02-23 03:08:59'),
	(43, 157, 73, 'Sales', 'admin.sales.index', NULL, 2, 1, 1, '2025-07-19 04:49:37', '2026-02-23 03:09:48'),
	(44, 166, 74, 'Stock', 'admin.stock-status.index', NULL, 2, 1, 1, '2025-07-19 04:51:17', '2026-02-23 03:12:20'),
	(46, 168, 2, 'Regions', 'admin.region.index', NULL, 1, 1, 1, '2025-07-19 05:14:11', '2026-02-23 03:01:48'),
	(47, 169, 2, 'Area', 'admin.area.index', NULL, 2, 1, 1, '2025-07-19 05:14:30', '2026-02-23 03:02:19'),
	(48, 170, 2, 'Territory', 'admin.territory.index', NULL, 3, 1, 1, '2025-07-19 05:14:48', '2026-02-23 03:02:37'),
	(49, 183, 2, 'Stores', 'admin.store.index', NULL, 4, 1, 1, '2025-07-19 06:14:16', '2026-02-23 03:02:53'),
	(50, 190, 73, 'Collections', 'admin.collection.index', NULL, 3, 1, 1, '2025-07-20 07:50:25', '2026-02-23 03:10:05'),
	(53, 208, 68, 'Profit Distribution', 'admin.profit-distribution.index', '<span class="material-symbols-outlined fs-24"> event_repeat </span>', 7, 1, 1, '2025-07-22 02:47:36', '2026-02-18 03:51:24'),
	(54, 214, 68, 'Investor Payment', 'admin.investor-payment.index', '<span class="material-symbols-outlined fs-24"> add_card </span>', 8, 1, 1, '2025-07-22 06:50:16', '2026-02-18 03:48:01'),
	(55, 220, 68, 'Investor Statement', 'admin.investor-statement.index', '<span class="material-symbols-outlined fs-24"> contract </span>', 10, 1, 1, '2025-07-22 22:46:53', '2026-02-18 03:48:32'),
	(58, 231, 71, 'Room Manage', 'admin.rooms', NULL, 1, 1, 1, '2026-02-09 01:29:44', '2026-02-23 02:59:47'),
	(60, 233, 70, 'Room Type', 'admin.categories.index', NULL, 12, 1, 1, '2026-02-09 01:41:19', '2026-02-23 02:56:42'),
	(62, 235, 75, 'Booking', 'admin.bookings.index', NULL, 1, 1, 1, '2026-02-09 05:33:01', '2026-02-23 03:15:10'),
	(63, 236, 69, 'Manage Pages', 'admin.services.index', '<span class="material-symbols-outlined fs-22"> room_service </span>', 14, 1, 1, '2026-02-09 22:13:18', '2026-02-23 03:17:35'),
	(64, 237, 69, 'Gallery Manage', 'admin.services.index', '<span class="material-symbols-outlined fs-22"> photo_library </span>', 15, 1, 1, '2026-02-09 22:14:03', '2026-02-18 04:34:21'),
	(65, 238, 69, 'Testimonial Manage', 'admin.services.index', '<span class="material-symbols-outlined fs-22"> reviews </span>', 16, 1, 1, '2026-02-09 22:14:36', '2026-02-18 04:33:56'),
	(66, 239, 69, 'About Manage', 'admin.services.index', '<span class="material-symbols-outlined fs-22"> info </span>', 17, 1, 1, '2026-02-09 22:15:15', '2026-02-18 04:34:45'),
	(67, 240, 72, 'Expenses', 'admin.expense.index', '<span class="material-symbols-outlined fs-22">account_balance_wallet</span>', 5, 1, 1, '2026-02-18 00:45:00', '2026-02-23 03:13:09'),
	(68, 244, NULL, 'Investor Panel', NULL, '<i class="fad fa-user-tie fs-18"></i>', 5, 1, 1, '2026-02-18 03:44:39', '2026-02-23 03:22:42'),
	(69, 245, NULL, 'Website Setup', NULL, '<span class="material-symbols-outlined fs-22"> room_service </span>', 1, 1, 1, '2026-02-18 04:32:09', '2026-02-23 03:21:12'),
	(70, 246, 69, 'Room Type', NULL, '<span class="material-symbols-outlined fs-22">category</span>', 18, 1, 1, '2026-02-23 02:55:43', '2026-02-23 03:18:47'),
	(71, 247, 69, 'Manage Room', NULL, NULL, 19, 1, 1, '2026-02-23 02:58:48', '2026-02-23 03:19:30'),
	(72, 248, NULL, 'Business Transaction', NULL, '<span class="material-symbols-outlined fs-24"> bar_chart_4_bars </span>', 3, 1, 1, '2026-02-23 03:06:35', '2026-02-23 03:06:35'),
	(73, 249, 72, 'Sales Manage', NULL, NULL, 1, 1, 1, '2026-02-23 03:08:12', '2026-02-23 03:08:12'),
	(74, 250, 72, 'Inventory Manage', NULL, NULL, 2, 1, 1, '2026-02-23 03:11:25', '2026-02-23 03:11:25'),
	(75, 251, 69, 'Manage Booking', NULL, NULL, 20, 1, 1, '2026-02-23 03:14:24', '2026-02-23 03:19:59');

-- Dumping structure for table golden_ratio.admin_menu_actions
DROP TABLE IF EXISTS `admin_menu_actions`;
CREATE TABLE IF NOT EXISTS `admin_menu_actions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` bigint unsigned NOT NULL,
  `admin_menu_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_menu_actions_permission_id_foreign` (`permission_id`),
  KEY `admin_menu_actions_admin_menu_id_foreign` (`admin_menu_id`),
  CONSTRAINT `admin_menu_actions_admin_menu_id_foreign` FOREIGN KEY (`admin_menu_id`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_menu_actions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.admin_menu_actions: ~113 rows (approximately)
DELETE FROM `admin_menu_actions`;
INSERT INTO `admin_menu_actions` (`id`, `permission_id`, `admin_menu_id`, `name`, `route`, `status`, `created_at`, `updated_at`) VALUES
	(1, 8, 5, 'create', 'admin.admin-menu.create', 1, '2025-06-17 05:30:00', '2025-06-17 05:30:00'),
	(2, 9, 5, 'edit', 'admin.admin-menu.edit', 1, '2025-06-17 05:30:15', '2025-06-17 05:30:15'),
	(3, 10, 5, 'delete', 'admin.admin-menu.destroy', 1, '2025-06-17 05:30:19', '2025-06-17 05:30:19'),
	(4, 11, 5, 'view actions', 'admin.admin-menu-action.index', 1, '2025-06-17 05:30:59', '2025-06-17 05:30:59'),
	(5, 12, 5, 'create action', 'admin.admin-menu-action.create', 1, '2025-06-17 05:31:06', '2025-06-17 05:31:06'),
	(6, 13, 5, 'edit action', 'admin.admin-menu-action.edit', 1, '2025-06-17 05:31:15', '2025-06-17 05:31:15'),
	(7, 14, 5, 'delete action', 'admin.admin-menu-action.destroy', 1, '2025-06-17 05:31:21', '2025-06-17 05:31:21'),
	(8, 15, 3, 'create', 'admin.role.create', 1, '2025-06-17 05:32:05', '2025-06-17 05:32:05'),
	(9, 16, 3, 'edit', 'admin.role.edit', 1, '2025-06-17 05:32:09', '2025-06-17 05:32:09'),
	(10, 17, 3, 'delete', 'admin.role.destroy', 1, '2025-06-17 05:32:15', '2025-06-17 05:32:15'),
	(11, 18, 3, 'edit permission', 'admin.role-permission.edit', 1, '2025-06-17 05:32:50', '2025-06-17 05:32:50'),
	(12, 19, 4, 'create', 'admin.user.create', 1, '2025-06-17 05:33:17', '2025-06-17 05:33:17'),
	(13, 20, 4, 'edit', 'admin.user.edit', 1, '2025-06-17 05:33:20', '2025-06-17 05:33:20'),
	(16, 23, 7, 'create', 'admin.investor.create', 1, '2025-06-17 05:34:17', '2025-06-17 05:34:17'),
	(17, 24, 7, 'edit', 'admin.investor.edit', 1, '2025-06-17 05:34:20', '2025-06-17 05:34:20'),
	(18, 25, 7, 'delete', 'admin.investor.destroy', 1, '2025-06-17 05:34:27', '2025-06-17 05:34:27'),
	(19, 26, 7, 'trash', 'admin.investor.trash', 1, '2025-06-17 05:34:33', '2025-06-17 05:34:33'),
	(20, 28, 8, 'create', 'admin.invest.create', 1, '2025-06-17 05:38:48', '2025-06-17 05:38:48'),
	(21, 29, 8, 'edit', 'admin.invest.edit', 1, '2025-06-17 05:38:52', '2025-06-17 05:38:52'),
	(24, 33, 9, 'create', 'admin.invest-sattlement.create', 1, '2025-06-17 05:41:09', '2025-06-23 04:19:25'),
	(25, 34, 9, 'edit', 'admin.invest-sattlement.edit', 1, '2025-06-17 05:41:13', '2025-06-23 04:19:31'),
	(28, 41, 13, 'create', 'admin.coa.create', 1, '2025-06-17 05:44:10', '2025-06-17 05:44:10'),
	(29, 42, 13, 'edit', 'admin.coa.edit', 1, '2025-06-17 05:44:15', '2025-06-17 05:44:15'),
	(30, 43, 13, 'delete', 'admin.coa.destroy', 1, '2025-06-17 05:44:20', '2025-06-17 05:44:20'),
	(31, 45, 14, 'create', 'admin.debit-voucher.create', 1, '2025-06-17 05:45:12', '2025-06-17 05:45:12'),
	(32, 46, 14, 'edit', 'admin.debit-voucher.edit', 1, '2025-06-17 05:45:17', '2025-06-17 05:45:17'),
	(35, 50, 15, 'create', 'admin.credit-voucher.create', 1, '2025-06-17 05:46:23', '2025-06-17 05:46:23'),
	(36, 51, 15, 'edit', 'admin.credit-voucher.edit', 1, '2025-06-17 05:46:27', '2025-06-17 05:46:27'),
	(39, 55, 16, 'create', 'admin.journal-voucher.create', 1, '2025-06-17 05:47:08', '2025-06-17 05:47:08'),
	(40, 56, 16, 'edit', 'admin.journal-voucher.edit', 1, '2025-06-17 05:47:13', '2025-06-17 05:47:13'),
	(43, 60, 17, 'view', 'admin.voucher-approve.show', 1, '2025-06-17 05:48:51', '2025-06-17 05:48:51'),
	(44, 61, 17, 'approve', 'admin.voucher-approve.edit', 1, '2025-06-17 05:49:08', '2025-06-17 05:49:08'),
	(45, 63, 18, 'view', 'admin.voucher-refuse.show', 1, '2025-06-17 05:50:44', '2025-06-17 05:50:44'),
	(46, 64, 18, 'approve', 'admin.voucher-refuse.edit', 1, '2025-06-17 05:50:49', '2025-06-17 05:50:49'),
	(47, 66, 19, 'view', 'admin.automation-approve.show', 1, '2025-06-17 05:51:41', '2025-06-17 05:51:41'),
	(48, 67, 19, 'approve', 'admin.automation-approve.edit', 1, '2025-06-17 05:51:52', '2025-06-17 05:51:52'),
	(51, 81, 14, 'view', 'admin.debit-voucher.show', 1, '2025-06-18 04:03:34', '2025-06-18 04:03:34'),
	(52, 82, 14, 'print', 'admin.debit-voucher.print', 1, '2025-06-18 04:03:38', '2025-06-18 04:03:38'),
	(53, 83, 14, 'delete', 'admin.debit-voucher.destroy', 1, '2025-06-18 04:03:43', '2025-06-18 04:03:43'),
	(54, 84, 14, 'trash', 'admin.debit-voucher.trash', 1, '2025-06-18 04:03:47', '2025-06-18 04:03:47'),
	(55, 85, 15, 'view', 'admin.credit-voucher.show', 1, '2025-06-18 22:26:47', '2025-06-18 22:26:47'),
	(56, 86, 15, 'print', 'admin.credit-voucher.print', 1, '2025-06-18 22:26:51', '2025-06-18 22:26:51'),
	(57, 87, 15, 'delete', 'admin.credit-voucher.destroy', 1, '2025-06-18 22:26:59', '2025-06-18 22:26:59'),
	(58, 88, 15, 'trash', 'admin.credit-voucher.trash', 1, '2025-06-18 22:27:03', '2025-06-18 22:27:03'),
	(60, 90, 8, 'delete', 'admin.invest.destroy', 1, '2025-06-19 08:47:54', '2025-06-19 08:47:54'),
	(61, 91, 8, 'trash', 'admin.invest.trash', 1, '2025-06-19 08:47:58', '2025-06-19 08:47:58'),
	(69, 101, 32, 'create', 'admin.product.create', 1, '2025-06-22 08:36:30', '2025-07-13 02:14:48'),
	(70, 102, 32, 'edit', 'admin.product.edit', 1, '2025-06-22 08:36:33', '2025-07-13 02:14:53'),
	(91, 127, 9, 'view', 'admin.invest-sattlement.show', 1, '2025-06-23 04:19:48', '2025-06-23 04:19:48'),
	(92, 128, 9, 'delete', 'admin.invest-sattlement.destroy', 1, '2025-06-23 04:19:56', '2025-06-23 04:19:56'),
	(93, 129, 9, 'trash', 'admin.invest-sattlement.trash', 1, '2025-06-23 04:20:01', '2025-06-23 04:20:01'),
	(94, 130, 4, 'change password', 'admin.user.password', 1, '2025-06-23 22:35:11', '2025-06-23 22:35:11'),
	(95, 131, 4, 'delete', 'admin.user.destroy', 1, '2025-06-23 22:35:16', '2025-06-23 22:35:16'),
	(96, 132, 4, 'trash', 'admin.user.trash', 1, '2025-06-23 22:35:21', '2025-06-23 22:35:21'),
	(97, 135, 32, 'view editions', 'admin.product-edition.index', 1, '2025-07-16 22:24:15', '2025-07-17 06:25:16'),
	(102, 142, 32, 'create edition', 'admin.product-edition.store', 1, '2025-07-17 06:27:56', '2025-07-17 06:29:13'),
	(103, 143, 32, 'edit edition', 'admin.product-edition.edit', 1, '2025-07-17 06:28:06', '2025-07-17 06:28:06'),
	(104, 144, 32, 'delete edition', 'admin.product-edition.destroy', 1, '2025-07-17 06:28:19', '2025-07-17 06:28:19'),
	(105, 145, 32, 'delete', 'admin.product.destroy', 1, '2025-07-17 06:28:23', '2025-07-17 06:28:23'),
	(106, 146, 32, 'trash', 'admin.product.trash', 1, '2025-07-17 06:28:28', '2025-07-17 06:28:28'),
	(107, 147, 40, 'create', 'admin.production.create', 1, '2025-07-18 22:28:23', '2025-07-18 22:28:23'),
	(108, 148, 40, 'edit', 'admin.production.edit', 1, '2025-07-18 22:28:27', '2025-07-18 22:28:27'),
	(109, 149, 40, 'view', 'admin.production.show', 1, '2025-07-18 22:28:33', '2025-07-18 22:28:33'),
	(112, 152, 40, 'print', 'admin.production.print', 1, '2025-07-19 04:38:54', '2025-07-19 04:38:54'),
	(113, 153, 40, 'delete', 'admin.production.destroy', 1, '2025-07-19 04:38:59', '2025-07-19 04:38:59'),
	(114, 154, 40, 'trash', 'admin.production.trash', 1, '2025-07-19 04:39:06', '2025-07-19 04:39:06'),
	(115, 158, 42, 'create', 'admin.client.create', 1, '2025-07-19 04:49:55', '2025-07-19 04:49:55'),
	(116, 159, 42, 'edit', 'admin.client.edit', 1, '2025-07-19 04:50:00', '2025-07-19 04:50:00'),
	(117, 160, 42, 'delete', 'admin.client.destroy', 1, '2025-07-19 04:50:07', '2025-07-19 04:50:07'),
	(118, 161, 42, 'trash', 'admin.client.trash', 1, '2025-07-19 04:50:11', '2025-07-19 04:50:11'),
	(119, 162, 43, 'create', 'admin.sales.create', 1, '2025-07-19 04:50:26', '2025-07-19 04:50:26'),
	(120, 163, 43, 'edit', 'admin.sales.edit', 1, '2025-07-19 04:50:29', '2025-07-19 04:50:29'),
	(121, 164, 43, 'print', 'admin.sales.show', 1, '2025-07-19 04:50:33', '2025-07-20 07:51:18'),
	(123, 171, 46, 'create', 'admin.region.create', 1, '2025-07-19 06:11:34', '2025-07-19 06:11:34'),
	(124, 172, 46, 'edit', 'admin.region.edit', 1, '2025-07-19 06:11:40', '2025-07-19 06:11:40'),
	(125, 173, 46, 'delete', 'admin.region.destroy', 1, '2025-07-19 06:11:45', '2025-07-19 06:11:45'),
	(126, 174, 46, 'trash', 'admin.region.trash', 1, '2025-07-19 06:11:50', '2025-07-19 06:11:50'),
	(127, 175, 47, 'create', 'admin.area.create', 1, '2025-07-19 06:12:18', '2025-07-19 06:12:18'),
	(128, 176, 47, 'edit', 'admin.area.edit', 1, '2025-07-19 06:12:21', '2025-07-19 06:12:21'),
	(129, 177, 47, 'delete', 'admin.area.destroy', 1, '2025-07-19 06:12:33', '2025-07-19 06:12:33'),
	(130, 178, 47, 'trash', 'admin.area.trash', 1, '2025-07-19 06:12:40', '2025-07-19 06:12:40'),
	(131, 179, 48, 'create', 'admin.territory.create', 1, '2025-07-19 06:12:53', '2025-07-19 06:12:53'),
	(132, 180, 48, 'edit', 'admin.territory.edit', 1, '2025-07-19 06:12:56', '2025-07-19 06:12:56'),
	(133, 181, 48, 'delete', 'admin.territory.destroy', 1, '2025-07-19 06:13:00', '2025-07-19 06:13:00'),
	(134, 182, 48, 'trash', 'admin.territory.trash', 1, '2025-07-19 06:13:06', '2025-07-19 06:13:06'),
	(135, 184, 49, 'create', 'admin.store.create', 1, '2025-07-19 06:14:31', '2025-07-19 06:14:31'),
	(136, 185, 49, 'edit', 'admin.store.edit', 1, '2025-07-19 06:14:34', '2025-07-19 06:14:34'),
	(137, 186, 49, 'delete', 'admin.store.destroy', 1, '2025-07-19 06:14:39', '2025-07-19 06:14:39'),
	(138, 187, 49, 'trash', 'admin.store.trash', 1, '2025-07-19 06:14:45', '2025-07-19 06:14:45'),
	(139, 188, 43, 'delete', 'admin.sales.destroy', 1, '2025-07-20 07:36:18', '2025-07-20 07:36:18'),
	(140, 189, 43, 'trash', 'admin.sales.trash', 1, '2025-07-20 07:36:23', '2025-07-20 07:36:23'),
	(141, 191, 50, 'create', 'admin.collection.create', 1, '2025-07-20 07:50:36', '2025-07-20 07:50:36'),
	(142, 192, 50, 'edit', 'admin.collection.edit', 1, '2025-07-20 07:50:41', '2025-07-20 07:50:41'),
	(143, 193, 50, 'print', 'admin.collection.show', 1, '2025-07-20 07:50:45', '2025-07-20 07:50:45'),
	(144, 194, 50, 'delete', 'admin.collection.destroy', 1, '2025-07-20 07:50:52', '2025-07-20 07:50:52'),
	(145, 195, 50, 'trash', 'admin.collection.trash', 1, '2025-07-20 07:50:56', '2025-07-20 07:50:56'),
	(156, 209, 53, 'create', 'admin.profit-distribution.create', 1, '2025-07-22 02:47:59', '2025-07-22 02:47:59'),
	(157, 210, 53, 'edit', 'admin.profit-distribution.edit', 1, '2025-07-22 02:48:05', '2025-07-22 02:48:05'),
	(158, 211, 53, 'view', 'admin.profit-distribution.show', 1, '2025-07-22 02:48:09', '2025-07-22 02:48:09'),
	(159, 212, 53, 'delete', 'admin.profit-distribution.destroy', 1, '2025-07-22 02:48:16', '2025-07-22 02:48:16'),
	(160, 213, 53, 'trash', 'admin.profit-distribution.trash', 1, '2025-07-22 02:48:22', '2025-07-22 02:48:22'),
	(161, 215, 54, 'create', 'admin.investor-payment.create', 1, '2025-07-22 06:50:27', '2025-07-22 06:50:27'),
	(162, 216, 54, 'edit', 'admin.investor-payment.edit', 1, '2025-07-22 06:50:31', '2025-07-22 06:50:31'),
	(163, 217, 54, 'view', 'admin.investor-payment.show', 1, '2025-07-22 06:50:38', '2025-07-22 06:50:38'),
	(164, 218, 54, 'delete', 'admin.investor-payment.destroy', 1, '2025-07-22 06:50:44', '2025-07-22 06:50:44'),
	(165, 219, 54, 'trash', 'admin.investor-payment.trash', 1, '2025-07-22 06:50:50', '2025-07-22 06:50:50'),
	(166, 221, 16, 'show', 'admin.journal-voucher.show', 1, '2025-08-31 23:33:11', '2025-08-31 23:33:11'),
	(167, 222, 16, 'print', 'admin.journal-voucher.print', 1, '2025-08-31 23:33:17', '2025-08-31 23:33:17'),
	(168, 223, 16, 'delete', 'admin.journal-voucher.destroy', 1, '2025-08-31 23:33:21', '2025-08-31 23:33:21'),
	(169, 224, 16, 'trash', 'admin.journal-voucher.trash', 1, '2025-08-31 23:34:07', '2025-08-31 23:34:07'),
	(174, 241, 67, 'create', 'admin.expense.create', 1, '2026-02-18 00:53:27', '2026-02-18 00:53:27'),
	(175, 242, 67, 'edit', 'admin.expense.edit', 1, '2026-02-18 01:04:00', '2026-02-18 01:04:00'),
	(176, 243, 67, 'show', 'admin.expense.show', 1, '2026-02-18 01:04:26', '2026-02-18 01:04:26');

-- Dumping structure for table golden_ratio.admin_settings
DROP TABLE IF EXISTS `admin_settings`;
CREATE TABLE IF NOT EXISTS `admin_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `small_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invest_value` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.admin_settings: ~0 rows (approximately)
DELETE FROM `admin_settings`;
INSERT INTO `admin_settings` (`id`, `logo`, `small_logo`, `favicon`, `invest_value`, `title`, `footer_text`, `primary_color`, `secondary_color`, `facebook`, `twitter`, `linkedin`, `whatsapp`, `google`, `created_at`, `updated_at`) VALUES
	(1, 'storage/admin-setting//2026-02-10-quLl7x6LIpOewvLbubTsJtU9vDBuvRatfjvBTaAY.webp', 'storage/admin-setting//2026-02-10-npcVYQ5HMBIhcqH4DAsj5jOFLAkekKGIRl2ZzRSx.webp', 'storage/admin-setting//2026-02-10-uKHdiBUMHBaK5EWxiGoTNqLRKYfMBFDHxrbvwVlu.webp', 10000, 'Amar Hostel', '© 2023 Developed by <a target="_blank" href="http://www.technoparkbd.com/">Techno Park Bangladesh</a>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-09 22:38:23', '2026-02-09 22:38:23');

-- Dumping structure for table golden_ratio.areas
DROP TABLE IF EXISTS `areas`;
CREATE TABLE IF NOT EXISTS `areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `region_id` bigint unsigned NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `incharge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `areas_code_unique` (`code`),
  KEY `areas_region_id_foreign` (`region_id`),
  KEY `areas_created_by_foreign` (`created_by`),
  KEY `areas_updated_by_foreign` (`updated_by`),
  KEY `areas_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.areas: ~51 rows (approximately)
DELETE FROM `areas`;
INSERT INTO `areas` (`id`, `region_id`, `code`, `name`, `incharge`, `phone`, `email`, `address`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, 'নীলক্ষেত', NULL, NULL, NULL, NULL, 1, 1, 10, NULL, NULL, '2025-07-22 03:18:40', '2025-10-26 00:13:31'),
	(2, 2, NULL, 'ভোলা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 23:52:58', '2025-10-25 23:52:58'),
	(3, 5, NULL, 'বগুড়া', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:04:06', '2025-10-26 00:04:06'),
	(4, 2, NULL, 'পটুয়াখালী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:05:53', '2025-10-26 00:05:53'),
	(5, 5, NULL, 'নওগাঁ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:07:44', '2025-10-26 00:07:44'),
	(6, 4, NULL, 'শেরপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:08:25', '2025-10-26 00:08:25'),
	(7, 3, NULL, 'কুষ্টিয়া', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:09:43', '2025-10-26 00:09:43'),
	(8, 6, NULL, 'গাইবান্ধা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:10:24', '2025-10-26 00:10:24'),
	(9, 6, NULL, 'দিনাজপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:14:44', '2025-10-26 00:14:44'),
	(10, 6, NULL, 'লালমনিরহাট', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:15:15', '2025-10-26 00:15:15'),
	(11, 1, NULL, 'নরসিংদী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:15:47', '2025-10-26 00:15:47'),
	(12, 5, NULL, 'চাঁপাইনবাবগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:16:47', '2025-10-26 00:16:47'),
	(13, 5, NULL, 'ঈশ্বরদী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:17:29', '2025-10-26 00:17:29'),
	(14, 9, NULL, 'Area-1', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:19:33', '2025-10-26 00:19:33'),
	(15, 5, NULL, 'Area-1', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 00:31:22', '2025-10-26 00:31:22'),
	(16, 7, NULL, 'Area-1', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 01:11:55', '2025-10-26 01:11:55'),
	(17, 7, NULL, 'কুমিল্লা', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-10-30 05:19:41', '2025-10-26 01:12:36', '2025-10-30 05:19:41'),
	(18, 7, NULL, 'ফেনী', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-10-30 05:19:47', '2025-10-26 01:12:56', '2025-10-30 05:19:47'),
	(19, 7, NULL, 'চাঁদপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-10-30 05:19:12', '2025-10-26 01:13:17', '2025-10-30 05:19:12'),
	(20, 1, NULL, 'সাভার', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 04:29:58', '2025-10-30 04:29:58'),
	(21, 1, NULL, 'মুন্সীগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-10-30 04:34:11', '2025-11-01 01:20:01'),
	(22, 1, NULL, 'মাধবদী,নরসিংদী', NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-10-30 04:35:11', '2025-11-01 01:26:48'),
	(23, 1, NULL, 'গাজীপুর, মাওনা', NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-10-30 05:10:16', '2025-10-30 05:10:40'),
	(24, 2, NULL, 'পিরোজপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:11:18', '2025-10-30 05:11:18'),
	(25, 2, NULL, 'বরগুনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:11:45', '2025-10-30 05:11:45'),
	(26, 3, NULL, 'যশোর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:12:55', '2025-10-30 05:12:55'),
	(27, 3, NULL, 'নোয়াপাড়া, খুলনা', NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-10-30 05:14:38', '2025-11-01 00:30:35'),
	(28, 4, NULL, 'জামালপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:15:09', '2025-10-30 05:15:09'),
	(29, 4, NULL, 'নেত্রকোনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:15:31', '2025-10-30 05:15:31'),
	(30, 4, NULL, 'টাঙ্গাইল', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:15:56', '2025-10-30 05:15:56'),
	(31, 4, NULL, 'ময়মনসিংহ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:17:27', '2025-10-30 05:17:27'),
	(32, 7, NULL, 'কুমিল্লা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:17:49', '2025-10-30 05:17:49'),
	(33, 7, NULL, 'চট্টগ্রাম', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:18:09', '2025-10-30 05:18:09'),
	(34, 7, NULL, 'ফেনী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:18:28', '2025-10-30 05:18:28'),
	(35, 7, NULL, 'চাঁদপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:18:42', '2025-10-30 05:18:42'),
	(36, 8, NULL, 'সিলেট', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:20:59', '2025-10-30 05:20:59'),
	(37, 8, NULL, 'হবিগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:21:36', '2025-10-30 05:21:36'),
	(38, 8, NULL, 'মৌলভীবাজার', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:22:37', '2025-10-30 05:22:37'),
	(39, 8, NULL, 'সুনামগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:23:16', '2025-10-30 05:23:16'),
	(40, 5, NULL, 'সিরাজগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:23:36', '2025-10-30 05:23:36'),
	(41, 5, NULL, 'পাবনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:23:56', '2025-10-30 05:23:56'),
	(42, 5, NULL, 'রাজশাহী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:24:37', '2025-10-30 05:24:37'),
	(43, 5, NULL, 'বগুড়া', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-11-01 01:54:26', '2025-10-30 05:25:11', '2025-11-01 01:54:26'),
	(44, 6, NULL, 'রংপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:25:35', '2025-10-30 05:25:35'),
	(45, 6, NULL, 'পঞ্চগড়', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-30 05:26:38', '2025-10-30 05:26:38'),
	(46, 3, NULL, 'খুলনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:30:57', '2025-11-01 00:30:57'),
	(47, 1, NULL, 'মালিবাগ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:08:45', '2025-11-01 01:08:45'),
	(48, 2, NULL, 'ঝালকাঠি', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:17:09', '2025-11-01 01:17:09'),
	(49, 1, NULL, 'নারায়ণগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:20:16', '2025-11-01 01:20:16'),
	(50, 2, NULL, 'বরিশাল', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-02 03:05:45', '2025-11-02 03:05:45'),
	(51, 1, NULL, 'বাংলা বাজার', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-01-24 05:20:36', '2026-01-24 05:20:36');

-- Dumping structure for table golden_ratio.bookings
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `guests` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','confirmed','checked_in','checked_out','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_room_id_foreign` (`room_id`),
  KEY `bookings_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.bookings: ~3 rows (approximately)
DELETE FROM `bookings`;
INSERT INTO `bookings` (`id`, `room_id`, `user_id`, `duration`, `check_in`, `check_out`, `guests`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
	(1, 6, 3, '', '2026-02-22', '2026-02-23', 1, 22.00, 'checked_out', '2026-02-22 02:06:57', '2026-02-22 02:45:49'),
	(2, 6, 36, '', '2026-02-22', '2026-02-23', 1, 22.00, 'checked_in', '2026-02-22 02:50:26', '2026-02-22 02:50:44'),
	(3, 8, 37, '', '2026-02-23', '2026-02-24', 2, 88.00, 'pending', '2026-02-23 00:38:48', '2026-02-23 00:38:48');

-- Dumping structure for table golden_ratio.cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.cache: ~4 rows (approximately)
DELETE FROM `cache`;
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('books_books_cache_admin_menus', 'O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:6:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:1;s:13:"permission_id";i:1;s:9:"parent_id";N;s:4:"name";s:9:"Dashboard";s:5:"route";s:15:"admin.dashboard";s:4:"icon";s:68:"<span class="material-symbols-outlined fs-22"> home_app_logo </span>";s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:07:50";s:10:"updated_at";s:19:"2025-06-17 11:31:46";}s:11:"\0*\0original";a:11:{s:2:"id";i:1;s:13:"permission_id";i:1;s:9:"parent_id";N;s:4:"name";s:9:"Dashboard";s:5:"route";s:15:"admin.dashboard";s:4:"icon";s:68:"<span class="material-symbols-outlined fs-22"> home_app_logo </span>";s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:07:50";s:10:"updated_at";s:19:"2025-06-17 11:31:46";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:69;s:13:"permission_id";i:245;s:9:"parent_id";N;s:4:"name";s:13:"Website Setup";s:5:"route";N;s:4:"icon";s:67:"<span class="material-symbols-outlined fs-22"> room_service </span>";s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-18 10:32:09";s:10:"updated_at";s:19:"2026-02-23 09:21:12";}s:11:"\0*\0original";a:11:{s:2:"id";i:69;s:13:"permission_id";i:245;s:9:"parent_id";N;s:4:"name";s:13:"Website Setup";s:5:"route";N;s:4:"icon";s:67:"<span class="material-symbols-outlined fs-22"> room_service </span>";s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-18 10:32:09";s:10:"updated_at";s:19:"2026-02-23 09:21:12";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:8:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:32;s:13:"permission_id";i:100;s:9:"parent_id";i:69;s:4:"name";s:11:"UI Settings";s:5:"route";s:20:"admin.settings.index";s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> menu_book </span>";s:5:"order";i:5;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-22 14:35:45";s:10:"updated_at";s:19:"2026-02-23 09:01:11";}s:11:"\0*\0original";a:11:{s:2:"id";i:32;s:13:"permission_id";i:100;s:9:"parent_id";i:69;s:4:"name";s:11:"UI Settings";s:5:"route";s:20:"admin.settings.index";s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> menu_book </span>";s:5:"order";i:5;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-22 14:35:45";s:10:"updated_at";s:19:"2026-02-23 09:01:11";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:63;s:13:"permission_id";i:236;s:9:"parent_id";i:69;s:4:"name";s:12:"Manage Pages";s:5:"route";s:20:"admin.services.index";s:4:"icon";s:67:"<span class="material-symbols-outlined fs-22"> room_service </span>";s:5:"order";i:14;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-10 04:13:18";s:10:"updated_at";s:19:"2026-02-23 09:17:35";}s:11:"\0*\0original";a:11:{s:2:"id";i:63;s:13:"permission_id";i:236;s:9:"parent_id";i:69;s:4:"name";s:12:"Manage Pages";s:5:"route";s:20:"admin.services.index";s:4:"icon";s:67:"<span class="material-symbols-outlined fs-22"> room_service </span>";s:5:"order";i:14;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-10 04:13:18";s:10:"updated_at";s:19:"2026-02-23 09:17:35";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:64;s:13:"permission_id";i:237;s:9:"parent_id";i:69;s:4:"name";s:14:"Gallery Manage";s:5:"route";s:20:"admin.services.index";s:4:"icon";s:68:"<span class="material-symbols-outlined fs-22"> photo_library </span>";s:5:"order";i:15;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-10 04:14:03";s:10:"updated_at";s:19:"2026-02-18 10:34:21";}s:11:"\0*\0original";a:11:{s:2:"id";i:64;s:13:"permission_id";i:237;s:9:"parent_id";i:69;s:4:"name";s:14:"Gallery Manage";s:5:"route";s:20:"admin.services.index";s:4:"icon";s:68:"<span class="material-symbols-outlined fs-22"> photo_library </span>";s:5:"order";i:15;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-10 04:14:03";s:10:"updated_at";s:19:"2026-02-18 10:34:21";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:65;s:13:"permission_id";i:238;s:9:"parent_id";i:69;s:4:"name";s:18:"Testimonial Manage";s:5:"route";s:20:"admin.services.index";s:4:"icon";s:62:"<span class="material-symbols-outlined fs-22"> reviews </span>";s:5:"order";i:16;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-10 04:14:36";s:10:"updated_at";s:19:"2026-02-18 10:33:56";}s:11:"\0*\0original";a:11:{s:2:"id";i:65;s:13:"permission_id";i:238;s:9:"parent_id";i:69;s:4:"name";s:18:"Testimonial Manage";s:5:"route";s:20:"admin.services.index";s:4:"icon";s:62:"<span class="material-symbols-outlined fs-22"> reviews </span>";s:5:"order";i:16;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-10 04:14:36";s:10:"updated_at";s:19:"2026-02-18 10:33:56";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:66;s:13:"permission_id";i:239;s:9:"parent_id";i:69;s:4:"name";s:12:"About Manage";s:5:"route";s:20:"admin.services.index";s:4:"icon";s:59:"<span class="material-symbols-outlined fs-22"> info </span>";s:5:"order";i:17;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-10 04:15:15";s:10:"updated_at";s:19:"2026-02-18 10:34:45";}s:11:"\0*\0original";a:11:{s:2:"id";i:66;s:13:"permission_id";i:239;s:9:"parent_id";i:69;s:4:"name";s:12:"About Manage";s:5:"route";s:20:"admin.services.index";s:4:"icon";s:59:"<span class="material-symbols-outlined fs-22"> info </span>";s:5:"order";i:17;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-10 04:15:15";s:10:"updated_at";s:19:"2026-02-18 10:34:45";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:5;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:70;s:13:"permission_id";i:246;s:9:"parent_id";i:69;s:4:"name";s:9:"Room Type";s:5:"route";N;s:4:"icon";s:61:"<span class="material-symbols-outlined fs-22">category</span>";s:5:"order";i:18;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-23 08:55:43";s:10:"updated_at";s:19:"2026-02-23 09:18:47";}s:11:"\0*\0original";a:11:{s:2:"id";i:70;s:13:"permission_id";i:246;s:9:"parent_id";i:69;s:4:"name";s:9:"Room Type";s:5:"route";N;s:4:"icon";s:61:"<span class="material-symbols-outlined fs-22">category</span>";s:5:"order";i:18;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-23 08:55:43";s:10:"updated_at";s:19:"2026-02-23 09:18:47";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:6;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:71;s:13:"permission_id";i:247;s:9:"parent_id";i:69;s:4:"name";s:11:"Manage Room";s:5:"route";N;s:4:"icon";N;s:5:"order";i:19;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-23 08:58:48";s:10:"updated_at";s:19:"2026-02-23 09:19:30";}s:11:"\0*\0original";a:11:{s:2:"id";i:71;s:13:"permission_id";i:247;s:9:"parent_id";i:69;s:4:"name";s:11:"Manage Room";s:5:"route";N;s:4:"icon";N;s:5:"order";i:19;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-23 08:58:48";s:10:"updated_at";s:19:"2026-02-23 09:19:30";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:7;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:75;s:13:"permission_id";i:251;s:9:"parent_id";i:69;s:4:"name";s:14:"Manage Booking";s:5:"route";N;s:4:"icon";N;s:5:"order";i:20;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-23 09:14:24";s:10:"updated_at";s:19:"2026-02-23 09:19:59";}s:11:"\0*\0original";a:11:{s:2:"id";i:75;s:13:"permission_id";i:251;s:9:"parent_id";i:69;s:4:"name";s:14:"Manage Booking";s:5:"route";N;s:4:"icon";N;s:5:"order";i:20;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-23 09:14:24";s:10:"updated_at";s:19:"2026-02-23 09:19:59";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:2;s:13:"permission_id";i:2;s:9:"parent_id";N;s:4:"name";s:14:"Business Setup";s:5:"route";N;s:4:"icon";s:78:"<span class="material-symbols-outlined fs-22"> settings_cinematic_blur </span>";s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:10:14";s:10:"updated_at";s:19:"2026-02-23 08:44:01";}s:11:"\0*\0original";a:11:{s:2:"id";i:2;s:13:"permission_id";i:2;s:9:"parent_id";N;s:4:"name";s:14:"Business Setup";s:5:"route";N;s:4:"icon";s:78:"<span class="material-symbols-outlined fs-22"> settings_cinematic_blur </span>";s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:10:14";s:10:"updated_at";s:19:"2026-02-23 08:44:01";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:8:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:3;s:13:"permission_id";i:3;s:9:"parent_id";i:2;s:4:"name";s:5:"Roles";s:5:"route";s:16:"admin.role.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:10:36";s:10:"updated_at";s:19:"2025-06-17 11:10:36";}s:11:"\0*\0original";a:11:{s:2:"id";i:3;s:13:"permission_id";i:3;s:9:"parent_id";i:2;s:4:"name";s:5:"Roles";s:5:"route";s:16:"admin.role.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:10:36";s:10:"updated_at";s:19:"2025-06-17 11:10:36";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:46;s:13:"permission_id";i:168;s:9:"parent_id";i:2;s:4:"name";s:7:"Regions";s:5:"route";s:18:"admin.region.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:14:11";s:10:"updated_at";s:19:"2026-02-23 09:01:48";}s:11:"\0*\0original";a:11:{s:2:"id";i:46;s:13:"permission_id";i:168;s:9:"parent_id";i:2;s:4:"name";s:7:"Regions";s:5:"route";s:18:"admin.region.index";s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:14:11";s:10:"updated_at";s:19:"2026-02-23 09:01:48";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:4;s:13:"permission_id";i:4;s:9:"parent_id";i:2;s:4:"name";s:5:"Users";s:5:"route";s:16:"admin.user.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:11:10";s:10:"updated_at";s:19:"2025-06-17 11:11:10";}s:11:"\0*\0original";a:11:{s:2:"id";i:4;s:13:"permission_id";i:4;s:9:"parent_id";i:2;s:4:"name";s:5:"Users";s:5:"route";s:16:"admin.user.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:11:10";s:10:"updated_at";s:19:"2025-06-17 11:11:10";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:47;s:13:"permission_id";i:169;s:9:"parent_id";i:2;s:4:"name";s:4:"Area";s:5:"route";s:16:"admin.area.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:14:30";s:10:"updated_at";s:19:"2026-02-23 09:02:19";}s:11:"\0*\0original";a:11:{s:2:"id";i:47;s:13:"permission_id";i:169;s:9:"parent_id";i:2;s:4:"name";s:4:"Area";s:5:"route";s:16:"admin.area.index";s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:14:30";s:10:"updated_at";s:19:"2026-02-23 09:02:19";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:5;s:13:"permission_id";i:5;s:9:"parent_id";i:2;s:4:"name";s:10:"Admin Menu";s:5:"route";s:22:"admin.admin-menu.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:11:51";s:10:"updated_at";s:19:"2026-02-23 09:03:08";}s:11:"\0*\0original";a:11:{s:2:"id";i:5;s:13:"permission_id";i:5;s:9:"parent_id";i:2;s:4:"name";s:10:"Admin Menu";s:5:"route";s:22:"admin.admin-menu.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:11:51";s:10:"updated_at";s:19:"2026-02-23 09:03:08";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:5;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:48;s:13:"permission_id";i:170;s:9:"parent_id";i:2;s:4:"name";s:9:"Territory";s:5:"route";s:21:"admin.territory.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:14:48";s:10:"updated_at";s:19:"2026-02-23 09:02:37";}s:11:"\0*\0original";a:11:{s:2:"id";i:48;s:13:"permission_id";i:170;s:9:"parent_id";i:2;s:4:"name";s:9:"Territory";s:5:"route";s:21:"admin.territory.index";s:4:"icon";N;s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 11:14:48";s:10:"updated_at";s:19:"2026-02-23 09:02:37";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:6;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:6;s:13:"permission_id";i:6;s:9:"parent_id";i:2;s:4:"name";s:14:"Admin Settings";s:5:"route";s:26:"admin.admin-settings.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:12:59";s:10:"updated_at";s:19:"2025-06-17 11:12:59";}s:11:"\0*\0original";a:11:{s:2:"id";i:6;s:13:"permission_id";i:6;s:9:"parent_id";i:2;s:4:"name";s:14:"Admin Settings";s:5:"route";s:26:"admin.admin-settings.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:12:59";s:10:"updated_at";s:19:"2025-06-17 11:12:59";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:7;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:49;s:13:"permission_id";i:183;s:9:"parent_id";i:2;s:4:"name";s:6:"Stores";s:5:"route";s:17:"admin.store.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 12:14:16";s:10:"updated_at";s:19:"2026-02-23 09:02:53";}s:11:"\0*\0original";a:11:{s:2:"id";i:49;s:13:"permission_id";i:183;s:9:"parent_id";i:2;s:4:"name";s:6:"Stores";s:5:"route";s:17:"admin.store.index";s:4:"icon";N;s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-19 12:14:16";s:10:"updated_at";s:19:"2026-02-23 09:02:53";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:72;s:13:"permission_id";i:248;s:9:"parent_id";N;s:4:"name";s:20:"Business Transaction";s:5:"route";N;s:4:"icon";s:71:"<span class="material-symbols-outlined fs-24"> bar_chart_4_bars </span>";s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-23 09:06:35";s:10:"updated_at";s:19:"2026-02-23 09:06:35";}s:11:"\0*\0original";a:11:{s:2:"id";i:72;s:13:"permission_id";i:248;s:9:"parent_id";N;s:4:"name";s:20:"Business Transaction";s:5:"route";N;s:4:"icon";s:71:"<span class="material-symbols-outlined fs-24"> bar_chart_4_bars </span>";s:5:"order";i:3;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-23 09:06:35";s:10:"updated_at";s:19:"2026-02-23 09:06:35";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:3:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:73;s:13:"permission_id";i:249;s:9:"parent_id";i:72;s:4:"name";s:12:"Sales Manage";s:5:"route";N;s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-23 09:08:12";s:10:"updated_at";s:19:"2026-02-23 09:08:12";}s:11:"\0*\0original";a:11:{s:2:"id";i:73;s:13:"permission_id";i:249;s:9:"parent_id";i:72;s:4:"name";s:12:"Sales Manage";s:5:"route";N;s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-23 09:08:12";s:10:"updated_at";s:19:"2026-02-23 09:08:12";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:74;s:13:"permission_id";i:250;s:9:"parent_id";i:72;s:4:"name";s:16:"Inventory Manage";s:5:"route";N;s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-23 09:11:25";s:10:"updated_at";s:19:"2026-02-23 09:11:25";}s:11:"\0*\0original";a:11:{s:2:"id";i:74;s:13:"permission_id";i:250;s:9:"parent_id";i:72;s:4:"name";s:16:"Inventory Manage";s:5:"route";N;s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-23 09:11:25";s:10:"updated_at";s:19:"2026-02-23 09:11:25";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:67;s:13:"permission_id";i:240;s:9:"parent_id";i:72;s:4:"name";s:8:"Expenses";s:5:"route";s:19:"admin.expense.index";s:4:"icon";s:75:"<span class="material-symbols-outlined fs-22">account_balance_wallet</span>";s:5:"order";i:5;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-18 06:45:00";s:10:"updated_at";s:19:"2026-02-23 09:13:09";}s:11:"\0*\0original";a:11:{s:2:"id";i:67;s:13:"permission_id";i:240;s:9:"parent_id";i:72;s:4:"name";s:8:"Expenses";s:5:"route";s:19:"admin.expense.index";s:4:"icon";s:75:"<span class="material-symbols-outlined fs-22">account_balance_wallet</span>";s:5:"order";i:5;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-18 06:45:00";s:10:"updated_at";s:19:"2026-02-23 09:13:09";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:10;s:13:"permission_id";i:37;s:9:"parent_id";N;s:4:"name";s:18:"General Accounting";s:5:"route";N;s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> calculate </span>";s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:42:20";s:10:"updated_at";s:19:"2026-02-23 09:23:10";}s:11:"\0*\0original";a:11:{s:2:"id";i:10;s:13:"permission_id";i:37;s:9:"parent_id";N;s:4:"name";s:18:"General Accounting";s:5:"route";N;s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> calculate </span>";s:5:"order";i:4;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:42:20";s:10:"updated_at";s:19:"2026-02-23 09:23:10";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:2:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:11;s:13:"permission_id";i:38;s:9:"parent_id";i:10;s:4:"name";s:11:"Transaction";s:5:"route";N;s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:42:51";s:10:"updated_at";s:19:"2025-06-17 11:42:51";}s:11:"\0*\0original";a:11:{s:2:"id";i:11;s:13:"permission_id";i:38;s:9:"parent_id";i:10;s:4:"name";s:11:"Transaction";s:5:"route";N;s:4:"icon";N;s:5:"order";i:1;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:42:51";s:10:"updated_at";s:19:"2025-06-17 11:42:51";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:12;s:13:"permission_id";i:39;s:9:"parent_id";i:10;s:4:"name";s:7:"Reports";s:5:"route";N;s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:43:04";s:10:"updated_at";s:19:"2025-06-17 11:43:04";}s:11:"\0*\0original";a:11:{s:2:"id";i:12;s:13:"permission_id";i:39;s:9:"parent_id";i:10;s:4:"name";s:7:"Reports";s:5:"route";N;s:4:"icon";N;s:5:"order";i:2;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:43:04";s:10:"updated_at";s:19:"2025-06-17 11:43:04";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:5;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:68;s:13:"permission_id";i:244;s:9:"parent_id";N;s:4:"name";s:14:"Investor Panel";s:5:"route";N;s:4:"icon";s:37:"<i class="fad fa-user-tie fs-18"></i>";s:5:"order";i:5;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-18 09:44:39";s:10:"updated_at";s:19:"2026-02-23 09:22:42";}s:11:"\0*\0original";a:11:{s:2:"id";i:68;s:13:"permission_id";i:244;s:9:"parent_id";N;s:4:"name";s:14:"Investor Panel";s:5:"route";N;s:4:"icon";s:37:"<i class="fad fa-user-tie fs-18"></i>";s:5:"order";i:5;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2026-02-18 09:44:39";s:10:"updated_at";s:19:"2026-02-23 09:22:42";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:2:{s:8:"children";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:6:{i:0;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:7;s:13:"permission_id";i:7;s:9:"parent_id";i:68;s:4:"name";s:9:"Investors";s:5:"route";s:20:"admin.investor.index";s:4:"icon";N;s:5:"order";i:5;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:13:38";s:10:"updated_at";s:19:"2026-02-18 09:46:02";}s:11:"\0*\0original";a:11:{s:2:"id";i:7;s:13:"permission_id";i:7;s:9:"parent_id";i:68;s:4:"name";s:9:"Investors";s:5:"route";s:20:"admin.investor.index";s:4:"icon";N;s:5:"order";i:5;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:13:38";s:10:"updated_at";s:19:"2026-02-18 09:46:02";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:1;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:8;s:13:"permission_id";i:27;s:9:"parent_id";i:68;s:4:"name";s:14:"Invest Process";s:5:"route";s:18:"admin.invest.index";s:4:"icon";s:67:"<span class="material-symbols-outlined fs-24"> finance_mode </span>";s:5:"order";i:6;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:37:47";s:10:"updated_at";s:19:"2026-02-18 09:47:18";}s:11:"\0*\0original";a:11:{s:2:"id";i:8;s:13:"permission_id";i:27;s:9:"parent_id";i:68;s:4:"name";s:14:"Invest Process";s:5:"route";s:18:"admin.invest.index";s:4:"icon";s:67:"<span class="material-symbols-outlined fs-24"> finance_mode </span>";s:5:"order";i:6;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:37:47";s:10:"updated_at";s:19:"2026-02-18 09:47:18";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:2;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:53;s:13:"permission_id";i:208;s:9:"parent_id";i:68;s:4:"name";s:19:"Profit Distribution";s:5:"route";s:31:"admin.profit-distribution.index";s:4:"icon";s:67:"<span class="material-symbols-outlined fs-24"> event_repeat </span>";s:5:"order";i:7;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-22 08:47:36";s:10:"updated_at";s:19:"2026-02-18 09:51:24";}s:11:"\0*\0original";a:11:{s:2:"id";i:53;s:13:"permission_id";i:208;s:9:"parent_id";i:68;s:4:"name";s:19:"Profit Distribution";s:5:"route";s:31:"admin.profit-distribution.index";s:4:"icon";s:67:"<span class="material-symbols-outlined fs-24"> event_repeat </span>";s:5:"order";i:7;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-22 08:47:36";s:10:"updated_at";s:19:"2026-02-18 09:51:24";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:3;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:54;s:13:"permission_id";i:214;s:9:"parent_id";i:68;s:4:"name";s:16:"Investor Payment";s:5:"route";s:28:"admin.investor-payment.index";s:4:"icon";s:63:"<span class="material-symbols-outlined fs-24"> add_card </span>";s:5:"order";i:8;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-22 12:50:16";s:10:"updated_at";s:19:"2026-02-18 09:48:01";}s:11:"\0*\0original";a:11:{s:2:"id";i:54;s:13:"permission_id";i:214;s:9:"parent_id";i:68;s:4:"name";s:16:"Investor Payment";s:5:"route";s:28:"admin.investor-payment.index";s:4:"icon";s:63:"<span class="material-symbols-outlined fs-24"> add_card </span>";s:5:"order";i:8;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-22 12:50:16";s:10:"updated_at";s:19:"2026-02-18 09:48:01";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:4;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:9;s:13:"permission_id";i:32;s:9:"parent_id";i:68;s:4:"name";s:10:"Sattlement";s:5:"route";s:29:"admin.invest-sattlement.index";s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> inventory </span>";s:5:"order";i:9;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:40:52";s:10:"updated_at";s:19:"2026-02-18 09:50:32";}s:11:"\0*\0original";a:11:{s:2:"id";i:9;s:13:"permission_id";i:32;s:9:"parent_id";i:68;s:4:"name";s:10:"Sattlement";s:5:"route";s:29:"admin.invest-sattlement.index";s:4:"icon";s:64:"<span class="material-symbols-outlined fs-24"> inventory </span>";s:5:"order";i:9;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-06-17 11:40:52";s:10:"updated_at";s:19:"2026-02-18 09:50:32";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}i:5;O:20:"App\\Models\\AdminMenu":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:11:"admin_menus";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:11:{s:2:"id";i:55;s:13:"permission_id";i:220;s:9:"parent_id";i:68;s:4:"name";s:18:"Investor Statement";s:5:"route";s:30:"admin.investor-statement.index";s:4:"icon";s:63:"<span class="material-symbols-outlined fs-24"> contract </span>";s:5:"order";i:10;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-23 04:46:53";s:10:"updated_at";s:19:"2026-02-18 09:48:32";}s:11:"\0*\0original";a:11:{s:2:"id";i:55;s:13:"permission_id";i:220;s:9:"parent_id";i:68;s:4:"name";s:18:"Investor Statement";s:5:"route";s:30:"admin.investor-statement.index";s:4:"icon";s:63:"<span class="material-symbols-outlined fs-24"> contract </span>";s:5:"order";i:10;s:6:"status";i:1;s:12:"is_deletable";i:1;s:10:"created_at";s:19:"2025-07-23 04:46:53";s:10:"updated_at";s:19:"2026-02-18 09:48:32";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:2:{s:6:"status";s:7:"boolean";s:12:"is_deletable";s:7:"boolean";}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}s:7:"actions";O:39:"Illuminate\\Database\\Eloquent\\Collection":2:{s:8:"\0*\0items";a:0:{}s:28:"\0*\0escapeWhenCastingToString";b:0;}}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:8:{i:0;s:13:"permission_id";i:1;s:9:"parent_id";i:2;s:4:"name";i:3;s:5:"route";i:4;s:4:"icon";i:5;s:5:"order";i:6;s:6:"status";i:7;s:12:"is_deletable";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}}s:28:"\0*\0escapeWhenCastingToString";b:0;}', 1771913012),
	('books_books_cache_admin_setting', 'O:23:"App\\Models\\AdminSetting":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:14:"admin_settings";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:16:{s:2:"id";i:1;s:4:"logo";s:79:"storage/admin-setting//2026-02-10-quLl7x6LIpOewvLbubTsJtU9vDBuvRatfjvBTaAY.webp";s:10:"small_logo";s:79:"storage/admin-setting//2026-02-10-npcVYQ5HMBIhcqH4DAsj5jOFLAkekKGIRl2ZzRSx.webp";s:7:"favicon";s:79:"storage/admin-setting//2026-02-10-uKHdiBUMHBaK5EWxiGoTNqLRKYfMBFDHxrbvwVlu.webp";s:12:"invest_value";i:10000;s:5:"title";s:11:"Amar Hostel";s:11:"footer_text";s:102:"© 2023 Developed by <a target="_blank" href="http://www.technoparkbd.com/">Techno Park Bangladesh</a>";s:13:"primary_color";N;s:15:"secondary_color";N;s:8:"facebook";N;s:7:"twitter";N;s:8:"linkedin";N;s:8:"whatsapp";N;s:6:"google";N;s:10:"created_at";s:19:"2026-02-10 04:38:23";s:10:"updated_at";s:19:"2026-02-10 04:38:23";}s:11:"\0*\0original";a:16:{s:2:"id";i:1;s:4:"logo";s:79:"storage/admin-setting//2026-02-10-quLl7x6LIpOewvLbubTsJtU9vDBuvRatfjvBTaAY.webp";s:10:"small_logo";s:79:"storage/admin-setting//2026-02-10-npcVYQ5HMBIhcqH4DAsj5jOFLAkekKGIRl2ZzRSx.webp";s:7:"favicon";s:79:"storage/admin-setting//2026-02-10-uKHdiBUMHBaK5EWxiGoTNqLRKYfMBFDHxrbvwVlu.webp";s:12:"invest_value";i:10000;s:5:"title";s:11:"Amar Hostel";s:11:"footer_text";s:102:"© 2023 Developed by <a target="_blank" href="http://www.technoparkbd.com/">Techno Park Bangladesh</a>";s:13:"primary_color";N;s:15:"secondary_color";N;s:8:"facebook";N;s:7:"twitter";N;s:8:"linkedin";N;s:8:"whatsapp";N;s:6:"google";N;s:10:"created_at";s:19:"2026-02-10 04:38:23";s:10:"updated_at";s:19:"2026-02-10 04:38:23";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:0:{}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:13:{i:0;s:4:"logo";i:1;s:10:"small_logo";i:2;s:7:"favicon";i:3;s:5:"title";i:4;s:11:"footer_text";i:5;s:13:"primary_color";i:6;s:15:"secondary_color";i:7;s:12:"invest_value";i:8;s:8:"facebook";i:9;s:7:"twitter";i:10;s:8:"linkedin";i:11;s:8:"whatsapp";i:12;s:6:"google";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}', 1771913012),
	('books_books_cache_setting', 'O:18:"App\\Models\\Setting":33:{s:13:"\0*\0connection";s:5:"mysql";s:8:"\0*\0table";s:8:"settings";s:13:"\0*\0primaryKey";s:2:"id";s:10:"\0*\0keyType";s:3:"int";s:12:"incrementing";b:1;s:7:"\0*\0with";a:0:{}s:12:"\0*\0withCount";a:0:{}s:19:"preventsLazyLoading";b:0;s:10:"\0*\0perPage";i:15;s:6:"exists";b:1;s:18:"wasRecentlyCreated";b:0;s:28:"\0*\0escapeWhenCastingToString";b:0;s:13:"\0*\0attributes";a:42:{s:2:"id";i:1;s:8:"app_name";s:25:"Golden Ratio Beach Resort";s:5:"title";s:25:"Golden Ratio Beach Resort";s:13:"primary_phone";s:5:"33333";s:15:"secondary_phone";s:5:"33333";s:13:"primary_email";s:22:"resort@goldenratio.com";s:15:"secondary_email";s:22:"resort@goldenratio.com";s:11:"office_time";N;s:7:"address";s:4:"dsad";s:11:"description";s:7:"dsaddas";s:10:"banner_one";N;s:15:"banner_one_link";N;s:17:"banner_one_status";i:1;s:10:"banner_two";N;s:15:"banner_two_link";N;s:17:"banner_two_status";i:1;s:15:"page_heading_bg";N;s:10:"meta_title";s:4:"dasd";s:12:"meta_keyword";s:4:"sads";s:16:"meta_description";s:4:"dsad";s:10:"meta_image";N;s:10:"google_map";N;s:7:"favicon";s:73:"storage/settings/2026-02-24-h4FrnrxwoXtuIFyAfY9owfMutbYKpsic0KAKW7pH.webp";s:4:"logo";s:73:"storage/settings/2026-02-24-NXWUdmQEdeN32dln9APyj4Q0tb91uXrwjCxyEnMZ.webp";s:11:"footer_logo";N;s:11:"placeholder";N;s:13:"facebook_page";N;s:14:"facebook_group";N;s:7:"youtube";N;s:7:"twitter";N;s:8:"linkedin";N;s:6:"google";N;s:8:"whatsapp";N;s:9:"instagram";N;s:9:"pinterest";N;s:11:"sms_api_url";N;s:11:"sms_api_key";N;s:10:"sms_api_id";N;s:12:"bkash_status";i:1;s:12:"nagad_status";i:1;s:10:"created_at";s:19:"2026-02-09 08:27:22";s:10:"updated_at";s:19:"2026-02-24 05:02:43";}s:11:"\0*\0original";a:42:{s:2:"id";i:1;s:8:"app_name";s:25:"Golden Ratio Beach Resort";s:5:"title";s:25:"Golden Ratio Beach Resort";s:13:"primary_phone";s:5:"33333";s:15:"secondary_phone";s:5:"33333";s:13:"primary_email";s:22:"resort@goldenratio.com";s:15:"secondary_email";s:22:"resort@goldenratio.com";s:11:"office_time";N;s:7:"address";s:4:"dsad";s:11:"description";s:7:"dsaddas";s:10:"banner_one";N;s:15:"banner_one_link";N;s:17:"banner_one_status";i:1;s:10:"banner_two";N;s:15:"banner_two_link";N;s:17:"banner_two_status";i:1;s:15:"page_heading_bg";N;s:10:"meta_title";s:4:"dasd";s:12:"meta_keyword";s:4:"sads";s:16:"meta_description";s:4:"dsad";s:10:"meta_image";N;s:10:"google_map";N;s:7:"favicon";s:73:"storage/settings/2026-02-24-h4FrnrxwoXtuIFyAfY9owfMutbYKpsic0KAKW7pH.webp";s:4:"logo";s:73:"storage/settings/2026-02-24-NXWUdmQEdeN32dln9APyj4Q0tb91uXrwjCxyEnMZ.webp";s:11:"footer_logo";N;s:11:"placeholder";N;s:13:"facebook_page";N;s:14:"facebook_group";N;s:7:"youtube";N;s:7:"twitter";N;s:8:"linkedin";N;s:6:"google";N;s:8:"whatsapp";N;s:9:"instagram";N;s:9:"pinterest";N;s:11:"sms_api_url";N;s:11:"sms_api_key";N;s:10:"sms_api_id";N;s:12:"bkash_status";i:1;s:12:"nagad_status";i:1;s:10:"created_at";s:19:"2026-02-09 08:27:22";s:10:"updated_at";s:19:"2026-02-24 05:02:43";}s:10:"\0*\0changes";a:0:{}s:11:"\0*\0previous";a:0:{}s:8:"\0*\0casts";a:0:{}s:17:"\0*\0classCastCache";a:0:{}s:21:"\0*\0attributeCastCache";a:0:{}s:13:"\0*\0dateFormat";N;s:10:"\0*\0appends";a:0:{}s:19:"\0*\0dispatchesEvents";a:0:{}s:14:"\0*\0observables";a:0:{}s:12:"\0*\0relations";a:0:{}s:10:"\0*\0touches";a:0:{}s:27:"\0*\0relationAutoloadCallback";N;s:26:"\0*\0relationAutoloadContext";N;s:10:"timestamps";b:1;s:13:"usesUniqueIds";b:0;s:9:"\0*\0hidden";a:0:{}s:10:"\0*\0visible";a:0:{}s:11:"\0*\0fillable";a:39:{i:0;s:8:"app_name";i:1;s:5:"title";i:2;s:13:"primary_phone";i:3;s:15:"secondary_phone";i:4;s:13:"primary_email";i:5;s:15:"secondary_email";i:6;s:11:"office_time";i:7;s:7:"address";i:8;s:11:"description";i:9;s:10:"banner_one";i:10;s:15:"banner_one_link";i:11;s:17:"banner_one_status";i:12;s:10:"banner_two";i:13;s:15:"banner_two_link";i:14;s:17:"banner_two_status";i:15;s:15:"page_heading_bg";i:16;s:10:"meta_title";i:17;s:12:"meta_keyword";i:18;s:16:"meta_description";i:19;s:10:"meta_image";i:20;s:10:"google_map";i:21;s:7:"favicon";i:22;s:4:"logo";i:23;s:11:"footer_logo";i:24;s:11:"placeholder";i:25;s:13:"facebook_page";i:26;s:14:"facebook_group";i:27;s:7:"youtube";i:28;s:7:"twitter";i:29;s:8:"linkedin";i:30;s:6:"google";i:31;s:8:"whatsapp";i:32;s:9:"instagram";i:33;s:9:"pinterest";i:34;s:11:"sms_api_url";i:35;s:11:"sms_api_key";i:36;s:10:"sms_api_id";i:37;s:12:"bkash_status";i:38;s:12:"nagad_status";}s:10:"\0*\0guarded";a:1:{i:0;s:1:"*";}}', 1771913012),
	('books_books_cache_spatie.permission.cache', 'a:3:{s:5:"alias";a:4:{s:1:"a";s:2:"id";s:1:"b";s:4:"name";s:1:"c";s:10:"guard_name";s:1:"r";s:5:"roles";}s:11:"permissions";a:169:{i:0;a:4:{s:1:"a";i:1;s:1:"b";s:9:"Dashboard";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:1;a:4:{s:1:"a";i:2;s:1:"b";s:14:"Business Setup";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:2;a:4:{s:1:"a";i:3;s:1:"b";s:5:"Roles";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:3;a:4:{s:1:"a";i:4;s:1:"b";s:5:"Users";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:4;a:4:{s:1:"a";i:5;s:1:"b";s:22:"admin.admin-menu.index";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:5;a:4:{s:1:"a";i:6;s:1:"b";s:14:"Admin Settings";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:6;a:4:{s:1:"a";i:7;s:1:"b";s:9:"Investors";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:7;a:4:{s:1:"a";i:8;s:1:"b";s:23:"admin.admin-menu.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:8;a:4:{s:1:"a";i:9;s:1:"b";s:21:"admin.admin-menu.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:9;a:4:{s:1:"a";i:10;s:1:"b";s:24:"admin.admin-menu.destroy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:10;a:4:{s:1:"a";i:11;s:1:"b";s:29:"admin.admin-menu-action.index";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:11;a:4:{s:1:"a";i:12;s:1:"b";s:30:"admin.admin-menu-action.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:12;a:4:{s:1:"a";i:13;s:1:"b";s:28:"admin.admin-menu-action.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:13;a:4:{s:1:"a";i:14;s:1:"b";s:31:"admin.admin-menu-action.destroy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:14;a:4:{s:1:"a";i:15;s:1:"b";s:17:"admin.role.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:15;a:4:{s:1:"a";i:16;s:1:"b";s:15:"admin.role.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:16;a:4:{s:1:"a";i:17;s:1:"b";s:18:"admin.role.destroy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:17;a:4:{s:1:"a";i:18;s:1:"b";s:26:"admin.role-permission.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:18;a:4:{s:1:"a";i:19;s:1:"b";s:17:"admin.user.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:19;a:4:{s:1:"a";i:20;s:1:"b";s:15:"admin.user.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:20;a:4:{s:1:"a";i:23;s:1:"b";s:21:"admin.investor.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:21;a:4:{s:1:"a";i:24;s:1:"b";s:19:"admin.investor.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:22;a:4:{s:1:"a";i:25;s:1:"b";s:22:"admin.investor.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:23;a:4:{s:1:"a";i:26;s:1:"b";s:20:"admin.investor.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:24;a:4:{s:1:"a";i:27;s:1:"b";s:14:"Invest Process";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:25;a:4:{s:1:"a";i:28;s:1:"b";s:19:"admin.invest.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:26;a:4:{s:1:"a";i:29;s:1:"b";s:17:"admin.invest.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:27;a:4:{s:1:"a";i:32;s:1:"b";s:10:"Sattlement";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:28;a:4:{s:1:"a";i:33;s:1:"b";s:30:"admin.invest-sattlement.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:29;a:4:{s:1:"a";i:34;s:1:"b";s:28:"admin.invest-sattlement.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:30;a:4:{s:1:"a";i:37;s:1:"b";s:18:"General Accounting";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:31;a:4:{s:1:"a";i:38;s:1:"b";s:11:"Transaction";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:32;a:4:{s:1:"a";i:39;s:1:"b";s:7:"Reports";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:33;a:4:{s:1:"a";i:40;s:1:"b";s:17:"Chart of Accounts";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:34;a:4:{s:1:"a";i:41;s:1:"b";s:16:"admin.coa.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:35;a:4:{s:1:"a";i:42;s:1:"b";s:14:"admin.coa.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:36;a:4:{s:1:"a";i:43;s:1:"b";s:17:"admin.coa.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:37;a:4:{s:1:"a";i:44;s:1:"b";s:13:"Debit Voucher";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:38;a:4:{s:1:"a";i:45;s:1:"b";s:26:"admin.debit-voucher.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:39;a:4:{s:1:"a";i:46;s:1:"b";s:24:"admin.debit-voucher.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:40;a:4:{s:1:"a";i:49;s:1:"b";s:14:"Credit Voucher";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:41;a:4:{s:1:"a";i:50;s:1:"b";s:27:"admin.credit-voucher.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:42;a:4:{s:1:"a";i:51;s:1:"b";s:25:"admin.credit-voucher.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:43;a:4:{s:1:"a";i:54;s:1:"b";s:15:"Journal Voucher";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:44;a:4:{s:1:"a";i:55;s:1:"b";s:28:"admin.journal-voucher.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:45;a:4:{s:1:"a";i:56;s:1:"b";s:26:"admin.journal-voucher.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:46;a:4:{s:1:"a";i:59;s:1:"b";s:27:"admin.voucher-approve.index";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:47;a:4:{s:1:"a";i:60;s:1:"b";s:26:"admin.voucher-approve.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:48;a:4:{s:1:"a";i:61;s:1:"b";s:26:"admin.voucher-approve.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:49;a:4:{s:1:"a";i:62;s:1:"b";s:26:"admin.voucher-refuse.index";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:50;a:4:{s:1:"a";i:63;s:1:"b";s:25:"admin.voucher-refuse.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:51;a:4:{s:1:"a";i:64;s:1:"b";s:25:"admin.voucher-refuse.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:52;a:4:{s:1:"a";i:65;s:1:"b";s:30:"admin.automation-approve.index";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:53;a:4:{s:1:"a";i:66;s:1:"b";s:29:"admin.automation-approve.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:54;a:4:{s:1:"a";i:67;s:1:"b";s:29:"admin.automation-approve.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:55;a:4:{s:1:"a";i:71;s:1:"b";s:19:"Chart of Accounts 1";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:56;a:4:{s:1:"a";i:72;s:1:"b";s:18:"Daily Voucher List";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:57;a:4:{s:1:"a";i:73;s:1:"b";s:15:"Daily Cash Book";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:58;a:4:{s:1:"a";i:74;s:1:"b";s:9:"Bank Book";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:59;a:4:{s:1:"a";i:75;s:1:"b";s:18:"Transaction Ledger";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:60;a:4:{s:1:"a";i:76;s:1:"b";s:14:"General Ledger";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:61;a:4:{s:1:"a";i:77;s:1:"b";s:19:"Cash Flow Statement";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:62;a:4:{s:1:"a";i:79;s:1:"b";s:16:"Income Statement";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:63;a:4:{s:1:"a";i:81;s:1:"b";s:24:"admin.debit-voucher.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:64;a:4:{s:1:"a";i:82;s:1:"b";s:25:"admin.debit-voucher.print";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:65;a:4:{s:1:"a";i:83;s:1:"b";s:27:"admin.debit-voucher.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:66;a:4:{s:1:"a";i:84;s:1:"b";s:25:"admin.debit-voucher.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:67;a:4:{s:1:"a";i:85;s:1:"b";s:25:"admin.credit-voucher.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:68;a:4:{s:1:"a";i:86;s:1:"b";s:26:"admin.credit-voucher.print";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:69;a:4:{s:1:"a";i:87;s:1:"b";s:28:"admin.credit-voucher.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:70;a:4:{s:1:"a";i:88;s:1:"b";s:26:"admin.credit-voucher.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:71;a:4:{s:1:"a";i:90;s:1:"b";s:20:"admin.invest.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:72;a:4:{s:1:"a";i:91;s:1:"b";s:18:"admin.invest.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:73;a:4:{s:1:"a";i:100;s:1:"b";s:20:"admin.settings.index";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:74;a:4:{s:1:"a";i:101;s:1:"b";s:20:"admin.product.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:75;a:4:{s:1:"a";i:102;s:1:"b";s:18:"admin.product.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:76;a:4:{s:1:"a";i:127;s:1:"b";s:28:"admin.invest-sattlement.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:77;a:4:{s:1:"a";i:128;s:1:"b";s:31:"admin.invest-sattlement.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:78;a:4:{s:1:"a";i:129;s:1:"b";s:29:"admin.invest-sattlement.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:79;a:4:{s:1:"a";i:130;s:1:"b";s:19:"admin.user.password";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:80;a:4:{s:1:"a";i:131;s:1:"b";s:18:"admin.user.destroy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:81;a:4:{s:1:"a";i:132;s:1:"b";s:16:"admin.user.trash";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:82;a:4:{s:1:"a";i:135;s:1:"b";s:27:"admin.product-edition.index";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:83;a:4:{s:1:"a";i:139;s:1:"b";s:11:"Productions";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:84;a:4:{s:1:"a";i:142;s:1:"b";s:27:"admin.product-edition.store";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:85;a:4:{s:1:"a";i:143;s:1:"b";s:26:"admin.product-edition.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:86;a:4:{s:1:"a";i:144;s:1:"b";s:29:"admin.product-edition.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:87;a:4:{s:1:"a";i:145;s:1:"b";s:21:"admin.product.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:88;a:4:{s:1:"a";i:146;s:1:"b";s:19:"admin.product.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:89;a:4:{s:1:"a";i:147;s:1:"b";s:23:"admin.production.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:90;a:4:{s:1:"a";i:148;s:1:"b";s:21:"admin.production.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:91;a:4:{s:1:"a";i:149;s:1:"b";s:21:"admin.production.show";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:92;a:4:{s:1:"a";i:152;s:1:"b";s:22:"admin.production.print";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:93;a:4:{s:1:"a";i:153;s:1:"b";s:24:"admin.production.destroy";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:94;a:4:{s:1:"a";i:154;s:1:"b";s:22:"admin.production.trash";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:95;a:4:{s:1:"a";i:156;s:1:"b";s:18:"admin.client.index";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:96;a:4:{s:1:"a";i:157;s:1:"b";s:7:"Sales 1";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:97;a:4:{s:1:"a";i:158;s:1:"b";s:19:"admin.client.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:98;a:4:{s:1:"a";i:159;s:1:"b";s:17:"admin.client.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:99;a:4:{s:1:"a";i:160;s:1:"b";s:20:"admin.client.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:100;a:4:{s:1:"a";i:161;s:1:"b";s:18:"admin.client.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:101;a:4:{s:1:"a";i:162;s:1:"b";s:18:"admin.sales.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:102;a:4:{s:1:"a";i:163;s:1:"b";s:16:"admin.sales.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:103;a:4:{s:1:"a";i:164;s:1:"b";s:16:"admin.sales.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:104;a:4:{s:1:"a";i:166;s:1:"b";s:5:"Stock";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:105;a:4:{s:1:"a";i:168;s:1:"b";s:7:"Regions";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:106;a:4:{s:1:"a";i:169;s:1:"b";s:4:"Area";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:107;a:4:{s:1:"a";i:170;s:1:"b";s:9:"Territory";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:108;a:4:{s:1:"a";i:171;s:1:"b";s:19:"admin.region.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:109;a:4:{s:1:"a";i:172;s:1:"b";s:17:"admin.region.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:110;a:4:{s:1:"a";i:173;s:1:"b";s:20:"admin.region.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:111;a:4:{s:1:"a";i:174;s:1:"b";s:18:"admin.region.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:112;a:4:{s:1:"a";i:175;s:1:"b";s:17:"admin.area.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:113;a:4:{s:1:"a";i:176;s:1:"b";s:15:"admin.area.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:114;a:4:{s:1:"a";i:177;s:1:"b";s:18:"admin.area.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:115;a:4:{s:1:"a";i:178;s:1:"b";s:16:"admin.area.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:116;a:4:{s:1:"a";i:179;s:1:"b";s:22:"admin.territory.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:117;a:4:{s:1:"a";i:180;s:1:"b";s:20:"admin.territory.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:118;a:4:{s:1:"a";i:181;s:1:"b";s:23:"admin.territory.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:119;a:4:{s:1:"a";i:182;s:1:"b";s:21:"admin.territory.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:120;a:4:{s:1:"a";i:183;s:1:"b";s:6:"Stores";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:121;a:4:{s:1:"a";i:184;s:1:"b";s:18:"admin.store.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:122;a:4:{s:1:"a";i:185;s:1:"b";s:16:"admin.store.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:123;a:4:{s:1:"a";i:186;s:1:"b";s:19:"admin.store.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:124;a:4:{s:1:"a";i:187;s:1:"b";s:17:"admin.store.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:125;a:4:{s:1:"a";i:188;s:1:"b";s:19:"admin.sales.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:126;a:4:{s:1:"a";i:189;s:1:"b";s:17:"admin.sales.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:127;a:4:{s:1:"a";i:190;s:1:"b";s:11:"Collections";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:128;a:4:{s:1:"a";i:191;s:1:"b";s:23:"admin.collection.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:129;a:4:{s:1:"a";i:192;s:1:"b";s:21:"admin.collection.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:130;a:4:{s:1:"a";i:193;s:1:"b";s:21:"admin.collection.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:131;a:4:{s:1:"a";i:194;s:1:"b";s:24:"admin.collection.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:132;a:4:{s:1:"a";i:195;s:1:"b";s:22:"admin.collection.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:133;a:4:{s:1:"a";i:208;s:1:"b";s:19:"Profit Distribution";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:134;a:4:{s:1:"a";i:209;s:1:"b";s:32:"admin.profit-distribution.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:135;a:4:{s:1:"a";i:210;s:1:"b";s:30:"admin.profit-distribution.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:136;a:4:{s:1:"a";i:211;s:1:"b";s:30:"admin.profit-distribution.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:137;a:4:{s:1:"a";i:212;s:1:"b";s:33:"admin.profit-distribution.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:138;a:4:{s:1:"a";i:213;s:1:"b";s:31:"admin.profit-distribution.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:139;a:4:{s:1:"a";i:214;s:1:"b";s:16:"Investor Payment";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:140;a:4:{s:1:"a";i:215;s:1:"b";s:29:"admin.investor-payment.create";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:141;a:4:{s:1:"a";i:216;s:1:"b";s:27:"admin.investor-payment.edit";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:142;a:4:{s:1:"a";i:217;s:1:"b";s:27:"admin.investor-payment.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:143;a:4:{s:1:"a";i:218;s:1:"b";s:30:"admin.investor-payment.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:144;a:4:{s:1:"a";i:219;s:1:"b";s:28:"admin.investor-payment.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:145;a:4:{s:1:"a";i:220;s:1:"b";s:18:"Investor Statement";s:1:"c";s:3:"web";s:1:"r";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:146;a:4:{s:1:"a";i:221;s:1:"b";s:26:"admin.journal-voucher.show";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:147;a:4:{s:1:"a";i:222;s:1:"b";s:27:"admin.journal-voucher.print";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:148;a:4:{s:1:"a";i:223;s:1:"b";s:29:"admin.journal-voucher.destroy";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:149;a:4:{s:1:"a";i:224;s:1:"b";s:27:"admin.journal-voucher.trash";s:1:"c";s:3:"web";s:1:"r";a:2:{i:0;i:1;i:1;i:2;}}i:150;a:4:{s:1:"a";i:231;s:1:"b";s:11:"Room Manage";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:151;a:4:{s:1:"a";i:233;s:1:"b";s:11:"Room Type 1";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:152;a:4:{s:1:"a";i:235;s:1:"b";s:20:"admin.bookings.index";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:153;a:4:{s:1:"a";i:236;s:1:"b";s:20:"admin.services.index";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:154;a:4:{s:1:"a";i:237;s:1:"b";s:14:"Gallery Manage";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:155;a:4:{s:1:"a";i:238;s:1:"b";s:18:"Testimonial Manage";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:156;a:4:{s:1:"a";i:239;s:1:"b";s:12:"About Manage";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:157;a:4:{s:1:"a";i:240;s:1:"b";s:8:"Expenses";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:158;a:4:{s:1:"a";i:241;s:1:"b";s:20:"admin.expense.create";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:159;a:4:{s:1:"a";i:242;s:1:"b";s:18:"admin.expense.edit";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:160;a:4:{s:1:"a";i:243;s:1:"b";s:18:"admin.expense.show";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:161;a:4:{s:1:"a";i:244;s:1:"b";s:14:"Investor Panel";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:162;a:4:{s:1:"a";i:245;s:1:"b";s:13:"Website Setup";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:163;a:4:{s:1:"a";i:246;s:1:"b";s:9:"Room Type";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:164;a:4:{s:1:"a";i:247;s:1:"b";s:11:"Manage Room";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:165;a:4:{s:1:"a";i:248;s:1:"b";s:20:"Business Transaction";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:166;a:4:{s:1:"a";i:249;s:1:"b";s:14:"Sales Manage 1";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:167;a:4:{s:1:"a";i:250;s:1:"b";s:16:"Inventory Manage";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}i:168;a:4:{s:1:"a";i:251;s:1:"b";s:14:"Manage Booking";s:1:"c";s:3:"web";s:1:"r";a:1:{i:0;i:1;}}}s:5:"roles";a:3:{i:0;a:3:{s:1:"a";i:1;s:1:"b";s:14:"Software Admin";s:1:"c";s:3:"web";}i:1;a:3:{s:1:"a";i:2;s:1:"b";s:12:"System Admin";s:1:"c";s:3:"web";}i:2;a:3:{s:1:"a";i:3;s:1:"b";s:8:"Investor";s:1:"c";s:3:"web";}}}', 1771995823);

-- Dumping structure for table golden_ratio.cache_locks
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.cache_locks: ~0 rows (approximately)
DELETE FROM `cache_locks`;

-- Dumping structure for table golden_ratio.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.categories: ~4 rows (approximately)
DELETE FROM `categories`;
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Single', '2026-02-08 03:21:14', '2026-02-08 03:23:49'),
	(2, 'Double', '2026-02-08 03:23:00', '2026-02-08 03:23:00'),
	(3, 'Deluxe Twin', '2026-02-08 03:23:42', '2026-02-08 03:23:42'),
	(4, 'Dormitory', '2026-02-08 03:24:07', '2026-02-08 03:24:07');

-- Dumping structure for table golden_ratio.clients
DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `coa_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `region_id` bigint unsigned DEFAULT NULL,
  `area_id` bigint unsigned DEFAULT NULL,
  `territory_id` bigint unsigned DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(16,0) DEFAULT NULL,
  `bin_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_code_unique` (`code`),
  KEY `clients_coa_id_foreign` (`coa_id`),
  KEY `clients_region_id_foreign` (`region_id`),
  KEY `clients_area_id_foreign` (`area_id`),
  KEY `clients_territory_id_foreign` (`territory_id`),
  KEY `clients_created_by_foreign` (`created_by`),
  KEY `clients_updated_by_foreign` (`updated_by`),
  KEY `clients_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.clients: ~7 rows (approximately)
DELETE FROM `clients`;
INSERT INTO `clients` (`id`, `coa_id`, `user_id`, `region_id`, `area_id`, `territory_id`, `code`, `name`, `contact_person`, `phone`, `email`, `address`, `credit_limit`, `bin_no`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 254, 9, 2, 48, 50, 'airacode322', 'Aira', NULL, '01222222222', 'aira@gmail.com', NULL, 222, NULL, 1, 1, NULL, NULL, NULL, '2026-02-19 02:16:17', '2026-02-19 02:16:17'),
	(2, 265, NULL, 2, 48, 50, 'Rafi', 'Rafi', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-02-21 21:45:05', '2026-02-21 21:45:05'),
	(3, 266, 3, 2, 48, 50, 'dfsf', 'Mijan', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-02-21 21:49:06', '2026-02-21 21:49:06'),
	(7, 267, 35, 2, 48, 50, 'ffdf', 'Niloy', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, '2026-02-21 21:57:30', '2026-02-21 22:01:33'),
	(8, 269, 36, 1, 1, 1, 'codefiza', 'fiza', 'fiza', '11111111111', 'fija@gmail.com', '11111111111', 0, NULL, 1, 36, NULL, NULL, NULL, '2026-02-22 02:49:24', '2026-02-22 02:49:24'),
	(9, 271, 37, 2, 48, 50, 'asf1222', 'Asif', NULL, '1234567890', NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, '2026-02-22 22:05:15', '2026-02-22 23:14:49'),
	(10, 272, 38, 1, 1, 1, 'codeArif', 'Arif', 'Arif', '01111999898', 'arif@gmail.com', '01111999898', 0, NULL, 1, 38, NULL, NULL, NULL, '2026-02-23 21:55:44', '2026-02-23 21:55:44');

-- Dumping structure for table golden_ratio.coa_setups
DROP TABLE IF EXISTS `coa_setups`;
CREATE TABLE IF NOT EXISTS `coa_setups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint unsigned DEFAULT NULL,
  `head_code` bigint NOT NULL,
  `head_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction` tinyint(1) NOT NULL DEFAULT '0',
  `general` tinyint(1) NOT NULL DEFAULT '0',
  `head_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updateable` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coas_head_code_unique` (`head_code`),
  KEY `coas_parent_id_foreign` (`parent_id`),
  KEY `coas_created_by_foreign` (`created_by`),
  KEY `coas_updated_by_foreign` (`updated_by`),
  KEY `coas_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.coa_setups: ~162 rows (approximately)
DELETE FROM `coa_setups`;
INSERT INTO `coa_setups` (`id`, `parent_id`, `head_code`, `head_name`, `transaction`, `general`, `head_type`, `status`, `updateable`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 'Assets', 0, 0, 'A', 1, 0, 1, NULL, NULL, NULL, '2025-06-17 12:32:17', '2025-06-17 12:32:17'),
	(2, NULL, 2, 'Liabilities', 0, 0, 'L', 1, 0, 1, NULL, NULL, NULL, '2025-06-17 12:32:17', '2025-06-17 12:32:17'),
	(3, NULL, 3, 'Income', 0, 0, 'I', 1, 0, 1, NULL, NULL, NULL, '2025-06-17 12:34:45', '2025-06-17 12:34:45'),
	(4, NULL, 4, 'Expense', 0, 0, 'E', 1, 0, 1, NULL, NULL, NULL, '2025-06-17 12:34:45', '2025-06-17 12:34:45'),
	(5, 1, 101, 'Current Asset', 0, 0, 'A', 1, 0, 1, NULL, NULL, NULL, '2025-06-17 06:41:07', '2025-06-17 06:41:07'),
	(6, 1, 102, 'Fixed Asset', 0, 0, 'A', 1, 0, 1, NULL, NULL, NULL, '2025-06-17 06:48:44', '2025-06-17 06:48:44'),
	(7, 5, 10101, 'Account Receivable', 0, 1, 'A', 1, 0, 1, NULL, NULL, NULL, '2025-06-17 06:48:58', '2025-06-17 06:48:58'),
	(8, 5, 10102, 'Cash In Hand', 0, 1, 'A', 1, 0, 1, NULL, NULL, NULL, '2025-06-17 06:49:12', '2025-06-17 06:49:12'),
	(9, 5, 10103, 'Cash at Bank', 0, 1, 'A', 1, 0, 1, NULL, NULL, NULL, '2025-06-17 06:49:30', '2025-06-17 06:49:30'),
	(10, 2, 201, 'Cash Payable', 0, 1, 'L', 1, 0, 1, NULL, NULL, NULL, '2025-06-17 06:50:27', '2025-06-17 06:50:27'),
	(11, 2, 202, 'Investor Capital', 0, 1, 'L', 1, 0, 1, NULL, NULL, NULL, '2025-06-17 06:50:42', '2025-06-17 06:50:42'),
	(13, 8, 1010201, 'Cash', 1, 0, 'I', 1, 1, 1, NULL, NULL, NULL, '2025-06-18 00:10:11', '2025-06-18 00:10:11'),
	(14, 9, 1010301, 'Card', 1, 0, 'I', 1, 1, 1, 1, NULL, NULL, '2025-06-18 00:10:23', '2025-10-04 02:12:51'),
	(26, 3, 301, 'Direct Income', 0, 1, 'I', 1, 0, 1, 1, NULL, NULL, '2025-06-22 22:49:53', '2025-10-04 01:12:31'),
	(42, 4, 402, 'Investor Profit', 0, 1, 'E', 1, 1, 1, NULL, NULL, NULL, '2025-07-01 21:56:15', '2025-07-01 21:56:15'),
	(68, 11, 20201, 'Business Box', 1, 0, 'L', 1, 0, 1, NULL, NULL, NULL, '2025-07-26 05:51:59', '2025-07-26 05:51:59'),
	(69, 42, 40201, 'Business Box - Profit', 1, 0, 'E', 1, 0, 1, NULL, NULL, NULL, '2025-07-26 05:51:59', '2025-07-26 05:51:59'),
	(70, 11, 20202, 'Faysal Ovi', 1, 0, 'L', 1, 0, 1, NULL, NULL, NULL, '2025-07-26 05:54:59', '2025-07-26 05:54:59'),
	(71, 42, 40202, 'Faysal Ovi - Profit', 1, 0, 'E', 1, 0, 1, NULL, NULL, NULL, '2025-07-26 05:54:59', '2025-07-26 05:54:59'),
	(72, 11, 20203, 'SK Turag', 1, 0, 'L', 1, 0, 1, NULL, NULL, NULL, '2025-07-26 05:56:27', '2025-07-26 05:56:27'),
	(73, 42, 40203, 'SK Turag - Profit', 1, 0, 'E', 1, 0, 1, NULL, NULL, NULL, '2025-07-26 05:56:27', '2025-07-26 05:56:27'),
	(74, 11, 20204, 'Ibrahim Kholil', 1, 0, 'L', 1, 0, 1, NULL, NULL, NULL, '2025-08-03 06:26:44', '2025-08-03 06:26:44'),
	(75, 42, 40204, 'Ibrahim Kholil - Profit', 1, 0, 'E', 1, 0, 1, NULL, NULL, NULL, '2025-08-03 06:26:44', '2025-08-03 06:26:44'),
	(77, 11, 20205, 'Rana Ibrahim', 1, 0, 'L', 1, 0, 1, NULL, NULL, NULL, '2025-08-04 00:29:56', '2025-08-04 00:29:56'),
	(78, 42, 40205, 'Rana Ibrahim - Profit', 1, 0, 'E', 1, 0, 1, NULL, NULL, NULL, '2025-08-04 00:29:56', '2025-08-04 00:29:56'),
	(79, 11, 20206, 'Kartik Biswas', 1, 0, 'L', 1, 0, 1, NULL, NULL, NULL, '2025-08-13 02:44:17', '2025-08-13 02:44:17'),
	(80, 42, 40206, 'Kartik Biswas - Profit', 1, 0, 'E', 1, 0, 1, NULL, NULL, NULL, '2025-08-13 02:44:17', '2025-08-13 02:44:17'),
	(81, 2, 203, 'Share Equity', 0, 1, 'L', 1, 1, 1, 1, NULL, NULL, '2025-08-31 21:49:37', '2025-08-31 21:49:40'),
	(82, 81, 20301, 'Mamunur Rashid Fattah', 1, 0, 'L', 1, 1, 1, NULL, NULL, NULL, '2025-08-31 21:49:55', '2025-08-31 21:49:55'),
	(83, 11, 20207, 'Mamunur Rashid', 1, 0, 'L', 1, 0, 1, NULL, NULL, NULL, '2025-08-31 22:36:09', '2025-08-31 22:36:09'),
	(84, 42, 40207, 'Mamunur Rashid - Profit', 1, 0, 'E', 1, 0, 1, NULL, NULL, NULL, '2025-08-31 22:36:09', '2025-08-31 22:36:09'),
	(85, 4, 403, 'Operational Exp.', 0, 1, 'E', 1, 1, 1, NULL, NULL, NULL, '2025-08-31 22:58:16', '2025-08-31 22:58:16'),
	(89, 6, 10201, 'Electronics & Devices', 0, 1, 'A', 1, 1, 1, NULL, NULL, NULL, '2025-08-31 22:59:50', '2025-08-31 22:59:50'),
	(91, 89, 1020101, 'Computer, Laptop, Printer', 1, 0, 'A', 1, 1, 1, 1, NULL, NULL, '2025-08-31 23:00:46', '2025-08-31 23:01:09'),
	(93, 85, 40301, 'Driver Commission', 1, 0, 'E', 1, 1, 1, 2, NULL, NULL, '2025-08-31 23:19:14', '2025-10-19 03:51:06'),
	(94, 85, 40302, 'Utility BIll', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2025-08-31 23:20:30', '2025-10-01 07:15:02'),
	(95, 85, 40303, 'Office Rent', 1, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2025-08-31 23:23:35', '2025-08-31 23:23:35'),
	(96, 11, 20208, 'Abdullah Faysal', 1, 0, 'L', 1, 0, 1, NULL, NULL, NULL, '2025-09-08 03:55:39', '2025-09-08 03:55:39'),
	(97, 42, 40208, 'Abdullah Faysal - Profit', 1, 0, 'E', 1, 0, 1, NULL, NULL, NULL, '2025-09-08 03:55:39', '2025-09-08 03:55:39'),
	(103, 11, 20209, 'Md Tofajjel Hossain', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-15 07:09:54', '2025-10-10 22:42:32'),
	(104, 42, 40209, 'Md Tofajjel Hossain - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-15 07:09:54', '2025-10-10 22:42:32'),
	(105, 11, 20210, 'Kartik Biswas', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-15 07:10:31', '2025-10-10 22:42:59'),
	(106, 42, 40210, 'Kartik Biswas - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-15 07:10:31', '2025-10-10 22:42:59'),
	(107, 11, 20211, 'Sk Turag', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:11:38', '2025-10-10 22:42:57'),
	(108, 42, 40211, 'Sk Turag - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:11:38', '2025-10-10 22:42:57'),
	(109, 11, 20212, 'Moonmoon Gulshan', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:12:01', '2025-10-10 22:42:54'),
	(110, 42, 40212, 'Moonmoon Gulshan - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:12:01', '2025-10-10 22:42:54'),
	(113, 11, 20214, 'Islam Zahirul', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:12:30', '2025-10-10 22:42:51'),
	(114, 42, 40214, 'Islam Zahirul - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:12:30', '2025-10-10 22:42:51'),
	(117, 11, 20216, 'Nur Bogura', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:12:56', '2025-10-10 22:42:48'),
	(118, 42, 40216, 'Nur Bogura - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:12:56', '2025-10-10 22:42:48'),
	(119, 11, 20217, 'Shaiful Islam', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:13:10', '2025-10-10 22:42:45'),
	(120, 42, 40217, 'Shaiful Islam - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:13:10', '2025-10-10 22:42:45'),
	(121, 11, 20218, 'Mohabbat Ullah', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:13:21', '2025-10-10 22:42:43'),
	(122, 42, 40218, 'Mohabbat Ullah - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:13:21', '2025-10-10 22:42:43'),
	(123, 11, 20219, 'Mehedi Khan', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:13:40', '2025-10-10 22:42:41'),
	(124, 42, 40219, 'Mehedi Khan - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:13:40', '2025-10-10 22:42:41'),
	(127, 11, 20221, 'Joyjit Chowdhury', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:14:00', '2025-10-10 22:42:38'),
	(128, 42, 40221, 'Joyjit Chowdhury - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:14:00', '2025-10-10 22:42:38'),
	(131, 11, 20223, 'Mostafizur Rahman', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:14:32', '2025-10-10 22:42:35'),
	(132, 42, 40223, 'Mostafizur Rahman - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:14:32', '2025-10-10 22:42:35'),
	(143, 11, 20229, 'AL Emran', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:15:48', '2025-10-10 22:42:17'),
	(144, 42, 40229, 'AL Emran - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:15:48', '2025-10-10 22:42:17'),
	(149, 11, 20232, 'Moshiujjaman Sumon', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:16:35', '2025-10-10 22:42:14'),
	(150, 42, 40232, 'Moshiujjaman Sumon - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:16:35', '2025-10-10 22:42:14'),
	(151, 11, 20233, 'Mahbubul Alam Rasel', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:16:48', '2025-10-10 22:42:12'),
	(152, 42, 40233, 'Mahbubul Alam Rasel - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:16:48', '2025-10-10 22:42:12'),
	(153, 11, 20234, 'Md Montakimul Chowdhury', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:16:59', '2025-10-10 22:42:09'),
	(154, 42, 40234, 'Md Montakimul Chowdhury - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:16:59', '2025-10-10 22:42:09'),
	(155, 11, 20235, 'Ahasan Al Azad', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:17:11', '2025-10-10 22:42:07'),
	(156, 42, 40235, 'Ahasan Al Azad - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:17:11', '2025-10-10 22:42:07'),
	(169, 11, 20242, 'Saidur Rahman', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:18:33', '2025-10-12 04:04:09'),
	(170, 42, 40242, 'Saidur Rahman - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:18:33', '2025-10-12 04:04:09'),
	(173, 11, 20244, 'শাহিন আক্তার', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:18:57', '2025-10-10 22:42:00'),
	(174, 42, 40244, 'শাহিন আক্তার - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:18:57', '2025-10-10 22:42:00'),
	(175, 11, 20245, 'Mahbub Alam', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:19:10', '2025-10-10 22:41:58'),
	(176, 42, 40245, 'Mahbub Alam - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:19:10', '2025-10-10 22:41:58'),
	(177, 11, 20246, 'Sayid ahmed', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:19:21', '2025-10-10 22:41:53'),
	(178, 42, 40246, 'Sayid ahmed - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:19:21', '2025-10-10 22:41:53'),
	(179, 11, 20247, 'Subal Mahato Rahul 3BL', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:19:32', '2025-10-10 22:41:50'),
	(180, 42, 40247, 'Subal Mahato Rahul 3BL - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:19:32', '2025-10-10 22:41:50'),
	(183, 11, 20249, 'সজীব আহম্মেদ', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:19:55', '2025-10-10 22:41:47'),
	(184, 42, 40249, 'সজীব আহম্মেদ - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:19:55', '2025-10-10 22:41:47'),
	(185, 11, 20250, 'Optom Sohel Rana', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:20:08', '2025-10-10 22:41:44'),
	(186, 42, 40250, 'Optom Sohel Rana - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:20:08', '2025-10-10 22:41:44'),
	(187, 11, 20251, 'Mamunur Rashid', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:21:14', '2025-10-10 22:41:41'),
	(188, 42, 40251, 'Mamunur Rashid - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:21:14', '2025-10-10 22:41:41'),
	(191, 11, 20253, 'Arif Nondipara', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:21:36', '2025-10-10 22:41:39'),
	(192, 42, 40253, 'Arif Nondipara - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:21:36', '2025-10-10 22:41:39'),
	(193, 11, 20254, 'Atikullah', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:21:47', '2025-10-10 22:41:36'),
	(194, 42, 40254, 'Atikullah - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:21:47', '2025-10-10 22:41:36'),
	(195, 11, 20255, 'Siam Mahmud', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:21:58', '2025-10-10 22:41:34'),
	(196, 42, 40255, 'Siam Mahmud - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:21:58', '2025-10-10 22:41:34'),
	(197, 11, 20256, 'MD. ABDUR RAZZAK', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:22:12', '2025-10-11 23:03:25'),
	(198, 42, 40256, 'MD. ABDUR RAZZAK - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-17 07:22:12', '2025-10-11 23:03:25'),
	(199, 11, 20257, 'Makif Mahfuz', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-27 21:56:48', '2025-10-10 22:41:29'),
	(200, 42, 40257, 'Makif Mahfuz - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-27 21:56:48', '2025-10-10 22:41:29'),
	(201, 11, 20258, 'Md. Atikur Rahoman', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-27 21:58:37', '2025-10-10 22:41:26'),
	(202, 42, 40258, 'Md. Atikur Rahoman - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-27 21:58:37', '2025-10-10 22:41:26'),
	(203, 11, 20259, 'MD ATIQUZZAMAN', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-27 21:59:39', '2025-10-10 22:41:23'),
	(204, 42, 40259, 'MD ATIQUZZAMAN - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-27 21:59:39', '2025-10-10 22:41:23'),
	(205, 11, 20260, 'Eazajul Islam Rahat Khan', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-27 22:00:19', '2025-10-10 22:40:57'),
	(206, 42, 40260, 'Eazajul Islam Rahat Khan - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-27 22:00:19', '2025-10-10 22:40:57'),
	(207, 11, 20261, 'Masud Rana Himel', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-27 22:03:47', '2025-10-10 22:40:53'),
	(208, 42, 40261, 'Masud Rana Himel - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-27 22:03:47', '2025-10-10 22:40:53'),
	(209, 11, 20262, 'Kamrul Hasan', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-27 22:05:17', '2025-10-10 22:40:50'),
	(210, 42, 40262, 'Kamrul Hasan - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-27 22:05:17', '2025-10-10 22:40:50'),
	(211, 11, 20263, 'Md saymon(vr-298)', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-27 22:06:28', '2025-10-10 22:40:47'),
	(212, 42, 40263, 'Md saymon(vr-298) - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-27 22:06:28', '2025-10-10 22:40:47'),
	(213, 11, 20264, 'মুফতি মাওলানা আব্দুল্লাহ', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-27 22:07:28', '2025-10-10 22:40:45'),
	(214, 42, 40264, 'মুফতি মাওলানা আব্দুল্লাহ - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-27 22:07:28', '2025-10-10 22:40:45'),
	(215, 11, 20265, 'Tanvir Amma', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-27 22:08:08', '2025-10-10 22:40:42'),
	(216, 42, 40265, 'Tanvir Amma - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-27 22:08:08', '2025-10-10 22:40:42'),
	(217, 11, 20266, 'Saddam Rupali', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-27 22:10:15', '2025-10-10 22:40:40'),
	(218, 42, 40266, 'Saddam Rupali - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-27 22:10:15', '2025-10-10 22:40:40'),
	(219, 11, 20267, 'Symoon Maruf 3BL', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-27 22:11:00', '2025-10-10 22:40:37'),
	(220, 42, 40267, 'Symoon Maruf 3BL - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-27 22:11:00', '2025-10-10 22:40:37'),
	(221, 11, 20268, 'সৌমিক আজিজ', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-28 23:38:31', '2025-10-10 22:40:33'),
	(222, 42, 40268, 'সৌমিক আজিজ - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-28 23:38:31', '2025-10-10 22:40:33'),
	(223, 11, 20269, 'Rashed Ahmed', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-28 23:45:14', '2025-10-10 22:40:30'),
	(224, 42, 40269, 'Rashed Ahmed - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-28 23:45:14', '2025-10-10 22:40:30'),
	(225, 11, 20270, 'Abdullah Faysal', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-28 23:47:54', '2025-10-10 22:40:28'),
	(226, 42, 40270, 'Abdullah Faysal - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-28 23:47:54', '2025-10-10 22:40:28'),
	(227, 11, 20271, 'Golam Rabby', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-28 23:54:17', '2025-10-10 22:40:25'),
	(228, 42, 40271, 'Golam Rabby - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-28 23:54:17', '2025-10-10 22:40:25'),
	(229, 11, 20272, 'Sakib Khan', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-28 23:54:46', '2025-10-10 22:40:23'),
	(230, 42, 40272, 'Sakib Khan - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-28 23:54:46', '2025-10-10 22:40:23'),
	(233, 11, 20274, 'Sharif Garman', 1, 0, 'L', 1, 0, 1, 1, NULL, NULL, '2025-09-29 22:40:39', '2025-10-10 22:40:20'),
	(234, 42, 40274, 'Sharif Garman - Profit', 1, 0, 'E', 1, 0, 1, 1, NULL, NULL, '2025-09-29 22:40:39', '2025-10-10 22:40:20'),
	(235, 26, 30101, 'Service Income', 1, 0, 'I', 1, 0, 1, NULL, NULL, NULL, '2025-10-04 01:13:58', '2025-10-04 01:13:58'),
	(236, 7, 1010101, 'Customer Service', 1, 0, 'A', 1, 0, 1, NULL, NULL, NULL, '2025-10-04 01:18:12', '2025-10-04 01:18:12'),
	(237, 9, 1010302, 'bKash', 1, 0, 'A', 1, 0, 1, NULL, NULL, NULL, '2025-10-04 02:11:21', '2025-10-04 02:11:21'),
	(238, 9, 1010303, 'Nagad', 1, 0, 'A', 1, 0, 1, NULL, NULL, NULL, '2025-10-04 02:11:27', '2025-10-04 02:11:27'),
	(239, 9, 1010304, 'UCB Bank', 1, 0, 'A', 1, 1, 1, 1, NULL, NULL, '2025-10-04 02:11:51', '2025-10-04 02:13:19'),
	(240, 8, 1010202, 'Cheque', 1, 0, 'A', 1, 0, 1, NULL, NULL, NULL, '2025-10-04 02:12:17', '2025-10-04 02:12:17'),
	(241, 11, 20275, 'Abdullah Badda', 1, 0, 'L', 1, 0, 2, 1, NULL, NULL, '2025-10-08 01:47:45', '2025-10-13 01:52:38'),
	(242, 42, 40275, 'Abdullah Badda - Profit', 1, 0, 'E', 1, 0, 2, 1, NULL, NULL, '2025-10-08 01:47:45', '2025-10-13 01:52:38'),
	(243, 11, 20276, 'Jahedul Islam', 1, 0, 'L', 1, 0, 2, 1, NULL, NULL, '2025-10-08 01:48:43', '2025-10-13 01:51:55'),
	(244, 42, 40276, 'Jahedul Islam - Profit', 1, 0, 'E', 1, 0, 2, 1, NULL, NULL, '2025-10-08 01:48:43', '2025-10-13 01:51:55'),
	(245, 11, 20277, 'Md. Mahiuddin Sohel', 1, 0, 'L', 1, 0, 2, 1, NULL, NULL, '2025-10-08 01:49:30', '2025-10-13 01:51:34'),
	(246, 42, 40277, 'Md. Mahiuddin Sohel - Profit', 1, 0, 'E', 1, 0, 2, 1, NULL, NULL, '2025-10-08 01:49:30', '2025-10-13 01:51:34'),
	(247, 11, 20278, 'Gulam Mawla Chowdhury', 1, 0, 'L', 1, 0, 2, 1, NULL, NULL, '2025-10-08 01:50:48', '2025-10-13 01:51:20'),
	(248, 42, 40278, 'Gulam Mawla Chowdhury - Profit', 1, 0, 'E', 1, 0, 2, 1, NULL, NULL, '2025-10-08 01:50:48', '2025-10-13 01:51:21'),
	(249, 11, 20279, 'Mohammad Zahirul Islam', 1, 0, 'L', 1, 0, 2, 1, NULL, NULL, '2025-10-08 01:51:43', '2025-10-13 01:51:16'),
	(250, 42, 40279, 'Mohammad Zahirul Islam - Profit', 1, 0, 'E', 1, 0, 2, 1, NULL, NULL, '2025-10-08 01:51:43', '2025-10-13 01:51:16'),
	(251, 11, 20280, 'Asif Zaman', 1, 0, 'L', 1, 0, 2, 1, NULL, NULL, '2025-10-08 01:53:07', '2025-10-13 01:52:34'),
	(252, 42, 40280, 'Asif Zaman - Profit', 1, 0, 'E', 1, 0, 2, 1, NULL, NULL, '2025-10-08 01:53:07', '2025-10-13 01:52:34'),
	(253, 10, 20101, 'Green Auto House', 1, 0, 'L', 1, 1, 1, 1, NULL, NULL, '2025-10-11 23:58:40', '2025-10-11 23:58:58'),
	(254, 4, 404, 'Business Expence', 0, 1, 'E', 1, 1, 1, NULL, NULL, NULL, '2025-10-12 03:27:57', '2025-10-12 03:27:57'),
	(255, 254, 40401, 'Product Purchase', 1, 0, 'E', 1, 0, 1, NULL, NULL, NULL, '2025-10-12 03:28:15', '2025-10-12 03:28:15'),
	(257, 85, 40304, 'Miscellaneous Exp.', 1, 0, 'E', 1, 1, 2, NULL, NULL, NULL, '2025-10-20 06:53:11', '2025-10-20 06:53:11'),
	(258, 85, 40305, 'Vendor Commission', 1, 0, 'E', 1, 1, 2, NULL, NULL, NULL, '2025-10-20 06:58:11', '2025-10-20 06:58:11'),
	(259, 85, 40306, 'TA/DA', 1, 0, 'E', 1, 1, 2, NULL, NULL, NULL, '2025-10-20 06:58:45', '2025-10-20 06:58:45'),
	(260, 85, 40307, 'Salary', 1, 0, 'E', 1, 1, 2, NULL, NULL, NULL, '2025-10-20 11:33:51', '2025-10-20 11:33:51'),
	(265, 11, 20281, 'Hilful Alam Ethel', 1, 0, 'L', 1, 0, 1, NULL, NULL, NULL, '2025-11-04 03:45:15', '2025-11-04 03:45:15'),
	(266, 42, 40281, 'Hilful Alam Ethel - Profit', 1, 0, 'E', 1, 0, 1, NULL, NULL, NULL, '2025-11-04 03:45:15', '2025-11-04 03:45:15'),
	(267, 11, 20282, 'Md: Emarat Mridha', 1, 0, 'L', 1, 0, 1, NULL, NULL, NULL, '2025-11-04 03:45:38', '2025-11-04 03:45:38'),
	(268, 42, 40282, 'Md: Emarat Mridha - Profit', 1, 0, 'E', 1, 0, 1, NULL, NULL, NULL, '2025-11-04 03:45:38', '2025-11-04 03:45:38'),
	(269, 10, 20102, 'test', 1, 0, 'L', 1, 1, 1, NULL, NULL, NULL, '2025-11-09 06:26:29', '2025-11-09 06:26:29'),
	(270, 4, 405, 'Food Cost', 0, 0, 'E', 1, 1, 1, NULL, NULL, NULL, '2026-02-22 21:25:25', '2026-02-22 21:25:25'),
	(271, 4, 9, 'Asif', 1, 0, 'E', 1, 1, 1, 1, NULL, NULL, '2026-02-22 22:05:15', '2026-02-22 23:14:49'),
	(272, 4, 10, 'Arif', 1, 0, 'E', 1, 1, 38, NULL, NULL, NULL, '2026-02-23 21:55:44', '2026-02-23 21:55:44');

-- Dumping structure for table golden_ratio.collections
DROP TABLE IF EXISTS `collections`;
CREATE TABLE IF NOT EXISTS `collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `coa_id` bigint unsigned DEFAULT NULL,
  `sales_id` bigint unsigned DEFAULT NULL,
  `sales_return_id` bigint unsigned DEFAULT NULL,
  `payment_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `payment_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collections_payment_no_unique` (`payment_no`),
  KEY `collections_client_id_foreign` (`client_id`),
  KEY `collections_coa_id_foreign` (`coa_id`),
  KEY `collections_sales_id_foreign` (`sales_id`),
  KEY `collections_sales_return_id_foreign` (`sales_return_id`),
  KEY `collections_created_by_foreign` (`created_by`),
  KEY `collections_updated_by_foreign` (`updated_by`),
  KEY `collections_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.collections: ~7 rows (approximately)
DELETE FROM `collections`;
INSERT INTO `collections` (`id`, `client_id`, `coa_id`, `sales_id`, `sales_return_id`, `payment_no`, `date`, `payment_type`, `collection_type`, `amount`, `remarks`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 262, 5, NULL, 'CC2602001', '2026-02-22', 'Cash', 'Payment', 22.00, 'Cash Sales', 1, NULL, NULL, NULL, '2026-02-22 00:06:16', '2026-02-22 00:06:16'),
	(2, 1, 13, NULL, NULL, 'CC2602002', '2026-02-23', 'Cash', 'Payment', 44.00, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:09:50', '2026-02-22 21:09:50'),
	(3, 8, 26, NULL, NULL, 'CC2602003', '2026-02-23', 'Cash', 'Payment', 22.00, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:20:36', '2026-02-22 21:20:36'),
	(4, 3, 26, NULL, NULL, 'CC2602004', '2026-02-23', 'Cash', 'Payment', 22.00, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:36:13', '2026-02-22 21:36:13'),
	(5, 1, 8, 10, NULL, 'CC2602005', '2026-02-23', 'Cash', 'Payment', 90.00, 'Cash Sales', 1, NULL, NULL, NULL, '2026-02-22 21:42:39', '2026-02-22 21:42:39'),
	(6, 1, 26, 11, NULL, 'CC2602006', '2026-02-23', 'Cash', 'Payment', 99.00, 'Cash Sales', 1, NULL, NULL, NULL, '2026-02-22 21:55:16', '2026-02-22 21:55:16'),
	(7, 9, 26, NULL, NULL, 'CC2602007', '2026-02-23', 'Cash', 'Payment', 4.00, NULL, 1, NULL, NULL, NULL, '2026-02-22 22:57:17', '2026-02-22 22:57:17');

-- Dumping structure for table golden_ratio.collection_lists
DROP TABLE IF EXISTS `collection_lists`;
CREATE TABLE IF NOT EXISTS `collection_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` bigint unsigned NOT NULL,
  `sales_id` bigint unsigned NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `collection_lists_collection_id_foreign` (`collection_id`),
  KEY `collection_lists_sales_id_foreign` (`sales_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.collection_lists: ~8 rows (approximately)
DELETE FROM `collection_lists`;
INSERT INTO `collection_lists` (`id`, `collection_id`, `sales_id`, `amount`, `created_at`, `updated_at`) VALUES
	(1, 1, 5, 22.00, '2026-02-22 00:06:16', '2026-02-22 00:06:16'),
	(2, 2, 6, 22.00, '2026-02-22 21:09:51', '2026-02-22 21:09:51'),
	(3, 2, 7, 22.00, '2026-02-22 21:09:51', '2026-02-22 21:09:51'),
	(4, 3, 9, 22.00, '2026-02-22 21:20:36', '2026-02-22 21:20:36'),
	(5, 4, 8, 22.00, '2026-02-22 21:36:13', '2026-02-22 21:36:13'),
	(6, 5, 10, 90.00, '2026-02-22 21:42:39', '2026-02-22 21:42:39'),
	(7, 6, 11, 99.00, '2026-02-22 21:55:16', '2026-02-22 21:55:16'),
	(8, 7, 12, 4.00, '2026-02-22 22:57:17', '2026-02-22 22:57:17');

-- Dumping structure for table golden_ratio.expenses
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE IF NOT EXISTS `expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `coa_id` bigint unsigned NOT NULL,
  `transaction_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `expenses_transaction_no_unique` (`transaction_no`),
  KEY `expenses_coa_id_foreign` (`coa_id`),
  KEY `expenses_created_by_foreign` (`created_by`),
  KEY `expenses_updated_by_foreign` (`updated_by`),
  KEY `expenses_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.expenses: ~8 rows (approximately)
DELETE FROM `expenses`;
INSERT INTO `expenses` (`id`, `coa_id`, `transaction_no`, `date`, `remarks`, `document`, `amount`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 262, 'EXP-2602001', '2026-02-22', '222', NULL, 13.00, 1, 1, NULL, NULL, '2026-02-22 00:44:51', '2026-02-22 00:44:51'),
	(2, 9, 'EXP-2602002', '2026-02-23', NULL, NULL, 25.00, 1, 1, NULL, NULL, '2026-02-22 21:07:33', '2026-02-22 21:07:33'),
	(3, 8, 'EXP-2602003', '2026-02-23', 'Expense', NULL, 14.00, 1, 1, NULL, NULL, '2026-02-22 21:21:46', '2026-02-22 21:21:46'),
	(4, 8, 'EXP-2602004', '2026-02-23', NULL, NULL, 16.00, 1, 1, NULL, NULL, '2026-02-22 21:23:43', '2026-02-22 21:23:43'),
	(5, 8, 'EXP-2602005', '2026-02-23', 'Khabar babod', NULL, 17.00, 1, 1, NULL, NULL, '2026-02-22 21:25:59', '2026-02-22 21:25:59'),
	(6, 8, 'EXP-2602006', '2026-02-23', 'Food babod', NULL, 20.00, 1, 1, NULL, NULL, '2026-02-22 22:06:48', '2026-02-22 22:06:48'),
	(7, 8, 'EXP-2602007', '2026-02-23', 'test exp', NULL, 10.00, 1, 1, NULL, NULL, '2026-02-22 22:19:00', '2026-02-22 22:19:00'),
	(9, 8, 'EXP-2602008', '2026-02-23', NULL, NULL, 7.00, 1, 1, NULL, NULL, '2026-02-22 23:08:36', '2026-02-22 23:08:36');

-- Dumping structure for table golden_ratio.expense_items
DROP TABLE IF EXISTS `expense_items`;
CREATE TABLE IF NOT EXISTS `expense_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `expense_id` bigint unsigned NOT NULL,
  `client_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `coa_id` bigint unsigned NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `is_distributed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_items_expense_id_foreign` (`expense_id`),
  KEY `expense_items_coa_id_foreign` (`coa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.expense_items: ~9 rows (approximately)
DELETE FROM `expense_items`;
INSERT INTO `expense_items` (`id`, `expense_id`, `client_id`, `room_id`, `coa_id`, `amount`, `is_distributed`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, NULL, 254, 13.00, 0, '2026-02-22 00:44:51', '2026-02-22 00:44:51'),
	(2, 2, NULL, NULL, 180, 25.00, 0, '2026-02-22 21:07:33', '2026-02-22 21:07:33'),
	(3, 3, NULL, NULL, 70, 14.00, 0, '2026-02-22 21:21:46', '2026-02-22 21:21:46'),
	(4, 4, NULL, NULL, 94, 16.00, 0, '2026-02-22 21:23:43', '2026-02-22 21:23:43'),
	(5, 5, NULL, NULL, 270, 17.00, 0, '2026-02-22 21:25:59', '2026-02-22 21:25:59'),
	(6, 6, 9, NULL, 271, 20.00, 0, '2026-02-22 22:06:48', '2026-02-22 22:06:48'),
	(7, 7, 9, NULL, 271, 10.00, 0, '2026-02-22 22:19:00', '2026-02-22 22:19:00'),
	(8, 9, 40275, 40275, 242, 2.00, 0, '2026-02-22 23:08:37', '2026-02-22 23:08:37'),
	(9, 9, 9, 9, 271, 5.00, 0, '2026-02-22 23:08:37', '2026-02-22 23:08:37');

-- Dumping structure for table golden_ratio.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table golden_ratio.investors
DROP TABLE IF EXISTS `investors`;
CREATE TABLE IF NOT EXISTS `investors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `coa_id` bigint unsigned DEFAULT NULL,
  `profit_head` bigint(20) unsigned zerofill DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bkash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rocket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nagad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `investors_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.investors: ~4 rows (approximately)
DELETE FROM `investors`;
INSERT INTO `investors` (`id`, `user_id`, `coa_id`, `profit_head`, `name`, `image`, `email`, `phone`, `address`, `nid`, `document`, `bkash`, `rocket`, `nagad`, `bank`, `branch`, `account_name`, `account_no`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 6, 241, 00000000000000000242, 'Investor 1', NULL, NULL, '01997316189', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, '2026-02-19 03:31:37', '2026-02-09 22:23:41', '2026-02-19 03:31:37'),
	(2, 7, 245, 00000000000000000246, 'Wali', NULL, 'w@gmail.com', '01921588567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, '2026-02-19 03:31:58', '2026-02-15 04:26:31', '2026-02-19 03:31:58'),
	(3, 31, 256, 00000000000000000257, 'Wasim', NULL, NULL, '3333668', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, '2026-02-19 03:24:56', '2026-02-19 03:33:46'),
	(4, 32, 258, 00000000000000000259, 'Wali Investor', NULL, NULL, '444444455', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, '2026-02-19 03:32:24', '2026-02-19 03:32:38');

-- Dumping structure for table golden_ratio.investor_payments
DROP TABLE IF EXISTS `investor_payments`;
CREATE TABLE IF NOT EXISTS `investor_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `investor_id` bigint unsigned NOT NULL,
  `payment_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(16,0) NOT NULL,
  `deposit_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bkash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rocket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nagad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint NOT NULL DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `investor_payments_investor_id_foreign` (`investor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.investor_payments: ~0 rows (approximately)
DELETE FROM `investor_payments`;

-- Dumping structure for table golden_ratio.investor_profits
DROP TABLE IF EXISTS `investor_profits`;
CREATE TABLE IF NOT EXISTS `investor_profits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `total_profit` decimal(16,0) NOT NULL,
  `investor_percentage` decimal(16,0) NOT NULL,
  `total_share` int NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `investor_profits_serial_no_unique` (`serial_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.investor_profits: ~0 rows (approximately)
DELETE FROM `investor_profits`;

-- Dumping structure for table golden_ratio.investor_profit_lists
DROP TABLE IF EXISTS `investor_profit_lists`;
CREATE TABLE IF NOT EXISTS `investor_profit_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `investor_profit_id` bigint unsigned NOT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `share_qty` int NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `deposited_amount` decimal(16,0) NOT NULL DEFAULT '0',
  `deposited` tinyint NOT NULL DEFAULT '0',
  `deposit_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `investor_profit_lists_investor_profit_id_foreign` (`investor_profit_id`),
  KEY `investor_profit_lists_investor_id_foreign` (`investor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.investor_profit_lists: ~0 rows (approximately)
DELETE FROM `investor_profit_lists`;

-- Dumping structure for table golden_ratio.invests
DROP TABLE IF EXISTS `invests`;
CREATE TABLE IF NOT EXISTS `invests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `invest_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int DEFAULT NULL,
  `coa_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `qty` int NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `deposit_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bkash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rocket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nagad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `calculate` tinyint(1) NOT NULL DEFAULT '1',
  `approved` tinyint NOT NULL DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `sattled` tinyint NOT NULL DEFAULT '0',
  `coa_setup_id` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invests_investor_id_foreign` (`investor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.invests: ~0 rows (approximately)
DELETE FROM `invests`;
INSERT INTO `invests` (`id`, `company_id`, `investor_id`, `invest_no`, `product_id`, `coa_id`, `date`, `qty`, `amount`, `deposit_type`, `bkash`, `rocket`, `nagad`, `bank_account`, `remarks`, `calculate`, `approved`, `status`, `sattled`, `coa_setup_id`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 0, 3, 'I2602001', 6, 262, '2026-02-22', 12, 120000, '', NULL, NULL, NULL, NULL, NULL, 1, 1, 'Pending', 1, NULL, 1, NULL, NULL, NULL, '2026-02-22 01:10:03', '2026-02-22 01:10:38');

-- Dumping structure for table golden_ratio.invest_months
DROP TABLE IF EXISTS `invest_months`;
CREATE TABLE IF NOT EXISTS `invest_months` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invest_id` bigint unsigned DEFAULT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'renew',
  `date` date DEFAULT NULL,
  `invest_month` date DEFAULT NULL,
  `month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `distributed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invest_months_invest_id_foreign` (`invest_id`),
  KEY `invest_months_investor_id_foreign` (`investor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.invest_months: ~0 rows (approximately)
DELETE FROM `invest_months`;

-- Dumping structure for table golden_ratio.invest_renews
DROP TABLE IF EXISTS `invest_renews`;
CREATE TABLE IF NOT EXISTS `invest_renews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `serial_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.invest_renews: ~0 rows (approximately)
DELETE FROM `invest_renews`;

-- Dumping structure for table golden_ratio.invest_renew_lists
DROP TABLE IF EXISTS `invest_renew_lists`;
CREATE TABLE IF NOT EXISTS `invest_renew_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invest_renew_id` bigint unsigned NOT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `invest_month_id` bigint unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `invest_month` date DEFAULT NULL,
  `month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invest_renew_lists_invest_renew_id_foreign` (`invest_renew_id`),
  KEY `invest_renew_lists_investor_id_foreign` (`investor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.invest_renew_lists: ~0 rows (approximately)
DELETE FROM `invest_renew_lists`;

-- Dumping structure for table golden_ratio.invest_sattlements
DROP TABLE IF EXISTS `invest_sattlements`;
CREATE TABLE IF NOT EXISTS `invest_sattlements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `investor_id` bigint unsigned NOT NULL,
  `coa_id` bigint unsigned NOT NULL,
  `sattlement_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `invest_qty` decimal(16,0) NOT NULL,
  `invest_amount` decimal(16,0) NOT NULL,
  `payment` decimal(16,0) NOT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invest_sattlements_sattlement_no_unique` (`sattlement_no`),
  KEY `invest_sattlements_investor_id_foreign` (`investor_id`),
  KEY `invest_sattlements_coa_id_foreign` (`coa_id`),
  KEY `invest_sattlements_created_by_foreign` (`created_by`),
  KEY `invest_sattlements_updated_by_foreign` (`updated_by`),
  KEY `invest_sattlements_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.invest_sattlements: ~0 rows (approximately)
DELETE FROM `invest_sattlements`;

-- Dumping structure for table golden_ratio.invest_sattlement_lists
DROP TABLE IF EXISTS `invest_sattlement_lists`;
CREATE TABLE IF NOT EXISTS `invest_sattlement_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invest_sattlement_id` bigint unsigned NOT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `invest_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `invest_qty` decimal(16,0) NOT NULL,
  `invest_amount` decimal(16,0) NOT NULL,
  `payment` decimal(16,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invest_sattlement_lists_invest_sattlement_id_foreign` (`invest_sattlement_id`),
  KEY `invest_sattlement_lists_investor_id_foreign` (`investor_id`),
  KEY `invest_sattlement_lists_invest_id_foreign` (`invest_id`),
  KEY `invest_sattlement_lists_product_id_foreign` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.invest_sattlement_lists: ~0 rows (approximately)
DELETE FROM `invest_sattlement_lists`;

-- Dumping structure for table golden_ratio.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.jobs: ~0 rows (approximately)
DELETE FROM `jobs`;

-- Dumping structure for table golden_ratio.job_batches
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.job_batches: ~0 rows (approximately)
DELETE FROM `job_batches`;

-- Dumping structure for table golden_ratio.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.migrations: ~27 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(7, '2026_02_03_114908_create_testimonials_table', 2),
	(8, '2026_02_03_114145_create_rooms_table', 3),
	(9, '2026_02_03_114748_create_bookings_table', 4),
	(11, '2026_02_08_084842_create_categories_table', 5),
	(12, '2023_12_07_101641_create_coa_setups_table', 6),
	(13, '2023_12_10_095150_create_account_transaction_autos_table', 6),
	(14, '2023_12_10_095155_create_account_transactions_table', 6),
	(15, '2024_09_22_145154_create_investors_table', 6),
	(16, '2024_09_22_145251_create_invests_table', 6),
	(17, '2024_09_22_155251_create_invest_months_table', 6),
	(18, '2024_09_22_162233_create_wallets_table', 6),
	(19, '2024_09_22_175429_create_investor_profits_table', 6),
	(20, '2024_09_22_175614_create_investor_profit_lists_table', 6),
	(21, '2024_09_23_095148_create_investor_payments_table', 6),
	(22, '2024_11_06_122025_create_invest_renews_table', 6),
	(23, '2024_11_06_122030_create_invest_renew_lists_table', 6),
	(24, '2024_11_06_190458_create_invest_sattlements_table', 6),
	(25, '2024_11_06_190508_create_invest_sattlement_lists_table', 6),
	(26, '2025_05_07_083259_create_permission_tables', 7),
	(27, '2025_05_07_083431_create_admin_menus_table', 7),
	(28, '2025_05_07_083444_create_admin_menu_actions_table', 7),
	(29, '2025_05_07_084137_create_admin_settings_table', 7),
	(30, '2025_05_07_084409_create_settings_table', 8),
	(31, '2026_02_03_114623_create_services_table', 9);

-- Dumping structure for table golden_ratio.model_has_permissions
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.model_has_permissions: ~0 rows (approximately)
DELETE FROM `model_has_permissions`;

-- Dumping structure for table golden_ratio.model_has_roles
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.model_has_roles: ~23 rows (approximately)
DELETE FROM `model_has_roles`;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(3, 'App\\Models\\User', 4),
	(3, 'App\\Models\\User', 5),
	(3, 'App\\Models\\User', 6),
	(3, 'App\\Models\\User', 7),
	(3, 'App\\Models\\User', 8),
	(3, 'App\\Models\\User', 9),
	(2, 'App\\Models\\User', 10),
	(3, 'App\\Models\\User', 13),
	(3, 'App\\Models\\User', 14),
	(3, 'App\\Models\\User', 15),
	(3, 'App\\Models\\User', 16),
	(3, 'App\\Models\\User', 17),
	(3, 'App\\Models\\User', 18),
	(3, 'App\\Models\\User', 19),
	(3, 'App\\Models\\User', 20),
	(3, 'App\\Models\\User', 21),
	(3, 'App\\Models\\User', 22),
	(3, 'App\\Models\\User', 23),
	(3, 'App\\Models\\User', 24),
	(3, 'App\\Models\\User', 25),
	(3, 'App\\Models\\User', 31),
	(3, 'App\\Models\\User', 32);

-- Dumping structure for table golden_ratio.monthly_profits
DROP TABLE IF EXISTS `monthly_profits`;
CREATE TABLE IF NOT EXISTS `monthly_profits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `invest_qty` decimal(16,0) NOT NULL,
  `invest_amount` decimal(16,0) NOT NULL,
  `income_amount` decimal(16,0) NOT NULL,
  `expense_amount` decimal(16,0) NOT NULL,
  `profit_amount` decimal(16,0) NOT NULL,
  `profit_percentage` decimal(16,0) NOT NULL,
  `public_invest_profit` decimal(16,0) NOT NULL,
  `private_invest_profit` decimal(16,0) NOT NULL,
  `total_invest_profit` decimal(16,0) NOT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `monthly_profits_serial_no_unique` (`serial_no`),
  KEY `monthly_profits_created_by_foreign` (`created_by`),
  KEY `monthly_profits_updated_by_foreign` (`updated_by`),
  KEY `monthly_profits_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.monthly_profits: ~0 rows (approximately)
DELETE FROM `monthly_profits`;
INSERT INTO `monthly_profits` (`id`, `serial_no`, `year`, `month`, `date`, `invest_qty`, `invest_amount`, `income_amount`, `expense_amount`, `profit_amount`, `profit_percentage`, `public_invest_profit`, `private_invest_profit`, `total_invest_profit`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'MP-2511001', 2025, 'October', '2025-10-31', 400, 5000000, 352100, 12204, 339896, 30, 101969, 67979, 169948, 1, 1, NULL, NULL, '2025-11-16 22:29:52', '2025-11-16 22:29:52');

-- Dumping structure for table golden_ratio.monthly_profit_lists
DROP TABLE IF EXISTS `monthly_profit_lists`;
CREATE TABLE IF NOT EXISTS `monthly_profit_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `monthly_profit_id` bigint unsigned NOT NULL,
  `invest_id` bigint unsigned NOT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `invest_qty` decimal(16,0) NOT NULL,
  `invest_amount` decimal(16,0) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `profit_amount` decimal(16,0) NOT NULL,
  `paid_amount` decimal(16,0) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `monthly_profit_lists_monthly_profit_id_foreign` (`monthly_profit_id`),
  KEY `monthly_profit_lists_invest_id_foreign` (`invest_id`),
  KEY `monthly_profit_lists_investor_id_foreign` (`investor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.monthly_profit_lists: ~51 rows (approximately)
DELETE FROM `monthly_profit_lists`;
INSERT INTO `monthly_profit_lists` (`id`, `monthly_profit_id`, `invest_id`, `investor_id`, `invest_qty`, `invest_amount`, `is_private`, `profit_amount`, `paid_amount`, `created_at`, `updated_at`) VALUES
	(1, 1, 5, 3, 3, 37500, 0, 1275, 1275, '2025-11-16 22:29:52', '2025-11-18 00:44:11'),
	(2, 1, 9, 4, 16, 200000, 0, 6798, 6798, '2025-11-16 22:29:52', '2025-11-17 23:13:37'),
	(3, 1, 10, 6, 10, 125000, 0, 4249, 4249, '2025-11-16 22:29:52', '2025-11-18 00:44:48'),
	(4, 1, 11, 38, 1, 12500, 0, 425, 425, '2025-11-16 22:29:52', '2025-11-18 00:48:32'),
	(5, 1, 12, 47, 4, 50000, 0, 1699, 1699, '2025-11-16 22:29:52', '2025-11-17 23:12:37'),
	(6, 1, 13, 51, 8, 100000, 0, 3399, 3399, '2025-11-16 22:29:52', '2025-11-18 00:52:21'),
	(7, 1, 14, 52, 1, 12500, 0, 425, 425, '2025-11-16 22:29:52', '2025-11-18 00:44:24'),
	(8, 1, 15, 53, 4, 50000, 0, 1699, 1699, '2025-11-16 22:29:52', '2025-11-18 00:43:57'),
	(9, 1, 16, 54, 2, 25000, 0, 850, 850, '2025-11-16 22:29:52', '2025-11-17 23:12:59'),
	(10, 1, 17, 5, 20, 250000, 0, 8497, 8497, '2025-11-16 22:29:52', '2025-11-18 00:47:43'),
	(11, 1, 18, 50, 12, 150000, 0, 5098, 5098, '2025-11-16 22:29:52', '2025-11-18 00:44:19'),
	(12, 1, 19, 36, 12, 150000, 0, 5098, 5098, '2025-11-16 22:29:52', '2025-11-18 00:47:19'),
	(13, 1, 20, 23, 4, 50000, 0, 1699, 1699, '2025-11-16 22:29:52', '2025-11-17 23:12:29'),
	(14, 1, 22, 48, 10, 125000, 0, 4249, 4249, '2025-11-16 22:29:52', '2025-11-17 23:12:50'),
	(15, 1, 23, 17, 10, 125000, 0, 4249, 4249, '2025-11-16 22:29:52', '2025-11-18 00:44:57'),
	(16, 1, 24, 41, 4, 50000, 0, 1699, 1699, '2025-11-16 22:29:52', '2025-11-18 00:47:47'),
	(17, 1, 25, 43, 2, 25000, 0, 850, 850, '2025-11-16 22:29:52', '2025-11-18 00:48:37'),
	(18, 1, 26, 40, 1, 12500, 0, 425, 425, '2025-11-16 22:29:52', '2025-11-18 00:47:27'),
	(19, 1, 27, 11, 2, 25000, 0, 850, 850, '2025-11-16 22:29:52', '2025-11-18 00:47:31'),
	(20, 1, 28, 55, 2, 25000, 0, 850, 850, '2025-11-16 22:29:52', '2025-11-18 00:43:53'),
	(21, 1, 29, 13, 5, 62500, 0, 2124, 2124, '2025-11-16 22:29:52', '2025-11-18 00:44:34'),
	(22, 1, 30, 15, 2, 25000, 0, 850, 850, '2025-11-16 22:29:52', '2025-11-17 23:13:25'),
	(23, 1, 32, 56, 2, 25000, 0, 850, 850, '2025-11-16 22:29:52', '2025-11-17 23:13:32'),
	(24, 1, 33, 39, 2, 25000, 0, 850, 850, '2025-11-16 22:29:52', '2025-11-17 23:13:42'),
	(25, 1, 34, 44, 2, 25000, 0, 850, 850, '2025-11-16 22:29:52', '2025-11-18 00:47:06'),
	(26, 1, 35, 57, 3, 37500, 0, 1275, 1275, '2025-11-16 22:29:52', '2025-11-18 00:44:06'),
	(27, 1, 36, 12, 5, 62500, 0, 2124, 2124, '2025-11-16 22:29:52', '2025-11-18 00:44:39'),
	(28, 1, 37, 58, 4, 50000, 0, 1699, 1699, '2025-11-16 22:29:52', '2025-11-18 00:48:27'),
	(29, 1, 38, 59, 2, 25000, 0, 850, 850, '2025-11-16 22:29:52', '2025-11-18 00:48:23'),
	(30, 1, 39, 28, 2, 25000, 0, 850, 850, '2025-11-16 22:29:52', '2025-11-18 00:44:01'),
	(31, 1, 46, 62, 2, 25000, 0, 850, 850, '2025-11-16 22:29:52', '2025-11-18 00:48:43'),
	(32, 1, 47, 49, 16, 200000, 0, 6798, 6798, '2025-11-16 22:29:52', '2025-11-18 00:47:40'),
	(33, 1, 48, 27, 8, 100000, 0, 3399, 3399, '2025-11-16 22:29:52', '2025-11-17 23:13:48'),
	(34, 1, 50, 64, 6, 75000, 0, 2549, 2549, '2025-11-16 22:29:52', '2025-11-17 23:12:22'),
	(35, 1, 51, 65, 8, 100000, 0, 3399, 3399, '2025-11-16 22:29:52', '2025-11-17 23:13:03'),
	(36, 1, 52, 66, 2, 25000, 0, 850, 850, '2025-11-16 22:29:52', '2025-11-18 00:47:23'),
	(37, 1, 55, 68, 18, 225000, 0, 7648, 7648, '2025-11-16 22:29:52', '2025-11-18 00:47:35'),
	(38, 1, 56, 69, 8, 100000, 0, 3399, 3399, '2025-11-16 22:29:52', '2025-11-17 23:12:17'),
	(39, 1, 57, 70, 5, 62500, 0, 2124, 2124, '2025-11-16 22:29:52', '2025-11-17 23:13:20'),
	(40, 1, 58, 71, 2, 25000, 0, 850, 850, '2025-11-16 22:29:52', '2025-11-18 00:44:28'),
	(41, 1, 60, 73, 8, 100000, 0, 3399, 3399, '2025-11-16 22:29:52', '2025-11-18 00:44:43'),
	(42, 1, 60, 29, 1, 12500, 1, 425, 425, '2025-11-16 22:29:52', '2025-11-17 23:12:26'),
	(43, 1, 60, 8, 24, 300000, 1, 10197, 10197, '2025-11-16 22:29:52', '2025-11-17 23:13:14'),
	(44, 1, 60, 10, 11, 137500, 1, 4674, 4674, '2025-11-16 22:29:52', '2025-11-18 00:45:01'),
	(45, 1, 60, 26, 16, 200000, 1, 6798, 6798, '2025-11-16 22:29:52', '2025-11-18 00:44:52'),
	(46, 1, 60, 60, 12, 150000, 1, 5098, 5098, '2025-11-16 22:29:52', '2025-11-18 00:47:14'),
	(47, 1, 60, 61, 3, 37500, 1, 1275, 1275, '2025-11-16 22:29:52', '2025-11-18 00:47:51'),
	(48, 1, 60, 63, 16, 200000, 1, 6798, 6798, '2025-11-16 22:29:52', '2025-11-18 00:47:10'),
	(49, 1, 60, 45, 61, 762500, 1, 25917, 25917, '2025-11-16 22:29:52', '2025-11-18 00:43:49'),
	(50, 1, 60, 72, 8, 100000, 1, 3399, 3399, '2025-11-16 22:29:52', '2025-11-17 23:13:07'),
	(51, 1, 60, 74, 8, 100000, 1, 3399, 3399, '2025-11-16 22:29:52', '2025-11-17 23:12:42');

-- Dumping structure for table golden_ratio.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.password_reset_tokens: ~0 rows (approximately)
DELETE FROM `password_reset_tokens`;

-- Dumping structure for table golden_ratio.payments
DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `investor_id` bigint unsigned NOT NULL,
  `coa_id` bigint unsigned DEFAULT NULL,
  `payment_type` enum('Advance','Payment','Adjust') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Advance',
  `payment_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_payment_no_unique` (`payment_no`),
  KEY `payments_investor_id_foreign` (`investor_id`),
  KEY `payments_coa_id_foreign` (`coa_id`),
  KEY `payments_created_by_foreign` (`created_by`),
  KEY `payments_updated_by_foreign` (`updated_by`),
  KEY `payments_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.payments: ~2 rows (approximately)
DELETE FROM `payments`;
INSERT INTO `payments` (`id`, `investor_id`, `coa_id`, `payment_type`, `payment_no`, `date`, `amount`, `remarks`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(2, 3, 262, 'Payment', 'IP2602001', '2026-02-22', 1000, NULL, 1, NULL, NULL, NULL, '2026-02-22 01:11:57', '2026-02-22 01:11:57'),
	(3, 3, 262, 'Payment', 'IP2602002', '2026-02-22', 980, NULL, 1, NULL, NULL, NULL, '2026-02-22 01:20:23', '2026-02-22 01:20:23');

-- Dumping structure for table golden_ratio.payment_lists
DROP TABLE IF EXISTS `payment_lists`;
CREATE TABLE IF NOT EXISTS `payment_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` bigint unsigned NOT NULL,
  `distribution_list_id` bigint unsigned NOT NULL,
  `invest_id` bigint unsigned NOT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_lists_payment_id_foreign` (`payment_id`),
  KEY `payment_lists_distribution_list_id_foreign` (`distribution_list_id`),
  KEY `payment_lists_invest_id_foreign` (`invest_id`),
  KEY `payment_lists_investor_id_foreign` (`investor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.payment_lists: ~2 rows (approximately)
DELETE FROM `payment_lists`;
INSERT INTO `payment_lists` (`id`, `payment_id`, `distribution_list_id`, `invest_id`, `investor_id`, `amount`, `created_at`, `updated_at`) VALUES
	(1, 2, 1, 1, 3, 1000, '2026-02-22 01:11:57', '2026-02-22 01:11:57'),
	(2, 3, 1, 1, 3, 980, '2026-02-22 01:20:23', '2026-02-22 01:20:23');

-- Dumping structure for table golden_ratio.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.permissions: ~169 rows (approximately)
DELETE FROM `permissions`;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Dashboard', 'web', '2025-06-17 05:07:50', '2025-06-17 05:07:50'),
	(2, 'Business Setup', 'web', '2025-06-17 05:10:14', '2026-02-23 02:44:01'),
	(3, 'Roles', 'web', '2025-06-17 05:10:36', '2025-06-17 05:10:36'),
	(4, 'Users', 'web', '2025-06-17 05:11:10', '2025-06-17 05:11:10'),
	(5, 'admin.admin-menu.index', 'web', '2025-06-17 05:11:51', '2026-02-23 03:03:08'),
	(6, 'Admin Settings', 'web', '2025-06-17 05:12:59', '2025-06-17 05:12:59'),
	(7, 'Investors', 'web', '2025-06-17 05:13:38', '2025-06-17 05:13:38'),
	(8, 'admin.admin-menu.create', 'web', '2025-06-17 05:30:00', '2025-06-17 05:30:00'),
	(9, 'admin.admin-menu.edit', 'web', '2025-06-17 05:30:15', '2025-06-17 05:30:15'),
	(10, 'admin.admin-menu.destroy', 'web', '2025-06-17 05:30:19', '2025-06-17 05:30:19'),
	(11, 'admin.admin-menu-action.index', 'web', '2025-06-17 05:30:59', '2025-06-17 05:30:59'),
	(12, 'admin.admin-menu-action.create', 'web', '2025-06-17 05:31:06', '2025-06-17 05:31:06'),
	(13, 'admin.admin-menu-action.edit', 'web', '2025-06-17 05:31:15', '2025-06-17 05:31:15'),
	(14, 'admin.admin-menu-action.destroy', 'web', '2025-06-17 05:31:21', '2025-06-17 05:31:21'),
	(15, 'admin.role.create', 'web', '2025-06-17 05:32:05', '2025-06-17 05:32:05'),
	(16, 'admin.role.edit', 'web', '2025-06-17 05:32:09', '2025-06-17 05:32:09'),
	(17, 'admin.role.destroy', 'web', '2025-06-17 05:32:15', '2025-06-17 05:32:15'),
	(18, 'admin.role-permission.edit', 'web', '2025-06-17 05:32:50', '2025-06-17 05:32:50'),
	(19, 'admin.user.create', 'web', '2025-06-17 05:33:17', '2025-06-17 05:33:17'),
	(20, 'admin.user.edit', 'web', '2025-06-17 05:33:20', '2025-06-17 05:33:20'),
	(23, 'admin.investor.create', 'web', '2025-06-17 05:34:17', '2025-06-17 05:34:17'),
	(24, 'admin.investor.edit', 'web', '2025-06-17 05:34:20', '2025-06-17 05:34:20'),
	(25, 'admin.investor.destroy', 'web', '2025-06-17 05:34:27', '2025-06-17 05:34:27'),
	(26, 'admin.investor.trash', 'web', '2025-06-17 05:34:33', '2025-06-17 05:34:33'),
	(27, 'Invest Process', 'web', '2025-06-17 05:37:47', '2025-06-17 05:37:47'),
	(28, 'admin.invest.create', 'web', '2025-06-17 05:38:48', '2025-06-17 05:38:48'),
	(29, 'admin.invest.edit', 'web', '2025-06-17 05:38:52', '2025-06-17 05:38:52'),
	(32, 'Sattlement', 'web', '2025-06-17 05:40:52', '2025-06-17 05:40:52'),
	(33, 'admin.invest-sattlement.create', 'web', '2025-06-17 05:41:09', '2025-06-23 04:19:25'),
	(34, 'admin.invest-sattlement.edit', 'web', '2025-06-17 05:41:13', '2025-06-23 04:19:31'),
	(37, 'General Accounting', 'web', '2025-06-17 05:42:20', '2025-06-17 05:42:20'),
	(38, 'Transaction', 'web', '2025-06-17 05:42:51', '2025-06-17 05:42:51'),
	(39, 'Reports', 'web', '2025-06-17 05:43:04', '2025-06-17 05:43:04'),
	(40, 'Chart of Accounts', 'web', '2025-06-17 05:43:37', '2025-06-17 05:43:37'),
	(41, 'admin.coa.create', 'web', '2025-06-17 05:44:10', '2025-06-17 05:44:10'),
	(42, 'admin.coa.edit', 'web', '2025-06-17 05:44:15', '2025-06-17 05:44:15'),
	(43, 'admin.coa.destroy', 'web', '2025-06-17 05:44:20', '2025-06-17 05:44:20'),
	(44, 'Debit Voucher', 'web', '2025-06-17 05:45:02', '2025-06-17 05:45:02'),
	(45, 'admin.debit-voucher.create', 'web', '2025-06-17 05:45:12', '2025-06-17 05:45:12'),
	(46, 'admin.debit-voucher.edit', 'web', '2025-06-17 05:45:17', '2025-06-17 05:45:17'),
	(49, 'Credit Voucher', 'web', '2025-06-17 05:46:11', '2025-06-17 05:46:11'),
	(50, 'admin.credit-voucher.create', 'web', '2025-06-17 05:46:23', '2025-06-17 05:46:23'),
	(51, 'admin.credit-voucher.edit', 'web', '2025-06-17 05:46:27', '2025-06-17 05:46:27'),
	(54, 'Journal Voucher', 'web', '2025-06-17 05:46:57', '2025-06-17 05:46:57'),
	(55, 'admin.journal-voucher.create', 'web', '2025-06-17 05:47:08', '2025-06-17 05:47:08'),
	(56, 'admin.journal-voucher.edit', 'web', '2025-06-17 05:47:13', '2025-06-17 05:47:13'),
	(59, 'admin.voucher-approve.index', 'web', '2025-06-17 05:48:10', '2025-06-17 05:56:08'),
	(60, 'admin.voucher-approve.show', 'web', '2025-06-17 05:48:51', '2025-06-17 05:48:51'),
	(61, 'admin.voucher-approve.edit', 'web', '2025-06-17 05:49:08', '2025-06-17 05:49:08'),
	(62, 'admin.voucher-refuse.index', 'web', '2025-06-17 05:50:19', '2025-06-17 05:56:21'),
	(63, 'admin.voucher-refuse.show', 'web', '2025-06-17 05:50:44', '2025-06-17 05:50:44'),
	(64, 'admin.voucher-refuse.edit', 'web', '2025-06-17 05:50:49', '2025-06-17 05:50:49'),
	(65, 'admin.automation-approve.index', 'web', '2025-06-17 05:51:28', '2025-06-17 05:56:39'),
	(66, 'admin.automation-approve.show', 'web', '2025-06-17 05:51:41', '2025-06-17 05:51:41'),
	(67, 'admin.automation-approve.edit', 'web', '2025-06-17 05:51:52', '2025-06-17 05:51:52'),
	(71, 'Chart of Accounts 1', 'web', '2025-06-17 06:02:09', '2025-06-17 06:02:09'),
	(72, 'Daily Voucher List', 'web', '2025-06-17 06:02:32', '2025-06-17 06:02:32'),
	(73, 'Daily Cash Book', 'web', '2025-06-17 06:03:05', '2025-06-17 06:03:05'),
	(74, 'Bank Book', 'web', '2025-06-17 06:03:16', '2025-06-17 06:03:16'),
	(75, 'Transaction Ledger', 'web', '2025-06-17 06:03:36', '2025-06-17 06:03:36'),
	(76, 'General Ledger', 'web', '2025-06-17 06:03:52', '2025-06-17 06:03:52'),
	(77, 'Cash Flow Statement', 'web', '2025-06-17 06:04:23', '2025-06-17 06:04:23'),
	(79, 'Income Statement', 'web', '2025-06-17 06:04:58', '2025-06-17 06:04:58'),
	(81, 'admin.debit-voucher.show', 'web', '2025-06-18 04:03:34', '2025-06-18 04:03:34'),
	(82, 'admin.debit-voucher.print', 'web', '2025-06-18 04:03:38', '2025-06-18 04:03:38'),
	(83, 'admin.debit-voucher.destroy', 'web', '2025-06-18 04:03:43', '2025-06-18 04:03:43'),
	(84, 'admin.debit-voucher.trash', 'web', '2025-06-18 04:03:47', '2025-06-18 04:03:47'),
	(85, 'admin.credit-voucher.show', 'web', '2025-06-18 22:26:47', '2025-06-18 22:26:47'),
	(86, 'admin.credit-voucher.print', 'web', '2025-06-18 22:26:51', '2025-06-18 22:26:51'),
	(87, 'admin.credit-voucher.destroy', 'web', '2025-06-18 22:26:59', '2025-06-18 22:26:59'),
	(88, 'admin.credit-voucher.trash', 'web', '2025-06-18 22:27:02', '2025-06-18 22:27:02'),
	(90, 'admin.invest.destroy', 'web', '2025-06-19 08:47:54', '2025-06-19 08:47:54'),
	(91, 'admin.invest.trash', 'web', '2025-06-19 08:47:58', '2025-06-19 08:47:58'),
	(100, 'admin.settings.index', 'web', '2025-06-22 08:35:45', '2026-02-18 03:59:59'),
	(101, 'admin.product.create', 'web', '2025-06-22 08:36:30', '2025-07-13 02:14:48'),
	(102, 'admin.product.edit', 'web', '2025-06-22 08:36:33', '2025-07-13 02:14:53'),
	(127, 'admin.invest-sattlement.show', 'web', '2025-06-23 04:19:47', '2025-06-23 04:19:47'),
	(128, 'admin.invest-sattlement.destroy', 'web', '2025-06-23 04:19:56', '2025-06-23 04:19:56'),
	(129, 'admin.invest-sattlement.trash', 'web', '2025-06-23 04:20:01', '2025-06-23 04:20:01'),
	(130, 'admin.user.password', 'web', '2025-06-23 22:35:11', '2025-06-23 22:35:11'),
	(131, 'admin.user.destroy', 'web', '2025-06-23 22:35:16', '2025-06-23 22:35:16'),
	(132, 'admin.user.trash', 'web', '2025-06-23 22:35:21', '2025-06-23 22:35:21'),
	(135, 'admin.product-edition.index', 'web', '2025-07-16 22:24:15', '2025-07-17 06:25:16'),
	(139, 'Productions', 'web', '2025-07-17 04:01:15', '2025-07-17 04:01:15'),
	(142, 'admin.product-edition.store', 'web', '2025-07-17 06:27:56', '2025-07-17 06:29:13'),
	(143, 'admin.product-edition.edit', 'web', '2025-07-17 06:28:06', '2025-07-17 06:28:06'),
	(144, 'admin.product-edition.destroy', 'web', '2025-07-17 06:28:19', '2025-07-17 06:28:19'),
	(145, 'admin.product.destroy', 'web', '2025-07-17 06:28:23', '2025-07-17 06:28:23'),
	(146, 'admin.product.trash', 'web', '2025-07-17 06:28:28', '2025-07-17 06:28:28'),
	(147, 'admin.production.create', 'web', '2025-07-18 22:28:23', '2025-07-18 22:28:23'),
	(148, 'admin.production.edit', 'web', '2025-07-18 22:28:27', '2025-07-18 22:28:27'),
	(149, 'admin.production.show', 'web', '2025-07-18 22:28:33', '2025-07-18 22:28:33'),
	(152, 'admin.production.print', 'web', '2025-07-19 04:38:54', '2025-07-19 04:38:54'),
	(153, 'admin.production.destroy', 'web', '2025-07-19 04:38:59', '2025-07-19 04:38:59'),
	(154, 'admin.production.trash', 'web', '2025-07-19 04:39:06', '2025-07-19 04:39:06'),
	(156, 'admin.client.index', 'web', '2025-07-19 04:49:14', '2026-02-17 04:10:30'),
	(157, 'Sales 1', 'web', '2025-07-19 04:49:37', '2025-07-19 04:49:37'),
	(158, 'admin.client.create', 'web', '2025-07-19 04:49:55', '2025-07-19 04:49:55'),
	(159, 'admin.client.edit', 'web', '2025-07-19 04:50:00', '2025-07-19 04:50:00'),
	(160, 'admin.client.destroy', 'web', '2025-07-19 04:50:07', '2025-07-19 04:50:07'),
	(161, 'admin.client.trash', 'web', '2025-07-19 04:50:11', '2025-07-19 04:50:11'),
	(162, 'admin.sales.create', 'web', '2025-07-19 04:50:26', '2025-07-19 04:50:26'),
	(163, 'admin.sales.edit', 'web', '2025-07-19 04:50:29', '2025-07-19 04:50:29'),
	(164, 'admin.sales.show', 'web', '2025-07-19 04:50:33', '2025-07-20 07:51:18'),
	(166, 'Stock', 'web', '2025-07-19 04:51:17', '2025-07-19 04:51:17'),
	(168, 'Regions', 'web', '2025-07-19 05:14:11', '2025-07-19 05:14:11'),
	(169, 'Area', 'web', '2025-07-19 05:14:30', '2025-07-19 05:14:30'),
	(170, 'Territory', 'web', '2025-07-19 05:14:48', '2025-07-19 05:14:48'),
	(171, 'admin.region.create', 'web', '2025-07-19 06:11:34', '2025-07-19 06:11:34'),
	(172, 'admin.region.edit', 'web', '2025-07-19 06:11:40', '2025-07-19 06:11:40'),
	(173, 'admin.region.destroy', 'web', '2025-07-19 06:11:45', '2025-07-19 06:11:45'),
	(174, 'admin.region.trash', 'web', '2025-07-19 06:11:50', '2025-07-19 06:11:50'),
	(175, 'admin.area.create', 'web', '2025-07-19 06:12:18', '2025-07-19 06:12:18'),
	(176, 'admin.area.edit', 'web', '2025-07-19 06:12:21', '2025-07-19 06:12:21'),
	(177, 'admin.area.destroy', 'web', '2025-07-19 06:12:33', '2025-07-19 06:12:33'),
	(178, 'admin.area.trash', 'web', '2025-07-19 06:12:40', '2025-07-19 06:12:40'),
	(179, 'admin.territory.create', 'web', '2025-07-19 06:12:53', '2025-07-19 06:12:53'),
	(180, 'admin.territory.edit', 'web', '2025-07-19 06:12:56', '2025-07-19 06:12:56'),
	(181, 'admin.territory.destroy', 'web', '2025-07-19 06:13:00', '2025-07-19 06:13:00'),
	(182, 'admin.territory.trash', 'web', '2025-07-19 06:13:06', '2025-07-19 06:13:06'),
	(183, 'Stores', 'web', '2025-07-19 06:14:16', '2025-07-19 06:14:16'),
	(184, 'admin.store.create', 'web', '2025-07-19 06:14:31', '2025-07-19 06:14:31'),
	(185, 'admin.store.edit', 'web', '2025-07-19 06:14:34', '2025-07-19 06:14:34'),
	(186, 'admin.store.destroy', 'web', '2025-07-19 06:14:39', '2025-07-19 06:14:39'),
	(187, 'admin.store.trash', 'web', '2025-07-19 06:14:45', '2025-07-19 06:14:45'),
	(188, 'admin.sales.destroy', 'web', '2025-07-20 07:36:18', '2025-07-20 07:36:18'),
	(189, 'admin.sales.trash', 'web', '2025-07-20 07:36:23', '2025-07-20 07:36:23'),
	(190, 'Collections', 'web', '2025-07-20 07:50:25', '2025-07-20 07:50:25'),
	(191, 'admin.collection.create', 'web', '2025-07-20 07:50:36', '2025-07-20 07:50:36'),
	(192, 'admin.collection.edit', 'web', '2025-07-20 07:50:41', '2025-07-20 07:50:41'),
	(193, 'admin.collection.show', 'web', '2025-07-20 07:50:45', '2025-07-20 07:50:45'),
	(194, 'admin.collection.destroy', 'web', '2025-07-20 07:50:52', '2025-07-20 07:50:52'),
	(195, 'admin.collection.trash', 'web', '2025-07-20 07:50:56', '2025-07-20 07:50:56'),
	(208, 'Profit Distribution', 'web', '2025-07-22 02:47:36', '2025-07-22 02:47:36'),
	(209, 'admin.profit-distribution.create', 'web', '2025-07-22 02:47:59', '2025-07-22 02:47:59'),
	(210, 'admin.profit-distribution.edit', 'web', '2025-07-22 02:48:05', '2025-07-22 02:48:05'),
	(211, 'admin.profit-distribution.show', 'web', '2025-07-22 02:48:09', '2025-07-22 02:48:09'),
	(212, 'admin.profit-distribution.destroy', 'web', '2025-07-22 02:48:16', '2025-07-22 02:48:16'),
	(213, 'admin.profit-distribution.trash', 'web', '2025-07-22 02:48:22', '2025-07-22 02:48:22'),
	(214, 'Investor Payment', 'web', '2025-07-22 06:50:16', '2025-07-22 06:50:16'),
	(215, 'admin.investor-payment.create', 'web', '2025-07-22 06:50:27', '2025-07-22 06:50:27'),
	(216, 'admin.investor-payment.edit', 'web', '2025-07-22 06:50:31', '2025-07-22 06:50:31'),
	(217, 'admin.investor-payment.show', 'web', '2025-07-22 06:50:38', '2025-07-22 06:50:38'),
	(218, 'admin.investor-payment.destroy', 'web', '2025-07-22 06:50:44', '2025-07-22 06:50:44'),
	(219, 'admin.investor-payment.trash', 'web', '2025-07-22 06:50:50', '2025-07-22 06:50:50'),
	(220, 'Investor Statement', 'web', '2025-07-22 22:46:53', '2025-07-22 22:46:53'),
	(221, 'admin.journal-voucher.show', 'web', '2025-08-31 23:33:11', '2025-08-31 23:33:11'),
	(222, 'admin.journal-voucher.print', 'web', '2025-08-31 23:33:17', '2025-08-31 23:33:17'),
	(223, 'admin.journal-voucher.destroy', 'web', '2025-08-31 23:33:21', '2025-08-31 23:33:21'),
	(224, 'admin.journal-voucher.trash', 'web', '2025-08-31 23:34:07', '2025-08-31 23:34:07'),
	(231, 'Room Manage', 'web', '2026-02-09 01:29:43', '2026-02-09 01:29:43'),
	(233, 'Room Type 1', 'web', '2026-02-09 01:41:19', '2026-02-09 01:41:19'),
	(235, 'admin.bookings.index', 'web', '2026-02-09 05:33:01', '2026-02-23 03:15:10'),
	(236, 'admin.services.index', 'web', '2026-02-09 22:13:17', '2026-02-23 03:17:35'),
	(237, 'Gallery Manage', 'web', '2026-02-09 22:14:03', '2026-02-09 22:14:03'),
	(238, 'Testimonial Manage', 'web', '2026-02-09 22:14:36', '2026-02-09 22:14:36'),
	(239, 'About Manage', 'web', '2026-02-09 22:15:15', '2026-02-09 22:15:15'),
	(240, 'Expenses', 'web', '2026-02-18 00:45:00', '2026-02-18 00:45:00'),
	(241, 'admin.expense.create', 'web', '2026-02-18 00:53:27', '2026-02-18 00:53:27'),
	(242, 'admin.expense.edit', 'web', '2026-02-18 01:04:00', '2026-02-18 01:04:00'),
	(243, 'admin.expense.show', 'web', '2026-02-18 01:04:26', '2026-02-18 01:04:26'),
	(244, 'Investor Panel', 'web', '2026-02-18 03:44:39', '2026-02-23 02:49:37'),
	(245, 'Website Setup', 'web', '2026-02-18 04:32:09', '2026-02-23 02:47:33'),
	(246, 'Room Type', 'web', '2026-02-23 02:55:42', '2026-02-23 03:18:47'),
	(247, 'Manage Room', 'web', '2026-02-23 02:58:48', '2026-02-23 03:19:30'),
	(248, 'Business Transaction', 'web', '2026-02-23 03:06:35', '2026-02-23 03:06:35'),
	(249, 'Sales Manage 1', 'web', '2026-02-23 03:08:12', '2026-02-23 03:08:12'),
	(250, 'Inventory Manage', 'web', '2026-02-23 03:11:25', '2026-02-23 03:11:25'),
	(251, 'Manage Booking', 'web', '2026-02-23 03:14:24', '2026-02-23 03:19:59');

-- Dumping structure for table golden_ratio.productions
DROP TABLE IF EXISTS `productions`;
CREATE TABLE IF NOT EXISTS `productions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint unsigned NOT NULL,
  `production_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `total_qty` decimal(16,0) NOT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `productions_production_no_unique` (`production_no`),
  KEY `productions_store_id_foreign` (`store_id`),
  KEY `productions_created_by_foreign` (`created_by`),
  KEY `productions_updated_by_foreign` (`updated_by`),
  KEY `productions_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.productions: ~0 rows (approximately)
DELETE FROM `productions`;
INSERT INTO `productions` (`id`, `store_id`, `production_no`, `date`, `total_qty`, `remarks`, `is_approved`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 'PP2602001', '2026-02-22', 4, NULL, 0, 1, NULL, NULL, NULL, '2026-02-21 23:28:35', '2026-02-21 23:28:35');

-- Dumping structure for table golden_ratio.production_lists
DROP TABLE IF EXISTS `production_lists`;
CREATE TABLE IF NOT EXISTS `production_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `production_id` bigint unsigned NOT NULL,
  `store_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `qty` decimal(16,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_lists_production_id_foreign` (`production_id`),
  KEY `production_lists_store_id_foreign` (`store_id`),
  KEY `production_lists_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.production_lists: ~0 rows (approximately)
DELETE FROM `production_lists`;
INSERT INTO `production_lists` (`id`, `production_id`, `store_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 6, 4, '2026-02-21 23:28:35', '2026-02-21 23:28:35');

-- Dumping structure for table golden_ratio.profit_distributions
DROP TABLE IF EXISTS `profit_distributions`;
CREATE TABLE IF NOT EXISTS `profit_distributions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `invest_qty` decimal(16,0) NOT NULL,
  `production_qty` int NOT NULL,
  `sales_qty` int NOT NULL,
  `sales_amount` decimal(12,0) NOT NULL,
  `invest_amount` decimal(16,0) NOT NULL,
  `profit_amount` decimal(16,0) NOT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profit_distributions_serial_no_unique` (`serial_no`),
  KEY `profit_distributions_created_by_foreign` (`created_by`),
  KEY `profit_distributions_updated_by_foreign` (`updated_by`),
  KEY `profit_distributions_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.profit_distributions: ~0 rows (approximately)
DELETE FROM `profit_distributions`;
INSERT INTO `profit_distributions` (`id`, `serial_no`, `year`, `month`, `date`, `product_id`, `invest_qty`, `production_qty`, `sales_qty`, `sales_amount`, `invest_amount`, `profit_amount`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'PD2602001', 2026, 'February', '2026-02-22', 6, 12, 4, 3, 66, 120000, 165, 1, NULL, NULL, NULL, '2026-02-22 01:10:38', '2026-02-22 01:10:38');

-- Dumping structure for table golden_ratio.profit_distribution_lists
DROP TABLE IF EXISTS `profit_distribution_lists`;
CREATE TABLE IF NOT EXISTS `profit_distribution_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `profit_distribution_id` bigint unsigned NOT NULL,
  `invest_id` bigint unsigned NOT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `profit_per_sale` decimal(16,0) NOT NULL,
  `sales_qty` decimal(16,0) DEFAULT NULL,
  `invest_qty` decimal(16,0) NOT NULL,
  `invest_amount` decimal(16,0) NOT NULL,
  `amount` decimal(16,0) NOT NULL,
  `paid_amount` decimal(16,0) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profit_distribution_lists_profit_distribution_id_foreign` (`profit_distribution_id`),
  KEY `profit_distribution_lists_invest_id_foreign` (`invest_id`),
  KEY `profit_distribution_lists_investor_id_foreign` (`investor_id`),
  KEY `profit_distribution_lists_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.profit_distribution_lists: ~0 rows (approximately)
DELETE FROM `profit_distribution_lists`;
INSERT INTO `profit_distribution_lists` (`id`, `profit_distribution_id`, `invest_id`, `investor_id`, `product_id`, `profit_per_sale`, `sales_qty`, `invest_qty`, `invest_amount`, `amount`, `paid_amount`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 3, 6, 55, 3, 12, 120000, 1980, 1980, '2026-02-22 01:10:38', '2026-02-22 01:20:23');

-- Dumping structure for table golden_ratio.regions
DROP TABLE IF EXISTS `regions`;
CREATE TABLE IF NOT EXISTS `regions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `incharge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `regions_code_unique` (`code`),
  KEY `regions_created_by_foreign` (`created_by`),
  KEY `regions_updated_by_foreign` (`updated_by`),
  KEY `regions_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.regions: ~9 rows (approximately)
DELETE FROM `regions`;
INSERT INTO `regions` (`id`, `code`, `name`, `incharge`, `phone`, `email`, `address`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Dhaka', NULL, NULL, NULL, NULL, 1, 1, 10, NULL, NULL, '2025-07-22 03:18:28', '2025-10-26 00:13:07'),
	(2, NULL, 'Barishal', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 23:48:53', '2025-10-25 23:48:53'),
	(3, NULL, 'Khulna', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 23:49:05', '2025-10-25 23:49:05'),
	(4, NULL, 'Mymensingh', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 23:49:32', '2025-10-25 23:49:32'),
	(5, NULL, 'Rajshahi', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 23:49:47', '2025-10-25 23:49:47'),
	(6, NULL, 'Rangpur', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 23:50:31', '2025-10-25 23:50:31'),
	(7, NULL, 'Chattogram', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 23:50:52', '2025-10-25 23:50:52'),
	(8, NULL, 'Sylhet', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-25 23:51:18', '2025-10-25 23:51:18'),
	(9, NULL, 'Region-1', NULL, NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, '2025-10-26 00:18:44', '2025-11-01 01:45:01');

-- Dumping structure for table golden_ratio.reviews
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `rating` tinyint NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_user_id_product_id_unique` (`user_id`,`room_id`) USING BTREE,
  KEY `reviews_product_id_foreign` (`room_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.reviews: ~3 rows (approximately)
DELETE FROM `reviews`;
INSERT INTO `reviews` (`id`, `user_id`, `room_id`, `rating`, `review`, `status`, `created_at`, `updated_at`) VALUES
	(1, 37, 6, 3, 'This room is super', 1, '2026-02-23 21:48:34', '2026-02-23 21:49:29'),
	(2, 38, 6, 4, 'Good', 1, '2026-02-23 21:56:13', '2026-02-23 21:56:13'),
	(3, 38, 8, 4, 'tttt', 1, '2026-02-23 22:04:03', '2026-02-23 22:04:03');

-- Dumping structure for table golden_ratio.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.roles: ~3 rows (approximately)
DELETE FROM `roles`;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Software Admin', 'web', '2025-06-17 05:01:01', '2025-06-17 05:01:01'),
	(2, 'System Admin', 'web', '2025-06-17 06:06:58', '2025-06-17 06:06:58'),
	(3, 'Investor', 'web', '2025-06-19 05:43:06', '2025-06-19 05:43:06');

-- Dumping structure for table golden_ratio.role_has_permissions
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.role_has_permissions: ~298 rows (approximately)
DELETE FROM `role_has_permissions`;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 1),
	(14, 1),
	(15, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(32, 1),
	(33, 1),
	(34, 1),
	(37, 1),
	(38, 1),
	(39, 1),
	(40, 1),
	(41, 1),
	(42, 1),
	(43, 1),
	(44, 1),
	(45, 1),
	(46, 1),
	(49, 1),
	(50, 1),
	(51, 1),
	(54, 1),
	(55, 1),
	(56, 1),
	(59, 1),
	(60, 1),
	(61, 1),
	(62, 1),
	(63, 1),
	(64, 1),
	(65, 1),
	(66, 1),
	(67, 1),
	(71, 1),
	(72, 1),
	(73, 1),
	(74, 1),
	(75, 1),
	(76, 1),
	(77, 1),
	(79, 1),
	(81, 1),
	(82, 1),
	(83, 1),
	(84, 1),
	(85, 1),
	(86, 1),
	(87, 1),
	(88, 1),
	(90, 1),
	(91, 1),
	(100, 1),
	(101, 1),
	(102, 1),
	(127, 1),
	(128, 1),
	(129, 1),
	(130, 1),
	(131, 1),
	(132, 1),
	(135, 1),
	(139, 1),
	(142, 1),
	(143, 1),
	(144, 1),
	(145, 1),
	(146, 1),
	(147, 1),
	(148, 1),
	(149, 1),
	(152, 1),
	(153, 1),
	(154, 1),
	(156, 1),
	(157, 1),
	(158, 1),
	(159, 1),
	(160, 1),
	(161, 1),
	(162, 1),
	(163, 1),
	(164, 1),
	(166, 1),
	(168, 1),
	(169, 1),
	(170, 1),
	(171, 1),
	(172, 1),
	(173, 1),
	(174, 1),
	(175, 1),
	(176, 1),
	(177, 1),
	(178, 1),
	(179, 1),
	(180, 1),
	(181, 1),
	(182, 1),
	(183, 1),
	(184, 1),
	(185, 1),
	(186, 1),
	(187, 1),
	(188, 1),
	(189, 1),
	(190, 1),
	(191, 1),
	(192, 1),
	(193, 1),
	(194, 1),
	(195, 1),
	(208, 1),
	(209, 1),
	(210, 1),
	(211, 1),
	(212, 1),
	(213, 1),
	(214, 1),
	(215, 1),
	(216, 1),
	(217, 1),
	(218, 1),
	(219, 1),
	(220, 1),
	(221, 1),
	(222, 1),
	(223, 1),
	(224, 1),
	(231, 1),
	(233, 1),
	(235, 1),
	(236, 1),
	(237, 1),
	(238, 1),
	(239, 1),
	(240, 1),
	(241, 1),
	(242, 1),
	(243, 1),
	(244, 1),
	(245, 1),
	(246, 1),
	(247, 1),
	(248, 1),
	(249, 1),
	(250, 1),
	(251, 1),
	(1, 2),
	(2, 2),
	(3, 2),
	(6, 2),
	(7, 2),
	(15, 2),
	(16, 2),
	(18, 2),
	(23, 2),
	(24, 2),
	(25, 2),
	(26, 2),
	(27, 2),
	(28, 2),
	(29, 2),
	(32, 2),
	(33, 2),
	(34, 2),
	(37, 2),
	(38, 2),
	(39, 2),
	(40, 2),
	(41, 2),
	(42, 2),
	(43, 2),
	(44, 2),
	(45, 2),
	(46, 2),
	(49, 2),
	(50, 2),
	(51, 2),
	(54, 2),
	(55, 2),
	(56, 2),
	(59, 2),
	(60, 2),
	(61, 2),
	(62, 2),
	(63, 2),
	(64, 2),
	(65, 2),
	(66, 2),
	(67, 2),
	(71, 2),
	(72, 2),
	(73, 2),
	(74, 2),
	(75, 2),
	(76, 2),
	(77, 2),
	(79, 2),
	(81, 2),
	(82, 2),
	(83, 2),
	(84, 2),
	(85, 2),
	(86, 2),
	(87, 2),
	(88, 2),
	(90, 2),
	(91, 2),
	(100, 2),
	(101, 2),
	(102, 2),
	(127, 2),
	(128, 2),
	(129, 2),
	(135, 2),
	(142, 2),
	(143, 2),
	(144, 2),
	(145, 2),
	(146, 2),
	(156, 2),
	(157, 2),
	(158, 2),
	(159, 2),
	(160, 2),
	(161, 2),
	(162, 2),
	(163, 2),
	(164, 2),
	(168, 2),
	(169, 2),
	(170, 2),
	(171, 2),
	(172, 2),
	(173, 2),
	(174, 2),
	(175, 2),
	(176, 2),
	(177, 2),
	(178, 2),
	(179, 2),
	(180, 2),
	(181, 2),
	(182, 2),
	(183, 2),
	(184, 2),
	(185, 2),
	(186, 2),
	(187, 2),
	(188, 2),
	(189, 2),
	(190, 2),
	(191, 2),
	(192, 2),
	(193, 2),
	(194, 2),
	(195, 2),
	(208, 2),
	(209, 2),
	(210, 2),
	(211, 2),
	(212, 2),
	(213, 2),
	(214, 2),
	(215, 2),
	(216, 2),
	(217, 2),
	(218, 2),
	(219, 2),
	(220, 2),
	(221, 2),
	(222, 2),
	(223, 2),
	(224, 2),
	(1, 3),
	(220, 3);

-- Dumping structure for table golden_ratio.rooms
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `profit` double DEFAULT '0',
  `required_share` double DEFAULT '0',
  `show_dashboard` int DEFAULT '1',
  `serial` int DEFAULT '1',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT '1',
  `capacity` int NOT NULL,
  `available` int NOT NULL DEFAULT '8',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rooms_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.rooms: ~9 rows (approximately)
DELETE FROM `rooms`;
INSERT INTO `rooms` (`id`, `name`, `category_id`, `description`, `price`, `profit`, `required_share`, `show_dashboard`, `serial`, `code`, `status`, `capacity`, `available`, `image`, `image2`, `image3`, `image4`, `meta_title`, `meta_description`, `meta_keywords`, `meta_image`, `slug`, `created_at`, `updated_at`) VALUES
	(2, 'Double Deluxe Room SingleTest1', 1, 'Double Deluxe Room', 22.00, 5, 1, 1, 1, NULL, 1, 8, 0, 'rooms/gKQZ9ERAkiJBua6520o88AgSJrTPvCwZfnYHCKk6.jpg', 'rooms/VryKQgMJ4d3dqJCwyND3wn5rZ8C2uGAgSlFOGhAG.jpg', 'rooms/eZ2bj1wfI9C7jYOUtLe9vLwWKs5F8MtjwL9Pl2XN.jpg', 'rooms/zK4XnNRRz65cuHZEPHcALdgtdakEm66orYj9P7iV.jpg', 'Double Deluxe Room', 'Double Deluxe Room', 'Double Deluxe Room', 'rooms/seo/xlzCxMZis93zTeaqXatfgSi692N3Ex8t4YTUrn3b.jpg', 'double-deluxe-room-singletest1', '2026-02-04 23:55:23', '2026-02-19 02:17:57'),
	(6, 'AM-01-02', 3, 'Single Deluxe Room', 22.00, 55, 1, 1, 1, NULL, 1, 4, 0, 'rooms/jQGC8Up2uQcdsQ485hBHMkwsoFyOR39UkVDE6w7m.jpg', 'rooms/krenxliAQiLbzNdcV6UumxYxqiBOMpSWWOknmxq6.jpg', 'rooms/oGuw0H6HvzCur4VbL3VE2v7mBMcWQLbE14qz4dmU.jpg', 'rooms/brsXiCzeWmd3loFgcAmGG0ArOw7cGVHhsUem4Lvp.jpg', 'Single Deluxe Room', 'Single Deluxe Room', 'Single Deluxe Room', 'rooms/seo/TK8eBehnfFPqOyHtdVbt8XtKfgt5CSJmP9llaX1L.jpg', 'am-01-02', '2026-02-05 00:35:14', '2026-02-22 02:50:26'),
	(8, 'Honeymoon Suit', 2, 'Honeymoon Suit', 44.00, 5, 1, 1, 1, NULL, 1, 4, 2, 'rooms/qJzeXPi69vZw9FmhXtQuMScHPbowl0t03SP12qin.jpg', NULL, NULL, NULL, 'Honeymoon Suit', 'Honeymoon Suit', 'Honeymoon Suit', 'rooms/seo/UR956rfk7fScdUPPuoLHdAB5Qw15asy3kGuPQtwu.jpg', 'honeymoon-suit', '2026-02-05 05:59:41', '2026-02-23 00:38:48'),
	(9, 'Economy Double', 4, 'Economy Double', 45.00, 5, 1, 1, 1, NULL, 1, 4, 2, 'rooms/3KWBC1gjw6q4QEdBYiplMhRynxBVrUpley90z050.jpg', NULL, NULL, NULL, 'Economy Double', 'Economy Double', 'Economy Double', 'rooms/seo/sqSsbp08Msx83HSBx2colnxug0tKawEsdQpLhWMw.jpg', 'economy-double', '2026-02-05 06:00:59', '2026-02-22 21:42:39'),
	(10, 'Economy Double Classic', 2, 'Economy Double Classic', 44.00, 6, 1, 1, 1, NULL, 1, 8, 7, 'rooms/pKEohB8fOkFqhl9n0ubdGVYNSYPH2xqQYNIMIuuK.jpg', NULL, NULL, NULL, 'Economy Double Classic', 'Economy Double Classic', NULL, 'rooms/seo/6XXxiC1a9l3UrstTjRxPyCm8gyCFTAvi9212o8q2.jpg', 'economy-double-classic', '2026-02-05 06:01:57', '2026-02-22 22:08:02'),
	(11, 'Economy Double Classic2', 2, 'Economy Double Classic', 33.00, 7, 1, 1, 1, NULL, 1, 8, 3, 'rooms/K1RVpYBMz2jCCudYVxFg5g3fAJWp7xN1fVJNmueR.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'economy-double-classic2', '2026-02-05 06:02:32', '2026-02-22 23:34:56'),
	(12, 'tes', 2, 'asdsa', 22.00, 8, 1, 1, 1, NULL, 1, 8, 8, 'rooms/paLEZRVGbv84UIJTcWRh7xBrjuCWxcGQvDOr644I.jpg', 'rooms/HB3wxWuY4uqS8zGp21FB8TA9fwxmC78bp090i2DP.jpg', 'rooms/qDNH5X6YSTT1jAfwR9Gcnpn1kJSryt5FPBUmsmaV.jpg', 'rooms/e69trXFTaxhrezIeJlfvCmwSeYnjaBFVD4IIXkIo.jpg', NULL, NULL, NULL, NULL, 'tes', '2026-02-10 00:36:07', '2026-02-10 00:36:07'),
	(13, 'Test2', 3, 'asdsasdad', 66.00, 3, 1, 1, 1, NULL, 1, 4, 4, 'rooms/B91NxjsI4oJNZgQNPPTKaeydUZD2kBVM9vGo6TXQ.jpg', 'rooms/lYR3hlMuqA6AwweoiAQ6jVWXzAijPqulRpJpHIXR.jpg', 'rooms/8tMlYvi6n1iuzdwF2mweMQo9o7czr8u29WG1ORvN.jpg', 'rooms/TSr0a7pNltHQNEsu3bcEWRI8LjW4g85SvJadWxwQ.jpg', NULL, NULL, NULL, NULL, 'test2', '2026-02-10 00:41:56', '2026-02-10 00:41:56'),
	(14, 'tesss', 2, 'sdcsdcds', 44.00, 400, 1, 0, 1, NULL, 1, 4, 4, 'rooms/dy9BMMLUBNbuCRQdT71S7Wh8eqUrxdui5NB9qHwZ.jpg', 'rooms/0fj3AwyAXhfvcz0yYNrJ14VWb1nCWzFDj8saRKPA.jpg', 'rooms/LRoRISW460itk1YzF6qpVRysQiOyBiGoFNsiERQM.jpg', 'rooms/nnXKpEyXde7LN9CY5KOeDAZyZeorvE4C4UCnz4lg.jpg', 'fef', 'eewr', 'ewrrrwr', NULL, 'tesss', '2026-02-19 01:15:35', '2026-02-21 21:28:06');

-- Dumping structure for table golden_ratio.sales
DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  `sales_officer_id` bigint unsigned DEFAULT NULL,
  `coa_id` bigint unsigned DEFAULT NULL,
  `sale_type` enum('Credit','Cash') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Credit',
  `invoice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `net_amount` decimal(16,2) NOT NULL,
  `paid` decimal(16,2) NOT NULL DEFAULT '0.00',
  `return_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `return_paid` decimal(16,2) NOT NULL DEFAULT '0.00',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_invoice_unique` (`invoice`),
  KEY `sales_client_id_foreign` (`client_id`),
  KEY `sales_store_id_foreign` (`store_id`),
  KEY `sales_sales_officer_id_foreign` (`sales_officer_id`),
  KEY `sales_coa_id_foreign` (`coa_id`),
  KEY `sales_created_by_foreign` (`created_by`),
  KEY `sales_updated_by_foreign` (`updated_by`),
  KEY `sales_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.sales: ~9 rows (approximately)
DELETE FROM `sales`;
INSERT INTO `sales` (`id`, `client_id`, `store_id`, `sales_officer_id`, `coa_id`, `sale_type`, `invoice`, `date`, `amount`, `discount`, `net_amount`, `paid`, `return_amount`, `return_paid`, `remarks`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(5, 1, 1, NULL, 3, 'Cash', 'CS2602001', '2026-02-22', 22.00, 0.00, 22.00, 22.00, 0.00, 0.00, NULL, 1, NULL, NULL, NULL, '2026-02-22 00:06:16', '2026-02-22 00:06:16'),
	(6, 1, 1, NULL, 3, 'Credit', 'CS2602002', '2026-02-22', 22.00, 0.00, 22.00, 22.00, 0.00, 0.00, NULL, 1, NULL, NULL, NULL, '2026-02-22 00:17:32', '2026-02-22 21:09:51'),
	(7, 1, 1, NULL, 3, 'Credit', 'CS2602003', '2026-02-22', 22.00, 0.00, 22.00, 22.00, 0.00, 0.00, NULL, 1, NULL, NULL, NULL, '2026-02-22 00:30:06', '2026-02-22 21:09:51'),
	(8, 3, 1, NULL, 3, 'Credit', 'CS2602004', '1970-01-01', 22.00, 0.00, 22.00, 22.00, 0.00, 0.00, 'Booking No # 1', 1, NULL, NULL, NULL, '2026-02-22 02:41:36', '2026-02-22 21:36:13'),
	(9, 8, 1, NULL, 3, 'Credit', 'CS2602005', '1970-01-01', 22.00, 0.00, 22.00, 22.00, 0.00, 0.00, 'Booking No # 2', 1, NULL, NULL, NULL, '2026-02-22 02:50:44', '2026-02-22 21:20:36'),
	(10, 1, 1, NULL, 3, 'Cash', 'CS2602006', '2026-02-23', 90.00, 0.00, 90.00, 90.00, 0.00, 0.00, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:42:39', '2026-02-22 21:42:39'),
	(11, 1, 1, NULL, 3, 'Cash', 'CS2602007', '2026-02-23', 99.00, 0.00, 99.00, 99.00, 0.00, 0.00, NULL, 1, NULL, NULL, NULL, '2026-02-22 21:55:16', '2026-02-22 21:55:16'),
	(12, 9, 1, NULL, 3, 'Credit', 'CS2602008', '2026-02-23', 44.00, 0.00, 44.00, 4.00, 0.00, 0.00, NULL, 1, NULL, NULL, NULL, '2026-02-22 22:08:02', '2026-02-22 22:57:17'),
	(13, 9, 1, NULL, 3, 'Credit', 'CS2602009', '2026-02-23', 66.00, 0.00, 66.00, 0.00, 0.00, 0.00, NULL, 1, NULL, NULL, NULL, '2026-02-22 23:34:56', '2026-02-22 23:34:56');

-- Dumping structure for table golden_ratio.sales_lists
DROP TABLE IF EXISTS `sales_lists`;
CREATE TABLE IF NOT EXISTS `sales_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sales_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `store_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `commission` decimal(16,2) NOT NULL DEFAULT '0.00',
  `commission_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `rate` decimal(16,2) NOT NULL,
  `qty` decimal(16,2) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `net_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `return_qty` decimal(16,2) NOT NULL DEFAULT '0.00',
  `return_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `distributed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_lists_sales_id_foreign` (`sales_id`),
  KEY `sales_lists_client_id_foreign` (`client_id`),
  KEY `sales_lists_store_id_foreign` (`store_id`),
  KEY `sales_lists_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.sales_lists: ~9 rows (approximately)
DELETE FROM `sales_lists`;
INSERT INTO `sales_lists` (`id`, `sales_id`, `client_id`, `store_id`, `product_id`, `price`, `commission`, `commission_amount`, `rate`, `qty`, `amount`, `discount`, `net_amount`, `return_qty`, `return_amount`, `distributed`, `created_at`, `updated_at`) VALUES
	(4, 5, 1, 1, 6, 22.00, 0.00, 0.00, 22.00, 1.00, 22.00, 0.00, 22.00, 0.00, 0.00, 1, '2026-02-22 00:06:16', '2026-02-22 01:10:38'),
	(5, 6, 1, 1, 6, 22.00, 0.00, 0.00, 22.00, 1.00, 22.00, 0.00, 22.00, 0.00, 0.00, 1, '2026-02-22 00:17:32', '2026-02-22 01:10:38'),
	(6, 7, 1, 1, 6, 22.00, 0.00, 0.00, 22.00, 1.00, 22.00, 0.00, 22.00, 0.00, 0.00, 1, '2026-02-22 00:30:06', '2026-02-22 01:10:38'),
	(7, 8, 3, 1, 6, 22.00, 0.00, 0.00, 22.00, 1.00, 22.00, 0.00, 22.00, 0.00, 0.00, 0, '2026-02-22 02:41:36', '2026-02-22 02:41:36'),
	(8, 9, 8, 1, 6, 22.00, 0.00, 0.00, 22.00, 1.00, 22.00, 0.00, 22.00, 0.00, 0.00, 0, '2026-02-22 02:50:44', '2026-02-22 02:50:44'),
	(9, 10, 1, 1, 9, 45.00, 0.00, 0.00, 45.00, 2.00, 90.00, 0.00, 90.00, 0.00, 0.00, 0, '2026-02-22 21:42:39', '2026-02-22 21:42:39'),
	(10, 11, 1, 1, 11, 33.00, 0.00, 0.00, 33.00, 3.00, 99.00, 0.00, 99.00, 0.00, 0.00, 0, '2026-02-22 21:55:16', '2026-02-22 21:55:16'),
	(11, 12, 9, 1, 10, 44.00, 0.00, 0.00, 44.00, 1.00, 44.00, 0.00, 44.00, 0.00, 0.00, 0, '2026-02-22 22:08:02', '2026-02-22 22:08:02'),
	(12, 13, 9, 1, 11, 33.00, 0.00, 0.00, 33.00, 2.00, 66.00, 0.00, 66.00, 0.00, 0.00, 0, '2026-02-22 23:34:56', '2026-02-22 23:34:56');

-- Dumping structure for table golden_ratio.sales_officers
DROP TABLE IF EXISTS `sales_officers`;
CREATE TABLE IF NOT EXISTS `sales_officers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_officers_code_unique` (`code`),
  KEY `sales_officers_created_by_foreign` (`created_by`),
  KEY `sales_officers_updated_by_foreign` (`updated_by`),
  KEY `sales_officers_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.sales_officers: ~0 rows (approximately)
DELETE FROM `sales_officers`;

-- Dumping structure for table golden_ratio.sales_returns
DROP TABLE IF EXISTS `sales_returns`;
CREATE TABLE IF NOT EXISTS `sales_returns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `store_id` bigint unsigned NOT NULL,
  `return_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_returns_return_no_unique` (`return_no`),
  KEY `sales_returns_client_id_foreign` (`client_id`),
  KEY `sales_returns_store_id_foreign` (`store_id`),
  KEY `sales_returns_created_by_foreign` (`created_by`),
  KEY `sales_returns_updated_by_foreign` (`updated_by`),
  KEY `sales_returns_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.sales_returns: ~0 rows (approximately)
DELETE FROM `sales_returns`;

-- Dumping structure for table golden_ratio.sales_return_lists
DROP TABLE IF EXISTS `sales_return_lists`;
CREATE TABLE IF NOT EXISTS `sales_return_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sales_return_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `store_id` bigint unsigned NOT NULL,
  `sales_id` bigint unsigned NOT NULL,
  `sales_list_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_edition_id` bigint unsigned DEFAULT NULL,
  `rate` decimal(16,2) NOT NULL,
  `qty` decimal(16,2) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_return_lists_sales_return_id_foreign` (`sales_return_id`),
  KEY `sales_return_lists_client_id_foreign` (`client_id`),
  KEY `sales_return_lists_store_id_foreign` (`store_id`),
  KEY `sales_return_lists_sales_id_foreign` (`sales_id`),
  KEY `sales_return_lists_sales_list_id_foreign` (`sales_list_id`),
  KEY `sales_return_lists_product_id_foreign` (`product_id`),
  KEY `sales_return_lists_product_edition_id_foreign` (`product_edition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.sales_return_lists: ~0 rows (approximately)
DELETE FROM `sales_return_lists`;

-- Dumping structure for table golden_ratio.sales_return_payments
DROP TABLE IF EXISTS `sales_return_payments`;
CREATE TABLE IF NOT EXISTS `sales_return_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sales_return_id` bigint unsigned NOT NULL,
  `sales_id` bigint unsigned NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_return_payments_sales_return_id_foreign` (`sales_return_id`),
  KEY `sales_return_payments_sales_id_foreign` (`sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.sales_return_payments: ~0 rows (approximately)
DELETE FROM `sales_return_payments`;

-- Dumping structure for table golden_ratio.services
DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint unsigned DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_room_id_foreign` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.services: ~12 rows (approximately)
DELETE FROM `services`;
INSERT INTO `services` (`id`, `room_id`, `type`, `image`, `name`, `description`, `icon`, `created_at`, `updated_at`) VALUES
	(1, 6, 'menu', 'services/bB0yGNVaqiDg7R8NJGbtYN7qAPHeMI3nla3oyNRc.png', 'Bar', 'ASDASD', 'WWWW', '2026-02-14 22:22:07', '2026-02-14 22:39:42'),
	(3, NULL, 'about', 'services/GngBmtmUUKGSjSHG3Zu55cVocWGib6JBBdJQKOGp.jpg', 'About', 'czczccsdsadasd', 'sdsada', '2026-02-14 23:06:28', '2026-02-15 00:57:03'),
	(4, NULL, 'gallery', 'services/Usm4hF3D8jqe1qVknnDJwoaMA1IOdt8qTy9yAGwX.jpg', 'Test', 'as', 'aas', '2026-02-15 00:05:20', '2026-02-15 00:05:20'),
	(5, NULL, 'menu', 'services/97c29VRdoxwJ2SLA60VBzjYsnxoXCTyEHxnF6Wbd.jpg', 'Gym Facilities', 'descrisasas', '1222', '2026-02-15 00:19:02', '2026-02-15 00:19:02'),
	(6, NULL, 'home', 'services/YJPa01QJBQfAnFQrsBsytMviJHsezWtp5wnIejEI.jpg', 'Restaurant', 'Usage of the Internet is becoming more common due to rapid advancement of technology and power.', 'lnr lnr-dinner', '2026-02-15 00:35:51', '2026-02-15 00:37:11'),
	(7, NULL, 'home', 'services/n2VeLYJCqJDwqJebC0ERblWaBIK2Pcn6hFvfYom8.jpg', 'Sports CLub', 'Usage of the Internet is becoming more common due to rapid advancement of technology and power.', 'lnr lnr-bicycle', '2026-02-15 00:41:56', '2026-02-15 00:41:56'),
	(8, NULL, 'home', 'services/ecdBLguVrPU5LxkfhjfQragqXYkCAw76OdngPJNE.jpg', 'Swimming Pool', 'Usage of the Internet is becoming more common due to rapid advancement of technology and power.\r\nUsage of the Internet is becoming more common due to rapid advancement of technology and power.\r\nUsage of the Internet is becoming more common due to rapid advancement of technology and power.\r\nUsage of the Internet is becoming more common due to rapid advancement of technology and power.\r\nUsage of the Internet is becoming more common due to rapid advancement of technology and power.', 'lnr lnr-shirt', '2026-02-15 00:43:55', '2026-02-15 00:52:09'),
	(9, NULL, 'testimonial', 'services/LF1EWw8PmB5rn6JzHEYdyzUQBJWMb1bqOxVn5Oz2.jpg', 'Mr. Fency Tiger', 'Information is structured data, facts, or knowledge conveyed through communication, observation, or research. It reduces uncertainty, informs decisions, and exists in various forms, including text, signals, or patterns. Information is vital for understanding, often distinguished from raw data by its organization and context.', 'as', '2026-02-15 01:00:50', '2026-02-15 01:00:50'),
	(10, NULL, 'testimonial', 'services/OvU7OxlT87gRcyX6XH2FZf3v25ndhxBdaFdrlDo0.jpg', 'Tailor', 'Information is structured data, facts, or knowledge conveyed through communication, observation, or research. It reduces uncertainty, informs decisions, and exists in various forms, including text, signals, or patterns. Information is vital for understanding, often distinguished from raw data by its organization and context.', NULL, '2026-02-15 01:02:30', '2026-02-15 01:02:30'),
	(11, NULL, 'about', 'services/R9P33SVgwLPxSVcHwolkpS7STSNjjjv2cqzfhlu7.jpg', 'Malway', 'Information is structured data, facts, or knowledge conveyed through communication, observation, or research. It reduces uncertainty, informs decisions, and exists in various forms, including text, signals, or patterns. Information is vital for understanding, often distinguished from raw data by its organization and context.', NULL, '2026-02-15 01:02:58', '2026-02-15 01:02:58'),
	(12, NULL, 'footer_col1', 'services/6erjcbZaFXeRJGjsdYKrW6yPPiguH0YaOCOr9ZqA.jpg', 'Refund Policy', 'asdasdad', NULL, '2026-02-15 01:10:54', '2026-02-15 01:10:54'),
	(13, NULL, 'footer_col2', 'services/k02GqwD4e1e3bvkOuwU8wZ9YIV38W9gwUyvd9bvV.jpg', 'Security', 'sfsfsfd', NULL, '2026-02-15 01:11:34', '2026-02-15 01:11:34');

-- Dumping structure for table golden_ratio.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.sessions: ~8 rows (approximately)
DELETE FROM `sessions`;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('a1an5lUxLs5GND6roTARXktP5QmQojbRxA2OCmcg', 1, '202.83.125.144', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOVc0YUxDbktSUTVzNkdWS0xnTmE5b1RCaG1nVDVwRTViOW9BT2NueSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vYW1hcmhvc3RlbGJkLmNvbS9hZG1pbi9yb29tcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1771835588),
	('DMnIbvAFzGYlpPaq5t4mjzoXcfqlYe6NbJmGEJzl', NULL, '40.77.167.0', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1hDRlV4TmROSElZWnlFMU9tSXZoWkRxN2tGTGtzQTZlSFZESE1HVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9hbWFyaG9zdGVsYmQuY29tL3Jvb20vZGV0YWlscy82Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771837049),
	('HXYhxnxZHlM6zJQjpc4NbUY7CH1nmhJKngkCctEc', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaGhWYzlGbGxpSGVQVnpLQmpFNzRNN1p1alhKeFhhVzhmRkJla3NtZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1771910522),
	('ilyaOwhnVWHj6MFrpI5JSM7f23DWEP5hn4Yqd1Db', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOVJUaGdCS0FkaTJpQUtta2wycHRaMGw1OWZiTWRIaEZLbHB4Uk4xNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wcm9kdWN0aW9uIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1771752201),
	('kHKwnefLjWmkUVYUL4wkH3v00EKM74icgG7skqxU', NULL, '202.83.125.144', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXo1QkgzdDdTR3BYaFdVT29sUUU1Y2FIQXozUlR0MUQ4UjUzTnBtSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vYW1hcmhvc3RlbGJkLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1771835304),
	('RDbcCl89E2sfOLQfXFWB1Jls2TbeOrZF9nUlmxOu', NULL, '103.170.173.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjI0amV2YmpNdVhndkdRQ1BMM01uNDZsZjg2NEl3TEFLMVYwQUpMcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9hbWFyaG9zdGVsYmQuY29tL2Jvb2tpbmcvcm9vbS82Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1771836228),
	('TDJOfJu5wIXfCnytQn9QExOL0yPZ9pOAfTVSjQKW', 37, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQlBrbjRKSFNUN1oxbWE5ZEtEZDNSUVpnUGlJZVBKeGRpYTYyYXM2eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yb29tL2RldGFpbHMvNiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM3O30=', 1771840128),
	('wmTb1jtTA15SL0T0MwiYCYiP5pdZGzyxxMrILOFI', 1, '202.83.125.144', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQlhwMU5PNEU0VENORHR2SWFnZ3Y4VGR2Ukpld3JyOEY1UDZNS1Q1MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9hbWFyaG9zdGVsYmQuY29tL2FkbWluL2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1771838671);

-- Dumping structure for table golden_ratio.settings
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `banner_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_one_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_one_status` tinyint(1) NOT NULL DEFAULT '1',
  `banner_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_two_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_two_status` tinyint(1) NOT NULL DEFAULT '1',
  `page_heading_bg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `google_map` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_page` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinterest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_api_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `sms_api_key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `sms_api_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `bkash_status` tinyint(1) NOT NULL DEFAULT '1',
  `nagad_status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `settings_chk_1` CHECK (json_valid(`sms_api_url`)),
  CONSTRAINT `settings_chk_2` CHECK (json_valid(`sms_api_key`)),
  CONSTRAINT `settings_chk_3` CHECK (json_valid(`sms_api_id`))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.settings: ~0 rows (approximately)
DELETE FROM `settings`;
INSERT INTO `settings` (`id`, `app_name`, `title`, `primary_phone`, `secondary_phone`, `primary_email`, `secondary_email`, `office_time`, `address`, `description`, `banner_one`, `banner_one_link`, `banner_one_status`, `banner_two`, `banner_two_link`, `banner_two_status`, `page_heading_bg`, `meta_title`, `meta_keyword`, `meta_description`, `meta_image`, `google_map`, `favicon`, `logo`, `footer_logo`, `placeholder`, `facebook_page`, `facebook_group`, `youtube`, `twitter`, `linkedin`, `google`, `whatsapp`, `instagram`, `pinterest`, `sms_api_url`, `sms_api_key`, `sms_api_id`, `bkash_status`, `nagad_status`, `created_at`, `updated_at`) VALUES
	(1, 'Golden Ratio Beach Resort', 'Golden Ratio Beach Resort', '33333', '33333', 'resort@goldenratio.com', 'resort@goldenratio.com', NULL, 'dsad', 'dsaddas', NULL, NULL, 1, NULL, NULL, 1, NULL, 'dasd', 'sads', 'dsad', NULL, NULL, 'storage/settings/2026-02-24-h4FrnrxwoXtuIFyAfY9owfMutbYKpsic0KAKW7pH.webp', 'storage/settings/2026-02-24-NXWUdmQEdeN32dln9APyj4Q0tb91uXrwjCxyEnMZ.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2026-02-09 02:27:22', '2026-02-23 23:02:43');

-- Dumping structure for table golden_ratio.stores
DROP TABLE IF EXISTS `stores`;
CREATE TABLE IF NOT EXISTS `stores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stores_code_unique` (`code`),
  KEY `stores_created_by_foreign` (`created_by`),
  KEY `stores_updated_by_foreign` (`updated_by`),
  KEY `stores_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.stores: ~0 rows (approximately)
DELETE FROM `stores`;
INSERT INTO `stores` (`id`, `code`, `type`, `name`, `address`, `remarks`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Product Stock,Damage Stock', 'Main Store', NULL, NULL, 1, 1, NULL, NULL, NULL, '2025-07-22 03:19:10', '2025-07-22 03:19:10');

-- Dumping structure for table golden_ratio.territories
DROP TABLE IF EXISTS `territories`;
CREATE TABLE IF NOT EXISTS `territories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `region_id` bigint unsigned NOT NULL,
  `area_id` bigint unsigned NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `incharge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `territories_code_unique` (`code`),
  KEY `territories_region_id_foreign` (`region_id`),
  KEY `territories_area_id_foreign` (`area_id`),
  KEY `territories_created_by_foreign` (`created_by`),
  KEY `territories_updated_by_foreign` (`updated_by`),
  KEY `territories_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.territories: ~54 rows (approximately)
DELETE FROM `territories`;
INSERT INTO `territories` (`id`, `region_id`, `area_id`, `code`, `name`, `incharge`, `phone`, `email`, `address`, `status`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 9, 14, NULL, 'Territory 1', NULL, NULL, NULL, NULL, 1, 1, 10, NULL, NULL, '2025-07-22 03:18:54', '2025-10-26 00:19:55'),
	(2, 5, 15, NULL, 'Territory-1', NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-10-26 00:31:40', '2025-10-26 00:32:46'),
	(3, 7, 18, NULL, 'Area-1', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-10-26 01:14:11', '2025-10-26 01:13:55', '2025-10-26 01:14:11'),
	(4, 7, 16, NULL, 'Territory-1', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-26 01:16:06', '2025-10-26 01:16:06'),
	(5, 6, 45, NULL, 'পঞ্চগড়', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-31 22:43:40', '2025-10-31 22:43:40'),
	(6, 6, 45, NULL, 'পঞ্চগড়', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-10-31 22:46:12', '2025-10-31 22:43:41', '2025-10-31 22:46:12'),
	(7, 6, 8, NULL, 'গাইবান্ধা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-31 22:52:14', '2025-10-31 22:52:14'),
	(8, 6, 44, NULL, 'রংপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-31 23:59:02', '2025-10-31 23:59:02'),
	(9, 5, 3, NULL, 'বগুড়া', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-10-31 23:59:48', '2025-10-31 23:59:48'),
	(10, 5, 42, NULL, 'রাজশাহী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:00:04', '2025-11-01 00:00:04'),
	(11, 5, 41, NULL, 'পাবনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:19:37', '2025-11-01 00:19:37'),
	(12, 5, 40, NULL, 'সিরাজগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:20:38', '2025-11-01 00:20:38'),
	(13, 8, 39, NULL, 'সুনামগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:21:55', '2025-11-01 00:21:55'),
	(14, 8, 38, NULL, 'মৌলভীবাজার', NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-11-01 00:24:39', '2025-11-01 00:25:02'),
	(15, 8, 37, NULL, 'হবিগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:25:22', '2025-11-01 00:25:22'),
	(16, 8, 36, NULL, 'সিলেট', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:25:51', '2025-11-01 00:25:51'),
	(17, 7, 35, NULL, 'চাঁদপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:26:10', '2025-11-01 00:26:10'),
	(18, 7, 34, NULL, 'ফেনী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:26:45', '2025-11-01 00:26:45'),
	(19, 7, 32, NULL, 'কুমিল্লা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:26:59', '2025-11-01 00:26:59'),
	(20, 7, 33, NULL, 'চট্টগ্রাম', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:27:40', '2025-11-01 00:27:40'),
	(21, 4, 31, NULL, 'ময়মনসিংহ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:27:58', '2025-11-01 00:27:58'),
	(22, 4, 30, NULL, 'টাঙ্গাইল', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:28:16', '2025-11-01 00:28:16'),
	(23, 4, 29, NULL, 'নেত্রকোনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:28:31', '2025-11-01 00:28:31'),
	(24, 4, 28, NULL, 'জামালপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:28:53', '2025-11-01 00:28:53'),
	(25, 3, 27, NULL, 'নোয়াপাড়া, খুলনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:32:05', '2025-11-01 00:32:05'),
	(26, 3, 26, NULL, 'যশোর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:32:33', '2025-11-01 00:32:33'),
	(27, 2, 25, NULL, 'বরগুনা', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-11-01 01:03:36', '2025-11-01 00:33:35', '2025-11-01 01:03:36'),
	(28, 2, 24, NULL, 'পিরোজপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:34:00', '2025-11-01 00:34:00'),
	(29, 1, 22, NULL, 'নরসিংদী মাধবদী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:34:26', '2025-11-01 00:34:26'),
	(30, 1, 21, NULL, 'মুন্সীগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-11-01 00:35:27', '2025-11-01 01:20:48'),
	(31, 1, 21, NULL, 'মুন্সীগঞ্জ, নারায়ণগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-11-01 00:36:07', '2025-11-01 00:35:27', '2025-11-01 00:36:07'),
	(32, 1, 20, NULL, 'সাভার', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:35:44', '2025-11-01 00:35:44'),
	(33, 5, 13, NULL, 'ঈশ্বরদী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:36:53', '2025-11-01 00:36:53'),
	(34, 5, 13, NULL, 'ঈশ্বরদী', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-11-01 00:37:54', '2025-11-01 00:36:53', '2025-11-01 00:37:54'),
	(35, 5, 12, NULL, 'চাঁপাইনবাবগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:38:33', '2025-11-01 00:38:33'),
	(36, 1, 11, NULL, 'নরসিংদী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:41:07', '2025-11-01 00:41:07'),
	(37, 6, 10, NULL, 'লালমনিরহাট', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:56:07', '2025-11-01 00:56:07'),
	(38, 6, 9, NULL, 'দিনাজপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:56:51', '2025-11-01 00:56:51'),
	(39, 3, 7, NULL, 'কুষ্টিয়া', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:57:35', '2025-11-01 00:57:35'),
	(40, 4, 6, NULL, 'শেরপুর', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:58:05', '2025-11-01 00:58:05'),
	(41, 5, 5, NULL, 'নওগাঁ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 00:58:47', '2025-11-01 00:58:47'),
	(42, 5, 5, NULL, 'নওগাঁ', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-11-01 00:59:41', '2025-11-01 00:58:47', '2025-11-01 00:59:41'),
	(43, 1, 11, NULL, 'নরসিংদী', NULL, NULL, NULL, NULL, 1, 10, NULL, 10, '2025-11-01 01:48:34', '2025-11-01 01:01:40', '2025-11-01 01:48:34'),
	(44, 1, 1, NULL, 'নীলক্ষেত', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:02:07', '2025-11-01 01:02:07'),
	(45, 2, 4, NULL, 'পটুয়াখালী', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:03:03', '2025-11-01 01:03:03'),
	(46, 2, 25, NULL, 'বরগুনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:03:25', '2025-11-01 01:03:25'),
	(47, 1, 23, NULL, 'মাওনা', NULL, NULL, NULL, NULL, 1, 10, 10, NULL, NULL, '2025-11-01 01:04:16', '2025-11-01 01:18:42'),
	(48, 2, 2, NULL, 'ভোলা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:04:56', '2025-11-01 01:04:56'),
	(49, 1, 47, NULL, 'মালিবাগ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:08:56', '2025-11-01 01:08:56'),
	(50, 2, 48, NULL, 'ঝালকাঠি', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:17:20', '2025-11-01 01:17:20'),
	(51, 1, 49, NULL, 'নারায়ণগঞ্জ', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-01 01:20:33', '2025-11-01 01:20:33'),
	(52, 3, 46, NULL, 'খুলনা', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-02 02:42:42', '2025-11-02 02:42:42'),
	(53, 2, 50, NULL, 'বরিশাল', NULL, NULL, NULL, NULL, 1, 10, NULL, NULL, NULL, '2025-11-02 03:06:03', '2025-11-02 03:06:03'),
	(54, 1, 51, NULL, 'ঢাকা দক্ষিণ', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2026-01-24 05:22:03', '2026-01-24 05:22:03');

-- Dumping structure for table golden_ratio.testimonials
DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.testimonials: ~0 rows (approximately)
DELETE FROM `testimonials`;

-- Dumping structure for table golden_ratio.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_status` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `otp` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_expire` datetime DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_name_unique` (`user_name`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_created_by_foreign` (`created_by`),
  KEY `users_updated_by_foreign` (`updated_by`),
  KEY `users_deleted_by_foreign` (`deleted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.users: ~12 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `user_name`, `email`, `phone`, `address`, `image`, `cover_image`, `role_status`, `status`, `email_verified_at`, `otp`, `otp_expire`, `password`, `remember_token`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin', 'wali@gmail.com', '01711111111', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '$2y$12$ZUsjvxfb7txNaFEKaCvFeeMrlJVbVM0Fdmf2c7kOzUeLMkAQJgJ56', NULL, NULL, NULL, NULL, NULL, '2026-02-03 03:19:59', '2026-02-03 03:19:59'),
	(3, 'ww', 'ww', 'wasi@gmail.com', NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '$2y$12$iONyaTWlMDUGzmhgZXQ1Cu4vNkUSlqxVA9YuGlBhrrpXjqo3eUh4m', NULL, NULL, NULL, NULL, NULL, '2026-02-07 23:51:00', '2026-02-07 23:51:00'),
	(6, 'Investor 1', '01997316189', NULL, '01997316189', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '$2y$12$66yI.icak6oOYd/xksn9pOFuzWgmCx3ZhvCqBEfSg5cqePk6gJCcW', 'sNHEHQr0cc1lCqJ2gUQ34mwdGkTwcJIgrC3BwruwerFBuogV8uDZIUKQVR41', 1, NULL, 1, '2026-02-19 03:31:37', '2026-02-09 22:23:41', '2026-02-19 03:31:37'),
	(7, 'Wali', '01921588567', 'w@gmail.com', '01921588567', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '$2y$12$WDaWYQ89vRplC9Do3a2Cd.GHViXk9q0DGVZnI71yU7Zux4/VH3f2O', NULL, 1, NULL, 1, '2026-02-19 03:31:58', '2026-02-15 04:26:31', '2026-02-19 03:31:58'),
	(8, 'TestW', 'testw', 'testw@gmail.com', '011111111111', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '$2y$12$EW0fQXHEV7yr45ED8/GNDO9MmPwSY0tHdkjREZbEupKvWotu1Ws3q', NULL, NULL, NULL, NULL, NULL, '2026-02-18 21:14:46', '2026-02-18 21:14:46'),
	(9, 'Aira', '01222222222', 'aira@gmail.com', '01222222222', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '$2y$12$AUQn2eV3qjGmVpKLDbaNgOa3ETe1xw.GtprEBs9pMrZvSKVEMFovS', NULL, 1, NULL, NULL, NULL, '2026-02-19 02:16:17', '2026-02-19 02:16:17'),
	(31, 'Wasim', '3333668', NULL, '3333668', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '$2y$12$052ZrGk0s5EQ.18H9ImscOUYDhpijQZidZHSV9U0eHmItWTazKEHW', NULL, 1, 1, NULL, NULL, '2026-02-19 03:24:56', '2026-02-19 03:33:46'),
	(32, 'Wali Investor', '444444455', NULL, '444444455', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '$2y$12$7wvINKxWLrhY9uoO1pPqQ.3nKVjFqRHnwQbCiEtXF/xRwDCUS/ZLC', NULL, 1, 1, NULL, NULL, '2026-02-19 03:32:24', '2026-02-19 03:32:38'),
	(35, 'Niloy', 'Niloy', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '$2y$12$GZLj.Oe7/h0usQo04OjP.OzRpNfxFe6JEkVSxsZ4ZaGQmuBLFYMEy', NULL, 1, NULL, NULL, NULL, '2026-02-21 21:57:30', '2026-02-21 21:57:30'),
	(36, 'fiza', 'fiza', 'fija@gmail.com', '11111111111', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '$2y$12$ioHNjS45T..n0h6pSJIniuWQGRU3qaPBZR18Or4Xc3kBxlvdoPJKK', NULL, NULL, NULL, NULL, NULL, '2026-02-22 02:49:24', '2026-02-22 02:49:24'),
	(37, 'Asif', 'Asif', 'asif@gmail.com', '3333', 'DDDDD', 'storage/users/profile/2026-02-23-xBZ17lX0NVhFcvURO37pdbSUYSsage5Mjm1kjl8j.webp', NULL, 0, 1, NULL, NULL, NULL, '$2y$12$V91t8fr29PT2..kaH3DzFeqHA1PFjEAQ8Tdm1f2DQ0uuZJfCoCA6W', NULL, 1, NULL, NULL, NULL, '2026-02-22 22:05:15', '2026-02-23 00:15:32'),
	(38, 'Arif', 'arif', 'arif@gmail.com', '01111999898', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '$2y$12$y8duugHttfqJgCm9r0R38.dUTxdxhiVCfl8TN6CWgbY6.FTFShrzi', NULL, NULL, NULL, NULL, NULL, '2026-02-23 21:55:44', '2026-02-23 21:55:44');

-- Dumping structure for table golden_ratio.wallets
DROP TABLE IF EXISTS `wallets`;
CREATE TABLE IF NOT EXISTS `wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `investor_id` bigint unsigned NOT NULL,
  `invest_id` bigint unsigned DEFAULT NULL,
  `investor_profit_id` bigint unsigned DEFAULT NULL,
  `investor_payment_id` bigint unsigned DEFAULT NULL,
  `sattlement_id` bigint unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount_in` decimal(16,0) NOT NULL DEFAULT '0',
  `amount_out` decimal(16,0) NOT NULL DEFAULT '0',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint NOT NULL DEFAULT '0',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallets_investor_id_foreign` (`investor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table golden_ratio.wallets: ~0 rows (approximately)
DELETE FROM `wallets`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
