CREATE DATABASE provalbd; 
USE provalbd;
SET SQL_SAFE_UPDATES = 0; -- Desativa o modo seguro
SET SQL_SAFE_UPDATES = 1; -- Reativa o modo seguro

CREATE TABLE produtos (
    ID_NF INT,
    ID_ITEM INT,
    COD_PROD INT,
    VALOR_UNIT DECIMAL(10,2),
    QUANTIDADE INT,
    DESCONTO INT,
    PRIMARY KEY (ID_NF, ID_ITEM)
);

INSERT INTO produtos (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) VALUES
(1, 1, 1, 25.00, 10, 5),
(1, 2, 2, 13.50, 3, NULL),
(1, 3, 3, 15.00, 2, NULL),
(1, 4, 4, 10.00, 1, NULL),
(1, 5, 5, 30.00, 1, NULL),
(2, 1, 3, 15.00, 4, NULL),
(2, 2, 4, 10.00, 5, NULL),
(2, 3, 5, 30.00, 7, NULL),
(3, 1, 1, 25.00, 5, NULL),
(3, 2, 4, 10.00, 4, NULL),
(3, 3, 5, 30.00, 5, NULL),
(3, 4, 2, 13.50, 7, NULL),
(4, 1, 5, 30.00, 10, 15),
(4, 2, 4, 10.00, 12, 5),
(4, 3, 1, 25.00, 13, 5),
(4, 4, 2, 13.50, 15, 5),
(5, 1, 3, 15.00, 3, NULL),
(5, 2, 5, 30.00, 6, NULL),
(6, 1, 1, 25.00, 22, 15),
(6, 2, 3, 15.00, 25, 20),
(7, 1, 1, 25.00, 10, 3),
(7, 2, 2, 13.50, 10, 4),
(7, 3, 3, 15.00, 10, 4),
(7, 4, 5, 30.00, 10, 1);

SELECT * FROM produtos;

-- Pesquise os itens que foram vendidos sem desconto. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT.
SELECT 
    id_nf, id_item, cod_prod, valor_unit
FROM
    produtos
WHERE
    desconto IS NULL;
    
-- Pesquise os itens que foram vendidos com desconto. As colunas presentes no resultado da consulta são:
-- ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT E O VALOR VENDIDO. OBS: O valor vendido é igual ao VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100))
SELECT 
    ID_NF,
    ID_ITEM,
    COD_PROD,
    VALOR_UNIT,
    FORMAT(VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100)),2) AS 'VALOR_VENDIDO'
FROM
    produtos
WHERE
    desconto IS NOT NULL;

-- Altere o valor do desconto (para zero) de todos os registros onde este campo é nulo.
UPDATE produtos 
SET 
    desconto = 0
WHERE
    desconto IS NULL;
    
-- Pesquise os itens que foram vendidos. As colunas presentes no resultado da consulta são:  ID_NF,  ID_ITEM,  COD_PROD,  VALOR_UNIT,  VALOR_TOTAL,  DESCONTO,
-- VALOR_VENDIDO. OBS: O VALOR_TOTAL é obtido pela fórmula: QUANTIDADE * VALOR_UNIT. O VALOR_VENDIDO é igual a VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)).

SELECT 
    ID_NF,
    ID_ITEM,
    COD_PROD,
    VALOR_UNIT,
    (QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL,
    DESCONTO,
    FORMAT((VALOR_UNIT - (VALOR_UNIT * IFNULL(DESCONTO, 0) / 100)),2) AS VALOR_VENDIDO -- Se for nulo, multiplica por 0
FROM 
    produtos
ORDER BY 
    ID_NF, ID_ITEM;

-- Pesquise o valor total das NF e ordene o resultado do maior valor para o menor. As colunas presentes no resultado da consulta são: ID_NF, VALOR_TOTAL.
-- OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. O VALOR_VENDIDO é igual a ∑ VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)). Agrupe o resultado da consulta por ID_NF.
SELECT 
    ID_NF, 
    SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL,
    FORMAT(SUM(QUANTIDADE * (VALOR_UNIT - (VALOR_UNIT * IFNULL(DESCONTO, 0) / 100))),2) AS VALOR_DESCONTO
FROM
    PRODUTOS
GROUP BY ID_NF
ORDER BY VALOR_TOTAL DESC;

-- Consulte o produto que mais vendeu no geral. As colunas presentes no resultado da consulta são: COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por COD_PROD.
SELECT 
    COD_PROD, SUM(QUANTIDADE) AS QUANTIDADE_TOTAL
FROM
    PRODUTOS
GROUP BY COD_PROD
ORDER BY QUANTIDADE_TOTAL DESC
LIMIT 1;

-- Consulte as NF que foram vendidas mais de 10 unidades de pelo menos um produto.
-- As colunas presentes no resultado da consulta são: ID_NF, COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por ID_NF, COD_PROD.
SELECT 
    ID_NF, COD_PROD, QUANTIDADE
FROM
    PRODUTOS
WHERE QUANTIDADE > 10
GROUP BY ID_NF, COD_PROD, QUANTIDADE
ORDER BY ID_NF, COD_PROD;

-- Pesquise o valor total das NF, onde esse valor seja maior que 500, e ordene o resultado do maior valor para o menor.
-- As colunas presentes no resultado da consulta são: ID_NF, VALOR_TOT. OBS: O VALOR_TOTAL é obtido pela fórmula:
-- ∑ QUANTIDADE * VALOR_UNIT. Agrupe o resultado da consulta por ID_NF.
SELECT 
    ID_NF,
    FORMAT(SUM(QUANTIDADE * VALOR_UNIT), 2) AS VALOR_TOTAL
FROM
    PRODUTOS
GROUP BY ID_NF
HAVING SUM(QUANTIDADE * VALOR_UNIT) > 500 -- WHERE filtra LINHAS INDIVIDUAIS antes da agregação, HAVING filtra GRUPOS após a agregação
ORDER BY VALOR_TOTAL DESC;

-- Qual o valor médio dos descontos dados por produto. As colunas presentes no resultado da consulta são: COD_PROD, MEDIA. Agrupe o resultado da consulta por COD_PROD.
SELECT 
    COD_PROD, AVG(DESCONTO) AS MEDIA
FROM
    produtos
WHERE
    DESCONTO IS NOT NULL
GROUP BY COD_PROD
ORDER BY COD_PROD;

-- Qual o menor, maior e o valor médio dos descontos dados por produto.
-- As colunas presentes no resultado da consulta são: COD_PROD, MENOR, MAIOR, MEDIA. Agrupe o resultado da consulta por COD_PROD.
SELECT 
    COD_PROD, 
    MIN(DESCONTO) AS MENOR,
    MAX(DESCONTO) AS MAIOR,
    AVG(DESCONTO) AS MEDIA
FROM
    produtos
WHERE
    DESCONTO IS NOT NULL
GROUP BY COD_PROD
ORDER BY COD_PROD;

-- Quais as NF que possuem mais de 3 itens vendidos. As colunas presentes no resultado da consulta são: ID_NF, QTD_ITENS. 
-- OBS: NÃO ESTÁ RELACIONADO A QUANTIDADE VENDIDA DO ITEM E SIM A QUANTIDADE DE ITENS POR NOTA FISCAL. Agrupe o resultado da consulta por ID_NF.
SELECT 
    ID_NF, COUNT(ID_ITEM) AS QTD_ITENS
FROM
    produtos
GROUP BY ID_NF
HAVING COUNT(ID_ITEM) > 3;
