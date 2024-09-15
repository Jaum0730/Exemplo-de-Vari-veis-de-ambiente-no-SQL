
-- Script criação do banco de dados UniversidadeDigital - Modelo Fisíco

create database UniversidadeDigital;

CREATE TABLE Cursos (
  id_curso INT identity (1,1) primary KEY,
  nome VARCHAR(255) NOT NULL,
  area_conhecimento VARCHAR(255) NOT NULL,
  descricao TEXT NOT NULL,
  carga_horaria INT NOT NULL,
  coordenador VARCHAR(255) NOT NULL
);

CREATE TABLE Alunos (
  id_aluno INT identity (1,1) PRIMARY KEY ,
  nome VARCHAR(255) NOT NULL,
  contato VARCHAR(255) NOT NULL,
  endereco_rua VARCHAR(255) NOT NULL,
  endereco_numero INT NOT NULL,
  endereco_cep VARCHAR(10) NOT NULL,
  endereco_bairro VARCHAR(255) NOT NULL,
  endereco_cidade VARCHAR(255) NOT NULL,
  endereco_estado VARCHAR(2) NOT NULL,
  curso_matriculado INT NOT NULL,
  historico_academico TEXT,
  FOREIGN KEY (curso_matriculado) REFERENCES Cursos(id_curso)
);

CREATE TABLE Eventos_Online (
  id_evento INT identity (1,1) PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  tipo VARCHAR(255) NOT NULL,
  descricao TEXT NOT NULL,
  palestrante VARCHAR(255) NOT NULL,
  data DATE NOT NULL
);

