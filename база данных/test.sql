-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 04 2024 г., 14:55
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `comment_text` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `page_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `username`, `comment_text`, `created_at`, `page_id`) VALUES
(1, 'ioioioio', 'рошафыврыаврфызща фц', '2024-05-27 08:38:10', NULL),
(2, 'ioioioio', 'коммент для проверки работоспособности этой функции', '2024-05-27 08:45:32', '<?php echo htmlspecialchars($_SERVER[\'REQUEST_URI\']); ?>'),
(3, 'ioioioio', 'rjvtyyn ', '2024-05-27 08:56:02', '<?php echo htmlspecialchars($_GET[\'page_id\']); ?>'),
(4, 'ioioioio', 'чтото', '2024-05-27 08:57:01', '<?php echo htmlspecialchars($_GET[\'page_id\']); ?>'),
(5, 'ioioioio', 'чтото', '2024-05-27 08:58:03', '<?php echo htmlspecialchars($_GET[\'page_id\']); ?>'),
(6, 'ioioioio', 'чтотото', '2024-05-27 08:58:59', 'CHERV'),
(7, 'ioioioio', 'чтотото', '2024-05-27 08:59:36', 'CHERV'),
(8, 'ioioioio', '123', '2024-05-27 09:00:02', 'CHERV'),
(9, 'ioioioio', '321', '2024-05-27 09:02:37', 'CHERV'),
(10, 'ioioioio', '321', '2024-05-27 09:03:15', 'CHERV'),
(11, 'ioioioio', '456', '2024-05-27 09:06:15', 'CHERV'),
(12, 'pop', '789', '2024-05-27 09:20:24', 'CHERV'),
(13, 'pop', '789', '2024-05-27 09:22:20', 'CHERV'),
(14, 'pop', 'ghbdtn\r\n', '2024-05-27 09:23:21', 'CHERV'),
(15, 'pop', '890', '2024-05-27 09:24:28', 'CHERV'),
(16, 'pop', 'Александр хороший программист(ХАХА, конечно)', '2024-05-27 09:31:49', 'CHERV'),
(17, 'CHLEN', 'Привет лох', '2024-05-30 12:47:17', 'CHERV'),
(18, 'CHLEN', 'Еще раз привет\r\n', '2024-05-30 12:49:38', 'CHERV'),
(19, 'CHLEN', 'Даров чел\r\n', '2024-05-30 12:50:43', 'CHERV'),
(20, 'CHLEN', 'Я русский\r\n', '2024-05-30 12:52:25', 'CHERV'),
(21, 'CHLEN', 'Да хватит', '2024-05-30 12:54:52', 'CHERV'),
(22, 'CHLEN', 'Кто ты', '2024-05-30 12:58:50', 'CHERV'),
(23, 'CHLEN', 'Заходи ', '2024-05-30 13:00:52', 'CHERV'),
(24, 'CHLEN', 'Коммент дял проверки', '2024-05-30 13:01:44', 'CHERV');

-- --------------------------------------------------------

--
-- Структура таблицы `requst`
--

CREATE TABLE `requst` (
  `id` int NOT NULL,
  `user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `requst`
--

INSERT INTO `requst` (`id`, `user`, `name`, `text`, `status`) VALUES
(1, 'admin', 'Z', 'VV', 'В процессе');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isadmin` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `isadmin`) VALUES
(1, 'user', 0),
(2, 'admin', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id` int NOT NULL,
  `stat` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id`, `stat`) VALUES
(1, 'Новое'),
(2, 'В процессе '),
(3, 'Выполнено');

-- --------------------------------------------------------

--
-- Структура таблицы `type`
--

CREATE TABLE `type` (
  `id` int NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `pass` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`login`, `email`, `pass`, `role`) VALUES
('admin', '', '1', 2),
('ioioioio', 'ioioioio@gmail.com', '$2y$10$tWmq5L6U0ezrt4/KLTWJXeKBmedh8RSpWKapfXei2NCZe/.UkxYyK', 1),
('pop', 'popka123@gmail.com', '$2y$10$fd1GgFDLe/n.mQsabkF7WO0v8NyOijk4forYHseRVnOcdoXRF/t4q', 1),
('CHLEN', 'CHLEN123@gmail.com', '$2y$10$sxR2MgKF1ahII.AAJbqMEegU.pawg9rAL8A0jvuBpzaGcquny6XnW', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users-data`
--

CREATE TABLE `users-data` (
  `id` int NOT NULL,
  `login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pass` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users-data`
--

INSERT INTO `users-data` (`id`, `login`, `email`, `pass`) VALUES
(3, 'admin', '', '');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `requst`
--
ALTER TABLE `requst`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users-data`
--
ALTER TABLE `users-data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `requst`
--
ALTER TABLE `requst`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `type`
--
ALTER TABLE `type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users-data`
--
ALTER TABLE `users-data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
