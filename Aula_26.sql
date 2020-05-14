--Selecionando o Baqnco de Dados
USE Aula_SQL_2020_Z;

-- Drop das Tabeleas

DROP TABLE IF EXISTS Manutencoes_servicos;
DROP TABLE IF EXISTS Manutencoes_Pecas;
DROP TABLE IF EXISTS Manutencoes;
DROP TABLE IF EXISTS Pecas;
DROP TABLE IF EXISTS Servicos;
DROP TABLE IF EXISTS Carros;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Fornecedores;
DROP TABLE IF EXISTS Carros_Modelos;
DROP TABLE IF EXISTS Carros_Fabricantes;

--Criando Tabelas

CREATE TABLE Clientes (
	cdCliente INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	dataNascimento DATE,
	sexo CHAR(1)
);

CREATE TABLE Carros_Fabricantes (
	cdFabricante INT PRIMARY KEY,
	nomeFabricante VARCHAR(50) NOT NULL
);

CREATE TABLE Carros_Modelos (
	cdCarrosModelos INT PRIMARY KEY,
	cdFabricante INT NOT NULL,
	nomeModelo VARCHAR(50) NOT NULL,
	Ano INT,
	paisFabricacao VARCHAR(50) NULL,
	foraDeLinha CHAR(1)
);

CREATE TABLE Carros (
	cdCarro INT PRIMARY KEY,
	nomeModelo VARCHAR(50) NOT NULL,
	nomeFabricante VARCHAR(50) NOT NULL,
	anoModelo INT NOT NULL,
	cdCliente INT NOT NULL --FOREIGN KEY REFERENCES Clientes (cdCliente)
);

CREATE TABLE Servicos (
	cdServico INT PRIMARY KEY,
	cdCarro INT NOT NULL, --FOREIGN KEY REFERENCES Carros (cdCarro) NOT NULL,
	dataEntrada DATE NOT NULL,
	dataSaida DATE
);

CREATE TABLE Pecas (
	cdPeca INT PRIMARY KEY,
	cdManutencao INT NULL, --FOREIGN KEY REFERENCES Manutencoes (cdManutencao),
	cdFornecedor INT NULL,
	nome VARCHAR(50) NOT NULL,
	valorCompra FLOAT,
	valorVenda FLOAT
);

-- Tipos de Serviços

CREATE TABLE TiposServicos (
	cdTiposServicos INT PRIMARY KEY,
	nome VARCHAR(50),
	descricao VARCHAR(150)
);

-- Fornecedor
CREATE TABLE Fornecedores (
	cdFornecedor INT PRIMARY KEY,
	nomeFornecedor VARCHAR(90) NOT NULL,
	dataCadastro DATE
);

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

CREATE TABLE FornecedoresTiposServicos (
	cdFornecedor INT NOT NULL FOREIGN KEY REFERENCES Fornecedores (cdFornecedor),
	cdTipoServico INT NOT NULL FOREIGN KEY REFERENCES TiposServicos (cdTiposServicos) 
);

-- Regras de Chaves Estrangeiras

ALTER TABLE Pecas
ADD CONSTRAINT FK_PecasFornecedores
FOREIGN KEY (cdFornecedor)
REFERENCES Fornecedores (cdFornecedor);

ALTER TABLE Pecas
ADD CONSTRAINT FK_PecasManutencoes
FOREIGN KEY (cdManutencao)
REFERENCES Manutencoes (cdManutencao);

ALTER TABLE Servicos
ADD CONSTRAINT FK_ServicosCarros
FOREIGN KEY (cdCarro)
REFERENCES Carros (cdCarro);

ALTER TABLE Carros
ADD CONSTRAINT FK_Carros_Clientes
FOREIGN KEY (cdCliente)
REFERENCES Clientes (cdCliente);

ALTER TABLE Carros_Modelos
ADD CONSTRAINT FK_CarrosModelos_CarrosFabricantes
FOREIGN KEY (cdFabricante)
REFERENCES Carros_Fabricantes (cdFabricante);
