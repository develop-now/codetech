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
select * from orders;


		
		
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (1, '30000', 10, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (2, '80000', 10, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (3, '110000', 10, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (4, '430000', 10, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (5, '320000', 10, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (6, '830000', 10, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (7, '930000', 10, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (8, '1530000', 10, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (9, '830000', 10, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (10, '530000', 10, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (11, '30000', 11, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (12, '80000', 11, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (13, '110000', 11, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (14, '430000', 11, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (15, '320000', 11, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (16, '830000', 11, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (17, '930000', 11, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (18, '1530000', 11, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (19, '830000', 11, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (20, '530000', 11, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (21, '30000', 12, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (22, '80000', 12, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (23, '110000', 12, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (24, '430000', 12, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (25, '320000', 12, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (26, '830000', 12, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (27, '930000', 12, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (28, '1530000', 12, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (29, '830000', 12, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (30, '530000', 12, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (31, '30000', 13, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (32, '80000', 13, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (33, '110000', 13, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (34, '430000', 13, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (35, '320000', 13, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (36, '830000', 13, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (37, '930000', 13, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (38, '1530000', 13, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (39, '830000', 13, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (40, '530000', 13, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (41, '30000', 14, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (42, '80000', 15, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (43, '110000', 16, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (44, '430000', 17, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (45, '320000', 1, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (46, '830000', 2, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (47, '930000', 3, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (48, '1530000', 4, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (49, '830000', 5, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (50, '530000', 6, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (51, '30000', 7, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (52, '80000', 8, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (53, '110000', 9, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (54, '430000', 10, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (55, '320000', 11, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (56, '830000', 12, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (57, '930000', 13, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (58, '1530000', 14, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (59, '830000', 15, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (60, '530000', 16, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (61, '30000', 17, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (62, '80000', 1, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (63, '110000', 2, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (64, '430000', 3, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (65, '320000', 4, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (66, '830000', 5, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (67, '930000', 6, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (68, '1530000', 7, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (69, '830000', 8, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (70, '530000', 9, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (71, '30000', 10, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (72, '80000', 11, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (73, '110000', 12, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (74, '430000', 13, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (75, '320000', 14, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (76, '830000', 15, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (77, '930000', 16, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (78, '1530000', 7, 5, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (79, '830000', 7, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (80, '530000', 7, 5, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (81, '530000', 17, 1, 1);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (82, '530000', 17, 2, 2);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (83, '530000', 17, 3, 3);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (84, '530000', 17, 4, 4);
insert into orders (order_id, order_total_price, order_user, order_status, store_id)
values (85, '530000', 17, 5, 5);


commit;