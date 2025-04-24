CREATE SCHEMA escola;
USE escola;

CREATE TABLE aluno(
ra VARCHAR(6),
nome VARCHAR(10),
nascimento DATE,
PRIMARY KEY (ra));

USE escola;
INSERT INTO aluno(ra, nome, nascimento)
VALUES('123456', 'Ana', '1972/01/10');
INSERT INTO aluno(ra, nome, nascimento)
VALUES('123457', 'Bianca', '1973/02/11');
INSERT INTO aluno(ra, nome, nascimento)
VALUES('123458', 'Carla', '1987/12/12');
INSERT INTO aluno(ra, nome, nascimento)
VALUES('123459', 'Danilo', '1990/10/02');
INSERT INTO aluno(ra, nome, nascimento)
VALUES('123460', 'Eliana', '1987/01/01');

CREATE TABLE curso(
codigo VARCHAR(1),
nome VARCHAR(10),
ch VARCHAR(3),
inicio DATE,
termino DATE,
PRIMARY KEY(codigo));

INSERT INTO curso(codigo, nome, ch, inicio, termino)
VALUES('1', 'java', '360', '2007/12/01', '2008/10/10');
INSERT INTO curso(codigo, nome, ch, inicio, termino)
VALUES('2', 'auto cad', '60', '2008/01/10', '2008/05/10');
INSERT INTO curso(codigo, nome, ch, inicio, termino)
VALUES('3', 'php', '90', '2008/02/15', '2008/07/10');
INSERT INTO curso(codigo, nome, ch, inicio, termino)
VALUES('4', 'redes', '60', '2008/01/20', '2008/03/20');

CREATE TABLE matricula(
curso VARCHAR(1),
ra VARCHAR(6),
data_matricula DATE,
valor DECIMAL (5,2));

INSERT INTO matricula(curso, ra, data_matricula, valor)
VALUES('1', '123456', '2007/09/10', 100);
INSERT INTO matricula(curso, ra, data_matricula, valor)
VALUES('3', '123456', '2007/10/01', 60);
INSERT INTO matricula(curso, ra, data_matricula, valor)
VALUES('1', '123457', '2007/09/01', 100);
INSERT INTO matricula(curso, ra, data_matricula, valor)
VALUES('2', '123458', '2008/01/11', 50);
INSERT INTO matricula(curso, ra, data_matricula, valor)
VALUES('2', '123459', '2007/07/20', 50);
INSERT INTO matricula(curso, ra, data_matricula, valor)
VALUES('1', '123460', '2007/08/10', 80);

-- 1. Listar RA, nome do aluno e nome do curso em que o aluno está matriculado.
   SELECT 
	   m.ra,
	   a.nome AS nome_aluno, 
	   c.nome AS nome_curso
   FROM matricula m
   JOIN aluno a ON m.ra = a.ra
   JOIN curso c ON m.curso = c.codigo;

-- 2 Listar RA, nome do aluno e nome do curso em que o aluno está matriculado, ordenado por nome do curso.
SELECT m.ra,
   a.nome AS nome_aluno,
   c.nome AS nome_curso
FROM matricula as m
JOIN aluno as a ON m.ra = a.ra
JOIN curso as c ON m.curso = c.codigo
ORDER BY c.nome;

-- 3. Exibir o nome de cada curso que teve matriculas e quantos alunos tem matriculados em cada um deles (Obs. Usar apelido para o campo do número de alunos).
SELECT 
	c.nome AS nome_curso,
	COUNT(m.ra) AS numero_alunos
FROM curso AS c
JOIN matricula m ON c.codigo = m.curso
GROUP BY c.nome;

-- 4.Exibir o nome de todos os cursos e quantos alunos tem matriculados em cada um (Obs. Caso algum curso não tenha matrículas, exibir número de alunos =0).
SELECT 
	c.nome AS nome_curso,
	COUNT(m.ra) AS numero_alunos
FROM curso AS c
LEFT JOIN matricula AS m ON c.codigo = m.curso
GROUP BY c.nome;

-- 5. Exibir o nome do curso e o valor total recebido das matrículas em cada um deles
SELECT 
	c.nome AS nome_curso,
	SUM(m.valor) AS total_recebido
FROM curso AS c
JOIN matricula m ON c.codigo = m.curso
GROUP BY c.nome;

-- 6. Exibir o nome do curso, o valor total recebido das matrículas em cada um deles e o total arrecadado em matrículas pela escola.
SELECT 
	c.nome AS nome_curso,
	SUM(m.valor) AS total_recebido
FROM curso AS c
JOIN matricula m ON c.codigo = m.curso
GROUP BY c.nome
WITH ROLLUP;

