/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50173
Source Host           : 127.0.0.1:3306
Source Database       : e-litigationxz

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-01-20 18:05:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `ID` varchar(255) NOT NULL,
  `ATTR_ID` varchar(32) DEFAULT NULL,
  `CHANNEL_ID` varchar(32) DEFAULT NULL,
  `CONTENT` text,
  `PRE_ID` varchar(32) DEFAULT NULL,
  `NEXT_ID` varchar(32) DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `SHORT_TITLE` varchar(100) DEFAULT NULL,
  `TITLE_COLOR` char(10) DEFAULT NULL,
  `TITLE_IMG` varchar(100) DEFAULT NULL,
  `CONTENT_IMG` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(256) DEFAULT NULL,
  `TAGS` varchar(256) DEFAULT NULL,
  `AUTHOR` varchar(100) DEFAULT NULL,
  `ORIGIN` varchar(100) DEFAULT NULL,
  `SORT_DATE` varchar(24) DEFAULT NULL,
  `RELEASE_DATE` varchar(24) DEFAULT NULL,
  `RELEASE_SYS_DATE` varchar(24) DEFAULT NULL,
  `CHECK_TIME` varchar(24) DEFAULT NULL,
  `DISABLE_TIME` varchar(24) DEFAULT NULL,
  `VISIT_TOTAL` decimal(20,0) DEFAULT NULL,
  `VISIT_TODAY` decimal(20,0) DEFAULT NULL,
  `VISIT_WEEK` decimal(20,0) DEFAULT NULL,
  `VISIT_MONTH` decimal(20,0) DEFAULT NULL,
  `VISIT_QUARTER` decimal(20,0) DEFAULT NULL,
  `VISIT_YEAR` decimal(20,0) DEFAULT NULL,
  `OUTER_URL` varchar(100) DEFAULT NULL,
  `STAT_DATE` varchar(24) DEFAULT NULL,
  `CONTENT_RES_PATH` varchar(200) DEFAULT NULL,
  `PAGE_COUNT` int(11) DEFAULT NULL,
  `TPL_CONTENT` varchar(100) DEFAULT NULL,
  `CHECK_STEP` int(11) DEFAULT NULL,
  `TOP_LEVEL` varchar(10) DEFAULT NULL,
  `COMMENT_COUNT` int(11) DEFAULT NULL,
  `CHECK_OPINION` varchar(256) DEFAULT NULL,
  `RELATED_IDS` varchar(256) DEFAULT NULL,
  `IS_HAS_TITLEIMG` char(1) DEFAULT '0' COMMENT '0û1УĬ0',
  `IS_ALLOW_COMMENT` char(1) DEFAULT '1' COMMENT '01Ĭ1',
  `IS_BOLD` char(1) DEFAULT '0' COMMENT '01ǣĬ0',
  `IS_DRAFT` char(1) DEFAULT '1' COMMENT '01Ĭ1',
  `IS_RECOMMEND` char(1) DEFAULT '0' COMMENT '01ǣĬ0',
  `IS_CHECK` char(1) DEFAULT '0' COMMENT '01Ĭ0',
  `IS_DISABLED` char(1) DEFAULT '1' COMMENT '0ֹͣʹ1ʹãĬ1',
  `IS_REJECT` char(1) DEFAULT '0' COMMENT '01ǣĬ0',
  `IS_RELEASED` char(1) NOT NULL DEFAULT 'N',
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL COMMENT 'ʱ',
  `IS_DELETE` char(1) DEFAULT '1' COMMENT '0ɾ1ɾĬ1',
  `STATE` char(1) DEFAULT '1' COMMENT '״̬,01Ĭ1',
  `REMARK` varchar(256) DEFAULT NULL COMMENT 'עϢ',
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_1` (`ATTR_ID`) USING BTREE,
  KEY `FK_Relationship_3` (`CHANNEL_ID`) USING BTREE,
  KEY `FKFD5CBC051960094` (`ATTR_ID`) USING BTREE,
  KEY `FKFD5CBC026CFC0BF` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKFD5CBC0DDB54B3E` (`CHANNEL_ID`) USING BTREE,
  KEY `FKFD5CBC06636104B` (`ATTR_ID`) USING BTREE,
  KEY `FKFD5CBC09B6243F6` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKFD5CBC05247CE75` (`CHANNEL_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('4028813c52430f3b015244887141000b', null, '402881f7508813af0150886dcc4e0000', '<p>荥阳法院公告</p>', '0', '0', '荥阳法院公告', null, '', null, null, '', null, 'xingyang', '', null, '2016-01-15 17:06:36', null, null, null, '0', '0', '0', '0', '0', '0', '/tongzhi/2016-01-15/4028813c52430f3b015244887141000b_1.html', null, null, '0', null, '0', null, '0', null, null, null, null, null, null, null, null, null, null, 'Y', '4028813c52430f3b015244858c870006', '2016-01-15 17:05:38', '1', '1', null, 'xyfy');
INSERT INTO `cms_article` VALUES ('4028813c52430f3b01524483db570002', null, '402881f7508813af0150886dcc4e0000', '<p>郑州中级人民法院公告</p>', '0', '0', '郑州中级人民法院公告', null, '', null, null, '', null, '超级管理员', '', null, '2016-01-15 17:06:38', null, null, null, '0', '0', '0', '0', '0', '0', '/tongzhi/2016-01-15/4028813c52430f3b01524483db570002_1.html', null, null, '0', null, '0', null, '0', null, null, null, null, null, null, null, null, null, null, 'Y', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-15 17:00:38', '1', '1', null, 'zzfy');
INSERT INTO `cms_article` VALUES ('4028813c52430f3b015244876b190009', null, '402881f7508813af0150886dcc4e0000', '<p>新郑法院公告</p>', '0', '0', '新郑法院公告', null, '', null, null, '', null, 'xinzheng', '', null, '2016-01-15 17:06:38', null, null, null, '2', '0', '0', '0', '0', '0', '/tongzhi/2016-01-15/4028813c52430f3b015244876b190009_1.html', null, null, '0', null, '0', null, '0', null, null, null, null, null, null, null, null, null, null, 'Y', '4028813c52430f3b015244853f500005', '2016-01-15 17:04:31', '1', '1', null, 'xzfy');
INSERT INTO `cms_article` VALUES ('4028813c5257c970015257ce77e60007', null, '402881f7508813af0150887fd0700004', '<p>新郑法院减刑假释公告</p>', '0', '0', '新郑法院减刑假释公告', null, '', null, null, '新郑法院减刑假释公告', null, '信息处', '新郑法院', null, '2016-01-19 10:55:27', null, null, null, '2', '0', '0', '0', '0', '0', '//2016-01-19/4028813c5257c970015257ce77e60007_1.html', null, null, '0', null, '0', null, '0', null, null, null, null, null, null, null, null, null, null, 'Y', '4028813c52430f3b015244853f500005', '2016-01-19 10:54:54', '1', '1', null, 'xzfy');
INSERT INTO `cms_article` VALUES ('4028813c525cb7d201525d03e9d0000a', null, '402881f7508813af0150887e28e60003', '<p>流程指南1</p>', '0', '0', '流程指南1', null, '', null, null, '', null, '超级管理员', '', null, '2016-01-20 11:11:46', null, null, null, '0', '0', '0', '0', '0', '0', '//2016-01-20/4028813c525cb7d201525d03e9d0000a_1.html', null, null, '0', null, '0', null, '0', null, null, null, null, null, null, null, null, null, null, 'Y', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-20 11:11:23', '1', '1', null, 'zzfy');
INSERT INTO `cms_article` VALUES ('4028813c525cb7d201525d0434e6000b', null, '402881f7508813af0150887e28e60003', '<p>流程指南2</p>', '0', '0', '流程指南2', null, '', null, null, '', null, '超级管理员', '', null, '2016-01-20 11:11:46', null, null, null, '0', '0', '0', '0', '0', '0', '//2016-01-20/4028813c525cb7d201525d0434e6000b_1.html', null, null, '0', null, '0', null, '0', null, null, null, null, null, null, null, null, null, null, 'Y', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-20 11:11:42', '1', '1', null, 'zzfy');

-- ----------------------------
-- Table structure for cms_article_attr
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_attr`;
CREATE TABLE `cms_article_attr` (
  `ID` varchar(32) NOT NULL,
  `ATTR_KEY` varchar(32) DEFAULT NULL,
  `ATTR_NAME` varchar(50) DEFAULT NULL,
  `IMG_WIDTH` int(11) DEFAULT '1',
  `IMG_HEIGHT` int(11) DEFAULT '1',
  `IS_HAS_TITLEIMG` char(1) DEFAULT '0' COMMENT '0û1УĬ0',
  `IS_DISABLED` char(1) DEFAULT '1' COMMENT '0ֹͣʹ1ʹãĬ1',
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL COMMENT 'ʱ',
  `IS_DELETE` char(1) DEFAULT '1' COMMENT '0ɾ1ɾĬ1',
  `STATE` char(1) DEFAULT '1' COMMENT '״̬,01Ĭ1',
  `REMARK` varchar(256) DEFAULT NULL COMMENT 'עϢ',
  `NAME` varchar(50) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK420D171026CFC0BF` (`CREATE_USER_ID`) USING BTREE,
  KEY `FK420D17109B6243F6` (`CREATE_USER_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article_attr
-- ----------------------------

-- ----------------------------
-- Table structure for cms_channel
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel`;
CREATE TABLE `cms_channel` (
  `ID` varchar(32) NOT NULL,
  `MODEL_ID` varchar(32) DEFAULT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `CHANNEL_NAME` varchar(100) DEFAULT NULL,
  `PATH` varchar(20) DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `KEYWORDS` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(256) DEFAULT NULL,
  `TPL_INDEX` varchar(100) DEFAULT NULL,
  `TPL_CONTENT` varchar(100) DEFAULT NULL,
  `VISIT_TOTAL` decimal(20,0) DEFAULT NULL,
  `VISIT_TODAY` decimal(20,0) DEFAULT NULL,
  `PRIORITY` decimal(20,0) DEFAULT NULL,
  `INDEX_PAGE_NUM` varchar(10) DEFAULT NULL,
  `IS_DISPLAY` char(1) DEFAULT '1' COMMENT '0ʾ1ʾĬ1',
  `OUTER_URL` varchar(100) DEFAULT NULL,
  `IS_CONTROL` char(1) DEFAULT '1' COMMENT '1:ŷʣ0ԱʣĬ1',
  `CHANNEL_TYPE` varchar(20) DEFAULT NULL,
  `IS_CONTRIBUTEED` char(1) DEFAULT '1' COMMENT '0:Ͷ  1Ͷ  2ԱͶ壬Ĭ1',
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL COMMENT 'ʱ',
  `IS_DELETE` char(1) DEFAULT '1' COMMENT '0ɾ1ɾĬ1',
  `STATE` char(1) DEFAULT '1' COMMENT '״̬,01Ĭ1',
  `REMARK` varchar(256) DEFAULT NULL COMMENT 'עϢ',
  `SECOND_PAGE_NUM` varchar(10) DEFAULT NULL,
  `DYNAMIC_URL` longtext,
  `IS_DYNAMIC_URL` varchar(2) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_18` (`PARENT_ID`) USING BTREE,
  KEY `FK_Relationship_2` (`MODEL_ID`) USING BTREE,
  KEY `FK67887BCD26CFC0BF` (`CREATE_USER_ID`) USING BTREE,
  KEY `FK67887BCDCC31CA37` (`PARENT_ID`) USING BTREE,
  KEY `FK67887BCD9B6243F6` (`CREATE_USER_ID`) USING BTREE,
  KEY `FK67887BCD40C44D6E` (`PARENT_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_channel
-- ----------------------------
INSERT INTO `cms_channel` VALUES ('1', null, null, '文章栏目', '', '', '', '', null, null, '0', '0', '0', null, '1', null, '1', null, '1', null, null, '1', '1', null, null, null, null, null);
INSERT INTO `cms_channel` VALUES ('4028e30a4d5a9ef3014d5ab165b00000', null, '1', '法院简介', '', '', '', '', null, null, '0', '0', '0', '5', null, null, null, 'artic', null, '8a4583c3379d08e101379d0e3dfe0002', '2015-05-16 11:08:04', '1', '1', null, '10', '', '0', null);
INSERT INTO `cms_channel` VALUES ('402881f7508813af015088819a860005', null, '1', '法官专栏', '', '', '', '', null, null, '0', '0', '0', '5', null, null, null, 'artic', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-21 11:46:46', '1', '1', null, '10', null, null, null);
INSERT INTO `cms_channel` VALUES ('4028e3484d676c2a014d6784a4990000', null, '1', '裁判文书', 'cpws', '', '', '', null, null, '0', '0', '0', '5', null, null, null, 'artic', null, '8a4583c3379d08e101379d0e3dfe0002', '2015-05-18 22:54:15', '1', '1', null, '10', null, null, null);
INSERT INTO `cms_channel` VALUES ('402881f7508813af0150887c99020002', null, '1', '精选案例', '', '', '', '', null, null, '0', '0', '0', '5', null, null, null, 'artic', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-21 11:41:18', '1', '1', null, '10', null, null, null);
INSERT INTO `cms_channel` VALUES ('402881fb5093521c01509363720a0006', null, '402881f7508813af015088819a860005', '联系法官', '', '', '', '', null, null, '0', '0', '0', '5', null, null, null, 'artic', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-23 14:29:39', '1', '1', null, '10', null, null, null);
INSERT INTO `cms_channel` VALUES ('402881fb5093521c0150936401890007', null, '402881f7508813af015088819a860005', '法官风采', '', '', '', '', null, null, '0', '0', '0', '5', null, null, null, '', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-23 14:30:16', '1', '1', null, '10', null, null, null);
INSERT INTO `cms_channel` VALUES ('402881fb5098c0fa015098d1cc430000', null, '1', '诉讼服务指南', '', '', '', '', null, null, '0', '0', '0', '', null, null, null, 'artic', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-24 15:48:17', '1', '1', null, '', null, null, null);
INSERT INTO `cms_channel` VALUES ('402881f7508813af0150886dcc4e0000', null, '1', '通知公告', 'tongzhi', '', '', '', null, null, '0', '0', '0', '5', null, null, null, 'artic', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-21 11:25:08', '1', '1', null, '10', null, null, null);
INSERT INTO `cms_channel` VALUES ('402881f7508813af0150887e28e60003', null, '1', '流程指南', '', '', '', '', null, null, '0', '0', '0', '8', null, null, null, 'download', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-21 11:43:00', '1', '1', null, '10', null, null, null);
INSERT INTO `cms_channel` VALUES ('402881f7508813af0150887fd0700004', null, '1', '减刑假释', '', '', '', '', null, null, '0', '0', '0', '5', null, null, null, 'artic', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-21 11:44:49', '1', '1', null, '10', null, null, null);
INSERT INTO `cms_channel` VALUES ('402881fb5098c0fa015098d2c3d50001', null, '402881fb5098c0fa015098d1cc430000', '如何打官司', 'test', '', '', '', null, null, '0', '0', '0', '1', null, null, null, 'artic', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-24 15:49:20', '1', '1', null, '1', null, null, null);
INSERT INTO `cms_channel` VALUES ('402881fb5098c0fa015098d360510002', null, '402881fb5098c0fa015098d1cc430000', '风险告知', '', '', '', '', null, null, '0', '0', '0', '1', null, null, null, 'artic', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-24 15:50:01', '1', '1', null, '1', null, null, null);
INSERT INTO `cms_channel` VALUES ('402881fb5098c0fa015098d3bf040003', null, '402881fb5098c0fa015098d1cc430000', '网上诉讼指南', '', '', '', '', null, null, '0', '0', '0', '1', null, null, null, 'artic', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-24 15:50:25', '1', '1', null, '1', null, null, null);
INSERT INTO `cms_channel` VALUES ('402881fb5098c0fa015098d493470004', null, '402881fb5098c0fa015098d1cc430000', '裁判文书查询', '', '', '', '', null, null, '0', '0', '0', '1', null, null, null, 'artic', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-24 15:51:19', '1', '1', null, '1', 'http://ws.hncourt.gov.cn/index.php?act=area&court_id=834', '2', null);
INSERT INTO `cms_channel` VALUES ('402881fb5098c0fa015098d4f4720005', null, '402881fb5098c0fa015098d1cc430000', '案件查询', '', '', '', '', null, null, '0', '0', '0', '5', null, null, null, 'artic', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-24 15:51:44', '1', '1', null, '10', '/front/jsp/myCenter/building.jsp', '1', null);
INSERT INTO `cms_channel` VALUES ('402881fb5098c0fa015098d54e550006', null, '402881fb5098c0fa015098d1cc430000', '开庭公告', '', '', '', '', null, null, '0', '0', '0', '5', null, null, null, '', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-24 15:52:07', '1', '1', null, '10', '/lawsuit/courtOpenInfoList.do', '3', null);
INSERT INTO `cms_channel` VALUES ('402881fb509d319901509dff370e0006', null, '1', '律师在线', '', '', '', '', null, null, '0', '0', '0', '', null, null, null, 'artic', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-25 15:56:00', '1', '1', null, '', '', '0', null);
INSERT INTO `cms_channel` VALUES ('402881fb509d319901509dffd66e0007', null, '402881fb509d319901509dff370e0006', '律师平台', '', '', '', '', null, null, '0', '0', '0', '', null, null, null, '', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-25 15:56:40', '1', '1', null, '', '/lawsuit/lo_flist.htm?type=1', '1', null);
INSERT INTO `cms_channel` VALUES ('402881fb509d319901509e00c82a0008', null, '402881fb509d319901509dff370e0006', '律师在线', '', '', '', '', null, null, '0', '0', '0', '', null, null, null, '', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-25 15:57:42', '1', '1', null, '', 'http://www.zzfyssfw.gov.cn/front/jsp/myCenter/contextLaw.jsp', '2', null);
INSERT INTO `cms_channel` VALUES ('402881fb509d319901509e0149bd0009', null, '402881fb509d319901509dff370e0006', '文书模板下载', '', '', '', '', null, null, '0', '0', '0', '5', null, null, null, 'artic', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-25 15:58:15', '1', '1', null, '10', '', '0', null);
INSERT INTO `cms_channel` VALUES ('402881fb509d319901509e0206b6000a', null, '1', '代表委员监督', '', '', '', '', null, null, '0', '0', '0', '', null, null, null, '', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-25 15:59:04', '1', '1', null, '', '/lawsuit/lo_flist.htm?type=2', '1', null);
INSERT INTO `cms_channel` VALUES ('402881fb50ae10770150ae1f23ee0008', null, '402881e95184926701518493d64a004f', '庭审直播', '', '', '', '', null, null, '0', '0', '0', '', null, null, null, '', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-28 19:04:47', '1', '1', null, '', '/lawsuit/co_flist.htm', '1', null);
INSERT INTO `cms_channel` VALUES ('402881e95184926701518493d64a004f', null, '1', '庭审直播', '', '', '', '', null, null, '0', '0', '0', '', null, null, null, '', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-12-09 10:30:59', '1', '1', null, '', '', '0', null);
INSERT INTO `cms_channel` VALUES ('402881e95184926701518495c5d800a0', null, '402881e95184926701518493d64a004f', '历史回顾', '', '', '', '', null, null, '0', '0', '0', '', null, null, null, '', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-12-09 10:33:06', '1', '1', null, '', '/lawsuit/uv_flistVideo.htm', '1', null);

-- ----------------------------
-- Table structure for cms_channel_templet
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel_templet`;
CREATE TABLE `cms_channel_templet` (
  `CHANNEL_ID` varchar(32) NOT NULL,
  `TEMPLET_ID` varchar(32) NOT NULL,
  PRIMARY KEY (`CHANNEL_ID`,`TEMPLET_ID`),
  KEY `FK_Reference_23` (`TEMPLET_ID`) USING BTREE,
  KEY `FK5DE66F351D9264BE` (`TEMPLET_ID`) USING BTREE,
  KEY `FK5DE66F35DDB54B3E` (`CHANNEL_ID`) USING BTREE,
  KEY `FK5DE66F359224E7F5` (`TEMPLET_ID`) USING BTREE,
  KEY `FK5DE66F355247CE75` (`CHANNEL_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_channel_templet
-- ----------------------------
INSERT INTO `cms_channel_templet` VALUES ('402881f7508813af0150886dcc4e0000', '402881e63765954a0137659bd7a40002');
INSERT INTO `cms_channel_templet` VALUES ('402881f7508813af0150886dcc4e0000', '4028e30a4d58a928014d5934d6f10001');
INSERT INTO `cms_channel_templet` VALUES ('402881f7508813af0150886dcc4e0000', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('402881f7508813af0150887c99020002', '402881e637683d620137684f96cc0002');
INSERT INTO `cms_channel_templet` VALUES ('402881f7508813af0150887c99020002', '4028e30a4d58a928014d5934d6f10001');
INSERT INTO `cms_channel_templet` VALUES ('402881f7508813af0150887c99020002', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('402881f7508813af0150887e28e60003', '4028e30a4d58a928014d5934d6f10001');
INSERT INTO `cms_channel_templet` VALUES ('402881f7508813af0150887e28e60003', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('402881f7508813af0150887fd0700004', '4028e30a4d58a928014d5934d6f10001');
INSERT INTO `cms_channel_templet` VALUES ('402881f7508813af0150887fd0700004', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('402881f7508813af015088819a860005', '4028e30a4d58a928014d5934d6f10001');
INSERT INTO `cms_channel_templet` VALUES ('402881f7508813af015088819a860005', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('402881fb5093521c01509363720a0006', '4028e30a4d58a928014d590508d70000');
INSERT INTO `cms_channel_templet` VALUES ('402881fb5093521c01509363720a0006', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('402881fb5093521c0150936401890007', '4028e30a4d58a928014d5934d6f10001');
INSERT INTO `cms_channel_templet` VALUES ('402881fb5093521c0150936401890007', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('402881fb5098c0fa015098d1cc430000', '4028e30a4d58a928014d5934d6f10001');
INSERT INTO `cms_channel_templet` VALUES ('402881fb5098c0fa015098d1cc430000', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('402881fb5098c0fa015098d2c3d50001', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('402881fb5098c0fa015098d360510002', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('402881fb5098c0fa015098d3bf040003', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('402881fb5098c0fa015098d493470004', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('402881fb5098c0fa015098d4f4720005', '4028e30a4d58a928014d5934d6f10001');
INSERT INTO `cms_channel_templet` VALUES ('402881fb5098c0fa015098d4f4720005', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('402881fb5098c0fa015098d54e550006', '4028e30a4d58a928014d5934d6f10001');
INSERT INTO `cms_channel_templet` VALUES ('402881fb5098c0fa015098d54e550006', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('402881fb509d319901509dff370e0006', '4028e30a4d58a928014d5934d6f10001');
INSERT INTO `cms_channel_templet` VALUES ('402881fb509d319901509e0149bd0009', '4028e30a4d58a928014d5934d6f10001');
INSERT INTO `cms_channel_templet` VALUES ('402881fb509d319901509e0149bd0009', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('4028e30a4d5a9ef3014d5ab165b00000', '4028e30a4d58a928014d5934d6f10001');
INSERT INTO `cms_channel_templet` VALUES ('4028e30a4d5a9ef3014d5ab165b00000', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('4028e3484d676c2a014d6784a4990000', '4028e30a4d58a928014d5934d6f10001');
INSERT INTO `cms_channel_templet` VALUES ('4028e3484d676c2a014d6784a4990000', '8a4583c4377786ae013777b48ce90004');
INSERT INTO `cms_channel_templet` VALUES ('8ad5710b2b950bfd012b9511030a0009', '8ad549292bb7cd82012bb7ce6a090003');
INSERT INTO `cms_channel_templet` VALUES ('8ad5710b2b950bfd012b9511030a0009', '8ad549292bb7cd82012bb7cf96740005');

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `ID` varchar(32) NOT NULL,
  `ARTICEL_ID` varchar(32) DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `CONTENT` text,
  `IP` varchar(20) DEFAULT NULL,
  `IS_CHECK` char(1) DEFAULT '0' COMMENT '01Ĭ0',
  `IS_RECOMMEND` char(1) DEFAULT '0' COMMENT '01ǣĬ0',
  `IS_DISABLED` char(1) DEFAULT '1' COMMENT '0ֹͣʹ1ʹãĬ1',
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL COMMENT 'ʱ',
  `REPLAY_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_11` (`ARTICEL_ID`) USING BTREE,
  KEY `FK7422ED29DB8B2CFD` (`REPLAY_ID`) USING BTREE,
  KEY `FK7422ED295F194B82` (`CREATE_USER_ID`) USING BTREE,
  KEY `FK7422ED2928DEC70` (`ARTICEL_ID`) USING BTREE,
  KEY `FK7422ED2948662AF4` (`REPLAY_ID`) USING BTREE,
  KEY `FK7422ED296B1E056B` (`CREATE_USER_ID`) USING BTREE,
  KEY `FK7422ED2977206FA7` (`ARTICEL_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment_replay`;
CREATE TABLE `cms_comment_replay` (
  `ID` decimal(20,0) NOT NULL,
  `COMMENT_ID` varchar(32) DEFAULT NULL,
  `COMMNET` varchar(1024) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL COMMENT 'ʱ',
  `IS_DELETE` char(1) DEFAULT '1' COMMENT '0ɾ1ɾĬ1',
  `STATE` char(1) DEFAULT '1' COMMENT '״̬,01Ĭ1',
  `REMARK` varchar(256) DEFAULT NULL COMMENT 'עϢ',
  `REPLAY_CONTENT` longtext,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_19` (`COMMENT_ID`) USING BTREE,
  KEY `FK4C87DBBD26CFC0BF` (`CREATE_USER_ID`) USING BTREE,
  KEY `FK4C87DBBD9B6243F6` (`CREATE_USER_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_comment_replay
-- ----------------------------

-- ----------------------------
-- Table structure for cms_member
-- ----------------------------
DROP TABLE IF EXISTS `cms_member`;
CREATE TABLE `cms_member` (
  `ID` varchar(32) NOT NULL,
  `member_group_id` varchar(32) DEFAULT NULL,
  `SCORE` int(11) DEFAULT NULL,
  `COUPON` int(11) DEFAULT NULL,
  `UPLOAD_STAT_DATE` varchar(20) DEFAULT NULL,
  `UPLOAD_TOTAL_SIZE` bigint(20) DEFAULT NULL,
  `IS_DISABLED` char(1) DEFAULT '1' COMMENT '0ֹͣʹ1ʹãĬ1',
  `NAME` varchar(100) DEFAULT NULL,
  `REGISTER_TIME` varchar(20) DEFAULT NULL COMMENT 'עʱ',
  `SEX` char(1) DEFAULT NULL COMMENT 'Ա',
  `TELEPHONE` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `MEMBGER_GROUP_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_16` (`member_group_id`) USING BTREE,
  KEY `FK5E950670557EA77C` (`MEMBGER_GROUP_ID`) USING BTREE,
  KEY `FK5E9506706A1EB733` (`MEMBGER_GROUP_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_member
-- ----------------------------

-- ----------------------------
-- Table structure for cms_member_group
-- ----------------------------
DROP TABLE IF EXISTS `cms_member_group`;
CREATE TABLE `cms_member_group` (
  `ID` varchar(32) NOT NULL,
  `GROUP_NAME` varchar(100) DEFAULT NULL,
  `GROUP_LEVEL` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(256) DEFAULT NULL,
  `UPLOAD_SIZE` int(11) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_member_group
-- ----------------------------

-- ----------------------------
-- Table structure for cms_role_channel
-- ----------------------------
DROP TABLE IF EXISTS `cms_role_channel`;
CREATE TABLE `cms_role_channel` (
  `ROLE_ID` varchar(32) NOT NULL,
  `CHANNEL_ID` varchar(32) NOT NULL,
  `ID` varchar(32) NOT NULL,
  `AUTH` varchar(10) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`CHANNEL_ID`),
  UNIQUE KEY `ID` (`ID`) USING BTREE,
  KEY `FK_Relationship_21` (`CHANNEL_ID`) USING BTREE,
  KEY `FK96D42170C1F27122` (`ROLE_ID`) USING BTREE,
  KEY `FK96D42170DDB54B3E` (`CHANNEL_ID`) USING BTREE,
  KEY `FK96D421703684F459` (`ROLE_ID`) USING BTREE,
  KEY `FK96D421705247CE75` (`CHANNEL_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_role_channel
-- ----------------------------
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881fb50ae10770150ae1f23ee0008', '4028813c520bfda201520c0d8f18004f', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881e95184926701518493d64a004f', '4028813c520bfda201520c0d8f18004e', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881fb509d319901509e0206b6000a', '4028813c520bfda201520c0d8f18004d', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881fb509d319901509e0149bd0009', '4028813c520bfda201520c0d8f17004c', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881fb509d319901509e00c82a0008', '4028813c520bfda201520c0d8f17004b', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881fb509d319901509dffd66e0007', '4028813c520bfda201520c0d8f17004a', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881fb509d319901509dff370e0006', '4028813c520bfda201520c0d8f170049', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881fb5098c0fa015098d54e550006', '4028813c520bfda201520c0d8f170048', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881fb5098c0fa015098d4f4720005', '4028813c520bfda201520c0d8f160047', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881fb5098c0fa015098d493470004', '4028813c520bfda201520c0d8f160046', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881fb5098c0fa015098d3bf040003', '4028813c520bfda201520c0d8f160045', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881fb5098c0fa015098d360510002', '4028813c520bfda201520c0d8f160044', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881fb5098c0fa015098d2c3d50001', '4028813c520bfda201520c0d8f150043', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881fb5098c0fa015098d1cc430000', '4028813c520bfda201520c0d8f150042', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881fb5093521c0150936401890007', '4028813c520bfda201520c0d8f150041', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881fb5093521c01509363720a0006', '4028813c520bfda201520c0d8f150040', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881f7508813af015088819a860005', '4028813c520bfda201520c0d8f14003f', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881f7508813af0150887fd0700004', '4028813c520bfda201520c0d8f14003e', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881f7508813af0150887e28e60003', '4028813c520bfda201520c0d8f14003d', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185d44ea0037', '1', '8ae99b515110bfee0151185d44ea0040', 'W', '2015-11-18 10:12:24');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881f7508813af0150887c99020002', '4028813c520bfda201520c0d8f14003c', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185d44ea0037', '402881f7508813af0150887c99020002', '8ae99b515110bfee0151185d44ea0041', 'W', '2015-11-18 10:12:24');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185dfa110042', '402881fb5093521c0150936401890007', '8ae99b515110bfee01511872b68a00e7', 'W', '2015-11-18 10:35:49');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185dfa110042', '402881fb5093521c01509363720a0006', '8ae99b515110bfee01511872b68a00e6', 'W', '2015-11-18 10:35:49');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185dfa110042', '402881f7508813af015088819a860005', '8ae99b515110bfee01511872b68a00e5', 'W', '2015-11-18 10:35:49');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185dfa110042', '1', '8ae99b515110bfee01511872b68a00e4', 'W', '2015-11-18 10:35:49');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881fb509d319901509e0206b6000a', '8ae99b515110bfee01511874b1310124', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881fb509d319901509e0149bd0009', '8ae99b515110bfee01511874b1310123', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881fb50ae10770150ae1f23ee0008', '8ae99b515110bfee01511874b1310125', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee01511864181b007d', '402881fb509d319901509dff370e0006', '8ae99b515110bfee01511864c60e0099', 'W', '2015-11-18 10:20:36');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee01511864181b007d', '402881fb5098c0fa015098d3bf040003', '8ae99b515110bfee01511864c60e0098', 'W', '2015-11-18 10:20:36');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee01511864181b007d', '402881fb5098c0fa015098d360510002', '8ae99b515110bfee01511864c60e0097', 'W', '2015-11-18 10:20:36');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee01511864181b007d', '402881fb5098c0fa015098d2c3d50001', '8ae99b515110bfee01511864c5ff0096', 'W', '2015-11-18 10:20:36');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee01511864181b007d', '402881fb5098c0fa015098d1cc430000', '8ae99b515110bfee01511864c5ff0095', 'W', '2015-11-18 10:20:36');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee01511864181b007d', '402881f7508813af0150887e28e60003', '8ae99b515110bfee01511864c5ff0094', 'W', '2015-11-18 10:20:36');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee01511864181b007d', '1', '8ae99b515110bfee01511864c5ff0093', 'W', '2015-11-18 10:20:36');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee01511864181b007d', '402881fb509d319901509e0149bd0009', '8ae99b515110bfee01511864c60e009a', 'W', '2015-11-18 10:20:36');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881fb509d319901509dffd66e0007', '8ae99b515110bfee01511874b1310121', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881fb509d319901509e00c82a0008', '8ae99b515110bfee01511874b1310122', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee01511866f57100b1', '402881f7508813af0150887fd0700004', '8ae99b515110bfee01511866f57100bb', 'W', '2015-11-18 10:22:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee01511866f57100b1', '1', '8ae99b515110bfee01511866f57100ba', 'W', '2015-11-18 10:22:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881fb509d319901509dff370e0006', '8ae99b515110bfee01511874b1310120', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881fb5098c0fa015098d54e550006', '8ae99b515110bfee01511874b121011f', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881fb5098c0fa015098d4f4720005', '8ae99b515110bfee01511874b121011e', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881fb5098c0fa015098d493470004', '8ae99b515110bfee01511874b121011d', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881fb5098c0fa015098d3bf040003', '8ae99b515110bfee01511874b121011c', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881fb5098c0fa015098d360510002', '8ae99b515110bfee01511874b121011b', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881fb5098c0fa015098d2c3d50001', '8ae99b515110bfee01511874b121011a', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881fb5098c0fa015098d1cc430000', '8ae99b515110bfee01511874b1210119', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881fb5093521c0150936401890007', '8ae99b515110bfee01511874b1210118', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881fb5093521c01509363720a0006', '8ae99b515110bfee01511874b1210117', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881f7508813af015088819a860005', '8ae99b515110bfee01511874b1210116', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881f7508813af0150887fd0700004', '8ae99b515110bfee01511874b1210115', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881f7508813af0150887e28e60003', '8ae99b515110bfee01511874b1210114', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881f7508813af0150887c99020002', '8ae99b515110bfee01511874b1210113', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '402881f7508813af0150886dcc4e0000', '8ae99b515110bfee01511874b1210112', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '4028e3484d676c2a014d6784a4990000', '8ae99b515110bfee01511874b1210111', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '4028e30a4d5a9ef3014d5ab165b00000', '8ae99b515110bfee01511874b1210110', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('8ae99b515110bfee0151185e8430004f', '1', '8ae99b515110bfee01511874b121010f', 'W', '2015-11-18 10:37:59');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881f7508813af0150886dcc4e0000', '4028813c520bfda201520c0d8f14003b', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '4028e3484d676c2a014d6784a4990000', '4028813c520bfda201520c0d8f13003a', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '4028e30a4d5a9ef3014d5ab165b00000', '4028813c520bfda201520c0d8f130039', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '1', '4028813c520bfda201520c0d8f130038', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '402881e95184926701518495c5d800a0', '4028813c520bfda201520c0d8f180050', 'W', '2016-01-04 17:52:41');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881e95184926701518493d64a004f', '4028813c520bfda201520c0f2a7200da', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881fb5098c0fa015098d2c3d50001', '4028813c520bfda201520c0f2a6f00cf', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '1', '4028813c520bfda201520c0f2a6d00c4', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '4028e30a4d5a9ef3014d5ab165b00000', '4028813c520bfda201520c0f2a6d00c5', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '4028e3484d676c2a014d6784a4990000', '4028813c520bfda201520c0f2a6d00c6', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881f7508813af0150886dcc4e0000', '4028813c520bfda201520c0f2a6d00c7', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881f7508813af0150887c99020002', '4028813c520bfda201520c0f2a6e00c8', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881f7508813af0150887e28e60003', '4028813c520bfda201520c0f2a6e00c9', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881f7508813af0150887fd0700004', '4028813c520bfda201520c0f2a6e00ca', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881f7508813af015088819a860005', '4028813c520bfda201520c0f2a6e00cb', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881fb5093521c01509363720a0006', '4028813c520bfda201520c0f2a6e00cc', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881fb5093521c0150936401890007', '4028813c520bfda201520c0f2a6f00cd', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881fb5098c0fa015098d1cc430000', '4028813c520bfda201520c0f2a6f00ce', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881fb509d319901509e0206b6000a', '4028813c520bfda201520c0f2a7100d9', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881fb509d319901509e0149bd0009', '4028813c520bfda201520c0f2a7100d8', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881fb509d319901509e00c82a0008', '4028813c520bfda201520c0f2a7100d7', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881fb509d319901509dffd66e0007', '4028813c520bfda201520c0f2a7100d6', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881fb509d319901509dff370e0006', '4028813c520bfda201520c0f2a7000d5', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881fb5098c0fa015098d54e550006', '4028813c520bfda201520c0f2a7000d4', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881fb5098c0fa015098d493470004', '4028813c520bfda201520c0f2a7000d2', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881fb5098c0fa015098d4f4720005', '4028813c520bfda201520c0f2a7000d3', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881fb5098c0fa015098d360510002', '4028813c520bfda201520c0f2a6f00d0', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881fb5098c0fa015098d3bf040003', '4028813c520bfda201520c0f2a7000d1', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881fb50ae10770150ae1f23ee0008', '4028813c520bfda201520c0f2a7200db', 'W', '2016-01-04 17:54:26');
INSERT INTO `cms_role_channel` VALUES ('402881f14ee2950b014ee2ca5112000d', '402881e95184926701518495c5d800a0', '4028813c520bfda201520c0f2a7200dc', 'W', '2016-01-04 17:54:26');

-- ----------------------------
-- Table structure for cms_templet
-- ----------------------------
DROP TABLE IF EXISTS `cms_templet`;
CREATE TABLE `cms_templet` (
  `ID` varchar(32) NOT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `TEMPLET_NAME` varchar(128) DEFAULT NULL,
  `TEMPLET_FILE_NAME` varchar(32) DEFAULT '',
  `TEMPLET_PATH` varchar(128) DEFAULT NULL,
  `TEMPLETE_TYPE` varchar(20) DEFAULT NULL,
  `TEMPLET_CONTENT` text,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL COMMENT 'ʱ',
  `REMARK` varchar(256) DEFAULT NULL COMMENT 'עϢ',
  `IS_DELETE` char(1) DEFAULT '1' COMMENT '0ɾ1ɾĬ1',
  `STATE` char(1) DEFAULT '1' COMMENT '״̬,01Ĭ1',
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_24` (`PARENT_ID`) USING BTREE,
  KEY `FKE65DDC9126CFC0BF` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKE65DDC914B072AFB` (`PARENT_ID`) USING BTREE,
  KEY `FKE65DDC919B6243F6` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKE65DDC91BF99AE32` (`PARENT_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ģ';

-- ----------------------------
-- Records of cms_templet
-- ----------------------------
INSERT INTO `cms_templet` VALUES ('1', null, '模板管理', '', '', null, null, null, null, null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('8ad5be9a28c067c90128c068ccb20001', '1', '首页模板', '', '', null, null, null, '2010-05-22 22:26:53', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('8ad5eace28c09ce00128c0b1dd49000b', '1', '二级页面模板', '', '', null, null, '1', '2010-05-22 23:46:41', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('8ad5eace28c0c2420128c0c311760001', '1', '三级页面模板', '', '', null, null, null, '2010-05-23 00:05:29', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('8ad50a0a2bb78d9f012bb79089760002', '1', '公共页模板', '', '', null, null, '8ad5a5e52907328801290797707c000d', '2010-10-17 08:22:04', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('ff8080812bb79702012bb7a283f00002', '8ad5be9a28c067c90128c068ccb20001', '首页', 'index.ftl', '/WEB-INF/ftl/index.ftl', '0', null, '8ad5a5e52907328801290797707c000d', '2010-10-17 08:41:42', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('402881e637687766013769cd75770005', '8ad5eace28c09ce00128c0b1dd49000b', '日志列表', null, '/WEB-INF/ftl/second/rizhilist.ftl', '2', null, '8ad5a5e52907328801290797707c000d', '2012-05-20 18:31:41', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('8ad549292bb7cd82012bb7ce6a090003', '8ad5eace28c09ce00128c0b1dd49000b', '文章列表页', null, '/WEB-INF/ftl/contentlist.ftl', '2', null, '8ad5a5e52907328801290797707c000d', '2010-10-17 09:29:39', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('8ad549292bb7cd82012bb7ce9a410004', '8ad5eace28c09ce00128c0b1dd49000b', '图片展示页', null, '/WEB-INF/ftl/piclist.ftl', '2', null, '8ad5a5e52907328801290797707c000d', '2010-10-17 09:29:51', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('8ad549292bb7cd82012bb7cf96740005', '8ad5eace28c0c2420128c0c311760001', '内容页', null, '/WEB-INF/ftl/three/content.ftl', '3', null, '8ad5a5e52907328801290797707c000d', '2010-10-17 09:30:56', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('8ad549292bb7cd82012bb7d6315f0006', '8ad50a0a2bb78d9f012bb79089760002', 'js/css文件', null, '/WEB-INF/ftl/includes/js_css.html', '', null, '8ad5a5e52907328801290797707c000d', '2010-10-17 09:38:09', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('8ad549292bb7cd82012bb7d6731b0007', '8ad50a0a2bb78d9f012bb79089760002', '头部模板', null, '/WEB-INF/ftl/includes/head.html', '', null, '8ad5a5e52907328801290797707c000d', '2010-10-17 09:38:26', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('8ad549292bb7cd82012bb7d6d8ab0008', '8ad50a0a2bb78d9f012bb79089760002', '底部模板', null, '/WEB-INF/ftl/includes/footer.html', '4', null, '8ad5a5e52907328801290797707c000d', '2010-10-17 09:38:52', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('402881e637683d620137684f96cc0002', '8a4583c437496dce013749712ab60012', '日志', null, '/WEB-INF/ftl/home/ruizhi.ftl', '1', null, '8ad5a5e52907328801290797707c000d', '2012-05-20 11:34:35', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('402881e637683d620137685548030003', '8a4583c437496dce013749712ab60012', '说说', null, '/WEB-INF/ftl/home/shuoshuo.ftl', '1', null, '8ad5a5e52907328801290797707c000d', '2012-05-20 11:40:48', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('402881e6374502a8013745a755cd0010', '8ad5eace28c09ce00128c0b1dd49000b', '视频播放页', null, '/WEB-INF/ftl/videotlist.ftl', '2', null, '8ad5a5e52907328801290797707c000d', '2012-05-13 18:03:43', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('402881e53745b509013745b6be040002', '8ad5eace28c09ce00128c0b1dd49000b', '下载列表页', null, '/WEB-INF/ftl/second/downloadlist.ftl', '2', null, '8ad5a5e52907328801290797707c000d', '2012-05-13 18:20:33', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('8a4583c437496dce013749712ab60012', '1', '首页栏目块模板', null, '', '', null, '8ad5a5e52907328801290797707c000d', '2010-05-22 22:26:57', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('402881e63765954a0137659bd7a40002', '8a4583c437496dce013749712ab60012', '图片新闻轮播', null, '/WEB-INF/ftl/home/tpxw.ftl', '1', null, '8ad5a5e52907328801290797707c000d', '2012-05-19 22:59:01', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('402881e637683d62013768634bb80006', '8a4583c437496dce013749712ab60012', '我的承诺', null, '/WEB-INF/ftl/home/chengnuo.ftl', '1', null, '8ad5a5e52907328801290797707c000d', '2012-05-20 11:56:06', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('402881e637683d6201376855a7f60004', '8a4583c437496dce013749712ab60012', '留言', null, '/WEB-INF/ftl/home/liuyan.ftl', '1', null, '8ad5a5e52907328801290797707c000d', '2012-05-20 11:41:12', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('402881e637683d6201376859ec3f0005', '8a4583c437496dce013749712ab60012', '照片', null, '/WEB-INF/ftl/home/zhaopian.ftl', '1', null, '8ad5a5e52907328801290797707c000d', '2012-05-20 11:45:52', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('402881e637683d6201376864d2970007', '8a4583c437496dce013749712ab60012', '我的动态', null, '/WEB-INF/ftl/home/dongtai.ftl', '1', null, '8ad5a5e52907328801290797707c000d', '2012-05-20 11:57:46', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('8a4583c4377786ae013777a2e3ee0002', '8ad50a0a2bb78d9f012bb79089760002', '列表页分页模板', null, '/WEB-INF/ftl/includes/listpage.flt', '4', null, '8ad5a5e52907328801290797707c000d', '2012-05-23 10:59:52', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('8a4583c4377786ae013777ac4b090003', '8ad50a0a2bb78d9f012bb79089760002', '内容页分页模板', null, '/WEB-INF/ftl/includes/contentpage.flt', '4', null, '8ad5a5e52907328801290797707c000d', '2012-05-23 11:10:09', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('8a4583c4377786ae013777b48ce90004', '8ad5eace28c0c2420128c0c311760001', '日志内容页', null, '/WEB-INF/ftl/three/rizhicontent.ftl', '3', null, '8ad5a5e52907328801290797707c000d', '2012-05-23 11:19:10', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('4028e30a4d58a928014d590508d70000', '8ad5eace28c09ce00128c0b1dd49000b', '二级栏目单页', null, '/WEB-INF/ftl/second/ptjjsingle.ftl', '2', null, '8a4583c3379d08e101379d0e3dfe0002', '2015-05-16 03:20:11', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('4028e30a4d58a928014d5934d6f10001', '8ad5eace28c09ce00128c0b1dd49000b', '二级栏目列表页', null, '/WEB-INF/ftl/second/secondchannellist.ftl', '2', null, '8a4583c3379d08e101379d0e3dfe0002', '2015-05-16 04:12:24', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('4028e30a4d58a928014d5a9a4b800002', '8ad5eace28c0c2420128c0c311760001', '平台简介内容页', null, '/WEB-INF/ftl/three/ptjjcontent.ftl', '3', null, '8a4583c3379d08e101379d0e3dfe0002', '2015-05-16 10:42:50', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('4028e30a4d851955014d85562dff0000', '8ad5eace28c09ce00128c0b1dd49000b', '创业支撑二级栏目单页', null, '/WEB-INF/ftl/second/cyzcsingle.ftl', '2', null, '8a4583c3379d08e101379d0e3dfe0002', '2015-05-24 17:52:06', null, '1', '1', null);
INSERT INTO `cms_templet` VALUES ('402881fb508e380901508e7a05b60000', '8ad5eace28c09ce00128c0b1dd49000b', '文书模板二级列表页', null, '', '2', null, '4028e3484d9a91fa014d9aa14cec0080', '2015-10-22 15:36:12', null, '1', '1', null);

-- ----------------------------
-- Table structure for core_resource
-- ----------------------------
DROP TABLE IF EXISTS `core_resource`;
CREATE TABLE `core_resource` (
  `ID` varchar(32) NOT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `CATEGORY` varchar(50) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `DOWNLOAD_COUNT` int(11) NOT NULL,
  `ENVIRONMENT` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PUBLISH_TIME` varchar(20) DEFAULT NULL,
  `STATE` int(11) NOT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  `VISIT_COUNT` int(11) NOT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_resource
-- ----------------------------

-- ----------------------------
-- Table structure for core_resource_download_history
-- ----------------------------
DROP TABLE IF EXISTS `core_resource_download_history`;
CREATE TABLE `core_resource_download_history` (
  `ID` varchar(32) NOT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `DOWNLOAD_COUNT` int(11) NOT NULL,
  `RESOURCE_ID` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` varchar(255) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_resource_download_history
-- ----------------------------

-- ----------------------------
-- Table structure for court_opening
-- ----------------------------
DROP TABLE IF EXISTS `court_opening`;
CREATE TABLE `court_opening` (
  `ID` varchar(32) NOT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `CASE_NAME` longtext,
  `CASE_SUMMARY` longtext,
  `CASE_TYPE` varchar(2) DEFAULT NULL,
  `COURT_ID` varchar(32) DEFAULT NULL,
  `COURT_NAME` varchar(50) DEFAULT NULL,
  `DEFENDANT` varchar(200) DEFAULT NULL,
  `END_TIME` varchar(32) DEFAULT NULL,
  `JUDGE` varchar(50) DEFAULT NULL,
  `JURORS` varchar(200) DEFAULT NULL,
  `OPENING_URL` longtext,
  `PLAINTIFF` varchar(200) DEFAULT NULL,
  `START_TIME` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` varchar(32) DEFAULT NULL,
  `UPDATE_USER_ID` varchar(32) DEFAULT NULL,
  `UPDATE_USER_NAME` varchar(100) DEFAULT NULL,
  `VIDEO_URL` longtext,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of court_opening
-- ----------------------------
INSERT INTO `court_opening` VALUES ('402881fb50adce0c0150adcf8a1a0000', '2015-10-28 17:37:51', null, null, null, null, '第1法庭', null, null, null, null, 'rtmp://md.hncourt.org/live/zzfy_ft1', null, null, '2015-11-02 09:46:34', '4028e3484d9a91fa014d9aa14cec0080', null, null, '4028e3484d9a91fa014d9aa14cec0080', null);
INSERT INTO `court_opening` VALUES ('402881fb50c5ce9d0150c5e263080001', '2015-11-02 09:49:19', null, null, null, null, '第2法庭', null, null, null, null, 'rtmp://md.hncourt.org/live/zzfy_ft2', null, null, null, null, null, null, '4028e3484d9a91fa014d9aa14cec0080', null);
INSERT INTO `court_opening` VALUES ('402881fb50c5ce9d0150c5e2eb010002', '2015-11-02 09:49:54', null, null, null, null, '第3法庭', null, null, null, null, 'rtmp://md.hncourt.org/live/zzfy_ft3', null, null, null, null, null, null, '4028e3484d9a91fa014d9aa14cec0080', null);
INSERT INTO `court_opening` VALUES ('402881fb50c5ce9d0150c5e350920003', '2015-11-02 09:50:20', null, null, null, null, '第4法庭', null, null, null, null, 'rtmp://md.hncourt.org/live/zzfy_ft4', null, null, null, null, null, null, '4028e3484d9a91fa014d9aa14cec0080', null);
INSERT INTO `court_opening` VALUES ('402881fb50c5ce9d0150c5e383950004', '2015-11-02 09:50:33', null, null, null, null, '第5法庭', null, null, null, null, 'rtmp://md.hncourt.org/live/zzfy_ft5', null, null, null, null, null, null, '4028e3484d9a91fa014d9aa14cec0080', null);
INSERT INTO `court_opening` VALUES ('402881fb50c5ce9d0150c5e3cb260005', '2015-11-02 09:50:51', null, null, null, null, '第6法庭', null, null, null, null, 'rtmp://md.hncourt.org/live/zzfy_ft6', null, null, null, null, null, null, '4028e3484d9a91fa014d9aa14cec0080', null);
INSERT INTO `court_opening` VALUES ('402881fb50c5ce9d0150c5e420e40006', '2015-11-02 09:51:13', null, null, null, null, '第7法庭', null, null, null, null, 'rtmp://md.hncourt.org/live/zzfy_ft7', null, null, '2015-11-02 09:51:35', '4028e3484d9a91fa014d9aa14cec0080', null, null, '4028e3484d9a91fa014d9aa14cec0080', null);

-- ----------------------------
-- Table structure for court_open_info
-- ----------------------------
DROP TABLE IF EXISTS `court_open_info`;
CREATE TABLE `court_open_info` (
  `ID` varchar(32) NOT NULL,
  `CASE_NAME` varchar(255) DEFAULT NULL,
  `CASE_NUM` varchar(255) DEFAULT NULL,
  `CHIEF_JUDGE` varchar(255) DEFAULT NULL,
  `COURT_PLACE` varchar(255) DEFAULT NULL,
  `START_TIME` varchar(255) DEFAULT NULL,
  `VICE_JUDGES` varchar(255) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of court_open_info
-- ----------------------------
INSERT INTO `court_open_info` VALUES ('4028813c523f86d001523f881b290002', '站群测试开庭公告功能', '(2016)易云测字第20160114号', '易云华控', '第1法庭', '2016-01-15', '易云华控河北', null, 'zzfy', null);

-- ----------------------------
-- Table structure for excel
-- ----------------------------
DROP TABLE IF EXISTS `excel`;
CREATE TABLE `excel` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `age` varchar(100) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of excel
-- ----------------------------
INSERT INTO `excel` VALUES ('1', '张三', '30', '男');

-- ----------------------------
-- Table structure for jbpm4_deployment
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_deployment`;
CREATE TABLE `jbpm4_deployment` (
  `DBID_` bigint(20) NOT NULL,
  `NAME_` longtext,
  `TIMESTAMP_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_deployment
-- ----------------------------
INSERT INTO `jbpm4_deployment` VALUES ('1', null, '0', 'active');

-- ----------------------------
-- Table structure for jbpm4_deployprop
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_deployprop`;
CREATE TABLE `jbpm4_deployprop` (
  `DBID_` bigint(20) NOT NULL,
  `DEPLOYMENT_` bigint(20) DEFAULT NULL,
  `OBJNAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `STRINGVAL_` varchar(255) DEFAULT NULL,
  `LONGVAL_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_DEPLPROP_DEPL` (`DEPLOYMENT_`) USING BTREE,
  KEY `FK_DEPLPROP_DEPL` (`DEPLOYMENT_`) USING BTREE,
  CONSTRAINT `jbpm4_deployprop_ibfk_1` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_deployprop
-- ----------------------------
INSERT INTO `jbpm4_deployprop` VALUES ('4', '1', '请假流程', 'langid', 'jpdl-4.4', null);
INSERT INTO `jbpm4_deployprop` VALUES ('5', '1', '请假流程', 'pdid', 'leave-1', null);
INSERT INTO `jbpm4_deployprop` VALUES ('6', '1', '请假流程', 'pdkey', 'leave', null);
INSERT INTO `jbpm4_deployprop` VALUES ('7', '1', '请假流程', 'pdversion', null, '1');

-- ----------------------------
-- Table structure for jbpm4_execution
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_execution`;
CREATE TABLE `jbpm4_execution` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ACTIVITYNAME_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `HISACTINST_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `INSTANCE_` bigint(20) DEFAULT NULL,
  `SUPEREXEC_` bigint(20) DEFAULT NULL,
  `SUBPROCINST_` bigint(20) DEFAULT NULL,
  `PARENT_IDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  UNIQUE KEY `ID_` (`ID_`) USING BTREE,
  KEY `IDX_EXEC_SUPEREXEC` (`SUPEREXEC_`) USING BTREE,
  KEY `IDX_EXEC_INSTANCE` (`INSTANCE_`) USING BTREE,
  KEY `IDX_EXEC_SUBPI` (`SUBPROCINST_`) USING BTREE,
  KEY `IDX_EXEC_PARENT` (`PARENT_`) USING BTREE,
  KEY `FK_EXEC_PARENT` (`PARENT_`) USING BTREE,
  KEY `FK_EXEC_SUBPI` (`SUBPROCINST_`) USING BTREE,
  KEY `FK_EXEC_INSTANCE` (`INSTANCE_`) USING BTREE,
  KEY `FK_EXEC_SUPEREXEC` (`SUPEREXEC_`) USING BTREE,
  CONSTRAINT `jbpm4_execution_ibfk_1` FOREIGN KEY (`INSTANCE_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `jbpm4_execution_ibfk_2` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `jbpm4_execution_ibfk_3` FOREIGN KEY (`SUBPROCINST_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `jbpm4_execution_ibfk_4` FOREIGN KEY (`SUPEREXEC_`) REFERENCES `jbpm4_execution` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_execution
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_hist_actinst
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_actinst`;
CREATE TABLE `jbpm4_hist_actinst` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TRANSITION_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HACTI_HPROCI` (`HPROCI_`) USING BTREE,
  KEY `IDX_HTI_HTASK` (`HTASK_`) USING BTREE,
  KEY `FK_HACTI_HPROCI` (`HPROCI_`) USING BTREE,
  KEY `FK_HTI_HTASK` (`HTASK_`) USING BTREE,
  CONSTRAINT `jbpm4_hist_actinst_ibfk_1` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `jbpm4_hist_actinst_ibfk_2` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_hist_detail
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_detail`;
CREATE TABLE `jbpm4_hist_detail` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `HPROCIIDX_` int(11) DEFAULT NULL,
  `HACTI_` bigint(20) DEFAULT NULL,
  `HACTIIDX_` int(11) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  `HTASKIDX_` int(11) DEFAULT NULL,
  `HVAR_` bigint(20) DEFAULT NULL,
  `HVARIDX_` int(11) DEFAULT NULL,
  `MESSAGE_` longtext,
  `OLD_STR_` varchar(255) DEFAULT NULL,
  `NEW_STR_` varchar(255) DEFAULT NULL,
  `OLD_INT_` int(11) DEFAULT NULL,
  `NEW_INT_` int(11) DEFAULT NULL,
  `OLD_TIME_` datetime DEFAULT NULL,
  `NEW_TIME_` datetime DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `PARENT_IDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HDET_HACTI` (`HACTI_`) USING BTREE,
  KEY `IDX_HDET_HPROCI` (`HPROCI_`) USING BTREE,
  KEY `IDX_HDET_HVAR` (`HVAR_`) USING BTREE,
  KEY `IDX_HDET_HTASK` (`HTASK_`) USING BTREE,
  KEY `FK_HDETAIL_HPROCI` (`HPROCI_`) USING BTREE,
  KEY `FK_HDETAIL_HACTI` (`HACTI_`) USING BTREE,
  KEY `FK_HDETAIL_HTASK` (`HTASK_`) USING BTREE,
  KEY `FK_HDETAIL_HVAR` (`HVAR_`) USING BTREE,
  CONSTRAINT `jbpm4_hist_detail_ibfk_1` FOREIGN KEY (`HACTI_`) REFERENCES `jbpm4_hist_actinst` (`DBID_`),
  CONSTRAINT `jbpm4_hist_detail_ibfk_2` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `jbpm4_hist_detail_ibfk_3` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`),
  CONSTRAINT `jbpm4_hist_detail_ibfk_4` FOREIGN KEY (`HVAR_`) REFERENCES `jbpm4_hist_var` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_detail
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_hist_procinst
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_procinst`;
CREATE TABLE `jbpm4_hist_procinst` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ENDACTIVITY_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_hist_task
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_task`;
CREATE TABLE `jbpm4_hist_task` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `OUTCOME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  `SUPERTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HSUPERT_SUB` (`SUPERTASK_`) USING BTREE,
  KEY `FK_HSUPERT_SUB` (`SUPERTASK_`) USING BTREE,
  CONSTRAINT `jbpm4_hist_task_ibfk_1` FOREIGN KEY (`SUPERTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_task
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_hist_var
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_var`;
CREATE TABLE `jbpm4_hist_var` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `PROCINSTID_` varchar(255) DEFAULT NULL,
  `EXECUTIONID_` varchar(255) DEFAULT NULL,
  `VARNAME_` varchar(255) DEFAULT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HVAR_HPROCI` (`HPROCI_`) USING BTREE,
  KEY `IDX_HVAR_HTASK` (`HTASK_`) USING BTREE,
  KEY `FK_HVAR_HPROCI` (`HPROCI_`) USING BTREE,
  KEY `FK_HVAR_HTASK` (`HTASK_`) USING BTREE,
  CONSTRAINT `jbpm4_hist_var_ibfk_1` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `jbpm4_hist_var_ibfk_2` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_var
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_id_group
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_id_group`;
CREATE TABLE `jbpm4_id_group` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_GROUP_PARENT` (`PARENT_`) USING BTREE,
  KEY `FK_GROUP_PARENT` (`PARENT_`) USING BTREE,
  CONSTRAINT `jbpm4_id_group_ibfk_1` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm4_id_group` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_id_membership`;
CREATE TABLE `jbpm4_id_membership` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USER_` bigint(20) DEFAULT NULL,
  `GROUP_` bigint(20) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_MEM_USER` (`USER_`) USING BTREE,
  KEY `IDX_MEM_GROUP` (`GROUP_`) USING BTREE,
  KEY `FK_MEM_GROUP` (`GROUP_`) USING BTREE,
  KEY `FK_MEM_USER` (`USER_`) USING BTREE,
  CONSTRAINT `jbpm4_id_membership_ibfk_1` FOREIGN KEY (`GROUP_`) REFERENCES `jbpm4_id_group` (`DBID_`),
  CONSTRAINT `jbpm4_id_membership_ibfk_2` FOREIGN KEY (`USER_`) REFERENCES `jbpm4_id_user` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_id_user
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_id_user`;
CREATE TABLE `jbpm4_id_user` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PASSWORD_` varchar(255) DEFAULT NULL,
  `GIVENNAME_` varchar(255) DEFAULT NULL,
  `FAMILYNAME_` varchar(255) DEFAULT NULL,
  `BUSINESSEMAIL_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_job
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_job`;
CREATE TABLE `jbpm4_job` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ISEXCLUSIVE_` bit(1) DEFAULT NULL,
  `LOCKOWNER_` varchar(255) DEFAULT NULL,
  `LOCKEXPTIME_` datetime DEFAULT NULL,
  `EXCEPTION_` longtext,
  `RETRIES_` int(11) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `CFG_` bigint(20) DEFAULT NULL,
  `SIGNAL_` varchar(255) DEFAULT NULL,
  `EVENT_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_JOBRETRIES` (`RETRIES_`) USING BTREE,
  KEY `IDX_JOB_CFG` (`CFG_`) USING BTREE,
  KEY `IDX_JOB_PRINST` (`PROCESSINSTANCE_`) USING BTREE,
  KEY `IDX_JOB_EXE` (`EXECUTION_`) USING BTREE,
  KEY `IDX_JOBLOCKEXP` (`LOCKEXPTIME_`) USING BTREE,
  KEY `IDX_JOBDUEDATE` (`DUEDATE_`) USING BTREE,
  KEY `FK_JOB_CFG` (`CFG_`) USING BTREE,
  CONSTRAINT `jbpm4_job_ibfk_1` FOREIGN KEY (`CFG_`) REFERENCES `jbpm4_lob` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_job
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_lob
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_lob`;
CREATE TABLE `jbpm4_lob` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `BLOB_VALUE_` longblob,
  `DEPLOYMENT_` bigint(20) DEFAULT NULL,
  `NAME_` longtext,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_LOB_DEPLOYMENT` (`DEPLOYMENT_`) USING BTREE,
  KEY `FK_LOB_DEPLOYMENT` (`DEPLOYMENT_`) USING BTREE,
  CONSTRAINT `jbpm4_lob_ibfk_1` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_lob
-- ----------------------------
INSERT INTO `jbpm4_lob` VALUES ('2', '0', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A0A3C70726F63657373206465736372697074696F6E3D22E8AFB7E58187E6B581E7A88B22206B65793D226C6561766522206E616D653D22E8AFB7E58187E6B581E7A88B222076657273696F6E3D22312220786D6C6E733D22687474703A2F2F6A62706D2E6F72672F342E342F6A70646C223E20200D0A20203C737461727420673D223333342C342C34382C343822206E616D653D22E5BC80E5A78B223E20200D0A20202020203C7472616E736974696F6E20673D22352C2D3522206E616D653D22E58F91E8B5B7E8AFB7E581872220746F3D22E5A1ABE58699E8AFB7E58187E58D95222F3E20200D0A20203C2F73746172743E20200D0A20203C7461736B2061737369676E65653D22237B6170706C7965727D2220673D223331312C36392C39322C353222206E616D653D22E5A1ABE58699E8AFB7E58187E58D95223E20200D0A20202020203C7472616E736974696F6E20673D22362C2D3722206E616D653D22E588A4E696ADE5A1ABE58699E4BABAE8A792E889B22220746F3D22E588A4E696ADE8A792E889B2222F3E20200D0A20203C2F7461736B3E20200D0A2020203C6465636973696F6E20657870723D22237B726F6C654E616D657D2220673D223333322C3134372C34382C343822206E616D653D22E588A4E696ADE8A792E889B2223E20200D0A2020202020203C7472616E736974696F6E20673D22362C2D313122206E616D653D22E983A8E997A8E7BB8FE790862220746F3D22E589AFE680BBE7BB8FE79086E5AEA1E6A0B8222F3E20200D0A2020202020203C7472616E736974696F6E20673D2231342C2D313122206E616D653D22E589AFE680BBE7BB8FE790862220746F3D22E680BBE7BB8FE79086E5AEA1E6A0B8222F3E0D0A2020202020203C7472616E736974696F6E20673D222D35372C2D313622206E616D653D22E699AEE9809AE59198E5B7A52220746F3D22E983A8E997A8E7BB8FE79086E5AEA1E6A0B8222F3E20200D0A2020203C2F6465636973696F6E3E20200D0A2020203C7461736B2061737369676E65653D22237B667A6A6C7D2220673D223331312C3232352C39322C353222206E616D653D22E589AFE680BBE7BB8FE79086E5AEA1E6A0B8223E20200D0A2020202020203C7472616E736974696F6E20673D222D33342C2D313822206E616D653D22E8AFB7E58187E5A4A7E4BA8E3130E5A4A92220746F3D22E680BBE7BB8FE79086E5AEA1E6A0B8222F3E0D0A2020202020203C7472616E736974696F6E20673D222D38372C2D313322206E616D653D22E8AFB7E58187E4B88DE5A49AE4BA8E3130E5A4A92220746F3D22E8A18CE694BFE7A798E4B9A6E7BB9FE8AEA1E88083E68385222F3E0D0A2020202020203C7472616E736974696F6E20673D223531372C3336363A2D33392C2D333822206E616D653D22E4B88DE5908CE6848F2220746F3D22E7BB93E69D9F222F3E20200D0A2020203C2F7461736B3E20200D0A20202020200D0A2020203C7461736B2061737369676E65653D22237B7A6A6C7D2220673D223534362C3232322C39322C353222206E616D653D22E680BBE7BB8FE79086E5AEA1E6A0B8223E0D0A2020202020203C7472616E736974696F6E20673D2231362C2D3222206E616D653D22E5908CE6848F2220746F3D22E8A18CE694BFE7A798E4B9A6E7BB9FE8AEA1E88083E68385222F3E0D0A2020202020203C7472616E736974696F6E20673D223536372C3337313A31322C2D3922206E616D653D22E4B88DE5908CE6848F2220746F3D22E7BB93E69D9F222F3E20200D0A2020203C2F7461736B3E20200D0A2020203C656E6420673D223334312C3439312C34382C343822206E616D653D22E7BB93E69D9F222073746174653D22636F6E6669726D222F3E0D0A2020203C7461736B2061737369676E65653D22237B626D6A6C7D2220673D2238342C3232362C39322C353222206E616D653D22E983A8E997A8E7BB8FE79086E5AEA1E6A0B8223E0D0A2020202020203C7472616E736974696F6E20673D222D33392C2D313922206E616D653D22E8AFB7E58187E5A4A7E4BA8E35E5A4A92220746F3D22E589AFE680BBE7BB8FE79086E5AEA1E6A0B8222F3E0D0A2020202020203C7472616E736974696F6E20673D222D37342C3222206E616D653D22E8AFB7E58187E4B88DE5A49AE4BA8E35E5A4A92220746F3D22E8A18CE694BFE7A798E4B9A6E7BB9FE8AEA1E88083E68385222F3E0D0A2020202020203C7472616E736974696F6E20673D223136392C3338303A2D34322C2D313222206E616D653D22E4B88DE5908CE6848F2220746F3D22E7BB93E69D9F222F3E0D0A2020203C2F7461736B3E0D0A2020203C7461736B2061737369676E65653D22237B787A6D737D2220673D223239342C3331392C3132392C353222206E616D653D22E8A18CE694BFE7A798E4B9A6E7BB9FE8AEA1E88083E68385223E0D0A2020202020203C7472616E736974696F6E20673D22362C2D3322206E616D653D22E58F91E98081E8B4A2E58AA12220746F3D22E8B4A2E58AA1E7BB8FE79086222F3E0D0A2020203C2F7461736B3E0D0A2020203C7461736B2061737369676E65653D22237B63776A6C7D2220673D223331362C3430342C39322C353222206E616D653D22E8B4A2E58AA1E7BB8FE79086223E0D0A2020202020203C7472616E736974696F6E20673D22362C2D3822206E616D653D22E8B4A2E58AA1E5AE8CE688902220746F3D22E7BB93E69D9F222F3E0D0A2020203C2F7461736B3E20200D0A203C2F70726F636573733E, '1', 'leave.jpdl.xml');
INSERT INTO `jbpm4_lob` VALUES ('3', '0', 0x89504E470D0A1A0A0000000D49484452000002D40000021B080200000044F19EC6000068C949444154789CECBD7F701B677AE7B955F973FE732A5577BE54766EAE76F7E2BDD938B5B529E7EAF64A5B97ABD9545DCE99FCF26472D99964124BB73BCEC4B9283399C4638AA24CD8866D3AA24D584349B00D89B04C1A900DDB904C9912410B94488996210994480992281AA2481121210AA24093F774BF40A3BBD10D3440006FBFDDDF4FBD9681EEB71B8D66A3DF4F3FEFD36FFF8B0D000000008016F22F786F0000000000DC05E403000000002D05F201000000809602F900000000404B817C00000000A0A5403E00000000D052201F000000006829900F00000000B414C80700C098F5F5F5AF64D6D6D6F226D02C56872AF3DE5E008030403E00007A9876905BACAEAEE672B9959595BB77EF66CBA089348B2A5035AA0C0501005804F2010028A168C7FDFBF7C92D3E8877EFDAFFC7FFEF73FFFE8F7FF22BBFF737BFF4BB7FFD8B54E805BDA58934EBFD93DD77EEDC595A5AA2CAB4081404006005C807004042AD1DCBD9A5EEFE1FFE65FBBFFBA3ED0FFFD7CEFFF0C2DBFF6560D87B36F5F197779354E805BDA589348B2A5035AA7C6B2E9DC964A02000002B403E000005F378F0E0C1BD7BF70247DA9EDCF96B7FF6EC23AFBEB3F5D2DCC9CCDA8D0A852A5035AA4C8BBC7DA4EDF6EDDB4B4B4BB4125A15FC03006006E40300B7C3CC637575756565A563DF1F7DF7EFBFDE157CB2B27394175A8416A4C56767671717176955B442F80700C010C80700AE46318FF442EAEFFEE9FFFCE1F38FC52EBE53AB79B0420BD2E2B492CBA9C4C2C242369B857F00000C817C00E05E14F320512069F8C9EE6FCDE52ED7671EACD0E2B4125AD5F5EBD7E7E7E7E11F000043201F00B81796E7B1B2B2B273EF1FFEF0F9C736691E8A7FD0AA6885E41F0B0B0BB47296FFC1FBBB02006C04E4030097B2BEBE9ECFE7EFDDBBF766F41FBFFBF75FAFBBB7C5B0FF8556E8FFF81F6FDCB8B1B8B8481F411F84E007004001F201804BF9EAABAFEEDFBF9FF9E73B7FB9F3D7AC6698E66BC83FA5D55E4C9E9F9D9D5D5A5AA20F42F00300A000F900C08DB0B0C7DDBB77BB0E6DFDB3677F7561F5CAC2EAD5F90757A82CD0BFAB57A5B7ABD20BE9F5035668D655798A54991699A7B70F5805694169FA83E2C4075769B5B4F2E9E9E9DBB76FD30721F8010050807C00E0460A618F4CE62F76FC2F2FF5FD207D2FF9A5AAD0DBF48AFC2F7BBB224F67535626D3F726D3C56AA5FAF70A7594B7B45A5A792291989999A10F42F00300A000F900C07528618F43432FFCE1F687C7AF7D746D69422E9FD3BFD7D9EB65E9057B7D7D79A25061F97356E79A34E5F3EB522955562A5C9717194F7D482BEF3BD639353585E00700400DE40300D7C16EAF5D5A5A6AFBF9B7B7EEFAF54B0B272FDD895F6665E1242B9716E8359B12BF241579E21DF9B55C53FEF7A43C5D7EABCC656F69D69D93B4F2677FFEEDF3E7CFDFBC79933E8EDD76CBFBDB0300F803F900C0759001E472B93B77A45453F28FC4AD4F1369B9DCFAF48B6291271EA3895FA43F2D54B8752CC1A6B31769B99A5C415AA4F822515AFC53320FFA883367CEA45229FA38FA50C807006003F201800B595B5B5B5959999F9F7FE2C7BFECFBE06FC6673E1A9FF950FE572A67D88B1BCA44FAF7C333F29433F49A4DBFC1EA284B15A7A82652655A397DC4A953A7A6A7A7E9E3E843E9A3797F7B00007F201F00B80E96F0313737F7EDA77FE9BDD1974F5E7DEF642A74F26A289E2A15694AEABD78EA3DF6E26461E27B5459AEC066B1B7AC14AA29356922AD9C3EE2B3CF3EBB74E9127D1C4BFBE0FDED0100FC817C00E03AC800B2D96C3A9DFEDDBFFEC5C18B6F0E4FBF432526FF5B7831C5DE1E92DF1E8A4D1DD2CEA5E9D214363136A52C7EA8F056AA2F553876E14DFA88582C964C26E9E3E843211F00800DC807002E442D1F9F9CDF77FC72DFF1CB078BA54FF3764A7A7BE2F2C1135307D98BE35307A5B76C62A17E71EED441F57AA8CED1F3FBE923868787211F000035900F005C87221FDF7EFA970E7DE691A461AAAF6012534C29C8279885F415B5A38FCD65AF0BE651B48D13452F29D4292C7BF09D110F7D04C9C7C58B17211F000005C80700AE43918F27FEEE977787FE1BEB31894D2B9D29854E13D6E7323C5DEA73512A0C97AAB10A4A7947F5E21D5A397D04E40300A003F20180EB50E4E32FDABFF90FBEFF4B9D671ABFA6493B359E5279BAAAD0CAE923D0ED0200D001F900C07528F2F18CEF77FE72E7BF536EB265F7D99E51EEB6555EDF2C4D3FA3AFF6F119A97CA42FF222B472FA08249C020074403E00701DCAADB66F1F6DFBC3BFFDEF4F4CF6256E0D1507102B94F3AA7F8B7387CE2B15D243A5458A039415C7221B625386937DB472FFC73FC3ADB600001D900F005C8732C8D8F4F4F49FB7FD5BCFDBFF4F6124F5C208EB85521A73FD8E766ED9DBC280EBAA593485564B2BFFF8E38F31C818004007E40300D7A10CAF9E4AA5BC07FFECFB3FFB9FAF2DB3A7C1290F96FB5C7A2D95E25B796E61227BB09C54A429850597E5E7CCB1B9D24A3EA7D5D2CA07070731BC3A004007E40300D7A13C58EEE6CD9B89C4B9BF68FF2659C297F792E97B49E5DF2F0BAF270B6F5726D9AC74A1C264F1F564A90E9BB8224DA715D26A3F88BC3F3C3C8C07CB010074403E00701DEBEBEB2CEDE3F6EDDB5353533FFF60FB77FFFEEB271207E757AF2C3CB83ABF7A7581CA832BD2BFAB57E61FB0D757A47F1F5C29CC5DBD3A2FD794166195A572552E574E9C3F482BDCF3FEF623478E9C3E7D9A3E823E88257CD047F3FEF60000FE403E0070235F7DF5D5FDFBF73399CCCCCC4C2291D8D1FBFB3F7CFEB1B9DCE5CCDA8D4D165A09AD8A56F8C1071F0C0F0FD3CAE923E883E8E310F6000030201F00B81175F0637A7A7A7C7C7CFBABFFC74F767FCBC83FAED7641EB4125A5528143A76EC18AD96568EB007004007E4030097C2821F4B4B4BB3B3B3C96432767A90A4E187CF3F16BBF84E3D318FFC0D5A9016A7951CFEF89DA3478F8E8E8ED26A69E5F411087B0000D4403E0070292CF871EFDEBDC5C5C51B376E5CB870E1E4C993EDBDBFFFDDBFFF7A57F0C95AE58316A10569F1F7DE7BEFC89123B42A5A21AD96564E1F81B00700400DE40300F7F2D5575F3D78F0606565656161E1FAF5EBE7CF9F2769D81BF9F15FEEFCB53F7BF69157DFD97A69EE6465E7A00A548D2AD322BD1FFC38140A1D3D7A945642ABA215D26A69E5F411087B0000D4403E00702FEBEBEBECB6DB6C363B3F3F4FBA70E1C285D1D1D1639F0E76BDB3F52FDABFF947DB1FFEAF9DFFE185B7FFCBC0B0F76CEAE32FEF26A9D00B7A4B13691655A06A5479E0BDFE0F3EF8E0D8B163B438AD8456452BA4D5B2DB6B11F60000A8817C00E06AD4FEB1B0B070E3C68D6432393E3E3E3C3C7CE4C891BEC1E776EEFDA36DBBFEFD1FFFE4577EEF6F7EE977FFFA17A9D00B7A4B1369165518181820EDA0CAB4082D488BD34A6855300F008019900F00DC8EE21F2B2B2B8B8B8BB3B3B3D3D3D38944E2F4E9D3E4138383831F7FFC71241221C378FFFDF70FCBD00B7A4B13691655A06A549916A10569715A09AD0AE601003003F2010028F8C783070FEEDDBBB7B4B474FBF6ED999999A9A9A9F3E7CF9F3973E6D4A9539F7DF6592C161B56416F6922CDA20A548D2AD322B4202D4E2B61791E300F008021900F008004F38F7C3E7FFFFEFDBB77EF66321932899B376FA652A9E9E9E94B972E25652ECAB0D73491665105AA469569115A9016A795C03C000015807C00004AE814646969E9CE9D3BF3F3F3737373E9326822CDA20A540DDA0100B00EE40300A0475190D5D5D55C2EB7B2B2426E912D8326D22CAA40D5A01D0000EB403E0000C6300521D6D6D6F226D02C5607DA0100B00EE403000000002D05F20100B04A381CE6BD0900002700F9000058A5ADAD8DF72600009C00E403006015C80700A021403E000056817C00001A02E403006015C80700A021403E000056699A7C4C864293DA290B233DFA490000C700F9000058A55C3EC8117A46160AAF982D4C86DADACABC613254A826D56B2BA19A4A2FB5F38C6B85424A1DCDEB4215008008403E00005629978F9254945EC96F7436A0996B38756124A4AE6114F9900D65B230A3A43DDAD7000001807C0000AC52261F9A80867137891408298F61E8172F6012FA606B56A223900F004407F20100A8C2AE5DBB7436E0F3F9A41966DD24E5AEA1D20C8D8D48530B6BD1EA43B9CC48CB9977CD403E001009C80700A00A070E1C50B7F3870F1F0E0683DA2AC6DD2A86F349228A5AA1992AF7A8984A0C9B87C80700CE00F20100A8C2AD5BB7DADBDB9906747474ECDDBB37954AA92B1846234AE9A75A8D180995E7A3963C64523FB730637244F20F957C00000406F20100A84E777737938743870E15FA5C4A483E30A2C9172D4B38554985462F94372AF930EB51D1DF11A3BED905DD2E000805E40300509D8989891D3B7630F9181B1B53CF2AF679A86F7C51BB000B5514A54217F95016AA16F9D8D0279CAAE7211A028060403E000096E8ECEC2479E8EAEACAE7F3A5A95220A2D8F017831246B7B468323D0CC21A522D494B42D6231FB442E94D4F4F0FE21E000806E403006089A3478F52831F8D4655D3D4310EE614920A68F4A3A41A958213B25248156A8A7C14D78EB007008201F9000058229FCFB7B7B767B359658A2C0A4A24426D00C589A1C9823B54B82957EF1AAADC106D1CA56C9C0F6D566BCF4893770000A061403E00000000D052201F000000006829900F00000000B414C807000000005A0AE403000000002D05F201000000809602F900C039ACAF6F7C78EEC6CFC2E35BBC112ABFB06D8FCDCB639D61DACE1F05E30746A75756D778EF3F00408B807C00E004EEDC5DFD71FFE9879EF673F789CD94EFED3F3E3DB7CC7B5F02009A0EE40300E1098C4E3FBC3DC0DAEF47770E3C131A3F92F892CAE2F2DABDDC869D0BDBCE178F7CA1C469BEF6D4DE9F85C7D7D779EF53004033817C002030D448FF281867CDF6B75EFD78E25A86BB4FD45D92B3CB4FBC718C7D97C75F3F7AE7EE2AEFBD0B006816900F00048699C7D79EDABB7BF022777B68542C84751E6DF14610FF00C0A9403E001095C0E834330F6AB0B94B4303CBC4B50CEB45FA71FF69DEFB1800D014201F0008C9CDC515D642EF397189BB2E34BC9C989C23A9A26F77E6DA42F57D0100100DC8070042C23A5C1E7FED2877516852792634CE3A5F78EF690040E3817C00201E2BAB6B2C3020748669E5B2B8BCC6423B67AF23F80180D3807C00201E0367522C2AC05D119A5A9E7C3B465FF3D9C3E3BCF73700A0C1403E00108F6D01A955DE1999E0EE074D2DEF9FBD415FF3D73B0678EF6F004083817C00201E6C482E87DDE4525ED29955FA9A0F6F0FF0DEDF00800603F900403CBEF1D33E6A9593B3CBDCFDA0D985A5B6F0DEDF00800603F900403CD830A0CD1F3D7DB4D333AA9D327B70AB7718F20100D81C900F00C483C947A566FBEABB4F6E7D775A3565D8B3A533A6AA10F36EA908AB3CDDB7EDC9BE59FAD7B00ECD2A1AC9B64E8F5247F3FAE055D5276A5546BF4946857D53DEFB1B00D060201F00888765F9202D30B206928098B7A80E0645A505B3073D6A89318A7CC89F35DCB74D5E441291A270A85F1756ABF807BDAEB001900F009C0DE40300F16840E42357086C548D3D14D666213A52413ECC62270513827C00E032201F00884765F990020C4AAF47ACCC1B5452A2AA59DE9F52889A68E313E5918FD14EB98E895E94E443B11C262B667D31900F00DC00E40300F1A821F2412FD4ADBB2622A2EF16312852EFCCA871DF8DEC31C3B27320F20100A809C80700E2519B7C98463E4C3242D442504C0D29EBB519ED94D733DC27F9874A3E8C0B221F000035900F00C4A341910FF3658DE4A33CEC31AD9289526C63ABB7B3E434887C00000C807C00201E16E5E3A0C72CE7C33CE6B1C53BACBE11A65AE4E39E3EE17443AECC9CC37850104DE4A35A817C00E048201F00884755F960810AC906EA887CE8E5E3DDCE2DDE4EEB910FD217A9AF67DB935B3589AB9530DF24C807008E04F201807854BDDBA5600F66238955F40F5D7E86241335463ED82D306C41C3F523F20180CB817C00201ED5BB5D8A718B2D5BF4C37B48411103F960BA500C5D18094D613D45A15104A26C9C0F650DF23ACB3E0BF20100807C00201E56E543FC02F900C091403E00100FC807004068201F0088C7C3DB03D424276797B9CB41B30BFBA6BCF73700A0C1403E00108FC73AC3D4249F989CE32E07CD2EF4351F7ADACF7B7F03001A0CE40300F1F8CE9E63D42AEF397189BB1C34B59CBAB2405FF391670FF1DEDF00800603F900403C5E1BBA48ADF2136F1CE3EE074D2DCF84C6E96B6E0BC478EF6F004083817C00201E576E2F53ABFCB5A7F6A66EAF705784E69547770ED0D7FCF08B1BBCF73700A0C1403E001092C75F3F4A0DF35FF5C5B92B4293CA5B27A7E90B3EBC3D706F758DF7CE06003418C807004272E6DA020B7E9CBAB2C05D141A5ED29955769FCB6B431779EF690040E3817C00202ADFDB779C9AE76FFCB4CF619D2F8BCB6B5BBC11FA6A8F7586D7D779EF65004013807C00202A2BAB6BEC9EDB479E3D34712DC35D1A1A52D29955661E0F6F0F5CB9BDCC7B1F03009A02E4030081999E5B7EB463800D86B17BF0227775D86439349662BD2DF475CE5C5FE0BD770100CD02F20180D8ACDC5F7B421EF68385409E098D0B9705929C5D7EF1C817ECDE162AA453887900E06C201F0008CFFAFA46E4DC0D320FD678B3C24208362FE5DBFCD2275F20CF0300C703F900C021509B3D7036B52D1013423BD4E5A1A7FDDFDF7FFCC0E834EEAA05C025403E00000000D052201F000000006829900F00000000B414C807000000005A0AE403000000002D05F201000000809602F9000058221C0EF3DE04008043807C00002CD1D6D6C67B1300000E01F20100B004E40300D028201F00004B403E00008D02F20100B004E40300D028201F00004B403E00008D02F20100B004E40300D028201F00004B403E00008D02F20100B004E40300D028201F00004B54908FC9505B6852376D61A4A76764419A27FFCFB0124D6A2B4C2C56375DA75CB702651B60BC59D666D65007005007900F008025CAE583848135CE85465A795F9859948F50487A295792A78E84CA85A1505D5A85B15928126384A12594F98C76CBABC94B799D0A1B0000A809C80700C01286910FD6C04B6DFF48B1A92F994829F241D37A7A7AA4FFA459461E5135F251AC653D14217DA8912EA8E22DC5951AC56434CB9AAD0B005017900F008025AC76BB18C94761BAF2AACC334AC185C94A0107B3BE17233190231765AA52A5F7A6187D9154A9421500C0E6807C00002C61201FE52DB9DC3FA2978F50A8475345BB186BCC95C8872EB8A1898854E84829A3A010468112B52BE9BCA9B87AF52799BD0600D40DE403006009F3C887B645368E7CA8E310A549A5765F2D1FA6A106938C9036E38C0D5ACED8152A443F201F00B404C80700C012E5F261D488CB710DBD7C4C963A3254391FA6F2611AF930C1201344E9E3314A1DB116F9A8E6270080FA817C00002C5131F2A16AE00DBB5D8ADD31D254F6D6483E464266391F156440D21D9D10A8D3430DD2496B8C7CE8BE2AE40380CD03F9000058C2543E8C47C3301DE7C330C6C17CA0202DB5463EB4F221277BA817D14FD07C82859C0F0040C3817C00002C612C1F654DBD6A46413EB4918511252AA14880FA3E983ABA3ACA24C6F0165D55C6495B799C46B3C91B95E503438F01B069201F00804AECDAB54B67023E9FAF38D368880CA587C4E4FE5775874885214F35D3AA648D96B4A282A614E6EAFA6898494C960D7B56A19FC770345500402D403E0000953870E080BADD3D7CF8703018E4BD510000B1817C00002A71EBD6ADF6F676661E1D1D1D7BF7EE4DA552BC370A002036900F004015BABBBB997C1C3A7448D5E70200007502F900005461626262C78E1D4C3EC6C6C6786F0E004078201F0080EA747676927C747575E5F379DEDB0200101EC80700A03A478F1E25F98846A3BC370400E004201F0080EAE4F3F9F6F6F66C36CB7B4300004E00F201000000809602F900000000404B817C00002AB12EF355196C3AEFAD03000809E40300600AD38EC5C5D49D3BD3B7E7AE505995C9E7F36B6B6B4C41786F2300403C201F0000638AE67165DFEBBFAA949B33C96C367BEFDE3D5210F80700A03E201F0000039879DCB9334DC2B1FFB55FDEBBFB5F52A117FB7AFECD95E9CF33990C29482E97CBE7F3F00F0040AD403E00007ACACDE3F389AECFCF7629FE71F9D2D8FCFCFCF2F232FC03005007900F00800603F338DBB5B83492F9E7CF24FF784DF28FBDAFFDEBC9E429F28FA5A525F80700A056201F00801286E641DA41F251EE1FC98BA3F00F00401D403E000005CC621E8BFFFCD9D2DDF1BB77C717650B817F00003609E40300206116F3A07257360F56580804FE0100D80C900F0080796F8B6C1E4BC5C25EB35E98CF27E01F00803A817C00E0760CCCE3DC2BEADE96BB2AF350FC43CAFF38F70AFC03005007900F005C4DB9794C7CFEF29DC5138B9913CBD951A92C9FA692593EC5DE2A2FA80215AA0CFF0000D40AE40300F7526E1E67CE3E3FBFF02995C5CC49A92C8D145E1815569316817F00006A02F201804B29378F53A73D5FCE1DA172EBD687EF1DF85F69E2E0477F7267E1F8ED3B9A4213691655A06A69B93E2D08FF00005807F201801B29378FD3A33B6FDE88DC9CFDE0C6CDC3CC3C5839FAE11364184AA1B7CA2CAA469567BE9496A2C5E11F00008B403E00701DE5E6717274C7CCCD81D48D01328977DFFE4D452F0AFE11F9439A7EFD66845EE86651659AC596A595C03F000056807C00E02ECACD63E4B37FB89A0A522181A0A2D30B568E7CF807540C675DBB1EBA76233475F51D5A03AD0AFE0100A80AE4030017516E1E278EFFE4D254E0F2A503640FAC7C7CF8F70C25C3B0506565C1CB53015A15AD10FE0100A80CE40300B7C0CC6371F18ACA3CB65F98DC47E592EC0D4AF930FCB815F3A06A972E1D2C2D78E9205B5BB97FB0E7DFAEADADD106F0DE0D0000FE403E00700B241F8B8B29B57924CEEFA17261D24FE5FCE49B172EEDBF38F9E6C54B52F930F43B55CC23F43BC94B6F4ACB5EDA4FFFD282D2BF97DE64EBFC7470BBEEF9B7D96C76757595FC83F76E0000F007F201805B2874B8F4FC1B320F9283C4F91E2A172FEEA392B8D84B85BD50DE4606FE6F33F3A059EACABA05D99A997FF476FFAB739F0FCFCECE6632997BF7EEE5F379DEBB0100C01FC807006E81E4E3F6DC15261F278EFF8485282E5E7A93C53CA8242FBD5908664CFA9315831F348B16644BB1C8078B9A48FF16831FACF385E4637CECD8B56BD794E007EFDD0000E00FE40300B7A0C88772930B4BD1B83C1560B9A2976B49FB90123EE4452E6B1764EB546E7B21F9387DFA932B57AECCCDCD2D2F2F433E00001B900F00DC03C907B5FD3767927B5FFBD77236C6BFFCECE4B3CC18943B566ABAE1457DAB8BFA86175AAD621EC3273E482412900F00801AC807006E81C947369BBD32FDB9E21F2747775C4D05A5513A6E48C375A46E0C988DE76136FEC7B5EB216959FA571E2C4419EA94CC6368287CE6CC990B172EA0DB0500A006F201805B20F9C8E7F3F7EEDDCB6432972F8D29FE71EAB4E7C6CD81999B03D76F4AC3981A4AC6D1C81F960F6FCA8A34C269719053E5212F641E9F7E1A3A75EA542291989A9A42C22900400DE40300B7B0BEBEBEB6B6C6821FF3F3F393C9538A7F9C39FB3C7388F4DC11F5835DF66B1FEFA27EB0CBFEE2E35DBE9C3B7273F6032ACAE36D15F33877EEDCE5CB9767666670AB2D00400DE40300B740F271E7CE9D4F3FFD746060607979998420797154F18F89B32FE91E69CBCAE0477F72FBCEF13B0BC7D30B43CA236D15F3A0CA6C295ABCDC3C2E5DBA74E0C081FEFEFE0B172E609031008002E40300E793CD66C7C6C67A7B7BBBBABA483E1616164805969696F4FE71E695F9854FA9DCBE7D94F907A9C662E6A4AE30FFA00A548DD5A7050DCDE3C68D1B57AF5E8DC562FBF6EDF37ABDA150E8E2C58BBC770600803F900F001C4B3E9F4F2412C160901AFE4824323333B3511C649D6619FAC7B973FFB498394125B37C8ACA7276944AE1F5F269F6562AF2EB3B8B27A8D02266E6A17EB00BBD387BF62C6D8CC7E30987C3B461C8FF00C0B5403E007020535353D4C05333DFDFDF9F4C2675732BFBC7175FEC5E5C1AA1B274779C95BBC57FEF165F53C9FCF36754872A5B310FF523E568CAC4C4046D18DB3C7A4D535ABE8700003C817C00E01CD2E974341AF57ABD8140801AF50AA105EBFEA1D886FAF562BDE6A18605669824058341DAE06C36DBCCDD0300B00B900F00842793C9C462B1EEEE6E9FCF178FC72D36E155FD438A6DFCF36777B5910FC93C964668D626CD43473299240B216DF2FBFD636363F48D36BD570000F605F20180A850EBAEA4910E0E0E52935FEB1AACC43FC833D4910F161169AC79A849A552914884BE1113295808008E04F20180602869A41E8F474923AD9B9AFCA3D9E6A186752191857477770F0D0DD5A1560000DB02F900401852A914EB9B304C23AD1B8BFED18CDE162BD06A493EBA654847484A1AB25A000047201F00D81D6A7D591AA9DFEF6FD2BD2156F23FB898871AFA88783CEEF3F9BABABA229108A958C33F0200D01A201F00D814258D94B09E465A3755FD83AF79A8A13D333636462AC6C62F6960100800D01A201F00D80B360C06B5AC75A791D64D65FF503FAB96A379A86123B762E032008403F201805DA0B6930DBD45ED28AF3E0533FF20E76065F8C40767CE9CA14DBD7CF9325FF350A31BB88C360F0397016067201F007086A5912AAD26EFCD31F08FC9E4A9739F0F8F8F1D3B7DFA13DAC20B172E4C4D4DB167D5DAC13CD4B05B819885B081CB602100D810C807007C6069A45D5D5DCD4B23AD1BB57FB0E7DFCECECE5EBB76ED8A0CBDA0B7349166D9CA3C74B081CBC842D8C065183E1500FB00F900A0A55013188FC7953452DB0EA2A5F60FDA66DA4EB28D39197A416F69A29DCD430D1BB8CCEBF562E032006C02E403349585919EB69E9105D5BBD064F94CE945394ACDC990C15C2B1574D578A2A4915213188D468518328BF9C7DADADAEAEAEABD7BF7C8369665E805BDA58934CBFEE6A14619B88C2C04039701C011C807680E957DA0640454AF2027F212A111C9434ABA52AC532E10861325C86474CBF385A5209073704C23AD1BC53FF2F9FC7BEFBDB75A84DE0A671E6AC842307019001C817C80A6B1B0C0146032C464A0F8FFE2741586AA623DF2A1FD587BC8C7CCCC4C241251D2481D700B28ED71DE9BD078D40397918508678700080AE403340DB200590FB4F2A1EB7A6128610CE54571E1BA3E96A37C5063363838482D596F6FEFD8D898ADD248378923E5432193C99085701CB8ACA280EB7E0EBAB7E551C0CA3F024D37672854FEC176B077E070201FA0892C8C84E82CA6918FC990EA7CAA9CE72A9D788D1342CCCF915CE483A591D205747777772C1673644AA3B3E543413770195908D7A895A2EC3ABDA8A8E96A9937FBC928CB152B1727D82474081C0EE40334856A291F6DCAC9B1281FA6910FD31848516A74B4F2DCC9D2480381004B237576EA804BE44381FD719985B4A6EF4CF7AB29FC3474F261FED32A1EF626BF98F2746F134141E403B400C807681EC676A0995A920F333DD19C4A35A755AEF24117C44A1AE9D4D454B33FCE0EB84D3E149481CB3A3A3A9A3A7099F14FA35C3E4CD4A29052550A60B4A97F2CFA1C29443E0057201FA079985DA319CA87A5C887E6C4CB433E581A2939073542CE4823B58E6BE5434D53072EB31AF9A8241FA55ECAC2AF804D60B791B595F7C6F48C8C20F2013800F900CDA3A6C847493E0A09700641E4C239B3F0B685F2313F3F3F3434A4A491BA73AC4C53F9D00EE6A26E414B77519B8EE7A28E6A899423A90C5C46874433072EABA3DBA5F87B62FB4CBB634A1110443E0057201FA079548B7C4C8674E7CC0A14AEDF34D76D4DBFD596E51EB23452920F47A6915AA75C3E0C6442BE9036C88434BE5E574D153647726666A631039719FC5CE8CBD5DCEDA21A3AA722659921F5DF600640ED403E40F3A812F928DD05637629179A549A37E335C975AC26B75A269FCFB34C4376D7A5B3D348AD532E1F1B9ABF71A1552CFC4FD3189AFD01AADD592D548EA47AE0B2C1C1C19A0F1B03A332928F1286CAA51242F9E632D3FDA4CE0DD9EC2F06809A817C005042E9D167F758F2DE1C7B61281FC5464CEF1AE552624449549C9423393F3F1F8BC59481CB6666662C2D661CF96028DF9C7D537576692960546117185C07A86F75D77E06002D00F2018074CDAAA4914E4C4CB82A8DD43AE5F26178CD1C0A15A3514A6E4E15F9706C8E241BB8ACB7B79785D0AADC15651CF960145EAB926734DFB7B41F4B4ED2A64D0251D75F50EF58F554C8076819900FE05EA86D6069A47491EADA3452EB98443EF4A8BB52B4D9C415EA3A3C4792250F0502814A4135B39C0F23B9D2F795681FDEA855908A9A6636845FCF48F3F606001B900FE042584B40D7A3A41D4823B58E917C18DC1CAA110ADD0483C50B23F0BB24475219B8ACA3A3C3310FFD01A00E201FC02DB0A1A2943452AB3DF1A088897CE8075E294D2AC4236AE876714F8E64CB062E03C09E403E80F3999A9A6269A474AE471A69DDD4201F21F5CDD0D6BA5D0CE6B925475249730E0402E8FE032E01F2011C4B3A9D8E46A35EAF97CEE94823DD3CB577BB28752CC8077224654B6EC9C06500F007F2019C069DB263B1587777B7CFE7A33338AE231B45CDDD2E46759449AACE12E448EA510F5C460773FD0397016057201FC021E47239258D74707010E7EB8663241FA0B9A4D3693A98D9C06543434318EF0E3806C807101B258DD4E3F1208DB4A9403E38C29E2E54F3C06500D815C8071095542A150E87BD5E2FD2485B03E4C30EE8062EA35F01EF2D02A01E201F4030E81290A591FAFD7EDCA0D84A201FB6820D5743BF023C0D008808E403888192464A208D940B900F7B8281CB8088403E80AD612756BABC431A292F76EDDAA5BBADC4E7F3F1DE286080327099C7E3C1C065C0E6403E804D514EA3E170181DDB1C3970E080DA3C0E1F3E4C0D1BEF8D0295200B51062EA33F16062E033604F201EC054B2365A391927FF0DE1CB071EBD6ADF6F676661E1D1D1D7BF7EE850B0A0459081BB8CCEFF763E032601F201FC016B034D2AEAE2EA491DA90EEEE6E261F870E1D429F8BA090322A03979185A00713F005F2017892CD66E93CA8A491E2B2CC9E900EEED8B183C9C7D8D818EFCD019B823D7600039701BE403E0007943452AFD74BE7415C84D99FCECE4E920FBA6EC69D148E413770192C04B412C80768292C8D949C0369A46271F4E851920F6AA2786F08683C6CE032B2100C5C065A06E403B4829999193AA92969A4B87A160EFA93B5B7B7E3A609678381CB40CB807C8026323F3F3F3838D8D5D5D5DBDB4B2735A491022004CAC065B860004D02F2011A0F4B23F5F97CDDDDDDB1580C69A400080A598832E20EFD8B3BD140A3807C8086C1AE960281004B2345FE1A008E810D9F5A79E0329AF2FAEBAF237F1C5801F2011A40329954D248A7A6A6786F0E00A089A8072E230B51429B74C9D1D6D6F6C20B2F4C4F4FD7B7E6F5F58D0FCFDDF859787C8B3742E517B6EDB17979AC334CDBF9A360FCC0E8F4CAEA5AE3F6B1F3817C80FA6169A4740EA22B21F40A03E03652A9149D019481CB5E7CF1453618DD73CF3D37323252D3AAEEDC5DFD71FFE9879EF673F789CD94EFED3F3E3DB7DCA4BDED30201FA0127406E9EBEBD359051B1E404923C51D1000B89C743AFDC1071FA89F01B46BD7AE43870E595C3C303AFDF0F6006BBF1FDD39F04C68FC48E24B2A8BCB6BF7721B762E6C3B5F3CF28512A7F9DA537B7F161E5F5F6FEAFE7602900F600A9D3BE824F2CA2BAFB0412DD96D782C8D94E40369A43604516BC00BD6E7A266C78E1DAFBEFA6AE504553A62E9AFCF0E866FBDFAF1C4B50C779FA8BB2467979F78E318FB2E8FBF7EF4CEDDD596ED7C11817C58C26DE7743A5FBCF6DA6BEC0CB273E74EF28F6030C80620421AA93D41D41AF0E5A5975EA2D3456F6F2F5D9FF4F5F5FDFCE73FA7AB94F6F6768FC7536129661E5F7B6AEFEEC18BDCEDA151B110F633A43330E21F15807C54C185E7F4F9F9F9175E784117418DC7E34DDDCF6033206ADD7C2643A149ED9485911EFD2437C39E3EC89E0D190E8787868626262652A9548510291DB7EC2F4EC700F743B18165E25A86FD1EA9ED68E59F402C201F9570E1397D7A7A5A797EBAC2CB2FBF1C894436B12371E26E16885AB70C3A647B4616E8DF36236896522B1452EA685E17AA68D769F43330FB10B3D554663264BEB23A56D7286E2EAEB0B3EB9E1397B81F7B0D2F2726E7E8944BDFEECC354EFBD7F6403E8C71ED39DDE3F1189EA2BC5EEF66F6A708276E9B9EA32B83A8750B591809A98F02A303503ED0270B33D851AF9A61F518D63219323DF8E46356BB06E530365EC8783B78C00EDDC75F3BCAFD906B52A18B557618F3DED33605F2610CCEE98DC65E276E8D6818D5B0CF39BA02885A73C0446ED9A1A84876F38F61793B643F57AD419A58A82C1DE206EBB6C981BDB2BAC60203425FD7552E8BCB6BEC303E7B9DFF0EB721900F03704E6F167639714B67E6CAA7609B9CA32B80A8752B6107AEF690283F00A506DF3CC2272D5D39BC666CC215221FF22FAAB4119A77DA59AA4DB4C3813D7026C52E84B81F694D2D4FBE1DA3AFF9ECE171DEFBDB8E403EF4E09CDE706C78E2AE7A0AB6C939BA02885AB71AE9589A34EDD42BCEAB49A0E930330A005639CE5587A6D630B4AB63C770D55F8D517CA4E96C0B48ADF2CEC804F7C3ACA9E5FDB337E86BFE7AC740EBF7B0FD817CE8C139BD29D8ECC4AD3A2317D661CF73B419885A73A028B265075E61C6E4887418AB8EE1AAC8876BD5AA96231FBA58879140ABFA65B8C212E11D165A2E2FE9CC2A7D4D3A8C79EF6F3B02F9D080737AB3B0E389BBB816E32E1D5B9CA3CD40D49A03AA63D8D06837CA13ABD539D3E50794FC63A87684D6D2ED6214F9D057973E91BF477FE3A77DF4974DCE2E733FC69A5D5883C27B7FDB11C887069CD39B851D4FDCCA8A8CAE0FED718E3603516B0E5413E80D7DDE927A9E613FA33CABAA6ED7241F663D32A5ADB3C57DEEECE63BFB8F59B0F902F93003F2A101E7F46661C713B77655256C748E3603516B0E48C7D2081DBF21EB024D07BB1C44EBD107D234F7A218A7866A3ED79A7CA8DFEA8F6B6D30AFFAEFA2B930F9A87600CC1EDCEA1D2EBD1DEDDCA27ECB2A6C3B78B5C2E25B143A3DDE2D7ACA979516E98C19AE6DB473EBBBD3AA29C31EB39A9AC2BE29C75D6D5B201F1A704E6F16F63A7197821A8534D7D22C7B9DA3CD40D4BAF528FD7C35097431D8A79F60906E6D761C57B8D5B63C25A934B9CA275AEBB66C16D6E46343251C3A11914BCCBBC5335A78A1E5C9BED9429DABEF3EA9D4915F4CF76D93A5A1282E65CBEA281A865E3EA435EB65C8A0403ECC807C68C039BD49D8ECC46D321493FDCED166206ACD91D2315C3C8A74A9D1AAA469E58092ABCA026E9A4CA4AE5E7ADF667E705BDD5AF3F4A54A3F9DA6525D3ECC9DA02816463A922B7302B57C18463E62DE92A99495A2A96C28F241530CB649E725AA02F93003F2A101E7F46663DB13B73DCFD166A8CFDDC39E0A976BBA13B478716C9CBB05E2E5975F7EFFFDF72B3FC69661493E9834680BB5FDCC1554010CD561231986F690AE1AF93059BFC9615F58848ED542B58AEE8203B802900F0D063F09C9A34BC7A8FA44AF1C7C5B4C8D58F919E09C0E1A8985A8353B0CCAAF0E058B63E3401508A6FBEDEDEDFBF6EDBB75EB56859A9B968FD239B370644A07CF962D9E77D974768CA94ED7DB0EF6999F57CD8F588DD6140F5795A0941DC3900FCB403E34A87F120632B1F5DD83C5865C158E33FB9DA82E2B714E070D4577EED6053FE483AA4C3EC48C63E3401508750ECA8E1D3B5E79E59553A74E19D66C44B74BF154C9B4A3EC8AAB70CAB512F9501DB1EAC887FA246F185FD44759201FB500F9D050764E57420E0593284411E8802E1CEBE5816B6B979838A78332EA8E5AAB0E54E53831920F01E3D83850AB924EA753B533543BD168D45F115D2AF9AE5DBBDADBDB0D9F49B9F96E177528A252510E5783536575D129D49436C6ABBDA82B1DED464738E4A33A900F0D653F0976EE2E1D674C3ECAA5A4827CE09C0E2C5277D4DA6AE443C03876630F54FBB4D38674757595DD0C561D9FCF57C767D5F1A5E2F178E51DA56CD2FEFDFBE91826EDE8EBEBBB7EFD7AD503B862313C01AACE7574C0941F6FCA51543CAF1A5E8C296E5139F231ECA11F51E9C8945755320FC39F15CEB455817C6850FD2434791845BC9D927C905514637AD5E5C315E774D0101A19B5AEA7DBC58E716CB303B5FC3A5BAC76DA904C26D3E443ACB9D01E1E181878F3CD37C9A2C6C6C62AC4F0AA1DC0EC58528EA8D2955BE96ACAA86842808A7CA84FA1F5453E4A3F28E9E45F3AA96EA9B43138D35606F2A1A1EA397D5895F351B8BEACDEEDE2FC733A681E1E8FA7CA816A70EA542ED46AE876B1671C1BE76E81A0633510084C4D4D55AD59F94C5B340C7DCC839D7EA560033B72CAC4422B1FB3EA0BBCCA876BD5F3AAF6FA8DAD99E951A5FB6C71005700F2A141FB9390231C25A4C35A75E78822C2D5E403E774600D45380E1D3AF4CE3BEFD0E563241231BC1AD6CB87DE568DE4C3E890D04E2C1E4C768A63E340752416BB5DF4C798AEF9D728881E4D4CC2A44EF999D93C81A370B8CA5777DA9F4FC5333C0E6033201F1ACAE4A374E2664E5D928F42CE690DDD2E38A783CAB4D517B5368E7C28E76825EB59C838360E5447524BCE87D80507B019900F0D96E4A3380E877C1AB5D6ED82733AB0409D516BE3C807FB43175E8B1BC7C681EA48201F00F2A1A1966E17A58E05F9C0391D34144B391FBAD05AF150D154B47D1C1B07AA2379787BE017DCF1200BF64D79EF6F3B02F9D05043B78B519D62CDE28958BA1EC5391D341E5C3802A179AC334C7FD6139373DC0FB0161CC00F3DEDE7BDBFED08E44303CEE9400870A002A1F9CE9E63F467DD73E212F703ACA9E5D49505FA9A8F3C7B88F7FEB623900F0D38A7032140D41A08CD6B4317E9CFFAC41BC7B81F604D2DCF84C6E96B6E0BC478EF6F3B02F9D080733A100244AD81D05CB9BD4C7FD9AF3DB537757B85FB31D6BCF2E8CE01FA9A1F7E7183F7FEB623900F0D38A7032140D41A88CEE3AF1FA53FEE5FF5C5B91F664D2A6F9D9CA62F489779F756D778EF6C3B02F9D080733A100244AD81E89CB9B6C0821F743AE27EA435BCA433AB2CBA4C3F55DE7BDAA6403E34E09C0E8400516BE000BEB7EF38FD7DBFF1D33E871DC68BCB6B5BBC11FA6A8F7586D7D779EF65BB02F9D080733A100544AD81E8ACACAEB19EEE479E3D34712DC3FD906B484967569979D0A14B0D0AEF7D6C5F201F7A704E074280A8357000D373CB8F760CB014B4DD8317B91F789B2C87C652ECB8A5AF73E6FA02EFBD6B6B201F7A704E07A280A83570002BF7D79E9093ED5808E499D0B870E7DEE4ECF28B47BE6011652AA45388795405F26100CEE9400810B506CE804E47917337E830668D372BEC32C9E6A57C9B5FFAE40B9C5DAD00F93000E774200A885A03DB92CBE5C6C6C6C2E1B0C5FAD4660F9C4D6D0BC484D00E75A1C3F5FBFB8F1F189D465FB675201FC6E09C0E4401516B6037E6E7E7C939BC5E6F2412C96432BC3707D811C8872938A7035140D41AD8817C3E3F3131D1DBDBDBDDDD4D2FE82DEF2D02F605F251099CD38140206A0D7891C964060707BBBABAC2E1F0CCCC0CEFCD010200F9A88EABCEE974EE88C562D96CB6A9BB1400E00CA6A6A60281006907CE1BA026201F4003BB82F17ABDFDFDFD745AE1BD3900003B92CBE5C836C839C83C70A2007500F900C62412095CD0000074CCCCCCB06452BA4A413229A81BC807A804022100808D6232A9CFE7EBEDED152599D4FA5DBEA0F5403E8025100801C09DD015482412A12B106ACBD3E934EFCDB10A9DA6689B796F053005F2016A00811000DC8372C931363696CBE5786F4E6D2493C96030C87B2B8029900F500F0884B813BA026E59BC9D3E0B376D72817ED12C9954E86B8C2119DE5B014C817CD89A569EEBEB008110B7410D52CB720CE7E7E77B7B7BA9156CCDC7810D3999947ECBCE48260D0683C96492F7560053201FB6864E04894482F7565407811097D04AF960502B480A8283AAA9B087B0747777D3AE16E284630552281C367606F2616B262626044AD84620C4F1B45E3E36E4CB716A171DD328DA8AF9F9F94824427F56FA975EF3DE9C86816C53FB03F9B0357445E2F178786F45CD2010E254B8C8C786FC4320A32511B7732FA458D08FD4EFF793D589984C5A1536EE2AEFAD0095807CD81D3A41A45229DE5B510FEA4088A05F01E8A0B68AE3F5311B670259A89B812E06DCF0ABA4CB1EFA9ABCB7025402F261771CF02B72F63596ABE0AEC2A43EB40DC842AD83A9A929964CEA867824B24DED0FE4C3EED0D9969A6DDE5BD10058EF321BAA0817AF82C25D3E36E4A13649C7694B1CDF823604964CCA1EC2E29EBC195EFD83C03A900F01E01BEB6E2C6C90E6DEDE5E044244C40EF2C1A0CDA0430879CD15A093067B080B49BFAB5A624153E5DC06E44300E83ACF79716601032193A1D0A476CAC2488F7E92B3B18F7C6CC86D0C5DCDDB7C2C9CD6A3F67B511EC2D258906D2A04900F01A0D33D9DF4796F4553102B1042AED133B240FFB61941B3945AA1905247F39AAA982D5E42E733F202468E53714DC5ADB1CC64A8D2361556672BF960D061E3F3F9047AE648F36029DE5D5D5DE2087D5388C7E3D16894F756802A403EC4C0E3F1D8BC61DE24820442164642EA46DD28F2211BCA646106D315D58C72239014C2D4148CFDC230DA3219325D8BEC15DA8514D5305EC8645BA5C784922C1A7F0A3FD858A8D4E4F0DE106EB06B7DDCDCCE10656C469703F910037B9EF41B8E1881109388036BDD95E88845F9902CC0B8EB469AA35FC0BCB6897CC8DB2A075F548BA97CC7648562C9C7867CE4D0C52E35C0AE6A7AE907C21EC2425F1CE92F0A4E4A927330900F312091279DE7BD15ADC3868110661CDA26B93CF2513006133F296BD0CD6442D183925298F6BE28AB32EF6991962D2DAA79A79DA5DA2EB1E483410DB0CFE77343334C3F0A964CEA8087B03416649B8A02E4430CE81745271AB7E58ED92E102235F093A69916C57956231F2C2AD14335CD020D4AAD7271A99E3AA25A426B1864162ADD609E5139E34309ECD85C3E36E441B4028140341A75E48F85FD2248B0E847E1CE64D2AA383843CE61403E84C1CD9155BB04428AD1056DF35D9A313922F9874A3E2AAE4BA32906791945C190A63251A994446A39F2A18B751805394CF350EC2F1F8C783C4ECDB39362EF994C46F90920BBB602C8361505C88730D0A53F9D7D786F054FF8074254F2611666D0DF11A3BED9A54D1D0529A8865A5314015950F7F118C5380CCCC67AB78B51E4435F3D34597E6331312463716FF1855A689FCF47C709EF0DD92CCA93926A3CE62B07B30C8FA08AFD7A82208A1F03C88730D0A50F9D80786F852D5007425A7A755B2DF2B1A14F3855CF53A669821CFA1889C60558FBA17103D316A226F930EB91297D03E35B7904928F0DD956E938A1969B7F875DED64B359964C5AEF33A22BDFFEA43A144DA9F9766D3B80FBAE4501F22112F85DA9618190EEEEEED6F57F4BE7F3113A7187AC473EDAE48C0E29B5A3ADD8A46B1A7BB30E9A92A114FB405843617A696A5D3ED46FF5710F6D874BD93AC5920F06B5DC7490D86D78920ACCCCCCB087B06C2E99D48A7C286F75878790DAB1219F133A3A3A786F05B004E44324443CF5B70025F39F2E739B1A08513A4B6A8A7C6C54D486EAD9214591A952ADC2ADB6E5D1F6D264FD66561EE14CD023309BCDFAFD7E6ACBED9CA1C91EC2C264BA11C35498664733819EAC16F760551BF0C55A089D0A68EFF1DE0A6009C88748E0A75501F5B9BBD98190927C14CFDFBA7B5A5477BB280DBA5CD528B7D3789C0DABC16F438FA8E71B997F50C94A04950F462C162305B161162AEB46ECEAEA6AA83D5B8B7C98C86F995E8B01B24D0502F22118B53FADD1754F24695920C485889EF54CC786CFE7B34F42622291201F6A4E0275413E74B1AFC2E8316AF930897A88788E40B6A940403E04834EFDB526F03BE58924B525C7B53210E21E684FD2F99DF7566C0A3A12E82BF4F7F773CC42CD66B3838383E4C7B4194D4B4629C987FA2E6B03F97050E40359710201F9108CBA1ED828DE134934A261F2F91693E2100869200E900F46229120316DFD9831F4FB65C9A4CD7F088B65F9B07635617F482B3D1E0F2E334401F22118F5FFC0447A2289E9F0DEEA6F5353463E02210DC131F2B121871FE860181C1C6CC167B1C38F3D84A555CF3CB3D6EDA24213AC14F0961736B20BEFAD0056817C884730184C2693162B0BFA4492AAF251B5821908846C0627C90723168B35752C545AB372BCB5F6212C06918FD2AC521234BDD055510DF422D4DD2EA22724B90DC88778D4DC0008F8441255B78BEEB612736A09132310521F75F5FAD91D761359631315D5A3F1723AC00CBC5E776754D1E0CB7E95A2C53C1875E4C3018E403EC4239BCDD285540D0B88FA4492E2CA0C6A544C39A90504426AC2A94FED22190DCB6C3E0B3593C90C0E0E767575D9E781CC2E01D9A66201F910126A006A489217F58924CAEA8D07C7307CF8487D20106211A7CA07833D30B66E63606121D28EE6279302033A3A3AF0CB1508C88790D0D9AD864439519F4862B06AD5C63665BC122510B2B991AD1D8BB3E563438E5B9080D634901A992B7B088B9B9F3BCD1D649B0A07E44348E6E7E7E932DD6A6DF19E48520A6A94DD3C53E5E1230D41DD9CB4EADE043170BC7C30483E4841AA462FA0AAF6C179A9D08E07F2212AD6873A15F08924AA2E22F56C0B0F1F692CCAA80C685D18EEB9BE24B120BF37544F964C4AFB019D74F6211A8DC6E371DE5B016A00F2212A75FCD8847E2289C5878F3403E5E1E608849081D17EE0BD152D2297CB917AAAB350E9EB47221192519A88DC465B412288F45EB1807C888A4B02E0B602811057C90783DD317BE2C409964CDA8487B08006806C53E1807C088CC7E3C179B0F5B83310B26BD72E5DBE901BFA5FD8DFFAA5975E7AF1C5179152605B6ACB8103F600F221307884235F5C15083970E080DA3C0E1F3E1C0C06796F541399999951FF71E9AA9A5EF8FD7EDC436B43E81A80FE58BCB702D406E44360F093B303150221376FDEDCB76F9F33A253B76EDD6A6F6F67E6D1D1D1B177EFDEA63D8EB5759C3E7DFAADB7DE52FF81D423BE9487B5E82BD32CEB0F3700AD01D9A62202F910183A51D295197A3A6D427920E495575EA1A69A9A2B67F8077D11261F870E1D72409F0B99077D178FC7F3D1471F6DC8A1FB482442125979AC5BFA53068341AA83DF9D7DA86DD045600F201F62835F9DDD5002214A53ED18FF989898D8B16307930FD11FA2C1CC8341FEB167CF1EFA1B594F26A59A18CCDB3E20FB4D44201F62138FC7A3D128EFAD007AE854B873E74E75928433FCA3B3B393BE0BA995D0D7FD6AF320C8A876EFDE5DEB4AE6E7E77B7B7B49349BB185C03AC8361514C887D8B8F0D6472108068365A3C9B6BDF4D24BA2FBC7D1A347E98B08EDBB3AF360BCF2CA2B75E46EB32CD44020802C548E24934967E73E3B15C887F020FC6B43E89AB8BC8563117EDE9BB629A8B96D6F6F17BAADA53F81E19FA6EEABE7A9A929FA0DE2A92EBC20FF43FC4944201FC23324C37B2B00702F64638140201A8D0ADD1B2528789E9FA0403E8467666686AEB3796F05006E271E8FFB7CBE0A77CA8066806C5341817C3801AFD72B74241C006740E641FE21FAAD400281A43771817C38010C750A804DC8E7F39148241008E072BC0520DB545C201F4E606A6A8A4E76BCB7020050807E92DDDDDDC8456836C8361517C88713A08B2D8FC783643700EC03CB42A5D6113FCCE6110C0631DABDA0403E1C027E84CE637D7DE3C373377E161EDFE28D50F9856D7B50D4E5B1CE30ED961F05E30746A75756D778FFB98CA1EBF2DEDE5E64A13609A4BB890BE4C3214C4C4CE091DF8EE1CEDDD51FF79F7EE8693FF7065EA0F2BDFDC7A7E79679FFE90C48A7D33E9F0F59590D87B483E483F756803A817C3804FC0E1D436074FAE1ED01D6A03EBA73E099D0F891C497541697D7EEE5365094C276CB8B47BE50C2425F7B6AEFCFC2E3EBEBBCFF8465E4F379BA36080683C8426D20C836151AC88773E8EDED9D9999E1BD15A07EA8D5FC5130CEDAD16FBDFAF1C4B50CF7065E94929C5D7EE28D636CD73DFEFAD13B775779FF310DA0C6B2BBBB1B4F826C14185F5168201FCE013F45D161E64197EFBB072F726FCE452C47125FB2BEAA2DDE880DE31F1B7284D2EFF70F0E0EF2DE1027804437A1817C38073CDD516802A3D3CC3CA805E5DE8A8B5B26AE6558A7D58FFB4FF3FE939A822CD486D0D5D595C964786F05A813C887A3C0AF51506E2EAEB02673CF894BDCDB6FD1CB89C9397238DA9967AE2DF0FEC39AC29E8A50210B7561A4C7F001782542931B1B93A16A3574480B184C168F5C2E27FA631A5D0EE4C35144A3D1783CCE7B2B40CDB00E97C75F3BCABDE57646792634CE3A5F78FF612B41CD67381CEEEFEFB794852AC948CF88DEA62643E5D3945905CBA82C28A6CBDB1C8CAC283A900F47914AA5FC7E3FEFAD00B5B1B2BAC6AED49161DAA8B2B8BCC6224967AFDBBD694D24123E9FAF6AAAB849C4C28A7C18AE805C4654ED60C46231A4CE080DE4C351E4F379AFD78BDBF9C462E04C8A5DA6736FB39D549E7C3B467BF5D9C3E3BCFFBCD5C96432BDBDBD95B2C54D3B4B24F99834EAA0E919190959E89861559BF6CD9A08B24D4507F2E134FAFBFBE95A8AF756801AD816909AC99D9109EE0DB693CAFB676FD05EFDF58E01DE7F5EAB907C908218E46CC9D91F3D3D3DA1C9F27085B5C8072D67A42EBAD8885874777723635768201F4E83CC83FC83F756801A606364E12697C696746695F6EAC3DB454A0B989999F1F97CDA8B072972418251F4073990515286827CE8B253E5695AF9B09E922A02C8367500900FA7413F4BAFD78B675909C4377EDA47CD647276997B83EDB0C2326978FF796B837EBF74F1100E87E5CE53D91A644150072F540252920F656E313CE2E4C80792DB1C00E4C381D0CF12A3280A041B9713A3A7433E142626267A7B770754A109BD3F9038488A61593E9C15F988C7E3D16894F756804D01F97020F8658A05938F6A4DE968E716EFB0F4AF0E9A68587FF6E0D66D07AF1AAE67CB16CFA8F43AE6DDB2F5DD69B34FA4B9AC1A7BADF920B631C5B757DF7D52A9599CD2D937AB5BE1B0674B67CCF8B3A6FBB63D5956DF60330ADFCBEC2BEB0BDBB1BCFFBC7512ED6E7B7E776F2C16636F4D831756BA5D549462291B02DFF282CC360700F97020994CA6ABAB8BF75600AB58918F0A2D376BBCB546B2ED604C2F04C53ADA969BBC81A6E81B78A3565FAA59B09932572021D8A2B387F20D2E9F52B6D985CD93A6ABBD477A2D7D4439A6CA22BE7C30060707FD7E7F369BAD2A1F6573D5E37CD00B5D95A277C8FF6FE217680EC8367500900F67821FA74054950F6AB62BB7B22A09607E50DE5433E718ED54853A863D2599286A417964A54849448A610F291C524108349F6535F221AF53F365A5F0CC36551CC52D910F85542A453FE7D3EFBD52413ED494A220C50C55A3E088B8A38B49030A747474F0DE0AB059201FCE842E9894802DB03995E54369981557A82A1FD4CC6FD9A2542E48803ACCA05DA1B60FC530F2A17A5D30151632C9A95E542B3AF9300A7BE87547FAEE5BB76DD9EAEDDC4A2F0CAA54880639463E36E42CD46030180E879148BE511C999EF75680CD02F97026F87D0A84956E17A620B25518C624984014231F5767879560863A214349F2A0895BDF3DC8E423E695D75C66365AF928C533D40DBFBC9E4278A3F4BA1877A1B726D191B25C1369B5E5D11D49743C2ECDF928676262C2E7F3A5D369DE1BC219E4B43903C88763F17ABDD96C96F75680EA54970FA3E88236F142910FD6B67B878BCEA1AE5670179A2ECF95858316541464D430AF42852EE7C3A88F461105B59718453EAA8540A4EF2B6D619FB768575624C6C9F2B1213FB99A2E2A5C1ED40C87C3151EC8074401F2E158F01315852AF22199C796F2BB5A4CE4430960B008817ACAA8DC79F1EEB0DC97C1A21D4F2A89A265AE60749B49415334D3635E55E845B55556E483C545240D32EF40297E5C591D93DE2247CBC7869CF13038381808045C7B6981F08F33807C38966432190C06796F05A84E65F928C6276A958F52D3AEAAFFAE92FF410DB91408B178ABADAABFA3D4F5C3962DF4C8946D6135F9507D7A595443BDA04A3E0CA3236E930FC6D4D454777737FDCB7B435A0DB24D1D03E4C3B1D0AFD4E3F12043CDFE58C8F9B0261FA5040B4941587746A9CFA58F5A74D51D2852E5A2A9940FD461201F65637B147A46985214E72AAB2AC8472945A3F2DDC21A6B3188AC20F2A12797CB0502814824E2AADF38B2D91C03E4C3C9D0B9C985D746C2B169F928A67A94DA6C798AEC19DAF046513EE441C33A9524D34AE37C94EEDA2DF5A7148313AA013954F7DF2AF2212FA5188355F92825B722F2519DB1B1319FCFE79EFBEAE9FB926FF1DE0AD000201F4E666262221C0EF3DE0A50851AE543E9A430BBF356AAA069E64BE39332F928E56728CDB88116181A49694BF4038B2972505855D9E295E4A3682A064A81C84735C83CC83FE2F138EF0D6905641EE41FBCB7023400C88793C966B35EAF97F756802A581B5EDDADA55C3E94DE25033772A37C6CC87DACD168D40D59A8C836750C900F87D3DBDB3B3333C37B2B4025201F4D2AEE910FC6D4D414B5CD0EEE69451E9B93807C389C2119DE5B012AF1F0F600B591C9D965EEADB5C30ADBB1BCFFBC2D259BCD060281C1C14147B6D0E9749AEC8AF75680C600F97038F8B9DA9FC73AC3D4469E989CE3DE5A3BACD05E7DE8693FEF3F2F0762B1586F6FAFF3B250916DEA24201FCEA7ABAB2B93C9F0DE0A60CA77F61CA36672CF894BDC5B6B279553571668AF3EF2EC21DE7F5E3EB0AB0E87E56646A35197E4D5BA01C887F3417EB8CD796DE82235934FBC718C7B83EDA4F24C689CF6EAB6807B4722CFE7F3F4DB0F0683B95C8EF7B6340664B03909C887F349A5527EBF1B83CFA270E5F63235935F7B6A6FEAF60AF736DB31E5D19D03B4573FFCE206EF3F2F6792C9647777379D04786F4803E8E8E870642E8B3B817C381FFAB97ABD5EC75CFD3892C75F3F4A2DE55FF5C5B9B7D9CE286F9D9CA6FDF9F0F6C0BDD535DE7F5BFE64B359BAFC103D0B15E96B0E03F2E10AFAFBFB138904EFAD00A69CB9B6C0821FA7AE2C706FB9452FE9CC2ABBCFE5B5A18BBCFFB03622168B9182889B858A21131D06E4C315E0776B7FBEB7EF38B597DFF8691F3A5F36531697D7B67823B4271FEB0CAFAFF3FEA3DA0CF66014411F768D6C538701F97005B95CCEE3F1F0DE0A508995D53576CFED23CF1E9AB896E1DE8A8B58D29955661E0F6F0F5CB9BDCCFB4F6A47E85440D721FDFDFDC2F5C3FAFD7E6764AE0006E4C32DE0A76B7FA6E7961FED1860A353EC1EBCC8BD2D17AB1C1A4BB1DE16DA7B67AE2FF0FE63DA9A4422D1DDDD2DD69D2374F9249C30810A403EDC423C1E8F46A3BCB7025461E5FEDA13F2B01F2C04F24C681C5920954B7276F9C5235FB07B5BA890BD21E661856C36DBDBDB2BCAF0C7F3F3F3644BBCB7023412C8875BC864325D5D5DBCB70254677D7D2372EE0699076B4D5961D7F428EA52BE8B5EFAE40BE479D404C9072988FD07214C2412FDFDFDBCB7023412C8878BA04B077173DDDD0635A2036753DB02316847E5F2D0D3FEEFEF3F7E60741A77D5D6C7CCCC8CCFE7B379162AB24D9D07E4C3450C0E0EC662EE1DF011006008CB42256C9B541108042A3FAD7761A4A7AD32A1C98D8DC950B51A3AA4050C26830600F9701118EA140060463C1EB7EDF9A1E66C5349467A46F469C793A1F269CAAC8265541614D3E541AD403EDC0532C60100E5D06981CC239D4EF3DE1003EAC85733895858910FC31590CB403B1A0CE4C35D84C3619B77EE02005A8C9DCD63437E3C4D3018AC6101D3CE12493E268D3A687A464642163A6658D5467D2F9703F9701735FF8C01008E2693C9D8D93C366A4D5693B33F7A7A7A4293E5E10A6B910F5ACE485D74B111B049201FEE229FCF7B3C1EA19F2F05006814F6378F0D0BD9A62AA4C8050946D11FE4404649190AF2A1CB4E95A769E5C37A4A2AA817C8074FB86468D7F24B06C0804824027F7500CC3C6C3EC8C7FCFC7C575797B54C35F9842A9FFAD4C10B958094E443995B0C8F20F2D16A201F76A22519DA636363D47834E91B0037408D81CD5B2C50156AD4ED6F1EF178DCE7F3590BCC68821C7A7FA099D259D0B27C20F2D17C201F36A23519DA18EA146C12C887E850736EF3814DB3D96C20108846A316636CE40BEA53A169F0C24AB7CB86663D1AA3C12D2F8D03F2611B5A98A14DE71DB19E29056C05E44368C83CFC7EBF9D6FB99F9A9AEAEEEEDE4CEF7055F9289BAB8E22D30B5D95A277C8FFAF7BAB801AC8873D686D86F690CCA6371AB8148CD32F2E36378F7C3E1F0E870381C026B7B0B27CE86AAAFB540AFD33E55D2F8879341AC8871D687586369D807C3E5FCBBE1E7018D47AA55229DE5B016A666A6AAAB7B7D7B6E621C4536640A3807C70874F863622E7A06E201F2242E6110C066D7B9B522C1623314244CD3D403EF8C22D433B12898C8D8D35F19B01E702F9100E3B9B075D0591760C0E0EF2DE10D052201F3CE198A14D27A34020D0A82F025C05868A118B898909DB9A076D9BCFE743FEBB0B817CD888566668D399C8EBF5E2370FEA004F081208FA4BD1DFCB86E691CBE5FAFBFB69DB6C9B83029A0AE4C346B438437B7E7E9E453B6D7862027606F2210ACC3C786F8501EC66DA4422C17B430037201F6E27168BF97C3EE47901EB403E84201E8FDBD03CE852872E78028140369BE5BD2D8027900F208540C83F6A786E247037C856B63F434343D16894F756E8C1A90628403E8004BB1CB1F988CBC02660903A9B63CF3F1082AC400DE40394C0203FC00AF66CDB0083AE22ECF6D7610F6A417A195003F9001A72B91C1BDE183DB2C00CC8876DA11FAFDD3A3592C9E4261FD4021C09E4031840670A9FCF87F30530849AB7F221A14A03CA28776DE99E95A81E95463BFC4C698EF686AD8AA3E014EFF10245EC9608CCAE6482C1206EA605E5403E80312C528ABBF0413986377096EE08D7DC1BAE518405F5B07A45E3D078884A31CA47AD51BF357992B37B75C46EE6313333D3DBDB6BAB4D02B602F2012A41E78EEEEE6E8C4506D418C947C9384C86ABD928CC0C8D2C988883B4145B585E99FCB2AC6A7164DFB6504837BCAF2ECEE21EF2F93C5D27D8AA991F1A1AC2835A4065201FA00AD96C166391013506F261FE68A18A21893251D1CB8766FDECAD2A5252F40DCD0305DC05FD2A83C1A07D7A48D9D08548090255817C004BB0DBE4D2E934EF0D01FC492412FDFDFD26330D06E49529E88976A655F9A009A1505940C53C41C425D8CD3CC84AC93C10280556807C00ABB06B1ABBE5D283D6934AA5FC7EBFE12CC30848490B8A56611C1D511E4FA4930F393BA4F856B5B456644A3D34EED0905C2E477F059B98076D0C52C4404D403E400D286391A137D7CD98CB87640823525A8732457B4F8A3E2C52F6CC655931D8D4826D1493548D5349CCE22C4E8799874D620CEC412D36D120200A900F5033C863773966F2515409F58D2FDAF084DA155808835CA54715C4286699168320A51568EF83A92DB5C46130F3B0431F285D8D44A3510C0B04EA00F201EA016391B919669FFAA9EAFB688B7AA07701261FAC8344334F5A40652CA150B1A27A6490B2C8872E7052F13E1BA790C9646C621EB40D3E9F2F1E8FF3DE102024900F503F2CDC9A4C26796F086811BB76EDD2851AA8F991E7A8631C05B9E8E9D12946212BA3A2202816A2EF9199D4DD596B70878BBE8AF3B08F79C4623174BF82CD00F9009B2297CB058341249AB98403070EA8CDE3F0E1C3F4D7DF28A58496277C16274A3D2845A930EB3351F7B26CC86B55EEA355AF56173831CD40751ACC3CB83FFA319BCDD266E0DE7BB049201FA001B0B1C852A914EF0D01CDE5D6AD5BEDEDEDACA5EFE8E8D8BB772FFEE8AD617E7EDE0EE6914824F04B070D01F2011A03AE875C02B53D4C3E0E1D3A54EC7301CD259D4EF7F6F6F2350F96E6D5DFDF8F18276808900FD048D8586436B9031034838989891D3B7630F9181B1BE3BD39CE87CC83B49E6F934FBF68FA5DE30637D040201FA0C1B0F830C62273309D9D9D241F5D5D5D8872351B3B98071BDA877B8F0F7018900FD078301699B3397AF428C947341AE5BD210E676A6A8AAF79605063D03C201FA059B0502D22F3CE83E4B2BDBD1D43BC3415328F6030C8D13CE8978B2E54D03C201FA089502B1589443016190035C1CC8357AF16FD5AE9374BBF5C74AB81E601F9004D878D45964824786F08000240BF148EE641BF569FCF8707B5806603F900AD2097CBF5F7F7632C32002A33313141BF142EE68138256825900FD03AD85864B8A802C010FA8190A073F9686468811603F9002D857527632C32007450C3CFCB3C62B198DFEFC7BD69A095403E0007301619006A868686229148EB3F972E067A7B7B7131005A0FE403F0014308B480F5F58D0FCFDDF859787C8B3742E517B6EDB17979AC334CDBF9A360FCC0E8F4CAEA1AEFFDD72286645AFFB9AC1B14D700800B900FC0138C45D624EEDC5DFD71FFE9879EF673F789CD94EFED3F3E3DB7CC7B5F36172EE6C11ED4820470C011C807E00CCB748BC7E3BC37C4390446A71FDE1E60EDF7A33B079E098D1F497C49657179ED5E6EC3CE856DE78B47BE50E2345F7B6AEFCFC2E3EBEBBCF76973A0E6BFF5E641BFB8EEEE6E3CA805F005F201F893CFE7A3D128EEF1DB3CD448FF281867CDF6B75EFD78E25A86BB4FD45D92B3CB4FBC718C7D97C75F3F7AE7EE2AEFBDDB60C83C5A6C00CA730FF04303DC817C00BBC0C622C305D96660E6F1B5A7F6EE1EBCC8DD1E1A150B619D475BBC1127C53F5A6F1EC8B202B602F2016C04BAA2374360749A990735D8DCA5A18165E25A86F522FDB8FF34EF7DDC00F2F97C30186CB179C4E3719FCF974EA75BF9A1005400F2016C07C622AB839B8B2BAC85DE73E212775D6878393139475245DFEECCB505DE7B7A5330F34826932DFB4436B24E341AC5CDB4C056403E801DC119B3565887CBE3AF1DE52E0A4D2ACF84C659E70BEF3D5D3FCC3C5A69D5AC2B131E0F6C08E403D817162BC638045559595D638101A1334C2B97C5E53516DA397B5DC8E0472E97239F6E990790E884C361FA44F460027B02F900B68665C90D0E0EF2DE105B337026C5A202DC15A1A9E5C9B763F4359F3D3CCE7B7FD70C1980DFEF4FA552ADF93876FB3A72B7819D817C000188C562188BAC02DB0252ABBC3332C1DD0F9A5ADE3F7B83BEE6AF770CF0DEDFB5C1CCA365C99EF8B10021807C0031601773B851D010362497C36E72292FE9CC2A7DCD87B70778EFEF1AC866B32D338F4C268330211005C8071006364412C6222BE71B3FEDA3563939BBCCDD0F9A5D586A0BEFFD6D156603AD318F89890924480181807C00C1C05864E5B06140ED3F7ABAABE483CCC3EFF7D3BFCDFEA05C2ED7DFDF8FD1718058403E8078B0B1C8E8848BB32D83C9470DADF8D5779FDC52A233569A35DDB74DFDF65E6EB473CBB683572BAC6DF6E0D60A1568AEEA833CDE2D7A2AAF5C5FD837E5BDBFABD332F3602E9E48249AFD41003416C80710153AE1620C03463DF2E11935B40DDDDB614F992DE88C21E6DDC25615D38BC5937DB3FA8F2B562E7E4A657111553ED2E9B4CFE76BB679A01712080DE403080C1B8B2C1C0EBB7C2CB23AE523E6253F903D60B453270E5BDF9D66E6E1F1766EF10EAB9695278EAA021B9AB9AAC88A6ABA5A3E9C1EF920F3F0FBFDCD8EC9CDCFCF23FF1A080DE403080F52ED362D1F6A6928F4C2D0F462E842521369A26AAE364C22F5AD94A64B86A13512D7443E5A631EE41C74C0E3665A2034900FE00494B1C8DC190269947C0C7BB6757A74391F1512444AF91C054D61353DEFB2E9ACA6AAE366DBC13E27473EA6A6A69A6D1E2CD4E7DAE31C3809C807700E744548677F175E1136463EE4B0843A98A1EE82D174BB30D4C10CA61DE535591D17443EC83C82C16053CD23994C22C9093806C8077014EE1C8BAC3EF9601D2B050F28666994DDED52F09252F6A876BA4E382AB98E6A8AF1A7082B1FCC3C9A178D60B777355B6E006825900FE034D85D007EBFDF3D7701D4271FC31EA967A498705A8840A8B4407397AC515F89363A529E4CAA7849513E68E5E5EBAAC9426C281F8944A2A9E6413EDDDBDB8B816D80C3807C0067924AA5DC331659CDF22115120E6FA747D2086621E631095DE788C91D2EC532EC29EB4929648D94A63B26F24107587F7F7FF3CC636868080F6A018E04F2011C0B0B56BBE1A9E2B5CB8714B4907B52F459176A1151BCA16CD831ED6DB45AB1D0CAC7AC3AF95429CE900F320F3AC09AB47296434DF2D1A4F503C017C80770386C084867A7E9D52A1F6418AA1C8ED14EA94F44E943298A05EB4651779D143B4A8ACBCA8BB00ADA3B62B6E86BEAD760DC3B23947C34D53C68E5641E6EBE7B1C381EC807703ECA58644E0D81D4D5ED2264B1897C0C0D0D35C93CE81075F6B10A0003F201DC8283AF26211FAD6448A6196B7643940E0006E403B808A78E45F6F0F60035C9C9D965EE72D0ECC2BE29C75DDD24F3A003321A8DE2412DC03D403E80EB88C5620EBB83E0B1CE3035C92726E7B8CB41B30B7DCD879EF6F3DACF9148A419E6C11E44178FC71BBE66006C0BE403B81176BA77CC5864DFD9738C5AE53D272E719783A696535716E86B3EF2EC212E3B391C0E8F8D8D357CB5CE536100AC00F9002E858D4546E77D0704BA5F1BBA48ADF2136F1CE3EE074D2DCF84C6E96B6E0B705046328F868F1943079EDFEF775E27200056807C0057333333E380B1C8AEDC5EA656F96B4FED4DDD5EE1AE08CD2B8FEE1CA0AFF9E117375AB96FC90CFAFBFB1B7E842412093AF052A95463570B8028403E80DB51C622133A04F2F8EB47A961FEABBE387745685279EBE4347DC187B707EEADAEB56CAF9279048341128506AE931D6F2434B89916B819C80700125353533E9F4FDCBB1CCF5C5B60C18F535716B88B42C34B3AB3CAEE73796DE862CB7629338FC61E12ECC187A247DA00D83C900F000A883E16D9F7F61DA7E6F91B3FED7358E7CBE2F2DA166F84BEDA639DE1F5F516ED4C3A061A6E1E2CC72893C934709D00080AE403000D74554AD7A6228E45B6B2BAC6EEB97DE4D94313D732DCA5A121259D5965E6F1F0F6C095DBCBADD993641E7EBFBF81E6C1069871CCDD55006C1EC807007AE8DA54D0B1C8A6E7961FED18608361EC1EBCC85D1D36590E8DA5586F0B7D9D33D7175AB30F9979A4D3E946AD706C6C4C509D05A079403E003086AE53A9CD106E008695FB6B4FC8C37EB010C833A171E1B24092B3CB2F1EF982DDDB428574AAC5318F469907EBC88B4422C2592C00CD06F2018029641E228E45B6BEBE11397783CC8335DEACB01082CD4BF936BFF4C9172DCBF3C86432F4E76E9479889EC20C4053817C005009652C32E14220D4660F9C4D6D0BC484D00E7579E869FFF7F71F3F303ADDCABB6AC93CFC7E7F43B241E998894422A2DFBC0D4053817C00509D999919F20FDC21E9541A681EEC66DA660CC40E8093807C006009678C4506CA49A7D38DBA0336168B91C408172403A0F5403E00A881A9A9A9EEEE6E74E43B06320FD285CD0B25AD41D03BA400E002E40380DAC8E572428F45061498796CFEEF383131414A8A9B6901B00EE403807A407B233AA9546AF3E6C13AE360A200D40AE403803A41A45D5CA6A6A60281C0268DC1198F4406800B900F0036051B8BCCB521101147D022F30806839BD96CE5066C641F03501F900F0036CBFCFCBCDFEF176E2CB286D0D5D525D693D292C9E426CD030F6A0160F3403E006800E28E45B649C4928F8989894D9A473C1E6FE028A800B816C807000D830D30E5AA240081E483FE2EE170B8EEC5D9835AA2D1A870DD4C00D810C807008D845A26578D45268A7C6CD23C30BE0B008D05F20140E3616D553299E4BD214DC7EFF7A75229DE5B5185A1A1A1BACD43B149DC4C0B4003817C00D014A8AD0A06838E1F01C2FEF2312453DFB22EEC4703A035403E0068226C2C320787EB6D2E1F9B318F582CE6C20C62005A03E40380E6C212159D3A16999DE5231289D4671E994C860D1FD7E82D020014807C00D00A9C3A16597F7F7F2291E0BD150684C3E1FA9E6B3F3131E1C8BF1400B602F201408B70E4E054D4C6DB3025A2BEADCAE572E4528E4FD301C00E403E0068290E1B8BCC6EF2C16E4EA96393D80D4AF68CE200E03C201F00B41A760F457D9D0276C3A0A55F18E9692B119AD4CC51BFDDD8980CB5F58C2C58F91C5AB47A4D328FE0CF5F6EEBFD485A719BF6A32A2E4546E89EA15900B003900F0038400D5E2412714083178D46E3F1B866924A3174B6A17B2B198201269241B52BEA84641EC1E0D49970E133CA4CC790F9F979124187F58501607F201F0070C301A17E837B5959AB3F192289905F9639866C17726C22A4130A4DC0C2C44D7431156D9CC5A492092C0BD8315D60000804E403009E889EE468413E54D355C6508C6F147D4335B780BC06B3CF55D64C2FDE4DE47A7B7B0B83A9580B7838FBFE6700EC0FE40300FE883B169975F9A009A150991898278894CF358C68CC1EEF79F175BFEA31B38AB398F6D324934941F736008E01F201802D10F4A1A9B1584C3F1897A17CC826507CAB720A6D70A3D4D3622D5B3497CBFDBC6B97B643A7201F8619AA543F1C0E07834141E34C003806C8070036221E8F8B35C295C1D36265C5606D7FC13624D928FCDF402A4CBA57AA2473B4B5BDF6C9D5DEDEDEF881A2A81474A3F8F165FE427B95EADBEAC660005C0BE403007BC1C622ABFB89242DC64C3E589F47F165C12EB4F7C1984945998A28FD27AAE533998CDFEF9F9FBF5C0A7014631D2C7CA2530FDA9F4E1A5E0500D1817C00604744692C0DE44342F2855088F582943CC028F2A1EB1E31A8525A4371A6641EAFBFD8F6DA279AD5175FAA6E9991822A62C91C002E01F201804D616391E947D1B01946F22145350CF32EF429A0E577B8E8AB686BC8F2914EA7FD7E7FE64CB04DCE2C29FC5B4C14915E4A89AD856E9E577A3F22F310A81B0B009700F900C0BEE4F3F968346AE7B1C852A914A9807A8A76D4D2C990721FADBA3384E98252CF280355AEA2EB82993CA0BDE145972EA28A792C1C97D7E879E31DE496026043201F00D81D3616993D3325CBE5A379B098871599607B0C37D302605B201F000800BB47B4BFBFDF6ED7F12D938F9999192BE661FF5811006003F2018040241209BB5DD0B7463EE82B5B318F743A6DFF2C1900C006E40300B16063914522119B8C45363F3F4F3ED4D48F20F308068355BF6F2C1613E2FE2000C006E4030011191B1BE33E16D9AE5DAAA1456568931AFE2956CC8384CCEFF7E3412D000804E403002161C357E887366F21070EA86F3D693B7CF8305942633F62626222100854560AD615954AA51AFBD10080A602F900406038F635DCBA75ABBDBD9D99474747C7DEBD7B1B6B0026C39795B06D122E00A02A900F00C4868D454616D2FA8FEEEEEE66F271E8D0A1C6F6B954350FF6ADED79FB3100A02A900F0084279FCF0F0E0EFAFDFE16DF5F4A6DFF8E1D3B987C8C8D8D356AB5245295CD83BE6C6F6F6F269369D42702005A0CE4030087904AA55A3F1659676727C947575757A3923D8786862A24B2B04C172E611E004003817C00E01C581A4430186C591AC4D1A347493EA2D16843D636246336D70EF7F800001A02E40300A7914C265B3616593E9F6F6F6FAFAFBB8796DAB76F9FE249643066E661B7D14D00009B04F201800361AD75381CB6736B7DF0E0C1B6B636F22416B0311B99942CCAE7F3D96A5C5700C026817C00E0582626266CDB4F4156B473E74E76B38CC7E3397DFAB4619D48248207B500E03C201F003819652C32BB85408E1D3BA61EA38CC53FD415D8CDB40DBC890600601F201F00381F1B3EF7E485175E50CC63CF9E3DE4191E8F47F10FDA60BFDF6FAB0D06003410C80700AE803DF155B949757A7AFAADB7DEDAFC4D31EB26545EEAE2C58B4C3BF6EDDBF7CE3BEFBCF2CA2B1D1D1DEDEDED6FBFFD76369BB567A80600D040201F00B80536161935EDB76EDDDAB56B17B5F7030303B5AE84B9C557326B6B6BB4CE0765D0449AC5EA18BA086D036D404F4F4F5757D7D8D8587F7FBF92FCF1C20B2FD833490500D040201F00B80B6ADA954CCF975F7ED9FA5D248A76905BAC2C2D5F397D26F1C9D0F19FBF39F4C67E56E8EDE593A7320B7756565672B9DCFDFBF79988942BC873CF3DB767CF1EF6D1D7AE5D53277FBCF4D24B900F001C0FE4030077F1E1871FAA1B7BF28FAA9D2F8A7690737CF6565FEF777FF0B7FFC3AFFEF52FFE8F868566BDF1077F4A5232373B9BCD664944C8420C1564430EC628C91F5EAFF7E0C1837BF7EE6DEC636200003604F20180BBE8EEEEFEA77FFA27720ED6E4EFDAB5AB72E70BD30E1288A137F63FF3C86FA825E3F9FFF89FBB7EFBF7033FF821157A416FD5524295A3AFF62CDC9E2F571065E5A150A8BDBDFDF9E79F27E7E8E8E808068363636378680B008E07F20180BBA0A69D1A786AE677EEDCB97BF7EEE79E7B8E5E5CB870C1B032338FD90B93BB7EF3B79852FCDDAFFCDBFDDFDF7AEEAD03B9A9A9B51B377485269E7DF32055502C64E76FFCA70BC39FDDB97387142497CB3D78F040ED1F1E8FE7C5175F8C46A318430C005701F900C0BD50934F0DBFD7EB2505299FCBCCE3F30FA2CC249EFEA5FF29F8DFFEBFCCC4E7E5CE515EA85AE0073FA445588CE4F881776EDFBEBDB4B4B4B2B2A2F30F00800B817C00000C50CC8309C4AEDFFCADD913312BDAA12E33432776FEC67F62E272ECCD03E9743A93C9C03F0000900F00801E661E894F869879BCF1077F6AD8C962A5D082DD8F7F87F9C7F103EFC03F00001B900F00800E25CFE3275FFF264943D76FFFFE836BD7EA330F5668F197BEF56D962F72F6F830FC030000F9000068201BC8E572ACBBA4EDD1FFEDEE850B864A717BF4F450E74B6FFCC19FEEFED6B75909FCE087A7BA7D869569256DDFFC4DB6C24B93937373734B4B4BF429F97C1EF201800B817C00004AB0B0C79197769328FCCD7FF7AF0CF33CC824C833CCC6F9F8C9D7BF495252BE14AD8A564815DEFAC7F6542A75FBF6ED6C367BFFFE7D043F007021900F004009369218EB7079FF6FFFA1DC216E0C0EB1B995CB1B7FF0A7E52193D08FFE8E75BE7C71F62CADE9CE1D692C5436F807EFEF0D006829900F00400116F638FEF33799222C9F4BAC5EB9A22EA98FA256CC8395177EF3B7748BD30AD95DBBEF3EF7E2F4F4743A9D5E5A5A42F003001702F90000142003C8E7F35DBFFDFBE407811FFCF0EE850BBAF24271A8318BE5FDBFFD07CD1ACE5FD8FFFDADD28DBBFFFB6F9F3F7F5E1DFC807C00E02A201F008002ACCF85DD5E7B2E7030333E9E191F93FF1DCF8C8D1D7966674DE6C14AEAA3282D5B58CFD8F8B9B70EB0DB6EC7474F4D4F4FCFCDCD65B35976DB0BEF6F0F00681D900F0040013280CB274FB131496F9F38A12BEA07BB582F811FFC50B71E9676FAC19B814B9393B3B3B34ACF0BEF6F0F00681D900F004081B5B5B593EF0C90193CFF1FFFF3CDE8C752F938CACAA96E5F1DE6C11E2F37F3E187D24A8A2B648F89097ABBD43D2FF4D1BCBF3D00A075403E0000122CE163E88DFDEC5E95ABEFBDA72EEFFFED3FD4271F5474AB6239256FFD63FBB973E752A914D23E007021900F008004B5FD0F1E3C38D6B397CCA0F7BB3FB87CF0A0BA04FEE4CFEB968FCF3C5EF5AAC86C987C9C3D7B767A7AFAF6EDDB6CB453C80700EE01F2010090D0C947F2CD37D56593F2A15E954E3E949C53C80700EE01F201009050CB47F7E3DFD1453ED8F860F515DDAA946E17C80700AE05F201009060F2A1249CEA1235369370AA5B157B6ACCBBCFBD08F900C0B5403E0000124C3E2E0C7FF6D7F2ADB6D22D2AECFE9462A9F356DB3FF9F3C22D33F2AD2EB45AE5565BC80700AE05F201009060F29159B8C306193BD5EDD38DCF51DF206357DF7B4FBD121641A18F183A760C09A700B816C807004082DD6AFBFFB777FFAE6D9C711CC7FF8D40E70C2D0432050C594A0D268BC174CB64F0E0A18696A47872C0B4346D480C0E292443825151824D6813F0A2C1C6898BEA4406B56A25E48082844028A722BB1759C895E5A81FEBAB5ECE27F947BA3470EF1747B0EFEE39677CF3DC7377EA8099A111F5C1DCE8F8D6FAFE3B49FFF2FDFB5DE78EC9C9B7479F4F76DE6DBAFEEFCB52D7EF5E1CD3FE6F0606E3F1388FDA02A1457C00E86AB55AEA80D8CDDB5F743E2CF7E7DAB3C0B75D728F174FFE61B99B9F0C6FA70F0CD705EDC372F726A7141FBC640C082DE20340D7DEDEDECECE8E532AA93C9408F39F5D0E7C96D63E6C3B7D66E0D8F2D89F38F9F5B7C0D8E8D88465CD522C964824B2D92CAF5707C289F800D065F151775F3FBC7A5D9570E9D4E9E2D24AAB580C6CDB99CC114FDE2A4D9E7F7FA777942E654B4DEF4C5C8EC7E3FED5A6C4071036C407802E6FD947E5D52B7B2076FAECF9ED74A6B7242C4156BE9D898E4DDC1A1AB14D45928C3CE87F723A63F325573E3AB7B2BC9C4824FCF75C58F001840DF101A04B0560931FAEEB66D69EDBCD9799A19166A1D037294EB869F8B5C161BBE1B21889DA52D35C2E572E97BD7B2EC407102AC40780B7D401CD66B35EAF57ABD55F167EB4C76E672F7CBA9DE93FFF71ECA681F6F88C2E357F6356E561AB3DBC690FFD39EEB90061437C0078CB9BFCA8D56A954AE5C9FD05EB8FE93303A5A73FBF6B796888BD9ACCCA637575D56EB8E4F3795DDC5BEDC1B4071036C40780036CE547A3D1705DD7711CF587DD7FB974EAF4DCE8F8614B4002DBEBD41F3AD956986AB8BF3C6C9DA92EAE3FC16A0F209C880F0007D8E487DD7CD9DADA2A97CBC927ABD367CFDBC32C5F7EF0E1DD8B63C9C883BF5FBEEC6D0EEDD4219D60EFF3B02993C548D45F1EBAA02EEBDD70213E8010223E0004F5F6C78B8D8D8757AFFBDF30A6BCF8FADCC733432373A3E3DAF4837EF59AC3263CEE4D4EAD2C2FDB83B59407000FF101A08F407F388E5328147E4F26E76FCCAA33EC7E4ADF4D87AE0D0EFF30F5D5522C66CB4B53A954369BD5705D84F200D0263E001CC6DF1FAEEB562A9562B198CBE5D2E9F4FADAB3A5FB0B3FDDBAADC8F036FDBA1889DA54874EB0ECB0090F0DD4705D84F200D0263E001CC1EB8F46A351ABD5AAD5AAE33896202F36361416A98EA48FEDD1219D60D9A1211AA8E1BA08E501A04D7C00389AF5C7EEEEEEFE9BD7EB752F414AA592C2A25028E4F3F99C8F7ED54E1DD209961D36E1A1E1BA08E501A04D7C0038D69B8E40822829363737D516950EA7C37ED64E1DD2093A2D901D94078036F101E084FC09D26C36AD424CCDC7DBA913741AD901A017F101E01D780922AD56CB4224403B75C8CE213B00F4223E00FC776F0EF17FFFBF00BCD7FE017A7541FCDE5E30C40000000049454E44AE426082, '1', 'leave.png');

-- ----------------------------
-- Table structure for jbpm4_participation
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_participation`;
CREATE TABLE `jbpm4_participation` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `GROUPID_` varchar(255) DEFAULT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_PART_TASK` (`TASK_`) USING BTREE,
  KEY `FK_PART_SWIMLANE` (`SWIMLANE_`) USING BTREE,
  KEY `FK_PART_TASK` (`TASK_`) USING BTREE,
  CONSTRAINT `jbpm4_participation_ibfk_1` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm4_swimlane` (`DBID_`),
  CONSTRAINT `jbpm4_participation_ibfk_2` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_participation
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_property
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_property`;
CREATE TABLE `jbpm4_property` (
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_property
-- ----------------------------
INSERT INTO `jbpm4_property` VALUES ('next.dbid', '1', '10001');

-- ----------------------------
-- Table structure for jbpm4_swimlane
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_swimlane`;
CREATE TABLE `jbpm4_swimlane` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_SWIMLANE_EXEC` (`EXECUTION_`) USING BTREE,
  KEY `FK_SWIMLANE_EXEC` (`EXECUTION_`) USING BTREE,
  CONSTRAINT `jbpm4_swimlane_ibfk_1` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_swimlane
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_task
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_task`;
CREATE TABLE `jbpm4_task` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCR_` longtext,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `FORM_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PROGRESS_` int(11) DEFAULT NULL,
  `SIGNALLING_` bit(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `SUPERTASK_` bigint(20) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `PROCINST_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKDEFNAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_TASK_SUPERTASK` (`SUPERTASK_`) USING BTREE,
  KEY `FK_TASK_SWIML` (`SWIMLANE_`) USING BTREE,
  KEY `FK_TASK_SUPERTASK` (`SUPERTASK_`) USING BTREE,
  CONSTRAINT `jbpm4_task_ibfk_1` FOREIGN KEY (`SUPERTASK_`) REFERENCES `jbpm4_task` (`DBID_`),
  CONSTRAINT `jbpm4_task_ibfk_2` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm4_swimlane` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_task
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_variable
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_variable`;
CREATE TABLE `jbpm4_variable` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CONVERTER_` varchar(255) DEFAULT NULL,
  `HIST_` bit(1) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `LOB_` bigint(20) DEFAULT NULL,
  `DATE_VALUE_` datetime DEFAULT NULL,
  `DOUBLE_VALUE_` double DEFAULT NULL,
  `CLASSNAME_` varchar(255) DEFAULT NULL,
  `LONG_VALUE_` bigint(20) DEFAULT NULL,
  `STRING_VALUE_` varchar(255) DEFAULT NULL,
  `TEXT_VALUE_` longtext,
  `EXESYS_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_VAR_EXESYS` (`EXESYS_`) USING BTREE,
  KEY `IDX_VAR_TASK` (`TASK_`) USING BTREE,
  KEY `IDX_VAR_EXECUTION` (`EXECUTION_`) USING BTREE,
  KEY `IDX_VAR_LOB` (`LOB_`) USING BTREE,
  KEY `FK_VAR_LOB` (`LOB_`) USING BTREE,
  KEY `FK_VAR_EXECUTION` (`EXECUTION_`) USING BTREE,
  KEY `FK_VAR_EXESYS` (`EXESYS_`) USING BTREE,
  KEY `FK_VAR_TASK` (`TASK_`) USING BTREE,
  CONSTRAINT `jbpm4_variable_ibfk_1` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `jbpm4_variable_ibfk_2` FOREIGN KEY (`EXESYS_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `jbpm4_variable_ibfk_3` FOREIGN KEY (`LOB_`) REFERENCES `jbpm4_lob` (`DBID_`),
  CONSTRAINT `jbpm4_variable_ibfk_4` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_variable
-- ----------------------------

-- ----------------------------
-- Table structure for lawyer_online
-- ----------------------------
DROP TABLE IF EXISTS `lawyer_online`;
CREATE TABLE `lawyer_online` (
  `ID` varchar(32) NOT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `QUESTION_AREA` varchar(20) DEFAULT NULL,
  `QUESTION_CONTEXT` longtext,
  `QUESTION_TITLE` varchar(200) DEFAULT NULL,
  `QUESTION_TYPE` varchar(20) DEFAULT NULL,
  `QUESTIONER_PHONE` varchar(20) DEFAULT NULL,
  `REPLY_TIME` varchar(32) DEFAULT NULL,
  `REPLY_USER_ID` varchar(32) DEFAULT NULL,
  `REPLY_USER_NAME` varchar(100) DEFAULT NULL,
  `STATUS` varchar(2) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `REPLY_CONTEXT` longtext,
  `TYPE` varchar(2) DEFAULT NULL,
  `REPLY_WAY` varchar(10) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lawyer_online
-- ----------------------------
INSERT INTO `lawyer_online` VALUES ('8ae99b51512f5c8501514265f283001c', '2015-11-26 14:05:56', null, '顶顶顶', '我有一个问题', null, '1333333333', null, null, null, '0', '8ae99b51512f5c85015142642823001b', null, '1', null, null);

-- ----------------------------
-- Table structure for ls_history
-- ----------------------------
DROP TABLE IF EXISTS `ls_history`;
CREATE TABLE `ls_history` (
  `ID` varchar(32) NOT NULL,
  `CREATE_TIME` varchar(32) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_USER_NAME` varchar(50) DEFAULT NULL,
  `LAXX_ID` varchar(32) DEFAULT NULL,
  `LAXX_STATUS` varchar(2) DEFAULT NULL,
  `OPINION` varchar(10) DEFAULT NULL,
  `REMARK` longtext,
  `STATUS` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ls_history
-- ----------------------------
INSERT INTO `ls_history` VALUES ('4028813c5234d1e1015234e8a72d0004', '2016-01-12 16:16:48', '4028813c5234d1e1015234dcbc650002', 'Mr.Cai', '4028813c5234d1e1015234e8a6e20003', '0', '立案申请', null, null);
INSERT INTO `ls_history` VALUES ('4028813c5234d1e1015234ee46f90007', '2016-01-12 16:22:57', '4028813c5234d1e1015234dcbc650002', 'Mr.Cai', '4028813c5234d1e1015234ee46770006', '0', '立案申请', null, null);
INSERT INTO `ls_history` VALUES ('4028813c5238b93d015238bae27f0002', '2016-01-13 10:05:17', '4028813c5238b93d015238ba8e510000', '123456', '4028813c5238b93d015238bae23c0001', '0', '立案申请', null, null);
INSERT INTO `ls_history` VALUES ('4028813c523e21e101523e23f75f0002', '2016-01-14 11:18:10', '4028813c523e21e101523e2346bb0000', '北京易云华控研发部门', '4028813c523e21e101523e23f72c0001', '0', '立案申请', null, null);
INSERT INTO `ls_history` VALUES ('4028813c523e21e101523e2645800006', '2016-01-14 11:20:41', '4028813c523e21e101523e2346bb0000', '北京易云华控研发部门', '4028813c523e21e101523e2645050005', '0', '立案申请', null, null);
INSERT INTO `ls_history` VALUES ('4028813c523e2e2601523e2ea6c90001', '2016-01-14 11:29:50', '4028813c523e21e101523e2346bb0000', '北京易云华控研发部门', '4028813c523e2e2601523e2ea67a0000', '0', '立案申请', null, null);
INSERT INTO `ls_history` VALUES ('4028813c523e2e2601523e30b12c0005', '2016-01-14 11:32:04', '4028813c523e21e101523e2346bb0000', '北京易云华控研发部门', '4028813c523e2e2601523e30b0af0004', '0', '立案申请', null, null);
INSERT INTO `ls_history` VALUES ('4028813c523e2e2601523e37402e000a', '2016-01-14 11:39:14', '4028813c5238b93d015238ba8e510000', '123456', '4028813c523e2e2601523e30b0af0004', '1', '审核通过', '内部纠纷建议内部预先处理', null);
INSERT INTO `ls_history` VALUES ('4028813c523e2e2601523e38980a000c', '2016-01-14 11:40:42', '4028813c523e21e101523e2346bb0000', '北京易云华控研发部门', '4028813c523e2e2601523e30b0af0004', '3', '已预约来院时间', '', null);
INSERT INTO `ls_history` VALUES ('4028813c523e2e2601523e39bbe0000e', '2016-01-14 11:41:57', '4028813c523e21e101523e2346bb0000', '北京易云华控研发部门', '4028813c523e2e2601523e39bb58000d', '0', '立案申请', null, null);
INSERT INTO `ls_history` VALUES ('4028813c523e2e2601523e3b89830011', '2016-01-14 11:43:55', '4028e3484d9a91fa014d9aa14cec0080', '超级管理员', '4028813c523e2e2601523e39bb58000d', '1', '审核通过', '可以考虑通过', null);
INSERT INTO `ls_history` VALUES ('4028813c523e2e2601523e3c04040012', '2016-01-14 11:44:26', '4028813c523e21e101523e2346bb0000', '北京易云华控研发部门', '4028813c523e2e2601523e39bb58000d', '3', '已预约来院时间', '', null);
INSERT INTO `ls_history` VALUES ('4028813c523e2e2601523e42496f0013', '2016-01-14 11:51:17', '4028813c523e21e101523e2346bb0000', '北京易云华控研发部门', '4028813c523e2e2601523e39bb58000d', '3', '已预约来院时间', '', null);
INSERT INTO `ls_history` VALUES ('4028813c523e2e2601523e451fb60015', '2016-01-14 11:54:23', '4028813c523e21e101523e2346bb0000', '北京易云华控研发部门', '4028813c523e2e2601523e451f350014', '0', '立案申请', null, null);
INSERT INTO `ls_history` VALUES ('4028813c523e2e2601523e45ae2d0018', '2016-01-14 11:55:00', '4028e3484d9a91fa014d9aa14cec0080', '超级管理员', '4028813c523e2e2601523e451f350014', '1', '审核通过', '2', null);
INSERT INTO `ls_history` VALUES ('4028813c523e2e2601523e45db6b0019', '2016-01-14 11:55:11', '4028813c523e21e101523e2346bb0000', '北京易云华控研发部门', '4028813c523e2e2601523e451f350014', '3', '已预约来院时间', '', null);
INSERT INTO `ls_history` VALUES ('4028813c523e2e2601523e46eb0d001b', '2016-01-14 11:56:21', '4028813c523e21e101523e2346bb0000', '北京易云华控研发部门', '4028813c523e2e2601523e46eae1001a', '0', '立案申请', null, null);
INSERT INTO `ls_history` VALUES ('4028813c523e2e2601523e476381001e', '2016-01-14 11:56:51', '4028e3484d9a91fa014d9aa14cec0080', '超级管理员', '4028813c523e2e2601523e46eae1001a', '1', '审核通过', '3', null);
INSERT INTO `ls_history` VALUES ('4028813c523e2e2601523e478e1f001f', '2016-01-14 11:57:02', '4028813c523e21e101523e2346bb0000', '北京易云华控研发部门', '4028813c523e2e2601523e46eae1001a', '3', '已预约来院时间', '', null);
INSERT INTO `ls_history` VALUES ('4028813c52430f3b0152436901c50000', '2016-01-15 11:51:41', '4028e3484d9a91fa014d9aa14cec0080', '超级管理员', '4028813c523e2e2601523e30b0af0004', '3', '已预约来院时间', '来吧。同意', null);

-- ----------------------------
-- Table structure for ls_laxx
-- ----------------------------
DROP TABLE IF EXISTS `ls_laxx`;
CREATE TABLE `ls_laxx` (
  `ID` varchar(32) NOT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `AJLX` varchar(2) DEFAULT NULL,
  `SDZL` varchar(2) DEFAULT NULL,
  `SQSLFY` varchar(20) DEFAULT NULL,
  `SSQQ` longtext,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `STATE` varchar(10) DEFAULT NULL,
  `YY` varchar(1) DEFAULT NULL,
  `YYRQ` varchar(20) DEFAULT NULL,
  `HANDLE_TIME` varchar(20) DEFAULT NULL,
  `HANDLE_USERID` varchar(32) DEFAULT NULL,
  `SH_RESULT` varchar(2) DEFAULT NULL,
  `DQJD` varchar(2) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ls_laxx
-- ----------------------------
INSERT INTO `ls_laxx` VALUES ('4028813c523e2e2601523e30b0af0004', '2016-01-14 11:32:48', '1', '0', '440300', '绩效考核奖金没有任何理由频繁变动', '4028813c523e21e101523e2346bb0000', '3', null, '2016-01-21', '2016-01-14 11:39:14', '4028813c5238b93d015238ba8e510000', '1', '4', 'zzfy');
INSERT INTO `ls_laxx` VALUES ('4028813c523e2e2601523e39bb58000d', '2016-01-14 11:42:12', '1', '0', '440300', '1', '4028813c523e21e101523e2346bb0000', '1', null, null, '2016-01-14 11:43:55', '4028e3484d9a91fa014d9aa14cec0080', '1', '3', 'zzfy');
INSERT INTO `ls_laxx` VALUES ('4028813c523e2e2601523e451f350014', '2016-01-14 11:54:40', '1', '0', '440300', '2', '4028813c523e21e101523e2346bb0000', '3', null, '2016-01-26', '2016-01-14 11:54:59', '4028e3484d9a91fa014d9aa14cec0080', '1', '4', 'zzfy');
INSERT INTO `ls_laxx` VALUES ('4028813c523e2e2601523e46eae1001a', '2016-01-14 11:56:40', '1', '0', '440300', '3', '4028813c523e21e101523e2346bb0000', '3', null, '2016-01-18', '2016-01-14 11:56:51', '4028e3484d9a91fa014d9aa14cec0080', '1', '4', 'zzfy');

-- ----------------------------
-- Table structure for ls_xf
-- ----------------------------
DROP TABLE IF EXISTS `ls_xf`;
CREATE TABLE `ls_xf` (
  `ID` varchar(32) NOT NULL,
  `AH` varchar(255) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `SJHM` varchar(20) DEFAULT NULL,
  `YAGX` varchar(255) DEFAULT NULL,
  `YJDZ` varchar(255) DEFAULT NULL,
  `ZJHM` varchar(50) DEFAULT NULL,
  `ZXNR` varchar(255) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `REPLY_TIME` varchar(20) DEFAULT NULL,
  `REPLY_USERID` varchar(32) DEFAULT NULL,
  `REPLY_WAY` varchar(10) DEFAULT NULL,
  `REPLY_CONTENT` varchar(255) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ls_xf
-- ----------------------------

-- ----------------------------
-- Table structure for ls_yast
-- ----------------------------
DROP TABLE IF EXISTS `ls_yast`;
CREATE TABLE `ls_yast` (
  `ID` varchar(32) NOT NULL,
  `CSRQ` varchar(20) DEFAULT NULL,
  `FR` varchar(20) DEFAULT NULL,
  `GJ` varchar(40) DEFAULT NULL,
  `HJSZD` varchar(255) DEFAULT NULL,
  `LXDH` varchar(20) DEFAULT NULL,
  `LXDZ` varchar(255) DEFAULT NULL,
  `MZ` varchar(20) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `SEX` varchar(10) DEFAULT NULL,
  `SFZ` varchar(18) DEFAULT NULL,
  `SJHM` varchar(15) DEFAULT NULL,
  `SSDW` varchar(1) DEFAULT NULL,
  `TYPE` varchar(1) DEFAULT NULL,
  `WHCD` varchar(20) DEFAULT NULL,
  `YZBM` varchar(10) DEFAULT NULL,
  `LAXX_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`) USING BTREE,
  KEY `FK475FFF21B1A5DF9B` (`LAXX_ID`) USING BTREE,
  CONSTRAINT `ls_yast_ibfk_1` FOREIGN KEY (`LAXX_ID`) REFERENCES `ls_laxx` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ls_yast
-- ----------------------------
INSERT INTO `ls_yast` VALUES ('4028813c523e2e2601523e30b15f0006', null, '北京易云华控技术有限公司', null, null, '15315890371', '北京易云华控技术有限公司', null, '北京易云华控技术有限公司研发部', null, null, '15315890371', '0', '2', null, '010000', '4028813c523e2e2601523e30b0af0004');
INSERT INTO `ls_yast` VALUES ('4028813c523e2e2601523e30f9fd0007', null, '柳畅', null, null, '15315890371', '北京易云华控技术有限公司', null, '北京易云华控技术有限公司', null, null, '15315890371', '1', '2', null, '010000', '4028813c523e2e2601523e30b0af0004');
INSERT INTO `ls_yast` VALUES ('4028813c523e2e2601523e39bc22000f', null, '1', null, null, '1', '1', null, '1', null, null, '11111111111', '0', '2', null, '1', '4028813c523e2e2601523e39bb58000d');
INSERT INTO `ls_yast` VALUES ('4028813c523e2e2601523e39e6cf0010', null, '1', null, null, '1', '1', null, '1', null, null, '11111111111', '1', '2', null, '1', '4028813c523e2e2601523e39bb58000d');
INSERT INTO `ls_yast` VALUES ('4028813c523e2e2601523e451fe10016', null, '2', null, null, '2', '2', null, '2', null, null, '11111111111', '0', '2', null, '2', '4028813c523e2e2601523e451f350014');
INSERT INTO `ls_yast` VALUES ('4028813c523e2e2601523e454bdf0017', null, '2', null, null, '2', '2', null, '2', null, null, '11111111111', '1', '2', null, '2', '4028813c523e2e2601523e451f350014');
INSERT INTO `ls_yast` VALUES ('4028813c523e2e2601523e46eb31001c', null, '3', null, null, '3', '3', null, '3', null, null, '11111111111', '0', '2', null, '3', '4028813c523e2e2601523e46eae1001a');
INSERT INTO `ls_yast` VALUES ('4028813c523e2e2601523e472175001d', null, '3', null, null, '3', '3', null, '3', null, null, '11111111111', '1', '2', null, '3', '4028813c523e2e2601523e46eae1001a');

-- ----------------------------
-- Table structure for oa_article
-- ----------------------------
DROP TABLE IF EXISTS `oa_article`;
CREATE TABLE `oa_article` (
  `ID` varchar(32) NOT NULL,
  `CATEGORY_VALUE` varchar(32) DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `EN_TITLE` varchar(100) DEFAULT NULL,
  `CONTENT` text,
  `SHORT_TITLE` varchar(100) DEFAULT NULL,
  `TITLE_COLOR` char(10) DEFAULT NULL,
  `TITLE_IMG` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(256) DEFAULT NULL,
  `CONTENT_IMG` varchar(100) DEFAULT NULL,
  `TAGS` varchar(256) DEFAULT NULL,
  `AUTHOR` varchar(100) DEFAULT NULL,
  `ORIGIN` varchar(100) DEFAULT NULL,
  `SORT_DATE` varchar(24) DEFAULT NULL,
  `RELEASE_DATE` varchar(24) DEFAULT NULL,
  `RELEASE_SYS_DATE` varchar(24) DEFAULT NULL,
  `CHECK_TIME` varchar(24) DEFAULT NULL,
  `DISABLE_TIME` varchar(24) DEFAULT NULL,
  `VISIT_TOTAL` decimal(20,0) DEFAULT NULL,
  `VISIT_TODAY` decimal(20,0) DEFAULT NULL,
  `VISIT_WEEK` decimal(20,0) DEFAULT NULL,
  `VISIT_MONTH` decimal(20,0) DEFAULT NULL,
  `VISIT_QUARTER` decimal(20,0) DEFAULT NULL,
  `VISIT_YEAR` decimal(20,0) DEFAULT NULL,
  `OUTER_URL` varchar(100) DEFAULT NULL,
  `STAT_DATE` varchar(24) DEFAULT NULL,
  `CONTENT_RES_PATH` varchar(200) DEFAULT NULL,
  `PAGE_COUNT` int(11) DEFAULT NULL,
  `TPL_CONTENT` varchar(100) DEFAULT NULL,
  `CHECK_STEP` int(11) DEFAULT NULL,
  `TOP_LEVEL` char(1) DEFAULT NULL,
  `COMMENT_COUNT` int(11) DEFAULT NULL,
  `CHECK_OPINION` varchar(256) DEFAULT NULL,
  `RELATED_IDS` varchar(256) DEFAULT NULL,
  `IS_HAS_TITLEIMG` char(1) DEFAULT '0' COMMENT '0û1УĬ0',
  `IS_ALLOW_COMMENT` char(1) DEFAULT '1' COMMENT '01Ĭ1',
  `IS_BOLD` char(1) DEFAULT '0' COMMENT '01ǣĬ0',
  `IS_DRAFT` char(1) DEFAULT '1' COMMENT '01Ĭ1',
  `IS_RECOMMEND` char(1) DEFAULT '0' COMMENT '01ǣĬ0',
  `IS_CHECK` char(1) DEFAULT '0' COMMENT '01Ĭ0',
  `IS_DISABLED` char(1) DEFAULT '1' COMMENT '0ֹͣʹ1ʹãĬ1',
  `IS_REJECT` char(1) DEFAULT '0' COMMENT '01ǣĬ0',
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL COMMENT 'ʱ',
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_article
-- ----------------------------
INSERT INTO `oa_article` VALUES ('8ae99b515110bfee01511345c1c10012', 'gonggao', 'nnnn', 'nnn', '', null, '', null, '', null, null, null, '', null, '2015-11-17 10:28:37', null, null, null, '0', '0', '0', '0', '4', '0', '/gonggao/2015-11-17/8ae99b515110bfee01511345c1c10012_1.html', null, null, '0', null, '0', null, '0', null, null, null, null, null, 'N', null, null, null, null, '4028e3484d9a91fa014d9aa14cec0080', '2015-11-17 10:28:37', null);

-- ----------------------------
-- Table structure for oa_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `oa_article_comment`;
CREATE TABLE `oa_article_comment` (
  `ID` varchar(32) NOT NULL,
  `ARTICLE_ID` varchar(32) DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `COMMENT` varchar(512) DEFAULT NULL,
  `IP` varchar(20) DEFAULT NULL,
  `IS_CHECK` varchar(2) DEFAULT NULL,
  `IS_RECOMMEND` varchar(2) DEFAULT NULL,
  `IS_DISABLED` varchar(2) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_oa_art_comm` (`ARTICLE_ID`) USING BTREE,
  CONSTRAINT `oa_article_comment_ibfk_1` FOREIGN KEY (`ARTICLE_ID`) REFERENCES `oa_article` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_article_comment
-- ----------------------------

-- ----------------------------
-- Table structure for oa_article_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `oa_article_comment_replay`;
CREATE TABLE `oa_article_comment_replay` (
  `ID` varchar(32) NOT NULL,
  `COMMENT_ID` varchar(32) DEFAULT NULL,
  `REPLAY` varchar(512) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `STATE` varchar(2) DEFAULT NULL,
  `REMARK` varchar(256) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_oa_rep_comm` (`COMMENT_ID`) USING BTREE,
  CONSTRAINT `oa_article_comment_replay_ibfk_1` FOREIGN KEY (`COMMENT_ID`) REFERENCES `oa_article_comment` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_article_comment_replay
-- ----------------------------

-- ----------------------------
-- Table structure for oa_intenal_message
-- ----------------------------
DROP TABLE IF EXISTS `oa_intenal_message`;
CREATE TABLE `oa_intenal_message` (
  `ID` varchar(32) NOT NULL,
  `SENDER_ID` varchar(32) DEFAULT NULL,
  `RECEIVER_ID` varchar(32) DEFAULT NULL,
  `MSG_TITLE` varchar(256) DEFAULT NULL COMMENT '息信标题',
  `MSG_CONTENT` longtext,
  `SEND_TIME` varchar(20) DEFAULT NULL,
  `READ_TIME` varchar(20) DEFAULT NULL,
  `IS_READ` char(1) DEFAULT '0' COMMENT '0δĶ1ĶĬ0',
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL COMMENT 'ʱ',
  `IS_DELETE` char(1) DEFAULT '1' COMMENT '0ɾ1ɾĬ1',
  `REMARK` varchar(256) DEFAULT NULL COMMENT 'עϢ',
  `STATE` char(1) DEFAULT '1' COMMENT '״̬,01Ĭ1',
  `UPLOAD_FILE_INFO` varchar(1000) DEFAULT NULL COMMENT '附件',
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_READ_MSG_REL` (`RECEIVER_ID`) USING BTREE,
  KEY `FK_SEND_MESSAGE_REL` (`SENDER_ID`) USING BTREE,
  KEY `FKF937421EF28FD45E` (`RECEIVER_ID`) USING BTREE,
  KEY `FKF937421E26CFC0BF` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKF937421E71CD7658` (`SENDER_ID`) USING BTREE,
  KEY `FKF937421E67225795` (`RECEIVER_ID`) USING BTREE,
  KEY `FKF937421E9B6243F6` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKF937421EE65FF98F` (`SENDER_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_intenal_message
-- ----------------------------
INSERT INTO `oa_intenal_message` VALUES ('402881f14eddb37e014edde1ac2b0003', '8a4583c3379d08e101379d0e3dfe0002', '8a4583c3379d08e101379d0e3dfe0002', '222', '222', '2015-07-30 15:33:51', '2015-07-30 15:34:07', '1', '8a4583c3379d08e101379d0e3dfe0002', '2015-07-30 15:33:51', null, null, '1', null, null);

-- ----------------------------
-- Table structure for oa_message_board
-- ----------------------------
DROP TABLE IF EXISTS `oa_message_board`;
CREATE TABLE `oa_message_board` (
  `ID` varchar(32) NOT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `USER_NAME` varchar(10) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `TELEPHONE` varchar(11) DEFAULT NULL,
  `QQ` varchar(20) DEFAULT NULL,
  `MESSAGE_CONTENT` text,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='԰';

-- ----------------------------
-- Records of oa_message_board
-- ----------------------------
INSERT INTO `oa_message_board` VALUES ('402881f14edc856a014edc9b25530000', '4028e3484d9ab700014d9ad53d800003', 'ly', 'ly', 'ly', '', 'lylylylyl', '2015-07-30');

-- ----------------------------
-- Table structure for oa_project
-- ----------------------------
DROP TABLE IF EXISTS `oa_project`;
CREATE TABLE `oa_project` (
  `ID` varchar(32) NOT NULL,
  `PROJECT_CODE` varchar(50) DEFAULT NULL,
  `PROJECT_NAME` varchar(200) DEFAULT NULL,
  `URGENCY_DEGREE` varchar(10) DEFAULT NULL,
  `PROJECT_DESC` varchar(1000) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_project
-- ----------------------------
INSERT INTO `oa_project` VALUES ('402881e637b18fe90137b191ccfc0002', 'xiangmu-0001', '中国联通综合监控系统', 'A', '中国联通综合监控系统', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-08');
INSERT INTO `oa_project` VALUES ('402882b33bdf57c7013bdf58742f0000', 'xiangmu-0003', '工行私人银行系统', 'A', '这个项目需要好好做....', '8a4583c3379d08e101379d0e3dfe0002', '2012-12-28');
INSERT INTO `oa_project` VALUES ('8a45838a37e9adfc0137e9af61050002', 'xiangmu-0002', '中移动、苹果iphone5合作', 'B', 'wuwuwuw', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-14');

-- ----------------------------
-- Table structure for oa_project_participant
-- ----------------------------
DROP TABLE IF EXISTS `oa_project_participant`;
CREATE TABLE `oa_project_participant` (
  `ID` varchar(32) NOT NULL,
  `SCHEDUAL_ID` varchar(32) DEFAULT NULL,
  `PROJECT_ID` varchar(32) DEFAULT NULL,
  `ROLE_ID` varchar(32) DEFAULT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `IMMEDIATELY` varchar(50) DEFAULT NULL,
  `START_DT` varchar(20) DEFAULT NULL,
  `END_DT` varchar(20) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_proj_parti` (`PROJECT_ID`) USING BTREE,
  KEY `FK_Reference_sch_parti` (`SCHEDUAL_ID`) USING BTREE,
  CONSTRAINT `oa_project_participant_ibfk_1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `oa_project` (`ID`),
  CONSTRAINT `oa_project_participant_ibfk_2` FOREIGN KEY (`SCHEDUAL_ID`) REFERENCES `oa_project_schedule` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_project_participant
-- ----------------------------
INSERT INTO `oa_project_participant` VALUES ('402881f14eddb37e014edde5e5470005', '402881f14eddb37e014edde5e5460004', '8a45838a37e9adfc0137e9af61050002', '4028e3484d9a91fa014d9a9ce0e00000', '4028e3484d9a91fa014d9aa14cec0080', 'ss', null, '2015-07-30', '2015-07-31', '8a4583c3379d08e101379d0e3dfe0002', '2015-07-30 15:38:28');

-- ----------------------------
-- Table structure for oa_project_schedule
-- ----------------------------
DROP TABLE IF EXISTS `oa_project_schedule`;
CREATE TABLE `oa_project_schedule` (
  `ID` varchar(32) NOT NULL,
  `PROJECT_ID` varchar(32) DEFAULT NULL,
  `SCHEDULE_CODE` varchar(20) DEFAULT NULL,
  `START_DT` varchar(20) DEFAULT NULL,
  `END_DT` varchar(20) DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_project_sch` (`PROJECT_ID`) USING BTREE,
  CONSTRAINT `oa_project_schedule_ibfk_1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `oa_project` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_project_schedule
-- ----------------------------
INSERT INTO `oa_project_schedule` VALUES ('402881f14eddb37e014edde5e5460004', '8a45838a37e9adfc0137e9af61050002', 'lixiang', '2015-06-30', '2015-07-30', 'jdms', '8a4583c3379d08e101379d0e3dfe0002', '2015-07-30');

-- ----------------------------
-- Table structure for oa_work_log
-- ----------------------------
DROP TABLE IF EXISTS `oa_work_log`;
CREATE TABLE `oa_work_log` (
  `ID` varchar(32) NOT NULL,
  `PROJECT_ID` varchar(32) DEFAULT NULL,
  `WORK_DATE` varchar(20) DEFAULT NULL,
  `WEEK_DAY` varchar(20) DEFAULT NULL,
  `START_TIME` varchar(20) DEFAULT NULL,
  `END_TIME` varchar(20) DEFAULT NULL,
  `DURING_LONG` double DEFAULT NULL,
  `WORK_TYPE` varchar(20) DEFAULT NULL,
  `WORK_PLACE` varchar(20) DEFAULT NULL,
  `WORK_THEME` varchar(200) DEFAULT NULL,
  `WORK_CONTENT` varchar(1000) DEFAULT NULL,
  `IS_ARCHIVE` varchar(10) DEFAULT NULL,
  `ARCHIVE_TIME` varchar(20) DEFAULT NULL,
  `URGENCY_DEGREE` varchar(10) DEFAULT NULL,
  `IS_DRAFT` varchar(10) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_proj_work` (`PROJECT_ID`) USING BTREE,
  CONSTRAINT `oa_work_log_ibfk_1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `oa_project` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oa_work_log
-- ----------------------------

-- ----------------------------
-- Table structure for query_sql_hql
-- ----------------------------
DROP TABLE IF EXISTS `query_sql_hql`;
CREATE TABLE `query_sql_hql` (
  `ID` varchar(32) NOT NULL,
  `MENU_ID` varchar(32) DEFAULT NULL,
  `QUERY_NAME` varchar(128) DEFAULT NULL,
  `DESCRIPTION` varchar(256) DEFAULT NULL,
  `SQL_HQL` text,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `UPDATE_USER_ID` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` varchar(20) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of query_sql_hql
-- ----------------------------
INSERT INTO `query_sql_hql` VALUES ('402880833bbdec7e013bbdeda1bc0000', 'ff80808128598a2e0128598a43b40001', 'system.findUsers', '按条件查询用户', 'select user from SysUser as user \r\n            <#if _query_roleId??>\r\n	             , SysUserRole as ur \r\n	        </#if> \r\n            where 1=1 \r\n            <#if loginName??>\r\n	            and user.loginName=:loginName\r\n	        </#if> \r\n	        <#if passWord??>\r\n	            and user.passWord=:passWord\r\n	        </#if> \r\n            <#if deptId??>\r\n	            and user.sysDept.id=:deptId \r\n	        </#if> \r\n	        <#if roleId??>\r\n	            and user.id=ur.sysUser.id and ur.sysRole.id=:roleId \r\n	        </#if>\r\n	        <#if userName??>\r\n	            and user.userName like:userName  \r\n	        </#if>\r\n	        <#if userIdList??>\r\n	             and user.id in (:userIdList) \r\n	        </#if>\r\n	        <#--超级管理员，可查看所有的部门，非超级管理员，只可查询本部门和下级部门的用户-->\r\n		    <#if parentDeptLevel??>\r\n		         and user.sysDept.deptLevel like :parentDeptLevel \r\n		    </#if>\r\n	         \r\n	        <#if orderattr??>\r\n	              order by convert_gbk(${orderattr}) ${ordertype}\r\n	        <#else>\r\n	              order by user.createTime desc\r\n	        </#if>', '2012-12-21 22:46:05', '8a4583c3379d08e101379d0e3dfe0002', null, null, null);
INSERT INTO `query_sql_hql` VALUES ('402880833bbdec7e013bbdee34660001', 'ff808081285b574601285baa3c3c0001', 'system.findDepts', '按条件查询部门', 'select dept from SysDept as dept \r\n               where 1=1 \r\n		       <#--有上级部门-->\r\n		       <#if _query_existedParentDept??>\r\n		            and dept.sysDept.id is not null\r\n		       </#if>\r\n		       <#--由上级部门获得所有的直接下级部门-->\r\n		       <#if parentId??>\r\n		             and dept.sysDept.id=:parentId\r\n		       </#if>\r\n		       <#--由部门名称查询部门-->\r\n		       <#if deptName??>\r\n		             and dept.deptName=:deptName\r\n		       </#if>\r\n		       <#--获得所有下级部门，包括直接部门和间接部门-->\r\n		       <#if deptLevel??>\r\n		             and dept.deptLevel like :deptLevel\r\n		       </#if>\r\n		       order by dept.createTime asc', '2012-12-21 22:46:43', '8a4583c3379d08e101379d0e3dfe0002', null, null, null);
INSERT INTO `query_sql_hql` VALUES ('402880833bc6f91f013bc708a4320000', 'ff808081285b574601285baa3c3c0001', 'system.getCountSubDeptNumByParentId', '获得部门层级/根据上级部门获得所有下级直接部门的数量', 'select count(dept.id) from SysDept as dept where dept.sysDept.id=:parentId order by dept.createTime asc', '2012-12-23 17:12:10', '8a4583c3379d08e101379d0e3dfe0002', null, null, null);
INSERT INTO `query_sql_hql` VALUES ('402880833bc6f91f013bc7093a870001', 'ff808081285b574601285baaa9ea0002', 'system.findRoles', '查询角色', ' select role from SysRole as role \r\n		       where 1=1 \r\n		       <#--有上级角色-->\r\n		       <#if _query_existedParentRole??>\r\n		            and role.sysRole.id is not null\r\n		       </#if>\r\n		       <#--由上级角色获得所有的下级角色-->\r\n		       <#if parentId??>\r\n		             and role.sysRole.id=:parentId\r\n		       </#if>\r\n		       <#--由角色名称查询角色-->\r\n		       <#if roleName??>\r\n		             and role.roleName=:roleName\r\n		       </#if>\r\n		       order by role.createTime asc', '2012-12-23 17:12:49', '8a4583c3379d08e101379d0e3dfe0002', null, null, null);
INSERT INTO `query_sql_hql` VALUES ('402880833bc6f91f013bc709dabe0002', 'ff808081285b574601285baaa9ea0002', 'system.getCountSubRoleNumByParentId', '获得角色层级/根据上级角色获得所有下级直接角色的数量', 'select count(role.id) from SysRole as role where role.sysRole.id=:parentId order by role.createTime asc', '2012-12-23 17:13:30', '8a4583c3379d08e101379d0e3dfe0002', null, null, null);
INSERT INTO `query_sql_hql` VALUES ('402880833bc6f91f013bc70a92560003', 'ff808081285988fe0128598943a90001', 'system.findMenus', '按条件查询菜单', ' select menu from SysMenu as menu \r\n          where 1=1 \r\n          <#if parentId??>\r\n              and menu.sysMenu.id=:parentId \r\n          </#if>\r\n          order by menu.createTime asc', '2012-12-23 17:14:17', '8a4583c3379d08e101379d0e3dfe0002', null, null, null);
INSERT INTO `query_sql_hql` VALUES ('402880833bc6f91f013bc70b01e90004', 'ff808081285b574601285baaa9ea0002', 'system.findRoleMenus', '获得角色对应的菜单', 'select rm from SysRoleMenu rm \r\n               where 1=1 \r\n               <#--获得角色对应的菜单-->\r\n               <#if roleId??>\r\n                   and rm.sysRole.id=:roleId\r\n               </#if>\r\n               <#--权限List-->\r\n               <#if authList??>\r\n                    and rm.auth IN (:authList) \r\n               </#if>\r\n               <#--菜单路径-->\r\n               <#if menuPath??>\r\n                    and rm.sysMenu.menuPath=:menuPath \r\n               </#if>', '2012-12-23 17:14:45', '8a4583c3379d08e101379d0e3dfe0002', null, null, null);
INSERT INTO `query_sql_hql` VALUES ('402880833bc6f91f013bc70b67a80005', '8ad5fa3c2a934f6c012a9357951d0002', 'system.findDataDictionarys', '查询数据字典', '  select dd from SysDataDictionary as dd \r\n	          where 1=1 \r\n	          <#if parentId??>\r\n	              and dd.parentDD.id=:parentId\r\n	          </#if>\r\n	          <#if ddValue??>\r\n	              and dd.ddValue =:ddValue\r\n	          </#if>\r\n	          <#if undefined1??>\r\n	               and dd.undefined1=:undefined1 \r\n	          </#if>\r\n	          <#if _query_exceptUndefined1??>\r\n	               and dd.undefined1 is null \r\n	          </#if>\r\n	          order by dd.createTime asc', '2012-12-23 17:15:11', '8a4583c3379d08e101379d0e3dfe0002', null, null, null);
INSERT INTO `query_sql_hql` VALUES ('402880833bc6f91f013bc70baed30006', '8ad5fa3c2a934f6c012a9357951d0002', 'system.findDataDictionarys1', '直接sql查询所有的数据字典 ,不包括根级字典，方式1', 'select id,parent_id parentid,dd_value ddvalue,dd_name ddname,en_dd_name enddname,remark,undefined1 \r\n	          from sys_data_dictionary \r\n	          where parent_id is not null', '2012-12-23 17:15:29', '8a4583c3379d08e101379d0e3dfe0002', null, null, null);
INSERT INTO `query_sql_hql` VALUES ('402880833bc6f91f013bc70bfcb40007', '8ad5fa3c2a934f6c012a9357951d0002', 'system.findDataDictionarys2', '直接sql查询数据字典发方式2', 'select id,parent_id parentid,dd_value ddvalue,dd_name ddname,en_dd_name enddname,remark,undefined1 \r\n	          from sys_data_dictionary \r\n	          where id in (select distinct parent_id from sys_data_dictionary)', '2012-12-23 17:15:49', '8a4583c3379d08e101379d0e3dfe0002', null, null, null);

-- ----------------------------
-- Table structure for sanku_resource
-- ----------------------------
DROP TABLE IF EXISTS `sanku_resource`;
CREATE TABLE `sanku_resource` (
  `ID` varchar(32) NOT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `CATEGORY` varchar(50) DEFAULT NULL,
  `DESCRIPTION` longtext,
  `ENVIRONMENT` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PUBLISH_TIME` varchar(20) DEFAULT NULL,
  `STATE` int(11) NOT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `DOWNLOAD_COUNT` int(11) NOT NULL,
  `VISIT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sanku_resource
-- ----------------------------
INSERT INTO `sanku_resource` VALUES ('4028e3484da59015014da59c7b880001', '2015-05-31 00:16:45', 'category_02', '测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源测试资源', 'Windows', '测试资源', '2015-05-31 00:16:45', '1', 'type_01', '4028e3484d9a91fa014d9aa14cec0080', '6', '25');
INSERT INTO `sanku_resource` VALUES ('4028e3484da80118014da832f0190002', '2015-05-31 12:20:19', 'category_05', '测试资源002测试资源002测试资源002测试资源002测试资源002测试资源002测试资源002测试资源002测试资源002测试资源002测试资源002测试资源002测试资源002测试资源002测试资源002测试资源002', 'Windows', '测试资源002', '2015-05-31 12:20:19', '0', 'type_02', '4028e3484d9a91fa014d9aa14cec0080', '0', '1');

-- ----------------------------
-- Table structure for sanku_resource_download_history
-- ----------------------------
DROP TABLE IF EXISTS `sanku_resource_download_history`;
CREATE TABLE `sanku_resource_download_history` (
  `ID` varchar(32) NOT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `DOWNLOAD_COUNT` int(11) NOT NULL,
  `RESOURCE_ID` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` varchar(255) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sanku_resource_download_history
-- ----------------------------
INSERT INTO `sanku_resource_download_history` VALUES ('4028e3484da80118014da806064f0000', '2015-05-31 11:31:16', '1', '4028e3484da59015014da59c7b880001', '2015-05-31 11:31:16', '8a4583c3379d08e101379d0e3dfe0002');

-- ----------------------------
-- Table structure for sys_access_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_access_log`;
CREATE TABLE `sys_access_log` (
  `ID` varchar(32) NOT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `ACCCESS_IP` varchar(20) DEFAULT NULL,
  `ACCESS_TIME` varchar(20) DEFAULT NULL,
  `ACCESS_TYPE` varchar(20) DEFAULT NULL,
  `ACCESS_METHOD` varchar(200) DEFAULT NULL,
  `OPERATE_ARG` text,
  `ACCESS_DESCRIBE` varchar(50) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_access_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_data_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_dictionary`;
CREATE TABLE `sys_data_dictionary` (
  `ID` varchar(32) NOT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `DD_NAME` varchar(50) DEFAULT NULL,
  `EN_DD_NAME` varchar(50) DEFAULT NULL,
  `DD_VALUE` varchar(50) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `IS_DELETE` char(1) DEFAULT NULL,
  `STATE` char(1) DEFAULT NULL,
  `REMARK` varchar(256) DEFAULT NULL,
  `UNDEFINED1` varchar(50) DEFAULT NULL,
  `UNDEFINED2` varchar(50) DEFAULT NULL,
  `UNDEFINED3` varchar(50) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_dd` (`PARENT_ID`) USING BTREE,
  KEY `FKC848DAB926CFC0BF` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKC848DAB9337E69D8` (`PARENT_ID`) USING BTREE,
  KEY `FKC848DAB99B6243F6` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKC848DAB99E2B944F` (`PARENT_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_data_dictionary
-- ----------------------------
INSERT INTO `sys_data_dictionary` VALUES ('1', null, '参数维护', 'Param Maintain', 'root', null, null, null, null, '参数维护中设置的是系统的常量数据，在系统上线后，这些常量值一般情况不能轻易改变，该功能不开放给客户。', null, 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583a9368576b00136858638e1000c', '1', '审核状态', 'Audit State', 'wfcode', '8ad5a5e52907328801290797707c000d', '2012-04-06 10:40:27', '1', '1', '', 'wf', '', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('ff80808139431277013943153d210002', '1', '流程类型', 'Workflow Category', 'wfCat', '8a4583c3379d08e101379d0e3dfe0002', '2012-08-20 16:10:29', null, null, '', 'wf', '', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('ff8080813943127701394315d0fe0003', 'ff80808139431277013943153d210002', '请假流程', 'leave', 'qingjia', '8a4583c3379d08e101379d0e3dfe0002', '2012-08-20 16:11:06', null, null, '相关参数务必和流程定义文件：leave.jpdl.xml一致。', 'wf', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('ff8080812bb53046012bb53546f30005', '402881e73706c6c2013706c7c2260002', '栏目类型', null, 'channelType', '8ad5a5e52907328801290797707c000d', '2010-10-16 21:23:09', '1', '1', '', 'cms', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('ff8080812bb53046012bb536fa7f0006', 'ff8080812bb53046012bb53546f30005', '文章', null, 'artic', '8ad5a5e52907328801290797707c000d', '2010-10-16 21:25:00', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('ff8080812bb53046012bb5375ca40007', 'ff8080812bb53046012bb53546f30005', '图片', null, 'picture', '8ad5a5e52907328801290797707c000d', '2010-10-16 21:25:25', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e5363aa1f401363aaa44af0002', '402881e73706ba52013706bfabd6000a', '桌面设置', 'Desk Setting', 'zmsz', '8ad5a5e52907328801290797707c000d', '2012-03-22 21:48:18', '1', '1', '', null, null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e5363aa1f401363aaabf220004', '402881e5363aa1f401363aaa44af0002', '留言', 'Leave A Message', 'msgboard', '8ad5a5e52907328801290797707c000d', '2012-03-22 21:48:50', '1', '1', '', null, null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c436f1b1f80136f208ac970017', '402881e73706ba52013706bfabd6000a', '是否', 'Yes Or Not', 'yesornot', '8ad5a5e52907328801290797707c000d', '2012-01-27 12:21:56', '1', '1', '', null, 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c436f1b1f80136f208d5960019', '8a4583c436f1b1f80136f208ac970017', '是', 'Yes', 'Y', '8ad5a5e52907328801290797707c000d', '2012-04-27 12:22:06', '1', '1', '', null, null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c436f1b1f80136f208f26a001b', '8a4583c436f1b1f80136f208ac970017', '否', 'No', 'N', '8ad5a5e52907328801290797707c000d', '2012-04-27 12:22:14', '1', '1', '', null, null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583a9368576b001368586755d000e', '8a4583a9368576b00136858638e1000c', '同意', 'Agree', 'agree', '8ad5a5e52907328801290797707c000d', '2012-04-06 10:40:43', '1', '1', '', 'wf', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583a9368576b001368586a3f10010', '8a4583a9368576b00136858638e1000c', '不同意', 'Disagree', 'disAgree', '8ad5a5e52907328801290797707c000d', '2012-04-06 10:40:55', '1', '1', '', 'wf', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e73706ba52013706bfabd6000a', '1', '系统常量', 'System Constant', 'xitong', '8ad5a5e52907328801290797707c000d', '2012-05-01 11:54:13', '1', '1', '设置系统常量', null, 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e73706c6c2013706c7c2260002', '1', 'cms参数', null, 'cms', '8ad5a5e52907328801290797707c000d', '2012-05-01 13:03:03', '1', '1', '', 'cms', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e73706cbb8013706ccfb5e0002', '402881e73706ba52013706bfabd6000a', '权限设置', 'Auth Setting', 'qxsz', '8ad5a5e52907328801290797707c000d', '2012-05-01 13:08:45', '1', '1', '设置各个角色对各个功能的访问权限', null, null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e73706cbb8013706d075810004', '402881e73706cbb8013706ccfb5e0002', '全部权限', 'All Permissions', 'W', '8ad5a5e52907328801290797707c000d', '2012-05-01 13:12:33', '1', '1', '拥有全部权限', null, null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e73706cbb8013706d45fc40008', '402881e73706cbb8013706ccfb5e0002', '部分权限', 'Only View Permissions', 'R', '8ad5a5e52907328801290797707c000d', '2012-05-01 13:16:50', '1', '1', '对特定功能拥有权限。在jsp中需用权限标签<my:auth/>来控制显示或不显示的部分，如链接、按钮等。', null, null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e73706cbb8013706d5eff9000a', '402881e73706cbb8013706ccfb5e0002', '无访问权限', 'Without Any Permissions', 'N', '8ad5a5e52907328801290797707c000d', '2012-05-01 13:18:32', '1', '1', '一个角色对一个功能设置了该级别权限，该角色对该功能无任何访问权限。', null, null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a1325b0137a13577e40002', '402881e5363aa1f401363aaa44af0002', '新闻中心', 'New Center', 'news', '8ad5a5e52907328801290797707c000d', '2012-05-31 12:44:24', '1', '1', '', null, null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a57ea00137a58fd7e60023', '1', '工作参数', 'Work Param', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 09:01:36', '1', '1', '', 'work', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e63744c329013744cb65e80013', 'ff8080812bb53046012bb53546f30005', '视频', null, 'video', '8ad5a5e52907328801290797707c000d', '2012-05-13 14:03:29', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e63744c329013744cb91f90015', 'ff8080812bb53046012bb53546f30005', '下载', null, 'download', '8ad5a5e52907328801290797707c000d', '2012-05-13 14:03:40', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e63744ecde013744f77fd30002', '402881e73706c6c2013706c7c2260002', '模版类型', null, 'templeteType', '8ad5a5e52907328801290797707c000d', '2012-05-13 14:51:39', '1', '1', '', 'cms', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c437496dce0137496f1bae0002', '402881e63744ecde013744f77fd30002', '首页模板', null, '0', '8ad5a5e52907328801290797707c000d', '2012-05-14 11:40:47', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c437496dce0137496f4fb90004', '402881e63744ecde013744f77fd30002', '首页栏目块模板', '首页栏目块模板', '1', '8ad5a5e52907328801290797707c000d', '2012-05-14 11:41:00', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c437496dce0137496f6e8e0006', '402881e63744ecde013744f77fd30002', '二级页面模板', null, '2', '8ad5a5e52907328801290797707c000d', '2012-05-14 11:41:08', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c437496dce0137496f997f0008', '402881e63744ecde013744f77fd30002', '三级页面模板', null, '3', '8ad5a5e52907328801290797707c000d', '2012-05-14 11:41:19', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c437496dce0137496fbeb2000a', '402881e63744ecde013744f77fd30002', '公共页模板', null, '4', '8ad5a5e52907328801290797707c000d', '2012-05-14 11:41:29', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e6376829180137682c65660002', '402881e73706c6c2013706c7c2260002', '日志分类', null, 'rzfl', '8ad5a5e52907328801290797707c000d', '2012-05-20 10:56:08', '1', '1', '', 'cms', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e6376829180137682c95210003', '402881e6376829180137682c65660002', '我的日志', null, 'wdrz', '8ad5a5e52907328801290797707c000d', '2012-05-20 10:56:21', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e6376829180137682cc45f0004', '402881e6376829180137682c65660002', '私密日志', null, 'smrz', '8ad5a5e52907328801290797707c000d', '2012-05-20 10:56:33', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e6376829180137682cfe7a0005', '402881e6376829180137682c65660002', '生活记录', null, 'shjl', '8ad5a5e52907328801290797707c000d', '2012-05-20 10:56:48', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e6376829180137682d21150006', '402881e6376829180137682c65660002', '记事本', null, 'jsb', '8ad5a5e52907328801290797707c000d', '2012-05-20 10:56:56', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e6376829180137682e8a790007', '402881e73706c6c2013706c7c2260002', '音乐盒', null, 'yyh', '8ad5a5e52907328801290797707c000d', '2012-05-20 10:58:29', '1', '1', '', 'cms', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e6376829180137682ec6a70008', '402881e6376829180137682e8a790007', '背景音乐', null, 'bjyy', '8ad5a5e52907328801290797707c000d', '2012-05-20 10:58:44', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e6376829180137682efaa70009', '402881e6376829180137682e8a790007', '我的音乐', null, 'wdyy', '8ad5a5e52907328801290797707c000d', '2012-05-20 10:58:58', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e6376829180137682f2726000a', '402881e6376829180137682e8a790007', '好友音乐', null, 'hyyy', '8ad5a5e52907328801290797707c000d', '2012-05-20 10:59:09', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e6376829180137682fa937000b', '402881e6376829180137682e8a790007', '音乐库', null, 'yyk', '8ad5a5e52907328801290797707c000d', '2012-05-20 10:59:42', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e6376830e201376832dd390002', '402881e73706c6c2013706c7c2260002', '相册分类', null, 'xcfl', '8ad5a5e52907328801290797707c000d', '2012-05-20 11:03:12', '1', '1', '', 'cms', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e6376830e20137683310bc0003', '402881e6376830e201376832dd390002', '我的相册', null, 'wdxc', '8ad5a5e52907328801290797707c000d', '2012-05-20 11:03:26', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e6376830e20137683364e70004', '402881e6376830e201376832dd390002', '田园风光', null, 'tyfg', '8ad5a5e52907328801290797707c000d', '2012-05-20 11:03:47', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e6376830e201376833f7340005', '402881e6376830e201376832dd390002', '乡村小镇', null, 'xcxz', '8ad5a5e52907328801290797707c000d', '2012-05-20 11:04:25', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e6376830e20137683428270006', '402881e6376830e201376832dd390002', '香车美女', null, 'xcmn', '8ad5a5e52907328801290797707c000d', '2012-05-20 11:04:37', '1', '1', '', 'cms', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a1325b0137a135f5850003', '402881e5363aa1f401363aaa44af0002', '公司公告', 'Company Announcements', 'gonggao', '8ad5a5e52907328801290797707c000d', '2012-05-31 12:44:57', '1', '1', '', null, null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a1325b0137a1371e740004', '402881e5363aa1f401363aaa44af0002', '培训学习', 'Training And Learning', 'peixun', '8ad5a5e52907328801290797707c000d', '2012-05-31 12:46:13', '1', '1', '', null, null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a1325b0137a1378eac0005', '402881e5363aa1f401363aaa44af0002', '员工活动', 'Staff Activities', 'huodong', '8ad5a5e52907328801290797707c000d', '2012-05-31 12:46:41', '1', '1', '', null, null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a1325b0137a138d7ab0006', '402881e5363aa1f401363aaa44af0002', '建言献策', 'Offer Advice And Suggestions', 'xiance', '8ad5a5e52907328801290797707c000d', '2012-05-31 12:48:06', '1', '1', '', null, null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a592980137a593d7640002', '8a4583c337a57ea00137a58fd7e60023', '工作地点', 'Work Place', 'workplace', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 09:05:58', '1', '1', '', 'work', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a592980137a5942e310003', '8a4583c337a592980137a593d7640002', '公司', 'Company', 'gongsi', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 09:06:20', '1', '1', '', 'work', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a592980137a59467cf0004', '8a4583c337a592980137a593d7640002', '客户现场', 'Client Spot', 'xianchang', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 09:06:35', '1', '1', '', 'work', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a592980137a594b2d80005', '8a4583c337a57ea00137a58fd7e60023', '工作类型', 'Work Type', 'worktype', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 09:06:54', '1', '1', '', 'work', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a592980137a595036b0006', '8a4583c337a592980137a594b2d80005', '日常工作', 'Day-to-day', 'richang', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 09:07:15', '1', '1', '', 'work', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a592980137a59538740007', '8a4583c337a592980137a594b2d80005', '售前工作', 'Sell Before', 'shouqian', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 09:07:28', '1', '1', '', 'work', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a592980137a5955c8c0008', '8a4583c337a592980137a594b2d80005', '实施工作', 'Put Into Effect', 'shishi', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 09:07:38', '1', '1', '', 'work', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a592980137a595a0b10009', '8a4583c337a592980137a594b2d80005', '开发工作', 'Development', 'kaifa', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 09:07:55', '1', '1', '', 'work', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a592980137a595d1e8000a', '8a4583c337a592980137a594b2d80005', '测试工作', 'Test', 'ceshi', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 09:08:08', '1', '1', '', 'work', null, null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a5d7a70137a5e7943d0002', '8a4583c337a57ea00137a58fd7e60023', '项目阶段', 'Project Stage', 'jieduan', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 10:37:26', '1', '1', '', 'work', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a5d7a70137a5e98da50004', '8a4583c337a5d7a70137a5e7943d0002', '立项阶段', 'Approval', 'lixiang', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 10:39:35', '1', '1', '', 'work', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a5d7a70137a5ea1a510005', '8a4583c337a5d7a70137a5e7943d0002', '调研阶段', 'Survey', 'diaoyan', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 10:40:11', '1', '1', '', 'work', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a5d7a70137a5ea53770006', '8a4583c337a5d7a70137a5e7943d0002', '开发阶段', 'Development', 'kaifa', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 10:40:26', '1', '1', '', 'work', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('8a4583c337a5d7a70137a5eab2ab0007', '8a4583c337a5d7a70137a5e7943d0002', '维护阶段', 'Maintain', 'weihu', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 10:40:50', '1', '1', '', 'work', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e537a85d9c0137a881e2f90003', '8a4583c337a57ea00137a58fd7e60023', '项目重要程度', 'Project Important', 'projectimportant', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 22:45:13', '1', '1', '', 'work', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e537a85d9c0137a8824cdf0004', '402881e537a85d9c0137a881e2f90003', '非常重要', 'Very Important', 'A', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 22:45:40', '1', '1', '', 'work', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e537a85d9c0137a88277f60005', '402881e537a85d9c0137a881e2f90003', '重要', 'Important', 'B', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 22:45:51', '1', '1', '', 'work', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e537a85d9c0137a8829ded0006', '402881e537a85d9c0137a881e2f90003', '一般', 'A Little Important', 'C', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 22:46:01', '1', '1', '', 'work', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e537a85d9c0137a882c51c0007', '402881e537a85d9c0137a881e2f90003', '不重要', 'Not Important', 'D', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 22:46:11', '1', '1', '', 'work', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881eb384201ab013842029e630002', '402881eb3841fb81013841feb84d0002', '年假', 'Year Leave', 'year', '8a4583c3379d08e101379d0e3dfe0002', '2012-07-01 18:07:44', null, null, '入职满一年方可休年假（如有疑问可咨询人力资源或部门秘书）。', 'wf', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('ff8080813827ec650138280283920061', '1', '信息分类', 'Info Category', 'oaarticle', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-26 16:57:29', '1', '1', '', 'oaarticle', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('ff8080813828059c0138280708150002', 'ff8080813827ec650138280283920061', '新闻中心', 'New Center', 'news', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-26 17:02:25', '1', '1', '', 'oaarticle', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('ff8080813828059c013828073d030003', 'ff8080813827ec650138280283920061', '法院内部公告', 'Court Announcements', 'gonggao', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-26 17:02:39', '1', '1', '', 'oaarticle', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('ff8080813828059c01382807b25f0004', 'ff8080813827ec650138280283920061', '培训学习', 'Training And Learning', 'peixun', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-26 17:03:09', '1', '1', '', 'oaarticle', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('ff80808138280a0d0138280d5a2f0002', 'ff8080813827ec650138280283920061', '员工活动', 'Staff Activities', 'huodong', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-26 17:09:20', '1', '1', '', 'oaarticle', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('ff80808138280a0d0138280dcc7d0003', 'ff8080813827ec650138280283920061', '建言献策', 'Offer Advice And Suggestions', 'xiance', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-26 17:09:49', '1', '1', '', 'oaarticle', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881eb3841fb81013841feb84d0002', '1', '请假类型', 'Leave Type', 'leave', '8a4583c3379d08e101379d0e3dfe0002', '2012-07-01 18:03:28', null, null, '', 'wf', '', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881eb384201ab01384203ad810003', '402881eb3841fb81013841feb84d0002', '事假', 'Private Affair', 'thing', '8a4583c3379d08e101379d0e3dfe0002', '2012-07-01 18:08:53', null, null, '', 'wf', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881eb384201ab013842042bad0004', '402881eb3841fb81013841feb84d0002', '病假', 'Illness', 'illness', '8a4583c3379d08e101379d0e3dfe0002', '2012-07-01 18:09:25', null, null, '员工请3日以上（含3）病假时，须出具病历、近期化验或检查结果，同时需提供社区医院以上的诊断证明（加盖医院印章），否则，按事假处理', 'wf', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881eb384201ab01384204c4fe0005', '402881eb3841fb81013841feb84d0002', '婚假', 'Marriage', 'marriage', '8a4583c3379d08e101379d0e3dfe0002', '2012-07-01 18:10:05', null, null, '符合法定结婚年龄的员工，享受带薪婚假三天，符合晚婚规定（男满25周岁，女满23周岁）的员工限初婚，享受带薪婚假十天。婚假应连续使用，不可调休或分开使用，婚假在领取结婚证之日起三个月内有效。请假时请提供结婚证复印件。', 'wf', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881eb384201ab01384205ec2f0006', '402881eb3841fb81013841feb84d0002', '产假', 'Bear', 'bear', '8a4583c3379d08e101379d0e3dfe0002', '2012-07-01 18:11:20', null, null, '正常生产（顺产）非晚育者，产假为98天。休假天数以自然日计算。晚婚晚育（23周岁零9个月以后生育）的女员工，并在产假期间领取《独生子女光荣证》的，可在98天基础上增加30天；难产增加15天；多胞胎生育的，每多生育1个婴儿增加15天。女员工妊娠不满4个月流产的，产假为15天；妊娠满4个月以上流产的，产假为42天。', 'wf', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881eb384201ab013842066f260007', '402881eb3841fb81013841feb84d0002', '护理假', 'Care', 'care', '8a4583c3379d08e101379d0e3dfe0002', '2012-07-01 18:11:54', null, null, '员工的妻子生育，享有2天带薪护理假。护理假期满后仍需继续休假的，按事假处理。', 'wf', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881eb384201ab0138420720950008', '402881eb3841fb81013841feb84d0002', '哺乳假', 'Nurse', 'nurse', '8a4583c3379d08e101379d0e3dfe0002', '2012-07-01 18:12:39', null, null, '根据规定，在小孩出生日起至满一周岁前享有每天1小时的哺乳假。休假时间为每天9：00-10：00或每天17：00-18：00（选其一）。哺乳假期间享有为带薪假。休哺乳假的员工应按规定的时间上下班，不得随意休假，也不可累加休假。', 'wf', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881eb384201ab013842081fbf0009', '402881eb3841fb81013841feb84d0002', '工伤', 'Work Injurie', 'workInjurie', '8a4583c3379d08e101379d0e3dfe0002', '2012-07-01 18:13:44', null, null, '', 'wf', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e4392f91d101392fba6fc50003', '402881eb3841fb81013841feb84d0002', '调休', 'tiaoxiu', 'tiaoxiu', 'ff80808135eb9bf90135eba78d520018', '2012-08-16 21:58:31', null, null, '', 'wf', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e4392f91d101392fbb35b50005', '402881eb3841fb81013841feb84d0002', '其他', 'qita', 'qita', 'ff80808135eb9bf90135eba78d520018', '2012-08-16 21:59:21', null, null, '', 'wf', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('ff808081394305930139430835c10002', '402881e73706ba52013706bfabd6000a', '性别', 'Gender', 'sex', '8a4583c3379d08e101379d0e3dfe0002', '2012-08-20 15:56:15', null, null, '', null, 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('ff80808139430593013943089bd70003', 'ff808081394305930139430835c10002', '男', 'Man', 'M', '8a4583c3379d08e101379d0e3dfe0002', '2012-08-20 15:56:41', null, null, '', null, 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('ff8080813943059301394308cc0d0004', 'ff808081394305930139430835c10002', '女', 'Women', 'F', '8a4583c3379d08e101379d0e3dfe0002', '2012-08-20 15:56:53', null, null, '', null, 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e5398c26d801398c38bd850002', 'ff8080813943127701394315d0fe0003', '审核操作', 'audit', 'lshenhe', '8a4583c3379d08e101379d0e3dfe0002', '2012-09-03 21:01:32', null, null, '', 'wf', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e5398c26d801398c390b960003', 'ff8080813943127701394315d0fe0003', '考情统计', 'kaoqing', 'kaoqing', '8a4583c3379d08e101379d0e3dfe0002', '2012-09-03 21:01:52', null, null, '', 'wf', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e5398c26d801398c3945430004', 'ff8080813943127701394315d0fe0003', '财务统计', 'caiwu', 'caiwu', '8a4583c3379d08e101379d0e3dfe0002', '2012-09-03 21:02:07', null, null, '', 'wf', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('ff80808139e299b20139e2bfd1670005', '8a4583c337a592980137a594b2d80005', '加班', '加班', 'jiaban', '8a4583c3379d08e101379d0e3dfe0002', '2012-09-20 16:16:25', null, null, '', 'work', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e73706c6c2013706c7c2260003', '1', '创业支撑参数', null, 'suport', '8ad5a5e52907328801290797707c000d', '2015-05-25 23:54:55', '1', '1', '创业支撑相关参数', 'suport', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e30a4d8b55d5014d8bcc5f7a002c', '402881e73706c6c2013706c7c2260003', '所属行业', 'Industry', 'industry', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-25 23:58:56', null, null, '', 'suport', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e30a4d8b55d5014d8bccf0dd002d', '402881e73706c6c2013706c7c2260003', '职称', 'Title', 'title', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-25 23:59:33', null, null, '', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e30a4d8b55d5014d8bd3f090002e', '4028e30a4d8b55d5014d8bcc5f7a002c', '电子信息', '电子信息', '电子信息', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-26 00:07:12', null, null, '', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e30a4d8b55d5014d8bd415eb002f', '4028e30a4d8b55d5014d8bcc5f7a002c', '生物医药', '生物医药', '生物医药', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-26 00:07:21', null, null, '', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e30a4d8b55d5014d8bd438470030', '4028e30a4d8b55d5014d8bcc5f7a002c', '化学化工', '化学化工', '化学化工', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-26 00:07:30', null, null, '', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e30a4d8b55d5014d8bd45ecc0031', '4028e30a4d8b55d5014d8bcc5f7a002c', '机械制造', '机械制造', '机械制造', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-26 00:07:40', null, null, '', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e30a4d8b55d5014d8bd4860b0032', '4028e30a4d8b55d5014d8bcc5f7a002c', '新能源和节能', '新能源和节能', '新能源和节能', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-26 00:07:50', null, null, '', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e30a4d8b55d5014d8bd4aced0033', '4028e30a4d8b55d5014d8bcc5f7a002c', '环保和资源', '环保和资源', '环保和资源', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-26 00:08:00', null, null, '', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e30a4d8b55d5014d8bd4d2080034', '4028e30a4d8b55d5014d8bcc5f7a002c', '新型材料', '新型材料', '新型材料', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-26 00:08:09', null, null, '', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e30a4d8b55d5014d8bd4f6b60035', '4028e30a4d8b55d5014d8bcc5f7a002c', '建材建筑', '建材建筑', '建材建筑', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-26 00:08:19', null, null, '', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e30a4d8b55d5014d8bd517c20036', '4028e30a4d8b55d5014d8bcc5f7a002c', '农林牧业', '农林牧业', '农林牧业', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-26 00:08:27', null, null, '', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e30a4d8b55d5014d8bd53bf00037', '4028e30a4d8b55d5014d8bcc5f7a002c', '电气自动化', '电气自动化', '电气自动化', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-26 00:08:36', null, null, '', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484d967720014d967c2a570001', '402881e73706c6c2013706c7c2260003', '成熟度', 'Maturity', 'maturity', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 01:47:09', null, null, '', 'suport', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484d967720014d967bd3ea0000', '402881e73706c6c2013706c7c2260003', '专利类型', 'Patent Type', 'patentType', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 01:46:46', null, null, '', 'suport', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484d967720014d967ce2d50002', '4028e3484d967720014d967bd3ea0000', '实用新型专利', '实用新型专利', '实用新型专利', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 01:47:56', null, null, '实用新型专利', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484d967720014d967d1bd50003', '4028e3484d967720014d967bd3ea0000', '发明专利', '发明专利', '发明专利', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 01:48:10', null, null, '发明专利', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484d967720014d967d47060004', '4028e3484d967720014d967bd3ea0000', '软件著作权', '软件著作权', '软件著作权', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 01:48:22', null, null, '软件著作权', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484d967720014d967d76220005', '4028e3484d967720014d967bd3ea0000', '外观专利', '外观专利', '外观专利', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 01:48:34', null, null, '外观专利', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484d967720014d967dc2d50006', '4028e3484d967720014d967c2a570001', '已有样品', '已有样品', '已有样品', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 01:48:53', null, null, '已有样品', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484d967720014d967de9550007', '4028e3484d967720014d967c2a570001', '可以量产', '可以量产', '可以量产', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 01:49:03', null, null, '可以量产', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484d967720014d967e10aa0008', '4028e3484d967720014d967c2a570001', '正在研发', '正在研发', '正在研发', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 01:49:13', null, null, '正在研发', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484d967720014d967e40fa0009', '4028e3484d967720014d967c2a570001', '通过中试', '通过中试', '通过中试', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 01:49:26', null, null, '通过中试', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484d967720014d967e644c000a', '4028e3484d967720014d967c2a570001', '通过小试', '通过小试', '通过小试', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 01:49:35', null, null, '通过小试', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484d967720014d96810599000b', '4028e30a4d8b55d5014d8bcc5f7a002c', '环保和能源', '环保和能源', '环保和能源', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 01:52:27', null, null, '', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484d968440014d9696343a0000', '402881e73706c6c2013706c7c2260003', '交易方式', 'Trade Way', 'tradeWay', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 02:15:35', null, null, '', 'suport', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484d968440014d9696964f0001', '4028e3484d968440014d9696343a0000', '面议', '面议', '面议', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 02:16:00', null, null, '', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484d968440014d96976ecc0002', '4028e3484d968440014d9696343a0000', '完全转让', '完全转让', '完全转让', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 02:16:56', null, null, '', 'suport', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da0e3e0014da1227cde0000', 'ff8080812bb53046012bb53546f30005', '单页', 'Single', 'single', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-30 03:25:01', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881e73706c6c2013706c7c2260004', '1', '资源参数', null, 'resource', '8ad5a5e52907328801290797707c000d', '2015-05-25 23:54:55', null, null, '资源相关参数', 'resource', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3bb17dd003b', '402881e73706c6c2013706c7c2260004', '资源类型', 'Resource Type', 'resourceType', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:30:56', null, null, '', 'resource', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3bb9ab2003c', '402881e73706c6c2013706c7c2260004', '资源分类', 'Resource Category', 'resourceCategory', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:31:30', null, null, '', 'resource', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3bd9dea003d', '4028e3484da3ade0014da3bb17dd003b', '构件', 'Gou Jian', 'type_01', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:33:42', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3be15e3003e', '4028e3484da3ade0014da3bb17dd003b', '软件工具', 'Software', 'type_02', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:34:13', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3bea664003f', '4028e3484da3ade0014da3bb17dd003b', '开放源码', 'Codes', 'type_03', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:34:50', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3bf37920040', '4028e3484da3ade0014da3bb9ab2003c', '容器', '容器', 'category_01', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:35:27', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3bf6b380041', '4028e3484da3ade0014da3bb9ab2003c', '中间件', '中间件', 'category_02', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:35:40', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3bf9d470042', '4028e3484da3ade0014da3bb9ab2003c', '办公休闲', '办公休闲', 'category_03', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:35:53', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3bfcdd30043', '4028e3484da3ade0014da3bb9ab2003c', '测试', '测试', 'category_04', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:36:05', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3bffcdf0044', '4028e3484da3ade0014da3bb9ab2003c', '开发常用', '开发常用', 'category_05', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:36:17', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3c02cd10045', '4028e3484da3ade0014da3bb9ab2003c', '工程管理分析', '工程管理分析', 'category_06', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:36:30', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3c08bd30046', '4028e3484da3ade0014da3bb9ab2003c', '开发', '开发', 'category_07', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:36:54', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3c0d82f0047', '4028e3484da3ade0014da3bb9ab2003c', '辅助部署', '辅助部署', 'category_08', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:37:13', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3c112240048', '4028e3484da3ade0014da3bb9ab2003c', '基础工具', '基础工具', 'category_09', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:37:28', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3c1582d0049', '4028e3484da3ade0014da3bb9ab2003c', '分析', '分析', 'category_10', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:37:46', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3c19462004a', '4028e3484da3ade0014da3bb9ab2003c', '文件信息助手', '文件信息助手', 'category_11', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:38:02', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3c1cd94004b', '4028e3484da3ade0014da3bb9ab2003c', '软件仿真', '软件仿真', 'category_12', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:38:16', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3c1fe83004c', '4028e3484da3ade0014da3bb9ab2003c', '编辑器', '编辑器', 'category_13', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:38:29', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3c22bd6004d', '4028e3484da3ade0014da3bb9ab2003c', '开源工具', '开源工具', 'category_14', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:38:40', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3c259e2004e', '4028e3484da3ade0014da3bb9ab2003c', '扩展支持', '扩展支持', 'category_15', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:38:52', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3c28752004f', '4028e3484da3ade0014da3bb9ab2003c', '页面优化', '页面优化', 'category_16', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:39:04', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3c2b5ce0050', '4028e3484da3ade0014da3bb9ab2003c', '文本处理', '文本处理', 'category_17', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:39:16', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3c2e60b0051', '4028e3484da3ade0014da3bb9ab2003c', '通信支持', '通信支持', 'category_18', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:39:28', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3c3221e0052', '4028e3484da3ade0014da3bb9ab2003c', '系统代码优化', '系统代码优化', 'category_19', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:39:43', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('4028e3484da3ade0014da3c351b60053', '4028e3484da3ade0014da3bb9ab2003c', '前端支持', '前端支持', 'category_20', '4028e3484d9a91fa014d9aa14cec0080', '2015-05-30 15:39:56', null, null, '', 'resource', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881f14ee2950b014ee2a491430000', '402881e73706c6c2013706c7c2260002', '申请受理法院', '申请受理法院', 'sqlsfy', '8a4583c3379d08e101379d0e3dfe0002', '2015-07-31 13:45:12', null, null, '', 'cms', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881f14ee2950b014ee2a511a40001', '402881f14ee2950b014ee2a491430000', '中级法院', '中级法院', '0', '8a4583c3379d08e101379d0e3dfe0002', '2015-07-31 13:45:45', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881f14ee2950b014ee2a5c5df0002', '402881e73706c6c2013706c7c2260002', '案件类型', '案件类型', 'ajlx', '8a4583c3379d08e101379d0e3dfe0002', '2015-07-31 13:46:31', null, null, '', 'cms', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881f14ee2950b014ee2a685df0003', '402881f14ee2950b014ee2a5c5df0002', '刑事案件', '刑事案件', '0', '8a4583c3379d08e101379d0e3dfe0002', '2015-07-31 13:47:20', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881f14ee2950b014ee2a6e9150004', '402881f14ee2950b014ee2a5c5df0002', '民事案件', '民事案件', '1', '8a4583c3379d08e101379d0e3dfe0002', '2015-07-31 13:47:46', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881f14ee2950b014ee2a72ddc0005', '402881f14ee2950b014ee2a5c5df0002', '行政案件', '行政案件', '2', '8a4583c3379d08e101379d0e3dfe0002', '2015-07-31 13:48:03', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881f14ee2950b014ee2a7befa0006', '402881e73706c6c2013706c7c2260002', '诉的种类', '诉的种类', 'sdzl', '8a4583c3379d08e101379d0e3dfe0002', '2015-07-31 13:48:41', null, null, '', 'cms', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881f14ee2950b014ee2a82c270007', '402881f14ee2950b014ee2a7befa0006', '变更之诉', '变更之诉', '0', '8a4583c3379d08e101379d0e3dfe0002', '2015-07-31 13:49:08', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881f14ee2950b014ee2a88cf60008', '402881f14ee2950b014ee2a7befa0006', '确认之诉', '确认之诉', '1', '8a4583c3379d08e101379d0e3dfe0002', '2015-07-31 13:49:33', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881f14ee2950b014ee2a94fb70009', '402881f14ee2950b014ee2a7befa0006', '给付之诉', '给付之诉', '2', '8a4583c3379d08e101379d0e3dfe0002', '2015-07-31 13:50:23', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881ea4ef14cd9014ef163fd770000', '402881e73706c6c2013706c7c2260002', '立案状态', 'state', 'state', '8a4583c3379d08e101379d0e3dfe0002', '2015-08-03 10:28:58', null, null, '', 'cms', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881ea4ef14cd9014ef16488ce0001', '402881ea4ef14cd9014ef163fd770000', '未审核', '未审核', '0', '8a4583c3379d08e101379d0e3dfe0002', '2015-08-03 10:29:34', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881ea4ef14cd9014ef164eebe0002', '402881ea4ef14cd9014ef163fd770000', '一级审核', '一级审核', '1', '8a4583c3379d08e101379d0e3dfe0002', '2015-08-03 10:30:00', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881ea4ef14cd9014ef16528c40003', '402881ea4ef14cd9014ef163fd770000', '二级审核', '二级审核', '2', '8a4583c3379d08e101379d0e3dfe0002', '2015-08-03 10:30:15', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881ea4ef73f60014ef751a8f10032', '402881e73706c6c2013706c7c2260002', '诉讼地位', '诉讼地位', 'ssdw', '8a4583c3379d08e101379d0e3dfe0002', '2015-08-04 14:06:40', null, null, '', 'cms', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881ea4ef73f60014ef751eefe0033', '402881ea4ef73f60014ef751a8f10032', '原告', '原告', '0', '8a4583c3379d08e101379d0e3dfe0002', '2015-08-04 14:06:58', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881ea4ef73f60014ef7521fd20034', '402881ea4ef73f60014ef751a8f10032', '被告', '被告', '1', '8a4583c3379d08e101379d0e3dfe0002', '2015-08-04 14:07:11', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881ea4ef73f60014ef752fdd90035', '402881e73706c6c2013706c7c2260002', '当事人类型', '当事人类型', 'dsrlx', '8a4583c3379d08e101379d0e3dfe0002', '2015-08-04 14:08:08', null, null, '', 'cms', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881ea4ef73f60014ef753519b0036', '402881ea4ef73f60014ef752fdd90035', '自然人', '自然人', '0', '8a4583c3379d08e101379d0e3dfe0002', '2015-08-04 14:08:29', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881ea4ef73f60014ef753a6f70037', '402881ea4ef73f60014ef752fdd90035', '法人', '法人', '1', '8a4583c3379d08e101379d0e3dfe0002', '2015-08-04 14:08:51', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881ea4ef73f60014ef753d5320038', '402881ea4ef73f60014ef752fdd90035', '非法人其他组织', '非法人其他组织', '2', '8a4583c3379d08e101379d0e3dfe0002', '2015-08-04 14:09:03', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881eb4f72f24d014f735635da0003', '402881ea4ef14cd9014ef163fd770000', '已预约来院时间', '已预约来院时间', '3', '4028e3484d9ab700014d9ad53d800003', '2015-08-28 16:04:33', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881eb4f828db0014f82e278250002', '402881e73706c6c2013706c7c2260002', '回复方式', 'replyWay', 'replyWay', '4028e3484d9ab700014d9ad53d800003', '2015-08-31 16:32:03', null, null, '', 'cms', 'hasChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881eb4f828db0014f830cd0300003', '402881eb4f828db0014f82e278250002', '电话回复', '电话回复', '0', '4028e3484d9ab700014d9ad53d800003', '2015-08-31 17:18:19', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881eb4f828db0014f830d31460004', '402881eb4f828db0014f82e278250002', '邮件回复', '邮件回复', '1', '4028e3484d9ab700014d9ad53d800003', '2015-08-31 17:18:43', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881eb4f86bfed014f86c9751e0000', '402881eb4f828db0014f82e278250002', '未回复', '未回复', '3', '4028e3484d9ab700014d9ad53d800003', '2015-09-01 10:43:13', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881eb4f8c2258014f8ce6c4620000', '402881eb4f828db0014f82e278250002', '留言回复', '留言回复', '4', '4028e3484d9ab700014d9ad53d800003', '2015-09-02 15:12:57', null, null, '', 'cms', 'noChild', null, null);
INSERT INTO `sys_data_dictionary` VALUES ('402881fb50a807080150a89f803c0003', '402881e73706ba52013706bfabd6000a', '河南新郑法院诉讼服务网', 'Xinzheng City Court Litigation Services', 'InternetTitle', '4028e3484d9a91fa014d9aa14cec0080', '2015-10-27 17:27:16', null, null, '', null, 'noChild', null, null);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `ID` varchar(32) NOT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `DEPT_NAME` varchar(50) DEFAULT NULL,
  `EN_DEPT_NAME` varchar(50) DEFAULT NULL,
  `DEPT_FAX` varchar(24) DEFAULT NULL,
  `DEPT_PHONE` varchar(24) DEFAULT NULL COMMENT '칫绰',
  `DEPT_EMAIL` varchar(36) DEFAULT NULL COMMENT 'ʼ',
  `LINK_MAN` varchar(120) DEFAULT NULL COMMENT 'ϵ',
  `POST_ADDRESS` varchar(250) DEFAULT NULL COMMENT 'ͨŵַ',
  `SHORT_NAME` varchar(20) DEFAULT NULL COMMENT 'ż',
  `WEB_SITE` varchar(128) DEFAULT NULL COMMENT 'WEBվ,ĵλͬĲвͬվվ',
  `DEPT_LEVEL` varchar(50) DEFAULT '1',
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL COMMENT 'ʱ',
  `IS_DELETE` char(1) DEFAULT '1' COMMENT '0ɾ1ɾĬ1',
  `REMARK` varchar(256) DEFAULT NULL COMMENT 'עϢ',
  `STATE` char(1) DEFAULT '1' COMMENT '״̬,01Ĭ1',
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_4` (`PARENT_ID`) USING BTREE,
  KEY `FKA509109726CFC0BF` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKA5091097EB410A3D` (`PARENT_ID`) USING BTREE,
  KEY `FKA50910979B6243F6` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKA50910975FD38D74` (`PARENT_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ű';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', null, '部门', 'Department', '', '', '', null, '', null, '', '1', null, null, '1', '', '1', null);
INSERT INTO `sys_dept` VALUES ('4028e3484d9a91fa014d9aa830040095', '1', '诉讼网系统', 'Litigation System', '', '', '', null, '', null, '', '1_1_891', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 21:13:42', '1', '', '1', null);
INSERT INTO `sys_dept` VALUES ('2', '1', '注册用户', 'Register User', '', '', '', null, '', null, '', '1_1_891_1_999', '4028e3484d9a91fa014d9aa14cec0080', '2015-11-1618:34:55', '1', '', '1', null);
INSERT INTO `sys_dept` VALUES ('4028813c525cb7d201525cc15d530005', '4028813c525278a801525284be6e0002', '中原区人民法院工作人员', 'Court member Of Zhongyuan', '', '', '', null, '', null, '', '1_1_891_41_301_4_251_2_971', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-20 09:58:42', '1', '', '1', 'zyfy');
INSERT INTO `sys_dept` VALUES ('4028813c525cb7d201525cc127f60004', '4028813c525278a801525284be6e0002', '中原区人民法院领导', 'Court leadership Of Zhongyuan', '', '', '', null, '', null, '', '1_1_891_41_301_4_251_1_191', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-20 09:58:28', '1', '', '1', 'zyfy');
INSERT INTO `sys_dept` VALUES ('4028813c525cb7d201525cbed8170003', '4028813c5238b93d015239190a210009', '惠济市人民法院工作人员', 'Court member Of Huiji', '', '', '', null, '', null, '', '1_1_891_41_301_3_311_2_161', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-20 09:55:57', '1', '', '1', 'hjfy');
INSERT INTO `sys_dept` VALUES ('4028813c525cb7d201525cbc22ac0000', '4028813c5238b93d0152391366130006', '郑州市中级人民法院领导', 'Court leadership Of Zhengzhou', '', '', '', null, '', null, '', '1_1_891_41_301_5_261', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-20 09:52:59', '1', '', '1', 'zzfy');
INSERT INTO `sys_dept` VALUES ('4028813c525cb7d201525cbdf8ec0001', '4028813c5238b93d0152391366130006', '郑州市中级人民法院工作人员', 'Court member Of Zhengzhou', '', '', '', null, '', null, '', '1_1_891_41_301_6_151', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-20 09:54:59', '1', '', '1', 'zzfy');
INSERT INTO `sys_dept` VALUES ('4028813c525cb7d201525cbe6d200002', '4028813c5238b93d015239190a210009', '惠济市法院领导', 'Court leadership Of Huiji', '', '', '', null, '', null, '', '1_1_891_41_301_3_311_1_321', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-20 09:55:29', '1', '', '1', 'hjfy');
INSERT INTO `sys_dept` VALUES ('4028813c5238b93d0152391366130006', '4028e3484d9a91fa014d9aa830040095', '郑州市中级人民法院', 'Zhengzhou City Intermediate People\'s court', '', '', '', null, '', null, '', '1_1_891_41_301', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 11:41:58', '1', '', '1', 'zzfy');
INSERT INTO `sys_dept` VALUES ('4028813c5238b93d01523915d7ee0007', '4028813c5238b93d0152391366130006', '新郑市人民法院', 'Xinzheng Municipal People\'s court ', '', '', '', null, '', null, '', '1_1_891_41_301_1_81', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 11:44:38', '1', '', '1', 'xzfy');
INSERT INTO `sys_dept` VALUES ('4028813c5238b93d0152391862af0008', '4028813c5238b93d0152391366130006', '荥阳市人民法院', 'Xingyang Municipal People\'s court', '', '', '', null, '', null, '', '1_1_891_41_301_2_331', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 11:47:25', '1', '', '1', 'xyfy');
INSERT INTO `sys_dept` VALUES ('4028813c5238b93d015239190a210009', '4028813c5238b93d0152391366130006', '惠济市人民法院', 'Huiji Municipal People\'s court', '', '', '', null, '', null, '', '1_1_891_41_301_3_311', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 11:48:08', '1', '', '1', 'hjfy');
INSERT INTO `sys_dept` VALUES ('4028813c5238b93d0152391ae8c2000a', '4028813c5238b93d01523915d7ee0007', '新郑市法院领导', 'Court leadership Of Xinzheng', '', '', '', null, '', null, '', '1_1_891_41_301_1_81_1_571', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 11:50:10', '1', '', '1', 'xzfy');
INSERT INTO `sys_dept` VALUES ('4028813c525278a801525284be6e0002', '4028813c5238b93d0152391366130006', '中原区人民法院 ', 'Central Plains District People\'s court', '', '', '', null, '', null, '', '1_1_891_41_301_4_251', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-18 10:16:17', '1', '', '1', 'zyfy');
INSERT INTO `sys_dept` VALUES ('4028813c5253a1ea015253a388cd0000', '4028813c5238b93d01523915d7ee0007', '新郑市法院工作人员', 'Court member Of Xinzheng', '', '', '', null, '', null, '', '1_1_891_41_301_1_81_2_671', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-18 15:29:32', '1', '', '1', 'xzfy');
INSERT INTO `sys_dept` VALUES ('4028813c5253a1ea015253c5caa40001', '4028813c5238b93d0152391862af0008', '荥阳市人民法院领导', 'Court leadership Of Xingyang', '', '', '', null, '', null, '', '1_1_891_41_301_2_331_1_541', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-18 16:06:57', '1', '', '1', 'xyfy');
INSERT INTO `sys_dept` VALUES ('4028813c5253a1ea015253c6e7be0002', '4028813c5238b93d0152391862af0008', '荥阳市人民法院工作人员', 'Court member Of Xingyang', '', '', '', null, '', null, '', '1_1_891_41_301_2_331_2_751', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-18 16:08:10', '1', '', '1', 'xyfy');

-- ----------------------------
-- Table structure for sys_mail_server_setting
-- ----------------------------
DROP TABLE IF EXISTS `sys_mail_server_setting`;
CREATE TABLE `sys_mail_server_setting` (
  `ID` varchar(32) NOT NULL,
  `protocol` varchar(10) DEFAULT NULL,
  `host` varchar(20) DEFAULT NULL,
  `port` int(10) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `ssl_yn` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_mail_server_setting
-- ----------------------------
INSERT INTO `sys_mail_server_setting` VALUES ('ff80808138db72c90138db7314760002', 'smtp', 'smtp.qq.com', '465', '372566232@qq.com', '', 'Y');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `ID` varchar(32) NOT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `MENU_PATH` varchar(128) DEFAULT NULL COMMENT 'URL',
  `EN_MENU_NAME` varchar(50) DEFAULT NULL,
  `MENU_NAME` varchar(50) DEFAULT NULL,
  `REMARK` varchar(256) DEFAULT NULL COMMENT 'עϢ',
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL COMMENT 'ʱ',
  `ORDER_NUMBER` int(11) DEFAULT '1',
  `IS_DELETE` char(1) DEFAULT '1' COMMENT '0ɾ1ɾĬ1',
  `STATE` char(1) DEFAULT '1' COMMENT '״̬,01Ĭ1',
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_6` (`PARENT_ID`) USING BTREE,
  KEY `FKA50D27B126CFC0BF` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKA50D27B1EB452157` (`PARENT_ID`) USING BTREE,
  KEY `FKA50D27B19B6243F6` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKA50D27B15FD7A48E` (`PARENT_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ϵͳ˵';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', null, '', 'System Menu', '系统菜单', '', null, null, '1', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881e5362b134001362b51544d00ab', '402881e538c8f37b0138c8f86f9e0004', '/system/userlog_list.do', 'Login Log Mgt', '用户登录日志', '', '8ad5a5e52907328801290797707c000d', '2012-03-19 22:16:52', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('8ad5fa3c2a934f6c012a9357951d0002', 'ff808081285981aa01285984fde90002', '/system/datadictionary_tree.do', 'System Param Mgt', '系统参数', '', '8ad5a5e52907328801290797707c000d', '2010-08-21 14:30:44', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('ff808081285981aa01285984fde90002', '1', '', 'System Mgt', '系统管理', '', '1', '2010-05-02 20:56:47', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('ff808081285988fe0128598943a90001', 'ff808081285981aa01285984fde90002', '/system/menu_tree.do', 'Menu Mgt', '菜单管理', '', null, '2010-05-03 23:01:27', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('ff80808128598a2e0128598a43b40001', 'ff808081285981aa01285984fde90002', '/system/user_list.do', 'User Mgt', '用户管理', '', null, '2010-05-02 23:02:32', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('ff808081285b574601285baa3c3c0001', 'ff808081285981aa01285984fde90002', '/system/dept_tree.do', 'Department Mgt', '部门管理', '', '1', '2010-05-03 08:56:42', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('ff808081285b574601285baaa9ea0002', 'ff808081285981aa01285984fde90002', '/system/role_tree.do', 'Role Mgt', '角色管理', '', '1', '2010-05-03 08:57:10', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('ff808081285bd67101285bf0867f0002', '1', '', 'Website Mgt', '网站管理', '', '1', '2010-05-03 10:13:29', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('ff808081285bd67101285bf112930003', 'ff808081285bd67101285bf0867f0002', '/cms/channel_tree.do', 'Channel Mgt', '栏目管理', '', '1', '2010-05-03 10:14:05', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('ff808081285bd67101285bf1359b0004', 'ff808081285bd67101285bf0867f0002', '/cms/article_tree.do', 'Article Mgt', '文章管理', '', '1', '2010-05-03 10:14:14', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('8ad6873b2bb57e99012bb5863d830002', 'ff808081285bd67101285bf0867f0002', '/cms/templet_tree.do', 'Template Mgt', '模板管理', '', '8ad5a5e52907328801290797707c000d', '2010-10-16 22:51:35', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('8ad501542bc4a2c0012bc4bb9f72000a', '1', '', 'Personal Setup', '个人设置', '', '8ad5a5e52907328801290797707c000d', '2010-05-02 21:44:11', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('8a4583c337a0aa010137a0ac072a0002', '8ad501542bc4a2c0012bc4bb9f72000a', '/system/user_toSetDesk.do', 'Desk Setting', '桌面设置', '', '8ad5a5e52907328801290797707c000d', '2012-05-31 10:14:17', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('8a4583c337a57ea00137a587ff1d0002', '1', '', 'Work Mgt', '工作管理', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 08:53:02', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('8a4583c337a57ea00137a58855640003', '8a4583c337a57ea00137a587ff1d0002', '/oa/project_list.do', 'Project Maintain', '项目维护', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 08:53:24', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('ff80808135eb88f50135eb8f55b20003', '1', '', 'Workflow Mgt', '流程管理', '', '8ad5a5e52907328801290797707c000d', '2012-03-07 13:08:53', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881e5362b134001362b51af3600ad', '402881e538c8f37b0138c8f86f9e0004', '/system/accesslog_list.do', 'System Operating Log', '系统操作日志', '', '8ad5a5e52907328801290797707c000d', '2012-03-19 22:17:15', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881e63765239e0137653377ea0002', 'ff808081285bd67101285bf0867f0002', '/system/datadictionary_tree.do?type=cms', 'CMS Param Mgt', '参数维护', '', '8ad5a5e52907328801290797707c000d', '2012-05-19 21:05:00', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('8a4583c3379d1f0301379d34ded30002', '8ad501542bc4a2c0012bc4bb9f72000a', '/system/user_toUserPicture.do', 'My Picture', '图像照片', '', '8ad5a5e52907328801290797707c000d', '2012-05-30 18:05:16', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('8a4583c3379c67de01379c6a29db0003', '8ad501542bc4a2c0012bc4bb9f72000a', '/system/user_toUserBasicInfo.do', 'Personal Info', '个人信息', '', '8ad5a5e52907328801290797707c000d', '2012-05-30 14:23:52', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('8a4583c337a076a60137a08bad9b0007', '8ad501542bc4a2c0012bc4bb9f72000a', '/system/user_toUpdatePassword.do', 'Update Password', '修改密码', '', '8ad5a5e52907328801290797707c000d', '2012-05-31 09:38:57', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('8a4583c337a57ea00137a58966ee0004', '8a4583c337a57ea00137a587ff1d0002', '/oa/worklog_list.do', 'Work Log', '工作日志', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 08:54:34', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('8a4583c337a57ea00137a58d208c0007', '8a4583c337a57ea00137a587ff1d0002', '/system/datadictionary_tree.do?type=work', 'Work Param', '参数设置', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-01 08:38:38', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881e437b280f90137b281f5c20002', '8a4583c337a57ea00137a587ff1d0002', '/oa/worklog_list.do?isLeaderRead=Y', 'Subordinate Work Log', '下属工作日志', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-03 21:21:30', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('ff8080813827d78e013827de7e380002', '1', '', 'Information Mgt', '信息管理', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-26 16:18:09', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('ff8080813827d78e013827deb9b60003', 'ff8080813827d78e013827de7e380002', '/system/datadictionary_tree.do?type=oaarticle', 'Information Category', '信息分类', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-26 16:18:24', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('ff8080813827d78e013827dfae000004', 'ff8080813827d78e013827de7e380002', '/oa/article_tree.do', 'Information Release', '信息发布', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-06-26 16:19:26', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881eb3841d460013841f4bb5b0002', 'ff80808135eb88f50135eb8f55b20003', '', 'Leave Workflow', '请假流程', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-07-01 17:52:34', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881eb3841f6d8013841f925df0003', '402881eb3841d460013841f4bb5b0002', '/workflow/leave_list.do', 'My Leave Sheet', '我的请假单', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-07-01 17:57:23', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881eb3841f6d8013841f9b2930004', '402881eb3841d460013841f4bb5b0002', '/workflow/leave_listAudit.do', null, '待审核请假单', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-07-01 17:57:59', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881eb3841f6d8013841f9ea1f0005', '402881eb3841d460013841f4bb5b0002', '/workflow/leave_listHistory.do', null, '已审核请假单', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-07-01 17:58:13', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881e538c8f37b0138c8f86f9e0004', 'ff808081285981aa01285984fde90002', '', 'Log Mgt', '日志管理', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-07-27 23:05:21', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881e638c87c160138c897b5140002', 'ff808081285981aa01285984fde90002', '/system/systemSetting_addRuleSetting.do', 'Syetem Setting', '系统设置', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-07-27 21:19:41', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('/system/user_list.do', 'ff808081285981aa01285984fde90002', '/system/querySqlHql_menuTree.do', 'sql/hql语句管理', 'sql/hql语句管理', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-12-19 09:57:08', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('ff8080813942001e013942025b190002', 'ff80808135eb88f50135eb8f55b20003', '', 'WorkFlow Setting', '流程设置', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-08-20 11:10:14', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('ff8080813942001e0139420311820003', 'ff8080813942001e013942025b190002', '/workflow/wfsetting_list.do', 'Execute Settring', '流程执行设置', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-08-20 11:11:00', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('ff8080813942f9c0013942fdcd870002', 'ff8080813942001e013942025b190002', '/system/datadictionary_tree.do?type=wf', 'WorkFlow Param Setting', '流程参数设置', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-08-20 15:44:53', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('4028e30a4d5b7cee014d5b7e2fe70000', 'ff808081285bd67101285bf0867f0002', '/cms/article_staticize.do', 'Site Staticize', '全站静态化', '', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-16 14:51:45', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('4028e3484da3ade0014da3af331b0000', '1', '', 'Resource Manage', '资源管理', '', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-30 15:17:57', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('4028e3484da3ade0014da3afcbb80001', '4028e3484da3ade0014da3af331b0000', '/sanku/resource_list.do', 'Resource Manage', '资源管理', '', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-30 15:18:36', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('4028e3484da3ade0014da3b875200023', '4028e3484da3ade0014da3af331b0000', '/system/datadictionary_tree.do?type=resource', 'Resource Parameters', '资源参数设置', '', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-30 15:28:04', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881fb50a3fdf70150a40706c00004', '1', '', '律师在线', '律师在线', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-10-26 20:02:15', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881f14ee2950b014ee2c76441000b', '1', '', '诉讼信息管理', '诉讼信息管理', '', '8a4583c3379d08e101379d0e3dfe0002', '2015-07-31 14:23:14', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881f14ee34f5d014ee3519d010000', '402881f14ee2950b014ee2c76441000b', '/lawsuit/laxx_list.do?lsLaxx.state=0', '一级审核', '一级审核', '', '8a4583c3379d08e101379d0e3dfe0002', '2015-07-31 16:54:13', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881fb50a3fdf70150a40740120005', '402881fb50a3fdf70150a40706c00004', '/lawsuit/lo_list.do?type=1&status=0', '律师援助', '律师援助', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-10-26 20:02:30', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('2c928a40507ac98a01507ad1745f0000', '402881f14ee2950b014ee2c76441000b', '/lawsuit/laxx_list.do?lsLaxx.state=1', '二级审核', '二级审核', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-10-18 19:59:18', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881fb50a3fdf70150a40867c60006', '402881fb50a3fdf70150a40706c00004', '/lawsuit/lo_list.do?type=2&status=0', '代表委员监督', '代表委员监督', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-10-26 20:03:45', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('2c928a40507ac98a01507ad4c9760062', '402881f14ee2950b014ee2c76441000b', '/lawsuit/laxx_list.do?lsLaxx.state=2', '预约来院时间', '预约来院时间', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-10-18 20:02:56', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('2c928a40507ac98a01507ad591770063', '402881f14ee2950b014ee2c76441000b', '/lawsuit/xf_list.do', '判后答疑回复', '判后答疑回复', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-10-18 20:03:48', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('2c928a40507ac98a01507ad5d4090064', '402881f14ee2950b014ee2c76441000b', '/lawsuit/laxx_list.do', '案件查询', '案件查询', '	', '4028e3484d9a91fa014d9aa14cec0080', '2015-10-18 20:04:05', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881fb50a42a970150a42c726f0000', '402881fb50a3fdf70150a40706c00004', '/lawsuit/lo_list.do?status=1', '已回答问题', '已回答问题', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-10-26 20:43:07', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881fb50ad66680150ad77a21b0000', '1', '', '直播法庭管理', '直播法庭管理', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-10-28 16:01:50', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881fb50ad66680150ad77e3dc0001', '402881fb50ad66680150ad77a21b0000', '/lawsuit/co_list.do', '直播法庭管理', '直播法庭管理', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-10-28 16:02:06', '0', '1', '1', null);
INSERT INTO `sys_menu` VALUES ('402881e95180da21015180e7f01d0001', '402881fb50ad66680150ad77a21b0000', '/lawsuit/uv_listVideo.do', '视频管理', '视频管理', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-12-08 17:24:22', '0', '1', '1', null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ID` varchar(32) NOT NULL,
  `PARENT_ID` varchar(32) DEFAULT NULL,
  `ROLE_NAME` varchar(50) DEFAULT NULL COMMENT 'ɫ',
  `EN_ROLE_NAME` varchar(50) DEFAULT NULL,
  `DESK_SETTING` varchar(100) DEFAULT NULL,
  `ROLE_CODE` varchar(20) DEFAULT NULL,
  `ROLE_LEVEL` varchar(50) DEFAULT '1',
  `REMARK` varchar(256) DEFAULT NULL COMMENT 'עϢ',
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL COMMENT 'ʱ',
  `IS_DELETE` char(1) DEFAULT '1' COMMENT '0ɾ1ɾĬ1',
  `STATE` char(1) DEFAULT '1' COMMENT '״̬,01Ĭ1',
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_5` (`PARENT_ID`) USING BTREE,
  KEY `FKA50F92C826CFC0BF` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKA50F92C8EB478C6E` (`PARENT_ID`) USING BTREE,
  KEY `FKA50F92C89B6243F6` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKA50F92C85FDA0FA5` (`PARENT_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ûɫ';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', null, '系统角色', 'System Role', null, null, '1', '', null, null, '1', '1', null);
INSERT INTO `sys_role` VALUES ('4028e3484d9a91fa014d9a9ce0e00000', '1', '超级管理员', 'Super Administrator', null, null, '1_2_221', '', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 21:01:21', '1', '1', null);
INSERT INTO `sys_role` VALUES ('0', null, '系统管理员', 'System Administrator', 'msgboard, news, gonggao, peixun, huodong, xiance', null, '1_7_441', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-08-15 21:44:25', '1', '1', null);
INSERT INTO `sys_role` VALUES ('4028e3484d9a91fa014d9a9fce50006f', '1', '管理员', 'Administrator', 'msgboard, news, gonggao, peixun, huodong, xiance', null, '1_3_841', '', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 21:04:33', '1', '1', null);
INSERT INTO `sys_role` VALUES ('4028e3484d9a91fa014d9aa0414a007a', '1', '注册用户', 'Registered User', 'msgboard, news, gonggao, peixun, huodong, xiance', null, '1_4_351', '', '8a4583c3379d08e101379d0e3dfe0002', '2015-05-28 21:05:03', '1', '1', null);
INSERT INTO `sys_role` VALUES ('402881f14ee2950b014ee2ca5112000d', '0', '系统管理员1', 'all', 'msgboard, news, gonggao, peixun, huodong, xiance', null, '1_7_441_1_821', '', '8a4583c3379d08e101379d0e3dfe0002', '2015-07-31 14:26:26', '1', '1', null);
INSERT INTO `sys_role` VALUES ('8ae99b515110bfee0151185d44ea0037', '1', '典型案件更新维护', '典型案件更新维护', 'msgboard, news, gonggao, peixun, huodong, xiance', null, '1_4_01', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-11-18 10:12:24', '1', '1', null);
INSERT INTO `sys_role` VALUES ('8ae99b515110bfee0151185dfa110042', '1', '宣教处人员', '宣教处人员', 'msgboard, news, gonggao, peixun, huodong, xiance', null, '1_5_251', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-11-18 10:13:10', '1', '1', null);
INSERT INTO `sys_role` VALUES ('8ae99b515110bfee0151185e8430004f', '1', '网管处人员', '网管处人员', 'msgboard, news, gonggao, peixun, huodong, xiance', null, '1_6_481', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-11-18 10:13:46', '1', '1', null);
INSERT INTO `sys_role` VALUES ('8ae99b515110bfee0151185fda980066', '1', '网上立案审核', '网上立案审核', 'msgboard, news, gonggao, peixun, huodong, xiance', null, '1_8_511', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-11-18 10:15:13', '1', '1', null);
INSERT INTO `sys_role` VALUES ('8ae99b515110bfee01511860f4840073', '1', '代表委员监督', '代表委员监督', 'msgboard, news, gonggao, peixun, huodong, xiance', null, '1_9_901', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-11-18 10:16:25', '1', '1', null);
INSERT INTO `sys_role` VALUES ('8ae99b515110bfee01511864181b007d', '1', '诉讼服务指南、流程指南、文书模板', '诉讼服务指南、流程指南、文书模板', 'msgboard, news, gonggao, peixun, huodong, xiance', null, '1_10_321', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-11-18 10:19:51', '1', '1', null);
INSERT INTO `sys_role` VALUES ('8ae99b51511de52301512e40e3ff000d', '1', '代表委员', '代表委员', 'msgboard, news, gonggao, peixun, huodong, xiance', null, '1_13_81', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-11-22 16:13:03', '1', '1', null);
INSERT INTO `sys_role` VALUES ('8ae99b515110bfee01511866f57100b1', '1', '减刑假释更新维护', '减刑假释更新维护', 'msgboard, news, gonggao, peixun, huodong, xiance', null, '1_11_811', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-11-18 10:22:59', '1', '1', null);
INSERT INTO `sys_role` VALUES ('8ae99b515110bfee0151186aaad800c5', '1', '其他法院相关人员', '其他法院相关人员', 'msgboard, news, gonggao, peixun, huodong, xiance', null, '1_13_241', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-11-18 10:27:02', '1', '1', null);
INSERT INTO `sys_role` VALUES ('8ae99b51511de52301512e402ded0003', '1', '律师', '律师', 'msgboard, news, gonggao, peixun, huodong, xiance', null, '1_12_521', '', '4028e3484d9a91fa014d9aa14cec0080', '2015-11-22 16:12:16', '1', '1', null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `ID` varchar(32) NOT NULL,
  `ROLE_ID` varchar(32) NOT NULL,
  `MENU_ID` varchar(32) NOT NULL,
  `AUTH` varchar(10) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`,`ROLE_ID`,`MENU_ID`),
  KEY `FK_Relationship_10` (`MENU_ID`) USING BTREE,
  KEY `FKAA83B076A883DC82` (`MENU_ID`) USING BTREE,
  KEY `FKAA83B076C1F27122` (`ROLE_ID`) USING BTREE,
  KEY `FKAA83B0761D165FB9` (`MENU_ID`) USING BTREE,
  KEY `FKAA83B0763684F459` (`ROLE_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511872b67a00e1', '8ae99b515110bfee0151185dfa110042', 'ff808081285bd67101285bf1359b0004', 'W', '2015-11-18 10:35:49');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511872b67a00e0', '8ae99b515110bfee0151185dfa110042', 'ff808081285bd67101285bf0867f0002', 'W', '2015-11-18 10:35:49');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511872b67a00df', '8ae99b515110bfee0151185dfa110042', '8a4583c337a0aa010137a0ac072a0002', 'W', '2015-11-18 10:35:49');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511872b67a00de', '8ae99b515110bfee0151185dfa110042', '8a4583c337a076a60137a08bad9b0007', 'W', '2015-11-18 10:35:49');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511872b67a00dd', '8ae99b515110bfee0151185dfa110042', '8a4583c3379d1f0301379d34ded30002', 'W', '2015-11-18 10:35:49');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511872b67a00dc', '8ae99b515110bfee0151185dfa110042', '8a4583c3379c67de01379c6a29db0003', 'W', '2015-11-18 10:35:49');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185d44ea003f', '8ae99b515110bfee0151185d44ea0037', 'ff808081285bd67101285bf1359b0004', 'W', '2015-11-18 10:12:24');
INSERT INTO `sys_role_menu` VALUES ('402881ea4efbdb83014efbdce535001e', '4028e3484d9a91fa014d9aa0414a007a', '8a4583c337a076a60137a08bad9b0007', 'W', '2015-08-05 11:17:14');
INSERT INTO `sys_role_menu` VALUES ('402881ea4efbdb83014efbdce535001d', '4028e3484d9a91fa014d9aa0414a007a', '8a4583c3379d1f0301379d34ded30002', 'W', '2015-08-05 11:17:14');
INSERT INTO `sys_role_menu` VALUES ('402881ea4efbdb83014efbdce535001c', '4028e3484d9a91fa014d9aa0414a007a', '8a4583c3379c67de01379c6a29db0003', 'W', '2015-08-05 11:17:14');
INSERT INTO `sys_role_menu` VALUES ('402881ea4efbdb83014efbdce535001b', '4028e3484d9a91fa014d9aa0414a007a', '8ad501542bc4a2c0012bc4bb9f72000a', 'W', '2015-08-05 11:17:14');
INSERT INTO `sys_role_menu` VALUES ('402881ea4efbdb83014efbdce534001a', '4028e3484d9a91fa014d9aa0414a007a', '1', 'W', '2015-08-05 11:17:14');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f90057', '0', 'ff8080813827d78e013827dfae000004', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f90056', '0', 'ff8080813827d78e013827deb9b60003', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f90055', '0', 'ff8080813827d78e013827de7e380002', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f80054', '0', '402881e437b280f90137b281f5c20002', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f80053', '0', '8a4583c337a57ea00137a58966ee0004', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f80052', '0', '8a4583c337a57ea00137a58855640003', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f7004c', '0', '402881eb3841f6d8013841f9ea1f0005', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f7004d', '0', 'ff8080813942001e013942025b190002', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f7004e', '0', 'ff8080813942001e0139420311820003', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f7004f', '0', 'ff8080813942f9c0013942fdcd870002', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f70050', '0', '8a4583c337a57ea00137a587ff1d0002', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f80051', '0', '8a4583c337a57ea00137a58d208c0007', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4d00c0', '402881f14ee2950b014ee2ca5112000d', '2c928a40507ac98a01507ad1745f0000', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eef0037', '4028e3484d9a91fa014d9a9ce0e00000', '402881e95180da21015180e7f01d0001', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eef0036', '4028e3484d9a91fa014d9a9ce0e00000', '402881fb50ad66680150ad77e3dc0001', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eee0035', '4028e3484d9a91fa014d9a9ce0e00000', '402881fb50ad66680150ad77a21b0000', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eee0034', '4028e3484d9a91fa014d9a9ce0e00000', '402881fb50a42a970150a42c726f0000', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eee0033', '4028e3484d9a91fa014d9a9ce0e00000', '402881fb50a3fdf70150a40867c60006', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eee0032', '4028e3484d9a91fa014d9a9ce0e00000', '402881fb50a3fdf70150a40740120005', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eed0031', '4028e3484d9a91fa014d9a9ce0e00000', '402881fb50a3fdf70150a40706c00004', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eed0030', '4028e3484d9a91fa014d9a9ce0e00000', '2c928a40507ac98a01507ad5d4090064', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f6004b', '0', '402881eb3841f6d8013841f9b2930004', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f6004a', '0', '402881eb3841f6d8013841f925df0003', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f60049', '0', '402881eb3841d460013841f4bb5b0002', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f60048', '0', 'ff80808135eb88f50135eb8f55b20003', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f50047', '0', '4028e30a4d5b7cee014d5b7e2fe70000', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f50046', '0', '402881e63765239e0137653377ea0002', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f50045', '0', '8ad6873b2bb57e99012bb5863d830002', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f50044', '0', 'ff808081285bd67101285bf1359b0004', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f50043', '0', 'ff808081285bd67101285bf112930003', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f40042', '0', 'ff808081285bd67101285bf0867f0002', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f40041', '0', '8a4583c337a0aa010137a0ac072a0002', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f40040', '0', '8a4583c337a076a60137a08bad9b0007', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f4003f', '0', '8a4583c3379d1f0301379d34ded30002', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f10038', '0', '402881e638c87c160138c897b5140002', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f10039', '0', '402881e538c8f37b0138c8f86f9e0004', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f2003a', '0', '402881e5362b134001362b51544d00ab', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f2003b', '0', '402881e5362b134001362b51af3600ad', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f3003c', '0', '402882fc3bb0d975013bb0e0e9d90001', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f3003d', '0', '8ad501542bc4a2c0012bc4bb9f72000a', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f3003e', '0', '8a4583c3379c67de01379c6a29db0003', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f10037', '0', '8ad5fa3c2a934f6c012a9357951d0002', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f10036', '0', 'ff808081285988fe0128598943a90001', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f10035', '0', 'ff808081285b574601285baaa9ea0002', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f00034', '0', 'ff808081285b574601285baa3c3c0001', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f00033', '0', 'ff80808128598a2e0128598a43b40001', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f00032', '0', 'ff808081285981aa01285984fde90002', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028e3484d9a91fa014d9a9d91f00031', '0', '1', 'W', '2015-05-28 21:02:07');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eec002f', '4028e3484d9a91fa014d9a9ce0e00000', '2c928a40507ac98a01507ad591770063', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eec002e', '4028e3484d9a91fa014d9a9ce0e00000', '2c928a40507ac98a01507ad4c9760062', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185d44ea003e', '8ae99b515110bfee0151185d44ea0037', 'ff808081285bd67101285bf0867f0002', 'W', '2015-11-18 10:12:24');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185d44ea003d', '8ae99b515110bfee0151185d44ea0037', '8a4583c337a0aa010137a0ac072a0002', 'W', '2015-11-18 10:12:24');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eec002d', '4028e3484d9a91fa014d9a9ce0e00000', '2c928a40507ac98a01507ad1745f0000', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185d44ea003c', '8ae99b515110bfee0151185d44ea0037', '8a4583c337a076a60137a08bad9b0007', 'W', '2015-11-18 10:12:24');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185d44ea003b', '8ae99b515110bfee0151185d44ea0037', '8a4583c3379d1f0301379d34ded30002', 'W', '2015-11-18 10:12:24');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4d00bf', '402881f14ee2950b014ee2ca5112000d', '402881f14ee34f5d014ee3519d010000', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eeb002c', '4028e3484d9a91fa014d9a9ce0e00000', '402881f14ee34f5d014ee3519d010000', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4d00be', '402881f14ee2950b014ee2ca5112000d', '402881f14ee2950b014ee2c76441000b', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4c00bd', '402881f14ee2950b014ee2ca5112000d', '4028e3484da3ade0014da3b875200023', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4c00bc', '402881f14ee2950b014ee2ca5112000d', '4028e3484da3ade0014da3afcbb80001', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4c00bb', '402881f14ee2950b014ee2ca5112000d', '4028e3484da3ade0014da3af331b0000', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4b00ba', '402881f14ee2950b014ee2ca5112000d', 'ff8080813827d78e013827dfae000004', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4b00b9', '402881f14ee2950b014ee2ca5112000d', 'ff8080813827d78e013827deb9b60003', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4a00b8', '402881f14ee2950b014ee2ca5112000d', 'ff8080813827d78e013827de7e380002', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4900b7', '402881f14ee2950b014ee2ca5112000d', '402881e437b280f90137b281f5c20002', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4900b6', '402881f14ee2950b014ee2ca5112000d', '8a4583c337a57ea00137a58966ee0004', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4900b5', '402881f14ee2950b014ee2ca5112000d', '8a4583c337a57ea00137a58855640003', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4800b4', '402881f14ee2950b014ee2ca5112000d', '8a4583c337a57ea00137a58d208c0007', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4800b3', '402881f14ee2950b014ee2ca5112000d', '8a4583c337a57ea00137a587ff1d0002', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4800b2', '402881f14ee2950b014ee2ca5112000d', 'ff8080813942f9c0013942fdcd870002', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4800b1', '402881f14ee2950b014ee2ca5112000d', 'ff8080813942001e0139420311820003', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4700b0', '402881f14ee2950b014ee2ca5112000d', 'ff8080813942001e013942025b190002', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4700af', '402881f14ee2950b014ee2ca5112000d', '402881eb3841f6d8013841f9ea1f0005', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4700ae', '402881f14ee2950b014ee2ca5112000d', '402881eb3841f6d8013841f9b2930004', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4600ad', '402881f14ee2950b014ee2ca5112000d', '402881eb3841f6d8013841f925df0003', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4600ac', '402881f14ee2950b014ee2ca5112000d', '402881eb3841d460013841f4bb5b0002', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4600ab', '402881f14ee2950b014ee2ca5112000d', 'ff80808135eb88f50135eb8f55b20003', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4500aa', '402881f14ee2950b014ee2ca5112000d', '4028e30a4d5b7cee014d5b7e2fe70000', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4500a9', '402881f14ee2950b014ee2ca5112000d', '402881e63765239e0137653377ea0002', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4500a8', '402881f14ee2950b014ee2ca5112000d', '8ad6873b2bb57e99012bb5863d830002', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4400a7', '402881f14ee2950b014ee2ca5112000d', 'ff808081285bd67101285bf1359b0004', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4400a6', '402881f14ee2950b014ee2ca5112000d', 'ff808081285bd67101285bf112930003', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4400a5', '402881f14ee2950b014ee2ca5112000d', 'ff808081285bd67101285bf0867f0002', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4300a4', '402881f14ee2950b014ee2ca5112000d', '8a4583c337a0aa010137a0ac072a0002', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4300a3', '402881f14ee2950b014ee2ca5112000d', '8a4583c337a076a60137a08bad9b0007', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4300a2', '402881f14ee2950b014ee2ca5112000d', '8a4583c3379d1f0301379d34ded30002', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4200a1', '402881f14ee2950b014ee2ca5112000d', '8a4583c3379c67de01379c6a29db0003', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4200a0', '402881f14ee2950b014ee2ca5112000d', '8ad501542bc4a2c0012bc4bb9f72000a', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a42009f', '402881f14ee2950b014ee2ca5112000d', '402881e5362b134001362b51af3600ad', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a41009e', '402881f14ee2950b014ee2ca5112000d', '402881e5362b134001362b51544d00ab', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a41009d', '402881f14ee2950b014ee2ca5112000d', '402881e538c8f37b0138c8f86f9e0004', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a41009c', '402881f14ee2950b014ee2ca5112000d', '402881e638c87c160138c897b5140002', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a40009b', '402881f14ee2950b014ee2ca5112000d', '8ad5fa3c2a934f6c012a9357951d0002', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a40009a', '402881f14ee2950b014ee2ca5112000d', 'ff808081285988fe0128598943a90001', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a400099', '402881f14ee2950b014ee2ca5112000d', 'ff808081285b574601285baaa9ea0002', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a400098', '402881f14ee2950b014ee2ca5112000d', 'ff808081285b574601285baa3c3c0001', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a3f0097', '402881f14ee2950b014ee2ca5112000d', 'ff80808128598a2e0128598a43b40001', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a3f0096', '402881f14ee2950b014ee2ca5112000d', 'ff808081285981aa01285984fde90002', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a3f0095', '402881f14ee2950b014ee2ca5112000d', '1', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185d44ea003a', '8ae99b515110bfee0151185d44ea0037', '8a4583c3379c67de01379c6a29db0003', 'W', '2015-11-18 10:12:24');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185d44ea0039', '8ae99b515110bfee0151185d44ea0037', '8ad501542bc4a2c0012bc4bb9f72000a', 'W', '2015-11-18 10:12:24');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185d44ea0038', '8ae99b515110bfee0151185d44ea0037', '1', 'W', '2015-11-18 10:12:24');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151134726ef001d', '4028e3484d9a91fa014d9a9fce50006f', 'ff808081285bd67101285bf1359b0004', 'W', '2015-11-17 10:30:08');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151134726ef001c', '4028e3484d9a91fa014d9a9fce50006f', 'ff808081285bd67101285bf0867f0002', 'W', '2015-11-17 10:30:08');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151134726ef001b', '4028e3484d9a91fa014d9a9fce50006f', '8a4583c337a076a60137a08bad9b0007', 'W', '2015-11-17 10:30:08');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151134726ef001a', '4028e3484d9a91fa014d9a9fce50006f', '8a4583c3379d1f0301379d34ded30002', 'W', '2015-11-17 10:30:08');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151134726ef0019', '4028e3484d9a91fa014d9a9fce50006f', '8a4583c3379c67de01379c6a29db0003', 'W', '2015-11-17 10:30:08');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151134726ef0018', '4028e3484d9a91fa014d9a9fce50006f', '8ad501542bc4a2c0012bc4bb9f72000a', 'W', '2015-11-17 10:30:08');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151134726ef0017', '4028e3484d9a91fa014d9a9fce50006f', 'ff808081285b574601285baaa9ea0002', 'W', '2015-11-17 10:30:08');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151134726ef0016', '4028e3484d9a91fa014d9a9fce50006f', 'ff808081285b574601285baa3c3c0001', 'W', '2015-11-17 10:30:08');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151134726ef0015', '4028e3484d9a91fa014d9a9fce50006f', 'ff80808128598a2e0128598a43b40001', 'W', '2015-11-17 10:30:08');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151134726ef0014', '4028e3484d9a91fa014d9a9fce50006f', 'ff808081285981aa01285984fde90002', 'W', '2015-11-17 10:30:08');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151134726ef0013', '4028e3484d9a91fa014d9a9fce50006f', '1', 'W', '2015-11-17 10:30:08');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eeb002b', '4028e3484d9a91fa014d9a9ce0e00000', '402881f14ee2950b014ee2c76441000b', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eeb002a', '4028e3484d9a91fa014d9a9ce0e00000', '4028e3484da3ade0014da3b875200023', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eea0029', '4028e3484d9a91fa014d9a9ce0e00000', '4028e3484da3ade0014da3afcbb80001', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eea0028', '4028e3484d9a91fa014d9a9ce0e00000', '4028e3484da3ade0014da3af331b0000', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8eea0027', '4028e3484d9a91fa014d9a9ce0e00000', 'ff8080813827d78e013827dfae000004', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee90026', '4028e3484d9a91fa014d9a9ce0e00000', 'ff8080813827d78e013827deb9b60003', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee90025', '4028e3484d9a91fa014d9a9ce0e00000', 'ff8080813827d78e013827de7e380002', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee90024', '4028e3484d9a91fa014d9a9ce0e00000', '402881e437b280f90137b281f5c20002', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee80023', '4028e3484d9a91fa014d9a9ce0e00000', '8a4583c337a57ea00137a58966ee0004', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee80022', '4028e3484d9a91fa014d9a9ce0e00000', '8a4583c337a57ea00137a58855640003', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee70021', '4028e3484d9a91fa014d9a9ce0e00000', '8a4583c337a57ea00137a58d208c0007', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee70020', '4028e3484d9a91fa014d9a9ce0e00000', '8a4583c337a57ea00137a587ff1d0002', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee7001f', '4028e3484d9a91fa014d9a9ce0e00000', 'ff8080813942f9c0013942fdcd870002', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee7001e', '4028e3484d9a91fa014d9a9ce0e00000', 'ff8080813942001e0139420311820003', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee7001d', '4028e3484d9a91fa014d9a9ce0e00000', 'ff8080813942001e013942025b190002', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee6001c', '4028e3484d9a91fa014d9a9ce0e00000', '402881eb3841f6d8013841f9ea1f0005', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee6001b', '4028e3484d9a91fa014d9a9ce0e00000', '402881eb3841f6d8013841f9b2930004', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee6001a', '4028e3484d9a91fa014d9a9ce0e00000', '402881eb3841f6d8013841f925df0003', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee60019', '4028e3484d9a91fa014d9a9ce0e00000', '402881eb3841d460013841f4bb5b0002', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee50018', '4028e3484d9a91fa014d9a9ce0e00000', 'ff80808135eb88f50135eb8f55b20003', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee50017', '4028e3484d9a91fa014d9a9ce0e00000', '4028e30a4d5b7cee014d5b7e2fe70000', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee50016', '4028e3484d9a91fa014d9a9ce0e00000', '402881e63765239e0137653377ea0002', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee40015', '4028e3484d9a91fa014d9a9ce0e00000', '8ad6873b2bb57e99012bb5863d830002', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee40014', '4028e3484d9a91fa014d9a9ce0e00000', 'ff808081285bd67101285bf1359b0004', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee40013', '4028e3484d9a91fa014d9a9ce0e00000', 'ff808081285bd67101285bf112930003', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee40012', '4028e3484d9a91fa014d9a9ce0e00000', 'ff808081285bd67101285bf0867f0002', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee30011', '4028e3484d9a91fa014d9a9ce0e00000', '8a4583c337a0aa010137a0ac072a0002', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee30010', '4028e3484d9a91fa014d9a9ce0e00000', '8a4583c337a076a60137a08bad9b0007', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee3000f', '4028e3484d9a91fa014d9a9ce0e00000', '8a4583c3379d1f0301379d34ded30002', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee2000e', '4028e3484d9a91fa014d9a9ce0e00000', '8a4583c3379c67de01379c6a29db0003', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee2000d', '4028e3484d9a91fa014d9a9ce0e00000', '8ad501542bc4a2c0012bc4bb9f72000a', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee1000c', '4028e3484d9a91fa014d9a9ce0e00000', '402881e5362b134001362b51af3600ad', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee0000b', '4028e3484d9a91fa014d9a9ce0e00000', '402881e5362b134001362b51544d00ab', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee0000a', '4028e3484d9a91fa014d9a9ce0e00000', '402881e538c8f37b0138c8f86f9e0004', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee00009', '4028e3484d9a91fa014d9a9ce0e00000', '402881e638c87c160138c897b5140002', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ee00008', '4028e3484d9a91fa014d9a9ce0e00000', '8ad5fa3c2a934f6c012a9357951d0002', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8edf0007', '4028e3484d9a91fa014d9a9ce0e00000', 'ff808081285988fe0128598943a90001', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8edf0006', '4028e3484d9a91fa014d9a9ce0e00000', 'ff808081285b574601285baaa9ea0002', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8edf0005', '4028e3484d9a91fa014d9a9ce0e00000', 'ff808081285b574601285baa3c3c0001', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511872b67a00db', '8ae99b515110bfee0151185dfa110042', '8ad501542bc4a2c0012bc4bb9f72000a', 'W', '2015-11-18 10:35:49');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511872b67a00da', '8ae99b515110bfee0151185dfa110042', '1', 'W', '2015-11-18 10:35:49');
INSERT INTO `sys_role_menu` VALUES ('8ae99b51511de52301512e402ded0006', '8ae99b51511de52301512e402ded0003', '8a4583c3379c67de01379c6a29db0003', 'W', '2015-11-22 16:12:16');
INSERT INTO `sys_role_menu` VALUES ('8ae99b51511de52301512e402ded0005', '8ae99b51511de52301512e402ded0003', '8ad501542bc4a2c0012bc4bb9f72000a', 'W', '2015-11-22 16:12:16');
INSERT INTO `sys_role_menu` VALUES ('8ae99b51511de52301512e402ded0004', '8ae99b51511de52301512e402ded0003', '1', 'W', '2015-11-22 16:12:16');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511874b121010e', '8ae99b515110bfee0151185e8430004f', 'ff808081285bd67101285bf1359b0004', 'W', '2015-11-18 10:37:59');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511874b1210107', '8ae99b515110bfee0151185e8430004f', '1', 'W', '2015-11-18 10:37:59');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511874b121010d', '8ae99b515110bfee0151185e8430004f', 'ff808081285bd67101285bf0867f0002', 'W', '2015-11-18 10:37:59');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511874b121010c', '8ae99b515110bfee0151185e8430004f', '8a4583c337a0aa010137a0ac072a0002', 'W', '2015-11-18 10:37:59');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511874b121010b', '8ae99b515110bfee0151185e8430004f', '8a4583c337a076a60137a08bad9b0007', 'W', '2015-11-18 10:37:59');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511874b121010a', '8ae99b515110bfee0151185e8430004f', '8a4583c3379d1f0301379d34ded30002', 'W', '2015-11-18 10:37:59');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511874b1210109', '8ae99b515110bfee0151185e8430004f', '8a4583c3379c67de01379c6a29db0003', 'W', '2015-11-18 10:37:59');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511874b1210108', '8ae99b515110bfee0151185e8430004f', '8ad501542bc4a2c0012bc4bb9f72000a', 'W', '2015-11-18 10:37:59');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511872b67a00e3', '8ae99b515110bfee0151185dfa110042', '402881fb50ad66680150ad77e3dc0001', 'W', '2015-11-18 10:35:49');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511872b67a00e2', '8ae99b515110bfee0151185dfa110042', '402881fb50ad66680150ad77a21b0000', 'W', '2015-11-18 10:35:49');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185fda980067', '8ae99b515110bfee0151185fda980066', '1', 'W', '2015-11-18 10:15:13');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185fda980068', '8ae99b515110bfee0151185fda980066', '8ad501542bc4a2c0012bc4bb9f72000a', 'W', '2015-11-18 10:15:13');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185fda980069', '8ae99b515110bfee0151185fda980066', '8a4583c3379c67de01379c6a29db0003', 'W', '2015-11-18 10:15:13');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185fda98006a', '8ae99b515110bfee0151185fda980066', '8a4583c3379d1f0301379d34ded30002', 'W', '2015-11-18 10:15:13');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185fda98006b', '8ae99b515110bfee0151185fda980066', '8a4583c337a076a60137a08bad9b0007', 'W', '2015-11-18 10:15:13');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185fda98006c', '8ae99b515110bfee0151185fda980066', '8a4583c337a0aa010137a0ac072a0002', 'W', '2015-11-18 10:15:13');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185fda98006d', '8ae99b515110bfee0151185fda980066', '402881f14ee2950b014ee2c76441000b', 'W', '2015-11-18 10:15:13');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185fda98006e', '8ae99b515110bfee0151185fda980066', '402881f14ee34f5d014ee3519d010000', 'W', '2015-11-18 10:15:13');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185fda98006f', '8ae99b515110bfee0151185fda980066', '2c928a40507ac98a01507ad1745f0000', 'W', '2015-11-18 10:15:13');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185fda980070', '8ae99b515110bfee0151185fda980066', '2c928a40507ac98a01507ad4c9760062', 'W', '2015-11-18 10:15:13');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185fda980071', '8ae99b515110bfee0151185fda980066', '2c928a40507ac98a01507ad591770063', 'W', '2015-11-18 10:15:13');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151185fda980072', '8ae99b515110bfee0151185fda980066', '2c928a40507ac98a01507ad5d4090064', 'W', '2015-11-18 10:15:13');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511860f4840074', '8ae99b515110bfee01511860f4840073', '1', 'W', '2015-11-18 10:16:25');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511860f4840075', '8ae99b515110bfee01511860f4840073', '8ad501542bc4a2c0012bc4bb9f72000a', 'W', '2015-11-18 10:16:25');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511860f4840076', '8ae99b515110bfee01511860f4840073', '8a4583c3379c67de01379c6a29db0003', 'W', '2015-11-18 10:16:25');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511860f4840077', '8ae99b515110bfee01511860f4840073', '8a4583c3379d1f0301379d34ded30002', 'W', '2015-11-18 10:16:25');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511860f4840078', '8ae99b515110bfee01511860f4840073', '8a4583c337a076a60137a08bad9b0007', 'W', '2015-11-18 10:16:25');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511860f4840079', '8ae99b515110bfee01511860f4840073', '8a4583c337a0aa010137a0ac072a0002', 'W', '2015-11-18 10:16:25');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511860f484007a', '8ae99b515110bfee01511860f4840073', '402881fb50a3fdf70150a40706c00004', 'W', '2015-11-18 10:16:25');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511860f484007b', '8ae99b515110bfee01511860f4840073', '402881fb50a3fdf70150a40867c60006', 'W', '2015-11-18 10:16:25');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511860f484007c', '8ae99b515110bfee01511860f4840073', '402881fb50a42a970150a42c726f0000', 'W', '2015-11-18 10:16:25');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511864c5ff0090', '8ae99b515110bfee01511864181b007d', '8a4583c337a0aa010137a0ac072a0002', 'W', '2015-11-18 10:20:36');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511864c5ff008f', '8ae99b515110bfee01511864181b007d', '8a4583c337a076a60137a08bad9b0007', 'W', '2015-11-18 10:20:36');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511864c5ff008e', '8ae99b515110bfee01511864181b007d', '8a4583c3379d1f0301379d34ded30002', 'W', '2015-11-18 10:20:36');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511864c5ff008d', '8ae99b515110bfee01511864181b007d', '8a4583c3379c67de01379c6a29db0003', 'W', '2015-11-18 10:20:36');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511864c5ff008c', '8ae99b515110bfee01511864181b007d', '8ad501542bc4a2c0012bc4bb9f72000a', 'W', '2015-11-18 10:20:36');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511864c5ff008b', '8ae99b515110bfee01511864181b007d', '1', 'W', '2015-11-18 10:20:36');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511864c5ff0091', '8ae99b515110bfee01511864181b007d', 'ff808081285bd67101285bf0867f0002', 'W', '2015-11-18 10:20:36');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511864c5ff0092', '8ae99b515110bfee01511864181b007d', 'ff808081285bd67101285bf1359b0004', 'W', '2015-11-18 10:20:36');
INSERT INTO `sys_role_menu` VALUES ('8ae99b51511de52301512e402ded000c', '8ae99b51511de52301512e402ded0003', '402881fb50a42a970150a42c726f0000', 'W', '2015-11-22 16:12:16');
INSERT INTO `sys_role_menu` VALUES ('8ae99b51511de52301512e402ded000b', '8ae99b51511de52301512e402ded0003', '402881fb50a3fdf70150a40740120005', 'W', '2015-11-22 16:12:16');
INSERT INTO `sys_role_menu` VALUES ('8ae99b51511de52301512e402ded0009', '8ae99b51511de52301512e402ded0003', '8a4583c337a0aa010137a0ac072a0002', 'W', '2015-11-22 16:12:16');
INSERT INTO `sys_role_menu` VALUES ('8ae99b51511de52301512e402ded000a', '8ae99b51511de52301512e402ded0003', '402881fb50a3fdf70150a40706c00004', 'W', '2015-11-22 16:12:16');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511866f57100b9', '8ae99b515110bfee01511866f57100b1', 'ff808081285bd67101285bf1359b0004', 'W', '2015-11-18 10:22:59');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511866f57100b8', '8ae99b515110bfee01511866f57100b1', 'ff808081285bd67101285bf0867f0002', 'W', '2015-11-18 10:22:59');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511866f57100b7', '8ae99b515110bfee01511866f57100b1', '8a4583c337a0aa010137a0ac072a0002', 'W', '2015-11-18 10:22:59');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511866f57100b6', '8ae99b515110bfee01511866f57100b1', '8a4583c337a076a60137a08bad9b0007', 'W', '2015-11-18 10:22:59');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511866f57100b5', '8ae99b515110bfee01511866f57100b1', '8a4583c3379d1f0301379d34ded30002', 'W', '2015-11-18 10:22:59');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511866f57100b4', '8ae99b515110bfee01511866f57100b1', '8a4583c3379c67de01379c6a29db0003', 'W', '2015-11-18 10:22:59');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511866f57100b3', '8ae99b515110bfee01511866f57100b1', '8ad501542bc4a2c0012bc4bb9f72000a', 'W', '2015-11-18 10:22:59');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee01511866f57100b2', '8ae99b515110bfee01511866f57100b1', '1', 'W', '2015-11-18 10:22:59');
INSERT INTO `sys_role_menu` VALUES ('8ae99b51511de52301512e402ded0008', '8ae99b51511de52301512e402ded0003', '8a4583c337a076a60137a08bad9b0007', 'W', '2015-11-22 16:12:16');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151186aaad800c6', '8ae99b515110bfee0151186aaad800c5', '1', 'W', '2015-11-18 10:27:02');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151186aaad800c7', '8ae99b515110bfee0151186aaad800c5', '8ad501542bc4a2c0012bc4bb9f72000a', 'W', '2015-11-18 10:27:02');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151186aaad800c8', '8ae99b515110bfee0151186aaad800c5', '8a4583c3379c67de01379c6a29db0003', 'W', '2015-11-18 10:27:02');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151186aaad800c9', '8ae99b515110bfee0151186aaad800c5', '8a4583c3379d1f0301379d34ded30002', 'W', '2015-11-18 10:27:02');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151186aaad800ca', '8ae99b515110bfee0151186aaad800c5', '8a4583c337a076a60137a08bad9b0007', 'W', '2015-11-18 10:27:02');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151186aaad800cb', '8ae99b515110bfee0151186aaad800c5', '8a4583c337a0aa010137a0ac072a0002', 'W', '2015-11-18 10:27:02');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151186aaad800cc', '8ae99b515110bfee0151186aaad800c5', '402881f14ee2950b014ee2c76441000b', 'W', '2015-11-18 10:27:02');
INSERT INTO `sys_role_menu` VALUES ('8ae99b515110bfee0151186aaad800cd', '8ae99b515110bfee0151186aaad800c5', '2c928a40507ac98a01507ad5d4090064', 'W', '2015-11-18 10:27:02');
INSERT INTO `sys_role_menu` VALUES ('8ae99b51511de52301512e402ded0007', '8ae99b51511de52301512e402ded0003', '8a4583c3379d1f0301379d34ded30002', 'W', '2015-11-22 16:12:16');
INSERT INTO `sys_role_menu` VALUES ('8ae99b51512f5c8501514724f1160024', '8ae99b51511de52301512e40e3ff000d', '8a4583c337a0aa010137a0ac072a0002', 'W', '2015-11-27 12:13:02');
INSERT INTO `sys_role_menu` VALUES ('8ae99b51512f5c8501514724f1160023', '8ae99b51511de52301512e40e3ff000d', '8a4583c337a076a60137a08bad9b0007', 'W', '2015-11-27 12:13:02');
INSERT INTO `sys_role_menu` VALUES ('8ae99b51512f5c8501514724f1160022', '8ae99b51511de52301512e40e3ff000d', '8a4583c3379d1f0301379d34ded30002', 'W', '2015-11-27 12:13:02');
INSERT INTO `sys_role_menu` VALUES ('8ae99b51512f5c8501514724f1160021', '8ae99b51511de52301512e40e3ff000d', '8a4583c3379c67de01379c6a29db0003', 'W', '2015-11-27 12:13:02');
INSERT INTO `sys_role_menu` VALUES ('8ae99b51512f5c8501514724f116001f', '8ae99b51511de52301512e40e3ff000d', '1', 'W', '2015-11-27 12:13:02');
INSERT INTO `sys_role_menu` VALUES ('8ae99b51512f5c8501514724f1160020', '8ae99b51511de52301512e40e3ff000d', '8ad501542bc4a2c0012bc4bb9f72000a', 'W', '2015-11-27 12:13:02');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8edf0004', '4028e3484d9a91fa014d9a9ce0e00000', 'ff80808128598a2e0128598a43b40001', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ede0003', '4028e3484d9a91fa014d9a9ce0e00000', 'ff808081285981aa01285984fde90002', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0d8ede0002', '4028e3484d9a91fa014d9a9ce0e00000', '1', 'W', '2016-01-04 17:52:41');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4d00c1', '402881f14ee2950b014ee2ca5112000d', '2c928a40507ac98a01507ad4c9760062', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4e00c2', '402881f14ee2950b014ee2ca5112000d', '2c928a40507ac98a01507ad591770063', 'W', '2016-01-04 17:54:26');
INSERT INTO `sys_role_menu` VALUES ('4028813c520bfda201520c0f2a4e00c3', '402881f14ee2950b014ee2ca5112000d', '2c928a40507ac98a01507ad5d4090064', 'W', '2016-01-04 17:54:26');

-- ----------------------------
-- Table structure for sys_rule_setting
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_setting`;
CREATE TABLE `sys_rule_setting` (
  `ID` varchar(32) NOT NULL,
  `RULE_CODE` varchar(10) DEFAULT NULL,
  `RULE_TYPE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rule_setting
-- ----------------------------
INSERT INTO `sys_rule_setting` VALUES ('4028823c3b6e9256013b6e9a089c0001', 'Y', 'login');
INSERT INTO `sys_rule_setting` VALUES ('4028823c3b6e9256013b6e9a16960002', 'Y', 'loginLog');
INSERT INTO `sys_rule_setting` VALUES ('ff80808138d745a60138d7484b000002', 'Y', 'accessLog');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `ID` varchar(32) NOT NULL,
  `DEPE_ID` varchar(32) DEFAULT NULL,
  `USER_NAME` varchar(20) DEFAULT NULL,
  `EN_USER_NAME` varchar(20) DEFAULT NULL,
  `PASS_WORD` varchar(32) DEFAULT NULL,
  `LOGIN_NAME` varchar(12) DEFAULT NULL COMMENT '¼û',
  `IS_LEADER` char(1) DEFAULT NULL COMMENT '1ǣ2',
  `IS_ONLINE` char(1) DEFAULT NULL COMMENT '12',
  `IP_ADDRESS` varchar(24) DEFAULT NULL,
  `IS_KEY_LOGIN` char(1) DEFAULT NULL,
  `ENTRANCE_TIME` varchar(20) DEFAULT NULL COMMENT 'ְʱ',
  `CPHONE` varchar(20) DEFAULT NULL COMMENT '˾绰',
  `OPHONE` varchar(15) DEFAULT NULL COMMENT '绰',
  `QQ` varchar(15) DEFAULT NULL,
  `MSN` varchar(60) DEFAULT NULL,
  `BIRTHDAY` varchar(24) DEFAULT NULL,
  `STATUS` char(1) DEFAULT NULL COMMENT 'ְ״̬,1ְ2ְ34',
  `ADDRESS_HOME` varchar(100) DEFAULT NULL COMMENT 'סַ',
  `HPHONE` varchar(15) DEFAULT NULL COMMENT 'ͥ绰',
  `SEX` char(1) DEFAULT NULL COMMENT 'Ա',
  `REGISTER_TIME` varchar(20) DEFAULT NULL COMMENT 'עʱ',
  `DIMISSION_TIME` varchar(20) DEFAULT NULL,
  `MPHONE` varchar(15) DEFAULT NULL COMMENT 'ƶ绰',
  `ADDRESS_BIRTH` varchar(100) DEFAULT NULL,
  `POST_CODE` varchar(6) DEFAULT NULL,
  `WORK_PLACE` varchar(200) DEFAULT NULL,
  `MAILBOX` varchar(50) DEFAULT NULL,
  `MAIL_BOX_PASSWORD` varchar(32) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL COMMENT 'ʱ',
  `IS_DELETE` char(1) DEFAULT '1' COMMENT '0ɾ1ɾĬ1',
  `STATE` char(1) DEFAULT '1' COMMENT '״̬,01Ĭ1',
  `MYSELF_DESK` varchar(100) DEFAULT NULL COMMENT '自定义桌面',
  `USER_ROLE_TYPE` varchar(2) DEFAULT NULL,
  `REMARK` varchar(256) DEFAULT NULL COMMENT 'עϢ',
  `IDCARD` varchar(20) DEFAULT NULL,
  `COMMISSIONER_CODE` varchar(30) DEFAULT NULL,
  `PRACTICE_CODE` varchar(30) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Relationship_7` (`DEPE_ID`) USING BTREE,
  KEY `FKA510FE1D26CFC0BF` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKA510FE1DCC7C9931` (`DEPE_ID`) USING BTREE,
  KEY `FKA510FE1D9B6243F6` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKA510FE1D410F1C68` (`DEPE_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('4028e3484d9a91fa014d9aa14cec0080', '4028e3484d9a91fa014d9aa830040095', '超级管理员', 'Superman', '116111bcaee723aa76a0b9b52ef6366c', 'superman', null, null, null, null, null, null, '', null, null, '', null, null, null, 'M', '2015-05-28', null, '', null, null, '', 'superman@126.com', null, null, '2015-05-28 21:06:11', '1', '1', 'msgboard, news, gonggao, peixun, huodong, xiance', 'N', null, null, null, null, 'zzfy');
INSERT INTO `sys_user` VALUES ('4028e3484d9ab700014d9ad53d800003', '4028e3484d9a91fa014d9aa830040095', '管理员', 'Administrator', '116111bcaee723aa76a0b9b52ef6366c', 'admin', null, null, null, null, null, null, '', null, null, '', null, null, null, 'M', '2015-05-28', null, '', null, null, '', 'admin@126.com', null, null, '2015-05-28 22:02:55', '1', '1', null, 'N', null, null, null, null, 'zzfy');
INSERT INTO `sys_user` VALUES ('8a4583c3379d08e101379d0e3dfe0002', '1', '系统管理员', 'System', '116111bcaee723aa76a0b9b52ef6366c', 'system', null, null, null, null, null, null, '15901010538', '372566232', 'yestsli@gmail.com', '1984-04-29', null, null, null, 'M', '2012-03-30', null, '15901010538', null, null, '北京', 'xichenlong@126.com', '111111', null, '2012-05-30 17:23:05', '1', '1', 'msgboard', 'Y', null, null, null, null, 'zzfy');
INSERT INTO `sys_user` VALUES ('4028813c5257c970015257cc08f80003', '4028813c5253a1ea015253a388cd0000', 'xinzheng3', null, '116111bcaee723aa76a0b9b52ef6366c', 'xinzhegn3', null, null, null, null, null, null, null, null, null, null, null, null, null, 'M', null, null, '', null, null, '', '', null, null, '2016-01-19 10:52:15', '1', '1', null, null, null, null, null, null, 'xzfy');
INSERT INTO `sys_user` VALUES ('4028813c5257c970015257cb856e0002', '4028813c5238b93d0152391ae8c2000a', 'xinzheng2', null, '116111bcaee723aa76a0b9b52ef6366c', 'xinzheng2', null, null, null, null, null, null, null, null, null, null, null, null, null, 'M', null, null, '', null, null, '', '', null, null, '2016-01-19 10:51:41', '1', '1', null, null, null, null, null, null, 'xzfy');
INSERT INTO `sys_user` VALUES ('4028813c52578f3701525791fdd80000', '4028813c5238b93d0152391366130006', 'zhengzhou3', null, '116111bcaee723aa76a0b9b52ef6366c', 'zhengzhou3', null, null, null, null, null, null, null, null, null, null, null, null, null, 'M', null, null, '', null, null, '', '', null, null, '2016-01-19 09:48:51', '1', '1', null, null, null, null, null, null, 'zzfy');
INSERT INTO `sys_user` VALUES ('4028813c5238b93d015238ba8e510000', '4028e3484d9a91fa014d9aa830040095', '123456', null, '116111bcaee723aa76a0b9b52ef6366c', '123456', null, null, null, null, null, null, null, null, null, null, null, null, null, 'M', null, null, '15315890371', null, null, '北京易云华控腾讯部分', '', null, null, '2016-01-13 10:04:56', '1', '1', null, null, null, '410184196305171676', null, null, 'xzfy');
INSERT INTO `sys_user` VALUES ('4028813c5210bbe0015210ece0830000', '2', '张丰', null, 'dcdbf16b8a227625c7db49880d91cf4a', 'zhangy', null, null, null, null, null, null, null, null, null, null, null, null, null, 'M', null, null, '18631123856', null, null, '河南省新郑市新华路第二街道 ', '', null, null, '2016-01-05 16:35:05', '1', '1', null, null, null, '412727198209098022', null, null, 'zzfy');
INSERT INTO `sys_user` VALUES ('4028813c52430f3b01524485ea700007', '4028813c5238b93d015239190a210009', 'huiji', null, '116111bcaee723aa76a0b9b52ef6366c', 'huiji', null, null, null, null, null, null, null, null, null, null, null, null, null, 'M', null, null, '', null, null, '', '', null, null, '2016-01-15 17:02:53', '1', '1', null, null, null, null, null, null, 'hjfy');
INSERT INTO `sys_user` VALUES ('4028813c525278a801525286d0f50003', '4028813c525278a801525284be6e0002', 'zhongyuan', null, '116111bcaee723aa76a0b9b52ef6366c', 'zhongyuan', null, null, null, null, null, null, null, null, null, null, null, null, null, 'M', null, null, '', null, null, '', '', null, null, '2016-01-18 10:18:33', '1', '1', null, null, null, null, null, null, 'zyfy');
INSERT INTO `sys_user` VALUES ('4028813c52430f3b015244858c870006', '4028813c5238b93d0152391862af0008', 'xingyang', null, '116111bcaee723aa76a0b9b52ef6366c', 'xingyang', null, null, null, null, null, null, null, null, null, null, null, null, null, 'M', null, null, '', null, null, '', '', null, null, '2016-01-15 17:02:28', '1', '1', null, null, null, null, null, null, 'xyfy');
INSERT INTO `sys_user` VALUES ('4028813c52430f3b015244853f500005', '4028813c5238b93d01523915d7ee0007', 'xinzheng', null, '116111bcaee723aa76a0b9b52ef6366c', 'xinzheng', null, null, null, null, null, null, null, null, null, null, null, null, null, 'M', null, null, '', null, null, '', '', null, null, '2016-01-15 17:02:09', '1', '1', null, null, null, null, null, null, 'xzfy');
INSERT INTO `sys_user` VALUES ('4028813c523e21e101523e2346bb0000', '2', '北京易云华控研发部门', null, '116111bcaee723aa76a0b9b52ef6366c', 'shagnsu', null, null, null, null, null, null, '', '', '', '', null, null, null, 'M', null, null, '15315890371', null, null, '北京易云华控技术有限公司河北分公司', '', null, null, '2016-01-14 11:17:25', '1', '1', null, null, null, '410184196305171676', null, null, 'zzfy');
INSERT INTO `sys_user` VALUES ('4028813c52430f3b01524484dd6e0004', '4028813c5238b93d0152391366130006', 'zhengzhou', null, '116111bcaee723aa76a0b9b52ef6366c', 'zhengzhou', null, null, null, null, null, null, null, null, null, null, null, null, null, 'M', null, null, '', null, null, '', '', null, null, '2016-01-15 17:01:44', '1', '1', null, null, null, null, null, null, 'zzfy');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `USER_ID` varchar(32) NOT NULL DEFAULT '',
  `ROLE_ID` varchar(32) NOT NULL DEFAULT '',
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `ORDER_NUM` int(11) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`ROLE_ID`),
  KEY `FKAABB7D58C1F27122` (`ROLE_ID`) USING BTREE,
  KEY `FKAABB7D58671D3502` (`USER_ID`) USING BTREE,
  KEY `FKAABB7D583684F459` (`ROLE_ID`) USING BTREE,
  KEY `FKAABB7D58DBAFB839` (`USER_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('8a4583c3379d08e101379d0e3dfe0002', '0', null, null);
INSERT INTO `sys_user_role` VALUES ('4028e3484d9ab700014d9ad53d800003', '4028e3484d9a91fa014d9a9fce50006f', null, null);
INSERT INTO `sys_user_role` VALUES ('4028e3484d9a91fa014d9aa14cec0080', '4028e3484d9a91fa014d9a9ce0e00000', null, null);
INSERT INTO `sys_user_role` VALUES ('8ae99b515105951901510eba9bad0002', '4028e3484d9a91fa014d9aa0414a007a', null, null);
INSERT INTO `sys_user_role` VALUES ('4028813c5257c970015257cc08f80003', '8ae99b515110bfee0151185e8430004f', null, null);
INSERT INTO `sys_user_role` VALUES ('4028813c5257c970015257cb856e0002', '4028e3484d9a91fa014d9a9fce50006f', null, null);
INSERT INTO `sys_user_role` VALUES ('4028813c52578f3701525791fdd80000', '4028e3484d9a91fa014d9a9ce0e00000', null, null);
INSERT INTO `sys_user_role` VALUES ('4028813c5238b93d015238ba8e510000', '4028e3484d9a91fa014d9a9ce0e00000', null, null);
INSERT INTO `sys_user_role` VALUES ('4028813c525278a801525286d0f50003', '8ae99b515110bfee0151185e8430004f', null, null);
INSERT INTO `sys_user_role` VALUES ('4028813c5234d1e1015234daaecc0000', '4028e3484d9a91fa014d9aa0414a007a', null, null);
INSERT INTO `sys_user_role` VALUES ('4028813c5210bbe0015210ece0830000', '4028e3484d9a91fa014d9aa0414a007a', null, null);
INSERT INTO `sys_user_role` VALUES ('4028813c52430f3b01524485ea700007', '8ae99b515110bfee0151185e8430004f', null, null);
INSERT INTO `sys_user_role` VALUES ('4028813c52430f3b015244858c870006', '8ae99b515110bfee0151185e8430004f', null, null);
INSERT INTO `sys_user_role` VALUES ('4028813c52430f3b015244853f500005', '8ae99b515110bfee0151185e8430004f', null, null);
INSERT INTO `sys_user_role` VALUES ('4028813c52430f3b01524484dd6e0004', '8ae99b515110bfee0151185e8430004f', null, null);
INSERT INTO `sys_user_role` VALUES ('4028813c523e21e101523e2346bb0000', '4028e3484d9a91fa014d9aa0414a007a', null, null);
INSERT INTO `sys_user_role` VALUES ('4028813c52578ae40152578d63f00000', '4028e3484d9a91fa014d9a9ce0e00000', null, null);

-- ----------------------------
-- Table structure for upload_file
-- ----------------------------
DROP TABLE IF EXISTS `upload_file`;
CREATE TABLE `upload_file` (
  `ID` varchar(32) NOT NULL,
  `OWNER_ID` varchar(32) DEFAULT NULL,
  `UPLOAD_FILE_NAME` varchar(128) DEFAULT NULL,
  `UPLOAD_CONTENT_TYPE` varchar(100) DEFAULT NULL,
  `UPLOAD_FILE_SIZE` varchar(32) DEFAULT NULL,
  `UPLOAD_FILE_PATH` varchar(128) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL COMMENT 'ʱ',
  `REMARK` varchar(256) DEFAULT NULL COMMENT 'עϢ',
  `IS_DELETE` char(1) DEFAULT '1' COMMENT '0ɾ1ɾĬ1',
  `STATE` char(1) DEFAULT '1' COMMENT '״̬,01Ĭ1',
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKC18ABCFA26CFC0BF` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKC18ABCFA9B6243F6` (`CREATE_USER_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ļ';

-- ----------------------------
-- Records of upload_file
-- ----------------------------
INSERT INTO `upload_file` VALUES ('4028813c5214e1d7015214e3297f0001', '4028813c5214e1d7015214e328ee0000', '查询排期新版.xls', 'application/vnd.ms-excel', '24KB', 'uploadfile/cms/article/picture/b831cad0-b3f0-4d76-b265-a7706bbb7bb0.xls', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-06 11:02:57', null, '1', '1', null);
INSERT INTO `upload_file` VALUES ('4028813c5214eee1015214ef654a0001', '4028813c5214eee1015214ef652e0000', '查询排期新版.xls', 'application/vnd.ms-excel', '24KB', 'uploadfile/cms/article/picture/826f4c83-4629-4451-8213-5212d263213f.xls', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-06 11:16:19', null, '1', '1', null);
INSERT INTO `upload_file` VALUES ('4028813c5214eee101521505833f0004', '4028813c5214eee10152150583380003', '查询排期新版1.xls', 'application/vnd.ms-excel', '18KB', 'uploadfile/cms/article/picture/aad1c678-34cb-4b7e-a067-393b2909c25f.xls', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-06 11:40:28', null, '1', '1', null);
INSERT INTO `upload_file` VALUES ('4028813c523a004901523a045a570003', '4028813c523a004901523a0458df0002', 'index_04.jpg', 'image/jpeg', '201KB', 'uploadfile/cms/article/picture/d6d3b3ad-1a21-4d59-9564-1512016adda2.jpg', '4028813c5238b93d015238ba8e510000', '2016-01-13 16:05:09', null, '1', '1', null);
INSERT INTO `upload_file` VALUES ('4028813c523f631201523f64a6880001', '4028813c523f631201523f64a6300000', '查询排期新版1.xls', 'application/vnd.ms-excel', '24KB', 'uploadfile/cms/article/picture/05c216b0-335e-4237-bf57-1cc976d2df33.xls', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-14 17:08:26', null, '1', '1', null);
INSERT INTO `upload_file` VALUES ('4028813c523f86d001523f880ce00001', '4028813c523f86d001523f880ca60000', '查询排期新版1.xls', 'application/vnd.ms-excel', '24KB', 'uploadfile/cms/article/picture/595b00ec-b018-408a-813c-db5ad66626e0.xls', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-14 17:47:06', null, '1', '1', null);
INSERT INTO `upload_file` VALUES ('4028813c525278a801525281dffc0000', '4028813c523e21e101523e2346bb0000', '16.png', 'image/png', '8KB', 'uploadfile/system/user/abef227d-77bb-4597-b0e1-e4e7f6040eba.png', '4028813c523e21e101523e2346bb0000', '2016-01-18 10:13:09', null, '1', '1', null);
INSERT INTO `upload_file` VALUES ('4028813c525cb7d201525cec2b980007', '4028e3484d9a91fa014d9aa14cec0080', '16.png', 'image/png', '8KB', 'uploadfile/system/user/5eb18dab-d4fd-4e85-8808-e96afe9f16ef.png', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-20 10:45:27', null, '1', '1', null);

-- ----------------------------
-- Table structure for upload_video
-- ----------------------------
DROP TABLE IF EXISTS `upload_video`;
CREATE TABLE `upload_video` (
  `ID` varchar(32) NOT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `AGENCY_JUDGER` varchar(200) DEFAULT NULL,
  `BRIEF` varchar(200) DEFAULT NULL,
  `FIREST_JUDGE` varchar(200) DEFAULT NULL,
  `ISSUE_TIME` longtext,
  `JUDGER` varchar(200) DEFAULT NULL,
  `JUROR` varchar(200) DEFAULT NULL,
  `KEYWORD` varchar(200) DEFAULT NULL,
  `REMARK` longtext,
  `SITE` varchar(200) DEFAULT NULL,
  `SMALL_TITLE` varchar(200) DEFAULT NULL,
  `SOCIETY_JUDGER` varchar(200) DEFAULT NULL,
  `TIME` varchar(200) DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `VIDEO_INTRO` varchar(200) DEFAULT NULL,
  `VIDEO_SITE` longtext,
  `VIDEO_TYPE` varchar(200) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `COURTROOM` varchar(100) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload_video
-- ----------------------------

-- ----------------------------
-- Table structure for user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE `user_login_log` (
  `ID` varchar(32) NOT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `LOGIN_TIME` varchar(20) DEFAULT NULL,
  `LOGOUT_TIME` varchar(20) DEFAULT NULL,
  `ONLINE_TIME_LENGTH` varchar(20) DEFAULT NULL,
  `LOGIN_IP` varchar(20) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL COMMENT 'ʱ',
  `REMARK` varchar(256) DEFAULT NULL COMMENT 'עϢ',
  `IS_DELETE` char(1) DEFAULT '1' COMMENT '0ɾ1ɾĬ1',
  `STATE` char(1) DEFAULT '1' COMMENT '״̬,01Ĭ1',
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKFE345DBA671D3502` (`USER_ID`) USING BTREE,
  KEY `FKFE345DBA26CFC0BF` (`CREATE_USER_ID`) USING BTREE,
  KEY `FKFE345DBADBAFB839` (`USER_ID`) USING BTREE,
  KEY `FKFE345DBA9B6243F6` (`CREATE_USER_ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_login_log
-- ----------------------------
INSERT INTO `user_login_log` VALUES ('4028813c52338872015233a197830000', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-12 09:58:29', '2016-01-12 10:19:34', '21', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-12 09:58:29', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5234d1e1015234dc1ea30001', '4028813c5234d1e1015234daaecc0000', '2016-01-12 16:01:32', '2016-01-12 16:03:07', '1', '127.0.0.1', '4028813c5234d1e1015234daaecc0000', '2016-01-12 16:01:32', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5234d1e1015234f08c3b000a', '4028813c5234d1e1015234dcbc650002', '2016-01-12 16:03:47', '2016-01-12 16:25:25', '21', '127.0.0.1', '4028813c5234d1e1015234dcbc650002', '2016-01-12 16:03:47', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5234d1e1015234feae02000b', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-12 16:25:37', '2016-01-12 16:40:51', '15', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-12 16:25:37', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c523531db0152353fb3910000', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-12 17:37:24', '2016-01-12 17:51:53', '14', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-12 17:37:24', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5238b93d0152391c46ef000b', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 10:18:19', '2016-01-13 11:51:40', '33', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 10:18:19', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c52391e41015239b862880000', '4028813c5238b93d015238ba8e510000', '2016-01-13 11:54:14', '2016-01-13 14:42:10', '47', '127.0.0.1', '4028813c5238b93d015238ba8e510000', '2016-01-13 11:54:14', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5239bc38015239bf8ec50001', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 14:47:37', '2016-01-13 14:50:01', '2', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 14:47:37', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5239c04f015239c445f10000', '4028813c5238b93d015238ba8e510000', '2016-01-13 14:51:56', '2016-01-13 14:55:10', '3', '127.0.0.1', '4028813c5238b93d015238ba8e510000', '2016-01-13 14:51:56', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5239c04f015239c4e3140001', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 14:55:41', '2016-01-13 14:55:50', '0', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 14:55:41', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5239c04f015239caeccd0002', '4028813c5238b93d015238ba8e510000', '2016-01-13 14:56:02', '2016-01-13 15:02:26', '6', '127.0.0.1', '4028813c5238b93d015238ba8e510000', '2016-01-13 14:56:02', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5239cd93015239d2eb760000', '4028813c5238b93d015238ba8e510000', '2016-01-13 15:06:54', '2016-01-13 15:11:10', '4', '127.0.0.1', '4028813c5238b93d015238ba8e510000', '2016-01-13 15:06:54', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5239cd93015239dea8d50001', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 15:13:33', '2016-01-13 15:23:59', '10', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 15:13:33', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5239cd93015239e135f80002', '4028813c5238b93d015238ba8e510000', '2016-01-13 15:24:24', '2016-01-13 15:26:46', '2', '127.0.0.1', '4028813c5238b93d015238ba8e510000', '2016-01-13 15:24:24', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5239cd93015239e3f1ed0003', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 15:28:56', '2016-01-13 15:29:45', '0', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 15:28:56', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5239f523015239f596d40000', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 15:48:59', '2016-01-13 15:49:02', '0', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-13 15:48:59', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5239f523015239f7e4e10001', '4028813c5238b93d015238ba8e510000', '2016-01-13 15:51:30', '2016-01-13 15:51:33', '0', '127.0.0.1', '4028813c5238b93d015238ba8e510000', '2016-01-13 15:51:30', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5239f523015239f82be40002', '4028813c5238b93d015238ba8e510000', '2016-01-13 15:51:44', '2016-01-13 15:51:51', '0', '127.0.0.1', '4028813c5238b93d015238ba8e510000', '2016-01-13 15:51:44', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5239f523015239f868e20003', '4028813c5238b93d015238ba8e510000', '2016-01-13 15:52:04', '2016-01-13 15:52:07', '0', '127.0.0.1', '4028813c5238b93d015238ba8e510000', '2016-01-13 15:52:04', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5239f523015239fe57050004', '4028813c5238b93d015238ba8e510000', '2016-01-13 15:52:38', '2016-01-13 15:58:35', '5', '127.0.0.1', '4028813c5238b93d015238ba8e510000', '2016-01-13 15:52:38', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c523a004901523a02d6f10000', '4028813c5238b93d015238ba8e510000', '2016-01-13 16:03:26', '2016-01-13 16:03:30', '0', '127.0.0.1', '4028813c5238b93d015238ba8e510000', '2016-01-13 16:03:26', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c523a004901523a03198a0001', '4028813c5238b93d015238ba8e510000', '2016-01-13 16:03:44', '2016-01-13 16:03:47', '0', '127.0.0.1', '4028813c5238b93d015238ba8e510000', '2016-01-13 16:03:44', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c523e2e2601523e33102a0008', '4028813c523e21e101523e2346bb0000', '2016-01-14 11:29:37', '2016-01-14 11:34:39', '5', '127.0.0.1', '4028813c523e21e101523e2346bb0000', '2016-01-14 11:29:37', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c523e2e2601523e333b490009', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-14 11:34:48', '2016-01-14 11:34:50', '0', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-14 11:34:48', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c523e2e2601523e3772e1000b', '4028813c5238b93d015238ba8e510000', '2016-01-14 11:34:57', '2016-01-14 11:39:27', '4', '127.0.0.1', '4028813c5238b93d015238ba8e510000', '2016-01-14 11:34:57', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c52430f3b0152447bdda60001', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-15 11:51:04', '2016-01-15 16:51:54', '0', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-15 11:51:04', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c52430f3b01524483ec270003', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-15 16:59:58', '2016-01-15 17:00:42', '0', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-15 16:59:58', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c52430f3b0152448686170008', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-15 17:00:54', '2016-01-15 17:03:32', '2', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-15 17:00:54', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c52430f3b01524487e3c6000a', '4028813c52430f3b015244853f500005', '2016-01-15 17:03:45', '2016-01-15 17:05:02', '1', '127.0.0.1', '4028813c52430f3b015244853f500005', '2016-01-15 17:03:45', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c52430f3b015244887a89000c', '4028813c52430f3b015244858c870006', '2016-01-15 17:05:14', '2016-01-15 17:05:40', '0', '127.0.0.1', '4028813c52430f3b015244858c870006', '2016-01-15 17:05:14', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c52430f3b0152448963bf000d', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-15 17:06:26', '2016-01-15 17:06:40', '0', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-15 17:06:26', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c525278a801525282285e0001', '4028813c523e21e101523e2346bb0000', '2016-01-18 10:04:04', '2016-01-18 10:13:27', '9', '127.0.0.1', '4028813c523e21e101523e2346bb0000', '2016-01-18 10:04:04', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c525278a80152528d341d0004', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-18 10:13:39', '2016-01-18 10:25:31', '11', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-18 10:13:39', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c525278a80152528e81000005', '4028813c52430f3b015244853f500005', '2016-01-18 10:25:55', '2016-01-18 10:26:56', '1', '127.0.0.1', '4028813c52430f3b015244853f500005', '2016-01-18 10:25:55', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c525278a801525292c7e30006', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-18 10:27:11', '2016-01-18 10:31:37', '4', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-18 10:27:11', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c525278a801525293c74b0007', '4028813c52430f3b015244853f500005', '2016-01-18 10:31:49', '2016-01-18 10:32:42', '0', '127.0.0.1', '4028813c52430f3b015244853f500005', '2016-01-18 10:31:49', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5257c2a5015257c54e840000', '8a4583c3379d08e101379d0e3dfe0002', '2016-01-19 10:42:44', '2016-01-19 10:44:54', '2', '127.0.0.1', '8a4583c3379d08e101379d0e3dfe0002', '2016-01-19 10:42:44', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5257c970015257ca07710000', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-19 10:49:47', '2016-01-19 10:50:04', '0', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-19 10:49:47', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5257c970015257ca601d0001', '4028813c52430f3b015244853f500005', '2016-01-19 10:50:22', '2016-01-19 10:50:26', '0', '127.0.0.1', '4028813c52430f3b015244853f500005', '2016-01-19 10:50:22', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5257c970015257cc1c560004', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-19 10:50:44', '2016-01-19 10:52:20', '1', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-19 10:50:44', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5257c970015257cc518d0005', '4028813c52430f3b015244853f500005', '2016-01-19 10:52:31', '2016-01-19 10:52:34', '0', '127.0.0.1', '4028813c52430f3b015244853f500005', '2016-01-19 10:52:31', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c5257c970015257cd90e00006', '4028813c5257c970015257cb856e0002', '2016-01-19 10:52:43', '2016-01-19 10:53:55', '1', '127.0.0.1', '4028813c5257c970015257cb856e0002', '2016-01-19 10:52:43', null, '1', '1', null);
INSERT INTO `user_login_log` VALUES ('4028813c525cb7d201525cec5a0d0008', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-20 09:51:25', '2016-01-20 10:45:39', '54', '127.0.0.1', '4028e3484d9a91fa014d9aa14cec0080', '2016-01-20 09:51:25', null, '1', '1', null);

-- ----------------------------
-- Table structure for wf_execute_setting
-- ----------------------------
DROP TABLE IF EXISTS `wf_execute_setting`;
CREATE TABLE `wf_execute_setting` (
  `ID` varchar(32) NOT NULL,
  `CUR_ROLE_ID` varchar(32) DEFAULT NULL,
  `NEXT_ROLE_ID` varchar(32) DEFAULT NULL,
  `WF_CAT` varchar(10) DEFAULT NULL,
  `TRANSITION` varchar(50) DEFAULT NULL,
  `OPERATE_TYPE` varchar(20) DEFAULT NULL,
  `VARIABLE_NAME` varchar(20) DEFAULT NULL,
  `CREATE_USER_ID` varchar(32) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `ORGANIZATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wf_execute_setting
-- ----------------------------
INSERT INTO `wf_execute_setting` VALUES ('297edbcc3bdf7f2f013bdf81574f0000', '297edbcc3bd62dfd013bd62f0c150000', '', 'chuchai', '', '', '', '8a4583c3379d08e101379d0e3dfe0002', '2012-12-28 11:14:53', null);
INSERT INTO `wf_execute_setting` VALUES ('297edbcc3bdf7f2f013bdf816a1f0001', '8a4583c9341229ff0134122f5a7a0025', '402881e4392a693601392a87ea8d000c', 'qingjia', '普通员工', 'lshenhe', 'bmjl', '8a4583c3379d08e101379d0e3dfe0002', '2012-12-28 11:14:58', null);
INSERT INTO `wf_execute_setting` VALUES ('297edbcc3bdf7f2f013bdf816a200002', '402881e4392a693601392a87ea8d000c', '402881e4392a693601392a88db07002a', 'qingjia', '请假大于5天', 'lshenhe', 'fzjl', '8a4583c3379d08e101379d0e3dfe0002', '2012-12-28 11:14:58', null);
INSERT INTO `wf_execute_setting` VALUES ('297edbcc3bdf7f2f013bdf816a200003', '402881e4392a693601392a88db07002a', '402881e4392a693601392a896d730048', 'qingjia', '请假大于10天', 'lshenhe', 'zjl', '8a4583c3379d08e101379d0e3dfe0002', '2012-12-28 11:14:58', null);
INSERT INTO `wf_execute_setting` VALUES ('297edbcc3bdf7f2f013bdf816a200004', '402881e4392a693601392a896d730048', '402881e4392a693601392aa3b6b30138', 'qingjia', '同意', 'kaoqing', 'xzms', '8a4583c3379d08e101379d0e3dfe0002', '2012-12-28 11:14:58', null);
INSERT INTO `wf_execute_setting` VALUES ('297edbcc3bdf7f2f013bdf816a200005', '402881e4392a693601392a87ea8d000c', '402881e4392a693601392aa3b6b30138', 'qingjia', '请假不多于5天', 'kaoqing', 'xzms', '8a4583c3379d08e101379d0e3dfe0002', '2012-12-28 11:14:58', null);
INSERT INTO `wf_execute_setting` VALUES ('297edbcc3bdf7f2f013bdf816a200006', '402881e4392a693601392a88db07002a', '402881e4392a693601392aa3b6b30138', 'qingjia', '请假不多于10天', 'caiwu', 'xzms', '8a4583c3379d08e101379d0e3dfe0002', '2012-12-28 11:14:58', null);
INSERT INTO `wf_execute_setting` VALUES ('297edbcc3bdf7f2f013bdf816a210007', '402881e4392a693601392aa3b6b30138', '402881e4392a693601392a8b08a50086', 'qingjia', '发送财务', 'caiwu', 'cwjl', '8a4583c3379d08e101379d0e3dfe0002', '2012-12-28 11:14:58', null);

-- ----------------------------
-- Table structure for wf_leave
-- ----------------------------
DROP TABLE IF EXISTS `wf_leave`;
CREATE TABLE `wf_leave` (
  `ID` varchar(32) NOT NULL,
  `LEAVE_USER_ID` varchar(32) DEFAULT NULL,
  `PROJECT_ID` varchar(32) DEFAULT NULL,
  `LEAVE_TYPE` varchar(20) DEFAULT NULL,
  `LEAVE_END_TIME` varchar(20) DEFAULT '到岗日期',
  `LEAVE_TIME` varchar(20) DEFAULT NULL,
  `LEAVE_CONTENT` varchar(1000) DEFAULT NULL,
  `CREATE_TIME` varchar(20) DEFAULT NULL,
  `LEAVE_DAY_NUMBER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK6AE62D271483D8F7` (`PROJECT_ID`) USING BTREE,
  CONSTRAINT `wf_leave_ibfk_1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `oa_project` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wf_leave
-- ----------------------------

-- ----------------------------
-- Table structure for wf_leave_audit
-- ----------------------------
DROP TABLE IF EXISTS `wf_leave_audit`;
CREATE TABLE `wf_leave_audit` (
  `ID` varchar(32) NOT NULL,
  `LEAVE_ID` varchar(32) DEFAULT NULL,
  `AUDTI_USER_ID` varchar(32) DEFAULT NULL,
  `AUDIT_STATE` varchar(10) DEFAULT NULL,
  `AUDIT_CONTENT` varchar(500) DEFAULT NULL,
  `AUDIT_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Leave_RelRelationship` (`LEAVE_ID`) USING BTREE,
  CONSTRAINT `wf_leave_audit_ibfk_1` FOREIGN KEY (`LEAVE_ID`) REFERENCES `wf_leave` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wf_leave_audit
-- ----------------------------
