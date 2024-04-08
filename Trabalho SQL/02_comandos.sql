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
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('2', '4', 'marcos', '35', '23849383', '12', '10');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('3', '6', 'jonas', '75', '12849382', '8', '32');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('4', '1', 'denise', '25', '12436843', '23', '49');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('5', '3', 'sabrina', '48', '19384921', '1', '0');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('6', '7', 'alexandre', '20', '39829384', '20', '21');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('7', '5', 'alan', '18', '28829382', '16', '56');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('8', '1', 'gilberto', '31', '20939293', '10', '32');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('9', '3', 'carol', '50', '84290193', '5', '0');
INSERT INTO `bd4`.`cliente` (`idcliente`, `idcidade`, `nome`,`idade`, `telefone`, `num_compras` ) VALUES ('10', '5', 'vitoria', '18', '39238213', '19', '19');


-- compras
INSERT INTO `bd4`.`compras` (`idcompras`, `idcliente`, `idfarmacia`,`identregador`, `idproduto`, `valor`, `data_comp`,`tipo` ) VALUES ('1', '2', '6', '1', '4', '68', '2023-09-03','online');
INSERT INTO `bd4`.`compras` (`idcompras`, `idcliente`, `idfarmacia`,`identregador`, `idproduto`, `valor`, `data_comp`,`tipo` ) VALUES ('2', '3', '8', '3', '3', '12', '2023-11-10','app');
INSERT INTO `bd4`.`compras` (`idcompras`, `idcliente`, `idfarmacia`,`identregador`, `idproduto`, `valor`, `data_comp`,`tipo` ) VALUES ('3', '7', '7', '5', '5', '125', '2023-11-13','online');
INSERT INTO `bd4`.`compras` (`idcompras`, `idcliente`, `idfarmacia`,`identregador`, `idproduto`, `valor`, `data_comp`,`tipo` ) VALUES ('4', '9', '2', '7', '1', '8', '2023-11-13','online');
INSERT INTO `bd4`.`compras` (`idcompras`, `idcliente`, `idfarmacia`,`identregador`, `idproduto`, `valor`, `data_comp`,`tipo` ) VALUES ('5', '1', '4', '2', '2', '9', '2023-08-13','app');
INSERT INTO `bd4`.`compras` (`idcompras`, `idcliente`, `idfarmacia`,`identregador`, `idproduto`, `valor`, `data_comp`,`tipo` ) VALUES ('6', '3', '8', '', '3', '10', '2023-11-13','fisico');
INSERT INTO `bd4`.`compras` (`idcompras`, `idcliente`, `idfarmacia`,`identregador`, `idproduto`, `valor`, `data_comp`,`tipo` ) VALUES ('7', '1', '4', '', '5', '5', '2023-11-14','fisico');
INSERT INTO `bd4`.`compras` (`idcompras`, `idcliente`, `idfarmacia`,`identregador`, `idproduto`, `valor`, `data_comp`,`tipo` ) VALUES ('8', '9', '2', '2', '5', '23', '2023-11-14','app');
INSERT INTO `bd4`.`compras` (`idcompras`, `idcliente`, `idfarmacia`,`identregador`, `idproduto`, `valor`, `data_comp`,`tipo` ) VALUES ('9', '2', '6', '', '2', '45', '2023-11-15','fisico');
INSERT INTO `bd4`.`compras` (`idcompras`, `idcliente`, `idfarmacia`,`identregador`, `idproduto`, `valor`, `data_comp`,`tipo` ) VALUES ('10', '4', '3', '', '1', '21', '2023-11-15','fisico');


-- entregador 
INSERT INTO `bd4`.`entregador` (`identregador`,`nome` ) VALUES ('1',  'rogerio');
INSERT INTO `bd4`.`entregador` (`identregador`,`nome` ) VALUES ('2',  'gabriel');
INSERT INTO `bd4`.`entregador` (`identregador`,`nome` ) VALUES ('3', 'lucas');
INSERT INTO `bd4`.`entregador` (`identregador`,`nome` ) VALUES ('4', 'fernanda');
INSERT INTO `bd4`.`entregador` (`identregador`,`nome` ) VALUES ('5',  'ramires');
INSERT INTO `bd4`.`entregador` (`identregador`,`nome` ) VALUES ('6',  'elias');
INSERT INTO `bd4`.`entregador` (`identregador`,`nome` ) VALUES ('7',  'jacob');


