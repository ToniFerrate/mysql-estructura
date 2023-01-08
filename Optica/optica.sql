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
-- Table `optica`.`ulleres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`ulleres` ;

CREATE TABLE IF NOT EXISTS `optica`.`ulleres` (
  `idproveidor` INT NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `graduacio_dreta` DECIMAL NULL,
  `graduacio_esquerra` DECIMAL NULL,
  `tipus_muntura` VARCHAR(25) NULL,
  `color_muntura` VARCHAR(25) NULL,
  `color_vidre_dret` VARCHAR(25) NULL,
  `color_vidre_esquerra` VARCHAR(25) NULL,
  `preu` FLOAT NULL,
  PRIMARY KEY (`idproveidor`, `marca`),
  INDEX `idproveidor_idx` (`idproveidor` ASC) INVISIBLE,
  CONSTRAINT `proveidor_ulleres`
    FOREIGN KEY (`idproveidor`)
    REFERENCES `optica`.`proveidor` (`idproveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `empleat` VARCHAR(45) NULL,
  `idproveidor` INT NULL,
  `marca` VARCHAR(45) NULL,
  `data_registre` DATETIME NOT NULL,
  PRIMARY KEY (`idclient`),
  INDEX `client_recomanat_idx` (`client_id` ASC) INVISIBLE,
  INDEX `idproveidor_idx` (`idproveidor` ASC, `marca` ASC) INVISIBLE,
  UNIQUE INDEX `idclient_UNIQUE` (`idclient` ASC) VISIBLE,
  CONSTRAINT `client_recomanat`
    FOREIGN KEY (`client_id`)
    REFERENCES `optica`.`client` (`idclient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `client_ulleres`
    FOREIGN KEY (`idproveidor` , `marca`)
    REFERENCES `optica`.`ulleres` (`idproveidor` , `marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
