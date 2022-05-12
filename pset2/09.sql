-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0009
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

SELECT d.nome_departamento
, p.nome_projeto
, SUM(t.horas) AS horas_totais
FROM departamento AS d
JOIN projeto AS p
ON d.numero_departamento = p.numero_departamento
JOIN trabalha_em AS t
ON t.numero_projeto = p.numero_projeto
GROUP BY d.nome_departamento, p.nome_projeto
ORDER BY d.nome_departamento ASC;
