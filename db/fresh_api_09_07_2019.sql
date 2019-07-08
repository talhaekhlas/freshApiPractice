-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2019 at 07:27 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fresh_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Pabna', 1, NULL, NULL),
(2, 'Dhaka', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_07_08_053127_create_districts_table', 2),
(4, '2019_07_08_053322_create_thanas_table', 2),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 3),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 3),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 3),
(8, '2016_06_01_000004_create_oauth_clients_table', 3),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 3),
(10, '2019_07_08_165000_create_todo_lists_table', 4),
(11, '2019_07_08_171640_create_todos_table', 5),
(12, '2019_07_08_172100_create_todos_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('ff38648cc15247af8e83b73e31b50969e90c7d4b17e5d426e6fa351234f753b71e584f48702b3448', 1, 2, NULL, '[]', 0, '2019-07-08 22:23:00', '2019-07-08 22:23:00', '2020-07-08 15:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'OyTiPFjv7wwNckASfnBe0MaJzhwMXXC0s3VygXx5', 'http://localhost', 1, 0, 0, '2019-07-08 22:02:32', '2019-07-08 22:02:32'),
(2, NULL, 'Laravel Password Grant Client', 'nU5q6omuuqO8he5JRCobTHEF3fI0GDg0rAFbXaZ0', 'http://localhost', 0, 1, 0, '2019-07-08 22:02:32', '2019-07-08 22:02:32');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-07-08 22:02:32', '2019-07-08 22:02:32');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('6d24c915254fd920368a3c7e34d45b597d0c78734e7bc70f5af9dd1db142eb81d1c59ed20c615941', 'ff38648cc15247af8e83b73e31b50969e90c7d4b17e5d426e6fa351234f753b71e584f48702b3448', 0, '2020-07-08 15:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thanas`
--

CREATE TABLE `thanas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thanas`
--

INSERT INTO `thanas` (`id`, `name`, `district_id`, `created_at`, `updated_at`) VALUES
(1, 'Sujanagar', 1, NULL, NULL),
(2, 'Santhia', 1, NULL, NULL),
(3, 'Ramna', 2, NULL, NULL),
(4, 'Savar', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'est', 1, '2019-07-09 00:25:24', '2019-07-09 00:25:24'),
(2, 'aut', 1, '2019-07-09 00:25:24', '2019-07-09 00:25:24'),
(3, 'a', 1, '2019-07-09 00:25:24', '2019-07-09 00:25:24'),
(4, 'nihil', 1, '2019-07-09 00:25:24', '2019-07-09 00:25:24'),
(5, 'maxime', 1, '2019-07-09 00:25:24', '2019-07-09 00:25:24'),
(6, 'dolor', 1, '2019-07-09 00:25:24', '2019-07-09 00:25:24'),
(7, 'dolorum', 1, '2019-07-09 00:25:24', '2019-07-09 00:25:24'),
(8, 'iure', 1, '2019-07-09 00:25:24', '2019-07-09 00:25:24'),
(9, 'consequuntur', 1, '2019-07-09 00:25:24', '2019-07-09 00:25:24'),
(10, 'fugiat', 1, '2019-07-09 00:25:24', '2019-07-09 00:25:24'),
(11, 'qui', 1, '2019-07-09 00:25:24', '2019-07-09 00:25:24'),
(12, 'aspernatur', 1, '2019-07-09 00:25:24', '2019-07-09 00:25:24'),
(13, 'exercitationem', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(14, 'recusandae', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(15, 'in', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(16, 'odio', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(17, 'quos', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(18, 'animi', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(19, 'est', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(20, 'soluta', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(21, 'placeat', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(22, 'praesentium', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(23, 'cupiditate', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(24, 'dolorem', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(25, 'harum', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(26, 'sit', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(27, 'mollitia', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(28, 'omnis', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(29, 'quaerat', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(30, 'eum', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(31, 'quo', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(32, 'possimus', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(33, 'et', 1, '2019-07-09 00:25:25', '2019-07-09 00:25:25'),
(34, 'magnam', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26'),
(35, 'commodi', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26'),
(36, 'quo', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26'),
(37, 'sequi', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26'),
(38, 'odio', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26'),
(39, 'et', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26'),
(40, 'ipsam', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26'),
(41, 'possimus', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26'),
(42, 'omnis', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26'),
(43, 'qui', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26'),
(44, 'dignissimos', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26'),
(45, 'sit', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26'),
(46, 'quia', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26'),
(47, 'nisi', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26'),
(48, 'eum', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26'),
(49, 'distinctio', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26'),
(50, 'deserunt', 1, '2019-07-09 00:25:26', '2019-07-09 00:25:26');

-- --------------------------------------------------------

--
-- Table structure for table `todo_lists`
--

CREATE TABLE `todo_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `todo_lists`
--

