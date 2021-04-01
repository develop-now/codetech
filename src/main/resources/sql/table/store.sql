drop table stores cascade constraints;
create table stores
(
    store_id           number(6) primary key,
    store_name         varchar2(50)        not null,
    store_tel          varchar2(50)        not null,
    store_address_si   varchar2(50)        not null,
    store_address_gu   varchar2(50),
    store_address_dong varchar2(50)        not null,
    store_address_etc  varchar2(50),
    store_rnum         varchar2(10)        not null,
    store_image        varchar2(50)        not null,
    report_count       number(5) default 0,
    created_at         date      default sysdate,
    updated_at         date      default sysdate,
    opening_h_w        varchar2(20)        not null,
    opening_h_h        varchar2(20)        not null,
    holiday            varchar2(20)        not null,
    owner_id           number(6)           not null,
    store_status       number(1) default 1 not null,
    constraint fk_store_owner foreign key (owner_id) references users (user_id),
    constraint fk_store_status foreign key (store_status) references store_status (store_status_id)
);

commit;