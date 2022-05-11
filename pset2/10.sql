SELECT d.numero_departamento
, d.nome_departamento
, AVG(f.salario) AS media_salarial
FROM elmasri.funcionario AS f
JOIN elmasri.departamento AS d
ON f.numero_departamento = d.numero_departamento
GROUP BY d.numero_departamento;
