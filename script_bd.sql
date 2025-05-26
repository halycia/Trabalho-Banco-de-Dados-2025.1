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
    numRestaurante INT,
    nomeCampus VARCHAR(30),
    diasFunc VARCHAR(100),
    capacidade INT,
    PRIMARY KEY (numRestaurante, nomeCampus),
    FOREIGN KEY (nomeCampus) REFERENCES Campus(nome)
);

CREATE TABLE Setor 
( 
    nome VARCHAR(50),
    nomeCampus VARCHAR(30),
    telefone VARCHAR(25) UNIQUE,
    PRIMARY KEY (nome, nomeCampus),
    FOREIGN KEY (nomeCampus) REFERENCES Campus(nome)
);

CREATE TABLE Feedback 
( 
    id SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    texto VARCHAR(500) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    emailUsuario VARCHAR(100) NOT NULL REFERENCES Usuario(email),
    nomeSetor VARCHAR(50) NOT NULL,
    nomeCampus VARCHAR(30) NOT NULL,
    FOREIGN KEY (nomeSetor, nomeCampus) REFERENCES Setor(nome, nomeCampus)
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
    numRestaurante INT,
    nomeCampus VARCHAR(30),
    idCardapio INT,
    PRIMARY KEY (numRestaurante, nomeCampus, idCardapio),
    FOREIGN KEY (numRestaurante, nomeCampus) REFERENCES Restaurante(numRestaurante, nomeCampus),
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

CREATE TABLE Prato 
( 
 kcal_prato INT,  
 icone INT,  
 id INT PRIMARY KEY,  
 tipo INT,  
 nome INT,  
); 

CREATE TABLE Ingredientes 
( 
 nome_ingrediente INT PRIMARY KEY,  
 kcal_ingrediente INT,  
 restrição INT,  
); 

CREATE TABLE Usuario 
( 
 nome INT,  
 username INT,  
 email INT,  
 telefone INT,  
 senha INT,  
 id INT PRIMARY KEY,  
); 

CREATE TABLE Restaurante 
( 
 num_restaurante INT PRIMARY KEY,  
 capacidade INT,  
 dias_func INT,  
 idCampus INT PRIMARY KEY,  
); 

CREATE TABLE Feedback 
( 
 id INT PRIMARY KEY,  
 texto INT,  
 data INT,  
 tipo INT,  
 idUsuario INT,  
 idSetor INT,  
); 

CREATE TABLE Avaliação 
( 
 nota INT,  
 texto INT,  
 id INT PRIMARY KEY,  
 qnt_curtidas INT,  
 data INT,  
 idUsuario INT,  
); 

CREATE TABLE Comentário 
( 
 id INT PRIMARY KEY,  
 data INT,  
 texto INT,  
 qnt_curtidas INT,  
 idUsuario INT,  
 idAvaliação INT,  
); 

CREATE TABLE Cardápio 
( 
 especial INT,  
 status INT,  
 codigo INT PRIMARY KEY,  
 data_inicio INT,  
); 

CREATE TABLE Setor 
( 
 nome_setor INT PRIMARY KEY,  
 idCampus INT PRIMARY KEY,  
); 

CREATE TABLE Campus 
( 
 localizacao INT,  
 nome INT PRIMARY KEY,  
 email INT,  
 telefone INT,  
); 

CREATE TABLE Ingrediente_prato 
( 
 nome_ingrediente INT PRIMARY KEY,  
 id INT,  
); 

CREATE TABLE Cardapio_restaurante 
( 
 num_restaurante INT PRIMARY KEY,  
 codigo INT PRIMARY KEY,  
); 

CREATE TABLE cardapio_prato_avaliacao 
( 
 codigo INT PRIMARY KEY,  
 id INT PRIMARY KEY,  
 id INT PRIMARY KEY,  
); 

ALTER TABLE Restaurante ADD FOREIGN KEY(idCampus) REFERENCES Campus (idCampus)
ALTER TABLE Feedback ADD FOREIGN KEY(idUsuario) REFERENCES Usuario (idUsuario)
ALTER TABLE Feedback ADD FOREIGN KEY(idSetor) REFERENCES Setor (idSetor)
ALTER TABLE Avaliação ADD FOREIGN KEY(idUsuario) REFERENCES Usuario (idUsuario)
ALTER TABLE Comentário ADD FOREIGN KEY(idUsuario) REFERENCES Usuario (idUsuario)
ALTER TABLE Comentário ADD FOREIGN KEY(idAvaliação) REFERENCES Avaliação (idAvaliação)
ALTER TABLE Setor ADD FOREIGN KEY(idCampus) REFERENCES Campus (idCampus)
ALTER TABLE Ingrediente_prato ADD FOREIGN KEY(nome_ingrediente) REFERENCES Ingredientes (nome_ingrediente)
ALTER TABLE Ingrediente_prato ADD FOREIGN KEY(id) REFERENCES Prato (id)
ALTER TABLE Cardapio_restaurante ADD FOREIGN KEY(num_restaurante) REFERENCES Restaurante (num_restaurante)
ALTER TABLE Cardapio_restaurante ADD FOREIGN KEY(codigo) REFERENCES Cardápio (codigo)
ALTER TABLE cardapio_prato_avaliacao ADD FOREIGN KEY(codigo) REFERENCES Cardápio (codigo)
ALTER TABLE cardapio_prato_avaliacao ADD FOREIGN KEY(id) REFERENCES Prato (id)
ALTER TABLE cardapio_prato_avaliacao ADD FOREIGN KEY(id) REFERENCES Avaliação (id)
