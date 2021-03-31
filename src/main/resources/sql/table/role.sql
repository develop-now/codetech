drop table role;
create table role
(
    role_id    number(1) primary key,
    role_value varchar2(20) not null
);

insert into role
values (1, 'site_owner');
insert into role
values (2, 'site_admin');
insert into role
values (3, 'store_owner');
insert into role
values (4, 'store_staff');
insert into role
values (5, 'user');

commit;