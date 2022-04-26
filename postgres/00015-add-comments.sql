-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0015 - Adiciona comentários a tabelas e colunas
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

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
