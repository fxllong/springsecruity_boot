# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.19)
# Database: shiro_boot
# Generation Time: 2017-10-17 09:13:34 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table QRTZ_BLOB_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;

CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table QRTZ_CALENDARS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;

CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table QRTZ_CRON_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;

CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;

INSERT INTO `QRTZ_CRON_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `CRON_EXPRESSION`, `TIME_ZONE_ID`)
VALUES
	('CfScheduler','TASK_1','DEFAULT','0 0/30 * * * ?','Asia/Shanghai'),
	('CfScheduler','TASK_2','DEFAULT','0 0/30 * * * ?','Asia/Shanghai');

/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table QRTZ_FIRED_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;

CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table QRTZ_JOB_DETAILS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;

CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;

INSERT INTO `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `JOB_CLASS_NAME`, `IS_DURABLE`, `IS_NONCONCURRENT`, `IS_UPDATE_DATA`, `REQUESTS_RECOVERY`, `JOB_DATA`)
VALUES
	('CfScheduler','TASK_1','DEFAULT',NULL,'com.cf.utils.ScheduleJob','0','0','0','0',X'ACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400A87B226265616E4E616D65223A22746573745461736B222C2263726561746554696D65223A313439363333303230363030302C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C226A6F624964223A312C226D6574686F644E616D65223A2274657374222C22706172616D73223A2270617261222C2272656D61726B223A22E69C89E58F82E695B0E6B58BE8AF95222C22737461747573223A307D7800'),
	('CfScheduler','TASK_2','DEFAULT',NULL,'com.cf.utils.ScheduleJob','0','0','0','0',X'ACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400997B226265616E4E616D65223A22746573745461736B222C2263726561746554696D65223A313439363437323935363030302C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C226A6F624964223A322C226D6574686F644E616D65223A227465737432222C2272656D61726B223A22E697A0E58F82E695B0E6B58BE8AF95222C22737461747573223A317D7800');

