select -- O qu� ? (Quais dados ser�o retornados no select)
	sepal_lenght,
	sepal_width,
	petal_length,
	petal_width,
	class
from -- Onde ? (Quais s�o as tabelas que eu irei buscar os dados)
	tb_aula_1
where -- Como? (Quais s�o as regras da minha sele��o)
	class = 'Iris-virginica'
