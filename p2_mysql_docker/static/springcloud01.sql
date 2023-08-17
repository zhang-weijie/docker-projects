/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP DATABASE IF EXISTS `master_slave_replication_db`;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`master_slave_replication_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `master_slave_replication_db`;

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) NOT NULL COMMENT 'City',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='city where photo taken';

/*Data for the table `table` */

insert  into city(`id`,`name`)values

(1,'Vienna'),

(2,'Salzburg'),

(3,'Brussels'),

(4,'Toronto'),

(5,'Quebec'),

(6,'Ottawa'),

(7,'Copenhagen');

/*Table structure for table `country` */

DROP TABLE IF EXISTS country;

CREATE TABLE country (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) NOT NULL COMMENT 'Country',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Country where photo taken';

/*Data for the table `country` */

insert  into country(`id`,`name`)values

(1,'Austria'),

(2,'Belgium'),

(3,'Canada'),

(4,'Denmark');

/*Table structure for table `author` */

DROP TABLE IF EXISTS author;

CREATE TABLE author (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) NOT NULL COMMENT 'Author name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Author';

/*Data for the table `author` */

insert  into author(`id`,`name`)values

(1,'Me');

/*Table structure for table `figure` */

DROP TABLE IF EXISTS figure;

CREATE TABLE figure (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) NOT NULL COMMENT 'Figure',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Figure of photo';

/*Data for the table `figure` */

insert  into figure(`id`,`name`)values

(1,'Friends'),

(2,'Family'),

(3,'Animals'),

(4,'Landscape');

/*Table structure for table `photo` */

DROP TABLE IF EXISTS photo;

CREATE TABLE photo (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `author_id` int(10) DEFAULT NULL COMMENT 'Author',
  `country_id` int(10) DEFAULT NULL COMMENT 'Country where photo taken',
  `city_id` int(10) DEFAULT NULL COMMENT 'City where photo taken',
  `theme_id` int(10) DEFAULT NULL COMMENT 'Theme',
  `figure_id` int(10) DEFAULT NULL COMMENT 'Figure',
  `date` DATE DEFAULT NULL COMMENT 'Create Date',
  `desc` varchar(64) DEFAULT NULL COMMENT 'Description',
  `path` varchar(64) NOT NULL COMMENT 'Relative Path to /photo',
  PRIMARY KEY (`id`),
  KEY `author_id` (author_id),
  KEY `city_id` (city_id),
  KEY `country_id` (country_id),
  KEY `theme_id` (`theme_id`),
  KEY `figure_id` (`figure_id`),
  CONSTRAINT `photo_table_ibfk_2` FOREIGN KEY (author_id) REFERENCES author (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `photo_table_ibfk_3` FOREIGN KEY (city_id) REFERENCES city (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `photo_table_ibfk_4` FOREIGN KEY (country_id) REFERENCES country (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `photo_table_ibfk_5` FOREIGN KEY (theme_id) REFERENCES theme (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `photo_table_ibfk_6` FOREIGN KEY (figure_id) REFERENCES figure (id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Photo';

/*Table structure for table `theme` */

DROP TABLE IF EXISTS theme;

CREATE TABLE theme (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Theme of photo';

/*Data for the table `theme` */

insert  into theme(`id`,`name`) values

(1,'Campus'),

(2,'Travel'),

(3,'Food'),

(4,'Entertainment');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;