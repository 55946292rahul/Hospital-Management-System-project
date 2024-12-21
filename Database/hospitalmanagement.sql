-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: hospitalmanagement
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `admission`
--

DROP TABLE IF EXISTS `admission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admission` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `discharge_date` date DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `room_id` int NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `pfkey_idx` (`patient_id`),
  KEY `dfkey_idx` (`doctor_id`),
  KEY `rfkey_idx` (`room_id`),
  CONSTRAINT `dfkey` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`),
  CONSTRAINT `pfkey` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `rfkey` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admission`
--

LOCK TABLES `admission` WRITE;
/*!40000 ALTER TABLE `admission` DISABLE KEYS */;
INSERT INTO `admission` VALUES (53,'0','2024-08-21','2024-08-16',1,30,13),(54,'0','2024-08-18','2024-08-16',1,1,1),(55,'0','2024-08-17','2024-08-16',1,1,2),(56,'0','2024-08-23','2024-08-16',1,1,3),(57,'0','2024-08-29','2024-08-16',1,1,14),(58,'0','2024-08-18','2024-08-17',17,97,1);
/*!40000 ALTER TABLE `admission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admission_request`
--

DROP TABLE IF EXISTS `admission_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admission_request` (
  `adid` int NOT NULL AUTO_INCREMENT,
  `did` int NOT NULL,
  `pid` int NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`adid`),
  KEY `FKb7vuxhmah7teo1vv8rt82qi3g` (`did`),
  KEY `FKg3a762kskhvkdt7inc6jxct8b` (`pid`),
  CONSTRAINT `FKb7vuxhmah7teo1vv8rt82qi3g` FOREIGN KEY (`did`) REFERENCES `doctor` (`doctor_id`),
  CONSTRAINT `FKg3a762kskhvkdt7inc6jxct8b` FOREIGN KEY (`pid`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admission_request`
--

LOCK TABLES `admission_request` WRITE;
/*!40000 ALTER TABLE `admission_request` DISABLE KEYS */;
INSERT INTO `admission_request` VALUES (10,1,1,'2024-08-16 05:30:00.000000','dsasd',_binary '\0'),(11,1,1,'2024-08-16 05:30:00.000000','sdvadsbhasbh',_binary '\0'),(12,1,30,'2024-08-16 05:30:00.000000','sfdabhjhasbdbn',_binary '\0'),(13,1,1,'2024-08-16 05:30:00.000000','jshhdhfurrur',_binary '\0'),(14,1,1,'2024-08-16 05:30:00.000000','stomach pai',_binary '\0'),(15,1,1,'2024-08-16 05:30:00.000000','sdsd',_binary '\0'),(16,1,1,'2024-08-16 05:30:00.000000','sdasda',_binary '\0'),(17,17,97,'2024-08-17 05:30:00.000000','Stomach pain',_binary '\0');
/*!40000 ALTER TABLE `admission_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `cityid` int DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `cityid_fk_idx` (`cityid`),
  CONSTRAINT `cityid_fk` FOREIGN KEY (`cityid`) REFERENCES `city` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'karve nagar','411021',1),(2,'shivaji nagar','411005',1),(3,'swargate','411042',1),(4,'pimpri','413102',1),(5,'CBS','422001',2),(6,'Dwarka circle','422001',2),(7,'Nashik road','422101',2);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` int NOT NULL,
  `did` int NOT NULL,
  `amount` float DEFAULT NULL,
  `discharge_date` date NOT NULL,
  `cat_id` int NOT NULL,
  `admission_id` int DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `billfkey_idx` (`did`),
  KEY `categoryfkey_idx` (`cat_id`),
  KEY `adkey_idx` (`admission_id`),
  CONSTRAINT `adkey` FOREIGN KEY (`admission_id`) REFERENCES `admission` (`aid`),
  CONSTRAINT `categoryfkey` FOREIGN KEY (`cat_id`) REFERENCES `roomcategory` (`roomcatid`),
  CONSTRAINT `dockey` FOREIGN KEY (`did`) REFERENCES `doctor` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Pune'),(2,'Nashik'),(3,'Jalgaon'),(4,'Satara'),(5,'Sagli'),(6,'Samhajiagar');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` int NOT NULL,
  `dept_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Allergists'),(2,'Dermatologists'),(3,'Ophthalmologists'),(4,'gynecologists'),(5,'Cardiologists'),(6,'Endocrinologists'),(7,'Gastroenterologists'),(8,'Nephrologists'),(9,'Urologists'),(10,'Pulmonologists'),(11,'Otolaryngologists'),(12,'Neurologists'),(13,'Psychiatrists'),(14,'Oncologists'),(15,'Radiologists'),(16,'General surgeon'),(17,'Orthopedic surgeon'),(18,'Anesthesiologists');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctor_id` int NOT NULL AUTO_INCREMENT,
  `df_name` varchar(255) DEFAULT NULL,
  `dl_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `d_address` varchar(255) DEFAULT NULL,
  `registration_id` varchar(255) DEFAULT NULL,
  `DOJ` date NOT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `dept_id` int NOT NULL,
  `Login_id` int NOT NULL,
  PRIMARY KEY (`doctor_id`),
  UNIQUE KEY `registration_id_UNIQUE` (`registration_id`),
  KEY `loginfkey_idx` (`Login_id`),
  KEY `deptfkey_idx` (`dept_id`),
  CONSTRAINT `deptfkey` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`),
  CONSTRAINT `loginfkey` FOREIGN KEY (`Login_id`) REFERENCES `login` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Abhishek','Ingle','5453526747','doctor.doctorcom','karve nagar,pune','1293993','2024-03-03','nuerologist',1,74),(14,'Rupesh','kirdat','85859969504','rupesh@kirdat','Bmcc road','12234566','2024-08-13','Derma',2,87),(15,'yash','sakharwade','9678485869','yashsakhaewade@gmail.com','karve nagar,pune','1253556464','2024-08-15','Derma',2,93),(16,'nayan','patil','9856432312','nayanpatil@gmail.com','karve nagar,pune','122434345253664','2024-08-15','Derma',2,100),(17,'Rahul','Diyewar','9785123210','rahuldiyewar@gmail.com','karve nagar,pune','12435564748','2024-08-15','Derma',2,103);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `r_id` int NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  KEY `rolefkey_idx` (`r_id`),
  CONSTRAINT `rolefkey` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'akashsalvi@gmail.com','123@456',3,'Active'),(2,'kunnal.p','123E345',3,'Active'),(3,'ram.patil','ram.patil',3,'Active'),(4,'gaurang.mulay','gaurang.mulay',3,'Active'),(5,'omkar.vaidya','omkar.vaidya',3,'Active'),(6,'yash.patil','yash.patil',3,'Active'),(7,'hiten.rathod','hiten.rathod',3,'Active'),(8,'anuja.deshmukh','anuja.deshmukh',3,'Active'),(17,'kunal.pingle','kunal.pingle',3,'Active'),(27,'string.string','string.string',3,'Active'),(28,'John.Doe','John.Doe',3,'Active'),(29,'John.Doe','John.Doe',3,'Active'),(30,'kunal.pingle','kunal.pingle',3,'Active'),(69,'abhishek.ingle','abhishek.ingle',3,'Active'),(71,'Abhishek.Ingle','Abhishek.Ingle',3,'Active'),(73,'admin@admin.com','admin.admin',1,'Active'),(74,'doctor@doctor.com','doctor.doctor',2,'Active'),(87,'Rupesh.Kirdat','Rupesh.Kirdat',2,'Active'),(88,'Pavan.Ghuge','Pavan.Ghuge',3,'Active'),(89,'pratapbhosale@gmail.com','pratap.bhosale',3,'Active'),(91,'yashpatil@gmail.com','yash.patil',3,'Active'),(92,'amanpatil@gmail.com','aman.pate',3,'Active'),(93,'yash@gmail.com','yash.sakharwade',2,'Active'),(94,'rahuldiyewar@gmail.com','rahul .diyewar',3,'Active'),(95,'newuser','string.string',3,'Active'),(96,'amol@nikumbh','amolnikumbh',3,'Active'),(99,'amol.patil','$2a$11$Fk8ekPIiY.KBYJ5i8ngzsu7hAqAxLnitb.OE0vtWY8Vg848XduXze',3,'Active'),(100,'nayanpatil','$2a$11$GIg1nBiDsXzHLqxmmD3DvuOdAKrZtBZjTpwi1ZqJoowAG/nz/5Ene',2,'Active'),(101,'yashkale','$2a$11$ADHGjo7xpjSRH70qHTmWAOPRn.pIwaHkvb6NCKqgmFWbLisyM/Ak2',3,'Active'),(102,'yashsakharwade','$2a$11$eWta4w.aOmyvZYSYYj2OIeNqu1.Rl32nESiw2tH.3h0MEoaQe.KdC',3,'Active'),(103,'rahuldiyewar','$2a$11$Gh3HAabQnMdUnNfcchZMBuslzWxyxv7H7Jnl7Cbfd7ToVlwtSY.ni',2,'Active');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `mob_no` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `aadhar_no` varchar(255) DEFAULT NULL,
  `p_address` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `blood_grp` varchar(255) DEFAULT NULL,
  `dob` date NOT NULL,
  `areaid` int NOT NULL,
  `loginid` int NOT NULL,
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `email_address_UNIQUE` (`email_address`),
  UNIQUE KEY `aadhar_no_UNIQUE` (`aadhar_no`),
  KEY `areaid_fk_idx` (`areaid`),
  KEY `loginid_fk_idx` (`loginid`),
  CONSTRAINT `areaid_fk` FOREIGN KEY (`areaid`) REFERENCES `area` (`aid`),
  CONSTRAINT `loginid_fk` FOREIGN KEY (`loginid`) REFERENCES `login` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'akash','salvi','678656688','akashsalvi@gmail.com','12345678','flat no.303 dyandeep colony,karve nagar, pune','M','o+','1998-07-27',1,1),(25,'string','string','1234556788','string','string','string','string','string','2024-08-05',1,2),(26,'ram','patil','33456785','ram.patil','12344444444','karve ','M','O+ve','2024-08-06',1,3),(27,'gaurang','mulay','12334556778','gaurangmulay@gmail.com','1263664','karve nagar,pune','Male','B+ve','2024-01-02',1,4),(28,'omkar','vaidya','67554433','omkar@gmail.com','32344415552','karve nagar,pune','Male','O+ve','2024-08-05',1,5),(29,'yash','patil','86765677','yash@patil','43552626','shivajiagar,pune','Male','B+ve','2024-08-05',2,6),(30,'hiten','rathod','5567894','hiten@gmail.com','525263781','karve nagar,pune','Male','O+ve','2024-08-05',1,7),(31,'anuja','deshmukh','2345678','anuja@gmail.com','14256637388','karve nagar,pune','Female','A+ve','2024-08-05',1,8),(83,'Abhishek','Ingle','7249658000','abhi@gmail.com','545415454','Mauli niwas','Male','O+ve','2024-08-06',1,71),(85,'Pavan','Ghuge','9876543219','pavanghuge9130@gmail.com','123456789012345678','sdfghjklsdfghjkldfghjkl, pune','Male','B+ve','2024-08-07',1,88),(86,'pratap','bhosale','99588388299','pratapbhosale@gmail.com','1127773882990','deccan,pune','Male','B+ve','1998-02-14',1,89),(88,'yash','patil','9796965050','yashpatil@gmail.com','123456712344','karve nagar,pune','Male','O+ve','2024-08-05',1,91),(89,'aman','pate','3674775858','amanpatil@gmail.com','1223432344','karve nagar,pune','Male','A+ve','2024-08-05',1,92),(90,'rahul ','diyewar','9796999493','rahuldiyewar@gmail.com','1666336727288283','karve nagar,pune','Male','B+ve','2024-08-02',1,94),(91,'string','string','6464747','string@gmail.com','12353647894','string','string','string','2024-08-15',1,95),(92,'amol','nikumbh','9405336409','amolnikumbh@gmal.com','123000674858','karve nagar ,pune','Male','B+ve','1998-01-23',1,96),(95,'amol','patil','9499392939','amolpatil@gmail.com','122343225678','karve Nagar Pune','Male','B+ve','1998-01-17',1,99),(96,'yash','kale','765746343212','yashkale@gmail.com','123456789101','karve nagar pune','Male','B+ve','2024-08-12',1,101),(97,'yash ','sakharwade','9875487845','yashsakharwade@gmail.com','4516798894542','karve nagar,pune','Male','O+ve','2024-08-01',1,102);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `pay_id` int NOT NULL,
  `transaction_id` varchar(45) NOT NULL,
  `amount` float DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `bill_id` int DEFAULT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `dofkey` (`doctor_id`),
  KEY `pafkey` (`patient_id`),
  KEY `bilfkey` (`bill_id`),
  CONSTRAINT `bilfkey` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`),
  CONSTRAINT `dofkey` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`),
  CONSTRAINT `pafkey` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `r_id` int NOT NULL,
  `r_name` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin',NULL),(2,'Doctor',NULL),(3,'Patient',NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` int NOT NULL,
  `availability` bit(1) NOT NULL,
  `price` float DEFAULT NULL,
  `room_number` varchar(255) DEFAULT NULL,
  `room_type` varchar(255) DEFAULT NULL,
  `roomcatid` int NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `rckey_idx` (`roomcatid`),
  CONSTRAINT `rckey` FOREIGN KEY (`roomcatid`) REFERENCES `roomcategory` (`roomcatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,_binary '',5000,'101','A',1),(2,_binary '',5000,'102','B',1),(3,_binary '',5000,'103','C',1),(4,_binary '',5000,'104','D',1),(5,_binary '',3000,'201','A',2),(6,_binary '',3000,'202','B',2),(7,_binary '',3000,'203','C',2),(8,_binary '',3000,'204','D',2),(9,_binary '',3000,'205','E',2),(10,_binary '',3000,'206','F',2),(11,_binary '',2000,'301','A',3),(12,_binary '',2000,'302','B',3),(13,_binary '',2000,'303','C',3),(14,_binary '',2000,'304','D',3),(15,_binary '',2000,'305','E',3),(16,_binary '',2000,'306','F',3),(17,_binary '',1000,'401','A',4),(18,_binary '',1000,'402','B',4),(19,_binary '',1000,'403','C',4),(20,_binary '',1000,'404','D',4),(21,_binary '',1000,'405','E',4),(22,_binary '',1000,'406','F',4);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomcategory`
--

DROP TABLE IF EXISTS `roomcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomcategory` (
  `roomcatid` int NOT NULL,
  `charges` double NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roomcatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomcategory`
--

LOCK TABLES `roomcategory` WRITE;
/*!40000 ALTER TABLE `roomcategory` DISABLE KEYS */;
INSERT INTO `roomcategory` VALUES (1,5000,'A','ICU'),(2,3000,'B','Delux'),(3,2000,'C','Semi Delux'),(4,1000,'D','General');
/*!40000 ALTER TABLE `roomcategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-17 16:42:33
