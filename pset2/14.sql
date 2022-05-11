SELECT d.nome_departamento
, COUNT(f.cpf) AS numero_funcionarios
FROM elmasri.funcionario AS f
JOIN elmasri.departamento AS d
ON d.numero_departamento = f.numero_departamento
GROUP BY d.nome_departamento;
