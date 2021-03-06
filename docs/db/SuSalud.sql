-- MySQL Script generated by MySQL Workbench
-- Tue May 25 21:42:58 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema susalud
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `susalud` ;

-- -----------------------------------------------------
-- Schema susalud
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `susalud` DEFAULT CHARACTER SET utf8 ;
USE `susalud` ;

-- -----------------------------------------------------
-- Table `susalud`.`etapa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`etapa` ;

CREATE TABLE IF NOT EXISTS `susalud`.`etapa` (
  `id_etapa` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `anho` INT NOT NULL,
  PRIMARY KEY (`id_etapa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`estado_autoevaluacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`estado_autoevaluacion` ;

CREATE TABLE IF NOT EXISTS `susalud`.`estado_autoevaluacion` (
  `id_estado` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`autoevaluacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`autoevaluacion` ;

CREATE TABLE IF NOT EXISTS `susalud`.`autoevaluacion` (
  `id_autoeva` INT NOT NULL,
  `cantidad_avance` INT NOT NULL,
  `cantidad_total` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `id_etapa` INT NOT NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_autoeva`),
  INDEX `fk_autoevaluacion_etapa_idx` (`id_etapa` ASC) VISIBLE,
  INDEX `fk_autoevaluacion_estado_autoevaluacion1_idx` (`id_estado` ASC) VISIBLE,
  CONSTRAINT `fk_autoevaluacion_etapa`
    FOREIGN KEY (`id_etapa`)
    REFERENCES `susalud`.`etapa` (`id_etapa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_autoevaluacion_estado_autoevaluacion1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `susalud`.`estado_autoevaluacion` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`evaluador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`evaluador` ;

CREATE TABLE IF NOT EXISTS `susalud`.`evaluador` (
  `documento` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`documento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`verificador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`verificador` ;

CREATE TABLE IF NOT EXISTS `susalud`.`verificador` (
  `documento` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`documento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`macro_proceso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`macro_proceso` ;

CREATE TABLE IF NOT EXISTS `susalud`.`macro_proceso` (
  `id_proceso` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_proceso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`proceso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`proceso` ;

CREATE TABLE IF NOT EXISTS `susalud`.`proceso` (
  `id_proceso` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_proceso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`sub_proceso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`sub_proceso` ;

CREATE TABLE IF NOT EXISTS `susalud`.`sub_proceso` (
  `id_proceso` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_proceso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`posicion_autoevaluacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`posicion_autoevaluacion` ;

CREATE TABLE IF NOT EXISTS `susalud`.`posicion_autoevaluacion` (
  `id_pos_autoeva` INT NOT NULL,
  `id_autoeva` INT NOT NULL,
  `puntuacion` INT NOT NULL,
  `observaciones` VARCHAR(45) NOT NULL,
  `doc_evaluador` VARCHAR(45) NOT NULL,
  `doc_verificador` VARCHAR(45) NOT NULL,
  `id_macro_proceso` INT NOT NULL,
  `id_proceso` INT NOT NULL,
  `id_sub_proceso` INT NOT NULL,
  PRIMARY KEY (`id_pos_autoeva`),
  INDEX `fk_posicion_autoevaluacion_evaluador1_idx` (`doc_evaluador` ASC) VISIBLE,
  INDEX `fk_posicion_autoevaluacion_verificador1_idx` (`doc_verificador` ASC) VISIBLE,
  INDEX `fk_posicion_autoevaluacion_macro_proceso1_idx` (`id_macro_proceso` ASC) VISIBLE,
  INDEX `fk_posicion_autoevaluacion_proceso1_idx` (`id_proceso` ASC) VISIBLE,
  INDEX `fk_posicion_autoevaluacion_sub_proceso1_idx` (`id_sub_proceso` ASC) VISIBLE,
  INDEX `fk_posicion_autoevaluacion_autoevaluacion1_idx` (`id_autoeva` ASC) VISIBLE,
  CONSTRAINT `fk_posicion_autoevaluacion_evaluador1`
    FOREIGN KEY (`doc_evaluador`)
    REFERENCES `susalud`.`evaluador` (`documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posicion_autoevaluacion_verificador1`
    FOREIGN KEY (`doc_verificador`)
    REFERENCES `susalud`.`verificador` (`documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posicion_autoevaluacion_macro_proceso1`
    FOREIGN KEY (`id_macro_proceso`)
    REFERENCES `susalud`.`macro_proceso` (`id_proceso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posicion_autoevaluacion_proceso1`
    FOREIGN KEY (`id_proceso`)
    REFERENCES `susalud`.`proceso` (`id_proceso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posicion_autoevaluacion_sub_proceso1`
    FOREIGN KEY (`id_sub_proceso`)
    REFERENCES `susalud`.`sub_proceso` (`id_proceso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posicion_autoevaluacion_autoevaluacion1`
    FOREIGN KEY (`id_autoeva`)
    REFERENCES `susalud`.`autoevaluacion` (`id_autoeva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`tecnica_evaluativa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`tecnica_evaluativa` ;

CREATE TABLE IF NOT EXISTS `susalud`.`tecnica_evaluativa` (
  `id_tecnica` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tecnica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`tecnica_x_autoevaluacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`tecnica_x_autoevaluacion` ;

CREATE TABLE IF NOT EXISTS `susalud`.`tecnica_x_autoevaluacion` (
  `id_pos_autoeva` INT NOT NULL,
  `id_tecnica` INT NOT NULL,
  INDEX `fk_posicion_autoevaluacion_has_tecnica_evaluativa_tecnica_e_idx` (`id_tecnica` ASC) VISIBLE,
  INDEX `fk_posicion_autoevaluacion_has_tecnica_evaluativa_posicion__idx` (`id_pos_autoeva` ASC) VISIBLE,
  PRIMARY KEY (`id_pos_autoeva`, `id_tecnica`),
  CONSTRAINT `fk_posicion_autoevaluacion_has_tecnica_evaluativa_posicion_au1`
    FOREIGN KEY (`id_pos_autoeva`)
    REFERENCES `susalud`.`posicion_autoevaluacion` (`id_pos_autoeva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posicion_autoevaluacion_has_tecnica_evaluativa_tecnica_eva1`
    FOREIGN KEY (`id_tecnica`)
    REFERENCES `susalud`.`tecnica_evaluativa` (`id_tecnica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`fuente_referencial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`fuente_referencial` ;

CREATE TABLE IF NOT EXISTS `susalud`.`fuente_referencial` (
  `id_fuente` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_fuente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`criterio_puntuacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`criterio_puntuacion` ;

CREATE TABLE IF NOT EXISTS `susalud`.`criterio_puntuacion` (
  `id_criterio` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_criterio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`fuente_x_autoevaluacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`fuente_x_autoevaluacion` ;

CREATE TABLE IF NOT EXISTS `susalud`.`fuente_x_autoevaluacion` (
  `id_pos_autoeva` INT NOT NULL,
  `id_fuente` INT NOT NULL,
  INDEX `fk_posicion_autoevaluacion_has_fuente_referencial_fuente_re_idx` (`id_fuente` ASC) VISIBLE,
  INDEX `fk_posicion_autoevaluacion_has_fuente_referencial_posicion__idx` (`id_pos_autoeva` ASC) VISIBLE,
  PRIMARY KEY (`id_pos_autoeva`, `id_fuente`),
  CONSTRAINT `fk_posicion_autoevaluacion_has_fuente_referencial_posicion_au1`
    FOREIGN KEY (`id_pos_autoeva`)
    REFERENCES `susalud`.`posicion_autoevaluacion` (`id_pos_autoeva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posicion_autoevaluacion_has_fuente_referencial_fuente_refe1`
    FOREIGN KEY (`id_fuente`)
    REFERENCES `susalud`.`fuente_referencial` (`id_fuente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`criterio_x_autoevaluacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`criterio_x_autoevaluacion` ;

CREATE TABLE IF NOT EXISTS `susalud`.`criterio_x_autoevaluacion` (
  `id_pos_autoeva` INT NOT NULL,
  `id_criterio` INT NOT NULL,
  INDEX `fk_criterio_puntuacion_has_posicion_autoevaluacion_posicion_idx` (`id_pos_autoeva` ASC) VISIBLE,
  INDEX `fk_criterio_puntuacion_has_posicion_autoevaluacion_criterio_idx` (`id_criterio` ASC) VISIBLE,
  PRIMARY KEY (`id_pos_autoeva`, `id_criterio`),
  CONSTRAINT `fk_criterio_puntuacion_has_posicion_autoevaluacion_criterio_p1`
    FOREIGN KEY (`id_criterio`)
    REFERENCES `susalud`.`criterio_puntuacion` (`id_criterio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_criterio_puntuacion_has_posicion_autoevaluacion_posicion_a1`
    FOREIGN KEY (`id_pos_autoeva`)
    REFERENCES `susalud`.`posicion_autoevaluacion` (`id_pos_autoeva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`entidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`entidad` ;

CREATE TABLE IF NOT EXISTS `susalud`.`entidad` (
  `id_entidad` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_entidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`plan` ;

CREATE TABLE IF NOT EXISTS `susalud`.`plan` (
  `id_plan` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_plan`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`supervision`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`supervision` ;

CREATE TABLE IF NOT EXISTS `susalud`.`supervision` (
  `id_supervision` INT NOT NULL,
  `id_plan` INT NOT NULL,
  `id_etapa` INT NOT NULL,
  `id_entidad` INT NOT NULL,
  `tipo` ENUM('fiscalizadora', 'orientativa') NOT NULL,
  `modalidad` ENUM('integral', 'selectiva') NOT NULL,
  `tipo_intervencion` ENUM('integral', 'selectiva') NOT NULL,
  `fecha` DATE NOT NULL,
  `cantidad_avance` INT NOT NULL,
  `total_avance` INT NOT NULL,
  PRIMARY KEY (`id_supervision`),
  INDEX `fk_supervision_plan1_idx` (`id_plan` ASC) VISIBLE,
  INDEX `fk_supervision_etapa1_idx` (`id_etapa` ASC) VISIBLE,
  INDEX `fk_supervision_entidad1_idx` (`id_entidad` ASC) VISIBLE,
  CONSTRAINT `fk_supervision_plan1`
    FOREIGN KEY (`id_plan`)
    REFERENCES `susalud`.`plan` (`id_plan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_supervision_etapa1`
    FOREIGN KEY (`id_etapa`)
    REFERENCES `susalud`.`etapa` (`id_etapa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_supervision_entidad1`
    FOREIGN KEY (`id_entidad`)
    REFERENCES `susalud`.`entidad` (`id_entidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`posicion_supervision`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`posicion_supervision` ;

CREATE TABLE IF NOT EXISTS `susalud`.`posicion_supervision` (
  `id_pos_supervision` INT NOT NULL,
  `id_supervision` INT NOT NULL,
  `id_macro_proceso` INT NOT NULL,
  `id_proceso` INT NOT NULL,
  `id_sub_proceso` INT NOT NULL,
  `doc_verificador` VARCHAR(45) NOT NULL,
  `puntuacion` INT NOT NULL,
  `observaciones` TEXT NOT NULL,
  PRIMARY KEY (`id_pos_supervision`),
  INDEX `fk_posicion_supervision_macro_proceso1_idx` (`id_macro_proceso` ASC) VISIBLE,
  INDEX `fk_posicion_supervision_proceso1_idx` (`id_proceso` ASC) VISIBLE,
  INDEX `fk_posicion_supervision_sub_proceso1_idx` (`id_sub_proceso` ASC) VISIBLE,
  INDEX `fk_posicion_supervision_verificador1_idx` (`doc_verificador` ASC) VISIBLE,
  INDEX `fk_posicion_supervision_supervision1_idx` (`id_supervision` ASC) VISIBLE,
  CONSTRAINT `fk_posicion_supervision_macro_proceso1`
    FOREIGN KEY (`id_macro_proceso`)
    REFERENCES `susalud`.`macro_proceso` (`id_proceso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posicion_supervision_proceso1`
    FOREIGN KEY (`id_proceso`)
    REFERENCES `susalud`.`proceso` (`id_proceso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posicion_supervision_sub_proceso1`
    FOREIGN KEY (`id_sub_proceso`)
    REFERENCES `susalud`.`sub_proceso` (`id_proceso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posicion_supervision_verificador1`
    FOREIGN KEY (`doc_verificador`)
    REFERENCES `susalud`.`verificador` (`documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posicion_supervision_supervision1`
    FOREIGN KEY (`id_supervision`)
    REFERENCES `susalud`.`supervision` (`id_supervision`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`tecnica_x_supervision`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`tecnica_x_supervision` ;

CREATE TABLE IF NOT EXISTS `susalud`.`tecnica_x_supervision` (
  `id_pos_supervision` INT NOT NULL,
  `id_tecnica` INT NOT NULL,
  INDEX `fk_tecnica_evaluativa_has_posicion_supervision_posicion_sup_idx` (`id_pos_supervision` ASC) VISIBLE,
  INDEX `fk_tecnica_evaluativa_has_posicion_supervision_tecnica_eval_idx` (`id_tecnica` ASC) VISIBLE,
  PRIMARY KEY (`id_pos_supervision`, `id_tecnica`),
  CONSTRAINT `fk_tecnica_evaluativa_has_posicion_supervision_tecnica_evalua1`
    FOREIGN KEY (`id_tecnica`)
    REFERENCES `susalud`.`tecnica_evaluativa` (`id_tecnica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tecnica_evaluativa_has_posicion_supervision_posicion_super1`
    FOREIGN KEY (`id_pos_supervision`)
    REFERENCES `susalud`.`posicion_supervision` (`id_pos_supervision`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`fuente_x_supervision`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`fuente_x_supervision` ;

CREATE TABLE IF NOT EXISTS `susalud`.`fuente_x_supervision` (
  `id_pos_supervision` INT NOT NULL,
  `id_fuente` INT NOT NULL,
  INDEX `fk_fuente_referencial_has_posicion_supervision_posicion_sup_idx` (`id_pos_supervision` ASC) VISIBLE,
  INDEX `fk_fuente_referencial_has_posicion_supervision_fuente_refer_idx` (`id_fuente` ASC) VISIBLE,
  PRIMARY KEY (`id_pos_supervision`, `id_fuente`),
  CONSTRAINT `fk_fuente_referencial_has_posicion_supervision_fuente_referen1`
    FOREIGN KEY (`id_fuente`)
    REFERENCES `susalud`.`fuente_referencial` (`id_fuente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fuente_referencial_has_posicion_supervision_posicion_super1`
    FOREIGN KEY (`id_pos_supervision`)
    REFERENCES `susalud`.`posicion_supervision` (`id_pos_supervision`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `susalud`.`criterio_x_supervision`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `susalud`.`criterio_x_supervision` ;

CREATE TABLE IF NOT EXISTS `susalud`.`criterio_x_supervision` (
  `id_pos_supervision` INT NOT NULL,
  `id_criterio` INT NOT NULL,
  INDEX `fk_criterio_puntuacion_has_posicion_supervision_posicion_su_idx` (`id_pos_supervision` ASC) VISIBLE,
  INDEX `fk_criterio_puntuacion_has_posicion_supervision_criterio_pu_idx` (`id_criterio` ASC) VISIBLE,
  PRIMARY KEY (`id_pos_supervision`, `id_criterio`),
  CONSTRAINT `fk_criterio_puntuacion_has_posicion_supervision_criterio_punt1`
    FOREIGN KEY (`id_criterio`)
    REFERENCES `susalud`.`criterio_puntuacion` (`id_criterio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_criterio_puntuacion_has_posicion_supervision_posicion_supe1`
    FOREIGN KEY (`id_pos_supervision`)
    REFERENCES `susalud`.`posicion_supervision` (`id_pos_supervision`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
