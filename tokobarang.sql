-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
<<<<<<< HEAD
-- Generation Time: Feb 05, 2025 at 09:58 AM
=======
-- Generation Time: Feb 04, 2025 at 01:54 PM
>>>>>>> 700bc25a98f92b10d23a66cee6f3ce7d6fce8c78
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
-- Database: `tokobarang`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `kategori` enum('Perabotan','Fashion','Elektronik','Buku','Aksesoris','Outdor') DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `kategori`, `harga`, `stok`, `foto`) VALUES
(1, 'B001', 'Laptop ASUS', 'Elektronik', 8000000.00, 14, '679f9a97deeac.jpeg'),
(2, 'B002', 'Kulkas Samsung', 'Elektronik', 4500000.00, 3, '679f979213898.jpeg'),
(3, 'B003', 'Sepatu Adidas Samba', 'Fashion', 1200000.00, 17, '679f9b0373c83.jpeg'),
<<<<<<< HEAD
(4, 'B004', 'Iphone 15 Pro Max', 'Elektronik', 15000000.00, 14, '679f9d45eeb48.jpeg'),
(5, 'B005', 'Buku Novel Bumi Manusia', 'Buku', 150000.00, 49, '679f9f0574901.jpg'),
(6, 'B006', 'Samsung Galaxy S24 Ultra', 'Elektronik', 14000000.00, 30, '679f9fe809a62.jpg'),
(7, 'B007', 'Meja Kantor', 'Perabotan', 200000.00, 24, '679f9f6e265d5.png'),
(8, 'B008', 'Kamera Canon', 'Elektronik', 5000000.00, 7, '679f9f434af99.jpeg'),
=======
(4, 'B004', 'Iphone 15 Pro Max', 'Elektronik', 15000000.00, 15, '679f9d45eeb48.jpeg'),
(5, 'B005', 'Buku Novel Bumi Manusia', 'Buku', 150000.00, 49, '679f9f0574901.jpg'),
(6, 'B006', 'Samsung Galaxy S24 Ultra', 'Elektronik', 14000000.00, 30, '679f9fe809a62.jpg'),
(7, 'B007', 'Meja Kantor', 'Perabotan', 200000.00, 24, '679f9f6e265d5.png'),
(8, 'B008', 'Kamera Canon', 'Elektronik', 5000000.00, 8, '679f9f434af99.jpeg'),
>>>>>>> 700bc25a98f92b10d23a66cee6f3ce7d6fce8c78
(9, 'B009', 'Smartwatch Xiaomi', 'Aksesoris', 2500000.00, 12, '679fa098e7fac.jpeg'),
(10, 'B010', 'Phone Asus ROG 5', 'Elektronik', 7000000.00, 38, '679fa15facf1b.jpeg'),
(11, 'B011', 'Tas Ransel Nike', 'Fashion', 600000.00, 35, '679fa1d8502c0.jpeg'),
(12, 'B012', 'Lampu Meja IKEA', 'Perabotan', 150000.00, 21, '679fa235f33ca.jpeg'),
<<<<<<< HEAD
(13, 'B013', 'Tenda Camping', 'Outdor', 850000.00, 17, '679fa2901c7de.jpg'),
(14, 'B014', 'Cangkir Keramik', 'Perabotan', 50000.00, 60, '679fa2c97c774.jpg'),
(15, 'B015', 'Kursi Gaming', 'Perabotan', 550000.00, 8, '679fa309e55ac.jpg'),
(16, 'B016', 'Buku Pemrogman', 'Buku', 100000.00, 10, '');
=======
(13, 'B013', 'Tenda Camping', 'Outdoor', 850000.00, 17, '679fa2901c7de.jpg'),
(14, 'B014', 'Cangkir Keramik', 'Perabotan', 50000.00, 60, '679fa2c97c774.jpg'),
(15, 'B015', 'Kursi Gaming', 'Perabotan', 550000.00, 9, '679fa309e55ac.jpg');
>>>>>>> 700bc25a98f92b10d23a66cee6f3ce7d6fce8c78

-- --------------------------------------------------------

--
-- Table structure for table `detailtransaksi`
--

CREATE TABLE `detailtransaksi` (
  `id` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `kode_barang` varchar(20) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detailtransaksi`
--

INSERT INTO `detailtransaksi` (`id`, `transaksi_id`, `kode_barang`, `jumlah`) VALUES
(1, 1, 'B003', 0),
(2, 1, 'B002', 0),
(3, 2, 'B007', 0),
(4, 3, 'B010', 0),
(6, 4, 'B001', 0),
(7, 5, 'B003', 0),
(8, 6, 'B002', 0),
(10, 8, 'B010', 0),
(11, 9, 'B001', 0),
(12, 9, 'B001', 0),
(13, 9, 'B001', 0),
(14, 10, 'B001', 0),
(15, 10, 'B001', 0),
(16, 10, 'B013', 0),
<<<<<<< HEAD
(18, 11, 'B001', 0),
(19, 12, 'B008', 0),
(20, 12, 'B015', 0),
(21, 12, 'B004', 0);
=======
(18, 11, 'B001', 0);
>>>>>>> 700bc25a98f92b10d23a66cee6f3ce7d6fce8c78

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL,
  `kode_pelanggan` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telepon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `kode_pelanggan`, `nama`, `jk`, `email`, `telepon`) VALUES
(1, '220511088', 'Muhammad Hidayat', 'L', 'muhammadhidayat6704@gmail.com', '085967029702'),
(2, '220511139', 'Muhammad Faiz', 'L', 'mfaiz19@gmail.com', '081367892657'),
(3, '220511111', 'Nurkholifah', 'P', 'nur@gmail.com', '086725346783');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `kode_transaksi` varchar(20) NOT NULL,
  `kode_pelanggan` varchar(20) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `dibeli` int(20) NOT NULL DEFAULT 0,
  `total_harga` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `kode_transaksi`, `kode_pelanggan`, `tanggal_transaksi`, `dibeli`, `total_harga`) VALUES
(5, 'f4d3c6c', '220511139', '2025-02-02', 2, 1200000.00),
(8, '366a73d', '220511088', '2025-02-02', 2, 3500000.00),
<<<<<<< HEAD
(11, 'ccd1950', '220511111', '2025-02-02', 2, 8000000.00),
(12, '27890ea', '220511088', '2025-02-05', 2, 20550000.00);
=======
(11, 'ccd1950', '220511111', '2025-02-02', 2, 8000000.00);
>>>>>>> 700bc25a98f92b10d23a66cee6f3ce7d6fce8c78

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `sandi` varchar(255) NOT NULL,
  `level` enum('admin','pelanggan') NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `nama`, `sandi`, `level`) VALUES
(1, 'admin', 'admin', '$2y$10$C1tkn9/DSHFg7sXQH1EBweNv2JvSUzyKJMnO1CPx34HGR9/10AIYe', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `detailtransaksi`
--
ALTER TABLE `detailtransaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_pelanggan` (`kode_pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_pelanggan` (`kode_pelanggan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `detailtransaksi`
--
ALTER TABLE `detailtransaksi`
<<<<<<< HEAD
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
=======
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
>>>>>>> 700bc25a98f92b10d23a66cee6f3ce7d6fce8c78

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
<<<<<<< HEAD
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
=======
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
>>>>>>> 700bc25a98f92b10d23a66cee6f3ce7d6fce8c78

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailtransaksi`
--
ALTER TABLE `detailtransaksi`
  ADD CONSTRAINT `detailtransaksi_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detailtransaksi_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`) ON DELETE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`kode_pelanggan`) REFERENCES `pelanggan` (`kode_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
