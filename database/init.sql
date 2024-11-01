-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema user060_db1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema user060_db1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `user060_db1` DEFAULT CHARACTER SET ascii ;
USE `user060_db1` ;

-- -----------------------------------------------------
-- Table `user060_db1`.`Types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `typeName` VARCHAR(20) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `typeName_UNIQUE` (`typeName` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `user060_db1`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Users` (
  `UserID` INT NOT NULL AUTO_INCREMENT,
  `fio` TEXT NOT NULL,
  `phone` VARCHAR(20) NULL,
  `login` VARCHAR(30) NOT NULL,
  `password` CHAR(5) NOT NULL,
  `typeID` INT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE INDEX `UserID_UNIQUE` (`UserID` ASC) VISIBLE,
  UNIQUE INDEX `password_UNIQUE` (`password` ASC) VISIBLE,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
  INDEX `fk_Users_Types1_idx` (`typeID` ASC) VISIBLE,
  CONSTRAINT `fk_Users_Types1`
    FOREIGN KEY (`typeID`)
    REFERENCES `user060_db1`.`Types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `user060_db1`.`Tech`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Tech` (
  `idTech` INT NOT NULL AUTO_INCREMENT,
  `techType` VARCHAR(30) NOT NULL,
  `techModel` VARCHAR(50) NULL,
  PRIMARY KEY (`idTech`),
  UNIQUE INDEX `techModel_UNIQUE` (`techModel` ASC) VISIBLE,
  UNIQUE INDEX `idTech_UNIQUE` (`idTech` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user060_db1`.`Parts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Parts` (
  `idParts` INT NOT NULL AUTO_INCREMENT,
  `nameParts` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idParts`),
  UNIQUE INDEX `nameParts_UNIQUE` (`nameParts` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user060_db1`.`Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Status` (
  `idStatus` INT NOT NULL AUTO_INCREMENT,
  `nameStatus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idStatus`),
  UNIQUE INDEX `idStatus_UNIQUE` (`idStatus` ASC) VISIBLE,
  UNIQUE INDEX `nameStatus_UNIQUE` (`nameStatus` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user060_db1`.`Request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Request` (
  `requestID` INT NOT NULL AUTO_INCREMENT,
  `startDate` DATE NULL,
  `TechId` INT NOT NULL,
  `problemDescryption` VARCHAR(50) NULL,
  `completionDate` TINYTEXT NULL,
  `partsId` INT NULL,
  `masterID` INT NOT NULL,
  `clientID` INT NOT NULL,
  `requestStatus` INT NOT NULL,
  PRIMARY KEY (`requestID`),
  INDEX `fk_Request_Users_idx` (`masterID` ASC) VISIBLE,
  INDEX `fk_Request_Tech1_idx` (`TechId` ASC) VISIBLE,
  INDEX `fk_Request_Parts1_idx` (`partsId` ASC) VISIBLE,
  INDEX `fk_Request_Status1_idx` (`requestStatus` ASC) VISIBLE,
  INDEX `fk_Request_Users1_idx` (`clientID` ASC) VISIBLE,
  CONSTRAINT `fk_Request_Users`
    FOREIGN KEY (`masterID`)
    REFERENCES `user060_db1`.`Users` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Request_Tech1`
    FOREIGN KEY (`TechId`)
    REFERENCES `user060_db1`.`Tech` (`idTech`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Request_Parts1`
    FOREIGN KEY (`partsId`)
    REFERENCES `user060_db1`.`Parts` (`idParts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Request_Status1`
    FOREIGN KEY (`requestStatus`)
    REFERENCES `user060_db1`.`Status` (`idStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Request_Users1`
    FOREIGN KEY (`clientID`)
    REFERENCES `user060_db1`.`Users` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user060_db1`.`Comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Comments` (
  `idComments` INT NOT NULL,
  `message` TEXT(100) NULL,
  `masterID` INT NULL,
  `requestID` INT NULL,
  PRIMARY KEY (`idComments`),
  INDEX `fk_Comments_Users1_idx` (`masterID` ASC) VISIBLE,
  INDEX `fk_Comments_Request1_idx` (`requestID` ASC) VISIBLE,
  CONSTRAINT `fk_Comments_Users1`
    FOREIGN KEY (`masterID`)
    REFERENCES `user060_db1`.`Users` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comments_Request1`
    FOREIGN KEY (`requestID`)
    REFERENCES `user060_db1`.`Request` (`requestID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;