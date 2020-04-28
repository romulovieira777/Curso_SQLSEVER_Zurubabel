select
	class,
	sum(sepal_lenght) as total_comprimento_sepalas,
	avg(sepal_lenght) as media_comprimento_sepalas,
	count(sepal_lenght) as quantidade
from 
	tb_aula_1
group by
	class