-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2019 at 06:03 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appointmentmaster`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(25, 'Can add admin', 7, 'add_admin'),
(26, 'Can change admin', 7, 'change_admin'),
(27, 'Can delete admin', 7, 'delete_admin'),
(28, 'Can view admin', 7, 'view_admin'),
(29, 'Can add appointment', 8, 'add_appointment'),
(30, 'Can change appointment', 8, 'change_appointment'),
(31, 'Can delete appointment', 8, 'delete_appointment'),
(32, 'Can view appointment', 8, 'view_appointment'),
(33, 'Can add client', 9, 'add_client'),
(34, 'Can change client', 9, 'change_client'),
(35, 'Can delete client', 9, 'delete_client'),
(36, 'Can view client', 9, 'view_client'),
(37, 'Can add service', 10, 'add_service'),
(38, 'Can change service', 10, 'change_service'),
(39, 'Can delete service', 10, 'delete_service'),
(40, 'Can view service', 10, 'view_service'),
(41, 'Can add sp', 11, 'add_sp'),
(42, 'Can change sp', 11, 'change_sp'),
(43, 'Can delete sp', 11, 'delete_sp'),
(44, 'Can view sp', 11, 'view_sp');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$qRExhJPp1Jkp$bQYsDqqEqQsWpVZjhxxEcdxZWkvcSsfJgP6TUzWPnPk=', '2019-08-21 19:57:04.587320', 1, 'hp', '', '', '', 1, 1, '2019-08-21 19:56:53.659563');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `serviceid` int(11) NOT NULL,
  `chat` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `userid`, `serviceid`, `chat`, `time`) VALUES
(0, 0, 0, '', '2019-08-21 09:14:15');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `Name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `Name`) VALUES
(1, 'Rajkot'),
(2, 'Bhavnagar'),
(3, 'Surat'),
(4, 'Dwarka'),
(5, 'Junagad'),
(6, 'Vadodra');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'pages', 'admin'),
(8, 'pages', 'appointment'),
(9, 'pages', 'client'),
(10, 'pages', 'service'),
(11, 'pages', 'sp'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-08-21 19:13:59.643646'),
(2, 'auth', '0001_initial', '2019-08-21 19:14:00.275737'),
(3, 'admin', '0001_initial', '2019-08-21 19:14:02.740337'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-08-21 19:14:03.373915'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-08-21 19:14:03.405348'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-08-21 19:14:03.724490'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-08-21 19:14:04.390764'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-08-21 19:14:04.633886'),
(9, 'auth', '0004_alter_user_username_opts', '2019-08-21 19:14:04.651533'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-08-21 19:14:04.758668'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-08-21 19:14:04.766892'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-08-21 19:14:04.781839'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-08-21 19:14:04.941967'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-08-21 19:14:05.313660'),
(15, 'auth', '0010_alter_group_name_max_length', '2019-08-21 19:14:05.486427'),
(16, 'auth', '0011_update_proxy_permissions', '2019-08-21 19:14:05.500273'),
(17, 'sessions', '0001_initial', '2019-08-21 19:14:05.620078'),
(18, 'pages', '0001_initial', '2019-09-04 14:34:59.032331'),
(19, 'pages', '0002_auto_20190904_2254', '2019-09-04 17:37:15.465444'),
(20, 'pages', '0003_auto_20190904_2256', '2019-09-04 17:42:09.356186'),
(21, 'pages', '0004_remove_service_images', '2019-09-04 17:42:09.402997'),
(22, 'pages', '0005_service_image', '2019-09-04 17:42:09.506233'),
(23, 'pages', '0006_auto_20190904_2314', '2019-09-04 17:44:16.996437'),
(24, 'pages', '0007_auto_20190904_2340', '2019-09-04 18:10:31.598447');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('h48o2gg1rtgqjyqdatc6tv4emf070yan', 'YjQ4ZjEyMWE4M2ViNjlhYjZkZDI5ZDRhOTcxMjMwZTVhMTJiNTUxNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MTc0MTVlYTc0YWUwNjAxM2Q3MGU5YTcxN2MxYjAxZWFkYTE5MWFhIn0=', '2019-09-04 19:57:04.599286');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `title` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `detail` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `userid` int(11) NOT NULL,
  `serviceid` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `path` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages_admin`
--

CREATE TABLE `pages_admin` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages_admin`
--

INSERT INTO `pages_admin` (`id`, `password`, `username`) VALUES
(1, 'paresh', 'paresh'),
(2, 'raj', 'raj');

-- --------------------------------------------------------

--
-- Table structure for table `pages_appointment`
--

CREATE TABLE `pages_appointment` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `serviceid` int(11) NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `time` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages_client`
--

CREATE TABLE `pages_client` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `phone_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages_client`
--

INSERT INTO `pages_client` (`id`, `name`, `gender`, `password`, `phone_no`, `email`, `city`) VALUES
(1, 'paresh', '', '123', '8128611138', 'P', 'Bhavnagar'),
(2, 'paresh', '', '123', '8128611138', 'P', 'Bhavnagar'),
(3, 'vishal', '', '123', '8128611138', 'vishal', 'Bhavnagar'),
(4, 'vishal', '', '123', '8128611138', '123', 'Bhavnagar'),
(5, 'Vishal Sharma', 'Male', '1231', '1245678922', '123', 'Bhavnagar'),
(6, 'Suman', 'Female', '147', '1234567890', 'pqresh', 'Rajkot'),
(7, 'paresh', 'Male', '123', '1000000000', '1', 'Bhavnagar'),
(8, 'paresh', 'Male', '123', '1000000000', '1', 'Bhavnagar'),
(9, 'paresh', 'Male', '4', '1234567891', '1', 'Bhavnagar'),
(10, 'paresh', 'Male', 'qwe', '1234567890', '1', 'Rajkot'),
(11, '1', 'Female', '1', '8128611138', 'pareshkumar.sharma15621@marwadieducation.edu.in', 'Bhavnagar'),
(12, '123', 'Male', '111', '1234567899', '123', 'Bhavnagar'),
(13, 'Gudiya', 'Female', '456', '1324567897', '123', 'Dwarka'),
(14, 'Devkinandanji', 'Male', '456', '4567891238', 'krishna@dwarka.com', 'Dwarka'),
(15, 'Mehula', 'Female', '111', '1000000000', 'email', 'Bhavnagar'),
(16, 'Kesari', 'Female', '444', '9999999999', 'email', 'Surat'),
(17, 'yash', 'Male', '123', '1234567890', 'mail', 'Rajkot');

-- --------------------------------------------------------

--
-- Table structure for table `pages_service`
--

CREATE TABLE `pages_service` (
  `id` int(11) NOT NULL,
  `title` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `providerid` int(11) NOT NULL,
  `city` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `day` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `time_start_h` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `time_start_m` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `time_end_h` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `time_end_m` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `stype` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cost` double NOT NULL,
  `phone_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages_service`
--

INSERT INTO `pages_service` (`id`, `title`, `providerid`, `city`, `day`, `location`, `description`, `time_start_h`, `time_start_m`, `time_end_h`, `time_end_m`, `status`, `stype`, `cost`, `phone_no`, `image`) VALUES
(1, 'Denthis - Dr. Yash Hanj', 4, 'Rajkot', 'Mon - Sat', 'Ayodhya Chowk, Rajkot', 'Dr. Yash Hanj has 5 years of e', '8', '30', '17', '30', 'Pending', 'Doctor', 0, '', 'no image'),
(2, 'Nikhil Consultancy Service ', 4, 'Rajkot', 'Mon - Sat', 'Gauridad, Rajkot', 'Our organisation working on providing product based business since 2009, we are providing django, php, static and dynamic websit', '10', '00', '17', '30', 'Pending', 'Business', 0, '', 'no image'),
(3, 'DHL Courier Service', 4, 'Rajkot', 'All Days', 'Gauridad, Rajkot', 'Providing Courier Service...', '01', '00', '18', '00', 'Pending', 'Transport', 0, '', 'no image'),
(4, 'New Admission', 4, 'Rajkot', 'Mon - Sat', 'Gauridad, Morbi Highway, Rajko', 'We are welcoming all the student, Indian as well as foreigners to come and visit our college, hostel and sport facilities.', '9', '30', '5', '0', 'Pending', 'Education', 0, '8128611138', 'business-icon.png');

-- --------------------------------------------------------

--
-- Table structure for table `pages_sp`
--

CREATE TABLE `pages_sp` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `phone_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages_sp`
--

INSERT INTO `pages_sp` (`id`, `name`, `email`, `phone_no`, `password`, `city`, `status`) VALUES
(1, 'sp1', '1mail', '1234567890', 'qwe', 'Bhavnagar', ''),
(2, 'krishna', '123mail', '1234567890', 'qwe', 'Dwarka', ''),
(3, 'Radhey', 'sonam@mail', '1234567890', '123', 'Surat', ''),
(4, 'Marwadi', 'mail', '1231133344', '123', 'Rajkot', '');

-- --------------------------------------------------------

--
-- Table structure for table `servicetype`
--

CREATE TABLE `servicetype` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `servicetype`
--

INSERT INTO `servicetype` (`id`, `name`) VALUES
(1, 'Doctor'),
(2, 'Business'),
(3, 'Education'),
(4, 'Transport'),
(5, 'Celebrity');

-- --------------------------------------------------------

--
-- Table structure for table `tage`
--

CREATE TABLE `tage` (
  `id` int(11) NOT NULL,
  `tage` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `serviceid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `a` int(11) NOT NULL,
  `c` date NOT NULL,
  `d` decimal(10,0) NOT NULL,
  `b` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`a`, `c`, `d`, `b`) VALUES
(1, '2019-08-13', '0', ''),
(1, '2019-08-13', '56', ''),
(2, '0000-00-00', '0', ''),
(2, '0000-00-00', '99', ''),
(0, '0000-00-00', '0', 'राधे'),
(0, '0000-00-00', '99', 'राधे'),
(0, '0000-00-00', '0', 'gggg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `phone_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `City` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
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
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_admin`
--
ALTER TABLE `pages_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_appointment`
--
ALTER TABLE `pages_appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_client`
--
ALTER TABLE `pages_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_service`
--
ALTER TABLE `pages_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Foreign Key` (`providerid`);

--
-- Indexes for table `pages_sp`
--
ALTER TABLE `pages_sp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `servicetype`
--
ALTER TABLE `servicetype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tage`
--
ALTER TABLE `tage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
