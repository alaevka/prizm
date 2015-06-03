-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 03 2015 г., 14:06
-- Версия сервера: 5.5.37-log
-- Версия PHP: 5.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `adboard`
--

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1432723408),
('m140209_132017_init', 1432723412),
('m140403_174025_create_account_table', 1432723412),
('m140504_113157_update_tables', 1432723414),
('m140504_130429_create_token_table', 1432723414),
('m140830_171933_fix_ip_field', 1432723414),
('m140830_172703_change_account_table_name', 1432723414),
('m141222_110026_update_ip_field', 1432723415),
('m150321_222228_audit_trail', 1433311547);

-- --------------------------------------------------------

--
-- Структура таблицы `objects`
--

CREATE TABLE IF NOT EXISTS `objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `address` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `device_id` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `message_error_delay` int(11) NOT NULL,
  `long_absence_communication` int(11) NOT NULL,
  `time_long_absence_communication` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `objects`
--

INSERT INTO `objects` (`id`, `title`, `address`, `status`, `organization_id`, `device_id`, `phone`, `password`, `message_error_delay`, `long_absence_communication`, `time_long_absence_communication`) VALUES
(1, 'Тестовый объект 1', 'г. Пенза, ул. Московская 11', 1, 1, 'N00000115', '89630984835', '', 0, 0, 0),
(2, 'Тестовый объект 2', 'г. Пенза, ул. Суворова, д. 15', 1, 1, 'N00000121', '89630984606', '', 0, 0, 0),
(3, 'Тестовый объект 3', 'г. Пенза, ул. Московская 122', 1, 1, 'N00000120', '89630984899', '', 0, 0, 0),
(4, 'Тестовый объект 4', 'г. Заречный, перед проходной, со стороны Монтажки', 1, 1, 'N00000116', '89624746984', '', 0, 0, 0),
(5, 'Тестовый объект 5', 'трасса М5, 626 км, перед Чемодановкой слева', 1, 1, 'N00000117', '89624746612', '', 0, 0, 0),
(7, 'Тестовый объект 6', 'г. Заречный, ул. Зеленая 10Е, со стороны крыльца', 1, 3, 'N00000126', '89630983466', '', 0, 0, 0),
(8, 'Тестовый объект 7', 'Ахуны, рядом с комплексом "Семейный"', 1, 3, 'N00000156', '89630990983', '', 0, 0, 0),
(9, 'Тестовый объект 8', 'ул. Карпинского 20, магазин Метро', 1, 2, 'N00000158', '89630985412', '', 1, 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `organizations`
--

CREATE TABLE IF NOT EXISTS `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `address` text NOT NULL,
  `phone` text NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `organizations`
--

