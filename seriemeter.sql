-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2026 at 07:41 PM
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
-- Database: `seriemeter`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` enum('Movie','Series') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Movie'),
(2, 'Series');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `feedback_no` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`feedback_no`, `name`, `email`, `message`) VALUES
(3, 'Safiyah Malik', 'safiyahmalik@gmail.com', 'I have an inquiry.'),
(4, 'John Doe', 'john@gmail.com', 'i want to connect');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `genre_name`) VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Horror'),
(4, 'Drama'),
(5, 'Sci-Fi'),
(6, 'Thriller'),
(7, 'Romance');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `media_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `director` varchar(100) DEFAULT NULL,
  `release_date` datetime DEFAULT NULL,
  `total_time` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `media_profile` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`media_id`, `title`, `director`, `release_date`, `total_time`, `description`, `media_profile`, `category_id`, `genre_id`, `is_deleted`) VALUES
(11, 'The Dark Knight', 'Christopher Nolan', '2008-07-18 00:00:00', '2h 32m', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice. A gripping tale of heroism, chaos, and moral conflict.', NULL, 1, 4, 1),
(13, 'Inception', 'Christopher Nolan', '2010-07-16 00:00:00', '2h 28m', 'A skilled thief who steals corporate secrets through dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO. A mind-bending journey through layers of dreams where reality and illusion blur endlessly.', '1777693093402_inception.jpg', 1, 5, 1),
(15, 'Parasite', 'Bong Joon-ho', '2019-05-30 00:00:00', '2h 12m', 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan. A darkly comedic thriller that sharply critiques social inequality with completely unpredictable twists.', '1777693274505_parasite.jpg', 1, 6, 1),
(16, 'Whiplash', 'Damien Chazelle', '2014-10-10 00:00:00', '1h 47m', 'A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a students potential. An electrifying and intense exploration of obsession, ambition and the cost of greatness.', '1777693442466_whiplash.jpg', 1, 4, 0),
(18, 'Stranger Things', 'Matt Duffer', '2016-07-15 00:00:00', '4 Seasons', 'When a young boy disappears in a small Indiana town, his mother, a police chief and his friends must confront terrifying supernatural forces to bring him back. A nostalgic love letter to 1980s sci-fi and horror packed with heart, mystery and suspense.', '1777693702431_series_stranger_things.jpg', 2, 5, 0),
(19, 'The Crown', 'Peter Morgan', '2016-11-04 00:00:00', '6 Seasons', 'Follows the political rivalries and personal struggles of Queen Elizabeth II reign and the events that shaped the second half of the 20th century. A lavishly produced drama offering an intimate look behind the closed doors of the British royal family.', '1777693827944_Crown_series.jpg', 2, 4, 0),
(20, 'Dark', 'Baran bo Odar', '2017-12-01 00:00:00', '3 Seasons', 'A family saga with a supernatural twist set in a German town where the disappearance of two young children exposes the hidden relationships among four families connected across time. A brilliantly complex sci-fi thriller where every answer only leads to deeper and darker mysteries.', 'dark.jpg', 2, 5, 0),
(21, 'Squid Game', 'Hwang Dong-hyuk', '2021-09-17 00:00:00', '2 Seasons', 'Hundreds of cash-strapped players accept a strange invitation to compete in childrens games for a tempting prize but with deadly high stakes. A brutal and electrifying thriller that serves as a sharp allegory for capitalism, desperation and human survival.', '1777694020794_squid_game_series.jpg', 2, 6, 0),
(22, 'Black Mirror', 'Charlie Brooker', '2011-12-04 00:00:00', '6 Seasons', 'An anthology series exploring a twisted and high-tech near future where humanitys greatest innovations and darkest instincts collide in unexpected and deeply unsettling ways. Each standalone episode serves as a dark cautionary tale about our unhealthy obsession with technology.', '1777694130088_Black_mirror_series.jpg', 2, 5, 0),
(25, 'The Shawshank Redemption', NULL, '1994-10-14 00:00:00', '2h 22m', 'Andy Dufresne, a successful banker, is arrested for the murders of his wife and her lover, and is sentenced to life imprisonment at the Shawshank prison. He becomes the most unconventional prisoner.', 'the_shawshank_redemption.jpg', 1, 4, 0),
(27, 'The Avengers', 'Joss Whedon', '2012-05-04 00:00:00', '2h 23m', 'When Loki, the adoptive brother of Thor, poses a threat to Earth by trying to subjugate humanity using the powerful Tesseract, Nick Fury, director of the peacekeeping organization S.H.I.E.L.D, assembles a team of superheroes to defend the world from destruction.', 'the_avengers.jpg', 1, 1, 0),
(28, 'The Notebook', 'Nick Cassavetes', '2004-06-25 00:00:00', '2h 3m', 'A poor young man falls in love with a rich young woman and gives her a sense of freedom, but they are soon separated because of their social differences. Years later they meet again and must decide if their love is strong enough to overcome all obstacles standing in their way.', 'the_notebook.jpg', 1, 7, 0),
(29, 'The Silence of the Lambs', 'Jonathan Demme', '1991-02-14 00:00:00', '1h 58m', 'A young FBI cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer who skins his victims. A masterfully crafted psychological thriller that remains one of the most chilling and gripping films ever made.', 'the_silence_of_the_lambs.jpg', 1, 6, 0),
(30, 'Superbad', 'Greg Mottola', '2007-08-17 00:00:00', '1h 53', 'Two co-dependent high school seniors are forced to deal with separation anxiety after their plan to stage a booze-soaked party goes awry. A hilarious and heartfelt coming-of-age comedy about friendship, growing up and the awkward chaos of teenage life.', 'superbad.jpg', 1, 2, 0),
(31, 'The Conjuring', 'James Wan', '2013-07-19 00:00:00', '1h 52m', 'Paranormal investigators Ed and Lorraine Warren work to help a family terrorized by a dark sinister presence in their farmhouse. Based on a terrifying true story, this atmospheric horror film delivers genuine scares through masterful tension and deeply unsettling storytelling.', 'the_conjuring.jpg', 1, 3, 0),
(32, 'Forrest Gump', 'Robert Zemeckis', '1994-07-06 00:00:00', '2h 24m', 'An astronaut is left behind on Mars after his team assumes he is dead following a fierce storm. With limited supplies and no means of communication he must use his knowledge and ingenuity to survive on the hostile red planet while NASA and his crewmates work to bring him home.', 'forrest_gump.jpg', 1, 5, 0),
(33, 'Titanic', 'James Cameron', '1997-12-19 00:00:00', '3h 14m', 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious and ill-fated R.M.S. Titanic. A sweeping and emotionally devastating romance set against one of the greatest maritime disasters in history.', 'titanic.jpg', 1, 7, 0),
(34, 'Gone Girl', 'David Fincher', '2014-10-03 00:00:00', '2h 29m', 'With his wife gone missing on their fifth wedding anniversary, a man becomes the prime suspect and media sensation as more unsettling secrets about their troubled marriage begin to unravel. A razor-sharp and deeply disturbing psychological thriller full of shocking twists.', 'gone_girl.jpg', 1, 6, 0),
(35, 'The Truman Show', 'Peter Weir', '1998-06-05 00:00:00', '1h 43m', 'An insurance salesman discovers his whole life is actually a reality television show, having been filmed since before he was born with everyone around him being paid actors. A brilliantly original drama that raises profound questions about reality, free will and the nature of happiness.', 'the_truman_show.jpg', 1, 4, 0),
(36, 'Money Heist', 'Alex Pina', '2017-05-02 00:00:00', '5 Seasons', 'A criminal mastermind known as The Professor recruits eight thieves with specific abilities and gives them code names of cities to carry out an ambitious plan to rob the Royal Mint of Spain. A gripping and inventive heist thriller filled with tension, emotion and unexpected turns.', 'money_heist.jpg', 2, 6, 0),
(37, 'Friends', 'David Crane', '1994-09-22 00:00:00', '10 Seasons', 'Follows the personal and professional lives of six twenty to thirty something year old friends living in the Manhattan borough of New York City. A timeless and endlessly charming comedy about friendship, love and the beautiful chaos of navigating life together.', 'friends.jpg', 2, 2, 0),
(38, 'Game of Thrones', 'David Benioff', '2011-04-17 00:00:00', '8 seasons', 'Nine noble families wage war against each other in order to gain control over the mythical land of Westeros while an ancient enemy returns after being dormant for thousands of years. A massively ambitious and visually spectacular drama of power, betrayal and survival.', 'game_of_thrones.jpg', 2, 1, 0),
(39, 'Ozark', 'Bill Dubuque', '2017-07-21 00:00:00', '4 Seasons', 'A financial advisor drags his family from Chicago to the Missouri Ozarks where he must launder money to appease a Mexican drug cartel. A tense and brilliantly acted crime drama about how quickly an ordinary family can be consumed by extraordinary darkness.', 'ozark.jpg', 2, 6, 0),
(40, 'The Witcher', 'Lauren Schmidt', '2019-12-20 00:00:00', '3 Seasons', 'Geralt of Rivia, a mutated monster hunter for hire journeys toward his destiny in a turbulent world where people often prove more wicked than beasts. A bold and action-packed fantasy series with rich world building, complex characters and exhilarating combat.', 'the_witcher.jpg', 2, 1, 0),
(41, 'Bridgerton', 'Chris Van Dusen', '2020-12-25 00:00:00', '3 Seasons', 'The eight close-knit siblings of the Bridgerton family look for love and happiness in London high society. A lavish, witty and addictive period romance packed with scandal, passion and the delicious drama of Regency-era courtship.', 'bridgerton.jpg', 2, 7, 0),
(42, 'Mindhunter', 'David Fincher', '2017-10-13 00:00:00', '2 Seasons', 'In the late 1970s two FBI agents expand criminal science by delving into the psychology of murder and getting into the minds of serial killers to understand how they think. A chillingly intelligent and methodical thriller that changed the way we understand criminal profiling.', 'mindhunter.jpg', 2, 6, 0),
(43, 'Euphoria', 'Sam Levinson', '2019-06-16 00:00:00', '3 Seasons', 'A group of high school students navigate love, loss, identity, trauma, drugs and social media in a turbulent and visually stunning portrait of modern teenage life. A raw, provocative and emotionally powerful drama that pushes the boundaries of television storytelling.', 'euphoria.jpg', 2, 4, 0),
(44, 'The Haunting of Hill House', 'Mike Flanagan', '2018-10-12 00:00:00', '1 Season', 'Flashing between past and present, a fractured family confronts haunting memories of their old home and the terrifying events that drove them from it. A masterfully crafted horror series that uses supernatural terror as a devastating metaphor for grief and family trauma.', 'the_haunting_of_hill_house.jpg', 2, 3, 0),
(45, 'Better Call Saul', 'Vince Gilligan', '2015-02-08 00:00:00', '6 Seasons', 'The story of Jimmy McGill, a small-time lawyer searching for his way in the world and his transformation into morally questionable criminal lawyer Saul Goodman before his fateful encounter with Walter White. A beautifully written prequel drama that stands as a masterpiece in its own right.', 'better_call_saul.jpg', 2, 4, 0),
(46, 'Oppenheimer', 'Christopher Nolan', '2023-07-21 00:00:00', '3h 0m', 'The story of American scientist J. Robert Oppenheimer and his role in the development of the atomic bomb during World War II. A stunning and deeply unsettling biographical drama that explores the moral weight of creating a weapon capable of ending the world.', 'oppenheimer.jpg', 1, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `review_text` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `user_id`, `media_id`, `rating`, `review_text`, `created_at`) VALUES
(1, 5, 16, 4, 'bravo', '2026-05-08 11:08:08'),
(2, 5, 25, 5, 'Absolute masterpiece. A must watch to everyone. Best Movie of all time. Freaking loved it. The main character, the side character, everyone did an absolutely mind-blowing job in terms of acting. Everything about this movie is just top notch. I havent seen anything like this before. Every year i rewatch it to feel good. Must watch everyone.', '2026-05-08 19:43:57'),
(3, 6, 33, 4, 'Its a good movie.', '2026-05-11 15:08:27'),
(4, 9, 16, 4, 'quite nice', '2026-05-16 17:32:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `role` enum('Admin','User') NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `user_profile` varchar(255) DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `username`, `role`, `password_hash`, `user_profile`, `is_approved`) VALUES
(5, 'John Berg', 'john@gmail.com', 'John', 'User', '$2a$10$fW7agsTuknNdCxVBalo1B.TOZGwzmaFcGU6A72lipEOjA/kyyjN.e', 'John.jpg', 1),
(6, 'Avin Subedi', 'avinsubedi7@gmail.com', 'Avin', 'Admin', '$2a$10$GE16cWcYK5Zsaz4GySwgLemXWd2LfsLPv4OlgkV/eqgmeoE2Lj/lW', 'Avin.jpeg', 1),
(9, 'Safiyah Malik', 'safiyahm@gmail.com', 'Safiyah', 'Admin', '$2a$10$zZE1f//E3Tnlexbvg0VwX..L/XG0seZ.B8zrFyvLnbeyft8QK1rWa', 'Safiyah.jpg', 1),
(10, 'Shuvam Karki', 'shuvam@gmail.com', 'Shuvam', 'User', '$2a$10$fexBTdcXdOrIrg9GPAwO5uIOqcp3qT98YXXId9AYyxuD.f4rXBJoK', 'default_profile.png', 1),
(11, 'Shir Razopadhyay', 'shir@gmail.com', 'Shir', 'User', '$2a$10$WrI.w/gUAMIo.5sDzIvAdeqaSGqcnBwAv0N3dN2kIGddyGG4cVdAi', 'default_profile.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `watchlist`
--

CREATE TABLE `watchlist` (
  `watchlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `added_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `watchlist`
--

INSERT INTO `watchlist` (`watchlist_id`, `user_id`, `media_id`, `added_date`) VALUES
(4, 5, 19, '2026-05-08 19:45:27'),
(6, 5, 18, '2026-05-09 19:05:20'),
(7, 5, 15, '2026-05-09 19:05:31'),
(8, 5, 25, '2026-05-09 19:05:41'),
(9, 6, 21, '2026-05-11 14:42:29'),
(13, 9, 33, '2026-05-18 14:10:06'),
(14, 9, 37, '2026-05-20 02:21:10'),
(15, 9, 46, '2026-05-20 02:21:19'),
(16, 9, 41, '2026-05-20 02:21:37'),
(17, 9, 40, '2026-05-20 02:21:45'),
(19, 9, 27, '2026-05-20 02:22:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`feedback_no`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_id`),
  ADD KEY `fk_media_category` (`category_id`),
  ADD KEY `fk_media_genre` (`genre_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `media_id` (`media_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `watchlist`
--
ALTER TABLE `watchlist`
  ADD PRIMARY KEY (`watchlist_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`media_id`),
  ADD KEY `media_id` (`media_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `feedback_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `watchlist`
--
ALTER TABLE `watchlist`
  MODIFY `watchlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `fk_media_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_media_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`media_id`);

--
-- Constraints for table `watchlist`
--
ALTER TABLE `watchlist`
  ADD CONSTRAINT `watchlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `watchlist_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`media_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
