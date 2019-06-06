-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 19-06-06 07:53
-- 서버 버전: 10.1.40-MariaDB
-- PHP 버전: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `db_project`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `restaurant`
--

CREATE TABLE `restaurant` (
  `idrestaurant` int(11) NOT NULL,
  `r_name` varchar(50) NOT NULL,
  `location` varchar(255) NOT NULL,
  `time` varchar(50) DEFAULT NULL,
  `idmenu_type` int(11) DEFAULT NULL,
  `reservation` int(11) DEFAULT '0',
  `phone` int(11) DEFAULT NULL,
  `idlocation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `restaurant`
--

INSERT INTO `restaurant` (`idrestaurant`, `r_name`, `location`, `time`, `idmenu_type`, `reservation`, `phone`, `idlocation`) VALUES
(2, '호식당', '경기 수원시 영통구 영일로 16-10', NULL, 4, 0, NULL, NULL),
(3, '키와미루아지', '경기 수원시 영통구 영일로 8', ' 11:00 - 22:00', 4, 0, 312039015, 2);

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`idrestaurant`),
  ADD UNIQUE KEY `idrestaurant_UNIQUE` (`idrestaurant`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `idrestaurant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
