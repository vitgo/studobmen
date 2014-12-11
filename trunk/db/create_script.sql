SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `conspect` DEFAULT CHARACTER SET utf8 ;
USE `conspect` ;

-- -----------------------------------------------------
-- Table `conspect`.`system_user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `conspect`.`system_user` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(500) NOT NULL ,
  `enabled` BIT(1) NULL DEFAULT NULL ,
  `other_contact` VARCHAR(4000) NULL DEFAULT NULL ,
  `password` VARCHAR(200) NULL DEFAULT NULL ,
  `phone` VARCHAR(25) NULL DEFAULT NULL ,
  `skype` VARCHAR(500) NULL DEFAULT NULL ,
  `user_role` VARCHAR(300) NULL DEFAULT NULL ,
  `version` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `conspect`.`item`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `conspect`.`item` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(4000) NULL DEFAULT NULL ,
  `discipline` VARCHAR(2000) NOT NULL ,
  `ei` VARCHAR(4000) NOT NULL ,
  `is_electronic` BIT(1) NOT NULL ,
  `price` VARCHAR(4000) NOT NULL ,
  `publish_date` DATETIME NULL DEFAULT NULL ,
  `status` VARCHAR(500) NOT NULL ,
  `teacher` VARCHAR(2000) NOT NULL ,
  `type` VARCHAR(2000) NOT NULL ,
  `version` INT(11) NULL DEFAULT NULL ,
  `owner` BIGINT(20) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `FK317B13477DEBB2` (`owner` ASC) ,
  CONSTRAINT `FK317B13477DEBB2`
    FOREIGN KEY (`owner` )
    REFERENCES `conspect`.`system_user` (`id` ))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
