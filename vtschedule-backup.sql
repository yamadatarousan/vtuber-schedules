-- MySQL dump 10.13  Distrib 9.2.0, for macos14.7 (x86_64)
--
-- Host: localhost    Database: vtschedule
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `id` varchar(50) NOT NULL,
  `vtuber_id` varchar(50) DEFAULT NULL,
  `type` enum('live','upcoming','archive') DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `concurrent_viewers` int DEFAULT NULL,
  `max_viewers` int DEFAULT NULL,
  `view_count` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `vtuber_id` (`vtuber_id`),
  CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`vtuber_id`) REFERENCES `vtubers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES ('_JHLX_DNlXc','UC1DCedRgGHBdm81E1llLhOQ','archive','【料理】「揚げバター」ついに作るぞ！！！！！！！！！！！！ぺこ！【ホロライブ/兎田ぺこら】','2025-05-04 22:07:34','https://youtube.com/watch?v=_JHLX_DNlXc','https://i.ytimg.com/vi/_JHLX_DNlXc/mqdefault.jpg',NULL,NULL,350709,'2025-05-07 07:56:48'),('-GqgRhvZlSE','UC1DCedRgGHBdm81E1llLhOQ','archive','【】兎田ぺこら、原付免許を取得する！！！！！ぺこ！【ホロライブ/兎田ぺこら】','2025-05-06 00:47:38','https://youtube.com/watch?v=-GqgRhvZlSE','https://i.ytimg.com/vi/-GqgRhvZlSE/mqdefault.jpg',NULL,NULL,331439,'2025-05-07 07:56:48'),('1xdtOh6ZWNE','UC1DCedRgGHBdm81E1llLhOQ','archive','【マリカ8DX】二時間以内に1位を取れなかったらバター1本丸ごと揚げて食べる！！！！！ぺこ！【ホロライブ/兎田ぺこら】','2025-04-30 21:16:28','https://youtube.com/watch?v=1xdtOh6ZWNE','https://i.ytimg.com/vi/1xdtOh6ZWNE/mqdefault.jpg',NULL,NULL,89598,'2025-05-07 07:56:48'),('2L3fM065aaM','UCdn5BQ06XqgXoAxIhbqw5Rg','archive','【モンハンワイルズ】歴戦王、襲来！！！！！レ・ダウがつよつよになったって本当ですか！？【白上フブキ/ホロライブ】','2025-05-01 22:07:56','https://youtube.com/watch?v=2L3fM065aaM','https://i.ytimg.com/vi/2L3fM065aaM/mqdefault.jpg',NULL,NULL,127564,'2025-05-07 07:56:48'),('4IFSnOI2vmw','UC1DCedRgGHBdm81E1llLhOQ','archive','【マリカ8DX】一時間以内に1位を2回取れなかったらマジで20時からバター1本丸ごと揚げて食べる！ぺこ！【ホロライブ/兎田ぺこら】','2025-05-04 20:20:07','https://youtube.com/watch?v=4IFSnOI2vmw','https://i.ytimg.com/vi/4IFSnOI2vmw/mqdefault.jpg',NULL,NULL,200303,'2025-05-07 07:56:48'),('C0CuKiWLDr0','UCdn5BQ06XqgXoAxIhbqw5Rg','archive','【FINAL FANTASY XIV】 ホロメンで挑む下限+超える力無し極タイタン討滅戦の道　最終日 【#HOLOXIV 白上フブキ視点】','2025-05-07 02:27:29','https://youtube.com/watch?v=C0CuKiWLDr0','https://i.ytimg.com/vi/C0CuKiWLDr0/mqdefault.jpg',NULL,NULL,226481,'2025-05-07 07:56:48'),('dFe8p_OiJ28','UC1DCedRgGHBdm81E1llLhOQ','upcoming','【配信予定】ぺっこおおおおおおおおおおおおおおおおおおおおぺこ！【ホロライブ/兎田ぺこら】','2025-05-07 20:00:00','https://youtube.com/watch?v=dFe8p_OiJ28','https://i.ytimg.com/vi/dFe8p_OiJ28/mqdefault_live.jpg',NULL,NULL,0,'2025-05-07 07:56:44'),('DuVkCqCzhsY','UCdn5BQ06XqgXoAxIhbqw5Rg','archive','【マリオメーカー２】絶対に矢印を信じちゃいけないマリメコース！！！！！！【白上フブキ/ホロライブ】','2025-05-05 18:21:15','https://youtube.com/watch?v=DuVkCqCzhsY','https://i.ytimg.com/vi/DuVkCqCzhsY/mqdefault.jpg',NULL,NULL,144607,'2025-05-07 07:56:48'),('Hx57-sJayLQ','UC1DCedRgGHBdm81E1llLhOQ','archive','【裁判】もしも兎田ぺこらが犯罪をおかしてしまったら・・・ぺこ！【ホロライブ/兎田ぺこら】','2025-05-06 22:58:31','https://youtube.com/watch?v=Hx57-sJayLQ','https://i.ytimg.com/vi/Hx57-sJayLQ/mqdefault.jpg',NULL,NULL,472169,'2025-05-07 07:56:48'),('MDwkJVqui_M','UCdn5BQ06XqgXoAxIhbqw5Rg','upcoming','ꕤ━　お知らせ/Information　━ꕤ','2027-01-31 00:00:00','https://youtube.com/watch?v=MDwkJVqui_M','https://i.ytimg.com/vi/MDwkJVqui_M/mqdefault_live.jpg',NULL,NULL,0,'2025-05-07 07:56:44'),('rKMhl43RHo0','UCdn5BQ06XqgXoAxIhbqw5Rg','upcoming','ＦｒｅｅＴａｌｋ','2027-01-31 00:00:00','https://youtube.com/watch?v=rKMhl43RHo0','https://i.ytimg.com/vi/rKMhl43RHo0/mqdefault_live.jpg',NULL,NULL,0,'2025-05-07 07:56:44'),('sNx6faND4Nw','UCiMG6VdScBabPhJ1ZtaVmbw','live','【雀魂】玉の間の様子を見にいきましょう【ぶいすぽ/花芽なずな】','2025-05-07 15:26:29','https://youtube.com/watch?v=sNx6faND4Nw','https://i.ytimg.com/vi/sNx6faND4Nw/mqdefault_live.jpg',NULL,NULL,11523,'2025-05-07 08:30:11'),('w7gEU8zdIVI','UCdn5BQ06XqgXoAxIhbqw5Rg','archive','【マリオメーカー２】マグナムキラーから逃げろに決着をつけたい！！！！【白上フブキ/ホロライブ】','2025-05-06 18:22:53','https://youtube.com/watch?v=w7gEU8zdIVI','https://i.ytimg.com/vi/w7gEU8zdIVI/mqdefault.jpg',NULL,NULL,134539,'2025-05-07 07:56:48'),('XYaPhqCBIp4','UCdn5BQ06XqgXoAxIhbqw5Rg','archive','【FINAL FANTASY XIV】 ホロメンで挑む下限+超える力無し極タイタン討滅戦の道　DAY2 【#HOLOXIV 白上フブキ視点】','2025-05-06 02:38:04','https://youtube.com/watch?v=XYaPhqCBIp4','https://i.ytimg.com/vi/XYaPhqCBIp4/mqdefault.jpg',NULL,NULL,219459,'2025-05-07 07:56:48');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vtubers`
--

DROP TABLE IF EXISTS `vtubers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vtubers` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `vtuber_group` varchar(50) DEFAULT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vtubers`
--

LOCK TABLES `vtubers` WRITE;
/*!40000 ALTER TABLE `vtubers` DISABLE KEYS */;
INSERT INTO `vtubers` VALUES ('UC1DCedRgGHBdm81E1llLhOQ','兎田ぺこら','hololive',NULL),('UC9V3Y3_uzU5xD0n7cHLZfq','星川サラ','nijisanji',NULL),('UCdn5BQ06XqgXoAxIhbqw5Rg','白上フブキ','hololive',NULL),('UCiMG6VdScBabPhJ1ZtaVmbw','花芽なずな','vspo',NULL);
/*!40000 ALTER TABLE `vtubers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-07 17:38:57
