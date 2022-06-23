/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3305
 Source Schema         : ihrm

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 23/06/2022 13:36:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for atte_archive_monthly
-- ----------------------------
DROP TABLE IF EXISTS `atte_archive_monthly`;
CREATE TABLE `atte_archive_monthly`  (
  `id` bigint(32) NOT NULL COMMENT '主键ID',
  `company_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司ID',
  `department_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `archive_year` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归档年份',
  `archive_month` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归档月份',
  `total_people_num` int(36) NULL DEFAULT NULL COMMENT '总人数',
  `full_atte_people_num` int(36) NULL DEFAULT NULL COMMENT '全勤人数',
  `is_archived` int(20) NULL DEFAULT NULL COMMENT '是否归档(0已经归档1没有归档)',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `company_id`(`company_id`, `department_id`, `archive_year`, `archive_month`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考勤归档信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of atte_archive_monthly
-- ----------------------------
INSERT INTO `atte_archive_monthly` VALUES (1240302168376995840, '1', NULL, '2019', '8', 8, 8, 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for atte_archive_monthly_info
-- ----------------------------
DROP TABLE IF EXISTS `atte_archive_monthly_info`;
CREATE TABLE `atte_archive_monthly_info`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `atte_archive_monthly_id` bigint(36) NULL DEFAULT NULL COMMENT '归档id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `work_number` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `atte_solution` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当月考勤方案',
  `department` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级部门',
  `work_city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作城市',
  `year_leave_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年假天数',
  `leave_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事假天数',
  `sick_leave_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '病假天数',
  `long_sick_leave_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '长期病假天数',
  `marraiage_leave_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '婚假天数',
  `funeral_leave_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '丧假天数',
  `maternity_leave_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产假天数',
  `reward_maternity_leave_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖励产假天数',
  `paternity_leave_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '陪产假天数',
  `home_leava_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '探亲假天数',
  `accidential_leave_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工伤假',
  `day_Off_leave_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调休天数',
  `doctor_Off_leave_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产检假天数',
  `abortion_leave_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流产假天数',
  `normal_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正常天数',
  `outgoing_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外出天数',
  `on_business_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出差天数',
  `later_times` int(20) NULL DEFAULT NULL COMMENT '迟到次数',
  `early_times` int(20) NULL DEFAULT NULL COMMENT '早退次数',
  `signed_times` int(20) NULL DEFAULT NULL COMMENT '迟到次数',
  `hours_per_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日均时长（自然日）',
  `hours_per_work_day` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日均时长(工作日)',
  `hours_per_rest_day` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日均时长（休息日）',
  `clock_rate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打卡率',
  `absence_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旷工天数',
  `is_full_attendanceint` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否全勤0全勤1非全勤',
  `actual_atte_unofficial_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实际出勤天数（非正式）',
  `actual_atte_official_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实际出勤天数（正式）',
  `working_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应出勤工作日',
  `salary_standards` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计薪标准',
  `salary_adjustment_days` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计薪天数调整',
  `work_hour` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作时长',
  `salary_unofficial_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计薪天数（非正式）',
  `salary_official_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计薪天数（正式）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `archive_date` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考勤归档信息详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of atte_archive_monthly_info
-- ----------------------------
INSERT INTO `atte_archive_monthly_info` VALUES ('1240302168385384448', 1240302168376995840, 'itcast', '9002', '13800000002', NULL, 'test1', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '3', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0', '1', NULL, '3', '21.75', NULL, NULL, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, '1063705989926227968', '201908');
INSERT INTO `atte_archive_monthly_info` VALUES ('1240302168406355968', 1240302168376995840, 'zbz', '111', '13800000003', NULL, '测试部', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0', '1', NULL, '0', '21.75', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '1066370498633486336', '201908');
INSERT INTO `atte_archive_monthly_info` VALUES ('1240302168435716096', 1240302168376995840, 'll', '1111', '13800000004', NULL, '测试部', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0', '1', NULL, '1', '21.75', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, '1071632760222810112', '201908');
INSERT INTO `atte_archive_monthly_info` VALUES ('1240302168460881920', 1240302168376995840, 'a01', '1001', '13400000001', NULL, '开发部', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '2', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0', '1', NULL, '2', '21.75', NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, '1074238801330704384', '201908');
INSERT INTO `atte_archive_monthly_info` VALUES ('1240302168481853440', 1240302168376995840, 'a02', '1002', '13400000002', NULL, '开发部', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0', '1', NULL, '1', '21.75', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, '1074238801402007552', '201908');
INSERT INTO `atte_archive_monthly_info` VALUES ('1240302168507019264', 1240302168376995840, 'test001', '2001', '13500000001', NULL, '开发部', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0', '1', NULL, '1', '21.75', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, '1075383133106425856', '201908');
INSERT INTO `atte_archive_monthly_info` VALUES ('1240302168536379392', 1240302168376995840, 'test002', '2002', '13500000002', NULL, '开发部', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '1', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0', '1', NULL, '1', '21.75', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, '1075383135371350016', '201908');
INSERT INTO `atte_archive_monthly_info` VALUES ('1240302168569933824', 1240302168376995840, 'test003', '2003', '13500000003', NULL, '开发部', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '0', '1', NULL, '0', '21.75', NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, '1075383135459430400', '201908');

-- ----------------------------
-- Table structure for atte_attendance
-- ----------------------------
DROP TABLE IF EXISTS `atte_attendance`;
CREATE TABLE `atte_attendance`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `user_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司ID',
  `department_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `adt_statu` int(20) NULL DEFAULT NULL COMMENT '考情状态 1正常2旷工3迟到4早退5外出6出差7年假8事假9病假10婚假11丧假12产假13奖励产假14陪产假15探亲假16工伤假17调休18产检假19流产假20长期病假21测试架22补签23休息',
  `job_statu` int(20) NULL DEFAULT NULL COMMENT '职位状态 1在职2离职',
  `adt_in_time` datetime(0) NULL DEFAULT NULL COMMENT '上班考勤时间',
  `adt_in_place` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考勤地点',
  `adt_in_hourse` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考勤办公室',
  `adt_in_coordinate` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考勤坐标',
  `adt_out_time` datetime(0) NULL DEFAULT NULL COMMENT '下班考勤时间',
  `adt_out_place` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下班考情地点',
  `adt_out_hourse` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考勤办公室',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `day` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考勤表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of atte_attendance
-- ----------------------------
INSERT INTO `atte_attendance` VALUES ('1239450647867224064', '1063705989926227968', '1', '1066241293639880704', 23, 0, '2019-07-01 08:30:00', NULL, NULL, NULL, '2019-07-01 18:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20190701');
INSERT INTO `atte_attendance` VALUES ('1239450648215351296', '1063705989926227968', '1', '1066241293639880704', 23, 0, '2019-07-02 10:30:00', NULL, NULL, NULL, '2019-07-02 18:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20190702');
INSERT INTO `atte_attendance` VALUES ('1239450648253100032', '1063705989926227968', '1', '1066241293639880704', 23, 0, '2019-07-03 08:30:00', NULL, NULL, NULL, '2019-07-03 00:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20190703');
INSERT INTO `atte_attendance` VALUES ('1239851463501434880', '1071632760222810112', NULL, '1063678149528784896', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20190803');
INSERT INTO `atte_attendance` VALUES ('1240229545186004992', '1063705989926227968', NULL, '1066241293639880704', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20190801');
INSERT INTO `atte_attendance` VALUES ('1240229555856314368', '1063705989926227968', NULL, '1066241293639880704', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20190802');
INSERT INTO `atte_attendance` VALUES ('1240229570364411904', '1063705989926227968', NULL, '1066241293639880704', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20190803');
INSERT INTO `atte_attendance` VALUES ('1240229585090613248', '1074238801330704384', NULL, '1066240656856453120', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20190801');
INSERT INTO `atte_attendance` VALUES ('1240229595849003008', '1074238801402007552', NULL, '1066240656856453120', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20190801');
INSERT INTO `atte_attendance` VALUES ('1240230038771699712', '1075383133106425856', NULL, '1066240656856453120', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20190801');
INSERT INTO `atte_attendance` VALUES ('1240277535913275392', '1074238801330704384', NULL, '1066240656856453120', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20190803');
INSERT INTO `atte_attendance` VALUES ('1240277548483604480', '1075383135371350016', NULL, '1066240656856453120', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20190806');

-- ----------------------------
-- Table structure for atte_attendance_config
-- ----------------------------
DROP TABLE IF EXISTS `atte_attendance_config`;
CREATE TABLE `atte_attendance_config`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司ID',
  `department_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `morning_start_time` time(0) NULL DEFAULT NULL COMMENT '上午打卡时间',
  `morning_end_time` time(0) NULL DEFAULT NULL COMMENT '上午打卡时间',
  `afternoon_start_time` time(0) NULL DEFAULT NULL COMMENT '下午打卡时间',
  `afternoon_end_time` time(0) NULL DEFAULT NULL COMMENT '下午打卡时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `company_id`(`company_id`, `department_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考勤配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of atte_attendance_config
-- ----------------------------
INSERT INTO `atte_attendance_config` VALUES ('1151027364784902144', '1', '1', '09:00:00', '12:00:00', '14:00:00', '18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `atte_attendance_config` VALUES ('1153841670090002432', '1', '1063676045212913664', '08:45:00', '11:00:00', '14:00:00', '17:30:00', '1063705989926227968', NULL, '1063705989926227968', '2019-08-25 23:36:40', NULL);
INSERT INTO `atte_attendance_config` VALUES ('1153868482937491456', '1', '1066240303092076544', '09:00:00', '13:00:00', '14:00:00', '18:00:00', '1063705989926227968', NULL, NULL, '2019-07-24 11:24:19', NULL);
INSERT INTO `atte_attendance_config` VALUES ('1153870761333755904', '1', '1066240656856453120', '09:00:00', '13:00:00', '14:00:00', '18:00:00', '1063705989926227968', NULL, '1063705989926227968', '2019-07-24 11:36:49', NULL);
INSERT INTO `atte_attendance_config` VALUES ('1156143291830505472', '1', '1063678149528784896', '08:00:00', '12:00:00', '13:00:00', '18:00:00', '1063705989926227968', NULL, '1063705989926227968', '2019-07-30 18:03:36', NULL);

-- ----------------------------
-- Table structure for atte_company_settings
-- ----------------------------
DROP TABLE IF EXISTS `atte_company_settings`;
CREATE TABLE `atte_company_settings`  (
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `is_settings` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0是未设置，1是已设置',
  `data_month` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当前显示报表月份',
  PRIMARY KEY (`company_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考勤-企业设置信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of atte_company_settings
-- ----------------------------
INSERT INTO `atte_company_settings` VALUES ('1', 1, '201907');

-- ----------------------------
-- Table structure for atte_day_off_config
-- ----------------------------
DROP TABLE IF EXISTS `atte_day_off_config`;
CREATE TABLE `atte_day_off_config`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司ID',
  `department_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `latest_effect_date` datetime(0) NULL DEFAULT NULL COMMENT '调休最后有效日期',
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调休单位(天最小0.5)',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `company_id`(`company_id`, `department_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调休配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of atte_day_off_config
-- ----------------------------
INSERT INTO `atte_day_off_config` VALUES ('1154295071588356096', '1', '1063676045212913664', '2020-07-31 00:00:00', '0.5', '1063705989926227968', '2019-07-25 15:39:25', '1063705989926227968', '2019-08-26 00:20:37', NULL);
INSERT INTO `atte_day_off_config` VALUES ('1156399736517955584', '1', '1066238836272664576', '2020-07-30 00:00:00', '1', '1063705989926227968', '2019-07-31 11:02:37', NULL, NULL, NULL);
INSERT INTO `atte_day_off_config` VALUES ('1156402186050211840', '1', '1063678149528784896', '2020-07-30 00:00:00', '1', '1063705989926227968', '2019-07-31 11:12:21', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for atte_deduction_dict
-- ----------------------------
DROP TABLE IF EXISTS `atte_deduction_dict`;
CREATE TABLE `atte_deduction_dict`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司ID',
  `department_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `ded_type_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扣款类型编码',
  `period_lower_limit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间段下限',
  `period_upper_limit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间段上限',
  `times_lower_limit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '次数下限',
  `times_upper_limit` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '次数上限',
  `ded_amonut_lower_limit` decimal(20, 0) NULL DEFAULT NULL COMMENT '扣款金额下限',
  `ded_amonut_upper_limit` decimal(20, 0) NULL DEFAULT NULL COMMENT '扣款金额上限',
  `absence_times_upper_limt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旷工次数上限',
  `absence_days` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旷工天数',
  `fine_salary_multiples` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '罚款工资倍数',
  `is_absenteeism` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否旷工0不旷工1旷工',
  `is_enable` int(20) NULL DEFAULT NULL COMMENT '是否可用 0开启 1 关闭',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `company_id`(`company_id`, `department_id`, `ded_type_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '扣款字典表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of atte_deduction_dict
-- ----------------------------
INSERT INTO `atte_deduction_dict` VALUES ('1154209434302550016', '1', '1', '53000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '1063705989926227968', '2019-07-25 09:59:08', '1063705989926227968', '2019-07-26 11:06:12', NULL);
INSERT INTO `atte_deduction_dict` VALUES ('1154230672265711616', '1', '1063678149528784896', '51000', '30', '30', '2', '2', 30, 0, '0.5', '0.5', '2', NULL, 0, '1063705989926227968', '2019-07-25 11:23:31', '1063705989926227968', '2019-07-25 11:41:05', NULL);
INSERT INTO `atte_deduction_dict` VALUES ('1154230672286683136', '1', '1063678149528784896', '52000', '30', '30', '2', '2', 30, 0, '0.5', '0.5', '2', NULL, 0, '1063705989926227968', '2019-07-25 11:23:31', '1063705989926227968', '2019-07-25 11:41:05', NULL);
INSERT INTO `atte_deduction_dict` VALUES ('1154230672303460352', '1', '1063678149528784896', '53000', '30', '30', '2', '2', 30, 0, '0', '0.5', '2', NULL, 1, '1063705989926227968', '2019-07-25 11:23:32', '1063705989926227968', '2019-07-25 11:41:05', NULL);
INSERT INTO `atte_deduction_dict` VALUES ('1156143748606988288', '1', '1063676045212913664', '51000', '30', '30', '2', '2', 30, 0, '0.5', '0.5', '2', NULL, 1, '1063705989926227968', '2019-07-30 18:05:24', '1063705989926227968', '2019-08-25 23:37:15', NULL);
INSERT INTO `atte_deduction_dict` VALUES ('1156143748653125632', '1', '1063676045212913664', '52000', '30', '30', '2', '2', 30, 0, '0.5', '0.5', '2', NULL, 1, '1063705989926227968', '2019-07-30 18:05:24', '1063705989926227968', '2019-08-25 23:37:15', NULL);
INSERT INTO `atte_deduction_dict` VALUES ('1156143748669902848', '1', '1063676045212913664', '53000', '30', '30', '2', '2', 30, 0, '0', '0.5', '2', NULL, 1, '1063705989926227968', '2019-07-30 18:05:24', '1063705989926227968', '2019-08-25 23:37:15', NULL);
INSERT INTO `atte_deduction_dict` VALUES ('1156385060732145664', '1', '1066238836272664576', '51000', '30', '30', '2', '2', 30, 0, '0.5', '0.5', '2', NULL, 1, '1063705989926227968', '2019-07-31 10:04:18', NULL, NULL, NULL);
INSERT INTO `atte_deduction_dict` VALUES ('1156385060807643136', '1', '1066238836272664576', '52000', '30', '30', '2', '2', 30, 0, '0.5', '0.5', '2', NULL, 0, '1063705989926227968', '2019-07-31 10:04:18', NULL, NULL, NULL);
INSERT INTO `atte_deduction_dict` VALUES ('1156385060824420352', '1', '1066238836272664576', '53000', '30', '30', '2', '2', 30, 0, '0', '0.5', '2', NULL, 0, '1063705989926227968', '2019-07-31 10:04:18', NULL, NULL, NULL);
INSERT INTO `atte_deduction_dict` VALUES ('1156399331587264512', '1', '1066240303092076544', '51000', '30', '30', '2', '2', 30, 0, '0.5', '0.5', '2', NULL, 0, '1063705989926227968', '2019-07-31 11:01:00', NULL, NULL, NULL);
INSERT INTO `atte_deduction_dict` VALUES ('1156399331776008192', '1', '1066240303092076544', '52000', '30', '30', '2', '2', 30, 0, '0.5', '0.5', '2', NULL, 1, '1063705989926227968', '2019-07-31 11:01:00', NULL, NULL, NULL);
INSERT INTO `atte_deduction_dict` VALUES ('1156399331801174016', '1', '1066240303092076544', '53000', '30', '30', '2', '2', 30, 0, '0', '0.5', '2', NULL, 1, '1063705989926227968', '2019-07-31 11:01:00', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for atte_deduction_type
-- ----------------------------
DROP TABLE IF EXISTS `atte_deduction_type`;
CREATE TABLE `atte_deduction_type`  (
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扣款类型编码',
  `description` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扣款类型编码说明',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '扣款类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of atte_deduction_type
-- ----------------------------

-- ----------------------------
-- Table structure for atte_extra_duty_config
-- ----------------------------
DROP TABLE IF EXISTS `atte_extra_duty_config`;
CREATE TABLE `atte_extra_duty_config`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司ID',
  `department_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `work_hours_day` int(20) NULL DEFAULT NULL COMMENT '每日标准工作时长，单位小时',
  `is_clock` int(20) NULL DEFAULT NULL COMMENT '是否打卡0开启1关闭',
  `is_compensationint` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否开启加班补偿0开启1关闭',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `company_id`(`company_id`, `department_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '加班配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of atte_extra_duty_config
-- ----------------------------
INSERT INTO `atte_extra_duty_config` VALUES ('1151307541096042496', '1', '1', NULL, 0, '0', NULL, NULL, '1063705989926227968', '2019-07-17 18:02:11', NULL);
INSERT INTO `atte_extra_duty_config` VALUES ('1154295071408001024', '1', '1063676045212913664', NULL, 0, '1', '1063705989926227968', '2019-07-25 15:39:25', '1063705989926227968', '2019-08-26 00:20:37', NULL);
INSERT INTO `atte_extra_duty_config` VALUES ('1156399736442458112', '1', '1066238836272664576', NULL, 1, '1', '1063705989926227968', '2019-07-31 11:02:37', NULL, NULL, NULL);
INSERT INTO `atte_extra_duty_config` VALUES ('1156402185991491584', '1', '1063678149528784896', NULL, 1, '1', '1063705989926227968', '2019-07-31 11:12:21', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for atte_extra_duty_rule
-- ----------------------------
DROP TABLE IF EXISTS `atte_extra_duty_rule`;
CREATE TABLE `atte_extra_duty_rule`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `extra_duty_config_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加班配置ID',
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司ID',
  `department_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `rule` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则内容',
  `rule_start_time` time(0) NULL DEFAULT NULL COMMENT '规则生效每日开始时间',
  `rule_end_time` time(0) NULL DEFAULT NULL COMMENT '规则生效每日结束时间',
  `is_time_off` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否调休0不调休1调休',
  `is_enable` int(10) NULL DEFAULT NULL COMMENT '是否可用 0开启 1 关闭',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '加班规则' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of atte_extra_duty_rule
-- ----------------------------
INSERT INTO `atte_extra_duty_rule` VALUES ('1156399736488595456', '1156399736442458112', '1', '1066238836272664576', '工作日可申请加班', '08:00:00', '12:00:00', '0', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `atte_extra_duty_rule` VALUES ('1156399736488595457', '1156399736442458112', '1', '1066238836272664576', '休息日可申请加班', '00:00:00', '00:00:00', '1', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `atte_extra_duty_rule` VALUES ('1156399736488595458', '1156399736442458112', '1', '1066238836272664576', '法定节假日可申请加班', '00:00:00', '00:00:00', '0', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `atte_extra_duty_rule` VALUES ('1156402186025046016', '1156402185991491584', '1', '1063678149528784896', '工作日可申请加班', '00:00:00', '00:00:00', '1', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `atte_extra_duty_rule` VALUES ('1156402186025046017', '1156402185991491584', '1', '1063678149528784896', '休息日可申请加班', '00:00:00', '00:00:00', '1', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `atte_extra_duty_rule` VALUES ('1156402186025046018', '1156402185991491584', '1', '1063678149528784896', '法定节假日可申请加班', '00:00:00', '00:00:00', '1', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `atte_extra_duty_rule` VALUES ('1165660260615196672', '1154295071408001024', '1', '1063676045212913664', '工作日可申请加班', '08:00:00', '12:00:00', '0', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `atte_extra_duty_rule` VALUES ('1165660260615196673', '1154295071408001024', '1', '1063676045212913664', '休息日可申请加班', '13:00:00', '18:00:00', '1', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `atte_extra_duty_rule` VALUES ('1165660260615196674', '1154295071408001024', '1', '1063676045212913664', '法定节假日可申请加班', '18:00:00', '22:00:00', '1', 1, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for atte_leave_config
-- ----------------------------
DROP TABLE IF EXISTS `atte_leave_config`;
CREATE TABLE `atte_leave_config`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司ID',
  `department_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `leave_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请假类型',
  `is_enable` int(10) NULL DEFAULT NULL COMMENT '是否可用 0开启 1 关闭',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `company_id`(`company_id`, `department_id`, `leave_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '请假配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of atte_leave_config
-- ----------------------------
INSERT INTO `atte_leave_config` VALUES ('1156389636130607104', '1', '1063678149528784896', 'REWARD_MATERNITY_LEAVE', 1, '1063705989926227968', '2019-07-31 10:22:29', '1063705989926227968', '2019-07-31 10:57:37', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389636151578624', '1', '1063678149528784896', 'FUNERAL_LEAVE', 1, '1063705989926227968', '2019-07-31 10:22:29', '1063705989926227968', '2019-07-31 10:57:37', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389636172550144', '1', '1063678149528784896', 'MATERNITY_LEAVE', 1, '1063705989926227968', '2019-07-31 10:22:29', '1063705989926227968', '2019-07-31 10:57:37', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389636214493184', '1', '1063678149528784896', 'PATERNITY_LEAVE', 1, '1063705989926227968', '2019-07-31 10:22:29', '1063705989926227968', '2019-07-31 10:57:37', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389636227076096', '1', '1063678149528784896', 'HOME_LEAVE', 1, '1063705989926227968', '2019-07-31 10:22:29', '1063705989926227968', '2019-07-31 10:57:37', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389636243853312', '1', '1063678149528784896', 'ACCIDENTIAL_LEAVE', 1, '1063705989926227968', '2019-07-31 10:22:29', '1063705989926227968', '2019-07-31 10:57:37', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389636260630528', '1', '1063678149528784896', 'DAY_OFF_LEAVE', 1, '1063705989926227968', '2019-07-31 10:22:29', '1063705989926227968', '2019-07-31 10:57:37', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389636281602048', '1', '1063678149528784896', 'DOCTOR_OFF_LEAVE', 1, '1063705989926227968', '2019-07-31 10:22:29', '1063705989926227968', '2019-07-31 10:57:37', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389636298379264', '1', '1063678149528784896', 'ABORTION_LEAVE', 1, '1063705989926227968', '2019-07-31 10:22:29', '1063705989926227968', '2019-07-31 10:57:37', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389636310962176', '1', '1063678149528784896', 'LONG_SICK_LEAVE', 1, '1063705989926227968', '2019-07-31 10:22:29', '1063705989926227968', '2019-07-31 10:57:37', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389636323545088', '1', '1063678149528784896', 'TEST_LEAVE', 1, '1063705989926227968', '2019-07-31 10:22:29', '1063705989926227968', '2019-07-31 10:57:37', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389826736558080', '1', '1066239766607040512', 'YEAR_LEAVE', 0, '1063705989926227968', '2019-07-31 10:23:14', '1063705989926227968', '2019-07-31 10:52:33', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389826749140992', '1', '1066239766607040512', 'LEAVE', 0, '1063705989926227968', '2019-07-31 10:23:14', '1063705989926227968', '2019-07-31 10:52:33', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389826757529600', '1', '1066239766607040512', 'SICK_LEAVE', 0, '1063705989926227968', '2019-07-31 10:23:14', '1063705989926227968', '2019-07-31 10:52:33', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389826770112512', '1', '1066239766607040512', 'REWARD_MATERNITY_LEAVE', 1, '1063705989926227968', '2019-07-31 10:23:14', '1063705989926227968', '2019-07-31 10:52:33', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389826778501120', '1', '1066239766607040512', 'FUNERAL_LEAVE', 1, '1063705989926227968', '2019-07-31 10:23:14', '1063705989926227968', '2019-07-31 10:52:33', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389826786889728', '1', '1066239766607040512', 'MATERNITY_LEAVE', 1, '1063705989926227968', '2019-07-31 10:23:14', '1063705989926227968', '2019-07-31 10:52:33', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389826803666944', '1', '1066239766607040512', 'PATERNITY_LEAVE', 1, '1063705989926227968', '2019-07-31 10:23:14', '1063705989926227968', '2019-07-31 10:52:33', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389826812055552', '1', '1066239766607040512', 'HOME_LEAVE', 1, '1063705989926227968', '2019-07-31 10:23:14', '1063705989926227968', '2019-07-31 10:52:33', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389826816249856', '1', '1066239766607040512', 'ACCIDENTIAL_LEAVE', 1, '1063705989926227968', '2019-07-31 10:23:14', '1063705989926227968', '2019-07-31 10:52:33', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389826824638464', '1', '1066239766607040512', 'DAY_OFF_LEAVE', 1, '1063705989926227968', '2019-07-31 10:23:14', '1063705989926227968', '2019-07-31 10:25:47', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389826833027072', '1', '1066239766607040512', 'DOCTOR_OFF_LEAVE', 1, '1063705989926227968', '2019-07-31 10:23:14', '1063705989926227968', '2019-07-31 10:25:47', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389826837221376', '1', '1066239766607040512', 'ABORTION_LEAVE', 1, '1063705989926227968', '2019-07-31 10:23:14', '1063705989926227968', '2019-07-31 10:25:47', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389826845609984', '1', '1066239766607040512', 'LONG_SICK_LEAVE', 1, '1063705989926227968', '2019-07-31 10:23:14', '1063705989926227968', '2019-07-31 10:25:47', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156389826853998592', '1', '1066239766607040512', 'TEST_LEAVE', 1, '1063705989926227968', '2019-07-31 10:23:14', '1063705989926227968', '2019-07-31 10:25:47', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156394014753296384', '1', '1063676045212913664', 'YEAR_LEAVE', 0, '1063705989926227968', '2019-07-31 10:39:53', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156394014971400192', '1', '1063676045212913664', 'LEAVE', 1, '1063705989926227968', '2019-07-31 10:39:53', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156394015004954624', '1', '1063676045212913664', 'SICK_LEAVE', 0, '1063705989926227968', '2019-07-31 10:39:53', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156394015038509056', '1', '1063676045212913664', 'MARRAIAGE_LEAVE', 0, '1063705989926227968', '2019-07-31 10:39:53', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156394015072063488', '1', '1063676045212913664', 'FUNERAL_LEAVE', 0, '1063705989926227968', '2019-07-31 10:39:53', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156394015105617920', '1', '1063676045212913664', 'MATERNITY_LEAVE', 1, '1063705989926227968', '2019-07-31 10:39:53', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156394015122395136', '1', '1063676045212913664', 'REWARD_MATERNITY_LEAVE', 1, '1063705989926227968', '2019-07-31 10:39:53', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156394015143366656', '1', '1063676045212913664', 'PATERNITY_LEAVE', 1, '1063705989926227968', '2019-07-31 10:39:53', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156394015164338176', '1', '1063676045212913664', 'HOME_LEAVE', 1, '1063705989926227968', '2019-07-31 10:39:53', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156394015181115392', '1', '1063676045212913664', 'ACCIDENTIAL_LEAVE', 1, '1063705989926227968', '2019-07-31 10:39:53', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156394299437486080', '1', '1063678149528784896', 'YEAR_LEAVE', 0, '1063705989926227968', '2019-07-31 10:41:00', '1063705989926227968', '2019-07-31 10:57:37', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156394299466846208', '1', '1063678149528784896', 'LEAVE', 1, '1063705989926227968', '2019-07-31 10:41:00', '1063705989926227968', '2019-07-31 10:57:37', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156394299496206336', '1', '1063678149528784896', 'SICK_LEAVE', 0, '1063705989926227968', '2019-07-31 10:41:00', '1063705989926227968', '2019-07-31 10:57:37', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156394299525566464', '1', '1063678149528784896', 'MARRAIAGE_LEAVE', 1, '1063705989926227968', '2019-07-31 10:41:00', '1063705989926227968', '2019-07-31 10:57:37', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395012125233152', '1', '1066238836272664576', 'YEAR_LEAVE', 0, '1063705989926227968', '2019-07-31 10:43:50', '1063705989926227968', '2019-07-31 10:51:53', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395012150398976', '1', '1066238836272664576', 'LEAVE', 0, '1063705989926227968', '2019-07-31 10:43:50', '1063705989926227968', '2019-07-31 10:51:53', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395012171370496', '1', '1066238836272664576', 'SICK_LEAVE', 1, '1063705989926227968', '2019-07-31 10:43:50', '1063705989926227968', '2019-07-31 10:51:53', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395012192342016', '1', '1066238836272664576', 'MARRAIAGE_LEAVE', 0, '1063705989926227968', '2019-07-31 10:43:50', '1063705989926227968', '2019-07-31 10:51:53', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395012213313536', '1', '1066238836272664576', 'FUNERAL_LEAVE', 1, '1063705989926227968', '2019-07-31 10:43:50', '1063705989926227968', '2019-07-31 10:51:53', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395012234285056', '1', '1066238836272664576', 'MATERNITY_LEAVE', 0, '1063705989926227968', '2019-07-31 10:43:50', '1063705989926227968', '2019-07-31 10:51:53', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395012255256576', '1', '1066238836272664576', 'REWARD_MATERNITY_LEAVE', 1, '1063705989926227968', '2019-07-31 10:43:50', '1063705989926227968', '2019-07-31 10:51:53', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395012267839488', '1', '1066238836272664576', 'PATERNITY_LEAVE', 1, '1063705989926227968', '2019-07-31 10:43:50', '1063705989926227968', '2019-07-31 10:51:53', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395012280422400', '1', '1066238836272664576', 'HOME_LEAVE', 1, '1063705989926227968', '2019-07-31 10:43:50', '1063705989926227968', '2019-07-31 10:51:53', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395012293005312', '1', '1066238836272664576', 'ACCIDENTIAL_LEAVE', 1, '1063705989926227968', '2019-07-31 10:43:50', '1063705989926227968', '2019-07-31 10:51:53', NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395240492503040', '1', '1066239913642561536', 'YEAR_LEAVE', 0, '1063705989926227968', '2019-07-31 10:44:45', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395240513474560', '1', '1066239913642561536', 'LEAVE', 0, '1063705989926227968', '2019-07-31 10:44:45', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395240534446080', '1', '1066239913642561536', 'SICK_LEAVE', 1, '1063705989926227968', '2019-07-31 10:44:45', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395240559611904', '1', '1066239913642561536', 'MARRAIAGE_LEAVE', 1, '1063705989926227968', '2019-07-31 10:44:45', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395240584777728', '1', '1066239913642561536', 'FUNERAL_LEAVE', 1, '1063705989926227968', '2019-07-31 10:44:45', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395240605749248', '1', '1066239913642561536', 'MATERNITY_LEAVE', 1, '1063705989926227968', '2019-07-31 10:44:45', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395240618332160', '1', '1066239913642561536', 'REWARD_MATERNITY_LEAVE', 1, '1063705989926227968', '2019-07-31 10:44:45', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395240630915072', '1', '1066239913642561536', 'PATERNITY_LEAVE', 1, '1063705989926227968', '2019-07-31 10:44:45', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395240643497984', '1', '1066239913642561536', 'HOME_LEAVE', 1, '1063705989926227968', '2019-07-31 10:44:45', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156395240660275200', '1', '1066239913642561536', 'ACCIDENTIAL_LEAVE', 1, '1063705989926227968', '2019-07-31 10:44:45', NULL, NULL, NULL);
INSERT INTO `atte_leave_config` VALUES ('1156397203233837056', '1', '1066239766607040512', 'MARRAIAGE_LEAVE', 0, '1063705989926227968', '2019-07-31 10:52:33', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for bs_city
-- ----------------------------
DROP TABLE IF EXISTS `bs_city`;
CREATE TABLE `bs_city`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bs_city
-- ----------------------------
INSERT INTO `bs_city` VALUES ('1084825908823904256', '北京', NULL);

-- ----------------------------
-- Table structure for bs_month
-- ----------------------------
DROP TABLE IF EXISTS `bs_month`;
CREATE TABLE `bs_month`  (
  `month` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bs_month
-- ----------------------------
INSERT INTO `bs_month` VALUES ('01');
INSERT INTO `bs_month` VALUES ('02');
INSERT INTO `bs_month` VALUES ('03');
INSERT INTO `bs_month` VALUES ('04');
INSERT INTO `bs_month` VALUES ('05');
INSERT INTO `bs_month` VALUES ('06');
INSERT INTO `bs_month` VALUES ('07');
INSERT INTO `bs_month` VALUES ('08');
INSERT INTO `bs_month` VALUES ('09');
INSERT INTO `bs_month` VALUES ('10');
INSERT INTO `bs_month` VALUES ('11');
INSERT INTO `bs_month` VALUES ('12');

-- ----------------------------
-- Table structure for bs_permission
-- ----------------------------
DROP TABLE IF EXISTS `bs_permission`;
CREATE TABLE `bs_permission`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `administrator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `management_module` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bs_permission
-- ----------------------------

-- ----------------------------
-- Table structure for bs_user
-- ----------------------------
DROP TABLE IF EXISTS `bs_user`;
CREATE TABLE `bs_user`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `mobile` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号码',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `enable_state` int(2) NULL DEFAULT 1 COMMENT '启用状态 0是禁用，1是启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `department_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `time_of_entry` datetime(0) NULL DEFAULT NULL COMMENT '入职时间',
  `form_of_employment` int(1) NULL DEFAULT NULL COMMENT '聘用形式',
  `work_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `form_of_management` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理形式',
  `working_city` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作城市',
  `correction_time` datetime(0) NULL DEFAULT NULL COMMENT '转正时间',
  `in_service_status` int(1) NULL DEFAULT NULL COMMENT '在职状态 1.在职  2.离职',
  `company_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `company_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `department_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户级别：saasAdmin，coAdmin，user',
  `staff_photo` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `time_of_dimission` datetime(0) NULL DEFAULT NULL COMMENT '离职时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_phone`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bs_user
-- ----------------------------
INSERT INTO `bs_user` VALUES ('1063705482939731968', '13800000001', 'saas-Kuky', '88012a09484c94fcec9e65b2377c44b9', NULL, '2018-11-17 16:08:44', '', '2018-11-01 08:00:00', 1, '', NULL, NULL, '2018-11-01 00:00:00', 0, '', '', '', 'saasAdmin', NULL, NULL);
INSERT INTO `bs_user` VALUES ('1063705989926227968', '13800000002', 'co-Kuky', 'c8b7722b1139bb9b346409e503302e82', 1, '2018-11-17 16:10:45', '1175310929766055936', '2018-11-02 08:00:00', 1, '9002', NULL, NULL, '2018-11-30 00:00:00', 0, '1', '微启明创网络商务中心', '总裁办', 'coAdmin', 'http://rdpzpf4g4.hn-bkt.clouddn.com/1063705989926227968.jpg', '2019-08-17 16:10:45');
INSERT INTO `bs_user` VALUES ('1066370498633486336', '13800000003', 'user-Kuky', '14af10ffa3798486632a79cbbf469376', 1, NULL, '1175311213774962688', '2018-11-04 08:00:00', 1, '666666', NULL, '广东', '2018-11-20 00:00:00', 0, '1', '微启明创网络商务中心', '行政部', 'user', 'http://rdpzpf4g4.hn-bkt.clouddn.com/1066370498633486336.jpg', '2022-06-30 00:03:08');
INSERT INTO `bs_user` VALUES ('1071632760222810112', '13800000004', '小张', '456134d471010ecba14c6f89cac349ff', 1, NULL, '1175311267684352000', '2018-12-02 08:00:00', 1, '1111', NULL, NULL, '2018-12-31 00:00:00', 0, '1', '微启明创网络商务中心', '人事部', 'user', NULL, NULL);
INSERT INTO `bs_user` VALUES ('1074238801330704384', '13400000001', '小明', '80069fc2872ce3cf269053f4a84b2f0d', 1, '2018-12-16 17:44:22', '1175311466846683136', '2018-01-01 00:00:00', 1, '1001', NULL, NULL, NULL, 1, '1', '微启明创网络商务中心', '市场部', 'user', NULL, NULL);
INSERT INTO `bs_user` VALUES ('1074238801402007552', '13400000002', '小红', 'a4f6437f96466ff2ad41dc8c46317e7f', 1, '2018-12-16 17:44:23', '1175311325720936448', '2018-01-01 00:00:00', 1, '1002', NULL, NULL, NULL, 1, '1', '微启明创网络商务中心', '财务部', 'user', NULL, NULL);
INSERT INTO `bs_user` VALUES ('1075383133106425856', '13500000001', '张艺兴', 'c8b7722b1139bb9b346409e503302e82', 1, NULL, '1175311373083017216', '2018-01-01 00:00:00', 1, '2001', NULL, NULL, NULL, 1, '1', '微启明创网络商务中心', '技术部', 'user', NULL, NULL);
INSERT INTO `bs_user` VALUES ('1075383135371350016', '13500000002', '聂军林', 'becc21ed8df7975fc845c6c70f46c2dd', 1, NULL, '1175311418004013056', '2018-01-01 00:00:00', 1, '2002', NULL, NULL, NULL, 1, '1', '微启明创网络商务中心', '运营部', 'user', NULL, NULL);
INSERT INTO `bs_user` VALUES ('1075383135459430400', '13500000003', '何光林', '7321b9c9cfaa938abc7408147fc29441', 1, NULL, '1175311466846683136', '2018-01-01 00:00:00', 1, '2003', NULL, NULL, NULL, 1, '1', '微启明创网络商务中心', '市场部', 'user', NULL, NULL);
INSERT INTO `bs_user` VALUES ('1538172085556285440', '1334223123', '小李', 'ccde2864d8f57c6863070691af22db6a', 1, NULL, '1175311373083017216', '2022-06-08 08:00:00', 1, '2313123', NULL, NULL, '2022-06-09 00:00:00', NULL, '1', '微启明创网络商务中心', '技术部', 'user', NULL, NULL);
INSERT INTO `bs_user` VALUES ('1538174539098296320', '2323424', '小妹', 'dffee8800ec97ab0b84a76c376f6ef53', 1, NULL, '1175311213774962688', '2022-06-01 08:00:00', 1, '34242', NULL, NULL, '2022-06-21 00:00:00', NULL, '1', '微启明创网络商务中心', '行政部', 'user', NULL, NULL);

-- ----------------------------
-- Table structure for co_company
-- ----------------------------
DROP TABLE IF EXISTS `co_company`;
CREATE TABLE `co_company`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `manager_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业登录账号ID',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前版本',
  `renewal_date` datetime(0) NULL DEFAULT NULL COMMENT '续期时间',
  `expiration_date` datetime(0) NULL DEFAULT NULL COMMENT '到期时间',
  `company_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司地区',
  `company_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '公司地址',
  `business_license_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '营业执照-图片ID',
  `legal_representative` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法人代表',
  `company_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司电话',
  `mailbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `company_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司规模',
  `industry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属行业',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `audit_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核状态',
  `state` tinyint(2) NULL DEFAULT 1 COMMENT '状态',
  `balance` double NULL DEFAULT NULL COMMENT '当前余额',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of co_company
-- ----------------------------
INSERT INTO `co_company` VALUES ('1', '微启明创网络商务中心', 'abc', '12', NULL, NULL, NULL, '广东省佛山市南海区', NULL, '张三', '13336485124', '739663514@qq.coom', NULL, NULL, '备注信息', '0', 1, 0, '2018-11-07 13:30:05');

-- ----------------------------
-- Table structure for co_department
-- ----------------------------
DROP TABLE IF EXISTS `co_department`;
CREATE TABLE `co_department`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `pid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级部门ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门编码',
  `manager` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门负责人',
  `introduce` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '介绍',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `manager_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of co_department
-- ----------------------------
INSERT INTO `co_department` VALUES ('1175310929766055936', '1', '', '总裁办', 'ZCB', NULL, '总裁办公室', NULL, NULL);
INSERT INTO `co_department` VALUES ('1175311213774962688', '1', '', '行政部', 'XZB', NULL, NULL, NULL, NULL);
INSERT INTO `co_department` VALUES ('1175311267684352000', '1', '', '人事部', 'RSB', 'll', NULL, NULL, '1071632760222810112');
INSERT INTO `co_department` VALUES ('1175311325720936448', '1', '', '财务部', 'CWB', NULL, NULL, NULL, NULL);
INSERT INTO `co_department` VALUES ('1175311373083017216', '1', '', '技术部', 'JSB', NULL, NULL, NULL, NULL);
INSERT INTO `co_department` VALUES ('1175311418004013056', '1', '', '运营部', 'YYB', NULL, NULL, NULL, NULL);
INSERT INTO `co_department` VALUES ('1175311466846683136', '1', '', '市场部', 'SCB', 'a01', NULL, NULL, '1074238801330704384');

-- ----------------------------
-- Table structure for co_transaction_record
-- ----------------------------
DROP TABLE IF EXISTS `co_transaction_record`;
CREATE TABLE `co_transaction_record`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` int(2) NOT NULL,
  `amount` double NOT NULL,
  `balance` double NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of co_transaction_record
-- ----------------------------

-- ----------------------------
-- Table structure for em_archive
-- ----------------------------
DROP TABLE IF EXISTS `em_archive`;
CREATE TABLE `em_archive`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `op_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作用户',
  `month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '月份',
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `totals` int(8) NOT NULL DEFAULT 0 COMMENT '总人数',
  `payrolls` int(8) NOT NULL DEFAULT 0 COMMENT '在职人数',
  `departures` int(8) NOT NULL DEFAULT 0 COMMENT '离职人数',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of em_archive
-- ----------------------------

-- ----------------------------
-- Table structure for em_positive
-- ----------------------------
DROP TABLE IF EXISTS `em_positive`;
CREATE TABLE `em_positive`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '员工ID',
  `date_of_correction` datetime(0) NULL DEFAULT NULL COMMENT '转正日期',
  `correction_evaluation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '转正评价',
  `enclosure` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '附件',
  `estatus` int(2) NOT NULL COMMENT '单据状态 1是未执行，2是已执行',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of em_positive
-- ----------------------------
INSERT INTO `em_positive` VALUES ('1063705989926227968', '2018-12-23 08:00:00', '111', NULL, 1, '2018-12-15 21:45:10');

-- ----------------------------
-- Table structure for em_resignation
-- ----------------------------
DROP TABLE IF EXISTS `em_resignation`;
CREATE TABLE `em_resignation`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `resignation_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type_of_turnover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '离职类型',
  `reasons_for_leaving` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请离职原因',
  `compensation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补偿金',
  `notifications` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代通知金',
  `social_security_reduction_month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '社保减员月',
  `provident_fund_reduction_month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公积金减员月',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of em_resignation
-- ----------------------------
INSERT INTO `em_resignation` VALUES ('1063705989926227968', '2018-02-05', '主动离职', NULL, '100', '100', '离职日本月', '离职日次月', NULL, '2018-12-16 20:49:26');

-- ----------------------------
-- Table structure for em_transferposition
-- ----------------------------
DROP TABLE IF EXISTS `em_transferposition`;
CREATE TABLE `em_transferposition`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `post` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位',
  `rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职级',
  `reporting_object` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '汇报对象',
  `hrbp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'HRBP',
  `adjustment_time` datetime(0) NOT NULL COMMENT '调岗时间',
  `cause_of_adjusting_post` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '调岗原因',
  `enclosure` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '附件 [1,2,3]',
  `form_of_management` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理形式',
  `working_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作城市',
  `taxable_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '纳税城市',
  `current_contract_start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '现合同开始时间',
  `closing_time_of_current_contract` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '现合同结束时间',
  `working_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作地点',
  `initial_contract_start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首次合同开始时间',
  `first_contract_termination_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首次合同结束时间',
  `contract_period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同期限',
  `renewal_number` int(8) NULL DEFAULT NULL COMMENT '续签次数',
  `recommender_business_people` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐企业人',
  `estatus` int(2) NOT NULL COMMENT '单据状态 1是未执行，2是已执行',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of em_transferposition
-- ----------------------------
INSERT INTO `em_transferposition` VALUES ('1063705989926227968', '', '', '', '', '2018-12-03 08:00:00', 'aaaaa', '', '', '', '', '2018-12-03', '2018-12-04', '', '', '', '12月', 1, '', 1, '2018-12-15 22:01:08');

-- ----------------------------
-- Table structure for em_user_company
-- ----------------------------
DROP TABLE IF EXISTS `em_user_company`;
CREATE TABLE `em_user_company`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `department_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `time_of_entry` datetime(0) NULL DEFAULT NULL COMMENT '入职时间',
  `form_of_employment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '聘用形式',
  `work_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `form_of_management` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理形式',
  `working_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作城市',
  `correction_time` datetime(0) NULL DEFAULT NULL COMMENT '转正时间',
  `in_service_status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '在职状态 1.在职  2.离职',
  `state` tinyint(2) NOT NULL DEFAULT 1 COMMENT '启用状态',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of em_user_company
-- ----------------------------

-- ----------------------------
-- Table structure for em_user_company_jobs
-- ----------------------------
DROP TABLE IF EXISTS `em_user_company_jobs`;
CREATE TABLE `em_user_company_jobs`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '员工ID',
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `post` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '岗位',
  `work_mailbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作邮箱',
  `rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职级',
  `correction_evaluation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '转正评价',
  `report_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '汇报对象',
  `report_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `state_of_correction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转正状态',
  `hrbp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'hrbp',
  `working_time_for_the_first_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首次参加工作时间',
  `adjustment_agedays` int(8) NULL DEFAULT NULL COMMENT '调整司龄天',
  `adjustment_of_length_of_service` int(8) NULL DEFAULT NULL COMMENT '调整工龄天',
  `working_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作城市',
  `taxable_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '纳税城市',
  `current_contract_start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '现合同开始时间',
  `closing_time_of_current_contract` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '现合同结束时间',
  `initial_contract_start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首次合同开始时间',
  `first_contract_termination_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首次合同结束时间',
  `contract_period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同期限',
  `contract_documents` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同文件',
  `renewal_number` int(8) NULL DEFAULT NULL COMMENT '续签次数',
  `other_recruitment_channels` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其他招聘渠道',
  `recruitment_channels` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '招聘渠道',
  `social_recruitment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '社招校招',
  `recommender_business_people` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐企业人',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of em_user_company_jobs
-- ----------------------------
INSERT INTO `em_user_company_jobs` VALUES ('1063705989926227968', '1', '文员', 'hmykuky@aliyun2.com', 'P5', '该员工平时工作仔细、认真、负责,不但执行力强,且工作配合度也好,有积极向上的工作心态,能主动协助其他同事工作,并且能按时完成上级领导安排的相关工作!', NULL, NULL, NULL, '1066370498633486336', NULL, 1, NULL, '佛山', '佛山', '2018-12-25', '2018-12-21', '2018-12-03', '2018-12-04', '6月', NULL, 1, '拉勾网', '猎头', '社招', '百度');

-- ----------------------------
-- Table structure for em_user_company_personal
-- ----------------------------
DROP TABLE IF EXISTS `em_user_company_personal`;
CREATE TABLE `em_user_company_personal`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time_of_entry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `department_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司ID',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `date_of_birth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `the_highest_degree_of_education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最高学历',
  `national_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家地区',
  `passport_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护照号',
  `id_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `id_card_photo_positive` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证照片-正面',
  `id_card_photo_back` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证照片-背面',
  `native_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `nation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族',
  `english_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '英文名',
  `marital_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `staff_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工照片',
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生日',
  `zodiac` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属相',
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `constellation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星座',
  `blood_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '血型',
  `domicile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '户籍所在地',
  `political_outlook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `time_to_join_the_party` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入党时间',
  `archiving_organization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存档机构',
  `state_of_children` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子女状态',
  `do_children_have_commercial_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子女有无商业保险',
  `is_there_any_violation_of_law_or_discipline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有无违法违纪行为',
  `are_there_any_major_medical_histories` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有无重大病史',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `wechat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信',
  `residence_card_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住证城市',
  `date_of_residence_permit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住证办理日期',
  `residence_permit_deadline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住证截止日期',
  `place_of_residence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '现居住地',
  `postal_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通讯地址',
  `contact_the_mobile_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `personal_mailbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `emergency_contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急联系人',
  `emergency_contact_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '紧急联系电话',
  `social_security_computer_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '社保电脑号',
  `provident_fund_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公积金账号',
  `bank_card_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `opening_bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `educational_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学历类型',
  `graduate_school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '毕业学校',
  `enrolment_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入学时间',
  `graduation_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '毕业时间',
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业',
  `graduation_certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '毕业证书',
  `certificate_of_academic_degree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学位证书',
  `home_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上家公司',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职称',
  `resume` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简历',
  `is_there_any_competition_restriction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '有无竞业限制',
  `proof_of_departure_of_former_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前公司离职证明',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of em_user_company_personal
-- ----------------------------
INSERT INTO `em_user_company_personal` VALUES ('1', 'test1', '13000000001', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('101', 'test101', '13000000101', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('102', 'test102', '13000000102', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('103', 'test103', '13000000103', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('104', 'test104', '13000000104', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('105', 'test105', '13000000105', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('106', 'test106', '13000000106', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('1063705989926227955', 'a02', '13400000002', '2018-02-03', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('1063705989926227961', 'a02', '13400000002', '2018-02-03', '开发部', '1', '', '', '初中', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `em_user_company_personal` VALUES ('1063705989926227968', 'user-Kuky', '13800000002', '2018-11-02T00:00:00.000+0000', '开发部', '1', '女', '2019-07-30T16:00:00.000Z', '本科', '中国大陆', '5345323423', '1234567890', NULL, NULL, '四川省达州市', '汉族', 'Kuky', '未婚', 'http://rdpzpf4g4.hn-bkt.clouddn.com/1066370498633486336.jpg', NULL, NULL, '22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123', '123', '12', '333', NULL, '广东东软学院', NULL, '2022-06-30', '软件工程', NULL, NULL, '广州希音国际贸易公司', '异常员', NULL, NULL, NULL, 'very good！ 非常棒！');
INSERT INTO `em_user_company_personal` VALUES ('1066370498633486336', 'zbz', '13800000003', '2018-11-04T00:00:00.000+0000', '测试部', '1', NULL, NULL, '高中', '港澳台国外', 'xxxx', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'x1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `em_user_company_personal` VALUES ('107', 'test107', '13000000107', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('1071632760222810112', 'll', '13800000004', '2018-12-02T00:00:00.000+0000', '测试部', '1', NULL, NULL, NULL, NULL, '4110', '4110', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `em_user_company_personal` VALUES ('1074238801402007552', 'a02', '13400000002', '2018-02-01', '开发部', '1', NULL, NULL, '初中', '中国大陆', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `em_user_company_personal` VALUES ('1074238801402007555', 'a02', '13400000002', '2018-02-01', '开发部', '1', '', '', '初中', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `em_user_company_personal` VALUES ('108', 'test108', '13000000108', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('109', 'test109', '13000000109', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('11', 'test11', '13000000011', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('110', 'test110', '13000000110', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('12', 'test12', '13000000012', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('13', 'test13', '13000000013', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('14', 'test14', '13000000014', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('15', 'test15', '13000000015', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('16', 'test16', '13000000016', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('17', 'test17', '13000000017', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('18', 'test18', '13000000018', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('19', 'test19', '13000000019', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('2', 'test2', '13000000002', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('20', 'test20', '13000000020', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('21', 'test21', '13000000021', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('22', 'test22', '13000000022', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('23', 'test23', '13000000023', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('24', 'test24', '13000000024', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('25', 'test25', '13000000025', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('26', 'test26', '13000000026', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('27', 'test27', '13000000027', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('28', 'test28', '13000000028', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('29', 'test29', '13000000029', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('3', 'test3', '13000000003', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('30', 'test30', '13000000030', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('31', 'test31', '13000000031', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('32', 'test32', '13000000032', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('33', 'test33', '13000000033', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('34', 'test34', '13000000034', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('35', 'test35', '13000000035', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('36', 'test36', '13000000036', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('37', 'test37', '13000000037', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('38', 'test38', '13000000038', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('39', 'test39', '13000000039', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('4', 'test4', '13000000004', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('40', 'test40', '13000000040', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('41', 'test41', '13000000041', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('42', 'test42', '13000000042', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('43', 'test43', '13000000043', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('44', 'test44', '13000000044', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('45', 'test45', '13000000045', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('46', 'test46', '13000000046', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('47', 'test47', '13000000047', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('48', 'test48', '13000000048', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('49', 'test49', '13000000049', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('5', 'test5', '13000000005', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('50', 'test50', '13000000050', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('51', 'test51', '13000000051', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('52', 'test52', '13000000052', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('53', 'test53', '13000000053', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('54', 'test54', '13000000054', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('55', 'test55', '13000000055', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('56', 'test56', '13000000056', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('57', 'test57', '13000000057', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('58', 'test58', '13000000058', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('59', 'test59', '13000000059', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('6', 'test6', '13000000006', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('60', 'test60', '13000000060', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('61', 'test61', '13000000061', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('62', 'test62', '13000000062', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('63', 'test63', '13000000063', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('64', 'test64', '13000000064', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('65', 'test65', '13000000065', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('66', 'test66', '13000000066', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('67', 'test67', '13000000067', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('68', 'test68', '13000000068', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('69', 'test69', '13000000069', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('70', 'test70', '13000000070', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('71', 'test71', '13000000071', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('72', 'test72', '13000000072', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('73', 'test73', '13000000073', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('74', 'test74', '13000000074', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('75', 'test75', '13000000075', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('76', 'test76', '13000000076', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('77', 'test77', '13000000077', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('78', 'test78', '13000000078', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('79', 'test79', '13000000079', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('80', 'test80', '13000000080', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('84', 'test84', '13000000084', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('85', 'test85', '13000000085', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('86', 'test86', '13000000086', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('87', 'test87', '13000000087', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('88', 'test88', '13000000088', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('89', 'test89', '13000000089', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('90', 'test90', '13000000090', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('91', 'test91', '13000000091', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('92', 'test92', '13000000092', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('93', 'test93', '13000000093', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for nots_notices
-- ----------------------------
DROP TABLE IF EXISTS `nots_notices`;
CREATE TABLE `nots_notices`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `user_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加人',
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司标识',
  `department_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门标识',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告主体内容',
  `create_time` datetime(0) NOT NULL COMMENT '公告创建时间',
  `last_update_time` datetime(0) NOT NULL COMMENT '最后修改时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '公告状态 0为禁用，1为启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告-公告信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of nots_notices
-- ----------------------------
INSERT INTO `nots_notices` VALUES ('1', '公告1', '1066370498633486336', '1', NULL, '公告的内容', '2019-07-30 15:57:09', '2019-07-30 15:57:14', 1);
INSERT INTO `nots_notices` VALUES ('2', '公告2', '1075383133106425856', '1', NULL, '公告的内容2', '2019-07-30 15:57:54', '2019-07-30 15:57:58', 1);
INSERT INTO `nots_notices` VALUES ('3', '公告3', '1075383135459430400', '1', NULL, '公告的内容3', '2019-07-30 15:58:47', '2019-07-30 15:58:52', 1);
INSERT INTO `nots_notices` VALUES ('4', '公告4', '1075383135459430400', NULL, NULL, '公告内容4', '2019-07-30 15:59:30', '2019-07-30 15:59:34', 1);
INSERT INTO `nots_notices` VALUES ('5', '公告5', '1075383135371350016', '1', NULL, '公告内容5', '2019-07-30 16:00:56', '2019-07-30 16:01:01', 1);

-- ----------------------------
-- Table structure for pe_permission
-- ----------------------------
DROP TABLE IF EXISTS `pe_permission`;
CREATE TABLE `pe_permission`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '权限描述',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '权限类型 1为菜单 2为功能 3为API',
  `pid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '主键',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `en_visible` int(1) NULL DEFAULT NULL COMMENT '企业可见性 0：不可见，1：可见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pe_permission
-- ----------------------------
INSERT INTO `pe_permission` VALUES ('1', '3', 'SAAS企业管理', 1, '0', 'saas-clients', 0);
INSERT INTO `pe_permission` VALUES ('1063313020819738624', '查看部门的按钮', '查看部门', 2, '1', 'point-dept', 0);
INSERT INTO `pe_permission` VALUES ('1063315016368918528', '用户管理菜单', '员工管理', 1, '0', 'employees', 1);
INSERT INTO `pe_permission` VALUES ('1063315194329042944', '用户删除按钮', '用户删除按钮', 2, '1063315016368918528', 'point-user-delete', 1);
INSERT INTO `pe_permission` VALUES ('1063322760811515904', '删除api', '删除用户api', 3, '1063315194329042944', 'API-USER-DELETE', 1);
INSERT INTO `pe_permission` VALUES ('1063327833876729856', '组织架构菜单', '组织架构', 1, '0', 'departments', 1);
INSERT INTO `pe_permission` VALUES ('1063328114689576960', '公司设置菜单', '公司设置', 1, '0', 'settings', 1);
INSERT INTO `pe_permission` VALUES ('1063328310592933888', '用户添加按钮', '用户添加按钮', 2, '1063315016368918528', 'POINT-USER-ADD', 1);
INSERT INTO `pe_permission` VALUES ('1063328532492587008', '用户修改按钮', '用户修改按钮', 2, '1063315016368918528', 'POINT-USER-UPDATE', 1);
INSERT INTO `pe_permission` VALUES ('1064104257952813056', '系统权限设置', '权限管理', 1, '0', 'permissions', 1);
INSERT INTO `pe_permission` VALUES ('1146308691438043136', '社保', '社保', 1, '0', 'social_securitys', 1);
INSERT INTO `pe_permission` VALUES ('1151424682926747648', '考勤', '考勤', 1, '0', 'attendances', 1);
INSERT INTO `pe_permission` VALUES ('1151747519034093568', '工资模块', '工资', 1, '0', 'salarys', 1);
INSERT INTO `pe_permission` VALUES ('1156085524669272064', '员工自助', '员工自助', 1, '0', 'user', 1);
INSERT INTO `pe_permission` VALUES ('1539142191362875392', '工作流审批', '审批', 1, '0', 'approvals', 1);

-- ----------------------------
-- Table structure for pe_permission_api
-- ----------------------------
DROP TABLE IF EXISTS `pe_permission_api`;
CREATE TABLE `pe_permission_api`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键ID',
  `api_level` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限等级，1为通用接口权限，2为需校验接口权限',
  `api_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求类型',
  `api_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pe_permission_api
-- ----------------------------
INSERT INTO `pe_permission_api` VALUES ('1063322760811515904', '1', 'delete', '/sys/user/delete');

-- ----------------------------
-- Table structure for pe_permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `pe_permission_menu`;
CREATE TABLE `pe_permission_menu`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键ID',
  `menu_icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限代码',
  `menu_order` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pe_permission_menu
-- ----------------------------
INSERT INTO `pe_permission_menu` VALUES ('1', 'abc5', '14');
INSERT INTO `pe_permission_menu` VALUES ('1063315016368918528', 'menu-user', '1');
INSERT INTO `pe_permission_menu` VALUES ('1063327833876729856', '2', '2');
INSERT INTO `pe_permission_menu` VALUES ('1063328114689576960', '3', '3');
INSERT INTO `pe_permission_menu` VALUES ('1064104257952813056', NULL, NULL);
INSERT INTO `pe_permission_menu` VALUES ('1146308691438043136', NULL, NULL);
INSERT INTO `pe_permission_menu` VALUES ('1151424682926747648', NULL, NULL);
INSERT INTO `pe_permission_menu` VALUES ('1151747519034093568', NULL, NULL);
INSERT INTO `pe_permission_menu` VALUES ('1156085524669272064', NULL, NULL);
INSERT INTO `pe_permission_menu` VALUES ('1539142191362875392', '10', '10');
INSERT INTO `pe_permission_menu` VALUES ('2', 'def', '2');

-- ----------------------------
-- Table structure for pe_permission_point
-- ----------------------------
DROP TABLE IF EXISTS `pe_permission_point`;
CREATE TABLE `pe_permission_point`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键ID',
  `point_class` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按钮类型',
  `point_icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按钮icon',
  `point_status` int(11) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pe_permission_point
-- ----------------------------
INSERT INTO `pe_permission_point` VALUES ('1063313020819738624', 'dept', 'dept', 1);
INSERT INTO `pe_permission_point` VALUES ('1063315194329042944', 'point-user-delete', 'point-user-delete', 1);
INSERT INTO `pe_permission_point` VALUES ('1063328310592933888', 'POINT-USER-ADD', 'POINT-USER-ADD', 1);
INSERT INTO `pe_permission_point` VALUES ('1063328532492587008', 'POINT-USER-UPDATE', 'POINT-USER-UPDATE', 1);

-- ----------------------------
-- Table structure for pe_role
-- ----------------------------
DROP TABLE IF EXISTS `pe_role`;
CREATE TABLE `pe_role`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键ID',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  `company_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_k3beff7qglfn58qsf2yvbg41i`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pe_role
-- ----------------------------
INSERT INTO `pe_role` VALUES ('1062944989845262336', '人事经理', '负责整合人事部门', '1');
INSERT INTO `pe_role` VALUES ('1064098829009293312', '系统管理员', '管理整合平台，可以操作企业所有功能', '1');
INSERT INTO `pe_role` VALUES ('1064098935443951616', '人事专员', '只能操作员工菜单', '1');
INSERT INTO `pe_role` VALUES ('1064099035536822272', '薪资专员', '绩效管理', '1');
INSERT INTO `pe_role` VALUES ('1064099035536822276', '员工', '员工', '1');

-- ----------------------------
-- Table structure for pe_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `pe_role_permission`;
CREATE TABLE `pe_role_permission`  (
  `role_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `permission_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `FK74qx7rkbtq2wqms78gljv87a0`(`permission_id`) USING BTREE,
  INDEX `FKee9dk0vg99shvsytflym6egxd`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pe_role_permission
-- ----------------------------
INSERT INTO `pe_role_permission` VALUES ('1062944989845262336', '1063315016368918528');
INSERT INTO `pe_role_permission` VALUES ('1062944989845262336', '1063315194329042944');
INSERT INTO `pe_role_permission` VALUES ('1062944989845262336', '1063322760811515904');
INSERT INTO `pe_role_permission` VALUES ('1062944989845262336', '1063328310592933888');
INSERT INTO `pe_role_permission` VALUES ('1062944989845262336', '1063328532492587008');
INSERT INTO `pe_role_permission` VALUES ('1064099035536822276', '1156085524669272064');
INSERT INTO `pe_role_permission` VALUES ('1062944989845262336', '1539142191362875392');
INSERT INTO `pe_role_permission` VALUES ('1064098935443951616', '1539142191362875392');
INSERT INTO `pe_role_permission` VALUES ('1064099035536822276', '1539142191362875392');

-- ----------------------------
-- Table structure for pe_user
-- ----------------------------
DROP TABLE IF EXISTS `pe_user`;
CREATE TABLE `pe_user`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `mobile` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号码',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `enable_state` int(2) NULL DEFAULT 1 COMMENT '启用状态 0是禁用，1是启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `department_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `time_of_entry` datetime(0) NULL DEFAULT NULL COMMENT '入职时间',
  `form_of_employment` int(1) NULL DEFAULT NULL COMMENT '聘用形式',
  `work_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `form_of_management` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理形式',
  `working_city` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作城市',
  `correction_time` datetime(0) NULL DEFAULT NULL COMMENT '转正时间',
  `in_service_status` int(1) NULL DEFAULT NULL COMMENT '在职状态 1.在职  2.离职',
  `company_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业ID',
  `company_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `department_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_phone`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pe_user
-- ----------------------------

-- ----------------------------
-- Table structure for pe_user_role
-- ----------------------------
DROP TABLE IF EXISTS `pe_user_role`;
CREATE TABLE `pe_user_role`  (
  `role_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE,
  INDEX `FK74qx7rkbtq2wqms78gljv87a1`(`role_id`) USING BTREE,
  INDEX `FKee9dk0vg99shvsytflym6egx1`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pe_user_role
-- ----------------------------
INSERT INTO `pe_user_role` VALUES ('1062944989845262336', '1063705989926227968');
INSERT INTO `pe_user_role` VALUES ('1062944989845262336', '1066370498633486336');
INSERT INTO `pe_user_role` VALUES ('1062944989845262336', '1071632760222810112');
INSERT INTO `pe_user_role` VALUES ('1062944989845262336', '1074238801330704384');
INSERT INTO `pe_user_role` VALUES ('1064098829009293312', '1063705989926227968');
INSERT INTO `pe_user_role` VALUES ('1064098829009293312', '1071632760222810112');
INSERT INTO `pe_user_role` VALUES ('1064098829009293312', '1074238801330704384');
INSERT INTO `pe_user_role` VALUES ('1064098935443951616', '1063705989926227968');
INSERT INTO `pe_user_role` VALUES ('1064098935443951616', '1071632760222810112');
INSERT INTO `pe_user_role` VALUES ('1064098935443951616', '1074238801330704384');
INSERT INTO `pe_user_role` VALUES ('1064099035536822272', '1063705989926227968');
INSERT INTO `pe_user_role` VALUES ('1064099035536822272', '1071632760222810112');
INSERT INTO `pe_user_role` VALUES ('1064099035536822272', '1074238801330704384');
INSERT INTO `pe_user_role` VALUES ('1064099035536822276', '1063705989926227968');
INSERT INTO `pe_user_role` VALUES ('1064099035536822276', '1071632760222810112');
INSERT INTO `pe_user_role` VALUES ('1064099035536822276', '1074238801330704384');

-- ----------------------------
-- Table structure for proc_instance
-- ----------------------------
DROP TABLE IF EXISTS `proc_instance`;
CREATE TABLE `proc_instance`  (
  `process_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流程实例ID',
  `process_key` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程标识',
  `process_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程名称',
  `process_definition_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程定义ID',
  `process_state` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程状态（0已提交；1审批中；2审批\r\n通过；3审批不通过；4撤销）',
  `user_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人',
  `proc_apply_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `proc_curr_node_user_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前节点审批人ID',
  `proc_curr_node_user_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前节点审批人',
  `proc_end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束流程时间',
  `proc_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `department_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_of_entry` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`process_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of proc_instance
-- ----------------------------
INSERT INTO `proc_instance` VALUES ('1242021198007750656', 'process_leave', '请假', NULL, '2', '1075383135459430400', 'test003', '2020-03-23 17:31:43', '1063705989926227968', 'arvinyl ', NULL, '{\"startTime\":\"2020-03-24T09:31:37.000Z\",\"endTime\":\"2020-03-28T09:31:40.000Z\",\"reasonsForApplication\":\"111\",\"processName\":\"请假\",\"duration\":12,\"userId\":\"1075383135459430400\",\"processKey\":\"process_leave\"}', '1175311466846683136', '市场部', '2018-01-01 00:00:00');

-- ----------------------------
-- Table structure for proc_task_instance
-- ----------------------------
DROP TABLE IF EXISTS `proc_task_instance`;
CREATE TABLE `proc_task_instance`  (
  `process_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流程实例ID',
  `task_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务实例ID',
  `task_key` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务节点key',
  `task_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务节点',
  `should_user_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应审批用户ID',
  `should_user_name` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应审批用户',
  `handle_user_id` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实际处理用户ID',
  `handle_user_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实际处理用户',
  `handle_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `handle_opinion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理意见',
  `handle_type` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理类型（2审批通过；3审批不通过；4\r\n撤销）',
  PRIMARY KEY (`process_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of proc_task_instance
-- ----------------------------
INSERT INTO `proc_task_instance` VALUES ('1242021198007750656', '1242021438395895808', NULL, NULL, NULL, NULL, '1063705989926227968', 'arvinyl', '2020-03-23 17:32:41', '同意', '2');

-- ----------------------------
-- Table structure for proc_user_group
-- ----------------------------
DROP TABLE IF EXISTS `proc_user_group`;
CREATE TABLE `proc_user_group`  (
  `id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组名',
  `param` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入参',
  `isql` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应sql',
  `isvalid` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效标记',
  `create_user` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新人',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of proc_user_group
-- ----------------------------
INSERT INTO `proc_user_group` VALUES ('PROCESS_DIMISSION_APPLY_USERS', '离职申请人', 'user_id', 'SELECT id,username FROM bs_user WHERE id = ${user_id}', '1', NULL, NULL, NULL, NULL);
INSERT INTO `proc_user_group` VALUES ('PROCESS_DIMISSION_SHEN1_USERS', '离职部门审批用户组', 'department_id', 'SELECT id,username FROM bs_user WHERE department_id = ${department_id}', '1', NULL, NULL, NULL, NULL);
INSERT INTO `proc_user_group` VALUES ('PROCESS_DIMISSION_SHEN2_USERS', '离职人事审批用户组', 'department_id', 'SELECT id,username FROM bs_user WHERE department_id = ${department_id}', '1', NULL, NULL, NULL, NULL);
INSERT INTO `proc_user_group` VALUES ('PROCESS_DIMISSION_SHEN3_USERS', '部门人事负责人审批用户组', 'department_id', 'SELECT id,username FROM bs_user WHERE department_id = ${department_id}', '1', NULL, NULL, NULL, NULL);
INSERT INTO `proc_user_group` VALUES ('PROCESS_DIMISSION_SHEN4_USERS', '部门财物审批用户组', 'department_id', 'SELECT id,username FROM bs_user WHERE department_id = ${department_id}', '1', NULL, NULL, NULL, NULL);
INSERT INTO `proc_user_group` VALUES ('PROCESS_LEAVE_APPLY_USERS', '请假申请人', 'user_id', 'SELECT id,username FROM bs_user WHERE id = ${user_id}', '1', NULL, NULL, NULL, NULL);
INSERT INTO `proc_user_group` VALUES ('PROCESS_LEAVE_CHU_USERS', '请假初审用户组', 'department_id', 'SELECT manager username, manager_id id FROM co_department WHERE id = ${department_id}', '1', NULL, NULL, NULL, NULL);
INSERT INTO `proc_user_group` VALUES ('PROCESS_LEAVE_FU_USERS', '请假复审用户组', 'department_id', 'SELECT id,username FROM bs_user WHERE department_id = 1175311267684352000', '1', NULL, NULL, NULL, NULL);
INSERT INTO `proc_user_group` VALUES ('PROCESS_LEAVE_PI_USERS', '请假批准用户组', 'department_id', 'SELECT id,username FROM bs_user WHERE department_id = 1175310929766055936', '1', NULL, NULL, NULL, NULL);
INSERT INTO `proc_user_group` VALUES ('PROCESS_OVERTIME_SHEN1_USERS', '加班部门审批用户组', 'department_id', 'SELECT manager username, manager_id id FROM co_department WHERE id = ${department_id}', '1', NULL, NULL, NULL, NULL);
INSERT INTO `proc_user_group` VALUES ('PROCESS_OVERTIME_SHEN2_USERS', '加班人事审批用户组', 'department_id', 'SELECT id,username FROM bs_user WHERE department_id = 1175311267684352000', '1', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sa_archive
-- ----------------------------
DROP TABLE IF EXISTS `sa_archive`;
CREATE TABLE `sa_archive`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `years_month` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '年月',
  `creation_time` date NOT NULL COMMENT '创建时间',
  `artificial_cost` decimal(10, 2) NOT NULL COMMENT '人工成本',
  `gross_salary` decimal(10, 2) NOT NULL COMMENT '税前工资',
  `five_insurances` decimal(10, 2) NOT NULL COMMENT '五险一金',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工资-归档表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sa_archive
-- ----------------------------

-- ----------------------------
-- Table structure for sa_archive_detail
-- ----------------------------
DROP TABLE IF EXISTS `sa_archive_detail`;
CREATE TABLE `sa_archive_detail`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `archive_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '归档id',
  `user_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `work_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `department_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `id_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `in_service_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '在职状态',
  `form_of_employment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聘用形式',
  `bank_card_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `opening_bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `provident_fund_individual` decimal(10, 2) NULL DEFAULT NULL COMMENT '公积金个人',
  `social_security_individual` decimal(10, 2) NULL DEFAULT NULL COMMENT '社保个人',
  `old_age_individual` decimal(10, 2) NULL DEFAULT NULL COMMENT '养老个人',
  `medical_individual` decimal(10, 2) NULL DEFAULT NULL COMMENT '医疗个人',
  `unemployed_individual` decimal(10, 2) NULL DEFAULT NULL COMMENT '失业个人',
  `a_person_of_great_disease` decimal(10, 2) NULL DEFAULT NULL COMMENT '大病个人',
  `social_security` decimal(10, 2) NULL DEFAULT NULL COMMENT '社保扣款',
  `total_provident_fund_individual` decimal(10, 2) NULL DEFAULT NULL COMMENT '公积金扣款',
  `social_security_enterprise` decimal(10, 2) NULL DEFAULT NULL COMMENT '社保企业',
  `pension_enterprise` decimal(10, 2) NULL DEFAULT NULL COMMENT '养老企业',
  `medical_enterprise` decimal(10, 2) NULL DEFAULT NULL COMMENT '医疗企业',
  `unemployed_enterprise` decimal(10, 2) NULL DEFAULT NULL COMMENT '失业企业',
  `industrial_injury_enterprise` decimal(10, 2) NULL DEFAULT NULL COMMENT '工伤企业',
  `childbearing_enterprise` decimal(10, 2) NULL DEFAULT NULL COMMENT '生育企业',
  `big_disease_enterprise` decimal(10, 2) NULL DEFAULT NULL COMMENT '大病企业',
  `provident_fund_enterprises` decimal(10, 2) NULL DEFAULT NULL COMMENT '公积金企业',
  `social_security_provident_fund_enterprises` decimal(10, 2) NULL DEFAULT NULL COMMENT '公积金社保企业',
  `tax_to_provident_fund` decimal(10, 2) NULL DEFAULT NULL COMMENT '公积金需纳税额',
  `official_salary_days` decimal(10, 2) NULL DEFAULT NULL COMMENT '计薪天数',
  `attendance_deduction_monthly` decimal(10, 2) NULL DEFAULT NULL COMMENT '考勤扣款',
  `salary_standard` decimal(10, 2) NULL DEFAULT NULL COMMENT '计薪标准',
  `current_salary_total_base` decimal(10, 2) NULL DEFAULT NULL COMMENT '最新工资基数合计',
  `current_base_salary` decimal(10, 2) NULL DEFAULT NULL COMMENT '最新基本工资基数',
  `base_salary_by_month` decimal(10, 2) NULL DEFAULT NULL COMMENT '当月基本工资基数',
  `tax_counting_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计税方式',
  `base_salary_to_tax_by_month` decimal(10, 2) NULL DEFAULT NULL COMMENT '当月纳税基本工资',
  `salary_before_tax` decimal(10, 2) NULL DEFAULT NULL COMMENT '税前工资合计',
  `salary` decimal(10, 2) NULL DEFAULT NULL COMMENT '工资合计',
  `salary_by_tax` decimal(10, 2) NULL DEFAULT NULL COMMENT '应纳税工资',
  `payment_before_tax` decimal(10, 2) NULL DEFAULT NULL COMMENT '税前实发',
  `tax` decimal(10, 2) NULL DEFAULT NULL COMMENT '应扣税',
  `salary_after_tax` decimal(10, 2) NULL DEFAULT NULL COMMENT '税后工资合计',
  `payment` decimal(10, 2) NULL DEFAULT NULL COMMENT '实发工资',
  `payment_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实发工资备注',
  `salary_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '薪酬成本',
  `enterprise_labor_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '企业人工成本',
  `salary_change_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '调薪金额',
  `salary_change_scale` decimal(10, 2) NULL DEFAULT NULL COMMENT '调薪比例',
  `effective_time_of_pay_adjustment` decimal(10, 2) NULL DEFAULT NULL COMMENT '调薪生效时间',
  `cause_of_salary_adjustment` decimal(10, 2) NULL DEFAULT NULL COMMENT '调薪原因',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注释',
  `payment_months` int(8) NULL DEFAULT NULL COMMENT '发薪月数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工资-归档详情' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sa_archive_detail
-- ----------------------------

-- ----------------------------
-- Table structure for sa_company_settings
-- ----------------------------
DROP TABLE IF EXISTS `sa_company_settings`;
CREATE TABLE `sa_company_settings`  (
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `is_settings` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0是未设置，1是已设置',
  `data_month` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当前显示报表月份',
  PRIMARY KEY (`company_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工资-企业设置信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sa_company_settings
-- ----------------------------
INSERT INTO `sa_company_settings` VALUES ('1', 1, '201909');

-- ----------------------------
-- Table structure for sa_settings
-- ----------------------------
DROP TABLE IF EXISTS `sa_settings`;
CREATE TABLE `sa_settings`  (
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `social_security_type` int(8) NULL DEFAULT NULL COMMENT '对应社保自然月',
  `subsidy_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '津贴方案名称',
  `subsidy_remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '津贴备注',
  `transportation_subsidy_scheme` int(8) NULL DEFAULT NULL COMMENT '交通补贴计算类型',
  `transportation_subsidy_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '交通补贴金额',
  `communication_subsidy_scheme` int(8) NULL DEFAULT NULL COMMENT '通讯补贴计算类型',
  `communication_subsidy_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '通讯补贴金额',
  `lunch_allowance_scheme` int(8) NULL DEFAULT NULL COMMENT '午餐补贴计算类型',
  `lunch_allowance_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '午餐补贴金额',
  `housing_subsidy_scheme` int(8) NULL DEFAULT NULL COMMENT '住房补助计算类型',
  `housing_subsidy_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '住房补助金额',
  `tax_calculation_type` int(8) NULL DEFAULT NULL COMMENT '计税方式',
  PRIMARY KEY (`company_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工资-企业设置信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sa_settings
-- ----------------------------
INSERT INTO `sa_settings` VALUES ('1', 2, '1234', '3211', 1, 10.00, 2, 11.00, 2, 12.00, 3, 13.00, 1);

-- ----------------------------
-- Table structure for sa_user_salary
-- ----------------------------
DROP TABLE IF EXISTS `sa_user_salary`;
CREATE TABLE `sa_user_salary`  (
  `user_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `current_basic_salary` decimal(10, 2) NULL DEFAULT NULL COMMENT '当前基本工资',
  `current_post_wage` decimal(10, 2) NULL DEFAULT NULL COMMENT '当前岗位工资',
  `fixed_basic_salary` decimal(10, 2) NULL DEFAULT NULL COMMENT '定薪基本工资',
  `fixed_post_wage` decimal(10, 2) NULL DEFAULT NULL COMMENT '定薪岗位工资',
  `correction_of_basic_wages` decimal(10, 2) NULL DEFAULT NULL COMMENT '转正基本工资',
  `turn_to_post_wages` decimal(10, 2) NULL DEFAULT NULL COMMENT '转正岗位工资',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工资-员工薪资表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sa_user_salary
-- ----------------------------
INSERT INTO `sa_user_salary` VALUES ('1063705989926227968', 1500.00, 1500.00, 1500.00, 1500.00, 2000.00, 2000.00);
INSERT INTO `sa_user_salary` VALUES ('1066370498633486336', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sa_user_salary` VALUES ('1071632760222810112', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sa_user_salary` VALUES ('1074238801330704384', 1600.00, 1600.00, NULL, NULL, NULL, NULL);
INSERT INTO `sa_user_salary` VALUES ('1075383133106425856', 2000.00, 2000.00, NULL, NULL, NULL, NULL);
INSERT INTO `sa_user_salary` VALUES ('1075383135371350016', 4699.00, 5000.00, 4699.00, 5000.00, 8000.00, 8000.00);
INSERT INTO `sa_user_salary` VALUES ('1075383135459430400', 10.00, 10.00, 10.00, 10.00, 12.00, 12.00);

-- ----------------------------
-- Table structure for sa_user_salary_change
-- ----------------------------
DROP TABLE IF EXISTS `sa_user_salary_change`;
CREATE TABLE `sa_user_salary_change`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `current_basic_salary` decimal(10, 2) NULL DEFAULT NULL COMMENT '调整前基本工资',
  `current_post_wage` decimal(10, 2) NULL DEFAULT NULL COMMENT '调整前岗位工资',
  `adjustment_of_basic_wages` decimal(10, 2) NOT NULL COMMENT '调整基本工资',
  `adjust_post_wages` decimal(10, 2) NULL DEFAULT NULL COMMENT '调整岗位工资',
  `effective_time_of_pay_adjustment` date NULL DEFAULT NULL COMMENT '调薪生效时间',
  `cause_of_salary_adjustment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '调薪原因',
  `enclosure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sa_user_salary_change
-- ----------------------------
INSERT INTO `sa_user_salary_change` VALUES ('1154222625622835200', '1063705989926227968', NULL, NULL, 5.00, 5.00, '2019-07-25', '123', NULL);

-- ----------------------------
-- Table structure for ss_archive
-- ----------------------------
DROP TABLE IF EXISTS `ss_archive`;
CREATE TABLE `ss_archive`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `years_month` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '年月',
  `creation_time` date NULL DEFAULT NULL COMMENT '创建时间',
  `enterprise_payment` decimal(10, 2) NOT NULL COMMENT '企业缴纳',
  `personal_payment` decimal(10, 2) NOT NULL COMMENT '个人缴纳',
  `total` decimal(10, 2) NOT NULL COMMENT '合计',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社保-归档表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ss_archive
-- ----------------------------
INSERT INTO `ss_archive` VALUES ('1240302152543498240', '1', '201908', NULL, 8804.87, 8804.87, 17609.74);
INSERT INTO `ss_archive` VALUES ('1538883584805404672', '1', '201910', NULL, 8804.87, 8804.87, 17609.74);

-- ----------------------------
-- Table structure for ss_archive_detail
-- ----------------------------
DROP TABLE IF EXISTS `ss_archive_detail`;
CREATE TABLE `ss_archive_detail`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `archive_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '归档id',
  `user_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `time_of_entry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入职时间',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `id_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `the_highest_degree_of_education` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `opening_bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `bank_card_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `first_level_department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一级部门',
  `two_level_department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二级部门',
  `working_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作城市',
  `social_security_computer_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社保电脑号',
  `provident_fund_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公积金账号',
  `leave_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '离职时间',
  `household_registration_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '户籍类型',
  `participating_in_the_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参保城市',
  `social_security_month` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社保月份',
  `social_security_base` decimal(10, 2) NULL DEFAULT NULL COMMENT '社保基数',
  `social_security` decimal(10, 2) NULL DEFAULT NULL COMMENT '社保合计',
  `social_security_enterprise` decimal(10, 2) NULL DEFAULT NULL COMMENT '社保企业',
  `social_security_individual` decimal(10, 2) NULL DEFAULT NULL COMMENT '社保个人',
  `provident_fund_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公积金城市',
  `provident_fund_month` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公积金月份',
  `provident_fund_base` decimal(10, 2) NULL DEFAULT NULL COMMENT '公积金基数',
  `accumulation_fund_enterprise_base` decimal(10, 2) NULL DEFAULT NULL COMMENT '公积金企业基数',
  `proportion_of_provident_fund_enterprises` decimal(10, 2) NULL DEFAULT NULL COMMENT '公积金企业比例',
  `individual_base_of_provident_fund` decimal(10, 2) NULL DEFAULT NULL COMMENT '公积金个人基数',
  `personal_ratio_of_provident_fund` decimal(10, 2) NULL DEFAULT NULL COMMENT '公积金个人比例',
  `total_provident_fund` decimal(10, 2) NULL DEFAULT NULL COMMENT '公积金合计',
  `provident_fund_enterprises` decimal(10, 2) NULL DEFAULT NULL COMMENT '公积金企业',
  `provident_fund_individual` decimal(10, 2) NULL DEFAULT NULL COMMENT '公积金个人',
  `pension_enterprise_base` decimal(10, 2) NULL DEFAULT NULL COMMENT '养老企业基数',
  `proportion_of_pension_enterprises` decimal(10, 2) NULL DEFAULT NULL COMMENT '养老企业比例',
  `pension_enterprise` decimal(10, 2) NULL DEFAULT NULL COMMENT '养老企业',
  `personal_pension_base` decimal(10, 2) NULL DEFAULT NULL COMMENT '养老个人基数',
  `personal_pension_ratio` decimal(10, 2) NULL DEFAULT NULL COMMENT '养老个人比例',
  `old_age_individual` decimal(10, 2) NULL DEFAULT NULL COMMENT '养老个人',
  `unemployment_enterprise_base` decimal(10, 2) NULL DEFAULT NULL COMMENT '失业企业基数',
  `proportion_of_unemployed_enterprises` decimal(10, 2) NULL DEFAULT NULL COMMENT '失业企业比例',
  `unemployed_enterprise` decimal(10, 2) NULL DEFAULT NULL COMMENT '失业企业',
  `the_number_of_unemployed_individuals` decimal(10, 2) NULL DEFAULT NULL COMMENT '失业个人基数',
  `percentage_of_unemployed_individuals` decimal(10, 2) NULL DEFAULT NULL COMMENT '失业个人比例',
  `unemployed_individual` decimal(10, 2) NULL DEFAULT NULL COMMENT '失业个人',
  `medical_enterprise_base` decimal(10, 2) NULL DEFAULT NULL COMMENT '医疗企业基数',
  `proportion_of_medical_enterprises` decimal(10, 2) NULL DEFAULT NULL COMMENT '医疗企业比例',
  `medical_enterprise` decimal(10, 2) NULL DEFAULT NULL COMMENT '医疗企业',
  `medical_personal_base` decimal(10, 2) NULL DEFAULT NULL COMMENT '医疗个人基数',
  `medical_personal_ratio` decimal(10, 2) NULL DEFAULT NULL COMMENT '医疗个人比例',
  `medical_individual` decimal(10, 2) NULL DEFAULT NULL COMMENT '医疗个人',
  `base_of_industrial_injury_enterprises` decimal(10, 2) NULL DEFAULT NULL COMMENT '工伤企业基数',
  `proportion_of_industrial_injury_enterprises` decimal(10, 2) NULL DEFAULT NULL COMMENT '工伤企业比例',
  `industrial_injury_enterprise` decimal(10, 2) NULL DEFAULT NULL COMMENT '工伤企业',
  `fertility_enterprise_base` decimal(10, 2) NULL DEFAULT NULL COMMENT '生育企业基数',
  `proportion_of_fertility_enterprises` decimal(10, 2) NULL DEFAULT NULL COMMENT '生育企业比例',
  `childbearing_enterprise` decimal(10, 2) NULL DEFAULT NULL COMMENT '生育企业',
  `base_of_serious_illness` decimal(10, 2) NULL DEFAULT NULL COMMENT '大病企业基数',
  `proportion_of_seriously_ill_enterprises` decimal(10, 2) NULL DEFAULT NULL COMMENT '大病企业比例',
  `big_disease_enterprise` decimal(10, 2) NULL DEFAULT NULL COMMENT '大病企业',
  `personal_base_of_serious_illness` decimal(10, 2) NULL DEFAULT NULL COMMENT '大病个人基数',
  `personal_proportion_of_serious_illness` decimal(10, 2) NULL DEFAULT NULL COMMENT '大病个人比例',
  `a_person_of_great_disease` decimal(10, 2) NULL DEFAULT NULL COMMENT '大病个人',
  `provident_fund_notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公积金备注',
  `social_security_notes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '社保备注',
  `years_month` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社保-归档详情' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ss_archive_detail
-- ----------------------------
INSERT INTO `ss_archive_detail` VALUES ('1240302152547692544', '1240302152543498240', '1063705989926227968', 'itcast', '2018-11-02 08:00:00', '13800000002', '1234567890', '本科', '333', '12', 'test1', NULL, NULL, '123', '123', NULL, NULL, NULL, '201908', 10000.00, 0.00, 0.00, 0.00, NULL, '201908', 10000.00, 10000.00, 0.12, 10000.00, 0.12, 24.00, 12.00, 12.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'xxx12345', 'xxxx', '201908');
INSERT INTO `ss_archive_detail` VALUES ('1240302152560275456', '1240302152543498240', '1066370498633486336', 'zbz', '2018-11-04 08:00:00', '13800000003', '1234567890', '高中', NULL, NULL, '测试部', NULL, NULL, 'x1111', NULL, NULL, NULL, '北京', '201908', 3388.00, 1450.06, 1002.85, 447.22, '北京', '201908', 2277.00, 2277.00, 6.00, 2277.00, 6.00, 273.24, 136.62, 136.62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sdauy', '201908');
INSERT INTO `ss_archive_detail` VALUES ('1240302152572858368', '1240302152543498240', '1071632760222810112', 'll', '2018-12-02 08:00:00', '13800000004', '4110', NULL, NULL, NULL, '测试部', NULL, NULL, NULL, NULL, NULL, NULL, '北京', '201908', 5000.00, 2140.00, 1480.00, 660.00, '北京', '201908', 5000.00, 5000.00, 12.00, 5000.00, 12.00, 1200.00, 600.00, 600.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201908');
INSERT INTO `ss_archive_detail` VALUES ('1240302152589635584', '1240302152543498240', '1074238801330704384', 'a01', '2018-01-01 00:00:00', '13400000001', NULL, NULL, NULL, NULL, '开发部', NULL, NULL, NULL, NULL, NULL, NULL, '北京', '201908', 5900.00, 2584.20, 1805.40, 778.80, '北京', '201908', 5900.00, 5900.00, 12.00, 5900.00, 12.00, 1416.00, 708.00, 708.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '11111', '2222', '201908');
INSERT INTO `ss_archive_detail` VALUES ('1240302152606412800', '1240302152543498240', '1074238801402007552', 'a02', '2018-01-01 00:00:00', '13400000002', NULL, '初中', NULL, NULL, '开发部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201908');
INSERT INTO `ss_archive_detail` VALUES ('1240302152614801408', '1240302152543498240', '1075383133106425856', 'test001', '2018-01-01 00:00:00', '13500000001', NULL, NULL, NULL, NULL, '开发部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201908');
INSERT INTO `ss_archive_detail` VALUES ('1240302152627384320', '1240302152543498240', '1075383135371350016', 'test002', '2018-01-01 00:00:00', '13500000002', NULL, NULL, NULL, NULL, '开发部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201908');
INSERT INTO `ss_archive_detail` VALUES ('1240302152635772928', '1240302152543498240', '1075383135459430400', 'test003', '2018-01-01 00:00:00', '13500000003', NULL, NULL, NULL, NULL, '开发部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201908');
INSERT INTO `ss_archive_detail` VALUES ('1538873940699611136', '1240302152543498240', '1063705989926227968', 'co-Kuky', '2018-11-02 08:00:00', '13800000002', '1234567890', '本科', '333', '12', '总裁办', NULL, NULL, '123', '123', NULL, NULL, '北京', '201908', 10000.00, 4380.00, 3060.00, 1320.00, '北京', '201908', 10000.00, 10000.00, 0.12, 10000.00, 0.12, 24.00, 12.00, 12.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'xxx12345', 'xxxx', '201908');
INSERT INTO `ss_archive_detail` VALUES ('1538873940892549120', '1240302152543498240', '1066370498633486336', 'user-Kuky', '2018-11-04 08:00:00', '13800000003', '1234567890', '高中', NULL, NULL, '行政部', NULL, NULL, 'x1111', NULL, NULL, NULL, '北京', '201908', 3388.00, 1450.06, 1002.85, 447.22, '北京', '201908', 2277.00, 2277.00, 6.00, 2277.00, 6.00, 273.24, 136.62, 136.62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sdauy', '201908');
INSERT INTO `ss_archive_detail` VALUES ('1538873940905132032', '1240302152543498240', '1071632760222810112', '小张', '2018-12-02 08:00:00', '13800000004', '4110', NULL, NULL, NULL, '人事部', NULL, NULL, NULL, NULL, NULL, NULL, '北京', '201908', 5000.00, 2140.00, 1480.00, 660.00, '北京', '201908', 5000.00, 5000.00, 12.00, 5000.00, 12.00, 1200.00, 600.00, 600.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201908');
INSERT INTO `ss_archive_detail` VALUES ('1538873940917714944', '1240302152543498240', '1074238801330704384', '小明', '2018-01-01 00:00:00', '13400000001', NULL, NULL, NULL, NULL, '市场部', NULL, NULL, NULL, NULL, NULL, NULL, '北京', '201908', 5900.00, 2584.20, 1805.40, 778.80, '北京', '201908', 5900.00, 5900.00, 12.00, 5900.00, 12.00, 1416.00, 708.00, 708.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '11111', '2222', '201908');
INSERT INTO `ss_archive_detail` VALUES ('1538873940934492160', '1240302152543498240', '1074238801402007552', '小红', '2018-01-01 00:00:00', '13400000002', NULL, '初中', NULL, NULL, '财务部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201908');
INSERT INTO `ss_archive_detail` VALUES ('1538873940951269376', '1240302152543498240', '1075383133106425856', '张艺兴', '2018-01-01 00:00:00', '13500000001', NULL, NULL, NULL, NULL, '技术部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201908');
INSERT INTO `ss_archive_detail` VALUES ('1538873940959657984', '1240302152543498240', '1075383135371350016', '聂军林', '2018-01-01 00:00:00', '13500000002', NULL, NULL, NULL, NULL, '运营部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201908');
INSERT INTO `ss_archive_detail` VALUES ('1538873940976435200', '1240302152543498240', '1075383135459430400', '何光林', '2018-01-01 00:00:00', '13500000003', NULL, NULL, NULL, NULL, '市场部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201908');
INSERT INTO `ss_archive_detail` VALUES ('1538873940989018112', '1240302152543498240', '1538172085556285440', '小李', '2022-06-08 08:00:00', '1334223123', NULL, NULL, NULL, NULL, '技术部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201908');
INSERT INTO `ss_archive_detail` VALUES ('1538873941001601024', '1240302152543498240', '1538174539098296320', '小妹', '2022-06-01 08:00:00', '2323424', NULL, NULL, NULL, NULL, '行政部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201908');
INSERT INTO `ss_archive_detail` VALUES ('1538883584813793280', '1538883584805404672', '1063705989926227968', 'co-Kuky', '2018-11-02 08:00:00', '13800000002', '1234567890', '本科', '333', '12', '总裁办', NULL, NULL, '123', '123', NULL, NULL, '北京', '201910', 10000.00, 4380.00, 3060.00, 1320.00, '北京', '201910', 10000.00, 10000.00, 0.12, 10000.00, 0.12, 24.00, 12.00, 12.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'xxx12345', 'xxxx', '201910');
INSERT INTO `ss_archive_detail` VALUES ('1538883584830570496', '1538883584805404672', '1066370498633486336', 'user-Kuky', '2018-11-04 08:00:00', '13800000003', '1234567890', '高中', NULL, NULL, '行政部', NULL, NULL, 'x1111', NULL, NULL, NULL, '北京', '201910', 3388.00, 1450.06, 1002.85, 447.22, '北京', '201910', 2277.00, 2277.00, 6.00, 2277.00, 6.00, 273.24, 136.62, 136.62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sdauy', '201910');
INSERT INTO `ss_archive_detail` VALUES ('1538883584843153408', '1538883584805404672', '1071632760222810112', '小张', '2018-12-02 08:00:00', '13800000004', '4110', NULL, NULL, NULL, '人事部', NULL, NULL, NULL, NULL, NULL, NULL, '北京', '201910', 5000.00, 2140.00, 1480.00, 660.00, '北京', '201910', 5000.00, 5000.00, 12.00, 5000.00, 12.00, 1200.00, 600.00, 600.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201910');
INSERT INTO `ss_archive_detail` VALUES ('1538883584851542016', '1538883584805404672', '1074238801330704384', '小明', '2018-01-01 00:00:00', '13400000001', NULL, NULL, NULL, NULL, '市场部', NULL, NULL, NULL, NULL, NULL, NULL, '北京', '201910', 5900.00, 2584.20, 1805.40, 778.80, '北京', '201910', 5900.00, 5900.00, 12.00, 5900.00, 12.00, 1416.00, 708.00, 708.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '11111', '2222', '201910');
INSERT INTO `ss_archive_detail` VALUES ('1538883584859930624', '1538883584805404672', '1074238801402007552', '小红', '2018-01-01 00:00:00', '13400000002', NULL, '初中', NULL, NULL, '财务部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201910');
INSERT INTO `ss_archive_detail` VALUES ('1538883584868319232', '1538883584805404672', '1075383133106425856', '张艺兴', '2018-01-01 00:00:00', '13500000001', NULL, NULL, NULL, NULL, '技术部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201910');
INSERT INTO `ss_archive_detail` VALUES ('1538883584876707840', '1538883584805404672', '1075383135371350016', '聂军林', '2018-01-01 00:00:00', '13500000002', NULL, NULL, NULL, NULL, '运营部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201910');
INSERT INTO `ss_archive_detail` VALUES ('1538883584893485056', '1538883584805404672', '1075383135459430400', '何光林', '2018-01-01 00:00:00', '13500000003', NULL, NULL, NULL, NULL, '市场部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201910');
INSERT INTO `ss_archive_detail` VALUES ('1538883584901873664', '1538883584805404672', '1538172085556285440', '小李', '2022-06-08 08:00:00', '1334223123', NULL, NULL, NULL, NULL, '技术部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201910');
INSERT INTO `ss_archive_detail` VALUES ('1538883584914456576', '1538883584805404672', '1538174539098296320', '小妹', '2022-06-01 08:00:00', '2323424', NULL, NULL, NULL, NULL, '行政部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '201910');

-- ----------------------------
-- Table structure for ss_city_payment_item
-- ----------------------------
DROP TABLE IF EXISTS `ss_city_payment_item`;
CREATE TABLE `ss_city_payment_item`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市id',
  `payment_item_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缴费项目id',
  `switch_company` tinyint(1) NOT NULL COMMENT '企业是否缴纳开关，0为禁用，1为启用',
  `scale_company` decimal(6, 2) NULL DEFAULT NULL COMMENT '企业比例',
  `switch_personal` tinyint(1) NOT NULL COMMENT '个人是否缴纳开关，0为禁用，1为启用',
  `scale_personal` decimal(6, 2) NULL DEFAULT NULL COMMENT '个人比例',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缴费项目名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_CID_PIID`(`city_id`, `payment_item_id`) USING BTREE COMMENT '城市id与缴费项目id组合唯一'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社保-城市与缴费项目关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ss_city_payment_item
-- ----------------------------
INSERT INTO `ss_city_payment_item` VALUES ('1', '1084825908823904256', '1', 1, 16.00, 1, 8.00, '养老');
INSERT INTO `ss_city_payment_item` VALUES ('10', '1084825908823904257', '4', 1, 0.20, 0, NULL, '工伤');
INSERT INTO `ss_city_payment_item` VALUES ('11', '1084825908823904257', '5', 1, 0.80, 0, NULL, '生育');
INSERT INTO `ss_city_payment_item` VALUES ('12', '1084825908823904257', '6', 1, 0.00, 1, 0.00, '大病');
INSERT INTO `ss_city_payment_item` VALUES ('13', '1084825908823904258', '1', 1, 19.00, 1, 8.00, '养老');
INSERT INTO `ss_city_payment_item` VALUES ('14', '1084825908823904258', '2', 1, 10.00, 1, 5.00, '医疗');
INSERT INTO `ss_city_payment_item` VALUES ('15', '1084825908823904258', '3', 1, 0.80, 1, 0.20, '失业');
INSERT INTO `ss_city_payment_item` VALUES ('16', '1084825908823904258', '4', 1, 0.20, 0, NULL, '工伤');
INSERT INTO `ss_city_payment_item` VALUES ('17', '1084825908823904258', '5', 1, 0.80, 0, NULL, '生育');
INSERT INTO `ss_city_payment_item` VALUES ('18', '1084825908823904258', '6', 1, 0.00, 1, 0.00, '大病');
INSERT INTO `ss_city_payment_item` VALUES ('2', '1084825908823904256', '2', 1, 10.00, 1, 5.00, '医疗');
INSERT INTO `ss_city_payment_item` VALUES ('3', '1084825908823904256', '3', 1, 0.80, 1, 0.20, '失业');
INSERT INTO `ss_city_payment_item` VALUES ('4', '1084825908823904256', '4', 1, 0.40, 0, NULL, '工伤');
INSERT INTO `ss_city_payment_item` VALUES ('5', '1084825908823904256', '5', 1, 0.80, 0, NULL, '生育');
INSERT INTO `ss_city_payment_item` VALUES ('6', '1084825908823904256', '6', 1, 0.00, 1, 0.00, '大病');
INSERT INTO `ss_city_payment_item` VALUES ('7', '1084825908823904257', '1', 1, 19.00, 1, 8.00, '养老');
INSERT INTO `ss_city_payment_item` VALUES ('8', '1084825908823904257', '2', 1, 10.00, 1, 5.00, '医疗');
INSERT INTO `ss_city_payment_item` VALUES ('9', '1084825908823904257', '3', 1, 0.80, 1, 0.20, '失业');

-- ----------------------------
-- Table structure for ss_company_settings
-- ----------------------------
DROP TABLE IF EXISTS `ss_company_settings`;
CREATE TABLE `ss_company_settings`  (
  `company_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '企业id',
  `is_settings` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0是未设置，1是已设置',
  `data_month` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当前显示报表月份',
  PRIMARY KEY (`company_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社保-企业设置信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ss_company_settings
-- ----------------------------
INSERT INTO `ss_company_settings` VALUES ('1', 1, '201910');

-- ----------------------------
-- Table structure for ss_payment_item
-- ----------------------------
DROP TABLE IF EXISTS `ss_payment_item`;
CREATE TABLE `ss_payment_item`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缴费项目名称',
  `switch_company` tinyint(1) NOT NULL DEFAULT 0 COMMENT '企业是否缴纳开关，0为禁用，1为启用',
  `scale_company` decimal(6, 2) NOT NULL COMMENT '企业比例',
  `switch_personal` tinyint(1) NOT NULL DEFAULT 0 COMMENT '个人是否缴纳开关，0为禁用，1为启用',
  `scale_personal` decimal(6, 2) NOT NULL COMMENT '个人比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社保-缴费项目' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ss_payment_item
-- ----------------------------
INSERT INTO `ss_payment_item` VALUES ('1', '养老', 1, 19.00, 1, 8.00);
INSERT INTO `ss_payment_item` VALUES ('2', '医疗', 1, 10.00, 1, 2.00);
INSERT INTO `ss_payment_item` VALUES ('3', '失业', 1, 0.80, 1, 0.20);
INSERT INTO `ss_payment_item` VALUES ('4', '工伤', 1, 0.20, 0, 0.00);
INSERT INTO `ss_payment_item` VALUES ('5', '生育', 1, 0.80, 0, 0.00);
INSERT INTO `ss_payment_item` VALUES ('6', '大病', 1, 0.00, 0, 0.00);

-- ----------------------------
-- Table structure for ss_user_social_security
-- ----------------------------
DROP TABLE IF EXISTS `ss_user_social_security`;
CREATE TABLE `ss_user_social_security`  (
  `user_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `enterprises_pay_social_security_this_month` tinyint(1) NOT NULL DEFAULT 0 COMMENT '本月是否缴纳社保 0为不缴纳 1为缴纳',
  `enterprises_pay_the_provident_fund_this_month` tinyint(1) NOT NULL DEFAULT 0 COMMENT '本月是否缴纳公积金 0为不缴纳 1为缴纳',
  `participating_in_the_city_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参保城市id',
  `social_security_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '参保类型  1为首次开户 2为非首次开户',
  `household_registration_type` tinyint(1) NOT NULL COMMENT '户籍类型 1为本市城镇 2为本市农村 3为外埠城镇 4为外埠农村',
  `social_security_base` int(8) NOT NULL COMMENT '社保基数',
  `industrial_injury_ratio` decimal(6, 2) NULL DEFAULT NULL COMMENT '工伤比例',
  `social_security_notes` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社保备注',
  `provident_fund_city_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公积金城市id',
  `provident_fund_base` int(8) NOT NULL COMMENT '公积金基数',
  `enterprise_proportion` decimal(6, 2) NOT NULL COMMENT '公积金企业比例',
  `personal_proportion` decimal(6, 2) NOT NULL COMMENT '公积金个人比例',
  `enterprise_provident_fund_payment` decimal(8, 2) NOT NULL COMMENT '公积金企业缴纳数额',
  `personal_provident_fund_payment` decimal(8, 2) NOT NULL COMMENT '公积金个人缴纳数额',
  `provident_fund_notes` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公积金备注',
  `last_modify_time` datetime(0) NOT NULL COMMENT '最后修改时间',
  `social_security_switch_update_time` datetime(0) NOT NULL COMMENT '社保是否缴纳变更时间',
  `provident_fund_switch_update_time` datetime(0) NOT NULL COMMENT '公积金是否缴纳变更时间',
  `city_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `household_registration` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `participating_in_the_city` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `provident_fund_city` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社保-用户社保信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ss_user_social_security
-- ----------------------------
INSERT INTO `ss_user_social_security` VALUES ('1063705482939731968', 1, 1, '1084825908823904256', 1, 1, 10000, 0.30, '6432', '1084825908823904256', 10000, 0.12, 0.12, 1200.00, 1200.00, NULL, '2019-07-12 17:49:40', '2019-07-12 09:01:13', '2019-07-12 09:01:18', NULL, NULL, '北京', '北京');
INSERT INTO `ss_user_social_security` VALUES ('1063705989926227968', 0, 0, '1084825908823904256', 1, 2, 10000, 3.00, 'xxxx', '1084825908823904256', 10000, 0.12, 0.12, 12.00, 12.00, 'xxx12345', '2019-07-16 10:36:21', '2019-07-16 10:36:21', '2019-07-16 10:36:21', NULL, NULL, '北京', '北京');
INSERT INTO `ss_user_social_security` VALUES ('1066370498633486336', 1, 1, '1084825908823904256', 1, 1, 3388, 2.00, 'sdauy', '1084825908823904256', 2277, 6.00, 6.00, 136.62, 136.62, NULL, '2019-07-16 11:31:08', '2019-07-16 11:31:08', '2019-07-16 11:31:08', NULL, NULL, '北京', '北京');
INSERT INTO `ss_user_social_security` VALUES ('1071632760222810112', 0, 0, '1084825908823904256', 1, 2, 5000, 2.00, NULL, '1084825908823904256', 5000, 12.00, 12.00, 600.00, 600.00, NULL, '2019-08-22 22:47:59', '2019-08-22 22:47:59', '2019-08-22 22:47:59', NULL, NULL, '北京', '北京');
INSERT INTO `ss_user_social_security` VALUES ('1074238801330704384', 1, 1, '1084825908823904256', 1, 1, 5900, 3.00, '2222', '1084825908823904256', 5900, 12.00, 12.00, 708.00, 708.00, '11111', '2019-08-25 16:49:14', '2019-08-25 16:49:14', '2019-08-25 16:49:14', NULL, NULL, '北京', '北京');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件原始名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `uuid_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件实际名称',
  `type` tinyint(2) NULL DEFAULT NULL COMMENT '文件类型',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_mail_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_mail_record`;
CREATE TABLE `sys_mail_record`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键ID',
  `recipient` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件接收邮箱',
  `subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件主题',
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件内容',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统邮件记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_mail_record
-- ----------------------------

-- ----------------------------
-- Table structure for sys_settings
-- ----------------------------
DROP TABLE IF EXISTS `sys_settings`;
CREATE TABLE `sys_settings`  (
  `company_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业ID',
  `settings_type` int(2) NOT NULL COMMENT '设置类型',
  `settings_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细设置',
  PRIMARY KEY (`company_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_settings
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
