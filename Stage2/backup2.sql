prompt PL/SQL Developer Export Tables for user C##MOSHE@XE
prompt Created by USER on Monday, June 17, 2024
set feedback off
set define off

prompt Creating ASSIGNMENTS...
create table ASSIGNMENTS
(
  a_id       INTEGER not null,
  e_id       INTEGER not null,
  start_date DATE not null,
  end_date   DATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSIGNMENTS
  add primary key (A_ID)
  using index 
  tablespace SYSTEM
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
alter table ASSIGNMENTS
  add constraint CHK_DATE
  check (End_date > Start_date);

prompt Creating OPERATIONS_...
create table OPERATIONS_
(
  o_id       INTEGER not null,
  o_name     VARCHAR2(50) not null,
  start_date DATE not null,
  end_date   DATE not null,
  objective  VARCHAR2(200) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table OPERATIONS_
  add primary key (O_ID)
  using index 
  tablespace SYSTEM
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

prompt Creating ASSIGNED_OPERATION...
create table ASSIGNED_OPERATION
(
  a_id INTEGER not null,
  o_id INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSIGNED_OPERATION
  add primary key (A_ID, O_ID)
  using index 
  tablespace SYSTEM
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
alter table ASSIGNED_OPERATION
  add foreign key (A_ID)
  references ASSIGNMENTS (A_ID);
alter table ASSIGNED_OPERATION
  add foreign key (O_ID)
  references OPERATIONS_ (O_ID);

prompt Creating ROLE_...
create table ROLE_
(
  r_id         INTEGER not null,
  r_name       VARCHAR2(50) not null,
  description_ VARCHAR2(200) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLE_
  add primary key (R_ID)
  using index 
  tablespace SYSTEM
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

prompt Creating PERSONNEL...
create table PERSONNEL
(
  p_id   INTEGER not null,
  r_id   INTEGER not null,
  p_name VARCHAR2(50) not null,
  rank_  VARCHAR2(50) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PERSONNEL
  add primary key (P_ID)
  using index 
  tablespace SYSTEM
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
alter table PERSONNEL
  add foreign key (R_ID)
  references ROLE_ (R_ID);
alter table PERSONNEL
  add constraint CHK_RANK
  check (Rank_ IN ('Turai', 'Sgan Aluf', 'Samal Rishon', 'Aluf Mishne', 'Samal', 'Tat Aluf', 'Rasan', 'Segen Mishne', 'Aluf', 'Segen', 'Rabat', 'Seren', 'Rav Seren'));

prompt Creating ASSIGNED_PERSONNEL...
create table ASSIGNED_PERSONNEL
(
  a_id INTEGER not null,
  p_id INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ASSIGNED_PERSONNEL
  add primary key (A_ID, P_ID)
  using index 
  tablespace SYSTEM
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
alter table ASSIGNED_PERSONNEL
  add foreign key (A_ID)
  references ASSIGNMENTS (A_ID);
alter table ASSIGNED_PERSONNEL
  add foreign key (P_ID)
  references PERSONNEL (P_ID);

prompt Creating EQUIPMENT...
create table EQUIPMENT
(
  e_id   INTEGER not null,
  type_  VARCHAR2(50) not null,
  status VARCHAR2(20) default 'Available' not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EQUIPMENT
  add primary key (E_ID)
  using index 
  tablespace SYSTEM
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

prompt Creating INTELLIGENCE_REPORTS...
create table INTELLIGENCE_REPORTS
(
  i_id           INTEGER not null,
  o_id           INTEGER not null,
  submitted_by   VARCHAR2(50) not null,
  date_submitted DATE not null,
  content_       VARCHAR2(1000) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INTELLIGENCE_REPORTS
  add primary key (I_ID)
  using index 
  tablespace SYSTEM
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
alter table INTELLIGENCE_REPORTS
  add foreign key (O_ID)
  references OPERATIONS_ (O_ID);

prompt Creating SUBMITS...
create table SUBMITS
(
  p_id INTEGER not null,
  i_id INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SUBMITS
  add primary key (P_ID, I_ID)
  using index 
  tablespace SYSTEM
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
alter table SUBMITS
  add foreign key (P_ID)
  references PERSONNEL (P_ID);
alter table SUBMITS
  add foreign key (I_ID)
  references INTELLIGENCE_REPORTS (I_ID);

prompt Disabling triggers for ASSIGNMENTS...
alter table ASSIGNMENTS disable all triggers;
prompt Disabling triggers for OPERATIONS_...
alter table OPERATIONS_ disable all triggers;
prompt Disabling triggers for ASSIGNED_OPERATION...
alter table ASSIGNED_OPERATION disable all triggers;
prompt Disabling triggers for ROLE_...
alter table ROLE_ disable all triggers;
prompt Disabling triggers for PERSONNEL...
alter table PERSONNEL disable all triggers;
prompt Disabling triggers for ASSIGNED_PERSONNEL...
alter table ASSIGNED_PERSONNEL disable all triggers;
prompt Disabling triggers for EQUIPMENT...
alter table EQUIPMENT disable all triggers;
prompt Disabling triggers for INTELLIGENCE_REPORTS...
alter table INTELLIGENCE_REPORTS disable all triggers;
prompt Disabling triggers for SUBMITS...
alter table SUBMITS disable all triggers;
prompt Disabling foreign key constraints for ASSIGNED_OPERATION...
alter table ASSIGNED_OPERATION disable constraint SYS_C008540;
alter table ASSIGNED_OPERATION disable constraint SYS_C008541;
prompt Disabling foreign key constraints for PERSONNEL...
alter table PERSONNEL disable constraint SYS_C008551;
prompt Disabling foreign key constraints for ASSIGNED_PERSONNEL...
alter table ASSIGNED_PERSONNEL disable constraint SYS_C008555;
alter table ASSIGNED_PERSONNEL disable constraint SYS_C008556;
prompt Disabling foreign key constraints for INTELLIGENCE_REPORTS...
alter table INTELLIGENCE_REPORTS disable constraint SYS_C008567;
prompt Disabling foreign key constraints for SUBMITS...
alter table SUBMITS disable constraint SYS_C008571;
alter table SUBMITS disable constraint SYS_C008572;
prompt Deleting SUBMITS...
delete from SUBMITS;
commit;
prompt Deleting INTELLIGENCE_REPORTS...
delete from INTELLIGENCE_REPORTS;
commit;
prompt Deleting EQUIPMENT...
delete from EQUIPMENT;
commit;
prompt Deleting ASSIGNED_PERSONNEL...
delete from ASSIGNED_PERSONNEL;
commit;
prompt Deleting PERSONNEL...
delete from PERSONNEL;
commit;
prompt Deleting ROLE_...
delete from ROLE_;
commit;
prompt Deleting ASSIGNED_OPERATION...
delete from ASSIGNED_OPERATION;
commit;
prompt Deleting OPERATIONS_...
delete from OPERATIONS_;
commit;
prompt Deleting ASSIGNMENTS...
delete from ASSIGNMENTS;
commit;
prompt Loading ASSIGNMENTS...
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (325, 14800, to_date('10-01-1964', 'dd-mm-yyyy'), to_date('17-12-2017', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (327, 18528, to_date('14-06-1956', 'dd-mm-yyyy'), to_date('09-09-1984', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (329, 79028, to_date('25-09-1968', 'dd-mm-yyyy'), to_date('09-04-1988', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (331, 47754, to_date('12-08-1975', 'dd-mm-yyyy'), to_date('20-07-2020', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (333, 12590, to_date('16-11-1961', 'dd-mm-yyyy'), to_date('13-02-2002', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (335, 23982, to_date('28-05-1963', 'dd-mm-yyyy'), to_date('07-05-1998', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (337, 7422, to_date('10-03-1980', 'dd-mm-yyyy'), to_date('06-11-2014', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (339, 25910, to_date('31-05-1955', 'dd-mm-yyyy'), to_date('22-02-1996', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (341, 97817, to_date('02-10-1955', 'dd-mm-yyyy'), to_date('14-11-1980', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (343, 37069, to_date('05-11-1954', 'dd-mm-yyyy'), to_date('26-03-1984', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (345, 51715, to_date('12-09-1950', 'dd-mm-yyyy'), to_date('03-09-2016', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (347, 55035, to_date('07-04-1951', 'dd-mm-yyyy'), to_date('29-04-2022', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (349, 42376, to_date('04-04-1963', 'dd-mm-yyyy'), to_date('22-03-2004', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (351, 78962, to_date('08-07-1950', 'dd-mm-yyyy'), to_date('02-01-2009', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (353, 99558, to_date('31-12-1969', 'dd-mm-yyyy'), to_date('15-09-1988', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (355, 35197, to_date('21-04-1961', 'dd-mm-yyyy'), to_date('22-02-1989', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (357, 18709, to_date('29-10-1970', 'dd-mm-yyyy'), to_date('20-07-2023', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (359, 85684, to_date('18-01-1977', 'dd-mm-yyyy'), to_date('08-05-1981', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (361, 3971, to_date('16-05-1972', 'dd-mm-yyyy'), to_date('17-06-1983', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (363, 18600, to_date('08-08-1971', 'dd-mm-yyyy'), to_date('24-06-1997', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (365, 69541, to_date('01-09-1964', 'dd-mm-yyyy'), to_date('01-08-1980', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (367, 46991, to_date('20-12-1963', 'dd-mm-yyyy'), to_date('17-03-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (369, 54809, to_date('19-07-1968', 'dd-mm-yyyy'), to_date('13-07-2019', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (371, 35197, to_date('07-09-1974', 'dd-mm-yyyy'), to_date('16-07-2021', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (373, 19596, to_date('26-12-1967', 'dd-mm-yyyy'), to_date('28-07-1983', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (375, 19072, to_date('06-08-1972', 'dd-mm-yyyy'), to_date('05-10-1983', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (377, 4276, to_date('15-08-1969', 'dd-mm-yyyy'), to_date('11-11-1984', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (379, 57154, to_date('14-09-1953', 'dd-mm-yyyy'), to_date('23-04-1995', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (381, 88658, to_date('25-12-1953', 'dd-mm-yyyy'), to_date('12-06-1981', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (383, 18797, to_date('18-05-1953', 'dd-mm-yyyy'), to_date('03-03-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (385, 97247, to_date('07-07-1972', 'dd-mm-yyyy'), to_date('08-01-2007', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (387, 14123, to_date('03-10-1959', 'dd-mm-yyyy'), to_date('27-05-2011', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (389, 75664, to_date('27-02-1960', 'dd-mm-yyyy'), to_date('21-10-1985', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (391, 16362, to_date('26-01-1963', 'dd-mm-yyyy'), to_date('18-03-2024', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (393, 10629, to_date('22-06-1968', 'dd-mm-yyyy'), to_date('24-10-2013', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (395, 60631, to_date('12-11-1969', 'dd-mm-yyyy'), to_date('12-12-2023', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (397, 90113, to_date('11-05-1969', 'dd-mm-yyyy'), to_date('01-07-2009', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (399, 90871, to_date('21-05-1957', 'dd-mm-yyyy'), to_date('18-10-2022', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (401, 15642, to_date('02-02-1976', 'dd-mm-yyyy'), to_date('25-07-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (403, 18984, to_date('19-02-1957', 'dd-mm-yyyy'), to_date('12-01-1998', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (405, 50120, to_date('22-02-1963', 'dd-mm-yyyy'), to_date('28-08-2001', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (407, 92226, to_date('09-07-1978', 'dd-mm-yyyy'), to_date('30-06-1987', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (409, 231, to_date('01-05-1980', 'dd-mm-yyyy'), to_date('07-05-1987', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (411, 61029, to_date('13-07-1972', 'dd-mm-yyyy'), to_date('22-04-2007', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (413, 86171, to_date('29-11-1952', 'dd-mm-yyyy'), to_date('22-12-1981', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (415, 39109, to_date('27-01-1965', 'dd-mm-yyyy'), to_date('29-01-1995', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (417, 52492, to_date('01-03-1955', 'dd-mm-yyyy'), to_date('06-07-1996', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (419, 19950, to_date('31-10-1949', 'dd-mm-yyyy'), to_date('05-04-2012', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (421, 69168, to_date('24-04-1962', 'dd-mm-yyyy'), to_date('14-01-2016', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (423, 75608, to_date('30-11-1955', 'dd-mm-yyyy'), to_date('13-03-2012', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (425, 40469, to_date('18-02-1963', 'dd-mm-yyyy'), to_date('11-10-2007', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (427, 7780, to_date('28-03-1977', 'dd-mm-yyyy'), to_date('14-10-1986', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (429, 8633, to_date('07-06-1974', 'dd-mm-yyyy'), to_date('07-07-1992', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (431, 67349, to_date('29-05-1963', 'dd-mm-yyyy'), to_date('15-03-1989', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (433, 78865, to_date('13-07-1949', 'dd-mm-yyyy'), to_date('28-03-1987', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (435, 51459, to_date('22-02-1963', 'dd-mm-yyyy'), to_date('15-07-2015', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (437, 44302, to_date('13-04-1961', 'dd-mm-yyyy'), to_date('30-01-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (439, 46835, to_date('01-08-1951', 'dd-mm-yyyy'), to_date('19-03-2015', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (441, 55165, to_date('23-07-1976', 'dd-mm-yyyy'), to_date('06-08-2021', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (443, 2651, to_date('19-07-1967', 'dd-mm-yyyy'), to_date('14-09-1995', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (445, 76972, to_date('16-01-1961', 'dd-mm-yyyy'), to_date('04-10-1992', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (447, 19076, to_date('05-09-1978', 'dd-mm-yyyy'), to_date('16-06-2019', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (449, 78865, to_date('21-01-1955', 'dd-mm-yyyy'), to_date('28-11-1999', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (451, 31565, to_date('16-08-1950', 'dd-mm-yyyy'), to_date('21-09-1995', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (453, 1553, to_date('12-08-1952', 'dd-mm-yyyy'), to_date('23-08-2023', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (455, 64823, to_date('20-08-1963', 'dd-mm-yyyy'), to_date('30-12-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (457, 73352, to_date('21-03-1955', 'dd-mm-yyyy'), to_date('28-02-2020', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (459, 49445, to_date('21-12-1969', 'dd-mm-yyyy'), to_date('01-07-2002', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (461, 47202, to_date('28-11-1956', 'dd-mm-yyyy'), to_date('11-09-1993', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (463, 90989, to_date('09-12-1951', 'dd-mm-yyyy'), to_date('04-11-2011', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (465, 26414, to_date('18-11-1977', 'dd-mm-yyyy'), to_date('11-01-1991', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (467, 3106, to_date('29-12-1977', 'dd-mm-yyyy'), to_date('11-09-1999', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (469, 40686, to_date('28-06-1970', 'dd-mm-yyyy'), to_date('03-07-1989', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (471, 70468, to_date('02-06-1972', 'dd-mm-yyyy'), to_date('28-07-1993', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (473, 55514, to_date('28-10-1963', 'dd-mm-yyyy'), to_date('29-01-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (475, 39109, to_date('10-12-1978', 'dd-mm-yyyy'), to_date('04-09-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (477, 97765, to_date('29-11-1952', 'dd-mm-yyyy'), to_date('08-10-1994', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (479, 28445, to_date('06-06-1960', 'dd-mm-yyyy'), to_date('22-06-2006', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (481, 18797, to_date('05-08-1962', 'dd-mm-yyyy'), to_date('28-09-2002', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (483, 14903, to_date('10-02-1969', 'dd-mm-yyyy'), to_date('21-08-2014', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (485, 24859, to_date('31-05-1969', 'dd-mm-yyyy'), to_date('13-05-1999', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (487, 35637, to_date('11-12-1974', 'dd-mm-yyyy'), to_date('19-04-1997', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (489, 28430, to_date('21-05-1974', 'dd-mm-yyyy'), to_date('25-05-2009', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (491, 18928, to_date('18-09-1955', 'dd-mm-yyyy'), to_date('03-07-2007', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (493, 51798, to_date('04-05-1958', 'dd-mm-yyyy'), to_date('27-09-1992', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (495, 17286, to_date('15-01-1953', 'dd-mm-yyyy'), to_date('13-09-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (497, 1553, to_date('05-06-1978', 'dd-mm-yyyy'), to_date('05-11-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (499, 95695, to_date('17-11-1973', 'dd-mm-yyyy'), to_date('18-02-2006', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (501, 96577, to_date('18-11-1976', 'dd-mm-yyyy'), to_date('21-07-1989', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (503, 57780, to_date('27-04-1949', 'dd-mm-yyyy'), to_date('15-05-1984', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (505, 78574, to_date('29-05-1965', 'dd-mm-yyyy'), to_date('02-07-2005', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (507, 92267, to_date('29-04-1965', 'dd-mm-yyyy'), to_date('12-06-1981', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (509, 37069, to_date('30-07-1962', 'dd-mm-yyyy'), to_date('06-04-1982', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (511, 30314, to_date('20-09-1959', 'dd-mm-yyyy'), to_date('31-12-1986', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (513, 40043, to_date('13-06-1959', 'dd-mm-yyyy'), to_date('09-08-2018', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (515, 79524, to_date('12-03-1966', 'dd-mm-yyyy'), to_date('19-12-1980', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (517, 9562, to_date('04-02-1976', 'dd-mm-yyyy'), to_date('12-07-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (519, 47109, to_date('16-03-1973', 'dd-mm-yyyy'), to_date('26-01-1999', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (521, 55151, to_date('25-01-1959', 'dd-mm-yyyy'), to_date('15-10-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (523, 50293, to_date('11-07-1971', 'dd-mm-yyyy'), to_date('20-05-2008', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (525, 76805, to_date('19-10-1978', 'dd-mm-yyyy'), to_date('05-04-1992', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (527, 44543, to_date('06-12-1974', 'dd-mm-yyyy'), to_date('05-08-2019', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (529, 18213, to_date('26-09-1958', 'dd-mm-yyyy'), to_date('11-04-2024', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (531, 2651, to_date('22-11-1971', 'dd-mm-yyyy'), to_date('16-09-1986', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (533, 16362, to_date('12-08-1966', 'dd-mm-yyyy'), to_date('28-01-2016', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (535, 30755, to_date('26-03-1952', 'dd-mm-yyyy'), to_date('16-10-2016', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (537, 73379, to_date('25-05-1964', 'dd-mm-yyyy'), to_date('28-01-1992', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (539, 54109, to_date('16-09-1961', 'dd-mm-yyyy'), to_date('14-07-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (541, 28805, to_date('21-08-1977', 'dd-mm-yyyy'), to_date('05-01-1982', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (543, 64823, to_date('01-02-1963', 'dd-mm-yyyy'), to_date('08-11-1999', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (545, 13752, to_date('30-07-1956', 'dd-mm-yyyy'), to_date('28-05-1998', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (547, 10468, to_date('02-09-1950', 'dd-mm-yyyy'), to_date('10-01-2004', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (549, 65397, to_date('27-01-1979', 'dd-mm-yyyy'), to_date('22-04-1988', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (551, 3106, to_date('12-06-1950', 'dd-mm-yyyy'), to_date('12-10-2015', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (553, 66516, to_date('26-06-1954', 'dd-mm-yyyy'), to_date('05-10-2001', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (555, 78842, to_date('13-11-1953', 'dd-mm-yyyy'), to_date('25-02-2024', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (557, 55151, to_date('24-11-1966', 'dd-mm-yyyy'), to_date('07-01-1993', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (559, 34672, to_date('26-12-1953', 'dd-mm-yyyy'), to_date('29-05-2018', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (561, 81635, to_date('28-08-1958', 'dd-mm-yyyy'), to_date('07-11-1998', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (563, 10974, to_date('15-01-1976', 'dd-mm-yyyy'), to_date('03-10-1995', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (565, 32382, to_date('10-11-1979', 'dd-mm-yyyy'), to_date('17-05-2006', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (567, 50900, to_date('02-10-1970', 'dd-mm-yyyy'), to_date('27-08-2007', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (569, 71426, to_date('24-08-1973', 'dd-mm-yyyy'), to_date('02-10-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (571, 57780, to_date('05-07-1949', 'dd-mm-yyyy'), to_date('28-12-2007', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (573, 76510, to_date('21-03-1961', 'dd-mm-yyyy'), to_date('01-08-1984', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (575, 61029, to_date('29-03-1972', 'dd-mm-yyyy'), to_date('19-01-2012', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (577, 37873, to_date('24-03-1968', 'dd-mm-yyyy'), to_date('07-08-2003', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (579, 7670, to_date('01-04-1977', 'dd-mm-yyyy'), to_date('23-09-1980', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (581, 87827, to_date('18-10-1953', 'dd-mm-yyyy'), to_date('16-12-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (583, 18052, to_date('05-05-1953', 'dd-mm-yyyy'), to_date('28-08-1982', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (585, 88102, to_date('19-08-1958', 'dd-mm-yyyy'), to_date('10-02-1987', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (587, 49445, to_date('11-08-1960', 'dd-mm-yyyy'), to_date('23-06-1984', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (589, 49445, to_date('12-10-1969', 'dd-mm-yyyy'), to_date('07-03-2013', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (591, 70471, to_date('25-09-1960', 'dd-mm-yyyy'), to_date('09-05-1985', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (593, 48717, to_date('27-04-1960', 'dd-mm-yyyy'), to_date('11-04-1997', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (595, 32692, to_date('25-03-1971', 'dd-mm-yyyy'), to_date('04-05-2000', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (597, 30314, to_date('01-11-1972', 'dd-mm-yyyy'), to_date('23-06-1980', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (599, 78616, to_date('21-02-1960', 'dd-mm-yyyy'), to_date('30-08-1989', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (601, 52113, to_date('17-10-1977', 'dd-mm-yyyy'), to_date('25-06-1980', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (603, 50293, to_date('20-07-1950', 'dd-mm-yyyy'), to_date('01-09-1985', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (605, 47298, to_date('23-12-1969', 'dd-mm-yyyy'), to_date('22-07-2007', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (607, 86775, to_date('14-01-1954', 'dd-mm-yyyy'), to_date('23-01-2015', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (609, 98095, to_date('30-11-1953', 'dd-mm-yyyy'), to_date('16-06-1983', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (611, 87175, to_date('15-07-1952', 'dd-mm-yyyy'), to_date('10-11-2021', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (613, 7670, to_date('28-09-1962', 'dd-mm-yyyy'), to_date('30-01-2023', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (615, 84633, to_date('26-03-1969', 'dd-mm-yyyy'), to_date('11-12-1998', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (617, 52113, to_date('15-04-1960', 'dd-mm-yyyy'), to_date('03-04-1996', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (619, 49089, to_date('13-01-1977', 'dd-mm-yyyy'), to_date('13-12-2023', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (621, 8919, to_date('13-02-1963', 'dd-mm-yyyy'), to_date('25-07-2019', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (623, 43654, to_date('11-11-1957', 'dd-mm-yyyy'), to_date('21-03-1993', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (625, 50736, to_date('20-02-1958', 'dd-mm-yyyy'), to_date('10-09-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (627, 12024, to_date('12-04-1953', 'dd-mm-yyyy'), to_date('06-07-1998', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (629, 30371, to_date('14-10-1967', 'dd-mm-yyyy'), to_date('14-05-2016', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (631, 53201, to_date('23-04-1951', 'dd-mm-yyyy'), to_date('31-08-1987', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (633, 46757, to_date('04-04-1971', 'dd-mm-yyyy'), to_date('19-06-2007', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (635, 56866, to_date('22-01-1961', 'dd-mm-yyyy'), to_date('19-06-1999', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (637, 83867, to_date('08-02-1952', 'dd-mm-yyyy'), to_date('15-10-1982', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (639, 53978, to_date('29-06-1950', 'dd-mm-yyyy'), to_date('20-01-1989', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (641, 86775, to_date('11-06-1952', 'dd-mm-yyyy'), to_date('21-04-1992', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (643, 8900, to_date('22-01-1953', 'dd-mm-yyyy'), to_date('18-04-1998', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (645, 91349, to_date('03-06-1953', 'dd-mm-yyyy'), to_date('12-11-2022', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (1, 49445, to_date('02-09-1968', 'dd-mm-yyyy'), to_date('30-10-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (3, 12256, to_date('10-10-1964', 'dd-mm-yyyy'), to_date('03-04-2000', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (5, 99558, to_date('05-10-1964', 'dd-mm-yyyy'), to_date('04-04-2022', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (7, 91983, to_date('17-07-1976', 'dd-mm-yyyy'), to_date('20-03-2002', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (9, 19841, to_date('15-05-1980', 'dd-mm-yyyy'), to_date('01-09-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (11, 87827, to_date('13-07-1965', 'dd-mm-yyyy'), to_date('28-09-2008', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (13, 33004, to_date('23-05-1953', 'dd-mm-yyyy'), to_date('05-12-2017', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (15, 99558, to_date('12-07-1969', 'dd-mm-yyyy'), to_date('22-02-2018', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (17, 18600, to_date('25-03-1967', 'dd-mm-yyyy'), to_date('22-02-2016', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (19, 46991, to_date('03-04-1950', 'dd-mm-yyyy'), to_date('11-03-1986', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (21, 3106, to_date('22-03-1960', 'dd-mm-yyyy'), to_date('17-02-2019', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (23, 20341, to_date('26-12-1959', 'dd-mm-yyyy'), to_date('08-12-1985', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (25, 63110, to_date('23-04-1980', 'dd-mm-yyyy'), to_date('09-06-2019', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (27, 18052, to_date('24-07-1968', 'dd-mm-yyyy'), to_date('10-10-1999', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (29, 6724, to_date('16-07-1973', 'dd-mm-yyyy'), to_date('22-05-1988', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (31, 85684, to_date('29-05-1957', 'dd-mm-yyyy'), to_date('03-07-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (33, 4415, to_date('19-11-1958', 'dd-mm-yyyy'), to_date('17-02-1986', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (35, 57780, to_date('28-06-1955', 'dd-mm-yyyy'), to_date('03-05-2021', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (37, 61604, to_date('04-05-1971', 'dd-mm-yyyy'), to_date('20-03-1999', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (39, 96615, to_date('26-05-1965', 'dd-mm-yyyy'), to_date('22-10-2016', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (41, 97247, to_date('08-07-1968', 'dd-mm-yyyy'), to_date('28-06-2006', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (43, 58889, to_date('01-08-1951', 'dd-mm-yyyy'), to_date('24-11-2007', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (45, 32692, to_date('13-01-1955', 'dd-mm-yyyy'), to_date('02-01-1992', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (47, 92267, to_date('29-05-1959', 'dd-mm-yyyy'), to_date('16-02-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (49, 40469, to_date('01-10-1965', 'dd-mm-yyyy'), to_date('01-09-1983', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (51, 20687, to_date('05-03-1965', 'dd-mm-yyyy'), to_date('10-12-1985', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (53, 85675, to_date('06-06-1961', 'dd-mm-yyyy'), to_date('10-08-1996', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (55, 14800, to_date('17-05-1961', 'dd-mm-yyyy'), to_date('22-07-2002', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (57, 55165, to_date('30-09-1962', 'dd-mm-yyyy'), to_date('09-02-2004', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (59, 72106, to_date('17-04-1980', 'dd-mm-yyyy'), to_date('23-02-1993', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (61, 16514, to_date('19-06-1954', 'dd-mm-yyyy'), to_date('28-05-2012', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (63, 13112, to_date('29-10-1950', 'dd-mm-yyyy'), to_date('13-10-1994', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (65, 87583, to_date('11-07-1969', 'dd-mm-yyyy'), to_date('27-06-2014', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (67, 48961, to_date('30-09-1949', 'dd-mm-yyyy'), to_date('02-01-2006', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (69, 61860, to_date('05-04-1954', 'dd-mm-yyyy'), to_date('06-09-2023', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (71, 43654, to_date('18-10-1967', 'dd-mm-yyyy'), to_date('07-04-1997', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (73, 89371, to_date('08-03-1963', 'dd-mm-yyyy'), to_date('27-06-1992', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (75, 97817, to_date('09-11-1972', 'dd-mm-yyyy'), to_date('29-12-1992', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (77, 88318, to_date('09-12-1968', 'dd-mm-yyyy'), to_date('19-02-2023', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (79, 45859, to_date('27-03-1971', 'dd-mm-yyyy'), to_date('08-10-1989', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (81, 76510, to_date('04-09-1949', 'dd-mm-yyyy'), to_date('24-09-2005', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (83, 34830, to_date('02-05-1969', 'dd-mm-yyyy'), to_date('29-10-2023', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (85, 90402, to_date('19-09-1974', 'dd-mm-yyyy'), to_date('21-04-2015', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (87, 94925, to_date('08-04-1952', 'dd-mm-yyyy'), to_date('03-06-2017', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (89, 88658, to_date('15-08-1967', 'dd-mm-yyyy'), to_date('28-02-2004', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (91, 70772, to_date('01-11-1960', 'dd-mm-yyyy'), to_date('15-04-2024', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (93, 20328, to_date('17-10-1973', 'dd-mm-yyyy'), to_date('03-10-1982', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (95, 74605, to_date('23-11-1977', 'dd-mm-yyyy'), to_date('21-04-2004', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (97, 85675, to_date('15-08-1955', 'dd-mm-yyyy'), to_date('25-03-1994', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (99, 6600, to_date('01-09-1967', 'dd-mm-yyyy'), to_date('06-05-2009', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (101, 54996, to_date('04-07-1975', 'dd-mm-yyyy'), to_date('26-10-1984', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (103, 10974, to_date('26-07-1976', 'dd-mm-yyyy'), to_date('22-08-1992', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (105, 31565, to_date('24-08-1956', 'dd-mm-yyyy'), to_date('21-02-2022', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (107, 46835, to_date('17-02-1976', 'dd-mm-yyyy'), to_date('11-12-2009', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (109, 3563, to_date('11-04-1978', 'dd-mm-yyyy'), to_date('12-09-1997', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (111, 38129, to_date('15-03-1949', 'dd-mm-yyyy'), to_date('30-08-2006', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (113, 47285, to_date('02-12-1956', 'dd-mm-yyyy'), to_date('16-07-2020', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (115, 93694, to_date('18-01-1960', 'dd-mm-yyyy'), to_date('13-03-2020', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (117, 56866, to_date('30-10-1973', 'dd-mm-yyyy'), to_date('08-10-1995', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (119, 36574, to_date('27-01-1953', 'dd-mm-yyyy'), to_date('13-03-1983', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (121, 51457, to_date('05-11-1976', 'dd-mm-yyyy'), to_date('10-11-2023', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (123, 49445, to_date('02-12-1979', 'dd-mm-yyyy'), to_date('28-05-1994', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (125, 72106, to_date('21-03-1971', 'dd-mm-yyyy'), to_date('11-11-1992', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (127, 58701, to_date('17-02-1950', 'dd-mm-yyyy'), to_date('18-01-2002', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (129, 50900, to_date('21-06-1951', 'dd-mm-yyyy'), to_date('29-09-1992', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (131, 25838, to_date('06-04-1975', 'dd-mm-yyyy'), to_date('20-07-2022', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (133, 54302, to_date('01-02-1950', 'dd-mm-yyyy'), to_date('17-05-1993', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (135, 32022, to_date('17-03-1971', 'dd-mm-yyyy'), to_date('03-04-2004', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (137, 54326, to_date('21-12-1969', 'dd-mm-yyyy'), to_date('21-10-1994', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (139, 7780, to_date('02-08-1961', 'dd-mm-yyyy'), to_date('26-10-1987', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (141, 78616, to_date('30-09-1948', 'dd-mm-yyyy'), to_date('23-12-1989', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (143, 56759, to_date('27-08-1967', 'dd-mm-yyyy'), to_date('26-03-2001', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (145, 28805, to_date('05-09-1979', 'dd-mm-yyyy'), to_date('26-12-2003', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (147, 48952, to_date('15-07-1975', 'dd-mm-yyyy'), to_date('26-08-2000', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (149, 47581, to_date('17-07-1956', 'dd-mm-yyyy'), to_date('08-10-2023', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (151, 47527, to_date('11-11-1977', 'dd-mm-yyyy'), to_date('30-11-1984', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (153, 78159, to_date('18-02-1956', 'dd-mm-yyyy'), to_date('15-12-1999', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (155, 1553, to_date('05-09-1951', 'dd-mm-yyyy'), to_date('29-12-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (157, 54809, to_date('16-12-1959', 'dd-mm-yyyy'), to_date('06-09-1981', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (159, 62117, to_date('15-03-1964', 'dd-mm-yyyy'), to_date('10-12-1991', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (161, 52559, to_date('28-08-1948', 'dd-mm-yyyy'), to_date('27-09-2003', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (163, 34672, to_date('17-06-1978', 'dd-mm-yyyy'), to_date('04-03-2003', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (165, 47627, to_date('15-01-1956', 'dd-mm-yyyy'), to_date('11-12-2004', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (167, 25838, to_date('10-11-1963', 'dd-mm-yyyy'), to_date('07-12-1993', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (169, 86746, to_date('29-12-1962', 'dd-mm-yyyy'), to_date('09-12-2004', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (171, 43054, to_date('25-10-1948', 'dd-mm-yyyy'), to_date('05-02-1989', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (173, 48717, to_date('06-08-1978', 'dd-mm-yyyy'), to_date('27-05-2017', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (175, 52559, to_date('01-02-1957', 'dd-mm-yyyy'), to_date('22-12-2000', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (177, 9281, to_date('03-06-1970', 'dd-mm-yyyy'), to_date('19-11-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (179, 51798, to_date('06-12-1964', 'dd-mm-yyyy'), to_date('04-04-1994', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (181, 36608, to_date('30-08-1966', 'dd-mm-yyyy'), to_date('12-07-2017', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (183, 7824, to_date('12-05-1952', 'dd-mm-yyyy'), to_date('05-04-1984', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (185, 33793, to_date('14-12-1956', 'dd-mm-yyyy'), to_date('13-12-2018', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (187, 3592, to_date('27-08-1952', 'dd-mm-yyyy'), to_date('05-02-2022', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (189, 45912, to_date('05-10-1952', 'dd-mm-yyyy'), to_date('09-12-2016', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (191, 13799, to_date('10-12-1963', 'dd-mm-yyyy'), to_date('09-02-1983', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (193, 90871, to_date('18-01-1966', 'dd-mm-yyyy'), to_date('18-06-1988', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (195, 99558, to_date('02-02-1957', 'dd-mm-yyyy'), to_date('12-05-1993', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (197, 61029, to_date('09-06-1968', 'dd-mm-yyyy'), to_date('18-03-2015', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (199, 43732, to_date('01-05-1949', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (201, 69779, to_date('03-05-1968', 'dd-mm-yyyy'), to_date('26-05-1987', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (203, 50736, to_date('24-10-1974', 'dd-mm-yyyy'), to_date('13-12-2019', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (205, 78962, to_date('01-08-1968', 'dd-mm-yyyy'), to_date('25-10-2015', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (207, 2885, to_date('27-02-1974', 'dd-mm-yyyy'), to_date('16-09-2020', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (209, 31406, to_date('26-11-1975', 'dd-mm-yyyy'), to_date('30-03-1996', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (211, 58716, to_date('07-04-1978', 'dd-mm-yyyy'), to_date('25-10-2019', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (213, 47298, to_date('10-01-1956', 'dd-mm-yyyy'), to_date('31-12-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (215, 87060, to_date('14-12-1951', 'dd-mm-yyyy'), to_date('19-10-2003', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (217, 49089, to_date('31-07-1962', 'dd-mm-yyyy'), to_date('05-05-2006', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (219, 1222, to_date('21-10-1963', 'dd-mm-yyyy'), to_date('21-07-2022', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (221, 42341, to_date('30-11-1951', 'dd-mm-yyyy'), to_date('23-05-2006', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (223, 41633, to_date('30-04-1978', 'dd-mm-yyyy'), to_date('16-02-1998', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (225, 79524, to_date('16-10-1959', 'dd-mm-yyyy'), to_date('27-12-2004', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (227, 9281, to_date('23-11-1958', 'dd-mm-yyyy'), to_date('18-02-2018', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (229, 75713, to_date('22-05-1977', 'dd-mm-yyyy'), to_date('10-03-1991', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (231, 74972, to_date('30-01-1951', 'dd-mm-yyyy'), to_date('15-11-2002', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (233, 75628, to_date('29-05-1969', 'dd-mm-yyyy'), to_date('22-08-2022', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (235, 52113, to_date('24-12-1963', 'dd-mm-yyyy'), to_date('10-06-2016', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (237, 92267, to_date('05-01-1964', 'dd-mm-yyyy'), to_date('13-09-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (239, 55608, to_date('05-09-1959', 'dd-mm-yyyy'), to_date('31-10-1982', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (241, 42107, to_date('01-03-1951', 'dd-mm-yyyy'), to_date('04-07-1988', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (243, 33934, to_date('24-06-1972', 'dd-mm-yyyy'), to_date('08-02-1984', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (245, 18052, to_date('02-07-1966', 'dd-mm-yyyy'), to_date('31-01-1997', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (247, 37873, to_date('03-09-1959', 'dd-mm-yyyy'), to_date('27-03-2003', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (249, 18528, to_date('18-01-1958', 'dd-mm-yyyy'), to_date('16-11-1987', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (251, 16514, to_date('22-06-1964', 'dd-mm-yyyy'), to_date('26-03-1996', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (253, 26109, to_date('25-03-1971', 'dd-mm-yyyy'), to_date('25-01-1981', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (255, 9562, to_date('04-07-1975', 'dd-mm-yyyy'), to_date('12-04-1993', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (257, 58046, to_date('21-04-1957', 'dd-mm-yyyy'), to_date('09-06-1985', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (259, 62841, to_date('07-07-1969', 'dd-mm-yyyy'), to_date('07-08-1983', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (261, 11010, to_date('07-01-1978', 'dd-mm-yyyy'), to_date('28-06-2022', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (263, 58392, to_date('24-03-1971', 'dd-mm-yyyy'), to_date('06-08-1998', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (265, 65603, to_date('23-05-1970', 'dd-mm-yyyy'), to_date('01-01-1982', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (267, 91735, to_date('15-02-1950', 'dd-mm-yyyy'), to_date('27-10-2006', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (269, 10629, to_date('15-09-1952', 'dd-mm-yyyy'), to_date('14-06-1992', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (271, 82702, to_date('13-08-1976', 'dd-mm-yyyy'), to_date('25-07-1989', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (273, 90871, to_date('08-07-1957', 'dd-mm-yyyy'), to_date('17-10-1998', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (275, 84633, to_date('04-06-1969', 'dd-mm-yyyy'), to_date('21-02-2020', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (277, 3832, to_date('27-12-1959', 'dd-mm-yyyy'), to_date('30-11-1990', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (279, 64823, to_date('20-03-1976', 'dd-mm-yyyy'), to_date('26-08-2019', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (281, 54809, to_date('10-03-1968', 'dd-mm-yyyy'), to_date('13-10-1998', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (283, 17286, to_date('05-06-1962', 'dd-mm-yyyy'), to_date('25-04-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (285, 47285, to_date('19-01-1962', 'dd-mm-yyyy'), to_date('16-07-1982', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (287, 92193, to_date('07-10-1972', 'dd-mm-yyyy'), to_date('14-10-1998', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (289, 60241, to_date('22-04-1967', 'dd-mm-yyyy'), to_date('30-03-1997', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (291, 13885, to_date('02-07-1974', 'dd-mm-yyyy'), to_date('25-03-2015', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (293, 50284, to_date('01-07-1960', 'dd-mm-yyyy'), to_date('26-07-1988', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (295, 52152, to_date('16-07-1972', 'dd-mm-yyyy'), to_date('28-10-1985', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (297, 31030, to_date('02-04-1970', 'dd-mm-yyyy'), to_date('08-12-2008', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (299, 7455, to_date('18-06-1978', 'dd-mm-yyyy'), to_date('30-09-2009', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (301, 42341, to_date('12-01-1951', 'dd-mm-yyyy'), to_date('11-08-2003', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (303, 3563, to_date('06-02-1968', 'dd-mm-yyyy'), to_date('13-03-2023', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (305, 25838, to_date('25-07-1976', 'dd-mm-yyyy'), to_date('28-02-2018', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (307, 34830, to_date('06-11-1957', 'dd-mm-yyyy'), to_date('30-05-1989', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (309, 52152, to_date('31-05-1968', 'dd-mm-yyyy'), to_date('27-01-2005', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (311, 43849, to_date('09-12-1969', 'dd-mm-yyyy'), to_date('13-10-1999', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (313, 45859, to_date('12-08-1967', 'dd-mm-yyyy'), to_date('20-01-1993', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (315, 25009, to_date('01-11-1959', 'dd-mm-yyyy'), to_date('05-07-2013', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (317, 25838, to_date('04-04-1963', 'dd-mm-yyyy'), to_date('18-02-1994', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (319, 7670, to_date('27-07-1954', 'dd-mm-yyyy'), to_date('26-01-1995', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (321, 50284, to_date('11-10-1953', 'dd-mm-yyyy'), to_date('26-05-2020', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (323, 50293, to_date('23-04-1957', 'dd-mm-yyyy'), to_date('07-02-2004', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (647, 38129, to_date('08-02-1972', 'dd-mm-yyyy'), to_date('25-02-1984', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (649, 3118, to_date('05-01-1977', 'dd-mm-yyyy'), to_date('23-06-1992', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (651, 70772, to_date('28-10-1977', 'dd-mm-yyyy'), to_date('29-04-1984', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (653, 56778, to_date('13-02-1969', 'dd-mm-yyyy'), to_date('18-11-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (655, 88592, to_date('21-03-1974', 'dd-mm-yyyy'), to_date('12-08-1997', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (657, 52113, to_date('20-10-1964', 'dd-mm-yyyy'), to_date('05-12-2023', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (659, 22769, to_date('29-11-1958', 'dd-mm-yyyy'), to_date('19-07-2005', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (661, 10567, to_date('25-12-1978', 'dd-mm-yyyy'), to_date('02-04-2005', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (663, 58392, to_date('29-10-1968', 'dd-mm-yyyy'), to_date('21-11-1982', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (665, 25075, to_date('27-03-1964', 'dd-mm-yyyy'), to_date('22-05-2006', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (667, 87060, to_date('05-09-1949', 'dd-mm-yyyy'), to_date('24-07-2003', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (669, 97561, to_date('27-04-1961', 'dd-mm-yyyy'), to_date('03-09-1995', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (671, 49445, to_date('11-10-1964', 'dd-mm-yyyy'), to_date('21-02-1999', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (673, 57154, to_date('23-11-1959', 'dd-mm-yyyy'), to_date('14-10-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (675, 45002, to_date('28-03-1967', 'dd-mm-yyyy'), to_date('09-04-2011', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (677, 19956, to_date('16-05-1972', 'dd-mm-yyyy'), to_date('04-05-1993', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (679, 33793, to_date('10-08-1968', 'dd-mm-yyyy'), to_date('17-04-1994', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (681, 50736, to_date('23-02-1965', 'dd-mm-yyyy'), to_date('12-03-2002', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (683, 44387, to_date('23-01-1957', 'dd-mm-yyyy'), to_date('15-10-2016', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (685, 74978, to_date('08-07-1950', 'dd-mm-yyyy'), to_date('04-01-1981', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (687, 68239, to_date('19-10-1958', 'dd-mm-yyyy'), to_date('21-03-2021', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (689, 72296, to_date('16-04-1953', 'dd-mm-yyyy'), to_date('27-09-2012', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (691, 51798, to_date('02-10-1967', 'dd-mm-yyyy'), to_date('14-03-1996', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (693, 50284, to_date('26-09-1970', 'dd-mm-yyyy'), to_date('17-10-2022', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (695, 19657, to_date('03-12-1948', 'dd-mm-yyyy'), to_date('14-03-2009', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (697, 57154, to_date('18-09-1956', 'dd-mm-yyyy'), to_date('11-09-2017', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (699, 45111, to_date('12-06-1951', 'dd-mm-yyyy'), to_date('09-09-2012', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (701, 19311, to_date('15-11-1954', 'dd-mm-yyyy'), to_date('17-05-1996', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (703, 29835, to_date('22-03-1975', 'dd-mm-yyyy'), to_date('22-08-1983', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (705, 63266, to_date('21-08-1967', 'dd-mm-yyyy'), to_date('01-02-1987', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (707, 69212, to_date('28-05-1957', 'dd-mm-yyyy'), to_date('18-08-1982', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (709, 33934, to_date('02-03-1963', 'dd-mm-yyyy'), to_date('14-08-2021', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (711, 86746, to_date('18-01-1980', 'dd-mm-yyyy'), to_date('23-02-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (713, 85503, to_date('26-10-1953', 'dd-mm-yyyy'), to_date('06-03-2024', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (715, 78193, to_date('02-04-1958', 'dd-mm-yyyy'), to_date('07-03-1996', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (717, 25474, to_date('30-07-1960', 'dd-mm-yyyy'), to_date('23-03-2006', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (719, 91349, to_date('04-10-1954', 'dd-mm-yyyy'), to_date('17-01-1986', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (721, 56778, to_date('07-11-1958', 'dd-mm-yyyy'), to_date('28-01-1985', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (723, 18213, to_date('03-05-1964', 'dd-mm-yyyy'), to_date('19-12-2022', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (725, 76510, to_date('20-05-1975', 'dd-mm-yyyy'), to_date('17-05-1996', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (727, 13799, to_date('24-06-1977', 'dd-mm-yyyy'), to_date('09-05-1985', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (729, 52492, to_date('15-06-1976', 'dd-mm-yyyy'), to_date('24-10-2008', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (731, 12256, to_date('22-10-1969', 'dd-mm-yyyy'), to_date('16-05-2000', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (733, 34335, to_date('19-07-1975', 'dd-mm-yyyy'), to_date('03-02-1995', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (735, 89371, to_date('22-04-1949', 'dd-mm-yyyy'), to_date('24-04-1982', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (737, 25838, to_date('23-04-1968', 'dd-mm-yyyy'), to_date('20-03-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (739, 47298, to_date('19-10-1953', 'dd-mm-yyyy'), to_date('25-01-1993', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (741, 40043, to_date('29-05-1948', 'dd-mm-yyyy'), to_date('01-03-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (743, 6724, to_date('20-05-1960', 'dd-mm-yyyy'), to_date('03-07-1989', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (745, 15423, to_date('04-12-1954', 'dd-mm-yyyy'), to_date('01-11-1982', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (747, 31030, to_date('15-04-1976', 'dd-mm-yyyy'), to_date('06-04-1991', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (749, 88658, to_date('06-02-1973', 'dd-mm-yyyy'), to_date('12-06-2020', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (751, 1331, to_date('29-05-1953', 'dd-mm-yyyy'), to_date('04-09-1985', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (753, 23982, to_date('10-01-1957', 'dd-mm-yyyy'), to_date('23-04-2022', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (755, 16362, to_date('09-02-1968', 'dd-mm-yyyy'), to_date('23-04-1982', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (757, 34830, to_date('15-04-1955', 'dd-mm-yyyy'), to_date('07-05-1988', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (759, 20447, to_date('12-01-1952', 'dd-mm-yyyy'), to_date('29-03-1987', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (761, 50736, to_date('02-01-1957', 'dd-mm-yyyy'), to_date('07-06-2003', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (763, 81837, to_date('17-08-1974', 'dd-mm-yyyy'), to_date('05-03-2017', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (765, 86279, to_date('28-08-1949', 'dd-mm-yyyy'), to_date('17-04-1993', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (767, 93293, to_date('02-09-1953', 'dd-mm-yyyy'), to_date('15-08-2012', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (769, 25009, to_date('06-11-1961', 'dd-mm-yyyy'), to_date('27-03-1999', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (771, 29037, to_date('25-07-1956', 'dd-mm-yyyy'), to_date('22-05-2004', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (773, 7475, to_date('26-09-1955', 'dd-mm-yyyy'), to_date('10-01-1992', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (775, 9892, to_date('26-03-1970', 'dd-mm-yyyy'), to_date('03-06-2007', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (777, 41463, to_date('25-02-1969', 'dd-mm-yyyy'), to_date('07-06-1989', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (779, 53880, to_date('25-06-1955', 'dd-mm-yyyy'), to_date('19-12-1986', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (781, 69168, to_date('01-06-1968', 'dd-mm-yyyy'), to_date('05-07-2022', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (783, 65603, to_date('21-03-1972', 'dd-mm-yyyy'), to_date('07-07-1985', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (785, 9765, to_date('20-08-1965', 'dd-mm-yyyy'), to_date('01-07-2012', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (787, 52152, to_date('30-05-1967', 'dd-mm-yyyy'), to_date('04-12-1996', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (789, 49445, to_date('07-11-1952', 'dd-mm-yyyy'), to_date('08-04-1995', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (791, 11391, to_date('11-10-1979', 'dd-mm-yyyy'), to_date('19-02-1992', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (793, 33004, to_date('08-09-1967', 'dd-mm-yyyy'), to_date('20-09-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (795, 87583, to_date('27-02-1964', 'dd-mm-yyyy'), to_date('15-12-2000', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (797, 87060, to_date('18-01-1965', 'dd-mm-yyyy'), to_date('21-12-2002', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (799, 57496, to_date('12-02-1976', 'dd-mm-yyyy'), to_date('25-12-1989', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (801, 75713, to_date('15-06-1961', 'dd-mm-yyyy'), to_date('07-07-2008', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (803, 25009, to_date('01-10-1965', 'dd-mm-yyyy'), to_date('02-10-2021', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (805, 67349, to_date('22-10-1975', 'dd-mm-yyyy'), to_date('01-02-1998', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (807, 54770, to_date('13-11-1966', 'dd-mm-yyyy'), to_date('16-06-2000', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (809, 47102, to_date('20-12-1959', 'dd-mm-yyyy'), to_date('16-05-1987', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (811, 25561, to_date('19-07-1979', 'dd-mm-yyyy'), to_date('22-08-2002', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (813, 2651, to_date('21-05-1955', 'dd-mm-yyyy'), to_date('23-05-1987', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (815, 1222, to_date('24-10-1972', 'dd-mm-yyyy'), to_date('17-01-2007', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (817, 14736, to_date('09-10-1954', 'dd-mm-yyyy'), to_date('24-08-1999', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (819, 54453, to_date('01-07-1949', 'dd-mm-yyyy'), to_date('02-01-2006', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (821, 39835, to_date('05-07-1952', 'dd-mm-yyyy'), to_date('02-03-2011', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (823, 54302, to_date('25-07-1975', 'dd-mm-yyyy'), to_date('14-12-2018', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (825, 87438, to_date('10-08-1963', 'dd-mm-yyyy'), to_date('08-08-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (827, 38787, to_date('26-01-1963', 'dd-mm-yyyy'), to_date('13-02-1983', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (829, 7475, to_date('05-02-1973', 'dd-mm-yyyy'), to_date('28-11-2021', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (831, 79954, to_date('04-08-1971', 'dd-mm-yyyy'), to_date('03-01-2000', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (833, 55165, to_date('16-08-1967', 'dd-mm-yyyy'), to_date('26-12-2004', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (835, 54109, to_date('25-04-1979', 'dd-mm-yyyy'), to_date('04-12-1991', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (837, 58646, to_date('27-04-1952', 'dd-mm-yyyy'), to_date('30-04-2008', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (839, 72296, to_date('20-03-1978', 'dd-mm-yyyy'), to_date('09-12-1994', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (841, 60631, to_date('15-08-1955', 'dd-mm-yyyy'), to_date('30-05-2013', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (843, 78616, to_date('09-08-1949', 'dd-mm-yyyy'), to_date('21-04-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (845, 76834, to_date('26-05-1961', 'dd-mm-yyyy'), to_date('21-06-2017', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (847, 87060, to_date('23-12-1970', 'dd-mm-yyyy'), to_date('28-01-2004', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (849, 26275, to_date('26-10-1948', 'dd-mm-yyyy'), to_date('01-12-2004', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (851, 46835, to_date('14-07-1962', 'dd-mm-yyyy'), to_date('13-06-2015', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (853, 12256, to_date('21-09-1966', 'dd-mm-yyyy'), to_date('12-10-2002', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (855, 52113, to_date('26-11-1963', 'dd-mm-yyyy'), to_date('29-06-2004', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (857, 83941, to_date('27-08-1951', 'dd-mm-yyyy'), to_date('31-12-2018', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (859, 18797, to_date('09-06-1956', 'dd-mm-yyyy'), to_date('08-11-1986', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (861, 64165, to_date('18-09-1970', 'dd-mm-yyyy'), to_date('27-11-2008', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (863, 48162, to_date('16-03-1972', 'dd-mm-yyyy'), to_date('03-10-1998', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (865, 47109, to_date('14-02-1974', 'dd-mm-yyyy'), to_date('20-05-1997', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (867, 3563, to_date('12-02-1959', 'dd-mm-yyyy'), to_date('08-07-2009', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (869, 68004, to_date('04-01-1964', 'dd-mm-yyyy'), to_date('26-01-1983', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (871, 58716, to_date('12-11-1956', 'dd-mm-yyyy'), to_date('17-03-1983', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (873, 19188, to_date('20-02-1959', 'dd-mm-yyyy'), to_date('08-12-2018', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (875, 85684, to_date('09-03-1966', 'dd-mm-yyyy'), to_date('19-11-1996', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (877, 47298, to_date('19-05-1958', 'dd-mm-yyyy'), to_date('16-10-2009', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (879, 9892, to_date('22-08-1954', 'dd-mm-yyyy'), to_date('23-12-2002', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (881, 25564, to_date('09-06-1968', 'dd-mm-yyyy'), to_date('07-12-2023', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (883, 14123, to_date('31-07-1953', 'dd-mm-yyyy'), to_date('24-02-1996', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (885, 65397, to_date('24-12-1961', 'dd-mm-yyyy'), to_date('26-10-2016', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (887, 41302, to_date('15-12-1964', 'dd-mm-yyyy'), to_date('11-09-1987', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (889, 3832, to_date('01-07-1964', 'dd-mm-yyyy'), to_date('27-01-2017', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (891, 45912, to_date('28-09-1951', 'dd-mm-yyyy'), to_date('26-05-2013', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (893, 41463, to_date('02-05-1958', 'dd-mm-yyyy'), to_date('17-01-1991', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (895, 87175, to_date('23-03-1973', 'dd-mm-yyyy'), to_date('26-12-1996', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (897, 9755, to_date('02-01-1974', 'dd-mm-yyyy'), to_date('04-07-1989', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (899, 93431, to_date('05-12-1956', 'dd-mm-yyyy'), to_date('05-04-1995', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (901, 33004, to_date('17-08-1958', 'dd-mm-yyyy'), to_date('19-03-1994', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (903, 26414, to_date('22-01-1954', 'dd-mm-yyyy'), to_date('09-11-2019', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (905, 68267, to_date('01-05-1954', 'dd-mm-yyyy'), to_date('17-03-1999', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (907, 53880, to_date('20-03-1975', 'dd-mm-yyyy'), to_date('29-06-2018', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (909, 48961, to_date('13-10-1948', 'dd-mm-yyyy'), to_date('15-04-1983', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (911, 30755, to_date('25-11-1961', 'dd-mm-yyyy'), to_date('17-12-2022', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (913, 9765, to_date('28-07-1972', 'dd-mm-yyyy'), to_date('26-12-2023', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (915, 90402, to_date('11-08-1958', 'dd-mm-yyyy'), to_date('25-03-2002', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (917, 11010, to_date('23-10-1976', 'dd-mm-yyyy'), to_date('17-03-2023', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (919, 57059, to_date('17-07-1976', 'dd-mm-yyyy'), to_date('17-11-1985', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (921, 231, to_date('05-08-1970', 'dd-mm-yyyy'), to_date('27-06-2004', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (923, 83409, to_date('12-11-1976', 'dd-mm-yyyy'), to_date('15-04-1984', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (925, 85684, to_date('04-12-1961', 'dd-mm-yyyy'), to_date('06-12-1994', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (927, 38787, to_date('25-01-1979', 'dd-mm-yyyy'), to_date('30-05-1980', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (929, 57216, to_date('08-08-1965', 'dd-mm-yyyy'), to_date('17-06-2021', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (931, 52113, to_date('05-06-1952', 'dd-mm-yyyy'), to_date('25-03-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (933, 26737, to_date('19-12-1966', 'dd-mm-yyyy'), to_date('05-07-1980', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (935, 33934, to_date('10-09-1973', 'dd-mm-yyyy'), to_date('31-12-2009', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (937, 57065, to_date('16-10-1975', 'dd-mm-yyyy'), to_date('06-08-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (939, 89345, to_date('14-01-1958', 'dd-mm-yyyy'), to_date('24-08-1986', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (941, 45002, to_date('07-08-1955', 'dd-mm-yyyy'), to_date('17-01-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (943, 25561, to_date('03-01-1967', 'dd-mm-yyyy'), to_date('20-04-1996', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (945, 38679, to_date('12-06-1960', 'dd-mm-yyyy'), to_date('19-04-1985', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (947, 52492, to_date('02-07-1972', 'dd-mm-yyyy'), to_date('16-04-1981', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (949, 10567, to_date('09-10-1951', 'dd-mm-yyyy'), to_date('28-04-2022', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (951, 88658, to_date('21-02-1956', 'dd-mm-yyyy'), to_date('03-01-2003', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (953, 34823, to_date('01-03-1976', 'dd-mm-yyyy'), to_date('25-08-2020', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (955, 3361, to_date('07-02-1950', 'dd-mm-yyyy'), to_date('05-08-1991', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (957, 59853, to_date('29-12-1958', 'dd-mm-yyyy'), to_date('13-12-2021', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (959, 97066, to_date('26-04-1953', 'dd-mm-yyyy'), to_date('09-12-2005', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (961, 3832, to_date('14-07-1958', 'dd-mm-yyyy'), to_date('28-11-1990', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (963, 26779, to_date('11-03-1979', 'dd-mm-yyyy'), to_date('11-02-2010', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (965, 25474, to_date('06-11-1964', 'dd-mm-yyyy'), to_date('19-10-1986', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (967, 36574, to_date('26-04-1954', 'dd-mm-yyyy'), to_date('05-07-1981', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (969, 42376, to_date('20-11-1954', 'dd-mm-yyyy'), to_date('10-11-2023', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (971, 65603, to_date('25-05-1961', 'dd-mm-yyyy'), to_date('13-07-2018', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (973, 76834, to_date('02-05-1980', 'dd-mm-yyyy'), to_date('25-07-2014', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (975, 18367, to_date('13-05-1958', 'dd-mm-yyyy'), to_date('07-08-1996', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (977, 64165, to_date('25-07-1977', 'dd-mm-yyyy'), to_date('16-04-1986', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (979, 43054, to_date('15-01-1979', 'dd-mm-yyyy'), to_date('30-08-1980', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (981, 54809, to_date('13-06-1975', 'dd-mm-yyyy'), to_date('10-04-2020', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (983, 25075, to_date('18-11-1962', 'dd-mm-yyyy'), to_date('05-12-1993', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (985, 5390, to_date('26-03-1967', 'dd-mm-yyyy'), to_date('16-12-2009', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (987, 86279, to_date('26-02-1966', 'dd-mm-yyyy'), to_date('05-03-2020', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (989, 69212, to_date('27-07-1964', 'dd-mm-yyyy'), to_date('08-07-2023', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (991, 18600, to_date('13-09-1960', 'dd-mm-yyyy'), to_date('04-12-1989', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (993, 31790, to_date('11-09-1979', 'dd-mm-yyyy'), to_date('28-04-2002', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (995, 97765, to_date('16-09-1962', 'dd-mm-yyyy'), to_date('17-06-1987', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (997, 87060, to_date('17-02-1959', 'dd-mm-yyyy'), to_date('02-04-2007', 'dd-mm-yyyy'));
insert into ASSIGNMENTS (a_id, e_id, start_date, end_date)
values (999, 74972, to_date('24-02-1975', 'dd-mm-yyyy'), to_date('08-04-2005', 'dd-mm-yyyy'));
commit;
prompt 500 records loaded
prompt Loading OPERATIONS_...
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (1, '24/7', to_date('06-03-1959', 'dd-mm-yyyy'), to_date('13-12-2001', 'dd-mm-yyyy'), 'Object-based multi-state product');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (2, 'Universal', to_date('27-06-1968', 'dd-mm-yyyy'), to_date('18-07-1996', 'dd-mm-yyyy'), 'Virtual encompassing matrices');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (3, 'policy', to_date('30-04-1959', 'dd-mm-yyyy'), to_date('30-11-1992', 'dd-mm-yyyy'), 'Networked dynamic model');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (4, 'hub', to_date('06-05-1973', 'dd-mm-yyyy'), to_date('19-10-1986', 'dd-mm-yyyy'), 'Future-proofed 6th generation utilisation');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (5, 'interactive', to_date('26-05-1952', 'dd-mm-yyyy'), to_date('27-04-1988', 'dd-mm-yyyy'), 'Centralized needs-based artificial intelligence');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (6, 'asynchronous', to_date('09-06-1970', 'dd-mm-yyyy'), to_date('05-04-2021', 'dd-mm-yyyy'), 'Multi-channelled coherent functionalities');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (7, 'Public-key', to_date('05-11-1971', 'dd-mm-yyyy'), to_date('30-03-1996', 'dd-mm-yyyy'), 'Sharable bottom-line secured line');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (8, 'matrix', to_date('22-06-1968', 'dd-mm-yyyy'), to_date('28-10-2014', 'dd-mm-yyyy'), 'Managed uniform throughput');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (9, 'internet solution', to_date('21-01-1980', 'dd-mm-yyyy'), to_date('02-10-1984', 'dd-mm-yyyy'), 'Innovative radical challenge');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (10, 'task-force', to_date('26-03-1955', 'dd-mm-yyyy'), to_date('19-10-1993', 'dd-mm-yyyy'), 'Extended reciprocal encoding');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (11, 'Future-proofed', to_date('21-10-1953', 'dd-mm-yyyy'), to_date('10-08-1995', 'dd-mm-yyyy'), 'Cross-platform 24/7 complexity');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (12, 'Robust', to_date('10-08-1963', 'dd-mm-yyyy'), to_date('23-01-2016', 'dd-mm-yyyy'), 'Advanced responsive budgetary management');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (13, 'Operative', to_date('30-08-1965', 'dd-mm-yyyy'), to_date('03-10-2012', 'dd-mm-yyyy'), 'Adaptive leading edge customer loyalty');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (14, 'neural-net', to_date('03-03-1968', 'dd-mm-yyyy'), to_date('29-11-1990', 'dd-mm-yyyy'), 'Customer-focused global encoding');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (15, 'value-added', to_date('16-09-1949', 'dd-mm-yyyy'), to_date('20-04-1994', 'dd-mm-yyyy'), 'Realigned transitional approach');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (16, 'portal', to_date('19-02-1962', 'dd-mm-yyyy'), to_date('20-05-2008', 'dd-mm-yyyy'), 'Configurable tangible archive');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (17, 'Organic', to_date('25-06-1952', 'dd-mm-yyyy'), to_date('25-03-1991', 'dd-mm-yyyy'), 'Programmable intermediate artificial intelligence');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (18, 'support', to_date('20-09-1974', 'dd-mm-yyyy'), to_date('14-10-1980', 'dd-mm-yyyy'), 'Managed encompassing projection');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (19, 'utilisation', to_date('20-04-1980', 'dd-mm-yyyy'), to_date('07-06-2002', 'dd-mm-yyyy'), 'Multi-layered multimedia Graphic Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (20, 'support', to_date('15-08-1954', 'dd-mm-yyyy'), to_date('11-01-2015', 'dd-mm-yyyy'), 'Polarised fault-tolerant collaboration');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (21, 'bandwidth-monitored', to_date('05-05-1962', 'dd-mm-yyyy'), to_date('08-05-2005', 'dd-mm-yyyy'), 'Pre-emptive interactive service-desk');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (22, 'coherent', to_date('29-08-1959', 'dd-mm-yyyy'), to_date('10-06-1991', 'dd-mm-yyyy'), 'Ergonomic intermediate Graphical User Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (23, 'User-friendly', to_date('11-05-1978', 'dd-mm-yyyy'), to_date('23-03-2016', 'dd-mm-yyyy'), 'Monitored optimal open system');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (24, 'open architecture', to_date('09-01-1960', 'dd-mm-yyyy'), to_date('26-09-1991', 'dd-mm-yyyy'), 'Fundamental systematic protocol');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (25, 'stable', to_date('03-03-1956', 'dd-mm-yyyy'), to_date('18-11-1991', 'dd-mm-yyyy'), 'Configurable web-enabled extranet');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (26, 'conglomeration', to_date('31-05-1955', 'dd-mm-yyyy'), to_date('04-05-2006', 'dd-mm-yyyy'), 'Vision-oriented heuristic forecast');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (27, 'uniform', to_date('24-09-1961', 'dd-mm-yyyy'), to_date('03-03-1988', 'dd-mm-yyyy'), 'Function-based 24/7 algorithm');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (28, 'Cross-platform', to_date('01-09-1962', 'dd-mm-yyyy'), to_date('07-04-2022', 'dd-mm-yyyy'), 'Re-contextualized contextually-based customer loyalty');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (29, 'architecture', to_date('25-03-1980', 'dd-mm-yyyy'), to_date('11-02-1994', 'dd-mm-yyyy'), 'Synergized encompassing contingency');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (30, 'User-friendly', to_date('25-03-1950', 'dd-mm-yyyy'), to_date('07-11-1984', 'dd-mm-yyyy'), 'Cross-platform exuding hardware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (31, 'Quality-focused', to_date('03-05-1960', 'dd-mm-yyyy'), to_date('16-04-2024', 'dd-mm-yyyy'), 'Optional eco-centric array');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (32, 'leverage', to_date('25-11-1948', 'dd-mm-yyyy'), to_date('28-03-1991', 'dd-mm-yyyy'), 'Vision-oriented reciprocal installation');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (33, 'Progressive', to_date('14-10-1972', 'dd-mm-yyyy'), to_date('17-08-1996', 'dd-mm-yyyy'), 'Advanced global encryption');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (34, 'process improvement', to_date('25-10-1977', 'dd-mm-yyyy'), to_date('28-12-1985', 'dd-mm-yyyy'), 'Synergized multi-tasking capability');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (35, 'intranet', to_date('15-11-1951', 'dd-mm-yyyy'), to_date('06-04-1981', 'dd-mm-yyyy'), 'Switchable scalable database');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (36, 'Multi-layered', to_date('09-02-1951', 'dd-mm-yyyy'), to_date('18-11-1987', 'dd-mm-yyyy'), 'Phased optimizing methodology');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (37, 'bottom-line', to_date('08-09-1956', 'dd-mm-yyyy'), to_date('19-12-2010', 'dd-mm-yyyy'), 'Distributed motivating hub');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (38, 'hub', to_date('06-03-1955', 'dd-mm-yyyy'), to_date('18-01-1993', 'dd-mm-yyyy'), 'Fundamental exuding firmware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (39, 'service-desk', to_date('24-06-1976', 'dd-mm-yyyy'), to_date('04-04-2023', 'dd-mm-yyyy'), 'Business-focused bi-directional orchestration');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (40, 'attitude-oriented', to_date('20-08-1974', 'dd-mm-yyyy'), to_date('24-07-2011', 'dd-mm-yyyy'), 'Decentralized actuating service-desk');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (41, 'holistic', to_date('04-12-1979', 'dd-mm-yyyy'), to_date('30-11-1983', 'dd-mm-yyyy'), 'Synchronised clear-thinking policy');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (42, 'encryption', to_date('21-02-1963', 'dd-mm-yyyy'), to_date('14-09-1980', 'dd-mm-yyyy'), 'Grass-roots user-facing framework');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (43, 'forecast', to_date('11-05-1977', 'dd-mm-yyyy'), to_date('11-04-2013', 'dd-mm-yyyy'), 'Mandatory homogeneous circuit');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (44, 'bandwidth-monitored', to_date('13-04-1953', 'dd-mm-yyyy'), to_date('23-10-1995', 'dd-mm-yyyy'), 'Expanded neutral data-warehouse');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (45, 'upward-trending', to_date('24-11-1973', 'dd-mm-yyyy'), to_date('25-01-1994', 'dd-mm-yyyy'), 'Triple-buffered solution-oriented collaboration');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (46, 'architecture', to_date('05-04-1977', 'dd-mm-yyyy'), to_date('21-08-2019', 'dd-mm-yyyy'), 'Sharable methodical intranet');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (47, 'dedicated', to_date('08-12-1969', 'dd-mm-yyyy'), to_date('13-03-2019', 'dd-mm-yyyy'), 'Realigned asymmetric info-mediaries');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (48, 'Robust', to_date('08-12-1965', 'dd-mm-yyyy'), to_date('03-08-1996', 'dd-mm-yyyy'), 'Synergized incremental info-mediaries');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (49, 'structure', to_date('04-05-1972', 'dd-mm-yyyy'), to_date('09-09-1980', 'dd-mm-yyyy'), 'Advanced grid-enabled concept');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (50, 'dedicated', to_date('11-10-1956', 'dd-mm-yyyy'), to_date('25-05-2006', 'dd-mm-yyyy'), 'Exclusive context-sensitive forecast');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (51, 'matrices', to_date('24-06-1971', 'dd-mm-yyyy'), to_date('22-02-2004', 'dd-mm-yyyy'), 'Intuitive local approach');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (52, 'cohesive', to_date('20-08-1959', 'dd-mm-yyyy'), to_date('27-06-2000', 'dd-mm-yyyy'), 'Pre-emptive next generation alliance');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (53, 'Proactive', to_date('03-05-1973', 'dd-mm-yyyy'), to_date('03-06-1988', 'dd-mm-yyyy'), 'Team-oriented human-resource approach');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (54, 'logistical', to_date('10-01-1959', 'dd-mm-yyyy'), to_date('12-06-1989', 'dd-mm-yyyy'), 'Synchronised maximized challenge');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (55, 'bandwidth-monitored', to_date('24-10-1968', 'dd-mm-yyyy'), to_date('14-04-2018', 'dd-mm-yyyy'), 'Persistent tertiary matrices');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (56, 'success', to_date('25-09-1967', 'dd-mm-yyyy'), to_date('29-10-1993', 'dd-mm-yyyy'), 'Mandatory fault-tolerant infrastructure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (57, 'Down-sized', to_date('07-01-1960', 'dd-mm-yyyy'), to_date('29-10-1981', 'dd-mm-yyyy'), 'Team-oriented motivating neural-net');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (58, 'knowledge base', to_date('30-03-1951', 'dd-mm-yyyy'), to_date('29-08-1996', 'dd-mm-yyyy'), 'Synergized explicit task-force');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (59, 'matrix', to_date('12-04-1976', 'dd-mm-yyyy'), to_date('13-11-2019', 'dd-mm-yyyy'), 'Programmable national interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (60, 'Phased', to_date('12-09-1949', 'dd-mm-yyyy'), to_date('14-10-1983', 'dd-mm-yyyy'), 'Advanced impactful functionalities');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (61, 'background', to_date('26-05-1974', 'dd-mm-yyyy'), to_date('26-01-2023', 'dd-mm-yyyy'), 'Multi-channelled bottom-line flexibility');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (62, 'scalable', to_date('19-12-1969', 'dd-mm-yyyy'), to_date('27-05-2013', 'dd-mm-yyyy'), 'Cross-group asynchronous knowledge user');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (63, 'initiative', to_date('27-02-1970', 'dd-mm-yyyy'), to_date('26-08-1995', 'dd-mm-yyyy'), 'Centralized heuristic data-warehouse');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (64, 'zero administration', to_date('02-08-1964', 'dd-mm-yyyy'), to_date('24-04-1984', 'dd-mm-yyyy'), 'Organic leading edge flexibility');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (65, 'methodical', to_date('17-09-1966', 'dd-mm-yyyy'), to_date('24-09-1997', 'dd-mm-yyyy'), 'Enterprise-wide 3rd generation product');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (66, 'flexibility', to_date('24-11-1966', 'dd-mm-yyyy'), to_date('09-02-2013', 'dd-mm-yyyy'), 'Vision-oriented didactic migration');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (67, 'upward-trending', to_date('09-12-1952', 'dd-mm-yyyy'), to_date('07-05-2017', 'dd-mm-yyyy'), 'Optimized intangible ability');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (68, 'hierarchy', to_date('13-05-1975', 'dd-mm-yyyy'), to_date('15-03-2007', 'dd-mm-yyyy'), 'Distributed local protocol');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (69, 'Business-focused', to_date('27-12-1975', 'dd-mm-yyyy'), to_date('06-08-1986', 'dd-mm-yyyy'), 'Automated logistical collaboration');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (70, 'flexibility', to_date('07-05-1967', 'dd-mm-yyyy'), to_date('20-01-1990', 'dd-mm-yyyy'), 'Phased radical local area network');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (71, 'Realigned', to_date('09-07-1971', 'dd-mm-yyyy'), to_date('28-06-1988', 'dd-mm-yyyy'), 'Re-engineered fresh-thinking superstructure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (72, 'approach', to_date('21-09-1976', 'dd-mm-yyyy'), to_date('29-08-1987', 'dd-mm-yyyy'), 'Monitored scalable complexity');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (73, 'benchmark', to_date('08-10-1970', 'dd-mm-yyyy'), to_date('01-01-2023', 'dd-mm-yyyy'), 'Total tangible neural-net');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (74, 'benchmark', to_date('04-11-1979', 'dd-mm-yyyy'), to_date('23-01-1993', 'dd-mm-yyyy'), 'Multi-layered executive architecture');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (75, 'moderator', to_date('14-08-1976', 'dd-mm-yyyy'), to_date('12-05-2019', 'dd-mm-yyyy'), 'Open-source interactive Graphic Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (76, 'info-mediaries', to_date('14-05-1964', 'dd-mm-yyyy'), to_date('02-01-2010', 'dd-mm-yyyy'), 'Profound foreground protocol');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (77, 'software', to_date('09-06-1953', 'dd-mm-yyyy'), to_date('23-12-1998', 'dd-mm-yyyy'), 'Organic actuating system engine');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (78, 'Extended', to_date('04-03-1967', 'dd-mm-yyyy'), to_date('25-07-1996', 'dd-mm-yyyy'), 'Persevering responsive concept');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (79, 'Cross-group', to_date('16-04-1963', 'dd-mm-yyyy'), to_date('15-04-1994', 'dd-mm-yyyy'), 'User-friendly discrete Graphical User Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (80, 'functionalities', to_date('15-03-1957', 'dd-mm-yyyy'), to_date('17-12-2007', 'dd-mm-yyyy'), 'Polarised discrete emulation');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (81, 'circuit', to_date('30-06-1950', 'dd-mm-yyyy'), to_date('29-11-2015', 'dd-mm-yyyy'), 'Balanced even-keeled superstructure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (82, '4th generation', to_date('06-08-1968', 'dd-mm-yyyy'), to_date('01-05-2002', 'dd-mm-yyyy'), 'Synergistic exuding neural-net');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (83, 'human-resource', to_date('11-03-1958', 'dd-mm-yyyy'), to_date('18-06-2013', 'dd-mm-yyyy'), 'Reverse-engineered value-added instruction set');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (84, 'Graphical User Interface', to_date('25-06-1974', 'dd-mm-yyyy'), to_date('24-05-2003', 'dd-mm-yyyy'), 'Assimilated 3rd generation initiative');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (85, 'leverage', to_date('03-04-1952', 'dd-mm-yyyy'), to_date('30-03-2007', 'dd-mm-yyyy'), 'Vision-oriented full-range adapter');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (86, 'Stand-alone', to_date('06-01-1964', 'dd-mm-yyyy'), to_date('28-04-1994', 'dd-mm-yyyy'), 'Reverse-engineered 3rd generation concept');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (87, 'discrete', to_date('22-05-1968', 'dd-mm-yyyy'), to_date('29-09-1995', 'dd-mm-yyyy'), 'Programmable methodical archive');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (88, 'Advanced', to_date('01-09-1974', 'dd-mm-yyyy'), to_date('27-04-1987', 'dd-mm-yyyy'), 'Optimized intermediate info-mediaries');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (89, 'concept', to_date('23-08-1948', 'dd-mm-yyyy'), to_date('01-04-1983', 'dd-mm-yyyy'), 'Profit-focused multimedia model');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (90, 'static', to_date('13-04-1973', 'dd-mm-yyyy'), to_date('29-04-1994', 'dd-mm-yyyy'), 'Robust modular flexibility');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (91, 'leverage', to_date('01-07-1971', 'dd-mm-yyyy'), to_date('10-08-1984', 'dd-mm-yyyy'), 'Organized regional complexity');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (92, 'emulation', to_date('13-07-1965', 'dd-mm-yyyy'), to_date('30-12-2008', 'dd-mm-yyyy'), 'Operative intermediate framework');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (93, 'Polarised', to_date('30-08-1957', 'dd-mm-yyyy'), to_date('20-04-2013', 'dd-mm-yyyy'), 'Inverse logistical open system');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (94, 'actuating', to_date('14-12-1965', 'dd-mm-yyyy'), to_date('23-03-2000', 'dd-mm-yyyy'), 'Reactive background artificial intelligence');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (95, 'content-based', to_date('23-01-1970', 'dd-mm-yyyy'), to_date('23-04-2021', 'dd-mm-yyyy'), 'Organized optimal project');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (96, '24/7', to_date('16-06-1950', 'dd-mm-yyyy'), to_date('04-08-2011', 'dd-mm-yyyy'), 'Face to face dynamic knowledge user');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (97, 'zero administration', to_date('16-07-1968', 'dd-mm-yyyy'), to_date('03-05-2019', 'dd-mm-yyyy'), 'Front-line explicit secured line');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (98, 'Right-sized', to_date('27-12-1963', 'dd-mm-yyyy'), to_date('24-12-2006', 'dd-mm-yyyy'), 'Focused impactful infrastructure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (99, 'high-level', to_date('04-05-1961', 'dd-mm-yyyy'), to_date('24-12-1985', 'dd-mm-yyyy'), 'Enhanced reciprocal function');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (100, 'time-frame', to_date('15-03-1968', 'dd-mm-yyyy'), to_date('22-05-1986', 'dd-mm-yyyy'), 'Customizable clear-thinking function');
commit;
prompt 100 records committed...
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (101, 'hardware', to_date('26-07-1957', 'dd-mm-yyyy'), to_date('19-03-2006', 'dd-mm-yyyy'), 'Implemented context-sensitive hierarchy');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (102, 'asynchronous', to_date('22-01-1954', 'dd-mm-yyyy'), to_date('10-04-1999', 'dd-mm-yyyy'), 'Reduced interactive algorithm');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (103, '3rd generation', to_date('21-07-1948', 'dd-mm-yyyy'), to_date('22-04-2001', 'dd-mm-yyyy'), 'Progressive well-modulated productivity');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (104, 'task-force', to_date('30-05-1949', 'dd-mm-yyyy'), to_date('31-12-1999', 'dd-mm-yyyy'), 'Optional background database');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (105, 'Persistent', to_date('31-05-1964', 'dd-mm-yyyy'), to_date('23-06-2013', 'dd-mm-yyyy'), 'Expanded upward-trending knowledge base');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (106, 'superstructure', to_date('31-03-1950', 'dd-mm-yyyy'), to_date('18-12-2018', 'dd-mm-yyyy'), 'Managed bi-directional project');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (107, 'human-resource', to_date('02-06-1959', 'dd-mm-yyyy'), to_date('07-01-2023', 'dd-mm-yyyy'), 'Reduced multimedia adapter');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (108, 'archive', to_date('13-08-1979', 'dd-mm-yyyy'), to_date('01-09-2011', 'dd-mm-yyyy'), 'Pre-emptive optimal system engine');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (109, 'content-based', to_date('18-12-1950', 'dd-mm-yyyy'), to_date('27-01-1995', 'dd-mm-yyyy'), 'Diverse bandwidth-monitored application');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (110, 'project', to_date('21-10-1955', 'dd-mm-yyyy'), to_date('19-08-1984', 'dd-mm-yyyy'), 'User-friendly optimizing structure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (111, 'leverage', to_date('30-03-1975', 'dd-mm-yyyy'), to_date('20-12-2017', 'dd-mm-yyyy'), 'Object-based full-range toolset');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (112, 'Synergized', to_date('10-06-1954', 'dd-mm-yyyy'), to_date('28-04-1984', 'dd-mm-yyyy'), 'Versatile coherent framework');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (113, 'fresh-thinking', to_date('14-11-1959', 'dd-mm-yyyy'), to_date('20-03-2020', 'dd-mm-yyyy'), 'Inverse real-time forecast');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (114, 'concept', to_date('25-04-1975', 'dd-mm-yyyy'), to_date('06-03-1994', 'dd-mm-yyyy'), 'Intuitive cohesive customer loyalty');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (115, 'Triple-buffered', to_date('20-05-1955', 'dd-mm-yyyy'), to_date('31-07-2015', 'dd-mm-yyyy'), 'Automated high-level success');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (116, 'complexity', to_date('13-07-1953', 'dd-mm-yyyy'), to_date('31-07-1991', 'dd-mm-yyyy'), 'Seamless demand-driven emulation');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (117, 'database', to_date('02-06-1979', 'dd-mm-yyyy'), to_date('31-03-1994', 'dd-mm-yyyy'), 'Switchable interactive software');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (118, 'success', to_date('16-03-1959', 'dd-mm-yyyy'), to_date('06-04-1995', 'dd-mm-yyyy'), 'Up-sized logistical alliance');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (119, 'approach', to_date('20-07-1950', 'dd-mm-yyyy'), to_date('21-10-2009', 'dd-mm-yyyy'), 'Optimized well-modulated matrices');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (120, 'bandwidth-monitored', to_date('29-08-1951', 'dd-mm-yyyy'), to_date('20-02-1997', 'dd-mm-yyyy'), 'Quality-focused grid-enabled capability');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (121, 'firmware', to_date('24-12-1957', 'dd-mm-yyyy'), to_date('05-08-1985', 'dd-mm-yyyy'), 'Visionary heuristic architecture');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (122, 'Profit-focused', to_date('25-06-1952', 'dd-mm-yyyy'), to_date('28-08-1986', 'dd-mm-yyyy'), 'Programmable needs-based task-force');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (123, 'solution-oriented', to_date('11-11-1962', 'dd-mm-yyyy'), to_date('23-03-1983', 'dd-mm-yyyy'), 'Configurable zero defect system engine');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (124, 'hierarchy', to_date('19-10-1976', 'dd-mm-yyyy'), to_date('25-11-1998', 'dd-mm-yyyy'), 'Secured clear-thinking parallelism');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (125, 'contingency', to_date('01-12-1960', 'dd-mm-yyyy'), to_date('16-11-1995', 'dd-mm-yyyy'), 'Customizable intangible hierarchy');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (126, 'foreground', to_date('16-10-1952', 'dd-mm-yyyy'), to_date('27-07-1996', 'dd-mm-yyyy'), 'Proactive holistic throughput');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (127, 'Mandatory', to_date('03-05-1955', 'dd-mm-yyyy'), to_date('15-07-2017', 'dd-mm-yyyy'), 'Virtual mobile secured line');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (128, 'function', to_date('05-10-1972', 'dd-mm-yyyy'), to_date('27-02-2019', 'dd-mm-yyyy'), 'Decentralized homogeneous firmware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (129, 'disintermediate', to_date('15-08-1965', 'dd-mm-yyyy'), to_date('17-05-2004', 'dd-mm-yyyy'), 'Seamless methodical software');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (130, 'impactful', to_date('10-09-1961', 'dd-mm-yyyy'), to_date('24-04-1996', 'dd-mm-yyyy'), 'Re-contextualized mission-critical emulation');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (131, 'Pre-emptive', to_date('15-11-1956', 'dd-mm-yyyy'), to_date('18-07-1992', 'dd-mm-yyyy'), 'Proactive bandwidth-monitored flexibility');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (132, 'moderator', to_date('17-12-1958', 'dd-mm-yyyy'), to_date('30-11-1984', 'dd-mm-yyyy'), 'Switchable executive structure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (133, 'system engine', to_date('01-06-1967', 'dd-mm-yyyy'), to_date('24-03-1990', 'dd-mm-yyyy'), 'Synchronised contextually-based hardware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (134, 'concept', to_date('28-06-1962', 'dd-mm-yyyy'), to_date('22-01-1989', 'dd-mm-yyyy'), 'Future-proofed background complexity');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (135, 'emulation', to_date('28-10-1959', 'dd-mm-yyyy'), to_date('24-02-2012', 'dd-mm-yyyy'), 'Profit-focused optimal capability');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (136, 'knowledge user', to_date('06-09-1966', 'dd-mm-yyyy'), to_date('04-08-1995', 'dd-mm-yyyy'), 'Horizontal fault-tolerant function');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (137, 'superstructure', to_date('20-09-1976', 'dd-mm-yyyy'), to_date('05-08-1993', 'dd-mm-yyyy'), 'Future-proofed clear-thinking application');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (138, 'utilization', to_date('24-11-1950', 'dd-mm-yyyy'), to_date('04-06-2011', 'dd-mm-yyyy'), 'Universal client-driven algorithm');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (139, 'Multi-tiered', to_date('28-11-1951', 'dd-mm-yyyy'), to_date('02-01-1992', 'dd-mm-yyyy'), 'Synergistic systemic paradigm');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (140, 'matrices', to_date('01-04-1958', 'dd-mm-yyyy'), to_date('18-12-2005', 'dd-mm-yyyy'), 'Phased 24/7 Graphical User Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (141, 'multi-state', to_date('14-02-1967', 'dd-mm-yyyy'), to_date('26-09-1987', 'dd-mm-yyyy'), 'Managed bi-directional forecast');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (142, 'Persistent', to_date('02-07-1965', 'dd-mm-yyyy'), to_date('04-12-1997', 'dd-mm-yyyy'), 'Exclusive context-sensitive model');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (143, 'moderator', to_date('06-08-1971', 'dd-mm-yyyy'), to_date('11-04-1998', 'dd-mm-yyyy'), 'Function-based zero tolerance function');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (144, 'system engine', to_date('27-03-1969', 'dd-mm-yyyy'), to_date('29-04-1994', 'dd-mm-yyyy'), 'Profit-focused cohesive knowledge base');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (145, 'toolset', to_date('18-11-1959', 'dd-mm-yyyy'), to_date('15-08-2015', 'dd-mm-yyyy'), 'Vision-oriented mission-critical task-force');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (146, 'info-mediaries', to_date('19-01-1954', 'dd-mm-yyyy'), to_date('19-09-1991', 'dd-mm-yyyy'), 'Function-based 24 hour function');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (147, '4th generation', to_date('22-05-1953', 'dd-mm-yyyy'), to_date('30-06-2012', 'dd-mm-yyyy'), 'Multi-layered tangible portal');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (148, 'Phased', to_date('27-04-1976', 'dd-mm-yyyy'), to_date('07-05-1993', 'dd-mm-yyyy'), 'Automated bottom-line algorithm');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (149, 'Optional', to_date('06-01-1970', 'dd-mm-yyyy'), to_date('08-03-1985', 'dd-mm-yyyy'), 'Streamlined didactic architecture');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (150, 'Optional', to_date('05-02-1973', 'dd-mm-yyyy'), to_date('06-07-2011', 'dd-mm-yyyy'), 'Customer-focused mission-critical interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (151, 'contingency', to_date('21-09-1959', 'dd-mm-yyyy'), to_date('26-02-2012', 'dd-mm-yyyy'), 'Visionary client-driven contingency');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (152, 'circuit', to_date('14-12-1968', 'dd-mm-yyyy'), to_date('12-01-1998', 'dd-mm-yyyy'), 'Distributed scalable firmware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (153, 'monitored', to_date('01-09-1975', 'dd-mm-yyyy'), to_date('15-08-1993', 'dd-mm-yyyy'), 'Configurable reciprocal Graphic Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (154, 'interface', to_date('28-03-1961', 'dd-mm-yyyy'), to_date('21-08-2002', 'dd-mm-yyyy'), 'Innovative bottom-line complexity');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (155, 'scalable', to_date('06-06-1953', 'dd-mm-yyyy'), to_date('12-06-1988', 'dd-mm-yyyy'), 'Programmable zero tolerance protocol');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (156, 'interface', to_date('11-02-1972', 'dd-mm-yyyy'), to_date('09-07-2015', 'dd-mm-yyyy'), 'Integrated static capability');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (157, 'Phased', to_date('05-11-1977', 'dd-mm-yyyy'), to_date('18-11-2005', 'dd-mm-yyyy'), 'Sharable leading-edge strategy');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (158, 'cross-platform', to_date('08-11-1964', 'dd-mm-yyyy'), to_date('07-05-1995', 'dd-mm-yyyy'), 'Function-based background superstructure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (159, 'collaboration', to_date('11-01-1950', 'dd-mm-yyyy'), to_date('03-08-1986', 'dd-mm-yyyy'), 'Integrated multi-state Graphical User Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (160, 'cohesive', to_date('23-04-1975', 'dd-mm-yyyy'), to_date('09-10-2018', 'dd-mm-yyyy'), 'Advanced user-facing secured line');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (161, 'Proactive', to_date('18-02-1957', 'dd-mm-yyyy'), to_date('21-07-2001', 'dd-mm-yyyy'), 'User-centric empowering paradigm');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (162, 'logistical', to_date('04-01-1977', 'dd-mm-yyyy'), to_date('07-07-2006', 'dd-mm-yyyy'), 'Public-key background structure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (163, 'bandwidth-monitored', to_date('06-07-1973', 'dd-mm-yyyy'), to_date('26-09-2000', 'dd-mm-yyyy'), 'Reduced client-driven interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (164, 'success', to_date('22-11-1976', 'dd-mm-yyyy'), to_date('16-12-2003', 'dd-mm-yyyy'), 'Reverse-engineered foreground success');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (165, 'Down-sized', to_date('01-02-1954', 'dd-mm-yyyy'), to_date('24-11-1994', 'dd-mm-yyyy'), 'Exclusive methodical system engine');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (166, 'knowledge base', to_date('16-01-1974', 'dd-mm-yyyy'), to_date('23-12-1995', 'dd-mm-yyyy'), 'Enterprise-wide mobile capability');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (167, 'matrix', to_date('02-08-1959', 'dd-mm-yyyy'), to_date('27-04-1999', 'dd-mm-yyyy'), 'Automated background paradigm');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (168, 'Phased', to_date('03-09-1960', 'dd-mm-yyyy'), to_date('23-12-2009', 'dd-mm-yyyy'), 'Enhanced multi-tasking firmware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (169, 'background', to_date('29-04-1968', 'dd-mm-yyyy'), to_date('08-02-2017', 'dd-mm-yyyy'), 'Phased zero tolerance product');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (170, 'scalable', to_date('16-03-1960', 'dd-mm-yyyy'), to_date('15-12-2004', 'dd-mm-yyyy'), 'Advanced foreground matrix');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (171, 'initiative', to_date('19-12-1972', 'dd-mm-yyyy'), to_date('27-01-1990', 'dd-mm-yyyy'), 'Operative upward-trending capability');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (172, 'zero administration', to_date('25-07-1953', 'dd-mm-yyyy'), to_date('28-03-2017', 'dd-mm-yyyy'), 'Total disintermediate complexity');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (173, 'methodical', to_date('17-02-1959', 'dd-mm-yyyy'), to_date('06-05-2005', 'dd-mm-yyyy'), 'Horizontal foreground superstructure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (174, 'flexibility', to_date('29-03-1970', 'dd-mm-yyyy'), to_date('24-07-1994', 'dd-mm-yyyy'), 'Implemented intangible system engine');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (175, 'upward-trending', to_date('14-10-1958', 'dd-mm-yyyy'), to_date('22-02-2016', 'dd-mm-yyyy'), 'Public-key bottom-line productivity');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (176, 'hierarchy', to_date('09-06-1956', 'dd-mm-yyyy'), to_date('14-08-1993', 'dd-mm-yyyy'), 'Advanced client-driven portal');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (177, 'Business-focused', to_date('05-07-1966', 'dd-mm-yyyy'), to_date('24-07-1995', 'dd-mm-yyyy'), 'Customer-focused logistical capability');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (178, 'flexibility', to_date('26-04-1950', 'dd-mm-yyyy'), to_date('13-03-1999', 'dd-mm-yyyy'), 'Future-proofed tangible firmware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (179, 'Realigned', to_date('25-05-1956', 'dd-mm-yyyy'), to_date('17-09-1996', 'dd-mm-yyyy'), 'Integrated zero defect forecast');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (180, 'approach', to_date('05-10-1971', 'dd-mm-yyyy'), to_date('05-07-2015', 'dd-mm-yyyy'), 'Multi-tiered stable matrices');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (181, 'benchmark', to_date('08-07-1965', 'dd-mm-yyyy'), to_date('19-06-2001', 'dd-mm-yyyy'), 'Secured transitional hardware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (182, 'benchmark', to_date('18-05-1962', 'dd-mm-yyyy'), to_date('05-04-1988', 'dd-mm-yyyy'), 'Programmable needs-based application');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (183, 'moderator', to_date('10-02-1958', 'dd-mm-yyyy'), to_date('02-08-1986', 'dd-mm-yyyy'), 'Balanced reciprocal complexity');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (184, 'info-mediaries', to_date('27-07-1967', 'dd-mm-yyyy'), to_date('19-02-2000', 'dd-mm-yyyy'), 'Organized multimedia paradigm');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (185, 'software', to_date('09-03-1963', 'dd-mm-yyyy'), to_date('27-05-2003', 'dd-mm-yyyy'), 'Focused optimizing model');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (186, 'Extended', to_date('12-08-1965', 'dd-mm-yyyy'), to_date('23-12-1987', 'dd-mm-yyyy'), 'Function-based reciprocal matrices');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (187, 'Cross-group', to_date('05-06-1970', 'dd-mm-yyyy'), to_date('25-10-2001', 'dd-mm-yyyy'), 'Configurable dedicated protocol');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (188, 'functionalities', to_date('17-01-1975', 'dd-mm-yyyy'), to_date('16-05-2005', 'dd-mm-yyyy'), 'Enterprise-wide impactful interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (189, 'circuit', to_date('12-06-1956', 'dd-mm-yyyy'), to_date('14-08-1991', 'dd-mm-yyyy'), 'Front-line zero administration portal');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (190, '4th generation', to_date('13-10-1973', 'dd-mm-yyyy'), to_date('25-10-2013', 'dd-mm-yyyy'), 'Realigned bi-directional toolset');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (191, 'human-resource', to_date('11-07-1976', 'dd-mm-yyyy'), to_date('26-03-1991', 'dd-mm-yyyy'), 'Future-proofed heuristic contingency');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (192, 'Graphical User Interface', to_date('14-08-1961', 'dd-mm-yyyy'), to_date('19-08-1987', 'dd-mm-yyyy'), 'Managed tangible system engine');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (193, 'leverage', to_date('30-09-1958', 'dd-mm-yyyy'), to_date('27-08-2001', 'dd-mm-yyyy'), 'Reverse-engineered zero tolerance alliance');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (194, 'Stand-alone', to_date('09-08-1968', 'dd-mm-yyyy'), to_date('01-03-1995', 'dd-mm-yyyy'), 'Sharable heuristic matrices');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (195, 'discrete', to_date('26-06-1963', 'dd-mm-yyyy'), to_date('15-07-1987', 'dd-mm-yyyy'), 'Robust zero administration capability');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (196, 'Advanced', to_date('15-09-1956', 'dd-mm-yyyy'), to_date('14-03-2012', 'dd-mm-yyyy'), 'Integrated multi-tasking toolset');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (197, 'concept', to_date('08-03-1958', 'dd-mm-yyyy'), to_date('16-01-1985', 'dd-mm-yyyy'), 'Total client-driven architecture');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (198, 'static', to_date('01-02-1957', 'dd-mm-yyyy'), to_date('08-12-2004', 'dd-mm-yyyy'), 'Compatible local area network');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (199, 'leverage', to_date('14-11-1964', 'dd-mm-yyyy'), to_date('22-10-1986', 'dd-mm-yyyy'), 'Cross-group full-range software');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (200, 'emulation', to_date('07-07-1976', 'dd-mm-yyyy'), to_date('28-01-2002', 'dd-mm-yyyy'), 'Multi-layered reciprocal firmware');
commit;
prompt 200 records committed...
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (201, 'Polarised', to_date('23-09-1967', 'dd-mm-yyyy'), to_date('07-02-1987', 'dd-mm-yyyy'), 'User-centric methodical throughput');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (202, 'actuating', to_date('24-07-1954', 'dd-mm-yyyy'), to_date('11-11-2001', 'dd-mm-yyyy'), 'Triple-buffered holistic paradigm');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (203, 'content-based', to_date('22-05-1975', 'dd-mm-yyyy'), to_date('03-04-2004', 'dd-mm-yyyy'), 'Seamless 24/7 secured line');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (204, '24/7', to_date('21-01-1967', 'dd-mm-yyyy'), to_date('19-06-1998', 'dd-mm-yyyy'), 'Switchable object-oriented throughput');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (205, 'zero administration', to_date('12-05-1952', 'dd-mm-yyyy'), to_date('12-11-1997', 'dd-mm-yyyy'), 'Cloned scalable matrix');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (206, 'Right-sized', to_date('13-08-1955', 'dd-mm-yyyy'), to_date('06-12-1992', 'dd-mm-yyyy'), 'Balanced homogeneous artificial intelligence');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (207, 'high-level', to_date('22-02-1958', 'dd-mm-yyyy'), to_date('03-05-1990', 'dd-mm-yyyy'), 'Streamlined logistical architecture');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (208, 'time-frame', to_date('30-01-1979', 'dd-mm-yyyy'), to_date('13-08-2001', 'dd-mm-yyyy'), 'Managed disintermediate flexibility');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (209, 'hardware', to_date('01-10-1977', 'dd-mm-yyyy'), to_date('28-07-2003', 'dd-mm-yyyy'), 'Function-based grid-enabled collaboration');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (210, 'asynchronous', to_date('06-06-1953', 'dd-mm-yyyy'), to_date('26-08-2005', 'dd-mm-yyyy'), 'Focused dynamic superstructure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (211, '3rd generation', to_date('11-03-1965', 'dd-mm-yyyy'), to_date('01-08-1996', 'dd-mm-yyyy'), 'Optional optimizing function');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (212, 'task-force', to_date('03-05-1972', 'dd-mm-yyyy'), to_date('07-02-2013', 'dd-mm-yyyy'), 'Managed zero administration software');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (213, 'Persistent', to_date('07-09-1959', 'dd-mm-yyyy'), to_date('09-03-1999', 'dd-mm-yyyy'), 'Proactive explicit architecture');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (214, 'superstructure', to_date('23-10-1973', 'dd-mm-yyyy'), to_date('05-05-1985', 'dd-mm-yyyy'), 'Centralized static structure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (215, 'human-resource', to_date('07-04-1951', 'dd-mm-yyyy'), to_date('13-02-1994', 'dd-mm-yyyy'), 'Networked impactful protocol');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (216, 'archive', to_date('22-04-1957', 'dd-mm-yyyy'), to_date('19-08-2014', 'dd-mm-yyyy'), 'Ameliorated optimizing hardware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (217, 'content-based', to_date('25-09-1960', 'dd-mm-yyyy'), to_date('29-01-1996', 'dd-mm-yyyy'), 'Networked hybrid function');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (218, 'project', to_date('10-12-1959', 'dd-mm-yyyy'), to_date('19-03-1994', 'dd-mm-yyyy'), 'Exclusive optimizing circuit');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (219, 'leverage', to_date('14-03-1961', 'dd-mm-yyyy'), to_date('26-08-2006', 'dd-mm-yyyy'), 'Proactive optimizing array');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (220, 'Synergized', to_date('22-04-1970', 'dd-mm-yyyy'), to_date('04-03-1987', 'dd-mm-yyyy'), 'Versatile systemic flexibility');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (221, '5th generation', to_date('25-11-1948', 'dd-mm-yyyy'), to_date('18-08-1988', 'dd-mm-yyyy'), 'Profit-focused systemic instruction set');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (222, 'concept', to_date('24-10-1972', 'dd-mm-yyyy'), to_date('19-01-1988', 'dd-mm-yyyy'), 'Automated disintermediate structure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (223, 'Triple-buffered', to_date('02-09-1956', 'dd-mm-yyyy'), to_date('15-03-1984', 'dd-mm-yyyy'), 'Robust dynamic software');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (224, 'complexity', to_date('16-06-1979', 'dd-mm-yyyy'), to_date('23-06-1998', 'dd-mm-yyyy'), 'Adaptive multi-state toolset');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (225, 'database', to_date('04-04-1964', 'dd-mm-yyyy'), to_date('21-08-1985', 'dd-mm-yyyy'), 'Integrated transitional matrix');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (226, 'success', to_date('19-01-1967', 'dd-mm-yyyy'), to_date('25-10-2006', 'dd-mm-yyyy'), 'Multi-channelled multi-tasking software');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (227, 'approach', to_date('13-02-1958', 'dd-mm-yyyy'), to_date('04-09-1987', 'dd-mm-yyyy'), 'Customer-focused heuristic task-force');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (228, 'bandwidth-monitored', to_date('26-05-1971', 'dd-mm-yyyy'), to_date('11-01-1995', 'dd-mm-yyyy'), 'Configurable mission-critical matrix');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (229, 'firmware', to_date('31-07-1959', 'dd-mm-yyyy'), to_date('13-11-1990', 'dd-mm-yyyy'), 'Progressive reciprocal hardware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (230, 'Profit-focused', to_date('07-01-1976', 'dd-mm-yyyy'), to_date('29-04-2006', 'dd-mm-yyyy'), 'Polarised zero tolerance middleware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (231, 'solution-oriented', to_date('23-02-1975', 'dd-mm-yyyy'), to_date('25-10-1987', 'dd-mm-yyyy'), 'Horizontal system-worthy application');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (232, 'hierarchy', to_date('14-11-1953', 'dd-mm-yyyy'), to_date('10-07-1992', 'dd-mm-yyyy'), 'Re-contextualized optimizing firmware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (233, 'contingency', to_date('08-08-1974', 'dd-mm-yyyy'), to_date('28-12-2001', 'dd-mm-yyyy'), 'Switchable mission-critical system');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (234, 'foreground', to_date('25-04-1960', 'dd-mm-yyyy'), to_date('16-02-1989', 'dd-mm-yyyy'), 'Diverse bi-directional strategy');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (235, 'Mandatory', to_date('12-10-1971', 'dd-mm-yyyy'), to_date('11-11-1991', 'dd-mm-yyyy'), 'Triple-buffered cohesive toolset');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (236, 'function', to_date('09-02-1970', 'dd-mm-yyyy'), to_date('28-03-2015', 'dd-mm-yyyy'), 'Streamlined value-added projection');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (237, 'disintermediate', to_date('19-06-1968', 'dd-mm-yyyy'), to_date('17-02-1986', 'dd-mm-yyyy'), 'Organic optimal task-force');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (238, 'impactful', to_date('04-01-1979', 'dd-mm-yyyy'), to_date('05-05-1995', 'dd-mm-yyyy'), 'Networked cohesive system');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (239, 'Pre-emptive', to_date('24-11-1957', 'dd-mm-yyyy'), to_date('23-03-1994', 'dd-mm-yyyy'), 'Enterprise-wide dynamic structure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (240, 'moderator', to_date('21-05-1955', 'dd-mm-yyyy'), to_date('14-06-1997', 'dd-mm-yyyy'), 'Focused transitional contingency');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (241, 'system engine', to_date('15-09-1962', 'dd-mm-yyyy'), to_date('04-06-1984', 'dd-mm-yyyy'), 'Centralized background interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (242, 'concept', to_date('11-03-1976', 'dd-mm-yyyy'), to_date('29-08-2005', 'dd-mm-yyyy'), 'Multi-layered 3rd generation system');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (243, 'emulation', to_date('20-01-1973', 'dd-mm-yyyy'), to_date('11-09-1988', 'dd-mm-yyyy'), 'Ameliorated optimizing infrastructure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (244, 'knowledge user', to_date('13-04-1954', 'dd-mm-yyyy'), to_date('06-10-1986', 'dd-mm-yyyy'), 'Innovative systemic throughput');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (245, 'superstructure', to_date('22-08-1957', 'dd-mm-yyyy'), to_date('15-07-1999', 'dd-mm-yyyy'), 'Operative 4th generation model');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (246, 'utilization', to_date('07-11-1971', 'dd-mm-yyyy'), to_date('25-01-2002', 'dd-mm-yyyy'), 'Self-enabling composite matrix');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (247, 'Multi-tiered', to_date('27-12-1968', 'dd-mm-yyyy'), to_date('18-08-1989', 'dd-mm-yyyy'), 'Universal homogeneous productivity');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (248, 'matrices', to_date('26-04-1959', 'dd-mm-yyyy'), to_date('27-01-1996', 'dd-mm-yyyy'), 'Switchable multi-state toolset');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (249, 'multi-state', to_date('12-07-1960', 'dd-mm-yyyy'), to_date('21-10-1993', 'dd-mm-yyyy'), 'Open-architected impactful software');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (250, 'Persistent', to_date('17-03-1963', 'dd-mm-yyyy'), to_date('20-04-2006', 'dd-mm-yyyy'), 'Proactive heuristic capability');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (251, 'Secured', to_date('14-10-1957', 'dd-mm-yyyy'), to_date('11-06-1988', 'dd-mm-yyyy'), 'Cloned 24 hour parallelism');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (252, 'static', to_date('31-12-1961', 'dd-mm-yyyy'), to_date('22-08-1980', 'dd-mm-yyyy'), 'Decentralized national neural-net');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (253, 'actuating', to_date('07-10-1969', 'dd-mm-yyyy'), to_date('02-12-1994', 'dd-mm-yyyy'), 'Right-sized bi-directional ability');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (254, 'bifurcated', to_date('20-08-1969', 'dd-mm-yyyy'), to_date('15-01-1994', 'dd-mm-yyyy'), 'Open-source high-level portal');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (255, 'Distributed', to_date('15-01-1963', 'dd-mm-yyyy'), to_date('08-01-2000', 'dd-mm-yyyy'), 'Front-line national analyzer');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (256, 'context-sensitive', to_date('01-02-1964', 'dd-mm-yyyy'), to_date('19-12-2020', 'dd-mm-yyyy'), 'Upgradable even-keeled hardware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (257, 'time-frame', to_date('04-01-1970', 'dd-mm-yyyy'), to_date('19-10-2023', 'dd-mm-yyyy'), 'Automated web-enabled application');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (258, 'flexibility', to_date('21-11-1957', 'dd-mm-yyyy'), to_date('16-06-1990', 'dd-mm-yyyy'), 'Enhanced intermediate task-force');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (259, 'product', to_date('01-04-1971', 'dd-mm-yyyy'), to_date('15-05-1983', 'dd-mm-yyyy'), 'Seamless bifurcated application');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (260, 'Streamlined', to_date('11-11-1969', 'dd-mm-yyyy'), to_date('30-01-1990', 'dd-mm-yyyy'), 'Organic multi-state installation');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (261, 'impactful', to_date('25-05-1980', 'dd-mm-yyyy'), to_date('23-08-2008', 'dd-mm-yyyy'), 'Streamlined homogeneous knowledge user');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (262, 'intranet', to_date('10-09-1956', 'dd-mm-yyyy'), to_date('01-02-2012', 'dd-mm-yyyy'), 'Multi-lateral stable paradigm');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (263, 'object-oriented', to_date('24-02-1953', 'dd-mm-yyyy'), to_date('10-02-2024', 'dd-mm-yyyy'), 'Synchronised 5th generation Graphic Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (264, 'directional', to_date('08-01-1953', 'dd-mm-yyyy'), to_date('11-08-2011', 'dd-mm-yyyy'), 'Synergistic composite architecture');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (265, 'local', to_date('23-05-1967', 'dd-mm-yyyy'), to_date('22-12-1985', 'dd-mm-yyyy'), 'Multi-channelled background infrastructure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (266, 'knowledge base', to_date('15-07-1961', 'dd-mm-yyyy'), to_date('10-12-2004', 'dd-mm-yyyy'), 'Integrated radical throughput');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (267, 'encompassing', to_date('10-02-1965', 'dd-mm-yyyy'), to_date('09-03-2000', 'dd-mm-yyyy'), 'Organic fresh-thinking model');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (268, 'national', to_date('21-11-1959', 'dd-mm-yyyy'), to_date('05-12-2008', 'dd-mm-yyyy'), 'Integrated bandwidth-monitored collaboration');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (269, 'real-time', to_date('14-02-1949', 'dd-mm-yyyy'), to_date('17-08-1993', 'dd-mm-yyyy'), 'Programmable composite contingency');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (270, 'open system', to_date('09-01-1969', 'dd-mm-yyyy'), to_date('01-03-2009', 'dd-mm-yyyy'), 'Focused analyzing alliance');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (271, 'website', to_date('21-07-1955', 'dd-mm-yyyy'), to_date('17-02-2009', 'dd-mm-yyyy'), 'Profound non-volatile open system');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (272, 'functionalities', to_date('06-05-1950', 'dd-mm-yyyy'), to_date('21-06-1992', 'dd-mm-yyyy'), 'Total responsive parallelism');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (273, 'Re-engineered', to_date('30-03-1974', 'dd-mm-yyyy'), to_date('28-08-1999', 'dd-mm-yyyy'), 'Future-proofed bi-directional moderator');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (274, 'utilisation', to_date('23-05-1966', 'dd-mm-yyyy'), to_date('18-11-2014', 'dd-mm-yyyy'), 'Right-sized maximized local area network');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (275, 'focus group', to_date('19-12-1964', 'dd-mm-yyyy'), to_date('29-09-1999', 'dd-mm-yyyy'), 'Robust intermediate access');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (276, 'asymmetric', to_date('30-03-1952', 'dd-mm-yyyy'), to_date('21-03-2002', 'dd-mm-yyyy'), 'Extended full-range software');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (277, 'policy', to_date('27-03-1957', 'dd-mm-yyyy'), to_date('30-05-2007', 'dd-mm-yyyy'), 'Optimized needs-based attitude');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (278, '24 hour', to_date('17-07-1972', 'dd-mm-yyyy'), to_date('06-05-2005', 'dd-mm-yyyy'), 'Synchronised grid-enabled matrix');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (279, 'throughput', to_date('14-10-1954', 'dd-mm-yyyy'), to_date('19-04-2022', 'dd-mm-yyyy'), 'Implemented high-level workforce');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (280, 'policy', to_date('08-01-1954', 'dd-mm-yyyy'), to_date('08-01-1982', 'dd-mm-yyyy'), 'Versatile mission-critical migration');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (281, 'Implemented', to_date('29-10-1968', 'dd-mm-yyyy'), to_date('23-07-2011', 'dd-mm-yyyy'), 'Versatile motivating open system');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (282, 'Cross-platform', to_date('26-01-1980', 'dd-mm-yyyy'), to_date('02-04-1984', 'dd-mm-yyyy'), 'Compatible zero defect orchestration');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (283, 'open system', to_date('22-04-1955', 'dd-mm-yyyy'), to_date('20-02-2020', 'dd-mm-yyyy'), 'Self-enabling directional monitoring');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (284, 'success', to_date('27-07-1951', 'dd-mm-yyyy'), to_date('01-07-1987', 'dd-mm-yyyy'), 'Open-architected cohesive ability');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (285, 'regional', to_date('29-07-1970', 'dd-mm-yyyy'), to_date('10-04-2023', 'dd-mm-yyyy'), 'Phased static contingency');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (286, 'analyzer', to_date('30-10-1957', 'dd-mm-yyyy'), to_date('31-12-1984', 'dd-mm-yyyy'), 'Grass-roots solution-oriented alliance');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (287, 'local area network', to_date('24-09-1955', 'dd-mm-yyyy'), to_date('03-02-1998', 'dd-mm-yyyy'), 'Re-contextualized client-driven core');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (288, '24/7', to_date('12-04-1965', 'dd-mm-yyyy'), to_date('03-03-2016', 'dd-mm-yyyy'), 'Virtual encompassing help-desk');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (289, 'upward-trending', to_date('09-05-1962', 'dd-mm-yyyy'), to_date('02-04-1983', 'dd-mm-yyyy'), 'Focused uniform benchmark');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (290, 'optimizing', to_date('07-07-1964', 'dd-mm-yyyy'), to_date('12-09-2007', 'dd-mm-yyyy'), 'Cloned national synergy');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (291, 'capacity', to_date('09-08-1952', 'dd-mm-yyyy'), to_date('30-07-2018', 'dd-mm-yyyy'), 'Self-enabling value-added circuit');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (292, 'website', to_date('22-03-1959', 'dd-mm-yyyy'), to_date('05-01-1992', 'dd-mm-yyyy'), 'Persevering actuating workforce');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (293, 'even-keeled', to_date('22-02-1964', 'dd-mm-yyyy'), to_date('10-11-1985', 'dd-mm-yyyy'), 'User-centric 24 hour framework');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (294, 'global', to_date('23-09-1976', 'dd-mm-yyyy'), to_date('01-07-1984', 'dd-mm-yyyy'), 'Multi-channelled asynchronous flexibility');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (295, 'support', to_date('07-12-1976', 'dd-mm-yyyy'), to_date('16-08-2018', 'dd-mm-yyyy'), 'Profound bi-directional hardware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (296, 'Vision-oriented', to_date('31-07-1971', 'dd-mm-yyyy'), to_date('03-08-2009', 'dd-mm-yyyy'), 'Implemented reciprocal workforce');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (297, 'background', to_date('30-04-1959', 'dd-mm-yyyy'), to_date('01-08-1981', 'dd-mm-yyyy'), 'User-friendly responsive focus group');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (298, 'extranet', to_date('19-06-1952', 'dd-mm-yyyy'), to_date('22-01-1985', 'dd-mm-yyyy'), 'Multi-lateral clear-thinking utilisation');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (299, 'cohesive', to_date('11-01-1951', 'dd-mm-yyyy'), to_date('22-09-2012', 'dd-mm-yyyy'), 'Open-architected object-oriented internet solution');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (300, 'bi-directional', to_date('04-08-1978', 'dd-mm-yyyy'), to_date('10-01-2002', 'dd-mm-yyyy'), 'Team-oriented fresh-thinking methodology');
commit;
prompt 300 records committed...
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (301, 'concept', to_date('19-04-1961', 'dd-mm-yyyy'), to_date('13-06-2005', 'dd-mm-yyyy'), 'Profit-focused client-server process improvement');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (302, 'user-facing', to_date('23-02-1962', 'dd-mm-yyyy'), to_date('20-05-2003', 'dd-mm-yyyy'), 'Polarised maximized Graphic Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (303, 'value-added', to_date('24-12-1955', 'dd-mm-yyyy'), to_date('05-03-2017', 'dd-mm-yyyy'), 'Triple-buffered needs-based workforce');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (304, 'Synchronised', to_date('06-06-1964', 'dd-mm-yyyy'), to_date('24-07-2010', 'dd-mm-yyyy'), 'Cloned contextually-based methodology');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (305, 'Business-focused', to_date('07-07-1949', 'dd-mm-yyyy'), to_date('13-11-1994', 'dd-mm-yyyy'), 'Customer-focused optimal system engine');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (306, 'local', to_date('29-12-1964', 'dd-mm-yyyy'), to_date('30-03-2009', 'dd-mm-yyyy'), 'Quality-focused system-worthy website');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (307, 'solution-oriented', to_date('14-06-1973', 'dd-mm-yyyy'), to_date('08-08-2023', 'dd-mm-yyyy'), 'Expanded zero defect workforce');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (308, 'implementation', to_date('01-07-1963', 'dd-mm-yyyy'), to_date('21-03-1999', 'dd-mm-yyyy'), 'Object-based logistical help-desk');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (309, 'help-desk', to_date('16-01-1952', 'dd-mm-yyyy'), to_date('15-10-2000', 'dd-mm-yyyy'), 'Innovative bottom-line pricing structure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (310, 'empowering', to_date('25-08-1971', 'dd-mm-yyyy'), to_date('17-11-1982', 'dd-mm-yyyy'), 'Programmable client-server throughput');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (311, 'success', to_date('23-01-1949', 'dd-mm-yyyy'), to_date('11-01-2021', 'dd-mm-yyyy'), 'Phased next generation open architecture');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (312, 'Decentralized', to_date('18-07-1979', 'dd-mm-yyyy'), to_date('16-05-1993', 'dd-mm-yyyy'), 'Monitored user-facing info-mediaries');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (313, 'reciprocal', to_date('10-11-1967', 'dd-mm-yyyy'), to_date('23-10-2015', 'dd-mm-yyyy'), 'Up-sized interactive installation');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (314, 'demand-driven', to_date('25-02-1949', 'dd-mm-yyyy'), to_date('25-11-2015', 'dd-mm-yyyy'), 'Networked intangible superstructure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (315, 'time-frame', to_date('12-12-1956', 'dd-mm-yyyy'), to_date('21-12-2017', 'dd-mm-yyyy'), 'Operative motivating workforce');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (316, 'matrix', to_date('21-01-1958', 'dd-mm-yyyy'), to_date('08-06-1981', 'dd-mm-yyyy'), 'Fundamental bi-directional service-desk');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (317, 'budgetary management', to_date('18-07-1971', 'dd-mm-yyyy'), to_date('25-08-1996', 'dd-mm-yyyy'), 'User-centric even-keeled project');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (318, 'protocol', to_date('24-03-1953', 'dd-mm-yyyy'), to_date('20-02-2000', 'dd-mm-yyyy'), 'Grass-roots user-facing hierarchy');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (319, 'Polarised', to_date('01-11-1950', 'dd-mm-yyyy'), to_date('23-05-2018', 'dd-mm-yyyy'), 'Profound intermediate pricing structure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (320, 'tangible', to_date('14-06-1967', 'dd-mm-yyyy'), to_date('02-07-2011', 'dd-mm-yyyy'), 'Optional cohesive budgetary management');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (321, 'Team-oriented', to_date('13-11-1952', 'dd-mm-yyyy'), to_date('05-01-1996', 'dd-mm-yyyy'), 'Compatible encompassing moratorium');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (322, 'Inverse', to_date('29-01-1965', 'dd-mm-yyyy'), to_date('23-03-1994', 'dd-mm-yyyy'), 'Self-enabling cohesive application');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (323, 'Customer-focused', to_date('26-09-1948', 'dd-mm-yyyy'), to_date('15-10-2012', 'dd-mm-yyyy'), 'Cross-platform uniform knowledge base');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (324, 'system engine', to_date('04-11-1958', 'dd-mm-yyyy'), to_date('14-12-1997', 'dd-mm-yyyy'), 'Optimized homogeneous portal');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (325, 'hardware', to_date('23-04-1966', 'dd-mm-yyyy'), to_date('06-09-1995', 'dd-mm-yyyy'), 'Stand-alone interactive definition');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (326, 'synergy', to_date('02-07-1972', 'dd-mm-yyyy'), to_date('26-01-2016', 'dd-mm-yyyy'), 'Re-contextualized systematic concept');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (327, '4th generation', to_date('13-04-1955', 'dd-mm-yyyy'), to_date('09-01-2015', 'dd-mm-yyyy'), 'Seamless analyzing ability');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (328, 'disintermediate', to_date('29-05-1953', 'dd-mm-yyyy'), to_date('02-05-2001', 'dd-mm-yyyy'), 'Distributed mission-critical process improvement');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (329, 'Self-enabling', to_date('19-09-1970', 'dd-mm-yyyy'), to_date('22-06-1989', 'dd-mm-yyyy'), 'Extended stable definition');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (330, 'Monitored', to_date('13-12-1967', 'dd-mm-yyyy'), to_date('28-04-2013', 'dd-mm-yyyy'), 'Operative bifurcated core');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (331, 'Operative', to_date('29-11-1963', 'dd-mm-yyyy'), to_date('09-01-1981', 'dd-mm-yyyy'), 'Streamlined value-added hierarchy');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (332, 'interactive', to_date('14-07-1962', 'dd-mm-yyyy'), to_date('20-09-1999', 'dd-mm-yyyy'), 'Horizontal bifurcated product');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (333, 'parallelism', to_date('23-05-1954', 'dd-mm-yyyy'), to_date('14-06-2011', 'dd-mm-yyyy'), 'Universal context-sensitive methodology');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (334, 'hardware', to_date('29-12-1951', 'dd-mm-yyyy'), to_date('09-06-2010', 'dd-mm-yyyy'), 'Up-sized neutral productivity');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (335, 'Fully-configurable', to_date('05-09-1964', 'dd-mm-yyyy'), to_date('08-01-1987', 'dd-mm-yyyy'), 'Mandatory tertiary pricing structure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (336, 'tertiary', to_date('22-11-1953', 'dd-mm-yyyy'), to_date('28-04-1990', 'dd-mm-yyyy'), 'Self-enabling national migration');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (337, 'budgetary management', to_date('05-04-1961', 'dd-mm-yyyy'), to_date('06-01-1998', 'dd-mm-yyyy'), 'Robust reciprocal Graphical User Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (338, 'budgetary management', to_date('15-08-1954', 'dd-mm-yyyy'), to_date('27-11-2016', 'dd-mm-yyyy'), 'Ergonomic analyzing internet solution');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (339, 'help-desk', to_date('20-07-1972', 'dd-mm-yyyy'), to_date('10-12-2004', 'dd-mm-yyyy'), 'Automated reciprocal circuit');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (340, 'Re-engineered', to_date('08-01-1955', 'dd-mm-yyyy'), to_date('23-11-2002', 'dd-mm-yyyy'), 'Proactive asynchronous service-desk');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (341, '3rd generation', to_date('20-04-1967', 'dd-mm-yyyy'), to_date('14-07-2001', 'dd-mm-yyyy'), 'Triple-buffered user-facing website');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (342, 'monitoring', to_date('04-02-1961', 'dd-mm-yyyy'), to_date('11-09-1990', 'dd-mm-yyyy'), 'De-engineered 3rd generation initiative');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (343, 'paradigm', to_date('05-07-1958', 'dd-mm-yyyy'), to_date('15-02-2021', 'dd-mm-yyyy'), 'Proactive fault-tolerant system engine');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (344, 'Optimized', to_date('13-02-1970', 'dd-mm-yyyy'), to_date('23-08-1998', 'dd-mm-yyyy'), 'Expanded multi-state process improvement');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (345, 'Automated', to_date('16-01-1950', 'dd-mm-yyyy'), to_date('02-04-2006', 'dd-mm-yyyy'), 'Re-engineered context-sensitive synergy');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (346, 'bi-directional', to_date('28-03-1965', 'dd-mm-yyyy'), to_date('15-11-2020', 'dd-mm-yyyy'), 'Synergistic non-volatile functionalities');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (347, 'Centralized', to_date('15-06-1968', 'dd-mm-yyyy'), to_date('22-09-2014', 'dd-mm-yyyy'), 'Reverse-engineered bandwidth-monitored hierarchy');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (348, 'forecast', to_date('30-10-1952', 'dd-mm-yyyy'), to_date('04-07-2006', 'dd-mm-yyyy'), 'Grass-roots incremental support');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (349, 'background', to_date('04-08-1952', 'dd-mm-yyyy'), to_date('09-06-2018', 'dd-mm-yyyy'), 'Seamless bi-directional frame');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (350, 'Optimized', to_date('25-04-1956', 'dd-mm-yyyy'), to_date('15-06-1985', 'dd-mm-yyyy'), 'Vision-oriented client-server open system');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (351, 'systemic', to_date('29-03-1966', 'dd-mm-yyyy'), to_date('12-09-2017', 'dd-mm-yyyy'), 'Profit-focused empowering migration');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (352, 'methodology', to_date('24-11-1957', 'dd-mm-yyyy'), to_date('07-09-2007', 'dd-mm-yyyy'), 'Integrated logistical concept');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (353, 'Optional', to_date('22-06-1951', 'dd-mm-yyyy'), to_date('23-04-1994', 'dd-mm-yyyy'), 'Switchable actuating archive');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (354, 'Intuitive', to_date('04-09-1962', 'dd-mm-yyyy'), to_date('17-01-1987', 'dd-mm-yyyy'), 'Universal client-server service-desk');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (355, 'circuit', to_date('10-12-1963', 'dd-mm-yyyy'), to_date('27-04-2017', 'dd-mm-yyyy'), 'Switchable client-server standardization');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (356, 'real-time', to_date('02-11-1974', 'dd-mm-yyyy'), to_date('02-08-2022', 'dd-mm-yyyy'), 'Profit-focused user-facing installation');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (357, 'exuding', to_date('26-08-1962', 'dd-mm-yyyy'), to_date('22-01-2006', 'dd-mm-yyyy'), 'Self-enabling interactive functionalities');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (358, 'scalable', to_date('26-04-1972', 'dd-mm-yyyy'), to_date('06-12-2006', 'dd-mm-yyyy'), 'Optimized reciprocal standardization');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (359, 'optimizing', to_date('14-09-1957', 'dd-mm-yyyy'), to_date('15-12-1996', 'dd-mm-yyyy'), 'Object-based encompassing superstructure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (360, 'Devolved', to_date('27-09-1967', 'dd-mm-yyyy'), to_date('01-05-2000', 'dd-mm-yyyy'), 'Reverse-engineered national strategy');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (361, 'interactive', to_date('29-09-1961', 'dd-mm-yyyy'), to_date('17-01-2021', 'dd-mm-yyyy'), 'Integrated solution-oriented productivity');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (362, 'Multi-channelled', to_date('13-09-1954', 'dd-mm-yyyy'), to_date('20-05-2022', 'dd-mm-yyyy'), 'Enhanced stable projection');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (363, 'frame', to_date('05-09-1965', 'dd-mm-yyyy'), to_date('06-12-2011', 'dd-mm-yyyy'), 'Horizontal multi-state hierarchy');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (364, 'local area network', to_date('15-08-1968', 'dd-mm-yyyy'), to_date('01-10-1996', 'dd-mm-yyyy'), 'Intuitive transitional Graphical User Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (365, 'projection', to_date('04-12-1967', 'dd-mm-yyyy'), to_date('19-11-2020', 'dd-mm-yyyy'), 'Fundamental executive data-warehouse');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (366, 'actuating', to_date('20-05-1958', 'dd-mm-yyyy'), to_date('18-11-2003', 'dd-mm-yyyy'), 'Team-oriented full-range definition');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (367, 'Inverse', to_date('22-04-1960', 'dd-mm-yyyy'), to_date('14-04-1988', 'dd-mm-yyyy'), 'Progressive encompassing project');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (368, 'matrix', to_date('24-02-1966', 'dd-mm-yyyy'), to_date('14-08-2014', 'dd-mm-yyyy'), 'Seamless value-added migration');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (369, 'forecast', to_date('12-11-1971', 'dd-mm-yyyy'), to_date('15-04-2011', 'dd-mm-yyyy'), 'Seamless fault-tolerant structure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (370, 'encompassing', to_date('27-05-1965', 'dd-mm-yyyy'), to_date('01-07-1998', 'dd-mm-yyyy'), 'Organic full-range core');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (371, 'Distributed', to_date('24-04-1972', 'dd-mm-yyyy'), to_date('26-08-2004', 'dd-mm-yyyy'), 'Profound encompassing monitoring');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (372, 'dynamic', to_date('07-08-1958', 'dd-mm-yyyy'), to_date('26-05-2021', 'dd-mm-yyyy'), 'Automated asynchronous access');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (373, 'access', to_date('17-01-1958', 'dd-mm-yyyy'), to_date('06-02-1996', 'dd-mm-yyyy'), 'Monitored logistical knowledge user');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (374, 'clear-thinking', to_date('27-01-1960', 'dd-mm-yyyy'), to_date('20-04-2006', 'dd-mm-yyyy'), 'Streamlined bifurcated system engine');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (375, 'open architecture', to_date('18-01-1975', 'dd-mm-yyyy'), to_date('05-03-1995', 'dd-mm-yyyy'), 'Upgradable actuating flexibility');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (376, 'executive', to_date('28-09-1964', 'dd-mm-yyyy'), to_date('10-04-2023', 'dd-mm-yyyy'), 'Profit-focused fault-tolerant monitoring');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (377, 'approach', to_date('25-12-1976', 'dd-mm-yyyy'), to_date('02-02-1991', 'dd-mm-yyyy'), 'Cross-platform web-enabled archive');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (378, 'Profound', to_date('02-08-1962', 'dd-mm-yyyy'), to_date('21-09-2015', 'dd-mm-yyyy'), 'Ergonomic radical functionalities');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (379, 'knowledge user', to_date('06-02-1978', 'dd-mm-yyyy'), to_date('30-12-1984', 'dd-mm-yyyy'), 'Synergistic multi-state protocol');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (380, 'zero defect', to_date('15-12-1961', 'dd-mm-yyyy'), to_date('09-04-1991', 'dd-mm-yyyy'), 'Centralized secondary service-desk');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (381, 'neutral', to_date('22-03-1964', 'dd-mm-yyyy'), to_date('26-12-1998', 'dd-mm-yyyy'), 'Intuitive actuating structure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (382, 'Dynamic', to_date('25-10-1973', 'dd-mm-yyyy'), to_date('21-06-2007', 'dd-mm-yyyy'), 'Integrated secondary array');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (383, 'orchestration', to_date('05-02-1957', 'dd-mm-yyyy'), to_date('18-10-1982', 'dd-mm-yyyy'), 'Total clear-thinking orchestration');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (384, 'Extended', to_date('02-12-1960', 'dd-mm-yyyy'), to_date('02-10-1986', 'dd-mm-yyyy'), 'Self-enabling logistical flexibility');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (385, 'encompassing', to_date('27-05-1970', 'dd-mm-yyyy'), to_date('21-06-1989', 'dd-mm-yyyy'), 'Open-source web-enabled ability');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (386, 'Proactive', to_date('23-09-1965', 'dd-mm-yyyy'), to_date('22-04-2021', 'dd-mm-yyyy'), 'Object-based web-enabled protocol');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (387, 'frame', to_date('11-05-1954', 'dd-mm-yyyy'), to_date('19-08-1984', 'dd-mm-yyyy'), 'Horizontal incremental benchmark');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (388, 'neutral', to_date('18-02-1971', 'dd-mm-yyyy'), to_date('22-03-2011', 'dd-mm-yyyy'), 'Horizontal fresh-thinking Graphic Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (389, 'application', to_date('08-09-1954', 'dd-mm-yyyy'), to_date('17-09-1983', 'dd-mm-yyyy'), 'Business-focused stable framework');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (390, 'Mandatory', to_date('23-06-1964', 'dd-mm-yyyy'), to_date('23-02-1982', 'dd-mm-yyyy'), 'Synchronised leading edge artificial intelligence');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (391, 'system engine', to_date('14-07-1966', 'dd-mm-yyyy'), to_date('16-08-1982', 'dd-mm-yyyy'), 'Secured national circuit');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (392, 'framework', to_date('06-09-1963', 'dd-mm-yyyy'), to_date('26-07-2020', 'dd-mm-yyyy'), 'Managed bi-directional pricing structure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (393, 'encryption', to_date('11-07-1965', 'dd-mm-yyyy'), to_date('15-04-2016', 'dd-mm-yyyy'), 'Optional exuding functionalities');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (394, 'application', to_date('04-04-1961', 'dd-mm-yyyy'), to_date('08-08-2023', 'dd-mm-yyyy'), 'Distributed contextually-based portal');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (395, '3rd generation', to_date('08-05-1964', 'dd-mm-yyyy'), to_date('10-09-2016', 'dd-mm-yyyy'), 'Inverse encompassing knowledge user');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (396, 'installation', to_date('19-02-1952', 'dd-mm-yyyy'), to_date('24-01-2014', 'dd-mm-yyyy'), 'Vision-oriented multi-tasking artificial intelligence');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (397, 'protocol', to_date('13-08-1972', 'dd-mm-yyyy'), to_date('10-12-1998', 'dd-mm-yyyy'), 'Total empowering projection');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (398, 'responsive', to_date('04-11-1971', 'dd-mm-yyyy'), to_date('06-09-1988', 'dd-mm-yyyy'), 'Ameliorated next generation Graphical User Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (399, 'optional', to_date('07-11-1961', 'dd-mm-yyyy'), to_date('07-06-2010', 'dd-mm-yyyy'), 'Extended web-enabled ability');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (400, 'system engine', to_date('28-05-1955', 'dd-mm-yyyy'), to_date('20-12-1998', 'dd-mm-yyyy'), 'Persevering logistical hardware');
commit;
prompt 400 records committed...
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (401, 'knowledge user', to_date('24-10-1951', 'dd-mm-yyyy'), to_date('25-11-1996', 'dd-mm-yyyy'), 'Persevering tangible archive');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (402, 'zero tolerance', to_date('07-06-1974', 'dd-mm-yyyy'), to_date('11-07-2011', 'dd-mm-yyyy'), 'Innovative dynamic flexibility');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (403, 'knowledge base', to_date('15-08-1973', 'dd-mm-yyyy'), to_date('19-10-2018', 'dd-mm-yyyy'), 'Secured full-range functionalities');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (404, 'grid-enabled', to_date('04-12-1958', 'dd-mm-yyyy'), to_date('09-07-2007', 'dd-mm-yyyy'), 'Versatile user-facing frame');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (405, 'Polarised', to_date('29-04-1966', 'dd-mm-yyyy'), to_date('05-08-2015', 'dd-mm-yyyy'), 'Self-enabling zero defect process improvement');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (406, 'customer loyalty', to_date('17-12-1958', 'dd-mm-yyyy'), to_date('21-04-2014', 'dd-mm-yyyy'), 'Multi-lateral mission-critical matrix');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (407, 'installation', to_date('09-09-1956', 'dd-mm-yyyy'), to_date('01-06-2016', 'dd-mm-yyyy'), 'Intuitive cohesive installation');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (408, 'fresh-thinking', to_date('27-06-1953', 'dd-mm-yyyy'), to_date('28-10-2001', 'dd-mm-yyyy'), 'Streamlined cohesive analyzer');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (409, 'methodology', to_date('16-06-1962', 'dd-mm-yyyy'), to_date('07-09-2006', 'dd-mm-yyyy'), 'Synchronised exuding monitoring');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (410, 'definition', to_date('27-07-1964', 'dd-mm-yyyy'), to_date('15-01-2020', 'dd-mm-yyyy'), 'Team-oriented intangible archive');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (411, 'frame', to_date('10-10-1977', 'dd-mm-yyyy'), to_date('02-09-1998', 'dd-mm-yyyy'), 'User-centric multi-state archive');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (412, 'De-engineered', to_date('01-04-1967', 'dd-mm-yyyy'), to_date('14-08-1992', 'dd-mm-yyyy'), 'Ameliorated logistical process improvement');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (413, 'Re-engineered', to_date('20-11-1958', 'dd-mm-yyyy'), to_date('19-09-2011', 'dd-mm-yyyy'), 'Managed 3rd generation projection');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (414, 'success', to_date('04-06-1977', 'dd-mm-yyyy'), to_date('20-10-2005', 'dd-mm-yyyy'), 'Triple-buffered non-volatile hardware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (415, 'approach', to_date('22-09-1962', 'dd-mm-yyyy'), to_date('26-01-1988', 'dd-mm-yyyy'), 'Virtual object-oriented implementation');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (416, 'Business-focused', to_date('20-05-1961', 'dd-mm-yyyy'), to_date('05-06-2002', 'dd-mm-yyyy'), 'Networked bi-directional open architecture');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (417, 'clear-thinking', to_date('05-09-1960', 'dd-mm-yyyy'), to_date('15-08-1984', 'dd-mm-yyyy'), 'Business-focused uniform solution');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (418, 'clear-thinking', to_date('23-01-1953', 'dd-mm-yyyy'), to_date('02-10-2005', 'dd-mm-yyyy'), 'Secured fresh-thinking frame');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (419, 'fault-tolerant', to_date('07-11-1952', 'dd-mm-yyyy'), to_date('11-04-1994', 'dd-mm-yyyy'), 'Organic mission-critical toolset');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (420, 'monitoring', to_date('07-04-1964', 'dd-mm-yyyy'), to_date('27-04-1989', 'dd-mm-yyyy'), 'Devolved solution-oriented portal');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (421, 'Grid-enabled', to_date('21-07-1953', 'dd-mm-yyyy'), to_date('22-06-2012', 'dd-mm-yyyy'), 'Polarised scalable process improvement');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (422, 'Programmable', to_date('02-04-1965', 'dd-mm-yyyy'), to_date('09-04-1997', 'dd-mm-yyyy'), 'Grass-roots heuristic access');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (423, 'installation', to_date('19-11-1955', 'dd-mm-yyyy'), to_date('18-10-2015', 'dd-mm-yyyy'), 'Robust user-centric paradigm');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (424, 'central', to_date('07-09-1950', 'dd-mm-yyyy'), to_date('04-01-2000', 'dd-mm-yyyy'), 'Self-enabling needs-based functionalities');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (425, 'responsive', to_date('14-04-1973', 'dd-mm-yyyy'), to_date('02-09-1992', 'dd-mm-yyyy'), 'Customer-focused homogeneous Graphic Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (426, 'artificial intelligence', to_date('25-10-1951', 'dd-mm-yyyy'), to_date('13-06-1981', 'dd-mm-yyyy'), 'Seamless object-oriented installation');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (427, 'frame', to_date('20-01-1970', 'dd-mm-yyyy'), to_date('11-06-1985', 'dd-mm-yyyy'), 'Inverse encompassing hardware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (428, 'internet solution', to_date('06-01-1951', 'dd-mm-yyyy'), to_date('27-04-2005', 'dd-mm-yyyy'), 'Switchable zero administration definition');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (429, 'static', to_date('04-06-1970', 'dd-mm-yyyy'), to_date('16-08-2010', 'dd-mm-yyyy'), 'Optimized 24/7 functionalities');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (430, 'grid-enabled', to_date('08-06-1966', 'dd-mm-yyyy'), to_date('24-11-2011', 'dd-mm-yyyy'), 'Fundamental stable functionalities');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (431, 'Re-contextualized', to_date('19-11-1960', 'dd-mm-yyyy'), to_date('21-12-1988', 'dd-mm-yyyy'), 'Progressive user-facing architecture');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (432, 'system engine', to_date('18-11-1974', 'dd-mm-yyyy'), to_date('16-04-1994', 'dd-mm-yyyy'), 'Object-based fresh-thinking moratorium');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (433, 'info-mediaries', to_date('23-02-1972', 'dd-mm-yyyy'), to_date('17-02-1985', 'dd-mm-yyyy'), 'Stand-alone actuating concept');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (434, 'bi-directional', to_date('10-12-1953', 'dd-mm-yyyy'), to_date('23-02-1986', 'dd-mm-yyyy'), 'Profound bi-directional budgetary management');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (435, 'fresh-thinking', to_date('09-02-1958', 'dd-mm-yyyy'), to_date('06-12-2017', 'dd-mm-yyyy'), 'Integrated secondary analyzer');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (436, 'definition', to_date('12-04-1951', 'dd-mm-yyyy'), to_date('20-04-1988', 'dd-mm-yyyy'), 'Synchronised intermediate orchestration');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (437, 'non-volatile', to_date('10-04-1950', 'dd-mm-yyyy'), to_date('11-02-2005', 'dd-mm-yyyy'), 'Reverse-engineered client-server hardware');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (438, 'local area network', to_date('05-12-1976', 'dd-mm-yyyy'), to_date('20-05-2021', 'dd-mm-yyyy'), 'Secured asymmetric project');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (439, 'Horizontal', to_date('02-04-1963', 'dd-mm-yyyy'), to_date('04-02-2021', 'dd-mm-yyyy'), 'Virtual actuating moratorium');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (440, 'concept', to_date('20-11-1972', 'dd-mm-yyyy'), to_date('27-02-2006', 'dd-mm-yyyy'), 'Cross-platform upward-trending installation');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (441, 'model', to_date('16-10-1966', 'dd-mm-yyyy'), to_date('18-11-1991', 'dd-mm-yyyy'), 'Self-enabling global help-desk');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (442, 'Decentralized', to_date('18-04-1956', 'dd-mm-yyyy'), to_date('28-12-1999', 'dd-mm-yyyy'), 'Cross-platform object-oriented encryption');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (443, 'user-facing', to_date('08-12-1970', 'dd-mm-yyyy'), to_date('15-06-2001', 'dd-mm-yyyy'), 'Optimized even-keeled project');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (444, 'Inverse', to_date('17-02-1961', 'dd-mm-yyyy'), to_date('19-01-1982', 'dd-mm-yyyy'), 'Decentralized encompassing benchmark');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (445, 'Reverse-engineered', to_date('19-07-1955', 'dd-mm-yyyy'), to_date('26-04-1986', 'dd-mm-yyyy'), 'Optional mobile structure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (446, 'central', to_date('16-05-1972', 'dd-mm-yyyy'), to_date('05-11-2008', 'dd-mm-yyyy'), 'Synergistic systematic structure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (447, 'Innovative', to_date('18-06-1965', 'dd-mm-yyyy'), to_date('11-09-1981', 'dd-mm-yyyy'), 'Secured reciprocal success');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (448, 'fresh-thinking', to_date('08-09-1972', 'dd-mm-yyyy'), to_date('05-11-2013', 'dd-mm-yyyy'), 'Secured zero tolerance initiative');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (449, 'Monitored', to_date('17-02-1974', 'dd-mm-yyyy'), to_date('22-08-1986', 'dd-mm-yyyy'), 'Cross-platform full-range website');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (450, 'forecast', to_date('22-06-1961', 'dd-mm-yyyy'), to_date('17-09-1992', 'dd-mm-yyyy'), 'Synergistic exuding functionalities');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (451, 'dynamic', to_date('24-09-1960', 'dd-mm-yyyy'), to_date('04-06-2022', 'dd-mm-yyyy'), 'Innovative logistical methodology');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (452, 'strategy', to_date('24-02-1964', 'dd-mm-yyyy'), to_date('25-08-2020', 'dd-mm-yyyy'), 'Multi-lateral heuristic infrastructure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (453, 'neutral', to_date('20-12-1950', 'dd-mm-yyyy'), to_date('13-03-1997', 'dd-mm-yyyy'), 'Networked interactive benchmark');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (454, 'internet solution', to_date('04-05-1967', 'dd-mm-yyyy'), to_date('05-06-2023', 'dd-mm-yyyy'), 'Horizontal asynchronous flexibility');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (455, 'system-worthy', to_date('26-12-1960', 'dd-mm-yyyy'), to_date('28-11-1982', 'dd-mm-yyyy'), 'Right-sized zero defect system engine');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (456, 'Vision-oriented', to_date('01-08-1965', 'dd-mm-yyyy'), to_date('27-12-2014', 'dd-mm-yyyy'), 'Business-focused upward-trending functionalities');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (457, 'real-time', to_date('29-04-1971', 'dd-mm-yyyy'), to_date('20-01-2008', 'dd-mm-yyyy'), 'Mandatory systematic approach');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (458, 'bi-directional', to_date('01-07-1954', 'dd-mm-yyyy'), to_date('14-06-1997', 'dd-mm-yyyy'), 'Open-source mission-critical monitoring');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (459, 'Horizontal', to_date('11-09-1964', 'dd-mm-yyyy'), to_date('07-08-2001', 'dd-mm-yyyy'), 'Polarised human-resource knowledge user');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (460, 'full-range', to_date('01-04-1965', 'dd-mm-yyyy'), to_date('27-08-1993', 'dd-mm-yyyy'), 'Innovative zero defect open architecture');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (461, 'time-frame', to_date('10-07-1955', 'dd-mm-yyyy'), to_date('14-07-2015', 'dd-mm-yyyy'), 'Progressive fault-tolerant orchestration');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (462, 'synergy', to_date('07-07-1973', 'dd-mm-yyyy'), to_date('08-10-2002', 'dd-mm-yyyy'), 'Profit-focused transitional ability');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (463, 'info-mediaries', to_date('13-12-1975', 'dd-mm-yyyy'), to_date('10-08-1997', 'dd-mm-yyyy'), 'Right-sized encompassing open architecture');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (464, 'superstructure', to_date('19-09-1960', 'dd-mm-yyyy'), to_date('22-04-2003', 'dd-mm-yyyy'), 'Vision-oriented non-volatile functionalities');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (465, 'installation', to_date('20-12-1953', 'dd-mm-yyyy'), to_date('10-04-2023', 'dd-mm-yyyy'), 'Cross-platform exuding success');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (466, 'Interactive', to_date('12-05-1953', 'dd-mm-yyyy'), to_date('13-06-2023', 'dd-mm-yyyy'), 'Cross-platform composite protocol');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (467, 'info-mediaries', to_date('05-10-1955', 'dd-mm-yyyy'), to_date('25-06-1988', 'dd-mm-yyyy'), 'Ergonomic radical solution');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (468, 'multi-tasking', to_date('06-08-1974', 'dd-mm-yyyy'), to_date('08-12-2001', 'dd-mm-yyyy'), 'Right-sized context-sensitive strategy');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (469, 'success', to_date('15-10-1960', 'dd-mm-yyyy'), to_date('20-07-2005', 'dd-mm-yyyy'), 'Business-focused needs-based support');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (470, 'asymmetric', to_date('22-11-1951', 'dd-mm-yyyy'), to_date('01-04-2007', 'dd-mm-yyyy'), 'Re-contextualized mobile encryption');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (471, 'Proactive', to_date('23-12-1963', 'dd-mm-yyyy'), to_date('09-10-1994', 'dd-mm-yyyy'), 'Function-based maximized process improvement');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (472, 'help-desk', to_date('21-11-1956', 'dd-mm-yyyy'), to_date('04-10-2022', 'dd-mm-yyyy'), 'Balanced interactive extranet');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (473, 'interactive', to_date('12-12-1951', 'dd-mm-yyyy'), to_date('08-06-2017', 'dd-mm-yyyy'), 'Multi-lateral executive definition');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (474, 'object-oriented', to_date('27-08-1964', 'dd-mm-yyyy'), to_date('05-02-2015', 'dd-mm-yyyy'), 'Decentralized 5th generation support');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (475, 'Inverse', to_date('19-01-1955', 'dd-mm-yyyy'), to_date('09-06-2014', 'dd-mm-yyyy'), 'Reactive analyzing system engine');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (476, 'context-sensitive', to_date('23-09-1957', 'dd-mm-yyyy'), to_date('11-12-1997', 'dd-mm-yyyy'), 'Object-based non-volatile attitude');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (477, '3rd generation', to_date('28-05-1974', 'dd-mm-yyyy'), to_date('27-02-1990', 'dd-mm-yyyy'), 'Monitored contextually-based Graphic Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (478, 'Self-enabling', to_date('17-09-1974', 'dd-mm-yyyy'), to_date('26-11-1985', 'dd-mm-yyyy'), 'Implemented upward-trending array');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (479, 'grid-enabled', to_date('17-10-1964', 'dd-mm-yyyy'), to_date('15-05-1993', 'dd-mm-yyyy'), 'Public-key multi-state solution');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (480, 'array', to_date('22-04-1955', 'dd-mm-yyyy'), to_date('18-01-1987', 'dd-mm-yyyy'), 'Synergistic 6th generation neural-net');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (481, 'tertiary', to_date('19-11-1964', 'dd-mm-yyyy'), to_date('09-04-2016', 'dd-mm-yyyy'), 'Monitored even-keeled functionalities');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (482, 'architecture', to_date('11-04-1965', 'dd-mm-yyyy'), to_date('18-01-1991', 'dd-mm-yyyy'), 'Polarised dynamic Graphical User Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (483, 'tertiary', to_date('28-07-1952', 'dd-mm-yyyy'), to_date('11-03-1989', 'dd-mm-yyyy'), 'Ergonomic exuding methodology');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (484, 'system engine', to_date('13-09-1968', 'dd-mm-yyyy'), to_date('08-08-1986', 'dd-mm-yyyy'), 'Expanded motivating extranet');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (485, 'artificial intelligence', to_date('13-07-1968', 'dd-mm-yyyy'), to_date('20-02-1989', 'dd-mm-yyyy'), 'Monitored optimizing standardization');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (486, 'zero defect', to_date('09-06-1955', 'dd-mm-yyyy'), to_date('08-06-1982', 'dd-mm-yyyy'), 'Ameliorated value-added Graphic Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (487, 'global', to_date('15-05-1964', 'dd-mm-yyyy'), to_date('26-12-2004', 'dd-mm-yyyy'), 'Automated needs-based monitoring');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (488, 'definition', to_date('16-08-1966', 'dd-mm-yyyy'), to_date('21-08-1987', 'dd-mm-yyyy'), 'User-centric context-sensitive projection');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (489, 'fault-tolerant', to_date('28-06-1961', 'dd-mm-yyyy'), to_date('26-05-1988', 'dd-mm-yyyy'), 'Ameliorated stable support');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (490, 'knowledge user', to_date('16-11-1951', 'dd-mm-yyyy'), to_date('24-06-2015', 'dd-mm-yyyy'), 'Synergistic encompassing migration');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (491, 'Optimized', to_date('01-12-1960', 'dd-mm-yyyy'), to_date('22-11-1985', 'dd-mm-yyyy'), 'Profit-focused logistical Graphic Interface');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (492, 'attitude', to_date('19-01-1950', 'dd-mm-yyyy'), to_date('13-08-1990', 'dd-mm-yyyy'), 'Inverse full-range productivity');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (493, 'Reactive', to_date('27-10-1966', 'dd-mm-yyyy'), to_date('19-07-2006', 'dd-mm-yyyy'), 'Cross-platform empowering neural-net');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (494, 'help-desk', to_date('13-12-1952', 'dd-mm-yyyy'), to_date('05-11-2023', 'dd-mm-yyyy'), 'Decentralized analyzing definition');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (495, 'Dynamic', to_date('25-02-1961', 'dd-mm-yyyy'), to_date('28-03-2020', 'dd-mm-yyyy'), 'Robust tangible moratorium');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (496, 'local', to_date('02-04-1962', 'dd-mm-yyyy'), to_date('27-05-2007', 'dd-mm-yyyy'), 'Managed logistical website');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (497, 'throughput', to_date('10-04-1959', 'dd-mm-yyyy'), to_date('12-10-1998', 'dd-mm-yyyy'), 'Re-contextualized asynchronous support');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (498, 'intangible', to_date('15-11-1960', 'dd-mm-yyyy'), to_date('10-06-1986', 'dd-mm-yyyy'), 'Profound tertiary pricing structure');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (499, 'analyzer', to_date('28-06-1959', 'dd-mm-yyyy'), to_date('05-09-1983', 'dd-mm-yyyy'), 'Intuitive stable artificial intelligence');
insert into OPERATIONS_ (o_id, o_name, start_date, end_date, objective)
values (500, 'Centralized', to_date('11-02-1952', 'dd-mm-yyyy'), to_date('06-02-2015', 'dd-mm-yyyy'), 'Operative encompassing ability');
commit;
prompt 500 records loaded
prompt Loading ASSIGNED_OPERATION...
insert into ASSIGNED_OPERATION (a_id, o_id)
values (3, 25);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (5, 275);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (9, 232);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (11, 178);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (11, 338);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (15, 67);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (15, 102);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (17, 249);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (17, 382);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (19, 307);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (19, 349);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (19, 382);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (21, 235);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (21, 244);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (27, 335);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (31, 76);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (31, 132);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (31, 227);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (31, 403);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (35, 481);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (37, 103);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (45, 331);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (47, 32);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (47, 299);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (57, 45);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (57, 137);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (59, 7);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (59, 81);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (61, 317);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (61, 495);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (67, 47);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (67, 102);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (69, 475);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (71, 230);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (71, 274);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (73, 78);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (73, 307);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (77, 46);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (77, 208);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (77, 350);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (79, 214);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (81, 12);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (81, 184);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (81, 284);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (81, 461);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (85, 152);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (85, 358);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (91, 111);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (93, 133);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (93, 266);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (95, 492);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (97, 242);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (97, 339);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (99, 450);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (101, 46);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (101, 56);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (101, 61);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (107, 106);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (111, 150);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (113, 199);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (119, 224);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (123, 139);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (125, 44);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (127, 339);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (127, 465);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (131, 268);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (131, 347);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (131, 382);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (133, 248);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (133, 272);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (135, 283);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (135, 406);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (139, 59);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (139, 67);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (139, 325);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (141, 494);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (143, 91);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (143, 452);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (143, 492);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (145, 205);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (147, 203);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (149, 215);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (149, 281);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (151, 168);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (155, 372);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (157, 60);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (159, 58);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (159, 231);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (161, 182);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (161, 184);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (161, 229);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (163, 190);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (163, 209);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (163, 254);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (165, 189);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (167, 34);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (169, 384);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (171, 13);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (183, 236);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (191, 492);
commit;
prompt 100 records committed...
insert into ASSIGNED_OPERATION (a_id, o_id)
values (193, 424);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (195, 158);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (197, 40);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (197, 226);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (199, 53);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (199, 104);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (199, 325);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (199, 343);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (201, 230);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (205, 414);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (207, 73);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (209, 100);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (209, 138);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (213, 74);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (213, 298);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (215, 336);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (215, 488);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (217, 430);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (219, 387);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (219, 423);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (219, 430);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (221, 1);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (223, 40);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (231, 292);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (233, 483);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (243, 414);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (243, 420);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (245, 109);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (247, 122);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (247, 162);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (247, 491);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (249, 437);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (251, 272);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (253, 121);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (253, 313);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (257, 154);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (257, 432);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (259, 52);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (259, 75);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (259, 470);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (259, 473);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (261, 65);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (261, 391);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (261, 458);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (263, 221);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (263, 253);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (263, 337);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (265, 31);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (267, 368);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (267, 443);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (273, 196);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (273, 202);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (275, 346);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (277, 234);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (281, 497);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (283, 230);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (283, 376);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (285, 206);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (285, 285);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (285, 307);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (291, 97);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (291, 405);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (295, 391);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (301, 93);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (303, 183);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (303, 304);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (307, 343);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (311, 287);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (311, 369);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (313, 115);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (317, 296);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (317, 489);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (319, 349);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (319, 500);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (327, 25);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (329, 494);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (331, 296);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (333, 452);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (341, 6);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (343, 37);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (343, 373);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (349, 34);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (353, 129);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (355, 351);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (363, 228);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (363, 392);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (363, 479);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (365, 17);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (365, 253);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (367, 345);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (369, 258);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (371, 210);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (371, 399);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (375, 165);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (377, 145);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (377, 248);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (379, 349);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (385, 34);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (385, 47);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (387, 16);
commit;
prompt 200 records committed...
insert into ASSIGNED_OPERATION (a_id, o_id)
values (389, 356);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (391, 457);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (395, 11);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (395, 132);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (397, 296);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (397, 431);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (399, 390);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (403, 214);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (405, 153);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (409, 320);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (411, 12);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (411, 318);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (411, 358);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (415, 81);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (421, 234);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (425, 18);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (425, 142);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (425, 415);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (435, 140);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (435, 390);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (437, 492);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (445, 287);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (445, 466);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (447, 156);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (453, 210);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (453, 476);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (457, 72);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (461, 64);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (463, 244);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (467, 316);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (467, 322);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (471, 181);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (475, 28);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (475, 179);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (475, 261);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (475, 267);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (475, 279);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (475, 330);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (477, 36);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (477, 216);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (477, 447);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (481, 254);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (487, 142);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (487, 260);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (487, 273);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (487, 423);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (489, 414);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (489, 482);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (491, 182);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (493, 1);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (497, 405);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (497, 474);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (501, 306);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (505, 219);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (509, 26);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (511, 37);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (515, 380);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (517, 143);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (519, 154);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (519, 343);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (519, 347);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (521, 329);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (531, 81);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (531, 125);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (533, 32);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (533, 104);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (533, 384);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (539, 384);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (541, 273);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (543, 43);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (543, 161);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (547, 138);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (549, 449);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (551, 325);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (555, 358);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (561, 100);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (561, 400);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (561, 473);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (563, 135);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (563, 168);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (563, 264);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (565, 304);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (565, 431);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (569, 28);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (573, 286);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (577, 4);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (577, 85);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (587, 447);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (587, 451);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (589, 292);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (593, 100);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (593, 285);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (593, 430);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (601, 244);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (603, 119);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (605, 305);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (609, 126);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (611, 42);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (611, 184);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (611, 222);
commit;
prompt 300 records committed...
insert into ASSIGNED_OPERATION (a_id, o_id)
values (613, 68);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (615, 84);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (615, 127);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (615, 142);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (615, 477);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (617, 370);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (619, 366);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (623, 243);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (623, 304);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (625, 9);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (625, 111);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (627, 62);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (633, 170);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (633, 353);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (637, 198);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (641, 466);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (643, 405);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (647, 443);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (649, 58);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (649, 203);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (651, 100);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (653, 37);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (655, 45);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (655, 233);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (661, 15);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (661, 51);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (661, 288);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (661, 369);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (663, 450);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (665, 279);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (667, 326);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (667, 355);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (667, 470);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (669, 113);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (669, 326);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (673, 243);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (675, 202);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (675, 307);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (685, 129);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (685, 365);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (687, 26);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (687, 205);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (687, 256);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (689, 18);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (689, 175);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (691, 366);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (693, 2);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (693, 404);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (695, 476);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (697, 467);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (699, 374);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (701, 256);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (701, 466);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (703, 151);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (705, 346);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (707, 87);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (709, 59);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (711, 243);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (713, 94);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (713, 202);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (715, 445);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (717, 251);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (719, 306);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (721, 104);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (721, 372);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (725, 431);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (731, 73);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (733, 331);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (735, 147);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (739, 74);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (741, 132);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (745, 297);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (751, 458);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (753, 310);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (755, 162);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (757, 98);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (759, 101);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (761, 353);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (765, 275);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (767, 22);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (767, 148);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (767, 281);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (767, 417);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (771, 454);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (775, 428);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (777, 483);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (781, 233);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (781, 451);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (785, 418);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (787, 114);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (789, 248);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (791, 114);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (793, 109);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (799, 233);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (803, 74);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (805, 287);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (807, 107);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (807, 385);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (811, 214);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (815, 12);
commit;
prompt 400 records committed...
insert into ASSIGNED_OPERATION (a_id, o_id)
values (815, 42);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (817, 312);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (819, 206);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (819, 436);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (821, 29);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (821, 328);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (823, 1);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (825, 113);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (825, 244);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (827, 129);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (829, 156);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (829, 220);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (829, 243);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (831, 107);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (831, 425);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (833, 155);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (835, 279);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (835, 364);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (839, 175);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (841, 369);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (843, 68);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (843, 416);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (845, 430);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (847, 459);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (851, 305);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (851, 463);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (853, 107);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (855, 315);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (859, 106);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (859, 324);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (859, 392);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (859, 473);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (861, 266);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (863, 70);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (863, 226);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (863, 413);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (865, 489);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (867, 154);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (869, 202);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (873, 342);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (875, 2);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (877, 105);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (879, 131);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (883, 28);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (883, 425);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (887, 297);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (887, 497);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (893, 41);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (895, 25);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (895, 150);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (895, 236);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (897, 100);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (899, 182);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (899, 381);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (901, 400);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (901, 456);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (903, 22);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (903, 27);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (905, 485);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (909, 110);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (913, 116);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (913, 139);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (917, 49);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (917, 317);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (919, 333);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (923, 401);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (929, 92);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (929, 101);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (933, 142);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (935, 55);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (935, 259);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (937, 199);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (937, 312);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (937, 375);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (937, 458);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (939, 484);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (941, 245);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (941, 423);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (943, 172);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (945, 118);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (945, 474);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (949, 263);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (949, 315);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (951, 101);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (957, 169);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (959, 253);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (961, 395);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (963, 246);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (965, 57);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (965, 333);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (969, 192);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (973, 415);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (979, 321);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (985, 59);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (987, 364);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (989, 290);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (991, 283);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (991, 324);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (993, 87);
insert into ASSIGNED_OPERATION (a_id, o_id)
values (999, 237);
commit;
prompt 500 records loaded
prompt Loading ROLE_...
insert into ROLE_ (r_id, r_name, description_)
values (1, 'AU-84', 'Gigabyte GA-7VAXP AMD Motherboard. VIA KT400 RAID ATA133 with DDR support');
insert into ROLE_ (r_id, r_name, description_)
values (2, 'HT-73', 'Combo Intel P4 1.6Ghz (Box CPU)+ Biostar U8668 m/b (478pin)CPU & Fan Support SD.');
insert into ROLE_ (r_id, r_name, description_)
values (3, 'EV-88', 'Combo Intel P4 2.4Ghz retail CPU + Gigabyte GA-8IE800 M/B + Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (4, 'OD-24', 'Biostar M7VKD AMD 1Ghz Duron + Cooler Master Fan');
insert into ROLE_ (r_id, r_name, description_)
values (5, 'LR-89', 'AMD XP 2700+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (6, 'VN-51', 'Allied 300watt Powersupply; Intel P4 and AMD XP and Barton approved.');
insert into ROLE_ (r_id, r_name, description_)
values (7, 'SG-82', 'AMD Duron 1.2MHz & Biostar M7VIG-Pro MB w/ 312J case. Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (8, 'QK-28', 'Benwin S54 Surround Sound Speakers.');
insert into ROLE_ (r_id, r_name, description_)
values (9, 'PV-32', 'AMD XP 2200+ CPU Oem');
insert into ROLE_ (r_id, r_name, description_)
values (10, 'MO-34', 'AOC 17" Monitor 7FSLK .25mm Dot Pitch TureFlat');
insert into ROLE_ (r_id, r_name, description_)
values (11, 'RI-93', 'Intel Pentium4 1.6Ghz & Biostar M7TDB MB w/ 313M Case.');
insert into ROLE_ (r_id, r_name, description_)
values (12, 'UM-67', 'Intel P4 1;6Ghz Bare Bone CPU & Fan;');
insert into ROLE_ (r_id, r_name, description_)
values (13, 'VM-28', 'Combo AMD XP 2500+ Biostar M7VIK Skt A MotherBoard; KT400.');
insert into ROLE_ (r_id, r_name, description_)
values (14, 'EG-33', 'Intel P4 1;6Ghz Box CPU (478pin)(256KB L2 Cache)');
insert into ROLE_ (r_id, r_name, description_)
values (15, 'XI-15', 'AMD 1.1Ghz BareBone System W/Free M');
insert into ROLE_ (r_id, r_name, description_)
values (16, 'LD-99', 'Logitech Cordless Optical Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (17, 'VB-81', 'Combo AMD XP 2100+ (Box CPU)Gigabyte GA-7VKML M/B + Fan');
insert into ROLE_ (r_id, r_name, description_)
values (18, 'HI-18', 'Linksys Wireless PCI card (WMP11)');
insert into ROLE_ (r_id, r_name, description_)
values (19, 'UQ-11', 'Logitech Optical Mouse');
insert into ROLE_ (r_id, r_name, description_)
values (20, 'HB-76', 'Combo Intel P4 1.6Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (21, 'AH-25', '14"/15" Filter Screen');
insert into ROLE_ (r_id, r_name, description_)
values (22, 'EF-29', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 IntelÂ®845E Chipset.');
insert into ROLE_ (r_id, r_name, description_)
values (23, 'LL-42', 'Linksys Wireless PCI card (WMP11)');
insert into ROLE_ (r_id, r_name, description_)
values (24, 'OS-61', 'Combo Intel P4 2.0ghz Gigabyte GA-8LD533 m/b + fan.');
insert into ROLE_ (r_id, r_name, description_)
values (25, 'SG-86', 'AMD XP 1800+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (26, 'FW-56', '312B ATX Case with 300W P4/P3/AMD PS. USB Ready.');
insert into ROLE_ (r_id, r_name, description_)
values (27, 'HA-68', 'Intel P4 2.4 Ghz CPU BOX (533Mhz)');
insert into ROLE_ (r_id, r_name, description_)
values (28, 'GE-86', 'AMD XP 2500+ FBS 333 & GigaByte GA-7N400L MB w/ 313M case. Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (29, 'BH-94', 'AMD Duron 1.3Ghz & Gigabyte GA-7VKML MB w/ 312J Color Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (30, 'VA-92', '312D ATX color case(translucent blue) with 300Watt P4/P3/AMD Support PowerSupply.');
insert into ROLE_ (r_id, r_name, description_)
values (31, 'PC-38', 'Mitsumi PS/2 Net scroll 5 button mouse');
insert into ROLE_ (r_id, r_name, description_)
values (32, 'HK-25', 'Combo AMD XP 1900+ cpu Gigabyte GA-7ZXE Motherboard + Fan');
insert into ROLE_ (r_id, r_name, description_)
values (33, 'DW-66', 'Intel D845WN 478Pin SDRAM retail Box');
insert into ROLE_ (r_id, r_name, description_)
values (34, 'GE-87', 'ADS 2 Port USB Pci card');
insert into ROLE_ (r_id, r_name, description_)
values (35, 'WM-98', 'AMD XP 2100+ (Box) & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (36, 'QW-74', 'Mitsumi 52x 40 x 48 CD-RW');
insert into ROLE_ (r_id, r_name, description_)
values (37, 'XN-36', 'Intel Pentium4 1.9ghz & Biostar U8668 MB w/ 313N Case. W/ Free CNR 56k & PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (38, 'SP-62', 'GeForceFX 5200 128MB DDR (Light Version) DVI + TV-out and software DVD.');
insert into ROLE_ (r_id, r_name, description_)
values (39, 'FZ-21', 'Seagate 20GB ATA100 5400RPM.');
insert into ROLE_ (r_id, r_name, description_)
values (40, 'TQ-48', '128Mb SDRAM PC133 Micron;Lifetime Warranty! We offer a 100% Compatibility Guarantee. 7.5ns PC133');
insert into ROLE_ (r_id, r_name, description_)
values (41, 'FN-84', '512Mb DDR PC2100 Kingston');
insert into ROLE_ (r_id, r_name, description_)
values (42, 'UD-82', 'Mitsumi 48x 12 x 40 CD-RW');
insert into ROLE_ (r_id, r_name, description_)
values (43, 'LL-23', 'ASUS P4C800 Deluxe Skt 478 Intel 875P (800MHZ FSB).');
insert into ROLE_ (r_id, r_name, description_)
values (44, 'KU-24', 'Intel D845WN 478Pin SDRAM retail Box');
insert into ROLE_ (r_id, r_name, description_)
values (45, 'TP-74', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7VA M/B(W/8X AGP;DDR333 up to 3GB/ATA133 ) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (46, 'WL-62', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Intel D845PESV P4 M/B Socket 478.');
insert into ROLE_ (r_id, r_name, description_)
values (47, 'TQ-37', 'Combo Intel Celeron 1.7ghz Gigabyte GA-8LD533 m/b onboard sound;video ;10/100 Lan USB2.0 + fan.');
insert into ROLE_ (r_id, r_name, description_)
values (48, 'KP-84', 'Cooler Master DP5-6J31C AMD Approved HeatSync.');
insert into ROLE_ (r_id, r_name, description_)
values (49, 'KI-14', 'Biostar M7VKD AMD 1Ghz Duron + Cooler Master Fan');
insert into ROLE_ (r_id, r_name, description_)
values (50, 'FH-13', 'CoolerMaster Thermal Compound Premium PTK-001.');
insert into ROLE_ (r_id, r_name, description_)
values (51, 'FJ-91', 'Combo AMD XP 2100+ CPU ASUS A7N8X Deluxe NVIDIA Force2');
insert into ROLE_ (r_id, r_name, description_)
values (52, 'SY-85', 'AMDXP2200/128M/30G Black Complete System.');
insert into ROLE_ (r_id, r_name, description_)
values (53, 'OS-69', 'AMDXP2000+ Box BiostarM7VIG-Pro');
insert into ROLE_ (r_id, r_name, description_)
values (54, 'GZ-55', 'GA-7VT600-L VIA KT600 chipset.');
insert into ROLE_ (r_id, r_name, description_)
values (55, 'RR-17', 'Desk Top Microphone');
insert into ROLE_ (r_id, r_name, description_)
values (56, 'ET-54', 'Cooler Master ATA133 Rounded IDE Cable . PTC-A18');
insert into ROLE_ (r_id, r_name, description_)
values (57, 'UE-11', 'AMD XP 1800+ & Biostar M7VIG-Pro MB w/ 313M case. Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (58, 'JS-94', 'AMD XP 2500+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (59, 'AG-17', 'Combo AMD XP 2100+ CPU; Gigabyte GA-7VA M/B.');
insert into ROLE_ (r_id, r_name, description_)
values (60, 'ZR-37', '128Mb DDRam PC2100 Kingston');
insert into ROLE_ (r_id, r_name, description_)
values (61, 'MZ-69', 'Fast Ethernet 10/100 8 port switching hub');
insert into ROLE_ (r_id, r_name, description_)
values (62, 'GU-61', 'Black LG Electronics CD-RW 48x12x48x / DVD 16x Combo Drive.');
insert into ROLE_ (r_id, r_name, description_)
values (63, 'IU-64', 'AMD 1.3Ghz BareBone System Free Mouse');
insert into ROLE_ (r_id, r_name, description_)
values (64, 'VR-31', 'Combo AMD XP 2100+ (Box CPU)Gigabyte GA-7VKML M/B + Fan');
insert into ROLE_ (r_id, r_name, description_)
values (65, 'MQ-24', 'Removeable ATA100 hard drive tray');
insert into ROLE_ (r_id, r_name, description_)
values (66, 'YU-63', 'ATI Radeon 9800 Pro 128MB Gold Edition.');
insert into ROLE_ (r_id, r_name, description_)
values (67, 'MX-24', 'Linksys Instant Wireless Network Adapter - Version 3.0 for Notbooks. (Model No. WPC11 ver.3)');
insert into ROLE_ (r_id, r_name, description_)
values (68, 'NN-13', 'Combo AMD XP 2000+ CPU; Gigabyte GA-7VA M/B.');
insert into ROLE_ (r_id, r_name, description_)
values (69, 'YD-59', 'YS AMD T-Bird 1.2 Ghz Performance Series');
insert into ROLE_ (r_id, r_name, description_)
values (70, 'PF-27', 'Cooler Master Ball Bearing Case Fan');
insert into ROLE_ (r_id, r_name, description_)
values (71, 'WX-41', '313K 300W P4/AMD and Free Case Fan and 2 Front USB.');
insert into ROLE_ (r_id, r_name, description_)
values (72, 'VR-48', 'AMD XP 2000+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (73, 'AW-93', 'US Robotics 56K V.90 PCI Modem with Voice');
insert into ROLE_ (r_id, r_name, description_)
values (74, 'LJ-52', 'Boka 1050 Sub Woofer and Speakers');
insert into ROLE_ (r_id, r_name, description_)
values (75, 'NZ-19', 'Cyber Power 1250VA Back Up.');
insert into ROLE_ (r_id, r_name, description_)
values (76, 'KL-17', 'AMD XP 1600+ CPU (OEM)');
insert into ROLE_ (r_id, r_name, description_)
values (77, 'PM-49', 'AMD XP 2600+ Retail box. (with 333Mhz Front Side Bus)');
insert into ROLE_ (r_id, r_name, description_)
values (78, 'TU-88', '312D ATX translucent blue color case with 300W P4/AMD with(front USB ready) .');
insert into ROLE_ (r_id, r_name, description_)
values (79, 'CS-87', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7VA M/B(W/8X AGP;DDR333 up to 3GB/ATA133 ) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (80, 'CR-73', 'Black RF Wireless Keyboard Track Ball (USB) w/ Antenna.');
insert into ROLE_ (r_id, r_name, description_)
values (81, 'VD-97', 'CyberPower Surge Protector 850 with 8 Outlet.');
insert into ROLE_ (r_id, r_name, description_)
values (82, 'EO-44', '219L ATX color Case teal 400W ScrewLess mid tower w/case Fan');
insert into ROLE_ (r_id, r_name, description_)
values (83, 'SX-23', 'Creative Sound Blaster');
insert into ROLE_ (r_id, r_name, description_)
values (84, 'OU-78', 'ADS USB Turbo 2.0 WebCam.');
insert into ROLE_ (r_id, r_name, description_)
values (85, 'XC-54', 'ADS Firewire Web Cam (20X faster than USB)');
insert into ROLE_ (r_id, r_name, description_)
values (86, 'JR-56', 'ASUS A7N8X Deluxe NVIDIA Force2 .');
insert into ROLE_ (r_id, r_name, description_)
values (87, 'FH-89', 'SVA-USA VR-15A 15" TFT LCD Display.');
insert into ROLE_ (r_id, r_name, description_)
values (88, 'MF-38', 'Dynatron CPU Cooler DF1206BH AMD Athlon\Duron Fan. (AMD Recommend)');
insert into ROLE_ (r_id, r_name, description_)
values (89, 'UI-34', '500W P4 Dual Fan Codegen Power supply.');
insert into ROLE_ (r_id, r_name, description_)
values (90, 'TB-14', 'Testing of CPU/Fan and Motherboard.');
insert into ROLE_ (r_id, r_name, description_)
values (91, 'TN-77', 'GA-SINXP1394(GA-8SQ800 Ultra2) (SiS 655 Chipset) w/ Pentium 4 2.4 Ghz (Box CPU)');
insert into ROLE_ (r_id, r_name, description_)
values (92, 'HN-97', 'Creative Sound Blaster LIVE 5.1 (OEM - SB0220 ).');
insert into ROLE_ (r_id, r_name, description_)
values (93, 'FO-81', 'W.D 120G 7200RPM (1200JB) 8MB Cache and 3 year MDW');
insert into ROLE_ (r_id, r_name, description_)
values (94, 'CL-22', 'Intel Celeron 1.7Ghz/128M/30G Black Complete System.');
insert into ROLE_ (r_id, r_name, description_)
values (95, 'IL-38', 'Intel Pentium4 2.0ghz & Gigabyte 8IE533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (96, 'LB-76', 'Mircosoft Ergonomic Keyboard and Mouse Set.');
insert into ROLE_ (r_id, r_name, description_)
values (97, 'UE-14', '3Com 905cx-txm NIC (Network Interface Card)');
insert into ROLE_ (r_id, r_name, description_)
values (98, 'CA-83', 'Serial ATA Power Connector for the Hard Drive.');
insert into ROLE_ (r_id, r_name, description_)
values (99, 'AR-29', 'Combo Intel P4 1.7Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (100, 'CJ-31', 'Combo Intel P4 2.0Ghz (Box CPU)+ Biostar M7SXF m/b (478pin)CPU & Fan');
commit;
prompt 100 records committed...
insert into ROLE_ (r_id, r_name, description_)
values (101, 'GT-18', 'AMD XP 2600+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (102, 'ZR-71', 'Biostar M7VKQ Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.');
insert into ROLE_ (r_id, r_name, description_)
values (103, 'ZW-82', '2 Year Warranty On Combo''s.');
insert into ROLE_ (r_id, r_name, description_)
values (104, 'YQ-65', 'Dynatron CPU Cooler DF1206BH AMD Athlon\Duron Fan. (AMD Recommend)');
insert into ROLE_ (r_id, r_name, description_)
values (105, 'KH-64', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (106, 'FP-52', 'Biostar M7VKB Ver2.0 ATA100 socket A (w/30 day limit warranty)');
insert into ROLE_ (r_id, r_name, description_)
values (107, 'JM-53', 'AMD XP 2200+ & Gigabyte 7N400Pro w/ 313M case . W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (108, 'TC-39', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7VA M/B.');
insert into ROLE_ (r_id, r_name, description_)
values (109, 'OC-37', 'LABTEC Internet Keyboard (Spanish Edition).');
insert into ROLE_ (r_id, r_name, description_)
values (110, 'SP-26', 'Black LG Electronics CD-RW 48x12x48x / DVD 16x Combo Drive.');
insert into ROLE_ (r_id, r_name, description_)
values (111, 'SG-93', 'Intel Celeron 2.0Ghz 478 pin Box cpu + fan');
insert into ROLE_ (r_id, r_name, description_)
values (112, 'PS-56', 'Combo AMD XP 2500+ Gigabyte GA-7VA M/B.');
insert into ROLE_ (r_id, r_name, description_)
values (113, 'PB-45', 'AMD XP 1900+ & Gigabyte GA-7VKMLS MB w/ 313M Color Case.');
insert into ROLE_ (r_id, r_name, description_)
values (114, 'TV-29', 'Combo AMD XP 1900+ Gigabyte GA-7VKML M/B + Fan');
insert into ROLE_ (r_id, r_name, description_)
values (115, 'LN-56', 'Intel Pentium4 1.7Ghz & Biostar M7TDB MB w/ 313M Case.');
insert into ROLE_ (r_id, r_name, description_)
values (116, 'TB-37', 'CoolerMaster Thermal Compound High Performance. HTK-001');
insert into ROLE_ (r_id, r_name, description_)
values (117, 'ZC-97', 'Intel Pentium4 2.4ghz & Intel D845PESV MB w/ 313M Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (118, 'RG-94', 'AMD XP 1800+ & Biostar M7VIG-Pro MB w/ 313M case. Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (119, 'ZT-74', 'Fast Ethernet 10/100 8 port switching hub');
insert into ROLE_ (r_id, r_name, description_)
values (120, 'MV-81', 'Intel Celeron 2.2Ghz 478 pin Box cpu + fan');
insert into ROLE_ (r_id, r_name, description_)
values (121, 'QK-57', 'Creative Inspire 5200 5.1 surround sound.');
insert into ROLE_ (r_id, r_name, description_)
values (122, 'TI-36', 'AMD XP 2100+ Box w/Fan & Biostar M7VKQ Pro MB w/ 313M Case. W/ PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (123, 'TR-89', 'ATI Radeon 7500 PCI 64M w/ TV out and DVI.');
insert into ROLE_ (r_id, r_name, description_)
values (124, 'ZK-53', 'AMDXP2000+ Box BiostarM7VIG-Pro');
insert into ROLE_ (r_id, r_name, description_)
values (125, 'DE-98', 'GA-7N400L nForce 2 Ultra400 chipset.');
insert into ROLE_ (r_id, r_name, description_)
values (126, 'UU-16', 'USB to Parallel Printer Cable.');
insert into ROLE_ (r_id, r_name, description_)
values (127, 'SB-21', 'ASUS A7N8X Deluxe NVIDIA Force2 w/ AMD XP 2700+ CPU.');
insert into ROLE_ (r_id, r_name, description_)
values (128, 'WG-82', 'Mitsumi 1.44 Floppy Drive');
insert into ROLE_ (r_id, r_name, description_)
values (129, 'SB-88', '312D ATX color case(translucent blue) with 300Watt P4/P3/AMD Support PowerSupply.');
insert into ROLE_ (r_id, r_name, description_)
values (130, 'PK-14', 'Combo AMD XP 1800+ CPU; Gigabyte GA-7VA M/B.');
insert into ROLE_ (r_id, r_name, description_)
values (131, 'ID-69', 'Mitsumi PS2 Keyboard');
insert into ROLE_ (r_id, r_name, description_)
values (132, 'VO-59', 'Intel Celeron 1.3Ghz & Biostar M6VLQ MB w/ 312J Color Case. W/ Free PS2 Mouse and AMR Moden.');
insert into ROLE_ (r_id, r_name, description_)
values (133, 'IW-14', 'hp deskjet 3820 printer - specifications and warranty.');
insert into ROLE_ (r_id, r_name, description_)
values (134, 'GX-15', 'Combo AMD XP 2100+ CPU; Gigabyte GA-7VA M/B.');
insert into ROLE_ (r_id, r_name, description_)
values (135, 'JK-89', 'PS2 2 Button Mouse');
insert into ROLE_ (r_id, r_name, description_)
values (136, 'LK-55', 'Intel Celeron 1.2Ghz & Biostar M6VLR MB w/ 312J Color Case. W/ Free AMR 56k & PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (137, 'DE-57', 'Intel Celeron 1.8ghz & Gigabyte GA-8LD533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (138, 'LU-88', 'Biostar M7VKD AMD 1Ghz Duron + Cooler Master Fan');
insert into ROLE_ (r_id, r_name, description_)
values (139, 'QR-54', 'Maxtor 40Gb ATA100 5400rpm H/D');
insert into ROLE_ (r_id, r_name, description_)
values (140, 'NW-48', 'Intel Celeron 1.0 Ghz skt 370 PPGA (BOX)');
insert into ROLE_ (r_id, r_name, description_)
values (141, 'XF-89', '512mb DDR ECC Registerd. For Dual Processor Server MotherBoards.');
insert into ROLE_ (r_id, r_name, description_)
values (142, 'DQ-48', 'Intel D845PEBT2 P4 M/B DDR-333 & 533MHz FSB.');
insert into ROLE_ (r_id, r_name, description_)
values (143, 'NA-73', 'Sony Black 16X DVD .');
insert into ROLE_ (r_id, r_name, description_)
values (144, 'VD-72', 'AMD XP 1700+ & Biostar M7VKQ w/ 313N case . W/ Free AMR 56k & PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (145, 'AE-49', 'Intel P4 2.4G BareBone System W/ Free Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (146, 'SV-39', 'AMD 1.3Ghz BareBone System Free Mouse');
insert into ROLE_ (r_id, r_name, description_)
values (147, 'IE-22', 'Intel P4 1;7Ghz Box CPU+fan (478 pin)');
insert into ROLE_ (r_id, r_name, description_)
values (148, 'UD-62', 'Combo Intel P4 1.8Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support SD.');
insert into ROLE_ (r_id, r_name, description_)
values (149, 'FO-26', 'ATI Radeon 9800 Pro 128MB Gold Edition.');
insert into ROLE_ (r_id, r_name, description_)
values (150, 'II-61', 'hp deskjet 3820 printer - specifications and warranty.');
insert into ROLE_ (r_id, r_name, description_)
values (151, 'FC-79', 'White RF Wireless Keyboard Track Ball .(PS/2 Connector)');
insert into ROLE_ (r_id, r_name, description_)
values (152, 'MA-82', 'Intel P4 2.4G BareBone System W/ Free Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (153, 'MZ-68', 'AMD Duron 1.3 Ghz (Oem)');
insert into ROLE_ (r_id, r_name, description_)
values (154, 'HL-52', 'Combo AMD Duron 1.2Ghz Biostar M7VIG-Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.');
insert into ROLE_ (r_id, r_name, description_)
values (155, 'QY-41', '312D ATX color case(translucent blue) with 250Watt P4/P3/AMD Ready PS.');
insert into ROLE_ (r_id, r_name, description_)
values (156, 'WI-59', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7VA M/B(W/8X AGP;DDR333 up to 3GB/ATA133 ) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (157, 'KR-18', 'Wireless Access Point Router with 4-Port Switch - Version 3.2 (BEFW11S4)');
insert into ROLE_ (r_id, r_name, description_)
values (158, 'DV-72', 'AMD XP 1800+ & Gigabyte GA-7DXE MB w/ 313M Case W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (159, 'QT-52', 'Intel Celeron 1.8Ghz/128M/30G Black Complete System.');
insert into ROLE_ (r_id, r_name, description_)
values (160, 'QY-74', 'Intel P4 2.4 Ghz CPU BOX (800Mhz)');
insert into ROLE_ (r_id, r_name, description_)
values (161, 'VI-82', 'Biostar U8668D P4 uATX M/B (VIA P4M266 478pin) with AMR ;Support DDR and 533MhZ FSB; onboard Sound & Video & AGP Slot');
insert into ROLE_ (r_id, r_name, description_)
values (162, 'PK-49', 'Combo AMD XP 2100+ CPU; Gigabyte GA-7VA M/B.');
insert into ROLE_ (r_id, r_name, description_)
values (163, 'YN-52', 'Intel Celeron 1.3Ghz & Biostar M6VLQ MB w/ 312J Color Case. W/ Free PS2 Mouse and AMR Moden.');
insert into ROLE_ (r_id, r_name, description_)
values (164, 'TE-45', 'Black OptoRite 48X16X48X CD-RW Retail Box(Includes Nero 5.5 software and audio & IDE Cable ).');
insert into ROLE_ (r_id, r_name, description_)
values (165, 'FF-95', 'Gigabyte GA-7VKMLE');
insert into ROLE_ (r_id, r_name, description_)
values (166, 'VV-27', 'Surge protector');
insert into ROLE_ (r_id, r_name, description_)
values (167, 'JM-43', 'Flat Panel Speakers Boka-206');
insert into ROLE_ (r_id, r_name, description_)
values (168, 'BL-95', 'Combo Intel P4 2.4Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (169, 'LW-32', 'AMD XP2000+ Biostar M7VKQ Pro');
insert into ROLE_ (r_id, r_name, description_)
values (170, 'GJ-29', 'AMD XP 1800+ & Gigabyte GA-7VR MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (171, 'GQ-26', 'AOC LM520 Flat Screen (LCD) 15" Monitor');
insert into ROLE_ (r_id, r_name, description_)
values (172, 'UF-44', 'AMD XP 1700+ & Gigabyte GA-7VKML MB w/313N case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (173, 'AG-11', '313N-B ATX case 300W P4/AMD Free Fan and 2 Front USB.');
insert into ROLE_ (r_id, r_name, description_)
values (174, 'TS-52', 'AMD XP 2500+ Barton Retail Box (with 333Mhz Front Side Bus w/ 512k Cache).');
insert into ROLE_ (r_id, r_name, description_)
values (175, 'LY-33', 'Intel Celeron 2.0Ghz/128M/30G Black Complete System.');
insert into ROLE_ (r_id, r_name, description_)
values (176, 'NM-71', 'Combo AMD XP 1800+ CPU; Gigabyte GA-7VA M/B.');
insert into ROLE_ (r_id, r_name, description_)
values (177, 'HA-54', 'Combo AMD XP 2000+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (178, 'CI-92', 'Intel Celeron 1.0 Ghz skt 370 PPGA (BOX)');
insert into ROLE_ (r_id, r_name, description_)
values (179, 'DV-44', 'AMD XP 2200+ & Biostar M7VIK KT400 MB w/ 313M case. Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (180, 'TG-55', 'Serial ATA Power Connector for the Hard Drive.');
insert into ROLE_ (r_id, r_name, description_)
values (181, 'UN-31', 'Intel Pentium4 1.8ghz & Gigabyte GA-8LD533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (182, 'LI-82', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (183, 'VX-61', 'Windows 2000 w/Service Pack 3(NEW) OEM Full Version LICENCED');
insert into ROLE_ (r_id, r_name, description_)
values (184, 'BW-79', 'White RF Wireless Keyboard Track Ball .(PS/2 Connector)');
insert into ROLE_ (r_id, r_name, description_)
values (185, 'BP-43', 'Matrox Dual Head G550 With 32 MB of Double Data Rate (DDR) memory; a 360. MHz primary RAMDAC.OEM package');
insert into ROLE_ (r_id, r_name, description_)
values (186, 'DW-37', 'CoolerMaster Thermal Compound Premium PTK-001.');
insert into ROLE_ (r_id, r_name, description_)
values (187, 'FU-56', 'AMD XP 3000+ Barton CPU ASUS A7N8X Deluxe NVIDIA Force2 w/ Antec Performance plus II 1040B Case.');
insert into ROLE_ (r_id, r_name, description_)
values (188, 'VS-43', '4 Port USB 2.0 High-Speed PCI Card');
insert into ROLE_ (r_id, r_name, description_)
values (189, 'EP-61', 'AMD XP 2100+ CPU (oem)(AXDA2100DUT3C; RevisionB).');
insert into ROLE_ (r_id, r_name, description_)
values (190, 'KX-12', 'Combo AMD XP 2000+ CPU; Gigabyte GA-7VT600L M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (191, 'FR-21', 'Maxtor 40G 7200RPM ATA133');
insert into ROLE_ (r_id, r_name, description_)
values (192, 'EB-55', 'Combo Intel Celeron 1.7ghz (box)478pin +Gigabyte GA8IRX M/b +fan');
insert into ROLE_ (r_id, r_name, description_)
values (193, 'MM-12', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) FSB800 with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoard(Intel 865G chipset Support FSB800).');
insert into ROLE_ (r_id, r_name, description_)
values (194, 'KN-52', 'Gigabyte GA-7VKMLE');
insert into ROLE_ (r_id, r_name, description_)
values (195, 'EW-85', 'Combo Intel P4 3.06ghz CPU + Fan(BOx)with Hyper Threading w/ Intel D845PESV P4 M/B DDR-333 support.');
insert into ROLE_ (r_id, r_name, description_)
values (196, 'LF-33', '312A Black ATX case 300W P4/AMD (Front USB Optional.)');
insert into ROLE_ (r_id, r_name, description_)
values (197, 'PQ-15', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Intel D845PESV P4 M/B Socket 478.');
insert into ROLE_ (r_id, r_name, description_)
values (198, 'BX-55', 'Combo Intel P4 1.8Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support SD.');
insert into ROLE_ (r_id, r_name, description_)
values (199, 'UU-64', 'CP-691 Stereo Speakers');
insert into ROLE_ (r_id, r_name, description_)
values (200, 'XX-83', 'Headphone & Mic');
commit;
prompt 200 records committed...
insert into ROLE_ (r_id, r_name, description_)
values (201, 'XP-17', 'Microsoft Office XP Small Business Edition');
insert into ROLE_ (r_id, r_name, description_)
values (202, 'NG-49', 'Intel Celeron 1.8ghz & Biostar U8668D. W/ Free CNR 56k & PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (203, 'LW-86', 'Intel Celeron 1.7ghz & Gigabyte GA-8LS533 MB w/ 313M Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (204, 'UZ-81', 'Combo AMD XP 1800+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (205, 'MI-52', 'Combo Intel P4 2.0Ghz 478pin(box)CPU + Gigabyte GA-8IRX (DDR up to 2GB/4 USB)M/B + Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (206, 'XB-71', '313M ATX color Case blue 300W P4 w/ front USB & case fan');
insert into ROLE_ (r_id, r_name, description_)
values (207, 'KY-41', 'AMD XP 1700+ & Gigabyte GA-7ZXE MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (208, 'HN-38', 'AMD XP 2500+ Barton Retail Box (with 333Mhz Front Side Bus w/ 512k Cache).');
insert into ROLE_ (r_id, r_name, description_)
values (209, 'OM-25', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7VA M/B.');
insert into ROLE_ (r_id, r_name, description_)
values (210, 'ZC-44', 'Combo AMD XP 2500+ Barton CPU ASUS A7N8X Deluxe NVIDIA Force2');
insert into ROLE_ (r_id, r_name, description_)
values (211, 'GC-66', 'AMD XP 2000+ & Gigabyte GA-7DXE MB w/ 313M Case W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (212, 'HP-15', 'Epson Stylus C42UX - C11C482001.');
insert into ROLE_ (r_id, r_name, description_)
values (213, 'MF-21', 'ADS Firewire Web Cam (20X faster than USB)');
insert into ROLE_ (r_id, r_name, description_)
values (214, 'CL-22', 'Intel P4 1.8 Ghz CPU BOX (533Mhz)');
insert into ROLE_ (r_id, r_name, description_)
values (215, 'DH-15', 'SIS Xabre200 64MB DDR AGP 8X DVI+TV+CRT by Power Color');
insert into ROLE_ (r_id, r_name, description_)
values (216, 'FA-45', 'ASUS A7N8X Deluxe NVIDIA Force2 .');
insert into ROLE_ (r_id, r_name, description_)
values (217, 'HU-26', 'Mitsumi DW-7801TE DVD Duplicator/Burner.');
insert into ROLE_ (r_id, r_name, description_)
values (218, 'SN-19', 'Dynatron MicroFin DC1206BM-l AMD Athlon/Duron Fan w/ Copper Base up to AMD XP (AMD APPROVED!) 3000+.');
insert into ROLE_ (r_id, r_name, description_)
values (219, 'OC-66', 'Combo AMD XP 2500+ CPU; Gigabyte GA-7N400L M/B(W/DDR400 up to 3GB/ATA133 USB2.0) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (220, 'YJ-74', '312B ATX Case with 250W P4/P3/AMD PS.');
insert into ROLE_ (r_id, r_name, description_)
values (221, 'WD-83', 'Intel Pentium4 1.8ghz & Gigabyte GA-8IE800 MB w/ 313M Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (222, 'JO-35', 'Cooler Master P4 CopperHeatPipe Fan IHC-H71');
insert into ROLE_ (r_id, r_name, description_)
values (223, 'QB-27', 'AMD XP 1900+ & Gigabyte GA-7VKML MB w/ 313M case');
insert into ROLE_ (r_id, r_name, description_)
values (224, 'TP-49', 'Cyber Power 1250VA Back Up.');
insert into ROLE_ (r_id, r_name, description_)
values (225, 'AK-29', 'Sony 48x24x40 and 16x CD-RW/DVD OEM.');
insert into ROLE_ (r_id, r_name, description_)
values (226, 'OH-62', 'Front panel USB kit (for 312J and 312D Case)');
insert into ROLE_ (r_id, r_name, description_)
values (227, 'EA-81', '14"/15" Filter Screen');
insert into ROLE_ (r_id, r_name, description_)
values (228, 'DN-75', 'Assembly & Testing of the CPU/Fan; Motherboard; Case; and Other Products.');
insert into ROLE_ (r_id, r_name, description_)
values (229, 'VG-77', 'ATI Radeon 7500 PCI 64M w/ TV out and DVI.');
insert into ROLE_ (r_id, r_name, description_)
values (230, 'EM-96', '312D ATX color case translucent blue(No PowerSupply).');
insert into ROLE_ (r_id, r_name, description_)
values (231, 'BN-33', 'Surge protector');
insert into ROLE_ (r_id, r_name, description_)
values (232, 'GN-45', '500W P4 Dual Fan Codegen Power supply.');
insert into ROLE_ (r_id, r_name, description_)
values (233, 'LQ-99', 'Biostar Mini BareBone PC > iDEQ 200N.');
insert into ROLE_ (r_id, r_name, description_)
values (234, 'RZ-54', 'YS Intel P4 2.0Ghz Server Solution');
insert into ROLE_ (r_id, r_name, description_)
values (235, 'SB-98', 'Combo Intel P4 1.8Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support SD.');
insert into ROLE_ (r_id, r_name, description_)
values (236, 'TM-69', 'Intel Celeron 1.0 Ghz skt 370 PPGA (BOX)');
insert into ROLE_ (r_id, r_name, description_)
values (237, 'YI-31', 'Audio Cable.');
insert into ROLE_ (r_id, r_name, description_)
values (238, 'GE-77', 'AOC 19" Monitor .26 9GLR');
insert into ROLE_ (r_id, r_name, description_)
values (239, 'HB-13', 'AMD XP 2200+ & Gigabyte 7N400Pro w/ 313M case . W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (240, 'LB-27', 'Intel D875PBZ M/B onboard S-ATA 150.');
insert into ROLE_ (r_id, r_name, description_)
values (241, 'VA-63', 'Biostar M6TBA skt 370 Motherboard. (D.O.A 30 days)');
insert into ROLE_ (r_id, r_name, description_)
values (242, 'WY-81', 'Intel D845PEBT2 M/B onboard Raid and S-ATA .');
insert into ROLE_ (r_id, r_name, description_)
values (243, 'ZO-37', 'GigaByte G-Max AMD Flex ATX Platform .');
insert into ROLE_ (r_id, r_name, description_)
values (244, 'QE-99', '312B ATX Case with 300W P4/P3/AMD PS.');
insert into ROLE_ (r_id, r_name, description_)
values (245, 'RC-25', '6072-1 case with side window 400W Powersupply.');
insert into ROLE_ (r_id, r_name, description_)
values (246, 'HR-78', 'YS Intel P4 2.0Ghz POWER SYSTEM');
insert into ROLE_ (r_id, r_name, description_)
values (247, 'ZB-66', 'AMD XP 1900+ & Gigabyte GA-7ZXE MB w/ 313M Case');
insert into ROLE_ (r_id, r_name, description_)
values (248, 'GV-98', 'ATI Radeon 7500 PCI 64M w/ TV out and DVI.');
insert into ROLE_ (r_id, r_name, description_)
values (249, 'RA-11', '312B ATX Case with 400Watt P4/P3/AMD Ready PS.');
insert into ROLE_ (r_id, r_name, description_)
values (250, 'CY-37', 'Removeable ATA100 hard drive tray');
insert into ROLE_ (r_id, r_name, description_)
values (251, 'BA-31', 'Combo AMD Duron 1.2Ghz + Biostar M7VKQ mb & fan (Free AMR Modem.)');
insert into ROLE_ (r_id, r_name, description_)
values (252, 'EN-82', 'YS Intel Celeron 1.1GHz Work Station Series');
insert into ROLE_ (r_id, r_name, description_)
values (253, 'AG-37', 'Intel Pentium4 2.4ghz & GigaByte 8IPE1000 Pro MB w/ Antec Performance Plus II 1040B Case.');
insert into ROLE_ (r_id, r_name, description_)
values (254, 'ER-11', 'ASUS A7N8X Deluxe NVIDIA Force2 w/ AMD XP 2700+ CPU.');
insert into ROLE_ (r_id, r_name, description_)
values (255, 'DG-99', 'ADS 2 Port USB Pci card');
insert into ROLE_ (r_id, r_name, description_)
values (256, 'KU-92', 'Gigabyte GA-8IE533 IntelÂ®845E Chipset');
insert into ROLE_ (r_id, r_name, description_)
values (257, 'RN-99', 'Intel Pentium 4 2.0 GHz 512k 400MHz FSB( Socket 478 )Retail Box');
insert into ROLE_ (r_id, r_name, description_)
values (258, 'UG-71', 'Combo Intel P4 1.7Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (259, 'TR-92', 'AMD XP 2200+ & Gigabyte 7DXE w/ 313M case . W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (260, 'QU-84', 'Gigabyte GA-8SMMLP SiS650GX Chipset.');
insert into ROLE_ (r_id, r_name, description_)
values (261, 'YK-53', 'Biostar M7SXF P4 478pin M/B Intel P4 1;8ghz CPU + Fan(BOx)Support DDR DIMM');
insert into ROLE_ (r_id, r_name, description_)
values (262, 'MR-31', 'Mouse Pad');
insert into ROLE_ (r_id, r_name, description_)
values (263, 'AK-32', '128Mb DDRam PC2100 Kingston');
insert into ROLE_ (r_id, r_name, description_)
values (264, 'XR-81', 'AMD Server Solution YS XP2000+ 266 FSB Raid Server');
insert into ROLE_ (r_id, r_name, description_)
values (265, 'NF-83', 'AMD XP 1800+ Box CPU and Fan');
insert into ROLE_ (r_id, r_name, description_)
values (266, 'AM-55', '312B ATX Case 250W P4/AMD Ready Power Supply.');
insert into ROLE_ (r_id, r_name, description_)
values (267, 'TJ-85', 'ASUS P4C800 Deluxe Skt 478 Intel 875P (800MHZ FSB).');
insert into ROLE_ (r_id, r_name, description_)
values (268, 'CI-23', '9011 ATX Mid Server Case 450W w/3 case fans');
insert into ROLE_ (r_id, r_name, description_)
values (269, 'HU-99', 'Combo AMD XP 2000 Biostar M7VIK Skt A MotherBoard; KT400.');
insert into ROLE_ (r_id, r_name, description_)
values (270, 'ZS-58', 'Antec PlusView1000AMG Metallic Gray SOHO File Server without PowerSupply.');
insert into ROLE_ (r_id, r_name, description_)
values (271, 'BL-75', 'Mouse Pad');
insert into ROLE_ (r_id, r_name, description_)
values (272, 'HC-85', 'AMDXP2400/128M/30G Black Complete System.');
insert into ROLE_ (r_id, r_name, description_)
values (273, 'AM-72', 'Combo Intel P4 1.8Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support SD.');
insert into ROLE_ (r_id, r_name, description_)
values (274, 'FP-88', 'Gigabyte GA-7VA Motherboard w/ AGP 8x.');
insert into ROLE_ (r_id, r_name, description_)
values (275, 'GP-15', 'AMD XP 2200+ & Gigabyte 7DXE w/ 313M case . W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (276, 'PY-21', 'Gigabyte GA-7NNXP MotherBoard w/ Nforce2 400 chipset.');
insert into ROLE_ (r_id, r_name, description_)
values (277, 'MW-47', 'Front panel USB kit (for 312J and 312D Case)');
insert into ROLE_ (r_id, r_name, description_)
values (278, 'ZS-48', '256Mb PC133 SDRam Micron 168 PIN SDRAM - Lifetime Warranty! We offer a 100% Compatibility Guarantee. 7.5ns PC133');
insert into ROLE_ (r_id, r_name, description_)
values (279, 'VL-72', 'GigaByte G-Max Intel P4 Flex ATX Platform .');
insert into ROLE_ (r_id, r_name, description_)
values (280, 'UG-48', 'AMD XP 2100+ Box & Gigabyte GA-7DXE MB w/ 313M Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (281, 'ZS-28', 'Combo AMD XP 2400+ cpu Gigabyte GA-7DXE Motherboard + Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (282, 'DB-44', 'Microsoft Wireless Optical Desktop .');
insert into ROLE_ (r_id, r_name, description_)
values (283, 'IB-93', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (284, 'TT-12', 'Combo AMD XP 1700+ cpu Gigabyte GA-7DXE Motherboard + Fan');
insert into ROLE_ (r_id, r_name, description_)
values (285, 'FO-92', '500W P4 Dual Fan Codegen Power supply.');
insert into ROLE_ (r_id, r_name, description_)
values (286, 'NI-29', 'Intel Pentium4 1.7ghz & Gigabyte 8ID533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (287, 'WQ-65', 'GA-7N400 Pro nForce 2 Ultra400 chipset.');
insert into ROLE_ (r_id, r_name, description_)
values (288, 'ZX-96', 'Biostar M7SXF P4 478pin M/B Intel P4 1;8ghz CPU + Fan(BOx)Support DDR DIMM');
insert into ROLE_ (r_id, r_name, description_)
values (289, 'MR-58', 'Western Digital 20GB 5400RPM ATA100');
insert into ROLE_ (r_id, r_name, description_)
values (290, 'AZ-87', 'ATI Radeon 7000 32MB DDR TV-Out');
insert into ROLE_ (r_id, r_name, description_)
values (291, 'PJ-55', 'AMD XP 2700+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (292, 'FS-25', 'Combo Intel P4 1.9ghz CPU + Fan(BOx)Biostar M7SXF P4 478pin M/B Support DDR DIMM');
insert into ROLE_ (r_id, r_name, description_)
values (293, 'MN-68', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7VA M/B(W/8X AGP;DDR333 up to 3GB/ATA133 ) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (294, 'DI-21', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (295, 'CW-27', 'AMD XP 2800+ Retail box.');
insert into ROLE_ (r_id, r_name, description_)
values (296, 'VK-95', 'CoolerMaster Thermal Compound High Performance. HTK-001');
insert into ROLE_ (r_id, r_name, description_)
values (297, 'UJ-39', '313H ATX 400w Case W/ case Fan P4/P3/AMD.');
insert into ROLE_ (r_id, r_name, description_)
values (298, 'LG-55', 'Intel Celeron 1.8Ghz 478 pin Box cpu + fan');
insert into ROLE_ (r_id, r_name, description_)
values (299, 'PD-67', 'Combo AMD XP 1700+ cpu Gigabyte GA-7ZXE Motherboard + Fan');
insert into ROLE_ (r_id, r_name, description_)
values (300, 'FP-28', 'ASUS P4C800 Deluxe Skt 478 Intel 875P (800MHZ FSB).');
commit;
prompt 300 records committed...
insert into ROLE_ (r_id, r_name, description_)
values (301, 'LX-78', 'Sony 48x24x48 and 16x CD-RW/DVD OEM.');
insert into ROLE_ (r_id, r_name, description_)
values (302, 'TR-37', 'Intel P4 1;6Ghz Bare Bone');
insert into ROLE_ (r_id, r_name, description_)
values (303, 'SG-31', 'Biostar M6TWL skt 370 Motherboard. (D.O.A 30 days)');
insert into ROLE_ (r_id, r_name, description_)
values (304, 'WV-22', 'Cooler Master Copper HEAT PIPE Cooler. HHC-001');
insert into ROLE_ (r_id, r_name, description_)
values (305, 'WE-28', 'Combo AMD XP 3000+ Barton CPU ASUS A7N8X Deluxe NVIDIA Force2');
insert into ROLE_ (r_id, r_name, description_)
values (306, 'XX-69', 'Combo Intel P4 1.8Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support SD.');
insert into ROLE_ (r_id, r_name, description_)
values (307, 'XJ-73', 'Combo Intel P4 1.6ghz CPU + Fan (BOX);Biostar M7SXF P4 478pin M/B Support DDR DIMM');
insert into ROLE_ (r_id, r_name, description_)
values (308, 'PT-33', 'Combo AMD XP 2500+ CPU; Gigabyte GA-7N400L M/B(W/DDR400 up to 3GB/ATA133 USB2.0) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (309, 'NJ-97', 'Epson Stylus C42UX - C11C482001.');
insert into ROLE_ (r_id, r_name, description_)
values (310, 'DA-92', 'Biostar M6TSU M/B(30 day D.O.A Warranty)');
insert into ROLE_ (r_id, r_name, description_)
values (311, 'NL-94', '313N-B ATX case 300W P4/AMD Free Fan and 2 Front USB.');
insert into ROLE_ (r_id, r_name, description_)
values (312, 'SX-46', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 IntelÂ®845E Chipset.');
insert into ROLE_ (r_id, r_name, description_)
values (313, 'LF-28', 'Biostar M6TBA skt 370 Motherboard. (D.O.A 30 days)');
insert into ROLE_ (r_id, r_name, description_)
values (314, 'IK-34', 'Dynatron MicroFin DC1206BM-l AMD Athlon/Duron Fan w/ Copper Base up to AMD XP (AMD APPROVED!) 3000+.');
insert into ROLE_ (r_id, r_name, description_)
values (315, 'GB-67', 'Wireless Access Point Router with 4-Port Switch - Version 3.2 (BEFW11S4)');
insert into ROLE_ (r_id, r_name, description_)
values (316, 'VB-71', 'Maxtor 40Gb ATA100 5400rpm H/D');
insert into ROLE_ (r_id, r_name, description_)
values (317, 'HM-51', 'AMD XP2000+ Biostar M7VKQ Pro');
insert into ROLE_ (r_id, r_name, description_)
values (318, 'NV-93', 'ATA 100 RAID controller card');
insert into ROLE_ (r_id, r_name, description_)
values (319, 'BS-22', 'Combo Intel Celeron 1.8Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support .');
insert into ROLE_ (r_id, r_name, description_)
values (320, 'GL-26', 'AMD XP2000+ Biostar M7VKQ Pro');
insert into ROLE_ (r_id, r_name, description_)
values (321, 'LE-39', 'GA-7N400 Pro nForce 2 Ultra400 chipset.');
insert into ROLE_ (r_id, r_name, description_)
values (322, 'LA-51', 'Combo Intel P4 1.8Ghz 478pin(box)CPU + Gigabyte GA-8IRX (DDR up to 2GB/4 USB)M/B + Fan');
insert into ROLE_ (r_id, r_name, description_)
values (323, 'BM-36', 'Combo AMD XP 2200+( Box cpu) Gigabyte GA-7DXE.');
insert into ROLE_ (r_id, r_name, description_)
values (324, 'WT-67', 'Intel Celeron 2.0Ghz/128M/30G Black Complete System.');
insert into ROLE_ (r_id, r_name, description_)
values (325, 'TK-67', 'hp deskjet 3820 printer - specifications and warranty.');
insert into ROLE_ (r_id, r_name, description_)
values (326, 'HB-37', 'Biostar M6VLR skt 370 Motherboard');
insert into ROLE_ (r_id, r_name, description_)
values (327, 'FU-63', '319A ATX case 400W P4/AMD Free Fan and 2 Front USB.');
insert into ROLE_ (r_id, r_name, description_)
values (328, 'KL-57', 'GigaByte G-Max Intel P4 Flex ATX Platform .');
insert into ROLE_ (r_id, r_name, description_)
values (329, 'LH-52', '128Mb SDRAM PC133 Micron;Lifetime Warranty! We offer a 100% Compatibility Guarantee. 7.5ns PC133');
insert into ROLE_ (r_id, r_name, description_)
values (330, 'OI-85', 'Intel Pentium4 2.0ghz & Gigabyte 8IRXP MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (331, 'OE-77', 'Intel Pentium4 2.4ghz & GigaByte 8IPE1000 Pro MB w/ Antec Performance Plus II 1040B Case.');
insert into ROLE_ (r_id, r_name, description_)
values (332, 'QS-22', 'Combo Intel Celeron 1.1Ghz (Box)Tulatin core Biostar M6VLR m/b (Free AMR Modem.)');
insert into ROLE_ (r_id, r_name, description_)
values (333, 'PQ-91', 'GigaByte G-Max AMD Flex ATX Platform .');
insert into ROLE_ (r_id, r_name, description_)
values (334, 'PI-85', 'Intel Pentium4 1.8Ghz & Biostar U8668D MB w/ 313M case. W/ Free CNR 56k & PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (335, 'FT-77', 'Intel Celeron 1.7Ghz/128M/30G Black Complete System.');
insert into ROLE_ (r_id, r_name, description_)
values (336, 'AN-17', 'KDS 15" Flat Screen LCD monitor (black).');
insert into ROLE_ (r_id, r_name, description_)
values (337, 'CX-72', 'PCI 56K V.92 Fax Modem');
insert into ROLE_ (r_id, r_name, description_)
values (338, 'XT-87', 'AMD XP 2200+ CPU Oem');
insert into ROLE_ (r_id, r_name, description_)
values (339, 'JV-32', 'Mitsumi PS/2 Net scroll 5 button mouse');
insert into ROLE_ (r_id, r_name, description_)
values (340, 'OI-33', 'Logitech Smart Click 310 Camera');
insert into ROLE_ (r_id, r_name, description_)
values (341, 'EP-29', 'AMD XP 2000+ & GigaByte GA-7VT600L MB w/ 313M case. Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (342, 'QX-31', '512Mb DDR 333 PC2700 (samsung)');
insert into ROLE_ (r_id, r_name, description_)
values (343, 'NM-49', 'Cooler Master ATA133 Rounded IDE Cable . PTC-A18');
insert into ROLE_ (r_id, r_name, description_)
values (344, 'KA-42', 'Combo Intel P4 2.0Ghz 478pin(box)CPU + Gigabyte GA-8IRX (DDR up to 2GB/4 USB)M/B + Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (345, 'PV-47', 'Printer Cable');
insert into ROLE_ (r_id, r_name, description_)
values (346, 'ZA-61', 'AMD XP 2600+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (347, 'AD-82', 'Intel P4 1;7Ghz Box CPU+fan (478 pin)');
insert into ROLE_ (r_id, r_name, description_)
values (348, 'TU-28', '312D ATX color case(translucent blue) with 250Watt P4/P3/AMD Ready PS.');
insert into ROLE_ (r_id, r_name, description_)
values (349, 'EA-15', '312B ATX Case with 400Watt P4/P3/AMD Ready PS.');
insert into ROLE_ (r_id, r_name, description_)
values (350, 'QX-75', 'Combo Intel P4 1.8ghz Gigabyte GA-8LD533 m/b + fan.');
insert into ROLE_ (r_id, r_name, description_)
values (351, 'ZA-56', 'Combo AMD Duron 1.2Ghz + Biostar M7VKQ mb & fan (Free AMR Modem.)');
insert into ROLE_ (r_id, r_name, description_)
values (352, 'TA-89', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) w/ Intel D845PESV P4 M/B Socket 478.');
insert into ROLE_ (r_id, r_name, description_)
values (353, 'MS-64', 'Linksys Wireless PCI card (WMP11)');
insert into ROLE_ (r_id, r_name, description_)
values (354, 'IZ-75', '14"/15" Filter Screen');
insert into ROLE_ (r_id, r_name, description_)
values (355, 'HC-85', 'AMD XP 1900+ & Gigabyte GA-7DXE MB w/ 313M Case');
insert into ROLE_ (r_id, r_name, description_)
values (356, 'CJ-69', 'Mitsumi PS/2 Net scroll 5 button mouse');
insert into ROLE_ (r_id, r_name, description_)
values (357, 'RW-86', 'Combo Intel P4 2.0Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (358, 'BG-67', 'Intel P4 1;6Ghz Bare Bone CPU & Fan;');
insert into ROLE_ (r_id, r_name, description_)
values (359, 'TS-14', 'ATI Radeon 7000 32MB DDR TV-Out');
insert into ROLE_ (r_id, r_name, description_)
values (360, 'IB-35', 'Sound Blaster Audigy with 1394 firewire (oem)');
insert into ROLE_ (r_id, r_name, description_)
values (361, 'AZ-88', '128Mb RDRam 800Mhz Kingston');
insert into ROLE_ (r_id, r_name, description_)
values (362, 'SG-55', 'Intel Celeron 1.0 Ghz skt 370 PPGA (BOX)');
insert into ROLE_ (r_id, r_name, description_)
values (363, 'DM-52', '312D ATX color case(translucent blue) with 250Watt P4/P3/AMD Ready PS.');
insert into ROLE_ (r_id, r_name, description_)
values (364, 'YM-66', '313B Black 400W P4/AMD Fan');
insert into ROLE_ (r_id, r_name, description_)
values (365, 'XR-17', 'Intel Celeron 1.1Ghz CPU Box (256K cache)PPGA2');
insert into ROLE_ (r_id, r_name, description_)
values (366, 'BE-96', 'AMD XP 2600+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (367, 'NI-98', 'AMD Server Solution YS XP2000+ 266 FSB Raid Server');
insert into ROLE_ (r_id, r_name, description_)
values (368, 'MN-91', 'Case Fan 3 1/2"(80mm) 12V');
insert into ROLE_ (r_id, r_name, description_)
values (369, 'GV-26', 'Biostar M6TWL skt 370 Motherboard. (D.O.A 30 days)');
insert into ROLE_ (r_id, r_name, description_)
values (370, 'JX-13', 'Boka 306 Sub Woofer Flat Speaker system');
insert into ROLE_ (r_id, r_name, description_)
values (371, 'AX-89', 'Intel Celeron 1.8ghz & Biostar U8668D. W/ Free CNR 56k & PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (372, 'BF-42', 'AMD XP 1700+ & Gigabyte GA-7VKMLS MB w/ 313N Color Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (373, 'KX-17', 'Gigabyte GA-8IE800 IntelÂ®845E Chipset.');
insert into ROLE_ (r_id, r_name, description_)
values (374, 'GJ-67', 'Intel Pentium4 1.8ghz & Gigabyte GA-8IE800 MB w/ 313M Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (375, 'TQ-28', 'Intel P4 3.0Ghz FSB 800MHZ (478)pin(HT) 3 Year MFG Warr.');
insert into ROLE_ (r_id, r_name, description_)
values (376, 'JN-45', 'Biostar M7VKB Ver2.0 ATA100 socket A (w/30 day limit warranty)');
insert into ROLE_ (r_id, r_name, description_)
values (377, 'MW-34', 'Combo Intel Celeron 1.7ghz (box)478pin +Gigabyte GA8IRX M/b +fan');
insert into ROLE_ (r_id, r_name, description_)
values (378, 'YK-25', 'Headset with Mircophone.');
insert into ROLE_ (r_id, r_name, description_)
values (379, 'AW-25', 'Combo AMD XP 2000+ CPU; Gigabyte GA-7VA M/B.');
insert into ROLE_ (r_id, r_name, description_)
values (380, 'XU-56', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 IntelÂ®845E Chipset.');
insert into ROLE_ (r_id, r_name, description_)
values (381, 'YX-28', 'Combo AMD XP 2200+( Box cpu) Gigabyte GA-7DXE.');
insert into ROLE_ (r_id, r_name, description_)
values (382, 'YK-68', '313K 300W P4/AMD and Free Case Fan and 2 Front USB.');
insert into ROLE_ (r_id, r_name, description_)
values (383, 'WF-56', '312D ATX color case(translucent blue) with 300Watt P4/P3/AMD Support PowerSupply.');
insert into ROLE_ (r_id, r_name, description_)
values (384, 'VH-28', 'AMD XP 2600+ Retail box. (with 333Mhz Front Side Bus)');
insert into ROLE_ (r_id, r_name, description_)
values (385, 'HN-63', 'Intel D845PEBT2 M/B onboard Raid and S-ATA .');
insert into ROLE_ (r_id, r_name, description_)
values (386, 'GM-21', 'AMD XP 1800+ & Biostar M7VKQ Pro MB w/ 313M Case. W/ PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (387, 'GI-33', 'AMD XP1800 Biostar M7VKQ Pro');
insert into ROLE_ (r_id, r_name, description_)
values (388, 'YV-27', 'GA-7N400 Pro nForce 2 Ultra400 chipset.');
insert into ROLE_ (r_id, r_name, description_)
values (389, 'UD-82', 'W.D 80.0Gb 7200rpm ATA100 (WD800BB)');
insert into ROLE_ (r_id, r_name, description_)
values (390, 'MB-65', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7VR M/B(W/DDR333 up to 3GB/ATA133) .');
insert into ROLE_ (r_id, r_name, description_)
values (391, 'RT-71', 'Front panel USB kit (for 312J and 312D Case)');
insert into ROLE_ (r_id, r_name, description_)
values (392, 'QG-76', 'AMD XP 2500+ FBS 333 & GigaByte GA-7N400L MB w/ 313M case. Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (393, 'LM-98', 'Combo AMD XP 2200+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (394, 'XA-24', 'Biostar M6VCF MICRO ATX M/B(w/30 day D.O.A. warranty)');
insert into ROLE_ (r_id, r_name, description_)
values (395, 'CN-77', 'Intel Celeron 1.3Ghz & Biostar M6VLQ MB w/ 312J Color Case. W/ Free PS2 Mouse and AMR Moden.');
insert into ROLE_ (r_id, r_name, description_)
values (396, 'UC-93', 'SIS Xabre200 64MB DDR AGP 8X DVI+TV+CRT by Power Color');
insert into ROLE_ (r_id, r_name, description_)
values (397, 'VI-55', 'Combo AMD XP 2100+ w/ Cpu Fan & Biostar M7VKQ +');
insert into ROLE_ (r_id, r_name, description_)
values (398, 'CA-15', 'Black Complete Computer System w/ Mouse KeyBoard and Speakers(Free AMR Moden). (Duron 1.3)');
insert into ROLE_ (r_id, r_name, description_)
values (399, 'RJ-87', 'Front panel USB kit (for 312J and 312D Case)');
insert into ROLE_ (r_id, r_name, description_)
values (400, 'TL-92', '256Mb SDRam PC133 Kingston');
commit;
prompt 400 records committed...
insert into ROLE_ (r_id, r_name, description_)
values (401, 'US-88', '14inch LCD MG-015A Xgen2 Monitor.');
insert into ROLE_ (r_id, r_name, description_)
values (402, 'TG-17', 'Gigabyte GA-8IPE1000 Pro (intel 865PE Chipset) Pentium 4 ;DDR400 and FSB 800.');
insert into ROLE_ (r_id, r_name, description_)
values (403, 'WG-52', 'SVA-USA VR-15B 15" TFT LCD Display.');
insert into ROLE_ (r_id, r_name, description_)
values (404, 'FZ-79', 'Combo AMD XP 1800+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (405, 'WS-84', '2 Year Warranty On MotherBoards.');
insert into ROLE_ (r_id, r_name, description_)
values (406, 'UE-45', 'Seagate 20GB ATA100 5400RPM.');
insert into ROLE_ (r_id, r_name, description_)
values (407, 'QN-58', 'Headphone & Mic');
insert into ROLE_ (r_id, r_name, description_)
values (408, 'PY-38', 'ATI Radeon 9800 Pro 128MB Gold Edition.');
insert into ROLE_ (r_id, r_name, description_)
values (409, 'KO-89', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Intel D845PESV P4 M/B Socket 478.');
insert into ROLE_ (r_id, r_name, description_)
values (410, 'WP-78', 'Cyber Power 1000VA Back Up W/Automatic Voltage Regulator');
insert into ROLE_ (r_id, r_name, description_)
values (411, 'XY-48', 'Serial ATA IDE Connector.');
insert into ROLE_ (r_id, r_name, description_)
values (412, 'SD-91', 'AMD XP 2200+ & Gigabyte 7N400Pro w/ 313M case . W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (413, 'UR-24', 'Wireless Access Point Router with 4-Port Switch - Version 3.2 (BEFW11S4)');
insert into ROLE_ (r_id, r_name, description_)
values (414, 'WM-62', 'Creative Sound Blaster');
insert into ROLE_ (r_id, r_name, description_)
values (415, 'ZZ-77', 'Biostar M7VKQ Duron 850Mhz B/B w/Video/Sound /100 LAN 312case.');
insert into ROLE_ (r_id, r_name, description_)
values (416, 'SF-89', 'Allied 300watt Powersupply; Intel P4 and AMD XP and Barton approved.');
insert into ROLE_ (r_id, r_name, description_)
values (417, 'OG-44', 'AMD XP 2000+ Box/with AMD Fan');
insert into ROLE_ (r_id, r_name, description_)
values (418, 'ZC-17', 'USB to Parallel Printer Cable.');
insert into ROLE_ (r_id, r_name, description_)
values (419, 'PY-55', 'Combo Intel P4 2.0Ghz (Box CPU)+ Biostar M7SXF m/b (478pin)CPU & Fan');
insert into ROLE_ (r_id, r_name, description_)
values (420, 'CJ-66', 'Combo AMD Duron 1.2Ghz + Biostar M7VKQ mb & fan (Free AMR Modem.)');
insert into ROLE_ (r_id, r_name, description_)
values (421, 'HL-19', 'AMD XP 2100+ Box w/Fan & Biostar M7VKQ Pro MB w/ 313M Case. W/ PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (422, 'PK-18', '500W P4 Dual Fan Codegen Power supply.');
insert into ROLE_ (r_id, r_name, description_)
values (423, 'KO-99', 'Combo Intel P4 2.0Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (424, 'QP-19', 'HP 1300 Laser Jet New.');
insert into ROLE_ (r_id, r_name, description_)
values (425, 'ZR-65', 'ADS USB Turbo 2.0 WebCam.');
insert into ROLE_ (r_id, r_name, description_)
values (426, 'YG-98', 'Intel Pentium4 1.8Ghz & Biostar U8668D MB w/ 313M case. W/ Free CNR 56k & PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (427, 'PA-14', 'Intel Celeron 2.0Ghz 478 pin Box cpu + fan');
insert into ROLE_ (r_id, r_name, description_)
values (428, 'ZF-61', 'GA-7N400 Pro nForce 2 Ultra400 chipset.');
insert into ROLE_ (r_id, r_name, description_)
values (429, 'WS-54', 'AMD XP 1800+ & Biostar M7VKQ Pro MB w/ 313M Case. W/ PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (430, 'EX-72', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 IntelÂ®845E Chipset.');
insert into ROLE_ (r_id, r_name, description_)
values (431, 'SJ-87', 'Wireless Access Point Router with 4-Port Switch - Version 3.2 (BEFW11S4)');
insert into ROLE_ (r_id, r_name, description_)
values (432, 'GA-93', 'Intel P4 1;6Ghz Box CPU (478pin)(256KB L2 Cache)');
insert into ROLE_ (r_id, r_name, description_)
values (433, 'CP-47', 'Boka 406 Sub Woofer 4 Channel Speaker system');
insert into ROLE_ (r_id, r_name, description_)
values (434, 'PS-48', 'Antec PFII Series 1040BII 400W PSU.');
insert into ROLE_ (r_id, r_name, description_)
values (435, 'TI-79', 'W.D 80.0Gb 7200rpm ATA100 (WD800BB)');
insert into ROLE_ (r_id, r_name, description_)
values (436, 'TY-53', 'AMDXP2000/128M/30G Black Complete System.');
insert into ROLE_ (r_id, r_name, description_)
values (437, 'UR-96', 'Sound Blaster Audigy with 1394 firewire (oem)');
insert into ROLE_ (r_id, r_name, description_)
values (438, 'ZX-78', 'Intel Celeron 1.1Ghz & Gigabyte GA6VEML MB w/ 312D Color Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (439, 'EI-17', '313F-B ATX case 400W P4/AMD Free LED Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (440, 'IL-41', 'Combo AMD XP 2100+ (Box CPU); Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (441, 'EB-69', 'AMD XP 1900+ & Gigabyte GA-7DXE MB w/ 313M Case');
insert into ROLE_ (r_id, r_name, description_)
values (442, 'DG-51', '313M ATX color Case blue 300W P4 w/ front USB & case fan');
insert into ROLE_ (r_id, r_name, description_)
values (443, 'SQ-25', 'Maxtor 40G 7200RPM ATA133');
insert into ROLE_ (r_id, r_name, description_)
values (444, 'SL-76', 'Gigabyte GA-8IRXP ATA133 + onboard Raid + USB2.0 + Lan');
insert into ROLE_ (r_id, r_name, description_)
values (445, 'CJ-59', 'Pentiume 4 1.8Ghz/128M/30G Black Complete System.');
insert into ROLE_ (r_id, r_name, description_)
values (446, 'JP-41', 'Intel D845PESV P4 M/B DDR-333 support.');
insert into ROLE_ (r_id, r_name, description_)
values (447, 'PE-16', 'Cooler Master Ball Bearing Case Fan');
insert into ROLE_ (r_id, r_name, description_)
values (448, 'KT-56', 'Combo Intel P4 1.6ghz CPU + Fan (BOX);Biostar M7SXF P4 478pin M/B Support DDR DIMM');
insert into ROLE_ (r_id, r_name, description_)
values (449, 'VZ-32', 'OptoRite 48X16X48X CDRW Retail Box');
insert into ROLE_ (r_id, r_name, description_)
values (450, 'MM-24', 'Combo Intel P4 3.0ghz CPU + Fan(BOx) FSB800 with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoard(Intel 865G chipset Support FSB800).');
insert into ROLE_ (r_id, r_name, description_)
values (451, 'VP-74', 'Serial ATA Power Connector for the Hard Drive.');
insert into ROLE_ (r_id, r_name, description_)
values (452, 'VB-75', 'AMDXP2000/128M/30G Black Complete System.');
insert into ROLE_ (r_id, r_name, description_)
values (453, 'AI-99', 'Black OptoRite 48X16X48X CD-RW Retail Box(Includes Nero 5.5 software and audio & IDE Cable ).');
insert into ROLE_ (r_id, r_name, description_)
values (454, 'JZ-74', 'ADS Firewire Web Cam (20X faster than USB)');
insert into ROLE_ (r_id, r_name, description_)
values (455, 'AJ-81', '219L ATX color Case teal 400W ScrewLess mid tower w/case Fan');
insert into ROLE_ (r_id, r_name, description_)
values (456, 'AJ-83', 'Creative Inspire 5200 5.1 surround sound.');
insert into ROLE_ (r_id, r_name, description_)
values (457, 'KN-25', 'Combo AMD XP 1700+ cpu Gigabyte GA-7DXE Motherboard + Fan');
insert into ROLE_ (r_id, r_name, description_)
values (458, 'FZ-76', '10/100 16 Port Switch');
insert into ROLE_ (r_id, r_name, description_)
values (459, 'XA-44', 'USB Cable 6ft. Long.');
insert into ROLE_ (r_id, r_name, description_)
values (460, 'GV-95', 'AMD XP 2500+ & Gigabyte 7N400Pro w/ 313M case . W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (461, 'TN-83', 'Assembly CPU/Fan; Motherboard; Case; and Other Products.');
insert into ROLE_ (r_id, r_name, description_)
values (462, 'EC-71', 'ASUS A7N8X Deluxe NVIDIA Force2 w/ AMD XP 2700+ CPU.');
insert into ROLE_ (r_id, r_name, description_)
values (463, 'RY-63', 'Gigabyte GA-8IRXP ATA133 + onboard Raid + USB2.0 + Lan');
insert into ROLE_ (r_id, r_name, description_)
values (464, 'EA-71', 'Matrox Dual Head G550 With 32 MB of Double Data Rate (DDR) memory; a 360. MHz primary RAMDAC.OEM package');
insert into ROLE_ (r_id, r_name, description_)
values (465, 'JD-57', '313G-B ATX case 400W P4/AMD Free Fan and 2 Front USB.');
insert into ROLE_ (r_id, r_name, description_)
values (466, 'TC-27', 'YS AMD T-Bird 1.2 Ghz Performance Series');
insert into ROLE_ (r_id, r_name, description_)
values (467, 'HM-12', 'AMD 1.1Ghz Starter Series / Work Station.');
insert into ROLE_ (r_id, r_name, description_)
values (468, 'XM-58', 'Boka 306 Sub Woofer Flat Speaker system');
insert into ROLE_ (r_id, r_name, description_)
values (469, 'BS-48', 'Sony Black 16X DVD .');
insert into ROLE_ (r_id, r_name, description_)
values (470, 'OW-66', '9011 ATX Mid Server Case 450W w/3 case fans');
insert into ROLE_ (r_id, r_name, description_)
values (471, 'VW-92', 'Combo AMD XP 1900+ cpu Gigabyte GA-7VKMLS m/b fan.');
insert into ROLE_ (r_id, r_name, description_)
values (472, 'DV-24', 'Intel Celeron 1.8Ghz/128M/30G Black Complete System.');
insert into ROLE_ (r_id, r_name, description_)
values (473, 'YM-43', 'Linksys Wireless Access Point (WAP11)');
insert into ROLE_ (r_id, r_name, description_)
values (474, 'TJ-31', 'AMD XP 2100+ Box & Gigabyte GA-7DXE MB w/ 313M Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (475, 'PH-69', 'HP 1300 Laser Jet New.');
insert into ROLE_ (r_id, r_name, description_)
values (476, 'NP-77', 'Assembly & Testing of the CPU/Fan; Motherboard; Case; and Other Products.');
insert into ROLE_ (r_id, r_name, description_)
values (477, 'KY-65', 'AMD XP 2200+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (478, 'TL-66', 'Biostar M7TDR P4 M/B Skt 423 (w/30 day limit warranty)');
insert into ROLE_ (r_id, r_name, description_)
values (479, 'AP-56', 'AMD XP 2100+ (Box) & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (480, 'UD-16', 'Combo AMD XP 1900+ cpu Gigabyte GA-7DXE Motherboard + Fan');
insert into ROLE_ (r_id, r_name, description_)
values (481, 'OI-96', 'AOC 19" Monitor .26 9GLR');
insert into ROLE_ (r_id, r_name, description_)
values (482, 'WH-19', 'Combo Intel P4 1.8Ghz retail CPU + Gigabyte GA-8IE533 M/B + Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (483, 'DV-49', 'Biostar M6VLR skt 370 Motherboard');
insert into ROLE_ (r_id, r_name, description_)
values (484, 'XV-74', 'AMD XP 1900+ OEM');
insert into ROLE_ (r_id, r_name, description_)
values (485, 'KO-99', 'ASUS A7N8X Deluxe NVIDIA Force2 w/ AMD XP 2700+ CPU.');
insert into ROLE_ (r_id, r_name, description_)
values (486, 'RG-44', 'AMD Duron 1.3Ghz & Gigabyte GA-7VKML MB w/ 312J Color Case. W/ Free PS2 Mouse.');
insert into ROLE_ (r_id, r_name, description_)
values (487, 'XB-48', 'Pentiume 4 1.8Ghz/128M/30G Black Complete System.');
insert into ROLE_ (r_id, r_name, description_)
values (488, 'UK-95', 'Promise Fast Track ATA 100 RAID Controller Kit.');
insert into ROLE_ (r_id, r_name, description_)
values (489, 'UW-99', 'ATA 100 RAID controller card');
insert into ROLE_ (r_id, r_name, description_)
values (490, 'XU-63', 'White RF Wireless Keyboard Track Ball .(PS/2 Connector)');
insert into ROLE_ (r_id, r_name, description_)
values (491, 'RW-89', 'AMD XP 1800+ Box CPU and Fan');
insert into ROLE_ (r_id, r_name, description_)
values (492, 'OH-21', 'Biostar M7VIK SKT A AMDÂ® DDR400 AGP 8x ;onboard Raid & Sound & 1394 .');
insert into ROLE_ (r_id, r_name, description_)
values (493, 'GH-54', 'Boka 406 Sub Woofer 4 Channel Speaker system');
insert into ROLE_ (r_id, r_name, description_)
values (494, 'LF-63', 'Combo AMD XP 2000+ CPU; Gigabyte GA-7VA M/B.');
insert into ROLE_ (r_id, r_name, description_)
values (495, 'OT-45', 'ADS Firewire Web Cam (20X faster than USB)');
insert into ROLE_ (r_id, r_name, description_)
values (496, 'MM-39', 'Antec PlusView1000AMG Metallic Gray SOHO File Server without PowerSupply.');
insert into ROLE_ (r_id, r_name, description_)
values (497, 'UI-25', '312D ATX color case translucent blue(No PowerSupply).');
insert into ROLE_ (r_id, r_name, description_)
values (498, 'FK-17', 'Pentiume 4 1.8Ghz/128M/30G Black Complete System.');
insert into ROLE_ (r_id, r_name, description_)
values (499, 'UX-95', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into ROLE_ (r_id, r_name, description_)
values (500, 'NR-97', 'AMD XP 1900+ OEM');
commit;
prompt 500 records loaded
prompt Loading PERSONNEL...
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (855164682, 48, 'Victor-Statham', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (319695079, 318, 'Bernie-Spacek', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (771620537, 130, 'Chaka-DeLuise', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (661590780, 350, 'Regina-Rockwell', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (647636587, 344, 'Neil-Nicholas', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (456143084, 331, 'Minnie-Spector', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (300472505, 428, 'Ice-Spiner', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (506202998, 487, 'Chalee-Avalon', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (775103701, 106, 'Ernie-Tyler', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (170686920, 128, 'Naomi-Wahlberg', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (280744824, 353, 'Johnette-Griffith', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (330183141, 207, 'Marlon-Rhymes', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (575806693, 60, 'Willem-Pierce', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (703731742, 381, 'Sigourney-Paltrow', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (502543479, 348, 'Richie-Vassar', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (886687562, 44, 'Patrick-Davison', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (776602532, 189, 'Anthony-Beck', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (185923562, 81, 'Nanci-Witt', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (273115037, 134, 'Rosco-MacNeil', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (259198310, 432, 'Cheech-Blackmore', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (870985228, 220, 'Rene-Morrison', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (426546474, 234, 'Phil-Lineback', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (451899133, 84, 'Shannyn-Kimball', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (469305119, 152, 'Betty-Cetera', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (581530900, 147, 'Lila-Cagle', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (273111266, 262, 'Emerson-Wopat', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (258725494, 71, 'Robby-Purefoy', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (761147541, 272, 'Marina-Scheider', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (785331121, 277, 'Ted-Bridges', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (109322959, 340, 'Sigourney-Hatosy', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (316092988, 141, 'Alice-Keith', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (892204742, 380, 'Anita-Breslin', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (175852055, 423, 'Carlene-Palmer', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (883614739, 42, 'Jackson-Orlando', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (211468215, 458, 'Alana-Cumming', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (185120455, 49, 'Gerald-Barry', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (359656864, 31, 'Derrick-Reed', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (185435795, 288, 'Walter-Gaines', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (690541113, 117, 'Nick-Duke', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (820250587, 70, 'Kyle-Burke', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (811428905, 135, 'Emerson-MacDowell', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (711480574, 198, 'Saffron-Singh', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (117375114, 28, 'Karon-Torino', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (673620982, 155, 'Mekhi-Hughes', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (435733202, 163, 'Aaron-Twilley', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (789046930, 118, 'Cesar-Aniston', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (262389313, 216, 'Jeroen-Brooks', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (829982840, 403, 'Crispin-Hoskins', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (208953703, 247, 'Merillee-Lynn', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (748710686, 166, 'Rachel-Osmond', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (704110185, 482, 'Austin-Plummer', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (925653295, 449, 'Rodney-Alexander', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (699843817, 301, 'Joey-Tanon', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (663504103, 289, 'Jaime-Cobbs', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (955630318, 38, 'Rose-Purefoy', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (700828647, 379, 'Chad-Donovan', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (192127735, 277, 'Terry-Roth', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (296785750, 470, 'Ashley-Quinlan', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (851711689, 294, 'Emilio-Scaggs', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (266057750, 57, 'Christmas-Johnson', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (257590022, 115, 'Stevie-Quatro', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (625989285, 299, 'Breckin-Paul', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (757470967, 157, 'Danni-Benson', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (812563056, 197, 'Rick-Stevens', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (653091007, 34, 'Elle-Lonsdale', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (234438638, 296, 'Angela-Silverman', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (684584344, 299, 'Jeroen-Chesnutt', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (521096819, 87, 'Buffy-Lucas', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (739945441, 448, 'Roger-Peet', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (788417108, 469, 'Kasey-Rea', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (325949401, 469, 'Diane-Sylvian', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (449019951, 42, 'Queen-Astin', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (549101937, 387, 'Angie-Paltrow', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (941677857, 226, 'Reese-Polito', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (444741507, 69, 'David-Winslet', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (300291035, 242, 'Gena-Weber', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (240560700, 471, 'Mekhi-Colin Young', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (534583313, 381, 'Gord-MacDonald', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (878802244, 333, 'Ellen-Palmieri', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (208052994, 281, 'Queen-Overstreet', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (530467033, 62, 'Nathan-Osment', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (280060985, 128, 'Anna-Lattimore', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (546297368, 57, 'Cliff-Gryner', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (584504921, 343, 'Al-Irving', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (584318118, 378, 'Kurtwood-Dawson', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (353563177, 466, 'Nikka-Allison', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (563581797, 484, 'Julia-Hopper', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (417746558, 63, 'Miguel-Whitman', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (899720591, 476, 'Colin-Brolin', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (629218112, 200, 'Nicky-Baldwin', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (111209134, 33, 'Celia-Spacey', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (920282935, 258, 'Brittany-Crow', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (927136387, 105, 'Mika-O''Connor', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (129359959, 256, 'Jean-Luc-Crouch', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (109023220, 234, 'Stanley-Mac', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (958876666, 325, 'Kazem-Nash', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (302054375, 101, 'Lauren-Sayer', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (679625273, 175, 'Renee-Weisz', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (286269217, 301, 'Embeth-Chaykin', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (620435401, 239, 'Nikki-Osborne', 'Rav Seren');
commit;
prompt 100 records committed...
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (187025265, 83, 'Nastassja-Pantoliano', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (186803333, 289, 'Earl-McDonald', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (657661723, 453, 'Beverley-Swinton', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (693621931, 206, 'Night-Moody', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (546997308, 352, 'Sal-Mann', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (781627890, 178, 'Anthony-Mulroney', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (641347421, 187, 'Brendan-Suchet', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (470874452, 157, 'Jonny Lee-Marie', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (206390263, 22, 'Miguel-Brickell', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (593697825, 171, 'Jake-Cetera', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (979699752, 325, 'Tommy-Prowse', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (100524489, 367, 'Chubby-Ball', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (461345159, 17, 'Holly-Fisher', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (250714205, 240, 'Casey-Strathairn', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (348883130, 321, 'Cloris-Holmes', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (443699965, 158, 'Anne-Duschel', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (645587329, 227, 'Bryan-Blossoms', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (519221254, 292, 'Rhona-Culkin', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (368124177, 391, 'Tracy-Tempest', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (815700940, 214, 'Lois-Kline', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (373340230, 208, 'Gran-Warwick', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (129038722, 470, 'Ed-Lennox', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (544627497, 193, 'Red-Reeves', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (616535497, 209, 'Meredith-Kutcher', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (907727540, 446, 'Linda-Lillard', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (348573167, 202, 'Millie-Culkin', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (915073478, 378, 'Joshua-Valentin', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (280303286, 34, 'Patty-McBride', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (128101043, 354, 'Marina-Reed', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (603195640, 380, 'Kim-Purefoy', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (669635628, 492, 'Colm-Horizon', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (798114227, 65, 'Mel-Flack', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (994731787, 247, 'Gates-Union', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (253873277, 139, 'Ann-Clark', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (169454937, 295, 'Sammy-Ferrer', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (394229864, 28, 'Teri-Vance', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (534302030, 217, 'Ted-Crystal', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (278242295, 373, 'Ned-Devine', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (493508774, 225, 'Veruca-Makowicz', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (660114886, 128, 'Debbie-Hopper', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (394635463, 423, 'Keith-Slater', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (621309899, 218, 'Julia-Zane', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (275811818, 326, 'Carrie-Penn', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (476086289, 260, 'Fisher-Fisher', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (142103217, 439, 'Hope-McGill', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (907972593, 378, 'Merle-Dunaway', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (618886514, 120, 'Tara-Torres', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (375247704, 224, 'Candice-Shelton', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (400143150, 441, 'Keith-Union', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (734538392, 273, 'Lily-Ponty', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (294440563, 491, 'Sean-Harmon', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (629396385, 4, 'Kieran-Conners', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (852329914, 129, 'Ike-Womack', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (481440452, 147, 'Ewan-Garza', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (567188945, 307, 'Todd-Allen', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (861590341, 283, 'Holly-Pryce', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (858433306, 406, 'Natacha-Koteas', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (214329592, 354, 'Saffron-Fraser', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (502757972, 100, 'Karon-McGriff', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (215063132, 5, 'Connie-Marsden', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (756902400, 468, 'Manu-Sweeney', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (765733235, 210, 'Carolyn-Ticotin', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (745608870, 284, 'Miranda-Geldof', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (933173824, 418, 'Emm-Root', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (352212956, 68, 'Ike-Northam', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (514468249, 386, 'Howie-McCready', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (677918396, 478, 'Phoebe-Barnett', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (430079593, 137, 'Lenny-Creek', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (310515616, 361, 'Jeff-Hatosy', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (504995192, 479, 'Ernest-Red', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (195353984, 160, 'Trick-McIntyre', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (356818489, 422, 'Carol-Nugent', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (712022376, 354, 'Gran-Breslin', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (173901470, 477, 'Aaron-Myles', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (460680922, 478, 'Michelle-Holmes', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (192489859, 474, 'Colin-Waits', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (233568845, 103, 'Robert-Vicious', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (375700894, 16, 'Debbie-Cusack', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (921139062, 183, 'Alana-Azaria', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (715219917, 164, 'Frankie-Vaughan', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (559789779, 435, 'Ed-Dorff', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (925137151, 388, 'Parker-Garza', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (900526560, 271, 'Judge-Adler', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (632599982, 271, 'Oded-Niven', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (146345404, 93, 'Debby-Miles', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (798178672, 452, 'Sona-Duchovny', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (801928146, 45, 'Mia-Sampson', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (476284867, 391, 'Gilberto-Dukakis', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (383636009, 323, 'Randall-Davis', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (358892417, 156, 'Edwin-Kline', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (882025431, 423, 'Kirk-Gertner', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (190438918, 336, 'Nick-Cornell', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (634442332, 64, 'Burton-Ali', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (704384054, 67, 'Julianne-Frampton', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (282926735, 474, 'Arnold-Hedaya', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (468717220, 438, 'Thora-Stallone', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (243929221, 497, 'Ricardo-Buscemi', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (844992058, 375, 'Mena-Sherman', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (132453957, 244, 'Lucinda-Wayans', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (119469456, 326, 'Jeremy-Spine', 'Aluf Mishne');
commit;
prompt 200 records committed...
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (645450076, 360, 'Larnelle-Nunn', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (861923203, 17, 'Temuera-Watley', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (348823969, 103, 'King-DeLuise', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (863853914, 347, 'Carole-Gibson', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (910589575, 62, 'Belinda-Arnold', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (509516970, 131, 'Merle-Tripplehorn', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (710662044, 431, 'Heath-Carrere', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (596549164, 440, 'Wallace-Cetera', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (116882178, 226, 'Connie-Allan', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (954326355, 233, 'Katrin-Gooding', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (778284818, 121, 'Willem-Bryson', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (463750879, 388, 'Lynn-Shue', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (331643917, 444, 'Bobbi-Margolyes', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (468202588, 96, 'Parker-Patillo', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (677190274, 476, 'Michelle-Roundtree', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (938141321, 14, 'Avenged-Perlman', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (635354962, 148, 'Miranda-Aiken', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (317571254, 457, 'Machine-Moraz', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (479692269, 206, 'Gailard-Thomson', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (995518978, 485, 'Stellan-Haynes', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (733030473, 106, 'Elvis-Van Helden', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (416087325, 279, 'Kitty-Weaving', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (645637087, 373, 'Debbie-Gary', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (322775858, 37, 'Donna-Pollack', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (527017226, 209, 'Chrissie-Colon', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (532856593, 454, 'Kim-Teng', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (808139517, 238, 'Juliana-Dourif', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (211909943, 55, 'Parker-Ruiz', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (249653532, 303, 'Lila-Mandrell', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (573411013, 426, 'Selma-Pantoliano', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (715275975, 92, 'Omar-Quinlan', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (819760293, 55, 'Allison-Mars', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (579229923, 485, 'Gaby-Foxx', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (875625449, 360, 'Clarence-Deschanel', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (163672147, 295, 'Junior-Gaines', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (798152312, 248, 'Lena-Li', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (587688134, 368, 'Cyndi-Gertner', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (987763333, 87, 'Hilton-Andrews', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (384922666, 341, 'Doug-Johansson', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (124140669, 498, 'Wallace-Rourke', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (593495854, 472, 'Lennie-Reiner', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (120838721, 207, 'Clarence-Haysbert', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (570780324, 429, 'Chet-McGovern', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (885037369, 94, 'Sara-DeVita', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (118134762, 24, 'Teena-Haggard', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (892482262, 331, 'Rhea-Darren', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (548052310, 109, 'Ramsey-Minogue', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (997912492, 399, 'Belinda-Forrest', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (269639351, 38, 'Lin-Burke', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (204498569, 85, 'Lisa-Gibson', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (139140982, 225, 'Mike-Rio', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (368255077, 54, 'Rhett-Hauser', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (301624022, 234, 'Heather-Frakes', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (821302501, 119, 'Johnnie-Gershon', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (369166669, 488, 'Frederic-Chambers', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (517481669, 32, 'Vincent-Chan', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (821235968, 412, 'Diane-Pesci', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (941421848, 476, 'Charlie-Moss', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (205610009, 137, 'Veruca-Paymer', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (533980019, 488, 'Ray-Diaz', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (244471336, 78, 'Al-Eldard', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (279253921, 337, 'Swoosie-Reeve', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (741411306, 279, 'Brent-Winger', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (527375444, 445, 'Ike-Colman', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (122292168, 204, 'Rod-Jackman', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (199263551, 233, 'Cliff-Mac', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (157464436, 111, 'William-Hatfield', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (590707337, 10, 'Catherine-Colin Young', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (985981629, 159, 'Alicia-Duke', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (869809993, 482, 'Joaquim-James', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (825442767, 375, 'Frank-Hawthorne', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (600203338, 406, 'Matt-Johansen', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (285175009, 451, 'Halle-Grier', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (428790239, 220, 'Swoosie-Campbell', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (636894624, 484, 'Mili-Burstyn', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (107338663, 270, 'Rosario-Flanagan', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (617004013, 49, 'Sissy-Davidtz', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (478286232, 2, 'Shirley-Dale', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (269545774, 431, 'Roger-Flack', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (502868084, 256, 'Tcheky-Pierce', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (669791831, 203, 'Mos-Moriarty', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (850403488, 111, 'Jarvis-Torino', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (726746451, 169, 'Nick-Kelly', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (157518065, 129, 'Delbert-Jovovich', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (929736480, 257, 'Ty-Mewes', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (111488629, 299, 'Corey-Makeba', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (811000409, 312, 'Max-Postlethwaite', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (469026564, 162, 'Buffy-Clinton', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (624019945, 132, 'Fiona-Collie', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (496913316, 340, 'Fisher-McGovern', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (817513503, 116, 'Elle-Morton', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (470217976, 243, 'Yolanda-Gracie', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (398780584, 231, 'Machine-Lynskey', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (893612092, 382, 'Hal-Kirkwood', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (958699305, 319, 'Derrick-Coyote', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (177800749, 282, 'Freddie-Pullman', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (255386323, 177, 'Ahmad-Strong', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (412561629, 209, 'Leslie-Holland', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (355579253, 60, 'Joaquim-Marx', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (686575140, 56, 'Wally-Def', 'Seren');
commit;
prompt 300 records committed...
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (493446132, 397, 'Kazem-Levert', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (218388884, 176, 'Geraldine-Bandy', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (857014828, 205, 'Merillee-Goodman', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (938738637, 335, 'Kevn-Janssen', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (133997280, 216, 'Lea-Foster', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (508295655, 153, 'Heath-Heald', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (372709260, 46, 'Joy-Heche', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (322976540, 195, 'Christina-Noseworthy', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (121305871, 217, 'Fisher-Nicks', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (557487056, 498, 'Owen-Root', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (230916271, 461, 'Goldie-Lovitz', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (283025187, 76, 'Hilton-Eckhart', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (826718164, 277, 'Orlando-Bachman', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (973291381, 161, 'Ernest-Hawn', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (896793346, 236, 'Ronny-Quinn', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (140395346, 278, 'Powers-Rifkin', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (703000172, 295, 'Lee-Lynskey', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (325158891, 171, 'Betty-Squier', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (212337037, 396, 'Barry-Holmes', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (560943258, 177, 'Bo-Cobbs', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (462603044, 270, 'Ossie-Isaacs', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (142726992, 355, 'Ty-Waits', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (443837792, 500, 'Bernie-Chandler', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (419976842, 119, 'Dom-Quinones', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (278291725, 495, 'Andrew-Pantoliano', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (999139334, 310, 'Mia-Chan', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (947791827, 486, 'Dianne-Red', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (945584548, 16, 'Casey-Kweller', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (229574400, 262, 'Sander-de Lancie', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (521806306, 218, 'Jonathan-Watson', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (291207518, 282, 'Mos-O''Keefe', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (644874373, 349, 'Loretta-McFadden', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (943370219, 110, 'Gena-Gordon', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (797794438, 259, 'Rickie-Wills', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (387243830, 11, 'Jet-Carnes', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (742810531, 370, 'Halle-Rickles', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (702352804, 267, 'Jonatha-Getty', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (466032215, 491, 'Gene-Cleese', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (932118276, 257, 'Isaiah-Gilliam', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (588335277, 434, 'Ivan-Gleeson', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (819407033, 43, 'Patti-de Lancie', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (113519793, 181, 'Sophie-Snipes', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (554221907, 476, 'Kirk-Tambor', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (507463392, 18, 'Val-Morse', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (701636612, 89, 'Harry-Marx', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (317730121, 214, 'Ronny-Imbruglia', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (611378835, 260, 'Night-Tsettos', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (108036821, 107, 'Garth-Houston', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (252359922, 37, 'Jon-Harrison', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (702388971, 309, 'Randall-Shawn', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (597187782, 301, 'Lorraine-Wilder', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (965826967, 247, 'Jean-Luc-DiFranco', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (484531652, 174, 'Harvey-Mraz', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (498821372, 428, 'Antonio-Tolkan', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (442383170, 498, 'Roscoe-Imperioli', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (346672144, 201, 'Doug-Hewett', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (644027708, 421, 'Corey-Adams', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (430051956, 349, 'Susan-Sirtis', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (922153228, 310, 'Rick-Tucci', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (644337681, 262, 'Simon-Union', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (266230910, 11, 'Dianne-Spiner', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (559846702, 37, 'Lily-Snow', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (805352647, 51, 'Rawlins-Briscoe', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (938786190, 392, 'Sean-Brothers', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (414354963, 399, 'Sigourney-Luongo', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (673883590, 45, 'Sarah-Ramirez', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (406547252, 484, 'Wang-Thornton', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (304545484, 10, 'Ann-Bright', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (372944217, 50, 'Val-Jackman', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (985239665, 319, 'Judy-Hurt', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (726828214, 144, 'Bob-Witherspoon', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (423861650, 343, 'Woody-Tolkan', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (694986699, 365, 'Thomas-Loggia', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (281382002, 393, 'Lydia-Cornell', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (194333287, 9, 'Armand-Shelton', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (684324787, 403, 'Natascha-McCain', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (326077937, 165, 'Dwight-DeVito', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (554850078, 98, 'Collective-Ellis', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (240412584, 204, 'Horace-Armatrading', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (765654892, 264, 'Eliza-Lennox', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (954073054, 244, 'Morris-Teng', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (384817053, 18, 'Chubby-Griggs', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (572376377, 93, 'Dionne-Leguizamo', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (745335405, 450, 'Salma-Cumming', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (457664655, 137, 'Lauren-Caldwell', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (961717453, 72, 'Lydia-Sampson', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (328762429, 203, 'Rosanna-Stevens', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (677781908, 364, 'Merrilee-Strong', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (752323983, 380, 'Chubby-Snipes', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (272128767, 203, 'Adrien-Lane', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (828060363, 78, 'Charlton-Stiers', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (926733487, 297, 'Courtney-Patillo', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (657042865, 172, 'Angie-Torres', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (686094438, 297, 'Andrew-Greenwood', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (446830559, 274, 'Clay-Viterelli', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (255554243, 224, 'Benicio-Magnuson', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (430313939, 436, 'Danny-Gore', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (514075773, 75, 'Richie-Chappelle', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (288155076, 319, 'Liv-DiBiasio', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (605132460, 167, 'Laurie-Skerritt', 'Rav Seren');
commit;
prompt 400 records committed...
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (748786656, 454, 'Emerson-Swinton', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (625720252, 323, 'Loren-Fogerty', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (826358117, 114, 'Viggo-Kleinenberg', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (714064937, 66, 'Dennis-Flatts', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (727036569, 338, 'Rik-Close', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (747633742, 449, 'Thora-Harper', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (538933517, 353, 'Delroy-Pollak', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (560813964, 215, 'Gavin-Charles', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (701885400, 225, 'Udo-Schreiber', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (782344124, 495, 'Beth-Plimpton', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (561616763, 168, 'Denny-Pearce', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (132524464, 433, 'Geggy-Beck', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (429709393, 248, 'Sheena-Guest', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (215643820, 327, 'Jim-Ponce', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (727539050, 349, 'Claire-MacPherson', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (550188787, 283, 'Ceili-MacNeil', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (670173440, 395, 'Winona-Mahood', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (604498731, 400, 'Lucy-Woodard', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (476400862, 89, 'Collective-Tsettos', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (504846663, 271, 'Trace-Brock', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (154828498, 65, 'Ed-Masur', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (162711074, 51, 'Mika-Stigers', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (344602589, 338, 'ChantÃ©-Nunn', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (984507807, 64, 'Horace-Nelligan', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (864009777, 188, 'Ann-Fariq', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (286523635, 479, 'Leo-Getty', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (872269671, 489, 'Mia-Tomei', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (896484683, 427, 'Taryn-Pigott-Smith', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (560473221, 459, 'Carlene-McFerrin', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (887352921, 118, 'Cloris-Gosdin', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (488109781, 220, 'Miles-Byrne', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (614822926, 169, 'Andrae-Butler', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (353207758, 316, 'Clint-Cruise', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (323838720, 293, 'Hikaru-Whitmore', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (458039529, 459, 'Geoff-Chapman', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (107516916, 37, 'Geoff-Williamson', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (389860841, 440, 'Kenneth-Purefoy', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (650397569, 144, 'Miranda-Springfield', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (908518202, 58, 'Tilda-Sanders', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (123198011, 105, 'Derek-Lynn', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (201214764, 185, 'Whoopi-Sevenfold', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (224467628, 437, 'Natasha-Campbell', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (960526039, 381, 'Tamala-Cube', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (741982936, 339, 'Marisa-Arjona', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (646151262, 448, 'Jackie-McNarland', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (939632457, 493, 'April-Ifans', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (935124533, 152, 'Lily-Aiken', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (820169828, 155, 'Emm-Koteas', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (130541894, 133, 'Thomas-Spector', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (876811202, 125, 'Armand-Weber', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (316536263, 14, 'Sigourney-Danger', 'Sgan Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (283469435, 377, 'Kylie-Katt', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (498501702, 487, 'Vincent-Lynne', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (990702687, 51, 'Fiona-Lynne', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (683681759, 393, 'Cornell-Dawson', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (248458979, 170, 'Jaime-Statham', 'Rav Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (419443658, 198, 'Albert-Ojeda', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (673670915, 418, 'Glenn-Cummings', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (546110903, 369, 'Fats-Gosdin', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (676946164, 119, 'Jason-Doucette', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (219371383, 282, 'Brittany-Mantegna', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (464259467, 168, 'Roy-Snider', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (745266349, 399, 'Ossie-Stuermer', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (892930846, 257, 'Ray-Ponty', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (929847660, 416, 'Ruth-Coward', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (692522317, 118, 'Mint-O''Neal', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (607016492, 352, 'Frank-Hunt', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (416851864, 478, 'Ike-Russo', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (353076215, 469, 'Jane-Stamp', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (379358545, 248, 'Jaime-Starr', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (356395447, 431, 'Machine-Dafoe', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (496806519, 385, 'Jamie-Cozier', 'Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (866534289, 156, 'Sandra-Mars', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (932038464, 309, 'Petula-Kilmer', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (330487580, 207, 'Jackson-Krumholtz', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (641430213, 247, 'Meredith-Gilley', 'Turai');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (715593486, 317, 'Ivan-Tyler', 'Aluf Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (503108646, 498, 'Moe-Howard', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (350394056, 92, 'Oro-Colman', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (884123742, 389, 'Hilton-Travolta', 'Rabat');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (167566403, 479, 'Aaron-Crow', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (204863361, 63, 'Alannah-Diddley', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (138218924, 219, 'Michelle-Lovitz', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (933315753, 423, 'Pamela-Sinatra', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (125616546, 480, 'Winona-Cherry', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (396569914, 335, 'Cathy-Vance', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (990012231, 305, 'Emmylou-Hersh', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (188447845, 384, 'Rupert-Moraz', 'Rasan');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (725969019, 34, 'Miko-Judd', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (586635399, 298, 'Celia-Weisberg', 'Samal');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (140607671, 218, 'Larenz-Elizabeth', 'Samal Rishon');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (126369837, 458, 'Boz-Squier', 'Tat Aluf');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (466859500, 285, 'Gina-Bridges', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (516902345, 446, 'Rowan-Hong', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (981292260, 77, 'Gladys-Elwes', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (887832684, 86, 'Darius-Clarkson', 'Seren');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (242658998, 480, 'Stewart-Tolkan', 'Segen Mishne');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (221260788, 290, 'Debra-Prinze', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (416245549, 352, 'Rufus-Union', 'Segen');
insert into PERSONNEL (p_id, r_id, p_name, rank_)
values (318766558, 402, 'Jean-Luc-Boothe', 'Rav Seren');
commit;
prompt 500 records loaded
prompt Loading ASSIGNED_PERSONNEL...
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (1, 286269217);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (5, 272128767);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (5, 344602589);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (7, 394635463);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (7, 647636587);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (9, 373340230);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (13, 280060985);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (15, 435733202);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (17, 126369837);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (17, 185435795);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (19, 300291035);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (19, 514468249);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (21, 741982936);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (25, 255386323);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (29, 383636009);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (29, 782344124);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (31, 387243830);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (31, 892204742);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (35, 429709393);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (37, 657042865);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (39, 442383170);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (43, 739945441);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (43, 929847660);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (49, 559846702);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (53, 344602589);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (59, 219371383);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (63, 192489859);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (63, 476086289);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (65, 285175009);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (65, 704110185);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (67, 955630318);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (71, 653091007);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (75, 122292168);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (77, 645587329);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (89, 272128767);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (91, 121305871);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (91, 204498569);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (91, 476284867);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (95, 249653532);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (95, 884123742);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (97, 771620537);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (99, 175852055);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (99, 190438918);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (99, 702352804);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (99, 739945441);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (101, 281382002);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (101, 683681759);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (101, 961717453);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (105, 170686920);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (105, 910589575);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (111, 446830559);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (115, 130541894);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (121, 435733202);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (127, 734538392);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (127, 900526560);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (133, 173901470);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (133, 221260788);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (133, 430079593);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (133, 748710686);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (137, 808139517);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (139, 756902400);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (141, 262389313);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (143, 745335405);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (145, 929847660);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (149, 240560700);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (149, 915073478);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (151, 300291035);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (151, 502868084);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (153, 684324787);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (155, 419443658);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (155, 694986699);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (157, 611378835);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (159, 546297368);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (159, 644874373);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (161, 748786656);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (163, 789046930);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (165, 348573167);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (165, 353207758);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (165, 925137151);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (165, 990702687);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (169, 317730121);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (169, 677918396);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (171, 470874452);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (175, 771620537);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (179, 443837792);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (179, 597187782);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (183, 419976842);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (183, 548052310);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (183, 788417108);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (185, 323838720);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (187, 559789779);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (189, 157518065);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (189, 352212956);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (193, 325949401);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (193, 506202998);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (193, 516902345);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (193, 922153228);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (195, 204863361);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (195, 546110903);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (197, 129359959);
commit;
prompt 100 records committed...
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (203, 858433306);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (203, 886687562);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (205, 394635463);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (205, 900526560);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (207, 124140669);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (207, 645587329);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (209, 932038464);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (211, 679625273);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (215, 240560700);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (217, 187025265);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (217, 702388971);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (221, 414354963);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (221, 530467033);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (225, 416087325);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (227, 548052310);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (231, 527017226);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (235, 469305119);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (241, 123198011);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (243, 122292168);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (245, 129038722);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (245, 255386323);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (245, 567188945);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (247, 317571254);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (249, 776602532);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (251, 742810531);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (251, 929847660);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (253, 252359922);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (253, 282926735);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (253, 318766558);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (253, 686094438);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (253, 727539050);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (255, 269639351);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (259, 546997308);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (261, 430313939);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (265, 812563056);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (267, 111488629);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (269, 979699752);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (273, 636894624);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (279, 353076215);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (281, 400143150);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (281, 457664655);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (283, 538933517);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (285, 789046930);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (287, 283469435);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (287, 291207518);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (289, 527017226);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (289, 563581797);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (297, 273115037);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (297, 304545484);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (297, 597187782);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (297, 727539050);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (299, 939632457);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (301, 493508774);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (305, 317730121);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (307, 234438638);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (307, 703731742);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (309, 634442332);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (311, 273115037);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (311, 563581797);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (313, 727036569);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (321, 330487580);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (327, 322976540);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (329, 142103217);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (337, 469305119);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (339, 368124177);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (339, 907972593);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (343, 368124177);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (349, 815700940);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (353, 206390263);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (353, 926733487);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (357, 167566403);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (359, 496806519);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (363, 703000172);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (365, 484531652);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (367, 464259467);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (371, 607016492);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (371, 915073478);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (373, 559846702);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (379, 855164682);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (381, 449019951);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (385, 908518202);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (389, 907972593);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (391, 943370219);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (393, 417746558);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (393, 579229923);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (395, 645637087);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (397, 369166669);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (397, 771620537);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (399, 375247704);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (399, 670173440);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (405, 517481669);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (409, 789046930);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (409, 899720591);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (411, 821302501);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (415, 607016492);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (415, 621309899);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (421, 233568845);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (421, 929736480);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (423, 229574400);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (423, 926733487);
commit;
prompt 200 records committed...
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (425, 821235968);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (427, 100524489);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (431, 673670915);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (431, 715219917);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (433, 419443658);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (435, 379358545);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (437, 825442767);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (439, 863853914);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (439, 984507807);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (443, 614822926);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (445, 742810531);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (445, 745335405);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (445, 932038464);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (449, 296785750);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (449, 984507807);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (451, 322976540);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (453, 629396385);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (455, 560943258);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (457, 211909943);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (463, 129038722);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (465, 258725494);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (465, 444741507);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (465, 624019945);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (467, 896793346);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (469, 446830559);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (469, 597187782);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (473, 945584548);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (475, 563581797);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (477, 221260788);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (477, 423861650);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (479, 534302030);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (479, 981292260);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (485, 815700940);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (489, 586635399);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (491, 586635399);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (493, 572376377);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (499, 597187782);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (499, 757470967);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (499, 929847660);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (503, 607016492);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (507, 122292168);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (509, 670173440);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (519, 984507807);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (525, 559846702);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (527, 726746451);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (531, 286523635);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (533, 199263551);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (533, 369166669);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (535, 133997280);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (535, 533980019);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (537, 741411306);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (539, 811000409);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (539, 876811202);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (541, 310515616);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (545, 214329592);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (547, 462603044);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (549, 157464436);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (551, 653091007);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (553, 201214764);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (553, 478286232);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (555, 419976842);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (555, 645450076);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (555, 702352804);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (559, 828060363);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (561, 208052994);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (563, 958699305);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (565, 496913316);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (567, 616535497);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (571, 373340230);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (571, 990012231);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (573, 169454937);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (573, 296785750);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (581, 657042865);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (583, 532856593);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (583, 778284818);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (585, 883614739);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (587, 943370219);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (589, 811428905);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (591, 157464436);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (593, 107516916);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (597, 384817053);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (601, 372944217);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (601, 538933517);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (603, 748710686);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (603, 798152312);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (605, 291207518);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (609, 192127735);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (609, 887352921);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (611, 673670915);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (613, 825442767);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (615, 596549164);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (615, 997912492);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (617, 588335277);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (619, 218388884);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (619, 815700940);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (625, 955630318);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (627, 812563056);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (629, 262389313);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (629, 745266349);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (633, 132453957);
commit;
prompt 300 records committed...
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (635, 907972593);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (637, 272128767);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (637, 825442767);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (639, 463750879);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (641, 278291725);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (641, 286269217);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (641, 820169828);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (647, 194333287);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (647, 829982840);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (649, 359656864);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (649, 468717220);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (653, 394635463);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (661, 484531652);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (661, 958699305);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (663, 756902400);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (667, 280060985);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (667, 330487580);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (667, 979699752);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (669, 224467628);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (669, 346672144);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (671, 559789779);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (675, 244471336);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (675, 932038464);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (677, 826358117);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (679, 451899133);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (681, 356818489);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (683, 466032215);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (689, 325158891);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (689, 412561629);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (689, 765654892);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (691, 733030473);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (691, 908518202);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (693, 300291035);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (699, 126369837);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (699, 266057750);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (699, 373340230);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (703, 242658998);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (705, 677781908);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (705, 892204742);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (713, 188447845);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (713, 190438918);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (713, 330487580);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (713, 625989285);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (719, 747633742);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (723, 142103217);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (731, 368124177);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (731, 669635628);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (731, 785331121);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (735, 829982840);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (739, 858433306);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (741, 734538392);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (743, 826718164);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (745, 725969019);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (745, 981292260);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (747, 121305871);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (747, 503108646);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (747, 517481669);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (749, 629396385);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (751, 384817053);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (751, 712022376);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (753, 498821372);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (753, 733030473);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (759, 122292168);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (759, 353076215);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (763, 549101937);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (763, 617004013);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (765, 358892417);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (765, 684584344);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (767, 479692269);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (767, 892930846);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (769, 514075773);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (769, 775103701);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (773, 269639351);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (773, 557487056);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (773, 587688134);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (777, 109023220);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (777, 456143084);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (777, 463750879);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (779, 215643820);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (779, 815700940);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (781, 617004013);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (787, 955630318);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (789, 111488629);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (789, 561616763);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (793, 521806306);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (793, 927136387);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (797, 430313939);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (799, 826718164);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (801, 527017226);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (805, 479692269);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (809, 456143084);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (809, 460680922);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (809, 781627890);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (811, 884123742);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (815, 570780324);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (817, 359656864);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (817, 922153228);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (817, 987763333);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (819, 316536263);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (819, 548052310);
commit;
prompt 400 records committed...
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (825, 703000172);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (827, 597187782);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (829, 318766558);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (831, 230916271);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (831, 356818489);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (831, 559789779);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (831, 644874373);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (831, 887352921);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (833, 820169828);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (835, 994731787);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (839, 109322959);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (841, 142103217);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (841, 443699965);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (847, 466032215);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (849, 262389313);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (849, 461345159);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (851, 527375444);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (851, 544627497);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (855, 108036821);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (855, 641430213);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (857, 741982936);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (859, 219371383);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (861, 546997308);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (861, 673883590);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (863, 304545484);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (863, 625720252);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (865, 419976842);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (867, 636894624);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (867, 776602532);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (871, 644874373);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (871, 663504103);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (871, 699843817);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (871, 925653295);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (873, 496913316);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (877, 348823969);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (883, 423861650);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (885, 188447845);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (885, 387243830);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (887, 294440563);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (889, 379358545);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (889, 844992058);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (891, 234438638);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (891, 379358545);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (893, 255386323);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (893, 614822926);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (895, 994731787);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (897, 375700894);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (901, 821235968);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (903, 294440563);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (905, 808139517);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (907, 212337037);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (909, 546110903);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (911, 604498731);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (911, 861590341);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (913, 177800749);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (913, 300472505);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (913, 479692269);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (913, 644337681);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (917, 107338663);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (917, 319695079);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (919, 701885400);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (921, 199263551);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (921, 278242295);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (927, 368124177);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (927, 805352647);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (929, 456143084);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (931, 286523635);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (931, 470874452);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (931, 514075773);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (931, 990012231);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (933, 603195640);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (937, 146345404);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (939, 219371383);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (939, 514468249);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (941, 243929221);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (941, 352212956);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (941, 444741507);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (941, 932038464);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (945, 204863361);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (949, 214329592);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (955, 611378835);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (957, 748786656);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (959, 990012231);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (967, 892204742);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (969, 344602589);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (969, 999139334);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (975, 625989285);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (975, 690541113);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (975, 785331121);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (977, 234438638);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (981, 561616763);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (985, 677190274);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (989, 352212956);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (991, 469305119);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (993, 669791831);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (995, 586635399);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (995, 625989285);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (997, 125616546);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (997, 323838720);
insert into ASSIGNED_PERSONNEL (a_id, p_id)
values (999, 372709260);
commit;
prompt 500 records loaded
prompt Loading EQUIPMENT...
insert into EQUIPMENT (e_id, type_, status)
values (48952, 'kRs', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (92226, 'lMW', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (47754, 'NVF', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (9765, 'jLj', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (96577, 'Oap', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (55165, 'fdc', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (7780, 'PUW', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (61029, 'tZp', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (20328, 'Vbw', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (90113, 'Yni', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (15423, 'coA', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (47627, 'qtM', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (9892, 'EMY', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (30371, 'yuc', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (69168, 'YVx', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (76510, 'OHW', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (75664, 'Lgb', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (35197, 'suL', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (15642, 'Dxk', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (31790, 'CUv', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (3832, 'NmT', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (47202, 'cQt', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (23982, 'hQH', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (50293, 'UVl', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (68004, 'dzb', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (19657, 'wXw', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (76805, 'TRo', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (92267, 'dqz', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (40043, 'tQJ', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (81837, 'ggp', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (37069, 'gXv', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (19072, 'Wlw', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (53201, 'qFs', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (79524, 'GHs', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (10468, 'oZK', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (6724, 'fLr', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (3118, 'uJU', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (70772, 'vAr', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (54809, 'InW', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (51798, 'LBa', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (32692, 'uBf', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (51715, 'VIL', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (26275, 'bna', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (25561, 'bwh', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (97817, 'DPd', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (99558, 'Dgc', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (78616, 'RMY', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (48961, 'OKk', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (67349, 'jIY', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (7475, 'OlK', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (57059, 'jwL', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (78574, 'hCm', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (39835, 'RjZ', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (6600, 'nDL', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (19596, 'AaM', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (3563, 'CVn', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (18528, 'jrX', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (69541, 'cAj', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (96615, 'tgn', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (3106, 'Ejt', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (71426, 'ihq', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (29835, 'bJO', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (1553, 'cUf', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (10567, 'lAE', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (64823, 'Ftw', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (39109, 'XDr', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (57154, 'LAt', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (19956, 'Rzf', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (36608, 'ERt', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (19311, 'wJz', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (50900, 'ofM', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (70471, 'itr', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (26414, 'ZDG', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (7422, 'SoU', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (54996, 'cRe', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (89371, 'ocW', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (38129, 'qmh', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (61860, 'ZmF', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (34335, 'wzv', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (57065, 'yhF', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (31406, 'Ywa', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (9281, 'bdY', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (40469, 'DKz', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (33934, 'MtW', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (1331, 'nQf', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (18367, 'khj', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (41633, 'JiD', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (53978, 'QMZ', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (93293, 'Jyv', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (18052, 'lCg', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (32382, 'NQu', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (73352, 'Kaa', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (58716, 'yHP', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (28445, 'nei', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (47102, 'RzU', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (58392, 'aDw', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (60241, 'cLz', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (54770, 'emd', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (59853, 'mFY', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (83941, 'oOY', 'Taken');
commit;
prompt 100 records committed...
insert into EQUIPMENT (e_id, type_, status)
values (68239, 'gTy', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (31565, 'dri', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (3361, 'JkU', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (25564, 'uiu', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (58889, 'TyC', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (231, 'gUn', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (25009, 'THG', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (22769, 'wIE', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (89345, 'tqz', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (20341, 'lsH', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (70468, 'fxm', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (19841, 'vhO', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (74605, 'Hec', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (95695, 'iWi', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (63266, 'JxW', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (56866, 'Byj', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (30314, 'NWu', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (43849, 'PDU', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (29037, 'aaV', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (63110, 'tqm', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (18797, 'AeD', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (87827, 'nNa', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (78962, 'UVr', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (9562, 'CHV', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (82702, 'Guj', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (86746, 'mCV', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (75628, 'AnJ', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (45111, 'Bvv', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (18928, 'hBu', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (47285, 'ICp', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (13885, 'Sdc', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (8633, 'rfB', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (2885, 'BxL', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (52113, 'aKP', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (30755, 'duZ', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (25474, 'znY', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (13799, 'Kcs', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (32022, 'JUI', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (47527, 'PTM', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (91735, 'naZ', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (97561, 'FSE', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (35637, 'Dgm', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (11010, 'lhK', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (76972, 'AfY', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (50120, 'ELp', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (13752, 'ljA', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (47298, 'cNb', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (94925, 'lck', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (86279, 'ZbB', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (3592, 'lBL', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (54453, 'gfh', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (88658, 'mOX', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (45912, 'vjm', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (52559, 'arn', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (65603, 'lzq', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (75608, 'VSg', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (14903, 'xYB', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (25838, 'zPB', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (57496, 'hmK', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (20687, 'JcN', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (51459, 'fui', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (19950, 'YSE', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (45002, 'KrH', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (45859, 'mFC', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (98095, 'xEO', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (46757, 'Tgt', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (47109, 'DUz', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (43732, 'zsR', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (38787, 'eBZ', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (5390, 'obH', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (57780, 'qmU', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (44387, 'vAS', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (69779, 'elf', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (42341, 'mvk', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (25910, 'HTy', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (90989, 'qdB', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (28805, 'uiR', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (54326, 'emK', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (7670, 'TdJ', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (93431, 'fXx', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (84633, 'ClQ', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (18213, 'eqZ', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (62117, 'AsY', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (83409, 'igw', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (25075, 'NuS', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (88318, 'Oxs', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (86171, 'UQf', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (78159, 'IFM', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (12590, 'RtF', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (53880, 'uMr', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (46991, 'gzm', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (33004, 'LdR', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (87060, 'iYk', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (3971, 'dYY', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (91349, 'YGD', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (7455, 'Epp', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (49089, 'wkJ', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (58046, 'gtb', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (79954, 'SVs', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (41463, 'iuQ', 'Taken');
commit;
prompt 200 records committed...
insert into EQUIPMENT (e_id, type_, status)
values (4415, 'Wxr', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (8900, 'ufv', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (50284, 'HTd', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (36574, 'Mvk', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (88592, 'UCd', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (28430, 'kos', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (78193, 'Msj', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (74972, 'Pjm', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (97247, 'PVb', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (55151, 'BKx', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (62841, 'Dmn', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (24859, 'OLu', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (51457, 'MgM', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (69212, 'bJS', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (88102, 'eLW', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (90871, 'zwC', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (60631, 'hBC', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (34672, 'Qkv', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (54302, 'Bjb', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (14123, 'dMz', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (72296, 'rtN', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (12024, 'LCd', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (66516, 'CeW', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (61604, 'cBn', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (58701, 'xqN', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (42107, 'VFN', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (75713, 'DpW', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (85684, 'New', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (48162, 'jBQ', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (33793, 'DZw', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (42376, 'Enp', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (34830, 'Wuq', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (56778, 'Bph', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (10974, 'Nzg', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (26109, 'ttY', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (93694, 'RaK', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (90402, 'Cjr', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (11391, 'LUj', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (79028, 'Tcg', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (85503, 'Cyb', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (34823, 'EoH', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (85675, 'GqQ', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (1222, 'uNu', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (48717, 'Czd', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (55608, 'foU', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (20447, 'AHT', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (50736, 'PsN', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (52152, 'rXG', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (2651, 'lUC', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (87175, 'MjN', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (47581, 'FKY', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (16362, 'ZKg', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (17286, 'EBl', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (19076, 'OHv', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (43654, 'vxy', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (7824, 'rsM', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (55035, 'OqU', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (8919, 'XWL', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (54109, 'ceh', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (18709, 'nry', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (72106, 'pyj', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (58646, 'EyG', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (91983, 'JkJ', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (81635, 'hDI', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (13112, 'hMK', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (56759, 'xCY', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (73379, 'ZGS', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (57216, 'Bak', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (10629, 'ciD', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (74978, 'LGf', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (86775, 'ejX', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (49445, 'TPC', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (97765, 'bzB', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (4276, 'Jfm', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (12256, 'Tax', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (83867, 'uHg', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (65397, 'gTT', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (92193, 'RVz', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (18984, 'Rai', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (97066, 'dqM', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (14800, 'WTQ', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (31030, 'vFb', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (19188, 'AJf', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (87583, 'svM', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (43054, 'KHO', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (41302, 'MUv', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (52492, 'edD', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (46835, 'XTR', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (78865, 'DJh', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (78842, 'ZHN', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (44543, 'sJX', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (9755, 'lGJ', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (44302, 'hyd', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (40686, 'kEr', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (16514, 'yhM', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (55514, 'Bmj', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (37873, 'CGY', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (18600, 'ZQd', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (14736, 'dLi', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (87438, 'xLM', 'Taken');
commit;
prompt 300 records committed...
insert into EQUIPMENT (e_id, type_, status)
values (76834, 'nNo', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (64165, 'NMg', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (68267, 'PYL', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (26737, 'Qwc', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (38679, 'jMg', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (26779, 'GsK', 'Taken');
insert into EQUIPMENT (e_id, type_, status)
values (1, 'boom', 'Available');
commit;
prompt 307 records loaded
prompt Loading INTELLIGENCE_REPORTS...
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (1, 88, '304545484', to_date('21-09-2001', 'dd-mm-yyyy'), 'HHjGHffIXDFTSUEmPY');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (2, 106, '296785750', to_date('18-09-1976', 'dd-mm-yyyy'), 'MATGAxvlsRItiCpHEG');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (3, 113, '875625449', to_date('12-02-1987', 'dd-mm-yyyy'), 'CRxjEYXruaULgDlcxY');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (4, 88, '269545774', to_date('16-06-1996', 'dd-mm-yyyy'), 'uJxuxxTfdiqqjwKZcm');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (5, 323, '530467033', to_date('27-07-1980', 'dd-mm-yyyy'), 'diDsfXAzHCpiMmGymN');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (6, 178, '684324787', to_date('21-01-1967', 'dd-mm-yyyy'), 'lVOxxklJCAdqFfyghw');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (7, 221, '572376377', to_date('12-11-2013', 'dd-mm-yyyy'), 'tiXBOUlfGPGowiGaxH');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (8, 59, '819760293', to_date('03-11-1950', 'dd-mm-yyyy'), 'tFNukQqjYjFsfbJazF');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (9, 190, '647636587', to_date('21-08-1997', 'dd-mm-yyyy'), 'zSkEGBUaFjZWVqBKBa');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (10, 170, '532856593', to_date('19-12-1953', 'dd-mm-yyyy'), 'adcWujnGebMRiFbFNE');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (11, 429, '775103701', to_date('04-11-2009', 'dd-mm-yyyy'), 'NelgXhsFIWfPoFUJLs');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (12, 9, '715219917', to_date('22-11-1993', 'dd-mm-yyyy'), 'XUnkhnZyowNttCcAFh');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (13, 409, '301624022', to_date('15-03-1961', 'dd-mm-yyyy'), 'YSDOuVMhCsZeGZLoPg');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (14, 432, '368124177', to_date('26-02-1968', 'dd-mm-yyyy'), 'qZzUewhDhvHUEAdlLY');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (15, 369, '139140982', to_date('18-12-1974', 'dd-mm-yyyy'), 'txRcXBWGYlgcxuposO');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (16, 242, '587688134', to_date('20-06-1949', 'dd-mm-yyyy'), 'aebyttgPuiJsmcXVIU');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (17, 25, '863853914', to_date('29-02-1956', 'dd-mm-yyyy'), 'wtklQMowDygIpMOeiy');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (18, 378, '955630318', to_date('25-04-2012', 'dd-mm-yyyy'), 'nsIBdLhxAInScqoBKG');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (19, 279, '554850078', to_date('21-10-1997', 'dd-mm-yyyy'), 'kjOUGcguZdSdnRtDFh');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (20, 178, '186803333', to_date('13-02-1959', 'dd-mm-yyyy'), 'bRgChzwjzLsPQqmeDe');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (21, 192, '429709393', to_date('06-07-1999', 'dd-mm-yyyy'), 'dLpTtwaDTWfgeamCPq');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (22, 318, '273111266', to_date('08-10-2020', 'dd-mm-yyyy'), 'niDkegshnjAqRfQhBw');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (23, 239, '504995192', to_date('16-04-1950', 'dd-mm-yyyy'), 'lpEwxwENdaHSGglqGG');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (24, 78, '521806306', to_date('14-04-1999', 'dd-mm-yyyy'), 'UYhKHczEJBxdLCyPXZ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (25, 399, '875625449', to_date('04-07-1956', 'dd-mm-yyyy'), 'pYKSKxralCzpvyAqjR');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (26, 399, '449019951', to_date('03-08-2008', 'dd-mm-yyyy'), 'kEbyyExgBiZjocUyAU');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (27, 69, '544627497', to_date('15-01-1967', 'dd-mm-yyyy'), 'bXcJrMySAEYTFnhiOA');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (28, 330, '703000172', to_date('03-08-2019', 'dd-mm-yyyy'), 'QPlxZVgRcssonqNsNB');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (29, 105, '162711074', to_date('01-05-1977', 'dd-mm-yyyy'), 'UhTZEEVToSVHxgQISB');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (30, 53, '304545484', to_date('31-03-2024', 'dd-mm-yyyy'), 'ruRGMjkPtbHZoZjgfl');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (31, 8, '353563177', to_date('16-10-1950', 'dd-mm-yyyy'), 'fbihkgKzAJRZhywMOP');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (32, 480, '521096819', to_date('20-11-1983', 'dd-mm-yyyy'), 'JFdAoowDECdYxPlRns');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (33, 438, '129038722', to_date('22-01-2009', 'dd-mm-yyyy'), 'pUZlkYBpyhJyIWOiUD');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (34, 482, '138218924', to_date('23-11-1994', 'dd-mm-yyyy'), 'xQrUidKkhvxhaZovKi');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (35, 426, '185923562', to_date('18-02-2012', 'dd-mm-yyyy'), 'QnEThjeUbLGNqfRFsL');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (36, 355, '605132460', to_date('15-07-1950', 'dd-mm-yyyy'), 'XPFReDoSEhBkXpxMhk');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (37, 280, '985981629', to_date('05-10-1996', 'dd-mm-yyyy'), 'qgFfLYttPXXecnVnig');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (38, 317, '109322959', to_date('16-04-1952', 'dd-mm-yyyy'), 'PPhoOJoTfWJzNhFvCR');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (39, 423, '938141321', to_date('22-11-1970', 'dd-mm-yyyy'), 'wDUViGMPWQNgIiyEWq');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (40, 239, '604498731', to_date('01-07-1967', 'dd-mm-yyyy'), 'CuZQUFxJdedIFEQnmS');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (41, 167, '185120455', to_date('05-07-1974', 'dd-mm-yyyy'), 'CncbtjruJwlfsjTiJG');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (42, 237, '629218112', to_date('26-06-2006', 'dd-mm-yyyy'), 'FkPJCyqbWNdyPpzZwG');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (43, 318, '676946164', to_date('04-07-2017', 'dd-mm-yyyy'), 'IXJOaEPPTZYRxmaZJp');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (44, 183, '745608870', to_date('30-10-1956', 'dd-mm-yyyy'), 'SRiXWQOyETDdUKqmnX');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (45, 48, '250714205', to_date('26-02-1950', 'dd-mm-yyyy'), 'kMOzFvyRXrFEKHIBUo');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (46, 433, '752323983', to_date('31-03-1985', 'dd-mm-yyyy'), 'CdUOwZnPvaBCTuARsb');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (47, 134, '632599982', to_date('26-08-2015', 'dd-mm-yyyy'), 'HBWokeNANiZrVjmQhF');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (48, 170, '170686920', to_date('21-02-2010', 'dd-mm-yyyy'), 'WavvOoLjhnWYVgazhA');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (49, 94, '995518978', to_date('01-09-1962', 'dd-mm-yyyy'), 'tmBgAkTnqYvtkdSjQM');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (50, 454, '673883590', to_date('30-05-1968', 'dd-mm-yyyy'), 'coZIDHYJCgKUUwsXyP');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (51, 335, '644337681', to_date('18-06-1962', 'dd-mm-yyyy'), 'jkjhEdEWRybRFSIBRy');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (52, 452, '933315753', to_date('11-07-2015', 'dd-mm-yyyy'), 'CCoRJYBVkruJxDBvlZ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (53, 356, '702388971', to_date('29-10-1949', 'dd-mm-yyyy'), 'KDvIdoxqnrLaGHDeau');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (54, 73, '113519793', to_date('01-02-2001', 'dd-mm-yyyy'), 'HdTxIZXJNVmAzBwzbY');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (55, 172, '201214764', to_date('04-09-1961', 'dd-mm-yyyy'), 'ZqKHdPAgMVfQHWzGVV');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (56, 48, '412561629', to_date('09-08-1987', 'dd-mm-yyyy'), 'LfZjkvSbgvCYiCkxmW');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (57, 201, '960526039', to_date('06-02-1995', 'dd-mm-yyyy'), 'giUORZHqWfjjmAZVbG');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (58, 449, '704384054', to_date('22-11-1948', 'dd-mm-yyyy'), 'GpJoGzbMXhzeKvmgYz');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (59, 128, '943370219', to_date('17-12-1983', 'dd-mm-yyyy'), 'LhFEXApcaFrgBylyDY');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (60, 455, '699843817', to_date('09-03-1983', 'dd-mm-yyyy'), 'JFpVWDrMpakFnZQzSW');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (61, 86, '119469456', to_date('15-07-2021', 'dd-mm-yyyy'), 'eSeDZKKgymjpbJodSx');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (62, 492, '516902345', to_date('11-03-2021', 'dd-mm-yyyy'), 'HwugTtOyRopylpyyDD');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (63, 93, '546110903', to_date('16-10-2011', 'dd-mm-yyyy'), 'DTAsCHimNoOzxHQCPc');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (64, 320, '169454937', to_date('15-02-2024', 'dd-mm-yyyy'), 'JJkuiPIyfPwkVWJSqn');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (65, 343, '586635399', to_date('15-06-1995', 'dd-mm-yyyy'), 'zlBpQHquZxaUzqybtU');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (66, 439, '301624022', to_date('18-06-1999', 'dd-mm-yyyy'), 'jGTXSAysuwTuIjQYfV');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (67, 497, '858433306', to_date('28-02-1969', 'dd-mm-yyyy'), 'yVgJBWTzTmenNjZUYi');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (68, 372, '776602532', to_date('16-12-2011', 'dd-mm-yyyy'), 'VBZEVeVWaitFuscwjn');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (69, 282, '113519793', to_date('23-09-1973', 'dd-mm-yyyy'), 'hyTknFPkiRMYlJDyai');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (70, 301, '318766558', to_date('31-10-2014', 'dd-mm-yyyy'), 'PqNxIZCKzkcVJIlLKK');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (71, 273, '331643917', to_date('12-06-1995', 'dd-mm-yyyy'), 'ireBBFEYDBBrJcltTm');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (72, 104, '593495854', to_date('01-11-2017', 'dd-mm-yyyy'), 'qcQlCdHEUQOVKWLDEJ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (73, 48, '715219917', to_date('28-07-1955', 'dd-mm-yyyy'), 'ziRdYHFXZgZphVatRO');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (74, 454, '653091007', to_date('30-10-1961', 'dd-mm-yyyy'), 'QokVJwWkrThUphqCyJ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (75, 145, '426546474', to_date('21-09-1969', 'dd-mm-yyyy'), 'MRScTUmnrSRNvwunxr');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (76, 277, '211468215', to_date('20-05-1982', 'dd-mm-yyyy'), 'DfBcZoxvrHjeaRvelq');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (77, 277, '444741507', to_date('27-06-1974', 'dd-mm-yyyy'), 'gMrxcBIMgOMloAiYaO');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (78, 264, '653091007', to_date('11-06-1974', 'dd-mm-yyyy'), 'RfcNmoxSZOFWyYONYK');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (79, 357, '123198011', to_date('20-11-2022', 'dd-mm-yyyy'), 'twsKlShiIhVIAwsUzG');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (80, 458, '129359959', to_date('18-12-2006', 'dd-mm-yyyy'), 'ShnhtMsSeMqpxawgYD');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (81, 232, '727539050', to_date('05-05-1973', 'dd-mm-yyyy'), 'WQJRoMgKpGSZhXCIvP');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (82, 278, '468717220', to_date('13-07-2001', 'dd-mm-yyyy'), 'ZuAJQTpIdWdlQEgoqb');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (83, 79, '699843817', to_date('01-11-1993', 'dd-mm-yyyy'), 'sfSaPyANTrLmVMFQID');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (84, 433, '587688134', to_date('25-12-2004', 'dd-mm-yyyy'), 'KuDUseistjlObKwuiZ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (85, 236, '661590780', to_date('11-04-2012', 'dd-mm-yyyy'), 'pYApNkOjgLYcpjSRyV');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (86, 129, '958876666', to_date('20-08-1957', 'dd-mm-yyyy'), 'XmnGRKzgCQcWelmTGJ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (87, 371, '798178672', to_date('25-01-1985', 'dd-mm-yyyy'), 'JQclvaipjvrdaafuYJ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (88, 445, '116882178', to_date('09-10-2008', 'dd-mm-yyyy'), 'NJFzFzzXEeXSndAgDZ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (89, 312, '205610009', to_date('22-04-2010', 'dd-mm-yyyy'), 'xiAmeTuwEQdcDGgtSe');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (90, 418, '443699965', to_date('22-04-1968', 'dd-mm-yyyy'), 'wQZZkjvMnbeTKnBfFa');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (91, 176, '129038722', to_date('02-01-2012', 'dd-mm-yyyy'), 'VGIprxcAJUuPSiMQxF');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (92, 364, '629218112', to_date('28-07-2014', 'dd-mm-yyyy'), 'tqVZlgzNCiTmwbSLNT');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (93, 100, '533980019', to_date('01-06-1988', 'dd-mm-yyyy'), 'YZdpAguyouEQjUArKb');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (94, 491, '259198310', to_date('10-12-2019', 'dd-mm-yyyy'), 'jfFNIpgTuzMdCAwNrg');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (95, 486, '815700940', to_date('23-04-1951', 'dd-mm-yyyy'), 'HYKEOGSqUrupjBXevs');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (96, 469, '932118276', to_date('05-04-2015', 'dd-mm-yyyy'), 'sKFeblUwqzoQsSMWAh');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (97, 228, '192127735', to_date('27-12-1976', 'dd-mm-yyyy'), 'gHSKMHTjHygXwQFaSF');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (98, 109, '463750879', to_date('28-03-2015', 'dd-mm-yyyy'), 'VTwsUkgGkhDaVcUnRR');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (99, 397, '887352921', to_date('04-08-1948', 'dd-mm-yyyy'), 'qltxONWFatrNVHMyar');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (100, 210, '356818489', to_date('24-04-1977', 'dd-mm-yyyy'), 'mJjueHsSsmsHHdsjfY');
commit;
prompt 100 records committed...
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (101, 432, '244471336', to_date('22-04-1985', 'dd-mm-yyyy'), 'mowtmLSIfoflcPiveT');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (102, 186, '885037369', to_date('28-04-1962', 'dd-mm-yyyy'), 'VYsIXpqLIdnbWqXXJw');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (103, 438, '400143150', to_date('19-09-2020', 'dd-mm-yyyy'), 'annymlNllLSUpkOmBh');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (104, 392, '449019951', to_date('08-08-1993', 'dd-mm-yyyy'), 'WIqSHGmDvhVHDNnjfS');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (105, 373, '788417108', to_date('10-01-1994', 'dd-mm-yyyy'), 'KTMMCQfNWLMTdfKLRg');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (106, 347, '219371383', to_date('12-08-1968', 'dd-mm-yyyy'), 'OYQmzgRFUmDVkFmFPj');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (107, 161, '745335405', to_date('12-02-1963', 'dd-mm-yyyy'), 'mnmbXrXTvOSLSfITWs');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (108, 363, '702388971', to_date('26-07-1950', 'dd-mm-yyyy'), 'CYfoGiXQvgHztiVcIb');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (109, 179, '188447845', to_date('25-05-1950', 'dd-mm-yyyy'), 'dcabnvcSYnvueHrEUD');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (110, 215, '111488629', to_date('11-06-1957', 'dd-mm-yyyy'), 'baNQGQPYoMwGEdEByC');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (111, 105, '958699305', to_date('08-05-2007', 'dd-mm-yyyy'), 'iyoGzyZCsQgEZhnhAO');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (112, 441, '466032215', to_date('08-05-1967', 'dd-mm-yyyy'), 'ZlODolKlzTzzapPCti');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (113, 428, '858433306', to_date('01-01-1993', 'dd-mm-yyyy'), 'pvlxzCNFIuhreGVbtg');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (114, 454, '369166669', to_date('02-08-1956', 'dd-mm-yyyy'), 'nxoIHAcJcUPbVhQEWD');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (115, 380, '885037369', to_date('12-04-1957', 'dd-mm-yyyy'), 'LsYLvkndhlFYzxKByY');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (116, 383, '805352647', to_date('08-06-1995', 'dd-mm-yyyy'), 'qzRUEFAsGoswGfklIx');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (117, 333, '133997280', to_date('04-12-2011', 'dd-mm-yyyy'), 'jhzIxGLqjfSwgojoFE');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (118, 201, '208953703', to_date('29-08-2002', 'dd-mm-yyyy'), 'YswpRyINwEMJsIZMXH');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (119, 241, '372944217', to_date('16-02-2023', 'dd-mm-yyyy'), 'twIEtJLAvYoGKNPXfZ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (120, 387, '999139334', to_date('15-05-1950', 'dd-mm-yyyy'), 'bymJzhqPBKKTbcCzLd');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (121, 104, '715593486', to_date('18-01-1949', 'dd-mm-yyyy'), 'IoSoxvaQsZAZVCBicu');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (122, 179, '457664655', to_date('15-07-2016', 'dd-mm-yyyy'), 'JuuAijBLLaXuQptDLV');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (123, 139, '851711689', to_date('05-10-1979', 'dd-mm-yyyy'), 'OHudHXDJHjHYUhDTNy');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (124, 195, '140395346', to_date('06-02-2018', 'dd-mm-yyyy'), 'YkSJiXVzZXlijpKRNE');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (125, 500, '857014828', to_date('22-05-1982', 'dd-mm-yyyy'), 'pHktZrhgKGxjGTPwZG');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (126, 375, '741411306', to_date('15-10-2023', 'dd-mm-yyyy'), 'BlbdvowOYtZLtcFPGV');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (127, 367, '132524464', to_date('30-06-1982', 'dd-mm-yyyy'), 'mjXkDICeGTIPcPhlEP');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (128, 11, '412561629', to_date('19-07-1961', 'dd-mm-yyyy'), 'tOvdRpfpNYWqAkYbdZ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (129, 287, '532856593', to_date('17-03-1985', 'dd-mm-yyyy'), 'ipyoWnKFbIuWSEOycx');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (130, 319, '900526560', to_date('22-03-1973', 'dd-mm-yyyy'), 'zGHmhwDlXvpVIUAXMb');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (131, 45, '326077937', to_date('30-09-2008', 'dd-mm-yyyy'), 'eiTpDxULXWgGwbFAeM');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (132, 74, '240560700', to_date('21-11-1995', 'dd-mm-yyyy'), 'ihQvKHWpuUytomBLdU');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (133, 375, '559789779', to_date('09-10-1949', 'dd-mm-yyyy'), 'gtzdJKAWlLduqcKpAj');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (134, 95, '941677857', to_date('11-08-2021', 'dd-mm-yyyy'), 'xfkUSxiyLIvcUTeEjp');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (135, 312, '614822926', to_date('02-11-2004', 'dd-mm-yyyy'), 'gpkVhUeWLWjtkAqvPX');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (136, 346, '325158891', to_date('22-03-1968', 'dd-mm-yyyy'), 'EiudvijnccVdDOtKsT');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (137, 93, '701885400', to_date('10-07-1968', 'dd-mm-yyyy'), 'diNCwVOiYRllOkWpeS');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (138, 383, '283025187', to_date('22-08-1967', 'dd-mm-yyyy'), 'YCvsHbJvbQHVFarMHk');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (139, 219, '570780324', to_date('30-03-2024', 'dd-mm-yyyy'), 'NLjJNWNgtyyngwwrug');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (140, 398, '534583313', to_date('31-01-1980', 'dd-mm-yyyy'), 'YnpqFnzQUGfLHKokyt');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (141, 128, '294440563', to_date('08-07-1980', 'dd-mm-yyyy'), 'KjmMSsKhdoMiuIlOzV');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (142, 397, '177800749', to_date('18-02-1957', 'dd-mm-yyyy'), 'YcPHCpcSqSaxNmTIVB');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (143, 423, '560813964', to_date('27-08-1966', 'dd-mm-yyyy'), 'MCvXqZyWhcTNvjuezM');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (144, 207, '765654892', to_date('26-05-1986', 'dd-mm-yyyy'), 'XqBqPlEbFIWSwimxdL');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (145, 330, '394229864', to_date('24-11-1965', 'dd-mm-yyyy'), 'IxcYoEFBbQSJoIFZgn');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (146, 281, '808139517', to_date('03-09-1964', 'dd-mm-yyyy'), 'RqcnyBCrOADwsUFJQS');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (147, 459, '330487580', to_date('03-02-1990', 'dd-mm-yyyy'), 'kTYTgrljfHgBPFbsGI');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (148, 197, '785331121', to_date('03-07-1951', 'dd-mm-yyyy'), 'vWdxHbHTqiTURwxMkJ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (149, 184, '572376377', to_date('06-04-1998', 'dd-mm-yyyy'), 'BgtmIyXtyRYGlFWWKX');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (150, 75, '826718164', to_date('05-08-1983', 'dd-mm-yyyy'), 'bYGpqmtTkpgERydclT');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (151, 416, '899720591', to_date('15-06-1951', 'dd-mm-yyyy'), 'NYBlixgPDIteGYIUrf');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (152, 495, '990702687', to_date('02-09-1957', 'dd-mm-yyyy'), 'vaYXhRQTTHiPJxBFwM');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (153, 361, '673670915', to_date('11-09-1963', 'dd-mm-yyyy'), 'JujsjmCgxZnezTZAyp');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (154, 47, '428790239', to_date('25-06-1987', 'dd-mm-yyyy'), 'PSxOAtobusaZkcWYYt');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (155, 45, '995518978', to_date('05-10-1973', 'dd-mm-yyyy'), 'TwLbnejEQGWdDwEvkG');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (156, 472, '316092988', to_date('29-10-1984', 'dd-mm-yyyy'), 'mfBTBLoggwfPUyXMPU');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (157, 427, '932038464', to_date('21-04-1990', 'dd-mm-yyyy'), 'emykmSAoybleHotMFV');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (158, 291, '621309899', to_date('20-03-1961', 'dd-mm-yyyy'), 'saixlSCshCzIgbPrNp');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (159, 393, '266057750', to_date('06-06-2001', 'dd-mm-yyyy'), 'vfXgvPqorfGtefwCsh');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (160, 291, '504846663', to_date('07-12-2010', 'dd-mm-yyyy'), 'RreBMMtnSvBqSiFbKd');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (161, 377, '733030473', to_date('29-01-1991', 'dd-mm-yyyy'), 'DuoPjKxsqffFtflYGp');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (162, 90, '464259467', to_date('11-08-2014', 'dd-mm-yyyy'), 'EbTketeEtOeaTxCBzL');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (163, 213, '958699305', to_date('25-11-2023', 'dd-mm-yyyy'), 'tgxMkVtyBGdZfDKMMs');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (164, 300, '186803333', to_date('26-08-1961', 'dd-mm-yyyy'), 'cOIiRmReBkrMrTfxvJ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (165, 294, '316536263', to_date('02-11-2009', 'dd-mm-yyyy'), 'cxvufEEEtWpqTWCriN');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (166, 225, '852329914', to_date('21-09-2002', 'dd-mm-yyyy'), 'pZVtUUOxNBAUNnJExz');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (167, 17, '187025265', to_date('18-11-2006', 'dd-mm-yyyy'), 'nHJguXgqarxUZnmvnO');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (168, 219, '896484683', to_date('26-10-1968', 'dd-mm-yyyy'), 'xlNsNgbhKSDaoMfjNZ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (169, 77, '353076215', to_date('20-02-1963', 'dd-mm-yyyy'), 'ayQxoznHDgIGHvOVwP');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (170, 477, '240412584', to_date('23-11-1995', 'dd-mm-yyyy'), 'kVXVYZeHaMsLjGnOEw');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (171, 271, '508295655', to_date('11-08-1957', 'dd-mm-yyyy'), 'rHNLXraeufshmNrlBw');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (172, 221, '620435401', to_date('28-04-1972', 'dd-mm-yyyy'), 'NmaNkFKleCLFumOPlf');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (173, 282, '133997280', to_date('04-12-1973', 'dd-mm-yyyy'), 'TYgstHjzPfZqXOIxdw');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (174, 242, '908518202', to_date('04-08-1997', 'dd-mm-yyyy'), 'HVUMOBKMKUMBQFMKsW');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (175, 332, '142726992', to_date('10-05-1961', 'dd-mm-yyyy'), 'YuZgXVbXXWxWqwWYPS');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (176, 104, '618886514', to_date('27-11-1998', 'dd-mm-yyyy'), 'QJsFylQxEUYQopBtjT');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (177, 254, '559846702', to_date('21-09-2003', 'dd-mm-yyyy'), 'mxCxAJGLCZzOmVXzfR');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (178, 254, '285175009', to_date('31-01-1987', 'dd-mm-yyyy'), 'EanCqQDAWRlFtXHjqx');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (179, 388, '829982840', to_date('03-07-1969', 'dd-mm-yyyy'), 'EaDrrkQzCexnxCjDpe');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (180, 405, '812563056', to_date('02-07-1962', 'dd-mm-yyyy'), 'oToBSJsdyVwoGFetzc');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (181, 366, '266057750', to_date('21-03-2017', 'dd-mm-yyyy'), 'kMsowpZvlEDoGYWjLu');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (182, 104, '702388971', to_date('22-01-2015', 'dd-mm-yyyy'), 'dDxNiCIPQxXmUuGomj');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (183, 253, '878802244', to_date('02-08-1974', 'dd-mm-yyyy'), 'izKHwTccXqEHDYajmA');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (184, 401, '323838720', to_date('21-08-1977', 'dd-mm-yyyy'), 'QFHFFycsXEdcIoQXwy');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (185, 283, '394229864', to_date('14-01-1956', 'dd-mm-yyyy'), 'VWDwOrKmdovtqavpBh');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (186, 287, '850403488', to_date('21-03-2023', 'dd-mm-yyyy'), 'yJbLqdBNlDRBCYMdrg');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (187, 23, '358892417', to_date('22-06-2010', 'dd-mm-yyyy'), 'ihueIHKPdTqRwlJpXc');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (188, 99, '316536263', to_date('24-06-1992', 'dd-mm-yyyy'), 'KqWqBsDCCNCWRWbBFc');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (189, 312, '805352647', to_date('15-06-1957', 'dd-mm-yyyy'), 'FCBrfpxdgDzTYrqfIV');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (190, 205, '192489859', to_date('21-11-1989', 'dd-mm-yyyy'), 'ufvYeHdvcCkrDhYied');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (191, 200, '712022376', to_date('21-02-1967', 'dd-mm-yyyy'), 'rYWSNBAUcyoELbGDYS');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (192, 410, '748786656', to_date('19-01-1999', 'dd-mm-yyyy'), 'oevngqSWbMdCCvvIAW');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (193, 20, '563581797', to_date('04-01-1981', 'dd-mm-yyyy'), 'qkBaZVWNhzujSkRopc');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (194, 140, '278291725', to_date('12-10-1958', 'dd-mm-yyyy'), 'JyhuNgyyBvhnFQVjDo');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (195, 25, '124140669', to_date('29-03-1988', 'dd-mm-yyyy'), 'IWlFIqdzbiwVPkExuE');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (196, 358, '111488629', to_date('05-04-1969', 'dd-mm-yyyy'), 'BxBDyseiVKhCnnUwIU');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (197, 409, '645587329', to_date('27-08-2000', 'dd-mm-yyyy'), 'cdJjBUSJMZhWDavJHh');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (198, 339, '466859500', to_date('14-11-1982', 'dd-mm-yyyy'), 'UNHEVMfpZDArEEwysc');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (199, 399, '521806306', to_date('05-11-1958', 'dd-mm-yyyy'), 'QIyxFIlvmUhkhlofeY');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (200, 271, '752323983', to_date('13-03-1976', 'dd-mm-yyyy'), 'IoYvpySHJeZXysCbPo');
commit;
prompt 200 records committed...
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (201, 106, '129359959', to_date('24-05-1963', 'dd-mm-yyyy'), 'vOKQZwRXkqErOQxdpp');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (202, 491, '734538392', to_date('23-07-1958', 'dd-mm-yyyy'), 'FHEHqmHZUnuMiEaRAl');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (203, 373, '157518065', to_date('25-08-1953', 'dd-mm-yyyy'), 'sxPMsYCuzpyDQHbhvY');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (204, 53, '677190274', to_date('15-05-1991', 'dd-mm-yyyy'), 'yONbczxwAmOvhrBlkD');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (205, 94, '660114886', to_date('15-02-1950', 'dd-mm-yyyy'), 'NFrOyJsNrQGqcNzUfb');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (206, 500, '215063132', to_date('28-01-1952', 'dd-mm-yyyy'), 'dGKrYyWvDECjXYDlZB');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (207, 330, '219371383', to_date('10-12-1962', 'dd-mm-yyyy'), 'QrMlAkuBsMfTDKSYYl');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (208, 239, '498821372', to_date('06-05-2007', 'dd-mm-yyyy'), 'hVzpaMtbDgLXQTYPsC');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (209, 178, '933173824', to_date('06-08-2005', 'dd-mm-yyyy'), 'qWtRTzWhUItNJGSGPB');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (210, 64, '892204742', to_date('14-04-1967', 'dd-mm-yyyy'), 'hKdjMiuoyGQOsTcwEa');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (211, 92, '259198310', to_date('08-09-1968', 'dd-mm-yyyy'), 'CELuepwyJWDrhqmbGg');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (212, 168, '745266349', to_date('06-06-2014', 'dd-mm-yyyy'), 'swBAxFtkQelEyNsmwW');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (213, 495, '498821372', to_date('04-03-1959', 'dd-mm-yyyy'), 'TKLLqjoZXrClwltwwe');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (214, 215, '641430213', to_date('13-11-2022', 'dd-mm-yyyy'), 'BxadIDTRoTUaMpxyut');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (215, 338, '861923203', to_date('30-12-2017', 'dd-mm-yyyy'), 'CkmAlzZaYxucjzufeU');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (216, 244, '400143150', to_date('03-12-1986', 'dd-mm-yyyy'), 'fqbhDBIrDywHFCNutv');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (217, 483, '502543479', to_date('24-04-1957', 'dd-mm-yyyy'), 'oWcTcYQmytBRhjRheP');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (218, 104, '169454937', to_date('08-01-1982', 'dd-mm-yyyy'), 'NafqLWcOWjMtitSQhG');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (219, 305, '266057750', to_date('20-04-1960', 'dd-mm-yyyy'), 'aUTYxiAAichqKVPyyI');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (220, 366, '863853914', to_date('25-06-1977', 'dd-mm-yyyy'), 'BJFJQcgmhdFLpTktCV');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (221, 375, '647636587', to_date('28-07-2015', 'dd-mm-yyyy'), 'uHIGysqCVaaIWUFSDX');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (222, 404, '990012231', to_date('02-09-1964', 'dd-mm-yyyy'), 'AylCMwmisMzBQNrhfv');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (223, 397, '570780324', to_date('01-08-1977', 'dd-mm-yyyy'), 'qOIzWOKotGJaQgrDPe');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (224, 229, '532856593', to_date('23-03-1981', 'dd-mm-yyyy'), 'NWzKEQNqHGqWyhMEes');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (225, 401, '358892417', to_date('06-11-1956', 'dd-mm-yyyy'), 'vdTDIKdUJbsoxXgrOJ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (226, 383, '469305119', to_date('20-04-1987', 'dd-mm-yyyy'), 'ftmwNHXUPgUDXxuXpl');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (227, 455, '451899133', to_date('02-12-2015', 'dd-mm-yyyy'), 'tTzaAcGDfjtkFEtBpp');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (228, 351, '521806306', to_date('20-01-2010', 'dd-mm-yyyy'), 'ueoYFKBGsyIBbYcpEj');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (229, 481, '154828498', to_date('25-10-1981', 'dd-mm-yyyy'), 'VCVYBQULLqCzlYzwtJ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (230, 274, '464259467', to_date('18-06-2002', 'dd-mm-yyyy'), 'pyYoeOqBKfsTmaNmoW');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (231, 31, '864009777', to_date('06-09-1969', 'dd-mm-yyyy'), 'RYvqMpyfGklEbFtJfb');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (232, 269, '249653532', to_date('04-11-2000', 'dd-mm-yyyy'), 'mAvZrGrbPCIbgvUcRA');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (233, 374, '844992058', to_date('28-03-2008', 'dd-mm-yyyy'), 'NHhCLXuZrnaCfpqYEo');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (234, 229, '932118276', to_date('27-12-2008', 'dd-mm-yyyy'), 'IVJmHvSZFPkRvUgnGE');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (235, 182, '288155076', to_date('23-09-1980', 'dd-mm-yyyy'), 'GyVjUWNlGfcahRjQyv');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (236, 500, '798114227', to_date('25-12-1959', 'dd-mm-yyyy'), 'vlIArzaBRfHLtnxZvC');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (237, 301, '624019945', to_date('27-01-1963', 'dd-mm-yyyy'), 'PCokMYzMDuityatVvX');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (238, 245, '506202998', to_date('13-01-1999', 'dd-mm-yyyy'), 'tJTyCmFgIAOcJNSNcu');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (239, 390, '994731787', to_date('03-11-2005', 'dd-mm-yyyy'), 'xyUSZpCXFXjyxNSbKE');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (240, 474, '456143084', to_date('16-11-2005', 'dd-mm-yyyy'), 'VRwVtpmMIKiZbExbGV');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (241, 244, '190438918', to_date('03-02-1962', 'dd-mm-yyyy'), 'eEIaNzQxldOpKrXKJh');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (242, 95, '368124177', to_date('08-12-1982', 'dd-mm-yyyy'), 'aIrsVmLdKnIhIFRDGv');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (243, 347, '116882178', to_date('01-10-1952', 'dd-mm-yyyy'), 'KTJCbqBHfCiONIQgEf');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (244, 279, '572376377', to_date('22-12-1989', 'dd-mm-yyyy'), 'pObiGGkKPOeOptQfgK');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (245, 227, '350394056', to_date('02-12-2014', 'dd-mm-yyyy'), 'YBWksRgcyxwzPrTZsd');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (246, 404, '644027708', to_date('05-01-1972', 'dd-mm-yyyy'), 'BTURvfxrGSHbvmffGe');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (247, 483, '248458979', to_date('07-02-1956', 'dd-mm-yyyy'), 'BDkAWMjiloOHdKJmPg');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (248, 170, '259198310', to_date('09-11-1991', 'dd-mm-yyyy'), 'bZGhyYTQbyHopnSjTz');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (249, 488, '310515616', to_date('14-03-1976', 'dd-mm-yyyy'), 'mYzAaNTtTUztByxsFP');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (250, 153, '111488629', to_date('07-05-1970', 'dd-mm-yyyy'), 'cEVBacFMeWMyWzLzaU');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (251, 221, '488109781', to_date('04-08-2003', 'dd-mm-yyyy'), 'hOtpvPyyKIZWlgQUKt');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (252, 443, '644874373', to_date('12-12-1962', 'dd-mm-yyyy'), 'GCJzAnEqYAuLymEHLN');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (253, 125, '572376377', to_date('26-10-1950', 'dd-mm-yyyy'), 'mWPclPROVWImqrgMXL');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (254, 495, '355579253', to_date('06-08-1969', 'dd-mm-yyyy'), 'ECWQRhewswiloUodqS');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (255, 73, '275811818', to_date('28-08-1965', 'dd-mm-yyyy'), 'QksKgYOhHtUqDSUIqM');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (256, 365, '310515616', to_date('16-06-2004', 'dd-mm-yyyy'), 'LfOWUZuQZBWzhcBryv');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (257, 369, '468202588', to_date('17-11-2011', 'dd-mm-yyyy'), 'SxuflNWAHCUcFRmsRn');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (258, 426, '811000409', to_date('04-12-1959', 'dd-mm-yyyy'), 'avEBqPjfVrXVgnODSl');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (259, 332, '677190274', to_date('01-01-1961', 'dd-mm-yyyy'), 'MLVwbHOBPpKAKdIwJP');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (260, 15, '679625273', to_date('27-01-1972', 'dd-mm-yyyy'), 'IFTdgLRKxgmnbPevhk');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (261, 311, '412561629', to_date('04-05-2009', 'dd-mm-yyyy'), 'keVZidnJXIgrLApHAE');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (262, 436, '636894624', to_date('30-01-1989', 'dd-mm-yyyy'), 'ecWAVtMOnRWMvVQvlZ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (263, 215, '419976842', to_date('08-04-2021', 'dd-mm-yyyy'), 'ZrqkhcMfDEkVVfOHQL');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (264, 490, '280744824', to_date('12-12-2006', 'dd-mm-yyyy'), 'lVqaUFNypssZvJvukn');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (265, 492, '199263551', to_date('26-01-1962', 'dd-mm-yyyy'), 'YlKWVDATyQnwoFVBMq');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (266, 442, '328762429', to_date('28-09-2016', 'dd-mm-yyyy'), 'hERxZBlVSURvqzAKAf');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (267, 456, '765654892', to_date('02-03-2013', 'dd-mm-yyyy'), 'pZznIazvFcDngpycEu');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (268, 49, '641430213', to_date('15-08-1963', 'dd-mm-yyyy'), 'EuuxGyVkZCKEChpNBu');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (269, 432, '291207518', to_date('22-02-1949', 'dd-mm-yyyy'), 'IGVXRdpljErsCvUMbQ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (270, 368, '603195640', to_date('09-02-2014', 'dd-mm-yyyy'), 'MTZUOdpIrimcSctWSd');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (271, 463, '761147541', to_date('03-06-1959', 'dd-mm-yyyy'), 'hCmlqeLPBoXKHrvWQw');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (272, 432, '430313939', to_date('11-05-1980', 'dd-mm-yyyy'), 'DCbEHwATUIeOCIxpBv');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (273, 259, '550188787', to_date('18-03-1955', 'dd-mm-yyyy'), 'TfWSsYHamdRxDUyomB');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (274, 428, '616535497', to_date('21-11-2017', 'dd-mm-yyyy'), 'ysGJDDJzmNjUQybxmF');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (275, 279, '358892417', to_date('26-09-2006', 'dd-mm-yyyy'), 'zFXLykBHQpOurcbUcS');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (276, 166, '618886514', to_date('07-07-1972', 'dd-mm-yyyy'), 'YfbGAshfEDuExgtrTO');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (277, 255, '507463392', to_date('17-09-1991', 'dd-mm-yyyy'), 'KDEdgCNbREvtRpthQj');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (278, 236, '280744824', to_date('05-09-2018', 'dd-mm-yyyy'), 'KYdZqIgIcbOjNuQlyS');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (279, 227, '356395447', to_date('31-03-1992', 'dd-mm-yyyy'), 'skHxucEVuNosGoYCVp');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (280, 334, '456143084', to_date('18-06-1952', 'dd-mm-yyyy'), 'skRtvnyGadsqPxIVzu');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (281, 239, '593495854', to_date('23-10-1998', 'dd-mm-yyyy'), 'MoJGaJzhCAFVOLEYai');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (282, 31, '429709393', to_date('03-11-1962', 'dd-mm-yyyy'), 'cSTryVVbfKAjnvoEVI');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (283, 207, '701885400', to_date('14-08-2022', 'dd-mm-yyyy'), 'KPWwxyZZlLNtyIKJUb');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (284, 384, '398780584', to_date('01-09-1982', 'dd-mm-yyyy'), 'EPUljJXEomhWBLdPWy');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (285, 358, '344602589', to_date('20-10-1963', 'dd-mm-yyyy'), 'nhzPlzfLUPydwGIYNj');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (286, 406, '458039529', to_date('25-11-2013', 'dd-mm-yyyy'), 'FfSkORnzWPAKLjuPst');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (287, 291, '669635628', to_date('13-03-2003', 'dd-mm-yyyy'), 'xGQLvWRzOOZnFLwQis');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (288, 192, '893612092', to_date('14-06-1955', 'dd-mm-yyyy'), 'decJbHgjtIsvTtoqhx');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (289, 439, '933173824', to_date('26-10-1950', 'dd-mm-yyyy'), 'JRBmAzNdkvTaYIZKkX');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (290, 72, '703000172', to_date('05-08-2022', 'dd-mm-yyyy'), 'spuqkrqHVjhpvAPCmc');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (291, 331, '142103217', to_date('06-07-1949', 'dd-mm-yyyy'), 'XItJdTjpBbcsxJGlFT');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (292, 219, '373340230', to_date('11-01-2020', 'dd-mm-yyyy'), 'BWuWVHAOvNOmeTOJzE');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (293, 237, '765654892', to_date('11-09-1983', 'dd-mm-yyyy'), 'nJDlaXsYweggYyNsYS');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (294, 301, '771620537', to_date('06-07-1985', 'dd-mm-yyyy'), 'yrZBmDVIfScaHOwaOY');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (295, 476, '286269217', to_date('03-06-1968', 'dd-mm-yyyy'), 'GMaKEdHWEffHVQYTpZ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (296, 216, '819407033', to_date('14-05-1988', 'dd-mm-yyyy'), 'EkJDKUWaSRhmLYxKlT');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (297, 482, '702388971', to_date('20-09-1970', 'dd-mm-yyyy'), 'BkSNnhrYiYefNpStJy');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (298, 325, '464259467', to_date('23-07-2023', 'dd-mm-yyyy'), 'kgPbxZiPlmhvTiFdaf');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (299, 54, '745266349', to_date('19-03-1955', 'dd-mm-yyyy'), 'ZoHdUKjpjgNxskELYy');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (300, 70, '469026564', to_date('03-06-2022', 'dd-mm-yyyy'), 'JKjXXAeQeaztdOHsYY');
commit;
prompt 300 records committed...
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (301, 305, '624019945', to_date('04-03-1955', 'dd-mm-yyyy'), 'qbTEtFRVFZZSfBAcmA');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (302, 81, '617004013', to_date('15-02-1950', 'dd-mm-yyyy'), 'xzDiPrqsxWkpGDdsQv');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (303, 476, '733030473', to_date('25-12-1983', 'dd-mm-yyyy'), 'pedgmSwZIEPEjeOpmW');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (304, 490, '206390263', to_date('30-04-1984', 'dd-mm-yyyy'), 'avzhlLtinThqNRaLaO');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (305, 194, '915073478', to_date('23-05-2006', 'dd-mm-yyyy'), 'WpbjHeYTjeENRBmcZF');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (306, 340, '348883130', to_date('07-03-1962', 'dd-mm-yyyy'), 'IrjubHUzdNcqtjDMeL');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (307, 369, '893612092', to_date('19-08-1955', 'dd-mm-yyyy'), 'pXogtdWjkwGRaGBURE');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (308, 388, '120838721', to_date('11-02-2018', 'dd-mm-yyyy'), 'wETxjhugZFfNNZoYjD');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (309, 313, '699843817', to_date('24-03-1997', 'dd-mm-yyyy'), 'aXwrNgoStKqoImoiTf');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (310, 349, '322976540', to_date('29-03-1978', 'dd-mm-yyyy'), 'oNaJGqOiMwShycztcf');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (311, 335, '170686920', to_date('22-09-1974', 'dd-mm-yyyy'), 'WZKjOQaxsATImqHoFK');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (312, 398, '781627890', to_date('18-06-2010', 'dd-mm-yyyy'), 'OrSLmwSDKZFKriQJMG');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (313, 93, '935124533', to_date('09-09-1988', 'dd-mm-yyyy'), 'nDqXGaWlOaEnXKKIND');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (314, 283, '984507807', to_date('01-05-1954', 'dd-mm-yyyy'), 'OSGMArGRkzAzkiVVgn');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (315, 299, '979699752', to_date('07-08-1981', 'dd-mm-yyyy'), 'jWqHFPYahJDLFCvZOw');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (316, 126, '546110903', to_date('17-02-2005', 'dd-mm-yyyy'), 'KOAjSqBxBxiJFQwyHu');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (317, 163, '981292260', to_date('23-07-1985', 'dd-mm-yyyy'), 'NsYpurJrzSFshsRjjJ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (318, 384, '142726992', to_date('02-01-1956', 'dd-mm-yyyy'), 'GqmSSKhjAVnAkVykVp');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (319, 91, '317730121', to_date('19-12-1996', 'dd-mm-yyyy'), 'XfruPZpHsdcHXdQPgm');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (320, 343, '498501702', to_date('31-07-2016', 'dd-mm-yyyy'), 'kGtpjFxEabVaGTdSdc');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (321, 288, '304545484', to_date('30-10-1973', 'dd-mm-yyyy'), 'XSezfmVMeGbkAARWHY');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (322, 320, '255386323', to_date('09-06-1999', 'dd-mm-yyyy'), 'WXybMVVpisyLjTgjlI');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (323, 484, '514075773', to_date('25-05-1999', 'dd-mm-yyyy'), 'dtaThLERhUQcpkSAcM');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (324, 462, '629218112', to_date('01-05-1987', 'dd-mm-yyyy'), 'wbWfPySrkZQTzAqMZb');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (325, 136, '466859500', to_date('12-10-1953', 'dd-mm-yyyy'), 'iiXnksxxqawGRKkzxr');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (326, 416, '653091007', to_date('19-09-1997', 'dd-mm-yyyy'), 'laeWkbFPOHAwnmhGez');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (327, 68, '990702687', to_date('26-11-1994', 'dd-mm-yyyy'), 'KvsxmxFXuwxRfsKBpW');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (328, 239, '559846702', to_date('30-08-1968', 'dd-mm-yyyy'), 'nTuTkypHGFzQHdvVfw');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (329, 282, '240560700', to_date('15-06-2005', 'dd-mm-yyyy'), 'vWZkMTNOWOGGMLWPTx');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (330, 21, '248458979', to_date('11-05-2015', 'dd-mm-yyyy'), 'mHDKlFdweJGnGGoAtx');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (331, 438, '926733487', to_date('17-01-2021', 'dd-mm-yyyy'), 'ICoyWnLRXMJdYVoNoj');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (332, 316, '273115037', to_date('20-03-2015', 'dd-mm-yyyy'), 'gbTdSYMswWEVmPWLPG');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (333, 26, '253873277', to_date('29-05-1986', 'dd-mm-yyyy'), 'YjyTdqDyeaejywCZGn');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (334, 419, '218388884', to_date('02-02-1989', 'dd-mm-yyyy'), 'SfeFzDHaBdrnyHdGwN');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (335, 333, '430079593', to_date('08-10-1998', 'dd-mm-yyyy'), 'AnhVyuxQgZamCIZEgY');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (336, 286, '886687562', to_date('06-01-1987', 'dd-mm-yyyy'), 'DcrZEMdMLYNNMsNqAZ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (337, 183, '389860841', to_date('04-07-2000', 'dd-mm-yyyy'), 'DdnOpOxSMiXmsMPYzu');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (338, 301, '278242295', to_date('12-01-1992', 'dd-mm-yyyy'), 'EqYjjNwmwFjGYRuTIZ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (339, 447, '979699752', to_date('09-05-1972', 'dd-mm-yyyy'), 'sDLoqlkbaiNEemypDc');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (340, 139, '703000172', to_date('09-07-2003', 'dd-mm-yyyy'), 'WwXDMfWDEzNQzleINz');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (341, 173, '727036569', to_date('04-08-1983', 'dd-mm-yyyy'), 'GLpOQZISHhDUyprkqs');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (342, 448, '416851864', to_date('02-04-2009', 'dd-mm-yyyy'), 'dgHuUQAmcyurdIPFci');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (343, 298, '353076215', to_date('04-10-2004', 'dd-mm-yyyy'), 'PWzIKtXOeRhHhtsbKQ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (344, 33, '922153228', to_date('29-03-1957', 'dd-mm-yyyy'), 'WBLlyYZnLmNctzZRev');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (345, 318, '325949401', to_date('30-10-1962', 'dd-mm-yyyy'), 'PlWLJrezTkzmTWvSRl');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (346, 397, '130541894', to_date('04-11-1959', 'dd-mm-yyyy'), 'GoZOEErfwxQPrGxzoI');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (347, 132, '502757972', to_date('10-09-2002', 'dd-mm-yyyy'), 'AhcYddRZOxQrsaVdvr');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (348, 488, '461345159', to_date('06-07-2009', 'dd-mm-yyyy'), 'awvEZwVYtrPKNOmwdv');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (349, 414, '604498731', to_date('28-07-1981', 'dd-mm-yyyy'), 'sYchIswAZktZPHlBHS');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (350, 498, '188447845', to_date('05-07-1959', 'dd-mm-yyyy'), 'OMpMhfSPgNGwjaBiNs');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (351, 490, '230916271', to_date('08-09-1992', 'dd-mm-yyyy'), 'kyKeiTPpDJjuXoJmgs');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (352, 211, '469026564', to_date('04-12-1981', 'dd-mm-yyyy'), 'XMkPMLTGcsKNeOEhHd');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (353, 258, '379358545', to_date('04-07-1992', 'dd-mm-yyyy'), 'JgptsgSuBLXfwRQSXF');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (354, 365, '572376377', to_date('08-10-2000', 'dd-mm-yyyy'), 'vvwsUccirmjiRtvAyg');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (355, 172, '212337037', to_date('18-07-2020', 'dd-mm-yyyy'), 'aWmzvrMmSrhMSdDzSe');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (356, 379, '414354963', to_date('27-01-1984', 'dd-mm-yyyy'), 'XRKvBXcdxZwvashPjm');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (357, 426, '756902400', to_date('07-12-1964', 'dd-mm-yyyy'), 'OkmzrMNwfiDSokqZwK');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (358, 397, '579229923', to_date('06-11-1994', 'dd-mm-yyyy'), 'JJFBpeNRSdbFxdipSd');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (359, 472, '532856593', to_date('27-05-2005', 'dd-mm-yyyy'), 'QMmjEnOsMdqdvKagnX');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (360, 357, '517481669', to_date('28-01-2001', 'dd-mm-yyyy'), 'fkinzURkkChvXPPvdQ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (361, 244, '660114886', to_date('23-12-2014', 'dd-mm-yyyy'), 'hmsYDpkcqtwZigfSqA');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (362, 115, '126369837', to_date('04-04-1998', 'dd-mm-yyyy'), 'dWpoCDouJhAWMwPyfL');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (363, 171, '504846663', to_date('17-10-1974', 'dd-mm-yyyy'), 'HXelpCBDuOETTamlAZ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (364, 423, '359656864', to_date('09-07-1983', 'dd-mm-yyyy'), 'ZNTJnAvxCNItvEuVRm');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (365, 490, '269545774', to_date('22-07-2006', 'dd-mm-yyyy'), 'gXEOEYqACVNqAQphbH');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (366, 233, '858433306', to_date('17-03-2010', 'dd-mm-yyyy'), 'tMaoGvYXELREnpMunM');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (367, 414, '710662044', to_date('16-12-1985', 'dd-mm-yyyy'), 'yXPCDYRRLPaSDHPdJf');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (368, 215, '478286232', to_date('01-05-1949', 'dd-mm-yyyy'), 'ertkBcUfiqltoZUZTn');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (369, 25, '617004013', to_date('17-11-1989', 'dd-mm-yyyy'), 'eroqRRWuiSMqkuqila');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (370, 479, '463750879', to_date('07-11-1961', 'dd-mm-yyyy'), 'bjJnziQjZjFfsXrcmS');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (371, 193, '725969019', to_date('04-10-1969', 'dd-mm-yyyy'), 'PADdCjRcvLWZZwAQPs');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (372, 243, '801928146', to_date('04-03-2006', 'dd-mm-yyyy'), 'ZTNqhgDwHuzotpILCb');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (373, 148, '255554243', to_date('10-05-1975', 'dd-mm-yyyy'), 'cKmRxjRPBCoevOKvOm');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (374, 311, '234438638', to_date('18-06-2005', 'dd-mm-yyyy'), 'xUqPdDHpsZSXTRdBLn');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (375, 334, '194333287', to_date('05-07-1980', 'dd-mm-yyyy'), 'gqfVhZMOLQgXxwZJIt');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (376, 415, '819407033', to_date('23-11-1993', 'dd-mm-yyyy'), 'xIpbqWsmicyGAAamYL');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (377, 98, '353076215', to_date('26-08-1991', 'dd-mm-yyyy'), 'SfZCpEAbfbQCiPxKJW');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (378, 308, '611378835', to_date('01-08-2014', 'dd-mm-yyyy'), 'nwYzoqHAISndTEjHrz');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (379, 447, '146345404', to_date('26-12-1985', 'dd-mm-yyyy'), 'ZpxqipAaptiWixjlnx');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (380, 173, '683681759', to_date('31-08-1985', 'dd-mm-yyyy'), 'jibCCBgSKgAhaDUEhV');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (381, 277, '990702687', to_date('05-10-1951', 'dd-mm-yyyy'), 'VJmiZHIfBLjDmknCVL');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (382, 135, '257590022', to_date('17-03-1961', 'dd-mm-yyyy'), 'qslDDBjjrhkErcMDMJ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (383, 483, '614822926', to_date('31-12-2022', 'dd-mm-yyyy'), 'linOoQowppBzwJyClu');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (384, 442, '573411013', to_date('28-03-2017', 'dd-mm-yyyy'), 'EJnQqPakHiHnFTdpKH');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (385, 354, '650397569', to_date('19-11-2009', 'dd-mm-yyyy'), 'ZxPpudoGpRjFlvJwWn');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (386, 95, '954326355', to_date('07-02-1967', 'dd-mm-yyyy'), 'nRAAhhjBARKIVynuxH');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (387, 127, '775103701', to_date('14-10-1966', 'dd-mm-yyyy'), 'GVMpKgtHnPYvVxvWPc');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (388, 237, '929847660', to_date('14-01-2017', 'dd-mm-yyyy'), 'XsYiTEeNCtmcRodNRU');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (389, 63, '620435401', to_date('06-12-1982', 'dd-mm-yyyy'), 'KpOXCitKBFJbkalLfy');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (390, 431, '669635628', to_date('01-04-1985', 'dd-mm-yyyy'), 'NSvusJBwbuqRljyGwf');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (391, 393, '961717453', to_date('22-07-2005', 'dd-mm-yyyy'), 'kqBMFBehGelBHtjyiC');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (392, 378, '892482262', to_date('15-07-2016', 'dd-mm-yyyy'), 'YlzlwkguHOjrIakWnI');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (393, 132, '508295655', to_date('08-06-2001', 'dd-mm-yyyy'), 'KFfjlmPLUYulPBvlzy');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (394, 140, '550188787', to_date('24-07-1998', 'dd-mm-yyyy'), 'PtuBOxdabNJSVfXGed');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (395, 418, '508295655', to_date('08-07-1966', 'dd-mm-yyyy'), 'KEATHjEDWEbbAmnjer');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (396, 410, '129038722', to_date('15-07-1979', 'dd-mm-yyyy'), 'fSiHEbZsgYwqPnejFm');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (397, 381, '353563177', to_date('29-09-2013', 'dd-mm-yyyy'), 'AwOxFxsFONoYFUSECD');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (398, 198, '514075773', to_date('11-11-1969', 'dd-mm-yyyy'), 'AQMaQKKdoXqofiHpVw');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (399, 76, '266057750', to_date('31-08-1990', 'dd-mm-yyyy'), 'aMSAalSXSygLyBNQpI');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (400, 429, '507463392', to_date('18-11-1975', 'dd-mm-yyyy'), 'PyOAYppixcGESakByh');
commit;
prompt 400 records committed...
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (401, 183, '430313939', to_date('04-04-1966', 'dd-mm-yyyy'), 'RiiBzUtImrHTOJCYPF');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (402, 236, '742810531', to_date('29-03-2012', 'dd-mm-yyyy'), 'FWIsaXZcHgIcpvljXQ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (403, 143, '883614739', to_date('24-08-1980', 'dd-mm-yyyy'), 'JqtKVKriZjMhpASPag');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (404, 158, '521806306', to_date('11-03-2000', 'dd-mm-yyyy'), 'lgTutTYReYZzEamgGH');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (405, 87, '468202588', to_date('07-07-1993', 'dd-mm-yyyy'), 'ABvIpnBYhUjUKYWUEY');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (406, 285, '469305119', to_date('23-10-1975', 'dd-mm-yyyy'), 'uMRTrEJNgkIYeqrkVy');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (407, 389, '828060363', to_date('29-01-1977', 'dd-mm-yyyy'), 'LDKaxVufBhtPkYMCFm');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (408, 231, '310515616', to_date('13-03-1971', 'dd-mm-yyyy'), 'TvmyMSgYBYMqGpMeOr');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (409, 31, '653091007', to_date('06-01-1971', 'dd-mm-yyyy'), 'yMRCSbugQzvWizMarc');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (410, 395, '910589575', to_date('11-12-2021', 'dd-mm-yyyy'), 'KrRVkBbBHisQDLSYCZ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (411, 82, '999139334', to_date('07-07-1989', 'dd-mm-yyyy'), 'rlEuslxKQpDBcBnRjv');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (412, 266, '286269217', to_date('21-02-2010', 'dd-mm-yyyy'), 'HTvdTvwvDcRzsZGYwP');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (413, 207, '230916271', to_date('22-06-2006', 'dd-mm-yyyy'), 'DDIsqrcTYjIvTqnoXC');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (414, 4, '428790239', to_date('01-02-1975', 'dd-mm-yyyy'), 'zAfPUEFMsSfnOkCqPP');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (415, 39, '242658998', to_date('28-06-1955', 'dd-mm-yyyy'), 'jvQdOyVtbMjYDzraGM');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (416, 444, '242658998', to_date('20-12-1975', 'dd-mm-yyyy'), 'RZIHJMDJSLCmpwrpCi');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (417, 246, '296785750', to_date('08-06-1968', 'dd-mm-yyyy'), 'XFDKdTVKHIefGqPTut');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (418, 95, '752323983', to_date('13-02-1973', 'dd-mm-yyyy'), 'LDKoFDobaQIoaajtxG');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (419, 434, '945584548', to_date('17-11-1987', 'dd-mm-yyyy'), 'IryvwHontFYRrlFjAj');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (420, 436, '240560700', to_date('11-09-1989', 'dd-mm-yyyy'), 'wEgazKNrBrBPGwkgXL');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (421, 42, '645637087', to_date('27-12-1969', 'dd-mm-yyyy'), 'tOcuyllyEKGDDmuzzW');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (422, 277, '875625449', to_date('11-06-2016', 'dd-mm-yyyy'), 'YVOVAwoncoakuGJLIU');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (423, 264, '211468215', to_date('04-12-1949', 'dd-mm-yyyy'), 'OXhYEjligtnaApOMLz');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (424, 116, '111209134', to_date('01-09-1975', 'dd-mm-yyyy'), 'GLLvCVpTyMdDYDnGOs');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (425, 128, '782344124', to_date('28-05-2020', 'dd-mm-yyyy'), 'HdouzTpVmRRkgQetvO');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (426, 72, '493446132', to_date('02-10-1986', 'dd-mm-yyyy'), 'RbwosnKubOOcyZYYzt');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (427, 444, '212337037', to_date('20-03-2000', 'dd-mm-yyyy'), 'ZCLPMAqBRXRXZGcSQF');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (428, 178, '496806519', to_date('27-02-1990', 'dd-mm-yyyy'), 'YLqGIJKZgcMLFLVUoB');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (429, 175, '430051956', to_date('21-07-1964', 'dd-mm-yyyy'), 'jfonTKppnzcBIBnODm');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (430, 308, '559789779', to_date('18-08-1977', 'dd-mm-yyyy'), 'RgExxtVJRKRABABbhq');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (431, 153, '644874373', to_date('09-12-1968', 'dd-mm-yyyy'), 'gWHVgrgvGLOiTSjPzG');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (432, 338, '248458979', to_date('12-12-2010', 'dd-mm-yyyy'), 'vRcmcdMitfXYHmcFct');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (433, 284, '726828214', to_date('30-10-2012', 'dd-mm-yyyy'), 'jJranuSDksppIgXWOv');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (434, 128, '204863361', to_date('25-12-1961', 'dd-mm-yyyy'), 'NJaMsjtPJGONLyRaPD');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (435, 182, '593697825', to_date('01-10-2005', 'dd-mm-yyyy'), 'WZZKVKmuGJxcNvlfBw');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (436, 477, '677781908', to_date('25-05-2008', 'dd-mm-yyyy'), 'ByXVqNFbEvBKNttvsP');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (437, 380, '548052310', to_date('04-07-1979', 'dd-mm-yyyy'), 'cKefBtvcTxIECqWJUA');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (438, 288, '519221254', to_date('28-05-1968', 'dd-mm-yyyy'), 'wmBToBqcTJieKXtndP');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (439, 133, '557487056', to_date('03-07-2018', 'dd-mm-yyyy'), 'ctyiwqOoWpaaoVchnB');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (440, 175, '221260788', to_date('08-08-1997', 'dd-mm-yyyy'), 'LkfZtPWMQOWHMZeXQP');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (441, 128, '346672144', to_date('22-03-2002', 'dd-mm-yyyy'), 'ikKoZoBpsHBbccoppC');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (442, 482, '797794438', to_date('06-07-1981', 'dd-mm-yyyy'), 'qCbfdIZuTVrZMEIpCf');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (443, 481, '715275975', to_date('29-03-2001', 'dd-mm-yyyy'), 'EMoNnmGpqxkAMbhvwS');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (444, 234, '325949401', to_date('05-03-2018', 'dd-mm-yyyy'), 'AcicQfwInrtKLEAOnz');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (445, 445, '394635463', to_date('03-07-1986', 'dd-mm-yyyy'), 'KaeYFKKGYgBAFSxkaY');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (446, 135, '546110903', to_date('23-04-2016', 'dd-mm-yyyy'), 'JVbIJcrpUAUeUsBsVD');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (447, 105, '233568845', to_date('04-09-1948', 'dd-mm-yyyy'), 'ueMcmXjOUesaVXmLJz');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (448, 381, '286269217', to_date('31-03-2007', 'dd-mm-yyyy'), 'TAQkTvqPMeZEWpOZXo');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (449, 269, '389860841', to_date('24-01-1978', 'dd-mm-yyyy'), 'IBbWciKFszZvGaiDjz');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (450, 146, '300472505', to_date('16-09-1999', 'dd-mm-yyyy'), 'WdJTWyLzBxUcOjJQEA');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (451, 29, '686094438', to_date('13-07-1973', 'dd-mm-yyyy'), 'LIHpJJmvDeFJjXRkBD');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (452, 8, '748710686', to_date('14-03-2006', 'dd-mm-yyyy'), 'HBDabqKUjEdHzmcdJy');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (453, 397, '493508774', to_date('02-10-1960', 'dd-mm-yyyy'), 'UNHopfkwCjQerfLfrn');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (454, 262, '304545484', to_date('24-02-2023', 'dd-mm-yyyy'), 'ugyImCDaMNJFIFijaH');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (455, 246, '701885400', to_date('09-01-1970', 'dd-mm-yyyy'), 'bIaTmiHfyybRHSGwmL');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (456, 394, '927136387', to_date('06-10-2020', 'dd-mm-yyyy'), 'PndEdhfhGdzLnqKcJc');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (457, 323, '430051956', to_date('28-11-1952', 'dd-mm-yyyy'), 'bmPHuLfaXsxRvIxvEu');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (458, 336, '820169828', to_date('06-07-1953', 'dd-mm-yyyy'), 'YCksMrtutEhaosALRd');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (459, 117, '579229923', to_date('28-10-2009', 'dd-mm-yyyy'), 'ZQJlCCLLofexfpvzTh');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (460, 13, '634442332', to_date('16-12-2012', 'dd-mm-yyyy'), 'QrylRUcUIAyXbIFBPB');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (461, 132, '108036821', to_date('27-12-2001', 'dd-mm-yyyy'), 'uNUOfOicoQGfdgwJKl');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (462, 375, '122292168', to_date('09-04-1992', 'dd-mm-yyyy'), 'cRTWOAvJaOVQpmsnKl');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (463, 455, '280744824', to_date('12-10-2015', 'dd-mm-yyyy'), 'WBdwjSyOKzuGQbiMVH');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (464, 111, '493508774', to_date('07-07-1990', 'dd-mm-yyyy'), 'eibwhaOQLiVkBYtOSa');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (465, 119, '111209134', to_date('24-03-2000', 'dd-mm-yyyy'), 'xcIrXFHITmhsOBEOMO');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (466, 409, '657661723', to_date('21-01-1992', 'dd-mm-yyyy'), 'PLziNKTJKCJBCRTaBV');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (467, 46, '702352804', to_date('26-09-2013', 'dd-mm-yyyy'), 'rZzVMpeRKnkzkPPlCO');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (468, 421, '504995192', to_date('16-04-1950', 'dd-mm-yyyy'), 'aiJuTYOuAuXcZKUSlZ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (469, 455, '941677857', to_date('12-03-2023', 'dd-mm-yyyy'), 'yBLMOodksUMIhpdQCI');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (470, 307, '715593486', to_date('27-07-1994', 'dd-mm-yyyy'), 'JScoNKzFovKQBNFQjh');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (471, 464, '266057750', to_date('04-10-2001', 'dd-mm-yyyy'), 'kDCEksxGyvGYyFFubB');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (472, 448, '870985228', to_date('07-04-1983', 'dd-mm-yyyy'), 'xlljDseOyBIPgJfPtu');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (473, 314, '560813964', to_date('05-01-2012', 'dd-mm-yyyy'), 'ahMLGkvldIRwIrnQFY');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (474, 341, '600203338', to_date('19-01-1989', 'dd-mm-yyyy'), 'NsijIBXfMQfhqGnMnr');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (475, 186, '663504103', to_date('27-01-2015', 'dd-mm-yyyy'), 'mDgOGzCDGCCCCaSyGr');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (476, 430, '973291381', to_date('09-09-1955', 'dd-mm-yyyy'), 'EFwoJVgknnPcZGwrGW');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (477, 24, '711480574', to_date('30-01-1995', 'dd-mm-yyyy'), 'bKWuTbcbVZGDQoXmFZ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (478, 376, '829982840', to_date('27-03-1949', 'dd-mm-yyyy'), 'sMbksPooqGCWuZBFjq');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (479, 105, '273111266', to_date('09-01-1996', 'dd-mm-yyyy'), 'oPUxeROGIEiPxlUFTw');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (480, 175, '797794438', to_date('23-11-2023', 'dd-mm-yyyy'), 'towdcLeJnewqaNujfW');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (481, 420, '319695079', to_date('14-02-2012', 'dd-mm-yyyy'), 'mkWpMrLaKjcQBlvegm');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (482, 222, '280303286', to_date('05-12-2009', 'dd-mm-yyyy'), 'RVRftYtedJxdYGkSRZ');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (483, 199, '530467033', to_date('18-05-2009', 'dd-mm-yyyy'), 'pQLJjkbxFAevGUryoI');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (484, 117, '514075773', to_date('26-05-1991', 'dd-mm-yyyy'), 'YkREdovHWoovZurtvU');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (485, 201, '734538392', to_date('26-04-1986', 'dd-mm-yyyy'), 'lmsNKGcKWesuzTznhx');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (486, 284, '463750879', to_date('09-04-1979', 'dd-mm-yyyy'), 'JIJDrWjvboWGAxXiCv');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (487, 224, '326077937', to_date('16-04-1994', 'dd-mm-yyyy'), 'iHbyIqDxcFHWAVQrIv');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (488, 42, '417746558', to_date('29-10-2019', 'dd-mm-yyyy'), 'khBHXwSHBMDagjrfZK');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (489, 227, '348573167', to_date('27-05-1961', 'dd-mm-yyyy'), 'tozwlFmBIXrWKEbidV');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (490, 297, '457664655', to_date('13-09-1985', 'dd-mm-yyyy'), 'noKEBwmIFLOMOrKtZp');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (491, 406, '644874373', to_date('20-03-2011', 'dd-mm-yyyy'), 'IuiifZpZqMfEmJiwTl');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (492, 80, '230916271', to_date('18-03-1980', 'dd-mm-yyyy'), 'ChrURtVodTEMhzLOMj');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (493, 305, '139140982', to_date('02-07-1999', 'dd-mm-yyyy'), 'KAgPcNspSpIBMIiLTt');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (494, 36, '170686920', to_date('27-09-1973', 'dd-mm-yyyy'), 'SCSGTqLAjWBUDWpKAu');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (495, 268, '607016492', to_date('08-02-1985', 'dd-mm-yyyy'), 'KlyqpTYWwSsEIxAnvi');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (496, 174, '331643917', to_date('31-03-1994', 'dd-mm-yyyy'), 'xtSIQOdkkGhgfbJCDt');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (497, 142, '590707337', to_date('07-07-1966', 'dd-mm-yyyy'), 'cCtdfGfnCTEqneiypf');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (498, 27, '907727540', to_date('12-08-1961', 'dd-mm-yyyy'), 'QyFVYrOlGumLRBawOS');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (499, 323, '109023220', to_date('19-03-2017', 'dd-mm-yyyy'), 'FjnBiSxIWTPeGdrkmh');
insert into INTELLIGENCE_REPORTS (i_id, o_id, submitted_by, date_submitted, content_)
values (500, 349, '476086289', to_date('19-01-2022', 'dd-mm-yyyy'), 'VzUJQyFAWhLDPCbpYM');
commit;
prompt 500 records loaded
prompt Loading SUBMITS...
insert into SUBMITS (p_id, i_id)
values (100524489, 341);
insert into SUBMITS (p_id, i_id)
values (100524489, 453);
insert into SUBMITS (p_id, i_id)
values (108036821, 49);
insert into SUBMITS (p_id, i_id)
values (108036821, 241);
insert into SUBMITS (p_id, i_id)
values (109023220, 415);
insert into SUBMITS (p_id, i_id)
values (109322959, 2);
insert into SUBMITS (p_id, i_id)
values (109322959, 122);
insert into SUBMITS (p_id, i_id)
values (109322959, 371);
insert into SUBMITS (p_id, i_id)
values (109322959, 500);
insert into SUBMITS (p_id, i_id)
values (111209134, 186);
insert into SUBMITS (p_id, i_id)
values (113519793, 75);
insert into SUBMITS (p_id, i_id)
values (117375114, 444);
insert into SUBMITS (p_id, i_id)
values (117375114, 500);
insert into SUBMITS (p_id, i_id)
values (119469456, 460);
insert into SUBMITS (p_id, i_id)
values (122292168, 152);
insert into SUBMITS (p_id, i_id)
values (123198011, 206);
insert into SUBMITS (p_id, i_id)
values (123198011, 248);
insert into SUBMITS (p_id, i_id)
values (124140669, 290);
insert into SUBMITS (p_id, i_id)
values (125616546, 334);
insert into SUBMITS (p_id, i_id)
values (126369837, 359);
insert into SUBMITS (p_id, i_id)
values (128101043, 410);
insert into SUBMITS (p_id, i_id)
values (129038722, 185);
insert into SUBMITS (p_id, i_id)
values (129038722, 384);
insert into SUBMITS (p_id, i_id)
values (129359959, 108);
insert into SUBMITS (p_id, i_id)
values (129359959, 493);
insert into SUBMITS (p_id, i_id)
values (130541894, 2);
insert into SUBMITS (p_id, i_id)
values (130541894, 15);
insert into SUBMITS (p_id, i_id)
values (130541894, 333);
insert into SUBMITS (p_id, i_id)
values (132453957, 96);
insert into SUBMITS (p_id, i_id)
values (132524464, 201);
insert into SUBMITS (p_id, i_id)
values (133997280, 183);
insert into SUBMITS (p_id, i_id)
values (138218924, 427);
insert into SUBMITS (p_id, i_id)
values (139140982, 125);
insert into SUBMITS (p_id, i_id)
values (139140982, 368);
insert into SUBMITS (p_id, i_id)
values (140395346, 162);
insert into SUBMITS (p_id, i_id)
values (140395346, 300);
insert into SUBMITS (p_id, i_id)
values (140395346, 359);
insert into SUBMITS (p_id, i_id)
values (140607671, 126);
insert into SUBMITS (p_id, i_id)
values (140607671, 222);
insert into SUBMITS (p_id, i_id)
values (140607671, 260);
insert into SUBMITS (p_id, i_id)
values (140607671, 411);
insert into SUBMITS (p_id, i_id)
values (140607671, 468);
insert into SUBMITS (p_id, i_id)
values (142103217, 273);
insert into SUBMITS (p_id, i_id)
values (146345404, 348);
insert into SUBMITS (p_id, i_id)
values (154828498, 344);
insert into SUBMITS (p_id, i_id)
values (154828498, 346);
insert into SUBMITS (p_id, i_id)
values (157518065, 457);
insert into SUBMITS (p_id, i_id)
values (163672147, 342);
insert into SUBMITS (p_id, i_id)
values (170686920, 316);
insert into SUBMITS (p_id, i_id)
values (173901470, 496);
insert into SUBMITS (p_id, i_id)
values (175852055, 278);
insert into SUBMITS (p_id, i_id)
values (177800749, 379);
insert into SUBMITS (p_id, i_id)
values (185435795, 264);
insert into SUBMITS (p_id, i_id)
values (185435795, 304);
insert into SUBMITS (p_id, i_id)
values (185923562, 113);
insert into SUBMITS (p_id, i_id)
values (185923562, 327);
insert into SUBMITS (p_id, i_id)
values (186803333, 165);
insert into SUBMITS (p_id, i_id)
values (188447845, 94);
insert into SUBMITS (p_id, i_id)
values (190438918, 120);
insert into SUBMITS (p_id, i_id)
values (192489859, 319);
insert into SUBMITS (p_id, i_id)
values (194333287, 72);
insert into SUBMITS (p_id, i_id)
values (194333287, 308);
insert into SUBMITS (p_id, i_id)
values (195353984, 40);
insert into SUBMITS (p_id, i_id)
values (199263551, 419);
insert into SUBMITS (p_id, i_id)
values (201214764, 53);
insert into SUBMITS (p_id, i_id)
values (204863361, 15);
insert into SUBMITS (p_id, i_id)
values (204863361, 364);
insert into SUBMITS (p_id, i_id)
values (205610009, 421);
insert into SUBMITS (p_id, i_id)
values (206390263, 123);
insert into SUBMITS (p_id, i_id)
values (211468215, 379);
insert into SUBMITS (p_id, i_id)
values (211909943, 82);
insert into SUBMITS (p_id, i_id)
values (212337037, 431);
insert into SUBMITS (p_id, i_id)
values (215063132, 34);
insert into SUBMITS (p_id, i_id)
values (215643820, 484);
insert into SUBMITS (p_id, i_id)
values (218388884, 16);
insert into SUBMITS (p_id, i_id)
values (218388884, 268);
insert into SUBMITS (p_id, i_id)
values (219371383, 345);
insert into SUBMITS (p_id, i_id)
values (221260788, 386);
insert into SUBMITS (p_id, i_id)
values (224467628, 41);
insert into SUBMITS (p_id, i_id)
values (224467628, 474);
insert into SUBMITS (p_id, i_id)
values (229574400, 381);
insert into SUBMITS (p_id, i_id)
values (229574400, 418);
insert into SUBMITS (p_id, i_id)
values (230916271, 372);
insert into SUBMITS (p_id, i_id)
values (234438638, 27);
insert into SUBMITS (p_id, i_id)
values (234438638, 364);
insert into SUBMITS (p_id, i_id)
values (242658998, 296);
insert into SUBMITS (p_id, i_id)
values (243929221, 290);
insert into SUBMITS (p_id, i_id)
values (243929221, 316);
insert into SUBMITS (p_id, i_id)
values (248458979, 107);
insert into SUBMITS (p_id, i_id)
values (250714205, 351);
insert into SUBMITS (p_id, i_id)
values (252359922, 124);
insert into SUBMITS (p_id, i_id)
values (252359922, 189);
insert into SUBMITS (p_id, i_id)
values (253873277, 359);
insert into SUBMITS (p_id, i_id)
values (255386323, 322);
insert into SUBMITS (p_id, i_id)
values (255386323, 343);
insert into SUBMITS (p_id, i_id)
values (255554243, 188);
insert into SUBMITS (p_id, i_id)
values (269545774, 6);
insert into SUBMITS (p_id, i_id)
values (272128767, 27);
insert into SUBMITS (p_id, i_id)
values (273111266, 493);
insert into SUBMITS (p_id, i_id)
values (275811818, 445);
commit;
prompt 100 records committed...
insert into SUBMITS (p_id, i_id)
values (280060985, 30);
insert into SUBMITS (p_id, i_id)
values (280060985, 402);
insert into SUBMITS (p_id, i_id)
values (281382002, 170);
insert into SUBMITS (p_id, i_id)
values (281382002, 347);
insert into SUBMITS (p_id, i_id)
values (282926735, 468);
insert into SUBMITS (p_id, i_id)
values (283469435, 489);
insert into SUBMITS (p_id, i_id)
values (285175009, 184);
insert into SUBMITS (p_id, i_id)
values (285175009, 432);
insert into SUBMITS (p_id, i_id)
values (286523635, 451);
insert into SUBMITS (p_id, i_id)
values (288155076, 491);
insert into SUBMITS (p_id, i_id)
values (294440563, 56);
insert into SUBMITS (p_id, i_id)
values (294440563, 146);
insert into SUBMITS (p_id, i_id)
values (294440563, 373);
insert into SUBMITS (p_id, i_id)
values (296785750, 129);
insert into SUBMITS (p_id, i_id)
values (296785750, 241);
insert into SUBMITS (p_id, i_id)
values (300291035, 416);
insert into SUBMITS (p_id, i_id)
values (300472505, 139);
insert into SUBMITS (p_id, i_id)
values (300472505, 368);
insert into SUBMITS (p_id, i_id)
values (302054375, 91);
insert into SUBMITS (p_id, i_id)
values (304545484, 36);
insert into SUBMITS (p_id, i_id)
values (310515616, 57);
insert into SUBMITS (p_id, i_id)
values (310515616, 452);
insert into SUBMITS (p_id, i_id)
values (316092988, 118);
insert into SUBMITS (p_id, i_id)
values (316092988, 142);
insert into SUBMITS (p_id, i_id)
values (316092988, 380);
insert into SUBMITS (p_id, i_id)
values (316536263, 83);
insert into SUBMITS (p_id, i_id)
values (316536263, 318);
insert into SUBMITS (p_id, i_id)
values (316536263, 425);
insert into SUBMITS (p_id, i_id)
values (316536263, 475);
insert into SUBMITS (p_id, i_id)
values (317730121, 270);
insert into SUBMITS (p_id, i_id)
values (317730121, 277);
insert into SUBMITS (p_id, i_id)
values (318766558, 315);
insert into SUBMITS (p_id, i_id)
values (318766558, 412);
insert into SUBMITS (p_id, i_id)
values (319695079, 487);
insert into SUBMITS (p_id, i_id)
values (323838720, 162);
insert into SUBMITS (p_id, i_id)
values (325158891, 358);
insert into SUBMITS (p_id, i_id)
values (325949401, 112);
insert into SUBMITS (p_id, i_id)
values (325949401, 487);
insert into SUBMITS (p_id, i_id)
values (328762429, 189);
insert into SUBMITS (p_id, i_id)
values (328762429, 368);
insert into SUBMITS (p_id, i_id)
values (330183141, 227);
insert into SUBMITS (p_id, i_id)
values (330183141, 264);
insert into SUBMITS (p_id, i_id)
values (330183141, 350);
insert into SUBMITS (p_id, i_id)
values (330183141, 417);
insert into SUBMITS (p_id, i_id)
values (331643917, 55);
insert into SUBMITS (p_id, i_id)
values (344602589, 322);
insert into SUBMITS (p_id, i_id)
values (346672144, 110);
insert into SUBMITS (p_id, i_id)
values (346672144, 423);
insert into SUBMITS (p_id, i_id)
values (348823969, 298);
insert into SUBMITS (p_id, i_id)
values (348883130, 486);
insert into SUBMITS (p_id, i_id)
values (350394056, 120);
insert into SUBMITS (p_id, i_id)
values (352212956, 482);
insert into SUBMITS (p_id, i_id)
values (353207758, 191);
insert into SUBMITS (p_id, i_id)
values (353563177, 365);
insert into SUBMITS (p_id, i_id)
values (355579253, 376);
insert into SUBMITS (p_id, i_id)
values (356818489, 147);
insert into SUBMITS (p_id, i_id)
values (356818489, 343);
insert into SUBMITS (p_id, i_id)
values (356818489, 462);
insert into SUBMITS (p_id, i_id)
values (358892417, 44);
insert into SUBMITS (p_id, i_id)
values (359656864, 422);
insert into SUBMITS (p_id, i_id)
values (368255077, 250);
insert into SUBMITS (p_id, i_id)
values (369166669, 18);
insert into SUBMITS (p_id, i_id)
values (369166669, 175);
insert into SUBMITS (p_id, i_id)
values (369166669, 449);
insert into SUBMITS (p_id, i_id)
values (372709260, 320);
insert into SUBMITS (p_id, i_id)
values (372944217, 293);
insert into SUBMITS (p_id, i_id)
values (375247704, 154);
insert into SUBMITS (p_id, i_id)
values (375247704, 435);
insert into SUBMITS (p_id, i_id)
values (383636009, 369);
insert into SUBMITS (p_id, i_id)
values (383636009, 446);
insert into SUBMITS (p_id, i_id)
values (384817053, 79);
insert into SUBMITS (p_id, i_id)
values (384817053, 350);
insert into SUBMITS (p_id, i_id)
values (384922666, 344);
insert into SUBMITS (p_id, i_id)
values (394635463, 348);
insert into SUBMITS (p_id, i_id)
values (400143150, 110);
insert into SUBMITS (p_id, i_id)
values (400143150, 127);
insert into SUBMITS (p_id, i_id)
values (406547252, 60);
insert into SUBMITS (p_id, i_id)
values (406547252, 227);
insert into SUBMITS (p_id, i_id)
values (412561629, 425);
insert into SUBMITS (p_id, i_id)
values (416087325, 43);
insert into SUBMITS (p_id, i_id)
values (416087325, 262);
insert into SUBMITS (p_id, i_id)
values (416087325, 426);
insert into SUBMITS (p_id, i_id)
values (416851864, 54);
insert into SUBMITS (p_id, i_id)
values (416851864, 159);
insert into SUBMITS (p_id, i_id)
values (416851864, 490);
insert into SUBMITS (p_id, i_id)
values (417746558, 75);
insert into SUBMITS (p_id, i_id)
values (417746558, 109);
insert into SUBMITS (p_id, i_id)
values (417746558, 173);
insert into SUBMITS (p_id, i_id)
values (419443658, 200);
insert into SUBMITS (p_id, i_id)
values (419443658, 283);
insert into SUBMITS (p_id, i_id)
values (419443658, 303);
insert into SUBMITS (p_id, i_id)
values (419443658, 371);
insert into SUBMITS (p_id, i_id)
values (423861650, 96);
insert into SUBMITS (p_id, i_id)
values (423861650, 352);
insert into SUBMITS (p_id, i_id)
values (426546474, 319);
insert into SUBMITS (p_id, i_id)
values (428790239, 7);
insert into SUBMITS (p_id, i_id)
values (428790239, 167);
insert into SUBMITS (p_id, i_id)
values (430051956, 228);
insert into SUBMITS (p_id, i_id)
values (430079593, 66);
insert into SUBMITS (p_id, i_id)
values (430313939, 303);
commit;
prompt 200 records committed...
insert into SUBMITS (p_id, i_id)
values (435733202, 208);
insert into SUBMITS (p_id, i_id)
values (443837792, 228);
insert into SUBMITS (p_id, i_id)
values (444741507, 485);
insert into SUBMITS (p_id, i_id)
values (446830559, 493);
insert into SUBMITS (p_id, i_id)
values (451899133, 315);
insert into SUBMITS (p_id, i_id)
values (456143084, 268);
insert into SUBMITS (p_id, i_id)
values (456143084, 455);
insert into SUBMITS (p_id, i_id)
values (457664655, 76);
insert into SUBMITS (p_id, i_id)
values (457664655, 297);
insert into SUBMITS (p_id, i_id)
values (458039529, 48);
insert into SUBMITS (p_id, i_id)
values (461345159, 123);
insert into SUBMITS (p_id, i_id)
values (461345159, 314);
insert into SUBMITS (p_id, i_id)
values (464259467, 154);
insert into SUBMITS (p_id, i_id)
values (464259467, 254);
insert into SUBMITS (p_id, i_id)
values (464259467, 327);
insert into SUBMITS (p_id, i_id)
values (469305119, 438);
insert into SUBMITS (p_id, i_id)
values (470874452, 367);
insert into SUBMITS (p_id, i_id)
values (476400862, 41);
insert into SUBMITS (p_id, i_id)
values (478286232, 237);
insert into SUBMITS (p_id, i_id)
values (478286232, 379);
insert into SUBMITS (p_id, i_id)
values (479692269, 443);
insert into SUBMITS (p_id, i_id)
values (479692269, 490);
insert into SUBMITS (p_id, i_id)
values (488109781, 90);
insert into SUBMITS (p_id, i_id)
values (493508774, 111);
insert into SUBMITS (p_id, i_id)
values (493508774, 174);
insert into SUBMITS (p_id, i_id)
values (493508774, 337);
insert into SUBMITS (p_id, i_id)
values (496806519, 331);
insert into SUBMITS (p_id, i_id)
values (496913316, 194);
insert into SUBMITS (p_id, i_id)
values (498501702, 145);
insert into SUBMITS (p_id, i_id)
values (498821372, 121);
insert into SUBMITS (p_id, i_id)
values (498821372, 149);
insert into SUBMITS (p_id, i_id)
values (498821372, 490);
insert into SUBMITS (p_id, i_id)
values (502543479, 1);
insert into SUBMITS (p_id, i_id)
values (502543479, 256);
insert into SUBMITS (p_id, i_id)
values (502543479, 270);
insert into SUBMITS (p_id, i_id)
values (502543479, 313);
insert into SUBMITS (p_id, i_id)
values (502757972, 155);
insert into SUBMITS (p_id, i_id)
values (502757972, 309);
insert into SUBMITS (p_id, i_id)
values (502868084, 437);
insert into SUBMITS (p_id, i_id)
values (503108646, 19);
insert into SUBMITS (p_id, i_id)
values (504846663, 114);
insert into SUBMITS (p_id, i_id)
values (504846663, 377);
insert into SUBMITS (p_id, i_id)
values (504846663, 456);
insert into SUBMITS (p_id, i_id)
values (504995192, 111);
insert into SUBMITS (p_id, i_id)
values (507463392, 143);
insert into SUBMITS (p_id, i_id)
values (507463392, 184);
insert into SUBMITS (p_id, i_id)
values (514075773, 176);
insert into SUBMITS (p_id, i_id)
values (514468249, 421);
insert into SUBMITS (p_id, i_id)
values (519221254, 328);
insert into SUBMITS (p_id, i_id)
values (527017226, 438);
insert into SUBMITS (p_id, i_id)
values (532856593, 149);
insert into SUBMITS (p_id, i_id)
values (532856593, 180);
insert into SUBMITS (p_id, i_id)
values (533980019, 222);
insert into SUBMITS (p_id, i_id)
values (533980019, 231);
insert into SUBMITS (p_id, i_id)
values (534302030, 36);
insert into SUBMITS (p_id, i_id)
values (544627497, 5);
insert into SUBMITS (p_id, i_id)
values (544627497, 278);
insert into SUBMITS (p_id, i_id)
values (546297368, 154);
insert into SUBMITS (p_id, i_id)
values (546297368, 222);
insert into SUBMITS (p_id, i_id)
values (546997308, 378);
insert into SUBMITS (p_id, i_id)
values (546997308, 498);
insert into SUBMITS (p_id, i_id)
values (548052310, 194);
insert into SUBMITS (p_id, i_id)
values (549101937, 40);
insert into SUBMITS (p_id, i_id)
values (550188787, 140);
insert into SUBMITS (p_id, i_id)
values (557487056, 368);
insert into SUBMITS (p_id, i_id)
values (557487056, 495);
insert into SUBMITS (p_id, i_id)
values (559846702, 440);
insert into SUBMITS (p_id, i_id)
values (560813964, 222);
insert into SUBMITS (p_id, i_id)
values (570780324, 321);
insert into SUBMITS (p_id, i_id)
values (572376377, 440);
insert into SUBMITS (p_id, i_id)
values (579229923, 234);
insert into SUBMITS (p_id, i_id)
values (581530900, 194);
insert into SUBMITS (p_id, i_id)
values (584504921, 180);
insert into SUBMITS (p_id, i_id)
values (586635399, 406);
insert into SUBMITS (p_id, i_id)
values (587688134, 21);
insert into SUBMITS (p_id, i_id)
values (593697825, 74);
insert into SUBMITS (p_id, i_id)
values (593697825, 81);
insert into SUBMITS (p_id, i_id)
values (600203338, 63);
insert into SUBMITS (p_id, i_id)
values (600203338, 86);
insert into SUBMITS (p_id, i_id)
values (600203338, 333);
insert into SUBMITS (p_id, i_id)
values (605132460, 13);
insert into SUBMITS (p_id, i_id)
values (607016492, 261);
insert into SUBMITS (p_id, i_id)
values (611378835, 52);
insert into SUBMITS (p_id, i_id)
values (611378835, 185);
insert into SUBMITS (p_id, i_id)
values (614822926, 88);
insert into SUBMITS (p_id, i_id)
values (616535497, 391);
insert into SUBMITS (p_id, i_id)
values (620435401, 452);
insert into SUBMITS (p_id, i_id)
values (620435401, 498);
insert into SUBMITS (p_id, i_id)
values (621309899, 274);
insert into SUBMITS (p_id, i_id)
values (621309899, 492);
insert into SUBMITS (p_id, i_id)
values (625989285, 158);
insert into SUBMITS (p_id, i_id)
values (629218112, 36);
insert into SUBMITS (p_id, i_id)
values (629218112, 260);
insert into SUBMITS (p_id, i_id)
values (629218112, 379);
insert into SUBMITS (p_id, i_id)
values (629396385, 307);
insert into SUBMITS (p_id, i_id)
values (629396385, 319);
insert into SUBMITS (p_id, i_id)
values (632599982, 471);
insert into SUBMITS (p_id, i_id)
values (634442332, 121);
insert into SUBMITS (p_id, i_id)
values (634442332, 324);
insert into SUBMITS (p_id, i_id)
values (644337681, 109);
commit;
prompt 300 records committed...
insert into SUBMITS (p_id, i_id)
values (644874373, 400);
insert into SUBMITS (p_id, i_id)
values (645450076, 396);
insert into SUBMITS (p_id, i_id)
values (645637087, 82);
insert into SUBMITS (p_id, i_id)
values (657042865, 433);
insert into SUBMITS (p_id, i_id)
values (657661723, 84);
insert into SUBMITS (p_id, i_id)
values (660114886, 390);
insert into SUBMITS (p_id, i_id)
values (660114886, 408);
insert into SUBMITS (p_id, i_id)
values (663504103, 437);
insert into SUBMITS (p_id, i_id)
values (669635628, 475);
insert into SUBMITS (p_id, i_id)
values (669791831, 284);
insert into SUBMITS (p_id, i_id)
values (670173440, 438);
insert into SUBMITS (p_id, i_id)
values (673620982, 84);
insert into SUBMITS (p_id, i_id)
values (673883590, 272);
insert into SUBMITS (p_id, i_id)
values (676946164, 372);
insert into SUBMITS (p_id, i_id)
values (676946164, 389);
insert into SUBMITS (p_id, i_id)
values (677781908, 135);
insert into SUBMITS (p_id, i_id)
values (677781908, 448);
insert into SUBMITS (p_id, i_id)
values (677781908, 456);
insert into SUBMITS (p_id, i_id)
values (677918396, 165);
insert into SUBMITS (p_id, i_id)
values (683681759, 254);
insert into SUBMITS (p_id, i_id)
values (683681759, 346);
insert into SUBMITS (p_id, i_id)
values (684324787, 131);
insert into SUBMITS (p_id, i_id)
values (684324787, 276);
insert into SUBMITS (p_id, i_id)
values (686094438, 455);
insert into SUBMITS (p_id, i_id)
values (690541113, 32);
insert into SUBMITS (p_id, i_id)
values (699843817, 155);
insert into SUBMITS (p_id, i_id)
values (699843817, 233);
insert into SUBMITS (p_id, i_id)
values (700828647, 217);
insert into SUBMITS (p_id, i_id)
values (700828647, 399);
insert into SUBMITS (p_id, i_id)
values (700828647, 407);
insert into SUBMITS (p_id, i_id)
values (701636612, 196);
insert into SUBMITS (p_id, i_id)
values (701636612, 321);
insert into SUBMITS (p_id, i_id)
values (701885400, 238);
insert into SUBMITS (p_id, i_id)
values (702388971, 264);
insert into SUBMITS (p_id, i_id)
values (703000172, 225);
insert into SUBMITS (p_id, i_id)
values (703731742, 61);
insert into SUBMITS (p_id, i_id)
values (703731742, 331);
insert into SUBMITS (p_id, i_id)
values (710662044, 346);
insert into SUBMITS (p_id, i_id)
values (711480574, 277);
insert into SUBMITS (p_id, i_id)
values (712022376, 120);
insert into SUBMITS (p_id, i_id)
values (714064937, 78);
insert into SUBMITS (p_id, i_id)
values (714064937, 383);
insert into SUBMITS (p_id, i_id)
values (715219917, 111);
insert into SUBMITS (p_id, i_id)
values (715219917, 444);
insert into SUBMITS (p_id, i_id)
values (715275975, 123);
insert into SUBMITS (p_id, i_id)
values (715275975, 233);
insert into SUBMITS (p_id, i_id)
values (725969019, 281);
insert into SUBMITS (p_id, i_id)
values (725969019, 304);
insert into SUBMITS (p_id, i_id)
values (726746451, 290);
insert into SUBMITS (p_id, i_id)
values (726746451, 305);
insert into SUBMITS (p_id, i_id)
values (733030473, 77);
insert into SUBMITS (p_id, i_id)
values (733030473, 183);
insert into SUBMITS (p_id, i_id)
values (733030473, 294);
insert into SUBMITS (p_id, i_id)
values (741982936, 171);
insert into SUBMITS (p_id, i_id)
values (745266349, 65);
insert into SUBMITS (p_id, i_id)
values (745335405, 396);
insert into SUBMITS (p_id, i_id)
values (745608870, 402);
insert into SUBMITS (p_id, i_id)
values (747633742, 5);
insert into SUBMITS (p_id, i_id)
values (748710686, 453);
insert into SUBMITS (p_id, i_id)
values (748786656, 201);
insert into SUBMITS (p_id, i_id)
values (748786656, 465);
insert into SUBMITS (p_id, i_id)
values (752323983, 201);
insert into SUBMITS (p_id, i_id)
values (752323983, 252);
insert into SUBMITS (p_id, i_id)
values (756902400, 5);
insert into SUBMITS (p_id, i_id)
values (756902400, 50);
insert into SUBMITS (p_id, i_id)
values (757470967, 63);
insert into SUBMITS (p_id, i_id)
values (761147541, 4);
insert into SUBMITS (p_id, i_id)
values (761147541, 144);
insert into SUBMITS (p_id, i_id)
values (761147541, 471);
insert into SUBMITS (p_id, i_id)
values (765654892, 128);
insert into SUBMITS (p_id, i_id)
values (765654892, 188);
insert into SUBMITS (p_id, i_id)
values (765733235, 176);
insert into SUBMITS (p_id, i_id)
values (771620537, 119);
insert into SUBMITS (p_id, i_id)
values (776602532, 425);
insert into SUBMITS (p_id, i_id)
values (781627890, 423);
insert into SUBMITS (p_id, i_id)
values (782344124, 114);
insert into SUBMITS (p_id, i_id)
values (782344124, 195);
insert into SUBMITS (p_id, i_id)
values (782344124, 257);
insert into SUBMITS (p_id, i_id)
values (785331121, 305);
insert into SUBMITS (p_id, i_id)
values (785331121, 317);
insert into SUBMITS (p_id, i_id)
values (788417108, 206);
insert into SUBMITS (p_id, i_id)
values (788417108, 277);
insert into SUBMITS (p_id, i_id)
values (788417108, 436);
insert into SUBMITS (p_id, i_id)
values (789046930, 36);
insert into SUBMITS (p_id, i_id)
values (789046930, 49);
insert into SUBMITS (p_id, i_id)
values (789046930, 243);
insert into SUBMITS (p_id, i_id)
values (798152312, 349);
insert into SUBMITS (p_id, i_id)
values (798152312, 415);
insert into SUBMITS (p_id, i_id)
values (798178672, 199);
insert into SUBMITS (p_id, i_id)
values (801928146, 192);
insert into SUBMITS (p_id, i_id)
values (805352647, 4);
insert into SUBMITS (p_id, i_id)
values (805352647, 247);
insert into SUBMITS (p_id, i_id)
values (805352647, 268);
insert into SUBMITS (p_id, i_id)
values (808139517, 94);
insert into SUBMITS (p_id, i_id)
values (811000409, 38);
insert into SUBMITS (p_id, i_id)
values (811000409, 123);
insert into SUBMITS (p_id, i_id)
values (811428905, 5);
insert into SUBMITS (p_id, i_id)
values (811428905, 197);
insert into SUBMITS (p_id, i_id)
values (812563056, 250);
insert into SUBMITS (p_id, i_id)
values (812563056, 425);
commit;
prompt 400 records committed...
insert into SUBMITS (p_id, i_id)
values (817513503, 112);
insert into SUBMITS (p_id, i_id)
values (817513503, 171);
insert into SUBMITS (p_id, i_id)
values (819760293, 38);
insert into SUBMITS (p_id, i_id)
values (819760293, 139);
insert into SUBMITS (p_id, i_id)
values (820250587, 46);
insert into SUBMITS (p_id, i_id)
values (820250587, 304);
insert into SUBMITS (p_id, i_id)
values (821235968, 54);
insert into SUBMITS (p_id, i_id)
values (821235968, 144);
insert into SUBMITS (p_id, i_id)
values (821235968, 225);
insert into SUBMITS (p_id, i_id)
values (821302501, 19);
insert into SUBMITS (p_id, i_id)
values (825442767, 2);
insert into SUBMITS (p_id, i_id)
values (825442767, 296);
insert into SUBMITS (p_id, i_id)
values (826358117, 331);
insert into SUBMITS (p_id, i_id)
values (829982840, 266);
insert into SUBMITS (p_id, i_id)
values (829982840, 304);
insert into SUBMITS (p_id, i_id)
values (829982840, 314);
insert into SUBMITS (p_id, i_id)
values (844992058, 22);
insert into SUBMITS (p_id, i_id)
values (850403488, 218);
insert into SUBMITS (p_id, i_id)
values (850403488, 478);
insert into SUBMITS (p_id, i_id)
values (851711689, 181);
insert into SUBMITS (p_id, i_id)
values (852329914, 53);
insert into SUBMITS (p_id, i_id)
values (852329914, 444);
insert into SUBMITS (p_id, i_id)
values (855164682, 193);
insert into SUBMITS (p_id, i_id)
values (855164682, 202);
insert into SUBMITS (p_id, i_id)
values (861590341, 88);
insert into SUBMITS (p_id, i_id)
values (861923203, 466);
insert into SUBMITS (p_id, i_id)
values (864009777, 100);
insert into SUBMITS (p_id, i_id)
values (869809993, 1);
insert into SUBMITS (p_id, i_id)
values (872269671, 39);
insert into SUBMITS (p_id, i_id)
values (875625449, 111);
insert into SUBMITS (p_id, i_id)
values (875625449, 265);
insert into SUBMITS (p_id, i_id)
values (878802244, 437);
insert into SUBMITS (p_id, i_id)
values (883614739, 225);
insert into SUBMITS (p_id, i_id)
values (883614739, 240);
insert into SUBMITS (p_id, i_id)
values (885037369, 411);
insert into SUBMITS (p_id, i_id)
values (886687562, 313);
insert into SUBMITS (p_id, i_id)
values (886687562, 406);
insert into SUBMITS (p_id, i_id)
values (887832684, 247);
insert into SUBMITS (p_id, i_id)
values (892930846, 284);
insert into SUBMITS (p_id, i_id)
values (892930846, 480);
insert into SUBMITS (p_id, i_id)
values (893612092, 163);
insert into SUBMITS (p_id, i_id)
values (893612092, 494);
insert into SUBMITS (p_id, i_id)
values (896484683, 189);
insert into SUBMITS (p_id, i_id)
values (899720591, 381);
insert into SUBMITS (p_id, i_id)
values (907972593, 355);
insert into SUBMITS (p_id, i_id)
values (915073478, 462);
insert into SUBMITS (p_id, i_id)
values (920282935, 163);
insert into SUBMITS (p_id, i_id)
values (921139062, 208);
insert into SUBMITS (p_id, i_id)
values (922153228, 216);
insert into SUBMITS (p_id, i_id)
values (922153228, 391);
insert into SUBMITS (p_id, i_id)
values (925137151, 58);
insert into SUBMITS (p_id, i_id)
values (925653295, 364);
insert into SUBMITS (p_id, i_id)
values (926733487, 463);
insert into SUBMITS (p_id, i_id)
values (927136387, 222);
insert into SUBMITS (p_id, i_id)
values (927136387, 434);
insert into SUBMITS (p_id, i_id)
values (932038464, 137);
insert into SUBMITS (p_id, i_id)
values (932038464, 196);
insert into SUBMITS (p_id, i_id)
values (933173824, 184);
insert into SUBMITS (p_id, i_id)
values (933173824, 273);
insert into SUBMITS (p_id, i_id)
values (933173824, 452);
insert into SUBMITS (p_id, i_id)
values (933315753, 28);
insert into SUBMITS (p_id, i_id)
values (938141321, 473);
insert into SUBMITS (p_id, i_id)
values (939632457, 127);
insert into SUBMITS (p_id, i_id)
values (939632457, 319);
insert into SUBMITS (p_id, i_id)
values (939632457, 445);
insert into SUBMITS (p_id, i_id)
values (943370219, 10);
insert into SUBMITS (p_id, i_id)
values (943370219, 130);
insert into SUBMITS (p_id, i_id)
values (943370219, 385);
insert into SUBMITS (p_id, i_id)
values (945584548, 348);
insert into SUBMITS (p_id, i_id)
values (945584548, 380);
insert into SUBMITS (p_id, i_id)
values (947791827, 208);
insert into SUBMITS (p_id, i_id)
values (947791827, 276);
insert into SUBMITS (p_id, i_id)
values (947791827, 419);
insert into SUBMITS (p_id, i_id)
values (947791827, 445);
insert into SUBMITS (p_id, i_id)
values (954326355, 372);
insert into SUBMITS (p_id, i_id)
values (954326355, 443);
insert into SUBMITS (p_id, i_id)
values (958699305, 36);
insert into SUBMITS (p_id, i_id)
values (958876666, 354);
insert into SUBMITS (p_id, i_id)
values (961717453, 115);
insert into SUBMITS (p_id, i_id)
values (961717453, 149);
insert into SUBMITS (p_id, i_id)
values (965826967, 439);
insert into SUBMITS (p_id, i_id)
values (973291381, 147);
insert into SUBMITS (p_id, i_id)
values (981292260, 180);
insert into SUBMITS (p_id, i_id)
values (981292260, 342);
insert into SUBMITS (p_id, i_id)
values (984507807, 113);
insert into SUBMITS (p_id, i_id)
values (984507807, 298);
insert into SUBMITS (p_id, i_id)
values (985239665, 101);
insert into SUBMITS (p_id, i_id)
values (985239665, 343);
insert into SUBMITS (p_id, i_id)
values (985981629, 111);
insert into SUBMITS (p_id, i_id)
values (985981629, 454);
insert into SUBMITS (p_id, i_id)
values (987763333, 475);
insert into SUBMITS (p_id, i_id)
values (990702687, 19);
insert into SUBMITS (p_id, i_id)
values (990702687, 33);
insert into SUBMITS (p_id, i_id)
values (990702687, 319);
insert into SUBMITS (p_id, i_id)
values (990702687, 329);
insert into SUBMITS (p_id, i_id)
values (994731787, 101);
insert into SUBMITS (p_id, i_id)
values (994731787, 376);
insert into SUBMITS (p_id, i_id)
values (995518978, 457);
insert into SUBMITS (p_id, i_id)
values (997912492, 306);
insert into SUBMITS (p_id, i_id)
values (999139334, 35);
commit;
prompt 500 records loaded
prompt Enabling foreign key constraints for ASSIGNED_OPERATION...
alter table ASSIGNED_OPERATION enable constraint SYS_C008540;
alter table ASSIGNED_OPERATION enable constraint SYS_C008541;
prompt Enabling foreign key constraints for PERSONNEL...
alter table PERSONNEL enable constraint SYS_C008551;
prompt Enabling foreign key constraints for ASSIGNED_PERSONNEL...
alter table ASSIGNED_PERSONNEL enable constraint SYS_C008555;
alter table ASSIGNED_PERSONNEL enable constraint SYS_C008556;
prompt Enabling foreign key constraints for INTELLIGENCE_REPORTS...
alter table INTELLIGENCE_REPORTS enable constraint SYS_C008567;
prompt Enabling foreign key constraints for SUBMITS...
alter table SUBMITS enable constraint SYS_C008571;
alter table SUBMITS enable constraint SYS_C008572;
prompt Enabling triggers for ASSIGNMENTS...
alter table ASSIGNMENTS enable all triggers;
prompt Enabling triggers for OPERATIONS_...
alter table OPERATIONS_ enable all triggers;
prompt Enabling triggers for ASSIGNED_OPERATION...
alter table ASSIGNED_OPERATION enable all triggers;
prompt Enabling triggers for ROLE_...
alter table ROLE_ enable all triggers;
prompt Enabling triggers for PERSONNEL...
alter table PERSONNEL enable all triggers;
prompt Enabling triggers for ASSIGNED_PERSONNEL...
alter table ASSIGNED_PERSONNEL enable all triggers;
prompt Enabling triggers for EQUIPMENT...
alter table EQUIPMENT enable all triggers;
prompt Enabling triggers for INTELLIGENCE_REPORTS...
alter table INTELLIGENCE_REPORTS enable all triggers;
prompt Enabling triggers for SUBMITS...
alter table SUBMITS enable all triggers;

set feedback on
set define on
prompt Done
