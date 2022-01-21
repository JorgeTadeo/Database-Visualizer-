-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2020 at 09:34 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `Email`, `Password`) VALUES
(0, 'Guest@mail.com', 'Guest123'),
(11111111, 'JorgeTadeo510@gmail.com', 'Mermaid123');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `Name` varchar(30) DEFAULT NULL,
  `Price` decimal(4,2) DEFAULT NULL,
  `ItemID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`Name`, `Price`, `ItemID`) VALUES
('Sweater', '14.99', 12345555),
('shoes', '19.99', 12345666),
('Pants', '24.99', 12345677),
('Shirt', '9.99', 12345678);

-- --------------------------------------------------------

--
-- Table structure for table `itemorder`
--

CREATE TABLE `itemorder` (
  `DatePlaced` date DEFAULT NULL,
  `confirmation` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `itemorder`
--

INSERT INTO `itemorder` (`DatePlaced`, `confirmation`, `ItemID`, `CustomerID`) VALUES
('2020-09-08', 9877827, 12345666, 0),
('2020-09-08', 9877827, 12345677, 0),
('2020-09-08', 9877827, 12345678, 0),
('2020-09-08', 9989988, 12345555, 11111111);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `itemorder`
--
ALTER TABLE `itemorder`
  ADD PRIMARY KEY (`confirmation`,`ItemID`,`CustomerID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `ItemID` (`ItemID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `itemorder`
--
ALTER TABLE `itemorder`
  ADD CONSTRAINT `itemorder_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `itemorder_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
