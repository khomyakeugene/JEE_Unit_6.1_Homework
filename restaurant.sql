/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     04.05.2016 17:58:12                          */
/*==============================================================*/


drop index cooked_course_order_FK;

drop index cooked_course_course_FK;

drop index cook_FK;

drop index cooked_course_PK;

drop table cooked_course;

drop index course_category_FK;

drop index course_PK;

drop table course;

drop index course_category_dic_PK;

drop table course_category_dic;

drop index course_ingredient2_FK;

drop index course_ingredient_FK;

drop index course_ingredient_PK;

drop table course_ingredient;

drop index employee_job_position_FK;

drop index employee_PK;

drop table employee;

drop index ingredient_PK;

drop table ingredient;

drop index job_position_dic_PK;

drop table job_position_dic;

drop index menu_PK;

drop table menu;

drop index menu_course_FK;

drop index menu_header_FK;

drop table menu_courses_list;

drop index order_table_FK;

drop index order_employee_FK;

drop index order_PK;

drop table "order";

drop index order_courses2_FK;

drop index order_courses_FK;

drop index order_courses_PK;

drop table order_courses;

drop index table_PK;

drop table "table";

drop index warehouse_ingredient_FK;

drop table warehouse;

/*==============================================================*/
/* Table: cooked_course                                         */
/*==============================================================*/
create table cooked_course (
   cooked_course_id     SERIAL               not null,
   employee_id          INT4                 not null,
   course_id            INT4                 not null,
   order_id             INT4                 not null,
   cook_datetime        DATE                 not null,
   constraint PK_COOKED_COURSE primary key (cooked_course_id)
);

/*==============================================================*/
/* Index: cooked_course_PK                                      */
/*==============================================================*/
create unique index cooked_course_PK on cooked_course (
cooked_course_id
);

/*==============================================================*/
/* Index: cook_FK                                               */
/*==============================================================*/
create  index cook_FK on cooked_course (
employee_id
);

/*==============================================================*/
/* Index: cooked_course_course_FK                               */
/*==============================================================*/
create  index cooked_course_course_FK on cooked_course (
course_id
);

/*==============================================================*/
/* Index: cooked_course_order_FK                                */
/*==============================================================*/
create  index cooked_course_order_FK on cooked_course (
order_id
);

/*==============================================================*/
/* Table: course                                                */
/*==============================================================*/
create table course (
   course_id            INT4                 not null,
   course_category_id   INT4                 not null,
   name                 VARCHAR(256)         not null,
   weight               FLOAT8               not null,
   cost                 MONEY                not null,
   constraint PK_COURSE primary key (course_id),
   constraint AK_U_COURSE_NAME_COURSE unique (name)
);

/*==============================================================*/
/* Index: course_PK                                             */
/*==============================================================*/
create unique index course_PK on course (
course_id
);

/*==============================================================*/
/* Index: course_category_FK                                    */
/*==============================================================*/
create  index course_category_FK on course (
course_category_id
);

