SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_completo
, f.salario
, d.nome_departamento
, d.numero_departamento
FROM elmasri.funcionario AS f
JOIN elmasri.departamento AS d
ON f.numero_departamento = d.numero_departamento
WHERE cpf NOT IN (SELECT cpf_funcionario FROM elmasri.dependente);
