declare @media float
declare @quantidade int

--Atribuindo as variáveis (Jeito 1)
--set @media = (select avg(petal_length) from tb_aula_1)

-- Jeito 2
select
	@media = avg(petal_length),
	@quantidade = count(petal_length)
from
	tb_aula_1

--select @media, @quantidade

select
	sqrt((sum(power((petal_length - @Media), 2))) / (@quantidade - 1)) as dp
from
	tb_aula_1


select
	STDEV(petal_length) as sql_dp
from
	tb_aula_1

/*
select
	*
from
	tb_aula_1
*/
