-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- Script único - Rode para criar as tabelas, adicionar as primary/foreign keys,
--                consertar erros do projeto e inserir dados de teste.
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

-- Cria a tabela departamento
CREATE TABLE IF NOT EXISTS departamento (
	numero_departamento INTEGER NOT NULL,
	nome_departamento VARCHAR(15) NOT NULL,
	cpf_gerente CHAR(11) NOT NULL,
	data_inicio_gerente DATE
);

-- Cria a tabela dependente
CREATE TABLE IF NOT EXISTS dependente (
	cpf_funcionario CHAR(11) NOT NULL,
	nome_dependente VARCHAR(15) NOT NULL,
	sexo CHAR(1),
	data_nascimento DATE,
	parentesco VARCHAR(15)
);

-- Cria a tabela funcionario
CREATE TABLE IF NOT EXISTS funcionario (
	cpf CHAR(11) NOT NULL,
  primeiro_nome VARCHAR(15) NOT NULL,
  nome_meio CHAR(1),
  ultimo_nome VARCHAR(15) NOT NULL,
  data_nascimento DATE,
  endereco VARCHAR(30),
  sexo CHAR(1),
  salario DECIMAL(10, 2) NOT NULL,
  cpf_supervisor CHAR(11) NOT NULL,
  numero_departamento INTEGER NOT NULL
);

-- Cria a tabela localizacoes_departamento
CREATE TABLE IF NOT EXISTS localizacoes_departamento (
	numero_departamento INTEGER NOT NULL,
	local VARCHAR(15) NOT NULL
);

-- Cria a tabela projeto
CREATE TABLE IF NOT EXISTS projeto (
  numero_projeto INTEGER NOT NULL,
  nome_projeto VARCHAR(15) NOT NULL,
  local_projeto VARCHAR(15),
  numero_departamento INTEGER NOT NULL
);

-- Cria a tabela trabalha_em
CREATE TABLE IF NOT EXISTS trabalha_em (
  cpf_funcionario CHAR(11) NOT NULL,
  numero_projeto INTEGER NOT NULL,
  horas DECIMAL(3, 1) NOT NULL
);

-- Alteração da tabela departamento para adicionar numero_departamento como chave primária
ALTER TABLE departamento
    ADD PRIMARY KEY (numero_departamento);

-- Alteração da tabela projeto para adicionar numero_projeto e nome_dependente como chave primária
ALTER TABLE dependente
    ADD PRIMARY KEY (cpf_funcionario, nome_dependente);

-- Alteração da tabela funcionario para adicionar cpf como chave primária
ALTER TABLE funcionario
    ADD PRIMARY KEY (cpf);

-- Alteração da tabela localizacoes_departamento para adicionar numero_departamento e local como chave primária
ALTER TABLE localizacoes_departamento
    ADD PRIMARY KEY (numero_departamento, local);

-- Alteração da tabela projeto para adicionar numero_projeto como chave primária
ALTER TABLE projeto
    ADD PRIMARY KEY (numero_projeto);

-- Alteração da tabela trabalha_em para adicionar cpf_funcionario e numero_projeto como chave primária
ALTER TABLE trabalha_em
    ADD PRIMARY KEY (cpf_funcionario, numero_projeto);

-- Alteração da tabela departamento para adicionar uma relação com a tabela funcionario a partir do cpf_gerente
-- Isso implica que todo departamento deve possuir um gerente e um funcionário pode ser gerente em mais de um departamento
ALTER TABLE departamento
ADD FOREIGN KEY (cpf_gerente) 
REFERENCES funcionario (cpf);

-- Alteração da tabela dependente para adicionar uma relação com a tabela funcionario a partir do cpf_funcionario
-- Isso implica que cada dependente tem um funcionario associado a ele e um funcionario pode ter varios dependentes
ALTER TABLE dependente
ADD FOREIGN KEY (cpf_funcionario) 
REFERENCES funcionario (cpf);

-- Alteração da tabela funcionario para adicionar uma relação com ela mesmo a partir do cpf e cpf_supervisor
-- Isso implica que um funcionario pode ser supervisor outro funcionario e um funcionario pode ser supervisor de mais de um funcionario
ALTER TABLE funcionario
ADD FOREIGN KEY (cpf_supervisor) 
REFERENCES funcionario (cpf);

