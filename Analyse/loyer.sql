/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  17/03/2016 16:11:19                      */
/*==============================================================*/


drop table if exists Chambre;

drop table if exists Locataire;

drop table if exists Loyer;

drop table if exists Personne;

/*==============================================================*/
/* Table : Chambre                                              */
/*==============================================================*/
create table Chambre
(
   id                   int not null auto_increment,
   Loy_id               int not null,
   libelle              varchar(254),
   description          varchar(254),
   disponible           bool,
   primary key (id)
);

/*==============================================================*/
/* Table : Locataire                                            */
/*==============================================================*/
create table Locataire
(
   id                   int not null,
   dateDebutLocation    datetime,
   dateFinLocation      datetime,
   primary key (id)
);

/*==============================================================*/
/* Table : Loyer                                                */
/*==============================================================*/
create table Loyer
(
   id                   int not null auto_increment,
   Loc_id               int,
   libelle              varchar(254),
   dateDebut            datetime,
   dateFin              datetime,
   fini                 bool,
   primary key (id)
);

/*==============================================================*/
/* Table : Personne                                             */
/*==============================================================*/
create table Personne
(
   id                   int not null auto_increment,
   nom                  varchar(254),
   prenom               varchar(254),
   mail                 int,
   photo                tinyint,
   dateNaissance        datetime,
   primary key (id)
);

alter table Chambre add constraint FK_avoir foreign key (Loy_id)
      references Loyer (id) on delete restrict on update restrict;

alter table Locataire add constraint FK_Generalisation foreign key (id)
      references Personne (id) on delete restrict on update restrict;

alter table Loyer add constraint FK_verser foreign key (Loc_id)
      references Locataire (id) on delete restrict on update restrict;

