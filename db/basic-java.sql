/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 8.0.26 : Database - basic-java
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`basicjava` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `basicjava`;

/*Table structure for table `checkout_exam_pool` */

DROP TABLE IF EXISTS `checkout_exam_pool`;

CREATE TABLE `checkout_exam_pool` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `checkout_id` bigint DEFAULT NULL COMMENT 'checkoutid',
  `exam_id` bigint DEFAULT NULL COMMENT '试题id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;

/*Data for the table `checkout_exam_pool` */

insert  into `checkout_exam_pool`(`id`,`checkout_id`,`exam_id`) values 
(21,2,1),
(23,1,5),
(24,1,1),
(25,1,5),
(26,1,1),
(27,1,1),
(29,1,4),
(30,1,5),
(31,2,1),
(32,2,3),
(33,2,4),
(36,1,5),
(37,1,7),
(38,1,6),
(39,1,8),
(40,2,6),
(41,2,8),
(42,2,5),
(43,3,3),
(44,3,5),
(45,3,4),
(46,4,3),
(47,4,6),
(48,4,8),
(49,4,9),
(50,4,5);

/*Table structure for table `class` */

DROP TABLE IF EXISTS `class`;

CREATE TABLE `class` (
  `class_id` bigint NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `user_id` bigint DEFAULT NULL COMMENT '教师id',
  `class_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '班级名称',
  `class_desc` varchar(50) DEFAULT NULL COMMENT '班级描述',
  `class_picture` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '图片地址',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

/*Data for the table `class` */

insert  into `class`(`class_id`,`user_id`,`class_name`,`class_desc`,`class_picture`,`create_time`) values 
(4,11,'软件2班','软件2班','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAeAB4AAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCACCAIkDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD3NalWolqUUASCnU0U6gApaSloAKKKKACiiigAooooAKKKKACiiigAooooApJUwqFKmWgCQU6minUAFLSUE4oAWioy/OBzRl/7tAElFR7mHUGnBwaAHUUUUAFFFFABRRRQAUUUUAUkqZahSploAkFOFNFOoAQnFMALn/ZobkhR3qQDAwKAAAAYApaKKACmMmeV4NPooAYrdj1p9RyDBDD8aeDkUALRRRQAUUUUAFFFFAFJKmWoUqZaAJBS0gpaAGLzL9BUtRDiUe9S0AFcj4j8XnTr6O1sQkjxsDOTyP8Ad+tdVcRvLbvHHKYmYYDqMlfcVyZ+H9ozFmvrgknJJA5rswf1dS5q7+Ry4r27jy0V8zpdO1CDVLGO6t2yjjkd1PcH3q3WHonhxdDmdoL2Z43HzRuBgnsfrW5WFZU1N+zd0bUnNwXtFZjX+4fpSJ0pZDhDQnSsjQdRRRQAUUUUAFFFFAFJKmWoUqZaAJBTqaKcKAGOO4p6tuGfzophBU5WgCSimCQHrwfen5oAKKQso6kUwsW4XgetAAx3NgdBTxwKRVwKdQAUUUUAFFFFABRRRQBSSplqFKmWgCQU4U0U4UAFLSUtADSgNN8sVJRQAwRgU4DFLRQAUUUUAFFFFABRRRQAUUUUAUkqZahSploAkFOFNFOFABS0lLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBSWplqFKmWgB4p4pgp4oAKWkpaACiiigAooooAKKKKACiiigAooooAKKKKAKKVOKKKAHinUUUALS0UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAf/9k=','2023-03-09 23:58:11'),
(5,13,'计算机1班','计算机1班','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAeAB4AAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCACCAIkDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD3NalWolqUUASCnU0U6gApaSloAKKKKACiiigAooooAKKKKACiiigAooooApJUwqFKmWgCQU6minUAFLSUE4oAWioy/OBzRl/7tAElFR7mHUGnBwaAHUUUUAFFFFABRRRQAUUUUAUkqZahSploAkFOFNFOoAQnFMALn/ZobkhR3qQDAwKAAAAYApaKKACmMmeV4NPooAYrdj1p9RyDBDD8aeDkUALRRRQAUUUUAFFFFAFJKmWoUqZaAJBS0gpaAGLzL9BUtRDiUe9S0AFcj4j8XnTr6O1sQkjxsDOTyP8Ad+tdVcRvLbvHHKYmYYDqMlfcVyZ+H9ozFmvrgknJJA5rswf1dS5q7+Ry4r27jy0V8zpdO1CDVLGO6t2yjjkd1PcH3q3WHonhxdDmdoL2Z43HzRuBgnsfrW5WFZU1N+zd0bUnNwXtFZjX+4fpSJ0pZDhDQnSsjQdRRRQAUUUUAFFFFAFJKmWoUqZaAJBTqaKcKAGOO4p6tuGfzophBU5WgCSimCQHrwfen5oAKKQso6kUwsW4XgetAAx3NgdBTxwKRVwKdQAUUUUAFFFFABRRRQBSSplqFKmWgCQU4U0U4UAFLSUtADSgNN8sVJRQAwRgU4DFLRQAUUUUAFFFFABRRRQAUUUUAUkqZahSploAkFOFNFOFABS0lLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBSWplqFKmWgB4p4pgp4oAKWkpaACiiigAooooAKKKKACiiigAooooAKKKKAKKVOKKKAHinUUUALS0UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAf/9k=','2023-03-09 23:58:11'),
(6,22,'计算机2班','计算机2班','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAeAB4AAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCACCAIkDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD3NalWolqUUASCnU0U6gApaSloAKKKKACiiigAooooAKKKKACiiigAooooApJUwqFKmWgCQU6minUAFLSUE4oAWioy/OBzRl/7tAElFR7mHUGnBwaAHUUUUAFFFFABRRRQAUUUUAUkqZahSploAkFOFNFOoAQnFMALn/ZobkhR3qQDAwKAAAAYApaKKACmMmeV4NPooAYrdj1p9RyDBDD8aeDkUALRRRQAUUUUAFFFFAFJKmWoUqZaAJBS0gpaAGLzL9BUtRDiUe9S0AFcj4j8XnTr6O1sQkjxsDOTyP8Ad+tdVcRvLbvHHKYmYYDqMlfcVyZ+H9ozFmvrgknJJA5rswf1dS5q7+Ry4r27jy0V8zpdO1CDVLGO6t2yjjkd1PcH3q3WHonhxdDmdoL2Z43HzRuBgnsfrW5WFZU1N+zd0bUnNwXtFZjX+4fpSJ0pZDhDQnSsjQdRRRQAUUUUAFFFFAFJKmWoUqZaAJBTqaKcKAGOO4p6tuGfzophBU5WgCSimCQHrwfen5oAKKQso6kUwsW4XgetAAx3NgdBTxwKRVwKdQAUUUUAFFFFABRRRQBSSplqFKmWgCQU4U0U4UAFLSUtADSgNN8sVJRQAwRgU4DFLRQAUUUUAFFFFABRRRQAUUUUAUkqZahSploAkFOFNFOFABS0lLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBSWplqFKmWgB4p4pgp4oAKWkpaACiiigAooooAKKKKACiiigAooooAKKKKAKKVOKKKAHinUUUALS0UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAf/9k=','2023-03-14 00:15:14'),
(7,20,'计算机1班','计算机1班','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAeAB4AAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCACCAIkDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD3NalWolqUUASCnU0U6gApaSloAKKKKACiiigAooooAKKKKACiiigAooooApJUwqFKmWgCQU6minUAFLSUE4oAWioy/OBzRl/7tAElFR7mHUGnBwaAHUUUUAFFFFABRRRQAUUUUAUkqZahSploAkFOFNFOoAQnFMALn/ZobkhR3qQDAwKAAAAYApaKKACmMmeV4NPooAYrdj1p9RyDBDD8aeDkUALRRRQAUUUUAFFFFAFJKmWoUqZaAJBS0gpaAGLzL9BUtRDiUe9S0AFcj4j8XnTr6O1sQkjxsDOTyP8Ad+tdVcRvLbvHHKYmYYDqMlfcVyZ+H9ozFmvrgknJJA5rswf1dS5q7+Ry4r27jy0V8zpdO1CDVLGO6t2yjjkd1PcH3q3WHonhxdDmdoL2Z43HzRuBgnsfrW5WFZU1N+zd0bUnNwXtFZjX+4fpSJ0pZDhDQnSsjQdRRRQAUUUUAFFFFAFJKmWoUqZaAJBTqaKcKAGOO4p6tuGfzophBU5WgCSimCQHrwfen5oAKKQso6kUwsW4XgetAAx3NgdBTxwKRVwKdQAUUUUAFFFFABRRRQBSSplqFKmWgCQU4U0U4UAFLSUtADSgNN8sVJRQAwRgU4DFLRQAUUUUAFFFFABRRRQAUUUUAUkqZahSploAkFOFNFOFABS0lLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBSWplqFKmWgB4p4pgp4oAKWkpaACiiigAooooAKKKKACiiigAooooAKKKKAKKVOKKKAHinUUUALS0UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAf/9k=','2023-03-16 21:26:37');

/*Table structure for table `class_user` */

DROP TABLE IF EXISTS `class_user`;

CREATE TABLE `class_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `class_id` bigint DEFAULT NULL COMMENT '班级id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

/*Data for the table `class_user` */

insert  into `class_user`(`id`,`class_id`,`user_id`) values 
(1,5,17),
(3,4,8),
(5,6,24),
(6,7,25);

/*Table structure for table `exam_checkout` */

DROP TABLE IF EXISTS `exam_checkout`;

CREATE TABLE `exam_checkout` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id自增主键',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `picture` text COMMENT '封面',
  `checkout_dec` varchar(50) DEFAULT NULL COMMENT '备注',
  `total_score` int DEFAULT '0' COMMENT '总分值',
  `total_level` int DEFAULT '1' COMMENT '难度等级',
  `is_state` tinyint DEFAULT '1' COMMENT '1：正常，0：禁用',
  `class_id` bigint DEFAULT NULL COMMENT '班级id',
  `class_name` varchar(50) DEFAULT NULL COMMENT '班级名称',
  `checkout_time` datetime DEFAULT NULL COMMENT '开考时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

/*Data for the table `exam_checkout` */

insert  into `exam_checkout`(`id`,`title`,`picture`,`checkout_dec`,`total_score`,`total_level`,`is_state`,`class_id`,`class_name`,`checkout_time`) values 
(1,'软件工程大一（下）期末考试','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAeAB4AAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCACCAIkDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD3NalWolqUUASCnU0U6gApaSloAKKKKACiiigAooooAKKKKACiiigAooooApJUwqFKmWgCQU6minUAFLSUE4oAWioy/OBzRl/7tAElFR7mHUGnBwaAHUUUUAFFFFABRRRQAUUUUAUkqZahSploAkFOFNFOoAQnFMALn/ZobkhR3qQDAwKAAAAYApaKKACmMmeV4NPooAYrdj1p9RyDBDD8aeDkUALRRRQAUUUUAFFFFAFJKmWoUqZaAJBS0gpaAGLzL9BUtRDiUe9S0AFcj4j8XnTr6O1sQkjxsDOTyP8Ad+tdVcRvLbvHHKYmYYDqMlfcVyZ+H9ozFmvrgknJJA5rswf1dS5q7+Ry4r27jy0V8zpdO1CDVLGO6t2yjjkd1PcH3q3WHonhxdDmdoL2Z43HzRuBgnsfrW5WFZU1N+zd0bUnNwXtFZjX+4fpSJ0pZDhDQnSsjQdRRRQAUUUUAFFFFAFJKmWoUqZaAJBTqaKcKAGOO4p6tuGfzophBU5WgCSimCQHrwfen5oAKKQso6kUwsW4XgetAAx3NgdBTxwKRVwKdQAUUUUAFFFFABRRRQBSSplqFKmWgCQU4U0U4UAFLSUtADSgNN8sVJRQAwRgU4DFLRQAUUUUAFFFFABRRRQAUUUUAUkqZahSploAkFOFNFOFABS0lLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBSWplqFKmWgB4p4pgp4oAKWkpaACiiigAooooAKKKKACiiigAooooAKKKKAKKVOKKKAHinUUUALS0UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAf/9k=','软件工程大一（下）期末考试',20,3,1,4,'软件2班','2023-03-15 00:00:00'),
(2,'计算机科学与技术大一（下）期末考试','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAeAB4AAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCACCAIkDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD3NalWolqUUASCnU0U6gApaSloAKKKKACiiigAooooAKKKKACiiigAooooApJUwqFKmWgCQU6minUAFLSUE4oAWioy/OBzRl/7tAElFR7mHUGnBwaAHUUUUAFFFFABRRRQAUUUUAUkqZahSploAkFOFNFOoAQnFMALn/ZobkhR3qQDAwKAAAAYApaKKACmMmeV4NPooAYrdj1p9RyDBDD8aeDkUALRRRQAUUUUAFFFFAFJKmWoUqZaAJBS0gpaAGLzL9BUtRDiUe9S0AFcj4j8XnTr6O1sQkjxsDOTyP8Ad+tdVcRvLbvHHKYmYYDqMlfcVyZ+H9ozFmvrgknJJA5rswf1dS5q7+Ry4r27jy0V8zpdO1CDVLGO6t2yjjkd1PcH3q3WHonhxdDmdoL2Z43HzRuBgnsfrW5WFZU1N+zd0bUnNwXtFZjX+4fpSJ0pZDhDQnSsjQdRRRQAUUUUAFFFFAFJKmWoUqZaAJBTqaKcKAGOO4p6tuGfzophBU5WgCSimCQHrwfen5oAKKQso6kUwsW4XgetAAx3NgdBTxwKRVwKdQAUUUUAFFFFABRRRQBSSplqFKmWgCQU4U0U4UAFLSUtADSgNN8sVJRQAwRgU4DFLRQAUUUUAFFFFABRRRQAUUUUAUkqZahSploAkFOFNFOFABS0lLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBSWplqFKmWgB4p4pgp4oAKWkpaACiiigAooooAKKKKACiiigAooooAKKKKAKKVOKKKAHinUUUALS0UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAf/9k=','计算机科学与技术大一（下）期末考试',12,3,1,5,'计算机1班','2023-03-16 00:00:00'),
(3,'计算机2班期末考试','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAeAB4AAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCACCAIkDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD3NalWolqUUASCnU0U6gApaSloAKKKKACiiigAooooAKKKKACiiigAooooApJUwqFKmWgCQU6minUAFLSUE4oAWioy/OBzRl/7tAElFR7mHUGnBwaAHUUUUAFFFFABRRRQAUUUUAUkqZahSploAkFOFNFOoAQnFMALn/ZobkhR3qQDAwKAAAAYApaKKACmMmeV4NPooAYrdj1p9RyDBDD8aeDkUALRRRQAUUUUAFFFFAFJKmWoUqZaAJBS0gpaAGLzL9BUtRDiUe9S0AFcj4j8XnTr6O1sQkjxsDOTyP8Ad+tdVcRvLbvHHKYmYYDqMlfcVyZ+H9ozFmvrgknJJA5rswf1dS5q7+Ry4r27jy0V8zpdO1CDVLGO6t2yjjkd1PcH3q3WHonhxdDmdoL2Z43HzRuBgnsfrW5WFZU1N+zd0bUnNwXtFZjX+4fpSJ0pZDhDQnSsjQdRRRQAUUUUAFFFFAFJKmWoUqZaAJBTqaKcKAGOO4p6tuGfzophBU5WgCSimCQHrwfen5oAKKQso6kUwsW4XgetAAx3NgdBTxwKRVwKdQAUUUUAFFFFABRRRQBSSplqFKmWgCQU4U0U4UAFLSUtADSgNN8sVJRQAwRgU4DFLRQAUUUUAFFFFABRRRQAUUUUAUkqZahSploAkFOFNFOFABS0lLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBSWplqFKmWgB4p4pgp4oAKWkpaACiiigAooooAKKKKACiiigAooooAKKKKAKKVOKKKAHinUUUALS0UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAf/9k=','',4,3,1,6,'计算机2班','2023-03-16 00:00:00'),
(4,'计算机1班期末考试','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAeAB4AAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCACCAIkDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD3NalWolqUUASCnU0U6gApaSloAKKKKACiiigAooooAKKKKACiiigAooooApJUwqFKmWgCQU6minUAFLSUE4oAWioy/OBzRl/7tAElFR7mHUGnBwaAHUUUUAFFFFABRRRQAUUUUAUkqZahSploAkFOFNFOoAQnFMALn/ZobkhR3qQDAwKAAAAYApaKKACmMmeV4NPooAYrdj1p9RyDBDD8aeDkUALRRRQAUUUUAFFFFAFJKmWoUqZaAJBS0gpaAGLzL9BUtRDiUe9S0AFcj4j8XnTr6O1sQkjxsDOTyP8Ad+tdVcRvLbvHHKYmYYDqMlfcVyZ+H9ozFmvrgknJJA5rswf1dS5q7+Ry4r27jy0V8zpdO1CDVLGO6t2yjjkd1PcH3q3WHonhxdDmdoL2Z43HzRuBgnsfrW5WFZU1N+zd0bUnNwXtFZjX+4fpSJ0pZDhDQnSsjQdRRRQAUUUUAFFFFAFJKmWoUqZaAJBTqaKcKAGOO4p6tuGfzophBU5WgCSimCQHrwfen5oAKKQso6kUwsW4XgetAAx3NgdBTxwKRVwKdQAUUUUAFFFFABRRRQBSSplqFKmWgCQU4U0U4UAFLSUtADSgNN8sVJRQAwRgU4DFLRQAUUUUAFFFFABRRRQAUUUUAUkqZahSploAkFOFNFOFABS0lLQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBSWplqFKmWgB4p4pgp4oAKWkpaACiiigAooooAKKKKACiiigAooooAKKKKAKKVOKKKAHinUUUALS0UUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAf/9k=','计算机1班期末考试',13,2,1,7,'计算机1班','2023-03-16 00:00:00');

/*Table structure for table `exam_model` */

DROP TABLE IF EXISTS `exam_model`;

CREATE TABLE `exam_model` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type` varchar(50) DEFAULT NULL COMMENT '试题类型',
  `model` text COMMENT '试题模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

/*Data for the table `exam_model` */

insert  into `exam_model`(`id`,`type`,`model`) values 
(1,'JAVA','public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println();\r\n\r\n    }\r\n}'),
(2,'PYTHON','#!/usr/bin/python\r\n# -*- coding: utf8 -*-\r\n\r\n# 在这里写代码\r\nprint(\"Hello, World!\");');

/*Table structure for table `exam_pool` */

DROP TABLE IF EXISTS `exam_pool`;

CREATE TABLE `exam_pool` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '题库主键',
  `exam_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '题库类型',
  `title` varchar(50) DEFAULT NULL COMMENT '题库标题',
  `exam_source` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '试题',
  `score` int DEFAULT NULL COMMENT '分值',
  `answer` varchar(50) DEFAULT NULL COMMENT '答案',
  `exam_analyze` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '解析',
  `exam_level` int DEFAULT NULL COMMENT '难度等级',
  `isPractice` tinyint DEFAULT '0' COMMENT '1表示已添加进在线练习中，0表示没有',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

/*Data for the table `exam_pool` */

insert  into `exam_pool`(`id`,`exam_type`,`title`,`exam_source`,`score`,`answer`,`exam_analyze`,`exam_level`,`isPractice`,`create_time`) values 
(3,'PYTHON','计算10+10的结果','#!/usr/bin/python\r\n# -*- coding: utf8 -*-\r\n\r\n# 在这里写代码\r\nprint(\"Hello, World!\");',2,'20','输出10+10',2,1,'2023-03-12 07:21:44'),
(4,'JAVA','输出小写helloworld','public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println();\r\n\r\n    }\r\n}',1,'helloworld','输出helloworld',3,1,'2023-03-12 18:03:10'),
(5,'PYTHON','输出小写helloworld','#!/usr/bin/python\r\n# -*- coding: utf8 -*-\r\n\r\n# 在这里写代码\r\nprint(\"Hello, World!\");',1,'helloworld','输出helloworld',5,0,'2023-03-12 18:03:44'),
(6,'JAVA','计算2+2的值','public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println();\r\n\r\n    }\r\n}',5,'4','',2,0,'2023-03-13 23:52:52'),
(7,'JAVA','计算10*10','public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println();\r\n\r\n    }\r\n}',10,'100','',3,1,'2023-03-13 23:53:19'),
(8,'JAVA','计算20+20的值','public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println();\r\n\r\n    }\r\n}',3,'40','',3,1,'2023-03-14 00:16:23'),
(9,'JAVA','输出3+4的结果','public class Test {\r\n    public static void main(String[] args) {\r\n        //输出3+4的结果\r\n        System.out.println();\r\n\r\n    }\r\n}',2,'7','输出3+4的结果',2,1,'2023-03-16 21:27:48');

/*Table structure for table `paper_exam_pool` */

DROP TABLE IF EXISTS `paper_exam_pool`;

CREATE TABLE `paper_exam_pool` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `paper_model_id` bigint DEFAULT NULL COMMENT '试卷模型id',
  `exam_pool_id` bigint DEFAULT NULL COMMENT '试题id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;

/*Data for the table `paper_exam_pool` */

insert  into `paper_exam_pool`(`id`,`paper_model_id`,`exam_pool_id`) values 
(13,1,5),
(15,1,1),
(17,2,1),
(19,2,3),
(20,2,4),
(21,2,5),
(22,3,3),
(23,3,5),
(25,1,4),
(26,1,7),
(27,3,4),
(28,1,3),
(29,1,6),
(30,4,9),
(31,4,3),
(32,4,8),
(33,4,6);

/*Table structure for table `paper_model` */

DROP TABLE IF EXISTS `paper_model`;

CREATE TABLE `paper_model` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `paper_title` varchar(50) DEFAULT NULL COMMENT '标题',
  `total_score` int DEFAULT '0' COMMENT '总分',
  `paper_desc` varchar(50) DEFAULT NULL COMMENT '试卷模型描述',
  `paper_level` int DEFAULT '1' COMMENT '试题模型难度等级',
  `is_delete` tinyint DEFAULT '0' COMMENT '1：删除，0：未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

/*Data for the table `paper_model` */

insert  into `paper_model`(`id`,`paper_title`,`total_score`,`paper_desc`,`paper_level`,`is_delete`) values 
(1,'软件工程大一（上）期末试卷',19,'软件工程大一（上）期末试卷',3,0),
(2,'计算机科学与技术试题',4,'计算机科学与技术试题',3,0),
(3,'计算机2班期末考试',4,'计算机2班期末考试',3,0),
(4,'计算机1班下学期考试',12,'计算机1班下学期考试',2,0);

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_cron_triggers` */

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`) USING BTREE,
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_job_details` */

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`SCHED_NAME`,`LOCK_NAME`) values 
('basicScheduler','STATE_ACCESS'),
('basicScheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values 
('basicScheduler','张三1678971529468',1678974878023,15000);

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `qrtz_triggers` */

/*Table structure for table `schedule_job` */

DROP TABLE IF EXISTS `schedule_job`;

CREATE TABLE `schedule_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务';

