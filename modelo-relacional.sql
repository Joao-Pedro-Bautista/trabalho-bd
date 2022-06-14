drop schema if exists trabalho_bd;
create schema trabalho_bd;
use trabalho_bd;

create table gerente (
	cpf varchar(80) primary key,
    responsabilidade varchar(100),
    CFA varchar(80),
    numero_da_sala int
);
create table funcionario (
	cpf varchar(80) primary key,
    nome varchar(80),
    endereco varchar(80),
    cpf_gerente varchar(80)
);

alter table gerente add foreign key (cpf) references funcionario(cpf);
alter table funcionario add foreign key(cpf_gerente) references gerente(cpf);

create table manutencao (
	cpf varchar(80) primary key,
    funcao varchar(80),
    horario_de_trabalho varchar(80),
    equipamentos varchar(80),
    foreign key (cpf) references funcionario (cpf)
);

create table motorista (
    cpf varchar(80) primary key,
    cnh varchar(80),
    foreign key (cpf) references funcionario (cpf)
);

create table frota(
	placa varchar(80) primary key,
    capacidade_caminhao int,
    tamanho_caminhao varchar(80)
); 

create table vendedor (
	cpf varchar(80) primary key,
    quantidade_de_vendas int,
    numero_celular varchar(80),
    ligacoes_dia int,
    foreign key (cpf) references funcionario (cpf)
);

create table produto (
	nome varchar(100) primary key,
    composicao varchar(100),
    finalidade varchar(200)
);

create table empresa_compradora (
	cnpj varchar(80) primary key,
    nome varchar(80),
    endereco varchar(80)
);

create table pedido (
	id int primary key,
    emissao datetime,
    valor decimal(9,2) ,
    cnpj varchar(80),
    foreign key(cnpj) references empresa_compradora(cnpj)
);

create table maquina (
	id int primary key,
    nome varchar(80),
    funcao varchar(80)
);

create table peca (
	id int primary key,
    funcao varchar(250),
    nome varchar(80)
);

create table entrega(
	id_pedido int primary key,
    placa_caminhao varchar(80),
    cpf_motorista varchar(80),
    foreign key(id_pedido) references pedido(id),
	foreign key(placa_caminhao) references frota(placa),
    foreign key(cpf_motorista) references motorista(cpf)
);

create table reparo(
	cpf varchar(80),
    id_maquina int,
    primary key(cpf, id_maquina),
    foreign key(cpf) references manutencao(cpf),
    foreign key(id_maquina) references maquina(id)
);

create table vende(
	cpf varchar(80),
    nome varchar(80),
    primary key(cpf, nome),
	foreign key(cpf) references vendedor(cpf),
    foreign key(nome) references produto(nome)
);

create table contem_produto(
	nome varchar(80),
    id_pedido int,
    quantidade int,
    primary key(nome, id_pedido),
	foreign key(nome) references produto(nome),
    foreign key(id_pedido) references pedido(id)
);

create table contem_peca(
	id_maquina int,
    id_peca int, 
    primary key(id_maquina, id_peca),
    foreign key(id_maquina) references maquina(id),
    foreign key(id_peca) references peca(id)
);

# ENTIDADES: funcionario, gerente, manutencao, vendedor, frota, produto, empresa compradora, pedido, maquina, peca 
# RELACIONAMENTOS: entrega, reparo, vende, contem

