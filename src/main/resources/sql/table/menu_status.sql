drop table menu_status cascade constraints;
create table menu_status
(
    menu_status_id number(1) primary key,
    status_value   varchar2(20) not null
);

insert into menu_status
values (1, 'active');       -- 주문 가능
insert into menu_status
values (2, 'inactive');     -- 주문 불가
insert into menu_status
values (3, 'soldout');      -- 품절

commit;