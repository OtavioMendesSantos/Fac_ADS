-- Crie uma base de dados Universidade com as tabelas a seguir: Alunos (MAT, nome, endereço, cidade)
CREATE DATABASE Universidade;
USE Universidade;

-- Tabela Alunos
CREATE TABLE Alunos (
    MAT INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(100),
    cidade VARCHAR(50)
);

-- Tabela Disciplinas
CREATE TABLE Disciplinas (
    COD_DISC VARCHAR(10) PRIMARY KEY,
    nome_disc VARCHAR(100) NOT NULL,
    carga_hor INT NOT NULL
);

-- Tabela Professores
CREATE TABLE Professores (
    COD_PROF INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(100),
    cidade VARCHAR(50)
);

-- Tabela Turma
CREATE TABLE Turma (
    COD_DISC VARCHAR(10),
    COD_TURMA INT,
    COD_PROF INT,
    ANO INT,
    horario VARCHAR(20),
    PRIMARY KEY (COD_DISC, COD_TURMA, COD_PROF, ANO),
    FOREIGN KEY (COD_DISC) REFERENCES Disciplinas(COD_DISC),
    FOREIGN KEY (COD_PROF) REFERENCES Professores(COD_PROF)
);

-- Tabela Histórico
CREATE TABLE Historico (
    MAT INT,
    COD_DISC VARCHAR(10),
    COD_TURMA INT,
    COD_PROF INT,
    ANO INT,
    frequencia DECIMAL(5,2),
    nota DECIMAL(5,2),
    PRIMARY KEY (MAT, COD_DISC, COD_TURMA, COD_PROF, ANO),
    FOREIGN KEY (MAT) REFERENCES Alunos(MAT),
    FOREIGN KEY (COD_DISC, COD_TURMA, COD_PROF, ANO) REFERENCES Turma(COD_DISC, COD_TURMA, COD_PROF, ANO)
);

