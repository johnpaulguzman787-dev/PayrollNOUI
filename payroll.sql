-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2026 at 01:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payroll`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance_logs`
--

CREATE TABLE `attendance_logs` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(6) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL,
  `late_minutes` int(11) DEFAULT 0,
  `undertime_minutes` int(11) DEFAULT 0,
  `overtime_minutes` int(11) DEFAULT 0,
  `is_absent` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'IT DEPARTMENT', '2026-03-02 18:01:47', '2026-03-02 18:01:47'),
(2, 'NURSING DEPARTMENT', '2026-03-02 18:01:57', '2026-03-02 18:01:57'),
(4, 'FINANCIAL DEPARTMENT', '2026-03-02 18:02:15', '2026-03-02 18:02:15');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` varchar(6) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `date_of_birth` date NOT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `date_hired` date NOT NULL,
  `department_id` int(11) NOT NULL,
  `job_title_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `basic_salary` decimal(12,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `fname`, `mname`, `lname`, `email`, `gender`, `date_of_birth`, `contact_no`, `date_hired`, `department_id`, `job_title_id`, `address`, `created_at`, `updated_at`, `basic_salary`) VALUES
('294187', 'Mark', 'Jason', 'Tabangin', 'tanbangin@gmail.com', 'Male', '2003-05-05', '09987654321', '2026-03-19', 1, 3, 'Urdaneta City Pangasinan', '2026-03-18 16:16:49', '2026-03-18 16:16:57', 60000.00),
('486539', 'Olive', 'Marie', 'Conde', 'olib@gmail.com', 'Female', '2003-01-20', '09987654321', '2026-03-19', 2, 7, 'Urdaneta City Pangasinan', '2026-03-18 19:44:02', '2026-03-18 19:44:02', 75000.00),
('682391', 'John Paul', 'Mamasig', 'Guzman', 'payroll@gmail.com', 'Male', '2003-10-19', '09619948621', '2026-06-20', 4, 4, 'Urdaneta City Pangasinan', '2026-03-18 16:13:23', '2026-03-18 16:13:23', 30000.00),
('683714', 'Kayzel', 'Yes', 'Etrata', 'kayzel@gmail.com', 'Female', '2004-07-21', '09619948621', '2026-03-19', 1, 2, 'Manaoag Pangasinan', '2026-03-18 16:17:56', '2026-03-18 16:17:56', 40000.00),
('693418', 'Phoebe', 'Hanna', 'Estoesta', 'financial@gmail.com', 'Female', '2004-08-14', '09987654321', '2026-03-19', 4, 6, 'Urdaneta City Pangasinan', '2026-03-18 16:15:25', '2026-03-18 16:15:46', 50000.00),
('796508', 'Justin', 'Carl', 'Espelita', 'justinespelita@gmail.com', 'Male', '2003-05-01', '09619948621', '2026-03-19', 1, 2, 'Manaoag Pangasinan', '2026-03-18 16:19:34', '2026-03-18 16:19:34', 35000.00);

-- --------------------------------------------------------

--
-- Table structure for table `employee_shifts`
--

CREATE TABLE `employee_shifts` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(6) NOT NULL,
  `payroll_period_id` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `shift_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_titles`
--

