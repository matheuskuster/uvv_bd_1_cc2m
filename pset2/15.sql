SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_funcionario
, d.nome_departamento
, p.nome_projeto
FROM elmasri.funcionario AS f
JOIN elmasri.departamento AS d
ON f.numero_departamento = d.numero_departamento
JOIN elmasri.trabalha_em AS t
ON t.cpf_funcionario = f.cpf
JOIN elmasri.projeto AS p
ON t.numero_projeto = p.numero_projeto;
