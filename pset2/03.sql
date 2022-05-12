-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0003
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

SELECT d.nome_departamento
, CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_completo
, DATE_PART('year', AGE(f.data_nascimento)) AS idade_em_anos
, f.salario
FROM departamento AS d
JOIN funcionario AS f
ON d.numero_departamento = f.numero_departamento
ORDER BY nome_departamento ASC;
