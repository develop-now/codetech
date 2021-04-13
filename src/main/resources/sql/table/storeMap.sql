drop table storemap cascade constraints;

create table storemap
(
    storemap_id        number(6) primary key,
    store_name         varchar2(50) not null,
    store_address_si   varchar2(50) not null,
    store_address_gu   varchar2(50),
    store_address_dong varchar2(50) not null,
    lat                varchar2(50) not null,
    lon                varchar2(50) not null

    --constraint fk_store_id foreign key (store_id) references stores(store_id)
);


insert into storemap
values (1, '이마트24 카페', '서울시', '종로구', '종로3가', 37.572799, 126.991945);

select *
from storemap