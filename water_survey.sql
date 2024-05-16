create table tipo_domanda
(
    id   int unsigned auto_increment
        primary key,
    tipo varchar(100) null
);

create table ruolo(
    id int unsigned auto_increment 
    primary key,
    nome varchar(50) null
    
);
create table user
(
    id       int unsigned auto_increment
        primary key,
    username varchar(100) not null,
    password text         not null,
    email    varchar(100) not null,
    nome     varchar(50)  null,
    cognome  varchar(50)  null,
    ruolo int unsigned not null,
    constraint ruolo
        foreign key (ruolo) references ruolo (id),
    constraint email
        unique (email),
    constraint username
        unique (username)
);
create table survey
(
    id          int unsigned auto_increment
        primary key,
    nome        varchar(100) not null,
    descrizione varchar(255) null,
    creatore    int unsigned not null,
    numero_domande int unsigned,
    constraint creatore
        foreign key (creatore) references user (id)
);

create table question
(
    id           int unsigned auto_increment
        primary key,
    domanda      text         not null,
    tipo         int unsigned null,
    questionario int unsigned null,
    constraint questionario
        foreign key (questionario) references survey (id),
    constraint tipo
        foreign key (tipo) references tipo_domanda (id)
);

create table response
(
    id              int unsigned auto_increment
        primary key,
    risposta        text         null,
    id_utente       int unsigned not null,
    id_domanda      int unsigned not null,
    id_questionario int unsigned null,
    constraint response_question_id_fk
        foreign key (id_domanda) references question (id),
    constraint response_survey_id_fk
        foreign key (id_questionario) references survey (id),
    constraint response_user_id_fk
        foreign key (id_utente) references user (id)
);
