/*
Navicat MySQL Data Transfer

Source Server         : 120.76.250.153
Source Server Version : 50634
Source Host           : 120.76.250.153:3306
Source Database       : foblog

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2017-04-27 11:05:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_article`
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL COMMENT '����',
  `summary` varchar(600) DEFAULT NULL COMMENT '��Ҫ',
  `content` text COMMENT '����',
  `category_ids` varchar(20) DEFAULT NULL COMMENT '���id,���,��/�ֿ�',
  `tag_ids` varchar(20) DEFAULT NULL COMMENT '��ǩid,���,��,�ֿ�',
  `status` int(1) NOT NULL COMMENT '����״̬��0-�ݸ壬1-����',
  `write_time` datetime DEFAULT NULL COMMENT '׫дʱ��',
  `pub_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `hits` int(10) DEFAULT '0',
  `code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `article_code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------

-- ----------------------------
-- Table structure for `t_authors`
-- ----------------------------
DROP TABLE IF EXISTS `t_authors`;
CREATE TABLE `t_authors` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL COMMENT '�˻���',
  `password` varchar(32) NOT NULL COMMENT '�˻�����',
  `pen_name` varchar(20) DEFAULT NULL COMMENT '����',
  `email` varchar(30) DEFAULT NULL COMMENT '��������',
  `profile` text COMMENT '���˽���',
  `verification_code` varchar(32) DEFAULT NULL COMMENT '��֤��',
  `varif_code_deadline` datetime DEFAULT NULL COMMENT '��֤���ֹʱ��',
  `security_question_id` int(10) DEFAULT NULL COMMENT '�ܱ�����id',
  `user_status` int(1) DEFAULT NULL COMMENT '�û�״̬:0���ã�1����',
  `other_info` varchar(500) DEFAULT NULL COMMENT '������Ϣ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_authors
-- ----------------------------

-- ----------------------------
-- Table structure for `t_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) DEFAULT NULL COMMENT '����',
  `name` varchar(30) NOT NULL COMMENT '����',
  `status` tinyint(1) DEFAULT '0' COMMENT 'չʾ״̬',
  `code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------

-- ----------------------------
-- Table structure for `t_friendlink`
-- ----------------------------
DROP TABLE IF EXISTS `t_friendlink`;
CREATE TABLE `t_friendlink` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `website` varchar(60) NOT NULL,
  `hits` int(10) DEFAULT '0',
  `priority` int(2) DEFAULT NULL,
  `web_author_name` varchar(20) DEFAULT NULL,
  `web_author_email` varchar(30) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_friendlink
-- ----------------------------

-- ----------------------------
-- Table structure for `t_guest`
-- ----------------------------
DROP TABLE IF EXISTS `t_guest`;
CREATE TABLE `t_guest` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) DEFAULT NULL COMMENT 'ͨѶ����',
  `nickname` varchar(30) NOT NULL COMMENT '�ǳ�',
  `personal_website` varchar(50) DEFAULT NULL COMMENT '������ַ',
  `access_ip` varchar(30) DEFAULT NULL COMMENT '����IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guest
-- ----------------------------


-- ----------------------------
-- Table structure for `t_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL COMMENT '��id',
  `content` varchar(600) NOT NULL COMMENT '����',
  `user_type` int(1) NOT NULL COMMENT '�����������author���ߣ�guest�ÿͣ�',
  `author_id` int(10) NOT NULL COMMENT '����id',
  `article_id` int(10) NOT NULL COMMENT '��������id',
  `pub_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `block_id` int(10) DEFAULT NULL COMMENT '�������µ������������ڵڼ���',
  `support_count` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------


-- ----------------------------
-- Table structure for `t_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `introduction` varchar(1000) DEFAULT NULL,
  `article_url` varchar(200) DEFAULT NULL,
  `down_url` varchar(100) DEFAULT NULL,
  `hits` int(10) DEFAULT NULL,
  `pub_time` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_project
-- ----------------------------

-- ----------------------------
-- Table structure for `t_recommend`
-- ----------------------------
DROP TABLE IF EXISTS `t_recommend`;
CREATE TABLE `t_recommend` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL COMMENT '����',
  `has_content` int(1) DEFAULT '0' COMMENT '�Ƿ��������',
  `article_url` varchar(300) DEFAULT NULL COMMENT '���¶�Ӧ��url',
  `content_id` int(10) DEFAULT NULL COMMENT '��Ӧ������id��ǰ��Ϊhas_contentΪtrue����1',
  `hits` int(10) DEFAULT '0' COMMENT '�����',
  `pub_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `summary` varchar(300) DEFAULT NULL COMMENT '��Ҫ˵��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recommend
-- ----------------------------


-- ----------------------------
-- Table structure for `t_security_question`
-- ----------------------------
DROP TABLE IF EXISTS `t_security_question`;
CREATE TABLE `t_security_question` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_type` int(1) NOT NULL COMMENT '�û���𣨹���Ա�����ߣ�',
  `question01` varchar(30) NOT NULL,
  `answer01` varchar(20) NOT NULL,
  `question02` varchar(30) DEFAULT NULL,
  `answer02` varchar(20) DEFAULT NULL,
  `question03` varchar(30) DEFAULT NULL,
  `answer03` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security_question
-- ----------------------------

-- ----------------------------
-- Table structure for `t_tag`
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '��ǩ����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
