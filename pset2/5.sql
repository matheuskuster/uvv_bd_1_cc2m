SELECT d.nome_departamento, CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome, f.salario,
CASE
	WHEN f.cpf = d.cpf_gerente THEN 'Gerente'
  ELSE 'Funcionario'
END AS posicao
FROM elmasri.departamento AS d JOIN elmasri.funcionario AS f ON d.numero_departamento = f.numero_departamento
ORDER BY d.nome_departamento ASC, f.salario ASC;
