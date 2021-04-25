drop table notice cascade constraints;
create table notice
(
    notice_id        number(6) primary key,
    notice_status    number(1)     not null, -- 공지/이벤트/점검
    notice_subject   varchar2(100) not null,
    notice_content   varchar2(400) not null,
    notice_readcount number(6) default 0,
    notice_date      date      default sysdate,

    -- notice_top				number(1)		default 0,	-- 공지 최상단 고정
    constraint fk_notice_status foreign key (notice_status) references notice_status (notice_status_id)
);

insert into notice
(notice_id, notice_status, notice_subject, notice_content, notice_readcount,)
values (1, 1, '21/04/19 사이트 안내사항 입니다.', '테스트 입니다.', 1828);

insert into notice
(notice_id, notice_status, notice_subject, notice_content, notice_readcount)
values (2, 2, 'CODETECH를 이용 하시는 모든 분들께 드리는 선물 입니다.', '테스트 입니다.', 1828);

insert into notice
(notice_id, notice_status, notice_subject, notice_content, notice_readcount)
values (3, 3, '21/04/19 사이트 점검사항 입니다.', '테스트 입니다.', 1828);

commit;