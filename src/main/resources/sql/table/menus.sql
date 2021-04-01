drop table menus cascade constraints;
create table menus
(
    menu_id          number(6) primary key,
    menu_name        varchar2(30)  not null,
    menu_desc        varchar2(50)  not null,
    menu_price       varchar2(10)  not null,
    menu_image       varchar2(200) not null,
    menu_read_count  number(6) default 0,
    menu_order_count number(6) default 0,
    created_at       date      default sysdate,
    updated_at       date      default sysdate,
    store_id         number(6)     not null,
    category_id      number(6)     not null,
    menu_status      number(6)     not null,
    constraint fk_menu_store foreign key (store_id) references stores (store_id),
    constraint fk_menu_category foreign key (category_id) references categories (category_id),
    constraint fk_menu_status foreign key (menu_status) references menu_status (menu_status_id)
);

commit;