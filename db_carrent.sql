-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2022 at 08:43 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_carrent`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add tbl_ user', 7, 'add_tbl_user'),
(26, 'Can change tbl_ user', 7, 'change_tbl_user'),
(27, 'Can delete tbl_ user', 7, 'delete_tbl_user'),
(28, 'Can view tbl_ user', 7, 'view_tbl_user'),
(29, 'Can add tbl_ product', 8, 'add_tbl_product'),
(30, 'Can change tbl_ product', 8, 'change_tbl_product'),
(31, 'Can delete tbl_ product', 8, 'delete_tbl_product'),
(32, 'Can view tbl_ product', 8, 'view_tbl_product'),
(33, 'Can add tbl_feedback', 9, 'add_tbl_feedback'),
(34, 'Can change tbl_feedback', 9, 'change_tbl_feedback'),
(35, 'Can delete tbl_feedback', 9, 'delete_tbl_feedback'),
(36, 'Can view tbl_feedback', 9, 'view_tbl_feedback'),
(37, 'Can add tbl_booking', 10, 'add_tbl_booking'),
(38, 'Can change tbl_booking', 10, 'change_tbl_booking'),
(39, 'Can delete tbl_booking', 10, 'delete_tbl_booking'),
(40, 'Can view tbl_booking', 10, 'view_tbl_booking'),
(41, 'Can add tbl_driver book', 11, 'add_tbl_driverbook'),
(42, 'Can change tbl_driver book', 11, 'change_tbl_driverbook'),
(43, 'Can delete tbl_driver book', 11, 'delete_tbl_driverbook'),
(44, 'Can view tbl_driver book', 11, 'view_tbl_driverbook'),
(45, 'Can add tbl_complaint', 12, 'add_tbl_complaint'),
(46, 'Can change tbl_complaint', 12, 'change_tbl_complaint'),
(47, 'Can delete tbl_complaint', 12, 'delete_tbl_complaint'),
(48, 'Can view tbl_complaint', 12, 'view_tbl_complaint');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `carrentapp_tbl_booking`
--

CREATE TABLE `carrentapp_tbl_booking` (
  `id` bigint(20) NOT NULL,
  `date` varchar(30) NOT NULL,
  `fromdate` varchar(30) NOT NULL,
  `todate` varchar(30) NOT NULL,
  `hrs` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `product_id_id` bigint(20) DEFAULT NULL,
  `buyer_id_id` bigint(20) DEFAULT NULL,
  `owner_email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carrentapp_tbl_booking`
--

INSERT INTO `carrentapp_tbl_booking` (`id`, `date`, `fromdate`, `todate`, `hrs`, `status`, `product_id_id`, `buyer_id_id`, `owner_email`) VALUES
(3, '2022-07-15 11:55:14.541104', '2022-07-22', '2022-07-23', '24hrs', 'rejected', 2, 5, 'liya@gmail.com'),
(4, '2022-07-15 12:42:49.793875', '2022-07-15', '2022-07-15', '24hrs', 'pending', 1, 5, 'liya@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `carrentapp_tbl_complaint`
--

CREATE TABLE `carrentapp_tbl_complaint` (
  `id` bigint(20) NOT NULL,
  `police_email` varchar(30) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `description` varchar(30) NOT NULL,
  `location` varchar(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `reply` varchar(30) NOT NULL,
  `buyer_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carrentapp_tbl_complaint`
--

INSERT INTO `carrentapp_tbl_complaint` (`id`, `police_email`, `subject`, `description`, `location`, `date`, `status`, `reply`, `buyer_id_id`) VALUES
(2, 'maya@gmail.com', 'fdfdsf', 'missing', 'kannur', '2022-07-15 16:49:24.482427', 'replied', 'ok i will contact you', 5);

-- --------------------------------------------------------

--
-- Table structure for table `carrentapp_tbl_driverbook`
--

CREATE TABLE `carrentapp_tbl_driverbook` (
  `id` bigint(20) NOT NULL,
  `driver_email` varchar(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `fromdate` varchar(30) NOT NULL,
  `todate` varchar(30) NOT NULL,
  `hrs` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `buyer_id_id` bigint(20) DEFAULT NULL,
  `driver_phone` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carrentapp_tbl_driverbook`