-- Alteração da tabela localizações_departamento para adicionar uma relação com a tabela departamento a partir do numero_departamento
ALTER TABLE localizacoes_departamento
ADD FOREIGN KEY (numero_departamento) 
REFERENCES departamento (numero_departamento);

-- Alteração da tabela projeto para adicionar uma relação com a tabela funcionario a partir do numero_departamento
-- Isso implica que cada projeto tem um departamento associado a ele e um departamento pode ter varios projetos
ALTER TABLE projeto
ADD FOREIGN KEY (numero_departamento) 
REFERENCES departamento (numero_departamento);

-- Alteração da tabela trabalha_em para adicionar uma relação com a tabela funcionario a partir do cpf_funcionario
-- Isso implica que cada trabalha_em tem um funcionario associado a ele e um funcionario pode ter varios trabalha_em
-- Essa é uma tabela de relacionamento, ou seja, ela apenas informa quais funcionarios trabalham em cada projeto
ALTER TABLE trabalha_em
ADD FOREIGN KEY (cpf_funcionario) 
REFERENCES funcionario (cpf);

-- Alteração da tabela trabalha_em para adicionar uma relação com a tabela projeto a partir do numero_projeto
ALTER TABLE trabalha_em
ADD FOREIGN KEY (numero_projeto) 
REFERENCES projeto (numero_projeto);

-- Adiciona um check para que o salario de um funcionario nao seja negativo
ALTER TABLE funcionario
ADD CHECK (salario >= 0);

-- Adiciona um check para que o sexo de um funcionario sempre seja F ou M
ALTER TABLE funcionario
ADD CHECK (sexo IN ('M', 'F'));

-- Adiciona um check para que um funcionario não seja supervisor dele mesmo
ALTER TABLE funcionario
ADD CHECK (cpf != cpf_supervisor);

-- Adiciona um check para que um funcionario não tenha horas trabalhadas negativas
ALTER TABLE trabalha_em
ADD CHECK (horas >= 0);

-- Adiciona um check para que o sexo de um dependente sempre seja F ou M
ALTER TABLE dependente
ADD CHECK (sexo IN ('M', 'F'));

-- Adiciona um índice único chamado departamento_idx na coluna nome_departamento da tabela departamento
CREATE UNIQUE INDEX departamento_idx
 ON departamento ( nome_departamento );

-- Adiciona um índice único chamado projeto_idx na coluna nome_projeto da tabela projeto
CREATE UNIQUE INDEX projeto_idx
 ON projeto ( nome_projeto );

/*
 * Esse é um dos erros do projeto do Elmasri, já que as horas devem poder
 * ser nulas. Para resolver esse problema, foi necessário alterar a coluna
 * retirando o NOT NULL.
 */
ALTER TABLE trabalha_em ALTER COLUMN horas DROP NOT NULL;

/*
 * Alguns endereços nos dados de funcionários são mais longos que 30 caracteres,
 * dessa forma foi necessário alterar a coluna endereco para aumentar seu tamanho.
 */
ALTER TABLE funcionario 
    ALTER COLUMN endereco TYPE VARCHAR(40);

/*
 * Esse é outro erro do projeto do Elmasri, já que o cpf_supervisor deve poder
 * ser nulo quando um funcionário não possuir um supervisor. Para resolver esse
 * problema, foi necessário alterar a coluna retirando o NOT NULL.
 */ 
ALTER TABLE funcionario ALTER COLUMN cpf_supervisor DROP NOT NULL;

/*
 * Adiciona os funcionários a tabela de funcionario. Essa ordem deve ser mantida,
 * pois o supervisor deve ser adicionado antes de seu subordinado.
 */
