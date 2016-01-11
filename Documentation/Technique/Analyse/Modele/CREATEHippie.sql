-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema yolaine_hipdev
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema yolaine_hipdev
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `yolaine_hipdev` DEFAULT CHARACTER SET utf8 ;
USE `yolaine_hipdev` ;

-- -----------------------------------------------------
-- Table `yolaine_hipdev`.`type_rue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yolaine_hipdev`.`type_rue` ;

CREATE TABLE IF NOT EXISTS `yolaine_hipdev`.`type_rue` (
  `type_rue_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'Nombre unique pour chaque type de localisation.',
  `description_type_rue` VARCHAR(15) NULL DEFAULT NULL COMMENT 'Indique le nom pour chaque nombre unique de type_rue_id.',
  PRIMARY KEY (`type_rue_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table permettant de donner un nom précis pour une localisation.';

CREATE UNIQUE INDEX `type_rue_id_UNIQUE` ON `yolaine_hipdev`.`type_rue` (`type_rue_id` ASC);


-- -----------------------------------------------------
-- Table `yolaine_hipdev`.`adresse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yolaine_hipdev`.`adresse` ;

CREATE TABLE IF NOT EXISTS `yolaine_hipdev`.`adresse` (
  `adresse_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'Numéro unique pour chaque adresse.',
  `no_civique` VARCHAR(10) NULL DEFAULT NULL COMMENT 'Numéro civique pour chaque adresse.',
  `type_rue` INT(10) NULL DEFAULT NULL COMMENT 'Nombre correspondant au type_rue de la table type_rue.',
  `nom` VARCHAR(30) NULL DEFAULT NULL COMMENT 'Nom de la localisation complétant type_rue.',
  `app` VARCHAR(10) NULL DEFAULT NULL COMMENT 'Numéro d\'appartiement pour la localisation.',
  `ville` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Nom de la ville.',
  `province` VARCHAR(25) NULL DEFAULT NULL COMMENT 'Nom de la province.',
  `code_postal` VARCHAR(10) NULL DEFAULT NULL COMMENT 'Code postal.',
  `pays` VARCHAR(30) NULL DEFAULT NULL COMMENT 'Pays où se situe l\'adresse.',
  PRIMARY KEY (`adresse_id`),
  CONSTRAINT `fk_type_rue$adresse`
    FOREIGN KEY (`type_rue`)
    REFERENCES `yolaine_hipdev`.`type_rue` (`type_rue_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 27
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table permettant d\'identifier l\'adresse du donneur ou de l\'organisme.';

CREATE UNIQUE INDEX `adresse_id_UNIQUE` ON `yolaine_hipdev`.`adresse` (`adresse_id` ASC);

CREATE INDEX `fk_type_rue$adresse` ON `yolaine_hipdev`.`adresse` (`type_rue` ASC);


-- -----------------------------------------------------
-- Table `yolaine_hipdev`.`marchandise_etat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yolaine_hipdev`.`marchandise_etat` ;

CREATE TABLE IF NOT EXISTS `yolaine_hipdev`.`marchandise_etat` (
  `etat_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'Numéro unique pour chaque état d\'une marchandise.',
  `description_marchandise_etat` VARCHAR(25) NULL DEFAULT NULL COMMENT 'Indique l\'état de la marchandise pour chaque id unique.',
  PRIMARY KEY (`etat_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table permettant de mettre un type d\'état pour une marchandise.';

CREATE UNIQUE INDEX `etat_id_UNIQUE` ON `yolaine_hipdev`.`marchandise_etat` (`etat_id` ASC);

CREATE INDEX `ix_marchandise_etat` ON `yolaine_hipdev`.`marchandise_etat` (`description_marchandise_etat` ASC) 
COMMENT = 'Requete de la liste des marchandises reserve par un organisme (par receveur_id)';


-- -----------------------------------------------------
-- Table `yolaine_hipdev`.`marchandise_statut`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yolaine_hipdev`.`marchandise_statut` ;

CREATE TABLE IF NOT EXISTS `yolaine_hipdev`.`marchandise_statut` (
  `statut_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'Numéro unique pour chaque type de statut pour une marchandise.',
  `description_marchandise_statut` VARCHAR(25) NULL DEFAULT NULL COMMENT 'Indique le type de statut pour la marchandise pour chaque statut_id.',
  PRIMARY KEY (`statut_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table permettant d\'identifier le type de statut pour la marchandise.';

CREATE UNIQUE INDEX `statut_id_UNIQUE` ON `yolaine_hipdev`.`marchandise_statut` (`statut_id` ASC);


-- -----------------------------------------------------
-- Table `yolaine_hipdev`.`marchandise_unite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yolaine_hipdev`.`marchandise_unite` ;

CREATE TABLE IF NOT EXISTS `yolaine_hipdev`.`marchandise_unite` (
  `unite_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'Numéro unique pour chaque type d\'unité.',
  `description_marchandise_unite` VARCHAR(25) NULL DEFAULT NULL COMMENT 'Indique le type d\'unité pour le produit pour chaque unite_id.',
  PRIMARY KEY (`unite_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table permettant de mettre un type de mesure sur la marchandise.';

CREATE UNIQUE INDEX `unite_id_UNIQUE` ON `yolaine_hipdev`.`marchandise_unite` (`unite_id` ASC);


-- -----------------------------------------------------
-- Table `yolaine_hipdev`.`type_aliment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yolaine_hipdev`.`type_aliment` ;

CREATE TABLE IF NOT EXISTS `yolaine_hipdev`.`type_aliment` (
  `aliment_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'Numéro unique pour chaque aliment.',
  `description_type_aliment` VARCHAR(25) CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT 'Indique le nom de l\'aliment pour chaque nombre unique.',
  PRIMARY KEY (`aliment_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table permettant d\'identifier les types d\'aliment offert.';

CREATE UNIQUE INDEX `aliment_id_UNIQUE` ON `yolaine_hipdev`.`type_aliment` (`aliment_id` ASC);


-- -----------------------------------------------------
-- Table `yolaine_hipdev`.`alimentaire`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yolaine_hipdev`.`alimentaire` ;

CREATE TABLE IF NOT EXISTS `yolaine_hipdev`.`alimentaire` (
  `alimentaire_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'Numéro unique pour chaque type de marchandise disponible.',
  `nom` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Représente le nom de l\'aliment.',
  `description_alimentaire` VARCHAR(100) NULL DEFAULT NULL COMMENT 'Décris ce qu\'est l\'aliment.',
  `quantite` DOUBLE(10,2) NULL DEFAULT NULL COMMENT 'Indique la quantité de l\'aliment.',
  `marchandise_etat` INT(10) NULL DEFAULT NULL COMMENT 'Nombre référant à la clé étrangère de la table marchandise_etat.',
  `marchandise_unite` INT(10) NULL DEFAULT NULL COMMENT 'Nombre référant à la clé étrangère de la table marchandise_unite.',
  `valeur` INT(10) NULL DEFAULT '0' COMMENT 'Nombre référant au prix estimé sans décimales.',
  `marchandise_statut` INT(10) NULL DEFAULT NULL COMMENT 'Nombre référant à la clé étrangère de la table marchandise_statut.',
  `type_alimentaire` INT(10) NULL DEFAULT NULL COMMENT 'Nombre référant à la clé étrangère de la table type_aliment.',
  `date_peremption` TIMESTAMP NULL DEFAULT NULL COMMENT 'Date(timestamp) pour la durée de conservation de l\'aliment.',
  PRIMARY KEY (`alimentaire_id`),
  CONSTRAINT `fk_marchandise_etat$alimentaire`
    FOREIGN KEY (`marchandise_etat`)
    REFERENCES `yolaine_hipdev`.`marchandise_etat` (`etat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_marchandise_statut$alimentaire`
    FOREIGN KEY (`marchandise_statut`)
    REFERENCES `yolaine_hipdev`.`marchandise_statut` (`statut_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_marchandise_unite$alimentaire`
    FOREIGN KEY (`marchandise_unite`)
    REFERENCES `yolaine_hipdev`.`marchandise_unite` (`unite_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_type_aliment$alimentaire`
    FOREIGN KEY (`type_alimentaire`)
    REFERENCES `yolaine_hipdev`.`type_aliment` (`aliment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table permettant de lister les aliments disponibles pour les organismes.';

CREATE UNIQUE INDEX `alimentaire_id_UNIQUE` ON `yolaine_hipdev`.`alimentaire` (`alimentaire_id` ASC);

CREATE INDEX `fk_marchandise_etat$alimentaire` ON `yolaine_hipdev`.`alimentaire` (`marchandise_etat` ASC);

CREATE INDEX `fk_marchandise_unite$alimentaire` ON `yolaine_hipdev`.`alimentaire` (`marchandise_unite` ASC);

CREATE INDEX `fk_marchandise_statut$alimentaire` ON `yolaine_hipdev`.`alimentaire` (`marchandise_statut` ASC);

CREATE INDEX `fk_type_aliment$alimentaire` ON `yolaine_hipdev`.`alimentaire` (`type_alimentaire` ASC);


-- -----------------------------------------------------
-- Table `yolaine_hipdev`.`utilisateur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yolaine_hipdev`.`utilisateur` ;

CREATE TABLE IF NOT EXISTS `yolaine_hipdev`.`utilisateur` (
  `utilisateur_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'Numéro unique pour chaque utilisateur.',
  `mot_de_passe` VARCHAR(255) NOT NULL COMMENT 'Représente le mot de passe de l\'utilisateur.',
  `nom` VARCHAR(30) NOT NULL COMMENT 'Représente le nom de l\'utilisateur.',
  `prenom` VARCHAR(30) NOT NULL COMMENT 'Représente le prénom de l\'utilisateur.',
  `courriel` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Représente l\'adresse courriel de l\'utilisateur.',
  `telephone` VARCHAR(15) NULL DEFAULT NULL COMMENT 'Représente le numéro de téléphone de l\'utilisateur.',
  `moyen_contact` INT(1) NOT NULL COMMENT 'Choix entre téléphone ou courriel pour rejoindre l\'utilisateur.',
  `organisme_id` INT(10) NULL DEFAULT NULL COMMENT 'Numéro de l\'organisme relié à la table organisme.',
  `derniere_connexion` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date-temps de la dernière connexion.',
  PRIMARY KEY (`utilisateur_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table permettant de prendre les données sur l\'utilisateur.';

CREATE UNIQUE INDEX `id_utilisateur_UNIQUE` ON `yolaine_hipdev`.`utilisateur` (`utilisateur_id` ASC);


-- -----------------------------------------------------
-- Table `yolaine_hipdev`.`organisme`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yolaine_hipdev`.`organisme` ;

CREATE TABLE IF NOT EXISTS `yolaine_hipdev`.`organisme` (
  `organisme_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'Numéro unique pour chaque organisme.',
  `nom` VARCHAR(30) CHARACTER SET 'latin1' NOT NULL COMMENT 'Représente le nom de l\'organisme.',
  `adresse` INT(10) NOT NULL COMMENT 'Adressse de l\'organisme.',
  `telephone` VARCHAR(10) CHARACTER SET 'latin1' NOT NULL COMMENT 'Numéro de téléphone de l\'oranisme.',
  `poste` INT(5) NULL DEFAULT NULL COMMENT 'Poste téléphonique pour l\'organisme.',
  `utilisateur_contact` INT(11) NOT NULL COMMENT 'Personne contact pour rejoindre l\'organisme.',
  `no_entreprise` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Numéro de l\'entreprise pour fin d\'identification.',
  `no_osbl` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Numéro de l\'organisme sans but lucratif.',
  PRIMARY KEY (`organisme_id`),
  CONSTRAINT `fk_adresse$organisme`
    FOREIGN KEY (`adresse`)
    REFERENCES `yolaine_hipdev`.`adresse` (`adresse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_utilisateur$organisme`
    FOREIGN KEY (`utilisateur_contact`)
    REFERENCES `yolaine_hipdev`.`utilisateur` (`utilisateur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table permettant de prendre les données sur l\'organisme.';

CREATE UNIQUE INDEX `id_organisme_UNIQUE` ON `yolaine_hipdev`.`organisme` (`organisme_id` ASC);

CREATE INDEX `fk_adresse$organisme` ON `yolaine_hipdev`.`organisme` (`adresse` ASC);

CREATE INDEX `fk_utilisateur$organisme` ON `yolaine_hipdev`.`organisme` (`utilisateur_contact` ASC);


-- -----------------------------------------------------
-- Table `yolaine_hipdev`.`transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `yolaine_hipdev`.`transaction` ;

CREATE TABLE IF NOT EXISTS `yolaine_hipdev`.`transaction` (
  `transaction_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'Numéro unique pour chaque transaction.',
  `receveur_id` INT(10) NULL DEFAULT NULL COMMENT 'Numéro unique pour chaque organisme receveur, à partir de la table organisme.',
  `donneur_id` INT(10) NULL DEFAULT NULL COMMENT 'Numéro unique pour chaque donneur, à partir de la table organisme.',
  `marchandise_id` INT(10) NULL DEFAULT NULL COMMENT 'Numéro unique de la marchandise, à partir de la table alimentaire.',
  `date_collecte` TIMESTAMP NULL DEFAULT NULL COMMENT 'Date de la collecte par l\'oranisme receveur.',
  `date_reservation` TIMESTAMP NULL DEFAULT NULL COMMENT 'Date de la réservation faite par l\'organisme receveur.',
  `date_disponible` TIMESTAMP NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date de la transaction',
  `date_transaction` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`),
  CONSTRAINT `fk_alimentaire$transaction`
    FOREIGN KEY (`marchandise_id`)
    REFERENCES `yolaine_hipdev`.`alimentaire` (`alimentaire_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_organisme_donneur$transaction`
    FOREIGN KEY (`donneur_id`)
    REFERENCES `yolaine_hipdev`.`organisme` (`organisme_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_organisme_receveur$transaction`
    FOREIGN KEY (`receveur_id`)
    REFERENCES `yolaine_hipdev`.`organisme` (`organisme_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8
COMMENT = 'Table permettant de prendre les informations sur la transaction pour une marchandise donnée.';

CREATE UNIQUE INDEX `id_transaction_UNIQUE` ON `yolaine_hipdev`.`transaction` (`transaction_id` ASC);

CREATE INDEX `fk_organisme_donneur$transaction` ON `yolaine_hipdev`.`transaction` (`donneur_id` ASC);

CREATE INDEX `fk_organisme_receveur$transaction` ON `yolaine_hipdev`.`transaction` (`receveur_id` ASC);

CREATE INDEX `fk_alimentaire$transaction` ON `yolaine_hipdev`.`transaction` (`marchandise_id` ASC);

CREATE INDEX `ix_transaction` ON `yolaine_hipdev`.`transaction` (`date_disponible` ASC, `date_collecte` ASC)  COMMENT = 'Requête pour voir la liste des marchandises disponible, champs dans le where 2';

SET SQL_MODE = '';
GRANT USAGE ON *.* TO hippie;
 DROP USER hippie;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'hippie' IDENTIFIED BY 'hippie';

GRANT SELECT ON TABLE `yolaine_hipdev`.* TO 'hippie';
GRANT SELECT, INSERT, TRIGGER ON TABLE `yolaine_hipdev`.* TO 'hippie';
GRANT EXECUTE ON ROUTINE `yolaine_hipdev`.* TO 'hippie';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
