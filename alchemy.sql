-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 28, 2012 at 06:45 PM
-- Server version: 5.5.28-0ubuntu0.12.04.2
-- PHP Version: 5.3.10-1ubuntu3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `alchemy`
--

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE IF NOT EXISTS `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent1` int(11) DEFAULT NULL,
  `parent2` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `name`, `parent1`, `parent2`, `created_at`, `updated_at`, `image_file_name`, `image_content_type`, `image_file_size`) VALUES
(1, 'water', NULL, NULL, '2012-11-18 17:23:12', '2012-11-28 16:21:49', '1-water.jpg', 'image/jpeg', 5228),
(2, 'air', NULL, NULL, '2012-11-18 17:23:12', '2012-11-28 16:26:13', 'Fresh-Air.jpg', 'image/jpeg', 21416),
(3, 'fire', NULL, NULL, '2012-11-18 17:23:12', '2012-11-28 16:26:23', 'fire.jpg', 'image/jpeg', 104882),
(4, 'earth', NULL, NULL, '2012-11-18 17:23:12', '2012-11-28 16:26:58', 'a3217009.jpg', 'image/jpeg', 154978),
(5, 'rain', 1, 2, '2012-11-18 17:23:12', '2012-11-28 16:27:09', 'rain.JPG', 'image/jpeg', 29697),
(6, 'flood', 1, 1, '2012-11-18 17:23:12', '2012-11-28 16:27:22', 'flood.jpg', 'image/jpeg', 42395),
(7, 'storm', 2, 2, '2012-11-18 17:23:12', '2012-11-28 16:27:38', 'storm.jpg', 'image/jpeg', 15576),
(8, 'volcano', 4, 3, '2012-11-18 17:23:12', '2012-11-28 16:27:48', 'volcano.jpg', 'image/jpeg', 47847);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'default', '2012-11-05 12:30:46', '2012-11-05 12:30:46');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `permalink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=141 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `title`, `meta_description`, `content`, `permalink`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Board', 'Alchemy Game. Match different elements and compete with others', 'Alchemy is a simple game inspired from alchemy game on android. It is developed for web and it makes easy for someone to create his own elements and matches! ', '<h1>Alchemy Game</h1>\r\n<br />\r\n<div>Match the different elements and find all the possible combinations! Get it from github and create your own alchemy elements with anything you want.</div>\r\n<br />', 'homepage', 1, '2012-11-05 12:30:46', '2012-11-27 14:46:52');

-- --------------------------------------------------------

--
-- Table structure for table `page_menu_mappings`
--

CREATE TABLE IF NOT EXISTS `page_menu_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `page_position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_page_menu_mappings_on_menu_id` (`menu_id`),
  KEY `index_page_menu_mappings_on_page_id` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=264 ;

--
-- Dumping data for table `page_menu_mappings`
--

INSERT INTO `page_menu_mappings` (`id`, `page_id`, `menu_id`, `page_position`, `created_at`, `updated_at`) VALUES
(253, 1, 1, 1, '2012-11-07 09:22:58', '2012-11-07 09:22:58');

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20111116145957'),
('20111116150414'),
('20111116151253'),
('20111203103544'),
('20111229080546'),
('20120720174220'),
('20120721093544'),
('20120721171040'),
('20121118170416'),
('20121128135049');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
(1, 'homepage', '1', '2012-11-05 12:30:46', '2012-11-05 12:30:46');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE IF NOT EXISTS `uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `permalink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_file_size` int(11) DEFAULT NULL,
  `file_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`) VALUES
(2, 'istoselidas@gmail.com', '$2a$10$VOFQR0is9N8.5Yc7Jx4JXOM2sNbWHdCMvArAhWq.Vc1glG4zvy40e', 'SEXKFygo5x95z7ESTAQ3', '2012-11-06 16:51:22', NULL, 5, '2012-11-27 14:42:15', '2012-11-07 07:20:07', '192.168.1.102', '192.168.1.102', '2012-11-05 12:32:03', '2012-11-27 14:42:15'),
(7, 'test@example.com', '$2a$10$igS1hX5pLjdOdPmWp2odUO57LWqeLUfxjzz3jLgZyEHW.FWznrN8W', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2012-11-28 16:45:22', '2012-11-28 16:45:22');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
