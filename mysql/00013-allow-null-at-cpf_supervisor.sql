-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - MYSQL/MARIADB
-- 0013 - Altera a coluna cpf_supervisor da tabela funcionario permitir NULL
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

/*
 * Esse é outro erro do projeto do Elmasri, já que o cpf_supervisor deve poder
 * ser nulo quando um funcionário não possuir um supervisor. Para resolver esse
 * problema, foi necessário alterar a coluna retirando o NOT NULL.
 */ 
ALTER TABLE funcionario MODIFY cpf_supervisor CHAR(11) NULL;
