select
	*
from
	tb_aula_1
where
	class = 'Iris-virginica'
	and (petal_length >= 2 or sepal_lenght > 3)