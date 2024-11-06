
create database if not exists javafxTest;
use javafxTest;


-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema user060_db1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema user060_db1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `user060_db1` DEFAULT CHARACTER SET utf8 ;
USE `user060_db1` ;

-- -----------------------------------------------------
-- Table `user060_db1`.`Parts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Parts` (
  `idParts` INT(11) NOT NULL AUTO_INCREMENT,
  `nameParts` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idParts`),
  UNIQUE INDEX `nameParts_UNIQUE` (`nameParts` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user060_db1`.`Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Status` (
  `idStatus` INT(11) NOT NULL AUTO_INCREMENT,
  `nameStatus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idStatus`),
  UNIQUE INDEX `idStatus_UNIQUE` (`idStatus` ASC) VISIBLE,
  UNIQUE INDEX `nameStatus_UNIQUE` (`nameStatus` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user060_db1`.`Tech`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Tech` (
  `idTech` INT(11) NOT NULL AUTO_INCREMENT,
  `techType` VARCHAR(30) NOT NULL,
  `techModel` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idTech`),
  UNIQUE INDEX `idTech_UNIQUE` (`idTech` ASC) VISIBLE,
  UNIQUE INDEX `techModel_UNIQUE` (`techModel` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user060_db1`.`Types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Types` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `typeName` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `typeName_UNIQUE` (`typeName` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user060_db1`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Users` (
  `UserID` INT(11) NOT NULL AUTO_INCREMENT,
  `fio` TEXT NOT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `login` VARCHAR(30) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `typeID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE INDEX `UserID_UNIQUE` (`UserID` ASC) VISIBLE,
  UNIQUE INDEX `password_UNIQUE` (`password` ASC) VISIBLE,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
  INDEX `fk_Users_Types1_idx` (`typeID` ASC) VISIBLE,
  CONSTRAINT `fk_Users_Types1`
    FOREIGN KEY (`typeID`)
    REFERENCES `user060_db1`.`Types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user060_db1`.`Request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Request` (
  `requestID` INT(11) NOT NULL AUTO_INCREMENT,
  `startDate` DATE NULL DEFAULT NULL,
  `TechId` INT(11) NOT NULL,
  `problemDescryption` VARCHAR(50) NOT NULL,
  `completionDate` TINYTEXT NULL DEFAULT NULL,
  `partsId` INT(11) NULL DEFAULT NULL,
  `masterID` INT(11) NULL DEFAULT NULL,
  `clientID` INT(11) NOT NULL,
  `requestStatus` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`requestID`),
  INDEX `fk_Request_Users_idx` (`masterID` ASC) VISIBLE,
  INDEX `fk_Request_Tech1_idx` (`TechId` ASC) VISIBLE,
  INDEX `fk_Request_Parts1_idx` (`partsId` ASC) VISIBLE,
  INDEX `fk_Request_Status1_idx` (`requestStatus` ASC) VISIBLE,
  INDEX `fk_Request_Users1_idx` (`clientID` ASC) VISIBLE,
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
  CONSTRAINT `fk_Request_Tech1`
    FOREIGN KEY (`TechId`)
    REFERENCES `user060_db1`.`Tech` (`idTech`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Request_Users`
    FOREIGN KEY (`masterID`)
    REFERENCES `user060_db1`.`Users` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Request_Users1`
    FOREIGN KEY (`clientID`)
    REFERENCES `user060_db1`.`Users` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user060_db1`.`Comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Comments` (
  `idComments` INT(11) NOT NULL,
  `message` TEXT NULL DEFAULT NULL,
  `masterID` INT(11) NULL DEFAULT NULL,
  `requestID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idComments`),
  INDEX `fk_Comments_Users1_idx` (`masterID` ASC) VISIBLE,
  INDEX `fk_Comments_Request1_idx` (`requestID` ASC) VISIBLE,
  CONSTRAINT `fk_Comments_Request1`
    FOREIGN KEY (`requestID`)
    REFERENCES `user060_db1`.`Request` (`requestID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comments_Users1`
    FOREIGN KEY (`masterID`)
    REFERENCES `user060_db1`.`Users` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user060_db1`.`Passengers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Passengers` (
  `PassportNumber` VARCHAR(20) NOT NULL,
  `LastName` VARCHAR(50) NULL DEFAULT NULL,
  `FirstName` VARCHAR(50) NULL DEFAULT NULL,
  `MiddleName` VARCHAR(50) NULL DEFAULT NULL,
  `FlightID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`PassportNumber`),
  INDEX `FlightID` (`FlightID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user060_db1`.`Seats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Seats` (
  `FlightID` INT(11) NOT NULL,
  `TotalSeats` INT(11) NULL DEFAULT NULL,
  `AvailableSeats` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`FlightID`),
  CONSTRAINT `Seats_ibfk_1`
    FOREIGN KEY (`FlightID`)
    REFERENCES `user060_db1`.`Passengers` (`FlightID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user060_db1`.`Flights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`Flights` (
  `FlightID` INT(11) NOT NULL,
  `FlightNumber` INT(11) NULL DEFAULT NULL,
  `AircraftType` VARCHAR(50) NULL DEFAULT NULL,
  `DepartureLocation` VARCHAR(100) NULL DEFAULT NULL,
  `ArrivalLocation` VARCHAR(100) NULL DEFAULT NULL,
  `DepartureDate` DATE NULL DEFAULT NULL,
  `DepartureTime` TIME NULL DEFAULT NULL,
  `FlightDuration` TIME NULL DEFAULT NULL,
  `TicketPrice` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`FlightID`),
  INDEX `FlightID` (`FlightID` ASC) VISIBLE,
  CONSTRAINT `Flights_ibfk_1`
    FOREIGN KEY (`FlightID`)
    REFERENCES `user060_db1`.`Seats` (`FlightID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user060_db1`.`salespeople`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`salespeople` (
  `snum` INT(11) NOT NULL,
  `sname` CHAR(10) NOT NULL,
  `city` CHAR(10) NULL DEFAULT NULL,
  `comm` DECIMAL(3,2) NULL DEFAULT NULL,
  PRIMARY KEY (`snum`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = cp1251;


-- -----------------------------------------------------
-- Table `user060_db1`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`customers` (
  `cnum` INT(11) NOT NULL,
  `cname` CHAR(10) NOT NULL,
  `city` CHAR(10) NULL DEFAULT NULL,
  `rating` INT(11) NULL DEFAULT NULL,
  `snum` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cnum`),
  INDEX `custtosales` (`snum` ASC) VISIBLE,
  CONSTRAINT `custtosales`
    FOREIGN KEY (`snum`)
    REFERENCES `user060_db1`.`salespeople` (`snum`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = cp1251;


-- -----------------------------------------------------
-- Table `user060_db1`.`flight_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`flight_archive` (
  `flight_number` INT(11) NOT NULL,
  `departure_date` DATE NOT NULL,
  `total_seats` INT(11) NULL DEFAULT NULL,
  `seats_sold` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`flight_number`, `departure_date`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user060_db1`.`flight_shedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`flight_shedule` (
  `flight_number` INT(11) NOT NULL,
  `aircraft_type` VARCHAR(50) NULL DEFAULT NULL,
  `departure_city` VARCHAR(100) NULL DEFAULT NULL,
  `arrival_city` VARCHAR(100) NULL DEFAULT NULL,
  `departure_date` DATE NULL DEFAULT NULL,
  `departure_time` TIME NULL DEFAULT NULL,
  `arrival_time` TIME NULL DEFAULT NULL,
  `ticket_price` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`flight_number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user060_db1`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`orders` (
  `onum` INT(11) NOT NULL,
  `amt` DECIMAL(8,2) NULL DEFAULT NULL,
  `odate` DATE NOT NULL,
  `cnum` INT(11) NOT NULL,
  `snum` INT(11) NOT NULL,
  PRIMARY KEY (`onum`),
  INDEX `ordtosales` (`snum` ASC) VISIBLE,
  INDEX `ordtocust` (`cnum` ASC) VISIBLE,
  CONSTRAINT `ordtocust`
    FOREIGN KEY (`cnum`)
    REFERENCES `user060_db1`.`customers` (`cnum`),
  CONSTRAINT `ordtosales`
    FOREIGN KEY (`snum`)
    REFERENCES `user060_db1`.`salespeople` (`snum`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = cp1251;


-- -----------------------------------------------------
-- Table `user060_db1`.`pass_trip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`pass_trip` (
  `passport_number` INT(11) NOT NULL,
  `flight_number` INT(11) NOT NULL,
  `seats_passenger` INT(11) NOT NULL,
  PRIMARY KEY (`passport_number`, `flight_number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user060_db1`.`passenger_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`passenger_info` (
  `passport_number` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `middle_name` VARCHAR(50) NULL DEFAULT NULL,
  `flight_number` INT(11) NULL DEFAULT NULL,
  `departure_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`passport_number`),
  INDEX `flight_number` (`flight_number` ASC, `departure_date` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user060_db1`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user060_db1`.`users` (
  `userID` INT(11) NOT NULL AUTO_INCREMENT,
  `fio` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `login` VARCHAR(50) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `type` TEXT NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE INDEX `login` (`login` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
