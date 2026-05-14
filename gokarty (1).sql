-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2026 at 10:57 PM
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

--
-- Dumping data for table `gokarty`
--

INSERT INTO `gokarty` (`id`, `numer`, `model`, `status`) VALUES
(1, '67', 'a', 'sprawny'),
(2, '12', 'b', 'sprawny'),
(3, '77', 'c', 'nie ma kol');

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

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`id`, `imie`, `nazwisko`, `email`, `telefon`) VALUES
(1, 'jan', 'kowalski', 'jankowalski@gmail.com', '000000000'),
(2, 'zbychu', 'stonoga', 'karakany@gmail.com', '000000000'),
(3, 'dawid', 'wojcik', 'dawidwojcik@gmail.com', '000000000');

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

--
-- Dumping data for table `rezerwacje`
--

INSERT INTO `rezerwacje` (`id`, `klient_id`, `termin_id`, `l_gokartow`, `cena`, `uwagi`) VALUES
(1, 2, 3, 10, 500, ''),
(2, 3, 2, 1, 50, ''),
(3, 1, 1, 5, 250, '');

-- --------------------------------------------------------

--
-- Table structure for table `rezerwacje_gokartow`
--

CREATE TABLE `rezerwacje_gokartow` (
  `id` int(11) NOT NULL,
  `rezerwacja_id` int(11) NOT NULL,
  `gokart_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rezerwacje_gokartow`
--

INSERT INTO `rezerwacje_gokartow` (`id`, `rezerwacja_id`, `gokart_id`) VALUES
(1, 1, 3),
(2, 2, 1),
(3, 3, 2);

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
-- Dumping data for table `terminy`
--

INSERT INTO `terminy` (`id`, `start`, `koniec`, `ile_gokartow`, `dostepny`, `data`) VALUES
(1, '07:00:00', '08:00:00', 5, 0, '2026-05-15'),
(2, '15:00:00', '16:00:00', 1, 0, '2026-05-21'),
(3, '13:00:00', '14:00:00', 10, 0, '2026-05-26');

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
