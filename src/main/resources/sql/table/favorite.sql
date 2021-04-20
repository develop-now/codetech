drop table favorite cascade constraints;
create table favorite
(
    favorite_id number(6) primary key,
    user_id     number(6) not null,
    store_id    number(6) not null,
    created_at  date default sysdate,
    constraint fk_user_id foreign key (user_id) references users (user_id),
    constraint fk_store_id foreign key (store_id) references stores (store_id)
);

insert into favorite (favorite_id, user_id, store_id)
values (1, 1, 1);


commit;