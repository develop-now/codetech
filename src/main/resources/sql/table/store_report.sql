drop table store_report cascade constraints;
create table store_report
(
    store_report_id number(6) primary key,
    report_subject  varchar2(50)        not null,
    report_content  varchar2(200)       not null,
    created_at      date      default sysdate,
    updated_at      date      default sysdate,
    report_status   number(1) default 1 not null,
    reporter        number(6)           not null,
    reported_store  number(6)           not null,
    constraint fk_store_report_status foreign key (report_status) references report_status (report_status_id),
    constraint fk_store_report_reporter foreign key (reporter) references users (user_id),
    constraint fk_store_report_reported_store foreign key (reported_store) references stores (store_id)
);

insert into store_report (store_report_id, report_subject, report_content, reporter, reported_store)
VALUES (1, '더미 가게 신고글', '5번 유저가 1번 가게 신고', 5, 1);
insert into store_report (store_report_id, report_subject, report_content, reporter, reported_store)
VALUES (2, '더미 가게 신고글', '5번 유저가 3번 가게 신고', 5, 3);
insert into store_report (store_report_id, report_subject, report_content, reporter, reported_store)
VALUES (3, '더미 가게 신고글', '5번 유저가 4번 가게 신고', 5, 4);
insert into store_report (store_report_id, report_subject, report_content, reporter, reported_store)
VALUES (4, '더미 가게 신고글', '7번 유저가 3번 가게 신고', 7, 3);
insert into store_report (store_report_id, report_subject, report_content, reporter, reported_store)
VALUES (5, '더미 가게 신고글', '8번 유저가 3번 가게 신고', 5, 3);

select *
from store_report;

commit;