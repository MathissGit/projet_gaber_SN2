-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 04 avr. 2025 à 09:45
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_gaber_sn2`
--

-- --------------------------------------------------------

--
-- Structure de la table `coureur`
--

DROP TABLE IF EXISTS `coureur`;
CREATE TABLE IF NOT EXISTS `coureur` (
  `num_coureur` int NOT NULL,
  `prenom_coureur` varchar(100) NOT NULL,
  `nom_coureur` varchar(100) NOT NULL,
  `age_coureur` int NOT NULL,
  `DN_coureur` date NOT NULL,
  `bonif_tot_coureur` time DEFAULT NULL,
  `penalite_tot_coureur` time DEFAULT NULL,
  `distance_tot_coureur` decimal(15,2) NOT NULL,
  `annee_coureur` date NOT NULL,
  `nbr_etape_coureur` int DEFAULT NULL,
  `tot_sec_coureur` time NOT NULL,
  `gap_sec_coureur` time DEFAULT NULL,
  `num_equipe` varchar(3) NOT NULL,
  `num_pays` varchar(3) NOT NULL,
  PRIMARY KEY (`num_coureur`),
  KEY `num_equipe` (`num_equipe`),
  KEY `num_pays` (`num_pays`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `coureur`
--

INSERT INTO `coureur` (`num_coureur`, `prenom_coureur`, `nom_coureur`, `age_coureur`, `DN_coureur`, `bonif_tot_coureur`, `penalite_tot_coureur`, `distance_tot_coureur`, `annee_coureur`, `nbr_etape_coureur`, `tot_sec_coureur`, `gap_sec_coureur`, `num_equipe`, `num_pays`) VALUES
(1, 'Ben', 'OConnor', 30, '1993-01-12', '00:00:00', '00:00:00', '1500.00', '2025-03-28', 21, '03:45:30', '00:10:00', 'AG2', 'AUS'),
(2, 'Geoffroy', 'Bouchard', 27, '1996-04-21', '00:00:00', '00:00:00', '1425.00', '2025-03-28', 21, '03:50:00', '00:12:30', 'AG2', 'FRA'),
(3, 'Mikaël', 'Chérel', 35, '1988-06-05', '00:00:00', '00:00:00', '1400.00', '2025-03-28', 21, '04:00:00', '00:15:00', 'AG2', 'FRA'),
(4, 'Benoît', 'Cosnefroy', 28, '1995-09-01', '00:00:00', '00:00:00', '1450.00', '2025-03-28', 21, '03:55:00', '00:11:00', 'AG2', 'FRA'),
(5, 'Stan', 'Dewulf', 26, '1997-07-14', '00:00:00', '00:00:00', '1390.00', '2025-03-28', 21, '04:10:00', '00:20:00', 'AG2', 'BEL'),
(6, 'Bob', 'Jungels', 31, '1992-09-22', '00:00:00', '00:00:00', '1480.00', '2025-03-28', 21, '03:40:00', '00:08:00', 'AG2', 'LUX'),
(7, 'Oliver', 'Naesen', 33, '1990-10-18', '00:00:00', '00:00:00', '1490.00', '2025-03-28', 21, '03:42:00', '00:09:00', 'AG2', 'BEL'),
(8, 'Aurélien', 'Paret-Peintre', 29, '1994-01-21', '00:00:00', '00:00:00', '1440.00', '2025-03-28', 21, '03:50:00', '00:12:00', 'AG2', 'FRA'),
(9, 'Mathieu', 'van der Poel', 28, '1995-01-19', '00:00:00', '00:00:00', '1600.00', '2025-03-28', 21, '03:30:00', '00:05:00', 'ALP', 'NED'),
(10, 'Silvan', 'Dillier', 33, '1990-02-05', '00:00:00', '00:00:00', '1550.00', '2025-03-28', 21, '03:35:00', '00:06:00', 'ALP', 'SUI'),
(11, 'Michael', 'Gogl', 30, '1993-07-01', '00:00:00', '00:00:00', '1500.00', '2025-03-28', 21, '03:45:00', '00:10:00', 'ALP', 'AUT'),
(12, 'Alexander', 'Krieger', 32, '1991-09-15', '00:00:00', '00:00:00', '1480.00', '2025-03-28', 21, '03:47:00', '00:11:00', 'ALP', 'GER'),
(13, 'Jasper', 'Philipsen', 25, '1998-11-02', '00:00:00', '00:00:00', '1580.00', '2025-03-28', 21, '03:25:00', '00:03:00', 'ALP', 'BEL'),
(14, 'Edward', 'Planckaert', 28, '1995-07-19', '00:00:00', '00:00:00', '1505.00', '2025-03-28', 21, '03:40:00', '00:08:00', 'ALP', 'BEL'),
(15, 'Kristian', 'Sbaragli', 30, '1993-02-14', '00:00:00', '00:00:00', '1460.00', '2025-03-28', 21, '03:50:00', '00:12:00', 'ALP', 'ITA'),
(16, 'Guillaume', 'Van Keirlsbuck', 27, '1996-05-12', '00:00:00', '00:00:00', '1470.00', '2025-03-28', 21, '03:55:00', '00:14:00', 'ALP', 'BEL'),
(17, 'Nairo', 'Quintana', 33, '1990-02-04', '00:00:00', '00:00:00', '1600.00', '2025-03-28', NULL, '03:35:00', '00:08:00', 'ARK', 'COL'),
(18, 'Warren', 'Barguil', 32, '1991-10-28', '00:00:00', '00:00:00', '1550.00', '2025-03-28', 21, '03:45:00', '00:10:00', 'ARK', 'FRA'),
(19, 'Maxime', 'Bouet', 34, '1989-07-14', '00:00:00', '00:00:00', '1500.00', '2025-03-28', 21, '04:00:00', '00:12:00', 'ARK', 'FRA'),
(20, 'Amaury', 'Capiot', 26, '1997-11-02', '00:00:00', '00:00:00', '1450.00', '2025-03-28', 21, '03:50:00', '00:09:00', 'ARK', 'BEL'),
(21, 'Hugo', 'Hofstetter', 29, '1994-06-15', '00:00:00', '00:00:00', '1480.00', '2025-03-28', 21, '03:55:00', '00:13:00', 'ARK', 'FRA'),
(22, 'Matis', 'Louvel', 24, '1999-03-23', '00:00:00', '00:00:00', '1460.00', '2025-03-28', 21, '04:05:00', '00:14:00', 'ARK', 'FRA'),
(23, 'Lukas', 'Owsian', 28, '1995-08-30', '00:00:00', '00:00:00', '1490.00', '2025-03-28', 21, '03:40:00', '00:07:00', 'ARK', 'POL'),
(24, 'Connor', 'Swift', 30, '1993-10-13', '00:00:00', '00:00:00', '1520.00', '2025-03-28', 21, '03:45:00', '00:09:30', 'ARK', 'GBR'),
(25, 'Alexey', 'Lutsenko', 31, '1992-09-07', '00:00:00', '00:00:00', '1580.00', '2025-03-28', 21, '03:40:00', '00:08:00', 'AST', 'KAZ'),
(26, 'Samuele', 'Battistella', 25, '1998-11-05', '00:00:00', '00:00:00', '1520.00', '2025-03-28', 21, '03:45:00', '00:09:30', 'AST', 'ITA'),
(27, 'Joe', 'Dombrowski', 33, '1990-04-01', '00:00:00', '00:00:00', '1480.00', '2025-03-28', 21, '03:50:00', '00:12:00', 'AST', 'USA'),
(28, 'Fabio', 'Felline', 33, '1990-01-29', '00:00:00', '00:00:00', '1530.00', '2025-03-28', 21, '03:43:00', '00:10:00', 'AST', 'ITA'),
(29, 'Dmitriy', 'Gruzdev', 35, '1988-07-10', '00:00:00', '00:00:00', '1490.00', '2025-03-28', 21, '03:55:00', '00:13:00', 'AST', 'KAZ'),
(30, 'Gianni', 'Moscon', 28, '1995-04-20', '00:00:00', '00:00:00', '1540.00', '2025-03-28', 21, '03:40:00', '00:07:00', 'AST', 'ITA'),
(31, 'Simone', 'Velasco', 27, '1996-01-11', '00:00:00', '00:00:00', '1510.00', '2025-03-28', 21, '03:45:00', '00:10:00', 'AST', 'ITA'),
(32, 'Andrey', 'Zeits', 36, '1987-06-14', '00:00:00', '00:00:00', '1470.00', '2025-03-28', 21, '04:00:00', '00:12:00', 'AST', 'KAZ'),
(33, 'Kamil', 'Gradek', 29, '1994-05-09', '00:00:00', '00:00:00', '1550.00', '2025-03-28', 21, '03:35:00', '00:07:00', 'BHV', 'POL'),
(34, 'Luis León', 'Sanchez', 40, '1983-11-27', '00:00:00', '00:00:00', '1500.00', '2025-03-28', 21, '03:50:00', '00:12:00', 'BHV', 'ESP'),
(35, 'Fred', 'Wright', 26, '1997-04-17', '00:00:00', '00:00:00', '1480.00', '2025-03-28', 21, '03:45:00', '00:10:00', 'BHV', 'GBR'),
(36, 'Damiano', 'Caruso', 36, '1987-12-13', '00:00:00', '00:00:00', '1520.00', '2025-03-28', 21, '03:40:00', '00:09:00', 'BHV', 'ITA'),
(37, 'Matej', 'Mohoric', 29, '1994-10-19', '00:00:00', '00:00:00', '1540.00', '2025-03-28', 21, '03:30:00', '00:06:00', 'TEA', 'SLO'),
(38, 'Jan', 'Tratnik', 31, '1992-09-28', '00:00:00', '00:00:00', '1500.00', '2025-03-28', 21, '03:45:00', '00:11:00', 'BHV', 'SLO'),
(39, 'Jack', 'Haig', 33, '1990-12-19', '00:00:00', '00:00:00', '1550.00', '2025-03-28', 21, '03:40:00', '00:08:00', 'BHV', 'AUS'),
(40, 'Mikel', 'Landa', 34, '1989-12-13', '00:00:00', '00:00:00', '1580.00', '2025-03-28', 21, '03:35:00', '00:07:00', 'BHV', 'ESP');

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
CREATE TABLE IF NOT EXISTS `equipe` (
  `num_equipe` varchar(3) NOT NULL,
  `nom_equipe` varchar(100) NOT NULL,
  `gap_tot_sec_equipe` time DEFAULT NULL,
  `num_pays` varchar(3) NOT NULL,
  PRIMARY KEY (`num_equipe`),
  KEY `num_pays` (`num_pays`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `equipe`
--

INSERT INTO `equipe` (`num_equipe`, `nom_equipe`, `gap_tot_sec_equipe`, `num_pays`) VALUES
('AG2', 'AG2R Citroën', NULL, 'FRA'),
('ALP', 'Alpecin-Fenix', NULL, 'BEL'),
('ARK', 'Arkea-Samsic', NULL, 'FRA'),
('AST', 'Astana Qazaqstan Team', NULL, 'KAZ'),
('BHV', 'Bahrain Victorious', NULL, 'BHR'),
('BBH', 'B&B Hotels KTM', NULL, 'FRA'),
('BEX', 'BikeExchange', NULL, 'AUS'),
('BHG', 'Bora-Hansgrohe', NULL, 'DEU'),
('COF', 'Cofidis', NULL, 'FRA'),
('DSM', 'Team DSM', NULL, 'NLD'),
('EFG', 'EF Education-EasyPost', NULL, 'USA'),
('GFD', 'Groupama-FDJ', NULL, 'FRA'),
('IGR', 'Ineos Grenadiers', NULL, 'GBR'),
('IWG', 'Intermarché-Wanty-Gobert Matériaux', NULL, 'BEL'),
('IPT', 'Israël Premier Tech', NULL, 'ISR'),
('JUM', 'Jumbo-Visma', NULL, 'NLD'),
('LSO', 'Lotto Soudal', NULL, 'BEL'),
('MOV', 'Movistar Team', NULL, 'ESP'),
('QSA', 'Quick-Step Alpha Vinyl Team', NULL, 'BEL'),
('TEA', 'TotalEnergies', NULL, 'FRA'),
('TSG', 'Trek-Segafredo', NULL, 'USA'),
('UAE', 'UAE Team Emirates', NULL, 'ARE');

-- --------------------------------------------------------

--
-- Structure de la table `etape`
--

DROP TABLE IF EXISTS `etape`;
CREATE TABLE IF NOT EXISTS `etape` (
  `num_etape` int NOT NULL,
  `date_etape` date NOT NULL,
  `kilometrage_etape` decimal(15,2) NOT NULL,
  `type_etape` varchar(100) NOT NULL,
  `repos_transfert` binary(1) NOT NULL,
  `num_coureur` int NOT NULL,
  `num_ville` int NOT NULL,
  `num_ville_1` int NOT NULL,
  PRIMARY KEY (`num_etape`),
  KEY `num_coureur` (`num_coureur`),
  KEY `num_ville` (`num_ville`),
  KEY `num_ville_1` (`num_ville_1`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `etape`
--

INSERT INTO `etape` (`num_etape`, `date_etape`, `kilometrage_etape`, `type_etape`, `repos_transfert`, `num_coureur`, `num_ville`, `num_ville_1`) VALUES
(1, '2023-07-01', '13.20', 'Contre-la-montre individuel', 0x30, 1, 51, 51),
(2, '2023-07-02', '202.20', 'Classique', 0x30, 2, 52, 53),
(3, '2023-07-03', '182.00', 'Classique', 0x30, 3, 54, 55),
(4, '2023-07-04', '0.00', 'Transfert vers la France', 0x31, 4, 56, 57),
(5, '2023-07-05', '171.50', 'Classique', 0x30, 5, 58, 59),
(6, '2023-07-06', '157.00', 'Classique', 0x30, 6, 60, 61),
(7, '2023-07-07', '219.90', 'Classique', 0x30, 7, 62, 63),
(8, '2023-07-08', '176.30', 'Classique', 0x30, 8, 64, 65),
(9, '2023-07-09', '186.30', 'Classique', 0x30, 9, 66, 67),
(10, '2023-07-10', '192.90', 'Classique', 0x30, 10, 68, 69),
(11, '2023-07-11', '0.00', 'Repos', 0x31, 11, 70, 70),
(12, '2023-07-12', '148.10', 'Classique', 0x30, 12, 71, 72),
(13, '2023-07-13', '151.70', 'Montagne', 0x30, 13, 73, 74),
(14, '2023-07-14', '165.10', 'Montagne', 0x30, 14, 75, 76),
(15, '2023-07-15', '192.60', 'Classique', 0x30, 15, 77, 78),
(16, '2023-07-16', '192.50', 'Classique', 0x30, 16, 79, 80),
(17, '2023-07-17', '202.50', 'Classique', 0x30, 17, 81, 82),
(18, '2023-07-18', '0.00', 'Repos', 0x31, 18, 83, 83),
(19, '2023-07-19', '178.50', 'Montagne', 0x30, 19, 84, 85),
(20, '2023-07-20', '129.70', 'Montagne', 0x30, 20, 86, 87),
(21, '2023-07-21', '143.20', 'Montagne', 0x30, 21, 88, 89),
(22, '2023-07-22', '188.30', 'Classique', 0x30, 22, 90, 91),
(23, '2023-07-23', '40.70', 'Contre-la-montre individuel', 0x30, 23, 92, 93),
(24, '2023-07-24', '115.60', 'Classique', 0x30, 24, 94, 95);

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

DROP TABLE IF EXISTS `participer`;
CREATE TABLE IF NOT EXISTS `participer` (
  `num_etape` int NOT NULL,
  `num_coureur` int NOT NULL,
  `temps_coureur` time NOT NULL,
  `bonification_coureur` time DEFAULT NULL,
  `penalite_coureur` time DEFAULT NULL,
  PRIMARY KEY (`num_etape`,`num_coureur`),
  KEY `num_coureur` (`num_coureur`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `num_pays` varchar(3) NOT NULL,
  `nom_pays` varchar(100) NOT NULL,
  PRIMARY KEY (`num_pays`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`num_pays`, `nom_pays`) VALUES
('ABW', 'Aruba'),
('AFG', 'Afghanistan'),
('AGO', 'Angola'),
('AIA', 'Anguilla'),
('ALA', 'Îles Åland'),
('ALB', 'Albanie'),
('AND', 'Andorre'),
('ANT', 'Antilles Néerlandaises'),
('ARE', 'Émirats Arabes Unis'),
('ARG', 'Argentine'),
('ARM', 'Arménie'),
('ASM', 'Samoa Américaines'),
('ATA', 'Antarctique'),
('ATF', 'Terres Australes Françaises'),
('ATG', 'Antigua-et-Barbuda'),
('AUS', 'Australie'),
('AUT', 'Autriche'),
('AZE', 'Azerbaïdjan'),
('BDI', 'Burundi'),
('BEL', 'Belgique'),
('BEN', 'Bénin'),
('BFA', 'Burkina Faso'),
('BGD', 'Bangladesh'),
('BGR', 'Bulgarie'),
('BHR', 'Bahreïn'),
('BHS', 'Bahamas'),
('BIH', 'Bosnie-Herzégovine'),
('BLR', 'Bélarus'),
('BLZ', 'Belize'),
('BMU', 'Bermudes'),
('BOL', 'Bolivie'),
('BRA', 'Brésil'),
('BRB', 'Barbade'),
('BRN', 'Brunéi Darussalam'),
('BTN', 'Bhoutan'),
('BVT', 'Île Bouvet'),
('BWA', 'Botswana'),
('CAF', 'République Centrafricaine'),
('CAN', 'Canada'),
('CCK', 'Îles Cocos (Keeling)'),
('CHE', 'Suisse'),
('CHL', 'Chili'),
('CHN', 'Chine'),
('CIV', 'Côte Ivoire'),
('CMR', 'Cameroun'),
('COD', 'République Démocratique du Congo'),
('COG', 'République du Congo'),
('COK', 'Îles Cook'),
('COL', 'Colombie'),
('COM', 'Comores'),
('CPV', 'Cap-vert'),
('CRI', 'Costa Rica'),
('CUB', 'Cuba'),
('CXR', 'Île Christmas'),
('CYM', 'Îles Caïmanes'),
('CYP', 'Chypre'),
('CZE', 'République Tchèque'),
('DEU', 'Allemagne'),
('DJI', 'Djibouti'),
('DMA', 'Dominique'),
('DNK', 'Danemark'),
('DOM', 'République Dominicaine'),
('DZA', 'Algérie'),
('ECU', 'Équateur'),
('EGY', 'Égypte'),
('ERI', 'Érythrée'),
('ESH', 'Sahara Occidental'),
('ESP', 'Espagne'),
('EST', 'Estonie'),
('ETH', 'Éthiopie'),
('FIN', 'Finlande'),
('FJI', 'Fidji'),
('FLK', 'Îles (malvinas) Falkland'),
('FRA', 'France'),
('FRO', 'Îles Féroé'),
('FSM', 'États Fédérés de Micronésie'),
('GAB', 'Gabon'),
('GBR', 'Royaume-Uni'),
('GEO', 'Géorgie'),
('GHA', 'Ghana'),
('GIB', 'Gibraltar'),
('GIN', 'Guinée'),
('GLP', 'Guadeloupe'),
('GMB', 'Gambie'),
('GNB', 'Guinée-Bissau'),
('GNQ', 'Guinée Équatoriale'),
('GRC', 'Grèce'),
('GRD', 'Grenade'),
('GRL', 'Groenland'),
('GTM', 'Guatemala'),
('GUF', 'Guyane Française'),
('GUM', 'Guam'),
('GUY', 'Guyana'),
('HKG', 'Hong-Kong'),
('HMD', 'Îles Heard et Mcdonald'),
('HND', 'Honduras'),
('HRV', 'Croatie'),
('HTI', 'Haïti'),
('HUN', 'Hongrie'),
('IDN', 'Indonésie'),
('IMN', 'Île de Man'),
('IND', 'Inde'),
('IOT', 'Territoire Britannique de Océan Indien'),
('IRL', 'Irlande'),
('IRN', 'République Islamique Iran'),
('IRQ', 'Iraq'),
('ISL', 'Islande'),
('ISR', 'Israël'),
('ITA', 'Italie'),
('JAM', 'Jamaïque'),
('JOR', 'Jordanie'),
('JPN', 'Japon'),
('KAZ', 'Kazakhstan'),
('KEN', 'Kenya'),
('KGZ', 'Kirghizistan'),
('KHM', 'Cambodge'),
('KIR', 'Kiribati'),
('KNA', 'Saint-Kitts-et-Nevis'),
('KOR', 'République de Corée'),
('KWT', 'Koweït'),
('LAO', 'République Démocratique Populaire Lao'),
('LBN', 'Liban'),
('LBR', 'Libéria'),
('LBY', 'Jamahiriya Arabe Libyenne'),
('LCA', 'Sainte-Lucie'),
('LIE', 'Liechtenstein'),
('LKA', 'Sri Lanka'),
('LSO', 'Lesotho'),
('LTU', 'Lituanie'),
('LUX', 'Luxembourg'),
('LVA', 'Lettonie'),
('MAC', 'Macao'),
('MAR', 'Maroc'),
('MCO', 'Monaco'),
('MDA', 'République de Moldova'),
('MDG', 'Madagascar'),
('MDV', 'Maldives'),
('MEX', 'Mexique'),
('MHL', 'Îles Marshall'),
('MKD', 'ex-République Yougoslave de Macédoine'),
('MLI', 'Mali'),
('MLT', 'Malte'),
('MMR', 'Myanmar'),
('MNG', 'Mongolie'),
('MNP', 'Îles Mariannes du Nord'),
('MOZ', 'Mozambique'),
('MRT', 'Mauritanie'),
('MSR', 'Montserrat'),
('MTQ', 'Martinique'),
('MUS', 'Maurice'),
('MWI', 'Malawi'),
('MYS', 'Malaisie'),
('MYT', 'Mayotte'),
('NAM', 'Namibie'),
('NCL', 'Nouvelle-Calédonie'),
('NER', 'Niger'),
('NFK', 'Île Norfolk'),
('NGA', 'Nigéria'),
('NIC', 'Nicaragua'),
('NIU', 'Niué'),
('NLD', 'Pays-Bas'),
('NOR', 'Norvège'),
('NPL', 'Népal'),
('NRU', 'Nauru'),
('NZL', 'Nouvelle-Zélande'),
('OMN', 'Oman'),
('PAK', 'Pakistan'),
('PAN', 'Panama'),
('PCN', 'Pitcairn'),
('PER', 'Pérou'),
('PHL', 'Philippines'),
('PLW', 'Palaos'),
('PNG', 'Papouasie-Nouvelle-Guinée'),
('POL', 'Pologne'),
('PRI', 'Porto Rico'),
('PRK', 'République Populaire Démocratique de Corée'),
('PRT', 'Portugal'),
('PRY', 'Paraguay'),
('PSE', 'Territoire Palestinien Occupé'),
('PYF', 'Polynésie Française'),
('QAT', 'Qatar'),
('REU', 'Réunion'),
('ROU', 'Roumanie'),
('RUS', 'Fédération de Russie'),
('RWA', 'Rwanda'),
('SAU', 'Arabie Saoudite'),
('SCG', 'Serbie-et-Monténégro'),
('SDN', 'Soudan'),
('SEN', 'Sénégal'),
('SGP', 'Singapour'),
('SGS', 'Géorgie du Sud et les Îles Sandwich du Sud'),
('SHN', 'Sainte-Hélène'),
('SJM', 'Svalbard etÎle Jan Mayen'),
('SLB', 'Îles Salomon'),
('SLE', 'Sierra Leone'),
('SLV', 'El Salvador'),
('SMR', 'Saint-Marin'),
('SOM', 'Somalie'),
('SPM', 'Saint-Pierre-et-Miquelon'),
('STP', 'Sao Tomé-et-Principe'),
('SUR', 'Suriname'),
('SVK', 'Slovaquie'),
('SVN', 'Slovénie'),
('SWE', 'Suède'),
('SWZ', 'Swaziland'),
('SYC', 'Seychelles'),
('SYR', 'République Arabe Syrienne'),
('TCA', 'Îles Turks et Caïques'),
('TCD', 'Tchad'),
('TGO', 'Togo'),
('THA', 'Thaïlande'),
('TJK', 'Tadjikistan'),
('TKL', 'Tokelau'),
('TKM', 'Turkménistan'),
('TLS', 'Timor-Leste'),
('TON', 'Tonga'),
('TTO', 'Trinité-et-Tobago');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `num_ville` int NOT NULL,
  `nom_ville` varchar(100) NOT NULL,
  `num_pays` varchar(3) NOT NULL,
  PRIMARY KEY (`num_ville`),
  KEY `num_pays` (`num_pays`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`num_ville`, `nom_ville`, `num_pays`) VALUES
(1, 'Oranjestad', 'ABW'),
(2, 'Kabul', 'AFG'),
(3, 'Luanda', 'AGO'),
(4, 'The Valley', 'AIA'),
(5, 'Mariehamn', 'ALA'),
(6, 'Tirana', 'ALB'),
(7, 'Andorre-la-Vieille', 'AND'),
(8, 'Willemstad', 'ANT'),
(9, 'Abu Dhabi', 'ARE'),
(10, 'Buenos Aires', 'ARG'),
(11, 'Yerevan', 'ARM'),
(12, 'Pago Pago', 'ASM'),
(13, 'Antarctica', 'ATA'),
(14, 'Port-aux-Français', 'ATF'),
(15, 'Saint Johns', 'ATG'),
(16, 'Sydney', 'AUS'),
(17, 'Vienne', 'AUT'),
(18, 'Bakou', 'AZE'),
(19, 'Bujumbura', 'BDI'),
(20, 'Bruxelles', 'BEL'),
(21, 'Porto-Novo', 'BEN'),
(22, 'Ouagadougou', 'BFA'),
(23, 'Dhaka', 'BGD'),
(24, 'Sofia', 'BGR'),
(25, 'Manama', 'BHR'),
(26, 'Nassau', 'BHS'),
(27, 'Sarajevo', 'BIH'),
(28, 'Minsk', 'BLR'),
(29, 'Belmopan', 'BLZ'),
(30, 'Hamilton', 'BMU'),
(31, 'La Paz', 'BOL'),
(32, 'Brasília', 'BRA'),
(33, 'Bridgetown', 'BRB'),
(34, 'Bandar Seri Begawan', 'BRN'),
(35, 'Thimphu', 'BTN'),
(36, 'Longyearbyen', 'BVT'),
(37, 'Gaborone', 'BWA'),
(38, 'Bangui', 'CAF'),
(39, 'Ottawa', 'CAN'),
(40, 'West Island', 'CCK'),
(41, 'Berne', 'CHE'),
(42, 'Santiago', 'CHL'),
(43, 'Pékin', 'CHN'),
(44, 'Yamoussoukro', 'CIV'),
(45, 'Yaoundé', 'CMR'),
(46, 'Kinshasa', 'COD'),
(47, 'Brazzaville', 'COG'),
(48, 'Avarua', 'COK'),
(49, 'Bogotá', 'COL'),
(50, 'Moroni', 'COM'),
(51, 'Praia', 'CPV'),
(52, 'San José', 'CRI'),
(53, 'La Havane', 'CUB'),
(54, 'Flying Fish Cove', 'CXR'),
(55, 'George Town', 'CYM'),
(56, 'Nicosie', 'CYP'),
(57, 'Prague', 'CZE'),
(58, 'Berlin', 'DEU'),
(59, 'Djibouti', 'DJI'),
(60, 'Roseau', 'DMA'),
(61, 'Copenhague', 'DNK'),
(62, 'Saint-Domingue', 'DOM'),
(63, 'Alger', 'DZA'),
(64, 'Quito', 'ECU'),
(65, 'Le Caire', 'EGY'),
(66, 'Asmara', 'ERI'),
(67, 'El Aaiún', 'ESH'),
(68, 'Madrid', 'ESP'),
(69, 'Tallinn', 'EST'),
(70, 'Addis-Abeba', 'ETH'),
(71, 'Helsinki', 'FIN'),
(72, 'Suva', 'FJI'),
(73, 'Stanley', 'FLK'),
(74, 'Paris', 'FRA'),
(75, 'Tórshavn', 'FRO'),
(76, 'Palikir', 'FSM'),
(77, 'Libreville', 'GAB'),
(78, 'Londres', 'GBR'),
(79, 'Tbilissi', 'GEO'),
(80, 'Accra', 'GHA'),
(81, 'Gibraltar', 'GIB'),
(82, 'Conakry', 'GIN'),
(83, 'Basse-Terre', 'GLP'),
(84, 'Banjul', 'GMB'),
(85, 'Bissau', 'GNB'),
(86, 'Malabo', 'GNQ'),
(87, 'Athènes', 'GRC'),
(88, 'Saint-Georges', 'GRD'),
(89, 'Nuuk', 'GRL'),
(90, 'Guatemala', 'GTM'),
(91, 'Cayenne', 'GUF'),
(92, 'Hagåtña', 'GUM'),
(93, 'Georgetown', 'GUY'),
(94, 'Hong Kong', 'HKG'),
(95, 'Heard Island', 'HMD'),
(96, 'Tegucigalpa', 'HND'),
(97, 'Zagreb', 'HRV'),
(98, 'Port-au-Prince', 'HTI'),
(99, 'Budapest', 'HUN'),
(100, 'Jakarta', 'IDN');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
