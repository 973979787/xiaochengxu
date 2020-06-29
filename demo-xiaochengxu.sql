/*
SQLyog Professional v12.08 (64 bit)
MySQL - 8.0.19 : Database - xiaochengxu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xiaochengxu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `xiaochengxu`;

/*Table structure for table `api_app` */

DROP TABLE IF EXISTS `api_app`;

CREATE TABLE `api_app` (
  `appid` varchar(32) NOT NULL,
  `category` varchar(128) NOT NULL,
  `application` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `publish_date` date NOT NULL,
  `url` varchar(128) NOT NULL,
  `desc` longtext NOT NULL,
  PRIMARY KEY (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `api_app` */

insert  into `api_app`(`appid`,`category`,`application`,`name`,`publish_date`,`url`,`desc`) values ('36dd3ab3d4fdab1e8b02cc018f0f85e2','life','joke','每日笑话','2018-10-01','/service/joke','this is a backup image app.'),('733b49f6e59527d87e83ef718264f069','life','weather','天气','2018-10-01','/service/weather','this is a weather app.'),('8a6c20a5c22a4f9b86537c8ffc289da1','life','constellation','星座运势','2018-10-01','/service/constellation','this is a backup image app.'),('cec1be9b0286b3228e33091a5001e9eb','life','backup-image','图片备份','2018-10-01','/service/image','this is a backup image app.'),('e25a6fb9e992f6d584d8065c45532f18','life','stock','股票应用','2018-10-01','/service/stock','this is a backup image app.');

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add app',8,'add_app'),(23,'Can change app',8,'change_app'),(24,'Can delete app',8,'delete_app');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (1,'pbkdf2_sha256$36000$Uw5Q3PkMUOVC$es/8HOqrtvk9S88SbkITNRQNs2BvOOUkpCYLL+rSqJg=','2020-06-23 09:53:24.932233',1,'Admin','','','',1,1,'2020-06-23 09:52:56.844720');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `authorization_user` */

DROP TABLE IF EXISTS `authorization_user`;

CREATE TABLE `authorization_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `openid` varchar(32) NOT NULL,
  `nickname` varchar(128) NOT NULL,
  `focus_cities` longtext NOT NULL,
  `focus_constellations` longtext NOT NULL,
  `focus_stocks` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`),
  KEY `authorization_user_nickname_248a4fcf` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `authorization_user` */

insert  into `authorization_user`(`id`,`openid`,`nickname`,`focus_cities`,`focus_constellations`,`focus_stocks`) values (1,'otS7z0HtzzCjLG6Vi0_reWdYf2cY','clearlove','[{\"province\": \"\\u6e56\\u5317\\u7701\", \"city\": \"\\u6b66\\u6c49\\u5e02\", \"area\": \"\\u6c5f\\u5cb8\\u533a\"}]','[\"\\u767d\\u7f8a\\u5ea7\", \"\\u5de8\\u87f9\\u5ea7\", \"\\u91d1\\u725b\\u5ea7\"]','[{\"code\": \"000002\", \"name\": \"\\u4e07 \\u79d1\\uff21\", \"fullInfo\": \"\\u6df1\\u4ea4\\u6240-\\u4e07 \\u79d1\\uff21(000002)\", \"market\": \"sz\"}]');

/*Table structure for table `authorization_user_menu` */

DROP TABLE IF EXISTS `authorization_user_menu`;

CREATE TABLE `authorization_user_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `app_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authorization_user_menu_user_id_app_id_4d3d9382_uniq` (`user_id`,`app_id`),
  KEY `authorization_user_menu_app_id_13ca5893_fk_api_app_appid` (`app_id`),
  CONSTRAINT `authorization_user_m_user_id_b7aaa9f0_fk_authoriza` FOREIGN KEY (`user_id`) REFERENCES `authorization_user` (`id`),
  CONSTRAINT `authorization_user_menu_app_id_13ca5893_fk_api_app_appid` FOREIGN KEY (`app_id`) REFERENCES `api_app` (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `authorization_user_menu` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values (2,'2020-06-23 10:04:42.736775','d1885d0d2d657409a483a7ca4bd99006','{\'appid\': \'d1885d0d2d657409a483a7ca4bd99006\', \'category\': \'test\', \'application\': \'life\', \'name\': \'tes\', \'publish_date\': datetime.date(2020, 6, 23), \'url\': \'/test\', \'desc\': \'....\'}',1,'[{\"added\": {}}]',8,1),(3,'2020-06-23 10:04:52.503176','d1885d0d2d657409a483a7ca4bd99006','{\'appid\': \'d1885d0d2d657409a483a7ca4bd99006\', \'category\': \'test\', \'application\': \'life\', \'name\': \'tes\', \'publish_date\': datetime.date(2020, 6, 23), \'url\': \'/test\', \'desc\': \'....\'}',3,'',8,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(8,'api','app'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'authorization','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2020-06-18 10:13:44.534267'),(2,'auth','0001_initial','2020-06-18 10:13:45.507664'),(3,'admin','0001_initial','2020-06-18 10:13:45.738049'),(4,'admin','0002_logentry_remove_auto_add','2020-06-18 10:13:45.751045'),(5,'contenttypes','0002_remove_content_type_name','2020-06-18 10:13:45.967435'),(6,'auth','0002_alter_permission_name_max_length','2020-06-18 10:13:46.074151'),(7,'auth','0003_alter_user_email_max_length','2020-06-18 10:13:46.111080'),(8,'auth','0004_alter_user_username_opts','2020-06-18 10:13:46.124044'),(9,'auth','0005_alter_user_last_login_null','2020-06-18 10:13:46.216794'),(10,'auth','0006_require_contenttypes_0002','2020-06-18 10:13:46.224774'),(11,'auth','0007_alter_validators_add_error_messages','2020-06-18 10:13:46.237745'),(12,'auth','0008_alter_user_username_max_length','2020-06-18 10:13:46.328497'),(13,'authorization','0001_initial','2020-06-18 10:13:46.373350'),(14,'sessions','0001_initial','2020-06-18 10:13:46.433216'),(15,'authorization','0002_auto_20200619_1044','2020-06-19 02:45:07.759539'),(16,'authorization','0003_auto_20200620_1600','2020-06-20 08:01:05.043450'),(17,'api','0001_initial','2020-06-20 08:38:56.376706'),(18,'authorization','0004_user_menu','2020-06-20 08:38:56.665854');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('2uragale9dgrfnhg13dczv0gthmr4jd1','NTBmYjcwNGIzZjRmZTVlNzQ3YjMzZjI1ZDA0YjRlYjE3OGY3NzM3Njp7Im9wZW5faWQiOiJvdFM3ejBIdHp6Q2pMRzZWaTBfcmVXZFlmMmNZIiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=','2020-07-03 03:36:03.904664'),('5233mn1nh27t5kt3qny1dcwtlc7efxec','NTBmYjcwNGIzZjRmZTVlNzQ3YjMzZjI1ZDA0YjRlYjE3OGY3NzM3Njp7Im9wZW5faWQiOiJvdFM3ejBIdHp6Q2pMRzZWaTBfcmVXZFlmMmNZIiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=','2020-07-03 03:21:00.569037'),('76m3q2m2xdged9beoxzju40lxxk9i5t8','YTNlNDNiYzZlNzNiZGIwZjI3N2JlYWQyMGE3MDk2ZTM1ODU5NWUxYTp7fQ==','2020-07-19 09:44:35.103105'),('blkktggp0b6puv027llxbcnt4fdc7t3o','NTBmYjcwNGIzZjRmZTVlNzQ3YjMzZjI1ZDA0YjRlYjE3OGY3NzM3Njp7Im9wZW5faWQiOiJvdFM3ejBIdHp6Q2pMRzZWaTBfcmVXZFlmMmNZIiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=','2020-07-03 08:46:22.443616'),('eslirqq0mdhtdgf9ednwgpr83nnuus18','NTBmYjcwNGIzZjRmZTVlNzQ3YjMzZjI1ZDA0YjRlYjE3OGY3NzM3Njp7Im9wZW5faWQiOiJvdFM3ejBIdHp6Q2pMRzZWaTBfcmVXZFlmMmNZIiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=','2020-07-19 09:45:14.986746'),('h9rmwgihrui1ug5qdf3rejkh7z93whs9','NTBmYjcwNGIzZjRmZTVlNzQ3YjMzZjI1ZDA0YjRlYjE3OGY3NzM3Njp7Im9wZW5faWQiOiJvdFM3ejBIdHp6Q2pMRzZWaTBfcmVXZFlmMmNZIiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=','2020-07-02 10:56:17.991775'),('rv7i8iv4u86vu7ntdk73l2u35f4tzxvc','YTNlNDNiYzZlNzNiZGIwZjI3N2JlYWQyMGE3MDk2ZTM1ODU5NWUxYTp7fQ==','2020-07-03 09:02:56.559601'),('rxldfae5zc75qk7z4g07gopx7pv0fv94','YTNlNDNiYzZlNzNiZGIwZjI3N2JlYWQyMGE3MDk2ZTM1ODU5NWUxYTp7fQ==','2020-07-03 09:03:05.410786'),('td22xjbndjkbmrtvg6sv74ta8btitrbq','ZTM5MjdmZWMxYTlmMmE0NTU4NTNkNGFkOGU3MDExNWUzMWI1MDI0Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYjA2OWFjZjFhYTQzM2Y0YWFmNTU3Yjc1MmJlMTU1YzM4NjY2ZTQwIn0=','2020-07-23 09:53:24.946144'),('y4vn6n58ufdjpy8rid8thcz8pficomve','YTNlNDNiYzZlNzNiZGIwZjI3N2JlYWQyMGE3MDk2ZTM1ODU5NWUxYTp7fQ==','2020-07-03 09:03:01.397403');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
