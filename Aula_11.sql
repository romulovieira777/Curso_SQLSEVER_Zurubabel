USE Aula_SQL_2020_Z;

--Criando Tabelas

DROP TABLE IF EXISTS Clientes;
CREATE TABLE Clientes (
	idCliente INT PRIMARY KEY,
	nomeCliente varchar(50),
	dataNascimento DATE,
	sexo char(1)
);

DROP TABLE IF EXISTS Carros;
CREATE TABLE Carros (	
	nomeFabricante VARCHAR(50),
	nomeModelo VARCHAR(50),
	anoModelo INT,
	nomeCliente VARCHAR(50),
	idCliente INT
);

--Inserir Dados

INSERT INTO Clientes (
	idCliente,
	nomeCliente,
	dataNascimento,
	sexo
)
VALUES (
	1,
	'Z�',
	'1985-01-13',
	'M'
),
(
	2,
	'jailson',
	'1988-01-02',
	'M'
);

INSERT INTO Carros (
	nomeFabricante,
	nomeModelo,
	anoModelo,
	idCliente
)
VALUES (
	'Volkswagen',
	'Fox',
	2008,
	1
),
(
	'Hyundai',
	'Tucson',
	2013,
	1
);
--Selecionando Informa��es das Tabelas

SELECT
	*
FROM
	Clientes;

SELECT
	*
FROM
	Carros;

-- Jun��o

SELECT
	Clientes.nomeCliente,
	Carros.nomeModelo,
	Carros.anoMOdelo
FROM
	Clientes,
	Carros
WHERE
	Clientes.idCliente = Carros.idCliente