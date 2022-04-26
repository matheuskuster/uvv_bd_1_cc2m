-- -----------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - MYSQL/MARIADB
-- 0006 - Criação de tabela trabalha_em
-- -----------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS trabalha_em (
  cpf_funcionario CHAR(11) NOT NULL,
  numero_projeto INTEGER NOT NULL,
  horas DECIMAL(3, 1) NOT NULL
);
