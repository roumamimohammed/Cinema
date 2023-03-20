-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 20 mars 2023 à 13:31
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cenima`
--

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `film_name` varchar(60) NOT NULL,
  `show_date` date NOT NULL,
  `salle` int(11) NOT NULL,
  `id_film` int(11) NOT NULL,
  `salle_place` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `image` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`film_name`, `show_date`, `salle`, `id_film`, `salle_place`, `prix`, `image`) VALUES
('Sayenz', '2023-05-12', 3, 3, 7, 123, 'téléchargé (2).jfif'),
('Star lite', '2023-04-28', 3, 4, 29, 445, 'téléchargé (1).jfif'),
('Dark night', '2023-04-28', 3, 5, 38, 200, 'téléchargé.jfif'),
('Dark man', '2023-03-07', 2, 6, 42, 200, 'OIP.jfif'),
('The boys', '2023-03-07', 1, 7, 32, 200, 'téléchargé (2).jfif');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id_reservation` int(60) NOT NULL,
  `date_reservation` date NOT NULL,
  `nbr_place` int(60) NOT NULL,
  `prix` int(60) NOT NULL,
  `id_film` int(60) NOT NULL,
  `id_user` int(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `date_reservation`, `nbr_place`, `prix`, `id_film`, `id_user`) VALUES
(9, '2023-02-16', 1, 123, 3, 1000),
(10, '2023-02-27', 1, 200, 5, 1000),
(11, '2023-02-27', 1, 200, 7, 6587),
(12, '2023-02-27', 1, 200, 6, 1000),
(13, '2023-02-27', 1, 200, 6, 1000),
(14, '2023-02-27', 1, 200, 6, 1000),
(15, '2023-02-27', 1, 200, 6, 1000),
(16, '2023-02-27', 1, 200, 6, 1000),
(17, '2023-02-27', 1, 200, 7, 1000),
(18, '2023-02-27', 1, 200, 7, 1000),
(19, '2023-02-27', 1, 200, 7, 1000),
(20, '2023-02-27', 1, 200, 7, 1000),
(21, '2023-02-27', 1, 200, 7, 6587),
(25, '2023-02-28', 1, 200, 6, 6589),
(32, '2023-03-07', 1, 445, 4, 6593),
(33, '2023-03-07', 1, 445, 4, 6593),
(34, '2023-03-07', 1, 445, 4, 6593),
(35, '2023-03-07', 1, 445, 4, 6593),
(37, '2023-03-07', 1, 200, 7, 6592),
(39, '2023-03-07', 1, 200, 6, 6598);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `user_name` varchar(60) NOT NULL,
  `user_username` varchar(60) NOT NULL,
  `user_id` int(11) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`user_name`, `user_username`, `user_id`, `password`) VALUES
('mimi', 'password', 1000, ''),
('cghv', 'password', 1001, ''),
('roumami', 'mohammed', 6566, ''),
('lghafla', 'mohammed', 6567, ''),
('lghafla', 'mohammed', 6568, ''),
('lghafla', 'mohammed', 6569, ''),
('lghafla', 'mohammed', 6570, ''),
('lghafla', 'mohammed', 6571, ''),
('lghaflaZE', 'mohammed', 6572, ''),
('lghaflaZE', 'mohammed', 6573, ''),
('lghaflaZE', 'mohammed', 6574, ''),
('lghaflaZE', 'ROMA', 6575, ''),
('lghaflaZE', 'ROMAhd', 6576, ''),
('lghaflaZE', 'ROMAhd', 6577, ''),
('mimiko', 'moha@hdjsfd.com', 6578, ''),
('mohammed', 'mohammedroumami2016@gmail.com', 6579, ''),
('vhvvb', 'dfghjkjhgf', 6580, ''),
('nb,j;', 'o@gmail.com', 6581, ''),
('mohammed(', 'fadwacherqui@gmail.com', 6582, ''),
('mohammedddd', 'moha@gmail.com', 6583, ''),
('nb,j;d', 'admin@gmail.com', 6584, ''),
('mohammed', 'admin@gmail.com', 6585, ''),
('vhvvb', 'jhsfuyhfrj,z', 6586, ''),
('ROMARINHO', 'fadwa@jhgfds', 6587, ''),
('Zamwa', 'fadwacherqui2@gmail.com', 6588, ''),
('l9abaj', 'michlana@gmail.com', 6589, ''),
('mohammedhgzh', 'fadzhzhwa@jhgfds', 6590, ''),
('Tazi ', 'dedezf@hh.com', 6591, ''),
('YOUCODE', 'YOUCODE@gmail.com', 6592, ''),
('YOUCODE', 'YOUCODE@gmail.com', 6593, ''),
('mohammedroumami2016@gmail.com', 'o@gmail.com', 6594, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX25hbWUiOiJtb2hhbW1lZHJvdW1hbWkyMDE2QGdtYWlsLmNvbSIsInVzZXJfdXNlcm5hbWUiOiJvQGdtYWlsLmNvbSJ9.vJMWA1dvZCEOc1yGCOe2KVkDg_F-oWwiDg32ufOjnXs'),
('mohammedroumami2016@gmail.com', 'moha@gmail.com', 6595, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX25hbWUiOiJtb2hhbW1lZHJvdW1hbWkyMDE2QGdtYWlsLmNvbSIsInVzZXJfdXNlcm5hbWUiOiJtb2hhQGdtYWlsLmNvbSJ9.fS7jgA82PZwK28dplygGhN9-3l6vkp9RYhOEVyQgfl8'),
('YOUCODE', 'michlana@gmail.com', 6596, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX25hbWUiOiJZT1VDT0RFIiwidXNlcl91c2VybmFtZSI6Im1pY2hsYW5hQGdtYWlsLmNvbSJ9.fQ5O03W07IU0JiSrQdA-eaLltArqi1_aozRm_naQsiA'),
('mohammed', 'o@gmail.com', 6597, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX25hbWUiOiJtb2hhbW1lZCIsInVzZXJfdXNlcm5hbWUiOiJvQGdtYWlsLmNvbSJ9.eGvAph6bFtbsVwL93FtjXatFIT117QTbuX2l5AA7GTo'),
('mohammedroumami2016@gmail.com', 'YOUCODE@gmail.com', 6598, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX25hbWUiOiJtb2hhbW1lZHJvdW1hbWkyMDE2QGdtYWlsLmNvbSIsInVzZXJfdXNlcm5hbWUiOiJZT1VDT0RFQGdtYWlsLmNvbSJ9.L9QKC7XXruxMuJFPPemA9tUwzdUtHs2onVywKM3x1TE'),
('fffff', 'bergnaum.talia@example.net', 6599, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX25hbWUiOiJmZmZmZiIsInVzZXJfdXNlcm5hbWUiOiJiZXJnbmF1bS50YWxpYUBleGFtcGxlLm5ldCJ9.gaJpiThJYE3--2GglpXukG9KxOh4L4pyo9Kbq8EeOPY');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_reservation`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `reservation_ibfk_2` (`id_film`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id_film` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_reservation` int(60) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6600;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
