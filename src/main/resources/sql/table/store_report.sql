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
    constraint fk_user_report_status foreign key (report_status) references report_status (report_status_id),
    constraint fk_user_report_reporter foreign key (reporter) references users (user_id),
    constraint fk_user_report_reported_user foreign key (reported_store) references stores (store_id)
);