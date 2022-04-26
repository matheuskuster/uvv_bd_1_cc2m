-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - MYSQL/MARIADB
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
ALTER TABLE trabalha_em MODIFY horas DECIMAL(3,1) NULL;

/*
 * Alguns endereços nos dados de funcionários são mais longos que 30 caracteres,
 * dessa forma foi necessário alterar a coluna endereco para aumentar seu tamanho.
 */
ALTER TABLE funcionario 
    MODIFY endereco VARCHAR(40);

/*
 * Esse é outro erro do projeto do Elmasri, já que o cpf_supervisor deve poder
 * ser nulo quando um funcionário não possuir um supervisor. Para resolver esse
 * problema, foi necessário alterar a coluna retirando o NOT NULL.
 */ 
ALTER TABLE funcionario MODIFY cpf_supervisor CHAR(11) NULL;

/*
 * Adiciona os funcionários a tabela de funcionario. Essa ordem deve ser mantida,
 * pois o supervisor deve ser adicionado antes de seu subordinado.
 */
INSERT INTO funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES
('Jorge', 'E', 'Brito', '88866555576', '1937-11-10', 'Rua do Horto, 35, São Paulo, SP', 'M', 55000, NULL, 1),
('Fernando', 'T', 'Wong', '33344555587', '1955-12-08', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40000, '88866555576', 5),
('João', 'B', 'Silva', '12345678966', '1965-01-09', 'Rua das Flores, 751, São Paulo, SP', 'M', 30000, '33344555587', 5),
('Jennifer', 'S', 'Souza', '98765432168', '1941-06-20', 'Av. Arthur de Lima, 54, Santo André, SP', 'F', 43000, '88866555576', 4),
('Alice', 'J', 'Zelaya', '99988777767', '1968-01-19', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25000, '98765432168', 4),
('Ronaldo', 'K', 'Lima', '66688444476', '1962-09-15', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38000, '33344555587', 5),
('Joice', 'A', 'Leite', '45345345376', '1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25000, '33344555587', 5),
('André', 'V', 'Pereira', '98798798733', '1969-03-29', 'Rua Timbira, 35, São Paulo, SP', 'M', 25000, '98765432168', 4);

-- Adiciona os dependentes a tabela de dependente.
INSERT INTO departamento (nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente) VALUES
('Pesquisa', 5, '33344555587', '1988-05-22'),
('Administração', 4, '98765432168', '1995-01-01'),
('Matriz', 1, '88866555576', '1981-06-16');

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
('33344555587', 'Alicia', 'F', '1986-04-05', 'Filha'),
('33344555587', 'Tiago', 'M', '1983-10-25', 'Filho'),
('33344555587', 'Janaína', 'F', '1958-05-03', 'Filha'),
('98765432168', 'Antonio', 'M', '1942-02-28', 'Marido'),
('12345678966', 'Michael', 'M', '1988-01-04', 'Filho'),
('12345678966', 'Alicia', 'F', '1988-12-30', 'Filha'),
('12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa');

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
ALTER TABLE departamento
    COMMENT = 'Tabela que armazena as informações dos departamentos';
ALTER TABLE departamento MODIFY numero_departamento INTEGER NOT NULL
    COMMENT 'Número do departamento. Chave primária.';
ALTER TABLE departamento MODIFY nome_departamento VARCHAR(15) NOT NULL,
    COMMENT 'Nome do departamento. Pode ter até 15 caracteres.';
ALTER TABLE departamento MODIFY cpf_gerente CHAR(11) NOT NULL
    COMMENT 'CPF do gerente do departamento. Chave estrangeira que relaciona a tabela de funcionario.';
ALTER TABLE departamento MODIFY data_inicio_gerente DATE
    COMMENT 'Data de início do gerente do departamento. Pode ser nula.';

-- Adiciona comentários a tabela dependente e suas colunas
ALTER TABLE dependente
    COMMENT = 'Tabela que armazena as informações dos dependentes de cada funcionario';
ALTER TABLE dependente MODIFY nome_dependente VARCHAR(15) NOT NULL
    COMMENT 'Nome do dependente. Uma das chaves primárias.';
ALTER TABLE dependente MODIFY cpf_funcionario  CHAR(11) NOT NULL
    COMMENT 'CPF do funcionario. Chave estrangeira e primária que relaciona a tabela de funcionario.';
ALTER TABLE dependente MODIFY sexo CHAR(1)
    COMMENT 'Sexo do dependente. Pode ser M ou F.';
ALTER TABLE dependente MODIFY data_nascimento DATE
    COMMENT 'Data de nascimento do dependente. Pode ser nula.';
ALTER TABLE dependente MODIFY parentesco VARCHAR(15)
    COMMENT 'Parentesco do dependente. Pode ter até 15 caracteres.';

-- Adiciona comentários a tabela funcionario e suas colunas
ALTER TABLE funcionario
    COMMENT = 'Tabela que armazena as informações dos funcionarios';
ALTER TABLE funcionario MODIFY cpf CHAR(11) NOT NULL
    COMMENT 'CPF do funcionario. Chave primária.';
ALTER TABLE funcionario MODIFY primeiro_nome VARCHAR(15) NOT NULL
    COMMENT 'Primeiro nome do funcionario. Pode ter até 15 caracteres.';
ALTER TABLE funcionario MODIFY nome_meio CHAR(1)
    COMMENT 'Inicial do nome do meio do funcionário, caso exista.';
ALTER TABLE funcionario MODIFY ultimo_nome VARCHAR(15) NOT NULL
    COMMENT 'Sobrenome do funcionario. Pode ter até 15 caracteres.';
ALTER TABLE funcionario MODIFY data_nascimento DATE
    COMMENT 'Data de nascimento do funcionario. Pode ser nula.';
ALTER TABLE funcionario MODIFY sexo CHAR(1)
    COMMENT 'Sexo do funcionario. Pode ser M ou F.';
ALTER TABLE funcionario MODIFY endereco VARCHAR(40)
    COMMENT 'Endereco do funcionario. Pode ter até 40 caracteres.';
ALTER TABLE funcionario MODIFY salario DECIMAL(10, 2) NOT NULL
    COMMENT 'Salário do funcionario. Pode ser nulo. Não pode ser negativo.';
ALTER TABLE funcionario MODIFY cpf_supervisor CHAR(11) NULL
    COMMENT 'CPF do supervisor do funcionario. Chave estrangeira que relaciona a tabela de funcionario. Não pode ser igual ao CPF do funcionario.';
ALTER TABLE funcionario MODIFY numero_departamento INTEGER NOT NULL
    COMMENT 'Número do departamento. Chave estrangeira que relaciona a tabela de departamento.';

-- Adiciona comentários a tabela localizacoes_departamento e suas colunas
ALTER TABLE localizacoes_departamento
    COMMENT = 'Tabela que armazena as informações das localizações dos departamentos';
ALTER TABLE localizacoes_departamento MODIFY numero_departamento INTEGER NOT NULL
    COMMENT 'Número do departamento. Chave estrangeira que relaciona a tabela de departamento.';
ALTER TABLE localizacoes_departamento MODIFY local VARCHAR(15) NOT NULL
    COMMENT 'Local da localização. Pode ter até 15 caracteres. Chave primária.';

-- Adiciona comentários a tabela projeto e suas colunas
ALTER TABLE projeto
    COMMENT = 'Tabela que armazena as informações dos projetos';
ALTER TABLE projeto MODIFY numero_projeto INTEGER NOT NULL
    COMMENT 'Número do projeto. Chave primária.';
ALTER TABLE projeto MODIFY nome_projeto VARCHAR(15) NOT NULL
    COMMENT 'Nome do projeto. Pode ter até 15 caracteres. Único. Chave secundária.';
ALTER TABLE projeto MODIFY local_projeto VARCHAR(15)
    COMMENT 'Local do projeto. Pode ter até 15 caracteres.';
ALTER TABLE projeto MODIFY numero_departamento INTEGER NOT NULL
    COMMENT 'Número do departamento. Chave estrangeira que relaciona a tabela de departamento.';

-- Adiciona comentários a tabela trabalha_em e suas colunas
ALTER TABLE trabalha_em
    COMMENT = 'Tabela que armazena as informações das pessoas que trabalham em determinado projeto';
ALTER TABLE trabalha_em MODIFY cpf_funcionario CHAR(11) NOT NULL
    COMMENT 'CPF do funcionario. Chave estrangeira que relaciona a tabela de funcionario.';
ALTER TABLE trabalha_em MODIFY numero_projeto INTEGER NOT NULL
    COMMENT 'Número do projeto. Chave estrangeira que relaciona a tabela de projeto.';
ALTER TABLE trabalha_em MODIFY horas DECIMAL(3, 1) NULL
    COMMENT 'Horas que o funcionario trabalhou no projeto. Pode ser nulo.';
