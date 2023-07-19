/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de cr�ation :  19/07/2023 20:40:39                      */
/*==============================================================*/


drop table if exists client;

drop table if exists couture;

drop table if exists depense;

drop table if exists mesure;

drop table if exists modele;

drop table if exists paiement;

drop table if exists personnel;

drop table if exists utilisateur;

/*==============================================================*/
/* Table : client                                               */
/*==============================================================*/
create table client
(
   idclient             int not null AUTO_INCREMENT,
   nom                  varchar(254),
   prenom               varchar(254),
   quartier             varchar(254),
   telephone            int,
   primary key (idclient),
   key AK_Identifiant_1 (idclient)
);

/*==============================================================*/
/* Table : couture                                              */
/*==============================================================*/
create table couture
(
   idcouture            int not null AUTO_INCREMENT,
   idclient             int not null,
   primary key (idcouture)
);

/*==============================================================*/
/* Table : depense                                              */
/*==============================================================*/
create table depense
(
   iddepense            int not null AUTO_INCREMENT,
   idpersonnel          int not null,
   datedepense         DATE,
   primary key (iddepense),
   key AK_Identifiant_1 (iddepense)
);

/*==============================================================*/
/* Table : mesure                                               */
/*==============================================================*/
create table mesure
(
   idmesure             int not null AUTO_INCREMENT,
   idclient             int,
   taille               int,
   poitrine             int,
   epaule               int,
   longueur_bras        int,
   cuisse               int,
   jambe                int,
   primary key (idmesure),
   key AK_Identifiant_1 (idmesure)
);

/*==============================================================*/
/* Table : modele                                               */
/*==============================================================*/
create table modele
(
   idmodele             int not null AUTO_INCREMENT,
   idclient             int not null,
   nom                  varchar(254),
   primary key (idmodele)
);

/*==============================================================*/
/* Table : paiement                                             */
/*==============================================================*/
create table paiement
(
   idpaiement           int not null AUTO_INCREMENT,
   idclient             int not null,
   datepaiement         DATE,
   primary key (idpaiement),
   key AK_Identifiant_1 (idpaiement)
);

/*==============================================================*/
/* Table : personnel                                            */
/*==============================================================*/
create table personnel
(
   idpersonnel          int not null AUTO_INCREMENT,
   nom                  varchar(254),
   prenom               varchar(254),
   age                  int,
   poste                varchar(254),
   telephone            int,
   primary key (idpersonnel),
   key AK_Identifiant_1 (idpersonnel)
);

/*==============================================================*/
/* Table : utilisateur                                          */
/*==============================================================*/
create table utilisateur
(
   idutilisateur        int not null AUTO_INCREMENT,
   nom                  varchar(254),
   prenom               varchar(254),
   fonction             varchar(254),
   primary key (idutilisateur),
   key AK_Identifiant_1 (idutilisateur)
);

alter table couture add constraint FK_Association_3 foreign key (idclient)
      references client (idclient) on delete restrict on update restrict;

alter table depense add constraint FK_Association_5 foreign key (idpersonnel)
      references personnel (idpersonnel) on delete restrict on update restrict;

alter table mesure add constraint FK_Association_4 foreign key (idclient)
      references client (idclient) on delete restrict on update restrict;

alter table modele add constraint FK_Association_1 foreign key (idclient)
      references client (idclient) on delete restrict on update restrict;

alter table paiement add constraint FK_Association_2 foreign key (idclient)
      references client (idclient) on delete restrict on update restrict;

INSERT INTO client (nom, prenom, quartier, telephone)
VALUES ('AGBANOU', 'Vital', 'Calavi', 0022968754124),
        ('BAOUROU', 'Beaufaye', 'Wayalghin', 0022657208623),
        ('OBOULBIGA', 'Laurena', 'Sondogo', 0022673189861),
        ('DILA', 'Tresor', 'Dassasgho', 0022656788871),
        ('KABORE', 'Hyacinthe', 'Borgho', 0022654774231);

INSERT INTO couture (idclient)
VALUES (1);

INSERT INTO personnel (nom, prenom, age, poste, telephone)
VALUES ('KOTAZO', 'Ana Combattant', 24, 'Comptable', 62254478),
       ('MY', 'Little Honey', 20, 'Styliste', 56965874),
       ('DIGBA', 'Ledur', 26, 'Couturier', 54452412);

INSERT INTO depense (idpersonnel, datedepense)
VALUES (1, '2023-07-17');

INSERT INTO mesure (idclient, taille, poitrine, epaule, longueur_bras, cuisse, jambe)
VALUES (1, 45, 46, 35, 63, 20, 65);

INSERT INTO modele (idclient, nom)
VALUES (1, 'boubou'),
       (3, '3 pièces');

INSERT INTO paiement (idclient, datepaiement)
VALUES (1, '2023-07-19');

INSERT INTO utilisateur (nom, prenom, fonction)
VALUES ('Messi', 'Lionel', 'Chef'),
       ('Ronaldo', 'Cristiano', 'Secretaire'); 