-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0006
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_funcionario
, depa.nome_departamento
, depe.nome_dependente
, DATE_PART('year', AGE(depe.data_nascimento)) AS idade_dependente
, CASE (depe.sexo)
		WHEN 'M' THEN 'Masculino'
  	ELSE 'Feminino'
  END AS sexo_dependente
FROM funcionario AS f
JOIN dependente AS depe ON f.cpf = depe.cpf_funcionario
JOIN departamento AS depa ON depa.numero_departamento = f.numero_departamento;
