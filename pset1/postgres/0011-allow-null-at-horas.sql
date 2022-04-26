-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0011 - Altera a coluna horas da tabela trabalha_em para remover o NOT NULL
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

/*
 * Esse é um dos erros do projeto do Elmasri, já que as horas devem poder
 * ser nulas. Para resolver esse problema, foi necessário alterar a coluna
 * retirando o NOT NULL.
 */
ALTER TABLE trabalha_em ALTER COLUMN horas DROP NOT NULL;
