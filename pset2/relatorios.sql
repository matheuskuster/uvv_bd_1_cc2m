-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET2) - POSTGRES
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------


-- -----------------------------------------------------------------------------------
-- PSET 2 - 0001
-- -----------------------------------------------------------------------------------
SELECT d.numero_departamento
, d.nome_departamento
, AVG(salario) as media_salario 
FROM departamento as d
JOIN funcionario as f 
ON d.numero_departamento = f.numero_departamento
GROUP BY d.numero_departamento;

-- -----------------------------------------------------------------------------------
-- PSET 2 - 0002
-- -----------------------------------------------------------------------------------
SELECT sexo, AVG(salario) as media_salario FROM funcionario GROUP BY sexo;

-- -----------------------------------------------------------------------------------
-- PSET 2 - 0003
-- -----------------------------------------------------------------------------------
SELECT d.nome_departamento
, CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_completo
, DATE_PART('year', AGE(f.data_nascimento)) AS idade_em_anos
, f.salario
FROM departamento AS d
JOIN funcionario AS f
ON d.numero_departamento = f.numero_departamento
ORDER BY nome_departamento ASC;

-- -----------------------------------------------------------------------------------
-- PSET 2 - 0004
-- -----------------------------------------------------------------------------------
SELECT CONCAT(primeiro_nome, ' ', nome_meio, '. ', ultimo_nome) AS nome_completo
, DATE_PART('year', AGE(data_nascimento)) AS idade_em_anos
, salario
, CASE
		WHEN salario < 35000 THEN salario * 1.2
  	ELSE salario * 1.15
  END AS reajuste
FROM funcionario;

-- -----------------------------------------------------------------------------------
-- PSET 2 - 0005
-- -----------------------------------------------------------------------------------
SELECT d.nome_departamento, CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome, f.salario,
CASE
	WHEN f.cpf = d.cpf_gerente THEN 'Gerente'
  ELSE 'Funcionario'
END AS posicao
FROM departamento AS d JOIN funcionario AS f ON d.numero_departamento = f.numero_departamento
ORDER BY d.nome_departamento ASC, f.salario DESC;

-- -----------------------------------------------------------------------------------
-- PSET 2 - 0006
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

-- -----------------------------------------------------------------------------------
-- PSET 2 - 0007
-- -----------------------------------------------------------------------------------
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_completo
, f.salario
, d.nome_departamento
, d.numero_departamento
FROM funcionario AS f
JOIN departamento AS d
ON f.numero_departamento = d.numero_departamento
WHERE cpf NOT IN (SELECT cpf_funcionario FROM dependente);

-- -----------------------------------------------------------------------------------
-- PSET 2 - 0008
-- -----------------------------------------------------------------------------------
SELECT d.nome_departamento
, p.nome_projeto
, CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_funcionario
, t.horas
FROM funcionario AS f
JOIN trabalha_em AS t
ON t.cpf_funcionario = f.cpf
JOIN projeto AS p
ON t.numero_projeto = p.numero_projeto
JOIN departamento AS d
ON d.numero_departamento = p.numero_departamento
ORDER BY d.nome_departamento ASC;

-- -----------------------------------------------------------------------------------
-- PSET 2 - 0009
-- -----------------------------------------------------------------------------------
SELECT d.nome_departamento
, p.nome_projeto
, SUM(t.horas) AS horas_totais
FROM departamento AS d
JOIN projeto AS p
ON d.numero_departamento = p.numero_departamento
JOIN trabalha_em AS t
ON t.numero_projeto = p.numero_projeto
GROUP BY d.nome_departamento, p.nome_projeto
ORDER BY d.nome_departamento ASC;

-- -----------------------------------------------------------------------------------
-- PSET 2 - 0010
-- -----------------------------------------------------------------------------------
SELECT d.numero_departamento
, d.nome_departamento
, AVG(f.salario) AS media_salarial
FROM funcionario AS f
JOIN departamento AS d
ON f.numero_departamento = d.numero_departamento
GROUP BY d.numero_departamento;

-- -----------------------------------------------------------------------------------
-- PSET 2 - 0011
-- -----------------------------------------------------------------------------------
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_funcionario
, SUM(t.horas) AS horas_totais
, SUM(t.horas) * 50 AS valor_total
FROM funcionario AS f
JOIN trabalha_em AS t
ON t.cpf_funcionario = f.cpf
GROUP BY f.cpf;

-- -----------------------------------------------------------------------------------
-- PSET 2 - 0012
-- -----------------------------------------------------------------------------------
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_funcionario
, d.nome_departamento
, p.nome_projeto
FROM funcionario AS f
JOIN trabalha_em AS t
ON t.cpf_funcionario = f.cpf
JOIN projeto AS p
ON p.numero_projeto = t.numero_projeto
JOIN departamento AS d
ON p.numero_departamento = d.numero_departamento
WHERE t.horas IS NULL
AND t.numero_projeto IS NOT NULL;

-- -----------------------------------------------------------------------------------
-- PSET 2 - 0013
-- -----------------------------------------------------------------------------------
SELECT CONCAT(primeiro_nome, ' ', nome_meio, '. ', ultimo_nome) AS nome
, sexo
, DATE_PART('year', AGE(data_nascimento)) AS idade
FROM funcionario UNION
SELECT nome_dependente
, sexo
, DATE_PART('year', AGE(data_nascimento)) AS idade
FROM dependente
ORDER BY idade DESC;

-- -----------------------------------------------------------------------------------
-- PSET 2 - 0014
-- -----------------------------------------------------------------------------------
SELECT d.nome_departamento
, COUNT(f.cpf) AS numero_funcionarios
FROM funcionario AS f
JOIN departamento AS d
ON d.numero_departamento = f.numero_departamento
GROUP BY d.nome_departamento;

-- -----------------------------------------------------------------------------------
-- PSET 2 - 0015
-- -----------------------------------------------------------------------------------
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_funcionario
, d.nome_departamento
, p.nome_projeto
FROM funcionario AS f
JOIN departamento AS d
ON f.numero_departamento = d.numero_departamento
JOIN trabalha_em AS t
ON t.cpf_funcionario = f.cpf
JOIN projeto AS p
ON t.numero_projeto = p.numero_projeto;

