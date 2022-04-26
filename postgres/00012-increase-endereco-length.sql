-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0012 - Altera a coluna endereco da tabela funcionario para aumentar seu tamanho
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

/*
 * Alguns endereços nos dados de funcionários são mais longos que 30 caracteres,
 * dessa forma foi necessário alterar a coluna endereco para aumentar seu tamanho.
 */
ALTER TABLE funcionario 
    ALTER COLUMN endereco TYPE VARCHAR(40);
