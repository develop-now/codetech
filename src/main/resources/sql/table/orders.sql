drop table orders cascade constraints;
create table orders
(
    order_id          number(6) primary key,
    created_at        date default sysdate,
    updated_at        date default sysdate,
    order_total_price varchar2(10),
    order_user        number(6) not null,
    order_status      number(6) not null,
    constraint fk_order_user foreign key (order_user) references users (user_id),
    constraint fk_order_status foreign key (order_status) references order_status (order_status_id)
);

commit;