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
    store_desc           varchar2(700) not null,
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


select *
from stores;

commit;



