drop table orders cascade constraints;
create table orders
(
    order_id          number(6) primary key,
    created_at        date      default sysdate,
    updated_at        date      default sysdate,
    order_total_price varchar2(10),
    comment_writable  char(5)   default 'false' check (comment_writable in ('true', 'false')),
    comment_wrote     char(5)   default 'false' check (comment_wrote in ('true', 'false')),
    order_user        number(6)           not null,
    order_status      number(6) default 1 not null,
    store_id          number(6)           not null,
    constraint fk_order_user foreign key (order_user) references users (user_id),
    constraint fk_order_status foreign key (order_status) references order_status (order_status_id),
    constraint fk_order_store foreign key (store_id) references stores (store_id)
);

insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (1, '40000', 5, 1, 1, to_date('20210423', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (2, '70000', 6, 2, 1, to_date('20210423', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (3, '57000', 7, 3, 1, to_date('20210423', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (4, '129000', 8, 4, 1, to_date('20210423', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (5, '45000', 9, 5, 1, to_date('20210423', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (6, '78000', 10, 1, 1, to_date('20210423', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (7, '122000', 11, 2, 1, to_date('20210423', 'YYYYMMDD'));

insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (8, '85000', 12, 3, 3, to_date('20210423', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (9, '46000', 13, 4, 3, to_date('20210423', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (10, '33000', 14, 5, 3, to_date('20210423', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (11, '50000', 5, 1, 3, to_date('20210423', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (12, '32000', 6, 2, 3, to_date('20210423', 'YYYYMMDD'));

insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (13, '52000', 7, 3, 4, to_date('20210423', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (14, '32000', 8, 4, 4, to_date('20210423', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (15, '18000', 9, 5, 4, to_date('20210423', 'YYYYMMDD'));

insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (16, '40000', 10, 1, 1, to_date('20210424', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (17, '70000', 11, 2, 1, to_date('20210424', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (18, '57000', 12, 3, 1, to_date('20210424', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (19, '129000', 13, 4, 1, to_date('20210424', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (20, '45000', 14, 5, 1, to_date('20210424', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (21, '78000', 5, 1, 1, to_date('20210424', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (22, '122000', 6, 2, 1, to_date('20210424', 'YYYYMMDD'));

insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (23, '85000', 7, 3, 3, to_date('20210424', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (24, '46000', 8, 4, 3, to_date('20210424', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (25, '33000', 9, 5, 3, to_date('20210424', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (26, '50000', 10, 1, 3, to_date('20210424', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (27, '32000', 11, 2, 3, to_date('20210424', 'YYYYMMDD'));

insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (28, '52000', 12, 3, 4, to_date('20210424', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (29, '32000', 13, 4, 4, to_date('20210424', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (30, '18000', 14, 5, 4, to_date('20210424', 'YYYYMMDD'));

insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (31, '40000', 13, 1, 1, to_date('20210425', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (32, '70000', 12, 2, 1, to_date('20210425', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (33, '57000', 11, 3, 1, to_date('20210425', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (34, '129000', 10, 4, 1, to_date('20210425', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (35, '45000', 9, 5, 1, to_date('20210425', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (36, '78000', 8, 1, 1, to_date('20210425', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (37, '122000', 7, 2, 1, to_date('20210425', 'YYYYMMDD'));

insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (38, '85000', 6, 3, 3, to_date('20210425', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (39, '46000', 5, 4, 3, to_date('20210425', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (40, '33000', 14, 5, 3, to_date('20210425', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (41, '50000', 13, 1, 3, to_date('20210425', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (42, '32000', 12, 2, 3, to_date('20210425', 'YYYYMMDD'));

insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (43, '52000', 11, 3, 4, to_date('20210425', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (44, '32000', 10, 4, 4, to_date('20210425', 'YYYYMMDD'));
insert into orders (order_id, order_total_price, order_user, order_status, store_id, created_at)
values (45, '18000', 9, 5, 4, to_date('20210425', 'YYYYMMDD'));

select *
from orders;

commit;