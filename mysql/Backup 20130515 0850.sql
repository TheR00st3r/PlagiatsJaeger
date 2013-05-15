-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 15. Mai 2013 um 08:49
-- Server Version: 5.5.31
-- PHP-Version: 5.4.6-1ubuntu1.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `plagiatsjaeger`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `cID` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(256) NOT NULL,
  `cNumber` int(11) NOT NULL,
  `cAdmin` int(11) DEFAULT NULL,
  PRIMARY KEY (`cID`),
  UNIQUE KEY `cNumber` (`cNumber`),
  KEY `cAdmin` (`cAdmin`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `client`
--

INSERT INTO `client` (`cID`, `cName`, `cNumber`, `cAdmin`) VALUES
(1, 'System Administrator', 500, 2),
(2, 'DHBW Stuttgart Campus Horb', 1000, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `document`
--

CREATE TABLE IF NOT EXISTS `document` (
  `dID` int(11) NOT NULL AUTO_INCREMENT,
  `dOriginalName` varchar(256) NOT NULL,
  `dAuthor` varchar(256) NOT NULL,
  `dIsParsed` tinyint(1) NOT NULL DEFAULT '0',
  `fID` int(11) NOT NULL,
  PRIMARY KEY (`dID`),
  KEY `uID` (`fID`),
  KEY `fID` (`fID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Zuständig für das Speichern von Dokumentdaten' AUTO_INCREMENT=33 ;

--
-- Daten für Tabelle `document`
--

INSERT INTO `document` (`dID`, `dOriginalName`, `dAuthor`, `dIsParsed`, `fID`) VALUES
(21, 'testfile4.txt', '', 0, 13),
(22, 'testfile4.txt', '', 0, 13),
(23, 'Schnelltest Upload', '', 0, 10),
(24, 'Schnelltest Upload', 'Andy', 0, 6),
(25, 'Schnelltest Upload', 'wiki', 0, 14),
(26, 'Schnelltest Upload', 'Andy', 0, 15),
(27, 'Schnelltest Upload', 'Andy', 0, 15),
(28, 'Die Festung Rosenberg.docx', '', 0, 15),
(29, 'Die Festung Rosenberg.docx', '', 0, 10),
(30, 'Schnelltest Upload', 'wiki - Festung Rosenberg', 0, 13),
(31, 'Die Festung Rosenberg.docx', '2', 0, 10),
(32, 'Marketing.docx', 'Andy', 0, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `errorcode`
--

CREATE TABLE IF NOT EXISTS `errorcode` (
  `eID` int(11) NOT NULL,
  `eName` varchar(50) NOT NULL,
  `eDescription` text NOT NULL,
  PRIMARY KEY (`eID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `errorcode`
--

INSERT INTO `errorcode` (`eID`, `eName`, `eDescription`) VALUES
(100, 'Created', 'Die Plagiatsprüfung wurde erstellt.'),
(200, 'Started', 'Die Plagiatsprüfung wurde gestartet.'),
(300, 'Successful', 'Die Plagiatsprüfung war erfolgreich.'),
(400, 'Error', 'Die Plagiatsprüfung ist fehlgeschlagen.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `folder`
--

CREATE TABLE IF NOT EXISTS `folder` (
  `fID` int(11) NOT NULL AUTO_INCREMENT,
  `fName` varchar(256) NOT NULL,
  `fHashLink` varchar(256) NOT NULL,
  `fLinkExpireDatetime` datetime DEFAULT NULL,
  `fParentID` int(11) DEFAULT NULL,
  `fThreshold` int(11) DEFAULT NULL,
  `fCheckWWW` tinyint(1) DEFAULT NULL,
  `slID` int(11) DEFAULT NULL,
  PRIMARY KEY (`fID`),
  KEY `fParentID` (`fParentID`),
  KEY `fParentID_2` (`fParentID`),
  KEY `slID` (`slID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Spiegelt Ordner Hierarchie wieder' AUTO_INCREMENT=16 ;

--
-- Daten für Tabelle `folder`
--

INSERT INTO `folder` (`fID`, `fName`, `fHashLink`, `fLinkExpireDatetime`, `fParentID`, `fThreshold`, `fCheckWWW`, `slID`) VALUES
(6, 'Test', '', NULL, NULL, 0, 0, 1),
(7, 'Test2', '', NULL, NULL, 0, 0, 1),
(8, 'kjh', '', NULL, 7, 0, 0, 1),
(9, 'lÃ¶j', '', NULL, 7, 0, 0, 1),
(10, 'Klaus222', '', NULL, NULL, NULL, NULL, NULL),
(11, '				2012			', '', NULL, 10, NULL, NULL, NULL),
(12, '				Gebe Timo frei			', '', NULL, NULL, NULL, NULL, NULL),
(13, '				test123			', '', NULL, NULL, NULL, NULL, NULL),
(14, 'SoftwareEngineering_Mark', '', NULL, NULL, NULL, NULL, NULL),
(15, 'C Sharp', '', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `folderpermission`
--

CREATE TABLE IF NOT EXISTS `folderpermission` (
  `fpID` int(11) NOT NULL AUTO_INCREMENT,
  `fpPermissionLevel` int(11) NOT NULL,
  `fID` int(11) NOT NULL,
  `uID` int(11) NOT NULL,
  PRIMARY KEY (`fpID`),
  UNIQUE KEY `fID_2` (`fID`,`uID`),
  KEY `fID` (`fID`),
  KEY `uID` (`uID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Speichert Ordernberechtigungen' AUTO_INCREMENT=43 ;

--
-- Daten für Tabelle `folderpermission`
--

INSERT INTO `folderpermission` (`fpID`, `fpPermissionLevel`, `fID`, `uID`) VALUES
(2, 900, 6, 4),
(3, 900, 7, 4),
(5, 900, 8, 4),
(6, 900, 9, 4),
(22, 900, 10, 2),
(23, 900, 11, 2),
(27, 900, 12, 7),
(28, 700, 12, 2),
(29, 700, 11, 7),
(32, 700, 10, 7),
(33, 700, 10, 4),
(34, 700, 10, 3),
(35, 900, 13, 3),
(37, 700, 13, 2),
(38, 900, 14, 3),
(39, 700, 14, 2),
(40, 700, 6, 3),
(41, 900, 15, 4),
(42, 700, 15, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `report`
--

CREATE TABLE IF NOT EXISTS `report` (
  `rID` int(11) NOT NULL AUTO_INCREMENT,
  `rDatetime` datetime NOT NULL,
  `rErrorCode` int(11) NOT NULL,
  `rThreshold` int(11) NOT NULL,
  `rCheckWWW` tinyint(1) NOT NULL,
  `slID` int(11) NOT NULL,
  `dID` int(11) NOT NULL,
  PRIMARY KEY (`rID`),
  KEY `dID` (`dID`),
  KEY `rErrorCode` (`rErrorCode`),
  KEY `slID` (`slID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Zuständig für das Speichern von Berichten' AUTO_INCREMENT=64 ;

--
-- Daten für Tabelle `report`
--

INSERT INTO `report` (`rID`, `rDatetime`, `rErrorCode`, `rThreshold`, `rCheckWWW`, `slID`, `dID`) VALUES
(44, '2013-05-12 21:05:22', 100, 1, 1, 1, 21),
(45, '2013-05-12 22:05:42', 100, 50, 1, 1, 21),
(46, '2013-05-12 22:05:06', 100, 50, 1, 2, 21),
(47, '2013-05-12 22:05:53', 100, 50, 1, 1, 21),
(48, '2013-05-12 22:05:03', 100, 50, 1, 2, 21),
(49, '2013-05-13 13:05:21', 100, 50, 1, 1, 22),
(50, '2013-05-13 13:05:13', 100, 50, 1, 1, 22),
(51, '2013-05-13 17:05:00', 100, 50, 1, 2, 23),
(52, '2013-05-14 15:05:50', 100, 90, 1, 1, 24),
(53, '2013-05-14 15:05:22', 100, 12, 1, 1, 24),
(54, '2013-05-14 15:05:42', 100, 50, 1, 1, 21),
(55, '2013-05-14 15:05:38', 100, 90, 1, 1, 24),
(56, '2013-05-14 15:05:00', 100, 50, 1, 2, 24),
(57, '2013-05-14 15:05:52', 100, 50, 1, 1, 25),
(58, '2013-05-14 15:05:32', 300, 90, 1, 2, 24),
(59, '2013-05-14 16:05:30', 200, 50, 1, 2, 25),
(60, '2013-05-14 16:05:13', 200, 52, 1, 2, 24),
(61, '2013-05-14 16:05:42', 300, 132, 1, 2, 24),
(62, '2013-05-14 17:05:47', 300, 50, 1, 1, 30),
(63, '2013-05-14 18:05:20', 300, 50, 1, 1, 30);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `result`
--

CREATE TABLE IF NOT EXISTS `result` (
  `rtID` int(11) NOT NULL AUTO_INCREMENT,
  `rtSourceText` text NOT NULL,
  `rtSourceLink` varchar(512) NOT NULL,
  `rtSourcedID` int(11) DEFAULT NULL,
  `rtStartWord` int(11) NOT NULL,
  `rtEndWord` int(11) NOT NULL,
  `rtSimilarity` decimal(5,2) NOT NULL,
  `rID` int(11) NOT NULL,
  PRIMARY KEY (`rtID`),
  KEY `dID` (`rID`),
  KEY `dID_2` (`rID`),
  KEY `rID` (`rID`),
  KEY `rtSourcedID` (`rtSourcedID`),
  KEY `rtSourcedID_2` (`rtSourcedID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Speichert Plagiatsverdächte ab' AUTO_INCREMENT=28 ;

--
-- Daten für Tabelle `result`
--

INSERT INTO `result` (`rtID`, `rtSourceText`, `rtSourceLink`, `rtSourcedID`, `rtStartWord`, `rtEndWord`, `rtSimilarity`, `rID`) VALUES
(1, 'Fr. Der Kampfer-Milchling (Lactarius camphoratus[1]) ist eine Pilz-Art aus der Familie der Täublingsverwandten (Russulaceae). Es ist ein kleiner bis ziemlich kleiner Milchling mit einem rotbraun bis dunkel kastanienbraunen Hut, einer wässrig-weißen Milch und mehr oder weniger zimtbraunen Lamellen. Beim Trocknen riecht der Milchling stark nach Kampfer oder „Maggi" und wird daher auch als Würzpilz verwendet. Trotz seines relativ milden Geschmacks gilt der Pilz als ungenießbar und wird nur zum Würzen verwendet. Man findet den Mykorrhizapilz zwischen Juni und November meist gesellig in Nadel- und Laubmischwäldern auf sauren, nährstoffarmen Böden. Inhaltsverzeichnis', 'http://de.wikipedia.org/wiki/Kampfer-Milchling', NULL, 0, 89, 98.36, 55),
(2, 'Der Kampfer-Milchling (Lactarius camphoratus) ist eine Pilz-Art aus der Familie der Täublingsartigen (Russulaceae). Es ist ein kleiner bis ziemlich kleiner Milchling mit einem rotbraun bis dunkel kastanienbraunen Hut, einer wässrig-weißen Milch und mehr oder weniger zimtbraunen Lamellen. Beim Trocknen riecht der Milchling stark nach Kampfer oder „Maggi" und wird daher auch als Würzpilz verwendet. Trotz seines relativ milden Geschmacks gilt der Pilz als ungenießbar und wird nur zum Würzen verwendet. Man findet den Mykorrhizapilz zwischen Juni und November meist gesellig in Nadel- und Laubmischwäldern auf sauren, nährstoffarmen Böden. Der', 'http://de.inforapid.org/index.php?search=W%C3%A4ssriger%20Milchling', NULL, 0, 89, 97.97, 55),
(3, 'Fr. Der Kampfer-Milchling (Lactarius camphoratus[1]) ist eine Pilz-Art aus der Familie der Täublingsverwandten (Russulaceae). Es ist ein kleiner bis ziemlich kleiner Milchling mit einem rotbraun bis dunkel kastanienbraunen Hut, einer wässrig-weißen Milch und mehr oder weniger zimtbraunen Lamellen. Beim Trocknen riecht der Milchling stark nach Kampfer oder „Maggi" und wird daher auch als Würzpilz verwendet. Trotz seines relativ milden Geschmacks gilt der Pilz als ungenießbar und wird nur zum Würzen verwendet. Man findet den Mykorrhizapilz zwischen Juni und November meist gesellig in Nadel- und Laubmischwäldern auf sauren, nährstoffarmen Böden. Inhaltsverzeichnis', 'http://de.wikipedia.org/wiki/Kampfermilchling', NULL, 0, 89, 98.36, 55),
(4, 'Der Kampfer-Milchling (Lactarius camphoratus) ist eine Pilz-Art aus der Familie der Täublingsartigen (Russulaceae). Es ist ein kleiner bis ziemlich kleiner Milchling mit einem rotbraun bis dunkel kastanienbraunen Hut, einer wässrig-weißen Milch und mehr oder weniger zimtbraunen Lamellen. Beim Trocknen riecht der Milchling stark nach Kampfer oder „Maggi" und wird daher auch als Würzpilz verwendet. Trotz seines relativ milden Geschmacks gilt der Pilz als ungenießbar und wird nur zum Würzen verwendet. Man findet den Mykorrhizapilz zwischen Juni und November meist gesellig in Nadel- und Laubmischwäldern auf sauren, nährstoffarmen Böden. Der', 'http://de.inforapid.org/index.php?search=Liebst%C3%B6ckel', NULL, 0, 89, 97.97, 55),
(5, 'Fr. Der Kampfer-Milchling (Lactarius camphoratus[1]) ist eine Pilz-Art aus der Familie der Täublingsverwandten (Russulaceae). Es ist ein kleiner bis ziemlich kleiner Milchling mit einem rotbraun bis dunkel kastanienbraunen Hut, einer wässrig-weißen Milch und mehr oder weniger zimtbraunen Lamellen. Beim Trocknen riecht der Milchling stark nach Kampfer oder „Maggi" und wird daher auch als Würzpilz verwendet. Trotz seines relativ milden Geschmacks gilt der Pilz als ungenießbar und wird nur zum Würzen verwendet. Man findet den Mykorrhizapilz zwischen Juni und November meist gesellig in Nadel- und Laubmischwäldern auf sauren, nährstoffarmen Böden. Inhaltsverzeichnis', 'http://de.wikipedia.org/wiki/Kampfer-Milchling', NULL, 0, 89, 98.36, 56),
(6, 'Fr. Der Kampfer-Milchling (Lactarius camphoratus[1]) ist eine Pilz-Art aus der Familie der Täublingsverwandten (Russulaceae). Es ist ein kleiner bis ziemlich kleiner Milchling mit einem rotbraun bis dunkel kastanienbraunen Hut, einer wässrig-weißen Milch und mehr oder weniger zimtbraunen Lamellen. Beim Trocknen riecht der Milchling stark nach Kampfer oder „Maggi" und wird daher auch als Würzpilz verwendet. Trotz seines relativ milden Geschmacks gilt der Pilz als ungenießbar und wird nur zum Würzen verwendet. Man findet den Mykorrhizapilz zwischen Juni und November meist gesellig in Nadel- und Laubmischwäldern auf sauren, nährstoffarmen Böden. Inhaltsverzeichnis', 'http://de.wikipedia.org/wiki/Kampfermilchling', NULL, 0, 89, 98.36, 56),
(7, 'Der Kampfer-Milchling (Lactarius camphoratus) ist eine Pilz-Art aus der Familie der Täublingsartigen (Russulaceae). Es ist ein kleiner bis ziemlich kleiner Milchling mit einem rotbraun bis dunkel kastanienbraunen Hut, einer wässrig-weißen Milch und mehr oder weniger zimtbraunen Lamellen. Beim Trocknen riecht der Milchling stark nach Kampfer oder „Maggi" und wird daher auch als Würzpilz verwendet. Trotz seines relativ milden Geschmacks gilt der Pilz als ungenießbar und wird nur zum Würzen verwendet. Man findet den Mykorrhizapilz zwischen Juni und November meist gesellig in Nadel- und Laubmischwäldern auf sauren, nährstoffarmen Böden. Der', 'http://de.inforapid.org/index.php?search=W%C3%A4ssriger%20Milchling', NULL, 0, 89, 97.97, 56),
(8, 'Fr. Der Kampfer-Milchling (Lactarius camphoratus[1]) ist eine Pilz-Art aus der Familie der Täublingsverwandten (Russulaceae). Es ist ein kleiner bis ziemlich kleiner Milchling mit einem rotbraun bis dunkel kastanienbraunen Hut, einer wässrig-weißen Milch und mehr oder weniger zimtbraunen Lamellen. Beim Trocknen riecht der Milchling stark nach Kampfer oder „Maggi" und wird daher auch als Würzpilz verwendet. Trotz seines relativ milden Geschmacks gilt der Pilz als ungenießbar und wird nur zum Würzen verwendet. Man findet den Mykorrhizapilz zwischen Juni und November meist gesellig in Nadel- und Laubmischwäldern auf sauren, nährstoffarmen Böden. Inhaltsverzeichnis', 'http://de.wikipedia.org/wiki/Kampfer-Milchling', NULL, 0, 89, 98.36, 58),
(9, 'Fr. Der Kampfer-Milchling (Lactarius camphoratus[1]) ist eine Pilz-Art aus der Familie der Täublingsverwandten (Russulaceae). Es ist ein kleiner bis ziemlich kleiner Milchling mit einem rotbraun bis dunkel kastanienbraunen Hut, einer wässrig-weißen Milch und mehr oder weniger zimtbraunen Lamellen. Beim Trocknen riecht der Milchling stark nach Kampfer oder „Maggi" und wird daher auch als Würzpilz verwendet. Trotz seines relativ milden Geschmacks gilt der Pilz als ungenießbar und wird nur zum Würzen verwendet. Man findet den Mykorrhizapilz zwischen Juni und November meist gesellig in Nadel- und Laubmischwäldern auf sauren, nährstoffarmen Böden. Inhaltsverzeichnis', 'http://de.wikipedia.org/wiki/Kampfermilchling', NULL, 0, 89, 98.36, 58),
(10, 'Der Kampfer-Milchling (Lactarius camphoratus) ist eine Pilz-Art aus der Familie der Täublingsartigen (Russulaceae). Es ist ein kleiner bis ziemlich kleiner Milchling mit einem rotbraun bis dunkel kastanienbraunen Hut, einer wässrig-weißen Milch und mehr oder weniger zimtbraunen Lamellen. Beim Trocknen riecht der Milchling stark nach Kampfer oder „Maggi" und wird daher auch als Würzpilz verwendet. Trotz seines relativ milden Geschmacks gilt der Pilz als ungenießbar und wird nur zum Würzen verwendet. Man findet den Mykorrhizapilz zwischen Juni und November meist gesellig in Nadel- und Laubmischwäldern auf sauren, nährstoffarmen Böden. Der', 'http://de.inforapid.org/index.php?search=Liebst%C3%B6ckel', NULL, 0, 89, 97.97, 58),
(11, 'Max war der Sohn des Privatbaumeisters und Fabrikbesitzers Franz Bastian und trat nach dem Besuch des Königlichen Gymnasiums in Spandau[1]. am 1. April 1902 als Seekadett in die Kaiserliche Marine ein. Er absolvierte seine Schiffsausbildung auf der Kreuzerfregatte SMS Moltke und kam anschließend an die Marineschule (siehe auch Marineakademie und -schule (Kiel)). Nach Abschluss der Ausbildung erfolgte am 1. Oktober 1904 seine Versetzung zum Ostasiengeschwader; er versah dort Dienst auf dem Großen Kreuzer SMS Hansa. Am 29. September 1905 erfolgte seine Beförderung zum Leutnant zur See und ab Oktober 1905 wurde Bastian als Wachoffizier auf dem Kanonenboot SMS Luchs eingesetzt. Nach seiner Rückkehr nach Deutschland kam er am 21. November 1906 zunächst an Bord des Linienschiffes SMS Schwaben und wurde am 4. April 1907 als Wachoffizier auf das Linienschiff SMS Kaiser Friedrich III. versetzt. In gleicher Funktion wechselte Bastian am 1. Oktober auf das Linienschiff SMS Kaiser Barbarossa und wurde hier am 15. Oktober 1907 zum Oberleutnant zur See befördert. Vom 1. Oktober 1908 bis 14. September 1910 war er dann Kompanieoffizier in der I. Abteilung der Schiffsstammdivision, um anschließend bis 30. September 1912 als Wachoffizier auf dem Linienschiff SMS Preußen eingesetzt zu werden. Bis 30. Juni 1914 folgt eine Kommandierung an die Marineakademie in Kiel und seine zwischenzeitliche Beförderung am 22. März 1913 zum Kapitänleutnant. Für einen Monat wurde er dann zur Disposition gestellt und mit Ausbruch des Ersten Weltkriegs als Wachoffizier auf den Kleinen Kreuzer SMS Amazone versetzt. Ab 23. Oktober 1914 erfolgte seine Verwendung zunächst als Flagg-, dann als Admiralstabsoffizier in verschiedenen Stäben der Ostsee. Am 17. November 1916 wurde sein Sohn Helmut geboren, der wie sein Vater eine Marinelaufbahn einschlug. Nach', 'http://de.wikipedia.org/wiki/Max_Bastian', NULL, 0, 276, 99.87, 59),
(12, 'Max war der Sohn des Privatbaumeisters und Fabrikbesitzers Franz Bastian und trat nach dem Besuch des Königlichen Gymnasium in Spandau. am 1. April 1902 als Seekadett in die Kaiserliche Marine ein. Er absolvierte seine Schiffsausbildung auf der Kreuzerfregatte SMS Moltke und kam anschließend an die Marineschule. Nach Abschluss', 'http://de.inforapid.org/index.php?search=SMS%20Kaiser%20Friedrich%20III.', NULL, 0, 48, 97.86, 59),
(13, '1. Oktober 1904 seine Versetzung zum Ostasiengeschwader und er versah dort Dienst auf dem Großen Kreuzer SMS Hansa. Am 29. September 1905 erfolgte seine Beförderung zum Leutnant zur See und ab Oktober 1905 wurde Bastian als Wachoffizier auf dem Kanonenboot SMS Luchs eingesetzt. Nach seiner Rückkehr nach Deutschland kam er am 21. November 1906 zunächst an Bord des Linienschiffes SMS Schwaben und wurde am 4. April 1907 als Wachoffizier auf das Linienschiff SMS Kaiser Friedrich III. versetzt. In gleicher Funktion wechselte Bastian am 1. Oktober auf das Linienschiff SMS Kaiser Barbarossa und wurde hier am 15. Oktober 1907 zum Oberleutnant zur See befördert. Vom 1. Oktober 1908 bis 14. September 1910 war er dann Kompanieoffizier in der I. Abteilung der Schiffsstammdivision, um anschließend bis 30. September 1912 als Wachoffizier auf dem Linienschiff SMS Preußen eingesetzt zu werden. Bis 30. Juni 1914 folgt eine Kommandierung an die Marineakademie in Kiel und seine zwischenzeitliche Beförderung am 22. März 1913 zum Kapitänleutnant. SMS Hildebrand', 'http://de.inforapid.org/index.php?search=SMS%20Kaiser%20Friedrich%20III.', NULL, 58, 218, 96.52, 59),
(14, 'Max war der Sohn des Privatbaumeisters und Fabrikbesitzers Franz Bastian und trat nach dem Besuch des Königlichen Gymnasium in Spandau. am 1. April 1902 als Seekadett in die Kaiserliche Marine ein. Er absolvierte seine Schiffsausbildung auf der Kreuzerfregatte SMS Moltke und kam anschließend an die Marineschule. Nach Abschluss', 'http://de.inforapid.org/index.php?search=Reichskriegsgericht', NULL, 0, 48, 97.86, 59),
(15, '1. Oktober 1904 seine Versetzung zum Ostasiengeschwader und er versah dort Dienst auf dem Großen Kreuzer SMS Hansa. Am 29. September 1905 erfolgte seine Beförderung zum Leutnant zur See und ab Oktober 1905 wurde Bastian als Wachoffizier auf dem Kanonenboot SMS Luchs eingesetzt. Nach seiner Rückkehr nach Deutschland kam er am 21. November 1906 zunächst an Bord des Linienschiffes SMS Schwaben und wurde am 4. April 1907 als Wachoffizier auf das Linienschiff SMS Kaiser Friedrich III. versetzt. In gleicher Funktion wechselte Bastian am 1. Oktober auf das Linienschiff SMS Kaiser Barbarossa und wurde hier am 15. Oktober 1907 zum Oberleutnant zur See befördert. Vom 1. Oktober 1908 bis 14. September 1910 war er dann Kompanieoffizier in der I. Abteilung der Schiffsstammdivision, um anschließend bis 30. September 1912 als Wachoffizier auf dem Linienschiff SMS Preußen eingesetzt zu werden. Bis 30. Juni 1914 folgt eine Kommandierung an die Marineakademie in Kiel und seine zwischenzeitliche Beförderung am 22. März 1913 zum Kapitänleutnant. Erich Lattmann', 'http://de.inforapid.org/index.php?search=Reichskriegsgericht', NULL, 58, 218, 96.52, 59),
(16, 'Max war der Sohn des Privatbaumeisters und Fabrikbesitzers Franz Bastian und trat nach dem Besuch des Königlichen Gymnasium in Spandau. am 1. April 1902 als Seekadett in die Kaiserliche Marine ein. Er absolvierte seine Schiffsausbildung auf der Kreuzerfregatte SMS Moltke und kam anschließend an die Marineschule. Nach Abschluss', 'http://de.inforapid.org/index.php?search=Z.%20D.%20%28Milit%C3%A4rsprache%29', NULL, 0, 48, 97.86, 59),
(17, '1. Oktober 1904 seine Versetzung zum Ostasiengeschwader und er versah dort Dienst auf dem Großen Kreuzer SMS Hansa. Am 29. September 1905 erfolgte seine Beförderung zum Leutnant zur See und ab Oktober 1905 wurde Bastian als Wachoffizier auf dem Kanonenboot SMS Luchs eingesetzt. Nach seiner Rückkehr nach Deutschland kam er am 21. November 1906 zunächst an Bord des Linienschiffes SMS Schwaben und wurde am 4. April 1907 als Wachoffizier auf das Linienschiff SMS Kaiser Friedrich III. versetzt. In gleicher Funktion wechselte Bastian am 1. Oktober auf das Linienschiff SMS Kaiser Barbarossa und wurde hier am 15. Oktober 1907 zum Oberleutnant zur See befördert. Vom 1. Oktober 1908 bis 14. September 1910 war er dann Kompanieoffizier in der I. Abteilung der Schiffsstammdivision, um anschließend bis 30. September 1912 als Wachoffizier auf dem Linienschiff SMS Preußen eingesetzt zu werden. Bis 30. Juni 1914 folgt eine Kommandierung an die Marineakademie in Kiel und seine zwischenzeitliche Beförderung am 22. März 1913 zum Kapitänleutnant. À la suite', 'http://de.inforapid.org/index.php?search=Z.%20D.%20%28Milit%C3%A4rsprache%29', NULL, 58, 219, 96.51, 59),
(18, 'Fr. Der Kampfer-Milchling (Lactarius camphoratus[1]) ist eine Pilz-Art aus der Familie der Täublingsverwandten (Russulaceae). Es ist ein kleiner bis ziemlich kleiner Milchling mit einem rotbraun bis dunkel kastanienbraunen Hut, einer wässrig-weißen Milch und mehr oder weniger zimtbraunen Lamellen. Beim Trocknen riecht der Milchling stark nach Kampfer oder „Maggi" und wird daher auch als Würzpilz verwendet. Trotz seines relativ milden Geschmacks gilt der Pilz als ungenießbar und wird nur zum Würzen verwendet. Man findet den Mykorrhizapilz zwischen Juni und November meist gesellig in Nadel- und Laubmischwäldern auf sauren, nährstoffarmen Böden. Inhaltsverzeichnis', 'http://de.wikipedia.org/wiki/Kampfer-Milchling', NULL, 0, 89, 98.36, 60),
(19, 'Der Kampfer-Milchling (Lactarius camphoratus) ist eine Pilz-Art aus der Familie der Täublingsartigen (Russulaceae). Es ist ein kleiner bis ziemlich kleiner Milchling mit einem rotbraun bis dunkel kastanienbraunen Hut, einer wässrig-weißen Milch und mehr oder weniger zimtbraunen Lamellen. Beim Trocknen riecht der Milchling stark nach Kampfer oder „Maggi" und wird daher auch als Würzpilz verwendet. Trotz seines relativ milden Geschmacks gilt der Pilz als ungenießbar und wird nur zum Würzen verwendet. Man findet den Mykorrhizapilz zwischen Juni und November meist gesellig in Nadel- und Laubmischwäldern auf sauren, nährstoffarmen Böden. Der', 'http://de.inforapid.org/index.php?search=Liebst%C3%B6ckel', NULL, 0, 89, 97.97, 60),
(20, 'Fr. Der Kampfer-Milchling (Lactarius camphoratus[1]) ist eine Pilz-Art aus der Familie der Täublingsverwandten (Russulaceae). Es ist ein kleiner bis ziemlich kleiner Milchling mit einem rotbraun bis dunkel kastanienbraunen Hut, einer wässrig-weißen Milch und mehr oder weniger zimtbraunen Lamellen. Beim Trocknen riecht der Milchling stark nach Kampfer oder „Maggi" und wird daher auch als Würzpilz verwendet. Trotz seines relativ milden Geschmacks gilt der Pilz als ungenießbar und wird nur zum Würzen verwendet. Man findet den Mykorrhizapilz zwischen Juni und November meist gesellig in Nadel- und Laubmischwäldern auf sauren, nährstoffarmen Böden. Inhaltsverzeichnis', 'http://de.wikipedia.org/wiki/Kampfer-Milchling', NULL, 0, 89, 98.36, 61),
(21, 'Der Kampfer-Milchling (Lactarius camphoratus) ist eine Pilz-Art aus der Familie der Täublingsartigen (Russulaceae). Es ist ein kleiner bis ziemlich kleiner Milchling mit einem rotbraun bis dunkel kastanienbraunen Hut, einer wässrig-weißen Milch und mehr oder weniger zimtbraunen Lamellen. Beim Trocknen riecht der Milchling stark nach Kampfer oder „Maggi" und wird daher auch als Würzpilz verwendet. Trotz seines relativ milden Geschmacks gilt der Pilz als ungenießbar und wird nur zum Würzen verwendet. Man findet den Mykorrhizapilz zwischen Juni und November meist gesellig in Nadel- und Laubmischwäldern auf sauren, nährstoffarmen Böden. Der', 'http://de.inforapid.org/index.php?search=Liebst%C3%B6ckel', NULL, 0, 89, 97.97, 61),
(22, 'Die Festung Rosenberg (auch Veste Rosenberg) ist eine von barocken Befestigungen umgebene Burganlage über der oberfränkischen Stadt Kronach. Sie ist eine der am besten erhaltenen Festungen in Bayern und wurde in ihrer langen Geschichte, deren nachweisbare Ursprünge ins 13. Jahrhundert zurückreichen, nie gewaltsam erobert.[1][2] Neben der Festung Forchheim war sie eine der beiden Landesfestungen der Fürstbischöfe von Bamberg, die den Rosenberg im Laufe der Jahrhunderte von einer mittelalterlichen Schutzburg zum Renaissanceschloss und später zum neuzeitlichen Festungskomplex ausbauten. Mit ihren zahlreichen Bauabschnitten gilt die Anlage als herausragendes Beispiel für die Entwicklung des Wehrbaus in Deutschland.[2] Einschließlich Wallgräben und Vorwerken umfasst die überbaute Fläche etwa 8,5 ha,[3] zusammen mit den ehemaligen Erdwerken im nördlichen Vorfeld betrug das', 'http://de.wikipedia.org/wiki/Festung_Rosenberg', NULL, 0, 116, 97.45, 62),
(23, 'Die Festung Rosenberg (auch Veste Rosenberg) ist eine von barocken Befestigungen umgebene Burganlage über der oberfränkischen Stadt Kronach. Sie ist eine der am besten erhaltenen Festungen in Bayern und wurde in ihrer langen Geschichte, deren nachweisbare Ursprünge ins 13. Jahrhundert zurückreichen, nie gewaltsam erobert.[1][2] Neben der Festung Forchheim war sie eine der beiden Landesfestungen der Fürstbischöfe von Bamberg, die den Rosenberg im Laufe der Jahrhunderte von einer mittelalterlichen Schutzburg zum Renaissanceschloss und später zum neuzeitlichen Festungskomplex ausbauten. Mit ihren zahlreichen Bauabschnitten gilt die Anlage als herausragendes Beispiel für die Entwicklung des Wehrbaus in Deutschland.[2] Einschließlich Wallgräben und Vorwerken umfasst die überbaute Fläche etwa 8,5 ha,[3] zusammen mit den ehemaligen Erdwerken im nördlichen Vorfeld betrug das', 'http://de.wikipedia.org/wiki/Veste_Rosenberg', NULL, 0, 116, 97.45, 62),
(24, 'Die Festung Rosenberg (auch Veste Rosenberg) ist eine von barocken Befestigungen umgebene Burganlage über der oberfränkischen Stadt Kronach. Sie ist eine der am besten erhaltenen Festungen in Bayern und wurde in ihrer langen Geschichte, deren nachweisbare Ursprünge ins 13. Jahrhundert zurückreichen, nie gewaltsam erobert. Neben der Festung Forchheim war sie eine der beiden Landesfestungen der Fürstbischöfe von Bamberg, die den Rosenberg im Laufe der Jahrhunderte von einer mittelalterlichen Schutzburg zum Renaissanceschloss und später zum neuzeitlichen Festungskomplex ausbauten. Mit ihren zahlreichen Bauabschnitten gilt die Anlage als herausragendes Beispiel für die Entwicklung des Wehrbaus in Deutschland. Einschließlich Wallgräben und Vorwerken umfasst die überbaute Fläche etwa 8,5 Hektar, zusammen mit den ehemaligen Erdwerken im nördlichen Vorfeld betrug das befestigte Terrain einst', 'http://de.wikipedia.org/wiki/Portal:Burgen_und_Schl%C3%B6sser/exzellente_Artikel', NULL, 0, 119, 96.42, 62),
(25, 'Die Festung Rosenberg (auch Veste Rosenberg) ist eine von barocken Befestigungen umgebene Burganlage über der oberfränkischen Stadt Kronach. Sie ist eine der am besten erhaltenen Festungen in Bayern und wurde in ihrer langen Geschichte, deren nachweisbare Ursprünge ins 13. Jahrhundert zurückreichen, nie gewaltsam erobert.[1][2] Neben der Festung Forchheim war sie eine der beiden Landesfestungen der Fürstbischöfe von Bamberg, die den Rosenberg im Laufe der Jahrhunderte von einer mittelalterlichen Schutzburg zum Renaissanceschloss und später zum neuzeitlichen Festungskomplex ausbauten. Mit ihren zahlreichen Bauabschnitten gilt die Anlage als herausragendes Beispiel für die Entwicklung des Wehrbaus in Deutschland.[2] Einschließlich Wallgräben und Vorwerken umfasst die überbaute Fläche etwa 8,5 ha,[3] zusammen mit den ehemaligen Erdwerken im nördlichen Vorfeld betrug das', 'http://de.wikipedia.org/wiki/Festung_Rosenberg', NULL, 0, 116, 97.45, 63),
(26, 'Die Festung Rosenberg (auch Veste Rosenberg) ist eine von barocken Befestigungen umgebene Burganlage über der oberfränkischen Stadt Kronach. Sie ist eine der am besten erhaltenen Festungen in Bayern und wurde in ihrer langen Geschichte, deren nachweisbare Ursprünge ins 13. Jahrhundert zurückreichen, nie gewaltsam erobert.[1][2] Neben der Festung Forchheim war sie eine der beiden Landesfestungen der Fürstbischöfe von Bamberg, die den Rosenberg im Laufe der Jahrhunderte von einer mittelalterlichen Schutzburg zum Renaissanceschloss und später zum neuzeitlichen Festungskomplex ausbauten. Mit ihren zahlreichen Bauabschnitten gilt die Anlage als herausragendes Beispiel für die Entwicklung des Wehrbaus in Deutschland.[2] Einschließlich Wallgräben und Vorwerken umfasst die überbaute Fläche etwa 8,5 ha,[3] zusammen mit den ehemaligen Erdwerken im nördlichen Vorfeld betrug das', 'http://de.wikipedia.org/wiki/Veste_Rosenberg', NULL, 0, 116, 97.45, 63),
(27, 'Die Festung Rosenberg (auch Veste Rosenberg) ist eine von barocken Befestigungen umgebene Burganlage über der oberfränkischen Stadt Kronach. Sie ist eine der am besten erhaltenen Festungen in Bayern und wurde in ihrer langen Geschichte, deren nachweisbare Ursprünge ins 13. Jahrhundert zurückreichen, nie gewaltsam erobert. Neben der Festung Forchheim war sie eine der beiden Landesfestungen der Fürstbischöfe von Bamberg, die den Rosenberg im Laufe der Jahrhunderte von einer mittelalterlichen Schutzburg zum Renaissanceschloss und später zum neuzeitlichen Festungskomplex ausbauten. Mit ihren zahlreichen Bauabschnitten gilt die Anlage als herausragendes Beispiel für die Entwicklung des Wehrbaus in Deutschland. Einschließlich Wallgräben und Vorwerken umfasst die überbaute Fläche etwa 8,5 Hektar, zusammen mit den ehemaligen Erdwerken im nördlichen Vorfeld betrug das befestigte Terrain einst', 'http://de.wikipedia.org/wiki/Portal:Burgen_und_Schl%C3%B6sser/exzellente_Artikel', NULL, 0, 119, 96.42, 63);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `settinglevel`
--

CREATE TABLE IF NOT EXISTS `settinglevel` (
  `slID` int(11) NOT NULL AUTO_INCREMENT,
  `slTitle` varchar(256) NOT NULL,
  `slSearchSentenceLength` int(11) NOT NULL,
  `slSearchJumpLength` int(11) NOT NULL,
  `slCompareSentenceLength` int(11) NOT NULL,
  `slCompareJumpLength` int(11) NOT NULL,
  PRIMARY KEY (`slID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `settinglevel`
--

INSERT INTO `settinglevel` (`slID`, `slTitle`, `slSearchSentenceLength`, `slSearchJumpLength`, `slCompareSentenceLength`, `slCompareJumpLength`) VALUES
(1, 'Normal', 10, 5, 10, 5),
(2, 'Schnell', 15, 10, 15, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uID` int(11) NOT NULL AUTO_INCREMENT,
  `uName` varchar(256) NOT NULL,
  `uLastname` varchar(256) NOT NULL,
  `uEMailAdress` varchar(256) NOT NULL,
  `uPassword` varchar(256) NOT NULL,
  `uRestoreKey` varchar(32) NOT NULL,
  `uRestoreEndDate` date DEFAULT NULL,
  `uPermissonLevel` int(11) NOT NULL,
  `uThreshold` int(11) NOT NULL,
  `uCheckWWW` tinyint(1) NOT NULL,
  `slID` int(11) NOT NULL,
  `cID` int(11) NOT NULL,
  PRIMARY KEY (`uID`),
  KEY `cID` (`cID`),
  KEY `slID` (`slID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Speichert Nutzer ab' AUTO_INCREMENT=20 ;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`uID`, `uName`, `uLastname`, `uEMailAdress`, `uPassword`, `uRestoreKey`, `uRestoreEndDate`, `uPermissonLevel`, `uThreshold`, `uCheckWWW`, `slID`, `cID`) VALUES
(1, 'Antonius', 'van Hoof', 'a.vanhoof@hb.dhbw-stuttgart.de', '098f6bcd4621d373cade4e832627b4f6', '', NULL, 500, 0, 0, 1, 2),
(2, 'Timo', 'Schneider', 'timo@schnti.de', '098f6bcd4621d373cade4e832627b4f6', '46acc1369e6b4d2bba6976adc2c77767', '2013-05-01', 500, 0, 0, 1, 1),
(3, 'Mark', 'Strecker', 'markstrecker1003@gmail.com', '098f6bcd4621d373cade4e832627b4f6', '', NULL, 500, 0, 0, 1, 1),
(4, 'Andreas', 'Hahn', 'andyhahn91@gmail.com', '098f6bcd4621d373cade4e832627b4f6', '', NULL, 500, 0, 0, 1, 1),
(7, 'Christian', 'Fischer', 'i11004@hb.dhbw-stuttgart.de', '25d55ad283aa400af464c76d713c07ad', '', '0000-00-00', 500, 0, 0, 1, 1),
(19, 'Max', 'Mustermann', 'max@mustermann.de', '25d55ad283aa400af464c76d713c07ad', '', NULL, 1, 0, 0, 1, 2);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`cAdmin`) REFERENCES `user` (`uID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `document_ibfk_2` FOREIGN KEY (`fID`) REFERENCES `folder` (`fID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `folder`
--
ALTER TABLE `folder`
  ADD CONSTRAINT `folder_ibfk_1` FOREIGN KEY (`fParentID`) REFERENCES `folder` (`fID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `folder_ibfk_3` FOREIGN KEY (`slID`) REFERENCES `settinglevel` (`slID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `folderpermission`
--
ALTER TABLE `folderpermission`
  ADD CONSTRAINT `folderpermission_ibfk_3` FOREIGN KEY (`fID`) REFERENCES `folder` (`fID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `folderpermission_ibfk_4` FOREIGN KEY (`uID`) REFERENCES `user` (`uID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`dID`) REFERENCES `document` (`dID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report_ibfk_3` FOREIGN KEY (`rErrorCode`) REFERENCES `errorcode` (`eID`),
  ADD CONSTRAINT `report_ibfk_4` FOREIGN KEY (`slID`) REFERENCES `settinglevel` (`slID`);

--
-- Constraints der Tabelle `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`rID`) REFERENCES `report` (`rID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`cID`) REFERENCES `client` (`cID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`slID`) REFERENCES `settinglevel` (`slID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
