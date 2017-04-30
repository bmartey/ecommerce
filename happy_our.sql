-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 28, 2017 at 12:31 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `happy_our`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--
-- Creation: Mar 16, 2017 at 02:29 PM
--

CREATE TABLE `administrators` (
  `ano` int(11) NOT NULL,
  `aname` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `administrators`:
--

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`ano`, `aname`) VALUES
(1, 'Dela Aborchie'),
(2, 'Dela Lion');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--
-- Creation: Feb 01, 2017 at 10:15 AM
--

CREATE TABLE `cart` (
  `ctno` bigint(5) NOT NULL,
  `cno` bigint(5) NOT NULL,
  `pname` varchar(30) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `cart`:
--

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`ctno`, `cno`, `pname`, `price`, `quantity`) VALUES
(1, 1, 'whisky', '25.00', 4),
(2, 1, 'rum', '45.00', 3),
(3, 2, 'honey whisky', '35.00', 2),
(6, 4, 'vodka', '20.00', 6),
(7, 4, 'vodka', '20.00', 6),
(9, 11, 'honey whisky', '35.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--
-- Creation: Mar 17, 2017 at 03:19 AM
--

CREATE TABLE `customers` (
  `cno` bigint(20) NOT NULL,
  `cname` varchar(30) DEFAULT NULL,
  `street` varchar(30) DEFAULT NULL,
  `zip` bigint(20) DEFAULT NULL,
  `phone` char(12) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `customers`:
--

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cno`, `cname`, `street`, `zip`, `phone`, `status`) VALUES
(11, 'Brian Martey', 'Madina', 304344, '0207507185', 1),
(12, 'Bow Wow', 'Vegas', 344567, '0604443333', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--
-- Creation: Mar 17, 2017 at 03:20 AM
--

CREATE TABLE `employees` (
  `eno` bigint(20) NOT NULL,
  `ename` varchar(30) DEFAULT NULL,
  `zip` bigint(20) DEFAULT NULL,
  `hdate` date DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `employees`:
--

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`eno`, `ename`, `zip`, `hdate`, `status`) VALUES
(6, 'Jesse Akosa', 432456, '2017-03-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `odetails`
--
-- Creation: Jan 26, 2017 at 08:09 PM
--

CREATE TABLE `odetails` (
  `ono` bigint(20) NOT NULL,
  `pno` bigint(20) NOT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `odetails`:
--   `ono`
--       `orders` -> `ono`
--   `pno`
--       `parts` -> `pno`
--

--
-- Dumping data for table `odetails`
--

INSERT INTO `odetails` (`ono`, `pno`, `qty`) VALUES
(1, 1, 2),
(1, 2, 2),
(2, 1, 4),
(2, 2, 3),
(2, 3, 3),
(2, 4, 5),
(2, 7, 3),
(6, 3, 2),
(8, 1, 4),
(8, 2, 3),
(8, 3, 2),
(9, 1, 4),
(9, 2, 3),
(9, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--
-- Creation: Mar 28, 2017 at 03:58 AM
--

CREATE TABLE `orders` (
  `ono` bigint(20) NOT NULL,
  `cno` bigint(20) DEFAULT NULL,
  `received` datetime DEFAULT NULL,
  `shipped` datetime DEFAULT NULL,
  `date` date NOT NULL,
  `status` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `orders`:
--

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ono`, `cno`, `received`, `shipped`, `date`, `status`) VALUES
(1, 1, '2016-03-16 00:00:00', NULL, '2017-03-16', 0),
(2, 3, '2017-01-18 00:00:00', NULL, '2017-01-18', 0),
(6, 9, '2017-02-01 00:00:00', '2017-02-02 00:00:00', '2017-02-02', 1),
(7, 6, '2017-02-02 00:00:00', '2017-02-03 00:00:00', '2017-02-03', 0),
(8, 11, '2017-03-16 09:22:36', '2017-03-17 09:22:36', '2017-03-17', 1),
(9, 11, '2017-03-16 11:56:11', '2017-03-17 11:56:11', '2017-03-17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--
-- Creation: Feb 24, 2017 at 12:13 PM
--

CREATE TABLE `parts` (
  `pno` bigint(20) NOT NULL,
  `pname` varchar(30) DEFAULT NULL,
  `qoh` int(11) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `olevel` int(11) DEFAULT NULL,
  `photo` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `parts`:
--

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`pno`, `pname`, `qoh`, `price`, `olevel`, `photo`) VALUES
(1, 'whisky', 10, '25.00', 10, 'drinkphotos/Whisky.png'),
(2, 'rum', 25, '45.00', 15, 'drinkphotos/Rum.png'),
(3, 'vodka', 38, '20.00', 15, 'drinkphotos/Vodka.png'),
(4, 'honey whisky', 30, '35.00', 10, ''),
(5, 'cardinal vodka', 40, '15.00', 5, ''),
(6, 'gin', 50, '35.00', 15, ''),
(7, 'amen', 57, '90.00', 15, ''),
(8, 'tequila', 40, '45.00', 15, ''),
(9, 'coke', 100, '9.00', 30, ''),
(10, 'fanta', 100, '9.00', 30, '');

-- --------------------------------------------------------

--
-- Table structure for table `submitted_orders`
--
-- Creation: Mar 28, 2017 at 03:13 AM
--

CREATE TABLE `submitted_orders` (
  `soid` int(15) NOT NULL,
  `orno` int(15) NOT NULL,
  `eno` int(15) NOT NULL,
  `date_sold` datetime NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `submitted_orders`:
--   `eno`
--       `employees` -> `eno`
--   `orno`
--       `orders` -> `ono`
--

--
-- Dumping data for table `submitted_orders`
--

INSERT INTO `submitted_orders` (`soid`, `orno`, `eno`, `date_sold`, `date`) VALUES
(1, 8, 6, '2017-03-17 11:28:35', '2017-03-17'),
(2, 9, 6, '2017-03-17 14:38:24', '2017-03-17'),
(3, 6, 6, '2017-03-18 14:12:30', '2017-03-18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- Creation: Mar 16, 2017 at 02:31 PM
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(400) NOT NULL,
  `usertype` int(11) NOT NULL,
  `specificid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `users`:
--   `usertype`
--       `usertypes` -> `utid`
--

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `username`, `password`, `usertype`, `specificid`) VALUES
(1, 'brian.martey', 'bbc79fcd31359afaf92a7ab357846acc', 1, 11),
(2, 'dela.aborchie', '9271d6eecedd55fcfa6143a33029d496', 3, 1),
(3, 'jesse.akosa', 'bf2bc2545a4a5f5683d9ef3ed0d977e0', 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `usertypes`
--
-- Creation: Mar 16, 2017 at 02:32 PM
--

CREATE TABLE `usertypes` (
  `utid` int(11) NOT NULL,
  `types` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `usertypes`:
--

--
-- Dumping data for table `usertypes`
--

INSERT INTO `usertypes` (`utid`, `types`) VALUES
(1, 'Customer'),
(2, 'Employee'),
(3, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `zipcodes`
--
-- Creation: Jan 30, 2017 at 01:58 AM
--

CREATE TABLE `zipcodes` (
  `zip` bigint(20) NOT NULL,
  `city` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `zipcodes`:
--

--
-- Dumping data for table `zipcodes`
--

INSERT INTO `zipcodes` (`zip`, `city`) VALUES
(2, 'tamale'),
(432, 'aburi'),
(12345, 'tema'),
(30000, 'tarkwa'),
(34221, 'bolgatanga'),
(34323, 'ho'),
(39299, 'capecoast'),
(45454, 'kumasi'),
(54321, 'winneba'),
(92910, 'accra');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`ano`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`ctno`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cno`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`eno`);

--
-- Indexes for table `odetails`
--
ALTER TABLE `odetails`
  ADD PRIMARY KEY (`ono`,`pno`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ono`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`pno`);

--
-- Indexes for table `submitted_orders`
--
ALTER TABLE `submitted_orders`
  ADD PRIMARY KEY (`soid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `usertypes`
--
ALTER TABLE `usertypes`
  ADD PRIMARY KEY (`utid`);

--
-- Indexes for table `zipcodes`
--
ALTER TABLE `zipcodes`
  ADD PRIMARY KEY (`zip`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrators`
--
ALTER TABLE `administrators`
  MODIFY `ano` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `ctno` bigint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `cno` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `eno` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ono` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `parts`
--
ALTER TABLE `parts`
  MODIFY `pno` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `submitted_orders`
--
ALTER TABLE `submitted_orders`
  MODIFY `soid` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `usertypes`
--
ALTER TABLE `usertypes`
  MODIFY `utid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
