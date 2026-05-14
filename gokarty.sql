-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2026 at 06:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gokarty`
--

-- --------------------------------------------------------

--
-- Table structure for table `gokarty`
--

CREATE TABLE `gokarty` (
  `id` int(11) NOT NULL,
  `numer` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `klienci`
--

CREATE TABLE `klienci` (
  `id` int(11) NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(60) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rezerwacje`
--

CREATE TABLE `rezerwacje` (
  `id` int(11) NOT NULL,
  `klient_id` int(11) NOT NULL,
  `termin_id` int(11) NOT NULL,
  `l_gokartow` int(11) NOT NULL,
  `cena` decimal(15,0) NOT NULL,
  `uwagi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rezerwacje_gokartow`
--

CREATE TABLE `rezerwacje_gokartow` (
  `id` int(11) NOT NULL,
  `rezerwacja_id` int(11) NOT NULL,
  `gokart_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terminy`
--

CREATE TABLE `terminy` (
  `id` int(11) NOT NULL,
  `start` time NOT NULL,
  `koniec` time NOT NULL,
  `ile_gokartow` int(11) NOT NULL,
  `dostepny` tinyint(1) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gokarty`
--
ALTER TABLE `gokarty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `klient_id` (`klient_id`),
  ADD KEY `termin_id` (`termin_id`);

--
-- Indexes for table `rezerwacje_gokartow`
--
ALTER TABLE `rezerwacje_gokartow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gokart_id` (`gokart_id`),
  ADD KEY `rezerwacja_id` (`rezerwacja_id`);

--
-- Indexes for table `terminy`
--
ALTER TABLE `terminy`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD CONSTRAINT `rezerwacje_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `klienci` (`id`),
  ADD CONSTRAINT `rezerwacje_ibfk_2` FOREIGN KEY (`termin_id`) REFERENCES `terminy` (`id`);

--
-- Constraints for table `rezerwacje_gokartow`
--
ALTER TABLE `rezerwacje_gokartow`
  ADD CONSTRAINT `rezerwacje_gokartow_ibfk_1` FOREIGN KEY (`gokart_id`) REFERENCES `gokarty` (`id`),
  ADD CONSTRAINT `rezerwacje_gokartow_ibfk_2` FOREIGN KEY (`rezerwacja_id`) REFERENCES `rezerwacje` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
