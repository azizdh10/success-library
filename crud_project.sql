-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 01 déc. 2024 à 00:40
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `crud_project`
--

-- --------------------------------------------------------

--
-- Structure de la table `adhérents`
--

DROP TABLE IF EXISTS `adhérents`;
CREATE TABLE IF NOT EXISTS `adhérents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telephone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `date_inscription` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modification` datetime NOT NULL,
  `Role` enum('Admin','Utilisateur') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Admin',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `adhérents`
--

INSERT INTO `adhérents` (`id`, `nom`, `prenom`, `full_name`, `email`, `password`, `telephone`, `date_naissance`, `date_inscription`, `date_modification`, `Role`) VALUES
(52, 'Kalle', 'Bassem', 'Kalle Bassem', 'bassemkallel@gmail.com', '$2y$10$wuUFrG/Y/Ida8dei241i9.1OSCwtsf6ct2s4eaQAuJ3ydz1vyB4/G', '55555555', '2024-12-02', '2024-11-30 23:32:30', '2024-12-01 00:34:57', 'Admin'),
(50, 'Raslen', 'Weslati', 'Raslen Weslati', 'raslen@gmail.com', '$2y$10$A6g3NUEAiRQRaJo1oitEb.eA9aL/vmPwQpUdVGh9w1gBLbUufIr7K', '12345678', '2024-11-24', '2024-11-30 22:20:12', '2024-11-30 23:47:32', 'Utilisateur'),
(51, 'Aziz', 'Dhifallah', 'Aziz Dhifallah', 'aziz@gmail.com', '$2y$10$k0YN7lv90bODXIIbtbqRf.j6X0Bu7ZkNlhlg8iJy3GxrMSaTJCTqO', '14785296', '2024-11-17', '2024-11-30 22:20:57', '2024-12-01 00:34:57', 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `emprunts`
--

DROP TABLE IF EXISTS `emprunts`;
CREATE TABLE IF NOT EXISTS `emprunts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `membre_id` int NOT NULL,
  `livre_id` int NOT NULL,
  `date_emprunt` date NOT NULL,
  `date_retour` date NOT NULL,
  `statut` enum('En cours','Retard','Terminé') DEFAULT 'En cours',
  PRIMARY KEY (`id`),
  KEY `membre_id` (`membre_id`),
  KEY `livre_id` (`livre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

DROP TABLE IF EXISTS `livres`;
CREATE TABLE IF NOT EXISTS `livres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `disponibilite` int NOT NULL,
  `resume` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `date_ajout` datetime NOT NULL,
  `date_modification` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `livres`
--

INSERT INTO `livres` (`id`, `titre`, `auteur`, `genre`, `disponibilite`, `resume`, `date_ajout`, `date_modification`) VALUES
(46, 'Les miserables', 'Victor Hugo', 'Classique', 13, 'z', '2024-12-01 00:20:06', '2024-12-01 00:26:40');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
