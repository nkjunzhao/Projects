-- phpMyAdmin SQL Dump
-- version 4.4.15.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 18, 2016 at 12:11 AM
-- Server version: 5.6.28
-- PHP Version: 5.5.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `handyman`
--

-- --------------------------------------------------------

--
-- Table structure for table `Clerk`
--

CREATE TABLE IF NOT EXISTS `Clerk` (
  `Login` varchar(16) NOT NULL,
  `Lname` varchar(40) NOT NULL,
  `Fname` varchar(25) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Clerk`
--

INSERT INTO `Clerk` (`Login`, `Lname`, `Fname`, `Password`) VALUES
('dkoopman', 'Koopman', 'Dan', '52fkd'),
('jsha', 'Sha', 'Jin', 'jsha123'),
('jzhao', 'Zhao', 'Jun', 'geui5e3'),
('lemo', 'Moss', 'Lily', 'sttg452'),
('qfang', 'Fang', 'Francis', 'qfang123'),
('zzou', 'Zou', 'Zhihao', 'zzou123');

-- --------------------------------------------------------

--
-- Table structure for table `Consist_of`
--

CREATE TABLE IF NOT EXISTS `Consist_of` (
  `Reservation_no` int(11) NOT NULL,
  `Tool_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Consist_of`
--

INSERT INTO `Consist_of` (`Reservation_no`, `Tool_id`) VALUES
(2, 1),
(5, 1),
(6, 1),
(8, 1),
(2, 2),
(9, 2),
(4, 3),
(8, 3),
(9, 3),
(3, 4),
(10, 4),
(11, 6);

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE IF NOT EXISTS `Customer` (
  `Login` varchar(36) NOT NULL,
  `Lname` varchar(40) NOT NULL,
  `Fname` varchar(25) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Home_phone` varchar(10) NOT NULL,
  `Work_phone` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`Login`, `Lname`, `Fname`, `Password`, `Address`, `Home_phone`, `Work_phone`) VALUES
