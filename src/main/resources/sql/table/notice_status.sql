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

commit;