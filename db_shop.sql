-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2023 at 01:22 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `adminId` int(11) NOT NULL,
  `adminName` varchar(255) NOT NULL,
  `adminUser` varchar(255) NOT NULL,
  `adminPass` varchar(255) NOT NULL,
  `level` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`adminId`, `adminName`, `adminUser`, `adminPass`, `level`) VALUES
(2, 'Adeyemo', 'admin', '202cb962ac59075b964b07152d234b70', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brandId` int(11) NOT NULL,
  `brandName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brandId`, `brandName`) VALUES
(1, 'Acer'),
(2, 'Samsung'),
(3, 'Iphone'),
(4, 'Canon');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cartId` int(11) NOT NULL,
  `sId` varchar(255) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `catId` int(11) NOT NULL,
  `catName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`catId`, `catName`) VALUES
(1, 'Acer'),
(2, 'Infinix Smart5'),
(3, 'Software'),
(4, 'Sport $ Fitness'),
(5, 'Mobile Phones'),
(6, 'Accessories'),
(7, 'Laptop'),
(8, 'Desktop');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_compare`
--

CREATE TABLE `tbl_compare` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `name`, `address`, `city`, `country`, `zip`, `phone`, `email`, `pass`) VALUES
(4, 'Customer Two', 'Alakia Ibadan', 'Alakia', 'Ibadan Nigeria', '2023022', '07053788836', 'customertwo@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `cmrId`, `productId`, `productName`, `quantity`, `price`, `image`, `date`, `status`) VALUES
(24, 4, 12, 'This Lorem Ipsum is simply', 2, 500.00, 'uploads/e04413a844.png', '2022-12-29 15:33:46', 2),
(25, 4, 10, 'This Lorem Ipsum is simply', 3, 1200.00, 'uploads/30fd68068d.jpg', '2022-12-29 15:33:46', 2),
(26, 4, 9, 'This Lorem Ipsum is simply', 4, 4000.00, 'uploads/fca4ba3c92.png', '2022-12-29 15:33:46', 2),
(27, 4, 11, 'This Lorem Ipsum is simply', 3, 2102.67, 'uploads/1c3a87d7b3.jpg', '2022-12-29 21:18:29', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `catId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL,
  `body` text NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`productId`, `productName`, `catId`, `brandId`, `body`, `price`, `image`, `type`) VALUES
(1, 'Lorem Ipsum is simply', 6, 4, '<p>product details will be go here. product details will be go here. product details will be go here. product details will be go here. product details will be go here.product details will be go here.product details will be go here.</p>\r\n<p>product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.product details will be go here.product details will be go here.</p>\r\n<p>product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.product details will be go here.product details will be go here.</p>\r\n<p>product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.product details will be go here.product details will be go here.</p>', 0.00, 'uploads/4cfa0133e0.jpg', 1),
(2, 'Lorem Ipsum is simply', 6, 4, '<p>product details will be go here. product details will be go here. product details will be go here. product details will be go here. product details will be go here.product details will be go here.product details will be go here.</p>\r\n<p>product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.product details will be go here.product details will be go here.</p>\r\n<p>product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.product details will be go here.product details will be go here.</p>\r\n<p>product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.product details will be go here.product details will be go here.</p>', 0.00, 'uploads/1519b64c3e.jpg', 1),
(3, 'Lorem Ipsum is simply', 6, 4, '<p>product details will be go here. product details will be go here. product details will be go here. product details will be go here. product details will be go here.product details will be go here.product details will be go here.</p>\r\n<p>product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.product details will be go here.product details will be go here.</p>\r\n<p>product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.product details will be go here.product details will be go here.</p>\r\n<p>product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.product details will be go here.product details will be go here.</p>', 0.00, 'uploads/79b3b44f9d.jpg', 0),
(4, 'This Lorem Ipsum is simply', 6, 2, '<p>product details will be go here. product details will be go here. product details will be go here. product details will be go here. product details will be go here.product details will be go here.product details will be go here.<br />product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.product details will be go here.product details will be go here.<br />product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.product details will be go here.product details will be go here.<br />product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.&nbsp;product details will be go here.product details will be go here.product details will be go here.</p>', 220.55, 'uploads/086de4b5eb.jpg', 1),
(5, 'Lorem Ipsum is simply', 2, 4, '<p>product details will be go here.product details will be go here.product details will be go here.product details will be go here.product details will be go here.product details will be go here.product details will be go here.product details will be go here.</p>\r\n<p>product details will be go here.product details will be go here.product details will be go here.product details will be go here.product details will be go here.product details will be go here.product details will be go here.product details will be go here.</p>\r\n<p>product details will be go here.product details will be go here.product details will be go here.product details will be go here.product details will be go here.product details will be go here.product details will be go here.product details will be go here.</p>\r\n<p>product details will be go here.product details will be go here.product details will be go here.product details will be go here.product details will be go here.product details will be go here.product details will be go here.product details will be go here.</p>', 20000.00, 'uploads/94da3f976d.jpg', 0),
(6, 'This Lorem Ipsum is simply', 4, 4, '<p>This Lorem Ipsum is simplyThis Lorem Ipsum is simplyvThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simply</p>', 689.58, 'uploads/afe99d0774.jpg', 1),
(9, 'This Lorem Ipsum is simply', 2, 1, '<p>This Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyvvvThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simply</p>', 1000.00, 'uploads/fca4ba3c92.png', 0),
(10, 'This Lorem Ipsum is simply', 7, 3, '<p>This Lorem Ipsum is simplyThis Lorem Ipsum is simplyvThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simply</p>', 400.00, 'uploads/30fd68068d.jpg', 0),
(11, 'This Lorem Ipsum is simply', 1, 2, '<p>vvThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simply</p>', 700.89, 'uploads/1c3a87d7b3.jpg', 0),
(12, 'This Lorem Ipsum is simply', 6, 4, '<p>This Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simplyThis Lorem Ipsum is simply</p>', 250.00, 'uploads/e04413a844.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wlist`
--

CREATE TABLE `tbl_wlist` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_wlist`
--

INSERT INTO `tbl_wlist` (`id`, `cmrId`, `productId`, `productName`, `price`, `image`) VALUES
(2, 4, 12, 'This Lorem Ipsum is simply', 250.00, 'uploads/e04413a844.png'),
(3, 4, 10, 'This Lorem Ipsum is simply', 400.00, 'uploads/30fd68068d.jpg'),
(4, 4, 11, 'This Lorem Ipsum is simply', 700.89, 'uploads/1c3a87d7b3.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brandId`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `tbl_wlist`
--
ALTER TABLE `tbl_wlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_compare`
--
ALTER TABLE `tbl_compare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_wlist`
--
ALTER TABLE `tbl_wlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
