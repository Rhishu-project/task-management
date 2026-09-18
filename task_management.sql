-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2026 at 03:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_09_11_070637_create_personal_access_tokens_table', 2),
(5, '2026_09_11_071602_create_tasks_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'api-token', 'a1c8de459ee3b291c8432d3d98c34bbad29bffa58faf7500f761c9804c0c545c', '[\"*\"]', NULL, NULL, '2026-09-11 02:19:35', '2026-09-11 02:19:35'),
(3, 'App\\Models\\User', 3, 'api-token', '0e3d6d326b5f831c709fb006b54dd077167c731f4426331536d65877b2d63b24', '[\"*\"]', NULL, NULL, '2026-09-11 02:32:54', '2026-09-11 02:32:54'),
(4, 'App\\Models\\User', 3, 'api-token', 'b32c0b64c708df536220ac4e7f98c60ffffc9cbfde4944b4db2524aedcd5f464', '[\"*\"]', '2026-09-11 07:34:54', NULL, '2026-09-11 02:37:13', '2026-09-11 07:34:54'),
(5, 'App\\Models\\User', 4, 'api-token', '96ed54765553924a71618ddd4178c8760870ebc03ce58e77d9b784e10cafe17d', '[\"*\"]', NULL, NULL, '2026-09-11 05:17:52', '2026-09-11 05:17:52'),
(6, 'App\\Models\\User', 5, 'api-token', '4b9ca3493b9dabceb1f681d1b18c00bde3cc556a09d2d6098c8ca89c5bc35036', '[\"*\"]', NULL, NULL, '2026-09-11 05:23:16', '2026-09-11 05:23:16'),
(7, 'App\\Models\\User', 6, 'api-token', '0eb17f2bb5bd6bf25d00270da902319025a4bf0a96eae113479a61033744da40', '[\"*\"]', NULL, NULL, '2026-09-11 05:34:45', '2026-09-11 05:34:45'),
(8, 'App\\Models\\User', 7, 'api-token', '4c2a179aa3d2e0ae90331e6448aa4d6495ab2aa2bf3b795ec5627fafab6e9137', '[\"*\"]', NULL, NULL, '2026-09-11 05:39:56', '2026-09-11 05:39:56'),
(9, 'App\\Models\\User', 4, 'api-token', '01281ac79a3a065d557a8a44159ca85fc114159090c4507295566752f668bad9', '[\"*\"]', NULL, NULL, '2026-09-11 05:41:00', '2026-09-11 05:41:00'),
(10, 'App\\Models\\User', 4, 'api-token', '80b2840a384ec809e8b4547097f6d99269483f120c772875a566d267ef4aea0b', '[\"*\"]', NULL, NULL, '2026-09-11 05:41:09', '2026-09-11 05:41:09'),
(11, 'App\\Models\\User', 4, 'api-token', 'c675e5d192c9e70fbce39372aa20865bbbbc273691ac8e85781db13e4aaa64a3', '[\"*\"]', NULL, NULL, '2026-09-11 05:44:31', '2026-09-11 05:44:31'),
(12, 'App\\Models\\User', 4, 'api-token', 'aa2195714f6f9c0794c90edd7f5ca3cd9b5fcd39986ff5cadf337cdaee5f2483', '[\"*\"]', NULL, NULL, '2026-09-11 05:47:35', '2026-09-11 05:47:35'),
(13, 'App\\Models\\User', 4, 'api-token', '89a4687c77d5a09e2e504a2611269f76a560125e41ac79b512aa1aca29cfeb9e', '[\"*\"]', NULL, NULL, '2026-09-11 06:01:26', '2026-09-11 06:01:26'),
(14, 'App\\Models\\User', 4, 'api-token', 'f1e9179add5ab0356f842201e3460107ad7badf69bdc12c12670f0255cf37c04', '[\"*\"]', NULL, NULL, '2026-09-11 06:05:08', '2026-09-11 06:05:08'),
(15, 'App\\Models\\User', 4, 'api-token', 'dfc6bbd56fc86e6188fa9604027914216e50ab783b6ec6659867b84c62f8dd2f', '[\"*\"]', NULL, NULL, '2026-09-11 06:09:30', '2026-09-11 06:09:30'),
(16, 'App\\Models\\User', 4, 'api-token', '41ce2580edaa80536aa363c14e71894b95ae812f985c11ac2ca98880bfe3295d', '[\"*\"]', NULL, NULL, '2026-09-11 06:09:38', '2026-09-11 06:09:38'),
(17, 'App\\Models\\User', 4, 'api-token', '61e45e084409af7208b41df7f5af290a9ad7889db7f7e59a57a47da9d9dcec19', '[\"*\"]', NULL, NULL, '2026-09-11 06:11:36', '2026-09-11 06:11:36'),
(18, 'App\\Models\\User', 4, 'api-token', 'ecacbb183b3128cf1c4ccf4b7ff572cf131d3335d5fd04234adaec510718c08e', '[\"*\"]', NULL, NULL, '2026-09-11 06:11:37', '2026-09-11 06:11:37'),
(19, 'App\\Models\\User', 4, 'api-token', '03200b8a8a7def284f01197d9b176d2aa4b726b455f104e92ecd08627c85afea', '[\"*\"]', NULL, NULL, '2026-09-11 06:11:38', '2026-09-11 06:11:38'),
(20, 'App\\Models\\User', 4, 'api-token', '5802166d1ccb37ad2bb60892fb4ac8cb06df1c69469c92acd22d8afa25f58ec3', '[\"*\"]', NULL, NULL, '2026-09-11 06:11:39', '2026-09-11 06:11:39'),
(21, 'App\\Models\\User', 4, 'api-token', '0fd0195d161dd412a44fff455516a8b4538597ad78173b878b1ffa5ad3575a73', '[\"*\"]', NULL, NULL, '2026-09-11 06:11:40', '2026-09-11 06:11:40'),
(22, 'App\\Models\\User', 4, 'api-token', '773d5be6e46784f1e6efc41466637fdc0729202f803e355b30a14b16d827819f', '[\"*\"]', NULL, NULL, '2026-09-11 06:11:42', '2026-09-11 06:11:42'),
(23, 'App\\Models\\User', 4, 'api-token', '31d22a28ad72134d690b6c9b9b8b80d351aa43b43408690c37a51a906289ecd5', '[\"*\"]', NULL, NULL, '2026-09-11 06:11:42', '2026-09-11 06:11:42'),
(24, 'App\\Models\\User', 4, 'api-token', '8000dda9754a119eed46fb671f377a037b84a3e01e5fb3e75b6454512aa7b91b', '[\"*\"]', NULL, NULL, '2026-09-11 06:11:43', '2026-09-11 06:11:43'),
(25, 'App\\Models\\User', 4, 'api-token', 'd13be8001b7028169c7f1b09fffff12fc899aae98da7f46786bc4bdfe933aad6', '[\"*\"]', NULL, NULL, '2026-09-11 06:11:44', '2026-09-11 06:11:44'),
(26, 'App\\Models\\User', 4, 'api-token', 'c933e1c16e58e267cb4873b6d9eb380b84c7c1fe9787c4c84749da3a3d4dcc31', '[\"*\"]', NULL, NULL, '2026-09-11 06:11:44', '2026-09-11 06:11:44'),
(27, 'App\\Models\\User', 4, 'api-token', '4d5fd9cdfdab3fe937821ecd989341806fe6fb5ed0424a49e769b7c49ff7049e', '[\"*\"]', NULL, NULL, '2026-09-11 06:11:45', '2026-09-11 06:11:45'),
(28, 'App\\Models\\User', 4, 'api-token', 'c4656b66ba7b32c5ee79cc5d7a58f85222cf613a7d82b662a798b1e43bb36273', '[\"*\"]', NULL, NULL, '2026-09-11 06:11:46', '2026-09-11 06:11:46'),
(29, 'App\\Models\\User', 4, 'api-token', '26a3ac80d5188d2a97122c871851a6e0d01e1d7550702b455b81b6899c72ecbb', '[\"*\"]', NULL, NULL, '2026-09-11 06:15:50', '2026-09-11 06:15:50'),
(30, 'App\\Models\\User', 4, 'api-token', 'a7d51767ddd73f491f723105e98f22ea07f7c88f0748c3d0d460efa660a77fdd', '[\"*\"]', '2026-09-11 06:57:30', NULL, '2026-09-11 06:16:29', '2026-09-11 06:57:30'),
(31, 'App\\Models\\User', 4, 'api-token', '840224748237dfaa3299754c731ba92e5c344e1582c06253fcf14b61aba4d934', '[\"*\"]', '2026-09-11 08:03:17', NULL, '2026-09-11 07:07:00', '2026-09-11 08:03:17');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('D6E90GxtWsgZqMesnJrnk07OoFpRacwFAuLQ1VMf', NULL, '127.0.0.1', 'PostmanRuntime/7.53.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT25NUUM5aWZqSnZ4SUVUd2k4MHB4Tm1Yd2tSTU4yelV5b3AyZzkwaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789112477),
('ftP2Uf0oFyAoMAqhraOXrcrjDwfGtpXMP8VKD0LJ', NULL, '127.0.0.1', 'PostmanRuntime/7.53.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEltdkdROEV0RU5SYXh5YkdWcGcxbWNFZ3ZVMlhwMXBQSUt6czNSSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789112748);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('pending','in_progress','completed') NOT NULL DEFAULT 'pending',
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `status`, `due_date`, `created_at`, `updated_at`) VALUES
(1, 4, 'personal profile', 'Complete Laravel assessment', 'completed', '2026-09-15', '2026-09-11 02:37:32', '2026-09-11 02:49:31'),
(2, 4, 'React Assessment', 'Complete React assessment', 'completed', '2026-09-15', '2026-09-11 02:38:03', '2026-09-11 08:02:51'),
(4, 4, 'DSA Assessment', 'Complete DSA assessment', 'pending', '2026-09-15', '2026-09-11 02:38:25', '2026-09-11 02:38:25'),
(5, 4, 'sample', 'testing purpose', 'pending', '2026-09-18', '2026-09-11 06:48:50', '2026-09-11 07:30:40'),
(7, 4, 'tast 2', 'sample task', 'pending', '2026-09-11', '2026-09-11 07:32:28', '2026-09-11 07:32:28'),
(8, 4, 'task 3', 'test', 'pending', '2026-09-11', '2026-09-11 07:32:43', '2026-09-11 07:32:43'),
(9, 4, 'task 4', 'as', 'pending', '2026-09-11', '2026-09-11 07:32:58', '2026-09-11 07:32:58'),
(10, 4, 'machine learning', 'Complete DSA assessment', 'pending', '2026-09-15', '2026-09-11 07:34:19', '2026-09-11 07:34:19'),
(11, 4, 'data learning', 'Complete DSA assessment', 'pending', '2026-09-15', '2026-09-11 07:34:27', '2026-09-11 07:34:27'),
(12, 4, 'physics', 'Complete DSA assessment', 'pending', '2026-09-15', '2026-09-11 07:34:34', '2026-09-11 07:34:34'),
(13, 4, 'home science', 'Complete DSA assessment', 'pending', '2026-09-15', '2026-09-11 07:34:44', '2026-09-11 07:34:44'),
(14, 4, 'basics', 'Complete DSA assessment', 'in_progress', '2026-09-15', '2026-09-11 07:34:54', '2026-09-11 07:50:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Rhishabh', 'rhishabh@example.com', NULL, '$2y$12$u4QbDT7FtDMYusW8ezWNtOld34kURpnGO1jZuxrm0qaNBT2yqn3f2', NULL, '2026-09-11 02:19:35', '2026-09-11 02:19:35'),
(4, 'rhishabh', 'manu@gmail.com', NULL, '$2y$12$5xifDXgyrJfFfZbge.HcIuXnmakVEkUuzPSBTg.Z6BKbDvglJHyrS', NULL, '2026-09-11 05:17:52', '2026-09-11 05:17:52'),
(5, 'rhishabh', 'manu1@gmail.com', NULL, '$2y$12$9EpdQPWes6soZr2xG2VgQumKrUN0oECJX0wEz/SsQCoPYVYLVClKC', NULL, '2026-09-11 05:23:16', '2026-09-11 05:23:16'),
(6, 'rhishabh', 'manu12@gmail.com', NULL, '$2y$12$tlKR9uAp45LKQDPvforvYuOlY8hvLNGWLdUwYk/u6nyUENFwadH46', NULL, '2026-09-11 05:34:45', '2026-09-11 05:34:45'),
(7, 'manu', 'manu123@gmail.com', NULL, '$2y$12$gDveZ4WawgclH13kv1hDOOX0Mjrx4BYvu7fMO2h5MjhEpSz6sTbaS', NULL, '2026-09-11 05:39:56', '2026-09-11 05:39:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

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
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_status_index` (`user_id`,`status`),
  ADD KEY `tasks_due_date_index` (`due_date`);

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
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
