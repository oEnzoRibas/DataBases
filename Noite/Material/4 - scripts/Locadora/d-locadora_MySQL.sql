-- Criar banco de dados e usar ele
CREATE DATABASE IF NOT EXISTS LOCADORA;
USE LOCADORA;

-- Tabela CLIENTE
CREATE TABLE CLIENTE (
    CODCLIENTE INT NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    ENDERECO VARCHAR(50),
    BAIRRO VARCHAR(20),
    CIDADE VARCHAR(50),
    ESTADO CHAR(2),
    PRIMARY KEY (CODCLIENTE)
);

-- Tabela GENERO
CREATE TABLE GENERO (
    CODGENERO INT NOT NULL,
    DESCRICAO VARCHAR(20) NOT NULL,
    PRIMARY KEY (CODGENERO)
);

-- Tabela PRECO
CREATE TABLE PRECO (
    COR CHAR(2) NOT NULL,
    VALOR FLOAT NOT NULL,
    PRIMARY KEY (COR)
);

-- Tabela FITA
CREATE TABLE FITA (
    CODFITA INT NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    COR CHAR(2) NOT NULL,
    STATUS CHAR(1) NOT NULL,
    CODGENERO INT NOT NULL,
    PRIMARY KEY (CODFITA),
    FOREIGN KEY (CODGENERO) REFERENCES GENERO(CODGENERO),
    FOREIGN KEY (COR) REFERENCES PRECO(COR)
);

-- Tabela LOCACAO
CREATE TABLE LOCACAO (
    CODCLIENTE INT NOT NULL,
    DATA DATETIME NOT NULL,
    CODFITA INT NOT NULL,
    DATADEVOLUCAO DATETIME,
    PRIMARY KEY (CODCLIENTE, DATA, CODFITA),
    FOREIGN KEY (CODCLIENTE) REFERENCES CLIENTE(CODCLIENTE),
    FOREIGN KEY (CODFITA) REFERENCES FITA(CODFITA)
);

-- Inserção de dados na tabela PRECO
INSERT INTO PRECO (COR, VALOR) VALUES
('BR', 2.0),
('AZ', 2.5),
('PR', 3.0),
('VD', 3.5),
('AM', 4.0),
('VM', 4.5);

-- Inserção de dados na tabela GENERO
INSERT INTO GENERO (CODGENERO, DESCRICAO) VALUES
(1, 'Romance'),
(2, 'Drama'),
(3, 'Comédia'),
(4, 'Aventura'),
(5, 'Policial'),
(6, 'Suspense'),
(7, 'Guerra'),
(8, 'Ação');

-- Inserção de dados na tabela FITA
INSERT INTO FITA (CODFITA, NOME, COR, CODGENERO, STATUS) VALUES
(200, 'Matrix', 'VM', 8, 'L'),
(210, 'Os Normais', 'AM', 3, 'L'),
(220, 'Titanic', 'VD', 1, 'D'),
(230, 'Guerra nas Estrelas', 'BR', 4, 'L'),
(240, 'À espera de um milagre', 'PR', 6, 'D'),
(250, 'O sexto sentido', 'PR', 6, 'L'),
(260, 'Além da linha vermelha', 'VD', 7, 'D'),
(270, 'Robocop', 'BR', 5, 'I'),
(280, 'O resgate do soldado Rian', 'PR', 7, 'L'),
(290, 'Top Gang', 'PR', 3, 'D');

-- Inserção de dados na tabela CLIENTE
INSERT INTO CLIENTE (CODCLIENTE, NOME, ENDERECO, BAIRRO, CIDADE, ESTADO) VALUES
(100, 'João da Silva', 'Av. Amazonas, 100/101', 'Centro', 'Belo Horizonte', 'MG'),
(110, 'Maria José de Souza', 'Rua Curitiba, 1009/102', 'Centro', 'Belo Horizonte', 'MG'),
(120, 'Antônio Carlos Ferreira', 'Rua Piauí, 200/501', 'Funcionários', 'Belo Horizonte', 'MG'),
(130, 'Patrícia dos Santos', 'Rua Paraíba, 300/902', 'Funcionários', 'Sete Lagoas', 'MG'),
(140, 'Paulo Correia', 'Rua Platina, 400/1002', 'Prado', 'Sete Lagoas', 'MG'),
(150, 'Daniela Marinho', 'Rua Joaquim Xavier, 300/902', 'Penha', 'Rio de Janeiro', 'RJ'),
(160, 'Fabrícia Passos', 'Rua Álvares Cabral, 4000/502', 'Leblon', 'Rio de Janeiro', 'RJ'),
(170, 'Danilo Passos', 'Pça. D. Pedro I, 890/104', 'Ipanema', 'Rio de Janeiro', 'RJ'),
(180, 'Roberto Assunção', 'Av. Tiradentes, 3500/105', 'Centro', 'São Paulo', 'SP'),
(190, 'Sílvia Cordeiro', 'Av. Paulista, 5500/105', 'Centro', 'São Paulo', 'SP'),
(200, 'Ricardo Andrade', 'Rua da Concórdia, 670/205', 'Centro', 'Jacareí', 'SP');

-- Inserção de dados na tabela LOCACAO
INSERT INTO LOCACAO (CODCLIENTE, DATA, CODFITA, DATADEVOLUCAO) VALUES
(100, '2003-01-20', 270, '2003-01-23'),
(110, '2003-03-22', 260, '2003-03-25'),
(110, '2003-10-20', 250, NULL),
(120, '2003-10-05', 230, NULL),
(130, '2003-10-10', 280, NULL),
(140, '2003-01-20', 250, '2003-01-23'),
(150, '2003-01-20', 270, '2003-01-23'),
(150, '2003-02-10', 260, '2003-02-13'),
(150, '2003-09-10', 290, '2003-09-12'),
(160, '2003-07-30', 200, NULL),
(160, '2003-07-30', 210, NULL),
(170, '2003-08-03', 270, '2003-08-10'),
(180, '2003-04-03', 290, '2003-04-05');
