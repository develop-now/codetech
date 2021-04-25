drop table persistent_logins cascade constraints;
create table persistent_logins
(
    username  varchar2(64) not null,
    series    varchar2(64) primary key, -- 기기, 브라우저별 쿠키글 구분할 고유 값
    token     varchar2(64) not null,    -- 브라우저가 가지고 있는 쿠키의 값을 검증할 인증값
    last_used timestamp    not null     -- 가장 최신 자동 로그인 시간
);


drop table role cascade constraints;
create table role
(
    role_id    number(1) primary key,
    role_value varchar2(20) not null
);

insert into role
values (1, 'ROLE_SITE_OWNER');
insert into role
values (2, 'ROLE_ADMIN');
insert into role
values (3, 'ROLE_STORE_OWNER');
insert into role
values (4, 'ROLE_STORE_STAFF');
insert into role
values (5, 'ROLE_MEMBER');

drop table user_status cascade constraints;

create table user_status
(
    user_status_id number(1) primary key,
    status_value   varchar2(20) not null
);

insert into user_status
values (1, 'active');
insert into user_status
values (2, 'inactive'); -- 자기가 탈퇴했을때
insert into user_status
values (3, 'suspending'); -- 활동 정지
insert into user_status
values (4, 'banned'); -- 추방

drop table users cascade constraints;
create table users
(
    user_id       number(6) primary key,
    user_email    varchar2(50) unique not null,
    user_password varchar2(70)        not null,
    report_count  number(5) default 0,
    created_at    date      default sysdate,
    updated_at    date      default sysdate,
    user_auth     number(1) default 0 not null,
    role_id       number(1) default 5 not null,
    user_status   number(1) default 1 not null,
    constraint fk_users_role foreign key (role_id) references role (role_id),
    constraint fk_users_status foreign key (user_status) references user_status (user_status_id)
);

