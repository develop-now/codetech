drop table staffs cascade constraints;
create table staffs
(
    staff_id number(6) primary key,
    user_id  number(6) not null,
    store_id number(6) not null,
    constraint fk_staff_user foreign key (user_id) references users (user_id),
    constraint fk_staff_store foreign key (store_id) references stores (store_id)
);

commit;