use Aula_SQL_2020_Z;

create table tb_Pessoas (
	idPessoa int,
	nomePessoa varchar(50),
	dataNascimento date
);

insert into
	tb_Pessoas (idPessoa, nomePessoa, dataNascimento)
values
	(1, 'Romulo', '2020-01-03'),
	(2, 'Marcia', '2020-03-08'),
	(3, 'Marcos', '1986-11-30');

select 
	*
from
	tb_Pessoas