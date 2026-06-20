-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: zipparcel
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` varchar(10) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_type` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('C001','Metro Office Supplies','B2B','Manhattan','Daniel Owens','212-600-0001','orders@metrooffice.com'),('C002','Hudson Electronics','B2B','Manhattan','Rachel Kwan','212-600-0002','supply@hudsonelec.com'),('C003','Empire Retail Group','B2B','Brooklyn','Tom Fiore','718-600-0003','logistics@empireretail.com'),('C004','Skyline Medical Center','B2B','Queens','Dr. Kim Lee','718-600-0004','procurement@skylinemed.com'),('C005','Brooklyn Tech Hub','B2B','Brooklyn','Priya Sharma','718-600-0005','ops@brooklyntechhub.com'),('C006','Manhattan Book Distributors','B2B','Manhattan','Susan Graham','212-600-0006','fulfillment@manbookdist.com'),('C007','Queens Fashion Outlet','B2B','Queens','Carlos Rivera','718-600-0007','stock@queensfashion.com'),('C008','Bronx Auto Parts','B2B','Bronx','Eddie Morales','718-600-0008','parts@bronxauto.com'),('C009','Staten Island Wholesale','B2B','Staten Island','Patricia Dunn','718-600-0009','orders@siwholesale.com'),('C010','NY Campus Essentials','B2B','Manhattan','Henry Cole','212-600-0010','campus@nyessentials.com'),('C011','Emma Roberts','B2C','Manhattan','Emma Roberts','917-700-0011','emma.roberts@gmail.com'),('C012','Liam Carter','B2C','Brooklyn','Liam Carter','917-700-0012','liam.carter@gmail.com'),('C013','Sophia Bennett','B2C','Queens','Sophia Bennett','917-700-0013','sophia.bennett@gmail.com'),('C014','Noah Parker','B2C','Bronx','Noah Parker','917-700-0014','noah.parker@gmail.com'),('C015','Olivia Mitchell','B2C','Staten Island','Olivia Mitchell','917-700-0015','olivia.mitchell@gmail.com'),('C016','Ethan Cooper','B2C','Manhattan','Ethan Cooper','917-700-0016','ethan.cooper@gmail.com'),('C017','Ava Turner','B2C','Brooklyn','Ava Turner','917-700-0017','ava.turner@gmail.com'),('C018','Mason Reed','B2C','Queens','Mason Reed','917-700-0018','mason.reed@gmail.com'),('C019','Isabella Flores','B2C','Bronx','Isabella Flores','917-700-0019','isabella.flores@gmail.com'),('C020','Lucas Green','B2C','Manhattan','Lucas Green','917-700-0020','lucas.green@gmail.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delayreasons`
--

DROP TABLE IF EXISTS `delayreasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delayreasons` (
  `delay_reason_id` varchar(10) NOT NULL,
  `reason_name` varchar(100) NOT NULL,
  PRIMARY KEY (`delay_reason_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayreasons`
--

LOCK TABLES `delayreasons` WRITE;
/*!40000 ALTER TABLE `delayreasons` DISABLE KEYS */;
INSERT INTO `delayreasons` VALUES ('DR01','Heavy Traffic'),('DR02','Vehicle Breakdown'),('DR03','Driver Late Start'),('DR04','Road Construction'),('DR05','Bad Weather'),('DR06','Customer Unavailable'),('DR07','Wrong Address'),('DR08','Peak Hour Congestion'),('DR09','Loading Delay'),('DR10','Fuel Stop Delay');
/*!40000 ALTER TABLE `delayreasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveries` (
  `delivery_id` varchar(15) NOT NULL,
  `customer_id` varchar(10) NOT NULL,
  `route_id` varchar(10) NOT NULL,
  `driver_id` varchar(10) NOT NULL,
  `vehicle_id` varchar(10) NOT NULL,
  `delay_reason_id` varchar(10) DEFAULT NULL,
  `delivery_date` date NOT NULL,
  `scheduled_time` datetime NOT NULL,
  `actual_delivery_time` datetime NOT NULL,
  `delivery_cost` decimal(8,2) NOT NULL,
  `revenue` decimal(8,2) NOT NULL,
  `delivery_status` varchar(20) NOT NULL,
  `delay_minutes` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`delivery_id`),
  KEY `customer_id` (`customer_id`),
  KEY `route_id` (`route_id`),
  KEY `driver_id` (`driver_id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `delay_reason_id` (`delay_reason_id`),
  CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `deliveries_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`),
  CONSTRAINT `deliveries_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`),
  CONSTRAINT `deliveries_ibfk_4` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`),
  CONSTRAINT `deliveries_ibfk_5` FOREIGN KEY (`delay_reason_id`) REFERENCES `delayreasons` (`delay_reason_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES ('DEL-001','C001','R001','D001','B001',NULL,'2024-01-03','2024-01-03 08:00:00','2024-01-03 08:22:00',18.50,45.00,'Delivered',0),('DEL-002','C002','R002','D002','B002','DR08','2024-01-04','2024-01-04 09:00:00','2024-01-04 09:55:00',16.00,40.00,'Delivered',35),('DEL-003','C003','R003','D011','V001',NULL,'2024-01-05','2024-01-05 08:30:00','2024-01-05 09:12:00',42.00,120.00,'Delivered',0),('DEL-004','C004','R005','D005','B005','DR01','2024-01-06','2024-01-06 10:00:00','2024-01-06 11:10:00',24.00,55.00,'Delivered',35),('DEL-005','C005','R003','D012','V002',NULL,'2024-01-08','2024-01-08 08:00:00','2024-01-08 08:50:00',44.00,130.00,'Delivered',0),('DEL-006','C006','R001','D003','B003','DR03','2024-01-09','2024-01-09 09:00:00','2024-01-09 09:50:00',19.00,42.00,'Delivered',25),('DEL-007','C007','R004','D004','B004',NULL,'2024-01-10','2024-01-10 10:00:00','2024-01-10 10:55:00',52.00,90.00,'Delivered',0),('DEL-008','C008','R006','D006','B006','DR04','2024-01-11','2024-01-11 08:00:00','2024-01-11 09:00:00',15.00,38.00,'Delivered',40),('DEL-009','C009','R008','D013','V003',NULL,'2024-01-12','2024-01-12 07:30:00','2024-01-12 09:15:00',85.00,200.00,'Delivered',0),('DEL-010','C010','R002','D007','B007','DR06','2024-01-13','2024-01-13 11:00:00','2024-01-13 11:50:00',17.00,40.00,'Delivered',30),('DEL-011','C011','R001','D001','B001',NULL,'2024-01-15','2024-01-15 09:00:00','2024-01-15 09:24:00',12.00,28.00,'Delivered',0),('DEL-012','C012','R003','D011','V001','DR05','2024-01-16','2024-01-16 08:30:00','2024-01-16 10:00:00',43.00,100.00,'Delivered',45),('DEL-013','C013','R005','D005','B005',NULL,'2024-01-17','2024-01-17 10:00:00','2024-01-17 10:38:00',22.00,50.00,'Delivered',0),('DEL-014','C014','R006','D009','B009','DR02','2024-01-18','2024-01-18 08:00:00','2024-01-18 09:30:00',14.00,35.00,'Delivered',50),('DEL-015','C015','R008','D013','V003',NULL,'2024-01-19','2024-01-19 07:30:00','2024-01-19 09:20:00',88.00,210.00,'Delivered',0),('DEL-016','C016','R002','D002','B002','DR08','2024-01-20','2024-01-20 09:00:00','2024-01-20 10:05:00',16.50,38.00,'Delivered',25),('DEL-017','C017','R003','D012','V002',NULL,'2024-01-22','2024-01-22 08:00:00','2024-01-22 08:52:00',44.00,115.00,'Delivered',0),('DEL-018','C018','R009','D010','B010','DR01','2024-01-23','2024-01-23 10:00:00','2024-01-23 11:20:00',45.00,80.00,'Delivered',40),('DEL-019','C019','R007','D014','V004',NULL,'2024-01-24','2024-01-24 09:00:00','2024-01-24 09:45:00',36.00,95.00,'Delivered',0),('DEL-020','C020','R010','D008','B008','DR09','2024-01-25','2024-01-25 08:00:00','2024-01-25 09:15:00',48.00,85.00,'Delivered',30),('DEL-021','C001','R002','D001','B001',NULL,'2024-02-01','2024-02-01 08:00:00','2024-02-01 08:19:00',17.00,44.00,'Delivered',0),('DEL-022','C002','R001','D003','B003','DR07','2024-02-02','2024-02-02 09:00:00','2024-02-02 09:45:00',19.50,40.00,'Delivered',20),('DEL-023','C003','R004','D011','V001',NULL,'2024-02-05','2024-02-05 08:00:00','2024-02-05 09:00:00',55.00,150.00,'Delivered',0),('DEL-024','C004','R005','D005','B005','DR01','2024-02-06','2024-02-06 10:00:00','2024-02-06 11:15:00',24.00,52.00,'Delivered',40),('DEL-025','C005','R003','D012','V002',NULL,'2024-02-07','2024-02-07 08:30:00','2024-02-07 09:18:00',43.00,125.00,'Delivered',0),('DEL-026','C006','R001','D007','B007','DR06','2024-02-08','2024-02-08 11:00:00','2024-02-08 11:48:00',18.00,41.00,'Delivered',23),('DEL-027','C007','R004','D004','B004',NULL,'2024-02-09','2024-02-09 09:00:00','2024-02-09 09:58:00',52.00,92.00,'Delivered',0),('DEL-028','C008','R006','D006','B006','DR04','2024-02-10','2024-02-10 08:00:00','2024-02-10 09:10:00',15.00,36.00,'Delivered',50),('DEL-029','C009','R008','D013','V003',NULL,'2024-02-12','2024-02-12 07:30:00','2024-02-12 09:10:00',86.00,205.00,'Delivered',0),('DEL-030','C010','R010','D008','B008','DR08','2024-02-13','2024-02-13 08:00:00','2024-02-13 09:05:00',48.50,84.00,'Delivered',20),('DEL-031','C011','R001','D001','B001',NULL,'2024-02-14','2024-02-14 09:00:00','2024-02-14 09:25:00',12.00,29.00,'Delivered',0),('DEL-032','C012','R003','D011','V001','DR05','2024-02-15','2024-02-15 08:00:00','2024-02-15 09:30:00',44.00,98.00,'Delivered',45),('DEL-033','C013','R005','D005','B005',NULL,'2024-02-16','2024-02-16 10:00:00','2024-02-16 10:40:00',23.00,51.00,'Delivered',0),('DEL-034','C014','R006','D009','B009','DR02','2024-02-17','2024-02-17 08:00:00','2024-02-17 09:20:00',14.00,34.00,'Delivered',40),('DEL-035','C015','R008','D013','V003',NULL,'2024-02-19','2024-02-19 07:30:00','2024-02-19 09:22:00',87.00,212.00,'Delivered',0),('DEL-036','C016','R002','D002','B002','DR03','2024-02-20','2024-02-20 09:00:00','2024-02-20 10:10:00',16.00,37.00,'Delivered',30),('DEL-037','C017','R003','D012','V002',NULL,'2024-02-21','2024-02-21 08:00:00','2024-02-21 08:54:00',43.50,116.00,'Delivered',0),('DEL-038','C018','R009','D010','B010','DR10','2024-02-22','2024-02-22 10:00:00','2024-02-22 11:25:00',46.00,78.00,'Delivered',45),('DEL-039','C019','R007','D014','V004',NULL,'2024-02-23','2024-02-23 09:00:00','2024-02-23 09:48:00',37.00,96.00,'Delivered',0),('DEL-040','C020','R010','D015','V005','DR01','2024-02-24','2024-02-24 08:00:00','2024-02-24 09:10:00',49.00,83.00,'Delivered',25),('DEL-041','C001','R001','D016','B001',NULL,'2024-03-01','2024-03-01 08:00:00','2024-03-01 08:24:00',18.00,46.00,'Delivered',0),('DEL-042','C002','R002','D002','B002','DR08','2024-03-02','2024-03-02 09:00:00','2024-03-02 09:52:00',16.00,39.00,'Delivered',32),('DEL-043','C003','R003','D011','V001',NULL,'2024-03-04','2024-03-04 08:30:00','2024-03-04 09:15:00',42.50,122.00,'Delivered',0),('DEL-044','C004','R005','D017','B003','DR01','2024-03-05','2024-03-05 10:00:00','2024-03-05 11:08:00',22.00,53.00,'Delivered',33),('DEL-045','C005','R004','D012','V002',NULL,'2024-03-06','2024-03-06 08:00:00','2024-03-06 09:02:00',56.00,148.00,'Delivered',0),('DEL-046','C006','R001','D003','B003','DR06','2024-03-07','2024-03-07 11:00:00','2024-03-07 11:52:00',18.50,43.00,'Delivered',27),('DEL-047','C007','R004','D004','B004',NULL,'2024-03-08','2024-03-08 09:00:00','2024-03-08 10:00:00',52.00,91.00,'Delivered',0),('DEL-048','C008','R006','D018','B005','DR04','2024-03-09','2024-03-09 08:00:00','2024-03-09 09:05:00',15.50,37.00,'Delivered',45),('DEL-049','C009','R008','D013','V003',NULL,'2024-03-11','2024-03-11 07:30:00','2024-03-11 09:18:00',86.50,208.00,'Delivered',0),('DEL-050','C010','R002','D007','B007','DR09','2024-03-12','2024-03-12 11:00:00','2024-03-12 11:55:00',17.50,41.00,'Delivered',35),('DEL-051','C011','R001','D001','B001',NULL,'2024-03-13','2024-03-13 09:00:00','2024-03-13 09:22:00',12.00,30.00,'Delivered',0),('DEL-052','C012','R003','D011','V001','DR05','2024-03-14','2024-03-14 08:00:00','2024-03-14 09:35:00',43.00,99.00,'Delivered',50),('DEL-053','C013','R009','D010','B010',NULL,'2024-03-15','2024-03-15 10:00:00','2024-03-15 10:55:00',45.00,82.00,'Delivered',0),('DEL-054','C014','R006','D009','B009','DR02','2024-03-16','2024-03-16 08:00:00','2024-03-16 09:25:00',13.50,33.00,'Delivered',45),('DEL-055','C015','R008','D013','V003',NULL,'2024-03-18','2024-03-18 07:30:00','2024-03-18 09:24:00',88.00,214.00,'Delivered',0),('DEL-056','C016','R010','D019','V001','DR08','2024-03-19','2024-03-19 08:00:00','2024-03-19 09:10:00',49.50,86.00,'Delivered',25),('DEL-057','C017','R003','D012','V002',NULL,'2024-03-20','2024-03-20 08:00:00','2024-03-20 08:50:00',44.00,118.00,'Delivered',0),('DEL-058','C018','R005','D005','B005','DR01','2024-03-21','2024-03-21 10:00:00','2024-03-21 11:12:00',23.00,54.00,'Delivered',37),('DEL-059','C019','R007','D014','V004',NULL,'2024-03-22','2024-03-22 09:00:00','2024-03-22 09:42:00',37.00,94.00,'Delivered',0),('DEL-060','C020','R010','D015','V005','DR07','2024-03-23','2024-03-23 08:00:00','2024-03-23 09:05:00',49.00,82.00,'Delivered',20),('DEL-061','C001','R002','D001','B001',NULL,'2024-04-02','2024-04-02 08:00:00','2024-04-02 08:20:00',17.00,45.00,'Delivered',0),('DEL-062','C003','R003','D011','V001','DR01','2024-04-03','2024-04-03 08:30:00','2024-04-03 09:30:00',43.00,110.00,'Delivered',45),('DEL-063','C004','R005','D005','B005',NULL,'2024-04-04','2024-04-04 10:00:00','2024-04-04 10:36:00',22.00,52.00,'Delivered',0),('DEL-064','C005','R004','D012','V002','DR09','2024-04-05','2024-04-05 08:00:00','2024-04-05 09:20:00',56.00,140.00,'Delivered',40),('DEL-065','C006','R001','D003','B003',NULL,'2024-04-06','2024-04-06 09:00:00','2024-04-06 09:24:00',19.00,44.00,'Delivered',0),('DEL-066','C007','R004','D004','B004','DR06','2024-04-08','2024-04-08 10:00:00','2024-04-08 11:10:00',52.00,88.00,'Delivered',30),('DEL-067','C008','R006','D006','B006',NULL,'2024-04-09','2024-04-09 08:00:00','2024-04-09 08:22:00',15.00,39.00,'Delivered',0),('DEL-068','C009','R008','D013','V003','DR05','2024-04-10','2024-04-10 07:30:00','2024-04-10 09:45:00',88.00,195.00,'Delivered',60),('DEL-069','C010','R002','D007','B007',NULL,'2024-04-11','2024-04-11 11:00:00','2024-04-11 11:22:00',17.00,42.00,'Delivered',0),('DEL-070','C011','R001','D001','B001','DR03','2024-04-12','2024-04-12 09:00:00','2024-04-12 09:55:00',12.50,28.00,'Delivered',30),('DEL-071','C012','R003','D011','V001',NULL,'2024-04-13','2024-04-13 08:00:00','2024-04-13 08:52:00',42.00,105.00,'Delivered',0),('DEL-072','C013','R009','D010','B010','DR08','2024-04-15','2024-04-15 10:00:00','2024-04-15 11:15:00',46.00,79.00,'Delivered',35),('DEL-073','C014','R006','D009','B009',NULL,'2024-04-16','2024-04-16 08:00:00','2024-04-16 08:24:00',14.00,36.00,'Delivered',0),('DEL-074','C015','R008','D013','V003','DR02','2024-04-17','2024-04-17 07:30:00','2024-04-17 10:00:00',90.00,200.00,'Delivered',65),('DEL-075','C016','R010','D015','V005',NULL,'2024-04-18','2024-04-18 08:00:00','2024-04-18 08:50:00',49.00,88.00,'Delivered',0),('DEL-076','C017','R003','D012','V002','DR04','2024-04-19','2024-04-19 08:00:00','2024-04-19 09:10:00',45.00,112.00,'Delivered',38),('DEL-077','C018','R005','D005','B005',NULL,'2024-04-20','2024-04-20 10:00:00','2024-04-20 10:38:00',22.50,53.00,'Delivered',0),('DEL-078','C019','R007','D014','V004','DR10','2024-04-22','2024-04-22 09:00:00','2024-04-22 10:00:00',37.50,93.00,'Delivered',20),('DEL-079','C020','R010','D020','B007',NULL,'2024-04-23','2024-04-23 08:00:00','2024-04-23 08:48:00',48.00,84.00,'Delivered',0),('DEL-080','C002','R002','D002','B002','DR07','2024-04-24','2024-04-24 09:00:00','2024-04-24 09:45:00',16.50,38.00,'Delivered',25),('DEL-081','C001','R001','D001','B001',NULL,'2024-05-02','2024-05-02 08:00:00','2024-05-02 08:25:00',18.00,45.00,'Delivered',0),('DEL-082','C003','R003','D011','V001','DR01','2024-05-03','2024-05-03 08:30:00','2024-05-03 09:40:00',43.00,108.00,'Delivered',50),('DEL-083','C004','R005','D005','B005',NULL,'2024-05-06','2024-05-06 10:00:00','2024-05-06 10:35:00',22.00,51.00,'Delivered',0),('DEL-084','C005','R004','D012','V002','DR08','2024-05-07','2024-05-07 08:00:00','2024-05-07 09:15:00',56.00,138.00,'Delivered',35),('DEL-085','C006','R001','D016','B001',NULL,'2024-05-08','2024-05-08 09:00:00','2024-05-08 09:26:00',18.50,44.00,'Delivered',0),('DEL-086','C007','R009','D010','B010','DR06','2024-05-09','2024-05-09 10:00:00','2024-05-09 11:05:00',46.00,78.00,'Delivered',25),('DEL-087','C008','R006','D006','B006',NULL,'2024-05-10','2024-05-10 08:00:00','2024-05-10 08:20:00',15.00,40.00,'Delivered',0),('DEL-088','C009','R008','D013','V003','DR05','2024-05-11','2024-05-11 07:30:00','2024-05-11 09:50:00',88.50,200.00,'Delivered',55),('DEL-089','C010','R002','D007','B007',NULL,'2024-05-13','2024-05-13 11:00:00','2024-05-13 11:20:00',17.00,43.00,'Delivered',0),('DEL-090','C011','R001','D001','B001','DR09','2024-05-14','2024-05-14 09:00:00','2024-05-14 09:50:00',12.50,27.00,'Delivered',25),('DEL-091','C012','R003','D011','V001',NULL,'2024-05-15','2024-05-15 08:00:00','2024-05-15 08:50:00',42.00,107.00,'Delivered',0),('DEL-092','C013','R005','D018','B005','DR01','2024-05-16','2024-05-16 10:00:00','2024-05-16 11:12:00',23.00,52.00,'Delivered',37),('DEL-093','C014','R006','D009','B009',NULL,'2024-05-17','2024-05-17 08:00:00','2024-05-17 08:22:00',14.00,37.00,'Delivered',0),('DEL-094','C015','R008','D013','V003','DR04','2024-05-18','2024-05-18 07:30:00','2024-05-18 09:30:00',88.00,205.00,'Delivered',45),('DEL-095','C016','R010','D015','V005',NULL,'2024-05-20','2024-05-20 08:00:00','2024-05-20 08:48:00',49.00,87.00,'Delivered',0),('DEL-096','C017','R007','D014','V004','DR02','2024-05-21','2024-05-21 09:00:00','2024-05-21 10:20:00',37.50,90.00,'Delivered',40),('DEL-097','C018','R009','D010','B010',NULL,'2024-05-22','2024-05-22 10:00:00','2024-05-22 10:52:00',46.00,81.00,'Delivered',0),('DEL-098','C019','R007','D019','V001','DR08','2024-05-23','2024-05-23 09:00:00','2024-05-23 10:05:00',38.00,92.00,'Delivered',25),('DEL-099','C020','R010','D020','B007',NULL,'2024-05-24','2024-05-24 08:00:00','2024-05-24 08:46:00',48.00,85.00,'Delivered',0),('DEL-100','C002','R002','D002','B002','DR07','2024-05-25','2024-05-25 09:00:00','2024-05-25 09:48:00',16.00,37.00,'Delivered',28),('DEL-101','C001','R001','D001','B001',NULL,'2024-06-03','2024-06-03 08:00:00','2024-06-03 08:24:00',18.00,46.00,'Delivered',0),('DEL-102','C003','R004','D011','V001','DR09','2024-06-04','2024-06-04 08:00:00','2024-06-04 09:15:00',55.00,145.00,'Delivered',35),('DEL-103','C005','R003','D012','V002',NULL,'2024-06-05','2024-06-05 08:30:00','2024-06-05 09:15:00',43.00,120.00,'Delivered',0),('DEL-104','C004','R005','D017','B003','DR01','2024-06-06','2024-06-06 10:00:00','2024-06-06 11:18:00',22.00,54.00,'Delivered',43),('DEL-105','C006','R001','D003','B003',NULL,'2024-06-07','2024-06-07 09:00:00','2024-06-07 09:25:00',19.00,45.00,'Delivered',0),('DEL-106','C008','R006','D006','B006','DR04','2024-06-08','2024-06-08 08:00:00','2024-06-08 09:08:00',15.50,37.00,'Delivered',48),('DEL-107','C009','R008','D013','V003',NULL,'2024-06-10','2024-06-10 07:30:00','2024-06-10 09:20:00',87.00,210.00,'Delivered',0),('DEL-108','C010','R002','D007','B007','DR06','2024-06-11','2024-06-11 11:00:00','2024-06-11 11:50:00',17.50,41.00,'Delivered',30),('DEL-109','C011','R001','D016','B001',NULL,'2024-06-12','2024-06-12 09:00:00','2024-06-12 09:26:00',12.00,29.00,'Delivered',0),('DEL-110','C012','R003','D011','V001','DR05','2024-06-13','2024-06-13 08:00:00','2024-06-13 09:30:00',42.50,100.00,'Delivered',45),('DEL-111','C013','R009','D010','B010',NULL,'2024-06-14','2024-06-14 10:00:00','2024-06-14 10:52:00',45.00,82.00,'Delivered',0),('DEL-112','C014','R006','D009','B009','DR02','2024-06-15','2024-06-15 08:00:00','2024-06-15 09:10:00',13.50,34.00,'Delivered',30),('DEL-113','C015','R008','D013','V003',NULL,'2024-06-17','2024-06-17 07:30:00','2024-06-17 09:25:00',88.50,212.00,'Delivered',0),('DEL-114','C016','R010','D015','V005','DR08','2024-06-18','2024-06-18 08:00:00','2024-06-18 09:05:00',50.00,87.00,'Delivered',20),('DEL-115','C017','R003','D012','V002',NULL,'2024-06-19','2024-06-19 08:00:00','2024-06-19 08:52:00',44.00,117.00,'Delivered',0),('DEL-116','C018','R005','D005','B005','DR03','2024-06-20','2024-06-20 10:00:00','2024-06-20 11:20:00',23.00,53.00,'Delivered',45),('DEL-117','C019','R007','D014','V004',NULL,'2024-06-21','2024-06-21 09:00:00','2024-06-21 09:44:00',37.00,95.00,'Delivered',0),('DEL-118','C020','R010','D020','B007','DR10','2024-06-22','2024-06-22 08:00:00','2024-06-22 09:00:00',48.50,83.00,'Delivered',15),('DEL-119','C002','R002','D002','B002',NULL,'2024-06-24','2024-06-24 09:00:00','2024-06-24 09:22:00',16.00,40.00,'Delivered',0),('DEL-120','C007','R004','D004','B004','DR01','2024-06-25','2024-06-25 09:00:00','2024-06-25 10:10:00',52.50,89.00,'Delivered',30),('DEL-121','C001','R001','D001','B001',NULL,'2024-07-01','2024-07-01 08:00:00','2024-07-01 08:26:00',18.00,46.00,'Delivered',0),('DEL-122','C003','R003','D011','V001','DR02','2024-07-02','2024-07-02 08:30:00','2024-07-02 10:30:00',44.00,95.00,'Failed',80),('DEL-123','C004','R005','D005','B005',NULL,'2024-07-03','2024-07-03 10:00:00','2024-07-03 10:37:00',22.00,52.00,'Delivered',0),('DEL-124','C009','R008','D013','V003','DR05','2024-07-04','2024-07-04 07:30:00','2024-07-04 09:30:00',90.00,195.00,'Delivered',60),('DEL-125','C010','R002','D007','B007',NULL,'2024-07-05','2024-07-05 11:00:00','2024-07-05 11:22:00',17.00,43.00,'Delivered',0),('DEL-126','C012','R003','D012','V002','DR06','2024-07-08','2024-07-08 08:00:00','2024-07-08 09:15:00',43.50,105.00,'Delivered',30),('DEL-127','C014','R006','D009','B009',NULL,'2024-07-09','2024-07-09 08:00:00','2024-07-09 08:24:00',14.00,37.00,'Delivered',0),('DEL-128','C016','R010','D015','V005','DR07','2024-07-10','2024-07-10 08:00:00','2024-07-10 09:00:00',49.50,85.00,'Delivered',15),('DEL-129','C018','R005','D018','B005',NULL,'2024-07-11','2024-07-11 10:00:00','2024-07-11 10:36:00',22.50,53.00,'Delivered',0),('DEL-130','C019','R007','D014','V004','DR04','2024-07-12','2024-07-12 09:00:00','2024-07-12 10:10:00',38.00,92.00,'Delivered',30),('DEL-131','C001','R002','D001','B001',NULL,'2024-07-15','2024-07-15 08:00:00','2024-07-15 08:21:00',17.00,45.00,'Delivered',0),('DEL-132','C005','R004','D011','V001','DR01','2024-07-16','2024-07-16 08:00:00','2024-07-16 09:15:00',56.00,140.00,'Delivered',35),('DEL-133','C006','R001','D003','B003',NULL,'2024-07-17','2024-07-17 09:00:00','2024-07-17 09:25:00',19.00,44.00,'Delivered',0),('DEL-134','C008','R006','D006','B006','DR09','2024-07-18','2024-07-18 08:00:00','2024-07-18 09:05:00',15.50,36.00,'Delivered',45),('DEL-135','C013','R009','D010','B010',NULL,'2024-07-19','2024-07-19 10:00:00','2024-07-19 10:52:00',46.00,80.00,'Delivered',0),('DEL-136','C015','R008','D013','V003','DR02','2024-07-22','2024-07-22 07:30:00','2024-07-22 10:15:00',92.00,192.00,'Failed',85),('DEL-137','C017','R003','D012','V002',NULL,'2024-07-23','2024-07-23 08:00:00','2024-07-23 08:50:00',43.00,115.00,'Delivered',0),('DEL-138','C020','R010','D020','B007','DR08','2024-07-24','2024-07-24 08:00:00','2024-07-24 09:10:00',48.50,84.00,'Delivered',30),('DEL-139','C002','R002','D002','B002',NULL,'2024-07-25','2024-07-25 09:00:00','2024-07-25 09:21:00',16.00,41.00,'Delivered',0),('DEL-140','C007','R004','D004','B004','DR03','2024-07-26','2024-07-26 09:00:00','2024-07-26 10:10:00',52.00,87.00,'Delivered',30),('DEL-141','C001','R001','D001','B001',NULL,'2024-08-05','2024-08-05 08:00:00','2024-08-05 08:25:00',18.00,46.00,'Delivered',0),('DEL-142','C003','R003','D011','V001','DR01','2024-08-06','2024-08-06 08:30:00','2024-08-06 09:42:00',43.00,106.00,'Delivered',47),('DEL-143','C009','R008','D013','V003',NULL,'2024-08-07','2024-08-07 07:30:00','2024-08-07 09:18:00',87.00,210.00,'Delivered',0),('DEL-144','C011','R001','D016','B001','DR06','2024-08-08','2024-08-08 09:00:00','2024-08-08 09:55:00',12.50,28.00,'Delivered',30),('DEL-145','C014','R006','D009','B009',NULL,'2024-08-09','2024-08-09 08:00:00','2024-08-09 08:22:00',14.00,38.00,'Delivered',0),('DEL-146','C016','R010','D015','V005','DR04','2024-08-12','2024-08-12 08:00:00','2024-08-12 09:10:00',50.00,86.00,'Delivered',25),('DEL-147','C018','R005','D005','B005',NULL,'2024-08-13','2024-08-13 10:00:00','2024-08-13 10:37:00',22.00,53.00,'Delivered',0),('DEL-148','C019','R007','D014','V004','DR08','2024-08-14','2024-08-14 09:00:00','2024-08-14 10:05:00',38.00,91.00,'Delivered',25),('DEL-149','C020','R010','D020','B007',NULL,'2024-08-15','2024-08-15 08:00:00','2024-08-15 08:47:00',48.00,85.00,'Delivered',0),('DEL-150','C004','R005','D017','B003','DR05','2024-08-16','2024-08-16 10:00:00','2024-08-16 11:30:00',23.00,50.00,'Delivered',55);
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `driver_id` varchar(10) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `license_number` varchar(20) NOT NULL,
  `hire_date` date NOT NULL,
  `years_experience` int NOT NULL,
  `vehicle_assigned` varchar(10) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`driver_id`),
  UNIQUE KEY `license_number` (`license_number`),
  KEY `vehicle_assigned` (`vehicle_assigned`),
  CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`vehicle_assigned`) REFERENCES `vehicles` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES ('D001','Michael','Johnson','Male','212-555-0101','LIC-NY-3821','2018-03-15',8,'B001','Active'),('D002','James','Smith','Male','212-555-0102','LIC-NY-4732','2019-06-20',6,'B002','Active'),('D003','Daniel','Brown','Male','212-555-0103','LIC-NY-5541','2020-01-10',5,'B003','Active'),('D004','Christopher','Davis','Male','212-555-0104','LIC-NY-6614','2017-09-05',9,'B004','Active'),('D005','Matthew','Wilson','Male','212-555-0105','LIC-NY-7723','2021-04-18',4,'B005','Active'),('D006','Anthony','Taylor','Male','212-555-0106','LIC-NY-8834','2016-11-30',10,'B006','Active'),('D007','Joshua','Anderson','Male','212-555-0107','LIC-NY-9912','2022-02-14',3,'B007','Active'),('D008','Andrew','Thomas','Male','212-555-0108','LIC-NY-1023','2015-07-22',11,'B008','Active'),('D009','Ryan','Martinez','Male','212-555-0109','LIC-NY-2134','2023-03-01',2,'B009','Active'),('D010','Nicholas','Jackson','Male','212-555-0110','LIC-NY-3245','2019-08-19',6,'B010','Active'),('D011','Brandon','White','Male','212-555-0111','LIC-NY-4356','2018-05-25',7,'V001','Active'),('D012','Kevin','Harris','Male','212-555-0112','LIC-NY-5467','2020-10-11',5,'V002','Active'),('D013','Justin','Clark','Male','212-555-0113','LIC-NY-6578','2017-12-03',9,'V003','Active'),('D014','Eric','Lewis','Male','212-555-0114','LIC-NY-7689','2016-04-07',10,'V004','Active'),('D015','Jonathan','Walker','Male','212-555-0115','LIC-NY-8790','2021-09-15',4,'V005','Active'),('D016','Nathan','Hall','Male','212-555-0116','LIC-NY-9801','2022-06-28',3,'B001','Active'),('D017','Tyler','Allen','Male','212-555-0117','LIC-NY-1092','2019-02-17',6,'B003','Active'),('D018','Zachary','Young','Male','212-555-0118','LIC-NY-2103','2020-07-04',5,'B005','Active'),('D019','Adam','King','Male','212-555-0119','LIC-NY-3214','2018-11-21',7,'V001','Active'),('D020','Jason','Scott','Male','212-555-0120','LIC-NY-4325','2023-01-09',2,'B007','Active');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `route_id` varchar(10) NOT NULL,
  `origin` varchar(50) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `distance_km` decimal(5,2) NOT NULL,
  `expected_time_minutes` int NOT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES ('R001','Manhattan','New York University',5.20,25),('R002','Manhattan','Columbia University',3.80,20),('R003','Brooklyn','New York University',10.50,45),('R004','Brooklyn','St. Johns University',14.30,55),('R005','Queens','St. Johns University',7.60,35),('R006','Bronx','Fordham University',4.10,20),('R007','Bronx','Columbia University',9.90,40),('R008','Staten Island','New York University',24.70,75),('R009','Queens','City College of New York',13.20,50),('R010','Manhattan','Fordham University',13.50,45);
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `vehicle_id` varchar(10) NOT NULL,
  `vehicle_type` varchar(20) NOT NULL,
  `registration_number` varchar(20) NOT NULL,
  `model` varchar(50) NOT NULL,
  `purchase_year` int NOT NULL,
  `fuel_type` varchar(20) NOT NULL,
  `capacity_kg` int NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`vehicle_id`),
  UNIQUE KEY `registration_number` (`registration_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES ('B001','Motorbike','NYC-MB-001','Honda CB125F',2020,'Petrol',30,'Active'),('B002','Motorbike','NYC-MB-002','Honda CB125F',2021,'Petrol',30,'Active'),('B003','Motorbike','NYC-MB-003','Yamaha YBR125',2021,'Petrol',30,'Active'),('B004','Motorbike','NYC-MB-004','Yamaha YBR125',2022,'Petrol',30,'Active'),('B005','Motorbike','NYC-MB-005','Suzuki GSX125',2019,'Petrol',25,'Active'),('B006','Motorbike','NYC-MB-006','Suzuki GSX125',2020,'Petrol',25,'Active'),('B007','Motorbike','NYC-MB-007','Honda PCX125',2022,'Petrol',30,'Active'),('B008','Motorbike','NYC-MB-008','Honda PCX125',2023,'Petrol',30,'Active'),('B009','Motorbike','NYC-MB-009','Yamaha NMAX',2023,'Petrol',35,'Active'),('B010','Motorbike','NYC-MB-010','Yamaha NMAX',2022,'Petrol',35,'Active'),('V001','Van','NYC-VN-001','Ford Transit',2020,'Diesel',800,'Active'),('V002','Van','NYC-VN-002','Ford Transit',2021,'Diesel',800,'Active'),('V003','Van','NYC-VN-003','Mercedes Sprinter',2019,'Diesel',900,'Active'),('V004','Van','NYC-VN-004','Mercedes Sprinter',2022,'Diesel',900,'Active'),('V005','Van','NYC-VN-005','RAM ProMaster',2021,'Diesel',850,'Active');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24  4:22:10
