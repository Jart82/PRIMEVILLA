-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2024 at 05:18 PM
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
-- Database: `primevilla`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_username` varchar(20) DEFAULT NULL,
  `admin_pwd` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_username`, `admin_pwd`) VALUES
(1, 'primead@gmail.com', 'scrypt:32768:8:1$wfoPQc7IXZxKEwXN$4d492cd6bc99f4f5b4177b0d0a73b4e8bf73fef02960c49365dfdb15365d5b951d97f9233442eaa091c8aa7d42dcef73e4cb25f8db9febe3d4a324f959fe525e');

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('86e8761239dd');

-- --------------------------------------------------------

--
-- Table structure for table `lga`
--

CREATE TABLE `lga` (
  `lga_id` int(11) NOT NULL,
  `lga_name` varchar(200) NOT NULL,
  `lga_stateid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lga`
--

INSERT INTO `lga` (`lga_id`, `lga_name`, `lga_stateid`) VALUES
(1, 'Okpe', 1),
(2, 'Patani', 1),
(3, 'Sapele', 1),
(4, 'Uvwie', 1),
(5, 'Egor', 2),
(6, 'Etsako', 2),
(7, 'Orhiowon', 2),
(8, 'Esan Central', 2),
(9, 'Agege', 3),
(10, 'Epe', 3),
(11, 'Ikeja', 3),
(12, 'Ikorodu', 3),
(13, 'Oturkpo', 4),
(14, 'Apa', 4),
(15, 'Logo', 4),
(16, 'Obi', 4);

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `property_id` int(11) NOT NULL,
  `number_of_rooms` varchar(100) DEFAULT NULL,
  `number_of_bathrooms` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `prop_type_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `lga_id` int(11) DEFAULT NULL,
  `property_address` varchar(255) NOT NULL,
  `prop_price` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`property_id`, `number_of_rooms`, `number_of_bathrooms`, `status`, `date_added`, `prop_type_id`, `state_id`, `lga_id`, `property_address`, `prop_price`) VALUES
(1, '3', '4', 'Available', '2024-05-16 04:24:11', 2, 1, 4, 'Warri. Delta State. Nigeria', '5,000,000'),
(2, '4', '6', 'Available', '2024-05-16 11:19:08', 2, 3, NULL, 'Ikeja. Nigeria', '4,500,000'),
(3, '4', '7', 'Available', '2024-05-19 18:50:57', 3, 1, NULL, 'Warri. Delta State. Nigeria', '3,500,000');

-- --------------------------------------------------------

--
-- Table structure for table `prop_images`
--

CREATE TABLE `prop_images` (
  `prop_images_id` int(11) NOT NULL,
  `image_file` varchar(255) NOT NULL,
  `property_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prop_images`
--

INSERT INTO `prop_images` (`prop_images_id`, `image_file`, `property_id`) VALUES
(1, '7499961.jpg', 1),
(2, '97255792.jpg', 1),
(3, '62592496.jpg', 1),
(4, '58411472.jpg', 1),
(5, '59993217.jpg', 1),
(6, '70876119.jpg', 2),
(7, '97999451.jpg', 2),
(8, '72444569.jpg', 2),
(9, '22042844.jpg', 2),
(10, '88096240.jpg', 2),
(11, '97378337.jpg', 3),
(12, '1454589.jpg', 3),
(13, '86148156.jpg', 3),
(14, '61214927.jpg', 3),
(15, '6742.jpg', 3),
(16, '28695642.jpeg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `prop_type`
--

CREATE TABLE `prop_type` (
  `prop_type_id` int(11) NOT NULL,
  `prop_type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prop_type`
--

INSERT INTO `prop_type` (`prop_type_id`, `prop_type_name`) VALUES
(1, 'Bungalow'),
(2, 'Duplex'),
(3, 'Mansion');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL,
  `request_email` varchar(20) DEFAULT NULL,
  `request_subject` varchar(100) DEFAULT NULL,
  `request_content` varchar(255) DEFAULT NULL,
  `request_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`request_id`, `request_email`, `request_subject`, `request_content`, `request_name`) VALUES
(1, 'test@email.com', 'test', 'content here', 'james');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state_name`) VALUES
(1, 'Delta\r\n'),
(2, 'Edo'),
(3, 'Lagos'),
(4, 'Benue');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `lga`
--
ALTER TABLE `lga`
  ADD PRIMARY KEY (`lga_id`),
  ADD KEY `lga_stateid` (`lga_stateid`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`property_id`),
  ADD KEY `lga_id` (`lga_id`),
  ADD KEY `prop_type_id` (`prop_type_id`),
  ADD KEY `state_id` (`state_id`);

--
-- Indexes for table `prop_images`
--
ALTER TABLE `prop_images`
  ADD PRIMARY KEY (`prop_images_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `prop_type`
--
ALTER TABLE `prop_type`
  ADD PRIMARY KEY (`prop_type_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lga`
--
ALTER TABLE `lga`
  MODIFY `lga_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prop_images`
--
ALTER TABLE `prop_images`
  MODIFY `prop_images_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `prop_type`
--
ALTER TABLE `prop_type`
  MODIFY `prop_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lga`
--
ALTER TABLE `lga`
  ADD CONSTRAINT `lga_ibfk_1` FOREIGN KEY (`lga_stateid`) REFERENCES `state` (`state_id`);

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `property_ibfk_1` FOREIGN KEY (`lga_id`) REFERENCES `lga` (`lga_id`),
  ADD CONSTRAINT `property_ibfk_2` FOREIGN KEY (`prop_type_id`) REFERENCES `prop_type` (`prop_type_id`),
  ADD CONSTRAINT `property_ibfk_3` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`);

--
-- Constraints for table `prop_images`
--
ALTER TABLE `prop_images`
  ADD CONSTRAINT `prop_images_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
