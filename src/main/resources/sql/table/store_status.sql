drop table store_status cascade constraints;
create table store_status
(
    store_status_id number(1) primary key,
    status_value    varchar2(20) not null
);

insert into store_status
values (1, 'active');
insert into store_status
values (2, 'inactive');     -- 가게가 문을 닫을때
insert into store_status
values (3, 'pending');   -- 가게가 막 생성됐을때
insert into store_status
values (4, 'suspending');   -- 활동 정지 상태

commit;