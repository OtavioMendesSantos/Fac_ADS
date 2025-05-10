SET search_path TO rh;

-- Criação das tabelas
create table Departamento(
    Cod integer,
    Nome varchar(255) not null,
    Endereco varchar(500),
    Orcamento decimal,
    GCPF integer,
    Inicio Date,
    Primary Key (Cod)
);

-- Altere o tipo de dado da coluna GCPF para char(11)
alter table Departamento 
    alter column GCPF type char(11);

create table Empregado(
    CPF char(11),
    Nome varchar(255) not null,
    Sexo char(1),
    Salario decimal,
    Depto integer not null,
    primary Key (CPF)
);

alter table Departamento 
add foreign key (GCPF) references Empregado(CPF);

alter table Empregado add foreign key (Depto) references Departamento(Cod);

create table Projeto (
    Cod integer,
    Nome varchar(255) not null,
    Endereco varchar(500),
    Orcamento decimal,
    Depto integer not null,
    primary key (Cod)
);

alter table Projeto add foreign key (Depto) references Departamento(Cod);

create table Dependente(
    ECPF char(11),
    Nome varchar(255) not null,
    Parentesto varchar(150),
    Sexo char(1),
    primary key (ECPF,Nome),
    foreign key (ECPF) references Empregado(CPF)
);

create table Participa (
    Empregado char(11),
    Projeto integer,
    Horas Time,
    primary key (Empregado,Projeto),
    foreign key (Empregado) references Empregado(CPF),
    foreign key (Projeto) references Projeto(Cod)
);

-- Massas de dados

-- Dados para Departamento
-- Inserção sem GCPF inicialmente
INSERT INTO Departamento (Cod, Nome, Endereco, Orcamento, Inicio)
VALUES
(1, 'Departamento de TI', 'Av. Tecnológica, 123', 500000.00, '2015-06-01'),
(2, 'Departamento de RH', 'Rua dos Recursos, 456', 300000.00, '2016-08-15'),
(3, 'Departamento de Marketing', 'Av. Comercial, 789', 200000.00, '2018-05-23');

-- Dados para Empregado
INSERT INTO Empregado (CPF, Nome, Sexo, Salario, Depto)
VALUES
('12345678901', 'Carlos Silva', 'M', 4500.00, 1),
('23456789012', 'Ana Pereira', 'F', 3500.00, 2),
('34567890123', 'Luiz Costa', 'M', 5500.00, 3),
('45678901234', 'Julia Souza', 'F', 3800.00, 1),
('56789012345', 'Marcos Oliveira', 'M', 5200.00, 2);

-- Atualize a coluna GCPF de Departamento
UPDATE rh.Departamento SET GCPF = '12345678901' WHERE Cod = 1;
UPDATE rh.Departamento SET GCPF = '23456789012' WHERE Cod = 2;
UPDATE rh.Departamento SET GCPF = '34567890123' WHERE Cod = 3;

-- Dados para Projeto
INSERT INTO Projeto (Cod, Nome, Endereco, Orcamento, Depto)
VALUES
(1, 'Projeto de Automação', 'Rua Inovação, 101', 150000.00, 1),
(2, 'Projeto de Recrutamento', 'Rua Recursos Humanos, 202', 100000.00, 2),
(3, 'Projeto de Lançamento de Produto', 'Av. Comercial, 303', 120000.00, 3);

-- Dados para Dependente
INSERT INTO Dependente (ECPF, Nome, Parentesto, Sexo)
VALUES
('12345678901', 'Pedro Silva', 'Filho', 'M'),
('23456789012', 'Maria Pereira', 'Filha', 'F'),
('34567890123', 'Lucas Costa', 'Filho', 'M'),
('45678901234', 'Beatriz Souza', 'Filha', 'F'),
('56789012345', 'Felipe Oliveira', 'Filho', 'M');

INSERT INTO Dependente (ECPF, Nome, Parentesto, Sexo)
VALUES
('12345678901', 'Ana Silva', 'Esposa', 'F'),
('23456789012', 'Carlos Pereira', 'Marido', 'M'),
('34567890123', 'Juliana Costa', 'Esposa', 'F'),
('45678901234', 'Ricardo Souza', 'Marido', 'M'),
('56789012345', 'Fernanda Oliveira', 'Esposa', 'F');

-- Dados para Participa
INSERT INTO Participa (Empregado, Projeto, Horas)
VALUES
('12345678901', 1, '08:00'),
('23456789012', 2, '06:00'),
('34567890123', 3, '07:00'),
('45678901234', 1, '05:30'),
('56789012345', 2, '06:30');

SELECT * FROM Departamento;
SELECT * FROM Empregado;
SELECT * FROM Projeto;
SELECT * FROM Dependente;
SELECT * FROM Participa;

-- Exercícios
_________________


-- 1. Qual é o nome e CPF de cada empregado?
SELECT nome, cpf FROM empregado;

-- 2. Qual é o nome e valor do orçamento de cada departamento?
SELECT nome, orcamento FROM departamento;

-- 3. Qual é o nome e salário das mulheres que ganham mais de R$ 4200,00?
SELECT 
	nome,
	salario 
FROM 
	empregado
WHERE 
	sexo = 'M' AND
	salario > 4200;

-- 4. Quais os nomes dos departamentos que não possuem gerente?
SELECT 
	nome,
	orcamento 
FROM 
	departamento
WHERE 
	gcpf IS NULL;

-- 5. Qual é o nome de cada empregado e de sua esposa ou marido?
SELECT 
	e.nome as empregado,
	d.nome AS dependente,
	d.parentesto
FROM Dependente AS d
INNER JOIN Empregado AS e
	ON e.cpf = d.ecpf
WHERE 
	d.parentesto IN ('Esposa', 'Marido'); -- nome da coluna escrito errado
	
-- 6. Qual o nome de cada empregado e do departamento onde trabalha
SELECT 
  e.nome AS nome_empregado,
  d.nome AS nome_departamento
FROM 
  empregado as e
INNER JOIN 
  departamento AS d 
  ON e.depto = d.cod;


-- 7. Qual o nome de cada departamento, do seu gerente e a data em que ele se tornou gerente?
SELECT 
  d.Nome AS nome_departamento,
  e.Nome AS nome_gerente,
  d.Inicio AS data_inicio_gerente
FROM 
  Departamento d
INNER JOIN 
  Empregado e ON d.GCPF = e.CPF;

-- 8. Qual o nome de cada projeto e do departamento que o controla?
SELECT 
  p.Nome AS nome_projeto,
  d.Nome AS nome_departamento
FROM 
  Projeto p
INNER JOIN 
  Departamento d ON p.Depto = d.Cod;


-- 9. Qual o nome de cada empregado, seus dependentes e parentesco?
SELECT 
  e.Nome AS nome_empregado,
  dep.Nome AS nome_dependente,
  dep.Parentesto
FROM 
  Empregado e
INNER JOIN 
  Dependente dep ON e.CPF = dep.ECPF;


-- 10. Quais os nomes das esposas dos empregados que trabalham no projeto de automaç˜?
SELECT 
  dep.Nome AS nome_esposa
FROM 
  Dependente dep
INNER JOIN 
  Empregado emp ON dep.ECPF = emp.CPF
INNER JOIN 
  Participa p ON emp.CPF = p.Empregado
INNER JOIN 
  Projeto proj ON p.Projeto = proj.Cod
WHERE 
  dep.Parentesto = 'Esposa'
  AND proj.Nome ILIKE '%automação%';
  