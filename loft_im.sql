-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 31, 2022 at 04:10 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loft_im`
--

-- --------------------------------------------------------

--
-- Table structure for table `antigua_immigrants`
--

CREATE TABLE `antigua_immigrants` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `married` varchar(255) NOT NULL,
  `old_dependents` int(11) DEFAULT '0',
  `young_dependents` int(11) DEFAULT '0',
  `teen_dependents` int(11) DEFAULT '0',
  `average_dependents` int(11) DEFAULT '0',
  `rejected` tinyint(1) NOT NULL DEFAULT '0',
  `deported` tinyint(1) NOT NULL DEFAULT '0',
  `contact_medium` varchar(255) NOT NULL,
  `referee` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `residence` int(11) DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL,
  `invest_funds` int(11) DEFAULT NULL,
  `networth` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `antigua_immigrants`
--

INSERT INTO `antigua_immigrants` (`id`, `first_name`, `last_name`, `email`, `phone`, `married`, `old_dependents`, `young_dependents`, `teen_dependents`, `average_dependents`, `rejected`, `deported`, `contact_medium`, `referee`, `createdAt`, `updatedAt`, `residence`, `nationality`, `invest_funds`, `networth`) VALUES
(5, 'Ebuka', 'Nwosu', 'info@cybertechdigitals.com', '8107539186', 'false', 0, 0, 0, 0, 1, 1, 'Phone Call', 'Instagram', '2021-01-14 08:35:33', '2021-01-14 08:35:33', 2, 3, 9, 3),
(11, 'Ebuka', 'Nwosu', 'ebukanwosu45@gmail.com', '8107539186', 'false', 4, 0, 0, 0, 1, 1, 'Phone Call,Email', 'Instagram', '2021-01-25 13:56:02', '2021-01-25 13:56:02', 1, 3, 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `business_immigrants`
--

CREATE TABLE `business_immigrants` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `dob` datetime NOT NULL,
  `managerial_experience` tinyint(1) DEFAULT '0',
  `group` int(11) DEFAULT '0',
  `eligible_party` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `maritalStatusId` int(11) DEFAULT NULL,
  `networth` int(11) DEFAULT NULL,
  `invest_funds` int(11) DEFAULT NULL,
  `residenceId` int(11) DEFAULT NULL,
  `citizenshipId` int(11) DEFAULT NULL,
  `client_status` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `business_immigrants`
--

INSERT INTO `business_immigrants` (`id`, `first_name`, `last_name`, `email`, `phone`, `dob`, `managerial_experience`, `group`, `eligible_party`, `createdAt`, `updatedAt`, `maritalStatusId`, `networth`, `invest_funds`, `residenceId`, `citizenshipId`, `client_status`) VALUES
(12, 'Samuel', 'Smith', 'ebukanwos45@gmail.com', '+2348107539187', '1923-11-05 23:00:00', 1, 1, 'applicant', '2021-04-06 00:35:07', '2021-04-07 13:56:57', 2, 2, 9, 162, 162, 1),
(13, 'Ebuka', 'Nwosu', 'cybertechdigitals@gmail.com', '+2348107539186', '1923-11-05 23:00:00', 1, 1, 'applicant', '2021-04-06 00:36:42', '2021-04-07 13:57:39', 2, 2, 9, 162, 162, 1);

-- --------------------------------------------------------

--
-- Table structure for table `business_profiles`
--

CREATE TABLE `business_profiles` (
  `id` int(11) NOT NULL,
  `currect_address` datetime NOT NULL,
  `skype_id` varchar(255) DEFAULT NULL,
  `native_language` varchar(255) NOT NULL,
  `business_knowledge` varchar(255) DEFAULT NULL,
  `business_experience` varchar(255) DEFAULT NULL,
  `language_result` varchar(255) DEFAULT NULL,
  `close_relative` varchar(255) DEFAULT NULL,
  `child_enrolled` tinyint(1) DEFAULT '0',
  `canadian_entry_visa` datetime DEFAULT NULL,
  `mental_disorder` text,
  `past_application` text,
  `denied` text,
  `ordered_to_leave` text,
  `commited_offense` text,
  `military_record` text,
  `government_employed` tinyint(1) DEFAULT '0',
  `preferred_city` varchar(255) DEFAULT NULL,
  `preferred_business` varchar(255) DEFAULT NULL,
  `preferred_migration_date` varchar(255) DEFAULT NULL,
  `business_owner` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `currect_city` int(11) DEFAULT NULL,
  `currect_country` int(11) DEFAULT NULL,
  `maritalStatusId` int(11) DEFAULT NULL,
  `city_of_birth` int(11) DEFAULT NULL,
  `country_of_birth` int(11) DEFAULT NULL,
  `preferred_state` int(11) DEFAULT NULL,
  `businessImmigrantId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `citizenshipId`
--

CREATE TABLE `citizenshipId` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `businessProfileId` int(11) NOT NULL,
  `countryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `employees` int(11) NOT NULL,
  `gross_annual_salses` int(11) NOT NULL,
  `business_type` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `businessProfileId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `desc` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `slug`, `flag`, `desc`, `createdAt`, `updatedAt`) VALUES
