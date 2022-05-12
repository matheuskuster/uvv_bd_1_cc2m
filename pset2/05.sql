-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0005
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

SELECT d.nome_departamento, CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome, f.salario,
CASE
	WHEN f.cpf = d.cpf_gerente THEN 'Gerente'
  ELSE 'Funcionario'
END AS posicao
FROM departamento AS d JOIN funcionario AS f ON d.numero_departamento = f.numero_departamento
ORDER BY d.nome_departamento ASC, f.salario DESC;
