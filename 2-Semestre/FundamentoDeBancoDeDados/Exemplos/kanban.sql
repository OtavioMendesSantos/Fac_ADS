-- Criação do banco de dados
CREATE DATABASE kanban;
-- drop database kanban;
-- Seleciona o banco de dados
USE kanban;

-- Tabela Usuario
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    foto_perfil VARCHAR(255),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ativo BOOLEAN DEFAULT TRUE 
);

-- Tabela Projeto
CREATE TABLE Projeto (
    id_projeto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_criacao DATE,
    data_fim DATE, -- Novo atributo para a data de fim do projeto
    id_usuario INT,
    status ENUM('em andamento', 'concluído', 'cancelado') DEFAULT 'em andamento',
    prioridade ENUM('baixa', 'media', 'alta') DEFAULT 'media',
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) 
);

-- Tabela Status (colunas do Kanban, como "A Fazer", "Em Progresso", "Concluído")
CREATE TABLE Status (
    id_status INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    descricao TEXT, 
    cor VARCHAR(7),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    ativo BOOLEAN DEFAULT TRUE
);

-- Tabela Tarefa
CREATE TABLE Tarefa (
    id_tarefa INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_criacao DATE,
    data_prazo DATE,
    prioridade ENUM('baixa', 'media', 'alta') DEFAULT 'media',
    id_projeto INT,
    id_status INT,
    data_conclusao DATE,
    porcentagem_concluida INT DEFAULT 0, 
    FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto),
    FOREIGN KEY (id_status) REFERENCES Status(id_status)
);

-- Tabela Responsavel (tabela intermediária para permitir múltiplos responsáveis por tarefa)
CREATE TABLE Responsavel (
    id_responsavel INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_tarefa INT NOT NULL,
    data_associacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_tarefa) REFERENCES Tarefa(id_tarefa)
);

-- Tabela Comentario (para comentários nas tarefas)
CREATE TABLE Comentario (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_tarefa INT NOT NULL,
    id_usuario INT NOT NULL,
    texto TEXT NOT NULL,
    data_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('ativo', 'inativo') DEFAULT 'ativo',
    FOREIGN KEY (id_tarefa) REFERENCES Tarefa(id_tarefa),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);
