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