/*Data for the table `schedule_job` */

/*Table structure for table `schedule_job_log` */

DROP TABLE IF EXISTS `schedule_job_log`;

CREATE TABLE `schedule_job_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数',
  `status` tinyint NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '失败信息',
  `times` int NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务日志';

/*Data for the table `schedule_job_log` */

/*Table structure for table `sys_captcha` */

DROP TABLE IF EXISTS `sys_captcha`;

CREATE TABLE `sys_captcha` (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统验证码';

/*Data for the table `sys_captcha` */

insert  into `sys_captcha`(`uuid`,`code`,`expire_time`) values 
('356967e6-43fd-40cd-82aa-379390d2e41f','bny4p','2023-03-09 15:14:32'),
('49f1638b-4834-41e1-8290-59079933c24c','x63n5','2023-03-16 21:44:36'),
('6e31e723-76ab-4246-8506-841eb46af6c6','adcxe','2023-02-27 20:50:58'),
('8c251ab3-423d-45c3-88a8-c7022f59b2e6','2y436','2023-02-27 20:54:58'),
('8ced5dcf-81fb-4ba4-872e-8248c11d2322','628dy','2023-03-15 07:31:52'),
('8da9e77f-c685-4de5-8149-d09572e06ed7','4ppg5','2023-02-27 20:50:55'),
('a0e7f840-cfd2-461e-89e5-d02569f9c3b3','43fc7','2023-03-16 15:46:34'),
('dfc4372a-56a1-40a4-8e6e-cb77d248b5f3','7w6ng','2023-03-09 18:50:46'),
('f6de26b7-9341-4c5d-8bf2-86b8cac49f3b','wdc27','2023-02-27 20:54:54');

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'value',
  `status` tinyint DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `param_key` (`param_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统配置信息表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`param_key`,`param_value`,`status`,`remark`) values 
