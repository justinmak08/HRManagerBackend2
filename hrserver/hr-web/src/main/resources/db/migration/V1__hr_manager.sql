/*
 Navicat Premium Data Transfer

 Source Server         : 114.116.106.206
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : 114.116.106.206:3306
 Source Schema         : hr_manager

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 31/01/2021 14:04:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adjustsalary
-- ----------------------------
DROP TABLE IF EXISTS `adjustsalary`;
CREATE TABLE `adjustsalary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NULL DEFAULT NULL,
  `asDate` date NULL DEFAULT NULL COMMENT '调薪日期',
  `beforeSalary` int(11) NULL DEFAULT NULL COMMENT '调前薪资',
  `afterSalary` int(11) NULL DEFAULT NULL COMMENT '调后薪资',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调薪原因',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`eid`) USING BTREE,
  CONSTRAINT `adjustsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `personnel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for appraise
-- ----------------------------
DROP TABLE IF EXISTS `appraise`;
CREATE TABLE `appraise`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NULL DEFAULT NULL,
  `appDate` date NULL DEFAULT NULL COMMENT '考评日期',
  `appResult` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考评结果',
  `appContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考评内容',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`eid`) USING BTREE,
  CONSTRAINT `appraise_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `personnel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publish` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pages` int(10) NULL DEFAULT NULL,
  `price` float(10, 2) NULL DEFAULT NULL,
  `bookcaseid` int(10) NULL DEFAULT NULL,
  `abled` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_ieh6qsxp6q7oydadktc9oc8t2`(`bookcaseid`) USING BTREE,
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`bookcaseid`) REFERENCES `bookcase` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '解忧杂货店', '东野圭吾', '电子工业出版社', 102, 27.30, 9, 0);
INSERT INTO `book` VALUES (2, '追风筝的人', '卡勒德·胡赛尼', '上海人民出版社', 230, 33.50, 3, 0);
INSERT INTO `book` VALUES (3, '人间失格', '太宰治', '作家出版社', 150, 17.30, 1, 1);
INSERT INTO `book` VALUES (4, '这就是二十四节气', '高春香', '电子工业出版社', 220, 59.00, 3, 1);
INSERT INTO `book` VALUES (5, '白夜行', '东野圭吾', '南海出版公司', 300, 27.30, 4, 1);
INSERT INTO `book` VALUES (6, '摆渡人', '克莱儿·麦克福尔', '百花洲文艺出版社', 225, 22.80, 1, 1);
INSERT INTO `book` VALUES (7, '暖暖心绘本', '米拦弗特毕', '湖南少儿出版社', 168, 131.60, 5, 1);
INSERT INTO `book` VALUES (8, '天才在左疯子在右', '高铭', '北京联合出版公司', 330, 27.50, 6, 1);
INSERT INTO `book` VALUES (9, '我们仨', '杨绛', '生活.读书.新知三联书店', 89, 17.20, 7, 1);
INSERT INTO `book` VALUES (10, '活着', '余华', '作家出版社', 100, 100.00, 6, 1);
INSERT INTO `book` VALUES (11, '水浒传', '施耐庵', '三联出版社', 300, 50.00, 1, 1);
INSERT INTO `book` VALUES (12, '三国演义', '罗贯中', '三联出版社', 300, 50.00, 2, 1);
INSERT INTO `book` VALUES (13, '红楼梦', '曹雪芹', '三联出版社', 300, 50.00, 5, 1);
INSERT INTO `book` VALUES (14, '西游记', '吴承恩', '三联出版社', 300, 60.00, 3, 1);

-- ----------------------------
-- Table structure for bookcase
-- ----------------------------
DROP TABLE IF EXISTS `bookcase`;
CREATE TABLE `bookcase`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookcase
-- ----------------------------
INSERT INTO `bookcase` VALUES (1, '社会');
INSERT INTO `bookcase` VALUES (2, '情感');
INSERT INTO `bookcase` VALUES (3, '国学');
INSERT INTO `bookcase` VALUES (4, '推理');
INSERT INTO `bookcase` VALUES (5, '绘画');
INSERT INTO `bookcase` VALUES (6, '心理学');
INSERT INTO `bookcase` VALUES (7, '传记');
INSERT INTO `bookcase` VALUES (8, '科技');
INSERT INTO `bookcase` VALUES (9, '计算机');
INSERT INTO `bookcase` VALUES (10, '小说');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `parentId` int(11) NULL DEFAULT NULL,
  `depPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT 1,
  `isParent` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '股东会', -1, '.1', 1, 1);
INSERT INTO `department` VALUES (4, '董事会', 1, '.1.4', 1, 1);
INSERT INTO `department` VALUES (5, '总办', 4, '.1.4.5', 1, 1);
INSERT INTO `department` VALUES (8, '财务部', 5, '.1.4.5.8', 1, 0);
INSERT INTO `department` VALUES (78, '市场部', 5, '.1.4.5.78', 1, 1);
INSERT INTO `department` VALUES (81, '华北市场部', 78, '.1.4.5.78.81', 1, 1);
INSERT INTO `department` VALUES (82, '华南市场部', 78, '.1.4.5.78.82', 1, 0);
INSERT INTO `department` VALUES (85, '石家庄市场部', 81, '.1.4.5.78.81.85', 1, 0);
INSERT INTO `department` VALUES (86, '西北市场部', 78, '.1.4.5.78.86', 1, 1);
INSERT INTO `department` VALUES (87, '西安市场', 86, '.1.4.5.78.86.87', 1, 1);
INSERT INTO `department` VALUES (89, '莲湖区市场', 87, '.1.4.5.78.86.87.89', 1, 0);
INSERT INTO `department` VALUES (91, '技术部', 5, '.1.4.5.91', 1, 0);
INSERT INTO `department` VALUES (92, '运维部', 5, '.1.4.5.92', 1, 1);
INSERT INTO `department` VALUES (93, '运维1部', 92, '.1.4.5.92.93', 1, 0);
INSERT INTO `department` VALUES (94, '运维2部', 92, '.1.4.5.92.94', 1, 0);
INSERT INTO `department` VALUES (96, 'bbb', 1, '.1.96', 1, 1);
INSERT INTO `department` VALUES (104, '111', 96, '.1.96.104', 1, 0);

-- ----------------------------
-- Table structure for personnel
-- ----------------------------
DROP TABLE IF EXISTS `personnel`;
CREATE TABLE `personnel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `gender` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `idCard` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `wedlock` enum('已婚','未婚','离异') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `nationId` int(8) NULL DEFAULT NULL COMMENT '民族',
  `nativePlace` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `politicId` int(8) NULL DEFAULT NULL COMMENT '政治面貌',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `departmentId` int(11) NULL DEFAULT NULL COMMENT '所属部门',
  `jobLevelId` int(11) NULL DEFAULT NULL COMMENT '职称ID',
  `posId` int(11) NULL DEFAULT NULL COMMENT '职位ID',
  `engageForm` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聘用形式',
  `tiptopDegree` enum('博士','硕士','本科','大专','高中','初中','小学','其他') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最高学历',
  `specialty` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属专业',
  `school` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `beginDate` date NULL DEFAULT NULL COMMENT '入职日期',
  `workState` enum('在职','离职') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '在职' COMMENT '在职状态',
  `workID` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `contractTerm` double NULL DEFAULT NULL COMMENT '合同期限',
  `conversionTime` date NULL DEFAULT NULL COMMENT '转正日期',
  `notWorkDate` date NULL DEFAULT NULL COMMENT '离职日期',
  `beginContract` date NULL DEFAULT NULL COMMENT '合同起始日期',
  `endContract` date NULL DEFAULT NULL COMMENT '合同终止日期',
  `workAge` int(11) NULL DEFAULT NULL COMMENT '工龄',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `departmentId`(`departmentId`) USING BTREE,
  INDEX `jobId`(`jobLevelId`) USING BTREE,
  INDEX `dutyId`(`posId`) USING BTREE,
  INDEX `nationId`(`nationId`) USING BTREE,
  INDEX `politicId`(`politicId`) USING BTREE,
  INDEX `workID_key`(`workID`) USING BTREE,
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`jobLevelId`) REFERENCES `joblevel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`posId`) REFERENCES `position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`nationId`) REFERENCES `nation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`politicId`) REFERENCES `politicsstatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1942 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personnel
-- ----------------------------
INSERT INTO `personnel` VALUES (1, '江南一点雨', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', 2, '2018-04-01', NULL, '2018-01-01', '2020-01-01', NULL);
INSERT INTO `personnel` VALUES (2, '陈静', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 91, 12, 29, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (3, '赵琳浩', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (4, '鹿存亮', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (5, '姚森', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (6, '云星', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000006', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (7, '贾旭明', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (8, '张黎明', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008', 7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (9, '薛磊', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000009', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (10, '张洁', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000010', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (11, '江南一点雨2', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 91, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (12, '陈静2', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (13, '赵琳浩2', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (14, '鹿存亮2', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (15, '姚森2', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (16, '云星2', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (17, '贾旭明2', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (18, '王一亭', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018', 7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (19, '薛磊2', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000019', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (20, '张洁2', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000020', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (21, '江南一点雨3', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (22, '陈静3', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (24, '鹿存亮3', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (25, '姚森3', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (26, '云星3', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (27, '贾旭明3', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (28, '张黎明3', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028', 7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (29, '薛磊3', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000029', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (31, '江南一点雨4', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (32, '陈静4', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (33, '赵琳浩4', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (34, '鹿存亮4', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (35, '姚森4', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (36, '云星4', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (37, '贾旭明4', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (38, '张黎明2', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000038', 7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (39, '薛磊4', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000039', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (40, '张洁4', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000040', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (41, '江南一点雨5', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000041', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (42, '陈静5', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000042', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (43, '赵琳浩5', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000043', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (44, '鹿存亮5', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000044', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (45, '姚森5', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000045', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (46, '云星5', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000046', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (47, '贾旭明5', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000047', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (48, '张黎明5', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000048', 7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (49, '薛磊5', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000049', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (50, '张洁5', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000050', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (51, '江南一点雨6', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000051', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (52, '陈静6', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000052', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (53, '赵琳浩6', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000053', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (54, '鹿存亮6', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000054', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (55, '姚森6', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000055', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (56, '云星6', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000056', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1351, '江南一点雨', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1352, '陈静', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1353, '赵琳浩', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1354, '鹿存亮', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1355, '姚森', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1357, '贾旭明', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1358, '张黎明', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1359, '薛磊', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1360, '张洁', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1361, '江南一点雨2', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1362, '陈静2', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1363, '赵琳浩2', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1364, '鹿存亮2', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1365, '姚森2', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1366, '云星2', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1367, '贾旭明2', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1368, '王一亭', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1369, '薛磊2', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1370, '张洁2', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1371, '江南一点雨3', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1372, '陈静3', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1373, '鹿存亮3', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1374, '姚森3', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1375, '云星3', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1376, '贾旭明3', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1377, '张黎明3', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1378, '薛磊3', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1379, '江南一点雨4', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1380, '陈静4', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1381, '赵琳浩4', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1382, '鹿存亮4', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1383, '姚森4', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1384, '云星4', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1385, '贾旭明4', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1411, '谢工', '女', '1970-01-01', '618177197001011234', '离异', 1, '江苏', 1, '584991843@qq.com', '18558887788', '北京', 91, 12, 29, '劳动合同', '本科', '计算机软件', '南华大学', '2018-01-01', '在职', '00000038', 5, '2019-01-01', NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO `personnel` VALUES (1412, '林昭亮', '男', '1990-01-01', '610122199809091234', '已婚', 1, '广东', 13, '584991843@qq.com', '16767776654', '广东深圳', 91, 15, 33, '劳动合同', '大专', '计算机软件', '广东职业技术学院', '2018-01-01', '在职', '00000039', 5, '2018-04-01', NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO `personnel` VALUES (1413, '11', '男', '2018-01-01', '610122201801011234', '已婚', 1, '1', 1, '584991843@qq.com', '111', '1', 89, 9, 29, '劳动合同', '本科', '1', '1', '2018-01-01', '在职', '00000040', 4, '2018-04-01', NULL, '2018-01-01', '2022-01-26', NULL);
INSERT INTO `personnel` VALUES (1414, '1', '男', '2018-01-01', '610188199809091234', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 89, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000041', 1, '2018-01-31', NULL, '2018-01-31', '2019-01-31', NULL);
INSERT INTO `personnel` VALUES (1415, '1', '男', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000042', 1, '2018-01-31', NULL, '2018-01-31', '2019-01-31', NULL);
INSERT INTO `personnel` VALUES (1416, '1', '男', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 81, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000043', 0, '2018-01-31', NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1417, '1', '男', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 87, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000044', 0, '2018-01-01', NULL, '2018-01-01', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1418, '1', '男', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000045', 0, '2018-01-01', NULL, '2018-01-01', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1419, '林伯渠', '男', '2018-01-01', '610122199909099999', '未婚', 1, '1', 1, '584991843@qq.com', '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000046', 0, '2018-01-31', NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1420, '1', '男', '2018-01-01', '610122199909091234', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000047', 0, '2018-01-31', NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1421, '江南一点雨', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', 2, NULL, NULL, '2018-01-01', '2020-01-01', NULL);
INSERT INTO `personnel` VALUES (1422, '陈静', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 8, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1423, '赵琳浩', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1424, '鹿存亮', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1425, '姚森', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1426, '云星', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000006', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1427, '贾旭明', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1428, '张黎明', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1429, '薛磊', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1430, '张洁', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1431, '江南一点雨2', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 91, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1432, '陈静2', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1433, '赵琳浩2', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1434, '鹿存亮2', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1435, '姚森2', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1436, '云星2', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1437, '贾旭明2', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1438, '王一亭', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1439, '薛磊2', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1440, '张洁2', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1441, '江南一点雨3', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1442, '陈静3', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1443, '鹿存亮3', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1444, '姚森3', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1445, '云星3', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1446, '贾旭明3', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1447, '张黎明3', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1448, '薛磊3', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1449, '江南一点雨4', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1450, '陈静4', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1451, '赵琳浩4', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1452, '鹿存亮4', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1453, '姚森4', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1454, '云星4', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1455, '贾旭明4', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1456, '张黎明2', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000038', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1457, '薛磊4', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000039', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1458, '张洁4', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000040', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1459, '江南一点雨5', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000041', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1460, '陈静5', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000042', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1461, '赵琳浩5', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000043', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1462, '鹿存亮5', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000044', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1463, '姚森5', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000045', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1464, '云星5', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000046', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1465, '贾旭明5', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000047', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1466, '张黎明5', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000048', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1467, '薛磊5', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000049', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1468, '张洁5', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000050', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1469, '江南一点雨6', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000051', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1470, '陈静6', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000052', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1471, '赵琳浩6', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000053', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1472, '鹿存亮6', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000054', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1473, '姚森6', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000055', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1474, '云星6', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000056', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1475, '江南一点雨', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1476, '陈静', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1477, '赵琳浩', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1478, '鹿存亮', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1479, '姚森', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1480, '贾旭明', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1481, '张黎明', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1482, '薛磊', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1483, '张洁', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1484, '江南一点雨2', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1485, '陈静2', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1486, '赵琳浩2', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1487, '鹿存亮2', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1488, '姚森2', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1489, '云星2', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1490, '贾旭明2', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1491, '王一亭', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1492, '薛磊2', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1493, '张洁2', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1494, '江南一点雨3', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1495, '陈静3', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1496, '鹿存亮3', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1497, '姚森3', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1498, '云星3', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1499, '贾旭明3', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1500, '张黎明3', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1501, '薛磊3', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1502, '江南一点雨4', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1503, '陈静4', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1504, '赵琳浩4', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1505, '鹿存亮4', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1506, '姚森4', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1507, '云星4', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1508, '贾旭明4', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1509, '谢工', '女', '1970-01-01', '618177197001011234', '离异', 1, '江苏', 1, '584991843@qq.com', '18558887788', '北京', 91, 12, 29, '劳动合同', '本科', '计算机软件', '南华大学', '2018-01-01', '在职', '00000038', 5, NULL, NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO `personnel` VALUES (1510, '林昭亮', '男', '1990-01-01', '610122199809091234', '已婚', 1, '广东', 13, '584991843@qq.com', '16767776654', '广东深圳', 91, 15, 33, '劳动合同', '大专', '计算机软件', '广东职业技术学院', '2018-01-01', '在职', '00000039', 5, NULL, NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO `personnel` VALUES (1511, '11', '男', '2018-01-01', '610122201801011234', '已婚', 1, '1', 1, '584991843@qq.com', '111', '1', 89, 9, 29, '劳动合同', '本科', '1', '1', '2018-01-01', '在职', '00000040', 4, NULL, NULL, '2018-01-01', '2022-01-26', NULL);
INSERT INTO `personnel` VALUES (1512, '1', '男', '2018-01-01', '610188199809091234', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 89, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000041', 1, NULL, NULL, '2018-01-31', '2019-01-31', NULL);
INSERT INTO `personnel` VALUES (1513, '1', '男', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000042', 1, NULL, NULL, '2018-01-31', '2019-01-31', NULL);
INSERT INTO `personnel` VALUES (1514, '1', '男', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 81, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000043', 0, NULL, NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1515, '1', '男', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 87, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000044', 0, NULL, NULL, '2018-01-01', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1516, '1', '男', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000045', 0, NULL, NULL, '2018-01-01', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1517, '林伯渠', '男', '2018-01-01', '610122199909099999', '未婚', 1, '1', 1, '584991843@qq.com', '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000046', 0, NULL, NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1518, '1', '男', '2018-01-01', '610122199909091234', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000047', 0, NULL, NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1519, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职', '00000057', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1520, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 93, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2019-11-05', '在职', '00000058', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1521, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 93, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2019-11-05', '在职', '00000059', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1522, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowan@123.com', '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职', '00000060', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1523, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowan@123.com', '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职', '00000060', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1526, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 91, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职', '00000061', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1527, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 91, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职', '00000062', 6.17, '2018-03-31', NULL, '2017-12-31', '2024-02-29', NULL);
INSERT INTO `personnel` VALUES (1528, 'mtc666', '男', '2019-11-10', '610122199911111111', '已婚', 1, '广东', 13, '123@qq.com', '12345678901', '广东深圳', 78, 9, 29, '劳动合同', '本科', '信管', '深圳大学', '2019-11-10', '在职', '00000063', 3.25, '2020-02-10', NULL, '2019-11-10', '2023-02-22', NULL);
INSERT INTO `personnel` VALUES (1529, 'mtc666', '男', '2019-11-10', '610122199911111111', '已婚', 1, '广东', 13, '123@qq.com', '12345678901', '广东深圳', 78, 9, 29, '劳动合同', '本科', '信管', '深圳大学', '2019-11-10', '在职', '00000063', 3.25, '2020-02-10', NULL, '2019-11-10', '2023-02-22', NULL);
INSERT INTO `personnel` VALUES (1530, '江南一点雨', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', 2, '2018-04-01', NULL, '2018-01-01', '2020-01-01', NULL);
INSERT INTO `personnel` VALUES (1531, '陈静', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 91, 12, 29, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1532, '赵琳浩', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1533, '鹿存亮', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1534, '姚森', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1535, '云星', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000006', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1536, '贾旭明', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1537, '张黎明', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008', 7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1538, '薛磊', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000009', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1539, '张洁', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000010', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1540, '江南一点雨2', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 91, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1541, '陈静2', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1542, '赵琳浩2', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1543, '鹿存亮2', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1544, '姚森2', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1545, '云星2', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1546, '贾旭明2', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1547, '王一亭', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018', 7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1548, '薛磊2', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000019', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1549, '张洁2', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000020', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1550, '江南一点雨3', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1551, '陈静3', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1552, '鹿存亮3', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1553, '姚森3', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1554, '云星3', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1555, '贾旭明3', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1556, '张黎明3', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028', 7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1557, '薛磊3', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000029', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1558, '江南一点雨4', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1559, '陈静4', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1560, '赵琳浩4', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1561, '鹿存亮4', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1562, '姚森4', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1563, '云星4', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1564, '贾旭明4', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1565, '张黎明2', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000038', 7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1566, '薛磊4', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000039', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1567, '张洁4', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000040', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1568, '江南一点雨5', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000041', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1569, '陈静5', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000042', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1570, '赵琳浩5', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000043', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1571, '鹿存亮5', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000044', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1572, '姚森5', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000045', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1573, '云星5', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000046', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1574, '贾旭明5', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000047', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1575, '张黎明5', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000048', 7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1576, '薛磊5', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000049', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1577, '张洁5', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000050', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1578, '江南一点雨6', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000051', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1579, '陈静6', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000052', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1580, '赵琳浩6', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000053', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1581, '鹿存亮6', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000054', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1582, '姚森6', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000055', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1583, '云星6', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000056', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1584, '江南一点雨', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1585, '陈静', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1586, '赵琳浩', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1587, '鹿存亮', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1588, '姚森', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1589, '贾旭明', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1590, '张黎明', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1591, '薛磊', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1592, '张洁', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1593, '江南一点雨2', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1594, '陈静2', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1595, '赵琳浩2', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1596, '鹿存亮2', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1597, '姚森2', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1598, '云星2', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1599, '贾旭明2', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1600, '王一亭', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1601, '薛磊2', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1602, '张洁2', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1603, '江南一点雨3', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1604, '陈静3', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1605, '鹿存亮3', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1606, '姚森3', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1607, '云星3', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1608, '贾旭明3', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1609, '张黎明3', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1610, '薛磊3', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1611, '江南一点雨4', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1612, '陈静4', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1613, '赵琳浩4', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1614, '鹿存亮4', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1615, '姚森4', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1616, '云星4', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1617, '贾旭明4', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1618, '谢工', '女', '1970-01-01', '618177197001011234', '离异', 1, '江苏', 1, '584991843@qq.com', '18558887788', '北京', 91, 12, 29, '劳动合同', '本科', '计算机软件', '南华大学', '2018-01-01', '在职', '00000038', 5, '2019-01-01', NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO `personnel` VALUES (1619, '林昭亮', '男', '1990-01-01', '610122199809091234', '已婚', 1, '广东', 13, '584991843@qq.com', '16767776654', '广东深圳', 91, 15, 33, '劳动合同', '大专', '计算机软件', '广东职业技术学院', '2018-01-01', '在职', '00000039', 5, '2018-04-01', NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO `personnel` VALUES (1620, '11', '男', '2018-01-01', '610122201801011234', '已婚', 1, '1', 1, '584991843@qq.com', '111', '1', 89, 9, 29, '劳动合同', '本科', '1', '1', '2018-01-01', '在职', '00000040', 4, '2018-04-01', NULL, '2018-01-01', '2022-01-26', NULL);
INSERT INTO `personnel` VALUES (1621, '1', '男', '2018-01-01', '610188199809091234', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 89, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000041', 1, '2018-01-31', NULL, '2018-01-31', '2019-01-31', NULL);
INSERT INTO `personnel` VALUES (1622, '1', '男', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000042', 1, '2018-01-31', NULL, '2018-01-31', '2019-01-31', NULL);
INSERT INTO `personnel` VALUES (1623, '1', '男', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 81, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000043', 0, '2018-01-31', NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1624, '1', '男', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 87, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000044', 0, '2018-01-01', NULL, '2018-01-01', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1625, '1', '男', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000045', 0, '2018-01-01', NULL, '2018-01-01', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1626, '林伯渠', '男', '2018-01-01', '610122199909099999', '未婚', 1, '1', 1, '584991843@qq.com', '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000046', 0, '2018-01-31', NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1627, '1', '男', '2018-01-01', '610122199909091234', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000047', 0, '2018-01-31', NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1628, '江南一点雨', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', 2, NULL, NULL, '2018-01-01', '2020-01-01', NULL);
INSERT INTO `personnel` VALUES (1629, '陈静', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 8, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1630, '赵琳浩', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1631, '鹿存亮', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1632, '姚森', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1633, '云星', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000006', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1634, '贾旭明', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1635, '张黎明', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1636, '薛磊', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1637, '张洁', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1638, '江南一点雨2', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 91, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1639, '陈静2', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1640, '赵琳浩2', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1641, '鹿存亮2', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1642, '姚森2', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1643, '云星2', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1644, '贾旭明2', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1645, '王一亭', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1646, '薛磊2', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1647, '张洁2', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1648, '江南一点雨3', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1649, '陈静3', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1650, '鹿存亮3', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1651, '姚森3', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1652, '云星3', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1653, '贾旭明3', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1654, '张黎明3', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1655, '薛磊3', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1656, '江南一点雨4', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1657, '陈静4', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1658, '赵琳浩4', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1659, '鹿存亮4', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1660, '姚森4', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1661, '云星4', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1662, '贾旭明4', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1663, '张黎明2', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000038', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1664, '薛磊4', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000039', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1665, '张洁4', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000040', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1666, '江南一点雨5', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000041', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1667, '陈静5', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000042', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1668, '赵琳浩5', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000043', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1669, '鹿存亮5', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000044', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1670, '姚森5', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000045', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1671, '云星5', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000046', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1672, '贾旭明5', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000047', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1673, '张黎明5', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000048', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1674, '薛磊5', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000049', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1675, '张洁5', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000050', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1676, '江南一点雨6', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000051', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1677, '陈静6', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000052', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1678, '赵琳浩6', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000053', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1679, '鹿存亮6', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000054', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1680, '姚森6', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000055', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1681, '云星6', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000056', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1682, '江南一点雨', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1683, '陈静', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1684, '赵琳浩', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1685, '鹿存亮', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1686, '姚森', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1687, '贾旭明', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1688, '张黎明', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1689, '薛磊', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1690, '张洁', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1691, '江南一点雨2', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1692, '陈静2', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1693, '赵琳浩2', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1694, '鹿存亮2', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1695, '姚森2', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1696, '云星2', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1697, '贾旭明2', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1698, '王一亭', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1699, '薛磊2', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1700, '张洁2', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1701, '江南一点雨3', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1702, '陈静3', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1703, '鹿存亮3', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1704, '姚森3', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1705, '云星3', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1706, '贾旭明3', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1707, '张黎明3', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1708, '薛磊3', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1709, '江南一点雨4', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1710, '陈静4', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1711, '赵琳浩4', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1712, '鹿存亮4', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1713, '姚森4', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1714, '云星4', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1715, '贾旭明4', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1716, '谢工', '女', '1970-01-01', '618177197001011234', '离异', 1, '江苏', 1, '584991843@qq.com', '18558887788', '北京', 91, 12, 29, '劳动合同', '本科', '计算机软件', '南华大学', '2018-01-01', '在职', '00000038', 5, NULL, NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO `personnel` VALUES (1717, '林昭亮', '男', '1990-01-01', '610122199809091234', '已婚', 1, '广东', 13, '584991843@qq.com', '16767776654', '广东深圳', 91, 15, 33, '劳动合同', '大专', '计算机软件', '广东职业技术学院', '2018-01-01', '在职', '00000039', 5, NULL, NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO `personnel` VALUES (1718, '11', '男', '2018-01-01', '610122201801011234', '已婚', 1, '1', 1, '584991843@qq.com', '111', '1', 89, 9, 29, '劳动合同', '本科', '1', '1', '2018-01-01', '在职', '00000040', 4, NULL, NULL, '2018-01-01', '2022-01-26', NULL);
INSERT INTO `personnel` VALUES (1719, '1', '男', '2018-01-01', '610188199809091234', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 89, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000041', 1, NULL, NULL, '2018-01-31', '2019-01-31', NULL);
INSERT INTO `personnel` VALUES (1720, '1', '男', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000042', 1, NULL, NULL, '2018-01-31', '2019-01-31', NULL);
INSERT INTO `personnel` VALUES (1721, '1', '男', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 81, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000043', 0, NULL, NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1722, '1', '男', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 87, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000044', 0, NULL, NULL, '2018-01-01', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1723, '1', '男', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000045', 0, NULL, NULL, '2018-01-01', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1724, '林伯渠', '男', '2018-01-01', '610122199909099999', '未婚', 1, '1', 1, '584991843@qq.com', '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000046', 0, NULL, NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1725, '1', '男', '2018-01-01', '610122199909091234', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000047', 0, NULL, NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1726, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职', '00000057', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1727, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 93, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2019-11-05', '在职', '00000058', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1728, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 93, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2019-11-05', '在职', '00000059', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1729, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowan@123.com', '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职', '00000060', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1730, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowan@123.com', '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职', '00000060', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1731, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 91, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职', '00000061', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1732, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 91, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职', '00000062', 6.17, '2018-03-31', NULL, '2017-12-31', '2024-02-29', NULL);
INSERT INTO `personnel` VALUES (1733, 'mtc666', '男', '2019-11-10', '610122199911111111', '已婚', 1, '广东', 13, '123@qq.com', '12345678901', '广东深圳', 78, 9, 29, '劳动合同', '本科', '信管', '深圳大学', '2019-11-10', '在职', '00000063', 3.25, '2020-02-10', NULL, '2019-11-10', '2023-02-22', NULL);
INSERT INTO `personnel` VALUES (1734, 'mtc666', '男', '2019-11-10', '610122199911111111', '已婚', 1, '广东', 13, '123@qq.com', '12345678901', '广东深圳', 78, 9, 29, '劳动合同', '本科', '信管', '深圳大学', '2019-11-10', '在职', '00000063', 3.25, '2020-02-10', NULL, '2019-11-10', '2023-02-22', NULL);
INSERT INTO `personnel` VALUES (1735, '江南一点雨', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', 2, '2018-04-01', NULL, '2018-01-01', '2020-01-01', NULL);
INSERT INTO `personnel` VALUES (1736, '陈静', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 91, 12, 29, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1737, '赵琳浩', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1738, '鹿存亮', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1739, '姚森', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1740, '云星', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000006', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1741, '贾旭明', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1742, '张黎明', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008', 7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1743, '薛磊', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000009', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1744, '张洁', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000010', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1745, '江南一点雨2', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 91, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1746, '陈静2', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1747, '赵琳浩2', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1748, '鹿存亮2', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1749, '姚森2', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1750, '云星2', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1751, '贾旭明2', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1752, '王一亭', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018', 7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1753, '薛磊2', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000019', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1754, '张洁2', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000020', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1755, '江南一点雨3', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1756, '陈静3', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1757, '鹿存亮3', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1758, '姚森3', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1759, '云星3', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1760, '贾旭明3', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1761, '张黎明3', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028', 7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1762, '薛磊3', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000029', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1763, '江南一点雨4', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1764, '陈静4', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1765, '赵琳浩4', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1766, '鹿存亮4', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1767, '姚森4', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1768, '云星4', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1769, '贾旭明4', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1770, '张黎明2', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000038', 7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1771, '薛磊4', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000039', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1772, '张洁4', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000040', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1773, '江南一点雨5', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000041', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1774, '陈静5', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000042', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1775, '赵琳浩5', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000043', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1776, '鹿存亮5', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000044', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1777, '姚森5', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000045', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1778, '云星5', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000046', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1779, '贾旭明5', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000047', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1780, '张黎明5', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000048', 7, '2018-04-01', NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1781, '薛磊5', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000049', 6, '2018-04-01', NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1782, '张洁5', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000050', 1, '2018-01-31', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1783, '江南一点雨6', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000051', 1, '2018-04-01', NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1784, '陈静6', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000052', 3, '2015-09-10', NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1785, '赵琳浩6', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000053', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1786, '鹿存亮6', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000054', 3.5, '2018-04-01', NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1787, '姚森6', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000055', 7, '2017-04-02', NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1788, '云星6', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000056', 5.25, '2018-04-01', NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1789, '江南一点雨', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1790, '陈静', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1791, '赵琳浩', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1792, '鹿存亮', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1793, '姚森', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1794, '贾旭明', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1795, '张黎明', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1796, '薛磊', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1797, '张洁', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1798, '江南一点雨2', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1799, '陈静2', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1800, '赵琳浩2', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1801, '鹿存亮2', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1802, '姚森2', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1803, '云星2', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1804, '贾旭明2', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1805, '王一亭', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1806, '薛磊2', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1807, '张洁2', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1808, '江南一点雨3', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1809, '陈静3', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1810, '鹿存亮3', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1811, '姚森3', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1812, '云星3', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1813, '贾旭明3', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1814, '张黎明3', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1815, '薛磊3', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1816, '江南一点雨4', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1817, '陈静4', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1818, '赵琳浩4', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1819, '鹿存亮4', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1820, '姚森4', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1821, '云星4', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1822, '贾旭明4', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1823, '谢工', '女', '1970-01-01', '618177197001011234', '离异', 1, '江苏', 1, '584991843@qq.com', '18558887788', '北京', 91, 12, 29, '劳动合同', '本科', '计算机软件', '南华大学', '2018-01-01', '在职', '00000038', 5, '2019-01-01', NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO `personnel` VALUES (1824, '林昭亮', '男', '1990-01-01', '610122199809091234', '已婚', 1, '广东', 13, '584991843@qq.com', '16767776654', '广东深圳', 91, 15, 33, '劳动合同', '大专', '计算机软件', '广东职业技术学院', '2018-01-01', '在职', '00000039', 5, '2018-04-01', NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO `personnel` VALUES (1825, '11', '男', '2018-01-01', '610122201801011234', '已婚', 1, '1', 1, '584991843@qq.com', '111', '1', 89, 9, 29, '劳动合同', '本科', '1', '1', '2018-01-01', '在职', '00000040', 4, '2018-04-01', NULL, '2018-01-01', '2022-01-26', NULL);
INSERT INTO `personnel` VALUES (1826, '1', '男', '2018-01-01', '610188199809091234', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 89, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000041', 1, '2018-01-31', NULL, '2018-01-31', '2019-01-31', NULL);
INSERT INTO `personnel` VALUES (1827, '1', '男', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000042', 1, '2018-01-31', NULL, '2018-01-31', '2019-01-31', NULL);
INSERT INTO `personnel` VALUES (1828, '1', '男', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 81, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000043', 0, '2018-01-31', NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1829, '1', '男', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 87, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000044', 0, '2018-01-01', NULL, '2018-01-01', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1830, '1', '男', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000045', 0, '2018-01-01', NULL, '2018-01-01', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1831, '林伯渠', '男', '2018-01-01', '610122199909099999', '未婚', 1, '1', 1, '584991843@qq.com', '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000046', 0, '2018-01-31', NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1832, '1', '男', '2018-01-01', '610122199909091234', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000047', 0, '2018-01-31', NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1833, '江南一点雨', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', 2, NULL, NULL, '2018-01-01', '2020-01-01', NULL);
INSERT INTO `personnel` VALUES (1834, '陈静', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 8, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1835, '赵琳浩', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1836, '鹿存亮', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1837, '姚森', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1838, '云星', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000006', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1839, '贾旭明', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1840, '张黎明', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1841, '薛磊', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1842, '张洁', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1843, '江南一点雨2', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 91, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1844, '陈静2', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1845, '赵琳浩2', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1846, '鹿存亮2', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1847, '姚森2', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1848, '云星2', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1849, '贾旭明2', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1850, '王一亭', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1851, '薛磊2', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1852, '张洁2', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1853, '江南一点雨3', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1854, '陈静3', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1855, '鹿存亮3', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1856, '姚森3', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1857, '云星3', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1858, '贾旭明3', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1859, '张黎明3', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1860, '薛磊3', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1861, '江南一点雨4', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1862, '陈静4', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1863, '赵琳浩4', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1864, '鹿存亮4', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1865, '姚森4', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1866, '云星4', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1867, '贾旭明4', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1868, '张黎明2', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000038', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1869, '薛磊4', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000039', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1870, '张洁4', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000040', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1871, '江南一点雨5', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000041', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1872, '陈静5', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000042', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1873, '赵琳浩5', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000043', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1874, '鹿存亮5', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000044', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1875, '姚森5', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000045', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1876, '云星5', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000046', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1877, '贾旭明5', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000047', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1878, '张黎明5', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000048', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1879, '薛磊5', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000049', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1880, '张洁5', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000050', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1881, '江南一点雨6', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000051', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1882, '陈静6', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000052', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1883, '赵琳浩6', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000053', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1884, '鹿存亮6', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000054', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1885, '姚森6', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000055', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1886, '云星6', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000056', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1887, '江南一点雨', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1888, '陈静', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1889, '赵琳浩', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1890, '鹿存亮', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1891, '姚森', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1892, '贾旭明', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1893, '张黎明', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000008', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1894, '薛磊', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000009', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1895, '张洁', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000010', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1896, '江南一点雨2', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1897, '陈静2', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1898, '赵琳浩2', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1899, '鹿存亮2', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1900, '姚森2', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1901, '云星2', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1902, '贾旭明2', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1903, '王一亭', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000018', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1904, '薛磊2', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000019', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1905, '张洁2', '女', '1990-10-09', '420177199010093652', '未婚', 1, '海南', 5, 'zhangjie@qq.com', '13695557742', '海口市美兰区', 92, 16, 34, '劳动合同', '高中', '无', '海南侨中', '2018-01-01', '在职', '00000020', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1906, '江南一点雨3', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1907, '陈静3', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1908, '鹿存亮3', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1909, '姚森3', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1910, '云星3', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1911, '贾旭明3', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1912, '张黎明3', '男', '1991-02-01', '610144199102014569', '已婚', 1, '广东', 6, 'zhangliming@qq.com', '18979994478', '广东珠海', 91, 15, 33, '劳动合同', '高中', '考古', '清华大学', '2018-01-01', '在职', '00000028', 7, NULL, NULL, '2018-01-01', '2025-01-30', NULL);
INSERT INTO `personnel` VALUES (1913, '薛磊3', '男', '1992-07-01', '610144199207017895', '已婚', 1, '陕西西安', 13, 'xuelei@qq.com', '15648887741', '西安市雁塔区', 92, 14, 34, '劳动合同', '初中', '无', '华胥中学', '2018-01-01', '在职', '00000029', 6, NULL, NULL, '2018-01-01', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1914, '江南一点雨4', '男', '1990-01-01', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 8, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', 1, NULL, NULL, '2018-01-01', '2019-01-01', NULL);
INSERT INTO `personnel` VALUES (1915, '陈静4', '女', '1989-02-01', '421288198902011234', '已婚', 1, '海南', 1, 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', 82, 12, 30, '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', 3, NULL, NULL, '2015-06-09', '2018-06-08', NULL);
INSERT INTO `personnel` VALUES (1916, '赵琳浩4', '男', '1993-03-04', '610122199303041456', '未婚', 1, '陕西', 3, 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', 91, 12, 33, '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1917, '鹿存亮4', '男', '1990-01-03', '610122199001031456', '已婚', 1, '陕西', 3, 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', 92, 12, 34, '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', 3.5, NULL, NULL, '2018-01-01', '2021-07-14', NULL);
INSERT INTO `personnel` VALUES (1918, '姚森4', '男', '1991-02-05', '610122199102058952', '已婚', 1, '河南', 3, 'yaosen@qq.com', '14785559936', '河南洛阳人民大道58号', 92, 15, 34, '劳动合同', '初中', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', 7, NULL, NULL, '2017-01-02', '2024-01-17', NULL);
INSERT INTO `personnel` VALUES (1919, '云星4', '女', '1993-01-05', '610122199301054789', '已婚', 1, '陕西西安', 1, 'yunxing@qq.com', '15644442252', '陕西西安新城区', 92, 16, 34, '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1920, '贾旭明4', '男', '1993-11-11', '610122199311111234', '已婚', 1, '广东广州', 4, 'jiaxuming@qq.com', '15644441234', '广东省广州市天河区冼村路', 78, 15, 33, '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', 5.25, NULL, NULL, '2018-01-01', '2023-04-13', NULL);
INSERT INTO `personnel` VALUES (1921, '谢工', '女', '1970-01-01', '618177197001011234', '离异', 1, '江苏', 1, '584991843@qq.com', '18558887788', '北京', 91, 12, 29, '劳动合同', '本科', '计算机软件', '南华大学', '2018-01-01', '在职', '00000038', 5, NULL, NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO `personnel` VALUES (1922, '林昭亮', '男', '1990-01-01', '610122199809091234', '已婚', 1, '广东', 13, '584991843@qq.com', '16767776654', '广东深圳', 91, 15, 33, '劳动合同', '大专', '计算机软件', '广东职业技术学院', '2018-01-01', '在职', '00000039', 5, NULL, NULL, '2018-01-01', '2023-01-01', NULL);
INSERT INTO `personnel` VALUES (1923, '11', '男', '2018-01-01', '610122201801011234', '已婚', 1, '1', 1, '584991843@qq.com', '111', '1', 89, 9, 29, '劳动合同', '本科', '1', '1', '2018-01-01', '在职', '00000040', 4, NULL, NULL, '2018-01-01', '2022-01-26', NULL);
INSERT INTO `personnel` VALUES (1924, '1', '男', '2018-01-01', '610188199809091234', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 89, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000041', 1, NULL, NULL, '2018-01-31', '2019-01-31', NULL);
INSERT INTO `personnel` VALUES (1925, '1', '男', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000042', 1, NULL, NULL, '2018-01-31', '2019-01-31', NULL);
INSERT INTO `personnel` VALUES (1926, '1', '男', '2018-01-01', '610122199909090000', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 81, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000043', 0, NULL, NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1927, '1', '男', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 87, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000044', 0, NULL, NULL, '2018-01-01', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1928, '1', '男', '2018-01-01', '610122199909099999', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 78, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-01', '在职', '00000045', 0, NULL, NULL, '2018-01-01', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1929, '林伯渠', '男', '2018-01-01', '610122199909099999', '未婚', 1, '1', 1, '584991843@qq.com', '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000046', 0, NULL, NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1930, '1', '男', '2018-01-01', '610122199909091234', '已婚', 1, '1', 1, '584991843@qq.com', '1', '1', 8, 9, 29, '劳动合同', '大专', '1', '1', '2018-01-31', '在职', '00000047', 0, NULL, NULL, '2018-01-31', '2018-01-31', NULL);
INSERT INTO `personnel` VALUES (1931, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职', '00000057', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1932, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 93, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2019-11-05', '在职', '00000058', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1933, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 93, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2019-11-05', '在职', '00000059', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1934, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowan@123.com', '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职', '00000060', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1935, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowan@123.com', '18565558897', '深圳市南山区', 5, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职', '00000060', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1936, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 91, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职', '00000061', 2, '2018-03-31', NULL, '2017-12-31', '2019-12-31', NULL);
INSERT INTO `personnel` VALUES (1937, 'mtc', '男', '1989-12-31', '610122199001011256', '已婚', 1, '陕西', 13, 'laowang@qq.com', '18565558897', '深圳市南山区', 91, 9, 29, '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2017-12-31', '在职', '00000062', 6.17, '2018-03-31', NULL, '2017-12-31', '2024-02-29', NULL);
INSERT INTO `personnel` VALUES (1938, 'mtc666', '男', '2019-11-10', '610122199911111111', '已婚', 1, '广东', 13, '123@qq.com', '12345678901', '广东深圳', 78, 9, 29, '劳动合同', '本科', '信管', '深圳大学', '2019-11-10', '在职', '00000063', 3.25, '2020-02-10', NULL, '2019-11-10', '2023-02-22', NULL);
INSERT INTO `personnel` VALUES (1939, 'mtc666', '男', '2019-11-10', '610122199911111111', '已婚', 1, '广东', 13, '123@qq.com', '12345678901', '广东深圳', 78, 9, 29, '劳动合同', '本科', '信管', '深圳大学', '2019-11-10', '在职', '00000063', 3.25, '2020-02-10', NULL, '2019-11-10', '2023-02-22', NULL);
INSERT INTO `personnel` VALUES (1940, 'mtc', '男', '2017-11-01', '610144199905059999', '已婚', 1, '广东', 13, '584991843@qq.com', '18564447789', '广东深圳', 85, 9, 29, '劳动合同', '本科', '信息管理与信息系统', '深圳大学', '2019-11-24', '在职', '00000064', 3, '2020-01-10', NULL, '2019-11-24', '2022-11-27', NULL);
INSERT INTO `personnel` VALUES (1941, 'mtc', '男', '2019-11-24', '610144199905056666', '已婚', 1, '广东', 13, '584991843@qq.com', '18566667777', '广东深圳', 89, 9, 29, '劳动合同', '本科', '计算机科学', '深圳大学', '2019-11-24', '在职', '00000065', 3, '2020-02-23', NULL, '2019-11-24', '2022-11-27', NULL);

-- ----------------------------
-- Table structure for employee_copy1
-- ----------------------------
DROP TABLE IF EXISTS personnel;
CREATE TABLE `employee_copy1`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `number` int(255) NULL DEFAULT NULL,
  `acceptDate` datetime(0) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `birthdate` datetime(0) NULL DEFAULT NULL,
  `nationality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `salary` decimal(16, 2) NULL DEFAULT NULL,
  `accounting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `skill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `admin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `logged` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee_copy1
-- ----------------------------
INSERT INTO personnel VALUES ('199f615c8641bcbe98fcc1e688d55f13', 103, '2020-03-10 00:00:00', 'Manager', 'Hadden', 'Atkinson', 'hadden@gmail.com', 'hadden', '905342002030', '1984-10-12 00:00:00', 'Poland', 9600.00, NULL, 'not much', '0', '0');
INSERT INTO personnel VALUES ('199f615c8641bcbe98fcc1e688d55f14', 104, '2020-04-10 00:00:00', 'Analyst', 'Ellen', 'Reid', 'ellen@outlook.com', 'ellen', '905342002030', '1980-05-02 00:00:00', 'United States', 8000.00, 'PC Payroll', NULL, '1', '0');
INSERT INTO personnel VALUES ('199f615c8641bcbe98fcc1e688d55f15', 105, '2020-05-10 00:00:00', 'Analyst', 'Mark', 'Bishop', 'mark@mail.com', 'mark', '905342002030', '1981-12-02 00:00:00', 'Canada', 7900.00, 'PC Payroll', NULL, '0', '0');
INSERT INTO personnel VALUES ('199f615c8641bcbe98fcc1e688d55f16', 106, '2020-06-10 00:00:00', 'Analyst', 'Ja', 'Dong', 'ja@mail.com', 'ja', '905342002030', '1965-11-22 00:00:00', 'Korea', 10000.00, 'Calculator.Net', NULL, '0', '0');
INSERT INTO personnel VALUES ('199f615c8641bcbe98fcc1e688d55f17', 107, '2020-07-10 00:00:00', 'Designer', 'Maxim', 'Shafirov', 'maxim@mail.ru', 'maxim', '905342002030', '1998-06-15 00:00:00', 'Russia', 7000.00, 'PC Payroll', NULL, '1', '0');
INSERT INTO personnel VALUES ('199f615c8641bcbe98fcc1e688d55f18', 108, '2020-08-10 00:00:00', 'Designer', 'Yaroslav', 'Morozov', 'yaroslav@mail.ru', 'yaroslav', '905342002030', '1999-12-02 00:00:00', 'Russia', 7000.00, 'PC Payroll', NULL, '0', '0');
INSERT INTO personnel VALUES ('199f615c8641bcbe98fcc1e688d55f19', 109, '2020-09-10 00:00:00', 'Designer', 'Duygu', 'Özkan', 'duygu@mail.com.tr', 'duygu', '905342002030', '1976-10-14 00:00:00', 'Turkey', 7200.00, 'Calculator.Net', NULL, '0', '0');
INSERT INTO personnel VALUES ('199f615c8641bcbe98fcc1e688d55f20', 110, '2020-10-10 00:00:00', 'Programmer', 'Aaron', 'Swartz', 'aaron@mail.com', 'aaron', '905342002030', '1986-12-02 00:00:00', 'United States', 16000.00, 'PC Payroll', NULL, '1', '0');
INSERT INTO personnel VALUES ('199f615c8641bcbe98fcc1e688d55f21', 111, '2020-11-10 00:00:00', 'Programmer', 'Jane Manchun', 'Wong', 'jane@mail.com', 'janemanchun', '905342002030', '1995-12-12 00:00:00', 'Hong Kong', 15500.00, 'PC Payroll', NULL, '0', '0');
INSERT INTO personnel VALUES ('199f615c8641bcbe98fcc1e688d55f22', 112, '2020-12-10 00:00:00', 'Programmer', 'Joshua', 'Hill', 'joshua@mail.com', 'joshua', '905342002030', '1977-07-10 00:00:00', 'Germany', 14500.00, 'Calculator.Net', NULL, '0', '0');
INSERT INTO personnel VALUES ('199f615c8641bcbe98fcc1e688d55f23', 113, '2020-01-11 00:00:00', 'Tester', 'Hayri', 'Tufan', 'hayri@mail.com.tr', 'hayri', '905342002030', '1982-12-02 00:00:00', 'Turkey', 5000.00, 'PC Payroll', NULL, '1', '0');
INSERT INTO personnel VALUES ('199f615c8641bcbe98fcc1e688d55f24', 114, '2020-02-11 00:00:00', 'Tester', 'Tural', 'Əhmədov', 'tural@mail.com', 'tural', '905342002030', '1998-04-24 00:00:00', 'Azerbaijan', 5000.00, 'PC Payroll', NULL, '0', '0');
INSERT INTO personnel VALUES ('199f615c8641bcbe98fcc1e688d55f25', 115, '2020-03-11 00:00:00', 'Tester', 'Jackie', 'Wilson', 'jackie@mail.com', 'jackie', '905342002030', '1982-12-02 00:00:00', 'Estonia', 4500.00, 'Calculator.Net', NULL, '0', '0');
INSERT INTO personnel VALUES ('9419a35fd5ca411c9ba3310d5127a4d1', 0, '2021-01-27 20:30:58', 'string', 'string', 'string', 'string', 'string', '0', '2021-01-27 20:30:58', 'string', 0.00, 'string', 'string', '1', '1');

-- ----------------------------
-- Table structure for employeeec
-- ----------------------------
DROP TABLE IF EXISTS `employeeec`;
CREATE TABLE `employeeec`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NULL DEFAULT NULL COMMENT '员工编号',
  `ecDate` date NULL DEFAULT NULL COMMENT '奖罚日期',
  `ecReason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖罚原因',
  `ecPoint` int(11) NULL DEFAULT NULL COMMENT '奖罚分',
  `ecType` int(11) NULL DEFAULT NULL COMMENT '奖罚类别，0：奖，1：罚',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`eid`) USING BTREE,
  CONSTRAINT `employeeec_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `personnel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for employeeremove
-- ----------------------------
DROP TABLE IF EXISTS `employeeremove`;
CREATE TABLE `employeeremove`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NULL DEFAULT NULL,
  `afterDepId` int(11) NULL DEFAULT NULL COMMENT '调动后部门',
  `afterJobId` int(11) NULL DEFAULT NULL COMMENT '调动后职位',
  `removeDate` date NULL DEFAULT NULL COMMENT '调动日期',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调动原因',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`eid`) USING BTREE,
  CONSTRAINT `employeeremove_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `personnel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for employeetrain
-- ----------------------------
DROP TABLE IF EXISTS `employeetrain`;
CREATE TABLE `employeetrain`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NULL DEFAULT NULL COMMENT '员工编号',
  `trainDate` date NULL DEFAULT NULL COMMENT '培训日期',
  `trainContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '培训内容',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`eid`) USING BTREE,
  CONSTRAINT `employeetrain_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `personnel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for empsalary
-- ----------------------------
DROP TABLE IF EXISTS `empsalary`;
CREATE TABLE `empsalary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NULL DEFAULT NULL,
  `sid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `eid`(`eid`) USING BTREE,
  INDEX `empsalary_ibfk_2`(`sid`) USING BTREE,
  CONSTRAINT `empsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `personnel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `empsalary_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `salary` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of empsalary
-- ----------------------------
INSERT INTO `empsalary` VALUES (6, 4, 10);
INSERT INTO `empsalary` VALUES (10, 5, 9);
INSERT INTO `empsalary` VALUES (11, 6, 13);
INSERT INTO `empsalary` VALUES (12, 7, 13);
INSERT INTO `empsalary` VALUES (14, 8, 10);
INSERT INTO `empsalary` VALUES (15, 9, 10);
INSERT INTO `empsalary` VALUES (20, 10, 13);
INSERT INTO `empsalary` VALUES (21, 11, 9);
INSERT INTO `empsalary` VALUES (22, 3, 13);
INSERT INTO `empsalary` VALUES (24, 2, 9);
INSERT INTO `empsalary` VALUES (25, 1, 13);
INSERT INTO `empsalary` VALUES (26, 33, 10);
INSERT INTO `empsalary` VALUES (28, 34, 9);
INSERT INTO `empsalary` VALUES (29, 44, 10);
INSERT INTO `empsalary` VALUES (30, 45, 10);
INSERT INTO `empsalary` VALUES (31, 43, 10);
INSERT INTO `empsalary` VALUES (32, 47, 10);
INSERT INTO `empsalary` VALUES (33, 52, 13);
INSERT INTO `empsalary` VALUES (34, 53, 10);
INSERT INTO `empsalary` VALUES (35, 54, 10);
INSERT INTO `empsalary` VALUES (36, 56, 10);
INSERT INTO `empsalary` VALUES (38, 21, 9);

-- ----------------------------
-- Table structure for hr
-- ----------------------------
DROP TABLE IF EXISTS `hr`;
CREATE TABLE `hr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'hrID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) NULL DEFAULT 1,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `userface` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr
-- ----------------------------
INSERT INTO `hr` VALUES (3, '系统管理员', '18568887789', '029-82881234', '深圳南山', 1, 'admin', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', NULL);
INSERT INTO `hr` VALUES (5, '李白', '18568123489', '029-82123434', '海口美兰', 1, 'libai', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514093920321&di=913e88c23f382933ef430024afd9128a&imgtype=0&src=http%3A%2F%2Fp.3761.com%2Fpic%2F9771429316733.jpg', NULL);
INSERT INTO `hr` VALUES (10, '韩愈', '18568123666', '029-82111555', '广州番禺', 1, 'hanyu', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', NULL);
INSERT INTO `hr` VALUES (11, '柳宗元', '18568123377', '029-82111333', '广州天河', 1, 'liuzongyuan', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515233756&di=0856d923a0a37a87fd26604a2c871370&imgtype=jpg&er=1&src=http%3A%2F%2Fwww.qqzhi.com%2Fuploadpic%2F2014-09-27%2F041716704.jpg', NULL);
INSERT INTO `hr` VALUES (12, '曾巩', '18568128888', '029-82111222', '广州越秀', 1, 'zenggong', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', NULL);

-- ----------------------------
-- Table structure for hr_role
-- ----------------------------
DROP TABLE IF EXISTS `hr_role`;
CREATE TABLE `hr_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hrid` int(11) NULL DEFAULT NULL,
  `rid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE,
  INDEX `hr_role_ibfk_1`(`hrid`) USING BTREE,
  CONSTRAINT `hr_role_ibfk_1` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `hr_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_role
-- ----------------------------
INSERT INTO `hr_role` VALUES (1, 3, 6);
INSERT INTO `hr_role` VALUES (35, 12, 4);
INSERT INTO `hr_role` VALUES (36, 12, 3);
INSERT INTO `hr_role` VALUES (37, 12, 2);
INSERT INTO `hr_role` VALUES (43, 11, 3);
INSERT INTO `hr_role` VALUES (44, 11, 2);
INSERT INTO `hr_role` VALUES (45, 11, 4);
INSERT INTO `hr_role` VALUES (46, 11, 5);
INSERT INTO `hr_role` VALUES (48, 10, 3);
INSERT INTO `hr_role` VALUES (49, 10, 4);
INSERT INTO `hr_role` VALUES (72, 5, 1);
INSERT INTO `hr_role` VALUES (73, 5, 2);
INSERT INTO `hr_role` VALUES (74, 5, 3);

-- ----------------------------
-- Table structure for joblevel
-- ----------------------------
DROP TABLE IF EXISTS `joblevel`;
CREATE TABLE `joblevel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称名称',
  `titleLevel` enum('正高级','副高级','中级','初级','员级') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of joblevel
-- ----------------------------
INSERT INTO `joblevel` VALUES (9, '教授', '正高级', '2018-01-11 00:00:00', 1);
INSERT INTO `joblevel` VALUES (10, '副教授', '副高级', '2018-01-11 21:19:20', 1);
INSERT INTO `joblevel` VALUES (12, '助教', '初级', '2018-01-11 21:35:39', 1);
INSERT INTO `joblevel` VALUES (13, '讲师', '中级', '2018-01-11 00:00:00', 0);
INSERT INTO `joblevel` VALUES (14, '初级工程师', '初级', '2018-01-14 00:00:00', 1);
INSERT INTO `joblevel` VALUES (15, '中级工程师66', '中级', '2018-01-14 00:00:00', 1);
INSERT INTO `joblevel` VALUES (16, '高级工程师', '副高级', '2018-01-14 16:19:14', 1);
INSERT INTO `joblevel` VALUES (17, '骨灰级工程师', '正高级', '2018-01-14 16:19:24', 1);

-- ----------------------------
-- Table structure for mail_send_log
-- ----------------------------
DROP TABLE IF EXISTS `mail_send_log`;
CREATE TABLE `mail_send_log`  (
  `msgId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `empId` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT 0 COMMENT '0发送中，1发送成功，2发送失败',
  `routeKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `exchange` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL COMMENT '重试次数',
  `tryTime` date NULL DEFAULT NULL COMMENT '第一次重试时间',
  `createTime` date NULL DEFAULT NULL,
  `updateTime` date NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iconCls` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keepAlive` tinyint(1) NULL DEFAULT NULL,
  `requireAuth` tinyint(1) NULL DEFAULT NULL,
  `parentId` int(11) NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parentId`(`parentId`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '/', NULL, NULL, '所有', NULL, NULL, NULL, NULL, 1);
INSERT INTO `menu` VALUES (2, '/', '/home', 'Home', '员工资料', 'fa fa-user-circle-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (3, '/', '/home', 'Home', '人事管理', 'fa fa-address-card-o', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (4, '/', '/home', 'Home', '薪资管理', 'fa fa-money', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (5, '/', '/home', 'Home', '统计管理', 'fa fa-bar-chart', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (6, '/', '/home', 'Home', '系统管理', 'fa fa-windows', NULL, 1, 1, 1);
INSERT INTO `menu` VALUES (7, '/personnel/basic/**', '/emp/basic', 'EmpBasic', '基本资料', NULL, NULL, 1, 2, 1);
INSERT INTO `menu` VALUES (8, '/personnel/advanced/**', '/emp/adv', 'EmpAdv', '高级资料', NULL, NULL, 1, 2, 1);
INSERT INTO `menu` VALUES (9, '/personnel/emp/**', '/per/emp', 'PerEmp', '员工资料', NULL, NULL, 1, 3, 1);
INSERT INTO `menu` VALUES (10, '/personnel/ec/**', '/per/ec', 'PerEc', '员工奖惩', NULL, NULL, 1, 3, 1);
INSERT INTO `menu` VALUES (11, '/personnel/train/**', '/per/train', 'PerTrain', '员工培训', NULL, NULL, 1, 3, 1);
INSERT INTO `menu` VALUES (12, '/personnel/salary/**', '/per/salary', 'PerSalary', '员工调薪', NULL, NULL, 1, 3, 1);
INSERT INTO `menu` VALUES (13, '/personnel/remove/**', '/per/mv', 'PerMv', '员工调动', NULL, NULL, 1, 3, 1);
INSERT INTO `menu` VALUES (14, '/salary/sob/**', '/sal/sob', 'SalSob', '工资账套管理', NULL, NULL, 1, 4, 1);
INSERT INTO `menu` VALUES (15, '/salary/sobcfg/**', '/sal/sobcfg', 'SalSobCfg', '员工账套设置', NULL, NULL, 1, 4, 1);
INSERT INTO `menu` VALUES (16, '/salary/table/**', '/sal/table', 'SalTable', '工资表管理', NULL, NULL, 1, 4, 1);
INSERT INTO `menu` VALUES (17, '/salary/month/**', '/sal/month', 'SalMonth', '月末处理', NULL, NULL, 1, 4, 1);
INSERT INTO `menu` VALUES (18, '/salary/search/**', '/sal/search', 'SalSearch', '工资表查询', NULL, NULL, 1, 4, 1);
INSERT INTO `menu` VALUES (19, '/statistics/all/**', '/sta/all', 'StaAll', '综合信息统计', NULL, NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (20, '/statistics/score/**', '/sta/score', 'StaScore', '员工积分统计', NULL, NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (21, '/statistics/personnel/**', '/sta/pers', 'StaPers', '人事信息统计', NULL, NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (22, '/statistics/recored/**', '/sta/record', 'StaRecord', '人事记录统计', NULL, NULL, 1, 5, 1);
INSERT INTO `menu` VALUES (23, '/system/basic/**', '/sys/basic', 'SysBasic', '基础信息设置', NULL, NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (24, '/system/cfg/**', '/sys/cfg', 'SysCfg', '系统管理', NULL, NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (25, '/system/log/**', '/sys/log', 'SysLog', '操作日志管理', NULL, NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (26, '/system/hr/**', '/sys/hr', 'SysHr', '操作员管理', NULL, NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (27, '/system/data/**', '/sys/data', 'SysData', '备份恢复数据库', NULL, NULL, 1, 6, 1);
INSERT INTO `menu` VALUES (28, '/system/init/**', '/sys/init', 'SysInit', '初始化数据库', NULL, NULL, 1, 6, 1);

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NULL DEFAULT NULL,
  `rid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE,
  CONSTRAINT `menu_role_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `menu_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 283 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES (161, 7, 3);
INSERT INTO `menu_role` VALUES (162, 7, 6);
INSERT INTO `menu_role` VALUES (163, 9, 6);
INSERT INTO `menu_role` VALUES (164, 10, 6);
INSERT INTO `menu_role` VALUES (165, 11, 6);
INSERT INTO `menu_role` VALUES (166, 12, 6);
INSERT INTO `menu_role` VALUES (167, 13, 6);
INSERT INTO `menu_role` VALUES (168, 14, 6);
INSERT INTO `menu_role` VALUES (169, 15, 6);
INSERT INTO `menu_role` VALUES (170, 16, 6);
INSERT INTO `menu_role` VALUES (171, 17, 6);
INSERT INTO `menu_role` VALUES (172, 18, 6);
INSERT INTO `menu_role` VALUES (173, 19, 6);
INSERT INTO `menu_role` VALUES (174, 20, 6);
INSERT INTO `menu_role` VALUES (175, 21, 6);
INSERT INTO `menu_role` VALUES (176, 22, 6);
INSERT INTO `menu_role` VALUES (177, 23, 6);
INSERT INTO `menu_role` VALUES (178, 25, 6);
INSERT INTO `menu_role` VALUES (179, 26, 6);
INSERT INTO `menu_role` VALUES (180, 27, 6);
INSERT INTO `menu_role` VALUES (181, 28, 6);
INSERT INTO `menu_role` VALUES (182, 24, 6);
INSERT INTO `menu_role` VALUES (247, 7, 4);
INSERT INTO `menu_role` VALUES (248, 8, 4);
INSERT INTO `menu_role` VALUES (249, 11, 4);
INSERT INTO `menu_role` VALUES (250, 7, 2);
INSERT INTO `menu_role` VALUES (251, 8, 2);
INSERT INTO `menu_role` VALUES (252, 9, 2);
INSERT INTO `menu_role` VALUES (253, 10, 2);
INSERT INTO `menu_role` VALUES (254, 12, 2);
INSERT INTO `menu_role` VALUES (255, 13, 2);
INSERT INTO `menu_role` VALUES (256, 7, 1);
INSERT INTO `menu_role` VALUES (257, 8, 1);
INSERT INTO `menu_role` VALUES (258, 9, 1);
INSERT INTO `menu_role` VALUES (259, 10, 1);
INSERT INTO `menu_role` VALUES (260, 11, 1);
INSERT INTO `menu_role` VALUES (261, 12, 1);
INSERT INTO `menu_role` VALUES (262, 13, 1);
INSERT INTO `menu_role` VALUES (263, 14, 1);
INSERT INTO `menu_role` VALUES (264, 15, 1);
INSERT INTO `menu_role` VALUES (265, 16, 1);
INSERT INTO `menu_role` VALUES (266, 17, 1);
INSERT INTO `menu_role` VALUES (267, 18, 1);
INSERT INTO `menu_role` VALUES (268, 19, 1);
INSERT INTO `menu_role` VALUES (269, 20, 1);
INSERT INTO `menu_role` VALUES (270, 21, 1);
INSERT INTO `menu_role` VALUES (271, 22, 1);
INSERT INTO `menu_role` VALUES (272, 23, 1);
INSERT INTO `menu_role` VALUES (273, 24, 1);
INSERT INTO `menu_role` VALUES (274, 25, 1);
INSERT INTO `menu_role` VALUES (275, 26, 1);
INSERT INTO `menu_role` VALUES (276, 27, 1);
INSERT INTO `menu_role` VALUES (277, 28, 1);
INSERT INTO `menu_role` VALUES (280, 7, 14);
INSERT INTO `menu_role` VALUES (281, 8, 14);
INSERT INTO `menu_role` VALUES (282, 9, 14);

-- ----------------------------
-- Table structure for msgcontent
-- ----------------------------
DROP TABLE IF EXISTS `msgcontent`;
CREATE TABLE `msgcontent`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createDate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of msgcontent
-- ----------------------------
INSERT INTO `msgcontent` VALUES (14, '2222222222', '11111111111111111', '2018-02-02 20:46:19');
INSERT INTO `msgcontent` VALUES (15, '22222222', '3333333333333333333333', '2018-02-02 21:45:57');
INSERT INTO `msgcontent` VALUES (16, '通知标题1', '通知内容1', '2018-02-03 11:41:39');
INSERT INTO `msgcontent` VALUES (17, '通知标题2', '通知内容2', '2018-02-03 11:52:37');
INSERT INTO `msgcontent` VALUES (18, '通知标题3', '通知内容3', '2018-02-03 12:19:41');

-- ----------------------------
-- Table structure for nation
-- ----------------------------
DROP TABLE IF EXISTS `nation`;
CREATE TABLE `nation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nation
-- ----------------------------
INSERT INTO `nation` VALUES (1, '汉族');
INSERT INTO `nation` VALUES (2, '蒙古族');
INSERT INTO `nation` VALUES (3, '回族');
INSERT INTO `nation` VALUES (4, '藏族');
INSERT INTO `nation` VALUES (5, '维吾尔族');
INSERT INTO `nation` VALUES (6, '苗族');
INSERT INTO `nation` VALUES (7, '彝族');
INSERT INTO `nation` VALUES (8, '壮族');
INSERT INTO `nation` VALUES (9, '布依族');
INSERT INTO `nation` VALUES (10, '朝鲜族');
INSERT INTO `nation` VALUES (11, '满族');
INSERT INTO `nation` VALUES (12, '侗族');
INSERT INTO `nation` VALUES (13, '瑶族');
INSERT INTO `nation` VALUES (14, '白族');
INSERT INTO `nation` VALUES (15, '土家族');
INSERT INTO `nation` VALUES (16, '哈尼族');
INSERT INTO `nation` VALUES (17, '哈萨克族');
INSERT INTO `nation` VALUES (18, '傣族');
INSERT INTO `nation` VALUES (19, '黎族');
INSERT INTO `nation` VALUES (20, '傈僳族');
INSERT INTO `nation` VALUES (21, '佤族');
INSERT INTO `nation` VALUES (22, '畲族');
INSERT INTO `nation` VALUES (23, '高山族');
INSERT INTO `nation` VALUES (24, '拉祜族');
INSERT INTO `nation` VALUES (25, '水族');
INSERT INTO `nation` VALUES (26, '东乡族');
INSERT INTO `nation` VALUES (27, '纳西族');
INSERT INTO `nation` VALUES (28, '景颇族');
INSERT INTO `nation` VALUES (29, '柯尔克孜族');
INSERT INTO `nation` VALUES (30, '土族');
INSERT INTO `nation` VALUES (31, '达斡尔族');
INSERT INTO `nation` VALUES (32, '仫佬族');
INSERT INTO `nation` VALUES (33, '羌族');
INSERT INTO `nation` VALUES (34, '布朗族');
INSERT INTO `nation` VALUES (35, '撒拉族');
INSERT INTO `nation` VALUES (36, '毛难族');
INSERT INTO `nation` VALUES (37, '仡佬族');
INSERT INTO `nation` VALUES (38, '锡伯族');
INSERT INTO `nation` VALUES (39, '阿昌族');
INSERT INTO `nation` VALUES (40, '普米族');
INSERT INTO `nation` VALUES (41, '塔吉克族');
INSERT INTO `nation` VALUES (42, '怒族');
INSERT INTO `nation` VALUES (43, '乌孜别克族');
INSERT INTO `nation` VALUES (44, '俄罗斯族');
INSERT INTO `nation` VALUES (45, '鄂温克族');
INSERT INTO `nation` VALUES (46, '崩龙族');
INSERT INTO `nation` VALUES (47, '保安族');
INSERT INTO `nation` VALUES (48, '裕固族');
INSERT INTO `nation` VALUES (49, '京族');
INSERT INTO `nation` VALUES (50, '塔塔尔族');
INSERT INTO `nation` VALUES (51, '独龙族');
INSERT INTO `nation` VALUES (52, '鄂伦春族');
INSERT INTO `nation` VALUES (53, '赫哲族');
INSERT INTO `nation` VALUES (54, '门巴族');
INSERT INTO `nation` VALUES (55, '珞巴族');
INSERT INTO `nation` VALUES (56, '基诺族');

-- ----------------------------
-- Table structure for oplog
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` date NULL DEFAULT NULL COMMENT '添加日期',
  `operate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作内容',
  `hrid` int(11) NULL DEFAULT NULL COMMENT '操作员ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hrid`(`hrid`) USING BTREE,
  CONSTRAINT `oplog_ibfk_1` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for politicsstatus
-- ----------------------------
DROP TABLE IF EXISTS `politicsstatus`;
CREATE TABLE `politicsstatus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of politicsstatus
-- ----------------------------
INSERT INTO `politicsstatus` VALUES (1, '中共党员');
INSERT INTO `politicsstatus` VALUES (2, '中共预备党员');
INSERT INTO `politicsstatus` VALUES (3, '共青团员');
INSERT INTO `politicsstatus` VALUES (4, '民革党员');
INSERT INTO `politicsstatus` VALUES (5, '民盟盟员');
INSERT INTO `politicsstatus` VALUES (6, '民建会员');
INSERT INTO `politicsstatus` VALUES (7, '民进会员');
INSERT INTO `politicsstatus` VALUES (8, '农工党党员');
INSERT INTO `politicsstatus` VALUES (9, '致公党党员');
INSERT INTO `politicsstatus` VALUES (10, '九三学社社员');
INSERT INTO `politicsstatus` VALUES (11, '台盟盟员');
INSERT INTO `politicsstatus` VALUES (12, '无党派民主人士');
INSERT INTO `politicsstatus` VALUES (13, '普通公民');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `createDate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (29, '技术总监', '2018-01-11 21:13:42', 1);
INSERT INTO `position` VALUES (30, '运营总监', '2018-01-11 21:13:48', 1);
INSERT INTO `position` VALUES (31, '市场总监', '2018-01-11 00:00:00', 1);
INSERT INTO `position` VALUES (33, '研发工程师', '2018-01-14 00:00:00', 0);
INSERT INTO `position` VALUES (34, '运维工程师', '2018-01-14 16:11:41', 1);
INSERT INTO `position` VALUES (36, 'Java研发经理', '2019-10-01 00:00:00', 1);

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `team_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `startDate` datetime(0) NULL DEFAULT NULL,
  `dueDate` datetime(0) NULL DEFAULT NULL,
  `creationDate` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projects
-- ----------------------------
INSERT INTO `projects` VALUES ('199f615c8641bcbe98fcc1e688d55f29', 'Website Development', 'JavaScript', NULL, '2020-03-10 00:00:00', '2020-06-11 00:00:00', NULL, 'This is a website development project.');
INSERT INTO `projects` VALUES ('199f615c8641bcbe98fcc1e688d55f30', 'HR System', 'Java', 'Junior', '2020-02-10 00:00:00', '2020-05-11 00:00:00', '2020-02-01 00:00:00', NULL);
INSERT INTO `projects` VALUES ('199f615c8641bcbe98fcc1e688d55f31', 'Computer Project', 'Python', 'Turbo', '2019-12-20 00:00:00', '2020-06-10 00:00:00', '2019-12-20 00:00:00', NULL);
INSERT INTO `projects` VALUES ('a348ec9f618f4650a1e3d293355cf8c5', 'test', 'Ruby', NULL, '2020-12-29 10:00:00', '2021-01-14 10:00:00', NULL, 'test');
INSERT INTO `projects` VALUES ('eef1828fd54e44a089d1d083c2801e1e', 'test2', 'Python', NULL, '2020-12-29 10:00:00', '2021-01-07 10:00:00', '2021-01-28 23:36:27', 'test2');
INSERT INTO `projects` VALUES ('fa28bffaca814f04b394022c5b88af65', 'test', 'Python', NULL, '2021-01-03 10:00:00', '2021-01-10 10:00:00', NULL, 'test');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nameZh` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ROLE_manager', '部门经理');
INSERT INTO `role` VALUES (2, 'ROLE_personnel', '人事专员');
INSERT INTO `role` VALUES (3, 'ROLE_recruiter', '招聘主管');
INSERT INTO `role` VALUES (4, 'ROLE_train', '培训主管');
INSERT INTO `role` VALUES (5, 'ROLE_performance', '薪酬绩效主管');
INSERT INTO `role` VALUES (6, 'ROLE_admin', '系统管理员');
INSERT INTO `role` VALUES (13, 'ROLE_test2', '测试角色2');
INSERT INTO `role` VALUES (14, 'ROLE_test1', '测试角色1');
INSERT INTO `role` VALUES (17, 'ROLE_test3', '测试角色3');
INSERT INTO `role` VALUES (18, 'ROLE_test4', '测试角色4');
INSERT INTO `role` VALUES (19, 'ROLE_test4', '测试角色4');
INSERT INTO `role` VALUES (20, 'ROLE_test5', '测试角色5');
INSERT INTO `role` VALUES (21, 'ROLE_test6', '测试角色6');

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basicSalary` int(11) NULL DEFAULT NULL COMMENT '基本工资',
  `bonus` int(11) NULL DEFAULT NULL COMMENT '奖金',
  `lunchSalary` int(11) NULL DEFAULT NULL COMMENT '午餐补助',
  `trafficSalary` int(11) NULL DEFAULT NULL COMMENT '交通补助',
  `allSalary` int(11) NULL DEFAULT NULL COMMENT '应发工资',
  `pensionBase` int(11) NULL DEFAULT NULL COMMENT '养老金基数',
  `pensionPer` float NULL DEFAULT NULL COMMENT '养老金比率',
  `createDate` timestamp(0) NULL DEFAULT NULL COMMENT '启用时间',
  `medicalBase` int(11) NULL DEFAULT NULL COMMENT '医疗基数',
  `medicalPer` float NULL DEFAULT NULL COMMENT '医疗保险比率',
  `accumulationFundBase` int(11) NULL DEFAULT NULL COMMENT '公积金基数',
  `accumulationFundPer` float NULL DEFAULT NULL COMMENT '公积金比率',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES (9, 9000, 4000, 800, 500, NULL, 2000, 0.07, '2018-01-24 00:00:00', 2000, 0.07, 2000, 0.07, '市场部工资账套');
INSERT INTO `salary` VALUES (10, 2000, 2000, 400, 1000, NULL, 2000, 0.07, '2018-01-01 00:00:00', 2000, 0.07, 2000, 0.07, '人事部工资账套');
INSERT INTO `salary` VALUES (13, 20000, 3000, 500, 500, NULL, 4000, 0.07, '2018-01-25 00:00:00', 4000, 0.07, 4000, 0.07, '运维部工资账套');

-- ----------------------------
-- Table structure for sysmsg
-- ----------------------------
DROP TABLE IF EXISTS `sysmsg`;
CREATE TABLE `sysmsg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NULL DEFAULT NULL COMMENT '消息id',
  `type` int(11) NULL DEFAULT 0 COMMENT '0表示群发消息',
  `hrid` int(11) NULL DEFAULT NULL COMMENT '这条消息是给谁的',
  `state` int(11) NULL DEFAULT 0 COMMENT '0 未读 1 已读',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hrid`(`hrid`) USING BTREE,
  INDEX `sysmsg_ibfk_1`(`mid`) USING BTREE,
  CONSTRAINT `sysmsg_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `msgcontent` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sysmsg_ibfk_2` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysmsg
-- ----------------------------
INSERT INTO `sysmsg` VALUES (57, 14, 0, 3, 1);
INSERT INTO `sysmsg` VALUES (58, 14, 0, 5, 1);
INSERT INTO `sysmsg` VALUES (59, 14, 0, 10, 1);
INSERT INTO `sysmsg` VALUES (60, 14, 0, 11, 0);
INSERT INTO `sysmsg` VALUES (61, 14, 0, 12, 0);
INSERT INTO `sysmsg` VALUES (62, 15, 0, 3, 1);
INSERT INTO `sysmsg` VALUES (63, 15, 0, 5, 1);
INSERT INTO `sysmsg` VALUES (64, 15, 0, 10, 1);
INSERT INTO `sysmsg` VALUES (65, 15, 0, 11, 0);
INSERT INTO `sysmsg` VALUES (66, 15, 0, 12, 0);
INSERT INTO `sysmsg` VALUES (67, 16, 0, 3, 1);
INSERT INTO `sysmsg` VALUES (68, 16, 0, 5, 1);
INSERT INTO `sysmsg` VALUES (69, 16, 0, 10, 1);
INSERT INTO `sysmsg` VALUES (70, 16, 0, 11, 0);
INSERT INTO `sysmsg` VALUES (71, 16, 0, 12, 0);
INSERT INTO `sysmsg` VALUES (72, 17, 0, 3, 1);
INSERT INTO `sysmsg` VALUES (73, 17, 0, 5, 1);
INSERT INTO `sysmsg` VALUES (74, 17, 0, 10, 1);
INSERT INTO `sysmsg` VALUES (75, 17, 0, 11, 0);
INSERT INTO `sysmsg` VALUES (76, 17, 0, 12, 0);
INSERT INTO `sysmsg` VALUES (77, 18, 0, 3, 1);
INSERT INTO `sysmsg` VALUES (78, 18, 0, 5, 0);
INSERT INTO `sysmsg` VALUES (79, 18, 0, 10, 0);
INSERT INTO `sysmsg` VALUES (80, 18, 0, 11, 0);
INSERT INTO `sysmsg` VALUES (81, 18, 0, 12, 0);

-- ----------------------------
-- Table structure for teams
-- ----------------------------
DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `manager` int(255) NULL DEFAULT NULL,
  `analyst` int(255) NULL DEFAULT NULL,
  `designer` int(255) NULL DEFAULT NULL,
  `programmer` int(255) NULL DEFAULT NULL,
  `tester` int(255) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teams
-- ----------------------------
INSERT INTO `teams` VALUES ('199f615c8641bcbe98fcc1e688d55f26', 'Admins', 101, 104, 107, 110, 113);
INSERT INTO `teams` VALUES ('199f615c8641bcbe98fcc1e688d55f27', 'Turbo', 103, 106, 107, 111, 114);
INSERT INTO `teams` VALUES ('199f615c8641bcbe98fcc1e688d55f28', 'Junior', 103, 105, 109, 110, 115);
INSERT INTO `teams` VALUES ('a7faa3b2a5cf40e49672e141d2c33221', '1', 1, 1, 1, 1, 1);
INSERT INTO `teams` VALUES ('d06b8ecd4fec4631907334db4cc7d9f6', NULL, 0, 0, 0, 0, 0);
INSERT INTO `teams` VALUES ('b7c39c536ca747659e7eea14b173fc77', NULL, 0, 0, 0, 0, 0);
INSERT INTO `teams` VALUES ('c107589370fd4adb86c3b0f3b0b50170', NULL, 0, 0, 0, 0, 0);
INSERT INTO `teams` VALUES ('477391e89f8b4764a89a121b2cd336ca', '5', 5, 5, 5, 5, 5);
INSERT INTO `teams` VALUES ('4024cca7a7ba4067919ad90052c8edf7', 'Turbo2', 103, 106, 107, 111, 114);
INSERT INTO `teams` VALUES ('dfa6aacfebd74b358f6a8a8fb2b31a07', 'Admins2', 101, 104, 107, 110, 113);
INSERT INTO `teams` VALUES ('e4ae42c3cad04b09b24a12fdb8af2b0c', 'Turbo', 103, 106, 107, 111, 114);
INSERT INTO `teams` VALUES ('43820268f11e4ae28eae7e078c82ad7c', 'Admins', 101, 104, 107, 110, 113);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', '123', '3c4ce0eaeda14697b30a65ed0396a1f8');

-- ----------------------------
-- Procedure structure for addDep
-- ----------------------------
DROP PROCEDURE IF EXISTS `addDep`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addDep`(in depName varchar(32),in parentId int,in enabled boolean,out result int,out result2 int)
begin
  declare did int;
  declare pDepPath varchar(64);
  insert into department set name=depName,parentId=parentId,enabled=enabled;
  select row_count() into result;
  select last_insert_id() into did;
  set result2=did;
  select depPath into pDepPath from department where id=parentId;
  update department set depPath=concat(pDepPath,'.',did) where id=did;
  update department set isParent=true where id=parentId;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for deleteDep
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteDep`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDep`(in did int,out result int)
begin
  declare ecount int;
  declare pid int;
  declare pcount int;
  declare a int;
  select count(*) into a from department where id=did and isParent=false;
  if a=0 then set result=-2;
  else
  select count(*) into ecount from personnel where departmentId=did;
  if ecount>0 then set result=-1;
  else
  select parentId into pid from department where id=did;
  delete from department where id=did and isParent=false;
  select row_count() into result;
  select count(*) into pcount from department where parentId=pid;
  if pcount=0 then update department set isParent=false where id=pid;
  end if;
  end if;
  end if;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
