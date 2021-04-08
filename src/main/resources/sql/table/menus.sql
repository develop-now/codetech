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
values (1, '테스트 메뉴1', '이건 테스트 메뉴입니다', '33000',
        'image.jpg', 'image.jpg', 1, 1);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (2, '테스트 메뉴2', '이건 테스트 메뉴입니다', '33000',
        'image.jpg', 'image.jpg', 1, 1);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (3, '테스트 메뉴3', '이건 테스트 메뉴입니다', '33000',
        'image.jpg', 'image.jpg', 1, 1);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (4, '테스트 메뉴4', '이건 테스트 메뉴입니다', '33000',
        'image.jpg', 'image.jpg', 1, 1);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (5, '테스트 메뉴5', '이건 테스트 메뉴입니다', '33000',
        'image.jpg', 'image.jpg', 1, 2);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (6, '테스트 메뉴6', '이건 테스트 메뉴입니다', '33000',
        'image.jpg', 'image.jpg', 1, 3);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (7, '테스트 메뉴7', '이건 테스트 메뉴입니다', '33000',
        'image.jpg', 'image.jpg', 2, 1);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (8, '테스트 메뉴8', '이건 테스트 메뉴입니다', '33000',
        'image.jpg', 'image.jpg', 2, 1);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (9, '테스트 메뉴9', '이건 테스트 메뉴입니다', '33000',
        'image.jpg', 'image.jpg', 2, 1);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (10, '테스트 메뉴10', '이건 테스트 메뉴입니다', '33000',
        'image.jpg', 'image.jpg', 2, 2);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (11, '테스트 메뉴11', '이건 테스트 메뉴입니다', '33000',
        'image.jpg', 'image.jpg', 4, 1);
insert into menus (menu_id, menu_name, menu_desc, menu_price,
                   menu_saved_image, menu_original_image, store_id, category_id)
values (12, '테스트 메뉴12', '이건 테스트 메뉴입니다', '33000',
        'image.jpg', 'image.jpg', 4, 3);

commit;