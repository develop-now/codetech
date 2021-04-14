drop table staffs cascade constraints;
create table staffs
(
    staff_id   number(6) primary key,
    user_id    number(6) not null,
    store_id   number(6) not null,
    created_at date default sysdate,
    constraint fk_staff_user foreign key (user_id) references users (user_id),
    constraint fk_staff_store foreign key (store_id) references stores (store_id)
);

insert into staffs (staff_id, user_id, store_id)
values (1, 4, 1);
insert into staffs (staff_id, user_id, store_id)
values (2, 4, 3);
insert into staffs (staff_id, user_id, store_id)
values (3, 4, 4);
insert into staffs (staff_id, user_id, store_id)
values (4, 12, 1);
insert into staffs (staff_id, user_id, store_id)
values (5, 12, 3);
insert into staffs (staff_id, user_id, store_id)
values (6, 13, 4);
insert into staffs (staff_id, user_id, store_id)
values (7, 12, 2);

commit;