--

INSERT INTO `carrentapp_tbl_driverbook` (`id`, `driver_email`, `date`, `fromdate`, `todate`, `hrs`, `status`, `buyer_id_id`, `driver_phone`) VALUES
(1, 'libin@gmail.com', '2022-07-15 15:42:17.890809', '2022-07-15', '2022-07-16', '24hrs', 'rejected', 5, ''),
(2, 'libin@gmail.com', '2022-07-15 15:51:31.658327', '2022-07-23', '2022-07-29', '24hrs', 'pending', 5, '976767676'),
(3, 'libin@gmail.com', '2022-07-18 10:16:26.856215', '2022-07-19', '2022-07-20', '24hrs', 'pending', 5, '976767676');

-- --------------------------------------------------------

--
-- Table structure for table `carrentapp_tbl_feedback`
--

CREATE TABLE `carrentapp_tbl_feedback` (
  `id` bigint(20) NOT NULL,
  `feedback` varchar(30) NOT NULL,
  `user_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carrentapp_tbl_feedback`
--

INSERT INTO `carrentapp_tbl_feedback` (`id`, `feedback`, `user_id_id`) VALUES
(1, 'ghgj', 2);

-- --------------------------------------------------------

--
-- Table structure for table `carrentapp_tbl_product`
--

CREATE TABLE `carrentapp_tbl_product` (
  `id` bigint(20) NOT NULL,
  `img` varchar(100) NOT NULL,
  `name` varchar(30) NOT NULL,
  `car_number` varchar(50) NOT NULL,
  `seat` varchar(30) NOT NULL,
  `specification` varchar(30) NOT NULL,
  `price` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `user_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carrentapp_tbl_product`
--

INSERT INTO `carrentapp_tbl_product` (`id`, `img`, `name`, `car_number`, `seat`, `specification`, `price`, `status`, `user_id_id`) VALUES
(1, 'pic/_flickr2.jpg', 'bense', '45454', '6', 'gdfgd.5 seats', '5000', 'requested', 2),
(2, 'pic/historical_art3.jpg', 'BMW', 'KL2323', '4', 'yello color, great', '50000', 'requested', 2);

-- --------------------------------------------------------

--
-- Table structure for table `carrentapp_tbl_user`
--

CREATE TABLE `carrentapp_tbl_user` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pswd` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `user_type` varchar(30) NOT NULL,
  `idproof` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carrentapp_tbl_user`
--

INSERT INTO `carrentapp_tbl_user` (`id`, `name`, `phone`, `address`, `email`, `pswd`, `status`, `user_type`, `idproof`) VALUES
(1, '', '', '', 'admin@gmail.com', 'admin', '', 'admin', ''),
(2, 'liya', '98888888888', 'Thrissur,Kerala', 'liya@gmail.com', '123', 'approved', 'owner', 'pic/download.jpg'),
(4, 'sona', '976767676767', 'thrissur', 'sona@gmail.com', '123', 'pending', 'owner', 'pic/download.jpg'),
(5, 'lynn', '97656556566', 'thrissur', 'lynn@gmail.com', '123', 'pending', 'buyer', 'pic/download.jpg'),
(6, 'Libin p S', '976767676', 'thrissur', 'libin@gmail.com', '123', 'approved', 'driver', 'pic/download.jpg'),
(7, 'binitha', '8765397820', 'thrissur', 'binitha@gmail.com', '123', 'pending', 'buyer', 'pic/download.jpg'),
(8, 'maya', '9778778787878', 'thrissur', 'maya@gmail.com', '123', 'pending', 'police', 'pic/download_dKe6u8W.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(10, 'carRentapp', 'tbl_booking'),
(12, 'carRentapp', 'tbl_complaint'),
(11, 'carRentapp', 'tbl_driverbook'),
(9, 'carRentapp', 'tbl_feedback'),
(8, 'carRentapp', 'tbl_product'),
(7, 'carRentapp', 'tbl_user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-06-27 08:06:03.406117'),
(2, 'auth', '0001_initial', '2022-06-27 08:06:14.431747'),
(3, 'admin', '0001_initial', '2022-06-27 08:06:19.167018'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-06-27 08:06:19.205020'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-27 08:06:19.226021'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-06-27 08:06:19.579042'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-06-27 08:06:20.006066'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-06-27 08:06:20.087071'),
(9, 'auth', '0004_alter_user_username_opts', '2022-06-27 08:06:20.120073'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-06-27 08:06:20.387088'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-06-27 08:06:20.407089'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-06-27 08:06:20.457092'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-06-27 08:06:20.541097'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-06-27 08:06:20.644103'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-06-27 08:06:20.755109'),
(16, 'auth', '0011_update_proxy_permissions', '2022-06-27 08:06:20.815112'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-06-27 08:06:21.001123'),
(18, 'sessions', '0001_initial', '2022-06-27 08:06:22.389202'),
(19, 'carRentapp', '0001_initial', '2022-06-28 05:08:10.818952'),
(20, 'carRentapp', '0002_tbl_user_idproof', '2022-07-01 04:58:28.336747'),
(21, 'carRentapp', '0003_tbl_product', '2022-07-01 10:59:16.578301'),
(22, 'carRentapp', '0004_tbl_feedback', '2022-07-09 09:26:56.303666'),
(23, 'carRentapp', '0005_tbl_booking', '2022-07-15 04:26:50.956381'),
(24, 'carRentapp', '0006_rename_user_id_tbl_booking_buyer_id', '2022-07-15 05:00:17.206547'),
(25, 'carRentapp', '0002_tbl_booking_owner_email', '2022-07-15 06:19:46.721466'),
(26, 'carRentapp', '0003_tbl_driverbook', '2022-07-15 09:56:32.575271'),
(27, 'carRentapp', '0004_tbl_driverbook_driver_phone', '2022-07-15 10:20:29.536929'),
(28, 'carRentapp', '0005_tbl_complaint', '2022-07-15 11:02:04.112482');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('603rm2m9mx7ghptbbrzn0huegrzimvg2', 'eyJpZCI6NX0:1oA7EQ:dvaa-Mg_mSPViwr4ZscWLN6KmPPhcRLi3CiY2aX7_-Q', '2022-07-23 09:58:34.133974'),
('dix9eijhac8yrwj5n5ag52xubfdgsb9m', 'eyJpZCI6Mn0:1o8FKx:v9TOUi5sQEk5M3jEr5wxr9TRP73a1-RqO8mxhcUXcZk', '2022-07-18 06:13:35.968538'),
('qps1vuwfqd0r6737mxmy9ht2ri0w4ji4', 'eyJpZCI6MX0:1o64R6:ZxZTGlaQxHlw7AYTLR06N2QNsJ7r_GmpY3AqLxYt_M4', '2022-07-12 06:10:56.574733'),
('u9yek5hcpb8pbpatdzxc9lbg9oynew7j', 'eyJpZCI6Mn0:1o7DwY:M44r7fRWpsmj5FN-mJT63epSuZECvlQLFlZppkLREiM', '2022-07-15 10:32:10.889240'),
('ubocs96owoe62duxbu2ho0thbbl8um3z', 'eyJpZCI6MX0:1oDKRN:U2GFczFFT31VD0Z6wzKbbPmbTe1yUVnSZRXQQ6xAB3w', '2022-08-01 06:41:13.429481');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `carrentapp_tbl_booking`
--
ALTER TABLE `carrentapp_tbl_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carRentapp_tbl_booki_product_id_id_d826f004_fk_carRentap` (`product_id_id`),
  ADD KEY `carRentapp_tbl_booki_buyer_id_id_c81f3eb7_fk_carRentap` (`buyer_id_id`);

--
-- Indexes for table `carrentapp_tbl_complaint`
--
ALTER TABLE `carrentapp_tbl_complaint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carRentapp_tbl_compl_buyer_id_id_2861738d_fk_carRentap` (`buyer_id_id`);

--
-- Indexes for table `carrentapp_tbl_driverbook`
--
ALTER TABLE `carrentapp_tbl_driverbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carRentapp_tbl_drive_buyer_id_id_64061591_fk_carRentap` (`buyer_id_id`);

--
-- Indexes for table `carrentapp_tbl_feedback`
--
ALTER TABLE `carrentapp_tbl_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carRentapp_tbl_feedb_user_id_id_0af89f56_fk_carRentap` (`user_id_id`);

--
-- Indexes for table `carrentapp_tbl_product`
--
ALTER TABLE `carrentapp_tbl_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carRentapp_tbl_produ_user_id_id_1dd70657_fk_carRentap` (`user_id_id`);

--
-- Indexes for table `carrentapp_tbl_user`
--
ALTER TABLE `carrentapp_tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carrentapp_tbl_booking`
--
ALTER TABLE `carrentapp_tbl_booking`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carrentapp_tbl_complaint`
--
ALTER TABLE `carrentapp_tbl_complaint`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carrentapp_tbl_driverbook`
--
ALTER TABLE `carrentapp_tbl_driverbook`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `carrentapp_tbl_feedback`
--
ALTER TABLE `carrentapp_tbl_feedback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carrentapp_tbl_product`
--
ALTER TABLE `carrentapp_tbl_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carrentapp_tbl_user`
--
ALTER TABLE `carrentapp_tbl_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `carrentapp_tbl_booking`
--
ALTER TABLE `carrentapp_tbl_booking`
  ADD CONSTRAINT `carRentapp_tbl_booki_buyer_id_id_c81f3eb7_fk_carRentap` FOREIGN KEY (`buyer_id_id`) REFERENCES `carrentapp_tbl_user` (`id`),
  ADD CONSTRAINT `carRentapp_tbl_booki_product_id_id_d826f004_fk_carRentap` FOREIGN KEY (`product_id_id`) REFERENCES `carrentapp_tbl_product` (`id`);

--
-- Constraints for table `carrentapp_tbl_complaint`
--
ALTER TABLE `carrentapp_tbl_complaint`
  ADD CONSTRAINT `carRentapp_tbl_compl_buyer_id_id_2861738d_fk_carRentap` FOREIGN KEY (`buyer_id_id`) REFERENCES `carrentapp_tbl_user` (`id`);

--
-- Constraints for table `carrentapp_tbl_driverbook`
--
ALTER TABLE `carrentapp_tbl_driverbook`
  ADD CONSTRAINT `carRentapp_tbl_drive_buyer_id_id_64061591_fk_carRentap` FOREIGN KEY (`buyer_id_id`) REFERENCES `carrentapp_tbl_user` (`id`);

--
-- Constraints for table `carrentapp_tbl_feedback`
--
ALTER TABLE `carrentapp_tbl_feedback`
  ADD CONSTRAINT `carRentapp_tbl_feedb_user_id_id_0af89f56_fk_carRentap` FOREIGN KEY (`user_id_id`) REFERENCES `carrentapp_tbl_user` (`id`);

--
-- Constraints for table `carrentapp_tbl_product`
--
ALTER TABLE `carrentapp_tbl_product`
  ADD CONSTRAINT `carRentapp_tbl_produ_user_id_id_1dd70657_fk_carRentap` FOREIGN KEY (`user_id_id`) REFERENCES `carrentapp_tbl_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
