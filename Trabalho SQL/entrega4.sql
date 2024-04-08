--- COMANDOS PARA CRIAÇÃO DAS TABELAS E SEUS RELACIONAMENTOS ---

-- UF --
CREATE TABLE `04_dump`.`uf` (
  `iduf` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `sigla` VARCHAR(45) NULL,
  PRIMARY KEY (`iduf`));

-- CIDADE -- 
CREATE TABLE `04_dump`.`cidade` (
  `idcidade` INT NOT NULL AUTO_INCREMENT,
  `iduf` INT NULL,
  `populacao` INT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idcidade`));
  
-- FK CIDADE -- 
ALTER TABLE `04_dump`.`cidade` 
ADD INDEX `fk_uf_cidade_idx` (`iduf` ASC) VISIBLE;
ALTER TABLE `04_dump`.`cidade` 
ADD CONSTRAINT `fk_uf_cidade`
  FOREIGN KEY (`iduf`)
  REFERENCES `04_dump`.`uf` (`iduf`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


-- CLIENTE -- 
CREATE TABLE `04_dump`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `idcidade` INT NULL,
  `nome` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  PRIMARY KEY (`idcliente`));

-- FK CLIENTE -- 
ALTER TABLE `04_dump`.`cliente` 
ADD INDEX `fk_cidade_cliente_idx` (`idcidade` ASC) VISIBLE;
ALTER TABLE `04_dump`.`cliente` 
ADD CONSTRAINT `fk_cidade_cliente`
  FOREIGN KEY (`idcidade`)
  REFERENCES `04_dump`.`cidade` (`idcidade`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


-- FARMACIA -- 
CREATE TABLE `04_dump`.`farmacia` (
  `idfarmacia` INT NOT NULL AUTO_INCREMENT,
  `idcidade` INT NULL,
  `idremedios` INT NULL,
  `nome` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`idfarmacia`));

-- FK FARMACIA -- 
ALTER TABLE `04_dump`.`farmacia` 
ADD INDEX `fk_cidade_farmacia_idx` (`idcidade` ASC) VISIBLE;
ALTER TABLE `04_dump`.`farmacia` 
ADD CONSTRAINT `fk_cidade_farmacia`
  FOREIGN KEY (`idcidade`)
  REFERENCES `04_dump`.`cidade` (`idcidade`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- FK FARMACIA
ALTER TABLE `04_dump`.`farmacia` 
ADD INDEX `fk_remedios_farmacia_idx` (`idremedios` ASC) VISIBLE;
ALTER TABLE `04_dump`.`farmacia` 
ADD CONSTRAINT `fk_remedios_farmacia`
  FOREIGN KEY (`idremedios`)
  REFERENCES `04_dump`.`remedios` (`idremedios`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


-- FARMACEUTICO -- 
CREATE TABLE `04_dump`.`farmaceutico` (
`idfarmaceutico` INT NOT NULL AUTO_INCREMENT,
  `idcidade` INT NULL,
  `idfarmacia` INT NULL,
  `nome` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`idfarmaceutico`));

-- FK FARMACEUTICO -- 
ALTER TABLE `04_dump`.`farmaceutico` 
ADD INDEX `fk_cidade_farmaceutico_idx` (`idcidade` ASC) VISIBLE;
ALTER TABLE `04_dump`.`farmaceutico` 
ADD CONSTRAINT `fk_cidade_farmaceutico`
  FOREIGN KEY (`idcidade`)
  REFERENCES `04_dump`.`cidade` (`idcidade`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- FK FARMACEUTICO -- 
ALTER TABLE `04_dump`.`farmaceutico` 
ADD INDEX `fk_farmacia_farmaceutico_idx` (`idfarmacia` ASC) VISIBLE;
ALTER TABLE `04_dump`.`farmaceutico` 
ADD CONSTRAINT `fk_farmacia_farmaceutico`
  FOREIGN KEY (`idfarmacia`)
  REFERENCES `04_dump`.`farmacia` (`idfarmacia`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


-- FORNECEDOR -- 
CREATE TABLE `04_dump`.`fornecedor` (
  `idfornecedor` INT NOT NULL AUTO_INCREMENT,
  `idfarmacia` INT NULL,
  `nome` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`idfornecedor`));

-- FK FORNECEDOR -- 
ALTER TABLE `04_dump`.`fornecedor` 
ADD INDEX `fk_farmacia_fornecedor_idx` (`idfarmacia` ASC) VISIBLE;
ALTER TABLE `04_dump`.`fornecedor` 
ADD CONSTRAINT `fk_farmacia_fornecedor`
  FOREIGN KEY (`idfarmacia`)
  REFERENCES `04_dump`.`farmacia` (`idfarmacia`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


-- REMEDIOS -- 
CREATE TABLE `04_dump`.`remedios` (
  `idremedios` INT NOT NULL AUTO_INCREMENT,
  `idfornecedor` INT NULL,
  `quantidade` INT NULL,
  `nome` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idremedios`));

