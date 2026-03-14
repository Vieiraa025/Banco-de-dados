create database empresa_luizG;
use empresa_luizG;
create table funcionario (
numero integer not null,
nome varchar (100),
rua varchar (50),
nro integer,
bairro varchar (20),
cidade varchar (20),
estado varchar (20),
cep varchar(9),
salario float,
numeroSupervisor integer,
primary key (numero),
foreign key (numeroSupervisor) references funcionario (numero)
);

create table departamento (
numero integer,
nome varchar (100),
numeroFuncGer integer,
datainGer date,
primary key (numero),
foreign key (numeroFuncGer) references departamento (numero)
);

create table projeto(
numero integer,
nome varchar( 100),
numeroDepto integer,
primary key (numero),
foreign key (numerodepto) references projeto (numero)
);

create table  dependentes(
numeroFun integer,
nome varchar(100),
dataNasc date,
parentesco varchar (100),
primary key (numeroFun ,nome),
foreign key  (numeroFun) references funcionario (numero)

);
 Create table LocalDep (
numeroDepto int not null,
localizacao varchar (32),
primary key (numeroDepto, localizacao),
foreign key (numeroDepto) references Departamento (numero)
);

create table FuncionarioProjeto (
numeroProj int,
numeroFuncionarios int,
horas time,
primary key (numeroFuncionarios, numeroProj),
foreign key (numeroFuncionarios) references Funcionario(numero),
foreign key (numeroProj) references Projeto (numero)
);


















