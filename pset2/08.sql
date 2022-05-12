-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0008
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

SELECT d.nome_departamento
, p.nome_projeto
, CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_funcionario
, t.horas
FROM funcionario AS f
JOIN trabalha_em AS t
ON t.cpf_funcionario = f.cpf
JOIN projeto AS p
ON t.numero_projeto = p.numero_projeto
JOIN departamento AS d
ON d.numero_departamento = p.numero_departamento
ORDER BY d.nome_departamento ASC;
