-- --------------------------------------------------------
-- Host:                         103.9.204.202
-- Server version:               10.8.4-MariaDB - MariaDB Server
-- Server OS:                    Linux
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


-- Dumping database structure for vote_gosu
CREATE DATABASE IF NOT EXISTS `vote_gosu` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `vote_gosu`;

-- Dumping structure for table vote_gosu.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vote_gosu.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table vote_gosu.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vote_gosu.migrations: ~10 rows (approximately)
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

-- Dumping structure for table vote_gosu.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vote_gosu.oauth_access_tokens: ~131 rows (approximately)
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('0396e9a743fda2203367efcc6434e667c61116a2250b1915bd21711fb00a8de04564c9d9648ae1a0', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:51:01', '2023-07-12 19:51:01', '2024-07-13 02:51:01'),
	('053b9f1ea8d2eae2031e38ac52853aa5c9b6e330fd1415038d9d267afe2514b87feefc278dc19afd', 6, 3, 'API Token', '[]', 0, '2023-07-17 00:59:05', '2023-07-17 00:59:05', '2024-07-17 07:59:05'),
	('05646f1dc4be57789a037ee35564069c2d6375dd5e47e2692d7d3abcb9001176b576204442db1c6c', 6, 3, 'API Token', '[]', 0, '2023-07-17 21:23:56', '2023-07-17 21:23:56', '2024-07-18 04:23:56'),
	('067757cb32da7c9c047ef07d14af25d65d5abe977dad468910d96a807e10b77e3c5c28e05da9b545', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:28:47', '2023-07-12 03:28:47', '2024-07-12 10:28:47'),
	('07719693d491ed1a88ad931edd837813bd2e850e81a8b1a3985720201412c941c1c6f9b0d46d9ecf', 6, 3, 'API Token', '[]', 0, '2023-07-17 01:41:01', '2023-07-17 01:41:01', '2024-07-17 08:41:01'),
	('07a683689dce3597bcb614948a9291d311f8da9e733eca410bf1fcbcc0434d6019a68211f51e8a78', 6, 3, 'API Token', '[]', 0, '2023-07-17 21:18:26', '2023-07-17 21:18:26', '2024-07-18 04:18:26'),
	('08ccda2b064ecba772fed8185c8f7ddb019695cdd41273b35926ed74dd2698dfab5d7686c0aa1efc', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:38:37', '2023-07-12 19:38:37', '2024-07-13 02:38:37'),
	('09ddb62a692df654119da12d0dfec9172f988c918233ec39fbcd648a03010509d55a2a5446b6b69a', 6, 3, 'API Token', '[]', 0, '2023-07-17 00:52:42', '2023-07-17 00:52:42', '2024-07-17 07:52:42'),
	('0ad7cd8bbac31d18dfbaf3bdbcedb2398dd3c97ebd77c50851c175a350fe0bef81900efc0e42b50d', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:51:09', '2023-07-12 19:51:09', '2024-07-13 02:51:09'),
	('0f294556fbadfc4f70013c0ec07b0ea98128fb0241592ca534b6f977bb6fab288b8f30f0e77e8edb', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:43:24', '2023-07-12 19:43:24', '2024-07-13 02:43:24'),
	('0fc5d26bc30b77bb3894b75159af7c592a14a3827420b89b560c103cba639b5debf45724c13d7209', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:42:05', '2023-07-12 19:42:05', '2024-07-13 02:42:05'),
	('139c9f84af4d75cb8010a4fa5829b13ddc3c7694113f181ada358c301c8a88d2e088622b8c2d12fb', 6, 3, 'API Token', '[]', 0, '2023-07-17 21:21:11', '2023-07-17 21:21:11', '2024-07-18 04:21:11'),
	('1888e96fb356e2e8f32a7ca70c73dd4eeb1d10bace56c0f89b050dc3128fb816753f3fe0cf7c1dda', 6, 3, 'API Token', '[]', 0, '2023-07-12 02:54:32', '2023-07-12 02:54:32', '2024-07-12 09:54:32'),
	('199eef130d54be6b23db006d4847fc865b6edad4962d5f871d71054f3eb48c12fe4039d5414919b8', 6, 3, 'API Token', '[]', 0, '2023-07-17 01:33:10', '2023-07-17 01:33:10', '2024-07-17 08:33:10'),
	('1b030fa334f97f54b4645e52c182ffd7fb31b7ed92ea7678375b43054580e68766640ac45b921ca1', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:28:16', '2023-07-17 02:28:16', '2024-07-17 09:28:16'),
	('1b051cc2d8a95307fe510b8896556853fa522738b13044ad429dbba6072fdbab9a7cd95202488821', 6, 3, 'API Token', '[]', 0, '2023-07-18 00:07:29', '2023-07-18 00:07:29', '2024-07-18 07:07:29'),
	('1b0f5c3f6f12089d54a3b2dd09e37ef5508629d8cc4040c00ea00350c4796f6d65a24ab97c57cef8', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:33:08', '2023-07-12 19:33:08', '2024-07-13 02:33:08'),
	('1b297b67543699689ce6cf64c9bd2294bde7e1433ae7558410c9b0ff7ff8208b48ac252afd07a61f', 6, 3, 'API Token', '[]', 0, '2023-07-18 02:01:51', '2023-07-18 02:01:51', '2024-07-18 09:01:51'),
	('1d104ef57cfe7933e62e47b3ab68a58f1e206af93fe1b8d9a8038f74b99f1b01e916443bb7c876ca', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:08:27', '2023-07-12 03:08:27', '2024-07-12 10:08:27'),
	('1e57fdfbe6fe37baab4ee84e9d4b51491ccd8615c960cc983195c68957e26d01a12d572a9b32c531', 6, 3, 'API Token', '[]', 0, '2023-07-18 01:41:25', '2023-07-18 01:41:25', '2024-07-18 08:41:25'),
	('20fda047531a0c3e01021300a0f1cc7677f07b78cd8679b98b5d39a47fc6c4f2b6f78715ae5980d7', 6, 3, 'API Token', '[]', 0, '2023-07-18 00:06:23', '2023-07-18 00:06:23', '2024-07-18 07:06:23'),
	('21eba7657b0f80dc7b8ecdb7de609381452321b3d36a0122a4fd1e2e14469f1886d82f4c478f0d16', 6, 3, 'API Token', '[]', 0, '2023-07-15 01:06:22', '2023-07-15 01:06:22', '2024-07-15 08:06:22'),
	('23cf85605cb640d971974a09ff6af543f2381582c4ac4eee52117b1ef21733ae87bc87f5297b4c22', 6, 3, 'API Token', '[]', 0, '2023-07-17 01:36:57', '2023-07-17 01:36:57', '2024-07-17 08:36:57'),
	('2881ae043946424b1c16429587f4c57861c87aa1baaefe4ea093063500fe5909afaddcb4f0906365', 6, 3, 'API Token', '[]', 0, '2023-07-18 01:37:58', '2023-07-18 01:37:58', '2024-07-18 08:37:58'),
	('291a5b2deefb1baff94e1dd3f08320ad1ceef07c48a6e449b187bfe09c111987f6f7bfe173731495', 6, 3, 'API Token', '[]', 0, '2023-07-12 20:45:52', '2023-07-12 20:45:52', '2024-07-13 03:45:52'),
	('293a736b19b95b2f5737373dbb71ebef49994b249fe0e3b580ea0631f8bb1aad54bb89532bdd04a6', 6, 3, 'API Token', '[]', 0, '2023-07-18 01:10:02', '2023-07-18 01:10:02', '2024-07-18 08:10:02'),
	('2a3bcfc2a7854ad27a8814d7d9e9440a99d0427ee0ac0a8b52bdf8e618a96c53113f17cf25c1e836', 6, 3, 'API Token', '[]', 0, '2023-07-17 23:49:33', '2023-07-17 23:49:33', '2024-07-18 06:49:33'),
	('2ec65eccb6ce22cde3c5178e103e24f012bd6af15f49f0098f9297f5ec6fcef77b6bc36a0d571283', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:52:21', '2023-07-12 19:52:21', '2024-07-13 02:52:21'),
	('3107fb1d3471dac845cc764cd9087cd12cfb6ebfa74639637cf12c45095c6c659d40a8c6636f3a9c', 6, 3, 'API Token', '[]', 0, '2023-07-17 01:53:59', '2023-07-17 01:53:59', '2024-07-17 08:53:59'),
	('318975d65e89f0186b67cd2185163f160e4add3c864fa4bde08d41a18d384ea9c6f7187b56c33a08', 6, 3, 'API Token', '[]', 0, '2023-07-17 01:48:00', '2023-07-17 01:48:00', '2024-07-17 08:48:00'),
	('31a9a217ea7c2483bd307f1272c93376b298fbbbc82bc1ee8a3b9851ebccaab9961b868fe83bad88', 6, 3, 'API Token', '[]', 0, '2023-07-17 01:44:05', '2023-07-17 01:44:05', '2024-07-17 08:44:05'),
	('320cedc06e54bbcf9b374cb2ebd5fedd06170abb7caa43e2311ab435490ca35de3221fbb805c148c', 6, 3, 'API Token', '[]', 0, '2023-07-18 23:36:43', '2023-07-18 23:36:43', '2024-07-19 06:36:43'),
	('33bba4394e781ce916c48d790b63baea799d741e4c05b1ac6f6eeb3590ed62cd72c196fea38b54c3', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:53:16', '2023-07-17 02:53:16', '2024-07-17 09:53:16'),
	('357012432312c19056eaddfa34ead467c1a856e575c18e285fe2ef83a6879b1febf5a26f60dcbd30', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:48:24', '2023-07-17 02:48:24', '2024-07-17 09:48:24'),
	('35f06da74cd4a6cf1e911e1456d6911d52bcb3ed04f53b9ee20a9eb20f853d0a33d4e5cc121e3290', 6, 3, 'API Token', '[]', 0, '2023-07-17 00:35:28', '2023-07-17 00:35:28', '2024-07-17 07:35:28'),
	('382591c17d6343202d99b2d88141cc27e24e22291923ca5bcae788cdbdc5a569ff614c7f35cc0a54', 6, 3, 'API Token', '[]', 0, '2023-07-17 01:51:55', '2023-07-17 01:51:55', '2024-07-17 08:51:55'),
	('4a336ddf6e9c26a535aefca868d195d359b6282d51c13fe527dbb8a71dc9fc6ba2c96786244c0ed4', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:48:42', '2023-07-12 19:48:42', '2024-07-13 02:48:42'),
	('4a8da458a00feb7e4614b0ab72cbddb1287cecc79fc1d4cb77bc7a2be02c26348a762f10ad87c49e', 6, 3, 'API Token', '[]', 0, '2023-07-17 00:15:24', '2023-07-17 00:15:24', '2024-07-17 07:15:24'),
	('4d318a3d41248471145a1b8dabb9bda06b786874e801628fa993195b060a8f7be7b436b6ce2f3635', 6, 3, 'API Token', '[]', 0, '2023-07-17 01:26:01', '2023-07-17 01:26:01', '2024-07-17 08:26:01'),
	('4df6a7a29dab52b29a458cb1f97db49af03c9335e2cb7845c00a367d00fde3e3891d8b2629abaeee', 6, 3, 'API Token', '[]', 0, '2023-07-13 03:00:35', '2023-07-13 03:00:35', '2024-07-13 10:00:35'),
	('51042ba39857594b9978a374d5a8d0acfc42193cad1fe5e106e04ceca0ece2886558e4e15428a69e', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:49:13', '2023-07-12 19:49:13', '2024-07-13 02:49:13'),
	('5375e62cdb87fbeb30e07f98270b7d56e55ed8fa2d6a86b192cfa6c48cc8f9273afd12d94acb3584', 6, 3, 'API Token', '[]', 0, '2023-07-17 00:38:35', '2023-07-17 00:38:35', '2024-07-17 07:38:35'),
	('5485cbd590349cd56c71d735e1fcb86e4b774e0a74f776c8d12dfef3ccf1741620a02ca9eb242e32', 6, 3, 'API Token', '[]', 0, '2023-07-13 22:07:09', '2023-07-13 22:07:09', '2024-07-14 05:07:09'),
	('5690d50c578c3238a75cfcca520e8ef26fd8e2c826495c10329a79bd5f7919e32c9a82f2994475c0', 6, 3, 'API Token', '[]', 0, '2023-07-18 02:22:54', '2023-07-18 02:22:54', '2024-07-18 09:22:54'),
	('57ec5a8f609663e701c20be7be6a9d82237780c0bd8eafd41d792364c8d25c96bdb810273e7b1acb', 6, 3, 'API Token', '[]', 0, '2023-07-18 02:03:41', '2023-07-18 02:03:41', '2024-07-18 09:03:41'),
	('5802da81180d69e2f955da434f35c98eb995ab5b0ad263563fe0d5f7496a3bcefb40349fee09207a', 6, 3, 'API Token', '[]', 0, '2023-07-17 21:23:38', '2023-07-17 21:23:38', '2024-07-18 04:23:38'),
	('5824d24433f745883b32ebc722c6c34b8a436ac6982c2be203e491596cdea419f537b94e89a4e8de', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:17:29', '2023-07-17 02:17:29', '2024-07-17 09:17:29'),
	('5b4713c110bbbbe17041cec1d94c3e391184f6b90a713cebfa8d400e8d0c9734d74cd25ce48e86a6', 6, 3, 'API Token', '[]', 0, '2023-07-17 01:40:14', '2023-07-17 01:40:14', '2024-07-17 08:40:14'),
	('5c4b6819dedc4a6539d764d69c4992501871c5d3e65763d7755a073ddcaab045006f72e9e31b5343', 6, 3, 'API Token', '[]', 0, '2023-07-17 00:36:15', '2023-07-17 00:36:15', '2024-07-17 07:36:15'),
	('5e02bd9fc74d8b3a9f98a9b67f4a4118ac504807eaf668f0825bb382e886060240959b1e390fd346', 6, 3, 'API Token', '[]', 0, '2023-07-12 20:45:27', '2023-07-12 20:45:27', '2024-07-13 03:45:27'),
	('5e0b8e840d489af96bb0f9110a1af02ade6cdabbd576cad7bfc87ba1c9383efffa984d677df0475a', 6, 3, 'API Token', '[]', 0, '2023-07-12 02:55:20', '2023-07-12 02:55:20', '2024-07-12 09:55:20'),
	('621a5da568bbdfe1aafc8488fee9e602f65970cf17baa511854f890958ba33fdcfae3c2e8b4d8662', 6, 3, 'API Token', '[]', 0, '2023-07-18 02:15:05', '2023-07-18 02:15:05', '2024-07-18 09:15:05'),
	('62fc38414cf2cf487dbfdedfe326da58397df51022ada4cacff2118333f445461d42eeed9b07b45b', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:32:56', '2023-07-12 19:32:56', '2024-07-13 02:32:56'),
	('64fe4b208c3c845093a7d2687fb5655fdba82e6074d91b216892689dbccf022b77dc481a2505e06f', 6, 3, 'API Token', '[]', 0, '2023-07-18 02:21:55', '2023-07-18 02:21:55', '2024-07-18 09:21:55'),
	('68abfcab1d418f037d4d84db30981250157e4fa9bab9df612cd759893730ab0a7ceda98bbed49a25', 6, 3, 'API Token', '[]', 0, '2023-07-17 03:33:42', '2023-07-17 03:33:42', '2024-07-17 10:33:42'),
	('6df2606cda65d32e7e7f9f7b963b62cb1e02937c4dcecf2f5d0ac2c8893040f607edc3ac6e5559ef', 6, 3, 'API Token', '[]', 0, '2023-07-17 21:22:54', '2023-07-17 21:22:54', '2024-07-18 04:22:54'),
	('715f8571e87f9adbd9b196a53480a8416590a8c820c578f8bd5845cf8d7897cb058406afcdc07d01', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:21:34', '2023-07-12 19:21:34', '2024-07-13 02:21:34'),
	('7375475585c3e53262281a4c5b2d1ff4fa8c29d65a26350831b8f4d7aafafc50e230999aaf2d8047', 6, 3, 'API Token', '[]', 0, '2023-07-18 02:25:17', '2023-07-18 02:25:17', '2024-07-18 09:25:17'),
	('76a50ce00719c96e3ee18c23a50671458f7504a4ab9fadcc6f7c08d0b9710a38ed5660069c16a681', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:03:48', '2023-07-17 02:03:48', '2024-07-17 09:03:48'),
	('789a23754539053be87773097c3a3c2f00218a29279f0b39cf780674ca4405bc574495223d037daa', 6, 3, 'API Token', '[]', 0, '2023-07-17 01:50:43', '2023-07-17 01:50:43', '2024-07-17 08:50:43'),
	('78eae96113769f81a1f6511a23222234c6772a748bd2511fe63481b610fb7e0b3af1b6eacbf916b7', 6, 3, 'API Token', '[]', 0, '2023-07-17 21:22:35', '2023-07-17 21:22:35', '2024-07-18 04:22:35'),
	('7af3587e1a67b110fe87b755803956f2baeeefa0c3f292e2f568ac7a142fe49e40e23015bc5042cc', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:10:24', '2023-07-17 02:10:24', '2024-07-17 09:10:24'),
	('7b1345567705c557bafd35936d5e96b8bb8988da82e57df2c1657a326b18ea5714febb39a68d9782', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:06:08', '2023-07-17 02:06:08', '2024-07-17 09:06:08'),
	('8150656e32cec4fc1baaa0d00405f4aaf07465f2ca1a242ea52f8de964b55e2cf8a63e0183af1b01', 6, 3, 'API Token', '[]', 0, '2023-07-17 21:31:20', '2023-07-17 21:31:20', '2024-07-18 04:31:20'),
	('8682b76730e41e8d02dd06a52b48c75da6450f1a11e43b56b48b416aa2023a83687e926872cddb48', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:49:23', '2023-07-12 19:49:23', '2024-07-13 02:49:23'),
	('86f86095835114898574f13b1fc352e036bc9883dbb8972eb4a125147115c5e89157b43a9f1e5ae3', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:30:58', '2023-07-12 19:30:58', '2024-07-13 02:30:58'),
	('8af9fcd6da8400ad6a010f0fddfd06de7cac55ae0788c59bf04085125232c6015463756aa5357d41', 6, 3, 'API Token', '[]', 0, '2023-07-18 02:25:03', '2023-07-18 02:25:03', '2024-07-18 09:25:03'),
	('8b0198be6ee7c7bcfddc4a1b87c926b5ea9c67389d4cd861e306e4e1208cc190f83c2a919a795014', 6, 3, 'API Token', '[]', 0, '2023-07-17 03:05:24', '2023-07-17 03:05:24', '2024-07-17 10:05:24'),
	('8ccf3246ae6a2854832e54e4b04d2542b16480ef65fca9c8e8e80fa3f2162f4ffb2dd743202cf2a5', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:05:21', '2023-07-17 02:05:21', '2024-07-17 09:05:21'),
	('8cefc7f6e4f28300bd002af973a6cf38f13ca71cf2b898b044f34b882884330b29c367e32fdd26fc', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:48:21', '2023-07-12 19:48:21', '2024-07-13 02:48:21'),
	('8d14045694b289a83a08adfbe0215c82adcd6b8f1a7431cbc1cb8c28b1286b332d80b84f3a2cf900', 6, 3, 'API Token', '[]', 0, '2023-07-17 21:23:24', '2023-07-17 21:23:24', '2024-07-18 04:23:24'),
	('90b996efe28804bb0c5efe0cb6d187f0765238528abede5b5637dcf6c3cfb85f55811ecbe10c6c84', 6, 3, 'API Token', '[]', 0, '2023-07-13 00:58:28', '2023-07-13 00:58:28', '2024-07-13 07:58:28'),
	('93ab0b1c1509b0cc57b22686181383eacbef1fefb4c16d9f22f2b92b7547f9deb5fe70b924052186', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:02:32', '2023-07-17 02:02:32', '2024-07-17 09:02:32'),
	('94145ec8cfbee9fc594948fc14b4a0e3690afce18bebf2779851acb57161a92ebebe253b60f7a89b', 6, 3, 'API Token', '[]', 0, '2023-07-13 00:53:32', '2023-07-13 00:53:32', '2024-07-13 07:53:32'),
	('9470fa7a779add2ab2a50e6e23683e53cc26f598b1f0aeba85fc16c4ab66b5a7268b31c0470b3f61', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:41:30', '2023-07-12 19:41:30', '2024-07-13 02:41:30'),
	('956b747b019ab1c73e3720b4db2dc48f10dfff0e0e065bbb9434d4e25e84c73f204af64e10cc19ca', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:50:09', '2023-07-12 19:50:09', '2024-07-13 02:50:09'),
	('974a400a5120aacfc4c57f5f05a3756e64462e0c13278d1b31eb3eb8900898bb82e3da8da173262a', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:36:36', '2023-07-12 19:36:36', '2024-07-13 02:36:36'),
	('984edfe84636e941f56badb89924081df891fa1692314dae3d2842ba8b42375d70539866fc21fdc0', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:52:28', '2023-07-12 19:52:28', '2024-07-13 02:52:28'),
	('9939556caa13bdb0e12500072dcbcb5daa3a2d0227d0791b92cc41d136bdf15e7ae73a1d60f4b7f0', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:43:41', '2023-07-12 19:43:41', '2024-07-13 02:43:41'),
	('99de6ec3e0f2c4300bd71df0aad0e660403dd2298ecde9302f18d5c1b211f040a8875fe625f35d2a', 6, 3, 'API Token', '[]', 0, '2023-07-12 20:46:21', '2023-07-12 20:46:21', '2024-07-13 03:46:21'),
	('9d2387f9376563d4ffa92f52821f689688433b56f4885494812e6fc7a8cb90e9cc18144623b29a9c', 6, 3, 'API Token', '[]', 0, '2023-07-17 01:58:45', '2023-07-17 01:58:45', '2024-07-17 08:58:45'),
	('9dfb1f1d609f89891e1f600fc71fa628fe7395e46ae2762b76f120a64bea6a7974eae3a232909321', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:55:28', '2023-07-12 03:55:28', '2024-07-12 10:55:28'),
	('9fdb3e4fe5058e2bc20a99ac23bb0ccc9ac47228abd420202bd87190cf855907b8f3f216e81800d2', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:31:09', '2023-07-12 19:31:09', '2024-07-13 02:31:09'),
	('a0963aaeedde91e1d1e05c27494fe1696abd7e6c990a2ae93bd90aeb0333965875cd940cadb602b2', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:25:13', '2023-07-17 02:25:13', '2024-07-17 09:25:13'),
	('a1eec4ac98035520a6b56f38fe69c000b126ffae0619e2540eb0a5efd32b5c4383df4d2ad71d436d', 6, 3, 'API Token', '[]', 0, '2023-07-17 01:52:32', '2023-07-17 01:52:32', '2024-07-17 08:52:32'),
	('a7f5e328b3e16def3b376a34a0278206df6f6260b213d0b71e7c4887fe393941cf58d6d4f568dcf4', 6, 3, 'API Token', '[]', 0, '2023-07-13 21:58:42', '2023-07-13 21:58:42', '2024-07-14 04:58:42'),
	('a8455efd95640d1a64e1278d07846bbe0f1fba83adaf637bda64d0b4a1e4b2908aa7e0e8c05d9871', 6, 3, 'API Token', '[]', 0, '2023-07-14 19:26:00', '2023-07-14 19:26:00', '2024-07-15 02:26:00'),
	('aa665e9008caabd37b124a0b51d1fdc1acb9726ec617f162fb72ffb74dd3235cfb254c77341ee2f1', 6, 3, 'API Token', '[]', 0, '2023-07-20 01:05:19', '2023-07-20 01:05:19', '2024-07-20 08:05:19'),
	('abdb7e7ffdcba90be76c5e2bee42a3d8345f4f80065a1673a90865466a8fa5f676957e87149ee405', 6, 3, 'API Token', '[]', 0, '2023-07-14 18:29:00', '2023-07-14 18:29:00', '2024-07-15 01:29:00'),
	('ac978194e90a64cd1677c10768c31edd8066955d64e6127ae7c38c4da32f093c2b1cf09668cefb1d', 6, 3, 'API Token', '[]', 0, '2023-07-17 21:20:47', '2023-07-17 21:20:47', '2024-07-18 04:20:47'),
	('ad950f08d8a1b826cbe6ef833a60f3fd95742dbc81018131bed934417ed592639821650ac5e18b86', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:25:40', '2023-07-12 03:25:40', '2024-07-12 10:25:40'),
	('af3f8d17efcdea724cafc4fe0654f4f9dc14dc5fb3bfcfbd82ccf6ad0ef2c7e37ce377281e9d1d24', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:19:01', '2023-07-17 02:19:01', '2024-07-17 09:19:01'),
	('b1125728f07e5f9bfa881493b06ab5703225e148ee22ef5178c0aca33c6f77e8ba21a92d75fbd3b2', 6, 3, 'API Token', '[]', 0, '2023-07-17 18:19:55', '2023-07-17 18:19:55', '2024-07-18 01:19:55'),
	('b21b816724d4b69f95fd429e90c847a17e694be5a29b5a46079864c0a3738378e1c32e4b90bd4c93', 6, 3, 'API Token', '[]', 0, '2023-07-14 19:24:36', '2023-07-14 19:24:36', '2024-07-15 02:24:36'),
	('b650c1e603afa8d6ac8efdf61024350f914cc94e7e7e3397e42ba649090887a599e4c72aa71290ff', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:29:54', '2023-07-12 03:29:54', '2024-07-12 10:29:54'),
	('b6ae20e56c9b43a2e5fffb5759f44b0a84e669017c16223ecc92a592a273f34d0205e5cb088052b7', 6, 3, 'API Token', '[]', 0, '2023-07-16 18:39:02', '2023-07-16 18:39:02', '2024-07-17 01:39:02'),
	('ba9b85cb4ff4b5836714004bc3eaec7e68a1b2a535f85a08b4907e18114d7437ad886d3568a086d3', 6, 3, 'API Token', '[]', 0, '2023-07-12 02:47:40', '2023-07-12 02:47:40', '2024-07-12 09:47:40'),
	('bb346dd2e21836f216159368dd0ec9154b0b63576c5179293f9f76afe4cc132edbbb4961eadb5645', 6, 3, 'API Token', '[]', 0, '2023-07-14 19:25:40', '2023-07-14 19:25:40', '2024-07-15 02:25:40'),
	('bc40479f2348e3ebfd08dd9acc5a6febbe320034754a0f94863088125db097ee42488de8f9510466', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:32:46', '2023-07-12 19:32:46', '2024-07-13 02:32:46'),
	('bfade4024e6b447aa940a5b3c9db8327168d2315f5fc23ca5ebd97b1701bdcb1912d56590cc47b09', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:34:36', '2023-07-12 03:34:36', '2024-07-12 10:34:36'),
	('bfb4bc69e8d22672c799fc30de3a5b2c1a1861a69a4a7651a9eb60ba4ca0fad442f237e2edddac25', 6, 3, 'API Token', '[]', 0, '2023-07-18 00:06:41', '2023-07-18 00:06:41', '2024-07-18 07:06:41'),
	('c30a90fcb0f5964562617db9d72a539492f57a4a47f3dd266c1f08c309dc5665e2e219fdbbedd3c0', 6, 3, 'API Token', '[]', 0, '2023-07-12 02:48:09', '2023-07-12 02:48:09', '2024-07-12 09:48:09'),
	('c48edbd717a8e9cf999e72463e1c5c4aca6e0320a531c2b62a30deb772b74663b47756e165a694a0', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:10:40', '2023-07-12 03:10:40', '2024-07-12 10:10:40'),
	('c710575466ada21011c413f293bba78c309e173f6aff06eca0d491f0ccb1175aaf4d33a72d9f807b', 6, 3, 'API Token', '[]', 0, '2023-07-13 21:54:48', '2023-07-13 21:54:48', '2024-07-14 04:54:48'),
	('cd98ea75b57344090fffc7010d08fc7f76761d3d885888510b364407080c53d7802f901fcc0e92de', 6, 3, 'API Token', '[]', 0, '2023-07-12 02:55:01', '2023-07-12 02:55:01', '2024-07-12 09:55:01'),
	('cf756dc55c6ca6eaa9afb4f7f0dfdcd4d47a8f123abfc7cd2617306a2f5d7f307a797b826c840c94', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:31:13', '2023-07-17 02:31:13', '2024-07-17 09:31:13'),
	('d0a18db1b805a85d709eabe7f4eed67e408909d6c3a38d6e40ecf8ff58f7fbfd5726527b7436da70', 6, 3, 'API Token', '[]', 0, '2023-07-18 02:27:04', '2023-07-18 02:27:04', '2024-07-18 09:27:04'),
	('d432a4084377a2b8cefc90eaebddd002f3191d456281425ff2b2f21424814b4f8ecfe3e72e387b66', 7, 3, 'API Token', '[]', 0, '2023-07-18 01:41:11', '2023-07-18 01:41:11', '2024-07-18 08:41:11'),
	('d496cc4409f5bf4cdabca6d5fbd59423c419df4c86e8ab015a0adffe02b451ed918657d695119a4e', 6, 3, 'API Token', '[]', 0, '2023-07-14 19:11:40', '2023-07-14 19:11:40', '2024-07-15 02:11:40'),
	('d63bfe9397b4bf98730e29d1cc0b43fad4b7c4d8b581616ed00aa9197d1a92ddb35014db0cfd9473', 6, 3, 'API Token', '[]', 0, '2023-07-18 02:26:46', '2023-07-18 02:26:46', '2024-07-18 09:26:46'),
	('d7d98f006341f71533290cde3f5172187741007183231e4864f2c3c0a92c52a6fa721a6857266f2f', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:23:21', '2023-07-12 03:23:21', '2024-07-12 10:23:21'),
	('dc2e51c0dc62403704deea15c9d8f7896fe6369135ae07380f6cd8f00b0ba548cc235e868beb88f2', 6, 3, 'API Token', '[]', 0, '2023-07-18 02:02:14', '2023-07-18 02:02:14', '2024-07-18 09:02:14'),
	('dc856ece32b90f614574a2e7f12d2262ab3b715894ced53b80b46c8fd145c8495150985006b14204', 6, 3, 'API Token', '[]', 0, '2023-07-17 03:23:39', '2023-07-17 03:23:39', '2024-07-17 10:23:39'),
	('dceac9a77743eb43d11eb07ca0a426dd72eb1eda162fb0c1f895b3ff477829bf43562ba8d5dc1b82', 6, 3, 'API Token', '[]', 0, '2023-07-18 02:02:55', '2023-07-18 02:02:55', '2024-07-18 09:02:55'),
	('dd7dd6810a9733ba1acbd769b39c0a8d45bb1161198746f0a0bdd8f12e7bca9fbff0b936b44fbae1', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:12:39', '2023-07-17 02:12:39', '2024-07-17 09:12:39'),
	('df8b571e1191b17d7190db0600a68ae3ee524f3047b09dae23efdaea34f5422639797c6030b4ed82', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:32:00', '2023-07-12 19:32:00', '2024-07-13 02:32:00'),
	('e193dc11099044d802043d3d3a4d4dba8497bdb3b0be46d88410311720286ca19d8fbcbbbadd168b', 6, 3, 'API Token', '[]', 0, '2023-07-17 03:04:32', '2023-07-17 03:04:32', '2024-07-17 10:04:32'),
	('e24cb7686f4b73ae2d76578f5dc1e4a7a1c6b4fa99be09ac53bb4341eca50fb835424f3987c711d3', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:48:13', '2023-07-12 19:48:13', '2024-07-13 02:48:13'),
	('e2980b866f5fcbe9293ed5cef1b362f8c8713a5c04958d18f8b656c091db77844edfcd69476b5bd4', 6, 3, 'API Token', '[]', 0, '2023-07-17 03:11:36', '2023-07-17 03:11:36', '2024-07-17 10:11:36'),
	('e50f9a70cda1ee0c1d56013298719a4246179e75c3f058acbc1b1ab35714af2d1436df3438a35b4a', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:48:51', '2023-07-12 19:48:51', '2024-07-13 02:48:51'),
	('e5cfcff4b3f4e389394abadb888cdbad9f6c4ea127bcb20f7551ae6fd1147aba6b956405b4209ba5', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:31:27', '2023-07-12 19:31:27', '2024-07-13 02:31:27'),
	('e5e025a25bca220c9b9c7b20b188f3e1c1d5de4f86269de4deb9904018132d99f5c61d74a7beaf2c', 6, 3, 'API Token', '[]', 0, '2023-07-14 19:30:36', '2023-07-14 19:30:36', '2024-07-15 02:30:36'),
	('e72fcfc45c3cabd2e5453c47b3508a9341620b1fdca41a8e2a15501a69cf24ed8f5f08efbcc032b6', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:50:52', '2023-07-17 02:50:52', '2024-07-17 09:50:52'),
	('e83ec18d6f6415b44c0e4bc6dd28c1ae5bacefaf14147c3056fd1d3a3687cb996e9002eff6e8a645', 6, 3, 'API Token', '[]', 0, '2023-07-16 21:53:11', '2023-07-16 21:53:11', '2024-07-17 04:53:11'),
	('edbec1a9a2c95ef6011922cdb38937f28905560fc68edb6e2ef0872d7f567bf767209d87dad83c01', 6, 3, 'API Token', '[]', 0, '2023-07-12 03:56:50', '2023-07-12 03:56:50', '2024-07-12 10:56:50'),
	('eff952092572e745dd309039bd36e857ac3fc1a2601f642c52e3bca806eb915fb1f0768c059548d2', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:53:23', '2023-07-12 19:53:23', '2024-07-13 02:53:23'),
	('f15ca7e03508a1bbc087e5a828562d493c4f8923394d4ae4e550a9e9bd51fd3659bb89c7ab7e19a7', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:51:08', '2023-07-17 02:51:08', '2024-07-17 09:51:08'),
	('f20b9f73b44465b6629fc3adac48d7f042466f795271622de4e1bda32a741fc9b6f6df5940b57ca6', 6, 3, 'API Token', '[]', 0, '2023-07-18 02:02:25', '2023-07-18 02:02:25', '2024-07-18 09:02:25'),
	('f29083ea4c8501c6ea945fc97c9bfa70a1c4f8734b3a4433fa07e7b85e6767586e5ad077ea41ced2', 6, 3, 'API Token', '[]', 0, '2023-07-12 19:49:58', '2023-07-12 19:49:58', '2024-07-13 02:49:58'),
	('f3eff98446f01ccbd7635e1a5f91eae305b4c04721cb85b21c165ff0f4afec98b3ebec5fb587141c', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:04:30', '2023-07-17 02:04:30', '2024-07-17 09:04:30'),
	('f9f1529c52c949e1a38e32c5846480e8be44e433262c1b063e9c2673c31716b269508103324052f5', 6, 3, 'API Token', '[]', 0, '2023-07-17 03:24:26', '2023-07-17 03:24:26', '2024-07-17 10:24:26'),
	('fc98d790a58feebcec2f17d6aae0b1bfccfbfcf36a9daf55d99a7da3c6081a5fa7ed6e99f4e87a03', 6, 3, 'API Token', '[]', 0, '2023-07-17 02:13:00', '2023-07-17 02:13:00', '2024-07-17 09:13:00');

-- Dumping structure for table vote_gosu.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vote_gosu.oauth_auth_codes: ~0 rows (approximately)

-- Dumping structure for table vote_gosu.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
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

-- Dumping data for table vote_gosu.oauth_clients: ~4 rows (approximately)
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'eCommerce (SSO Client) Personal Access Client', 'QdbHQyY4M0vxXj0t9O46FUjKeOlfvzJB9yQ0aarl', NULL, 'http://localhost', 1, 0, 0, '2023-07-12 02:26:19', '2023-07-12 02:26:19'),
	(2, NULL, 'eCommerce (SSO Client) Password Grant Client', 'jMmqx0tlHg7sGYQK4tFqdn1aDyaCVbZBkdlKHSVj', 'users', 'http://localhost', 0, 1, 0, '2023-07-12 02:26:19', '2023-07-12 02:26:19'),
	(3, NULL, 'eCommerce (SSO Client) Personal Access Client', 'c1HhZh5eX0Li9qjqzGP6Y2xbUXEG5a71OKLFy1sB', NULL, 'http://localhost', 1, 0, 0, '2023-07-12 02:29:46', '2023-07-12 02:29:46'),
	(4, NULL, 'eCommerce (SSO Client) Password Grant Client', 'BSmeo6BTpBIY2oc4OQ3wpaXlr0l2e6dw0ZSJ9mjL', 'users', 'http://localhost', 0, 1, 0, '2023-07-12 02:29:46', '2023-07-12 02:29:46');

-- Dumping structure for table vote_gosu.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vote_gosu.oauth_personal_access_clients: ~2 rows (approximately)
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2023-07-12 02:26:19', '2023-07-12 02:26:19'),
	(2, 3, '2023-07-12 02:29:46', '2023-07-12 02:29:46');

-- Dumping structure for table vote_gosu.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vote_gosu.oauth_refresh_tokens: ~0 rows (approximately)

-- Dumping structure for table vote_gosu.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vote_gosu.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table vote_gosu.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `roles` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vote_gosu.users: ~2 rows (approximately)
INSERT INTO `users` (`id`, `roles`, `name`, `email`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
	(6, '["ROLE_ADMIN","ROLE_TEST"]', 'huuhoang.tran@gosu.vn', 'huuhoang.tran@gosu.vn', NULL, NULL, '2023-06-30 19:46:26', '2023-06-30 19:46:26'),
	(7, NULL, 'minhtam.nguyen@gosu.vn', 'minhtam.nguyen@gosu.vn', NULL, NULL, '2023-07-18 01:41:11', '2023-07-18 01:41:11');

-- Dumping structure for table vote_gosu.vote
CREATE TABLE IF NOT EXISTS `vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `type_view` smallint(6) NOT NULL DEFAULT 1,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vote_gosu.vote: ~9 rows (approximately)
INSERT INTO `vote` (`id`, `title`, `type_view`, `status`, `updated_at`, `created_at`) VALUES
	(5, 'Không hút thuốc lá', 1, 1, '2023-07-18 08:57:25', '2023-07-16 19:51:14'),
	(6, 'Không coi youtube trong giờ làm', 1, 1, '2023-07-18 08:57:28', '2023-07-16 20:04:53'),
	(9, 'Không chơi gametrong giờ làm', 1, 1, '2023-07-18 08:54:31', '2023-07-16 21:06:36'),
	(11, 'Không chơi gametrong giờ làm', 1, 1, '2023-07-18 08:57:29', '2023-07-16 21:08:19'),
	(12, 'Không chơi gametrong giờ làm', 1, 1, '2023-07-18 08:57:30', '2023-07-16 21:09:04'),
	(13, 'Không chơi gametrong giờ làm', 1, 1, '2023-07-18 08:57:30', '2023-07-16 21:10:44'),
	(14, 'Không chơi gametrong giờ làm', 1, 1, '2023-07-18 08:57:31', '2023-07-16 21:15:58'),
	(16, 'Không chơi gametrong giờ làm', 1, 1, '2023-07-18 08:57:31', '2023-07-17 00:26:37'),
	(17, 'Không chơi gametrong giờ làm', 1, 1, '2023-07-18 08:57:32', '2023-07-17 00:27:08');

-- Dumping structure for table vote_gosu.vote_history
CREATE TABLE IF NOT EXISTS `vote_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `vote_option_id` int(11) NOT NULL DEFAULT 0,
  `answer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__users` (`user_id`),
  KEY `FK_vote_history_vote_options` (`vote_option_id`),
  CONSTRAINT `FK__users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_vote_history_vote_options` FOREIGN KEY (`vote_option_id`) REFERENCES `vote_options` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vote_gosu.vote_history: ~3 rows (approximately)
INSERT INTO `vote_history` (`id`, `user_id`, `vote_option_id`, `answer`, `created_at`, `updated_at`) VALUES
	(15, 6, 7, NULL, '2023-07-16 20:28:21', '2023-07-16 20:28:21'),
	(16, 6, 10, NULL, '2023-07-16 20:28:21', '2023-07-16 20:28:21'),
	(17, 6, 11, NULL, '2023-07-16 20:28:21', '2023-07-16 20:28:21');

-- Dumping structure for table vote_gosu.vote_options
CREATE TABLE IF NOT EXISTS `vote_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `option` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `total_voted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_vote_options_question` (`question_id`),
  CONSTRAINT `FK_vote_options_question` FOREIGN KEY (`question_id`) REFERENCES `vote_questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table vote_gosu.vote_options: ~37 rows (approximately)
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
	(18, 4, 'eeer', '2023-07-16 20:04:53', '2023-07-16 20:04:53', 0),
	(19, 5, 'gggg', '2023-07-16 21:10:44', '2023-07-16 21:10:44', 0),
	(20, 5, 'sss', '2023-07-16 21:10:44', '2023-07-16 21:10:44', 0),
	(21, 5, 'bbbb', '2023-07-16 21:10:44', '2023-07-16 21:10:44', 0),
	(22, 6, 'arrraa', '2023-07-16 21:10:44', '2023-07-16 21:10:44', 0),
	(23, 6, 'cc', '2023-07-16 21:10:44', '2023-07-16 21:10:44', 0),
	(24, 6, 'eeer', '2023-07-16 21:10:44', '2023-07-16 21:10:44', 0),
	(25, 7, 'gggg', '2023-07-16 21:15:58', '2023-07-16 21:15:58', 0),
	(26, 7, 'sss', '2023-07-16 21:15:58', '2023-07-16 21:15:58', 0),
	(27, 7, 'bbbb', '2023-07-16 21:15:58', '2023-07-16 21:15:58', 0),
	(28, 8, 'arrraa', '2023-07-16 21:15:58', '2023-07-16 21:15:58', 0),
	(29, 8, 'cc', '2023-07-16 21:15:58', '2023-07-16 21:15:58', 0),
	(30, 8, 'eeer', '2023-07-16 21:15:58', '2023-07-16 21:15:58', 0),
	(31, 11, 'gggg', '2023-07-17 00:27:08', '2023-07-17 00:27:08', 0),
	(32, 11, 'ssss', '2023-07-17 00:27:08', '2023-07-17 00:27:08', 0),
	(33, 11, 'bbbb', '2023-07-17 00:27:08', '2023-07-17 00:27:08', 0),
	(34, 12, 'arrrr', '2023-07-17 00:27:08', '2023-07-17 00:27:08', 0),
	(35, 12, 'brrr', '2023-07-17 00:27:08', '2023-07-17 00:27:08', 0),
	(36, 12, 'crrrr', '2023-07-17 00:27:08', '2023-07-17 00:27:08', 0),
	(37, 11, 'bbbb new', '2023-07-17 20:05:30', '2023-07-17 20:05:30', 0),
	(38, 11, 'bbbb new', '2023-07-17 20:06:30', '2023-07-17 20:06:30', 0),
	(39, 13, 'arrrr', '2023-07-17 20:06:30', '2023-07-17 20:06:30', 0),
	(40, 13, 'brrr', '2023-07-17 20:06:30', '2023-07-17 20:06:30', 0),
	(41, 11, 'bbbb new', '2023-07-17 20:07:16', '2023-07-17 20:07:16', 0),
	(42, 14, 'arrrr', '2023-07-17 20:07:16', '2023-07-17 20:07:16', 0),
	(43, 14, 'brrr', '2023-07-17 20:07:16', '2023-07-17 20:07:16', 0);

-- Dumping structure for table vote_gosu.vote_questions
CREATE TABLE IF NOT EXISTS `vote_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `FK__vote` (`vote_id`),
  CONSTRAINT `FK__vote` FOREIGN KEY (`vote_id`) REFERENCES `vote` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table vote_gosu.vote_questions: ~13 rows (approximately)
INSERT INTO `vote_questions` (`id`, `vote_id`, `question`, `created_at`, `updated_at`, `type`) VALUES
	(1, 5, 'có phòng hút thuốc', '2023-07-18 08:56:23', '2023-07-16 19:51:14', 1),
	(2, 5, 'không hút thuốc trong căn phòng', '2023-07-18 08:56:26', '2023-07-16 19:51:14', 1),
	(3, 6, 'có phòng nghỉ ngơi để coi', '2023-07-18 08:56:31', '2023-07-16 20:04:53', 1),
	(4, 6, 'tuyệt đối không coi', '2023-07-18 08:56:36', '2023-07-16 20:04:53', 1),
	(5, 13, 'có phòng nghỉ ngơi để chơi game', '2023-07-18 08:56:38', '2023-07-16 21:10:44', 1),
	(6, 13, 'tuyệt đối không chơi', '2023-07-18 08:56:41', '2023-07-16 21:10:44', 1),
	(7, 14, 'có phòng nghỉ ngơi để chơi game', '2023-07-18 08:56:41', '2023-07-16 21:15:58', 1),
	(8, 14, 'tuyệt đối không chơi', '2023-07-18 08:56:46', '2023-07-16 21:15:58', 1),
	(10, 16, 'có phòng nghỉ ngơi để chơi game', '2023-07-18 08:56:48', '2023-07-17 00:26:37', 1),
	(11, 17, 'có phòng nghỉ ngơi để chơi game', '2023-07-18 08:56:51', '2023-07-17 00:27:08', 1),
	(12, 17, 'tuyệt đối không chơi', '2023-07-18 08:56:53', '2023-07-17 00:27:08', 1),
	(13, 17, 'tuyệt đối không chơi', '2023-07-18 08:56:53', '2023-07-17 20:06:30', 1),
	(14, 17, 'tuyệt đối không chơi', '2023-07-18 08:56:54', '2023-07-17 20:07:16', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
