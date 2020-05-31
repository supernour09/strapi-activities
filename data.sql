-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.3-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for palmabeach
CREATE DATABASE IF NOT EXISTS `palmabeach` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `palmabeach`;

-- Dumping structure for table palmabeach.activities
CREATE TABLE IF NOT EXISTS `activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- Dumping data for table palmabeach.activities: ~2 rows (approximately)
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` (`id`, `Price`, `created_at`, `updated_at`) VALUES
	(1, 90.00, '2020-05-30 08:19:19', '2020-05-30 13:04:12'),
	(2, 180.00, '2020-05-30 08:23:35', '2020-05-30 13:04:12');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;

-- Dumping structure for table palmabeach.activities_components
CREATE TABLE IF NOT EXISTS `activities_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_id_fk` (`activity_id`),
  CONSTRAINT `activity_id_fk` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table palmabeach.activities_components: ~6 rows (approximately)
/*!40000 ALTER TABLE `activities_components` DISABLE KEYS */;
INSERT INTO `activities_components` (`id`, `field`, `order`, `component_type`, `component_id`, `activity_id`) VALUES
	(1, 'Title', 1, 'components_lang_multi_langs', 1, 1),
	(2, 'subTitle', 1, 'components_lang_multi_langs', 2, 1),
	(3, 'Description', 1, 'components_lang_multi_langs', 3, 1),
	(4, 'Title', 1, 'components_lang_multi_langs', 4, 2),
	(5, 'subTitle', 1, 'components_lang_multi_langs', 5, 2),
	(6, 'Description', 1, 'components_lang_multi_langs', 6, 2);
/*!40000 ALTER TABLE `activities_components` ENABLE KEYS */;

