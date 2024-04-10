-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 05 fév. 2024 à 17:23
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `note`
--

-- --------------------------------------------------------

--
-- Structure de la table `anneeacademique`
--

CREATE TABLE `anneeacademique` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `debut` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `numerodebut` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `anneeacademique`
--

INSERT INTO `anneeacademique` (`id`, `code`, `debut`, `fin`, `numerodebut`) VALUES
(1, '2022-2023', '2022-01-12', '2023-01-12', 2022);

-- --------------------------------------------------------

--
-- Structure de la table `anonymat`
--

CREATE TABLE `anonymat` (
  `id` bigint(20) NOT NULL,
  `sessions` int(11) DEFAULT NULL,
  `valeur` varchar(255) DEFAULT NULL,
  `anneeacademique_id` bigint(20) DEFAULT NULL,
  `cours_id` bigint(20) DEFAULT NULL,
  `etudiant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `anonymat`
--

INSERT INTO `anonymat` (`id`, `sessions`, `valeur`, `anneeacademique_id`, `cours_id`, `etudiant_id`) VALUES
(115, 1, 'INF211124_4', 1, 1, 12),
(116, 1, 'INF211124_6', 1, 1, 7),
(117, 1, 'INF211124_1', 1, 1, 6),
(118, 1, 'INF211124_3', 1, 1, 8),
(119, 1, 'INF211124_5', 1, 1, 9),
(120, 1, 'INF211124_8', 1, 1, 5),
(121, 1, 'INF211124_7', 1, 1, 10),
(122, 1, 'INF211124_9', 1, 1, 11),
(123, 1, 'INF211124_10', 1, 1, 13);

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `intitule` varchar(255) DEFAULT NULL,
  `natureue` tinyint(4) DEFAULT NULL,
  `credit_id` bigint(20) DEFAULT NULL,
  `departement_id` bigint(20) DEFAULT NULL,
  `semestre_id` bigint(20) DEFAULT NULL,
  `typecours_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `code`, `intitule`, `natureue`, `credit_id`, `departement_id`, `semestre_id`, `typecours_id`) VALUES
(1, 'INF211', 'Algorithmique', 1, 2, 1, 41, 1),
(2, 'INF221', 'Machine Learning', 1, 2, 1, 41, 1),
(3, 'INF232', 'Calcul Parallele et systeme distribue', 1, 2, 1, 42, 2),
(4, 'INF241', 'Mathematique', 0, 2, 1, 41, 1);

-- --------------------------------------------------------

--
-- Structure de la table `cours_enseignant`
--

