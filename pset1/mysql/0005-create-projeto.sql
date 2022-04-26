-- -----------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - MYSQL/MARIADB
-- 0005 - Criação de tabela projeto
-- -----------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS projeto (
  numero_projeto INTEGER NOT NULL,
  nome_projeto VARCHAR(15) NOT NULL,
  local_projeto VARCHAR(15),
  numero_departamento INTEGER NOT NULL
);
