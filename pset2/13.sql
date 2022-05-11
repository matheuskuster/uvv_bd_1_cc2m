SELECT CONCAT(primeiro_nome, ' ', nome_meio, '. ', ultimo_nome) AS nome
, sexo
, DATE_PART('year', AGE(data_nascimento)) AS idade
FROM elmasri.funcionario UNION
SELECT nome_dependente
, sexo
, DATE_PART('year', AGE(data_nascimento)) AS idade
FROM elmasri.dependente
ORDER BY idade DESC;
