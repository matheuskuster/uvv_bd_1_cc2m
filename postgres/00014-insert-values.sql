-- -----------------------------------------------------------------------------------
-- Design e Desenvolvimento de Banco de Dados (PSET1) - POSTGRES
-- 0014 - Adiciona valores às tabelas
-- -----------------------------------------------------------------------------------
-- Por: Matheus Kuster Rosa (CC2M)
--      matheuskuster@hotmail.com
-- -----------------------------------------------------------------------------------

/*
 * Adiciona os funcionários a tabela de funcionario. Essa ordem deve ser mantida,
 * pois o supervisor deve ser adicionado antes de seu subordinado.
 */
INSERT INTO funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) VALUES
('Jorge', 'E', 'Brito', '88866555576', '11-10-1937', 'Rua do Horto, 35, São Paulo, SP', 'M', 55000, NULL, 1),
('Fernando', 'T', 'Wong', '33344555587', '12-08-1955', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40000, '88866555576', 5),
('João', 'B', 'Silva', '12345678966', '01-09-1965', 'Rua das Flores, 751, São Paulo, SP', 'M', 30000, '33344555587', 5),
('Jennifer', 'S', 'Souza', '98765432168', '06-20-1941', 'Av. Arthur de Lima, 54, Santo André, SP', 'F', 43000, '88866555576', 4),
('Alice', 'J', 'Zelaya', '99988777767', '01-19-1968', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25000, '98765432168', 4),
('Ronaldo', 'K', 'Lima', '66688444476', '09-15-1962', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38000, '33344555587', 5),
('Joice', 'A', 'Leite', '45345345376', '07-31-1972', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25000, '33344555587', 5),
('André', 'V', 'Pereira', '98798798733', '03-29-1969', 'Rua Timbira, 35, São Paulo, SP', 'M', 25000, '98765432168', 4);

-- Adiciona os dependentes a tabela de dependente.
INSERT INTO departamento (nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente) VALUES
('Pesquisa', 5, '33344555587', '05-22-1988'),
('Administração', 4, '98765432168', '01-01-1995'),
('Matriz', 1, '88866555576', '06-16-1981');

-- Adiciona as localizações de cada departamento.
INSERT INTO localizacoes_departamento (numero_departamento, local) VALUES
(1, 'São Paulo'),
(4, 'Mauá'),
(5, 'Santo André'),
(5, 'Itu'),
(5, 'São Paulo');

-- Adiciona os projetos a tabela de projeto.
INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento) VALUES
('ProdutoX', 1, 'Santo André', 5),
('ProdutoY', 2, 'Itu', 5),
('ProdutoZ', 3, 'São Paulo', 5),
('Informatização', 10, 'Mauá', 4),
('Reorganização', 20, 'São Paulo', 1),
('Novosbenefícios', 30, 'Mauá', 4);

-- Adiciona os dependentes dos funcionários a tabela de dependente.
INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES
('33344555587', 'Alicia', 'F', '04-05-1986', 'Filha'),
('33344555587', 'Tiago', 'M', '10-25-1983', 'Filho'),
('33344555587', 'Janaína', 'F', '05-03-1958', 'Filha'),
('98765432168', 'Antonio', 'M', '02-28-1942', 'Marido'),
('12345678966', 'Michael', 'M', '01-04-1988', 'Filho'),
('12345678966', 'Alicia', 'F', '12-30-1988', 'Filha'),
('12345678966', 'Elizabeth', 'F', '05-05-1967', 'Esposa');

-- Adiciona a relação de onde trabalha cada funcionário, além das horas trabalhadas.
INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas) VALUES
('12345678966', 1, 32.5),
('12345678966', 2, 7.5),
('66688444476', 3, 40),
('45345345376', 1, 20),
('45345345376', 2, 20),
('33344555587', 2, 10),
('33344555587', 3, 10),
('33344555587', 10, 10),
('33344555587', 20, 10),
('99988777767', 30, 30),
('99988777767', 10, 10),
('98798798733', 10, 35),
('98798798733', 30, 5),
('98765432168', 30, 20),
('98765432168', 20, 15),
('88866555576', 20, NULL);
