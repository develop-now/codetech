drop table user_report cascade constraints;
create table user_report
(
    user_report_id number(6) primary key,
    report_subject varchar2(50)        not null,
    report_content varchar2(200)       not null,
    created_at     date      default sysdate,
    updated_at     date      default sysdate,
    report_status  number(1) default 1 not null,
    reporter       number(6)           not null,
    reported_user  number(6)           not null,
    constraint fk_user_report_status foreign key (report_status) references report_status (report_status_id),
    constraint fk_user_report_reporter foreign key (reporter) references users (user_id),
    constraint fk_user_report_reported_user foreign key (reported_user) references users (user_id)
);

select *
from user_report;

-- 유저가 유저 신고
INSERT INTO USER_REPORT
(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES
(1, '유저가 유저를 신고합니다.', '사실 구라에요', 1, 10, 15);

INSERT INTO USER_REPORT
(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES
(2, '유저가 유저를 신고합니다.', '사실 구라에요 무야~호!', 1, 11, 14);

INSERT INTO USER_REPORT
(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES
(3, '유저가 유저를 신고합니다.', '사실 구라에요 라고 할 뻔ㅋ', 1, 12, 13);

-- 가게가 유저 신고
INSERT INTO USER_REPORT
(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES
(4, '가게가 유저를 신고합니다.', '사실 구라에요', 1, 3, 15);

INSERT INTO USER_REPORT
(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES
(5, '가게가 유저를 신고합니다.', '사실 구라에요 무야~호!', 1, 3, 14);

INSERT INTO USER_REPORT
(user_report_id, report_subject, report_content, report_status, reporter, reported_user)
VALUES
(6, '가게가 유저를 신고합니다.', '사실 구라에요 라고 할 뻔ㅋ', 1, 3, 13);

commit;