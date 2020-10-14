/*
	Autor: Rômulo Vieira
	Data: 14/10/2020
	Base: OficinaRômulo
*/


/* Criando uma View */
CREATE VIEW
	VW_VeiculosPorPessoa
AS
	SELECT
		cl.cdCliente,
		cl.nome AS NomeCliente,
		COUNT(cdCarro) AS QuantidadeVeiculos
	FROM
		tbl_Clientes cl
	INNER JOIN
		tbl_Carros c
	ON
		cl.cdCliente = c.cdCliente
	GROUP BY
		cl.cdCliente,
		nome
GO