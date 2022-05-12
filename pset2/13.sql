-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0013
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

SELECT CONCAT(primeiro_nome, ' ', nome_meio, '. ', ultimo_nome) AS nome
, sexo
, DATE_PART('year', AGE(data_nascimento)) AS idade
FROM funcionario UNION
SELECT nome_dependente
, sexo
, DATE_PART('year', AGE(data_nascimento)) AS idade
FROM dependente
ORDER BY idade DESC;
