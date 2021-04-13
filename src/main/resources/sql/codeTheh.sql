drop table role cascade constraints ;
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
values (3, 'sotre_owner@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 3);
insert into users (user_id, user_email, user_password, role_id)
values (4, 'staff@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 4);
insert into users (user_id, user_email, user_password, role_id)
values (5, 'user1@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 5);
insert into users (user_id, user_email, user_password, role_id)
values (6, 'user2@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 5);
insert into users (user_id, user_email, user_password, role_id)
values (7, 'user_store_owner@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 3);
insert into users (user_id, user_email, user_password, role_id)
values (8, 'user_3@test.com', '$2a$10$m8c1WRtWd.B7tEi8GC5CxeA9Xix.UkBrdtXqnxjBUR.suqE39DiYa', 5);
INSERT INTO users (user_id, user_email, user_password, role_id)
VALUES (9, 'user9@test.com', '1111', 5);
insert into users (user_id, user_email, user_password, role_id)
values (10, 'user10@test.com', '1111', 5);
insert into users (user_id, user_email, user_password, role_id)
values (11, 'user11@test.com', '1111', 5);
insert into users (user_id, user_email, user_password, role_id)
values (12, 'user12@test.com', '1111', 5);
insert into users (user_id, user_email, user_password, role_id)
values (13, 'user13@test.com', '1111', 5);
INSERT INTO users (user_id, user_email, user_password, role_id)
VALUES (14, 'user14@test.com', '1111', 5);
INSERT INTO users (user_id, user_email, user_password, role_id)
VALUES (15, 'user15@test.com', '1111', 5);


drop table user_info cascade constraints;
create table user_info
(
    info_id       number(6) primary key,
    user_name     varchar2(20) not null,
    user_tel      varchar2(20) not null,
    user_address  varchar2(90) not null,
    user_profile  varchar2(50),
    original_file varchar2(30),
    point         number(6) default 0,
    user_id       number(6)    not null,
    constraint fk_userInfo_user foreign key (user_id) references users (user_id)
);

insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (1, 'site_owner', '111-222-3333', 'korea', 1);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (2, 'site_admin', '111-222-3333', 'korea', 2);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (3, 'store_owner', '111-222-3333', 'korea', 3);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (4, 'staff', '111-222-3333', 'korea', 4);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (5, 'user5', '111-222-3333', 'korea', 5);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (6, 'user6', '111-222-3333', 'korea', 6);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (7, 'user7', '111-222-3333', 'korea', 7);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (8, 'user8', '111-222-3333', 'korea', 8);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (9, 'user9', '111-222-3333', 'korea', 9);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (10, 'user10', '111-222-3333', 'korea', 10);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (11, 'user11', '111-222-3333', 'korea', 11);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (12, 'user12', '111-222-3333', 'korea', 12);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (13, 'user13', '111-222-3333', 'korea', 13);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (14, 'user14', '111-222-3333', 'korea', 14);
insert into user_info (info_id, user_name, user_tel, user_address, user_id)
values (15, 'user15', '111-222-3333', 'korea', 15);


drop table persistent_logins cascade constraints;
create table persistent_logins
(
    username  varchar2(64) not null,
    series    varchar2(64) primary key, -- 기기, 브라우저별 쿠키글 구분할 고유 값
    token     varchar2(64) not null,    -- 브라우저가 가지고 있는 쿠키의 값을 검증할 인증값
    last_used timestamp    not null     -- 가장 최신 자동 로그인 시간
);


drop table persistent_logins cascade constraints;
create table persistent_logins
(
    username  varchar2(64) not null,
    series    varchar2(64) primary key, -- 기기, 브라우저별 쿠키글 구분할 고유 값
    token     varchar2(64) not null,    -- 브라우저가 가지고 있는 쿠키의 값을 검증할 인증값
    last_used timestamp    not null     -- 가장 최신 자동 로그인 시간
);


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

drop table stores cascade constraints;
create table stores
(
    store_id             number(6) primary key,
    store_name           varchar2(50)        not null,
    store_tel            varchar2(50)        not null,
    store_address_si     varchar2(50)        not null,
    store_address_gu     varchar2(50),
    store_address_dong   varchar2(50)        not null,
    store_address_etc    varchar2(50),
    store_desc           varchar2(200)       not null,
    store_rnum           varchar2(20)        not null,
    store_saved_image    varchar2(50)        not null,
    store_original_image varchar2(200)       not null,
    report_count         number(5) default 0,
    created_at           date      default sysdate,
    updated_at           date      default sysdate,
    opening_h_w_open     varchar2(20)        not null, -- 평일 영업 시작 시간
    opening_h_w_close    varchar2(20)        not null, -- 평일 영업 종료 시간
    opening_h_h_open     varchar2(20)        not null, -- 휴일 영업 시작 시간
    opening_h_h_close    varchar2(20)        not null, -- 휴일 영업 종료 시간
    holiday              varchar2(30)        not null, -- 휴일
    owner_id             number(6)           not null,
    store_status         number(1) default 1 not null,
    store_like           number(5) default 0,
    store_comment        number(5) default 0,
    constraint fk_store_owner foreign key (owner_id) references users (user_id),
    constraint fk_store_status foreign key (store_status) references store_status (store_status_id)
);


insert into stores(store_id, store_name, store_tel, store_address_si, store_address_dong, store_desc, store_rnum,
                   store_saved_image, store_original_image, opening_h_w_open, opening_h_w_close,
                   opening_h_h_open, opening_h_h_close, holiday, owner_id)
values (1, 'Test Store', '111-222-3333', '안양시', '부림동', '가게 1 설명입니다', '123-56-12325', 'a.png', 'image_url',
        '09:00', '20:00', '10:00', '20:00', 'friday', 3);

insert into stores(store_id, store_name, store_tel, store_address_si, store_address_dong, store_desc, store_rnum,
                   store_saved_image, store_original_image, opening_h_w_open, opening_h_w_close,
                   opening_h_h_open, opening_h_h_close, holiday, owner_id)
values (2, 'Test Store2', '111-222-3333', '서울시', '종로3가동', '가게 2 설명입니다', '123-56-12325', 'b.png', 'image_url',
        '09:00', '20:00', '10:00', '20:00', 'friday', 3);

insert into stores(store_id, store_name, store_tel, store_address_si, store_address_dong, store_desc, store_rnum,
                   store_saved_image, store_original_image, opening_h_w_open, opening_h_w_close,
                   opening_h_h_open, opening_h_h_close, holiday, owner_id)
values (3, 'Test Store3', '111-222-3333', '목포시', '용해동', '가게 3 설명입니다', '123-56-12325', 'c.png', 'image_url',
        '09:00', '20:00', '10:00', '20:00', 'friday', 7);

insert into stores(store_id, store_name, store_tel, store_address_si, store_address_dong, store_desc, store_rnum,
                   store_saved_image, store_original_image, opening_h_w_open, opening_h_w_close,
                   opening_h_h_open, opening_h_h_close, holiday, owner_id)
values (4, 'Test Store4', '111-222-3333', '목포시', '용해동', '가게 3 설명입니다', '123-56-12325', 'd.png', 'image_url',
        '09:00', '20:00', '10:00', '20:00', 'friday', 3);


drop table categories cascade constraints;
create table categories
(
    category_id   number(5) primary key,
    category_name varchar2(10) not null
);

insert into categories
values (1, '양식');
insert into categories
values (2, '한식');
insert into categories
values (3, '일식');
insert into categories
values (4, '디저트');
insert into categories
values (5, '커피');


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
values (5, 'completed'); -- 손님이 픽업을 했을때


drop table orders cascade constraints;
create table orders
(
    order_id          number(6) primary key,
    created_at        date default sysdate,
    updated_at        date default sysdate,
    order_total_price varchar2(10),
    order_user        number(6) not null,
    order_status      number(6) not null,
    store_id          number(6) not null,
    constraint fk_order_user foreign key (order_user) references users (user_id),
    constraint fk_order_status foreign key (order_status) references order_status (order_status_id),
    constraint fk_order_store foreign key (store_id) references stores (store_id)
);

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
    staff_id number(6) primary key,
    user_id  number(6) not null,
    store_id number(6) not null,
    constraint fk_staff_user foreign key (user_id) references users (user_id),
    constraint fk_staff_store foreign key (store_id) references stores (store_id)
);

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
    created_at      date      default sysdate,
    updated_at      date      default sysdate,
    comment_writer  number(5)           not null,
    comment_ref     number(5)           not null,
    comment_status  number(1) default 1 not null,
    constraint fk_comment_writer foreign key (comment_writer) references users (user_id),
    constraint fk_comment_store foreign key (comment_ref) references stores (store_id),
    constraint fk_comment_status foreign key (comment_status) references comment_status (comment_status_id)
);

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

drop table comment_report cascade constraints;
create table comment_report
(
    cmt_report_id  number(6) primary key,
    report_subject varchar2(50)        not null,
    report_content varchar2(200)       not null,
    created_at     date      default sysdate,
    updated_at     date      default sysdate,
    report_status  number(1) default 1 not null,
    reporter       number(6)           not null,
    reported_cmt   number(6)           not null,
    constraint fk_cmt_report_status foreign key (report_status) references report_status (report_status_id),
    constraint fk_cmt_report_reporter foreign key (reporter) references users (user_id),
    constraint fk_cmt_report_reported_cmt foreign key (reported_cmt) references comments (comment_id)
);


drop table carts cascade constraints;
create table carts
(
    cart_id       number(5) primary key,
    menu_quantity number(3) default 0,
    created_at    date      default sysdate,
    updated_at    date      default sysdate,
    user_id       number(5) not null,
    menu_id       number(5) not null,
    constraint fk_carts_user foreign key (user_id) references users (user_id),
    constraint fk_carts_menu foreign key (menu_id) references menus (menu_id)
);

drop table storemap cascade constraints;

create table storemap
(
    storemap_id             number(6) primary key,
    store_name           varchar2(50)        not null,
    store_address_si     varchar2(50)        not null,
    store_address_gu     varchar2(50),
    store_address_dong   varchar2(50)        not null,
   	lat		 				varchar2(50) not null, 			
    lon    	 			 varchar2(50) not null	        

    --constraint fk_store_id foreign key (store_id) references stores(store_id)
);


insert into storemap values(1,'이마트24 카페', '서울시', '종로구', '종로3가', 37.572799, 126.991945)


commit;