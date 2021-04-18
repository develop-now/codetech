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
    owner_id             number(6)     not null,
    store_status         number(6)     not null,

    constraint fk_store_owner foreign key (owner_id) references users (user_id),
    constraint fk_store_status foreign key (store_status) references store_status (store_status_id)
);


insert into stores(store_id, store_name, store_tel, store_address_si, store_address_dong, store_desc, store_rnum,
                   store_saved_image, store_original_image, opening_h_w_open, opening_h_w_close,
                   opening_h_h_open, opening_h_h_close, holiday, owner_id, store_status)
values (1, 'Test Store', '111-222-3333', '안양시', '부림동', '가게 1 설명입니다', '123-56-12325', '/a.png', 'image_url',
        '09:00', '20:00', '10:00', '20:00', 'friday', 3, 1);

insert into stores(store_id, store_name, store_tel, store_address_si, store_address_dong, store_desc, store_rnum,
                   store_saved_image, store_original_image, opening_h_w_open, opening_h_w_close,
                   opening_h_h_open, opening_h_h_close, holiday, owner_id, store_status)
values (2, 'Test Store2', '111-222-3333', '서울시', '종로3가동', '가게 2 설명입니다', '123-56-12325', '/b.png', 'image_url',
        '09:00', '20:00', '10:00', '20:00', 'friday', 3, 1);

insert into stores(store_id, store_name, store_tel, store_address_si, store_address_dong, store_desc, store_rnum,
                   store_saved_image, store_original_image, opening_h_w_open, opening_h_w_close,
                   opening_h_h_open, opening_h_h_close, holiday, owner_id, store_status)
values (3, 'Test Store3', '111-222-3333', '목포시', '용해동', '가게 3 설명입니다', '123-56-12325', '/c.png', 'image_url',
        '09:00', '20:00', '10:00', '20:00', 'friday', 7, 1);

insert into stores(store_id, store_name, store_tel, store_address_si, store_address_dong, store_desc, store_rnum,
                   store_saved_image, store_original_image, opening_h_w_open, opening_h_w_close,
                   opening_h_h_open, opening_h_h_close, holiday, owner_id, store_status)
values (4, 'Test Store9', '111-222-3333', '목포시', '용해동', '가게 3 설명입니다', '123-56-12325', '/d.png', 'image_url',
        '09:00', '20:00', '10:00', '20:00', 'friday', 3, 1);


update stores
set STORE_STATUS = 2
where store_id = 4;

select *
from stores;

commit;



