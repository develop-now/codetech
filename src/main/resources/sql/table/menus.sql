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
    constraint fk_menu_store foreign key (store_id) references stores (store_id)
)