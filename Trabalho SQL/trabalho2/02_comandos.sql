-- COMANDOS PARA CRIAÇÃO DAS TABELAS E SEUS RELACIONAMENTOS --

-- cidade
CREATE TABLE `bd4`.`cidade` (
  `idcidade` INT NOT NULL AUTO_INCREMENT,
  `iduf` INT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idcidade`));
  
  -- FK cidade --
ALTER TABLE `bd4`.`cidade`
ADD INDEX `fk_uf_cidade_idx`(`iduf ASC`) VISIBLE;
ALTER TABLE `04_dump`.`cidade` 
ADD CONSTRAINT `fk_uf_cidade`
FOREIGN KEY (`iduf`)
REFERENCES `bd4`.`uf` (`iduf`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
  
  
  -- cliente 
  CREATE TABLE `bd4`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `idcidade` INT NULL,
  `nome` VARCHAR(45) NULL,
  `idade` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `num_compras` VARCHAR(45) NULL,
  `compras_ultimo_ano` VARCHAR(45) NULL,
  PRIMARY KEY (`idcliente`));
  
  -- FK cliente -- 
ALTER TABLE `bd4`.`cliente`
ADD INDEX `fk_cidade_cliente_idx`(`idcidade ASC`) VISIBLE;
ALTER TABLE `bd4`.`cidade` 
ADD CONSTRAINT `fk_cidade_cliente`
FOREIGN KEY (`idcidade`)
REFERENCES `bd4`.`cidade` (`idcidade`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


-- compras
CREATE TABLE `bd4`.`compras` (
  `idcompras` INT NOT NULL AUTO_INCREMENT,
  `idcliente` INT NULL,
  `idfarmacia` INT NULL,
  `identregador` INT NULL,
  `idproduto` INT NULL,
  `valor` VARCHAR(45) NULL,
  `data_comp` DATE,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`idcompras`));
  
-- FK compras -- 
ALTER TABLE `bd4`.`compras`
ADD INDEX `fk_cliente_compras_idx`(`idcliente ASC`) VISIBLE;
ALTER TABLE `bd4`.`clientes` 
ADD CONSTRAINT `fk_cliente_compras`
FOREIGN KEY (`idclientes`)
REFERENCES `bd4`.`cliente` (`idcliente`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
  
-- FK compras -- 
ALTER TABLE `bd4`.`compras`
ADD INDEX `fk_farmacia_compras_idx`(`idfarmacia ASC`) VISIBLE;
ALTER TABLE `bd4`.`farmacia` 
ADD CONSTRAINT `fk_farmacia_compras`
FOREIGN KEY (`idfarmacia`)
REFERENCES `bd4`.`farmacia` (`idfarmacia`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- FK compras -- 
ALTER TABLE `bd4`.`compras`
ADD INDEX `fk_entregador_compras_idx`(`identregador ASC`) VISIBLE;
ALTER TABLE `bd4`.`entregador` 
ADD CONSTRAINT `fk_entregador_compras`
FOREIGN KEY (`identregador`)
REFERENCES `bd4`.`entregador` (`identregador`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- FK compras -- 
ALTER TABLE `bd4`.`produto`
ADD INDEX `fk_produto_compras_idx`(`idproduto ASC`) VISIBLE;
ALTER TABLE `bd4`.`produto` 
ADD CONSTRAINT `fk_produto_compras`
FOREIGN KEY (`idproduto`)
REFERENCES `bd4`.`produto` (`idproduto`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
  
  -- entregador
  CREATE TABLE `bd4`.`entregador` (
  `identregador` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`identregador`));
  
  
  -- estoque
  CREATE TABLE `bd4`.`estoque` (
  `idestoque` INT NOT NULL AUTO_INCREMENT,
  `idproduto` INT NULL,
  `idlote` INT NULL,
  `idfarmacia` INT NULL,
  `quantidade` INT NULL,
  PRIMARY KEY (`idestoque`));

-- FK estoque -- 
ALTER TABLE `bd4`.`estoque`
ADD INDEX `fk_produto_estoque_idx`(`idproduto ASC`) VISIBLE;
ALTER TABLE `bd4`.`produto` 
ADD CONSTRAINT `fk_produto_estoque`
FOREIGN KEY (`idproduto`)
REFERENCES `bd4`.`produto` (`idproduto`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- FK estoque -- 
ALTER TABLE `bd4`.`estoque`
ADD INDEX `fk_lote_estoque_idx`(`idlote ASC`) VISIBLE;
ALTER TABLE `bd4`.`lote` 
ADD CONSTRAINT `fk_lote_estoque`
FOREIGN KEY (`idlote`)
REFERENCES `bd4`.`lote` (`idlote`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- FK estoque -- 
ALTER TABLE `bd4`.`estoque`
ADD INDEX `fk_farmacia_estoque_idx`(`idfarmacia ASC`) VISIBLE;
ALTER TABLE `bd4`.`farmacia` 
ADD CONSTRAINT `fk_farmacia_estoque`
FOREIGN KEY (`idfarmacia`)
REFERENCES `bd4`.`farmacia` (`idfarmacia`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


-- fabricante 
CREATE TABLE `bd4`.`fabricante` (
  `idfabricante` INT NOT NULL AUTO_INCREMENT,
  `idcidade` INT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idfabricante`));
  
  -- FK fabricante