/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table QRTZ_LOCKS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_LOCKS`;

CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;

INSERT INTO `QRTZ_LOCKS` (`SCHED_NAME`, `LOCK_NAME`)
VALUES
	('CfScheduler','STATE_ACCESS'),
	('CfScheduler','TRIGGER_ACCESS');

/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table QRTZ_PAUSED_TRIGGER_GRPS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;

CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table QRTZ_SCHEDULER_STATE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;

CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;

INSERT INTO `QRTZ_SCHEDULER_STATE` (`SCHED_NAME`, `INSTANCE_NAME`, `LAST_CHECKIN_TIME`, `CHECKIN_INTERVAL`)
VALUES
	('CfScheduler','xinglongdeMacBook-Pro.local1508230119698',1508230286990,15000);

/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table QRTZ_SIMPLE_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;

CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table QRTZ_SIMPROP_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;

CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table QRTZ_TRIGGERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;

CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;

INSERT INTO `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `NEXT_FIRE_TIME`, `PREV_FIRE_TIME`, `PRIORITY`, `TRIGGER_STATE`, `TRIGGER_TYPE`, `START_TIME`, `END_TIME`, `CALENDAR_NAME`, `MISFIRE_INSTR`, `JOB_DATA`)
VALUES
	('CfScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1508230800000,-1,5,'WAITING','CRON',1505038199000,0,NULL,2,X'ACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400A87B226265616E4E616D65223A22746573745461736B222C2263726561746554696D65223A313439363333303230363030302C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C226A6F624964223A312C226D6574686F644E616D65223A2274657374222C22706172616D73223A2270617261222C2272656D61726B223A22E69C89E58F82E695B0E6B58BE8AF95222C22737461747573223A307D7800'),
	('CfScheduler','TASK_2','DEFAULT','TASK_2','DEFAULT',NULL,1505039400000,-1,5,'PAUSED','CRON',1505038199000,0,NULL,2,X'ACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400997B226265616E4E616D65223A22746573745461736B222C2263726561746554696D65223A313439363437323935363030302C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C226A6F624964223A322C226D6574686F644E616D65223A227465737432222C2272656D61726B223A22E697A0E58F82E695B0E6B58BE8AF95222C22737461747573223A317D7800');

/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schedule_job
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schedule_job`;

CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务';

LOCK TABLES `schedule_job` WRITE;
/*!40000 ALTER TABLE `schedule_job` DISABLE KEYS */;

INSERT INTO `schedule_job` (`job_id`, `bean_name`, `method_name`, `params`, `cron_expression`, `status`, `remark`, `create_time`)
VALUES
	(1,'testTask','test','para','0 0/30 * * * ?',0,'有参数测试','2017-06-01 23:16:46'),
	(2,'testTask','test2',NULL,'0 0/30 * * * ?',1,'无参数测试','2017-06-03 14:55:56');

/*!40000 ALTER TABLE `schedule_job` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schedule_job_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schedule_job_log`;

CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

LOCK TABLES `schedule_job_log` WRITE;
/*!40000 ALTER TABLE `schedule_job_log` DISABLE KEYS */;

INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `method_name`, `params`, `status`, `error`, `times`, `create_time`)
VALUES
	(1,1,'testTask','test','para',0,NULL,1013,'2017-09-10 18:30:00'),
	(2,1,'testTask','test','para',0,NULL,1006,'2017-09-10 19:00:00'),
	(3,1,'testTask','test','para',0,NULL,1012,'2017-09-10 19:30:00'),
	(4,1,'testTask','test','para',0,NULL,1011,'2017-09-10 20:00:00'),
	(5,1,'testTask','test','para',0,NULL,1008,'2017-09-10 20:30:00'),
	(6,1,'testTask','test','para',0,NULL,1008,'2017-09-10 21:00:00'),
	(7,1,'testTask','test','para',0,NULL,1006,'2017-09-10 21:30:00'),
	(8,1,'testTask','test','para',0,NULL,1007,'2017-09-10 22:00:00'),
	(9,1,'testTask','test','para',0,NULL,1031,'2017-10-10 11:00:00'),
	(10,1,'testTask','test','para',0,NULL,1021,'2017-10-15 20:54:40'),
	(11,1,'testTask','test','para',0,NULL,1018,'2017-10-15 21:00:00'),
	(12,1,'testTask','test','para',0,NULL,1015,'2017-10-16 11:00:00'),
	(13,1,'testTask','test','para',0,NULL,1016,'2017-10-16 12:00:00'),
	(14,1,'testTask','test','para',0,NULL,1009,'2017-10-16 12:30:00'),
	(15,1,'testTask','test','para',0,NULL,1014,'2017-10-16 13:30:00'),
	(16,1,'testTask','test','para',0,NULL,1008,'2017-10-16 14:00:00'),
	(17,1,'testTask','test','para',0,NULL,1022,'2017-10-16 19:00:00'),
	(18,1,'testTask','test','para',0,NULL,1012,'2017-10-16 20:30:00'),
	(19,1,'testTask','test','para',0,NULL,1016,'2017-10-16 21:00:00'),
	(20,1,'testTask','test','para',0,NULL,1011,'2017-10-16 21:30:00'),
	(21,1,'testTask','test','para',0,NULL,1012,'2017-10-16 22:00:00'),
	(22,1,'testTask','test','para',0,NULL,1010,'2017-10-16 22:30:00'),
	(23,1,'testTask','test','para',0,NULL,1012,'2017-10-16 23:00:00'),
	(24,1,'testTask','test','para',0,NULL,1011,'2017-10-16 23:30:00'),
	(25,1,'testTask','test','para',0,NULL,1005,'2017-10-17 00:00:00'),
	(26,1,'testTask','test','para',0,NULL,1012,'2017-10-17 00:30:00'),
	(27,1,'testTask','test','para',0,NULL,1014,'2017-10-17 01:00:00'),
	(28,1,'testTask','test','para',0,NULL,1005,'2017-10-17 01:30:00'),
	(29,1,'testTask','test','para',0,NULL,1009,'2017-10-17 02:00:00'),
	(30,1,'testTask','test','para',0,NULL,1011,'2017-10-17 02:30:00'),
	(31,1,'testTask','test','para',0,NULL,1011,'2017-10-17 03:00:00'),
	(32,1,'testTask','test','para',0,NULL,1007,'2017-10-17 03:30:00'),
	(33,1,'testTask','test','para',0,NULL,1012,'2017-10-17 04:00:00'),
	(34,1,'testTask','test','para',0,NULL,1009,'2017-10-17 04:30:00'),
	(35,1,'testTask','test','para',0,NULL,1011,'2017-10-17 05:00:00'),
	(36,1,'testTask','test','para',0,NULL,1013,'2017-10-17 05:30:00'),
	(37,1,'testTask','test','para',0,NULL,1013,'2017-10-17 06:00:00'),
	(38,1,'testTask','test','para',0,NULL,1012,'2017-10-17 06:30:00'),
	(39,1,'testTask','test','para',0,NULL,1009,'2017-10-17 07:00:00'),
	(40,1,'testTask','test','para',0,NULL,1010,'2017-10-17 07:30:00'),
	(41,1,'testTask','test','para',0,NULL,1007,'2017-10-17 08:00:00'),
	(42,1,'testTask','test','para',0,NULL,1007,'2017-10-17 08:30:00'),
	(43,1,'testTask','test','para',0,NULL,1014,'2017-10-17 09:00:00'),
	(44,1,'testTask','test','para',0,NULL,1007,'2017-10-17 09:30:00'),
	(45,1,'testTask','test','para',0,NULL,1012,'2017-10-17 10:00:00'),
	(46,1,'testTask','test','para',0,NULL,1014,'2017-10-17 13:30:00'),
	(47,1,'testTask','test','para',0,NULL,1013,'2017-10-17 14:00:00'),
	(48,1,'testTask','test','para',0,NULL,1044,'2017-10-17 14:30:00'),
	(49,1,'testTask','test','para',0,NULL,1014,'2017-10-17 15:00:00');

