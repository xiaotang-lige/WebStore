/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50739
 Source Host           : localhost:3306
 Source Schema         : bookstore

 Target Server Type    : MySQL
 Target Server Version : 50739
 File Encoding         : 65001

 Date: 30/09/2022 11:00:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `title` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `author` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `price` double(11, 2) NOT NULL,
  `sales` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `img_path` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sellerputaway` varchar(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('1', '解忧杂货店', '东野圭吾', 27.20, 104, 100, '/img/default.jpg', '小王');
INSERT INTO `books` VALUES ('10', '平凡的世界', '路遥', 55.00, 101, 100, '/img/default.jpg', '小王');
INSERT INTO `books` VALUES ('11', '悟空传', '今何在', 14.00, 105, 100, '/img/default.jpg', '小王');
INSERT INTO `books` VALUES ('12', '硬派健身', '斌卡', 31.20, 100, 100, '/img/default.jpg', '小王');
INSERT INTO `books` VALUES ('13', '从晚清到民国', '唐德刚', 39.90, 100, 100, '/img/default.jpg', '小王');
INSERT INTO `books` VALUES ('14', '三体', '刘慈欣', 56.50, 100, 100, '/img/default.jpg', '小王');
INSERT INTO `books` VALUES ('15', '看见', '柴静', 19.50, 101, 100, '/img/default.jpg', '小王');
INSERT INTO `books` VALUES ('16', '活着', '余华', 11.00, 104, 100, '/img/default.jpg', '小王');
INSERT INTO `books` VALUES ('17', '小王子', '安托万', 19.20, 100, 100, '/img/default.jpg', '小王');
INSERT INTO `books` VALUES ('18', '我们仨', '杨绛', 11.30, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('19', '生命不息,折腾不止', '罗永浩', 25.20, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('2', '边城', '沈从文', 23.00, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('20', '皮囊', '蔡崇达', 23.90, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('21', '恰到好处的幸福', '毕淑敏', 16.40, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('22', '大数据预测', '埃里克', 37.20, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('23', '人月神话', '布鲁克斯', 55.90, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('24', 'C语言入门经典', '霍尔顿', 45.00, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('25', '数学之美', '吴军', 29.90, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('26', 'Java编程思想', '埃史尔', 70.50, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('27', '设计模式之禅', '秦小波', 20.20, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('28', '图解机器学习', '杉山将', 33.80, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('29', '艾伦图灵传', '安德鲁', 47.20, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('3', '中国哲学史', '冯友兰', 44.50, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('4', '忽然七日', ' 劳伦', 19.33, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('5', '苏东坡传', '林语堂', 19.30, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('6', '百年孤独', '马尔克斯', 29.50, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('7', '扶桑', '严歌苓', 19.80, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('8', '给孩子的诗', '北岛', 22.20, 100, 100, '/img/default.jpg', '1');
INSERT INTO `books` VALUES ('9', '为奴十二年', '所罗门', 16.50, 100, 100, '/img/default.jpg', '1');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `userId` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '0',
  `bookId` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `money` double(255, 2) NULL DEFAULT NULL,
  `amount` double(255, 0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('36b36b973a3e11edbc0a8c1645bedc84', '9', 16.50, 1);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `commodityId` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `createtime` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `delivertime` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `allprice` double(11, 2) NULL DEFAULT NULL,
  `state` int(1) NULL DEFAULT 0,
  `userid` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `seller` varchar(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `client` varchar(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for play
-- ----------------------------
DROP TABLE IF EXISTS `play`;
CREATE TABLE `play`  (
  `id` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `userId` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `orderFormId` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of play
-- ----------------------------
INSERT INTO `play` VALUES ('2c06148ea47ec52cdcc3-3fd5-11ed-8bfc-8c1645bedc84f3f03391077f', '36b36b973a3e11edbc0a8c1645bedc84', 'c8ebd62f7351c52d0811-3fd5-11ed-8bfc-8c1645bedc84a403398c87ef');
INSERT INTO `play` VALUES ('2c06148ea47ec52cdcc3-3fd5-11ed-8bfc-8c1645bedc84f3f03391077f', '36b36b973a3e11edbc0a8c1645bedc84', '17461f78621bc52d4344-3fd5-11ed-8bfc-8c1645bedc8426e41d781265');
INSERT INTO `play` VALUES ('2c06148ea47ec52cdcc3-3fd5-11ed-8bfc-8c1645bedc84f3f03391077f', '36b36b973a3e11edbc0a8c1645bedc84', '07de07ff9324c52de2e7-3fd5-11ed-8bfc-8c1645bedc84f288d4e96a4a');
INSERT INTO `play` VALUES ('2c06148ea47ec52cdcc3-3fd5-11ed-8bfc-8c1645bedc84f3f03391077f', '36b36b973a3e11edbc0a8c1645bedc84', '260be1f64794c52e36e4-3fd5-11ed-8bfc-8c1645bedc841eecb7c14e88');
INSERT INTO `play` VALUES ('178f4a7158b29663c746-3fd9-11ed-8bfc-8c1645bedc8467e75baf747e', '36b36b973a3e11edbc0a8c1645bedc84', 'bb04faa53b239663e182-3fd9-11ed-8bfc-8c1645bedc84a07690ee0e5d');
INSERT INTO `play` VALUES ('178f4a7158b29663c746-3fd9-11ed-8bfc-8c1645bedc8467e75baf747e', '36b36b973a3e11edbc0a8c1645bedc84', '5bfa5964a2aa96642836-3fd9-11ed-8bfc-8c1645bedc8481e088cd64f0');

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller`  (
  `sellerid` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `buyerFormId` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `putawayFormId` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `makeForm` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `name` varchar(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  PRIMARY KEY (`sellerid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES ('919cca303a3c11edbc0a8c1645bedc84', '', '', '', '小王');
INSERT INTO `seller` VALUES ('9d63ce373a3d11edbc0a8c1645bedc84', '', '', '', '小王');

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session`  (
  `sessionId` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of session
-- ----------------------------
INSERT INTO `session` VALUES ('36b36b973a3e11edbc0a8c1645bedc84');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '\0',
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `position` int(1) NOT NULL DEFAULT 0,
  `number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `phone` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `sellerName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('36b36b973a3e11edbc0a8c1645bedc84', '123', '123', '123', 0, 'nil', '13827847211', 'nil');
INSERT INTO `users` VALUES ('919cca303a3c11edbc0a8c1645bedc84', 'shanghu', '123', 'asad@qq.com', 1, '441602177797171777', '17512999580', '大王');
INSERT INTO `users` VALUES ('9d63ce373a3d11edbc0a8c1645bedc84', 'shanghu', '123', '12321121@qq.com', 1, '441602177797171721', '17512999521', '小王');

-- ----------------------------
-- Triggers structure for table users
-- ----------------------------
DROP TRIGGER IF EXISTS `myuuid`;
delimiter ;;
CREATE TRIGGER `myuuid` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
IF new.id IS NULL THEN
SET new.id = REPLACE(UUID(), '-', '');
END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
