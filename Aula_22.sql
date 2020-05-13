-- Inserindo Dados

-- tabela Clientes

INSERT INTO Clientes  
VALUES (1, 'Romulo', '1987-11-15', 'M');
 
 INSERT INTO Clientes (
	cdCliente, 
	nome, 
	dataNascimento, 
	sexo
) VALUES (
	2, 
	'Josué',
	'1980-01-02',
	'M'
);

-- Tabela Carros

INSERT INTO Carros (
	cdCarro,
	nomeModelo,
	nomeFabricante,
	anoModelo,
	cdCliente
) VALUES (
	1,
	'Fusca',
	'Volkswagen',
	'1981',
	2
);

INSERT INTO Carros (
	cdCarro,
	nomeFabricante,
	nomeModelo,
	anoModelo,
	cdCliente
) VALUES (
	2,
	'Volksvagen',
	'kombi',
	'2006',
	1
);