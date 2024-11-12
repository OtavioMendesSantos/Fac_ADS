-- create database biblioteca // Cria o banco de dados
-- show databases; // Lista os bd disponíveis 
-- use biblioteca; // Seleciona o bd

create table Categoria(
	id_categoria int auto_increment primary key,
	nome varchar(50) not null unique
);

create table Livro(
	ISBN varchar(13) primary key,
    titulo varchar (255) not null,
    autor varchar(255),
    ano_publicacao year,
    quantidade int default 1,
    id_categoria int,
    foreign key (id_categoria) references Categoria(id_categoria)
);

create table Endereco(
	id_endereco int auto_increment primary key,
    logradouro varchar(255) not null,
    cep varchar(8) not null,
    numero varchar(10),
    cidade varchar(60) not null,
    estado varchar(2) not null
);

create table Usuario(
	id_usuario int auto_increment primary key,
    nome varchar(255) not null,
    email varchar(255) unique,
    telefone varchar (15),
    id_endereco int,
    foreign key (id_endereco) references Endereco(id_endereco)
);

create table Emprestimo(
	id_emprestimo int auto_increment primary key,
    id_usuario int not null,
    ISBN varchar(13 ) not null,
    data_emprestimo date not null,
    data_devolucao date, 
    valor_total float, 
    foreign key (id_usuario) references Usuario(id_usuario),
    foreign key (ISBN) references Livro(ISBN)
);

