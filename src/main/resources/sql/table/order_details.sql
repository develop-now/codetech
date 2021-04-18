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

select * from order_details;

commit;
