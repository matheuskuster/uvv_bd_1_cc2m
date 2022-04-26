-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - MYSQL/MARIADB
-- 0009 - Adiciona checagens a alguns campos do banco de dados
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

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
