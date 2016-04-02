-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 02 Avril 2016 à 05:58
-- Version du serveur :  5.6.17-log
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `e-learning`
--
CREATE DATABASE IF NOT EXISTS `e-learning` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `e-learning`;

-- --------------------------------------------------------

--
-- Structure de la table `answer`
--

DROP TABLE IF EXISTS `answer`;
CREATE TABLE IF NOT EXISTS `answer` (
  `answer_id` int(100) NOT NULL AUTO_INCREMENT,
  `answer_text` varchar(255) DEFAULT NULL,
  `answer_type` varchar(15) DEFAULT NULL,
  `answer_hint` varchar(255) DEFAULT NULL,
  `question_id` int(100) NOT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `FKAnswer589969` (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `answer`
--

INSERT INTO `answer` (`answer_id`, `answer_text`, `answer_type`, `answer_hint`, `question_id`) VALUES
(1, 'Un compilateur', 'true', 'Un compilateur', 1),
(2, 'Un exécuteur', 'false', 'Un exécuteur', 1),
(3, 'Un transformateur', 'false', 'Un transformateur', 1),
(4, 'Un traducteur', 'false', 'Un traducteur', 1);

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(10) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(50) DEFAULT NULL,
  `news_description` varchar(200) DEFAULT NULL,
  `news_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `notification_id` int(10) NOT NULL AUTO_INCREMENT,
  `notification_text` varchar(255) DEFAULT NULL,
  `notification_status` varchar(50) DEFAULT NULL,
  `user_id` int(100) NOT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `FKNotificati933927` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `question_id` int(100) NOT NULL AUTO_INCREMENT,
  `question_name` varchar(50) DEFAULT NULL,
  `question_description` varchar(255) DEFAULT NULL,
  `id_quizz` int(100) NOT NULL,
  `question_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `FKQuestion304243` (`id_quizz`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `question`
--

INSERT INTO `question` (`question_id`, `question_name`, `question_description`, `id_quizz`, `question_type`) VALUES
(1, 'Compilation', 'Pour transformer un code lisible en code compréhensible par la machine, on utilise :', 1, 'simple');

-- --------------------------------------------------------

--
-- Structure de la table `quizz`
--

DROP TABLE IF EXISTS `quizz`;
CREATE TABLE IF NOT EXISTS `quizz` (
  `id_quizz` int(100) NOT NULL AUTO_INCREMENT,
  `quizz_name` varchar(50) DEFAULT NULL,
  `quiz_level` int(10) DEFAULT NULL,
  `id_skill` int(100) NOT NULL,
  `nbrQuestions` int(100) DEFAULT NULL,
  PRIMARY KEY (`id_quizz`),
  KEY `FKQuizz606553` (`id_skill`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `quizz`
--

INSERT INTO `quizz` (`id_quizz`, `quizz_name`, `quiz_level`, `id_skill`, `nbrQuestions`) VALUES
(1, 'Java Basics', 1, 1, 9);

-- --------------------------------------------------------

--
-- Structure de la table `result`
--

DROP TABLE IF EXISTS `result`;
CREATE TABLE IF NOT EXISTS `result` (
  `result_id` int(100) NOT NULL AUTO_INCREMENT,
  `quizz_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `nbrCorrectAnswers` int(100) DEFAULT NULL,
  `score` decimal(19,0) DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  KEY `FKResult348589` (`quizz_id`),
  KEY `FKResult181400` (`user_id`),
  KEY `FKResult181401` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `skill`
--

DROP TABLE IF EXISTS `skill`;
CREATE TABLE IF NOT EXISTS `skill` (
  `skill_id` int(100) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(50) DEFAULT NULL,
  `skill_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `skill`
--

INSERT INTO `skill` (`skill_id`, `skill_name`, `skill_type`) VALUES
(1, 'Java', 'Desktop'),
(2, 'JavaScript', 'Web'),
(3, 'Microsoft CRM', 'CRM'),
(4, 'AngularJS', 'Web');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `lastName` varchar(40) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` varchar(15) NOT NULL,
  `image` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`user_id`, `name`, `lastName`, `login`, `password`, `email`, `phone`, `birthdate`, `gender`, `image`, `level`) VALUES
(1, 'Malek', 'EL KAMEL', 'elkamel', '123456', 'elkamel_malek@hotmail.fr', '+14389892907', '1988-07-30', 'Malek', 'images/malek.jpg', '0'),
(10, 'alek', 'Kamel', 'malek', 'jdhfsdj', 'elkael_maek@hotmail.fr', '4387658803', '1988-07-30', 'male', '', '0'),
(11, 'malek', 'EL KAMEL', 'elkamel', 'mmmalek', 'elkamel_malek@hotmail.fr', '55555', '1988-07-30', 'male', '', '0'),
(12, 'ezez', 'zez', 'eze', 'ezez', 'zeze@gmail.com', 'eze', '2016-03-03', 'male', '', '0');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `FKAnswer589969` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`);

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `FKNotificati933927` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FKQuestion304243` FOREIGN KEY (`id_quizz`) REFERENCES `quizz` (`id_quizz`);

--
-- Contraintes pour la table `quizz`
--
ALTER TABLE `quizz`
  ADD CONSTRAINT `FKQuizz606553` FOREIGN KEY (`id_skill`) REFERENCES `skill` (`skill_id`);

--
-- Contraintes pour la table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `FKResult181401` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKResult181400` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKResult348589` FOREIGN KEY (`quizz_id`) REFERENCES `quizz` (`id_quizz`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
