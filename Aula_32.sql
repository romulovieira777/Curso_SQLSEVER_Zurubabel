/* Criando CTES */

;WITH tbl_TipoVeiculosCTE (cdTipoVeiculo, tipoVeiculo) AS (
	SELECT
		1,
		'Carro'
	UNION ALL
		SELECT
			2,
			'Motocicleta'
	UNION ALL
		SELECT
			3,
			'Caminhão'
), tbl_Veiculos_FabricantesCTE (cdFabricante, nomeFabricante) AS (
	SELECT
		ROW_NUMBER() OVER(ORDER BY nomeFabricante),
		nomeFabricante
	FROM (
		SELECT DISTINCT
			nomeFabricante
		FROM
			tbl_Carros
	) Dados
), tbl_Veiculos_ModelosCTE AS (
	SELECT DISTINCT
		VF.cdFabricante,
		TV.cdTipoVeiculo,
		C.nomeModelo,
		C.anoModelo AS Ano,
		'Brasil' AS paisFabricacao,
		CASE
			WHEN C.anoModelo < 2010 THEN 'S' ELSE 'N'
		END AS foraDeLinha
	FROM
		tbl_TipoVeiculosCTE VF INNER JOIN tbl_Carros ON
		VF.nomeFabricante = C.nomeFabricante,
		tbl_TipoVeiculosCTE TV
	WHERE
		TV.tipoVeiculo = 'Carro'