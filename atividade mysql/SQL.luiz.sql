drop database if exists empresa_luizg;
create database empresa_luizg;
use empresa_luizg;

create table Funcionario (
numero integer not null,
nomeFun varchar(255) not null,
rua varchar(200) not null,
nro varchar(10) not null,
bairro varchar(100) not null,
cidade varchar(100) not null,
estado varchar(100) not null,
cep varchar(20) not null,
salario float not null,
numeroSupervisor integer,
primary key (numero),
foreign key (numeroSupervisor) references Funcionario(numero)
);

create table departamento (
numero integer not null,
nomeDep varchar(255) not null,
numeroFuncGer integer not null,
dataIniGer date not null,
primary key (numero),
foreign key (numeroFuncGer) references Funcionario (numero)
);

create table projetos (
numero integer not null,
nomeProj varchar(255) not null,
numeroDepto integer not null,
primary key (numero),
foreign key (numeroDepto) references departamento (numero)
);

create table dependente (
numeroFunc integer not null,
nomeDep varchar(255) not null,
dataNasc date not null,
parentesco varchar(30) not null,
primary key (numeroFunc , nomeDep),
foreign key (numeroFunc) references Funcionario (numero)
);

create table LocalDep (
numeroDepto integer not null,
localizacao varchar (200) not null,
primary key(numeroDepto, localizacao),
foreign key (numeroDepto) references departamento(numero)
);

create table FuncionarioProjo (
numeroFunc integer not null,
numeroProj integer not null,
horas integer,
primary key (numeroFunc, numeroProj),
foreign key (numeroFunc) references Funcionario(numero),
foreign key (numeroProj) references projetos(numero)
);

insert into Funcionario values (1, 'Marcos Silva', 'Rua A', '100', 'Centro', 'São Paulo', 'SP', '01000-000', 15000.00, null);
insert into Funcionario values (2, 'Raissa de Costa', 'Av. B', '250', 'Jardins', 'São Paulo', 'SP', '02000-000', 8000.00, 1);
insert into Funcionario values (3, 'Carlos Souza', 'Rua C', '50', 'Lapa', 'São Paulo', 'SP', '03000-000', 4500.00, 2);
insert into Funcionario values (4, 'Carlos Pereira', 'Rua C', '50', 'Lapa', 'São Paulo', 'SP', '03000-000', 2500.00, 2);

insert into departamento values (10, 'Tecnologia', 1, '2023-01-10');
insert into departamento values (20, 'Recursos Humanos', 2, '2023-02-15');

insert into projetos values (101, 'Sistema Interno', 10);
insert into projetos values (102, 'Expansão Sul', 20);
insert into projetos values (2, 'Sistema D', 10);
insert into projetos values (3, 'Sistema C', 20);
insert into projetos values (4, 'Sistema C', 10);

insert into dependente values (1, 'Julia Silva', '2015-05-20', 'Filha');
insert into dependente values (2, 'Pedro Costa', '2018-11-10', 'Filho');

insert into LocalDep values (10, 'Andar 5 - Bloco A');
insert into LocalDep values (20, 'Andar 2 - Bloco B');

insert into FuncionarioProjo values (1, 101, 40);
insert into FuncionarioProjo values (2, 102, 20);
insert into FuncionarioProjo values (3, 3, 55);
insert into FuncionarioProjo values (4, 3, 60);

-- 1
select * from empresa_luizg.funcionario;
-- 2
select estado, nomeFun from funcionario;
-- 3
select distinct salario from funcionario;
-- 4
select nomeFun from funcionario where nomeFun like 'R%';
-- 5
select d.nomeDep, d.numeroFuncGer, f.nomeFun from funcionario f, departamento d where f.numero = d.numeroFuncGer;
-- 6
select d.numeroFuncGer, f.nomeFun, f.salario, d.dataIniGer from funcionario f, departamento d where f.numero = d.numeroFuncGer and f.salario >= 2000;
-- 7
select * from funcionario where salario = (select max(salario) from funcionario);
-- 8
select p.nomeProj, sum(fp.horas) from projetos p, FuncionarioProjo fp where p.numero = fp.numeroProj and p.numero = 2;

-- 9
select avg(horas) from FuncionarioProjo where numeroProj = 3;

-- 10
select nomeDep, year(curdate()) - year(dataNasc) as idade from dependente;

-- 11
select nomeFun from funcionario where cidade = 'São Paulo' and salario > 2200;

-- 12
select f.nomeFun, d.nomeDep from funcionario f, dependente d where f.numero = d.numeroFunc;

-- 13
select f.nomeFun, p.numero from funcionario f, projetos p, FuncionarioProjo fp where f.numero = fp.numeroFunc and p.numero = fp.numeroProj;

-- 14
select f.nomeFun, p.numero
from funcionario f, projetos p, FuncionarioProjo fp
where f.numero = fp.numeroFunc
and p.numero = fp.numeroProj
and fp.horas > 20;

-- 15
select * from funcionario order by nomeFun desc;
select * from funcionario order by nomeFun asc;

-- 16
select * from funcionario order by cidade asc, salario desc;

-- 17
select nomeFun
from funcionario
where salario between 1000 and 2000;

-- 18
select nomeFun
from funcionario
where cidade like '%ar%';

-- 19
select max(salario) from funcionario;

-- 20
select min(salario) from funcionario;

-- 21
select avg(salario) from funcionario;

-- 22
select sum(salario) from funcionario;

-- 23
select count(*)
from funcionario
where salario > 1500;

-- 24
select nomeFun
from funcionario
where cidade like 'São%';

-- 25
select count(*)
from funcionario
where salario > (select avg(salario) from funcionario);

-- 26
select nomeFun
from funcionario
where numeroSupervisor is null;

-- 27
select nomeFun
from funcionario
where numeroSupervisor is not null;

-- 28
select f.nomeFun, s.nomeFun as supervisor
from funcionario f, funcionario s
where f.numeroSupervisor = s.numero;

-- 29
select f.nomeFun
from funcionario f, FuncionarioProjo fp
where f.numero = fp.numeroFunc
and fp.horas = (select max(horas) from FuncionarioProjo);

-- 30
select distinct f.nomeFun
from funcionario f, FuncionarioProjo fp
where f.numero = fp.numeroFunc;

-- 31
select nomeFun
from funcionario
where numero not in (select numeroFunc from FuncionarioProjo);

-- 32
select f.nomeFun
from funcionario f, FuncionarioProjo fp
where f.numero = fp.numeroFunc
and fp.horas > (select avg(horas) from FuncionarioProjo);