-- Dumping structure for table palmabeach.components_lang_multi_langs
CREATE TABLE IF NOT EXISTS `components_lang_multi_langs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `En` longtext DEFAULT NULL,
  `Es` longtext DEFAULT NULL,
  `De` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table palmabeach.components_lang_multi_langs: ~6 rows (approximately)
/*!40000 ALTER TABLE `components_lang_multi_langs` DISABLE KEYS */;
INSERT INTO `components_lang_multi_langs` (`id`, `En`, `Es`, `De`) VALUES
	(1, 'Title 1 En', 'Title 1 Es', 'Title 1 De'),
	(2, 'subTitle 1 En', 'SubTitle 1 Es', 'subTitle 1 De'),
	(3, 'description of activite 1 en ', 'description of activite 1 es', 'description of activite 1 de'),
	(4, 'title 2 en', '\ntitle 2 es', '\ntitle 2 de'),
	(5, 'subTitle 2 en', 'subTitle 2 es', 'subTitle 2 de'),
	(6, 'descript 2 en', 'descript 2 es', 'descript 2 de');
/*!40000 ALTER TABLE `components_lang_multi_langs` ENABLE KEYS */;

-- Dumping structure for table palmabeach.core_store
CREATE TABLE IF NOT EXISTS `core_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table palmabeach.core_store: ~21 rows (approximately)
/*!40000 ALTER TABLE `core_store` DISABLE KEYS */;
INSERT INTO `core_store` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
	(1, 'db_model_core_store', '{"key":{"type":"string"},"value":{"type":"text"},"type":{"type":"string"},"environment":{"type":"string"},"tag":{"type":"string"}}', 'object', NULL, NULL),
	(2, 'db_model_users-permissions_permission', '{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false}}', 'object', NULL, NULL),
	(3, 'db_model_strapi_webhooks', '{"name":{"type":"string"},"url":{"type":"text"},"headers":{"type":"json"},"events":{"type":"json"},"enabled":{"type":"boolean"}}', 'object', NULL, NULL),
	(4, 'db_model_upload_file', '{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"collection":"*","filter":"field","configurable":false},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
	(5, 'db_model_users-permissions_role', '{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true}}', 'object', NULL, NULL),
	(6, 'db_model_strapi_administrator', '{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"required":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"blocked":{"type":"boolean","default":false,"configurable":false}}', 'object', NULL, NULL),
	(7, 'db_model_users-permissions_user', '{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
	(8, 'db_model_upload_file_morph', '{"upload_file_id":{"type":"integer"},"related_id":{"type":"integer"},"related_type":{"type":"text"},"field":{"type":"text"},"order":{"type":"integer"}}', 'object', NULL, NULL),
	(9, 'plugin_users-permissions_grant', '{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"/auth/instagram/callback"},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"/auth/twitch/callback","scope":["user:read:email"]}}', 'object', '', ''),
	(10, 'plugin_upload_settings', '{"sizeOptimization":true,"responsiveDimensions":true}', 'object', 'development', ''),
	(11, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.permission', '{"uid":"plugins::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"type","defaultSortBy":"type","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"controller":{"edit":{"label":"Controller","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Controller","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"enabled":{"edit":{"label":"Enabled","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Enabled","searchable":true,"sortable":true}},"policy":{"edit":{"label":"Policy","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Policy","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":false,"sortable":false}}},"layouts":{"list":["id","type","controller","action"],"editRelations":["role"],"edit":[[{"name":"type","size":6},{"name":"controller","size":6}],[{"name":"action","size":6},{"name":"enabled","size":4}],[{"name":"policy","size":6}]]}}', 'object', '', ''),
	(12, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.role', '{"uid":"plugins::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"Permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"type"},"list":{"label":"Permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"Users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"Users","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","description","type"],"editRelations":["permissions","users"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6}]]}}', 'object', '', ''),
	(13, 'plugin_content_manager_configuration_content_types::plugins::upload.file', '{"uid":"plugins::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"AlternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"AlternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"Caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"Width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Width","searchable":true,"sortable":true}},"height":{"edit":{"label":"Height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"Formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"Hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"Ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"Mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"Size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Size","searchable":true,"sortable":true}},"url":{"edit":{"label":"Url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"PreviewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PreviewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"Provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider_metadata","searchable":false,"sortable":false}},"related":{"edit":{"label":"Related","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"Related","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"editRelations":["related"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}]]}}', 'object', '', ''),
	(14, 'plugin_content_manager_configuration_content_types::strapi::administrator', '{"uid":"strapi::administrator","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","blocked"],"editRelations":[],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"blocked","size":4}]]}}', 'object', '', ''),
	(15, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.user', '{"uid":"plugins::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"Confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"editRelations":["role"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4}]]}}', 'object', '', ''),
	(16, 'plugin_users-permissions_email', '{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}', 'object', '', ''),
	(17, 'plugin_users-permissions_advanced', '{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_confirmation_redirection":"/admin/admin","email_reset_password":"/admin/admin","default_role":"authenticated"}', 'object', '', ''),
	(18, 'db_model_components_lang_multi_langs', '{"En":{"type":"richtext"},"Es":{"type":"richtext"},"De":{"type":"richtext"}}', 'object', NULL, NULL),
	(19, 'db_model_activities', '{"Title":{"type":"component","repeatable":false,"component":"lang.multi-lang"},"subTitle":{"type":"component","repeatable":false,"component":"lang.multi-lang"},"Description":{"type":"component","repeatable":false,"component":"lang.multi-lang"},"Pictures":{"collection":"file","via":"related","allowedTypes":["images","files","videos"],"plugin":"upload","required":false},"Price":{"type":"decimal"},"created_at":{"type":"currentTimestamp"},"updated_at":{"type":"currentTimestamp"}}', 'object', NULL, NULL),
	(20, 'plugin_content_manager_configuration_content_types::application::activitie.activitie', '{"uid":"application::activitie.activitie","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"Title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":false,"sortable":false}},"subTitle":{"edit":{"label":"SubTitle","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"SubTitle","searchable":false,"sortable":false}},"Description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":false,"sortable":false}},"Pictures":{"edit":{"label":"Pictures","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Pictures","searchable":false,"sortable":false}},"Price":{"edit":{"label":"Price","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Price","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","Pictures","Price","created_at"],"editRelations":[],"edit":[[{"name":"Title","size":12}],[{"name":"subTitle","size":12}],[{"name":"Description","size":12}],[{"name":"Pictures","size":6},{"name":"Price","size":4}]]}}', 'object', '', ''),
	(21, 'plugin_content_manager_configuration_components::lang.multi-lang', '{"uid":"lang.multi-lang","isComponent":true,"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":false,"sortable":false}},"En":{"edit":{"label":"En","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"En","searchable":false,"sortable":false}},"Es":{"edit":{"label":"Es","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Es","searchable":false,"sortable":false}},"De":{"edit":{"label":"De","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"De","searchable":false,"sortable":false}}},"layouts":{"list":["id"],"edit":[[{"name":"En","size":12}],[{"name":"Es","size":12}],[{"name":"De","size":12}]],"editRelations":[]}}', 'object', '', '');
/*!40000 ALTER TABLE `core_store` ENABLE KEYS */;

-- Dumping structure for table palmabeach.strapi_administrator
CREATE TABLE IF NOT EXISTS `strapi_administrator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_administrator_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table palmabeach.strapi_administrator: ~1 rows (approximately)
/*!40000 ALTER TABLE `strapi_administrator` DISABLE KEYS */;
INSERT INTO `strapi_administrator` (`id`, `username`, `email`, `password`, `resetPasswordToken`, `blocked`) VALUES
	(1, 'admin', 'nourahmedabbas@gmail.com', '$2a$10$.7dp0xR6wnWSqQLO97nO0eHsX18Sgrdv9a2JDPLLelPsHr0cHwhCm', NULL, NULL);
/*!40000 ALTER TABLE `strapi_administrator` ENABLE KEYS */;

-- Dumping structure for table palmabeach.strapi_webhooks
CREATE TABLE IF NOT EXISTS `strapi_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `headers` longtext DEFAULT NULL,
  `events` longtext DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table palmabeach.strapi_webhooks: ~0 rows (approximately)
/*!40000 ALTER TABLE `strapi_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_webhooks` ENABLE KEYS */;

-- Dumping structure for table palmabeach.upload_file
CREATE TABLE IF NOT EXISTS `upload_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alternativeText` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext DEFAULT NULL,
  `hash` varchar(255) NOT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) NOT NULL,
  `size` decimal(10,2) NOT NULL,
  `url` varchar(255) NOT NULL,
  `previewUrl` varchar(255) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `provider_metadata` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table palmabeach.upload_file: ~0 rows (approximately)
