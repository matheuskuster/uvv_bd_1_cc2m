-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0007
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_completo
, f.salario
, d.nome_departamento
, d.numero_departamento
FROM funcionario AS f
JOIN departamento AS d
ON f.numero_departamento = d.numero_departamento
WHERE cpf NOT IN (SELECT cpf_funcionario FROM dependente);
