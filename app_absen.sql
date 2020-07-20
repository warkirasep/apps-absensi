/*
 Navicat Premium Data Transfer

 Source Server         : localhost-mysql
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : app_absen

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 20/07/2020 18:30:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for absensi
-- ----------------------------
DROP TABLE IF EXISTS `absensi`;
CREATE TABLE `absensi` (
  `id_absen` int(11) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `waktu` time NOT NULL,
  `keterangan` enum('Masuk','Pulang') NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_absen`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of absensi
-- ----------------------------
BEGIN;
INSERT INTO `absensi` VALUES (78, '2020-07-20', '16:55:25', 'Masuk', 15);
INSERT INTO `absensi` VALUES (79, '2020-07-20', '16:55:34', 'Pulang', 15);
COMMIT;

-- ----------------------------
-- Table structure for divisi
-- ----------------------------
DROP TABLE IF EXISTS `divisi`;
CREATE TABLE `divisi` (
  `id_divisi` smallint(3) NOT NULL AUTO_INCREMENT,
  `nama_divisi` varchar(50) NOT NULL,
  PRIMARY KEY (`id_divisi`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of divisi
-- ----------------------------
BEGIN;
INSERT INTO `divisi` VALUES (1, 'Admin Rontgen');
INSERT INTO `divisi` VALUES (6, 'Admin Spirometri');
INSERT INTO `divisi` VALUES (7, 'Admin Audiometri');
INSERT INTO `divisi` VALUES (8, 'Admin Ekg');
INSERT INTO `divisi` VALUES (9, 'Operator Lapangan');
COMMIT;

-- ----------------------------
-- Table structure for jam
-- ----------------------------
DROP TABLE IF EXISTS `jam`;
CREATE TABLE `jam` (
  `id_jam` tinyint(1) NOT NULL AUTO_INCREMENT,
  `start` time NOT NULL,
  `finish` time NOT NULL,
  `keterangan` enum('Masuk','Pulang') NOT NULL,
  PRIMARY KEY (`id_jam`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jam
-- ----------------------------
BEGIN;
INSERT INTO `jam` VALUES (1, '09:00:00', '22:50:00', 'Masuk');
INSERT INTO `jam` VALUES (2, '17:00:00', '22:51:00', 'Pulang');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id_user` smallint(5) NOT NULL AUTO_INCREMENT,
  `nik` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `foto` varchar(20) DEFAULT 'no-foto.png',
  `divisi` smallint(5) DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(60) NOT NULL,
  `level` enum('Manager','Karyawan') NOT NULL DEFAULT 'Karyawan',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, '0116199604160226', 'Shiva Auldina Yamin', '081311226566', 'shiva@gmail.com', '1594988037.JPG', NULL, 'shiva@gmail.com', '$2y$10$YsA41sLX/AqmuHM24wXG9.7KwDkCcu86sVot48/r6qt.KtM3UAXy2', 'Manager');
INSERT INTO `users` VALUES (15, '0202199406220609', 'Nurdina Arin', '08123456789', 'arinnurdina@gmail.com', 'no-foto.png', 9, 'nurdinaarin', '$2y$10$3BZ7r0zXyhW5KiIc2grYvuq8MdESyaNASS8mwUudaUIBJ7.1SDEEm', 'Karyawan');
INSERT INTO `users` VALUES (16, '0205197912190019', 'Ayu Andira', '081345678721', 'andiraayu@gmail.com', 'no-foto.png', 1, 'ayuandira', '$2y$10$Bav.4sdBY1lqRcb.eVWzJeGPK7SL/eBhJZ7CNHaoIbC2HGRxJ1pcm', 'Karyawan');
INSERT INTO `users` VALUES (26, '0205197912190019', 'Angga Apriyadi', '089768889889', 'ang@gmail.com', 'no-foto.png', 9, 'anggapyd', '$2y$10$RkrGzvbnZh3agslvRVvyouk7hrY.z5IjtjTy0IiWS7yuQiDDWrhee', 'Karyawan');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