CREATE TABLE `cours_enseignant` (
  `cours_id` bigint(20) NOT NULL,
  `enseignants_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `credit`
--

CREATE TABLE `credit` (
  `id` bigint(20) NOT NULL,
  `valeur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `credit`
--

INSERT INTO `credit` (`id`, `valeur`) VALUES
(1, 3),
(2, 6);

-- --------------------------------------------------------

--
-- Structure de la table `cycle`
--

CREATE TABLE `cycle` (
  `id` bigint(20) NOT NULL,
  `estaffichable` bit(1) DEFAULT NULL,
  `valeur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cycle`
--

INSERT INTO `cycle` (`id`, `estaffichable`, `valeur`) VALUES
(1, NULL, 1),
(2, NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `englishdescription` varchar(255) DEFAULT NULL,
  `frenchdescription` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`id`, `code`, `englishdescription`, `frenchdescription`) VALUES
(1, 'INF', 'Computer science', 'Informatique'),
(2, 'GC', 'Civil engenire', 'Genie civil');

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` bigint(20) NOT NULL,
  `datedenaissance` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `genre` tinyint(4) DEFAULT NULL,
  `lieudenaissance` varchar(255) DEFAULT NULL,
  `matricule` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `numerotelephone` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `valide` bit(1) DEFAULT NULL,
  `valideall` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `datedenaissance`, `email`, `genre`, `lieudenaissance`, `matricule`, `nom`, `numerotelephone`, `region`, `type`, `valide`, `valideall`) VALUES
(1, '1997-03-26', 'koire@gmail.com', 0, 'Bogo', '24Y001EB', 'koire', '698192286', 'Extreme-nord', 0, b'0', b'0'),
(2, '1997-03-26', 'abdel@gmail.com', 0, 'Ndere', '24Y002EB', 'Abdel', '698192286', 'Extreme-nord', 0, b'0', b'0'),
(3, '1997-03-26', 'yves@gmail.com', 0, 'Mokolo', '24Y003EB', 'Yves', '698192286', 'Extreme-nord', 0, b'0', b'0'),
(4, '1997-03-26', 'issa@gmail.com', 0, 'Ndere', '24Y004EB', 'Issa', '698192286', 'Extreme-nord', 1, b'0', b'0'),
(5, '2070-11-14', 'h@gmail.com', 0, 'Yaoundé', '22R2241B', 'MONTHE TSOBENG MARLEINE', '6927657889', 'NORD', NULL, b'0', b'0'),
(6, '2063-09-12', 'a@gmail.com', 0, 'YOKADOUMA', '19A136EB', 'AKWA YDENNE FALLONE', '692656577', 'ADAMAOUA', NULL, b'0', b'0'),
(7, '2064-10-13', 'f@gmail.com', 1, 'DJELENG', '19A228EB', 'DEUDJUI MALIEUGOUE LETICIA MERVEILLE', '6980088', 'CENTRE', NULL, b'0', b'0'),
(8, '2063-09-13', 'c@gmail.com', 1, 'YANLI', '19A139EB', 'WAMBAPO KARIN LOIC', '679889987', 'EXTREME-NORD', NULL, b'0', b'0'),
(9, '2063-09-14', 'e@gmail.com', 1, 'BERTOUA', '19A146EB', 'AKWA YDENNE FALLONE', '678098890', 'CENTRE', NULL, b'0', b'0'),
(10, '2068-09-14', 'g@gmail.com', 0, 'Yaoundé', '19A229EB', 'DILI TESSYAKRE', '622332233', 'SUD', NULL, b'0', b'0'),
(11, '2063-09-16', 'i@gmail.com', 1, 'BAGOALE', '22R2291B', 'NAYO TONKEU FABRICE DUFFRANC', '676767878', 'OUEST', NULL, b'0', b'0'),
(12, '2065-07-13', 'd@gmail.com', 0, 'DSCHANG', '19A145EB', 'WANKO MAGAPTCHE ZACHARIE', '653787869', 'CENTRE', NULL, b'0', b'0'),
(13, '2066-10-14', 'j@gmail.com', 1, 'BAFOUSSAM', '22R2326B', 'WANKO MAGAPTCHE ZACHARIE', '698988989', 'EST', NULL, b'0', b'0');

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE `evaluation` (
  `id` bigint(20) NOT NULL,
  `code` tinyint(4) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isexam` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `evaluation`
--

INSERT INTO `evaluation` (`id`, `code`, `description`, `isexam`) VALUES
(1, 0, 'Contrôle continu', b'0'),
(2, 1, 'Travail personnel de l\'étudiant', b'0'),
(3, 2, 'Travaux pratiques', b'0'),
(4, 3, 'Examen', b'1');

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription` (
  `id` bigint(20) NOT NULL,
  `anneeacademique_id` bigint(20) DEFAULT NULL,
  `etudiant_id` bigint(20) DEFAULT NULL,
  `parcours_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`id`, `anneeacademique_id`, `etudiant_id`, `parcours_id`) VALUES
(1, 1, 1, 4),
(2, 1, 2, 4),
(3, 1, 3, 9),
(4, 1, 4, 9),
(12, 1, 5, 1),
(9, 1, 6, 1),
(6, 1, 7, 1),
(7, 1, 8, 1),
(5, 1, 9, 1),
(11, 1, 10, 1),
(13, 1, 11, 1),
(8, 1, 12, 1),
(14, 1, 13, 1);

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `intitule` varchar(255) DEFAULT NULL,
  `cours_id` bigint(20) DEFAULT NULL,
  `credit_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id`, `code`, `intitule`, `cours_id`, `credit_id`) VALUES
