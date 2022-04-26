-- -----------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - MYSQL/MARIADB
-- 0002 - Criação de tabela dependente
-- -----------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS dependente (
	cpf_funcionario CHAR(11) NOT NULL,
	nome_dependente VARCHAR(15) NOT NULL,
	sexo CHAR(1),
	data_nascimento DATE,
	parentesco VARCHAR(15)
);
