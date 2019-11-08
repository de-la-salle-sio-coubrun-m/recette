-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 08 nov. 2019 à 15:09
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `recette`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `idArticle` int(4) NOT NULL AUTO_INCREMENT,
  `titreArticle` varchar(50) DEFAULT NULL,
  `contenuArticle` varchar(500) DEFAULT NULL,
  `dateArticle` date DEFAULT NULL,
  `auteurArticle` varchar(50) DEFAULT NULL,
  `idRecette` int(4) NOT NULL,
  PRIMARY KEY (`idArticle`),
  UNIQUE KEY `fkRecette` (`idRecette`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `idCategorie` int(4) NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `nomCategorie`) VALUES
(1, 'Viande'),
(2, 'Poisson'),
(3, 'Végétarien');

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `idImage` int(4) NOT NULL AUTO_INCREMENT,
  `nomImage` varchar(50) DEFAULT NULL,
  `urlImage` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idImage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE IF NOT EXISTS `ingredient` (
  `idIngredient` int(4) NOT NULL AUTO_INCREMENT,
  `nomIngredient` varchar(50) DEFAULT NULL,
  `recolteIngredient` varchar(200) DEFAULT NULL,
  `lieuIngredient` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idIngredient`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`idIngredient`, `nomIngredient`, `recolteIngredient`, `lieuIngredient`) VALUES
(1, 'Conserve de Pâté', 'Magasin', 'Magasin de la Régalia (dès le début du jeu), Station-Service de Hammerhead, Bazar JM de l\'aire de Repos de Longwythe/des Chasseurs/Vieux Lestallum, Bazar d\'Aldare (Baie de Galdina), Épicerie du Relais de Chocobos, Mets du Météore (Lestallum)'),
(2, 'Pois Kwéh-Kwéh', 'Au sol // Magasin', 'Régions de Leide et Duscae // Station-Service de Hammerhead, Bazar JM de l\'aire de Repos de Longwythe/des Chasseurs, Bazar d\'Aldare (Baie de Galdina), Ferme de Furloch (Lestallum)'),
(3, 'Poivron', 'Au sol // Magasin', 'Région de Leide // Magasin de la Régalia (dès le début du jeu), Station-Service de Hammerhead, Bazar JM de l\'aire de Repos de Longwythe/des Chasseurs/Vieux Lestallum, Bazar d\'Aldare (Baie de Galdina), Épicerie du Relais de Chocobos, Ferme de Furloch (Lestallum), Bazar de Parvinath (Siège de Meldacio), La Barca Del Vecchio Gobunant (Altissia)'),
(4, 'Viande de Bulette', 'En éliminant une bête // Magasin', '50% de chance d\'en obtenir 2 sur les Bulettes // Magasin de la Régalia (à partir du Chapitre 3), Bazar JM de Vieux Lestallum, Bazar d\'Aldare (Baie de Galdina), Bazar de Parvinath (Siège de Meldacio)'),
(5, 'Viande de Crapaud Géant', 'En éliminant une bête // Magasin', '75% de chance d\'en obtenir 2 sur les Crapaud Géant // Magasin de la Régalia (à partir du Chapitre 5), Bric-à-Brac de Prissock (Lestallum), Bazar JM de Vieux Lestallum, Bazar de Parvinath (Siège de Meldacio)'),
(6, 'Viande de Reine Garula', 'Magasin', 'Bric-à-Brac de Prissock (Lestallum), Bazar de Parvinath (Siège de Meldacio)'),
(7, 'Chair de Pinces-Bouclier', 'En éliminant une bête // Magasin', '50% de chance d\'en obtenir 2 ou 3 sur les Pinces-Bouclier // Magasin de la Régalia (à partir du Chapitre 15), Bric-à-Brac de Prissock (Lestallum), Bazar de JM de Caem'),
(8, 'Crabe Cygillien', 'Magasin', 'Magasin de la Régalia (à partir du Chapitre 15), Bric-à-Brac de Prissock (Lestallum), Frutti Di Mare Dal Gamberetto (Altissia)'),
(9, 'Betterave Potagère', 'Au Sol // Magasin', 'Région de Duscae // Ferme de Furloch (Lestallum), Bazar JM de Vieux Lestallum'),
(10, 'Ail', 'Au sol // Magasin', 'Région de Duscae et Cleigne // Magasin de la Régalia (à partir du Chapitre 3), Épicerie du Relais de Chocobos, Ferme de Furloch (Lestallum), Bazar JM de Vieux Lestallum, Bazar de Parvinath (Siège de Meldacio), La Barca Del Vecchio Gobunant (Altissia)'),
(11, 'Viande de Karlabos', 'En éliminant une bête // Boutique', '50% de chance d\'en obtenir 2 sur les Karlabos // Bazar JM de Caem'),
(12, 'Filet de Bar Allurien', 'En pêchant // Magasin', 'Bar Allurien, Bar Allurien Corail, Bar Allurien Cuivre // Frutti Di Mare Dal Gamberetto (Altissia)'),
(13, 'Filet de Barramundi Éclair', 'En pêchant // Magasin', 'Barramundi Éclair // Frutti Di Mare Dal Gamberetto (Altissia)'),
(14, 'Filet de Carpe du Lucis', 'En pêchant // Magasin', 'Carpe du Lucis, Carpe du Lucis Bronze, Carpe du Lucis Vespérale, Carpe du Lucis Crépuscule // Frutti Di Mare Dal Gamberetto (Altissia'),
(15, 'Filet de Barramundi Amiral', 'En pêchant // Magasin', 'Barramundi Amiral // Frutti Di Mare Dal Gamberetto (Altissia)'),
(16, 'Filet de Barramundi Varech', 'En pêchant // Magasin', 'Barramundi Varech // Frutti Di Mare Dal Gamberetto (Altissia)'),
(17, 'Filet de Saumon de Wannath', 'En pêchant // Magasin', 'Saumon de Wannath // Frutti Di Mare Dal Gamberetto (Altissia)'),
(18, 'Foie de Sahuagin', 'En éliminant une bête', '50% de chance d\'en obtenir sur les Chefs Sahuagin'),
(19, 'Moelle de Kujata', 'Magasin // En éliminant une bête', 'Ferme de Furloch (Lestallum) // 75% de chance d\'en obtenir sur les Molokujata'),
(20, 'Caviar de Celluna', 'Magasin // En pariant sur les combats du Colisée', 'Frutti Di Mare Dal Gamberetto (Altissia) // A échanger contre 240 000 Médailles'),
(21, 'Oeuf d\'Aepyornis', 'Magasin // En pêchant', 'Bazar de JM de Cap Caem, Frutti Di Mare Dal Gamberetto (Altissia) // Truite Cerisier, Truite Brune de Cleigne, Truite Arc-en-Ciel, Truite Arc-en-Ciel Chromée, Truite de Callatein, Truite de Maiden'),
(22, 'Filet de Saumon de Nebula', 'Magasin // En pêchant', 'Frutti Di Mare Dal Gamberetto (Altissia) // Saumon de Nebula'),
(23, 'Filet de Mérou des Marées', 'Magasin // En pêchant', 'Bazar de JM de Cap Caem // Mérou des Marées'),
(24, 'Filet de Bar', 'Magasin // En pêchant', 'Frutti Di Mare Dal Gamberetto (Altissia) // Bar allurien sombre, Bar cygillien'),
(25, 'Filet de Truite Platine Merlot', 'Magasin // En pêchant', 'Frutti Di Mare Dal Gamberetto (Altissia) // Truite Platine Merlot'),
(26, 'Filet de Barramundi', 'Magasin // En pêchant', 'Bazar de JM de Cap Caem, Frutti Di Mare Dal Gamberetto (Altissia) // Barramundi du Roc, Barramundi Rayé'),
(27, 'Filet Brochet de Vesper', 'En pêchant', 'Brochet de Vesper'),
(28, 'Baie d\'Ulwaat', 'Magasin // Cap Caem', 'La Barca Del Vecchio Gobunant (Altissia) // En échangeant 2 carottes de Caem'),
(29, 'Blé de Cleigne', 'Magasin // Quête annexe', 'Bazar JM de l\'aire de Longwythe, Bric-à-Brac de Prissock (Lestallum) // La Baie sur le Gâteau, Besoin Pressant (Takka)'),
(30, 'Blé de Cleigne Supérieur', 'Magasin // Quête annexe', 'Ferme de Furloch (Lestallum), Bazar JM de Vieux Lestallum, La Barca Del Vecchio Gobunant (Altissia) // Une Alliance de Saveurs (Coctura)'),
(31, 'Riz de Saxham', 'Magasin // Quête annexe', 'Ferme de Furloch (Lestallum), Bazar JM de Vieux Lestallum, Bazar de JM de Cap Caem, La Barca Del Vecchio Gobunant (Altissia) // Besoin Pressant (Takka)'),
(32, 'Jambon de Gighee', 'Magasin // Quête annexe', 'Station-Service de Hammerhead, Bazar JM de l\'aire de Repos des Chasseurs/Vieux Lestallum, Bazar d\'Aldare (Baie de Galdina), Épicerie du Relais de Chocobos, Mets du Météore (Lestallum) // Un Coursier Princier (Takka)'),
(33, 'Jambon de Gighee de Premier Choix', 'Magasin', 'Bric-à-Brac de Prissock (Lestallum), La Barca Del Vecchio Gobunant (Altissia)'),
(34, 'Aloyau de Garula', 'Magasin // En éliminant une bête', 'Bazar JM de l\'aire de Repos du Vieux Lestallum, Bazar de Parvinath (Siège de Meldacio), Épicerie du Relais de Chocobos, Mets du Météore (Lestallum) // 75% de chance d\'en obtenir sur les Garula et Garula Vert, 50% de chance d\'en obtenir sur les Garuleau'),
(35, 'Viande d\'Anak', 'Magasin // En éliminant une bête', 'Bazar JM de l\'aire de Repos de Longwythe/Vieux Lestallum, Bazar de Parvinath (Siège de Meldacio), Épicerie du Relais de Chocobos, Mets du Météore (Lestallum) // 50% de chance d\'en obtenir sur les Anak Femelles, 25% de chance d\'en obtenir sur les Anak Mâles'),
(36, 'Entrecôte de Bicorne', 'Magasin // En éliminant une bête // Quête annexe', 'Bazar de Parvinath (Siège de Meldacio), Mets du Météore (Lestallum) // 75% de chance d\'en obtenir sur les Bicorne // La Baie sur le Gâteau (Takka)'),
(37, 'Filet de Béhémoth', 'Magasin // En éliminant une bête', 'Ferme de Furloch (Lestallum), Bazar de Parvinath (Siège de Meldacio) // 100% de chance d\'en obtenir sur Mortoeil, les Béhémoths Tyran et les Béhémoths'),
(38, 'Cuisse de Poussitrix', 'En éliminant une bête', '75% de chance d\'en obtenir sur les Poussitrix'),
(39, 'Poitrine de Catobéplas', 'En éliminant une bête', '50% de chance d\'en obtenir sur les Catobéplas'),
(40, 'Viande de Bredoulochs', 'Magasin // En éliminant une bête', 'Bazar de Parvinath (Siège de Meldacio) // 50% de chance d\'en obtenir sur les Bredoulochs'),
(41, 'Paleron de Leukorne', 'En éliminant une bête', '50% de chance d\'en obtenir sur les Leukorne'),
(42, 'Poitrine de Griffon', 'Magasin // En éliminant une bête // Quête annexe', 'Bric-à-Brac de Prissock (Lestallum) // 75% de chance d\'en obtenir sur les  Griffon (cible de chasse : 15%) // D\'une Pierre deux Coups (Takka)'),
(43, 'Viande de Zu', 'Magasin // En éliminant une bête', 'Ferme de Furloch (Lestallum), Bazar de Parvinath (Siège de Meldacio) // 25% de chance d\'en obtenir sur les Zu'),
(44, 'Viande de Midgardsormr', 'Magasin // En éliminant une bête', 'Bric-à-Brac de Prissock (Lestallum) // 50% de chance d\'en obtenir sur les Midgardsormr et Grootslang'),
(45, 'Poitrine de Pennépée', 'En éliminant une bête', '50% de chance d\'en obtenir sur les Pennépée'),
(46, 'Cup Noodles', 'Magasin', 'Camion à Nouilles (Lestallum)'),
(47, 'Coque de Cleigne', 'Magasin // Au sol', 'Bazar de JM de Cap Caem, Frutti Di Mare Dal Gamberetto (Altissia) // A proximité du Vieux Lestallum'),
(48, 'Rose de Caem', 'Magasin', 'Bazar de JM de Cap Caem, Frutti Di Mare Dal Gamberetto (Altissia)'),
(49, 'Brune de Cleigne', 'Magasin // Au sol', 'Bazar de JM de Cap Caem, Frutti Di Mare Dal Gamberetto (Altissia) // A proximité du Vieux Lestallum'),
(50, 'Poivre de Leide', 'Magasin // Au sol // Quête annexe', 'Station-Service de Hammerhead, Bazar JM de l\'aire de Repos de Longwythe/des Chasseurs/Vieux Lestallum, Bazar d\'Aldare (Baie de Galdina), Épicerie du Relais de Chocobos, Mets du Météore (Lestallum), Bazar de Parvinath (Siège de Meldacio), La Barca Del Vecchio Gobunant (Altissia) // Région de Leide // La Baie des Gâteau, La Fin des Haricots (Takka)'),
(51, 'Lait de Brebis', 'Magasin // Quête annexe', 'Station-Service de Hammerhead, Bazar JM des Chasseurs, Épicerie du Relais de Chocobos, Mets du Météore (Lestallum) // Un Coursier Princier (Takka)'),
(52, 'Curcuma de Schier', 'Magasin // Au sol // Quête annexe', 'Bric-à-Brac de Prissock (Lestallum), Bazar JM du Vieux Lestallum, La Barca Del Vecchio Gobunant (Altissia) // Régions de Duscae et Cleigne // D\'une Pierre deux Coups (Takka)'),
(53, 'Noix de Muscade de Hulldagh', 'Magasin // Au sol // Quête annexe', 'Bric-à-Brac de Prissock (Lestallum), Bazar JM du Vieux Lestallum, La Barca Del Vecchio Gobunant (Altissia) // A proximité de l\'Aire de Repos de Taelpar // La Fin des Haricots (Takka)'),
(54, 'Patate Douce de Leide', ' Au sol // Quête annexe', 'A proximité de l\'Aire de Repos de Longwythe // Une Alliance de Saveurs (Coctura)'),
(55, 'Bois de Fumage', 'Magasin // Au Sol', 'Bric-à-Brac de Prissock (Lestallum) // A proximité de l\'Aire de Repos de Taelpar'),
(56, 'Chêne de Tenebrae', 'Magasin // Au Sol', 'Frutti Di Mare Dal Gamberetto (Altissia) // A proximité du Vieux Lestallum'),
(57, 'Gingembre de Kettier', 'Magasin // Au sol // Quête annexe', 'Ferme de Furloch (Lestallum) // A proximité de la Superette Verinas de Ravatogh // Le Lard, c\'est la Vie (Takka)'),
(58, 'Échalote Allurienne', 'Magasin // Au sol // Quête annexe', 'Ferme de Furloch (Lestallum) // Caverne de Daurell // Le Lard, c\'est la Vie (Takka)'),
(59, 'Chou Aegir', 'Au sol', 'A proximité de la Baie de Galdina'),
(60, 'Bolet d\'Alstor', 'Magasin // Au sol', 'Bazar JM du Vieux Lestallum // A proximité de la Station Coernix d\'Alstor'),
(61, 'Tomate Lucisienne', 'Magasin', 'Bazar JM de l\'aire de Repos de Longwythe/des Chasseurs, Bazar d\'Aldare (Baie de Galdina), Épicerie du Relais de Chocobos, Mets du Météore (Lestallum)'),
(62, 'Oignon Sauvage', 'Magasin // Au sol', 'Bazar JM de l\'aire de Repos de Longwythe, Bazar d\'Aldare (Baie de Galdina), Épicerie du Relais de Chocobos, Mets du Météore (Lestallum) // A proximité du Relai de Chocobo et de l\'Aire de Repos de Cauthess'),
(63, 'Tomate Hargneuse', 'Magasin // Quête annexe', 'Mets du Météore (Lestallum), La Barca Del Vecchio Gobunant (Altissia) // Besoin Pressant, La Fin des Haricots (Takka)'),
(64, 'Pomme de Terre de Leide', 'Magasin // Au sol // Quête annexe', 'Station-Service de Hammerhead, Bazar JM de l\'aire de Repos des Chasseurs, Épicerie du Relais de Chocobos, Mets du Météore (Lestallum) // A proximité de l\'Aire de Repos de Longwythe // Un Coursier Princier (Takka)'),
(65, 'Petit Pois Eosien', 'Au sol', 'Région de Leide'),
(66, 'Fungus', 'Magasin // Au sol // Quête annexe', 'Station-Service de Hammerhead, Bazar JM de l\'aire de Repos des Chasseurs/Vieux Lestallum, Épicerie du Relais de Chocobos, Mets du Météore (Lestallum) // A proximité de la Baie de Galdina // Un Coursier Princier (Takka)'),
(67, 'Truffe de Vesper', 'Magasin // Au sol', 'Bazar JM Vieux Lestallum // A proximité du Siège de Meldacio'),
(68, 'Girolle de Malmalam', 'Magasin // Au sol', 'Bric à Brac de Prissock (Lestallum), Bazar JM Vieux Lestallum // Fourré de Malmalam');

-- --------------------------------------------------------

--
-- Structure de la table `origine`
--

DROP TABLE IF EXISTS `origine`;
CREATE TABLE IF NOT EXISTS `origine` (
  `idOrigine` int(4) NOT NULL AUTO_INCREMENT,
  `nomOrigine` varchar(50) DEFAULT NULL,
  `descriptionOrigine` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idOrigine`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `origine`
--

INSERT INTO `origine` (`idOrigine`, `nomOrigine`, `descriptionOrigine`) VALUES
(1, 'final fantasy XV', 'Final Fantasy XV, annoncé originellement sous le titre Final Fantasy Versus XIII, est un jeu vidéo de la célèbre série Final Fantasy, développé et édité par Square Enix, sorti le 29 novembre 2016 sur les consoles PlayStation 4 et Xbox One. Une Windows Edition et une Royal Edition sont sorties le 6 mars 2018.');

-- --------------------------------------------------------

--
-- Structure de la table `recette`
--

DROP TABLE IF EXISTS `recette`;
CREATE TABLE IF NOT EXISTS `recette` (
  `idRecette` int(4) NOT NULL AUTO_INCREMENT,
  `idOrigine` int(4) NOT NULL,
  `nomRecette` varchar(100) NOT NULL,
  `descriptionRecette` varchar(500) DEFAULT NULL,
  `dureeCuisson` varchar(10) DEFAULT NULL,
  `dureePreparation` varchar(10) DEFAULT NULL,
  `recetteRecette` varchar(500) DEFAULT NULL,
  `effetsRecette` varchar(500) DEFAULT NULL,
  `idCategorie` int(4) NOT NULL,
  `idIngredient1` int(4) DEFAULT NULL,
  `idIngredient2` int(4) DEFAULT NULL,
  `idIngredient3` int(4) DEFAULT NULL,
  `idIngredient4` int(4) DEFAULT NULL,
  `idIngredient5` int(4) DEFAULT NULL,
  `idImage` int(4) DEFAULT NULL,
  PRIMARY KEY (`idRecette`),
  KEY `fkOrigine` (`idOrigine`),
  KEY `fkCategorie` (`idCategorie`),
  KEY `fkIngredient1` (`idIngredient1`),
  KEY `fkIngredient2` (`idIngredient2`),
  KEY `fkIngredient3` (`idIngredient3`),
  KEY `fkIngredient4` (`idIngredient4`),
  KEY `fkIngredient5` (`idIngredient5`),
  KEY `fkImage` (`idImage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`idRecette`) REFERENCES `recette` (`idRecette`);

--
-- Contraintes pour la table `recette`
--
ALTER TABLE `recette`
  ADD CONSTRAINT `fkCategorie` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`),
  ADD CONSTRAINT `fkImage` FOREIGN KEY (`idImage`) REFERENCES `image` (`idImage`),
  ADD CONSTRAINT `fkIngredient1` FOREIGN KEY (`idIngredient1`) REFERENCES `ingredient` (`idIngredient`),
  ADD CONSTRAINT `fkIngredient2` FOREIGN KEY (`idIngredient2`) REFERENCES `ingredient` (`idIngredient`),
  ADD CONSTRAINT `fkIngredient3` FOREIGN KEY (`idIngredient3`) REFERENCES `ingredient` (`idIngredient`),
  ADD CONSTRAINT `fkIngredient4` FOREIGN KEY (`idIngredient4`) REFERENCES `ingredient` (`idIngredient`),
  ADD CONSTRAINT `fkIngredient5` FOREIGN KEY (`idIngredient5`) REFERENCES `ingredient` (`idIngredient`),
  ADD CONSTRAINT `fkOrigine` FOREIGN KEY (`idOrigine`) REFERENCES `origine` (`idOrigine`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
