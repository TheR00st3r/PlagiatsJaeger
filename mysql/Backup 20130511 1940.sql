-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.96


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema mysql
--

CREATE DATABASE IF NOT EXISTS mysql;
USE mysql;

--
-- Definition of table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
CREATE TABLE `columns_priv` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Table_name` char(64) collate utf8_bin NOT NULL default '',
  `Column_name` char(64) collate utf8_bin NOT NULL default '',
  `Timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') character set utf8 NOT NULL default '',
  PRIMARY KEY  (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column privileges';

--
-- Dumping data for table `columns_priv`
--

/*!40000 ALTER TABLE `columns_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_priv` ENABLE KEYS */;


--
-- Definition of table `db`
--

DROP TABLE IF EXISTS `db`;
CREATE TABLE `db` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Select_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Insert_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Update_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Delete_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Drop_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Grant_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `References_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Index_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_tmp_table_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Lock_tables_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Show_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Execute_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  PRIMARY KEY  (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database privileges';

--
-- Dumping data for table `db`
--

/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` (`Host`,`Db`,`User`,`Select_priv`,`Insert_priv`,`Update_priv`,`Delete_priv`,`Create_priv`,`Drop_priv`,`Grant_priv`,`References_priv`,`Index_priv`,`Alter_priv`,`Create_tmp_table_priv`,`Lock_tables_priv`,`Create_view_priv`,`Show_view_priv`,`Create_routine_priv`,`Alter_routine_priv`,`Execute_priv`) VALUES 
 (0x25,0x74657374,'','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','N','N'),
 (0x25,0x746573745C5F25,'','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','N','N');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;


--
-- Definition of table `func`
--

DROP TABLE IF EXISTS `func`;
CREATE TABLE `func` (
  `name` char(64) collate utf8_bin NOT NULL default '',
  `ret` tinyint(1) NOT NULL default '0',
  `dl` char(128) collate utf8_bin NOT NULL default '',
  `type` enum('function','aggregate') character set utf8 NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User defined functions';

--
-- Dumping data for table `func`
--

/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;


--
-- Definition of table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
CREATE TABLE `help_category` (
  `help_category_id` smallint(5) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint(5) unsigned default NULL,
  `url` char(128) NOT NULL,
  PRIMARY KEY  (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help categories';

--
-- Dumping data for table `help_category`
--

/*!40000 ALTER TABLE `help_category` DISABLE KEYS */;
INSERT INTO `help_category` (`help_category_id`,`name`,`parent_category_id`,`url`) VALUES 
 (1,'Geographic',0,''),
 (2,'Polygon properties',32,''),
 (3,'WKT',32,''),
 (4,'Numeric Functions',36,''),
 (5,'MBR',32,''),
 (6,'Control flow functions',36,''),
 (7,'Transactions',33,''),
 (8,'Help Metadata',33,''),
 (9,'Account Management',33,''),
 (10,'Point properties',32,''),
 (11,'Encryption Functions',36,''),
 (12,'LineString properties',32,''),
 (13,'Logical operators',36,''),
 (14,'Miscellaneous Functions',36,''),
 (15,'Functions and Modifiers for Use with GROUP BY',33,''),
 (16,'Information Functions',36,''),
 (17,'Comparison operators',36,''),
 (18,'Bit Functions',36,''),
 (19,'Table Maintenance',33,''),
 (20,'User-Defined Functions',33,''),
 (21,'Data Types',33,''),
 (22,'Compound Statements',33,''),
 (23,'Geometry constructors',32,''),
 (24,'GeometryCollection properties',1,''),
 (25,'Administration',33,''),
 (26,'Data Manipulation',33,''),
 (27,'Utility',33,''),
 (28,'Language Structure',33,''),
 (29,'Geometry relations',32,''),
 (30,'Date and Time Functions',36,''),
 (31,'WKB',32,''),
 (32,'Geographic Features',33,''),
 (33,'Contents',0,''),
 (34,'Geometry properties',32,''),
 (35,'String Functions',36,''),
 (36,'Functions',33,''),
 (37,'Data Definition',33,'');
/*!40000 ALTER TABLE `help_category` ENABLE KEYS */;


--
-- Definition of table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY  (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help keywords';

--
-- Dumping data for table `help_keyword`
--

/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` (`help_keyword_id`,`name`) VALUES 
 (0,'JOIN'),
 (1,'REPEAT'),
 (2,'SERIALIZABLE'),
 (3,'REPLACE'),
 (4,'RETURNS'),
 (5,'MASTER_SSL_CA'),
 (6,'NCHAR'),
 (7,'COLUMNS'),
 (8,'WORK'),
 (9,'DATETIME'),
 (10,'MODE'),
 (11,'OPEN'),
 (12,'INTEGER'),
 (13,'ESCAPE'),
 (14,'VALUE'),
 (15,'SQL_BIG_RESULT'),
 (16,'DROP'),
 (17,'GEOMETRYCOLLECTIONFROMWKB'),
 (18,'EVENTS'),
 (19,'MONTH'),
 (20,'PROFILES'),
 (21,'DUPLICATE'),
 (22,'REPLICATION'),
 (23,'UNLOCK'),
 (24,'INNODB'),
 (25,'YEAR_MONTH'),
 (26,'SUBJECT'),
 (27,'PREPARE'),
 (28,'LOCK'),
 (29,'NDB'),
 (30,'CHECK'),
 (31,'FULL'),
 (32,'INT4'),
 (33,'BY'),
 (34,'NO'),
 (35,'MINUTE'),
 (36,'DATA'),
 (37,'DAY'),
 (38,'SHARE'),
 (39,'REAL'),
 (40,'SEPARATOR'),
 (41,'DELETE'),
 (42,'ON'),
 (43,'CONNECTION'),
 (44,'CLOSE'),
 (45,'X509'),
 (46,'USE'),
 (47,'WHERE'),
 (48,'PRIVILEGES'),
 (49,'SPATIAL'),
 (50,'SUPER'),
 (51,'SQL_BUFFER_RESULT'),
 (52,'IGNORE'),
 (53,'QUICK'),
 (54,'SIGNED'),
 (55,'SECURITY'),
 (56,'NDBCLUSTER'),
 (57,'POLYGONFROMWKB'),
 (58,'FALSE'),
 (59,'LEVEL'),
 (60,'FORCE'),
 (61,'BINARY'),
 (62,'TO'),
 (63,'CHANGE'),
 (64,'HOUR_MINUTE'),
 (65,'UPDATE'),
 (66,'INTO'),
 (67,'FEDERATED'),
 (68,'VARYING'),
 (69,'HOUR_SECOND'),
 (70,'VARIABLE'),
 (71,'ROLLBACK'),
 (72,'PROCEDURE'),
 (73,'TIMESTAMP'),
 (74,'IMPORT'),
 (75,'AGAINST'),
 (76,'CHECKSUM'),
 (77,'COUNT'),
 (78,'LONGBINARY'),
 (79,'THEN'),
 (80,'INSERT'),
 (81,'ENGINES'),
 (82,'HANDLER'),
 (83,'DAY_SECOND'),
 (84,'EXISTS'),
 (85,'MUTEX'),
 (86,'HELP_DATE'),
 (87,'RELEASE'),
 (88,'BOOLEAN'),
 (89,'MOD'),
 (90,'DEFAULT'),
 (91,'TYPE'),
 (92,'NO_WRITE_TO_BINLOG'),
 (93,'OPTIMIZE'),
 (94,'RESET'),
 (95,'ITERATE'),
 (96,'DO'),
 (97,'BIGINT'),
 (98,'SET'),
 (99,'ISSUER'),
 (100,'DATE'),
 (101,'STATUS'),
 (102,'FULLTEXT'),
 (103,'COMMENT'),
 (104,'MASTER_CONNECT_RETRY'),
 (105,'INNER'),
 (106,'STOP'),
 (107,'MASTER_LOG_FILE'),
 (108,'MRG_MYISAM'),
 (109,'PRECISION'),
 (110,'REQUIRE'),
 (111,'TRAILING'),
 (112,'LONG'),
 (113,'OPTION'),
 (114,'ELSE'),
 (115,'DEALLOCATE'),
 (116,'IO_THREAD'),
 (117,'CASE'),
 (118,'CIPHER'),
 (119,'CONTINUE'),
 (120,'FROM'),
 (121,'READ'),
 (122,'LEFT'),
 (123,'ELSEIF'),
 (124,'MINUTE_SECOND'),
 (125,'COMPACT'),
 (126,'RESTORE'),
 (127,'DEC'),
 (128,'FOR'),
 (129,'WARNINGS'),
 (130,'MIN_ROWS'),
 (131,'STRING'),
 (132,'CONDITION'),
 (133,'ENCLOSED'),
 (134,'FUNCTION'),
 (135,'AGGREGATE'),
 (136,'FIELDS'),
 (137,'INT3'),
 (138,'ARCHIVE'),
 (139,'AVG_ROW_LENGTH'),
 (140,'ADD'),
 (141,'KILL'),
 (142,'FLOAT4'),
 (143,'VIEW'),
 (144,'REPEATABLE'),
 (145,'INFILE'),
 (146,'HELP_VERSION'),
 (147,'ORDER'),
 (148,'USING'),
 (149,'MIDDLEINT'),
 (150,'GRANT'),
 (151,'UNSIGNED'),
 (152,'DECIMAL'),
 (153,'GEOMETRYFROMTEXT'),
 (154,'INDEXES'),
 (155,'FOREIGN'),
 (156,'CACHE'),
 (157,'HOSTS'),
 (158,'COMMIT'),
 (159,'SCHEMAS'),
 (160,'LEADING'),
 (161,'SNAPSHOT'),
 (162,'DECLARE'),
 (163,'LOAD'),
 (164,'SQL_CACHE'),
 (165,'CONVERT'),
 (166,'DYNAMIC'),
 (167,'COLLATE'),
 (168,'POLYGONFROMTEXT'),
 (169,'BYTE'),
 (170,'GLOBAL'),
 (171,'LINESTRINGFROMWKB'),
 (172,'BERKELEYDB'),
 (173,'WHEN'),
 (174,'HAVING'),
 (175,'AS'),
 (176,'STARTING'),
 (177,'RELOAD'),
 (178,'AUTOCOMMIT'),
 (179,'REVOKE'),
 (180,'GRANTS'),
 (181,'OUTER'),
 (182,'FLOOR'),
 (183,'EXPLAIN'),
 (184,'WITH'),
 (185,'AFTER'),
 (186,'STD'),
 (187,'CSV'),
 (188,'DISABLE'),
 (189,'OUTFILE'),
 (190,'LOW_PRIORITY'),
 (191,'FILE'),
 (192,'BDB'),
 (193,'SCHEMA'),
 (194,'SONAME'),
 (195,'POW'),
 (196,'MULTIPOINTFROMWKB'),
 (197,'INDEX'),
 (198,'DUAL'),
 (199,'BACKUP'),
 (200,'MULTIPOINTFROMTEXT'),
 (201,'EXTENDED'),
 (202,'MULTILINESTRINGFROMWKB'),
 (203,'CROSS'),
 (204,'NATIONAL'),
 (205,'GROUP'),
 (206,'SHA'),
 (207,'UNDO'),
 (208,'ZEROFILL'),
 (209,'CLIENT'),
 (210,'MASTER_PASSWORD'),
 (211,'RELAY_LOG_FILE'),
 (212,'TRUE'),
 (213,'CHARACTER'),
 (214,'MASTER_USER'),
 (215,'TABLE'),
 (216,'ENGINE'),
 (217,'INSERT_METHOD'),
 (218,'CASCADE'),
 (219,'RELAY_LOG_POS'),
 (220,'SQL_CALC_FOUND_ROWS'),
 (221,'UNION'),
 (222,'MYISAM'),
 (223,'LEAVE'),
 (224,'MODIFY'),
 (225,'MATCH'),
 (226,'MASTER_LOG_POS'),
 (227,'DESC'),
 (228,'DISTINCTROW'),
 (229,'TIME'),
 (230,'NUMERIC'),
 (231,'EXPANSION'),
 (232,'CODE'),
 (233,'CURSOR'),
 (234,'GEOMETRYCOLLECTIONFROMTEXT'),
 (235,'CHAIN'),
 (236,'FLUSH'),
 (237,'CREATE'),
 (238,'DESCRIBE'),
 (239,'MAX_UPDATES_PER_HOUR'),
 (240,'INT2'),
 (241,'PROCESSLIST'),
 (242,'LOGS'),
 (243,'HEAP'),
 (244,'SOUNDS'),
 (245,'BETWEEN'),
 (246,'REPAIR'),
 (247,'MULTILINESTRINGFROMTEXT'),
 (248,'PACK_KEYS'),
 (249,'FAST'),
 (250,'CALL'),
 (251,'VALUES'),
 (252,'LOOP'),
 (253,'VARCHARACTER'),
 (254,'BEFORE'),
 (255,'TRUNCATE'),
 (256,'SHOW'),
 (257,'REDUNDANT'),
 (258,'ALL'),
 (259,'USER_RESOURCES'),
 (260,'PARTIAL'),
 (261,'BINLOG'),
 (262,'END'),
 (263,'SECOND'),
 (264,'AND'),
 (265,'FLOAT8'),
 (266,'PREV'),
 (267,'HOUR'),
 (268,'SELECT'),
 (269,'DATABASES'),
 (270,'OR'),
 (271,'IDENTIFIED'),
 (272,'MASTER_SSL_CIPHER'),
 (273,'SQL_SLAVE_SKIP_COUNTER'),
 (274,'BOTH'),
 (275,'BOOL'),
 (276,'YEAR'),
 (277,'MASTER_PORT'),
 (278,'CONCURRENT'),
 (279,'HELP'),
 (280,'UNIQUE'),
 (281,'TRIGGERS'),
 (282,'PROCESS'),
 (283,'CONSISTENT'),
 (284,'MASTER_SSL'),
 (285,'DATE_ADD'),
 (286,'MAX_CONNECTIONS_PER_HOUR'),
 (287,'LIKE'),
 (288,'FETCH'),
 (289,'IN'),
 (290,'COLUMN'),
 (291,'DUMPFILE'),
 (292,'USAGE'),
 (293,'EXECUTE'),
 (294,'MEMORY'),
 (295,'CEIL'),
 (296,'QUERY'),
 (297,'MASTER_HOST'),
 (298,'LINES'),
 (299,'SQL_THREAD'),
 (300,'MAX_QUERIES_PER_HOUR'),
 (301,'MASTER_SSL_CERT'),
 (302,'MULTIPOLYGONFROMWKB'),
 (303,'TRANSACTION'),
 (304,'DAY_MINUTE'),
 (305,'STDDEV'),
 (306,'DATE_SUB'),
 (307,'GEOMETRYFROMWKB'),
 (308,'INT1'),
 (309,'RENAME'),
 (310,'RIGHT'),
 (311,'ALTER'),
 (312,'MAX_ROWS'),
 (313,'STRAIGHT_JOIN'),
 (314,'NATURAL'),
 (315,'VARIABLES'),
 (316,'ESCAPED'),
 (317,'SHA1'),
 (318,'PASSWORD'),
 (319,'CHAR'),
 (320,'OFFSET'),
 (321,'NEXT'),
 (322,'ERRORS'),
 (323,'SQL_LOG_BIN'),
 (324,'TEMPORARY'),
 (325,'COMMITTED'),
 (326,'SQL_SMALL_RESULT'),
 (327,'UPGRADE'),
 (328,'BEGIN'),
 (329,'DELAY_KEY_WRITE'),
 (330,'PROFILE'),
 (331,'MEDIUM'),
 (332,'INTERVAL'),
 (333,'SSL'),
 (334,'DAY_HOUR'),
 (335,'REFERENCES'),
 (336,'AES_ENCRYPT'),
 (337,'STORAGE'),
 (338,'ISOLATION'),
 (339,'CEILING'),
 (340,'INT8'),
 (341,'RESTRICT'),
 (342,'UNCOMMITTED'),
 (343,'LINESTRINGFROMTEXT'),
 (344,'IS'),
 (345,'NOT'),
 (346,'ANALYSE'),
 (347,'DES_KEY_FILE'),
 (348,'COMPRESSED'),
 (349,'START'),
 (350,'SAVEPOINT'),
 (351,'IF'),
 (352,'PRIMARY'),
 (353,'PURGE'),
 (354,'USER'),
 (355,'INNOBASE'),
 (356,'LAST'),
 (357,'EXIT'),
 (358,'KEYS'),
 (359,'LIMIT'),
 (360,'KEY'),
 (361,'MERGE'),
 (362,'UNTIL'),
 (363,'SQL_NO_CACHE'),
 (364,'DELAYED'),
 (365,'ANALYZE'),
 (366,'CONSTRAINT'),
 (367,'SERIAL'),
 (368,'ACTION'),
 (369,'WRITE'),
 (370,'SESSION'),
 (371,'DATABASE'),
 (372,'NULL'),
 (373,'POWER'),
 (374,'USE_FRM'),
 (375,'SLAVE'),
 (376,'TERMINATED'),
 (377,'NVARCHAR'),
 (378,'ASC'),
 (379,'RETURN'),
 (380,'ENABLE'),
 (381,'OPTIONALLY'),
 (382,'DIRECTORY'),
 (383,'MAX_USER_CONNECTIONS'),
 (384,'WHILE'),
 (385,'DISTINCT'),
 (386,'AES_DECRYPT'),
 (387,'LOCAL'),
 (388,'MASTER_SSL_KEY'),
 (389,'NONE'),
 (390,'TABLES'),
 (391,'<>'),
 (392,'RLIKE'),
 (393,'TRIGGER'),
 (394,'COLLATION'),
 (395,'SHUTDOWN'),
 (396,'HIGH_PRIORITY'),
 (397,'BTREE'),
 (398,'FIRST'),
 (399,'TYPES'),
 (400,'MASTER'),
 (401,'FIXED'),
 (402,'MULTIPOLYGONFROMTEXT'),
 (403,'ROW_FORMAT');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;


--
-- Definition of table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
CREATE TABLE `help_relation` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `help_keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`help_keyword_id`,`help_topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='keyword-topic relation';

--
-- Dumping data for table `help_relation`
--

/*!40000 ALTER TABLE `help_relation` DISABLE KEYS */;
INSERT INTO `help_relation` (`help_topic_id`,`help_keyword_id`) VALUES 
 (1,0),
 (343,0),
 (221,1),
 (429,2),
 (3,3),
 (404,3),
 (88,4),
 (177,5),
 (412,6),
 (17,7),
 (335,7),
 (404,7),
 (136,8),
 (219,9),
 (80,10),
 (343,10),
 (14,11),
 (97,11),
 (125,11),
 (335,11),
 (88,12),
 (479,12),
 (366,13),
 (3,14),
 (95,14),
 (232,14),
 (343,15),
 (26,16),
 (29,16),
 (79,16),
 (178,16),
 (226,16),
 (252,16),
 (265,16),
 (319,16),
 (392,16),
 (400,16),
 (444,16),
 (99,17),
 (114,18),
 (362,19),
 (74,20),
 (95,21),
 (189,22),
 (31,23),
 (335,24),
 (387,24),
 (449,24),
 (362,25),
 (189,26),
 (30,27),
 (226,27),
 (31,28),
 (343,28),
 (449,29),
 (401,30),
 (449,30),
 (17,31),
 (283,31),
 (335,31),
 (433,31),
 (449,31),
 (479,32),
 (42,33),
 (69,33),
 (75,33),
 (189,33),
 (343,33),
 (349,33),
 (404,33),
 (444,33),
 (449,33),
 (449,34),
 (453,34),
 (362,35),
 (111,36),
 (404,36),
 (449,36),
 (362,37),
 (343,38),
 (88,39),
 (302,39),
 (349,40),
 (42,41),
 (449,41),
 (453,41),
 (1,42),
 (453,42),
 (166,43),
 (449,43),
 (45,44),
 (97,44),
 (189,45),
 (1,46),
 (49,46),
 (42,47),
 (75,47),
 (97,47),
 (184,48),
 (189,48),
 (238,48),
 (200,49),
 (444,49),
 (189,50),
 (343,51),
 (1,52),
 (75,52),
 (95,52),
 (343,52),
 (404,52),
 (444,52),
 (42,53),
 (401,53),
 (447,53),
 (219,54),
 (189,55),
 (449,56),
 (82,57),
 (461,57),
 (371,58),
 (429,59),
 (1,60),
 (33,61),
 (219,61),
 (258,61),
 (177,62),
 (258,62),
 (441,62),
 (177,63),
 (444,63),
 (362,64),
 (75,65),
 (95,65),
 (343,65),
 (453,65),
 (3,66),
 (95,66),
 (292,66),
 (343,66),
 (449,67),
 (246,68),
 (362,69),
 (121,70),
 (136,71),
 (441,71),
 (13,72),
 (176,72),
 (290,72),
 (316,72),
 (335,72),
 (343,72),
 (400,72),
 (421,72),
 (467,72),
 (90,73),
 (180,73),
 (404,74),
 (80,75),
 (388,76),
 (449,76),
 (61,77),
 (318,77),
 (415,77),
 (275,78),
 (24,79),
 (51,79),
 (77,79),
 (95,80),
 (185,80),
 (289,80),
 (465,80),
 (271,81),
 (335,81),
 (97,82),
 (301,82),
 (362,83),
 (26,84),
 (145,84),
 (178,84),
 (265,84),
 (272,85),
 (335,85),
 (100,86),
 (136,87),
 (441,87),
 (20,88),
 (80,88),
 (104,89),
 (165,89),
 (3,90),
 (95,90),
 (145,90),
 (190,90),
 (202,90),
 (232,90),
 (444,90),
 (449,90),
 (444,91),
 (449,91),
 (106,92),
 (314,92),
 (447,92),
 (451,92),
 (106,93),
 (32,94),
 (110,94),
 (141,94),
 (253,94),
 (116,95),
 (117,96),
 (475,96),
 (211,97),
 (3,98),
 (75,98),
 (95,98),
 (121,98),
 (136,98),
 (145,98),
 (173,98),
 (202,98),
 (321,98),
 (404,98),
 (444,98),
 (449,98),
 (453,98),
 (457,98),
 (473,98),
 (189,99),
 (123,100),
 (219,100),
 (251,100),
 (362,100),
 (52,101),
 (128,101),
 (205,101),
 (213,101),
 (272,101),
 (316,101),
 (324,101),
 (335,101),
 (353,101),
 (387,101),
 (200,102),
 (444,102),
 (449,102),
 (449,103),
 (177,104),
 (1,105),
 (46,106),
 (177,107),
 (449,108),
 (302,109),
 (189,110),
 (437,111),
 (275,112),
 (189,113),
 (238,113),
 (51,114),
 (77,114),
 (226,115),
 (46,116),
 (312,116),
 (51,117),
 (77,117),
 (189,118),
 (301,119),
 (42,120),
 (111,120),
 (114,120),
 (335,120),
 (343,120),
 (347,120),
 (437,120),
 (31,121),
 (97,121),
 (429,121),
 (1,122),
 (24,123),
 (362,124),
 (449,125),
 (170,126),
 (199,127),
 (171,128),
 (301,128),
 (335,128),
 (343,128),
 (403,128),
 (318,129),
 (335,129),
 (449,130),
 (88,131),
 (171,132),
 (404,133),
 (29,134),
 (60,134),
 (88,134),
 (201,134),
 (222,134),
 (290,134),
 (324,134),
 (335,134),
 (379,134),
 (392,134),
 (400,134),
 (88,135),
 (335,136),
 (404,136),
 (241,137),
 (449,138),
 (444,139),
 (449,139),
 (54,140),
 (444,140),
 (166,141),
 (159,142),
 (26,143),
 (149,143),
 (436,143),
 (429,144),
 (404,145),
 (181,146),
 (42,147),
 (75,147),
 (343,147),
 (349,147),
 (444,147),
 (1,148),
 (42,148),
 (78,148),
 (241,149),
 (189,150),
 (238,150),
 (20,151),
 (120,151),
 (159,151),
 (199,151),
 (219,151),
 (302,151),
 (479,151),
 (88,152),
 (146,152),
 (219,152),
 (397,153),
 (335,154),
 (444,155),
 (449,155),
 (453,155),
 (92,156),
 (141,156),
 (292,156),
 (135,157),
 (335,157),
 (136,158),
 (150,159),
 (335,159),
 (437,160),
 (136,161),
 (171,162),
 (190,162),
 (301,162),
 (403,162),
 (111,163),
 (292,163),
 (347,163),
 (404,163),
 (343,164),
 (219,165),
 (363,165),
 (449,166),
 (145,167),
 (202,167),
 (449,167),
 (381,168),
 (446,169),
 (121,170),
 (128,170),
 (173,170),
 (337,170),
 (429,170),
 (434,171),
 (449,172),
 (51,173),
 (77,173),
 (343,174),
 (1,175),
 (31,175),
 (343,175),
 (404,176),
 (189,177),
 (136,178),
 (238,179),
 (183,180),
 (335,180),
 (1,181),
 (211,182),
 (244,183),
 (80,184),
 (189,184),
 (444,185),
 (249,186),
 (404,187),
 (449,187),
 (444,188),
 (343,189),
 (3,190),
 (31,190),
 (42,190),
 (75,190),
 (95,190),
 (404,190),
 (189,191),
 (156,192),
 (449,192),
 (145,193),
 (178,193),
 (202,193),
 (297,193),
 (335,193),
 (88,194),
 (266,195),
 (445,196),
 (1,197),
 (54,197),
 (79,197),
 (92,197),
 (200,197),
 (292,197),
 (296,197),
 (335,197),
 (444,197),
 (449,197),
 (268,198),
 (345,199),
 (407,200),
 (244,201),
 (447,201),
 (261,202),
 (1,203),
 (246,204),
 (412,204),
 (343,205),
 (409,206),
 (301,207),
 (20,208),
 (120,208),
 (159,208),
 (199,208),
 (302,208),
 (479,208),
 (189,209),
 (177,210),
 (177,211),
 (371,212),
 (145,213),
 (202,213),
 (246,213),
 (321,213),
 (404,213),
 (412,213),
 (449,213),
 (177,214),
 (54,215),
 (101,215),
 (106,215),
 (170,215),
 (205,215),
 (265,215),
 (267,215),
 (309,215),
 (335,215),
 (345,215),
 (347,215),
 (388,215),
 (401,215),
 (444,215),
 (447,215),
 (449,215),
 (451,215),
 (335,216),
 (353,216),
 (444,216),
 (449,216),
 (449,217),
 (26,218),
 (265,218),
 (449,218),
 (453,218),
 (177,219),
 (343,220),
 (293,221),
 (449,222),
 (298,223),
 (444,224),
 (80,225),
 (177,226),
 (317,227),
 (343,227),
 (349,227),
 (343,228),
 (219,229),
 (303,229),
 (361,229),
 (199,230),
 (80,231),
 (60,232),
 (467,232),
 (403,233),
 (235,234),
 (136,235),
 (141,236),
 (314,236),
 (13,237),
 (18,237),
 (54,237),
 (69,237),
 (88,237),
 (145,237),
 (200,237),
 (201,237),
 (267,237),
 (290,237),
 (297,237),
 (335,237),
 (379,237),
 (436,237),
 (449,237),
 (317,238),
 (189,239),
 (223,240),
 (335,241),
 (433,241),
 (33,242),
 (156,242),
 (258,242),
 (335,242),
 (353,242),
 (449,243),
 (364,244),
 (137,245),
 (447,246),
 (98,247),
 (449,248),
 (401,249),
 (327,250),
 (3,251),
 (95,251),
 (332,252),
 (246,253),
 (258,254),
 (309,255),
 (13,256),
 (17,256),
 (21,256),
 (33,256),
 (52,256),
 (60,256),
 (61,256),
 (74,256),
 (114,256),
 (125,256),
 (128,256),
 (135,256),
 (150,256),
 (156,256),
 (183,256),
 (184,256),
 (205,256),
 (213,256),
 (267,256),
 (271,256),
 (272,256),
 (283,256),
 (296,256),
 (297,256),
 (316,256),
 (318,256),
 (321,256),
 (324,256),
 (335,256),
 (337,256),
 (353,256),
 (379,256),
 (387,256),
 (433,256),
 (466,256),
 (467,256),
 (471,256),
 (449,257),
 (189,258),
 (238,258),
 (293,258),
 (343,258),
 (314,259),
 (449,260),
 (114,261),
 (24,262),
 (51,262),
 (77,262),
 (221,262),
 (315,262),
 (332,262),
 (475,262),
 (362,263),
 (137,264),
 (304,264),
 (302,265),
 (97,266),
 (362,267),
 (3,268),
 (95,268),
 (244,268),
 (289,268),
 (343,268),
 (150,269),
 (335,269),
 (131,270),
 (69,271),
 (189,271),
 (177,272),
 (173,273),
 (437,274),
 (20,275),
 (102,275),
 (362,276),
 (177,277),
 (404,278),
 (109,279),
 (376,279),
 (444,280),
 (21,281),
 (189,282),
 (136,283),
 (177,284),
 (362,285),
 (189,286),
 (335,287),
 (364,287),
 (369,288),
 (80,289),
 (114,289),
 (343,289),
 (444,290),
 (343,291),
 (189,292),
 (78,293),
 (189,293),
 (343,294),
 (383,295),
 (80,296),
 (141,296),
 (166,296),
 (177,297),
 (404,298),
 (46,299),
 (312,299),
 (189,300),
 (177,301),
 (115,302),
 (136,303),
 (429,303),
 (362,304),
 (393,305),
 (362,306),
 (134,307),
 (20,308),
 (101,309),
 (212,309),
 (444,309),
 (1,310),
 (54,311),
 (149,311),
 (189,311),
 (202,311),
 (222,311),
 (421,311),
 (444,311),
 (449,312),
 (1,313),
 (343,313),
 (1,314),
 (335,315),
 (337,315),
 (404,316),
 (409,317),
 (69,318),
 (189,318),
 (457,318),
 (219,319),
 (446,319),
 (343,320),
 (97,321),
 (61,322),
 (335,322),
 (473,323),
 (265,324),
 (429,325),
 (343,326),
 (401,327),
 (136,328),
 (315,328),
 (449,329),
 (466,330),
 (401,331),
 (362,332),
 (189,333),
 (362,334),
 (189,335),
 (449,335),
 (453,335),
 (425,336),
 (271,337),
 (429,338),
 (430,339),
 (120,340),
 (26,341),
 (265,341),
 (453,341),
 (429,342),
 (50,343),
 (76,344),
 (196,344),
 (356,344),
 (438,344),
 (76,345),
 (145,345),
 (196,345),
 (300,345),
 (176,346),
 (314,347),
 (449,348),
 (136,349),
 (312,349),
 (441,350),
 (24,351),
 (26,351),
 (145,351),
 (178,351),
 (265,351),
 (458,351),
 (444,352),
 (258,353),
 (69,354),
 (212,354),
 (319,354),
 (449,355),
 (97,356),
 (301,357),
 (296,358),
 (335,358),
 (444,358),
 (42,359),
 (75,359),
 (97,359),
 (114,359),
 (343,359),
 (54,360),
 (95,360),
 (444,360),
 (449,360),
 (453,360),
 (449,361),
 (221,362),
 (343,363),
 (3,364),
 (95,364),
 (465,364),
 (451,365),
 (444,366),
 (449,366),
 (232,367),
 (449,367),
 (449,368),
 (453,368),
 (31,369),
 (121,370),
 (128,370),
 (337,370),
 (429,370),
 (145,371),
 (178,371),
 (202,371),
 (297,371),
 (335,371),
 (76,372),
 (356,372),
 (453,372),
 (462,373),
 (447,374),
 (32,375),
 (46,375),
 (135,375),
 (213,375),
 (312,375),
 (404,376),
 (246,377),
 (343,378),
 (349,378),
 (470,379),
 (444,380),
 (404,381),
 (449,382),
 (189,383),
 (475,384),
 (0,385),
 (87,385),
 (278,385),
 (293,385),
 (343,385),
 (349,385),
 (370,385),
 (415,385),
 (476,386),
 (31,387),
 (106,387),
 (314,387),
 (404,387),
 (447,387),
 (451,387),
 (177,388),
 (189,389),
 (31,390),
 (125,390),
 (283,390),
 (335,390),
 (474,391),
 (23,392),
 (18,393),
 (252,393),
 (471,394),
 (189,395),
 (95,396),
 (343,396),
 (200,397),
 (97,398),
 (444,398),
 (449,398),
 (335,399),
 (33,400),
 (52,400),
 (111,400),
 (177,400),
 (253,400),
 (258,400),
 (347,400),
 (199,401),
 (449,401),
 (191,402),
 (449,403);
/*!40000 ALTER TABLE `help_relation` ENABLE KEYS */;


--
-- Definition of table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
CREATE TABLE `help_topic` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint(5) unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` char(128) NOT NULL,
  PRIMARY KEY  (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help topics';

--
-- Dumping data for table `help_topic`
--

/*!40000 ALTER TABLE `help_topic` DISABLE KEYS */;
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (0,'MIN',15,'Syntax:\nMIN([DISTINCT] expr)\n\nReturns the minimum value of expr. MIN() may take a string argument; in\nsuch cases, it returns the minimum string value. See\nhttp://dev.mysql.com/doc/refman/5.0/en/mysql-indexes.html. The DISTINCT\nkeyword can be used to find the minimum of the distinct values of expr,\nhowever, this produces the same result as omitting DISTINCT.\n\nMIN() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','mysql> SELECT student_name, MIN(test_score), MAX(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (1,'JOIN',26,'MySQL supports the following JOIN syntaxes for the table_references\npart of SELECT statements and multiple-table DELETE and UPDATE\nstatements:\n\ntable_references:\n    table_reference [, table_reference] ...\n\ntable_reference:\n    table_factor\n  | join_table\n\ntable_factor:\n    tbl_name [[AS] alias] [index_hint]\n  | table_subquery [AS] alias\n  | ( table_references )\n  | { OJ table_reference LEFT OUTER JOIN table_reference\n        ON conditional_expr }\n\njoin_table:\n    table_reference [INNER | CROSS] JOIN table_factor [join_condition]\n  | table_reference STRAIGHT_JOIN table_factor\n  | table_reference STRAIGHT_JOIN table_factor ON conditional_expr\n  | table_reference {LEFT|RIGHT} [OUTER] JOIN table_reference join_condition\n  | table_reference NATURAL [{LEFT|RIGHT} [OUTER]] JOIN table_factor\n\njoin_condition:\n    ON conditional_expr\n  | USING (column_list)\n\nindex_hint:\n    USE {INDEX|KEY} [FOR JOIN] (index_list)\n  | IGNORE {INDEX|KEY} [FOR JOIN] (index_list)\n  | FORCE {INDEX|KEY} [FOR JOIN] (index_list)\n\nindex_list:\n    index_name [, index_name] ...\n\nA table reference is also known as a join expression.\n\nThe syntax of table_factor is extended in comparison with the SQL\nStandard. The latter accepts only table_reference, not a list of them\ninside a pair of parentheses.\n\nThis is a conservative extension if we consider each comma in a list of\ntable_reference items as equivalent to an inner join. For example:\n\nSELECT * FROM t1 LEFT JOIN (t2, t3, t4)\n                 ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c)\n\nis equivalent to:\n\nSELECT * FROM t1 LEFT JOIN (t2 CROSS JOIN t3 CROSS JOIN t4)\n                 ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c)\n\nIn MySQL, CROSS JOIN is a syntactic equivalent to INNER JOIN (they can\nreplace each other). In standard SQL, they are not equivalent. INNER\nJOIN is used with an ON clause, CROSS JOIN is used otherwise.\n\nIn versions of MySQL prior to 5.0.1, parentheses in table_references\nwere just omitted and all join operations were grouped to the left. In\ngeneral, parentheses can be ignored in join expressions containing only\ninner join operations. As of 5.0.1, nested joins are permitted (see\nhttp://dev.mysql.com/doc/refman/5.0/en/nested-join-optimization.html).\n\nFurther changes in join processing were made in 5.0.12 to make MySQL\nmore compliant with standard SQL. These charges are described later in\nthis section.\n\nIndex hints can be specified to affect how the MySQL optimizer makes\nuse of indexes. For more information, see\nhttp://dev.mysql.com/doc/refman/5.0/en/index-hints.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/join.html\n\n','SELECT left_tbl.*\n  FROM left_tbl LEFT JOIN right_tbl ON left_tbl.id = right_tbl.id\n  WHERE right_tbl.id IS NULL;\n','http://dev.mysql.com/doc/refman/5.0/en/join.html'),
 (2,'HEX',35,'Syntax:\nHEX(str), HEX(N)\n\nFor a string argument str, HEX() returns a hexadecimal string\nrepresentation of str where each character in str is converted to two\nhexadecimal digits. The inverse of this operation is performed by the\nUNHEX() function.\n\nFor a numeric argument N, HEX() returns a hexadecimal string\nrepresentation of the value of N treated as a longlong (BIGINT) number.\nThis is equivalent to CONV(N,10,16). The inverse of this operation is\nperformed by CONV(HEX(N),16,10).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT 0x616263, HEX(\'abc\'), UNHEX(HEX(\'abc\'));\n        -> \'abc\', 616263, \'abc\'\nmysql> SELECT HEX(255), CONV(HEX(255),16,10);\n        -> \'FF\', 255\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (3,'REPLACE',26,'Syntax:\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name [(col_name,...)]\n    {VALUES | VALUE} ({expr | DEFAULT},...),(...),...\n\nOr:\n\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name\n    SET col_name={expr | DEFAULT}, ...\n\nOr:\n\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n\nREPLACE works exactly like INSERT, except that if an old row in the\ntable has the same value as a new row for a PRIMARY KEY or a UNIQUE\nindex, the old row is deleted before the new row is inserted. See [HELP\nINSERT].\n\nREPLACE is a MySQL extension to the SQL standard. It either inserts, or\ndeletes and inserts. For another MySQL extension to standard SQL---that\neither inserts or updates---see\nhttp://dev.mysql.com/doc/refman/5.0/en/insert-on-duplicate.html.\n\nNote that unless the table has a PRIMARY KEY or UNIQUE index, using a\nREPLACE statement makes no sense. It becomes equivalent to INSERT,\nbecause there is no index to be used to determine whether a new row\nduplicates another.\n\nValues for all columns are taken from the values specified in the\nREPLACE statement. Any missing columns are set to their default values,\njust as happens for INSERT. You cannot refer to values from the current\nrow and use them in the new row. If you use an assignment such as SET\ncol_name = col_name + 1, the reference to the column name on the right\nhand side is treated as DEFAULT(col_name), so the assignment is\nequivalent to SET col_name = DEFAULT(col_name) + 1.\n\nTo use REPLACE, you must have both the INSERT and DELETE privileges for\nthe table.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/replace.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/replace.html'),
 (4,'CONTAINS',29,'Contains(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 completely contains g2. This\ntests the opposite relationship as Within().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries\n\n','','http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-tes'),
 (5,'SRID',34,'SRID(g)\n\nReturns an integer indicating the Spatial Reference System ID for the\ngeometry value g.\n\nIn MySQL, the SRID value is just an integer associated with the\ngeometry value. All calculations are done assuming Euclidean (planar)\ngeometry.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#general-geometry-property-functions\n\n','mysql> SELECT SRID(GeomFromText(\'LineString(1 1,2 2)\',101));\n+-----------------------------------------------+\n| SRID(GeomFromText(\'LineString(1 1,2 2)\',101)) |\n+-----------------------------------------------+\n|                                           101 |\n+-----------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#general-geometry-property-functions'),
 (6,'CURRENT_TIMESTAMP',30,'Syntax:\nCURRENT_TIMESTAMP, CURRENT_TIMESTAMP()\n\nCURRENT_TIMESTAMP and CURRENT_TIMESTAMP() are synonyms for NOW().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (7,'VARIANCE',15,'Syntax:\nVARIANCE(expr)\n\nReturns the population standard variance of expr. This is an extension\nto standard SQL. As of MySQL 5.0.3, the standard SQL function VAR_POP()\ncan be used instead.\n\nVARIANCE() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (8,'VAR_SAMP',15,'Syntax:\nVAR_SAMP(expr)\n\nReturns the sample variance of expr. That is, the denominator is the\nnumber of rows minus one. This function was added in MySQL 5.0.3.\n\nVAR_SAMP() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (9,'CONCAT',35,'Syntax:\nCONCAT(str1,str2,...)\n\nReturns the string that results from concatenating the arguments. May\nhave one or more arguments. If all arguments are nonbinary strings, the\nresult is a nonbinary string. If the arguments include any binary\nstrings, the result is a binary string. A numeric argument is converted\nto its equivalent binary string form; if you want to avoid that, you\ncan use an explicit type cast, as in this example:\n\nSELECT CONCAT(CAST(int_col AS CHAR), char_col);\n\nCONCAT() returns NULL if any argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT CONCAT(\'My\', \'S\', \'QL\');\n        -> \'MySQL\'\nmysql> SELECT CONCAT(\'My\', NULL, \'QL\');\n        -> NULL\nmysql> SELECT CONCAT(14.3);\n        -> \'14.3\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (10,'GEOMETRY HIERARCHY',32,'Geometry is the base class. It is an abstract class. The instantiable\nsubclasses of Geometry are restricted to zero-, one-, and\ntwo-dimensional geometric objects that exist in two-dimensional\ncoordinate space. All instantiable geometry classes are defined so that\nvalid instances of a geometry class are topologically closed (that is,\nall defined geometries include their boundary).\n\nThe base Geometry class has subclasses for Point, Curve, Surface, and\nGeometryCollection:\n\no Point represents zero-dimensional objects.\n\no Curve represents one-dimensional objects, and has subclass\n  LineString, with sub-subclasses Line and LinearRing.\n\no Surface is designed for two-dimensional objects and has subclass\n  Polygon.\n\no GeometryCollection has specialized zero-, one-, and two-dimensional\n  collection classes named MultiPoint, MultiLineString, and\n  MultiPolygon for modeling geometries corresponding to collections of\n  Points, LineStrings, and Polygons, respectively. MultiCurve and\n  MultiSurface are introduced as abstract superclasses that generalize\n  the collection interfaces to handle Curves and Surfaces.\n\nGeometry, Curve, Surface, MultiCurve, and MultiSurface are defined as\nnoninstantiable classes. They define a common set of methods for their\nsubclasses and are included for extensibility.\n\nPoint, LineString, Polygon, GeometryCollection, MultiPoint,\nMultiLineString, and MultiPolygon are instantiable classes.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/gis-geometry-class-hierarchy.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/gis-geometry-class-hierarchy.html'),
 (11,'CHAR FUNCTION',35,'Syntax:\nCHAR(N,... [USING charset_name])\n\nCHAR() interprets each argument N as an integer and returns a string\nconsisting of the characters given by the code values of those\nintegers. NULL values are skipped.\nAs of MySQL 5.0.15, CHAR() arguments larger than 255 are converted into\nmultiple result bytes. For example, CHAR(256) is equivalent to\nCHAR(1,0), and CHAR(256*256) is equivalent to CHAR(1,0,0):\n\nmysql> SELECT HEX(CHAR(1,0)), HEX(CHAR(256));\n+----------------+----------------+\n| HEX(CHAR(1,0)) | HEX(CHAR(256)) |\n+----------------+----------------+\n| 0100           | 0100           |\n+----------------+----------------+\nmysql> SELECT HEX(CHAR(1,0,0)), HEX(CHAR(256*256));\n+------------------+--------------------+\n| HEX(CHAR(1,0,0)) | HEX(CHAR(256*256)) |\n+------------------+--------------------+\n| 010000           | 010000             |\n+------------------+--------------------+\n\nBy default, CHAR() returns a binary string. To produce a string in a\ngiven character set, use the optional USING clause:\n\nmysql> SELECT CHARSET(CHAR(0x65)), CHARSET(CHAR(0x65 USING utf8));\n+---------------------+--------------------------------+\n| CHARSET(CHAR(0x65)) | CHARSET(CHAR(0x65 USING utf8)) |\n+---------------------+--------------------------------+\n| binary              | utf8                           |\n+---------------------+--------------------------------+\n\nIf USING is given and the result string is illegal for the given\ncharacter set, a warning is issued. Also, if strict SQL mode is\nenabled, the result from CHAR() becomes NULL.\n\nBefore MySQL 5.0.15, CHAR() returns a string in the connection\ncharacter set and the USING clause is unavailable. In addition, each\nargument is interpreted modulo 256, so CHAR(256) and CHAR(256*256) both\nare equivalent to CHAR(0).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT CHAR(77,121,83,81,\'76\');\n        -> \'MySQL\'\nmysql> SELECT CHAR(77,77.3,\'77.3\');\n        -> \'MMM\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (12,'DATETIME',21,'DATETIME\n\nA date and time combination. The supported range is \'1000-01-01\n00:00:00\' to \'9999-12-31 23:59:59\'. MySQL displays DATETIME values in\n\'YYYY-MM-DD HH:MM:SS\' format, but permits assignment of values to\nDATETIME columns using either strings or numbers.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-type-overview.html'),
 (13,'SHOW CREATE PROCEDURE',25,'Syntax:\nSHOW CREATE PROCEDURE proc_name\n\nThis statement is a MySQL extension. It returns the exact string that\ncan be used to re-create the named stored procedure. A similar\nstatement, SHOW CREATE FUNCTION, displays information about stored\nfunctions (see [HELP SHOW CREATE FUNCTION]).\n\nBoth statements require that you be the owner of the routine or have\nSELECT access to the mysql.proc table. If you do not have privileges\nfor the routine itself, the value displayed for the Create Procedure or\nCreate Function field will be NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-create-procedure.html\n\n','mysql> SHOW CREATE PROCEDURE test.simpleproc\\G\n*************************** 1. row ***************************\n       Procedure: simpleproc\n        sql_mode:\nCreate Procedure: CREATE PROCEDURE `simpleproc`(OUT param1 INT)\n                  BEGIN\n                  SELECT COUNT(*) INTO param1 FROM t;\n                  END\n\nmysql> SHOW CREATE FUNCTION test.hello\\G\n*************************** 1. row ***************************\n       Function: hello\n       sql_mode:\nCreate Function: CREATE FUNCTION `hello`(s CHAR(20))\n                 RETURNS CHAR(50)\n                 RETURN CONCAT(\'Hello, \',s,\'!\')\n','http://dev.mysql.com/doc/refman/5.0/en/show-create-procedure.html'),
 (14,'OPEN',22,'Syntax:\nOPEN cursor_name\n\nThis statement opens a previously declared cursor. For an example, see\nhttp://dev.mysql.com/doc/refman/5.0/en/cursors.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/open.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/open.html'),
 (15,'INTEGER',21,'INTEGER[(M)] [UNSIGNED] [ZEROFILL]\n\nThis type is a synonym for INT.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html'),
 (16,'LOWER',35,'Syntax:\nLOWER(str)\n\nReturns the string str with all characters changed to lowercase\naccording to the current character set mapping. The default is latin1\n(cp1252 West European).\n\nmysql> SELECT LOWER(\'QUADRATICALLY\');\n        -> \'quadratically\'\n\nLOWER() (and UPPER()) are ineffective when applied to binary strings\n(BINARY, VARBINARY, BLOB). To perform lettercase conversion, convert\nthe string to a nonbinary string:\n\nmysql> SET @str = BINARY \'New York\';\nmysql> SELECT LOWER(@str), LOWER(CONVERT(@str USING latin1));\n+-------------+-----------------------------------+\n| LOWER(@str) | LOWER(CONVERT(@str USING latin1)) |\n+-------------+-----------------------------------+\n| New York    | new york                          |\n+-------------+-----------------------------------+\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (17,'SHOW COLUMNS',25,'Syntax:\nSHOW [FULL] COLUMNS {FROM | IN} tbl_name [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW COLUMNS displays information about the columns in a given table.\nIt also works for views as of MySQL 5.0.1. The LIKE clause, if present,\nindicates which column names to match. The WHERE clause can be given to\nselect rows using more general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.0/en/extended-show.html.\n\nmysql> SHOW COLUMNS FROM City;\n+------------+----------+------+-----+---------+----------------+\n| Field      | Type     | Null | Key | Default | Extra          |\n+------------+----------+------+-----+---------+----------------+\n| Id         | int(11)  | NO   | PRI | NULL    | auto_increment |\n| Name       | char(35) | NO   |     |         |                |\n| Country    | char(3)  | NO   | UNI |         |                |\n| District   | char(20) | YES  | MUL |         |                |\n| Population | int(11)  | NO   |     | 0       |                |\n+------------+----------+------+-----+---------+----------------+\n5 rows in set (0.00 sec)\n\nIf the data types differ from what you expect them to be based on a\nCREATE TABLE statement, note that MySQL sometimes changes data types\nwhen you create or alter a table. The conditions under which this\noccurs are described in\nhttp://dev.mysql.com/doc/refman/5.0/en/silent-column-changes.html.\n\nThe FULL keyword causes the output to include the column collation and\ncomments, as well as the privileges you have for each column.\n\nYou can use db_name.tbl_name as an alternative to the tbl_name FROM\ndb_name syntax. In other words, these two statements are equivalent:\n\nmysql> SHOW COLUMNS FROM mytable FROM mydb;\nmysql> SHOW COLUMNS FROM mydb.mytable;\n\nSHOW COLUMNS displays the following values for each table column:\n\nField indicates the column name.\n\nType indicates the column data type.\n\nCollation indicates the collation for nonbinary string columns, or NULL\nfor other columns. This value is displayed only if you use the FULL\nkeyword.\n\nThe Null field contains YES if NULL values can be stored in the column.\nIf not, the column contains NO as of MySQL 5.0.3, and \'\' before that.\n\nThe Key field indicates whether the column is indexed:\n\no If Key is empty, the column either is not indexed or is indexed only\n  as a secondary column in a multiple-column, nonunique index.\n\no If Key is PRI, the column is a PRIMARY KEY or is one of the columns\n  in a multiple-column PRIMARY KEY.\n\no If Key is UNI, the column is the first column of a unique-valued\n  index that cannot contain NULL values.\n\no If Key is MUL, multiple occurrences of a given value are permitted\n  within the column. The column is the first column of a nonunique\n  index or a unique-valued index that can contain NULL values.\n\nIf more than one of the Key values applies to a given column of a\ntable, Key displays the one with the highest priority, in the order\nPRI, UNI, MUL.\n\nA UNIQUE index may be displayed as PRI if it cannot contain NULL values\nand there is no PRIMARY KEY in the table. A UNIQUE index may display as\nMUL if several columns form a composite UNIQUE index; although the\ncombination of the columns is unique, each column can still hold\nmultiple occurrences of a given value.\n\nBefore MySQL 5.0.11, if the column permits NULL values, the Key value\ncan be MUL even when a single-column UNIQUE index is used. The\nrationale was that multiple rows in a UNIQUE index can hold a NULL\nvalue if the column is not declared NOT NULL. As of MySQL 5.0.11, the\ndisplay is UNI rather than MUL regardless of whether the column permits\nNULL; you can see from the Null field whether or not the column can\ncontain NULL.\n\nThe Default field indicates the default value that is assigned to the\ncolumn.\n\nThe Extra field contains any additional information that is available\nabout a given column. The value is auto_increment for columns that have\nthe AUTO_INCREMENT attribute and empty otherwise.\n\nPrivileges indicates the privileges you have for the column. This value\nis displayed only if you use the FULL keyword.\n\nComment indicates any comment the column has. This value is displayed\nonly if you use the FULL keyword.\n\nSHOW FIELDS is a synonym for SHOW COLUMNS. You can also list a table\'s\ncolumns with the mysqlshow db_name tbl_name command.\n\nThe DESCRIBE statement provides information similar to SHOW COLUMNS.\nSee [HELP DESCRIBE].\n\nThe SHOW CREATE TABLE, SHOW TABLE STATUS, and SHOW INDEX statements\nalso provide information about tables. See [HELP SHOW].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-columns.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-columns.html'),
 (18,'CREATE TRIGGER',37,'Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    TRIGGER trigger_name trigger_time trigger_event\n    ON tbl_name FOR EACH ROW trigger_body\n\nThis statement creates a new trigger. A trigger is a named database\nobject that is associated with a table, and that activates when a\nparticular event occurs for the table. The trigger becomes associated\nwith the table named tbl_name, which must refer to a permanent table.\nYou cannot associate a trigger with a TEMPORARY table or a view. CREATE\nTRIGGER was added in MySQL 5.0.2.\n\nIn MySQL 5.0 CREATE TRIGGER requires the SUPER privilege.\n\nThe DEFINER clause determines the security context to be used when\nchecking access privileges at trigger activation time. It was added in\nMySQL 5.0.17. See later in this section for more information.\n\ntrigger_time is the trigger action time. It can be BEFORE or AFTER to\nindicate that the trigger activates before or after each row to be\nmodified.\n\ntrigger_event indicates the kind of statement that activates the\ntrigger. The trigger_event can be one of the following:\n\no INSERT: The trigger is activated whenever a new row is inserted into\n  the table; for example, through INSERT, LOAD DATA, and REPLACE\n  statements.\n\no UPDATE: The trigger is activated whenever a row is modified; for\n  example, through UPDATE statements.\n\no DELETE: The trigger is activated whenever a row is deleted from the\n  table; for example, through DELETE and REPLACE statements. However,\n  DROP TABLE and TRUNCATE TABLE statements on the table do not activate\n  this trigger, because they do not use DELETE. See [HELP TRUNCATE\n  TABLE].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/create-trigger.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/create-trigger.html'),
 (19,'MONTH',30,'Syntax:\nMONTH(date)\n\nReturns the month for date, in the range 1 to 12 for January to\nDecember, or 0 for dates such as \'0000-00-00\' or \'2008-00-00\' that have\na zero month part.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT MONTH(\'2008-02-03\');\n        -> 2\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (20,'TINYINT',21,'TINYINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA very small integer. The signed range is -128 to 127. The unsigned\nrange is 0 to 255.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html'),
 (21,'SHOW TRIGGERS',25,'Syntax:\nSHOW TRIGGERS [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TRIGGERS lists the triggers currently defined for tables in a\ndatabase (the default database unless a FROM clause is given). This\nstatement returns results only if you have the SUPER privilege. It was\nimplemented in MySQL 5.0.10. The LIKE clause, if present, indicates\nwhich table names to match and causes the statement to display triggers\nfor those tables. The WHERE clause can be given to select rows using\nmore general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.0/en/extended-show.html.\n\nFor the trigger ins_sum as defined in\nhttp://dev.mysql.com/doc/refman/5.0/en/triggers.html, the output of\nthis statement is as shown here:\n\nmysql> SHOW TRIGGERS LIKE \'acc%\'\\G\n*************************** 1. row ***************************\n  Trigger: ins_sum\n    Event: INSERT\n    Table: account\nStatement: SET @sum = @sum + NEW.amount\n   Timing: BEFORE\n  Created: NULL\n sql_mode:\n  Definer: myname@localhost\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-triggers.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-triggers.html'),
 (22,'MASTER_POS_WAIT',14,'Syntax:\nMASTER_POS_WAIT(log_name,log_pos[,timeout])\n\nThis function is useful for control of master/slave synchronization. It\nblocks until the slave has read and applied all updates up to the\nspecified position in the master log. The return value is the number of\nlog events the slave had to wait for to advance to the specified\nposition. The function returns NULL if the slave SQL thread is not\nstarted, the slave\'s master information is not initialized, the\narguments are incorrect, or an error occurs. It returns -1 if the\ntimeout has been exceeded. If the slave SQL thread stops while\nMASTER_POS_WAIT() is waiting, the function returns NULL. If the slave\nis past the specified position, the function returns immediately.\n\nIf a timeout value is specified, MASTER_POS_WAIT() stops waiting when\ntimeout seconds have elapsed. timeout must be greater than 0; a zero or\nnegative timeout means no timeout.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html'),
 (23,'REGEXP',35,'Syntax:\nexpr REGEXP pat, expr RLIKE pat\n\nPerforms a pattern match of a string expression expr against a pattern\npat. The pattern can be an extended regular expression. The syntax for\nregular expressions is discussed in\nhttp://dev.mysql.com/doc/refman/5.0/en/regexp.html. Returns 1 if expr\nmatches pat; otherwise it returns 0. If either expr or pat is NULL, the\nresult is NULL. RLIKE is a synonym for REGEXP, provided for mSQL\ncompatibility.\n\nThe pattern need not be a literal string. For example, it can be\nspecified as a string expression or table column.\n\n*Note*: Because MySQL uses the C escape syntax in strings (for example,\n\"\\n\" to represent the newline character), you must double any \"\\\" that\nyou use in your REGEXP strings.\n\nREGEXP is not case sensitive, except when used with binary strings.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/regexp.html\n\n','mysql> SELECT \'Monty!\' REGEXP \'.*\';\n        -> 1\nmysql> SELECT \'new*\\n*line\' REGEXP \'new\\\\*.\\\\*line\';\n        -> 1\nmysql> SELECT \'a\' REGEXP \'A\', \'a\' REGEXP BINARY \'A\';\n        -> 1  0\nmysql> SELECT \'a\' REGEXP \'^[a-d]\';\n        -> 1\n','http://dev.mysql.com/doc/refman/5.0/en/regexp.html'),
 (24,'IF STATEMENT',22,'Syntax:\nIF search_condition THEN statement_list\n    [ELSEIF search_condition THEN statement_list] ...\n    [ELSE statement_list]\nEND IF\n\nThe IF statement for stored programs implements a basic conditional\nconstruct.\n\n*Note*: There is also an IF() function, which differs from the IF\nstatement described here. See\nhttp://dev.mysql.com/doc/refman/5.0/en/control-flow-functions.html. The\nIF statement can have THEN, ELSE, and ELSEIF clauses, and it is\nterminated with END IF.\n\nIf the search_condition evaluates to true, the corresponding THEN or\nELSEIF clause statement_list executes. If no search_condition matches,\nthe ELSE clause statement_list executes.\n\nEach statement_list consists of one or more SQL statements; an empty\nstatement_list is not permitted.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/if-statement.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/if-statement.html'),
 (25,'^',18,'Syntax:\n^\n\nBitwise XOR:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/bit-functions.html\n\n','mysql> SELECT 1 ^ 1;\n        -> 0\nmysql> SELECT 1 ^ 0;\n        -> 1\nmysql> SELECT 11 ^ 3;\n        -> 8\n','http://dev.mysql.com/doc/refman/5.0/en/bit-functions.html'),
 (26,'DROP VIEW',37,'Syntax:\nDROP VIEW [IF EXISTS]\n    view_name [, view_name] ...\n    [RESTRICT | CASCADE]\n\nDROP VIEW removes one or more views. You must have the DROP privilege\nfor each view. If any of the views named in the argument list do not\nexist, MySQL returns an error indicating by name which nonexisting\nviews it was unable to drop, but it also drops all of the views in the\nlist that do exist.\n\nThe IF EXISTS clause prevents an error from occurring for views that\ndon\'t exist. When this clause is given, a NOTE is generated for each\nnonexistent view. See [HELP SHOW WARNINGS].\n\nRESTRICT and CASCADE, if given, are parsed and ignored.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/drop-view.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/drop-view.html'),
 (27,'WITHIN',29,'Within(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially within g2. This\ntests the opposite relationship as Contains().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries\n\n','','http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-tes'),
 (28,'WEEK',30,'Syntax:\nWEEK(date[,mode])\n\nThis function returns the week number for date. The two-argument form\nof WEEK() enables you to specify whether the week starts on Sunday or\nMonday and whether the return value should be in the range from 0 to 53\nor from 1 to 53. If the mode argument is omitted, the value of the\ndefault_week_format system variable is used. See\nhttp://dev.mysql.com/doc/refman/5.0/en/server-system-variables.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT WEEK(\'2008-02-20\');\n        -> 7\nmysql> SELECT WEEK(\'2008-02-20\',0);\n        -> 7\nmysql> SELECT WEEK(\'2008-02-20\',1);\n        -> 8\nmysql> SELECT WEEK(\'2008-12-31\',1);\n        -> 53\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (29,'DROP FUNCTION UDF',20,'Syntax:\nDROP FUNCTION function_name\n\nThis statement drops the user-defined function (UDF) named\nfunction_name.\n\nTo drop a function, you must have the DELETE privilege for the mysql\ndatabase. This is because DROP FUNCTION removes a row from the\nmysql.func system table that records the function\'s name, type, and\nshared library name.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/drop-function-udf.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/drop-function-udf.html'),
 (30,'PREPARE',7,'Syntax:\nPREPARE stmt_name FROM preparable_stmt\n\nThe PREPARE statement prepares a statement and assigns it a name,\nstmt_name, by which to refer to the statement later. Statement names\nare not case sensitive. preparable_stmt is either a string literal or a\nuser variable that contains the text of the statement. The text must\nrepresent a single SQL statement, not multiple statements. Within the\nstatement, \"?\" characters can be used as parameter markers to indicate\nwhere data values are to be bound to the query later when you execute\nit. The \"?\" characters should not be enclosed within quotation marks,\neven if you intend to bind them to string values. Parameter markers can\nbe used only where data values should appear, not for SQL keywords,\nidentifiers, and so forth.\n\nIf a prepared statement with the given name already exists, it is\ndeallocated implicitly before the new statement is prepared. This means\nthat if the new statement contains an error and cannot be prepared, an\nerror is returned and no statement with the given name exists.\n\nA prepared statement is executed with EXECUTE and released with\nDEALLOCATE PREPARE.\n\nThe scope of a prepared statement is the session within which it is\ncreated. Other sessions cannot see it.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/prepare.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/prepare.html'),
 (31,'LOCK',7,'Syntax:\nLOCK TABLES\n    tbl_name [[AS] alias] lock_type\n    [, tbl_name [[AS] alias] lock_type] ...\n\nlock_type:\n    READ [LOCAL]\n  | [LOW_PRIORITY] WRITE\n\nUNLOCK TABLES\n\nMySQL enables client sessions to acquire table locks explicitly for the\npurpose of cooperating with other sessions for access to tables, or to\nprevent other sessions from modifying tables during periods when a\nsession requires exclusive access to them. A session can acquire or\nrelease locks only for itself. One session cannot acquire locks for\nanother session or release locks held by another session.\n\nLocks may be used to emulate transactions or to get more speed when\nupdating tables. This is explained in more detail later in this\nsection.\n\nLOCK TABLES explicitly acquires table locks for the current client\nsession. Table locks can be acquired for base tables or (as of MySQL\n5.0.6) views. You must have the LOCK TABLES privilege, and the SELECT\nprivilege for each object to be locked.\n\nFor view locking, LOCK TABLES adds all base tables used in the view to\nthe set of tables to be locked and locks them automatically. If you\nlock a table explicitly with LOCK TABLES, any tables used in triggers\nare also locked implicitly, as described in\nhttp://dev.mysql.com/doc/refman/5.0/en/lock-tables-and-triggers.html.\n\nUNLOCK TABLES explicitly releases any table locks held by the current\nsession.\n\nAnother use for UNLOCK TABLES is to release the global read lock\nacquired with the FLUSH TABLES WITH READ LOCK statement, which enables\nyou to lock all tables in all databases. See [HELP FLUSH]. (This is a\nvery convenient way to get backups if you have a file system such as\nVeritas that can take snapshots in time.)\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/lock-tables.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/lock-tables.html'),
 (32,'RESET SLAVE',7,'Syntax:\nRESET SLAVE\n\nRESET SLAVE makes the slave forget its replication position in the\nmaster\'s binary log. This statement is meant to be used for a clean\nstart: It deletes the master.info and relay-log.info files, all the\nrelay log files, and starts a new relay log file. To use RESET SLAVE,\nthe slave replication threads must be stopped (use STOP SLAVE if\nnecessary).\n\n*Note*: All relay log files are deleted, even if they have not been\ncompletely executed by the slave SQL thread. (This is a condition\nlikely to exist on a replication slave if you have issued a STOP SLAVE\nstatement or if the slave is highly loaded.)\n\nConnection information stored in the master.info file is immediately\nreset using any values specified in the corresponding startup options.\nThis information includes values such as master host, master port,\nmaster user, and master password. If the slave SQL thread was in the\nmiddle of replicating temporary tables when it was stopped, and RESET\nSLAVE is issued, these replicated temporary tables are deleted on the\nslave.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/reset-slave.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/reset-slave.html'),
 (33,'SHOW BINARY LOGS',25,'Syntax:\nSHOW BINARY LOGS\nSHOW MASTER LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [HELP PURGE BINARY LOGS], that shows\nhow to determine which logs can be purged.\n\nmysql> SHOW BINARY LOGS;\n+---------------+-----------+\n| Log_name      | File_size |\n+---------------+-----------+\n| binlog.000015 |    724935 |\n| binlog.000016 |    733481 |\n+---------------+-----------+\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-binary-logs.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-binary-logs.html'),
 (34,'POLYGON',23,'Polygon(ls1,ls2,...)\n\nConstructs a Polygon value from a number of LineString or WKB\nLineString arguments. If any argument does not represent a LinearRing\n(that is, not a closed and simple LineString), the return value is\nNULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-mysql-specific-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-mysql-specific-functions'),
 (35,'MINUTE',30,'Syntax:\nMINUTE(time)\n\nReturns the minute for time, in the range 0 to 59.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT MINUTE(\'2008-02-03 10:05:03\');\n        -> 5\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (36,'DAY',30,'Syntax:\nDAY(date)\n\nDAY() is a synonym for DAYOFMONTH().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (37,'MID',35,'Syntax:\nMID(str,pos,len)\n\nMID(str,pos,len) is a synonym for SUBSTRING(str,pos,len).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (38,'UUID',14,'Syntax:\nUUID()\n\nReturns a Universal Unique Identifier (UUID) generated according to\n\"DCE 1.1: Remote Procedure Call\" (Appendix A) CAE (Common Applications\nEnvironment) Specifications published by The Open Group in October 1997\n(Document Number C706,\nhttp://www.opengroup.org/public/pubs/catalog/c706.htm).\n\nA UUID is designed as a number that is globally unique in space and\ntime. Two calls to UUID() are expected to generate two different\nvalues, even if these calls are performed on two separate computers\nthat are not connected to each other.\n\nA UUID is a 128-bit number represented by a utf8 string of five\nhexadecimal numbers in aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee format:\n\no The first three numbers are generated from a timestamp.\n\no The fourth number preserves temporal uniqueness in case the timestamp\n  value loses monotonicity (for example, due to daylight saving time).\n\no The fifth number is an IEEE 802 node number that provides spatial\n  uniqueness. A random number is substituted if the latter is not\n  available (for example, because the host computer has no Ethernet\n  card, or we do not know how to find the hardware address of an\n  interface on your operating system). In this case, spatial uniqueness\n  cannot be guaranteed. Nevertheless, a collision should have very low\n  probability.\n\n  Currently, the MAC address of an interface is taken into account only\n  on FreeBSD and Linux. On other operating systems, MySQL uses a\n  randomly generated 48-bit number.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html\n\n','mysql> SELECT UUID();\n        -> \'6ccd780c-baba-1026-9564-0040f4311e29\'\n','http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html'),
 (39,'LINESTRING',23,'LineString(pt1,pt2,...)\n\nConstructs a LineString value from a number of Point or WKB Point\narguments. If the number of arguments is less than two, the return\nvalue is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-mysql-specific-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-mysql-specific-functions'),
 (40,'SLEEP',14,'Syntax:\nSLEEP(duration)\n\nSleeps (pauses) for the number of seconds given by the duration\nargument, then returns 0. If SLEEP() is interrupted, it returns 1. The\nduration may have a fractional part given in microseconds. This\nfunction was added in MySQL 5.0.12.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html'),
 (41,'CONNECTION_ID',16,'Syntax:\nCONNECTION_ID()\n\nReturns the connection ID (thread ID) for the connection. Every\nconnection has an ID that is unique among the set of currently\nconnected clients.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/information-functions.html\n\n','mysql> SELECT CONNECTION_ID();\n        -> 23786\n','http://dev.mysql.com/doc/refman/5.0/en/information-functions.html'),
 (42,'DELETE',26,'Syntax:\nSingle-table syntax:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE] FROM tbl_name\n    [WHERE where_condition]\n    [ORDER BY ...]\n    [LIMIT row_count]\n\nMultiple-table syntax:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE]\n    tbl_name[.*] [, tbl_name[.*]] ...\n    FROM table_references\n    [WHERE where_condition]\n\nOr:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE]\n    FROM tbl_name[.*] [, tbl_name[.*]] ...\n    USING table_references\n    [WHERE where_condition]\n\nFor the single-table syntax, the DELETE statement deletes rows from\ntbl_name and returns a count of the number of deleted rows. This count\ncan be obtained by calling the ROW_COUNT() function (see\nhttp://dev.mysql.com/doc/refman/5.0/en/information-functions.html). The\nWHERE clause, if given, specifies the conditions that identify which\nrows to delete. With no WHERE clause, all rows are deleted. If the\nORDER BY clause is specified, the rows are deleted in the order that is\nspecified. The LIMIT clause places a limit on the number of rows that\ncan be deleted.\n\nFor the multiple-table syntax, DELETE deletes from each tbl_name the\nrows that satisfy the conditions. In this case, ORDER BY and LIMIT\ncannot be used.\n\nwhere_condition is an expression that evaluates to true for each row to\nbe deleted. It is specified as described in\nhttp://dev.mysql.com/doc/refman/5.0/en/select.html.\n\nCurrently, you cannot delete from a table and select from the same\ntable in a subquery.\n\nYou need the DELETE privilege on a table to delete rows from it. You\nneed only the SELECT privilege for any columns that are only read, such\nas those named in the WHERE clause.\n\nAs stated, a DELETE statement with no WHERE clause deletes all rows. A\nfaster way to do this, when you do not need to know the number of\ndeleted rows, is to use TRUNCATE TABLE. However, within a transaction\nor if you have a lock on the table, TRUNCATE TABLE cannot be used\nwhereas DELETE can. See [HELP TRUNCATE TABLE], and [HELP LOCK].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/delete.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/delete.html'),
 (43,'ROUND',4,'Syntax:\nROUND(X), ROUND(X,D)\n\nRounds the argument X to D decimal places. The rounding algorithm\ndepends on the data type of X. D defaults to 0 if not specified. D can\nbe negative to cause D digits left of the decimal point of the value X\nto become zero.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT ROUND(-1.23);\n        -> -1\nmysql> SELECT ROUND(-1.58);\n        -> -2\nmysql> SELECT ROUND(1.58);\n        -> 2\nmysql> SELECT ROUND(1.298, 1);\n        -> 1.3\nmysql> SELECT ROUND(1.298, 0);\n        -> 1\nmysql> SELECT ROUND(23.298, -1);\n        -> 20\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (44,'NULLIF',6,'Syntax:\nNULLIF(expr1,expr2)\n\nReturns NULL if expr1 = expr2 is true, otherwise returns expr1. This is\nthe same as CASE WHEN expr1 = expr2 THEN NULL ELSE expr1 END.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/control-flow-functions.html\n\n','mysql> SELECT NULLIF(1,1);\n        -> NULL\nmysql> SELECT NULLIF(1,2);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.0/en/control-flow-functions.html'),
 (45,'CLOSE',22,'Syntax:\nCLOSE cursor_name\n\nThis statement closes a previously opened cursor. For an example, see\nhttp://dev.mysql.com/doc/refman/5.0/en/cursors.html.\n\nAn error occurs if the cursor is not open.\n\nIf not closed explicitly, a cursor is closed at the end of the BEGIN\n... END block in which it was declared.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/close.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/close.html'),
 (46,'STOP SLAVE',7,'Syntax:\nSTOP SLAVE [thread_type [, thread_type] ... ]\n\nthread_type: IO_THREAD | SQL_THREAD\n\nStops the slave threads. STOP SLAVE requires the SUPER privilege.\n\nLike START SLAVE, this statement may be used with the IO_THREAD and\nSQL_THREAD options to name the thread or threads to be stopped.\n\n*Note*: The transactional behavior of STOP SLAVE changed in MySQL\n5.0.82. Previously, it took effect immediately; beginning with MySQL\n5.0.82, it waits until the current replication event group (if any) has\nfinished executing, or until the user issues a KILL QUERY or KILL\nCONNECTION statement. (Bug #319, Bug #38205)\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/stop-slave.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/stop-slave.html'),
 (47,'TIMEDIFF',30,'Syntax:\nTIMEDIFF(expr1,expr2)\n\nTIMEDIFF() returns expr1 - expr2 expressed as a time value. expr1 and\nexpr2 are time or date-and-time expressions, but both must be of the\nsame type.\n\nThe result returned by TIMEDIFF() is limited to the range allowed for\nTIME values. Alternatively, you can use either of the functions\nTIMESTAMPDIFF() and UNIX_TIMESTAMP(), both of which return integers.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT TIMEDIFF(\'2000:01:01 00:00:00\',\n    ->                 \'2000:01:01 00:00:00.000001\');\n        -> \'-00:00:00.000001\'\nmysql> SELECT TIMEDIFF(\'2008-12-31 23:59:59.000001\',\n    ->                 \'2008-12-30 01:01:01.000002\');\n        -> \'46:58:57.999999\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (48,'REPLACE FUNCTION',35,'Syntax:\nREPLACE(str,from_str,to_str)\n\nReturns the string str with all occurrences of the string from_str\nreplaced by the string to_str. REPLACE() performs a case-sensitive\nmatch when searching for from_str.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT REPLACE(\'www.mysql.com\', \'w\', \'Ww\');\n        -> \'WwWwWw.mysql.com\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (49,'USE',27,'Syntax:\nUSE db_name\n\nThe USE db_name statement tells MySQL to use the db_name database as\nthe default (current) database for subsequent statements. The database\nremains the default until the end of the session or another USE\nstatement is issued:\n\nUSE db1;\nSELECT COUNT(*) FROM mytable;   # selects from db1.mytable\nUSE db2;\nSELECT COUNT(*) FROM mytable;   # selects from db2.mytable\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/use.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/use.html'),
 (50,'LINEFROMTEXT',3,'LineFromText(wkt[,srid]), LineStringFromText(wkt[,srid])\n\nConstructs a LINESTRING value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkt-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkt-functions'),
 (51,'CASE OPERATOR',6,'Syntax:\nCASE value WHEN [compare_value] THEN result [WHEN [compare_value] THEN\nresult ...] [ELSE result] END\n\nCASE WHEN [condition] THEN result [WHEN [condition] THEN result ...]\n[ELSE result] END\n\nThe first version returns the result where value=compare_value. The\nsecond version returns the result for the first condition that is true.\nIf there was no matching result value, the result after ELSE is\nreturned, or NULL if there is no ELSE part.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/control-flow-functions.html\n\n','mysql> SELECT CASE 1 WHEN 1 THEN \'one\'\n    ->     WHEN 2 THEN \'two\' ELSE \'more\' END;\n        -> \'one\'\nmysql> SELECT CASE WHEN 1>0 THEN \'true\' ELSE \'false\' END;\n        -> \'true\'\nmysql> SELECT CASE BINARY \'B\'\n    ->     WHEN \'a\' THEN 1 WHEN \'b\' THEN 2 END;\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.0/en/control-flow-functions.html'),
 (52,'SHOW MASTER STATUS',25,'Syntax:\nSHOW MASTER STATUS\n\nThis statement provides status information about the binary log files\nof the master. It requires either the SUPER or REPLICATION CLIENT\nprivilege.\n\nExample:\n\nmysql> SHOW MASTER STATUS;\n+---------------+----------+--------------+------------------+\n| File          | Position | Binlog_Do_DB | Binlog_Ignore_DB |\n+---------------+----------+--------------+------------------+\n| mysql-bin.003 | 73       | test         | manual,mysql     |\n+---------------+----------+--------------+------------------+\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-master-status.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-master-status.html'),
 (53,'ADDTIME',30,'Syntax:\nADDTIME(expr1,expr2)\n\nADDTIME() adds expr2 to expr1 and returns the result. expr1 is a time\nor datetime expression, and expr2 is a time expression.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT ADDTIME(\'2007-12-31 23:59:59.999999\', \'1 1:1:1.000002\');\n        -> \'2008-01-02 01:01:01.000001\'\nmysql> SELECT ADDTIME(\'01:00:00.999999\', \'02:00:00.999998\');\n        -> \'03:00:01.999997\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (54,'SPATIAL',32,'For MyISAM tables, MySQL can create spatial indexes using syntax\nsimilar to that for creating regular indexes, but extended with the\nSPATIAL keyword. Currently, columns in spatial indexes must be declared\nNOT NULL. The following examples demonstrate how to create spatial\nindexes:\n\no With CREATE TABLE:\n\nCREATE TABLE geom (g GEOMETRY NOT NULL, SPATIAL INDEX(g)) ENGINE=MyISAM;\n\no With ALTER TABLE:\n\nALTER TABLE geom ADD SPATIAL INDEX(g);\n\no With CREATE INDEX:\n\nCREATE SPATIAL INDEX sp_index ON geom (g);\n\nFor MyISAM tables, SPATIAL INDEX creates an R-tree index. For storage\nengines that support nonspatial indexing of spatial columns, the engine\ncreates a B-tree index. A B-tree index on spatial values will be useful\nfor exact-value lookups, but not for range scans.\n\nFor more information on indexing spatial columns, see [HELP CREATE\nINDEX].\n\nTo drop spatial indexes, use ALTER TABLE or DROP INDEX:\n\no With ALTER TABLE:\n\nALTER TABLE geom DROP INDEX g;\n\no With DROP INDEX:\n\nDROP INDEX sp_index ON geom;\n\nExample: Suppose that a table geom contains more than 32,000\ngeometries, which are stored in the column g of type GEOMETRY. The\ntable also has an AUTO_INCREMENT column fid for storing object ID\nvalues.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-indexes.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-indexes.html'),
 (55,'TIMESTAMPDIFF',30,'Syntax:\nTIMESTAMPDIFF(unit,datetime_expr1,datetime_expr2)\n\nReturns datetime_expr2 - datetime_expr1, where datetime_expr1 and\ndatetime_expr2 are date or datetime expressions. One expression may be\na date and the other a datetime; a date value is treated as a datetime\nhaving the time part \'00:00:00\' where necessary. The unit for the\nresult (an integer) is given by the unit argument. The legal values for\nunit are the same as those listed in the description of the\nTIMESTAMPADD() function.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT TIMESTAMPDIFF(MONTH,\'2003-02-01\',\'2003-05-01\');\n        -> 3\nmysql> SELECT TIMESTAMPDIFF(YEAR,\'2002-05-01\',\'2001-01-01\');\n        -> -1\nmysql> SELECT TIMESTAMPDIFF(MINUTE,\'2003-02-01\',\'2003-05-01 12:05:55\');\n        -> 128885\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (56,'UPPER',35,'Syntax:\nUPPER(str)\n\nReturns the string str with all characters changed to uppercase\naccording to the current character set mapping. The default is latin1\n(cp1252 West European).\n\nmysql> SELECT UPPER(\'Hej\');\n        -> \'HEJ\'\n\nSee the description of LOWER() for information that also applies to\nUPPER(), such as information about how to perform lettercase conversion\nof binary strings (BINARY, VARBINARY, BLOB) for which these functions\nare ineffective.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (57,'FROM_UNIXTIME',30,'Syntax:\nFROM_UNIXTIME(unix_timestamp), FROM_UNIXTIME(unix_timestamp,format)\n\nReturns a representation of the unix_timestamp argument as a value in\n\'YYYY-MM-DD HH:MM:SS\' or YYYYMMDDHHMMSS.uuuuuu format, depending on\nwhether the function is used in a string or numeric context. The value\nis expressed in the current time zone. unix_timestamp is an internal\ntimestamp value such as is produced by the UNIX_TIMESTAMP() function.\n\nIf format is given, the result is formatted according to the format\nstring, which is used the same way as listed in the entry for the\nDATE_FORMAT() function.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT FROM_UNIXTIME(1196440219);\n        -> \'2007-11-30 10:30:19\'\nmysql> SELECT FROM_UNIXTIME(1196440219) + 0;\n        -> 20071130103019.000000\nmysql> SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(),\n    ->                      \'%Y %D %M %h:%i:%s %x\');\n        -> \'2007 30th November 10:30:59 2007\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (58,'MEDIUMBLOB',21,'MEDIUMBLOB\n\nA BLOB column with a maximum length of 16,777,215 (224 - 1) bytes. Each\nMEDIUMBLOB value is stored using a three-byte length prefix that\nindicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html'),
 (59,'IFNULL',6,'Syntax:\nIFNULL(expr1,expr2)\n\nIf expr1 is not NULL, IFNULL() returns expr1; otherwise it returns\nexpr2. IFNULL() returns a numeric or string value, depending on the\ncontext in which it is used.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/control-flow-functions.html\n\n','mysql> SELECT IFNULL(1,0);\n        -> 1\nmysql> SELECT IFNULL(NULL,10);\n        -> 10\nmysql> SELECT IFNULL(1/0,10);\n        -> 10\nmysql> SELECT IFNULL(1/0,\'yes\');\n        -> \'yes\'\n','http://dev.mysql.com/doc/refman/5.0/en/control-flow-functions.html'),
 (60,'SHOW FUNCTION CODE',25,'Syntax:\nSHOW FUNCTION CODE func_name\n\nThis statement is similar to SHOW PROCEDURE CODE but for stored\nfunctions. See [HELP SHOW PROCEDURE CODE]. SHOW FUNCTION CODE was added\nin MySQL 5.0.17.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-function-code.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-function-code.html'),
 (61,'SHOW ERRORS',25,'Syntax:\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW COUNT(*) ERRORS\n\nThis statement is similar to SHOW WARNINGS, except that it displays\ninformation only for errors, rather than for errors, warnings, and\nnotes.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\nhttp://dev.mysql.com/doc/refman/5.0/en/select.html.\n\nThe SHOW COUNT(*) ERRORS statement displays the number of errors. You\ncan also retrieve this number from the error_count variable:\n\nSHOW COUNT(*) ERRORS;\nSELECT @@error_count;\n\nSHOW ERRORS and error_count apply only to errors, not warnings or\nnotes. In other respects, they are similar to SHOW WARNINGS and\nwarning_count. In particular, SHOW ERRORS cannot display information\nfor more than max_error_count messages, and error_count can exceed the\nvalue of max_error_count if the number of errors exceeds\nmax_error_count.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-errors.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-errors.html'),
 (62,'LEAST',17,'Syntax:\nLEAST(value1,value2,...)\n\nWith two or more arguments, returns the smallest (minimum-valued)\nargument. The arguments are compared using the following rules:\n\no If the return value is used in an INTEGER context or all arguments\n  are integer-valued, they are compared as integers.\n\no If the return value is used in a REAL context or all arguments are\n  real-valued, they are compared as reals.\n\no If the arguments comprise a mix of numbers and strings, they are\n  compared as numbers.\n\no If any argument is a nonbinary (character) string, the arguments are\n  compared as nonbinary strings.\n\no In all other cases, the arguments are compared as binary strings.\n\nBefore MySQL 5.0.13, LEAST() returns NULL only if all arguments are\nNULL. As of 5.0.13, it returns NULL if any argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT LEAST(2,0);\n        -> 0\nmysql> SELECT LEAST(34.0,3.0,5.0,767.0);\n        -> 3.0\nmysql> SELECT LEAST(\'B\',\'A\',\'C\');\n        -> \'A\'\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (63,'=',17,'=\n\nEqual:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT 1 = 0;\n        -> 0\nmysql> SELECT \'0\' = 0;\n        -> 1\nmysql> SELECT \'0.0\' = 0;\n        -> 1\nmysql> SELECT \'0.01\' = 0;\n        -> 0\nmysql> SELECT \'.01\' = 0.01;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (64,'REVERSE',35,'Syntax:\nREVERSE(str)\n\nReturns the string str with the order of the characters reversed.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT REVERSE(\'abc\');\n        -> \'cba\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (65,'ISNULL',17,'Syntax:\nISNULL(expr)\n\nIf expr is NULL, ISNULL() returns 1, otherwise it returns 0.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT ISNULL(1+1);\n        -> 0\nmysql> SELECT ISNULL(1/0);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (66,'BINARY',21,'BINARY(M)\n\nThe BINARY type is similar to the CHAR type, but stores binary byte\nstrings rather than nonbinary character strings. M represents the\ncolumn length in bytes.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html'),
 (67,'BLOB DATA TYPE',21,'A BLOB is a binary large object that can hold a variable amount of\ndata. The four BLOB types are TINYBLOB, BLOB, MEDIUMBLOB, and LONGBLOB.\nThese differ only in the maximum length of the values they can hold.\nThe four TEXT types are TINYTEXT, TEXT, MEDIUMTEXT, and LONGTEXT. These\ncorrespond to the four BLOB types and have the same maximum lengths and\nstorage requirements. See\nhttp://dev.mysql.com/doc/refman/5.0/en/storage-requirements.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/blob.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/blob.html'),
 (68,'BOUNDARY',34,'Boundary(g)\n\nReturns a geometry that is the closure of the combinatorial boundary of\nthe geometry value g.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#general-geometry-property-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#general-geometry-property-functions'),
 (69,'CREATE USER',9,'Syntax:\nCREATE USER user_specification\n    [, user_specification] ...\n\nuser_specification:\n    user [IDENTIFIED BY [PASSWORD] \'password\']\n\nThe CREATE USER statement creates new MySQL accounts. To use it, you\nmust have the global CREATE USER privilege or the INSERT privilege for\nthe mysql database. For each account, CREATE USER creates a new row in\nthe mysql.user table and assigns the account no privileges. An error\noccurs if the account already exists.\n\nEach account name uses the format described in\nhttp://dev.mysql.com/doc/refman/5.0/en/account-names.html. For example:\n\nCREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED BY \'mypass\';\n\nIf you specify only the user name part of the account name, a host name\npart of \'%\' is used.\n\nThe user specification may indicate how the user should authenticate\nwhen connecting to the server:\n\no To enable the user to connect with no password (which is insecure),\n  include no IDENTIFIED BY clause:\n\nCREATE USER \'jeffrey\'@\'localhost\';\n\no To assign a password, use IDENTIFIED BY with the literal plaintext\n  password value:\n\nCREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED BY \'mypass\';\n\no To avoid specifying the plaintext password if you know its hash value\n  (the value that PASSWORD() would return for the password), specify\n  the hash value preceded by the keyword PASSWORD:\n\nCREATE USER \'jeffrey\'@\'localhost\'\nIDENTIFIED BY PASSWORD \'*90E462C37378CED12064BB3388827D2BA3A9B689\';\n\nFor additional information about setting passwords, see\nhttp://dev.mysql.com/doc/refman/5.0/en/assigning-passwords.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/create-user.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/create-user.html'),
 (70,'POINT',23,'Point(x,y)\n\nConstructs a Point using its coordinates.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-mysql-specific-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-mysql-specific-functions'),
 (71,'CURRENT_USER',16,'Syntax:\nCURRENT_USER, CURRENT_USER()\n\nReturns the user name and host name combination for the MySQL account\nthat the server used to authenticate the current client. This account\ndetermines your access privileges. The return value is a string in the\nutf8 character set.\n\nThe value of CURRENT_USER() can differ from the value of USER().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/information-functions.html\n\n','mysql> SELECT USER();\n        -> \'davida@localhost\'\nmysql> SELECT * FROM mysql.user;\nERROR 1044: Access denied for user \'\'@\'localhost\' to\ndatabase \'mysql\'\nmysql> SELECT CURRENT_USER();\n        -> \'@localhost\'\n','http://dev.mysql.com/doc/refman/5.0/en/information-functions.html'),
 (72,'LCASE',35,'Syntax:\nLCASE(str)\n\nLCASE() is a synonym for LOWER().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (73,'<=',17,'Syntax:\n<=\n\nLess than or equal:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT 0.1 <= 2;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (74,'SHOW PROFILES',25,'Syntax:\nSHOW PROFILE [type [, type] ... ]\n    [FOR QUERY n]\n    [LIMIT row_count [OFFSET offset]]\n\ntype:\n    ALL\n  | BLOCK IO\n  | CONTEXT SWITCHES\n  | CPU\n  | IPC\n  | MEMORY\n  | PAGE FAULTS\n  | SOURCE\n  | SWAPS\n\nThe SHOW PROFILES and SHOW PROFILE statements display profiling\ninformation that indicates resource usage for statements executed\nduring the course of the current session.\n\nProfiling is controlled by the profiling session variable, which has a\ndefault value of 0 (OFF). Profiling is enabled by setting profiling to\n1 or ON:\n\nmysql> SET profiling = 1;\n\nSHOW PROFILES displays a list of the most recent statements sent to the\nmaster. The size of the list is controlled by the\nprofiling_history_size session variable, which has a default value of\n15. The maximum value is 100. Setting the value to 0 has the practical\neffect of disabling profiling.\n\nAll statements are profiled except SHOW PROFILES and SHOW PROFILE, so\nyou will find neither of those statements in the profile list.\nMalformed statements are profiled. For example, SHOW PROFILING is an\nillegal statement, and a syntax error occurs if you try to execute it,\nbut it will show up in the profiling list.\n\nSHOW PROFILE displays detailed information about a single statement.\nWithout the FOR QUERY n clause, the output pertains to the most\nrecently executed statement. If FOR QUERY n is included, SHOW PROFILE\ndisplays information for statement n. The values of n correspond to the\nQuery_ID values displayed by SHOW PROFILES.\n\nThe LIMIT row_count clause may be given to limit the output to\nrow_count rows. If LIMIT is given, OFFSET offset may be added to begin\nthe output offset rows into the full set of rows.\n\nBy default, SHOW PROFILE displays Status and Duration columns. The\nStatus values are like the State values displayed by SHOW PROCESSLIST,\nalthough there might be some minor differences in interpretion for the\ntwo statements for some status values (see\nhttp://dev.mysql.com/doc/refman/5.0/en/thread-information.html).\n\nOptional type values may be specified to display specific additional\ntypes of information:\n\no ALL displays all information\n\no BLOCK IO displays counts for block input and output operations\n\no CONTEXT SWITCHES displays counts for voluntary and involuntary\n  context switches\n\no CPU displays user and system CPU usage times\n\no IPC displays counts for messages sent and received\n\no MEMORY is not currently implemented\n\no PAGE FAULTS displays counts for major and minor page faults\n\no SOURCE displays the names of functions from the source code, together\n  with the name and line number of the file in which the function\n  occurs\n\no SWAPS displays swap counts\n\nProfiling is enabled per session. When a session ends, its profiling\ninformation is lost.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-profiles.html\n\n','mysql> SELECT @@profiling;\n+-------------+\n| @@profiling |\n+-------------+\n|           0 |\n+-------------+\n1 row in set (0.00 sec)\n\nmysql> SET profiling = 1;\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> DROP TABLE IF EXISTS t1;\nQuery OK, 0 rows affected, 1 warning (0.00 sec)\n\nmysql> CREATE TABLE T1 (id INT);\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SHOW PROFILES;\n+----------+----------+--------------------------+\n| Query_ID | Duration | Query                    |\n+----------+----------+--------------------------+\n|        0 | 0.000088 | SET PROFILING = 1        |\n|        1 | 0.000136 | DROP TABLE IF EXISTS t1  |\n|        2 | 0.011947 | CREATE TABLE t1 (id INT) |\n+----------+----------+--------------------------+\n3 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE;\n+----------------------+----------+\n| Status               | Duration |\n+----------------------+----------+\n| checking permissions | 0.000040 |\n| creating table       | 0.000056 |\n| After create         | 0.011363 |\n| query end            | 0.000375 |\n| freeing items        | 0.000089 |\n| logging slow query   | 0.000019 |\n| cleaning up          | 0.000005 |\n+----------------------+----------+\n7 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE FOR QUERY 1;\n+--------------------+----------+\n| Status             | Duration |\n+--------------------+----------+\n| query end          | 0.000107 |\n| freeing items      | 0.000008 |\n| logging slow query | 0.000015 |\n| cleaning up        | 0.000006 |\n+--------------------+----------+\n4 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE CPU FOR QUERY 2;\n+----------------------+----------+----------+------------+\n| Status               | Duration | CPU_user | CPU_system |\n+----------------------+----------+----------+------------+\n| checking permissions | 0.000040 | 0.000038 |   0.000002 |\n| creating table       | 0.000056 | 0.000028 |   0.000028 |\n| After create         | 0.011363 | 0.000217 |   0.001571 |\n| query end            | 0.000375 | 0.000013 |   0.000028 |\n| freeing items        | 0.000089 | 0.000010 |   0.000014 |\n| logging slow query   | 0.000019 | 0.000009 |   0.000010 |\n| cleaning up          | 0.000005 | 0.000003 |   0.000002 |\n+----------------------+----------+----------+------------+\n7 rows in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.0/en/show-profiles.html'),
 (75,'UPDATE',26,'Syntax:\nSingle-table syntax:\n\nUPDATE [LOW_PRIORITY] [IGNORE] table_reference\n    SET col_name1={expr1|DEFAULT} [, col_name2={expr2|DEFAULT}] ...\n    [WHERE where_condition]\n    [ORDER BY ...]\n    [LIMIT row_count]\n\nMultiple-table syntax:\n\nUPDATE [LOW_PRIORITY] [IGNORE] table_references\n    SET col_name1={expr1|DEFAULT} [, col_name2={expr2|DEFAULT}] ...\n    [WHERE where_condition]\n\nFor the single-table syntax, the UPDATE statement updates columns of\nexisting rows in the named table with new values. The SET clause\nindicates which columns to modify and the values they should be given.\nEach value can be given as an expression, or the keyword DEFAULT to set\na column explicitly to its default value. The WHERE clause, if given,\nspecifies the conditions that identify which rows to update. With no\nWHERE clause, all rows are updated. If the ORDER BY clause is\nspecified, the rows are updated in the order that is specified. The\nLIMIT clause places a limit on the number of rows that can be updated.\n\nFor the multiple-table syntax, UPDATE updates rows in each table named\nin table_references that satisfy the conditions. In this case, ORDER BY\nand LIMIT cannot be used.\n\nwhere_condition is an expression that evaluates to true for each row to\nbe updated. For expression syntax, see\nhttp://dev.mysql.com/doc/refman/5.0/en/expressions.html.\n\ntable_references and where_condition are is specified as described in\nhttp://dev.mysql.com/doc/refman/5.0/en/select.html.\n\nYou need the UPDATE privilege only for columns referenced in an UPDATE\nthat are actually updated. You need only the SELECT privilege for any\ncolumns that are read but not modified.\n\nThe UPDATE statement supports the following modifiers:\n\no With the LOW_PRIORITY keyword, execution of the UPDATE is delayed\n  until no other clients are reading from the table. This affects only\n  storage engines that use only table-level locking (such as MyISAM,\n  MEMORY, and MERGE).\n\no With the IGNORE keyword, the update statement does not abort even if\n  errors occur during the update. Rows for which duplicate-key\n  conflicts occur are not updated. Rows for which columns are updated\n  to values that would cause data conversion errors are updated to the\n  closest valid values instead.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/update.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/update.html');
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (76,'IS NOT NULL',17,'Syntax:\nIS NOT NULL\n\nTests whether a value is not NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT 1 IS NOT NULL, 0 IS NOT NULL, NULL IS NOT NULL;\n        -> 1, 1, 0\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (77,'CASE STATEMENT',22,'Syntax:\nCASE case_value\n    WHEN when_value THEN statement_list\n    [WHEN when_value THEN statement_list] ...\n    [ELSE statement_list]\nEND CASE\n\nOr:\n\nCASE\n    WHEN search_condition THEN statement_list\n    [WHEN search_condition THEN statement_list] ...\n    [ELSE statement_list]\nEND CASE\n\nThe CASE statement for stored programs implements a complex conditional\nconstruct.\n\n*Note*: There is also a CASE expression, which differs from the CASE\nstatement described here. See\nhttp://dev.mysql.com/doc/refman/5.0/en/control-flow-functions.html. The\nCASE statement cannot have an ELSE NULL clause, and it is terminated\nwith END CASE instead of END.\n\nFor the first syntax, case_value is an expression. This value is\ncompared to the when_value expression in each WHEN clause until one of\nthem is equal. When an equal when_value is found, the corresponding\nTHEN clause statement_list executes. If no when_value is equal, the\nELSE clause statement_list executes, if there is one.\n\nThis syntax cannot be used to test for equality with NULL because NULL\n= NULL is false. See\nhttp://dev.mysql.com/doc/refman/5.0/en/working-with-null.html.\n\nFor the second syntax, each WHEN clause search_condition expression is\nevaluated until one is true, at which point its corresponding THEN\nclause statement_list executes. If no search_condition is equal, the\nELSE clause statement_list executes, if there is one.\n\nIf no when_value or search_condition matches the value tested and the\nCASE statement contains no ELSE clause, a Case not found for CASE\nstatement error results.\n\nEach statement_list consists of one or more SQL statements; an empty\nstatement_list is not permitted.\n\nTo handle situations where no value is matched by any WHEN clause, use\nan ELSE containing an empty BEGIN ... END block, as shown in this\nexample. (The indentation used here in the ELSE clause is for purposes\nof clarity only, and is not otherwise significant.)\n\nDELIMITER |\n\nCREATE PROCEDURE p()\n  BEGIN\n    DECLARE v INT DEFAULT 1;\n\n    CASE v\n      WHEN 2 THEN SELECT v;\n      WHEN 3 THEN SELECT 0;\n      ELSE\n        BEGIN\n        END;\n    END CASE;\n  END;\n  |\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/case-statement.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/case-statement.html'),
 (78,'EXECUTE STATEMENT',7,'Syntax:\nEXECUTE stmt_name\n    [USING @var_name [, @var_name] ...]\n\nAfter preparing a statement with PREPARE, you execute it with an\nEXECUTE statement that refers to the prepared statement name. If the\nprepared statement contains any parameter markers, you must supply a\nUSING clause that lists user variables containing the values to be\nbound to the parameters. Parameter values can be supplied only by user\nvariables, and the USING clause must name exactly as many variables as\nthe number of parameter markers in the statement.\n\nYou can execute a given prepared statement multiple times, passing\ndifferent variables to it or setting the variables to different values\nbefore each execution.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/execute.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/execute.html'),
 (79,'DROP INDEX',37,'Syntax:\nDROP INDEX index_name ON tbl_name\n\nDROP INDEX drops the index named index_name from the table tbl_name.\nThis statement is mapped to an ALTER TABLE statement to drop the index.\nSee [HELP ALTER TABLE].\n\nTo drop a primary key, the index name is always PRIMARY, which must be\nspecified as a quoted identifier because PRIMARY is a reserved word:\n\nDROP INDEX `PRIMARY` ON t;\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/drop-index.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/drop-index.html'),
 (80,'MATCH AGAINST',35,'Syntax:\nMATCH (col1,col2,...) AGAINST (expr [search_modifier])\n\nMySQL has support for full-text indexing and searching:\n\no A full-text index in MySQL is an index of type FULLTEXT.\n\no Full-text indexes can be used only with MyISAM tables, and can be\n  created only for CHAR, VARCHAR, or TEXT columns.\n\no A FULLTEXT index definition can be given in the CREATE TABLE\n  statement when a table is created, or added later using ALTER TABLE\n  or CREATE INDEX.\n\no For large data sets, it is much faster to load your data into a table\n  that has no FULLTEXT index and then create the index after that, than\n  to load data into a table that has an existing FULLTEXT index.\n\nFull-text searching is performed using MATCH() ... AGAINST syntax.\nMATCH() takes a comma-separated list that names the columns to be\nsearched. AGAINST takes a string to search for, and an optional\nmodifier that indicates what type of search to perform. The search\nstring must be a literal string, not a variable or a column name. There\nare three types of full-text searches:\n\no A boolean search interprets the search string using the rules of a\n  special query language. The string contains the words to search for.\n  It can also contain operators that specify requirements such that a\n  word must be present or absent in matching rows, or that it should be\n  weighted higher or lower than usual. Common words such as \"some\" or\n  \"then\" are stopwords and do not match if present in the search\n  string. The IN BOOLEAN MODE modifier specifies a boolean search. For\n  more information, see\n  http://dev.mysql.com/doc/refman/5.0/en/fulltext-boolean.html.\n\no A natural language search interprets the search string as a phrase in\n  natural human language (a phrase in free text). There are no special\n  operators. The stopword list applies. In addition, words that are\n  present in 50% or more of the rows are considered common and do not\n  match. Full-text searches are natural language searches if no\n  modifier is given.\n\no A query expansion search is a modification of a natural language\n  search. The search string is used to perform a natural language\n  search. Then words from the most relevant rows returned by the search\n  are added to the search string and the search is done again. The\n  query returns the rows from the second search. The WITH QUERY\n  EXPANSION modifier specifies a query expansion search. For more\n  information, see\n  http://dev.mysql.com/doc/refman/5.0/en/fulltext-query-expansion.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/fulltext-search.html\n\n','mysql> SELECT id, body, MATCH (title,body) AGAINST\n    -> (\'Security implications of running MySQL as root\') AS score\n    -> FROM articles WHERE MATCH (title,body) AGAINST\n    -> (\'Security implications of running MySQL as root\');\n+----+-------------------------------------+-----------------+\n| id | body                                | score           |\n+----+-------------------------------------+-----------------+\n|  4 | 1. Never run mysqld as root. 2. ... | 1.5219271183014 |\n|  6 | When configured properly, MySQL ... | 1.3114095926285 |\n+----+-------------------------------------+-----------------+\n2 rows in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.0/en/fulltext-search.html'),
 (81,'ABS',4,'Syntax:\nABS(X)\n\nReturns the absolute value of X.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT ABS(2);\n        -> 2\nmysql> SELECT ABS(-32);\n        -> 32\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (82,'POLYFROMWKB',31,'PolyFromWKB(wkb[,srid]), PolygonFromWKB(wkb[,srid])\n\nConstructs a POLYGON value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkb-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkb-functions'),
 (83,'NOT LIKE',35,'Syntax:\nexpr NOT LIKE pat [ESCAPE \'escape_char\']\n\nThis is the same as NOT (expr LIKE pat [ESCAPE \'escape_char\']).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-comparison-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-comparison-functions.html'),
 (84,'SPACE',35,'Syntax:\nSPACE(N)\n\nReturns a string consisting of N space characters.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT SPACE(6);\n        -> \'      \'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (85,'MBR DEFINITION',5,'Its MBR (Minimum Bounding Rectangle), or Envelope. This is the bounding\ngeometry, formed by the minimum and maximum (X,Y) coordinates:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/gis-class-geometry.html\n\n','((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n','http://dev.mysql.com/doc/refman/5.0/en/gis-class-geometry.html'),
 (86,'GEOMETRYCOLLECTION',23,'GeometryCollection(g1,g2,...)\n\nConstructs a GeometryCollection.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-mysql-specific-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-mysql-specific-functions'),
 (87,'MAX',15,'Syntax:\nMAX([DISTINCT] expr)\n\nReturns the maximum value of expr. MAX() may take a string argument; in\nsuch cases, it returns the maximum string value. See\nhttp://dev.mysql.com/doc/refman/5.0/en/mysql-indexes.html. The DISTINCT\nkeyword can be used to find the maximum of the distinct values of expr,\nhowever, this produces the same result as omitting DISTINCT.\n\nMAX() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','mysql> SELECT student_name, MIN(test_score), MAX(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (88,'CREATE FUNCTION UDF',20,'Syntax:\nCREATE [AGGREGATE] FUNCTION function_name RETURNS {STRING|INTEGER|REAL|DECIMAL}\n    SONAME shared_library_name\n\nA user-defined function (UDF) is a way to extend MySQL with a new\nfunction that works like a native (built-in) MySQL function such as\nABS() or CONCAT().\n\nfunction_name is the name that should be used in SQL statements to\ninvoke the function. The RETURNS clause indicates the type of the\nfunction\'s return value. As of MySQL 5.0.3, DECIMAL is a legal value\nafter RETURNS, but currently DECIMAL functions return string values and\nshould be written like STRING functions.\n\nshared_library_name is the basename of the shared object file that\ncontains the code that implements the function. As of MySQL 5.0.67, the\nfile must be located in the plugin directory. This directory is given\nby the value of the plugin_dir system variable. If the value of\nplugin_dir is empty, the behavior that is used before 5.0.67 applies:\nThe file must be located in a directory that is searched by your\nsystem\'s dynamic linker. For more information, see\nhttp://dev.mysql.com/doc/refman/5.0/en/udf-compiling.html.\n\nTo create a function, you must have the INSERT privilege for the mysql\ndatabase. This is necessary because CREATE FUNCTION adds a row to the\nmysql.func system table that records the function\'s name, type, and\nshared library name. If you do not have this table, you should run the\nmysql_upgrade command to create it. See\nhttp://dev.mysql.com/doc/refman/5.0/en/mysql-upgrade.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/create-function-udf.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/create-function-udf.html'),
 (89,'*',4,'Syntax:\n*\n\nMultiplication:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/arithmetic-functions.html\n\n','mysql> SELECT 3*5;\n        -> 15\nmysql> SELECT 18014398509481984*18014398509481984.0;\n        -> 324518553658426726783156020576256.0\n','http://dev.mysql.com/doc/refman/5.0/en/arithmetic-functions.html'),
 (90,'TIMESTAMP',21,'TIMESTAMP\n\nA timestamp. The range is \'1970-01-01 00:00:01\' UTC to \'2038-01-19\n03:14:07\' UTC. TIMESTAMP values are stored as the number of seconds\nsince the epoch (\'1970-01-01 00:00:00\' UTC). A TIMESTAMP cannot\nrepresent the value \'1970-01-01 00:00:00\' because that is equivalent to\n0 seconds from the epoch and the value 0 is reserved for representing\n\'0000-00-00 00:00:00\', the \"zero\" TIMESTAMP value.\n\nUnless specified otherwise, the first TIMESTAMP column in a table is\ndefined to be automatically set to the date and time of the most recent\nmodification if not explicitly assigned a value. This makes TIMESTAMP\nuseful for recording the timestamp of an INSERT or UPDATE operation.\nYou can also set any TIMESTAMP column to the current date and time by\nassigning it a NULL value, unless it has been defined with the NULL\nattribute to permit NULL values. The automatic initialization and\nupdating to the current date and time can be specified using DEFAULT\nand ON UPDATE clauses, are described in\nhttp://dev.mysql.com/doc/refman/5.0/en/timestamp-initialization.html.\n\n*Note*: The TIMESTAMP format that was used prior to MySQL 4.1 is not\nsupported in MySQL 5.0; see MySQL 3.23, 4.0, 4.1 Reference Manual for\ninformation regarding the old format.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-type-overview.html'),
 (91,'DES_DECRYPT',11,'Syntax:\nDES_DECRYPT(crypt_str[,key_str])\n\nDecrypts a string encrypted with DES_ENCRYPT(). If an error occurs,\nthis function returns NULL.\n\nThis function works only if MySQL has been configured with SSL support.\nSee http://dev.mysql.com/doc/refman/5.0/en/secure-connections.html.\n\nIf no key_str argument is given, DES_DECRYPT() examines the first byte\nof the encrypted string to determine the DES key number that was used\nto encrypt the original string, and then reads the key from the DES key\nfile to decrypt the message. For this to work, the user must have the\nSUPER privilege. The key file can be specified with the --des-key-file\nserver option.\n\nIf you pass this function a key_str argument, that string is used as\nthe key for decrypting the message.\n\nIf the crypt_str argument does not appear to be an encrypted string,\nMySQL returns the given crypt_str.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html'),
 (92,'CACHE INDEX',25,'Syntax:\nCACHE INDEX\n  tbl_index_list [, tbl_index_list] ...\n  IN key_cache_name\n\ntbl_index_list:\n  tbl_name [[INDEX|KEY] (index_name[, index_name] ...)]\n\nThe CACHE INDEX statement assigns table indexes to a specific key\ncache. It is used only for MyISAM tables. After the indexes have been\nassigned, they can be preloaded into the cache if desired with LOAD\nINDEX INTO CACHE.\n\nThe following statement assigns indexes from the tables t1, t2, and t3\nto the key cache named hot_cache:\n\nmysql> CACHE INDEX t1, t2, t3 IN hot_cache;\n+---------+--------------------+----------+----------+\n| Table   | Op                 | Msg_type | Msg_text |\n+---------+--------------------+----------+----------+\n| test.t1 | assign_to_keycache | status   | OK       |\n| test.t2 | assign_to_keycache | status   | OK       |\n| test.t3 | assign_to_keycache | status   | OK       |\n+---------+--------------------+----------+----------+\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/cache-index.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/cache-index.html'),
 (93,'ENDPOINT',12,'EndPoint(ls)\n\nReturns the Point that is the endpoint of the LineString value ls.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#linestring-property-functions\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(EndPoint(GeomFromText(@ls)));\n+-------------------------------------+\n| AsText(EndPoint(GeomFromText(@ls))) |\n+-------------------------------------+\n| POINT(3 3)                          |\n+-------------------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#linestring-property-functions'),
 (94,'COMPRESS',11,'Syntax:\nCOMPRESS(string_to_compress)\n\nCompresses a string and returns the result as a binary string. This\nfunction requires MySQL to have been compiled with a compression\nlibrary such as zlib. Otherwise, the return value is always NULL. The\ncompressed string can be uncompressed with UNCOMPRESS().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html\n\n','mysql> SELECT LENGTH(COMPRESS(REPEAT(\'a\',1000)));\n        -> 21\nmysql> SELECT LENGTH(COMPRESS(\'\'));\n        -> 0\nmysql> SELECT LENGTH(COMPRESS(\'a\'));\n        -> 13\nmysql> SELECT LENGTH(COMPRESS(REPEAT(\'a\',16)));\n        -> 15\n','http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html'),
 (95,'INSERT',26,'Syntax:\nINSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    {VALUES | VALUE} ({expr | DEFAULT},...),(...),...\n    [ ON DUPLICATE KEY UPDATE\n      col_name=expr\n        [, col_name=expr] ... ]\n\nOr:\n\nINSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name\n    SET col_name={expr | DEFAULT}, ...\n    [ ON DUPLICATE KEY UPDATE\n      col_name=expr\n        [, col_name=expr] ... ]\n\nOr:\n\nINSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n    [ ON DUPLICATE KEY UPDATE\n      col_name=expr\n        [, col_name=expr] ... ]\n\nINSERT inserts new rows into an existing table. The INSERT ... VALUES\nand INSERT ... SET forms of the statement insert rows based on\nexplicitly specified values. The INSERT ... SELECT form inserts rows\nselected from another table or tables. INSERT ... SELECT is discussed\nfurther in [HELP INSERT SELECT].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/insert.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/insert.html'),
 (96,'COUNT',15,'Syntax:\nCOUNT(expr)\n\nReturns a count of the number of non-NULL values of expr in the rows\nretrieved by a SELECT statement. The result is a BIGINT value.\n\nCOUNT() returns 0 if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','mysql> SELECT student.student_name,COUNT(*)\n    ->        FROM student,course\n    ->        WHERE student.student_id=course.student_id\n    ->        GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (97,'HANDLER',26,'Syntax:\nHANDLER tbl_name OPEN [ [AS] alias]\n\nHANDLER tbl_name READ index_name { = | <= | >= | < | > } (value1,value2,...)\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ index_name { FIRST | NEXT | PREV | LAST }\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ { FIRST | NEXT }\n    [ WHERE where_condition ] [LIMIT ... ]\n\nHANDLER tbl_name CLOSE\n\nThe HANDLER statement provides direct access to table storage engine\ninterfaces. It is available for MyISAM and InnoDB tables.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/handler.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/handler.html'),
 (98,'MLINEFROMTEXT',3,'MLineFromText(wkt[,srid]), MultiLineStringFromText(wkt[,srid])\n\nConstructs a MULTILINESTRING value using its WKT representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkt-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkt-functions'),
 (99,'GEOMCOLLFROMWKB',31,'GeomCollFromWKB(wkb[,srid]), GeometryCollectionFromWKB(wkb[,srid])\n\nConstructs a GEOMETRYCOLLECTION value using its WKB representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkb-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkb-functions'),
 (100,'HELP_DATE',8,'This help information was generated from the MySQL 5.0 Reference Manual\non: 2012-03-02\n','',''),
 (101,'RENAME TABLE',37,'Syntax:\nRENAME TABLE tbl_name TO new_tbl_name\n    [, tbl_name2 TO new_tbl_name2] ...\n\nThis statement renames one or more tables.\n\nThe rename operation is done atomically, which means that no other\nsession can access any of the tables while the rename is running. For\nexample, if you have an existing table old_table, you can create\nanother table new_table that has the same structure but is empty, and\nthen replace the existing table with the empty one as follows (assuming\nthat backup_table does not already exist):\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/rename-table.html\n\n','CREATE TABLE new_table (...);\nRENAME TABLE old_table TO backup_table, new_table TO old_table;\n','http://dev.mysql.com/doc/refman/5.0/en/rename-table.html'),
 (102,'BOOLEAN',21,'BOOL, BOOLEAN\n\nThese types are synonyms for TINYINT(1). A value of zero is considered\nfalse. Nonzero values are considered true:\n\nmysql> SELECT IF(0, \'true\', \'false\');\n+------------------------+\n| IF(0, \'true\', \'false\') |\n+------------------------+\n| false                  |\n+------------------------+\n\nmysql> SELECT IF(1, \'true\', \'false\');\n+------------------------+\n| IF(1, \'true\', \'false\') |\n+------------------------+\n| true                   |\n+------------------------+\n\nmysql> SELECT IF(2, \'true\', \'false\');\n+------------------------+\n| IF(2, \'true\', \'false\') |\n+------------------------+\n| true                   |\n+------------------------+\n\nHowever, the values TRUE and FALSE are merely aliases for 1 and 0,\nrespectively, as shown here:\n\nmysql> SELECT IF(0 = FALSE, \'true\', \'false\');\n+--------------------------------+\n| IF(0 = FALSE, \'true\', \'false\') |\n+--------------------------------+\n| true                           |\n+--------------------------------+\n\nmysql> SELECT IF(1 = TRUE, \'true\', \'false\');\n+-------------------------------+\n| IF(1 = TRUE, \'true\', \'false\') |\n+-------------------------------+\n| true                          |\n+-------------------------------+\n\nmysql> SELECT IF(2 = TRUE, \'true\', \'false\');\n+-------------------------------+\n| IF(2 = TRUE, \'true\', \'false\') |\n+-------------------------------+\n| false                         |\n+-------------------------------+\n\nmysql> SELECT IF(2 = FALSE, \'true\', \'false\');\n+--------------------------------+\n| IF(2 = FALSE, \'true\', \'false\') |\n+--------------------------------+\n| false                          |\n+--------------------------------+\n\nThe last two statements display the results shown because 2 is equal to\nneither 1 nor 0.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html'),
 (103,'DEFAULT',14,'Syntax:\nDEFAULT(col_name)\n\nReturns the default value for a table column. Starting with MySQL\n5.0.2, an error results if the column has no default value.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html\n\n','mysql> UPDATE t SET i = DEFAULT(i)+1 WHERE id < 100;\n','http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html'),
 (104,'MOD',4,'Syntax:\nMOD(N,M), N % M, N MOD M\n\nModulo operation. Returns the remainder of N divided by M.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT MOD(234, 10);\n        -> 4\nmysql> SELECT 253 % 7;\n        -> 1\nmysql> SELECT MOD(29,9);\n        -> 2\nmysql> SELECT 29 MOD 9;\n        -> 2\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (105,'TINYTEXT',21,'TINYTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 255 (28 - 1) characters. The\neffective maximum length is less if the value contains multi-byte\ncharacters. Each TINYTEXT value is stored using a one-byte length\nprefix that indicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html'),
 (106,'OPTIMIZE TABLE',19,'Syntax:\nOPTIMIZE [NO_WRITE_TO_BINLOG | LOCAL] TABLE\n    tbl_name [, tbl_name] ...\n\nOPTIMIZE TABLE should be used if you have deleted a large part of a\ntable or if you have made many changes to a table with variable-length\nrows (tables that have VARCHAR, VARBINARY, BLOB, or TEXT columns).\nDeleted rows are maintained in a linked list and subsequent INSERT\noperations reuse old row positions. You can use OPTIMIZE TABLE to\nreclaim the unused space and to defragment the data file. After\nextensive changes to a table, this statement may also improve\nperformance of statements that use the table, sometimes significantly.\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/optimize-table.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/optimize-table.html'),
 (107,'DECODE',11,'Syntax:\nDECODE(crypt_str,pass_str)\n\nDecrypts the encrypted string crypt_str using pass_str as the password.\ncrypt_str should be a string returned from ENCODE().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html'),
 (108,'<=>',17,'Syntax:\n<=>\n\nNULL-safe equal. This operator performs an equality comparison like the\n= operator, but returns 1 rather than NULL if both operands are NULL,\nand 0 rather than NULL if one operand is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT 1 <=> 1, NULL <=> NULL, 1 <=> NULL;\n        -> 1, 1, 0\nmysql> SELECT 1 = 1, NULL = NULL, 1 = NULL;\n        -> 1, NULL, NULL\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (109,'HELP STATEMENT',27,'Syntax:\nHELP \'search_string\'\n\nThe HELP statement returns online information from the MySQL Reference\nmanual. Its proper operation requires that the help tables in the mysql\ndatabase be initialized with help topic information (see\nhttp://dev.mysql.com/doc/refman/5.0/en/server-side-help-support.html).\n\nThe HELP statement searches the help tables for the given search string\nand displays the result of the search. The search string is not case\nsensitive.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/help.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/help.html'),
 (110,'RESET',25,'Syntax:\nRESET reset_option [, reset_option] ...\n\nThe RESET statement is used to clear the state of various server\noperations. You must have the RELOAD privilege to execute RESET.\n\nRESET acts as a stronger version of the FLUSH statement. See [HELP\nFLUSH].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/reset.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/reset.html'),
 (111,'LOAD DATA FROM MASTER',7,'Syntax:\nLOAD DATA FROM MASTER\n\nThis feature is deprecated and should be avoided. It is subject to\nremoval in a future version of MySQL.\n\nSince the current implementation of LOAD DATA FROM MASTER and LOAD\nTABLE FROM MASTER is very limited, these statements are deprecated as\nof MySQL 4.1 and removed in MySQL 5.5.\n\nThe recommended alternative solution to using LOAD DATA FROM MASTER or\nLOAD TABLE FROM MASTER is using mysqldump or mysqlhotcopy. The latter\nrequires Perl and two Perl modules (DBI and DBD:mysql) and works for\nMyISAM and ARCHIVE tables only. With mysqldump, you can create SQL\ndumps on the master and pipe (or copy) these to a mysql client on the\nslave. This has the advantage of working for all storage engines, but\ncan be quite slow, since it works using SELECT.\n\nThis statement takes a snapshot of the master and copies it to the\nslave. It updates the values of MASTER_LOG_FILE and MASTER_LOG_POS so\nthat the slave starts replicating from the correct position. Any table\nand database exclusion rules specified with the --replicate-*-do-* and\n--replicate-*-ignore-* options are honored. --replicate-rewrite-db is\nnot taken into account because a user could use this option to set up a\nnonunique mapping such as --replicate-rewrite-db=\"db1->db3\" and\n--replicate-rewrite-db=\"db2->db3\", which would confuse the slave when\nloading tables from the master.\n\nUse of this statement is subject to the following conditions:\n\no It works only for MyISAM tables. Attempting to load a non-MyISAM\n  table results in the following error:\n\nERROR 1189 (08S01): Net error reading from master\n\no It acquires a global read lock on the master while taking the\n  snapshot, which prevents updates on the master during the load\n  operation.\n\nIf you are loading large tables, you might have to increase the values\nof net_read_timeout and net_write_timeout on both the master and slave\nservers. See\nhttp://dev.mysql.com/doc/refman/5.0/en/server-system-variables.html.\n\nNote that LOAD DATA FROM MASTER does not copy any tables from the mysql\ndatabase. This makes it easy to have different users and privileges on\nthe master and the slave.\n\nTo use LOAD DATA FROM MASTER, the replication account that is used to\nconnect to the master must have the RELOAD and SUPER privileges on the\nmaster and the SELECT privilege for all master tables you want to load.\nAll master tables for which the user does not have the SELECT privilege\nare ignored by LOAD DATA FROM MASTER. This is because the master hides\nthem from the user: LOAD DATA FROM MASTER calls SHOW DATABASES to know\nthe master databases to load, but SHOW DATABASES returns only databases\nfor which the user has some privilege. See [HELP SHOW DATABASES]. On\nthe slave side, the user that issues LOAD DATA FROM MASTER must have\nprivileges for dropping and creating the databases and tables that are\ncopied.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/load-data-from-master.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/load-data-from-master.html'),
 (112,'GET_LOCK',14,'Syntax:\nGET_LOCK(str,timeout)\n\nTries to obtain a lock with a name given by the string str, using a\ntimeout of timeout seconds. Returns 1 if the lock was obtained\nsuccessfully, 0 if the attempt timed out (for example, because another\nclient has previously locked the name), or NULL if an error occurred\n(such as running out of memory or the thread was killed with mysqladmin\nkill). If you have a lock obtained with GET_LOCK(), it is released when\nyou execute RELEASE_LOCK(), execute a new GET_LOCK(), or your\nconnection terminates (either normally or abnormally). Locks obtained\nwith GET_LOCK() do not interact with transactions. That is, committing\na transaction does not release any such locks obtained during the\ntransaction.\n\nThis function can be used to implement application locks or to simulate\nrecord locks. Names are locked on a server-wide basis. If a name has\nbeen locked by one client, GET_LOCK() blocks any request by another\nclient for a lock with the same name. This enables clients that agree\non a given lock name to use the name to perform cooperative advisory\nlocking. But be aware that it also enables a client that is not among\nthe set of cooperating clients to lock a name, either inadvertently or\ndeliberately, and thus prevent any of the cooperating clients from\nlocking that name. One way to reduce the likelihood of this is to use\nlock names that are database-specific or application-specific. For\nexample, use lock names of the form db_name.str or app_name.str.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html\n\n','mysql> SELECT GET_LOCK(\'lock1\',10);\n        -> 1\nmysql> SELECT IS_FREE_LOCK(\'lock2\');\n        -> 1\nmysql> SELECT GET_LOCK(\'lock2\',10);\n        -> 1\nmysql> SELECT RELEASE_LOCK(\'lock2\');\n        -> 1\nmysql> SELECT RELEASE_LOCK(\'lock1\');\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html'),
 (113,'UCASE',35,'Syntax:\nUCASE(str)\n\nUCASE() is a synonym for UPPER().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (114,'SHOW BINLOG EVENTS',25,'Syntax:\nSHOW BINLOG EVENTS\n   [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\n\nShows the events in the binary log. If you do not specify \'log_name\',\nthe first binary log is displayed.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-binlog-events.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-binlog-events.html'),
 (115,'MPOLYFROMWKB',31,'MPolyFromWKB(wkb[,srid]), MultiPolygonFromWKB(wkb[,srid])\n\nConstructs a MULTIPOLYGON value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkb-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkb-functions'),
 (116,'ITERATE',22,'Syntax:\nITERATE label\n\nITERATE can appear only within LOOP, REPEAT, and WHILE statements.\nITERATE means \"start the loop again.\"\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/iterate-statement.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/iterate-statement.html'),
 (117,'DO',26,'Syntax:\nDO expr [, expr] ...\n\nDO executes the expressions but does not return any results. In most\nrespects, DO is shorthand for SELECT expr, ..., but has the advantage\nthat it is slightly faster when you do not care about the result.\n\nDO is useful primarily with functions that have side effects, such as\nRELEASE_LOCK().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/do.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/do.html'),
 (118,'CURTIME',30,'Syntax:\nCURTIME()\n\nReturns the current time as a value in \'HH:MM:SS\' or HHMMSS.uuuuuu\nformat, depending on whether the function is used in a string or\nnumeric context. The value is expressed in the current time zone.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT CURTIME();\n        -> \'23:50:26\'\nmysql> SELECT CURTIME() + 0;\n        -> 235026.000000\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (119,'CHAR_LENGTH',35,'Syntax:\nCHAR_LENGTH(str)\n\nReturns the length of the string str, measured in characters. A\nmulti-byte character counts as a single character. This means that for\na string containing five two-byte characters, LENGTH() returns 10,\nwhereas CHAR_LENGTH() returns 5.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (120,'BIGINT',21,'BIGINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA large integer. The signed range is -9223372036854775808 to\n9223372036854775807. The unsigned range is 0 to 18446744073709551615.\n\nSERIAL is an alias for BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html'),
 (121,'SET',25,'Syntax:\nSET variable_assignment [, variable_assignment] ...\n\nvariable_assignment:\n      user_var_name = expr\n    | [GLOBAL | SESSION] system_var_name = expr\n    | [@@global. | @@session. | @@]system_var_name = expr\n\nThe SET statement assigns values to different types of variables that\naffect the operation of the server or your client. Older versions of\nMySQL employed SET OPTION, but this syntax is deprecated in favor of\nSET without OPTION.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/set-statement.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/set-statement.html'),
 (122,'CONV',4,'Syntax:\nCONV(N,from_base,to_base)\n\nConverts numbers between different number bases. Returns a string\nrepresentation of the number N, converted from base from_base to base\nto_base. Returns NULL if any argument is NULL. The argument N is\ninterpreted as an integer, but may be specified as an integer or a\nstring. The minimum base is 2 and the maximum base is 36. If to_base is\na negative number, N is regarded as a signed number. Otherwise, N is\ntreated as unsigned. CONV() works with 64-bit precision.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT CONV(\'a\',16,2);\n        -> \'1010\'\nmysql> SELECT CONV(\'6E\',18,8);\n        -> \'172\'\nmysql> SELECT CONV(-17,10,-18);\n        -> \'-H\'\nmysql> SELECT CONV(10+\'10\'+\'10\'+0xa,10,10);\n        -> \'40\'\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (123,'DATE',21,'DATE\n\nA date. The supported range is \'1000-01-01\' to \'9999-12-31\'. MySQL\ndisplays DATE values in \'YYYY-MM-DD\' format, but permits assignment of\nvalues to DATE columns using either strings or numbers.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-type-overview.html'),
 (124,'ASSIGN-VALUE',13,'Syntax:\n:=\n\nAssignment operator. Causes the user variable on the left hand side of\nthe operator to take on the value to its right. The value on the right\nhand side may be a literal value, another variable storing a value, or\nany legal expression that yields a scalar value, including the result\nof a query (provided that this value is a scalar value). You can\nperform multiple assignments in the same SET statement. You can perform\nmultiple assignments in the same statement-\n\nUnlike =, the := operator is never interpreted as a comparison\noperator. This means you can use := in any valid SQL statement (not\njust in SET statements) to assign a value to a variable.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/assignment-operators.html\n\n','mysql> SELECT @var1, @var2;\n        -> NULL, NULL\nmysql> SELECT @var1 := 1, @var2;\n        -> 1, NULL\nmysql> SELECT @var1, @var2;\n        -> 1, NULL\nmysql> SELECT @var1, @var2 := @var1;\n        -> 1, 1\nmysql> SELECT @var1, @var2;\n        -> 1, 1\n\nmysql> SELECT @var1:=COUNT(*) FROM t1;\n        -> 4\nmysql> SELECT @var1;\n        -> 4\n','http://dev.mysql.com/doc/refman/5.0/en/assignment-operators.html'),
 (125,'SHOW OPEN TABLES',25,'Syntax:\nSHOW OPEN TABLES [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW OPEN TABLES lists the non-TEMPORARY tables that are currently open\nin the table cache. See\nhttp://dev.mysql.com/doc/refman/5.0/en/table-cache.html. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in http://dev.mysql.com/doc/refman/5.0/en/extended-show.html.\n\nThe FROM and LIKE clauses may be used as of MySQL 5.0.12. The LIKE\nclause, if present, indicates which table names to match. The FROM\nclause, if present, restricts the tables shown to those present in the\ndb_name database.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-open-tables.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-open-tables.html'),
 (126,'EXTRACT',30,'Syntax:\nEXTRACT(unit FROM date)\n\nThe EXTRACT() function uses the same kinds of unit specifiers as\nDATE_ADD() or DATE_SUB(), but extracts parts from the date rather than\nperforming date arithmetic.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT EXTRACT(YEAR FROM \'2009-07-02\');\n       -> 2009\nmysql> SELECT EXTRACT(YEAR_MONTH FROM \'2009-07-02 01:02:03\');\n       -> 200907\nmysql> SELECT EXTRACT(DAY_MINUTE FROM \'2009-07-02 01:02:03\');\n       -> 20102\nmysql> SELECT EXTRACT(MICROSECOND\n    ->                FROM \'2003-01-02 10:30:00.000123\');\n        -> 123\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (127,'ENCRYPT',11,'Syntax:\nENCRYPT(str[,salt])\n\nEncrypts str using the Unix crypt() system call and returns a binary\nstring. The salt argument must be a string with at least two characters\nor the result will be NULL. If no salt argument is given, a random\nvalue is used.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html\n\n','mysql> SELECT ENCRYPT(\'hello\');\n        -> \'VxuFAJXVARROc\'\n','http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html'),
 (128,'SHOW STATUS',25,'Syntax:\nSHOW [GLOBAL | SESSION] STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW STATUS provides server status information. This information also\ncan be obtained using the mysqladmin extended-status command. The LIKE\nclause, if present, indicates which variable names to match. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in http://dev.mysql.com/doc/refman/5.0/en/extended-show.html.\nThis statement does not require any privilege. It requires only the\nability to connect to the server.\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern:\n\nmysql> SHOW STATUS LIKE \'Key%\';\n+--------------------+----------+\n| Variable_name      | Value    |\n+--------------------+----------+\n| Key_blocks_used    | 14955    |\n| Key_read_requests  | 96854827 |\n| Key_reads          | 162040   |\n| Key_write_requests | 7589728  |\n| Key_writes         | 3813196  |\n+--------------------+----------+\n\nThe GLOBAL and SESSION options are new in MySQL 5.0.2. With the GLOBAL\nmodifier, SHOW STATUS displays the status values for all connections to\nMySQL. With SESSION, it displays the status values for the current\nconnection. If no modifier is present, the default is SESSION. LOCAL is\na synonym for SESSION.\n\nSome status variables have only a global value. For these, you get the\nsame value for both GLOBAL and SESSION. The scope for each status\nvariable is listed at\nhttp://dev.mysql.com/doc/refman/5.0/en/server-status-variables.html.\n\n*Note*: Before MySQL 5.0.2, SHOW STATUS returned global status values.\nBecause the default as of 5.0.2 is to return session values, this is\nincompatible with previous versions. To issue a SHOW STATUS statement\nthat will retrieve global status values for all versions of MySQL,\nwrite it like this:\n\nSHOW /*!50002 GLOBAL */ STATUS;\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-status.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-status.html'),
 (129,'OLD_PASSWORD',11,'Syntax:\nOLD_PASSWORD(str)\n\nOLD_PASSWORD() was added when the implementation of PASSWORD() was\nchanged in MySQL 4.1 to improve security. OLD_PASSWORD() returns the\nvalue of the pre-4.1 implementation of PASSWORD() as a binary string,\nand is intended to permit you to reset passwords for any pre-4.1\nclients that need to connect to your version 5.0 MySQL server without\nlocking them out. See\nhttp://dev.mysql.com/doc/refman/5.0/en/password-hashing.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html'),
 (130,'FORMAT',35,'Syntax:\nFORMAT(X,D)\n\nFormats the number X to a format like \'#,###,###.##\', rounded to D\ndecimal places, and returns the result as a string. If D is 0, the\nresult has no decimal point or fractional part. D should be a constant\nvalue.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT FORMAT(12332.123456, 4);\n        -> \'12,332.1235\'\nmysql> SELECT FORMAT(12332.1,4);\n        -> \'12,332.1000\'\nmysql> SELECT FORMAT(12332.2,0);\n        -> \'12,332\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (131,'||',13,'Syntax:\nOR, ||\n\nLogical OR. When both operands are non-NULL, the result is 1 if any\noperand is nonzero, and 0 otherwise. With a NULL operand, the result is\n1 if the other operand is nonzero, and NULL otherwise. If both operands\nare NULL, the result is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/logical-operators.html\n\n','mysql> SELECT 1 || 1;\n        -> 1\nmysql> SELECT 1 || 0;\n        -> 1\nmysql> SELECT 0 || 0;\n        -> 0\nmysql> SELECT 0 || NULL;\n        -> NULL\nmysql> SELECT 1 || NULL;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.0/en/logical-operators.html'),
 (132,'BIT_LENGTH',35,'Syntax:\nBIT_LENGTH(str)\n\nReturns the length of the string str in bits.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT BIT_LENGTH(\'text\');\n        -> 32\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (133,'EXTERIORRING',2,'ExteriorRing(poly)\n\nReturns the exterior ring of the Polygon value poly as a LineString.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#polygon-property-functions\n\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT AsText(ExteriorRing(GeomFromText(@poly)));\n+-------------------------------------------+\n| AsText(ExteriorRing(GeomFromText(@poly))) |\n+-------------------------------------------+\n| LINESTRING(0 0,0 3,3 3,3 0,0 0)           |\n+-------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#polygon-property-functions'),
 (134,'GEOMFROMWKB',31,'GeomFromWKB(wkb[,srid]), GeometryFromWKB(wkb[,srid])\n\nConstructs a geometry value of any type using its WKB representation\nand SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkb-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkb-functions'),
 (135,'SHOW SLAVE HOSTS',25,'Syntax:\nSHOW SLAVE HOSTS\n\nDisplays a list of replication slaves currently registered with the\nmaster. Only slaves started with the --report-host=host_name option are\nvisible in this list.\n\nThe list is displayed on any server (not just the master server). The\noutput looks like this:\n\nmysql> SHOW SLAVE HOSTS;\n+------------+-----------+------+-----------+\n| Server_id  | Host      | Port | Master_id |\n+------------+-----------+------+-----------+\n|  192168010 | iconnect2 | 3306 | 192168011 |\n| 1921680101 | athena    | 3306 | 192168011 |\n+------------+-----------+------+-----------+\n\no Server_id: The unique server ID of the slave server, as configured in\n  the server\'s option file, or on the command line with\n  --server-id=value.\n\no Host: The host name of the slave server, as configured in the\n  server\'s option file, or on the command line with\n  --report-host=host_name. Note that this can differ from the machine\n  name as configured in the operating system.\n\no Port: The port the slave server is listening on.\n\no Master_id: The unique server ID of the master server that the slave\n  server is replicating from.\n\nSome MySQL versions report another variable, Rpl_recovery_rank. This\nvariable was never used, and was eventually removed. (Bug #13963)\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-slave-hosts.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-slave-hosts.html'),
 (136,'START TRANSACTION',7,'Syntax:\nSTART TRANSACTION [WITH CONSISTENT SNAPSHOT] | BEGIN [WORK]\nCOMMIT [WORK] [AND [NO] CHAIN] [[NO] RELEASE]\nROLLBACK [WORK] [AND [NO] CHAIN] [[NO] RELEASE]\nSET autocommit = {0 | 1}\n\nThe START TRANSACTION or BEGIN statement begins a new transaction.\nCOMMIT commits the current transaction, making its changes permanent.\nROLLBACK rolls back the current transaction, canceling its changes. The\nSET autocommit statement disables or enables the default autocommit\nmode for the current session.\n\nBeginning with MySQL 5.0.3, the optional WORK keyword is supported for\nCOMMIT and ROLLBACK, as are the CHAIN and RELEASE clauses. CHAIN and\nRELEASE can be used for additional control over transaction completion.\nThe value of the completion_type system variable determines the default\ncompletion behavior. See\nhttp://dev.mysql.com/doc/refman/5.0/en/server-system-variables.html.\n\n*Note*: Within stored programs (stored procedures and functions, and\ntriggers), the parser treats BEGIN [WORK] as the beginning of a BEGIN\n... END block. Begin a transaction in this context with START\nTRANSACTION instead.\n\nThe AND CHAIN clause causes a new transaction to begin as soon as the\ncurrent one ends, and the new transaction has the same isolation level\nas the just-terminated transaction. The RELEASE clause causes the\nserver to disconnect the current client session after terminating the\ncurrent transaction. Including the NO keyword suppresses CHAIN or\nRELEASE completion, which can be useful if the completion_type system\nvariable is set to cause chaining or release completion by default.\n\nBy default, MySQL runs with autocommit mode enabled. This means that as\nsoon as you execute a statement that updates (modifies) a table, MySQL\nstores the update on disk to make it permanent. To disable autocommit\nmode, use the following statement:\n\nSET autocommit=0;\n\nAfter disabling autocommit mode by setting the autocommit variable to\nzero, changes to transaction-safe tables (such as those for InnoDB,\nBDB, or NDBCLUSTER) are not made permanent immediately. You must use\nCOMMIT to store your changes to disk or ROLLBACK to ignore the changes.\n\nautocommit is a session variable and must be set for each session. If\nyou want to disable autocommit mode for each new connection, see the\ndescription of the autocommit system variable at\nhttp://dev.mysql.com/doc/refman/5.0/en/server-system-variables.html.\n\nTo disable autocommit mode for a single series of statements, use the\nSTART TRANSACTION statement:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/commit.html\n\n','START TRANSACTION;\nSELECT @A:=SUM(salary) FROM table1 WHERE type=1;\nUPDATE table2 SET summary=@A WHERE type=1;\nCOMMIT;\n','http://dev.mysql.com/doc/refman/5.0/en/commit.html'),
 (137,'BETWEEN AND',17,'Syntax:\nexpr BETWEEN min AND max\n\nIf expr is greater than or equal to min and expr is less than or equal\nto max, BETWEEN returns 1, otherwise it returns 0. This is equivalent\nto the expression (min <= expr AND expr <= max) if all the arguments\nare of the same type. Otherwise type conversion takes place according\nto the rules described in\nhttp://dev.mysql.com/doc/refman/5.0/en/type-conversion.html, but\napplied to all the three arguments.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT 2 BETWEEN 1 AND 3, 2 BETWEEN 3 and 1;\n        -> 1, 0\nmysql> SELECT 1 BETWEEN 2 AND 3;\n        -> 0\nmysql> SELECT \'b\' BETWEEN \'a\' AND \'c\';\n        -> 1\nmysql> SELECT 2 BETWEEN 2 AND \'3\';\n        -> 1\nmysql> SELECT 2 BETWEEN 2 AND \'x-3\';\n        -> 0\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (138,'MULTIPOLYGON',23,'MultiPolygon(poly1,poly2,...)\n\nConstructs a MultiPolygon value from a set of Polygon or WKB Polygon\narguments.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-mysql-specific-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-mysql-specific-functions'),
 (139,'TIME_FORMAT',30,'Syntax:\nTIME_FORMAT(time,format)\n\nThis is used like the DATE_FORMAT() function, but the format string may\ncontain format specifiers only for hours, minutes, seconds, and\nmicroseconds. Other specifiers produce a NULL value or 0.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT TIME_FORMAT(\'100:00:00\', \'%H %k %h %I %l\');\n        -> \'100 100 04 04 4\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (140,'LEFT',35,'Syntax:\nLEFT(str,len)\n\nReturns the leftmost len characters from the string str, or NULL if any\nargument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT LEFT(\'foobarbar\', 5);\n        -> \'fooba\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (141,'FLUSH QUERY CACHE',25,'You can defragment the query cache to better utilize its memory with\nthe FLUSH QUERY CACHE statement. The statement does not remove any\nqueries from the cache.\n\nThe RESET QUERY CACHE statement removes all query results from the\nquery cache. The FLUSH TABLES statement also does this.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/query-cache-status-and-maintenance.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/query-cache-status-and-maintenance.html'),
 (142,'SET DATA TYPE',21,'SET(\'value1\',\'value2\',...) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA set. A string object that can have zero or more values, each of which\nmust be chosen from the list of values \'value1\', \'value2\', ... A SET\ncolumn can have a maximum of 64 members. SET values are represented\ninternally as integers.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html'),
 (143,'RAND',4,'Syntax:\nRAND(), RAND(N)\n\nReturns a random floating-point value v in the range 0 <= v < 1.0. If a\nconstant integer argument N is specified, it is used as the seed value,\nwhich produces a repeatable sequence of column values. In the following\nexample, note that the sequences of values produced by RAND(3) is the\nsame both places where it occurs.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> CREATE TABLE t (i INT);\nQuery OK, 0 rows affected (0.42 sec)\n\nmysql> INSERT INTO t VALUES(1),(2),(3);\nQuery OK, 3 rows affected (0.00 sec)\nRecords: 3  Duplicates: 0  Warnings: 0\n\nmysql> SELECT i, RAND() FROM t;\n+------+------------------+\n| i    | RAND()           |\n+------+------------------+\n|    1 | 0.61914388706828 |\n|    2 | 0.93845168309142 |\n|    3 | 0.83482678498591 |\n+------+------------------+\n3 rows in set (0.00 sec)\n\nmysql> SELECT i, RAND(3) FROM t;\n+------+------------------+\n| i    | RAND(3)          |\n+------+------------------+\n|    1 | 0.90576975597606 |\n|    2 | 0.37307905813035 |\n|    3 | 0.14808605345719 |\n+------+------------------+\n3 rows in set (0.00 sec)\n\nmysql> SELECT i, RAND() FROM t;\n+------+------------------+\n| i    | RAND()           |\n+------+------------------+\n|    1 | 0.35877890638893 |\n|    2 | 0.28941420772058 |\n|    3 | 0.37073435016976 |\n+------+------------------+\n3 rows in set (0.00 sec)\n\nmysql> SELECT i, RAND(3) FROM t;\n+------+------------------+\n| i    | RAND(3)          |\n+------+------------------+\n|    1 | 0.90576975597606 |\n|    2 | 0.37307905813035 |\n|    3 | 0.14808605345719 |\n+------+------------------+\n3 rows in set (0.01 sec)\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (144,'RPAD',35,'Syntax:\nRPAD(str,len,padstr)\n\nReturns the string str, right-padded with the string padstr to a length\nof len characters. If str is longer than len, the return value is\nshortened to len characters.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT RPAD(\'hi\',5,\'?\');\n        -> \'hi???\'\nmysql> SELECT RPAD(\'hi\',1,\'?\');\n        -> \'h\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (145,'CREATE DATABASE',37,'Syntax:\nCREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name\n    [create_specification] ...\n\ncreate_specification:\n    [DEFAULT] CHARACTER SET [=] charset_name\n  | [DEFAULT] COLLATE [=] collation_name\n\nCREATE DATABASE creates a database with the given name. To use this\nstatement, you need the CREATE privilege for the database. CREATE\nSCHEMA is a synonym for CREATE DATABASE as of MySQL 5.0.2.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/create-database.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/create-database.html'),
 (146,'DEC',21,'DEC[(M[,D])] [UNSIGNED] [ZEROFILL], NUMERIC[(M[,D])] [UNSIGNED]\n[ZEROFILL], FIXED[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nThese types are synonyms for DECIMAL. The FIXED synonym is available\nfor compatibility with other database systems.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html'),
 (147,'VAR_POP',15,'Syntax:\nVAR_POP(expr)\n\nReturns the population standard variance of expr. It considers rows as\nthe whole population, not as a sample, so it has the number of rows as\nthe denominator. This function was added in MySQL 5.0.3. Before 5.0.3,\nyou can use VARIANCE(), which is equivalent but is not standard SQL.\n\nVAR_POP() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (148,'ELT',35,'Syntax:\nELT(N,str1,str2,str3,...)\n\nReturns str1 if N = 1, str2 if N = 2, and so on. Returns NULL if N is\nless than 1 or greater than the number of arguments. ELT() is the\ncomplement of FIELD().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT ELT(1, \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> \'ej\'\nmysql> SELECT ELT(4, \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> \'foo\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (149,'ALTER VIEW',37,'Syntax:\nALTER\n    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    [DEFINER = { user | CURRENT_USER }]\n    [SQL SECURITY { DEFINER | INVOKER }]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]\n\nThis statement changes the definition of a view, which must exist. The\nsyntax is similar to that for CREATE VIEW and the effect is the same as\nfor CREATE OR REPLACE VIEW. See [HELP CREATE VIEW]. This statement\nrequires the CREATE VIEW and DROP privileges for the view, and some\nprivilege for each column referred to in the SELECT statement. As of\nMySQL 5.0.52, ALTER VIEW is permitted only to the original definer or\nusers with the SUPER privilege.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/alter-view.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/alter-view.html'),
 (150,'SHOW DATABASES',25,'Syntax:\nSHOW {DATABASES | SCHEMAS}\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW DATABASES lists the databases on the MySQL server host. SHOW\nSCHEMAS is a synonym for SHOW DATABASES as of MySQL 5.0.2. The LIKE\nclause, if present, indicates which database names to match. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in http://dev.mysql.com/doc/refman/5.0/en/extended-show.html.\n\nYou see only those databases for which you have some kind of privilege,\nunless you have the global SHOW DATABASES privilege. You can also get\nthis list using the mysqlshow command.\n\nIf the server was started with the --skip-show-database option, you\ncannot use this statement at all unless you have the SHOW DATABASES\nprivilege.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-databases.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-databases.html'),
 (151,'~',18,'Syntax:\n~\n\nInvert all bits.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/bit-functions.html\n\n','mysql> SELECT 5 & ~1;\n        -> 4\n','http://dev.mysql.com/doc/refman/5.0/en/bit-functions.html'),
 (152,'TEXT',21,'TEXT[(M)] [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 65,535 (216 - 1) characters. The\neffective maximum length is less if the value contains multi-byte\ncharacters. Each TEXT value is stored using a two-byte length prefix\nthat indicates the number of bytes in the value.\n\nAn optional length M can be given for this type. If this is done, MySQL\ncreates the column as the smallest TEXT type large enough to hold\nvalues M characters long.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html'),
 (153,'CONCAT_WS',35,'Syntax:\nCONCAT_WS(separator,str1,str2,...)\n\nCONCAT_WS() stands for Concatenate With Separator and is a special form\nof CONCAT(). The first argument is the separator for the rest of the\narguments. The separator is added between the strings to be\nconcatenated. The separator can be a string, as can the rest of the\narguments. If the separator is NULL, the result is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT CONCAT_WS(\',\',\'First name\',\'Second name\',\'Last Name\');\n        -> \'First name,Second name,Last Name\'\nmysql> SELECT CONCAT_WS(\',\',\'First name\',NULL,\'Last Name\');\n        -> \'First name,Last Name\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (154,'ROW_COUNT',16,'Syntax:\nROW_COUNT()\n\nROW_COUNT() returns the number of rows changed, deleted, or inserted by\nthe last statement if it was an UPDATE, DELETE, or INSERT. For other\nstatements, the value may not be meaningful.\n\nFor UPDATE statements, the affected-rows value by default is the number\nof rows actually changed. If you specify the CLIENT_FOUND_ROWS flag to\nmysql_real_connect() when connecting to mysqld, the affected-rows value\nis the number of rows \"found\"; that is, matched by the WHERE clause.\n\nFor REPLACE statements, the affected-rows value is 2 if the new row\nreplaced an old row, because in this case, one row was inserted after\nthe duplicate was deleted.\n\nFor INSERT ... ON DUPLICATE KEY UPDATE statements, the affected-rows\nvalue is 1 if the row is inserted as a new row and 2 if an existing row\nis updated.\n\nThe ROW_COUNT() value is similar to the value from the\nmysql_affected_rows() C API function and the row count that the mysql\nclient displays following statement execution.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/information-functions.html\n\n','mysql> INSERT INTO t VALUES(1),(2),(3);\nQuery OK, 3 rows affected (0.00 sec)\nRecords: 3  Duplicates: 0  Warnings: 0\n\nmysql> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           3 |\n+-------------+\n1 row in set (0.00 sec)\n\nmysql> DELETE FROM t WHERE i IN(1,2);\nQuery OK, 2 rows affected (0.00 sec)\n\nmysql> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           2 |\n+-------------+\n1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.0/en/information-functions.html'),
 (155,'ASIN',4,'Syntax:\nASIN(X)\n\nReturns the arc sine of X, that is, the value whose sine is X. Returns\nNULL if X is not in the range -1 to 1.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT ASIN(0.2);\n        -> 0.20135792079033\nmysql> SELECT ASIN(\'foo\');\n\n+-------------+\n| ASIN(\'foo\') |\n+-------------+\n|           0 |\n+-------------+\n1 row in set, 1 warning (0.00 sec)\n\nmysql> SHOW WARNINGS;\n+---------+------+-----------------------------------------+\n| Level   | Code | Message                                 |\n+---------+------+-----------------------------------------+\n| Warning | 1292 | Truncated incorrect DOUBLE value: \'foo\' |\n+---------+------+-----------------------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (156,'SHOW LOGS',25,'Syntax:\nSHOW [BDB] LOGS\n\nIn MySQL 5.0, this is a deprecated synonym for SHOW ENGINE BDB LOGS.\nSee [HELP SHOW ENGINE].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-logs.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-logs.html'),
 (157,'SIGN',4,'Syntax:\nSIGN(X)\n\nReturns the sign of the argument as -1, 0, or 1, depending on whether X\nis negative, zero, or positive.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT SIGN(-32);\n        -> -1\nmysql> SELECT SIGN(0);\n        -> 0\nmysql> SELECT SIGN(234);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (158,'SEC_TO_TIME',30,'Syntax:\nSEC_TO_TIME(seconds)\n\nReturns the seconds argument, converted to hours, minutes, and seconds,\nas a TIME value. The range of the result is constrained to that of the\nTIME data type. A warning occurs if the argument corresponds to a value\noutside that range.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT SEC_TO_TIME(2378);\n        -> \'00:39:38\'\nmysql> SELECT SEC_TO_TIME(2378) + 0;\n        -> 3938\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (159,'FLOAT',21,'FLOAT[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA small (single-precision) floating-point number. Permissible values\nare -3.402823466E+38 to -1.175494351E-38, 0, and 1.175494351E-38 to\n3.402823466E+38. These are the theoretical limits, based on the IEEE\nstandard. The actual range might be slightly smaller depending on your\nhardware or operating system.\n\nM is the total number of digits and D is the number of digits following\nthe decimal point. If M and D are omitted, values are stored to the\nlimits permitted by the hardware. A single-precision floating-point\nnumber is accurate to approximately 7 decimal places.\n\nUNSIGNED, if specified, disallows negative values.\n\nUsing FLOAT might give you some unexpected problems because all\ncalculations in MySQL are done with double precision. See\nhttp://dev.mysql.com/doc/refman/5.0/en/no-matching-rows.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html');
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (160,'LOCATE',35,'Syntax:\nLOCATE(substr,str), LOCATE(substr,str,pos)\n\nThe first syntax returns the position of the first occurrence of\nsubstring substr in string str. The second syntax returns the position\nof the first occurrence of substring substr in string str, starting at\nposition pos. Returns 0 if substr is not in str.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT LOCATE(\'bar\', \'foobarbar\');\n        -> 4\nmysql> SELECT LOCATE(\'xbar\', \'foobar\');\n        -> 0\nmysql> SELECT LOCATE(\'bar\', \'foobarbar\', 5);\n        -> 7\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (161,'CHARSET',16,'Syntax:\nCHARSET(str)\n\nReturns the character set of the string argument.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/information-functions.html\n\n','mysql> SELECT CHARSET(\'abc\');\n        -> \'latin1\'\nmysql> SELECT CHARSET(CONVERT(\'abc\' USING utf8));\n        -> \'utf8\'\nmysql> SELECT CHARSET(USER());\n        -> \'utf8\'\n','http://dev.mysql.com/doc/refman/5.0/en/information-functions.html'),
 (162,'SUBDATE',30,'Syntax:\nSUBDATE(date,INTERVAL expr unit), SUBDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument, SUBDATE()\nis a synonym for DATE_SUB(). For information on the INTERVAL unit\nargument, see the discussion for DATE_ADD().\n\nmysql> SELECT DATE_SUB(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2007-12-02\'\nmysql> SELECT SUBDATE(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2007-12-02\'\n\nThe second form enables the use of an integer value for days. In such\ncases, it is interpreted as the number of days to be subtracted from\nthe date or datetime expression expr.\n\nmysql> SELECT SUBDATE(\'2008-01-02 12:00:00\', 31);\n        -> \'2007-12-02 12:00:00\'\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (163,'DAYOFYEAR',30,'Syntax:\nDAYOFYEAR(date)\n\nReturns the day of the year for date, in the range 1 to 366.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT DAYOFYEAR(\'2007-02-03\');\n        -> 34\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (164,'LONGTEXT',21,'LONGTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 4,294,967,295 or 4GB (232 - 1)\ncharacters. The effective maximum length is less if the value contains\nmulti-byte characters. The effective maximum length of LONGTEXT columns\nalso depends on the configured maximum packet size in the client/server\nprotocol and available memory. Each LONGTEXT value is stored using a\nfour-byte length prefix that indicates the number of bytes in the\nvalue.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html'),
 (165,'%',4,'Syntax:\nN % M, N MOD M\n\nModulo operation. Returns the remainder of N divided by M. For more\ninformation, see the description for the MOD() function in\nhttp://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/arithmetic-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/arithmetic-functions.html'),
 (166,'KILL',25,'Syntax:\nKILL [CONNECTION | QUERY] thread_id\n\nEach connection to mysqld runs in a separate thread. You can see which\nthreads are running with the SHOW PROCESSLIST statement and kill a\nthread with the KILL thread_id statement.\n\nIn MySQL 5.0.0, KILL permits an optional CONNECTION or QUERY modifier:\n\no KILL CONNECTION is the same as KILL with no modifier: It terminates\n  the connection associated with the given thread_id.\n\no KILL QUERY terminates the statement that the connection is currently\n  executing, but leaves the connection itself intact.\n\nIf you have the PROCESS privilege, you can see all threads. If you have\nthe SUPER privilege, you can kill all threads and statements.\nOtherwise, you can see and kill only your own threads and statements.\n\nYou can also use the mysqladmin processlist and mysqladmin kill\ncommands to examine and kill threads.\n\n*Note*: You cannot use KILL with the Embedded MySQL Server library\nbecause the embedded server merely runs inside the threads of the host\napplication. It does not create any connection threads of its own.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/kill.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/kill.html'),
 (167,'DISJOINT',29,'Disjoint(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially disjoint from (does\nnot intersect) g2.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries\n\n','','http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-tes'),
 (168,'ASTEXT',3,'AsText(g), AsWKT(g)\n\nConverts a value in internal geometry format to its WKT representation\nand returns the string result.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-to-convert-geometries-between-formats.html\n\n','mysql> SET @g = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(GeomFromText(@g));\n+--------------------------+\n| AsText(GeomFromText(@g)) |\n+--------------------------+\n| LINESTRING(1 1,2 2,3 3)  |\n+--------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/functions-to-convert-geometries-between-formats.html'),
 (169,'LPAD',35,'Syntax:\nLPAD(str,len,padstr)\n\nReturns the string str, left-padded with the string padstr to a length\nof len characters. If str is longer than len, the return value is\nshortened to len characters.\n\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT LPAD(\'hi\',4,\'??\');\n        -> \'??hi\'\nmysql> SELECT LPAD(\'hi\',1,\'??\');\n        -> \'h\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (170,'RESTORE TABLE',19,'Syntax:\nRESTORE TABLE tbl_name [, tbl_name] ... FROM \'/path/to/backup/directory\'\n\n*Note*: This statement is deprecated and is removed in MySQL 5.5.\n\nRESTORE TABLE restores the table or tables from a backup that was made\nwith BACKUP TABLE. The directory should be specified as a full path\nname.\n\nExisting tables are not overwritten; if you try to restore over an\nexisting table, an error occurs. Just as for BACKUP TABLE, RESTORE\nTABLE currently works only for MyISAM tables. Restored tables are not\nreplicated from master to slave.\n\nThe backup for each table consists of its .frm format file and .MYD\ndata file. The restore operation restores those files, and then uses\nthem to rebuild the .MYI index file. Restoring takes longer than\nbacking up due to the need to rebuild the indexes. The more indexes the\ntable has, the longer it takes.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/restore-table.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/restore-table.html'),
 (171,'DECLARE CONDITION',22,'Syntax:\nDECLARE condition_name CONDITION FOR condition_value\n\ncondition_value:\n    mysql_error_code\n  | SQLSTATE [VALUE] sqlstate_value\n\nThe DECLARE ... CONDITION statement declares a named error condition,\nassociating a name with a condition that needs specific handling. The\nname can be referred to in a subsequent DECLARE ... HANDLER statement\n(see [HELP DECLARE HANDLER]).\n\nCondition declarations must appear before cursor or handler\ndeclarations.\n\nThe condition_value for DECLARE ... CONDITION can be a MySQL error code\n(a number) or an SQLSTATE value (a 5-character string literal). You\nshould not use MySQL error code 0 or SQLSTATE values that begin with\n\'00\', because those indicate success rather than an error condition.\nFor a list of MySQL error codes and SQLSTATE values, see\nhttp://dev.mysql.com/doc/refman/5.0/en/error-messages-server.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/declare-condition.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/declare-condition.html'),
 (172,'OVERLAPS',29,'Overlaps(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially overlaps g2. The term\nspatially overlaps is used if two geometries intersect and their\nintersection results in a geometry of the same dimension but not equal\nto either of the given geometries.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries\n\n','','http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-tes'),
 (173,'SET GLOBAL SQL_SLAVE_SKIP_COUNTER',7,'Syntax:\nSET GLOBAL sql_slave_skip_counter = N\n\nThis statement skips the next N events from the master. This is useful\nfor recovering from replication stops caused by a statement.\n\nThis statement is valid only when the slave threads are not running.\nOtherwise, it produces an error.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/set-global-sql-slave-skip-counter.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/set-global-sql-slave-skip-counter.html'),
 (174,'NUMGEOMETRIES',24,'NumGeometries(gc)\n\nReturns the number of geometries in the GeometryCollection value gc.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#geometrycollection-property-functions\n\n','mysql> SET @gc = \'GeometryCollection(Point(1 1),LineString(2 2, 3 3))\';\nmysql> SELECT NumGeometries(GeomFromText(@gc));\n+----------------------------------+\n| NumGeometries(GeomFromText(@gc)) |\n+----------------------------------+\n|                                2 |\n+----------------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#geometrycollection-property-functions'),
 (175,'MONTHNAME',30,'Syntax:\nMONTHNAME(date)\n\nReturns the full name of the month for date. As of MySQL 5.0.25, the\nlanguage used for the name is controlled by the value of the\nlc_time_names system variable\n(http://dev.mysql.com/doc/refman/5.0/en/locale-support.html).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT MONTHNAME(\'2008-02-03\');\n        -> \'February\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (176,'PROCEDURE ANALYSE',36,'Syntax:\nANALYSE([max_elements[,max_memory]])\n\nANALYSE() is defined in the sql/sql_analyse.cc source file, which\nserves as an example of how to create a procedure for use with the\nPROCEDURE clause of SELECT statements. ANALYSE() is built in and is\navailable by default; other procedures can be created using the format\ndemonstrated in the source file.\n\nANALYSE() examines the result from a query and returns an analysis of\nthe results that suggests optimal data types for each column that may\nhelp reduce table sizes. To obtain this analysis, append PROCEDURE\nANALYSE to the end of a SELECT statement:\n\nSELECT ... FROM ... WHERE ... PROCEDURE ANALYSE([max_elements,[max_memory]])\n\nFor example:\n\nSELECT col1, col2 FROM table1 PROCEDURE ANALYSE(10, 2000);\n\nThe results show some statistics for the values returned by the query,\nand propose an optimal data type for the columns. This can be helpful\nfor checking your existing tables, or after importing new data. You may\nneed to try different settings for the arguments so that PROCEDURE\nANALYSE() does not suggest the ENUM data type when it is not\nappropriate.\n\nThe arguments are optional and are used as follows:\n\no max_elements (default 256) is the maximum number of distinct values\n  that ANALYSE() notices per column. This is used by ANALYSE() to check\n  whether the optimal data type should be of type ENUM; if there are\n  more than max_elements distinct values, then ENUM is not a suggested\n  type.\n\no max_memory (default 8192) is the maximum amount of memory that\n  ANALYSE() should allocate per column while trying to find all\n  distinct values.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/procedure-analyse.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/procedure-analyse.html'),
 (177,'CHANGE MASTER TO',7,'Syntax:\nCHANGE MASTER TO option [, option] ...\n\noption:\n    MASTER_HOST = \'host_name\'\n  | MASTER_USER = \'user_name\'\n  | MASTER_PASSWORD = \'password\'\n  | MASTER_PORT = port_num\n  | MASTER_CONNECT_RETRY = interval\n  | MASTER_LOG_FILE = \'master_log_name\'\n  | MASTER_LOG_POS = master_log_pos\n  | RELAY_LOG_FILE = \'relay_log_name\'\n  | RELAY_LOG_POS = relay_log_pos\n  | MASTER_SSL = {0|1}\n  | MASTER_SSL_CA = \'ca_file_name\'\n  | MASTER_SSL_CAPATH = \'ca_directory_name\'\n  | MASTER_SSL_CERT = \'cert_file_name\'\n  | MASTER_SSL_KEY = \'key_file_name\'\n  | MASTER_SSL_CIPHER = \'cipher_list\'\n\nCHANGE MASTER TO changes the parameters that the slave server uses for\nconnecting to the master server, for reading the master binary log, and\nreading the slave relay log. It also updates the contents of the\nmaster.info and relay-log.info files. To use CHANGE MASTER TO, the\nslave replication threads must be stopped (use STOP SLAVE if\nnecessary).\n\nOptions not specified retain their value, except as indicated in the\nfollowing discussion. Thus, in most cases, there is no need to specify\noptions that do not change. For example, if the password to connect to\nyour MySQL master has changed, you just need to issue these statements\nto tell the slave about the new password:\n\nSTOP SLAVE; -- if replication was running\nCHANGE MASTER TO MASTER_PASSWORD=\'new3cret\';\nSTART SLAVE; -- if you want to restart replication\n\nMASTER_HOST, MASTER_USER, MASTER_PASSWORD, and MASTER_PORT provide\ninformation to the slave about how to connect to its master:\n\no MASTER_HOST and MASTER_PORT are the host name (or IP address) of the\n  master host and its TCP/IP port.\n\n  *Note*: Replication cannot use Unix socket files. You must be able to\n  connect to the master MySQL server using TCP/IP.\n\n  If you specify the MASTER_HOST or MASTER_PORT option, the slave\n  assumes that the master server is different from before (even if the\n  option value is the same as its current value.) In this case, the old\n  values for the master binary log file name and position are\n  considered no longer applicable, so if you do not specify\n  MASTER_LOG_FILE and MASTER_LOG_POS in the statement,\n  MASTER_LOG_FILE=\'\' and MASTER_LOG_POS=4 are silently appended to it.\n\n  Setting MASTER_HOST=\'\'---that is, setting its value explicitly to an\n  empty string---is not the same as not setting it at all. Setting this\n  option to an empty string causes START SLAVE subsequently to fail.\n  (Bug #28796)\n\no MASTER_USER and MASTER_PASSWORD are the user name and password of the\n  account to use for connecting to the master.\n\n  Currently, a password used for a replication slave account can exceed\n  32 characters, but any characters in excess of this number are\n  truncated. This is not due to any limit imposed by the MySQL Server\n  but rather one that is specific to MySQL Replication. (See Bug\n  #43439, for more information.)\n\n  The text of a running CHANGE MASTER TO statement, including values\n  for MASTER_USER and MASTER_PASSWORD, can be seen in the output of a\n  concurrent SHOW PROCESSLIST statement.\n\nThe MASTER_SSL_xxx options provide information about using SSL for the\nconnection. They correspond to the --ssl-xxx options described in\nhttp://dev.mysql.com/doc/refman/5.0/en/ssl-options.html, and\nhttp://dev.mysql.com/doc/refman/5.0/en/replication-solutions-ssl.html.\nThese options can be changed even on slaves that are compiled without\nSSL support. They are saved to the master.info file, but are ignored if\nthe slave does not have SSL support enabled.\n\nMASTER_CONNECT_RETRY specifies how many seconds to wait between connect\nretries. The default is 60. The number of reconnection attempts is\nlimited by the --master-retry-count server option; for more\ninformation, see\nhttp://dev.mysql.com/doc/refman/5.0/en/replication-options.html.\n\nMASTER_LOG_FILE and MASTER_LOG_POS are the coordinates at which the\nslave I/O thread should begin reading from the master the next time the\nthread starts. RELAY_LOG_FILE and RELAY_LOG_POS are the coordinates at\nwhich the slave SQL thread should begin reading from the relay log the\nnext time the thread starts. If you specify either of MASTER_LOG_FILE\nor MASTER_LOG_POS, you cannot specify RELAY_LOG_FILE or RELAY_LOG_POS.\nIf neither of MASTER_LOG_FILE or MASTER_LOG_POS is specified, the slave\nuses the last coordinates of the slave SQL thread before CHANGE MASTER\nTO was issued. This ensures that there is no discontinuity in\nreplication, even if the slave SQL thread was late compared to the\nslave I/O thread, when you merely want to change, say, the password to\nuse.\n\nCHANGE MASTER TO deletes all relay log files and starts a new one,\nunless you specify RELAY_LOG_FILE or RELAY_LOG_POS. In that case, relay\nlog files are kept; the relay_log_purge global variable is set silently\nto 0.\n\nCHANGE MASTER TO is useful for setting up a slave when you have the\nsnapshot of the master and have recorded the master binary log\ncoordinates corresponding to the time of the snapshot. After loading\nthe snapshot into the slave to synchronize it to the slave, you can run\nCHANGE MASTER TO MASTER_LOG_FILE=\'log_name\', MASTER_LOG_POS=log_pos on\nthe slave to specify the coordinates at which the slave should begin\nreading the master binary log.\n\nThe following example changes the master server the slave uses and\nestablishes the master binary log coordinates from which the slave\nbegins reading. This is used when you want to set up the slave to\nreplicate the master:\n\nCHANGE MASTER TO\n  MASTER_HOST=\'master2.mycompany.com\',\n  MASTER_USER=\'replication\',\n  MASTER_PASSWORD=\'bigs3cret\',\n  MASTER_PORT=3306,\n  MASTER_LOG_FILE=\'master2-bin.001\',\n  MASTER_LOG_POS=4,\n  MASTER_CONNECT_RETRY=10;\n\nThe next example shows an operation that is less frequently employed.\nIt is used when the slave has relay log files that you want it to\nexecute again for some reason. To do this, the master need not be\nreachable. You need only use CHANGE MASTER TO and start the SQL thread\n(START SLAVE SQL_THREAD):\n\nCHANGE MASTER TO\n  RELAY_LOG_FILE=\'slave-relay-bin.006\',\n  RELAY_LOG_POS=4025;\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/change-master-to.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/change-master-to.html'),
 (178,'DROP DATABASE',37,'Syntax:\nDROP {DATABASE | SCHEMA} [IF EXISTS] db_name\n\nDROP DATABASE drops all tables in the database and deletes the\ndatabase. Be very careful with this statement! To use DROP DATABASE,\nyou need the DROP privilege on the database. DROP SCHEMA is a synonym\nfor DROP DATABASE as of MySQL 5.0.2.\n\n*Important*: When a database is dropped, user privileges on the\ndatabase are not automatically dropped. See [HELP GRANT].\n\nIF EXISTS is used to prevent an error from occurring if the database\ndoes not exist.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/drop-database.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/drop-database.html'),
 (179,'MBREQUAL',5,'MBREqual(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 are the same.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr\n\n','','http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geome'),
 (180,'TIMESTAMP FUNCTION',30,'Syntax:\nTIMESTAMP(expr), TIMESTAMP(expr1,expr2)\n\nWith a single argument, this function returns the date or datetime\nexpression expr as a datetime value. With two arguments, it adds the\ntime expression expr2 to the date or datetime expression expr1 and\nreturns the result as a datetime value.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT TIMESTAMP(\'2003-12-31\');\n        -> \'2003-12-31 00:00:00\'\nmysql> SELECT TIMESTAMP(\'2003-12-31 12:00:00\',\'12:00:00\');\n        -> \'2004-01-01 00:00:00\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (181,'HELP_VERSION',8,'This help information was generated from the MySQL 5.0 Reference Manual\non: 2012-03-02 (revision: 29458)\n\nThis information applies to MySQL 5.0 through 5.0.96.\n','',''),
 (182,'CHARACTER_LENGTH',35,'Syntax:\nCHARACTER_LENGTH(str)\n\nCHARACTER_LENGTH() is a synonym for CHAR_LENGTH().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (183,'SHOW GRANTS',25,'Syntax:\nSHOW GRANTS [FOR user]\n\nThis statement lists the GRANT statement or statements that must be\nissued to duplicate the privileges that are granted to a MySQL user\naccount. The account is named using the same format as for the GRANT\nstatement; for example, \'jeffrey\'@\'localhost\'. If you specify only the\nuser name part of the account name, a host name part of \'%\' is used.\nFor additional information about specifying account names, see [HELP\nGRANT].\n\nmysql> SHOW GRANTS FOR \'root\'@\'localhost\';\n+---------------------------------------------------------------------+\n| Grants for root@localhost                                           |\n+---------------------------------------------------------------------+\n| GRANT ALL PRIVILEGES ON *.* TO \'root\'@\'localhost\' WITH GRANT OPTION |\n+---------------------------------------------------------------------+\n\nTo list the privileges granted to the account that you are using to\nconnect to the server, you can use any of the following statements:\n\nSHOW GRANTS;\nSHOW GRANTS FOR CURRENT_USER;\nSHOW GRANTS FOR CURRENT_USER();\n\nAs of MySQL 5.0.24, if SHOW GRANTS FOR CURRENT_USER (or any of the\nequivalent syntaxes) is used in DEFINER context, such as within a\nstored procedure that is defined with SQL SECURITY DEFINER), the grants\ndisplayed are those of the definer and not the invoker.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-grants.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-grants.html'),
 (184,'SHOW PRIVILEGES',25,'Syntax:\nSHOW PRIVILEGES\n\nSHOW PRIVILEGES shows the list of system privileges that the MySQL\nserver supports. The exact list of privileges depends on the version of\nyour server.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-privileges.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-privileges.html'),
 (185,'INSERT FUNCTION',35,'Syntax:\nINSERT(str,pos,len,newstr)\n\nReturns the string str, with the substring beginning at position pos\nand len characters long replaced by the string newstr. Returns the\noriginal string if pos is not within the length of the string. Replaces\nthe rest of the string from position pos if len is not within the\nlength of the rest of the string. Returns NULL if any argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT INSERT(\'Quadratic\', 3, 4, \'What\');\n        -> \'QuWhattic\'\nmysql> SELECT INSERT(\'Quadratic\', -1, 4, \'What\');\n        -> \'Quadratic\'\nmysql> SELECT INSERT(\'Quadratic\', 3, 100, \'What\');\n        -> \'QuWhat\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (186,'CRC32',4,'Syntax:\nCRC32(expr)\n\nComputes a cyclic redundancy check value and returns a 32-bit unsigned\nvalue. The result is NULL if the argument is NULL. The argument is\nexpected to be a string and (if possible) is treated as one if it is\nnot.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT CRC32(\'MySQL\');\n        -> 3259397556\nmysql> SELECT CRC32(\'mysql\');\n        -> 2501908538\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (187,'XOR',13,'Syntax:\nXOR\n\nLogical XOR. Returns NULL if either operand is NULL. For non-NULL\noperands, evaluates to 1 if an odd number of operands is nonzero,\notherwise 0 is returned.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/logical-operators.html\n\n','mysql> SELECT 1 XOR 1;\n        -> 0\nmysql> SELECT 1 XOR 0;\n        -> 1\nmysql> SELECT 1 XOR NULL;\n        -> NULL\nmysql> SELECT 1 XOR 1 XOR 1;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.0/en/logical-operators.html'),
 (188,'STARTPOINT',12,'StartPoint(ls)\n\nReturns the Point that is the start point of the LineString value ls.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#linestring-property-functions\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(StartPoint(GeomFromText(@ls)));\n+---------------------------------------+\n| AsText(StartPoint(GeomFromText(@ls))) |\n+---------------------------------------+\n| POINT(1 1)                            |\n+---------------------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#linestring-property-functions'),
 (189,'GRANT',9,'Syntax:\nGRANT\n    priv_type [(column_list)]\n      [, priv_type [(column_list)]] ...\n    ON [object_type] priv_level\n    TO user_specification [, user_specification] ...\n    [REQUIRE {NONE | ssl_option [[AND] ssl_option] ...}]\n    [WITH with_option ...]\n\nobject_type:\n    TABLE\n  | FUNCTION\n  | PROCEDURE\n\npriv_level:\n    *\n  | *.*\n  | db_name.*\n  | db_name.tbl_name\n  | tbl_name\n  | db_name.routine_name\n\nuser_specification:\n    user [IDENTIFIED BY [PASSWORD] \'password\']\n\nssl_option:\n    SSL\n  | X509\n  | CIPHER \'cipher\'\n  | ISSUER \'issuer\'\n  | SUBJECT \'subject\'\n\nwith_option:\n    GRANT OPTION\n  | MAX_QUERIES_PER_HOUR count\n  | MAX_UPDATES_PER_HOUR count\n  | MAX_CONNECTIONS_PER_HOUR count\n  | MAX_USER_CONNECTIONS count\n\nThe GRANT statement grants privileges to MySQL user accounts. GRANT\nalso serves to specify other account characteristics such as use of\nsecure connections and limits on access to server resources. To use\nGRANT, you must have the GRANT OPTION privilege, and you must have the\nprivileges that you are granting.\n\nNormally, a database administrator first uses CREATE USER to create an\naccount, then GRANT to define its privileges and characteristics. For\nexample:\n\nCREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED BY \'mypass\';\nGRANT ALL ON db1.* TO \'jeffrey\'@\'localhost\';\nGRANT SELECT ON db2.invoice TO \'jeffrey\'@\'localhost\';\nGRANT USAGE ON *.* TO \'jeffrey\'@\'localhost\' WITH MAX_QUERIES_PER_HOUR 90;\n\nHowever, if an account named in a GRANT statement does not already\nexist, GRANT may create it under the conditions described later in the\ndiscussion of the NO_AUTO_CREATE_USER SQL mode.\n\nThe REVOKE statement is related to GRANT and enables administrators to\nremove account privileges. See [HELP REVOKE].\n\nTo determine what privileges an account has, use SHOW GRANTS. See [HELP\nSHOW GRANTS].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/grant.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/grant.html'),
 (190,'DECLARE VARIABLE',22,'Syntax:\nDECLARE var_name [, var_name] ... type [DEFAULT value]\n\nThis statement declares local variables within stored programs. To\nprovide a default value for a variable, include a DEFAULT clause. The\nvalue can be specified as an expression; it need not be a constant. If\nthe DEFAULT clause is missing, the initial value is NULL.\n\nLocal variables are treated like stored routine parameters with respect\nto data type and overflow checking. See [HELP CREATE PROCEDURE].\n\nVariable declarations must appear before cursor or handler\ndeclarations.\n\nLocal variable names are not case sensitive. Permissible characters and\nquoting rules are the same as for other identifiers, as described in\nhttp://dev.mysql.com/doc/refman/5.0/en/identifiers.html.\n\nThe scope of a local variable is the BEGIN ... END block within which\nit is declared. The variable can be referred to in blocks nested within\nthe declaring block, except those blocks that declare a variable with\nthe same name.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/declare-local-variable.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/declare-local-variable.html'),
 (191,'MPOLYFROMTEXT',3,'MPolyFromText(wkt[,srid]), MultiPolygonFromText(wkt[,srid])\n\nConstructs a MULTIPOLYGON value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkt-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkt-functions'),
 (192,'MBRINTERSECTS',5,'MBRIntersects(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 intersect.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr\n\n','','http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geome'),
 (193,'BIT_OR',15,'Syntax:\nBIT_OR(expr)\n\nReturns the bitwise OR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (194,'YEARWEEK',30,'Syntax:\nYEARWEEK(date), YEARWEEK(date,mode)\n\nReturns year and week for a date. The mode argument works exactly like\nthe mode argument to WEEK(). The year in the result may be different\nfrom the year in the date argument for the first and the last week of\nthe year.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT YEARWEEK(\'1987-01-01\');\n        -> 198653\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (195,'NOT BETWEEN',17,'Syntax:\nexpr NOT BETWEEN min AND max\n\nThis is the same as NOT (expr BETWEEN min AND max).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (196,'IS NOT',17,'Syntax:\nIS NOT boolean_value\n\nTests a value against a boolean value, where boolean_value can be TRUE,\nFALSE, or UNKNOWN.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT 1 IS NOT UNKNOWN, 0 IS NOT UNKNOWN, NULL IS NOT UNKNOWN;\n        -> 1, 1, 0\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (197,'LOG10',4,'Syntax:\nLOG10(X)\n\nReturns the base-10 logarithm of X.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT LOG10(2);\n        -> 0.30102999566398\nmysql> SELECT LOG10(100);\n        -> 2\nmysql> SELECT LOG10(-100);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (198,'SQRT',4,'Syntax:\nSQRT(X)\n\nReturns the square root of a nonnegative number X.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT SQRT(4);\n        -> 2\nmysql> SELECT SQRT(20);\n        -> 4.4721359549996\nmysql> SELECT SQRT(-16);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (199,'DECIMAL',21,'DECIMAL[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nFor MySQL 5.0.3 and above:\n\nA packed \"exact\" fixed-point number. M is the total number of digits\n(the precision) and D is the number of digits after the decimal point\n(the scale). The decimal point and (for negative numbers) the \"-\" sign\nare not counted in M. If D is 0, values have no decimal point or\nfractional part. The maximum number of digits (M) for DECIMAL is 65 (64\nfrom 5.0.3 to 5.0.5). The maximum number of supported decimals (D) is\n30. If D is omitted, the default is 0. If M is omitted, the default is\n10.\n\nUNSIGNED, if specified, disallows negative values.\n\nAll basic calculations (+, -, *, /) with DECIMAL columns are done with\na precision of 65 digits.\n\nBefore MySQL 5.0.3:\n\nAn unpacked fixed-point number. Behaves like a CHAR column; \"unpacked\"\nmeans the number is stored as a string, using one character for each\ndigit of the value. M is the total number of digits and D is the number\nof digits after the decimal point. The decimal point and (for negative\nnumbers) the \"-\" sign are not counted in M, although space for them is\nreserved. If D is 0, values have no decimal point or fractional part.\nThe maximum range of DECIMAL values is the same as for DOUBLE, but the\nactual range for a given DECIMAL column may be constrained by the\nchoice of M and D. If D is omitted, the default is 0. If M is omitted,\nthe default is 10.\n\nUNSIGNED, if specified, disallows negative values.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html'),
 (200,'CREATE INDEX',37,'Syntax:\nCREATE [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name\n    [index_type]\n    ON tbl_name (index_col_name,...)\n    [index_type]\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nCREATE INDEX is mapped to an ALTER TABLE statement to create indexes.\nSee [HELP ALTER TABLE]. CREATE INDEX cannot be used to create a PRIMARY\nKEY; use ALTER TABLE instead. For more information about indexes, see\nhttp://dev.mysql.com/doc/refman/5.0/en/mysql-indexes.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/create-index.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/create-index.html'),
 (201,'CREATE FUNCTION',37,'The CREATE FUNCTION statement is used to create stored functions and\nuser-defined functions (UDFs):\n\no For information about creating stored functions, see [HELP CREATE\n  PROCEDURE].\n\no For information about creating user-defined functions, see [HELP\n  CREATE FUNCTION UDF].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/create-function.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/create-function.html'),
 (202,'ALTER DATABASE',37,'Syntax:\nALTER {DATABASE | SCHEMA} [db_name]\n    alter_specification ...\n\nalter_specification:\n    [DEFAULT] CHARACTER SET [=] charset_name\n  | [DEFAULT] COLLATE [=] collation_name\n\nALTER DATABASE enables you to change the overall characteristics of a\ndatabase. These characteristics are stored in the db.opt file in the\ndatabase directory. To use ALTER DATABASE, you need the ALTER privilege\non the database. ALTER SCHEMA is a synonym for ALTER DATABASE as of\nMySQL 5.0.2.\n\nThe CHARACTER SET clause changes the default database character set.\nThe COLLATE clause changes the default database collation.\nhttp://dev.mysql.com/doc/refman/5.0/en/charset.html, discusses\ncharacter set and collation names.\n\nYou can see what character sets and collations are available using,\nrespectively, the SHOW CHARACTER SET and SHOW COLLATION statements. See\n[HELP SHOW CHARACTER SET], and [HELP SHOW COLLATION], for more\ninformation.\n\nIf you change the default character set or collation for a database,\nstored routines that use the database defaults must be dropped and\nrecreated so that they use the new defaults. (In a stored routine,\nvariables with character data types use the database defaults if the\ncharacter set or collation are not specified explicitly. See [HELP\nCREATE PROCEDURE].)\n\nThe database name can be omitted, in which case the statement applies\nto the default database.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/alter-database.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/alter-database.html'),
 (203,'GEOMETRYN',24,'GeometryN(gc,N)\n\nReturns the N-th geometry in the GeometryCollection value gc.\nGeometries are numbered beginning with 1.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#geometrycollection-property-functions\n\n','mysql> SET @gc = \'GeometryCollection(Point(1 1),LineString(2 2, 3 3))\';\nmysql> SELECT AsText(GeometryN(GeomFromText(@gc),1));\n+----------------------------------------+\n| AsText(GeometryN(GeomFromText(@gc),1)) |\n+----------------------------------------+\n| POINT(1 1)                             |\n+----------------------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#geometrycollection-property-functions'),
 (204,'<<',18,'Syntax:\n<<\n\nShifts a longlong (BIGINT) number to the left.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/bit-functions.html\n\n','mysql> SELECT 1 << 2;\n        -> 4\n','http://dev.mysql.com/doc/refman/5.0/en/bit-functions.html'),
 (205,'SHOW TABLE STATUS',25,'Syntax:\nSHOW TABLE STATUS [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLE STATUS works likes SHOW TABLES, but provides a lot of\ninformation about each non-TEMPORARY table. You can also get this list\nusing the mysqlshow --status db_name command. The LIKE clause, if\npresent, indicates which table names to match. The WHERE clause can be\ngiven to select rows using more general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.0/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-table-status.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-table-status.html'),
 (206,'MD5',11,'Syntax:\nMD5(str)\n\nCalculates an MD5 128-bit checksum for the string. The value is\nreturned as a binary string of 32 hex digits, or NULL if the argument\nwas NULL. The return value can, for example, be used as a hash key. See\nthe notes at the beginning of this section about storing hash values\nefficiently.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html\n\n','mysql> SELECT MD5(\'testing\');\n        -> \'ae2b1fca515949e5d54fb22b8ed95575\'\n','http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html'),
 (207,'<',17,'Syntax:\n<\n\nLess than:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT 2 < 2;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (208,'UNIX_TIMESTAMP',30,'Syntax:\nUNIX_TIMESTAMP(), UNIX_TIMESTAMP(date)\n\nIf called with no argument, returns a Unix timestamp (seconds since\n\'1970-01-01 00:00:00\' UTC) as an unsigned integer. If UNIX_TIMESTAMP()\nis called with a date argument, it returns the value of the argument as\nseconds since \'1970-01-01 00:00:00\' UTC. date may be a DATE string, a\nDATETIME string, a TIMESTAMP, or a number in the format YYMMDD or\nYYYYMMDD. The server interprets date as a value in the current time\nzone and converts it to an internal value in UTC. Clients can set their\ntime zone as described in\nhttp://dev.mysql.com/doc/refman/5.0/en/time-zone-support.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT UNIX_TIMESTAMP();\n        -> 1196440210\nmysql> SELECT UNIX_TIMESTAMP(\'2007-11-30 10:30:19\');\n        -> 1196440219\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (209,'DAYOFMONTH',30,'Syntax:\nDAYOFMONTH(date)\n\nReturns the day of the month for date, in the range 1 to 31, or 0 for\ndates such as \'0000-00-00\' or \'2008-00-00\' that have a zero day part.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT DAYOFMONTH(\'2007-02-03\');\n        -> 3\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (210,'ASCII',35,'Syntax:\nASCII(str)\n\nReturns the numeric value of the leftmost character of the string str.\nReturns 0 if str is the empty string. Returns NULL if str is NULL.\nASCII() works for 8-bit characters.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT ASCII(\'2\');\n        -> 50\nmysql> SELECT ASCII(2);\n        -> 50\nmysql> SELECT ASCII(\'dx\');\n        -> 100\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (211,'DIV',4,'Syntax:\nDIV\n\nInteger division. Similar to FLOOR(), but is safe with BIGINT values.\nIncorrect results may occur for noninteger operands that exceed BIGINT\nrange.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/arithmetic-functions.html\n\n','mysql> SELECT 5 DIV 2;\n        -> 2\n','http://dev.mysql.com/doc/refman/5.0/en/arithmetic-functions.html'),
 (212,'RENAME USER',9,'Syntax:\nRENAME USER old_user TO new_user\n    [, old_user TO new_user] ...\n\nThe RENAME USER statement renames existing MySQL accounts. To use it,\nyou must have the global CREATE USER privilege or the UPDATE privilege\nfor the mysql database. An error occurs if any old account does not\nexist or any new account exists. Each account name uses the format\ndescribed in http://dev.mysql.com/doc/refman/5.0/en/account-names.html.\nFor example:\n\nRENAME USER \'jeffrey\'@\'localhost\' TO \'jeff\'@\'127.0.0.1\';\n\nIf you specify only the user name part of the account name, a host name\npart of \'%\' is used.\n\nRENAME USER causes the privileges held by the old user to be those held\nby the new user. However, RENAME USER does not automatically drop or\ninvalidate databases or objects within them that the old user created.\nThis includes stored programs or views for which the DEFINER attribute\nnames the old user. Attempts to access such objects may produce an\nerror if they execute in definer security context. (For information\nabout security context, see\nhttp://dev.mysql.com/doc/refman/5.0/en/stored-programs-security.html.)\n\nThe privilege changes take effect as indicated in\nhttp://dev.mysql.com/doc/refman/5.0/en/privilege-changes.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/rename-user.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/rename-user.html'),
 (213,'SHOW SLAVE STATUS',25,'Syntax:\nSHOW SLAVE STATUS\n\nThis statement provides status information on essential parameters of\nthe slave threads. It requires either the SUPER or REPLICATION CLIENT\nprivilege.\n\nIf you issue this statement using the mysql client, you can use a \\G\nstatement terminator rather than a semicolon to obtain a more readable\nvertical layout:\n\nmysql> SHOW SLAVE STATUS\\G\n*************************** 1. row ***************************\n             Slave_IO_State: Waiting for master to send event\n                Master_Host: localhost\n                Master_User: root\n                Master_Port: 3306\n              Connect_Retry: 3\n            Master_Log_File: gbichot-bin.005\n        Read_Master_Log_Pos: 79\n             Relay_Log_File: gbichot-relay-bin.005\n              Relay_Log_Pos: 548\n      Relay_Master_Log_File: gbichot-bin.005\n           Slave_IO_Running: Yes\n          Slave_SQL_Running: Yes\n            Replicate_Do_DB:\n        Replicate_Ignore_DB:\n         Replicate_Do_Table:\n     Replicate_Ignore_Table:\n    Replicate_Wild_Do_Table:\nReplicate_Wild_Ignore_Table:\n                 Last_Errno: 0\n                 Last_Error:\n               Skip_Counter: 0\n        Exec_Master_Log_Pos: 79\n            Relay_Log_Space: 552\n            Until_Condition: None\n             Until_Log_File:\n              Until_Log_Pos: 0\n         Master_SSL_Allowed: No\n         Master_SSL_CA_File:\n         Master_SSL_CA_Path:\n            Master_SSL_Cert:\n          Master_SSL_Cipher:\n             Master_SSL_Key:\n      Seconds_Behind_Master: 8\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-slave-status.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-slave-status.html'),
 (214,'GEOMETRY',32,'MySQL provides a standard way of creating spatial columns for geometry\ntypes, for example, with CREATE TABLE or ALTER TABLE. Currently,\nspatial columns are supported for MyISAM, InnoDB, NDB, BDB, and ARCHIVE\ntables. (Support for storage engines other than MyISAM was added in\nMySQL 5.0.16.) See also the annotations about spatial indexes under\n[HELP SPATIAL].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-columns.html\n\n','CREATE TABLE geom (g GEOMETRY);\n','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-columns.html'),
 (215,'NUMPOINTS',12,'NumPoints(ls)\n\nReturns the number of Point objects in the LineString value ls.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#linestring-property-functions\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT NumPoints(GeomFromText(@ls));\n+------------------------------+\n| NumPoints(GeomFromText(@ls)) |\n+------------------------------+\n|                            3 |\n+------------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#linestring-property-functions'),
 (216,'&',18,'Syntax:\n&\n\nBitwise AND:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/bit-functions.html\n\n','mysql> SELECT 29 & 15;\n        -> 13\n','http://dev.mysql.com/doc/refman/5.0/en/bit-functions.html'),
 (217,'LOCALTIMESTAMP',30,'Syntax:\nLOCALTIMESTAMP, LOCALTIMESTAMP()\n\nLOCALTIMESTAMP and LOCALTIMESTAMP() are synonyms for NOW().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (218,'ASSIGN-EQUAL',13,'Syntax:\n=\n\nThis operator is used to perform value assignments in two cases,\ndescribed in the next two paragraphs.\n\nWithin a SET statement, = is treated as an assignment operator that\ncauses the user variable on the left hand side of the operator to take\non the value to its right. (In other words, when used in a SET\nstatement, = is treated identically to :=.) The value on the right hand\nside may be a literal value, another variable storing a value, or any\nlegal expression that yields a scalar value, including the result of a\nquery (provided that this value is a scalar value). You can perform\nmultiple assignments in the same SET statement.\n\nIn the SET clause of an UPDATE statement, = also acts as an assignment\noperator; in this case, however, it causes the column named on the left\nhand side of the operator to assume the value given to the right,\nprovided any WHERE conditions that are part of the UPDATE are met. You\ncan make multiple assignments in the same SET clause of an UPDATE\nstatement.\n\nIn any other context, = is treated as a comparison operator.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/assignment-operators.html\n\n','mysql> SELECT @var1, @var2;\n        -> NULL, NULL\nmysql> SELECT @var1 := 1, @var2;\n        -> 1, NULL\nmysql> SELECT @var1, @var2;\n        -> 1, NULL\nmysql> SELECT @var1, @var2 := @var1;\n        -> 1, 1\nmysql> SELECT @var1, @var2;\n        -> 1, 1\n','http://dev.mysql.com/doc/refman/5.0/en/assignment-operators.html'),
 (219,'CONVERT',35,'Syntax:\nCONVERT(expr,type), CONVERT(expr USING transcoding_name)\n\nThe CONVERT() and CAST() functions take a value of one type and produce\na value of another type.\n\nThe type can be one of the following values:\n\no BINARY[(N)]\n\no CHAR[(N)]\n\no DATE\n\no DATETIME\n\no DECIMAL[(M[,D])]\n\no SIGNED [INTEGER]\n\no TIME\n\no UNSIGNED [INTEGER]\n\nBINARY produces a string with the BINARY data type. See\nhttp://dev.mysql.com/doc/refman/5.0/en/binary-varbinary.html for a\ndescription of how this affects comparisons. If the optional length N\nis given, BINARY(N) causes the cast to use no more than N bytes of the\nargument. As of MySQL 5.0.17, values shorter than N bytes are padded\nwith 0x00 bytes to a length of N.\n\nCHAR(N) causes the cast to use no more than N characters of the\nargument.\n\nThe DECIMAL type is available as of MySQL 5.0.8.\n\nCAST() and CONVERT(... USING ...) are standard SQL syntax. The\nnon-USING form of CONVERT() is ODBC syntax.\n\nCONVERT() with USING is used to convert data between different\ncharacter sets. In MySQL, transcoding names are the same as the\ncorresponding character set names. For example, this statement converts\nthe string \'abc\' in the default character set to the corresponding\nstring in the utf8 character set:\n\nSELECT CONVERT(\'abc\' USING utf8);\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/cast-functions.html\n\n','SELECT enum_col FROM tbl_name ORDER BY CAST(enum_col AS CHAR);\n','http://dev.mysql.com/doc/refman/5.0/en/cast-functions.html'),
 (220,'ADDDATE',30,'Syntax:\nADDDATE(date,INTERVAL expr unit), ADDDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument, ADDDATE()\nis a synonym for DATE_ADD(). The related function SUBDATE() is a\nsynonym for DATE_SUB(). For information on the INTERVAL unit argument,\nsee the discussion for DATE_ADD().\n\nmysql> SELECT DATE_ADD(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2008-02-02\'\nmysql> SELECT ADDDATE(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2008-02-02\'\n\nWhen invoked with the days form of the second argument, MySQL treats it\nas an integer number of days to be added to expr.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT ADDDATE(\'2008-01-02\', 31);\n        -> \'2008-02-02\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (221,'REPEAT LOOP',22,'Syntax:\n[begin_label:] REPEAT\n    statement_list\nUNTIL search_condition\nEND REPEAT [end_label]\n\nThe statement list within a REPEAT statement is repeated until the\nsearch_condition expression is true. Thus, a REPEAT always enters the\nloop at least once. statement_list consists of one or more statements,\neach terminated by a semicolon (;) statement delimiter.\n\nA REPEAT statement can be labeled. For the rules regarding label use,\nsee [HELP labels].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/repeat-statement.html\n\n','mysql> delimiter //\n\nmysql> CREATE PROCEDURE dorepeat(p1 INT)\n    -> BEGIN\n    ->   SET @x = 0;\n    ->   REPEAT\n    ->     SET @x = @x + 1;\n    ->   UNTIL @x > p1 END REPEAT;\n    -> END\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL dorepeat(1000)//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @x//\n+------+\n| @x   |\n+------+\n| 1001 |\n+------+\n1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.0/en/repeat-statement.html'),
 (222,'ALTER FUNCTION',37,'Syntax:\nALTER FUNCTION func_name [characteristic ...]\n\ncharacteristic:\n    { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n  | COMMENT \'string\'\n\nThis statement can be used to change the characteristics of a stored\nfunction. More than one change may be specified in an ALTER FUNCTION\nstatement. However, you cannot change the parameters or body of a\nstored function using this statement; to make such changes, you must\ndrop and re-create the function using DROP FUNCTION and CREATE\nFUNCTION.\n\nAs of MySQL 5.0.3, you must have the ALTER ROUTINE privilege for the\nfunction. (That privilege is granted automatically to the function\ncreator.) If binary logging is enabled, the ALTER FUNCTION statement\nmight also require the SUPER privilege, as described in\nhttp://dev.mysql.com/doc/refman/5.0/en/stored-programs-logging.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/alter-function.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/alter-function.html'),
 (223,'SMALLINT',21,'SMALLINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA small integer. The signed range is -32768 to 32767. The unsigned\nrange is 0 to 65535.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html'),
 (224,'DOUBLE PRECISION',21,'DOUBLE PRECISION[(M,D)] [UNSIGNED] [ZEROFILL], REAL[(M,D)] [UNSIGNED]\n[ZEROFILL]\n\nThese types are synonyms for DOUBLE. Exception: If the REAL_AS_FLOAT\nSQL mode is enabled, REAL is a synonym for FLOAT rather than DOUBLE.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html'),
 (225,'ORD',35,'Syntax:\nORD(str)\n\nIf the leftmost character of the string str is a multi-byte character,\nreturns the code for that character, calculated from the numeric values\nof its constituent bytes using this formula:\n\n  (1st byte code)\n+ (2nd byte code * 256)\n+ (3rd byte code * 2562) ...\n\nIf the leftmost character is not a multi-byte character, ORD() returns\nthe same value as the ASCII() function.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT ORD(\'2\');\n        -> 50\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (226,'DEALLOCATE PREPARE',7,'Syntax:\n{DEALLOCATE | DROP} PREPARE stmt_name\n\nTo deallocate a prepared statement produced with PREPARE, use a\nDEALLOCATE PREPARE statement that refers to the prepared statement\nname. Attempting to execute a prepared statement after deallocating it\nresults in an error.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/deallocate-prepare.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/deallocate-prepare.html'),
 (227,'ENVELOPE',34,'Envelope(g)\n\nReturns the Minimum Bounding Rectangle (MBR) for the geometry value g.\nThe result is returned as a Polygon value.\n\nThe polygon is defined by the corner points of the bounding box:\n\nPOLYGON((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#general-geometry-property-functions\n\n','mysql> SELECT AsText(Envelope(GeomFromText(\'LineString(1 1,2 2)\')));\n+-------------------------------------------------------+\n| AsText(Envelope(GeomFromText(\'LineString(1 1,2 2)\'))) |\n+-------------------------------------------------------+\n| POLYGON((1 1,2 1,2 2,1 2,1 1))                        |\n+-------------------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#general-geometry-property-functions'),
 (228,'IS_FREE_LOCK',14,'Syntax:\nIS_FREE_LOCK(str)\n\nChecks whether the lock named str is free to use (that is, not locked).\nReturns 1 if the lock is free (no one is using the lock), 0 if the lock\nis in use, and NULL if an error occurs (such as an incorrect argument).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html'),
 (229,'TOUCHES',29,'Touches(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially touches g2. Two\ngeometries spatially touch if the interiors of the geometries do not\nintersect, but the boundary of one of the geometries intersects either\nthe boundary or the interior of the other.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries\n\n','','http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-tes'),
 (230,'INET_ATON',14,'Syntax:\nINET_ATON(expr)\n\nGiven the dotted-quad representation of an IPv4 network address as a\nstring, returns an integer that represents the numeric value of the\naddress in network byte order (big endian). INET_ATON() returns NULL if\nit does not understand its argument.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html\n\n','mysql> SELECT INET_ATON(\'10.0.5.9\');\n        -> 167773449\n','http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html'),
 (231,'UNCOMPRESS',11,'Syntax:\nUNCOMPRESS(string_to_uncompress)\n\nUncompresses a string compressed by the COMPRESS() function. If the\nargument is not a compressed value, the result is NULL. This function\nrequires MySQL to have been compiled with a compression library such as\nzlib. Otherwise, the return value is always NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html\n\n','mysql> SELECT UNCOMPRESS(COMPRESS(\'any string\'));\n        -> \'any string\'\nmysql> SELECT UNCOMPRESS(\'any string\');\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html'),
 (232,'AUTO_INCREMENT',21,'The AUTO_INCREMENT attribute can be used to generate a unique identity\nfor new rows:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/example-auto-increment.html\n\n','CREATE TABLE animals (\n     id MEDIUMINT NOT NULL AUTO_INCREMENT,\n     name CHAR(30) NOT NULL,\n     PRIMARY KEY (id)\n) ENGINE=MyISAM;\n\nINSERT INTO animals (name) VALUES\n    (\'dog\'),(\'cat\'),(\'penguin\'),\n    (\'lax\'),(\'whale\'),(\'ostrich\');\n\nSELECT * FROM animals;\n','http://dev.mysql.com/doc/refman/5.0/en/example-auto-increment.html'),
 (233,'ISSIMPLE',34,'IsSimple(g)\n\nCurrently, this function is a placeholder and should not be used. If\nimplemented, its behavior will be as described in the next paragraph.\n\nReturns 1 if the geometry value g has no anomalous geometric points,\nsuch as self-intersection or self-tangency. IsSimple() returns 0 if the\nargument is not simple, and -1 if it is NULL.\n\nThe description of each instantiable geometric class given earlier in\nthe chapter includes the specific conditions that cause an instance of\nthat class to be classified as not simple. (See [HELP Geometry\nhierarchy].)\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#general-geometry-property-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#general-geometry-property-functions'),
 (234,'- BINARY',4,'Syntax:\n-\n\nSubtraction:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/arithmetic-functions.html\n\n','mysql> SELECT 3-5;\n        -> -2\n','http://dev.mysql.com/doc/refman/5.0/en/arithmetic-functions.html'),
 (235,'GEOMCOLLFROMTEXT',3,'GeomCollFromText(wkt[,srid]), GeometryCollectionFromText(wkt[,srid])\n\nConstructs a GEOMETRYCOLLECTION value using its WKT representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkt-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkt-functions'),
 (236,'WKT DEFINITION',3,'The Well-Known Text (WKT) representation of Geometry is designed to\nexchange geometry data in ASCII form. For a Backus-Naur grammar that\nspecifies the formal production rules for writing WKT values, see the\nOpenGIS specification document referenced in\nhttp://dev.mysql.com/doc/refman/5.0/en/spatial-extensions.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/gis-wkt-format.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/gis-wkt-format.html'),
 (237,'CURRENT_TIME',30,'Syntax:\nCURRENT_TIME, CURRENT_TIME()\n\nCURRENT_TIME and CURRENT_TIME() are synonyms for CURTIME().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (238,'REVOKE',9,'Syntax:\nREVOKE\n    priv_type [(column_list)]\n      [, priv_type [(column_list)]] ...\n    ON [object_type] priv_level\n    FROM user [, user] ...\n\nREVOKE ALL PRIVILEGES, GRANT OPTION\n    FROM user [, user] ...\n\nThe REVOKE statement enables system administrators to revoke privileges\nfrom MySQL accounts. Each account name uses the format described in\nhttp://dev.mysql.com/doc/refman/5.0/en/account-names.html. For example:\n\nREVOKE INSERT ON *.* FROM \'jeffrey\'@\'localhost\';\n\nIf you specify only the user name part of the account name, a host name\npart of \'%\' is used.\n\nFor details on the levels at which privileges exist, the permissible\npriv_type and priv_level values, and the syntax for specifying users\nand passwords, see [HELP GRANT]\n\nTo use the first REVOKE syntax, you must have the GRANT OPTION\nprivilege, and you must have the privileges that you are revoking.\n\nTo revoke all privileges, use the second syntax, which drops all\nglobal, database, table, column, and routine privileges for the named\nuser or users:\n\nREVOKE ALL PRIVILEGES, GRANT OPTION FROM user [, user] ...\n\nTo use this REVOKE syntax, you must have the global CREATE USER\nprivilege or the UPDATE privilege for the mysql database.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/revoke.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/revoke.html'),
 (239,'LAST_INSERT_ID',16,'Syntax:\nLAST_INSERT_ID(), LAST_INSERT_ID(expr)\n\nLAST_INSERT_ID() (with no argument) returns a BIGINT (64-bit) value\nrepresenting the first automatically generated value that was set for\nan AUTO_INCREMENT column by the most recently executed INSERT statement\nto affect such a column. For example, after inserting a row that\ngenerates an AUTO_INCREMENT value, you can get the value like this:\n\nmysql> SELECT LAST_INSERT_ID();\n        -> 195\n\nif a table contains an AUTO_INCREMENT column and INSERT ... ON\nDUPLICATE KEY UPDATE updates (rather than inserts) a row, the value of\nLAST_INSERT_ID() is not meaningful. For a workaround, see\nhttp://dev.mysql.com/doc/refman/5.0/en/insert-on-duplicate.html.\n\nThe currently executing statement does not affect the value of\nLAST_INSERT_ID(). Suppose that you generate an AUTO_INCREMENT value\nwith one statement, and then refer to LAST_INSERT_ID() in a\nmultiple-row INSERT statement that inserts rows into a table with its\nown AUTO_INCREMENT column. The value of LAST_INSERT_ID() will remain\nstable in the second statement; its value for the second and later rows\nis not affected by the earlier row insertions. (However, if you mix\nreferences to LAST_INSERT_ID() and LAST_INSERT_ID(expr), the effect is\nundefined.)\n\nIf the previous statement returned an error, the value of\nLAST_INSERT_ID() is undefined. For transactional tables, if the\nstatement is rolled back due to an error, the value of LAST_INSERT_ID()\nis left undefined. For manual ROLLBACK, the value of LAST_INSERT_ID()\nis not restored to that before the transaction; it remains as it was at\nthe point of the ROLLBACK.\n\nWithin the body of a stored routine (procedure or function) or a\ntrigger, the value of LAST_INSERT_ID() changes the same way as for\nstatements executed outside the body of these kinds of objects. The\neffect of a stored routine or trigger upon the value of\nLAST_INSERT_ID() that is seen by following statements depends on the\nkind of routine:\n\no If a stored procedure executes statements that change the value of\n  LAST_INSERT_ID(), the changed value is seen by statements that follow\n  the procedure call.\n\no For stored functions and triggers that change the value, the value is\n  restored when the function or trigger ends, so following statements\n  do not see a changed value. (Before MySQL 5.0.12, the value is not\n  restored and following statements do see a changed value.)\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/information-functions.html'),
 (240,'LAST_DAY',30,'Syntax:\nLAST_DAY(date)\n\nTakes a date or datetime value and returns the corresponding value for\nthe last day of the month. Returns NULL if the argument is invalid.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT LAST_DAY(\'2003-02-05\');\n        -> \'2003-02-28\'\nmysql> SELECT LAST_DAY(\'2004-02-05\');\n        -> \'2004-02-29\'\nmysql> SELECT LAST_DAY(\'2004-01-01 01:01:01\');\n        -> \'2004-01-31\'\nmysql> SELECT LAST_DAY(\'2003-03-32\');\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (241,'MEDIUMINT',21,'MEDIUMINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA medium-sized integer. The signed range is -8388608 to 8388607. The\nunsigned range is 0 to 16777215.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html'),
 (242,'FLOOR',4,'Syntax:\nFLOOR(X)\n\nReturns the largest integer value not greater than X.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT FLOOR(1.23);\n        -> 1\nmysql> SELECT FLOOR(-1.23);\n        -> -2\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (243,'RTRIM',35,'Syntax:\nRTRIM(str)\n\nReturns the string str with trailing space characters removed.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT RTRIM(\'barbar   \');\n        -> \'barbar\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html');
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (244,'EXPLAIN',27,'Syntax:\nEXPLAIN [EXTENDED] SELECT select_options\n\nOr:\n\nEXPLAIN tbl_name\n\nThe EXPLAIN statement can be used either as a way to obtain information\nabout how MySQL executes a statement, or as a synonym for DESCRIBE:\n\no When you precede a SELECT statement with the keyword EXPLAIN, MySQL\n  displays information from the optimizer about the query execution\n  plan. That is, MySQL explains how it would process the statement,\n  including information about how tables are joined and in which order.\n  EXPLAIN EXTENDED can be used to provide additional information.\n\n  For information about using EXPLAIN and EXPLAIN EXTENDED to obtain\n  query execution plan information, see\n  http://dev.mysql.com/doc/refman/5.0/en/using-explain.html.\n\no EXPLAIN tbl_name is synonymous with DESCRIBE tbl_name or SHOW COLUMNS\n  FROM tbl_name. For information about DESCRIBE and SHOW COLUMNS, see\n  [HELP DESCRIBE], and [HELP SHOW COLUMNS].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/explain.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/explain.html'),
 (245,'DEGREES',4,'Syntax:\nDEGREES(X)\n\nReturns the argument X, converted from radians to degrees.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT DEGREES(PI());\n        -> 180\nmysql> SELECT DEGREES(PI() / 2);\n        -> 90\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (246,'VARCHAR',21,'[NATIONAL] VARCHAR(M) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA variable-length string. M represents the maximum column length in\ncharacters. In MySQL 5.0, the range of M is 0 to 255 before MySQL\n5.0.3, and 0 to 65,535 in MySQL 5.0.3 and later. The effective maximum\nlength of a VARCHAR in MySQL 5.0.3 and later is subject to the maximum\nrow size (65,535 bytes, which is shared among all columns) and the\ncharacter set used. For example, utf8 characters can require up to\nthree bytes per character, so a VARCHAR column that uses the utf8\ncharacter set can be declared to be a maximum of 21,844 characters. See\nhttp://dev.mysql.com/doc/refman/5.0/en/column-count-limit.html.\n\nMySQL stores VARCHAR values as a one-byte or two-byte length prefix\nplus data. The length prefix indicates the number of bytes in the\nvalue. A VARCHAR column uses one length byte if values require no more\nthan 255 bytes, two length bytes if values may require more than 255\nbytes.\n\n*Note*: Before 5.0.3, trailing spaces were removed when VARCHAR values\nwere stored, which differs from the standard SQL specification.\n\nPrior to MySQL 5.0.3, a VARCHAR column with a length specification\ngreater than 255 is converted to the smallest TEXT type that can hold\nvalues of the given length. For example, VARCHAR(500) is converted to\nTEXT, and VARCHAR(200000) is converted to MEDIUMTEXT. However, this\nconversion affects trailing-space removal.\n\nVARCHAR is shorthand for CHARACTER VARYING. NATIONAL VARCHAR is the\nstandard SQL way to define that a VARCHAR column should use some\npredefined character set. MySQL 4.1 and up uses utf8 as this predefined\ncharacter set.\nhttp://dev.mysql.com/doc/refman/5.0/en/charset-national.html. NVARCHAR\nis shorthand for NATIONAL VARCHAR.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html'),
 (247,'UNHEX',35,'Syntax:\n\nUNHEX(str)\n\nFor a string argument str, UNHEX(str) performs the inverse operation of\nHEX(str). That is, it interprets each pair of characters in the\nargument as a hexadecimal number and converts it to the character\nrepresented by the number. The return value is a binary string.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT UNHEX(\'4D7953514C\');\n        -> \'MySQL\'\nmysql> SELECT 0x4D7953514C;\n        -> \'MySQL\'\nmysql> SELECT UNHEX(HEX(\'string\'));\n        -> \'string\'\nmysql> SELECT HEX(UNHEX(\'1267\'));\n        -> \'1267\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (248,'- UNARY',4,'Syntax:\n-\n\nUnary minus. This operator changes the sign of the operand.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/arithmetic-functions.html\n\n','mysql> SELECT - 2;\n        -> -2\n','http://dev.mysql.com/doc/refman/5.0/en/arithmetic-functions.html'),
 (249,'STD',15,'Syntax:\nSTD(expr)\n\nReturns the population standard deviation of expr. This is an extension\nto standard SQL. As of MySQL 5.0.3, the standard SQL function\nSTDDEV_POP() can be used instead.\n\nThis function returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (250,'COS',4,'Syntax:\nCOS(X)\n\nReturns the cosine of X, where X is given in radians.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT COS(PI());\n        -> -1\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (251,'DATE FUNCTION',30,'Syntax:\nDATE(expr)\n\nExtracts the date part of the date or datetime expression expr.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT DATE(\'2003-12-31 01:02:03\');\n        -> \'2003-12-31\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (252,'DROP TRIGGER',37,'Syntax:\nDROP TRIGGER [IF EXISTS] [schema_name.]trigger_name\n\nThis statement drops a trigger. The schema (database) name is optional.\nIf the schema is omitted, the trigger is dropped from the default\nschema. DROP TRIGGER was added in MySQL 5.0.2. Its use requires the\nSUPER privilege.\n\nUse IF EXISTS to prevent an error from occurring for a trigger that\ndoes not exist. A NOTE is generated for a nonexistent trigger when\nusing IF EXISTS. See [HELP SHOW WARNINGS]. The IF EXISTS clause was\nadded in MySQL 5.0.32.\n\nTriggers for a table are also dropped if you drop the table.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/drop-trigger.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/drop-trigger.html'),
 (253,'RESET MASTER',7,'Syntax:\nRESET MASTER\n\nDeletes all binary log files listed in the index file, resets the\nbinary log index file to be empty, and creates a new binary log file.\nThis statement is intended to be used only when the master is started\nfor the first time.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/reset-master.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/reset-master.html'),
 (254,'TAN',4,'Syntax:\nTAN(X)\n\nReturns the tangent of X, where X is given in radians.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT TAN(PI());\n        -> -1.2246063538224e-16\nmysql> SELECT TAN(PI()+1);\n        -> 1.5574077246549\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (255,'PI',4,'Syntax:\nPI()\n\nReturns the value of π (pi). The default number of decimal places\ndisplayed is seven, but MySQL uses the full double-precision value\ninternally.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT PI();\n        -> 3.141593\nmysql> SELECT PI()+0.000000000000000000;\n        -> 3.141592653589793116\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (256,'WEEKOFYEAR',30,'Syntax:\nWEEKOFYEAR(date)\n\nReturns the calendar week of the date as a number in the range from 1\nto 53. WEEKOFYEAR() is a compatibility function that is equivalent to\nWEEK(date,3).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT WEEKOFYEAR(\'2008-02-20\');\n        -> 8\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (257,'/',4,'Syntax:\n/\n\nDivision:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/arithmetic-functions.html\n\n','mysql> SELECT 3/5;\n        -> 0.60\n','http://dev.mysql.com/doc/refman/5.0/en/arithmetic-functions.html'),
 (258,'PURGE BINARY LOGS',7,'Syntax:\nPURGE { BINARY | MASTER } LOGS\n    { TO \'log_name\' | BEFORE datetime_expr }\n\nThe binary log is a set of files that contain information about data\nmodifications made by the MySQL server. The log consists of a set of\nbinary log files, plus an index file (see\nhttp://dev.mysql.com/doc/refman/5.0/en/binary-log.html).\n\nThe PURGE BINARY LOGS statement deletes all the binary log files listed\nin the log index file prior to the specified log file name or date.\nBINARY and MASTER are synonyms. Deleted log files also are removed from\nthe list recorded in the index file, so that the given log file becomes\nthe first in the list.\n\nThis statement has no effect if the server was not started with the\n--log-bin option to enable binary logging.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/purge-binary-logs.html\n\n','PURGE BINARY LOGS TO \'mysql-bin.010\';\nPURGE BINARY LOGS BEFORE \'2008-04-02 22:46:26\';\n','http://dev.mysql.com/doc/refman/5.0/en/purge-binary-logs.html'),
 (259,'STDDEV_SAMP',15,'Syntax:\nSTDDEV_SAMP(expr)\n\nReturns the sample standard deviation of expr (the square root of\nVAR_SAMP(). This function was added in MySQL 5.0.3.\n\nSTDDEV_SAMP() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (260,'SCHEMA',16,'Syntax:\nSCHEMA()\n\nThis function is a synonym for DATABASE(). It was added in MySQL 5.0.2.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/information-functions.html'),
 (261,'MLINEFROMWKB',31,'MLineFromWKB(wkb[,srid]), MultiLineStringFromWKB(wkb[,srid])\n\nConstructs a MULTILINESTRING value using its WKB representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkb-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkb-functions'),
 (262,'LOG2',4,'Syntax:\nLOG2(X)\n\nReturns the base-2 logarithm of X.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT LOG2(65536);\n        -> 16\nmysql> SELECT LOG2(-100);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (263,'SUBTIME',30,'Syntax:\nSUBTIME(expr1,expr2)\n\nSUBTIME() returns expr1 - expr2 expressed as a value in the same format\nas expr1. expr1 is a time or datetime expression, and expr2 is a time\nexpression.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT SUBTIME(\'2007-12-31 23:59:59.999999\',\'1 1:1:1.000002\');\n        -> \'2007-12-30 22:58:58.999997\'\nmysql> SELECT SUBTIME(\'01:00:00.999999\', \'02:00:00.999998\');\n        -> \'-00:59:59.999999\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (264,'UNCOMPRESSED_LENGTH',11,'Syntax:\nUNCOMPRESSED_LENGTH(compressed_string)\n\nReturns the length that the compressed string had before being\ncompressed.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html\n\n','mysql> SELECT UNCOMPRESSED_LENGTH(COMPRESS(REPEAT(\'a\',30)));\n        -> 30\n','http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html'),
 (265,'DROP TABLE',37,'Syntax:\nDROP [TEMPORARY] TABLE [IF EXISTS]\n    tbl_name [, tbl_name] ...\n    [RESTRICT | CASCADE]\n\nDROP TABLE removes one or more tables. You must have the DROP privilege\nfor each table. All table data and the table definition are removed, so\nbe careful with this statement! If any of the tables named in the\nargument list do not exist, MySQL returns an error indicating by name\nwhich nonexisting tables it was unable to drop, but it also drops all\nof the tables in the list that do exist.\n\n*Important*: When a table is dropped, user privileges on the table are\nnot automatically dropped. See [HELP GRANT].\n\nUse IF EXISTS to prevent an error from occurring for tables that do not\nexist. A NOTE is generated for each nonexistent table when using IF\nEXISTS. See [HELP SHOW WARNINGS].\n\nRESTRICT and CASCADE are permitted to make porting easier. In MySQL\n5.0, they do nothing.\n\n*Note*: DROP TABLE automatically commits the current active\ntransaction, unless you use the TEMPORARY keyword.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/drop-table.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/drop-table.html'),
 (266,'POW',4,'Syntax:\nPOW(X,Y)\n\nReturns the value of X raised to the power of Y.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT POW(2,2);\n        -> 4\nmysql> SELECT POW(2,-2);\n        -> 0.25\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (267,'SHOW CREATE TABLE',25,'Syntax:\nSHOW CREATE TABLE tbl_name\n\nShows the CREATE TABLE statement that creates the given table. The\nstatement requires the SELECT privilege for the table. As of MySQL\n5.0.1, this statement also works with views.\nSHOW CREATE TABLE quotes table and column names according to the value\nof the sql_quote_show_create option. See\nhttp://dev.mysql.com/doc/refman/5.0/en/server-system-variables.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-create-table.html\n\n','mysql> SHOW CREATE TABLE t\\G\n*************************** 1. row ***************************\n       Table: t\nCreate Table: CREATE TABLE t (\n  id INT(11) default NULL auto_increment,\n  s char(60) default NULL,\n  PRIMARY KEY (id)\n) ENGINE=MyISAM\n','http://dev.mysql.com/doc/refman/5.0/en/show-create-table.html'),
 (268,'DUAL',26,'You are permitted to specify DUAL as a dummy table name in situations\nwhere no tables are referenced:\n\nmysql> SELECT 1 + 1 FROM DUAL;\n        -> 2\n\nDUAL is purely for the convenience of people who require that all\nSELECT statements should have FROM and possibly other clauses. MySQL\nmay ignore the clauses. MySQL does not require FROM DUAL if no tables\nare referenced.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/select.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/select.html'),
 (269,'INSTR',35,'Syntax:\nINSTR(str,substr)\n\nReturns the position of the first occurrence of substring substr in\nstring str. This is the same as the two-argument form of LOCATE(),\nexcept that the order of the arguments is reversed.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT INSTR(\'foobarbar\', \'bar\');\n        -> 4\nmysql> SELECT INSTR(\'xbar\', \'foobar\');\n        -> 0\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (270,'NOW',30,'Syntax:\nNOW()\n\nReturns the current date and time as a value in \'YYYY-MM-DD HH:MM:SS\'\nor YYYYMMDDHHMMSS.uuuuuu format, depending on whether the function is\nused in a string or numeric context. The value is expressed in the\ncurrent time zone.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT NOW();\n        -> \'2007-12-15 23:50:26\'\nmysql> SELECT NOW() + 0;\n        -> 20071215235026.000000\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (271,'SHOW ENGINES',25,'Syntax:\nSHOW [STORAGE] ENGINES\n\nSHOW ENGINES displays status information about the server\'s storage\nengines. This is particularly useful for checking whether a storage\nengine is supported, or to see what the default engine is. SHOW TABLE\nTYPES is a synonym, but is deprecated and is removed in MySQL 5.5.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-engines.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-engines.html'),
 (272,'SHOW MUTEX STATUS',25,'Syntax:\nSHOW MUTEX STATUS\n\nSHOW MUTEX STATUS displays InnoDB mutex statistics. From MySQL 5.0.3 to\n5.0.32, the statement displays the following output fields:\n\no Mutex\n\n  The mutex name. The name indicates the mutex purpose. For example,\n  the log_sys mutex is used by the InnoDB logging subsystem and\n  indicates how intensive logging activity is. The buf_pool mutex\n  protects the InnoDB buffer pool.\n\no Module\n\n  The source file where the mutex is implemented.\n\no Count indicates how many times the mutex was requested.\n\no Spin_waits indicates how many times the spinlock had to run.\n\no Spin_rounds indicates the number of spinlock rounds. (spin_rounds\n  divided by spin_waits provides the average round count.)\n\no OS_waits indicates the number of operating system waits. This occurs\n  when the spinlock did not work (the mutex was not locked during the\n  spinlock and it was necessary to yield to the operating system and\n  wait).\n\no OS_yields indicates the number of times that a thread trying to lock\n  a mutex gave up its timeslice and yielded to the operating system (on\n  the presumption that permitting other threads to run will free the\n  mutex so that it can be locked).\n\no OS_waits_time indicates the amount of time (in ms) spent in operating\n  system waits, if the timed_mutexes system variable is 1 (ON). If\n  timed_mutexes is 0 (OFF), timing is disabled, so OS_waits_time is 0.\n  timed_mutexes is off by default.\n\nFrom MySQL 5.0.33 on, the statement uses the same output format as that\njust described, but only if UNIV_DEBUG was defined at MySQL compilation\ntime (for example, in include/univ.i in the InnoDB part of the MySQL\nsource tree). If UNIV_DEBUG was not defined, the statement displays the\nfollowing fields. In the latter case (without UNIV_DEBUG), the\ninformation on which the statement output is based is insufficient to\ndistinguish regular mutexes and mutexes that protect rw-locks (which\npermit multiple readers or a single writer). Consequently, the output\nmay appear to contain multiple rows for the same mutex.\n\no File\n\n  The source file where the mutex is implemented.\n\no Line\n\n  The line number in the source file where the mutex is created. This\n  may change depending on your version of MySQL.\n\no OS_waits\n\n  Same as OS_waits_time.\n\nInformation from this statement can be used to diagnose system\nproblems. For example, large values of spin_waits and spin_rounds may\nindicate scalability problems.\n\nSHOW MUTEX STATUS was added in MySQL 5.0.3. In MySQL 5.1, SHOW MUTEX\nSTATUS is deprecated and SHOW ENGINE INNODB MUTEX should be used\ninstead. The latter statement displays similar information but in a\nsomewhat different output format. SHOW MUTEX STATUS is removed in MySQL\n5.5.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-mutex-status.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-mutex-status.html'),
 (273,'>=',17,'Syntax:\n>=\n\nGreater than or equal:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT 2 >= 2;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (274,'EXP',4,'Syntax:\nEXP(X)\n\nReturns the value of e (the base of natural logarithms) raised to the\npower of X. The inverse of this function is LOG() (using a single\nargumentonly) or LN().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT EXP(2);\n        -> 7.3890560989307\nmysql> SELECT EXP(-2);\n        -> 0.13533528323661\nmysql> SELECT EXP(0);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (275,'LONGBLOB',21,'LONGBLOB\n\nA BLOB column with a maximum length of 4,294,967,295 or 4GB (232 - 1)\nbytes. The effective maximum length of LONGBLOB columns depends on the\nconfigured maximum packet size in the client/server protocol and\navailable memory. Each LONGBLOB value is stored using a four-byte\nlength prefix that indicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html'),
 (276,'POINTN',12,'PointN(ls,N)\n\nReturns the N-th Point in the Linestring value ls. Points are numbered\nbeginning with 1.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#linestring-property-functions\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(PointN(GeomFromText(@ls),2));\n+-------------------------------------+\n| AsText(PointN(GeomFromText(@ls),2)) |\n+-------------------------------------+\n| POINT(2 2)                          |\n+-------------------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#linestring-property-functions'),
 (277,'YEAR DATA TYPE',21,'YEAR[(2|4)]\n\nA year in two-digit or four-digit format. The default is four-digit\nformat. In four-digit format, the permissible values are 1901 to 2155,\nand 0000. In two-digit format, the permissible values are 70 to 69,\nrepresenting years from 1970 to 2069. MySQL displays YEAR values in\nYYYY format, but permits assignment of values to YEAR columns using\neither strings or numbers.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-type-overview.html'),
 (278,'SUM',15,'Syntax:\nSUM([DISTINCT] expr)\n\nReturns the sum of expr. If the return set has no rows, SUM() returns\nNULL. The DISTINCT keyword can be used to sum only the distinct values\nof expr.\n\nSUM() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (279,'OCT',35,'Syntax:\nOCT(N)\n\nReturns a string representation of the octal value of N, where N is a\nlonglong (BIGINT) number. This is equivalent to CONV(N,10,8). Returns\nNULL if N is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT OCT(12);\n        -> \'14\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (280,'SYSDATE',30,'Syntax:\nSYSDATE()\n\nReturns the current date and time as a value in \'YYYY-MM-DD HH:MM:SS\'\nor YYYYMMDDHHMMSS.uuuuuu format, depending on whether the function is\nused in a string or numeric context.\n\nAs of MySQL 5.0.12, SYSDATE() returns the time at which it executes.\nThis differs from the behavior for NOW(), which returns a constant time\nthat indicates the time at which the statement began to execute.\n(Within a stored function or trigger, NOW() returns the time at which\nthe function or triggering statement began to execute.)\n\nmysql> SELECT NOW(), SLEEP(2), NOW();\n+---------------------+----------+---------------------+\n| NOW()               | SLEEP(2) | NOW()               |\n+---------------------+----------+---------------------+\n| 2006-04-12 13:47:36 |        0 | 2006-04-12 13:47:36 |\n+---------------------+----------+---------------------+\n\nmysql> SELECT SYSDATE(), SLEEP(2), SYSDATE();\n+---------------------+----------+---------------------+\n| SYSDATE()           | SLEEP(2) | SYSDATE()           |\n+---------------------+----------+---------------------+\n| 2006-04-12 13:47:44 |        0 | 2006-04-12 13:47:46 |\n+---------------------+----------+---------------------+\n\nIn addition, the SET TIMESTAMP statement affects the value returned by\nNOW() but not by SYSDATE(). This means that timestamp settings in the\nbinary log have no effect on invocations of SYSDATE().\n\nBecause SYSDATE() can return different values even within the same\nstatement, and is not affected by SET TIMESTAMP, it is nondeterministic\nand therefore unsafe for replication. If that is a problem, you can\nstart the server with the --sysdate-is-now option to cause SYSDATE() to\nbe an alias for NOW(). The nondeterministic nature of SYSDATE() also\nmeans that indexes cannot be used for evaluating expressions that refer\nto it.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (281,'ASBINARY',31,'AsBinary(g), AsWKB(g)\n\nConverts a value in internal geometry format to its WKB representation\nand returns the binary result.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-to-convert-geometries-between-formats.html\n\n','SELECT AsBinary(g) FROM geom;\n','http://dev.mysql.com/doc/refman/5.0/en/functions-to-convert-geometries-between-formats.html'),
 (282,'REPEAT FUNCTION',35,'Syntax:\nREPEAT(str,count)\n\nReturns a string consisting of the string str repeated count times. If\ncount is less than 1, returns an empty string. Returns NULL if str or\ncount are NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT REPEAT(\'MySQL\', 3);\n        -> \'MySQLMySQLMySQL\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (283,'SHOW TABLES',25,'Syntax:\nSHOW [FULL] TABLES [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLES lists the non-TEMPORARY tables in a given database. You can\nalso get this list using the mysqlshow db_name command. The LIKE\nclause, if present, indicates which table names to match. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in http://dev.mysql.com/doc/refman/5.0/en/extended-show.html.\n\nBefore MySQL 5.0.1, the output from SHOW TABLES contains a single\ncolumn of table names. Beginning with MySQL 5.0.1, this statement also\nlists any views in the database. As of MySQL 5.0.2, the FULL modifier\nis supported such that SHOW FULL TABLES displays a second output\ncolumn. Values for the second column are BASE TABLE for a table and\nVIEW for a view.\n\nIf you have no privileges for a base table or view, it does not show up\nin the output from SHOW TABLES or mysqlshow db_name.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-tables.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-tables.html'),
 (284,'MAKEDATE',30,'Syntax:\nMAKEDATE(year,dayofyear)\n\nReturns a date, given year and day-of-year values. dayofyear must be\ngreater than 0 or the result is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT MAKEDATE(2011,31), MAKEDATE(2011,32);\n        -> \'2011-01-31\', \'2011-02-01\'\nmysql> SELECT MAKEDATE(2011,365), MAKEDATE(2014,365);\n        -> \'2011-12-31\', \'2014-12-31\'\nmysql> SELECT MAKEDATE(2011,0);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (285,'BINARY OPERATOR',35,'Syntax:\nBINARY\n\nThe BINARY operator casts the string following it to a binary string.\nThis is an easy way to force a column comparison to be done byte by\nbyte rather than character by character. This causes the comparison to\nbe case sensitive even if the column is not defined as BINARY or BLOB.\nBINARY also causes trailing spaces to be significant.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/cast-functions.html\n\n','mysql> SELECT \'a\' = \'A\';\n        -> 1\nmysql> SELECT BINARY \'a\' = \'A\';\n        -> 0\nmysql> SELECT \'a\' = \'a \';\n        -> 1\nmysql> SELECT BINARY \'a\' = \'a \';\n        -> 0\n','http://dev.mysql.com/doc/refman/5.0/en/cast-functions.html'),
 (286,'MBROVERLAPS',5,'MBROverlaps(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 overlap. The term spatially overlaps is\nused if two geometries intersect and their intersection results in a\ngeometry of the same dimension but not equal to either of the given\ngeometries.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr\n\n','','http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geome'),
 (287,'SOUNDEX',35,'Syntax:\nSOUNDEX(str)\n\nReturns a soundex string from str. Two strings that sound almost the\nsame should have identical soundex strings. A standard soundex string\nis four characters long, but the SOUNDEX() function returns an\narbitrarily long string. You can use SUBSTRING() on the result to get a\nstandard soundex string. All nonalphabetic characters in str are\nignored. All international alphabetic characters outside the A-Z range\nare treated as vowels.\n\n*Important*: When using SOUNDEX(), you should be aware of the following\nlimitations:\n\no This function, as currently implemented, is intended to work well\n  with strings that are in the English language only. Strings in other\n  languages may not produce reliable results.\n\no This function is not guaranteed to provide consistent results with\n  strings that use multi-byte character sets, including utf-8.\n\n  We hope to remove these limitations in a future release. See Bug\n  #22638 for more information.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT SOUNDEX(\'Hello\');\n        -> \'H400\'\nmysql> SELECT SOUNDEX(\'Quadratically\');\n        -> \'Q36324\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (288,'MBRTOUCHES',5,'MBRTouches(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 touch. Two geometries spatially touch if\nthe interiors of the geometries do not intersect, but the boundary of\none of the geometries intersects either the boundary or the interior of\nthe other.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr\n\n','','http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geome'),
 (289,'INSERT SELECT',26,'Syntax:\nINSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]\n\nWith INSERT ... SELECT, you can quickly insert many rows into a table\nfrom one or many tables. For example:\n\nINSERT INTO tbl_temp2 (fld_id)\n  SELECT tbl_temp1.fld_order_id\n  FROM tbl_temp1 WHERE tbl_temp1.fld_order_id > 100;\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/insert-select.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/insert-select.html'),
 (290,'CREATE PROCEDURE',37,'Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    PROCEDURE sp_name ([proc_parameter[,...]])\n    [characteristic ...] routine_body\n\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    FUNCTION sp_name ([func_parameter[,...]])\n    RETURNS type\n    [characteristic ...] routine_body\n\nproc_parameter:\n    [ IN | OUT | INOUT ] param_name type\n\nfunc_parameter:\n    param_name type\n\ntype:\n    Any valid MySQL data type\n\ncharacteristic:\n    COMMENT \'string\'\n  | LANGUAGE SQL\n  | [NOT] DETERMINISTIC\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n\nroutine_body:\n    Valid SQL routine statement\n\nThese statements create stored routines. By default, a routine is\nassociated with the default database. To associate the routine\nexplicitly with a given database, specify the name as db_name.sp_name\nwhen you create it.\n\nThe CREATE FUNCTION statement is also used in MySQL to support UDFs\n(user-defined functions). See\nhttp://dev.mysql.com/doc/refman/5.0/en/adding-functions.html. A UDF can\nbe regarded as an external stored function. Stored functions share\ntheir namespace with UDFs. See\nhttp://dev.mysql.com/doc/refman/5.0/en/function-resolution.html, for\nthe rules describing how the server interprets references to different\nkinds of functions.\n\nTo invoke a stored procedure, use the CALL statement (see [HELP CALL]).\nTo invoke a stored function, refer to it in an expression. The function\nreturns a value during expression evaluation.\n\nAs of MySQL 5.0.3, CREATE PROCEDURE and CREATE FUNCTION require the\nCREATE ROUTINE privilege. They might also require the SUPER privilege,\ndepending on the DEFINER value, as described later in this section. If\nbinary logging is enabled, CREATE FUNCTION might require the SUPER\nprivilege, as described in\nhttp://dev.mysql.com/doc/refman/5.0/en/stored-programs-logging.html.\n\nBy default, MySQL automatically grants the ALTER ROUTINE and EXECUTE\nprivileges to the routine creator. This behavior can be changed by\ndisabling the automatic_sp_privileges system variable. See\nhttp://dev.mysql.com/doc/refman/5.0/en/stored-routines-privileges.html.\n\nThe DEFINER and SQL SECURITY clauses specify the security context to be\nused when checking access privileges at routine execution time, as\ndescribed later in this section.\n\nIf the routine name is the same as the name of a built-in SQL function,\na syntax error occurs unless you use a space between the name and the\nfollowing parenthesis when defining the routine or invoking it later.\nFor this reason, avoid using the names of existing SQL functions for\nyour own stored routines.\n\nThe IGNORE_SPACE SQL mode applies to built-in functions, not to stored\nroutines. It is always permissible to have spaces after a stored\nroutine name, regardless of whether IGNORE_SPACE is enabled.\n\nThe parameter list enclosed within parentheses must always be present.\nIf there are no parameters, an empty parameter list of () should be\nused. Parameter names are not case sensitive.\n\nEach parameter is an IN parameter by default. To specify otherwise for\na parameter, use the keyword OUT or INOUT before the parameter name.\n\n*Note*: Specifying a parameter as IN, OUT, or INOUT is valid only for a\nPROCEDURE. For a FUNCTION, parameters are always regarded as IN\nparameters.\n\nAn IN parameter passes a value into a procedure. The procedure might\nmodify the value, but the modification is not visible to the caller\nwhen the procedure returns. An OUT parameter passes a value from the\nprocedure back to the caller. Its initial value is NULL within the\nprocedure, and its value is visible to the caller when the procedure\nreturns. An INOUT parameter is initialized by the caller, can be\nmodified by the procedure, and any change made by the procedure is\nvisible to the caller when the procedure returns.\n\nFor each OUT or INOUT parameter, pass a user-defined variable in the\nCALL statement that invokes the procedure so that you can obtain its\nvalue when the procedure returns. If you are calling the procedure from\nwithin another stored procedure or function, you can also pass a\nroutine parameter or local routine variable as an IN or INOUT\nparameter.\n\nThe following example shows a simple stored procedure that uses an OUT\nparameter:\n\nmysql> delimiter //\n\nmysql> CREATE PROCEDURE simpleproc (OUT param1 INT)\n    -> BEGIN\n    ->   SELECT COUNT(*) INTO param1 FROM t;\n    -> END//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> delimiter ;\n\nmysql> CALL simpleproc(@a);\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @a;\n+------+\n| @a   |\n+------+\n| 3    |\n+------+\n1 row in set (0.00 sec)\n\nThe example uses the mysql client delimiter command to change the\nstatement delimiter from ; to // while the procedure is being defined.\nThis enables the ; delimiter used in the procedure body to be passed\nthrough to the server rather than being interpreted by mysql itself.\nSee\nhttp://dev.mysql.com/doc/refman/5.0/en/stored-programs-defining.html.\n\nThe RETURNS clause may be specified only for a FUNCTION, for which it\nis mandatory. It indicates the return type of the function, and the\nfunction body must contain a RETURN value statement. If the RETURN\nstatement returns a value of a different type, the value is coerced to\nthe proper type. For example, if a function specifies an ENUM or SET\nvalue in the RETURNS clause, but the RETURN statement returns an\ninteger, the value returned from the function is the string for the\ncorresponding ENUM member of set of SET members.\n\nThe following example function takes a parameter, performs an operation\nusing an SQL function, and returns the result. In this case, it is\nunnecessary to use delimiter because the function definition contains\nno internal ; statement delimiters:\n\nmysql> CREATE FUNCTION hello (s CHAR(20))\nmysql> RETURNS CHAR(50) DETERMINISTIC\n    -> RETURN CONCAT(\'Hello, \',s,\'!\');\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT hello(\'world\');\n+----------------+\n| hello(\'world\') |\n+----------------+\n| Hello, world!  |\n+----------------+\n1 row in set (0.00 sec)\n\nParameter types and function return types can be declared to use any\nvalid data type, except that the COLLATE attribute cannot be used.\n\nThe routine_body consists of a valid SQL routine statement. This can be\na simple statement such as SELECT or INSERT, or a compound statement\nwritten using BEGIN and END. Compound statements can contain\ndeclarations, loops, and other control structure statements. The syntax\nfor these statements is described in\nhttp://dev.mysql.com/doc/refman/5.0/en/sql-syntax-compound-statements.h\ntml.\n\nMySQL permits routines to contain DDL statements, such as CREATE and\nDROP. MySQL also permits stored procedures (but not stored functions)\nto contain SQL transaction statements such as COMMIT. Stored functions\nmay not contain statements that perform explicit or implicit commit or\nrollback. Support for these statements is not required by the SQL\nstandard, which states that each DBMS vendor may decide whether to\npermit them.\n\nStatements that return a result set can be used within a stored\nprocedure but not within a stored function. This prohibition includes\nSELECT statements that do not have an INTO var_list clause and other\nstatements such as SHOW, EXPLAIN, and CHECK TABLE. For statements that\ncan be determined at function definition time to return a result set, a\nNot allowed to return a result set from a function error occurs\n(ER_SP_NO_RETSET). For statements that can be determined only at\nruntime to return a result set, a PROCEDURE %s can\'t return a result\nset in the given context error occurs (ER_SP_BADSELECT).\n\n*Note*: Before MySQL 5.0.10, stored functions created with CREATE\nFUNCTION must not contain references to tables, with limited\nexceptions. They may include some SET statements that contain table\nreferences, for example SET a:= (SELECT MAX(id) FROM t), and SELECT\nstatements that fetch values directly into variables, for example\nSELECT i INTO var1 FROM t.\n\nUSE statements within stored routines are not permitted. When a routine\nis invoked, an implicit USE db_name is performed (and undone when the\nroutine terminates). This causes the routine to have the given default\ndatabase while it executes. References to objects in databases other\nthan the routine default database should be qualified with the\nappropriate database name.\n\nFor additional information about statements that are not permitted in\nstored routines, see\nhttp://dev.mysql.com/doc/refman/5.0/en/stored-program-restrictions.html\n.\n\nFor information about invoking stored procedures from within programs\nwritten in a language that has a MySQL interface, see [HELP CALL].\n\nMySQL stores the sql_mode system variable setting that is in effect at\nthe time a routine is created, and always executes the routine with\nthis setting in force, regardless of the server SQL mode in effect when\nthe routine is invoked.\n\nThe switch from the SQL mode of the invoker to that of the routine\noccurs after evaluation of arguments and assignment of the resulting\nvalues to routine parameters. If you define a routine in strict SQL\nmode but invoke it in nonstrict mode, assignment of arguments to\nroutine parameters does not take place in strict mode. If you require\nthat expressions passed to a routine be assigned in strict SQL mode,\nyou should invoke the routine with strict mode in effect.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/create-procedure.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/create-procedure.html'),
 (291,'VARBINARY',21,'VARBINARY(M)\n\nThe VARBINARY type is similar to the VARCHAR type, but stores binary\nbyte strings rather than nonbinary character strings. M represents the\nmaximum column length in bytes.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html'),
 (292,'LOAD INDEX',25,'Syntax:\nLOAD INDEX INTO CACHE\n  tbl_index_list [, tbl_index_list] ...\n\ntbl_index_list:\n  tbl_name\n    [[INDEX|KEY] (index_name[, index_name] ...)]\n    [IGNORE LEAVES]\n\nThe LOAD INDEX INTO CACHE statement preloads a table index into the key\ncache to which it has been assigned by an explicit CACHE INDEX\nstatement, or into the default key cache otherwise. LOAD INDEX INTO\nCACHE is used only for MyISAM tables.\n\nThe IGNORE LEAVES modifier causes only blocks for the nonleaf nodes of\nthe index to be preloaded.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/load-index.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/load-index.html'),
 (293,'UNION',26,'Syntax:\nSELECT ...\nUNION [ALL | DISTINCT] SELECT ...\n[UNION [ALL | DISTINCT] SELECT ...]\n\nUNION is used to combine the result from multiple SELECT statements\ninto a single result set.\n\nThe column names from the first SELECT statement are used as the column\nnames for the results returned. Selected columns listed in\ncorresponding positions of each SELECT statement should have the same\ndata type. (For example, the first column selected by the first\nstatement should have the same type as the first column selected by the\nother statements.)\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/union.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/union.html'),
 (294,'TO_DAYS',30,'Syntax:\nTO_DAYS(date)\n\nGiven a date date, returns a day number (the number of days since year\n0).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT TO_DAYS(950501);\n        -> 728779\nmysql> SELECT TO_DAYS(\'2007-10-07\');\n        -> 733321\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (295,'NOT REGEXP',35,'Syntax:\nexpr NOT REGEXP pat, expr NOT RLIKE pat\n\nThis is the same as NOT (expr REGEXP pat).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/regexp.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/regexp.html'),
 (296,'SHOW INDEX',25,'Syntax:\nSHOW {INDEX | INDEXES | KEYS}\n    {FROM | IN} tbl_name\n    [{FROM | IN} db_name]\n    [WHERE expr]\n\nSHOW INDEX returns table index information. The format resembles that\nof the SQLStatistics call in ODBC.\nYou can use db_name.tbl_name as an alternative to the tbl_name FROM\ndb_name syntax. These two statements are equivalent:\n\nSHOW INDEX FROM mytable FROM mydb;\nSHOW INDEX FROM mydb.mytable;\n\nThe WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.0/en/extended-show.html.\n\nYou can also list a table\'s indexes with the mysqlshow -k db_name\ntbl_name command.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-index.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-index.html'),
 (297,'SHOW CREATE DATABASE',25,'Syntax:\nSHOW CREATE {DATABASE | SCHEMA} db_name\n\nShows the CREATE DATABASE statement that creates the given database.\nSHOW CREATE SCHEMA is a synonym for SHOW CREATE DATABASE as of MySQL\n5.0.2.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-create-database.html\n\n','mysql> SHOW CREATE DATABASE test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test`\n                 /*!40100 DEFAULT CHARACTER SET latin1 */\n\nmysql> SHOW CREATE SCHEMA test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test`\n                 /*!40100 DEFAULT CHARACTER SET latin1 */\n','http://dev.mysql.com/doc/refman/5.0/en/show-create-database.html'),
 (298,'LEAVE',22,'Syntax:\nLEAVE label\n\nThis statement is used to exit the flow control construct that has the\ngiven label. If the label is for the outermost stored program block,\nLEAVE exits the program.\n\nLEAVE can be used within BEGIN ... END or loop constructs (LOOP,\nREPEAT, WHILE).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/leave-statement.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/leave-statement.html'),
 (299,'NOT IN',17,'Syntax:\nexpr NOT IN (value,...)\n\nThis is the same as NOT (expr IN (value,...)).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (300,'!',13,'Syntax:\nNOT, !\n\nLogical NOT. Evaluates to 1 if the operand is 0, to 0 if the operand is\nnonzero, and NOT NULL returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/logical-operators.html\n\n','mysql> SELECT NOT 10;\n        -> 0\nmysql> SELECT NOT 0;\n        -> 1\nmysql> SELECT NOT NULL;\n        -> NULL\nmysql> SELECT ! (1+1);\n        -> 0\nmysql> SELECT ! 1+1;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.0/en/logical-operators.html'),
 (301,'DECLARE HANDLER',22,'Syntax:\nDECLARE handler_action HANDLER\n    FOR condition_value [, condition_value] ...\n    statement\n\nhandler_action:\n    CONTINUE\n  | EXIT\n  | UNDO\n\ncondition_value:\n    mysql_error_code\n  | SQLSTATE [VALUE] sqlstate_value\n  | condition_name\n  | SQLWARNING\n  | NOT FOUND\n  | SQLEXCEPTION\n\nThe DECLARE ... HANDLER statement specifies a handler that deals with\none or more conditions. If one of these conditions occurs, the\nspecified statement executes. statement can be a simple statement such\nas SET var_name = value, or a compound statement written using BEGIN\nand END (see [HELP BEGIN END]).\n\nHandler declarations must appear after variable or condition\ndeclarations.\n\nThe handler_action value indicates what action the handler takes after\nexecution of the handler statement:\n\no CONTINUE: Execution of the current program continues.\n\no EXIT: Execution terminates for the BEGIN ... END compound statement\n  in which the handler is declared. This is true even if the condition\n  occurs in an inner block.\n\no UNDO: Not supported.\n\nThe condition_value for DECLARE ... HANDLER indicates the specific\ncondition or class of conditions that activates the handler:\n\no A MySQL error code (a number) or an SQLSTATE value (a 5-character\n  string literal). You should not use MySQL error code 0 or SQLSTATE\n  values that begin with \'00\', because those indicate success rather\n  than an error condition. For a list of MySQL error codes and SQLSTATE\n  values, see\n  http://dev.mysql.com/doc/refman/5.0/en/error-messages-server.html.\n\no A condition name previously specified with DECLARE ... CONDITION. A\n  condition name can be associated with a MySQL error code or SQLSTATE\n  value. See [HELP DECLARE CONDITION].\n\no SQLWARNING is shorthand for the class of SQLSTATE values that begin\n  with \'01\'.\n\no NOT FOUND is shorthand for the class of SQLSTATE values that begin\n  with \'02\'. This is relevant within the context of cursors and is used\n  to control what happens when a cursor reaches the end of a data set.\n  If no more rows are available, a No Data condition occurs with\n  SQLSTATE value \'02000\'. To detect this condition, you can set up a\n  handler for it (or for a NOT FOUND condition). For an example, see\n  http://dev.mysql.com/doc/refman/5.0/en/cursors.html. This condition\n  also occurs for SELECT ... INTO var_list statements that retrieve no\n  rows.\n\no SQLEXCEPTION is shorthand for the class of SQLSTATE values that do\n  not begin with \'00\', \'01\', or \'02\'.\n\nIf a condition occurs for which no handler has been declared, the\naction taken depends on the condition class:\n\no For SQLEXCEPTION conditions, the stored program terminates at the\n  statement that raised the condition, as if there were an EXIT\n  handler. If the program was called by another stored program, the\n  calling program handles the condition using the handler selection\n  rules applied to its own handlers.\n\no For SQLWARNING or NOT FOUND conditions, the program continues\n  executing, as if there were a CONTINUE handler.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/declare-handler.html\n\n','mysql> CREATE TABLE test.t (s1 INT, PRIMARY KEY (s1));\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> delimiter //\n\nmysql> CREATE PROCEDURE handlerdemo ()\n    -> BEGIN\n    ->   DECLARE CONTINUE HANDLER FOR SQLSTATE \'23000\' SET @x2 = 1;\n    ->   SET @x = 1;\n    ->   INSERT INTO test.t VALUES (1);\n    ->   SET @x = 2;\n    ->   INSERT INTO test.t VALUES (1);\n    ->   SET @x = 3;\n    -> END;\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL handlerdemo()//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @x//\n    +------+\n    | @x   |\n    +------+\n    | 3    |\n    +------+\n    1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.0/en/declare-handler.html'),
 (302,'DOUBLE',21,'DOUBLE[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA normal-size (double-precision) floating-point number. Permissible\nvalues are -1.7976931348623157E+308 to -2.2250738585072014E-308, 0, and\n2.2250738585072014E-308 to 1.7976931348623157E+308. These are the\ntheoretical limits, based on the IEEE standard. The actual range might\nbe slightly smaller depending on your hardware or operating system.\n\nM is the total number of digits and D is the number of digits following\nthe decimal point. If M and D are omitted, values are stored to the\nlimits permitted by the hardware. A double-precision floating-point\nnumber is accurate to approximately 15 decimal places.\n\nUNSIGNED, if specified, disallows negative values.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html'),
 (303,'TIME',21,'TIME\n\nA time. The range is \'-838:59:59\' to \'838:59:59\'. MySQL displays TIME\nvalues in \'HH:MM:SS\' format, but permits assignment of values to TIME\ncolumns using either strings or numbers.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-type-overview.html'),
 (304,'&&',13,'Syntax:\nAND, &&\n\nLogical AND. Evaluates to 1 if all operands are nonzero and not NULL,\nto 0 if one or more operands are 0, otherwise NULL is returned.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/logical-operators.html\n\n','mysql> SELECT 1 && 1;\n        -> 1\nmysql> SELECT 1 && 0;\n        -> 0\nmysql> SELECT 1 && NULL;\n        -> NULL\nmysql> SELECT 0 && NULL;\n        -> 0\nmysql> SELECT NULL && 0;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.0/en/logical-operators.html'),
 (305,'X',10,'X(p)\n\nReturns the X-coordinate value for the Point object p as a\ndouble-precision number.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#point-property-functions\n\n','mysql> SELECT X(POINT(56.7, 53.34));\n+-----------------------+\n| X(POINT(56.7, 53.34)) |\n+-----------------------+\n|                  56.7 |\n+-----------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#point-property-functions'),
 (306,'FOUND_ROWS',16,'Syntax:\nFOUND_ROWS()\n\nA SELECT statement may include a LIMIT clause to restrict the number of\nrows the server returns to the client. In some cases, it is desirable\nto know how many rows the statement would have returned without the\nLIMIT, but without running the statement again. To obtain this row\ncount, include a SQL_CALC_FOUND_ROWS option in the SELECT statement,\nand then invoke FOUND_ROWS() afterward:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/information-functions.html\n\n','mysql> SELECT SQL_CALC_FOUND_ROWS * FROM tbl_name\n    -> WHERE id > 100 LIMIT 10;\nmysql> SELECT FOUND_ROWS();\n','http://dev.mysql.com/doc/refman/5.0/en/information-functions.html'),
 (307,'SYSTEM_USER',16,'Syntax:\nSYSTEM_USER()\n\nSYSTEM_USER() is a synonym for USER().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/information-functions.html'),
 (308,'CROSSES',29,'Crosses(g1,g2)\n\nReturns 1 if g1 spatially crosses g2. Returns NULL if g1 is a Polygon\nor a MultiPolygon, or if g2 is a Point or a MultiPoint. Otherwise,\nreturns 0.\n\nThe term spatially crosses denotes a spatial relation between two given\ngeometries that has the following properties:\n\no The two geometries intersect\n\no Their intersection results in a geometry that has a dimension that is\n  one less than the maximum dimension of the two given geometries\n\no Their intersection is not equal to either of the two given geometries\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries\n\n','','http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-tes'),
 (309,'TRUNCATE TABLE',37,'Syntax:\nTRUNCATE [TABLE] tbl_name\n\nTRUNCATE TABLE empties a table completely. Logically, this is\nequivalent to a DELETE statement that deletes all rows, but there are\npractical differences under some circumstances.\n\nFor an InnoDB table before version 5.0.3, InnoDB processes TRUNCATE\nTABLE by deleting rows one by one. As of MySQL 5.0.3, row by row\ndeletion is used only if there are any FOREIGN KEY constraints that\nreference the table. If there are no FOREIGN KEY constraints, InnoDB\nperforms fast truncation by dropping the original table and creating an\nempty one with the same definition, which is much faster than deleting\nrows one by one. (When fast truncation is used, it resets any\nAUTO_INCREMENT counter to zero. From MySQL 5.0.13 on, the\nAUTO_INCREMENT counter is reset to zero by TRUNCATE TABLE, regardless\nof whether there is a foreign key constraint.)\n\nIn the case that FOREIGN KEY constraints reference the table, InnoDB\ndeletes rows one by one and processes the constraints on each one. If\nthe FOREIGN KEY constraint specifies DELETE CASCADE, rows from the\nchild (referenced) table are deleted, and the truncated table becomes\nempty. If the FOREIGN KEY constraint does not specify CASCADE, the\nTRUNCATE TABLE statement deletes rows one by one and stops if it\nencounters a parent row that is referenced by the child, returning this\nerror:\n\nERROR 1451 (23000): Cannot delete or update a parent row: a foreign\nkey constraint fails (`test`.`child`, CONSTRAINT `child_ibfk_1`\nFOREIGN KEY (`parent_id`) REFERENCES `parent` (`id`))\n\nThis is the same as a DELETE statement with no WHERE clause.\n\nThe count of rows affected by TRUNCATE TABLE is accurate only when it\nis mapped to a DELETE statement.\n\nFor other storage engines, TRUNCATE TABLE differs from DELETE in the\nfollowing ways in MySQL 5.0:\n\no Truncate operations drop and re-create the table, which is much\n  faster than deleting rows one by one, particularly for large tables.\n\no As of MySQL 5.0.8, truncate operations cause an implicit commit.\n  Before 5.0.8, truncate operations are not transaction-safe; an error\n  occurs when attempting one in the course of an active transaction.\n\no Truncation operations cannot be performed if the session holds an\n  active table lock.\n\no Truncation operations do not return a meaningful value for the number\n  of deleted rows. The usual result is \"0 rows affected,\" which should\n  be interpreted as \"no information.\"\n\no As long as the table format file tbl_name.frm is valid, the table can\n  be re-created as an empty table with TRUNCATE TABLE, even if the data\n  or index files have become corrupted.\n\no The table handler does not remember the last used AUTO_INCREMENT\n  value, but starts counting from the beginning. This is true even for\n  MyISAM and InnoDB, which normally do not reuse sequence values.\n\no Since truncation of a table does not make any use of DELETE, the\n  TRUNCATE TABLE statement does not invoke ON DELETE triggers.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/truncate-table.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/truncate-table.html'),
 (310,'BIT_XOR',15,'Syntax:\nBIT_XOR(expr)\n\nReturns the bitwise XOR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (311,'CURRENT_DATE',30,'Syntax:\nCURRENT_DATE, CURRENT_DATE()\n\nCURRENT_DATE and CURRENT_DATE() are synonyms for CURDATE().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (312,'START SLAVE',7,'Syntax:\nSTART SLAVE [thread_type [, thread_type] ... ]\nSTART SLAVE [SQL_THREAD] UNTIL\n    MASTER_LOG_FILE = \'log_name\', MASTER_LOG_POS = log_pos\nSTART SLAVE [SQL_THREAD] UNTIL\n    RELAY_LOG_FILE = \'log_name\', RELAY_LOG_POS = log_pos\n\nthread_type: IO_THREAD | SQL_THREAD\n\nSTART SLAVE with no thread_type options starts both of the slave\nthreads. The I/O thread reads events from the master server and stores\nthem in the relay log. The SQL thread reads events from the relay log\nand executes them. START SLAVE requires the SUPER privilege.\n\nIf START SLAVE succeeds in starting the slave threads, it returns\nwithout any error. However, even in that case, it might be that the\nslave threads start and then later stop (for example, because they do\nnot manage to connect to the master or read its binary log, or some\nother problem). START SLAVE does not warn you about this. You must\ncheck the slave\'s error log for error messages generated by the slave\nthreads, or check that they are running satisfactorily with SHOW SLAVE\nSTATUS.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/start-slave.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/start-slave.html'),
 (313,'AREA',2,'Area(poly)\n\nReturns as a double-precision number the area of the Polygon value\npoly, as measured in its spatial reference system.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#polygon-property-functions\n\n','mysql> SET @poly = \'Polygon((0 0,0 3,3 0,0 0),(1 1,1 2,2 1,1 1))\';\nmysql> SELECT Area(GeomFromText(@poly));\n+---------------------------+\n| Area(GeomFromText(@poly)) |\n+---------------------------+\n|                         4 |\n+---------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#polygon-property-functions'),
 (314,'FLUSH',25,'Syntax:\nFLUSH [NO_WRITE_TO_BINLOG | LOCAL]\n    flush_option [, flush_option] ...\n\nThe FLUSH statement clears or reloads various internal caches used by\nMySQL. One variant acquires a lock. To execute FLUSH, you must have the\nRELOAD privilege.\n\nBy default, FLUSH statements are written to the binary log so that they\nwill be replicated to replication slaves. Logging can be suppressed\nwith the optional NO_WRITE_TO_BINLOG keyword or its alias LOCAL.\n\n*Note*: FLUSH LOGS, FLUSH MASTER, FLUSH SLAVE, and FLUSH TABLES WITH\nREAD LOCK are not written to the binary log in any case because they\nwould cause problems if replicated to a slave.\n\nThe RESET statement is similar to FLUSH. See [HELP RESET], for\ninformation about using the RESET statement with replication.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/flush.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/flush.html'),
 (315,'BEGIN END',22,'Syntax:\n[begin_label:] BEGIN\n    [statement_list]\nEND [end_label]\n\nBEGIN ... END syntax is used for writing compound statements, which can\nappear within stored programs (stored procedures and functions, and\ntriggers). A compound statement can contain multiple statements,\nenclosed by the BEGIN and END keywords. statement_list represents a\nlist of one or more statements, each terminated by a semicolon (;)\nstatement delimiter. The statement_list itself is optional, so the\nempty compound statement (BEGIN END) is legal.\n\nBEGIN ... END blocks can be nested.\n\nUse of multiple statements requires that a client is able to send\nstatement strings containing the ; statement delimiter. In the mysql\ncommand-line client, this is handled with the delimiter command.\nChanging the ; end-of-statement delimiter (for example, to //) permit ;\nto be used in a program body. For an example, see\nhttp://dev.mysql.com/doc/refman/5.0/en/stored-programs-defining.html.\n\nA BEGIN ... END block can be labeled. See [HELP labels].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/begin-end.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/begin-end.html'),
 (316,'SHOW PROCEDURE STATUS',25,'Syntax:\nSHOW PROCEDURE STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement is a MySQL extension. It returns characteristics of a\nstored procedure, such as the database, name, type, creator, creation\nand modification dates, and character set information. A similar\nstatement, SHOW FUNCTION STATUS, displays information about stored\nfunctions (see [HELP SHOW FUNCTION STATUS]).\n\nThe LIKE clause, if present, indicates which procedure or function\nnames to match. The WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.0/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-procedure-status.html\n\n','mysql> SHOW PROCEDURE STATUS LIKE \'sp1\'\\G\n*************************** 1. row ***************************\n           Db: test\n         Name: sp1\n         Type: PROCEDURE\n      Definer: testuser@localhost\n     Modified: 2004-08-03 15:29:37\n      Created: 2004-08-03 15:29:37\nSecurity_type: DEFINER\n      Comment:\n','http://dev.mysql.com/doc/refman/5.0/en/show-procedure-status.html'),
 (317,'DESCRIBE',27,'Syntax:\n{DESCRIBE | DESC} tbl_name [col_name | wild]\n\nDESCRIBE provides information about the columns in a table. It is a\nshortcut for SHOW COLUMNS FROM. As of MySQL 5.0.1, these statements\nalso display information for views. (See [HELP SHOW COLUMNS].)\n\ncol_name can be a column name, or a string containing the SQL \"%\" and\n\"_\" wildcard characters to obtain output only for the columns with\nnames matching the string. There is no need to enclose the string\nwithin quotation marks unless it contains spaces or other special\ncharacters.\n\nmysql> DESCRIBE City;\n+------------+----------+------+-----+---------+----------------+\n| Field      | Type     | Null | Key | Default | Extra          |\n+------------+----------+------+-----+---------+----------------+\n| Id         | int(11)  | NO   | PRI | NULL    | auto_increment |\n| Name       | char(35) | NO   |     |         |                |\n| Country    | char(3)  | NO   | UNI |         |                |\n| District   | char(20) | YES  | MUL |         |                |\n| Population | int(11)  | NO   |     | 0       |                |\n+------------+----------+------+-----+---------+----------------+\n5 rows in set (0.00 sec)\n\nThe description for SHOW COLUMNS provides more information about the\noutput columns (see [HELP SHOW COLUMNS]).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/describe.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/describe.html'),
 (318,'SHOW WARNINGS',25,'Syntax:\nSHOW WARNINGS [LIMIT [offset,] row_count]\nSHOW COUNT(*) WARNINGS\n\nSHOW WARNINGS shows information about the conditions (errors, warnings,\nand notes) that resulted from the last statement in the current session\nthat generated messages. It shows nothing if the last statement used a\ntable and generated no messages. (That is, a statement that uses a\ntable but generates no messages clears the message list.) Statements\nthat do not use tables and do not generate messages have no effect on\nthe message list.\n\nWarnings are generated for DML statements such as INSERT, UPDATE, and\nLOAD DATA INFILE as well as DDL statements such as CREATE TABLE and\nALTER TABLE.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\nhttp://dev.mysql.com/doc/refman/5.0/en/select.html.\n\nA related statement, SHOW ERRORS, shows only the error conditions (it\nexcludes warnings and notes). See [HELP SHOW ERRORS].\n\nThe SHOW COUNT(*) WARNINGS statement displays the total number of\nerrors, warnings, and notes. You can also retrieve this number from the\nwarning_count system variable:\n\nSHOW COUNT(*) WARNINGS;\nSELECT @@warning_count;\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-warnings.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-warnings.html'),
 (319,'DROP USER',9,'Syntax:\nDROP USER user [, user] ...\n\nThe DROP USER statement removes one or more MySQL accounts. To use it,\nyou must have the global CREATE USER privilege or the DELETE privilege\nfor the mysql database. Each account name uses the format described in\nhttp://dev.mysql.com/doc/refman/5.0/en/account-names.html. For example:\n\nDROP USER \'jeffrey\'@\'localhost\';\n\nIf you specify only the user name part of the account name, a host name\npart of \'%\' is used.\n\nDROP USER as present in MySQL 5.0.0 removes only accounts that have no\nprivileges. In MySQL 5.0.2, it was modified to remove account\nprivileges as well. This means that the procedure for removing an\naccount depends on your version of MySQL.\n\nAs of MySQL 5.0.2, you can remove an account and its privileges as\nfollows:\n\nDROP USER user;\n\nThe statement removes privilege rows for the account from all grant\ntables.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/drop-user.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/drop-user.html');
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (320,'STDDEV_POP',15,'Syntax:\nSTDDEV_POP(expr)\n\nReturns the population standard deviation of expr (the square root of\nVAR_POP()). This function was added in MySQL 5.0.3. Before 5.0.3, you\ncan use STD() or STDDEV(), which are equivalent but not standard SQL.\n\nSTDDEV_POP() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (321,'SHOW CHARACTER SET',25,'Syntax:\nSHOW CHARACTER SET\n    [LIKE \'pattern\' | WHERE expr]\n\nThe SHOW CHARACTER SET statement shows all available character sets.\nThe LIKE clause, if present, indicates which character set names to\nmatch. The WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.0/en/extended-show.html. For example:\n\nmysql> SHOW CHARACTER SET LIKE \'latin%\';\n+---------+-----------------------------+-------------------+--------+\n| Charset | Description                 | Default collation | Maxlen |\n+---------+-----------------------------+-------------------+--------+\n| latin1  | cp1252 West European        | latin1_swedish_ci |      1 |\n| latin2  | ISO 8859-2 Central European | latin2_general_ci |      1 |\n| latin5  | ISO 8859-9 Turkish          | latin5_turkish_ci |      1 |\n| latin7  | ISO 8859-13 Baltic          | latin7_general_ci |      1 |\n+---------+-----------------------------+-------------------+--------+\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-character-set.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-character-set.html'),
 (322,'SUBSTRING',35,'Syntax:\nSUBSTRING(str,pos), SUBSTRING(str FROM pos), SUBSTRING(str,pos,len),\nSUBSTRING(str FROM pos FOR len)\n\nThe forms without a len argument return a substring from string str\nstarting at position pos. The forms with a len argument return a\nsubstring len characters long from string str, starting at position\npos. The forms that use FROM are standard SQL syntax. It is also\npossible to use a negative value for pos. In this case, the beginning\nof the substring is pos characters from the end of the string, rather\nthan the beginning. A negative value may be used for pos in any of the\nforms of this function.\n\nFor all forms of SUBSTRING(), the position of the first character in\nthe string from which the substring is to be extracted is reckoned as\n1.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT SUBSTRING(\'Quadratically\',5);\n        -> \'ratically\'\nmysql> SELECT SUBSTRING(\'foobarbar\' FROM 4);\n        -> \'barbar\'\nmysql> SELECT SUBSTRING(\'Quadratically\',5,6);\n        -> \'ratica\'\nmysql> SELECT SUBSTRING(\'Sakila\', -3);\n        -> \'ila\'\nmysql> SELECT SUBSTRING(\'Sakila\', -5, 3);\n        -> \'aki\'\nmysql> SELECT SUBSTRING(\'Sakila\' FROM -4 FOR 2);\n        -> \'ki\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (323,'ISEMPTY',34,'IsEmpty(g)\n\nReturns 1 if the geometry value g is the empty geometry, 0 if it is not\nempty, and -1 if the argument is NULL. If the geometry is empty, it\nrepresents the empty point set.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#general-geometry-property-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#general-geometry-property-functions'),
 (324,'SHOW FUNCTION STATUS',25,'Syntax:\nSHOW FUNCTION STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement is similar to SHOW PROCEDURE STATUS but for stored\nfunctions. See [HELP SHOW PROCEDURE STATUS].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-function-status.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-function-status.html'),
 (325,'LTRIM',35,'Syntax:\nLTRIM(str)\n\nReturns the string str with leading space characters removed.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT LTRIM(\'  barbar\');\n        -> \'barbar\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (326,'INTERSECTS',29,'Intersects(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially intersects g2.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries\n\n','','http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-tes'),
 (327,'CALL',26,'Syntax:\nCALL sp_name([parameter[,...]])\nCALL sp_name[()]\n\nThe CALL statement invokes a stored procedure that was defined\npreviously with CREATE PROCEDURE.\n\nAs of MySQL 5.0.30, stored procedures that take no arguments can be\ninvoked without parentheses. That is, CALL p() and CALL p are\nequivalent.\n\nCALL can pass back values to its caller using parameters that are\ndeclared as OUT or INOUT parameters. When the procedure returns, a\nclient program can also obtain the number of rows affected for the\nfinal statement executed within the routine: At the SQL level, call the\nROW_COUNT() function; from the C API, call the mysql_affected_rows()\nfunction.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/call.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/call.html'),
 (328,'MBRDISJOINT',5,'MBRDisjoint(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 are disjoint (do not intersect).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr\n\n','','http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geome'),
 (329,'VALUES',14,'Syntax:\nVALUES(col_name)\n\nIn an INSERT ... ON DUPLICATE KEY UPDATE statement, you can use the\nVALUES(col_name) function in the UPDATE clause to refer to column\nvalues from the INSERT portion of the statement. In other words,\nVALUES(col_name) in the UPDATE clause refers to the value of col_name\nthat would be inserted, had no duplicate-key conflict occurred. This\nfunction is especially useful in multiple-row inserts. The VALUES()\nfunction is meaningful only in the ON DUPLICATE KEY UPDATE clause of\nINSERT statements and returns NULL otherwise. See\nhttp://dev.mysql.com/doc/refman/5.0/en/insert-on-duplicate.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html\n\n','mysql> INSERT INTO table (a,b,c) VALUES (1,2,3),(4,5,6)\n    -> ON DUPLICATE KEY UPDATE c=VALUES(a)+VALUES(b);\n','http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html'),
 (330,'SUBSTRING_INDEX',35,'Syntax:\nSUBSTRING_INDEX(str,delim,count)\n\nReturns the substring from string str before count occurrences of the\ndelimiter delim. If count is positive, everything to the left of the\nfinal delimiter (counting from the left) is returned. If count is\nnegative, everything to the right of the final delimiter (counting from\nthe right) is returned. SUBSTRING_INDEX() performs a case-sensitive\nmatch when searching for delim.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT SUBSTRING_INDEX(\'www.mysql.com\', \'.\', 2);\n        -> \'www.mysql\'\nmysql> SELECT SUBSTRING_INDEX(\'www.mysql.com\', \'.\', -2);\n        -> \'mysql.com\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (331,'ENCODE',11,'Syntax:\nENCODE(str,pass_str)\n\nEncrypt str using pass_str as the password. To decrypt the result, use\nDECODE().\n\nThe result is a binary string of the same length as str.\n\nThe strength of the encryption is based on how good the random\ngenerator is. It should suffice for short strings.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html'),
 (332,'LOOP',22,'Syntax:\n[begin_label:] LOOP\n    statement_list\nEND LOOP [end_label]\n\nLOOP implements a simple loop construct, enabling repeated execution of\nthe statement list, which consists of one or more statements, each\nterminated by a semicolon (;) statement delimiter. The statements\nwithin the loop are repeated until the loop is terminated. Usually,\nthis is accomplished with a LEAVE statement. Within a stored function,\nRETURN can also be used, which exits the function entirely.\n\nNeglecting to include a loop-termination statement results in an\ninfinite loop.\n\nA LOOP statement can be labeled. For the rules regarding label use, see\n[HELP labels].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/loop-statement.html\n\n','CREATE PROCEDURE doiterate(p1 INT)\nBEGIN\n  label1: LOOP\n    SET p1 = p1 + 1;\n    IF p1 < 10 THEN\n      ITERATE label1;\n    END IF;\n    LEAVE label1;\n  END LOOP label1;\n  SET @x = p1;\nEND;\n','http://dev.mysql.com/doc/refman/5.0/en/loop-statement.html'),
 (333,'TRUNCATE',4,'Syntax:\nTRUNCATE(X,D)\n\nReturns the number X, truncated to D decimal places. If D is 0, the\nresult has no decimal point or fractional part. D can be negative to\ncause D digits left of the decimal point of the value X to become zero.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT TRUNCATE(1.223,1);\n        -> 1.2\nmysql> SELECT TRUNCATE(1.999,1);\n        -> 1.9\nmysql> SELECT TRUNCATE(1.999,0);\n        -> 1\nmysql> SELECT TRUNCATE(-1.999,1);\n        -> -1.9\nmysql> SELECT TRUNCATE(122,-2);\n       -> 100\nmysql> SELECT TRUNCATE(10.28*100,0);\n       -> 1028\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (334,'TIMESTAMPADD',30,'Syntax:\nTIMESTAMPADD(unit,interval,datetime_expr)\n\nAdds the integer expression interval to the date or datetime expression\ndatetime_expr. The unit for interval is given by the unit argument,\nwhich should be one of the following values: FRAC_SECOND\n(microseconds), SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, QUARTER, or\nYEAR.\n\nBeginning with MySQL 5.0.60, it is possible to use MICROSECOND in place\nof FRAC_SECOND with this function, and FRAC_SECOND is deprecated.\nFRAC_SECOND is removed in MySQL 5.5.\n\nThe unit value may be specified using one of keywords as shown, or with\na prefix of SQL_TSI_. For example, DAY and SQL_TSI_DAY both are legal.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT TIMESTAMPADD(MINUTE,1,\'2003-01-02\');\n        -> \'2003-01-02 00:01:00\'\nmysql> SELECT TIMESTAMPADD(WEEK,1,\'2003-01-02\');\n        -> \'2003-01-09\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (335,'SHOW',25,'SHOW has many forms that provide information about databases, tables,\ncolumns, or status information about the server. This section describes\nthose following:\n\nSHOW {BINARY | MASTER} LOGS\nSHOW BINLOG EVENTS [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\nSHOW CHARACTER SET [like_or_where]\nSHOW COLLATION [like_or_where]\nSHOW [FULL] COLUMNS FROM tbl_name [FROM db_name] [like_or_where]\nSHOW CREATE DATABASE db_name\nSHOW CREATE FUNCTION func_name\nSHOW CREATE PROCEDURE proc_name\nSHOW CREATE TABLE tbl_name\nSHOW DATABASES [like_or_where]\nSHOW ENGINE engine_name {LOGS | STATUS }\nSHOW [STORAGE] ENGINES\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW FUNCTION CODE func_name\nSHOW FUNCTION STATUS [like_or_where]\nSHOW GRANTS FOR user\nSHOW INDEX FROM tbl_name [FROM db_name]\nSHOW INNODB STATUS\nSHOW PROCEDURE CODE proc_name\nSHOW PROCEDURE STATUS [like_or_where]\nSHOW [BDB] LOGS\nSHOW MASTER STATUS\nSHOW MUTEX STATUS\nSHOW OPEN TABLES [FROM db_name] [like_or_where]\nSHOW PRIVILEGES\nSHOW [FULL] PROCESSLIST\nSHOW SLAVE HOSTS\nSHOW SLAVE STATUS\nSHOW PROFILE [types] [FOR QUERY n] [OFFSET n] [LIMIT n]\nSHOW PROFILES\nSHOW [GLOBAL | SESSION] STATUS [like_or_where]\nSHOW TABLE STATUS [FROM db_name] [like_or_where]\nSHOW [FULL] TABLES [FROM db_name] [like_or_where]\nSHOW TRIGGERS [FROM db_name] [like_or_where]\nSHOW [GLOBAL | SESSION] VARIABLES [like_or_where]\nSHOW WARNINGS [LIMIT [offset,] row_count]\n\nlike_or_where:\n    LIKE \'pattern\'\n  | WHERE expr\n\nIf the syntax for a given SHOW statement includes a LIKE \'pattern\'\npart, \'pattern\' is a string that can contain the SQL \"%\" and \"_\"\nwildcard characters. The pattern is useful for restricting statement\noutput to matching values.\n\nSeveral SHOW statements also accept a WHERE clause that provides more\nflexibility in specifying which rows to display. See\nhttp://dev.mysql.com/doc/refman/5.0/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show.html'),
 (336,'GREATEST',17,'Syntax:\nGREATEST(value1,value2,...)\n\nWith two or more arguments, returns the largest (maximum-valued)\nargument. The arguments are compared using the same rules as for\nLEAST().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT GREATEST(2,0);\n        -> 2\nmysql> SELECT GREATEST(34.0,3.0,5.0,767.0);\n        -> 767.0\nmysql> SELECT GREATEST(\'B\',\'A\',\'C\');\n        -> \'C\'\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (337,'SHOW VARIABLES',25,'Syntax:\nSHOW [GLOBAL | SESSION] VARIABLES\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW VARIABLES shows the values of MySQL system variables. This\ninformation also can be obtained using the mysqladmin variables\ncommand. The LIKE clause, if present, indicates which variable names to\nmatch. The WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.0/en/extended-show.html. This\nstatement does not require any privilege. It requires only the ability\nto connect to the server.\n\nWith the GLOBAL modifier, SHOW VARIABLES displays the values that are\nused for new connections to MySQL. If a variable has no global value,\nthe session value is displayed. With SESSION, SHOW VARIABLES displays\nthe values that are in effect for the current connection. If no\nmodifier is present, the default is SESSION. LOCAL is a synonym for\nSESSION.\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern. To obtain the row for a\nspecific variable, use a LIKE clause as shown:\n\nSHOW VARIABLES LIKE \'max_join_size\';\nSHOW SESSION VARIABLES LIKE \'max_join_size\';\n\nTo get a list of variables whose name match a pattern, use the \"%\"\nwildcard character in a LIKE clause:\n\nSHOW VARIABLES LIKE \'%size%\';\nSHOW GLOBAL VARIABLES LIKE \'%size%\';\n\nWildcard characters can be used in any position within the pattern to\nbe matched. Strictly speaking, because \"_\" is a wildcard that matches\nany single character, you should escape it as \"\\_\" to match it\nliterally. In practice, this is rarely necessary.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-variables.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-variables.html'),
 (338,'BIT_AND',15,'Syntax:\nBIT_AND(expr)\n\nReturns the bitwise AND of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (339,'SECOND',30,'Syntax:\nSECOND(time)\n\nReturns the second for time, in the range 0 to 59.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT SECOND(\'10:05:03\');\n        -> 3\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (340,'ATAN2',4,'Syntax:\nATAN(Y,X), ATAN2(Y,X)\n\nReturns the arc tangent of the two variables X and Y. It is similar to\ncalculating the arc tangent of Y / X, except that the signs of both\narguments are used to determine the quadrant of the result.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT ATAN(-2,2);\n        -> -0.78539816339745\nmysql> SELECT ATAN2(PI(),0);\n        -> 1.5707963267949\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (341,'MBRCONTAINS',5,'MBRContains(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangle of g1\ncontains the Minimum Bounding Rectangle of g2. This tests the opposite\nrelationship as MBRWithin().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr\n\n','mysql> SET @g1 = GeomFromText(\'Polygon((0 0,0 3,3 3,3 0,0 0))\');\nmysql> SET @g2 = GeomFromText(\'Point(1 1)\');\nmysql> SELECT MBRContains(@g1,@g2), MBRContains(@g2,@g1);\n----------------------+----------------------+\n| MBRContains(@g1,@g2) | MBRContains(@g2,@g1) |\n+----------------------+----------------------+\n|                    1 |                    0 |\n+----------------------+----------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geome'),
 (342,'HOUR',30,'Syntax:\nHOUR(time)\n\nReturns the hour for time. The range of the return value is 0 to 23 for\ntime-of-day values. However, the range of TIME values actually is much\nlarger, so HOUR can return values greater than 23.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT HOUR(\'10:05:03\');\n        -> 10\nmysql> SELECT HOUR(\'272:59:59\');\n        -> 272\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (343,'SELECT',26,'Syntax:\nSELECT\n    [ALL | DISTINCT | DISTINCTROW ]\n      [HIGH_PRIORITY]\n      [STRAIGHT_JOIN]\n      [SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]\n      [SQL_CACHE | SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS]\n    select_expr [, select_expr ...]\n    [FROM table_references\n    [WHERE where_condition]\n    [GROUP BY {col_name | expr | position}\n      [ASC | DESC], ... [WITH ROLLUP]]\n    [HAVING where_condition]\n    [ORDER BY {col_name | expr | position}\n      [ASC | DESC], ...]\n    [LIMIT {[offset,] row_count | row_count OFFSET offset}]\n    [PROCEDURE procedure_name(argument_list)]\n    [INTO OUTFILE \'file_name\' export_options\n      | INTO DUMPFILE \'file_name\'\n      | INTO var_name [, var_name]]\n    [FOR UPDATE | LOCK IN SHARE MODE]]\n\nSELECT is used to retrieve rows selected from one or more tables, and\ncan include UNION statements and subqueries. See [HELP UNION], and\nhttp://dev.mysql.com/doc/refman/5.0/en/subqueries.html.\n\nThe most commonly used clauses of SELECT statements are these:\n\no Each select_expr indicates a column that you want to retrieve. There\n  must be at least one select_expr.\n\no table_references indicates the table or tables from which to retrieve\n  rows. Its syntax is described in [HELP JOIN].\n\no The WHERE clause, if given, indicates the condition or conditions\n  that rows must satisfy to be selected. where_condition is an\n  expression that evaluates to true for each row to be selected. The\n  statement selects all rows if there is no WHERE clause.\n\n  In the WHERE expression, you can use any of the functions and\n  operators that MySQL supports, except for aggregate (summary)\n  functions. See\n  http://dev.mysql.com/doc/refman/5.0/en/expressions.html, and\n  http://dev.mysql.com/doc/refman/5.0/en/functions.html.\n\nSELECT can also be used to retrieve rows computed without reference to\nany table.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/select.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/select.html'),
 (344,'COT',4,'Syntax:\nCOT(X)\n\nReturns the cotangent of X.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT COT(12);\n        -> -1.5726734063977\nmysql> SELECT COT(0);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (345,'BACKUP TABLE',19,'Syntax:\nBACKUP TABLE tbl_name [, tbl_name] ... TO \'/path/to/backup/directory\'\n\n*Note*: This statement is deprecated and is removed in MySQL 5.5. As an\nalternative, mysqldump or mysqlhotcopy can be used instead.\n\nBACKUP TABLE copies to the backup directory the minimum number of table\nfiles needed to restore the table, after flushing any buffered changes\nto disk. The statement works only for MyISAM tables. It copies the .frm\ndefinition and .MYD data files. The .MYI index file can be rebuilt from\nthose two files. The directory should be specified as a full path name.\nTo restore the table, use RESTORE TABLE.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/backup-table.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/backup-table.html'),
 (346,'LOAD_FILE',35,'Syntax:\nLOAD_FILE(file_name)\n\nReads the file and returns the file contents as a string. To use this\nfunction, the file must be located on the server host, you must specify\nthe full path name to the file, and you must have the FILE privilege.\nThe file must be readable by all and its size less than\nmax_allowed_packet bytes. If the secure_file_priv system variable is\nset to a nonempty directory name, the file to be loaded must be located\nin that directory.\n\nIf the file does not exist or cannot be read because one of the\npreceding conditions is not satisfied, the function returns NULL.\n\nAs of MySQL 5.0.19, the character_set_filesystem system variable\ncontrols interpretation of file names that are given as literal\nstrings.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> UPDATE t\n            SET blob_col=LOAD_FILE(\'/tmp/picture\')\n            WHERE id=1;\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (347,'LOAD TABLE FROM MASTER',7,'Syntax:\nLOAD TABLE tbl_name FROM MASTER\n\nThis feature is deprecated and should be avoided. It is subject to\nremoval in a future version of MySQL.\n\nSince the current implementation of LOAD DATA FROM MASTER and LOAD\nTABLE FROM MASTER is very limited, these statements are deprecated as\nof MySQL 4.1 and removed in MySQL 5.5.\n\nThe recommended alternative solution to using LOAD DATA FROM MASTER or\nLOAD TABLE FROM MASTER is using mysqldump or mysqlhotcopy. The latter\nrequires Perl and two Perl modules (DBI and DBD:mysql) and works for\nMyISAM and ARCHIVE tables only. With mysqldump, you can create SQL\ndumps on the master and pipe (or copy) these to a mysql client on the\nslave. This has the advantage of working for all storage engines, but\ncan be quite slow, since it works using SELECT.\n\nTransfers a copy of the table from the master to the slave. This\nstatement is implemented mainly debugging LOAD DATA FROM MASTER\noperations. To use LOAD TABLE, the account used for connecting to the\nmaster server must have the RELOAD and SUPER privileges on the master\nand the SELECT privilege for the master table to load. On the slave\nside, the user that issues LOAD TABLE FROM MASTER must have privileges\nfor dropping and creating the table.\n\nThe conditions for LOAD DATA FROM MASTER apply here as well. For\nexample, LOAD TABLE FROM MASTER works only for MyISAM tables. The\ntimeout notes for LOAD DATA FROM MASTER apply as well.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/load-table-from-master.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/load-table-from-master.html'),
 (348,'POINTFROMTEXT',3,'PointFromText(wkt[,srid])\n\nConstructs a POINT value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkt-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkt-functions'),
 (349,'GROUP_CONCAT',15,'Syntax:\nGROUP_CONCAT(expr)\n\nThis function returns a string result with the concatenated non-NULL\nvalues from a group. It returns NULL if there are no non-NULL values.\nThe full syntax is as follows:\n\nGROUP_CONCAT([DISTINCT] expr [,expr ...]\n             [ORDER BY {unsigned_integer | col_name | expr}\n                 [ASC | DESC] [,col_name ...]]\n             [SEPARATOR str_val])\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','mysql> SELECT student_name,\n    ->     GROUP_CONCAT(test_score)\n    ->     FROM student\n    ->     GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (350,'DATE_FORMAT',30,'Syntax:\nDATE_FORMAT(date,format)\n\nFormats the date value according to the format string.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT DATE_FORMAT(\'2009-10-04 22:23:00\', \'%W %M %Y\');\n        -> \'Sunday October 2009\'\nmysql> SELECT DATE_FORMAT(\'2007-10-04 22:23:00\', \'%H:%i:%s\');\n        -> \'22:23:00\'\nmysql> SELECT DATE_FORMAT(\'1900-10-04 22:23:00\',\n    ->                 \'%D %y %a %d %m %b %j\');\n        -> \'4th 00 Thu 04 10 Oct 277\'\nmysql> SELECT DATE_FORMAT(\'1997-10-04 22:23:00\',\n    ->                 \'%H %k %I %r %T %S %w\');\n        -> \'22 22 10 10:23:00 PM 22:23:00 00 6\'\nmysql> SELECT DATE_FORMAT(\'1999-01-01\', \'%X %V\');\n        -> \'1998 52\'\nmysql> SELECT DATE_FORMAT(\'2006-06-00\', \'%d\');\n        -> \'00\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (351,'BENCHMARK',16,'Syntax:\nBENCHMARK(count,expr)\n\nThe BENCHMARK() function executes the expression expr repeatedly count\ntimes. It may be used to time how quickly MySQL processes the\nexpression. The result value is always 0. The intended use is from\nwithin the mysql client, which reports query execution times:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/information-functions.html\n\n','mysql> SELECT BENCHMARK(1000000,ENCODE(\'hello\',\'goodbye\'));\n+----------------------------------------------+\n| BENCHMARK(1000000,ENCODE(\'hello\',\'goodbye\')) |\n+----------------------------------------------+\n|                                            0 |\n+----------------------------------------------+\n1 row in set (4.74 sec)\n','http://dev.mysql.com/doc/refman/5.0/en/information-functions.html'),
 (352,'YEAR',30,'Syntax:\nYEAR(date)\n\nReturns the year for date, in the range 1000 to 9999, or 0 for the\n\"zero\" date.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT YEAR(\'1987-01-01\');\n        -> 1987\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (353,'SHOW ENGINE',25,'Syntax:\nSHOW ENGINE engine_name {LOGS | STATUS }\n\nSHOW ENGINE displays log or status information about a storage engine.\nThe following statements currently are supported:\n\nSHOW ENGINE BDB LOGS\nSHOW ENGINE INNODB STATUS\nSHOW ENGINE NDB STATUS\nSHOW ENGINE NDBCLUSTER STATUS\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-engine.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-engine.html'),
 (354,'NAME_CONST',14,'Syntax:\nNAME_CONST(name,value)\n\nReturns the given value. When used to produce a result set column,\nNAME_CONST() causes the column to have the given name. The arguments\nshould be constants.\n\nmysql> SELECT NAME_CONST(\'myname\', 14);\n+--------+\n| myname |\n+--------+\n|     14 |\n+--------+\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html'),
 (355,'RELEASE_LOCK',14,'Syntax:\nRELEASE_LOCK(str)\n\nReleases the lock named by the string str that was obtained with\nGET_LOCK(). Returns 1 if the lock was released, 0 if the lock was not\nestablished by this thread (in which case the lock is not released),\nand NULL if the named lock did not exist. The lock does not exist if it\nwas never obtained by a call to GET_LOCK() or if it has previously been\nreleased.\n\nThe DO statement is convenient to use with RELEASE_LOCK(). See [HELP\nDO].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html'),
 (356,'IS NULL',17,'Syntax:\nIS NULL\n\nTests whether a value is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT 1 IS NULL, 0 IS NULL, NULL IS NULL;\n        -> 0, 0, 1\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (357,'CONVERT_TZ',30,'Syntax:\nCONVERT_TZ(dt,from_tz,to_tz)\n\nCONVERT_TZ() converts a datetime value dt from the time zone given by\nfrom_tz to the time zone given by to_tz and returns the resulting\nvalue. Time zones are specified as described in\nhttp://dev.mysql.com/doc/refman/5.0/en/time-zone-support.html. This\nfunction returns NULL if the arguments are invalid.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT CONVERT_TZ(\'2004-01-01 12:00:00\',\'GMT\',\'MET\');\n        -> \'2004-01-01 13:00:00\'\nmysql> SELECT CONVERT_TZ(\'2004-01-01 12:00:00\',\'+00:00\',\'+10:00\');\n        -> \'2004-01-01 22:00:00\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (358,'TIME_TO_SEC',30,'Syntax:\nTIME_TO_SEC(time)\n\nReturns the time argument, converted to seconds.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT TIME_TO_SEC(\'22:23:00\');\n        -> 80580\nmysql> SELECT TIME_TO_SEC(\'00:39:38\');\n        -> 2378\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (359,'WEEKDAY',30,'Syntax:\nWEEKDAY(date)\n\nReturns the weekday index for date (0 = Monday, 1 = Tuesday, ... 6 =\nSunday).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT WEEKDAY(\'2008-02-03 22:23:00\');\n        -> 6\nmysql> SELECT WEEKDAY(\'2007-11-06\');\n        -> 1\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (360,'EXPORT_SET',35,'Syntax:\nEXPORT_SET(bits,on,off[,separator[,number_of_bits]])\n\nReturns a string such that for every bit set in the value bits, you get\nan on string and for every bit not set in the value, you get an off\nstring. Bits in bits are examined from right to left (from low-order to\nhigh-order bits). Strings are added to the result from left to right,\nseparated by the separator string (the default being the comma\ncharacter \",\"). The number of bits examined is given by number_of_bits,\nwhich has a default of 64 if not specified. number_of_bits is silently\nclipped to 64 if larger than 64. It is treated as an unsigned integer,\nso a value of -1 is effectively the same as 64.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT EXPORT_SET(5,\'Y\',\'N\',\',\',4);\n        -> \'Y,N,Y,N\'\nmysql> SELECT EXPORT_SET(6,\'1\',\'0\',\',\',10);\n        -> \'0,1,1,0,0,0,0,0,0,0\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (361,'TIME FUNCTION',30,'Syntax:\nTIME(expr)\n\nExtracts the time part of the time or datetime expression expr and\nreturns it as a string.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT TIME(\'2003-12-31 01:02:03\');\n        -> \'01:02:03\'\nmysql> SELECT TIME(\'2003-12-31 01:02:03.000123\');\n        -> \'01:02:03.000123\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (362,'DATE_ADD',30,'Syntax:\nDATE_ADD(date,INTERVAL expr unit), DATE_SUB(date,INTERVAL expr unit)\n\nThese functions perform date arithmetic. The date argument specifies\nthe starting date or datetime value. expr is an expression specifying\nthe interval value to be added or subtracted from the starting date.\nexpr is a string; it may start with a \"-\" for negative intervals. unit\nis a keyword indicating the units in which the expression should be\ninterpreted.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT \'2008-12-31 23:59:59\' + INTERVAL 1 SECOND;\n        -> \'2009-01-01 00:00:00\'\nmysql> SELECT INTERVAL 1 DAY + \'2008-12-31\';\n        -> \'2009-01-01\'\nmysql> SELECT \'2005-01-01\' - INTERVAL 1 SECOND;\n        -> \'2004-12-31 23:59:59\'\nmysql> SELECT DATE_ADD(\'2000-12-31 23:59:59\',\n    ->                 INTERVAL 1 SECOND);\n        -> \'2001-01-01 00:00:00\'\nmysql> SELECT DATE_ADD(\'2010-12-31 23:59:59\',\n    ->                 INTERVAL 1 DAY);\n        -> \'2011-01-01 23:59:59\'\nmysql> SELECT DATE_ADD(\'2100-12-31 23:59:59\',\n    ->                 INTERVAL \'1:1\' MINUTE_SECOND);\n        -> \'2101-01-01 00:01:00\'\nmysql> SELECT DATE_SUB(\'2005-01-01 00:00:00\',\n    ->                 INTERVAL \'1 1:1:1\' DAY_SECOND);\n        -> \'2004-12-30 22:58:59\'\nmysql> SELECT DATE_ADD(\'1900-01-01 00:00:00\',\n    ->                 INTERVAL \'-1 10\' DAY_HOUR);\n        -> \'1899-12-30 14:00:00\'\nmysql> SELECT DATE_SUB(\'1998-01-02\', INTERVAL 31 DAY);\n        -> \'1997-12-02\'\nmysql> SELECT DATE_ADD(\'1992-12-31 23:59:59.000002\',\n    ->            INTERVAL \'1.999999\' SECOND_MICROSECOND);\n        -> \'1993-01-01 00:00:01.000001\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (363,'CAST',35,'Syntax:\nCAST(expr AS type)\n\nThe CAST() function takes a value of one type and produce a value of\nanother type, similar to CONVERT(). See the description of CONVERT()\nfor more information.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/cast-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/cast-functions.html'),
 (364,'SOUNDS LIKE',35,'Syntax:\nexpr1 SOUNDS LIKE expr2\n\nThis is the same as SOUNDEX(expr1) = SOUNDEX(expr2).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (365,'PERIOD_DIFF',30,'Syntax:\nPERIOD_DIFF(P1,P2)\n\nReturns the number of months between periods P1 and P2. P1 and P2\nshould be in the format YYMM or YYYYMM. Note that the period arguments\nP1 and P2 are not date values.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT PERIOD_DIFF(200802,200703);\n        -> 11\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (366,'LIKE',35,'Syntax:\nexpr LIKE pat [ESCAPE \'escape_char\']\n\nPattern matching using SQL simple regular expression comparison.\nReturns 1 (TRUE) or 0 (FALSE). If either expr or pat is NULL, the\nresult is NULL.\n\nThe pattern need not be a literal string. For example, it can be\nspecified as a string expression or table column.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-comparison-functions.html\n\n','mysql> SELECT \'David!\' LIKE \'David_\';\n        -> 1\nmysql> SELECT \'David!\' LIKE \'%D%v%\';\n        -> 1\n','http://dev.mysql.com/doc/refman/5.0/en/string-comparison-functions.html'),
 (367,'MULTIPOINT',23,'MultiPoint(pt1,pt2,...)\n\nConstructs a MultiPoint value using Point or WKB Point arguments.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-mysql-specific-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-mysql-specific-functions'),
 (368,'>>',18,'Syntax:\n>>\n\nShifts a longlong (BIGINT) number to the right.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/bit-functions.html\n\n','mysql> SELECT 4 >> 2;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.0/en/bit-functions.html'),
 (369,'FETCH',22,'Syntax:\nFETCH cursor_name INTO var_name [, var_name] ...\n\nThis statement fetches the next row for the SELECT statement associated\nwith the specified cursor (which must be open), and advances the cursor\npointer. If a row exists, the fetched columns are stored in the named\nvariables. The number of columns retrieved by the SELECT statement must\nmatch the number of output variables specified in the FETCH statement.\n\nIf no more rows are available, a No Data condition occurs with SQLSTATE\nvalue \'02000\'. To detect this condition, you can set up a handler for\nit (or for a NOT FOUND condition). For an example, see\nhttp://dev.mysql.com/doc/refman/5.0/en/cursors.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/fetch.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/fetch.html'),
 (370,'AVG',15,'Syntax:\nAVG([DISTINCT] expr)\n\nReturns the average value of expr. The DISTINCT option can be used as\nof MySQL 5.0.3 to return the average of the distinct values of expr.\n\nAVG() returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','mysql> SELECT student_name, AVG(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (371,'TRUE FALSE',28,'The constants TRUE and FALSE evaluate to 1 and 0, respectively. The\nconstant names can be written in any lettercase.\n\nmysql> SELECT TRUE, true, FALSE, false;\n        -> 1, 1, 0, 0\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/boolean-literals.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/boolean-literals.html'),
 (372,'MBRWITHIN',5,'MBRWithin(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangle of g1\nis within the Minimum Bounding Rectangle of g2. This tests the opposite\nrelationship as MBRContains().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geometry-mbr\n\n','mysql> SET @g1 = GeomFromText(\'Polygon((0 0,0 3,3 3,3 0,0 0))\');\nmysql> SET @g2 = GeomFromText(\'Polygon((0 0,0 5,5 5,5 0,0 0))\');\nmysql> SELECT MBRWithin(@g1,@g2), MBRWithin(@g2,@g1);\n+--------------------+--------------------+\n| MBRWithin(@g1,@g2) | MBRWithin(@g2,@g1) |\n+--------------------+--------------------+\n|                  1 |                  0 |\n+--------------------+--------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#relations-on-geome'),
 (373,'IN',17,'Syntax:\nexpr IN (value,...)\n\nReturns 1 if expr is equal to any of the values in the IN list, else\nreturns 0. If all values are constants, they are evaluated according to\nthe type of expr and sorted. The search for the item then is done using\na binary search. This means IN is very quick if the IN value list\nconsists entirely of constants. Otherwise, type conversion takes place\naccording to the rules described in\nhttp://dev.mysql.com/doc/refman/5.0/en/type-conversion.html, but\napplied to all the arguments.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT 2 IN (0,3,5,7);\n        -> 0\nmysql> SELECT \'wefwf\' IN (\'wee\',\'wefwf\',\'weg\');\n        -> 1\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (374,'QUOTE',35,'Syntax:\nQUOTE(str)\n\nQuotes a string to produce a result that can be used as a properly\nescaped data value in an SQL statement. The string is returned enclosed\nby single quotation marks and with each instance of backslash (\"\\\"),\nsingle quote (\"\'\"), ASCII NUL, and Control+Z preceded by a backslash.\nIf the argument is NULL, the return value is the word \"NULL\" without\nenclosing single quotation marks.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT QUOTE(\'Don\\\'t!\');\n        -> \'Don\\\'t!\'\nmysql> SELECT QUOTE(NULL);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (375,'SESSION_USER',16,'Syntax:\nSESSION_USER()\n\nSESSION_USER() is a synonym for USER().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/information-functions.html'),
 (376,'HELP COMMAND',25,'Syntax:\nmysql> help search_string\n\nIf you provide an argument to the help command, mysql uses it as a\nsearch string to access server-side help from the contents of the MySQL\nReference Manual. The proper operation of this command requires that\nthe help tables in the mysql database be initialized with help topic\ninformation (see\nhttp://dev.mysql.com/doc/refman/5.0/en/server-side-help-support.html).\n\nIf there is no match for the search string, the search fails:\n\nmysql> help me\n\nNothing found\nPlease try to run \'help contents\' for a list of all accessible topics\n\nUse help contents to see a list of the help categories:\n\nmysql> help contents\nYou asked for help about help category: \"Contents\"\nFor more information, type \'help <item>\', where <item> is one of the\nfollowing categories:\n   Account Management\n   Administration\n   Data Definition\n   Data Manipulation\n   Data Types\n   Functions\n   Functions and Modifiers for Use with GROUP BY\n   Geographic Features\n   Language Structure\n   Storage Engines\n   Stored Routines\n   Table Maintenance\n   Transactions\n   Triggers\n\nIf the search string matches multiple items, mysql shows a list of\nmatching topics:\n\nmysql> help logs\nMany help items for your request exist.\nTo make a more specific request, please type \'help <item>\',\nwhere <item> is one of the following topics:\n   SHOW\n   SHOW BINARY LOGS\n   SHOW ENGINE\n   SHOW LOGS\n\nUse a topic as the search string to see the help entry for that topic:\n\nmysql> help show binary logs\nName: \'SHOW BINARY LOGS\'\nDescription:\nSyntax:\nSHOW BINARY LOGS\nSHOW MASTER LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [purge-binary-logs], that shows how\nto determine which logs can be purged.\n\nmysql> SHOW BINARY LOGS;\n+---------------+-----------+\n| Log_name      | File_size |\n+---------------+-----------+\n| binlog.000015 |    724935 |\n| binlog.000016 |    733481 |\n+---------------+-----------+\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mysql-server-side-help.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/mysql-server-side-help.html'),
 (377,'QUARTER',30,'Syntax:\nQUARTER(date)\n\nReturns the quarter of the year for date, in the range 1 to 4.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT QUARTER(\'2008-04-01\');\n        -> 2\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (378,'POSITION',35,'Syntax:\nPOSITION(substr IN str)\n\nPOSITION(substr IN str) is a synonym for LOCATE(substr,str).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (379,'SHOW CREATE FUNCTION',25,'Syntax:\nSHOW CREATE FUNCTION func_name\n\nThis statement is similar to SHOW CREATE PROCEDURE but for stored\nfunctions. See [HELP SHOW CREATE PROCEDURE].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-create-function.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-create-function.html'),
 (380,'IS_USED_LOCK',14,'Syntax:\nIS_USED_LOCK(str)\n\nChecks whether the lock named str is in use (that is, locked). If so,\nit returns the connection identifier of the client that holds the lock.\nOtherwise, it returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html'),
 (381,'POLYFROMTEXT',3,'PolyFromText(wkt[,srid]), PolygonFromText(wkt[,srid])\n\nConstructs a POLYGON value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkt-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkt-functions'),
 (382,'DES_ENCRYPT',11,'Syntax:\nDES_ENCRYPT(str[,{key_num|key_str}])\n\nEncrypts the string with the given key using the Triple-DES algorithm.\n\nThis function works only if MySQL has been configured with SSL support.\nSee http://dev.mysql.com/doc/refman/5.0/en/secure-connections.html.\n\nThe encryption key to use is chosen based on the second argument to\nDES_ENCRYPT(), if one was given. With no argument, the first key from\nthe DES key file is used. With a key_num argument, the given key number\n(0 to 9) from the DES key file is used. With a key_str argument, the\ngiven key string is used to encrypt str.\n\nThe key file can be specified with the --des-key-file server option.\n\nThe return string is a binary string where the first character is\nCHAR(128 | key_num). If an error occurs, DES_ENCRYPT() returns NULL.\n\nThe 128 is added to make it easier to recognize an encrypted key. If\nyou use a string key, key_num is 127.\n\nThe string length for the result is given by this formula:\n\nnew_len = orig_len + (8 - (orig_len % 8)) + 1\n\nEach line in the DES key file has the following format:\n\nkey_num des_key_str\n\nEach key_num value must be a number in the range from 0 to 9. Lines in\nthe file may be in any order. des_key_str is the string that is used to\nencrypt the message. There should be at least one space between the\nnumber and the key. The first key is the default key that is used if\nyou do not specify any key argument to DES_ENCRYPT().\n\nYou can tell MySQL to read new key values from the key file with the\nFLUSH DES_KEY_FILE statement. This requires the RELOAD privilege.\n\nOne benefit of having a set of default keys is that it gives\napplications a way to check for the existence of encrypted column\nvalues, without giving the end user the right to decrypt those values.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html\n\n','mysql> SELECT customer_address FROM customer_table \n     > WHERE crypted_credit_card = DES_ENCRYPT(\'credit_card_number\');\n','http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html'),
 (383,'CEIL',4,'Syntax:\nCEIL(X)\n\nCEIL() is a synonym for CEILING().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (384,'LENGTH',35,'Syntax:\nLENGTH(str)\n\nReturns the length of the string str, measured in bytes. A multi-byte\ncharacter counts as multiple bytes. This means that for a string\ncontaining five two-byte characters, LENGTH() returns 10, whereas\nCHAR_LENGTH() returns 5.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT LENGTH(\'text\');\n        -> 4\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (385,'STR_TO_DATE',30,'Syntax:\nSTR_TO_DATE(str,format)\n\nThis is the inverse of the DATE_FORMAT() function. It takes a string\nstr and a format string format. STR_TO_DATE() returns a DATETIME value\nif the format string contains both date and time parts, or a DATE or\nTIME value if the string contains only date or time parts. If the date,\ntime, or datetime value extracted from str is illegal, STR_TO_DATE()\nreturns NULL and, as of MySQL 5.0.3, produces a warning.\n\nThe server scans str attempting to match format to it. The format\nstring can contain literal characters and format specifiers beginning\nwith %. Literal characters in format must match literally in str.\nFormat specifiers in format must match a date or time part in str. For\nthe specifiers that can be used in format, see the DATE_FORMAT()\nfunction description.\n\nmysql> SELECT STR_TO_DATE(\'01,5,2013\',\'%d,%m,%Y\');\n        -> \'2013-05-01\'\nmysql> SELECT STR_TO_DATE(\'May 1, 2013\',\'%M %d,%Y\');\n        -> \'2013-05-01\'\n\nScanning starts at the beginning of str and fails if format is found\nnot to match. Extra characters at the end of str are ignored.\n\nmysql> SELECT STR_TO_DATE(\'a09:30:17\',\'a%h:%i:%s\');\n        -> \'09:30:17\'\nmysql> SELECT STR_TO_DATE(\'a09:30:17\',\'%h:%i:%s\');\n        -> NULL\nmysql> SELECT STR_TO_DATE(\'09:30:17a\',\'%h:%i:%s\');\n        -> \'09:30:17\'\n\nUnspecified date or time parts have a value of 0, so incompletely\nspecified values in str produce a result with some or all parts set to\n0:\n\nmysql> SELECT STR_TO_DATE(\'abc\',\'abc\');\n        -> \'0000-00-00\'\nmysql> SELECT STR_TO_DATE(\'9\',\'%m\');\n        -> \'0000-09-00\'\nmysql> SELECT STR_TO_DATE(\'9\',\'%s\');\n        -> \'00:00:09\'\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (386,'Y',10,'Y(p)\n\nReturns the Y-coordinate value for the Point object p as a\ndouble-precision number.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#point-property-functions\n\n','mysql> SELECT Y(POINT(56.7, 53.34));\n+-----------------------+\n| Y(POINT(56.7, 53.34)) |\n+-----------------------+\n|                 53.34 |\n+-----------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#point-property-functions'),
 (387,'SHOW INNODB STATUS',25,'Syntax:\nSHOW INNODB STATUS\n\nIn MySQL 5.0, this is a deprecated synonym for SHOW ENGINE INNODB\nSTATUS. See [HELP SHOW ENGINE]. SHOW INNODB STATUS is removed in MySQL\n5.5.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-innodb-status.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-innodb-status.html'),
 (388,'CHECKSUM TABLE',19,'Syntax:\nCHECKSUM TABLE tbl_name [, tbl_name] ... [ QUICK | EXTENDED ]\n\nCHECKSUM TABLE reports a table checksum.\n\nWith QUICK, the live table checksum is reported if it is available, or\nNULL otherwise. This is very fast. A live checksum is enabled by\nspecifying the CHECKSUM=1 table option when you create the table;\ncurrently, this is supported only for MyISAM tables. See [HELP CREATE\nTABLE].\n\nWith EXTENDED, the entire table is read row by row and the checksum is\ncalculated. This can be very slow for large tables.\n\nIf neither QUICK nor EXTENDED is specified, MySQL returns a live\nchecksum if the table storage engine supports it and scans the table\notherwise.\n\nFor a nonexistent table, CHECKSUM TABLE returns NULL and, as of MySQL\n5.0.3, generates a warning.\n\nThe checksum value depends on the table row format. If the row format\nchanges, the checksum also changes. For example, the storage format for\nVARCHAR changed between MySQL 4.1 and 5.0, so if a 4.1 table is\nupgraded to MySQL 5.0, the checksum value may change.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/checksum-table.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/checksum-table.html'),
 (389,'NUMINTERIORRINGS',2,'NumInteriorRings(poly)\n\nReturns the number of interior rings in the Polygon value poly.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#polygon-property-functions\n\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT NumInteriorRings(GeomFromText(@poly));\n+---------------------------------------+\n| NumInteriorRings(GeomFromText(@poly)) |\n+---------------------------------------+\n|                                     1 |\n+---------------------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#polygon-property-functions'),
 (390,'INTERIORRINGN',2,'InteriorRingN(poly,N)\n\nReturns the N-th interior ring for the Polygon value poly as a\nLineString. Rings are numbered beginning with 1.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#polygon-property-functions\n\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT AsText(InteriorRingN(GeomFromText(@poly),1));\n+----------------------------------------------+\n| AsText(InteriorRingN(GeomFromText(@poly),1)) |\n+----------------------------------------------+\n| LINESTRING(1 1,1 2,2 2,2 1,1 1)              |\n+----------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#polygon-property-functions'),
 (391,'UTC_TIME',30,'Syntax:\nUTC_TIME, UTC_TIME()\n\nReturns the current UTC time as a value in \'HH:MM:SS\' or HHMMSS.uuuuuu\nformat, depending on whether the function is used in a string or\nnumeric context.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT UTC_TIME(), UTC_TIME() + 0;\n        -> \'18:07:53\', 180753.000000\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (392,'DROP FUNCTION',37,'The DROP FUNCTION statement is used to drop stored functions and\nuser-defined functions (UDFs):\n\no For information about dropping stored functions, see [HELP DROP\n  PROCEDURE].\n\no For information about dropping user-defined functions, see [HELP DROP\n  FUNCTION UDF].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/drop-function.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/drop-function.html'),
 (393,'STDDEV',15,'Syntax:\nSTDDEV(expr)\n\nReturns the population standard deviation of expr. This function is\nprovided for compatibility with Oracle. As of MySQL 5.0.3, the standard\nSQL function STDDEV_POP() can be used instead.\n\nThis function returns NULL if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (394,'DATE_SUB',30,'Syntax:\nDATE_SUB(date,INTERVAL expr unit)\n\nSee the description for DATE_ADD().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (395,'PERIOD_ADD',30,'Syntax:\nPERIOD_ADD(P,N)\n\nAdds N months to period P (in the format YYMM or YYYYMM). Returns a\nvalue in the format YYYYMM. Note that the period argument P is not a\ndate value.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT PERIOD_ADD(200801,2);\n        -> 200803\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (396,'|',18,'Syntax:\n|\n\nBitwise OR:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/bit-functions.html\n\n','mysql> SELECT 29 | 15;\n        -> 31\n','http://dev.mysql.com/doc/refman/5.0/en/bit-functions.html'),
 (397,'GEOMFROMTEXT',3,'GeomFromText(wkt[,srid]), GeometryFromText(wkt[,srid])\n\nConstructs a geometry value of any type using its WKT representation\nand SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkt-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkt-functions'),
 (398,'RIGHT',35,'Syntax:\nRIGHT(str,len)\n\nReturns the rightmost len characters from the string str, or NULL if\nany argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT RIGHT(\'foobarbar\', 4);\n        -> \'rbar\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (399,'DATEDIFF',30,'Syntax:\nDATEDIFF(expr1,expr2)\n\nDATEDIFF() returns expr1 - expr2 expressed as a value in days from one\ndate to the other. expr1 and expr2 are date or date-and-time\nexpressions. Only the date parts of the values are used in the\ncalculation.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT DATEDIFF(\'2007-12-31 23:59:59\',\'2007-12-30\');\n        -> 1\nmysql> SELECT DATEDIFF(\'2010-11-30 23:59:59\',\'2010-12-31\');\n        -> -31\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (400,'DROP PROCEDURE',37,'Syntax:\nDROP {PROCEDURE | FUNCTION} [IF EXISTS] sp_name\n\nThis statement is used to drop a stored procedure or function. That is,\nthe specified routine is removed from the server. As of MySQL 5.0.3,\nyou must have the ALTER ROUTINE privilege for the routine. (If the\nautomatic_sp_privileges system variable is enabled, that privilege and\nEXECUTE are granted automatically to the routine creator when the\nroutine is created and dropped from the creator when the routine is\ndropped. See\nhttp://dev.mysql.com/doc/refman/5.0/en/stored-routines-privileges.html.\n)\n\nThe IF EXISTS clause is a MySQL extension. It prevents an error from\noccurring if the procedure or function does not exist. A warning is\nproduced that can be viewed with SHOW WARNINGS.\n\n*Note*: DROP PROCEDURE IF EXISTS and DROP FUNCTION IF EXISTS are not\nwritten to the binary log (and thus not replicated) if the stored\nprocedure or function named in the DROP statement does not exist on the\nmaster. This is a known issue, which is resolved in MySQL 5.1 and\nlater. (Bug #13684)\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/drop-procedure.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/drop-procedure.html'),
 (401,'CHECK TABLE',19,'Syntax:\nCHECK TABLE tbl_name [, tbl_name] ... [option] ...\n\noption = {FOR UPGRADE | QUICK | FAST | MEDIUM | EXTENDED | CHANGED}\n\nCHECK TABLE checks a table or tables for errors. CHECK TABLE works for\nMyISAM, InnoDB, and (as of MySQL 5.0.16) ARCHIVE tables. For MyISAM\ntables, the key statistics are updated as well.\n\nAs of MySQL 5.0.2, CHECK TABLE can also check views for problems, such\nas tables that are referenced in the view definition that no longer\nexist.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/check-table.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/check-table.html'),
 (402,'BIN',35,'Syntax:\nBIN(N)\n\nReturns a string representation of the binary value of N, where N is a\nlonglong (BIGINT) number. This is equivalent to CONV(N,10,2). Returns\nNULL if N is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT BIN(12);\n        -> \'1100\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (403,'DECLARE CURSOR',22,'Syntax:\nDECLARE cursor_name CURSOR FOR select_statement\n\nThis statement declares a cursor and associates it with a SELECT\nstatement that retrieves the rows to be traversed by the cursor. To\nfetch the rows later, use a FETCH statement. The number of columns\nretrieved by the SELECT statement must match the number of output\nvariables specified in the FETCH statement.\n\nThe SELECT statement cannot have an INTO clause.\n\nCursor declarations must appear before handler declarations and after\nvariable and condition declarations.\n\nA stored program may contain multiple cursor declarations, but each\ncursor declared in a given block must have a unique name. For an\nexample, see http://dev.mysql.com/doc/refman/5.0/en/cursors.html.\n\nFor information available through SHOW statements, it is possible in\nmany cases to obtain equivalent information by using a cursor with an\nINFORMATION_SCHEMA table.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/declare-cursor.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/declare-cursor.html'),
 (404,'LOAD DATA',26,'Syntax:\nLOAD DATA [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE \'file_name\'\n    [REPLACE | IGNORE]\n    INTO TABLE tbl_name\n    [CHARACTER SET charset_name]\n    [{FIELDS | COLUMNS}\n        [TERMINATED BY \'string\']\n        [[OPTIONALLY] ENCLOSED BY \'char\']\n        [ESCAPED BY \'char\']\n    ]\n    [LINES\n        [STARTING BY \'string\']\n        [TERMINATED BY \'string\']\n    ]\n    [IGNORE number LINES]\n    [(col_name_or_user_var,...)]\n    [SET col_name = expr,...]\n\nThe LOAD DATA INFILE statement reads rows from a text file into a table\nat a very high speed. The file name must be given as a literal string.\n\nLOAD DATA INFILE is the complement of SELECT ... INTO OUTFILE. (See\nhttp://dev.mysql.com/doc/refman/5.0/en/select-into.html.) To write data\nfrom a table to a file, use SELECT ... INTO OUTFILE. To read the file\nback into a table, use LOAD DATA INFILE. The syntax of the FIELDS and\nLINES clauses is the same for both statements. Both clauses are\noptional, but FIELDS must precede LINES if both are specified.\n\nFor more information about the efficiency of INSERT versus LOAD DATA\nINFILE and speeding up LOAD DATA INFILE, see\nhttp://dev.mysql.com/doc/refman/5.0/en/insert-speed.html.\n\nThe character set indicated by the character_set_database system\nvariable is used to interpret the information in the file. SET NAMES\nand the setting of character_set_client do not affect interpretation of\ninput. If the contents of the input file use a character set that\ndiffers from the default, it is usually preferable to specify the\ncharacter set of the file by using the CHARACTER SET clause, which is\navailable as of MySQL 5.0.38. A character set of binary specifies \"no\nconversion.\"\n\nLOAD DATA INFILE interprets all fields in the file as having the same\ncharacter set, regardless of the data types of the columns into which\nfield values are loaded. For proper interpretation of file contents,\nyou must ensure that it was written with the correct character set. For\nexample, if you write a data file with mysqldump -T or by issuing a\nSELECT ... INTO OUTFILE statement in mysql, be sure to use a\n--default-character-set option with mysqldump or mysql so that output\nis written in the character set to be used when the file is loaded with\nLOAD DATA INFILE.\n\nNote that it is currently not possible to load data files that use the\nucs2 character set.\n\nAs of MySQL 5.0.19, the character_set_filesystem system variable\ncontrols the interpretation of the file name.\n\nYou can also load data files by using the mysqlimport utility; it\noperates by sending a LOAD DATA INFILE statement to the server. The\n--local option causes mysqlimport to read data files from the client\nhost. You can specify the --compress option to get better performance\nover slow networks if the client and server support the compressed\nprotocol. See http://dev.mysql.com/doc/refman/5.0/en/mysqlimport.html.\n\nIf you use LOW_PRIORITY, execution of the LOAD DATA statement is\ndelayed until no other clients are reading from the table. This affects\nonly storage engines that use only table-level locking (such as MyISAM,\nMEMORY, and MERGE).\n\nIf you specify CONCURRENT with a MyISAM table that satisfies the\ncondition for concurrent inserts (that is, it contains no free blocks\nin the middle), other threads can retrieve data from the table while\nLOAD DATA is executing. Using this option affects the performance of\nLOAD DATA a bit, even if no other thread is using the table at the same\ntime.\n\nCONCURRENT is not replicated. See\nhttp://dev.mysql.com/doc/refman/5.0/en/replication-features-load.html,\nfor more information.\n\nThe LOCAL keyword, if specified, is interpreted with respect to the\nclient end of the connection:\n\no If LOCAL is specified, the file is read by the client program on the\n  client host and sent to the server. The file can be given as a full\n  path name to specify its exact location. If given as a relative path\n  name, the name is interpreted relative to the directory in which the\n  client program was started.\n\n  When using LOCAL with LOAD DATA, a copy of the file is created in the\n  server\'s temporary directory. This is not the directory determined by\n  the value of tmpdir or slave_load_tmpdir, but rather the operating\n  system\'s temporary directory, and is not configurable in the MySQL\n  Server. (Typically the system temporary directory is /tmp on Linux\n  systems and C:\\WINDOWS\\TEMP on Windows.) Lack of sufficient space for\n  the copy in this directory can cause the LOAD DATA LOCAL statement to\n  fail.\n\no If LOCAL is not specified, the file must be located on the server\n  host and is read directly by the server. The server uses the\n  following rules to locate the file:\n\n  o If the file name is an absolute path name, the server uses it as\n    given.\n\n  o If the file name is a relative path name with one or more leading\n    components, the server searches for the file relative to the\n    server\'s data directory.\n\n  o If a file name with no leading components is given, the server\n    looks for the file in the database directory of the default\n    database.\n\nNote that, in the non-LOCAL case, these rules mean that a file named as\n./myfile.txt is read from the server\'s data directory, whereas the file\nnamed as myfile.txt is read from the database directory of the default\ndatabase. For example, if db1 is the default database, the following\nLOAD DATA statement reads the file data.txt from the database directory\nfor db1, even though the statement explicitly loads the file into a\ntable in the db2 database:\n\nLOAD DATA INFILE \'data.txt\' INTO TABLE db2.my_table;\n\nWindows path names are specified using forward slashes rather than\nbackslashes. If you do use backslashes, you must double them.\n\nFor security reasons, when reading text files located on the server,\nthe files must either reside in the database directory or be readable\nby all. Also, to use LOAD DATA INFILE on server files, you must have\nthe FILE privilege. See\nhttp://dev.mysql.com/doc/refman/5.0/en/privileges-provided.html. For\nnon-LOCAL load operations, if the secure_file_priv system variable is\nset to a nonempty directory name, the file to be loaded must be located\nin that directory.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/load-data.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/load-data.html'),
 (405,'MULTILINESTRING',23,'MultiLineString(ls1,ls2,...)\n\nConstructs a MultiLineString value using LineString or WKB LineString\narguments.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-mysql-specific-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-mysql-specific-functions');
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (406,'LOCALTIME',30,'Syntax:\nLOCALTIME, LOCALTIME()\n\nLOCALTIME and LOCALTIME() are synonyms for NOW().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (407,'MPOINTFROMTEXT',3,'MPointFromText(wkt[,srid]), MultiPointFromText(wkt[,srid])\n\nConstructs a MULTIPOINT value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkt-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkt-functions'),
 (408,'BLOB',21,'BLOB[(M)]\n\nA BLOB column with a maximum length of 65,535 (216 - 1) bytes. Each\nBLOB value is stored using a two-byte length prefix that indicates the\nnumber of bytes in the value.\n\nAn optional length M can be given for this type. If this is done, MySQL\ncreates the column as the smallest BLOB type large enough to hold\nvalues M bytes long.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html'),
 (409,'SHA1',11,'Syntax:\nSHA1(str), SHA(str)\n\nCalculates an SHA-1 160-bit checksum for the string, as described in\nRFC 3174 (Secure Hash Algorithm). The value is returned as a binary\nstring of 40 hex digits, or NULL if the argument was NULL. One of the\npossible uses for this function is as a hash key. See the notes at the\nbeginning of this section about storing hash values efficiently. You\ncan also use SHA1() as a cryptographic function for storing passwords.\nSHA() is synonymous with SHA1().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html\n\n','mysql> SELECT SHA1(\'abc\');\n        -> \'a9993e364706816aba3e25717850c26c9cd0d89d\'\n','http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html'),
 (410,'SUBSTR',35,'Syntax:\nSUBSTR(str,pos), SUBSTR(str FROM pos), SUBSTR(str,pos,len), SUBSTR(str\nFROM pos FOR len)\n\nSUBSTR() is a synonym for SUBSTRING().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (411,'PASSWORD',11,'Syntax:\nPASSWORD(str)\n\nCalculates and returns a password string from the plaintext password\nstr and returns a binary string, or NULL if the argument was NULL. This\nis the function that is used for encrypting MySQL passwords for storage\nin the Password column of the user grant table.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html\n\n','mysql> SELECT PASSWORD(\'badpwd\');\n        -> \'*AAB3E285149C0135D51A520E1940DD3263DC008C\'\n','http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html'),
 (412,'CHAR',21,'[NATIONAL] CHAR[(M)] [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA fixed-length string that is always right-padded with spaces to the\nspecified length when stored. M represents the column length in\ncharacters. The range of M is 0 to 255. If M is omitted, the length is\n1.\n\n*Note*: Trailing spaces are removed when CHAR values are retrieved.\n\nBefore MySQL 5.0.3, a CHAR column with a length specification greater\nthan 255 is converted to the smallest TEXT type that can hold values of\nthe given length. For example, CHAR(500) is converted to TEXT, and\nCHAR(200000) is converted to MEDIUMTEXT. However, this conversion\ncauses the column to become a variable-length column, and also affects\ntrailing-space removal.\n\nIn MySQL 5.0.3 and later, a CHAR length greater than 255 is illegal and\nfails with an error:\n\nmysql> CREATE TABLE c1 (col1 INT, col2 CHAR(500));\nERROR 1074 (42000): Column length too big for column \'col\' (max = 255);\nuse BLOB or TEXT instead\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html'),
 (413,'UTC_DATE',30,'Syntax:\nUTC_DATE, UTC_DATE()\n\nReturns the current UTC date as a value in \'YYYY-MM-DD\' or YYYYMMDD\nformat, depending on whether the function is used in a string or\nnumeric context.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT UTC_DATE(), UTC_DATE() + 0;\n        -> \'2003-08-14\', 20030814\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (414,'DIMENSION',34,'Dimension(g)\n\nReturns the inherent dimension of the geometry value g. The result can\nbe -1, 0, 1, or 2. The meaning of these values is given in\nhttp://dev.mysql.com/doc/refman/5.0/en/gis-class-geometry.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#general-geometry-property-functions\n\n','mysql> SELECT Dimension(GeomFromText(\'LineString(1 1,2 2)\'));\n+------------------------------------------------+\n| Dimension(GeomFromText(\'LineString(1 1,2 2)\')) |\n+------------------------------------------------+\n|                                              1 |\n+------------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#general-geometry-property-functions'),
 (415,'COUNT DISTINCT',15,'Syntax:\nCOUNT(DISTINCT expr,[expr...])\n\nReturns a count of the number of rows with different non-NULL expr\nvalues.\n\nCOUNT(DISTINCT) returns 0 if there were no matching rows.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html\n\n','mysql> SELECT COUNT(DISTINCT results) FROM student;\n','http://dev.mysql.com/doc/refman/5.0/en/group-by-functions.html'),
 (416,'BIT',21,'BIT[(M)]\n\nA bit-field type. M indicates the number of bits per value, from 1 to\n64. The default is 1 if M is omitted.\n\nThis data type was added in MySQL 5.0.3 for MyISAM, and extended in\n5.0.5 to MEMORY, InnoDB, BDB, and NDBCLUSTER. Before 5.0.3, BIT is a\nsynonym for TINYINT(1).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html'),
 (417,'EQUALS',29,'Equals(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially equal to g2.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-test-spatial-relationships-between-geometries\n\n','','http://dev.mysql.com/doc/refman/5.0/en/functions-for-testing-spatial-relations-between-geometric-objects.html#functions-that-tes'),
 (418,'SHOW CREATE VIEW',25,'Syntax:\nSHOW CREATE VIEW view_name\n\nThis statement shows a CREATE VIEW statement that creates the given\nview.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-create-view.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-create-view.html'),
 (419,'INTERVAL',17,'Syntax:\nINTERVAL(N,N1,N2,N3,...)\n\nReturns 0 if N < N1, 1 if N < N2 and so on or -1 if N is NULL. All\narguments are treated as integers. It is required that N1 < N2 < N3 <\n... < Nn for this function to work correctly. This is because a binary\nsearch is used (very fast).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT INTERVAL(23, 1, 15, 17, 30, 44, 200);\n        -> 3\nmysql> SELECT INTERVAL(10, 1, 10, 100, 1000);\n        -> 2\nmysql> SELECT INTERVAL(22, 23, 30, 44, 200);\n        -> 0\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (420,'FROM_DAYS',30,'Syntax:\nFROM_DAYS(N)\n\nGiven a day number N, returns a DATE value.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT FROM_DAYS(730669);\n        -> \'2007-07-03\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (421,'ALTER PROCEDURE',37,'Syntax:\nALTER PROCEDURE proc_name [characteristic ...]\n\ncharacteristic:\n    COMMENT \'string\'\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n\nThis statement can be used to change the characteristics of a stored\nprocedure. More than one change may be specified in an ALTER PROCEDURE\nstatement. However, you cannot change the parameters or body of a\nstored procedure using this statement; to make such changes, you must\ndrop and re-create the procedure using DROP PROCEDURE and CREATE\nPROCEDURE.\n\nAs of MySQL 5.0.3, you must have the ALTER ROUTINE privilege for the\nprocedure. By default, that privilege is granted automatically to the\nprocedure creator. This behavior can be changed by disabling the\nautomatic_sp_privileges system variable. See\nhttp://dev.mysql.com/doc/refman/5.0/en/stored-routines-privileges.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/alter-procedure.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/alter-procedure.html'),
 (422,'BIT_COUNT',18,'Syntax:\nBIT_COUNT(N)\n\nReturns the number of bits that are set in the argument N.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/bit-functions.html\n\n','mysql> SELECT BIT_COUNT(29), BIT_COUNT(b\'101010\');\n        -> 4, 3\n','http://dev.mysql.com/doc/refman/5.0/en/bit-functions.html'),
 (423,'OCTET_LENGTH',35,'Syntax:\nOCTET_LENGTH(str)\n\nOCTET_LENGTH() is a synonym for LENGTH().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (424,'UTC_TIMESTAMP',30,'Syntax:\nUTC_TIMESTAMP, UTC_TIMESTAMP()\n\nReturns the current UTC date and time as a value in \'YYYY-MM-DD\nHH:MM:SS\' or YYYYMMDDHHMMSS.uuuuuu format, depending on whether the\nfunction is used in a string or numeric context.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT UTC_TIMESTAMP(), UTC_TIMESTAMP() + 0;\n        -> \'2003-08-14 18:08:04\', 20030814180804.000000\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (425,'AES_ENCRYPT',11,'Syntax:\nAES_ENCRYPT(str,key_str)\n\nAES_ENCRYPT() and AES_DECRYPT() enable encryption and decryption of\ndata using the official AES (Advanced Encryption Standard) algorithm,\npreviously known as \"Rijndael.\" Encoding with a 128-bit key length is\nused, but you can extend it up to 256 bits by modifying the source. We\nchose 128 bits because it is much faster and it is secure enough for\nmost purposes.\n\nAES_ENCRYPT() encrypts a string and returns a binary string.\nAES_DECRYPT() decrypts the encrypted string and returns the original\nstring. The input arguments may be any length. If either argument is\nNULL, the result of this function is also NULL.\n\nBecause AES is a block-level algorithm, padding is used to encode\nuneven length strings and so the result string length may be calculated\nusing this formula:\n\n16 * (trunc(string_length / 16) + 1)\n\nIf AES_DECRYPT() detects invalid data or incorrect padding, it returns\nNULL. However, it is possible for AES_DECRYPT() to return a non-NULL\nvalue (possibly garbage) if the input data or the key is invalid.\n\nYou can use the AES functions to store data in an encrypted form by\nmodifying your queries:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html\n\n','INSERT INTO t VALUES (1,AES_ENCRYPT(\'text\',\'password\'));\n','http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html'),
 (426,'+',4,'Syntax:\n+\n\nAddition:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/arithmetic-functions.html\n\n','mysql> SELECT 3+5;\n        -> 8\n','http://dev.mysql.com/doc/refman/5.0/en/arithmetic-functions.html'),
 (427,'INET_NTOA',14,'Syntax:\nINET_NTOA(expr)\n\nGiven a numeric IPv4 network address in network byte order, returns the\ndotted-quad representation of the address as a binary string.\nINET_NTOA() returns NULL if it does not understand its argument.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html\n\n','mysql> SELECT INET_NTOA(167773449);\n        -> \'10.0.5.9\'\n','http://dev.mysql.com/doc/refman/5.0/en/miscellaneous-functions.html'),
 (428,'ACOS',4,'Syntax:\nACOS(X)\n\nReturns the arc cosine of X, that is, the value whose cosine is X.\nReturns NULL if X is not in the range -1 to 1.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT ACOS(1);\n        -> 0\nmysql> SELECT ACOS(1.0001);\n        -> NULL\nmysql> SELECT ACOS(0);\n        -> 1.5707963267949\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (429,'ISOLATION',7,'Syntax:\nSET [GLOBAL | SESSION] TRANSACTION ISOLATION LEVEL\n  {\n       READ UNCOMMITTED\n     | READ COMMITTED\n     | REPEATABLE READ\n     | SERIALIZABLE\n   }\n\nThis statement sets the transaction isolation level globally, for the\ncurrent session, or for the next transaction:\n\no With the GLOBAL keyword, the statement sets the default transaction\n  level globally for all subsequent sessions. Existing sessions are\n  unaffected.\n\no With the SESSION keyword, the statement sets the default transaction\n  level for all subsequent transactions performed within the current\n  session.\n\no Without any SESSION or GLOBAL keyword, the statement sets the\n  isolation level for the next (not started) transaction performed\n  within the current session.\n\nA change to the global default isolation level requires the SUPER\nprivilege. Any session is free to change its session isolation level\n(even in the middle of a transaction), or the isolation level for its\nnext transaction.\n\nTo set the global default isolation level at server startup, use the\n--transaction-isolation=level option to mysqld on the command line or\nin an option file. Values of level for this option use dashes rather\nthan spaces, so the permissible values are READ-UNCOMMITTED,\nREAD-COMMITTED, REPEATABLE-READ, or SERIALIZABLE. For example, to set\nthe default isolation level to REPEATABLE READ, use these lines in the\n[mysqld] section of an option file:\n\n[mysqld]\ntransaction-isolation = REPEATABLE-READ\n\nTo determine the global and session transaction isolation levels at\nruntime, check the value of the tx_isolation system variable:\n\nSELECT @@GLOBAL.tx_isolation, @@tx_isolation;\n\nInnoDB supports each of the transaction isolation levels described here\nusing different locking strategies. The default level is REPEATABLE\nREAD. For additional information about InnoDB record-level locks and\nhow it uses them to execute various types of statements, see\nhttp://dev.mysql.com/doc/refman/5.0/en/innodb-record-level-locks.html,\nand http://dev.mysql.com/doc/refman/5.0/en/innodb-locks-set.html.\n\nThe following list describes how MySQL supports the different\ntransaction levels:\n\no READ UNCOMMITTED\n\n  SELECT statements are performed in a nonlocking fashion, but a\n  possible earlier version of a row might be used. Thus, using this\n  isolation level, such reads are not consistent. This is also called a\n  \"dirty read.\" Otherwise, this isolation level works like READ\n  COMMITTED.\n\no READ COMMITTED\n\n  A somewhat Oracle-like isolation level with respect to consistent\n  (nonlocking) reads: Each consistent read, even within the same\n  transaction, sets and reads its own fresh snapshot. See\n  http://dev.mysql.com/doc/refman/5.0/en/innodb-consistent-read.html.\n\n  For locking reads (SELECT with FOR UPDATE or LOCK IN SHARE MODE),\n  InnoDB locks only index records, not the gaps before them, and thus\n  permits the free insertion of new records next to locked records. For\n  UPDATE and DELETE statements, locking depends on whether the\n  statement uses a unique index with a unique search condition (such as\n  WHERE id = 100), or a range-type search condition (such as WHERE id >\n  100). For a unique index with a unique search condition, InnoDB locks\n  only the index record found, not the gap before it. For range-type\n  searches, InnoDB locks the index range scanned, using gap locks or\n  next-key (gap plus index-record) locks to block insertions by other\n  sessions into the gaps covered by the range. This is necessary\n  because \"phantom rows\" must be blocked for MySQL replication and\n  recovery to work.\n\no REPEATABLE READ\n\n  This is the default isolation level for InnoDB. For consistent reads,\n  there is an important difference from the READ COMMITTED isolation\n  level: All consistent reads within the same transaction read the\n  snapshot established by the first read. This convention means that if\n  you issue several plain (nonlocking) SELECT statements within the\n  same transaction, these SELECT statements are consistent also with\n  respect to each other. See\n  http://dev.mysql.com/doc/refman/5.0/en/innodb-consistent-read.html.\n\n  For locking reads (SELECT with FOR UPDATE or LOCK IN SHARE MODE),\n  UPDATE, and DELETE statements, locking depends on whether the\n  statement uses a unique index with a unique search condition, or a\n  range-type search condition. For a unique index with a unique search\n  condition, InnoDB locks only the index record found, not the gap\n  before it. For other search conditions, InnoDB locks the index range\n  scanned, using gap locks or next-key (gap plus index-record) locks to\n  block insertions by other sessions into the gaps covered by the\n  range.\n\no SERIALIZABLE\n\n  This level is like REPEATABLE READ, but InnoDB implicitly converts\n  all plain SELECT statements to SELECT ... LOCK IN SHARE MODE if\n  autocommit is disabled. If autocommit is enabled, the SELECT is its\n  own transaction. It therefore is known to be read only and can be\n  serialized if performed as a consistent (nonlocking) read and need\n  not block for other transactions. (This means that to force a plain\n  SELECT to block if other transactions have modified the selected\n  rows, you should disable autocommit.)\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/set-transaction.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/set-transaction.html'),
 (430,'CEILING',4,'Syntax:\nCEILING(X)\n\nReturns the smallest integer value not less than X.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT CEILING(1.23);\n        -> 2\nmysql> SELECT CEILING(-1.23);\n        -> -1\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (431,'SIN',4,'Syntax:\nSIN(X)\n\nReturns the sine of X, where X is given in radians.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT SIN(PI());\n        -> 1.2246063538224e-16\nmysql> SELECT ROUND(SIN(PI()));\n        -> 0\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (432,'DAYOFWEEK',30,'Syntax:\nDAYOFWEEK(date)\n\nReturns the weekday index for date (1 = Sunday, 2 = Monday, ..., 7 =\nSaturday). These index values correspond to the ODBC standard.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT DAYOFWEEK(\'2007-02-03\');\n        -> 7\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (433,'SHOW PROCESSLIST',25,'Syntax:\nSHOW [FULL] PROCESSLIST\n\nSHOW PROCESSLIST shows you which threads are running. You can also get\nthis information using the mysqladmin processlist command. If you have\nthe PROCESS privilege, you can see all threads. Otherwise, you can see\nonly your own threads (that is, threads associated with the MySQL\naccount that you are using). If you do not use the FULL keyword, only\nthe first 100 characters of each statement are shown in the Info field.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-processlist.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-processlist.html'),
 (434,'LINEFROMWKB',31,'LineFromWKB(wkb[,srid]), LineStringFromWKB(wkb[,srid])\n\nConstructs a LINESTRING value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkb-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkb-functions'),
 (435,'GEOMETRYTYPE',34,'GeometryType(g)\n\nReturns as a binary string the name of the geometry type of which the\ngeometry instance g is a member. The name corresponds to one of the\ninstantiable Geometry subclasses.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#general-geometry-property-functions\n\n','mysql> SELECT GeometryType(GeomFromText(\'POINT(1 1)\'));\n+------------------------------------------+\n| GeometryType(GeomFromText(\'POINT(1 1)\')) |\n+------------------------------------------+\n| POINT                                    |\n+------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#general-geometry-property-functions'),
 (436,'CREATE VIEW',37,'Syntax:\nCREATE\n    [OR REPLACE]\n    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    [DEFINER = { user | CURRENT_USER }]\n    [SQL SECURITY { DEFINER | INVOKER }]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]\n\nThe CREATE VIEW statement creates a new view, or replaces an existing\none if the OR REPLACE clause is given. This statement was added in\nMySQL 5.0.1. If the view does not exist, CREATE OR REPLACE VIEW is the\nsame as CREATE VIEW. If the view does exist, CREATE OR REPLACE VIEW is\nthe same as ALTER VIEW.\n\nThe select_statement is a SELECT statement that provides the definition\nof the view. (When you select from the view, you select in effect using\nthe SELECT statement.) select_statement can select from base tables or\nother views.\n\nThe view definition is \"frozen\" at creation time, so changes to the\nunderlying tables afterward do not affect the view definition. For\nexample, if a view is defined as SELECT * on a table, new columns added\nto the table later do not become part of the view.\n\nThe ALGORITHM clause affects how MySQL processes the view. The DEFINER\nand SQL SECURITY clauses specify the security context to be used when\nchecking access privileges at view invocation time. The WITH CHECK\nOPTION clause can be given to constrain inserts or updates to rows in\ntables referenced by the view. These clauses are described later in\nthis section.\n\nThe CREATE VIEW statement requires the CREATE VIEW privilege for the\nview, and some privilege for each column selected by the SELECT\nstatement. For columns used elsewhere in the SELECT statement you must\nhave the SELECT privilege. If the OR REPLACE clause is present, you\nmust also have the DROP privilege for the view. CREATE VIEW might also\nrequire the SUPER privilege, depending on the DEFINER value, as\ndescribed later in this section.\n\nWhen a view is referenced, privilege checking occurs as described later\nin this section.\n\nA view belongs to a database. By default, a new view is created in the\ndefault database. To create the view explicitly in a given database,\nspecify the name as db_name.view_name when you create it:\n\nmysql> CREATE VIEW test.v AS SELECT * FROM t;\n\nWithin a database, base tables and views share the same namespace, so a\nbase table and a view cannot have the same name.\n\nColumns retrieved by the SELECT statement can be simple references to\ntable columns. They can also be expressions that use functions,\nconstant values, operators, and so forth.\n\nViews must have unique column names with no duplicates, just like base\ntables. By default, the names of the columns retrieved by the SELECT\nstatement are used for the view column names. To define explicit names\nfor the view columns, the optional column_list clause can be given as a\nlist of comma-separated identifiers. The number of names in column_list\nmust be the same as the number of columns retrieved by the SELECT\nstatement.\n\n*Note*: Prior to MySQL 5.0.72, when you modify an existing view, the\nserver saves a backup of the current view definition under the view\ndatabase directory, in a subdirectory named arc. The backup file for a\nview v is named v.frm-00001. If you alter the view again, the next\nbackup is named v.frm-00002. The three latest view backup definitions\nare stored. Backed up view definitions are not preserved by mysqldump,\nor any other such programs, but you can retain them using a file copy\noperation. However, they are not needed for anything but to provide you\nwith a backup of your previous view definition. It is safe to remove\nthese backup definitions, but only while mysqld is not running. If you\ndelete the arc subdirectory or its files while mysqld is running, an\nerror occurs the next time you try to alter the view: mysql> ALTER VIEW\nv AS SELECT * FROM t; ERROR 6 (HY000): Error on delete of\n\'.\\test\\arc/v.frm-0004\' (Errcode: 2)\n\nUnqualified table or view names in the SELECT statement are interpreted\nwith respect to the default database. A view can refer to tables or\nviews in other databases by qualifying the table or view name with the\nproper database name.\n\nA view can be created from many kinds of SELECT statements. It can\nrefer to base tables or other views. It can use joins, UNION, and\nsubqueries. The SELECT need not even refer to any tables. The following\nexample defines a view that selects two columns from another table, as\nwell as an expression calculated from those columns:\n\nmysql> CREATE TABLE t (qty INT, price INT);\nmysql> INSERT INTO t VALUES(3, 50);\nmysql> CREATE VIEW v AS SELECT qty, price, qty*price AS value FROM t;\nmysql> SELECT * FROM v;\n+------+-------+-------+\n| qty  | price | value |\n+------+-------+-------+\n|    3 |    50 |   150 |\n+------+-------+-------+\n\nA view definition is subject to the following restrictions:\n\no The SELECT statement cannot contain a subquery in the FROM clause.\n\no The SELECT statement cannot refer to system or user variables.\n\no Within a stored program, the definition cannot refer to program\n  parameters or local variables.\n\no The SELECT statement cannot refer to prepared statement parameters.\n\no Any table or view referred to in the definition must exist. However,\n  after a view has been created, it is possible to drop a table or view\n  that the definition refers to. In this case, use of the view results\n  in an error. To check a view definition for problems of this kind,\n  use the CHECK TABLE statement.\n\no The definition cannot refer to a TEMPORARY table, and you cannot\n  create a TEMPORARY view.\n\no Any tables named in the view definition must exist at definition\n  time.\n\no You cannot associate a trigger with a view.\n\no As of MySQL 5.0.52, aliases for column names in the SELECT statement\n  are checked against the maximum column length of 64 characters (not\n  the maximum alias length of 256 characters).\n\nORDER BY is permitted in a view definition, but it is ignored if you\nselect from a view using a statement that has its own ORDER BY.\n\nFor other options or clauses in the definition, they are added to the\noptions or clauses of the statement that references the view, but the\neffect is undefined. For example, if a view definition includes a LIMIT\nclause, and you select from the view using a statement that has its own\nLIMIT clause, it is undefined which limit applies. This same principle\napplies to options such as ALL, DISTINCT, or SQL_SMALL_RESULT that\nfollow the SELECT keyword, and to clauses such as INTO, FOR UPDATE,\nLOCK IN SHARE MODE, and PROCEDURE.\n\nIf you create a view and then change the query processing environment\nby changing system variables, that may affect the results that you get\nfrom the view:\n\nmysql> CREATE VIEW v (mycol) AS SELECT \'abc\';\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SET sql_mode = \'\';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT \"mycol\" FROM v;\n+-------+\n| mycol |\n+-------+\n| mycol |\n+-------+\n1 row in set (0.01 sec)\n\nmysql> SET sql_mode = \'ANSI_QUOTES\';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT \"mycol\" FROM v;\n+-------+\n| mycol |\n+-------+\n| abc   |\n+-------+\n1 row in set (0.00 sec)\n\nThe DEFINER and SQL SECURITY clauses determine which MySQL account to\nuse when checking access privileges for the view when a statement is\nexecuted that references the view. These clauses were addded in MySQL\n5.0.13, but have no effect until MySQL 5.0.16. The legal SQL SECURITY\ncharacteristic values are DEFINER and INVOKER. These indicate that the\nrequired privileges must be held by the user who defined or invoked the\nview, respectively. The default SQL SECURITY value is DEFINER.\n\nIf a user value is given for the DEFINER clause, it should be a MySQL\naccount specified as \'user_name\'@\'host_name\' (the same format used in\nthe GRANT statement), CURRENT_USER, or CURRENT_USER(). The default\nDEFINER value is the user who executes the CREATE VIEW statement. This\nis the same as specifying DEFINER = CURRENT_USER explicitly.\n\nIf you specify the DEFINER clause, these rules determine the legal\nDEFINER user values:\n\no If you do not have the SUPER privilege, the only legal user value is\n  your own account, either specified literally or by using\n  CURRENT_USER. You cannot set the definer to some other account.\n\no If you have the SUPER privilege, you can specify any syntactically\n  legal account name. If the account does not actually exist, a warning\n  is generated.\n\no Although it is possible to create a view with a nonexistent DEFINER\n  account, an error occurs when the view is referenced if the SQL\n  SECURITY value is DEFINER but the definer account does not exist.\n\nFor more information about view security, see\nhttp://dev.mysql.com/doc/refman/5.0/en/stored-programs-security.html.\n\nWithin a view definition, CURRENT_USER returns the view\'s DEFINER value\nby default as of MySQL 5.0.24. For older versions, and for views\ndefined with the SQL SECURITY INVOKER characteristic, CURRENT_USER\nreturns the account for the view\'s invoker. For information about user\nauditing within views, see\nhttp://dev.mysql.com/doc/refman/5.0/en/account-activity-auditing.html.\n\nWithin a stored routine that is defined with the SQL SECURITY DEFINER\ncharacteristic, CURRENT_USER returns the routine\'s DEFINER value. This\nalso affects a view defined within such a routine, if the view\ndefinition contains a DEFINER value of CURRENT_USER.\n\nAs of MySQL 5.0.16 (when the DEFINER and SQL SECURITY clauses were\nimplemented), view privileges are checked like this:\n\no At view definition time, the view creator must have the privileges\n  needed to use the top-level objects accessed by the view. For\n  example, if the view definition refers to table columns, the creator\n  must have some privilege for each column in the select list of the\n  definition, and the SELECT privilege for each column used elsewhere\n  in the definition. If the definition refers to a stored function,\n  only the privileges needed to invoke the function can be checked. The\n  privileges required at function invocation time can be checked only\n  as it executes: For different invocations, different execution paths\n  within the function might be taken.\n\no The user who references a view must have appropriate privileges to\n  access it (SELECT to select from it, INSERT to insert into it, and so\n  forth.)\n\no When a view has been referenced, privileges for objects accessed by\n  the view are checked against the privileges held by the view DEFINER\n  account or invoker, depending on whether the SQL SECURITY\n  characteristic is DEFINER or INVOKER, respectively.\n\no If reference to a view causes execution of a stored function,\n  privilege checking for statements executed within the function depend\n  on whether the function SQL SECURITY characteristic is DEFINER or\n  INVOKER. If the security characteristic is DEFINER, the function runs\n  with the privileges of the DEFINER account. If the characteristic is\n  INVOKER, the function runs with the privileges determined by the\n  view\'s SQL SECURITY characteristic.\n\nPrior to MySQL 5.0.16 (before the DEFINER and SQL SECURITY clauses were\nimplemented), privileges required for objects used in a view are\nchecked at view creation time.\n\nExample: A view might depend on a stored function, and that function\nmight invoke other stored routines. For example, the following view\ninvokes a stored function f():\n\nCREATE VIEW v AS SELECT * FROM t WHERE t.id = f(t.name);\n\nSuppose that f() contains a statement such as this:\n\nIF name IS NULL then\n  CALL p1();\nELSE\n  CALL p2();\nEND IF;\n\nThe privileges required for executing statements within f() need to be\nchecked when f() executes. This might mean that privileges are needed\nfor p1() or p2(), depending on the execution path within f(). Those\nprivileges must be checked at runtime, and the user who must possess\nthe privileges is determined by the SQL SECURITY values of the view v\nand the function f().\n\nThe DEFINER and SQL SECURITY clauses for views are extensions to\nstandard SQL. In standard SQL, views are handled using the rules for\nSQL SECURITY DEFINER. The standard says that the definer of the view,\nwhich is the same as the owner of the view\'s schema, gets applicable\nprivileges on the view (for example, SELECT) and may grant them. MySQL\nhas no concept of a schema \"owner\", so MySQL adds a clause to identify\nthe definer. The DEFINER clause is an extension where the intent is to\nhave what the standard has; that is, a permanent record of who defined\nthe view. This is why the default DEFINER value is the account of the\nview creator.\n\nIf you invoke a view that was created before MySQL 5.0.13, it is\ntreated as though it was created with a SQL SECURITY DEFINER\ncharacteristic and with a DEFINER value that is the same as your\naccount. However, because the actual definer is unknown, MySQL issues a\nwarning. To eliminate the warning, it is sufficient to re-create the\nview so that the view definition includes a DEFINER clause.\n\nThe optional ALGORITHM clause is a MySQL extension to standard SQL. It\naffects how MySQL processes the view. ALGORITHM takes three values:\nMERGE, TEMPTABLE, or UNDEFINED. The default algorithm is UNDEFINED if\nno ALGORITHM clause is present. For more information, see\nhttp://dev.mysql.com/doc/refman/5.0/en/view-algorithms.html.\n\nSome views are updatable. That is, you can use them in statements such\nas UPDATE, DELETE, or INSERT to update the contents of the underlying\ntable. For a view to be updatable, there must be a one-to-one\nrelationship between the rows in the view and the rows in the\nunderlying table. There are also certain other constructs that make a\nview nonupdatable.\n\nThe WITH CHECK OPTION clause can be given for an updatable view to\nprevent inserts or updates to rows except those for which the WHERE\nclause in the select_statement is true. The WITH CHECK OPTION clause\nwas implemented in MySQL 5.0.2.\n\nIn a WITH CHECK OPTION clause for an updatable view, the LOCAL and\nCASCADED keywords determine the scope of check testing when the view is\ndefined in terms of another view. The LOCAL keyword restricts the CHECK\nOPTION only to the view being defined. CASCADED causes the checks for\nunderlying views to be evaluated as well. When neither keyword is\ngiven, the default is CASCADED.\n\nFor more information about updatable views and the WITH CHECK OPTION\nclause, see\nhttp://dev.mysql.com/doc/refman/5.0/en/view-updatability.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/create-view.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/create-view.html'),
 (437,'TRIM',35,'Syntax:\nTRIM([{BOTH | LEADING | TRAILING} [remstr] FROM] str), TRIM([remstr\nFROM] str)\n\nReturns the string str with all remstr prefixes or suffixes removed. If\nnone of the specifiers BOTH, LEADING, or TRAILING is given, BOTH is\nassumed. remstr is optional and, if not specified, spaces are removed.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT TRIM(\'  bar   \');\n        -> \'bar\'\nmysql> SELECT TRIM(LEADING \'x\' FROM \'xxxbarxxx\');\n        -> \'barxxx\'\nmysql> SELECT TRIM(BOTH \'x\' FROM \'xxxbarxxx\');\n        -> \'bar\'\nmysql> SELECT TRIM(TRAILING \'xyz\' FROM \'barxxyz\');\n        -> \'barx\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (438,'IS',17,'Syntax:\nIS boolean_value\n\nTests a value against a boolean value, where boolean_value can be TRUE,\nFALSE, or UNKNOWN.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT 1 IS TRUE, 0 IS FALSE, NULL IS UNKNOWN;\n        -> 1, 1, 1\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (439,'GET_FORMAT',30,'Syntax:\nGET_FORMAT({DATE|TIME|DATETIME}, {\'EUR\'|\'USA\'|\'JIS\'|\'ISO\'|\'INTERNAL\'})\n\nReturns a format string. This function is useful in combination with\nthe DATE_FORMAT() and the STR_TO_DATE() functions.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT DATE_FORMAT(\'2003-10-03\',GET_FORMAT(DATE,\'EUR\'));\n        -> \'03.10.2003\'\nmysql> SELECT STR_TO_DATE(\'10.31.2003\',GET_FORMAT(DATE,\'USA\'));\n        -> \'2003-10-31\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (440,'TINYBLOB',21,'TINYBLOB\n\nA BLOB column with a maximum length of 255 (28 - 1) bytes. Each\nTINYBLOB value is stored using a one-byte length prefix that indicates\nthe number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html'),
 (441,'SAVEPOINT',7,'Syntax:\nSAVEPOINT identifier\nROLLBACK [WORK] TO [SAVEPOINT] identifier\nRELEASE SAVEPOINT identifier\n\nInnoDB supports the SQL statements SAVEPOINT and ROLLBACK TO SAVEPOINT.\nStarting from MySQL 5.0.3, RELEASE SAVEPOINT and the optional WORK\nkeyword for ROLLBACK are supported as well.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/savepoint.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/savepoint.html'),
 (442,'USER',16,'Syntax:\nUSER()\n\nReturns the current MySQL user name and host name as a string in the\nutf8 character set.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/information-functions.html\n\n','mysql> SELECT USER();\n        -> \'davida@localhost\'\n','http://dev.mysql.com/doc/refman/5.0/en/information-functions.html'),
 (443,'LABELS',22,'Syntax:\n[begin_label:] BEGIN\n    [statement_list]\nEND [end_label]\n\n[begin_label:] LOOP\n    statement_list\nEND LOOP [end_label]\n\n[begin_label:] REPEAT\n    statement_list\nUNTIL search_condition\nEND REPEAT [end_label]\n\n[begin_label:] WHILE search_condition DO\n    statement_list\nEND WHILE [end_label]\n\nLabels are permitted for BEGIN ... END blocks and for the LOOP, REPEAT,\nand WHILE statements. Label use for those statements follows these\nrules:\n\no begin_label must be followed by a colon.\n\no begin_label can be given without end_label. If end_label is present,\n  it must be the same as begin_label.\n\no end_label cannot be given without begin_label.\n\no Labels at the same nesting level must be distinct.\n\no Labels can be up to 16 characters long.\n\nTo refer to a label within the labeled construct, use an ITERATE or\nLEAVE statement. The following example uses those statements to\ncontinue iterating or terminate the loop:\n\nCREATE PROCEDURE doiterate(p1 INT)\nBEGIN\n  label1: LOOP\n    SET p1 = p1 + 1;\n    IF p1 < 10 THEN ITERATE label1; END IF;\n    LEAVE label1;\n  END LOOP label1;\nEND;\n\nThe scope of a block label does not include the code for handlers\ndeclared within the block. For details, see [HELP DECLARE HANDLER].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/statement-labels.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/statement-labels.html'),
 (444,'ALTER TABLE',37,'Syntax:\nALTER [IGNORE] TABLE tbl_name\n    [alter_specification [, alter_specification] ...]\n\nalter_specification:\n    table_options\n  | ADD [COLUMN] col_name column_definition\n        [FIRST | AFTER col_name ]\n  | ADD [COLUMN] (col_name column_definition,...)\n  | ADD {INDEX|KEY} [index_name]\n        [index_type] (index_col_name,...) [index_type]\n  | ADD [CONSTRAINT [symbol]] PRIMARY KEY\n        [index_type] (index_col_name,...) [index_type]\n  | ADD [CONSTRAINT [symbol]]\n        UNIQUE [INDEX|KEY] [index_name]\n        [index_type] (index_col_name,...) [index_type]\n  | ADD [FULLTEXT|SPATIAL] [INDEX|KEY] [index_name]\n        (index_col_name,...) [index_type]\n  | ADD [CONSTRAINT [symbol]]\n        FOREIGN KEY [index_name] (index_col_name,...)\n        reference_definition\n  | ALTER [COLUMN] col_name {SET DEFAULT literal | DROP DEFAULT}\n  | CHANGE [COLUMN] old_col_name new_col_name column_definition\n        [FIRST|AFTER col_name]\n  | MODIFY [COLUMN] col_name column_definition\n        [FIRST | AFTER col_name]\n  | DROP [COLUMN] col_name\n  | DROP PRIMARY KEY\n  | DROP {INDEX|KEY} index_name\n  | DROP FOREIGN KEY fk_symbol\n  | DISABLE KEYS\n  | ENABLE KEYS\n  | RENAME [TO] new_tbl_name\n  | ORDER BY col_name [, col_name] ...\n  | CONVERT TO CHARACTER SET charset_name [COLLATE collation_name]\n  | [DEFAULT] CHARACTER SET [=] charset_name [COLLATE [=] collation_name]\n  | DISCARD TABLESPACE\n  | IMPORT TABLESPACE\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\ntable_options:\n    table_option [[,] table_option] ...  (see CREATE TABLE options)\n\nALTER TABLE changes the structure of a table. For example, you can add\nor delete columns, create or destroy indexes, change the type of\nexisting columns, or rename columns or the table itself. You can also\nchange characteristics such as the storage engine used for the table or\nthe table comment.\n\nFollowing the table name, specify the alterations to be made. If none\nare given, ALTER TABLE does nothing.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/alter-table.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/alter-table.html'),
 (445,'MPOINTFROMWKB',31,'MPointFromWKB(wkb[,srid]), MultiPointFromWKB(wkb[,srid])\n\nConstructs a MULTIPOINT value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkb-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkb-functions'),
 (446,'CHAR BYTE',21,'The CHAR BYTE data type is an alias for the BINARY data type. This is a\ncompatibility feature.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html'),
 (447,'REPAIR TABLE',19,'Syntax:\nREPAIR [NO_WRITE_TO_BINLOG | LOCAL] TABLE\n    tbl_name [, tbl_name] ...\n    [QUICK] [EXTENDED] [USE_FRM]\n\nREPAIR TABLE repairs a possibly corrupted table. By default, it has the\nsame effect as myisamchk --recover tbl_name. REPAIR TABLE works for\nMyISAM and for ARCHIVE tables. See\nhttp://dev.mysql.com/doc/refman/5.0/en/myisam-storage-engine.html, and\nhttp://dev.mysql.com/doc/refman/5.0/en/archive-storage-engine.html.\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/repair-table.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/repair-table.html'),
 (448,'MERGE',37,'The MERGE storage engine, also known as the MRG_MyISAM engine, is a\ncollection of identical MyISAM tables that can be used as one.\n\"Identical\" means that all tables have identical column and index\ninformation. You cannot merge MyISAM tables in which the columns are\nlisted in a different order, do not have exactly the same columns, or\nhave the indexes in different order. However, any or all of the MyISAM\ntables can be compressed with myisampack. See\nhttp://dev.mysql.com/doc/refman/5.0/en/myisampack.html. Differences in\ntable options such as AVG_ROW_LENGTH, MAX_ROWS, or PACK_KEYS do not\nmatter.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/merge-storage-engine.html\n\n','mysql> CREATE TABLE t1 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> CREATE TABLE t2 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> INSERT INTO t1 (message) VALUES (\'Testing\'),(\'table\'),(\'t1\');\nmysql> INSERT INTO t2 (message) VALUES (\'Testing\'),(\'table\'),(\'t2\');\nmysql> CREATE TABLE total (\n    ->    a INT NOT NULL AUTO_INCREMENT,\n    ->    message CHAR(20), INDEX(a))\n    ->    ENGINE=MERGE UNION=(t1,t2) INSERT_METHOD=LAST;\n','http://dev.mysql.com/doc/refman/5.0/en/merge-storage-engine.html'),
 (449,'CREATE TABLE',37,'Syntax:\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    (create_definition,...)\n    [table_options]\n\nOr:\n\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    [(create_definition,...)]\n    [table_options]\n    select_statement\n\nOr:\n\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    { LIKE old_tbl_name | (LIKE old_tbl_name) }\n\ncreate_definition:\n    col_name column_definition\n  | [CONSTRAINT [symbol]] PRIMARY KEY [index_type] (index_col_name,...)\n        [index_type]\n  | {INDEX|KEY} [index_name] [index_type] (index_col_name,...)\n        [index_type]\n  | [CONSTRAINT [symbol]] UNIQUE [INDEX|KEY]\n        [index_name] [index_type] (index_col_name,...)\n        [index_type]\n  | {FULLTEXT|SPATIAL} [INDEX|KEY] [index_name] (index_col_name,...)\n        [index_type]\n  | [CONSTRAINT [symbol]] FOREIGN KEY\n        [index_name] (index_col_name,...) reference_definition\n  | CHECK (expr)\n\ncolumn_definition:\n    data_type [NOT NULL | NULL] [DEFAULT default_value]\n      [AUTO_INCREMENT] [UNIQUE [KEY] | [PRIMARY] KEY]\n      [COMMENT \'string\'] [reference_definition]\n\ndata_type:\n    BIT[(length)]\n  | TINYINT[(length)] [UNSIGNED] [ZEROFILL]\n  | SMALLINT[(length)] [UNSIGNED] [ZEROFILL]\n  | MEDIUMINT[(length)] [UNSIGNED] [ZEROFILL]\n  | INT[(length)] [UNSIGNED] [ZEROFILL]\n  | INTEGER[(length)] [UNSIGNED] [ZEROFILL]\n  | BIGINT[(length)] [UNSIGNED] [ZEROFILL]\n  | REAL[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | DOUBLE[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | FLOAT[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | DECIMAL[(length[,decimals])] [UNSIGNED] [ZEROFILL]\n  | NUMERIC[(length[,decimals])] [UNSIGNED] [ZEROFILL]\n  | DATE\n  | TIME\n  | TIMESTAMP\n  | DATETIME\n  | YEAR\n  | CHAR[(length)]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | VARCHAR(length)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | BINARY[(length)]\n  | VARBINARY(length)\n  | TINYBLOB\n  | BLOB\n  | MEDIUMBLOB\n  | LONGBLOB\n  | TINYTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | TEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | MEDIUMTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | LONGTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | ENUM(value1,value2,value3,...)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | SET(value1,value2,value3,...)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | spatial_type\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nreference_definition:\n    REFERENCES tbl_name (index_col_name,...)\n      [MATCH FULL | MATCH PARTIAL | MATCH SIMPLE]\n      [ON DELETE reference_option]\n      [ON UPDATE reference_option]\n\nreference_option:\n    RESTRICT | CASCADE | SET NULL | NO ACTION\n\ntable_options:\n    table_option [[,] table_option] ...\n\ntable_option:\n    {ENGINE|TYPE} [=] engine_name\n  | AUTO_INCREMENT [=] value\n  | AVG_ROW_LENGTH [=] value\n  | [DEFAULT] CHARACTER SET [=] charset_name\n  | CHECKSUM [=] {0 | 1}\n  | [DEFAULT] COLLATE [=] collation_name\n  | COMMENT [=] \'string\'\n  | CONNECTION [=] \'connect_string\'\n  | DATA DIRECTORY [=] \'absolute path to directory\'\n  | DELAY_KEY_WRITE [=] {0 | 1}\n  | INDEX DIRECTORY [=] \'absolute path to directory\'\n  | INSERT_METHOD [=] { NO | FIRST | LAST }\n  | MAX_ROWS [=] value\n  | MIN_ROWS [=] value\n  | PACK_KEYS [=] {0 | 1 | DEFAULT}\n  | PASSWORD [=] \'string\'\n  | ROW_FORMAT [=] {DEFAULT|DYNAMIC|FIXED|COMPRESSED|REDUNDANT|COMPACT}\n  | UNION [=] (tbl_name[,tbl_name]...)\n\nselect_statement:\n    [IGNORE | REPLACE] [AS] SELECT ...   (Some legal select statement)\n\nCREATE TABLE creates a table with the given name. You must have the\nCREATE privilege for the table.\n\nRules for permissible table names are given in\nhttp://dev.mysql.com/doc/refman/5.0/en/identifiers.html. By default,\nthe table is created in the default database. An error occurs if the\ntable exists, if there is no default database, or if the database does\nnot exist.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/create-table.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/create-table.html'),
 (450,'>',17,'Syntax:\n>\n\nGreater than:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT 2 > 2;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (451,'ANALYZE TABLE',19,'Syntax:\nANALYZE [NO_WRITE_TO_BINLOG | LOCAL] TABLE\n    tbl_name [, tbl_name] ...\n\nANALYZE TABLE analyzes and stores the key distribution for a table.\nDuring the analysis, the table is locked with a read lock for MyISAM,\nBDB, and InnoDB. This statement works with MyISAM, BDB, InnoDB, and NDB\ntables. For MyISAM tables, this statement is equivalent to using\nmyisamchk --analyze-\n\nFor more information on how the analysis works within InnoDB, see\nhttp://dev.mysql.com/doc/refman/5.0/en/innodb-restrictions.html.\n\nMySQL uses the stored key distribution to decide the order in which\ntables should be joined when you perform a join on something other than\na constant. In addition, key distributions can be used when deciding\nwhich indexes to use for a specific table within a query.\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/analyze-table.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/analyze-table.html'),
 (452,'MICROSECOND',30,'Syntax:\nMICROSECOND(expr)\n\nReturns the microseconds from the time or datetime expression expr as a\nnumber in the range from 0 to 999999.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT MICROSECOND(\'12:00:00.123456\');\n        -> 123456\nmysql> SELECT MICROSECOND(\'2009-12-31 23:59:59.000010\');\n        -> 10\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (453,'CONSTRAINT',37,'InnoDB supports foreign key constraints. The syntax for a foreign key\nconstraint definition in InnoDB looks like this:\n\n[CONSTRAINT [symbol]] FOREIGN KEY\n    [index_name] (index_col_name, ...)\n    REFERENCES tbl_name (index_col_name,...)\n    [ON DELETE reference_option]\n    [ON UPDATE reference_option]\n\nreference_option:\n    RESTRICT | CASCADE | SET NULL | NO ACTION\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/innodb-foreign-key-constraints.html\n\n','CREATE TABLE product (category INT NOT NULL, id INT NOT NULL,\n                      price DECIMAL,\n                      PRIMARY KEY(category, id)) ENGINE=INNODB;\nCREATE TABLE customer (id INT NOT NULL,\n                       PRIMARY KEY (id)) ENGINE=INNODB;\nCREATE TABLE product_order (no INT NOT NULL AUTO_INCREMENT,\n                            product_category INT NOT NULL,\n                            product_id INT NOT NULL,\n                            customer_id INT NOT NULL,\n                            PRIMARY KEY(no),\n                            INDEX (product_category, product_id),\n                            FOREIGN KEY (product_category, product_id)\n                              REFERENCES product(category, id)\n                              ON UPDATE CASCADE ON DELETE RESTRICT,\n                            INDEX (customer_id),\n                            FOREIGN KEY (customer_id)\n                              REFERENCES customer(id)) ENGINE=INNODB;\n','http://dev.mysql.com/doc/refman/5.0/en/innodb-foreign-key-constraints.html'),
 (454,'FIELD',35,'Syntax:\nFIELD(str,str1,str2,str3,...)\n\nReturns the index (position) of str in the str1, str2, str3, ... list.\nReturns 0 if str is not found.\n\nIf all arguments to FIELD() are strings, all arguments are compared as\nstrings. If all arguments are numbers, they are compared as numbers.\nOtherwise, the arguments are compared as double.\n\nIf str is NULL, the return value is 0 because NULL fails equality\ncomparison with any value. FIELD() is the complement of ELT().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT FIELD(\'ej\', \'Hej\', \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> 2\nmysql> SELECT FIELD(\'fo\', \'Hej\', \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> 0\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (455,'MAKETIME',30,'Syntax:\nMAKETIME(hour,minute,second)\n\nReturns a time value calculated from the hour, minute, and second\narguments.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT MAKETIME(12,15,30);\n        -> \'12:15:30\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (456,'CURDATE',30,'Syntax:\nCURDATE()\n\nReturns the current date as a value in \'YYYY-MM-DD\' or YYYYMMDD format,\ndepending on whether the function is used in a string or numeric\ncontext.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT CURDATE();\n        -> \'2008-06-13\'\nmysql> SELECT CURDATE() + 0;\n        -> 20080613\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (457,'SET PASSWORD',9,'Syntax:\nSET PASSWORD [FOR user] =\n    {\n        PASSWORD(\'some password\')\n      | OLD_PASSWORD(\'some password\')\n      | \'encrypted password\'\n    }\n\nThe SET PASSWORD statement assigns a password to an existing MySQL user\naccount.\n\nIf the password is specified using the PASSWORD() or OLD_PASSWORD()\nfunction, the literal text of the password should be given. If the\npassword is specified without using either function, the password\nshould be the already-encrypted password value as returned by\nPASSWORD().\n\nWith no FOR clause, this statement sets the password for the current\nuser. Any client that has connected to the server using a nonanonymous\naccount can change the password for that account.\n\nIn MySQL 5.0, enabling the read_only system variable does not prevent\nuse of SET PASSWORD.\n\nWith a FOR clause, this statement sets the password for a specific\naccount on the current server host. Only clients that have the UPDATE\nprivilege for the mysql database can do this. The user value should be\ngiven in user_name@host_name format, where user_name and host_name are\nexactly as they are listed in the User and Host columns of the\nmysql.user table entry. For example, if you had an entry with User and\nHost column values of \'bob\' and \'%.loc.gov\', you would write the\nstatement like this:\n\nSET PASSWORD FOR \'bob\'@\'%.loc.gov\' = PASSWORD(\'newpass\');\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/set-password.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/set-password.html'),
 (458,'IF FUNCTION',6,'Syntax:\nIF(expr1,expr2,expr3)\n\nIf expr1 is TRUE (expr1 <> 0 and expr1 <> NULL) then IF() returns\nexpr2; otherwise it returns expr3. IF() returns a numeric or string\nvalue, depending on the context in which it is used.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/control-flow-functions.html\n\n','mysql> SELECT IF(1>2,2,3);\n        -> 3\nmysql> SELECT IF(1<2,\'yes\',\'no\');\n        -> \'yes\'\nmysql> SELECT IF(STRCMP(\'test\',\'test1\'),\'no\',\'yes\');\n        -> \'no\'\n','http://dev.mysql.com/doc/refman/5.0/en/control-flow-functions.html'),
 (459,'ENUM',21,'ENUM(\'value1\',\'value2\',...) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nAn enumeration. A string object that can have only one value, chosen\nfrom the list of values \'value1\', \'value2\', ..., NULL or the special \'\'\nerror value. An ENUM column can have a maximum of 65,535 distinct\nvalues. ENUM values are represented internally as integers.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html'),
 (460,'DATABASE',16,'Syntax:\nDATABASE()\n\nReturns the default (current) database name as a string in the utf8\ncharacter set. If there is no default database, DATABASE() returns\nNULL. Within a stored routine, the default database is the database\nthat the routine is associated with, which is not necessarily the same\nas the database that is the default in the calling context.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/information-functions.html\n\n','mysql> SELECT DATABASE();\n        -> \'test\'\n','http://dev.mysql.com/doc/refman/5.0/en/information-functions.html'),
 (461,'POINTFROMWKB',31,'PointFromWKB(wkb[,srid])\n\nConstructs a POINT value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkb-functions\n\n','','http://dev.mysql.com/doc/refman/5.0/en/creating-spatial-values.html#gis-wkb-functions'),
 (462,'POWER',4,'Syntax:\nPOWER(X,Y)\n\nThis is a synonym for POW().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (463,'ATAN',4,'Syntax:\nATAN(X)\n\nReturns the arc tangent of X, that is, the value whose tangent is X.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT ATAN(2);\n        -> 1.1071487177941\nmysql> SELECT ATAN(-2);\n        -> -1.1071487177941\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (464,'STRCMP',35,'Syntax:\nSTRCMP(expr1,expr2)\n\nSTRCMP() returns 0 if the strings are the same, -1 if the first\nargument is smaller than the second according to the current sort\norder, and 1 otherwise.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-comparison-functions.html\n\n','mysql> SELECT STRCMP(\'text\', \'text2\');\n        -> -1\nmysql> SELECT STRCMP(\'text2\', \'text\');\n        -> 1\nmysql> SELECT STRCMP(\'text\', \'text\');\n        -> 0\n','http://dev.mysql.com/doc/refman/5.0/en/string-comparison-functions.html'),
 (465,'INSERT DELAYED',26,'Syntax:\nINSERT DELAYED ...\n\nThe DELAYED option for the INSERT statement is a MySQL extension to\nstandard SQL that is very useful if you have clients that cannot or\nneed not wait for the INSERT to complete. This is a common situation\nwhen you use MySQL for logging and you also periodically run SELECT and\nUPDATE statements that take a long time to complete.\n\nWhen a client uses INSERT DELAYED, it gets an okay from the server at\nonce, and the row is queued to be inserted when the table is not in use\nby any other thread.\n\nAnother major benefit of using INSERT DELAYED is that inserts from many\nclients are bundled together and written in one block. This is much\nfaster than performing many separate inserts.\n\nNote that INSERT DELAYED is slower than a normal INSERT if the table is\nnot otherwise in use. There is also the additional overhead for the\nserver to handle a separate thread for each table for which there are\ndelayed rows. This means that you should use INSERT DELAYED only when\nyou are really sure that you need it.\n\nThe queued rows are held only in memory until they are inserted into\nthe table. This means that if you terminate mysqld forcibly (for\nexample, with kill -9) or if mysqld dies unexpectedly, any queued rows\nthat have not been written to disk are lost.\n\nThere are some constraints on the use of DELAYED:\n\no INSERT DELAYED works only with MyISAM, MEMORY, and ARCHIVE tables.\n  For engines that do not support DELAYED, an error occurs.\n\no An error occurs for INSERT DELAYED if used with a table that has been\n  locked with LOCK TABLES because the insert must be handled by a\n  separate thread, not by the session that holds the lock.\n\no For MyISAM tables, if there are no free blocks in the middle of the\n  data file, concurrent SELECT and INSERT statements are supported.\n  Under these circumstances, you very seldom need to use INSERT DELAYED\n  with MyISAM.\n\no INSERT DELAYED should be used only for INSERT statements that specify\n  value lists. The server ignores DELAYED for INSERT ... SELECT or\n  INSERT ... ON DUPLICATE KEY UPDATE statements.\n\no Because the INSERT DELAYED statement returns immediately, before the\n  rows are inserted, you cannot use LAST_INSERT_ID() to get the\n  AUTO_INCREMENT value that the statement might generate.\n\no DELAYED rows are not visible to SELECT statements until they actually\n  have been inserted.\n\no INSERT DELAYED is treated as a normal INSERT if the statement inserts\n  multiple rows and binary logging is enabled.\n\no DELAYED is ignored on slave replication servers, so that INSERT\n  DELAYED is treated as a normal INSERT on slaves. This is because\n  DELAYED could cause the slave to have different data than the master.\n\no Pending INSERT DELAYED statements are lost if a table is write locked\n  and ALTER TABLE is used to modify the table structure.\n\no INSERT DELAYED is not supported for views.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/insert-delayed.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/insert-delayed.html'),
 (466,'SHOW PROFILE',25,'Syntax:\nSHOW PROFILES\n\nThe SHOW PROFILE statement display profiling information that indicates\nresource usage for statements executed during the course of the current\nsession. It is used together with SHOW PROFILES; see [HELP SHOW\nPROFILES].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-profile.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-profile.html'),
 (467,'SHOW PROCEDURE CODE',25,'Syntax:\nSHOW PROCEDURE CODE proc_name\n\nThis statement is a MySQL extension that is available only for servers\nthat have been built with debugging support. It displays a\nrepresentation of the internal implementation of the named stored\nprocedure. A similar statement, SHOW FUNCTION CODE, displays\ninformation about stored functions (see [HELP SHOW FUNCTION CODE]).\n\nBoth statements require that you be the owner of the routine or have\nSELECT access to the mysql.proc table.\n\nIf the named routine is available, each statement produces a result\nset. Each row in the result set corresponds to one \"instruction\" in the\nroutine. The first column is Pos, which is an ordinal number beginning\nwith 0. The second column is Instruction, which contains an SQL\nstatement (usually changed from the original source), or a directive\nwhich has meaning only to the stored-routine handler.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-procedure-code.html\n\n','mysql> DELIMITER //\nmysql> CREATE PROCEDURE p1 ()\n    -> BEGIN\n    ->   DECLARE fanta INT DEFAULT 55;\n    ->   DROP TABLE t2;\n    ->   LOOP\n    ->     INSERT INTO t3 VALUES (fanta);\n    ->     END LOOP;\n    ->   END//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SHOW PROCEDURE CODE p1//\n+-----+----------------------------------------+\n| Pos | Instruction                            |\n+-----+----------------------------------------+\n|   0 | set fanta@0 55                         |\n|   1 | stmt 9 \"DROP TABLE t2\"                 |\n|   2 | stmt 5 \"INSERT INTO t3 VALUES (fanta)\" |\n|   3 | jump 2                                 |\n+-----+----------------------------------------+\n4 rows in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.0/en/show-procedure-code.html'),
 (468,'MEDIUMTEXT',21,'MEDIUMTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 16,777,215 (224 - 1) characters.\nThe effective maximum length is less if the value contains multi-byte\ncharacters. Each MEDIUMTEXT value is stored using a three-byte length\nprefix that indicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/string-type-overview.html'),
 (469,'LN',4,'Syntax:\nLN(X)\n\nReturns the natural logarithm of X; that is, the base-e logarithm of X.\nIf X is less than or equal to 0, then NULL is returned.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT LN(2);\n        -> 0.69314718055995\nmysql> SELECT LN(-2);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html');
INSERT INTO `help_topic` (`help_topic_id`,`name`,`help_category_id`,`description`,`example`,`url`) VALUES 
 (470,'RETURN',22,'Syntax:\nRETURN expr\n\nThe RETURN statement terminates execution of a stored function and\nreturns the value expr to the function caller. There must be at least\none RETURN statement in a stored function. There may be more than one\nif the function has multiple exit points.\n\nThis statement is not used in stored procedures or triggers. The LEAVE\nstatement can be used to exit a stored program of those types.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/return.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/return.html'),
 (471,'SHOW COLLATION',25,'Syntax:\nSHOW COLLATION\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement lists collations supported by the server. By default,\nthe output from SHOW COLLATION includes all available collations. The\nLIKE clause, if present, indicates which collation names to match. The\nWHERE clause can be given to select rows using more general conditions,\nas discussed in\nhttp://dev.mysql.com/doc/refman/5.0/en/extended-show.html. For example:\n\nmysql> SHOW COLLATION LIKE \'latin1%\';\n+-------------------+---------+----+---------+----------+---------+\n| Collation         | Charset | Id | Default | Compiled | Sortlen |\n+-------------------+---------+----+---------+----------+---------+\n| latin1_german1_ci | latin1  |  5 |         |          |       0 |\n| latin1_swedish_ci | latin1  |  8 | Yes     | Yes      |       0 |\n| latin1_danish_ci  | latin1  | 15 |         |          |       0 |\n| latin1_german2_ci | latin1  | 31 |         | Yes      |       2 |\n| latin1_bin        | latin1  | 47 |         | Yes      |       0 |\n| latin1_general_ci | latin1  | 48 |         |          |       0 |\n| latin1_general_cs | latin1  | 49 |         |          |       0 |\n| latin1_spanish_ci | latin1  | 94 |         |          |       0 |\n+-------------------+---------+----+---------+----------+---------+\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/show-collation.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/show-collation.html'),
 (472,'LOG',4,'Syntax:\nLOG(X), LOG(B,X)\n\nIf called with one parameter, this function returns the natural\nlogarithm of X. If X is less than or equal to 0, then NULL is returned.\n\nThe inverse of this function (when called with a single argument) is\nthe EXP() function.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT LOG(2);\n        -> 0.69314718055995\nmysql> SELECT LOG(-2);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (473,'SET SQL_LOG_BIN',7,'Syntax:\nSET sql_log_bin = {0|1}\n\nDisables or enables binary logging for the current session (sql_log_bin\nis a session variable) if the client has the SUPER privilege. The\nstatement fails with an error if the client does not have that\nprivilege.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/set-sql-log-bin.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/set-sql-log-bin.html'),
 (474,'!=',17,'Syntax:\n<>, !=\n\nNot equal:\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT \'.01\' <> \'0.01\';\n        -> 1\nmysql> SELECT .01 <> \'0.01\';\n        -> 0\nmysql> SELECT \'zapp\' <> \'zappp\';\n        -> 1\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (475,'WHILE',22,'Syntax:\n[begin_label:] WHILE search_condition DO\n    statement_list\nEND WHILE [end_label]\n\nThe statement list within a WHILE statement is repeated as long as the\nsearch_condition expression is true. statement_list consists of one or\nmore SQL statements, each terminated by a semicolon (;) statement\ndelimiter.\n\nA WHILE statement can be labeled. For the rules regarding label use,\nsee [HELP labels].\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/while-statement.html\n\n','CREATE PROCEDURE dowhile()\nBEGIN\n  DECLARE v1 INT DEFAULT 5;\n\n  WHILE v1 > 0 DO\n    ...\n    SET v1 = v1 - 1;\n  END WHILE;\nEND;\n','http://dev.mysql.com/doc/refman/5.0/en/while-statement.html'),
 (476,'AES_DECRYPT',11,'Syntax:\nAES_DECRYPT(crypt_str,key_str)\n\nThis function decrypts data using the official AES (Advanced Encryption\nStandard) algorithm. For more information, see the description of\nAES_ENCRYPT().\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/encryption-functions.html'),
 (477,'DAYNAME',30,'Syntax:\nDAYNAME(date)\n\nReturns the name of the weekday for date. As of MySQL 5.0.25, the\nlanguage used for the name is controlled by the value of the\nlc_time_names system variable\n(http://dev.mysql.com/doc/refman/5.0/en/locale-support.html).\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html\n\n','mysql> SELECT DAYNAME(\'2007-02-03\');\n        -> \'Saturday\'\n','http://dev.mysql.com/doc/refman/5.0/en/date-and-time-functions.html'),
 (478,'COERCIBILITY',16,'Syntax:\nCOERCIBILITY(str)\n\nReturns the collation coercibility value of the string argument.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/information-functions.html\n\n','mysql> SELECT COERCIBILITY(\'abc\' COLLATE latin1_swedish_ci);\n        -> 0\nmysql> SELECT COERCIBILITY(USER());\n        -> 3\nmysql> SELECT COERCIBILITY(\'abc\');\n        -> 4\n','http://dev.mysql.com/doc/refman/5.0/en/information-functions.html'),
 (479,'INT',21,'INT[(M)] [UNSIGNED] [ZEROFILL]\n\nA normal-size integer. The signed range is -2147483648 to 2147483647.\nThe unsigned range is 0 to 4294967295.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.0/en/numeric-type-overview.html'),
 (480,'GLENGTH',12,'GLength(ls)\n\nReturns as a double-precision number the length of the LineString value\nls in its associated spatial reference.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#linestring-property-functions\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT GLength(GeomFromText(@ls));\n+----------------------------+\n| GLength(GeomFromText(@ls)) |\n+----------------------------+\n|            2.8284271247462 |\n+----------------------------+\n','http://dev.mysql.com/doc/refman/5.0/en/geometry-property-functions.html#linestring-property-functions'),
 (481,'RADIANS',4,'Syntax:\nRADIANS(X)\n\nReturns the argument X, converted from degrees to radians. (Note that\nπ radians equals 180 degrees.)\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html\n\n','mysql> SELECT RADIANS(90);\n        -> 1.5707963267949\n','http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html'),
 (482,'COLLATION',16,'Syntax:\nCOLLATION(str)\n\nReturns the collation of the string argument.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/information-functions.html\n\n','mysql> SELECT COLLATION(\'abc\');\n        -> \'latin1_swedish_ci\'\nmysql> SELECT COLLATION(_utf8\'abc\');\n        -> \'utf8_general_ci\'\n','http://dev.mysql.com/doc/refman/5.0/en/information-functions.html'),
 (483,'COALESCE',17,'Syntax:\nCOALESCE(value,...)\n\nReturns the first non-NULL value in the list, or NULL if there are no\nnon-NULL values.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html\n\n','mysql> SELECT COALESCE(NULL,1);\n        -> 1\nmysql> SELECT COALESCE(NULL,NULL,NULL);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.0/en/comparison-operators.html'),
 (484,'VERSION',16,'Syntax:\nVERSION()\n\nReturns a string that indicates the MySQL server version. The string\nuses the utf8 character set. The value might have a suffix in addition\nto the version number. See the description of the version system\nvariable in\nhttp://dev.mysql.com/doc/refman/5.0/en/server-system-variables.html.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/information-functions.html\n\n','mysql> SELECT VERSION();\n        -> \'5.0.96-standard\'\n','http://dev.mysql.com/doc/refman/5.0/en/information-functions.html'),
 (485,'MAKE_SET',35,'Syntax:\nMAKE_SET(bits,str1,str2,...)\n\nReturns a set value (a string containing substrings separated by \",\"\ncharacters) consisting of the strings that have the corresponding bit\nin bits set. str1 corresponds to bit 0, str2 to bit 1, and so on. NULL\nvalues in str1, str2, ... are not appended to the result.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT MAKE_SET(1,\'a\',\'b\',\'c\');\n        -> \'a\'\nmysql> SELECT MAKE_SET(1 | 4,\'hello\',\'nice\',\'world\');\n        -> \'hello,world\'\nmysql> SELECT MAKE_SET(1 | 4,\'hello\',\'nice\',NULL,\'world\');\n        -> \'hello\'\nmysql> SELECT MAKE_SET(0,\'a\',\'b\',\'c\');\n        -> \'\'\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html'),
 (486,'FIND_IN_SET',35,'Syntax:\nFIND_IN_SET(str,strlist)\n\nReturns a value in the range of 1 to N if the string str is in the\nstring list strlist consisting of N substrings. A string list is a\nstring composed of substrings separated by \",\" characters. If the first\nargument is a constant string and the second is a column of type SET,\nthe FIND_IN_SET() function is optimized to use bit arithmetic. Returns\n0 if str is not in strlist or if strlist is the empty string. Returns\nNULL if either argument is NULL. This function does not work properly\nif the first argument contains a comma (\",\") character.\n\nURL: http://dev.mysql.com/doc/refman/5.0/en/string-functions.html\n\n','mysql> SELECT FIND_IN_SET(\'b\',\'a,b,c,d\');\n        -> 2\n','http://dev.mysql.com/doc/refman/5.0/en/string-functions.html');
/*!40000 ALTER TABLE `help_topic` ENABLE KEYS */;


--
-- Definition of table `host`
--

DROP TABLE IF EXISTS `host`;
CREATE TABLE `host` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `Select_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Insert_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Update_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Delete_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Drop_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Grant_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `References_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Index_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_tmp_table_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Lock_tables_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Show_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Execute_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  PRIMARY KEY  (`Host`,`Db`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Host privileges;  Merged with database privileges';

--
-- Dumping data for table `host`
--

/*!40000 ALTER TABLE `host` DISABLE KEYS */;
/*!40000 ALTER TABLE `host` ENABLE KEYS */;


--
-- Definition of table `proc`
--

DROP TABLE IF EXISTS `proc`;
CREATE TABLE `proc` (
  `db` char(64) character set utf8 collate utf8_bin NOT NULL default '',
  `name` char(64) NOT NULL default '',
  `type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `specific_name` char(64) NOT NULL default '',
  `language` enum('SQL') NOT NULL default 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL default 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL default 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL default 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` char(64) NOT NULL default '',
  `body` longblob NOT NULL,
  `definer` char(77) character set utf8 collate utf8_bin NOT NULL default '',
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL default '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE') NOT NULL default '',
  `comment` char(64) character set utf8 collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`db`,`name`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stored Procedures';

--
-- Dumping data for table `proc`
--

/*!40000 ALTER TABLE `proc` DISABLE KEYS */;
/*!40000 ALTER TABLE `proc` ENABLE KEYS */;


--
-- Definition of table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
CREATE TABLE `procs_priv` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Routine_name` char(64) character set utf8 NOT NULL default '',
  `Routine_type` enum('FUNCTION','PROCEDURE') collate utf8_bin NOT NULL,
  `Grantor` char(77) collate utf8_bin NOT NULL default '',
  `Proc_priv` set('Execute','Alter Routine','Grant') character set utf8 NOT NULL default '',
  `Timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Procedure privileges';

--
-- Dumping data for table `procs_priv`
--

/*!40000 ALTER TABLE `procs_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `procs_priv` ENABLE KEYS */;


--
-- Definition of table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
CREATE TABLE `tables_priv` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Table_name` char(64) collate utf8_bin NOT NULL default '',
  `Grantor` char(77) collate utf8_bin NOT NULL default '',
  `Timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view') character set utf8 NOT NULL default '',
  `Column_priv` set('Select','Insert','Update','References') character set utf8 NOT NULL default '',
  PRIMARY KEY  (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table privileges';

--
-- Dumping data for table `tables_priv`
--

/*!40000 ALTER TABLE `tables_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables_priv` ENABLE KEYS */;


--
-- Definition of table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
CREATE TABLE `time_zone` (
  `Time_zone_id` int(10) unsigned NOT NULL auto_increment,
  `Use_leap_seconds` enum('Y','N') NOT NULL default 'N',
  PRIMARY KEY  (`Time_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zones';

--
-- Dumping data for table `time_zone`
--

/*!40000 ALTER TABLE `time_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone` ENABLE KEYS */;


--
-- Definition of table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY  (`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Leap seconds information for time zones';

--
-- Dumping data for table `time_zone_leap_second`
--

/*!40000 ALTER TABLE `time_zone_leap_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_leap_second` ENABLE KEYS */;


--
-- Definition of table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone names';

--
-- Dumping data for table `time_zone_name`
--

/*!40000 ALTER TABLE `time_zone_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_name` ENABLE KEYS */;


--
-- Definition of table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`Time_zone_id`,`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transitions';

--
-- Dumping data for table `time_zone_transition`
--

/*!40000 ALTER TABLE `time_zone_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition` ENABLE KEYS */;


--
-- Definition of table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  `Offset` int(11) NOT NULL default '0',
  `Is_DST` tinyint(3) unsigned NOT NULL default '0',
  `Abbreviation` char(8) NOT NULL default '',
  PRIMARY KEY  (`Time_zone_id`,`Transition_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transition types';

--
-- Dumping data for table `time_zone_transition_type`
--

/*!40000 ALTER TABLE `time_zone_transition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition_type` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Password` char(41) character set latin1 collate latin1_bin NOT NULL default '',
  `Select_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Insert_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Update_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Delete_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Drop_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Reload_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Shutdown_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Process_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `File_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Grant_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `References_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Index_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Show_db_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Super_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_tmp_table_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Lock_tables_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Execute_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Repl_slave_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Repl_client_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Show_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_user_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') character set utf8 NOT NULL default '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) unsigned NOT NULL default '0',
  `max_updates` int(11) unsigned NOT NULL default '0',
  `max_connections` int(11) unsigned NOT NULL default '0',
  `max_user_connections` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Host`,`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global privileges';

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`Host`,`User`,`Password`,`Select_priv`,`Insert_priv`,`Update_priv`,`Delete_priv`,`Create_priv`,`Drop_priv`,`Reload_priv`,`Shutdown_priv`,`Process_priv`,`File_priv`,`Grant_priv`,`References_priv`,`Index_priv`,`Alter_priv`,`Show_db_priv`,`Super_priv`,`Create_tmp_table_priv`,`Lock_tables_priv`,`Execute_priv`,`Repl_slave_priv`,`Repl_client_priv`,`Create_view_priv`,`Show_view_priv`,`Create_routine_priv`,`Alter_routine_priv`,`Create_user_priv`,`ssl_type`,`ssl_cipher`,`x509_issuer`,`x509_subject`,`max_questions`,`max_updates`,`max_connections`,`max_user_connections`) VALUES 
 (0x6C6F63616C686F7374,0x726F6F74,0x2A43393641464339363742424239423131423436443438454433304443343546354232313343413938,'Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0),
 (0x70726F6A2D693131303035,0x726F6F74,0x2A43393641464339363742424239423131423436443438454433304443343546354232313343413938,'Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0),
 (0x3132372E302E302E31,0x726F6F74,0x2A43393641464339363742424239423131423436443438454433304443343546354232313343413938,'Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0),
 (0x25,0x726F6F74,0x2A43393641464339363742424239423131423436443438454433304443343546354232313343413938,'Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

--
-- Create schema plagiatsjaeger
--

CREATE DATABASE IF NOT EXISTS plagiatsjaeger;
USE plagiatsjaeger;

--
-- Definition of table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `cID` int(11) NOT NULL auto_increment,
  `cName` varchar(256) NOT NULL,
  `cNumber` int(11) NOT NULL,
  `cAdmin` int(11) default NULL,
  PRIMARY KEY  (`cID`),
  UNIQUE KEY `cNumber` (`cNumber`),
  KEY `cAdmin` (`cAdmin`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`cAdmin`) REFERENCES `user` (`uID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`cID`,`cName`,`cNumber`,`cAdmin`) VALUES 
 (1,'System Administrator',500,2),
 (2,'DHBW Stuttgart Campus Horb',1000,1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;


--
-- Definition of table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `dID` int(11) NOT NULL auto_increment,
  `dOriginalName` varchar(256) NOT NULL,
  `dAuthor` varchar(256) NOT NULL,
  `dIsParsed` tinyint(1) NOT NULL default '0',
  `fID` int(11) NOT NULL,
  PRIMARY KEY  (`dID`),
  KEY `uID` (`fID`),
  KEY `fID` (`fID`),
  CONSTRAINT `document_ibfk_2` FOREIGN KEY (`fID`) REFERENCES `folder` (`fID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Zuständig für das Speichern von Dokumentdaten';

--
-- Dumping data for table `document`
--

/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` (`dID`,`dOriginalName`,`dAuthor`,`dIsParsed`,`fID`) VALUES 
 (10,'Schnelltest Upload','Timo',0,5),
 (11,'Schnelltest Upload','Andreas',0,6),
 (12,'Schnelltest Upload','Andreas',0,7),
 (13,'lore3.txt','',0,5),
 (14,'lore4.txt','wiergwieut',0,5),
 (15,'Schnelltest Upload','Chef und so',0,12),
 (16,'Schnelltest Upload','Hallo Timo',0,11),
 (17,'Schnelltest Upload','sollte nicht gehn',0,10);
/*!40000 ALTER TABLE `document` ENABLE KEYS */;


--
-- Definition of table `errorcode`
--

DROP TABLE IF EXISTS `errorcode`;
CREATE TABLE `errorcode` (
  `eID` int(11) NOT NULL,
  `eName` varchar(50) NOT NULL,
  `eDescription` text NOT NULL,
  PRIMARY KEY  (`eID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `errorcode`
--

/*!40000 ALTER TABLE `errorcode` DISABLE KEYS */;
INSERT INTO `errorcode` (`eID`,`eName`,`eDescription`) VALUES 
 (100,'Created','Die Plagiatsprüfung wurde erstellt.'),
 (200,'Started','Die Plagiatsprüfung wurde gestartet.'),
 (300,'Successful','Die Plagiatsprüfung war erfolgreich.'),
 (400,'Error','Die Plagiatsprüfung ist fehlgeschlagen.');
/*!40000 ALTER TABLE `errorcode` ENABLE KEYS */;


--
-- Definition of table `folder`
--

DROP TABLE IF EXISTS `folder`;
CREATE TABLE `folder` (
  `fID` int(11) NOT NULL auto_increment,
  `fName` varchar(256) NOT NULL,
  `fHashLink` varchar(256) NOT NULL,
  `fLinkExpireDatetime` datetime default NULL,
  `fParentID` int(11) default NULL,
  `fThreshold` int(11) default NULL,
  `fCheckWWW` tinyint(1) default NULL,
  `slID` int(11) default NULL,
  PRIMARY KEY  (`fID`),
  KEY `fParentID` (`fParentID`),
  KEY `fParentID_2` (`fParentID`),
  KEY `slID` (`slID`),
  CONSTRAINT `folder_ibfk_1` FOREIGN KEY (`fParentID`) REFERENCES `folder` (`fID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `folder_ibfk_3` FOREIGN KEY (`slID`) REFERENCES `settinglevel` (`slID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Spiegelt Ordner Hierarchie wieder';

--
-- Dumping data for table `folder`
--

/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` (`fID`,`fName`,`fHashLink`,`fLinkExpireDatetime`,`fParentID`,`fThreshold`,`fCheckWWW`,`slID`) VALUES 
 (5,'Mathe','',NULL,NULL,0,0,1),
 (6,'Test','',NULL,NULL,0,0,1),
 (7,'Test2','',NULL,NULL,0,0,1),
 (8,'kjh','',NULL,7,0,0,1),
 (9,'lÃ¶j','',NULL,7,0,0,1),
 (10,'Klaus','',NULL,NULL,NULL,NULL,NULL),
 (11,'				2012			','',NULL,10,NULL,NULL,NULL),
 (12,'				Gebe Timo frei			','',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;


--
-- Definition of table `folderpermission`
--

DROP TABLE IF EXISTS `folderpermission`;
CREATE TABLE `folderpermission` (
  `fpID` int(11) NOT NULL auto_increment,
  `fpPermissionLevel` int(11) NOT NULL,
  `fID` int(11) NOT NULL,
  `uID` int(11) NOT NULL,
  PRIMARY KEY  (`fpID`),
  UNIQUE KEY `fID_2` (`fID`,`uID`),
  KEY `fID` (`fID`),
  KEY `uID` (`uID`),
  CONSTRAINT `folderpermission_ibfk_3` FOREIGN KEY (`fID`) REFERENCES `folder` (`fID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `folderpermission_ibfk_4` FOREIGN KEY (`uID`) REFERENCES `user` (`uID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='Speichert Ordernberechtigungen';

--
-- Dumping data for table `folderpermission`
--

/*!40000 ALTER TABLE `folderpermission` DISABLE KEYS */;
INSERT INTO `folderpermission` (`fpID`,`fpPermissionLevel`,`fID`,`uID`) VALUES 
 (1,900,5,2),
 (2,900,6,4),
 (3,900,7,4),
 (5,900,8,4),
 (6,900,9,4),
 (22,900,10,2),
 (23,900,11,2),
 (27,900,12,7),
 (28,700,12,2),
 (29,700,11,7),
 (32,700,10,7),
 (33,700,10,4),
 (34,700,10,3);
/*!40000 ALTER TABLE `folderpermission` ENABLE KEYS */;


--
-- Definition of table `report`
--

DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `rID` int(11) NOT NULL auto_increment,
  `rDatetime` datetime NOT NULL,
  `rErrorCode` int(11) NOT NULL,
  `rThreshold` int(11) NOT NULL,
  `rCheckWWW` tinyint(1) NOT NULL,
  `slID` int(11) NOT NULL,
  `dID` int(11) NOT NULL,
  PRIMARY KEY  (`rID`),
  KEY `dID` (`dID`),
  KEY `rErrorCode` (`rErrorCode`),
  KEY `slID` (`slID`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`dID`) REFERENCES `document` (`dID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `report_ibfk_3` FOREIGN KEY (`rErrorCode`) REFERENCES `errorcode` (`eID`),
  CONSTRAINT `report_ibfk_4` FOREIGN KEY (`slID`) REFERENCES `settinglevel` (`slID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='Zuständig für das Speichern von Berichten';

--
-- Dumping data for table `report`
--

/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` (`rID`,`rDatetime`,`rErrorCode`,`rThreshold`,`rCheckWWW`,`slID`,`dID`) VALUES 
 (30,'2013-05-05 15:05:19',100,0,0,1,10),
 (31,'2013-05-05 16:05:25',100,0,0,1,11),
 (32,'2013-05-08 13:05:54',100,50,1,1,13),
 (33,'2013-05-08 13:05:50',100,50,1,1,13),
 (34,'2013-05-08 13:05:11',100,50,1,1,13),
 (35,'2013-05-08 13:05:45',100,50,1,1,13),
 (36,'2013-05-08 13:05:51',100,90,1,1,14);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;


--
-- Definition of table `result`
--

DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `rtID` int(11) NOT NULL auto_increment,
  `rtSourceText` text NOT NULL,
  `rtSourceLink` varchar(512) NOT NULL,
  `rtSourcedID` int(11) default NULL,
  `rtStartWord` int(11) NOT NULL,
  `rtEndWord` int(11) NOT NULL,
  `rtSimilarity` decimal(5,2) NOT NULL,
  `rID` int(11) NOT NULL,
  PRIMARY KEY  (`rtID`),
  KEY `dID` (`rID`),
  KEY `dID_2` (`rID`),
  KEY `rID` (`rID`),
  KEY `rtSourcedID` (`rtSourcedID`),
  KEY `rtSourcedID_2` (`rtSourcedID`),
  CONSTRAINT `result_ibfk_1` FOREIGN KEY (`rID`) REFERENCES `report` (`rID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COMMENT='Speichert Plagiatsverdächte ab';

--
-- Dumping data for table `result`
--

/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` (`rtID`,`rtSourceText`,`rtSourceLink`,`rtSourcedID`,`rtStartWord`,`rtEndWord`,`rtSimilarity`,`rID`) VALUES 
 (84,'nicht einverstanden, muss er zunächst den Vermittlungsausschuss anrufen und versuchen, hier eine Einigung mit dem Bundestag zu erzielen. Schlägt der Vermittlungsausschuss Änderungen am Gesetz vor, müssen','http://engesaar.de/news/index.php',NULL,30,56,'95.13',30),
 (85,'ob er gegen das nunmehr geänderte Gesetz Einspruch einlegt oder nicht. Macht der Vermittlungsausschuss keine Änderungsvorschläge oder kommt eine Einigung nicht zustande, entscheidet der Bundesrat ohne erneute Beteiligung des Bundestages über einen Einspruch gegen den dann unveränderten Gesetzesbeschluss. Über','http://engesaar.de/news/index.php',NULL,66,104,'96.55',30),
 (86,'nicht einverstanden, muss er zunächst den Vermittlungsausschuss anrufen und versuchen, hier eine Einigung mit dem Bundestag zu erzielen. Schlägt der Vermittlungsausschuss Änderungen am Gesetz vor, müssen','http://de.pschitt.info/page/Bundesrat',NULL,30,56,'95.13',30),
 (87,'ob er gegen das nunmehr geänderte Gesetz Einspruch einlegt, oder nicht. Macht der Vermittlungsausschuss keine Änderungsvorschläge oder kommt eine Einigung nicht zustande, entscheidet der Bundesrat ohne erneute Beteiligung des Bundestages über einen Einspruch gegen den dann unveränderten Gesetzesbeschluss. Über','http://de.pschitt.info/page/Bundesrat',NULL,66,104,'96.07',30),
 (88,'nicht einverstanden, muss er zunächst den Vermittlungsausschuss anrufen und versuchen, hier eine Einigung mit dem Bundestag zu erzielen. Schlägt der Vermittlungsausschuss Änderungen am Gesetz vor, müssen','http://cobocards.com/pool/en/cardset/4045623/online-karteikarten-oeffentliches-recht/',NULL,30,56,'95.13',30),
 (89,'ob er gegen das nunmehr geänderte Gesetz Einspruch einlegt, oder nicht. Macht der Vermittlungsausschuss keine Änderungsvorschläge oder kommt eine Einigung nicht zustande, entscheidet der Bundesrat ohne erneute Beteiligung des Bundestages über einen Einspruch gegen den dann unveränderten Gesetzesbeschluss. Ein','http://cobocards.com/pool/en/cardset/4045623/online-karteikarten-oeffentliches-recht/',NULL,66,104,'96.07',30),
 (90,'nicht einverstanden, muss er zunächst den Vermittlungsausschuss anrufen und versuchen, hier eine Einigung mit dem Bundestag zu erzielen. Schlägt der Vermittlungsausschuss Änderungen am Gesetz vor, müssen','http://de.wikiactu.com/?page_id=196',NULL,30,56,'95.13',30),
 (91,'ob er gegen das nunmehr geänderte Gesetz Einspruch einlegt, oder nicht. Macht der Vermittlungsausschuss keine Änderungsvorschläge oder kommt eine Einigung nicht zustande, entscheidet der Bundesrat ohne erneute Beteiligung des Bundestages über einen Einspruch gegen den dann unveränderten Gesetzesbeschluss. Über','http://de.wikiactu.com/?page_id=196',NULL,66,104,'96.07',30);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;


--
-- Definition of table `settinglevel`
--

DROP TABLE IF EXISTS `settinglevel`;
CREATE TABLE `settinglevel` (
  `slID` int(11) NOT NULL auto_increment,
  `slTitle` varchar(256) NOT NULL,
  `slSearchSentenceLength` int(11) NOT NULL,
  `slSearchJumpLength` int(11) NOT NULL,
  `slCompareSentenceLength` int(11) NOT NULL,
  `slCompareJumpLength` int(11) NOT NULL,
  PRIMARY KEY  (`slID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settinglevel`
--

/*!40000 ALTER TABLE `settinglevel` DISABLE KEYS */;
INSERT INTO `settinglevel` (`slID`,`slTitle`,`slSearchSentenceLength`,`slSearchJumpLength`,`slCompareSentenceLength`,`slCompareJumpLength`) VALUES 
 (1,'Normal',10,5,10,5),
 (2,'Schnell',15,10,15,10);
/*!40000 ALTER TABLE `settinglevel` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uID` int(11) NOT NULL auto_increment,
  `uName` varchar(256) NOT NULL,
  `uLastname` varchar(256) NOT NULL,
  `uEMailAdress` varchar(256) NOT NULL,
  `uPassword` varchar(256) NOT NULL,
  `uRestoreKey` varchar(32) NOT NULL,
  `uRestoreEndDate` date default NULL,
  `uPermissonLevel` int(11) NOT NULL,
  `uThreshold` int(11) NOT NULL,
  `uCheckWWW` tinyint(1) NOT NULL,
  `slID` int(11) NOT NULL,
  `cID` int(11) NOT NULL,
  PRIMARY KEY  (`uID`),
  KEY `cID` (`cID`),
  KEY `slID` (`slID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`cID`) REFERENCES `client` (`cID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`slID`) REFERENCES `settinglevel` (`slID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Speichert Nutzer ab';

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`uID`,`uName`,`uLastname`,`uEMailAdress`,`uPassword`,`uRestoreKey`,`uRestoreEndDate`,`uPermissonLevel`,`uThreshold`,`uCheckWWW`,`slID`,`cID`) VALUES 
 (1,'Antonius','van Hoof','a.vanhoof@hb.dhbw-stuttgart.de','098f6bcd4621d373cade4e832627b4f6','',NULL,500,0,0,1,2),
 (2,'Timo','Schneider','timo@schnti.de','098f6bcd4621d373cade4e832627b4f6','46acc1369e6b4d2bba6976adc2c77767','2013-05-01',500,0,0,1,1),
 (3,'Mark','Strecker','markstrecker1003@gmail.com','098f6bcd4621d373cade4e832627b4f6','',NULL,500,0,0,1,1),
 (4,'Andreas','Hahn','andyhahn91@gmail.com','098f6bcd4621d373cade4e832627b4f6','',NULL,500,0,0,1,1),
 (7,'Christian','Fischer','i11004@hb.dhbw-stuttgart.de','25d55ad283aa400af464c76d713c07ad','','0000-00-00',500,0,0,1,1),
 (19,'Max','Mustermann','max@mustermann.de','25d55ad283aa400af464c76d713c07ad','',NULL,1,0,0,1,2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
