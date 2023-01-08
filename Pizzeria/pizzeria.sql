-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 ;
USE `pizzeria` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pizzeria`.`client` ;

CREATE TABLE IF NOT EXISTS `pizzeria`.`client` (
  `idclient` INT NOT NULL,
  `nom` VARCHAR(30) NOT NULL,
  `cognoms` VARCHAR(45) NULL,
  `adreça` VARCHAR(45) NULL,
  `codi_postal` VARCHAR(5) NULL,
  `localitat` VARCHAR(45) NULL,
  `provincia` VARCHAR(45) NULL,
  `telefon` VARCHAR(15) NULL,
  PRIMARY KEY (`idclient`),
  UNIQUE INDEX `idclient_UNIQUE` (`idclient` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`botiga`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pizzeria`.`botiga` ;

CREATE TABLE IF NOT EXISTS `pizzeria`.`botiga` (
  `idbotiga` INT NOT NULL,
  `adressa` VARCHAR(45) NULL,
  `codi_postal` VARCHAR(5) NULL,
  `localitat` VARCHAR(25) NULL,
  `provincia` VARCHAR(15) NULL,
  PRIMARY KEY (`idbotiga`),
  UNIQUE INDEX `idbotiga_UNIQUE` (`idbotiga` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`empleat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pizzeria`.`empleat` ;

CREATE TABLE IF NOT EXISTS `pizzeria`.`empleat` (
  `idempleat` INT NOT NULL,
  `nom` VARCHAR(20) NULL,
  `cognoms` VARCHAR(35) NULL,
  `nif` VARCHAR(9) NULL,
  `telefon` VARCHAR(15) NULL,
  `idbotiga` INT NOT NULL,
  PRIMARY KEY (`idempleat`),
  UNIQUE INDEX `idempleat_UNIQUE` (`idempleat` ASC) VISIBLE,
  INDEX `idbotiga_idx` (`idbotiga` ASC) INVISIBLE,
  CONSTRAINT `botiga_empleat`
    FOREIGN KEY (`idbotiga`)
    REFERENCES `pizzeria`.`botiga` (`idbotiga`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`comanda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pizzeria`.`comanda` ;

CREATE TABLE IF NOT EXISTS `pizzeria`.`comanda` (
  `idcomanda` INT NOT NULL,
  `idclient` INT NOT NULL,
  `data_hora` DATETIME NOT NULL,
  `quantitat` INT NULL,
  `preu_total` FLOAT NULL,
  `idrepartidor` INT NULL,
  `data_hora_lliurament` DATETIME NULL,
  `idbotiga` INT NOT NULL,
  PRIMARY KEY (`idcomanda`),
  UNIQUE INDEX `idcomanda_UNIQUE` (`idcomanda` ASC) VISIBLE,
  INDEX `idclient_idx` (`idclient` ASC) VISIBLE,
  INDEX `idbotiga_idx` (`idbotiga` ASC) VISIBLE,
  INDEX `idrepartidor_idx` (`idrepartidor` ASC) INVISIBLE,
  CONSTRAINT `client`
    FOREIGN KEY (`idclient`)
    REFERENCES `pizzeria`.`client` (`idclient`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `botiga`
    FOREIGN KEY (`idbotiga`)
    REFERENCES `pizzeria`.`botiga` (`idbotiga`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `repartidor`
    FOREIGN KEY (`idrepartidor`)
    REFERENCES `pizzeria`.`empleat` (`idempleat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pizzeria`.`categoria` ;

CREATE TABLE IF NOT EXISTS `pizzeria`.`categoria` (
  `idcategoria` INT NOT NULL,
  `nom` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`productes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pizzeria`.`productes` ;

CREATE TABLE IF NOT EXISTS `pizzeria`.`productes` (
  `idproducte` INT NOT NULL,
  `idcomanda` INT NULL,
  `nom` VARCHAR(20) NULL,
  `descripcio` VARCHAR(45) NULL,
  `tipus_p_h_b` VARCHAR(1) NULL,
  `idcategoria` INT NULL,
  `imatge` VARCHAR(45) NULL,
  `preu` FLOAT NOT NULL,
  INDEX `comanda_idx` (`idcomanda` ASC) VISIBLE,
  INDEX `categoria_idx` (`idcategoria` ASC) VISIBLE,
  PRIMARY KEY (`idproducte`),
  UNIQUE INDEX `idproducte_UNIQUE` (`idproducte` ASC) VISIBLE,
  CONSTRAINT `comanda`
    FOREIGN KEY (`idcomanda`)
    REFERENCES `pizzeria`.`comanda` (`idcomanda`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `categoria`
    FOREIGN KEY (`idcategoria`)
    REFERENCES `pizzeria`.`categoria` (`idcategoria`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
