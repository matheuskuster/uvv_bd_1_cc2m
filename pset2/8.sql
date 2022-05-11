SELECT d.nome_departamento
, p.nome_projeto
, CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_funcionario
, t.horas
FROM elmasri.funcionario AS f
JOIN elmasri.trabalha_em AS t
ON t.cpf_funcionario = f.cpf
JOIN elmasri.projeto AS p
ON t.numero_projeto = p.numero_projeto
JOIN elmasri.departamento AS d
ON d.numero_departamento = p.numero_departamento
ORDER BY d.nome_departamento ASC;
