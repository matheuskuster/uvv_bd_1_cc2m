SELECT d.numero_departamento, d.nome_departamento, AVG(salario) as media_salario FROM elmasri.departamento as d
JOIN elmasri.funcionario as f ON d.numero_departamento = f.numero_departamento GROUP BY d.numero_departamento;
