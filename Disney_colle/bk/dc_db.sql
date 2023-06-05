-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2023 年 6 月 05 日 15:12
-- サーバのバージョン： 10.4.28-MariaDB
-- PHP のバージョン: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `dc_db`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `disney_colle`
--

CREATE TABLE `disney_colle` (
  `id` int(12) NOT NULL,
  `year` varchar(4) NOT NULL,
  `place` varchar(30) NOT NULL,
  `category` varchar(30) NOT NULL,
  `img` varchar(30) NOT NULL,
  `naiyou` text NOT NULL,
  `indate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `disney_colle`
--

INSERT INTO `disney_colle` (`id`, `year`, `place`, `category`, `img`, `naiyou`, `indate`) VALUES
(4, '2005', 'ランド', 'チャーム', 'rockaroundthe_mouse.jpeg', 'Rock', '2023-05-29 21:45:59'),
(5, '2001', 'シー', 'チャーム', '1stanniversary disneysea.jpeg', 'disneysea', '2023-05-29 21:50:20'),
(6, '2003', 'ランド', 'チャーム', 'Christmas.jpeg', 'Christmas Fantasy', '2023-05-29 21:57:32'),
(7, '2006', 'ランド', 'チャーム', 'PrincessDays.jpeg', 'PrincessDays', '2023-05-29 22:00:05'),
(8, '2003', 'ランド', 'メダル', 'Blazing_Rhythms.jpeg', 'Blazing_Rhythms', '2023-05-29 22:53:30'),
(9, '2004', 'ランド', 'チャーム', 'Countdown_Parade2004.jpeg', 'Countdown_Parade2004', '2023-05-29 22:56:46'),
(10, '1984', 'ランド', 'ピン', '1st_Anniversary.jpeg', '1st_Anniversary', '2023-05-29 22:59:19'),
(11, '1981', 'ランド', 'チャーム', 'Blazing_Rhythms.jpeg', 'test', '2023-05-29 23:42:41'),
(12, '1980', 'シー', 'メダル', 'ヘルメット.jpg', 'test', '2023-05-30 00:07:33'),
(13, '1981', 'リゾートライン', 'チャーム', 'Christmas.jpeg', 'test', '2023-05-30 00:08:11'),
(14, '1980', 'シー', 'メダル', 'PrincessDays.jpeg', 'test1', '2023-05-30 13:49:45'),
(16, '1982', 'ランド', 'メダル', 'rockaroundthe_mouse.jpeg', 't', '2023-05-30 14:00:44'),
(17, '1983', 'リゾートライン', 'メダル', 'ヘルメット.jpg', 'test', '2023-05-30 17:16:53'),
(19, '1987', 'シー', 'チャーム', 'rockaroundthe_mouse.jpeg', 'テスト１２３４５', '2023-05-30 18:39:32'),
(20, '1980', 'ランド', 'チャーム', 'Countdown_Parade2004.jpeg', 'test', '2023-05-31 11:54:48'),
(22, '1980', 'ランド', 'チャーム', 'Countdown_Parade2004.jpeg', 'test', '2023-06-02 17:38:46'),
(23, '1980', 'ランド', 'チャーム', 'Blazing_Rhythms.jpeg', 'test', '2023-06-02 17:39:16'),
(24, '2001', 'シー', 'チャーム', '1stanniversary disneysea.jpeg', 'test2', '2023-06-02 17:40:34'),
(25, '1980', 'ランド', 'チャーム', '1st_Anniversary.jpeg', '1st', '2023-06-02 17:44:50');

-- --------------------------------------------------------

--
-- テーブルの構造 `disney_user_table`
--

CREATE TABLE `disney_user_table` (
  `id` int(12) NOT NULL,
  `name` varchar(64) NOT NULL,
  `lid` varchar(128) NOT NULL,
  `lpw` varchar(256) NOT NULL,
  `kanri_flg` int(1) NOT NULL,
  `life_flg` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `disney_user_table`
--

INSERT INTO `disney_user_table` (`id`, `name`, `lid`, `lpw`, `kanri_flg`, `life_flg`) VALUES
(4, 'Chanshi', '111', '$2y$10$gG7Uq9DkmZiVfLabFYK2KO.5xNPxYDkWwxOaSRPqezP4WX4KiQyYG', 1, 0),
(5, 'Chanssie', '222', '$2y$10$TtvddVk/1yPzJydxyJ3kxuaAhhhOdriTw2WbOVpWnT3U/h9fEFV2G', 0, 0);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `disney_colle`
--
ALTER TABLE `disney_colle`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `disney_user_table`
--
ALTER TABLE `disney_user_table`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `disney_colle`
--
ALTER TABLE `disney_colle`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- テーブルの AUTO_INCREMENT `disney_user_table`
--
ALTER TABLE `disney_user_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
