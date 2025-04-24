SET sql_mode=(SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
-- CREATE SCHEMA vendas;
-- use vendas;

create table duplicata(
	Nome CHAR(40),
	Numero INTEGER NOT NULL,
	Valor DECIMAL(10,2),
	Vencimento DATE,
	Banco CHAR(10),
	PRIMARY KEY(Numero)
);

-- carga de dados
INSERT INTO duplicata(Nome, Numero, Valor, Vencimento, Banco) VALUES
('abc papelaria', 100100, 5000.00, '2017/01/20', 'itau'),
('livraria fernandes', 100110, 2500.00, '2017/01/22', 'itau'),
('livraria fernandes', 100120, 1500.00, '2016/10/15', 'bradesco'),
('abc papelaria', 100130, 8000.00, '2016/10/15', 'santander');

-- alterar a coluna para aumento de tamanho - varchar reconhece até 255
ALTER TABLE duplicata MODIFY COLUMN Banco VARCHAR(40);

INSERT INTO duplicata(Nome, Numero, Valor, Vencimento, Banco)
VALUES('ler e saber', 200120, 10500.00, '2018/04/26', 'banco do brasil');

INSERT INTO duplicata(Nome, Numero, Valor, Vencimento, Banco) VALUES
('livros e cia', 200125, 2000.00, '2018/04/26', 'banco do brasil'),
('ler e saber', 200130, 11000.00, '2018/09/26', 'itau'),
('papelaria silva', 250350, 1500.00, '2018/01/26', 'bradesco'),
('livros mm', 250360, 500.00, '2018/12/18', 'santander'),
('livros mm', 250370, 3400.00, '2018/04/26', 'santander'),
('papelaria silva', 250380, 3500.00, '2018/04/26', 'banco do brasil'),
('livros e cia', 453360, 1500.00, '2018/06/15', 'itau'),
('livros mm', 453365, 5400.00, '2018/06/15', 'bradesco'),
('papelaria silva', 453370, 2350.00, '2017/12/27', 'itau'),
('livros e cia', 453380, 1550.00, '2017/12/27', 'banco do brasil'),
('abc papelaria', 980130, 4000.00, '2016/12/11', 'itau'),
('papel e afins', 985502, 2500.00, '2016/03/12', 'itau');

UPDATE duplicata
	SET Numero = 985001
	WHERE Numero = 980130;

INSERT INTO duplicata(Nome, Numero, Valor, Vencimento, Banco)
	VALUES('ler e saber', 888132, 2500.00, '2017/03/05', 'itau');


UPDATE duplicata
	SET Banco = 'santander'
	WHERE Numero = 985002;

DELETE FROM duplicata
	WHERE Numero = 888132;	

DELETE FROM duplicata
	WHERE Numero = 985001;

DELETE FROM duplicata
	WHERE Numero = 985502;

INSERT INTO duplicata(Nome, Numero, Valor, Vencimento, Banco) VALUES
	('abc papelaria', 980130, 4000.00, '2016/12/11', 'itau'),
	('livraria fernandes', 770710, 2500.00, '2016/11/15', 'santander'),
	('abc papelaria', 985001, 3000.00, '2016/09/11', 'itau'),
	('papel e afins', 985002, 2500.00, '2016/03/12', 'santander'),
	('ler e saber', 888132, 2500.00, '2017/03/05', 'itau');

-- a ordem da visualização usando o SELECT \* ficará na ordem da PK.
SELECT * FROM duplicata;
SELECT COUNT(*) FROM duplicata;

-- Respostas:
-- 1. Listar nome,vencimento e valor de cada duplicata da tabela.
SELECT Nome, Vencimento, Valor FROM duplicata;

-- 2. Apresentar o número das duplicatas depositadas no banco Itaú
SELECT Banco, Numero FROM duplicata WHERE Banco = 'itau';

-- 3. Apresentar o número de duplicatas depositadas no banco Itaú - quantidade 'count'
SELECT count(*) AS QTDE_Duplicatas_Itau FROM duplicata
	WHERE Banco = 'itau';

-- 4. Quais são as duplicatas (número, vencimento, valor e nome) que vencem no ano de 2017.
SELECT Numero, Vencimento, Valor, Nome FROM duplicata
	WHERE YEAR(Vencimento) = 2017;

-- 5. Apresentar as duplicatas (número, vencimento, valor e nome) que não estão depositadas nos bancos Itaú e Santander.
SELECT Numero, Vencimento, Valor, Nome, Banco
	FROM duplicata
	WHERE Banco NOT IN ('itau', 'santander');

-- 6. Quanto é o valor da divida o cliente PAPELARIA SILVA, e quais são as duplicatas?
SELECT * FROM duplicata WHERE Nome = 'papelaria silva';
SELECT sum(Valor) FROM duplicata WHERE Nome = 'papelaria silva';

-- 7. Retirar da tabela a duplicata 770710 do cliente LIVRARIA FERNANDES, por ter sido devidamente quitada.
SELECT * FROM duplicata WHERE Numero = 770710;
DELETE FROM duplicata WHERE Numero = 770710;

-- 8. Apresentar uma listagem em ordem alfabética por nome do cliente de todos os campos da tabela.
SELECT * FROM duplicata 
	ORDER BY Nome ASC;

-- 9. Apresentar uma listagem em ordem de data de vencimento com o nome do cliente, banco, valor e vencimento.
SELECT Nome, Banco, Valor, Vencimento FROM duplicata 
	ORDER BY Vencimento;

-- 10. As duplicatas do Banco do Brasil foram transferidas para o Santander. Proceder o ajuste dos registros.

SET SQL_SAFE_UPDATES=0;

UPDATE duplicata
	SET Banco = 'santander'
	WHERE Banco = 'banco do brasil';

-- 11. Quais são os clientes que possuem suas duplicatas depositadas no Banco Bradesco?

SELECT Nome, Banco FROM duplicata
	WHERE Banco = 'bradesco';

-- 12. Qual é a previsão de recebimento no período de 01/01/2016 até 31/12/2016?
SELECT sum(Valor) AS soma2016 FROM duplicata 
	WHERE YEAR(Vencimento) = 2016;

SELECT sum(Valor) AS soma2016 FROM duplicata
	WHERE Vencimento >='2016/01/01' AND Vencimento <= '2016/12/31';

-- 13. Quanto a empresa tem para receber no período de 01/08/2016 até 30/08/2016?
SELECT sum(Valor) AS soma2016 FROM duplicata
	WHERE Vencimento >='2016/08/01' AND Vencimento <= '2016/08/30';

SELECT sum(Valor) AS soma2016 FROM duplicata
	WHERE MONTH(Vencimento) = 08 AND YEAR(Vencimento) = 2016;

-- 14. Quais foram os itens adquiridos pelo cliente ABC PAPELARIA?
SELECT * FROM duplicata
	WHERE nome = 'ABC PAPELARIA';

-- 15. Acrescentar uma multa de 15% para todos os títulos que se encontram vencidos no período de 01/01/2016 até 31/12/2016.
SELECT 
    Nome,
	Vencimento, 
    DATEDIFF(CURDATE(), Vencimento) AS QtdeDias,
    SUM(Valor), 
    SUM(Valor * 1.5) AS ValorComMulta 
	FROM duplicata
	WHERE YEAR(Vencimento) = 2016 
	  AND DATEDIFF(CURDATE(), Vencimento) > 0
	GROUP BY Nome, Vencimento;

-- 16. Acrescentar uma multa de 5% para todos os títulos vencidos entre 01/01/2017 e 31/05/2017 que sejam docliente LER E SABER.
SELECT
	Nome, 
	CONCAT('R$ ', FORMAT(SUM(VALOR), 2)) AS Valor_Vencido, 
	DATE_FORMAT(Vencimento, '%d/%m/%Y') AS Vencimento,
	DATEDIFF(CURDATE(), Vencimento) AS Qtde_Dias_Vencido,
	FORMAT(SUM(Valor * 1.05), 2) AS Valor_Com_Multa 
FROM duplicata
WHERE Nome = 'ler e saber' 
  AND MONTH(Vencimento) BETWEEN 1 AND 5 
  AND YEAR(Vencimento) = 2017
GROUP BY Nome, Vencimento;

-- 17. Qual é a média aritmética dos valores das duplicatas do ano de 2016?
SELECT CONCAT('R$ ', FORMAT(AVG(Valor), 2)) AS Média_Valores_2016 FROM duplicata
WHERE YEAR(Vencimento) = 2016; 

-- 18. Exiba as duplicatas e nome dos respectivos clientes que possuem duplicatas com valor superior a 10000,00?
SELECT 
	Nome, 
	Numero, 
	CONCAT('R$ ', FORMAT(Valor, 2)) AS Valor, 
	DATE_FORMAT(Vencimento, '%d/%m/%Y') AS Vencimento,
	Banco 
FROM duplicata
WHERE valor > 10000;

-- 19. Qual o valor total das duplicatas lançadas para o banco Santander?
SELECT CONCAT('R\$ ', FORMAT(SUM(valor), 2)) AS Valor_Total, UCASE(Banco) AS Banco FROM duplicata
	WHERE Banco = 'santander'
	GROUP BY Banco;

-- 20. Quais são os clientes que possuem suas duplicatas depositadas nos Bancos Bradesco ou Itaú?
SELECT Nome, Banco FROM duplicata
WHERE Banco = 'itau' OR Banco = 'bradesco';
