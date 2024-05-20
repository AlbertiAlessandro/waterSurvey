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
    token_reset varchar(50) default null,
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
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
                            `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                            `domanda` text NOT NULL,
                            `tipo` int(10) unsigned DEFAULT NULL,
                            `id_survey` int(10) unsigned DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            KEY `questionario` (`id_survey`),
                            KEY `tipo` (`tipo`),
                            CONSTRAINT `questionario` FOREIGN KEY (`id_survey`) REFERENCES `survey` (`id`),
                            CONSTRAINT `tipo` FOREIGN KEY (`tipo`) REFERENCES `tipo_domanda` (`id`)
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
CREATE TABLE `options` (
                           `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                           `risposta` text DEFAULT NULL,
                           `id_utente` int(10) unsigned NOT NULL,
                           `id_domanda` int(10) unsigned NOT NULL,
                           `id_questionario` int(10) unsigned DEFAULT NULL,
                           `correct` tinyint(1) DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `options_question_id_fk` (`id_domanda`),
                           KEY `options_survey_id_fk` (`id_questionario`),
                           KEY `options_user_id_fk` (`id_utente`),
                           CONSTRAINT `options_question_id_fk` FOREIGN KEY (`id_domanda`) REFERENCES `question` (`id`),
                           CONSTRAINT `options_survey_id_fk` FOREIGN KEY (`id_questionario`) REFERENCES `survey` (`id`),
                           CONSTRAINT `options_user_id_fk` FOREIGN KEY (`id_utente`) REFERENCES `user` (`id`)
);