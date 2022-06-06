drop schema if exists trabalho_bd;
create schema trabalho_bd;
use trabalho_bd;

create table funcionario (
	cpf int primary key,
    nome varchar(80),
    endereco varchar(80),
    cpf_gerente int,
    foreign key(cpf_gerente) references funcionario(cpf)
);

create table gerente (
	cpf int primary key,
    responsabilidade varchar(80),
    CFA int,
    numero_da_sala int,
    foreign key (cpf) references funcionario (cpf)
);

create table manutencao (
	cpf int primary key,
    ferramentas varchar(80),
    horario_de_trabalho varchar(80),
    equipamentos varchar(80),
    foreign key (cpf) references funcionario (cpf)
);

create table motorista (
    cpf int primary key,
    cnh int,
    foreign key (cpf) references funcionario (cpf)
);

create table frota(
	id int primary key,
    caminho_realizado varchar(80),
    peso_carga int
);

create table vendedor (
	cpf int primary key,
    quantidade_de_vendas int,
    numero_celular int,
    ligacoes_dia int,
    foreign key (cpf) references funcionario (cpf)
);

create table produto (
	nome varchar(80) primary key,
    composicao varchar(80),
    finalidade varchar(80)
);

create table empresa_compradora (
	cnpj int primary key,
    nome varchar(80),
    endereco varchar(80)
);

create table pedido (
	id int primary key,
    emissao datetime,
    valor int,
    cnpj int,
    cpf_motorista int,
    id_frota int,
    foreign key(cnpj) references empresa_compradora(cnpj),
	foreign key(cpf_motorista) references motorista(cpf),
    foreign key(id_frota) references frota(id)
);

create table maquina (
	id int primary key,
    nome varchar(80),
    funcao varchar(80)
);

create table peca (
	id int primary key,
    funcao varchar(80),
    nome varchar(80)
);

/* create table gerencia(

);
*/

create table reparo(
	cpf int,
    id_maquina int,
    primary key(cpf, id_maquina),
    foreign key(cpf) references manutencao(cpf),
    foreign key(id_maquina) references maquina(id)
);

create table vende(
	cpf int,
    nome varchar(80),
    primary key(cpf, nome),
	foreign key(cpf) references vendedor(cpf),
    foreign key(nome) references produto(nome)
);

create table contem(
	nome varchar(80),
    id_pedido int,
    quantidade int,
    primary key(nome, id_pedido),
	foreign key(nome) references produto(nome),
    foreign key(id_pedido) references pedido(id)
);
