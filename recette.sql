-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 11 déc. 2019 à 08:34
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
  `idMembre` int(4) NOT NULL,
  `idRecette` int(4) NOT NULL,
  PRIMARY KEY (`idArticle`),
  KEY `fkMembre` (`idMembre`),
  KEY `fkRecetteArticle` (`idRecette`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`idArticle`, `titreArticle`, `contenuArticle`, `dateArticle`, `idMembre`, `idRecette`) VALUES
(5, 'Les boites de conserve un repas sous estimé ', ' Bonjour chère lecteur aujourd\'hui je vais vous parlez de notre sublime \"Chilled Food Tin\" un repas mais bien plus. \r\nParce que se repas en plus de pouvoir vous nourrir lors de vos voyages ou quand vous n\'avez pas envie de faire à manger à l\'avantage d\'être à bas prix. L\'avantage c\'est qu\'une fois cette boite laver vous pouvez l\'utiliser pour faire de multiple chose. Comme d\'un récipient même de décoration de piège, et de plein d\'autre manière si vous laissez votre imagination vous guidez. ', '2019-11-09', 2, 6);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `idCategorie` int(4) NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `nomCategorie`) VALUES
(1, 'Viande'),
(2, 'Poisson'),
(3, 'Végétarien');

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

DROP TABLE IF EXISTS `etat`;
CREATE TABLE IF NOT EXISTS `etat` (
  `idEtat` int(4) NOT NULL AUTO_INCREMENT,
  `labelEtat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEtat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`idEtat`, `labelEtat`) VALUES
(1, 'en attente'),
(2, 'validée');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`idImage`, `nomImage`, `urlImage`) VALUES
(1, 'Creamy Bisque', '../asset/imagesRecettes/Creamy Bisque_p.jpg'),
(13, 'Cannedwich', '../asset/imagesRecettes/Cannedwich_p.jpg'),
(15, 'Burly Bean Bowl', '../asset/imagesRecettes/Burly Bean Bowl_p.jpg'),
(16, 'Chilled Food Tin', '../asset/imagesRecettes/Chilled Food Tin_p.png');

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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

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
(68, 'Girolle de Malmalam', 'Magasin // Au sol', 'Bric à Brac de Prissock (Lestallum), Bazar JM Vieux Lestallum // Fourré de Malmalam'),
(69, 'Farine pour gyoza', 'Magasin', 'Grande Surface'),
(70, 'Pistaches décortiquées', 'Magasin', 'Grande Surface'),
(71, 'Fraises fraîches', 'Magasin', 'Grande Surface'),
(72, 'Confiture de fraises', 'Magasin', 'Grande Surface'),
(73, 'Oeufs', 'Magasin', 'Grande surface'),
(74, 'Sucre', 'Magasin', 'Grande surface'),
(75, 'Cannelle moulue', 'Magasin', 'Grande surface'),
(76, 'Miel liquide', 'Magasin', 'Grande surface'),
(77, 'Semoule de blé fine', 'Magasin', 'Grande surface'),
(81, 'gfe 2', 'mon cul', 'truc');

-- --------------------------------------------------------

--
-- Structure de la table `ingredientrecette`
--

DROP TABLE IF EXISTS `ingredientrecette`;
CREATE TABLE IF NOT EXISTS `ingredientrecette` (
  `idRecette` int(4) NOT NULL,
  `idIngredient` int(4) NOT NULL,
  PRIMARY KEY (`idRecette`,`idIngredient`),
  KEY `idIngredient` (`idIngredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ingredientrecette`
--

INSERT INTO `ingredientrecette` (`idRecette`, `idIngredient`) VALUES
(4, 1),
(6, 1),
(4, 2),
(4, 28),
(5, 28),
(5, 34),
(4, 60);

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `idMembre` int(4) NOT NULL AUTO_INCREMENT,
  `nomMembre` varchar(50) DEFAULT NULL,
  `mdpMembre` varchar(1000) DEFAULT NULL,
  `idPrivilege` int(4) DEFAULT NULL,
  PRIMARY KEY (`idMembre`),
  KEY `fkPrivilege` (`idPrivilege`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`idMembre`, `nomMembre`, `mdpMembre`, `idPrivilege`) VALUES
(1, 'admin', '$2y$10$dXgsiH1kajYLcmif0uaK..QRnY78qW9Xht4fi6iYg92ohADNF4f46', 1),
(2, 'auteur', '$2y$10$95n2Ath.wHQ9wxevLMmpn.AxlxOjZh4Eej5IgxrU/d5shMxJLYDPi', 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `origine`
--

INSERT INTO `origine` (`idOrigine`, `nomOrigine`, `descriptionOrigine`) VALUES
(1, 'final fantasy XV', 'Final Fantasy XV, annoncé originellement sous le titre Final Fantasy Versus XIII, est un jeu vidéo de la célèbre série Final Fantasy, développé et édité par Square Enix, sorti le 29 novembre 2016 sur les consoles PlayStation 4 et Xbox One. Une Windows Edition et une Royal Edition sont sorties le 6 mars 2018.'),
(2, 'firefly', 'Firefly est une série télévisée de space western américaine en 14 épisodes, créée par le scénariste et réalisateur Joss Whedon avec sa société de production Mutant Enemy.'),
(3, 'dune', 'Initié par les romans de Frank Herbert, l\'univers de Dune est à la base d\'une franchise ayant généré un grand nombre d’œuvres dans des domaines très variés.');

-- --------------------------------------------------------

--
-- Structure de la table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
CREATE TABLE IF NOT EXISTS `privilege` (
  `idPrivilege` int(4) NOT NULL AUTO_INCREMENT,
  `labelPrivilege` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPrivilege`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `privilege`
--

INSERT INTO `privilege` (`idPrivilege`, `labelPrivilege`) VALUES
(1, 'administrateur'),
(2, 'auteur');

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
  `dureeCuisson` varchar(100) DEFAULT NULL,
  `dureePreparation` varchar(100) DEFAULT NULL,
  `recetteRecette` varchar(5000) DEFAULT NULL,
  `effetsRecette` varchar(500) DEFAULT NULL,
  `idCategorie` int(4) NOT NULL,
  `idImage` int(4) DEFAULT NULL,
  `idEtat` int(4) DEFAULT NULL,
  PRIMARY KEY (`idRecette`),
  KEY `fkOrigine` (`idOrigine`),
  KEY `fkCategorie` (`idCategorie`),
  KEY `fkImage` (`idImage`),
  KEY `fkEtat` (`idEtat`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `recette`
--

INSERT INTO `recette` (`idRecette`, `idOrigine`, `nomRecette`, `descriptionRecette`, `dureeCuisson`, `dureePreparation`, `recetteRecette`, `effetsRecette`, `idCategorie`, `idImage`, `idEtat`) VALUES
(4, 1, '12 minutes', '12 minutes', '12 minutes', '12 minutes', '12 minutes', '12 minutes', 2, 1, 1),
(5, 2, 'test', 'test', 'test', 'test', 'test', 'test', 3, 15, 1),
(6, 1, 'Chilled Food Tin	', 'Un repas facile et rapide', '5 minutes', '6 minutes', 'Tu prends la boîte, tu l\'ouvre, tu l\'as mets sur le feu.\r\n\r\nTu attends 5 minutes et voilà c\'est prêt.', 'Nope', 1, 16, NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fkMembre` FOREIGN KEY (`idMembre`) REFERENCES `membre` (`idMembre`),
  ADD CONSTRAINT `fkRecetteArticle` FOREIGN KEY (`idRecette`) REFERENCES `recette` (`idRecette`);

--
-- Contraintes pour la table `ingredientrecette`
--
ALTER TABLE `ingredientrecette`
  ADD CONSTRAINT `fkRecette` FOREIGN KEY (`idRecette`) REFERENCES `recette` (`idRecette`),
  ADD CONSTRAINT `ingredientrecette_ibfk_1` FOREIGN KEY (`idIngredient`) REFERENCES `ingredient` (`idIngredient`);

--
-- Contraintes pour la table `membre`
--
ALTER TABLE `membre`
  ADD CONSTRAINT `fkPrivilege` FOREIGN KEY (`idPrivilege`) REFERENCES `privilege` (`idPrivilege`);

--
-- Contraintes pour la table `recette`
--
ALTER TABLE `recette`
  ADD CONSTRAINT `fkEtat` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`idEtat`),
  ADD CONSTRAINT `recette_ibfk_1` FOREIGN KEY (`idOrigine`) REFERENCES `origine` (`idOrigine`),
  ADD CONSTRAINT `recette_ibfk_2` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`),
  ADD CONSTRAINT `recette_ibfk_3` FOREIGN KEY (`idImage`) REFERENCES `image` (`idImage`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