-- Inserção de Alunos
INSERT INTO Alunos (MAT, nome, endereco, cidade) VALUES
(2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL'),
(2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA'),
(2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE'),
(2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA'),
(2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL'),
(2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');

-- Inserção de Disciplinas
INSERT INTO Disciplinas (COD_DISC, nome_disc, carga_hor) VALUES
('BD', 'BANCO DE DADOS', 100),
('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', 100),
('WEB', 'AUTORIA WEB', 50),
('ENG', 'ENGENHARIA DE SOFTWARE', 80);
   
-- Inserção de Professores
INSERT INTO Professores (COD_PROF, nome, endereco, cidade) VALUES
(212131, 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA'),
(122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL'),
(192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');

-- Inserção de Turmas
INSERT INTO Turma (COD_DISC, COD_TURMA, COD_PROF, ANO, horario) VALUES
('BD', 1, 212131, 2015, '11H-12H'),
('BD', 2, 212131, 2015, '13H-14H'),
('POO', 1, 192011, 2015, '08H-09H'),
('WEB', 1, 192011, 2015, '07H-08H'),
('ENG', 1, 122135, 2015, '10H-11H');  
   
-- Aluno 1 em todas disciplinas
INSERT INTO Historico (MAT, COD_DISC, COD_TURMA, COD_PROF, ANO, frequencia, nota) VALUES
(2015010101, 'BD', 1, 212131, 2015, 85.5, 7.5),
(2015010101, 'POO', 1, 192011, 2015, 90.0, 8.0),
(2015010101, 'WEB', 1, 192011, 2015, 80.0, 6.5),
(2015010101, 'ENG', 1, 122135, 2015, 95.0, 9.0);

-- Aluno 2 em todas disciplinas
INSERT INTO Historico (MAT, COD_DISC, COD_TURMA, COD_PROF, ANO, frequencia, nota) VALUES
(2015010102, 'BD', 1, 212131, 2015, 75.0, 6.0),
(2015010102, 'POO', 1, 192011, 2015, 85.0, 7.5),
(2015010102, 'WEB', 1, 192011, 2015, 70.0, 5.5),
(2015010102, 'ENG', 1, 122135, 2015, 90.0, 8.5);

-- Aluno 3 em todas disciplinas
INSERT INTO Historico (MAT, COD_DISC, COD_TURMA, COD_PROF, ANO, frequencia, nota) VALUES
(2015010103, 'BD', 2, 212131, 2015, 90.0, 8.0),
(2015010103, 'POO', 1, 192011, 2015, 80.0, 7.0),
(2015010103, 'WEB', 1, 192011, 2015, 85.0, 7.5),
(2015010103, 'ENG', 1, 122135, 2015, 95.0, 9.5);

-- Aluno 4 em todas disciplinas
INSERT INTO Historico (MAT, COD_DISC, COD_TURMA, COD_PROF, ANO, frequencia, nota) VALUES
(2015010104, 'BD', 2, 212131, 2015, 80.0, 7.0),
(2015010104, 'POO', 1, 192011, 2015, 75.0, 6.5),
(2015010104, 'WEB', 1, 192011, 2015, 90.0, 8.0),
(2015010104, 'ENG', 1, 122135, 2015, 85.0, 7.5);

-- Aluno 5 em todas disciplinas
INSERT INTO Historico (MAT, COD_DISC, COD_TURMA, COD_PROF, ANO, frequencia, nota) VALUES
(2015010105, 'BD', 1, 212131, 2015, 95.0, 9.0),
(2015010105, 'POO', 1, 192011, 2015, 90.0, 8.5),
(2015010105, 'WEB', 1, 192011, 2015, 85.0, 7.5),
(2015010105, 'ENG', 1, 122135, 2015, 100.0, 10.0);

-- Aluno 6 em todas disciplinas
INSERT INTO Historico (MAT, COD_DISC, COD_TURMA, COD_PROF, ANO, frequencia, nota) VALUES
(2015010106, 'BD', 2, 212131, 2015, 70.0, 5.0),
(2015010106, 'POO', 1, 192011, 2015, 65.0, 4.5),
(2015010106, 'WEB', 1, 192011, 2015, 75.0, 6.0),
(2015010106, 'ENG', 1, 122135, 2015, 80.0, 7.0);

-- Listar todos alunos
SELECT * FROM Alunos;

-- Ver disciplinas de um aluno específico
SELECT d.nome_disc, h.nota, h.frequencia 
FROM Historico h
JOIN Disciplinas d ON h.COD_DISC = d.COD_DISC
WHERE h.MAT = 2015010101;

-- Calcular média geral por aluno
SELECT a.nome, AVG(h.nota) as media_geral
FROM Historico h
JOIN Alunos a ON h.MAT = a.MAT
GROUP BY a.nome
ORDER BY media_geral DESC;

-- a)	Encontre a MAT dos alunos com nota em BD em 2015 menor que 5 (obs: BD = código da disciplinas).
SELECT 
	h.MAT
FROM Historico h
WHERE h.COD_DISC = 'BD' 
  AND h.ANO = 2015
  AND h.nota < 5;
    
-- b)	Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO em 2015.
SELECT 
    h.MAT,
    a.nome,
    AVG(h.nota) AS media_poo
FROM 
    Historico AS h
JOIN 
    Alunos AS a ON h.MAT = a.MAT
WHERE 
    h.COD_DISC = 'POO' 
    AND h.ANO = 2015
GROUP BY 
    h.MAT, a.nome
ORDER BY 
    media_poo DESC;

-- c)	Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO em 2015 e que esta média seja superior a 6.
SELECT 
    h.MAT, a.nome, AVG(h.nota) AS media_poo
FROM
    Historico AS h
        JOIN
    Alunos AS a ON h.MAT = a.MAT
WHERE
    h.COD_DISC = 'POO' AND h.ANO = 2015
GROUP BY h.MAT , a.nome
HAVING AVG(h.nota) > 6
ORDER BY media_poo DESC;

-- d)	Encontre quantos alunos não são de Natal.
SELECT 
    *
FROM
    Alunos
WHERE
    CIDADE <> 'Natal';