-- FK REMEDIOS -- 
ALTER TABLE `04_dump`.`remedios` 
ADD INDEX `fk_fornecedor_remedios_idx` (`idfornecedor` ASC) VISIBLE;
ALTER TABLE `04_dump`.`remedios` 
ADD CONSTRAINT `fk_fornecedor_remedios`
  FOREIGN KEY (`idfornecedor`)
  REFERENCES `04_dump`.`fornecedor` (`idfornecedor`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


-- PEDIDO  -- 
CREATE TABLE `04_dump`.`pedido` (
  `idpedido` INT NOT NULL AUTO_INCREMENT,
  `idremedios` INT NULL,
  `idfarmaceutico` INT NULL,
  `idfarmacia` INT NULL,
  `idcliente` INT NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idpedido`));

-- FK PEDIDOS -- 
ALTER TABLE `04_dump`.`pedido` 
ADD INDEX `fk_remedios_pedido_idx` (`idremedios` ASC) VISIBLE;
ALTER TABLE `04_dump`.`pedido` 
ADD CONSTRAINT `fk_remedios_pedido`
  FOREIGN KEY (`idremedios`)
  REFERENCES `04_dump`.`remedios` (`idremedios`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- FK PEDIDOS -- 
ALTER TABLE `04_dump`.`pedido` 
ADD INDEX `fk_farmaceutico_pedido_idx` (`idfarmaceutico` ASC) VISIBLE;
ALTER TABLE `04_dump`.`pedido` 
ADD CONSTRAINT `fk_farmaceutico_pedido`
  FOREIGN KEY (`idfarmaceutico`)
  REFERENCES `04_dump`.`farmaceutico` (`idfarmaceutico`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- FK PEDIDOS -- 
ALTER TABLE `04_dump`.`pedido` 
ADD INDEX `fk_farmacia_pedido_idx` (`idfarmacia` ASC) VISIBLE;
ALTER TABLE `04_dump`.`pedido` 
ADD CONSTRAINT `fk_farmacia_pedido`
  FOREIGN KEY (`idfarmacia`)
  REFERENCES `04_dump`.`farmacia` (`idfarmacia`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- FK PEDIDOS -- 
ALTER TABLE `04_dump`.`pedido` 
ADD INDEX `fk_cliente_pedido_idx` (`idcliente` ASC) VISIBLE;
ALTER TABLE `04_dump`.`pedido` 
ADD CONSTRAINT `fk_cliente_pedido`
  FOREIGN KEY (`idcliente`)
  REFERENCES `04_dump`.`cliente` (`idcliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


-- ENTREGADOR -- 
CREATE TABLE `04_dump`.`entregador` (
  `identregador` INT NOT NULL AUTO_INCREMENT,
  `idcliente` INT NULL,
  `idpedido` INT NULL,
  `nome` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`identregador`));

-- FK ENTREGADOR -- 
ALTER TABLE `04_dump`.`entregador` 
ADD INDEX `fk_cliente_entregador_idx` (`idcliente` ASC) VISIBLE;
ALTER TABLE `04_dump`.`entregador` 
ADD CONSTRAINT `fk_cliente_entregador`
  FOREIGN KEY (`idcliente`)
  REFERENCES `04_dump`.`cliente` (`idcliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- FK ENTREGADOR -- 
ALTER TABLE `04_dump`.`entregador` 
ADD INDEX `fk_pedido_entregador_idx` (`idpedido` ASC) VISIBLE;
ALTER TABLE `04_dump`.`entregador` 
ADD CONSTRAINT `fk_pedido_entregador`
  FOREIGN KEY (`idpedido`)
  REFERENCES `04_dump`.`pedido` (`idpedido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


--- COMANDOS PARA POPULAÇÃO DAS TABELAS ---
-- UF 
INSERT INTO `04_dump`.`uf` (`iduf`, `nome`, `sigla`) VALUES ('1', 'Distrito Federal', 'DF');
INSERT INTO `04_dump`.`uf` (`iduf`, `nome`, `sigla`) VALUES ('2', 'Goiás', 'GO');
INSERT INTO `04_dump`.`uf` (`iduf`, `nome`, `sigla`) VALUES ('3', 'São Paulo', 'SP');

-- CIDADE 
INSERT INTO `04_dump`.`cidade` (`idcidade`, `iduf`, `populacao`, `nome`) VALUES ('1', '3', '11.451.245', 'são paulo');
INSERT INTO `04_dump`.`cidade` (`idcidade`, `iduf`, `populacao`, `nome`) VALUES ('2', '2', '391.772', 'anapolis');
INSERT INTO `04_dump`.`cidade` (`idcidade`, `iduf`, `populacao`, `nome`) VALUES ('3', '1', '208.177', 'taguatinga');
INSERT INTO `04_dump`.`cidade` (`idcidade`, `iduf`, `populacao`, `nome`) VALUES ('4', '2', '1.437.366', 'goiania');
INSERT INTO `04_dump`.`cidade` (`idcidade`, `iduf`, `populacao`, `nome`) VALUES ('5', '1', '443.824', 'ceilandia');

-- CLIENTES
INSERT INTO `04_dump`.`cliente` (`idcliente`, `idcidade`, `nome`, `telefone`, `endereco` ) VALUES ('1', '5', 'maria','29103801','Rua 23 Q2 casa110');
INSERT INTO `04_dump`.`cliente` (`idcliente`, `idcidade`, `nome`, `telefone`, `endereco` ) VALUES ('2', '1', 'nathalia','29019202','Rua 7 Q14 casa 8');
INSERT INTO `04_dump`.`cliente` (`idcliente`, `idcidade`, `nome`, `telefone`, `endereco` ) VALUES ('3', '2', 'pedro','92830183', 'Rua 31 Q3 casa 28');


--- COMANDOS PARA A CONSULTA 1 ---
SELECT [...]
--- COMANDOS PARA A CONSULTA 2 ---
SELECT [...]
--- COMANDOS PARA A CONSULTA 3 ---
SELECT [...]
--- COMANDOS PARA A CONSULTA 4 ---
SELECT [...]
--- COMANDOS PARA A CONSULTA 5 ---
SELECT [...]
--- COMANDOS PARA A CONSULTA 6 ---
SELECT [...]
--- COMANDOS PARA A CONSULTA 7 ---
SELECT [...]
--- COMANDOS PARA A CONSULTA 8 ---
SELECT [...]
--- COMANDOS PARA A CONSULTA 9 ---
SELECT [...]
--- COMANDOS PARA CRIAÇÃO E EXEMPLO DE USO DA VIEW ---
[...]
--- COMANDOS PARA CRIAÇÃO E EXEMPLO DE USO DA FUNÇÃO ---
[...]
--- COMANDOS PARA CRIAÇÃO E EXEMPLO DE USO DA STORED PROCEDURE ---
[...]
--- COMANDOS PARA CRIAÇÃO E EXEMPLO DE USO DA TRIGGER ---
[...]