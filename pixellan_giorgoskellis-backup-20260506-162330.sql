-- Exported from pixellan_giorgoskellis at 2026-05-06 16:23:30
SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';
SET NAMES utf8mb4;

--
-- Table structure for `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `cache`
--


--
-- Table structure for `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `cache_locks`
--


--
-- Table structure for `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (1, 'Εθνική εορτή', 'ethniki-eorti', '2026-04-14 18:39:53', '2026-04-14 18:39:53');
INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (2, 'Μάχη των οχυρών', 'makhi-ton-okhirwn', '2026-04-14 18:44:04', '2026-04-14 18:44:04');
INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (3, 'Παρεμβάσεις', 'paremvaseis', '2026-04-23 12:34:05', '2026-04-23 12:34:05');
INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (4, 'News', 'news', '2026-05-06 13:51:23', '2026-05-06 13:51:23');
INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (5, 'Ανακοινώσεις', 'anakoinoseis', '2026-05-06 13:51:23', '2026-05-06 13:51:23');
INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (6, 'Συνεντεύξεις', 'synentefxeis', '2026-05-06 13:51:23', '2026-05-06 13:51:23');
INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (7, 'Απόψεις', 'apopseis', '2026-05-06 13:51:23', '2026-05-06 13:51:23');

--
-- Table structure for `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
CREATE TABLE `contact_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `consented_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_messages_email_index` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `subject`, `message`, `ip_address`, `user_agent`, `consented_at`, `created_at`, `updated_at`) VALUES (1, 'Test', 'in.agora.store@gmail.com', 'Ye st', 'Hshejsjsjhdjdh', '78.171.87.60', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Mobile Safari/537.36', '2026-04-16 16:54:46', '2026-04-16 16:54:46', '2026-04-16 16:54:46');
INSERT INTO `contact_messages` (`id`, `name`, `email`, `subject`, `message`, `ip_address`, `user_agent`, `consented_at`, `created_at`, `updated_at`) VALUES (2, 'dsasad', 'in.agora.store@gmail.com', 'dsadsadsadsadsad', 'ffdfdsfsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdsfs', '193.43.135.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-16 17:03:26', '2026-04-16 17:03:26', '2026-04-16 17:03:26');
INSERT INTO `contact_messages` (`id`, `name`, `email`, `subject`, `message`, `ip_address`, `user_agent`, `consented_at`, `created_at`, `updated_at`) VALUES (3, 'tes', 'fkantas@mfa.gr', 'thema', 'mhnyma', '193.43.135.222', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-04-16 17:12:29', '2026-04-16 17:12:29', '2026-04-16 17:12:29');
INSERT INTO `contact_messages` (`id`, `name`, `email`, `subject`, `message`, `ip_address`, `user_agent`, `consented_at`, `created_at`, `updated_at`) VALUES (4, 'ΟΙΚΟΓΕΝΕΙΑ ΚΑΝΤΑ', 'fkantas@mfa.gr', 'τεστ', 'κειμενο', '45.85.144.253', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-23 16:44:12', '2026-04-23 16:44:12', '2026-04-23 16:44:12');

--
-- Table structure for `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `failed_jobs`
--


--
-- Table structure for `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `job_batches`
--


--
-- Table structure for `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `jobs`
--


--
-- Table structure for `media_items`
--

DROP TABLE IF EXISTS `media_items`;
CREATE TABLE `media_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(30) NOT NULL DEFAULT 'image',
  `file_path` varchar(255) NOT NULL,
  `thumbnail_path` varchar(255) DEFAULT NULL,
  `source_url` varchar(255) DEFAULT NULL,
  `published_on` date DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_items_slug_unique` (`slug`),
  KEY `media_items_type_index` (`type`),
  KEY `media_items_published_on_index` (`published_on`),
  KEY `media_items_is_featured_index` (`is_featured`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `media_items`
--

INSERT INTO `media_items` (`id`, `title`, `slug`, `description`, `type`, `file_path`, `thumbnail_path`, `source_url`, `published_on`, `is_featured`, `created_at`, `updated_at`) VALUES (1, 'National Broadcast Interview', 'national-broadcast-interview', 'Discussion on defense strategy and civic unity.', 'interview', 'media/sample-interview.jpg', NULL, NULL, '2026-05-06', 1, '2026-04-14 17:27:18', '2026-05-06 13:51:23');

--
-- Table structure for `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (4, '2026_04_14_165710_create_pages_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (5, '2026_04_14_165711_create_contact_messages_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (6, '2026_04_14_165711_create_media_items_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (7, '2026_04_14_165711_create_posts_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (8, '2026_04_14_191500_change_posts_excerpt_to_text', 2);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (9, '2026_04_14_193000_create_categories_and_tags_for_posts', 3);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (10, '2026_04_15_100000_add_og_image_to_posts_table', 4);

--
-- Table structure for `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(160) DEFAULT NULL,
  `structured_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`structured_data`)),
  `content` longtext NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`),
  KEY `pages_is_published_index` (`is_published`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `meta_title`, `meta_description`, `structured_data`, `content`, `is_published`, `created_at`, `updated_at`) VALUES (1, 'Biography', 'biography', NULL, NULL, NULL, 'Retired Lieutenant General with decades of national and international command experience.', 1, '2026-04-14 17:27:18', '2026-04-14 17:27:18');

--
-- Table structure for `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `password_reset_tokens`
--


--
-- Table structure for `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE `post_tag` (
  `post_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `post_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `post_tag`
--

INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (1, 1);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (1, 4);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (1, 13);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (1, 14);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (1, 15);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (1, 16);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (1, 17);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (1, 18);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (1, 19);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (1, 20);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (1, 21);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (1, 22);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (1, 23);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (1, 24);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 3);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 15);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 16);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 19);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 25);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 26);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 27);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 28);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 29);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 30);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 31);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 32);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 33);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 34);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 35);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 36);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 37);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 38);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 39);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 40);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (2, 41);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (5, 4);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (5, 6);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (5, 7);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (5, 8);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (5, 9);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (5, 10);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (5, 11);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (5, 12);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 6);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 7);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 8);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 10);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 42);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 43);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 44);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 45);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 46);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 47);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 48);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 49);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 50);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 51);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 52);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 53);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 54);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 55);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 56);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 57);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 58);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 59);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 60);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (6, 61);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 4);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 6);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 8);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 19);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 46);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 48);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 61);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 62);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 63);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 64);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 65);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 66);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 67);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 68);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 69);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 70);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 71);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 72);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 73);
INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES (7, 74);