('ff@gmail.com', 'Frank', 'Fin', 'ff123', '231 terra bella ave, Moutain View, CA 95043', '3523235313', ''),
('hbrown@hotmail.com', 'Brown', 'Helen', 'fjio4390', '2914 Lafayette Rd, Santa Clara, CA 95050 ', '9878137689', NULL),
('jen@gmail.com', 'Luke', 'Jen', 'jen123', '1191 santa st, San Francisco, CA 91020', '5326421256', ''),
('jzheng@gmail.com', 'Zheng', 'Judy', '35322fdsf', '2342 Availa Ave, Santa Clara, CA 95050', '5325325323', NULL),
('linda@hotmail.com', 'Larsen', 'Linda', 'linda123', '2123 16th St, Tampa, FL 31392', '6174388373', '9874368909'),
('pfrey@hotmail.com', 'Frey', 'Peter', 'ga4643', '1119 Terra Bella Ave, Mountain View, CA 94087', '5264267585', '6456325422'),
('psims@gmail.com', 'Sims', 'Phyllis', '908fjlskjag', '109 Homestead Rd, Santa Clara, CA 95051', '769807658', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Power_tool_accessories`
--

CREATE TABLE IF NOT EXISTS `Power_tool_accessories` (
  `Power_tool_id` int(11) NOT NULL,
  `Accessories` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Power_tool_accessories`
--

INSERT INTO `Power_tool_accessories` (`Power_tool_id`, `Accessories`) VALUES
(2, 'carry on bag'),
(2, 'tool holder'),
(7, ' blade '),
(7, 'dust chute');

-- --------------------------------------------------------

--
-- Table structure for table `Reservation`
--

CREATE TABLE IF NOT EXISTS `Reservation` (
  `Reservation_no` int(11) NOT NULL,
  `Start_date` date NOT NULL,
  `End_date` date NOT NULL,
  `Credit_card_no` bigint(16) DEFAULT NULL,
  `Credit_card_exp_date` date DEFAULT NULL,
  `Customer_login` varchar(36) NOT NULL,
  `Pick_up_clerk` varchar(16) DEFAULT NULL,
  `Drop_off_clerk` varchar(16) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Reservation`
--

INSERT INTO `Reservation` (`Reservation_no`, `Start_date`, `End_date`, `Credit_card_no`, `Credit_card_exp_date`, `Customer_login`, `Pick_up_clerk`, `Drop_off_clerk`) VALUES
(2, '2016-04-06', '2016-04-09', 5786368976589034, '2017-12-21', 'jzheng@gmail.com', 'jsha', 'jzhao'),
(3, '2016-03-01', '2016-03-03', 2345654789064567, '2016-04-01', 'hbrown@hotmail.com', 'qfang', 'zzou'),
(4, '2016-03-31', '2016-04-09', 1234556789875643, '2016-07-08', 'psims@gmail.com', 'zzou', 'jsha'),
(5, '2016-03-23', '2016-03-25', 6789765456789876, '2017-01-12', 'psims@gmail.com', 'lemo', 'dkoopman'),
(6, '2016-05-01', '2016-05-03', NULL, NULL, 'hbrown@hotmail.com', NULL, NULL),
(8, '2016-05-08', '2016-05-10', NULL, NULL, 'jzheng@gmail.com', NULL, NULL),
(9, '2016-05-19', '2016-05-22', NULL, NULL, 'pfrey@hotmail.com', NULL, NULL),
(10, '2016-04-25', '2016-06-25', 34356468790876567, '2017-07-07', 'psims@gmail.com', 'qfang', NULL),
(11, '2016-04-07', '2016-04-13', 45644789076567, '2016-11-12', 'ff@gmail.com', 'lemo', 'jzhao');

-- --------------------------------------------------------

--
-- Table structure for table `Service_order`
--

CREATE TABLE IF NOT EXISTS `Service_order` (
  `Tool_ID` int(11) NOT NULL,
  `Filling_clerk_login` varchar(36) NOT NULL,
  `Start_date` date NOT NULL,
  `End_date` date NOT NULL,
  `Est_cost` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Service_order`
--

INSERT INTO `Service_order` (`Tool_ID`, `Filling_clerk_login`, `Start_date`, `End_date`, `Est_cost`) VALUES
(2, 'lemo', '2016-02-01', '2016-02-09', '10'),
(2, 'dkoopman', '2016-04-12', '2016-04-15', '10'),
(6, 'jzhao', '2016-03-02', '2016-03-04', '80');

-- --------------------------------------------------------

--
-- Table structure for table `Tools`
--

CREATE TABLE IF NOT EXISTS `Tools` (
  `ID` int(11) NOT NULL,
  `Purchase_price` decimal(10,0) NOT NULL,
  `Rental_price` decimal(10,0) NOT NULL,
  `Deposit_amount` decimal(10,0) NOT NULL,
  `Abbr_desc` varchar(50) NOT NULL,
  `Full_desc` varchar(300) NOT NULL,
  `Date_sold` date DEFAULT NULL,
  `Tool_type` enum('Handy Tool','Construction Equipment','Power Tool') DEFAULT 'Handy Tool',
  `Adding_clerk` varchar(16) DEFAULT NULL,
  `Selling_clerk` varchar(16) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Tools`
--

INSERT INTO `Tools` (`ID`, `Purchase_price`, `Rental_price`, `Deposit_amount`, `Abbr_desc`, `Full_desc`, `Date_sold`, `Tool_type`, `Adding_clerk`, `Selling_clerk`) VALUES
(1, '80', '5', '90', 'Screwdriver Set', 'Craftsman Huge 28-piece Screwdriver Set with Lifetime Replacement Warranty Also Includes a Quality 13 In. Tool Bag, Ideal Contractors Tool Kit or Home Handyman DIY Toolbox / Tool Set Includes Phillips, Slotted / Flathead and Torx ', NULL, 'Handy Tool', 'dkoopman', NULL),
(2, '39', '4', '45', 'Pocket Hole Jig System', 'The Kreg Jig Jr(R3) is an amazing repair jig and an exceptionally handy addition to any tool collection', NULL, 'Power Tool', 'jzhao', NULL),
(3, '385', '30', '400', 'Crimper Tool Frame ', 'Astro/DMC Tools Af8 Mil-spec Crimper Tool Frame - Upper Range - 12awg - 26awg - 8 Impression Af8 ', NULL, 'Handy Tool', 'lemo', NULL),
(4, '13', '2', '18', 'Steel Wire Cutter', '3 Piece Heavy Duty 6" Plier Set Hand Tools Construction Steel Wire Cutter New', NULL, 'Construction Equipment', 'jzhao', NULL),
(5, '66', '10', '70', 'Chisel Tool Set', 'StarSide 8PCS Wood Sculpture Carving Chisel Tool Set DIY Art Craft Handy Tool', '2016-03-09', 'Handy Tool', 'lemo', 'dkoopman'),
(6, '600', '100', '600', 'Plate Compactor', 'WEN Construction Zone Plate Compactor, Vibratory Asphalt/Soil Plate', NULL, 'Construction Equipment', 'jzhao', NULL),
(7, '549', '70', '550', 'Contractor Saw', 'Craftsman 10 in. Contractor Saw', NULL, 'Power Tool', 'jzhao', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Clerk`
--
ALTER TABLE `Clerk`
  ADD PRIMARY KEY (`Login`);

--
-- Indexes for table `Consist_of`
--
ALTER TABLE `Consist_of`
  ADD UNIQUE KEY `Reservation_no` (`Reservation_no`,`Tool_id`),
  ADD KEY `Tool_id` (`Tool_id`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`Login`);

--
-- Indexes for table `Power_tool_accessories`
--
ALTER TABLE `Power_tool_accessories`
  ADD PRIMARY KEY (`Power_tool_id`,`Accessories`);

--
-- Indexes for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`Reservation_no`),
  ADD KEY `Customer_login` (`Customer_login`),
  ADD KEY `Pick_up_clerk` (`Pick_up_clerk`),
  ADD KEY `Drop_off_clerk` (`Drop_off_clerk`);

--
-- Indexes for table `Service_order`
--
ALTER TABLE `Service_order`
  ADD UNIQUE KEY `Tool_ID` (`Tool_ID`,`Start_date`,`End_date`),
  ADD KEY `Filling_clerk_login` (`Filling_clerk_login`);

--
-- Indexes for table `Tools`
--
ALTER TABLE `Tools`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Adding_clerk` (`Adding_clerk`),
  ADD KEY `Selling_clerk` (`Selling_clerk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Reservation`
--
ALTER TABLE `Reservation`
  MODIFY `Reservation_no` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `Tools`
--
ALTER TABLE `Tools`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Consist_of`
--
ALTER TABLE `Consist_of`
  ADD CONSTRAINT `consist_of_ibfk_1` FOREIGN KEY (`Tool_id`) REFERENCES `Tools` (`ID`),
  ADD CONSTRAINT `consist_of_ibfk_2` FOREIGN KEY (`Reservation_no`) REFERENCES `Reservation` (`Reservation_no`);

--
-- Constraints for table `Power_tool_accessories`
--
ALTER TABLE `Power_tool_accessories`
  ADD CONSTRAINT `power_tool_accessories_ibfk_1` FOREIGN KEY (`Power_tool_id`) REFERENCES `Tools` (`ID`);

--
-- Constraints for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`Customer_login`) REFERENCES `Customer` (`Login`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`Pick_up_clerk`) REFERENCES `Clerk` (`Login`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`Drop_off_clerk`) REFERENCES `Clerk` (`Login`);

--
-- Constraints for table `Service_order`
--
ALTER TABLE `Service_order`
  ADD CONSTRAINT `service_order_ibfk_1` FOREIGN KEY (`Tool_ID`) REFERENCES `Tools` (`ID`),
  ADD CONSTRAINT `service_order_ibfk_2` FOREIGN KEY (`Filling_clerk_login`) REFERENCES `Clerk` (`Login`);

--
-- Constraints for table `Tools`
--
ALTER TABLE `Tools`
  ADD CONSTRAINT `tools_ibfk_1` FOREIGN KEY (`Adding_clerk`) REFERENCES `Clerk` (`Login`),
  ADD CONSTRAINT `tools_ibfk_2` FOREIGN KEY (`Selling_clerk`) REFERENCES `Clerk` (`Login`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
