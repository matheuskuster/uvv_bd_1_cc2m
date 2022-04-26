-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - MYSQL/MARIADB
-- 0008 - Altera tabelas para adicionar chave estrangeira, criando relacionamentos
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

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
