drop table store_status;
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
values (3, 'suspending');   -- 활동 정지 상태

commit;