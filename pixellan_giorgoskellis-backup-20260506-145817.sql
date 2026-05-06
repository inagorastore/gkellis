-- Exported from pixellan_giorgoskellis at 2026-05-06 14:58:17
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Data for `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `slug`, `excerpt`, `body`, `cover_image_path`, `og_image`, `meta_title`, `meta_description`, `published_at`, `is_published`, `created_at`, `updated_at`) VALUES (1, 1, 7, 'Γεώργιος Κέλλης : 25η Μαρτίου. Διπλή Εορτή, Αδιαπραγμάτευτες Αξίες: Πίστη και Πατρίδα', 'georgios-kellis-25i-martiou-dipli-eorti-adiapragmateutes-axies-pisti-kai-patrida', '&nbsp;Μήνυμα του Γεώργιου Κέλλη για την 25η Μαρτίου: η διπλή εορτή του Ελληνισμού και της Ορθοδοξίας αναδεικνύει τις διαχρονικές αξίες της πίστης, της ενότητας και της εθνικής υπερηφάνειας, σε ένα απαιτητικό γεωπολιτικό περιβάλλον.&nbsp;', '&nbsp;Με ιδιαίτερη συγκίνηση και εθνική υπερηφάνεια τιμούμε την επέτειο της 25ης Μαρτίου 1821, μια ημέρα που αποτελεί διαχρονικό σύμβολο πίστης, θυσίας και αγώνα για ελευθερία. Ταυτόχρονα, η ημέρα αυτή φέρει και βαθύ θρησκευτικό συμβολισμό, καθώς εορτάζεται ο Ευαγγελισμός της Θεοτόκου, αναδεικνύοντας τον διττό χαρακτήρα της ως γιορτή της Ορθοδοξίας και του Ελληνισμού. Οι αγωνιστές της Επανάστασης απέδειξαν ότι όταν ο Ελληνισμός είναι ενωμένος, με πίστη στην πατρίδα και στις αξίες του, μπορεί να υπερβεί κάθε δυσκολία και να διεκδικήσει το δικαίωμά του στην ελευθερία και την αξιοπρέπεια.<br><br>Σήμερα, μέσα σε ένα σύνθετο και απαιτητικό γεωπολιτικό περιβάλλον, η ιστορική αυτή παρακαταθήκη αποκτά ιδιαίτερη σημασία. Η Ελλάδα παραμένει προσηλωμένη στην υπεράσπιση της εθνικής κυριαρχίας και των κυριαρχικών της δικαιωμάτων, διατηρώντας ισχυρή αποτρεπτική ικανότητα και υψηλό επίπεδο ετοιμότητας.<br><br>Οι πρόσφατες κινήσεις ενίσχυσης της άμυνας, στον Έβρο, την Κάρπαθο και την ευρύτερη περιοχή της Κύπρου, με την παρουσία σύγχρονων αμυντικών συστημάτων που ενισχύουν την ασπίδα προστασίας της πατρίδας, σε συνδυασμό με την επιτυχή επιχειρησιακή αξιοποίηση ελληνικών αμυντικών μέσων στο εξωτερικό, υπογραμμίζουν ότι η ασφάλεια, η σταθερότητα και η ειρήνη διασφαλίζονται με υπευθυνότητα, ετοιμότητα και εθνική αυτοπεποίθηση.<br><br>Οι Ένοπλες Δυνάμεις της χώρας, με υψηλό φρόνημα, επαγγελματισμό και αφοσίωση, στέκονται άγρυπνοι φρουροί της ελευθερίας και της εθνικής αξιοπρέπειας, συνεχίζοντας επάξια την παράδοση των προγόνων μας.<br><br>Η επέτειος της 25ης Μαρτίου μάς καλεί όλους να αντλήσουμε δύναμη από την ιστορία μας και να προχωρήσουμε με ενότητα, αποφασιστικότητα και πίστη στις διαχρονικές αξίες του Ελληνισμού.<br><br>Χρόνια πολλά σε όλες τις Ελληνίδες και όλους τους Έλληνες.<br><br>Ζήτω η 25η Μαρτίου.<br>Ζήτω η Ελλάδα.<br>Ζήτω η Θράκη.<br>Ζήτω η Ξάνθη.<br><br>Αντιστράτηγος (ε.α.) Γεώργιος Κέλλης<br>Επίτιμος Υπαρχηγός Γενικού<br>Επιτελείου Στρατού&nbsp;<br><br><br>', 'posts/covers/l1ENQ2s3aIrObLqoogIBu9HmE9dlbPoZYJonyCHN.jpg', NULL, 'Γεώργιος Κέλλης: 25η Μαρτίου – Πίστη, Πατρίδα, Εθνική Ισχύς', 'Μήνυμα του Γεώργιου Κέλλη για την 25η Μαρτίου. Η σημασία της πίστης, της εθνικής ενότητας και της ισχυρής άμυνας σε σύγχρονο γεωπολιτικό περιβάλλον.', '2026-03-25 01:51:00', 1, '2026-04-14 17:27:18', '2026-05-06 14:46:57');
INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `slug`, `excerpt`, `body`, `cover_image_path`, `og_image`, `meta_title`, `meta_description`, `published_at`, `is_published`, `created_at`, `updated_at`) VALUES (2, 1, 7, 'Η Μάχη των Οχυρών και η Θυσία στον Εχίνο: Μνήμη, Ενότητα και Πατριωτισμός', 'i-machi-ton-ochyron-kai-i-thysia-ston-echino-mnimi-enotita-kai-patriotismos', 'Η Μάχη των Οχυρών, τον Απρίλιο του 1941, αποτελεί μία από τις πλέον ένδοξες σελίδες της νεότερης ελληνικής ιστορίας. Στο πλαίσιο της γερμανικής εισβολής, η αμυντική γραμμή Μεταξά στάθηκε σύμβολο αντίστασης, τιμής και στρατιωτικής αρετής. Παρά τη συντριπτική υπεροχή των επιτιθέμενων δυνάμεων, οι Έλληνες υπερασπιστές των...', 'Η Μάχη των Οχυρών, τον Απρίλιο του 1941, αποτελεί μία από τις πλέον ένδοξες σελίδες της νεότερης ελληνικής ιστορίας. Στο πλαίσιο της γερμανικής εισβολής, η αμυντική γραμμή Μεταξά στάθηκε σύμβολο αντίστασης, τιμής και στρατιωτικής αρετής. Παρά τη συντριπτική υπεροχή των επιτιθέμενων δυνάμεων, οι Έλληνες υπερασπιστές των οχυρών πολέμησαν με απαράμιλλο θάρρος, αποδεικνύοντας ότι η δύναμη της ψυχής και η πίστη στην πατρίδα υπερβαίνουν κάθε υλική υπεροχή.<br><br>Ιδιαίτερη θέση σε αυτή την ιστορική μνήμη κατέχει η περιοχή του Εχίνου, όπου η θυσία έλαβε έναν βαθύτερο και διαχρονικό συμβολισμό. Εκεί, Χριστιανοί και Μουσουλμάνοι Έλληνες στρατιώτες στάθηκαν πλάι-πλάι, ενωμένοι από το κοινό καθήκον προς την πατρίδα. Χωρίς διακρίσεις θρησκείας ή καταγωγής, υπερασπίστηκαν την ελευθερία της Ελλάδας με το ίδιο πάθος και την ίδια αυταπάρνηση.<br><br>Η κοινή αυτή θυσία αποτελεί ζωντανό παράδειγμα εθνικής ενότητας. Σε μια εποχή, όπου κάποιοι ελάχιστοι προσπαθούν να εντείνουν διαχωριστικές γραμμές, η ιστορία του Εχίνου υπενθυμίζει ότι η Ελλάδα μεγαλούργησε όταν τα παιδιά της στάθηκαν ενωμένα. Η έννοια της πατρίδας υπερίσχυσε κάθε επιμέρους ταυτότητας, και το αίμα που χύθηκε ήταν κοινό, ιερό και τιμημένο.<br><br>Οι πεσόντες του Εχίνου δεν αποτελούν μόνο ήρωες μιας τοπικής ιστορίας, αλλά σύμβολα μιας ευρύτερης αλήθειας: ότι η ελευθερία κατακτάται και διαφυλάσσεται μέσα από την ενότητα, την αλληλεγγύη και την πίστη σε κοινές αξίες. Η θυσία τους μάς καλεί όχι μόνο να θυμόμαστε, αλλά και να πράττουμε με γνώμονα το συλλογικό καλό.<br><br>Σήμερα, τιμώντας τη Μάχη των Οχυρών και τους ήρωες του Εχίνου, αποδίδουμε τον οφειλόμενο σεβασμό σε εκείνους που έθεσαν το «εμείς» πάνω από το «εγώ». Η μνήμη τους αποτελεί φάρο που φωτίζει το παρόν και καθοδηγεί το μέλλον, υπενθυμίζοντάς μας ότι η δύναμη της Ελλάδας βρίσκεται στην ενότητα του λαού της.<br><br>Αιωνία τους η μνήμη.<br><br>Ζήτω η μάχη των Οχυρών.<br>Ζήτω η Ελλάδα.<br><br>Αντιστράτηγος ( ε.α.)<br>Γεώργιος Κέλλης<br>Επίτιμος Υπαρχηγός Γενικού Επιτελείου Στρατού', 'posts/covers/ZsRtYW1vxYSYy2uLpRqNAyKKbIWfbBMNjlzXMj6j.jpg', NULL, 'Μάχη των Οχυρών (1941) – Εχίνος Ξάνθη: Μνήμη & Ενότητα', 'Η Μάχη των Οχυρών (1941) και η θυσία στον Εχίνο Ξάνθης, στην αμυντική γραμμή Μεταξά, συμβολίζουν ανδρεία, ενότητα και εθνική μνήμη.', '2026-03-28 21:43:00', 1, '2026-04-14 18:44:04', '2026-05-06 14:46:30');
INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `slug`, `excerpt`, `body`, `cover_image_path`, `og_image`, `meta_title`, `meta_description`, `published_at`, `is_published`, `created_at`, `updated_at`) VALUES (5, 1, 3, 'Γιώργος Κέλλης: Σχέδιο ανασυγκρότησης και ανάπτυξης για έναν ισχυρό Έβρο', 'giorgos-kellis-schedio-anasygkrotisis-kai-anaptyxis-gia-enan-ischyro-evro', 'Ο Αντιστράτηγος ε.α. Γιώργος Κέλλης παρουσιάζει το ολοκληρωμένο σχέδιο ανασυγκρότησης και ανάπτυξης του Έβρου, με έργα υποδομών, ενεργειακές επενδύσεις και παρεμβάσεις που ενισχύουν την οικονομία, την ασφάλεια και την κοινωνική συνοχή της περιοχής.&nbsp;', '&nbsp;Την ανάγκη για ένα ολοκληρωμένο και μακροπρόθεσμο σχέδιο ανασυγκρότησης του Έβρου υπογραμμίζει σε πρόσφατες δημόσιες παρεμβάσεις του ο Αντιστράτηγος ε.α. Γιώργος Κέλλης, εστιάζοντας στην αποκατάσταση των ζημιών από τις φυσικές καταστροφές αλλά και στη δημιουργία ενός νέου αναπτυξιακού μοντέλου για την περιοχή. Σύμφωνα με όσα επισημαίνει, η ανασυγκρότηση του Έβρου δεν περιορίζεται μόνο σε έργα αποκατάστασης, αλλά εντάσσεται σε ένα ευρύτερο σχέδιο που συνδυάζει υποδομές, επενδύσεις, κοινωνική στήριξη και ενίσχυση της τοπικής οικονομίας. <br><br><strong>Ένα πολυεπίπεδο πρόγραμμα παρεμβάσεων <br></strong><br>Το σχέδιο που βρίσκεται σε εξέλιξη βασίζεται σε τέσσερις βασικούς άξονες:<br>&nbsp;την αποκατάσταση των ζημιών από τις πρόσφατες φυσικές καταστροφές, την υλοποίηση μεγάλων αναπτυξιακών έργων με ορίζοντα το 2030, την προώθηση νέων επενδύσεων και μελετών για την επόμενη περίοδο, καθώς και την εφαρμογή ειδικών οικονομικών και κοινωνικών μέτρων για την περιοχή. Στο πλαίσιο αυτό προγραμματίζονται εκατοντάδες έργα και παρεμβάσεις, τα οποία αφορούν τόσο τις υποδομές όσο και τη συνολική αναπτυξιακή προοπτική του Έβρου. <br><br><strong>Έργα υποδομών και στρατηγικές επενδύσεις <br></strong><br>Ιδιαίτερη έμφαση δίνεται σε έργα που ενισχύουν τον γεωστρατηγικό ρόλο της περιοχής. Μεταξύ των σημαντικότερων παρεμβάσεων περιλαμβάνονται η αναβάθμιση του οδικού δικτύου και κρίσιμων γεφυρών, η ενίσχυση των αντιπλημμυρικών έργων, καθώς και η βελτίωση των αρδευτικών και υδρευτικών υποδομών. Παράλληλα προωθείται η αναβάθμιση των συνοριακών σταθμών στους Κήπους και τις Καστανιές, καθώς και ο εκσυγχρονισμός της σιδηροδρομικής σύνδεσης Αλεξανδρούπολης – Ορεστιάδας. Στο πεδίο των μεταφορών εξετάζεται επίσης η ανάπτυξη θαλάσσιας εμπορευματικής σύνδεσης μεταξύ Αλεξανδρούπολης και Πειραιά, ενισχύοντας τον ρόλο της περιοχής ως σημαντικού κόμβου μεταφορών και εμπορίου. <br><br><strong>Στήριξη της οικονομίας και της απασχόλησης </strong><br>Κεντρικός στόχος των παρεμβάσεων είναι η ενίσχυση της τοπικής οικονομίας και η δημιουργία νέων θέσεων εργασίας. Μεταξύ των μέτρων που προωθούνται περιλαμβάνονται προγράμματα στήριξης της επιχειρηματικότητας, ενίσχυση του πρωτογενούς τομέα, καθώς και δράσεις καινοτομίας για την αγροτική παραγωγή. Παράλληλα εξετάζονται φορολογικά κίνητρα για οικισμούς του Έβρου, ενώ προωθούνται και νέες ακαδημαϊκές δομές, όπως η δημιουργία Τμήματος Κτηνιατρικής στην Ορεστιάδα και μεταπτυχιακού προγράμματος Πολιτικής Προστασίας στο Σουφλί. <br><br><strong>Περιβάλλον και πρόληψη φυσικών καταστροφών </strong><br>Σημαντικό μέρος του σχεδιασμού αφορά την προστασία του φυσικού περιβάλλοντος και την πρόληψη μελλοντικών φυσικών καταστροφών. Στο Δάσος της Δαδιάς υλοποιούνται έργα αποκατάστασης και αντιδιαβρωτικών παρεμβάσεων, ενώ ενισχύονται τα συστήματα πρόληψης και αντιμετώπισης πυρκαγιών. Ταυτόχρονα προωθούνται έργα διαχείρισης υδάτων και φραγμάτων που αναμένεται να ενισχύσουν την αγροτική παραγωγή και να περιορίσουν τον κίνδυνο πλημμυρών. <br><strong>Ανάπτυξη με εθνική διάσταση </strong><br>Η αναπτυξιακή πορεία του Έβρου δεν αποτελεί μόνο περιφερειακό ζήτημα, αλλά συνδέεται άμεσα με την οικονομική ανάπτυξη, την κοινωνική συνοχή και τη στρατηγική σημασία της Θράκης. Στόχος των παρεμβάσεων είναι η ουσιαστική βελτίωση της καθημερινότητας των πολιτών και η ενίσχυση της εμπιστοσύνης των τοπικών κοινωνιών προς το κράτος&nbsp;', 'posts/covers/CT7CdQrBVquY523GEZqKCpOyebG5k2IZPLmnVZ7J.jpg', NULL, 'Γιώργος Κέλλης: Το σχέδιο ανάπτυξης και ανασυγκρότησης του Έβρου', 'Ο Γιώργος Κέλλης παρουσιάζει το σχέδιο ανασυγκρότησης και ανάπτυξης του Έβρου, με έργα υποδομών, επενδύσεις και μέτρα στήριξης της τοπικής οικονομίας.', '2026-04-23 15:32:00', 1, '2026-04-23 12:34:05', '2026-04-23 12:39:41');

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
