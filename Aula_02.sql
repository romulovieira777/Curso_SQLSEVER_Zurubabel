select -- O quê ? (Quais dados serão retornados no select)
	sepal_lenght,
	sepal_width,
	petal_length,
	petal_width,
	class
from -- Onde ? (Quais são as tabelas que eu irei buscar os dados)
	tb_aula_1
where -- Como? (Quais são as regras da minha seleção)
	class = 'Iris-virginica'
