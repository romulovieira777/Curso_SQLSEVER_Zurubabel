/* 
	Autor: Rômulo
	Data: 03/10/20
	Base: Aula_SQL_2020_Z
	O Que Ela faz: Cadastrar Dados na Base tbl_Clientes
*/
ALTER PROCEDURE UDP_CadastrarClientes (
	@cdCliente INT,
	@nome VARCHAR(50),
	@dataNascimento DATE,
	@sexo CHAR(1)
)
AS
BEGIN
	SET @cdCliente = ISNULL((SELECT MAX(cdCliente) + 1 FROM tbl_Clientes), 1);

	INSERT INTO tbl_Clientes(
		nome,
		dataNascimento,
		sexo
		) VALUES(
		@nome,
		@dataNascimento,
		@sexo);
END
GO	