(1,'CLOUD_STORAGE_CONFIG_KEY','{\r\n	\"type\":1,\r\n	\"qiniuDomain\":\"ra47o69zy.hn-bkt.clouddn.com\",\r\n	\"qiniuAccessKey\":\"aEYHNMICeJadewIeDTH94fh3X5JAh7eupNOBi2ih\",\r\n	\"qiniuSecretKey\":\"2RbaDM82aiq94YmYBa_No_0MTGjSPSrvmk-0T5d7\",\r\n	\"qiniuBucketName\":\"mollie\"\r\n}',1,NULL);

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求参数',
  `time` bigint NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统日志';

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`username`,`operation`,`method`,`params`,`time`,`ip`,`create_date`) values 
(1,'admin','修改用户','mollie.basic.modules.sys.controller.SysUserController.update()','[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@mollie.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"age\":\"1010\",\"sex\":\"男\"}]',143,'0:0:0:0:0:0:0:1','2023-02-27 20:50:09'),
(2,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":67,\"parentId\":0,\"name\":\"个人中心\",\"url\":\"sys/vuser-info\",\"perms\":\"\",\"type\":1,\"icon\":\"geren\",\"orderNum\":2,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2023-03-05 19:18:10'),
(3,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":8,\"username\":\"user1\",\"password\":\"70f246f602f86f746183e445d2fea845ac9e7553542c261ca6572f8b3d0cff14\",\"salt\":\"8Z1QeaAk2QmYxoSh1b1Y\",\"email\":\"user1@163.com\",\"mobile\":\"12345678901\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Mar 6, 2023, 4:41:30 PM\"}]',93,'0:0:0:0:0:0:0:1','2023-03-06 16:41:31'),
(4,'admin','保存角色','mollie.basic.modules.sys.controller.SysRoleController.save()','[{\"roleId\":2,\"roleName\":\"学生\",\"remark\":\"学生端\",\"createUserId\":1,\"menuIdList\":[67,-666666],\"createTime\":\"Mar 6, 2023, 4:42:28 PM\"}]',12,'0:0:0:0:0:0:0:1','2023-03-06 16:42:29'),
(5,'admin','修改用户','mollie.basic.modules.sys.controller.SysUserController.update()','[{\"userId\":8,\"username\":\"user1\",\"salt\":\"8Z1QeaAk2QmYxoSh1b1Y\",\"email\":\"user1@163.com\",\"mobile\":\"12345678901\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1}]',9,'0:0:0:0:0:0:0:1','2023-03-06 16:42:36'),
(6,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":68,\"parentId\":1,\"name\":\"班级管理\",\"url\":\"sys/class\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":4,\"list\":[]}]',9,'0:0:0:0:0:0:0:1','2023-03-06 17:29:30'),
(7,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":68,\"parentId\":1,\"name\":\"班级管理\",\"url\":\"code/sysclass\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":4,\"list\":[]}]',11,'0:0:0:0:0:0:0:1','2023-03-08 17:16:37'),
(8,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":68,\"parentId\":1,\"name\":\"班级管理\",\"url\":\"code/sysclass\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":4,\"list\":[]}]',2,'0:0:0:0:0:0:0:1','2023-03-08 17:17:42'),
(9,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":68,\"parentId\":1,\"name\":\"班级管理\",\"url\":\"classroom\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":4,\"list\":[]}]',12,'0:0:0:0:0:0:0:1','2023-03-08 17:34:10'),
(10,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":68,\"parentId\":1,\"name\":\"班级管理\",\"url\":\"classroom/class\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":4,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2023-03-08 17:35:21'),
(11,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":68,\"parentId\":1,\"name\":\"班级管理\",\"url\":\"classroom/class\",\"perms\":\"classroom:class:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":4,\"list\":[]}]',21,'0:0:0:0:0:0:0:1','2023-03-08 17:42:52'),
(12,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":68,\"parentId\":1,\"name\":\"班级管理\",\"url\":\"classroom/class\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":4,\"list\":[]}]',8,'0:0:0:0:0:0:0:1','2023-03-08 17:44:29'),
(13,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":69,\"parentId\":68,\"name\":\"查看\",\"url\":\"classroom/class\",\"perms\":\"\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2023-03-08 17:45:29'),
(14,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":70,\"parentId\":68,\"name\":\"新增\",\"url\":\"classroom/class\",\"perms\":\"classroom/class\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2023-03-08 17:45:37'),
(15,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":71,\"parentId\":68,\"name\":\"修改\",\"url\":\"classroom/class\",\"perms\":\"classroom/class\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2023-03-08 17:45:46'),
(16,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":72,\"parentId\":68,\"name\":\"删除\",\"url\":\"classroom/class\",\"perms\":\"classroom/class\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2023-03-08 17:45:53'),
(17,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":70,\"parentId\":68,\"name\":\"新增\",\"url\":\"classroom/class\",\"perms\":\"classroom:class:insert\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',11,'0:0:0:0:0:0:0:1','2023-03-08 17:47:29'),
(18,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":70,\"parentId\":68,\"name\":\"新增\",\"url\":\"classroom/class\",\"perms\":\"classroom:class:save;classroom:class:select\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2023-03-08 17:48:03'),
(19,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":73,\"parentId\":68,\"name\":\"test\",\"url\":\"\",\"perms\":\"classroom:class:save;\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',6,'0:0:0:0:0:0:0:1','2023-03-08 17:49:48'),
(20,'admin','删除菜单','mollie.basic.modules.sys.controller.SysMenuController.delete()','[69]',19,'0:0:0:0:0:0:0:1','2023-03-08 17:49:58'),
(21,'admin','删除菜单','mollie.basic.modules.sys.controller.SysMenuController.delete()','[69]',2,'0:0:0:0:0:0:0:1','2023-03-08 17:50:00'),
(22,'admin','删除菜单','mollie.basic.modules.sys.controller.SysMenuController.delete()','[71]',8,'0:0:0:0:0:0:0:1','2023-03-08 17:50:06'),
(23,'admin','删除菜单','mollie.basic.modules.sys.controller.SysMenuController.delete()','[70]',8,'0:0:0:0:0:0:0:1','2023-03-08 17:50:10'),
(24,'admin','删除菜单','mollie.basic.modules.sys.controller.SysMenuController.delete()','[72]',7,'0:0:0:0:0:0:0:1','2023-03-08 17:50:14'),
(25,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":73,\"parentId\":68,\"name\":\"查看\",\"url\":\"\",\"perms\":\"classroom:class:list;classroom:class:info;\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2023-03-08 17:50:59'),
(26,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":73,\"parentId\":68,\"name\":\"查看\",\"url\":\"\",\"perms\":\"classroom:class:list,classroom:class:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',6,'0:0:0:0:0:0:0:1','2023-03-08 17:51:18'),
(27,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":74,\"parentId\":68,\"name\":\"新增\",\"url\":\"\",\"perms\":\"classroom:class:save,classroom:class:select\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',16,'0:0:0:0:0:0:0:1','2023-03-08 17:53:07'),
(28,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":75,\"parentId\":68,\"name\":\"修改\",\"url\":\"\",\"perms\":\"classroom:class:update,classroom:class:select\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2023-03-08 17:53:39'),
(29,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":76,\"parentId\":68,\"name\":\"删除\",\"url\":\"\",\"perms\":\"classroom:class:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2023-03-08 17:53:56'),
(30,'admin','保存角色','mollie.basic.modules.sys.controller.SysRoleController.save()','[{\"roleId\":3,\"roleName\":\"教师\",\"remark\":\"教师\",\"createUserId\":1,\"menuIdList\":[-666666],\"createTime\":\"Mar 8, 2023, 7:16:15 PM\"}]',89,'0:0:0:0:0:0:0:1','2023-03-08 19:16:16'),
(31,'admin','修改用户','mollie.basic.modules.sys.controller.SysUserController.update()','[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@mollie.com\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":1}]',142,'0:0:0:0:0:0:0:1','2023-03-08 21:27:32'),
(32,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":9,\"username\":\"qwe\",\"password\":\"67e322c04d3a7a43c99c6fbba29aa336eb2c4e6f6aa76ea9228f253381e1472d\",\"salt\":\"AeffJq7e5OGD3Qjj7cln\",\"email\":\"qwe@163.com\",\"mobile\":\"12345678910\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Mar 8, 2023, 10:26:38 PM\"}]',25,'0:0:0:0:0:0:0:1','2023-03-08 22:26:38'),
(33,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":10,\"username\":\"123\",\"password\":\"0652191526407f3dc38bb38696e3681e31d346adcc86709e82ce8ac74f1945ea\",\"salt\":\"zrRvYD8Z5yfMRrthpMYg\",\"email\":\"123@163.com\",\"mobile\":\"12312312312\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Mar 8, 2023, 10:33:29 PM\"}]',10,'0:0:0:0:0:0:0:1','2023-03-08 22:33:30'),
(34,'admin','删除用户','mollie.basic.modules.sys.controller.SysUserController.delete()','[[9]]',11,'0:0:0:0:0:0:0:1','2023-03-08 23:55:31'),
(35,'admin','删除用户','mollie.basic.modules.sys.controller.SysUserController.delete()','[[10]]',6,'0:0:0:0:0:0:0:1','2023-03-08 23:55:34'),
(36,'admin','修改用户','mollie.basic.modules.sys.controller.SysUserController.update()','[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@mollie.com\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]',15,'0:0:0:0:0:0:0:1','2023-03-09 00:01:10'),
(37,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":11,\"username\":\"teacher1\",\"password\":\"b25f3e53bb8ae19ebb6bc27372a3d4abf5da665a3c40f248a222052e863ff3a4\",\"salt\":\"6RgpU44UwzqrvIySgJEc\",\"email\":\"teacher1@163.com\",\"mobile\":\"12345678963\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Mar 9, 2023, 12:30:22 AM\"}]',82,'0:0:0:0:0:0:0:1','2023-03-09 00:30:23'),
(38,'admin','修改用户','mollie.basic.modules.sys.controller.SysUserController.update()','[{\"userId\":8,\"username\":\"student1\",\"salt\":\"8Z1QeaAk2QmYxoSh1b1Y\",\"email\":\"student1@163.com\",\"mobile\":\"12345678901\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1}]',16,'0:0:0:0:0:0:0:1','2023-03-09 00:30:42'),
(39,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":12,\"username\":\"teacher2\",\"password\":\"742a55642c95455899bac359adcfc4fe898700bdf829e2fb57f008a722f221b6\",\"salt\":\"EYeQdJEI7JiWLlfhiPQK\",\"email\":\"teacher2@163.com\",\"mobile\":\"12345678912\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Mar 9, 2023, 1:33:19 AM\"}]',125,'0:0:0:0:0:0:0:1','2023-03-09 01:33:19'),
(40,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":77,\"parentId\":0,\"name\":\"在线练习\",\"url\":\"sys-test\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0,\"list\":[]}]',9,'0:0:0:0:0:0:0:1','2023-03-09 15:28:18'),
(41,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":78,\"parentId\":0,\"name\":\"我的考试\",\"url\":\"sys-exam\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',6,'0:0:0:0:0:0:0:1','2023-03-09 15:29:19'),
(42,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":79,\"parentId\":0,\"name\":\"考试测验\",\"url\":\"sys-examtest\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',6,'0:0:0:0:0:0:0:1','2023-03-09 15:31:00'),
(43,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":78,\"parentId\":0,\"name\":\"我的考试\",\"url\":\"sys-exam\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2023-03-09 15:31:22'),
(44,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":79,\"parentId\":0,\"name\":\"考试测验\",\"url\":\"sys-examtest\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0,\"list\":[]}]',5,'0:0:0:0:0:0:0:1','2023-03-09 15:31:29'),
(45,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":13,\"username\":\"teacher3\",\"password\":\"9ea08d07cb008991498afcae7783082256a3bb75e3da5522755e3830e27eb508\",\"salt\":\"42SxEFahbkynpBZCG00P\",\"email\":\"teacher3@163.com\",\"mobile\":\"12345678978\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Mar 10, 2023, 6:23:38 PM\"}]',97,'0:0:0:0:0:0:0:1','2023-03-10 18:23:39'),
(46,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":14,\"username\":\"student2\",\"password\":\"6e42349922093f4fd30b1f868e6ee524e350557bbd8134a0a12985beea38ba2f\",\"salt\":\"kbhenB68TmMfhBi7w46c\",\"email\":\"student2@163.com\",\"mobile\":\"12312345678\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Mar 10, 2023, 7:32:37 PM\"}]',135094,'0:0:0:0:0:0:0:1','2023-03-10 19:32:38'),
(47,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":15,\"username\":\"student3\",\"password\":\"e97de28b7fe572ec3d30f1c7e92ddc5f07dc72128551a01535c8f32a4f4e6209\",\"salt\":\"qPD22FBP7CdNyDNbdu6e\",\"email\":\"student3@163.com\",\"mobile\":\"12312345678\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Mar 10, 2023, 7:34:42 PM\"}]',52133,'0:0:0:0:0:0:0:1','2023-03-10 19:34:42'),
(48,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":16,\"username\":\"student2\",\"password\":\"b3e164252099fdbed87a09eac24e4f156ac666db4c6e7feecf9ded74ad519042\",\"salt\":\"k4yWrx6TvRyqgBeMbX4W\",\"email\":\"student2@163.com\",\"mobile\":\"12345678978\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Mar 10, 2023, 7:37:01 PM\",\"classId\":4}]',96815,'0:0:0:0:0:0:0:1','2023-03-10 19:37:02'),
(49,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":17,\"username\":\"student2\",\"password\":\"38370bd4e6be7ab96150ba1e9b2629c5437e765a3c8e2177833d5dd9b4bb3696\",\"salt\":\"2k00bNUxN8is2pP4enI2\",\"email\":\"student2@163.com\",\"mobile\":\"12345678978\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Mar 10, 2023, 7:50:58 PM\",\"classId\":4}]',78,'0:0:0:0:0:0:0:1','2023-03-10 19:50:59'),
(50,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":18,\"username\":\"teacher4\",\"password\":\"7fd963527f4fffff37bbdcb54e7eb69ea415d89961d3115fa790eb371899058c\",\"salt\":\"32Bxf85UJdihSWWEIQBy\",\"email\":\"teacher4@163.com\",\"mobile\":\"12345678978\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Mar 10, 2023, 9:14:33 PM\",\"classId\":5}]',70,'0:0:0:0:0:0:0:1','2023-03-10 21:14:34'),
(51,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":19,\"username\":\"admin1\",\"password\":\"ec049959a58432814a0a3bcec50c6766d755fc940c6c26893ef44bd6c412c52f\",\"salt\":\"TTBaqgwPQxVnjktOpWrO\",\"email\":\"admin1@163.com\",\"mobile\":\"12345678978\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Mar 10, 2023, 9:19:00 PM\",\"classId\":5}]',76,'0:0:0:0:0:0:0:1','2023-03-10 21:19:00'),
(52,'admin','删除用户','mollie.basic.modules.sys.controller.SysUserController.delete()','[[19]]',0,'0:0:0:0:0:0:0:1','2023-03-10 21:22:51'),
(53,'admin','删除用户','mollie.basic.modules.sys.controller.SysUserController.delete()','[[18]]',4,'0:0:0:0:0:0:0:1','2023-03-10 21:22:56'),
(54,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":20,\"username\":\"teacher4\",\"password\":\"a845e4aade51212506071f6ad0a25313a7605d8103b5264d06232de1e964fbaa\",\"salt\":\"OaOPzWO0vL0eunSPjvBz\",\"email\":\"teacher4@163.com\",\"mobile\":\"12345678978\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Mar 10, 2023, 9:23:18 PM\",\"classId\":4}]',12,'0:0:0:0:0:0:0:1','2023-03-10 21:23:19'),
(55,'admin','修改用户','mollie.basic.modules.sys.controller.SysUserController.update()','[{\"userId\":20,\"username\":\"teacher4\",\"salt\":\"OaOPzWO0vL0eunSPjvBz\",\"email\":\"teacher4@163.com\",\"mobile\":\"12345678978\",\"status\":0,\"roleIdList\":[3],\"createUserId\":1}]',78,'0:0:0:0:0:0:0:1','2023-03-10 22:02:02'),
(56,'admin','修改用户','mollie.basic.modules.sys.controller.SysUserController.update()','[{\"userId\":20,\"username\":\"teacher4\",\"salt\":\"OaOPzWO0vL0eunSPjvBz\",\"email\":\"teacher4@163.com\",\"mobile\":\"12345678978\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1}]',10,'0:0:0:0:0:0:0:1','2023-03-10 22:02:07'),
(57,'admin','修改用户','mollie.basic.modules.sys.controller.SysUserController.update()','[{\"userId\":17,\"username\":\"student2\",\"salt\":\"2k00bNUxN8is2pP4enI2\",\"email\":\"student2@163.com\",\"mobile\":\"12345678978\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"classId\":4}]',10,'0:0:0:0:0:0:0:1','2023-03-10 23:19:09'),
(58,'admin','修改用户','mollie.basic.modules.sys.controller.SysUserController.update()','[{\"userId\":8,\"username\":\"student1\",\"salt\":\"8Z1QeaAk2QmYxoSh1b1Y\",\"email\":\"student1@163.com\",\"mobile\":\"12345678901\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"classId\":4}]',8,'0:0:0:0:0:0:0:1','2023-03-10 23:19:25'),
(59,'admin','修改用户','mollie.basic.modules.sys.controller.SysUserController.update()','[{\"userId\":17,\"username\":\"student2\",\"salt\":\"2k00bNUxN8is2pP4enI2\",\"email\":\"student2@163.com\",\"mobile\":\"12345678978\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"classId\":5}]',74,'0:0:0:0:0:0:0:1','2023-03-11 00:28:17'),
(60,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":80,\"parentId\":0,\"name\":\"题库模型\",\"url\":\"exam/pool\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',10,'0:0:0:0:0:0:0:1','2023-03-11 03:51:52'),
(61,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":80,\"parentId\":0,\"name\":\"题库模型\",\"url\":\"exam/pool\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":1,\"list\":[]}]',13,'0:0:0:0:0:0:0:1','2023-03-11 03:52:18'),
(62,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":80,\"parentId\":0,\"name\":\"题库模型\",\"url\":\"exam/pool\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":1,\"list\":[]}]',6,'0:0:0:0:0:0:0:1','2023-03-11 03:52:34'),
(63,'admin','删除菜单','mollie.basic.modules.sys.controller.SysMenuController.delete()','[79]',15,'0:0:0:0:0:0:0:1','2023-03-11 03:53:16'),
(64,'admin','删除菜单','mollie.basic.modules.sys.controller.SysMenuController.delete()','[78]',9,'0:0:0:0:0:0:0:1','2023-03-11 03:53:21'),
(65,'admin','删除菜单','mollie.basic.modules.sys.controller.SysMenuController.delete()','[77]',7,'0:0:0:0:0:0:0:1','2023-03-11 03:53:25'),
(66,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":80,\"parentId\":0,\"name\":\"题库模型\",\"url\":\"exam/exampool\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":1,\"list\":[]}]',11,'0:0:0:0:0:0:0:1','2023-03-11 07:35:54'),
(67,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":68,\"parentId\":0,\"name\":\"班级管理\",\"url\":\"classroom/class\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":4,\"list\":[]}]',5,'0:0:0:0:0:0:0:1','2023-03-11 07:38:21'),
(68,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":81,\"parentId\":80,\"name\":\"查看\",\"url\":\"\",\"perms\":\"exampool:list,exampool:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',8,'0:0:0:0:0:0:0:1','2023-03-11 07:39:47'),
(69,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":81,\"parentId\":80,\"name\":\"查看\",\"url\":\"\",\"perms\":\"exam:exampool:list,exam:exampool:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',6,'0:0:0:0:0:0:0:1','2023-03-11 07:40:59'),
(70,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":82,\"parentId\":80,\"name\":\"新增\",\"url\":\"\",\"perms\":\"exam:exampool:update,exam:exampool:select\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',8,'0:0:0:0:0:0:0:1','2023-03-11 07:42:23'),
(71,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":82,\"parentId\":80,\"name\":\"新增\",\"url\":\"\",\"perms\":\"exam:exampool:save,exam:exampool:select\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',6,'0:0:0:0:0:0:0:1','2023-03-11 07:42:37'),
(72,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":83,\"parentId\":80,\"name\":\"修改\",\"url\":\"\",\"perms\":\"exam:exampool:update,exam:exampool:select\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2023-03-11 07:43:06'),
(73,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":84,\"parentId\":80,\"name\":\"删除\",\"url\":\"\",\"perms\":\"exam:exampool:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2023-03-11 07:43:30'),
(74,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":85,\"parentId\":0,\"name\":\"在线练习\",\"url\":\"exam/practice\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0,\"list\":[]}]',10,'0:0:0:0:0:0:0:1','2023-03-12 19:30:00'),
(75,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":86,\"parentId\":0,\"name\":\"试卷模型\",\"url\":\"paper/papermodel\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',12,'0:0:0:0:0:0:0:1','2023-03-13 05:01:22'),
(76,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":86,\"parentId\":0,\"name\":\"试卷模型\",\"url\":\"paper/papermodel\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0,\"list\":[]}]',11,'0:0:0:0:0:0:0:1','2023-03-13 05:02:38'),
(77,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":87,\"parentId\":86,\"name\":\"查看\",\"url\":\"\",\"perms\":\"paper:papermodel:list,paper:papermodel:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',8,'0:0:0:0:0:0:0:1','2023-03-13 05:04:10'),
(78,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":88,\"parentId\":86,\"name\":\"新增\",\"url\":\"\",\"perms\":\"paper:papermodel:save,paper:papermodel:select\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',8,'0:0:0:0:0:0:0:1','2023-03-13 05:04:59'),
(79,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":89,\"parentId\":86,\"name\":\"修改\",\"url\":\"\",\"perms\":\"paper:papermodel:update,paper:papermodel:select\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',8,'0:0:0:0:0:0:0:1','2023-03-13 05:05:29'),
(80,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":90,\"parentId\":86,\"name\":\"删除\",\"url\":\"\",\"perms\":\"paper:papermodel:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',8,'0:0:0:0:0:0:0:1','2023-03-13 05:05:48'),
(81,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":86,\"parentId\":0,\"name\":\"试卷模型\",\"url\":\"paper/papermodel\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":1,\"list\":[]}]',12,'0:0:0:0:0:0:0:1','2023-03-13 05:16:22'),
(82,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":91,\"parentId\":0,\"name\":\"考试测验\",\"url\":\"exam/checkout\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',15,'0:0:0:0:0:0:0:1','2023-03-13 15:27:51'),
(83,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":91,\"parentId\":0,\"name\":\"考试测验\",\"url\":\"check/exam\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',13,'0:0:0:0:0:0:0:1','2023-03-13 16:43:47'),
(84,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":91,\"parentId\":0,\"name\":\"考试测验\",\"url\":\"check/examcheckout\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',6,'0:0:0:0:0:0:0:1','2023-03-13 16:45:59'),
(85,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":92,\"parentId\":91,\"name\":\"新增\",\"url\":\"\",\"perms\":\"check:examcheckout:save,check:examcheckout:list\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',8,'0:0:0:0:0:0:0:1','2023-03-13 16:46:49'),
(86,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":92,\"parentId\":91,\"name\":\"新增\",\"url\":\"\",\"perms\":\"check:examcheckout:save,check:examcheckout:select\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2023-03-13 16:47:09'),
(87,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":93,\"parentId\":91,\"name\":\"查看\",\"url\":\"\",\"perms\":\"check:examcheckout:list,check:examcheckout:info\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',8,'0:0:0:0:0:0:0:1','2023-03-13 16:47:40'),
(88,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":94,\"parentId\":91,\"name\":\"修改\",\"url\":\"\",\"perms\":\"check:examcheckout:update,check:examcheckout:select\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',8,'0:0:0:0:0:0:0:1','2023-03-13 16:48:04'),
(89,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":95,\"parentId\":91,\"name\":\"删除\",\"url\":\"\",\"perms\":\"check:examcheckout:delete\",\"type\":2,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2023-03-13 16:48:23'),
(90,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":91,\"parentId\":0,\"name\":\"考试测验\",\"url\":\"check/examcheckout\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0,\"list\":[]}]',6,'0:0:0:0:0:0:0:1','2023-03-13 16:48:53'),
(91,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":22,\"username\":\"teacher5\",\"password\":\"052dff144fcc10fc8dbf370693ab65fd7d99bcfbde9563017314d8d104b0c974\",\"salt\":\"DuRASRKc4tMTYlZJ6AfW\",\"email\":\"teacher4@163.com\",\"mobile\":\"12345678912\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1,\"createTime\":\"Mar 14, 2023 12:13:47 AM\"}]',26,'0:0:0:0:0:0:0:1','2023-03-14 00:13:48'),
(92,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":23,\"username\":\"student3\",\"password\":\"8fed95649db0390ae6873bda631a8e1998332e246cde8cc0eb1580a2f9809462\",\"salt\":\"dubewymkz5yw73XOVNLM\",\"email\":\"student3@163.com\",\"mobile\":\"12345678912\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Mar 14, 2023 12:14:25 AM\",\"classId\":4}]',18,'0:0:0:0:0:0:0:1','2023-03-14 00:14:25'),
(93,'admin','修改用户','mollie.basic.modules.sys.controller.SysUserController.update()','[{\"userId\":23,\"username\":\"student3\",\"salt\":\"dubewymkz5yw73XOVNLM\",\"email\":\"student3@163.com\",\"mobile\":\"12345678912\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"classId\":6}]',26,'0:0:0:0:0:0:0:1','2023-03-14 00:15:46'),
(94,'admin','删除用户','mollie.basic.modules.sys.controller.SysUserController.delete()','[[23]]',16,'0:0:0:0:0:0:0:1','2023-03-14 13:58:10'),
(95,'admin','保存菜单','mollie.basic.modules.sys.controller.SysMenuController.save()','[{\"menuId\":96,\"parentId\":0,\"name\":\"我的考试\",\"url\":\"user/exam\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',41,'0:0:0:0:0:0:0:1','2023-03-14 14:59:57'),
(96,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":96,\"parentId\":0,\"name\":\"我的考试\",\"url\":\"user/exam-info\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]',11,'0:0:0:0:0:0:0:1','2023-03-14 20:31:19'),
(97,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":96,\"parentId\":0,\"name\":\"我的考试\",\"url\":\"user/exam-info\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0,\"list\":[]}]',6,'0:0:0:0:0:0:0:1','2023-03-14 20:31:34'),
(98,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":96,\"parentId\":0,\"name\":\"我的考试\",\"url\":\"exam/user\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0,\"list\":[]}]',5,'0:0:0:0:0:0:0:1','2023-03-14 20:41:41'),
(99,'admin','修改菜单','mollie.basic.modules.sys.controller.SysMenuController.update()','[{\"menuId\":96,\"parentId\":0,\"name\":\"我的考试\",\"url\":\"exam/user-exam\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2023-03-14 20:42:31'),
(100,'admin','修改角色','mollie.basic.modules.sys.controller.SysRoleController.update()','[{\"roleId\":2,\"roleName\":\"学生\",\"remark\":\"学生端\",\"createUserId\":1,\"menuIdList\":[67,93,-666666,91]}]',409,'0:0:0:0:0:0:0:1','2023-03-15 00:33:23'),
(101,'admin','修改角色','mollie.basic.modules.sys.controller.SysRoleController.update()','[{\"roleId\":2,\"roleName\":\"学生\",\"remark\":\"学生端\",\"createUserId\":1,\"menuIdList\":[67,85,93,96,-666666,91]}]',71,'0:0:0:0:0:0:0:1','2023-03-15 02:42:33'),
(102,'admin','修改角色','mollie.basic.modules.sys.controller.SysRoleController.update()','[{\"roleId\":3,\"roleName\":\"教师\",\"remark\":\"教师\",\"createUserId\":1,\"menuIdList\":[66,67,68,73,74,75,76,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,-666666]}]',28,'0:0:0:0:0:0:0:1','2023-03-15 02:45:42'),
(103,'admin','修改角色','mollie.basic.modules.sys.controller.SysRoleController.update()','[{\"roleId\":2,\"roleName\":\"学生\",\"remark\":\"学生端\",\"createUserId\":1,\"menuIdList\":[67,85,93,96,-666666,91]}]',11,'0:0:0:0:0:0:0:1','2023-03-15 02:53:19'),
(104,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":24,\"username\":\"student3\",\"password\":\"db1c7cab242fe8de084892bb3b35289948a7457c40fe9d2563e74d3ce97574c4\",\"salt\":\"TttKhhYWqCenrEKue8Vm\",\"email\":\"student3@16.com\",\"mobile\":\"12345678978\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Mar 16, 2023 9:07:25 PM\",\"classId\":6}]',106,'0:0:0:0:0:0:0:1','2023-03-16 21:07:26'),
(105,'admin','保存用户','mollie.basic.modules.sys.controller.SysUserController.save()','[{\"userId\":25,\"username\":\"student4\",\"password\":\"0dc885f78e37f219b047b253159792fd9d75a5d05b062b311d4f40ed568f5b1c\",\"salt\":\"60Pm9LPjqRNWGSFkVRkD\",\"email\":\"student4@163.com\",\"mobile\":\"12345678978\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Mar 16, 2023 9:24:40 PM\",\"classId\":4}]',14,'0:0:0:0:0:0:0:1','2023-03-16 21:24:41'),
(106,'admin','修改用户','mollie.basic.modules.sys.controller.SysUserController.update()','[{\"userId\":22,\"username\":\"teacher5\",\"salt\":\"DuRASRKc4tMTYlZJ6AfW\",\"email\":\"teacher4@163.com\",\"mobile\":\"12345678912\",\"status\":1,\"roleIdList\":[3],\"createUserId\":1}]',16,'0:0:0:0:0:0:0:1','2023-03-16 21:26:07'),
(107,'admin','修改用户','mollie.basic.modules.sys.controller.SysUserController.update()','[{\"userId\":25,\"username\":\"student4\",\"salt\":\"60Pm9LPjqRNWGSFkVRkD\",\"email\":\"student4@163.com\",\"mobile\":\"12345678978\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"classId\":7}]',15,'0:0:0:0:0:0:0:1','2023-03-16 21:27:03');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单图标',
  `order_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单管理';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`) values 
(1,0,'系统管理',NULL,NULL,0,'system',0),
(2,1,'用户列表','sys/user',NULL,1,'admin',1),
(3,1,'角色管理','sys/role',NULL,1,'role',2),
(4,1,'菜单管理','sys/menu',NULL,1,'menu',3),
(6,1,'定时任务','job/schedule',NULL,1,'job',5),
(7,6,'查看',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0),
(8,6,'新增',NULL,'sys:schedule:save',2,NULL,0),
(9,6,'修改',NULL,'sys:schedule:update',2,NULL,0),
(10,6,'删除',NULL,'sys:schedule:delete',2,NULL,0),
(11,6,'暂停',NULL,'sys:schedule:pause',2,NULL,0),
(12,6,'恢复',NULL,'sys:schedule:resume',2,NULL,0),
(13,6,'立即执行',NULL,'sys:schedule:run',2,NULL,0),
(14,6,'日志列表',NULL,'sys:schedule:log',2,NULL,0),
(15,2,'查看',NULL,'sys:user:list,sys:user:info',2,NULL,0),
(16,2,'新增',NULL,'sys:user:save,sys:role:select',2,NULL,0),
(17,2,'修改',NULL,'sys:user:update,sys:role:select',2,NULL,0),
(18,2,'删除',NULL,'sys:user:delete',2,NULL,0),
(19,3,'查看',NULL,'sys:role:list,sys:role:info',2,NULL,0),
(20,3,'新增',NULL,'sys:role:save,sys:menu:list',2,NULL,0),
(21,3,'修改',NULL,'sys:role:update,sys:menu:list',2,NULL,0),
(22,3,'删除',NULL,'sys:role:delete',2,NULL,0),
(23,4,'查看',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),
(24,4,'新增',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),
(25,4,'修改',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),
(26,4,'删除',NULL,'sys:menu:delete',2,NULL,0),
(27,1,'参数管理','sys/config','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'config',6),
(29,1,'系统日志','sys/log','sys:log:list',1,'log',7),
(66,0,'公告管理','sys/vannouncement',NULL,1,'config',1),
(67,0,'个人中心','sys/vuser-info','',1,'geren',2),
(68,0,'班级管理','classroom/class','',1,'menu',4),
(73,68,'查看','','classroom:class:list,classroom:class:info',2,'',0),
(74,68,'新增','','classroom:class:save,classroom:class:select',2,'',0),
(75,68,'修改','','classroom:class:update,classroom:class:select',2,'',0),
(76,68,'删除','','classroom:class:delete',2,'',0),
(80,0,'题库模型','exam/exampool','',1,'bianji',1),
(81,80,'查看','','exam:exampool:list,exam:exampool:info',2,'',0),
(82,80,'新增','','exam:exampool:save,exam:exampool:select',2,'',0),
(83,80,'修改','','exam:exampool:update,exam:exampool:select',2,'',0),
(84,80,'删除','','exam:exampool:delete',2,'',0),
(85,0,'在线练习','exam/practice','',1,'bianji',0),
(86,0,'试卷模型','paper/papermodel','',1,'bianji',1),
(87,86,'查看','','paper:papermodel:list,paper:papermodel:info',2,'',0),
(88,86,'新增','','paper:papermodel:save,paper:papermodel:select',2,'',0),
(89,86,'修改','','paper:papermodel:update,paper:papermodel:select',2,'',0),
(90,86,'删除','','paper:papermodel:delete',2,'',0),
(91,0,'考试测验','check/examcheckout','',1,'bianji',0),
(92,91,'新增','','check:examcheckout:save,check:examcheckout:select',2,'',0),
(93,91,'查看','','check:examcheckout:list,check:examcheckout:info',2,'',0),
(94,91,'修改','','check:examcheckout:update,check:examcheckout:select',2,'',0),
(95,91,'删除','','check:examcheckout:delete',2,'',0),
(96,0,'我的考试','exam/user-exam','',1,'bianji',0);

/*Table structure for table `sys_oss` */

DROP TABLE IF EXISTS `sys_oss`;

CREATE TABLE `sys_oss` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='文件上传';

/*Data for the table `sys_oss` */

insert  into `sys_oss`(`id`,`url`,`create_date`) values 
(1,'http://localhost:8080/mollie-basic/sys/oss/download/2023/03/bf4e969eca3c42c8971c332a38e11ace.jpeg','2023-03-09 23:02:45'),
(2,'http://localhost:8080/mollie-basic/sys/oss/download/2023/03/309b7fe082b54e259332c976475f1e42.jpeg','2023-03-09 23:04:02'),
(3,'http://localhost:8080/mollie-basic/sys/oss/download/2023/03/b7dd98d01e4b478896aded01c2ae7367.jpeg','2023-03-09 23:06:35');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`remark`,`create_user_id`,`create_time`) values 
(1,'超级管理员','默认角色不可删除',1,'2022-04-15 16:57:30'),
(2,'学生','学生端',1,'2023-03-06 16:42:29'),
(3,'教师','教师',1,'2023-03-08 19:16:16');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色与菜单对应关系';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values 
(14,3,66),
(15,3,67),
(16,3,68),
(17,3,73),
(18,3,74),
(19,3,75),
(20,3,76),
(21,3,80),
(22,3,81),
(23,3,82),
(24,3,83),
(25,3,84),
(26,3,85),
(27,3,86),
(28,3,87),
(29,3,88),
(30,3,89),
(31,3,90),
(32,3,91),
(33,3,92),
(34,3,93),
(35,3,94),
(36,3,95),
(37,3,-666666),
(38,2,67),
(39,2,85),
(40,2,93),
(41,2,96),
(42,2,-666666),
(43,2,91);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `status` tinyint DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `age` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '年纪',
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统用户';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`username`,`password`,`salt`,`email`,`mobile`,`status`,`create_user_id`,`create_time`,`age`,`sex`) values 
(1,'admin','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','root@mollie.com','13612345678',1,1,'2022-04-26 11:11:11','1010','男'),
(8,'student1','70f246f602f86f746183e445d2fea845ac9e7553542c261ca6572f8b3d0cff14','8Z1QeaAk2QmYxoSh1b1Y','student1@163.com','12345678901',1,1,'2023-03-06 16:41:31',NULL,NULL),
(11,'teacher1','b25f3e53bb8ae19ebb6bc27372a3d4abf5da665a3c40f248a222052e863ff3a4','6RgpU44UwzqrvIySgJEc','teacher1@163.com','12345678963',1,1,'2023-03-09 00:30:23',NULL,NULL),
(12,'teacher2','742a55642c95455899bac359adcfc4fe898700bdf829e2fb57f008a722f221b6','EYeQdJEI7JiWLlfhiPQK','teacher2@163.com','12345678912',1,1,'2023-03-09 01:33:19',NULL,NULL),
(13,'teacher3','9ea08d07cb008991498afcae7783082256a3bb75e3da5522755e3830e27eb508','42SxEFahbkynpBZCG00P','teacher3@163.com','12345678978',1,1,'2023-03-10 18:23:39',NULL,NULL),
(17,'student2','38370bd4e6be7ab96150ba1e9b2629c5437e765a3c8e2177833d5dd9b4bb3696','2k00bNUxN8is2pP4enI2','student2@163.com','12345678978',1,1,'2023-03-10 19:50:59',NULL,NULL),
(20,'teacher4','a845e4aade51212506071f6ad0a25313a7605d8103b5264d06232de1e964fbaa','OaOPzWO0vL0eunSPjvBz','teacher4@163.com','12345678978',1,1,'2023-03-10 21:23:19',NULL,NULL),
(22,'teacher5','052dff144fcc10fc8dbf370693ab65fd7d99bcfbde9563017314d8d104b0c974','DuRASRKc4tMTYlZJ6AfW','teacher4@163.com','12345678912',1,1,'2023-03-14 00:13:48',NULL,NULL),
(24,'student3','db1c7cab242fe8de084892bb3b35289948a7457c40fe9d2563e74d3ce97574c4','TttKhhYWqCenrEKue8Vm','student3@16.com','12345678978',1,1,'2023-03-16 21:07:26',NULL,NULL),
(25,'student4','0dc885f78e37f219b047b253159792fd9d75a5d05b062b311d4f40ed568f5b1c','60Pm9LPjqRNWGSFkVRkD','student4@163.com','12345678978',1,1,'2023-03-16 21:24:41',NULL,NULL);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户与角色对应关系';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values 
(2,9,2),
(3,10,2),
(4,1,1),
(5,11,3),
(7,12,3),
(8,13,3),
(9,14,2),
(10,15,2),
(11,16,2),
(13,18,3),
(14,19,1),
(17,20,3),
(19,8,2),
(20,17,2),
(23,23,2),
(24,24,2),
(26,22,3),
(27,25,2);

/*Table structure for table `sys_user_token` */

DROP TABLE IF EXISTS `sys_user_token`;

CREATE TABLE `sys_user_token` (
  `user_id` bigint NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统用户Token';

/*Data for the table `sys_user_token` */

insert  into `sys_user_token`(`user_id`,`token`,`expire_time`,`update_time`) values 
(1,'e36906625c32fff716c2f1b43a383a7f','2023-03-17 09:24:11','2023-03-16 21:24:11'),
(12,'ae061a595e553be2be75d21e956354ae','2023-03-15 12:33:51','2023-03-15 00:33:51'),
(17,'48f72fdaa54f1df63cc4cbdc801a4ef9','2023-03-17 09:04:52','2023-03-16 21:04:52'),
(24,'26cac7dc996e1879e73943225f0b6123','2023-03-17 09:07:46','2023-03-16 21:07:46'),
(25,'b1c6cf4e0fdf269babe71c56b8324a14','2023-03-17 09:30:28','2023-03-16 21:30:28');

/*Table structure for table `user_exam` */

DROP TABLE IF EXISTS `user_exam`;

CREATE TABLE `user_exam` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint DEFAULT NULL COMMENT '用户主键',
  `check_id` bigint DEFAULT NULL COMMENT '试卷主键',
  `exam_id` bigint DEFAULT NULL COMMENT '试题主键',
  `exam_source` text COMMENT '代码',
  `exam_answer` varchar(50) DEFAULT NULL COMMENT '正确答案',
  `user_answer` varchar(50) DEFAULT NULL COMMENT '自己的答案',
  `user_score` int DEFAULT NULL COMMENT '得分',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;

/*Data for the table `user_exam` */

insert  into `user_exam`(`id`,`user_id`,`check_id`,`exam_id`,`exam_source`,`exam_answer`,`user_answer`,`user_score`,`create_time`) values 
(1,17,1,4,'public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println(\"helloworld\");\r\n\r\n    }\r\n}','helloworld','helloworld',1,'2023-03-16 00:33:52'),
(2,17,1,5,'#!/usr/bin/python\r\n# -*- coding: utf8 -*-\r\n\r\n# 在这里写代码\r\nprint(\"Hello, World!\");','helloworld','Hello, World!',0,'2023-03-16 00:33:52'),
(3,17,1,6,'public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println(2+2);\r\n\r\n    }\r\n}','4','4',5,'2023-03-16 00:33:52'),
(4,17,1,7,'public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println(10*10);\r\n\r\n    }\r\n}','100','100',10,'2023-03-16 00:33:52'),
(5,17,1,8,'public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println(20+20);\r\n\r\n    }\r\n}','40','40',3,'2023-03-16 00:33:52'),
(6,17,2,3,'#!/usr/bin/python\r\n# -*- coding: utf8 -*-\r\n\r\n# 在这里写代码\r\nprint(20);','20','20',2,'2023-03-16 03:11:56'),
(7,17,2,4,'public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println(\"helloworld\");\r\n\r\n    }\r\n}','helloworld','helloworld',1,'2023-03-16 03:11:57'),
(8,17,2,5,'#!/usr/bin/python\r\n# -*- coding: utf8 -*-\r\n\r\n# 在这里写代码\r\nprint(\"helloworld\");','helloworld','helloworld',1,'2023-03-16 03:11:57'),
(9,17,2,6,'public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println(4);\r\n\r\n    }\r\n}','4','4',5,'2023-03-16 03:11:57'),
(10,17,2,8,'public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println(40);\r\n\r\n    }\r\n}','40','40',3,'2023-03-16 03:11:58'),
(11,17,3,3,'#!/usr/bin/python\r\n# -*- coding: utf8 -*-\r\n\r\n# 在这里写代码\r\nprint(10+10);','20','20',2,'2023-03-16 21:05:43'),
(12,17,3,4,'public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println(\"helloworld\");\r\n\r\n    }\r\n}','helloworld','helloworld',1,'2023-03-16 21:05:44'),
(13,17,3,5,'#!/usr/bin/python\r\n# -*- coding: utf8 -*-\r\n\r\n# 在这里写代码\r\nprint(\"helloworld\");','helloworld','helloworld',1,'2023-03-16 21:05:44'),
(14,24,3,3,'#!/usr/bin/python\r\n# -*- coding: utf8 -*-\r\n\r\n# 在这里写代码\r\nprint(\"20\");','20','20',2,'2023-03-16 21:08:15'),
(15,24,3,4,'public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println(\"helloworld\");\r\n\r\n    }\r\n}','helloworld','helloworld',1,'2023-03-16 21:08:16'),
(16,24,3,5,'#!/usr/bin/python\r\n# -*- coding: utf8 -*-\r\n\r\n# 在这里写代码\r\nprint(\"Hello, World!\");','helloworld','Hello, World!',0,'2023-03-16 21:08:16'),
(17,25,4,3,'#!/usr/bin/python\r\n# -*- coding: utf8 -*-\r\n\r\n# 在这里写代码\r\nprint(10+10);','20','20',2,'2023-03-16 21:32:11'),
(18,25,4,5,'#!/usr/bin/python\r\n# -*- coding: utf8 -*-\r\n\r\n# 在这里写代码\r\nprint(\"helloworld\");','helloworld','helloworld',1,'2023-03-16 21:32:11'),
(19,25,4,6,'public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println(2+2);\r\n\r\n    }\r\n}','4','4',5,'2023-03-16 21:32:11'),
(20,25,4,8,'public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println(20+20);\r\n\r\n    }\r\n}','40','40',3,'2023-03-16 21:32:11'),
(21,25,4,9,'public class Test {\r\n    public static void main(String[] args) {\r\n        //输出3+4的结果\r\n        System.out.println(3+4);\r\n\r\n    }\r\n}','7','7',2,'2023-03-16 21:32:11'),
(22,25,3,3,'#!/usr/bin/python\r\n# -*- coding: utf8 -*-\r\n\r\n# 在这里写代码\r\nprint(\"asd\");','20','asd',0,'2023-03-16 21:35:55'),
(23,25,3,4,'public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println(\"asd\");\r\n\r\n    }\r\n}','helloworld','asd',0,'2023-03-16 21:35:55'),
(24,25,3,5,'#!/usr/bin/python\r\n# -*- coding: utf8 -*-\r\n\r\n# 在这里写代码\r\nprint(\"Hasdd!\");','helloworld','Hasdd!',0,'2023-03-16 21:35:55'),
(25,25,2,3,'#!/usr/bin/python\r\n# -*- coding: utf8 -*-\r\n\r\n# 在这里写代码\r\nprint(\"Hello, World!\");','20','Hello, World!',0,'2023-03-16 21:37:05'),
(26,25,2,4,'public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println(456);\r\n\r\n    }\r\n}','helloworld','456',0,'2023-03-16 21:37:05'),
(27,25,2,5,'#!/usr/bin/python\r\n# -*- coding: utf8 -*-\r\n\r\n# 在这里写代码\r\nprint(\"hello\");','helloworld','hello',0,'2023-03-16 21:37:05'),
(28,25,2,6,'public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println(4);\r\n\r\n    }\r\n}','4','4',5,'2023-03-16 21:37:05'),
(29,25,2,8,'public class Test {\r\n    public static void main(String[] args) {\r\n\r\n        System.out.println(44);\r\n\r\n    }\r\n}','40','44',0,'2023-03-16 21:37:05');

/*Table structure for table `user_sign` */

DROP TABLE IF EXISTS `user_sign`;

CREATE TABLE `user_sign` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `check_id` bigint DEFAULT NULL COMMENT '试卷id',
  `is_done` tinyint DEFAULT '0' COMMENT '状态：0表示未开始，1表示已开始，2表示已结束',
  `sign_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '签到时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

/*Data for the table `user_sign` */

insert  into `user_sign`(`id`,`user_id`,`check_id`,`is_done`,`sign_time`) values 
(1,17,1,2,'2023-03-15 02:32:29'),
(5,17,2,2,'2023-03-16 01:02:33'),
(6,17,3,2,'2023-03-16 21:04:57'),
(7,24,3,2,'2023-03-16 21:07:49'),
(9,25,4,2,'2023-03-16 21:30:52'),
(10,25,3,2,'2023-03-16 21:35:36'),
(11,25,2,2,'2023-03-16 21:36:35');

/*Table structure for table `v_announcement` */

DROP TABLE IF EXISTS `v_announcement`;

CREATE TABLE `v_announcement` (
  `announcement_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `user_id` int DEFAULT NULL COMMENT '创建人ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人名称',
  `announcement_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '公告标题',
  `announcement_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '内容',
  `announcement_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`announcement_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='公告管理';

/*Data for the table `v_announcement` */

insert  into `v_announcement`(`announcement_id`,`user_id`,`user_name`,`announcement_title`,`announcement_text`,`announcement_time`) values 
(8,1,'admin','公告','公告内容','2023-03-12 21:19:36');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