INSERT INTO funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES
('Jorge', 'E', 'Brito', '88866555576', '11-10-1937', 'Rua do Horto, 35, São Paulo, SP', 'M', 55000, NULL, 1),
('Fernando', 'T', 'Wong', '33344555587', '12-08-1955', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40000, '88866555576', 5),
('João', 'B', 'Silva', '12345678966', '01-09-1965', 'Rua das Flores, 751, São Paulo, SP', 'M', 30000, '33344555587', 5),
('Jennifer', 'S', 'Souza', '98765432168', '06-20-1941', 'Av. Arthur de Lima, 54, Santo André, SP', 'F', 43000, '88866555576', 4),
('Alice', 'J', 'Zelaya', '99988777767', '01-19-1968', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25000, '98765432168', 4),
('Ronaldo', 'K', 'Lima', '66688444476', '09-15-1962', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38000, '33344555587', 5),
('Joice', 'A', 'Leite', '45345345376', '07-31-1972', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25000, '33344555587', 5),
('André', 'V', 'Pereira', '98798798733', '03-29-1969', 'Rua Timbira, 35, São Paulo, SP', 'M', 25000, '98765432168', 4);

-- Adiciona os dependentes a tabela de dependente.
INSERT INTO departamento (nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente) VALUES
('Pesquisa', 5, '33344555587', '05-22-1988'),
('Administração', 4, '98765432168', '01-01-1995'),
('Matriz', 1, '88866555576', '06-16-1981');

-- Adiciona as localizações de cada departamento.
INSERT INTO localizacoes_departamento (numero_departamento, local) VALUES
(1, 'São Paulo'),
(4, 'Mauá'),
(5, 'Santo André'),
(5, 'Itu'),
(5, 'São Paulo');

-- Adiciona os projetos a tabela de projeto.
INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento) VALUES
('ProdutoX', 1, 'Santo André', 5),
('ProdutoY', 2, 'Itu', 5),
('ProdutoZ', 3, 'São Paulo', 5),
('Informatização', 10, 'Mauá', 4),
('Reorganização', 20, 'São Paulo', 1),
('Novosbenefícios', 30, 'Mauá', 4);

-- Adiciona os dependentes dos funcionários a tabela de dependente.
INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES
('33344555587', 'Alicia', 'F', '04-05-1986', 'Filha'),
('33344555587', 'Tiago', 'M', '10-25-1983', 'Filho'),
('33344555587', 'Janaína', 'F', '05-03-1958', 'Filha'),
('98765432168', 'Antonio', 'M', '02-28-1942', 'Marido'),
('12345678966', 'Michael', 'M', '01-04-1988', 'Filho'),
('12345678966', 'Alicia', 'F', '12-30-1988', 'Filha'),
('12345678966', 'Elizabeth', 'F', '05-05-1967', 'Esposa');

-- Adiciona a relação de onde trabalha cada funcionário, além das horas trabalhadas.
INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES
('12345678966', 1, 32.5),
('12345678966', 2, 7.5),
('66688444476', 3, 40),
('45345345376', 1, 20),
('45345345376', 2, 20),
('33344555587', 2, 10),
('33344555587', 3, 10),
('33344555587', 10, 10),
('33344555587', 20, 10),
('99988777767', 30, 30),
('99988777767', 10, 10),
('98798798733', 10, 35),
('98798798733', 30, 5),
('98765432168', 30, 20),
('98765432168', 20, 15),
('88866555576', 20, NULL);

-- Adiciona comentários a tabela departamento e suas colunas
COMMENT ON TABLE departamento
    IS 'Tabela que armazena as informações dos departamentos';
COMMENT ON COLUMN departamento.numero_departamento
    IS 'Número do departamento. Chave primária.';
COMMENT ON COLUMN departamento.nome_departamento
    IS 'Nome do departamento. Pode ter até 15 caracteres.';
COMMENT ON COLUMN departamento.cpf_gerente
    IS 'CPF do gerente do departamento. Chave estrangeira que relaciona a tabela de funcionario.';
COMMENT ON COLUMN departamento.data_inicio_gerente
    IS 'Data de início do gerente do departamento. Pode ser nula.';

-- Adiciona comentários a tabela dependente e suas colunas
COMMENT ON TABLE dependente
    IS 'Tabela que armazena as informações dos dependentes de cada funcionario';
