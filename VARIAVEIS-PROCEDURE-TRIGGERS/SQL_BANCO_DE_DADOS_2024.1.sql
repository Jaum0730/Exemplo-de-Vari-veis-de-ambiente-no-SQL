-- Criando banco de dados
Create database db_vendas;

-- Criando tabela chamada tb_produto
Create table tb_produtos(
-- "Virgulas são úteis para comentar certos trechos de forma isolada"
	idproduto int primary key, 
	descricaoproduto varchar(10), 
	precoproduto decimal(18,4),
	unidade_de_medida varchar(20),
	datadecadastro datetime,
	qtestoque int,
	categoria varchar(20)
);

-- Criando variaveis para selecionar o tempo presente baseado no SGBD
Declare @datetimeoffset datetimeoffset(4) = getdate();
Select @datetimeoffset AS 'CurrentTimeAndLocation'

-- Use drop para apagar objetos e delete para registro
Create table tb_Cliente(
	id_cliente int primary key, 
	nome_cliente varchar(50),
	datadenascimento datetime,
	valortotal_emcompras decimal(18,4)


);



INSERT INTO tb_Cliente(id_cliente,
	nome_cliente,
	datadenascimento, 
	valortotal_emcompras) 
	values(5115655,
	'João', 
	'2022-04-04',
	'1112.452');

INSERT INTO tb_produtos(idproduto, 
	categoria,
	descricaoproduto,
	datadecadastro,
	unidade_de_medida,
	precoproduto,
	qtestoque) 
	values(5215655,
	'cozinha', 
	'produto A',
	'2024-04-02',
	'Unidade',
	'18.89',
	300
	);



SELECT * from tb_Cliente;
SELECT * from tb_produtos;