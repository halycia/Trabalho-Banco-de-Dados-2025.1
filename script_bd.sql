CREATE TABLE Prato
(
    nome VARCHAR(90) PRIMARY KEY,
    kcalPrato FLOAT,
    icone BYTEA
);


CREATE TABLE Ingrediente
(
    nome VARCHAR(40) PRIMARY KEY,
    kcal_ingrediente FLOAT,
    restricao VARCHAR(50)
);


CREATE TABLE Usuario
(
    email VARCHAR(100) PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    telefone VARCHAR(25)
);


CREATE TABLE Campus
(
    nome VARCHAR(30) PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(25),
    endereco VARCHAR(200) UNIQUE NOT NULL
);


CREATE TABLE Restaurante
(
    id SERIAL PRIMARY KEY, 
    numRestaurante INT NOT NULL,
    diasFunc VARCHAR(100),
    capacidade INT,
    nomeCampus VARCHAR(30) NOT NULL REFERENCES Campus(nome),
    UNIQUE (numRestaurante, nomeCampus)
);


CREATE TABLE Setor
(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    telefone VARCHAR(25) UNIQUE,
    nomeCampus VARCHAR(30) NOT NULL REFERENCES Campus(nome),
    UNIQUE (nome, nomeCampus)
);


CREATE TABLE Feedback
(
    id SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    texto VARCHAR(500) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    idSetor NOT NULL REFERENCES Setor(id),
    emailUsuario VARCHAR(100) NOT NULL REFERENCES Usuario(email)
);


CREATE TABLE Avaliacao
(
    id SERIAL PRIMARY KEY,
    qntCurtidas INT DEFAULT 0,
    dataAvaliacao DATE NOT NULL,
    refeicao VARCHAR(50) NOT NULL,
    dataConsumo DATE NOT NULL,
    nota INT NOT NULL,
    texto VARCHAR(500) NOT NULL,
    emailUsuario VARCHAR(100) NOT NULL REFERENCES Usuario(email),
    nomePrato VARCHAR(100) NOT NULL REFERENCES Prato(nome)
);


CREATE TABLE Comentario
(
    id SERIAL PRIMARY KEY,
    texto VARCHAR(500) NOT NULL,
    data DATE NOT NULL,
    qntCurtidas INT DEFAULT 0,
    idAvaliacao INT NOT NULL REFERENCES Avaliacao(id),
    emailUsuario VARCHAR(100) NOT NULL REFERENCES Usuario(email)
);


CREATE TABLE Cardapio
(
    id SERIAL PRIMARY KEY,
    dataInicio DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    especial VARCHAR(40)
);


CREATE TABLE Ingrediente_Prato
(
    nomeIngrediente VARCHAR(40),
    nomePrato VARCHAR(90),
    PRIMARY KEY (nomeIngrediente, nomePrato),
    FOREIGN KEY (nomeIngrediente) REFERENCES Ingrediente(nome),
    FOREIGN KEY (nomePrato) REFERENCES Prato(nome)
);


CREATE TABLE Cardapio_Restaurante
(
    idRestaurante INT,
    idCardapio INT,
    PRIMARY KEY (idRestaurante, idCardapio),
 FOREIGN KEY (idRestaurante) REFERENCES Restaurante(id),
    FOREIGN KEY (idCardapio) REFERENCES Cardapio(id)
);


CREATE TABLE Cardapio_Prato
(
    idCardapio INT,
    nomePrato VARCHAR(90),
    refeicao VARCHAR(50) NOT NULL,
    PRIMARY KEY (idCardapio, nomePrato),
    FOREIGN KEY (idCardapio) REFERENCES Cardapio(id),
    FOREIGN KEY (nomePrato) REFERENCES Prato(nome)
);