-- estoque
INSERT INTO `bd4`.`estoque` (`idestoque`,`idproduto`, `idlote`, `idfarmacia`, `qunatidade` ) VALUES ('1', '2', '5', '2', '109');
INSERT INTO `bd4`.`estoque` (`idestoque`,`idproduto`, `idlote`, `idfarmacia`, `qunatidade` ) VALUES ('2', '4', '4', '4', '73');
INSERT INTO `bd4`.`estoque` (`idestoque`,`idproduto`, `idlote`, `idfarmacia`, `qunatidade` ) VALUES ('3', '1', '3', '6', '234');
INSERT INTO `bd4`.`estoque` (`idestoque`,`idproduto`, `idlote`, `idfarmacia`, `qunatidade` ) VALUES ('4', '3', '2', '1', '87');


-- fabricante 
INSERT INTO `bd4`.`fabricante` (`idfabricante`,`idcidade`, `nome` ) VALUES ('1', '3', 'EMS');
INSERT INTO `bd4`.`fabricante` (`idfabricante`,`idcidade`, `nome` ) VALUES ('2', '2', 'neo quimica');
INSERT INTO `bd4`.`fabricante` (`idfabricante`,`idcidade`, `nome` ) VALUES ('3', '1', 'medley');


-- farmacia
INSERT INTO `bd4`.`farmacia` (`idfarmacia`,`idcidade`, `idproduto`, `idgerente`, `nome`, `endereco`, `qtd_vendas` ) VALUES ('1', '7', '6', '1', 'drogasil', 'Rua Francisco  ChapecÓ', '123');
INSERT INTO `bd4`.`farmacia` (`idfarmacia`,`idcidade`, `idproduto`, `idgerente`, `nome`, `endereco`, `qtd_vendas` ) VALUES ('2', '3', '7', '3', 'santa marta', 'Rua  Limoeiras', '321');
INSERT INTO `bd4`.`farmacia` (`idfarmacia`,`idcidade`, `idproduto`, `idgerente`, `nome`, `endereco`, `qtd_vendas` ) VALUES ('3', '1', '8', '5', 'Rosario', 'Rua Fagundes', '452');
INSERT INTO `bd4`.`farmacia` (`idfarmacia`,`idcidade`, `idproduto`, `idgerente`, `nome`, `endereco`, `qtd_vendas` ) VALUES ('4', '2', '5', '1', 'Droga farma', 'Rua Lider', '164');
INSERT INTO `bd4`.`farmacia` (`idfarmacia`,`idcidade`, `idproduto`, `idgerente`, `nome`, `endereco`, `qtd_vendas` ) VALUES ('5', '1', '4', '2', 'Santo andre', 'Rua Tenebris', '82');
INSERT INTO `bd4`.`farmacia` (`idfarmacia`,`idcidade`, `idproduto`, `idgerente`, `nome`, `endereco`, `qtd_vendas` ) VALUES ('6', '4', '3', '4', 'Drogaria', 'Rua  Alves 203e Bairro: Lider Chapecó', '362');
INSERT INTO `bd4`.`farmacia` (`idfarmacia`,`idcidade`, `idproduto`, `idgerente`, `nome`, `endereco`, `qtd_vendas` ) VALUES ('7', '5', '2', '6', 'Dorgaria Popular', 'Rua Chapecó 23', '232');
INSERT INTO `bd4`.`farmacia` (`idfarmacia`,`idcidade`, `idproduto`, `idgerente`, `nome`, `endereco`, `qtd_vendas` ) VALUES ('8', '6', '1', '8', 'Rosamaria', 'Rua Dianapolis 43', '100');


-- gerente 
INSERT INTO `bd4`.`gerente` (`idgerente`,`idfarmacia`, `nome`, `telefone`, `email` ) VALUES ('1', '1', 'marcela', '98293384', 'marcela@gamil.com');
INSERT INTO `bd4`.`gerente` (`idgerente`,`idfarmacia`, `nome`, `telefone`, `email` ) VALUES ('2', '5', 'giovanna', '91829384', 'giovanna@gamil.com');
INSERT INTO `bd4`.`gerente` (`idgerente`,`idfarmacia`, `nome`, `telefone`, `email` ) VALUES ('3', '2', 'carolina', '87529384', 'carolina@gamil.com');
INSERT INTO `bd4`.`gerente` (`idgerente`,`idfarmacia`, `nome`, `telefone`, `email` ) VALUES ('4', '6', 'murilo',  '22329384', 'murilo@gamil.com');
INSERT INTO `bd4`.`gerente` (`idgerente`,`idfarmacia`, `nome`, `telefone`, `email` ) VALUES ('5', '3', 'savio','91829384', 'savio@gamil.com');

