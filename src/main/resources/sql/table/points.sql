drop table points cascade constraints;
create table points
(
    point_id    number(5) primary key,
    point_value number(3) default 0,
    created_at  date      default sysdate,
    order_id    number(5)   not null,
    store_id    number(5)   not null,
    user_id     number(5)   not null,
    point_type  varchar2(3) not null,
    constraint fk_point_order foreign key (order_id) references orders (order_id),
    constraint fk_point_store foreign key (store_id) references stores (store_id),
    constraint fk_point_user foreign key (user_id) references users (user_id),
    constraint point_type_ck check (point_type in ('get', 'use'))
);

select * from points

commit;