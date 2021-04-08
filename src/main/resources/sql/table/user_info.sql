drop table user_info cascade constraints;
create table user_info
(
    info_id      number(6) primary key,
    user_name    varchar2(20) not null,
    user_tel     varchar2(20) not null,
    user_address varchar2(20) not null,
    user_profile varchar2(20),
    point        number(6) default 0,
    user_id      number(6)    not null,
    constraint fk_userInfo_user foreign key (user_id) references users (user_id)
);

insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (1, 'site_owner', '111-222-3333', 'korea', 1);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (2, 'site_admin', '111-222-3333', 'korea', 2);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (3, 'store_owner', '111-222-3333', 'korea', 3);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (4, 'staff', '111-222-3333', 'korea', 4);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (5, 'user1', '111-222-3333', 'korea', 5);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (6, 'user2', '111-222-3333', 'korea', 6);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (7, 'user3', '111-222-3333', 'korea', 7);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (8, '유저', '111-222-3333', 'korea', 8);
commit;