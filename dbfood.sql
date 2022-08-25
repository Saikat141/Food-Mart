-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2022 at 05:31 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbadmin`
--

CREATE TABLE `tbadmin` (
  `fld_id` int(10) NOT NULL,
  `fld_username` varchar(30) NOT NULL,
  `fld_password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbadmin`
--

INSERT INTO `tbadmin` (`fld_id`, `fld_username`, `fld_password`) VALUES
(1, 'admin@gmail.com', 'admin123'),
(2, 'saikat@gmail.com', 'saikat');

-- --------------------------------------------------------

--
-- Table structure for table `tbfood`
--

CREATE TABLE `tbfood` (
  `food_id` int(11) NOT NULL,
  `fldvendor_id` int(11) NOT NULL,
  `foodname` varchar(100) NOT NULL,
  `cost` bigint(15) NOT NULL,
  `cuisines` varchar(50) NOT NULL,
  `paymentmode` varchar(50) NOT NULL,
  `fldimage` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbfood`
--

INSERT INTO `tbfood` (`food_id`, `fldvendor_id`, `foodname`, `cost`, `cuisines`, `paymentmode`, `fldimage`) VALUES
(2, 22, 'malai Kofta', 50, 'vegetable,veg', 'COD', '1469258122-malai-kofta.jpg'),
(3, 22, 'shahi panner', 20, 'vegetable', 'COD', 'Shahi-Paneer-Recipe.jpg'),
(5, 23, 'Pizza', 100, 'Medium Size, fast food', 'COD', 'phut_0.jpg'),
(6, 23, 'Pizza Full', 300, 'Fast food,full size', 'COD', 'phut_0.jpg'),
(7, 23, 'burger ', 50, 'Fast food', 'COD', 'photo-1534790566855-4cb788d389ec.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblcart`
--

CREATE TABLE `tblcart` (
  `fld_cart_id` int(11) NOT NULL,
  `fld_product_id` bigint(11) NOT NULL,
  `fld_customer_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer`
--

CREATE TABLE `tblcustomer` (
  `fld_cust_id` int(10) NOT NULL,
  `fld_name` varchar(30) NOT NULL,
  `fld_email` varchar(30) NOT NULL,
  `fld_mobile` bigint(10) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcustomer`
--

INSERT INTO `tblcustomer` (`fld_cust_id`, `fld_name`, `fld_email`, `fld_mobile`, `password`) VALUES
(1, 'Tanvir', 'customer1@gmail.com', 7503515382, 'customer1'),
(2, 'Jeni', 'customer2@gmail.com', 7503515386, 'customer2'),
(6, 'saikat', 'saikat@gmail.com', 129374443, 'saikat');

-- --------------------------------------------------------

--
-- Table structure for table `tblmessage`
--

CREATE TABLE `tblmessage` (
  `fld_msg_id` int(10) NOT NULL,
  `fld_name` varchar(50) NOT NULL,
  `fld_email` varchar(50) NOT NULL,
  `fld_phone` bigint(10) DEFAULT NULL,
  `fld_msg` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblorder`
--

CREATE TABLE `tblorder` (
  `fld_order_id` int(10) NOT NULL,
  `fld_cart_id` bigint(10) NOT NULL,
  `fldvendor_id` bigint(10) DEFAULT NULL,
  `fld_food_id` bigint(10) DEFAULT NULL,
  `fld_email_id` varchar(50) DEFAULT NULL,
  `fld_payment` varchar(20) DEFAULT NULL,
  `fldstatus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblorder`
--

INSERT INTO `tblorder` (`fld_order_id`, `fld_cart_id`, `fldvendor_id`, `fld_food_id`, `fld_email_id`, `fld_payment`, `fldstatus`) VALUES
(1, 1, 21, 1, 'customer3@gmail.com', '50', 'Delivered'),
(2, 2, 22, 3, 'customer3@gmail.com', '20', ''),
(3, 3, 22, 3, 'saikat@gmail.com', '20', 'Delivered'),
(4, 4, 23, 7, 'saikat@gmail.com', '50', 'Delivered'),
(5, 5, 23, 6, 'saikat@gmail.com', '300', 'In Process'),
(6, 6, 22, 2, 'customer1@gmail.com', '50', 'Delivered'),
(7, 7, 22, 2, 'customer1@gmail.com', '50', 'cancelled'),
(8, 9, 23, 5, 'customer1@gmail.com', '100', 'In Process'),
(9, 10, 23, 7, 'customer1@gmail.com', '50', 'cancelled'),
(10, 8, 22, 3, 'saikat@gmail.com', '20', 'In Process'),
(11, 11, 24, 8, 'saikat@gmail.com', '120', 'Delivered'),
(12, 12, 23, 7, 'saikat@gmail.com', '50', 'Out Of Stock');

-- --------------------------------------------------------

--
-- Table structure for table `tblvendor`
--

CREATE TABLE `tblvendor` (
  `fldvendor_id` int(10) NOT NULL,
  `fld_name` varchar(30) NOT NULL,
  `fld_email` varchar(50) NOT NULL,
  `fld_password` varchar(50) NOT NULL,
  `fld_mob` bigint(10) NOT NULL,
  `fld_phone` bigint(10) NOT NULL,
  `fld_address` varchar(50) NOT NULL,
  `fld_logo` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvendor`
--

INSERT INTO `tblvendor` (`fldvendor_id`, `fld_name`, `fld_email`, `fld_password`, `fld_mob`, `fld_phone`, `fld_address`, `fld_logo`) VALUES
(22, 'Hotel Radison', 'vendor1@gmail.com', 'vendor1', 1739545958, 114565457, 'Dhaka', '46388969.jpg'),
(23, 'Hotel Piccaso', 'vendor2@gmail.com', 'vendor2', 1703515385, 114565457, 'B-Block, UTTARA,DHAKA', '46388969.jpg'),
(24, 'Magpie Restaurant ', 'magpie@gmail.com', '123456', 1739584455, 1193548555, 'C block Bashundhara RA,DHAKA ', 'rajat-sarki-nnNCCQfSNsc-unsplash.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbadmin`
--
ALTER TABLE `tbadmin`
  ADD PRIMARY KEY (`fld_id`);

--
-- Indexes for table `tbfood`
--
ALTER TABLE `tbfood`
  ADD PRIMARY KEY (`food_id`),
  ADD KEY `fldvendor_id` (`fldvendor_id`);

--
-- Indexes for table `tblcart`
--
ALTER TABLE `tblcart`
  ADD PRIMARY KEY (`fld_cart_id`);

--
-- Indexes for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  ADD PRIMARY KEY (`fld_cust_id`);

--
-- Indexes for table `tblmessage`
--
ALTER TABLE `tblmessage`
  ADD PRIMARY KEY (`fld_msg_id`);

--
-- Indexes for table `tblorder`
--
ALTER TABLE `tblorder`
  ADD PRIMARY KEY (`fld_order_id`);

--
-- Indexes for table `tblvendor`
--
ALTER TABLE `tblvendor`
  ADD PRIMARY KEY (`fldvendor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbadmin`
--
ALTER TABLE `tbadmin`
  MODIFY `fld_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbfood`
--
ALTER TABLE `tbfood`
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblcart`
--
ALTER TABLE `tblcart`
  MODIFY `fld_cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  MODIFY `fld_cust_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblmessage`
--
ALTER TABLE `tblmessage`
  MODIFY `fld_msg_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblorder`
--
ALTER TABLE `tblorder`
  MODIFY `fld_order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblvendor`
--
ALTER TABLE `tblvendor`
  MODIFY `fldvendor_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbfood`
--
ALTER TABLE `tbfood`
  ADD CONSTRAINT `tbfood_ibfk_1` FOREIGN KEY (`fldvendor_id`) REFERENCES `tblvendor` (`fldvendor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
