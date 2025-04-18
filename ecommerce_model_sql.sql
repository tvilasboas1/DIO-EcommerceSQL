-- MySQL Script generated by MySQL Workbench
-- Sat Apr 12 08:51:13 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pessoa` (
  `idPessoa` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPessoa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `idAluno` INT NOT NULL,
  `Pessoa_idPessoa` INT NOT NULL,
  `Matricula` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAluno`),
  CONSTRAINT `fk_Aluno_Pessoa1`
    FOREIGN KEY (`Pessoa_idPessoa`)
    REFERENCES `mydb`.`Pessoa` (`idPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Aluno_Pessoa1_idx` ON `mydb`.`Aluno` (`Pessoa_idPessoa` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamento` (
  `idDepartamento` INT NOT NULL,
  `Campus` VARCHAR(45) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDepartamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `idProfessor` INT NOT NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  `Pessoa_idPessoa` INT NOT NULL,
  `Registro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProfessor`, `Departamento_idDepartamento`),
  CONSTRAINT `fk_Professor_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `mydb`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Professor_Pessoa1`
    FOREIGN KEY (`Pessoa_idPessoa`)
    REFERENCES `mydb`.`Pessoa` (`idPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Professor_Departamento1_idx` ON `mydb`.`Professor` (`Departamento_idDepartamento` ASC) VISIBLE;

CREATE INDEX `fk_Professor_Pessoa1_idx` ON `mydb`.`Professor` (`Pessoa_idPessoa` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Curso` (
  `idCurso` INT NOT NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  PRIMARY KEY (`idCurso`, `Departamento_idDepartamento`),
  CONSTRAINT `fk_Curso_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `mydb`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Curso_Departamento1_idx` ON `mydb`.`Curso` (`Departamento_idDepartamento` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Diciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diciplina` (
  `idDiciplina` INT NOT NULL,
  `Professor_idProfessor` INT NOT NULL,
  PRIMARY KEY (`idDiciplina`, `Professor_idProfessor`),
  CONSTRAINT `fk_Diciplina_Professor1`
    FOREIGN KEY (`Professor_idProfessor`)
    REFERENCES `mydb`.`Professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Diciplina_Professor1_idx` ON `mydb`.`Diciplina` (`Professor_idProfessor` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Matriculado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matriculado` (
  `Aluno_idAluno` INT NOT NULL,
  `Diciplina` INT NOT NULL,
  PRIMARY KEY (`Aluno_idAluno`, `Diciplina`),
  CONSTRAINT `fk_Aluno_has_Diciplina_Aluno`
    FOREIGN KEY (`Aluno_idAluno`)
    REFERENCES `mydb`.`Aluno` (`idAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_has_Diciplina_Diciplina1`
    FOREIGN KEY (`Diciplina`)
    REFERENCES `mydb`.`Diciplina` (`idDiciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Aluno_has_Diciplina_Diciplina1_idx` ON `mydb`.`Matriculado` (`Diciplina` ASC) VISIBLE;

CREATE INDEX `fk_Aluno_has_Diciplina_Aluno_idx` ON `mydb`.`Matriculado` (`Aluno_idAluno` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Diciplina & Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diciplina & Curso` (
  `Diciplina_idDiciplina` INT NOT NULL,
  `Curso_idCurso` INT NOT NULL,
  PRIMARY KEY (`Diciplina_idDiciplina`, `Curso_idCurso`),
  CONSTRAINT `fk_Diciplina_has_Curso_Diciplina1`
    FOREIGN KEY (`Diciplina_idDiciplina`)
    REFERENCES `mydb`.`Diciplina` (`idDiciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Diciplina_has_Curso_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `mydb`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Diciplina_has_Curso_Curso1_idx` ON `mydb`.`Diciplina & Curso` (`Curso_idCurso` ASC) VISIBLE;

CREATE INDEX `fk_Diciplina_has_Curso_Diciplina1_idx` ON `mydb`.`Diciplina & Curso` (`Diciplina_idDiciplina` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Pre_Requisito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pre_Requisito` (
  `idPre_Requisito` INT NOT NULL,
  PRIMARY KEY (`idPre_Requisito`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Diciplina & Pre_Requisito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diciplina & Pre_Requisito` (
  `Diciplina_has_Curso_Diciplina_idDiciplina` INT NOT NULL,
  `Diciplina_has_Curso_Curso_idCurso` INT NOT NULL,
  `Pre_Requisito_idPre_Requisito` INT NOT NULL,
  `Diciplina_idDiciplina` INT NOT NULL,
  PRIMARY KEY (`Diciplina_has_Curso_Diciplina_idDiciplina`, `Diciplina_has_Curso_Curso_idCurso`, `Pre_Requisito_idPre_Requisito`),
  CONSTRAINT `fk_Diciplina_has_Curso_has_Pre_Requisito_Diciplina_has_Curso1`
    FOREIGN KEY (`Diciplina_has_Curso_Diciplina_idDiciplina` , `Diciplina_has_Curso_Curso_idCurso`)
    REFERENCES `mydb`.`Diciplina & Curso` (`Diciplina_idDiciplina` , `Curso_idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Diciplina_has_Curso_has_Pre_Requisito_Pre_Requisito1`
    FOREIGN KEY (`Pre_Requisito_idPre_Requisito`)
    REFERENCES `mydb`.`Pre_Requisito` (`idPre_Requisito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Diciplina & Pre_Requisito_Diciplina1`
    FOREIGN KEY (`Diciplina_idDiciplina`)
    REFERENCES `mydb`.`Diciplina` (`idDiciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Diciplina_has_Curso_has_Pre_Requisito_Pre_Requisito1_idx` ON `mydb`.`Diciplina & Pre_Requisito` (`Pre_Requisito_idPre_Requisito` ASC) VISIBLE;

CREATE INDEX `fk_Diciplina_has_Curso_has_Pre_Requisito_Diciplina_has_Curs_idx` ON `mydb`.`Diciplina & Pre_Requisito` (`Diciplina_has_Curso_Diciplina_idDiciplina` ASC, `Diciplina_has_Curso_Curso_idCurso` ASC) VISIBLE;

CREATE INDEX `fk_Diciplina & Pre_Requisito_Diciplina1_idx` ON `mydb`.`Diciplina & Pre_Requisito` (`Diciplina_idDiciplina` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Periodo` (
  `idPeriodo` INT NOT NULL,
  `Ano` VARCHAR(45) NOT NULL,
  `Semestre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPeriodo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Oferta de Diciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Oferta de Diciplina` (
  `Diciplina_idDiciplina` INT NOT NULL,
  `Diciplina_Professor_idProfessor` INT NOT NULL,
  `Periodo_idPeriodo` INT NOT NULL,
  PRIMARY KEY (`Diciplina_idDiciplina`, `Diciplina_Professor_idProfessor`, `Periodo_idPeriodo`),
  CONSTRAINT `fk_Diciplina_has_Periodo_Diciplina1`
    FOREIGN KEY (`Diciplina_idDiciplina` , `Diciplina_Professor_idProfessor`)
    REFERENCES `mydb`.`Diciplina` (`idDiciplina` , `Professor_idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Diciplina_has_Periodo_Periodo1`
    FOREIGN KEY (`Periodo_idPeriodo`)
    REFERENCES `mydb`.`Periodo` (`idPeriodo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Diciplina_has_Periodo_Periodo1_idx` ON `mydb`.`Oferta de Diciplina` (`Periodo_idPeriodo` ASC) VISIBLE;

CREATE INDEX `fk_Diciplina_has_Periodo_Diciplina1_idx` ON `mydb`.`Oferta de Diciplina` (`Diciplina_idDiciplina` ASC, `Diciplina_Professor_idProfessor` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `idProduto` INT NOT NULL,
  `Categoria` VARCHAR(45) NULL,
  `Descrição` VARCHAR(45) NULL,
  `Valor` VARCHAR(45) NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Identificação` VARCHAR(45) NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `idFornecedor` INT NOT NULL,
  `Razão Social` VARCHAR(45) NULL,
  `CNPJ` VARCHAR(45) NULL,
  PRIMARY KEY (`idFornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estoque` (
  `idEstoque` INT NOT NULL,
  `Local` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstoque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `idPedido` INT NOT NULL,
  `Status do Pedido` VARCHAR(45) NOT NULL,
  `Descrição do Pedido` VARCHAR(45) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Frete` FLOAT NULL,
  PRIMARY KEY (`idPedido`, `Cliente_idCliente`),
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Pedido_Cliente1_idx` ON `mydb`.`Pedido` (`Cliente_idCliente` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Venda de Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venda de Produtos` (
  `idVenda de Produtos` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Pedido_Produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`idVenda de Produtos`, `Pedido_idPedido`, `Pedido_Produto_idProduto`),
  CONSTRAINT `fk_Venda de Produtos_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `mydb`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Venda de Produtos_Pedido1_idx` ON `mydb`.`Venda de Produtos` (`Pedido_idPedido` ASC, `Pedido_Produto_idProduto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Disponibilizando um Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disponibilizando um Produto` (
  `Produto_idProduto` INT NOT NULL,
  `Fornecedor_idFornecedor` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Fornecedor_idFornecedor`),
  CONSTRAINT `fk_Produto_has_Fornecedor_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Fornecedor_Fornecedor1`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `mydb`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Produto_has_Fornecedor_Fornecedor1_idx` ON `mydb`.`Disponibilizando um Produto` (`Fornecedor_idFornecedor` ASC) VISIBLE;

CREATE INDEX `fk_Produto_has_Fornecedor_Produto1_idx` ON `mydb`.`Disponibilizando um Produto` (`Produto_idProduto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Produto_has_Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto_has_Estoque` (
  `Produto_idProduto` INT NOT NULL,
  `Estoque_idEstoque` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Estoque_idEstoque`),
  CONSTRAINT `fk_Produto_has_Estoque_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Estoque_Estoque1`
    FOREIGN KEY (`Estoque_idEstoque`)
    REFERENCES `mydb`.`Estoque` (`idEstoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Produto_has_Estoque_Estoque1_idx` ON `mydb`.`Produto_has_Estoque` (`Estoque_idEstoque` ASC) VISIBLE;

CREATE INDEX `fk_Produto_has_Estoque_Produto1_idx` ON `mydb`.`Produto_has_Estoque` (`Produto_idProduto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Relação de Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Relação de Produtos` (
  `Pedido_idPedido` INT NOT NULL,
  `Pedido_Cliente_idCliente` INT NOT NULL,
  `Quantidade` VARCHAR(45) NULL,
  `Produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`Pedido_idPedido`, `Pedido_Cliente_idCliente`, `Produto_idProduto`),
  CONSTRAINT `fk_Pedido_has_Produto_Pedido1`
    FOREIGN KEY (`Pedido_idPedido` , `Pedido_Cliente_idCliente`)
    REFERENCES `mydb`.`Pedido` (`idPedido` , `Cliente_idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Relação de Produtos_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Pedido_has_Produto_Pedido1_idx` ON `mydb`.`Relação de Produtos` (`Pedido_idPedido` ASC, `Pedido_Cliente_idCliente` ASC) VISIBLE;

CREATE INDEX `fk_Relação de Produtos_Produto1_idx` ON `mydb`.`Relação de Produtos` (`Produto_idProduto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Terceiro Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Terceiro Vendedor` (
  `idTerceiro Vendedor` INT NOT NULL,
  `Razão Social` VARCHAR(45) NULL,
  `CNPJ` VARCHAR(45) NULL,
  `Local` VARCHAR(45) NULL,
  PRIMARY KEY (`idTerceiro Vendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produtos por Vendedor ( Terceiros )`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produtos por Vendedor ( Terceiros )` (
  `Terceiro Vendedor_idTerceiro Vendedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`Terceiro Vendedor_idTerceiro Vendedor`, `Produto_idProduto`),
  CONSTRAINT `fk_Terceiro Vendedor_has_Produto_Terceiro Vendedor1`
    FOREIGN KEY (`Terceiro Vendedor_idTerceiro Vendedor`)
    REFERENCES `mydb`.`Terceiro Vendedor` (`idTerceiro Vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Terceiro Vendedor_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Terceiro Vendedor_has_Produto_Produto1_idx` ON `mydb`.`Produtos por Vendedor ( Terceiros )` (`Produto_idProduto` ASC) VISIBLE;

CREATE INDEX `fk_Terceiro Vendedor_has_Produto_Terceiro Vendedor1_idx` ON `mydb`.`Produtos por Vendedor ( Terceiros )` (`Terceiro Vendedor_idTerceiro Vendedor` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
