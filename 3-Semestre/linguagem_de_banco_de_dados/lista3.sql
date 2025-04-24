
CREATE SCHEMA longa_vida;

USE longa_vida;
CREATE TABLE plano(
Numero CHAR(2) NOT NULL,
Descricao CHAR(30),
Valor DECIMAL(10,2),
PRIMARY KEY (Numero));

USE longa_vida;
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('B1', 'BASICO 1', 200);
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('B2', 'BASICO 2', 150);
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('B3', 'BASICO 3', 100);
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('E1', 'EXECUTIVO 1', 350);
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('E2', 'EXECUTIVO 2', 300);
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('E3', 'EXECUTIVO 3', 250);
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('M1', 'MASTER 1', 500);
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('M2', 'MASTER 2', 450);
INSERT INTO plano(Numero, Descricao, Valor)
VALUES('M3', 'MASTER 3', 500);

CREATE TABLE associado(Plano CHAR(2) NOT NULL,
Nome CHAR(40) NOT NULL,
Endereço CHAR(35),
Cidade CHAR(20),
Estado CHAR(2),
CEP CHAR(9),
PRIMARY KEY(Nome)
);

USE longa_vida;
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('B1', 'JOSE ANTONIO DA SILVA', 'R. FELIPE DO AMARAL, 3450', 'COTIA', 'SP', '06700-000');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('B1', 'MARIA DA SILVA SOBRINHO', 'R. FELIPE DE JESUS, 1245', 'DIADEMA', 'SP', '09960-170');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('B1', 'PEDRO JOSE DE OLIVEIRA', 'R. AGRIPINO DIAS, 155', 'COTIA', 'SP', '06700-011');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('B2', 'ANTONIA DE FERNANDES', 'R. PE EZEQUIEL, 567', 'DIADEMA', 'SP', '09960-175');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('B2', 'ANTONIO DO PRADO', 'R. INDIO TABAJARA, 55', 'GUARULHOS', 'SP', '07132-999');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('B3', 'WILSON SENA', 'R. ARAPIRACA, 1234', 'OSASCO', 'SP', '06293-001');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('B3', 'SILVIA DE ABREU', 'R. DR JOAO DA SILVA, 5', 'SANTO ANDRE', 'SP', '09172-112');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('E1', 'ODETE DA CONCEICAO', 'R. VOLUNTARIOS DA PATRIA, 10', 'SAO PAULO', 'SP', '02010-550');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('E2', 'JOAO CARLOS MACEDO', 'R. VISTA ALEGRE, 500', 'SAO PAULO', 'SP', '04343-990');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('E3', 'CONCEICAO DA SILVA', 'AV. VITORINO DO AMPARO, 11', 'MAUA', 'SP', '09312-998');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('E3', 'PAULO BRUNO AMARAL', 'R. ARGENZIO BRILHANTE, 88', 'BARUERI', 'SP', '06460-990');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('E3', 'WALDENICE DE OLIVEIRA', 'R. OURO VELHO, 12', 'BARUERI', 'SP', '06460-998');

UPDATE associado
SET CEP = '06460-999'
WHERE Nome = 'PAULO BRUNO AMARAL';

INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('E3', 'MARCOS DO AMARAL', 'R. DO OUVIDOR, 67', 'GUARULHOS', 'SP', '07031-555');
INSERT INTO associado(Plano, Nome, Endereço, Cidade, Estado, CEP)
VALUE ('E3', 'MURILO DE SANTANA', 'R.PRATA DA CASA', 'BARUERI', 'SP', '06455-111');

UPDATE associado
SET Endereço = 'R. PRATA DA CASA'
WHERE Nome = 'MURILO DE SANTANA';

ALTER TABLE associado
RENAME COLUMN Endereço TO Endereco;

UPDATE associado
SET Plano = 'M1'
WHERE Nome = 'MURILO DE SANTANA';

