select
	*
from
	tb_aula_1
where
	(class = 'Iris-setosa'
	or class = 'Iris-virginica')
	and petal_length >= 1.3