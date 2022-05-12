-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0010
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

SELECT d.numero_departamento
, d.nome_departamento
, AVG(f.salario) AS media_salarial
FROM funcionario AS f
JOIN departamento AS d
ON f.numero_departamento = d.numero_departamento
GROUP BY d.numero_departamento;
