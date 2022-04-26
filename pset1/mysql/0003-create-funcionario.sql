-- -----------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - MYSQL/MARIADB
-- 0003 - Criação de tabela funcionario
-- -----------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------

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
