-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2020 at 11:20 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id_absen` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `waktu` time NOT NULL,
  `keterangan` enum('Masuk','Pulang') NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`id_absen`, `tgl`, `waktu`, `keterangan`, `id_user`) VALUES
(61, '2020-07-20', '16:18:27', 'Masuk', 16),
(62, '2020-07-20', '16:18:36', 'Pulang', 16),
(63, '2020-07-20', '16:19:10', 'Masuk', 15),
(64, '2020-07-20', '16:19:19', 'Pulang', 15);

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE `divisi` (
  `id_divisi` smallint(3) NOT NULL,
  `nama_divisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`id_divisi`, `nama_divisi`) VALUES
(1, 'Admin Rontgen'),
(6, 'Admin Spirometri'),
(7, 'Admin Audiometri'),
(8, 'Admin Ekg'),
(9, 'Operator Lapangan');

-- --------------------------------------------------------

--
-- Table structure for table `jam`
--

CREATE TABLE `jam` (
  `id_jam` tinyint(1) NOT NULL,
  `start` time NOT NULL,
  `finish` time NOT NULL,
  `keterangan` enum('Masuk','Pulang') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jam`
--

INSERT INTO `jam` (`id_jam`, `start`, `finish`, `keterangan`) VALUES
(1, '09:00:00', '22:50:00', 'Masuk'),
(2, '17:00:00', '22:51:00', 'Pulang');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` smallint(5) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `foto` varchar(20) DEFAULT 'no-foto.png',
  `divisi` smallint(5) DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(60) NOT NULL,
  `level` enum('Manager','Karyawan') NOT NULL DEFAULT 'Karyawan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nik`, `nama`, `telp`, `email`, `foto`, `divisi`, `username`, `password`, `level`) VALUES
(1, '0116199604160226', 'Shiva Auldina Yamin', '081311226566', 'shiva@gmail.com', '1594988037.JPG', NULL, 'shiva@gmail.com', '$2y$10$YsA41sLX/AqmuHM24wXG9.7KwDkCcu86sVot48/r6qt.KtM3UAXy2', 'Manager'),
(15, '0202199406220609', 'Nurdina Arin', '08123456789', 'arinnurdina@gmail.com', 'no-foto.png', 9, 'nurdinaarin', '$2y$10$3BZ7r0zXyhW5KiIc2grYvuq8MdESyaNASS8mwUudaUIBJ7.1SDEEm', 'Karyawan'),
(16, '0205197912190019', 'Ayu Andira', '081345678721', 'andiraayu@gmail.com', 'no-foto.png', 1, 'ayuandira', '$2y$10$Bav.4sdBY1lqRcb.eVWzJeGPK7SL/eBhJZ7CNHaoIbC2HGRxJ1pcm', 'Karyawan'),
(26, '0205197912190019', 'Angga Apriyadi', '089768889889', 'ang@gmail.com', 'no-foto.png', 9, 'anggapyd', '$2y$10$RkrGzvbnZh3agslvRVvyouk7hrY.z5IjtjTy0IiWS7yuQiDDWrhee', 'Karyawan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id_absen`);

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id_divisi`);

--
-- Indexes for table `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`id_jam`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id_divisi` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jam`
--
ALTER TABLE `jam`
  MODIFY `id_jam` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