insert into users (user_id, user_email, user_password, role_id)
values (1, 'site_owner@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 1);
insert into users (user_id, user_email, user_password, role_id)
values (2, 'admin@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 2);
insert into users (user_id, user_email, user_password, role_id)
values (3, 'store_owner@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 3);
insert into users (user_id, user_email, user_password, role_id)
values (4, 'staff@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 4);
insert into users (user_id, user_email, user_password, role_id)
values (5, 'user1@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 5);
insert into users (user_id, user_email, user_password, role_id)
values (6, 'user2@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 5);
insert into users (user_id, user_email, user_password, role_id)
values (7, 'user_3@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 5);

insert into users (user_id, user_email, user_password, role_id)
values (8, 'dummy_user1@test.com', '1234', 5);
INSERT INTO users (user_id, user_email, user_password, role_id)
VALUES (9, 'dummy_user2@test.com', '1234', 5);
insert into users (user_id, user_email, user_password, role_id)
values (10, 'dummy_user3@test.com', '1234', 5);
insert into users (user_id, user_email, user_password, role_id)
values (11, 'dummy_user4@test.com', '1234', 5);
insert into users (user_id, user_email, user_password, role_id)
values (12, 'dummy_user5@test.com', '1234', 5);
insert into users (user_id, user_email, user_password, role_id)
values (13, 'dummy_user6@test.com', '1234', 5);
INSERT INTO users (user_id, user_email, user_password, role_id)
VALUES (14, 'dummy_user7@test.com', '1234', 5);
INSERT INTO users (user_id, user_email, user_password, role_id)
VALUES (15, 'dummy_user8@test.com', '1234', 5);
INSERT INTO users (user_id, user_email, user_password, role_id)
VALUES (16, 'dummy_store_owner8@test.com', '1234', 3);
INSERT INTO users (user_id, user_email, user_password, role_id)
VALUES (17, 'dummy_staff8@test.com', '1234', 4);


drop table user_info cascade constraints;
create table user_info
(
    info_id       number(6) primary key,
    user_name     varchar2(20) not null,
    user_tel      varchar2(20) not null,
    user_address  varchar2(90) not null,
    user_profile  varchar2(200),
    original_file varchar2(200) default '/profile.png',
    point         number(6)     default 0,
    user_id       number(6)    not null,
    constraint fk_userInfo_user foreign key (user_id) references users (user_id)
);

insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (1, 'site_owner', '01022223333', '00000korea', 1);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (2, 'site_admin', '01022223333', '00000korea', 2);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (3, 'store_owner', '01022223333', '00000korea', 3);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (4, 'staff', '01022223333', '00000korea', 4);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (5, 'user1', '01022223333', '00000korea', 5);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (6, 'user2', '01022223333', '00000korea', 6);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (7, 'user3', '01022223333', '00000korea', 7);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (8, 'dummy_user1', '01022223333', '00000korea', 8);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (9, 'dummy_user2', '01022223333', '00000korea', 9);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (10, 'dummy_user3', '01022223333', '00000korea', 10);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (11, 'dummy_user4', '01022223333', '00000korea', 11);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (12, 'dummy_user5', '01022223333', '00000korea', 12);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (13, 'dummy_user6', '01022223333', '00000korea', 13);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (14, 'dummy_user7', '01022223333', '00000korea', 14);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (15, 'dummy_store_owner8', '01022223333', '00000korea', 15);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (16, 'dummy_staff1', '01022223333', '00000korea', 16);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (17, 'dummy_staff2', '01022223333', '00000korea', 17);



drop table store_status cascade constraints;
create table store_status
(
    store_status_id number(1) primary key,
    status_value    varchar2(20) not null
);

insert into store_status
values (1, 'active');
insert into store_status
values (2, 'inactive'); -- 가게가 문을 닫을때
insert into store_status
values (3, 'pending'); -- 가게가 막 생성됐을때
insert into store_status
values (4, 'suspending'); -- 활동 정지 상태
insert into store_status
values (5, 'termination'); -- 파트너 종료 상태

drop table stores cascade constraints;
create table stores
(
    store_id             number(6) primary key,
    store_name           varchar2(50)  not null,
    store_tel            varchar2(50)  not null,
    store_address_si     varchar2(50)  not null,
    store_address_gu     varchar2(50),
    store_address_dong   varchar2(50)  not null,
    store_address_etc    varchar2(50),
    store_desc           varchar2(200) not null,
    store_rnum           varchar2(20)  not null,
    store_saved_image    varchar2(200) not null,
    store_original_image varchar2(200) not null,
    report_count         number(5) default 0,
    created_at           date      default sysdate,
    updated_at           date      default sysdate,
    opening_h_w_open     varchar2(20)  not null, -- 평일 영업 시작 시간
    opening_h_w_close    varchar2(20)  not null, -- 평일 영업 종료 시간
    opening_h_h_open     varchar2(20)  not null, -- 휴일 영업 시작 시간
    opening_h_h_close    varchar2(20)  not null, -- 휴일 영업 종료 시간
    holiday              varchar2(30)  not null, -- 휴일
    store_address_lat    varchar2(50)  not null,
    store_address_lon    varchar2(50)  not null,
    owner_id             number(6)     not null,
    store_status         number(6)     not null,

    constraint fk_store_owner foreign key (owner_id) references users (user_id),
    constraint fk_store_status foreign key (store_status) references store_status (store_status_id)
);


insert into stores(store_id, store_name, store_tel, store_address_si, store_address_dong, store_desc, store_rnum,
                   store_saved_image, store_original_image, opening_h_w_open, opening_h_w_close,
                   opening_h_h_open, opening_h_h_close, holiday,
                   store_address_lat, store_address_lon, owner_id, store_status)
values (1, 'Dummy Store', '111-222-3333', '안양시', '부림동', '가게 1 설명입니다', '123-56-12325', '/a.png', 'a.png',
        '09:00', '21:00', '10:00', '20:00', 'friday', '126.961784254615', '37.3970119478972', 3, 1);

insert into stores(store_id, store_name, store_tel, store_address_si, store_address_dong, store_desc, store_rnum,
                   store_saved_image, store_original_image, opening_h_w_open, opening_h_w_close,
                   opening_h_h_open, opening_h_h_close, holiday,
                   store_address_lat, store_address_lon, owner_id, store_status)
values (2, 'Dummy Store2', '111-222-3333', '서울시', '종로3가동', '가게 2 설명입니다', '123-56-12325', '/b.png', 'b.png',
        '09:00', '20:00', '10:00', '20:00', 'monday', '126.99224096958', '37.5737887699783', 3, 3);

insert into stores(store_id, store_name, store_tel, store_address_si, store_address_dong, store_desc, store_rnum,
                   store_saved_image, store_original_image, opening_h_w_open, opening_h_w_close,
                   opening_h_h_open, opening_h_h_close, holiday,
                   store_address_lat, store_address_lon, owner_id, store_status)
values (3, 'Dummy Store3', '111-222-3333', '서울시', '사당동', '가게 3 설명입니다', '123-56-12325', '/c.png', 'c.png',
        '09:00', '20:00', '10:00', '20:00', 'friday', '126.961821544248', '37.4859370065553', 15, 1);

insert into stores(store_id, store_name, store_tel, store_address_si, store_address_dong, store_desc, store_rnum,
                   store_saved_image, store_original_image, opening_h_w_open, opening_h_w_close,
                   opening_h_h_open, opening_h_h_close, holiday,
                   store_address_lat, store_address_lon, owner_id, store_status)
values (4, 'Dummy Store4', '111-222-3333', '서울시', '압구정동', '가게 3 설명입니다', '123-56-12325', '/d.png', 'd.png',
        '09:00', '20:00', '10:00', '20:00', 'thursday', '127.024454982256', '37.5267858196588', 3, 2);

insert into stores(store_id, store_name, store_tel, store_address_si, store_address_dong, store_desc, store_rnum,
                   store_saved_image, store_original_image, opening_h_w_open, opening_h_w_close,
                   opening_h_h_open, opening_h_h_close, holiday,
                   store_address_lat, store_address_lon, owner_id, store_status)
values (5, 'Dummy Store5', '111-222-3333', '서울시', '창신동', '가게 3 설명입니다', '123-56-12325', '/a.png', 'a.png',
        '09:00', '20:00', '10:00', '20:00', 'friday', '126.937248465038', '37.5572967348437', 15, 3);



drop table categories cascade constraints;
create table categories
(
    category_id   number(5) primary key,
    category_name varchar2(10) not null
);

insert into categories
values (1, '한식');
insert into categories
values (2, '양식');
insert into categories
values (3, '일식');
insert into categories
values (4, '중식');
insert into categories
values (5, '분식');
insert into categories
values (6, '커피');
insert into categories
values (7, '디저트');


drop table menu_status cascade constraints;
create table menu_status
(
    menu_status_id number(1) primary key,
    status_value   varchar2(20) not null
);

insert into menu_status
values (1, 'active'); -- 주문 가능
insert into menu_status
values (2, 'inactive'); -- 주문 불가
insert into menu_status
values (3, 'soldout'); -- 품절


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

drop table order_status cascade constraints;
create table order_status
(
    order_status_id number(1) primary key,
    status_value    varchar2(20) not null
);

insert into order_status
values (1, 'ordered'); -- 주문이 들어갔을때
insert into order_status
values (2, 'checked'); -- 가게 사장이 주문을 확인 했을때
insert into order_status
values (3, 'processing'); -- 주문을 수락하고 조리에 들어갔을때
insert into order_status
values (4, 'completed'); -- 조리가 끝났을때
insert into order_status
values (5, 'done'); -- 손님이 픽업을 했을때


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


drop table points cascade constraints;
create table points
(
    point_id    number(5) primary key,
    point_value number(3) default 0,
    created_at  date      default sysdate,
    order_id    number(5)   not null,
    store_id    number(5)   not null,
    user_id     number(5)   not null,
    point_type  varchar2(3) not null,
    constraint fk_point_order foreign key (order_id) references orders (order_id),
    constraint fk_point_store foreign key (store_id) references stores (store_id),
    constraint fk_point_user foreign key (user_id) references users (user_id),
    constraint point_type_ck check (point_type in ('get', 'use'))
);

drop table staffs cascade constraints;
create table staffs
(
    staff_id   number(6) primary key,
    user_id    number(6) not null,
    store_id   number(6) not null,
    created_at date default sysdate,
    constraint fk_staff_user foreign key (user_id) references users (user_id),
    constraint fk_staff_store foreign key (store_id) references stores (store_id)
);

insert into staffs (staff_id, user_id, store_id)
values (1, 4, 1);
insert into staffs (staff_id, user_id, store_id)
values (2, 4, 3);
insert into staffs (staff_id, user_id, store_id)
values (3, 4, 4);
insert into staffs (staff_id, user_id, store_id)
values (4, 16, 1);
insert into staffs (staff_id, user_id, store_id)
values (5, 16, 3);
insert into staffs (staff_id, user_id, store_id)
values (6, 17, 1);
insert into staffs (staff_id, user_id, store_id)
values (7, 17, 4);

drop table likes cascade constraints;
create table likes
(
    like_id    number(5) primary key,
    created_at date default sysdate,
    store_id   number(5) not null,
    user_id    number(5) not null,
    constraint fk_like_store foreign key (store_id) references stores (store_id),
    constraint fk_like_user foreign key (user_id) references users (user_id)
);

insert into likes(like_id, store_id, user_id)
values (1, 1, 5);
insert into likes(like_id, store_id, user_id)
values (2, 3, 5);
insert into likes(like_id, store_id, user_id)
values (3, 4, 7);
insert into likes(like_id, store_id, user_id)
values (4, 1, 6);
insert into likes(like_id, store_id, user_id)
values (5, 3, 10);

drop table comment_status cascade constraints;
create table comment_status
(
    comment_status_id number(1) primary key,
    status_value      varchar2(20) not null
);

insert into comment_status
values (1, 'active'); -- 정상 등록
insert into comment_status
values (2, 'inactive'); -- 코멘트 삭제했을때
insert into comment_status
values (3, 'suspending'); -- 코멘트가 신고를 받고 삭제처리 됐을때


drop table comments cascade constraints;
create table comments
(
    comment_id      number(5) primary key,
    comment_content varchar2(200)       not null,
    comment_lev     number(1) default 0,
    comment_seq     number(1) default 0,
    comment_ref     number(5)           not null,
    created_at      date      default sysdate,
    updated_at      date      default sysdate,
    comment_writer  number(5)           not null,
    comment_store   number(5)           not null,
    comment_status  number(1) default 1 not null,
    constraint fk_comment_writer foreign key (comment_writer) references users (user_id),
    constraint fk_comment_store foreign key (comment_store) references stores (store_id),
    constraint fk_comment_status foreign key (comment_status) references comment_status (comment_status_id)
);

insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (1, 1, 5, 1, to_date('20210423', 'YYYYMMDD'), '유저 5번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (2, 2, 6, 1, to_date('20210423', 'YYYYMMDD'), '유저 6번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (3, 3, 7, 3, to_date('20210423', 'YYYYMMDD'), '유저 7번이 3번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (4, 4, 8, 4, to_date('20210423', 'YYYYMMDD'), '유저 8번이 4번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (5, 5, 5, 4, to_date('20210423', 'YYYYMMDD'), '유저 5번이 4번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (6, 6, 9, 1, to_date('20210423', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (7, 7, 10, 1, to_date('20210423', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (8, 8, 11, 1, to_date('20210423', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (9, 9, 12, 1, to_date('20210423', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (10, 10, 13, 1, to_date('20210423', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (11, 11, 14, 1, to_date('20210423', 'YYYYMMDD'), '유저 14번 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (12, 12, 5, 1, to_date('20210423', 'YYYYMMDD'), '유저 5번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (13, 13, 6, 1, to_date('20210423', 'YYYYMMDD'), '유저 6번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (14, 14, 7, 1, to_date('20210423', 'YYYYMMDD'), '유저 7번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (15, 15, 8, 1, to_date('20210423', 'YYYYMMDD'), '유저 8번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (16, 16, 9, 1, to_date('20210423', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (17, 17, 10, 1, to_date('20210423', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (18, 18, 11, 1, to_date('20210423', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (19, 19, 12, 1, to_date('20210423', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (20, 20, 13, 1, to_date('20210423', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글');

insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (21, 21, 5, 3, to_date('20210424', 'YYYYMMDD'), '유저 5번이 3번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (22, 22, 6, 3, to_date('20210424', 'YYYYMMDD'), '유저 6번이 3번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (23, 23, 7, 3, to_date('20210424', 'YYYYMMDD'), '유저 7번이 3번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (24, 24, 8, 4, to_date('20210424', 'YYYYMMDD'), '유저 8번이 4번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (25, 25, 5, 4, to_date('20210424', 'YYYYMMDD'), '유저 5번이 4번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (26, 26, 9, 1, to_date('20210424', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (27, 27, 10, 1, to_date('20210424', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (28, 28, 11, 1, to_date('20210424', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (29, 29, 12, 1, to_date('20210424', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (30, 30, 13, 1, to_date('20210424', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (31, 31, 14, 1, to_date('20210424', 'YYYYMMDD'), '유저 14번 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (32, 32, 5, 1, to_date('20210424', 'YYYYMMDD'), '유저 5번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (33, 33, 6, 1, to_date('20210424', 'YYYYMMDD'), '유저 6번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (34, 34, 7, 1, to_date('20210424', 'YYYYMMDD'), '유저 7번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (35, 35, 8, 1, to_date('20210424', 'YYYYMMDD'), '유저 8번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (36, 36, 9, 1, to_date('20210424', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (37, 37, 10, 1, to_date('20210424', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (38, 38, 11, 1, to_date('20210424', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (39, 39, 12, 1, to_date('20210424', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (40, 40, 13, 1, to_date('20210424', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글_2');

insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (41, 41, 5, 3, to_date('20210425', 'YYYYMMDD'), '유저 5번이 3번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (42, 42, 6, 3, to_date('20210425', 'YYYYMMDD'), '유저 6번이 3번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (43, 43, 7, 3, to_date('20210425', 'YYYYMMDD'), '유저 7번이 3번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (44, 44, 8, 4, to_date('20210425', 'YYYYMMDD'), '유저 8번이 4번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (45, 45, 5, 4, to_date('20210425', 'YYYYMMDD'), '유저 5번이 4번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (46, 46, 9, 1, to_date('20210425', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (47, 47, 10, 1, to_date('20210425', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (48, 48, 11, 1, to_date('20210425', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (49, 49, 12, 1, to_date('20210425', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (50, 50, 13, 1, to_date('20210425', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (51, 51, 14, 1, to_date('20210425', 'YYYYMMDD'), '유저 14번 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (52, 52, 5, 1, to_date('20210425', 'YYYYMMDD'), '유저 5번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (53, 53, 6, 1, to_date('20210425', 'YYYYMMDD'), '유저 6번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (54, 54, 7, 1, to_date('20210425', 'YYYYMMDD'), '유저 7번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (55, 55, 8, 1, to_date('20210425', 'YYYYMMDD'), '유저 8번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (56, 56, 9, 1, to_date('20210425', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (57, 57, 10, 1, to_date('20210425', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (58, 58, 11, 1, to_date('20210425', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (59, 59, 12, 1, to_date('20210425', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (60, 60, 13, 1, to_date('20210425', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글_3');

insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (61, 61, 5, 3, to_date('20210424', 'YYYYMMDD'), '유저 5번이 3번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (62, 62, 6, 3, to_date('20210424', 'YYYYMMDD'), '유저 6번이 3번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (63, 63, 7, 3, to_date('20210424', 'YYYYMMDD'), '유저 7번이 3번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (64, 64, 8, 4, to_date('20210424', 'YYYYMMDD'), '유저 8번이 4번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (65, 65, 5, 4, to_date('20210424', 'YYYYMMDD'), '유저 5번이 4번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (66, 66, 9, 1, to_date('20210424', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (67, 67, 10, 1, to_date('20210424', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (68, 68, 11, 1, to_date('20210424', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (69, 69, 12, 1, to_date('20210424', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (70, 70, 13, 1, to_date('20210424', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (71, 71, 14, 1, to_date('20210424', 'YYYYMMDD'), '유저 14번 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (72, 72, 5, 1, to_date('20210424', 'YYYYMMDD'), '유저 5번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (73, 73, 6, 1, to_date('20210424', 'YYYYMMDD'), '유저 6번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (74, 74, 7, 1, to_date('20210424', 'YYYYMMDD'), '유저 7번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (75, 75, 8, 1, to_date('20210424', 'YYYYMMDD'), '유저 8번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (76, 76, 9, 1, to_date('20210424', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (77, 77, 10, 1, to_date('20210424', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (78, 78, 11, 1, to_date('20210424', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (79, 79, 12, 1, to_date('20210424', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (80, 80, 13, 1, to_date('20210424', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글_4');

insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (81, 81, 5, 3, to_date('20210423', 'YYYYMMDD'), '유저 5번이 3번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (82, 828, 6, 3, to_date('20210423', 'YYYYMMDD'), '유저 6번이 3번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (83, 83, 7, 3, to_date('20210423', 'YYYYMMDD'), '유저 7번이 3번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (84, 84, 8, 4, to_date('20210423', 'YYYYMMDD'), '유저 8번이 4번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (85, 85, 5, 4, to_date('20210423', 'YYYYMMDD'), '유저 5번이 4번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (86, 86, 9, 1, to_date('20210423', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (87, 87, 10, 1, to_date('20210423', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (88, 88, 11, 1, to_date('20210423', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (89, 89, 12, 1, to_date('20210423', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (90, 90, 13, 1, to_date('20210423', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (91, 91, 14, 1, to_date('20210423', 'YYYYMMDD'), '유저 14번 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (92, 92, 5, 1, to_date('20210423', 'YYYYMMDD'), '유저 5번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (93, 93, 6, 1, to_date('20210423', 'YYYYMMDD'), '유저 6번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (94, 94, 7, 1, to_date('20210423', 'YYYYMMDD'), '유저 7번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (95, 95, 8, 1, to_date('20210423', 'YYYYMMDD'), '유저 8번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (96, 96, 9, 1, to_date('20210423', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (97, 97, 10, 1, to_date('20210423', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (98, 98, 11, 1, to_date('20210423', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (99, 99, 12, 1, to_date('20210423', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (100, 100, 13, 1, to_date('20210423', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글_5');

drop table report_status cascade constraints;
create table report_status
(
    report_status_id number(1) primary key,
    status_value     varchar2(20) not null
);

insert into report_status
values (1, 'reported'); -- 신고글 처음 등록
insert into report_status
values (2, 'processing'); -- 운영자가 확인후
insert into report_status
values (3, 'completed'); -- 운영자가 처리후


drop table user_report cascade constraints;
create table user_report
(
    user_report_id number(6) primary key,
    report_subject varchar2(50)        not null,
    report_content varchar2(200)       not null,
    created_at     date      default sysdate,
    updated_at     date      default sysdate,
    report_status  number(1) default 1 not null,
    reporter       number(6)           not null,
    reported_user  number(6)           not null,
    constraint fk_user_report_status foreign key (report_status) references report_status (report_status_id),
    constraint fk_user_report_reporter foreign key (reporter) references users (user_id),
    constraint fk_user_report_reported_user foreign key (reported_user) references users (user_id)
);

-- 유저가 유저 신고
INSERT INTO USER_REPORT
(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES (1, '유저가 유저를 신고합니다.', '사실 구라에요', 1, 10, 14);

INSERT INTO USER_REPORT
(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES (2, '유저가 유저를 신고합니다.', '사실 구라에요 무야~호!', 1, 11, 13);

INSERT INTO USER_REPORT
(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES (3, '유저가 유저를 신고합니다.', '사실 구라에요 라고 할 뻔ㅋ', 1, 12, 12);

-- 가게가 유저 신고
INSERT INTO USER_REPORT
(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES (4, '가게가 유저를 신고합니다.', '사실 구라에요', 1, 3, 14);

INSERT INTO USER_REPORT
(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES (5, '가게가 유저를 신고합니다.', '사실 구라에요 무야~호!', 1, 3, 13);

INSERT INTO USER_REPORT
(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES (6, '가게가 유저를 신고합니다.', '사실 구라에요 라고 할 뻔ㅋ', 1, 3, 12);


drop table store_report cascade constraints;
create table store_report
(
    store_report_id number(6) primary key,
    report_subject  varchar2(50)        not null,
    report_content  varchar2(200)       not null,
    created_at      date      default sysdate,
    updated_at      date      default sysdate,
    report_status   number(1) default 1 not null,
    reporter        number(6)           not null,
    reported_store  number(6)           not null,
    constraint fk_store_report_status foreign key (report_status) references report_status (report_status_id),
    constraint fk_store_report_reporter foreign key (reporter) references users (user_id),
    constraint fk_store_report_reported_store foreign key (reported_store) references stores (store_id)
);

insert into store_report (store_report_id, report_subject, report_content, reporter, reported_store)
VALUES (1, '더미 가게 신고글', '5번 유저가 1번 가게 신고', 5, 1);
insert into store_report (store_report_id, report_subject, report_content, reporter, reported_store)
VALUES (2, '더미 가게 신고글', '5번 유저가 3번 가게 신고', 5, 3);
insert into store_report (store_report_id, report_subject, report_content, reporter, reported_store)
VALUES (3, '더미 가게 신고글', '5번 유저가 4번 가게 신고', 5, 4);

INSERT INTO USER_REPORT(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES (7, '더미 유저 댓글 신고', '5번 유저가 8번 유저 댓글 신고', 1, 5, 8);
INSERT INTO USER_REPORT(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES (8, '더미 유저 댓글 신고', '5번 유저가 9번 유저 댓글 신고', 2, 5, 9);

insert into store_report (store_report_id, report_subject, report_content, reporter, reported_store)
VALUES (4, '더미 가게 신고글', '7번 유저가 3번 가게 신고', 7, 3);
insert into store_report (store_report_id, report_subject, report_content, reporter, reported_store)
VALUES (5, '더미 가게 신고글', '8번 유저가 3번 가게 신고', 5, 3);

INSERT INTO USER_REPORT(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES (9, '더미 유저 댓글 신고', '5번 유저가 10번 유저 댓글 신고', 2, 5, 10);
INSERT INTO USER_REPORT(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES (10, '더미 유저 댓글 신고', '5번 유저가 11번 유저 댓글 신고', 3, 5, 11);
INSERT INTO USER_REPORT(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES (11, '더미 유저 댓글 신고', '5번 유저가 12번 유저 댓글 신고', 3, 5, 12);


drop table carts cascade constraints;
create table carts
(
    cart_id       number(5) primary key,
    menu_quantity number(3) default 0,
    created_at    date      default sysdate,
    updated_at    date      default sysdate,
    user_id       number(5) not null,
    menu_id       number(5) not null,
    cart_status   number(3) default 0, --0이면 결제 미완료, 1이면 결제 완료
    constraint fk_carts_user foreign key (user_id) references users (user_id),
    constraint fk_carts_menu foreign key (menu_id) references menus (menu_id)
);


drop table notice_status cascade constraints;
create table notice_status
(
    notice_status_id number(1) primary key,
    status_value     varchar2(20) not null
);

insert into notice_status
values (1, 'notice'); -- 공지사항
insert into notice_status
values (2, 'event'); -- 이벤트
insert into notice_status
values (3, 'inspect'); -- 점검

drop table notice cascade constraints;
create table notice
(
    notice_id        number(6) primary key,
    notice_status    number(1)     not null, -- 공지/이벤트/점검
    notice_subject   varchar2(100) not null,
    notice_content   varchar2(400) not null,
    notice_readcount number(6) default 0,
    notice_date      date      default sysdate,

    -- notice_top				number(1)		default 0,	-- 공지 최상단 고정
    constraint fk_notice_status foreign key (notice_status) references notice_status (notice_status_id)
);

insert into notice
(notice_id, notice_status, notice_subject, notice_content, notice_readcount)
values (1, 1, '21/04/19 사이트 안내사항 입니다.', '테스트 입니다.', 1828);

insert into notice
(notice_id, notice_status, notice_subject, notice_content, notice_readcount)
values (2, 2, 'CODETECH를 이용 하시는 모든 분들께 드리는 선물 입니다.', '테스트 입니다.', 1828);

insert into notice
(notice_id, notice_status, notice_subject, notice_content, notice_readcount)
values (3, 3, '21/04/19 사이트 점검사항 입니다.', '테스트 입니다.', 1828);

commit;