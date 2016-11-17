/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : myhome

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2016-11-17 11:12:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `address_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '0', '成都');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_login_name` varchar(255) DEFAULT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `admin_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', 'admin', '123456', null);

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `house_address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `house_owner` int(11) DEFAULT NULL,
  `house_introduce` varchar(255) DEFAULT NULL,
  `is_check` bit(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `house_price` decimal(10,0) DEFAULT NULL,
  `see_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES ('1', '1', '四川省-成都市-双流县', '1', '房间1', '\0', '房子好', '100', '8');
INSERT INTO `house` VALUES ('2', '1', '四川省-达州市-通川区', '1', '房间2', '\0', '房子好', '90', '22');
INSERT INTO `house` VALUES ('3', '3', '四川省-达州市-通川区', '1', '房间3', '\0', '房子好', '300', '6');
INSERT INTO `house` VALUES ('4', '1', '四川省-成都市-双流县', '1', '房间4', '\0', '房子好', '200', '8');
INSERT INTO `house` VALUES ('5', '2', '四川省-达州市-通川区', '1', '房间5', '\0', '房子好', '200', '6');
INSERT INTO `house` VALUES ('6', '2', '四川省-达州市-通川区', '1', '房间6', '\0', '房子好', '900', '3');
INSERT INTO `house` VALUES ('7', '3', '四川省-达州市-通川区', '1', '房间7', '\0', '房子好', '950', '3');
INSERT INTO `house` VALUES ('8', '4', '四川省-达州市-通川区', '1', '房间8', '\0', '房子好', '700', '3');
INSERT INTO `house` VALUES ('9', '5', '四川省-成都市-双流县', '1', '房间9', '\0', '房子好', '960', '7');
INSERT INTO `house` VALUES ('10', '4', '四川省-成都市-双流县', '1', '房间10', '\0', '房子好', '500', '3');
INSERT INTO `house` VALUES ('12', '5', '四川省-成都市-双流县', '1', '房间12', '\0', '房子好', '144', '12');
INSERT INTO `house` VALUES ('13', '2', '四川省-达州市-通川区', '1', '房间13', '\0', '房子好', '960', '3');
INSERT INTO `house` VALUES ('15', '3', '四川省-达州市-通川区', '1', '房间13', '\0', '房子好', '660', '2');
INSERT INTO `house` VALUES ('16', '4', '四川省-达州市-通川区', '1', '房间13', '\0', '房子好', '670', '2');
INSERT INTO `house` VALUES ('18', '6', '四川省-达州市-通川区', '1', '房间13', '\0', '房子好', '680', '3');
INSERT INTO `house` VALUES ('19', '2', '四川省-达州市-通川区', '1', '房间13', '\0', '房子好', '240', '2');
INSERT INTO `house` VALUES ('20', '7', '四川省-达州市-通川区', '1', '房间13', '\0', '房子好', '550', '2');
INSERT INTO `house` VALUES ('21', '1', '四川省-达州市-通川区', '1', '房间13', '\0', '房子好', '800', '2');
INSERT INTO `house` VALUES ('22', '2', '四川省-达州市-通川区', '1', '房间13', '\0', '房子好', '870', '2');
INSERT INTO `house` VALUES ('23', '3', '四川省-达州市-通川区', '1', '房间13', '\0', '房子好', '980', '2');
INSERT INTO `house` VALUES ('24', '4', '四川省-达州市-通川区', '1', '房间13', '\0', '房子好', '460', '2');

-- ----------------------------
-- Table structure for house_agree
-- ----------------------------
DROP TABLE IF EXISTS `house_agree`;
CREATE TABLE `house_agree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_apply_id` int(11) DEFAULT NULL,
  `agree_date` datetime DEFAULT NULL,
  `is_agree` bit(1) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `is_see` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of house_agree
-- ----------------------------
INSERT INTO `house_agree` VALUES ('1', '8', '2016-05-13 21:47:08', '\0', '\0', '\0');
INSERT INTO `house_agree` VALUES ('2', '13', '2016-05-13 21:52:46', '\0', '\0', '\0');
INSERT INTO `house_agree` VALUES ('3', '9', '2016-06-02 16:28:29', '\0', '\0', '\0');
INSERT INTO `house_agree` VALUES ('4', '16', '2016-06-03 10:01:12', '\0', '\0', '\0');

-- ----------------------------
-- Table structure for house_apply
-- ----------------------------
DROP TABLE IF EXISTS `house_apply`;
CREATE TABLE `house_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `apply_date` datetime DEFAULT NULL,
  `is_pass` bit(1) DEFAULT NULL,
  `is_delete` bit(1) DEFAULT NULL,
  `is_see` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of house_apply
-- ----------------------------
INSERT INTO `house_apply` VALUES ('8', '3', '8', '2016-05-10 21:22:17', '', '\0', '\0');
INSERT INTO `house_apply` VALUES ('9', '1', '9', '2016-05-11 21:34:35', '', '\0', '\0');
INSERT INTO `house_apply` VALUES ('10', '1', '9', '2016-05-11 21:35:43', '\0', '\0', '\0');
INSERT INTO `house_apply` VALUES ('11', '1', '12', '2016-05-12 13:02:52', '\0', '\0', '\0');
INSERT INTO `house_apply` VALUES ('12', '1', '12', '2016-05-12 13:05:30', '\0', '\0', '\0');
INSERT INTO `house_apply` VALUES ('13', '6', '12', '2016-05-13 21:51:41', '', '\0', '\0');
INSERT INTO `house_apply` VALUES ('14', '6', '12', '2016-05-13 21:52:07', '\0', '\0', '\0');
INSERT INTO `house_apply` VALUES ('15', '1', '12', '2016-06-03 09:51:02', '\0', '\0', '\0');
INSERT INTO `house_apply` VALUES ('16', '1', '2', '2016-06-03 09:59:46', '', '\0', '\0');

-- ----------------------------
-- Table structure for house_check
-- ----------------------------
DROP TABLE IF EXISTS `house_check`;
CREATE TABLE `house_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `check_date` datetime DEFAULT NULL,
  `leave_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of house_check
-- ----------------------------

-- ----------------------------
-- Table structure for house_img
-- ----------------------------
DROP TABLE IF EXISTS `house_img`;
CREATE TABLE `house_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` int(11) DEFAULT NULL,
  `img_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of house_img
-- ----------------------------
INSERT INTO `house_img` VALUES ('1', '1', '/myhome/images/1.png');
INSERT INTO `house_img` VALUES ('2', '2', '/myhome/images/2.png');
INSERT INTO `house_img` VALUES ('3', '3', '/myhome/images/3.png');
INSERT INTO `house_img` VALUES ('4', '4', '/myhome/images/4.png');
INSERT INTO `house_img` VALUES ('5', '5', '/myhome/images/5.png');
INSERT INTO `house_img` VALUES ('6', '6', '/myhome/images/6.png');
INSERT INTO `house_img` VALUES ('7', '7', '/myhome/images/7.png');
INSERT INTO `house_img` VALUES ('8', '8', '/myhome/images/8.png');
INSERT INTO `house_img` VALUES ('9', '9', '/myhome/images/9.png');
INSERT INTO `house_img` VALUES ('10', '10', '/myhome/images/10.jpg');
INSERT INTO `house_img` VALUES ('11', '11', '/myhome/images/11.png');
INSERT INTO `house_img` VALUES ('12', '12', '/myhome/images/12.jpg');
INSERT INTO `house_img` VALUES ('13', '13', '/myhome/images/13.jpg');
INSERT INTO `house_img` VALUES ('14', '1', '/myhome/images/14.jpg');
INSERT INTO `house_img` VALUES ('15', '2', '/myhome/images/15.jpg');
INSERT INTO `house_img` VALUES ('16', '3', '/myhome/images/16.jpg');
INSERT INTO `house_img` VALUES ('17', '4', '/myhome/images/1.png');
INSERT INTO `house_img` VALUES ('18', '5', '/myhome/images/2.png');
INSERT INTO `house_img` VALUES ('19', '6', '/myhome/images/3.png');
INSERT INTO `house_img` VALUES ('20', '7', '/myhome/images/4.png');
INSERT INTO `house_img` VALUES ('21', '8', '/myhome/images/10.jpg');
INSERT INTO `house_img` VALUES ('22', '9', '/myhome/images/11.png');
INSERT INTO `house_img` VALUES ('23', '10', '/myhome/images/12.jpg');
INSERT INTO `house_img` VALUES ('24', '11', '/myhome/images/13.jpg');
INSERT INTO `house_img` VALUES ('25', '12', '/myhome/images/14.jpg');
INSERT INTO `house_img` VALUES ('26', '13', '/myhome/images/15.jpg');
INSERT INTO `house_img` VALUES ('27', '1', '/myhome/images/16.jpg');
INSERT INTO `house_img` VALUES ('28', '2', '/myhome/images/1.png');
INSERT INTO `house_img` VALUES ('29', '3', '/myhome/images/2.png');
INSERT INTO `house_img` VALUES ('30', '4', '/myhome/images/3.png');
INSERT INTO `house_img` VALUES ('31', '5', '/myhome/images/4.png');
INSERT INTO `house_img` VALUES ('32', '6', '/myhome/images/10.jpg');
INSERT INTO `house_img` VALUES ('33', '7', '/myhome/images/6.png');
INSERT INTO `house_img` VALUES ('34', '8', '/myhome/images/12.jpg');
INSERT INTO `house_img` VALUES ('35', '9', '/myhome/images/5.png');
INSERT INTO `house_img` VALUES ('36', '10', '/myhome/images/14.jpg');
INSERT INTO `house_img` VALUES ('37', '11', '/myhome/images/8.png');
INSERT INTO `house_img` VALUES ('38', '12', '/myhome/images/16.jpg');
INSERT INTO `house_img` VALUES ('39', '13', '/myhome/images/1.png');
INSERT INTO `house_img` VALUES ('40', '1', '/myhome/images/2.png');
INSERT INTO `house_img` VALUES ('41', '2', '/myhome/images/3.png');
INSERT INTO `house_img` VALUES ('42', '3', '/myhome/images/4.png');
INSERT INTO `house_img` VALUES ('43', '4', '/myhome/images/6.png');
INSERT INTO `house_img` VALUES ('44', '5', '/myhome/images/12.jpg');
INSERT INTO `house_img` VALUES ('45', '6', '/myhome/images/5.png');
INSERT INTO `house_img` VALUES ('46', '7', '/myhome/images/14.jpg');
INSERT INTO `house_img` VALUES ('47', '8', '/myhome/images/8.png');
INSERT INTO `house_img` VALUES ('48', '9', '/myhome/images/16.jpg');
INSERT INTO `house_img` VALUES ('49', '10', '/myhome/images/6.png');
INSERT INTO `house_img` VALUES ('50', '11', '/myhome/images/12.jpg');
INSERT INTO `house_img` VALUES ('51', '12', '/myhome/images/5.png');
INSERT INTO `house_img` VALUES ('52', '13', '/myhome/images/5.png');
INSERT INTO `house_img` VALUES ('53', '14', '/myhome/images/12.jpg');
INSERT INTO `house_img` VALUES ('54', '15', '/myhome/images/6.png');
INSERT INTO `house_img` VALUES ('55', '16', '/myhome/images/5.png');
INSERT INTO `house_img` VALUES ('56', '17', '/myhome/images/6.png');
INSERT INTO `house_img` VALUES ('57', '18', '/myhome/images/16.jpg');
INSERT INTO `house_img` VALUES ('58', '19', '/myhome/images/8.png');
INSERT INTO `house_img` VALUES ('59', '20', '/myhome/images/14.jpg');
INSERT INTO `house_img` VALUES ('60', '21', '/myhome/images/5.png');
INSERT INTO `house_img` VALUES ('61', '22', '/myhome/images/6.png');
INSERT INTO `house_img` VALUES ('62', '23', '/myhome/images/16.jpg');
INSERT INTO `house_img` VALUES ('63', '24', '/myhome/images/12.jpg');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '单间');
INSERT INTO `type` VALUES ('2', '一室一厅');
INSERT INTO `type` VALUES ('3', '两室一厅');
INSERT INTO `type` VALUES ('4', '三室一厅两卫');
INSERT INTO `type` VALUES ('6', '别墅');
INSERT INTO `type` VALUES ('7', '四合院');
INSERT INTO `type` VALUES ('8', '教室');
INSERT INTO `type` VALUES ('10', '四合院');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_landlord` bit(1) DEFAULT NULL,
  `user_login_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `user_img` varchar(255) DEFAULT NULL,
  `is_apply_owner` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '', 'aaa', 'mxf', '123456', '156', '/myhome/images/c6c69bf3-3923-4a1f-bab6-07c420f2a3ae4.jpg', '\0');
INSERT INTO `user` VALUES ('2', '', 'bbb', 'mouxf', '1234', '8086', '/myhome/images/5.jpg', '\0');
INSERT INTO `user` VALUES ('3', '', '123', '123456', '123', '123', '/myhome/images/5.jpg', '\0');
INSERT INTO `user` VALUES ('4', '\0', 'yu', 'asd', '123', '123', '/myhome/images/5.jpg', '\0');
INSERT INTO `user` VALUES ('5', '\0', '123456', '123456', '123456', '123456', '/myhome/images/c026d29e-2312-4f04-b7fa-deadf05176c4IMG_20140812_193046.jpg', '\0');
INSERT INTO `user` VALUES ('6', '', '111', '1111', '111', '1111', '/myhome/images/5.jpg', '\0');
