/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : bookstore

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 08/02/2023 13:35:30
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
  `sellerputaway` varchar(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT '0',
  `stock` int(0) NOT NULL,
  `img_path` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sales` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('1', '中国之梦', '罗傅立', 28.00, '小王', -1000000, '/depot/img/default.jpg', 104);
INSERT INTO `books` VALUES ('10', '平凡的世界', '路遥', 55.00, '小王', -1000000, '/depot/img/default.jpg', 101);
INSERT INTO `books` VALUES ('11', '悟空传', '今何在', 14.00, '小王', -1000000, '/depot/img/default.jpg', 105);
INSERT INTO `books` VALUES ('12', '硬派健身', '斌卡', 31.20, '小王', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('124158', '给孩子的诗', '北岛', 22.20, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('13', '从晚清到民国', '唐德刚', 39.90, '小王', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('14', '三体', '刘慈欣', 56.50, '小王', -1000000, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('15', '看见', '柴静', 19.50, '小王', -1000000, '/depot/img/default.jpg', 101);
INSERT INTO `books` VALUES ('16', '12312', '3213', 11.00, '小王', 100, '/depot/img/default.jpg', 104);
INSERT INTO `books` VALUES ('17', '小王子', '安托万', 19.20, '小王', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('18', '我们仨', '杨绛', 11.30, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('19', '生命不息,折腾不止', '罗永浩', 25.20, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('2', '边城', '沈从文', 23.00, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('20', '皮囊', '蔡崇达', 23.90, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('21', '恰到好处的幸福', '毕淑敏', 16.40, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('22', '大数据预测', '埃里克', 37.20, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('23', '人月神话', '布鲁克斯', 55.90, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('24', 'C语言入门经典', '霍尔顿', 45.00, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('25', '数学之美', '吴军', 29.90, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('26', 'Java编程思想', '埃史尔', 70.50, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('27', '设计模式之禅', '秦小波', 20.20, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('28', '图解机器学习', '杉山将', 33.80, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('29', '艾伦图灵传', '安德鲁', 47.20, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('3', '中国哲学史', '冯友兰', 44.50, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('4', '忽然七日', ' 劳伦', 19.33, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('5', '苏东坡传', '林语堂', 19.30, '1', 100, '/depot/img/default.jpg', 100);
INSERT INTO `books` VALUES ('6', '百年孤独', '马尔克斯', 29.50, '1', 100, '/depot/img/default.jpg', 100);

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
INSERT INTO `cart` VALUES ('67a8b0ee434011edaf9f8c1645bedc84', '124158', 22.20, 1);
INSERT INTO `cart` VALUES ('67a8b0ee434011edaf9f8c1645bedc84', '21', 16.40, 1);
INSERT INTO `cart` VALUES ('67a8b0ee434011edaf9f8c1645bedc84', '2', 23.00, 1);

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
  `state` int(0) NULL DEFAULT 0,
  `userid` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `seller` varchar(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `client` varchar(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('00edaae9c0cdbdf19d75-548e-11ed-843d-8c1645bedc844850fc58d034', '17', '2022-10-26 01:59:16', '', 19.20, 3, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('05920766d06a8d4d7f55-494c-11ed-b2db-8c1645bedc8464e306525928', '15', '2022-10-11 18:07:45', '', 19.50, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('07ea716e4b6ae8bcc3ed-548d-11ed-843d-8c1645bedc84e06ca6bf4478', '2', '2022-10-26 01:53:19', '', 23.00, 1, '0527e547434011edaf9f8c1645bedc84', '1', 'shanghu');
INSERT INTO `order` VALUES ('08cbf25815fa4acad2d0-494c-11ed-b2db-8c1645bedc842331bc9967d4', '15', '2022-10-11 18:05:53', '', 19.50, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('0e2f0434f583da048dc5-548d-11ed-843d-8c1645bedc846de1372ab72c', '19', '2022-10-26 01:52:54', '', 25.20, 0, '0527e547434011edaf9f8c1645bedc84', '1', 'shanghu');
INSERT INTO `order` VALUES ('102688b986dfe8be045a-548d-11ed-843d-8c1645bedc846ab0b371df79', '21', '2022-10-26 01:53:19', '', 16.40, 0, '0527e547434011edaf9f8c1645bedc84', '1', 'shanghu');
INSERT INTO `order` VALUES ('1c87753051f3f4283873-5443-11ed-ac3f-8c1645bedc84cbc1f9bf4e64', '10', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 55.00, 5, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('1d98ee0c3a2ef425e9aa-5443-11ed-ac3f-8c1645bedc84286e2d812cb5', '15', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 19.50, 2, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('1faafeb8a533b09ab6dc-548e-11ed-843d-8c1645bedc84f6408f525605', '10', '2022-10-26 01:58:54', '', 55.00, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('243d77af4ca5f4297866-5443-11ed-ac3f-8c1645bedc8408cdae6df8ae', '13', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 39.90, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('247518e95ae4f428e6d4-5443-11ed-ac3f-8c1645bedc8425c00ee914e5', '13', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 39.90, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('2c5053b62649e8bf6ae9-548d-11ed-843d-8c1645bedc84a801b83bf5ca', '5', '2022-10-26 01:53:19', '', 19.30, 0, '0527e547434011edaf9f8c1645bedc84', '1', 'shanghu');
INSERT INTO `order` VALUES ('2e920bab3ce0e8bd6fe7-548d-11ed-843d-8c1645bedc846278f83fc441', '18', '2022-10-26 01:53:19', '', 11.30, 0, '0527e547434011edaf9f8c1645bedc84', '1', 'shanghu');
INSERT INTO `order` VALUES ('34a125353ab167d8ee44-494c-11ed-b2db-8c1645bedc846e8b75261744', '15', '2022-10-11 18:06:42', '', 19.50, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('380ab1e162b7411cfd20-4963-11ed-a78f-8c1645bedc846b3aa31de746', '10', '2022-10-11 20:50:16', '', 55.00, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('3f50468c49c3d3e4b737-548d-11ed-843d-8c1645bedc84c2340ad8e4d2', '124158', '2022-10-26 01:52:44', '', 22.20, 1, '0527e547434011edaf9f8c1645bedc84', '1', 'shanghu');
INSERT INTO `order` VALUES ('42510c96924dc744df40-6034-11ed-a1f0-8c1645bedc848429b75917b2', '22', '2022-11-09 21:45:31', '', 37.20, 1, '0527e547434011edaf9f8c1645bedc84', '1', 'shanghu');
INSERT INTO `order` VALUES ('49886dad64c4f42a56c2-5443-11ed-ac3f-8c1645bedc849c02e174464e', '18', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 11.30, 1, '67a8b0ee434011edaf9f8c1645bedc84', '1', 'wewqe');
INSERT INTO `order` VALUES ('4a968bf897fd2841a236-44a5-11ed-8cc7-8c1645bedc84a78583979266', '10', '2022-10-05 19:59:25', '2022-10-05 19:59:28', 55.00, 2, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('4de0ffdbc2e8e8bc7745-548d-11ed-843d-8c1645bedc84a46afaf5ab8f', '2', '2022-10-26 01:53:19', '', 23.00, 0, '0527e547434011edaf9f8c1645bedc84', '1', 'shanghu');
INSERT INTO `order` VALUES ('508ed1b7277ee8ae7e53-4343-11ed-8d23-8c1645bedc8417f189626f4a', '10', '2022-10-04 01:50:46', '2022-10-04 01:50:51', 55.00, 2, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('53e2e18a83a9e8be99d8-548d-11ed-843d-8c1645bedc843061b2e04607', '20', '2022-10-26 01:53:19', '', 23.90, 0, '0527e547434011edaf9f8c1645bedc84', '1', 'shanghu');
INSERT INTO `order` VALUES ('5432f955a422d1130c8b-7233-11ed-aaf2-8c1645bedc84469bd4c33d1c', '12', '2022-12-02 19:23:59', '', 31.20, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('5752fa7a29072841148c-44a5-11ed-8cc7-8c1645bedc845a2dcd6810c6', '10', '2022-10-05 19:59:25', '2022-10-05 19:59:28', 55.00, 2, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('5a666bdf9735e8bd5b89-548d-11ed-843d-8c1645bedc84e4f8b4399f98', '18', '2022-10-26 01:53:19', '', 11.30, 0, '0527e547434011edaf9f8c1645bedc84', '1', 'shanghu');
INSERT INTO `order` VALUES ('5b966684212ae8befe47-548d-11ed-843d-8c1645bedc843e34c3dcb8f7', '124158', '2022-10-26 01:53:19', '', 22.20, 0, '0527e547434011edaf9f8c1645bedc84', '1', 'shanghu');
INSERT INTO `order` VALUES ('5ee83741414827a25548-4965-11ed-a78f-8c1645bedc84b274cb988648', '10', '2022-10-11 21:03:52', '', 55.00, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('6043be85e5c2d6719c87-4976-11ed-91fd-8c1645bedc84f37862652440', '10', '2022-10-11 23:10:27', '', 55.00, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('637e1a77a3c0133c97f5-4987-11ed-aee2-8c1645bedc848dabb5f44f7f', '13', '2022-10-12 01:06:41', '', 39.90, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('63eecdb4da25e8afce21-4343-11ed-8d23-8c1645bedc84033d4e1294c3', '10', '2022-10-04 01:50:46', '2022-10-04 01:50:51', 55.00, 2, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('653408af49c9f427df4d-5443-11ed-ac3f-8c1645bedc84e36f51f0ba4b', '10', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 55.00, 5, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('6b048f42496ee8af738a-4343-11ed-8d23-8c1645bedc84393921e294cd', '10', '2022-10-04 01:50:46', '2022-10-04 01:50:51', 55.00, 2, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('6c937d27015cf4258644-5443-11ed-ac3f-8c1645bedc844e2ad32717f4', '15', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 19.50, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('6cd31e52022a4c65a9c0-494c-11ed-b2db-8c1645bedc845799ecba2e34', '15', '2022-10-11 18:05:56', '', 19.50, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('6e8b123a032b2842e02e-44a5-11ed-8cc7-8c1645bedc84872df42b747f', '22', '2022-10-05 19:59:25', '2022-10-05 19:59:28', 37.20, 1, '67a8b0ee434011edaf9f8c1645bedc84', '1', 'wewqe');
INSERT INTO `order` VALUES ('73b3fb3aa5fa0d67a4c8-6034-11ed-a1f0-8c1645bedc84b9faacf36399', '18', '2022-11-09 21:40:19', '2022-11-09 21:40:28', 11.30, 1, '67a8b0ee434011edaf9f8c1645bedc84', '1', 'wewqe');
INSERT INTO `order` VALUES ('79aa42861e30792a6a0c-4964-11ed-a78f-8c1645bedc84e99c89113520', '124158', '2022-10-11 20:58:59', '', 22.20, 0, '67a8b0ee434011edaf9f8c1645bedc84', '1', 'wewqe');
INSERT INTO `order` VALUES ('7fcb2962a0dc2841eda5-44a5-11ed-8cc7-8c1645bedc842ca6352e4d1d', '10', '2022-10-05 19:59:25', '2022-10-05 19:59:28', 55.00, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('84a054c5013fbace0c4a-548e-11ed-843d-8c1645bedc8417cea960652d', '17', '2022-10-26 01:59:11', '', 19.20, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('850d5e71fadde8b006af-4343-11ed-8d23-8c1645bedc84e855e8aacd4e', '10', '2022-10-04 01:50:46', '2022-10-04 01:50:51', 55.00, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('91087b2013262f7b0a14-494c-11ed-b2db-8c1645bedc848342538220a3', '15', '2022-10-11 18:05:08', '', 19.50, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('9912d301ce84969e6c6e-4964-11ed-a78f-8c1645bedc8432913ba566b2', '12', '2022-10-11 20:59:49', '', 31.20, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('99ff3d2d4d2fbef2bbca-a76d-11ed-971f-8c1645bedc84f9328f16acf0', '12', '2023-02-08 13:02:11', '', 31.20, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('9a677481b271233bca78-44a5-11ed-8cc7-8c1645bedc84377cb627dc7b', '10', '2022-10-05 19:59:16', '', 55.00, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('aa4475a9c0ebe8aeff22-4343-11ed-8d23-8c1645bedc847d409d109b91', '10', '2022-10-04 01:50:46', '2022-10-04 01:50:51', 55.00, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('aed00fc80e68f4286c0e-5443-11ed-ac3f-8c1645bedc84a7eccee9c9dd', '10', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 55.00, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('b44a3c8d5f8a261daf12-4965-11ed-a78f-8c1645bedc84210d5060f228', '10', '2022-10-11 21:03:49', '', 55.00, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('b64750f01ff7d1372ea0-a76d-11ed-971f-8c1645bedc84aeed2f82f9dd', '17', '2023-02-08 13:02:42', '2023-02-08 13:02:45', 19.20, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('b89404bdbc4ae8be6fe3-548d-11ed-843d-8c1645bedc846165902f24bb', '20', '2022-10-26 01:53:19', '', 23.90, 0, '0527e547434011edaf9f8c1645bedc84', '1', 'shanghu');
INSERT INTO `order` VALUES ('ba0d11f4674c28416682-44a5-11ed-8cc7-8c1645bedc84012430210687', '10', '2022-10-05 19:59:25', '2022-10-05 19:59:28', 55.00, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('bfa656aa6338f42a1d9b-5443-11ed-ac3f-8c1645bedc84458d8d4563e6', '18', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 11.30, 1, '67a8b0ee434011edaf9f8c1645bedc84', '1', 'wewqe');
INSERT INTO `order` VALUES ('bfea5af2e284f426ee64-5443-11ed-ac3f-8c1645bedc8430a2336bb462', '15', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 19.50, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('c334e09962cde8aeb3ea-4343-11ed-8d23-8c1645bedc84c8a438a63ad0', '10', '2022-10-04 01:50:46', '2022-10-04 01:50:51', 55.00, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('c43fda0a7e1da78b4952-494c-11ed-b2db-8c1645bedc84dad58e68d39a', '15', '2022-10-11 18:08:29', '', 19.50, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('c6c2c4dca810f4262ff9-5443-11ed-ac3f-8c1645bedc84d626c618a393', '15', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 19.50, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('ce74192292bb4b821c18-4964-11ed-a78f-8c1645bedc840bbab8af7135', '13', '2022-10-11 20:57:43', '', 39.90, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('cf186bdf3dc24dde7d8b-494c-11ed-b2db-8c1645bedc84ef0cc9e429ba', '15', '2022-10-11 18:05:59', '', 19.50, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('d0e29683e8a4d9c77fa3-4967-11ed-a78f-8c1645bedc845e8ee4baa341', '10', '2022-10-11 21:23:10', '', 55.00, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('d2dbb8fb273bd2e72625-7233-11ed-aaf2-8c1645bedc84f00fb8a9bace', '13', '2022-12-02 19:24:02', '2022-12-02 19:24:05', 39.90, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('d318770e85f5f4294b64-5443-11ed-ac3f-8c1645bedc84f8d3f9291076', '13', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 39.90, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('d59d47f9d714cab50051-548a-11ed-ac3f-8c1645bedc84dd4399690abb', '18', '2022-10-26 01:31:00', '', 11.30, 1, '0527e547434011edaf9f8c1645bedc84', '1', 'shanghu');
INSERT INTO `order` VALUES ('d6faf99a1f74f4266683-5443-11ed-ac3f-8c1645bedc84d78190bec070', '15', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 19.50, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('d9b128f6e2c42b83a965-494c-11ed-b2db-8c1645bedc84ea0bd7298e73', '15', '2022-10-11 18:05:01', '', 19.50, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('d9c5ca576eb9aa9949e1-494c-11ed-b2db-8c1645bedc84f4b2b9221514', '15', '2022-10-11 18:08:34', '', 19.50, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('e10e8488c8fef426a96b-5443-11ed-ac3f-8c1645bedc84bc1cf16a871c', '15', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 19.50, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('e1f7fe71b63cd19951f1-4a4a-11ed-b942-8c1645bedc847b725d3318af', '10', '2022-10-13 00:27:52', '', 55.00, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('e22f228eacf1f429a6cc-5443-11ed-ac3f-8c1645bedc8474bd0333fcc7', '13', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 39.90, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('e2792e43cb772f7ac113-494c-11ed-b2db-8c1645bedc84dcd0fa1ea6ae', '15', '2022-10-11 18:05:08', '', 19.50, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('e28909aefd7be8b065c0-4343-11ed-8d23-8c1645bedc845e5e44bb0e6c', '10', '2022-10-04 01:50:46', '2022-10-04 01:50:51', 55.00, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('e32b21d6b88cf42808da-5443-11ed-ac3f-8c1645bedc843f3990a8f7b1', '10', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 55.00, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('e3f944e35eb0f428fa88-5443-11ed-ac3f-8c1645bedc8414bf4cf5e5f1', '13', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 39.90, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('e7253fbe6693f4279fa9-5443-11ed-ac3f-8c1645bedc841e562efdc07c', '10', '2022-10-25 17:03:55', '2022-10-25 17:03:59', 55.00, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('ead4e27139033464fa08-4964-11ed-a78f-8c1645bedc842d984ef34214', '13', '2022-10-11 20:57:04', '', 39.90, 0, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('ebd1b588f322e8b03490-4343-11ed-8d23-8c1645bedc84144a2f1d02f7', '10', '2022-10-04 01:50:46', '2022-10-04 01:50:51', 55.00, 1, '67a8b0ee434011edaf9f8c1645bedc84', '小王', 'wewqe');
INSERT INTO `order` VALUES ('f905a9a14121e8bceb54-548d-11ed-843d-8c1645bedc84d3f6eaf9fd77', '2', '2022-10-26 01:53:19', '', 23.00, 0, '0527e547434011edaf9f8c1645bedc84', '1', 'shanghu');

-- ----------------------------
-- Table structure for play
-- ----------------------------
DROP TABLE IF EXISTS `play`;
CREATE TABLE `play`  (
  `id` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `userId` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `orderFormId` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `allMoney` double(100, 2) NULL DEFAULT NULL,
  `allAmount` double(100, 0) NULL DEFAULT NULL,
  `state` int(0) NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of play
-- ----------------------------
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', 'ce62934b608588c5c506-4343-11ed-8d23-8c1645bedc84eb15cf1d5ddb', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', 'ea9805f49f2788c611a2-4343-11ed-8d23-8c1645bedc84e3015e6189ee', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', '4ee40c45d6d588c66c09-4343-11ed-8d23-8c1645bedc846425fd529422', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', '99f4521dcb8d88c6e27a-4343-11ed-8d23-8c1645bedc84fd48c58c3d08', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', '18fceb36a91d88c71e13-4343-11ed-8d23-8c1645bedc845e3cbb34dbce', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', '5a7cd0c1031e88c7cb34-4343-11ed-8d23-8c1645bedc847a696da75fd7', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', 'd45461fe2f6088c863f2-4343-11ed-8d23-8c1645bedc84ff43e8e3d48e', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', '02cb3a5e94d688c89fae-4343-11ed-8d23-8c1645bedc84a8a6ae9b6825', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', 'a55899169fc688c8eb7c-4343-11ed-8d23-8c1645bedc84afb3fd0aef97', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', '3556a1b3d2c688c92ee8-4343-11ed-8d23-8c1645bedc8464ae6389a531', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', '4961e57181b088c96a07-4343-11ed-8d23-8c1645bedc846c2ee028d993', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', '06822921bdea88c98a89-4343-11ed-8d23-8c1645bedc84f93f6a6d2b9b', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', 'a05159cc11ce88c9c1aa-4343-11ed-8d23-8c1645bedc84b6824c1216d0', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', '7d3f6d60af2f88c9f6d4-4343-11ed-8d23-8c1645bedc84474f819f35dd', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', '5e09a06e6b0c88ca2c23-4343-11ed-8d23-8c1645bedc84ba748dad090e', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', '3026500dbbf488ca63eb-4343-11ed-8d23-8c1645bedc843d20083d8a20', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', '199898a5177288ca9d70-4343-11ed-8d23-8c1645bedc841c17c2fd5bb4', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', '1fe6e8f5fa2888cad90e-4343-11ed-8d23-8c1645bedc84c44098dd0b5e', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', '4d208a6dc45888cb10fd-4343-11ed-8d23-8c1645bedc8438db2e88588e', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', 'd0f88743cabf88cbb282-4343-11ed-8d23-8c1645bedc842224c7aa6754', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', '47dbf7187de288cbf4a1-4343-11ed-8d23-8c1645bedc84efe9a8b73bd3', 661.00, 22, 0);
INSERT INTO `play` VALUES ('0a380cf78f9288bfe842-4343-11ed-8d23-8c1645bedc84f863054c2146', '0527e547434011edaf9f8c1645bedc84', '0e3694ed90f588cc2f0b-4343-11ed-8d23-8c1645bedc8446ac9511a4ae', 661.00, 22, 0);
INSERT INTO `play` VALUES ('7082058aee5be8ae525f-4343-11ed-8d23-8c1645bedc84cd4a2beacbe8', '67a8b0ee434011edaf9f8c1645bedc84', '508ed1b7277ee8ae7e53-4343-11ed-8d23-8c1645bedc8417f189626f4a', 440.00, 8, 0);
INSERT INTO `play` VALUES ('7082058aee5be8ae525f-4343-11ed-8d23-8c1645bedc84cd4a2beacbe8', '67a8b0ee434011edaf9f8c1645bedc84', 'c334e09962cde8aeb3ea-4343-11ed-8d23-8c1645bedc84c8a438a63ad0', 440.00, 8, 0);
INSERT INTO `play` VALUES ('7082058aee5be8ae525f-4343-11ed-8d23-8c1645bedc84cd4a2beacbe8', '67a8b0ee434011edaf9f8c1645bedc84', 'aa4475a9c0ebe8aeff22-4343-11ed-8d23-8c1645bedc847d409d109b91', 440.00, 8, 0);
INSERT INTO `play` VALUES ('7082058aee5be8ae525f-4343-11ed-8d23-8c1645bedc84cd4a2beacbe8', '67a8b0ee434011edaf9f8c1645bedc84', '6b048f42496ee8af738a-4343-11ed-8d23-8c1645bedc84393921e294cd', 440.00, 8, 0);
INSERT INTO `play` VALUES ('7082058aee5be8ae525f-4343-11ed-8d23-8c1645bedc84cd4a2beacbe8', '67a8b0ee434011edaf9f8c1645bedc84', '63eecdb4da25e8afce21-4343-11ed-8d23-8c1645bedc84033d4e1294c3', 440.00, 8, 0);
INSERT INTO `play` VALUES ('7082058aee5be8ae525f-4343-11ed-8d23-8c1645bedc84cd4a2beacbe8', '67a8b0ee434011edaf9f8c1645bedc84', '850d5e71fadde8b006af-4343-11ed-8d23-8c1645bedc84e855e8aacd4e', 440.00, 8, 0);
INSERT INTO `play` VALUES ('7082058aee5be8ae525f-4343-11ed-8d23-8c1645bedc84cd4a2beacbe8', '67a8b0ee434011edaf9f8c1645bedc84', 'ebd1b588f322e8b03490-4343-11ed-8d23-8c1645bedc84144a2f1d02f7', 440.00, 8, 0);
INSERT INTO `play` VALUES ('7082058aee5be8ae525f-4343-11ed-8d23-8c1645bedc84cd4a2beacbe8', '67a8b0ee434011edaf9f8c1645bedc84', 'e28909aefd7be8b065c0-4343-11ed-8d23-8c1645bedc845e5e44bb0e6c', 440.00, 8, 0);
INSERT INTO `play` VALUES ('885e015b27ef2840b543-44a5-11ed-8cc7-8c1645bedc8478e6cc60ec64', '67a8b0ee434011edaf9f8c1645bedc84', '5752fa7a29072841148c-44a5-11ed-8cc7-8c1645bedc845a2dcd6810c6', 257.20, 5, 0);
INSERT INTO `play` VALUES ('885e015b27ef2840b543-44a5-11ed-8cc7-8c1645bedc8478e6cc60ec64', '67a8b0ee434011edaf9f8c1645bedc84', 'ba0d11f4674c28416682-44a5-11ed-8cc7-8c1645bedc84012430210687', 257.20, 5, 0);
INSERT INTO `play` VALUES ('885e015b27ef2840b543-44a5-11ed-8cc7-8c1645bedc8478e6cc60ec64', '67a8b0ee434011edaf9f8c1645bedc84', '4a968bf897fd2841a236-44a5-11ed-8cc7-8c1645bedc84a78583979266', 257.20, 5, 0);
INSERT INTO `play` VALUES ('885e015b27ef2840b543-44a5-11ed-8cc7-8c1645bedc8478e6cc60ec64', '67a8b0ee434011edaf9f8c1645bedc84', '7fcb2962a0dc2841eda5-44a5-11ed-8cc7-8c1645bedc842ca6352e4d1d', 257.20, 5, 0);
INSERT INTO `play` VALUES ('885e015b27ef2840b543-44a5-11ed-8cc7-8c1645bedc8478e6cc60ec64', '67a8b0ee434011edaf9f8c1645bedc84', '6e8b123a032b2842e02e-44a5-11ed-8cc7-8c1645bedc84872df42b747f', 257.20, 5, 0);
INSERT INTO `play` VALUES ('2bc4fb5257252f7aa825-494c-11ed-b2db-8c1645bedc84c368e97ed6c2', '67a8b0ee434011edaf9f8c1645bedc84', 'e2792e43cb772f7ac113-494c-11ed-b2db-8c1645bedc84dcd0fa1ea6ae', 39.00, 2, 0);
INSERT INTO `play` VALUES ('2bc4fb5257252f7aa825-494c-11ed-b2db-8c1645bedc84c368e97ed6c2', '67a8b0ee434011edaf9f8c1645bedc84', '91087b2013262f7b0a14-494c-11ed-b2db-8c1645bedc848342538220a3', 39.00, 2, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', '6c937d27015cf4258644-5443-11ed-ac3f-8c1645bedc844e2ad32717f4', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', '1d98ee0c3a2ef425e9aa-5443-11ed-ac3f-8c1645bedc84286e2d812cb5', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', 'c6c2c4dca810f4262ff9-5443-11ed-ac3f-8c1645bedc84d626c618a393', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', 'd6faf99a1f74f4266683-5443-11ed-ac3f-8c1645bedc84d78190bec070', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', 'e10e8488c8fef426a96b-5443-11ed-ac3f-8c1645bedc84bc1cf16a871c', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', 'bfea5af2e284f426ee64-5443-11ed-ac3f-8c1645bedc8430a2336bb462', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', 'e7253fbe6693f4279fa9-5443-11ed-ac3f-8c1645bedc841e562efdc07c', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', '653408af49c9f427df4d-5443-11ed-ac3f-8c1645bedc84e36f51f0ba4b', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', 'e32b21d6b88cf42808da-5443-11ed-ac3f-8c1645bedc843f3990a8f7b1', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', '1c87753051f3f4283873-5443-11ed-ac3f-8c1645bedc84cbc1f9bf4e64', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', 'aed00fc80e68f4286c0e-5443-11ed-ac3f-8c1645bedc84a7eccee9c9dd', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', '247518e95ae4f428e6d4-5443-11ed-ac3f-8c1645bedc8425c00ee914e5', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', 'e3f944e35eb0f428fa88-5443-11ed-ac3f-8c1645bedc8414bf4cf5e5f1', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', 'd318770e85f5f4294b64-5443-11ed-ac3f-8c1645bedc84f8d3f9291076', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', '243d77af4ca5f4297866-5443-11ed-ac3f-8c1645bedc8408cdae6df8ae', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', 'e22f228eacf1f429a6cc-5443-11ed-ac3f-8c1645bedc8474bd0333fcc7', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', 'bfa656aa6338f42a1d9b-5443-11ed-ac3f-8c1645bedc84458d8d4563e6', 614.10, 18, 0);
INSERT INTO `play` VALUES ('6a3eb82bf37df41f033c-5443-11ed-ac3f-8c1645bedc849a8c7c78dd9c', '67a8b0ee434011edaf9f8c1645bedc84', '49886dad64c4f42a56c2-5443-11ed-ac3f-8c1645bedc849c02e174464e', 614.10, 18, 0);
INSERT INTO `play` VALUES ('c5eb1c6acf20e8bc4e94-548d-11ed-843d-8c1645bedc84ed5be86c414d', '0527e547434011edaf9f8c1645bedc84', '4de0ffdbc2e8e8bc7745-548d-11ed-843d-8c1645bedc84a46afaf5ab8f', 197.30, 10, 0);
INSERT INTO `play` VALUES ('c5eb1c6acf20e8bc4e94-548d-11ed-843d-8c1645bedc84ed5be86c414d', '0527e547434011edaf9f8c1645bedc84', '07ea716e4b6ae8bcc3ed-548d-11ed-843d-8c1645bedc84e06ca6bf4478', 197.30, 10, 0);
INSERT INTO `play` VALUES ('c5eb1c6acf20e8bc4e94-548d-11ed-843d-8c1645bedc84ed5be86c414d', '0527e547434011edaf9f8c1645bedc84', 'f905a9a14121e8bceb54-548d-11ed-843d-8c1645bedc84d3f6eaf9fd77', 197.30, 10, 0);
INSERT INTO `play` VALUES ('c5eb1c6acf20e8bc4e94-548d-11ed-843d-8c1645bedc84ed5be86c414d', '0527e547434011edaf9f8c1645bedc84', '5a666bdf9735e8bd5b89-548d-11ed-843d-8c1645bedc84e4f8b4399f98', 197.30, 10, 0);
INSERT INTO `play` VALUES ('c5eb1c6acf20e8bc4e94-548d-11ed-843d-8c1645bedc84ed5be86c414d', '0527e547434011edaf9f8c1645bedc84', '2e920bab3ce0e8bd6fe7-548d-11ed-843d-8c1645bedc846278f83fc441', 197.30, 10, 0);
INSERT INTO `play` VALUES ('c5eb1c6acf20e8bc4e94-548d-11ed-843d-8c1645bedc84ed5be86c414d', '0527e547434011edaf9f8c1645bedc84', '102688b986dfe8be045a-548d-11ed-843d-8c1645bedc846ab0b371df79', 197.30, 10, 0);
INSERT INTO `play` VALUES ('c5eb1c6acf20e8bc4e94-548d-11ed-843d-8c1645bedc84ed5be86c414d', '0527e547434011edaf9f8c1645bedc84', 'b89404bdbc4ae8be6fe3-548d-11ed-843d-8c1645bedc846165902f24bb', 197.30, 10, 0);
INSERT INTO `play` VALUES ('c5eb1c6acf20e8bc4e94-548d-11ed-843d-8c1645bedc84ed5be86c414d', '0527e547434011edaf9f8c1645bedc84', '53e2e18a83a9e8be99d8-548d-11ed-843d-8c1645bedc843061b2e04607', 197.30, 10, 0);
INSERT INTO `play` VALUES ('c5eb1c6acf20e8bc4e94-548d-11ed-843d-8c1645bedc84ed5be86c414d', '0527e547434011edaf9f8c1645bedc84', '5b966684212ae8befe47-548d-11ed-843d-8c1645bedc843e34c3dcb8f7', 197.30, 10, 0);
INSERT INTO `play` VALUES ('c5eb1c6acf20e8bc4e94-548d-11ed-843d-8c1645bedc84ed5be86c414d', '0527e547434011edaf9f8c1645bedc84', '2c5053b62649e8bf6ae9-548d-11ed-843d-8c1645bedc84a801b83bf5ca', 197.30, 10, 0);
INSERT INTO `play` VALUES ('cc91f65ae6f1bdf1876c-548e-11ed-843d-8c1645bedc84333cda24d750', '67a8b0ee434011edaf9f8c1645bedc84', '00edaae9c0cdbdf19d75-548e-11ed-843d-8c1645bedc844850fc58d034', 19.20, 1, 0);
INSERT INTO `play` VALUES ('eaab7706ab1b0d63db21-6034-11ed-a1f0-8c1645bedc8484b29220566e', '67a8b0ee434011edaf9f8c1645bedc84', '73b3fb3aa5fa0d67a4c8-6034-11ed-a1f0-8c1645bedc84b9faacf36399', 11.30, 1, 0);
INSERT INTO `play` VALUES ('d9c081db6bddd10ed026-7233-11ed-aaf2-8c1645bedc845f31d0bb5a88', '67a8b0ee434011edaf9f8c1645bedc84', '5432f955a422d1130c8b-7233-11ed-aaf2-8c1645bedc84469bd4c33d1c', 31.20, 1, 0);
INSERT INTO `play` VALUES ('8c35376d498bd2e6fb32-7233-11ed-aaf2-8c1645bedc84f73cf48aecfd', '67a8b0ee434011edaf9f8c1645bedc84', 'd2dbb8fb273bd2e72625-7233-11ed-aaf2-8c1645bedc84f00fb8a9bace', 39.90, 1, 0);
INSERT INTO `play` VALUES ('cbcaaec21712d136fe4c-a76d-11ed-971f-8c1645bedc844127e38957d4', '67a8b0ee434011edaf9f8c1645bedc84', 'b64750f01ff7d1372ea0-a76d-11ed-971f-8c1645bedc84aeed2f82f9dd', 19.20, 1, 0);

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
INSERT INTO `seller` VALUES ('0527e547434011edaf9f8c1645bedc84', '', '', '', '小王');
INSERT INTO `seller` VALUES ('32b70e03544211ed9c328c1645bedc84', '', '', '', '系哦啊网');
INSERT INTO `seller` VALUES ('ed3e12cc723311ed89948c1645bedc84', '', '', '', '大王');

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session`  (
  `sessionId` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of session
-- ----------------------------
INSERT INTO `session` VALUES ('67a8b0ee434011edaf9f8c1645bedc84');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '\0',
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `position` int(0) NOT NULL DEFAULT 0,
  `number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `phone` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `sellerName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('0527e547434011edaf9f8c1645bedc84', 'shanghu', '123', 'asad@qq.com', 1, '441602177797171777', '17512999580', '小王');
INSERT INTO `users` VALUES ('32b70e03544211ed9c328c1645bedc84', '', '123312a', '', 1, '', '13035714357', '系哦啊网');
INSERT INTO `users` VALUES ('67a8b0ee434011edaf9f8c1645bedc84', 'wewqe', '123', '123', 0, 'nil', '13827821244', 'nil');
INSERT INTO `users` VALUES ('928844cd543d11ed9c328c1645bedc84', '123', '123321a', '', 0, 'nil', '10086', 'nil');
INSERT INTO `users` VALUES ('ed3e12cc723311ed89948c1645bedc84', '', 'll123ll', '', 1, '', '13035714358', '大王');

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
