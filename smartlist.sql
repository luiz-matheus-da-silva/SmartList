mysql -u root -p
CREATE DATABASE ListaComprasDB;

USE ListaComprasDB;

CREATE TABLE Usuario (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL
);

CREATE TABLE Lista (
    ID_Lista INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data_Criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    ID_Usuario INT,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario) ON DELETE CASCADE
);

CREATE TABLE Item (
    ID_Item INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Categoria VARCHAR(100),
    Preco_Estimado DECIMAL(10, 2) DEFAULT NULL
);

CREATE TABLE Lista_Item (
    ID_Lista_Item INT AUTO_INCREMENT PRIMARY KEY,
    ID_Lista INT,
    ID_Item INT,
    Quantidade INT NOT NULL DEFAULT 1,
    Comprado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (ID_Lista) REFERENCES Lista(ID_Lista) ON DELETE CASCADE,
    FOREIGN KEY (ID_Item) REFERENCES Item(ID_Item) ON DELETE CASCADE
);
