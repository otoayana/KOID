SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE TABLE `bans` (
  `user` int(10) UNSIGNED NOT NULL,
  `ip` varchar(19) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `banned_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `length` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `blocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED DEFAULT NULL,
  `target` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `follows` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED NOT NULL,
  `target` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `source` int(10) UNSIGNED DEFAULT NULL,
  `target` int(10) UNSIGNED DEFAULT NULL,
  `origin` int(10) UNSIGNED DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `admin_type` tinyint(1) DEFAULT NULL,
  `admin_reason` int(10) UNSIGNED DEFAULT NULL,
  `merged` int(10) UNSIGNED DEFAULT NULL,
  `seen` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `body` varchar(2000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `image` varchar(1024) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `yt` varchar(11) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sensitive_content` tinyint(1) DEFAULT '0',
  `tags` varchar(1183) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `replies` (
  `id` int(10) UNSIGNED NOT NULL,
  `post` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `feeling` tinyint(1) DEFAULT '0',
  `body` varchar(2000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `image` varchar(1024) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sensitive_content` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `reports` (
  `source` int(10) UNSIGNED NOT NULL,
  `target` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `body` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `community` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` int(10) UNSIGNED DEFAULT NULL,
  `value` char(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `nickname` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `password` binary(60) DEFAULT NULL,
  `avatar` varchar(1024) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `has_mh` tinyint(1) DEFAULT NULL,
  `mh` varchar(13) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `level` tinyint(1) DEFAULT '0',
  `organization` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `profile_comment` varchar(2000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `favorite_post` int(10) UNSIGNED DEFAULT NULL,
  `notifications` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '0',
  `ip` varchar(39) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

ALTER TABLE `bans`
  ADD PRIMARY KEY (`user`);

ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `follows`
  ADD PRIMARY KEY (`source`,`target`),
  ADD UNIQUE KEY `id` (`id`);

ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_ibfk_1` (`merged`);

ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `reports`
  ADD UNIQUE KEY `reports_uk_1` (`source`,`target`,`type`);

ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);
  
ALTER TABLE `blocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `follows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `replies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
  
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`merged`) REFERENCES `notifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
