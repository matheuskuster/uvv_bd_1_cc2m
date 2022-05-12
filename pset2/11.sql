-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0011
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_funcionario
, SUM(t.horas) AS horas_totais
, SUM(t.horas) * 50 AS valor_total
FROM funcionario AS f
JOIN trabalha_em AS t
ON t.cpf_funcionario = f.cpf
GROUP BY f.cpf;
