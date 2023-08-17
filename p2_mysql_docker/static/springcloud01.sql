/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 5.7.31-log : Database - master_slave_replication_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`master_slave_replication_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `master_slave_replication_db`;

/*Table structure for table `create_city_table` */

DROP TABLE IF EXISTS `create_city_table`;

CREATE TABLE `create_city_table` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) NOT NULL COMMENT '城市',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='拍摄城市';

/*Table structure for table `create_country_table` */

DROP TABLE IF EXISTS `create_country_table`;

CREATE TABLE `create_country_table` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) NOT NULL COMMENT '国家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='拍摄国家';

/*Table structure for table `create_date_table` */

DROP TABLE IF EXISTS `create_date_table`;

CREATE TABLE `create_date_table` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='拍摄时间';

/*Table structure for table `credit_to_table` */

DROP TABLE IF EXISTS `credit_to_table`;

CREATE TABLE `credit_to_table` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) NOT NULL COMMENT '姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='上传者';

/*Table structure for table `figure_table` */

DROP TABLE IF EXISTS `figure_table`;

CREATE TABLE `figure_table` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='人物';

/*Table structure for table `photo_table` */

DROP TABLE IF EXISTS `photo_table`;

CREATE TABLE `photo_table` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `credit_to_id` int(10) DEFAULT NULL COMMENT '上传者',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_date_id` int(10) DEFAULT NULL COMMENT '拍摄时间',
  `create_country_id` int(10) DEFAULT NULL COMMENT '拍摄国家',
  `create_city_id` int(10) DEFAULT NULL COMMENT '拍摄城市',
  `theme_id` int(10) DEFAULT NULL COMMENT '主题',
  `figure_id` int(10) DEFAULT NULL COMMENT '人物',
  `desc` varchar(64) DEFAULT NULL COMMENT '描述',
  `data` mediumblob,
  PRIMARY KEY (`id`),
  KEY `credit_to_id` (`credit_to_id`),
  KEY `create_date_id` (`create_date_id`),
  KEY `create_city_id` (`create_city_id`),
  KEY `create_country_id` (`create_country_id`),
  KEY `theme_id` (`theme_id`),
  KEY `figure_id` (`figure_id`),
  CONSTRAINT `photo_table_ibfk_2` FOREIGN KEY (`credit_to_id`) REFERENCES `credit_to_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `photo_table_ibfk_3` FOREIGN KEY (`create_city_id`) REFERENCES `create_city_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `photo_table_ibfk_4` FOREIGN KEY (`create_country_id`) REFERENCES `create_country_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `photo_table_ibfk_5` FOREIGN KEY (`theme_id`) REFERENCES `theme_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `photo_table_ibfk_6` FOREIGN KEY (`figure_id`) REFERENCES `figure_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `photo_table_ibfk_7` FOREIGN KEY (`create_date_id`) REFERENCES `create_date_table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='照片';

/*Table structure for table `theme_table` */

DROP TABLE IF EXISTS `theme_table`;

CREATE TABLE `theme_table` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='主题';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
