-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- 생성 시간: 18-01-30 15:54
-- 서버 버전: 10.1.28-MariaDB
-- PHP 버전: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `social`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `board_free`
--

CREATE TABLE `board_free` (
  `b_no` int(10) UNSIGNED NOT NULL,
  `b_type` varchar(100) NOT NULL,
  `b_title` varchar(100) NOT NULL,
  `b_content` text NOT NULL,
  `b_date` datetime NOT NULL,
  `b_hit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `b_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `board_free`
--

INSERT INTO `board_free` (`b_no`, `b_type`, `b_title`, `b_content`, `b_date`, `b_hit`, `b_id`) VALUES
(109, 'b_free', 'ìžìœ ê²Œì‹œíŒ', 'ê¸€ì“°ê¸°', '2018-01-03 07:28:59', 1, 'ryan_cha'),
(110, 'b_job', 'ì·¨ì§ìƒë‹´', 'í•´ì£¼ì„¸ìš”', '2018-01-03 07:37:25', 0, 'ryan_cha'),
(111, 'b_job', '2', '2', '2018-01-03 07:37:35', 0, 'ryan_cha'),
(112, 'b_job', '2', '2', '2018-01-03 07:38:58', 1, 'ryan_cha'),
(113, 'b_job', '3', '3', '2018-01-03 07:39:11', 0, 'ryan_cha'),
(114, 'b_job', '4', '4', '2018-01-03 07:39:32', 0, 'ryan_cha'),
(115, 'b_job', '5', '5', '2018-01-03 07:39:49', 0, 'ryan_cha'),
(116, 'b_job', '5', '5', '2018-01-03 07:40:30', 0, 'ryan_cha'),
(117, 'b_job', '5', '5', '2018-01-03 07:41:37', 0, 'ryan_cha'),
(118, 'b_job', '5', '555', '2018-01-03 07:41:42', 0, 'ryan_cha'),
(119, 'b_job', '555', '555', '2018-01-03 07:43:22', 2, 'ryan_cha'),
(120, 'b_free', 'ìžìœ ê²Œì‹œíŒ2', '2', '2018-01-03 07:44:05', 1, 'ryan_cha'),
(121, 'b_thinking', 'ê³ ë¯¼ìƒë‹´1', '1', '2018-01-03 07:44:24', 1, 'ryan_cha'),
(122, 'b_business', '2018ë…„ ë¬´ìˆ ë…„ ìš´ì„¸', 'ì¢€ ê°€ë¥´ì³ ì£¼ì„¸ìš”', '2018-01-03 10:38:14', 2, 'ryan_cha'),
(123, 'b_business', 'ë§Œë“¤ì–´ì•¼ í•  ê²ƒ ', '1. ì—­ìˆ ì¸ ì°¾ê¸° ì‹œìŠ¤í…œ\r\n2. ì—­ìˆ ì¸ ìŠ¤ì¼€ì¤„ ê´€ë¦¬ ì‹œìŠ¤í…œ\r\n3. ì¡°ê±´ ê²€ìƒ‰í•˜ì—¬ ì‚¬ëžŒ ì°¾ê¸°\r\n4. ê²°ì œ ì‹œìŠ¤í…œ', '2018-01-05 05:44:32', 1, 'ryan_cha'),
(124, 'b_free', 'ìžìœ¨ì ìœ¼ë¡œ', 'ì¼í•©ì‹œë‹¤.', '2018-01-05 06:34:57', 1, 'captain_america');

-- --------------------------------------------------------

--
-- 테이블 구조 `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `posted_by` varchar(60) NOT NULL,
  `posted_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `comments`
--

INSERT INTO `comments` (`id`, `post_body`, `posted_by`, `posted_to`, `date_added`, `removed`, `post_id`) VALUES
(1, 'good singer!', 'ryan_cha', 'ryan_cha', '2017-12-04 03:21:12', 'no', 8),
(2, 'Hey Captain, What\'s up?', 'ryan_cha', 'captain_america', '2017-12-04 06:26:44', 'no', 5);

-- --------------------------------------------------------

--
-- 테이블 구조 `comment_free`
--

CREATE TABLE `comment_free` (
  `co_no` int(10) UNSIGNED NOT NULL,
  `b_no` int(10) UNSIGNED NOT NULL,
  `co_order` int(10) UNSIGNED DEFAULT '0',
  `co_content` text NOT NULL,
  `co_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `comment_free`
--

INSERT INTO `comment_free` (`co_no`, `b_no`, `co_order`, `co_content`, `co_id`) VALUES
(2, 47, 2, '123', '123'),
(3, 47, 3, '1', '1'),
(4, 47, 4, '123', 'ryan'),
(5, 47, 5, 'ryan', 'ryan'),
(6, 47, 2, 'twoDepth', 'ryan_cha'),
(7, 47, 7, '123', 'ryan_cha'),
(8, 47, 2, '123', 'ryan_cha'),
(9, 41, 9, 'ã…ã„´ã…‡ã„¹', 'captain_america'),
(16, 52, 16, 'í•˜ì„¸ìš”', 'ryan_cha'),
(18, 52, 16, 'da', 'captain_america'),
(20, 61, 20, '', 'ryan_cha'),
(22, 81, 22, 'I am fine, and you?', 'ryan_cha'),
(23, 82, 23, 'yes today is tuesday\r\n', 'aragaki_yui'),
(31, 119, 31, 'ë¼ì´ì–¸ ìž˜ ì§€ë‚´?', 'captain_america');

-- --------------------------------------------------------

--
-- 테이블 구조 `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 테이블 구조 `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `likes`
--

INSERT INTO `likes` (`id`, `username`, `post_id`) VALUES
(1, 'captain_america', 3),
(2, 'ryan_cha', 5),
(3, 'captain_america', 15),
(4, 'aragaki_yui', 20);

-- --------------------------------------------------------

--
-- 테이블 구조 `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `messages`
--

INSERT INTO `messages` (`id`, `user_to`, `user_from`, `body`, `date`, `opened`, `viewed`, `deleted`) VALUES
(3, 'captain_america', 'ryan_cha', 'hey', '2017-12-03 13:40:19', 'yes', 'yes', 'no'),
(4, 'ryan_cha', 'captain_america', 'Nice to meet you\r\n', '2017-12-03 13:41:11', 'yes', 'yes', 'no'),
(5, 'captain_america', 'ryan_cha', 'hey captain\r\n', '2017-12-06 03:49:01', 'yes', 'yes', 'no'),
(6, 'ryan_cha', 'captain_america', 'how are you doing?', '2017-12-06 03:49:37', 'yes', 'yes', 'no'),
(7, 'captain_america', 'ryan_cha', 'num_iterations\r\n', '2017-12-06 03:50:09', 'yes', 'yes', 'no'),
(8, 'captain_america', 'ryan_cha', 'I don\'t understand', '2017-12-06 03:50:18', 'yes', 'yes', 'no'),
(9, 'ryan_cha', 'captain_america', 'a', '2017-12-06 03:50:58', 'yes', 'yes', 'no'),
(10, 'ryan_cha', 'captain_america', 'b', '2017-12-06 03:50:59', 'yes', 'yes', 'no'),
(11, 'ryan_cha', 'captain_america', 'c', '2017-12-06 03:51:00', 'yes', 'yes', 'no'),
(12, 'ryan_cha', 'captain_america', 'd', '2017-12-06 03:51:01', 'yes', 'yes', 'no'),
(13, 'ryan_cha', 'a__team', 'Hi this is Ateam', '2017-12-06 03:53:54', 'yes', 'yes', 'no'),
(15, 'a__team', 'ryan_cha', 'Hello Ateam', '2017-12-06 03:54:43', 'yes', 'yes', 'no'),
(17, 'a__team', 'a__team', 'a', '2017-12-06 03:58:03', 'yes', 'yes', 'no'),
(19, 'a__team', 'ryan_cha', 'a', '2017-12-06 03:58:25', 'yes', 'yes', 'no'),
(20, 'ryan_cha', 'a__team', 'aaa', '2017-12-06 04:02:49', 'yes', 'yes', 'no'),
(21, 'a__team', 'ryan_cha', 'ghe\r\nafsdf', '2017-12-06 04:04:40', 'yes', 'yes', 'no');

-- --------------------------------------------------------

--
-- 테이블 구조 `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `notifications`
--

INSERT INTO `notifications` (`id`, `user_to`, `user_from`, `message`, `link`, `datetime`, `opened`, `viewed`) VALUES
(1, 'ryan_cha', 'captain_america', 'Captain America liked your post', 'post.php?id=0', '2017-12-03 13:39:23', 'yes', 'yes'),
(2, 'captain_america', 'ryan_cha', 'Ryan Cha liked your post', 'post.php?id=0', '2017-12-03 13:40:01', 'yes', 'yes'),
(3, 'ryan_cha', 'captain_america', 'Captain America liked your post', 'post.php?id=0', '2017-12-03 15:12:05', 'yes', 'yes'),
(4, 'ryan_cha', 'captain_america', 'Captain America liked your post', 'post.php?id=0', '2017-12-04 01:36:13', 'yes', 'yes'),
(5, 'ryan_cha', 'captain_america', 'Captain America liked your post', 'post.php?id=5', '2017-12-04 02:32:58', 'yes', 'yes'),
(6, 'captain_america', 'ryan_cha', 'Ryan Cha liked your post', 'post.php?id=7', '2017-12-04 02:42:28', 'yes', 'yes'),
(7, 'captain_america', 'ryan_cha', 'Ryan Cha commented on your post', 'post.php?id=5', '2017-12-04 06:26:44', 'yes', 'yes'),
(8, 'captain_america', 'ryan_cha', 'Ryan Cha liked your post', 'post.php?id=5', '2017-12-04 06:26:45', 'yes', 'yes'),
(9, 'captain_america', 'a__team', 'A_ Team liked your post', 'post.php?id=15', '2017-12-07 00:36:38', 'no', 'yes'),
(10, 'ryan_cha', 'hulk_frank', 'Hulk Frank liked your post', 'post.php?id=16', '2017-12-07 07:17:26', 'yes', 'yes'),
(11, 'ryan_cha', 'iron_man', 'Iron Man liked your post', 'post.php?id=17', '2017-12-07 07:17:42', 'yes', 'yes'),
(12, 'ryan_cha', 'bet_man', 'Bet Man liked your post', 'post.php?id=18', '2017-12-07 07:17:59', 'yes', 'yes'),
(13, 'ryan_cha', 'wonder_woman', 'Wonder Woman liked your post', 'post.php?id=19', '2017-12-07 07:18:55', 'yes', 'yes'),
(14, 'ryan_cha', 'aragaki_yui', 'Aragaki Yui liked your post', 'post.php?id=20', '2017-12-07 07:20:19', 'yes', 'yes'),
(15, 'ryan_cha', 'ayase_haruka', 'Ayase Haruka liked your post', 'post.php?id=21', '2017-12-07 07:22:14', 'yes', 'yes'),
(16, 'ryan_cha', 'hirosu_suzu', 'Hirosu Suzu liked your post', 'post.php?id=22', '2017-12-07 07:22:24', 'yes', 'yes'),
(17, 'ryan_cha', 'ishihara_satomi', 'Ishihara Satomi liked your post', 'post.php?id=23', '2017-12-07 07:22:57', 'yes', 'yes'),
(18, 'a__team', 'captain_america', 'Captain America liked your post', 'post.php?id=15', '2017-12-21 07:09:54', 'no', 'no');

-- --------------------------------------------------------

--
-- 테이블 구조 `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `added_by` varchar(60) NOT NULL,
  `user_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL,
  `likes` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `user_to`, `date_added`, `user_closed`, `deleted`, `likes`, `image`) VALUES
(1, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/ihFPDZIWlnA\'></iframe><br>', 'captain_america', 'none', '2017-12-04 02:17:54', 'no', 'yes', 0, ''),
(2, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/ihFPDZIWlnA\'></iframe><br>', 'captain_america', 'none', '2017-12-04 02:18:44', 'no', 'yes', 0, ''),
(3, 'Hello This is Jeongmin. How are you doing?', 'captain_america', 'none', '2017-12-04 02:20:06', 'no', 'no', 1, ''),
(4, 'This is my second post how are you doing?', 'captain_america', 'none', '2017-12-04 02:32:43', 'no', 'no', 0, ''),
(5, 'Hi Ryan', 'captain_america', 'ryan_cha', '2017-12-04 02:32:58', 'no', 'no', 1, ''),
(6, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/lViP0oUuO84\'></iframe><br>', 'captain_america', 'none', '2017-12-04 02:33:42', 'no', 'no', 0, ''),
(7, 'Hey Captain, When is your birthday?', 'ryan_cha', 'captain_america', '2017-12-04 02:42:28', 'no', 'no', 0, ''),
(8, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/k2qgadSvNyU\'></iframe><br>', 'ryan_cha', 'none', '2017-12-04 03:19:24', 'no', 'yes', 0, ''),
(9, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/k2qgadSvNyU\'></iframe><br>', 'ryan_cha', 'none', '2017-12-04 06:24:45', 'no', 'yes', 0, ''),
(10, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/k2qgadSvNyU\'></iframe><br>', 'ryan_cha', 'none', '2017-12-04 06:25:17', 'no', 'yes', 0, ''),
(11, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/k2qgadSvNyU\'></iframe><br>', 'ryan_cha', 'none', '2017-12-04 06:25:22', 'no', 'yes', 0, ''),
(12, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/k2qgadSvNyU\'></iframe><br>', 'ryan_cha', 'none', '2017-12-04 06:25:30', 'no', 'yes', 0, ''),
(13, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/k2qgadSvNyU\'></iframe><br>', 'ryan_cha', 'none', '2017-12-04 06:25:35', 'no', 'yes', 0, ''),
(14, 'I am going to launch this website! on 5 June 2018!', 'ryan_cha', 'none', '2017-12-04 09:19:06', 'no', 'no', 0, ''),
(15, 'hey', 'a__team', 'captain_america', '2017-12-07 00:36:38', 'no', 'no', 1, ''),
(16, 'Hello Ryan<br /> ', 'hulk_frank', 'ryan_cha', '2017-12-07 07:17:26', 'no', 'no', 0, ''),
(17, 'HI', 'iron_man', 'ryan_cha', '2017-12-07 07:17:42', 'no', 'no', 0, ''),
(18, 'ryan', 'bet_man', 'ryan_cha', '2017-12-07 07:17:59', 'no', 'no', 0, ''),
(19, 'HEY', 'wonder_woman', 'ryan_cha', '2017-12-07 07:18:55', 'no', 'no', 0, ''),
(20, 'ho<br /> ', 'aragaki_yui', 'ryan_cha', '2017-12-07 07:20:19', 'no', 'no', 1, ''),
(21, 'a<br /> ', 'ayase_haruka', 'ryan_cha', '2017-12-07 07:22:14', 'no', 'no', 0, ''),
(22, 'a', 'hirosu_suzu', 'ryan_cha', '2017-12-07 07:22:24', 'no', 'no', 0, ''),
(23, 'd', 'ishihara_satomi', 'ryan_cha', '2017-12-07 07:22:57', 'no', 'no', 0, ''),
(24, 'https://www.youtube.com/embed/-tKVN2mAKRI', 'ryan_cha', 'none', '2017-12-08 05:04:40', 'no', 'yes', 0, ''),
(25, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/-tKVN2mAKRI\'></iframe><br>', 'ryan_cha', 'none', '2017-12-08 05:05:25', 'no', 'yes', 0, ''),
(26, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/-tKVN2mAKRI\'></iframe><br>', 'ryan_cha', 'none', '2017-12-08 05:05:29', 'no', 'yes', 0, ''),
(27, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/-tKVN2mAKRI\'></iframe><br>', 'ryan_cha', 'none', '2017-12-08 05:05:36', 'no', 'yes', 0, ''),
(28, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/-tKVN2mAKRI\'></iframe><br>', 'ryan_cha', 'none', '2017-12-08 05:05:40', 'no', 'yes', 0, ''),
(29, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/-tKVN2mAKRI\'></iframe><br>', 'ryan_cha', 'none', '2017-12-08 05:05:45', 'no', 'yes', 0, ''),
(30, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/-tKVN2mAKRI\'></iframe><br>', 'ryan_cha', 'none', '2017-12-08 05:05:49', 'no', 'yes', 0, ''),
(31, 'https://www.youtube.com/embed/-tKVN2mAKRI', 'ryan_cha', 'none', '2017-12-08 06:52:43', 'no', 'yes', 0, ''),
(32, 'https://www.youtube.com/embed/-tKVN2mAKRI', 'ryan_cha', 'none', '2017-12-08 06:52:54', 'no', 'yes', 0, ''),
(33, 'https://www.youtube.com/embed/-tKVN2mAKRI', 'ryan_cha', 'none', '2017-12-08 06:53:29', 'no', 'yes', 0, ''),
(34, 'https://www.youtube.com/embed/-tKVN2mAKRI', 'ryan_cha', 'none', '2017-12-08 06:55:57', 'no', 'yes', 0, ''),
(35, 'https://www.youtube.com/embed/-tKVN2mAKRI', 'ryan_cha', 'none', '2017-12-08 06:56:00', 'no', 'yes', 0, ''),
(36, 'https://www.youtube.com/embed/-tKVN2mAKRI', 'ryan_cha', 'none', '2017-12-08 06:56:08', 'no', 'yes', 0, ''),
(37, 'a', 'ryan_cha', 'none', '2017-12-08 07:50:48', 'no', 'yes', 0, 'assets/images/posts/5a2a4458340415a2a444d21ef75a2a4443a5abd59477a06cc889harrysImage.jpg'),
(38, 'I like her', 'ryan_cha', 'none', '2017-12-08 07:52:24', 'no', 'yes', 0, 'assets/images/posts/5a2a44b828cf8á„‰á…³á„á…³á„…á…µá†«á„‰á…£á†º 2017-12-07 á„‹á…©á„’á…® 3.26.35.png'),
(39, 'I like her', 'ryan_cha', 'none', '2017-12-08 10:28:27', 'no', 'yes', 0, 'assets/images/posts/5a2a694b2825bá„‰á…³á„á…³á„…á…µá†«á„‰á…£á†º 2017-12-07 á„‹á…©á„’á…® 3.26.35.png'),
(40, 'I like her', 'ryan_cha', 'none', '2017-12-08 10:28:31', 'no', 'yes', 0, 'assets/images/posts/5a2a694fad360á„‰á…³á„á…³á„…á…µá†«á„‰á…£á†º 2017-12-07 á„‹á…©á„’á…® 3.26.35.png'),
(41, 'I like her', 'ryan_cha', 'none', '2017-12-08 10:30:00', 'no', 'yes', 0, 'assets/images/posts/5a2a69a801561á„‰á…³á„á…³á„…á…µá†«á„‰á…£á†º 2017-12-07 á„‹á…©á„’á…® 3.26.35.png'),
(42, 'I like her', 'ryan_cha', 'none', '2017-12-08 10:30:02', 'no', 'yes', 0, 'assets/images/posts/5a2a69aa51995á„‰á…³á„á…³á„…á…µá†«á„‰á…£á†º 2017-12-07 á„‹á…©á„’á…® 3.26.35.png'),
(43, 'I like her', 'ryan_cha', 'none', '2017-12-08 10:30:04', 'no', 'yes', 0, 'assets/images/posts/5a2a69ac736f5á„‰á…³á„á…³á„…á…µá†«á„‰á…£á†º 2017-12-07 á„‹á…©á„’á…® 3.26.35.png');

-- --------------------------------------------------------

--
-- 테이블 구조 `trends`
--

CREATE TABLE `trends` (
  `title` varchar(50) NOT NULL,
  `hits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `trends`
--

INSERT INTO `trends` (`title`, `hits`) VALUES
('Post', 2),
('Br', 1),
('Hi', 5),
('Ryan', 3),
('DF', 4),
('ASDF', 6),
('ASDFSADFSF', 4),
('SADF', 3),
('Posts', 1),
('Ddd', 2),
('Therebr', 2),
('Dsfg', 3),
('Asdfdsfdsfdsfdfdddddd', 1),
('Assbr', 1),
('Hibr', 1),
('Bkjjjkj', 1),
('Bhjhj', 2),
('Sadfadsf', 1),
('Asfsdfasdfsdfafs', 1),
('Hello', 2),
('Jeongmin', 1),
('Doing', 2),
('Captain', 1),
('Birthday', 1),
('Launch', 1),
('Website', 1),
('5', 1),
('June', 1),
('2018', 1),
('Ryanbr', 1),
('Hobr', 1),
('Abr', 1);

-- --------------------------------------------------------

--
-- 테이블 구조 `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `num_posts` int(11) NOT NULL,
  `num_likes` int(11) NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `friend_array` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `signup_date`, `profile_pic`, `num_posts`, `num_likes`, `user_closed`, `friend_array`) VALUES
(11, 'Ryan', 'Cha', 'ryan_cha', 'Ryancha1205@gmail.com', '440ac85892ca43ad26d44c7ad9d47d3e', '2017-12-03', 'assets/images/profile_pics/ryan_chac4437d59a7bcea50711f836abe1bf1bbn.jpeg', 49, 0, 'no', ',captain_america,a__team,hulk_frank,hulk_frank,iron_man,bet_man,bet_man,wonder_woman,aragaki_yui,aragaki_yui,ayase_haruka,ayase_haruka,hirosu_suzu,ishihara_satomi,ishihara_satomi,'),
(12, 'Captain', 'America', 'captain_america', 'Captain@gmail.com', '440ac85892ca43ad26d44c7ad9d47d3e', '2017-12-03', 'assets/images/profile_pics/captain_americae226e06de9f5837e6983e79ed21b8b58n.jpeg', 24, 2, 'no', ',ryan_cha,a__team,'),
(13, 'A_', 'Team', 'a__team', 'Ateam@gmail.com', '440ac85892ca43ad26d44c7ad9d47d3e', '2017-12-06', 'assets/images/profile_pics/defaults/head_emerald.png', 1, 1, 'no', ',ryan_cha,captain_america,'),
(14, 'Hulk', 'Frank', 'hulk_frank', 'Hulk@gmail.com', '440ac85892ca43ad26d44c7ad9d47d3e', '2017-12-07', 'assets/images/profile_pics/defaults/head_emerald.png', 1, 0, 'no', ',ryan_cha,ryan_cha,'),
(15, 'Iron', 'Man', 'iron_man', 'Ironman@gmail.com', '440ac85892ca43ad26d44c7ad9d47d3e', '2017-12-07', 'assets/images/profile_pics/defaults/head_deep_blue.png', 1, 0, 'no', ',ryan_cha,'),
(16, 'Bet', 'Man', 'bet_man', 'Betman@gmail.com', '440ac85892ca43ad26d44c7ad9d47d3e', '2017-12-07', 'assets/images/profile_pics/defaults/head_deep_blue.png', 1, 0, 'no', ',ryan_cha,ryan_cha,'),
(17, 'Wonder', 'Woman', 'wonder_woman', 'Wonderwoman@gmail.com', '440ac85892ca43ad26d44c7ad9d47d3e', '2017-12-07', 'assets/images/profile_pics/defaults/head_deep_blue.png', 1, 0, 'no', ',ryan_cha,'),
(18, 'Aragaki', 'Yui', 'aragaki_yui', 'Aragaki@gmail.com', '440ac85892ca43ad26d44c7ad9d47d3e', '2017-12-07', 'assets/images/profile_pics/aragaki_yuicb239e03beb2787b0b070fab103b6507n.jpeg', 1, 1, 'no', ',ryan_cha,ryan_cha,'),
(19, 'Ayase', 'Haruka', 'ayase_haruka', 'Ayase@gmail.com', '440ac85892ca43ad26d44c7ad9d47d3e', '2017-12-07', 'assets/images/profile_pics/defaults/head_emerald.png', 1, 0, 'no', ',ryan_cha,ryan_cha,'),
(20, 'Hirosu', 'Suzu', 'hirosu_suzu', 'Hirose@gmail.com', '440ac85892ca43ad26d44c7ad9d47d3e', '2017-12-07', 'assets/images/profile_pics/defaults/head_deep_blue.png', 1, 0, 'no', ',ryan_cha,'),
(21, 'Ishihara', 'Satomi', 'ishihara_satomi', 'Ishihara@gmail.com', '440ac85892ca43ad26d44c7ad9d47d3e', '2017-12-07', 'assets/images/profile_pics/defaults/head_deep_blue.png', 1, 0, 'no', ',ryan_cha,ryan_cha,'),
(22, 'Jeongmin', 'Cha', 'jeongmin_cha', 'Jeongmin@example.com', '13fb5e47468b33f5caa86f75aa7f21e3', '2018-01-29', 'assets/images/profile_pics/defaults/head_deep_blue.png', 0, 0, 'no', ',');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `board_free`
--
ALTER TABLE `board_free`
  ADD PRIMARY KEY (`b_no`);

--
-- 테이블의 인덱스 `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `comment_free`
--
ALTER TABLE `comment_free`
  ADD PRIMARY KEY (`co_no`);

--
-- 테이블의 인덱스 `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `board_free`
--
ALTER TABLE `board_free`
  MODIFY `b_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- 테이블의 AUTO_INCREMENT `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 테이블의 AUTO_INCREMENT `comment_free`
--
ALTER TABLE `comment_free`
  MODIFY `co_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- 테이블의 AUTO_INCREMENT `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 테이블의 AUTO_INCREMENT `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- 테이블의 AUTO_INCREMENT `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 테이블의 AUTO_INCREMENT `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- 테이블의 AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
