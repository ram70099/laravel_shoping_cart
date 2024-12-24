-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2024 at 07:54 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_shoping`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(18, 43, 59, 1, '2024-12-16 03:34:52', '2024-12-16 03:34:52'),
(19, 43, 44, 1, '2024-12-16 03:34:59', '2024-12-16 03:34:59'),
(20, 43, 40, 1, '2024-12-16 03:35:26', '2024-12-16 03:35:26'),
(21, 43, 48, 1, '2024-12-16 04:57:20', '2024-12-16 04:57:20'),
(22, 43, 39, 1, '2024-12-16 05:09:00', '2024-12-16 05:09:00'),
(23, 43, 49, 1, '2024-12-16 05:17:54', '2024-12-16 05:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categoryname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categoryname`) VALUES
(1, 'Shirts'),
(2, 'Jeans'),
(3, 'Denim Shirt\n'),
(4, 'Sleepwear'),
(5, 'Sportswear'),
(6, 'Jumpsuits'),
(7, 'Blazers'),
(8, 'Jackets'),
(9, 'Shoes');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(4, '0001_01_01_000001_create_cache_table', 2),
(5, '0001_01_01_000002_create_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(5, 43, 42, 1, 42.00, '2024-12-16 05:19:24', '2024-12-16 05:19:24'),
(6, 43, 37, 1, 25555.00, '2024-12-16 05:20:12', '2024-12-16 05:20:12'),
(7, 43, 57, 2, 250.00, '2024-12-16 05:28:23', '2024-12-16 05:28:26'),
(8, 43, 49, 1, 250.00, '2024-12-16 05:28:30', '2024-12-16 05:28:30'),
(9, 43, 47, 6, 250.00, '2024-12-16 05:28:43', '2024-12-16 05:40:40'),
(10, 43, 48, 4, 250.00, '2024-12-16 05:52:49', '2024-12-16 05:56:03'),
(11, 43, 35, 4, 130.00, '2024-12-16 05:58:43', '2024-12-16 06:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 43, 'laravel_api', 'd394ccdeae00e7063f43ae626b208f695c3e0f395acc5a7a64c309a43ed8309b', '[\"*\"]', NULL, NULL, '2024-12-13 03:28:13', '2024-12-13 03:28:13'),
(2, 'App\\Models\\User', 50, 'YourAppName', 'b02f2d47cca88ca7e543cca7835943e654c030bd9e09cde7e9bd5349f34174d6', '[\"*\"]', NULL, NULL, '2024-12-16 00:27:52', '2024-12-16 00:27:52'),
(3, 'App\\Models\\User', 50, 'YourAppName', 'f0b28b7b1f7dcf74609413ccae1a795daf70ca749603bdc2f8d6e3fb67f92fab', '[\"*\"]', NULL, NULL, '2024-12-16 00:28:26', '2024-12-16 00:28:26'),
(4, 'App\\Models\\User', 51, 'YourAppName', '9bc27b1a7ab95f09d33b8b704bb0953f2f6e57cbceec5072b83afbdd2e0ca8bc', '[\"*\"]', NULL, NULL, '2024-12-16 00:29:08', '2024-12-16 00:29:08'),
(5, 'App\\Models\\User', 52, 'access_token', '11d1bce430587c8bd6755e990e806b10686a9c928f6227dd24172351c629621f', '[\"*\"]', NULL, NULL, '2024-12-16 01:54:58', '2024-12-16 01:54:58'),
(6, 'App\\Models\\User', 51, 'YourAppName', '67b3d1456b46de252db98d004d0396bbc185367226763c5869c6d6d10aebbdc6', '[\"*\"]', NULL, NULL, '2024-12-16 03:04:33', '2024-12-16 03:04:33'),
(7, 'App\\Models\\User', 51, 'YourAppName', 'dc04bec0723c1807ca16379c70bbc0241de16b00493b10c9c5ecbb9c9bdaa0b6', '[\"*\"]', '2024-12-16 03:23:21', NULL, '2024-12-16 03:06:30', '2024-12-16 03:23:21'),
(8, 'App\\Models\\User', 51, 'YourAppName', 'c8534867e5334322861470bd796edb97c860a8584eec5fd83e19ba87ebabb39b', '[\"*\"]', '2024-12-16 03:23:54', NULL, '2024-12-16 03:23:49', '2024-12-16 03:23:54'),
(9, 'App\\Models\\User', 43, 'laravel_api', '9f28d3f94cc1465972c7c89d8969a0e584f5a5d9ab2c22e486b8fce06cf5629d', '[\"*\"]', '2024-12-16 06:01:13', NULL, '2024-12-16 03:34:47', '2024-12-16 06:01:13'),
(10, 'App\\Models\\User', 54, 'YourAppName', '2ce2f70a1dbd7e37165e36b7e0bc6bb1a4823466dba1278e23677c4099cbefbf', '[\"*\"]', NULL, NULL, '2024-12-23 01:24:09', '2024-12-23 01:24:09'),
(11, 'App\\Models\\User', 52, 'access_token', 'df8ebd7d2e700e3de643508f67bf0234fbf5c1771991121b7b08b92c81baff05', '[\"*\"]', NULL, NULL, '2024-12-23 05:46:02', '2024-12-23 05:46:02'),
(12, 'App\\Models\\User', 54, 'YourAppName', 'addf72616a323d8d9de5d766aed107a55e33dd8b614c3c6bfc9a577c13ad423e', '[\"*\"]', NULL, NULL, '2024-12-23 05:47:38', '2024-12-23 05:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `pdescription` text NOT NULL,
  `price` varchar(255) NOT NULL,
  `pstock` int(11) NOT NULL,
  `pimage` varchar(255) NOT NULL,
  `ordered` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `pname`, `pdescription`, `price`, `pstock`, `pimage`, `ordered`, `updated_at`) VALUES
(34, 1, 'Colorful Stylish Jacket', 'A stylish and colorful shirt.', '123.00', 99, 'img/product-1.jpg', 0, '2024-12-09 04:56:19'),
(35, 1, 'Colorful Stylish Cloth', 'A stylish and colorful shirt.', '130.00', 95, 'img/product-2.jpg', 3, '2024-12-16 06:01:13'),
(36, 1, 'Colorful Stylish Jean', 'A stylish and colorful shirt.', '150.00', 100, 'img/product-3.jpg', 0, '2024-12-09 10:25:30'),
(37, 2, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '25555', 9999, 'img/product-4.jpg', 0, '2024-12-16 05:20:12'),
(38, 2, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '4545.00', 9800, 'img/product-5.jpg', 1, '2024-12-11 10:37:04'),
(39, 2, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 100, 'img/product-6.jpg', 0, '2024-12-09 10:25:30'),
(40, 3, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 100, 'img/product-7.jpg', 0, '2024-12-09 10:25:30'),
(41, 3, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 99, 'img/product-8.jpg', 0, '2024-12-09 23:32:00'),
(42, 3, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 98, 'img/product-9.jpg', 0, '2024-12-16 05:19:24'),
(43, 4, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 99, 'img/product-10.jpg', 0, '2024-12-09 04:55:43'),
(44, 4, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 100, 'img/product-11.jpg', 0, '2024-12-09 10:25:30'),
(45, 4, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 99, 'img/product-12.jpg', 0, '2024-12-16 05:18:35'),
(46, 5, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 100, 'img/product-13.jpg', 0, '2024-12-09 10:25:30'),
(47, 5, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 94, 'img/product-14.jpg', 5, '2024-12-16 05:40:40'),
(48, 5, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 96, 'img/product-15.jpg', 3, '2024-12-16 05:56:03'),
(49, 6, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 99, 'img/product-16.jpg', 0, '2024-12-16 05:28:30'),
(50, 6, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 100, 'img/product-17.jpg', 0, '2024-12-09 10:25:30'),
(51, 6, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 100, 'img/product-18.jpg', 0, '2024-12-09 10:25:30'),
(52, 7, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 90, 'img/product-19.jpg', 0, '2024-12-09 23:55:36'),
(53, 7, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 100, 'img/product-20.jpg', 0, '2024-12-09 10:25:30'),
(54, 7, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 90, 'img/product-21.jpg', 0, '2024-12-09 05:46:00'),
(55, 8, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 100, 'img/product-22.jpg', 0, '2024-12-09 10:25:30'),
(56, 8, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 100, 'img/product-23.jpg', 0, '2024-12-09 10:25:30'),
(57, 8, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 97, 'img/product-24.jpg', 1, '2024-12-16 05:28:26'),
(58, 9, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 100, 'img/product-25.jpg', 0, '2024-12-09 10:25:30'),
(59, 9, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 100, 'img/product-26.jpg', 0, '2024-12-09 10:25:30'),
(60, 9, 'Colorful Stylish Cloth', 'A stylish and colorful Cloth.', '250.00', 93, 'img/product-27.jpg', 5, '2024-12-10 00:55:28');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0p3eZec4A4lqvF4jubRf9uDS1FY01uJ342zc0LoY', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHBpSjE1OWhIVTlHZDRBUFNlVkRndzFUVG0yOXl6eU5uSVF1ZjEyRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL2NhdGVnb3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733979862),
('3KkR0hSRGwzGT36DPRV4sXHL3uB6hET82CK8mfs9', NULL, '::1', 'PostmanRuntime/7.39.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVh1VWRnckxYMk5yQ1pZSzh4UXlzemNuNk93QTlIUjRkUHhqTFk2QiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL2NhdGVnb3J5Ijt9fQ==', 1733981446),
('4rMSIsebnIQA6Nk0EbpgvSrwHhctK0cGI95oxob6', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWt1NWlhWHN6bll2R0drR2RsVUtvZlhNN2UzeHBDRFFEeGUzamZ1TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL2NhdGVnb3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977444),
('5E59j6Zdk0xoUvMp4j7R7AOeuOn56DbWLLDWQRlu', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUG1LYUNOWVlsNFc0c2xoOEJJODBxZVZLVWhYdlQ3WjJCd2k5SUNubCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977962),
('5yRyjl5VEYKrpSSzaiWPRGnSMJFNvZ4dCewOUMkN', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicVd2R1VBTnpjYjNnOGlHREo2dmRqTk1ub3Jnb2prYjRNUEN2TXJKRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733979032),
('6BzB2vLRfVGyvURJ8GsaMyfJnqgdxtUkJ28X1yZo', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRzZ1RUJDYzBxQ0lDMUhRVG05Y0lFMFo2eVBYelZ3RVhCTEdzdDlWUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733981466),
('a3GQDUdSU0EbWkBqW5hmH186wfKwVlE3iqUL6Tmp', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTHZqT0VFc2pJbk1tb1dMTVVHa0xCT3FaUTFNZ1FUVTExMm1EM0k1SSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733981678),
('ABzQK3WtvTaQTHvXp6KGMapRLU4WJEbqP1W8rlUB', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNG1Lb1NxUE01NmZCVkxmN2tqbUtKZ3ZCR0pVdnlmOWJMcUluMDZvRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733978667),
('AK8mmhoeSYdPrF0SbR338MfmjRAyak78W1Cy9Ewg', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUVKTTFIbHhpc1V4bmlMRUVheTk1M3pFZThoTjFLSGFBczdrZUNKWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL2NhdGVnb3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977906),
('Au2crfpQr3yMTBzTyByrkAsVHwgBaiP764yjer9Z', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMEh0VnZqUVc2bDlxM2JVMlBZZjdCcVNYME9EOXBWNzIxNVVHTEF0ZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733979021),
('Aud14pFwIT46kXYpv5D5xqPvWIWir4qnrV5pAazz', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRmp4c2F6WEpLNUFFSFNmbldZVUVyOUJLWG94ckZYamtkNHNIb2dIUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977911),
('b5IV0Hu9UqedHCBlBPbOBxOZkJ9H3EE3j819EH0O', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFNYdDgwWm5ma1BOWWl0S2lpNDFFOUgyT3F4QzBBWm9GZHhWeDM2TyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL2NhdGVnb3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733980820),
('b6XqvFtjiDPfE8xG6G4cvw3kPapaMoNK6RSZY72g', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicGhzQnlOVWpzU3FBUkxKZ2FMWmVLeUxlWDRJRzBCYWNJWmk1Y0tNUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977822),
('BlvnVuglGiqjfMsGxC6HN9G41rkXKMIdb3aLGWgU', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUdka0dpUXlJQWdBcnhxU2dBVml1bFlUYnJaVTZERlBrOWxMdmwwYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL2NhdGVnb3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733981460),
('cD6rLL637xKW1onLOKzQ0MNPOTSvyb6FSBdfazg2', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDZSanNkRG1QVzA3Ykd0VzdxUnRHMTJHNUlVTktmaVRQRDdSS29kNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL2NhdGVnb3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977432),
('CgeqSD1dlEsti02lTN1Kzjk4L5sblA9lmo9byLah', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYUVpYTlpWGFjTGU1VVJmV1NZSXdodHFXckljT2VPczVOdURWUFdWbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733978656),
('eaTonXolQddSfRcWgEjvojTZmtuYlcUemhqwen9J', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZHdDZ0p1Uzc3Q0RtRlhDVXl1MmNtQ2dXZDZqcmcxMUlHbDM2NWl6SCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733979620),
('G6NumgGmZkztJvoKg2mpcafEgBrAS0khLW2HRwQD', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiODM1Zk5tYTN6alB3NHJDb2N3NFJEZHZhV0N1cGNyUXFaekpXNXZUYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733979644),
('GdUGsWrnqvx2bVbJUpDth8uOprrSf84cI1tREbG8', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZDVCSmsyMEE4SlhFajVjVHZvQ3VRd29PQWRQeFBUdTI0NlFrbXpMNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733979025),
('gZLUkIi36aV95GAs0f0fGTnd1O0dBFsMxU4NN0XW', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFpHdmNKYWMzZTdmNWRKWVh1UlIwaDJIaTZHWWZ1eU1vN1JVUDkyQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL2NhdGVnb3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977438),
('gZMcRgOtpHHsIdi7rdNdrvvlRw7hKyL7SAltIoEP', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVWhUa3h6bXBtTGp0Q0hQS1E0UzVkTXlWR3RlNmlMUFhFMFZvR1k4VyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733979367),
('H0cvd0v4I387kVFxyyOJnou3MQo82iUDIvhro79F', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGF0R01yMFRsbUdEQTBVMmFuOVB0REFzZ1M5YXNEbThCOUdNR3hLVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL2NhdGVnb3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977434),
('kvJ8Exx1xa2zMmlQ4Xq1N6MIf6GV0DAWJkTbTrXY', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkFlWGt4TGlmREJCVVc0N0hzWE9qZEd3ZXJyNlh0a2VSM2l2b1JJYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL3Byb2R1Y3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977444),
('oKJ5YfKHAIMWnP3xSBaKflbxxuD8znKJH1Q8Gf2L', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidnJjaDRrU0pPUXdGcHg2VjE3OU9VbUR0ZWhmQnhiMnhUYm9qekl2MiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733978354),
('oO3U213B7k1bEkVqkhjkm84FJ2AXyVz6nho2NLoI', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDZBT203U1VaV05zVmt3cTd2Q3pyaHdyQU96eTlpUTNzVjhJR0JnZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL2NhdGVnb3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977448),
('pOMr1D7iW7lIFwJn4IzyWsVGr3VV0bF2Qvz2KIO7', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZlZXOTh1YlV4alZuSXFMV3B4azMxbEljZ1Uxb1k2Rkg2YjQwMUlaRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733979654),
('q4uGBDgTbeLBvB1SXwrlTXYs4B103iwOtVhDihcP', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNHpHZkRHTEVuVG01UDZyOTRNTE80QzlNbUV6cEdPN0FMbU9OUG8xTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733978257),
('QeFaInjxIeAPjrEQzUkBPZKR56I9ovwJrICO9EHm', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSVVjMWd1eGtiSTVIYUxCM3Y0MFN1cUp3YUR3cm85cG1iRzA0VnIzcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733979259),
('qG36AebpDtXn5PxIMyKWl4ETcDrTveHvgaAfJqik', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTldsR0pqUkJLeHY3SWl6VVBQR2RNZjdKcTdyTnlXMnVDYTJKdGZCQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL2NhdGVnb3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977435),
('rFwpesKhfCoJ7aVMuUhNgF2z9vZQwQHrImXoETS1', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoia3BxaWwxUG9WeFlET3BNOEZqZEhhREpEdE91YnZWVVhJSjJtU1lDZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733979234),
('SnP9bylqP2jgL6znDFPOd1jXspeNtitl2IlNuWs8', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOTA2dHRIQUk3ZUR4NjVSTW9yUE00RXlxN1VaWFJCclBJSjhQT3BKZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733981459),
('TGsUH8gWcP5vMBPepcbujtGbVUs0hBiO1PkGcXEf', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2cydWhZZzhyRHJyampxRkc4RHc4QllmYTV4OWlUblAzNmpoMnZqQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL2NhdGVnb3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977442),
('tpFlejdqlqN8AoS3FOgNloweFgUj51v36cZR6qi0', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ3FsRWlqRG05TXc3V3c2Y2w0cnp6ZGJHNW5SQ3hTd3RDY3VacjBTSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733979698),
('ts35BV7tFrrugvdvEjg8soG29UfCcZErXs60Ywd0', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjZFMlVaVXlTNHJ1cmoybGtQbDlnbjVtRlJCc241cGFmaHNUR0VxVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL2NhdGVnb3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977905),
('wq5HFrtQU0k1Ge4tMH9MV3xax7HSsAsUF4TPHk78', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWktPUUxSZFJMQmNlVHJNNUwxenhoNjg5N016MjBOalpuakFUOUdmUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL3Byb2R1Y3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977438),
('WrUPhdio4IFTgIPYKvtEUsW4jLp4COZ05804NVAp', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXZhbkZ4cThrbVIxTVlqWFZESW05aDU0UVFPcnNsZks2cUhBYVlBcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL2NhdGVnb3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977432),
('x67QC0IxOQCPXEkOBBWikA15kX6xUMFcsZRTu6xF', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTFLSGxTMzhmNzl5V285N0NTaFZ5TG1wYnRrbFF1SExvQVRjTTdlWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODM6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977704),
('xlOt67n9mG38LvEx7yIZIKW1i5a4sz7PrtQHA5AI', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmJwSXFvY2l1aXJmUEo5NnJIakJ1aDBpcjMyaVd4OHVNdk8zZ2RPWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL3Byb2R1Y3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733977432),
('Yp07XL0XZcl6oCOob0kXOfXK5r3vwerwN1iKbtCx', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiajFKV0lyczVpVVNFYmlhVUhBaU9OQVhMcVM5T3Boak80WVNlQjZ1aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL3Byb2R1Y3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733980820),
('YyhqnxnrpoWZuxvhV0GayiLDX5l49ykhS3qzkLkP', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZU9oUjNabnRYa0VHdko1YlV2bllmMUQ0NHMxajhSTm9CQ1hRRGs3byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly9sb2NhbGhvc3QvTGVhcm5pbmcucGhwL0xhcmF2ZWxfcHJvamVjdC9sYXJhdmVsX3Nob3BpbmdfY2FydC9wdWJsaWMvYXBpL2NhdGVnb3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733979856),
('zufa2egNa91yTKkghp0YP4OBB9NATksxdSvWCLNo', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRTQ3VmhwVGZHSmF0U3dvcmdWem14N2dPUGtGMmJtUExlbTlJYUFZdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1733978444);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(255) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(43, 'ram', 'raviking2311@gmail.com', NULL, '$2y$12$0oXkn7adDrcZVvEGM/dbQ.1i2JsMcNWDU0CNISUHL0EZuV/h2.Zc2', NULL, '2024-12-13 00:06:30', '2024-12-13 00:06:30'),
(52, 'Guriya', 'shahguriya610@gmail.com', NULL, '$2y$12$H4lxKAk4p01nzDOFCNtNdeRgiXSVNCraLMXujjNXvMkXtjvOFjaD6', NULL, '2024-12-16 01:54:58', '2024-12-16 01:54:58'),
(54, 'ram', 'ramrattan099@gmail.com', NULL, '$2y$12$/bAD.G8Y4Pvc0g3h2u4OIer18UpTalEhD3h2nApoxRnTNGbxbGMeK', NULL, '2024-12-23 00:05:28', '2024-12-23 00:05:28');

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
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
