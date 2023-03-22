-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2023 at 12:48 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Bootstrap'),
(2, 'Java'),
(3, 'PHP'),
(4, 'TypeScript');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(1, 1, 'Nielen Marais', 'fake@gmail.com', 'This is the first comment on the website', 'unapproved', '2023-03-13'),
(4, 1, 'Nielen Marais', 'fake@gmail.com', 'waazzzuuuppp', 'approved', '2023-03-13'),
(5, 1, 'Ted', 'ted@gmail.com', 'my name3 is ted and i like this post', 'unapproved', '2023-03-13'),
(7, 2, 'Kevin', 'kevin@gmail.com', 'kevin in the housee', 'unapproved', '2023-03-13'),
(8, 9, 'Steven', 'steven@gmail.com', 'steevvee', 'unapproved', '2023-03-20'),
(9, 3, 'Steven', 'steven@gmail.com', 'i love that mountain', 'unapproved', '2023-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_user` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(11) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_user`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`) VALUES
(1, 1, 'Nielens first website ', 'Nielen Marais', '', '2023-03-10', 'kilimanjaro.jpg', 'This is my first website and my first post of the website', 'Nielen, Marais, PHP', 0, 'published', 6),
(2, 2, 'EAST WEST NORTH SOUTH', 'Nielen Marais', '', '2023-03-10', 'directions.jpg', 'Those are the only directions we have so treat them with respect', 'east, west, north, south', 1, 'published', 1),
(3, 1, 'TableMountain', 'Nielen Marais', '', '2023-03-13', 'tableM.jpg', 'WAZZZUUUP         ', 'south', 4, 'published', 2),
(9, 3, 'Getting There', '', 'NielenMarais ', '2023-03-19', 'dog.jpg', '<p>content</p>', 'south', 0, 'published', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `randSalt` varchar(255) NOT NULL DEFAULT '$2y$10$iusesomecrazystrings22',
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randSalt`, `token`) VALUES
(1, 'NielenMarais ', '1234', 'Nielen', 'Marais', 'maraisnielen@gmail.com', 'dog.jpg', 'subscriber', '', ''),
(4, 'kellywelly', '1234', 'kelly', 'welly', 'kellywelly@gmail.com', 'dog.jpg', 'subscriber', '', ''),
(11, 'Uli', '12345', 'Ulrich', 'Husselmann', 'uli@gmail.com', 'dog.jpg', 'admin', '', ''),
(13, 'wally', 'wall', 'Waldo', 'Car', 'waldo@gmail.com', 'dog.jpg', 'subscriber', '$2y$10$iusesomecrazystrings22', ''),
(14, 'David', '$2y$12$yc0w9X/459AX8Ig8hjD30.OVo.R5HaOPJ7Bt1VAP2pEO9rl/fVnmS', 'mick', 'jagger', 'dave@gmail.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22', ''),
(15, 'kevin', '$2y$12$5kNAUx.F9QXuG4HRm/GnGej0wq1xzjdJagh2yofxaansapaqJ/zDi', '', '', 'kevin@gmail.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22', ''),
(16, 'friend', '$2y$10$0SYJBcH7293ZkMbOIU2G3eJ0efLa5hAuWELrgFKAJLoEOl8dpGWCW', 'fred', 'end', 'friend@gmail.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22', ''),
(17, 'Steve', '$2y$12$0sI6XTs5FxYbuFxpkFEoCu4j2oNZjk7M1a0OLoeQD7Uqh44fCsXOS', '', '', 'steven@gmail.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22', '');

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE `users_online` (
  `id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`id`, `session`, `time`) VALUES
(1, 'n1karfp2eogcmc9t0i1pa8dbpd', 1679149956),
(2, 't2u36k8tbllhgfadciirqc9evs', 1679413077),
(3, '9vpv1sdagq9ptoj0hjufut4uab', 1679484155);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
