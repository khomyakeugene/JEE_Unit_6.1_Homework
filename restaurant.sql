/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     04.05.2016 11:06:24                          */
/*==============================================================*/


drop index ind_crs_ctg_dic;

drop table course_category_dic;

drop index crs_ctg_FK;

drop table courses;

drop index crs_ingredients_FK;

drop table crs_ingredients;

drop index job_position_FK;

drop table employees;

drop index ind_ingredients;

drop table ingredients;

drop index ind_jop_position_dic;

drop table job_position_dic;

drop index wrhs_ingredients_FK;

drop table warehouse;

/*==============================================================*/
/* Table: course_category_dic                                   */
/*==============================================================*/
create table course_category_dic (
   course_category_id   INT4                 not null,
   name                 VARCHAR(256)         not null,
   constraint PK_COURSE_CATEGORY_DIC primary key (course_category_id)
);

INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (1, 'Appetizers');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (2, 'Salads');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (3, 'Soups');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (4, 'Entrees');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (5, 'Deserts');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (6, 'Nonalcoholic beverages');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (7, 'Alcoholic beverages');

/*==============================================================*/
/* Index: ind_crs_ctg_dic                                       */
/*==============================================================*/
create unique index ind_crs_ctg_dic on course_category_dic (
name
);

/*==============================================================*/
/* Table: courses                                               */
/*==============================================================*/
create table courses (
   course_id            SERIAL               not null,
   course_category_id   INT4                 not null,
   name                 VARCHAR(256)         not null,
   weight               FLOAT8               not null,
   cost                 MONEY                not null,
   constraint PK_COURSES primary key (course_id)
);

/*==============================================================*/
/* Index: crs_ctg_FK                                            */
/*==============================================================*/
create  index crs_ctg_FK on courses (
course_category_id
);

/*==============================================================*/
/* Table: crs_ingredients                                       */
/*==============================================================*/
create table crs_ingredients (
   course_id            INT4                 not null,
   ingredient_id        INT4                 not null,
   constraint PK_CRS_INGREDIENTS primary key (course_id, ingredient_id)
);

/*==============================================================*/
/* Index: crs_ingredients_FK                                    */
/*==============================================================*/
create  index crs_ingredients_FK on crs_ingredients (
ingredient_id
);

/*==============================================================*/
/* Table: employees                                             */
/*==============================================================*/
create table employees (
   employee_id          SERIAL               not null,
   position_id          INT4                 not null,
   first_name           VARCHAR(256)         not null,
   second_name          VARCHAR(256)         not null,
   phone_number         VARCHAR(100)         null,
   salary               MONEY                null,
   constraint PK_EMPLOYEES primary key (employee_id)
);

/*==============================================================*/
/* Index: job_position_FK                                       */
/*==============================================================*/
create  index job_position_FK on employees (
position_id
);

/*==============================================================*/
/* Table: ingredients                                           */
/*==============================================================*/
create table ingredients (
   ingredient_id        SERIAL               not null,
   name                 VARCHAR(256)         not null,
   constraint PK_INGREDIENTS primary key (ingredient_id)
);

/*==============================================================*/
/* Index: ind_ingredients                                       */
/*==============================================================*/
create unique index ind_ingredients on ingredients (
name
);

/*==============================================================*/
/* Table: job_position_dic                                      */
/*==============================================================*/
create table job_position_dic (
   position_id          INT4                 not null,
   name                 VARCHAR(256)         not null,
   constraint PK_JOB_POSITION_DIC primary key (position_id)
);

/*==============================================================*/
/* Index: ind_jop_position_dic                                  */
/*==============================================================*/
create unique index ind_jop_position_dic on job_position_dic (
name
);

/*==============================================================*/
/* Table: warehouse                                             */
/*==============================================================*/
create table warehouse (
   ingredient_id        INT4                 not null,
   quantity             INT4                 not null,
   constraint PK_WAREHOUSE primary key (ingredient_id, quantity)
);

/*==============================================================*/
/* Index: wrhs_ingredients_FK                                   */
/*==============================================================*/
create  index wrhs_ingredients_FK on warehouse (
ingredient_id
);

alter table courses
   add constraint FK_COURSES_CRS_CTG_COURSE_C foreign key (course_category_id)
      references course_category_dic (course_category_id)
      on delete restrict on update restrict;

alter table crs_ingredients
   add constraint FK_CRS_INGR_CRS_INGRE_INGREDIE foreign key (ingredient_id)
      references ingredients (ingredient_id)
      on delete restrict on update restrict;

alter table crs_ingredients
   add constraint FK_CRS_INGR_CRS_INGRE_COURSES foreign key (course_id)
      references courses (course_id)
      on delete restrict on update restrict;

alter table employees
   add constraint FK_EMPLOYEE_JOB_POSIT_JOB_POSI foreign key (position_id)
      references job_position_dic (position_id)
      on delete restrict on update restrict;

alter table warehouse
   add constraint FK_WAREHOUS_WRHS_INGR_INGREDIE foreign key (ingredient_id)
      references ingredients (ingredient_id)
      on delete restrict on update restrict;