--
-- Table structure for `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `excerpt` text NOT NULL,
  `body` longtext NOT NULL,
  `cover_image_path` varchar(255) DEFAULT NULL,
  `og_image` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(160) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `slug`, `excerpt`, `body`, `cover_image_path`, `og_image`, `meta_title`, `meta_description`, `published_at`, `is_published`, `created_at`, `updated_at`) VALUES (1, 1, 7, 'Γεώργιος Κέλλης : 25η Μαρτίου. Διπλή Εορτή, Αδιαπραγμάτευτες Αξίες: Πίστη και Πατρίδα', 'georgios-kellis-25i-martiou-dipli-eorti-adiapragmateutes-axies-pisti-kai-patrida', '&nbsp;Μήνυμα του Γεώργιου Κέλλη για την 25η Μαρτίου: η διπλή εορτή του Ελληνισμού και της Ορθοδοξίας αναδεικνύει τις διαχρονικές αξίες της πίστης, της ενότητας και της εθνικής υπερηφάνειας, σε ένα απαιτητικό γεωπολιτικό περιβάλλον.&nbsp;', '&nbsp;Με ιδιαίτερη συγκίνηση και εθνική υπερηφάνεια τιμούμε την επέτειο της 25ης Μαρτίου 1821, μια ημέρα που αποτελεί διαχρονικό σύμβολο πίστης, θυσίας και αγώνα για ελευθερία. Ταυτόχρονα, η ημέρα αυτή φέρει και βαθύ θρησκευτικό συμβολισμό, καθώς εορτάζεται ο Ευαγγελισμός της Θεοτόκου, αναδεικνύοντας τον διττό χαρακτήρα της ως γιορτή της Ορθοδοξίας και του Ελληνισμού. Οι αγωνιστές της Επανάστασης απέδειξαν ότι όταν ο Ελληνισμός είναι ενωμένος, με πίστη στην πατρίδα και στις αξίες του, μπορεί να υπερβεί κάθε δυσκολία και να διεκδικήσει το δικαίωμά του στην ελευθερία και την αξιοπρέπεια.<br><br>Σήμερα, μέσα σε ένα σύνθετο και απαιτητικό γεωπολιτικό περιβάλλον, η ιστορική αυτή παρακαταθήκη αποκτά ιδιαίτερη σημασία. Η Ελλάδα παραμένει προσηλωμένη στην υπεράσπιση της εθνικής κυριαρχίας και των κυριαρχικών της δικαιωμάτων, διατηρώντας ισχυρή αποτρεπτική ικανότητα και υψηλό επίπεδο ετοιμότητας.<br><br>Οι πρόσφατες κινήσεις ενίσχυσης της άμυνας, στον Έβρο, την Κάρπαθο και την ευρύτερη περιοχή της Κύπρου, με την παρουσία σύγχρονων αμυντικών συστημάτων που ενισχύουν την ασπίδα προστασίας της πατρίδας, σε συνδυασμό με την επιτυχή επιχειρησιακή αξιοποίηση ελληνικών αμυντικών μέσων στο εξωτερικό, υπογραμμίζουν ότι η ασφάλεια, η σταθερότητα και η ειρήνη διασφαλίζονται με υπευθυνότητα, ετοιμότητα και εθνική αυτοπεποίθηση.<br><br>Οι Ένοπλες Δυνάμεις της χώρας, με υψηλό φρόνημα, επαγγελματισμό και αφοσίωση, στέκονται άγρυπνοι φρουροί της ελευθερίας και της εθνικής αξιοπρέπειας, συνεχίζοντας επάξια την παράδοση των προγόνων μας.<br><br>Η επέτειος της 25ης Μαρτίου μάς καλεί όλους να αντλήσουμε δύναμη από την ιστορία μας και να προχωρήσουμε με ενότητα, αποφασιστικότητα και πίστη στις διαχρονικές αξίες του Ελληνισμού.<br><br>Χρόνια πολλά σε όλες τις Ελληνίδες και όλους τους Έλληνες.<br><br>Ζήτω η 25η Μαρτίου.<br>Ζήτω η Ελλάδα.<br>Ζήτω η Θράκη.<br>Ζήτω η Ξάνθη.<br><br>Αντιστράτηγος (ε.α.) Γεώργιος Κέλλης<br>Επίτιμος Υπαρχηγός Γενικού<br>Επιτελείου Στρατού&nbsp;<br><br><br>', 'posts/covers/l1ENQ2s3aIrObLqoogIBu9HmE9dlbPoZYJonyCHN.jpg', NULL, 'Γεώργιος Κέλλης: 25η Μαρτίου – Πίστη, Πατρίδα, Εθνική Ισχύς', 'Μήνυμα του Γεώργιου Κέλλη για την 25η Μαρτίου. Η σημασία της πίστης, της εθνικής ενότητας και της ισχυρής άμυνας σε σύγχρονο γεωπολιτικό περιβάλλον.', '2026-03-25 01:51:00', 1, '2026-04-14 17:27:18', '2026-05-06 14:46:57');
INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `slug`, `excerpt`, `body`, `cover_image_path`, `og_image`, `meta_title`, `meta_description`, `published_at`, `is_published`, `created_at`, `updated_at`) VALUES (2, 1, 7, 'Η Μάχη των Οχυρών και η Θυσία στον Εχίνο: Μνήμη, Ενότητα και Πατριωτισμός', 'i-machi-ton-ochyron-kai-i-thysia-ston-echino-mnimi-enotita-kai-patriotismos', 'Η Μάχη των Οχυρών, τον Απρίλιο του 1941, αποτελεί μία από τις πλέον ένδοξες σελίδες της νεότερης ελληνικής ιστορίας. Στο πλαίσιο της γερμανικής εισβολής, η αμυντική γραμμή Μεταξά στάθηκε σύμβολο αντίστασης, τιμής και στρατιωτικής αρετής. Παρά τη συντριπτική υπεροχή των επιτιθέμενων δυνάμεων, οι Έλληνες υπερασπιστές των...', 'Η Μάχη των Οχυρών, τον Απρίλιο του 1941, αποτελεί μία από τις πλέον ένδοξες σελίδες της νεότερης ελληνικής ιστορίας. Στο πλαίσιο της γερμανικής εισβολής, η αμυντική γραμμή Μεταξά στάθηκε σύμβολο αντίστασης, τιμής και στρατιωτικής αρετής. Παρά τη συντριπτική υπεροχή των επιτιθέμενων δυνάμεων, οι Έλληνες υπερασπιστές των οχυρών πολέμησαν με απαράμιλλο θάρρος, αποδεικνύοντας ότι η δύναμη της ψυχής και η πίστη στην πατρίδα υπερβαίνουν κάθε υλική υπεροχή.<br><br>Ιδιαίτερη θέση σε αυτή την ιστορική μνήμη κατέχει η περιοχή του Εχίνου, όπου η θυσία έλαβε έναν βαθύτερο και διαχρονικό συμβολισμό. Εκεί, Χριστιανοί και Μουσουλμάνοι Έλληνες στρατιώτες στάθηκαν πλάι-πλάι, ενωμένοι από το κοινό καθήκον προς την πατρίδα. Χωρίς διακρίσεις θρησκείας ή καταγωγής, υπερασπίστηκαν την ελευθερία της Ελλάδας με το ίδιο πάθος και την ίδια αυταπάρνηση.<br><br>Η κοινή αυτή θυσία αποτελεί ζωντανό παράδειγμα εθνικής ενότητας. Σε μια εποχή, όπου κάποιοι ελάχιστοι προσπαθούν να εντείνουν διαχωριστικές γραμμές, η ιστορία του Εχίνου υπενθυμίζει ότι η Ελλάδα μεγαλούργησε όταν τα παιδιά της στάθηκαν ενωμένα. Η έννοια της πατρίδας υπερίσχυσε κάθε επιμέρους ταυτότητας, και το αίμα που χύθηκε ήταν κοινό, ιερό και τιμημένο.<br><br>Οι πεσόντες του Εχίνου δεν αποτελούν μόνο ήρωες μιας τοπικής ιστορίας, αλλά σύμβολα μιας ευρύτερης αλήθειας: ότι η ελευθερία κατακτάται και διαφυλάσσεται μέσα από την ενότητα, την αλληλεγγύη και την πίστη σε κοινές αξίες. Η θυσία τους μάς καλεί όχι μόνο να θυμόμαστε, αλλά και να πράττουμε με γνώμονα το συλλογικό καλό.<br><br>Σήμερα, τιμώντας τη Μάχη των Οχυρών και τους ήρωες του Εχίνου, αποδίδουμε τον οφειλόμενο σεβασμό σε εκείνους που έθεσαν το «εμείς» πάνω από το «εγώ». Η μνήμη τους αποτελεί φάρο που φωτίζει το παρόν και καθοδηγεί το μέλλον, υπενθυμίζοντάς μας ότι η δύναμη της Ελλάδας βρίσκεται στην ενότητα του λαού της.<br><br>Αιωνία τους η μνήμη.<br><br>Ζήτω η μάχη των Οχυρών.<br>Ζήτω η Ελλάδα.<br><br>Αντιστράτηγος ( ε.α.)<br>Γεώργιος Κέλλης<br>Επίτιμος Υπαρχηγός Γενικού Επιτελείου Στρατού', 'posts/covers/ZsRtYW1vxYSYy2uLpRqNAyKKbIWfbBMNjlzXMj6j.jpg', NULL, 'Μάχη των Οχυρών (1941) – Εχίνος Ξάνθη: Μνήμη & Ενότητα', 'Η Μάχη των Οχυρών (1941) και η θυσία στον Εχίνο Ξάνθης, στην αμυντική γραμμή Μεταξά, συμβολίζουν ανδρεία, ενότητα και εθνική μνήμη.', '2026-03-28 21:43:00', 1, '2026-04-14 18:44:04', '2026-05-06 14:46:30');
INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `slug`, `excerpt`, `body`, `cover_image_path`, `og_image`, `meta_title`, `meta_description`, `published_at`, `is_published`, `created_at`, `updated_at`) VALUES (5, 1, 3, 'Γιώργος Κέλλης: Σχέδιο ανασυγκρότησης και ανάπτυξης για έναν ισχυρό Έβρο', 'giorgos-kellis-schedio-anasygkrotisis-kai-anaptyxis-gia-enan-ischyro-evro', 'Ο Αντιστράτηγος ε.α. Γιώργος Κέλλης παρουσιάζει το ολοκληρωμένο σχέδιο ανασυγκρότησης και ανάπτυξης του Έβρου, με έργα υποδομών, ενεργειακές επενδύσεις και παρεμβάσεις που ενισχύουν την οικονομία, την ασφάλεια και την κοινωνική συνοχή της περιοχής.&nbsp;', '&nbsp;Την ανάγκη για ένα ολοκληρωμένο και μακροπρόθεσμο σχέδιο ανασυγκρότησης του Έβρου υπογραμμίζει σε πρόσφατες δημόσιες παρεμβάσεις του ο Αντιστράτηγος ε.α. Γιώργος Κέλλης, εστιάζοντας στην αποκατάσταση των ζημιών από τις φυσικές καταστροφές αλλά και στη δημιουργία ενός νέου αναπτυξιακού μοντέλου για την περιοχή. Σύμφωνα με όσα επισημαίνει, η ανασυγκρότηση του Έβρου δεν περιορίζεται μόνο σε έργα αποκατάστασης, αλλά εντάσσεται σε ένα ευρύτερο σχέδιο που συνδυάζει υποδομές, επενδύσεις, κοινωνική στήριξη και ενίσχυση της τοπικής οικονομίας. <br><br><strong>Ένα πολυεπίπεδο πρόγραμμα παρεμβάσεων <br></strong><br>Το σχέδιο που βρίσκεται σε εξέλιξη βασίζεται σε τέσσερις βασικούς άξονες:<br>&nbsp;την αποκατάσταση των ζημιών από τις πρόσφατες φυσικές καταστροφές, την υλοποίηση μεγάλων αναπτυξιακών έργων με ορίζοντα το 2030, την προώθηση νέων επενδύσεων και μελετών για την επόμενη περίοδο, καθώς και την εφαρμογή ειδικών οικονομικών και κοινωνικών μέτρων για την περιοχή. Στο πλαίσιο αυτό προγραμματίζονται εκατοντάδες έργα και παρεμβάσεις, τα οποία αφορούν τόσο τις υποδομές όσο και τη συνολική αναπτυξιακή προοπτική του Έβρου. <br><br><strong>Έργα υποδομών και στρατηγικές επενδύσεις <br></strong><br>Ιδιαίτερη έμφαση δίνεται σε έργα που ενισχύουν τον γεωστρατηγικό ρόλο της περιοχής. Μεταξύ των σημαντικότερων παρεμβάσεων περιλαμβάνονται η αναβάθμιση του οδικού δικτύου και κρίσιμων γεφυρών, η ενίσχυση των αντιπλημμυρικών έργων, καθώς και η βελτίωση των αρδευτικών και υδρευτικών υποδομών. Παράλληλα προωθείται η αναβάθμιση των συνοριακών σταθμών στους Κήπους και τις Καστανιές, καθώς και ο εκσυγχρονισμός της σιδηροδρομικής σύνδεσης Αλεξανδρούπολης – Ορεστιάδας. Στο πεδίο των μεταφορών εξετάζεται επίσης η ανάπτυξη θαλάσσιας εμπορευματικής σύνδεσης μεταξύ Αλεξανδρούπολης και Πειραιά, ενισχύοντας τον ρόλο της περιοχής ως σημαντικού κόμβου μεταφορών και εμπορίου. <br><br><strong>Στήριξη της οικονομίας και της απασχόλησης </strong><br>Κεντρικός στόχος των παρεμβάσεων είναι η ενίσχυση της τοπικής οικονομίας και η δημιουργία νέων θέσεων εργασίας. Μεταξύ των μέτρων που προωθούνται περιλαμβάνονται προγράμματα στήριξης της επιχειρηματικότητας, ενίσχυση του πρωτογενούς τομέα, καθώς και δράσεις καινοτομίας για την αγροτική παραγωγή. Παράλληλα εξετάζονται φορολογικά κίνητρα για οικισμούς του Έβρου, ενώ προωθούνται και νέες ακαδημαϊκές δομές, όπως η δημιουργία Τμήματος Κτηνιατρικής στην Ορεστιάδα και μεταπτυχιακού προγράμματος Πολιτικής Προστασίας στο Σουφλί. <br><br><strong>Περιβάλλον και πρόληψη φυσικών καταστροφών </strong><br>Σημαντικό μέρος του σχεδιασμού αφορά την προστασία του φυσικού περιβάλλοντος και την πρόληψη μελλοντικών φυσικών καταστροφών. Στο Δάσος της Δαδιάς υλοποιούνται έργα αποκατάστασης και αντιδιαβρωτικών παρεμβάσεων, ενώ ενισχύονται τα συστήματα πρόληψης και αντιμετώπισης πυρκαγιών. Ταυτόχρονα προωθούνται έργα διαχείρισης υδάτων και φραγμάτων που αναμένεται να ενισχύσουν την αγροτική παραγωγή και να περιορίσουν τον κίνδυνο πλημμυρών. <br><strong>Ανάπτυξη με εθνική διάσταση </strong><br>Η αναπτυξιακή πορεία του Έβρου δεν αποτελεί μόνο περιφερειακό ζήτημα, αλλά συνδέεται άμεσα με την οικονομική ανάπτυξη, την κοινωνική συνοχή και τη στρατηγική σημασία της Θράκης. Στόχος των παρεμβάσεων είναι η ουσιαστική βελτίωση της καθημερινότητας των πολιτών και η ενίσχυση της εμπιστοσύνης των τοπικών κοινωνιών προς το κράτος&nbsp;', 'posts/covers/CT7CdQrBVquY523GEZqKCpOyebG5k2IZPLmnVZ7J.jpg', NULL, 'Γιώργος Κέλλης: Το σχέδιο ανάπτυξης και ανασυγκρότησης του Έβρου', 'Ο Γιώργος Κέλλης παρουσιάζει το σχέδιο ανασυγκρότησης και ανάπτυξης του Έβρου, με έργα υποδομών, επενδύσεις και μέτρα στήριξης της τοπικής οικονομίας.', '2026-04-23 15:32:00', 1, '2026-04-23 12:34:05', '2026-04-23 12:39:41');
INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `slug`, `excerpt`, `body`, `cover_image_path`, `og_image`, `meta_title`, `meta_description`, `published_at`, `is_published`, `created_at`, `updated_at`) VALUES (6, 1, 6, 'Συνέντευξη Γιώργου Κέλλη στην Βραδινή της Κυριακής: Το σχέδιο «Έβρος Μετά», τα 19 μέτρα και το νέο αναπτυξιακό μοντέλο', 'synenteuxi-giorgou-kelli-stin-vradini-tis-kyriakis-to-schedio-evros-meta-ta-19-metra-kai-to-neo-anaptyxiako-montelo', '&nbsp;Ο Γιώργος Κέλλης μιλά για το πρόγραμμα «Έβρος Μετά», τα 19 μέτρα στήριξης και το στρατηγικό σχέδιο που στοχεύει στη βιώσιμη ανάπτυξη και την ανασυγκρότηση της περιοχής έως το 2030.&nbsp;', '<strong>Για την πορεία υλοποίησης του </strong><a href=\"https://www.vradini.gr/tag/evros/\"><strong>Σχεδίου Ανασυγκρότησης και Ανάπτυξης του Έβρου</strong></a><strong> μιλά στη «Βραδυνή της Κυριακής» ο συντονιστής αποκατάστασης και ανασυγκρότησης της περιοχής Γιώργος Κέλλης. «Το όραμά μας είναι ένας Έβρος που θα μπορεί όχι μόνο να επουλώσει τα τραύματά του, μετά τη μεγαλύτερη δασική πυρκαγιά σε έκταση που έχει καταγραφεί ποτέ σε Ελλάδα και Ευρώπη τον Αύγουστο του 2023, αλλά και να εξελιχθεί σε πρότυπο ισόρροπης περιφερειακής ανάπτυξης, με σεβασμό στο περιβάλλον και στον άνθρωπο», δηλώνει και προσθέτει:<br></strong><br><em>«Ως Συντονιστής Αποκατάστασης και Ανασυγκρότησης της περιοχής, θεωρώ καθοριστικής σημασίας την ανοιχτή και ουσιαστική ενημέρωση των πολιτών. </em><strong><em>Η αποκατάσταση δεν αφορά μόνο την επιδιόρθωση των πληγών του παρελθόντος, αλλά και τη θεμελίωση ενός νέου μοντέλου ανάπτυξης – πιο ανθεκτικού, βιώσιμου και δίκαιου για όλους</em></strong><em>».<br></em><br><strong>Αναλυτικά η συνέντευξη του Γιώργου Κέλλη στη «ΒτΚ»:<br></strong><br><strong>Αρχικά θα ήθελα να μου μιλήσετε για το πρόγραμμα «Έβρος Μετά», τους άξονες δράσης και το χρονοδιάγραμμα.<br></strong><br><em>«Το πρόγραμμα “ΕΒΡΟΣ ΜΕΤΑ” αποτελεί τον τρίτο πυλώνα του Στρατηγικού Σχεδίου Ανάπτυξης και Ανασυγκρότησης του νομού Έβρου. Πρόκειται για μια ολοκληρωμένη πρωτοβουλία που στοχεύει στη βιώσιμη ανάπτυξη και την κοινωνική αναζωογόνηση της περιοχής.<br></em><br><em>Ο βασικός μας στόχος δεν είναι απλώς η επιστροφή στην κανονικότητα, αλλά ο Έβρος να γίνει πρωταγωνιστής ενός νέου μοντέλου ανάπτυξης, με επίκεντρο τον άνθρωπο, το περιβάλλον και την ανθεκτικότητα. Στο πλαίσιο αυτό, επιδιώκουμε να αξιοποιήσουμε στο έπακρο τα συγκριτικά πλεονεκτήματα του Έβρου, όπως τη στρατηγική του θέση, τους φυσικούς του πόρους και την πλούσια πολιτιστική του κληρονομιά, με σκοπό την ενίσχυση της τοπικής οικονομίας και τη βελτίωση της ποιότητας ζωής των κατοίκων.<br></em><br><em>Το πρόγραμμα έχει σχεδιαστεί ώστε να υλοποιηθεί σταδιακά έως το 2030 και βασίζεται σε πέντε βασικούς άξονες δράσης:<br></em><br><ul><li><strong><em>Αγροτική Ζωή:</em></strong><em> Επιδιώκουμε την αναδιάρθρωση του πρωτογενούς τομέα, ενισχύοντας την παραγωγική δυναμική της γεωργίας, της κτηνοτροφίας και της αλιείας, μέσα από επενδύσεις σε νέες τεχνολογίες, υποδομές άρδευσης και προγράμματα στήριξης νέων αγροτών.</em></li><li><strong><em>Περιβάλλον &amp; Υποδομές:</em></strong><em> Εστιάζουμε στην περιβαλλοντική αναβάθμιση και τη δημιουργία σύγχρονων υποδομών, ώστε να βελτιώσουμε τις συνθήκες διαβίωσης, να αυξήσουμε την ανθεκτικότητα της περιοχής σε φυσικές καταστροφές και να διασφαλίσουμε τη βιώσιμη χρήση των φυσικών πόρων.</em></li><li><strong><em>Επενδύσεις:</em></strong><em> Στοχεύουμε στον εκσυγχρονισμό του οικονομικού και επενδυτικού μοντέλου της περιοχής, προωθώντας την καινοτομία, την ψηφιοποίηση και τη βιωσιμότητα, αλλά και διευκολύνοντας τις μεταφορές και τη σύνδεση με τις αγορές.</em></li><li><strong><em>Βιώσιμη Ανάπτυξη:</em></strong><em> Θέλουμε να δημιουργήσουμε μια ανάπτυξη κοινωνικά δίκαιη, πολιτιστικά ζωντανή και περιβαλλοντικά υπεύθυνη, που θα στηρίζει την κοινωνική συνοχή και θα αντιμετωπίζει προκλήσεις όπως η μετανάστευση, μέσα από δράσεις κοινωνικής στήριξης και ανάδειξης της πολιτιστικής κληρονομιάς.</em></li><li><strong><em>Κόμβος Εξωστρέφειας:</em></strong><em> Τέλος, επιδιώκουμε ο Έβρος να αναδειχθεί σε διασυνοριακό κόμβο συνεργασίας και εμπορίου, με αναβάθμιση των μεταφορικών υποδομών, επιδοτούμενες ακτοπλοϊκές συνδέσεις και επαναλειτουργία των σιδηροδρομικών γραμμών».</em></li><li><br></li></ul><strong>Ποιες παρεμβάσεις έχουν γίνει μέχρι στιγμής και πώς εξελίσσεται ο ρυθμός υλοποίησης των έργων;<br></strong><br><em>«Από την πρώτη στιγμή, το σχέδιο Ανασυγκρότησης και Αποκατάστασης του Έβρου έχει προχωρήσει σημαντικά, με κυριότερους άξονες τις υποδομές, την προστασία από φυσικές καταστροφές και την ενίσχυση των τοπικών κοινωνιών.<br></em><br><em>Η εξέλιξη φαίνεται σταδιακή, αλλά με πιεστικά χρονοδιαγράμματα, και δέσμευση πως τα έργα πρέπει να ωριμάσουν σύντομα, να ενταχθούν και να ξεκινήσουν. Ασκείται πίεση για τοπική συμμετοχή, διαβούλευση με Δήμους και Περιφέρεια, ώστε το πρόγραμμα να μην είναι μόνο “κεντρικό” αλλά να ανταποκρίνεται στις πραγματικές ανάγκες των περιοχών. Προχωρούν αρκετά έργα τα οποία είναι είτε σε φάση ωρίμανσης ή υλοποίησης είτε σε διαδικασία δημοπράτησης ή χρηματοδότησης. Βεβαίως υπάρχουν προκλήσεις, κυρίως στην ωρίμανση των μελετών, στην έκδοση αδειών, στις γραφειοκρατικές διαδικασίες, καθώς και στην εξασφάλιση της διαρκούς συμμετοχής των Δήμων και των κατοίκων, ώστε οι παρεμβάσεις να ανταποκρίνονται στις ανάγκες τους»</em>.<br><br><strong>Πριν από έναν χρόνο ο πρωθυπουργός ανακοίνωσε δέσμη 19 μέτρων, με στόχο την τόνωση της απασχόλησης και της επιχειρηματικότητας, πρωτίστως στο βόρειο και κεντρικό τμήμα του Έβρου. Σήμερα, ένα χρόνο μετά, τι έχουμε δει να αλλάζει, υπάρχουν κάποια πρώτα αποτελέσματα;<br></strong><br><em>«Η δέσμη των 19 μέτρων, τα οποία αποτελούν τον τέταρτο πυλώνα του Σχεδίου Ανάπτυξης του Έβρου και ανακοίνωσε ο κ. Πρωθυπουργός στις αρχές Οκτωβρίου 2024, περιλαμβάνει ένα ευρύ φάσμα παρεμβάσεων που απαντούν σε καίρια ζητήματα του Έβρου, με στόχο την ουσιαστική ενίσχυση της τοπικής οικονομίας, την υποστήριξη των υφιστάμενων επιχειρήσεων σε επιλεγμένους τομείς του χονδρικού και λιανικού εμπορίου, την προώθηση της απασχόλησης μέσω προγραμμάτων της ΔΥΠΑ που εστιάζουν στους νέους και στην αντιμετώπιση της ανεργίας και την ενδυνάμωση του ανθρώπινου δυναμικού με δράσεις επαγγελματικής κατάρτισης και εξειδίκευσης.<br></em><br><em>Ιδιαίτερη έμφαση δίνεται σε μικρές επιχειρήσεις και αυτοαπασχολούμενους που επλήγησαν, καθώς προβλέπεται επιδότηση λειτουργικών εξόδων, ενοικίων και ασφαλιστικών εισφορών, αλλά και ένταξη στο σχεδιασμό πρόσθετων φορολογικών κινήτρων, όπως εκπτώσεις στο φόρο εισοδήματος και πρόσβαση σε κεφάλαια με ευνοϊκούς όρους για επενδύσεις στην πράσινη καινοτομία και την ψηφιακή μετάβαση. </em><strong><em>Ο στόχος μας είναι ξεκάθαρος: “οι επιχειρήσεις του Έβρου να μην μείνουν πίσω, αλλά να προηγηθούν στην αναπτυξιακή επανεκκίνηση της περιοχής”.<br></em></strong><br><em>Εστιάζουμε, επιπλέον, στην </em><strong><em>αναβάθμιση των μεταφορών</em></strong><em> με την επανεκκίνηση του σιδηροδρόμου στον Έβρο σε νέα βάση που ανταποκρίνεται στις ανάγκες ενός ολοένα και μεγαλύτερου αριθμού επιβατών.</em><br><em>Στο πλαίσιο ενίσχυσης των υποδομών και της διασυνδεσιμότητας της περιοχής, περιλαμβάνεται και η </em><strong><em>υλοποίηση της νέας εμπορικής ακτοπλοϊκής γραμμής Αλεξανδρούπολη – Σίγρι Λέσβου – Μεστά Χίου – Πειραιάς</em></strong><em>, με κρατική επιδότηση ύψους 12,5 εκατ. ευρώ, όπως προβλέπει η σχετική πράξη που εντάχθηκε στο Τομεακό Πρόγραμμα Ανάπτυξης του Υπουργείου Ναυτιλίας και Νησιωτικής Πολιτικής. Η γραμμή αυτή έχει σχεδιαστεί ως καθαρά εμπορική και όχι επιβατική, με στόχο τη μεταφορά αγροτικών προϊόντων, πρώτων υλών και εμπορευμάτων, ενισχύοντας την εφοδιαστική αλυσίδα ανάμεσα σε Ανατολική Μακεδονία – Θράκη και τα νησιά του Βορείου Αιγαίου και μειώνοντας αισθητά το κόστος μεταφοράς για τις τοπικές επιχειρήσεις και παραγωγούς. Πρόκειται για μια στοχευμένη αναπτυξιακή παρέμβαση, που υποστηρίζει την οικονομική ανάκαμψη της περιοχής, αναδεικνύοντας τον ρόλο της Αλεξανδρούπολης ως κρίσιμο διαμετακομιστικό κόμβο.<br></em><br><em>Σημαντική είναι και η έμφαση που δίνεται στην </em><strong><em>εκπαίδευση</em></strong><em>. Ο Έβρος αποτελεί διαχρονικά μία περιοχή με ανεπτυγμένη κτηνοτροφία, καθώς έχει ιδανική μορφολογία και εξαιρετικές κλιματολογικές συνθήκες. Αποτελεί όμως και πύλη εισόδου ζωονόσων στην Ελλάδα και στην Ευρώπη, γεγονός που συνδέεται με τα υψηλά ποσοστά απώλειας του ζωικού κεφαλαίου. Στην Ορεστιάδα λειτουργούν ήδη δύο τμήματα με προσανατολισμό το περιβάλλον, όπως το Τμήμα Δασολογίας και Προστασίας Περιβάλλοντος και το Τμήμα Γεωπονίας με κατεύθυνση την αγροτική οικονομία, ενώ βρίσκεται σε στάδιο υλοποίησης το Τμήμα Κτηνιατρικής στη Σχολή Επιστημών Υγείας του Δημοκρίτειου Πανεπιστημίου Θράκης, με στόχο την ενίσχυση της κτηνιατρικής εκπαίδευσης και την υποστήριξη της τοπικής κτηνοτροφίας. Σε ό,τι αφορά το μεταπτυχιακό πρόγραμμα σπουδών, φυσικών καταστροφών με έδρα την πόλη του Σουφλίου έχει υποβληθεί για πιστοποίηση στην Εθνική Αρχή Ανώτατης Εκπαίδευσης (ΕΘΑΑΕ).<br></em><br><em>Παράλληλα, βρίσκονται ήδη σε εξέλιξη </em><strong><em>προγράμματα Δημογραφικής Ανάπτυξης</em></strong><em>, όπως πρόγραμμα οικονομικής ενίσχυσης έως και 10.000 ευρώ, για τους πολίτες που επιθυμούν να μεταφέρουν την κύρια κατοικία τους και το κέντρο των βιοτικών τους δραστηριοτήτων σε συγκεκριμένες περιοχές του Έβρου, ενώ κατά τη διάρκεια της 89ης Διεθνούς Έκθεσης Θεσσαλονίκης (ΔΕΘ) υπογραμμίστηκε η δέσμευση της κυβέρνησης για την ενίσχυση και διεύρυνση αυτών των μέτρων, με ειδική πρόβλεψη για χωριά με πληθυσμό κάτω από 1.500 κατοίκους. Συνολικά, στο ν. Έβρου επωφελούνται 164 οικισμοί. Τονίζεται ότι ήδη βρίσκεται σε εφαρμογή η κατάργηση του ΕΝΦΙΑ από 01/01/25 για την πόλη του Σουφλίου με διάρκεια τριών ετών.<br></em><br><em>Παράλληλα, υλοποιούνται γενικότερες </em><strong><em>παρεμβάσεις κοινωνικής πολιτικής και ενίσχυσης του ανθρώπινου δυναμικού</em></strong><em>, που συμπληρώνουν το συνολικό πλέγμα στήριξης με την προσαύξηση της μοριοδότησης για την εντοπιότητα στους δήμους Διδυμοτείχου, Ορεστιάδας, Σαμοθράκης και Σουφλίου κατά 40 μόρια με υποχρέωση 15ετους παραμονής ή η άμεση μετάταξη / απόσπαση υπαλλήλων σε παραμεθόριο υπηρεσία, προκειμένου να αντιστραφεί η δημογραφική συρρίκνωση και να αναζωογονηθούν οι τοπικές κοινότητες.<br></em><br><em>Ανάσα για τους κατοίκους του Δήμου Σουφλίου και της Δημοτικής Ενότητας Φερών, για δεύτερη συνεχή χρονιά, αποτελεί το </em><strong><em>Evros Pass</em></strong><em>, ένα σημαντικό εργαλείο για την τοπική οικονομία. Μέσω αυτού του προγράμματος, καλύπτονται δαπάνες τοπικής μεταφοράς, εστίασης και διαμονής για όσους επιθυμούν να επισκεφθούν τις εν λόγω περιοχές.<br></em><br><em>Οι Εβρίτες, ήδη μέσα σε ένα χρόνο, βλέπουν και απολαμβάνουν τα αποτελέσματα των μέτρων και των προγραμμάτων που αναφέρθηκαν. Από τη δέσμη των 19 μέτρων, το μεγαλύτερο ποσοστό είτε έχει υλοποιηθεί, αποφέροντας οφέλη στην κοινωνία, είτε βρίσκεται σε τελικό στάδιο έγκρισης μέσα από τις προβλεπόμενες νομικές διαδικασίες. Σύντομα, ο Έβρος θα είναι αποδέκτης ενός πλήρους πακέτου ενισχυμένων μέτρων και προγραμμάτων, τα οποία, αξίζει να σημειωθεί, ότι ενισχύονταν στην πορεία, όπου εντοπιζόταν έλλειμμα ή κάποια ανάγκη που προέκυπτε».<br></em><br><strong>Υπάρχει η δυνατότητα αλλά και η θέληση από την κυβέρνηση να προστεθούν επιπλέον μέτρα στο αναπτυξιακό σχέδιο για τον Έβρο; Και αν ναι, κατά τη γνώμη σας σε ποιους τομείς θα έπρεπε να επικεντρωθούν οι εν λόγω παρεμβάσεις;<br></strong><br><em>«Φυσικά και υπάρχει τόσο η δυνατότητα όσο και η πολιτική βούληση από την πλευρά της κυβέρνησης να ενισχυθεί περαιτέρω το αναπτυξιακό σχέδιο για τον Έβρο. Το “Έβρος Μετά” δεν είναι ένα κλειστό ή στατικό σχέδιο. Αποτελεί ένα δυναμικό πλαίσιο στρατηγικού σχεδιασμού που εξελίσσεται, αξιολογώντας τις ανάγκες των πολιτών και προσαρμόζεται ανάλογα με τις συνθήκες. Ο κ. Πρωθυπουργός έχει δώσει ιδιαίτερη βαρύτητα σε αυτό το αναπτυξιακό εγχείρημα, αναγνωρίζοντας τον κρίσιμο ρόλο του Έβρου ως πύλη εισόδου και στρατηγικού κόμβου, υποστηρίζοντας ενεργά τόσο την επένδυση οικονομικών πόρων όσο και την πολιτική συνοχή για την υλοποίησή του. Καθοριστικό ρόλο στην παρακολούθηση και την υλοποίηση του σχεδίου διαδραματίζει ο σημερινός πρόεδρος της Επιτροπής Ανασυγκρότησης Υφυπουργός κ. Κατσαφάδος και τα μέλη αυτής, συνεχίζοντας το έργο της προηγούμενης επιτροπής με πρόεδρο τον κ. Τριαντόπουλο, οι οποίοι μέσα από τη στενή συνεργασία με τοπικούς φορείς και την κεντρική κυβέρνηση εξασφαλίζουν ότι οι δράσεις κινούνται μεθοδικά και ανταποκρίνονται στις πραγματικές ανάγκες της περιοχής.<br></em><br><em>Το αναπτυξιακό σχέδιο για τον Έβρο, μετά τις μεγάλες καταστροφές που υπέστη η περιοχή, δεν περιορίζεται μόνο στην αποκατάσταση. Έχει ξεκάθαρο στρατηγικό προσανατολισμό: “να μετατρέψουμε την κρίση σε ευκαιρία ουσιαστικής και βιώσιμης ανάπτυξης”. Πέρα από τις άμεσες αποζημιώσεις και τα έργα υποδομής που ήδη υλοποιούνται, έχουμε προχωρήσει σε συγκεκριμένα επιπλέον μέτρα στήριξης και ενίσχυσης της περιοχής, που καλύπτουν τόσο τις ανάγκες των κατοίκων όσο και τις αναπτυξιακές δυνατότητες του τόπου.<br></em><br><em>Θα μπορούσαν να γίνουν επιπρόσθετες παρεμβάσεις σε δράσεις που αφορούν:<br></em><br><strong><em>α.</em></strong><em> Στην ενίσχυση του αγροτικού και δασικού τομέα με στοχευμένα μέτρα για ανθεκτικότητα στις κλιματικές προκλήσεις,<br></em><br><strong><em>β.</em></strong><em> Στην κοινωνική συνοχή, όπως προγράμματα για τη νεολαία, τον πολιτισμό και την κατάρτιση<br></em><br><strong><em>γ.</em></strong><em> Στον ψηφιακό ανασχηματισμό<br></em><br><strong><em>δ.</em></strong><em> Στις πράσινες υποδομές<br></em><br><em>Συμπερασματικά, πρέπει να τονίσουμε ότι η αξιοποίηση των ευρωπαϊκών πόρων δεν είναι απλώς συμπληρωματική, </em><strong><em>είναι κομβική</em></strong><em>. Χρειάζεται, λοιπόν, στρατηγικός σχεδιασμός, διατοπική συνεργασία και γρήγορη ωρίμανση έργων, ώστε ο Έβρος να απορροφήσει αποτελεσματικά τα διαθέσιμα κονδύλια και να μετατραπεί σε παράδειγμα ισόρροπης και βιώσιμης περιφερειακής ανάπτυξης, έναν στόχο στον οποίο η Επιτροπή Ανασυγκρότησης επενδύει με συνέπεια και όραμα».<br></em><br>Κλείνοντας ο κ. Κέλλης μάς αναφέρει: <strong><em>«Είμαι αισιόδοξος ότι με συλλογική προσπάθεια, στοχευμένες παρεμβάσεις και συνεχή υποστήριξη από την κυβέρνηση και την τοπική κοινωνία, ο Έβρος θα αναδειχθεί σε πρότυπο βιώσιμης ανάπτυξης και ευημερίας. Σας ευχαριστώ θερμά για τον χρόνο σας και την ευκαιρία να μοιραστώ τις σκέψεις μου σχετικά με το αναπτυξιακό μέλλον του Έβρου»</em></strong>.&nbsp;<br><br><br>', 'posts/covers/aSzuumu0QAzIJVg68F9oWqiGAkwKjftEcPLqp9TD.webp', NULL, 'Γιώργος Κέλλης: «Έβρος Μετά», 19 μέτρα και ανάπτυξη έως το 2030', 'Η συνέντευξη του Γιώργου Κέλλη για το σχέδιο «Έβρος Μετά», τα 19 μέτρα στήριξης, την ανάπτυξη, τις επενδύσεις και το μέλλον του Έβρου έως το 2030.', '2025-09-28 15:02:00', 1, '2026-05-06 15:12:23', '2026-05-06 15:13:14');
INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `slug`, `excerpt`, `body`, `cover_image_path`, `og_image`, `meta_title`, `meta_description`, `published_at`, `is_published`, `created_at`, `updated_at`) VALUES (7, 1, 6, 'Συνέντευξη Γιώργου Κέλλη στην Εμπρός: Το μέλλον της Ξάνθης και της Θράκης', 'synenteuxi-giorgou-kelli-stin-empros-to-mellon-tis-xanis-kai-tis-rakis', '&nbsp;Ο Γιώργος Κέλλης μιλά στην εφημερίδα Εμπρός για την ανάπτυξη της Ξάνθης, τη Θράκη του 2030, την κοινωνική συνοχή και τις προτεραιότητες για ένα βιώσιμο μέλλον.&nbsp;', '&nbsp;Γιώργος Κέλλης: “Η ανάπτυξη χτίζεται με ένα ρεαλιστικό και μακρόπνοο σχέδιο μετάβασης” <br>&nbsp;Στο πλαίσιο του ανοιχτού διαλόγου «Η Ξάνθη μιλά στο “Ε” – Πρόσωπα, ιδέες, προοπτικές», ο πρώην υπαρχηγός του ΓΕΣ και Αντιστράτηγος ε.α. Γιώργος Κέλλης καταθέτει μια ψύχραιμη, τεκμηριωμένη και βαθιά προσωπική ματιά για το μέλλον της Ξάνθης και της Θράκης. Με αφετηρία —όπως ο ίδιος τονίζει— τον τόπο που υπηρέτησε και αγάπησε, αλλά και την εμπειρία 43 ετών σε θέσεις υψηλής ευθύνης, προσεγγίζει τα ζητήματα ανάπτυξης, κοινωνικής συνοχής και στρατηγικής προοπτικής της περιοχής με ορίζοντα δεκαετίας. Αναφέρεται στη σημασία της θεσμικής συνεργασίας, της ανθεκτικότητας των τοπικών κοινωνιών, της εκπαίδευσης, της καινοτομίας και της διασυνοριακής συνεργασίας, υποστηρίζοντας ότι η Θράκη μπορεί να αποτελέσει πρότυπο ισόρροπης ανάπτυξης και σταθερότητας όταν υπάρχει συνέπεια, σχεδιασμός και εμπιστοσύνη στις δυνάμεις της.<br><br><strong>Η διακοµµατική επιτροπή για τη Θράκη είχε δεσµευθεί σε πολιτικές και παρεµβάσεις που θα ενίσχυαν την κοινωνική συνοχή και την ανάπτυξη της περιοχής. Τέσσερα χρόνια µετά, πώς αξιολογείτε τα αποτελέσµατα για την Ξάνθη; Ποιες πρωτοβουλίες θεωρείτε ότι µπορούν να στηρίξουν το σύνολο της τοπικής κοινωνίας, ανεξάρτητα από καταγωγή, γλώσσα ή θρησκεία;<br></strong><br>Τέσσερα χρόνια μετά την παρουσίαση των προτάσεων της Διακομματικής Επιτροπής για τη Θράκη, παρατηρείται ουσιαστική πρόοδος σε αρκετούς τομείς, με την πρόκληση πλέον να βρίσκεται στη συνέχιση και στην ενίσχυση των δράσεων που θα διασφαλίσουν τη βιώσιμη ανάπτυξη της περιοχής. Η μεγαλύτερη δυσκολία δεν αφορούσε ποτέ την έλλειψη σχεδιασμού ή χρηματοδοτικών εργαλείων, αλλά συνδεόταν κυρίως με τη συνέπεια στην εφαρμογή τους και με τη δυνατότητα θεσμικής συνεργασίας σε περιφερειακό επίπεδο. Η Ξάνθη, όπως και ολόκληρη η Θράκη, χρειάζεται πολιτικές ενταγμένες σε ένα συνεκτικό αναπτυξιακό πλαίσιο, κάτι που η σημερινή κυβέρνηση φαίνεται να έχει θέσει ως στρατηγική προτεραιότητα. Η κοινωνική συνοχή αποτελεί τον θεμέλιο λίθο αυτής της προσπάθειας. Πρωτοβουλίες που ενισχύουν τον πρωτογενή τομέα, την απασχόληση, την εκπαίδευση, την υγεία και τη συμμετοχή των νέων μπορούν να στηρίξουν το σύνολο της κοινωνίας, ανεξαρτήτως καταγωγής, γλώσσας ή θρησκείας. Η Ξάνθη χρειάζεται έναν δημόσιο διάλογο που θα βασίζεται στην εμπιστοσύνη και στην ισότιμη συμμετοχή, διότι εκεί θεμελιώνεται η πραγματική ανάπτυξη.<br><br><strong>Πώς φαντάζεστε την Ξάνθη και τη Θράκη σε πέντε ή δέκα χρόνια; Υπάρχει τρόπος να ξεφύγουµε από την περιθωριακή διάσταση και την υστέρηση; Με τι τρόπο;<br></strong><br>Η Θράκη του 2030 ή του 2035 μπορεί να αποτελέσει έναν τόπο ανοιχτό, δυναμικό και εξωστρεφή, εφόσον στηριχθεί σε ένα ρεαλιστικό και μακρόπνοο σχέδιο μετάβασης. Δεν θεωρώ ότι τίθεται ζήτημα περιθωριακής διάστασης και όσοι υποστηρίζουν πως υπάρχουν υστερήσεις σε ορισμένους τομείς, πιστεύω ότι αυτές δεν είναι μη αναστρέψιμες και μπορούν να αντιμετωπιστούν μέσω συντονισμένων παρεμβάσεων των αρμόδιων φορέων, των Υπουργείων, της Περιφέρειας και της Τοπικής Αυτοδιοίκησης<br><br>Η εμπειρία της ανασυγκρότησης στον Έβρο, της οποίας έχω την τιμή να είμαι συντονιστής, δείχνει ότι οι τοπικές κοινωνίες διαθέτουν ανθεκτικότητα και ικανότητα αυτοοργάνωσης. Το ζητούμενο είναι να υπάρξει μακροπρόθεσμη στήριξη και όχι μόνο διαχείριση της έκτακτης ανάγκης. Ένα βιώσιμο μέλλον για τη Θράκη και για την Ξάνθη προϋποθέτει εμπιστοσύνη στους πολίτες, στην εκπαίδευση, στους τοπικούς και παραγωγικούς φορείς καθώς και στους νέους επαγγελματίες, οι οποίοι με όραμα και καινοτομία, επιλέγουν να μείνουν και να δημιουργήσουν στον τόπο τους.<br><br><strong>Ποιες παραµέτρους ή πρωτοβουλίες θεωρείτε κοµβικές για την οικονοµική ανάπτυξη της περιοχής;<br></strong><br>Προσωπικά πιστεύω ότι η οικονομική ανάπτυξη της περιοχής μπορεί να στηριχθεί στους παρακάτω τρεις βασικούς πυλώνες:<br><br><ol><li>Στην αναδιάρθρωση της παραγωγικής βάσης, με στοχευμένες επενδύσεις σε εναλλακτικές καλλιέργειες, στη διασύνδεση της αγροτικής παραγωγής με το εμπόριο και τη μεταποίηση, και στην υλοποίηση υποδομών που ενισχύουν τον πρωτογενή τομέα.</li><li>Στην διασυνοριακή συνεργασία, αξιοποιώντας το γεωγραφικό πλεονέκτημα της Θράκης για την ανάπτυξη συνεργειών με τη Βουλγαρία και την Τουρκία στους τομείς του εμπορίου, των μεταφορών, της ενέργειας και του τουρισμού.</li><li>Στην γνώση και την καινοτομία με επίκεντρο τα εκπαιδευτικά και πανεπιστημιακά ιδρύματα. Το Δημοκρίτειο Πανεπιστήμιο Θράκης μπορεί να λειτουργήσει ως κινητήριος δύναμη για την ανάπτυξη της περιοχής, μέσα από την ουσιαστική διασύνδεση του με την τοπική οικονομία και τους παραγωγικούς φορείς.</li></ol>Συμπερασματικά, η συστηματική επένδυση σε ένα σταθερό και προβλέψιμο επιχειρηματικό περιβάλλον, στην υψηλής ποιότητας επαγγελματική κατάρτιση και στις σύγχρονες υποδομές συνιστά καθοριστικό παράγοντα για την πλήρη αξιοποίηση του ανθρώπινου δυναμικού της περιοχής. Με τον τρόπο αυτό, οι νέοι θα διαθέτουν ουσιαστικές προοπτικές ανάπτυξης στον τόπο τους, θεμελιώνοντας σταθερές βάσεις οικονομικής και κοινωνικής προόδου.<br><br><strong>Η Ξάνθη συχνά προβάλλεται ως παράδειγµα ειρηνικής συνύπαρξης πλειονότητας και µειονότητας. Στην πράξη όµως υπάρχουν ακόµα παράλληλοι κόσµοι. Ποιες είναι οι δικές σας προτάσεις για να σπάσουν αυτά τα τείχη και να υπάρξει πραγµατική, ειλικρινής και κυρίως ανεµπόδιστη συνύπαρξη;<br></strong><br>Η Ξάνθη αποτελεί διαχρονικά παράδειγμα ειρηνικής συνύπαρξης ανθρώπων με διαφορετικές πολιτισμικές, γλωσσικές και θρησκευτικές ταυτότητες. Δεν συμμερίζομαι την άποψη ότι σήμερα υφίστανται παράλληλοι κόσμοι. Περισσότερο πρόκειται για διαφορετικές αφετηρίες και εμπειρίες, οι οποίες μέσα από τον αμοιβαίο σεβασμό και την ενεργό συμμετοχή μπορούν να μετατραπούν σε παράγοντα συλλογικής προόδου.<br><br>Η ουσιαστική συνύπαρξη σε μια πολυπολιτισμική κοινωνία δεν προϋποθέτει την εξάλειψη των διαφορών, αλλά την αναγνώριση και αξιοποίησή τους ως στοιχείου δημιουργικότητας και κοινωνικής συνοχής.<br><br>Τα τελευταία χρόνια έχουν κατευθυνθεί οικονομικοί πόροι και πρωτοβουλίες στην εκπαίδευση, στην κοινή επιχειρηματικότητα, στην τοπική ανάπτυξη και σε δράσεις που ενώνουν νέους ανθρώπους από όλες τις κοινότητες γύρω από κοινούς στόχους. Αυτές οι δράσεις ενισχύουν την εμπιστοσύνη, τον διάλογο και το κοινό αίσθημα προοπτικής, χαρακτηριστικά που ήδη διαμορφώνουν την εικόνα της Ξάνθης και μπορούν να την αναδείξουν σε ακόμη ισχυρότερο πρότυπο ώριμης και ανεμπόδιστης συνύπαρξης.<br><br><strong>Πώς αξιολογείτε τις τρέχουσες πολιτικές εξελίξεις σε εθνικό επίπεδο και κατά πόσο επηρεάζουν άµεσα τη Θράκη και την Ξάνθη; Θεωρείτε ότι δηµιουργείται χώρος για νέες πολιτικές δυνάµεις που θα εκφράσουν την κοινωνία της Ξάνθης ή οι παραδοσιακές κοµµατικές γραµµές εξακολουθούν να κυριαρχούν και να ανταποκρίνονται στις επιδιώξεις των πολιτών;<br></strong><br>Οι τρέχουσες πολιτικές εξελίξεις σε εθνικό επίπεδο χαρακτηρίζονται από σταθερότητα, με μια κυβέρνηση που διανύει ήδη τον έβδομο χρόνο θητείας. Η σταθερότητα αυτή δημιουργεί ένα προβλέψιμο και οργανωμένο περιβάλλον, κάτι κρίσιμο για την οικονομία και τις επενδύσεις.<br><br>Η Ξάνθη είναι πόλη με κάποιες ιδιαιτερότητες, αλλά κυρίως έχει δυναμισμό, ανθρώπους με όραμα και διάθεση για πρόοδο. Η σημερινή εθνική πολιτική επενδύει στην ανάπτυξη, στις υποδομές και στην κοινωνική συνοχή, μετατρέποντας τη Θράκη σε παράδειγμα βιώσιμης προόδου. Ταυτόχρονα η ενεργειακή διπλωματία που υιοθετεί, ενισχύει την περιοχή της Θράκης, και κατ’ επέκταση της Ξάνθης, μετατρέποντας γενικότερα την περιοχή σε στρατηγικό ενεργειακό κόμβο, με παράλληλα οφέλη σε γεωπολιτικό επίπεδο.<br><br><strong>Αν έπρεπε να ορίσετε σήµερα τις βασικές πολιτικές/κοινωνικές/οικονοµικές προτεραιότητες για την Ξάνθη, ποιες θα ήταν; Αναφέρετε επιγραµµατικά τους πέντε βασικούς άξονες, κατά τη γνώµη σας.<br></strong><br>Οι πέντε βασικοί άξονες προτεραιοτήτων για την Ξάνθη, κατά την άποψή μου, είναι οι εξής:<br><br><ol><li>Η ενίσχυση της ανθεκτικότητας και της πρόληψης κινδύνων, ιδίως υπό τις συνθήκες που δημιουργεί η κλιματική αλλαγή, μέσα από την εφαρμογή ενός ολοκληρωμένου σχεδίου προστασίας του αγροτικού τομέα, ώστε οι κρίσεις να μετατρέπονται σε ευκαιρίες αναβάθμισης και εκσυγχρονισμού</li><li>Ο αναπτυξιακός αναπροσανατολισμός, ο οποίος επιτυγχάνεται με τη στενή σύνδεση της αγροτικής παραγωγής με τη βιομηχανία και την καινοτομία και με έμφαση στη βιωσιμότητα.</li><li>Η ενίσχυση της εκπαίδευσης και της κοινωνικής ένταξης, εξασφαλίζοντας την πρόσβαση όλων σε ποιοτική παιδεία, την ουσιαστική αντιμετώπιση της σχολικής διαρροής και την προώθηση ισότιμων ευκαιριών για όλες τις κοινωνικές ομάδες.</li><li>Η ανάδειξη του πολιτισμού και της ταυτότητας της περιοχής, προβάλλοντας την πολυπολιτισμική φυσιογνωμία της Ξάνθης ως σημαντικό αναπτυξιακό πλεονέκτημα και όχι ως παράγοντα διαχωρισμού, ενισχύοντας τη συλλογική αυτοπεποίθηση και τη δημιουργική συνύπαρξη.</li><li>Η ενίσχυση της διοικητικής συνεργασίας και του στρατηγικού σχεδιασμού, με διαρκή και σταθερή διασύνδεση των τοπικών φορέων με το κεντρικό κράτος, προκειμένου να εφαρμόζονται συντονισμένες πολιτικές και να διασφαλίζεται η πλήρης αξιοποίηση των διαθέσιμων πόρων.</li></ol><strong>Ποιο θα λέγατε ότι είναι το «κύριο συστατικό» για την προοπτική του τόπου μας;<br></strong><br>Η Ξάνθη διαθέτει όλα τα χαρακτηριστικά για να αποτελέσει πρότυπο ισόρροπης ανάπτυξης, κοινωνικής συνοχής και πολυπολιτισμικής αρμονίας. Οι θρησκευτικές και πολιτισμικές κοινότητες της περιοχής συνθέτουν ένα μοναδικό μωσαϊκό, το οποίο μπορεί να λειτουργήσει ως συγκριτικό πλεονέκτημα. Η περιοχή χρειάζεται συνέπεια, σταθερό σχεδιασμό και εμπιστοσύνη στις δυνάμεις της, και προς αυτή την κατεύθυνση η κυβέρνηση έχει ήδη συμβάλλει σημαντικά, προωθώντας δράσεις που ενδυναμώνουν τις τοπικές προοπτικές και θωρακίζουν την αναπτυξιακή πορεία του τόπου. Ταυτόχρονα, η εμπειρία που έχω αποκομίσει από τα σοβαρά καθήκοντα ευθύνης, στο πλαίσιο της πολυετούς υπηρεσίας μου στις Ελληνικές Ένοπλες Δυνάμεις, καθώς και από τον ρόλο που σήμερα επιτελώ ως Συντονιστής Αποκατάστασης και Ανασυγκρότησης του Έβρου, επιβεβαιώνει ότι ακόμη και μετά από απαιτητικές περιόδους, η συνεργασία και η συνέργεια μπορούν να αποτελέσουν το θεμέλιο για ένα σταθερό και βιώσιμο μέλλον, ανοίγοντας τον δρόμο για λύσεις που είναι πιο ευέλικτες, πιο στοχευμένες και πιο αποτελεσματικές.&nbsp;', 'posts/covers/Pgep6a7NjUqNJdNQ0fVaT8UQUEV0KeXLy3VR3Bsb.webp', NULL, 'Γιώργος Κέλλης: Ξάνθη και Θράκη σε τροχιά ανάπτυξης έως το 2030', 'Συνέντευξη Γιώργου Κέλλη στην Εμπρός για την ανάπτυξη της Ξάνθης, τη Θράκη του μέλλοντος, την οικονομία, την κοινωνική συνοχή και τις βασικές προτεραιότητες.', '2025-11-25 12:11:00', 1, '2026-05-06 15:21:36', '2026-05-06 15:23:08');

--
-- Table structure for `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('3v9h7nrYvy40CYVcFYLGlZLrlCkiYFhdECsYXhkr', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWZ1RlFvd3JUVGw3dWZ2UENPcWx0SzhRdnBDT2owU1I5VDNldnhIcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9naW9yZ29zLWtlbGxpcy50ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1776348623);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('9FN3Ws2tVNFUfpxaa0T7obc9nGx22tbGyroBi09B', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibWJyTVJxQk1yek42THlrY3FEWEdHOWVBTWVvd0dGMmV3TmY0MTBLdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly9naW9yZ29zLWtlbGxpcy50ZXN0L2FkbWluL3Bvc3RzLzIvZWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1776203245);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('o3EQGIJqFkxappqiU4R2ZwkOozEDMy3ajyi8O766', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTUdkbm5ZZUlRZzFrcTdlR2E4Y2JUSHJITlpiME5obEVVM0pna0lZTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly9naW9yZ29zLWtlbGxpcy50ZXN0L2FkbWluL3Bvc3RzLzIvZWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1776203245);

