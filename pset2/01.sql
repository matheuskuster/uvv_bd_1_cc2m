-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0001
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

SELECT d.numero_departamento
, d.nome_departamento
, AVG(salario) as media_salario 
FROM departamento as d
JOIN funcionario as f 
ON d.numero_departamento = f.numero_departamento
GROUP BY d.numero_departamento;
