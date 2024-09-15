CREATE DATABASE Atividade4
-- Criando a tabela
CREATE TABLE RegistroVendas (
    VendaID INT,
    ClienteID INT,
    NomeCliente VARCHAR(100),
    ProdutoID INT,
    NomeProduto VARCHAR(100),
    CategoriaProduto VARCHAR(100),
    FabricanteProduto VARCHAR(100),
    PrecoUnitario DECIMAL(10,2),
    Quantidade INT,
    DataVenda DATE,
    CidadeVenda VARCHAR(50),
    EstadoVenda VARCHAR(50)
);

-- Inserindo dados
INSERT INTO RegistroVendas (VendaID, ClienteID, NomeCliente, ProdutoID, NomeProduto, CategoriaProduto, FabricanteProduto, PrecoUnitario, Quantidade, DataVenda, CidadeVenda, EstadoVenda)
VALUES
(1, 101, 'Maria Silva', 501, 'Laptop High', 'Eletr�nicos', 'TechGoods', 3200.00, 1, '2024-05-01', 'S�o Paulo', 'SP'),
(2, 101, 'Maria Silva', 502, 'Mouse Wireless', 'Acess�rios', 'TechGoods', 150.00, 1, '2024-05-01', 'S�o Paulo', 'SP'),
(3, 102, 'Carlos Prado', 503, 'C�mera DSLR', 'C�meras', 'PhotoFast', 4500.00, 1, '2024-05-02', 'Rio de Janeiro', 'RJ'),
(4, 103, 'Joana Mello', 504, 'Smartphone X', 'Eletr�nicos', 'MobilePlus', 2800.00, 1, '2024-05-02', 'Curitiba', 'PR'),
(5, 104, 'Pedro Martins', 505, 'Teclado Mec�nico', 'Acess�rios', 'TechGoods', 700.00, 2, '2024-05-03', 'Porto Alegre', 'RS'),
(6, 105, 'Luciana Freitas', 506, 'Tablet Pro', 'Eletr�nicos', 'MobilePlus', 2500.00, 1, '2024-05-03', 'Belo Horizonte', 'MG'),
(7, 106, 'Roberto Costa', 507, 'Monitor 4K', 'Eletr�nicos', 'VisualTech', 2200.00, 1, '2024-05-04', 'Recife', 'PE'),
(8, 107, 'Cl�udia Gomes', 508, 'Impressora Laser', 'Escrit�rio', 'PrintSolutions', 800.00, 1, '2024-05-04', 'Salvador', 'BA'),
(9, 108, 'Ricardo Nunes', 509, 'SSD 1TB', 'Acess�rios', 'TechGoods', 600.00, 2, '2024-05-05', 'Fortaleza', 'CE'),
(10, 109, 'Teresa Campos', 510, 'Mousepad Ergon�mico', 'Acess�rios', 'OfficePlus', 50.00, 3, '2024-05-05', 'Manaus', 'AM');

-- Consultando os dados
SELECT * FROM RegistroVendas;

-- Normaliza��o
-- A TABELA VENDAS SE ENCONTRA-SE NA SEGUNDA FORMA NORMAL POIS SUAS DEPEND�NCIAS N�O EST�O TOTALMENTE SEPARADAS, MAS SIM SE ENCONTRAM PARCIALMENTE SEPARADAS
CREATE TABLE Vendas (
    VendaID INT,
    ClienteID INT,
    ProdutoID INT,
    PrecoUnitario DECIMAL(10,2),
    Quantidade INT,
    DataVenda DATE,
    CidadeVenda VARCHAR(50),
    EstadoVenda VARCHAR(50)
);

--TANTO A TABELA CLIENTES QUNTO A TABELA PRODUTO EST�O NA TERCEIRA FORMA NORMAL, POIS N�O POSSUEM ATRIBUTOS ASSOCIADOS POR TRANSITIVIDADE
CREATE TABLE Clientes (
    ClienteID INT,
	NomeCliente VARCHAR(100),
);


CREATE TABLE Produto (
    ProdutoID INT,
	NomeProduto VARCHAR(100),
	CategoriaProduto VARCHAR(100),
	FabricanteProduto VARCHAR(100),
    PrecoUnitario DECIMAL(10,2)
);



-- Inser��o de dados na tabela Vendas
INSERT INTO Vendas (VendaID, ClienteID, ProdutoID, PrecoUnitario, Quantidade, DataVenda, CidadeVenda, EstadoVenda) VALUES
(1, 1, 1, 10.99, 5, '2024-05-01', 'S�o Paulo', 'SP'),
(2, 2, 3, 25.50, 3, '2024-05-02', 'Rio de Janeiro', 'RJ'),
(3, 3, 2, 15.75, 2, '2024-05-03', 'Belo Horizonte', 'MG'),
(4, 1, 4, 8.99, 4, '2024-05-04', 'Porto Alegre', 'RS'),
(5, 4, 1, 10.99, 1, '2024-05-05', 'Salvador', 'BA');

-- Inser��o de dados na tabela Clientes
INSERT INTO Clientes (ClienteID, NomeCliente) VALUES
(1, 'Jo�o Silva'),
(2, 'Maria Santos'),
(3, 'Carlos Oliveira'),
(4, 'Ana Souza');

-- Inser��o de dados na tabela Produto
INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaProduto, FabricanteProduto, PrecoUnitario) VALUES
(1, 'Camiseta', 'Vestu�rio', 'Fabricante A', 19.99),
(2, 'Cal�a Jeans', 'Vestu�rio', 'Fabricante B', 59.90),
(3, 'T�nis', 'Cal�ados', 'Fabricante C', 99.99),
(4, 'Bon�', 'Acess�rios', 'Fabricante D', 12.50),
(5, 'Bolsa', 'Acess�rios', 'Fabricante E', 29.99);

SELECT * FROM Vendas;
SELECT * FROM Clientes;
SELECT * FROM Produto;


