-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Medical genetics
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Medical genetics
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Medical genetics` ;
USE `Medical genetics` ;

-- -----------------------------------------------------
-- Table `Medical genetics`.`patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medical genetics`.`patient` ;

CREATE TABLE IF NOT EXISTS `Medical genetics`.`patient` (
  `ID_patient` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `gender` ENUM('F', 'M') NOT NULL,
  `age` VARCHAR(45) NOT NULL,
  `description_of_disease` VARCHAR(256) NULL,
  PRIMARY KEY (`ID_patient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medical genetics`.`mutation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medical genetics`.`mutation` ;

CREATE TABLE IF NOT EXISTS `Medical genetics`.`mutation` (
  `id_mutation` INT NOT NULL AUTO_INCREMENT,
  `start` INT NOT NULL,
  `end` INT NOT NULL,
  `chromosome` VARCHAR(4) NOT NULL,
  `description` VARCHAR(256) NULL,
  PRIMARY KEY (`id_mutation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medical genetics`.`patient2mutation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medical genetics`.`patient2mutation` ;

CREATE TABLE IF NOT EXISTS `Medical genetics`.`patient2mutation` (
  `ID_patient` INT NOT NULL,
  `ID_mutation` INT NOT NULL,
  PRIMARY KEY (`ID_patient`, `ID_mutation`),
  INDEX `fk_patient2mutation_2_idx` (`ID_mutation` ASC) VISIBLE,
  CONSTRAINT `fk_patient2mutation_1`
    FOREIGN KEY (`ID_mutation`)
    REFERENCES `Medical genetics`.`mutation` (`id_mutation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient2mutation_2`
    FOREIGN KEY (`ID_patient`)
    REFERENCES `Medical genetics`.`patient` (`ID_patient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medical genetics`.`gene`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medical genetics`.`gene` ;

CREATE TABLE IF NOT EXISTS `Medical genetics`.`gene` (
  `ID_gene` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(256) NULL,
  `start` INT NOT NULL,
  `end` INT NOT NULL,
  `chromosome` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`ID_gene`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Medical genetics`.`mutation2gene`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medical genetics`.`mutation2gene` ;

CREATE TABLE IF NOT EXISTS `Medical genetics`.`mutation2gene` (
  `ID_mutation` INT NOT NULL,
  `ID_gene` INT NOT NULL,
  PRIMARY KEY (`ID_mutation`, `ID_gene`),
  INDEX `fk_mutation2gene_2_idx` (`ID_gene` ASC) VISIBLE,
  CONSTRAINT `fk_mutation2gene_1`
    FOREIGN KEY (`ID_mutation`)
    REFERENCES `Medical genetics`.`mutation` (`id_mutation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mutation2gene_2`
    FOREIGN KEY (`ID_gene`)
    REFERENCES `Medical genetics`.`gene` (`ID_gene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
