-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: aay7hb5vhqfekx.c4zp6lwlckut.us-east-1.rds.amazonaws.com:3306:3306
-- Generation Time: Mar 14, 2021 at 10:23 AM
-- Server version: 8.0.17
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ebdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api`
--

CREATE TABLE `api` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `art_urls`
--

CREATE TABLE `art_urls` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_history`
--

CREATE TABLE `audit_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `module` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int(10) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `user_id` int(10) UNSIGNED NOT NULL,
  `icon` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `currency_name` varchar(64) DEFAULT NULL,
  `currency_code` char(3) DEFAULT NULL,
  `currency_symbol` varchar(20) NOT NULL,
  `currency_name_ar` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `use_for` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `use_for_id` int(10) UNSIGNED NOT NULL,
  `field_item_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widget_settings`
--

CREATE TABLE `dashboard_widget_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `widget_id` int(10) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `error_shipment`
--

CREATE TABLE `error_shipment` (
  `id` int(11) NOT NULL,
  `awb` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `field_groups`
--

CREATE TABLE `field_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `field_items`
--

CREATE TABLE `field_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `field_group_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_meta`
--

CREATE TABLE `gallery_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `import_file_data_dhl`
--

CREATE TABLE `import_file_data_dhl` (
  `id` int(10) UNSIGNED NOT NULL,
  `shipment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `piece_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `piece_weight` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `piece_weightuom` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `piece_lenght` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `piece_width` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `piece_height` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `declared_value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dhlfacilityid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destination_service_area` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipper_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipper_company` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipper_phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipper_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipper_address1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipper_address2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipper_address3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipper_city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipper_post` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipper_state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipper_district` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_company` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_address1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_address2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_address3` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_postcd` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_district` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `invoices_summary`
-- (See below for the actual view)
--
CREATE TABLE `invoices_summary` (
`invoice_id` int(11)
,`customer_id` int(11)
,`Shipment_count` bigint(21)
,`Total_cod_amount` double
,`Total_cod_charge` double
,`Total_return_charge` double
,`Total_service_charge` double
,`Total_amount` double
,`Total_charge` double
,`Total_vat` double
,`Total_transfer` double
);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ksa_post_locations`
--

CREATE TABLE `ksa_post_locations` (
  `id` int(11) NOT NULL,
  `city_title` varchar(15) DEFAULT NULL,
  `city_code` varchar(4) DEFAULT NULL,
  `city_source_id` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ksa_post_status`
--

CREATE TABLE `ksa_post_status` (
  `id` int(11) NOT NULL,
  `EventCategoryName` varchar(50) DEFAULT NULL,
  `EventNameEN` varchar(50) DEFAULT NULL,
  `postage_status_name` varchar(50) DEFAULT NULL,
  `postage_status_id` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ksa_post_tokens`
--

CREATE TABLE `ksa_post_tokens` (
  `id` int(1) NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `lang_id` int(10) UNSIGNED NOT NULL,
  `lang_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `lang_order` int(11) NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language_meta`
--

CREATE TABLE `language_meta` (
  `lang_meta_id` int(10) UNSIGNED NOT NULL,
  `lang_meta_content_id` int(10) UNSIGNED NOT NULL,
  `lang_meta_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `lang_meta_reference` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_meta_origin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates`
--

CREATE TABLE `mail_templates` (
  `id` int(11) NOT NULL,
  `title_def` varchar(200) NOT NULL,
  `description_def` text NOT NULL,
  `subject_def` varchar(200) NOT NULL,
  `content_def` text NOT NULL,
  `send_from` varchar(200) NOT NULL,
  `send_to` int(11) NOT NULL COMMENT '"1" for staff , "2" for client and "3" for messanger',
  `status` int(11) NOT NULL,
  `template_type` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates_translations`
--

CREATE TABLE `mail_templates_translations` (
  `id` int(11) NOT NULL,
  `mail_template_id` int(11) NOT NULL,
  `locale` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `maps`
--

CREATE TABLE `maps` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mime_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_settings`
--

CREATE TABLE `media_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `parent_customer_id` int(11) DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bnk_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bnk_account_num` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_manager` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_notify` tinyint(4) DEFAULT '0' COMMENT '0:OFF , 1:On',
  `cr_pdf` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_pdf` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contract_pdf` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contract_date` datetime DEFAULT NULL,
  `client_type` tinyint(4) DEFAULT '1' COMMENT '1:C2C , 2:B2C',
  `uniqueid` int(11) NOT NULL,
  `multi_vendor_flag` tinyint(1) DEFAULT '0',
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `messenger` tinyint(4) DEFAULT '0' COMMENT '0:member , 1:messenger',
  `ajoul_alias` int(11) DEFAULT NULL,
  `messenger_route_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `iqama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iqama_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `license` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `vehicle_type` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `price_list_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `vat_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable` int(11) DEFAULT '0',
  `supplier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_password_resets`
--

CREATE TABLE `member_password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_nodes`
--

CREATE TABLE `menu_nodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `related_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_invoices_pay`
--

CREATE TABLE `messenger_invoices_pay` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `messenger_id` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `amount_should_pay` int(11) NOT NULL,
  `amount_paid` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meta_boxes`
--

CREATE TABLE `meta_boxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `icon` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `order` tinyint(4) DEFAULT '0',
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `format_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_category`
--

CREATE TABLE `post_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_logs`
--

CREATE TABLE `request_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_quota`
--

CREATE TABLE `request_quota` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `mobile` varchar(250) NOT NULL,
  `business_name` varchar(250) NOT NULL,
  `business_website` varchar(250) NOT NULL,
  `daily_shipments` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `shipments_status`
-- (See below for the actual view)
--
CREATE TABLE `shipments_status` (
`counter` bigint(21)
,`status` int(11)
,`title` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `shipments_status_updated_today`
-- (See below for the actual view)
--
CREATE TABLE `shipments_status_updated_today` (
`counter` bigint(21)
,`updated_at` timestamp
,`title` varchar(200)
,`status` int(11)
,`location_destination` varchar(100)



);

-- --------------------------------------------------------

--
-- Table structure for table `sh_bin_location`
--

CREATE TABLE `sh_bin_location` (
  `id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sh_branches`
--

CREATE TABLE `sh_branches` (
  `id` int(11) NOT NULL,
  `title_def` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `country_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `branch_person` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_branch_translations`
--

CREATE TABLE `sh_branch_translations` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sh_cities`
--

CREATE TABLE `sh_cities` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `title_def` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sh_city_translations`
--

CREATE TABLE `sh_city_translations` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sh_cod_shipments`
--

CREATE TABLE `sh_cod_shipments` (
  `id` int(11) NOT NULL,
  `drs_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '"1"=>confirm, "2"=>confirmed, "0" => not_available',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_countries`
--

CREATE TABLE `sh_countries` (
  `id` int(11) NOT NULL,
  `title_def` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sh_country_translations`
--

CREATE TABLE `sh_country_translations` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sh_coupons`
--

CREATE TABLE `sh_coupons` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) NOT NULL,
  `start` date NOT NULL,
  `end` date DEFAULT NULL,
  `max_use` varchar(100) NOT NULL,
  `type` int(11) NOT NULL COMMENT '''one'' for fixed and ''two'' for percentage',
  `amount` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `num_of_use` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_credit_debit_notes`
--

CREATE TABLE `sh_credit_debit_notes` (
  `id` int(11) NOT NULL,
  `note_type` tinyint(1) NOT NULL COMMENT '1:credit , 2:debit',
  `customer_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `note_file` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_csa_reasons`
--

CREATE TABLE `sh_csa_reasons` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_csa_shipments`
--

CREATE TABLE `sh_csa_shipments` (
  `id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `shipment_awb` varchar(50) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `schedule_status` tinyint(1) DEFAULT NULL COMMENT '1:not scheduled  2: scheduled',
  `schedule_type` tinyint(1) DEFAULT NULL COMMENT '1:CSA  2: BULK 3:BLIND',
  `schedule_time` varchar(50) DEFAULT NULL,
  `schedule_date` date DEFAULT NULL,
  `schedule_lng` varchar(50) DEFAULT NULL,
  `schedule_lat` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `reason_id` int(11) DEFAULT NULL,
  `comment` text,
  `messenger_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_customer_vendors`
--

CREATE TABLE `sh_customer_vendors` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `vendor_count` int(11) NOT NULL,
  `names` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_driver_invoices`
--

CREATE TABLE `sh_driver_invoices` (
  `id` int(11) NOT NULL,
  `invoice_number` int(11) NOT NULL DEFAULT '0',
  `messenger_id` int(11) NOT NULL,
  `shipment_count` int(11) DEFAULT '0',
  `year` year(4) NOT NULL,
  `month` tinyint(1) NOT NULL,
  `total_amount` double DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_driver_shipments`
--

CREATE TABLE `sh_driver_shipments` (
  `id` int(11) NOT NULL,
  `awb` varchar(100) NOT NULL,
  `driver_id` int(11) NOT NULL DEFAULT '0',
  `weight` double DEFAULT '0',
  `service_price` double DEFAULT '0',
  `driver_invoice_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_driver_signature`
--

CREATE TABLE `sh_driver_signature` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sh_drs`
--

CREATE TABLE `sh_drs` (
  `id` int(11) NOT NULL,
  `barcode` varchar(20) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `shipment_count` int(11) NOT NULL,
  `drs_city` int(11) DEFAULT NULL,
  `posmachine_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '"one"=>runing , "2"=>derlivered',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_drs_cod_logs`
--

CREATE TABLE `sh_drs_cod_logs` (
  `id` int(11) NOT NULL,
  `drs_id` int(11) NOT NULL,
  `log_type` tinyint(1) DEFAULT NULL COMMENT '0:drs 1:cod',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '"1"=>confirm, "2"=>confirmed, "0" => not_available',
  `user_id` int(11) DEFAULT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_emails_customer`
--

CREATE TABLE `sh_emails_customer` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `email_id` int(11) DEFAULT NULL,
  `email_title` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_imports_dhl_files`
--

CREATE TABLE `sh_imports_dhl_files` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_imports_drs`
--

CREATE TABLE `sh_imports_drs` (
  `id` int(11) NOT NULL,
  `drs_id` text,
  `awb` text,
  `shipment_type` text,
  `address` text,
  `status` text,
  `driver_name` text,
  `drs_date` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_imports_messenger`
--

CREATE TABLE `sh_imports_messenger` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `branch` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `iqama` varchar(100) DEFAULT NULL,
  `iqama_id` varchar(100) DEFAULT NULL,
  `type_vehicle` varchar(100) DEFAULT NULL,
  `supplier` varchar(100) DEFAULT NULL,
  `join_date` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `vehicle_number` varchar(100) DEFAULT NULL,
  `flag` tinyint(4) DEFAULT '0',
  `ajoul_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_imports_return_shipment`
--

CREATE TABLE `sh_imports_return_shipment` (
  `id` int(11) NOT NULL,
  `awb` varchar(30) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `pieces` int(11) DEFAULT NULL,
  `flag` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_imports_route`
--

CREATE TABLE `sh_imports_route` (
  `id` int(11) NOT NULL,
  `route_code` varchar(100) DEFAULT NULL,
  `route_city` varchar(100) DEFAULT NULL,
  `route_name` varchar(100) DEFAULT NULL,
  `flag` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_imports_shipment`
--

CREATE TABLE `sh_imports_shipment` (
  `id` int(11) NOT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `weight` varchar(11) DEFAULT NULL,
  `booking_mode` varchar(100) DEFAULT NULL,
  `product_type` varchar(11) DEFAULT NULL,
  `destination` varchar(200) DEFAULT NULL,
  `pieces` varchar(11) DEFAULT NULL,
  `consingor_name` varchar(100) DEFAULT NULL,
  `consinger_address` varchar(100) DEFAULT NULL,
  `consinger_mobile` varchar(100) DEFAULT NULL,
  `consinger_email` varchar(100) DEFAULT NULL,
  `parcel_description` varchar(200) DEFAULT NULL,
  `cod_amount` varchar(11) DEFAULT NULL,
  `service_id` varchar(2) DEFAULT NULL,
  `shipment_value` varchar(11) DEFAULT NULL,
  `uid_account` varchar(11) DEFAULT NULL,
  `flag` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_import_rates_shipment`
--

CREATE TABLE `sh_import_rates_shipment` (
  `id` int(11) NOT NULL,
  `awb_no` varchar(100) DEFAULT NULL,
  `service_charge` double DEFAULT NULL,
  `cod_fees` double DEFAULT NULL,
  `return_fees` double DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_inventories`
--

CREATE TABLE `sh_inventories` (
  `id` int(11) NOT NULL,
  `title_def` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `branch_id` int(11) NOT NULL,
  `location` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sh_inventory_translations`
--

CREATE TABLE `sh_inventory_translations` (
  `id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sh_invoices`
--

CREATE TABLE `sh_invoices` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:Invisible , 1:Visible',
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  `invoice_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:unpaid , 1:paid',
  `customer_id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT '0',
  `year` year(4) NOT NULL,
  `month` tinyint(1) NOT NULL,
  `shipments_count` int(11) DEFAULT '0',
  `total_amount` double DEFAULT '0',
  `total_amount_paid` tinyint(4) DEFAULT '0',
  `cod_amount` double DEFAULT '0',
  `amount` double DEFAULT '0',
  `total_transfer` double DEFAULT NULL,
  `customer_amount` double DEFAULT '0',
  `customer_amount_paid` tinyint(4) DEFAULT '0',
  `service_vat` double DEFAULT '0',
  `total_service_charge` double DEFAULT '0',
  `total_cod_charge` double DEFAULT '0',
  `total_return_charge` double DEFAULT '0',
  `credit_note` double DEFAULT NULL,
  `debit_note` double DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_manifests`
--

CREATE TABLE `sh_manifests` (
  `id` int(11) NOT NULL,
  `barcodeid` varchar(10) DEFAULT NULL,
  `origin` varchar(10) DEFAULT NULL,
  `destination` varchar(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0:Receive_manifest 1:Received_at_location',
  `shipment_count` int(11) DEFAULT NULL,
  `messenger_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_manifest_shipments`
--

CREATE TABLE `sh_manifest_shipments` (
  `id` int(11) NOT NULL,
  `manifest_id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `awb` varchar(100) DEFAULT NULL,
  `product_type` int(11) NOT NULL,
  `origin` varchar(10) DEFAULT NULL,
  `destination` varchar(10) DEFAULT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_pcategories`
--

CREATE TABLE `sh_pcategories` (
  `id` int(11) NOT NULL,
  `title_def` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_pcategory_translations`
--

CREATE TABLE `sh_pcategory_translations` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_picked_shipments`
--

CREATE TABLE `sh_picked_shipments` (
  `id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `driver_name` varchar(255) NOT NULL,
  `signature_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sh_pickup`
--

CREATE TABLE `sh_pickup` (
  `id` int(11) NOT NULL,
  `barcode` varchar(20) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `shipment_count` int(11) NOT NULL,
  `status` int(11) DEFAULT '1' COMMENT '("one"=>runing = pending)  , ("2"=>derlivered = done)',
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT ' 1->"confirm", "0" -> "not confirm"" ',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_pos_machines`
--

CREATE TABLE `sh_pos_machines` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `pos_name` varchar(255) NOT NULL,
  `pos_code` varchar(255) NOT NULL,
  `status` int(11) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sh_products`
--

CREATE TABLE `sh_products` (
  `id` int(11) NOT NULL,
  `customer_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `title_def` varchar(200) NOT NULL,
  `flag_info` int(11) DEFAULT NULL,
  `max_weight` float DEFAULT NULL,
  `desc_def` text,
  `componesition_def` varchar(500) DEFAULT NULL,
  `flag_dimension` int(11) DEFAULT NULL,
  `max_height` float DEFAULT NULL,
  `max_width` float DEFAULT NULL,
  `max_length` float DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `drop_of` int(11) DEFAULT NULL,
  `coll_service` int(11) DEFAULT NULL,
  `pickup_charge` varchar(200) DEFAULT NULL,
  `from_time` date DEFAULT NULL,
  `to_time` date DEFAULT NULL,
  `weight_type` tinyint(1) DEFAULT '2' COMMENT '1:kilogram 2:volumetric'
) ;

-- --------------------------------------------------------

--
-- Table structure for table `sh_product_customers`
--

CREATE TABLE `sh_product_customers` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_product_translations`
--

CREATE TABLE `sh_product_translations` (
  `id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `componesition` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_range_weight`
--

CREATE TABLE `sh_range_weight` (
  `id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `maxweight` int(11) NOT NULL,
  `minweight` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_receivers`
--

CREATE TABLE `sh_receivers` (
  `id` int(11) NOT NULL,
  `receiver_name` varchar(150) NOT NULL,
  `receiver_country_id` int(11) DEFAULT NULL,
  `receiver_city_id` int(11) DEFAULT NULL,
  `receiver_zip` int(11) DEFAULT NULL,
  `receiver_address` varchar(255) DEFAULT NULL,
  `area` varchar(200) DEFAULT NULL,
  `receiver_phone` varchar(25) DEFAULT NULL,
  `receiver_phone2` varchar(25) DEFAULT NULL,
  `receiver_email` varchar(191) DEFAULT NULL,
  `receiver_photo` varchar(100) DEFAULT NULL,
  `signature` varchar(250) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `import_id` int(11) DEFAULT '0',
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_register_transfers`
--

CREATE TABLE `sh_register_transfers` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_routes`
--

CREATE TABLE `sh_routes` (
  `id` int(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title_def` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sh_route_translations`
--

CREATE TABLE `sh_route_translations` (
  `id` int(11) NOT NULL,
  `routes_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_senders`
--

CREATE TABLE `sh_senders` (
  `id` int(11) NOT NULL,
  `sender_name` varchar(150) NOT NULL,
  `sender_country_id` int(11) DEFAULT NULL,
  `sender_city_id` int(11) DEFAULT NULL,
  `sender_zip` int(11) DEFAULT NULL,
  `sender_address` varchar(255) DEFAULT NULL,
  `sender_phone` varchar(25) DEFAULT NULL,
  `sender_email` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_services`
--

CREATE TABLE `sh_services` (
  `id` int(11) NOT NULL,
  `title_def` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ajoul_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sh_service_translations`
--

CREATE TABLE `sh_service_translations` (
  `id` int(11) NOT NULL,
  `services_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_shipments`
--

CREATE TABLE `sh_shipments` (
  `id` int(11) NOT NULL,
  `reference` varchar(100) DEFAULT NULL COMMENT 'sent by customer',
  `product_type` int(11) NOT NULL,
  `payment_mode` varchar(10) NOT NULL,
  `total_cod_amount` double DEFAULT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `parcel_quantity` int(11) NOT NULL,
  `parcel_weight` double DEFAULT NULL,
  `service_id` int(11) NOT NULL,
  `describtion` text,
  `sku` varchar(50) DEFAULT NULL,
  `product_price` double DEFAULT NULL,
  `weight_total` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `volumetric_weight` double DEFAULT NULL,
  `service_charge` double DEFAULT NULL,
  `cod_charge` double DEFAULT NULL,
  `total_charge` double DEFAULT NULL,
  `return_charge` double DEFAULT NULL,
  `customer_cod_charge` double DEFAULT NULL,
  `customer_service_charge` double DEFAULT NULL,
  `customer_return_charge` double DEFAULT NULL,
  `pick_date` date DEFAULT NULL,
  `pickup_time` time DEFAULT NULL,
  `awb` varchar(100) DEFAULT NULL,
  `location_origin` varchar(100) DEFAULT NULL,
  `location_destination` varchar(100) DEFAULT NULL,
  `sender_account_id` int(11) DEFAULT NULL,
  `schedule` tinyint(4) DEFAULT '0',
  `schedule_date` date DEFAULT NULL,
  `pay_status` tinyint(4) DEFAULT '0',
  `status` int(11) DEFAULT NULL,
  `substatus_id` int(11) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `messenger_id` int(11) DEFAULT NULL,
  `comment` text,
  `binlocation_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT '0',
  `invoice_id` int(11) DEFAULT NULL,
  `delivery_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `service_paid` tinyint(1) DEFAULT '0',
  `cod_paid` tinyint(1) DEFAULT '0',
  `customer_delivery_date` date DEFAULT NULL,
  `customer_lng` varchar(50) DEFAULT NULL,
  `customer_lat` varchar(50) DEFAULT NULL,
  `customer_time` varchar(50) DEFAULT NULL,
  `receiver_cash_type` tinyint(1) DEFAULT NULL COMMENT '1:CASH 2:POS',
  `delivery_attempts` int(11) DEFAULT '0',
  `import_id` int(11) DEFAULT '0',
  `received_inbound_date` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `updated_user_type` varchar(15) DEFAULT NULL,
  `dhl_flag` tinyint(1) DEFAULT '0',
  `account_dhl` varchar(50) DEFAULT NULL,
  `piece_id` text,
  `import_customer` int(11) DEFAULT NULL,
  `post_flag` tinyint(1) DEFAULT '0',
  `barcode_id` text CHARACTER SET utf8 COLLATE utf8_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_shipments_branches_dummy`
--

CREATE TABLE `sh_shipments_branches_dummy` (
  `id` int(11) NOT NULL,
  `awb` varchar(100) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `product_type` int(11) DEFAULT NULL,
  `payment_mode` varchar(10) DEFAULT NULL,
  `total_cod_amount` double DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `parcel_quantity` int(11) DEFAULT NULL,
  `parcel_weight` double DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `describtion` text,
  `sku` varchar(50) DEFAULT NULL,
  `product_price` double DEFAULT NULL,
  `weight_total` double DEFAULT NULL,
  `service_charge` double DEFAULT NULL,
  `cod_charge` double DEFAULT NULL,
  `total_charge` double DEFAULT NULL,
  `return_charge` double DEFAULT NULL,
  `customer_cod_charge` double DEFAULT NULL,
  `customer_service_charge` double DEFAULT NULL,
  `customer_return_charge` double DEFAULT NULL,
  `pick_date` date DEFAULT NULL,
  `pickup_time` time DEFAULT NULL,
  `location_origin` varchar(100) DEFAULT NULL,
  `location_destination` varchar(100) DEFAULT NULL,
  `sender_account_id` int(11) DEFAULT NULL,
  `schedule` tinyint(4) DEFAULT '0',
  `schedule_date` date DEFAULT NULL,
  `pay_status` tinyint(4) DEFAULT '0' COMMENT '0 is pending',
  `status` int(11) DEFAULT '2',
  `substatus_id` int(11) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `file` varchar(250) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `messenger_id` int(11) DEFAULT NULL,
  `comment` text,
  `binlocation_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `delivery_at` timestamp NULL DEFAULT NULL COMMENT 'shipment delivered ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `service_paid` tinyint(1) DEFAULT '0',
  `cod_paid` tinyint(1) DEFAULT '0',
  `customer_delivery_date` date DEFAULT NULL,
  `customer_lng` varchar(50) DEFAULT NULL,
  `customer_lat` varchar(50) DEFAULT NULL,
  `customer_time` varchar(50) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_shipments_import`
--

CREATE TABLE `sh_shipments_import` (
  `id` int(11) NOT NULL,
  `reference` varchar(100) DEFAULT NULL COMMENT 'sent by customer',
  `product_type` int(11) NOT NULL,
  `payment_mode` varchar(10) NOT NULL,
  `total_cod_amount` double DEFAULT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `parcel_quantity` int(11) NOT NULL,
  `parcel_weight` double DEFAULT NULL,
  `service_id` int(11) NOT NULL,
  `describtion` text,
  `product_price` double DEFAULT NULL,
  `awb` varchar(100) DEFAULT NULL,
  `location_origin` varchar(100) DEFAULT NULL,
  `location_destination` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT '0',
  `piece_id` text,
  `push_flag` tinyint(4) DEFAULT '0',
  `error_message` text,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_shipment_drs`
--

CREATE TABLE `sh_shipment_drs` (
  `id` int(11) NOT NULL,
  `drs_id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `barcode` varchar(100) NOT NULL,
  `product_type` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `messenger_id` int(11) DEFAULT NULL,
  `total_cod_amount` double DEFAULT NULL,
  `receiver_cash_type` tinyint(1) DEFAULT NULL COMMENT '1:CASH 2:POS',
  `status` int(11) DEFAULT NULL,
  `substatus_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_shipment_logs`
--

CREATE TABLE `sh_shipment_logs` (
  `id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(50) DEFAULT NULL,
  `main_status_id` int(11) DEFAULT NULL,
  `sub_status_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `comment` text,
  `details` text,
  `new_location` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `messenger_id` int(11) DEFAULT NULL,
  `binlocation_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_shipment_pickup`
--

CREATE TABLE `sh_shipment_pickup` (
  `id` int(11) NOT NULL,
  `pickup_id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `barcode` varchar(100) NOT NULL,
  `product_type` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL COMMENT 'sender address',
  `messenger_id` int(11) DEFAULT NULL,
  `total_cod_amount` double DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `substatus_id` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_staff_departments`
--

CREATE TABLE `sh_staff_departments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_statuses`
--

CREATE TABLE `sh_statuses` (
  `id` int(11) NOT NULL,
  `title_def` varchar(200) NOT NULL,
  `ajoul_alias` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_status_translations`
--

CREATE TABLE `sh_status_translations` (
  `id` int(11) NOT NULL,
  `main_statuses_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_stop_synch`
--

CREATE TABLE `sh_stop_synch` (
  `id` int(11) NOT NULL,
  `awb` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_sub_statuses`
--

CREATE TABLE `sh_sub_statuses` (
  `id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `title_def` varchar(200) NOT NULL,
  `ajoul_sub_alias` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_sub_status_translations`
--

CREATE TABLE `sh_sub_status_translations` (
  `id` int(11) NOT NULL,
  `sub_statuses_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_suppliers`
--

CREATE TABLE `sh_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `second_mobile` varchar(255) DEFAULT NULL,
  `website` varchar(255) NOT NULL,
  `commercial_register` varchar(255) NOT NULL,
  `weight_type` tinyint(1) DEFAULT '2' COMMENT '1:kilogram 2:volumetric',
  `min_weight` int(11) DEFAULT NULL,
  `max_weight` int(11) DEFAULT NULL,
  `weight_price` int(11) DEFAULT NULL,
  `extra_weight` int(11) DEFAULT NULL,
  `extra_price` int(11) DEFAULT NULL,
  `bonus` int(11) DEFAULT NULL,
  `target_count` int(11) DEFAULT NULL,
  `target_bonus` double DEFAULT NULL,
  `default` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sh_support_category`
--

CREATE TABLE `sh_support_category` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_testimonials`
--

CREATE TABLE `sh_testimonials` (
  `id` int(11) NOT NULL,
  `name_def` varchar(100) NOT NULL,
  `job_title_def` varchar(100) NOT NULL,
  `content_def` text NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_testimonials_translations`
--

CREATE TABLE `sh_testimonials_translations` (
  `id` int(11) NOT NULL,
  `testimonials_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `job_title` varchar(50) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_ticket_system`
--

CREATE TABLE `sh_ticket_system` (
  `id` int(11) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `priority` varchar(100) NOT NULL,
  `departmen_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `is_read` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status_id` int(11) DEFAULT '6',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sh_ticket_system_comments`
--

CREATE TABLE `sh_ticket_system_comments` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sh_ticket_system_staff`
--

CREATE TABLE `sh_ticket_system_staff` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sh_ticket_system_status`
--

CREATE TABLE `sh_ticket_system_status` (
  `id` int(11) NOT NULL,
  `title_def` varchar(255) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sh_whatsapp_messages_queue`
--

CREATE TABLE `sh_whatsapp_messages_queue` (
  `id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(50) DEFAULT NULL,
  `main_status_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_write_dhl_files`
--

CREATE TABLE `sh_write_dhl_files` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_zones`
--

CREATE TABLE `sh_zones` (
  `id` int(11) NOT NULL,
  `title_def` varchar(200) NOT NULL,
  `code` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT 'one for world and two for city',
  `def_zone` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_zone_area`
--

CREATE TABLE `sh_zone_area` (
  `id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `model_type` varchar(20) NOT NULL,
  `model_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_zone_price_lists`
--

CREATE TABLE `sh_zone_price_lists` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `zone_rate_id` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_zone_rates`
--

CREATE TABLE `sh_zone_rates` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `from_zone_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_list_flag` tinyint(1) DEFAULT NULL,
  `zone_used_flag` tinyint(1) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_zone_rate_fees`
--

CREATE TABLE `sh_zone_rate_fees` (
  `id` int(11) NOT NULL,
  `zone_rate_id` int(11) NOT NULL,
  `to_zone_id` int(11) NOT NULL,
  `cod_fee` double DEFAULT NULL,
  `return_fee` double DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_zone_rate_prices`
--

CREATE TABLE `sh_zone_rate_prices` (
  `id` int(11) NOT NULL,
  `zone_rate_id` int(11) NOT NULL,
  `to_zone_id` int(11) NOT NULL,
  `range_weight_id` int(11) NOT NULL,
  `price` double DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sh_zone_translations`
--

CREATE TABLE `sh_zone_translations` (
  `id` int(11) NOT NULL,
  `zones_id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `slugs`
--

CREATE TABLE `slugs` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int(11) NOT NULL,
  `reference` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticketSystem`
--

CREATE TABLE `ticketSystem` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_position` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `website` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_plus` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `completed_profile` tinyint(1) NOT NULL DEFAULT '0',
  `branch_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `ajoul_userid` int(11) DEFAULT NULL,
  `app_login` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp`
--

CREATE TABLE `whatsapp` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_messages_receivers`
--

CREATE TABLE `whatsapp_messages_receivers` (
  `id` int(11) NOT NULL,
  `awb` varchar(100) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `from_receiver` int(11) NOT NULL DEFAULT '0',
  `delivery_dates` text,
  `delivery_times` text,
  `address_confirmed` int(11) DEFAULT '0',
  `dates_sent` int(11) DEFAULT '0',
  `times_sent` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(10) UNSIGNED NOT NULL,
  `widget_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `yearly_shipments`
-- (See below for the actual view)
--
CREATE TABLE `yearly_shipments` (
`created_at` timestamp
,`shipments_total` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `invoices_summary`
--
DROP TABLE IF EXISTS `invoices_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`postagdb`@`%` SQL SECURITY DEFINER VIEW `invoices_summary`  AS  select `sh_shipments`.`invoice_id` AS `invoice_id`,`sh_shipments`.`customer_id` AS `customer_id`,count(`sh_shipments`.`id`) AS `Shipment_count`,sum(if(((`sh_shipments`.`status` = 7) and (`sh_shipments`.`payment_mode` = 'COD')),`sh_shipments`.`total_cod_amount`,0)) AS `Total_cod_amount`,sum(if(((`sh_shipments`.`status` = 7) and (`sh_shipments`.`payment_mode` = 'COD')),`sh_shipments`.`cod_charge`,0)) AS `Total_cod_charge`,sum(if((`sh_shipments`.`status` = 10),`sh_shipments`.`return_charge`,0)) AS `Total_return_charge`,sum(if((`sh_shipments`.`status` = 7),`sh_shipments`.`service_charge`,0)) AS `Total_service_charge`,((sum(if(((`sh_shipments`.`status` = 7) and (`sh_shipments`.`payment_mode` = 'COD')),`sh_shipments`.`cod_charge`,0)) + sum(if((`sh_shipments`.`status` = 10),`sh_shipments`.`return_charge`,0))) + sum(if((`sh_shipments`.`status` = 7),`sh_shipments`.`service_charge`,0))) AS `Total_amount`,sum(`sh_shipments`.`total_charge`) AS `Total_charge`,(((sum(if(((`sh_shipments`.`status` = 7) and (`sh_shipments`.`payment_mode` = 'COD')),`sh_shipments`.`cod_charge`,0)) + sum(if((`sh_shipments`.`status` = 10),`sh_shipments`.`return_charge`,0))) + sum(if((`sh_shipments`.`status` = 7),`sh_shipments`.`service_charge`,0))) * 0.05) AS `Total_vat`,(sum(if(((`sh_shipments`.`status` = 7) and (`sh_shipments`.`payment_mode` = 'COD')),`sh_shipments`.`total_cod_amount`,0)) - (((sum(if(((`sh_shipments`.`status` = 7) and (`sh_shipments`.`payment_mode` = 'COD')),`sh_shipments`.`cod_charge`,0)) + sum(if((`sh_shipments`.`status` = 10),`sh_shipments`.`return_charge`,0))) + sum(if((`sh_shipments`.`status` = 7),`sh_shipments`.`service_charge`,0))) * 1.05)) AS `Total_transfer` from `sh_shipments` where (`sh_shipments`.`invoice_id` is not null) group by `sh_shipments`.`invoice_id` ;

-- --------------------------------------------------------

--
-- Structure for view `shipments_status`
--
DROP TABLE IF EXISTS `shipments_status`;

CREATE ALGORITHM=UNDEFINED DEFINER=`postagdb`@`%` SQL SECURITY DEFINER VIEW `shipments_status`  AS  select count(`sh_shipments`.`id`) AS `counter`,`sh_shipments`.`status` AS `status`,(select `sh_statuses`.`title_def` from `sh_statuses` where (`sh_shipments`.`status` = `sh_statuses`.`id`)) AS `title` from `sh_shipments` group by `sh_shipments`.`status` ;

-- --------------------------------------------------------

--
-- Structure for view `shipments_status_updated_today`
--
DROP TABLE IF EXISTS `shipments_status_updated_today`;

CREATE ALGORITHM=UNDEFINED DEFINER=`postagdb`@`%` SQL SECURITY DEFINER VIEW `shipments_status_updated_today`  AS  select count(`sh_shipments`.`id`) AS `counter`,`sh_shipments`.`updated_at` AS `updated_at`,(select `sh_statuses`.`title_def` from `sh_statuses` where (`sh_shipments`.`status` = `sh_statuses`.`id`)) AS `title`,`sh_shipments`.`status` AS `status`,`sh_shipments`.`location_destination` AS `location_destination` from `sh_shipments` where (cast(`sh_shipments`.`updated_at` as date) = curdate()) group by `sh_shipments`.`status`,`sh_shipments`.`location_destination` ;

-- --------------------------------------------------------

--
-- Structure for view `yearly_shipments`
--
DROP TABLE IF EXISTS `yearly_shipments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`postagdb`@`%` SQL SECURITY DEFINER VIEW `yearly_shipments`  AS  select `sh_shipments`.`created_at` AS `created_at`,count(`sh_shipments`.`id`) AS `shipments_total` from `sh_shipments` where (year(`sh_shipments`.`created_at`) = year(curdate())) group by month(`sh_shipments`.`created_at`) order by `sh_shipments`.`created_at` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `art_urls`
--
ALTER TABLE `art_urls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `art_urls_code_unique` (`code`),
  ADD KEY `art_urls_url_index` (`url`),
  ADD KEY `art_urls_reference_index` (`reference`);

--
-- Indexes for table `audit_history`
--
ALTER TABLE `audit_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_history_user_id_index` (`user_id`),
  ADD KEY `audit_history_module_index` (`module`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_index` (`parent_id`),
  ADD KEY `categories_user_id_index` (`user_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_currency_name` (`currency_name`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_fields_field_item_id_foreign` (`field_item_id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  ADD KEY `dashboard_widget_settings_widget_id_index` (`widget_id`);

--
-- Indexes for table `error_shipment`
--
ALTER TABLE `error_shipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `field_groups`
--
ALTER TABLE `field_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_groups_created_by_foreign` (`created_by`),
  ADD KEY `field_groups_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `field_items`
--
ALTER TABLE `field_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_items_field_group_id_foreign` (`field_group_id`),
  ADD KEY `field_items_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_user_id_index` (`user_id`);

--
-- Indexes for table `gallery_meta`
--
ALTER TABLE `gallery_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_meta_content_id_index` (`content_id`);

--
-- Indexes for table `import_file_data_dhl`
--
ALTER TABLE `import_file_data_dhl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `import_file_data_dhl_shipment_id_index` (`shipment_id`),
  ADD KEY `import_file_data_dhl_piece_id_index` (`piece_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `ksa_post_locations`
--
ALTER TABLE `ksa_post_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ksa_post_status`
--
ALTER TABLE `ksa_post_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ksa_post_tokens`
--
ALTER TABLE `ksa_post_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`lang_id`);

--
-- Indexes for table `language_meta`
--
ALTER TABLE `language_meta`
  ADD PRIMARY KEY (`lang_meta_id`),
  ADD KEY `language_meta_lang_meta_content_id_index` (`lang_meta_content_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_templates_translations`
--
ALTER TABLE `mail_templates_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_user_id_index` (`user_id`);

--
-- Indexes for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_folders_user_id_index` (`user_id`);

--
-- Indexes for table `media_settings`
--
ALTER TABLE `media_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `members_email_unique` (`email`),
  ADD UNIQUE KEY `uniqueid` (`uniqueid`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ajoul_alias` (`ajoul_alias`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `member_password_resets`
--
ALTER TABLE `member_password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_password_resets_email_index` (`email`),
  ADD KEY `member_password_resets_token_index` (`token`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_nodes_menu_id_index` (`menu_id`),
  ADD KEY `menu_nodes_parent_id_index` (`parent_id`),
  ADD KEY `menu_nodes_related_id_index` (`related_id`);

--
-- Indexes for table `messenger_invoices_pay`
--
ALTER TABLE `messenger_invoices_pay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_boxes_content_id_index` (`content_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_user_id_index` (`user_id`),
  ADD KEY `notes_reference_id_index` (`reference_id`),
  ADD KEY `notes_created_by_index` (`created_by`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_parent_id_index` (`parent_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_category_category_id_index` (`category_id`),
  ADD KEY `post_category_post_id_index` (`post_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_tag_tag_id_index` (`tag_id`),
  ADD KEY `post_tag_post_id_index` (`post_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_logs`
--
ALTER TABLE `request_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_quota`
--
ALTER TABLE `request_quota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_type_index` (`revisionable_type`),
  ADD KEY `revisions_revisionable_id_index` (`revisionable_id`),
  ADD KEY `revisions_user_id_index` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_created_by_index` (`created_by`),
  ADD KEY `roles_updated_by_index` (`updated_by`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_users_user_id_index` (`user_id`),
  ADD KEY `role_users_role_id_index` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_key_index` (`key`);

--
-- Indexes for table `sh_bin_location`
--
ALTER TABLE `sh_bin_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sh_country_id` (`inventory_id`);

--
-- Indexes for table `sh_branches`
--
ALTER TABLE `sh_branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `sh_branch_translations`
--
ALTER TABLE `sh_branch_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sh_branch_id` (`branch_id`) USING BTREE;

--
-- Indexes for table `sh_cities`
--
ALTER TABLE `sh_cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`) USING BTREE,
  ADD KEY `title_def` (`title_def`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `sh_city_translations`
--
ALTER TABLE `sh_city_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sh_city_id` (`city_id`);

--
-- Indexes for table `sh_cod_shipments`
--
ALTER TABLE `sh_cod_shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drs_id` (`drs_id`);

--
-- Indexes for table `sh_countries`
--
ALTER TABLE `sh_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_country_translations`
--
ALTER TABLE `sh_country_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sh_country_id` (`country_id`) USING BTREE;

--
-- Indexes for table `sh_coupons`
--
ALTER TABLE `sh_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_credit_debit_notes`
--
ALTER TABLE `sh_credit_debit_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_csa_reasons`
--
ALTER TABLE `sh_csa_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_csa_shipments`
--
ALTER TABLE `sh_csa_shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipment_id` (`shipment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `sh_customer_vendors`
--
ALTER TABLE `sh_customer_vendors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `sh_driver_invoices`
--
ALTER TABLE `sh_driver_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_driver_shipments`
--
ALTER TABLE `sh_driver_shipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_driver_signature`
--
ALTER TABLE `sh_driver_signature`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_drs`
--
ALTER TABLE `sh_drs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drs_city` (`drs_city`);

--
-- Indexes for table `sh_drs_cod_logs`
--
ALTER TABLE `sh_drs_cod_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drs_id` (`drs_id`);

--
-- Indexes for table `sh_emails_customer`
--
ALTER TABLE `sh_emails_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_imports_dhl_files`
--
ALTER TABLE `sh_imports_dhl_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_imports_drs`
--
ALTER TABLE `sh_imports_drs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_imports_messenger`
--
ALTER TABLE `sh_imports_messenger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_imports_return_shipment`
--
ALTER TABLE `sh_imports_return_shipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_imports_route`
--
ALTER TABLE `sh_imports_route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_imports_shipment`
--
ALTER TABLE `sh_imports_shipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_import_rates_shipment`
--
ALTER TABLE `sh_import_rates_shipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_inventories`
--
ALTER TABLE `sh_inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_inventory_translations`
--
ALTER TABLE `sh_inventory_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sh_country_id` (`inventory_id`);

--
-- Indexes for table `sh_invoices`
--
ALTER TABLE `sh_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `sh_manifests`
--
ALTER TABLE `sh_manifests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barcodeid` (`barcodeid`),
  ADD KEY `messenger_id` (`messenger_id`);

--
-- Indexes for table `sh_manifest_shipments`
--
ALTER TABLE `sh_manifest_shipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_pcategories`
--
ALTER TABLE `sh_pcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_pcategory_translations`
--
ALTER TABLE `sh_pcategory_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sh_pcategory_translations_ibfk_1` (`categories_id`);

--
-- Indexes for table `sh_picked_shipments`
--
ALTER TABLE `sh_picked_shipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_pickup`
--
ALTER TABLE `sh_pickup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_pos_machines`
--
ALTER TABLE `sh_pos_machines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_products`
--
ALTER TABLE `sh_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title_def` (`title_def`);

--
-- Indexes for table `sh_product_customers`
--
ALTER TABLE `sh_product_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `sh_product_translations`
--
ALTER TABLE `sh_product_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id` (`products_id`);

--
-- Indexes for table `sh_range_weight`
--
ALTER TABLE `sh_range_weight`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id` (`products_id`);

--
-- Indexes for table `sh_receivers`
--
ALTER TABLE `sh_receivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receiver_name` (`receiver_name`),
  ADD KEY `import_id` (`import_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `receiver_phone` (`receiver_phone`),
  ADD KEY `receiver_phone2` (`receiver_phone2`);

--
-- Indexes for table `sh_register_transfers`
--
ALTER TABLE `sh_register_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_routes`
--
ALTER TABLE `sh_routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `sh_route_translations`
--
ALTER TABLE `sh_route_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sh_route_translations_ibfk_1` (`routes_id`);

--
-- Indexes for table `sh_senders`
--
ALTER TABLE `sh_senders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_name` (`sender_name`);

--
-- Indexes for table `sh_services`
--
ALTER TABLE `sh_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ajoul_id` (`ajoul_id`),
  ADD KEY `title_def` (`title_def`);

--
-- Indexes for table `sh_service_translations`
--
ALTER TABLE `sh_service_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sh_service_translations_ibfk_1` (`services_id`);

--
-- Indexes for table `sh_shipments`
--
ALTER TABLE `sh_shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awb` (`awb`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `status` (`status`),
  ADD KEY `substatus_id` (`substatus_id`),
  ADD KEY `location_destination` (`location_destination`),
  ADD KEY `location_origin` (`location_origin`),
  ADD KEY `binlocation_id` (`binlocation_id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `import_id` (`import_id`);

--
-- Indexes for table `sh_shipments_branches_dummy`
--
ALTER TABLE `sh_shipments_branches_dummy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awb` (`awb`);

--
-- Indexes for table `sh_shipments_import`
--
ALTER TABLE `sh_shipments_import`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_shipment_drs`
--
ALTER TABLE `sh_shipment_drs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipment_id` (`shipment_id`),
  ADD KEY `drs_id` (`drs_id`);

--
-- Indexes for table `sh_shipment_logs`
--
ALTER TABLE `sh_shipment_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipment_id` (`shipment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sh_shipment_pickup`
--
ALTER TABLE `sh_shipment_pickup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_staff_departments`
--
ALTER TABLE `sh_staff_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_statuses`
--
ALTER TABLE `sh_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_status_translations`
--
ALTER TABLE `sh_status_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sh_status_translations_ibfk_1` (`main_statuses_id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `sh_stop_synch`
--
ALTER TABLE `sh_stop_synch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awb` (`awb`);

--
-- Indexes for table `sh_sub_statuses`
--
ALTER TABLE `sh_sub_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `ajoul_sub_alias` (`ajoul_sub_alias`);

--
-- Indexes for table `sh_sub_status_translations`
--
ALTER TABLE `sh_sub_status_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sh_sub_statuses_translations_ibfk_1` (`sub_statuses_id`);

--
-- Indexes for table `sh_suppliers`
--
ALTER TABLE `sh_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_support_category`
--
ALTER TABLE `sh_support_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_testimonials`
--
ALTER TABLE `sh_testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_testimonials_translations`
--
ALTER TABLE `sh_testimonials_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_ticket_system`
--
ALTER TABLE `sh_ticket_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_ticket_system_comments`
--
ALTER TABLE `sh_ticket_system_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_ticket_system_staff`
--
ALTER TABLE `sh_ticket_system_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_ticket_system_status`
--
ALTER TABLE `sh_ticket_system_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_whatsapp_messages_queue`
--
ALTER TABLE `sh_whatsapp_messages_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipment_id` (`shipment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sh_write_dhl_files`
--
ALTER TABLE `sh_write_dhl_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_zones`
--
ALTER TABLE `sh_zones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sh_zone_area`
--
ALTER TABLE `sh_zone_area`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone_id` (`zone_id`),
  ADD KEY `model_type` (`model_type`),
  ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `sh_zone_price_lists`
--
ALTER TABLE `sh_zone_price_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone_rate_id` (`zone_rate_id`);

--
-- Indexes for table `sh_zone_rates`
--
ALTER TABLE `sh_zone_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `from_zone_id` (`from_zone_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sh_zone_rate_fees`
--
ALTER TABLE `sh_zone_rate_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone_rate_id` (`zone_rate_id`),
  ADD KEY `to_zone_id` (`to_zone_id`);

--
-- Indexes for table `sh_zone_rate_prices`
--
ALTER TABLE `sh_zone_rate_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone_rate_id` (`zone_rate_id`),
  ADD KEY `to_zone_id` (`to_zone_id`),
  ADD KEY `range_weight_id` (`range_weight_id`);

--
-- Indexes for table `sh_zone_translations`
--
ALTER TABLE `sh_zone_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sh_zone_translations_ibfk_1` (`zones_id`);

--
-- Indexes for table `slugs`
--
ALTER TABLE `slugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_user_id_index` (`user_id`),
  ADD KEY `tags_parent_id_index` (`parent_id`);

--
-- Indexes for table `ticketSystem`
--
ALTER TABLE `ticketSystem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `ajoul_userid` (`ajoul_userid`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_meta_user_id_index` (`user_id`);

--
-- Indexes for table `whatsapp`
--
ALTER TABLE `whatsapp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `whatsapp_messages_receivers`
--
ALTER TABLE `whatsapp_messages_receivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api`
--
ALTER TABLE `api`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_history`
--
ALTER TABLE `audit_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `error_shipment`
--
ALTER TABLE `error_shipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `field_groups`
--
ALTER TABLE `field_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `field_items`
--
ALTER TABLE `field_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_meta`
--
ALTER TABLE `gallery_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `import_file_data_dhl`
--
ALTER TABLE `import_file_data_dhl`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ksa_post_locations`
--
ALTER TABLE `ksa_post_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ksa_post_status`
--
ALTER TABLE `ksa_post_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ksa_post_tokens`
--
ALTER TABLE `ksa_post_tokens`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `lang_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language_meta`
--
ALTER TABLE `language_meta`
  MODIFY `lang_meta_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_templates`
--
ALTER TABLE `mail_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_templates_translations`
--
ALTER TABLE `mail_templates_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_settings`
--
ALTER TABLE `media_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member_password_resets`
--
ALTER TABLE `member_password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_invoices_pay`
--
ALTER TABLE `messenger_invoices_pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_category`
--
ALTER TABLE `post_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_logs`
--
ALTER TABLE `request_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_quota`
--
ALTER TABLE `request_quota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_bin_location`
--
ALTER TABLE `sh_bin_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_branches`
--
ALTER TABLE `sh_branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_branch_translations`
--
ALTER TABLE `sh_branch_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_cities`
--
ALTER TABLE `sh_cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_city_translations`
--
ALTER TABLE `sh_city_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_cod_shipments`
--
ALTER TABLE `sh_cod_shipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_countries`
--
ALTER TABLE `sh_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_country_translations`
--
ALTER TABLE `sh_country_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_coupons`
--
ALTER TABLE `sh_coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_credit_debit_notes`
--
ALTER TABLE `sh_credit_debit_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_csa_reasons`
--
ALTER TABLE `sh_csa_reasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_csa_shipments`
--
ALTER TABLE `sh_csa_shipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_customer_vendors`
--
ALTER TABLE `sh_customer_vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_driver_invoices`
--
ALTER TABLE `sh_driver_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_driver_shipments`
--
ALTER TABLE `sh_driver_shipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_driver_signature`
--
ALTER TABLE `sh_driver_signature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_drs`
--
ALTER TABLE `sh_drs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_drs_cod_logs`
--
ALTER TABLE `sh_drs_cod_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_emails_customer`
--
ALTER TABLE `sh_emails_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_imports_dhl_files`
--
ALTER TABLE `sh_imports_dhl_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_imports_drs`
--
ALTER TABLE `sh_imports_drs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_imports_messenger`
--
ALTER TABLE `sh_imports_messenger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_imports_return_shipment`
--
ALTER TABLE `sh_imports_return_shipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_imports_route`
--
ALTER TABLE `sh_imports_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_imports_shipment`
--
ALTER TABLE `sh_imports_shipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_import_rates_shipment`
--
ALTER TABLE `sh_import_rates_shipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_inventories`
--
ALTER TABLE `sh_inventories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_inventory_translations`
--
ALTER TABLE `sh_inventory_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_invoices`
--
ALTER TABLE `sh_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_manifests`
--
ALTER TABLE `sh_manifests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_manifest_shipments`
--
ALTER TABLE `sh_manifest_shipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_pcategories`
--
ALTER TABLE `sh_pcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_pcategory_translations`
--
ALTER TABLE `sh_pcategory_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_picked_shipments`
--
ALTER TABLE `sh_picked_shipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_pickup`
--
ALTER TABLE `sh_pickup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_pos_machines`
--
ALTER TABLE `sh_pos_machines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_products`
--
ALTER TABLE `sh_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_product_customers`
--
ALTER TABLE `sh_product_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_product_translations`
--
ALTER TABLE `sh_product_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_range_weight`
--
ALTER TABLE `sh_range_weight`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_receivers`
--
ALTER TABLE `sh_receivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_register_transfers`
--
ALTER TABLE `sh_register_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_routes`
--
ALTER TABLE `sh_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_route_translations`
--
ALTER TABLE `sh_route_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_senders`
--
ALTER TABLE `sh_senders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_services`
--
ALTER TABLE `sh_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_service_translations`
--
ALTER TABLE `sh_service_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_shipments`
--
ALTER TABLE `sh_shipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_shipments_branches_dummy`
--
ALTER TABLE `sh_shipments_branches_dummy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_shipments_import`
--
ALTER TABLE `sh_shipments_import`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_shipment_drs`
--
ALTER TABLE `sh_shipment_drs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_shipment_logs`
--
ALTER TABLE `sh_shipment_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_shipment_pickup`
--
ALTER TABLE `sh_shipment_pickup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_staff_departments`
--
ALTER TABLE `sh_staff_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_statuses`
--
ALTER TABLE `sh_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_status_translations`
--
ALTER TABLE `sh_status_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_stop_synch`
--
ALTER TABLE `sh_stop_synch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_sub_statuses`
--
ALTER TABLE `sh_sub_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_sub_status_translations`
--
ALTER TABLE `sh_sub_status_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_suppliers`
--
ALTER TABLE `sh_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_support_category`
--
ALTER TABLE `sh_support_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_testimonials`
--
ALTER TABLE `sh_testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_testimonials_translations`
--
ALTER TABLE `sh_testimonials_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_ticket_system`
--
ALTER TABLE `sh_ticket_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_ticket_system_comments`
--
ALTER TABLE `sh_ticket_system_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_ticket_system_staff`
--
ALTER TABLE `sh_ticket_system_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_ticket_system_status`
--
ALTER TABLE `sh_ticket_system_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_whatsapp_messages_queue`
--
ALTER TABLE `sh_whatsapp_messages_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_write_dhl_files`
--
ALTER TABLE `sh_write_dhl_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_zones`
--
ALTER TABLE `sh_zones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_zone_area`
--
ALTER TABLE `sh_zone_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_zone_price_lists`
--
ALTER TABLE `sh_zone_price_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_zone_rates`
--
ALTER TABLE `sh_zone_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_zone_rate_fees`
--
ALTER TABLE `sh_zone_rate_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_zone_rate_prices`
--
ALTER TABLE `sh_zone_rate_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sh_zone_translations`
--
ALTER TABLE `sh_zone_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slugs`
--
ALTER TABLE `slugs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticketSystem`
--
ALTER TABLE `ticketSystem`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `whatsapp`
--
ALTER TABLE `whatsapp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `whatsapp_messages_receivers`
--
ALTER TABLE `whatsapp_messages_receivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD CONSTRAINT `custom_fields_field_item_id_foreign` FOREIGN KEY (`field_item_id`) REFERENCES `field_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `field_groups`
--
ALTER TABLE `field_groups`
  ADD CONSTRAINT `field_groups_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `field_groups_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `field_items`
--
ALTER TABLE `field_items`
  ADD CONSTRAINT `field_items_field_group_id_foreign` FOREIGN KEY (`field_group_id`) REFERENCES `field_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `field_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `field_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_bin_location`
--
ALTER TABLE `sh_bin_location`
  ADD CONSTRAINT `sh_bin_location_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `sh_inventories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_branches`
--
ALTER TABLE `sh_branches`
  ADD CONSTRAINT `sh_branches_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `sh_countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sh_branches_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `sh_cities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_branch_translations`
--
ALTER TABLE `sh_branch_translations`
  ADD CONSTRAINT `sh_branch_translations_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `sh_branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_cities`
--
ALTER TABLE `sh_cities`
  ADD CONSTRAINT `sh_cities_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `sh_countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_city_translations`
--
ALTER TABLE `sh_city_translations`
  ADD CONSTRAINT `sh_city_translations_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `sh_cities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_cod_shipments`
--
ALTER TABLE `sh_cod_shipments`
  ADD CONSTRAINT `sh_cod_shipments_ibfk_1` FOREIGN KEY (`drs_id`) REFERENCES `sh_drs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_country_translations`
--
ALTER TABLE `sh_country_translations`
  ADD CONSTRAINT `sh_country_translations_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `sh_countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_inventory_translations`
--
ALTER TABLE `sh_inventory_translations`
  ADD CONSTRAINT `sh_inventory_translations_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `sh_inventories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_pcategory_translations`
--
ALTER TABLE `sh_pcategory_translations`
  ADD CONSTRAINT `sh_pcategory_translations_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `sh_pcategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_product_translations`
--
ALTER TABLE `sh_product_translations`
  ADD CONSTRAINT `sh_product_translations_ibfk_1` FOREIGN KEY (`products_id`) REFERENCES `sh_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_range_weight`
--
ALTER TABLE `sh_range_weight`
  ADD CONSTRAINT `sh_range_weight_ibfk_1` FOREIGN KEY (`products_id`) REFERENCES `sh_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_route_translations`
--
ALTER TABLE `sh_route_translations`
  ADD CONSTRAINT `sh_route_translations_ibfk_1` FOREIGN KEY (`routes_id`) REFERENCES `sh_route_translations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_service_translations`
--
ALTER TABLE `sh_service_translations`
  ADD CONSTRAINT `sh_service_translations_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `sh_services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_sub_statuses`
--
ALTER TABLE `sh_sub_statuses`
  ADD CONSTRAINT `sh_sub_statuses_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `sh_statuses` (`id`);

--
-- Constraints for table `sh_sub_status_translations`
--
ALTER TABLE `sh_sub_status_translations`
  ADD CONSTRAINT `sh_sub_status_translations_ibfk_1` FOREIGN KEY (`sub_statuses_id`) REFERENCES `sh_sub_statuses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_zone_area`
--
ALTER TABLE `sh_zone_area`
  ADD CONSTRAINT `sh_zone_area_ibfk_1` FOREIGN KEY (`zone_id`) REFERENCES `sh_zones` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_zone_price_lists`
--
ALTER TABLE `sh_zone_price_lists`
  ADD CONSTRAINT `sh_zone_price_lists_ibfk_1` FOREIGN KEY (`zone_rate_id`) REFERENCES `sh_zone_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_zone_rate_fees`
--
ALTER TABLE `sh_zone_rate_fees`
  ADD CONSTRAINT `sh_zone_rate_fees_ibfk_1` FOREIGN KEY (`zone_rate_id`) REFERENCES `sh_zone_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_zone_rate_prices`
--
ALTER TABLE `sh_zone_rate_prices`
  ADD CONSTRAINT `sh_zone_rate_prices_ibfk_1` FOREIGN KEY (`zone_rate_id`) REFERENCES `sh_zone_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sh_zone_translations`
--
ALTER TABLE `sh_zone_translations`
  ADD CONSTRAINT `sh_zone_translations_ibfk_1` FOREIGN KEY (`zones_id`) REFERENCES `sh_zones` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