--
-- Table structure for `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (1, '25η Μαρτίου', '25i-martioy', '2026-04-14 18:39:53', '2026-04-14 18:39:53');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (2, 'Εθνική εορτή', 'ethniki-eorti', '2026-04-14 18:39:53', '2026-04-14 18:39:53');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (3, 'Μάχη των οχυρών', 'makhi-ton-okhirwn', '2026-04-14 18:44:04', '2026-04-14 18:44:04');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (4, 'Ξάνθη', 'ksanthi', '2026-04-14 18:44:04', '2026-04-14 18:44:04');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (5, 'Εχίνος', 'ekhinos', '2026-04-14 18:57:27', '2026-04-14 18:57:27');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (6, 'Γιώργος Κέλλης', 'giwrghos-kellis', '2026-04-23 12:34:05', '2026-04-23 12:34:05');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (7, 'Έβρος', 'evros', '2026-04-23 12:34:05', '2026-04-23 12:34:05');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (8, 'Ανασυγκρότηση Έβρου', 'anasighkrotisi-evroy', '2026-04-23 12:34:05', '2026-04-23 12:34:05');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (9, 'Ανάπτυξη Θράκης', 'anaptiksi-thrakis', '2026-04-23 12:34:05', '2026-04-23 12:34:05');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (10, 'Υποδομές', 'ypodomes', '2026-04-23 12:34:05', '2026-04-23 12:34:05');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (11, 'Πολιτική Προστασία', 'politiki-prostasia', '2026-04-23 12:34:05', '2026-04-23 12:34:05');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (12, 'Βόρεια Ελλάδα', 'boreia-ellada', '2026-04-23 12:34:05', '2026-04-23 12:34:05');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (13, 'Επανάσταση 1821', 'epanastasi-1821', '2026-05-06 14:43:20', '2026-05-06 14:43:20');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (14, 'Ευαγγελισμός Θεοτόκου', 'efaghghelismos-theotokoy', '2026-05-06 14:43:20', '2026-05-06 14:43:20');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (15, 'Γεώργιος Κέλλης', 'gewrghios-kellis', '2026-05-06 14:43:20', '2026-05-06 14:43:20');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (16, 'Ελληνισμός', 'ellinismos', '2026-05-06 14:43:20', '2026-05-06 14:43:20');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (17, 'Εθνική Άμυνα', 'ethniki-amina', '2026-05-06 14:43:20', '2026-05-06 14:43:20');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (18, 'Ένοπλες Δυνάμεις', 'enoples-dinameis', '2026-05-06 14:43:20', '2026-05-06 14:43:20');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (19, 'Θράκη', 'thraki', '2026-05-06 14:43:20', '2026-05-06 14:43:20');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (20, 'Πατρίδα και Πίστη', 'patrida-kai-pisti', '2026-05-06 14:43:21', '2026-05-06 14:43:21');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (21, 'Εθνική Επέτειος', 'ethniki-epeteios', '2026-05-06 14:43:21', '2026-05-06 14:43:21');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (22, 'Ελλάδα', 'ellada', '2026-05-06 14:43:21', '2026-05-06 14:43:21');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (23, 'Κυριαρχικά Δικαιώματα', 'kiriarkhika-dikaiwmata', '2026-05-06 14:43:21', '2026-05-06 14:43:21');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (24, 'Ασφάλεια και Σταθερότητα', 'asfaleia-kai-statherotita', '2026-05-06 14:43:21', '2026-05-06 14:43:21');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (25, 'Γραμμή Μεταξά', 'grammi-metaksa', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (26, 'Απρίλιος 1941', 'aprilios-1941', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (27, 'Β Παγκόσμιος Πόλεμος Ελλάδα', 'b-paghkosmios-polemos-ellada', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (28, 'Γερμανική Εισβολή Ελλάδα', 'germaniki-eisvoli-ellada', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (29, 'Οχυρά Ρούπελ', 'okhira-roupel', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (30, 'Ελληνικός Στρατός', 'ellinikos-stratos', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (31, 'Στρατιωτική Ιστορία Ελλάδας', 'stratiotiki-istoria-elladas', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (32, 'Εθνική Αντίσταση', 'ethniki-antistasi', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (33, 'Εθνική Ενότητα', 'ethniki-enotita', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (34, 'Εχίνος Ξάνθης', 'ekhinos-ksanthis', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (35, 'Ήρωες Ελλάδας', 'iroes-elladas', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (36, 'Θυσία για την Πατρίδα', 'thisia-ghia-tin-patrida', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (37, 'Ελευθερία', 'eleftheria', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (38, 'Πατριωτισμός', 'patriotismos', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (39, 'Χριστιανοί και Μουσουλμάνοι Έλληνες', 'xristiani-kai-moysoylmanoi-ellines', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (40, 'Κοινή Θυσία', 'koini-thisia', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (41, 'Ιστορική Μνήμη', 'istoriki-mnimi', '2026-05-06 14:46:30', '2026-05-06 14:46:30');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (42, 'Έβρος Μετά', 'evros-meta', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (43, 'Πυρκαγιές 2023', 'pirkaghies-2023', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (44, 'Ανάπτυξη Περιφέρειας', 'anaptiksi-perifereias', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (45, 'Βιώσιμη Ανάπτυξη', 'biwsimi-anaptiksi', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (46, 'Αγροτική Ανάπτυξη', 'aghrotiki-anaptiksi', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (47, 'Επενδύσεις Ελλάδα', 'ependyseis-ellada', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (48, 'Επιχειρηματικότητα', 'epikheirimatikotita', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (49, 'ΔΥΠΑ', 'dypa', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (50, 'Απασχόληση', 'apaskholisi', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (51, 'Αλεξανδρούπολη', 'aleksandroupoli', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (52, 'Σουφλί', 'soyfli', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (53, 'Ορεστιάδα', 'orestiada', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (54, 'Σαμοθράκη', 'samothraki', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (55, 'Μεταφορές', 'metafores', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (56, 'Σιδηρόδρομος Έβρου', 'sidirodromos-evroy', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (57, 'Ακτοπλοϊκή Σύνδεση', 'aktoploiki-syndesi', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (58, 'Δημογραφική Πολιτική', 'dimoghrafiki-politiki', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (59, 'Evros Pass', 'evros-pass', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (60, 'Ελληνική Κυβέρνηση', 'elliniki-kivernisi', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (61, 'Περιφερειακή Ανάπτυξη', 'perifereiaki-anaptiksi', '2026-05-06 15:12:23', '2026-05-06 15:12:23');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (62, 'Εφημερίδα Εμπρός', 'efimerida-empros', '2026-05-06 15:21:36', '2026-05-06 15:21:36');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (63, 'Ανάπτυξη Ξάνθης', 'anaptiksi-ksanthis', '2026-05-06 15:21:36', '2026-05-06 15:21:36');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (64, 'Κοινωνική Συνοχή', 'koinoniki-sinokhi', '2026-05-06 15:21:36', '2026-05-06 15:21:36');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (65, 'Πολυπολιτισμικότητα', 'polipolitismikotita', '2026-05-06 15:21:36', '2026-05-06 15:21:36');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (66, 'Οικονομική Ανάπτυξη', 'oikonomiki-anaptiksi', '2026-05-06 15:21:36', '2026-05-06 15:21:36');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (67, 'Δημοκρίτειο Πανεπιστήμιο Θράκης', 'dimokriteio-panepistimio-thrakis', '2026-05-06 15:21:36', '2026-05-06 15:21:36');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (68, 'Διασυνοριακή Συνεργασία', 'diasinoriaki-sinerghasia', '2026-05-06 15:21:36', '2026-05-06 15:21:36');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (69, 'Καινοτομία', 'kainotomia', '2026-05-06 15:21:36', '2026-05-06 15:21:36');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (70, 'Εκπαίδευση', 'ekpaidefsi', '2026-05-06 15:21:36', '2026-05-06 15:21:36');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (71, 'Νεολαία', 'neolaia', '2026-05-06 15:21:36', '2026-05-06 15:21:36');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (72, 'Ενεργειακός Κόμβος', 'energheiakos-komvos', '2026-05-06 15:21:36', '2026-05-06 15:21:36');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (73, 'Τοπική Αυτοδιοίκηση', 'topiki-autodiikisi', '2026-05-06 15:21:36', '2026-05-06 15:21:36');
INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES (74, 'Πολιτική Σταθερότητα', 'politiki-statherotita', '2026-05-06 15:21:36', '2026-05-06 15:21:36');

--
-- Table structure for `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES (1, 'Site Administrator', 'in.agora.store@gmail.com', NULL, '$2y$12$vkMH097FlZRRp19OjHOuEeoq.D4wO.B7rcAhc3d8B5P6xUFYu3Pva', 'Qf7bYvPrnfc2OUGTGcDhsvATwz11NEMH2IeDRkcMy7nOcKVDMQdZ46eDjt4B', '2026-04-14 17:27:18', '2026-05-06 13:51:23');

SET FOREIGN_KEY_CHECKS=1;
