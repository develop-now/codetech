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
values (1, 'site_owner@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 1);
insert into users (user_id, user_email, user_password, role_id)
values (2, 'admin@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 2);
insert into users (user_id, user_email, user_password, role_id)
values (3, 'store_owner@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 3);
insert into users (user_id, user_email, user_password, role_id)
values (4, 'staff@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 4);
insert into users (user_id, user_email, user_password, role_id)
values (5, 'user1@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 5);
insert into users (user_id, user_email, user_password, role_id)
values (6, 'user2@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 5);
insert into users (user_id, user_email, user_password, role_id)
values (7, 'user_3@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 5);

insert into users (user_id, user_email, user_password, role_id)
values (8, 'dummy_user1@test.com', '1234', 5);
INSERT INTO users (user_id, user_email, user_password, role_id)
VALUES (9, 'dummy_user2@test.com', '1234', 5);
insert into users (user_id, user_email, user_password, role_id)
values (10, 'dummy_user3@test.com', '1234', 5);
insert into users (user_id, user_email, user_password, role_id)
values (11, 'dummy_user4@test.com', '1234', 5);
insert into users (user_id, user_email, user_password, role_id)
values (12, 'dummy_user5@test.com', '1234', 5);
insert into users (user_id, user_email, user_password, role_id)
values (13, 'dummy_user6@test.com', '1234', 5);
INSERT INTO users (user_id, user_email, user_password, role_id)
VALUES (14, 'dummy_user7@test.com', '1234', 5);

INSERT INTO users (user_id, user_email, user_password, role_id)
VALUES (15, 'dummy_store_owner8@test.com', '1234', 5);
INSERT INTO users (user_id, user_email, user_password, role_id)
VALUES (16, 'dummy_staff1@test.com', '1234', 4);
INSERT INTO users (user_id, user_email, user_password, role_id)
VALUES (17, 'dummy_staff2@test.com', '1234', 4);

select *
from users;


select user_name, user_email, created_at from (
select * from users a join user_info b on a.user_id = b.user_id and role_id != 2
) where user_email like '%필%' or user_name like '%필%'


commit;