CREATE TABLE `job_titles` (
  `id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_titles`
--

INSERT INTO `job_titles` (`id`, `department_id`, `title`, `created_at`, `updated_at`) VALUES
(1, 4, 'TEST', '2026-03-16 22:45:02', '2026-03-16 22:45:02'),
(2, 1, 'TEST2', '2026-03-16 22:45:11', '2026-03-16 22:45:11'),
(3, 1, 'Lead Programmer', '2026-03-16 22:51:08', '2026-03-16 22:51:08'),
(4, 4, 'Payroll Officer', '2026-03-16 22:51:19', '2026-03-16 22:51:19'),
(5, 4, 'Supervisor', '2026-03-16 22:51:26', '2026-03-16 22:51:26'),
(6, 4, 'Financial Officer', '2026-03-18 16:12:11', '2026-03-18 16:12:11'),
(7, 2, 'Supervisor', '2026-03-18 19:41:54', '2026-03-18 19:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `pagibig_contributions`
--

CREATE TABLE `pagibig_contributions` (
  `id` int(11) NOT NULL,
  `salary_cap` decimal(10,2) NOT NULL,
  `employee_rate_low` decimal(5,2) NOT NULL,
  `employee_rate_high` decimal(5,2) NOT NULL,
  `salary_threshold` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pagibig_contributions`
--

INSERT INTO `pagibig_contributions` (`id`, `salary_cap`, `employee_rate_low`, `employee_rate_high`, `salary_threshold`, `created_at`, `updated_at`, `status`) VALUES
(1, 10000.00, 1.00, 2.00, 1500.00, '2026-03-11 08:52:53', '2026-03-11 08:52:53', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_items`
--

CREATE TABLE `payroll_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payroll_record_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('earning','deduction') NOT NULL,
  `name` varchar(100) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_items`
--

INSERT INTO `payroll_items` (`id`, `payroll_record_id`, `type`, `name`, `amount`, `created_at`, `updated_at`) VALUES
(422, 97, 'deduction', 'SSS', 875.00, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(423, 97, 'deduction', 'PhilHealth', 1500.00, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(424, 97, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(425, 97, 'deduction', 'Withholding Tax', 3604.17, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(426, 98, 'deduction', 'SSS', 750.00, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(427, 98, 'deduction', 'PhilHealth', 750.00, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(428, 98, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(429, 98, 'deduction', 'Withholding Tax', 687.50, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(430, 99, 'deduction', 'SSS', 875.00, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(431, 99, 'deduction', 'PhilHealth', 1000.00, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(432, 99, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(433, 99, 'deduction', 'Withholding Tax', 1604.17, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(434, 100, 'deduction', 'SSS', 875.00, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(435, 100, 'deduction', 'PhilHealth', 1250.00, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(436, 100, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(437, 100, 'deduction', 'Withholding Tax', 2604.17, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(438, 101, 'deduction', 'SSS', 875.00, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(439, 101, 'deduction', 'PhilHealth', 875.00, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(440, 101, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(441, 101, 'deduction', 'Withholding Tax', 1104.17, '2026-03-18 17:36:33', '2026-03-18 17:36:33'),
(442, 102, 'deduction', 'SSS', 875.00, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(443, 102, 'deduction', 'PhilHealth', 1500.00, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(444, 102, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(445, 102, 'deduction', 'Withholding Tax', 3604.17, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(446, 103, 'deduction', 'SSS', 750.00, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(447, 103, 'deduction', 'PhilHealth', 750.00, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(448, 103, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(449, 103, 'deduction', 'Withholding Tax', 687.50, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(450, 104, 'deduction', 'SSS', 875.00, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(451, 104, 'deduction', 'PhilHealth', 1000.00, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(452, 104, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(453, 104, 'deduction', 'Withholding Tax', 1604.17, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(454, 105, 'deduction', 'SSS', 875.00, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(455, 105, 'deduction', 'PhilHealth', 1250.00, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(456, 105, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(457, 105, 'deduction', 'Withholding Tax', 2604.17, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(458, 106, 'deduction', 'SSS', 875.00, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(459, 106, 'deduction', 'PhilHealth', 875.00, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(460, 106, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(461, 106, 'deduction', 'Withholding Tax', 1104.17, '2026-03-18 17:38:41', '2026-03-18 17:38:41'),
(462, 107, 'deduction', 'SSS', 875.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(463, 107, 'deduction', 'PhilHealth', 1500.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(464, 107, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(465, 107, 'deduction', 'Withholding Tax', 3604.17, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(466, 108, 'deduction', 'SSS', 875.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(467, 108, 'deduction', 'PhilHealth', 1875.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(468, 108, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(469, 108, 'deduction', 'Withholding Tax', 5312.50, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(470, 109, 'deduction', 'SSS', 750.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(471, 109, 'deduction', 'PhilHealth', 750.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(472, 109, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(473, 109, 'deduction', 'Withholding Tax', 687.50, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(474, 110, 'deduction', 'SSS', 875.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(475, 110, 'deduction', 'PhilHealth', 1000.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(476, 110, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(477, 110, 'deduction', 'Withholding Tax', 1604.17, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(478, 111, 'deduction', 'SSS', 875.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(479, 111, 'deduction', 'PhilHealth', 1250.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(480, 111, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(481, 111, 'deduction', 'Withholding Tax', 2604.17, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(482, 112, 'deduction', 'SSS', 875.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(483, 112, 'deduction', 'PhilHealth', 875.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(484, 112, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(485, 112, 'deduction', 'Withholding Tax', 1104.17, '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(486, 113, 'deduction', 'SSS', 875.00, '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(487, 113, 'deduction', 'PhilHealth', 1500.00, '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(488, 113, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(489, 113, 'deduction', 'Withholding Tax', 3604.17, '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(490, 114, 'deduction', 'SSS', 875.00, '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(491, 114, 'deduction', 'PhilHealth', 1875.00, '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(492, 114, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(493, 114, 'deduction', 'Withholding Tax', 5312.50, '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(494, 115, 'deduction', 'SSS', 750.00, '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(495, 115, 'deduction', 'PhilHealth', 750.00, '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(496, 115, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(497, 115, 'deduction', 'Withholding Tax', 687.50, '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(498, 116, 'deduction', 'SSS', 875.00, '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(499, 116, 'deduction', 'PhilHealth', 1000.00, '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(500, 116, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(501, 116, 'deduction', 'Withholding Tax', 1604.17, '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(502, 117, 'deduction', 'SSS', 875.00, '2026-03-18 23:25:18', '2026-03-18 23:25:18'),
(503, 117, 'deduction', 'PhilHealth', 1250.00, '2026-03-18 23:25:18', '2026-03-18 23:25:18'),
(504, 117, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 23:25:18', '2026-03-18 23:25:18'),
(505, 117, 'deduction', 'Withholding Tax', 2604.17, '2026-03-18 23:25:18', '2026-03-18 23:25:18'),
(506, 118, 'deduction', 'SSS', 875.00, '2026-03-18 23:25:18', '2026-03-18 23:25:18'),
(507, 118, 'deduction', 'PhilHealth', 875.00, '2026-03-18 23:25:18', '2026-03-18 23:25:18'),
(508, 118, 'deduction', 'Pag-IBIG', 100.00, '2026-03-18 23:25:18', '2026-03-18 23:25:18'),
(509, 118, 'deduction', 'Withholding Tax', 1104.17, '2026-03-18 23:25:18', '2026-03-18 23:25:18');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_items_settings`
--

CREATE TABLE `payroll_items_settings` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` enum('late','undertime','overtime','holiday','leave','absent') NOT NULL,
  `type` enum('earning','deduction') NOT NULL,
  `basis` enum('per_day','per_hour','per_minute') NOT NULL,
  `multiplier` decimal(6,2) NOT NULL DEFAULT 1.00,
  `is_paid` tinyint(1) DEFAULT 1,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_items_settings`
--

INSERT INTO `payroll_items_settings` (`id`, `code`, `name`, `category`, `type`, `basis`, `multiplier`, `is_paid`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'LATE', 'Late', 'late', 'deduction', 'per_minute', 10.00, 0, 1, '2026-03-07 18:44:15', '2026-03-15 21:42:53'),
(2, 'UNDERTIME', 'Undertime', 'undertime', 'deduction', 'per_minute', 1.00, 0, 1, '2026-03-07 18:44:15', '2026-03-07 18:44:15'),
(3, 'OVERTIME', 'Overtime', 'overtime', 'earning', 'per_hour', 1.00, 1, 1, '2026-03-07 18:44:15', '2026-03-07 18:44:15'),
(4, 'HOLIDAY', 'Holiday', 'holiday', 'earning', 'per_day', 1.00, 1, 1, '2026-03-07 18:44:15', '2026-03-07 18:44:15'),
(5, 'LEAVE', 'Leave', 'leave', 'earning', 'per_day', 50.00, 1, 1, '2026-03-07 18:44:15', '2026-03-09 19:44:28'),
(6, 'ABSENT', 'Absent', 'absent', 'deduction', 'per_day', 1.00, 0, 1, '2026-03-07 18:44:15', '2026-03-09 19:33:13');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_periods`
--

CREATE TABLE `payroll_periods` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `payroll_code` varchar(16) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_periods`
--

INSERT INTO `payroll_periods` (`id`, `name`, `payroll_code`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(60, 'Payroll Mar 16 - Mar 30', '80533523', '2026-03-16', '2026-03-30', 'closed', '2026-03-19 01:16:20', '2026-03-19 01:38:17'),
(61, 'Payroll Mar 31 - Apr 14', '77427124', '2026-03-31', '2026-04-14', 'closed', '2026-03-19 01:16:25', '2026-03-19 06:41:16'),
(62, 'Payroll Apr 15 - Apr 29', '96434197', '2026-04-15', '2026-04-29', 'for_approval', '2026-03-19 01:38:34', '2026-03-19 07:16:58'),
(63, 'Payroll Apr 30 - May 14', '70916073', '2026-04-30', '2026-05-14', 'for_approval', '2026-03-19 07:16:55', '2026-03-19 07:25:17'),
(64, 'Payroll May 15 - May 29', '27649731', '2026-05-15', '2026-05-29', 'draft', '2026-03-19 07:25:13', '2026-03-19 07:25:13');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_records`
--

CREATE TABLE `payroll_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payroll_code` varchar(20) DEFAULT NULL,
  `payroll_period_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` varchar(6) NOT NULL,
  `basic_salary` decimal(12,2) NOT NULL,
  `gross_pay` decimal(12,2) NOT NULL,
  `total_earnings` decimal(12,2) DEFAULT 0.00,
  `total_deductions` decimal(12,2) DEFAULT 0.00,
  `net_pay` decimal(12,2) NOT NULL,
  `status` enum('draft','review','approval','paid') DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_records`
--

INSERT INTO `payroll_records` (`id`, `payroll_code`, `payroll_period_id`, `employee_id`, `basic_salary`, `gross_pay`, `total_earnings`, `total_deductions`, `net_pay`, `status`, `created_at`, `updated_at`) VALUES
(97, NULL, 60, '294187', 60000.00, 30000.00, 0.00, 6079.17, 23920.83, 'paid', '2026-03-18 17:36:33', '2026-03-18 17:38:17'),
(98, NULL, 60, '682391', 30000.00, 15000.00, 0.00, 2287.50, 12712.50, 'paid', '2026-03-18 17:36:33', '2026-03-18 17:38:17'),
(99, NULL, 60, '683714', 40000.00, 20000.00, 0.00, 3579.17, 16420.83, 'paid', '2026-03-18 17:36:33', '2026-03-18 17:38:17'),
(100, NULL, 60, '693418', 50000.00, 25000.00, 0.00, 4829.17, 20170.83, 'paid', '2026-03-18 17:36:33', '2026-03-18 17:38:17'),
(101, NULL, 60, '796508', 35000.00, 17500.00, 0.00, 2954.17, 14545.83, 'paid', '2026-03-18 17:36:33', '2026-03-18 17:38:17'),
(102, NULL, 61, '294187', 60000.00, 30000.00, 0.00, 6079.17, 23920.83, 'paid', '2026-03-18 17:38:41', '2026-03-18 22:41:16'),
(103, NULL, 61, '682391', 30000.00, 15000.00, 0.00, 2287.50, 12712.50, 'paid', '2026-03-18 17:38:41', '2026-03-18 22:41:16'),
(104, NULL, 61, '683714', 40000.00, 20000.00, 0.00, 3579.17, 16420.83, 'paid', '2026-03-18 17:38:41', '2026-03-18 22:41:16'),
(105, NULL, 61, '693418', 50000.00, 25000.00, 0.00, 4829.17, 20170.83, 'paid', '2026-03-18 17:38:41', '2026-03-18 22:41:16'),
(106, NULL, 61, '796508', 35000.00, 17500.00, 0.00, 2954.17, 14545.83, 'paid', '2026-03-18 17:38:41', '2026-03-18 22:41:16'),
(107, 'MS-202604-0002', 62, '294187', 60000.00, 30000.00, 0.00, 6079.17, 23920.83, 'draft', '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(108, 'MS-202604-0003', 62, '486539', 75000.00, 37500.00, 0.00, 8162.50, 29337.50, 'draft', '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(109, 'MS-202604-0004', 62, '682391', 30000.00, 15000.00, 0.00, 2287.50, 12712.50, 'draft', '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(110, 'MS-202604-0005', 62, '683714', 40000.00, 20000.00, 0.00, 3579.17, 16420.83, 'draft', '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(111, 'MS-202604-0006', 62, '693418', 50000.00, 25000.00, 0.00, 4829.17, 20170.83, 'draft', '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(112, 'MS-202604-0007', 62, '796508', 35000.00, 17500.00, 0.00, 2954.17, 14545.83, 'draft', '2026-03-18 23:16:58', '2026-03-18 23:16:58'),
(113, 'MS-202604-1256', 63, '294187', 60000.00, 30000.00, 0.00, 6079.17, 23920.83, 'draft', '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(114, 'MS-202604-0876', 63, '486539', 75000.00, 37500.00, 0.00, 8162.50, 29337.50, 'draft', '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(115, 'MS-202604-0180', 63, '682391', 30000.00, 15000.00, 0.00, 2287.50, 12712.50, 'draft', '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(116, 'MS-202604-8123', 63, '683714', 40000.00, 20000.00, 0.00, 3579.17, 16420.83, 'draft', '2026-03-18 23:25:17', '2026-03-18 23:25:17'),
(117, 'MS-202604-0710', 63, '693418', 50000.00, 25000.00, 0.00, 4829.17, 20170.83, 'draft', '2026-03-18 23:25:18', '2026-03-18 23:25:18'),
(118, 'MS-202604-5699', 63, '796508', 35000.00, 17500.00, 0.00, 2954.17, 14545.83, 'draft', '2026-03-18 23:25:18', '2026-03-18 23:25:18');

-- --------------------------------------------------------

--
-- Table structure for table `philhealth_contributions`
--

CREATE TABLE `philhealth_contributions` (
  `id` int(11) NOT NULL,
  `contribution_rate` decimal(5,2) NOT NULL,
  `employee_share` decimal(5,2) NOT NULL,
  `employer_share` decimal(5,2) NOT NULL,
  `min_salary` decimal(10,2) DEFAULT NULL,
  `max_salary` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `philhealth_contributions`
--

INSERT INTO `philhealth_contributions` (`id`, `contribution_rate`, `employee_share`, `employer_share`, `min_salary`, `max_salary`, `created_at`, `updated_at`, `status`) VALUES
(2, 5.00, 2.50, 2.50, 10000.00, 100000.00, '2026-03-12 00:36:43', '2026-03-12 00:36:43', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shifts`
--

INSERT INTO `shifts` (`id`, `department_id`, `name`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, 1, 'OJT', '07:00:00', '16:00:00', '2026-03-03 03:00:07', '2026-03-03 03:00:07'),
(2, 4, 'OJT', '09:00:00', '17:00:00', '2026-03-03 03:17:01', '2026-03-03 03:17:01');

-- --------------------------------------------------------

--
-- Table structure for table `sss_contributions`
--

CREATE TABLE `sss_contributions` (
  `id` int(11) NOT NULL,
  `salary_from` decimal(10,2) NOT NULL,
  `salary_to` decimal(10,2) NOT NULL,
  `monthly_salary_credit` decimal(10,2) NOT NULL,
  `employee_share` decimal(10,2) NOT NULL,
  `employer_share` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sss_contributions`
--

INSERT INTO `sss_contributions` (`id`, `salary_from`, `salary_to`, `monthly_salary_credit`, `employee_share`, `employer_share`, `total`, `status`) VALUES
(5, 0.00, 5249.99, 5000.00, 250.00, 0.00, 250.00, 'active'),
(6, 5250.00, 5749.99, 5500.00, 275.00, 0.00, 275.00, 'active'),
(7, 5750.00, 6249.99, 6000.00, 300.00, 0.00, 300.00, 'active'),
(8, 6250.00, 6749.99, 6500.00, 325.00, 0.00, 325.00, 'active'),
(9, 6750.00, 7249.99, 7000.00, 350.00, 0.00, 350.00, 'active'),
(10, 7250.00, 7749.99, 7500.00, 375.00, 0.00, 375.00, 'active'),
(11, 7750.00, 8249.99, 8000.00, 400.00, 0.00, 400.00, 'active'),
(12, 8250.00, 8749.99, 8500.00, 425.00, 0.00, 425.00, 'active'),
(13, 8750.00, 9249.99, 9000.00, 450.00, 0.00, 450.00, 'active'),
(14, 9250.00, 9749.99, 9500.00, 475.00, 0.00, 475.00, 'active'),
(15, 9750.00, 10249.99, 10000.00, 500.00, 0.00, 500.00, 'active'),
(16, 10250.00, 10749.99, 10500.00, 525.00, 0.00, 525.00, 'active'),
(17, 10750.00, 11249.99, 11000.00, 550.00, 0.00, 550.00, 'active'),
(18, 11250.00, 11749.99, 11500.00, 575.00, 0.00, 575.00, 'active'),
(19, 11750.00, 12249.99, 12000.00, 600.00, 0.00, 600.00, 'active'),
(20, 12250.00, 12749.99, 12500.00, 625.00, 0.00, 625.00, 'active'),
(21, 12750.00, 13249.99, 13000.00, 650.00, 0.00, 650.00, 'active'),
(22, 13250.00, 13749.99, 13500.00, 675.00, 0.00, 675.00, 'active'),
(23, 13750.00, 14249.99, 14000.00, 700.00, 0.00, 700.00, 'active'),
(24, 14250.00, 14749.99, 14500.00, 725.00, 0.00, 725.00, 'active'),
(25, 14750.00, 15249.99, 15000.00, 750.00, 0.00, 750.00, 'active'),
(26, 15250.00, 15749.99, 15500.00, 775.00, 0.00, 775.00, 'active'),
(27, 15750.00, 16249.99, 16000.00, 800.00, 0.00, 800.00, 'active'),
(28, 16250.00, 16749.99, 16500.00, 825.00, 0.00, 825.00, 'active'),
(29, 16750.00, 17249.99, 17000.00, 850.00, 0.00, 850.00, 'active'),
(30, 17250.00, 17749.99, 17500.00, 875.00, 0.00, 875.00, 'active'),
(31, 17750.00, 18249.99, 18000.00, 900.00, 0.00, 900.00, 'active'),
(32, 18250.00, 18749.99, 18500.00, 925.00, 0.00, 925.00, 'active'),
(33, 18750.00, 19249.99, 19000.00, 950.00, 0.00, 950.00, 'active'),
(34, 19250.00, 19749.99, 19500.00, 975.00, 0.00, 975.00, 'active'),
(35, 19750.00, 20249.99, 20000.00, 1000.00, 0.00, 1000.00, 'active'),
(36, 20250.00, 20749.99, 20500.00, 1000.00, 25.00, 1025.00, 'active'),
(37, 20750.00, 21249.99, 21000.00, 1000.00, 50.00, 1050.00, 'active'),
(38, 21250.00, 21749.99, 21500.00, 1000.00, 75.00, 1075.00, 'active'),
(39, 21750.00, 22249.99, 22000.00, 1000.00, 100.00, 1100.00, 'active'),
(40, 22250.00, 22749.99, 22500.00, 1000.00, 125.00, 1125.00, 'active'),
(41, 22750.00, 23249.99, 23000.00, 1000.00, 150.00, 1150.00, 'active'),
(42, 23250.00, 23749.99, 23500.00, 1000.00, 175.00, 1175.00, 'active'),
(43, 23750.00, 24249.99, 24000.00, 1000.00, 200.00, 1200.00, 'active'),
(44, 24250.00, 24749.99, 24500.00, 1000.00, 225.00, 1225.00, 'active'),
(45, 24750.00, 25249.99, 25000.00, 1000.00, 250.00, 1250.00, 'active'),
(46, 25250.00, 25749.99, 25500.00, 1000.00, 275.00, 1275.00, 'active'),
(47, 25750.00, 26249.99, 26000.00, 1000.00, 300.00, 1300.00, 'active'),
(48, 26250.00, 26749.99, 26500.00, 1000.00, 325.00, 1325.00, 'active'),
(49, 26750.00, 27249.99, 27000.00, 1000.00, 350.00, 1350.00, 'active'),
(50, 27250.00, 27749.99, 27500.00, 1000.00, 375.00, 1375.00, 'active'),
(51, 27750.00, 28249.99, 28000.00, 1000.00, 400.00, 1400.00, 'active'),
(52, 28250.00, 28749.99, 28500.00, 1000.00, 425.00, 1425.00, 'active'),
(53, 28750.00, 29249.99, 29000.00, 1000.00, 450.00, 1450.00, 'active'),
(54, 29250.00, 29749.99, 29500.00, 1000.00, 475.00, 1475.00, 'active'),
(55, 29750.00, 30249.99, 30000.00, 1000.00, 500.00, 1500.00, 'active'),
(56, 30250.00, 30749.99, 30500.00, 1000.00, 525.00, 1525.00, 'active'),
(57, 30750.00, 31249.99, 31000.00, 1000.00, 550.00, 1550.00, 'active'),
(58, 31250.00, 31749.99, 31500.00, 1000.00, 575.00, 1575.00, 'active'),
(59, 31750.00, 32249.99, 32000.00, 1000.00, 600.00, 1600.00, 'active'),
(60, 32250.00, 32749.99, 32500.00, 1000.00, 625.00, 1625.00, 'active'),
(61, 32750.00, 33249.99, 33000.00, 1000.00, 650.00, 1650.00, 'active'),
(62, 33250.00, 33749.99, 33500.00, 1000.00, 675.00, 1675.00, 'active'),
(63, 33750.00, 34249.99, 34000.00, 1000.00, 700.00, 1700.00, 'active'),
(64, 34250.00, 34749.99, 34500.00, 1000.00, 725.00, 1725.00, 'active'),
(65, 34750.00, 9999999.99, 35000.00, 1000.00, 750.00, 1750.00, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `tax_contributions`
--

CREATE TABLE `tax_contributions` (
  `id` int(11) NOT NULL,
  `income_from` decimal(12,2) NOT NULL,
  `income_to` decimal(12,2) DEFAULT NULL,
  `base_tax` decimal(12,2) NOT NULL,
  `tax_rate` decimal(5,4) NOT NULL,
  `excess_over` decimal(12,2) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tax_contributions`
--

INSERT INTO `tax_contributions` (`id`, `income_from`, `income_to`, `base_tax`, `tax_rate`, `excess_over`, `status`) VALUES
(1, 0.00, 250000.00, 0.00, 0.0000, 0.00, 'active'),
(2, 250000.01, 400000.00, 0.00, 0.1500, 250000.00, 'active'),
(3, 400000.01, 800000.00, 22500.00, 0.2000, 400000.00, 'active'),
(4, 800000.01, 2000000.00, 102500.00, 0.2500, 800000.00, 'active'),
(5, 2000000.01, 8000000.00, 402500.00, 0.3000, 2000000.00, 'active'),
(6, 8000000.01, NULL, 2202500.00, 0.3500, 8000000.00, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'payroll@gmail.com', '$2y$12$yxNBqdOzThKLFJVH.NcP0.k4kh5uu8W4QnSwmJm52t1WqDeIW4KXi', '2026-03-18 16:13:23', '2026-03-18 16:13:23'),
(2, 'financial@gmail.com', '$2y$12$HvNiGd.tcXhavjm/pdCCx.eMyZub/JE4jRZOGAziPjd.7Ma6S2hnm', '2026-03-18 16:15:25', '2026-03-18 16:15:46'),
(3, 'tanbangin@gmail.com', '$2y$12$w6t057QGyT/fdwdkvrZ3feQieXwmtw6xXphAUryn6IDFXLri2Duqu', '2026-03-18 16:16:49', '2026-03-18 16:16:57'),
(4, 'kayzel@gmail.com', '$2y$12$ej0Qal1ERnT9ASjEYnoAhOAQNrTgGaYwab4ccM.MH6jnfjmYPko/e', '2026-03-18 16:17:56', '2026-03-18 16:17:56'),
(5, 'justinespelita@gmail.com', '$2y$12$uy5ZL7CDElttD3wteZgSZO5AAwip4L7yI.VdVs4ZpSxIdDBqkuLj6', '2026-03-18 16:19:34', '2026-03-18 16:19:34'),
(6, 'olib@gmail.com', '$2y$12$5Ae6RaNHrSuvS5.Upsy53uUUumh1v5M13XYWvBPtu3UuQuv0NCiQG', '2026-03-18 19:44:02', '2026-03-18 19:44:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `shift_id` (`shift_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `employee_shifts`
--
ALTER TABLE `employee_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_emp` (`employee_id`),
  ADD KEY `fk_payroll` (`payroll_period_id`),
  ADD KEY `fk_shift` (`shift_id`);

--
-- Indexes for table `job_titles`
--
ALTER TABLE `job_titles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagibig_contributions`
--
ALTER TABLE `pagibig_contributions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_items`
--
ALTER TABLE `payroll_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_record_id` (`payroll_record_id`);

--
-- Indexes for table `payroll_items_settings`
--
ALTER TABLE `payroll_items_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `payroll_periods`
--
ALTER TABLE `payroll_periods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_records`
--
ALTER TABLE `payroll_records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_code` (`payroll_code`);

--
-- Indexes for table `philhealth_contributions`
--
ALTER TABLE `philhealth_contributions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `sss_contributions`
--
ALTER TABLE `sss_contributions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_contributions`
--
ALTER TABLE `tax_contributions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_shifts`
--
ALTER TABLE `employee_shifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `job_titles`
--
ALTER TABLE `job_titles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pagibig_contributions`
--
ALTER TABLE `pagibig_contributions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payroll_items`
--
ALTER TABLE `payroll_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=510;

--
-- AUTO_INCREMENT for table `payroll_items_settings`
--
ALTER TABLE `payroll_items_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payroll_periods`
--
ALTER TABLE `payroll_periods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `payroll_records`
--
ALTER TABLE `payroll_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `philhealth_contributions`
--
ALTER TABLE `philhealth_contributions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sss_contributions`
--
ALTER TABLE `sss_contributions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `tax_contributions`
--
ALTER TABLE `tax_contributions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD CONSTRAINT `attendance_logs_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_logs_ibfk_2` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_shifts`
--
ALTER TABLE `employee_shifts`
  ADD CONSTRAINT `fk_emp` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_payroll` FOREIGN KEY (`payroll_period_id`) REFERENCES `payroll_periods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_shift` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payroll_items`
--
ALTER TABLE `payroll_items`
  ADD CONSTRAINT `payroll_items_ibfk_1` FOREIGN KEY (`payroll_record_id`) REFERENCES `payroll_records` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shifts`
--
ALTER TABLE `shifts`
  ADD CONSTRAINT `shifts_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
