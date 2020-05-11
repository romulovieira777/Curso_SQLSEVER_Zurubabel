--Selecionando o Baqnco de Dados
USE Aula_SQL_2020_Z;

-- Drop das Tabeleas
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Carros;
DROP TABLE IF EXISTS Servicos;
DROP TABLE IF EXISTS Manutencoes;
DROP TABLE IF EXISTS Manutencoes_Pecas;
DROP TABLE IF EXISTS Manutencoes_servicos;
DROP TABLE IF EXISTS Pecas;

--Criando Tabelas

CREATE TABLE Clientes (
	cdCliente INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	dataNascimento DATE,
	sexo CHAR(1)
);

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

CREATE TABLE Pecas (
	cdPeca INT PRIMARY KEY,
	cdManutencao INT NULL, --FOREIGN KEY REFERENCES Manutencoes (cdManutencao),
	cdFornecedor INT NULL,
	nome VARCHAR(50) NOT NULL,
	valorCompra FLOAT,
	valorVenda FLOAT
);

ALTER TABLE Pecas
ADD CONSTRAINT FK_PecasManutencoes
FOREIGN KEY (cdCarro)
REFERENCES Manutencoes (cdManutencao);

--Fornecedor
CREATE TABLE Fornecedores (
	cdFornecedor INT PRIMARY KEY,
	nomeFornecedor VARCHAR(90) NOT NULL,
	dataCadastro DATE
);

ALTER TABLE Pecas
ADD CONSTRAINT FK_PecasFornecedores
FOREIGN KEY (cdFornecedor)
REFERENCES Fornecedores (cdFornecedor);

CREATE TABLE Manutencoes (
	cdManutencao INT PRIMARY KEY,
	dataManutencao DATE NOT NULL,
	nome VARCHAR(50) NOT NULL	
);

CREATE TABLE Manutencoes_Pecas (
	cdManutencao INT NOT NULL FOREIGN KEY REFERENCES Manutencoes (cdManutencao),
	cdPeca INT NOT NULL FOREIGN KEY REFERENCES Pecas (cdPeca) 
);

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
