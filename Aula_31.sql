--Selecionando o Banco de Dados
USE Aula_SQL_2020_Z;

-- Drop das Tabeleas

DROP TABLE IF EXISTS tbl_Manutencoes_servicos;
DROP TABLE IF EXISTS tbl_Manutencoes_Pecas;
DROP TABLE IF EXISTS tbl_Manutencoes;
DROP TABLE IF EXISTS tbl_Pecas;
DROP TABLE IF EXISTS tbl_Servicos;
DROP TABLE IF EXISTS tbl_Carros;
DROP TABLE IF EXISTS tbl_Clientes;
DROP TABLE IF EXISTS TBL_Fornecedores;
DROP TABLE IF EXISTS tbl_Veiculos_Modelos;
DROP TABLE IF EXISTS tbl_Tipo_Veiculos;
DROP TABLE IF EXISTS tbl_Veiculos_Fabricantes;
DROP TABLE IF EXISTS tbl_Tipos_Servicos;
DROP TABLE IF EXISTS TBL_Fornecedores_Tipos_Servicos;

--Criando Tabelas

CREATE TABLE tbl_Clientes (
	cdCliente INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	dataNascimento DATE,
	sexo CHAR(1)
);


CREATE TABLE tbl_Tipo_Veiculos (
	cdTipoVeiculo INT PRIMARY KEY,
	tipoVeiculo VARCHAR(50) NOT NULL
);


CREATE TABLE tbl_Veiculos_Fabricantes (
	cdFabricante INT PRIMARY KEY,
	nomeFabricante VARCHAR(50) NOT NULL
);


CREATE TABLE tbl_Veiculos_Modelos (
	cdVeiculosModelos INT PRIMARY KEY,
	cdFabricante INT NOT NULL,
	cdTipoVeiculo INT NOT NULL,
	nomeModelo VARCHAR(50) NOT NULL,
	Ano INT,
	paisFabricacao VARCHAR(50) NULL,
	foraDeLinha CHAR(1)
);


CREATE TABLE tbl_Carros (
	cdCarro INT PRIMARY KEY,
	placaCarro VARCHAR(20) UNIQUE,
	corCarro VARCHAR(30),
	nomeModelo VARCHAR(50) NOT NULL, 
	nomeFabricante VARCHAR(50) NOT NULL,
	anoModelo INT NOT NULL,
	cdCliente INT NOT NULL --FOREIGN KEY REFERENCES Clientes (cdCliente)
);


CREATE TABLE tbl_Servicos (
	cdServico INT PRIMARY KEY,
	cdCarro INT NOT NULL, --FOREIGN KEY REFERENCES Carros (cdCarro) NOT NULL,
	dataEntrada DATE NOT NULL,
	dataSaida DATE
);


CREATE TABLE tbl_Pecas (
	cdPeca INT PRIMARY KEY,
	cdManutencao INT NULL, --FOREIGN KEY REFERENCES Manutencoes (cdManutencao),
	cdFornecedor INT NULL,
	nome VARCHAR(50) NOT NULL,
	valorCompra FLOAT,
	valorVenda FLOAT
);


-- Tipos de Serviços

CREATE TABLE tbl_Tipos_Servicos (
	cdTiposServicos INT PRIMARY KEY,
	nome VARCHAR(50),
	descricao VARCHAR(150)
);


-- Fornecedor
CREATE TABLE tbl_Fornecedores (
	cdFornecedor INT PRIMARY KEY,
	nomeFornecedor VARCHAR(90) NOT NULL,
	dataCadastro DATE
);


CREATE TABLE tbl_Manutencoes (
	cdManutencao INT PRIMARY KEY,
	dataManutencao DATE NOT NULL,
	nome VARCHAR(50) NOT NULL	
);


CREATE TABLE tbl_Manutencoes_Pecas (
	cdManutencao INT NOT NULL FOREIGN KEY REFERENCES tbl_Manutencoes (cdManutencao),
	cdPeca INT NOT NULL FOREIGN KEY REFERENCES tbl_Pecas (cdPeca) 
);


CREATE TABLE tbl_Manutencoes_servicos (
	cdManutencao INT NOT NULL FOREIGN KEY REFERENCES tbl_Manutencoes (cdManutencao),
	cdServico INT NOT NULL FOREIGN KEY REFERENCES tbl_Servicos (cdServico)
);


CREATE TABLE tbl_Fornecedores_Tipos_Servicos (
	cdFornecedor INT NOT NULL FOREIGN KEY REFERENCES tbl_Fornecedores (cdFornecedor),
	cdTipoServico INT NOT NULL FOREIGN KEY REFERENCES tbl_Tipos_Servicos (cdTiposServicos) 
);

-- Regras de Chaves Estrangeiras

ALTER TABLE tbl_Pecas
ADD CONSTRAINT FK_PecasFornecedores
FOREIGN KEY (cdFornecedor)
REFERENCES tbl_Fornecedores (cdFornecedor);


ALTER TABLE tbl_Pecas
ADD CONSTRAINT FK_PecasManutencoes
FOREIGN KEY (cdManutencao)
REFERENCES tbl_Manutencoes (cdManutencao);


ALTER TABLE tbl_Servicos
ADD CONSTRAINT FK_ServicosCarros
FOREIGN KEY (cdCarro)
REFERENCES tbl_Carros (cdCarro);


ALTER TABLE tbl_Carros
ADD CONSTRAINT FK_Carros_Clientes
FOREIGN KEY (cdCliente)
REFERENCES tbl_Clientes (cdCliente);


ALTER TABLE tbl_Veiculos_Modelos
ADD CONSTRAINT FK_VeiculosModelos_VeiculosFabricantes
FOREIGN KEY (cdFabricante)
REFERENCES tbl_Veiculos_Fabricantes (cdFabricante);


ALTER TABLE tbl_Veiculos_modelos
ADD CONSTRAINT FK_VeiculosModelos_TiposVeiculos
FOREIGN KEY (cdTipoVeiculo)
REFERENCES tbl_Tipo_Veiculos (cdTipoVeiculo);


/* Inserindo Dados nas Tabelas */
INSERT INTO tbl_Tipo_Veiculos (
	cdTipoVeiculo,
	tipoVeiculo
)
VALUES (
	1,
	'Carro'),
(
	2,
	'Motocicleta'
),
(
	3,
	'Caminhão'
);


/* Sub Select */
SELECT
	ROW_NUMBER() OVER(ORDER BY nomeFabricante) AS Linha
	nomeFabricante
FROM (
	SELECT
		DISTINCT nomeFabricante
	FROM
		tbl_Carros
)