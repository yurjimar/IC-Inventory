-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Inventory
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Inventory
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Inventory` DEFAULT CHARACTER SET utf8 ;
USE `Inventory` ;

-- -----------------------------------------------------
-- Table `Inventory`.`Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Inventory`.`Category` ;

CREATE TABLE IF NOT EXISTS `Inventory`.`Category` (
  `idCategory` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventory`.`Object`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Inventory`.`Object` ;

CREATE TABLE IF NOT EXISTS `Inventory`.`Object` (
  `idObject` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  `Price` DOUBLE NULL,
  `idCategory` INT NOT NULL,
  PRIMARY KEY (`idObject`),
  INDEX `fk_Object_Category_idx` (`idCategory` ASC) VISIBLE,
  CONSTRAINT `fk_Object_Category`
    FOREIGN KEY (`idCategory`)
    REFERENCES `Inventory`.`Category` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventory`.`Status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Inventory`.`Status` ;

CREATE TABLE IF NOT EXISTS `Inventory`.`Status` (
  `idStatus` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idStatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventory`.`Stock`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Inventory`.`Stock` ;

CREATE TABLE IF NOT EXISTS `Inventory`.`Stock` (
  `Barcode` VARCHAR(50) NOT NULL,
  `Comments` VARCHAR(255) NULL,
  `idObject` INT NOT NULL,
  `idStatus` INT NOT NULL,
  PRIMARY KEY (`Barcode`),
  INDEX `fk_Stock_Object1_idx` (`idObject` ASC) VISIBLE,
  INDEX `fk_Stock_Status1_idx` (`idStatus` ASC) VISIBLE,
  CONSTRAINT `fk_Stock_Object1`
    FOREIGN KEY (`idObject`)
    REFERENCES `Inventory`.`Object` (`idObject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Stock_Status1`
    FOREIGN KEY (`idStatus`)
    REFERENCES `Inventory`.`Status` (`idStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventory`.`Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Inventory`.`Client` ;

CREATE TABLE IF NOT EXISTS `Inventory`.`Client` (
  `idClient` VARCHAR(15) NOT NULL,
  `WWID` VARCHAR(8) NULL,
  `First_Name` VARCHAR(65) NOT NULL,
  `Last_Name1` VARCHAR(65) NOT NULL,
  `Last_Name2` VARCHAR(65) NULL,
  `Phone` VARCHAR(9) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Province` VARCHAR(11) NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventory`.`History`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Inventory`.`History` ;

CREATE TABLE IF NOT EXISTS `Inventory`.`History` (
  `idHistory` INT NOT NULL AUTO_INCREMENT,
  `WWID_Approver` VARCHAR(8) NOT NULL,
  `Start_Date` DATETIME NOT NULL,
  `Return_Date` DATETIME NULL,
  `End_Date` DATETIME NULL,
  `Barcode_Stock` VARCHAR(50) NOT NULL,
  `idClient` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idHistory`),
  INDEX `fk_History_Stock1_idx` (`Barcode_Stock` ASC) VISIBLE,
  INDEX `fk_History_Client1_idx` (`idClient` ASC) VISIBLE,
  CONSTRAINT `fk_History_Stock1`
    FOREIGN KEY (`Barcode_Stock`)
    REFERENCES `Inventory`.`Stock` (`Barcode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_History_Client1`
    FOREIGN KEY (`idClient`)
    REFERENCES `Inventory`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
