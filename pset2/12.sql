-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0012
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_funcionario
, d.nome_departamento
, p.nome_projeto
FROM funcionario AS f
JOIN trabalha_em AS t
ON t.cpf_funcionario = f.cpf
JOIN projeto AS p
ON p.numero_projeto = t.numero_projeto
JOIN departamento AS d
ON p.numero_departamento = d.numero_departamento
WHERE t.horas IS NULL
AND t.numero_projeto IS NOT NULL;