ALTER TABLE `bd4`.`fabricante`
ADD INDEX `fk_cidade_fabricante_idx`(`idcidade ASC`) VISIBLE;
ALTER TABLE `bd4`.`cidade` 
ADD CONSTRAINT `fk_cidade_fabricante`
FOREIGN KEY (`idcidade`)
REFERENCES `bd4`.`cidade` (`idcidade`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
  

-- farmacia
CREATE TABLE `bd4`.`farmacia` (
  `idfarmacia` INT NOT NULL AUTO_INCREMENT,
  `idproduto` INT NULL,
  `idcidade` INT NULL,
  `idgerente` INT NULL,
  `nome` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `qtd_vendas` INT NULL,
  PRIMARY KEY (`idfarmacia`));

-- FK farmacia

ALTER TABLE `bd4`.`farmacia`
ADD INDEX `fk_cidade_farmacia_idx`(`idcidade ASC`) VISIBLE;
ALTER TABLE `bd4`.`cidade` 
ADD CONSTRAINT `fk_cidade_farmacia`
FOREIGN KEY (`idcidade`)
REFERENCES `bd4`.`cidade` (`idcidade`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- FK farmacia
ALTER TABLE `bd4`.`farmacia`
ADD INDEX `fk_produto_farmacia_idx`(`idproduto ASC`) VISIBLE;
ALTER TABLE `bd4`.`produto` 
ADD CONSTRAINT `fk_produto_farmacia`
FOREIGN KEY (`idproduto`)
REFERENCES `bd4`.`produto` (`idproduto`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- FK gerente

ALTER TABLE `bd4`.`farmacia`
ADD INDEX `fk_gerente_farmacia_idx`(`idgerente ASC`) VISIBLE;
ALTER TABLE `bd4`.`gerente` 
ADD CONSTRAINT `fk_gerente_farmacia`
FOREIGN KEY (`idgerente`)
REFERENCES `bd4`.`gerente` (`idgerente`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
  

-- gerente 
CREATE TABLE `bd4`.`gerente` (
  `idgerente` INT NOT NULL AUTO_INCREMENT,
  `idfarmacia` INT NULL,
  `nome` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idgerente`));
  
  -- FK gerente 
  ALTER TABLE `bd4`.`gerente`
ADD INDEX `fk_farmacia_gerente_idx`(`idfarmacia ASC`) VISIBLE;
ALTER TABLE `bd4`.`farmacia` 
ADD CONSTRAINT `fk_farmacia_gerente`
FOREIGN KEY (`idfarmacia`)
REFERENCES `bd4`.`farmacia` (`idfarmacia`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
  
  CREATE TABLE `bd4`.`lote` (
  `idlote` INT NOT NULL AUTO_INCREMENT,
  `num_lote` INT NULL,
   `vencimento` DATE,
  PRIMARY KEY (`idlote`));

-- produto
CREATE TABLE `bd4`.`produto` (
  `idproduto` INT NOT NULL AUTO_INCREMENT,
  `idfabricante` INT NULL,
  `idcidade` INT NULL,
  `codigo` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  `quantidade` VARCHAR(45) NULL,
  PRIMARY KEY (`idproduto`));
  
  -- FK produto
  ALTER TABLE `bd4`.`produto`
ADD INDEX `fk_cidade_produto_idx`(`idcidade ASC`) VISIBLE;
ALTER TABLE `bd4`.`cidade` 
ADD CONSTRAINT `fk_cidade_produto`
FOREIGN KEY (`idcidade`)
REFERENCES `bd4`.`cidade` (`idcidade`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

  -- FK produto
ALTER TABLE `bd4`.`produto`
ADD INDEX `fk_fabricante_produto_idx`(`idfabricante ASC`) VISIBLE;
ALTER TABLE `bd4`.`fabricante` 
ADD CONSTRAINT `fk_fabricante_produto`
FOREIGN KEY (`idfabricante`)
REFERENCES `bd4`.`fabricante` (`idfabricante`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- uf
CREATE TABLE `bd4`.`uf` (
  `iduf` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `sigla` VARCHAR(45) NULL,
  PRIMARY KEY (`iduf`));


-- COMANDOS PARA POPULAÇÃO DAS TABELAS --

-- cidade 
INSERT INTO `bd4`.`cidade` (`idcidade`, `iduf`, `nome`) VALUES ('1', '1', 'taguatinga');
INSERT INTO `bd4`.`cidade` (`idcidade`, `iduf`, `nome`) VALUES ('2', '1', 'gama');
INSERT INTO `bd4`.`cidade` (`idcidade`, `iduf`, `nome`) VALUES ('3', '2', 'anapolis');
INSERT INTO `bd4`.`cidade` (`idcidade`, `iduf`, `nome`) VALUES ('4', '3', 'são paulo');
INSERT INTO `bd4`.`cidade` (`idcidade`, `iduf`, `nome`) VALUES ('5', '3', 'campos do jordão');
INSERT INTO `bd4`.`cidade` (`idcidade`, `iduf`, `nome`) VALUES ('6', '2', 'goiania');
INSERT INTO `bd4`.`cidade` (`idcidade`, `iduf`, `nome`) VALUES ('7', '1', 'ceilandia');

-- cliente 
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('1', '2', 'julia', '27', '28938292', '3', '2');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('2', '4', 'marcos', '45', '39829384', '12', '10');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('3', '6', 'jonas', '75', '28829382', '8', '32');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('4', '1', 'denise', '15', '20939293', '23', '19');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('5', '3', 'sabrina', '48', '84290193', '1', '0');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('6', '7', 'alexandre', '20', '39238213', '20', '21');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('7', '5', 'alan', '18', '23849383', '16', '56');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('8', '1', 'gilberto', '31', '12436843', '10', '32');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('9', '3', 'carol', '50', '19384921', '5', '0');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('10', '5', 'vitoria', '18', '39829384', '19', '19');






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