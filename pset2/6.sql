
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_funcionario
, depa.nome_departamento
, depe.nome_dependente
, DATE_PART('year', AGE(depe.data_nascimento)) AS idade_dependente
, CASE (depe.sexo)
		WHEN 'M' THEN 'Masculino'
  	ELSE 'Feminino'
  END AS sexo_dependente
FROM elmasri.funcionario AS f
JOIN elmasri.dependente AS depe ON f.cpf = depe.cpf_funcionario
JOIN elmasri.departamento AS depa ON depa.numero_departamento = f.numero_departamento;