INSERT INTO `todo_lists` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Elbert Gottlieb', 1, '2019-07-09 00:23:26', '2019-07-09 00:23:26'),
(2, 'Dr. Estelle Conroy', 1, '2019-07-09 00:23:26', '2019-07-09 00:23:26'),
(3, 'Marjory Wiza', 1, '2019-07-09 00:23:26', '2019-07-09 00:23:26'),
(4, 'Kaleb Grimes', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(5, 'Kailey Considine V', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(6, 'Joannie Feil', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(7, 'Jerrod Prohaska', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(8, 'Mitchell Gorczany', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(9, 'Deven Kunze DVM', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(10, 'Caleb Doyle', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(11, 'Britney Effertz', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(12, 'Bradly Parker', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(13, 'Katarina Fisher', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(14, 'Carter Barton', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(15, 'Eino Boehm', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(16, 'Samara Bernhard', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(17, 'Murray Hane', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(18, 'Flavie Hilpert', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(19, 'Patience Tillman DVM', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(20, 'Aletha Schiller Jr.', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(21, 'Devante Wilkinson', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(22, 'Gwen Jacobs', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(23, 'Wilfrid Mayert', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(24, 'Prince Miller', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(25, 'Jefferey Robel', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(26, 'Edna Metz IV', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(27, 'Magali Streich', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(28, 'Hettie Beer', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(29, 'Prof. Elsa Howell II', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(30, 'Pearl McCullough', 1, '2019-07-09 00:23:27', '2019-07-09 00:23:27'),
(31, 'Mayra O\'Hara', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(32, 'Hudson Beier', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(33, 'Mr. Emery Champlin IV', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(34, 'Thaddeus Cummerata II', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(35, 'Ludie Fadel', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(36, 'Madison Pacocha', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(37, 'Angel Lang', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(38, 'Stewart Boyle', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(39, 'Kenyon O\'Kon', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(40, 'Leon Ullrich', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(41, 'Nolan Batz', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(42, 'Francesco Zemlak IV', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(43, 'Brannon O\'Hara', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(44, 'Megane Treutel II', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(45, 'Emelie Corwin', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(46, 'Hester Ryan', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(47, 'Lloyd Thompson IV', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(48, 'Wiley Wolf', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(49, 'Mrs. Jakayla Durgan Sr.', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28'),
(50, 'Mr. Joey Morar', 1, '2019-07-09 00:23:28', '2019-07-09 00:23:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
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
(1, 'Talha Ekhlas', 'talha@gmail.com', NULL, '$2y$10$.qf0fcLYcRRNatj6V7J6/OxM08JRbqMufXjUefwjf44n7BbwTtoai', 't0roDFy0zbUHAhrYClUNOfreyypGspjcZdaAxBFufBJgXlDWzgwIqbbbjueE', '2019-07-07 23:42:29', '2019-07-07 23:42:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `districts_user_id_foreign` (`user_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `thanas`
--
ALTER TABLE `thanas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thanas_dirtrict_id_foreign` (`district_id`);

--
-- Indexes for table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `todos_user_id_foreign` (`user_id`);

--
-- Indexes for table `todo_lists`
--
ALTER TABLE `todo_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `todo_lists_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `thanas`
--
ALTER TABLE `thanas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `todos`
--
ALTER TABLE `todos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `todo_lists`
--
ALTER TABLE `todo_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `thanas`
--
ALTER TABLE `thanas`
  ADD CONSTRAINT `thanas_dirtrict_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `todos`
--
ALTER TABLE `todos`
  ADD CONSTRAINT `todos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `todo_lists`
--
ALTER TABLE `todo_lists`
  ADD CONSTRAINT `todo_lists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
