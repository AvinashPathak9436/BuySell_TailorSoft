-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.18-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema buysell_tailorsoft
--

CREATE DATABASE IF NOT EXISTS buysell_tailorsoft;
USE buysell_tailorsoft;

--
-- Definition of table `citylist`
--

DROP TABLE IF EXISTS `citylist`;
CREATE TABLE `citylist` (
  `cityid` varchar(30) NOT NULL,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY  USING BTREE (`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `citylist`
--

/*!40000 ALTER TABLE `citylist` DISABLE KEYS */;
INSERT INTO `citylist` (`cityid`,`city`) VALUES 
 ('Agra','agra'),
 ('Barabanki','barabanki'),
 ('Delhi','delhi'),
 ('Hydrabad','hydrabad'),
 ('Kanpur','kanpur'),
 ('Lucknow','lucknow'),
 ('Mathura','mathura'),
 ('Mumbai','mumbai'),
 ('Varanasi','varanasi');
/*!40000 ALTER TABLE `citylist` ENABLE KEYS */;


--
-- Definition of table `cityproducts`
--

DROP TABLE IF EXISTS `cityproducts`;
CREATE TABLE `cityproducts` (
  `ProductID` int(10) unsigned NOT NULL auto_increment,
  `Producttitle` varchar(50) NOT NULL,
  `Howolditis` varchar(45) NOT NULL,
  `Mrpofproduct` varchar(35) NOT NULL,
  `Productdescription` varchar(255) NOT NULL,
  `Sellingpriceofproduct` varchar(45) NOT NULL,
  `city` varchar(55) NOT NULL,
  `Dateofproduct` date NOT NULL,
  `pic` varchar(255) default NULL,
  `buyingstatus` varchar(6) NOT NULL default 'true',
  PRIMARY KEY  USING BTREE (`ProductID`),
  KEY `FK_cityproducts_2` (`city`),
  CONSTRAINT `FK_cityproducts_2` FOREIGN KEY (`city`) REFERENCES `citylist` (`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cityproducts`
--

/*!40000 ALTER TABLE `cityproducts` DISABLE KEYS */;
INSERT INTO `cityproducts` (`ProductID`,`Producttitle`,`Howolditis`,`Mrpofproduct`,`Productdescription`,`Sellingpriceofproduct`,`city`,`Dateofproduct`,`pic`,`buyingstatus`) VALUES 
 (1,'Lehenga','12 Months ago','2500/-','This lehenga product is unique piece of the shop...','2100/-','Lucknow','2021-01-03','','true'),
 (2,'Blazer','6 Months ago','1700/-','abcd','1999/-','Kanpur','2021-01-03',NULL,'true'),
 (3,'T-Shirt','11 Months ago','1999/-','nsjjdkkdyye','599/-','Mumbai','2021-01-04',NULL,'true'),
 (4,'Track Pant','2 Months Ago','1999/-','najdyeuhfkckd','999/-','Mathura','2021-01-04',NULL,'true'),
 (5,'Track Pants','2 Months Ago','1999/-','najdyeuhfkckd','999/-','Mathura','2021-01-04',NULL,'true');
/*!40000 ALTER TABLE `cityproducts` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `emailid` varchar(45) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY  (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`emailid`,`firstname`,`lastname`,`mobile`,`city`,`state`,`gender`,`date`) VALUES 
 ('ankit@gmail.com','Ankit','Yadav','6793882928','Lucknow','1234','bihar','2021-01-01'),
 ('ankitgupta@gmail.com','Ankit','Gupta','7827378836','Lalganj','uttarpradesh','male','2021-01-04'),
 ('lalityadav@gmail.com','Lalit','Yadav','6993794773','Lucknow','gujarat','male','2021-01-04'),
 ('mickeyvirus@gmail.com','Mickey','Virus','1248837729','Mumbai','maharastra','male','2021-01-01'),
 ('rahulsharma@gmail.com','Rahul','Sharma','6732988393','Siwan','bihar','male','2021-01-02'),
 ('rajanurag@gmail.com','Anurag','Raj','8799765778','Kanpur','uttarpradesh','male','2021-01-01'),
 ('rishabhsingh@gmail.com','Rishabh','Singh','8096226738','Deoria','uttarpradesh','male','2021-01-04'),
 ('rohitmalhotra@gmail.com','Rohit','Malhotra','8797341245','Mumbai','uttarpradesh','male','2021-01-04'),
 ('scott@gmail.com','Scott','Wing','1294993882','Mumbai','maharastra','12345','2021-01-01');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `usercredentials`
--

DROP TABLE IF EXISTS `usercredentials`;
CREATE TABLE `usercredentials` (
  `userid` varchar(45) NOT NULL,
  `userpass` varchar(45) NOT NULL,
  `usertype` varchar(45) NOT NULL,
  `status` varchar(6) NOT NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usercredentials`
--

/*!40000 ALTER TABLE `usercredentials` DISABLE KEYS */;
INSERT INTO `usercredentials` (`userid`,`userpass`,`usertype`,`status`) VALUES 
 ('Amit@gmail.com','1234','ur','true'),
 ('ankit@gmail.com','1234','ur','true'),
 ('ankitgupta@gmail.com','1234','ur','true'),
 ('dipaksingh@gmail.com','12345','ur','true'),
 ('lalityadav@gmail.com','1234','ur','true'),
 ('mickeyvirus@gmail.com','1234','ur','true'),
 ('rahulsharma@gmail.com','1234','ur','true'),
 ('rajanurag@gmail.com','12345','ur','true'),
 ('rishabhsingh@gmail.com','1234','ur','true'),
 ('rohitmalhotra@gmail.com','12345','ur','true'),
 ('scott@gmail.com','12345','ur','true');
/*!40000 ALTER TABLE `usercredentials` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
