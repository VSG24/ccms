-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2015 at 02:52 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ccms_release`
--

-- --------------------------------------------------------

--
-- Table structure for table `c_categories`
--

CREATE TABLE IF NOT EXISTS `c_categories` (
  `ID` bigint(20) unsigned NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `c_categories`
--

INSERT INTO `c_categories` (`ID`, `name`, `link_name`) VALUES
(1, 'Uncategorized', 'uncategorized');

-- --------------------------------------------------------

--
-- Table structure for table `c_comments`
--

CREATE TABLE IF NOT EXISTS `c_comments` (
  `ID` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `c_emails`
--

CREATE TABLE IF NOT EXISTS `c_emails` (
  `ID` bigint(20) unsigned NOT NULL,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_html` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_plain` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `c_ignored_cache`
--

CREATE TABLE IF NOT EXISTS `c_ignored_cache` (
  `hash` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `c_nonce`
--

CREATE TABLE IF NOT EXISTS `c_nonce` (
  `ID` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `token` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `c_options`
--

CREATE TABLE IF NOT EXISTS `c_options` (
  `option_id` bigint(20) unsigned NOT NULL,
  `option_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `c_options`
--

INSERT INTO `c_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'site_title', 'My ccms website', 'yes'),
(2, 'register_open', 'yes', 'yes'),
(3, 'max_post_pp', '6', 'yes'),
(4, 'site_description', 'Powered by ccms', 'yes'),
(5, 'default_category', '20', 'yes'),
(6, 'version', '121', 'yes'),
(7, 'installation_date', '', 'yes'),
(8, 'release_date', '2015-10-09', 'yes'),
(9, 'smtp_server', 'smtp.gmail.com', 'yes'),
(10, 'smtp_port', '587', 'yes'),
(11, 'smtp_username', '', 'yes'),
(12, 'smtp_password', '', 'yes'),
(13, 'smtp_mail_from', '', 'yes'),
(14, 'smtp_mail_from_name', '', 'yes'),
(15, 'send_conf_mail', 'no', 'yes'),
(16, 'default_email_template', '', 'yes'),
(17, 'can_comment', 'anyone', 'yes'),
(19, 'xml_maps_auto_update', 'yes', 'yes'),
(20, 'conf_mail_subject', 'Confirmation Mail', 'yes'),
(21, 'caching', 'no', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `c_payments`
--

CREATE TABLE IF NOT EXISTS `c_payments` (
  `ID` bigint(20) unsigned NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_by` bigint(20) unsigned NOT NULL,
  `payment_for` bigint(20) unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `trans_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `c_plugins`
--

CREATE TABLE IF NOT EXISTS `c_plugins` (
  `ID` bigint(20) unsigned NOT NULL,
  `plugin_name` mediumtext CHARACTER SET latin1 NOT NULL,
  `plugin_version` float NOT NULL,
  `included` tinyint(4) NOT NULL DEFAULT '0',
  `plugin_status` int(11) NOT NULL,
  `latest_update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `c_plugins`
--

INSERT INTO `c_plugins` (`ID`, `plugin_name`, `plugin_version`, `included`, `plugin_status`, `latest_update_date`) VALUES
(1, 'payline', 1, 1, 1, '2015-10-03 22:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `c_posts`
--

CREATE TABLE IF NOT EXISTS `c_posts` (
  `ID` bigint(20) unsigned NOT NULL,
  `post_author` bigint(20) unsigned DEFAULT NULL,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_status` tinyint(4) NOT NULL DEFAULT '1',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  `tags` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_views` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `c_posts_cats`
--

CREATE TABLE IF NOT EXISTS `c_posts_cats` (
  `ID` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `cat_id` bigint(20) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `c_users`
--

CREATE TABLE IF NOT EXISTS `c_users` (
  `ID` bigint(20) unsigned NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activate` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_role` int(11) NOT NULL DEFAULT '0',
  `vip_status` smallint(2) DEFAULT '0',
  `vip_start_date` datetime DEFAULT NULL,
  `vip_expire_date` datetime DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `c_user_stats`
--

CREATE TABLE IF NOT EXISTS `c_user_stats` (
  `ID` bigint(20) unsigned NOT NULL,
  `user_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `c_categories`
--
ALTER TABLE `c_categories`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `c_comments`
--
ALTER TABLE `c_comments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `c_emails`
--
ALTER TABLE `c_emails`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `c_ignored_cache`
--
ALTER TABLE `c_ignored_cache`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `c_nonce`
--
ALTER TABLE `c_nonce`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `c_options`
--
ALTER TABLE `c_options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `c_payments`
--
ALTER TABLE `c_payments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `payment_by` (`payment_by`),
  ADD KEY `payment_for` (`payment_for`);

--
-- Indexes for table `c_plugins`
--
ALTER TABLE `c_plugins`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `c_posts`
--
ALTER TABLE `c_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `c_posts_cats`
--
ALTER TABLE `c_posts_cats`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `c_users`
--
ALTER TABLE `c_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `c_user_stats`
--
ALTER TABLE `c_user_stats`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_ip` (`user_ip`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `c_categories`
--
ALTER TABLE `c_categories`
  MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `c_comments`
--
ALTER TABLE `c_comments`
  MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `c_emails`
--
ALTER TABLE `c_emails`
  MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `c_nonce`
--
ALTER TABLE `c_nonce`
  MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `c_options`
--
ALTER TABLE `c_options`
  MODIFY `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `c_payments`
--
ALTER TABLE `c_payments`
  MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `c_plugins`
--
ALTER TABLE `c_plugins`
  MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `c_posts`
--
ALTER TABLE `c_posts`
  MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `c_posts_cats`
--
ALTER TABLE `c_posts_cats`
  MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `c_users`
--
ALTER TABLE `c_users`
  MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `c_user_stats`
--
ALTER TABLE `c_user_stats`
  MODIFY `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `c_comments`
--
ALTER TABLE `c_comments`
  ADD CONSTRAINT `c_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `c_posts` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `c_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `c_users` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `c_payments`
--
ALTER TABLE `c_payments`
  ADD CONSTRAINT `c_payments_ibfk_1` FOREIGN KEY (`payment_by`) REFERENCES `c_users` (`ID`),
  ADD CONSTRAINT `c_payments_ibfk_2` FOREIGN KEY (`payment_for`) REFERENCES `c_users` (`ID`);

--
-- Constraints for table `c_posts`
--
ALTER TABLE `c_posts`
  ADD CONSTRAINT `c_posts_ibfk_1` FOREIGN KEY (`post_author`) REFERENCES `c_users` (`ID`);

--
-- Constraints for table `c_posts_cats`
--
ALTER TABLE `c_posts_cats`
  ADD CONSTRAINT `c_posts_cats_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `c_posts` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `c_posts_cats_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `c_categories` (`ID`) ON DELETE SET NULL;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
