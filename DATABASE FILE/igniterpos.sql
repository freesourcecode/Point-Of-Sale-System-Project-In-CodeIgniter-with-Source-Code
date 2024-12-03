-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2021 at 09:07 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `igniterpos`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(7) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `satuan_id` int(11) NOT NULL,
  `jenis_id` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `stok`, `satuan_id`, `jenis_id`, `harga`) VALUES
('CA0000', 'WEN Benchtop Drill Press', 101, 3, 8, 177),
('CA0001', 'Hermes Hardware Magnetic Drilling Machine', 159, 3, 8, 296),
('CA0002', 'CubiCubi Study Computer Desk', 89, 3, 13, 97),
('CA0003', 'Samsung 870 EVO 1TB SATA III Internal SSD', 219, 3, 14, 102),
('CA0004', 'Logitech BRIO Ultra HD Webcam', 73, 2, 9, 224),
('CA0005', 'MR.SIGA Microfiber Cleaning Cloth', 552, 2, 10, 11),
('CA0006', 'Amazon Basics LR44 Alkaline Button Coin Cell Battery', 1105, 2, 12, 4),
('CA0007', 'Kaisi 136 in 1 Electronics Repair Tool Kit', 141, 2, 11, 47),
('CA0008', 'Logitech MK270 Wireless Keyboard', 242, 3, 9, 31),
('CA0009', 'Duracell CopperTop Alkaline Batteries', 823, 2, 12, 16),
('CA0010', 'SAMSUNG T5 1TB External SSD', 116, 3, 14, 105),
('CA0011', 'Bolanburg Console Table', 9, 3, 13, 575),
('CA0012', 'Air Fryer Max XL Digital Hot Oven Cooker', 108, 3, 15, 119);

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_barang_keluar` char(16) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_penerima` char(50) NOT NULL,
  `alamat` text NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `diskon` double(11,0) DEFAULT '0',
  `total_nominal` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`id_barang_keluar`, `user_id`, `nama_penerima`, `alamat`, `tanggal_keluar`, `diskon`, `total_nominal`, `grand_total`) VALUES
('S2106030000', 1, 'Colin Stuart', '2445 Allace Avenue', '2021-06-03', 3, 407, 404),
('S2106030001', 1, 'Naomi Valencia', '1560  Lonely Oak Drive', '2021-06-03', 4, 837, 833),
('S2106030002', 1, 'Christine', '71 Bridge Road', '2021-06-03', 1, 1568, 1567),
('S2106030003', 1, 'Wilson Smith', '714 Bleck Street', '2021-06-03', 3, 544, 541),
('S2106030004', 1, 'Stephen McCaul', '714 Alv Lane', '2021-06-03', 2, 1792, 1790),
('S2106030005', 1, 'Christopher Coates', '2471 Strother Street', '2021-06-03', 15, 8984, 8969),
('S2106030006', 1, 'Michelle Jacobson', '2270 Skips Lane', '2021-06-03', 15, 2023, 2008);

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar_copy1`
--

CREATE TABLE `barang_keluar_copy1` (
  `id_barang_keluar` char(16) NOT NULL,
  `user_id` int(11) NOT NULL,
  `barang_id` char(7) NOT NULL,
  `nama_penerima` char(50) NOT NULL,
  `alamat` text NOT NULL,
  `jumlah_keluar` int(11) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `total_nominal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Triggers `barang_keluar_copy1`
--
DELIMITER $$
CREATE TRIGGER `update_stok_keluar_copy1` BEFORE INSERT ON `barang_keluar_copy1` FOR EACH ROW UPDATE `barang` SET `barang`.`stok` = `barang`.`stok` - NEW.jumlah_keluar WHERE `barang`.`id_barang` = NEW.barang_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar_dtl`
--

CREATE TABLE `barang_keluar_dtl` (
  `id_detail` int(11) NOT NULL,
  `id_barang_keluar` char(16) NOT NULL,
  `barang_id` char(7) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah_keluar` int(1) NOT NULL,
  `total_nominal_dtl` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `barang_keluar_dtl`