/*!40000 ALTER TABLE `upload_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file` ENABLE KEYS */;

-- Dumping structure for table palmabeach.upload_file_morph
CREATE TABLE IF NOT EXISTS `upload_file_morph` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext DEFAULT NULL,
  `field` longtext DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table palmabeach.upload_file_morph: ~0 rows (approximately)
/*!40000 ALTER TABLE `upload_file_morph` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_morph` ENABLE KEYS */;

-- Dumping structure for table palmabeach.users-permissions_permission
CREATE TABLE IF NOT EXISTS `users-permissions_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=latin1;

-- Dumping data for table palmabeach.users-permissions_permission: ~158 rows (approximately)
/*!40000 ALTER TABLE `users-permissions_permission` DISABLE KEYS */;
INSERT INTO `users-permissions_permission` (`id`, `type`, `controller`, `action`, `enabled`, `policy`, `role`) VALUES
	(1, 'content-manager', 'components', 'findcomponent', 0, '', 1),
	(2, 'content-manager', 'components', 'findcomponent', 0, '', 2),
	(3, 'content-manager', 'components', 'listcomponents', 0, '', 1),
	(4, 'content-manager', 'components', 'listcomponents', 0, '', 2),
	(5, 'content-manager', 'components', 'updatecomponent', 0, '', 1),
	(6, 'content-manager', 'components', 'updatecomponent', 0, '', 2),
	(7, 'content-manager', 'contentmanager', 'checkuidavailability', 0, '', 1),
	(8, 'content-manager', 'contentmanager', 'checkuidavailability', 0, '', 2),
	(9, 'content-manager', 'contentmanager', 'count', 0, '', 1),
	(10, 'content-manager', 'contentmanager', 'count', 0, '', 2),
	(11, 'content-manager', 'contentmanager', 'create', 0, '', 1),
	(12, 'content-manager', 'contentmanager', 'create', 0, '', 2),
	(13, 'content-manager', 'contentmanager', 'delete', 0, '', 1),
	(14, 'content-manager', 'contentmanager', 'delete', 0, '', 2),
	(15, 'content-manager', 'contentmanager', 'deletemany', 0, '', 1),
	(16, 'content-manager', 'contentmanager', 'deletemany', 0, '', 2),
	(17, 'content-manager', 'contentmanager', 'find', 0, '', 1),
	(18, 'content-manager', 'contentmanager', 'find', 0, '', 2),
	(19, 'content-manager', 'contentmanager', 'findone', 0, '', 1),
	(20, 'content-manager', 'contentmanager', 'findone', 0, '', 2),
	(21, 'content-manager', 'contentmanager', 'generateuid', 0, '', 1),
	(22, 'content-manager', 'contentmanager', 'generateuid', 0, '', 2),
	(23, 'content-manager', 'contentmanager', 'update', 0, '', 1),
	(24, 'content-manager', 'contentmanager', 'update', 0, '', 2),
	(25, 'content-manager', 'contenttypes', 'findcontenttype', 0, '', 1),
	(26, 'content-manager', 'contenttypes', 'findcontenttype', 0, '', 2),
	(27, 'content-manager', 'contenttypes', 'listcontenttypes', 0, '', 1),
	(28, 'content-manager', 'contenttypes', 'listcontenttypes', 0, '', 2),
	(29, 'content-manager', 'contenttypes', 'updatecontenttype', 0, '', 1),
	(30, 'content-manager', 'contenttypes', 'updatecontenttype', 0, '', 2),
	(31, 'content-type-builder', 'builder', 'getreservednames', 0, '', 1),
	(32, 'content-type-builder', 'builder', 'getreservednames', 0, '', 2),
	(33, 'content-type-builder', 'componentcategories', 'deletecategory', 0, '', 1),
	(34, 'content-type-builder', 'componentcategories', 'deletecategory', 0, '', 2),
	(35, 'content-type-builder', 'componentcategories', 'editcategory', 0, '', 1),
	(36, 'content-type-builder', 'componentcategories', 'editcategory', 0, '', 2),
	(37, 'content-type-builder', 'components', 'createcomponent', 0, '', 1),
	(38, 'content-type-builder', 'components', 'createcomponent', 0, '', 2),
	(39, 'content-type-builder', 'components', 'deletecomponent', 0, '', 1),
	(40, 'content-type-builder', 'components', 'deletecomponent', 0, '', 2),
	(41, 'content-type-builder', 'components', 'getcomponent', 0, '', 1),
	(42, 'content-type-builder', 'components', 'getcomponent', 0, '', 2),
	(43, 'content-type-builder', 'components', 'getcomponents', 0, '', 1),
	(44, 'content-type-builder', 'components', 'getcomponents', 0, '', 2),
	(45, 'content-type-builder', 'components', 'updatecomponent', 0, '', 1),
	(46, 'content-type-builder', 'components', 'updatecomponent', 0, '', 2),
	(47, 'content-type-builder', 'connections', 'getconnections', 0, '', 1),
	(48, 'content-type-builder', 'connections', 'getconnections', 0, '', 2),
	(49, 'content-type-builder', 'contenttypes', 'createcontenttype', 0, '', 1),
	(50, 'content-type-builder', 'contenttypes', 'createcontenttype', 0, '', 2),
	(51, 'content-type-builder', 'contenttypes', 'deletecontenttype', 0, '', 1),
	(52, 'content-type-builder', 'contenttypes', 'deletecontenttype', 0, '', 2),
	(53, 'content-type-builder', 'contenttypes', 'getcontenttype', 0, '', 1),
	(54, 'content-type-builder', 'contenttypes', 'getcontenttype', 0, '', 2),
	(55, 'content-type-builder', 'contenttypes', 'getcontenttypes', 0, '', 1),
	(56, 'content-type-builder', 'contenttypes', 'getcontenttypes', 0, '', 2),
	(57, 'content-type-builder', 'contenttypes', 'updatecontenttype', 0, '', 1),
	(58, 'content-type-builder', 'contenttypes', 'updatecontenttype', 0, '', 2),
	(59, 'email', 'email', 'send', 0, '', 1),
	(60, 'email', 'email', 'send', 0, '', 2),
	(61, 'upload', 'proxy', 'uploadproxy', 0, '', 1),
	(62, 'upload', 'proxy', 'uploadproxy', 0, '', 2),
	(63, 'upload', 'upload', 'count', 0, '', 1),
	(64, 'upload', 'upload', 'count', 0, '', 2),
	(65, 'upload', 'upload', 'destroy', 0, '', 1),
	(66, 'upload', 'upload', 'destroy', 0, '', 2),
	(67, 'upload', 'upload', 'find', 0, '', 1),
	(68, 'upload', 'upload', 'find', 0, '', 2),
	(69, 'upload', 'upload', 'findone', 0, '', 1),
	(70, 'upload', 'upload', 'findone', 0, '', 2),
	(71, 'upload', 'upload', 'getsettings', 0, '', 1),
	(72, 'upload', 'upload', 'getsettings', 0, '', 2),
	(73, 'upload', 'upload', 'search', 0, '', 1),
	(74, 'upload', 'upload', 'search', 0, '', 2),
	(75, 'upload', 'upload', 'updatesettings', 0, '', 1),
	(76, 'upload', 'upload', 'updatesettings', 0, '', 2),
	(77, 'upload', 'upload', 'upload', 0, '', 1),
	(78, 'upload', 'upload', 'upload', 0, '', 2),
	(79, 'users-permissions', 'auth', 'callback', 0, '', 1),
	(80, 'users-permissions', 'auth', 'callback', 1, '', 2),
	(81, 'users-permissions', 'auth', 'connect', 1, '', 1),
	(82, 'users-permissions', 'auth', 'connect', 1, '', 2),
	(83, 'users-permissions', 'auth', 'emailconfirmation', 0, '', 1),
	(84, 'users-permissions', 'auth', 'emailconfirmation', 1, '', 2),
	(85, 'users-permissions', 'auth', 'forgotpassword', 0, '', 1),
	(86, 'users-permissions', 'auth', 'forgotpassword', 1, '', 2),
	(87, 'users-permissions', 'auth', 'register', 0, '', 1),
	(88, 'users-permissions', 'auth', 'register', 1, '', 2),
	(89, 'users-permissions', 'auth', 'resetpassword', 0, '', 1),
	(90, 'users-permissions', 'auth', 'resetpassword', 0, '', 2),
	(91, 'users-permissions', 'auth', 'sendemailconfirmation', 0, '', 1),
	(92, 'users-permissions', 'auth', 'sendemailconfirmation', 0, '', 2),
	(93, 'users-permissions', 'user', 'count', 0, '', 1),
	(94, 'users-permissions', 'user', 'count', 0, '', 2),
	(95, 'users-permissions', 'user', 'create', 0, '', 1),
	(96, 'users-permissions', 'user', 'create', 0, '', 2),
	(97, 'users-permissions', 'user', 'destroy', 0, '', 1),
	(98, 'users-permissions', 'user', 'destroy', 0, '', 2),
	(99, 'users-permissions', 'user', 'destroyall', 0, '', 1),
	(100, 'users-permissions', 'user', 'destroyall', 0, '', 2),
	(101, 'users-permissions', 'user', 'find', 0, '', 1),
	(102, 'users-permissions', 'user', 'find', 0, '', 2),
	(103, 'users-permissions', 'user', 'findone', 0, '', 1),
	(104, 'users-permissions', 'user', 'findone', 0, '', 2),
	(105, 'users-permissions', 'user', 'me', 1, '', 1),
	(106, 'users-permissions', 'user', 'me', 1, '', 2),
	(107, 'users-permissions', 'user', 'update', 0, '', 1),
	(108, 'users-permissions', 'user', 'update', 0, '', 2),
	(109, 'users-permissions', 'userspermissions', 'createrole', 0, '', 1),
	(110, 'users-permissions', 'userspermissions', 'createrole', 0, '', 2),
	(111, 'users-permissions', 'userspermissions', 'deleteprovider', 0, '', 1),
	(112, 'users-permissions', 'userspermissions', 'deleteprovider', 0, '', 2),
	(113, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 1),
	(114, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 2),
	(115, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 1),
	(116, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 2),
	(117, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 1),
	(118, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 2),
	(119, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 1),
	(120, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 2),
	(121, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 1),
	(122, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 2),
	(123, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 1),
	(124, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 2),
	(125, 'users-permissions', 'userspermissions', 'getrole', 0, '', 1),
	(126, 'users-permissions', 'userspermissions', 'getrole', 0, '', 2),
	(131, 'users-permissions', 'userspermissions', 'getroles', 0, '', 1),
	(132, 'users-permissions', 'userspermissions', 'getroles', 0, '', 2),
	(133, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 1),
	(134, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 2),
	(135, 'users-permissions', 'userspermissions', 'index', 0, '', 1),
	(136, 'users-permissions', 'userspermissions', 'index', 0, '', 2),
	(137, 'users-permissions', 'userspermissions', 'init', 1, '', 1),
	(138, 'users-permissions', 'userspermissions', 'init', 1, '', 2),
	(139, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 1),
	(140, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 2),
	(141, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 1),
	(142, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 2),
	(143, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 1),
	(144, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 2),
	(145, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 1),
	(146, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 2),
	(147, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 1),
	(148, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 2),
	(149, 'application', 'activitie', 'count', 0, '', 1),
	(150, 'application', 'activitie', 'count', 1, '', 2),
	(151, 'application', 'activitie', 'create', 0, '', 1),
	(152, 'application', 'activitie', 'create', 1, '', 2),
	(153, 'application', 'activitie', 'delete', 0, '', 1),
	(154, 'application', 'activitie', 'delete', 1, '', 2),
	(155, 'application', 'activitie', 'find', 0, '', 1),
	(156, 'application', 'activitie', 'find', 1, '', 2),
	(157, 'application', 'activitie', 'findone', 0, '', 1),
	(158, 'application', 'activitie', 'findone', 1, '', 2),
	(159, 'application', 'activitie', 'update', 0, '', 1),
	(160, 'application', 'activitie', 'update', 1, '', 2),
	(161, 'application', 'activitie', 'updateprices', 0, '', 1),
	(162, 'application', 'activitie', 'updateprices', 1, '', 2);
/*!40000 ALTER TABLE `users-permissions_permission` ENABLE KEYS */;

-- Dumping structure for table palmabeach.users-permissions_role
CREATE TABLE IF NOT EXISTS `users-permissions_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_role_type_unique` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table palmabeach.users-permissions_role: ~2 rows (approximately)
/*!40000 ALTER TABLE `users-permissions_role` DISABLE KEYS */;
INSERT INTO `users-permissions_role` (`id`, `name`, `description`, `type`) VALUES
	(1, 'Authenticated', 'Default role given to authenticated user.', 'authenticated'),
	(2, 'Public', 'Default role given to unauthenticated user.', 'public');
/*!40000 ALTER TABLE `users-permissions_role` ENABLE KEYS */;

-- Dumping structure for table palmabeach.users-permissions_user
CREATE TABLE IF NOT EXISTS `users-permissions_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_user_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table palmabeach.users-permissions_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `users-permissions_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `users-permissions_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