COMMENT ON COLUMN dependente.nome_dependente
    IS 'Nome do dependente. Uma das chaves primárias.';
COMMENT ON COLUMN dependente.cpf_funcionario
    IS 'CPF do funcionario. Chave estrangeira e primária que relaciona a tabela de funcionario.';
COMMENT ON COLUMN dependente.sexo
    IS 'Sexo do dependente. Pode ser M ou F.';
COMMENT ON COLUMN dependente.data_nascimento
    IS 'Data de nascimento do dependente. Pode ser nula.';
COMMENT ON COLUMN dependente.parentesco
    IS 'Parentesco do dependente. Pode ter até 15 caracteres.';

-- Adiciona comentários a tabela funcionario e suas colunas
COMMENT ON TABLE funcionario
    IS 'Tabela que armazena as informações dos funcionarios';
COMMENT ON COLUMN funcionario.cpf
    IS 'CPF do funcionario. Chave primária.';
COMMENT ON COLUMN funcionario.primeiro_nome
    IS 'Primeiro nome do funcionario. Pode ter até 15 caracteres.';
COMMENT ON COLUMN funcionario.nome_meio
    IS 'Inicial do nome do meio do funcionário, caso exista.';
COMMENT ON COLUMN funcionario.ultimo_nome
    IS 'Sobrenome do funcionario. Pode ter até 15 caracteres.';
COMMENT ON COLUMN funcionario.data_nascimento
    IS 'Data de nascimento do funcionario. Pode ser nula.';
COMMENT ON COLUMN funcionario.sexo
    IS 'Sexo do funcionario. Pode ser M ou F.';
COMMENT ON COLUMN funcionario.endereco
    IS 'Endereco do funcionario. Pode ter até 40 caracteres.';
COMMENT ON COLUMN funcionario.salario
    IS 'Salário do funcionario. Pode ser nulo. Não pode ser negativo.';
COMMENT ON COLUMN funcionario.cpf_supervisor
    IS 'CPF do supervisor do funcionario. Chave estrangeira que relaciona a tabela de funcionario. Não pode ser igual ao CPF do funcionario.';
COMMENT ON COLUMN funcionario.numero_departamento
    IS 'Número do departamento. Chave estrangeira que relaciona a tabela de departamento.';

-- Adiciona comentários a tabela localizacoes_departamento e suas colunas
COMMENT ON TABLE localizacoes_departamento
    IS 'Tabela que armazena as informações das localizações dos departamentos';
COMMENT ON COLUMN localizacoes_departamento.numero_departamento
    IS 'Número do departamento. Chave estrangeira que relaciona a tabela de departamento.';
COMMENT ON COLUMN localizacoes_departamento.local
    IS 'Local da localização. Pode ter até 15 caracteres. Chave primária.';

-- Adiciona comentários a tabela projeto e suas colunas
COMMENT ON TABLE projeto
    IS 'Tabela que armazena as informações dos projetos';
COMMENT ON COLUMN projeto.numero_projeto
    IS 'Número do projeto. Chave primária.';
COMMENT ON COLUMN projeto.nome_projeto
    IS 'Nome do projeto. Pode ter até 15 caracteres. Único. Chave secundária.';
COMMENT ON COLUMN projeto.local_projeto
    IS 'Local do projeto. Pode ter até 15 caracteres.';
COMMENT ON COLUMN projeto.numero_departamento
    IS 'Número do departamento. Chave estrangeira que relaciona a tabela de departamento.';

-- Adiciona comentários a tabela trabalha_em e suas colunas
COMMENT ON TABLE trabalha_em
    IS 'Tabela que armazena as informações das pessoas que trabalham em determinado projeto';
COMMENT ON COLUMN trabalha_em.cpf_funcionario
    IS 'CPF do funcionario. Chave estrangeira que relaciona a tabela de funcionario.';
COMMENT ON COLUMN trabalha_em.numero_projeto
    IS 'Número do projeto. Chave estrangeira que relaciona a tabela de projeto.';
COMMENT ON COLUMN trabalha_em.horas
    IS 'Horas que o funcionario trabalhou no projeto. Pode ser nulo.';
