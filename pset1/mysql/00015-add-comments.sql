-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - MYSQL/MARIADB
-- 0015 - Adiciona comentários a tabelas e colunas
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

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