(1, 'INF232_1', 'Calcul Parallele', 3, 1),
(2, 'INF232_2', 'Systeme distribue', 3, 1),
(3, 'INF241_1', 'Mathematique', 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE `niveau` (
  `id` bigint(20) NOT NULL,
  `terminal` bit(1) DEFAULT NULL,
  `valeur` int(11) DEFAULT NULL,
  `cycle_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`id`, `terminal`, `valeur`, `cycle_id`) VALUES
(1, b'0', 1, 1),
(2, b'0', 2, 1),
(3, b'1', 3, 1),
(4, b'0', 4, 2),
(5, b'1', 5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `id` bigint(20) NOT NULL,
  `isfinal` bit(1) DEFAULT NULL,
  `sessions` int(11) DEFAULT NULL,
  `valeur` double DEFAULT NULL,
  `anneeacademique_id` bigint(20) DEFAULT NULL,
  `cours_id` bigint(20) DEFAULT NULL,
  `etudiant_id` bigint(20) DEFAULT NULL,
  `evaluation_id` bigint(20) DEFAULT NULL,
  `module_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`id`, `isfinal`, `sessions`, `valeur`, `anneeacademique_id`, `cours_id`, `etudiant_id`, `evaluation_id`, `module_id`) VALUES
(345, b'1', 1, 1, 1, 1, 10, 4, 1),
(346, b'1', 1, 1, 1, 1, 7, 4, 1),
(347, b'1', 1, 1, 1, 1, 6, 4, 1),
(348, b'1', 1, 1, 1, 1, 12, 4, 1),
(349, b'1', 1, 1, 1, 1, 8, 4, 1),
(350, b'1', 1, 1, 1, 1, 9, 4, 1),
(351, b'1', 1, 1, 1, 1, 5, 4, 1),
(352, b'1', 1, 1, 1, 1, 11, 4, 1),
(353, b'1', 1, 1, 1, 1, 13, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `descriptionenglish` varchar(255) DEFAULT NULL,
  `descriptionfrench` varchar(255) DEFAULT NULL,
  `departement_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `options`
--

INSERT INTO `options` (`id`, `code`, `descriptionenglish`, `descriptionfrench`, `departement_id`) VALUES
(1, 'GELO', 'ASDASD', 'ASDASD', 1),
(2, 'DATA', 'ASDASD', 'ASDASDAS', 1);

-- --------------------------------------------------------

--
-- Structure de la table `parcours`
--

CREATE TABLE `parcours` (
  `id` bigint(20) NOT NULL,
  `label` varchar(255) NOT NULL,
  `niveau_id` bigint(20) DEFAULT NULL,
  `options_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `parcours`
--

INSERT INTO `parcours` (`id`, `label`, `niveau_id`, `options_id`) VALUES
(1, 'GELO 1', 1, 1),
(2, 'GELO 2', 2, 1),
(3, 'GELO 3', 3, 1),
(4, 'GELO 4', 4, 1),
(5, 'GELO 5', 5, 1),
(6, 'DATA 1', 1, 2),
(7, 'DATA 2', 2, 2),
(8, 'DATA 3', 3, 2),
(9, 'DATA 4', 4, 2),
(10, 'DATA 5', 5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `programme`
--

CREATE TABLE `programme` (
  `id` bigint(20) NOT NULL,
  `anneeacademique_id` bigint(20) DEFAULT NULL,
  `cours_id` bigint(20) DEFAULT NULL,
  `parcours_id` bigint(20) DEFAULT NULL,
  `semestre_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `semestre`
--

CREATE TABLE `semestre` (
  `id` bigint(20) NOT NULL,
  `valeur` int(11) DEFAULT NULL,
  `niveau_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `semestre`
--

INSERT INTO `semestre` (`id`, `valeur`, `niveau_id`) VALUES
(41, 1, 2),
(42, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `expired` bit(1) NOT NULL,
  `revoked` bit(1) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_type` enum('BEARER') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `token_seq`
--

CREATE TABLE `token_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `token_seq`
--

INSERT INTO `token_seq` (`next_val`) VALUES
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Structure de la table `typecours`
--

CREATE TABLE `typecours` (
  `id` bigint(20) NOT NULL,
  `nom` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `typecours`
--

INSERT INTO `typecours` (`id`, `nom`) VALUES
(1, 0),
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN','MANAGER','USER') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user_seq`
--

CREATE TABLE `user_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_seq`
--

INSERT INTO `user_seq` (`next_val`) VALUES
(1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `anneeacademique`
--
ALTER TABLE `anneeacademique`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_enkw9321fvpnpxmlf17cwvafq` (`code`),
  ADD UNIQUE KEY `UK_7tklyl527gl3fn8vtmiw8898n` (`numerodebut`);

--
-- Index pour la table `anonymat`
--
ALTER TABLE `anonymat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ETUDIANT_ID` (`anneeacademique_id`,`etudiant_id`,`cours_id`,`sessions`),
  ADD UNIQUE KEY `UNQ_ANONYMAT_0` (`valeur`,`cours_id`,`anneeacademique_id`,`sessions`),
  ADD UNIQUE KEY `UK_kn0djebphrl2tfyqi0v2bwo3n` (`valeur`),
  ADD KEY `FKeqxr9mabo6f34m31bwgykf3uc` (`cours_id`),
  ADD KEY `FKc3f1o3498cvp26nul5d7djvyu` (`etudiant_id`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_8p1iiglxragmfs464ypmxr5tu` (`code`),
  ADD KEY `FKeq26l1qnb2geo6f73nvkxijab` (`credit_id`),
  ADD KEY `FK5rqmpee0eoncia0rpvkya4sov` (`departement_id`),
  ADD KEY `FKmftc8yx0stkk5ylob67he1hbl` (`semestre_id`),
  ADD KEY `FKki60vhhbhr91umtahokuq0vb3` (`typecours_id`);

--
-- Index pour la table `cours_enseignant`
--
ALTER TABLE `cours_enseignant`
  ADD KEY `FK5vophd6vvia9rbkcbm5mwmiq8` (`enseignants_id`),
  ADD KEY `FKp41ot8qw4l0l5h6upksh834d4` (`cours_id`);

--
-- Index pour la table `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ccks8w628gfeb3irdyahse774` (`valeur`);

--
-- Index pour la table `cycle`
--
ALTER TABLE `cycle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_28sclcgdhki5c95kn2otnyxhu` (`valeur`);

--
-- Index pour la table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_380tegi44l53vm5r47q7engrd` (`code`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_fp3fcjv6jy2jsx19iq4cpd5p7` (`email`),
  ADD UNIQUE KEY `UK_tn2q9dbx4m888c3xgvxt7bt58` (`matricule`);

--
-- Index pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_rt41qpv52atnvtqnbqxxkechs` (`code`);

--
-- Index pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_INSCRIPTION_0` (`etudiant_id`,`anneeacademique_id`,`parcours_id`),
  ADD KEY `FKitc7n0baw0jur4axjrnan64qp` (`anneeacademique_id`),
  ADD KEY `FKkwmods54j5idk2dnrnqv49ixa` (`parcours_id`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_9qaixsio9hf45jrggg162k118` (`code`),
  ADD KEY `FK69d069oakyaa4spliqfh09l6l` (`cours_id`),
  ADD KEY `FKbdiehr0psb5d6ud9vfeunuea5` (`credit_id`);

--
-- Index pour la table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_fh3vnh27moohboc5b8bg872th` (`valeur`),
  ADD KEY `FK1gpf6vji6by6igrnjbvrs9wkp` (`cycle_id`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_NOTE_0` (`etudiant_id`,`anneeacademique_id`,`cours_id`,`module_id`,`evaluation_id`,`isfinal`,`sessions`),
  ADD KEY `FK3shvvemap65cfd1qhf0wyk1te` (`anneeacademique_id`),
  ADD KEY `FKsf5myxjpqttww07ynmy2hl6uu` (`cours_id`),
  ADD KEY `FK39gnykxuo318ahxlu7rsv8mk2` (`evaluation_id`),
  ADD KEY `FKdrwhvmxd3av5orasqhvdf9vsm` (`module_id`);

--
-- Index pour la table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_2c558xo8cevj8jq7yql1khciy` (`code`),
  ADD KEY `FKdriyok46mwe5ja4i1jrhuj2a4` (`departement_id`);

--
-- Index pour la table `parcours`
--
ALTER TABLE `parcours`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_PARCOURS_0` (`niveau_id`,`options_id`),
  ADD KEY `options_id` (`options_id`);

--
-- Index pour la table `programme`
--
ALTER TABLE `programme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_PROGRAMME_0` (`semestre_id`,`anneeacademique_id`,`parcours_id`,`cours_id`),
  ADD KEY `FK2owtfgo510ytaw6sfjh1i9rq8` (`anneeacademique_id`),
  ADD KEY `FKr7ycs6cglr2gocf7arhky74km` (`cours_id`),
  ADD KEY `FKcjpip5ubl99r0lqcljispa7gw` (`parcours_id`);

--
-- Index pour la table `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_lm7m1sp89yejg19ilcs215lhi` (`valeur`),
  ADD KEY `FKj46pckguhydlj980jvtynw54s` (`niveau_id`);

--
-- Index pour la table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_pddrhgwxnms2aceeku9s2ewy5` (`token`),
  ADD KEY `FKe32ek7ixanakfqsdaokm4q9y2` (`user_id`);

--
-- Index pour la table `typecours`
--
ALTER TABLE `typecours`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `anneeacademique`
--
ALTER TABLE `anneeacademique`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `anonymat`
--
ALTER TABLE `anonymat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `credit`
--
ALTER TABLE `credit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `cycle`
--
ALTER TABLE `cycle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `departement`
--
ALTER TABLE `departement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT pour la table `evaluation`
--
ALTER TABLE `evaluation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `module`
--
ALTER TABLE `module`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=354;

--
-- AUTO_INCREMENT pour la table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `parcours`
--
ALTER TABLE `parcours`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `programme`
--
ALTER TABLE `programme`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `semestre`
--
ALTER TABLE `semestre`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `typecours`
--
ALTER TABLE `typecours`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `anonymat`
--
ALTER TABLE `anonymat`
  ADD CONSTRAINT `FKc3f1o3498cvp26nul5d7djvyu` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `FKeqxr9mabo6f34m31bwgykf3uc` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `FKpdarglodhtcup0hyspb5sjm7k` FOREIGN KEY (`anneeacademique_id`) REFERENCES `anneeacademique` (`id`);

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `FK5rqmpee0eoncia0rpvkya4sov` FOREIGN KEY (`departement_id`) REFERENCES `departement` (`id`),
  ADD CONSTRAINT `FKeq26l1qnb2geo6f73nvkxijab` FOREIGN KEY (`credit_id`) REFERENCES `credit` (`id`),
  ADD CONSTRAINT `FKki60vhhbhr91umtahokuq0vb3` FOREIGN KEY (`typecours_id`) REFERENCES `typecours` (`id`),
  ADD CONSTRAINT `FKmftc8yx0stkk5ylob67he1hbl` FOREIGN KEY (`semestre_id`) REFERENCES `semestre` (`id`);

--
-- Contraintes pour la table `cours_enseignant`
--
ALTER TABLE `cours_enseignant`
  ADD CONSTRAINT `FK5vophd6vvia9rbkcbm5mwmiq8` FOREIGN KEY (`enseignants_id`) REFERENCES `enseignant` (`id`),
  ADD CONSTRAINT `FKp41ot8qw4l0l5h6upksh834d4` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`);

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `FK7u3x7n97xw83vfemi95yu7oev` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `FKitc7n0baw0jur4axjrnan64qp` FOREIGN KEY (`anneeacademique_id`) REFERENCES `anneeacademique` (`id`),
  ADD CONSTRAINT `FKkwmods54j5idk2dnrnqv49ixa` FOREIGN KEY (`parcours_id`) REFERENCES `parcours` (`id`);

--
-- Contraintes pour la table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `FK69d069oakyaa4spliqfh09l6l` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `FKbdiehr0psb5d6ud9vfeunuea5` FOREIGN KEY (`credit_id`) REFERENCES `credit` (`id`);

--
-- Contraintes pour la table `niveau`
--
ALTER TABLE `niveau`
  ADD CONSTRAINT `FK1gpf6vji6by6igrnjbvrs9wkp` FOREIGN KEY (`cycle_id`) REFERENCES `cycle` (`id`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `FK39gnykxuo318ahxlu7rsv8mk2` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluation` (`id`),
  ADD CONSTRAINT `FK3shvvemap65cfd1qhf0wyk1te` FOREIGN KEY (`anneeacademique_id`) REFERENCES `anneeacademique` (`id`),
  ADD CONSTRAINT `FKa0grwvkovx022s73a9p9mjhmp` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `FKdrwhvmxd3av5orasqhvdf9vsm` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`),
  ADD CONSTRAINT `FKsf5myxjpqttww07ynmy2hl6uu` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`);

--
-- Contraintes pour la table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `FKdriyok46mwe5ja4i1jrhuj2a4` FOREIGN KEY (`departement_id`) REFERENCES `departement` (`id`);

--
-- Contraintes pour la table `parcours`
--
ALTER TABLE `parcours`
  ADD CONSTRAINT `niveau_id` FOREIGN KEY (`niveau_id`) REFERENCES `niveau` (`id`),
  ADD CONSTRAINT `options_id` FOREIGN KEY (`options_id`) REFERENCES `options` (`id`);

--
-- Contraintes pour la table `programme`
--
ALTER TABLE `programme`
  ADD CONSTRAINT `FK2owtfgo510ytaw6sfjh1i9rq8` FOREIGN KEY (`anneeacademique_id`) REFERENCES `anneeacademique` (`id`),
  ADD CONSTRAINT `FK8aeth0byoan2n1u59d0y8x5nt` FOREIGN KEY (`semestre_id`) REFERENCES `semestre` (`id`),
  ADD CONSTRAINT `FKcjpip5ubl99r0lqcljispa7gw` FOREIGN KEY (`parcours_id`) REFERENCES `parcours` (`id`),
  ADD CONSTRAINT `FKr7ycs6cglr2gocf7arhky74km` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`);

--
-- Contraintes pour la table `semestre`
--
ALTER TABLE `semestre`
  ADD CONSTRAINT `FKj46pckguhydlj980jvtynw54s` FOREIGN KEY (`niveau_id`) REFERENCES `niveau` (`id`);

--
-- Contraintes pour la table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `FKe32ek7ixanakfqsdaokm4q9y2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
