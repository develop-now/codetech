drop table report_status cascade constraints;
create table report_status
(
    report_status_id number(1) primary key,
    status_value     varchar2(20) not null
);

insert into report_status
values (1, 'reported');     -- 신고글 처음 등록
insert into report_status
values (2, 'processing');   -- 운영자가 확인후
insert into report_status
values (3, 'completed');    -- 운영자가 처리후

commit;