-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2020 at 12:07 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `youtube_myapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Html', 'html', 'html', 'html5f92a6ac930c1.JPG', '2020-10-23 04:17:24', '2020-10-23 04:17:24'),
(2, 'Css', 'css', 'css', 'css5f92a6b9be6ad.JPG', '2020-10-23 04:17:37', '2020-10-23 04:17:37'),
(3, 'Web Mapping', 'web-mapping', 'web', 'web-mapping5f92a6cc3410f.JPG', '2020-10-23 04:17:56', '2020-10-23 04:17:56'),
(4, 'GIS and Remote Sensing', 'gis-and-remote-sensing', 'GIS', 'gis-and-remote-sensing5f92a6e04f8f4.JPG', '2020-10-23 04:18:16', '2020-10-23 04:18:16'),
(5, 'Javascript', 'javascript', NULL, 'javascript5f92a6f018482.JPG', '2020-10-23 04:18:32', '2020-10-23 04:18:32');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Hello world', '2020-10-23 04:34:19', '2020-10-23 04:34:19'),
(2, 2, 1, 'Second comment', '2020-10-23 04:34:29', '2020-10-23 04:34:29');

-- --------------------------------------------------------

--
-- Table structure for table `comment_replies`
--

CREATE TABLE `comment_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment_replies`
--

INSERT INTO `comment_replies` (`id`, `comment_id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '@Admin reply to hello world comment', '2020-10-23 04:34:53', '2020-10-23 04:34:53'),
(2, 1, 2, '@Admin reply from user', '2020-10-23 04:35:36', '2020-10-23 04:35:36'),
(3, 2, 2, '@Admin knock knock...', '2020-10-23 04:36:01', '2020-10-23 04:36:01');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_08_07_060610_create_roles_table', 1),
(5, '2020_08_28_091609_create_categories_table', 1),
(6, '2020_09_07_065450_create_posts_table', 1),
(7, '2020_09_12_072748_create_tags_table', 1),
(8, '2020_10_07_072827_create_comments_table', 1),
(9, '2020_10_13_064245_create_comment_replies_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `slug`, `image`, `body`, `view_count`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Laravel Wiki', 'laravel-wiki', 'laravel-wiki-5f92a8e71c7bc1603447015.jpg', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.<br></p>', 0, 1, '2020-10-23 04:26:55', '2020-10-23 04:26:55'),
(2, 1, 1, 'Laravel Wiki 1', 'laravel-wiki-1', 'laravel-wiki-5f92a8e71c7bc1603447015.jpg', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.<br></p>', 0, 1, '2020-10-23 04:26:55', '2020-10-23 04:26:55'),
(3, 1, 2, 'Laravel Wiki 3', 'laravel-wiki-3', 'laravel-wiki-5f92a8e71c7bc1603447015.jpg', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.<br></p>', 0, 1, '2020-10-23 04:26:55', '2020-10-23 04:26:55'),
(4, 1, 2, 'Laravel Wiki 4', 'laravel-wiki-4', 'laravel-wiki-5f92a8e71c7bc1603447015.jpg', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.<br></p>', 0, 1, '2020-10-23 04:26:55', '2020-10-23 04:26:55'),
(5, 1, 3, 'Laravel Wiki 5', 'laravel-wiki-5', 'laravel-wiki-5f92a8e71c7bc1603447015.jpg', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.<br></p>', 0, 1, '2020-10-23 04:26:55', '2020-10-23 04:26:55'),
(6, 1, 3, 'Laravel Wiki 6', 'laravel-wiki-6', 'laravel-wiki-5f92a8e71c7bc1603447015.jpg', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.<br></p>', 0, 1, '2020-10-23 04:26:55', '2020-10-23 04:26:55'),
(7, 1, 4, 'Laravel Wiki 7', 'laravel-wiki-7', 'laravel-wiki-5f92a8e71c7bc1603447015.jpg', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.<br></p>', 0, 1, '2020-10-23 04:26:55', '2020-10-23 04:26:55'),
(8, 1, 4, 'Laravel Wiki 8', 'laravel-wiki-8', 'laravel-wiki-5f92a8e71c7bc1603447015.jpg', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.<br></p>', 0, 1, '2020-10-23 04:26:55', '2020-10-23 04:26:55'),
(9, 1, 4, 'Laravel Wiki 9', 'laravel-wiki-9', 'laravel-wiki-5f92a8e71c7bc1603447015.jpg', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.<br></p>', 0, 1, '2020-10-23 04:26:55', '2020-10-23 04:26:55'),
(10, 1, 4, 'Laravel Wiki 10', 'laravel-wiki-10', 'laravel-wiki-5f92a8e71c7bc1603447015.jpg', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.<br></p>', 0, 1, '2020-10-23 04:26:55', '2020-10-23 04:26:55'),
(11, 1, 5, 'Laravel Wiki 11', 'laravel-wiki-11', 'laravel-wiki-5f92a8e71c7bc1603447015.jpg', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.<br></p>', 0, 1, '2020-10-23 04:26:55', '2020-10-23 04:26:55'),
(12, 1, 5, 'Laravel Wiki 12', 'laravel-wiki-12', 'laravel-wiki-5f92a8e71c7bc1603447015.jpg', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.<br></p>', 0, 1, '2020-10-23 04:26:55', '2020-10-23 04:26:55');
INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `slug`, `image`, `body`, `view_count`, `status`, `created_at`, `updated_at`) VALUES
(13, 1, 5, 'Laravel Wiki 13', 'laravel-wiki-13', 'laravel-wiki-5f92a8e71c7bc1603447015.jpg', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.<br></p>', 0, 1, '2020-10-23 04:26:55', '2020-10-23 04:26:55'),
(14, 1, 5, 'Laravel Wiki 14', 'laravel-wiki-14', 'laravel-wiki-5f92a8e71c7bc1603447015.jpg', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.<br></p>', 0, 1, '2020-10-23 04:26:55', '2020-10-23 04:26:55'),
(15, 1, 5, 'Laravel Wiki 15', 'laravel-wiki-15', 'laravel-wiki-5f92a8e71c7bc1603447015.jpg', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.<br></p>', 0, 1, '2020-10-23 04:26:55', '2020-10-23 04:26:55'),
(16, 1, 5, 'Laravel Wiki 16', 'laravel-wiki-16', 'laravel-wiki-5f92a8e71c7bc1603447015.jpg', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.</p><p><br></p><p><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eaque eum, debitis eos mollitia delectus id distinctio inventore cumque obcaecati minima recusandae nesciunt soluta maxime sequi necessitatibus rem. Impedit eius illum quaerat ipsam nostrum, accusantium doloribus quas maxime. Explicabo quod facere error quis tempore. Deleniti, sed. Optio voluptate nulla harum.<br></p>', 0, 1, '2020-10-23 04:26:55', '2020-10-23 04:26:55');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-10-23 04:11:44', '2020-10-23 04:11:44'),
(2, 'user', '2020-10-23 04:11:44', '2020-10-23 04:11:44'),
(3, 'suspend', '2020-10-23 04:11:44', '2020-10-23 04:11:44');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `postID` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `postID`, `name`) VALUES
(1, '1', 'php'),
(2, '1', 'laravel'),
(3, '1', 'html'),
(4, '1', 'css'),
(5, '1', 'js'),
(6, '1', 'sql');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `userid`, `email`, `email_verified_at`, `password`, `image`, `about`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin101', 'admin@admin.com', NULL, '$2y$10$9acs/N7yJEZnpdEMt8jsu.De1zKfo1tPXRS1z61uMTQUnDA1zL6Kq', 'admin5f92a82061e09.png', NULL, NULL, '2020-10-23 04:11:44', '2020-10-23 04:23:36'),
(2, 2, 'User', 'user101', 'user@user.com', NULL, '$2y$10$JhRhLQj1uoq7KmK8dCmdwu6l7qf4M41kpEEps4rfDo1RVytpycVAa', 'default.jpg', NULL, NULL, '2020-10-23 04:11:44', '2020-10-23 04:11:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_replies`
--
ALTER TABLE `comment_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_title_unique` (`title`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_userid_unique` (`userid`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comment_replies`
--
ALTER TABLE `comment_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
