-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 13 nov. 2024 à 14:30
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `centreformation`
--

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
CREATE TABLE IF NOT EXISTS `etudiants` (
  `NumCINEtu` char(10) NOT NULL,
  `NomEtu` varchar(20) NOT NULL,
  `PrenomEtu` varchar(20) NOT NULL,
  `DateNaissance` date NOT NULL,
  `villeEtu` varchar(20) NOT NULL,
  `NiveauEtu` varchar(7) NOT NULL,
  PRIMARY KEY (`NumCINEtu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formations`
--

DROP TABLE IF EXISTS `formations`;
CREATE TABLE IF NOT EXISTS `formations` (
  `CodeForm` char(5) NOT NULL,
  `TitreForm` varchar(30) NOT NULL,
  `DureeForm` varchar(10) NOT NULL,
  `PrixForm` int NOT NULL,
  PRIMARY KEY (`CodeForm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inclusion`
--

DROP TABLE IF EXISTS `inclusion`;
CREATE TABLE IF NOT EXISTS `inclusion` (
  `CodeForm` char(5) DEFAULT NULL,
  `CodeSPec` char(5) DEFAULT NULL,
  KEY `CodeForm` (`CodeForm`),
  KEY `CodeSPec` (`CodeSPec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `Typecours` varchar(50) NOT NULL,
  `NumCINEtu` char(10) DEFAULT NULL,
  `CodeSess` char(5) DEFAULT NULL,
  KEY `NumCINEtu` (`NumCINEtu`),
  KEY `CodeSess` (`CodeSess`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `CodeSess` char(5) NOT NULL,
  `NomSess` varchar(10) NOT NULL,
  `DateDebut` date NOT NULL,
  `DtaeFin` date NOT NULL,
  `CodeForm` char(5) NOT NULL,
  PRIMARY KEY (`CodeSess`),
  KEY `CodeForm` (`CodeForm`)
) ;

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `CodeSpec` char(5) NOT NULL,
  `NomSpec` varchar(30) NOT NULL,
  `DescSpec` text NOT NULL,
  PRIMARY KEY (`CodeSpec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
