drop table user_info cascade constraints;
create table user_info
(
    info_id       number(6) primary key,
    user_name     varchar2(20) not null,
    user_tel      varchar2(20) not null,
    user_address  varchar2(90) not null,
    user_profile  varchar2(200),
    original_file varchar2(200) default '/profile.png',
    point         number(6)     default 0,
    user_id       number(6)    not null,
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
values (8, 'dummy_user1', '111-222-3333', 'korea', 8);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (9, 'dummy_user2', '111-222-3333', 'korea', 9);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (10, 'dummy_user3', '111-222-3333', 'korea', 10);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (11, 'dummy_user4', '111-222-3333', 'korea', 11);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (12, 'dummy_user5', '111-222-3333', 'korea', 12);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (13, 'dummy_user6', '111-222-3333', 'korea', 13);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (14, 'dummy_user7', '111-222-3333', 'korea', 14);

insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (15, 'dummy_store_owner8', '111-222-3333', 'korea', 15);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (16, 'dummy_staff1', '111-222-3333', 'korea', 16);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (17, 'dummy_staff2', '111-222-3333', 'korea', 17);

select *
from user_info;

commit;