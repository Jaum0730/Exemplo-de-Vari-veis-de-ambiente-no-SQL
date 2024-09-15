CREATE DATABASE Aeroporto;

CREATE TABLE AVIOES(
	ID_AVIAO INTEGER PRIMARY KEY,
	Capacidade INTEGER,
	Modelo VARCHAR(100)
);
CREATE TABLE VOOS(
	ID_VOO INT PRIMARY KEY,
	ID_AVIAO INT NOT NULL,
	Saida_Prevista TIME,
	Chegada_Prevista TIME,
	Saida_Real TIME,
	Chegada_Real TIME,
	Origem VARCHAR(100),
	Destino VARCHAR(100),
	FOREIGN KEY (ID_AVIAO) REFERENCES AVIOES(ID_AVIAO),
);

CREATE TABLE PASSAGEIROS(
	ID_PASSAGEIRO INTEGER PRIMARY KEY,
	ID_VOO INT NOT NULL,

	Nome VARCHAR(100),
	Origem VARCHAR(100),
	Destino VARCHAR(100),
	FOREIGN KEY (ID_VOO) REFERENCES VOOS(ID_VOO),
);



-- Inserções na tabela AVIOES
INSERT INTO AVIOES (ID_AVIAO, Capacidade, Modelo)
VALUES	(3, 180, 'Boeing 737'),
		(4, 250, 'Airbus A380'),
		(5, 170, 'Embraer E190'),
		(6, 220, 'Boeing 787'),
		(7, 190, 'Airbus A321'),
		(8, 160, 'Bombardier CRJ700'),
		(9, 200, 'Boeing 777'),
		(10, 240, 'Airbus A330'),
		(11, 210, 'Embraer E195'),
		(12, 180, 'Airbus A319');
		

-- Inserções na tabela VOOS
INSERT INTO VOOS (ID_VOO, ID_AVIAO, Saida_Prevista, Chegada_Prevista, Saida_Real, Chegada_Real, Origem, Destino)
VALUES	(3, 3, '09:30:00', '11:30:00', '09:40:00', '11:35:00', 'Brasilia', 'Sao Paulo'),
		(4, 4, '14:45:00', '17:00:00', '14:50:00', '17:05:00', 'Paris', 'New York'),
		(5, 5, '17:30:00', '19:15:00', '17:35:00', '19:20:00', 'Madrid', 'Lisboa'),
		(6, 6, '10:15:00', '12:30:00', '10:20:00', '12:35:00', 'Tokyo', 'Sydney'),
		(7, 7, '13:45:00', '16:00:00', '13:50:00', '16:05:00', 'London', 'Dubai'),
		(8, 8, '18:20:00', '20:10:00', '18:25:00', '20:15:00', 'New York', 'Los Angeles'),
		(9, 9, '11:30:00', '14:15:00', '11:35:00', '14:20:00', 'Beijing', 'Moscow'),
		(10, 10, '15:40:00', '18:00:00', '15:45:00', '18:05:00', 'Sydney', 'Auckland'),
		(11, 11, '19:00:00', '21:00:00', '19:05:00', '21:05:00', 'Rio de Janeiro', 'Buenos Aires'),
		(12, 12, '08:30:00', '10:45:00', '08:35:00', '10:50:00', 'Los Angeles', 'San Francisco');

-- Inserções na tabela PASSAGEIROS
INSERT INTO PASSAGEIROS (ID_PASSAGEIRO, ID_VOO, Nome, Origem, Destino)
VALUES	(3, 3, 'Ana Santos', 'Brasilia', 'Sao Paulo'),
		(4, 4, 'Pedro Rodrigues', 'Paris', 'New York'),
		(5, 5, 'Carolina Oliveira', 'Madrid', 'Lisboa'),
		(6, 6, 'Ryu Tanaka', 'Tokyo', 'Sydney'),
		(7, 7, 'Emily Watson', 'London', 'Dubai'),
		(8, 8, 'Michael Johnson', 'New York', 'Los Angeles'),
		(9, 9, 'Li Wei', 'Beijing', 'Moscow'),
		(10, 10, 'Isabella Fernandez', 'Sydney', 'Auckland'),
		(11, 11, 'Diego Santos', 'Rio de Janeiro', 'Buenos Aires'),
		(12, 12, 'Sophia Martinez', 'Los Angeles', 'San Francisco');
SELECT * FROM AVIOES
SELECT * FROM VOOS
SELECT * FROM PASSAGEIROS

-- Exemplo de uso de variáveis
DECLARE @NomePassageiro VARCHAR(100);
SET @NomePassageiro = 'Ana Santos';

SELECT *
FROM PASSAGEIROS
WHERE PASSAGEIROS.Nome = @NomePassageiro;

-- View para obter informações dos voos com base nos passageiros
CREATE VIEW vw_info_PASSAGEIRO AS
SELECT *
FROM PASSAGEIROS
--WHERE Nome = @NomePassageiro;

SELECT * FROM vw_info_PASSAGEIRO
-- Stored Procedure para inserir um novo avião
DECLARE @ID_aviao INT;
SET @ID_aviao = 750;

CREATE PROCEDURE InserirAviao(
    @ID_Aviao INT,
    @Capacidade INT,
    @Modelo VARCHAR(100)
)
AS
BEGIN
    INSERT INTO AVIOES (ID_AVIAO, Capacidade, Modelo)
    VALUES (@ID_Aviao, @Capacidade, @Modelo);
END;


-- Inner Join
SELECT * FROM AVIOES
INNER JOIN VOOS ON VOOS.ID_AVIAO = AVIOES.ID_AVIAO;

-- Left Join
SELECT * FROM AVIOES
LEFT JOIN VOOS ON AVIOES.ID_AVIAO = VOOS.ID_AVIAO;

-- Right Join
SELECT * FROM AVIOES
RIGHT JOIN VOOS ON VOOS.ID_AVIAO = VOOS.ID_AVIAO;

-- Full Join
SELECT * FROM AVIOES
FULL JOIN VOOS ON AVIOES.ID_AVIAO = VOOS.ID_AVIAO;

-- Cross Join
SELECT * FROM AVIOES
CROSS JOIN VOOS;

SELECT * FROM PASSAGEIROS
CROSS JOIN VOOS;


-- Trigger para atualizar a coluna Saida_Real quando a coluna Saida_Prevista é atualizada
CREATE TRIGGER AtualizarSaidaReal
ON VOOS
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Saida_Prevista)
    BEGIN
        UPDATE VOOS
        SET Saida_Real = GETDATE()
        WHERE ID_VOO IN (SELECT ID_VOO FROM inserted);
    END;
END;
