drop table comments cascade constraints;
create table comments
(
    comment_id      number(5) primary key,
    comment_content varchar2(200)       not null,
    comment_lev     number(1) default 0,
    comment_seq     number(1) default 0,
    comment_ref     number(5)           not null,
    created_at      date      default sysdate,
    updated_at      date      default sysdate,
    comment_writer  number(5)           not null,
    comment_store   number(5)           not null,
    comment_status  number(1) default 1 not null,
    constraint fk_comment_writer foreign key (comment_writer) references users (user_id),
    constraint fk_comment_store foreign key (comment_store) references stores (store_id),
    constraint fk_comment_status foreign key (comment_status) references comment_status (comment_status_id)
);

insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (1, 1, 5, 1, to_date('20210423', 'YYYYMMDD'), '유저 5번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (2, 2, 6, 1, to_date('20210423', 'YYYYMMDD'), '유저 6번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (3, 3, 7, 3, to_date('20210423', 'YYYYMMDD'), '유저 7번이 3번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (4, 4, 8, 4, to_date('20210423', 'YYYYMMDD'), '유저 8번이 4번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (5, 5, 5, 4, to_date('20210423', 'YYYYMMDD'), '유저 5번이 4번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (6, 6, 9, 1, to_date('20210423', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (7, 7, 10, 1, to_date('20210423', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (8, 8, 11, 1, to_date('20210423', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (9, 9, 12, 1, to_date('20210423', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (10, 10, 13, 1, to_date('20210423', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (11, 11, 14, 1, to_date('20210423', 'YYYYMMDD'), '유저 14번 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (12, 12, 5, 1, to_date('20210423', 'YYYYMMDD'), '유저 5번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (13, 13, 6, 1, to_date('20210423', 'YYYYMMDD'), '유저 6번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (14, 14, 7, 1, to_date('20210423', 'YYYYMMDD'), '유저 7번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (15, 15, 8, 1, to_date('20210423', 'YYYYMMDD'), '유저 8번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (16, 16, 9, 1, to_date('20210423', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (17, 17, 10, 1, to_date('20210423', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (18, 18, 11, 1, to_date('20210423', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (19, 19, 12, 1, to_date('20210423', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (20, 20, 13, 1, to_date('20210423', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글');

insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (21, 21, 5, 3, to_date('20210424', 'YYYYMMDD'), '유저 5번이 3번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (22, 22, 6, 3, to_date('20210424', 'YYYYMMDD'), '유저 6번이 3번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (23, 23, 7, 3, to_date('20210424', 'YYYYMMDD'), '유저 7번이 3번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (24, 24, 8, 4, to_date('20210424', 'YYYYMMDD'), '유저 8번이 4번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (25, 25, 5, 4, to_date('20210424', 'YYYYMMDD'), '유저 5번이 4번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (26, 26, 9, 1, to_date('20210424', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (27, 27, 10, 1, to_date('20210424', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (28, 28, 11, 1, to_date('20210424', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (29, 29, 12, 1, to_date('20210424', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (30, 30, 13, 1, to_date('20210424', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (31, 31, 14, 1, to_date('20210424', 'YYYYMMDD'), '유저 14번 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (32, 32, 5, 1, to_date('20210424', 'YYYYMMDD'), '유저 5번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (33, 33, 6, 1, to_date('20210424', 'YYYYMMDD'), '유저 6번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (34, 34, 7, 1, to_date('20210424', 'YYYYMMDD'), '유저 7번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (35, 35, 8, 1, to_date('20210424', 'YYYYMMDD'), '유저 8번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (36, 36, 9, 1, to_date('20210424', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (37, 37, 10, 1, to_date('20210424', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (38, 38, 11, 1, to_date('20210424', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (39, 39, 12, 1, to_date('20210424', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글_2');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (40, 40, 13, 1, to_date('20210424', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글_2');

insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (41, 41, 5, 3, to_date('20210425', 'YYYYMMDD'), '유저 5번이 3번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (42, 42, 6, 3, to_date('20210425', 'YYYYMMDD'), '유저 6번이 3번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (43, 43, 7, 3, to_date('20210425', 'YYYYMMDD'), '유저 7번이 3번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (44, 44, 8, 4, to_date('20210425', 'YYYYMMDD'), '유저 8번이 4번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (45, 45, 5, 4, to_date('20210425', 'YYYYMMDD'), '유저 5번이 4번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (46, 46, 9, 1, to_date('20210425', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (47, 47, 10, 1, to_date('20210425', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (48, 48, 11, 1, to_date('20210425', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (49, 49, 12, 1, to_date('20210425', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (50, 50, 13, 1, to_date('20210425', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (51, 51, 14, 1, to_date('20210425', 'YYYYMMDD'), '유저 14번 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (52, 52, 5, 1, to_date('20210425', 'YYYYMMDD'), '유저 5번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (53, 53, 6, 1, to_date('20210425', 'YYYYMMDD'), '유저 6번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (54, 54, 7, 1, to_date('20210425', 'YYYYMMDD'), '유저 7번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (55, 55, 8, 1, to_date('20210425', 'YYYYMMDD'), '유저 8번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (56, 56, 9, 1, to_date('20210425', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (57, 57, 10, 1, to_date('20210425', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (58, 58, 11, 1, to_date('20210425', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (59, 59, 12, 1, to_date('20210425', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글_3');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (60, 60, 13, 1, to_date('20210425', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글_3');

insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (61, 61, 5, 3, to_date('20210424', 'YYYYMMDD'), '유저 5번이 3번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (62, 62, 6, 3, to_date('20210424', 'YYYYMMDD'), '유저 6번이 3번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (63, 63, 7, 3, to_date('20210424', 'YYYYMMDD'), '유저 7번이 3번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (64, 64, 8, 4, to_date('20210424', 'YYYYMMDD'), '유저 8번이 4번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (65, 65, 5, 4, to_date('20210424', 'YYYYMMDD'), '유저 5번이 4번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (66, 66, 9, 1, to_date('20210424', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (67, 67, 10, 1, to_date('20210424', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (68, 68, 11, 1, to_date('20210424', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (69, 69, 12, 1, to_date('20210424', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (70, 70, 13, 1, to_date('20210424', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (71, 71, 14, 1, to_date('20210424', 'YYYYMMDD'), '유저 14번 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (72, 72, 5, 1, to_date('20210424', 'YYYYMMDD'), '유저 5번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (73, 73, 6, 1, to_date('20210424', 'YYYYMMDD'), '유저 6번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (74, 74, 7, 1, to_date('20210424', 'YYYYMMDD'), '유저 7번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (75, 75, 8, 1, to_date('20210424', 'YYYYMMDD'), '유저 8번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (76, 76, 9, 1, to_date('20210424', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (77, 77, 10, 1, to_date('20210424', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (78, 78, 11, 1, to_date('20210424', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (79, 79, 12, 1, to_date('20210424', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글_4');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (80, 80, 13, 1, to_date('20210424', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글_4');

insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (81, 81, 5, 3, to_date('20210423', 'YYYYMMDD'), '유저 5번이 3번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (82, 828, 6, 3, to_date('20210423', 'YYYYMMDD'), '유저 6번이 3번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (83, 83, 7, 3, to_date('20210423', 'YYYYMMDD'), '유저 7번이 3번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (84, 84, 8, 4, to_date('20210423', 'YYYYMMDD'), '유저 8번이 4번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (85, 85, 5, 4, to_date('20210423', 'YYYYMMDD'), '유저 5번이 4번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (86, 86, 9, 1, to_date('20210423', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (87, 87, 10, 1, to_date('20210423', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (88, 88, 11, 1, to_date('20210423', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (89, 89, 12, 1, to_date('20210423', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (90, 90, 13, 1, to_date('20210423', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (91, 91, 14, 1, to_date('20210423', 'YYYYMMDD'), '유저 14번 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (92, 92, 5, 1, to_date('20210423', 'YYYYMMDD'), '유저 5번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (93, 93, 6, 1, to_date('20210423', 'YYYYMMDD'), '유저 6번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (94, 94, 7, 1, to_date('20210423', 'YYYYMMDD'), '유저 7번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (95, 95, 8, 1, to_date('20210423', 'YYYYMMDD'), '유저 8번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (96, 96, 9, 1, to_date('20210423', 'YYYYMMDD'), '유저 9번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (97, 97, 10, 1, to_date('20210423', 'YYYYMMDD'), '유저 10번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (98, 98, 11, 1, to_date('20210423', 'YYYYMMDD'), '유저 11번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (99, 99, 12, 1, to_date('20210423', 'YYYYMMDD'), '유저 12번이 1번 가게에 단 댓글_5');
insert into comments(comment_id, comment_ref, comment_writer, comment_store,
                     created_at, comment_content)
VALUES (100, 100, 13, 1, to_date('20210423', 'YYYYMMDD'), '유저 13번이 1번 가게에 단 댓글_5');

commit;


select *
from comments;


select *
from comments
where comment_store = 2
order by comment_ref desc, comment_lev, comment_seq;

insert into comments
values ((select nvl(max(comment_id), 0) + 1 from COMMENTS),
        '사장님이 댓글을 달면 이런식으로 입력이 된다.',
        1, 1, 5, sysdate, sysdate, 4, 2, 1);
insert into comments
values ((select nvl(max(comment_id), 0) + 1 from COMMENTS),
        '사장님이 댓글을 달면 이런식으로 입력이 된다.',
        1, 1, 8, sysdate, sysdate, 4, 2, 1);
insert into comments
values ((select nvl(max(comment_id), 0) + 1 from COMMENTS),
        '사장님이 댓글을 달면 이런식으로 입력이 된다1.',
        1, 1, 11, sysdate, sysdate, 4, 2, 1);
insert into comments
values ((select nvl(max(comment_id), 0) + 1 from COMMENTS),
        '사장님이 댓글을 달면 이런식으로 입력이 된다2.',
        1, 1, 10, sysdate, sysdate, 4, 2, 1);