-- lote 
INSERT INTO `bd4`.`lote` (`idlote`,`num_lote`, `vencimento` ) VALUES ('1', '23', '2024-02-12');
INSERT INTO `bd4`.`lote` (`idlote`,`num_lote`, `vencimento` ) VALUES ('2', '98', '2024-08-29');
INSERT INTO `bd4`.`lote` (`idlote`,`num_lote`, `vencimento` ) VALUES ('3', '21', '2023-12-08');
INSERT INTO `bd4`.`lote` (`idlote`,`num_lote`, `vencimento` ) VALUES ('4', '56', '2026-03-28');
INSERT INTO `bd4`.`lote` (`idlote`,`num_lote`, `vencimento` ) VALUES ('5', '10', '2025-07-23');


-- produto 
INSERT INTO `bd4`.`produto` (`idproduto`,`idfabricante`, `idcidade`, `codigo`,`nome`, `quantidade` ) VALUES ('1', '2', '2', '2727', 'doril', '234');
INSERT INTO `bd4`.`produto` (`idproduto`,`idfabricante`, `idcidade`, `codigo`,`nome`, `quantidade` ) VALUES ('2', '3', '4', '1212', 'tylenol', '109');
INSERT INTO `bd4`.`produto` (`idproduto`,`idfabricante`, `idcidade`, `codigo`,`nome`, `quantidade` ) VALUES ('3', '1', '6', '2323', 'dramin', '87');
INSERT INTO `bd4`.`produto` (`idproduto`,`idfabricante`, `idcidade`, `codigo`,`nome`, `quantidade` ) VALUES ('4', '1', '7', '3232', 'alendronato de sódio', '73');
INSERT INTO `bd4`.`produto` (`idproduto`,`idfabricante`, `idcidade`, `codigo`,`nome`, `quantidade` ) VALUES ('5', '1', '3', '11', 'glibenclamida', '50');
INSERT INTO `bd4`.`produto` (`idproduto`,`idfabricante`, `idcidade`, `codigo`,`nome`, `quantidade` ) VALUES ('6', '2', '2', '45', 'dipirona', '310');
INSERT INTO `bd4`.`produto` (`idproduto`,`idfabricante`, `idcidade`, `codigo`,`nome`, `quantidade` ) VALUES ('7', '3', '4', '76', 'crommolerg', '12');
INSERT INTO `bd4`.`produto` (`idproduto`,`idfabricante`, `idcidade`, `codigo`,`nome`, `quantidade` ) VALUES ('8', '3', '4', '81', 'luftal', '56');



-- uf 
INSERT INTO `bd4`.`uf` (`iduf`,`nome`, `sigla`) VALUES ('1', 'distrito federal', 'DF');
INSERT INTO `bd4`.`uf` (`iduf`,`nome`, `sigla`) VALUES ('2', 'goias', 'GO');
INSERT INTO `bd4`.`uf` (`iduf`,`nome`, `sigla`) VALUES ('3', 'são paulo', 'SP');




-- COMANDOS PARA A CONSULTA 1 --
SELECT produto.codigo, produto.nome, fabricante.nome, SUM(estoque.quantidade) AS total, cidade.nome
FROM bd4.produto AS produto
JOIN bd4.estoque AS estoque 
ON produto.idproduto = estoque.idproduto
JOIN bd4.farmacia AS farmacia
ON estoque.idfarmacia = farmacia.idfarmacia
JOIN bd4.fabricante  AS fabricante
ON produto.idfabricante = fabricante.idfabricante
JOIN bd4.cidade  AS cidade
ON farmacia.idcidade = cidade.idcidade
WHERE cidade.idcidade = 2
GROUP BY
produto.codigo, produto.nome, fabricante.nome, cidade.nome
ORDER BY
produto.nome;

-- COMANDOS PARA A CONSULTA 2 --

SELECT cliente.idcliente, cliente.nome, cliente.telefone, cliente.idade, MAX(cliente.num_compras) AS num_comp
FROM bd4.cliente AS cliente
JOIN bd4.compras AS compras
ON compras.idcliente = cliente.idcliente
WHERE cliente.idcidade = 2
GROUP BY
cliente.idcliente, cliente.nome, cliente.telefone, cliente.idade;
    
-- COMANDOS PARA A CONSULTA 3 --