INSERT INTO associado(Plano, Nome, Endereco, Cidade, Estado, CEP)
VALUE ('M1', 'LUIZA ONOFRE FREITAS', 'R. VICENTE DE ABREU, 55', 'SANTO ANDRE', 'SP', '09060-667');
INSERT INTO associado(Plano, Nome, Endereco, Cidade, Estado, CEP)
VALUE ('M2', 'MELISSA DE ALMEIDA', 'R. FERNANDO ANTONIO, 2345', 'SAO PAULO', 'SP', '04842-987');
INSERT INTO associado(Plano, Nome, Endereco, Cidade, Estado, CEP)
VALUE ('M2', 'JOAO INACIO DA CONCEICAO', 'R. PENELOPE CHARMOSA, 34', 'SUZANO', 'SP', '08670-888');
INSERT INTO associado(Plano, Nome, Endereco, Cidade, Estado, CEP)
VALUE ('B3', 'AUGUSTA DE ABREU', 'AV. RIO DA SERRA, 909', 'SANTO ANDRE', 'SP', '09061-333');
INSERT INTO associado(Plano, Nome, Endereco, Cidade, Estado, CEP)
VALUE ('B3', 'ILDA DE MELO DA CUNHA', 'AV. POR DO SOL, 546', 'SANTO ANDRE', 'SP', '09199-444');
INSERT INTO associado(Plano, Nome, Endereco, Cidade, Estado, CEP)
VALUE ('B3', 'MARCOS DA CUNHA', 'AV. PEDROSO DE MORAES, 546', 'SAO PAULO', 'SP', '04040-444');

SELECT * FROM associado;







-- 1.Quais campos das tabelas associado e plano 1. Quais campos das tabelas associado e plano devem ser util izados para efetuar o relacionamento entre as tabelas?

-- reposta: campo "Plano"

-- 2. Extrair uma relação geral de todos os associados e os planos que eles possuem.
-- relação geral de todos os associados e os planos que eles possuem.

USE longa_vida;
	SELECT * FROM plano AS p
	INNER JOIN associado AS a 
	ON a.plano = p.Numero;

-- 3. Quantos associados possuem o plano B1?

SELECT count(Plano) AS QTDE_B1 
	FROM associado
	WHERE Plano = "B1";

-- 4. Apresente uma relação com todos os nomes, planos e valores de todos os
-- registros de associados.

SELECT a.Nome, a.Plano, concat('R$', Format(p.valor,2))
	AS Valor FROM associado AS a
	LEFT JOIN plano AS p
	ON a.Plano = p.Numero;

-- 5. Quais são os associados que moram em COTIA ou em DIADEMA?

SELECT * FROM associado
	WHERE Cidade IN ('COTIA', 'DIADEMA');

-- 6. Apresente o nome, plano e valor dos associados que moram em BARUERI e possuem o plano M1.

SELECT a.Nome, a.Plano, concat('R$', Format(p.Valor,2)) AS Valor
	FROM associado AS a
	LEFT JOIN plano AS p
	ON a.Plano = p.Numero
	WHERE a.Cidade = 'BARUERI' and a.Plano = 'M1';

-- 7. Apresente uma relação com nome, plano e valor de todos os associados residente em São Paulo.

SELECT a.Nome, a.Plano, concat('R$', Format(p.Valor,2)) AS Valor
	FROM associado AS a
	left join plano AS p 
	on a.Plano = p.Numero
	WHERE a.Cidade = 'SAO PAULO';

-- 8. Apresente uma relação completa de todos os campos de ambas as tabelas em que o associado possua SILVA no nome.

SELECT * FROM associado 
	WHERE Nome LIKE '%silva%';

-- 9. Devido ao aumento do índice IGPM, a empresa reajustou os valores dos planos básicos em 10%, dos planos.

UPDATE plano
	SET Valor = Valor * 1.10
	WHERE Numero LIKE 'B%';

-- 10. O associado PEDRO JOSE DE OLIVEIRA alterou seu plano de B1 para E3. Faça a devida atualização.

UPDATE associado
	SET Plano = 'E3'
	WHERE Nome = 'PEDRO JOSE DE OLIVEIRA';

SELECT Nome, Plano FROM associado 
	WHERE Nome = 'PEDRO JOSE DE OLIVEIRA';

-- 11. Quantos associados possuem o plano E3?

SELECT COUNT(*) AS QTDE_E3 
	FROM associado 
	WHERE Plano = 'E3';

-- 12. Liste o nome e o valor de todos os associados
SELECT a.nome, p.valor FROM associado AS a
	INNER JOIN plano AS p
    ON a.plano = p.numero;

