-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 19-06-04 09:04
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
-- 테이블 구조 `location`
--

CREATE TABLE `location` (
  `idlocation` int(11) NOT NULL,
  `loc_name` varchar(50) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `location`
--

INSERT INTO `location` (`idlocation`, `loc_name`, `time`) VALUES
(1, '학교', 0),
(2, '정문건너', 10),
(3, '영일중', 15),
(4, '서천동', 25),
(5, '영통중심상가', 30);

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`idlocation`),
  ADD UNIQUE KEY `loc_name_UNIQUE` (`loc_name`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `location`
--
ALTER TABLE `location`
  MODIFY `idlocation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
