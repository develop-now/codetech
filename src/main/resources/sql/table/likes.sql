drop table likes cascade constraints;
create table likes
(
    like_id    number(5) primary key,
    created_at date default sysdate,
    store_id   number(5) not null,
    user_id    number(5) not null,
    constraint fk_like_store foreign key (store_id) references stores (store_id),
    constraint fk_like_user foreign key (user_id) references users (user_id)
);

select * from likes;


commit;