-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for sso_client_ecommerce
CREATE DATABASE IF NOT EXISTS `sso_client_ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sso_client_ecommerce`;

-- Dumping structure for table sso_client_ecommerce.failed_jobs
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

-- Dumping data for table sso_client_ecommerce.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table sso_client_ecommerce.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.migrations: ~10 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(11, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
	(12, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
	(13, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
	(14, '2016_06_01_000004_create_oauth_clients_table', 2),
	(15, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
	(16, '2022_08_28_134555_create_sessions_table', 2);

-- Dumping structure for table sso_client_ecommerce.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.oauth_access_tokens: ~18 rows (approximately)
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('0490cf917e304825d68f5aafaff9150b752dc96820e1637e5b105567b7fe976179c31d5baaf047cb', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:49:12', '2023-06-28 20:49:12', '2023-06-30 03:49:12'),
	('05946c88976208f7ba82b22f85f8302685e4564bdc6128a432b556f5a46ccd99fec89cde21fc866d', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:01:40', '2023-06-28 20:01:40', '2023-06-30 03:01:40'),
	('1ffa15907921dd7084c5d3ec1cd3a1916e3981710af8b673e3b10c6b3de59f7397aa0cc35e5a4605', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:10:11', '2023-06-28 20:10:11', '2023-06-30 03:10:11'),
	('244e69cfe98594e8037b84fc4baa568ee285f3b7eadb715f34e885ad8976b940876ed80034fe7d79', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:45:08', '2023-06-28 20:45:08', '2023-06-30 03:45:08'),
	('259c760a60e1d015a1a7b1a12f55c49ee808991553724325af90e07ec3dd1c7399d03298b0c466be', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:40:41', '2023-06-28 20:40:41', '2023-06-30 03:40:41'),
	('2b66e26a5ae70f8c8ded13b7c51b5cf802545e1be9b6a5af7ab09f03bd80e908ecd2c724bae694e4', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:31:03', '2023-06-28 20:31:03', '2023-06-30 03:31:03'),
	('34d0ec56c65018a0b3c2adc386023345975817fcdd1a5a21db88273715657e13465335fc55eef964', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:47:12', '2023-06-28 20:47:12', '2023-06-30 03:47:12'),
	('361c6c6c3bb0ce1afcf1e0e82c3e70be6517e844856e239b9b70ecd530d0eaff779f80ae26bf43b1', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:44:16', '2023-06-28 20:44:16', '2023-06-30 03:44:16'),
	('43baf2de3b381430710ab8bc939d2515cfa7fea5e0d4d3c158500afa8e81649b98b8a35841a95e06', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:09:34', '2023-06-28 20:09:34', '2023-06-30 03:09:34'),
	('50c2a6cacb164729ed7281107cbb345517b24e67a91075c3e7129324c545e0f8c3fd928a8e7e2cbd', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:12:56', '2023-06-28 20:12:56', '2023-06-30 03:12:56'),
	('61991e84d9545c0612039be443f26261f3d1d5157759e5b884f9d1a9f95440455029fa478886c6d0', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:48:26', '2023-06-28 20:48:26', '2023-06-30 03:48:26'),
	('76aa81646635cc0164411aa83098fc8c3492242048f471697afc8de58fbdc22011aa193d40c1349c', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:11:31', '2023-06-28 20:11:31', '2023-06-30 03:11:31'),
	('8fbd4214a56c76c88f4c944cbbaf12b447de0a537b836ad2251bc5cc11cfcdb21d1f34bef2ccc3cb', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:18:20', '2023-06-28 20:18:20', '2023-06-30 03:18:20'),
	('9b94da3643ab2a09dc3fa00d04190f31efc350f35e4593521a6d2ab3db9c490f99036bf378921eca', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:09:07', '2023-06-28 20:09:07', '2023-06-30 03:09:07'),
	('b9ef2e6b5b3c00a97dcc4c3a28036e5a94a46d5269f2a1ee083604694f2162ccb05352cfa1ba2bb4', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:14:25', '2023-06-28 20:14:25', '2023-06-30 03:14:25'),
	('ebb4c1f242fa6a77826ddebf9294556c4b494e779ace6992d647d081327536dc6d30a7ceafd3dfbd', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:47:41', '2023-06-28 20:47:41', '2023-06-30 03:47:41'),
	('f2f625f93619596c5829bbbef904c9812ed184d8c5590cb25d74537353ee18808e7ce3388b0bec25', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:25:48', '2023-06-28 20:25:48', '2023-06-30 03:25:48'),
	('f7f9914d097775c6e71c5409c94c764b348d038cc65ea61d62587cd8d79885435bea00a5e7cc744c', 2, '9985fc81-321d-4005-9349-e58540bfdc36', NULL, '["view-user"]', 0, '2023-06-28 20:45:36', '2023-06-28 20:45:36', '2023-06-30 03:45:36');

-- Dumping structure for table sso_client_ecommerce.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.oauth_auth_codes: ~19 rows (approximately)
INSERT INTO `oauth_auth_codes` (`id`, `user_id`, `client_id`, `scopes`, `revoked`, `expires_at`) VALUES
	('11313c4f89fec5f129c4eb6a02a37300c1b7e6cfb44c46c33b2fa2a1fe6e11a74caebdc7a25ef0f8', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:54:13'),
	('12fd38104dcb3f9be273fb2f242224a9d9e47fd7edb0b0e42e783cbfbcd1e0380d6f6cf83fe045e1', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:55:05'),
	('1813c386f73b15ce4da909f8fcfd9c3277ce7ca73419582759012a38c873dfe71fc5d135104227c0', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:35:45'),
	('3ceac0772da7dda23b199b20fb8b7d77efeca1ec8b541d847f7e67aea65f0cd995ea47a23ea91b17', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:58:24'),
	('47f4d611f2e937ef4a2245031a978a923dcd330c198ceed03eef36930537cf72083ea77d57751e95', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:59:10'),
	('4e6f25eb9110d707399c32026e4dc40ac957c87f6c8e1264603c66fcc25b2ab40d3c556719284d13', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:55:33'),
	('5958fe5c5afe39f2ca24f13338ebb88fc130e78324cf43f0a92735f7f80d1529f5e404b1ce43a45f', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:19:31'),
	('5d67b6ed392ff5cd32ebbb706042517bd4ec970587c7dc79b955d77ac352711fdd6d6ef4a7760236', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:20:09'),
	('705f8fc2ee29feea48c9384b15ca991e77f3939ad0906fd257838125fb6bc45ce76a3e8407922ca9', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:21:28'),
	('74236bfb2be3ab3173e75f7351773325efa32e757f97ff4011021fe5720e526fac67c4366f713c7b', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:57:09'),
	('810e04133a542a5a3d6d878be3ff4b97f8956cc37614d37ff8c7d233a52348bd06e00b2eedf167aa', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:19:05'),
	('95acfb992b54040d0a78d43e3abdbd44cea3e0a9c6ba1d9b4ed25aca95119f752e5490d3e34a6b18', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:24:23'),
	('b5c1b4a8dbde144497318dad92c8216f7060e558b91850829d7487fd89d23d211acc6cd0bf5b4fff', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:50:38'),
	('c34585997ebe094b748bd109d11702bb814d3411d9b3e70992c6887ffa9c942d6d42ed278e51351e', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 0, '2023-06-29 03:18:07'),
	('c89f6992ced006cf4f6605fad02b76b3fc31089d8d544d76f22afc4b02e50128c61f766cb3535132', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:22:53'),
	('ca781f73cba37d29e73a707e76fa5e6ddfafe4284dc154b8f0200d36bc94522de1a3650e9ffc8f31', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:28:17'),
	('d7ecfb32d675a9cbc72cf11ac0fd598c06fb592786d5ad1087e46f7e4335085dcacb0566894baf75', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:57:38'),
	('e0a1cf158d07743269f87e1518baf944cf4bcad8b19f1d356316f897647f5b92c30cd515d349828e', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:11:37'),
	('ebcd46d3f812c394757270f86b90c737f57e870c292360ded259f4d420c53624f07621720f7b2684', 2, '9985fc81-321d-4005-9349-e58540bfdc36', '["view-user"]', 1, '2023-06-29 03:41:01');

-- Dumping structure for table sso_client_ecommerce.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.oauth_clients: ~6 rows (approximately)
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	('9985e5cc-4f4e-4011-b8c7-a7eeffce4fad', NULL, 'OAuth 2.0 SSO Personal Access Client', 'y4Rhz5OWTI7OGWoGsZsO4PxFlFyxABMbgZ4xaDKJ', NULL, 'http://localhost', 1, 0, 0, '2023-06-28 18:54:10', '2023-06-28 18:54:10'),
	('9985e5cc-972d-4ee9-81ea-c623749d5771', NULL, 'OAuth 2.0 SSO Password Grant Client', 'u0ul2OqDrbBjWtcNvjiBeqG7M2pslcutHLrTYmq1', 'users', 'http://localhost', 0, 1, 0, '2023-06-28 18:54:10', '2023-06-28 18:54:10'),
	('9985e681-2058-459e-ab3d-8c68f5d7fea3', 1, 'Test client', 'fvbNBYbzI2evfEWAt5FQhMEQlV8jitXcuWybxiWv', NULL, 'http://127.0.0.2:8080/callback', 0, 0, 0, '2023-06-28 18:56:09', '2023-06-28 18:56:09'),
	('9985eaba-8f40-4802-9c5b-9dbd6ec9ab08', 2, 'test 2', 'OinFhXZDqYucLhzNQrhp8hAoRWF4S4EZ5rkWj7Ki', NULL, 'http://127.0.0.1:8080', 0, 0, 0, '2023-06-28 19:07:58', '2023-06-28 19:07:58'),
	('9985efa2-4446-48b1-8496-b3f2e57576ab', 2, 'test 2 lan 2', 'tbFmy9ACV3c3YHPaiXUscOROI1eDkdR9mlCUDjVq', NULL, 'http:localhost:8080/callback', 0, 0, 0, '2023-06-28 19:21:40', '2023-06-28 19:21:40'),
	('9985fc81-321d-4005-9349-e58540bfdc36', 2, 'test lan 3', 'qwyFfyc6suoxo1nG6wpjhsYzp7aTdq7hqKyzOKy7', NULL, 'http://localhost:8080/callback', 0, 0, 0, '2023-06-28 19:57:40', '2023-06-28 19:57:40');

-- Dumping structure for table sso_client_ecommerce.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.oauth_personal_access_clients: ~0 rows (approximately)
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, '9985e5cc-4f4e-4011-b8c7-a7eeffce4fad', '2023-06-28 18:54:10', '2023-06-28 18:54:10');

-- Dumping structure for table sso_client_ecommerce.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.oauth_refresh_tokens: ~18 rows (approximately)
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
	('01c7088e912c1f192ce6fa91642f479fb4fdfea3654ff29f0b2dda8ced30fbb19f7b2d5fb68244ba', '61991e84d9545c0612039be443f26261f3d1d5157759e5b884f9d1a9f95440455029fa478886c6d0', 0, '2023-07-29 03:48:26'),
	('0baaaa343a33b47a4c646f60ec50a10668e4fb0ed058ab3ce2af80cf6350b731eb807180ad9d13ac', '259c760a60e1d015a1a7b1a12f55c49ee808991553724325af90e07ec3dd1c7399d03298b0c466be', 0, '2023-07-29 03:40:41'),
	('0bc9bc16e169ea82f30ab30f0d7a612d705df6168cf7b242b19a7c8567b181c650a29ebc88066000', '50c2a6cacb164729ed7281107cbb345517b24e67a91075c3e7129324c545e0f8c3fd928a8e7e2cbd', 0, '2023-07-29 03:12:56'),
	('315924caea98eb4ca1346bd21b13a392e7682bafcc84aefdff8fab4bdf68a1255119ebf708567e3f', '0490cf917e304825d68f5aafaff9150b752dc96820e1637e5b105567b7fe976179c31d5baaf047cb', 0, '2023-07-29 03:49:12'),
	('50072c19a355bced249e35e79a7b2ee0fa10aa5bcd0dcfd594f530b9bda24ab24655049f311ee853', '9b94da3643ab2a09dc3fa00d04190f31efc350f35e4593521a6d2ab3db9c490f99036bf378921eca', 0, '2023-07-29 03:09:07'),
	('5760b6acef34c12627356dd87a081f4a7596ef35d7e8ee6de9d8234bba059b593df678b2ac5736df', '05946c88976208f7ba82b22f85f8302685e4564bdc6128a432b556f5a46ccd99fec89cde21fc866d', 0, '2023-07-29 03:01:40'),
	('5d26417216b335955cbbf2d9fb304101b0ace5cccf24e9f31f8a705d612bbdbfc49a59c95dc55750', 'b9ef2e6b5b3c00a97dcc4c3a28036e5a94a46d5269f2a1ee083604694f2162ccb05352cfa1ba2bb4', 0, '2023-07-29 03:14:25'),
	('740d4f3d59dfb744650ffc8965eda5e84f4a73234f4ebd37a690d48ae221d5e4b823e41f46e1cb88', 'ebb4c1f242fa6a77826ddebf9294556c4b494e779ace6992d647d081327536dc6d30a7ceafd3dfbd', 0, '2023-07-29 03:47:41'),
	('7b623407d9fb34798a3e329cca8ec031e2f0b2795754a2ddf908ae3da091826e1eb3e034707b598a', 'f2f625f93619596c5829bbbef904c9812ed184d8c5590cb25d74537353ee18808e7ce3388b0bec25', 0, '2023-07-29 03:25:48'),
	('89d0de6609649103bc7ae501a7ec53f271f7144c2a55b786d93fc678b3807213d54d9814e6cedb25', 'f7f9914d097775c6e71c5409c94c764b348d038cc65ea61d62587cd8d79885435bea00a5e7cc744c', 0, '2023-07-29 03:45:36'),
	('949af602a34dc49d9fbb00aab9aa3a8a6a7f89fdf646a45fbb074adcd0825004489f1f331600a6de', '8fbd4214a56c76c88f4c944cbbaf12b447de0a537b836ad2251bc5cc11cfcdb21d1f34bef2ccc3cb', 0, '2023-07-29 03:18:20'),
	('b74d4dcb45961fea7d38a377a96002e8e7fd53c44194666ea536066f5bc1fa8ace0ef84fccc6235e', '1ffa15907921dd7084c5d3ec1cd3a1916e3981710af8b673e3b10c6b3de59f7397aa0cc35e5a4605', 0, '2023-07-29 03:10:11'),
	('be35f0e57f5e009e5b1b86863835b4fb57b66be7f454e953632efd9d7dbe568fa30c614a8e1f8140', '361c6c6c3bb0ce1afcf1e0e82c3e70be6517e844856e239b9b70ecd530d0eaff779f80ae26bf43b1', 0, '2023-07-29 03:44:16'),
	('c46229b179da3abadc96e49638858e9222da067ae79f0b319a5252dc957ec07ae1efef254985ffc0', '76aa81646635cc0164411aa83098fc8c3492242048f471697afc8de58fbdc22011aa193d40c1349c', 0, '2023-07-29 03:11:31'),
	('cc0456ddb0043dc2e2d7acd76d5837a9bc96271f2c80a2575114fee130862e88c0463ac7899ac396', '43baf2de3b381430710ab8bc939d2515cfa7fea5e0d4d3c158500afa8e81649b98b8a35841a95e06', 0, '2023-07-29 03:09:34'),
	('d18e36b4590b599e43a4709e6ee676f45e1abb2d67f07c86597a825b3b67012e824b9856fb228791', '34d0ec56c65018a0b3c2adc386023345975817fcdd1a5a21db88273715657e13465335fc55eef964', 0, '2023-07-29 03:47:12'),
	('d32daacbcf5384fa2e9e8d7c653d80a03a7859dcd79a20f6d8b76e70958309ad7a85a355e1536f54', '244e69cfe98594e8037b84fc4baa568ee285f3b7eadb715f34e885ad8976b940876ed80034fe7d79', 0, '2023-07-29 03:45:08'),
	('d9a3337276f177d5b0d73bb0982d09a4ea12cb3676ae64d54e20198229dbb4b253b6527a7f305e77', '2b66e26a5ae70f8c8ded13b7c51b5cf802545e1be9b6a5af7ab09f03bd80e908ecd2c724bae694e4', 0, '2023-07-29 03:31:03');

-- Dumping structure for table sso_client_ecommerce.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.password_resets: ~0 rows (approximately)

-- Dumping structure for table sso_client_ecommerce.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table sso_client_ecommerce.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.sessions: ~4 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('6ZPKVUv7WCnOPucVszsXgJrjzXrm2D700l84tGuO', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoic1pXOHF2Z0paOHpPcDZCQkZzMlZEdGFTOUFJb0dTdFZVcDM3WUFYNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI5OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvb2F1dGgvYXV0aG9yaXplP2NsaWVudF9pZD05OTg1ZmM4MS0zMjFkLTQwMDUtOTM0OS1lNTg1NDBiZmRjMzYmcHJvbXB0PTEmcmVkaXJlY3RfdXJpPWh0dHAlM0ElMkYlMkZsb2NhbGhvc3QlM0E4MDgwJTJGY2FsbGJhY2smcmVzcG9uc2VfdHlwZT1jb2RlJnNjb3BlPXZpZXctdXNlciZzdGF0ZT1aWHFoaWZ2bkJZckJnbmluMmJ0c1ZoTG1RUjdnSnJ4QlVwWXJOeG8xIjt9czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNjg4MDA3Njc3O31zOjk6ImF1dGhUb2tlbiI7czoxNjoiRFQyMDczSERIZERoOGh4MCI7czoxMToiYXV0aFJlcXVlc3QiO086NTQ6IkxlYWd1ZVxPQXV0aDJcU2VydmVyXFJlcXVlc3RUeXBlc1xBdXRob3JpemF0aW9uUmVxdWVzdCI6OTp7czoxNDoiACoAZ3JhbnRUeXBlSWQiO3M6MTg6ImF1dGhvcml6YXRpb25fY29kZSI7czo5OiIAKgBjbGllbnQiO086MzA6IkxhcmF2ZWxcUGFzc3BvcnRcQnJpZGdlXENsaWVudCI6NTp7czoxMzoiACoAaWRlbnRpZmllciI7czozNjoiOTk4NWZjODEtMzIxZC00MDA1LTkzNDktZTU4NTQwYmZkYzM2IjtzOjg6InByb3ZpZGVyIjtOO3M6NzoiACoAbmFtZSI7czoxMDoidGVzdCBsYW4gMyI7czoxNDoiACoAcmVkaXJlY3RVcmkiO2E6MTp7aTowO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC9jYWxsYmFjayI7fXM6MTc6IgAqAGlzQ29uZmlkZW50aWFsIjtiOjE7fXM6NzoiACoAdXNlciI7TzoyODoiTGFyYXZlbFxQYXNzcG9ydFxCcmlkZ2VcVXNlciI6MTp7czoxMzoiACoAaWRlbnRpZmllciI7aToyO31zOjk6IgAqAHNjb3BlcyI7YToxOntpOjA7TzoyOToiTGFyYXZlbFxQYXNzcG9ydFxCcmlkZ2VcU2NvcGUiOjE6e3M6MTM6IgAqAGlkZW50aWZpZXIiO3M6OToidmlldy11c2VyIjt9fXM6MjQ6IgAqAGF1dGhvcml6YXRpb25BcHByb3ZlZCI7YjoxO3M6MTQ6IgAqAHJlZGlyZWN0VXJpIjtzOjMwOiJodHRwOi8vbG9jYWxob3N0OjgwODAvY2FsbGJhY2siO3M6ODoiACoAc3RhdGUiO3M6NDA6Ik1oMHRnZHlpTUVkNndVQW55ZW5UNHJVTUtMVU84U1BwS05ZWERHSVMiO3M6MTY6IgAqAGNvZGVDaGFsbGVuZ2UiO047czoyMjoiACoAY29kZUNoYWxsZW5nZU1ldGhvZCI7Tjt9fQ==', 1688008463),
	('BbwY34DypvXQPPk4Ni1mEhFNoUhQvcvrC8vIbxmW', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUUxzOGJqT0hqY3FlT1g0WFMxczMzT1FIaFdBem5LTWpCMkprcGs3WCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIzMjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL29hdXRoL2F1dGhvcml6ZT9jbGllbnRfaWQ9OTk4NWVhYmEtOGY0MC00ODAyLTljNWItOWRiZDZlYzlhYjA4JnByb21wdD0xJnJlZGlyZWN0X3VyaT1odHRwJTNBJTJGJTJGMTI3LjAuMC4xJTNBODA4MCUyRmNhbGxiYWNrJnJlc3BvbnNlX3R5cGU9Y29kZSZzY29wZT12aWV3LXVzZXIlMjAmc3RhdGU9TnEwdjZ2OU14REdCTlhtUXF3b0NQMExpSW1zU0hoTm1YVEVCdkhNSyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNjg4MDA0MjczO319', 1688005016),
	('Ga2U4b4lDsjVBBQJBP8yxzn20T8dLcgKMFhKfH5J', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiNk9Vd2t1TTZleWRoQk1xbXlQaVUwNzZ2a3ZLWVI0dG8xb0pKR1M2WiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIyOToiaHR0cDovL2xvY2FsaG9zdDo4MDAwL29hdXRoL2F1dGhvcml6ZT9jbGllbnRfaWQ9OTk4NWZjODEtMzIxZC00MDA1LTkzNDktZTU4NTQwYmZkYzM2JnByb21wdD0xJnJlZGlyZWN0X3VyaT1odHRwJTNBJTJGJTJGbG9jYWxob3N0JTNBODA4MCUyRmNhbGxiYWNrJnJlc3BvbnNlX3R5cGU9Y29kZSZzY29wZT12aWV3LXVzZXImc3RhdGU9S2pZRnhQRENDTUk5dzVMQ09KM1BjVkhGeFpERmh0NGR6ZmN4dGo3cSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNjg4MDA5MTQzO319', 1688010550),
	('IUCtiElqlaUFwwuczv4VvkBVTT0rwMRn7LCtc0wJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1h6ZzdOa3k5YmlJUVowU1hjRU1XRk1TNXdZeWVMQjQ0V24zM3hlMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fX0=', 1688008871);

-- Dumping structure for table sso_client_ecommerce.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.users: ~4 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin2', 'admin2@gmail.com', NULL, NULL, NULL, '2023-06-28 21:00:09', '2023-06-28 21:00:09'),
	(2, 'hoang', 'admin@gmail.com', NULL, NULL, NULL, '2023-06-28 21:26:27', '2023-06-28 21:26:27'),
	(3, 'hoang5', 'admin5@gmail.com', NULL, NULL, NULL, '2023-06-29 20:15:24', '2023-06-29 20:15:24'),
	(4, 'leader', 'leader@gmail.com', NULL, NULL, NULL, '2023-06-30 01:38:41', '2023-06-30 01:38:41'),
	(5, 'user', 'user@gmail.com', NULL, NULL, NULL, '2023-06-30 02:54:20', '2023-06-30 02:54:20'),
	(6, 'huuhoang.tran@gosu.vn', 'huuhoang.tran@gosu.vn', NULL, NULL, NULL, '2023-06-30 19:46:26', '2023-06-30 19:46:26');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
