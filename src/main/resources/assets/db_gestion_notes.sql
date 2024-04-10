-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 07 jan. 2024 à 20:29
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
-- Base de données :  `db_gestion_notes`
--

-- --------------------------------------------------------

--
-- Structure de la table `anneeacademique`
--

CREATE TABLE `anneeacademique` (
  `id` bigint(20) NOT NULL,
  `debut` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `numerodebut` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `parcours_id` bigint(20) DEFAULT NULL,
  `semestre_id` bigint(20) DEFAULT NULL,
  `typecours_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Structure de la table `cycle`
--

CREATE TABLE `cycle` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `diplomeen` varchar(255) DEFAULT NULL,
  `diplomefr` varchar(255) DEFAULT NULL,
  `estaffichable` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `genre` int(11) DEFAULT NULL,
  `lieudenaissance` varchar(255) DEFAULT NULL,
  `matricule` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `numerotelephone` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `valide` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `datedenaissance`, `email`, `genre`, `lieudenaissance`, `matricule`, `nom`, `numerotelephone`, `region`, `valide`) VALUES
(1, '2023-12-05', 'koire-dev@gmail.com', 1, 'bogo', '17Y4fP', 'Koiranga Alioum', '691093443', 'Extreme Nord', b'0'),
(2, '2022-12-05', 'issa-dev@gmail.com', 1, 'ngaoundere', '21D0785', 'DOMPET issa', '691093443', 'Adamaoua', b'0');

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE `evaluation` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isexam` bit(1) DEFAULT NULL,
  `pourcentage` int(11) DEFAULT NULL,
  `typecours_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `intitule` varchar(255) DEFAULT NULL,
  `natureue` tinyint(4) DEFAULT NULL,
  `cours_id` bigint(20) DEFAULT NULL,
  `credit_id` bigint(20) DEFAULT NULL,
  `semestre_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Structure de la table `option`
--

CREATE TABLE `option` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `descriptionenglish` varchar(255) DEFAULT NULL,
  `descriptionfrench` varchar(255) DEFAULT NULL,
  `departement_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `parcours`
--

CREATE TABLE `parcours` (
  `id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `niveau_id` bigint(20) DEFAULT NULL,
  `option_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1);

-- --------------------------------------------------------

--
-- Structure de la table `typecours`
--

CREATE TABLE `typecours` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD KEY `FKjfw1u8dpqs0hnps32gk5cjnno` (`parcours_id`),
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
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cycle`
--
ALTER TABLE `cycle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_k43tb8sntc046yxf4suq076os` (`code`),
  ADD UNIQUE KEY `UK_sb5vy4xu0vu6ud7p1r8ypjj9x` (`diplomeen`),
  ADD UNIQUE KEY `UK_4b2w3kgkrcrd34q8eod06x064` (`diplomefr`);

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
  ADD KEY `FK8m54mqmvegi9kk7ntg29wo75c` (`typecours_id`);

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
  ADD KEY `FKbdiehr0psb5d6ud9vfeunuea5` (`credit_id`),
  ADD KEY `FKoeiw5u717c5epg1pc84su1dqb` (`semestre_id`);

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
  ADD UNIQUE KEY `UNQ_NOTE_0` (`etudiant_id`,`anneeacademique_id`,`cours_id`,`module_id`,`evaluation_id`,`isfinal`),
  ADD KEY `FK3shvvemap65cfd1qhf0wyk1te` (`anneeacademique_id`),
  ADD KEY `FKsf5myxjpqttww07ynmy2hl6uu` (`cours_id`),
  ADD KEY `FK39gnykxuo318ahxlu7rsv8mk2` (`evaluation_id`),
  ADD KEY `FKdrwhvmxd3av5orasqhvdf9vsm` (`module_id`);

--
-- Index pour la table `option`
--
ALTER TABLE `option`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_1g4dt2v9evr1oe4fx4hbbtlsm` (`code`),
  ADD KEY `FKlsf8cg03gwjlqfuxcf7pjfukt` (`departement_id`);

--
-- Index pour la table `parcours`
--
ALTER TABLE `parcours`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_PARCOURS_0` (`niveau_id`,`option_id`),
  ADD KEY `FKndfh609mnmsgkhpsjn8whlyng` (`option_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_fgekt4f4pi0n9ac56ur0qi10l` (`nom`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `anonymat`
--
ALTER TABLE `anonymat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `credit`
--
ALTER TABLE `credit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cycle`
--
ALTER TABLE `cycle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `departement`
--
ALTER TABLE `departement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `evaluation`
--
ALTER TABLE `evaluation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `module`
--
ALTER TABLE `module`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `option`
--
ALTER TABLE `option`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `parcours`
--
ALTER TABLE `parcours`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `programme`
--
ALTER TABLE `programme`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `semestre`
--
ALTER TABLE `semestre`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `typecours`
--
ALTER TABLE `typecours`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `FKjfw1u8dpqs0hnps32gk5cjnno` FOREIGN KEY (`parcours_id`) REFERENCES `parcours` (`id`),
  ADD CONSTRAINT `FKki60vhhbhr91umtahokuq0vb3` FOREIGN KEY (`typecours_id`) REFERENCES `typecours` (`id`),
  ADD CONSTRAINT `FKmftc8yx0stkk5ylob67he1hbl` FOREIGN KEY (`semestre_id`) REFERENCES `semestre` (`id`);

--
-- Contraintes pour la table `cours_enseignant`
--
ALTER TABLE `cours_enseignant`
  ADD CONSTRAINT `FK5vophd6vvia9rbkcbm5mwmiq8` FOREIGN KEY (`enseignants_id`) REFERENCES `enseignant` (`id`),
  ADD CONSTRAINT `FKp41ot8qw4l0l5h6upksh834d4` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`);

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `FK8m54mqmvegi9kk7ntg29wo75c` FOREIGN KEY (`typecours_id`) REFERENCES `typecours` (`id`);

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
  ADD CONSTRAINT `FKbdiehr0psb5d6ud9vfeunuea5` FOREIGN KEY (`credit_id`) REFERENCES `credit` (`id`),
  ADD CONSTRAINT `FKoeiw5u717c5epg1pc84su1dqb` FOREIGN KEY (`semestre_id`) REFERENCES `semestre` (`id`);

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
-- Contraintes pour la table `option`
--
ALTER TABLE `option`
  ADD CONSTRAINT `FKlsf8cg03gwjlqfuxcf7pjfukt` FOREIGN KEY (`departement_id`) REFERENCES `departement` (`id`);

--
-- Contraintes pour la table `parcours`
--
ALTER TABLE `parcours`
  ADD CONSTRAINT `FK613vbnap6gx4a6pr5jp3yaf85` FOREIGN KEY (`niveau_id`) REFERENCES `niveau` (`id`),
  ADD CONSTRAINT `FKndfh609mnmsgkhpsjn8whlyng` FOREIGN KEY (`option_id`) REFERENCES `option` (`id`);

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
