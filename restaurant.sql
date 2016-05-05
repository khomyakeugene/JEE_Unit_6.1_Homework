/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     05.05.2016 16:06:05                          */
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

drop index crs_ingrd_course_FK;

drop index crs_ingrd_ingredient_FK;

drop index crs_ingrd_portion_FK;

drop table course_ingredient;

drop index employee_job_position_FK;

drop index employee_PK;

drop table employee;

drop index ingredient_PK;

drop table ingredient;

drop index job_position_dic_PK;

drop table job_position_dic;

drop index measuring_type_dic_PK;

drop table measuring_type_dic;

drop index menu_PK;

drop table menu;

drop index menu_course_FK;

drop index menu_header_FK;

drop table menu_courses_list;

drop index order_table_FK;

drop index order_employee_FK;

drop index order_PK;

drop table "order";

drop index ord_crs_order_FK;

drop index ord_crs_course_FK;

drop table order_course;

drop index portion_measury_FK;

drop index portion_type_FK;

drop index portion_dic_PK;

drop table portion_dic;

drop index portion_type_dic_PK;

drop table portion_type_dic;

drop index table_PK;

drop table "table";

drop index wrhs_portion_FK;

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
   course_id            SERIAL               not null,
   course_category_id   INT4                 not null,
   name                 VARCHAR(256)         not null,
   weight               FLOAT8               not null,
   cost                 MONEY                not null,
   constraint PK_COURSE primary key (course_id),
   constraint AK_U_COURSE_COURSE unique (name)
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
   course_category_id   SERIAL               not null,
   name                 VARCHAR(256)         not null,
   constraint PK_COURSE_CATEGORY_DIC primary key (course_category_id),
   constraint AK_U_COURSE_CATEGORY_COURSE_C unique (name)
);

INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (101, 'Appetizers');

INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (201, 'Salads');

INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (301, 'Soups');

INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (401, 'Entrees');

INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (501, 'Deserts');

INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (6001, 'Nonalcoholic beverages');

INSERT INTO course_category_dic
       (course_category_id, name)
       VALUES (7001, 'Alcoholic beverages');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (7101, 'Beer');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (7201, 'Cider');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (7301, 'Wine');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (7401, 'Brandy');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (7501, 'Cognac');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (7601, 'Whisky');
INSERT INTO course_category_dic
       (course_category_id, name)
VALUES (7701, 'Horilka');



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
   course_id            INT4                 not null,
   ingredient_id        INT4                 not null,
   portion_id           INT4                 null,
   amount               FLOAT8               null,
   constraint PK_COURSE_INGREDIENT primary key (course_id, ingredient_id)
);

/*==============================================================*/
/* Index: crs_ingrd_portion_FK                                  */
/*==============================================================*/
create  index crs_ingrd_portion_FK on course_ingredient (
portion_id
);

/*==============================================================*/
/* Index: crs_ingrd_ingredient_FK                               */
/*==============================================================*/
create  index crs_ingrd_ingredient_FK on course_ingredient (
ingredient_id
);

/*==============================================================*/
/* Index: crs_ingrd_course_FK                                   */
/*==============================================================*/
create  index crs_ingrd_course_FK on course_ingredient (
course_id
);