SELECT compras.idcompras, cliente.nome, compras.valor, compras.tipo, compras.data_comp
FROM bd4.compras AS compras
JOIN bd4.cliente AS cliente
ON compras.idcliente = cliente.idcliente
WHERE compras.tipo IN ('fisico', 'online') AND compras.data_comp BETWEEN '2023-11-14' AND '2023-11-15'
GROUP BY compras.idcompras, cliente.nome, compras.valor, compras.tipo, compras.data_comp;

-- COMANDOS PARA A CONSULTA 4 --

SELECT cliente.idcliente, cliente.nome, cliente.telefone, cliente.idade, cliente.compras_ultimo_ano
FROM bd4.cliente AS cliente
JOIN bd4.compras AS compras
ON cliente.idcliente = compras.idcliente
JOIN bd4.farmacia AS farmacia
ON compras.idfarmacia = farmacia.idfarmacia
WHERE farmacia.idfarmacia
AND (compras.data_comp IS NULL OR compras.data_comp BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE());

-- COMANDOS PARA A CONSULTA 6 --

SELECT produto.nome AS nomep, fabricante.nome AS nomef, produto.codigo AS codigo, SUM(produto.quantidade) AS qtd
FROM bd4.compras AS compras
JOIN bd4.produto AS produto 
ON compras.idproduto = produto.idproduto
JOIN bd4.fabricante AS fabricante 
ON produto.idfabricante = fabricante.idfabricante
JOIN bd4.farmacia AS farmacia 
ON compras.idfarmacia = farmacia.idfarmacia
JOIN bd4.cidade AS cidade 
ON farmacia.idcidade = cidade.idcidade
WHERE cidade.idcidade = 2
GROUP BY produto.codigo, produto.nome, fabricante.nome
ORDER BY qtd 
LIMIT 10;

-- COMANDOS PARA A CONSULTA 7 --

SELECT produto.nome AS nomep, fabricante.nome AS nomef, farmacia.nome AS nome, cidade.nome AS nomec, SUM(farmacia.qtd_vendas) AS total
FROM bd4.compras AS compras
JOIN bd4.farmacia AS farmacia 
ON compras.idfarmacia = farmacia.idfarmacia
JOIN bd4.produto AS produto 
ON compras.idproduto = produto.idproduto
JOIN bd4.fabricante AS fabricante 
ON produto.idfabricante = fabricante.idfabricante
JOIN bd4.cidade AS cidade 
ON fabricante.idcidade = cidade.idcidade
WHERE compras.tipo = 'app'
GROUP BY
produto.nome, fabricante.nome, farmacia.nome, cidade.nome
ORDER BY
total 
LIMIT 10;

-- COMANDOS PARA A CONSULTA 8 --

SELECT * FROM bd4.farmacia
WHERE qtd_vendas = (SELECT MIN(qtd_vendas) FROM bd4.farmacia)
LIMIT 3;

-- COMANDOS PARA A CONSULTA 9 --

SELECT compras.valor, entregador.nome
FROM bd4.compras AS compras
JOIN bd4.entregador AS entregador
ON compras.identregador = entregador.identregador
WHERE entregador.nome = 'lucas';

-- COMANDOS PARA CRIAÇÃO E EXEMPLO DE USO DA VIEW --

CREATE VIEW ViewClientesCompras AS
SELECT
    cliente.idcliente,
    cliente.nome,
    compras.valor
FROM bd4.cliente AS cliente
JOIN bd4.compras AS compras
 ON cliente.idcliente = compras.idcliente;
 
-- COMANDOS PARA CRIAÇÃO E EXEMPLO DE USO DA FUNÇÃO --
USE `bd4`;
DROP function IF EXISTS `soma`;

DELIMITER $$
USE `bd4`$$
CREATE FUNCTION `soma` ()
RETURNS INTEGER
BEGIN
 SELECT SUM(num_compras)
    FROM bd4.cliente;
END$$

DELIMITER ;



-- COMANDOS PARA CRIAÇÃO E EXEMPLO DE USO DA STORED PROCEDURE --

CREATE DEFINER=`root`@`localhost` PROCEDURE `cliente_cidade`()
BEGIN
SELECT *
    FROM clientes
    WHERE idcidade = 2;
END
DELIMITER ;
 

-- COMANDOS PARA CRIAÇÃO E EXEMPLO DE USO DA TRIGGER --

DELIMITER //
 
CREATE TRIGGER borracha AFTER INSERT ON compras
FOR EACH ROW
BEGIN
DELETE FROM compras;
END //
 
DELIMITER ;


