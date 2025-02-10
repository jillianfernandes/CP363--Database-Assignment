-- phpMyAdmin SQL Dump
-- version 5.2.1-1.el7.remi
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 29, 2024 at 11:40 PM
-- Server version: 8.0.40
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fern6057`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `CustomerID` char(10) NOT NULL,
  `IsMember` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`CustomerID`, `IsMember`) VALUES
('00001', 1),
('00010', 0),
('00011', 1),
('00100', 1),
('00101', 0),
('00110', 1),
('00111', 1),
('01000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Employees`
--

CREATE TABLE `Employees` (
  `EmployeeID` int NOT NULL,
  `EmployeeSIN` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Position` varchar(50) NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  `HireDate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Employees`
--

INSERT INTO `Employees` (`EmployeeID`, `EmployeeSIN`, `FirstName`, `LastName`, `Position`, `Salary`, `HireDate`) VALUES
(1, 265348902, 'Gracie', 'Abrams', 'Cashier', 30000.00, '2020-05-01 00:00:00'),
(2, 568273892, 'Sabrina', 'Carpenter', 'Manager', 65000.00, '2018-03-01 00:00:00'),
(3, 638405823, 'Beyonce', 'Knowles', 'Salesperson', 27000.00, '2024-02-08 00:00:00'),
(4, 345281648, 'Frank', 'Ocean', 'Cashier', 30000.00, '2021-07-02 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ItemCategory`
--

CREATE TABLE `ItemCategory` (
  `CategoryID` int NOT NULL,
  `CategoryName` varchar(100) NOT NULL,
  `CategoryType` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ItemCategory`
--

INSERT INTO `ItemCategory` (`CategoryID`, `CategoryName`, `CategoryType`) VALUES
(1, 'Tops', 'T'),
(2, 'Pants', 'P'),
(3, 'Skirts', 'S'),
(4, 'Dresses', 'D'),
(5, 'Jackets', 'J'),
(6, 'Accessories', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `Items`
--

CREATE TABLE `Items` (
  `ItemID` int NOT NULL,
  `ItemName` varchar(50) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `CategoryID` int NOT NULL,
  `Size` char(3) DEFAULT 'M',
  `Color` varchar(50) DEFAULT NULL,
  `Description` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Items`
--

INSERT INTO `Items` (`ItemID`, `ItemName`, `Price`, `CategoryID`, `Size`, `Color`, `Description`) VALUES
(1, 'Cotton T-Shirt', 24.99, 1, 'M', 'Blue', 'Plain Blue 100% cotton t-shirt'),
(2, 'Blouse', 30.00, 1, 'S', 'White', 'Flowy mesh white blouse'),
(3, 'Pleated Skirt', 19.99, 3, 'S', 'Black', 'Pleated black mini skirt with zipper'),
(4, 'Sweatshirt', 50.00, 1, 'L', 'Grey', 'Hooded soft grey sweatshirt'),
(5, 'Maxi Dress', 32.99, 4, 'M', 'Red', 'Floral flowy casual maxi dress '),
(6, 'Denim Trouser', 45.50, 2, 'S', 'Blue', 'Dark blue denim cargo pants');

-- --------------------------------------------------------

--
-- Table structure for table `Members`
--

CREATE TABLE `Members` (
  `MemberID` int NOT NULL,
  `CustomerID` char(10) NOT NULL,
  `MembershipStartDate` date NOT NULL,
  `MembershipEndDate` date DEFAULT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Members`
--

INSERT INTO `Members` (`MemberID`, `CustomerID`, `MembershipStartDate`, `MembershipEndDate`, `FirstName`, `LastName`, `Email`, `Phone`) VALUES
(1, '00001', '2024-05-13', '2024-11-13', 'Taylor', 'Swift', 'tswift@erastour.com', '1313131313'),
(2, '00011', '2023-02-12', NULL, 'Harry', 'Styles', 'hstyles@harryshouse.com', '5427893326'),
(3, '00100', '2010-07-23', '2016-01-02', 'Zayn', 'Malik', 'zayn_m@oned.com', '3845637812'),
(4, '00110', '2022-03-13', '2024-09-02', 'Noah', 'Kahan', 'noahkmusic@musician.com', '2237823432'),
(5, '00111', '2024-11-21', NULL, 'Niall', 'Horan', 'nhoran@oned.com', '2261234287');

-- --------------------------------------------------------

--
-- Table structure for table `Purchases`
--

CREATE TABLE `Purchases` (
  `PurchaseID` int NOT NULL,
  `CustomerID` char(10) NOT NULL,
  `ItemID` int NOT NULL,
  `EmployeeID` int NOT NULL,
  `PurchaseDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `Quantity` int NOT NULL,
  `TotalPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Purchases`
--

INSERT INTO `Purchases` (`PurchaseID`, `CustomerID`, `ItemID`, `EmployeeID`, `PurchaseDate`, `Quantity`, `TotalPrice`) VALUES
(198, '00110', 4, 1, '2024-11-23 00:00:00', 1, 50.00),
(199, '00010', 6, 4, '2022-01-02 00:00:00', 3, 136.50),
(200, '00101', 1, 3, '2020-02-22 00:00:00', 2, 49.98),
(201, '00111', 3, 2, '2019-04-07 00:00:00', 1, 19.99),
(202, '00001', 4, 4, '2024-08-24 00:00:00', 2, 100.00),
(203, '00001', 5, 2, '2022-11-20 00:00:00', 4, 131.96),
(204, '00111', 6, 4, '2021-06-09 00:00:00', 1, 45.50),
(205, '00100', 1, 3, '2023-07-20 00:00:00', 5, 124.95),
(206, '00001', 2, 2, '2024-11-23 00:00:00', 1, 30.00),
(207, '01000', 2, 3, '2024-11-23 00:00:00', 1, 30.00);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vCustomerEmployeePurchases`
-- (See below for the actual view)
--
CREATE TABLE `vCustomerEmployeePurchases` (
`CustomerID` char(10)
,`EmployeeFirstName` varchar(50)
,`EmployeeLastName` varchar(50)
,`IsMember` tinyint(1)
,`MemberFirstName` varchar(50)
,`MemberLastName` varchar(50)
,`PurchaseDate` datetime
,`Quantity` int
,`TotalPrice` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vCustomerPurchasesCategory`
-- (See below for the actual view)
--
CREATE TABLE `vCustomerPurchasesCategory` (
`CategoryName` varchar(100)
,`CategoryType` char(1)
,`CustomerID` char(10)
,`FirstName` varchar(50)
,`IsMember` tinyint(1)
,`LastName` varchar(50)
,`PurchaseDate` datetime
,`Quantity` int
,`TotalPrice` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Structure for view `vCustomerEmployeePurchases`
--
DROP TABLE IF EXISTS `vCustomerEmployeePurchases`;

CREATE ALGORITHM=UNDEFINED DEFINER=`fern6057`@`%` SQL SECURITY DEFINER VIEW `vCustomerEmployeePurchases`  AS SELECT `c`.`CustomerID` AS `CustomerID`, `c`.`IsMember` AS `IsMember`, `m`.`FirstName` AS `MemberFirstName`, `m`.`LastName` AS `MemberLastName`, `e`.`FirstName` AS `EmployeeFirstName`, `e`.`LastName` AS `EmployeeLastName`, `p`.`PurchaseDate` AS `PurchaseDate`, `p`.`Quantity` AS `Quantity`, `p`.`TotalPrice` AS `TotalPrice` FROM (((`Customers` `c` left join `Members` `m` on((`c`.`CustomerID` = `m`.`CustomerID`))) join `Purchases` `p` on((`c`.`CustomerID` = `p`.`CustomerID`))) join `Employees` `e` on((`p`.`EmployeeID` = `e`.`EmployeeID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vCustomerPurchasesCategory`
--
DROP TABLE IF EXISTS `vCustomerPurchasesCategory`;

CREATE ALGORITHM=UNDEFINED DEFINER=`fern6057`@`%` SQL SECURITY DEFINER VIEW `vCustomerPurchasesCategory`  AS SELECT `c`.`CustomerID` AS `CustomerID`, `c`.`IsMember` AS `IsMember`, `m`.`FirstName` AS `FirstName`, `m`.`LastName` AS `LastName`, `ic`.`CategoryName` AS `CategoryName`, `ic`.`CategoryType` AS `CategoryType`, `p`.`PurchaseDate` AS `PurchaseDate`, `p`.`Quantity` AS `Quantity`, `p`.`TotalPrice` AS `TotalPrice` FROM ((((`Customers` `c` left join `Members` `m` on((`c`.`CustomerID` = `m`.`CustomerID`))) join `Purchases` `p` on((`c`.`CustomerID` = `p`.`CustomerID`))) join `Items` `i` on((`p`.`ItemID` = `i`.`ItemID`))) join `ItemCategory` `ic` on((`i`.`CategoryID` = `ic`.`CategoryID`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `ItemCategory`
--
ALTER TABLE `ItemCategory`
  ADD PRIMARY KEY (`CategoryID`),
  ADD UNIQUE KEY `CategoryName` (`CategoryName`);

--
-- Indexes for table `Items`
--
ALTER TABLE `Items`
  ADD PRIMARY KEY (`ItemID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `Members`
--
ALTER TABLE `Members`
  ADD PRIMARY KEY (`MemberID`),
  ADD UNIQUE KEY `CustomerID` (`CustomerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `Purchases`
--
ALTER TABLE `Purchases`
  ADD PRIMARY KEY (`PurchaseID`,`CustomerID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `fk_item_category` (`ItemID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Employees`
--
ALTER TABLE `Employees`
  MODIFY `EmployeeID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ItemCategory`
--
ALTER TABLE `ItemCategory`
  MODIFY `CategoryID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Items`
--
ALTER TABLE `Items`
  MODIFY `ItemID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Members`
--
ALTER TABLE `Members`
  MODIFY `MemberID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Purchases`
--
ALTER TABLE `Purchases`
  MODIFY `PurchaseID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Items`
--
ALTER TABLE `Items`
  ADD CONSTRAINT `Items_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `ItemCategory` (`CategoryID`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `Members`
--
ALTER TABLE `Members`
  ADD CONSTRAINT `Members_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `Purchases`
--
ALTER TABLE `Purchases`
  ADD CONSTRAINT `fk_item_category` FOREIGN KEY (`ItemID`) REFERENCES `Items` (`ItemID`),
  ADD CONSTRAINT `Purchases_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`),
  ADD CONSTRAINT `Purchases_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `Items` (`ItemID`),
  ADD CONSTRAINT `Purchases_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `Employees` (`EmployeeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
