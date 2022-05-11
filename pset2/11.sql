SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_funcionario
, SUM(t.horas) AS horas_totais
, SUM(t.horas) * 50 AS valor_total
FROM elmasri.funcionario AS f
JOIN elmasri.trabalha_em AS t
ON t.cpf_funcionario = f.cpf
GROUP BY f.cpf;
