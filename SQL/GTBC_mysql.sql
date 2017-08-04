/*
Navicat MySQL Data Transfer

Source Server         : xxxxxx
Source Server Version : 50627
Source Host           : xxxxxx
Source Database       : GTBC

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2017-08-04 15:38:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for code_map
-- ----------------------------
DROP TABLE IF EXISTS `code_map`;
CREATE TABLE `code_map` (
  `CodeSequence` int(25) NOT NULL,
  `purpose` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Note1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Note2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Note3` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Note4` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Note5` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Note6` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Note7` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Note8` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Note9` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Note0` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CodeSequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for observation_item
-- ----------------------------
DROP TABLE IF EXISTS `observation_item`;
CREATE TABLE `observation_item` (
  `ItemId` char(8) COLLATE utf8_unicode_ci NOT NULL,
  `UserId` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ItemId`,`UserId`),
  KEY `user_id` (`UserId`) USING HASH,
  KEY `stock_Id` (`ItemId`) USING HASH,
  KEY `two_Ids` (`ItemId`,`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tw_best_buy_stock
-- ----------------------------
DROP TABLE IF EXISTS `tw_best_buy_stock`;
CREATE TABLE `tw_best_buy_stock` (
  `AccountingDate` date NOT NULL,
  `StockId` char(8) COLLATE utf8_unicode_ci NOT NULL,
  `ForceIndexVal` double DEFAULT NULL,
  PRIMARY KEY (`AccountingDate`,`StockId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tw_future_his_prices
-- ----------------------------
DROP TABLE IF EXISTS `tw_future_his_prices`;
CREATE TABLE `tw_future_his_prices` (
  `TradingDate` date NOT NULL COMMENT '價格當日',
  `StockId` char(8) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Stock ID',
  `Open` float DEFAULT NULL COMMENT '當日開盤價',
  `High` float DEFAULT NULL COMMENT '當日最高價',
  `Low` float DEFAULT NULL COMMENT '當日最低價',
  `Close` float DEFAULT NULL COMMENT '當日收盤價',
  `Volume` int(11) DEFAULT NULL COMMENT '當日總交易量',
  PRIMARY KEY (`TradingDate`,`StockId`),
  KEY `TradingDay` (`TradingDate`) USING BTREE,
  KEY `ID` (`StockId`) USING BTREE,
  KEY `Day&ID` (`TradingDate`,`StockId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tw_historical_prices
-- ----------------------------
DROP TABLE IF EXISTS `tw_historical_prices`;
CREATE TABLE `tw_historical_prices` (
  `TradingDate` date NOT NULL COMMENT '價格當日',
  `StockId` char(8) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Stock ID',
  `Name` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '股票中文名稱',
  `Price` float DEFAULT NULL COMMENT '當日收盤價',
  `Volume` int(11) DEFAULT NULL COMMENT '當日總交易量',
  `Open` float DEFAULT NULL COMMENT '當日開盤價',
  `High` float DEFAULT NULL COMMENT '當日最高價',
  `Low` float DEFAULT NULL COMMENT '當日最低價',
  `PER` float DEFAULT NULL COMMENT '本益比',
  `PriceChangeRatio` float DEFAULT NULL COMMENT '當日價格變化率',
  `Recorder` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '該筆記錄人員',
  PRIMARY KEY (`TradingDate`,`StockId`),
  KEY `TradingDay` (`TradingDate`) USING BTREE,
  KEY `ID` (`StockId`) USING BTREE,
  KEY `Day&ID` (`TradingDate`,`StockId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tw_stock_map
-- ----------------------------
DROP TABLE IF EXISTS `tw_stock_map`;
CREATE TABLE `tw_stock_map` (
  `StockId` char(8) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`StockId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userId` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` int(10) DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `deleteFlag` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notifyGroup` int(10) DEFAULT NULL,
  `note` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `role` (`role`),
  KEY `role_2` (`role`),
  KEY `role_3` (`role`),
  KEY `role_4` (`role`),
  KEY `role_5` (`role`),
  KEY `role_6` (`role`),
  KEY `role_7` (`role`),
  KEY `role_8` (`role`),
  KEY `notifyGroup` (`notifyGroup`),
  CONSTRAINT `User_CoMap_group` FOREIGN KEY (`notifyGroup`) REFERENCES `code_map` (`CodeSequence`),
  CONSTRAINT `User_CoMap_role` FOREIGN KEY (`role`) REFERENCES `code_map` (`CodeSequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
