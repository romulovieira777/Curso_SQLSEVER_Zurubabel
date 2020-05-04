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
	cdCliente INT FOREIGN KEY REFERENCES Clientes (cdCliente)
);

DROP TABLE IF EXISTS Servico;
CREATE TABLE Servicos (
	cdServico INT PRIMARY KEY,
	cdCarro INT FOREIGN KEY REFERENCES Carros (cdCarro) NOT NULL,
	dataEntrada DATE NOT NULL,
	dataSaida DATE
);

DROP TABLE IF EXISTS Pecas;
CREATE TABLE Pecas (
	cdPeca INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	valorCompra FLOAT,
	valorVenda FLOAT
);

DROP TABLE IF EXISTS Manutencoes;
CREATE TABLE Manutencoes (
	cdManutencao INT PRIMARY KEY,
	dataManutencao DATE NOT NULL,
	nome VARCHAR(50) NOT NULL,
	valorMaoObra FLOAT
);