CREATE TABLE Veiculo
(
    idVeiculo INT NOT NULL IDENTITY,
    descricao VARCHAR (30) NOT NULL,
    valor FLOAT (10,2) NOT NULL,
    idModelo INT NOT NULL,
    idFabricante INT NOT NULL,
    idAnoFabricacao INT NOT NULL,
    dataCompra DATE,
    CONSTRAINT pkVeiculo PRIMARY KEY (idVeiculo),
    CONSTRAINT fkVeiculoModelo FOREIGN KEY (idModelo) REFERENCES Modelo (idModelo),
    CONSTRAINT fkVeiculoFabricante FOREIGN KEY (idFabricante) REFERENCES Fabricante (idFabricante),
    CONSTRAINT fkVeiculoAnoFabricacao FOREIGN KEY (idAnoFabricacao) REFERENCES Ano (idAno)
);

CREATE TABLE Modelo
(
    idModelo INT NOT NULL IDENTITY,
    Descricao VARCHAR (30) NOT NULL,
    CONSTRAINT pkModelo PRIMARY KEY (idModelo),
);

CREATE TABLE Fabricante
(
    idFabricante INT NOT NULL IDENTITY,
    Nome VARCHAR (30) NOT NULL,
    cidade VARCHAR (30) NOT NULL,
    endereco VARCHAR (50) NOT NULL,
    UF CHAR (2) NOT NULL,
    telefone VARCHAR(14),
    contato VARCHAR (50),
    CONSTRAINT pkFabricante PRIMARY KEY (idFabricante)
);

CREATE TABLE VendasAnuais
(
    IdVendas INT NOT NULL IDENTITY,
    qtd INT NOT NULL,
    IdVeiculo INT NOT NULL,
    IdAnodaVenda INT NOT NULL,
    idMesdaVenda INT NOT NULL,
    CONSTRAINT pkVendasAnuais PRIMARY KEY (IdVendas),
    CONSTRAINT fkVendasAnuaisVeiculos FOREIGN KEY (IdVeiculo) REFERENCES Veiculo (IdVeiculo),
    CONSTRAINT fkVendasAnuaisAnodaVenda FOREIGN KEY (IdAnodaVenda) REFERENCES Ano (idAno),
    CONSTRAINT fkVendasAnuaisMesdaVenda FOREIGN KEY (idMesdaVenda) REFERENCES Mes (IdMes)
);

CREATE TABLE Mes
(
    IdMes INT NOT NULL IDENTITY,
    mes TINYINT NOT NULL,
    CONSTRAINT pkMes PRIMARY KEY (IdMes)
);

CREATE TABLE Ano
(
    idAno INT NOT NULL IDENTITY,
    ano INT NOT NULL,
    CONSTRAINT pkAno PRIMARY KEY (idAno)
);