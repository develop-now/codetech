drop table users cascade constraints;
create table users
(
    user_id       number(6) primary key,
    user_email    varchar2(50) unique not null,
    user_password varchar2(70)        not null,
    report_count  number(5) default 0,
    created_at    date      default sysdate,
    updated_at    date      default sysdate,
    user_auth     number(1) default 0 not null,
    role_id       number(1) default 5 not null,
    user_status   number(1) default 1 not null,
    constraint fk_users_role foreign key (role_id) references role (role_id),
    constraint fk_users_status foreign key (user_status) references user_status (user_status_id)
);

insert into users (user_id, user_email, user_password, role_id)
values (1, 'site_owner@test.com', '1234', 1);
insert into users (user_id, user_email, user_password, role_id)
values (2, 'admin@test.com', '1234', 2);
insert into users (user_id, user_email, user_password, role_id)
values (3, 'sotre_owner@test.com', '1234', 3);
insert into users (user_id, user_email, user_password, role_id)
values (4, 'staff@test.com', '1234', 4);
insert into users (user_id, user_email, user_password, role_id)
values (5, 'user5@test.com', '1111', 5);
insert into users (user_id, user_email, user_password, role_id)
values (6, 'user6@test.com', '1111', 5);
insert into users (user_id, user_email, user_password, role_id)
values (7, 'user7@test.com', '1111', 5);
insert into users (user_id, user_email, user_password, role_id)
values (8, 'user8@test.com', '1111', 5);
INSERT INTO users (user_id, user_email, user_password, role_id)
VALUES (9, 'user9@test.com', '1111', 5);
insert into users (user_id, user_email, user_password, role_id)
values (10, 'user10@test.com', '1111', 5);
insert into users (user_id, user_email, user_password, role_id)
values (11, 'user11@test.com', '1111', 5);
insert into users (user_id, user_email, user_password, role_id)
values (12, 'user12@test.com', '1111', 5);
insert into users (user_id, user_email, user_password, role_id)
values (13, 'user13@test.com', '1111', 5);
INSERT INTO users (user_id, user_email, user_password, role_id)
VALUES (14, 'user14@test.com', '1111', 5);
INSERT INTO users (user_id, user_email, user_password, role_id)
VALUES (15, 'user15@test.com', '1111', 5);

select * from users;
commit;