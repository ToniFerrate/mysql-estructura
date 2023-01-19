-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`proveidor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`proveidor` ;

CREATE TABLE IF NOT EXISTS `optica`.`proveidor` (
  `idproveidor` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `carrer` VARCHAR(45) NULL,
  `numero` INT NULL,
  `pis` VARCHAR(10) NULL,
  `porta` VARCHAR(10) NULL,
  `ciutat` VARCHAR(45) NULL,
  `codi_postal` VARCHAR(5) NULL,
  `pais` VARCHAR(30) NULL,
  `telefon` VARCHAR(15) NULL,
  `fax` VARCHAR(15) NULL,
  `NIF` VARCHAR(9) NULL,
  PRIMARY KEY (`idproveidor`),
  UNIQUE INDEX `idproveidor_UNIQUE` (`idproveidor` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`marca` ;

CREATE TABLE IF NOT EXISTS `optica`.`marca` (
  `idmarca` INT NOT NULL,
  `idproveidor` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmarca`, `idproveidor`),
  UNIQUE INDEX `idmarca_UNIQUE` (`idmarca` ASC) VISIBLE,
  INDEX `FK_proveidor_idx` (`idproveidor` ASC) VISIBLE,
  CONSTRAINT `FK_proveidor`
    FOREIGN KEY (`idproveidor`)
    REFERENCES `optica`.`proveidor` (`idproveidor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`empleat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`empleat` ;

CREATE TABLE IF NOT EXISTS `optica`.`empleat` (
  `idempleat` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idempleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`ulleres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`ulleres` ;

CREATE TABLE IF NOT EXISTS `optica`.`ulleres` (
  `idmarca` INT NOT NULL,
  `graduacio_dreta` DECIMAL NULL,
  `graduacio_esquerra` DECIMAL NULL,
  `tipus_muntura` VARCHAR(25) NULL,
  `color_muntura` VARCHAR(25) NULL,
  `color_vidre_dret` VARCHAR(25) NULL,
  `color_vidre_esquerra` VARCHAR(25) NULL,
  `preu` FLOAT NULL,
  `idempleat` INT NULL,
  PRIMARY KEY (`idmarca`),
  INDEX `FK_empleat_idx` (`idempleat` ASC) VISIBLE,
  UNIQUE INDEX `idmarca_UNIQUE` (`idmarca` ASC) VISIBLE,
  CONSTRAINT `FK_marca`
    FOREIGN KEY (`idmarca`)
    REFERENCES `optica`.`marca` (`idmarca`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_empleat`
    FOREIGN KEY (`idempleat`)
    REFERENCES `optica`.`empleat` (`idempleat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`client` ;

CREATE TABLE IF NOT EXISTS `optica`.`client` (
  `idclient` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `carrer` VARCHAR(45) NULL,
  `numero` INT NULL,
  `pis` VARCHAR(10) NULL,
  `porta` VARCHAR(10) NULL,
  `ciutat` VARCHAR(45) NULL,
  `codi_postal` VARCHAR(5) NULL,
  `client_id` INT NULL,
  `idmarca` INT NOT NULL,
  `data_registre` DATETIME NOT NULL,
  PRIMARY KEY (`idclient`),
  INDEX `client_recomanat_idx` (`client_id` ASC) INVISIBLE,
  UNIQUE INDEX `idclient_UNIQUE` (`idclient` ASC) VISIBLE,
  INDEX `FK_idmarca_idx` (`idmarca` ASC) VISIBLE,
  CONSTRAINT `client_recomanat`
    FOREIGN KEY (`client_id`)
    REFERENCES `optica`.`client` (`idclient`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_idmarca`
    FOREIGN KEY (`idmarca`)
    REFERENCES `optica`.`ulleres` (`idmarca`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
