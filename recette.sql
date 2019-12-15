-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 15 déc. 2019 à 21:51
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

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
  `contenuArticle` varchar(5000) DEFAULT NULL,
  `dateArticle` date DEFAULT NULL,
  `idMembre` int(4) NOT NULL,
  `idRecette` int(4) NOT NULL,
  PRIMARY KEY (`idArticle`),
  KEY `fkMembre` (`idMembre`),
  KEY `fkRecetteArticle` (`idRecette`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`idArticle`, `titreArticle`, `contenuArticle`, `dateArticle`, `idMembre`, `idRecette`) VALUES
(7, 'Darkshells Marinières', ' J\'ai enfin essayé les légendaires \"Darkshells Marinières\" dont le monde entier parle... Bah c\'était juste des moules, mais plus chères. Snif.', '2019-12-10', 2, 17),
(8, 'Les Boites de Conserve, ce repas sous-estimé', 'Bonjour cher lecteur aujourd\'hui je vais vous parlez de notre sublime Chilled Food Tin, un repas mais bien plus encore.\r\nParce que ce repas en plus de pouvoir vous nourrir lors de vos voyages ou quand vous n\'avez pas envie de faire à manger a l\'avantage d\'être à bas prix. L\'avantage c\'est qu\'une fois cette boite lavée vous pouvez l\'utiliser pour faire de multiples choses. Comme d\'un récipient même de décoration de piège, et de plein d\'autres manières si vous laissez votre imagination vous guider.  ', '2019-12-01', 2, 32);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `idCategorie` int(4) NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `nomCategorie`) VALUES
(1, 'Viande'),
(2, 'Poisson'),
(3, 'Végétarien'),
(4, 'Végétalien');

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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`idImage`, `nomImage`, `urlImage`) VALUES
(1, 'Creamy Bisque', '../asset/imagesRecettes/Creamy Bisque_p.jpg'),
(13, 'Cannedwich', '../asset/imagesRecettes/Cannedwich_p.jpg'),
(15, 'Burly Bean Bowl', '../asset/imagesRecettes/Burly Bean Bowl_p.jpg'),
(16, 'Chilled Food Tin', '../asset/imagesRecettes/Chilled Food Tin_p.png'),
(17, 'Flame-Roasted Toast', '../asset/imagesRecettes/Flame-Roasted Toast_p.jpg'),
(18, 'Croque Madame', '../asset/imagesRecettes/Croque Madame_p.jpg'),
(19, 'Veggie Medley Stew', '../asset/imagesRecettes/Veggie Medley Stew_p.jpg'),
(20, 'Oil-Drizzled Steamed Fish', '../asset/imagesRecettes/Oil-Drizzled Steamed Fish_p.jpg'),
(21, 'Stacked Ham Sandwich', '../asset/imagesRecettes/Stacked Ham Sandwich_p.jpg'),
(22, 'Grilled Wild Barramundi', '../asset/imagesRecettes/Grilled Wild Barramundi_p.jpg'),
(23, 'Creamy Milk Risotto', '../asset/imagesRecettes/Creamy Milk Risotto_p.jpg'),
(24, 'Fried Rookie on Rice', '../asset/imagesRecettes/Fried Rookie on Rice_p.jpg'),
(25, 'Salmon-in-a-Suit', '../asset/imagesRecettes/Salmon-in-a-Suit_p.jpg'),
(26, 'Crispy Fish Fritterwich', '../asset/imagesRecettes/Crispy Fish Fritterwich_p.jpg'),
(30, 'Darkshells Marinières', '../asset/imagesRecettes/Darkshells Marinières_p.jpg'),
(31, 'Sweet & Spicy Cygillan Crab', '../asset/imagesRecettes/Sweet & Spicy Cygillan Crab_p.jpg'),
(32, 'Kenny\'s Secret Recipe', '../asset/imagesRecettes/Kenny\'s Secret Recipe_p.jpg'),
(33, 'Oak-Smoked Devil Gar', '../asset/imagesRecettes/Oak-Smoked Devil Gar_p.jpg'),
(34, 'Excellent Oven-Roasted Trout', '../asset/imagesRecettes/Excellent Oven-Roasted Trout_p.jpg'),
(35, 'Broiled King-on-a-Stick', '../asset/imagesRecettes/Broiled King-on-a-Stick_p.jpg'),
(36, 'Hearty Cutlet on Rice', '../asset/imagesRecettes/Hearty Cutlet on Rice_p.jpg'),
(37, 'Smoked Behemoth', '../asset/imagesRecettes/Smoked Behemoth_p.jpg'),
(38, 'Sea Bass Sauté', '../asset/imagesRecettes/Sea Bass Sauté_p.jpg'),
(39, 'Fire-Sauce Fillet', '../asset/imagesRecettes/Fire-Sauce Fillet_p.jpg'),
(40, 'Blazing Braised Gizzard', '../asset/imagesRecettes/Blazing Braised Gizzard_p.jpg'),
(41, 'Thick \'n\' Juicy Steak', '../asset/imagesRecettes/Thick \'n\' Juicy Steak_p.jpg'),
(42, 'Hunters\' Krazy Kebabs', '../asset/imagesRecettes/Hunters\' Krazy Kebabs_p.jpg'),
(43, 'Toadsteak Drumsticks', '../asset/imagesRecettes/Toadsteak Drumsticks_p.jpg'),
(44, 'Lestallum Stewed Tripe', '../asset/imagesRecettes/Lestallum Stewed Tripe_p.jpg'),
(45, 'Taelpar Harvest Galette', '../asset/imagesRecettes/Taelpar Harvest Galette_p.jpg'),
(49, 'Raviolis de la Sérénité', '../asset/imagesRecettes/Raviolis de la Sérénité_p.jpg'),
(50, 'Desert Cake', '../asset/imagesRecettes/Desert Cake_p.jpg'),
(51, 'SGC Blue Jello', '../asset/imagesRecettes/SGC Blue Jello_p.jpg'),
(52, 'Sneffels Crumble', '../asset/imagesRecettes/Sneffels Crumble_p.jpg'),
(53, 'Gâteau à la pistache et à la crème de Pera', '../asset/imagesRecettes/Gâteau à la pistache et à la crème de Pera_p.jpg'),
(54, 'Gâteau de la Causalité', '../asset/imagesRecettes/Gâteau de la Causalité_p.jpg'),
(55, 'Gâteau au miel des Béornides', '../asset/imagesRecettes/Gâteau au miel des Béornides_p.jpg'),
(56, 'Cake au citron des 7 Royaumes', '../asset/imagesRecettes/Cake au citron des 7 Royaumes_p.jpg'),
(57, 'Queen Loukoums', '../asset/imagesRecettes/Queen Loukoums_p.jpg'),
(58, 'Les Patacitrouilles du Poudlard Express', '../asset/imagesRecettes/Les Patacitrouilles du Poudlard Express_p.jpg'),
(59, 'Tarte à la mélasse', '../asset/imagesRecettes/Tarte à la mélasse_p.jpg'),
(60, 'Chaleureuse Tarte aux Myrtilles', '../asset/imagesRecettes/Chaleureuse Tarte aux Myrtilles_p.jpg'),
(63, 'Bretzel Sans Fin', '../asset/imagesRecettes/Bretzel Sans Fin_p.jpg'),
(64, 'Sen Bao', '../asset/imagesRecettes/Sen Bao_p.jpg'),
(65, 'Tuxedo Cake', '../asset/imagesRecettes/Tuxedo Cake_p.jpg'),
(66, 'Brioche de Versailles', '../asset/imagesRecettes/Brioche de Versailles_p.jpg'),
(67, 'Dorayaki de Nobu', '../asset/imagesRecettes/Dorayaki de Nobu_p.jpg'),
(68, 'Clafoutis de Barbe Noire', '../asset/imagesRecettes/Clafoutis de Barbe Noire_p.jpg'),
(69, 'Fire Ball', '../asset/imagesRecettes/Fire Ball_p.jpg'),
(70, 'Royal Tarte', '../asset/imagesRecettes/Royal Tarte_p.jpg'),
(71, 'Barres Effet Chocolat', '../asset/imagesRecettes/Barres Effet Chocolat_p.jpg'),
(72, 'Dharma Peanut Butter', '../asset/imagesRecettes/Dharma Peanut Butter_p.jpg'),
(73, 'P\'tits Biscuits', '../asset/imagesRecettes/P\'tits Biscuits_p.jpg'),
(74, 'Homer\'s Favorite Donut', '../asset/imagesRecettes/Homer\'s Favorite Donut_p.jpg'),
(75, 'Ha Ha Ha Puddin\'', '../asset/imagesRecettes/Ha Ha Ha Puddin\'_p.jpg'),
(76, 'Oeil d\'Agamotto', '../asset/imagesRecettes/Oeil d\'Agamotto_p.jpg'),
(77, 'Cowabunga Pizza', '../asset/imagesRecettes/Cowabunga Pizza_p.jpg'),
(78, 'Ivy Treat', '../asset/imagesRecettes/Ivy Treat_p.jpg'),
(79, 'Anti-Palladium Shake', '../asset/imagesRecettes/Anti-Palladium Shake_p.jpg'),
(80, 'Les Pancakes de la Victoire', '../asset/imagesRecettes/Les Pancakes de la Victoire_p.jpg'),
(84, 'Pumpkin Pie de Tiron', '../asset/imagesRecettes/Pumpkin Pie de Tiron_p.jpg'),
(85, 'Carrot Cake de la tante Tillie', '../asset/imagesRecettes/Carrot Cake de la tante Tillie_p.jpg'),
(86, 'The Cake', '../asset/imagesRecettes/The Cake_p.jpg'),
(87, 'Peach Cannoli', '../asset/imagesRecettes/Peach Cannoli_p.jpg'),
(88, 'Glace au sel de mer', '../asset/imagesRecettes/Glace au sel de mer_p.jpg'),
(89, 'Tartelettes de Dunwall', '../asset/imagesRecettes/Tartelettes de Dunwall_p.jpg');

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
  PRIMARY KEY (`idIngredient`),
  UNIQUE KEY `nomIngredient` (`nomIngredient`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8;

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
(81, 'gfe 2', 'mon cul', 'truc'),
(82, 'Pain', 'Magasin', 'Grande Surface'),
(83, 'Orange', 'A la main', 'Oranger'),
(84, 'Huile', 'Magasin', 'Grande Surface'),
(85, 'Lait', 'Magasin', 'Grande Surface'),
(86, 'Levure Chimique', 'Magasin', 'Grande Surface'),
(87, 'Menthe fraîche', 'Magasin', 'Grande Surface'),
(88, 'Colorant bleu', 'Magasin', 'Grande Surface'),
(89, 'Get 31', 'Magasin', 'Grande Surface'),
(90, 'Agar-agar', 'Magasin', 'Grande Surface'),
(91, 'Farine', 'Magasin', 'Grande Surface'),
(92, 'Poudre d\'amandes', 'Magasin', 'Grande Surface'),
(93, 'Beurre', 'Magasin', 'Grande Surface'),
(94, 'Mûres', 'Magasin', 'Grande Surface'),
(95, 'Framboises', 'Magasin', 'Grande Surface'),
(96, 'Gousse de vanille', 'Magasin', 'Grande Surface'),
(97, 'Sel', 'Magasin', 'Grande Surface'),
(98, 'Jus de Fraise', 'Magasin', 'Grande Surface'),
(99, 'Huile végétale', 'Magasin', 'Grande Surface'),
(100, 'Pâte de pistaches', 'Magasin', 'Grande Surface'),
(101, 'Pistaches entières nature', 'Magasin', 'Grande Surface'),
(102, 'Mascarpone', 'Magasin', 'Grande Surface'),
(103, 'Sucre glace', 'Magasin', 'Grande Surface'),
(104, 'Bâtonnets d\'orange confite au chocolat', 'Magasin', 'Grande Surface'),
(105, 'Coulis de fraises', 'Magasin', 'Grande Surface'),
(106, 'Beurre doux', 'Magasin', 'Grande Surface'),
(107, 'Biscuits speculoos', 'Magasin', 'Grande Surface'),
(108, 'Chocolat noir', 'Magasin', 'Grande Surface'),
(109, 'Crème liquide entière', 'Magasin', 'Grande Surface'),
(110, 'Cream cheese', 'Magasin', 'Grande Surface'),
(111, 'Sucre en poudre', 'Magasin', 'Grande Surface'),
(112, 'Jus d\'orange', 'Magasin', 'Grande Surface'),
(113, 'Levure Patissière', 'Magasin', 'Grande Surface'),
(114, 'Miel d\'acacia', 'Magasin', 'Grande Surface'),
(115, 'Crème fleurette entière', 'Magasin', 'Grande Surface'),
(116, 'Citron vert', 'Magasin', 'Grande Surface'),
(117, 'Caramel concassé', 'Magasin', 'Grande Surface'),
(118, 'Citron jaune', 'Magasin', 'Grande Surface'),
(119, 'Lemon curd', 'Magasin', 'Grande Surface'),
(120, 'Huile de pépins de raisin', 'Magasin', 'Grande Surface'),
(121, 'Eau de rose', 'Magasin', 'Grande Surface'),
(122, 'Jus de citron', 'Magasin', 'Grande Surface'),
(123, 'Colorant rose', 'Magasin', 'Grande Surface'),
(124, 'Pâte brisée', 'Magasin', 'Grande Surface'),
(125, 'Potiron', 'Magasin', 'Grande Surface'),
(126, 'Pomme', 'Magasin', 'Grande Surface'),
(127, 'Noisettes', 'Magasin', 'Grande Surface'),
(128, 'Jaune d\'oeuf', 'Magasin', 'Grande Surface'),
(129, 'Pâte sablée', 'Magasin', 'Grande Surface'),
(130, 'Golden Syrup', 'Magasin', 'Grande Surface'),
(131, 'Mélasse', 'Magasin', 'Grande Surface'),
(132, 'Chapelure fine', 'Magasin', 'Grande Surface'),
(133, 'Noix de coco râpée', 'Magasin', 'Grande Surface'),
(134, 'Pâte feuilletée', 'Magasin', 'Grande Surface'),
(135, 'Sirop d\'érable', 'Magasin', 'Grande Surface'),
(136, 'Sucre vanillé', 'Magasin', 'Grande Surface'),
(137, 'Amandes effilées grillées', 'Magasin', 'Grande Surface'),
(138, 'Compote de pomme', 'Magasin', 'Grande Surface'),
(139, 'Sucre semoule', 'Magasin', 'Grande Surface'),
(141, 'Confiture de myrtille', 'Magasin', 'Grande Surface'),
(142, 'Myrtilles fraîches', 'Magasin', 'Grande Surface'),
(143, 'Crème fraîche', 'Magasin', 'Grande Surface'),
(144, 'Lavande', 'Magasin', 'Grande Surface'),
(145, 'Poudre de noisettes', 'Magasin', 'Grande Surface'),
(146, 'Sel fin', 'Magasin', 'Grande Surface'),
(147, 'Levure déshydratée', 'Magasin', 'Grande Surface'),
(148, 'Sucre fin', 'Magasin', 'Grande Surface'),
(149, 'Bicarbonate alimentaire', 'Magasin', 'Grande Surface'),
(150, 'Levure boulangère sèche', 'Magasin', 'Grande Surface'),
(151, 'Farine type 45', 'Magasin', 'Grande Surface'),
(152, 'Haricots azukis', 'Magasin', 'Grande Surface'),
(153, 'Beurre pommade', 'Magasin', 'Grande Surface'),
(154, 'Colorant rouge', 'Magasin', 'Grande Surface'),
(155, 'Beurre mou', 'Magasin', 'Grande Surface'),
(156, 'Cristaux de sucre', 'Magasin', 'Grande Surface'),
(157, 'Anko', 'Magasin', 'Grande Surface'),
(158, 'Pâte à tartiner', 'Magasin', 'Grande Surface'),
(159, 'Confiture', 'Magasin', 'Grande Surface'),
(160, 'Cerises dénoyautées', 'Magasin', 'Grande Surface'),
(161, 'Sucre roux', 'Magasin', 'Grande Surface'),
(162, 'Rhum pâtissier', 'Magasin', 'Grande Surface'),
(163, 'Poire', 'Magasin', 'Grande Surface'),
(164, 'Eau', 'Magasin', 'Grande Surface'),
(165, 'Kirsch', 'Magasin', 'Grande Surface'),
(166, 'Chocolat au lait', 'Magasin', 'Grande Surface'),
(167, 'Lait concentré sucré', 'Magasin', 'Grande Surface'),
(168, 'Riz soufflé au chocolat', 'Magasin', 'Grande Surface'),
(169, 'Cacahuètes nature', 'Magasin', 'Grande Surface'),
(170, 'Huile d\'arachide', 'Magasin', 'Grande Surface'),
(171, 'Cassonade', 'Magasin', 'Grande Surface'),
(172, 'Farine de blé', 'Magasin', 'Grande Surface'),
(173, 'Gingembre moulu', 'Magasin', 'Grande Surface'),
(174, 'Quatre-épices', 'Magasin', 'Grande Surface'),
(175, 'Blanc d\'oeuf', 'Magasin', 'Grande Surface'),
(176, 'Sucre glace tamisé', 'Magasin', 'Grande Surface'),
(177, 'Colorant violet', 'Magasin', 'Grande Surface'),
(178, 'Noix de pécan', 'Magasin', 'Grande Surface'),
(179, 'Sucre brun', 'Magasin', 'Grande Surface'),
(180, 'Huile de friture', 'Magasin', 'Grande Surface'),
(181, 'Essence de rose', 'Magasin', 'Grande Surface'),
(182, 'Topping paillettes', 'Magasin', 'Grande Surface'),
(183, 'Pain sec concassé', 'Magasin', 'Grande Surface'),
(184, 'Coulis de myrtilles', 'Magasin', 'Grande Surface'),
(185, 'Colorant vert', 'Magasin', 'Grande Surface'),
(186, 'Huile de colza', 'Magasin', 'Grande Surface'),
(187, 'Glace royale', 'Magasin', 'Grande Surface'),
(188, 'Piment d\'Espelette', 'Magasin', 'Grande Surface'),
(189, 'Mangues mûres', 'Magasin', 'Grande Surface'),
(190, 'Chocolat blanc', 'Magasin', 'Grande Surface'),
(191, 'Banane', 'Magasin', 'Grande Surface'),
(192, 'Marshmallow', 'Magasin', 'Grande Surface'),
(193, 'Thé matcha', 'Magasin', 'Grande Surface'),
(194, 'Crème glacée à la vanille', 'Magasin', 'Grande Surface'),
(195, 'Lait entier', 'Magasin', 'Grande Surface'),
(196, 'Raisins', 'Magasin', 'Grande Surface'),
(197, 'Poudre de cacao amer', 'Magasin', 'Grande Surface'),
(198, 'Pâte sablée abaissée', 'Magasin', 'Grande Surface'),
(199, 'Chair de Potiron', 'Magasin', 'Grande Surface'),
(200, 'Eau gazeuse', 'Magasin', 'Grande Surface'),
(201, 'Farine fluide', 'Magasin', 'Grande Surface'),
(202, 'Rhum brun', 'Magasin', 'Grande Surface'),
(204, 'Carottes finement râpées', 'Magasin', 'Grande Surface'),
(205, 'Cointreau', 'Magasin', 'Grande Surface'),
(206, 'Pâte d\'amande rouge', 'Magasin', 'Grande Surface'),
(207, 'Pêche mûre et saine', 'Magasin', 'Grande Surface'),
(208, 'Extrait de vanille', 'Magasin', 'Grande Surface'),
(209, 'Fleur de sel', 'Magasin', 'Grande Surface'),
(210, 'Abricot mûr', 'Magasin', 'Grande Surface'),
(211, 'Branche de romarin', 'Magasin', 'Grande Surface'),
(212, 'Fécule de maïs', 'Magasin', 'Grande Surface'),
(213, 'Fonds de tartelette en pâte sucrée', 'Magasin', 'Grande Surface');

-- --------------------------------------------------------

--
-- Structure de la table `ingredientrecette`
--

DROP TABLE IF EXISTS `ingredientrecette`;
CREATE TABLE IF NOT EXISTS `ingredientrecette` (
  `idRecette` int(4) NOT NULL,
  `idIngredient` int(4) NOT NULL,
  PRIMARY KEY (`idRecette`,`idIngredient`),
  UNIQUE KEY `idRecette` (`idRecette`,`idIngredient`),
  KEY `idIngredient` (`idIngredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ingredientrecette`
--

INSERT INTO `ingredientrecette` (`idRecette`, `idIngredient`) VALUES
(6, 82),
(7, 32),
(7, 73),
(7, 82),
(8, 51),
(8, 54),
(8, 66),
(10, 24),
(10, 62),
(11, 6),
(11, 33),
(11, 59),
(12, 26),
(12, 52),
(13, 31),
(13, 51),
(13, 68),
(14, 21),
(14, 31),
(14, 50),
(15, 22),
(16, 13),
(16, 29),
(17, 10),
(17, 47),
(18, 8),
(18, 50),
(19, 10),
(19, 17),
(20, 37),
(20, 56),
(21, 25),
(21, 58),
(22, 25),
(22, 50),
(23, 30),
(23, 31),
(23, 42),
(24, 37),
(24, 53),
(24, 55),
(25, 15),
(25, 50),
(25, 57),
(26, 18),
(26, 50),
(26, 57),
(27, 39),
(27, 57),
(28, 39),
(28, 62),
(29, 5),
(29, 50),
(30, 18),
(30, 53),
(30, 63),
(31, 30),
(31, 51),
(31, 83),
(32, 46),
(33, 69),
(33, 70),
(33, 71),
(33, 72),
(34, 73),
(34, 74),
(34, 75),
(34, 76),
(34, 77),
(34, 84),
(34, 85),
(34, 86),
(35, 74),
(35, 87),
(35, 88),
(35, 89),
(35, 90),
(36, 74),
(36, 91),
(36, 92),
(36, 93),
(36, 94),
(36, 95),
(36, 96),
(37, 73),
(37, 74),
(37, 86),
(37, 91),
(37, 93),
(37, 97),
(37, 98),
(37, 99),
(37, 100),
(37, 101),
(37, 102),
(37, 103),
(37, 104),
(37, 105),
(38, 73),
(38, 97),
(38, 102),
(38, 106),
(38, 107),
(38, 108),
(38, 109),
(38, 110),
(38, 111),
(38, 112),
(47, 73),
(47, 74),
(47, 76),
(47, 91),
(47, 97),
(47, 106),
(47, 113),
(47, 114),
(47, 115),
(47, 116),
(47, 117),
(48, 73),
(48, 74),
(48, 86),
(48, 91),
(48, 93),
(48, 102),
(48, 103),
(48, 118),
(48, 119),
(49, 74),
(49, 90),
(49, 103),
(49, 120),
(49, 121),
(49, 122),
(49, 123),
(50, 74),
(50, 75),
(50, 76),
(50, 93),
(50, 124),
(50, 125),
(50, 126),
(50, 127),
(50, 128),
(51, 73),
(51, 102),
(51, 106),
(51, 110),
(51, 129),
(51, 130),
(51, 132),
(51, 133),
(52, 73),
(52, 74),
(52, 92),
(52, 93),
(52, 129),
(52, 141),
(52, 142),
(52, 143),
(52, 144),
(53, 73),
(53, 75),
(53, 85),
(53, 91),
(53, 93),
(53, 103),
(53, 146),
(53, 147),
(53, 148),
(53, 149),
(54, 74),
(54, 97),
(54, 150),
(54, 151),
(54, 152),
(55, 73),
(55, 74),
(55, 91),
(55, 97),
(55, 102),
(55, 103),
(55, 106),
(55, 108),
(55, 113),
(55, 123),
(55, 153),
(55, 154),
(56, 73),
(56, 85),
(56, 97),
(56, 108),
(56, 109),
(56, 111),
(56, 128),
(56, 136),
(56, 150),
(56, 151),
(56, 155),
(56, 156),
(57, 73),
(57, 74),
(57, 76),
(57, 84),
(57, 86),
(57, 91),
(57, 149),
(57, 157),
(57, 158),
(57, 159);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`idMembre`, `nomMembre`, `mdpMembre`, `idPrivilege`) VALUES
(1, 'admin', '$2y$10$dXgsiH1kajYLcmif0uaK..QRnY78qW9Xht4fi6iYg92ohADNF4f46', 1),
(2, 'auteur', '$2y$10$95n2Ath.wHQ9wxevLMmpn.AxlxOjZh4Eej5IgxrU/d5shMxJLYDPi', 2),
(3, 'Kevin', '$2y$10$YSUb8UR9oVslHIB2OBJSxOkHWsurHEGtsromr3S34DSsb7OkLe.iO', 2),
(4, 'Damien', '$2y$10$EY4QGdA8jjBatM2RBb.v0.SOLlWle2B2wRZnZokXBrGheWglVGHjW', 2),
(5, 'Mickael', '$2y$10$vgOHMrOkILr0Trcgh5UAtejcURj/jFD7FaFq2ZVOFzNhHZBlSRnZq', 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `origine`
--

INSERT INTO `origine` (`idOrigine`, `nomOrigine`, `descriptionOrigine`) VALUES
(1, 'Final Fantasy XV', 'Final Fantasy XV, annoncé originellement sous le titre Final Fantasy Versus XIII, est un jeu vidéo de la célèbre série Final Fantasy, développé et édité par Square Enix, sorti le 29 novembre 2016 sur les consoles PlayStation 4 et Xbox One. Une Windows Edition et une Royal Edition sont sorties le 6 mars 2018. '),
(2, 'Firefly', 'Firefly est une série télévisée de space western américaine en 14 épisodes, créée par le scénariste et réalisateur Joss Whedon avec sa société de production Mutant Enemy. '),
(3, 'Dune', 'Initié par les romans de Frank Herbert, l\'univers de Dune est à la base d\'une franchise ayant généré un grand nombre d’œuvres dans des domaines très variés. '),
(4, 'Stargate', 'Stargate est un univers de science-fiction fondé sur des voyages entre des planètes situées dans différentes galaxies et reliées entre elles par un réseau de Portes des étoiles.'),
(5, 'Voyage au Centre de la Terre', 'Voyage au centre de la Terre est un roman d\'aventures, écrit en 1864 par Jules Verne. Le roman traite de la découverte d\'un manuscrit runique ancien par un savant allemand qui, avec son neveu et leur guide, entreprennent un voyage vers le centre de la Terre en y entrant par un volcan islandais éteint, le Sneffels.'),
(6, 'Star Trek', 'Dans l\'univers Star Trek, l\'humanité développe le voyage spatial à vitesse supraluminique. Plus tard, l\'homme s\'unit à d\'autres espèces intelligentes de la galaxie pour former la Fédération des planètes unies. À la suite d\'une intervention extraterrestre, et grâce à la science, l\'humanité surmonte largement ses nombreux vices et faiblesses terrestres, au XXIIIe siècle.'),
(7, 'Matrix', 'Matrix est un film de science-fiction réalisé en 1999 par les soeurs Wachowski. Il dépeint un futur dystopique dans lequel la réalité perçue par les humains est en fait une simulation virtuelle appelée la Matrice, créée par des machines douées d\'intelligence afin de soumettre la population humaine et de se servir de la chaleur et de l\'activité électrique de leur corps comme source d\'énergie. Le programmeur informatique Neo l\'apprend et est entraîné dans la rébellion contre les machines.'),
(8, 'Le Hobbit', 'Le Hobbit est un roman de fantasy de l’écrivain britannique J. R. R. Tolkien. Il narre les aventures du hobbit Bilbo, entraîné malgré lui par le magicien Gandalf et une compagnie de treize nains dans leur voyage vers la Montagne Solitaire, à la recherche du trésor gardé par le dragon Smaug.'),
(9, 'Game of Thrones', 'Le Trône de fer (A Song of Ice and Fire) est une série de romans de fantasy de George R. R. Martin. Trois intrigues principales s\'y entremêlent : plusieurs maisons nobles rivalisent pour l\'obtention du trône du royaume ; dans les contrées glacées, une race de créatures légendaires se réveille ; et la dernière héritière des Targaryen cherche à reconquérir le trône. '),
(10, 'Narnia', 'Narnia est un monde imaginaire créé par l\'auteur irlandais Clive Staples Lewis dans lequel se déroule une série de sept romans de fantasy : Le Monde de Narnia.\r\nDans l\'univers de Narnia, les animaux parlent, les bêtes mythiques abondent et la magie est courante. La série suit l\'histoire de Narnia, depuis sa création jusqu\'à sa fin, et plus particulièrement les visites de groupes d\'enfants de notre monde.'),
(11, 'Harry Potter', 'Harry Potter est une série littéraire de fantasy écrite par l\'autrice britannique J. K. Rowling. Les romans racontent les aventures d\'un jeune sorcier nommé Harry Potter et de ses amis Ron Weasley et Hermione Granger à l\'école de sorcellerie Poudlard, dirigée par Albus Dumbledore.'),
(12, 'Kaamelott', 'Kaamelott est une série télévisée française humoristique et dramatique de fantasy historique créée par Alexandre Astier, Alain Kappauf et Jean-Yves Robin et diffusée entre le 3 janvier 2005 et le 31 octobre 2009 sur M6.'),
(13, 'Le Seigneur des Anneaux', 'Le Seigneur des anneaux est un roman de J. R. R. Tolkien paru en 1955.\r\nPrenant place dans le monde de la Terre du Milieu, il suit la quête du hobbit Frodo Bessac, qui doit détruire l\'Anneau unique afin que celui-ci ne tombe pas entre les mains de Sauron, le Seigneur des ténèbres. Plusieurs personnages lui viennent en aide, parmi lesquels son serviteur Sam, le mage Gandalf ou encore l\'humain Aragorn, héritier d\'une longue lignée de rois.'),
(14, 'L\'Histoire Sans Fin', 'L\'Histoire sans fin est un roman allemand de fantasy de Michael Ende publié en 1979. Le roman raconte l\'histoire d\'un jeune garçon qui vole un livre intitulé L\'Histoire Sans Fin, dans une librairie. Au fur et à mesure qu\'il avance dans la lecture du livre, il se retrouve lui-même faisant partie de la quête dont le but est de sauver le monde et les habitants du Pays Fantastique.'),
(15, 'Dishonored', 'Dishonored est un jeu vidéo qui propose d\'adapter son gameplay en fonction de la philosophie du joueur, soit brutale, soit discrète, soit entre les deux. Le jeu a été développé par le studio lyonnais Arkane Studios puis édité par Bethesda Softworks en 2012.'),
(16, 'Le voyage de Chihiro', 'Le Voyage de Chihiro est un film d\'animation japonais réalisé par Hayao Miyazaki et produit par le studio Ghibli en 2001.\r\nChihiro est une fillette de dix ans qui, alors qu\'elle se rend en famille vers sa nouvelle maison, entre dans le monde des esprits. Après la transformation de ses parents en porcs par la sorcière Yubaba, Chihiro prend un emploi dans l\'établissement de bains de Yubaba pour retrouver ses parents et le monde humain. '),
(17, 'Sailor Moon', 'Sailor Moon est une franchise japonaise créée par Naoko Takeuchi en 1992.\r\nLa franchise reprend les aventures d’Usagi Tsukino, une adolescente banale et maladroite, qui est en réalité Sailor Moon, une héroïne aux pouvoirs magiques. Combattant le mal au nom de l’amour et la justice, elle est rejointe par de nombreuses alliées, toutes placées sous la protection d’une planète du Système solaire.'),
(18, 'La Rose de Versailles', 'L\'histoire de Versailles no Bara (Lady Oscar) se passe à la fin du XVIIIe siècle en France. Oscar est une jeune femme élevée en garçon par un père excédé de n\'avoir que des filles. L\'éducation militaire d\'Oscar lui permet de devenir le capitaine de la garde royale, chargée de la protection de la jeune dauphine Marie-Antoinette. Aux côtés d\'Oscar, il y a André, son ami d\'enfance, secrètement amoureux d\'elle. Ensemble, ils devront affronter les premiers troubles annonçant la Révolution française.'),
(19, 'Doraemon', 'Doraemon est une franchise médiatique japonaise, créée par Fujiko Fujio. La série se centre sur un chat-robot nommé Doraemon, ayant voyagé à travers le temps depuis le futur, afin d\'aider un jeune garçon nommé Nobita Nobi.');

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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `recette`
--

INSERT INTO `recette` (`idRecette`, `idOrigine`, `nomRecette`, `descriptionRecette`, `dureeCuisson`, `dureePreparation`, `recetteRecette`, `effetsRecette`, `idCategorie`, `idImage`, `idEtat`) VALUES
(6, 1, 'Flame-Roasted Toast', 'Quand on a rien d\'autre sous la main...', 'à volonté', 'vraiment pas longtemps', 'Pain -> Feu -> mangez', 'Vous fait littéralement vivre l\'expérience de la pauvreté', 4, 17, NULL),
(7, 1, 'Croque Madame', 'Le classique, mais avec un oeuf.', 'rapide', 'pas longtemps', 'Après avoir déposé le jambon sur la tartine, avec quelques suppléments si vous le désirez, ajoutez l\'oeuf et c\'est prêt', 'Vous contentera malgré son apparente simplicité', 1, 18, NULL),
(8, 1, 'Veggie Medley Stew', 'Un bouillon au lait de brebis, avec plein de bonnes choses dedans.', '30 minutes', '10 minutes', 'Mettez le lait à chauffer. Découpez soigneusement les ingrédients. Plongez les ingrédients dans la soupe et régalez vous !', '+20 en attaque et +150 points de vie', 3, 19, NULL),
(10, 1, 'Oil-Drizzled Steamed Fish', 'Il y a du poisson, ça fume, c\'est bon', '30 minutes', '30 minutes', 'Faites fumer le poisson avec des oignons.', '+60 en attaque, 50 en magie, 200 HP', 2, 20, NULL),
(11, 1, 'Stacked Ham Sandwich', 'Celle-là, elle est pour les acharnés.', '30 minutes', '1h', 'Vous voyez tous les ingrédients de la recette ? Vous empilez ça sans tout faire tomber, vous ouvrez la bouche le plus grand possible, et vous croquez.', 'Une satisfaction gustative comme vous n\'en n\'avez jamais connue... suivie d\'une indigestion hors-norme.', 1, 21, NULL),
(12, 1, 'Grilled Wild Barramundi', 'De quoi remplir l\'estomac des amateurs de poisson', '30 minutes', '20 minutes', 'Découpez, grillez, appréciez !', '+80 Attaque, +80 Magie, +500 Santé', 2, 22, NULL),
(13, 1, 'Creamy Milk Risotto', 'Un risotto qui emplira de bonheur les estomacs les plus accueillants.', '30min', '25min', 'Mettez tout sur le feu. Brassez les champignons et le riz dans le lait jusqu\'à atteindre une texture onctueuse, et servez.', '+600PV, Régénération de santé de +75%, immunise au sort de Métamorphose en Crapaud', 3, 23, NULL),
(14, 1, 'Fried Rookie on Rice', 'Ce plat vous veut du bien', '30min', '30min', 'Le poivre doit être doux, mais prenez tout de même garde à ne pas trop en verser sur le riz. Une fois l\'oeuf déposé, vous pouvez en verser une pincée de nouveau, si vous le désirez.', '+100 en force, +400PV, immunise au poison', 3, 24, NULL),
(15, 1, 'Salmon-in-a-Suit', 'Il est mignon ce petit saumon', 'Cru', '30min', 'Vous prenez le saumon, et vous en faite un petit truc mignon.', 'L\'élégance de ce plat se reflétera sur vous.', 2, 25, NULL),
(16, 1, 'Crispy Fish Fritterwich', 'Ca croque, c\'est doré comme tout... avouez que vous en voulez.', '30min', '30min', 'Malaxez le poisson dans son blé, dorez le tout, assaisonnez, dégustez.', '+160 force, +800HP', 2, 26, NULL),
(17, 1, 'Darkshells Marinières', 'Bah... c\'est des moules.', '30min', '30min', 'Fumez ces bivalves au saké pour une saveur optimales.', 'Vous permet d\'effectuer des versions de vos techniques d\'une puissance largement supérieures, avec un haut taux de critique.', 2, 30, NULL),
(18, 1, 'Sweet & Spicy Cygillan Crab', 'Un crabe fort, accompagné de douceur.', '30 minutes', '30 minutes', 'Découpez le crabe, faites le cuire, saupoudrez le de poivre doux, et servez.', 'Résistance au feu +70%', 2, 31, NULL),
(19, 1, 'Kenny\'s Secret Recipe', 'La recette secrète de l\'ami Kenny... Qui n\'est plus si secrète que ça visiblement.', '30 minutes', '30 minutes', 'Utilisez simplement le saumon, l\'ail, et un peu de magie.', 'Vitalité et Magie +300, Force +400', 2, 32, NULL),
(20, 1, 'Oak-Smoked Devil Gar', 'Le plus redoutable des poissons, le Devil Gar, vous fera hériter de sa puissance légendaire si vous parvenez à le manger... Mais il faut le pêcher d\'abord.', '30 minutes', '30 minutes', 'D\'abord il faut l\'attraper, c\'est le plus difficile. Mais si vous réalisez cet exploit hors du commun, alors vous pourrez le cuisiner. Nous vous conseillons de le fumer au Chêne de Tenebrae pour l\'allier aux différentes subtilités de saveurs que sa chair peut révéler.', '+2000PV Max, Immunité à la glace, au feu, à l\'électricité', 2, 33, NULL),
(21, 1, 'Excellent Oven-Roasted Trout', 'C\'est cuit au four. C\'est excellent.', '30 minutes', '30 minutes', 'Une truite platine merlot, c\'est superbe. Mais cuite au bon petit four traditionnel comme ça, ça n\'a pas de prix. L\'échalote est votre amie.', 'Résistance au feu +50%, +2000 PV Max, +350 Force', 2, 34, NULL),
(22, 1, 'Broiled King-on-a-Stick', 'Une truite royale déchue, votre empire culinaire l\'ayant faite tomber de son trône.', '30min', '30min', 'Une truite royale savamment épicée et cuite avec soin, c\'est tout ce dont vous avez besoin.', 'Vous immunise à tout, sauf à une mort spontanée et imprévisible, évidemment.', 2, 35, NULL),
(23, 1, 'Hearty Cutlet on Rice', 'Tout est bon dans le griffon.', '30 minutes', '30 minutes', 'Découpez soigneusement la poitrine de griffon en fines tranches (avec le coeur en option). Déposez le sur le riz soigneusement cuit, pourquoi pas accompagné de blé. Assaisonnez à loisir et profitez.', '+250 Force, +1500 Max HP', 1, 36, NULL),
(24, 1, 'Smoked Behemoth', 'Depuis le temps qu\'il vous embête, vengez vous du béhémoth en le mangeant.', '30 minutes', '30 minutes', 'Fumez la viande de Béhémoth au feu de bois, accompagné de noix.', 'Sprint infini, +400 Force, +1000 PV Max', 1, 37, NULL),
(25, 1, 'Fire-Sauce Fillet', 'C\'est un filet, mais il est particulièrement caliente.', '30 minutes', '30 minutes', 'Vous cuisinez votre filet de Barramundi comme à votre habitude, puis vous le noyez sous les épices. Ca a pas l\'air comme ça, mais c\'est juste ça. Et le résultat en vaut carrément la chandelle.', 'Force et Magie +200, HP Max +600', 1, 39, NULL),
(26, 1, 'Blazing Braised Gizzard', 'Qu\'est-ce que ça pique. Mais qu\'est-ce que c\'est bon !', '30 minutes', '30 minutes', 'Une fois le foie bien cuit, versez une bonne dose de poivre et de gingembre. Effet garanti !', 'Magie +300, Récupération de santé +50%', 1, 40, NULL),
(27, 1, 'Thick \'n\' Juicy Steak', 'Il court, il court, le catobéplas... Il court moins bien désormais.', '30 minutes', '30 minutes', 'Une fois la poitrine de catobéplas soigneusement cuite, parfumez la de gingembre et savourez le mélange des saveurs proprement unique de ce plat.', 'HP Max +1000, sprint infini', 1, 41, NULL),
(28, 1, 'Hunters\' Krazy Kebabs', 'Etre chasseur est trop difficile pour vous ? Ayez l\'impression de quand même vivre cette vie d\'aventure grâce à ce plat.', '30 minutes', '30 minutes', 'Embrochez les différents aliments les uns après les autres une fois qu\'ils sont tous cuits. Savourez en particulier comme la viande se marie bien aux oignons.', 'Attaque +200, PV +800', 1, 42, NULL),
(29, 3, 'Toadsteak Drumsticks', 'Ce crapaud géant a de belles cuisses, c\'est pourquoi il vous les faut dans votre assiette.', '30 minutes', '30 minutes', 'Utilisez l\'os de la cuisse pour la cuire avec soin, en la tenant délicatement au dessus du feu. Une fois bien cuit, poivrez le avec soin et dégustez.', '+120 Force, +100 Magie, +500 PV', 1, 43, NULL),
(30, 1, 'Lestallum Stewed Tripe', 'Mmmh... La bonne tripaille.', '30 minutes', '30 minutes', 'Après avoir extrait les tripes, mélangez les aux tomates et aux noix pour réveiller un goût enfoui profondément en vous.', '+200 Magie, Récupération de santé +75%', 1, 44, NULL),
(31, 1, 'Taelpar Harvest Galette', 'La récolte a été bonne... C\'est l\'heure de la galette !', '30 minutes', '30 minutes', 'Une orange trempée dans le lait pour accompagner le blé de qualité de cette galette, c\'est tout ce dont vous aviez rêvé sans le savoir.', 'Magie +120, Esprit +400, Santé +1000', 3, 45, NULL),
(32, 1, 'Chilled Food Tin', 'Au moins c\'est pas cher...', '10min', '10min', 'Utilisez un ouvre-boite et faites chauffer.', 'Une indigestion, à la limite...', 1, 16, NULL),
(33, 2, 'Raviolis de la Sérénité', 'Il vous reste encore de ces fraises de l\'abbaye ramenées par Book, l\'occasion pour vous de préparer une fournée de raviolis sucrés pour l\'équipage.', '10 à 12 minutes', '10 minutes', 'Commencez par préparer la pâte à raviolis. Dans un cul-de-poule, mélangez 50cl d\'eau à température ambiante avec les 250g de la farine pour gyoza, et pétrissez la pâte jusqu\'à obtenir une boule homogène. Réservez-la pendant 20 min.\r\n<br><br>\r\nPendant ce temps, réalisez la farce de vos 100g de fraises fraîches qui viendra garnir les raviolis. Commencez par concasser grossièrement les 50g de pistaches. Réservez. Versez ensuite les fraises dans un égouttoir et passez-les délicatement sous un mince filet d\'eau. Une fois rincées, équeutez les fraises et taillez-les en cubes réguliers.\r\n<br><br>\r\nDans un saladier, versez les 100g de confiture de fraise, les cubes de fraise et les pistaches concassées. A l\'aide d\'une cuillère à soupe, mélangez pour obtenir un appareil homogène. Réservez.\r\n<br><br>\r\nReprenez la boule de pâte à raviolis. Fleurez (farinez) le plan de travail et déposez-y la boule. Façonnez-la en un boudin épais que vous couperez en dix morceaux réguliers. Abaissez chaque morceau en un disque d\'une dizaine de centimètres de diamètre.\r\n<br><br>\r\nPrenez un disque dans le creux de votre main et déposez au centre une cuillerée à café de l\'appareil à la fraise. Refermez le disque sur lui-même en le pliant en corolle. Reproduisez l\'opération pour chaque disque. Vos raviolis sont presque prêts.\r\n<br><br>\r\nDéposez-les dans un panier vapeur sur une feuille de papier sulfurisé. Sous le panier vapeur, portez l\'eau à ébullition. Comptez alors 10 min de cuisson. Maintenez l\'ébullition à feu moyen, il ne faut pas que la vapeur soit trop forte. Au terme de la cuisson, retirez du panier vapeur et servez immédiatement !', 'Fera de vous un digne membre de l\'équipage du Serenity', 4, 49, NULL),
(34, 3, 'Desert Cake', 'Face aux rigueurs du climat d\'Arrakis, il est parfois bon de se sustenter avec un biscuit apportant force et réconfort. Cette recette rend hommage à cette planète de sable et à sa richesse la plus célèbre, l\'Epice.', '30 min', '10 min', 'Préchauffez votre four à 180°C.\r\n<br><br>\r\nVersez les 4 oeufs dans un saladier avec les 150g de sucre. Fouettez le tout et incorporez progressivement 15cl d\'huile, 15cl de lait et 15g de levure chimique. Mélangez bien jusqu\'à l\'obtention d\'un appareil homogène. Incorporez les 320g de semoule de blé et la demi-cuillère à café de cannelle moulue. Réservez quelques instants.\r\n<br><br>\r\nBeurrez un moule à gâteau et versez-y la préparation. Enfournez pour 30 min.\r\n<br><br>\r\nPendant ce temps, réalisez le sirop qui viendra imbiber le gâteau. Dans une casserole, versez 40cl d\'eau, 200g de sucre et une cuillère à soupe de miel liquide. Portez à ébullition, puis laissez réduire à feu moyen pendant 5 min. Réservez le sirop hors du feu.\r\n<br><br>\r\nUne fois le gâteau sorti du four, démoulez-le. Nappez-le de sirop au miel. Le gâteau est prêt à être dégusté, n\'hésitez pas à le servir avec un café bien fort, comme on le fait sur Arrakis !', 'Vous rendra aussi sec que les politiciens d\'Arrakis.', 3, 50, NULL),
(35, 4, 'SGC Blue Jello', 'Voici comment préparer le type de dessert que le colonel O\'Neill, le major Carter ou encore le docteur McKay adorent consommer au mess des officiers du SGC...', '40min puis 1h de repos', '5 min', 'Commencez par bien rincer la demi-botte de menthe fraîche. Dans une casserole, portez 60cl d\'eau à ébullition et plongez-y la menthe. Maintenez à petite ébullition pendant 20 min, le temps que la menthe infuse bien le liquide.\r\n<br><br>\r\nEnsuite, filtrez l\'eau de cuisson et ôtez la menthe. Remettez l\'eau filtrée dans la casserole et ajoutez 2 gouttes de colorant bleu, 2cl de Get 31, 400g de sucre et 2g d\'agar-agar. Portez à ébullition et comptez 10min de cuisson, tout en mélangeant à l\'aide d\'un fouet.\r\n<br><br>\r\nEnlevez la casserole du feu et, à l\'aide d\'un mixeur plongeant, mixez le tout une dizaine de seconde. Vous pouvez débarrasser le liquide dans les récipients de service et laisser refroidir. Une fois à température ambiante, réservez-les au réfrigérateur pendant au moins 1h, le temps de bien laisser prendre la gelée. Une fois bien fraîche et bien prise, vous pouvez déguster !', 'A une chance non-négligeable de vous rendre bleu. Et gélatineux.', 4, 51, NULL),
(36, 5, 'Sneffels Crumble', '\"J\'ai peur de ce que nous allons peut-être découvrir et j\'espère que nous nous en sortirons vivants. Il me tarde déjà de goûter à nouveau à ces fabuleux desserts aux fruits que l\'on nous prépare ici.\"\r\n<br>\r\nJournal de voyage. Le 28 juin 1863. AL.', '20 min', '15 min', 'Préchauffez votre four à 200°C.\r\n<br><br>\r\nCommencez par préparer la pâte à crumble. Dans un grand bol, versez 60g de sucre, 60g de farine, 60g de poudre d\'amandes et 60g de beurre. Du bout des doigts, mélangez ces éléments jusqu\'à obtenir un appareil sablé irrégulier. Etalez alors les morceaux de pâte à crumble sur une plaque. Réservez au réfrigérateur pendant 10min.\r\n<br><br>\r\nRincez rapidement les fruits (mûres et framboises), égouttez-les et réservez-les. Dans une casserole à feu doux, versez les 80g de sucre restant et réalisez un caramel à sec. Dès que le sucre a pris une belle couleur brune, incorporez-y les fruits et laissez cuire quelques minutes à feu doux. Fendez la gousse de vanille en deux et grattez-la. Déposez les graines de vanilles sur les fruits. Mélangez délicatement le tout à l\'aide d\'une spatule pour que le caramel enrobe bien les fruits. Réservez hors du feu.\r\n<br><br>\r\nPassez à la dernière étape de la préparation, le montage : dans un plat allant au four, versez les fruits caramélisés. Sortez le crumble du réfrigérateur et recouvrez-en les fruits. Enfournez 20 à 25min jusqu\'à l\'obtention d\'une belle croûte d\'un brun doré.\r\n<br><br>\r\nDégustez ce crumble encore chaud ou tiède.', 'Vous rendra plus ardent que le feu d\'un volcan.', 3, 52, NULL),
(37, 6, 'Gâteau à la pistache et à la crème de Pera', 'Bien que vous n\'y compreniez pas grand-chose, il semblerait que votre habileté en matière d\'interactions sociales avec l\'équipage se soit grandement améliorée : preuve en est, vous vous êtes découvert une veritable passion pourla pâtisserie et ce n\'est ni le Capitaine Janeway ni Neelix qui s\'en plaindront...', '55 min', '15 min', 'Préchauffez votre four à 180°C.\r\n<br><br>\r\nCommencez par réaliser votre appareil à gâteau. Dans un grand cul-de-poule, mélangez les 250g de farine, 220g de sucre, 1,5 sachet de levure chimique et 1 pincée de sel. Réservez quelques instants.\r\n<br><br>\r\nSéparez les blancs des jaunes de vos 8 oeufs dans deux culs-de-poule. Montez les blancs en neige très ferme, réservez. Ajoutez aux jaunes d\'oeufs les 15cl de jus de fraise et les 15cl d\'huile végétale. Fouettez ce mélange, puis incorporez-y le mélange d\'ingrédients secs réservé. Incorporez les 40g de pâte de pistaches puis les blancs d\'oeufs en neige. Réservez quelques instants.\r\n<br><br>\r\nFaites chauffer une poêle à feu moyen, et faites-y torréfier les 50g de pistaches entières nature 2min à sec, puis ajoutez les 10g de beurre et le sucre restant (20g). Laissez cuire 4min supplémentaires et débarrassez les pistaches sur une feuille de papier absorbant. Ajoutez-les à l\'appareil à gâteau.\r\n<br><br>\r\nBeurrez un moule à manqué de fond amovible et versez-y la préparation. Enfournez pour 55min puis sortez le gâteau du four. Attendez qu\'il soit tiède pour le démouler.\r\n<br><br>\r\nPréparez le glaçage au mascarpone. Déposez les 100g de mascarpone dans un cul-de-poule. Ajoutez 60g de beurre et, à l\'aide d\'un batteur électrique, fouettez énergiquement le tout pendant 1min jusqu\'à obtention d\'un mélange homogène. A vitesse réduite, incorporez alors 200g de sucre glace au mélange pour avoir un glaçage blanc et bien brillant.\r\n<br><br>\r\nDéposez ce glaçage en une belle couche sur le gâteau froid. Lissez le glaçage le plus possible, avec une rigueur toute vulcaine, et déposez les bâtonnets d\'orange confite tout autour du gâteau. Réservez au réfrigérateur pendant 45min.\r\n<br><br>\r\nDressage : servez ce gâteau une fois le glaçage pris, et pensez à dessiner une onde à sa surface en utilisant 15cl de coulis de fraises. Longue vie et prospérité !', 'Vous fera vivre une vie longue et prospère.', 3, 53, NULL),
(38, 7, 'Gâteau de la Causalité', 'Et si avec un simple gâteau, vous étiez en mesure de modifier le cours des choses, d\'altérer l\'Illusion tout en préservant les apparences ? Si vous étiez en mesure de jouer sur chaque ligne de son programme pour qu\'elle provoque un nouvel effet à celui ou celle qui le dégusterait ? Voilà comment créer un gâteau au chocolat capable de faire palpiter le coeur de celui ou celle qui le porterait à ses lèvres, un gâteau au chocolat qui vous ferait toucher le tissu de l\'univers.', '45min', '20min', 'Préchauffez votre four à 180°C.\r\n<br><br>\r\nDans un bol au bain-marie, faites fondre 100g de beurre et réservez-le.\r\n<br><br>\r\nDans un grand bol, mixez ou concassez 300g de biscuits speculoos. Incorporez le beurre fondu et mélangez bien.\r\n<br><br>\r\nDans un moule à manqué, étalez le mélange et tassez-le bien. Enfournez pour 12 min de cuisson. Réservez.\r\n<br><br>\r\nPassez à la préparation d\'une ganache au chocolat. Concassez 125g de chocolat noir et déposez les morceaux dans un grand bol. Faites bouillir 30cl de crème liquide et versez-la sur le chocolat tout en remuant, jusqu\'à ce que le mélange soit homogène. Vous voilà avec une belle ganache au chocolat noir !\r\n<br><br>\r\nEnfin, préparez l\'appareil à cheesecake. Dans un grand bol, mélangez 300g de cream cheese, 100g de mascarpone et la ganache.\r\n<br><br>\r\nSéparez les blancs des jaunes de vos 3 oeufs. Faites blanchir les jaunes avec 125g de sucre et incorporez-les peu à peu au mélange chocolaté.\r\n<br><br>\r\nBattez les blancs en neige avec 1 pincée de sel puis incorporez-les à la préparation. Mélangez bien, tout en ajustant le jus d\'une orange.\r\n<br><br>\r\nVersez la crème dans le moule et enfournez de nouveau pour 30min. Sortez le moule du four, laissez le cheesecake refroidir pendant 20min avant de le mettre au réfrigérateur pour au moins 6h.\r\n<br><br>\r\nDressage : servez le cheesecake en tranches épaisses et délectez-vous de ses saveurs orgasmiques !', 'Vous fera voir à travers l\'illusion des machines', 3, 54, NULL),
(47, 8, 'Gâteau au miel des Béornides', 'Voici une recette nourrissante qui respire la bonne odeur de printemps vu Val d\'Anduin et réconforte toute une compagnie avant qu\'elle ne poursuive sa périlleuse route vers Erebor.', '40 min', '20 min', 'Préchauffez votre four à 180°C et placez un cul-de-poule au réfrigérateur.\r\n<br/><br/>\r\nCommencez par beurrer un moule à manqué, puis préparez l\'appareil à moelleux. Séparer les jaunes des blancs de vos 4 oeufs dans deux saladiers. A l\'aide d\'un batteur électrique, montez les blancs en neige avec une pincée de sel et réservez.\r\n<br/><br/>\r\nAjoutez 200g de sucre aux jaunes d\'oeufs. Fouettez énergiquement jusqu\'à ce que le mélange devienne mousseux et presque blanc. Tout en mélangeant, incorporez 200g de farine, 150g de beurre fondu, un sachet de levure, 3 cuillères à soupe de miel d\'acacia et les blancs montés. L\'idée est d\'obtenir un appareil homogène : monter les blancs en neige et ajouter la levure servira à apporter de la légèreté et du moelleux au gâteau.\r\n<br/><br/>\r\nVersez l\'appareil dans un moule à cake et enfournez pour 40min.\r\n<br/><br/>\r\nPendant la cuisson, préparez la crème fouettée au miel. Versez la crème fleurette dans le cul-de-poule que vous aviez mis à refroidir au réfrigérateur. A l\'aide d\'un fouet ou d\'un batteur électrique, fouettez la crème tout en incorporant 2 cuillères à soupe de miel liquide lentement, en un mince filet. Une fois la crème au miel fouettée, déposez-la à la surface du gâteau pas encore démoulé, en une belle épaisseur.\r\n<br/><br/>\r\nDressage : saupoudrez de zeste de citron râpé ou de caramel concassé et servez de généreuses parts.', 'A une chance non-négligeable de vous octroyer une taille de hobbit.', 3, 55, NULL),
(48, 9, 'Cake au citron des 7 Royaumes', 'Comment ne pas tomber dans le silence et la torpeur après les horreurs que votre famille et vous-même avez pu subir ? La mort de votre père, la séparation d\'avec vos frères et soeurs... Rares sont les choses qui sauraient vous tirer un sourire et vous réchauffer le coeur... Et pourquoi pas une recette de petits cakes au citron par exemple ?', '40min', '20 min', 'Préchauffez votre four à 180°C.\r\n<br><br>\r\nCommencez par préparer l\'appareil à cupcakes. Versez dans un grand bol 100g de sucre et 4 oeufs. Fouettez jusqu\'à obtenir un appareil lisse et blanchi. Ajoutez alors 100g de farine et 1 sachet de levure, mélangez bien.\r\n<br><br>\r\nVersez 135g de beurre fondu sur la préparation et incorporez-le à l\'aide d\'une spatule ou d\'un fouet. Versez la préparation dans des petits moules à cupcakes en carton ou en silicone et enfournez pour 15min.\r\n<br><br>\r\nPendant la cuisson, préparez le glaçage citron-mascarpone. Dans un bol, versez 300g de mascarpone, le jus d\'un citron et 50g de sucre glace. Fouettez jusqu\'à ce que le mascarpone ait bien monté et passez dans une poche avec une douille simple. Réservez au frais.\r\n<br><br>\r\nMettez 25cl de lemon curd dans une autre poche à douille.\r\n<br><br>\r\nDressage : une fois les cupcakes sortis du four et tiédis, pochez un point de lemen curd et plusieurs points de crème citron-mascarpone sur chacun d\'eux. Saupoudrez de zeste de citron râpé et dégustez !', 'Une recette qui garantit un mariage festif.', 3, 56, NULL),
(49, 10, 'Queen Loukoums', 'Comment résister à de délicieux loukoums, vous qui aimez tant ça ? Certes cette femme toute de blanc vêtue a quelque chose de louche, mais ne donneriez-vous pas tout pour de si bonnes friandises ? Voilà comment les réaliser !', '10min', '15min', 'Commencez par huiler un plat à bord haut avec de l\'huile de pépins de raisin. Réservez.\r\n<br><br>\r\nPréparez l\'appareil à loukoums. Dans une casserole, réalisez un sirop : versez 30cl d\'eau, 300g de sucre, 5g d\'agar-agar, 1 cuillère à soupe d\'eau de rose, 1 cuillère à café de jus de citron et 2 gouttes de colorant alimentaire rose.\r\n<br><br>\r\nPortez le tout à ébullition. A l\'aide d\'un thermomètre de pâtisserie, vérifiez la température de cuisson du sirop. Une fois les 110°C atteints, versez le contenu de la casserole dans le plat huilé.\r\n<br><br>\r\nRéservez jusqu\'à ce que le liquide refroidisse et prenne. Avec le sucre glace, fleurez un plat et démoulez l\'appareil à loukoums par-dessus. Détaillez-le en gros cubes. Saupoudrez les cubes de sucre glace et dégustez !\r\n<br><br>\r\nVariante : vous pouvez réaliser la même recette en remplaçant l\'eau de rose par de l\'eau de fleur d\'oranger et le colorant rose par du colorant orange.', 'Réchaufferont un coeur froid comme la glace.', 4, 57, NULL),
(50, 11, 'Les Patacitrouilles du Poudlard Express', 'Rappelez-vous : quel plaisir de voyager avec le Poudlard Express, l\'ambiance qui régnait dans les wagons à l\'approche de la reprise des cours et le chariot de friandises avec ses Chocogrenouilles, Fondants du Chaudron, Dragées-surprises de Bertie Crochue et autres Patacitrouilles ! Voici une recette à réaliser chez soi sans trop de difficulté.', '45min', '25min', 'Abaissez 400g de pâte brisée en un rectangle de 2mm d\'épaisseur. Etalez-la sur une plaque de cuisson et réservez-la au réfrigérateur le temps de préparer la garniture.\r\n<br><br>\r\nPréchauffez votre four à 180°C.\r\n<br><br>\r\nDétaillez 300g de potiron en cubes. Epluchez une pomme, ôtez son trognon, puis coupez-la en dés. Concassez 150g de noisettes, réservez-les.\r\n<br><br>\r\nDéposez 70g de beurre dans une poêle et faites chauffer à feu moyen. Lorsqu\'il a fondu, ajoutez le potiron et la pomme. Couvrez et laissez cuire à feu moyen pendant 15min en mélangeant régulièrement. Quand le mélange est bien fondant, ajoutez 100g de sucre, les noisettes concassées et 1 cuillère à soupe de miel. Mélangez et laissez compoter 5 min supplémentaires à feu doux. Saupoudrez d\'une cuillère à café de cannelle et mélangez bien à l\'aide d\'une cuillère en bois pour que tous les éléments soient bien homogènes. Réservez hors du feu.\r\n<br><br>\r\nBeurrez 4 moules à muffins. Sortez la pâte brisée du réfrigérateur. Détaillez de quoi chemiser les moules. A l\'aide d\'un emporte-pièce circulaire, détaillez le restant de pâte pour avoir de quoi recouvrir les moules, réservez-les.\r\n<br><br>\r\nChemiser les moules et garnissez-les du mélange au potiron. Recouvres avec les ronds de pâte réservés. A l\'aide d\'un pinceau, passez un jaune d\'oeuf sur vos chaussons et enfournez pour 15 min. Laissez tiédir avant de démouler et de déguster.', 'Il parait qu\'en manger suffisamment fera de vous un sorcier.', 3, 58, NULL),
(51, 11, 'Tarte à la mélasse', 'Impossible d\'organiser un banquet digne de ce nom à Poudlard sans tarte à la mélasse.', '50min', '15min', 'Préchauffez votre four à 180°C.\r\n<br><br>\r\nCommencez par foncer un cercle de pâtisserie avec 240g de pâte sablée : pour ce faire, utilisez de préférence une pâte sablée maison (ou prête à dérouler pour plus de facilité) et placez-la dans le cercle en plaquant bien la pâte du bout des doigts contre les parois du cercle, puis en ôtant l\'excédent.\r\n<br><br>\r\nDisposez sur la pâte une feuille de papier sulfurisé et déposez dessus de manière homogène un poids ou des légumes secs pour que la pâte ne gonfle pas à la précuisson. Enfournez pendant 10min et réservez hors du four.\r\n<br><br>\r\nPassez à la préparation de l\'appareil. Au bain-marie, faites à fondre 80g de beurre doux et réservez-le. Dans un grand bol, battez 2 oeufs, incorporez le fromage à tartiner (250g de cream cheese) et 150g de mascarpone, puis réservez.\r\n<br><br>\r\nPortez les 50cl de Golden Syrup à petite ébullition, puis incorporez-le à la préparation au fromage en mélangeant bien jusqu\'à obtenir une pâte homogène. Incorporez 80g de chapelure fine en dernier.\r\n<br><br>\r\nVersez l\'appareil à tarte dans le fond de tarte précuit et enfournez pour 40min.\r\n<br><br>\r\nDressage : saupoudrez de 20g de noix de coco râpée et dégustez !', 'Donnera quelques points en plus à votre maison en fin d\'année (si vous en offrez une part à Dumbledore).', 3, 59, NULL),
(52, 12, 'Chaleureuse tarte aux myrtilles', 'Y a pas à dire, voilà une recette de tarte à la myrtille que personne ne pourra décemment confondre avec des briques ou avec du mortier servant à boucher des fissures dans un muret. Comme quoi les fruits, quand on les laisse tranquille, c\'est vachement bon. Après, faites quand même attention de pas vous couper la gencive avec un bout de grumeau cuit. Parait que c\'est possible...', '25min', '15min', 'Préchauffez votre four à 180°C.\r\n<br><br>\r\nCommencez par précuire 240g de pâte sablée : abaissez-la et foncez-en un plat à tarte. Piquez-la à l\'aide d\'une fourchette et recouvrez-la d\'une feuille de papier sulfurisé. Déposez dessus des poids de cuisson (ou des haricots secs) pour que la pâte ne gonfle pas. Enfournez pendant  15 min, puis laissez tiédir.\r\n<br><br>\r\nPassez à la préparation de la crème d\'amandes. Dans un grand bol, réalisez un beurre pommade (cela consiste à le mélanger jusqu\'à ce qu\'il prenne une consistance crémeuse) avec 75g de beurre. Ajoutez 75g de sucre. Incorporez alors 1 oeuf, mélangez bien et incorporez un deuxième oeuf. Mélangez jusqu\'à obtenir une crème bien lisse, puis incorporez 75g de poudre d\'amandes. Votre crème d\'amandes est prête ! Mettez-la en poche et garnissez-en la pâte sablée. Enfournez de nouveau pendant 10min, puis réservez.\r\n<br><br>\r\nPréparez à présent le confit de myrtilles. Dans une casserole, faites fondre 150g de confiture de myrtilles. Lorsqu\'elle est liquide et tiède, ajoutez, hors du feu, les 300g de myrtilles fraîches. A l\'aide d\'une cuillère à soupe ou d\'une spatule, mélangez délicatement sans écraser les fruits. Versez sur la tarte.\r\n<br><br>\r\nPour finir, dans un petit bol, versez 20cl de crème fraîche et 75g de sucre. Fouettez quelques instants et mettez la crème dans un cornet ou dans une poche avec une petite douille. Parsemez la tarte de points de crème sucrée et saupoudrez de brins de lavande.\r\n<br><br>\r\nDressage : servez de belles parts de cette tarte à vos convives et profitez ! Y a pas à dire, quand y a du dessert à table, c\'est tout de suite plus chaleureux !', 'Vous vaudra une place de choix à la table ronde du roi Arthur.', 3, 60, NULL),
(53, 14, 'Bretzel Sans Fin', 'Cette recette ne sera pas sans vous rappeler les aventures de Bastien et Atreyu en Fantasia...', '15min', '15min puis 1h de repos', 'Commencez par verser dans un cul-de-poule 500g de farine, 80g de sucre glace, 2 cuillères à café de sel fin, 5g de cannelle moulue et 1 sachet de levure déshydratée. Mélangez tous ces éléments et faites un puits au centre. Déposez-y 70g de beurre ramolli et commencez à pétrir jusqu\'à l\'obtention d\'une pâte homogène. Incorporez 15cl de lait et pétrissez de nouveau. Laissez la pâte reposer 1h à température ambiante après l\'avoir recouverte d\'un torchon propre. Au bout de 45min de repos, préchauffez votre four à 220°C. Préparez une plaque de cuisson recouverte d\'une feuille de papier sulfurisé.\r\n<br><br>\r\nAu terme du repos, reprenez la pâte et pressez-la du plat de la main pour la dégazer et lui faire perdre du volume. Fleurez (farinez) un plan de travail et déposez-y la boule de pâte. Séparez-la en 4 pâtons et réalisez des boudins. Etirez-les une première fois de sorte qu\'ils aient 3cm d\'épaisseur. Reprenez chaque boudin et étirez-les un peu plus. Enfin, nouez-les comme sur la photo. Déposez chaque bretzel sur le plan de travail.\r\n<br><br>\r\nPassez à leur cuisson. Portez 3L d\'eau à ébullition avec 50g de bicarbonate alimentaire et plongez-y les bretzels un par un : pochez-les 45s chacun. A l\'aide d\'une écumoire, récupérez-les au fur et à mesure, et déposez-les sur une feuille de papier absorbant pour bien les égoutter. Enfin, déposez-les sur la plaque de cuisson. A l\'aide d\'un pinceau, badigeonnez-les de 2 oeufs battus et enfournez pour 15min. Sortez les bretzels du four, laissez-les tiédir sur une grille et saupoudrez-les de 2 cuillères à soupe de sucre fin avant de déguster.', 'Vous fera découvrir une infinité de saveurs à chaque bouchée.', 3, 63, NULL),
(54, 16, 'Sen Bao', 'Depuis que vous êtes entré au service de Yubaba, vous n\'avez plus une minute à vous : au four et au moulin pour gérer l\'eau des bains avec le vieux Kamaji ou encore à briquer les sols avec Lin. A peine avez-vous le temps de vous cuisiner ces délicieux bao à la pâte de haricots rouges. Peut-être pourrez-vous les partager avec Haku ?', '40min', '10min puis 2h15 de repos', 'Commencez par préparer votre pâte à pain vapeur. Dans un saladier, diluez 5g de levure boulangère sèche dans 5cl d\'eau tière et réservez pendant 10min. Ajoutez alors 250g de farine type 45 et incorporez-la, tout en versant 15cl d\'eau tiède. Pétrissez jusqu\'à obtenir une boule lisse. Placez le pâton réalisé dans un autre saladier. Recouvrez de film plastique et laissez la pâte lever à température ambiante pendant 1h30.\r\n<br><br>\r\nPréparez la pâte de haricots rouges. Déposez les 200g d\'azukis dans une casserole et recouvrez-les d\'eau. Portez à ébullition et laissez cuire à petite ébullition pendant 5min. Egouttez les haricots et renouvelez l\'opération en changeant l\'eau de cuisson.\r\n<br><br>\r\nUne fois les haricots blanchis et débarrassés de toute amertume, versez 70cl d\'eau minérale dans la casserole et plongez-y les haricots. Faites-les cuire à petite ébullition pendant 35min, jusqu\'à ce qu\'ils soient fondants à coeur. Hors du feu, laissez-les 10min supplémentaires dans l\'eau.\r\n<br><br>\r\nÔtez alors un tiers de l\'eau de cuisson, ajoutez 180g de sucre et 1 pincée de sel. A feu doux, reprenez la cuisson et laissez mijoter 15 à 20min supplémentaires en mélangeant régulièrement. L\'idée est de réduire la préparation pour avoir une belle purée, pas trop liquide mais légèrement sirupeuse. Une fois cette texture obtenue, réservez et passez au montage de vos brioches vapeur.\r\n<br><br>\r\nReprenez la boule de pâte à bao. Ôtez le film plastique et pressez la pâte du poing pour la dégazer et qu\'elle perde de son volume. Fleurez (farinez) le plan de travail et déposez-y la boule de pâte. Façonnez-la en un boudin épais que vous couperez en 10 morceaux réguliers. Abaissez chaque morceau en un disque d\'une dizaine de centimètres de diamètre.\r\n<br><br>\r\nPrenez un disque dans le creux de la main et déposez en son coeur 1 cuillère à café de la pâte de haricots rouges. Refermez le disque sur lui-même en le pliant en aumonière. Renouvelez l\'opération pour chaque disques. Vos bao sont presque prêts !\r\n<br><br>\r\nDéposez dans un panier vapeur une feuille de papier sulfurisé. Posez dessus les bao et laissez-les reposer et gonfler 45min de plus.\r\n<br><br>\r\nUne fois les bao bien gonflés, vous pouvez passer à leur cuisson. Sous le panier vapeur, portez l\'eau à ébullition. Comptez 10min de cuisson. Maintenez l\'ébullition à feu moyen, il ne faut pas que la vapeur soit trop forte, elle racornirait les bao. Au terme de la cuisson, retirez-les du panier vapeur et servez immédiatement.', 'Vous permettra de tenir durant vos épuisantes journées de travail aux bains publics.', 4, 64, NULL),
(55, 17, 'Tuxedo Cake', 'Voilà un gâteau de roses pour rappeler à la Princesse de la Lune que vous serez toujours là pour la protéger !', '20min', '20min', 'Préchauffez votre four à 180°C. Beurrez un moule à manqué.\r\n<br><br>\r\nPréparez l\'appareil pour le cake au chocolat. Séparez les jaunes des blancs de vos 4 oeufs dans deux culs-de-poule.\r\n<br><br>\r\nSaupoudrez les blancs d\'une pincée de sel. A l\'aide d\'un batteur électrique, montez-les en neige. Réservez.\r\n<br><br>\r\nAjoutez 200g de sucre dans le cul-de-poule contenant les jaunes. Fouettez énergiquement jusqu\'à l\'obtention d\'un mélange mousseux, presque blanc. Tout en mélangeant, incorporez 200g de farine, 150g de beurre fondu, un sachet de levure pâtissière et les blancs montés. Faites fondre 75g de chocolat noir au bain-marie ou au four à micro-ondes et ajoutez-le à l\'appareil précédent.\r\n<br><br>\r\nVersez dans le moule à manqué et enfournez pour 40min. Sortez le gâteau du four et attendez qu\'il ait refroidi avant de le démouler.\r\n<br><br>\r\nPendant qu\'il refroidit, préparez la crème au beurre et mascarpone. Dans un cul-de-poule, versez 400g de mascarpone et, à l\'aide d\'un fouet ou d\'un batteur électrique, fouettez-le pendant 30s pour l\'assouplir. Ajoutez 300g de sucre glace, 125g de beurre pommade, 2 gouttes de colorant rouge et 1 goutte de colorant rose, puis fouettez énergiquement jusqu\'à obtenir une belle crème épaisse et brillante. Passez-la en poche équipée d\'une douille de type 1M (qui permet de réaliser de jolies rosaces).\r\n<br><br>\r\nReprenez votre gâteau au chocolat et pochez des roses en crème tout autour du gâteau pour le recouvrir intégralement ! Dégustez-le au clair de lune avec votre bien-aimé·e...', 'Vous transformera en une guerrière rayonnante.', 3, 65, NULL),
(56, 18, 'Brioche de Versailles', 'Malgré les mises en garde de votre ami le capitaine de la Garde, impossible de ne pas penser au beau et inaccessible Fersen. Pourquoi ne pas se réconforter en dégustant l\'une de ces magnifiques brioches ?', '10 à 12 minutes', '10 minutes puis 4h30 de repos', 'Préchauffez votre four à 180°C.\r\n<br><br>\r\nDans le bol d\'un robot pâtissier, versez 125g de farine type 45, 20g de sucre en poudre, 1 sachet de sucre vanillé, 1 cuillère à café rase de levure boulangère sèche, un oeuf entier et 3 jaunes d\'oeufs. Ajoutez une pincée de sel, battez à vitesse moyenne et régulière pendant 5 minutes. Ajoutez alors 80g de beurre mou et battez 10 minutes supplémentaires.\r\n<br><br>\r\nFleurez (farinez) un cul-de-poule et déposez-y la pâte. Recouvrez-la d\'une feuille de film plastique et laissez-la pousser pendant 1h. Reprenez la pâte et pétrissez-la avant de la filmer de nouveau, puis placez-la au réfrigérateur pendant au moins 2h.\r\n<br><br>\r\nUne fois ce temps écoulé, sortez la pâte du réfrigérateur et laissez-la retrouver la température ambiante. Pressez-la ensuite du poing pour la dégazer et coupez-la en 10 boules égales. Prélevez une petite partie de chaque boule pour en façonner une plus petite.\r\n<br><br>\r\nPlacez les 10 grosses boules dans des moules à brioche. Pressez-en le centre du pouce et, dans le creux, déposez les petites boules de pâte. Réservez à température ambiante 1h supplémentaire. Les brioches sont presque prêtes à être cuites : mélangez un jaune d\'oeuf avec un peu d\'eau et, à l\'aide d\'un pinceai, badigeonnez-en vos pâtes à brioche. Saupoudrez de cristaux de sucre si vous le souhaitez, et enfournez pour 10 min.\r\n<br><br>\r\nPendant ce temps, préparez-vous un chocolat chaud crémeux digne de ce nom ! Au bain-marie, faites fondre 80g de chocolat noir et ajoutez-y 10cl de crème liquide et 10cl de lait. Mélangez, toujours au bain-marie, et servez bien chaud avec les brioches.', 'Ce noble plat pourrait vous faire un effet révolutionnaire.', 3, 66, NULL),
(57, 19, 'Dorayaki de Nobu', 'Voici une recette qu\'un chat robot pourra emporter avec lui dans le XXIIe siècle.', '10min', '20min puis 15min de repos', 'Commencez par réaliser votre pâte à dorayaki. Cassez 3 oeufs dans un cul-de-poule. Ajoutez 120g de sucre et 1 cuillère de miel, puis mélangez énergiquement à l\'aide d\'un fouet. Ajoutez 140g de farine, 1 sachet de levure chimique et une pincée de bicarbonate alimentaire, et incorporez les éléments jusqu\'à obtenir un appareil lisse et homogène. Placez au réfrigérateur 15min.\r\n<br><br>\r\nReprenez votre appareil à dorayaki et mélangez-le quelques instants avant de passer à la cuisson.\r\n<br><br>\r\nFaites chauffer une poêle à feu moyen et, à l\'aide d\'une feuille de papier absorbant, badigeonnez-en la surface d\'huile. Avec une louche, versez l\'appareil à dorayaki dans la poêle pour réaliser de petits disques. Quand vous voyez apparaître des bulles à la surface de la pâte, vous pouvez la retourner et la laisser cuire 1 à 2min supplémentaires. Réalisez un nombre pair de petits disques.\r\n<br><br>\r\nVos dorayaki sont presque prêts, il ne vous reste plus qu\'à déposer à la surface d\'un disque 1 cuillère à café d\'anko, de pâte à tartiner ou de confiture avant de le recouvrir d\'un autre disque. Répétez l\'opération jusqu\'à ce que tous vos dorayaki soient prêts ! Voilà de délicieux dorayaki, si bons que vous n\'aurez pas besoin de casquoptère pour vous envoler de plaisir !', 'Vous donnera tout le savoir-faire culinaire du futur.', 3, 67, NULL);

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
