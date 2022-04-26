-- -----------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - MYSQL/MARIADB
-- 0007 - Altera tabelas para adicionar chave primária
-- -----------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------

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
