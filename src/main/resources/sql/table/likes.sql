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

select *
from likes;


insert into likes(like_id, store_id, user_id)
values (1, 1, 5);
insert into likes(like_id, store_id, user_id)
values (2, 3, 5);
insert into likes(like_id, store_id, user_id)
values (3, 4, 7);
insert into likes(like_id, store_id, user_id)
values (4, 1, 6);
insert into likes(like_id, store_id, user_id)
values (5, 3, 10);

commit;