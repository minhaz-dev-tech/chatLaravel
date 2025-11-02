-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 02, 2025 at 10:51 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_vue_chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `owner_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`, `owner_id`, `created_at`, `updated_at`) VALUES
(1, 'Text', NULL, 13, '2025-11-02 03:46:15', '2025-11-02 03:46:15'),
(2, 'rtyr', NULL, 13, '2025-11-02 03:46:46', '2025-11-02 03:46:46'),
(3, 'adasd', NULL, 14, '2025-11-02 04:43:12', '2025-11-02 04:43:12'),
(4, 'dd', NULL, 14, '2025-11-02 04:43:41', '2025-11-02 04:43:41'),
(5, 'asdas', NULL, 14, '2025-11-02 04:44:03', '2025-11-02 04:44:03'),
(6, 'cvbcv', NULL, 14, '2025-11-02 04:48:22', '2025-11-02 04:48:22'),
(7, 'dfdsf', NULL, 14, '2025-11-02 04:50:26', '2025-11-02 04:50:26'),
(8, 'bcvbcvbcvb', NULL, 14, '2025-11-02 04:50:56', '2025-11-02 04:50:56');

-- --------------------------------------------------------

--
-- Table structure for table `group_user`
--

CREATE TABLE `group_user` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_user`
--

INSERT INTO `group_user` (`id`, `user_id`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 11, 3, NULL, NULL),
(2, 1, 3, NULL, NULL),
(3, 2, 3, NULL, NULL),
(4, 3, 3, NULL, NULL),
(5, 4, 3, NULL, NULL),
(6, 5, 3, NULL, NULL),
(7, 6, 3, NULL, NULL),
(8, 7, 3, NULL, NULL),
(9, 8, 3, NULL, NULL),
(10, 9, 3, NULL, NULL),
(11, 10, 3, NULL, NULL),
(12, 12, 3, NULL, NULL),
(13, 13, 3, NULL, NULL),
(14, 11, 4, NULL, NULL),
(15, 1, 4, NULL, NULL),
(16, 2, 4, NULL, NULL),
(17, 3, 4, NULL, NULL),
(18, 4, 4, NULL, NULL),
(19, 5, 4, NULL, NULL),
(20, 6, 4, NULL, NULL),
(21, 7, 4, NULL, NULL),
(22, 8, 4, NULL, NULL),
(23, 9, 4, NULL, NULL),
(24, 10, 4, NULL, NULL),
(25, 12, 4, NULL, NULL),
(26, 13, 4, NULL, NULL),
(27, 11, 5, NULL, NULL),
(28, 1, 5, NULL, NULL),
(29, 2, 5, NULL, NULL),
(30, 3, 5, NULL, NULL),
(31, 4, 5, NULL, NULL),
(32, 5, 5, NULL, NULL),
(33, 6, 5, NULL, NULL),
(34, 7, 5, NULL, NULL),
(35, 8, 5, NULL, NULL),
(36, 9, 5, NULL, NULL),
(37, 10, 5, NULL, NULL),
(38, 12, 5, NULL, NULL),
(39, 13, 5, NULL, NULL),
(40, 14, 6, NULL, NULL),
(41, 11, 6, NULL, NULL),
(42, 4, 6, NULL, NULL),
(43, 5, 6, NULL, NULL),
(44, 14, 7, NULL, NULL),
(45, 11, 7, NULL, NULL),
(46, 6, 7, NULL, NULL),
(47, 7, 7, NULL, NULL),
(48, 14, 8, NULL, NULL),
(49, 6, 8, NULL, NULL),
(50, 7, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `from_id` bigint UNSIGNED NOT NULL,
  `to_id` bigint UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_group` tinyint(1) DEFAULT '0',
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `from_id`, `to_id`, `message`, `is_group`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 13, 1, 'ghjg', 0, NULL, '2025-11-02 03:31:22', '2025-11-02 03:31:22'),
(2, 13, 1, 'ytry', 0, NULL, '2025-11-02 03:36:26', '2025-11-02 03:36:26'),
(3, 13, 1, 'tytry', 0, NULL, '2025-11-02 03:36:30', '2025-11-02 03:36:30'),
(4, 13, 1, NULL, 0, 'attachments/ekclU0bPuoi9n6pLF2A2dr3d4bmdqFq3TGPrInHa.jpg', '2025-11-02 03:37:16', '2025-11-02 03:37:16'),
(5, 13, 1, NULL, 0, 'attachments/uBveBUj0L4RInLm4kauoBxARJjTdbsZITHovAhhm.jpg', '2025-11-02 03:39:55', '2025-11-02 03:39:55'),
(6, 13, 1, NULL, 0, 'attachments/ecVwCTV3BbQOvEMNambK6r5dA2Z344IIt87IptBn.png', '2025-11-02 03:45:40', '2025-11-02 03:45:40'),
(7, 11, 12, 'hfgh', 0, NULL, '2025-11-02 03:48:39', '2025-11-02 03:48:39'),
(8, 11, 14, 'hi', 0, NULL, '2025-11-02 03:49:58', '2025-11-02 03:49:58'),
(9, 14, 11, 'hlw', 0, NULL, '2025-11-02 03:50:41', '2025-11-02 03:50:41'),
(10, 11, 14, NULL, 0, 'attachments/uaPEuchZ9PBxHRJZgXvJ6edBnxsNIq2IrRCDAPPB.jpg', '2025-11-02 03:50:57', '2025-11-02 03:50:57'),
(11, 14, 11, NULL, 0, 'attachments/nxgRgYLkSliXqhHNH4cLxYLgAOTqOHl3GKZGipjy.jpg', '2025-11-02 03:51:08', '2025-11-02 03:51:08'),
(12, 11, 14, NULL, 0, 'attachments/jiDlBXQk4W36KYdGejxs67GPmjX09Obx6XzxhuQb.jpg', '2025-11-02 03:57:47', '2025-11-02 03:57:47'),
(13, 14, 11, NULL, 0, 'attachments/3j9ArBcMumjrPC8PZZbj07VecgG7qgF3Hh0KHv7s.jpg', '2025-11-02 03:57:56', '2025-11-02 03:57:56'),
(14, 14, 11, 'hi', 0, NULL, '2025-11-02 03:58:02', '2025-11-02 03:58:02'),
(15, 11, 14, 'hlw', 0, NULL, '2025-11-02 03:58:06', '2025-11-02 03:58:06'),
(16, 14, 11, 'hlw hlw', 0, NULL, '2025-11-02 03:58:13', '2025-11-02 03:58:13'),
(17, 11, 14, 'hlw hlw hlw', 0, NULL, '2025-11-02 03:58:23', '2025-11-02 03:58:23'),
(18, 14, 11, 'hlw hlw hlw hlw', 0, NULL, '2025-11-02 03:58:32', '2025-11-02 03:58:32'),
(19, 14, 1, 'fdgfd', 0, NULL, '2025-11-02 04:18:26', '2025-11-02 04:18:26'),
(20, 14, 1, NULL, 0, 'attachments/zI3WxRQ8Oa7CuiaEc6lGvmlVmlwau8AMn4pbcSCB.jpg', '2025-11-02 04:18:33', '2025-11-02 04:18:33'),
(21, 14, 1, 'sdfsd', 0, NULL, '2025-11-02 04:25:13', '2025-11-02 04:25:13'),
(22, 14, 2, 'sdfsdf', 0, NULL, '2025-11-02 04:25:22', '2025-11-02 04:25:22'),
(23, 14, 2, 'sdfsdf', 0, NULL, '2025-11-02 04:25:30', '2025-11-02 04:25:30'),
(24, 14, 1, 'fgdfg', 0, NULL, '2025-11-02 04:26:41', '2025-11-02 04:26:41'),
(25, 14, 7, 'fdgfd', 0, NULL, '2025-11-02 04:27:49', '2025-11-02 04:27:49'),
(26, 14, 10, 'dfgdfg', 0, NULL, '2025-11-02 04:28:03', '2025-11-02 04:28:03'),
(27, 14, 1, 'dsfdsf', 0, NULL, '2025-11-02 04:33:12', '2025-11-02 04:33:12'),
(28, 14, 2, 'fds', 0, NULL, '2025-11-02 04:34:47', '2025-11-02 04:34:47'),
(29, 14, 1, 'sdf', 0, NULL, '2025-11-02 04:37:43', '2025-11-02 04:37:43'),
(30, 14, 4, 'dsff', 0, NULL, '2025-11-02 04:39:21', '2025-11-02 04:39:21'),
(31, 14, 3, 'dasd', 1, NULL, '2025-11-02 04:43:23', '2025-11-02 04:43:23'),
(32, 14, 6, 'sdfsdf', 1, NULL, '2025-11-02 04:48:30', '2025-11-02 04:48:30'),
(33, 14, 7, 'bcvb', 1, NULL, '2025-11-02 04:50:44', '2025-11-02 04:50:44'),
(34, 14, 8, 'hgjhgj', 1, NULL, '2025-11-02 04:51:01', '2025-11-02 04:51:01');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_02_053804_create_messages_table', 1),
(5, '2025_11_02_053815_create_groups_table', 1),
(6, '2025_11_02_053829_create_group_user_table', 1),
(7, '2025_11_02_073903_create_oauth_auth_codes_table', 2),
(8, '2025_11_02_073904_create_oauth_access_tokens_table', 2),
(9, '2025_11_02_073905_create_oauth_refresh_tokens_table', 2),
(10, '2025_11_02_073906_create_oauth_clients_table', 2),
(11, '2025_11_02_073907_create_oauth_device_codes_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` char(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('67ff4d47d4a6cc4c14b28b16e6e791d8e9a0591662b3e18b1cbc83cf6043fe29e0dfa06820fbc9d8', 11, '019a4381-9f08-727f-aa08-5afd20643b3e', 'access_token', '[]', 0, '2025-11-02 03:47:59', '2025-11-02 03:47:59', '2026-11-02 09:47:59'),
('782f69a943f2d905725e3bfd71dd3ac53c09ef7ebc1051b248a5f605a50dd6d44bc4f0de641aa340', 13, '019a4381-9f08-727f-aa08-5afd20643b3e', 'access_token', '[]', 0, '2025-11-02 03:24:37', '2025-11-02 03:24:37', '2026-11-02 09:24:37'),
('7f5a4cd5370fac91ef2d51ee7936d6cce0acc3fcd42100d10fac8ddfe2d13e74cbedc5b25baad4cc', 14, '019a4381-9f08-727f-aa08-5afd20643b3e', 'access_token', '[]', 0, '2025-11-02 03:49:38', '2025-11-02 03:49:38', '2026-11-02 09:49:38');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` char(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_uris` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `grant_types` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `owner_type`, `owner_id`, `name`, `secret`, `provider`, `redirect_uris`, `grant_types`, `revoked`, `created_at`, `updated_at`) VALUES
('019a4381-9f08-727f-aa08-5afd20643b3e', NULL, NULL, 'Laravel', '$2y$12$f/.qE80uRClbEj3KlUEDw.VBrGVN8VLfee4Ag7UfXlJ7GKTB9Ni7S', 'users', '[]', '[\"personal_access\"]', 0, '2025-11-02 01:39:19', '2025-11-02 01:39:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_device_codes`
--

CREATE TABLE `oauth_device_codes` (
  `id` char(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_code` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `user_approved_at` datetime DEFAULT NULL,
  `last_polled_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` char(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` char(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jermey Cruickshank', 'deonte.corkery@example.org', '2025-11-02 01:34:13', '$2y$12$epGbHXcksY26x1yNSYBziOtGt2rq4eIJogluDlgUleKcDILUABNjG', 'h4EBYE4qao', '2025-11-02 01:34:14', '2025-11-02 01:34:14'),
(2, 'Demetris Bashirian', 'allan.durgan@example.org', '2025-11-02 01:34:14', '$2y$12$epGbHXcksY26x1yNSYBziOtGt2rq4eIJogluDlgUleKcDILUABNjG', 'uEnaAR8mlt', '2025-11-02 01:34:14', '2025-11-02 01:34:14'),
(3, 'Miss Laura Kunze I', 'shakira17@example.net', '2025-11-02 01:34:14', '$2y$12$epGbHXcksY26x1yNSYBziOtGt2rq4eIJogluDlgUleKcDILUABNjG', 'G3Z5xPx8EQ', '2025-11-02 01:34:14', '2025-11-02 01:34:14'),
(4, 'Ward Jakubowski', 'ashlynn99@example.org', '2025-11-02 01:34:14', '$2y$12$epGbHXcksY26x1yNSYBziOtGt2rq4eIJogluDlgUleKcDILUABNjG', 'wSgdye95TR', '2025-11-02 01:34:14', '2025-11-02 01:34:14'),
(5, 'Jensen Dibbert', 'ikihn@example.net', '2025-11-02 01:34:14', '$2y$12$epGbHXcksY26x1yNSYBziOtGt2rq4eIJogluDlgUleKcDILUABNjG', 'gAkVI30Ars', '2025-11-02 01:34:14', '2025-11-02 01:34:14'),
(6, 'Cameron Greenfelder', 'grace.willms@example.net', '2025-11-02 01:34:14', '$2y$12$epGbHXcksY26x1yNSYBziOtGt2rq4eIJogluDlgUleKcDILUABNjG', 'I8iIFanFUF', '2025-11-02 01:34:14', '2025-11-02 01:34:14'),
(7, 'Joaquin Kulas', 'runolfsdottir.karlee@example.com', '2025-11-02 01:34:14', '$2y$12$epGbHXcksY26x1yNSYBziOtGt2rq4eIJogluDlgUleKcDILUABNjG', 'xCISYdMXOZ', '2025-11-02 01:34:14', '2025-11-02 01:34:14'),
(8, 'Prof. Nat Lueilwitz', 'linnie.konopelski@example.net', '2025-11-02 01:34:14', '$2y$12$epGbHXcksY26x1yNSYBziOtGt2rq4eIJogluDlgUleKcDILUABNjG', 'KdyRYB5D6a', '2025-11-02 01:34:14', '2025-11-02 01:34:14'),
(9, 'Prof. Eunice Turcotte', 'mcglynn.clinton@example.net', '2025-11-02 01:34:14', '$2y$12$epGbHXcksY26x1yNSYBziOtGt2rq4eIJogluDlgUleKcDILUABNjG', 'UcwbNagCVg', '2025-11-02 01:34:14', '2025-11-02 01:34:14'),
(10, 'Josh Moore', 'adriana23@example.com', '2025-11-02 01:34:14', '$2y$12$epGbHXcksY26x1yNSYBziOtGt2rq4eIJogluDlgUleKcDILUABNjG', 'MwFhfoV8yt', '2025-11-02 01:34:14', '2025-11-02 01:34:14'),
(11, 'Minhazul Islam', 'devloperminhazul@gmail.com', NULL, '$2y$12$n3v3aPA0xBgjHkylJEgnl.vtL/aXA7TX68hn1P6LqrulKxujJyAHy', NULL, '2025-11-02 01:37:49', '2025-11-02 01:37:49'),
(12, 'Minhazul Islam', 'devloperminhazul3@gmail.com', NULL, '$2y$12$J5spdeH3dYUcpIIG6bYd9OSKxK521kqsLe8D5kxjeg9UqLtZWOxO6', NULL, '2025-11-02 01:39:37', '2025-11-02 01:39:37'),
(13, 'Minhazul Islam', 'devloperminhazul39@gmail.com', NULL, '$2y$12$pxlQSXA/tQeWeszc7l024egtDu.7uCdCD3/nrWS7XiO/iA9v76OTS', NULL, '2025-11-02 03:24:36', '2025-11-02 03:24:36'),
(14, 'New', 'new@gmail.com', NULL, '$2y$12$Y7kDG9WTj4xtnDt8cIlMPOT1Ik.P5wUPdHny2pVzGJoNLptJgEZ4C', NULL, '2025-11-02 03:49:38', '2025-11-02 03:49:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_user`
--
ALTER TABLE `group_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_owner_type_owner_id_index` (`owner_type`,`owner_id`);

--
-- Indexes for table `oauth_device_codes`
--
ALTER TABLE `oauth_device_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oauth_device_codes_user_code_unique` (`user_code`),
  ADD KEY `oauth_device_codes_user_id_index` (`user_id`),
  ADD KEY `oauth_device_codes_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `group_user`
--
ALTER TABLE `group_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
