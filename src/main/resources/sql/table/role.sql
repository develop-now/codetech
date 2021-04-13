drop table role cascade constraints ;
create table role
(
    role_id    number(1) primary key,
    role_value varchar2(20) not null
);

insert into role
values (1, 'ROLE_SITE_OWNER');
insert into role
values (2, 'ROLE_ADMIN');
insert into role
values (3, 'ROLE_STORE_OWNER');
insert into role
values (4, 'ROLE_STORE_STAFF');
insert into role
values (5, 'ROLE_MEMBER');

commit;