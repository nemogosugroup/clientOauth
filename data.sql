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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.migrations: ~10 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(25, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
	(26, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
	(27, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
	(28, '2016_06_01_000004_create_oauth_clients_table', 2),
	(29, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
	(30, '2019_12_14_000001_create_personal_access_tokens_table', 2),
	(31, '2021_07_23_180023_remove_unusable_columns_from_users_table', 2);

-- Dumping structure for table sso_client_ecommerce.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.oauth_access_tokens: ~58 rows (approximately)
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('0396e9a743fda2203367efcc6434e667c61116a2250b1915bd21711fb00a8de04564c9d9648ae1a0', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:51:01', '2023-07-12 19:51:01', '2024-07-13 02:51:01'),
	('067757cb32da7c9c047ef07d14af25d65d5abe977dad468910d96a807e10b77e3c5c28e05da9b545', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:28:47', '2023-07-12 03:28:47', '2024-07-12 10:28:47'),
	('08ccda2b064ecba772fed8185c8f7ddb019695cdd41273b35926ed74dd2698dfab5d7686c0aa1efc', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:38:37', '2023-07-12 19:38:37', '2024-07-13 02:38:37'),
	('0ad7cd8bbac31d18dfbaf3bdbcedb2398dd3c97ebd77c50851c175a350fe0bef81900efc0e42b50d', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:51:09', '2023-07-12 19:51:09', '2024-07-13 02:51:09'),
	('0f294556fbadfc4f70013c0ec07b0ea98128fb0241592ca534b6f977bb6fab288b8f30f0e77e8edb', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:43:24', '2023-07-12 19:43:24', '2024-07-13 02:43:24'),
	('0fc5d26bc30b77bb3894b75159af7c592a14a3827420b89b560c103cba639b5debf45724c13d7209', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:42:05', '2023-07-12 19:42:05', '2024-07-13 02:42:05'),
	('1888e96fb356e2e8f32a7ca70c73dd4eeb1d10bace56c0f89b050dc3128fb816753f3fe0cf7c1dda', 6, 3, 'API Token', '[]', 0, '2023-07-12 02:54:32', '2023-07-12 02:54:32', '2024-07-12 09:54:32'),
	('1b0f5c3f6f12089d54a3b2dd09e37ef5508629d8cc4040c00ea00350c4796f6d65a24ab97c57cef8', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:33:08', '2023-07-12 19:33:08', '2024-07-13 02:33:08'),
	('1d104ef57cfe7933e62e47b3ab68a58f1e206af93fe1b8d9a8038f74b99f1b01e916443bb7c876ca', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:08:27', '2023-07-12 03:08:27', '2024-07-12 10:08:27'),
	('21eba7657b0f80dc7b8ecdb7de609381452321b3d36a0122a4fd1e2e14469f1886d82f4c478f0d16', 6, 3, 'API Token', '[]', 0, '2023-07-15 01:06:22', '2023-07-15 01:06:22', '2024-07-15 08:06:22'),
	('291a5b2deefb1baff94e1dd3f08320ad1ceef07c48a6e449b187bfe09c111987f6f7bfe173731495', 6, 3, 'API Token', '[]', 0, '2023-07-12 20:45:52', '2023-07-12 20:45:52', '2024-07-13 03:45:52'),
	('2ec65eccb6ce22cde3c5178e103e24f012bd6af15f49f0098f9297f5ec6fcef77b6bc36a0d571283', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:52:21', '2023-07-12 19:52:21', '2024-07-13 02:52:21'),
	('4a336ddf6e9c26a535aefca868d195d359b6282d51c13fe527dbb8a71dc9fc6ba2c96786244c0ed4', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:48:42', '2023-07-12 19:48:42', '2024-07-13 02:48:42'),
	('4df6a7a29dab52b29a458cb1f97db49af03c9335e2cb7845c00a367d00fde3e3891d8b2629abaeee', 6, 3, 'API Token', '[]', 0, '2023-07-13 03:00:35', '2023-07-13 03:00:35', '2024-07-13 10:00:35'),
	('51042ba39857594b9978a374d5a8d0acfc42193cad1fe5e106e04ceca0ece2886558e4e15428a69e', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:49:13', '2023-07-12 19:49:13', '2024-07-13 02:49:13'),
	('5485cbd590349cd56c71d735e1fcb86e4b774e0a74f776c8d12dfef3ccf1741620a02ca9eb242e32', 6, 3, 'API Token', '[]', 0, '2023-07-13 22:07:09', '2023-07-13 22:07:09', '2024-07-14 05:07:09'),
	('5e02bd9fc74d8b3a9f98a9b67f4a4118ac504807eaf668f0825bb382e886060240959b1e390fd346', 6, 3, 'API Token', '[]', 0, '2023-07-12 20:45:27', '2023-07-12 20:45:27', '2024-07-13 03:45:27'),
	('5e0b8e840d489af96bb0f9110a1af02ade6cdabbd576cad7bfc87ba1c9383efffa984d677df0475a', 6, 3, 'API Token', '[]', 0, '2023-07-12 02:55:20', '2023-07-12 02:55:20', '2024-07-12 09:55:20'),
	('62fc38414cf2cf487dbfdedfe326da58397df51022ada4cacff2118333f445461d42eeed9b07b45b', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:32:56', '2023-07-12 19:32:56', '2024-07-13 02:32:56'),
	('715f8571e87f9adbd9b196a53480a8416590a8c820c578f8bd5845cf8d7897cb058406afcdc07d01', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:21:34', '2023-07-12 19:21:34', '2024-07-13 02:21:34'),
	('8682b76730e41e8d02dd06a52b48c75da6450f1a11e43b56b48b416aa2023a83687e926872cddb48', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:49:23', '2023-07-12 19:49:23', '2024-07-13 02:49:23'),
	('86f86095835114898574f13b1fc352e036bc9883dbb8972eb4a125147115c5e89157b43a9f1e5ae3', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:30:58', '2023-07-12 19:30:58', '2024-07-13 02:30:58'),
	('8cefc7f6e4f28300bd002af973a6cf38f13ca71cf2b898b044f34b882884330b29c367e32fdd26fc', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:48:21', '2023-07-12 19:48:21', '2024-07-13 02:48:21'),
	('90b996efe28804bb0c5efe0cb6d187f0765238528abede5b5637dcf6c3cfb85f55811ecbe10c6c84', 6, 3, 'API Token', '[]', 0, '2023-07-13 00:58:28', '2023-07-13 00:58:28', '2024-07-13 07:58:28'),
	('94145ec8cfbee9fc594948fc14b4a0e3690afce18bebf2779851acb57161a92ebebe253b60f7a89b', 6, 3, 'API Token', '[]', 0, '2023-07-13 00:53:32', '2023-07-13 00:53:32', '2024-07-13 07:53:32'),
	('9470fa7a779add2ab2a50e6e23683e53cc26f598b1f0aeba85fc16c4ab66b5a7268b31c0470b3f61', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:41:30', '2023-07-12 19:41:30', '2024-07-13 02:41:30'),
	('956b747b019ab1c73e3720b4db2dc48f10dfff0e0e065bbb9434d4e25e84c73f204af64e10cc19ca', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:50:09', '2023-07-12 19:50:09', '2024-07-13 02:50:09'),
	('974a400a5120aacfc4c57f5f05a3756e64462e0c13278d1b31eb3eb8900898bb82e3da8da173262a', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:36:36', '2023-07-12 19:36:36', '2024-07-13 02:36:36'),
	('984edfe84636e941f56badb89924081df891fa1692314dae3d2842ba8b42375d70539866fc21fdc0', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:52:28', '2023-07-12 19:52:28', '2024-07-13 02:52:28'),
	('9939556caa13bdb0e12500072dcbcb5daa3a2d0227d0791b92cc41d136bdf15e7ae73a1d60f4b7f0', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:43:41', '2023-07-12 19:43:41', '2024-07-13 02:43:41'),
	('99de6ec3e0f2c4300bd71df0aad0e660403dd2298ecde9302f18d5c1b211f040a8875fe625f35d2a', 6, 3, 'API Token', '[]', 0, '2023-07-12 20:46:21', '2023-07-12 20:46:21', '2024-07-13 03:46:21'),
	('9dfb1f1d609f89891e1f600fc71fa628fe7395e46ae2762b76f120a64bea6a7974eae3a232909321', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:55:28', '2023-07-12 03:55:28', '2024-07-12 10:55:28'),
	('9fdb3e4fe5058e2bc20a99ac23bb0ccc9ac47228abd420202bd87190cf855907b8f3f216e81800d2', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:31:09', '2023-07-12 19:31:09', '2024-07-13 02:31:09'),
	('a7f5e328b3e16def3b376a34a0278206df6f6260b213d0b71e7c4887fe393941cf58d6d4f568dcf4', 6, 3, 'API Token', '[]', 0, '2023-07-13 21:58:42', '2023-07-13 21:58:42', '2024-07-14 04:58:42'),
	('a8455efd95640d1a64e1278d07846bbe0f1fba83adaf637bda64d0b4a1e4b2908aa7e0e8c05d9871', 6, 3, 'API Token', '[]', 0, '2023-07-14 19:26:00', '2023-07-14 19:26:00', '2024-07-15 02:26:00'),
	('abdb7e7ffdcba90be76c5e2bee42a3d8345f4f80065a1673a90865466a8fa5f676957e87149ee405', 6, 3, 'API Token', '[]', 0, '2023-07-14 18:29:00', '2023-07-14 18:29:00', '2024-07-15 01:29:00'),
	('ad950f08d8a1b826cbe6ef833a60f3fd95742dbc81018131bed934417ed592639821650ac5e18b86', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:25:40', '2023-07-12 03:25:40', '2024-07-12 10:25:40'),
	('b21b816724d4b69f95fd429e90c847a17e694be5a29b5a46079864c0a3738378e1c32e4b90bd4c93', 6, 3, 'API Token', '[]', 0, '2023-07-14 19:24:36', '2023-07-14 19:24:36', '2024-07-15 02:24:36'),
	('b650c1e603afa8d6ac8efdf61024350f914cc94e7e7e3397e42ba649090887a599e4c72aa71290ff', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:29:54', '2023-07-12 03:29:54', '2024-07-12 10:29:54'),
	('b6ae20e56c9b43a2e5fffb5759f44b0a84e669017c16223ecc92a592a273f34d0205e5cb088052b7', 6, 3, 'API Token', '[]', 0, '2023-07-16 18:39:02', '2023-07-16 18:39:02', '2024-07-17 01:39:02'),
	('ba9b85cb4ff4b5836714004bc3eaec7e68a1b2a535f85a08b4907e18114d7437ad886d3568a086d3', 6, 3, 'API Token', '[]', 0, '2023-07-12 02:47:40', '2023-07-12 02:47:40', '2024-07-12 09:47:40'),
	('bb346dd2e21836f216159368dd0ec9154b0b63576c5179293f9f76afe4cc132edbbb4961eadb5645', 6, 3, 'API Token', '[]', 0, '2023-07-14 19:25:40', '2023-07-14 19:25:40', '2024-07-15 02:25:40'),
	('bc40479f2348e3ebfd08dd9acc5a6febbe320034754a0f94863088125db097ee42488de8f9510466', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:32:46', '2023-07-12 19:32:46', '2024-07-13 02:32:46'),
	('bfade4024e6b447aa940a5b3c9db8327168d2315f5fc23ca5ebd97b1701bdcb1912d56590cc47b09', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:34:36', '2023-07-12 03:34:36', '2024-07-12 10:34:36'),
	('c30a90fcb0f5964562617db9d72a539492f57a4a47f3dd266c1f08c309dc5665e2e219fdbbedd3c0', 6, 3, 'API Token', '[]', 0, '2023-07-12 02:48:09', '2023-07-12 02:48:09', '2024-07-12 09:48:09'),
	('c48edbd717a8e9cf999e72463e1c5c4aca6e0320a531c2b62a30deb772b74663b47756e165a694a0', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:10:40', '2023-07-12 03:10:40', '2024-07-12 10:10:40'),
	('c710575466ada21011c413f293bba78c309e173f6aff06eca0d491f0ccb1175aaf4d33a72d9f807b', 6, 3, 'API Token', '[]', 0, '2023-07-13 21:54:48', '2023-07-13 21:54:48', '2024-07-14 04:54:48'),
	('cd98ea75b57344090fffc7010d08fc7f76761d3d885888510b364407080c53d7802f901fcc0e92de', 6, 3, 'API Token', '[]', 0, '2023-07-12 02:55:01', '2023-07-12 02:55:01', '2024-07-12 09:55:01'),
	('d496cc4409f5bf4cdabca6d5fbd59423c419df4c86e8ab015a0adffe02b451ed918657d695119a4e', 6, 3, 'API Token', '[]', 0, '2023-07-14 19:11:40', '2023-07-14 19:11:40', '2024-07-15 02:11:40'),
	('d7d98f006341f71533290cde3f5172187741007183231e4864f2c3c0a92c52a6fa721a6857266f2f', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:23:21', '2023-07-12 03:23:21', '2024-07-12 10:23:21'),
	('df8b571e1191b17d7190db0600a68ae3ee524f3047b09dae23efdaea34f5422639797c6030b4ed82', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:32:00', '2023-07-12 19:32:00', '2024-07-13 02:32:00'),
	('e24cb7686f4b73ae2d76578f5dc1e4a7a1c6b4fa99be09ac53bb4341eca50fb835424f3987c711d3', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:48:13', '2023-07-12 19:48:13', '2024-07-13 02:48:13'),
	('e50f9a70cda1ee0c1d56013298719a4246179e75c3f058acbc1b1ab35714af2d1436df3438a35b4a', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:48:51', '2023-07-12 19:48:51', '2024-07-13 02:48:51'),
	('e5cfcff4b3f4e389394abadb888cdbad9f6c4ea127bcb20f7551ae6fd1147aba6b956405b4209ba5', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:31:27', '2023-07-12 19:31:27', '2024-07-13 02:31:27'),
	('e5e025a25bca220c9b9c7b20b188f3e1c1d5de4f86269de4deb9904018132d99f5c61d74a7beaf2c', 6, 3, 'API Token', '[]', 0, '2023-07-14 19:30:36', '2023-07-14 19:30:36', '2024-07-15 02:30:36'),
	('edbec1a9a2c95ef6011922cdb38937f28905560fc68edb6e2ef0872d7f567bf767209d87dad83c01', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:56:50', '2023-07-12 03:56:50', '2024-07-12 10:56:50'),
	('eff952092572e745dd309039bd36e857ac3fc1a2601f642c52e3bca806eb915fb1f0768c059548d2', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:53:23', '2023-07-12 19:53:23', '2024-07-13 02:53:23'),
	('f29083ea4c8501c6ea945fc97c9bfa70a1c4f8734b3a4433fa07e7b85e6767586e5ad077ea41ced2', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:49:58', '2023-07-12 19:49:58', '2024-07-13 02:49:58');

-- Dumping structure for table sso_client_ecommerce.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.oauth_auth_codes: ~0 rows (approximately)

-- Dumping structure for table sso_client_ecommerce.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.oauth_clients: ~3 rows (approximately)
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'eCommerce (SSO Client) Personal Access Client', 'QdbHQyY4M0vxXj0t9O46FUjKeOlfvzJB9yQ0aarl', NULL, 'http://localhost', 1, 0, 0, '2023-07-12 02:26:19', '2023-07-12 02:26:19'),
	(2, NULL, 'eCommerce (SSO Client) Password Grant Client', 'jMmqx0tlHg7sGYQK4tFqdn1aDyaCVbZBkdlKHSVj', 'users', 'http://localhost', 0, 1, 0, '2023-07-12 02:26:19', '2023-07-12 02:26:19'),
	(3, NULL, 'eCommerce (SSO Client) Personal Access Client', 'c1HhZh5eX0Li9qjqzGP6Y2xbUXEG5a71OKLFy1sB', NULL, 'http://localhost', 1, 0, 0, '2023-07-12 02:29:46', '2023-07-12 02:29:46'),
	(4, NULL, 'eCommerce (SSO Client) Password Grant Client', 'BSmeo6BTpBIY2oc4OQ3wpaXlr0l2e6dw0ZSJ9mjL', 'users', 'http://localhost', 0, 1, 0, '2023-07-12 02:29:46', '2023-07-12 02:29:46');

-- Dumping structure for table sso_client_ecommerce.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.oauth_personal_access_clients: ~2 rows (approximately)
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2023-07-12 02:26:19', '2023-07-12 02:26:19'),
	(2, 3, '2023-07-12 02:29:46', '2023-07-12 02:29:46');

-- Dumping structure for table sso_client_ecommerce.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.oauth_refresh_tokens: ~0 rows (approximately)

-- Dumping structure for table sso_client_ecommerce.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table sso_client_ecommerce.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `roles` longtext COLLATE utf8mb4_unicode_ci,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sso_client_ecommerce.users: ~1 rows (approximately)
INSERT INTO `users` (`id`, `roles`, `name`, `email`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
	(6, '["ROLE_ADMIN"]', 'huuhoang.tran@gosu.vn', 'huuhoang.tran@gosu.vn', NULL, NULL, '2023-06-30 19:46:26', '2023-06-30 19:46:26');

-- Dumping structure for table sso_client_ecommerce.vote
CREATE TABLE IF NOT EXISTS `vote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `type` smallint NOT NULL DEFAULT '1',
  `type_view` smallint NOT NULL DEFAULT '1',
  `status` smallint NOT NULL DEFAULT '1',
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table sso_client_ecommerce.vote: ~2 rows (approximately)
INSERT INTO `vote` (`id`, `title`, `type`, `type_view`, `status`, `updated_at`, `created_at`) VALUES
	(5, 'Không hút thuốc lá', 1, 1, 1, '2023-07-16 19:51:14', '2023-07-16 19:51:14'),
	(6, 'Không coi youtube trong giờ làm', 1, 1, 1, '2023-07-16 20:04:53', '2023-07-16 20:04:53');

-- Dumping structure for table sso_client_ecommerce.vote_history
CREATE TABLE IF NOT EXISTS `vote_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `vote_option_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__users` (`user_id`),
  KEY `FK_vote_history_vote_options` (`vote_option_id`),
  CONSTRAINT `FK__users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_vote_history_vote_options` FOREIGN KEY (`vote_option_id`) REFERENCES `vote_options` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table sso_client_ecommerce.vote_history: ~0 rows (approximately)
INSERT INTO `vote_history` (`id`, `user_id`, `vote_option_id`, `created_at`, `updated_at`) VALUES
	(15, 6, 7, '2023-07-16 20:28:21', '2023-07-16 20:28:21'),
	(16, 6, 10, '2023-07-16 20:28:21', '2023-07-16 20:28:21'),
	(17, 6, 11, '2023-07-16 20:28:21', '2023-07-16 20:28:21');

-- Dumping structure for table sso_client_ecommerce.vote_options
CREATE TABLE IF NOT EXISTS `vote_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NOT NULL,
  `option` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  `total_voted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_vote_options_question` (`question_id`),
  CONSTRAINT `FK_vote_options_question` FOREIGN KEY (`question_id`) REFERENCES `vote_questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table sso_client_ecommerce.vote_options: ~12 rows (approximately)
INSERT INTO `vote_options` (`id`, `question_id`, `option`, `updated_at`, `created_at`, `total_voted`) VALUES
	(7, 1, 'abc', '2023-07-16 20:28:21', '2023-07-16 19:51:14', 1),
	(8, 1, 'def', '2023-07-16 19:51:14', '2023-07-16 19:51:14', 0),
	(9, 1, 'ghi', '2023-07-16 19:51:14', '2023-07-16 19:51:14', 0),
	(10, 2, 'aaa', '2023-07-16 20:28:21', '2023-07-16 19:51:14', 1),
	(11, 2, 'bbbb', '2023-07-16 20:28:21', '2023-07-16 19:51:14', 1),
	(12, 2, 'cccc', '2023-07-16 19:51:14', '2023-07-16 19:51:14', 0),
	(13, 3, 'gggg', '2023-07-16 20:04:53', '2023-07-16 20:04:53', 0),
	(14, 3, 'sss', '2023-07-16 20:04:53', '2023-07-16 20:04:53', 0),
	(15, 3, 'bbbb', '2023-07-16 20:04:53', '2023-07-16 20:04:53', 0),
	(16, 4, 'arrraa', '2023-07-16 20:04:53', '2023-07-16 20:04:53', 0),
	(17, 4, 'cc', '2023-07-16 20:04:53', '2023-07-16 20:04:53', 0),
	(18, 4, 'eeer', '2023-07-16 20:04:53', '2023-07-16 20:04:53', 0);

-- Dumping structure for table sso_client_ecommerce.vote_questions
CREATE TABLE IF NOT EXISTS `vote_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vote_id` int NOT NULL,
  `question` text NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__vote` (`vote_id`),
  CONSTRAINT `FK__vote` FOREIGN KEY (`vote_id`) REFERENCES `vote` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table sso_client_ecommerce.vote_questions: ~4 rows (approximately)
INSERT INTO `vote_questions` (`id`, `vote_id`, `question`, `created_at`, `updated_at`) VALUES
	(1, 5, 'có phòng hút thuốc', '2023-07-16 19:51:14', '2023-07-16 19:51:14'),
	(2, 5, 'không hút thuốc trong căn phòng', '2023-07-16 19:51:14', '2023-07-16 19:51:14'),
	(3, 6, 'có phòng nghỉ ngơi để coi', '2023-07-16 20:04:53', '2023-07-16 20:04:53'),
	(4, 6, 'tuyệt đối không coi', '2023-07-16 20:04:53', '2023-07-16 20:04:53');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
