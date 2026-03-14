USE empresa_luizG;

INSERT INTO Funcionario VALUES (1, 'Marcos Silva', 'Rua A', '100', 'Centro', 'São Paulo', 'SP', '01000-000', 15000.00, 1);
INSERT INTO Funcionario VALUES (2, 'Ana Costa', 'Av. B', '250', 'Jardins', 'São Paulo', 'SP', '02000-000', 8000.00, 1);
INSERT INTO Funcionario VALUES (3, 'Carlos Souza', 'Rua C', '50', 'Lapa', 'São Paulo', 'SP', '03000-000', 4500.00, 2);


INSERT INTO departamento VALUES (10, 'Tecnologia', 1, '2023-01-10');
INSERT INTO departamento VALUES (20, 'Recursos Humanos', 2, '2023-02-15');


INSERT INTO projetos VALUES (101, 'Sistema Interno', 10);
INSERT INTO projetos VALUES (102, 'Expansão Sul', 20);


INSERT INTO dependente VALUES (1, 'Julia Silva', '2015-05-20', 'Filha');
INSERT INTO dependente VALUES (2, 'Pedro Costa', '2018-11-10', 'Filho');


INSERT INTO LocalDep VALUES (10, 'Andar 5 - Bloco A');
INSERT INTO LocalDep VALUES (20, 'Andar 2 - Bloco B');


INSERT INTO FuncionarioProjo VALUES (1, 101, '40:00:00');
INSERT INTO FuncionarioProjo VALUES (2, 102, '20:00:00');