CREATE TABLE Matriculas (
  id_matricula INT identity (1,1) PRIMARY KEY,
  id_aluno INT NOT NULL,
  id_curso INT NOT NULL,
  data_inicio DATE NOT NULL,
  status VARCHAR(255) NOT NULL,
  FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
  FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

CREATE TABLE Participacoes_Eventos (
  id_participacao INT identity (1,1) PRIMARY KEY,
  id_aluno INT NOT NULL,
  id_evento INT NOT NULL,
  data DATE NOT NULL,
  FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
  FOREIGN KEY (id_evento) REFERENCES Eventos_Online(id_evento)
);

CREATE TABLE Bolsas_Incentivos (
  id_bolsa INT identity (1,1) PRIMARY KEY,
  id_aluno INT NOT NULL,
  tipo_incentivo VARCHAR(255) NOT NULL,
  criterios_elegibilidade TEXT NOT NULL,
  FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);

-- Popular tabela Cursos
INSERT INTO Cursos (nome, area_conhecimento, descricao, carga_horaria, coordenador)
VALUES
  ('Ciência da Computação', 'Exatas e Computação', 'Bacharelado em Ciência da Computação', 800, 'Dr. Augusto Silva'),
  ('Sistemas de Informação', 'Exatas e Computação', 'Bacharelado em Sistemas de Informação', 800, 'Dra. Ana Souza'),
  ('Engenharia Civil', 'Engenharia', 'Bacharelado em Engenharia Civil', 800, 'Dr. Marcos Oliveira'),
  ('Administração de Empresas', 'Ciências Sociais Aplicadas', 'Bacharelado em Administração de Empresas', 800, 'Dra. Helena Santos'),
  ('Direito', 'Ciências Sociais Aplicadas', 'Bacharelado em Direito', 800, 'Dr. Pedro Ribeiro'),
  ('Pedagogia', 'Ciências Humanas', 'Licenciatura em Pedagogia', 400, 'Dra. Carla Ferreira'),
  ('Psicologia', 'Ciências Humanas', 'Bacharelado em Psicologia', 800, 'Dr. Daniel Lopes'),
  ('Marketing', 'Ciências Sociais Aplicadas', 'Bacharelado em Marketing', 800, 'Dra. Gabriela Campos'),
  ('Publicidade e Propaganda', 'Comunicação', 'Bacharelado em Publicidade e Propaganda', 800, 'Dr. Miguel Costa'),
  ('Jornalismo', 'Comunicação', 'Bacharelado em Jornalismo', 800, 'Dra. Sofia Vargas');

-- Listar todos os cursos ministrados na Universidade Digital.
Select * From Cursos;

--atualizar a carga horária dos cursos de Pedagogia de 400 para 500 horas.
begin tran
update Cursos set carga_horaria = 500 Where id_curso = 6;
commit tran;

-- Popular tabela Alunos

INSERT INTO Alunos (nome, contato, endereco_rua, endereco_numero, endereco_cep, endereco_bairro, endereco_cidade, endereco_estado, curso_matriculado, historico_academico)
VALUES
  ('João Silva', '(85) 9999-9999', 'Rua das Flores, 123', 10, '60000-000', 'Centro', 'Fortaleza', 'CE', 1, 'Ensino Médio completo'),
  ('Maria Souza', '(85) 8888-8888', 'Rua da Mata, 321', 20, '60000-111', 'Aldeota', 'Fortaleza', 'CE', 2, 'Ensino Médio completo'),
  ('Pedro Oliveira', '(85) 7777-7777', 'Rua do Sol, 432', 30, '60000-222', 'Meireles', 'Fortaleza', 'CE', 3, 'Ensino Médio completo'),
  ('Ana Santos', '(85) 6666-6666', 'Rua da Lua, 543', 40, '60000-333', 'Fátima', 'Fortaleza', 'CE', 4, 'Ensino Médio completo'),
  ('Carlos Ribeiro', '(85) 5555-5555', 'Rua das Estrelas, 654', 50, '60000-444', 'Mucuripe', 'Fortaleza', 'CE', 1, 'Ensino Médio completo'),
  ('Luisa Ferreira', '(85) 4444-4444', 'Rua das Nuvens, 765', 60, '60000-555', 'Praia de Iracema', 'Fortaleza', 'CE', 5, 'Ensino Médio completo'),
  ('Bruno Lopes', '(85) 3333-3333', 'Rua da Chuva, 876', 70, '60000-666', 'Couto Pereira', 'Fortaleza', 'CE', 2, 'Ensino Médio completo'),
  ('Clara Campos', '(85) 2222-2222', 'Rua do Vento, 987', 80, '60000-777', 'Maraponga', 'Fortaleza', 'CE', 4, 'Ensino Médio completo'),
  ('Diego Costa', '(85) 1111-1111', 'Rua da Terra, 1098', 90, '60000-888', 'Parangaba', 'Fortaleza', 'CE', 3, 'Ensino Médio completo'),
  ('Sofia Vargas', '(85) 0000-0000', 'Rua do Fogo, 2110', 100, '60000-999', 'Conjunto Ceará I', 'Fortaleza', 'CE', 5, 'Ensino Médio completo'),
  ('Gabriel Silva', '(85) 9999-8888', 'Rua das Flores, 123', 11, '60000-000', 'Centro', 'Fortaleza', 'CE', 1, 'Ensino Médio completo em andamento'),
  ('Isabella Souza', '(85) 8888-7777', 'Rua da Mata, 321', 22, '60000-111', 'Aldeota', 'Fortaleza', 'CE', 2, 'Ensino Médio completo em andamento'),
  ('Pedro Oliveira', '(85) 7777-6666', 'Rua do Sol, 432', 33, '60000-222', 'Meireles', 'Fortaleza', 'CE', 3, 'Ensino Médio completo em andamento'),
  ('Ana Santos', '(85) 6666-5555', 'Rua da Lua, 543', 44, '60000-333', 'Fátima', 'Fortaleza', 'CE', 4, 'Ensino Médio completo em andamento');

-- Listar todos os alunos que residem em Fortaleza.
 Select * From Alunos Where endereco_cidade = 'Fortaleza';

 -- Alterar nome da aluna 'Ana Santos' para 'Ana Santos da Silva' com id_aluno igual a 14.
Begin tran
update Alunos set nome  = 'Ana Santos da Silva' Where id_aluno = 14;
commit tran
 

 -- Popular tabela Eventos_Online

INSERT INTO Eventos_Online (nome, tipo, descricao, palestrante, data)
VALUES
  ('Desenvolvimento Web Moderno com JavaScript', 'Workshop', 'Aprenda as tecnologias mais recentes para construir aplicações web interativas e dinâmicas.', 'Mariana Rocha', '2024-05-15'),
  ('Gestão de Projetos para Iniciantes', 'Seminário', 'Entenda os conceitos fundamentais e as melhores práticas para gerenciar seus projetos com eficiência.', 'Carlos Augusto', '2024-06-10'),
  ('Marketing Digital na Prática', 'Workshop', 'Descubra como utilizar as ferramentas do marketing digital para atrair e converter clientes.', 'Sofia Oliveira', '2024-07-22'),
  ('Liderança e Motivação no Ambiente de Trabalho', 'Palestra', 'Desenvolva suas habilidades de liderança e aprenda a motivar sua equipe para alcançar o sucesso.', 'Eduardo Silva', '2024-08-29'),
  ('Segurança da Informação para Empresas', 'Seminário', 'Conheça as principais ameaças virtuais e as estratégias para proteger os dados da sua empresa.', ' Gabriela Campos', '2024-09-12'),
  ('Inteligência Artificial e o Futuro do Trabalho', 'Palestra', 'Entenda como a Inteligência Artificial está transformando o mercado e como se preparar para esse cenário.', 'Dr. Pedro Henrique', '2024-10-24');

  -- Listar todos os eventos ocrridos no ano de 2024
Select * From Eventos_Online Where year(data) = '2024';


-- Popular tabela Matriculas 

INSERT INTO Matriculas (id_aluno, id_curso, data_inicio, status)
VALUES
  (1, 1, '2024-03-10', 'Ativo'),     -- João Silva      -- Ciência da Computação
  (2, 2, '2024-02-15', 'Ativo'),     -- Maria Souza     -- Sistemas de Informação
  (3, 3, '2024-01-20', 'Ativo'),     -- Pedro Oliveira  -- Engenharia Civil
  (4, 4, '2024-03-10', 'Ativo'),     -- Ana Santos      -- Administração de Empresas
  (5, 5, '2024-02-15', 'Ativo'),     -- Carlos Ribeiro  -- Direito
  (6, 1, '2024-03-10', 'Ativo'),     -- Luisa Ferreira  -- Ciência da Computação
  (7, 4, '2024-02-15', 'Ativo'),     -- Bruno Lopes     -- Administração de Empresas
  (8, 2, '2024-01-20', 'Ativo'),     -- Clara Campos    -- Sistemas de Informação 
  (9, 3, '2024-03-10', 'Ativo'),     -- Diego Costa     -- Engenharia Civil 
  (10, 5, '2024-02-15', 'Ativo'),    -- Sofia Vargas    -- Direito
  (11, 1, '2024-02-01', 'Trancado'), -- Gabriel Silva   -- Ciência da Computação
  (12, 2, '2024-01-15', 'Trancado'), -- Isabella Souza  -- Sistemas de Informação
  (13, 4, '2024-02-01', 'Trancado'), -- Pedro Oliveira  -- Administração de Empresas
  (14, 5, '2024-01-15', 'Trancado'); -- Ana Santos      -- Direito

  --Listar todos alunos que estão Ativos com codigo, nome do aluno e nome do curso.
  select Alu.id_aluno as Codigo, Alu.nome as Aluno, Cur.nome From Matriculas Mat 
  inner join Cursos Cur ON Cur.id_curso = Mat.id_curso
  inner join Alunos Alu ON Alu.id_aluno = Mat.id_aluno
                       And Alu.curso_matriculado = Mat.id_curso
  Where Mat.status = 'Ativo'

  begin tran
  delete Matriculas Where id_aluno = 14;
  commit tran;


-- Popular tabela Participacoes_Eventos

INSERT INTO Participacoes_Eventos (id_aluno, id_evento, data)
VALUES
  (1, 1, '2024-04-15'),  -- João Silva      -- Desenvolvimento Web Moderno com JavaScript
  (2, 2, '2024-05-20'),  -- Maria Souza     -- Gestão de Projetos para Iniciantes
  (4, 3, '2024-06-25'),  -- Ana Santos      -- Marketing Digital na Prática
  (5, 4, '2024-07-10'),  -- Carlos Ribeiro  -- Liderança e Motivação no Ambiente de Trabalho
  (6, 1, '2024-04-15'),  -- Luisa Ferreira  -- Desenvolvimento Web Moderno com JavaScript
  (7, 5, '2024-05-20'),  -- Bruno Lopes     -- Segurança da Informação para Empresas
  (9, 2, '2024-06-25'),  -- Diego Costa     -- Gestão de Projetos para Iniciantes
  (10, 4, '2024-07-10'); --	Sofia Vargas    -- Liderança e Motivação no Ambiente de Trabalho

-- Listar todos os alunos que participarão de eventos e que residem na cidade de Fortaleza no ano de 2024
							
select Alu.id_aluno as Codigo, Alu.nome as Aluno, EOn.nome,  PEv.data as dataEvento From  Participacoes_Eventos PEv
inner join Eventos_Online EOn ON EOn.id_evento = PEv.id_evento
inner join Alunos Alu         ON Alu.id_aluno  = PEv.id_aluno
Where Alu.endereco_cidade = 'Fortaleza'
And   YEAR(PEv.data) = '2024'; 
  

--- Popular tabela Bolsas_Incentivos

INSERT INTO Bolsas_Incentivos (id_aluno, tipo_incentivo, criterios_elegibilidade)
VALUES
  (1, 'Bolsa Mérito Acadêmico', 'Destinada a alunos com alto desempenho acadêmico, com média igual ou superior a 8,0.'),                                                        -- João Silva
  (2, 'Bolsa Monitoria', 'Destinada a alunos que auxiliam professores em atividades relacionadas à disciplina, como monitorias e tutorias.'),                                   -- Maria Souza
  (3, 'Bolsa Auxílio Moradia', 'Destinada a alunos em situação de vulnerabilidade socioeconômica que residem fora da cidade onde estudam.'),                                    -- Pedro Oliveira
  (4, 'Bolsa Auxílio Transporte', 'Destinada a alunos em situação de vulnerabilidade socioeconômica que utilizam transporte público para se deslocar à faculdade.'),            -- Ana Santos
  (5, 'Bolsa Auxílio Alimentação', 'Destinada a alunos em situação de vulnerabilidade socioeconômica que comprovam dificuldades financeiras para se alimentar.'),               -- Carlos Ribeiro
  (6, 'Bolsa Esporte', 'Destinada a alunos que se destacam em modalidades esportivas e representam a instituição em competições.'),                                             -- Luisa Ferreira
  (7, 'Bolsa Cultura', 'Destinada a alunos que se destacam em atividades culturais e representam a instituição em eventos culturais.'),                                         -- Bruno Lopes
  (8, 'Bolsa Iniciação Científica', 'Destinada a alunos que participam de projetos de pesquisa e apresentam resultados em congressos e eventos científicos.'),                  -- Clara Campos
  (9, 'Bolsa de Extensão Universitária', 'Destinada a alunos que participam de projetos de extensão universitária que beneficiam a comunidade.'),                               -- Diego Costa
  (10, 'Bolsa de Monitoria de Pesquisa', 'Destinada a alunos que auxiliam pesquisadores em projetos de pesquisa e apresentam resultados em congressos e eventos científicos.'); -- Sofia Vargas

-- Listar todos os alunos com direito a bolsa de estudo.
-- Lista código do aluno, nome bolsa e telefone

select Alu.id_aluno as Codigo, Alu.nome as Aluno, BIn.tipo_incentivo as Bolsa, Alu.contato as Telefone From Bolsas_Incentivos BIn
inner join Alunos Alu ON Alu.id_aluno = BIn.id_aluno
Where Alu.endereco_estado = 'CE'; 



--Quais são os cursos mais populares entre os alunos?

Select Cur.nome, COUNT(Cur.id_curso) AS Quantidade From Cursos Cur
Left join Alunos Alu ON Cur.id_curso = Alu.curso_matriculado
GROUP BY Cur.nome
having COUNT(Cur.id_curso) = (select top 1 COUNT(C.id_curso) as Qtde From Cursos C
                              Left join Alunos A ON C.id_curso = A.curso_matriculado
                              GROUP BY C.nome
                              Order by COUNT(C.id_curso) desc)


--Qual é a participação dos alunos nos diversos eventos online oferecidos?

select Alu.id_aluno as Codigo, Alu.nome as Aluno, EOn.nome,  PEv.data as dataEvento From  Participacoes_Eventos PEv
inner join Eventos_Online EOn ON EOn.id_evento = PEv.id_evento
inner join Alunos Alu         ON Alu.id_aluno  = PEv.id_aluno

--Como o desempenho acadêmico influencia na concessão de bolsas e incentivos?

select Alu.id_aluno as Codigo, Alu.nome as Aluno, BIn.tipo_incentivo as Bolsa, BIn.criterios_elegibilidade From Bolsas_Incentivos BIn
inner join Alunos Alu ON Alu.id_aluno = BIn.id_aluno;


