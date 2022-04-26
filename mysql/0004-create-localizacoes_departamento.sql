-- -----------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - MYSQL/MARIADB
-- 0004 - Criação de tabela localizacoes_departamento
-- -----------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS localizacoes_departamento (
	numero_departamento INTEGER NOT NULL,
	local VARCHAR(15) NOT NULL
);
