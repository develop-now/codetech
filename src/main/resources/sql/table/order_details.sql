drop table order_details cascade constraints;
create table order_details
(
    detail_id          number(5) primary key,
    menu_quantity      number(3) default 1,
    detail_total_price varchar2(10),
    created_at         date      default sysdate,
    updated_at         date      default sysdate,
    order_id           number(5) not null,
    menu_id            number(5) not null,
    constraint fk_detail_order foreign key (order_id) references orders (order_id),
    constraint fk_detail_menu foreign key (menu_id) references menus (menu_id)
);


insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (1, 1, 2, 1, '12000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (2, 1, 3, 4, '28000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (3, 2, 4, 1, '13000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (4, 2, 5, 1, '29000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (5, 2, 3, 4, '28000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (6, 3, 1, 1, '12000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (7, 3, 2, 1, '32000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (8, 3, 4, 1, '13000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (9, 4, 2, 1, '32000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (10, 4, 4, 2, '26000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (11, 4, 5, 1, '29000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (12, 4, 3, 6, '42000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (13, 5, 4, 1, '13000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (14, 5, 2, 1, '32000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (15, 6, 5, 1, '29000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (16, 6, 3, 7, '49000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (17, 7, 4, 2, '26000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (18, 7, 2, 3, '96000', to_date('20210423', 'YYYYMMDD'));

insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (19, 8, 7, 2, '34000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (20, 8, 8, 1, '11000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (21, 8, 9, 5, '40000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (22, 9, 8, 2, '22000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (23, 9, 9, 3, '24000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (24, 10, 7, 1, '17000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (25, 10, 9, 2, '16000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (26, 11, 7, 1, '17000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (27, 11, 8, 3, '33000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (28, 12, 9, 4, '32000', to_date('20210423', 'YYYYMMDD'));

insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (29, 13, 10, 1, '16000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (30, 13, 11, 2, '36000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (31, 14, 10, 2, '32000', to_date('20210423', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (32, 15, 11, 1, '18000', to_date('20210423', 'YYYYMMDD'));

insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (33, 16, 2, 1, '12000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (34, 16, 3, 4, '28000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (35, 17, 4, 1, '13000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (36, 17, 5, 1, '29000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (37, 17, 3, 4, '28000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (38, 18, 1, 1, '12000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (39, 18, 2, 1, '32000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (40, 18, 4, 1, '13000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (41, 19, 2, 1, '32000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (42, 19, 4, 2, '26000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (43, 19, 5, 1, '29000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (44, 19, 3, 6, '42000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (45, 20, 4, 1, '13000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (46, 20, 2, 1, '32000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (47, 21, 5, 1, '29000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (48, 21, 3, 7, '49000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (49, 22, 4, 2, '26000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (50, 22, 2, 3, '96000', to_date('20210424', 'YYYYMMDD'));

insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (51, 23, 7, 2, '34000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (52, 23, 8, 1, '11000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (53, 23, 9, 5, '40000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (54, 24, 8, 2, '22000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (55, 24, 9, 3, '24000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (56, 25, 7, 1, '17000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (57, 25, 9, 2, '16000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (58, 26, 7, 1, '17000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (59, 26, 8, 3, '33000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (60, 27, 9, 4, '32000', to_date('20210424', 'YYYYMMDD'));

insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (61, 28, 10, 1, '16000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (62, 28, 11, 2, '36000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (63, 29, 10, 2, '32000', to_date('20210424', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (64, 30, 11, 1, '18000', to_date('20210424', 'YYYYMMDD'));

insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (65, 31, 2, 1, '12000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (66, 31, 3, 4, '28000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (67, 32, 4, 1, '13000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (68, 32, 5, 1, '29000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (69, 32, 3, 4, '28000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (70, 33, 1, 1, '12000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (71, 33, 2, 1, '32000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (72, 33, 4, 1, '13000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (73, 34, 2, 1, '32000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (74, 34, 4, 2, '26000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (75, 34, 5, 1, '29000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (76, 34, 3, 6, '42000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (77, 35, 4, 1, '13000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (78, 35, 2, 1, '32000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (79, 36, 5, 1, '29000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (80, 36, 3, 7, '49000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (81, 37, 4, 2, '26000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (82, 37, 2, 3, '96000', to_date('20210425', 'YYYYMMDD'));

insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (83, 38, 7, 2, '34000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (84, 38, 8, 1, '11000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (85, 38, 9, 5, '40000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (86, 39, 8, 2, '22000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (87, 39, 9, 3, '24000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (88, 40, 7, 1, '17000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (89, 40, 9, 2, '16000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (90, 41, 7, 1, '17000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (91, 41, 8, 3, '33000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (92, 42, 9, 4, '32000', to_date('20210425', 'YYYYMMDD'));

insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (93, 43, 10, 1, '16000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (94, 43, 11, 2, '36000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (95, 44, 10, 2, '32000', to_date('20210425', 'YYYYMMDD'));
insert into order_details (detail_id, order_id, menu_id, menu_quantity, detail_total_price, created_at)
values (96, 45, 11, 1, '18000', to_date('20210425', 'YYYYMMDD'));

select *
from order_details;

commit;
