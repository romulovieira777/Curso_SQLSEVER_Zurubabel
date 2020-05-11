--Selecionando o Baqnco de Dados
USE Aula_SQL_2020_Z;

--Criando Tabelas

DROP TABLE IF EXISTS Clientes;
CREATE TABLE Clientes (
	cdCliente INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	dataNascimento DATE,
	sexo CHAR(1)
);

DROP TABLE IF EXISTS Carros;
CREATE TABLE Carros (
	cdCarro INT PRIMARY KEY,
	nomeModelo VARCHAR(50) NOT NULL,
	nomeFabricante VARCHAR(50) NOT NULL,
	anoModelo INT NOT NULL,
	cdCliente INT NOT NULL --FOREIGN KEY REFERENCES Clientes (cdCliente)
);

ALTER TABLE Carros
ADD CONSTRAINT FK_Carros_Clientes
FOREIGN KEY (cdCliente)
REFERENCES Clientes (cdCliente);

DROP TABLE IF EXISTS Servicos;
CREATE TABLE Servicos (
	cdServico INT PRIMARY KEY,
	cdCarro INT NOT NULL, --FOREIGN KEY REFERENCES Carros (cdCarro) NOT NULL,
	dataEntrada DATE NOT NULL,
	dataSaida DATE
);

ALTER TABLE Servicos
ADD CONSTRAINT FK_ServicosCarros
FOREIGN KEY (cdCarro)
REFERENCES Carros (cdCarro);

DROP TABLE IF EXISTS Pecas;
CREATE TABLE Pecas (
	cdPeca INT PRIMARY KEY,
	cdManutencao INT NULL, --FOREIGN KEY REFERENCES Manutencoes (cdManutencao),
	nome VARCHAR(50) NOT NULL,
	valorCompra FLOAT,
	valorVenda FLOAT
);

ALTER TABLE Pecas
ADD CONSTRAINT FK_PecasManutencoes
FOREIGN KEY (cdCarro)
REFERENCES Manutencoes (cdManutencao);

DROP TABLE IF EXISTS Manutencoes;
CREATE TABLE Manutencoes (
	cdManutencao INT PRIMARY KEY,
	dataManutencao DATE NOT NULL,
	nome VARCHAR(50) NOT NULL	
);

DROP TABLE IF EXISTS Manutencoes_Pecas;
CREATE TABLE Manutencoes_Pecas (
	cdManutencao INT NOT NULL FOREIGN KEY REFERENCES Manutencoes (cdManutencao),
	cdPeca INT NOT NULL FOREIGN KEY REFERENCES Pecas (cdPeca) 
);

DROP TABLE IF EXISTS Manutencoes_servicos;
CREATE TABLE Manutencoes_servicos (
	cdManutencao INT NOT NULL FOREIGN KEY REFERENCES Manutencoes (cdManutencao),
	cdServico INT NOT NULL FOREIGN KEY REFERENCES Servicos (cdServico)
);

-- Inserindo Dados

INSERT INTO Clientes (
	cdCliente,
	nome,
	dataNascimento,
	sexo
) 
Values (
	1,
	'Romulo',
	'1978-02-03',
	'M'
), 
(
	2,
	'Manoel',
	'1987-05-10',
	'M'
);

INSERT INTO Carros (
	cdCarro,
	nomeModelo,
	nomeFabricante,
	anoModelo,
	cdCliente
)
VALUES (
	1,
	'Corsa',
	'Chevrolet',
	'2005',
	1
),
(
	2,
	'Tucson',
	'Hyundai',
	'2008',
	2
);
