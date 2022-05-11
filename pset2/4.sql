SELECT CONCAT(primeiro_nome, ' ', nome_meio, '. ', ultimo_nome) AS nome_completo
, DATE_PART('year', AGE(data_nascimento)) AS idade_em_anos
, salario
, CASE
		WHEN salario < 35000 THEN salario * 1.2
  	ELSE salario * 1.15
  END AS reajuste
FROM elmasri.funcionario;