/*==============================================================*/
/* Table: course_category_dic                                   */
/*==============================================================*/
create table course_category_dic (
   course_category_id   INT4                 not null,
   name                 VARCHAR(256)         not null,
   constraint PK_COURSE_CATEGORY_DIC primary key (course_category_id),
   constraint AK_U_COURSE_CATEGORY__COURSE_C unique (name)
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
/* Index: course_category_dic_PK                                */
/*==============================================================*/
create unique index course_category_dic_PK on course_category_dic (
course_category_id
);

/*==============================================================*/
/* Table: course_ingredient                                     */
/*==============================================================*/
create table course_ingredient (
   ingredient_id        INT4                 not null,
   course_id            INT4                 not null,
   constraint PK_COURSE_INGREDIENT primary key (ingredient_id, course_id)
);

/*==============================================================*/
/* Index: course_ingredient_PK                                  */
/*==============================================================*/
create unique index course_ingredient_PK on course_ingredient (
ingredient_id,
course_id
);

/*==============================================================*/
/* Index: course_ingredient_FK                                  */
/*==============================================================*/
create  index course_ingredient_FK on course_ingredient (
ingredient_id
);

/*==============================================================*/
/* Index: course_ingredient2_FK                                 */
/*==============================================================*/
create  index course_ingredient2_FK on course_ingredient (
course_id
);

/*==============================================================*/
/* Table: employee                                              */
/*==============================================================*/
create table employee (
   employee_id          INT4                 not null,
   position_id          INT4                 not null,
   first_name           VARCHAR(256)         not null,
   second_name          VARCHAR(256)         not null,
   phone_number         VARCHAR(100)         null,
   salary               MONEY                null,
   constraint PK_EMPLOYEE primary key (employee_id)
);

/*==============================================================*/
/* Index: employee_PK                                           */
/*==============================================================*/
create unique index employee_PK on employee (
employee_id
);

/*==============================================================*/
/* Index: employee_job_position_FK                              */
/*==============================================================*/
create  index employee_job_position_FK on employee (
position_id
);

/*==============================================================*/
/* Table: ingredient                                            */
/*==============================================================*/
create table ingredient (
   ingredient_id        SERIAL               not null,
   name                 VARCHAR(256)         not null,
   constraint PK_INGREDIENT primary key (ingredient_id),
   constraint AK_U_INGREDIENT_NAME_INGREDIE unique (name)
);

INSERT INTO ingredient
       (ingredient_id, name)
VALUES (1, 'Potato');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (2, 'Onion');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (3, 'Carrot');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (4, 'Vegetable marrow');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (5, 'Tomato');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (6, 'Cucumber');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (7, 'Cabbage');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (8, 'Pe-tsai');


INSERT INTO ingredient
       (ingredient_id, name)
VALUES (101, 'Butter');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (102, 'Oil');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (103, 'Salt');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (104, 'Pepper');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (105, 'Cinnamon');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (106, 'Vinegar');

/*==============================================================*/
/* Index: ingredient_PK                                         */
/*==============================================================*/
create unique index ingredient_PK on ingredient (
ingredient_id
);

/*==============================================================*/
/* Table: job_position_dic                                      */
/*==============================================================*/
create table job_position_dic (
   position_id          INT4                 not null,
   name                 VARCHAR(256)         not null,
   constraint PK_JOB_POSITION_DIC primary key (position_id),
   constraint AK_U_JOB_POSITION_NAM_JOB_POSI unique (name)
);

INSERT INTO job_position_dic
       (position_id, name)
VALUES (1, 'Manager');
INSERT INTO job_position_dic
       (position_id, name)
VALUES (2, 'Chef');
INSERT INTO job_position_dic
       (position_id, name)
VALUES (3, 'Cook');
INSERT INTO job_position_dic
       (position_id, name)
VALUES (4, 'Waiter');
INSERT INTO job_position_dic
       (position_id, name)
VALUES (5, 'Cleaner');

/*==============================================================*/
/* Index: job_position_dic_PK                                   */
/*==============================================================*/
create unique index job_position_dic_PK on job_position_dic (
position_id
);

/*==============================================================*/
/* Table: menu                                                  */
/*==============================================================*/
create table menu (
   menu_id              INT4                 not null,
   name                 VARCHAR(256)         not null,
   constraint PK_MENU primary key (menu_id),
   constraint AK_U_MENU_NAME_MENU unique (name)
);

/*==============================================================*/
/* Index: menu_PK                                               */
/*==============================================================*/
create unique index menu_PK on menu (
menu_id
);

/*==============================================================*/
/* Table: menu_courses_list                                     */
/*==============================================================*/
create table menu_courses_list (
   course_id            INT4                 not null,
   menu_id              INT4                 not null,
   course_number        INT4                 not null,
   constraint PK_MENU_COURSES_LIST primary key (course_id, menu_id),
   constraint AK_U_NUMBER_IN_MENU_MENU_COU unique (menu_id, course_number)
);

/*==============================================================*/
/* Index: menu_header_FK                                        */
/*==============================================================*/
create  index menu_header_FK on menu_courses_list (
menu_id
);

/*==============================================================*/
/* Index: menu_course_FK                                        */
/*==============================================================*/
create  index menu_course_FK on menu_courses_list (
course_id
);

/*==============================================================*/
/* Table: "order"                                               */
/*==============================================================*/
create table "order" (
   order_id             SERIAL               not null,
   table_id             INT4                 not null,
   employee_id          INT4                 not null,
   order_number         VARCHAR(100)         not null,
   order_datetime       DATE                 not null,
   constraint PK_ORDER primary key (order_id)
);

/*==============================================================*/
/* Index: order_PK                                              */
/*==============================================================*/
create unique index order_PK on "order" (
order_id
);

/*==============================================================*/
/* Index: order_employee_FK                                     */
/*==============================================================*/
create  index order_employee_FK on "order" (
employee_id
);

/*==============================================================*/
/* Index: order_table_FK                                        */
/*==============================================================*/
create  index order_table_FK on "order" (
table_id
);

/*==============================================================*/
/* Table: order_courses                                         */
/*==============================================================*/
create table order_courses (
   course_id            INT4                 not null,
   order_id             INT4                 not null,
   constraint PK_ORDER_COURSES primary key (course_id, order_id)
);

/*==============================================================*/
/* Index: order_courses_PK                                      */
/*==============================================================*/
create unique index order_courses_PK on order_courses (
course_id,
order_id
);

/*==============================================================*/
/* Index: order_courses_FK                                      */
/*==============================================================*/
create  index order_courses_FK on order_courses (
course_id
);

/*==============================================================*/
/* Index: order_courses2_FK                                     */
/*==============================================================*/
create  index order_courses2_FK on order_courses (
order_id
);

/*==============================================================*/
/* Table: "table"                                               */
/*==============================================================*/
create table "table" (
   table_id             SERIAL               not null,
   number               INT4                 not null,
   description          VARCHAR(256)         null,
   constraint PK_TABLE primary key (table_id)
);

/*==============================================================*/
/* Index: table_PK                                              */
/*==============================================================*/
create unique index table_PK on "table" (
table_id
);

/*==============================================================*/
/* Table: warehouse                                             */
/*==============================================================*/
create table warehouse (
   ingredient_id        INT4                 not null,
   quantity             INT4                 not null,
   constraint PK_WAREHOUSE primary key (ingredient_id)
);

/*==============================================================*/
/* Index: warehouse_ingredient_FK                               */
/*==============================================================*/
create  index warehouse_ingredient_FK on warehouse (
ingredient_id
);

alter table cooked_course
   add constraint FK_COOKED_C_COOK_EMPLOYEE foreign key (employee_id)
      references employee (employee_id)
      on delete restrict on update restrict;

alter table cooked_course
   add constraint FK_COOKED_C_COOKED_CO_COURSE foreign key (course_id)
      references course (course_id)
      on delete restrict on update restrict;

alter table cooked_course
   add constraint FK_COOKED_C_COOKED_CO_ORDER foreign key (order_id)
      references "order" (order_id)
      on delete restrict on update restrict;

alter table course
   add constraint FK_COURSE_COURSE_CA_COURSE_C foreign key (course_category_id)
      references course_category_dic (course_category_id)
      on delete restrict on update restrict;

alter table course_ingredient
   add constraint FK_COURSE_I_COURSE_IN_INGREDIE foreign key (ingredient_id)
      references ingredient (ingredient_id)
      on delete restrict on update restrict;

alter table course_ingredient
   add constraint FK_COURSE_I_COURSE_IN_COURSE foreign key (course_id)
      references course (course_id)
      on delete cascade on update cascade;

alter table employee
   add constraint FK_EMPLOYEE_EMPLOYEE__JOB_POSI foreign key (position_id)
      references job_position_dic (position_id)
      on delete restrict on update restrict;

alter table menu_courses_list
   add constraint FK_MENU_COU_MENU_COUR_COURSE foreign key (course_id)
      references course (course_id)
      on delete restrict on update restrict;

alter table menu_courses_list
   add constraint FK_MENU_COU_MENU_HEAD_MENU foreign key (menu_id)
      references menu (menu_id)
      on delete cascade on update cascade;

alter table "order"
   add constraint FK_ORDER_ORDER_EMP_EMPLOYEE foreign key (employee_id)
      references employee (employee_id)
      on delete restrict on update restrict;

alter table "order"
   add constraint FK_ORDER_ORDER_TAB_TABLE foreign key (table_id)
      references "table" (table_id)
      on delete restrict on update restrict;

alter table order_courses
   add constraint FK_ORDER_CO_ORDER_COU_COURSE foreign key (course_id)
      references course (course_id)
      on delete restrict on update restrict;

alter table order_courses
   add constraint FK_ORDER_CO_ORDER_COU_ORDER foreign key (order_id)
      references "order" (order_id)
      on delete cascade on update cascade;

alter table warehouse
   add constraint FK_WAREHOUS_WAREHOUSE_INGREDIE foreign key (ingredient_id)
      references ingredient (ingredient_id)
      on delete restrict on update restrict;