-- 7. Exibir o valor médio pago em matrícula na escola. Chamar a coluna que exibirá a média de valor médio e seu conteúdo deve ser exibido com 2 casas decimais
SELECT 
	CONCAT('R$ ', FORMAT(AVG(valor), 2)) AS valor_medio_escola
FROM matricula;

-- 8. Exibir o nome e o valor médio de matrícula de cada curso. Chamar a coluna que exibirá a média de valor médio e seu conteúdo exibido com 2 casas decimais
SELECT 
	c.nome AS nome_curso,
	CONCAT('R$ ', FORMAT(AVG(m.valor), 2)) AS valor_medio
FROM curso AS c
JOIN matricula m ON c.codigo = m.curso
GROUP BY c.nome;

-- 9. Exibir nome dos cursos que não são VIP ( ou seja que tenha pelo menos 2 alunos) e a quantidade de alunos matriculados em cada um deles.
SELECT 
	c.nome AS nome_curso,
	COUNT(m.ra) AS numero_alunos
FROM curso AS c
JOIN matricula m ON c.codigo = m.curso
GROUP BY c.nome
HAVING COUNT(m.ra) >= 2;

-- 10. Exiba o nome dos cursos com mesma carga horária do curso de auto cad.
SELECT 
	nome
FROM curso
WHERE ch = (
	SELECT ch
	FROM curso
	WHERE nome = 'auto cad'
);

-- 11. Exiba nome de todos os alunos que fazem aniversário no mesmo mês que Ana.
SELECT 
	nome
FROM aluno
WHERE MONTH(nascimento) = (
	SELECT MONTH(nascimento)
	FROM aluno
	WHERE nome = 'Ana'
)
AND nome <> 'Ana';

-- 12. Exiba todos os cursos com início em janeiro de 2008 que tenham alunos matriculados.
SELECT 
	DISTINCT c.nome
FROM curso AS c
JOIN matricula m ON c.codigo = m.curso
WHERE YEAR(c.inicio) = 2008
	AND MONTH(c.inicio) = 1;

-- 13. Exiba todos os cursos com início em janeiro de 2008 independente de ter alunos matriculados ou não.
SELECT 
	nome
FROM curso
WHERE YEAR(inicio) = 2008
	AND MONTH(inicio) = 1;

-- 14. Exiba o nome do aluno e do curso de todos os alunos que fizeram matrícula antes da data de início do curso no qual se matriculou, pois esses vão ganhar um brinde.
-- Observe que a Carla se matriculou no curso de auto cad após o inicio do curso, portanto ela não foi listada e não receberá brinde.
SELECT 
	a.nome AS nome_aluno,
	c.nome AS nome_curso,
	m.data_matricula,
	c.inicio AS data_inicio_curso
FROM matricula m
JOIN aluno a ON m.ra = a.ra
JOIN curso c ON m.curso = c.codigo
WHERE m.data_matricula < c.inicio;


-- 15. Listar os cursos que ainda não iniciaram
SELECT 
	nome
FROM curso
WHERE inicio > CURDATE();

-- 16. Listar os alunos que fizeram matrícula de Sábado pois eles também receberão brindes
SELECT 
	DISTINCT a.nome
FROM matricula m
JOIN aluno a ON m.ra = a.ra
WHERE DAYOFWEEK(m.data_matricula) = 7;

-- 17. Os alunos que fizeram matrícula de Sábado receberão 50% do valor pago na matrícula de volta, 
-- para incentivar essa prática de ir se matricular em cursos sempre aos sábados pois é o dia que a escola tem um plantão de matrícula.
-- Exibir o nome do aluno e o valor a restituir (apelidar a coluna com esse nome, e exibir o valor com 2 casas decimais)
SELECT 
	a.nome AS nome_aluno,
	CONCAT('R$ ', FORMAT(m.valor * 0.50, 2)) AS valor_restituir
FROM matricula m
JOIN aluno a ON m.ra = a.ra
WHERE DAYOFWEEK(m.data_matricula) = 7;

-- 18. Exibir o nome e a idade dos alunos
SELECT 
	nome,
	TIMESTAMPDIFF(YEAR, nascimento, CURDATE()) AS idade
FROM aluno;

-- 19 Listar o nome dos cursos e a duração em meses de cada um, sabendo o seguinte: PERIOD\_DIFF - Retorna a diferença, em meses, entre dois períodos informados. O
-- período deve estar no formato AAAAMM ou AAMM
-- Sintaxe: PERIOD_DIFF(periodo1, periodo2)
-- Exemplo 01: Diferença entre o ano de 2010, mês 02 e o ano 2009, mês 07
-- mysql> SELECT PERIOD_DIFF(201002, 200907); resposta: 7
SELECT 
	nome AS nome_curso,
	PERIOD_DIFF(
		DATE_FORMAT(termino, '%Y%m'),
		DATE_FORMAT(inicio, '%Y%m')
	) AS duracao_meses
FROM curso;
