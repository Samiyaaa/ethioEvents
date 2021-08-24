-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2021 at 05:10 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'b59c67bf196a4758191e42f76670ceba');

-- --------------------------------------------------------

--
-- Table structure for table `attendee`
--

CREATE TABLE `attendee` (
  `id` int(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone_no` int(100) NOT NULL,
  `age` tinyint(100) NOT NULL COMMENT '1=''<18'',2=''18-25'',3=''26-40'',4=''>40''',
  `gender` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendee`
--

INSERT INTO `attendee` (`id`, `user_id`, `first_name`, `last_name`, `phone_no`, `age`, `gender`, `address`) VALUES
(5, 62, 'helen', 'abay', 946634456, 2, 'female', 'adama'),
(6, 63, 'yerosan', 'birhanu', 916888012, 2, 'female', 'adama');

-- --------------------------------------------------------

--
-- Table structure for table `audience`
--

CREATE TABLE `audience` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `event_id` int(30) NOT NULL,
  `payment_status` tinyint(1) DEFAULT 0 COMMENT '0= pending, 1 =Paid',
  `attendance_status` tinyint(1) DEFAULT 0 COMMENT '1= present',
  `status` tinyint(1) DEFAULT 0 COMMENT '0 = for verification,  1 = confirmed,2= declined',
  `date_created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `audience`
--

INSERT INTO `audience` (`id`, `name`, `contact`, `email`, `address`, `event_id`, `payment_status`, `attendance_status`, `status`, `date_created`) VALUES
(4, 'saron taye', '0911234457', 'sa@s.com', 'AA', 2, 0, 0, 2, '2021-07-18 01:32:58'),
(5, 'saron taye', '0911234457', 'sa@s.com', 'AA', 2, 1, 0, 1, '2021-07-22 13:30:40'),
(6, 'Samiya Sultan', '0923456789', 'sultansamiyah1@gmail.com', 'Ethiopia', 0, 0, 0, 0, '2021-07-28 04:23:56'),
(7, 'helen', '0934567834', 'helen@gmail.com', 'AA', 47, 0, 0, 0, '2021-08-02 13:33:01'),
(12, 'helu', '0967565434', 'h@h.com', 'AA', 0, 0, 0, 0, '2021-08-05 16:17:34'),
(13, 'helen', '0987766545', 's@a.com', 'AA', 51, 0, 0, 0, '2021-08-05 16:21:31'),
(14, 'sedtyu', '23456789', 's@al.com', 'AA', 50, 0, 0, 0, '2021-08-05 16:33:55'),
(15, 'ssssssss', '0923456789', 'sss@s.com', 'Ethiopia', 43, 0, 0, 0, '2021-08-12 02:38:17'),
(16, 'Helen Abay', '0923456789', 'Helen@gmail.com', 'Ethiopia', 49, 0, 0, 0, '2021-08-19 22:24:23');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `event_id` int(100) NOT NULL,
  `event_name` varchar(100) NOT NULL,
  `Seat_Type` tinyint(11) NOT NULL DEFAULT 1 COMMENT '1=''normal'',2=''VIP''',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=''pending'',2=''accepted'',3=''canceled'''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `user_id`, `event_id`, `event_name`, `Seat_Type`, `status`) VALUES
(6, 62, 47, 'concert', 1, 1),
(11, 55, 44, 'Adis conference', 1, 1),
(13, 63, 47, 'concert', 1, 1),
(14, 62, 51, 'ABCD', 1, 1),
(15, 62, 50, 'sdfg', 1, 1),
(16, 63, 46, 'art', 2, 1),
(38, 62, 51, 'ABCD', 1, 1),
(39, 62, 51, 'ABCD', 1, 1),
(40, 62, 51, 'ABCD', 1, 1),
(60, 62, 51, 'ABCD', 1, 1),
(61, 62, 51, 'ABCD', 2, 1),
(65, 63, 43, 'AbC', 2, 1),
(143, 63, 51, 'ABCD', 1, 1),
(144, 62, 43, 'AbC', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `eventorganizer`
--

CREATE TABLE `eventorganizer` (
  `id` int(100) NOT NULL,
  `organizer_name` varchar(100) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  `Category` tinyint(1) NOT NULL COMMENT '1=''public'',2=''private'',3=''All''',
  `tin_no` varchar(50) NOT NULL,
  `licence` varchar(2048) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eventorganizer`
--

INSERT INTO `eventorganizer` (`id`, `organizer_name`, `phone_no`, `Category`, `tin_no`, `licence`) VALUES
(1, 'sss', '0923456789', 0, '1234567890', 'LOGO3.png'),
(3, 'sss', '0987654321', 0, '1234567890', 'LOGO3.jpg'),
(4, 'sss', '0987654321', 0, '1234567890', 'LOGO3.jpg'),
(5, 'sssdd', '0987654321', 0, '1234567890', 'LOGO2.jpg'),
(6, 'sssddrr', '0987654321', 0, '1234567890', 'LOGO2.jpg'),
(7, 'sssddrr', '0976543289', 0, '1234567890', 'LOGO3.png'),
(8, 'tsion', '0911111312', 1, '09876745', 'LOGO3.png'),
(9, 'helen', '0987676654', 2, '76564534', 'LOGO1.png.jpg'),
(10, 'abebe', '0988776655', 1, '1234567890', 'LOGO2.jpg'),
(11, 'eee', '0987656545', 2, '12345432', 'EditedDiagrams.docx');

-- --------------------------------------------------------

--
-- Table structure for table `eventowner`
--

CREATE TABLE `eventowner` (
  `id` int(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `phone_no` int(16) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eventowner`
--

INSERT INTO `eventowner` (`id`, `first_name`, `last_name`, `phone_no`, `address`) VALUES
(1, 'Samiya', 'Sultan', 923456788, 'AA');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(30) NOT NULL,
  `venue_id` int(30) NOT NULL DEFAULT 5,
  `event` text NOT NULL,
  `description` text NOT NULL,
  `schedule` datetime DEFAULT current_timestamp(),
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=''Public'', 2=''Private''',
  `audience_capacity` int(30) NOT NULL,
  `VIP_seat` int(50) DEFAULT 0,
  `Normal_seat` int(50) DEFAULT 0,
  `payment_type` tinyint(1) DEFAULT 1 COMMENT '1=''Free'',2=''payable''',
  `amount` double NOT NULL DEFAULT 0,
  `VIP_price` double DEFAULT NULL,
  `banner` text NOT NULL,
  `created_by` varchar(100) DEFAULT 'tsii',
  `owned_by` varchar(100) DEFAULT 'Samiya',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `venue_id`, `event`, `description`, `schedule`, `type`, `audience_capacity`, `VIP_seat`, `Normal_seat`, `payment_type`, `amount`, `VIP_price`, `banner`, `created_by`, `owned_by`, `date_created`) VALUES
(43, 5, 'AbC', 'An amazing event', '2021-09-28 15:55:30', 1, 150, 50, 100, 1, 300, 400, 'images/Chl4C1cA/BMW_Welt_Realted_Content_01_720x480.jpg', 'tsii', 'aman', '2021-07-30 00:55:29'),
(46, 5, 'art ', 'ijrfoijor', '2021-07-30 16:05:00', 1, 200, 50, 150, 1, 300, 500, 'images/Dpzc6O92/images.jpg', 'tsii', 'Samiya', '2021-07-31 01:05:00'),
(47, 5, 'concert', 'asdfedc', '2021-07-30 16:05:54', 1, 100, 20, 80, 1, 400, 600, 'images/9J4ib9dx/index.jpg', 'tsii', 'aman', '2021-07-31 01:05:54'),
(49, 5, 'rty', 'yuioo3i-2', '2021-08-05 14:15:29', 1, 111, 11, 100, 1, 200, 300, 'images/mLMWKIMq/photo-1511578314322-379afb476865.jpg', 'tsii', 'Samiya', '2021-08-05 23:15:29'),
(50, 5, 'sdfg', 'fgjkjjij', '2021-08-05 15:03:22', 1, 123, 23, 100, 1, 250, 400, 'images/WNmZjf1w/index.jpg', 'tsii', 'aman', '2021-08-06 00:03:22'),
(51, 4, 'ABCD', 'Don\'t miss this event', '2021-09-20 16:00:00', 1, 300, 50, 250, 1, 400, 800, 'images/0VKA30xW/sample-1.jpg', 'tsion', 'Samiya', '2021-08-08 16:00:25'),
(56, 5, 'yyyyyyyyyy', 'nnnnnnnnnn', '2021-08-06 02:05:39', 1, 200, 50, 150, 1, 200, 450, 'images/PooN2V6K/images.jpg', 'tsii', 'aman', '2021-08-06 11:05:39');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL DEFAULT 46,
  `user_name` varchar(100) NOT NULL,
  `user_rating` int(1) NOT NULL,
  `user_feedback` mediumtext NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `event_id`, `user_name`, `user_rating`, `user_feedback`, `date`) VALUES
(2, 46, 'saroni', 2, 'kkkkkkkkk', '0000-00-00 00:00:00'),
(3, 46, 'saroni', 2, 'dfghhhh', '0000-00-00 00:00:00'),
(4, 56, 'saroniiiii', 1, 'kkk', '0000-00-00 00:00:00'),
(5, 46, 'saroni', 2, 'fffffffff', '0000-00-00 00:00:00'),
(6, 47, 'saroni', 2, 'fffffffff', '0000-00-00 00:00:00'),
(7, 46, 'Samiya', 1, 'hhhhhhhhhhh', '0000-00-00 00:00:00'),
(8, 46, 'yerosan', 0, 'ffdsere', '0000-00-00 00:00:00'),
(9, 50, 'yerosan', 0, 'ffdsere', '0000-00-00 00:00:00'),
(10, 46, 'yero', 0, 'jjjjjjjjjj', '0000-00-00 00:00:00'),
(11, 46, 'abcddd', 3, 'jjjjjjjjjjjj', '0000-00-00 00:00:00'),
(12, 46, 'saroni', 3, 'kkkk', '0000-00-00 00:00:00'),
(13, 49, 'Samiya', 2, 'nnnnnnnn', '0000-00-00 00:00:00'),
(14, 46, 'saroni', 2, 'ggggg', '0000-00-00 00:00:00'),
(16, 47, 'Abel', 2, 'kkkkkkkkk', '0000-00-00 00:00:00'),
(17, 49, 'tsii', 0, 'llllllllllll', '0000-00-00 00:00:00'),
(18, 46, 'han', 2, 'amazing', '0000-00-00 00:00:00'),
(19, 46, 'saaa', 4, 'aaaaaaaaa', '0000-00-00 00:00:00'),
(20, 46, 'saroni', 2, 'great', '0000-00-00 00:00:00'),
(21, 46, 'saroni', 2, 'dddddd', '0000-00-00 00:00:00'),
(22, 47, 'tsii', 3, 'kkkkkkkk', '0000-00-00 00:00:00'),
(23, 47, 'saroni', 3, 'dddddddd', '0000-00-00 00:00:00'),
(24, 47, 'saroni', 5, 'dddddddd', '0000-00-00 00:00:00'),
(25, 47, 'saroni', 5, 'dddddddd', '0000-00-00 00:00:00'),
(26, 47, 'saroni', 5, 'dddddddd', '0000-00-00 00:00:00'),
(27, 47, 'saroni', 5, 'dddddddd', '0000-00-00 00:00:00'),
(28, 47, 'saroni', 5, 'dddddddd', '0000-00-00 00:00:00'),
(29, 47, 'saroni', 5, 'dddddddd', '0000-00-00 00:00:00'),
(30, 47, 'saroni', 1, 'dddddddd', '0000-00-00 00:00:00'),
(31, 47, 'saroni', 4, 'dddddddd', '0000-00-00 00:00:00'),
(32, 47, 'saroni', 5, 'dddddddd', '0000-00-00 00:00:00'),
(33, 47, 'umeyr', 2, 'gggg', '0000-00-00 00:00:00'),
(34, 49, 'saroni', 0, 'hhh', '0000-00-00 00:00:00'),
(35, 49, 'saroniiii', 3, 'hhh', '0000-00-00 00:00:00'),
(36, 49, 'aaaa', 1, 'ssssssss', '0000-00-00 00:00:00'),
(37, 49, 'aaaad', 1, 'ssssssss', '0000-00-00 00:00:00'),
(38, 49, 'Selam', 5, 'aaaaa', '0000-00-00 00:00:00'),
(39, 56, 'kkkk', 3, 'kkkkkkk', '0000-00-00 00:00:00'),
(40, 56, 'kkkkff', 3, 'numbr2', '0000-00-00 00:00:00'),
(41, 56, 'abcddd', 3, 'jjjjjjjjjjj', '0000-00-00 00:00:00'),
(42, 56, 'tsii', 0, 'llllllllll', '0000-00-00 00:00:00'),
(43, 56, 'tsiir', 2, 'eeeee34', '0000-00-00 00:00:00'),
(44, 49, 'mmm', 1, 'mmmmmmm', '0000-00-00 00:00:00'),
(45, 47, 'helu', 3, 'amazing', '0000-00-00 00:00:00'),
(47, 46, 'yerosan', 0, '1111111', '0000-00-00 00:00:00'),
(48, 46, 'yerosan', 0, '1111111', '0000-00-00 00:00:00'),
(49, 47, 'yerosan', 2, 'good', '2021-08-11 02:54:49'),
(50, 46, 'sam', 2, 'aaaa', '2021-08-14 08:17:41'),
(51, 49, 'yerosan', 4, 'nice!', '2021-08-15 20:15:49');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL,
  `incoming_msg_id` int(255) NOT NULL,
  `outgoing_msg_id` int(255) NOT NULL,
  `msg` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`msg_id`, `incoming_msg_id`, `outgoing_msg_id`, `msg`) VALUES
(1, 0, 1, 'hi my name is edom?');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(100) NOT NULL,
  `attendee_id` int(100) DEFAULT NULL,
  `book_id` int(100) DEFAULT NULL,
  `amount` decimal(65,0) NOT NULL,
  `eventOrganizer_id` int(100) DEFAULT NULL,
  `eventOwner_id` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Event coordinating platform', 'info@astu.net', '+251 xx xx xx xx', '1624984260_IMG_2258.jpg', 'Adama Science and Technology University Final Project. Adama Science and Technology University Final Project. Adama Science and Technology University Final Project. Adama Science and Technology University Final Project. Adama Science and Technology University Final Project. Adama Science and Technology University Final Project. Adama Science and Technology University Final Project. Adama Science and Technology University Final Project.Adama Science and Technology University Final Project. Adama Science and Technology University Final Project.&lt;br&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `thread`
--

CREATE TABLE `thread` (
  `id` int(30) NOT NULL,
  `user_ids` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `thread`
--

INSERT INTO `thread` (`id`, `user_ids`) VALUES
(1, '2,3'),
(2, '1,2'),
(3, '4,5'),
(4, '4,6');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `unique_id` int(255) DEFAULT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` tinyint(1) DEFAULT 4 COMMENT '1=Admin,2=Organizer,3=Owner,4=Attendee',
  `status` varchar(250) DEFAULT 'Offline now',
  `avatar` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `unique_id`, `username`, `password`, `email`, `type`, `status`, `avatar`) VALUES
(1, 0, 'admin', '0192023a7bbd73250516f069df18b500', 'admin@admin.com', 1, 'Offline now', ''),
(4, 9, 'ss', '0192023a7bbd73250516f069df18b500', '', 2, 'offline now', ''),
(6, 8, 'Saara', '0192023a7bbd73250516f069df18b500', '', 2, 'Active now', ''),
(38, NULL, 'saroni', 'd41d8cd98f00b204e9800998ecf8427e', 's@s.com', 4, 'Offline now', ''),
(55, NULL, 'saroni', '4a7d1ed414474e4033ac29ccb8653d9b', 's@sxr.com', 4, 'Offline now', ''),
(56, NULL, 'saroniiiii', '4a7d1ed414474e4033ac29ccb8653d9b', 's@b.com', 4, 'Offline now', ''),
(57, NULL, 'tsii', 'b59c67bf196a4758191e42f76670ceba', 'tsi@mail.com', 2, 'Offline now', ''),
(58, NULL, 'admin', '934b535800b1cba8f96a5d72f72f1611', 's@sxrw.com', 2, 'Offline now', ''),
(59, NULL, 'Samiya', 'b59c67bf196a4758191e42f76670ceba', 'sultansamiyah1@gmail.com', 3, 'Offline now', ''),
(60, NULL, 'saroni', '81dc9bdb52d04dc20036dbd8313ed055', 'tsi@erekgemail.com', 4, 'Offline now', ''),
(61, NULL, 'Samiya4', '934b535800b1cba8f96a5d72f72f1611', 'sua@s.com', 4, 'Offline now', ''),
(62, NULL, 'helu', 'b59c67bf196a4758191e42f76670ceba', 'Helen@gmail.com', 4, 'Offline now', ''),
(63, NULL, 'yerosan', '81dc9bdb52d04dc20036dbd8313ed055', 'y@gmail.com', 4, 'Offline now', ''),
(65, NULL, 'Seli', 'b59c67bf196a4758191e42f76670ceba', 'Seli@gmail.com', 4, 'Offline now', ''),
(66, NULL, 'Samri', 'b59c67bf196a4758191e42f76670ceba', 'samri@gmail.com', 4, 'Offline now', ''),
(81, NULL, 'samiya', 'b59c67bf196a4758191e42f76670ceba', 'sam@s.com', 2, 'Offline now', ''),
(88, NULL, 'samiya', 'b0baee9d279d34fa1dfd71aadb908c3f', 'aarr@S.COM', 2, 'Offline now', ''),
(89, NULL, 'sammm', '934b535800b1cba8f96a5d72f72f1611', 'SAM@sam.com', 4, 'Offline now', ''),
(96, NULL, 'Tsionn', 'dbc4d84bfcfe2284ba11beffb853a8c4', 'Tsion@gmail.com', 4, 'Offline now', ''),
(97, NULL, 'Selam', '934b535800b1cba8f96a5d72f72f1611', 'Selam@gmail.com', 2, 'Offline now', ''),
(98, NULL, 'Martha', 'b59c67bf196a4758191e42f76670ceba', 'martha@gmail.com', 2, 'Offline now', ''),
(99, NULL, 'Abel', 'd79c8788088c2193f0244d8f1f36d2db', 'abel@gmail.com', 4, 'Offline now', ''),
(100, NULL, 'Sead', 'b59c67bf196a4758191e42f76670ceba', 'sead@gmail.com', 2, 'Offline now', ''),
(102, NULL, 'ssam', '2be9bd7a3434f7038ca27d1918de58bd', 'ssam@sa.com', 4, 'Offline now', ''),
(103, NULL, 'Yonatan', 'b59c67bf196a4758191e42f76670ceba', 'yonatan@gmail.com', 2, 'Offline now', ''),
(104, NULL, 'umeyr', '934b535800b1cba8f96a5d72f72f1611', 'umeyr@gmail.com', 2, 'Offline now', ''),
(105, NULL, 'aman', 'b59c67bf196a4758191e42f76670ceba', 'aman@gmail.com', 3, 'Offline now', ''),
(106, NULL, 'mekdes', 'b59c67bf196a4758191e42f76670ceba', 'mekdes@gmail.com', 2, 'Offline now', ''),
(138, NULL, 'dddddddd', 'b59c67bf196a4758191e42f76670ceba', 'dd@dde.com', 2, 'Offline now', ''),
(139, NULL, 'saronih', 'b59c67bf196a4758191e42f76670ceba', 'hhhh@s.com', 4, 'Offline now', ''),
(140, NULL, 'kkkkklkl', 'b59c67bf196a4758191e42f76670ceba', 'kkjjj@as.com', 4, 'Offline now', ''),
(141, NULL, 'kkklkjh', '934b535800b1cba8f96a5d72f72f1611', 'sdfd@sa.com', 4, 'Offline now', ''),
(142, NULL, 'kkkalkjh', '934b535800b1cba8f96a5d72f72f1611', 'sadfd@sa.com', 4, 'Offline now', ''),
(143, NULL, 'klkkalkjh', '934b535800b1cba8f96a5d72f72f1611', 'sadjfd@sa.com', 4, 'Offline now', ''),
(144, NULL, 'kkjkmnb', 'b59c67bf196a4758191e42f76670ceba', 'mnbnm@s.com', 4, 'Offline now', ''),
(145, NULL, 'dddsa', 'b59c67bf196a4758191e42f76670ceba', 'ssa@q.com', 4, 'Offline now', ''),
(146, NULL, 'Samiyaoo', '934b535800b1cba8f96a5d72f72f1611', 'ss@aaaw.com', 4, 'Offline now', ''),
(147, NULL, 'aasaam', 'b59c67bf196a4758191e42f76670ceba', 'qa@qq.com', 4, 'Offline now', ''),
(148, NULL, 'tsiiw', '74b87337454200d4d33f80c4663dc5e5', 'hq@h.com', 4, 'Offline now', ''),
(149, NULL, 'saronimm', '934b535800b1cba8f96a5d72f72f1611', 'ddas@w.com', 4, 'Offline now', ''),
(159, NULL, 'tsiionn', 'b59c67bf196a4758191e42f76670ceba', 'ed@ed.com', 4, 'Offline now', ''),
(160, NULL, 'saroddni', '3bad6af0fa4b8b330d162e19938ee981', 'saraddon@s.com', 4, 'Offline now', '');

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `id` int(30) NOT NULL,
  `venue` text NOT NULL,
  `address` text NOT NULL,
  `description` text NOT NULL,
  `rate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`id`, `venue`, `address`, `description`, `rate`) VALUES
(1, 'Ethio Addis', 'Sample Address', 'Ethio Addis bazar', 300),
(2, 'Chrismas Party', 'Addis Ababa', 'Chrimas eve at sheraton hotel.', 250),
(3, 'New Years At habesha restaturant', 'Addis Ababa', 'Lorem ipsum dolor sit amet, id has nostro vivendo, id per alii volutpat inciderint? Graece ornatus gubergren te quo, qui at oblique accusamus, id pro eros etiam conceptam! Ullum clita.', 280),
(4, 'Sample Venue 3', 'Sample only', 'Lorem ipsum dolor sit amet, id has nostro vivendo, id per alii volutpat inciderint? Graece ornatus gubergren te quo, qui at oblique accusamus, id pro eros etiam conceptam! Ullum clita.', 1000),
(5, 'Fana Park', 'Addis Ababa', 'Event at fana Park', 50),
(6, 'aaa', 'Ethiopia', 'asdfghjkasdyfui', 800);

-- --------------------------------------------------------

--
-- Table structure for table `venue_booking`
--

CREATE TABLE `venue_booking` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `venue_id` int(30) NOT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-for verification,1=confirmed,2=canceled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venue_booking`
--

INSERT INTO `venue_booking` (`id`, `name`, `address`, `email`, `contact`, `venue_id`, `duration`, `datetime`, `status`) VALUES
(5, 'tsionn meridee', 'Addis Ababa', 'tsi@ts.com', '0976543289', 4, NULL, NULL, 1),
(6, 'saron taye', 'AA', 'sa@s.com', '0987654321', 1, NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendee`
--
ALTER TABLE `attendee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audience`
--
ALTER TABLE `audience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eventorganizer`
--
ALTER TABLE `eventorganizer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eventowner`
--
ALTER TABLE `eventowner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thread`
--
ALTER TABLE `thread`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venue_booking`
--
ALTER TABLE `venue_booking`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendee`
--
ALTER TABLE `attendee`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `audience`
--
ALTER TABLE `audience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `eventorganizer`
--
ALTER TABLE `eventorganizer`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `eventowner`
--
ALTER TABLE `eventowner`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `thread`
--
ALTER TABLE `thread`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `venue_booking`
--
ALTER TABLE `venue_booking`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
