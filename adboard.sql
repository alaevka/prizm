-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 02 2015 г., 16:12
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
('m141222_110026_update_ip_field', 1432723415);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `objects`
--

INSERT INTO `objects` (`id`, `title`, `address`, `status`, `organization_id`) VALUES
(1, 'Тестовый объект 1', 'г. Пенза, ул. Московская 11', 1, 1),
(2, 'Тестовый объект 2', 'г. Пенза, ул. Суворова, д. 15', 1, 1),
(3, 'Тестовый объект 3', 'г. Пенза, ул. Московская 122', 1, 1),
(4, 'Тестовый объект 4', 'г. Заречный, перед проходной', 1, 1),
(5, 'Тестовый объект 5', 'трасса М5, 626 км, перед Чемодановкой слева', 1, 1);

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
(10, NULL, NULL, 'org3_admin@gmail.com', 'b2fc425621f26427005a6709d8a6920d', NULL, NULL, NULL);

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`),
  UNIQUE KEY `user_unique_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `role`, `created_by`, `organization_id`) VALUES
(1, 'admin', 'alaevka@gmail.com', '$2y$12$cVHJeAFLdKz2EXTsht1vs.r3XdSfRCjzIrV4jGLXstObYL3DurLmG', '2kDuR_eRi1jkxTSk5AfPHkJMFud_-XpJ', 1432723621, NULL, NULL, '127.0.0.1', 1432723560, 1433229808, 0, 30, 0, 0),
(2, 'org1_admin', 'test_user1@gmail.com', '$2y$12$JbbZmWnKYprsRwJFpGnU4e4/x9/dIuxgP2zF6bC024Xpj5OMBaKqm', 'ILi7V4lJde4TLpPbvhgrDCZt0EioPm2G', 1433223166, NULL, NULL, '127.0.0.1', 1433223167, 1433241263, 0, 20, 1, 1),
(4, 'org1_user_1', 'org1_user_1@gmail.com', '$2y$12$Zim4rkNvghatPqXFtdJNZ.H7h07NHlv72Lee/0SLEdXAFjEQAnN52', '6gFYUOPomrA75QZmg_bpUgyo4xlP3Tu-', 1433231423, NULL, NULL, '127.0.0.1', 1433231423, 1433241276, 0, 10, 2, 1),
(5, 'org1_user_2', 'org1_user_2@gmail.com', '$2y$12$xhA2nn.dHgy2cmib3aL0SuOEQa3nFMbwR3enmZzb.UMtKGU3NR972', 'cAy6V47TodTykw2DLoeOgzFcjtjeSq53', 1433231464, NULL, NULL, '127.0.0.1', 1433231464, 1433241312, 0, 10, 2, 1),
(6, 'org2_admin', 'org2_admin2@gmail.com', '$2y$12$5XdN8L0XyYaEkDocrsxyMOsinN7M3zn3UcjfPehRMswsH88OrkdxO', 'n0JZQijznriG2kJ_aBaFxMtQ0eg-y_bI', 1433233731, NULL, NULL, '127.0.0.1', 1433233731, 1433241326, 0, 20, 1, 2),
(7, 'org2_user1', 'org2_user1@gmail.com', '$2y$12$Kp3Yc7gvNa2j5YQ1w4MphuF.FLWjg1ZS4anmxWrnrPtEkHiYl0POG', 'DTEjyB0Rgtt1VY4FNwH7DJByXj3iyOos', 1433233999, NULL, NULL, '127.0.0.1', 1433233999, 1433241344, 0, 10, 6, 2),
(8, 'org2_user2', 'org2_user2@gmail.com', '$2y$12$PAupbfUtT6ws0D7Ncx0ycOPOosqScEcBCNGldmVD7m423LncWIWqm', 'ugAyy53WIQVwaACIQi6a5Qk3YaHteT91', 1433234035, NULL, 1433234116, '127.0.0.1', 1433234035, 1433241355, 0, 10, 6, 2),
(9, 'org2_user3', 'org2_user3@gmail.com', '$2y$12$w8UY3VnmwnvpbfChyksqiugxXW4HwzKo7Y8UxqzBrtO0Wmpsn7ShO', '1fmRwauhz3w09barFrpYmcx4Hzf2exx7', 1433234173, NULL, NULL, '127.0.0.1', 1433234173, 1433241366, 0, 10, 1, 2),
(10, 'org3_admin', 'org3_admin@gmail.com', '$2y$12$4rl5Nn2A/nnD25yjgoTu3eXqJO.DKTacAdu.tK41FQ/.WsjZ/dCuW', 'IWdlYenp9wa-xyMZ1GWXYlU_6Nk1dhkh', 1433241414, NULL, NULL, '127.0.0.1', 1433241414, 1433241414, 0, 20, 1, 3);

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