--

INSERT INTO `barang_keluar_dtl` (`id_detail`, `id_barang_keluar`, `barang_id`, `harga`, `jumlah_keluar`, `total_nominal_dtl`) VALUES
(20, 'S2106030000', 'CA0005', 11, 37, 407),
(21, 'S2106030001', 'CA0008', 31, 27, 837),
(22, 'S2106030002', 'CA0004', 224, 7, 1568),
(23, 'S2106030003', 'CA0009', 16, 29, 464),
(24, 'S2106030003', 'CA0006', 4, 20, 80),
(25, 'S2106030004', 'CA0004', 224, 8, 1792),
(26, 'S2106030005', 'CA0010', 105, 56, 5880),
(27, 'S2106030005', 'CA0002', 97, 32, 3104),
(28, 'S2106030006', 'CA0012', 119, 17, 2023);

--
-- Triggers `barang_keluar_dtl`
--
DELIMITER $$
CREATE TRIGGER `delete_stok_keluar` AFTER DELETE ON `barang_keluar_dtl` FOR EACH ROW UPDATE `barang` SET `barang`.`stok` = `barang`.`stok` + OLD.jumlah_keluar WHERE `barang`.`id_barang` = OLD.barang_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_stok_keluar` BEFORE INSERT ON `barang_keluar_dtl` FOR EACH ROW UPDATE `barang` SET `barang`.`stok` = `barang`.`stok` - NEW.jumlah_keluar WHERE `barang`.`id_barang` = NEW.barang_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang_masuk` char(16) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `barang_id` char(7) NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `tanggal_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_barang_masuk`, `supplier_id`, `user_id`, `barang_id`, `jumlah_masuk`, `tanggal_masuk`) VALUES
('I2106030000', 4, 1, 'CA0000', 78, '2020-12-17'),
('I2106030001', 4, 1, 'CA0001', 111, '2020-12-29'),
('I2106030002', 7, 1, 'CA0002', 181, '2020-12-30'),
('I2106030003', 5, 1, 'CA0003', 219, '2020-12-31'),
('I2106030004', 5, 1, 'CA0004', 368, '2020-12-31'),
('I2106030005', 5, 1, 'CA0008', 269, '2020-12-31'),
('I2106030006', 6, 1, 'CA0005', 589, '2021-01-04'),
('I2106030007', 5, 1, 'CA0006', 1125, '2021-01-04'),
('I2106030008', 7, 1, 'CA0002', 121, '2021-03-10'),
('I2106030009', 4, 1, 'CA0007', 141, '2021-01-19'),
('I2106030010', 4, 1, 'CA0000', 23, '2021-06-01'),
('I2106030011', 5, 1, 'CA0010', 172, '2021-06-03'),
('I2106030012', 9, 1, 'CA0009', 852, '2021-06-03'),
('I2106030013', 7, 1, 'CA0011', 112, '2021-06-03'),
('I2106030014', 10, 1, 'CA0012', 167, '2021-06-03'),
('I2106030015', 4, 1, 'CA0001', 152, '2021-06-03'),
('I2106030016', 10, 1, 'CA0012', 125, '2021-06-03'),
('I2106030017', 5, 1, 'CA0004', 68, '2021-06-03');

