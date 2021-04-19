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


insert into order_details (detail_id, detail_total_price, order_id, menu_id)
values (1, '33000', 1, 1);

insert into order_details (detail_id, detail_total_price, order_id, menu_id)
values (2, '33000', 2, 2);

insert into order_details (detail_id, detail_total_price, order_id, menu_id)
values (3, '47000', 2, 3);

insert into order_details (detail_id, detail_total_price, order_id, menu_id)
values (4, '99000', 3, 8);

insert into order_details (detail_id, detail_total_price, order_id, menu_id)
values (5, '132000', 4, 6);

insert into order_details (detail_id, detail_total_price, order_id, menu_id)
values (6, '96000', 5, 10);

insert into order_details (detail_id, detail_total_price, order_id, menu_id)
values (7, '33000', 6, 4);

insert into order_details (detail_id, detail_total_price, order_id, menu_id)
values (8, '38000', 6, 5);

insert into order_details (detail_id, detail_total_price, order_id, menu_id)
values (9, '165000', 7, 6);

insert into order_details (detail_id, detail_total_price, order_id, menu_id)
values (10, '76000', 8, 5);

insert into order_details (detail_id, detail_total_price, order_id, menu_id)
values (11, '123000', 9, 8);

insert into order_details (detail_id, detail_total_price, order_id, menu_id)
values (12, '39000', 9, 9);

insert into order_details (detail_id, detail_total_price, order_id, menu_id)
values (13, '96000', 10, 7);

select * from order_details;


commit;
