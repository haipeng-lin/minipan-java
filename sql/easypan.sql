/*
 Navicat Premium Data Transfer

 Source Server         : MySQL80_win
 Source Server Type    : MySQL
 Source Server Version : 80035
 Source Host           : localhost:3306
 Source Schema         : easypan

 Target Server Type    : MySQL
 Target Server Version : 80035
 File Encoding         : 65001

 Date: 06/06/2024 22:04:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for email_code
-- ----------------------------
DROP TABLE IF EXISTS `email_code`;
CREATE TABLE `email_code`  (
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '0:未使用  1:已使用',
  PRIMARY KEY (`email`, `code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '邮箱验证码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of email_code
-- ----------------------------
INSERT INTO `email_code` VALUES ('haipeng_lin@163.com', '06322', '2024-04-17 09:09:48', 1);
INSERT INTO `email_code` VALUES ('haipeng_lin@163.com', '38791', '2024-03-29 09:21:19', 1);
INSERT INTO `email_code` VALUES ('haipeng_lin@163.com', '52957', '2024-03-29 09:26:06', 1);
INSERT INTO `email_code` VALUES ('haipeng_lin@outlook.com', '82660', '2024-04-13 10:56:10', 0);

-- ----------------------------
-- Table structure for file_info
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info`  (
  `file_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件ID',
  `user_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `file_md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'md5值，第一次上传记录',
  `file_pid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级ID',
  `file_size` bigint(0) NULL DEFAULT NULL COMMENT '文件大小',
  `file_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `file_cover` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `file_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `folder_type` tinyint(1) NULL DEFAULT NULL COMMENT '0:文件 1:目录',
  `file_category` tinyint(1) NULL DEFAULT NULL COMMENT '1:视频 2:音频  3:图片 4:文档 5:其他',
  `file_type` tinyint(1) NULL DEFAULT NULL COMMENT ' 1:视频 2:音频  3:图片 4:pdf 5:doc 6:excel 7:txt 8:code 9:zip 10:其他',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '0:转码中 1转码失败 2:转码成功',
  `recovery_time` datetime(0) NULL DEFAULT NULL COMMENT '回收站时间',
  `del_flag` tinyint(1) NULL DEFAULT 2 COMMENT '删除标记 0:删除  1:回收站  2:正常',
  PRIMARY KEY (`file_id`, `user_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_md5`(`file_md5`) USING BTREE,
  INDEX `idx_file_pid`(`file_pid`) USING BTREE,
  INDEX `idx_del_flag`(`del_flag`) USING BTREE,
  INDEX `idx_recovery_time`(`recovery_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_info
-- ----------------------------
INSERT INTO `file_info` VALUES ('7Hqt4MvUFZ', '6907001133', 'f6f598587d10009184a02e2850821410', '0', 37376, '实验6指导-遗传算法求解优化问题.docx', NULL, '202406/6907001133mBEdCDceil.doc', '2024-06-06 09:53:44', '2024-06-06 09:53:44', 0, 5, 10, 2, '2024-06-06 21:56:31', 1);
INSERT INTO `file_info` VALUES ('m9JRC8eWz5', '6907001133', 'b19adf24bea9f53c731bc5a21ba86f52', '0', 490071, '小喵.jpg', '202406/6907001133m9JRC8eWz5_.jpg', '202406/6907001133m9JRC8eWz5.jpg', '2024-06-06 09:49:23', '2024-06-06 09:49:23', 0, 3, 3, 2, NULL, 2);
INSERT INTO `file_info` VALUES ('mBEdCDceil', '6907001133', 'f6f598587d10009184a02e2850821410', '0', 37376, '实验6指导-遗传算法求解优化问题.doc', NULL, '202406/6907001133mBEdCDceil.doc', '2024-06-06 09:52:30', '2024-06-06 09:52:30', 0, 5, 10, 2, '2024-06-06 21:56:36', 1);
INSERT INTO `file_info` VALUES ('SCY4nSYju7', '6907001133', NULL, '0', NULL, '文件夹一', NULL, NULL, '2024-06-06 09:51:47', '2024-06-06 09:51:47', 1, NULL, NULL, 2, NULL, 2);
INSERT INTO `file_info` VALUES ('WKwmWT1xv8', '6907001133', 'fc4f8267392b85706ad74bb4b26b6805', '0', 29720414, '8月5日 _延时云+音乐(1).mp4', '202406/6907001133WKwmWT1xv8.png', '202406/6907001133WKwmWT1xv8.mp4', '2024-06-06 21:55:16', '2024-06-06 21:55:16', 0, 1, 1, 2, NULL, 2);
INSERT INTO `file_info` VALUES ('XfhGva9OrY', '6907001133', NULL, '0', NULL, '文件夹二', NULL, NULL, '2024-06-06 09:51:53', '2024-06-06 09:51:53', 1, NULL, NULL, 2, NULL, 2);
INSERT INTO `file_info` VALUES ('yZDn1v3KM6', '6907001133', 'f2130d973e86d624d5fc42d990d4a386', '0', 978763, '2月4汕头行_第一版.pdf', NULL, '202406/6907001133yZDn1v3KM6.pdf', '2024-06-06 09:50:28', '2024-06-06 09:50:28', 0, 4, 4, 2, NULL, 2);

-- ----------------------------
-- Table structure for file_share
-- ----------------------------
DROP TABLE IF EXISTS `file_share`;
CREATE TABLE `file_share`  (
  `share_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分享ID',
  `file_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件ID',
  `user_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `valid_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:1天 1:7天 2:30天 3:永久有效',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '失效时间',
  `share_time` datetime(0) NULL DEFAULT NULL COMMENT '分享时间',
  `code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提取码',
  `show_count` int(0) NULL DEFAULT 0 COMMENT '浏览次数',
  PRIMARY KEY (`share_id`) USING BTREE,
  INDEX `idx_file_id`(`file_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_share_time`(`share_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分享信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_share
-- ----------------------------
INSERT INTO `file_share` VALUES ('maVax5UnTMh44GrFWn2j', 'yZDn1v3KM6', '6907001133', 3, NULL, '2024-06-06 21:55:47', '5nmUn', 0);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `qq_open_id` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'qqOpenID',
  `qq_avatar` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'qq头像',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `join_time` datetime(0) NULL DEFAULT NULL COMMENT '加入时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '0:禁用 1:正常',
  `use_space` bigint(0) NULL DEFAULT 0 COMMENT '使用空间单位byte',
  `total_space` bigint(0) NULL DEFAULT NULL COMMENT '总空间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `key_email`(`email`) USING BTREE,
  UNIQUE INDEX `key_nick_name`(`nick_name`) USING BTREE,
  UNIQUE INDEX `key_qq_open_id`(`qq_open_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('3178033358', '测试账号', 'test@qq.com', NULL, NULL, '47ec2dd791e31e2ef2076caf64ed9b3d', NULL, '2023-04-28 13:54:01', 1, 238302835, 10737418240);
INSERT INTO `user_info` VALUES ('6907001133', 'peng', 'haipeng_lin@163.com', NULL, '', 'e9bc0e13a8a16cbb07b175d92a113126', '2024-03-29 09:27:22', '2024-06-06 21:54:35', 1, 54119074, 10737418240);

SET FOREIGN_KEY_CHECKS = 1;