/*!40000 ALTER TABLE `schedule_job_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;

INSERT INTO `sys_config` (`id`, `key`, `value`, `status`, `remark`)
VALUES
	(1,'CLOUD_STORAGE_CONFIG_KEY','{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}',0,'云存储配置信息'),
	(2,'sda','ada',1,'ad');

/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志';

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;

INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `ip`, `create_date`)
VALUES
	(1,'admin','保存菜单','com.cf.controller.SysMenuController.save()','{\"name\":\"商城配置\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}','0:0:0:0:0:0:0:1','2017-09-10 18:13:12'),
	(2,NULL,'保存角色','com.cf.controller.SysRoleController.save()','{\"menuIdList\":[],\"roleName\":\"运营人员\"}','0:0:0:0:0:0:0:1','2017-10-15 20:51:24'),
	(3,NULL,'保存角色','com.cf.controller.SysRoleController.save()','{\"menuIdList\":[],\"remark\":\"大手大脚\",\"roleName\":\"运营人员\"}','0:0:0:0:0:0:0:1','2017-10-15 20:51:29'),
	(4,NULL,'保存用户','com.cf.controller.SysUserController.save()','{\"email\":\"asd@qq.com\",\"mobile\":\"123213\",\"roleIdList\":[],\"status\":1,\"username\":\"aa\"}','0:0:0:0:0:0:0:1','2017-10-15 20:52:57'),
	(5,NULL,'保存菜单','com.cf.controller.SysMenuController.save()','{\"name\":\"一元购\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"type\":0}','0:0:0:0:0:0:0:1','2017-10-15 20:53:34'),
	(6,NULL,'立即执行任务','com.cf.controller.ScheduleJobController.run()','[1]','0:0:0:0:0:0:0:1','2017-10-15 20:54:40'),
	(7,NULL,'保存角色','com.cf.controller.SysRoleController.save()','{\"menuIdList\":[1,6,7,8,9,10,11,12,13,14,30,31],\"remark\":\"运营人员\",\"roleName\":\"运营人员\"}','0:0:0:0:0:0:0:1','2017-10-16 11:12:08'),
	(8,NULL,'保存用户','com.cf.controller.SysUserController.save()','{\"email\":\"1107999877@qq.com\",\"mobile\":\"17701092600\",\"roleIdList\":[3],\"status\":1,\"username\":\"fxllong262553\"}','0:0:0:0:0:0:0:1','2017-10-16 11:12:39'),
	(9,NULL,'保存用户','com.cf.controller.SysUserController.save()','{\"email\":\"11@qq.com\",\"mobile\":\"17701092600\",\"roleIdList\":[3],\"status\":1,\"username\":\"luke\"}','0:0:0:0:0:0:0:1','2017-10-16 11:19:57'),
	(10,NULL,'修改角色','com.cf.controller.SysRoleController.update()','{\"createTime\":1508123528000,\"createUserId\":1,\"menuIdList\":[1,6,7,8,9,10,11,12,13,14],\"remark\":\"运营人员\",\"roleId\":3,\"roleName\":\"运营人员\"}','0:0:0:0:0:0:0:1','2017-10-16 11:22:49'),
	(11,NULL,'修改角色','com.cf.controller.SysRoleController.update()','{\"createTime\":1508123528000,\"createUserId\":1,\"menuIdList\":[1,6,7,8,9,10,11,12,13,14],\"remark\":\"运营人员\",\"roleId\":3,\"roleName\":\"运营人员\"}','0:0:0:0:0:0:0:1','2017-10-16 11:24:18'),
	(12,NULL,'修改角色','com.cf.controller.SysRoleController.update()','{\"createTime\":1508123528000,\"createUserId\":1,\"menuIdList\":[1,3,19,20,21,22],\"remark\":\"运营人员\",\"roleId\":3,\"roleName\":\"运营人员\"}','0:0:0:0:0:0:0:1','2017-10-16 11:27:46'),
	(13,NULL,'修改用户','com.cf.controller.SysUserController.update()','{\"createTime\":1508123997000,\"email\":\"11@qq.com\",\"mobile\":\"17701092600\",\"roleIdList\":[3],\"status\":1,\"userId\":4,\"username\":\"luke\"}','0:0:0:0:0:0:0:1','2017-10-16 11:49:27'),
	(14,NULL,'修改角色','com.cf.controller.SysRoleController.update()','{\"createTime\":1508123528000,\"createUserId\":1,\"menuIdList\":[1,3,19,20,21,22,6,7,8,9,10,11,12,13,14,30,31],\"remark\":\"运营人员\",\"roleId\":3,\"roleName\":\"运营人员\"}','0:0:0:0:0:0:0:1','2017-10-16 12:18:07'),
	(15,NULL,'保存配置','com.cf.controller.SysConfigController.save()','{\"key\":\"sda\",\"remark\":\"ad\",\"value\":\"ada\"}','0:0:0:0:0:0:0:1','2017-10-16 12:56:58'),
	(16,NULL,'保存用户','com.cf.controller.SysUserController.save()','{\"email\":\"110@qq.com\",\"mobile\":\"2313131\",\"roleIdList\":[3],\"status\":1,\"username\":\"dawei\"}','0:0:0:0:0:0:0:1','2017-10-17 13:16:10'),
	(17,NULL,'保存用户','com.cf.controller.SysUserController.save()','{\"email\":\"ad@qq.com\",\"mobile\":\"231\",\"roleIdList\":[3],\"status\":1,\"username\":\"z1\"}','0:0:0:0:0:0:0:1','2017-10-17 13:21:32'),
	(18,NULL,'保存用户','com.cf.controller.SysUserController.save()','{\"email\":\"as@qq.com\",\"mobile\":\"123\",\"roleIdList\":[3],\"status\":1,\"username\":\"d1\"}','0:0:0:0:0:0:0:1','2017-10-17 13:28:20'),
	(19,NULL,'保存用户','com.cf.controller.SysUserController.save()','{\"email\":\"sad@qq.com\",\"mobile\":\"2131\",\"roleIdList\":[3],\"status\":1,\"username\":\"a1\"}','0:0:0:0:0:0:0:1','2017-10-17 14:53:22'),
	(20,NULL,'删除用户','com.cf.controller.SysUserController.delete()','[8]','0:0:0:0:0:0:0:1','2017-10-17 15:18:03'),
	(21,NULL,'保存用户','com.cf.controller.SysUserController.save()','{\"email\":\"as@qq.com\",\"mobile\":\"121\",\"roleIdList\":[3],\"status\":1,\"username\":\"t1\"}','0:0:0:0:0:0:0:1','2017-10-17 15:18:19'),
	(22,NULL,'删除用户','com.cf.controller.SysUserController.delete()','[10]','0:0:0:0:0:0:0:1','2017-10-17 15:19:16'),
	(23,NULL,'保存用户','com.cf.controller.SysUserController.save()','{\"email\":\"123@qq.com\",\"mobile\":\"1231\",\"roleIdList\":[3],\"status\":1,\"username\":\"t1\"}','0:0:0:0:0:0:0:1','2017-10-17 15:19:30'),
	(24,NULL,'保存用户','com.cf.controller.SysUserController.save()','{\"email\":\"sad@qq.com\",\"mobile\":\"2131\",\"roleIdList\":[3],\"status\":1,\"username\":\"a1\"}','0:0:0:0:0:0:0:1','2017-10-17 15:28:55'),
	(25,NULL,'删除用户','com.cf.controller.SysUserController.delete()','[12]','0:0:0:0:0:0:0:1','2017-10-17 15:36:27'),
	(26,NULL,'删除用户','com.cf.controller.SysUserController.delete()','[6]','0:0:0:0:0:0:0:1','2017-10-17 15:36:31'),
	(27,NULL,'保存用户','com.cf.controller.SysUserController.save()','{\"email\":\"sad@qq.com\",\"mobile\":\"2313\",\"roleIdList\":[3],\"status\":1,\"username\":\"a1\"}','0:0:0:0:0:0:0:1','2017-10-17 15:36:48'),
	(28,NULL,'删除用户','com.cf.controller.SysUserController.delete()','[13]','0:0:0:0:0:0:0:1','2017-10-17 15:45:17'),
	(29,NULL,'保存用户','com.cf.controller.SysUserController.save()','{\"email\":\"as@qq.com\",\"mobile\":\"231\",\"roleIdList\":[3],\"status\":1,\"username\":\"a1\"}','0:0:0:0:0:0:0:1','2017-10-17 15:45:31'),
	(30,NULL,'保存用户','com.cf.controller.SysUserController.save()','{\"email\":\"21@qq.com\",\"mobile\":\"123\",\"roleIdList\":[3],\"status\":1,\"username\":\"a1\"}','0:0:0:0:0:0:0:1','2017-10-17 16:03:19'),
	(31,NULL,'保存用户','com.cf.controller.SysUserController.save()','{\"email\":\"sa@qq.com\",\"mobile\":\"1231\",\"roleIdList\":[3],\"status\":1,\"username\":\"d1\"}','0:0:0:0:0:0:0:1','2017-10-17 16:37:44');

/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单管理';

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES
	(1,0,'系统管理',NULL,'sys',0,'fa fa-cog',0),
	(2,1,'用户管理','sys/user.html','sys:user:list,sys:user:info',1,'fa fa-user',1),
	(3,1,'角色管理','sys/role.html','sys:role:list,sys:role:info',1,'fa fa-user-secret',2),
	(4,1,'菜单管理','sys/menu.html','sys:menu:list,sys:menu:info',1,'fa fa-th-list',3),
	(5,1,'SQL监控','druid/sql.html','montior',1,'fa fa-bug',4),
	(6,1,'定时任务管理','sys/schedule.html','sys:schedule:list,sys:schedule:info',1,'fa fa-tasks',5),
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
	(20,3,'新增',NULL,'sys:role:save,sys:menu:perms',2,NULL,0),
	(21,3,'修改',NULL,'sys:role:update,sys:menu:perms',2,NULL,0),
	(22,3,'删除',NULL,'sys:role:delete',2,NULL,0),
	(23,4,'查看',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),
	(24,4,'新增',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),
	(25,4,'修改',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),
	(26,4,'删除',NULL,'sys:menu:delete',2,NULL,0),
	(27,1,'参数管理','sys/config.html','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'fa fa-sun-o',6),
	(28,1,'代码生成器','sys/generator.html','sys:generator:list,sys:generator:code',1,'fa fa-rocket',8),
	(29,1,'系统日志','sys/log.html','sys:log:list',1,'fa fa-file-text-o',7),
	(30,0,'商城配置',NULL,'mall',0,NULL,0),
	(31,0,'一元购',NULL,'one',0,NULL,0);

/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` (`role_id`, `role_name`, `remark`, `create_user_id`, `create_time`)
VALUES
	(3,'运营人员','运营人员',1,'2017-10-16 11:12:08');

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;

INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`)
VALUES
	(39,3,1),
	(40,3,3),
	(41,3,19),
	(42,3,20),
	(43,3,21),
	(44,3,22),
	(45,3,6),
	(46,3,7),
	(47,3,8),
	(48,3,9),
	(49,3,10),
	(50,3,11),
	(51,3,12),
	(52,3,13),
	(53,3,14),
	(54,3,30),
	(55,3,31);

/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户';

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`user_id`, `username`, `password`, `email`, `mobile`, `status`, `create_user_id`, `create_time`)
VALUES
	(1,'admin','123456','100@qq.com','13666666666',1,NULL,'2017-06-01 15:33:20'),
	(4,'luke','123456','11@qq.com','17701092600',1,NULL,'2017-10-16 11:19:57'),
	(15,'a1','7cbdf569746dd62484eb25a55b7df2dc','21@qq.com','123',1,NULL,'2017-10-17 16:03:19'),
	(16,'d1','$2a$10$11Y6pUykwYi8M4WL3XkWXez0UPdrfrZaWIsHbdVjyJ.U9uGF7jbZS','sa@qq.com','1231',1,NULL,'2017-10-17 16:37:44');

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;

INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`)
VALUES
	(2,4,3),
	(3,5,3),
	(5,7,3),
	(6,9,3),
	(8,11,3),
	(11,14,3),
	(12,15,3),
	(13,16,3);

/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_token`;

CREATE TABLE `tb_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';



# Dump of table tb_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;

INSERT INTO `tb_user` (`user_id`, `username`, `mobile`, `password`, `create_time`)
VALUES
	(1,'test','13888888888','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','2017-03-23 22:37:41');

/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
