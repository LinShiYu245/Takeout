/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/7/4 18:51:40                            */
/*==============================================================*/


drop table if exists address;

drop table if exists discount;

drop table if exists givediscount;

drop table if exists manager;

drop table if exists manjian;

drop table if exists orderd;

drop table if exists productdetail;

drop table if exists productevaluate;

drop table if exists producttype;

drop table if exists projectorder;

drop table if exists rider;

drop table if exists riderevaluate;

drop table if exists ridework;

drop table if exists shop;

drop table if exists user;

drop table if exists userdiscount;

/*==============================================================*/
/* Table: address                                               */
/*==============================================================*/
create table address
(
   add_id               int not null,
   user_id              int,
   add_sheng            varchar(10) not null,
   add_city             varchar(10) not null,
   add_qu               varchar(10) not null,
   add_add              varchar(30) not null,
   add_man              varchar(10) not null,
   add_phone            numeric(20,0) not null,
   primary key (add_id)
);

/*==============================================================*/
/* Table: discount                                              */
/*==============================================================*/
create table discount
(
   disc_id              int not null,
   shop_id              int,
   disc_prize           numeric(10,0) not null,
   disc_condition       int not null,
   disc_starttime       date,
   disc_endtime         date,
   primary key (disc_id)
);

/*==============================================================*/
/* Table: givediscount                                          */
/*==============================================================*/
create table givediscount
(
   user_id              int not null,
   disc_id              int not null,
   shop_id              int not null,
   disc_condition       int not null,
   gdis_have            numeric(6,0) not null,
   primary key (user_id, disc_id, shop_id)
);

/*==============================================================*/
/* Table: manager                                               */
/*==============================================================*/
create table manager
(
   ma_id                int not null,
   ma_name              varchar(10) not null,
   ma_pwd               varchar(20) not null,
   primary key (ma_id)
);

/*==============================================================*/
/* Table: manjian                                               */
/*==============================================================*/
create table manjian
(
   mj_id                int not null,
   shop_id              int,
   mj_prize             numeric(10,0) not null,
   disc_prize           numeric(10,0) not null,
   mj_fix_disc          bool not null,
   primary key (mj_id)
);

/*==============================================================*/
/* Table: orderd                                                */
/*==============================================================*/
create table orderd
(
   or_id                int not null,
   or_num               numeric(10,0) not null,
   or_prize             numeric(10,0) not null,
   or_dis_prize         numeric(10,0),
   primary key (or_id)
);
/*==============================================================*/
/* Table: productdetail                                         */
/*==============================================================*/
create table productdetail
(
   pro_id               int not null,
   protype_id           int,
   shop_id              int,
   pro_name             varchar(15) not null,
   pro_prize            numeric(10,0) not null,
   pro_disc_prize       numeric(10,0) not null,
   pro_num              int,
   primary key (pro_id)
);

/*==============================================================*/
/* Table: productevaluate                                       */
/*==============================================================*/
create table productevaluate
(
   shop_id              int not null,
   pro_id               int not null,
   user_id              int not null,
   proev                varchar(300),
   proev_time           date not null,
   proev_pic            longblob,
   proev_star           int not null,
   primary key (shop_id, pro_id, user_id)
);

/*==============================================================*/
/* Table: producttype                                           */
/*==============================================================*/
create table producttype
(
   protype_id           int not null,
   protype_name         varchar(15) not null,
   primary key (protype_id)
);

/*==============================================================*/
/* Table: projectorder                                          */
/*==============================================================*/
create table projectorder
(
   add_id               int not null,
   mj_id                int not null,
   or_id                int not null,
   user_id              int not null,
   shop_id              int not null,
   disc_id              int not null,
   rid_id               int not null,
   po_plan_prize        numeric(10,0) not null,
   po_end_prize         numeric(10,0),
   po_plan_time         datetime not null,
   po_ask_time          datetime,
   po_con               varchar(10) not null,
   primary key (add_id, mj_id, or_id, user_id, shop_id, disc_id, rid_id)
);

/*==============================================================*/
/* Table: rider                                                 */
/*==============================================================*/
create table rider
(
   rid_id               int not null,
   rid_name             varchar(10) not null,
   rid_time             date not null,
   rid_shen             varchar(6) not null,
   rid_phone            numeric(20,0) not null,
   rid_city             varchar(20) not null,
   primary key (rid_id)
);

/*==============================================================*/
/* Table: riderevaluate                                         */
/*==============================================================*/
create table riderevaluate
(
   rid_id               int not null,
   or_id                int not null,
   user_id              int not null,
   ridev_ev             varchar(10) not null,
   ridev                varchar(300),
   ridev_time           datetime not null,
   primary key (rid_id, or_id, user_id)
);

