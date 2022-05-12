-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0014
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

SELECT d.nome_departamento
, COUNT(f.cpf) AS numero_funcionarios
FROM funcionario AS f
JOIN departamento AS d
ON d.numero_departamento = f.numero_departamento
GROUP BY d.nome_departamento;
