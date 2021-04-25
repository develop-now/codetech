drop table menus cascade constraints;
create table menus
(
    menu_id             number(6) primary key,
    menu_name           varchar2(30)        not null,
    menu_desc           varchar2(50)        not null,
    menu_price          varchar2(10)        not null,
    menu_saved_image    varchar2(50)        not null,
    menu_original_image varchar2(200)       not null,
    menu_read_count     number(6) default 0,
    menu_order_count    number(6) default 0,
    created_at          date      default sysdate,
    updated_at          date      default sysdate,
    store_id            number(6)           not null,
    category_id         number(6)           not null,
    menu_status         number(6) default 1 not null,
    constraint fk_menu_store foreign key (store_id) references stores (store_id),
    constraint fk_menu_category foreign key (category_id) references categories (category_id),
    constraint fk_menu_status foreign key (menu_status) references menu_status (menu_status_id)
);

insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (1, '더미 메뉴 1-1', '가게 1의 1번 더미 메뉴', '12000',
        '/default.png', '/default.png', 1, 1);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (2, '더미 메뉴 1-2', '가게 1의 2번 메뉴', '32000',
        '/default.png', '/default.png', 1, 5);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (3, '더미 메뉴 1-3', '가게 1의 3번 메뉴', '7000',
        '/default.png', '/default.png', 1, 7);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (4, '더미 메뉴 1-4', '가게 1의 4번 메뉴', '13000',
        '/default.png', '/default.png', 1, 1);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (5, '더미 메뉴 1-5', '가게 1의 2번 메뉴', '29000',
        '/default.png', '/default.png', 1, 1);

insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (6, '더미 메뉴 2-1', '가게 2의 1번 메뉴', '12000',
        '/default.png', '/default.png', 2, 1);

insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (7, '더미 메뉴 3-1', '가게 3의 1번 메뉴', '17000',
        '/default.png', '/default.png', 3, 1);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (8, '더미 메뉴 3-2', '가게 3의 2번 메뉴', '11000',
        '/default.png', '/default.png', 3, 2);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (9, '더미 메뉴 3-3', '가게 3의 3번 메뉴', '12000',
        '/default.png', '/default.png', 3, 4);

insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (10, '더미 메뉴 4-1', '가게 4의 1번 메뉴', '16000',
        '/default.png', '/default.png', 4, 1);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (11, '더미 메뉴 4-2', '가게 4의 2번 메뉴', '18000',
        '/default.png', '/default.png', 4, 4);

insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (12, '더미 메뉴 5-1', '가게 5의 1번 메뉴', '4500',
        '/default.png', '/default.png', 5, 6);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (13, '더미 메뉴 5-2', '가게 5의 2번 메뉴', '2200',
        '/default.png', '/default.png', 5, 6);

select *
from menus;

commit;