INSERT INTO `organizations` (`id`, `title`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Тестовая организация 1', 'г. Пенза, ул. Мира, д. 12, оф. 12', '8(8412) 60-45-23', 1433240540, 1433240840),
(2, 'Тестовая организация 2', 'г. Заречный, ул. Ленина, д4а', '8(8412) 60-27-32', 1433240621, 1433240621),
(3, 'Тестовая организация 3', 'г. Самара, ул. Бекешская, д. 122', '8(343) 434-34-34', 1433240771, 1433240824);

-- --------------------------------------------------------

--
-- Структура таблицы `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `public_email` varchar(255) DEFAULT NULL,
  `gravatar_email` varchar(255) DEFAULT NULL,
  `gravatar_id` varchar(32) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bio` text,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`) VALUES
(1, NULL, NULL, 'alaevka@gmail.com', '945eb67db2f11bd09a287b7da9c3355d', NULL, NULL, NULL),
(2, NULL, NULL, 'test_user1@gmail.com', 'f58a274dc328f77c7ab9009fa4eebfe8', NULL, NULL, NULL),
(4, NULL, NULL, 'org1_user_1@gmail.com', '8d1ae5722469772ae9640fdad6ae08fb', NULL, NULL, NULL),
(5, NULL, NULL, 'org1_user_2@gmail.com', '43fdc58195ad2f229b7d813228dfeb10', NULL, NULL, NULL),
(6, NULL, NULL, 'org2_admin2@gmail.com', '6b45dc9cc052dd077fcd78f415a1c445', NULL, NULL, NULL),
(7, NULL, NULL, 'org2_user1@gmail.com', '0bff420cd2f770226cbc30fa1e656117', NULL, NULL, NULL),
(8, NULL, NULL, 'org2_user2@gmail.com', '640b7f6de81326fd5f8aa0739abed17f', NULL, NULL, NULL),
(9, NULL, NULL, 'org2_user3@gmail.com', '2a954aa6bde8b3998d316ec04c9f41fa', NULL, NULL, NULL),
(10, NULL, NULL, 'org3_admin@gmail.com', 'b2fc425621f26427005a6709d8a6920d', NULL, NULL, NULL),
(12, NULL, NULL, 'org3_user1@gmail.com', '7f0e4ed64ecee2936294b1c865ff6e06', NULL, NULL, NULL),
(13, NULL, NULL, 'org3_user2@gmail.com', '65910831cb981a2306a2cdf3a706245d', NULL, NULL, NULL),
(14, NULL, NULL, 'org3_user3@gmail.com', '9c3935630c2b5d27fc63a92b43e4b920', NULL, NULL, NULL),
(15, NULL, NULL, 'org3_user5@gmail.com', '5ab68d97e82f702dc709494ce81190a5', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `social_account`
--

CREATE TABLE IF NOT EXISTS `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  KEY `fk_user_account` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_audit_trail`
--

CREATE TABLE IF NOT EXISTS `tbl_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` text,
  `new_value` text,
  `action` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `field` varchar(255) DEFAULT NULL,
  `stamp` datetime NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `model_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_audit_trail_user_id` (`user_id`),
  KEY `idx_audit_trail_model_id` (`model_id`),
  KEY `idx_audit_trail_model` (`model`),
  KEY `idx_audit_trail_field` (`field`),
  KEY `idx_audit_trail_action` (`action`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=104 ;

--
-- Дамп данных таблицы `tbl_audit_trail`
--

INSERT INTO `tbl_audit_trail` (`id`, `old_value`, `new_value`, `action`, `model`, `field`, `stamp`, `user_id`, `model_id`) VALUES
(1, 'г. Заречный, перед проходной со стороны Монтажки', 'г. Заречный, перед проходной, со стороны Монтажки', 'CHANGE', 'app\\models\\Objects', 'address', '2015-06-03 10:09:25', '1', '4'),
(2, NULL, NULL, 'CREATE', 'app\\models\\Objects', NULL, '2015-06-03 10:10:16', '1', '7'),
(3, '', '7', 'SET', 'app\\models\\Objects', 'id', '2015-06-03 10:10:16', '1', '7'),
(4, '', 'Тестовый объект 6', 'SET', 'app\\models\\Objects', 'title', '2015-06-03 10:10:16', '1', '7'),
(5, '', 'г. Заречный, ул. Зеленая 10Е, со стороны крыльца', 'SET', 'app\\models\\Objects', 'address', '2015-06-03 10:10:16', '1', '7'),
(6, '', '1', 'SET', 'app\\models\\Objects', 'status', '2015-06-03 10:10:16', '1', '7'),
(7, '', '3', 'SET', 'app\\models\\Objects', 'organization_id', '2015-06-03 10:10:16', '1', '7'),
(8, '$2y$12$PAupbfUtT6ws0D7Ncx0ycOPOosqScEcBCNGldmVD7m423LncWIWqm', '$2y$12$Yi4DfWjMkjVWkoQSkOgJv.AJSTSsNu9I4D8MlKmc48HvVO1yK5HZq', 'CHANGE', 'app\\models\\User', 'password_hash', '2015-06-03 10:11:55', '1', '8'),
(9, NULL, NULL, 'CREATE', 'app\\models\\User', NULL, '2015-06-03 10:12:33', '1', '11'),
(10, '', '11', 'SET', 'app\\models\\User', 'id', '2015-06-03 10:12:33', '1', '11'),
(11, '', 'dfdsf', 'SET', 'app\\models\\User', 'username', '2015-06-03 10:12:33', '1', '11'),
(12, '', 'sdfdsfdsf@dsfsdf.rt', 'SET', 'app\\models\\User', 'email', '2015-06-03 10:12:33', '1', '11'),
(13, '', '$2y$12$zvI9rWylAbxwpP5YZJ1cJebcDsRIXJKUqgT79T/R0UVWm3MJbOHMi', 'SET', 'app\\models\\User', 'password_hash', '2015-06-03 10:12:33', '1', '11'),
(14, '', 'iN3r5UWalp0uyMHPS10sj2qxUo0VQg7z', 'SET', 'app\\models\\User', 'auth_key', '2015-06-03 10:12:33', '1', '11'),
(15, '', '1433311953', 'SET', 'app\\models\\User', 'confirmed_at', '2015-06-03 10:12:33', '1', '11'),
(16, '', '127.0.0.1', 'SET', 'app\\models\\User', 'registration_ip', '2015-06-03 10:12:33', '1', '11'),
(17, '', '10', 'SET', 'app\\models\\User', 'role', '2015-06-03 10:12:33', '1', '11'),
(18, '', '1', 'SET', 'app\\models\\User', 'created_by', '2015-06-03 10:12:33', '1', '11'),
(19, '', '2', 'SET', 'app\\models\\User', 'organization_id', '2015-06-03 10:12:33', '1', '11'),
(20, NULL, NULL, 'DELETE', 'app\\models\\User', NULL, '2015-06-03 10:13:15', '1', '11'),
(21, '', 'N00000115', 'CHANGE', 'app\\models\\Objects', 'device_id', '2015-06-03 11:37:23', '1', '1'),
(22, '', '89630984835', 'CHANGE', 'app\\models\\Objects', 'phone', '2015-06-03 11:37:23', '1', '1'),
(23, '', 'N00000121', 'CHANGE', 'app\\models\\Objects', 'device_id', '2015-06-03 11:41:03', '1', '2'),
(24, '', '89630984606', 'CHANGE', 'app\\models\\Objects', 'phone', '2015-06-03 11:41:03', '1', '2'),
(25, '', 'N00000120', 'CHANGE', 'app\\models\\Objects', 'device_id', '2015-06-03 11:41:18', '1', '3'),
(26, '', '89630984899', 'CHANGE', 'app\\models\\Objects', 'phone', '2015-06-03 11:41:18', '1', '3'),
(27, '', 'N00000116', 'CHANGE', 'app\\models\\Objects', 'device_id', '2015-06-03 11:41:35', '1', '4'),
(28, '', '89624746984', 'CHANGE', 'app\\models\\Objects', 'phone', '2015-06-03 11:41:35', '1', '4'),
(29, '', 'N00000117', 'CHANGE', 'app\\models\\Objects', 'device_id', '2015-06-03 11:41:49', '1', '5'),
(30, '', '89624746612', 'CHANGE', 'app\\models\\Objects', 'phone', '2015-06-03 11:41:49', '1', '5'),
(31, '', 'N00000126', 'CHANGE', 'app\\models\\Objects', 'device_id', '2015-06-03 11:42:04', '1', '7'),
(32, '', '89630983466', 'CHANGE', 'app\\models\\Objects', 'phone', '2015-06-03 11:42:04', '1', '7'),
(33, NULL, NULL, 'CREATE', 'app\\models\\User', NULL, '2015-06-03 11:46:09', '10', '12'),
(34, '', '12', 'SET', 'app\\models\\User', 'id', '2015-06-03 11:46:09', '10', '12'),
(35, '', 'org3_user1', 'SET', 'app\\models\\User', 'username', '2015-06-03 11:46:09', '10', '12'),
(36, '', 'org3_user1@gmail.com', 'SET', 'app\\models\\User', 'email', '2015-06-03 11:46:09', '10', '12'),
(37, '', '$2y$12$yOH47uLSaAiRSSul9WmRlOQ7tQawRHni1k/6AH6j0GDpdazCq2FiG', 'SET', 'app\\models\\User', 'password_hash', '2015-06-03 11:46:09', '10', '12'),
(38, '', 'H_s_olgvwvY3gyxNm06cnQgkYcZpLxgk', 'SET', 'app\\models\\User', 'auth_key', '2015-06-03 11:46:09', '10', '12'),
(39, '', '1433317568', 'SET', 'app\\models\\User', 'confirmed_at', '2015-06-03 11:46:09', '10', '12'),
(40, '', '127.0.0.1', 'SET', 'app\\models\\User', 'registration_ip', '2015-06-03 11:46:09', '10', '12'),
(41, '', '10', 'SET', 'app\\models\\User', 'role', '2015-06-03 11:46:09', '10', '12'),
(42, '', '10', 'SET', 'app\\models\\User', 'created_by', '2015-06-03 11:46:09', '10', '12'),
(43, '', '3', 'SET', 'app\\models\\User', 'organization_id', '2015-06-03 11:46:09', '10', '12'),
(44, NULL, NULL, 'CREATE', 'app\\models\\Objects', NULL, '2015-06-03 11:49:45', '1', '8'),
(45, '', '8', 'SET', 'app\\models\\Objects', 'id', '2015-06-03 11:49:45', '1', '8'),
(46, '', 'Тестовый объект 7', 'SET', 'app\\models\\Objects', 'title', '2015-06-03 11:49:45', '1', '8'),
(47, '', 'Ахуны, рядом с комплексом "Семейный"', 'SET', 'app\\models\\Objects', 'address', '2015-06-03 11:49:45', '1', '8'),
(48, '', '1', 'SET', 'app\\models\\Objects', 'status', '2015-06-03 11:49:45', '1', '8'),
(49, '', '3', 'SET', 'app\\models\\Objects', 'organization_id', '2015-06-03 11:49:45', '1', '8'),
(50, '', 'N00000156', 'SET', 'app\\models\\Objects', 'device_id', '2015-06-03 11:49:45', '1', '8'),
(51, '', '89630990983', 'SET', 'app\\models\\Objects', 'phone', '2015-06-03 11:49:45', '1', '8'),
(52, NULL, NULL, 'CREATE', 'app\\models\\User', NULL, '2015-06-03 11:52:49', '1', '13'),
(53, '', '13', 'SET', 'app\\models\\User', 'id', '2015-06-03 11:52:49', '1', '13'),
(54, '', 'org3_user2', 'SET', 'app\\models\\User', 'username', '2015-06-03 11:52:49', '1', '13'),
(55, '', 'org3_user2@gmail.com', 'SET', 'app\\models\\User', 'email', '2015-06-03 11:52:49', '1', '13'),
(56, '', '$2y$12$syvfM0Jh8ewFj6OIzjY36.KSbSJ7tENQazHdvj9CMA3TJMHtAGQje', 'SET', 'app\\models\\User', 'password_hash', '2015-06-03 11:52:49', '1', '13'),
(57, '', 'OCD6VmDgbAAY9p9uMpw_2AbjKAFtqD2w', 'SET', 'app\\models\\User', 'auth_key', '2015-06-03 11:52:49', '1', '13'),
(58, '', '1433317968', 'SET', 'app\\models\\User', 'confirmed_at', '2015-06-03 11:52:49', '1', '13'),
(59, '', '127.0.0.1', 'SET', 'app\\models\\User', 'registration_ip', '2015-06-03 11:52:49', '1', '13'),
(60, '', '10', 'SET', 'app\\models\\User', 'role', '2015-06-03 11:52:49', '1', '13'),
(61, '', '1', 'SET', 'app\\models\\User', 'created_by', '2015-06-03 11:52:49', '1', '13'),
(62, '', '3', 'SET', 'app\\models\\User', 'organization_id', '2015-06-03 11:52:49', '1', '13'),
(63, NULL, NULL, 'CREATE', 'app\\models\\User', NULL, '2015-06-03 11:55:19', '1', '14'),
(64, '', '14', 'SET', 'app\\models\\User', 'id', '2015-06-03 11:55:19', '1', '14'),
(65, '', 'org3_user3', 'SET', 'app\\models\\User', 'username', '2015-06-03 11:55:19', '1', '14'),
(66, '', 'org3_user3@gmail.com', 'SET', 'app\\models\\User', 'email', '2015-06-03 11:55:19', '1', '14'),
(67, '', '$2y$12$HIIbt3V4DtVIJFo0W6YIyekhmXwYrRiyuH1qMpzm4p4Ori0LffXpm', 'SET', 'app\\models\\User', 'password_hash', '2015-06-03 11:55:19', '1', '14'),
(68, '', 'TRYkYNxQV6yyYKTJZ8BYOKUsb9ikKRUc', 'SET', 'app\\models\\User', 'auth_key', '2015-06-03 11:55:19', '1', '14'),
(69, '', '1433318119', 'SET', 'app\\models\\User', 'confirmed_at', '2015-06-03 11:55:19', '1', '14'),
(70, '', '127.0.0.1', 'SET', 'app\\models\\User', 'registration_ip', '2015-06-03 11:55:19', '1', '14'),
(71, '', '1433318119', 'SET', 'app\\models\\User', 'created_at', '2015-06-03 11:55:19', '1', '14'),
(72, '', '1433318119', 'SET', 'app\\models\\User', 'updated_at', '2015-06-03 11:55:19', '1', '14'),
(73, '', '10', 'SET', 'app\\models\\User', 'role', '2015-06-03 11:55:19', '1', '14'),
(74, '', '1', 'SET', 'app\\models\\User', 'created_by', '2015-06-03 11:55:19', '1', '14'),
(75, '', '3', 'SET', 'app\\models\\User', 'organization_id', '2015-06-03 11:55:19', '1', '14'),
(76, '0', '1433318140', 'CHANGE', 'app\\models\\User', 'updated_at', '2015-06-03 11:55:40', '1', '12'),
(77, NULL, NULL, 'CREATE', 'app\\models\\Objects', NULL, '2015-06-03 12:14:53', '1', '9'),
(78, '', '9', 'SET', 'app\\models\\Objects', 'id', '2015-06-03 12:14:53', '1', '9'),
(79, '', 'Тестовый объект 8', 'SET', 'app\\models\\Objects', 'title', '2015-06-03 12:14:53', '1', '9'),
(80, '', 'ул. Карпинского 20, магазин Метро', 'SET', 'app\\models\\Objects', 'address', '2015-06-03 12:14:53', '1', '9'),
(81, '', '1', 'SET', 'app\\models\\Objects', 'status', '2015-06-03 12:14:53', '1', '9'),
(82, '', '2', 'SET', 'app\\models\\Objects', 'organization_id', '2015-06-03 12:14:53', '1', '9'),
(83, '', 'N00000158', 'SET', 'app\\models\\Objects', 'device_id', '2015-06-03 12:14:53', '1', '9'),
(84, '', '89630985412', 'SET', 'app\\models\\Objects', 'phone', '2015-06-03 12:14:53', '1', '9'),
(85, '', '1', 'SET', 'app\\models\\Objects', 'message_error_delay', '2015-06-03 12:14:53', '1', '9'),
(86, '', '2', 'SET', 'app\\models\\Objects', 'long_absence_communication', '2015-06-03 12:14:53', '1', '9'),
(87, '', '2', 'SET', 'app\\models\\Objects', 'time_long_absence_communication', '2015-06-03 12:14:53', '1', '9'),
(88, '1433310700', '1433320451', 'CHANGE', 'app\\models\\User', 'updated_at', '2015-06-03 12:34:11', '1', '1'),
(89, '0', '1', 'CHANGE', 'app\\models\\User', 'allow_alerts', '2015-06-03 12:34:11', '1', '1'),
(90, NULL, NULL, 'CREATE', 'app\\models\\User', NULL, '2015-06-03 12:35:51', '1', '15'),
(91, '', '15', 'SET', 'app\\models\\User', 'id', '2015-06-03 12:35:51', '1', '15'),
(92, '', 'org3_user5', 'SET', 'app\\models\\User', 'username', '2015-06-03 12:35:51', '1', '15'),
(93, '', 'org3_user5@gmail.com', 'SET', 'app\\models\\User', 'email', '2015-06-03 12:35:51', '1', '15'),
(94, '', '$2y$12$e3dgzNILpYBM.sUiB/zdIOPxSiG2KFvVhJJRnpLV3l5bIQyLsBH7y', 'SET', 'app\\models\\User', 'password_hash', '2015-06-03 12:35:51', '1', '15'),
(95, '', 'a4QabdJNskHnhD7fTSxVVSxlkTqfZQsl', 'SET', 'app\\models\\User', 'auth_key', '2015-06-03 12:35:51', '1', '15'),
(96, '', '1433320551', 'SET', 'app\\models\\User', 'confirmed_at', '2015-06-03 12:35:51', '1', '15'),
(97, '', '127.0.0.1', 'SET', 'app\\models\\User', 'registration_ip', '2015-06-03 12:35:51', '1', '15'),
(98, '', '1433320551', 'SET', 'app\\models\\User', 'created_at', '2015-06-03 12:35:51', '1', '15'),
(99, '', '1433320551', 'SET', 'app\\models\\User', 'updated_at', '2015-06-03 12:35:51', '1', '15'),
(100, '', '10', 'SET', 'app\\models\\User', 'role', '2015-06-03 12:35:51', '1', '15'),
(101, '', '1', 'SET', 'app\\models\\User', 'created_by', '2015-06-03 12:35:51', '1', '15'),
(102, '', '3', 'SET', 'app\\models\\User', 'organization_id', '2015-06-03 12:35:51', '1', '15'),
(103, '', '1', 'SET', 'app\\models\\User', 'allow_alerts', '2015-06-03 12:35:51', '1', '15');

-- --------------------------------------------------------

--
-- Структура таблицы `token`
--

CREATE TABLE IF NOT EXISTS `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `token`
--

INSERT INTO `token` (`user_id`, `code`, `created_at`, `type`) VALUES
(1, '7pHfRzVkfzdlEYOSbydJhjEeGMSs-6Fg', 1432727371, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `role` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `allow_alerts` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`),
  UNIQUE KEY `user_unique_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `role`, `created_by`, `organization_id`, `allow_alerts`) VALUES
(1, 'admin', 'alaevka@gmail.com', '$2y$12$II0rwDFw2k5hy53GhrzvN.MbuSp6n04mKgJIDcHB6uWpA/6sIgwiq', '2kDuR_eRi1jkxTSk5AfPHkJMFud_-XpJ', 1432723621, NULL, NULL, '127.0.0.1', 1432723560, 1433320451, 0, 30, 0, 0, '1'),
(2, 'org1_admin', 'test_user1@gmail.com', '$2y$12$JbbZmWnKYprsRwJFpGnU4e4/x9/dIuxgP2zF6bC024Xpj5OMBaKqm', 'ILi7V4lJde4TLpPbvhgrDCZt0EioPm2G', 1433223166, NULL, NULL, '127.0.0.1', 1433223167, 1433241263, 0, 20, 1, 1, '0'),
(4, 'org1_user_1', 'org1_user_1@gmail.com', '$2y$12$Zim4rkNvghatPqXFtdJNZ.H7h07NHlv72Lee/0SLEdXAFjEQAnN52', '6gFYUOPomrA75QZmg_bpUgyo4xlP3Tu-', 1433231423, NULL, NULL, '127.0.0.1', 1433231423, 1433241276, 0, 10, 2, 1, '0'),
(5, 'org1_user_2', 'org1_user_2@gmail.com', '$2y$12$xhA2nn.dHgy2cmib3aL0SuOEQa3nFMbwR3enmZzb.UMtKGU3NR972', 'cAy6V47TodTykw2DLoeOgzFcjtjeSq53', 1433231464, NULL, NULL, '127.0.0.1', 1433231464, 1433241312, 0, 10, 2, 1, '0'),
(6, 'org2_admin', 'org2_admin2@gmail.com', '$2y$12$5XdN8L0XyYaEkDocrsxyMOsinN7M3zn3UcjfPehRMswsH88OrkdxO', 'n0JZQijznriG2kJ_aBaFxMtQ0eg-y_bI', 1433233731, NULL, NULL, '127.0.0.1', 1433233731, 1433241326, 0, 20, 1, 2, '0'),
(7, 'org2_user1', 'org2_user1@gmail.com', '$2y$12$Kp3Yc7gvNa2j5YQ1w4MphuF.FLWjg1ZS4anmxWrnrPtEkHiYl0POG', 'DTEjyB0Rgtt1VY4FNwH7DJByXj3iyOos', 1433233999, NULL, NULL, '127.0.0.1', 1433233999, 1433241344, 0, 10, 6, 2, '0'),
(8, 'org2_user2', 'org2_user2@gmail.com', '$2y$12$Yi4DfWjMkjVWkoQSkOgJv.AJSTSsNu9I4D8MlKmc48HvVO1yK5HZq', 'ugAyy53WIQVwaACIQi6a5Qk3YaHteT91', 1433234035, NULL, 1433234116, '127.0.0.1', 1433234035, 1433241355, 0, 10, 6, 2, '0'),
(9, 'org2_user3', 'org2_user3@gmail.com', '$2y$12$w8UY3VnmwnvpbfChyksqiugxXW4HwzKo7Y8UxqzBrtO0Wmpsn7ShO', '1fmRwauhz3w09barFrpYmcx4Hzf2exx7', 1433234173, NULL, NULL, '127.0.0.1', 1433234173, 1433241366, 0, 10, 1, 2, '0'),
(10, 'org3_admin', 'org3_admin@gmail.com', '$2y$12$4rl5Nn2A/nnD25yjgoTu3eXqJO.DKTacAdu.tK41FQ/.WsjZ/dCuW', 'IWdlYenp9wa-xyMZ1GWXYlU_6Nk1dhkh', 1433241414, NULL, NULL, '127.0.0.1', 1433241414, 1433241414, 0, 20, 1, 3, '0'),
(12, 'org3_user1', 'org3_user1@gmail.com', '$2y$12$yOH47uLSaAiRSSul9WmRlOQ7tQawRHni1k/6AH6j0GDpdazCq2FiG', 'H_s_olgvwvY3gyxNm06cnQgkYcZpLxgk', 1433317568, NULL, NULL, '127.0.0.1', 0, 1433318140, 0, 10, 10, 3, '0'),
(13, 'org3_user2', 'org3_user2@gmail.com', '$2y$12$syvfM0Jh8ewFj6OIzjY36.KSbSJ7tENQazHdvj9CMA3TJMHtAGQje', 'OCD6VmDgbAAY9p9uMpw_2AbjKAFtqD2w', 1433317968, NULL, NULL, '127.0.0.1', 0, 0, 0, 10, 1, 3, '0'),
(14, 'org3_user3', 'org3_user3@gmail.com', '$2y$12$HIIbt3V4DtVIJFo0W6YIyekhmXwYrRiyuH1qMpzm4p4Ori0LffXpm', 'TRYkYNxQV6yyYKTJZ8BYOKUsb9ikKRUc', 1433318119, NULL, NULL, '127.0.0.1', 1433318119, 1433318119, 0, 10, 1, 3, '0'),
(15, 'org3_user5', 'org3_user5@gmail.com', '$2y$12$e3dgzNILpYBM.sUiB/zdIOPxSiG2KFvVhJJRnpLV3l5bIQyLsBH7y', 'a4QabdJNskHnhD7fTSxVVSxlkTqfZQsl', 1433320551, NULL, NULL, '127.0.0.1', 1433320551, 1433320551, 0, 10, 1, 3, '1');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `social_account`
--
ALTER TABLE `social_account`
  ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
