-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: shoppingcart
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3d704slv66tw6x5hmbm6p2x3u` (`product_id`),
  KEY `FK9x4wn098i53ikun1ynxet2ynj` (`user_id`),
  CONSTRAINT `FK3d704slv66tw6x5hmbm6p2x3u` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK9x4wn098i53ikun1ynxet2ynj` FOREIGN KEY (`user_id`) REFERENCES `user_dtls` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,4,7,5),(2,1,10,5);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_name` varchar(255) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Lam0.jpg',_binary '','Electronics'),(2,'Lam1.jpg',_binary '','Laptop'),(4,'Lam2.jpg',_binary '\0','Cosmetics'),(5,'Lam7.jpg',_binary '\0','Testing');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_address`
--

DROP TABLE IF EXISTS `order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_address`
--

LOCK TABLES `order_address` WRITE;
/*!40000 ALTER TABLE `order_address` DISABLE KEYS */;
INSERT INTO `order_address` VALUES (1,'1234','1234','demo@demo.com','demo','demo','1234','1234',NULL),(2,'1234','1234','demo@demo.com','demo','demo','1234','1234',NULL),(3,'12345','12345','demo@demo.com','demo1','demo1','12345','12345',NULL),(4,'12345','12345','demo@demo.com','demo1','demo1','12345','12345',NULL),(5,'abcd','abcd','demo@demo.com','abcd','abcd','abcd','1234',NULL),(6,'abcd','abcd','demo@demo.com','abcd','abcd','abcd','1234',NULL),(7,'abcd','abcd','demo@demo.com','abcd','abcd','abcd','1234',NULL),(8,'abcd','abcd','demo@demo.com','abcd','abcd','abcd','1234',NULL),(9,'abcd','abcd','demo@demo.com','abcd','abcd','1234','1234',NULL),(10,'abcd','abcd','demo@demo.com','abcd','abcd','1234','1234',NULL),(11,'abcd','abcd','demo@demo.com','abcd','abcd','abcd','1234',NULL),(12,'abcd','abcd','demo@demo.com','abcd','abcd','abcd','1234',NULL);
/*!40000 ALTER TABLE `order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `stock` int NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `discount` int NOT NULL,
  `discount_price` double DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Electronics','demoproduct description_edit','Lam6.jpg',54321,5,'demoproduct_edit',0,54321,_binary '\0'),(7,'Laptop','test2','Lam1.jpg',341,3,'test2',3,330.77,_binary ''),(10,'Testing','testdiscount1_Description','Lam4.jpg',10000,10,'testdiscount1',10,9000,_binary ''),(11,'Cosmetics','OutOfStock_Description','Lam5.jpg',253,0,'OutOfStock_Title',0,253,_binary '');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order`
--

DROP TABLE IF EXISTS `product_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime(6) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `order_adress_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKaesdtlw8yrveqk35ufhcqgw1k` (`order_adress_id`),
  KEY `FKh73acsd9s5wp6l0e55td6jr1m` (`product_id`),
  KEY `FK4f2ycr32kigtux5ag3tv0xu5m` (`user_id`),
  CONSTRAINT `FK4f2ycr32kigtux5ag3tv0xu5m` FOREIGN KEY (`user_id`) REFERENCES `user_dtls` (`id`),
  CONSTRAINT `FK5nbwlgxoten6utgqmnfd5rwyb` FOREIGN KEY (`order_adress_id`) REFERENCES `order_address` (`id`),
  CONSTRAINT `FKh73acsd9s5wp6l0e55td6jr1m` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order`
--

LOCK TABLES `product_order` WRITE;
/*!40000 ALTER TABLE `product_order` DISABLE KEYS */;
INSERT INTO `product_order` VALUES (1,'2025-09-10 11:01:20.214000','46106149-1662-426f-a0d2-bc04111892fe','COD',330.77,4,'IN_PROGRESS',7,5,1),(2,'2025-09-10 11:01:20.273000','ab147fa1-cba9-418b-9a84-4b1b3af2b945','COD',9000,1,'IN_PROGRESS',10,5,2),(3,'2025-09-10 11:05:40.337000','96b9d197-a0bd-48be-9d37-70e2278b0539','COD',330.77,4,'In Progress',7,5,3),(4,'2025-09-10 11:05:40.348000','d7e5a4a7-a608-4181-9416-0311e6e9e298','COD',9000,1,'In Progress',10,5,4),(5,'2025-09-11 11:38:36.600000','66ffdcd7-f70d-4b1b-9661-88dd3c79653e','ONLINE',330.77,4,'In Progress',7,5,5),(6,'2025-09-11 11:38:36.664000','e94d99c5-92be-4966-bd3e-123a8d0dd1a6','ONLINE',9000,1,'In Progress',10,5,6),(7,'2025-09-11 11:40:20.923000','992ec616-b190-4048-87ae-7a010a500937','ONLINE',330.77,4,'In Progress',7,5,7),(8,'2025-09-11 11:40:20.932000','47a6d1db-0b87-4c7a-982b-abcc848bf846','ONLINE',9000,1,'In Progress',10,5,8),(9,'2025-09-11 11:43:41.316000','47c250ee-264f-4d82-8ed1-867d53d50f89','ONLINE',330.77,4,'In Progress',7,5,9),(10,'2025-09-11 11:43:41.368000','c097c285-19b4-48d7-bfb7-363589e433e5','ONLINE',9000,1,'In Progress',10,5,10),(11,'2025-09-11 11:44:36.279000','a4dd32e7-c9c1-48df-b939-42822fe3303d','ONLINE',330.77,4,'In Progress',7,5,11),(12,'2025-09-11 11:44:36.332000','e5418746-63d3-4770-9713-d85d3ed6e7cf','ONLINE',9000,1,'In Progress',10,5,12);
/*!40000 ALTER TABLE `product_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_dtls`
--

DROP TABLE IF EXISTS `user_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_dtls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `is_enable` bit(1) DEFAULT NULL,
  `account_non_locked` bit(1) DEFAULT NULL,
  `failed_attempt` int DEFAULT NULL,
  `lock_time` datetime(6) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_dtls`
--

LOCK TABLES `user_dtls` WRITE;
/*!40000 ALTER TABLE `user_dtls` DISABLE KEYS */;
INSERT INTO `user_dtls` VALUES (1,'addresstest1','citytest1','test@test.com','numtest1','name1','1234','pincodetest1','137585657_1895865470555593_7235314738450122622_n.jpg','statetest1','ROLE_USER',_binary '\0',_binary '',0,NULL,NULL),(2,'addresstest2','citytest2','test2@test2.com','numtest2','name2','1234','pincodetest2','137585657_1895865470555593_7235314738450122622_n.jpg','statetest2','ROLE_ADMIN',_binary '',_binary '',0,NULL,NULL),(5,'demo','demo','demo@demo.com','1234','demo','$2a$10$99hXZfCpdsssO4rLtRuOGuiBt.q.j5O/nNhvCIUEe7730ZgG0iFbG','1234','Lam0.jpg','demo','ROLE_USER',_binary '',_binary '',1,NULL,NULL),(6,'demo2','demo2','demo2@demo2.com','1234','demo2','$2a$10$.VMGpbcdmzNGSFMgKyFQa.sjl9F0Mg.8W/ERzcW0Qt3DsJHH7jRH6','demo2','Lam0.jpg','demo2','ROLE_USER',_binary '\0',_binary '',0,NULL,NULL),(7,'admin','admin','admin@admin.com','1234','admin','$2a$10$0Csq1LWFiCci1cm8flN7GeZegP5JOGrmcXZLyXO2BWBHZhb4mEF9.','admin','Lam1.jpg','admin','ROLE_ADMIN',_binary '',_binary '',0,NULL,NULL);
/*!40000 ALTER TABLE `user_dtls` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-24 19:34:08
