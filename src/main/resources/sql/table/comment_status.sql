drop table comment_status cascade constraints;
create table comment_status
(
    comment_status_id number(1) primary key,
    status_value      varchar2(20) not null
);

insert into comment_status
values (1, 'active');       -- 정상 등록
insert into comment_status
values (2, 'inactive');     -- 코멘트 삭제했을때
insert into comment_status
values (3, 'suspending');   -- 코멘트가 신고를 받고 삭제처리 됐을때

commit;