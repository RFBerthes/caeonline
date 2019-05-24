create database if not exists totem;
use totem;

CREATE TABLE usuarios(
    user_id int(11) not null auto_increment primary key,
    usuario varchar(50) not null,
    matricula number(10) not null,
    tipo_usuario varchar(20) not null,
    passwd varchar(100) not null,
    )ENGINE=InnoDB, charset=utf8mb4;

insert into usuarios(usuario,matricula,tipo_usuario,passwd) values ('valdirene silva',2000102030,'operador','1234');
insert into usuarios(usuario,matricula,tipo_usuario,passwd) values ('admin',00001111,'admin','admin'); 
insert into usuarios(usuario,matricula,tipo_usuario,passwd) values ('orlando disnei',2000203025,'operador','1234');

CREATE TABLE alunos(
    aluno_id int(11) not null auto_increment primary key,
    nome varchar(50) not null,
    matricula number(10) not null,
    curso varchar(50) not null,
    passwd varchar(100) not null
    )ENGINE=InnoDB, charset=utf8mb4;

create table atendimento(
    atend_id int(11) not null auto_increment primary key,
    usuario varchar(50) not null,
    user_matricula number(10),
    matricula_alu number(10),
    descricao text not null
) ENGINE=InnoDB charset=utf8mb4;

    alter table atendimento add constraint fk_atendimento foreign key(usuario) references usuarios(usuario),
    alter table atendimento add  constaint fk_atendimento foreign key(user_matricula) references usuarios(matricula),
    alter table atendimento add constraint constraint fk_atendimento foreign key(matricula_alu) references alunos(matricula)




insert into atendimento(usuario,matricula,matricula_alu,descricao) values ('valdirene silva',2000102030,2000104070,'now that we know who you are, i know who i am. im not a mistake! it all makes sense! in a comic, you know how you can tell who the arch-villains going to be? hes the exact opposite of the hero. and most times theyre friends, like you and me! i shouldve known way back when... you know why, david? because of the kids. they called me mr glass.
well, the way they make shows is, they make one show. that shows called a pilot. then they show that show to the people who make shows, and on the strength of that one show they decide if theyre going to make more shows. some pilots get picked and become television programs. some dont, become nothing. she starred in one of the ones that became nothing.');


insert into atendimento(usuario,matricula,matricula_alu,descricao) values ('orlando disnei',2000203025,2000205080,'normally, both your asses would be dead as fucking fried chicken, but you happen to pull this shit while im in a transitional period so i dont wanna kill you, i wanna help you. but i cant give you this case, it dont belong to me. besides, ive already been through too much shit this morning over this case to hand it over to your dumb ass.
Do you see any teletubbies in here? do you see a slender plastic tag clipped to my shirt with my name printed on it? do you see a little asian child with a blank expression on his face sitting outside on a mechanical helicopter that shakes when you put quarters in it? no? well, thats what you see at a toy store. and you must think youre in a toy store, because youre here shopping for an infant named');


create table fila_comum(
    filacomum_id(11) int not null auto_increment primary key,
    atendc_n int not null,
    mesa_n int not null
  ) ENGINE=InnoDB charset=utf8mb4;

insert into fila_comum (atendp_n,mesa_n) values (27,3);
insert into fila_comum (atendp_n,mesa_n) values (28,5);
insert into fila_comum (atendp_n,mesa_n) values (29,6);
insert into fila_comum (atendp_n,mesa_n) values (30,7);
insert into fila_comum (atendp_n,mesa_n) values (31,8);
insert into fila_comum (atendp_n,mesa_n) values (32,9);
insert into fila_comum (atendp_n,mesa_n) values (33,10);
insert into fila_comum (atendp_n,mesa_n) values (34,11);


create table fila_pref(
    filapref_id(11) int not null auto_increment primary key,
    atendp_n int not null,
    mesa_n int not null
  ) ENGINE=InnoDB charset=utf8mb4;

insert into fila_pref (atendp_n,mesa_n) values (10,42);
insert into fila_pref (atendp_n,mesa_n) values (11,43);
insert into fila_pref (atendp_n,mesa_n) values (12,44);
insert into fila_pref (atendp_n,mesa_n) values (13,45);
insert into fila_pref (atendp_n,mesa_n) values (14,46);
insert into fila_pref (atendp_n,mesa_n) values (15,47);
insert into fila_pref (atendp_n,mesa_n) values (16,48);
insert into fila_pref (atendp_n,mesa_n) values (17,49);
insert into fila_pref (atendp_n,mesa_n) values (18,50);
insert into fila_pref (atendp_n,mesa_n) values (19,51);
insert into fila_pref (atendp_n,mesa_n) values (20,52);
