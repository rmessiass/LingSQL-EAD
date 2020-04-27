CREATE DATABASE PROJETO;

USE PROJETO;

CREATE TABLE Modelo
(
    idModelo INT IDENTITY,
    Descricao VARCHAR (30) NOT NULL,
    CONSTRAINT pkModelo PRIMARY KEY (idModelo)
);


CREATE TABLE Mes
(
    IdMes INT IDENTITY,
    mes TINYINT NOT NULL,
    CONSTRAINT pkMes PRIMARY KEY (IdMes),
    CONSTRAINT ckMes CHECK (mes BETWEEN 1 AND 12) 
);


CREATE TABLE Ano
(
    idAno INT IDENTITY,
    ano SMALLINT NOT NULL,
    CONSTRAINT pkAno PRIMARY KEY (idAno),
    CONSTRAINT ckAno CHECK (ano BETWEEN 1900 and YEAR(GETDATE()))
);


CREATE TABLE Fabricante
(
    idFabricante INT IDENTITY,
    Nome VARCHAR (30) NOT NULL,
    cidade VARCHAR (30) NOT NULL,
    endereco VARCHAR (50) NOT NULL,
    UF CHAR (2) NOT NULL,
    telefone VARCHAR(14),
    contato VARCHAR (50),
    CONSTRAINT pkFabricante PRIMARY KEY (idFabricante),
    CONSTRAINT cktelefone CHECK (telefone LIKE '([0-9][0-9]) [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
                                OR telefone LIKE '([0-9][0-9]) [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') 
);


CREATE TABLE Veiculo
(
    idVeiculo INT IDENTITY,
    descricao VARCHAR (30) NOT NULL,
    valor DECIMAL (10,2) NOT NULL,
    idModelo INT NOT NULL,
    idFabricante INT NOT NULL,
    idAnoFabricacao INT NOT NULL,
    dataCompra DATE,
    CONSTRAINT pkVeiculo PRIMARY KEY (idVeiculo),
    CONSTRAINT fkVeiculoModelo FOREIGN KEY (idModelo) REFERENCES Modelo (idModelo),
    CONSTRAINT fkVeiculoFabricante FOREIGN KEY (idFabricante) REFERENCES Fabricante (idFabricante),
    CONSTRAINT fkVeiculoAnoFabricacao FOREIGN KEY (idAnoFabricacao) REFERENCES Ano (idAno)
);


CREATE TABLE VendasAnuais
(
    IdVendas INT IDENTITY,
    qtd INT NOT NULL,
    IdVeiculo INT NOT NULL,
    IdAnodaVenda INT NOT NULL,
    idMesdaVenda INT NOT NULL,
    CONSTRAINT pkVendasAnuais PRIMARY KEY (IdVendas),
    CONSTRAINT fkVendasAnuaisVeiculos FOREIGN KEY (IdVeiculo) REFERENCES Veiculo (IdVeiculo),
    CONSTRAINT fkVendasAnuaisAnodaVenda FOREIGN KEY (IdAnodaVenda) REFERENCES Ano (idAno),
    CONSTRAINT fkVendasAnuaisMesdaVenda FOREIGN KEY (idMesdaVenda) REFERENCES Mes (IdMes)
);
