-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: giorgoskellis
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Current Database: `giorgoskellis`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `giorgoskellis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `giorgoskellis`;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'╬Χ╬╕╬╜╬╣╬║╬χ ╬╡╬┐╧Β╧Ε╬χ','ethniki-eorti','2026-04-14 15:39:53','2026-04-14 15:39:53'),(2,'╬ε╬υ╧Θ╬╖ ╧Ε╧Κ╬╜ ╬┐╧Θ╧Ζ╧Β╧Ο╬╜','makhi-ton-okhirwn','2026-04-14 15:44:04','2026-04-14 15:44:04'),(3,'╬ι╬▒╧Β╬╡╬╝╬▓╬υ╧Δ╬╡╬╣╧Γ','paremvaseis','2026-04-23 09:34:05','2026-04-23 09:34:05'),(4,'News','news','2026-05-06 10:51:23','2026-05-06 10:51:23'),(5,'╬Σ╬╜╬▒╬║╬┐╬╣╬╜╧Ο╧Δ╬╡╬╣╧Γ','anakoinoseis','2026-05-06 10:51:23','2026-05-06 10:51:23'),(6,'╬μ╧Ζ╬╜╬╡╬╜╧Ε╬╡╧Ξ╬╛╬╡╬╣╧Γ','synentefxeis','2026-05-06 10:51:23','2026-05-06 10:51:23'),(7,'╬Σ╧Α╧Ν╧Ι╬╡╬╣╧Γ','apopseis','2026-05-06 10:51:23','2026-05-06 10:51:23');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consented_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_messages_email_index` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
INSERT INTO `contact_messages` VALUES (1,'Test','in.agora.store@gmail.com','Ye st','Hshejsjsjhdjdh','78.171.87.60','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36','2026-04-16 13:54:46','2026-04-16 13:54:46','2026-04-16 13:54:46'),(2,'dsasad','in.agora.store@gmail.com','dsadsadsadsadsad','ffdfdsfsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfs','193.43.135.222','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36','2026-04-16 14:03:26','2026-04-16 14:03:26','2026-04-16 14:03:26'),(3,'tes','fkantas@mfa.gr','thema','mhnyma','193.43.135.222','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36','2026-04-16 14:12:29','2026-04-16 14:12:29','2026-04-16 14:12:29'),(4,'╬θ╬β╬γ╬θ╬Υ╬Χ╬ζ╬Χ╬β╬Σ ╬γ╬Σ╬ζ╬ν╬Σ','fkantas@mfa.gr','╧Ε╬╡╧Δ╧Ε','╬║╬╡╬╣╬╝╬╡╬╜╬┐','45.85.144.253','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','2026-04-23 13:44:12','2026-04-23 13:44:12','2026-04-23 13:44:12');
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_items`
--

DROP TABLE IF EXISTS `media_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_on` date DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_items_slug_unique` (`slug`),
  KEY `media_items_type_index` (`type`),
  KEY `media_items_published_on_index` (`published_on`),
  KEY `media_items_is_featured_index` (`is_featured`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_items`
--

LOCK TABLES `media_items` WRITE;
/*!40000 ALTER TABLE `media_items` DISABLE KEYS */;
INSERT INTO `media_items` VALUES (1,'National Broadcast Interview','national-broadcast-interview','Discussion on defense strategy and civic unity.','interview','media/sample-interview.jpg',NULL,NULL,'2026-05-06',1,'2026-04-14 14:27:18','2026-05-06 10:51:23');
/*!40000 ALTER TABLE `media_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_04_14_165710_create_pages_table',1),(5,'2026_04_14_165711_create_contact_messages_table',1),(6,'2026_04_14_165711_create_media_items_table',1),(7,'2026_04_14_165711_create_posts_table',1),(8,'2026_04_14_191500_change_posts_excerpt_to_text',2),(9,'2026_04_14_193000_create_categories_and_tags_for_posts',3),(10,'2026_04_15_100000_add_og_image_to_posts_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `structured_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`),
  KEY `pages_is_published_index` (`is_published`),
  CONSTRAINT `pages_chk_1` CHECK (json_valid(`structured_data`))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Biography','biography',NULL,NULL,NULL,'Retired Lieutenant General with decades of national and international command experience.',1,'2026-04-14 14:27:18','2026-04-14 14:27:18');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tag` (
  `post_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `post_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES (1,1),(2,3),(1,4),(5,4),(5,6),(5,7),(5,8),(5,9),(5,10),(5,11),(5,12),(1,13),(1,14),(1,15),(2,15),(1,16),(2,16),(1,17),(1,18),(1,19),(2,19),(1,20),(1,21),(1,22),(1,23),(1,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_user_id_foreign` (`user_id`),
  KEY `posts_published_at_index` (`published_at`),
  KEY `posts_is_published_index` (`is_published`),
  KEY `posts_category_id_foreign` (`category_id`),
  CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,7,'╬Υ╬╡╧Ο╧Β╬│╬╣╬┐╧Γ ╬γ╬φ╬╗╬╗╬╖╧Γ : 25╬╖ ╬ε╬▒╧Β╧Ε╬ψ╬┐╧Ζ. ╬Φ╬╣╧Α╬╗╬χ ╬Χ╬┐╧Β╧Ε╬χ, ╬Σ╬┤╬╣╬▒╧Α╧Β╬▒╬│╬╝╬υ╧Ε╬╡╧Ζ╧Ε╬╡╧Γ ╬Σ╬╛╬ψ╬╡╧Γ: ╬ι╬ψ╧Δ╧Ε╬╖ ╬║╬▒╬╣ ╬ι╬▒╧Ε╧Β╬ψ╬┤╬▒','georgios-kellis-25i-martiou-dipli-eorti-adiapragmateutes-axies-pisti-kai-patrida','&nbsp;╬ε╬χ╬╜╧Ζ╬╝╬▒ ╧Ε╬┐╧Ζ ╬Υ╬╡╧Ο╧Β╬│╬╣╬┐╧Ζ ╬γ╬φ╬╗╬╗╬╖ ╬│╬╣╬▒ ╧Ε╬╖╬╜ 25╬╖ ╬ε╬▒╧Β╧Ε╬ψ╬┐╧Ζ: ╬╖ ╬┤╬╣╧Α╬╗╬χ ╬╡╬┐╧Β╧Ε╬χ ╧Ε╬┐╧Ζ ╬Χ╬╗╬╗╬╖╬╜╬╣╧Δ╬╝╬┐╧Ξ ╬║╬▒╬╣ ╧Ε╬╖╧Γ ╬θ╧Β╬╕╬┐╬┤╬┐╬╛╬ψ╬▒╧Γ ╬▒╬╜╬▒╬┤╬╡╬╣╬║╬╜╧Ξ╬╡╬╣ ╧Ε╬╣╧Γ ╬┤╬╣╬▒╧Θ╧Β╬┐╬╜╬╣╬║╬φ╧Γ ╬▒╬╛╬ψ╬╡╧Γ ╧Ε╬╖╧Γ ╧Α╬ψ╧Δ╧Ε╬╖╧Γ, ╧Ε╬╖╧Γ ╬╡╬╜╧Ν╧Ε╬╖╧Ε╬▒╧Γ ╬║╬▒╬╣ ╧Ε╬╖╧Γ ╬╡╬╕╬╜╬╣╬║╬χ╧Γ ╧Ζ╧Α╬╡╧Β╬╖╧Η╬υ╬╜╬╡╬╣╬▒╧Γ, ╧Δ╬╡ ╬φ╬╜╬▒ ╬▒╧Α╬▒╬╣╧Ε╬╖╧Ε╬╣╬║╧Ν ╬│╬╡╧Κ╧Α╬┐╬╗╬╣╧Ε╬╣╬║╧Ν ╧Α╬╡╧Β╬╣╬▓╬υ╬╗╬╗╬┐╬╜.&nbsp;','&nbsp;╬ε╬╡ ╬╣╬┤╬╣╬▒╬ψ╧Ε╬╡╧Β╬╖ ╧Δ╧Ζ╬│╬║╬ψ╬╜╬╖╧Δ╬╖ ╬║╬▒╬╣ ╬╡╬╕╬╜╬╣╬║╬χ ╧Ζ╧Α╬╡╧Β╬╖╧Η╬υ╬╜╬╡╬╣╬▒ ╧Ε╬╣╬╝╬┐╧Ξ╬╝╬╡ ╧Ε╬╖╬╜ ╬╡╧Α╬φ╧Ε╬╡╬╣╬┐ ╧Ε╬╖╧Γ 25╬╖╧Γ ╬ε╬▒╧Β╧Ε╬ψ╬┐╧Ζ 1821, ╬╝╬╣╬▒ ╬╖╬╝╬φ╧Β╬▒ ╧Α╬┐╧Ζ ╬▒╧Α╬┐╧Ε╬╡╬╗╬╡╬ψ ╬┤╬╣╬▒╧Θ╧Β╬┐╬╜╬╣╬║╧Ν ╧Δ╧Ξ╬╝╬▓╬┐╬╗╬┐ ╧Α╬ψ╧Δ╧Ε╬╖╧Γ, ╬╕╧Ζ╧Δ╬ψ╬▒╧Γ ╬║╬▒╬╣ ╬▒╬│╧Ο╬╜╬▒ ╬│╬╣╬▒ ╬╡╬╗╬╡╧Ζ╬╕╬╡╧Β╬ψ╬▒. ╬ν╬▒╧Ζ╧Ε╧Ν╧Θ╧Β╬┐╬╜╬▒, ╬╖ ╬╖╬╝╬φ╧Β╬▒ ╬▒╧Ζ╧Ε╬χ ╧Η╬φ╧Β╬╡╬╣ ╬║╬▒╬╣ ╬▓╬▒╬╕╧Ξ ╬╕╧Β╬╖╧Δ╬║╬╡╧Ζ╧Ε╬╣╬║╧Ν ╧Δ╧Ζ╬╝╬▓╬┐╬╗╬╣╧Δ╬╝╧Ν, ╬║╬▒╬╕╧Ο╧Γ ╬╡╬┐╧Β╧Ε╬υ╬╢╬╡╧Ε╬▒╬╣ ╬┐ ╬Χ╧Ζ╬▒╬│╬│╬╡╬╗╬╣╧Δ╬╝╧Ν╧Γ ╧Ε╬╖╧Γ ╬α╬╡╬┐╧Ε╧Ν╬║╬┐╧Ζ, ╬▒╬╜╬▒╬┤╬╡╬╣╬║╬╜╧Ξ╬┐╬╜╧Ε╬▒╧Γ ╧Ε╬┐╬╜ ╬┤╬╣╧Ε╧Ε╧Ν ╧Θ╬▒╧Β╬▒╬║╧Ε╬χ╧Β╬▒ ╧Ε╬╖╧Γ ╧Κ╧Γ ╬│╬╣╬┐╧Β╧Ε╬χ ╧Ε╬╖╧Γ ╬θ╧Β╬╕╬┐╬┤╬┐╬╛╬ψ╬▒╧Γ ╬║╬▒╬╣ ╧Ε╬┐╧Ζ ╬Χ╬╗╬╗╬╖╬╜╬╣╧Δ╬╝╬┐╧Ξ. ╬θ╬╣ ╬▒╬│╧Κ╬╜╬╣╧Δ╧Ε╬φ╧Γ ╧Ε╬╖╧Γ ╬Χ╧Α╬▒╬╜╬υ╧Δ╧Ε╬▒╧Δ╬╖╧Γ ╬▒╧Α╬φ╬┤╬╡╬╣╬╛╬▒╬╜ ╧Ν╧Ε╬╣ ╧Ν╧Ε╬▒╬╜ ╬┐ ╬Χ╬╗╬╗╬╖╬╜╬╣╧Δ╬╝╧Ν╧Γ ╬╡╬ψ╬╜╬▒╬╣ ╬╡╬╜╧Κ╬╝╬φ╬╜╬┐╧Γ, ╬╝╬╡ ╧Α╬ψ╧Δ╧Ε╬╖ ╧Δ╧Ε╬╖╬╜ ╧Α╬▒╧Ε╧Β╬ψ╬┤╬▒ ╬║╬▒╬╣ ╧Δ╧Ε╬╣╧Γ ╬▒╬╛╬ψ╬╡╧Γ ╧Ε╬┐╧Ζ, ╬╝╧Α╬┐╧Β╬╡╬ψ ╬╜╬▒ ╧Ζ╧Α╬╡╧Β╬▓╬╡╬ψ ╬║╬υ╬╕╬╡ ╬┤╧Ζ╧Δ╬║╬┐╬╗╬ψ╬▒ ╬║╬▒╬╣ ╬╜╬▒ ╬┤╬╣╬╡╬║╬┤╬╣╬║╬χ╧Δ╬╡╬╣ ╧Ε╬┐ ╬┤╬╣╬║╬▒╬ψ╧Κ╬╝╬υ ╧Ε╬┐╧Ζ ╧Δ╧Ε╬╖╬╜ ╬╡╬╗╬╡╧Ζ╬╕╬╡╧Β╬ψ╬▒ ╬║╬▒╬╣ ╧Ε╬╖╬╜ ╬▒╬╛╬╣╬┐╧Α╧Β╬φ╧Α╬╡╬╣╬▒.<br><br>╬μ╬χ╬╝╬╡╧Β╬▒, ╬╝╬φ╧Δ╬▒ ╧Δ╬╡ ╬φ╬╜╬▒ ╧Δ╧Ξ╬╜╬╕╬╡╧Ε╬┐ ╬║╬▒╬╣ ╬▒╧Α╬▒╬╣╧Ε╬╖╧Ε╬╣╬║╧Ν ╬│╬╡╧Κ╧Α╬┐╬╗╬╣╧Ε╬╣╬║╧Ν ╧Α╬╡╧Β╬╣╬▓╬υ╬╗╬╗╬┐╬╜, ╬╖ ╬╣╧Δ╧Ε╬┐╧Β╬╣╬║╬χ ╬▒╧Ζ╧Ε╬χ ╧Α╬▒╧Β╬▒╬║╬▒╧Ε╬▒╬╕╬χ╬║╬╖ ╬▒╧Α╬┐╬║╧Ε╬υ ╬╣╬┤╬╣╬▒╬ψ╧Ε╬╡╧Β╬╖ ╧Δ╬╖╬╝╬▒╧Δ╬ψ╬▒. ╬Ω ╬Χ╬╗╬╗╬υ╬┤╬▒ ╧Α╬▒╧Β╬▒╬╝╬φ╬╜╬╡╬╣ ╧Α╧Β╬┐╧Δ╬╖╬╗╧Κ╬╝╬φ╬╜╬╖ ╧Δ╧Ε╬╖╬╜ ╧Ζ╧Α╬╡╧Β╬υ╧Δ╧Α╬╣╧Δ╬╖ ╧Ε╬╖╧Γ ╬╡╬╕╬╜╬╣╬║╬χ╧Γ ╬║╧Ζ╧Β╬╣╬▒╧Β╧Θ╬ψ╬▒╧Γ ╬║╬▒╬╣ ╧Ε╧Κ╬╜ ╬║╧Ζ╧Β╬╣╬▒╧Β╧Θ╬╣╬║╧Ο╬╜ ╧Ε╬╖╧Γ ╬┤╬╣╬║╬▒╬╣╧Κ╬╝╬υ╧Ε╧Κ╬╜, ╬┤╬╣╬▒╧Ε╬╖╧Β╧Ο╬╜╧Ε╬▒╧Γ ╬╣╧Δ╧Θ╧Ζ╧Β╬χ ╬▒╧Α╬┐╧Ε╧Β╬╡╧Α╧Ε╬╣╬║╬χ ╬╣╬║╬▒╬╜╧Ν╧Ε╬╖╧Ε╬▒ ╬║╬▒╬╣ ╧Ζ╧Ι╬╖╬╗╧Ν ╬╡╧Α╬ψ╧Α╬╡╬┤╬┐ ╬╡╧Ε╬┐╬╣╬╝╧Ν╧Ε╬╖╧Ε╬▒╧Γ.<br><br>╬θ╬╣ ╧Α╧Β╧Ν╧Δ╧Η╬▒╧Ε╬╡╧Γ ╬║╬╣╬╜╬χ╧Δ╬╡╬╣╧Γ ╬╡╬╜╬ψ╧Δ╧Θ╧Ζ╧Δ╬╖╧Γ ╧Ε╬╖╧Γ ╬υ╬╝╧Ζ╬╜╬▒╧Γ, ╧Δ╧Ε╬┐╬╜ ╬Ι╬▓╧Β╬┐, ╧Ε╬╖╬╜ ╬γ╬υ╧Β╧Α╬▒╬╕╬┐ ╬║╬▒╬╣ ╧Ε╬╖╬╜ ╬╡╧Ζ╧Β╧Ξ╧Ε╬╡╧Β╬╖ ╧Α╬╡╧Β╬╣╬┐╧Θ╬χ ╧Ε╬╖╧Γ ╬γ╧Ξ╧Α╧Β╬┐╧Ζ, ╬╝╬╡ ╧Ε╬╖╬╜ ╧Α╬▒╧Β╬┐╧Ζ╧Δ╬ψ╬▒ ╧Δ╧Ξ╬│╧Θ╧Β╬┐╬╜╧Κ╬╜ ╬▒╬╝╧Ζ╬╜╧Ε╬╣╬║╧Ο╬╜ ╧Δ╧Ζ╧Δ╧Ε╬╖╬╝╬υ╧Ε╧Κ╬╜ ╧Α╬┐╧Ζ ╬╡╬╜╬╣╧Δ╧Θ╧Ξ╬┐╧Ζ╬╜ ╧Ε╬╖╬╜ ╬▒╧Δ╧Α╬ψ╬┤╬▒ ╧Α╧Β╬┐╧Δ╧Ε╬▒╧Δ╬ψ╬▒╧Γ ╧Ε╬╖╧Γ ╧Α╬▒╧Ε╧Β╬ψ╬┤╬▒╧Γ, ╧Δ╬╡ ╧Δ╧Ζ╬╜╬┤╧Ζ╬▒╧Δ╬╝╧Ν ╬╝╬╡ ╧Ε╬╖╬╜ ╬╡╧Α╬╣╧Ε╧Ζ╧Θ╬χ ╬╡╧Α╬╣╧Θ╬╡╬╣╧Β╬╖╧Δ╬╣╬▒╬║╬χ ╬▒╬╛╬╣╬┐╧Α╬┐╬ψ╬╖╧Δ╬╖ ╬╡╬╗╬╗╬╖╬╜╬╣╬║╧Ο╬╜ ╬▒╬╝╧Ζ╬╜╧Ε╬╣╬║╧Ο╬╜ ╬╝╬φ╧Δ╧Κ╬╜ ╧Δ╧Ε╬┐ ╬╡╬╛╧Κ╧Ε╬╡╧Β╬╣╬║╧Ν, ╧Ζ╧Α╬┐╬│╧Β╬▒╬╝╬╝╬ψ╬╢╬┐╧Ζ╬╜ ╧Ν╧Ε╬╣ ╬╖ ╬▒╧Δ╧Η╬υ╬╗╬╡╬╣╬▒, ╬╖ ╧Δ╧Ε╬▒╬╕╬╡╧Β╧Ν╧Ε╬╖╧Ε╬▒ ╬║╬▒╬╣ ╬╖ ╬╡╬╣╧Β╬χ╬╜╬╖ ╬┤╬╣╬▒╧Δ╧Η╬▒╬╗╬ψ╬╢╬┐╬╜╧Ε╬▒╬╣ ╬╝╬╡ ╧Ζ╧Α╬╡╧Ζ╬╕╧Ζ╬╜╧Ν╧Ε╬╖╧Ε╬▒, ╬╡╧Ε╬┐╬╣╬╝╧Ν╧Ε╬╖╧Ε╬▒ ╬║╬▒╬╣ ╬╡╬╕╬╜╬╣╬║╬χ ╬▒╧Ζ╧Ε╬┐╧Α╬╡╧Α╬┐╬ψ╬╕╬╖╧Δ╬╖.<br><br>╬θ╬╣ ╬Ι╬╜╬┐╧Α╬╗╬╡╧Γ ╬Φ╧Ζ╬╜╬υ╬╝╬╡╬╣╧Γ ╧Ε╬╖╧Γ ╧Θ╧Ο╧Β╬▒╧Γ, ╬╝╬╡ ╧Ζ╧Ι╬╖╬╗╧Ν ╧Η╧Β╧Ν╬╜╬╖╬╝╬▒, ╬╡╧Α╬▒╬│╬│╬╡╬╗╬╝╬▒╧Ε╬╣╧Δ╬╝╧Ν ╬║╬▒╬╣ ╬▒╧Η╬┐╧Δ╬ψ╧Κ╧Δ╬╖, ╧Δ╧Ε╬φ╬║╬┐╬╜╧Ε╬▒╬╣ ╬υ╬│╧Β╧Ζ╧Α╬╜╬┐╬╣ ╧Η╧Β╬┐╧Ζ╧Β╬┐╬ψ ╧Ε╬╖╧Γ ╬╡╬╗╬╡╧Ζ╬╕╬╡╧Β╬ψ╬▒╧Γ ╬║╬▒╬╣ ╧Ε╬╖╧Γ ╬╡╬╕╬╜╬╣╬║╬χ╧Γ ╬▒╬╛╬╣╬┐╧Α╧Β╬φ╧Α╬╡╬╣╬▒╧Γ, ╧Δ╧Ζ╬╜╬╡╧Θ╬ψ╬╢╬┐╬╜╧Ε╬▒╧Γ ╬╡╧Α╬υ╬╛╬╣╬▒ ╧Ε╬╖╬╜ ╧Α╬▒╧Β╬υ╬┤╬┐╧Δ╬╖ ╧Ε╧Κ╬╜ ╧Α╧Β╬┐╬│╧Ν╬╜╧Κ╬╜ ╬╝╬▒╧Γ.<br><br>╬Ω ╬╡╧Α╬φ╧Ε╬╡╬╣╬┐╧Γ ╧Ε╬╖╧Γ 25╬╖╧Γ ╬ε╬▒╧Β╧Ε╬ψ╬┐╧Ζ ╬╝╬υ╧Γ ╬║╬▒╬╗╬╡╬ψ ╧Ν╬╗╬┐╧Ζ╧Γ ╬╜╬▒ ╬▒╬╜╧Ε╬╗╬χ╧Δ╬┐╧Ζ╬╝╬╡ ╬┤╧Ξ╬╜╬▒╬╝╬╖ ╬▒╧Α╧Ν ╧Ε╬╖╬╜ ╬╣╧Δ╧Ε╬┐╧Β╬ψ╬▒ ╬╝╬▒╧Γ ╬║╬▒╬╣ ╬╜╬▒ ╧Α╧Β╬┐╧Θ╧Κ╧Β╬χ╧Δ╬┐╧Ζ╬╝╬╡ ╬╝╬╡ ╬╡╬╜╧Ν╧Ε╬╖╧Ε╬▒, ╬▒╧Α╬┐╧Η╬▒╧Δ╬╣╧Δ╧Ε╬╣╬║╧Ν╧Ε╬╖╧Ε╬▒ ╬║╬▒╬╣ ╧Α╬ψ╧Δ╧Ε╬╖ ╧Δ╧Ε╬╣╧Γ ╬┤╬╣╬▒╧Θ╧Β╬┐╬╜╬╣╬║╬φ╧Γ ╬▒╬╛╬ψ╬╡╧Γ ╧Ε╬┐╧Ζ ╬Χ╬╗╬╗╬╖╬╜╬╣╧Δ╬╝╬┐╧Ξ.<br><br>╬π╧Β╧Ν╬╜╬╣╬▒ ╧Α╬┐╬╗╬╗╬υ ╧Δ╬╡ ╧Ν╬╗╬╡╧Γ ╧Ε╬╣╧Γ ╬Χ╬╗╬╗╬╖╬╜╬ψ╬┤╬╡╧Γ ╬║╬▒╬╣ ╧Ν╬╗╬┐╧Ζ╧Γ ╧Ε╬┐╧Ζ╧Γ ╬Ι╬╗╬╗╬╖╬╜╬╡╧Γ.<br><br>╬Ψ╬χ╧Ε╧Κ ╬╖ 25╬╖ ╬ε╬▒╧Β╧Ε╬ψ╬┐╧Ζ.<br>╬Ψ╬χ╧Ε╧Κ ╬╖ ╬Χ╬╗╬╗╬υ╬┤╬▒.<br>╬Ψ╬χ╧Ε╧Κ ╬╖ ╬α╧Β╬υ╬║╬╖.<br>╬Ψ╬χ╧Ε╧Κ ╬╖ ╬η╬υ╬╜╬╕╬╖.<br><br>╬Σ╬╜╧Ε╬╣╧Δ╧Ε╧Β╬υ╧Ε╬╖╬│╬┐╧Γ (╬╡.╬▒.) ╬Υ╬╡╧Ο╧Β╬│╬╣╬┐╧Γ ╬γ╬φ╬╗╬╗╬╖╧Γ<br>╬Χ╧Α╬ψ╧Ε╬╣╬╝╬┐╧Γ ╬ξ╧Α╬▒╧Β╧Θ╬╖╬│╧Ν╧Γ ╬Υ╬╡╬╜╬╣╬║╬┐╧Ξ<br>╬Χ╧Α╬╣╧Ε╬╡╬╗╬╡╬ψ╬┐╧Ζ ╬μ╧Ε╧Β╬▒╧Ε╬┐╧Ξ&nbsp;<br><br><br>','posts/covers/l1ENQ2s3aIrObLqoogIBu9HmE9dlbPoZYJonyCHN.jpg',NULL,'╬Υ╬╡╧Ο╧Β╬│╬╣╬┐╧Γ ╬γ╬φ╬╗╬╗╬╖╧Γ: 25╬╖ ╬ε╬▒╧Β╧Ε╬ψ╬┐╧Ζ έΑΥ ╬ι╬ψ╧Δ╧Ε╬╖, ╬ι╬▒╧Ε╧Β╬ψ╬┤╬▒, ╬Χ╬╕╬╜╬╣╬║╬χ ╬β╧Δ╧Θ╧Ξ╧Γ','╬ε╬χ╬╜╧Ζ╬╝╬▒ ╧Ε╬┐╧Ζ ╬Υ╬╡╧Ο╧Β╬│╬╣╬┐╧Ζ ╬γ╬φ╬╗╬╗╬╖ ╬│╬╣╬▒ ╧Ε╬╖╬╜ 25╬╖ ╬ε╬▒╧Β╧Ε╬ψ╬┐╧Ζ. ╬Ω ╧Δ╬╖╬╝╬▒╧Δ╬ψ╬▒ ╧Ε╬╖╧Γ ╧Α╬ψ╧Δ╧Ε╬╖╧Γ, ╧Ε╬╖╧Γ ╬╡╬╕╬╜╬╣╬║╬χ╧Γ ╬╡╬╜╧Ν╧Ε╬╖╧Ε╬▒╧Γ ╬║╬▒╬╣ ╧Ε╬╖╧Γ ╬╣╧Δ╧Θ╧Ζ╧Β╬χ╧Γ ╬υ╬╝╧Ζ╬╜╬▒╧Γ ╧Δ╬╡ ╧Δ╧Ξ╬│╧Θ╧Β╬┐╬╜╬┐ ╬│╬╡╧Κ╧Α╬┐╬╗╬╣╧Ε╬╣╬║╧Ν ╧Α╬╡╧Β╬╣╬▓╬υ╬╗╬╗╬┐╬╜.','2026-03-24 23:51:00',1,'2026-04-14 14:27:18','2026-05-06 11:46:57'),(2,1,7,'╬Ω ╬ε╬υ╧Θ╬╖ ╧Ε╧Κ╬╜ ╬θ╧Θ╧Ζ╧Β╧Ο╬╜ ╬║╬▒╬╣ ╬╖ ╬α╧Ζ╧Δ╬ψ╬▒ ╧Δ╧Ε╬┐╬╜ ╬Χ╧Θ╬ψ╬╜╬┐: ╬ε╬╜╬χ╬╝╬╖, ╬Χ╬╜╧Ν╧Ε╬╖╧Ε╬▒ ╬║╬▒╬╣ ╬ι╬▒╧Ε╧Β╬╣╧Κ╧Ε╬╣╧Δ╬╝╧Ν╧Γ','i-machi-ton-ochyron-kai-i-thysia-ston-echino-mnimi-enotita-kai-patriotismos','╬Ω ╬ε╬υ╧Θ╬╖ ╧Ε╧Κ╬╜ ╬θ╧Θ╧Ζ╧Β╧Ο╬╜, ╧Ε╬┐╬╜ ╬Σ╧Α╧Β╬ψ╬╗╬╣╬┐ ╧Ε╬┐╧Ζ 1941, ╬▒╧Α╬┐╧Ε╬╡╬╗╬╡╬ψ ╬╝╬ψ╬▒ ╬▒╧Α╧Ν ╧Ε╬╣╧Γ ╧Α╬╗╬φ╬┐╬╜ ╬φ╬╜╬┤╬┐╬╛╬╡╧Γ ╧Δ╬╡╬╗╬ψ╬┤╬╡╧Γ ╧Ε╬╖╧Γ ╬╜╬╡╧Ν╧Ε╬╡╧Β╬╖╧Γ ╬╡╬╗╬╗╬╖╬╜╬╣╬║╬χ╧Γ ╬╣╧Δ╧Ε╬┐╧Β╬ψ╬▒╧Γ. ╬μ╧Ε╬┐ ╧Α╬╗╬▒╬ψ╧Δ╬╣╬┐ ╧Ε╬╖╧Γ ╬│╬╡╧Β╬╝╬▒╬╜╬╣╬║╬χ╧Γ ╬╡╬╣╧Δ╬▓╬┐╬╗╬χ╧Γ, ╬╖ ╬▒╬╝╧Ζ╬╜╧Ε╬╣╬║╬χ ╬│╧Β╬▒╬╝╬╝╬χ ╬ε╬╡╧Ε╬▒╬╛╬υ ╧Δ╧Ε╬υ╬╕╬╖╬║╬╡ ╧Δ╧Ξ╬╝╬▓╬┐╬╗╬┐ ╬▒╬╜╧Ε╬ψ╧Δ╧Ε╬▒╧Δ╬╖╧Γ, ╧Ε╬╣╬╝╬χ╧Γ ╬║╬▒╬╣ ╧Δ╧Ε╧Β╬▒╧Ε╬╣╧Κ╧Ε╬╣╬║╬χ╧Γ ╬▒╧Β╬╡╧Ε╬χ╧Γ. ╬ι╬▒╧Β╬υ ╧Ε╬╖ ╧Δ╧Ζ╬╜╧Ε╧Β╬╣╧Α╧Ε╬╣╬║╬χ ╧Ζ╧Α╬╡╧Β╬┐╧Θ╬χ ╧Ε╧Κ╬╜ ╬╡╧Α╬╣╧Ε╬╣╬╕╬φ╬╝╬╡╬╜╧Κ╬╜ ╬┤╧Ζ╬╜╬υ╬╝╬╡╧Κ╬╜, ╬┐╬╣ ╬Ι╬╗╬╗╬╖╬╜╬╡╧Γ ╧Ζ╧Α╬╡╧Β╬▒╧Δ╧Α╬╣╧Δ╧Ε╬φ╧Γ ╧Ε╧Κ╬╜...','╬Ω ╬ε╬υ╧Θ╬╖ ╧Ε╧Κ╬╜ ╬θ╧Θ╧Ζ╧Β╧Ο╬╜, ╧Ε╬┐╬╜ ╬Σ╧Α╧Β╬ψ╬╗╬╣╬┐ ╧Ε╬┐╧Ζ 1941, ╬▒╧Α╬┐╧Ε╬╡╬╗╬╡╬ψ ╬╝╬ψ╬▒ ╬▒╧Α╧Ν ╧Ε╬╣╧Γ ╧Α╬╗╬φ╬┐╬╜ ╬φ╬╜╬┤╬┐╬╛╬╡╧Γ ╧Δ╬╡╬╗╬ψ╬┤╬╡╧Γ ╧Ε╬╖╧Γ ╬╜╬╡╧Ν╧Ε╬╡╧Β╬╖╧Γ ╬╡╬╗╬╗╬╖╬╜╬╣╬║╬χ╧Γ ╬╣╧Δ╧Ε╬┐╧Β╬ψ╬▒╧Γ. ╬μ╧Ε╬┐ ╧Α╬╗╬▒╬ψ╧Δ╬╣╬┐ ╧Ε╬╖╧Γ ╬│╬╡╧Β╬╝╬▒╬╜╬╣╬║╬χ╧Γ ╬╡╬╣╧Δ╬▓╬┐╬╗╬χ╧Γ, ╬╖ ╬▒╬╝╧Ζ╬╜╧Ε╬╣╬║╬χ ╬│╧Β╬▒╬╝╬╝╬χ ╬ε╬╡╧Ε╬▒╬╛╬υ ╧Δ╧Ε╬υ╬╕╬╖╬║╬╡ ╧Δ╧Ξ╬╝╬▓╬┐╬╗╬┐ ╬▒╬╜╧Ε╬ψ╧Δ╧Ε╬▒╧Δ╬╖╧Γ, ╧Ε╬╣╬╝╬χ╧Γ ╬║╬▒╬╣ ╧Δ╧Ε╧Β╬▒╧Ε╬╣╧Κ╧Ε╬╣╬║╬χ╧Γ ╬▒╧Β╬╡╧Ε╬χ╧Γ. ╬ι╬▒╧Β╬υ ╧Ε╬╖ ╧Δ╧Ζ╬╜╧Ε╧Β╬╣╧Α╧Ε╬╣╬║╬χ ╧Ζ╧Α╬╡╧Β╬┐╧Θ╬χ ╧Ε╧Κ╬╜ ╬╡╧Α╬╣╧Ε╬╣╬╕╬φ╬╝╬╡╬╜╧Κ╬╜ ╬┤╧Ζ╬╜╬υ╬╝╬╡╧Κ╬╜, ╬┐╬╣ ╬Ι╬╗╬╗╬╖╬╜╬╡╧Γ ╧Ζ╧Α╬╡╧Β╬▒╧Δ╧Α╬╣╧Δ╧Ε╬φ╧Γ ╧Ε╧Κ╬╜ ╬┐╧Θ╧Ζ╧Β╧Ο╬╜ ╧Α╬┐╬╗╬φ╬╝╬╖╧Δ╬▒╬╜ ╬╝╬╡ ╬▒╧Α╬▒╧Β╬υ╬╝╬╣╬╗╬╗╬┐ ╬╕╬υ╧Β╧Β╬┐╧Γ, ╬▒╧Α╬┐╬┤╬╡╬╣╬║╬╜╧Ξ╬┐╬╜╧Ε╬▒╧Γ ╧Ν╧Ε╬╣ ╬╖ ╬┤╧Ξ╬╜╬▒╬╝╬╖ ╧Ε╬╖╧Γ ╧Ι╧Ζ╧Θ╬χ╧Γ ╬║╬▒╬╣ ╬╖ ╧Α╬ψ╧Δ╧Ε╬╖ ╧Δ╧Ε╬╖╬╜ ╧Α╬▒╧Ε╧Β╬ψ╬┤╬▒ ╧Ζ╧Α╬╡╧Β╬▓╬▒╬ψ╬╜╬┐╧Ζ╬╜ ╬║╬υ╬╕╬╡ ╧Ζ╬╗╬╣╬║╬χ ╧Ζ╧Α╬╡╧Β╬┐╧Θ╬χ.<br><br>╬β╬┤╬╣╬▒╬ψ╧Ε╬╡╧Β╬╖ ╬╕╬φ╧Δ╬╖ ╧Δ╬╡ ╬▒╧Ζ╧Ε╬χ ╧Ε╬╖╬╜ ╬╣╧Δ╧Ε╬┐╧Β╬╣╬║╬χ ╬╝╬╜╬χ╬╝╬╖ ╬║╬▒╧Ε╬φ╧Θ╬╡╬╣ ╬╖ ╧Α╬╡╧Β╬╣╬┐╧Θ╬χ ╧Ε╬┐╧Ζ ╬Χ╧Θ╬ψ╬╜╬┐╧Ζ, ╧Ν╧Α╬┐╧Ζ ╬╖ ╬╕╧Ζ╧Δ╬ψ╬▒ ╬φ╬╗╬▒╬▓╬╡ ╬φ╬╜╬▒╬╜ ╬▓╬▒╬╕╧Ξ╧Ε╬╡╧Β╬┐ ╬║╬▒╬╣ ╬┤╬╣╬▒╧Θ╧Β╬┐╬╜╬╣╬║╧Ν ╧Δ╧Ζ╬╝╬▓╬┐╬╗╬╣╧Δ╬╝╧Ν. ╬Χ╬║╬╡╬ψ, ╬π╧Β╬╣╧Δ╧Ε╬╣╬▒╬╜╬┐╬ψ ╬║╬▒╬╣ ╬ε╬┐╧Ζ╧Δ╬┐╧Ζ╬╗╬╝╬υ╬╜╬┐╬╣ ╬Ι╬╗╬╗╬╖╬╜╬╡╧Γ ╧Δ╧Ε╧Β╬▒╧Ε╬╣╧Ο╧Ε╬╡╧Γ ╧Δ╧Ε╬υ╬╕╬╖╬║╬▒╬╜ ╧Α╬╗╬υ╬╣-╧Α╬╗╬υ╬╣, ╬╡╬╜╧Κ╬╝╬φ╬╜╬┐╬╣ ╬▒╧Α╧Ν ╧Ε╬┐ ╬║╬┐╬╣╬╜╧Ν ╬║╬▒╬╕╬χ╬║╬┐╬╜ ╧Α╧Β╬┐╧Γ ╧Ε╬╖╬╜ ╧Α╬▒╧Ε╧Β╬ψ╬┤╬▒. ╬π╧Κ╧Β╬ψ╧Γ ╬┤╬╣╬▒╬║╧Β╬ψ╧Δ╬╡╬╣╧Γ ╬╕╧Β╬╖╧Δ╬║╬╡╬ψ╬▒╧Γ ╬χ ╬║╬▒╧Ε╬▒╬│╧Κ╬│╬χ╧Γ, ╧Ζ╧Α╬╡╧Β╬▒╧Δ╧Α╬ψ╧Δ╧Ε╬╖╬║╬▒╬╜ ╧Ε╬╖╬╜ ╬╡╬╗╬╡╧Ζ╬╕╬╡╧Β╬ψ╬▒ ╧Ε╬╖╧Γ ╬Χ╬╗╬╗╬υ╬┤╬▒╧Γ ╬╝╬╡ ╧Ε╬┐ ╬ψ╬┤╬╣╬┐ ╧Α╬υ╬╕╬┐╧Γ ╬║╬▒╬╣ ╧Ε╬╖╬╜ ╬ψ╬┤╬╣╬▒ ╬▒╧Ζ╧Ε╬▒╧Α╬υ╧Β╬╜╬╖╧Δ╬╖.<br><br>╬Ω ╬║╬┐╬╣╬╜╬χ ╬▒╧Ζ╧Ε╬χ ╬╕╧Ζ╧Δ╬ψ╬▒ ╬▒╧Α╬┐╧Ε╬╡╬╗╬╡╬ψ ╬╢╧Κ╬╜╧Ε╬▒╬╜╧Ν ╧Α╬▒╧Β╬υ╬┤╬╡╬╣╬│╬╝╬▒ ╬╡╬╕╬╜╬╣╬║╬χ╧Γ ╬╡╬╜╧Ν╧Ε╬╖╧Ε╬▒╧Γ. ╬μ╬╡ ╬╝╬╣╬▒ ╬╡╧Α╬┐╧Θ╬χ, ╧Ν╧Α╬┐╧Ζ ╬║╬υ╧Α╬┐╬╣╬┐╬╣ ╬╡╬╗╬υ╧Θ╬╣╧Δ╧Ε╬┐╬╣ ╧Α╧Β╬┐╧Δ╧Α╬▒╬╕╬┐╧Ξ╬╜ ╬╜╬▒ ╬╡╬╜╧Ε╬╡╬ψ╬╜╬┐╧Ζ╬╜ ╬┤╬╣╬▒╧Θ╧Κ╧Β╬╣╧Δ╧Ε╬╣╬║╬φ╧Γ ╬│╧Β╬▒╬╝╬╝╬φ╧Γ, ╬╖ ╬╣╧Δ╧Ε╬┐╧Β╬ψ╬▒ ╧Ε╬┐╧Ζ ╬Χ╧Θ╬ψ╬╜╬┐╧Ζ ╧Ζ╧Α╬╡╬╜╬╕╧Ζ╬╝╬ψ╬╢╬╡╬╣ ╧Ν╧Ε╬╣ ╬╖ ╬Χ╬╗╬╗╬υ╬┤╬▒ ╬╝╬╡╬│╬▒╬╗╬┐╧Ξ╧Β╬│╬╖╧Δ╬╡ ╧Ν╧Ε╬▒╬╜ ╧Ε╬▒ ╧Α╬▒╬╣╬┤╬╣╬υ ╧Ε╬╖╧Γ ╧Δ╧Ε╬υ╬╕╬╖╬║╬▒╬╜ ╬╡╬╜╧Κ╬╝╬φ╬╜╬▒. ╬Ω ╬φ╬╜╬╜╬┐╬╣╬▒ ╧Ε╬╖╧Γ ╧Α╬▒╧Ε╧Β╬ψ╬┤╬▒╧Γ ╧Ζ╧Α╬╡╧Β╬ψ╧Δ╧Θ╧Ζ╧Δ╬╡ ╬║╬υ╬╕╬╡ ╬╡╧Α╬╣╬╝╬φ╧Β╬┐╧Ζ╧Γ ╧Ε╬▒╧Ζ╧Ε╧Ν╧Ε╬╖╧Ε╬▒╧Γ, ╬║╬▒╬╣ ╧Ε╬┐ ╬▒╬ψ╬╝╬▒ ╧Α╬┐╧Ζ ╧Θ╧Ξ╬╕╬╖╬║╬╡ ╬χ╧Ε╬▒╬╜ ╬║╬┐╬╣╬╜╧Ν, ╬╣╬╡╧Β╧Ν ╬║╬▒╬╣ ╧Ε╬╣╬╝╬╖╬╝╬φ╬╜╬┐.<br><br>╬θ╬╣ ╧Α╬╡╧Δ╧Ν╬╜╧Ε╬╡╧Γ ╧Ε╬┐╧Ζ ╬Χ╧Θ╬ψ╬╜╬┐╧Ζ ╬┤╬╡╬╜ ╬▒╧Α╬┐╧Ε╬╡╬╗╬┐╧Ξ╬╜ ╬╝╧Ν╬╜╬┐ ╬χ╧Β╧Κ╬╡╧Γ ╬╝╬╣╬▒╧Γ ╧Ε╬┐╧Α╬╣╬║╬χ╧Γ ╬╣╧Δ╧Ε╬┐╧Β╬ψ╬▒╧Γ, ╬▒╬╗╬╗╬υ ╧Δ╧Ξ╬╝╬▓╬┐╬╗╬▒ ╬╝╬╣╬▒╧Γ ╬╡╧Ζ╧Β╧Ξ╧Ε╬╡╧Β╬╖╧Γ ╬▒╬╗╬χ╬╕╬╡╬╣╬▒╧Γ: ╧Ν╧Ε╬╣ ╬╖ ╬╡╬╗╬╡╧Ζ╬╕╬╡╧Β╬ψ╬▒ ╬║╬▒╧Ε╬▒╬║╧Ε╬υ╧Ε╬▒╬╣ ╬║╬▒╬╣ ╬┤╬╣╬▒╧Η╧Ζ╬╗╬υ╧Δ╧Δ╬╡╧Ε╬▒╬╣ ╬╝╬φ╧Δ╬▒ ╬▒╧Α╧Ν ╧Ε╬╖╬╜ ╬╡╬╜╧Ν╧Ε╬╖╧Ε╬▒, ╧Ε╬╖╬╜ ╬▒╬╗╬╗╬╖╬╗╬╡╬│╬│╧Ξ╬╖ ╬║╬▒╬╣ ╧Ε╬╖╬╜ ╧Α╬ψ╧Δ╧Ε╬╖ ╧Δ╬╡ ╬║╬┐╬╣╬╜╬φ╧Γ ╬▒╬╛╬ψ╬╡╧Γ. ╬Ω ╬╕╧Ζ╧Δ╬ψ╬▒ ╧Ε╬┐╧Ζ╧Γ ╬╝╬υ╧Γ ╬║╬▒╬╗╬╡╬ψ ╧Ν╧Θ╬╣ ╬╝╧Ν╬╜╬┐ ╬╜╬▒ ╬╕╧Ζ╬╝╧Ν╬╝╬▒╧Δ╧Ε╬╡, ╬▒╬╗╬╗╬υ ╬║╬▒╬╣ ╬╜╬▒ ╧Α╧Β╬υ╧Ε╧Ε╬┐╧Ζ╬╝╬╡ ╬╝╬╡ ╬│╬╜╧Ο╬╝╬┐╬╜╬▒ ╧Ε╬┐ ╧Δ╧Ζ╬╗╬╗╬┐╬│╬╣╬║╧Ν ╬║╬▒╬╗╧Ν.<br><br>╬μ╬χ╬╝╬╡╧Β╬▒, ╧Ε╬╣╬╝╧Ο╬╜╧Ε╬▒╧Γ ╧Ε╬╖ ╬ε╬υ╧Θ╬╖ ╧Ε╧Κ╬╜ ╬θ╧Θ╧Ζ╧Β╧Ο╬╜ ╬║╬▒╬╣ ╧Ε╬┐╧Ζ╧Γ ╬χ╧Β╧Κ╬╡╧Γ ╧Ε╬┐╧Ζ ╬Χ╧Θ╬ψ╬╜╬┐╧Ζ, ╬▒╧Α╬┐╬┤╬ψ╬┤╬┐╧Ζ╬╝╬╡ ╧Ε╬┐╬╜ ╬┐╧Η╬╡╬╣╬╗╧Ν╬╝╬╡╬╜╬┐ ╧Δ╬╡╬▓╬▒╧Δ╬╝╧Ν ╧Δ╬╡ ╬╡╬║╬╡╬ψ╬╜╬┐╧Ζ╧Γ ╧Α╬┐╧Ζ ╬φ╬╕╬╡╧Δ╬▒╬╜ ╧Ε╬┐ ┬τ╬╡╬╝╬╡╬ψ╧Γ┬╗ ╧Α╬υ╬╜╧Κ ╬▒╧Α╧Ν ╧Ε╬┐ ┬τ╬╡╬│╧Ο┬╗. ╬Ω ╬╝╬╜╬χ╬╝╬╖ ╧Ε╬┐╧Ζ╧Γ ╬▒╧Α╬┐╧Ε╬╡╬╗╬╡╬ψ ╧Η╬υ╧Β╬┐ ╧Α╬┐╧Ζ ╧Η╧Κ╧Ε╬ψ╬╢╬╡╬╣ ╧Ε╬┐ ╧Α╬▒╧Β╧Ν╬╜ ╬║╬▒╬╣ ╬║╬▒╬╕╬┐╬┤╬╖╬│╬╡╬ψ ╧Ε╬┐ ╬╝╬φ╬╗╬╗╬┐╬╜, ╧Ζ╧Α╬╡╬╜╬╕╧Ζ╬╝╬ψ╬╢╬┐╬╜╧Ε╬υ╧Γ ╬╝╬▒╧Γ ╧Ν╧Ε╬╣ ╬╖ ╬┤╧Ξ╬╜╬▒╬╝╬╖ ╧Ε╬╖╧Γ ╬Χ╬╗╬╗╬υ╬┤╬▒╧Γ ╬▓╧Β╬ψ╧Δ╬║╬╡╧Ε╬▒╬╣ ╧Δ╧Ε╬╖╬╜ ╬╡╬╜╧Ν╧Ε╬╖╧Ε╬▒ ╧Ε╬┐╧Ζ ╬╗╬▒╬┐╧Ξ ╧Ε╬╖╧Γ.<br><br>╬Σ╬╣╧Κ╬╜╬ψ╬▒ ╧Ε╬┐╧Ζ╧Γ ╬╖ ╬╝╬╜╬χ╬╝╬╖.<br><br>╬Ψ╬χ╧Ε╧Κ ╬╖ ╬╝╬υ╧Θ╬╖ ╧Ε╧Κ╬╜ ╬θ╧Θ╧Ζ╧Β╧Ο╬╜.<br>╬Ψ╬χ╧Ε╧Κ ╬╖ ╬Χ╬╗╬╗╬υ╬┤╬▒.<br><br>╬Σ╬╜╧Ε╬╣╧Δ╧Ε╧Β╬υ╧Ε╬╖╬│╬┐╧Γ ( ╬╡.╬▒.)<br>╬Υ╬╡╧Ο╧Β╬│╬╣╬┐╧Γ ╬γ╬φ╬╗╬╗╬╖╧Γ<br>╬Χ╧Α╬ψ╧Ε╬╣╬╝╬┐╧Γ ╬ξ╧Α╬▒╧Β╧Θ╬╖╬│╧Ν╧Γ ╬Υ╬╡╬╜╬╣╬║╬┐╧Ξ ╬Χ╧Α╬╣╧Ε╬╡╬╗╬╡╬ψ╬┐╧Ζ ╬μ╧Ε╧Β╬▒╧Ε╬┐╧Ξ','posts/covers/ZsRtYW1vxYSYy2uLpRqNAyKKbIWfbBMNjlzXMj6j.jpg',NULL,'╬ε╬υ╧Θ╬╖ ╧Ε╧Κ╬╜ ╬θ╧Θ╧Ζ╧Β╧Ο╬╜ (1941) έΑΥ ╬Χ╧Θ╬ψ╬╜╬┐╧Γ ╬η╬υ╬╜╬╕╬╖: ╬ε╬╜╬χ╬╝╬╖ & ╬Χ╬╜╧Ν╧Ε╬╖╧Ε╬▒','╬Ω ╬ε╬υ╧Θ╬╖ ╧Ε╧Κ╬╜ ╬θ╧Θ╧Ζ╧Β╧Ο╬╜ (1941) ╬║╬▒╬╣ ╬╖ ╬╕╧Ζ╧Δ╬ψ╬▒ ╧Δ╧Ε╬┐╬╜ ╬Χ╧Θ╬ψ╬╜╬┐ ╬η╬υ╬╜╬╕╬╖╧Γ, ╧Δ╧Ε╬╖╬╜ ╬▒╬╝╧Ζ╬╜╧Ε╬╣╬║╬χ ╬│╧Β╬▒╬╝╬╝╬χ ╬ε╬╡╧Ε╬▒╬╛╬υ, ╧Δ╧Ζ╬╝╬▓╬┐╬╗╬ψ╬╢╬┐╧Ζ╬╜ ╬▒╬╜╬┤╧Β╬╡╬ψ╬▒, ╬╡╬╜╧Ν╧Ε╬╖╧Ε╬▒ ╬║╬▒╬╣ ╬╡╬╕╬╜╬╣╬║╬χ ╬╝╬╜╬χ╬╝╬╖.','2026-03-28 19:43:00',1,'2026-04-14 15:44:04','2026-05-06 11:46:30'),(5,1,3,'╬Υ╬╣╧Ο╧Β╬│╬┐╧Γ ╬γ╬φ╬╗╬╗╬╖╧Γ: ╬μ╧Θ╬φ╬┤╬╣╬┐ ╬▒╬╜╬▒╧Δ╧Ζ╬│╬║╧Β╧Ν╧Ε╬╖╧Δ╬╖╧Γ ╬║╬▒╬╣ ╬▒╬╜╬υ╧Α╧Ε╧Ζ╬╛╬╖╧Γ ╬│╬╣╬▒ ╬φ╬╜╬▒╬╜ ╬╣╧Δ╧Θ╧Ζ╧Β╧Ν ╬Ι╬▓╧Β╬┐','giorgos-kellis-schedio-anasygkrotisis-kai-anaptyxis-gia-enan-ischyro-evro','╬θ ╬Σ╬╜╧Ε╬╣╧Δ╧Ε╧Β╬υ╧Ε╬╖╬│╬┐╧Γ ╬╡.╬▒. ╬Υ╬╣╧Ο╧Β╬│╬┐╧Γ ╬γ╬φ╬╗╬╗╬╖╧Γ ╧Α╬▒╧Β╬┐╧Ζ╧Δ╬╣╬υ╬╢╬╡╬╣ ╧Ε╬┐ ╬┐╬╗╬┐╬║╬╗╬╖╧Β╧Κ╬╝╬φ╬╜╬┐ ╧Δ╧Θ╬φ╬┤╬╣╬┐ ╬▒╬╜╬▒╧Δ╧Ζ╬│╬║╧Β╧Ν╧Ε╬╖╧Δ╬╖╧Γ ╬║╬▒╬╣ ╬▒╬╜╬υ╧Α╧Ε╧Ζ╬╛╬╖╧Γ ╧Ε╬┐╧Ζ ╬Ι╬▓╧Β╬┐╧Ζ, ╬╝╬╡ ╬φ╧Β╬│╬▒ ╧Ζ╧Α╬┐╬┤╬┐╬╝╧Ο╬╜, ╬╡╬╜╬╡╧Β╬│╬╡╬╣╬▒╬║╬φ╧Γ ╬╡╧Α╬╡╬╜╬┤╧Ξ╧Δ╬╡╬╣╧Γ ╬║╬▒╬╣ ╧Α╬▒╧Β╬╡╬╝╬▓╬υ╧Δ╬╡╬╣╧Γ ╧Α╬┐╧Ζ ╬╡╬╜╬╣╧Δ╧Θ╧Ξ╬┐╧Ζ╬╜ ╧Ε╬╖╬╜ ╬┐╬╣╬║╬┐╬╜╬┐╬╝╬ψ╬▒, ╧Ε╬╖╬╜ ╬▒╧Δ╧Η╬υ╬╗╬╡╬╣╬▒ ╬║╬▒╬╣ ╧Ε╬╖╬╜ ╬║╬┐╬╣╬╜╧Κ╬╜╬╣╬║╬χ ╧Δ╧Ζ╬╜╬┐╧Θ╬χ ╧Ε╬╖╧Γ ╧Α╬╡╧Β╬╣╬┐╧Θ╬χ╧Γ.&nbsp;','&nbsp;╬ν╬╖╬╜ ╬▒╬╜╬υ╬│╬║╬╖ ╬│╬╣╬▒ ╬φ╬╜╬▒ ╬┐╬╗╬┐╬║╬╗╬╖╧Β╧Κ╬╝╬φ╬╜╬┐ ╬║╬▒╬╣ ╬╝╬▒╬║╧Β╬┐╧Α╧Β╧Ν╬╕╬╡╧Δ╬╝╬┐ ╧Δ╧Θ╬φ╬┤╬╣╬┐ ╬▒╬╜╬▒╧Δ╧Ζ╬│╬║╧Β╧Ν╧Ε╬╖╧Δ╬╖╧Γ ╧Ε╬┐╧Ζ ╬Ι╬▓╧Β╬┐╧Ζ ╧Ζ╧Α╬┐╬│╧Β╬▒╬╝╬╝╬ψ╬╢╬╡╬╣ ╧Δ╬╡ ╧Α╧Β╧Ν╧Δ╧Η╬▒╧Ε╬╡╧Γ ╬┤╬╖╬╝╧Ν╧Δ╬╣╬╡╧Γ ╧Α╬▒╧Β╬╡╬╝╬▓╬υ╧Δ╬╡╬╣╧Γ ╧Ε╬┐╧Ζ ╬┐ ╬Σ╬╜╧Ε╬╣╧Δ╧Ε╧Β╬υ╧Ε╬╖╬│╬┐╧Γ ╬╡.╬▒. ╬Υ╬╣╧Ο╧Β╬│╬┐╧Γ ╬γ╬φ╬╗╬╗╬╖╧Γ, ╬╡╧Δ╧Ε╬╣╬υ╬╢╬┐╬╜╧Ε╬▒╧Γ ╧Δ╧Ε╬╖╬╜ ╬▒╧Α╬┐╬║╬▒╧Ε╬υ╧Δ╧Ε╬▒╧Δ╬╖ ╧Ε╧Κ╬╜ ╬╢╬╖╬╝╬╣╧Ο╬╜ ╬▒╧Α╧Ν ╧Ε╬╣╧Γ ╧Η╧Ζ╧Δ╬╣╬║╬φ╧Γ ╬║╬▒╧Ε╬▒╧Δ╧Ε╧Β╬┐╧Η╬φ╧Γ ╬▒╬╗╬╗╬υ ╬║╬▒╬╣ ╧Δ╧Ε╬╖ ╬┤╬╖╬╝╬╣╬┐╧Ζ╧Β╬│╬ψ╬▒ ╬╡╬╜╧Ν╧Γ ╬╜╬φ╬┐╧Ζ ╬▒╬╜╬▒╧Α╧Ε╧Ζ╬╛╬╣╬▒╬║╬┐╧Ξ ╬╝╬┐╬╜╧Ε╬φ╬╗╬┐╧Ζ ╬│╬╣╬▒ ╧Ε╬╖╬╜ ╧Α╬╡╧Β╬╣╬┐╧Θ╬χ. ╬μ╧Ξ╬╝╧Η╧Κ╬╜╬▒ ╬╝╬╡ ╧Ν╧Δ╬▒ ╬╡╧Α╬╣╧Δ╬╖╬╝╬▒╬ψ╬╜╬╡╬╣, ╬╖ ╬▒╬╜╬▒╧Δ╧Ζ╬│╬║╧Β╧Ν╧Ε╬╖╧Δ╬╖ ╧Ε╬┐╧Ζ ╬Ι╬▓╧Β╬┐╧Ζ ╬┤╬╡╬╜ ╧Α╬╡╧Β╬╣╬┐╧Β╬ψ╬╢╬╡╧Ε╬▒╬╣ ╬╝╧Ν╬╜╬┐ ╧Δ╬╡ ╬φ╧Β╬│╬▒ ╬▒╧Α╬┐╬║╬▒╧Ε╬υ╧Δ╧Ε╬▒╧Δ╬╖╧Γ, ╬▒╬╗╬╗╬υ ╬╡╬╜╧Ε╬υ╧Δ╧Δ╬╡╧Ε╬▒╬╣ ╧Δ╬╡ ╬φ╬╜╬▒ ╬╡╧Ζ╧Β╧Ξ╧Ε╬╡╧Β╬┐ ╧Δ╧Θ╬φ╬┤╬╣╬┐ ╧Α╬┐╧Ζ ╧Δ╧Ζ╬╜╬┤╧Ζ╬υ╬╢╬╡╬╣ ╧Ζ╧Α╬┐╬┤╬┐╬╝╬φ╧Γ, ╬╡╧Α╬╡╬╜╬┤╧Ξ╧Δ╬╡╬╣╧Γ, ╬║╬┐╬╣╬╜╧Κ╬╜╬╣╬║╬χ ╧Δ╧Ε╬χ╧Β╬╣╬╛╬╖ ╬║╬▒╬╣ ╬╡╬╜╬ψ╧Δ╧Θ╧Ζ╧Δ╬╖ ╧Ε╬╖╧Γ ╧Ε╬┐╧Α╬╣╬║╬χ╧Γ ╬┐╬╣╬║╬┐╬╜╬┐╬╝╬ψ╬▒╧Γ. <br><br><strong>╬Ι╬╜╬▒ ╧Α╬┐╬╗╧Ζ╬╡╧Α╬ψ╧Α╬╡╬┤╬┐ ╧Α╧Β╧Ν╬│╧Β╬▒╬╝╬╝╬▒ ╧Α╬▒╧Β╬╡╬╝╬▓╬υ╧Δ╬╡╧Κ╬╜ <br></strong><br>╬ν╬┐ ╧Δ╧Θ╬φ╬┤╬╣╬┐ ╧Α╬┐╧Ζ ╬▓╧Β╬ψ╧Δ╬║╬╡╧Ε╬▒╬╣ ╧Δ╬╡ ╬╡╬╛╬φ╬╗╬╣╬╛╬╖ ╬▓╬▒╧Δ╬ψ╬╢╬╡╧Ε╬▒╬╣ ╧Δ╬╡ ╧Ε╬φ╧Δ╧Δ╬╡╧Β╬╣╧Γ ╬▓╬▒╧Δ╬╣╬║╬┐╧Ξ╧Γ ╬υ╬╛╬┐╬╜╬╡╧Γ:<br>&nbsp;╧Ε╬╖╬╜ ╬▒╧Α╬┐╬║╬▒╧Ε╬υ╧Δ╧Ε╬▒╧Δ╬╖ ╧Ε╧Κ╬╜ ╬╢╬╖╬╝╬╣╧Ο╬╜ ╬▒╧Α╧Ν ╧Ε╬╣╧Γ ╧Α╧Β╧Ν╧Δ╧Η╬▒╧Ε╬╡╧Γ ╧Η╧Ζ╧Δ╬╣╬║╬φ╧Γ ╬║╬▒╧Ε╬▒╧Δ╧Ε╧Β╬┐╧Η╬φ╧Γ, ╧Ε╬╖╬╜ ╧Ζ╬╗╬┐╧Α╬┐╬ψ╬╖╧Δ╬╖ ╬╝╬╡╬│╬υ╬╗╧Κ╬╜ ╬▒╬╜╬▒╧Α╧Ε╧Ζ╬╛╬╣╬▒╬║╧Ο╬╜ ╬φ╧Β╬│╧Κ╬╜ ╬╝╬╡ ╬┐╧Β╬ψ╬╢╬┐╬╜╧Ε╬▒ ╧Ε╬┐ 2030, ╧Ε╬╖╬╜ ╧Α╧Β╬┐╧Ο╬╕╬╖╧Δ╬╖ ╬╜╬φ╧Κ╬╜ ╬╡╧Α╬╡╬╜╬┤╧Ξ╧Δ╬╡╧Κ╬╜ ╬║╬▒╬╣ ╬╝╬╡╬╗╬╡╧Ε╧Ο╬╜ ╬│╬╣╬▒ ╧Ε╬╖╬╜ ╬╡╧Α╧Ν╬╝╬╡╬╜╬╖ ╧Α╬╡╧Β╬ψ╬┐╬┤╬┐, ╬║╬▒╬╕╧Ο╧Γ ╬║╬▒╬╣ ╧Ε╬╖╬╜ ╬╡╧Η╬▒╧Β╬╝╬┐╬│╬χ ╬╡╬╣╬┤╬╣╬║╧Ο╬╜ ╬┐╬╣╬║╬┐╬╜╬┐╬╝╬╣╬║╧Ο╬╜ ╬║╬▒╬╣ ╬║╬┐╬╣╬╜╧Κ╬╜╬╣╬║╧Ο╬╜ ╬╝╬φ╧Ε╧Β╧Κ╬╜ ╬│╬╣╬▒ ╧Ε╬╖╬╜ ╧Α╬╡╧Β╬╣╬┐╧Θ╬χ. ╬μ╧Ε╬┐ ╧Α╬╗╬▒╬ψ╧Δ╬╣╬┐ ╬▒╧Ζ╧Ε╧Ν ╧Α╧Β╬┐╬│╧Β╬▒╬╝╬╝╬▒╧Ε╬ψ╬╢╬┐╬╜╧Ε╬▒╬╣ ╬╡╬║╬▒╧Ε╬┐╬╜╧Ε╬υ╬┤╬╡╧Γ ╬φ╧Β╬│╬▒ ╬║╬▒╬╣ ╧Α╬▒╧Β╬╡╬╝╬▓╬υ╧Δ╬╡╬╣╧Γ, ╧Ε╬▒ ╬┐╧Α╬┐╬ψ╬▒ ╬▒╧Η╬┐╧Β╬┐╧Ξ╬╜ ╧Ε╧Ν╧Δ╬┐ ╧Ε╬╣╧Γ ╧Ζ╧Α╬┐╬┤╬┐╬╝╬φ╧Γ ╧Ν╧Δ╬┐ ╬║╬▒╬╣ ╧Ε╬╖ ╧Δ╧Ζ╬╜╬┐╬╗╬╣╬║╬χ ╬▒╬╜╬▒╧Α╧Ε╧Ζ╬╛╬╣╬▒╬║╬χ ╧Α╧Β╬┐╬┐╧Α╧Ε╬╣╬║╬χ ╧Ε╬┐╧Ζ ╬Ι╬▓╧Β╬┐╧Ζ. <br><br><strong>╬Ι╧Β╬│╬▒ ╧Ζ╧Α╬┐╬┤╬┐╬╝╧Ο╬╜ ╬║╬▒╬╣ ╧Δ╧Ε╧Β╬▒╧Ε╬╖╬│╬╣╬║╬φ╧Γ ╬╡╧Α╬╡╬╜╬┤╧Ξ╧Δ╬╡╬╣╧Γ <br></strong><br>╬β╬┤╬╣╬▒╬ψ╧Ε╬╡╧Β╬╖ ╬φ╬╝╧Η╬▒╧Δ╬╖ ╬┤╬ψ╬╜╬╡╧Ε╬▒╬╣ ╧Δ╬╡ ╬φ╧Β╬│╬▒ ╧Α╬┐╧Ζ ╬╡╬╜╬╣╧Δ╧Θ╧Ξ╬┐╧Ζ╬╜ ╧Ε╬┐╬╜ ╬│╬╡╧Κ╧Δ╧Ε╧Β╬▒╧Ε╬╖╬│╬╣╬║╧Ν ╧Β╧Ν╬╗╬┐ ╧Ε╬╖╧Γ ╧Α╬╡╧Β╬╣╬┐╧Θ╬χ╧Γ. ╬ε╬╡╧Ε╬▒╬╛╧Ξ ╧Ε╧Κ╬╜ ╧Δ╬╖╬╝╬▒╬╜╧Ε╬╣╬║╧Ν╧Ε╬╡╧Β╧Κ╬╜ ╧Α╬▒╧Β╬╡╬╝╬▓╬υ╧Δ╬╡╧Κ╬╜ ╧Α╬╡╧Β╬╣╬╗╬▒╬╝╬▓╬υ╬╜╬┐╬╜╧Ε╬▒╬╣ ╬╖ ╬▒╬╜╬▒╬▓╬υ╬╕╬╝╬╣╧Δ╬╖ ╧Ε╬┐╧Ζ ╬┐╬┤╬╣╬║╬┐╧Ξ ╬┤╬╣╬║╧Ε╧Ξ╬┐╧Ζ ╬║╬▒╬╣ ╬║╧Β╬ψ╧Δ╬╣╬╝╧Κ╬╜ ╬│╬╡╧Η╧Ζ╧Β╧Ο╬╜, ╬╖ ╬╡╬╜╬ψ╧Δ╧Θ╧Ζ╧Δ╬╖ ╧Ε╧Κ╬╜ ╬▒╬╜╧Ε╬╣╧Α╬╗╬╖╬╝╬╝╧Ζ╧Β╬╣╬║╧Ο╬╜ ╬φ╧Β╬│╧Κ╬╜, ╬║╬▒╬╕╧Ο╧Γ ╬║╬▒╬╣ ╬╖ ╬▓╬╡╬╗╧Ε╬ψ╧Κ╧Δ╬╖ ╧Ε╧Κ╬╜ ╬▒╧Β╬┤╬╡╧Ζ╧Ε╬╣╬║╧Ο╬╜ ╬║╬▒╬╣ ╧Ζ╬┤╧Β╬╡╧Ζ╧Ε╬╣╬║╧Ο╬╜ ╧Ζ╧Α╬┐╬┤╬┐╬╝╧Ο╬╜. ╬ι╬▒╧Β╬υ╬╗╬╗╬╖╬╗╬▒ ╧Α╧Β╬┐╧Κ╬╕╬╡╬ψ╧Ε╬▒╬╣ ╬╖ ╬▒╬╜╬▒╬▓╬υ╬╕╬╝╬╣╧Δ╬╖ ╧Ε╧Κ╬╜ ╧Δ╧Ζ╬╜╬┐╧Β╬╣╬▒╬║╧Ο╬╜ ╧Δ╧Ε╬▒╬╕╬╝╧Ο╬╜ ╧Δ╧Ε╬┐╧Ζ╧Γ ╬γ╬χ╧Α╬┐╧Ζ╧Γ ╬║╬▒╬╣ ╧Ε╬╣╧Γ ╬γ╬▒╧Δ╧Ε╬▒╬╜╬╣╬φ╧Γ, ╬║╬▒╬╕╧Ο╧Γ ╬║╬▒╬╣ ╬┐ ╬╡╬║╧Δ╧Ζ╬│╧Θ╧Β╬┐╬╜╬╣╧Δ╬╝╧Ν╧Γ ╧Ε╬╖╧Γ ╧Δ╬╣╬┤╬╖╧Β╬┐╬┤╧Β╬┐╬╝╬╣╬║╬χ╧Γ ╧Δ╧Ξ╬╜╬┤╬╡╧Δ╬╖╧Γ ╬Σ╬╗╬╡╬╛╬▒╬╜╬┤╧Β╬┐╧Ξ╧Α╬┐╬╗╬╖╧Γ έΑΥ ╬θ╧Β╬╡╧Δ╧Ε╬╣╬υ╬┤╬▒╧Γ. ╬μ╧Ε╬┐ ╧Α╬╡╬┤╬ψ╬┐ ╧Ε╧Κ╬╜ ╬╝╬╡╧Ε╬▒╧Η╬┐╧Β╧Ο╬╜ ╬╡╬╛╬╡╧Ε╬υ╬╢╬╡╧Ε╬▒╬╣ ╬╡╧Α╬ψ╧Δ╬╖╧Γ ╬╖ ╬▒╬╜╬υ╧Α╧Ε╧Ζ╬╛╬╖ ╬╕╬▒╬╗╬υ╧Δ╧Δ╬╣╬▒╧Γ ╬╡╬╝╧Α╬┐╧Β╬╡╧Ζ╬╝╬▒╧Ε╬╣╬║╬χ╧Γ ╧Δ╧Ξ╬╜╬┤╬╡╧Δ╬╖╧Γ ╬╝╬╡╧Ε╬▒╬╛╧Ξ ╬Σ╬╗╬╡╬╛╬▒╬╜╬┤╧Β╬┐╧Ξ╧Α╬┐╬╗╬╖╧Γ ╬║╬▒╬╣ ╬ι╬╡╬╣╧Β╬▒╬╣╬υ, ╬╡╬╜╬╣╧Δ╧Θ╧Ξ╬┐╬╜╧Ε╬▒╧Γ ╧Ε╬┐╬╜ ╧Β╧Ν╬╗╬┐ ╧Ε╬╖╧Γ ╧Α╬╡╧Β╬╣╬┐╧Θ╬χ╧Γ ╧Κ╧Γ ╧Δ╬╖╬╝╬▒╬╜╧Ε╬╣╬║╬┐╧Ξ ╬║╧Ν╬╝╬▓╬┐╧Ζ ╬╝╬╡╧Ε╬▒╧Η╬┐╧Β╧Ο╬╜ ╬║╬▒╬╣ ╬╡╬╝╧Α╬┐╧Β╬ψ╬┐╧Ζ. <br><br><strong>╬μ╧Ε╬χ╧Β╬╣╬╛╬╖ ╧Ε╬╖╧Γ ╬┐╬╣╬║╬┐╬╜╬┐╬╝╬ψ╬▒╧Γ ╬║╬▒╬╣ ╧Ε╬╖╧Γ ╬▒╧Α╬▒╧Δ╧Θ╧Ν╬╗╬╖╧Δ╬╖╧Γ </strong><br>╬γ╬╡╬╜╧Ε╧Β╬╣╬║╧Ν╧Γ ╧Δ╧Ε╧Ν╧Θ╬┐╧Γ ╧Ε╧Κ╬╜ ╧Α╬▒╧Β╬╡╬╝╬▓╬υ╧Δ╬╡╧Κ╬╜ ╬╡╬ψ╬╜╬▒╬╣ ╬╖ ╬╡╬╜╬ψ╧Δ╧Θ╧Ζ╧Δ╬╖ ╧Ε╬╖╧Γ ╧Ε╬┐╧Α╬╣╬║╬χ╧Γ ╬┐╬╣╬║╬┐╬╜╬┐╬╝╬ψ╬▒╧Γ ╬║╬▒╬╣ ╬╖ ╬┤╬╖╬╝╬╣╬┐╧Ζ╧Β╬│╬ψ╬▒ ╬╜╬φ╧Κ╬╜ ╬╕╬φ╧Δ╬╡╧Κ╬╜ ╬╡╧Β╬│╬▒╧Δ╬ψ╬▒╧Γ. ╬ε╬╡╧Ε╬▒╬╛╧Ξ ╧Ε╧Κ╬╜ ╬╝╬φ╧Ε╧Β╧Κ╬╜ ╧Α╬┐╧Ζ ╧Α╧Β╬┐╧Κ╬╕╬┐╧Ξ╬╜╧Ε╬▒╬╣ ╧Α╬╡╧Β╬╣╬╗╬▒╬╝╬▓╬υ╬╜╬┐╬╜╧Ε╬▒╬╣ ╧Α╧Β╬┐╬│╧Β╬υ╬╝╬╝╬▒╧Ε╬▒ ╧Δ╧Ε╬χ╧Β╬╣╬╛╬╖╧Γ ╧Ε╬╖╧Γ ╬╡╧Α╬╣╧Θ╬╡╬╣╧Β╬╖╬╝╬▒╧Ε╬╣╬║╧Ν╧Ε╬╖╧Ε╬▒╧Γ, ╬╡╬╜╬ψ╧Δ╧Θ╧Ζ╧Δ╬╖ ╧Ε╬┐╧Ζ ╧Α╧Β╧Κ╧Ε╬┐╬│╬╡╬╜╬┐╧Ξ╧Γ ╧Ε╬┐╬╝╬φ╬▒, ╬║╬▒╬╕╧Ο╧Γ ╬║╬▒╬╣ ╬┤╧Β╬υ╧Δ╬╡╬╣╧Γ ╬║╬▒╬╣╬╜╬┐╧Ε╬┐╬╝╬ψ╬▒╧Γ ╬│╬╣╬▒ ╧Ε╬╖╬╜ ╬▒╬│╧Β╬┐╧Ε╬╣╬║╬χ ╧Α╬▒╧Β╬▒╬│╧Κ╬│╬χ. ╬ι╬▒╧Β╬υ╬╗╬╗╬╖╬╗╬▒ ╬╡╬╛╬╡╧Ε╬υ╬╢╬┐╬╜╧Ε╬▒╬╣ ╧Η╬┐╧Β╬┐╬╗╬┐╬│╬╣╬║╬υ ╬║╬ψ╬╜╬╖╧Ε╧Β╬▒ ╬│╬╣╬▒ ╬┐╬╣╬║╬╣╧Δ╬╝╬┐╧Ξ╧Γ ╧Ε╬┐╧Ζ ╬Ι╬▓╧Β╬┐╧Ζ, ╬╡╬╜╧Ο ╧Α╧Β╬┐╧Κ╬╕╬┐╧Ξ╬╜╧Ε╬▒╬╣ ╬║╬▒╬╣ ╬╜╬φ╬╡╧Γ ╬▒╬║╬▒╬┤╬╖╬╝╬▒╧Λ╬║╬φ╧Γ ╬┤╬┐╬╝╬φ╧Γ, ╧Ν╧Α╧Κ╧Γ ╬╖ ╬┤╬╖╬╝╬╣╬┐╧Ζ╧Β╬│╬ψ╬▒ ╬ν╬╝╬χ╬╝╬▒╧Ε╬┐╧Γ ╬γ╧Ε╬╖╬╜╬╣╬▒╧Ε╧Β╬╣╬║╬χ╧Γ ╧Δ╧Ε╬╖╬╜ ╬θ╧Β╬╡╧Δ╧Ε╬╣╬υ╬┤╬▒ ╬║╬▒╬╣ ╬╝╬╡╧Ε╬▒╧Α╧Ε╧Ζ╧Θ╬╣╬▒╬║╬┐╧Ξ ╧Α╧Β╬┐╬│╧Β╬υ╬╝╬╝╬▒╧Ε╬┐╧Γ ╬ι╬┐╬╗╬╣╧Ε╬╣╬║╬χ╧Γ ╬ι╧Β╬┐╧Δ╧Ε╬▒╧Δ╬ψ╬▒╧Γ ╧Δ╧Ε╬┐ ╬μ╬┐╧Ζ╧Η╬╗╬ψ. <br><br><strong>╬ι╬╡╧Β╬╣╬▓╬υ╬╗╬╗╬┐╬╜ ╬║╬▒╬╣ ╧Α╧Β╧Ν╬╗╬╖╧Ι╬╖ ╧Η╧Ζ╧Δ╬╣╬║╧Ο╬╜ ╬║╬▒╧Ε╬▒╧Δ╧Ε╧Β╬┐╧Η╧Ο╬╜ </strong><br>╬μ╬╖╬╝╬▒╬╜╧Ε╬╣╬║╧Ν ╬╝╬φ╧Β╬┐╧Γ ╧Ε╬┐╧Ζ ╧Δ╧Θ╬╡╬┤╬╣╬▒╧Δ╬╝╬┐╧Ξ ╬▒╧Η╬┐╧Β╬υ ╧Ε╬╖╬╜ ╧Α╧Β╬┐╧Δ╧Ε╬▒╧Δ╬ψ╬▒ ╧Ε╬┐╧Ζ ╧Η╧Ζ╧Δ╬╣╬║╬┐╧Ξ ╧Α╬╡╧Β╬╣╬▓╬υ╬╗╬╗╬┐╬╜╧Ε╬┐╧Γ ╬║╬▒╬╣ ╧Ε╬╖╬╜ ╧Α╧Β╧Ν╬╗╬╖╧Ι╬╖ ╬╝╬╡╬╗╬╗╬┐╬╜╧Ε╬╣╬║╧Ο╬╜ ╧Η╧Ζ╧Δ╬╣╬║╧Ο╬╜ ╬║╬▒╧Ε╬▒╧Δ╧Ε╧Β╬┐╧Η╧Ο╬╜. ╬μ╧Ε╬┐ ╬Φ╬υ╧Δ╬┐╧Γ ╧Ε╬╖╧Γ ╬Φ╬▒╬┤╬╣╬υ╧Γ ╧Ζ╬╗╬┐╧Α╬┐╬╣╬┐╧Ξ╬╜╧Ε╬▒╬╣ ╬φ╧Β╬│╬▒ ╬▒╧Α╬┐╬║╬▒╧Ε╬υ╧Δ╧Ε╬▒╧Δ╬╖╧Γ ╬║╬▒╬╣ ╬▒╬╜╧Ε╬╣╬┤╬╣╬▒╬▓╧Β╧Κ╧Ε╬╣╬║╧Ο╬╜ ╧Α╬▒╧Β╬╡╬╝╬▓╬υ╧Δ╬╡╧Κ╬╜, ╬╡╬╜╧Ο ╬╡╬╜╬╣╧Δ╧Θ╧Ξ╬┐╬╜╧Ε╬▒╬╣ ╧Ε╬▒ ╧Δ╧Ζ╧Δ╧Ε╬χ╬╝╬▒╧Ε╬▒ ╧Α╧Β╧Ν╬╗╬╖╧Ι╬╖╧Γ ╬║╬▒╬╣ ╬▒╬╜╧Ε╬╣╬╝╬╡╧Ε╧Ο╧Α╬╣╧Δ╬╖╧Γ ╧Α╧Ζ╧Β╬║╬▒╬│╬╣╧Ο╬╜. ╬ν╬▒╧Ζ╧Ε╧Ν╧Θ╧Β╬┐╬╜╬▒ ╧Α╧Β╬┐╧Κ╬╕╬┐╧Ξ╬╜╧Ε╬▒╬╣ ╬φ╧Β╬│╬▒ ╬┤╬╣╬▒╧Θ╬╡╬ψ╧Β╬╣╧Δ╬╖╧Γ ╧Ζ╬┤╬υ╧Ε╧Κ╬╜ ╬║╬▒╬╣ ╧Η╧Β╬▒╬│╬╝╬υ╧Ε╧Κ╬╜ ╧Α╬┐╧Ζ ╬▒╬╜╬▒╬╝╬φ╬╜╬╡╧Ε╬▒╬╣ ╬╜╬▒ ╬╡╬╜╬╣╧Δ╧Θ╧Ξ╧Δ╬┐╧Ζ╬╜ ╧Ε╬╖╬╜ ╬▒╬│╧Β╬┐╧Ε╬╣╬║╬χ ╧Α╬▒╧Β╬▒╬│╧Κ╬│╬χ ╬║╬▒╬╣ ╬╜╬▒ ╧Α╬╡╧Β╬╣╬┐╧Β╬ψ╧Δ╬┐╧Ζ╬╜ ╧Ε╬┐╬╜ ╬║╬ψ╬╜╬┤╧Ζ╬╜╬┐ ╧Α╬╗╬╖╬╝╬╝╧Ζ╧Β╧Ο╬╜. <br><strong>╬Σ╬╜╬υ╧Α╧Ε╧Ζ╬╛╬╖ ╬╝╬╡ ╬╡╬╕╬╜╬╣╬║╬χ ╬┤╬╣╬υ╧Δ╧Ε╬▒╧Δ╬╖ </strong><br>╬Ω ╬▒╬╜╬▒╧Α╧Ε╧Ζ╬╛╬╣╬▒╬║╬χ ╧Α╬┐╧Β╬╡╬ψ╬▒ ╧Ε╬┐╧Ζ ╬Ι╬▓╧Β╬┐╧Ζ ╬┤╬╡╬╜ ╬▒╧Α╬┐╧Ε╬╡╬╗╬╡╬ψ ╬╝╧Ν╬╜╬┐ ╧Α╬╡╧Β╬╣╧Η╬╡╧Β╬╡╬╣╬▒╬║╧Ν ╬╢╬χ╧Ε╬╖╬╝╬▒, ╬▒╬╗╬╗╬υ ╧Δ╧Ζ╬╜╬┤╬φ╬╡╧Ε╬▒╬╣ ╬υ╬╝╬╡╧Δ╬▒ ╬╝╬╡ ╧Ε╬╖╬╜ ╬┐╬╣╬║╬┐╬╜╬┐╬╝╬╣╬║╬χ ╬▒╬╜╬υ╧Α╧Ε╧Ζ╬╛╬╖, ╧Ε╬╖╬╜ ╬║╬┐╬╣╬╜╧Κ╬╜╬╣╬║╬χ ╧Δ╧Ζ╬╜╬┐╧Θ╬χ ╬║╬▒╬╣ ╧Ε╬╖ ╧Δ╧Ε╧Β╬▒╧Ε╬╖╬│╬╣╬║╬χ ╧Δ╬╖╬╝╬▒╧Δ╬ψ╬▒ ╧Ε╬╖╧Γ ╬α╧Β╬υ╬║╬╖╧Γ. ╬μ╧Ε╧Ν╧Θ╬┐╧Γ ╧Ε╧Κ╬╜ ╧Α╬▒╧Β╬╡╬╝╬▓╬υ╧Δ╬╡╧Κ╬╜ ╬╡╬ψ╬╜╬▒╬╣ ╬╖ ╬┐╧Ζ╧Δ╬╣╬▒╧Δ╧Ε╬╣╬║╬χ ╬▓╬╡╬╗╧Ε╬ψ╧Κ╧Δ╬╖ ╧Ε╬╖╧Γ ╬║╬▒╬╕╬╖╬╝╬╡╧Β╬╣╬╜╧Ν╧Ε╬╖╧Ε╬▒╧Γ ╧Ε╧Κ╬╜ ╧Α╬┐╬╗╬╣╧Ε╧Ο╬╜ ╬║╬▒╬╣ ╬╖ ╬╡╬╜╬ψ╧Δ╧Θ╧Ζ╧Δ╬╖ ╧Ε╬╖╧Γ ╬╡╬╝╧Α╬╣╧Δ╧Ε╬┐╧Δ╧Ξ╬╜╬╖╧Γ ╧Ε╧Κ╬╜ ╧Ε╬┐╧Α╬╣╬║╧Ο╬╜ ╬║╬┐╬╣╬╜╧Κ╬╜╬╣╧Ο╬╜ ╧Α╧Β╬┐╧Γ ╧Ε╬┐ ╬║╧Β╬υ╧Ε╬┐╧Γ&nbsp;','posts/covers/CT7CdQrBVquY523GEZqKCpOyebG5k2IZPLmnVZ7J.jpg',NULL,'╬Υ╬╣╧Ο╧Β╬│╬┐╧Γ ╬γ╬φ╬╗╬╗╬╖╧Γ: ╬ν╬┐ ╧Δ╧Θ╬φ╬┤╬╣╬┐ ╬▒╬╜╬υ╧Α╧Ε╧Ζ╬╛╬╖╧Γ ╬║╬▒╬╣ ╬▒╬╜╬▒╧Δ╧Ζ╬│╬║╧Β╧Ν╧Ε╬╖╧Δ╬╖╧Γ ╧Ε╬┐╧Ζ ╬Ι╬▓╧Β╬┐╧Ζ','╬θ ╬Υ╬╣╧Ο╧Β╬│╬┐╧Γ ╬γ╬φ╬╗╬╗╬╖╧Γ ╧Α╬▒╧Β╬┐╧Ζ╧Δ╬╣╬υ╬╢╬╡╬╣ ╧Ε╬┐ ╧Δ╧Θ╬φ╬┤╬╣╬┐ ╬▒╬╜╬▒╧Δ╧Ζ╬│╬║╧Β╧Ν╧Ε╬╖╧Δ╬╖╧Γ ╬║╬▒╬╣ ╬▒╬╜╬υ╧Α╧Ε╧Ζ╬╛╬╖╧Γ ╧Ε╬┐╧Ζ ╬Ι╬▓╧Β╬┐╧Ζ, ╬╝╬╡ ╬φ╧Β╬│╬▒ ╧Ζ╧Α╬┐╬┤╬┐╬╝╧Ο╬╜, ╬╡╧Α╬╡╬╜╬┤╧Ξ╧Δ╬╡╬╣╧Γ ╬║╬▒╬╣ ╬╝╬φ╧Ε╧Β╬▒ ╧Δ╧Ε╬χ╧Β╬╣╬╛╬╖╧Γ ╧Ε╬╖╧Γ ╧Ε╬┐╧Α╬╣╬║╬χ╧Γ ╬┐╬╣╬║╬┐╬╜╬┐╬╝╬ψ╬▒╧Γ.','2026-04-23 12:32:00',1,'2026-04-23 09:34:05','2026-04-23 09:39:41');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('3v9h7nrYvy40CYVcFYLGlZLrlCkiYFhdECsYXhkr',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWZ1RlFvd3JUVGw3dWZ2UENPcWx0SzhRdnBDT2owU1I5VDNldnhIcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9naW9yZ29zLWtlbGxpcy50ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1776348623),('7z10HVPTLLqr3OHLUcPbcaGrKiRCB44pBNEEWkGv',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2NOV25lemlaRTFuUFBNNkpoeU55ZGZLNjEwN1FzNjJJeDhCRHZGZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9naW9yZ29zLWtlbGxpcy50ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1778084744),('9FN3Ws2tVNFUfpxaa0T7obc9nGx22tbGyroBi09B',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoibWJyTVJxQk1yek42THlrY3FEWEdHOWVBTWVvd0dGMmV3TmY0MTBLdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly9naW9yZ29zLWtlbGxpcy50ZXN0L2FkbWluL3Bvc3RzLzIvZWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==',1776203245),('o3EQGIJqFkxappqiU4R2ZwkOozEDMy3ajyi8O766',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTUdkbm5ZZUlRZzFrcTdlR2E4Y2JUSHJITlpiME5obEVVM0pna0lZTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly9naW9yZ29zLWtlbGxpcy50ZXN0L2FkbWluL3Bvc3RzLzIvZWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==',1776203245);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'25╬╖ ╬ε╬▒╧Β╧Ε╬ψ╬┐╧Ζ','25i-martioy','2026-04-14 15:39:53','2026-04-14 15:39:53'),(2,'╬Χ╬╕╬╜╬╣╬║╬χ ╬╡╬┐╧Β╧Ε╬χ','ethniki-eorti','2026-04-14 15:39:53','2026-04-14 15:39:53'),(3,'╬ε╬υ╧Θ╬╖ ╧Ε╧Κ╬╜ ╬┐╧Θ╧Ζ╧Β╧Ο╬╜','makhi-ton-okhirwn','2026-04-14 15:44:04','2026-04-14 15:44:04'),(4,'╬η╬υ╬╜╬╕╬╖','ksanthi','2026-04-14 15:44:04','2026-04-14 15:44:04'),(5,'╬Χ╧Θ╬ψ╬╜╬┐╧Γ','ekhinos','2026-04-14 15:57:27','2026-04-14 15:57:27'),(6,'╬Υ╬╣╧Ο╧Β╬│╬┐╧Γ ╬γ╬φ╬╗╬╗╬╖╧Γ','giwrghos-kellis','2026-04-23 09:34:05','2026-04-23 09:34:05'),(7,'╬Ι╬▓╧Β╬┐╧Γ','evros','2026-04-23 09:34:05','2026-04-23 09:34:05'),(8,'╬Σ╬╜╬▒╧Δ╧Ζ╬│╬║╧Β╧Ν╧Ε╬╖╧Δ╬╖ ╬Ι╬▓╧Β╬┐╧Ζ','anasighkrotisi-evroy','2026-04-23 09:34:05','2026-04-23 09:34:05'),(9,'╬Σ╬╜╬υ╧Α╧Ε╧Ζ╬╛╬╖ ╬α╧Β╬υ╬║╬╖╧Γ','anaptiksi-thrakis','2026-04-23 09:34:05','2026-04-23 09:34:05'),(10,'╬ξ╧Α╬┐╬┤╬┐╬╝╬φ╧Γ','ypodomes','2026-04-23 09:34:05','2026-04-23 09:34:05'),(11,'╬ι╬┐╬╗╬╣╧Ε╬╣╬║╬χ ╬ι╧Β╬┐╧Δ╧Ε╬▒╧Δ╬ψ╬▒','politiki-prostasia','2026-04-23 09:34:05','2026-04-23 09:34:05'),(12,'╬Τ╧Ν╧Β╬╡╬╣╬▒ ╬Χ╬╗╬╗╬υ╬┤╬▒','boreia-ellada','2026-04-23 09:34:05','2026-04-23 09:34:05'),(13,'╬Χ╧Α╬▒╬╜╬υ╧Δ╧Ε╬▒╧Δ╬╖ 1821','epanastasi-1821','2026-05-06 11:43:20','2026-05-06 11:43:20'),(14,'╬Χ╧Ζ╬▒╬│╬│╬╡╬╗╬╣╧Δ╬╝╧Ν╧Γ ╬α╬╡╬┐╧Ε╧Ν╬║╬┐╧Ζ','efaghghelismos-theotokoy','2026-05-06 11:43:20','2026-05-06 11:43:20'),(15,'╬Υ╬╡╧Ο╧Β╬│╬╣╬┐╧Γ ╬γ╬φ╬╗╬╗╬╖╧Γ','gewrghios-kellis','2026-05-06 11:43:20','2026-05-06 11:43:20'),(16,'╬Χ╬╗╬╗╬╖╬╜╬╣╧Δ╬╝╧Ν╧Γ','ellinismos','2026-05-06 11:43:20','2026-05-06 11:43:20'),(17,'╬Χ╬╕╬╜╬╣╬║╬χ ╬Η╬╝╧Ζ╬╜╬▒','ethniki-amina','2026-05-06 11:43:20','2026-05-06 11:43:20'),(18,'╬Ι╬╜╬┐╧Α╬╗╬╡╧Γ ╬Φ╧Ζ╬╜╬υ╬╝╬╡╬╣╧Γ','enoples-dinameis','2026-05-06 11:43:20','2026-05-06 11:43:20'),(19,'╬α╧Β╬υ╬║╬╖','thraki','2026-05-06 11:43:20','2026-05-06 11:43:20'),(20,'╬ι╬▒╧Ε╧Β╬ψ╬┤╬▒ ╬║╬▒╬╣ ╬ι╬ψ╧Δ╧Ε╬╖','patrida-kai-pisti','2026-05-06 11:43:21','2026-05-06 11:43:21'),(21,'╬Χ╬╕╬╜╬╣╬║╬χ ╬Χ╧Α╬φ╧Ε╬╡╬╣╬┐╧Γ','ethniki-epeteios','2026-05-06 11:43:21','2026-05-06 11:43:21'),(22,'╬Χ╬╗╬╗╬υ╬┤╬▒','ellada','2026-05-06 11:43:21','2026-05-06 11:43:21'),(23,'╬γ╧Ζ╧Β╬╣╬▒╧Β╧Θ╬╣╬║╬υ ╬Φ╬╣╬║╬▒╬╣╧Ο╬╝╬▒╧Ε╬▒','kiriarkhika-dikaiwmata','2026-05-06 11:43:21','2026-05-06 11:43:21'),(24,'╬Σ╧Δ╧Η╬υ╬╗╬╡╬╣╬▒ ╬║╬▒╬╣ ╬μ╧Ε╬▒╬╕╬╡╧Β╧Ν╧Ε╬╖╧Ε╬▒','asfaleia-kai-statherotita','2026-05-06 11:43:21','2026-05-06 11:43:21'),(25,'╬Υ╧Β╬▒╬╝╬╝╬χ ╬ε╬╡╧Ε╬▒╬╛╬υ','grammi-metaksa','2026-05-06 11:46:30','2026-05-06 11:46:30'),(26,'╬Σ╧Α╧Β╬ψ╬╗╬╣╬┐╧Γ 1941','aprilios-1941','2026-05-06 11:46:30','2026-05-06 11:46:30'),(27,'╬Τ ╬ι╬▒╬│╬║╧Ν╧Δ╬╝╬╣╬┐╧Γ ╬ι╧Ν╬╗╬╡╬╝╬┐╧Γ ╬Χ╬╗╬╗╬υ╬┤╬▒','b-paghkosmios-polemos-ellada','2026-05-06 11:46:30','2026-05-06 11:46:30'),(28,'╬Υ╬╡╧Β╬╝╬▒╬╜╬╣╬║╬χ ╬Χ╬╣╧Δ╬▓╬┐╬╗╬χ ╬Χ╬╗╬╗╬υ╬┤╬▒','germaniki-eisvoli-ellada','2026-05-06 11:46:30','2026-05-06 11:46:30'),(29,'╬θ╧Θ╧Ζ╧Β╬υ ╬κ╬┐╧Ξ╧Α╬╡╬╗','okhira-roupel','2026-05-06 11:46:30','2026-05-06 11:46:30'),(30,'╬Χ╬╗╬╗╬╖╬╜╬╣╬║╧Ν╧Γ ╬μ╧Ε╧Β╬▒╧Ε╧Ν╧Γ','ellinikos-stratos','2026-05-06 11:46:30','2026-05-06 11:46:30'),(31,'╬μ╧Ε╧Β╬▒╧Ε╬╣╧Κ╧Ε╬╣╬║╬χ ╬β╧Δ╧Ε╬┐╧Β╬ψ╬▒ ╬Χ╬╗╬╗╬υ╬┤╬▒╧Γ','stratiotiki-istoria-elladas','2026-05-06 11:46:30','2026-05-06 11:46:30'),(32,'╬Χ╬╕╬╜╬╣╬║╬χ ╬Σ╬╜╧Ε╬ψ╧Δ╧Ε╬▒╧Δ╬╖','ethniki-antistasi','2026-05-06 11:46:30','2026-05-06 11:46:30'),(33,'╬Χ╬╕╬╜╬╣╬║╬χ ╬Χ╬╜╧Ν╧Ε╬╖╧Ε╬▒','ethniki-enotita','2026-05-06 11:46:30','2026-05-06 11:46:30'),(34,'╬Χ╧Θ╬ψ╬╜╬┐╧Γ ╬η╬υ╬╜╬╕╬╖╧Γ','ekhinos-ksanthis','2026-05-06 11:46:30','2026-05-06 11:46:30'),(35,'╬Κ╧Β╧Κ╬╡╧Γ ╬Χ╬╗╬╗╬υ╬┤╬▒╧Γ','iroes-elladas','2026-05-06 11:46:30','2026-05-06 11:46:30'),(36,'╬α╧Ζ╧Δ╬ψ╬▒ ╬│╬╣╬▒ ╧Ε╬╖╬╜ ╬ι╬▒╧Ε╧Β╬ψ╬┤╬▒','thisia-ghia-tin-patrida','2026-05-06 11:46:30','2026-05-06 11:46:30'),(37,'╬Χ╬╗╬╡╧Ζ╬╕╬╡╧Β╬ψ╬▒','eleftheria','2026-05-06 11:46:30','2026-05-06 11:46:30'),(38,'╬ι╬▒╧Ε╧Β╬╣╧Κ╧Ε╬╣╧Δ╬╝╧Ν╧Γ','patriotismos','2026-05-06 11:46:30','2026-05-06 11:46:30'),(39,'╬π╧Β╬╣╧Δ╧Ε╬╣╬▒╬╜╬┐╬ψ ╬║╬▒╬╣ ╬ε╬┐╧Ζ╧Δ╬┐╧Ζ╬╗╬╝╬υ╬╜╬┐╬╣ ╬Ι╬╗╬╗╬╖╬╜╬╡╧Γ','xristiani-kai-moysoylmanoi-ellines','2026-05-06 11:46:30','2026-05-06 11:46:30'),(40,'╬γ╬┐╬╣╬╜╬χ ╬α╧Ζ╧Δ╬ψ╬▒','koini-thisia','2026-05-06 11:46:30','2026-05-06 11:46:30'),(41,'╬β╧Δ╧Ε╬┐╧Β╬╣╬║╬χ ╬ε╬╜╬χ╬╝╬╖','istoriki-mnimi','2026-05-06 11:46:30','2026-05-06 11:46:30');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Site Administrator','in.agora.store@gmail.com',NULL,'$2y$12$vkMH097FlZRRp19OjHOuEeoq.D4wO.B7rcAhc3d8B5P6xUFYu3Pva','Qf7bYvPrnfc2OUGTGcDhsvATwz11NEMH2IeDRkcMy7nOcKVDMQdZ46eDjt4B','2026-04-14 14:27:18','2026-05-06 10:51:23');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'giorgoskellis'
--

--
-- Dumping routines for database 'giorgoskellis'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-06 19:28:26
