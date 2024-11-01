create database base_bd;
use base_bd;

create table departamento(
id int primary key auto_increment not null,
nome varchar(50),
localizacao varchar(50),
orcamento decimal(10,2)
);

insert into departamento(nome, localizacao, orcamento) 
values ("Recursos Humanos", "Pindamonhangaba", 500000.00),
("Romário Incomassa", "Chique Chique- Bahia", 1000000.00),
("Taxismo", "Porto de Galinhas", 4000000.00),
("Dono da Boca", "Chapadinha", 35.00),
("Malabarismo", "Farol", 90.00);

select * from departamento
into outfile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
fields terminated by ',' enclosed by '"'
lines terminated by'\n';


load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
into table departamento
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

drop table departamento;

start transaction;
update departamento set orcamento = orcamento + 1000.00 where nome = 'ti';
update departamento set orcamento = orcamento + 1000.00 where nome = 'financeiro';
commit;

rollback;

start transaction;
update departamento set orcamento = orcamento + 7000.00 where nome = 'Recursos Humanos';
savepoint ajuste_parcial;
update departamento set orcamento = orcamento + 2000.00 where nome 'Vendas';
rollback to ajuste_parcial;