/*==============================================================*/
/* Table: employee                                              */
/*==============================================================*/
create table employee (
   employee_id          SERIAL               not null,
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
   constraint AK_U_INGREDIENT_INGREDIE unique (name)
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
VALUES (7, 'White cabbage');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (8, 'Red cabbage');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (9, 'Pe-tsai');

INSERT INTO ingredient
       (ingredient_id, name)
VALUES (101, 'Salt');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (102, 'Pepper');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (103, 'Cinnamon');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (104, 'Sugar');

INSERT INTO ingredient
       (ingredient_id, name)
VALUES (201, 'Butter');

INSERT INTO ingredient
       (ingredient_id, name)
VALUES (301, 'Sunflower oil');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (302, 'Olive oil');
INSERT INTO ingredient
       (ingredient_id, name)
VALUES (303, 'Vinegar');

INSERT INTO ingredient
       (ingredient_id, name)
VALUES (10001, 'Beer "Doms"');

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
   position_id          SERIAL               not null,
   name                 VARCHAR(256)         not null,
   constraint PK_JOB_POSITION_DIC primary key (position_id),
   constraint AK_U_JOB_POSITION_JOB_POSI unique (name)
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
/* Table: measuring_type_dic                                    */
/*==============================================================*/
create table measuring_type_dic (
   measuring_type_id    SERIAL               not null,
   measuring_type_code  CHAR(3)              not null,
   name                 VARCHAR(256)         not null,
   constraint PK_MEASURING_TYPE_DIC primary key (measuring_type_id),
   constraint AK_U_MEASURING_TYPE_C_MEASURIN unique (measuring_type_code),
   constraint AK_U_MEASURING_TYPE_N_MEASURIN unique (name)
);

INSERT INTO measuring_type_dic
       (measuring_type_id, measuring_type_code, name)
VALUES (1, 'kg', 'kilogram');           
INSERT INTO measuring_type_dic
       (measuring_type_id, measuring_type_code, name)
VALUES (2, 'l', 'litre');

/*==============================================================*/
/* Index: measuring_type_dic_PK                                 */
/*==============================================================*/
create unique index measuring_type_dic_PK on measuring_type_dic (
measuring_type_id
);

/*==============================================================*/
/* Table: menu                                                  */
/*==============================================================*/
create table menu (
   menu_id              SERIAL               not null,
   name                 VARCHAR(256)         not null,
   constraint PK_MENU primary key (menu_id),
   constraint AK_U_MENU_MENU unique (name)
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
   menu_id              INT4                 not null,
   course_id            INT4                 not null,
   course_number        INT4                 not null,
   constraint PK_MENU_COURSES_LIST primary key (course_id, menu_id),
   constraint AK_U_MENU_COURSES_LIS_MENU_COU unique (menu_id, course_number)
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
/* Table: order_course                                          */
/*==============================================================*/
create table order_course (
   order_id             INT4                 not null,
   course_id            INT4                 not null,
   quantity             INT4                 not null,
   constraint PK_ORDER_COURSE primary key (order_id, course_id)
);

/*==============================================================*/
/* Index: ord_crs_course_FK                                     */
/*==============================================================*/
create  index ord_crs_course_FK on order_course (
course_id
);

/*==============================================================*/
/* Index: ord_crs_order_FK                                      */
/*==============================================================*/
create  index ord_crs_order_FK on order_course (
order_id
);

/*==============================================================*/
/* Table: portion_dic                                           */
/*==============================================================*/
create table portion_dic (
   portion_id           SERIAL               not null,
   portion_type_id      INT4                 not null,
   measuring_type_id    INT4                 not null,
   amount               FLOAT8               null,
   description          VARCHAR(256)         null,
   constraint PK_PORTION_DIC primary key (portion_id)
);

INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (1001, 1, 1, null, 'Anything in kilograms');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (1002, 1, 2, null, 'Anything in litre');

INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (2001, 2, 1, 0.25, 'Packing 0,25kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (2002, 2, 1, 0.5, 'Packing 0,5kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (2003, 2, 1, 0.75, 'Packing 0,75kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (2004, 2, 1, 1.0, 'Packing 1kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (2005, 2, 1, 1.5, 'Packing 1,5kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (2006, 2, 1, 2.0, 'Packing 2kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (2007, 2, 1, 3.0, 'Packing 3kg');

INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3001, 3, 1, 0.25, 'Can 0,25kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3002, 3, 1, 0.33, 'Can 0,33kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3003, 3, 1, 0.5, 'Can 0,5kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3004, 3, 1, 1.0, 'Can 1kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3005, 3, 1, 1.5, 'Can 1,5kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3006, 3, 1, 2.0, 'Can 2kg');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3007, 3, 1, 3.0, 'Can 3kg');

INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3101, 3, 2, 0.25, 'Can 0,25l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3102, 3, 2, 0.33, 'Can 0,33l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3103, 3, 2, 0.5, 'Can 0,5l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3104, 3, 2, 1.0, 'Can 1l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3105, 3, 2, 1.5, 'Can 1,5l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3106, 3, 2, 2.0, 'Can 2l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (3107, 3, 2, 3.0, 'Can 3l');

INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4001, 4, 2, 0.25, 'Bottle 0,25l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4002, 4, 2, 0.33, 'Bottle 0,33l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4003, 4, 2, 0.5, 'Bottle 0,5l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4004, 4, 2, 0.6, 'Bottle 0,6l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4005, 4, 2, 0.75, 'Bottle 0,75l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4006, 4, 2, 1.0, 'Bottle 1l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4007, 4, 2, 1.5, 'Bottle 1,5l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4008, 4, 2, 1.75, 'Bottle 1,75l');
INSERT INTO portion_dic
       (portion_id, portion_type_id, measuring_type_id, amount, description)
VALUES (4009, 4, 2, 2.0, 'Bottle 2l');

/*==============================================================*/
/* Index: portion_dic_PK                                        */
/*==============================================================*/
create unique index portion_dic_PK on portion_dic (
portion_id
);

/*==============================================================*/
/* Index: portion_type_FK                                       */
/*==============================================================*/
create  index portion_type_FK on portion_dic (
portion_type_id
);

/*==============================================================*/
/* Index: portion_measury_FK                                    */
/*==============================================================*/
create  index portion_measury_FK on portion_dic (
measuring_type_id
);

/*==============================================================*/
/* Table: portion_type_dic                                      */
/*==============================================================*/
create table portion_type_dic (
   portion_type_id      SERIAL               not null,
   name                 VARCHAR(256)         not null,
   constraint PK_PORTION_TYPE_DIC primary key (portion_type_id)
);

INSERT INTO portion_type_dic
       (portion_type_id, name)
VALUES (1, 'Portion (anything)'); 
INSERT INTO portion_type_dic
       (portion_type_id, name)
VALUES (2, 'Packing');      
INSERT INTO portion_type_dic
       (portion_type_id, name)
VALUES (3, 'Can'); 
INSERT INTO portion_type_dic
       (portion_type_id, name)
VALUES (4, 'Bottle');     

/*==============================================================*/
/* Index: portion_type_dic_PK                                   */
/*==============================================================*/
create unique index portion_type_dic_PK on portion_type_dic (
portion_type_id
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
   portion_id           INT4                 not null,
   amount               FLOAT8               not null,
   constraint PK_WAREHOUSE primary key (portion_id, ingredient_id)
);

/*==============================================================*/
/* Index: warehouse_ingredient_FK                               */
/*==============================================================*/
create  index warehouse_ingredient_FK on warehouse (
ingredient_id
);

/*==============================================================*/
/* Index: wrhs_portion_FK                                       */
/*==============================================================*/
create  index wrhs_portion_FK on warehouse (
portion_id
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
   add constraint FK_COURSE_I_CRS_INGRD_COURSE foreign key (course_id)
      references course (course_id)
      on delete cascade on update cascade;

alter table course_ingredient
   add constraint FK_COURSE_I_CRS_INGRD_INGREDIE foreign key (ingredient_id)
      references ingredient (ingredient_id)
      on delete restrict on update restrict;

alter table course_ingredient
   add constraint FK_COURSE_I_CRS_INGRD_PORTION_ foreign key (portion_id)
      references portion_dic (portion_id)
      on delete restrict on update restrict;

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
      on delete restrict on update restrict;

alter table "order"
   add constraint FK_ORDER_ORDER_EMP_EMPLOYEE foreign key (employee_id)
      references employee (employee_id)
      on delete restrict on update restrict;

alter table "order"
   add constraint FK_ORDER_ORDER_TAB_TABLE foreign key (table_id)
      references "table" (table_id)
      on delete restrict on update restrict;

alter table order_course
   add constraint FK_ORDER_CO_ORD_CRS_C_COURSE foreign key (course_id)
      references course (course_id)
      on delete restrict on update restrict;

alter table order_course
   add constraint FK_ORDER_CO_ORD_CRS_O_ORDER foreign key (order_id)
      references "order" (order_id)
      on delete cascade on update cascade;

alter table portion_dic
   add constraint FK_PORTION__PORTION_M_MEASURIN foreign key (measuring_type_id)
      references measuring_type_dic (measuring_type_id)
      on delete restrict on update restrict;

alter table portion_dic
   add constraint FK_PORTION__PORTION_T_PORTION_ foreign key (portion_type_id)
      references portion_type_dic (portion_type_id)
      on delete restrict on update restrict;

alter table warehouse
   add constraint FK_WAREHOUS_WAREHOUSE_INGREDIE foreign key (ingredient_id)
      references ingredient (ingredient_id)
      on delete restrict on update restrict;

alter table warehouse
   add constraint FK_WAREHOUS_WRHS_PORT_PORTION_ foreign key (portion_id)
      references portion_dic (portion_id)
      on delete restrict on update restrict;