(1, 'Afghanistan', 'AF', 'afghanistan', 'https://restcountries.eu/data/afg.svg', 'Afghanistan', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(2, 'Åland Islands', 'AX', 'land-islands', 'https://restcountries.eu/data/ala.svg', 'Åland Islands', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(3, 'Albania', 'AL', 'albania', 'https://restcountries.eu/data/alb.svg', 'Albania', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(4, 'Algeria', 'DZ', 'algeria', 'https://restcountries.eu/data/dza.svg', 'Algeria', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(5, 'American Samoa', 'AS', 'american-samoa', 'https://restcountries.eu/data/asm.svg', 'American Samoa', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(6, 'Andorra', 'AD', 'andorra', 'https://restcountries.eu/data/and.svg', 'Andorra', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(7, 'Angola', 'AO', 'angola', 'https://restcountries.eu/data/ago.svg', 'Angola', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(8, 'Anguilla', 'AI', 'anguilla', 'https://restcountries.eu/data/aia.svg', 'Anguilla', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(9, 'Antigua and Barbuda', 'AG', 'antigua-and-barbuda', 'https://restcountries.eu/data/atg.svg', 'Antigua and Barbuda', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(10, 'Argentina', 'AR', 'argentina', 'https://restcountries.eu/data/arg.svg', 'Argentina', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(11, 'Armenia', 'AM', 'armenia', 'https://restcountries.eu/data/arm.svg', 'Armenia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(12, 'Aruba', 'AW', 'aruba', 'https://restcountries.eu/data/abw.svg', 'Aruba', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(13, 'Australia', 'AU', 'australia', 'https://restcountries.eu/data/aus.svg', 'Australia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(14, 'Austria', 'AT', 'austria', 'https://restcountries.eu/data/aut.svg', 'Austria', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(15, 'Azerbaijan', 'AZ', 'azerbaijan', 'https://restcountries.eu/data/aze.svg', 'Azerbaijan', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(16, 'Bahamas', 'BS', 'bahamas', 'https://restcountries.eu/data/bhs.svg', 'Bahamas', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(17, 'Bahrain', 'BH', 'bahrain', 'https://restcountries.eu/data/bhr.svg', 'Bahrain', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(18, 'Bangladesh', 'BD', 'bangladesh', 'https://restcountries.eu/data/bgd.svg', 'Bangladesh', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(19, 'Barbados', 'BB', 'barbados', 'https://restcountries.eu/data/brb.svg', 'Barbados', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(20, 'Belarus', 'BY', 'belarus', 'https://restcountries.eu/data/blr.svg', 'Belarus', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(21, 'Belgium', 'BE', 'belgium', 'https://restcountries.eu/data/bel.svg', 'Belgium', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(22, 'Belize', 'BZ', 'belize', 'https://restcountries.eu/data/blz.svg', 'Belize', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(23, 'Benin', 'BJ', 'benin', 'https://restcountries.eu/data/ben.svg', 'Benin', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(24, 'Bermuda', 'BM', 'bermuda', 'https://restcountries.eu/data/bmu.svg', 'Bermuda', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(25, 'Bhutan', 'BT', 'bhutan', 'https://restcountries.eu/data/btn.svg', 'Bhutan', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(26, 'Bolivia (Plurinational State of)', 'BO', 'bolivia-plurinational-state-of', 'https://restcountries.eu/data/bol.svg', 'Bolivia (Plurinational State of)', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(27, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'bonaire-sint-eustatius-and-saba', 'https://restcountries.eu/data/bes.svg', 'Bonaire, Sint Eustatius and Saba', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(28, 'Bosnia and Herzegovina', 'BA', 'bosnia-and-herzegovina', 'https://restcountries.eu/data/bih.svg', 'Bosnia and Herzegovina', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(29, 'Botswana', 'BW', 'botswana', 'https://restcountries.eu/data/bwa.svg', 'Botswana', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(30, 'Bouvet Island', 'BV', 'bouvet-island', 'https://restcountries.eu/data/bvt.svg', 'Bouvet Island', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(31, 'Brazil', 'BR', 'brazil', 'https://restcountries.eu/data/bra.svg', 'Brazil', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(32, 'British Indian Ocean Territory', 'IO', 'british-indian-ocean-territory', 'https://restcountries.eu/data/iot.svg', 'British Indian Ocean Territory', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(33, 'United States Minor Outlying Islands', 'UM', 'united-states-minor-outlying-islands', 'https://restcountries.eu/data/umi.svg', 'United States Minor Outlying Islands', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(34, 'Virgin Islands (British)', 'VG', 'virgin-islands-british', 'https://restcountries.eu/data/vgb.svg', 'Virgin Islands (British)', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(35, 'Virgin Islands (U.S.)', 'VI', 'virgin-islands-us', 'https://restcountries.eu/data/vir.svg', 'Virgin Islands (U.S.)', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(36, 'Brunei Darussalam', 'BN', 'brunei-darussalam', 'https://restcountries.eu/data/brn.svg', 'Brunei Darussalam', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(37, 'Bulgaria', 'BG', 'bulgaria', 'https://restcountries.eu/data/bgr.svg', 'Bulgaria', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(38, 'Burkina Faso', 'BF', 'burkina-faso', 'https://restcountries.eu/data/bfa.svg', 'Burkina Faso', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(39, 'Burundi', 'BI', 'burundi', 'https://restcountries.eu/data/bdi.svg', 'Burundi', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(40, 'Cambodia', 'KH', 'cambodia', 'https://restcountries.eu/data/khm.svg', 'Cambodia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(41, 'Cameroon', 'CM', 'cameroon', 'https://restcountries.eu/data/cmr.svg', 'Cameroon', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(42, 'Canada', 'CA', 'canada', 'https://restcountries.eu/data/can.svg', 'Canada', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(43, 'Cabo Verde', 'CV', 'cabo-verde', 'https://restcountries.eu/data/cpv.svg', 'Cabo Verde', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(44, 'Cayman Islands', 'KY', 'cayman-islands', 'https://restcountries.eu/data/cym.svg', 'Cayman Islands', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(45, 'Central African Republic', 'CF', 'central-african-republic', 'https://restcountries.eu/data/caf.svg', 'Central African Republic', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(46, 'Chad', 'TD', 'chad', 'https://restcountries.eu/data/tcd.svg', 'Chad', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(47, 'Chile', 'CL', 'chile', 'https://restcountries.eu/data/chl.svg', 'Chile', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(48, 'China', 'CN', 'china', 'https://restcountries.eu/data/chn.svg', 'China', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(49, 'Christmas Island', 'CX', 'christmas-island', 'https://restcountries.eu/data/cxr.svg', 'Christmas Island', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(50, 'Cocos (Keeling) Islands', 'CC', 'cocos-keeling-islands', 'https://restcountries.eu/data/cck.svg', 'Cocos (Keeling) Islands', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(51, 'Colombia', 'CO', 'colombia', 'https://restcountries.eu/data/col.svg', 'Colombia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(52, 'Comoros', 'KM', 'comoros', 'https://restcountries.eu/data/com.svg', 'Comoros', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(53, 'Congo', 'CG', 'congo', 'https://restcountries.eu/data/cog.svg', 'Congo', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(54, 'Congo (Democratic Republic of the)', 'CD', 'congo-democratic-republic-of-the', 'https://restcountries.eu/data/cod.svg', 'Congo (Democratic Republic of the)', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(55, 'Cook Islands', 'CK', 'cook-islands', 'https://restcountries.eu/data/cok.svg', 'Cook Islands', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(56, 'Costa Rica', 'CR', 'costa-rica', 'https://restcountries.eu/data/cri.svg', 'Costa Rica', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(57, 'Croatia', 'HR', 'croatia', 'https://restcountries.eu/data/hrv.svg', 'Croatia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(58, 'Cuba', 'CU', 'cuba', 'https://restcountries.eu/data/cub.svg', 'Cuba', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(59, 'Curaçao', 'CW', 'curaao', 'https://restcountries.eu/data/cuw.svg', 'Curaçao', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(60, 'Cyprus', 'CY', 'cyprus', 'https://restcountries.eu/data/cyp.svg', 'Cyprus', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(61, 'Czech Republic', 'CZ', 'czech-republic', 'https://restcountries.eu/data/cze.svg', 'Czech Republic', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(62, 'Denmark', 'DK', 'denmark', 'https://restcountries.eu/data/dnk.svg', 'Denmark', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(63, 'Djibouti', 'DJ', 'djibouti', 'https://restcountries.eu/data/dji.svg', 'Djibouti', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(64, 'Dominica', 'DM', 'dominica', 'https://restcountries.eu/data/dma.svg', 'Dominica', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(65, 'Dominican Republic', 'DO', 'dominican-republic', 'https://restcountries.eu/data/dom.svg', 'Dominican Republic', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(66, 'Ecuador', 'EC', 'ecuador', 'https://restcountries.eu/data/ecu.svg', 'Ecuador', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(67, 'Egypt', 'EG', 'egypt', 'https://restcountries.eu/data/egy.svg', 'Egypt', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(68, 'El Salvador', 'SV', 'el-salvador', 'https://restcountries.eu/data/slv.svg', 'El Salvador', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(69, 'Equatorial Guinea', 'GQ', 'equatorial-guinea', 'https://restcountries.eu/data/gnq.svg', 'Equatorial Guinea', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(70, 'Eritrea', 'ER', 'eritrea', 'https://restcountries.eu/data/eri.svg', 'Eritrea', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(71, 'Estonia', 'EE', 'estonia', 'https://restcountries.eu/data/est.svg', 'Estonia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(72, 'Ethiopia', 'ET', 'ethiopia', 'https://restcountries.eu/data/eth.svg', 'Ethiopia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(73, 'Falkland Islands (Malvinas)', 'FK', 'falkland-islands-malvinas', 'https://restcountries.eu/data/flk.svg', 'Falkland Islands (Malvinas)', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(74, 'Faroe Islands', 'FO', 'faroe-islands', 'https://restcountries.eu/data/fro.svg', 'Faroe Islands', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(75, 'Fiji', 'FJ', 'fiji', 'https://restcountries.eu/data/fji.svg', 'Fiji', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(76, 'Finland', 'FI', 'finland', 'https://restcountries.eu/data/fin.svg', 'Finland', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(77, 'France', 'FR', 'france', 'https://restcountries.eu/data/fra.svg', 'France', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(78, 'French Guiana', 'GF', 'french-guiana', 'https://restcountries.eu/data/guf.svg', 'French Guiana', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(79, 'French Polynesia', 'PF', 'french-polynesia', 'https://restcountries.eu/data/pyf.svg', 'French Polynesia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(80, 'French Southern Territories', 'TF', 'french-southern-territories', 'https://restcountries.eu/data/atf.svg', 'French Southern Territories', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(81, 'Gabon', 'GA', 'gabon', 'https://restcountries.eu/data/gab.svg', 'Gabon', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(82, 'Gambia', 'GM', 'gambia', 'https://restcountries.eu/data/gmb.svg', 'Gambia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(83, 'Georgia', 'GE', 'georgia', 'https://restcountries.eu/data/geo.svg', 'Georgia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(84, 'Germany', 'DE', 'germany', 'https://restcountries.eu/data/deu.svg', 'Germany', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(85, 'Ghana', 'GH', 'ghana', 'https://restcountries.eu/data/gha.svg', 'Ghana', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(86, 'Gibraltar', 'GI', 'gibraltar', 'https://restcountries.eu/data/gib.svg', 'Gibraltar', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(87, 'Greece', 'GR', 'greece', 'https://restcountries.eu/data/grc.svg', 'Greece', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(88, 'Greenland', 'GL', 'greenland', 'https://restcountries.eu/data/grl.svg', 'Greenland', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(89, 'Grenada', 'GD', 'grenada', 'https://restcountries.eu/data/grd.svg', 'Grenada', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(90, 'Guadeloupe', 'GP', 'guadeloupe', 'https://restcountries.eu/data/glp.svg', 'Guadeloupe', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(91, 'Guam', 'GU', 'guam', 'https://restcountries.eu/data/gum.svg', 'Guam', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(92, 'Guatemala', 'GT', 'guatemala', 'https://restcountries.eu/data/gtm.svg', 'Guatemala', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(93, 'Guernsey', 'GG', 'guernsey', 'https://restcountries.eu/data/ggy.svg', 'Guernsey', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(94, 'Guinea', 'GN', 'guinea', 'https://restcountries.eu/data/gin.svg', 'Guinea', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(95, 'Guinea-Bissau', 'GW', 'guineabissau', 'https://restcountries.eu/data/gnb.svg', 'Guinea-Bissau', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(96, 'Guyana', 'GY', 'guyana', 'https://restcountries.eu/data/guy.svg', 'Guyana', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(97, 'Haiti', 'HT', 'haiti', 'https://restcountries.eu/data/hti.svg', 'Haiti', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(98, 'Heard Island and McDonald Islands', 'HM', 'heard-island-and-mcdonald-islands', 'https://restcountries.eu/data/hmd.svg', 'Heard Island and McDonald Islands', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(99, 'Holy See', 'VA', 'holy-see', 'https://restcountries.eu/data/vat.svg', 'Holy See', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(100, 'Honduras', 'HN', 'honduras', 'https://restcountries.eu/data/hnd.svg', 'Honduras', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(101, 'Hong Kong', 'HK', 'hong-kong', 'https://restcountries.eu/data/hkg.svg', 'Hong Kong', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(102, 'Hungary', 'HU', 'hungary', 'https://restcountries.eu/data/hun.svg', 'Hungary', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(103, 'Iceland', 'IS', 'iceland', 'https://restcountries.eu/data/isl.svg', 'Iceland', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(104, 'India', 'IN', 'india', 'https://restcountries.eu/data/ind.svg', 'India', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(105, 'Indonesia', 'ID', 'indonesia', 'https://restcountries.eu/data/idn.svg', 'Indonesia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(106, 'Côte d\'Ivoire', 'CI', 'cte-divoire', 'https://restcountries.eu/data/civ.svg', 'Côte d\'Ivoire', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(107, 'Iran (Islamic Republic of)', 'IR', 'iran-islamic-republic-of', 'https://restcountries.eu/data/irn.svg', 'Iran (Islamic Republic of)', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(108, 'Iraq', 'IQ', 'iraq', 'https://restcountries.eu/data/irq.svg', 'Iraq', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(109, 'Ireland', 'IE', 'ireland', 'https://restcountries.eu/data/irl.svg', 'Ireland', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(110, 'Isle of Man', 'IM', 'isle-of-man', 'https://restcountries.eu/data/imn.svg', 'Isle of Man', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(111, 'Israel', 'IL', 'israel', 'https://restcountries.eu/data/isr.svg', 'Israel', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(112, 'Italy', 'IT', 'italy', 'https://restcountries.eu/data/ita.svg', 'Italy', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(113, 'Jamaica', 'JM', 'jamaica', 'https://restcountries.eu/data/jam.svg', 'Jamaica', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(114, 'Japan', 'JP', 'japan', 'https://restcountries.eu/data/jpn.svg', 'Japan', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(115, 'Jersey', 'JE', 'jersey', 'https://restcountries.eu/data/jey.svg', 'Jersey', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(116, 'Jordan', 'JO', 'jordan', 'https://restcountries.eu/data/jor.svg', 'Jordan', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(117, 'Kazakhstan', 'KZ', 'kazakhstan', 'https://restcountries.eu/data/kaz.svg', 'Kazakhstan', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(118, 'Kenya', 'KE', 'kenya', 'https://restcountries.eu/data/ken.svg', 'Kenya', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(119, 'Kiribati', 'KI', 'kiribati', 'https://restcountries.eu/data/kir.svg', 'Kiribati', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(120, 'Kuwait', 'KW', 'kuwait', 'https://restcountries.eu/data/kwt.svg', 'Kuwait', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(121, 'Kyrgyzstan', 'KG', 'kyrgyzstan', 'https://restcountries.eu/data/kgz.svg', 'Kyrgyzstan', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(122, 'Lao People\'s Democratic Republic', 'LA', 'lao-peoples-democratic-republic', 'https://restcountries.eu/data/lao.svg', 'Lao People\'s Democratic Republic', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(123, 'Latvia', 'LV', 'latvia', 'https://restcountries.eu/data/lva.svg', 'Latvia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(124, 'Lebanon', 'LB', 'lebanon', 'https://restcountries.eu/data/lbn.svg', 'Lebanon', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(125, 'Lesotho', 'LS', 'lesotho', 'https://restcountries.eu/data/lso.svg', 'Lesotho', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(126, 'Liberia', 'LR', 'liberia', 'https://restcountries.eu/data/lbr.svg', 'Liberia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(127, 'Libya', 'LY', 'libya', 'https://restcountries.eu/data/lby.svg', 'Libya', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(128, 'Liechtenstein', 'LI', 'liechtenstein', 'https://restcountries.eu/data/lie.svg', 'Liechtenstein', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(129, 'Lithuania', 'LT', 'lithuania', 'https://restcountries.eu/data/ltu.svg', 'Lithuania', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(130, 'Luxembourg', 'LU', 'luxembourg', 'https://restcountries.eu/data/lux.svg', 'Luxembourg', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(131, 'Macao', 'MO', 'macao', 'https://restcountries.eu/data/mac.svg', 'Macao', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(132, 'Macedonia (the former Yugoslav Republic of)', 'MK', 'macedonia-the-former-yugoslav-republic-of', 'https://restcountries.eu/data/mkd.svg', 'Macedonia (the former Yugoslav Republic of)', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(133, 'Madagascar', 'MG', 'madagascar', 'https://restcountries.eu/data/mdg.svg', 'Madagascar', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(134, 'Malawi', 'MW', 'malawi', 'https://restcountries.eu/data/mwi.svg', 'Malawi', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(135, 'Malaysia', 'MY', 'malaysia', 'https://restcountries.eu/data/mys.svg', 'Malaysia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(136, 'Maldives', 'MV', 'maldives', 'https://restcountries.eu/data/mdv.svg', 'Maldives', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(137, 'Mali', 'ML', 'mali', 'https://restcountries.eu/data/mli.svg', 'Mali', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(138, 'Malta', 'MT', 'malta', 'https://restcountries.eu/data/mlt.svg', 'Malta', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(139, 'Marshall Islands', 'MH', 'marshall-islands', 'https://restcountries.eu/data/mhl.svg', 'Marshall Islands', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(140, 'Martinique', 'MQ', 'martinique', 'https://restcountries.eu/data/mtq.svg', 'Martinique', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(141, 'Mauritania', 'MR', 'mauritania', 'https://restcountries.eu/data/mrt.svg', 'Mauritania', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(142, 'Mauritius', 'MU', 'mauritius', 'https://restcountries.eu/data/mus.svg', 'Mauritius', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(143, 'Mayotte', 'YT', 'mayotte', 'https://restcountries.eu/data/myt.svg', 'Mayotte', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(144, 'Mexico', 'MX', 'mexico', 'https://restcountries.eu/data/mex.svg', 'Mexico', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(145, 'Micronesia (Federated States of)', 'FM', 'micronesia-federated-states-of', 'https://restcountries.eu/data/fsm.svg', 'Micronesia (Federated States of)', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(146, 'Moldova (Republic of)', 'MD', 'moldova-republic-of', 'https://restcountries.eu/data/mda.svg', 'Moldova (Republic of)', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(147, 'Monaco', 'MC', 'monaco', 'https://restcountries.eu/data/mco.svg', 'Monaco', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(148, 'Mongolia', 'MN', 'mongolia', 'https://restcountries.eu/data/mng.svg', 'Mongolia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(149, 'Montenegro', 'ME', 'montenegro', 'https://restcountries.eu/data/mne.svg', 'Montenegro', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(150, 'Montserrat', 'MS', 'montserrat', 'https://restcountries.eu/data/msr.svg', 'Montserrat', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(151, 'Morocco', 'MA', 'morocco', 'https://restcountries.eu/data/mar.svg', 'Morocco', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(152, 'Mozambique', 'MZ', 'mozambique', 'https://restcountries.eu/data/moz.svg', 'Mozambique', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(153, 'Myanmar', 'MM', 'myanmar', 'https://restcountries.eu/data/mmr.svg', 'Myanmar', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(154, 'Namibia', 'NA', 'namibia', 'https://restcountries.eu/data/nam.svg', 'Namibia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(155, 'Nauru', 'NR', 'nauru', 'https://restcountries.eu/data/nru.svg', 'Nauru', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(156, 'Nepal', 'NP', 'nepal', 'https://restcountries.eu/data/npl.svg', 'Nepal', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(157, 'Netherlands', 'NL', 'netherlands', 'https://restcountries.eu/data/nld.svg', 'Netherlands', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(158, 'New Caledonia', 'NC', 'new-caledonia', 'https://restcountries.eu/data/ncl.svg', 'New Caledonia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(159, 'New Zealand', 'NZ', 'new-zealand', 'https://restcountries.eu/data/nzl.svg', 'New Zealand', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(160, 'Nicaragua', 'NI', 'nicaragua', 'https://restcountries.eu/data/nic.svg', 'Nicaragua', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(161, 'Niger', 'NE', 'niger', 'https://restcountries.eu/data/ner.svg', 'Niger', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(162, 'Nigeria', 'NG', 'nigeria', 'https://restcountries.eu/data/nga.svg', 'Nigeria', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(163, 'Niue', 'NU', 'niue', 'https://restcountries.eu/data/niu.svg', 'Niue', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(164, 'Norfolk Island', 'NF', 'norfolk-island', 'https://restcountries.eu/data/nfk.svg', 'Norfolk Island', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(165, 'Korea (Democratic People\'s Republic of)', 'KP', 'korea-democratic-peoples-republic-of', 'https://restcountries.eu/data/prk.svg', 'Korea (Democratic People\'s Republic of)', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(166, 'Northern Mariana Islands', 'MP', 'northern-mariana-islands', 'https://restcountries.eu/data/mnp.svg', 'Northern Mariana Islands', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(167, 'Norway', 'NO', 'norway', 'https://restcountries.eu/data/nor.svg', 'Norway', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(168, 'Oman', 'OM', 'oman', 'https://restcountries.eu/data/omn.svg', 'Oman', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(169, 'Pakistan', 'PK', 'pakistan', 'https://restcountries.eu/data/pak.svg', 'Pakistan', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(170, 'Palau', 'PW', 'palau', 'https://restcountries.eu/data/plw.svg', 'Palau', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(171, 'Palestine, State of', 'PS', 'palestine-state-of', 'https://restcountries.eu/data/pse.svg', 'Palestine, State of', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(172, 'Panama', 'PA', 'panama', 'https://restcountries.eu/data/pan.svg', 'Panama', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(173, 'Papua New Guinea', 'PG', 'papua-new-guinea', 'https://restcountries.eu/data/png.svg', 'Papua New Guinea', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(174, 'Paraguay', 'PY', 'paraguay', 'https://restcountries.eu/data/pry.svg', 'Paraguay', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(175, 'Peru', 'PE', 'peru', 'https://restcountries.eu/data/per.svg', 'Peru', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(176, 'Philippines', 'PH', 'philippines', 'https://restcountries.eu/data/phl.svg', 'Philippines', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(177, 'Pitcairn', 'PN', 'pitcairn', 'https://restcountries.eu/data/pcn.svg', 'Pitcairn', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(178, 'Poland', 'PL', 'poland', 'https://restcountries.eu/data/pol.svg', 'Poland', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(179, 'Portugal', 'PT', 'portugal', 'https://restcountries.eu/data/prt.svg', 'Portugal', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(180, 'Puerto Rico', 'PR', 'puerto-rico', 'https://restcountries.eu/data/pri.svg', 'Puerto Rico', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(181, 'Qatar', 'QA', 'qatar', 'https://restcountries.eu/data/qat.svg', 'Qatar', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(182, 'Republic of Kosovo', 'XK', 'republic-of-kosovo', 'https://restcountries.eu/data/kos.svg', 'Republic of Kosovo', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(183, 'Réunion', 'RE', 'runion', 'https://restcountries.eu/data/reu.svg', 'Réunion', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(184, 'Romania', 'RO', 'romania', 'https://restcountries.eu/data/rou.svg', 'Romania', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(185, 'Russian Federation', 'RU', 'russian-federation', 'https://restcountries.eu/data/rus.svg', 'Russian Federation', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(186, 'Rwanda', 'RW', 'rwanda', 'https://restcountries.eu/data/rwa.svg', 'Rwanda', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(187, 'Saint Barthélemy', 'BL', 'saint-barthlemy', 'https://restcountries.eu/data/blm.svg', 'Saint Barthélemy', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(188, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'saint-helena-ascension-and-tristan-da-cunha', 'https://restcountries.eu/data/shn.svg', 'Saint Helena, Ascension and Tristan da Cunha', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(189, 'Saint Kitts and Nevis', 'KN', 'saint-kitts-and-nevis', 'https://restcountries.eu/data/kna.svg', 'Saint Kitts and Nevis', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(190, 'Saint Lucia', 'LC', 'saint-lucia', 'https://restcountries.eu/data/lca.svg', 'Saint Lucia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(191, 'Saint Martin (French part)', 'MF', 'saint-martin-french-part', 'https://restcountries.eu/data/maf.svg', 'Saint Martin (French part)', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(192, 'Saint Pierre and Miquelon', 'PM', 'saint-pierre-and-miquelon', 'https://restcountries.eu/data/spm.svg', 'Saint Pierre and Miquelon', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(193, 'Saint Vincent and the Grenadines', 'VC', 'saint-vincent-and-the-grenadines', 'https://restcountries.eu/data/vct.svg', 'Saint Vincent and the Grenadines', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(194, 'Samoa', 'WS', 'samoa', 'https://restcountries.eu/data/wsm.svg', 'Samoa', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(195, 'San Marino', 'SM', 'san-marino', 'https://restcountries.eu/data/smr.svg', 'San Marino', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(196, 'Sao Tome and Principe', 'ST', 'sao-tome-and-principe', 'https://restcountries.eu/data/stp.svg', 'Sao Tome and Principe', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(197, 'Saudi Arabia', 'SA', 'saudi-arabia', 'https://restcountries.eu/data/sau.svg', 'Saudi Arabia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(198, 'Senegal', 'SN', 'senegal', 'https://restcountries.eu/data/sen.svg', 'Senegal', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(199, 'Serbia', 'RS', 'serbia', 'https://restcountries.eu/data/srb.svg', 'Serbia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(200, 'Seychelles', 'SC', 'seychelles', 'https://restcountries.eu/data/syc.svg', 'Seychelles', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(201, 'Sierra Leone', 'SL', 'sierra-leone', 'https://restcountries.eu/data/sle.svg', 'Sierra Leone', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(202, 'Singapore', 'SG', 'singapore', 'https://restcountries.eu/data/sgp.svg', 'Singapore', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(203, 'Sint Maarten (Dutch part)', 'SX', 'sint-maarten-dutch-part', 'https://restcountries.eu/data/sxm.svg', 'Sint Maarten (Dutch part)', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(204, 'Slovakia', 'SK', 'slovakia', 'https://restcountries.eu/data/svk.svg', 'Slovakia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(205, 'Slovenia', 'SI', 'slovenia', 'https://restcountries.eu/data/svn.svg', 'Slovenia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(206, 'Solomon Islands', 'SB', 'solomon-islands', 'https://restcountries.eu/data/slb.svg', 'Solomon Islands', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(207, 'Somalia', 'SO', 'somalia', 'https://restcountries.eu/data/som.svg', 'Somalia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(208, 'South Africa', 'ZA', 'south-africa', 'https://restcountries.eu/data/zaf.svg', 'South Africa', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(209, 'South Georgia and the South Sandwich Islands', 'GS', 'south-georgia-and-the-south-sandwich-islands', 'https://restcountries.eu/data/sgs.svg', 'South Georgia and the South Sandwich Islands', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(210, 'Korea (Republic of)', 'KR', 'korea-republic-of', 'https://restcountries.eu/data/kor.svg', 'Korea (Republic of)', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(211, 'South Sudan', 'SS', 'south-sudan', 'https://restcountries.eu/data/ssd.svg', 'South Sudan', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(212, 'Spain', 'ES', 'spain', 'https://restcountries.eu/data/esp.svg', 'Spain', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(213, 'Sri Lanka', 'LK', 'sri-lanka', 'https://restcountries.eu/data/lka.svg', 'Sri Lanka', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(214, 'Sudan', 'SD', 'sudan', 'https://restcountries.eu/data/sdn.svg', 'Sudan', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(215, 'Suriname', 'SR', 'suriname', 'https://restcountries.eu/data/sur.svg', 'Suriname', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(216, 'Svalbard and Jan Mayen', 'SJ', 'svalbard-and-jan-mayen', 'https://restcountries.eu/data/sjm.svg', 'Svalbard and Jan Mayen', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(217, 'Swaziland', 'SZ', 'swaziland', 'https://restcountries.eu/data/swz.svg', 'Swaziland', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(218, 'Sweden', 'SE', 'sweden', 'https://restcountries.eu/data/swe.svg', 'Sweden', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(219, 'Switzerland', 'CH', 'switzerland', 'https://restcountries.eu/data/che.svg', 'Switzerland', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(220, 'Syrian Arab Republic', 'SY', 'syrian-arab-republic', 'https://restcountries.eu/data/syr.svg', 'Syrian Arab Republic', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(221, 'Taiwan', 'TW', 'taiwan', 'https://restcountries.eu/data/twn.svg', 'Taiwan', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(222, 'Tajikistan', 'TJ', 'tajikistan', 'https://restcountries.eu/data/tjk.svg', 'Tajikistan', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(223, 'Tanzania, United Republic of', 'TZ', 'tanzania-united-republic-of', 'https://restcountries.eu/data/tza.svg', 'Tanzania, United Republic of', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(224, 'Thailand', 'TH', 'thailand', 'https://restcountries.eu/data/tha.svg', 'Thailand', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(225, 'Timor-Leste', 'TL', 'timorleste', 'https://restcountries.eu/data/tls.svg', 'Timor-Leste', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(226, 'Togo', 'TG', 'togo', 'https://restcountries.eu/data/tgo.svg', 'Togo', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(227, 'Tokelau', 'TK', 'tokelau', 'https://restcountries.eu/data/tkl.svg', 'Tokelau', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(228, 'Tonga', 'TO', 'tonga', 'https://restcountries.eu/data/ton.svg', 'Tonga', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(229, 'Trinidad and Tobago', 'TT', 'trinidad-and-tobago', 'https://restcountries.eu/data/tto.svg', 'Trinidad and Tobago', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(230, 'Tunisia', 'TN', 'tunisia', 'https://restcountries.eu/data/tun.svg', 'Tunisia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(231, 'Turkey', 'TR', 'turkey', 'https://restcountries.eu/data/tur.svg', 'Turkey', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(232, 'Turkmenistan', 'TM', 'turkmenistan', 'https://restcountries.eu/data/tkm.svg', 'Turkmenistan', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(233, 'Turks and Caicos Islands', 'TC', 'turks-and-caicos-islands', 'https://restcountries.eu/data/tca.svg', 'Turks and Caicos Islands', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(234, 'Tuvalu', 'TV', 'tuvalu', 'https://restcountries.eu/data/tuv.svg', 'Tuvalu', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(235, 'Uganda', 'UG', 'uganda', 'https://restcountries.eu/data/uga.svg', 'Uganda', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(236, 'Ukraine', 'UA', 'ukraine', 'https://restcountries.eu/data/ukr.svg', 'Ukraine', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(237, 'United Arab Emirates', 'AE', 'united-arab-emirates', 'https://restcountries.eu/data/are.svg', 'United Arab Emirates', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(238, 'United Kingdom of Great Britain and Northern Ireland', 'GB', 'united-kingdom-of-great-britain-and-northern-ireland', 'https://restcountries.eu/data/gbr.svg', 'United Kingdom of Great Britain and Northern Ireland', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(239, 'United States of America', 'US', 'united-states-of-america', 'https://restcountries.eu/data/usa.svg', 'United States of America', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(240, 'Uruguay', 'UY', 'uruguay', 'https://restcountries.eu/data/ury.svg', 'Uruguay', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(241, 'Uzbekistan', 'UZ', 'uzbekistan', 'https://restcountries.eu/data/uzb.svg', 'Uzbekistan', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(242, 'Vanuatu', 'VU', 'vanuatu', 'https://restcountries.eu/data/vut.svg', 'Vanuatu', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(243, 'Venezuela (Bolivarian Republic of)', 'VE', 'venezuela-bolivarian-republic-of', 'https://restcountries.eu/data/ven.svg', 'Venezuela (Bolivarian Republic of)', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(244, 'Viet Nam', 'VN', 'viet-nam', 'https://restcountries.eu/data/vnm.svg', 'Viet Nam', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(245, 'Wallis and Futuna', 'WF', 'wallis-and-futuna', 'https://restcountries.eu/data/wlf.svg', 'Wallis and Futuna', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(246, 'Western Sahara', 'EH', 'western-sahara', 'https://restcountries.eu/data/esh.svg', 'Western Sahara', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(247, 'Yemen', 'YE', 'yemen', 'https://restcountries.eu/data/yem.svg', 'Yemen', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(248, 'Zambia', 'ZM', 'zambia', 'https://restcountries.eu/data/zmb.svg', 'Zambia', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(249, 'Zimbabwe', 'ZW', 'zimbabwe', 'https://restcountries.eu/data/zwe.svg', 'Zimbabwe', '2021-01-14 07:49:27', '2021-01-14 07:49:27');

-- --------------------------------------------------------

--
-- Table structure for table `degrees`
--

CREATE TABLE `degrees` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `desc` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `degrees`
--

INSERT INTO `degrees` (`id`, `title`, `desc`, `createdAt`, `updatedAt`) VALUES
(1, 'Ond / Diploma', 'Ond', '2021-03-11 01:46:30', '2021-03-11 01:46:30'),
(2, 'Bsc', 'BSC', '2021-03-11 01:46:30', '2021-03-11 01:46:30'),
(3, 'Hnd', 'Hnd', '2021-03-11 01:46:30', '2021-03-11 01:46:30'),
(4, 'Msc', 'MSC', '2021-03-11 01:46:30', '2021-03-11 01:46:30'),
(5, 'Phd / Doctorate', 'PHD', '2021-03-11 01:46:30', '2021-03-11 01:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `deported_countries`
--

CREATE TABLE `deported_countries` (
  `countryId` int(11) NOT NULL,
  `deportedId` int(11) NOT NULL,
  `deportedType` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deported_countries`
--

INSERT INTO `deported_countries` (`countryId`, `deportedId`, `deportedType`, `createdAt`, `updatedAt`) VALUES
(2, 1, 'stkitt', '2021-01-25 15:00:00', '2021-01-25 15:00:00'),
(3, 11, 'antigua', '2021-01-25 13:56:02', '2021-01-25 13:56:02'),
(4, 11, 'antigua', '2021-01-25 13:56:02', '2021-01-25 13:56:02'),
(5, 1, 'stkitt', '2021-01-25 15:00:00', '2021-01-25 15:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `funds`
--

CREATE TABLE `funds` (
  `id` int(11) NOT NULL,
  `min` int(11) NOT NULL DEFAULT '0',
  `max` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `funds`
--

INSERT INTO `funds` (`id`, `min`, `max`, `type`, `createdAt`, `updatedAt`) VALUES
(1, 0, 350000, 'worth', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(2, 350000, 500000, 'worth', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(3, 500000, 1000000, 'worth', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(4, 1000000, 1500000, 'worth', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(5, 2000000, 2500000, 'worth', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(6, 2500000, 0, 'worth', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(7, 150000, 250000, 'invest', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(8, 250000, 500000, 'invest', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(9, 500000, 1000000, 'invest', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(10, 1000000, 0, 'invest', '2021-01-14 07:49:27', '2021-01-14 07:49:27'),
(11, 100000, 150000, 'invest', '2021-02-14 01:31:39', '2021-02-14 01:31:39'),
(12, 0, 25000, 'invest', '2021-04-07 04:21:43', '2021-04-07 04:21:43'),
(13, 25000, 50000, 'invest', '2021-04-07 04:21:43', '2021-04-07 04:21:43'),
(14, 50000, 100000, 'invest', '2021-04-07 04:23:46', '2021-04-07 04:23:46');

-- --------------------------------------------------------

--
-- Table structure for table `general_immigrants`
--

CREATE TABLE `general_immigrants` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dob` datetime NOT NULL,
  `children` int(11) NOT NULL DEFAULT '0',
  `phone` varchar(255) NOT NULL,
  `job_offer` tinyint(1) DEFAULT '0',
  `family_in_canada` tinyint(1) DEFAULT '0',
  `criminal_record` tinyint(1) DEFAULT '0',
  `medical_condition` tinyint(1) DEFAULT '0',
  `comment` text,
  `group` int(11) DEFAULT '0',
  `eligible_party` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `maritalStatusId` int(11) DEFAULT NULL,
  `citizenshipId` int(11) DEFAULT NULL,
  `residenceId` int(11) DEFAULT NULL,
  `client_status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `general_immigrants`
--

INSERT INTO `general_immigrants` (`id`, `first_name`, `last_name`, `email`, `dob`, `children`, `phone`, `job_offer`, `family_in_canada`, `criminal_record`, `medical_condition`, `comment`, `group`, `eligible_party`, `createdAt`, `updatedAt`, `maritalStatusId`, `citizenshipId`, `residenceId`, `client_status`) VALUES
(11, 'Nwosu', 'Ebuka', 'ebukanwosu45@gmail.com', '1993-06-10 23:00:00', 1, '08107539187', 0, 0, 0, 0, 'I\'d like if the process is sped up', 5, 'spouse', '2021-04-06 01:17:31', '2021-04-08 14:07:06', NULL, 162, 2, 1),
(12, 'Nwosu', 'Ebuka', 'cybertechdigitals@gmail.com', '1993-06-10 23:00:00', 1, '08107539186', 0, 0, 0, 0, 'I\'d like if the process is sped up', 5, 'applicant', '2021-04-06 01:17:58', '2021-04-06 01:17:58', NULL, 162, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `description`, `createdAt`, `updatedAt`) VALUES
(1, 'English', NULL, '2021-02-14 01:33:25', '2021-02-14 01:33:25'),
(2, 'French', 'French', '2021-04-05 00:32:00', '2021-04-05 00:32:00'),
(3, 'Spanish', 'Spanish', '2021-04-05 00:32:00', '2021-04-05 00:32:00');

-- --------------------------------------------------------

--
-- Table structure for table `language_proficiencies`
--

CREATE TABLE `language_proficiencies` (
  `id` int(11) NOT NULL,
  `level` varchar(255) NOT NULL,
  `immigrantType` varchar(255) DEFAULT NULL,
  `refType` varchar(255) DEFAULT NULL,
  `immigrantId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `languageId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language_proficiencies`
--

INSERT INTO `language_proficiencies` (`id`, `level`, `immigrantType`, `refType`, `immigrantId`, `createdAt`, `updatedAt`, `languageId`) VALUES
(6, 'High', 'general', 'applicant', 1, '2021-04-05 23:32:59', '2021-04-05 23:32:59', 1),
(7, 'High', 'general', 'spouse', 1, '2021-04-05 23:32:59', '2021-04-05 23:32:59', 3),
(10, 'High', 'general', 'applicant', 1, '2021-04-05 23:36:34', '2021-04-05 23:36:34', 1),
(11, 'High', 'general', 'spouse', 1, '2021-04-05 23:36:34', '2021-04-05 23:36:34', 3),
(12, 'High', 'general', 'applicant', 2, '2021-04-05 23:39:14', '2021-04-05 23:39:14', 1),
(13, 'High', 'general', 'spouse', 2, '2021-04-05 23:39:14', '2021-04-05 23:39:14', 3),
(14, 'High', 'general', 'applicant', 3, '2021-04-05 23:40:01', '2021-04-05 23:40:01', 1),
(15, 'High', 'general', 'spouse', 3, '2021-04-05 23:40:01', '2021-04-05 23:40:01', 3),
(16, 'High', 'general', 'applicant', 4, '2021-04-05 23:51:45', '2021-04-05 23:51:45', 1),
(17, 'High', 'general', 'spouse', 4, '2021-04-05 23:51:45', '2021-04-05 23:51:45', 3),
(18, 'High', 'general', 'applicant', 5, '2021-04-06 00:23:46', '2021-04-06 00:23:46', 1),
(19, 'High', 'general', 'spouse', 5, '2021-04-06 00:23:46', '2021-04-06 00:23:46', 3),
(20, 'High', 'general', 'applicant', 6, '2021-04-06 00:24:44', '2021-04-06 00:24:44', 1),
(21, 'High', 'general', 'spouse', 6, '2021-04-06 00:24:44', '2021-04-06 00:24:44', 3),
(22, 'High', 'general', 'applicant', 7, '2021-04-06 00:25:03', '2021-04-06 00:25:03', 1),
(23, 'High', 'general', 'spouse', 7, '2021-04-06 00:25:03', '2021-04-06 00:25:03', 3),
(24, 'High', 'general', 'applicant', 8, '2021-04-06 00:27:54', '2021-04-06 00:27:54', 1),
(25, 'High', 'general', 'spouse', 8, '2021-04-06 00:27:54', '2021-04-06 00:27:54', 3),
(26, 'High', 'general', 'applicant', 9, '2021-04-06 00:30:28', '2021-04-06 00:30:28', 1),
(27, 'High', 'general', 'spouse', 9, '2021-04-06 00:30:28', '2021-04-06 00:30:28', 3),
(28, 'High', 'general', 'applicant', 10, '2021-04-06 00:36:07', '2021-04-06 00:36:07', 1),
(29, 'High', 'general', 'spouse', 12, '2021-04-06 00:36:07', '2021-04-06 00:36:07', 3),
(30, 'High', 'general', 'applicant', 11, '2021-04-06 01:17:31', '2021-04-06 01:17:31', 1),
(31, 'High', 'general', 'spouse', 14, '2021-04-06 01:17:31', '2021-04-06 01:17:31', 3),
(32, 'High', 'general', 'applicant', 12, '2021-04-06 01:17:58', '2021-04-06 01:17:58', 1),
(33, 'High', 'general', 'spouse', 15, '2021-04-06 01:17:58', '2021-04-06 01:17:58', 3);

-- --------------------------------------------------------

--
-- Table structure for table `mailQueues`
--

CREATE TABLE `mailQueues` (
  `id` int(11) NOT NULL,
  `to` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `from_address` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `status` varchar(255) DEFAULT 'waiting',
  `title` varchar(255) DEFAULT NULL,
  `schedule` datetime NOT NULL,
  `immigrantType` varchar(255) DEFAULT NULL,
  `immigrantId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mailQueues`
--

INSERT INTO `mailQueues` (`id`, `to`, `from_name`, `from_address`, `subject`, `message`, `status`, `title`, `schedule`, `immigrantType`, `immigrantId`, `createdAt`, `updatedAt`) VALUES
(396, 'rawlinsobas54@yahoomail.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Rawlins,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'Can\'t send mail - all recipients were rejected: 550-The mail server could not deliver mail to rawlinsobas54@yahoomail.com.  The\n550-account or domain may not exist, they may be blacklisted, or missing the\n550 proper dns entries.', '2nd Mail to Business Immigrant', '2021-04-25 07:38:25', 'business', 243, '2021-04-25 07:28:25', '2021-05-03 10:15:47'),
(413, 'xaleglobalservices@gmail.con', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Okparaki,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'Can\'t send mail - all recipients were rejected: 550-The mail server could not deliver mail to xaleglobalservices@gmail.con. \n550-The account or domain may not exist, they may be blacklisted, or missing\n550 the proper dns entries.', '2nd Mail to General Immigrant', '2021-04-26 08:44:52', 'general', 308, '2021-04-26 08:34:52', '2021-05-03 10:15:53'),
(414, 'qasimdiction18@gmail.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello kazeem,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-26 10:09:33', 'business', 254, '2021-04-26 09:59:33', '2021-05-03 10:11:33'),
(415, 'nnuchinecheremjoel@gmail.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Chinecherem,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-26 10:30:22', 'business', 255, '2021-04-26 10:20:22', '2021-05-03 10:16:07'),
(416, 'arollypepe@gmail.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Roland,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-26 10:54:43', 'general', 309, '2021-04-26 10:44:43', '2021-05-03 10:18:37'),
(417, 'grisel.taiwo@yahoo.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Griselda,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-26 12:33:36', 'business', 256, '2021-04-26 12:23:36', '2021-05-03 10:19:08'),
(418, 'nmifeanyichukwu@gmail.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Martins ,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-26 14:00:09', 'business', 257, '2021-04-26 13:50:09', '2021-05-03 10:19:38');
INSERT INTO `mailQueues` (`id`, `to`, `from_name`, `from_address`, `subject`, `message`, `status`, `title`, `schedule`, `immigrantType`, `immigrantId`, `createdAt`, `updatedAt`) VALUES
(419, 'martinsnwosu@sevicpdc.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Nwosu,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-26 14:04:39', 'business', 258, '2021-04-26 13:54:39', '2021-05-03 10:20:07'),
(420, 'nmifeanyichukwu@gmail.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Nwosu,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-26 14:15:57', 'general', 310, '2021-04-26 14:05:57', '2021-05-03 10:20:37'),
(421, 'yodemosu@yahoo.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello ODEMOSU,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-26 14:34:51', 'business', 259, '2021-04-26 14:24:51', '2021-05-03 10:21:08'),
(422, 'a_yemmy@yahoo.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Yemi,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-26 15:42:01', 'business', 260, '2021-04-26 15:32:01', '2021-05-03 10:21:42'),
(423, 'ezigod4real@yahoo.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Eucharia,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-26 15:43:10', 'general', 311, '2021-04-26 15:33:10', '2021-05-03 10:39:08'),
(424, 'budee51@gmail.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Abiodun,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-26 16:43:09', 'general', 312, '2021-04-26 16:33:09', '2021-05-03 10:50:38'),
(425, 'obisunday37@gmail.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello sunday,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-26 16:49:13', 'business', 261, '2021-04-26 16:39:13', '2021-05-03 10:50:30');
INSERT INTO `mailQueues` (`id`, `to`, `from_name`, `from_address`, `subject`, `message`, `status`, `title`, `schedule`, `immigrantType`, `immigrantId`, `createdAt`, `updatedAt`) VALUES
(426, 'felmakina@yahoo.co.uk', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello OLUFEMI,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-26 18:46:40', 'business', 262, '2021-04-26 18:36:40', '2021-05-03 10:50:30'),
(427, 'tunshow2001@yahoo.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Tunji,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-26 19:05:53', 'business', 263, '2021-04-26 18:55:53', '2021-05-03 10:50:35'),
(428, 'olalekan.shobowale76@gmail.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello OLALEKAN,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-26 21:14:48', 'general', 313, '2021-04-26 21:04:48', '2021-05-03 10:50:30'),
(429, 'vickylasky@gmail.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Victor,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-26 21:31:05', 'business', 264, '2021-04-26 21:21:05', '2021-05-03 10:50:38'),
(430, 'chdnmjcnt@gmail.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello AKAHIE,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-26 21:56:01', 'general', 314, '2021-04-26 21:46:01', '2021-05-03 10:50:35'),
(431, 'funmirichy2015@gmail.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Funmi,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-27 02:40:18', 'business', 265, '2021-04-27 02:30:18', '2021-05-03 10:50:39'),
(432, 'muhsty@yahoo.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Mustapha,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-27 03:19:39', 'general', 315, '2021-04-27 03:09:39', '2021-05-03 10:50:50');
INSERT INTO `mailQueues` (`id`, `to`, `from_name`, `from_address`, `subject`, `message`, `status`, `title`, `schedule`, `immigrantType`, `immigrantId`, `createdAt`, `updatedAt`) VALUES
(433, 'chidi.ugbogulu@yahoo.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Chidi,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-27 04:59:45', 'business', 266, '2021-04-27 04:49:45', '2021-05-03 10:50:27'),
(434, 'oreoluwaakinfenwa27@gmail.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Oreoluwa ,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-27 06:54:19', 'general', 316, '2021-04-27 06:44:19', '2021-05-03 10:50:30'),
(435, 'collarsnlapels1415@gmail.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Teju,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-27 08:45:17', 'business', 267, '2021-04-27 08:35:17', '2021-05-03 10:50:31'),
(436, 'adeyemievan@yahoo.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Adeyemi,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-27 10:46:31', 'general', 317, '2021-04-27 10:36:31', '2021-05-03 10:50:53'),
(437, 'atobatele8011@gmail.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Awokojo,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-27 13:25:49', 'general', 318, '2021-04-27 13:15:49', '2021-05-03 10:50:39'),
(438, 'ichonoko@gmail.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Samuel,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-27 19:09:05', 'business', 268, '2021-04-27 18:59:05', '2021-05-03 10:50:38'),
(439, 'vickylasky@gmail.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Victor ,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-27 21:42:16', 'general', 319, '2021-04-27 21:32:16', '2021-05-03 10:50:53');
INSERT INTO `mailQueues` (`id`, `to`, `from_name`, `from_address`, `subject`, `message`, `status`, `title`, `schedule`, `immigrantType`, `immigrantId`, `createdAt`, `updatedAt`) VALUES
(440, 'oludolapoajakaye@gmail.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Oludolapo,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-28 14:42:52', 'general', 320, '2021-04-28 14:32:52', '2021-05-03 10:50:35'),
(441, 's@gmail.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Shy,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-28 15:29:06', 'general', 321, '2021-04-28 15:19:06', '2021-05-03 10:50:39'),
(442, 'uchenduandrew@yahoo.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Andrew,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-28 18:49:37', 'general', 322, '2021-04-28 18:39:37', '2021-05-03 10:21:46'),
(443, 'olumuyiwa24@yahoo.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Afolabi,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-29 11:38:59', 'general', 323, '2021-04-29 11:28:59', '2021-05-03 10:21:54'),
(444, 'faithegidi@yahoo.co.uk', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Faith,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-29 21:03:05', 'business', 269, '2021-04-29 20:53:05', '2021-05-03 10:21:54'),
(445, 'jacinta.adinya1@gmail.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Jacinta ,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-30 12:12:42', 'general', 324, '2021-04-30 12:02:42', '2021-05-03 10:21:50'),
(446, 'sertac.akyurek@live.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Sertac,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-30 13:32:38', 'general', 325, '2021-04-30 13:22:38', '2021-05-03 10:21:58');
INSERT INTO `mailQueues` (`id`, `to`, `from_name`, `from_address`, `subject`, `message`, `status`, `title`, `schedule`, `immigrantType`, `immigrantId`, `createdAt`, `updatedAt`) VALUES
(447, 'oma4az@yahoo.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Raymond ,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-04-30 14:47:13', 'general', 326, '2021-04-30 14:37:13', '2021-05-03 10:21:50'),
(448, 'spectator2@gmail.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Abdul,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-04-30 23:41:26', 'business', 270, '2021-04-30 23:31:26', '2021-05-03 10:21:55'),
(449, 'rhyneresourcesng@gmail.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Henry,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-05-01 13:37:37', 'business', 271, '2021-05-01 13:27:37', '2021-05-03 10:21:54'),
(450, 'johnfyne1@gmail.com', 'Loft Immigration | General Assessment', 'immigrants@loftimmigration.com', 'Application Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        General Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Fyne,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to General Immigrant', '2021-05-01 18:15:18', 'general', 327, '2021-05-01 18:05:18', '2021-05-03 10:21:54'),
(453, 'ebukanwosu45@gmail.com', 'Loft Immigration | Canada Business Immigration', 'clientsupport@loftimmigration.com', 'Assessment Reviewed', '\n\n  <div\n  style=\"\n    border-radius: 3px;\n    border-top: 40px solid rgb(245, 245, 245);\n    border-bottom: 10px solid rgb(245, 245, 245);\n    border-right: 10px solid rgb(245, 245, 245);\n    border-left: 10px solid rgb(245, 245, 245);\n    font-family: \'Trebuchet MS\', \'Lucida Sans Unicode\', \'Lucida Grande\',\n      \'Lucida Sans\', Arial, sans-serif;\n    color: #434343;\n    line-height: 23px;\n    width: 90%;\n    max-width: 500px;\n    margin-right: auto;\n    margin-left: auto;\n    text-align: justify;\n  \"\n>\n  <div\n    style=\"\n      box-shadow: 0px -5px 6px rgb(216, 216, 216);\n      padding: 5px 10px;\n      border-radius: 3px 3px 0px 0px;\n      border-bottom: 1px solid #f5f5f5;\n    \"\n  >\n    <div style=\"width: 20%; display: inline-block\">\n      <img\n        src=\"https://loftimmigration.com/wp-content/uploads/2020/12/LOFT-XMAS-LOGO-1.png\"\n        alt=\"Loft Immigration\"\n        width=\"80px\"\n        height=\"auto\"\n      />\n    </div>\n    <div style=\"width: 78%; display: inline-block\">\n      <h4\n        style=\"\n          text-align: center;\n          font-family: Georgia, \'Times New Roman\', Times, serif;\n          margin: 0px;\n          color: #e50404;\n        \"\n      >\n        Business Assessment\n      </h4>\n    </div>\n  </div>\n  <div style=\"padding: 20px\">\n    <p>Hello Ebuka,</p>\n    <p>\n      Thank you for taking the time to fill the assessment form; we have reviewed it. We will like to discuss it with you and proffer your best path to Canada based on your circumstance.\n\n    </p>\n    <p>\n        To discuss your Canada business immigration path/options, we offer you a FREE initial consultation for 5-10 minutes to discuss with our licensed immigration specialist. Contact us here - <a href=\"https://api.whatsapp.com/send?phone=16473902283\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black; background: yellow; mso-highlight: yellow\">WHATSAPP</span></a>, <span style=\"background: yellow; mso-highlight: yellow\"><a href=\"http://bit.ly/SkypewithLoftImmi\" target=\"_blank\" rel=\"noreferrer\"><span style=\"color: black\">SKYPE</span></a>, or directly via <u>+1 (647)3902283.</u></span>\n    </p>\n    <p>Warm regards<br />\n      <strong>Sophia Miles</strong><br />\n      <small><em>Admin. Assistant</em></small>\n    </p>\n  </div>\n  <div\n    style=\"\n      padding: 20px 0;\n      background-color: rgb(245, 245, 245);\n      font-size: 12px;\n      color: #8c8c8c;\n    \"\n  >\n    <div style=\"color: #000\">\n      <strong\n        ><small\n          >© 2021 LOFT IMMIGRATION CONSULTING SERVICES Inc | All Rights\n          Reserved.</small\n        ></strong\n      >\n    </div>\n    <div>\n      Member of the Immigration Consultants of Canada Regulatory Council\n      (ICCRC) Member #R535739\n    </div>\n    <div>\n      Member of Canadian Association of Professional Immigration Consultants\n      (CAPIC)\n    </div>\n    <div>\n      <a href=\"tel:+1 - (365) – 887 – 0360\">+1 - (365) – 887 – 0360</a\n      ><br />\n      <a href=\"https://loftimmigration.com/\"\n        >https://loftimmigration.com/ </a\n      ><br />\n      <a\n        href=\"https://www.google.com/maps/search/226,+Bernard+Avenue,+Richmond+Hill,+ON+L4S1E2,+Canada?entry=gmail&amp;source=g\"\n        target=\"_blank\"\n        rel=\"noreferrer\"\n        ><span\n          >3<sup>rd</sup> Floor, Suite 302, 10271 Yonge St., Richmond Hill,\n          ON L4C 3B5, Canada</span\n        ></a\n      >\n      <p>\n        <span\n          >Be social, follow us on\n          <a\n            href=\"https://www.instagram.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Instagram</span></a\n          >,\n          <a\n            href=\"https://www.facebook.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Facebook</span></a\n          >,\n          <a\n            href=\"https://twitter.com/loftimmigration\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">Twitter</span></a\n          >,\n          <a\n            href=\"https://www.linkedin.com/company/loft-immigration-inc\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">LinkedIn</span></a\n          >\n          &amp;\n          <a\n            href=\"https://www.youtube.com/channel/UCyMBN33v4kaiW4Y07LhSZZg\"\n            target=\"_blank\"\n            rel=\"noreferrer\"\n            ><span style=\"color: blue\">YouTube</span></a\n          ><!-- o ignored --></span\n        >\n      </p>\n    </div>\n    <div\n      style=\"\n        max-width: 80%;\n        margin-right: auto;\n        margin-left: auto;\n        margin-top: 5px;\n      \"\n    >\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com\"\n          >WEBSITE</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/contact\"\n          >CONTACT</a\n        >\n      </span>\n      <span style=\"display: inline-block; width: 32%\">\n        <a\n          style=\"\n            text-decoration: none;\n            color: rgb(124, 124, 124);\n            font-weight: 600;\n          \"\n          href=\"http://loftimmigration.com/privacy-policy\"\n          >PRIVACY POLICY</a\n        >\n      </span>\n    </div>\n    <p>\n      <small\n        >Confidentiality Notice: The contents of this e-mail are intended\n        for the named recipient only. It may contain confidential and\n        privileged information. If you received it in error, please notify\n        us immediately and then destroy it. Internet communications are not\n        secure, and therefore Loft Immigration does not accept legal\n        responsibility for the contents of this message. Also, and though we\n        provide every effort to keep our network free from viruses, you\n        would need to check this e-mail and any attachments for viruses as\n        we can take no responsibility for any computer virus which might be\n        transferred by way of this e-mail.\n      </small>\n    </p>\n  </div>\n</div>\n\n\n', 'sent', '2nd Mail to Business Immigrant', '2021-05-03 02:38:32', 'business', 274, '2021-05-03 02:28:32', '2021-05-03 11:01:28');

-- --------------------------------------------------------

--
-- Table structure for table `marital_statuses`
--

CREATE TABLE `marital_statuses` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `desc` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marital_statuses`
--

INSERT INTO `marital_statuses` (`id`, `title`, `slug`, `desc`, `createdAt`, `updatedAt`) VALUES
(1, 'Single', 'single', 'single', '2021-02-14 01:33:59', '2021-02-14 01:33:59'),
(2, 'Married', 'married', 'married', '2021-02-14 01:33:59', '2021-02-14 01:33:59'),
(3, 'Divorced', 'divorced', 'divorced', '2021-02-14 01:35:22', '2021-02-14 01:35:22');

-- --------------------------------------------------------

--
-- Table structure for table `occupations`
--

CREATE TABLE `occupations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `desc` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `occupations`
--

INSERT INTO `occupations` (`id`, `name`, `slug`, `desc`, `createdAt`, `updatedAt`) VALUES
(968, 'ACCOUNTANT', 'accountant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(969, 'ACTOR', 'actor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(970, 'ACTUARY', 'actuary', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(971, 'ADHESIVE BONDING MACHINE TENDER', 'adhesive-bonding-machine-tender', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(972, 'ADJUDICATOR', 'adjudicator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(973, 'ADMINISTRATIVE ASSISTANT', 'administrative-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(974, 'ADMINISTRATIVE SERVICES MANAGER', 'administrative-services-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(975, 'ADULT EDUCATION TEACHER', 'adult-education-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(976, 'ADVERTISING MANAGER', 'advertising-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(977, 'ADVERTISING SALES AGENT', 'advertising-sales-agent', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(978, 'AEROBICS INSTRUCTOR', 'aerobics-instructor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(979, 'AEROSPACE ENGINEER', 'aerospace-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(980, 'AEROSPACE ENGINEERING TECHNICIAN', 'aerospace-engineering-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(981, 'AGENT', 'agent', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(982, 'AGRICULTURAL ENGINEER', 'agricultural-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(983, 'AGRICULTURAL EQUIPMENT OPERATOR', 'agricultural-equipment-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(984, 'AGRICULTURAL GRADER', 'agricultural-grader', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(985, 'AGRICULTURAL INSPECTOR', 'agricultural-inspector', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(986, 'AGRICULTURAL MANAGER', 'agricultural-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(987, 'AGRICULTURAL SCIENCES TEACHER', 'agricultural-sciences-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(988, 'AGRICULTURAL SORTER', 'agricultural-sorter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(989, 'AGRICULTURAL TECHNICIAN', 'agricultural-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(990, 'AGRICULTURAL WORKER', 'agricultural-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(991, 'AIR CONDITIONING INSTALLER', 'air-conditioning-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(992, 'AIR CONDITIONING MECHANIC', 'air-conditioning-mechanic', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(993, 'AIR TRAFFIC CONTROLLER', 'air-traffic-controller', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(994, 'AIRCRAFT CARGO HANDLING SUPERVISOR', 'aircraft-cargo-handling-supervisor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(995, 'AIRCRAFT MECHANIC', 'aircraft-mechanic', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(996, 'AIRCRAFT SERVICE TECHNICIAN', 'aircraft-service-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(997, 'AIRLINE COPILOT', 'airline-copilot', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(998, 'AIRLINE PILOT', 'airline-pilot', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(999, 'AMBULANCE DISPATCHER', 'ambulance-dispatcher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1000, 'AMBULANCE DRIVER', 'ambulance-driver', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1001, 'AMUSEMENT MACHINE SERVICER', 'amusement-machine-servicer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1002, 'ANESTHESIOLOGIST', 'anesthesiologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1003, 'ANIMAL BREEDER', 'animal-breeder', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1004, 'ANIMAL CONTROL WORKER', 'animal-control-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1005, 'ANIMAL SCIENTIST', 'animal-scientist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1006, 'ANIMAL TRAINER', 'animal-trainer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1007, 'ANIMATOR', 'animator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1008, 'ANSWERING SERVICE OPERATOR', 'answering-service-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1009, 'ANTHROPOLOGIST', 'anthropologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1010, 'APPAREL PATTERNMAKER', 'apparel-patternmaker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1011, 'APPAREL WORKER', 'apparel-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1012, 'ARBITRATOR', 'arbitrator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1013, 'ARCHEOLOGIST', 'archeologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1014, 'ARCHITECT', 'architect', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1015, 'ARCHITECTURAL DRAFTER', 'architectural-drafter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1016, 'ARCHITECTURAL MANAGER', 'architectural-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1017, 'ARCHIVIST', 'archivist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1018, 'ART DIRECTOR', 'art-director', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1019, 'ART TEACHER', 'art-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1020, 'ARTIST', 'artist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1021, 'ASSEMBLER', 'assembler', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1022, 'ASTRONOMER', 'astronomer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1023, 'ATHLETE', 'athlete', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1024, 'ATHLETIC TRAINER', 'athletic-trainer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1025, 'ATM MACHINE REPAIRER', 'atm-machine-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1026, 'ATMOSPHERIC SCIENTIST', 'atmospheric-scientist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1027, 'ATTENDANT', 'attendant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1028, 'AUDIO AND VIDEO EQUIPMENT TECHNICIAN', 'audio-and-video-equipment-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1029, 'AUDIO-VISUAL AND MULTIMEDIA COLLECTIONS SPECIALIST', 'audiovisual-and-multimedia-collections-specialist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1030, 'AUDIOLOGIST', 'audiologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1031, 'AUDITOR', 'auditor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1032, 'AUTHOR', 'author', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1033, 'AUTO DAMAGE INSURANCE APPRAISER', 'auto-damage-insurance-appraiser', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1034, 'AUTOMOTIVE AND WATERCRAFT SERVICE ATTENDANT', 'automotive-and-watercraft-service-attendant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1035, 'AUTOMOTIVE GLASS INSTALLER', 'automotive-glass-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1036, 'AUTOMOTIVE MECHANIC', 'automotive-mechanic', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1037, 'AVIONICS TECHNICIAN', 'avionics-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1038, 'BAGGAGE PORTER', 'baggage-porter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1039, 'BAILIFF', 'bailiff', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1040, 'BAKER', 'baker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1041, 'BARBACK', 'barback', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1042, 'BARBER', 'barber', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1043, 'BARTENDER', 'bartender', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1044, 'BASIC EDUCATION TEACHER', 'basic-education-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1045, 'BEHAVIORAL DISORDER COUNSELOR', 'behavioral-disorder-counselor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1046, 'BELLHOP', 'bellhop', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1047, 'BENCH CARPENTER', 'bench-carpenter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1048, 'BICYCLE REPAIRER', 'bicycle-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1049, 'BILL AND ACCOUNT COLLECTOR', 'bill-and-account-collector', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1050, 'BILLING AND POSTING CLERK', 'billing-and-posting-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1051, 'BIOCHEMIST', 'biochemist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1052, 'BIOLOGICAL TECHNICIAN', 'biological-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1053, 'BIOMEDICAL ENGINEER', 'biomedical-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1054, 'BIOPHYSICIST', 'biophysicist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1055, 'BLASTER', 'blaster', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1056, 'BLENDING MACHINE OPERATOR', 'blending-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1057, 'BLOCKMASON', 'blockmason', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1058, 'BOILER OPERATOR', 'boiler-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1059, 'BOILERMAKER', 'boilermaker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1060, 'BOOKKEEPER', 'bookkeeper', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1061, 'BORING MACHINE TOOL TENDER', 'boring-machine-tool-tender', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1062, 'BRAZER', 'brazer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1063, 'BRICKMASON', 'brickmason', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1064, 'BRIDGE AND LOCK TENDER', 'bridge-and-lock-tender', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1065, 'BROADCAST NEWS ANALYST', 'broadcast-news-analyst', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1066, 'BROADCAST TECHNICIAN', 'broadcast-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1067, 'BROKERAGE CLERK', 'brokerage-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1068, 'BUDGET ANALYST', 'budget-analyst', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1069, 'BUILDING INSPECTOR', 'building-inspector', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1070, 'BUS MECHANIC', 'bus-mechanic', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1071, 'BUTCHER', 'butcher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1072, 'BUYER', 'buyer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1073, 'CABINETMAKER', 'cabinetmaker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1074, 'CAFETERIA ATTENDANT', 'cafeteria-attendant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1075, 'CAFETERIA COOK', 'cafeteria-cook', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1076, 'CAMERA OPERATOR', 'camera-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1077, 'CAMERA REPAIRER', 'camera-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1078, 'CARDIOVASCULAR TECHNICIAN', 'cardiovascular-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1079, 'CARGO AGENT', 'cargo-agent', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1080, 'CARPENTER', 'carpenter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1081, 'CARPET INSTALLER', 'carpet-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1082, 'CARTOGRAPHER', 'cartographer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1083, 'CASHIER', 'cashier', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1084, 'CASTER', 'caster', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1085, 'CEILING TILE INSTALLER', 'ceiling-tile-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1086, 'CELLULAR EQUIPMENT INSTALLER', 'cellular-equipment-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1087, 'CEMENT MASON', 'cement-mason', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1088, 'CHANNELING MACHINE OPERATOR', 'channeling-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1089, 'CHAUFFEUR', 'chauffeur', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1090, 'CHECKER', 'checker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1091, 'CHEF', 'chef', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1092, 'CHEMICAL ENGINEER', 'chemical-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1093, 'CHEMICAL PLANT OPERATOR', 'chemical-plant-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1094, 'CHEMIST', 'chemist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1095, 'CHEMISTRY TEACHER', 'chemistry-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1096, 'CHIEF EXECUTIVE', 'chief-executive', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1097, 'CHILD SOCIAL WORKER', 'child-social-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1098, 'CHILDCARE WORKER', 'childcare-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1099, 'CHIROPRACTOR', 'chiropractor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1100, 'CHOREOGRAPHER', 'choreographer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1101, 'CIVIL DRAFTER', 'civil-drafter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1102, 'CIVIL ENGINEER', 'civil-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1103, 'CIVIL ENGINEERING TECHNICIAN', 'civil-engineering-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1104, 'CLAIMS ADJUSTER', 'claims-adjuster', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1105, 'CLAIMS EXAMINER', 'claims-examiner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1106, 'CLAIMS INVESTIGATOR', 'claims-investigator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1107, 'CLEANER', 'cleaner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1108, 'CLINICAL LABORATORY TECHNICIAN', 'clinical-laboratory-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1109, 'CLINICAL LABORATORY TECHNOLOGIST', 'clinical-laboratory-technologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1110, 'CLINICAL PSYCHOLOGIST', 'clinical-psychologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1111, 'COATING WORKER', 'coating-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1112, 'COATROOM ATTENDANT', 'coatroom-attendant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1113, 'COIL FINISHER', 'coil-finisher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1114, 'COIL TAPER', 'coil-taper', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1115, 'COIL WINDER', 'coil-winder', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1116, 'COIN MACHINE SERVICER', 'coin-machine-servicer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1117, 'COMMERCIAL DIVER', 'commercial-diver', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1118, 'COMMERCIAL PILOT', 'commercial-pilot', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1119, 'COMMODITIES SALES AGENT', 'commodities-sales-agent', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1120, 'COMMUNICATIONS EQUIPMENT OPERATOR', 'communications-equipment-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1121, 'COMMUNICATIONS TEACHER', 'communications-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1122, 'COMMUNITY ASSOCIATION MANAGER', 'community-association-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1123, 'COMMUNITY SERVICE MANAGER', 'community-service-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1124, 'COMPENSATION AND BENEFITS MANAGER', 'compensation-and-benefits-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1125, 'COMPLIANCE OFFICER', 'compliance-officer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1126, 'COMPOSER', 'composer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1127, 'COMPUTER HARDWARE ENGINEER', 'computer-hardware-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1128, 'COMPUTER NETWORK ARCHITECT', 'computer-network-architect', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1129, 'COMPUTER OPERATOR', 'computer-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1130, 'COMPUTER PROGRAMMER', 'computer-programmer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1131, 'COMPUTER SCIENCE TEACHER', 'computer-science-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1132, 'COMPUTER SUPPORT SPECIALIST', 'computer-support-specialist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1133, 'COMPUTER SYSTEMS ADMINISTRATOR', 'computer-systems-administrator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1134, 'COMPUTER SYSTEMS ANALYST', 'computer-systems-analyst', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1135, 'CONCIERGE', 'concierge', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1136, 'CONCILIATOR', 'conciliator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1137, 'CONCRETE FINISHER', 'concrete-finisher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1138, 'CONSERVATION SCIENCE TEACHER', 'conservation-science-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1139, 'CONSERVATION SCIENTIST', 'conservation-scientist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1140, 'CONSERVATION WORKER', 'conservation-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1141, 'CONSERVATOR', 'conservator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1142, 'CONSTRUCTION INSPECTOR', 'construction-inspector', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1143, 'CONSTRUCTION MANAGER', 'construction-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1144, 'CONSTRUCTION PAINTER', 'construction-painter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1145, 'CONSTRUCTION WORKER', 'construction-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1146, 'CONTINUOUS MINING MACHINE OPERATOR', 'continuous-mining-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1147, 'CONVENTION PLANNER', 'convention-planner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1148, 'CONVEYOR OPERATOR', 'conveyor-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1149, 'COOK', 'cook', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1150, 'COOLING EQUIPMENT OPERATOR', 'cooling-equipment-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1151, 'COPY MARKER', 'copy-marker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1152, 'CORRECTIONAL OFFICER', 'correctional-officer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1153, 'CORRECTIONAL TREATMENT SPECIALIST', 'correctional-treatment-specialist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1154, 'CORRESPONDENCE CLERK', 'correspondence-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1155, 'CORRESPONDENT', 'correspondent', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1156, 'COSMETOLOGIST', 'cosmetologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1157, 'COST ESTIMATOR', 'cost-estimator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1158, 'COSTUME ATTENDANT', 'costume-attendant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1159, 'COUNSELING PSYCHOLOGIST', 'counseling-psychologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1160, 'COUNSELOR', 'counselor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1161, 'COURIER', 'courier', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1162, 'COURT REPORTER', 'court-reporter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1163, 'CRAFT ARTIST', 'craft-artist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1164, 'CRANE OPERATOR', 'crane-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1165, 'CREDIT ANALYST', 'credit-analyst', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1166, 'CREDIT CHECKER', 'credit-checker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1167, 'CREDIT COUNSELOR', 'credit-counselor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1168, 'CRIMINAL INVESTIGATOR', 'criminal-investigator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1169, 'CRIMINAL JUSTICE TEACHER', 'criminal-justice-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1170, 'CROSSING GUARD', 'crossing-guard', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1171, 'CURATOR', 'curator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1172, 'CUSTOM SEWER', 'custom-sewer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1173, 'CUSTOMER SERVICE REPRESENTATIVE', 'customer-service-representative', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1174, 'CUTTER', 'cutter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1175, 'CUTTING MACHINE OPERATOR', 'cutting-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1176, 'DANCER', 'dancer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1177, 'DATA ENTRY KEYER', 'data-entry-keyer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1178, 'DATABASE ADMINISTRATOR', 'database-administrator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1179, 'DECORATING WORKER', 'decorating-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1180, 'DELIVERY SERVICES DRIVER', 'delivery-services-driver', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1181, 'DEMONSTRATOR', 'demonstrator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1182, 'DENTAL ASSISTANT', 'dental-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1183, 'DENTAL HYGIENIST', 'dental-hygienist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1184, 'DENTAL LABORATORY TECHNICIAN', 'dental-laboratory-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1185, 'DENTIST', 'dentist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1186, 'DERRICK OPERATOR', 'derrick-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1187, 'DESIGNER', 'designer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1188, 'DESKTOP PUBLISHER', 'desktop-publisher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1189, 'DETECTIVE', 'detective', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1190, 'DIAGNOSTIC MEDICAL SONOGRAPHER', 'diagnostic-medical-sonographer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1191, 'DIE MAKER', 'die-maker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1192, 'DIESEL ENGINE SPECIALIST', 'diesel-engine-specialist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1193, 'DIETETIC TECHNICIAN', 'dietetic-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1194, 'DIETITIAN', 'dietitian', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1195, 'DINKEY OPERATOR', 'dinkey-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1196, 'DIRECTOR', 'director', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1197, 'DISHWASHER', 'dishwasher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1198, 'DISPATCHER', 'dispatcher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1199, 'DOOR-TO-DOOR SALES WORKER', 'doortodoor-sales-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1200, 'DRAFTER', 'drafter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1201, 'DRAGLINE OPERATOR', 'dragline-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1202, 'DRAMA TEACHER', 'drama-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1203, 'DREDGE OPERATOR', 'dredge-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1204, 'DRESSING ROOM ATTENDANT', 'dressing-room-attendant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1205, 'DRESSMAKER', 'dressmaker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1206, 'DRIER OPERATOR', 'drier-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1207, 'DRILLING MACHINE TOOL OPERATOR', 'drilling-machine-tool-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1208, 'DRY-CLEANING WORKER', 'drycleaning-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1209, 'DRYWALL INSTALLER', 'drywall-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1210, 'DYEING MACHINE OPERATOR', 'dyeing-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1211, 'EARTH DRILLER', 'earth-driller', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1212, 'ECONOMICS TEACHER', 'economics-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1213, 'ECONOMIST', 'economist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1214, 'EDITOR', 'editor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1215, 'EDUCATION ADMINISTRATOR', 'education-administrator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1216, 'ELECTRIC MOTOR REPAIRER', 'electric-motor-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1217, 'ELECTRICAL ELECTRONICS DRAFTER', 'electrical-electronics-drafter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1218, 'ELECTRICAL ENGINEER', 'electrical-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1219, 'ELECTRICAL EQUIPMENT ASSEMBLER', 'electrical-equipment-assembler', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1220, 'ELECTRICAL INSTALLER', 'electrical-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1221, 'ELECTRICAL POWER-LINE INSTALLER', 'electrical-powerline-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1222, 'ELECTRICIAN', 'electrician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1223, 'ELECTRO-MECHANICAL TECHNICIAN', 'electromechanical-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1224, 'ELEMENTARY SCHOOL TEACHER', 'elementary-school-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1225, 'ELEVATOR INSTALLER', 'elevator-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1226, 'ELEVATOR REPAIRER', 'elevator-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1227, 'EMBALMER', 'embalmer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1228, 'EMERGENCY MANAGEMENT DIRECTOR', 'emergency-management-director', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1229, 'EMERGENCY MEDICAL TECHNICIAN', 'emergency-medical-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1230, 'ENGINE ASSEMBLER', 'engine-assembler', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1231, 'ENGINEER', 'engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1232, 'ENGINEERING MANAGER', 'engineering-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1233, 'ENGINEERING TEACHER', 'engineering-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1234, 'ENGLISH LANGUAGE TEACHER', 'english-language-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1235, 'ENGRAVER', 'engraver', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1236, 'ENTERTAINMENT ATTENDANT', 'entertainment-attendant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1237, 'ENVIRONMENTAL ENGINEER', 'environmental-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1238, 'ENVIRONMENTAL SCIENCE TEACHER', 'environmental-science-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1239, 'ENVIRONMENTAL SCIENTIST', 'environmental-scientist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1240, 'EPIDEMIOLOGIST', 'epidemiologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1241, 'ESCORT', 'escort', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1242, 'ETCHER', 'etcher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1243, 'EVENT PLANNER', 'event-planner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1244, 'EXCAVATING OPERATOR', 'excavating-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1245, 'EXECUTIVE ADMINISTRATIVE ASSISTANT', 'executive-administrative-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1246, 'EXECUTIVE SECRETARY', 'executive-secretary', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1247, 'EXHIBIT DESIGNER', 'exhibit-designer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1248, 'EXPEDITING CLERK', 'expediting-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1249, 'EXPLOSIVES WORKER', 'explosives-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1250, 'EXTRACTION WORKER', 'extraction-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1251, 'FABRIC MENDER', 'fabric-mender', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1252, 'FABRIC PATTERNMAKER', 'fabric-patternmaker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1253, 'FABRICATOR', 'fabricator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1254, 'FALLER', 'faller', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1255, 'FAMILY PRACTITIONER', 'family-practitioner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1256, 'FAMILY SOCIAL WORKER', 'family-social-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1257, 'FAMILY THERAPIST', 'family-therapist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1258, 'FARM ADVISOR', 'farm-advisor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1259, 'FARM EQUIPMENT MECHANIC', 'farm-equipment-mechanic', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1260, 'FARM LABOR CONTRACTOR', 'farm-labor-contractor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1261, 'FARMER', 'farmer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1262, 'FARMWORKER', 'farmworker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1263, 'FASHION DESIGNER', 'fashion-designer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1264, 'FAST FOOD COOK', 'fast-food-cook', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1265, 'FENCE ERECTOR', 'fence-erector', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1266, 'FIBERGLASS FABRICATOR', 'fiberglass-fabricator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1267, 'FIBERGLASS LAMINATOR', 'fiberglass-laminator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1268, 'FILE CLERK', 'file-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1269, 'FILLING MACHINE OPERATOR', 'filling-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1270, 'FILM AND VIDEO EDITOR', 'film-and-video-editor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1271, 'FINANCIAL ANALYST', 'financial-analyst', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1272, 'FINANCIAL EXAMINER', 'financial-examiner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1273, 'FINANCIAL MANAGER', 'financial-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1274, 'FINANCIAL SERVICES SALES AGENT', 'financial-services-sales-agent', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1275, 'FINE ARTIST', 'fine-artist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1276, 'FIRE ALARM SYSTEM INSTALLER', 'fire-alarm-system-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1277, 'FIRE DISPATCHER', 'fire-dispatcher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1278, 'FIRE INSPECTOR', 'fire-inspector', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1279, 'FIRE INVESTIGATOR', 'fire-investigator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1280, 'FIREFIGHTER', 'firefighter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1281, 'FISH AND GAME WARDEN', 'fish-and-game-warden', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1282, 'FISH CUTTER', 'fish-cutter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1283, 'FISH TRIMMER', 'fish-trimmer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1284, 'FISHER', 'fisher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1285, 'FITNESS STUDIES TEACHER', 'fitness-studies-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1286, 'FITNESS TRAINER', 'fitness-trainer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1287, 'FLIGHT ATTENDANT', 'flight-attendant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1288, 'FLOOR FINISHER', 'floor-finisher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1289, 'FLOOR LAYER', 'floor-layer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1290, 'FLOOR SANDER', 'floor-sander', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1291, 'FLORAL DESIGNER', 'floral-designer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1292, 'FOOD BATCHMAKER', 'food-batchmaker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1293, 'FOOD COOKING MACHINE OPERATOR', 'food-cooking-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1294, 'FOOD PREPARATION WORKER', 'food-preparation-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1295, 'FOOD SCIENCE TECHNICIAN', 'food-science-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1296, 'FOOD SCIENTIST', 'food-scientist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1297, 'FOOD SERVER', 'food-server', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1298, 'FOOD SERVICE MANAGER', 'food-service-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1299, 'FOOD TECHNOLOGIST', 'food-technologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1300, 'FOREIGN LANGUAGE TEACHER', 'foreign-language-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1301, 'FOREIGN LITERATURE TEACHER', 'foreign-literature-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1302, 'FORENSIC SCIENCE TECHNICIAN', 'forensic-science-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1303, 'FOREST FIRE INSPECTOR', 'forest-fire-inspector', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1304, 'FOREST FIRE PREVENTION SPECIALIST', 'forest-fire-prevention-specialist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1305, 'FOREST WORKER', 'forest-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1306, 'FORESTER', 'forester', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1307, 'FORESTRY TEACHER', 'forestry-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1308, 'FORGING MACHINE SETTER', 'forging-machine-setter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1309, 'FOUNDRY COREMAKER', 'foundry-coremaker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1310, 'FREIGHT AGENT', 'freight-agent', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1311, 'FREIGHT MOVER', 'freight-mover', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1312, 'FUNDRAISING MANAGER', 'fundraising-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1313, 'FUNERAL ATTENDANT', 'funeral-attendant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1314, 'FUNERAL DIRECTOR', 'funeral-director', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1315, 'FUNERAL SERVICE MANAGER', 'funeral-service-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1316, 'FURNACE OPERATOR', 'furnace-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1317, 'FURNISHINGS WORKER', 'furnishings-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1318, 'FURNITURE FINISHER', 'furniture-finisher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1319, 'GAMING BOOTH CASHIER', 'gaming-booth-cashier', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1320, 'GAMING CAGE WORKER', 'gaming-cage-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1321, 'GAMING CHANGE PERSON', 'gaming-change-person', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1322, 'GAMING DEALER', 'gaming-dealer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1323, 'GAMING INVESTIGATOR', 'gaming-investigator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1324, 'GAMING MANAGER', 'gaming-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1325, 'GAMING SURVEILLANCE OFFICER', 'gaming-surveillance-officer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1326, 'GARMENT MENDER', 'garment-mender', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1327, 'GARMENT PRESSER', 'garment-presser', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1328, 'GAS COMPRESSOR', 'gas-compressor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1329, 'GAS PLANT OPERATOR', 'gas-plant-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1330, 'GAS PUMPING STATION OPERATOR', 'gas-pumping-station-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1331, 'GENERAL MANAGER', 'general-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1332, 'GENERAL PRACTITIONER', 'general-practitioner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1333, 'GEOGRAPHER', 'geographer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1334, 'GEOGRAPHY TEACHER', 'geography-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1335, 'GEOLOGICAL ENGINEER', 'geological-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1336, 'GEOLOGICAL TECHNICIAN', 'geological-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1337, 'GEOSCIENTIST', 'geoscientist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1338, 'GLAZIER', 'glazier', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1339, 'GOVERNMENT PROGRAM ELIGIBILITY INTERVIEWER', 'government-program-eligibility-interviewer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1340, 'GRADUATE TEACHING ASSISTANT', 'graduate-teaching-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1341, 'GRAPHIC DESIGNER', 'graphic-designer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1342, 'GROUNDSKEEPER', 'groundskeeper', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1343, 'GROUNDSKEEPING WORKER', 'groundskeeping-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1344, 'GYNECOLOGIST', 'gynecologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1345, 'HAIRDRESSER', 'hairdresser', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1346, 'HAIRSTYLIST', 'hairstylist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1347, 'HAND GRINDING WORKER', 'hand-grinding-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1348, 'HAND LABORER', 'hand-laborer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1349, 'HAND PACKAGER', 'hand-packager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1350, 'HAND PACKER', 'hand-packer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1351, 'HAND POLISHING WORKER', 'hand-polishing-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1352, 'HAND SEWER', 'hand-sewer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1353, 'HAZARDOUS MATERIALS REMOVAL WORKER', 'hazardous-materials-removal-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1354, 'HEAD COOK', 'head-cook', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1355, 'HEALTH AND SAFETY ENGINEER', 'health-and-safety-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1356, 'HEALTH EDUCATOR', 'health-educator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1357, 'HEALTH INFORMATION TECHNICIAN', 'health-information-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1358, 'HEALTH SERVICES MANAGER', 'health-services-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1359, 'HEALTH SPECIALTIES TEACHER', 'health-specialties-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1360, 'HEALTHCARE SOCIAL WORKER', 'healthcare-social-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1361, 'HEARING OFFICER', 'hearing-officer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1362, 'HEAT TREATING EQUIPMENT SETTER', 'heat-treating-equipment-setter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1363, 'HEATING INSTALLER', 'heating-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1364, 'HEATING MECHANIC', 'heating-mechanic', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1365, 'HEAVY TRUCK DRIVER', 'heavy-truck-driver', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1366, 'HIGHWAY MAINTENANCE WORKER', 'highway-maintenance-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1367, 'HISTORIAN', 'historian', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1368, 'HISTORY TEACHER', 'history-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1369, 'HOIST AND WINCH OPERATOR', 'hoist-and-winch-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1370, 'HOME APPLIANCE REPAIRER', 'home-appliance-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1371, 'HOME ECONOMICS TEACHER', 'home-economics-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1372, 'HOME ENTERTAINMENT INSTALLER', 'home-entertainment-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1373, 'HOME HEALTH AIDE', 'home-health-aide', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1374, 'HOME MANAGEMENT ADVISOR', 'home-management-advisor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1375, 'HOST', 'host', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1376, 'HOSTESS', 'hostess', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1377, 'HOSTLER', 'hostler', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1378, 'HOTEL DESK CLERK', 'hotel-desk-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1379, 'HOUSEKEEPING CLEANER', 'housekeeping-cleaner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1380, 'HUMAN RESOURCES ASSISTANT', 'human-resources-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1381, 'HUMAN RESOURCES MANAGER', 'human-resources-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1382, 'HUMAN SERVICE ASSISTANT', 'human-service-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1383, 'HUNTER', 'hunter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1384, 'HYDROLOGIST', 'hydrologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1385, 'ILLUSTRATOR', 'illustrator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1386, 'INDUSTRIAL DESIGNER', 'industrial-designer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1387, 'INDUSTRIAL ENGINEER', 'industrial-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1388, 'INDUSTRIAL ENGINEERING TECHNICIAN', 'industrial-engineering-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1389, 'INDUSTRIAL MACHINERY MECHANIC', 'industrial-machinery-mechanic', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1390, 'INDUSTRIAL PRODUCTION MANAGER', 'industrial-production-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1391, 'INDUSTRIAL TRUCK OPERATOR', 'industrial-truck-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1392, 'INDUSTRIAL-ORGANIZATIONAL PSYCHOLOGIST', 'industrialorganizational-psychologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1393, 'INFORMATION CLERK', 'information-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1394, 'INFORMATION RESEARCH SCIENTIST', 'information-research-scientist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1395, 'INFORMATION SECURITY ANALYST', 'information-security-analyst', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1396, 'INFORMATION SYSTEMS MANAGER', 'information-systems-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1397, 'INSPECTOR', 'inspector', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1398, 'INSTRUCTIONAL COORDINATOR', 'instructional-coordinator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1399, 'INSTRUCTOR', 'instructor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1400, 'INSULATION WORKER', 'insulation-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1401, 'INSURANCE CLAIMS CLERK', 'insurance-claims-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1402, 'INSURANCE SALES AGENT', 'insurance-sales-agent', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1403, 'INSURANCE UNDERWRITER', 'insurance-underwriter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1404, 'INTERCITY BUS DRIVER', 'intercity-bus-driver', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1405, 'INTERIOR DESIGNER', 'interior-designer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1406, 'INTERNIST', 'internist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1407, 'INTERPRETER', 'interpreter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1408, 'INTERVIEWER', 'interviewer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1409, 'INVESTIGATOR', 'investigator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1410, 'JAILER', 'jailer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1411, 'JANITOR', 'janitor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1412, 'JEWELER', 'jeweler', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1413, 'JUDGE', 'judge', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1414, 'JUDICIAL LAW CLERK', 'judicial-law-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1415, 'KETTLE OPERATOR', 'kettle-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1416, 'KILN OPERATOR', 'kiln-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1417, 'KINDERGARTEN TEACHER', 'kindergarten-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1418, 'LABORATORY ANIMAL CARETAKER', 'laboratory-animal-caretaker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1419, 'LANDSCAPE ARCHITECT', 'landscape-architect', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1420, 'LANDSCAPING WORKER', 'landscaping-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1421, 'LATHE SETTER', 'lathe-setter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1422, 'LAUNDRY WORKER', 'laundry-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1423, 'LAW ENFORCEMENT TEACHER', 'law-enforcement-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1424, 'LAW TEACHER', 'law-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1425, 'LAWYER', 'lawyer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1426, 'LAYOUT WORKER', 'layout-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1427, 'LEATHER WORKER', 'leather-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1428, 'LEGAL ASSISTANT', 'legal-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1429, 'LEGAL SECRETARY', 'legal-secretary', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1430, 'LEGISLATOR', 'legislator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1431, 'LIBRARIAN', 'librarian', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1432, 'LIBRARY ASSISTANT', 'library-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1433, 'LIBRARY SCIENCE TEACHER', 'library-science-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1434, 'LIBRARY TECHNICIAN', 'library-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1435, 'LICENSED PRACTICAL NURSE', 'licensed-practical-nurse', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1436, 'LICENSED VOCATIONAL NURSE', 'licensed-vocational-nurse', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1437, 'LIFE SCIENTIST', 'life-scientist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1438, 'LIFEGUARD', 'lifeguard', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1439, 'LIGHT TRUCK DRIVER', 'light-truck-driver', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1440, 'LINE INSTALLER', 'line-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1441, 'LITERACY TEACHER', 'literacy-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1442, 'LITERATURE TEACHER', 'literature-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1443, 'LOADING MACHINE OPERATOR', 'loading-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1444, 'LOAN CLERK', 'loan-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1445, 'LOAN INTERVIEWER', 'loan-interviewer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1446, 'LOAN OFFICER', 'loan-officer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1447, 'LOBBY ATTENDANT', 'lobby-attendant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1448, 'LOCKER ROOM ATTENDANT', 'locker-room-attendant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1449, 'LOCKSMITH', 'locksmith', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1450, 'LOCOMOTIVE ENGINEER', 'locomotive-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1451, 'LOCOMOTIVE FIRER', 'locomotive-firer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1452, 'LODGING MANAGER', 'lodging-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1453, 'LOG GRADER', 'log-grader', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1454, 'LOGGING EQUIPMENT OPERATOR', 'logging-equipment-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1455, 'LOGISTICIAN', 'logistician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1456, 'MACHINE FEEDER', 'machine-feeder', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1457, 'MACHINIST', 'machinist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1458, 'MAGISTRATE JUDGE', 'magistrate-judge', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1459, 'MAGISTRATE', 'magistrate', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1460, 'MAID', 'maid', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1461, 'MAIL CLERK', 'mail-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1462, 'MAIL MACHINE OPERATOR', 'mail-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1463, 'MAIL SUPERINTENDENT', 'mail-superintendent', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39');
INSERT INTO `occupations` (`id`, `name`, `slug`, `desc`, `createdAt`, `updatedAt`) VALUES
(1464, 'MAINTENANCE PAINTER', 'maintenance-painter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1465, 'MAINTENANCE WORKER', 'maintenance-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1466, 'MAKEUP ARTIST', 'makeup-artist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1467, 'MANAGEMENT ANALYST', 'management-analyst', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1468, 'MANICURIST', 'manicurist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1469, 'MANUFACTURED BUILDING INSTALLER', 'manufactured-building-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1470, 'MAPPING TECHNICIAN', 'mapping-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1471, 'MARBLE SETTER', 'marble-setter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1472, 'MARINE ENGINEER', 'marine-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1473, 'MARINE OILER', 'marine-oiler', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1474, 'MARKET RESEARCH ANALYST', 'market-research-analyst', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1475, 'MARKETING MANAGER', 'marketing-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1476, 'MARKETING SPECIALIST', 'marketing-specialist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1477, 'MARRIAGE THERAPIST', 'marriage-therapist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1478, 'MASSAGE THERAPIST', 'massage-therapist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1479, 'MATERIAL MOVER', 'material-mover', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1480, 'MATERIALS ENGINEER', 'materials-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1481, 'MATERIALS SCIENTIST', 'materials-scientist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1482, 'MATHEMATICAL SCIENCE TEACHER', 'mathematical-science-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1483, 'MATHEMATICAL TECHNICIAN', 'mathematical-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1484, 'MATHEMATICIAN', 'mathematician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1485, 'MAXILLOFACIAL SURGEON', 'maxillofacial-surgeon', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1486, 'MEASURER', 'measurer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1487, 'MEAT CUTTER', 'meat-cutter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1488, 'MEAT PACKER', 'meat-packer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1489, 'MEAT TRIMMER', 'meat-trimmer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1490, 'MECHANICAL DOOR REPAIRER', 'mechanical-door-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1491, 'MECHANICAL DRAFTER', 'mechanical-drafter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1492, 'MECHANICAL ENGINEER', 'mechanical-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1493, 'MECHANICAL ENGINEERING TECHNICIAN', 'mechanical-engineering-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1494, 'MEDIATOR', 'mediator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1495, 'MEDICAL APPLIANCE TECHNICIAN', 'medical-appliance-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1496, 'MEDICAL ASSISTANT', 'medical-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1497, 'MEDICAL EQUIPMENT PREPARER', 'medical-equipment-preparer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1498, 'MEDICAL EQUIPMENT REPAIRER', 'medical-equipment-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1499, 'MEDICAL LABORATORY TECHNICIAN', 'medical-laboratory-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1500, 'MEDICAL LABORATORY TECHNOLOGIST', 'medical-laboratory-technologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1501, 'MEDICAL RECORDS TECHNICIAN', 'medical-records-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1502, 'MEDICAL SCIENTIST', 'medical-scientist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1503, 'MEDICAL SECRETARY', 'medical-secretary', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1504, 'MEDICAL SERVICES MANAGER', 'medical-services-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1505, 'MEDICAL TRANSCRIPTIONIST', 'medical-transcriptionist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1506, 'MEETING PLANNER', 'meeting-planner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1507, 'MENTAL HEALTH COUNSELOR', 'mental-health-counselor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1508, 'MENTAL HEALTH SOCIAL WORKER', 'mental-health-social-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1509, 'MERCHANDISE DISPLAYER', 'merchandise-displayer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1510, 'MESSENGER', 'messenger', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1511, 'METAL CASTER', 'metal-caster', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1512, 'METAL PATTERNMAKER', 'metal-patternmaker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1513, 'METAL PICKLING OPERATOR', 'metal-pickling-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1514, 'METAL POURER', 'metal-pourer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1515, 'METAL WORKER', 'metal-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1516, 'METAL-REFINING FURNACE OPERATOR', 'metalrefining-furnace-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1517, 'METAL-REFINING FURNACE TENDER', 'metalrefining-furnace-tender', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1518, 'METER READER', 'meter-reader', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1519, 'MICROBIOLOGIST', 'microbiologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1520, 'MIDDLE SCHOOL TEACHER', 'middle-school-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1521, 'MILLING MACHINE SETTER', 'milling-machine-setter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1522, 'MILLWRIGHT', 'millwright', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1523, 'MINE CUTTING MACHINE OPERATOR', 'mine-cutting-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1524, 'MINE SHUTTLE CAR OPERATOR', 'mine-shuttle-car-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1525, 'MINING ENGINEER', 'mining-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1526, 'MINING SAFETY ENGINEER', 'mining-safety-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1527, 'MINING SAFETY INSPECTOR', 'mining-safety-inspector', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1528, 'MINING SERVICE UNIT OPERATOR', 'mining-service-unit-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1529, 'MIXING MACHINE SETTER', 'mixing-machine-setter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1530, 'MOBILE HEAVY EQUIPMENT MECHANIC', 'mobile-heavy-equipment-mechanic', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1531, 'MOBILE HOME INSTALLER', 'mobile-home-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1532, 'MODEL MAKER', 'model-maker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1533, 'MODEL', 'model', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1534, 'MOLDER', 'molder', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1535, 'MORTICIAN', 'mortician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1536, 'MOTEL DESK CLERK', 'motel-desk-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1537, 'MOTION PICTURE PROJECTIONIST', 'motion-picture-projectionist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1538, 'MOTORBOAT MECHANIC', 'motorboat-mechanic', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1539, 'MOTORBOAT OPERATOR', 'motorboat-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1540, 'MOTORBOAT SERVICE TECHNICIAN', 'motorboat-service-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1541, 'MOTORCYCLE MECHANIC', 'motorcycle-mechanic', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1542, 'MULTIMEDIA ARTIST', 'multimedia-artist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1543, 'MUSEUM TECHNICIAN', 'museum-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1544, 'MUSIC DIRECTOR', 'music-director', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1545, 'MUSIC TEACHER', 'music-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1546, 'MUSICAL INSTRUMENT REPAIRER', 'musical-instrument-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1547, 'MUSICIAN', 'musician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1548, 'NATURAL SCIENCES MANAGER', 'natural-sciences-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1549, 'NAVAL ARCHITECT', 'naval-architect', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1550, 'NETWORK SYSTEMS ADMINISTRATOR', 'network-systems-administrator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1551, 'NEW ACCOUNTS CLERK', 'new-accounts-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1552, 'NEWS VENDOR', 'news-vendor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1553, 'NONFARM ANIMAL CARETAKER', 'nonfarm-animal-caretaker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1554, 'NUCLEAR ENGINEER', 'nuclear-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1555, 'NUCLEAR MEDICINE TECHNOLOGIST', 'nuclear-medicine-technologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1556, 'NUCLEAR POWER REACTOR OPERATOR', 'nuclear-power-reactor-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1557, 'NUCLEAR TECHNICIAN', 'nuclear-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1558, 'NURSING AIDE', 'nursing-aide', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1559, 'NURSING INSTRUCTOR', 'nursing-instructor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1560, 'NURSING TEACHER', 'nursing-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1561, 'NUTRITIONIST', 'nutritionist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1562, 'OBSTETRICIAN', 'obstetrician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1563, 'OCCUPATIONAL HEALTH AND SAFETY SPECIALIST', 'occupational-health-and-safety-specialist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1564, 'OCCUPATIONAL HEALTH AND SAFETY TECHNICIAN', 'occupational-health-and-safety-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1565, 'OCCUPATIONAL THERAPIST', 'occupational-therapist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1566, 'OCCUPATIONAL THERAPY AIDE', 'occupational-therapy-aide', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1567, 'OCCUPATIONAL THERAPY ASSISTANT', 'occupational-therapy-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1568, 'OFFBEARER', 'offbearer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1569, 'OFFICE CLERK', 'office-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1570, 'OFFICE MACHINE OPERATOR', 'office-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1571, 'OPERATING ENGINEER', 'operating-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1572, 'OPERATIONS MANAGER', 'operations-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1573, 'OPERATIONS RESEARCH ANALYST', 'operations-research-analyst', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1574, 'OPHTHALMIC LABORATORY TECHNICIAN', 'ophthalmic-laboratory-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1575, 'OPTICIAN', 'optician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1576, 'OPTOMETRIST', 'optometrist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1577, 'ORAL SURGEON', 'oral-surgeon', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1578, 'ORDER CLERK', 'order-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1579, 'ORDER FILLER', 'order-filler', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1580, 'ORDERLY', 'orderly', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1581, 'ORDNANCE HANDLING EXPERT', 'ordnance-handling-expert', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1582, 'ORTHODONTIST', 'orthodontist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1583, 'ORTHOTIST', 'orthotist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1584, 'OUTDOOR POWER EQUIPMENT MECHANIC', 'outdoor-power-equipment-mechanic', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1585, 'OVEN OPERATOR', 'oven-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1586, 'PACKAGING MACHINE OPERATOR', 'packaging-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1587, 'PAINTER ', 'painter-', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1588, 'PAINTING WORKER', 'painting-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1589, 'PAPER GOODS MACHINE SETTER', 'paper-goods-machine-setter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1590, 'PAPERHANGER', 'paperhanger', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1591, 'PARALEGAL', 'paralegal', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1592, 'PARAMEDIC', 'paramedic', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1593, 'PARKING ENFORCEMENT WORKER', 'parking-enforcement-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1594, 'PARKING LOT ATTENDANT', 'parking-lot-attendant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1595, 'PARTS SALESPERSON', 'parts-salesperson', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1596, 'PAVING EQUIPMENT OPERATOR', 'paving-equipment-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1597, 'PAYROLL CLERK', 'payroll-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1598, 'PEDIATRICIAN', 'pediatrician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1599, 'PEDICURIST', 'pedicurist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1600, 'PERSONAL CARE AIDE', 'personal-care-aide', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1601, 'PERSONAL CHEF', 'personal-chef', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1602, 'PERSONAL FINANCIAL ADVISOR', 'personal-financial-advisor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1603, 'PEST CONTROL WORKER', 'pest-control-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1604, 'PESTICIDE APPLICATOR', 'pesticide-applicator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1605, 'PESTICIDE HANDLER', 'pesticide-handler', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1606, 'PESTICIDE SPRAYER', 'pesticide-sprayer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1607, 'PETROLEUM ENGINEER', 'petroleum-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1608, 'PETROLEUM GAUGER', 'petroleum-gauger', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1609, 'PETROLEUM PUMP SYSTEM OPERATOR', 'petroleum-pump-system-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1610, 'PETROLEUM REFINERY OPERATOR', 'petroleum-refinery-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1611, 'PETROLEUM TECHNICIAN', 'petroleum-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1612, 'PHARMACIST', 'pharmacist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1613, 'PHARMACY AIDE', 'pharmacy-aide', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1614, 'PHARMACY TECHNICIAN', 'pharmacy-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1615, 'PHILOSOPHY TEACHER', 'philosophy-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1616, 'PHOTOGRAMMETRIST', 'photogrammetrist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1617, 'PHOTOGRAPHER', 'photographer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1618, 'PHOTOGRAPHIC PROCESS WORKER', 'photographic-process-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1619, 'PHOTOGRAPHIC PROCESSING MACHINE OPERATOR', 'photographic-processing-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1620, 'PHYSICAL THERAPIST AIDE', 'physical-therapist-aide', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1621, 'PHYSICAL THERAPIST ASSISTANT', 'physical-therapist-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1622, 'PHYSICAL THERAPIST', 'physical-therapist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1623, 'PHYSICIAN ASSISTANT', 'physician-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1624, 'PHYSICIAN', 'physician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1625, 'PHYSICIST', 'physicist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1626, 'PHYSICS TEACHER', 'physics-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1627, 'PILE-DRIVER OPERATOR', 'piledriver-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1628, 'PIPEFITTER', 'pipefitter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1629, 'PIPELAYER', 'pipelayer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1630, 'PLANING MACHINE OPERATOR', 'planing-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1631, 'PLANNING CLERK', 'planning-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1632, 'PLANT OPERATOR', 'plant-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1633, 'PLANT SCIENTIST', 'plant-scientist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1634, 'PLASTERER', 'plasterer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1635, 'PLASTIC PATTERNMAKER', 'plastic-patternmaker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1636, 'PLASTIC WORKER', 'plastic-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1637, 'PLUMBER', 'plumber', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1638, 'PODIATRIST', 'podiatrist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1639, 'POLICE DISPATCHER', 'police-dispatcher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1640, 'POLICE OFFICER', 'police-officer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1641, 'POLICY PROCESSING CLERK', 'policy-processing-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1642, 'POLITICAL SCIENCE TEACHER', 'political-science-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1643, 'POLITICAL SCIENTIST', 'political-scientist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1644, 'POSTAL SERVICE CLERK', 'postal-service-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1645, 'POSTAL SERVICE MAIL CARRIER', 'postal-service-mail-carrier', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1646, 'POSTAL SERVICE MAIL PROCESSING MACHINE OPERATOR', 'postal-service-mail-processing-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1647, 'POSTAL SERVICE MAIL PROCESSOR', 'postal-service-mail-processor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1648, 'POSTAL SERVICE MAIL SORTER', 'postal-service-mail-sorter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1649, 'POSTMASTER', 'postmaster', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1650, 'POSTSECONDARY TEACHER', 'postsecondary-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1651, 'POULTRY CUTTER', 'poultry-cutter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1652, 'POULTRY TRIMMER', 'poultry-trimmer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1653, 'POWER DISPATCHER', 'power-dispatcher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1654, 'POWER DISTRIBUTOR', 'power-distributor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1655, 'POWER PLANT OPERATOR', 'power-plant-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1656, 'POWER TOOL REPAIRER', 'power-tool-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1657, 'PRECIOUS STONE WORKER', 'precious-stone-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1658, 'PRECISION INSTRUMENT REPAIRER', 'precision-instrument-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1659, 'PREPRESS TECHNICIAN', 'prepress-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1660, 'PRESCHOOL TEACHER', 'preschool-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1661, 'PRIEST', 'priest', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1662, 'PRINT BINDING WORKER', 'print-binding-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1663, 'PRINTING PRESS OPERATOR', 'printing-press-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1664, 'PRIVATE DETECTIVE', 'private-detective', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1665, 'PROBATION OFFICER', 'probation-officer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1666, 'PROCUREMENT CLERK', 'procurement-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1667, 'PRODUCER', 'producer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1668, 'PRODUCT PROMOTER', 'product-promoter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1669, 'PRODUCTION CLERK', 'production-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1670, 'PRODUCTION OCCUPATION', 'production-occupation', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1671, 'PROOFREADER', 'proofreader', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1672, 'PROPERTY MANAGER', 'property-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1673, 'PROSTHETIST', 'prosthetist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1674, 'PROSTHODONTIST', 'prosthodontist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1675, 'PSYCHIATRIC AIDE', 'psychiatric-aide', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1676, 'PSYCHIATRIC TECHNICIAN', 'psychiatric-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1677, 'PSYCHIATRIST', 'psychiatrist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1678, 'PSYCHOLOGIST', 'psychologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1679, 'PSYCHOLOGY TEACHER', 'psychology-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1680, 'PUBLIC RELATIONS MANAGER', 'public-relations-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1681, 'PUBLIC RELATIONS SPECIALIST', 'public-relations-specialist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1682, 'PUMP OPERATOR', 'pump-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1683, 'PURCHASING AGENT', 'purchasing-agent', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1684, 'PURCHASING MANAGER', 'purchasing-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1685, 'RADIATION THERAPIST', 'radiation-therapist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1686, 'RADIO ANNOUNCER', 'radio-announcer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1687, 'RADIO EQUIPMENT INSTALLER', 'radio-equipment-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1688, 'RADIO OPERATOR', 'radio-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1689, 'RADIOLOGIC TECHNICIAN', 'radiologic-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1690, 'RADIOLOGIC TECHNOLOGIST', 'radiologic-technologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1691, 'RAIL CAR REPAIRER', 'rail-car-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1692, 'RAIL TRANSPORTATION WORKER', 'rail-transportation-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1693, 'RAIL YARD ENGINEER', 'rail-yard-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1694, 'RAIL-TRACK LAYING EQUIPMENT OPERATOR', 'railtrack-laying-equipment-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1695, 'RAILROAD BRAKE OPERATOR', 'railroad-brake-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1696, 'RAILROAD CONDUCTOR', 'railroad-conductor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1697, 'RAILROAD POLICE', 'railroad-police', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1698, 'RANCHER', 'rancher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1699, 'REAL ESTATE APPRAISER', 'real-estate-appraiser', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1700, 'REAL ESTATE BROKER', 'real-estate-broker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1701, 'REAL ESTATE MANAGER', 'real-estate-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1702, 'REAL ESTATE SALES AGENT', 'real-estate-sales-agent', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1703, 'RECEIVING CLERK', 'receiving-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1704, 'RECEPTIONIST', 'receptionist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1705, 'RECORD CLERK', 'record-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1706, 'RECREATION TEACHER', 'recreation-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1707, 'RECREATION WORKER', 'recreation-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1708, 'RECREATIONAL THERAPIST', 'recreational-therapist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1709, 'RECREATIONAL VEHICLE SERVICE TECHNICIAN', 'recreational-vehicle-service-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1710, 'RECYCLABLE MATERIAL COLLECTOR', 'recyclable-material-collector', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1711, 'REFEREE', 'referee', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1712, 'REFRACTORY MATERIALS REPAIRER', 'refractory-materials-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1713, 'REFRIGERATION INSTALLER', 'refrigeration-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1714, 'REFRIGERATION MECHANIC', 'refrigeration-mechanic', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1715, 'REFUSE COLLECTOR', 'refuse-collector', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1716, 'REGIONAL PLANNER', 'regional-planner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1717, 'REGISTERED NURSE', 'registered-nurse', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1718, 'REHABILITATION COUNSELOR', 'rehabilitation-counselor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1719, 'REINFORCING IRON WORKER', 'reinforcing-iron-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1720, 'REINFORCING REBAR WORKER', 'reinforcing-rebar-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1721, 'RELIGION TEACHER', 'religion-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1722, 'RELIGIOUS ACTIVITIES DIRECTOR', 'religious-activities-director', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1723, 'RELIGIOUS WORKER', 'religious-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1724, 'RENTAL CLERK', 'rental-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1725, 'REPAIR WORKER', 'repair-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1726, 'REPORTER', 'reporter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1727, 'RESIDENTIAL ADVISOR', 'residential-advisor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1728, 'RESORT DESK CLERK', 'resort-desk-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1729, 'RESPIRATORY THERAPIST', 'respiratory-therapist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1730, 'RESPIRATORY THERAPY TECHNICIAN', 'respiratory-therapy-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1731, 'RETAIL BUYER', 'retail-buyer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1732, 'RETAIL SALESPERSON', 'retail-salesperson', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1733, 'REVENUE AGENT', 'revenue-agent', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1734, 'RIGGER', 'rigger', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1735, 'ROCK SPLITTER', 'rock-splitter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1736, 'ROLLING MACHINE TENDER', 'rolling-machine-tender', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1737, 'ROOF BOLTER', 'roof-bolter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1738, 'ROOFER', 'roofer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1739, 'ROTARY DRILL OPERATOR', 'rotary-drill-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1740, 'ROUSTABOUT', 'roustabout', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1741, 'SAFE REPAIRER', 'safe-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1742, 'SAILOR', 'sailor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1743, 'SALES ENGINEER', 'sales-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1744, 'SALES MANAGER', 'sales-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1745, 'SALES REPRESENTATIVE', 'sales-representative', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1746, 'SAMPLER', 'sampler', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1747, 'SAWING MACHINE OPERATOR', 'sawing-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1748, 'SCALER', 'scaler', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1749, 'SCHOOL BUS DRIVER', 'school-bus-driver', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1750, 'SCHOOL PSYCHOLOGIST', 'school-psychologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1751, 'SCHOOL SOCIAL WORKER', 'school-social-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1752, 'SCOUT LEADER', 'scout-leader', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1753, 'SCULPTOR', 'sculptor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1754, 'SECONDARY EDUCATION TEACHER', 'secondary-education-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1755, 'SECONDARY SCHOOL TEACHER', 'secondary-school-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1756, 'SECRETARY', 'secretary', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1757, 'SECURITIES SALES AGENT', 'securities-sales-agent', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1758, 'SECURITY GUARD', 'security-guard', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1759, 'SECURITY SYSTEM INSTALLER', 'security-system-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1760, 'SEGMENTAL PAVER', 'segmental-paver', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1761, 'SELF-ENRICHMENT EDUCATION TEACHER', 'selfenrichment-education-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1762, 'SEMICONDUCTOR PROCESSOR', 'semiconductor-processor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1763, 'SEPTIC TANK SERVICER', 'septic-tank-servicer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1764, 'SET DESIGNER', 'set-designer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1765, 'SEWER PIPE CLEANER', 'sewer-pipe-cleaner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1766, 'SEWING MACHINE OPERATOR', 'sewing-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1767, 'SHAMPOOER', 'shampooer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1768, 'SHAPER', 'shaper', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1769, 'SHEET METAL WORKER', 'sheet-metal-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1770, 'SHERIFF\'S PATROL OFFICER', 'sheriffs-patrol-officer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1771, 'SHIP CAPTAIN', 'ship-captain', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1772, 'SHIP ENGINEER', 'ship-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1773, 'SHIP LOADER', 'ship-loader', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1774, 'SHIPMATE', 'shipmate', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1775, 'SHIPPING CLERK', 'shipping-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1776, 'SHOE MACHINE OPERATOR', 'shoe-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1777, 'SHOE WORKER', 'shoe-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1778, 'SHORT ORDER COOK', 'short-order-cook', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1779, 'SIGNAL OPERATOR', 'signal-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1780, 'SIGNAL REPAIRER', 'signal-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1781, 'SINGER', 'singer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1782, 'SKI PATROL', 'ski-patrol', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1783, 'SKINCARE SPECIALIST', 'skincare-specialist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1784, 'SLAUGHTERER', 'slaughterer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1785, 'SLICING MACHINE TENDER', 'slicing-machine-tender', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1786, 'SLOT SUPERVISOR', 'slot-supervisor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1787, 'SOCIAL SCIENCE RESEARCH ASSISTANT', 'social-science-research-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1788, 'SOCIAL SCIENCES TEACHER', 'social-sciences-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1789, 'SOCIAL SCIENTIST', 'social-scientist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1790, 'SOCIAL SERVICE ASSISTANT', 'social-service-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1791, 'SOCIAL SERVICE MANAGER', 'social-service-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1792, 'SOCIAL WORK TEACHER', 'social-work-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1793, 'SOCIAL WORKER', 'social-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1794, 'SOCIOLOGIST', 'sociologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1795, 'SOCIOLOGY TEACHER', 'sociology-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1796, 'SOFTWARE DEVELOPER', 'software-developer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1797, 'SOFTWARE ENGINEER', 'software-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1798, 'SOIL SCIENTIST', 'soil-scientist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1799, 'SOLDERER', 'solderer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1800, 'SORTER', 'sorter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1801, 'SOUND ENGINEERING TECHNICIAN', 'sound-engineering-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1802, 'SPACE SCIENTIST', 'space-scientist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1803, 'SPECIAL EDUCATION TEACHER', 'special-education-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1804, 'SPEECH-LANGUAGE PATHOLOGIST', 'speechlanguage-pathologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1805, 'SPORTS BOOK RUNNER', 'sports-book-runner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1806, 'SPORTS ENTERTAINER', 'sports-entertainer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1807, 'SPORTS PERFORMER', 'sports-performer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1808, 'STATIONARY ENGINEER', 'stationary-engineer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1809, 'STATISTICAL ASSISTANT', 'statistical-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1810, 'STATISTICIAN', 'statistician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1811, 'STEAMFITTER', 'steamfitter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1812, 'STOCK CLERK', 'stock-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1813, 'STOCK MOVER', 'stock-mover', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1814, 'STONEMASON', 'stonemason', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1815, 'STREET VENDOR', 'street-vendor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1816, 'STREETCAR OPERATOR', 'streetcar-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1817, 'STRUCTURAL IRON WORKER', 'structural-iron-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1818, 'STRUCTURAL METAL FABRICATOR', 'structural-metal-fabricator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1819, 'STRUCTURAL METAL FITTER', 'structural-metal-fitter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1820, 'STRUCTURAL STEEL WORKER', 'structural-steel-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1821, 'STUCCO MASON', 'stucco-mason', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1822, 'SUBSTANCE ABUSE COUNSELOR', 'substance-abuse-counselor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1823, 'SUBSTANCE ABUSE SOCIAL WORKER', 'substance-abuse-social-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1824, 'SUBWAY OPERATOR', 'subway-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1825, 'SURFACING EQUIPMENT OPERATOR', 'surfacing-equipment-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1826, 'SURGEON', 'surgeon', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1827, 'SURGICAL TECHNOLOGIST', 'surgical-technologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1828, 'SURVEY RESEARCHER', 'survey-researcher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1829, 'SURVEYING TECHNICIAN', 'surveying-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1830, 'SURVEYOR', 'surveyor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1831, 'SWITCH OPERATOR', 'switch-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1832, 'SWITCHBOARD OPERATOR', 'switchboard-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1833, 'TAILOR', 'tailor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1834, 'TAMPING EQUIPMENT OPERATOR', 'tamping-equipment-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1835, 'TANK CAR LOADER', 'tank-car-loader', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1836, 'TAPER', 'taper', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1837, 'TAX COLLECTOR', 'tax-collector', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1838, 'TAX EXAMINER', 'tax-examiner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1839, 'TAX PREPARER', 'tax-preparer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1840, 'TAXI DRIVER', 'taxi-driver', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1841, 'TEACHER ASSISTANT', 'teacher-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1842, 'TEACHER', 'teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1843, 'TEAM ASSEMBLER', 'team-assembler', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1844, 'TECHNICAL WRITER', 'technical-writer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1845, 'TELECOMMUNICATIONS EQUIPMENT INSTALLER', 'telecommunications-equipment-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1846, 'TELEMARKETER', 'telemarketer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1847, 'TELEPHONE OPERATOR', 'telephone-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1848, 'TELEVISION ANNOUNCER', 'television-announcer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1849, 'TELLER', 'teller', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1850, 'TERRAZZO FINISHER', 'terrazzo-finisher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1851, 'TERRAZZO WORKER', 'terrazzo-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1852, 'TESTER', 'tester', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1853, 'TEXTILE BLEACHING OPERATOR', 'textile-bleaching-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1854, 'TEXTILE CUTTING MACHINE SETTER', 'textile-cutting-machine-setter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1855, 'TEXTILE KNITTING MACHINE SETTER', 'textile-knitting-machine-setter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1856, 'TEXTILE PRESSER', 'textile-presser', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1857, 'TEXTILE WORKER', 'textile-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1858, 'THERAPIST', 'therapist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1859, 'TICKET AGENT', 'ticket-agent', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1860, 'TICKET TAKER', 'ticket-taker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1861, 'TILE SETTER', 'tile-setter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1862, 'TIMEKEEPING CLERK', 'timekeeping-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1863, 'TIMING DEVICE ASSEMBLER', 'timing-device-assembler', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1864, 'TIRE BUILDER', 'tire-builder', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1865, 'TIRE CHANGER', 'tire-changer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1866, 'TIRE REPAIRER', 'tire-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1867, 'TITLE ABSTRACTOR', 'title-abstractor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1868, 'TITLE EXAMINER', 'title-examiner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1869, 'TITLE SEARCHER', 'title-searcher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1870, 'TOBACCO ROASTING MACHINE OPERATOR', 'tobacco-roasting-machine-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1871, 'TOOL FILER', 'tool-filer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1872, 'TOOL GRINDER', 'tool-grinder', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1873, 'TOOL MAKER', 'tool-maker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1874, 'TOOL SHARPENER', 'tool-sharpener', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1875, 'TOUR GUIDE', 'tour-guide', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1876, 'TOWER EQUIPMENT INSTALLER', 'tower-equipment-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1877, 'TOWER OPERATOR', 'tower-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1878, 'TRACK SWITCH REPAIRER', 'track-switch-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1879, 'TRACTOR OPERATOR', 'tractor-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1880, 'TRACTOR-TRAILER TRUCK DRIVER', 'tractortrailer-truck-driver', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1881, 'TRAFFIC CLERK', 'traffic-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1882, 'TRAFFIC TECHNICIAN', 'traffic-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1883, 'TRAINING AND DEVELOPMENT MANAGER', 'training-and-development-manager', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1884, 'TRAINING AND DEVELOPMENT SPECIALIST', 'training-and-development-specialist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1885, 'TRANSIT POLICE', 'transit-police', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1886, 'TRANSLATOR', 'translator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1887, 'TRANSPORTATION EQUIPMENT PAINTER', 'transportation-equipment-painter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1888, 'TRANSPORTATION INSPECTOR', 'transportation-inspector', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1889, 'TRANSPORTATION SECURITY SCREENER', 'transportation-security-screener', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1890, 'TRANSPORTATION WORKER', 'transportation-worker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1891, 'TRAPPER', 'trapper', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1892, 'TRAVEL AGENT', 'travel-agent', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1893, 'TRAVEL CLERK', 'travel-clerk', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1894, 'TRAVEL GUIDE', 'travel-guide', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1895, 'TREE PRUNER', 'tree-pruner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1896, 'TREE TRIMMER', 'tree-trimmer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1897, 'TRIMMER', 'trimmer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1898, 'TRUCK LOADER', 'truck-loader', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1899, 'TRUCK MECHANIC', 'truck-mechanic', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1900, 'TUNER', 'tuner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1901, 'TURNING MACHINE TOOL OPERATOR', 'turning-machine-tool-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1902, 'TYPIST', 'typist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1903, 'UMPIRE', 'umpire', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1904, 'UNDERTAKER', 'undertaker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1905, 'UPHOLSTERER', 'upholsterer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1906, 'URBAN PLANNER', 'urban-planner', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1907, 'USHER', 'usher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1908, 'VALVE INSTALLER', 'valve-installer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1909, 'VENDING MACHINE SERVICER', 'vending-machine-servicer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1910, 'VETERINARIAN', 'veterinarian', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1911, 'VETERINARY ASSISTANT', 'veterinary-assistant', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1912, 'VETERINARY TECHNICIAN', 'veterinary-technician', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1913, 'VOCATIONAL COUNSELOR', 'vocational-counselor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1914, 'VOCATIONAL EDUCATION TEACHER', 'vocational-education-teacher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1915, 'WAITER', 'waiter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1916, 'WAITRESS', 'waitress', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1917, 'WATCH REPAIRER', 'watch-repairer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1918, 'WATER TREATMENT PLANT OPERATOR', 'water-treatment-plant-operator', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1919, 'WEAVING MACHINE SETTER', 'weaving-machine-setter', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1920, 'WEB DEVELOPER', 'web-developer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1921, 'WEIGHER', 'weigher', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1922, 'WELDER', 'welder', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1923, 'WELLHEAD PUMPER', 'wellhead-pumper', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1924, 'WHOLESALE BUYER', 'wholesale-buyer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1925, 'WILDLIFE BIOLOGIST', 'wildlife-biologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1926, 'WINDOW TRIMMER', 'window-trimmer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1927, 'WOOD PATTERNMAKER', 'wood-patternmaker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1928, 'WOODWORKER', 'woodworker', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1929, 'WORD PROCESSOR', 'word-processor', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1930, 'WRITER', 'writer', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1931, 'YARDMASTER', 'yardmaster', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39'),
(1932, 'ZOOLOGIST', 'zoologist', NULL, '2021-03-12 14:17:39', '2021-03-12 14:17:39');

-- --------------------------------------------------------

--
-- Table structure for table `qualifications`
--

CREATE TABLE `qualifications` (
  `id` int(11) NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  `school` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `immigrantType` varchar(255) DEFAULT NULL,
  `refType` varchar(255) DEFAULT NULL,
  `immigrantId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `degreeId` int(11) DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  `stateId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qualifications`
--

INSERT INTO `qualifications` (`id`, `from`, `to`, `school`, `city`, `immigrantType`, `refType`, `immigrantId`, `createdAt`, `updatedAt`, `degreeId`, `countryId`, `stateId`) VALUES
(11, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Yaba', 'general', 'applicant', 1, '2021-04-05 23:32:59', '2021-04-05 23:32:59', 3, 162, NULL),
(12, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Unilag', 'Lekki', 'general', 'applicant', 1, '2021-04-05 23:32:59', '2021-04-05 23:32:59', 1, 162, NULL),
(13, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Somolu', 'general', 'spouse', 1, '2021-04-05 23:32:59', '2021-04-05 23:32:59', 5, 162, NULL),
(18, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Yaba', 'general', 'applicant', 1, '2021-04-05 23:36:34', '2021-04-05 23:36:34', 3, 162, NULL),
(19, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Unilag', 'Lekki', 'general', 'applicant', 1, '2021-04-05 23:36:34', '2021-04-05 23:36:34', 1, 162, NULL),
(20, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Somolu', 'general', 'spouse', 1, '2021-04-05 23:36:34', '2021-04-05 23:36:34', 5, 162, NULL),
(21, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Yaba', 'general', 'applicant', 2, '2021-04-05 23:39:14', '2021-04-05 23:39:14', 3, 162, NULL),
(22, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Unilag', 'Lekki', 'general', 'applicant', 2, '2021-04-05 23:39:14', '2021-04-05 23:39:14', 1, 162, NULL),
(23, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Somolu', 'general', 'spouse', 2, '2021-04-05 23:39:14', '2021-04-05 23:39:14', 3, 162, NULL),
(24, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Yaba', 'general', 'applicant', 3, '2021-04-05 23:40:01', '2021-04-05 23:40:01', 3, 162, NULL),
(25, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Unilag', 'Lekki', 'general', 'applicant', 3, '2021-04-05 23:40:01', '2021-04-05 23:40:01', 1, 162, NULL),
(26, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Somolu', 'general', 'spouse', 3, '2021-04-05 23:40:01', '2021-04-05 23:40:01', 2, 162, NULL),
(27, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Yaba', 'general', 'applicant', 4, '2021-04-05 23:51:45', '2021-04-05 23:51:45', 3, 162, NULL),
(28, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Unilag', 'Lekki', 'general', 'applicant', 4, '2021-04-05 23:51:45', '2021-04-05 23:51:45', 1, 162, NULL),
(29, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Somolu', 'general', 'spouse', 4, '2021-04-05 23:51:45', '2021-04-05 23:51:45', 2, 162, NULL),
(30, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Yaba', 'general', 'applicant', 5, '2021-04-06 00:23:46', '2021-04-06 00:23:46', 3, 162, NULL),
(31, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Unilag', 'Lekki', 'general', 'applicant', 5, '2021-04-06 00:23:46', '2021-04-06 00:23:46', 1, 162, NULL),
(32, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Somolu', 'general', 'spouse', 5, '2021-04-06 00:23:46', '2021-04-06 00:23:46', 2, 162, NULL),
(33, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Yaba', 'general', 'applicant', 6, '2021-04-06 00:24:44', '2021-04-06 00:24:44', 3, 162, NULL),
(34, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Unilag', 'Lekki', 'general', 'applicant', 6, '2021-04-06 00:24:44', '2021-04-06 00:24:44', 1, 162, NULL),
(35, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Somolu', 'general', 'spouse', 6, '2021-04-06 00:24:44', '2021-04-06 00:24:44', 5, 162, NULL),
(36, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Yaba', 'general', 'applicant', 7, '2021-04-06 00:25:03', '2021-04-06 00:25:03', 2, 162, NULL),
(37, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Unilag', 'Lekki', 'general', 'applicant', 7, '2021-04-06 00:25:03', '2021-04-06 00:25:03', 1, 162, NULL),
(38, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Somolu', 'general', 'spouse', 7, '2021-04-06 00:25:03', '2021-04-06 00:25:03', 5, 162, NULL),
(39, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Yaba', 'general', 'applicant', 8, '2021-04-06 00:27:54', '2021-04-06 00:27:54', 2, 162, NULL),
(40, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Unilag', 'Lekki', 'general', 'applicant', 8, '2021-04-06 00:27:54', '2021-04-06 00:27:54', 1, 162, NULL),
(41, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Somolu', 'general', 'spouse', 8, '2021-04-06 00:27:54', '2021-04-06 00:27:54', 5, 162, NULL),
(42, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Yaba', 'general', 'applicant', 9, '2021-04-06 00:30:28', '2021-04-06 00:30:28', 2, 162, NULL),
(43, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Unilag', 'Lekki', 'general', 'applicant', 9, '2021-04-06 00:30:28', '2021-04-06 00:30:28', 1, 162, NULL),
(44, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Somolu', 'general', 'spouse', 9, '2021-04-06 00:30:28', '2021-04-06 00:30:28', 5, 162, NULL),
(45, '2000-12-02 23:00:00', '2020-12-02 23:00:00', 'Yaba College of Technology', 'Yaba', 'business', 'applicant', 11, '2021-04-06 00:33:44', '2021-04-06 00:33:44', 3, 162, 1),
(46, '2000-12-02 23:00:00', '2020-12-02 23:00:00', 'Unilag', 'Yaba', 'general', 'spouse', 10, '2021-04-06 00:33:44', '2021-04-06 00:33:44', 3, 162, 1),
(47, '2000-12-02 23:00:00', '2020-12-02 23:00:00', 'Yaba College of Technology', 'Yaba', 'business', 'applicant', 12, '2021-04-06 00:35:07', '2021-04-06 00:35:07', 3, 162, 1),
(48, '2000-12-02 23:00:00', '2020-12-02 23:00:00', 'Unilag', 'Yaba', 'general', 'spouse', 11, '2021-04-06 00:35:07', '2021-04-06 00:35:07', 3, 162, 1),
(49, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Yaba', 'general', 'applicant', 10, '2021-04-06 00:36:07', '2021-04-06 00:36:07', 3, 162, NULL),
(50, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Unilag', 'Lekki', 'general', 'applicant', 10, '2021-04-06 00:36:07', '2021-04-06 00:36:07', 1, 162, NULL),
(51, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Somolu', 'general', 'spouse', 12, '2021-04-06 00:36:07', '2021-04-06 00:36:07', 5, 162, NULL),
(52, '2000-12-02 23:00:00', '2020-12-02 23:00:00', 'Yaba College of Technology', 'Yaba', 'business', 'applicant', 13, '2021-04-06 00:36:42', '2021-04-06 00:36:42', 3, 162, 1),
(53, '2000-12-02 23:00:00', '2020-12-02 23:00:00', 'Unilag', 'Yaba', 'general', 'spouse', 13, '2021-04-06 00:36:42', '2021-04-06 00:36:42', 3, 162, 1),
(54, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Yaba', 'general', 'applicant', 11, '2021-04-06 01:17:31', '2021-04-06 01:17:31', 2, 162, NULL),
(55, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Unilag', 'Lekki', 'general', 'applicant', 11, '2021-04-06 01:17:31', '2021-04-06 01:17:31', 1, 162, NULL),
(56, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Somolu', 'general', 'spouse', 14, '2021-04-06 01:17:31', '2021-04-06 01:17:31', 5, 162, NULL),
(57, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Yaba', 'general', 'applicant', 12, '2021-04-06 01:17:58', '2021-04-06 01:17:58', 3, 162, NULL),
(58, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Unilag', 'Lekki', 'general', 'applicant', 12, '2021-04-06 01:17:58', '2021-04-06 01:17:58', 1, 162, NULL),
(59, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Somolu', 'general', 'spouse', 15, '2021-04-06 01:17:58', '2021-04-06 01:17:58', 5, 162, NULL),
(60, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Lekki', 'business', 'applicant', 14, '2021-04-07 04:32:57', '2021-04-07 04:32:57', 3, 5, NULL),
(61, '2021-04-02 23:00:00', '2021-04-28 23:00:00', 'Yaba College of Technology', 'Ikeja', 'business', 'applicant', 15, '2021-04-07 04:36:30', '2021-04-07 04:36:30', 3, 162, NULL),
(62, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Ikeja', 'business', 'applicant', 16, '2021-04-07 04:42:05', '2021-04-07 04:42:05', 3, 23, NULL),
(63, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Somolu', 'business', 'applicant', 17, '2021-04-07 04:44:32', '2021-04-07 04:44:32', 1, 162, NULL),
(64, '2021-03-31 23:00:00', '2021-03-31 23:00:00', 'Yaba College of Technology', 'Somolu', 'business', 'applicant', 18, '2021-04-07 04:48:26', '2021-04-07 04:48:26', 3, 162, NULL),
(65, '2021-03-31 23:00:00', '2021-04-29 23:00:00', 'Yaba College of Technology', 'Ikeja', 'business', 'applicant', 19, '2021-04-07 04:50:46', '2021-04-07 04:50:46', 3, 29, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rejected_countries`
--

CREATE TABLE `rejected_countries` (
  `countryId` int(11) NOT NULL,
  `rejectedId` int(11) NOT NULL,
  `rejectedType` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rejected_countries`
--

INSERT INTO `rejected_countries` (`countryId`, `rejectedId`, `rejectedType`, `createdAt`, `updatedAt`) VALUES
(2, 1, 'stkitt', '2021-01-25 15:00:00', '2021-01-25 15:00:00'),
(2, 11, 'antigua', '2021-01-25 13:56:02', '2021-01-25 13:56:02'),
(3, 1, 'stkitt', '2021-01-25 15:00:00', '2021-01-25 15:00:00'),
(5, 11, 'antigua', '2021-01-25 13:56:02', '2021-01-25 13:56:02');

-- --------------------------------------------------------

--
-- Table structure for table `spouses`
--

CREATE TABLE `spouses` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT 'Nil',
  `last_name` varchar(255) DEFAULT 'Nil',
  `dob` datetime NOT NULL,
  `immigrantId` int(11) DEFAULT NULL,
  `spouseType` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `country_of_birth` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `spouses`
--

INSERT INTO `spouses` (`id`, `first_name`, `last_name`, `dob`, `immigrantId`, `spouseType`, `createdAt`, `updatedAt`, `country_of_birth`) VALUES
(1, 'Nil', 'Nil', '1995-06-10 23:00:00', 1, 'general', '2021-04-05 23:36:34', '2021-04-05 23:36:34', NULL),
(2, 'Nil', 'Nil', '1995-06-10 23:00:00', 2, 'general', '2021-04-05 23:39:14', '2021-04-05 23:39:14', NULL),
(3, 'Nil', 'Nil', '1995-06-10 23:00:00', 3, 'general', '2021-04-05 23:40:01', '2021-04-05 23:40:01', NULL),
(4, 'Nil', 'Nil', '1995-06-10 23:00:00', 4, 'general', '2021-04-05 23:51:45', '2021-04-05 23:51:45', NULL),
(5, 'Nil', 'Nil', '1995-06-10 23:00:00', 5, 'general', '2021-04-06 00:23:46', '2021-04-06 00:23:46', NULL),
(6, 'Nil', 'Nil', '1995-06-10 23:00:00', 6, 'general', '2021-04-06 00:24:44', '2021-04-06 00:24:44', NULL),
(7, 'Nil', 'Nil', '1995-06-10 23:00:00', 7, 'general', '2021-04-06 00:25:03', '2021-04-06 00:25:03', NULL),
(8, 'Nil', 'Nil', '1995-06-10 23:00:00', 8, 'general', '2021-04-06 00:27:54', '2021-04-06 00:27:54', NULL),
(9, 'Nil', 'Nil', '1995-06-10 23:00:00', 9, 'general', '2021-04-06 00:30:28', '2021-04-06 00:30:28', NULL),
(10, 'Chioma', 'Osita', '1994-11-05 23:00:00', 11, 'general', '2021-04-06 00:33:44', '2021-04-06 00:33:44', 162),
(11, 'Chioma', 'Osita', '1994-11-05 23:00:00', 12, 'general', '2021-04-06 00:35:07', '2021-04-06 00:35:07', 162),
(12, 'Nil', 'Nil', '1995-06-10 23:00:00', 10, 'general', '2021-04-06 00:36:07', '2021-04-06 00:36:07', NULL),
(13, 'Chioma', 'Osita', '1994-11-05 23:00:00', 13, 'general', '2021-04-06 00:36:42', '2021-04-06 00:36:42', 162),
(14, 'Nil', 'Nil', '1995-06-10 23:00:00', 11, 'general', '2021-04-06 01:17:31', '2021-04-06 01:17:31', NULL),
(15, 'Nil', 'Nil', '1995-06-10 23:00:00', 12, 'general', '2021-04-06 01:17:58', '2021-04-06 01:17:58', 163);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `desc` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `countryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `slug`, `desc`, `createdAt`, `updatedAt`, `countryId`) VALUES
(1, 'Abia', 'abia', NULL, '2021-02-14 01:38:03', '2021-02-14 01:38:03', 162),
(2, 'Adamawa', 'adamawa', 'Adamawa', '2021-02-14 01:38:03', '2021-02-14 01:38:03', 162);

-- --------------------------------------------------------

--
-- Table structure for table `stkitts_immigrants`
--

CREATE TABLE `stkitts_immigrants` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `married` varchar(255) NOT NULL,
  `old_dependents` int(11) DEFAULT '0',
  `young_dependents` int(11) DEFAULT '0',
  `teen_dependents` int(11) DEFAULT '0',
  `average_dependents` int(11) DEFAULT '0',
  `rejected` tinyint(1) NOT NULL DEFAULT '0',
  `deported` tinyint(1) NOT NULL DEFAULT '0',
  `contact_medium` varchar(255) NOT NULL,
  `referee` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `invest_funds` int(11) DEFAULT NULL,
  `networth` int(11) DEFAULT NULL,
  `residence` int(11) DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stkitts_immigrants`
--

INSERT INTO `stkitts_immigrants` (`id`, `first_name`, `last_name`, `email`, `phone`, `married`, `old_dependents`, `young_dependents`, `teen_dependents`, `average_dependents`, `rejected`, `deported`, `contact_medium`, `referee`, `createdAt`, `updatedAt`, `invest_funds`, `networth`, `residence`, `nationality`) VALUES
(1, 'Ebuka', 'Nwosu', 'info@cybertechdigitals.com', '08107539186', 'false', 34, 0, 0, 0, 1, 1, 'Email,WhatsApp,Video Call,Wechat', 'Instagram', '2021-01-25 15:00:00', '2021-01-25 15:00:00', 7, 2, 3, 162);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`, `isAdmin`, `createdAt`, `updatedAt`) VALUES
(4, 'Ebuka', 'Nwosu', 'ebukanwosu45@gmail.com', '$2a$10$q.ISpO2Qwk4SEsWLbd7P9usdSedQPCKnpPGXCtNzk8LzAIsFRulUC', 1, '2021-01-14 21:42:43', '2021-01-14 21:42:43'),
(5, 'Cybertech', 'Digitals', 'info@cybertechdigitals.com', '$2a$10$a2NVTP3aUq095isPQR/ple0VG5w5GEZKvymkddZiqQA0CYVssihbi', 1, '2021-03-14 12:06:00', '2021-03-14 12:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `visited_countries`
--

CREATE TABLE `visited_countries` (
  `countryId` int(11) NOT NULL,
  `visitedId` int(11) NOT NULL,
  `visitedType` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `work_histories`
--

CREATE TABLE `work_histories` (
  `id` int(11) NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  `employer` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `immigrantType` varchar(255) DEFAULT NULL,
  `refType` varchar(255) DEFAULT NULL,
  `immigrantId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `countryId` int(11) DEFAULT NULL,
  `stateId` int(11) DEFAULT NULL,
  `occupationId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `antigua_immigrants`
--
ALTER TABLE `antigua_immigrants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `residence` (`residence`),
  ADD KEY `nationality` (`nationality`),
  ADD KEY `invest_funds` (`invest_funds`),
  ADD KEY `networth` (`networth`);

--
-- Indexes for table `business_immigrants`
--
ALTER TABLE `business_immigrants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `maritalStatusId` (`maritalStatusId`),
  ADD KEY `networth` (`networth`),
  ADD KEY `invest_funds` (`invest_funds`),
  ADD KEY `residenceId` (`residenceId`),
  ADD KEY `citizenshipId` (`citizenshipId`);

--
-- Indexes for table `business_profiles`
--
ALTER TABLE `business_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currect_city` (`currect_city`),
  ADD KEY `currect_country` (`currect_country`),
  ADD KEY `maritalStatusId` (`maritalStatusId`),
  ADD KEY `city_of_birth` (`city_of_birth`),
  ADD KEY `country_of_birth` (`country_of_birth`),
  ADD KEY `preferred_state` (`preferred_state`),
  ADD KEY `businessImmigrantId` (`businessImmigrantId`);

--
-- Indexes for table `citizenshipId`
--
ALTER TABLE `citizenshipId`
  ADD PRIMARY KEY (`businessProfileId`,`countryId`),
  ADD KEY `countryId` (`countryId`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `businessProfileId` (`businessProfileId`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `degrees`
--
ALTER TABLE `degrees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `deported_countries`
--
ALTER TABLE `deported_countries`
  ADD PRIMARY KEY (`countryId`,`deportedId`),
  ADD UNIQUE KEY `tt_unique_constraint` (`countryId`,`deportedId`,`deportedType`);

--
-- Indexes for table `funds`
--
ALTER TABLE `funds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_immigrants`
--
ALTER TABLE `general_immigrants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `maritalStatusId` (`maritalStatusId`),
  ADD KEY `citizenshipId` (`citizenshipId`),
  ADD KEY `residenceId` (`residenceId`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `language_proficiencies`
--
ALTER TABLE `language_proficiencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `languageId` (`languageId`);

--
-- Indexes for table `mailQueues`
--
ALTER TABLE `mailQueues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marital_statuses`
--
ALTER TABLE `marital_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `occupations`
--
ALTER TABLE `occupations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `qualifications`
--
ALTER TABLE `qualifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `degreeId` (`degreeId`),
  ADD KEY `countryId` (`countryId`),
  ADD KEY `stateId` (`stateId`);

--
-- Indexes for table `rejected_countries`
--
ALTER TABLE `rejected_countries`
  ADD PRIMARY KEY (`countryId`,`rejectedId`),
  ADD UNIQUE KEY `tt_unique_constraint` (`countryId`,`rejectedId`,`rejectedType`);

--
-- Indexes for table `spouses`
--
ALTER TABLE `spouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_of_birth` (`country_of_birth`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `countryId` (`countryId`);

--
-- Indexes for table `stkitts_immigrants`
--
ALTER TABLE `stkitts_immigrants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `invest_funds` (`invest_funds`),
  ADD KEY `networth` (`networth`),
  ADD KEY `residence` (`residence`),
  ADD KEY `nationality` (`nationality`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `visited_countries`
--
ALTER TABLE `visited_countries`
  ADD PRIMARY KEY (`countryId`,`visitedId`),
  ADD UNIQUE KEY `tt_unique_constraint` (`countryId`,`visitedId`,`visitedType`);

--
-- Indexes for table `work_histories`
--
ALTER TABLE `work_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `immigrantId` (`immigrantId`),
  ADD KEY `countryId` (`countryId`),
  ADD KEY `stateId` (`stateId`),
  ADD KEY `occupationId` (`occupationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `antigua_immigrants`
--
ALTER TABLE `antigua_immigrants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `business_immigrants`
--
ALTER TABLE `business_immigrants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `business_profiles`
--
ALTER TABLE `business_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `degrees`
--
ALTER TABLE `degrees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `funds`
--
ALTER TABLE `funds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `general_immigrants`
--
ALTER TABLE `general_immigrants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `language_proficiencies`
--
ALTER TABLE `language_proficiencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `mailQueues`
--
ALTER TABLE `mailQueues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=454;

--
-- AUTO_INCREMENT for table `marital_statuses`
--
ALTER TABLE `marital_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `occupations`
--
ALTER TABLE `occupations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1933;

--
-- AUTO_INCREMENT for table `qualifications`
--
ALTER TABLE `qualifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `spouses`
--
ALTER TABLE `spouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stkitts_immigrants`
--
ALTER TABLE `stkitts_immigrants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `work_histories`
--
ALTER TABLE `work_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `antigua_immigrants`
--
ALTER TABLE `antigua_immigrants`
  ADD CONSTRAINT `antigua_immigrants_ibfk_1` FOREIGN KEY (`residence`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `antigua_immigrants_ibfk_2` FOREIGN KEY (`nationality`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `antigua_immigrants_ibfk_3` FOREIGN KEY (`invest_funds`) REFERENCES `funds` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `antigua_immigrants_ibfk_4` FOREIGN KEY (`networth`) REFERENCES `funds` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `business_immigrants`
--
ALTER TABLE `business_immigrants`
  ADD CONSTRAINT `business_immigrants_ibfk_1` FOREIGN KEY (`maritalStatusId`) REFERENCES `marital_statuses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `business_immigrants_ibfk_2` FOREIGN KEY (`networth`) REFERENCES `funds` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `business_immigrants_ibfk_3` FOREIGN KEY (`invest_funds`) REFERENCES `funds` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `business_immigrants_ibfk_4` FOREIGN KEY (`residenceId`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `business_immigrants_ibfk_5` FOREIGN KEY (`citizenshipId`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `business_profiles`
--
ALTER TABLE `business_profiles`
  ADD CONSTRAINT `business_profiles_ibfk_1` FOREIGN KEY (`currect_city`) REFERENCES `states` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `business_profiles_ibfk_2` FOREIGN KEY (`currect_country`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `business_profiles_ibfk_3` FOREIGN KEY (`maritalStatusId`) REFERENCES `marital_statuses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `business_profiles_ibfk_4` FOREIGN KEY (`city_of_birth`) REFERENCES `states` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `business_profiles_ibfk_5` FOREIGN KEY (`country_of_birth`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `business_profiles_ibfk_6` FOREIGN KEY (`preferred_state`) REFERENCES `states` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `business_profiles_ibfk_7` FOREIGN KEY (`businessImmigrantId`) REFERENCES `business_immigrants` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `citizenshipId`
--
ALTER TABLE `citizenshipId`
  ADD CONSTRAINT `citizenshipid_ibfk_1` FOREIGN KEY (`businessProfileId`) REFERENCES `business_profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citizenshipid_ibfk_2` FOREIGN KEY (`countryId`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`businessProfileId`) REFERENCES `business_profiles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `deported_countries`
--
ALTER TABLE `deported_countries`
  ADD CONSTRAINT `deported_countries_ibfk_1` FOREIGN KEY (`countryId`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `general_immigrants`
--
ALTER TABLE `general_immigrants`
  ADD CONSTRAINT `general_immigrants_ibfk_1` FOREIGN KEY (`maritalStatusId`) REFERENCES `marital_statuses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `general_immigrants_ibfk_2` FOREIGN KEY (`citizenshipId`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `general_immigrants_ibfk_3` FOREIGN KEY (`residenceId`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `language_proficiencies`
--
ALTER TABLE `language_proficiencies`
  ADD CONSTRAINT `language_proficiencies_ibfk_1` FOREIGN KEY (`languageId`) REFERENCES `languages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `qualifications`
--
ALTER TABLE `qualifications`
  ADD CONSTRAINT `qualifications_ibfk_1` FOREIGN KEY (`degreeId`) REFERENCES `degrees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `qualifications_ibfk_2` FOREIGN KEY (`countryId`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `qualifications_ibfk_3` FOREIGN KEY (`stateId`) REFERENCES `states` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `rejected_countries`
--
ALTER TABLE `rejected_countries`
  ADD CONSTRAINT `rejected_countries_ibfk_1` FOREIGN KEY (`countryId`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `spouses`
--
ALTER TABLE `spouses`
  ADD CONSTRAINT `spouses_ibfk_1` FOREIGN KEY (`country_of_birth`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_ibfk_1` FOREIGN KEY (`countryId`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `stkitts_immigrants`
--
ALTER TABLE `stkitts_immigrants`
  ADD CONSTRAINT `stkitts_immigrants_ibfk_1` FOREIGN KEY (`invest_funds`) REFERENCES `funds` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `stkitts_immigrants_ibfk_2` FOREIGN KEY (`networth`) REFERENCES `funds` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `stkitts_immigrants_ibfk_3` FOREIGN KEY (`residence`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `stkitts_immigrants_ibfk_4` FOREIGN KEY (`nationality`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `work_histories`
--
ALTER TABLE `work_histories`
  ADD CONSTRAINT `work_histories_ibfk_1` FOREIGN KEY (`immigrantId`) REFERENCES `business_profiles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `work_histories_ibfk_2` FOREIGN KEY (`countryId`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `work_histories_ibfk_3` FOREIGN KEY (`stateId`) REFERENCES `states` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `work_histories_ibfk_4` FOREIGN KEY (`occupationId`) REFERENCES `occupations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