--
-- Triggers `barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `update_stok_masuk` BEFORE INSERT ON `barang_masuk` FOR EACH ROW UPDATE `barang` SET `barang`.`stok` = `barang`.`stok` + NEW.jumlah_masuk WHERE `barang`.`id_barang` = NEW.barang_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(11) NOT NULL,
  `nama_jenis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama_jenis`) VALUES
(8, 'Machinery'),
(9, 'Computer Accessories'),
(10, 'Cleaning Supplies'),
(11, 'Repair Tools'),
(12, 'Batteries'),
(13, 'Furniture'),
(14, 'Computer Components'),
(15, 'Home & Kitchen');

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id_satuan` int(11) NOT NULL,
  `nama_satuan` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id_satuan`, `nama_satuan`) VALUES
(2, 'Pack'),
(3, 'Piece'),
(5, 'Unit'),
(6, 'KG'),
(7, 'Meter');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `no_telp`, `alamat`) VALUES
(4, 'Unibe Limited', '2450003670', '1568  Wood Duck Drive'),
(5, 'SISSE Partners', '0250124570', '4328  Bassell Avenue'),
(6, 'Membozza', '0843696960', '2303  Poplar Lane'),
(7, 'GIGGY Furniture', '0366967856', '143  Huntly Street'),
(8, 'Morise Goods', '0147545458', '3502  Lunetta Street'),
(9, 'Wisdom Suppliers', '0147850002', '1560  Lonely Oak Drive'),
(10, 'Supplify Ware', '0145457850', '775 Oak Drive');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `role` enum('gudang','admin') NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL,
  `foto` text NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `email`, `no_telp`, `role`, `password`, `created_at`, `foto`, `is_active`) VALUES
(1, 'Administrator', 'admin', 'admin@admin.com', '025123456789', 'admin', '$2y$10$7rLSvRVyTQORapkDOqmkhetjF6H9lJHngr4hJMSM2lHObJbW5EQh6', 1568689561, 'admin-icn.png', 1),
(7, 'Will Williams', 'williams', 'williams@gmail.com', '7401000010', 'gudang', '$2y$10$5es8WhFQj8xCmrhDtH86Fu71j97og9f8aR4T22soa7716kAusmaeK', 1568691611, 'user.png', 1),
(15, 'Liam Moore', 'liamoore', 'liamoore@gmail.com', '7474754520', 'gudang', '$2y$10$1Yxca5aH4q8XZpMZm0kE..IZk1L/tqDYS0JkAr.mWJ7BeNmRzYdCq', 1622746060, 'user.png', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`) USING BTREE,
  ADD KEY `satuan_id` (`satuan_id`) USING BTREE,
  ADD KEY `kategori_id` (`jenis_id`) USING BTREE;

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id_barang_keluar`) USING BTREE,
  ADD KEY `id_user` (`user_id`) USING BTREE;

--
-- Indexes for table `barang_keluar_copy1`
--
ALTER TABLE `barang_keluar_copy1`
  ADD PRIMARY KEY (`id_barang_keluar`) USING BTREE,
  ADD KEY `id_user` (`user_id`) USING BTREE,
  ADD KEY `barang_id` (`barang_id`) USING BTREE;

--
-- Indexes for table `barang_keluar_dtl`
--
ALTER TABLE `barang_keluar_dtl`
  ADD PRIMARY KEY (`id_detail`) USING BTREE,
  ADD KEY `barang_keluar_dtl_ibfk_1` (`id_barang_keluar`) USING BTREE;

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barang_masuk`) USING BTREE,
  ADD KEY `id_user` (`user_id`) USING BTREE,
  ADD KEY `supplier_id` (`supplier_id`) USING BTREE,
  ADD KEY `barang_id` (`barang_id`) USING BTREE;

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`) USING BTREE;

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id_satuan`) USING BTREE;

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang_keluar_dtl`
--
ALTER TABLE `barang_keluar_dtl`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`id_satuan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`jenis_id`) REFERENCES `jenis` (`id_jenis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `barang_keluar_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `barang_keluar_copy1`
--
ALTER TABLE `barang_keluar_copy1`
  ADD CONSTRAINT `barang_keluar_copy1_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_keluar_copy1_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `barang_keluar_dtl`
--
ALTER TABLE `barang_keluar_dtl`
  ADD CONSTRAINT `barang_keluar_dtl_ibfk_1` FOREIGN KEY (`id_barang_keluar`) REFERENCES `barang_keluar` (`id_barang_keluar`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_masuk_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id_supplier`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_masuk_ibfk_3` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
