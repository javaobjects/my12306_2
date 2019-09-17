prompt PL/SQL Developer Export Tables for user SCOTT@ORCL
prompt Created by yanbo on 2019��9��17��
set feedback off
set define off

prompt Creating MY12306_2_CERTTYPE...
create table MY12306_2_CERTTYPE
(
  id      NUMBER(11) not null,
  content VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column MY12306_2_CERTTYPE.id
  is 'ID';
comment on column MY12306_2_CERTTYPE.content
  is '֤������';
alter table MY12306_2_CERTTYPE
  add constraint MY12306_2_CERTTYPE_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating MY12306_2_CITY...
create table MY12306_2_CITY
(
  id     NUMBER(11) not null,
  cityid VARCHAR2(6),
  city   VARCHAR2(50),
  father VARCHAR2(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column MY12306_2_CITY.id
  is 'ID';
comment on column MY12306_2_CITY.cityid
  is '�б�־';
comment on column MY12306_2_CITY.city
  is '������';
comment on column MY12306_2_CITY.father
  is 'ʡ�ݱ�ʶ';
alter table MY12306_2_CITY
  add constraint MY12306_2_CITY_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating MY12306_2_PROVINCE...
create table MY12306_2_PROVINCE
(
  id         NUMBER(11) not null,
  provinceid VARCHAR2(6),
  province   VARCHAR2(40)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column MY12306_2_PROVINCE.id
  is 'ID';
comment on column MY12306_2_PROVINCE.provinceid
  is 'ʡ�ݱ�ʶ';
comment on column MY12306_2_PROVINCE.province
  is 'ʡ������';
alter table MY12306_2_PROVINCE
  add constraint MY12306_2_PROVINCE_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating MY12306_2_USERTYPE...
create table MY12306_2_USERTYPE
(
  id      NUMBER(11) not null,
  content VARCHAR2(40) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column MY12306_2_USERTYPE.id
  is 'ID';
comment on column MY12306_2_USERTYPE.content
  is '�ÿ�����';
alter table MY12306_2_USERTYPE
  add constraint MY12306_2_USERTYPE_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating MY12306_2_USER...
create table MY12306_2_USER
(
  id         NUMBER(11) not null,
  username   VARCHAR2(30) not null,
  password   VARCHAR2(50) not null,
  rule       VARCHAR2(2) default '2' not null,
  realname   VARCHAR2(50) not null,
  sex        CHAR(1) default '1' not null,
  city       NUMBER(11) not null,
  cert_type  NUMBER(11) not null,
  cert       VARCHAR2(50) not null,
  birthday   DATE not null,
  user_type  NUMBER(11),
  content    VARCHAR2(3000),
  status     CHAR(1) default '1' not null,
  login_ip   VARCHAR2(50),
  image_path VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column MY12306_2_USER.id
  is 'ID';
comment on column MY12306_2_USER.username
  is '�û���';
comment on column MY12306_2_USER.password
  is '����';
comment on column MY12306_2_USER.rule
  is 'Ȩ��(1������Ա 2����ͨ�û�)';
comment on column MY12306_2_USER.realname
  is '��ʵ����';
comment on column MY12306_2_USER.sex
  is '�Ա�(1���� 2��Ů)';
comment on column MY12306_2_USER.city
  is '����Ϣ�ֵ�IDֵ';
comment on column MY12306_2_USER.cert_type
  is '֤�������ֵ�IDֵ';
comment on column MY12306_2_USER.cert
  is '֤������';
comment on column MY12306_2_USER.birthday
  is '����';
comment on column MY12306_2_USER.user_type
  is '�ÿ������ֵ�IDֵ';
comment on column MY12306_2_USER.content
  is '��ע��Ϣ';
comment on column MY12306_2_USER.status
  is '�û�״̬��0����Ч  1����Ч ��';
comment on column MY12306_2_USER.login_ip
  is '��½IP';
comment on column MY12306_2_USER.image_path
  is '�û�ͷ��·��';
alter table MY12306_2_USER
  add constraint MY12306_2_USER_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MY12306_2_USER
  add constraint MY12306_2_USER_UK unique (USERNAME)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MY12306_2_USER
  add constraint MY12306_2_USER_CERTTYPE_FK foreign key (CERT_TYPE)
  references MY12306_2_CERTTYPE (ID);
alter table MY12306_2_USER
  add constraint MY12306_2_USER_CITY_FK foreign key (CITY)
  references MY12306_2_CITY (ID);
alter table MY12306_2_USER
  add constraint MY12306_2_USER_USERTYPE_FK foreign key (USER_TYPE)
  references MY12306_2_USERTYPE (ID);

prompt Disabling triggers for MY12306_2_CERTTYPE...
alter table MY12306_2_CERTTYPE disable all triggers;
prompt Disabling triggers for MY12306_2_CITY...
alter table MY12306_2_CITY disable all triggers;
prompt Disabling triggers for MY12306_2_PROVINCE...
alter table MY12306_2_PROVINCE disable all triggers;
prompt Disabling triggers for MY12306_2_USERTYPE...
alter table MY12306_2_USERTYPE disable all triggers;
prompt Disabling triggers for MY12306_2_USER...
alter table MY12306_2_USER disable all triggers;
prompt Disabling foreign key constraints for MY12306_2_USER...
alter table MY12306_2_USER disable constraint MY12306_2_USER_CERTTYPE_FK;
alter table MY12306_2_USER disable constraint MY12306_2_USER_CITY_FK;
alter table MY12306_2_USER disable constraint MY12306_2_USER_USERTYPE_FK;
prompt Deleting MY12306_2_USER...
delete from MY12306_2_USER;
commit;
prompt Deleting MY12306_2_USERTYPE...
delete from MY12306_2_USERTYPE;
commit;
prompt Deleting MY12306_2_PROVINCE...
delete from MY12306_2_PROVINCE;
commit;
prompt Deleting MY12306_2_CITY...
delete from MY12306_2_CITY;
commit;
prompt Deleting MY12306_2_CERTTYPE...
delete from MY12306_2_CERTTYPE;
commit;
prompt Loading MY12306_2_CERTTYPE...
insert into MY12306_2_CERTTYPE (id, content)
values (1, '�������֤');
insert into MY12306_2_CERTTYPE (id, content)
values (2, '�۰�ͨ��֤');
insert into MY12306_2_CERTTYPE (id, content)
values (3, '̨��ͨ��֤');
insert into MY12306_2_CERTTYPE (id, content)
values (4, '����');
commit;
prompt 4 records loaded
prompt Loading MY12306_2_CITY...
insert into MY12306_2_CITY (id, cityid, city, father)
values (1, '110100', '������', '110000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (3, '120100', '�����', '120000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (5, '130100', 'ʯ��ׯ��', '130000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (6, '130200', '��ɽ��', '130000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (7, '130300', '�ػʵ���', '130000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (8, '130400', '������', '130000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (9, '130500', '��̨��', '130000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (10, '130600', '������', '130000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (11, '130700', '�żҿ���', '130000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (12, '130800', '�е���', '130000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (13, '130900', '������', '130000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (14, '131000', '�ȷ���', '130000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (15, '131100', '��ˮ��', '130000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (16, '140100', '̫ԭ��', '140000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (17, '140200', '��ͬ��', '140000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (18, '140300', '��Ȫ��', '140000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (19, '140400', '������', '140000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (20, '140500', '������', '140000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (21, '140600', '˷����', '140000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (22, '140700', '������', '140000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (23, '140800', '�˳���', '140000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (24, '140900', '������', '140000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (25, '141000', '�ٷ���', '140000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (26, '141100', '������', '140000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (27, '150100', '���ͺ�����', '150000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (28, '150200', '��ͷ��', '150000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (29, '150300', '�ں���', '150000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (30, '150400', '�����', '150000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (31, '150500', 'ͨ����', '150000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (32, '150600', '������˹��', '150000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (33, '150700', '���ױ�����', '150000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (34, '150800', '�����׶���', '150000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (35, '150900', '�����첼��', '150000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (36, '152200', '�˰���', '150000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (37, '152500', '���ֹ�����', '150000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (38, '152900', '��������', '150000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (39, '210100', '������', '210000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (40, '210200', '������', '210000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (41, '210300', '��ɽ��', '210000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (42, '210400', '��˳��', '210000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (43, '210500', '��Ϫ��', '210000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (44, '210600', '������', '210000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (45, '210700', '������', '210000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (46, '210800', 'Ӫ����', '210000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (47, '210900', '������', '210000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (48, '211000', '������', '210000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (49, '211100', '�̽���', '210000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (50, '211200', '������', '210000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (51, '211300', '������', '210000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (52, '211400', '��«����', '210000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (53, '220100', '������', '220000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (54, '220200', '������', '220000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (55, '220300', '��ƽ��', '220000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (56, '220400', '��Դ��', '220000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (57, '220500', 'ͨ����', '220000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (58, '220600', '��ɽ��', '220000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (59, '220700', '��ԭ��', '220000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (60, '220800', '�׳���', '220000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (61, '222400', '�ӱ߳�����������', '220000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (62, '230100', '��������', '230000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (63, '230200', '���������', '230000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (64, '230300', '������', '230000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (65, '230400', '�׸���', '230000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (66, '230500', '˫Ѽɽ��', '230000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (67, '230600', '������', '230000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (68, '230700', '������', '230000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (69, '230800', '��ľ˹��', '230000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (70, '230900', '��̨����', '230000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (71, '231000', 'ĵ������', '230000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (72, '231100', '�ں���', '230000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (73, '231200', '�绯��', '230000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (74, '232700', '���˰������', '230000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (75, '310100', '�Ϻ���', '310000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (77, '320100', '�Ͼ���', '320000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (78, '320200', '������', '320000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (79, '320300', '������', '320000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (80, '320400', '������', '320000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (81, '320500', '������', '320000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (82, '320600', '��ͨ��', '320000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (83, '320700', '���Ƹ���', '320000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (84, '320800', '������', '320000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (85, '320900', '�γ���', '320000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (86, '321000', '������', '320000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (87, '321100', '����', '320000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (88, '321200', '̩����', '320000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (89, '321300', '��Ǩ��', '320000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (90, '330100', '������', '330000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (91, '330200', '������', '330000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (92, '330300', '������', '330000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (93, '330400', '������', '330000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (94, '330500', '������', '330000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (95, '330600', '������', '330000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (96, '330700', '����', '330000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (97, '330800', '������', '330000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (98, '330900', '��ɽ��', '330000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (99, '331000', '̨����', '330000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (100, '331100', '��ˮ��', '330000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (101, '340100', '�Ϸ���', '340000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (102, '340200', '�ߺ���', '340000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (103, '340300', '������', '340000');
commit;
prompt 100 records committed...
insert into MY12306_2_CITY (id, cityid, city, father)
values (104, '340400', '������', '340000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (105, '340500', '��ɽ��', '340000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (106, '340600', '������', '340000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (107, '340700', 'ͭ����', '340000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (108, '340800', '������', '340000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (109, '341000', '��ɽ��', '340000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (110, '341100', '������', '340000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (111, '341200', '������', '340000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (112, '341300', '������', '340000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (113, '341400', '������', '340000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (114, '341500', '������', '340000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (115, '341600', '������', '340000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (116, '341700', '������', '340000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (117, '341800', '������', '340000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (118, '350100', '������', '350000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (119, '350200', '������', '350000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (120, '350300', '������', '350000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (121, '350400', '������', '350000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (122, '350500', 'Ȫ����', '350000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (123, '350600', '������', '350000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (124, '350700', '��ƽ��', '350000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (125, '350800', '������', '350000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (126, '350900', '������', '350000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (127, '360100', '�ϲ���', '360000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (128, '360200', '��������', '360000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (129, '360300', 'Ƽ����', '360000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (130, '360400', '�Ž���', '360000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (131, '360500', '������', '360000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (132, '360600', 'ӥ̶��', '360000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (133, '360700', '������', '360000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (134, '360800', '������', '360000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (135, '360900', '�˴���', '360000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (136, '361000', '������', '360000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (137, '361100', '������', '360000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (138, '370100', '������', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (139, '370200', '�ൺ��', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (140, '370300', '�Ͳ���', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (141, '370400', '��ׯ��', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (142, '370500', '��Ӫ��', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (143, '370600', '��̨��', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (144, '370700', 'Ϋ����', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (145, '370800', '������', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (146, '370900', '̩����', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (147, '371000', '������', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (148, '371100', '������', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (149, '371200', '������', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (150, '371300', '������', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (151, '371400', '������', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (152, '371500', '�ĳ���', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (153, '371600', '������', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (154, '371700', '������', '370000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (155, '410100', '֣����', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (156, '410200', '������', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (157, '410300', '������', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (158, '410400', 'ƽ��ɽ��', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (159, '410500', '������', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (160, '410600', '�ױ���', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (161, '410700', '������', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (162, '410800', '������', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (163, '410900', '�����', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (164, '411000', '�����', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (165, '411100', '�����', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (166, '411200', '����Ͽ��', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (167, '411300', '������', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (168, '411400', '������', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (169, '411500', '������', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (170, '411600', '�ܿ���', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (171, '411700', 'פ�����', '410000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (172, '420100', '�人��', '420000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (173, '420200', '��ʯ��', '420000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (174, '420300', 'ʮ����', '420000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (175, '420500', '�˲���', '420000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (176, '420600', '�差��', '420000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (177, '420700', '������', '420000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (178, '420800', '������', '420000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (179, '420900', 'Т����', '420000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (180, '421000', '������', '420000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (181, '421100', '�Ƹ���', '420000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (182, '421200', '������', '420000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (183, '421300', '������', '420000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (184, '422800', '��ʩ����������������', '420000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (185, '429000', 'ʡֱϽ������λ', '420000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (186, '430100', '��ɳ��', '430000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (187, '430200', '������', '430000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (188, '430300', '��̶��', '430000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (189, '430400', '������', '430000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (190, '430500', '������', '430000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (191, '430600', '������', '430000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (192, '430700', '������', '430000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (193, '430800', '�żҽ���', '430000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (194, '430900', '������', '430000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (195, '431000', '������', '430000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (196, '431100', '������', '430000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (197, '431200', '������', '430000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (198, '431300', '¦����', '430000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (199, '433100', '��������������������', '430000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (200, '440100', '������', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (201, '440200', '�ع���', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (202, '440300', '������', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (203, '440400', '�麣��', '440000');
commit;
prompt 200 records committed...
insert into MY12306_2_CITY (id, cityid, city, father)
values (204, '440500', '��ͷ��', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (205, '440600', '��ɽ��', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (206, '440700', '������', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (207, '440800', 'տ����', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (208, '440900', 'ï����', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (209, '441200', '������', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (210, '441300', '������', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (211, '441400', '÷����', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (212, '441500', '��β��', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (213, '441600', '��Դ��', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (214, '441700', '������', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (215, '441800', '��Զ��', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (216, '441900', '��ݸ��', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (217, '442000', '��ɽ��', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (218, '445100', '������', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (219, '445200', '������', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (220, '445300', '�Ƹ���', '440000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (221, '450100', '������', '450000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (222, '450200', '������', '450000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (223, '450300', '������', '450000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (224, '450400', '������', '450000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (225, '450500', '������', '450000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (226, '450600', '���Ǹ���', '450000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (227, '450700', '������', '450000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (228, '450800', '�����', '450000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (229, '450900', '������', '450000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (230, '451000', '��ɫ��', '450000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (231, '451100', '������', '450000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (232, '451200', '�ӳ���', '450000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (233, '451300', '������', '450000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (234, '451400', '������', '450000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (235, '460100', '������', '460000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (236, '460200', '������', '460000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (237, '469000', 'ʡֱϽ�ؼ�������λ', '460000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (238, '500100', '������', '500000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (241, '510100', '�ɶ���', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (242, '510300', '�Թ���', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (243, '510400', '��֦����', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (244, '510500', '������', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (245, '510600', '������', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (246, '510700', '������', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (249, '511000', '�ڽ���', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (250, '511100', '��ɽ��', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (251, '511300', '�ϳ���', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (252, '511400', 'üɽ��', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (253, '511500', '�˱���', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (254, '511600', '�㰲��', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (255, '511700', '������', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (256, '511800', '�Ű���', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (257, '511900', '������', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (258, '512000', '������', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (259, '513200', '���Ӳ���Ǽ��������', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (260, '513300', '���β���������', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (261, '513400', '��ɽ����������', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (262, '520100', '������', '520000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (263, '520200', '����ˮ��', '520000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (264, '520300', '������', '520000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (265, '520400', '��˳��', '520000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (266, '522200', 'ͭ�ʵ���', '520000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (267, '522300', 'ǭ���ϲ���������������', '520000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (268, '522400', '�Ͻڵ���', '520000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (269, '522600', 'ǭ�������嶱��������', '520000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (270, '522700', 'ǭ�ϲ���������������', '520000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (271, '530100', '������', '530000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (272, '530300', '������', '530000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (273, '530400', '��Ϫ��', '530000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (274, '530500', '��ɽ��', '530000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (275, '530600', '��ͨ��', '530000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (276, '530700', '������', '530000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (277, '530800', '˼é��', '530000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (278, '530900', '�ٲ���', '530000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (279, '532300', '��������������', '530000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (280, '532500', '��ӹ���������������', '530000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (281, '532600', '��ɽ׳������������', '530000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (282, '532800', '��˫���ɴ���������', '530000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (283, '532900', '�������������', '530000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (284, '533100', '�º���徰����������', '530000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (285, '533300', 'ŭ��������������', '530000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (286, '533400', '�������������', '530000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (287, '540100', '������', '540000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (288, '542100', '��������', '540000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (289, '542200', 'ɽ�ϵ���', '540000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (290, '542300', '�տ������', '540000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (291, '542400', '��������', '540000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (292, '542500', '�������', '540000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (293, '542600', '��֥����', '540000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (294, '610100', '������', '610000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (295, '610200', 'ͭ����', '610000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (296, '610300', '������', '610000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (297, '610400', '������', '610000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (298, '610500', 'μ����', '610000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (299, '610600', '�Ӱ���', '610000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (300, '610700', '������', '610000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (301, '610800', '������', '610000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (302, '610900', '������', '610000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (303, '611000', '������', '610000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (304, '620100', '������', '620000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (305, '620200', '��������', '620000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (306, '620300', '�����', '620000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (307, '620400', '������', '620000');
commit;
prompt 300 records committed...
insert into MY12306_2_CITY (id, cityid, city, father)
values (308, '620500', '��ˮ��', '620000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (309, '620600', '������', '620000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (310, '620700', '��Ҵ��', '620000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (311, '620800', 'ƽ����', '620000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (312, '620900', '��Ȫ��', '620000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (313, '621000', '������', '620000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (314, '621100', '������', '620000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (247, '510800', '��Ԫ��', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (248, '510900', '������', '510000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (315, '621200', '¤����', '620000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (316, '622900', '���Ļ���������', '620000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (317, '623000', '���ϲ���������', '620000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (318, '630100', '������', '630000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (319, '632100', '��������', '630000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (320, '632200', '��������������', '630000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (321, '632300', '���ϲ���������', '630000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (322, '632500', '���ϲ���������', '630000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (323, '632600', '�������������', '630000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (324, '632700', '��������������', '630000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (325, '632800', '�����ɹ������������', '630000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (326, '640100', '������', '640000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (327, '640200', 'ʯ��ɽ��', '640000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (328, '640300', '������', '640000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (329, '640400', '��ԭ��', '640000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (330, '640500', '������', '640000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (331, '650100', '��³ľ����', '650000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (332, '650200', '����������', '650000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (333, '652100', '��³������', '650000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (334, '652200', '���ܵ���', '650000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (335, '652300', '��������������', '650000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (336, '652700', '���������ɹ�������', '650000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (337, '652800', '���������ɹ�������', '650000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (338, '652900', '�����յ���', '650000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (339, '653000', '�������տ¶�����������', '650000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (340, '653100', '��ʲ����', '650000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (341, '653200', '�������', '650000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (342, '654000', '���������������', '650000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (343, '654200', '���ǵ���', '650000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (344, '654300', '����̩����', '650000');
insert into MY12306_2_CITY (id, cityid, city, father)
values (345, '659000', 'ʡֱϽ������λ', '650000');
commit;
prompt 340 records loaded
prompt Loading MY12306_2_PROVINCE...
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (1, '110000', '����');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (2, '120000', '���');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (3, '130000', '�ӱ�ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (4, '140000', 'ɽ��ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (5, '150000', '���ɹ�������');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (6, '210000', '����ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (7, '220000', '����ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (8, '230000', '������ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (9, '310000', '�Ϻ�');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (10, '320000', '����ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (11, '330000', '�㽭ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (12, '340000', '����ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (13, '350000', '����ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (14, '360000', '����ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (15, '370000', 'ɽ��ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (16, '410000', '����ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (17, '420000', '����ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (18, '430000', '����ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (19, '440000', '�㶫ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (20, '450000', '����׳��������');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (21, '460000', '����ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (22, '500000', '����');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (23, '510000', '�Ĵ�ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (24, '520000', '����ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (25, '530000', '����ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (26, '540000', '����������');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (27, '610000', '����ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (28, '620000', '����ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (29, '630000', '�ຣʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (30, '640000', '���Ļ���������');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (31, '650000', '�½�ά���������');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (32, '710000', '̨��ʡ');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (33, '810000', '����ر�������');
insert into MY12306_2_PROVINCE (id, provinceid, province)
values (34, '820000', '�����ر�������');
commit;
prompt 34 records loaded
prompt Loading MY12306_2_USERTYPE...
insert into MY12306_2_USERTYPE (id, content)
values (1, '����');
insert into MY12306_2_USERTYPE (id, content)
values (2, '��ͯ');
insert into MY12306_2_USERTYPE (id, content)
values (3, 'ѧ��');
insert into MY12306_2_USERTYPE (id, content)
values (4, '�м����ˡ��˲����񾯲�');
commit;
prompt 4 records loaded
prompt Loading MY12306_2_USER...
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (51, 'b1', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b1', '1', 200, 1, '440104201910106119', to_date('16-09-2019 16:37:05', 'dd-mm-yyyy hh24:mi:ss'), 1, 'b1', '1', '0:0:0:0:0:0:0:1', 'bg_img1.jpg');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (52, 'b2', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b2', '1', 200, 1, '440104201910106119', to_date('16-09-2019 16:37:27', 'dd-mm-yyyy hh24:mi:ss'), 1, 'b2', '1', '0:0:0:0:0:0:0:1', 'bg_img1.jpg');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (53, 'b3', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b3', '1', 200, 1, '440104201910106119', to_date('16-09-2019 16:37:43', 'dd-mm-yyyy hh24:mi:ss'), 1, 'b3', '1', '0:0:0:0:0:0:0:1', 'bg_img1.jpg');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (54, 'b4', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b4', '1', 200, 1, '440104201910106119', to_date('16-09-2019 16:37:57', 'dd-mm-yyyy hh24:mi:ss'), 1, 'b4', '1', '0:0:0:0:0:0:0:1', 'bg_img1.jpg');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (55, 'b5', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b5', '1', 200, 1, '440104201910106119', to_date('16-09-2019 16:38:12', 'dd-mm-yyyy hh24:mi:ss'), 1, 'b5', '1', '0:0:0:0:0:0:0:1', 'bg_img1.jpg');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (56, 'b6', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b6', '1', 200, 1, '440104201910106119', to_date('16-09-2019 16:38:27', 'dd-mm-yyyy hh24:mi:ss'), 1, 'b6', '1', '0:0:0:0:0:0:0:1', 'bg_img1.jpg');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (57, 'b7', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b7', '1', 200, 1, '440104201910106119', to_date('16-09-2019 16:38:41', 'dd-mm-yyyy hh24:mi:ss'), 1, 'b7', '1', '0:0:0:0:0:0:0:1', 'bg_img1.jpg');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (58, 'b8', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b8', '1', 200, 1, '440104201910106119', to_date('16-09-2019 16:38:57', 'dd-mm-yyyy hh24:mi:ss'), 1, 'b8', '1', '0:0:0:0:0:0:0:1', 'bg_img1.jpg');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (59, 'b9', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b9', '1', 200, 1, '440104201910106119', to_date('16-09-2019 16:39:12', 'dd-mm-yyyy hh24:mi:ss'), 1, 'b9', '1', '0:0:0:0:0:0:0:1', 'bg_img1.jpg');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (60, 'b10', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b10', '1', 200, 1, '440104201910106119', to_date('16-09-2019 16:40:19', 'dd-mm-yyyy hh24:mi:ss'), 1, 'b10', '1', '0:0:0:0:0:0:0:1', 'bg_img1.jpg');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (61, 'b11', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b11', '1', 200, 1, '440104201910106119', to_date('16-09-2019 16:40:31', 'dd-mm-yyyy hh24:mi:ss'), 1, 'b11', '1', '0:0:0:0:0:0:0:1', 'bg_img1.jpg');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (62, 'b12', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b12', '1', 200, 1, '440104201910106119', to_date('16-09-2019 16:40:44', 'dd-mm-yyyy hh24:mi:ss'), 1, 'b12', '1', '0:0:0:0:0:0:0:1', 'bg_img1.jpg');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (63, 'b13', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b13', '1', 200, 1, '440104201910106119', to_date('16-09-2019 16:40:56', 'dd-mm-yyyy hh24:mi:ss'), 1, 'b13', '1', '0:0:0:0:0:0:0:1', 'bg_img1.jpg');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (64, 'b14', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b14', '1', 200, 1, '440104201910106119', to_date('16-09-2019 16:41:08', 'dd-mm-yyyy hh24:mi:ss'), 1, 'b14', '1', '0:0:0:0:0:0:0:1', 'bg_img1.jpg');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (67, 'b17', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b17', '1', 138, 1, '52454354353454', to_date('26-08-2019', 'dd-mm-yyyy'), 1, 'b17', '1', '0:0:0:0:0:0:0:1', null);
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (41, 'a_aaa', 'e10adc3949ba59abbe56e057f20f883e', '1', 'a_aaa', '1', 176, 2, '134324354545454', to_date('03-09-2019', 'dd-mm-yyyy'), 4, 'aaaaa', '1', '0:0:0:0:0:0:0:1', null);
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (44, 'a_ddd', 'e10adc3949ba59abbe56e057f20f883e', '1', 'a_ddd', '2', 130, 4, '52454354353454', to_date('26-08-2019', 'dd-mm-yyyy'), 3, 'addd', '1', '0:0:0:0:0:0:0:1', null);
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (82, 'aaa', 'e10adc3949ba59abbe56e057f20f883e', '2', '����', '1', 27, 1, '440104201910106119', to_date('10-09-2019', 'dd-mm-yyyy'), 1, '��עa', '1', '0:0:0:0:0:0:0:1', 'bg_img1.jpg');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (9, 'ccc', 'e10adc3949ba59abbe56e057f20f883e', '2', 'ccc', '1', 198, 3, '123456789', to_date('02-09-2019', 'dd-mm-yyyy'), 3, 'fdsfdsfd', '1', '0:0:0:0:0:0:0:1', null);
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (43, 'a_ccc', 'e10adc3949ba59abbe56e057f20f883e', '1', 'a_ccc', '2', 43, 4, '52454354353454', to_date('26-08-2019', 'dd-mm-yyyy'), 2, 'accc', '1', '0:0:0:0:0:0:0:1', null);
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (45, 'a_eee', 'e10adc3949ba59abbe56e057f20f883e', '2', 'a_eee', '2', 318, 4, '52454354353454', to_date('02-09-2019', 'dd-mm-yyyy'), 3, 'fdfdf', '1', '0:0:0:0:0:0:0:1', null);
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (46, 'a_1', 'e10adc3949ba59abbe56e057f20f883e', '1', 'a_1', '2', 237, 4, '52454354353454', to_date('03-09-2019', 'dd-mm-yyyy'), 3, 'a1', '1', '0:0:0:0:0:0:0:1', null);
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (47, 'b_1', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b_1', '2', 247, 4, '52454354353454', to_date('26-08-2019', 'dd-mm-yyyy'), 3, 'b1', '1', '0:0:0:0:0:0:0:1', null);
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (48, 'bbb2', 'e10adc3949ba59abbe56e057f20f883e', '2', 'bbb2', '2', 235, 2, '52454354353454', to_date('03-09-2019', 'dd-mm-yyyy'), 3, 'fdfd', '1', '0:0:0:0:0:0:0:1', null);
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (49, 'a_2', 'e10adc3949ba59abbe56e057f20f883e', '2', 'a_2', '2', 236, 4, '52454354353454', to_date('26-08-2019', 'dd-mm-yyyy'), 2, 'a2', '1', '0:0:0:0:0:0:0:1', null);
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (66, 'b16', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b16', '1', 114, 1, '52454354353454', to_date('26-08-2019', 'dd-mm-yyyy'), 1, 'b16', '1', '0:0:0:0:0:0:0:1', null);
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (10, 'ddd', 'e10adc3949ba59abbe56e057f20f883e', '2', 'ddd', '2', 82, 3, '1234567890', to_date('04-09-2019', 'dd-mm-yyyy'), 4, 'dgfgfdgfg', '1', '0:0:0:0:0:0:0:1', null);
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (23, 'bbb', 'e10adc3949ba59abbe56e057f20f883e', '1', 'bbb', '2', 200, 1, '123456789', to_date('11-09-2019 17:05:23', 'dd-mm-yyyy hh24:mi:ss'), 1, 'bbb', '1', '0:0:0:0:0:0:0:1', '7.png');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (24, 'eee', 'e10adc3949ba59abbe56e057f20f883e', '1', 'eee', '1', 200, 1, '440104201910106119', to_date('11-09-2019 17:24:21', 'dd-mm-yyyy hh24:mi:ss'), 4, 'eee', '1', '0:0:0:0:0:0:0:1', 'bg_img1.jpg');
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (50, 'b_2', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b_2', '2', 233, 2, '52454354353454', to_date('27-08-2019', 'dd-mm-yyyy'), 2, 'b2', '1', '0:0:0:0:0:0:0:1', null);
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (42, 'a_bbb', 'e10adc3949ba59abbe56e057f20f883e', '1', 'a_bbb', '1', 29, 1, '52454354353454', to_date('29-08-2019', 'dd-mm-yyyy'), 3, 'abbbb', '1', '0:0:0:0:0:0:0:1', null);
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (65, 'b15', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b15', '2', 237, 1, '52454354353454', to_date('27-08-2019', 'dd-mm-yyyy'), 1, 'b15', '1', '0:0:0:0:0:0:0:1', null);
insert into MY12306_2_USER (id, username, password, rule, realname, sex, city, cert_type, cert, birthday, user_type, content, status, login_ip, image_path)
values (68, 'b18', 'e10adc3949ba59abbe56e057f20f883e', '2', 'b18', '1', 221, 1, '52454354353454', to_date('26-08-2019', 'dd-mm-yyyy'), 1, 'b18', '1', '0:0:0:0:0:0:0:1', null);
commit;
prompt 33 records loaded
prompt Enabling foreign key constraints for MY12306_2_USER...
alter table MY12306_2_USER enable constraint MY12306_2_USER_CERTTYPE_FK;
alter table MY12306_2_USER enable constraint MY12306_2_USER_CITY_FK;
alter table MY12306_2_USER enable constraint MY12306_2_USER_USERTYPE_FK;
prompt Enabling triggers for MY12306_2_CERTTYPE...
alter table MY12306_2_CERTTYPE enable all triggers;
prompt Enabling triggers for MY12306_2_CITY...
alter table MY12306_2_CITY enable all triggers;
prompt Enabling triggers for MY12306_2_PROVINCE...
alter table MY12306_2_PROVINCE enable all triggers;
prompt Enabling triggers for MY12306_2_USERTYPE...
alter table MY12306_2_USERTYPE enable all triggers;
prompt Enabling triggers for MY12306_2_USER...
alter table MY12306_2_USER enable all triggers;

set feedback on
set define on
prompt Done