#select * from funcionario; 
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('03206481090', 'Emanuela Gomes Mascarenhas', 'Travessa Antônio Ferreira', null);
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('90412586045', 'Kenzo Vilariça Gaspar', 'Avenida Rio Branco	', null);
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('10617427097', 'Louis Marmou Tabosa', 'Rua Frederico Moura', null);
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('51782750045', 'Naíma Freire Martins', 'Rua Arlindo Nogueira', null);
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('15122803056', 'Yana Ornelas Protásio', 'Rua Cristiano Olsen', null);
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('57418796080', 'Anaisa Barroqueiro Canto', 'Rua Pereira Estéfano', null);
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('51130544028', 'Yohanna Freiria Almada', 'Rua dos Carijós', null);
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('62328789064', 'Fedra Rebouças Covilhã', 'Avenida Almirante Maximiano Fonseca', null);
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('15122419035', 'Aaron Viegas Campelo', 'Rua Cristiano Olsen', null);
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('66841217063', 'Florinda Hipólito Vides', 'Avenida Rio Branco', null);
/**/
insert into gerente (cpf, responsabilidade, CFA, numero_da_sala) values ("03206481090", "Administrar funcionarios", "3466142602", 1);
insert into gerente (cpf, responsabilidade, CFA, numero_da_sala) values ("90412586045","Gerenciar questoes de vendas","904125860450", 2);
insert into gerente (cpf, responsabilidade, CFA, numero_da_sala) values ("10617427097", "Contratação de pessoas", "57376618320", 3);
insert into gerente (cpf, responsabilidade, CFA, numero_da_sala) values ("51782750045", "Treinamento de novos colaboradores", "7252458157", 4);
insert into gerente (cpf, responsabilidade, CFA, numero_da_sala) values ("15122803056","Motivação os funcionários", "5117241169", 5);
insert into gerente (cpf, responsabilidade, CFA, numero_da_sala) values ("57418796080","Incentivo à comunicação da equipe", "5881730084", 6);
insert into gerente (cpf, responsabilidade, CFA, numero_da_sala) values ("51130544028", "Organização geral", "5055820638", 7);
insert into gerente (cpf, responsabilidade, CFA, numero_da_sala) values ("62328789064", "Definição de metas", "9417535733",  8);
insert into gerente (cpf, responsabilidade, CFA, numero_da_sala) values ("15122419035", "Controle de entradas e saídas", "6473549805", 9);
insert into gerente (cpf, responsabilidade, CFA, numero_da_sala) values ("66841217063", "Gerente de TI", "9199806173", 10);
#cpf, nome, endereco, cpf gerente
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('80160601029', 'Melanie Viveiros Hipólito', 'Rodovia Raposo Tavares', "03206481090");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('51448983002', 'Silvana Varela Belo', 'Avenida Esbertalina Barbosa Damiani', "90412586045");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('74737716049', 'Dádiva Henriques Portela', 'Rua Paracatu', "10617427097");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('49790015054', 'Nayara Sandinha Cesário', 'Rua Frederico Moura', "51782750045");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('29434219019', 'Erica Caçoilo Vergueiro', 'Rua Carlos Augusto Cornelsen', "15122803056");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('40600776077', 'Isac Outeiro Castro', 'Rua dos Carijós', "57418796080");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('03688245008', 'Vicente Bentes Dias', 'Avenida Esbertalina Barbosa Damiani', "51130544028");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('00779653025', 'Catalina Brasil Godinho', 'Rua Serra de Bragança', "62328789064");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('27639222010', 'Virgínia Filipe Pescada', 'Praça da República', "15122419035");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('06287882077', 'Francesca Serro Couceiro', 'Travessa Antônio Ferreira', "66841217063");
#MOTORISTAS ACIMA
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ("24538107820", "Eduarda Silva Pinto", "Rua das Fiandeiras", "03206481090");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ("08162739017", "Kauê Barros Costa", "Rua Serra de Bragança", "90412586045");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ("24039496043", "Matilde Melo Pereira", "Avenida Governador José Malcher", "10617427097"); 
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ("99261018017", "Letícia Gomes Souza", "Rua Domingos Olímpio", "51782750045");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ("77154002034", "Sofia Cardoso Pinto", "Praça da República", "15122803056");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ("51478383097", "Luiz Barbosa Cunha", "Avenida Almirante Maximiano Fonseca", "57418796080");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ("02669625053", "Felipe Santos Rocha", "Travessa da CDL", "51130544028");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ("81892140047", "Aline Silva Goncalves", "Rua Frederico Moura", "62328789064");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ("27843720065", "Guilherme Silva Goncalves", "Rua Domingos Olímpio", "15122419035");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ("82846726000", "Antônio Lima Oliveira", "Rua Domingos Olímpio", "66841217063");
# MANUTENCAO ACIMA
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('97876578063', 'Guadalupe Alencar Carromeu', 'Rua Cristiano Olsen', "03206481090");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('97069957068', 'Ayrton Monteiro Simões', 'QE 11 Área Especial C', "90412586045");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('48621502097', 'Leila Nascimento Álvares', 'Travessa Antônio Ferreira', "10617427097");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('91328461009', 'Melissa Vilar Quinta', 'Avenida Governador José Malcher', "51782750045");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('97308156079', 'Cassandra Cardoso Prada', 'Avenida Almirante Maximiano Fonseca', "15122803056");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('43864607051', 'Georgi Fontes Cortesão', 'Rua da Imprensa', "57418796080");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('49808169082', 'Bela Casalinho Canário', 'Rua Maria Luísa do Val Penteado', "51130544028");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('72124998030', 'Lira Leiria Mendes', 'Avenida Almirante Maximiano Fonseca', "62328789064");
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('48893825007', 'Florinda Carromeu Vilar', 'Avenida Governador José Malcher', "15122419035");	
insert into funcionario (cpf, nome, endereco, cpf_gerente) values ('59017529024', 'Natália Casalinho Teodoro', 'Avenida São João', "66841217063");
#VENDEDOR ACIMA
insert into manutencao (cpf, funcao, horario_de_trabalho, equipamentos) values ('24538107820', 'Subcontratado', "13 as 18", 'Crawler');
insert into manutencao (cpf, funcao, horario_de_trabalho, equipamentos) values ("08162739017", 'Responsavel de projeto', "13 as 18", 'Skid-Steer');
insert into manutencao (cpf, funcao, horario_de_trabalho, equipamentos) values ("24039496043", 'Supervisor', '08 as 12', 'Compactor');
insert into manutencao (cpf, funcao, horario_de_trabalho, equipamentos) values ('99261018017', 'Estimador', '08 as 12', 'Backhoe');
insert into manutencao (cpf, funcao, horario_de_trabalho, equipamentos) values ('77154002034', 'Eletricista', '18 as 22', 'Dump Truck');
insert into manutencao (cpf, funcao, horario_de_trabalho, equipamentos) values ('51478383097', 'Eletricista', '13 as 18', 'Excavator');
insert into manutencao (cpf, funcao, horario_de_trabalho, equipamentos) values ('02669625053', 'Supervisor', '13 as 18', 'Crawler');
insert into manutencao (cpf, funcao, horario_de_trabalho, equipamentos) values ('81892140047', 'Engenheiro', '08 as 12', 'Dump Truck');
insert into manutencao (cpf, funcao, horario_de_trabalho, equipamentos) values ('27843720065', 'Supervisor', '08 as 12', 'Crawler');
insert into manutencao (cpf, funcao, horario_de_trabalho, equipamentos) values ('82846726000', 'Inspetor', '18 as 22', 'Scraper');
/* */
insert into motorista (cpf, cnh) values ('80160601029', '62043373501');
insert into motorista (cpf, cnh) values ('51448983002', '92785571868');
insert into motorista (cpf, cnh) values ('74737716049', '54299582182');
insert into motorista (cpf, cnh) values ('49790015054', '70312582934');
insert into motorista (cpf, cnh) values ('29434219019', '18846879230');
insert into motorista (cpf, cnh) values ('51478383097', '30948380695');
insert into motorista (cpf, cnh) values ('03688245008', '45956945601');
insert into motorista (cpf, cnh) values ('00779653025', '46926934001');
insert into motorista (cpf, cnh) values ('27639222010', '68189650156');
insert into motorista (cpf, cnh) values ('06287882077', '14587426402');
/* */
insert into frota (placa, capacidade_caminhao, tamanho_caminhao) values ('NAU9539', 5, 'Pequeno');
insert into frota (placa, capacidade_caminhao, tamanho_caminhao) values ('MBL6741', 8, 'Médio');
insert into frota (placa, capacidade_caminhao, tamanho_caminhao) values ('NAH4993', 10, 'Grande');
insert into frota (placa, capacidade_caminhao, tamanho_caminhao) values ('HSW7414', 5, 'Pequeno');
insert into frota (placa, capacidade_caminhao, tamanho_caminhao) values ('JRE0100', 10, 'Grande');
insert into frota (placa, capacidade_caminhao, tamanho_caminhao) values ('GCK9501', 8, 'Médio');
insert into frota (placa, capacidade_caminhao, tamanho_caminhao) values ('MNV6060', 8, 'Médio');
insert into frota (placa, capacidade_caminhao, tamanho_caminhao) values ('MWQ7445', 10, 'Grande');
insert into frota (placa, capacidade_caminhao, tamanho_caminhao) values ('LVM5189', 8, 'Médio');
insert into frota (placa, capacidade_caminhao, tamanho_caminhao) values ('JQP1544', 5, 'Pequeno');
/* */
insert into vendedor (cpf, quantidade_de_vendas, numero_celular, ligacoes_dia) values ('97876578063', 18, '(91) 96881-7719', 1);
insert into vendedor (cpf, quantidade_de_vendas, numero_celular, ligacoes_dia) values ('97069957068', 151, '(83) 98150-1257', 12);
insert into vendedor (cpf, quantidade_de_vendas, numero_celular, ligacoes_dia) values ('48621502097', 23, '(68) 98224-0208', 12);
insert into vendedor (cpf, quantidade_de_vendas, numero_celular, ligacoes_dia) values ('91328461009', 167, '(96) 98387-6604', 15);
insert into vendedor (cpf, quantidade_de_vendas, numero_celular, ligacoes_dia) values ('97308156079', 186, '(85) 98917-5531', 8);
insert into vendedor (cpf, quantidade_de_vendas, numero_celular, ligacoes_dia) values ('43864607051', 6, '(85) 98429-6979', 2);
insert into vendedor (cpf, quantidade_de_vendas, numero_celular, ligacoes_dia) values ('49808169082', 74, '(61) 99352-1329', 6);
insert into vendedor (cpf, quantidade_de_vendas, numero_celular, ligacoes_dia) values ('72124998030', 148, '(84) 98830-9536', 2);
insert into vendedor (cpf, quantidade_de_vendas, numero_celular, ligacoes_dia) values ('48893825007', 162, '(67) 99387-4560', 2);
insert into vendedor (cpf, quantidade_de_vendas, numero_celular, ligacoes_dia) values ('59017529024', 140, '(21) 99343-2967', 10);
/* */
# Professor, a composicao dos produtos sao confidenciais, minha mae me passou alguns mas sao repetidos
insert into produto (nome, composicao, finalidade) values ('Argamassa de Assentamento', 'Cimento, Areia, Aditivos', 'Assentamento de blocos/tijolos ceramicos');
insert into produto (nome, composicao, finalidade) values ('Argamassa de contrapiso', 'Cimento, Areia, Aditivos', 'Argamassa pronta para regular pisos de concreto, reparo em contra pisos e lajes');
insert into produto (nome, composicao, finalidade) values ('Argamassa Multiuso', 'Cimento, Areia, Aditivos', 'Argamassa pronta para revestimento de paredes internas e externas em concreto, tijolo cerâmico, e blocos de concreto; assentamento de tijolos e blocos de alvenaria');
insert into produto (nome, composicao, finalidade) values ('Argamassa de assentamento estrutural', 'Cimento, Areia, Aditivos', 'Argamassa para assentamento de blocos cerâmicos e de concreto nas seguintes resistências a compressão: 4MPa, 5MPa a 8MPa, 10MPa a 12MPa, 14MPa, 16MPa a 2MPa e 25MPa a 30MPa');
insert into produto (nome, composicao, finalidade) values ('Argamassa tipo Groute', 'Cimento, Areia, Aditivos', 'Argamassa o preenchimento de alvenaria estrutural, caneletas, vergas, contravergas, chumbamento de placas, portões e pilares');
insert into produto (nome, composicao, finalidade) values ('Argamassa de revestimento externo', 'Cimento, Areia, Aditivos', 'Argmassa para revestimentos de paredes externas e grandes fachadas');
insert into produto (nome, composicao, finalidade) values ('Argamassa de revestimento interno', 'Cimento, Areia, Aditivos', 'Argamassa para revestimento interno');
insert into produto (nome, composicao, finalidade) values ('Argamassa colante AC-1', 'Cimento, Areia fina, Aditivo Celulosico', 'Argamasse colante composta de aditivos que possibilitam o tempo exato de assentamento de pisos cerâmicos e azulejos de até 60 x 60cm. Áreas internas');
insert into produto (nome, composicao, finalidade) values ('Argamassa colante AC-2', 'Cimento, Areia fina, Aditivo Celulosico', 'Assentamentos de pisos cerâmicos, azulejos de até 80x80cm, com alto teor de adesividade e flexibilidade para condições de altas exigências');
insert into produto (nome, composicao, finalidade) values ('Argamassa colante AC-3', 'Cimento, Areia fina, Aditivo Celulosico', 'Possui alto teor de adesividade e flexibilidade para condições de altas exigências e grandes peças');
/* */
insert into empresa_compradora (cnpj, nome, endereco) values ('65979561000120', 'Construtora Odebrecht', 'Rua Paracatu');
insert into empresa_compradora (cnpj, nome, endereco) values ('26519888000167', 'Camargo Corrêa', 'Rua Pereira Estéfano');
insert into empresa_compradora (cnpj, nome, endereco) values ('38299632000170', 'Andrade Gutierrez', 'Rua dos Carijós');
insert into empresa_compradora (cnpj, nome, endereco) values ('03072387000180', 'Queiroz Galvão', 'Avenida Almirante Maximiano Fonseca');
insert into empresa_compradora (cnpj, nome, endereco) values ('82205855000113', 'Duratex', 'Rua das Fiandeiras');
insert into empresa_compradora (cnpj, nome, endereco) values ('02572779000145', 'Construtora Oas', 'Rua Frederico Moura');
insert into empresa_compradora (cnpj, nome, endereco) values ('54710335000122', 'Delta Construção', 'Rua Maria Luísa do Val Penteado');
insert into empresa_compradora (cnpj, nome, endereco) values ('74931857000161', 'Votoran', 'Rua Barão de Vitória');
insert into empresa_compradora (cnpj, nome, endereco) values ('05442840000128', 'Galvão', 'Rua Pereira Estéfano');
insert into empresa_compradora (cnpj, nome, endereco) values ('27813222000180', 'Votorantim Cimentos', 'Rua Serra de Bragança');
/* */
insert into pedido (id, emissao, valor, cnpj) values (636100, '2022-02-21', 106171.07, '65979561000120');
insert into pedido (id, emissao, valor, cnpj) values (632682, '2021-09-16', 972940.61, '26519888000167');
insert into pedido (id, emissao, valor, cnpj) values (190834, '2022-05-17', 78483.82, '38299632000170');
insert into pedido (id, emissao, valor, cnpj) values (457756, '2021-10-27', 574430.59, '03072387000180');
insert into pedido (id, emissao, valor, cnpj) values (413088, '2022-03-18', 630093.96, '82205855000113');
insert into pedido (id, emissao, valor, cnpj) values (721089, '2021-09-10', 518686.17, '02572779000145');
insert into pedido (id, emissao, valor, cnpj) values (530558, '2022-02-10', 562732.45, '54710335000122');
insert into pedido (id, emissao, valor, cnpj) values (917500, '2022-01-16', 73712.69, '74931857000161');
insert into pedido (id, emissao, valor, cnpj) values (894049, '2021-05-25', 898255.41, '05442840000128');
insert into pedido (id, emissao, valor, cnpj) values (172107, '2021-02-10', 52315.9, '27813222000180');
/* */
insert into maquina (id, nome, funcao) values (248723, 'Haver', 'Ensacadeira argamassa 50kg');
insert into maquina (id, nome, funcao) values (178491, 'Misturador P1', 'Misturador de insumos Haver');
insert into maquina (id, nome, funcao) values (674300, 'Insack', 'Endecadeira de produtos especiais 20kg');
insert into maquina (id, nome, funcao) values (919745, 'Misturador P2', 'Misturador de Insumos Insack');
insert into maquina (id, nome, funcao) values (586954, 'VSI', 'Britador');
insert into maquina (id, nome, funcao) values (320025, 'Peneira Primaria', 'Primeira Classificação de Areia');
insert into maquina (id, nome, funcao) values (569971, 'Peneiras Classificatorias', 'Classificação da Areia passante no 2,4mm em ABG');
insert into maquina (id, nome, funcao) values (916153, 'Silos de areia', 'Local de Armazenamento de Areia');
insert into maquina (id, nome, funcao) values (904851, 'Silos de Cimento', 'Local de Armazenamento de Cimento');
insert into maquina (id, nome, funcao) values (945339, 'Elevador de Corrente', 'Elevador de 60m do silo de ABB');
/**/
insert into peca (id, funcao, nome) values (363828, 'Cilindro para que o material seja melhor escoado', 'Cilindro pneumatico');
insert into peca (id, funcao, nome) values (360231, 'Pá que que tem a função de fazer a mistura com processo correto', 'Pá giratoria');
insert into peca (id, funcao, nome) values (297292, 'O ar serve para fluidizar melhor o material e ser acondicionado dentro do volume correto', 'Acionamento automático de ar e pesagem');
insert into peca (id, funcao, nome) values (421855, 'Eixo  para fazer as pas que são acopladas girar e mistruar o material', 'Eixo inclinado');
insert into peca (id, funcao, nome) values (751148, 'Placa de impacto para quebrar a britagem', 'Placa de impacto');
insert into peca (id, funcao, nome) values (430104, 'Telas para separar o material ', 'Telas de 2.4mm passagem e telas de 0.5mm de alivio');
insert into peca (id, funcao, nome) values (973735, 'Telas especificas para fazer a seleção automatica das pesagens', 'Telas de 2mm, 1.6mm e 0.8mm');
insert into peca (id, funcao, nome) values (166777, 'A Válvula de Respiro/Suspiro é um dispositivo de proteção montado em um local na parte superior . Seu objetivo principal é proteger o tanque contra ruptura ou implosão.', 'Valvula de respiro');
insert into peca (id, funcao, nome) values (871968, 'Sensor que detecta o nivel de prodtuo no silo e não o deixa extravasar', 'Sensor de altura');
insert into peca (id, funcao, nome) values (416293, 'As Correntes de Aço  transmitem grande mobilidade, possuem grande resistência para  aplicações em elevações de equipamentos e Movimentação de Cargas, para levar areia bruta gerada no VSI  até a peneira primaria ', 'Correntes e elos de aço');
/**/
insert into entrega (id_pedido, placa_caminhao, cpf_motorista) values (636100, 'NAU9539', '80160601029');
insert into entrega (id_pedido, placa_caminhao, cpf_motorista) values (632682, 'MBL6741', '51448983002');
insert into entrega (id_pedido, placa_caminhao, cpf_motorista) values (190834, 'NAH4993', '74737716049');
insert into entrega (id_pedido, placa_caminhao, cpf_motorista) values (457756, 'HSW7414', '49790015054');
insert into entrega (id_pedido, placa_caminhao, cpf_motorista) values (413088, 'JRE0100', '29434219019');
insert into entrega (id_pedido, placa_caminhao, cpf_motorista) values (721089, 'GCK9501', '51478383097');
insert into entrega (id_pedido, placa_caminhao, cpf_motorista) values (530558, 'MNV6060', '03688245008');
insert into entrega (id_pedido, placa_caminhao, cpf_motorista) values (917500, 'MWQ7445', '00779653025');
insert into entrega (id_pedido, placa_caminhao, cpf_motorista) values (894049, 'LVM5189', '27639222010');
insert into entrega (id_pedido, placa_caminhao, cpf_motorista) values (172107, 'LVM5189', '06287882077');
/**/
insert into reparo (cpf, id_maquina) values ('24538107820', 248723);
insert into reparo (cpf, id_maquina) values ('08162739017', 178491);
insert into reparo (cpf, id_maquina) values ('24039496043', 674300);
insert into reparo (cpf, id_maquina) values ('99261018017', 919745);
insert into reparo (cpf, id_maquina) values ('77154002034', 586954);
insert into reparo (cpf, id_maquina) values ('51478383097', 320025);
insert into reparo (cpf, id_maquina) values ('02669625053', 569971);
insert into reparo (cpf, id_maquina) values ('81892140047', 916153);
insert into reparo (cpf, id_maquina) values ('27843720065', 904851);
insert into reparo (cpf, id_maquina) values ('82846726000', 945339);
/**/
insert into vende (cpf, nome) values ('97876578063', 'Argamassa de Assentamento');
insert into vende (cpf, nome) values ('97069957068', 'Argamassa colante AC-1');
insert into vende (cpf, nome) values ('48621502097', 'Argamassa de contrapiso');
insert into vende (cpf, nome) values ('91328461009', 'Argamassa tipo Groute');
insert into vende (cpf, nome) values ('97308156079', 'Argamassa Multiuso');
insert into vende (cpf, nome) values ('43864607051', 'Argamassa de assentamento estrutural');
insert into vende (cpf, nome) values ('49808169082', 'Argamassa de revestimento externo');
insert into vende (cpf, nome) values ('72124998030', 'Argamassa de revestimento interno');
insert into vende (cpf, nome) values ('48893825007', 'Argamassa colante AC-2');
insert into vende (cpf, nome) values ('59017529024', 'Argamassa colante AC-3');
/**/
insert into contem_produto (nome, id_pedido) values ('Argamassa colante AC-3', 636100);
insert into contem_produto (nome, id_pedido) values ('Argamassa colante AC-2', 632682);
insert into contem_produto (nome, id_pedido) values ('Argamassa colante AC-1', 190834);
insert into contem_produto (nome, id_pedido) values ('Argamassa de revestimento interno', 457756);
insert into contem_produto (nome, id_pedido) values ('Argamassa de revestimento externo', 413088);
insert into contem_produto (nome, id_pedido) values ('Argamassa de assentamento estrutural', 721089);
insert into contem_produto (nome, id_pedido) values ('Argamassa Multiuso', 530558);
insert into contem_produto (nome, id_pedido) values ('Argamassa tipo Groute', 917500);
insert into contem_produto (nome, id_pedido) values ('Argamassa de contrapiso', 894049);
insert into contem_produto (nome, id_pedido) values ('Argamassa de Assentamento', 172107);
/**/
insert into contem_peca (id_maquina, id_peca) values (248723, 363828);
insert into contem_peca (id_maquina, id_peca) values (178491, 360231);
insert into contem_peca (id_maquina, id_peca) values (674300, 297292);
insert into contem_peca (id_maquina, id_peca) values (919745, 421855);
insert into contem_peca (id_maquina, id_peca) values (586954, 751148);
insert into contem_peca (id_maquina, id_peca) values (320025, 430104);
insert into contem_peca (id_maquina, id_peca) values (569971, 973735);
insert into contem_peca (id_maquina, id_peca) values (916153, 166777);
insert into contem_peca (id_maquina, id_peca) values (904851, 871968);
insert into contem_peca (id_maquina, id_peca) values (945339, 416293);