-- 13. Quais são os associados que possuem plano do tipo EXECUTIVO, independentemente da categoria ser 1, 2 ou 3?
SELECT * FROM plano AS p
	INNER JOIN associado AS a 
	ON a.plano = p.Numero
    WHERE p.descricao LIKE 'EXECUTIVO%';

-- 14. Quais são os associados que possuem plano dos tipos Básico e Máster?
SELECT * FROM plano AS p
	INNER JOIN associado AS a 
	ON a.plano = p.Numero
    WHERE 
		p.descricao LIKE 'MASTER%' OR
        p.descricao LIKE 'BASICO%';

-- 15. A empresa fechou seu escritório na cidade de SANTO ANDRE e transferiu os cliente para um terceirizado.
-- Remova escritório na cidade de SANTO ANDRE. 
-- Remova da tabela associados todos os registros existentes de associados da cidade de SANTO ANDRE 
SET SQL_SAFE_UPDATES = 0;
DELETE FROM associado
	WHERE cidade = 'SANTO ANDRE';
SELECT * FROM associado
	WHERE cidade = 'SANTO ANDRE';

-- 16. Apresente o nome, plano e valor dos associados que moram em SÃO PAULO e possuem os planos M2 e M3.
-- A listagem deve estar ordenada pelo campo nome.
SELECT a.nome, p.numero, FORMAT(p.valor, 2) AS Valor FROM associado AS a
	INNER JOIN plano AS p
    ON a.plano = p.numero
	WHERE p.numero IN ('M2', 'M3') 
		AND a.cidade = 'SAO PAULO'
	ORDER BY a.nome;

-- 17. Apresente uma listagem completa de todos os campos de ambas as tabelas ordenados por tipo de plano.
SELECT * FROM associado AS a
	INNER JOIN plano AS p
    ON a.plano = p.numero
	ORDER BY p.numero;

-- 18. Faça uma relação geral de todos os associados e planos que eles possuem.
-- A relação deve ser apresentada em ordem ordem ascendente pelo campo tipo de plano e descendente pelo campo de identificação do nome do associado.
SELECT * FROM associado AS a
	INNER JOIN plano AS p
    ON a.plano = p.numero
	ORDER BY p.numero ASC, a.nome DESC;

-- 19. Apresentar uma relação de todos os associados que não possuem o plano Máster.
SELECT * FROM associado AS a
	INNER JOIN plano AS p
    ON a.plano = p.numero
	WHERE p.numero NOT LIKE 'M%';

-- 20. Apresentar uma listagem em ordem crescente pelo campo nome do associado. 
-- Essa listagem deve ser formada pelos campos: Nome da tabela associado e Descrição da tabela Planos
-- em ordem crescente pelo campo nome do associado. 
SELECT a.nome, p.descricao FROM associado AS a
	INNER JOIN plano AS p
    ON a.plano = p.numero
    ORDER BY a.nome;

-- 21.Apresentar uma listagem dos planos que estão situados na faixa de valores de 300 até 500
SELECT * FROM plano
	WHERE valor >= 300 AND valor <= 500;

-- 22. Apresentar uma relação contendo: nome,plano, descrição do plano e valor de todos os associados que tenham em seu nome, 
-- seja na posição que for, a seqüência AMARAL.
SELECT a.nome, p.numero, p.descricao, p.valor FROM associado AS a
	INNER JOIN plano AS p
    ON a.plano = p.numero
    WHERE a.nome LIKE '%AMARAL%';

-- 23. Quais associados residem na cidade de DIADEMA?
SELECT * FROM associado AS a
	INNER JOIN plano AS p
    ON a.plano = p.numero
    WHERE a.cidade = 'DIADEMA';

-- 24. O plano do tipo MASTER teve um reajuste de 6%.
-- Atualize na tabela planos os valores das categorias 1, 2 e 3.
UPDATE plano
	SET Valor = Valor * 1.06
	WHERE Numero LIKE 'M%';
SELECT * FROM plano;

-- 25. Quais são os clientes cujo CEP é iniciado com os valores 09?
SELECT * FROM associado
	WHERE cep LIKE '09%';
