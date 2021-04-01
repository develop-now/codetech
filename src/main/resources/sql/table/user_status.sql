drop table user_status cascade constraints;
create table user_status
(
    user_status_id number(1) primary key,
    status_value   varchar2(20) not null
);

insert into user_status
values (1, 'active');
insert into user_status
values (2, 'inactive');     -- 자기가 탈퇴했을때
insert into user_status
values (3, 'suspending');   -- 활동 정지
insert into user_status
values (4, 'banned');       -- 추방

commit;