/*==============================================================*/
/* Table: ridework                                              */
/*==============================================================*/
create table ridework
(
   rid_id               int not null,
   or_id                int not null,
   ridw_time            date not null,
   ridw_eva             varchar(10),
   ridw_prize           numeric(10,0) not null,
   primary key (rid_id, or_id)
);

/*==============================================================*/
/* Table: shop                                                  */
/*==============================================================*/
create table shop
(
   shop_id              int not null,
   shop_name            varchar(15) not null,
   shop_star            numeric(3,0) not null,
   shop_consume         numeric(10,0) not null,
   shop_summai          numeric(15,0) not null,
   shop_sumnum          numeric(10,0) not null,
   primary key (shop_id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              int not null,
   user_name            varchar(10) not null,
   user_sex             varchar(2) not null,
   user_pwd             varchar(20) not null,
   user_phone           numeric(20,0) not null,
   user_mail            varchar(25) not null,
   user_city            varchar(10) not null,
   user_usetime         date not null,
   user_VIP             bool not null,
   user_VIPtime         date,
   primary key (user_id)
);

/*==============================================================*/
/* Table: userdiscount                                          */
/*==============================================================*/
create table userdiscount
(
   user_id              int not null,
   disc_id              int not null,
   shop_id              int not null,
   usedis_num           int not null,
   usedis_time          datetime not null,
   primary key (user_id, disc_id, shop_id)
);

alter table address add constraint FK_所在 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table discount add constraint FK_you foreign key (shop_id)
      references shop (shop_id) on delete restrict on update restrict;

alter table givediscount add constraint FK_givediscount foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table givediscount add constraint FK_givediscount2 foreign key (disc_id)
      references discount (disc_id) on delete restrict on update restrict;

alter table givediscount add constraint FK_givediscount3 foreign key (shop_id)
      references shop (shop_id) on delete restrict on update restrict;

alter table manjian add constraint FK_rule foreign key (shop_id)
      references shop (shop_id) on delete restrict on update restrict;

alter table productdetail add constraint FK_have foreign key (shop_id)
      references shop (shop_id) on delete restrict on update restrict;

alter table productdetail add constraint FK_类别 foreign key (protype_id)
      references producttype (protype_id) on delete restrict on update restrict;

alter table productevaluate add constraint FK_productevaluate foreign key (shop_id)
      references shop (shop_id) on delete restrict on update restrict;

alter table productevaluate add constraint FK_productevaluate2 foreign key (pro_id)
      references productdetail (pro_id) on delete restrict on update restrict;

alter table productevaluate add constraint FK_productevaluate3 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table projectorder add constraint FK_projectorder foreign key (add_id)
      references address (add_id) on delete restrict on update restrict;

alter table projectorder add constraint FK_projectorder2 foreign key (mj_id)
      references manjian (mj_id) on delete restrict on update restrict;

alter table projectorder add constraint FK_projectorder3 foreign key (or_id)
      references orderd (or_id) on delete restrict on update restrict;

alter table projectorder add constraint FK_projectorder4 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table projectorder add constraint FK_projectorder5 foreign key (shop_id)
      references shop (shop_id) on delete restrict on update restrict;

alter table projectorder add constraint FK_projectorder6 foreign key (disc_id)
      references discount (disc_id) on delete restrict on update restrict;

alter table projectorder add constraint FK_projectorder7 foreign key (rid_id)
      references rider (rid_id) on delete restrict on update restrict;

alter table riderevaluate add constraint FK_riderevaluate foreign key (rid_id)
      references rider (rid_id) on delete restrict on update restrict;

alter table riderevaluate add constraint FK_riderevaluate2 foreign key (or_id)
      references orderd (or_id) on delete restrict on update restrict;

alter table riderevaluate add constraint FK_riderevaluate3 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table ridework add constraint FK_ridework foreign key (rid_id)
      references rider (rid_id) on delete restrict on update restrict;

alter table ridework add constraint FK_ridework2 foreign key (or_id)
      references orderd (or_id) on delete restrict on update restrict;

alter table userdiscount add constraint FK_userdiscount foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table userdiscount add constraint FK_userdiscount2 foreign key (disc_id)
      references discount (disc_id) on delete restrict on update restrict;

alter table userdiscount add constraint FK_userdiscount3 foreign key (shop_id)
      references shop (shop_id) on delete restrict on update restrict;

