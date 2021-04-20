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

insert into comments
values (1,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.11',
        0, 0, 1, sysdate, sysdate, 5, 1, 1);
insert into comments
values (2,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.22',
        0, 0, 2, sysdate, sysdate, 4, 1, 1);
insert into comments
values (3,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.33',
        0, 0, 3, sysdate, sysdate, 4, 1, 1);
insert into comments
values (4,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.44',
        0, 0, 4, sysdate, sysdate, 5, 2, 1);
insert into comments
values (5,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.55',
        0, 0, 5, sysdate, sysdate, 5, 3, 1);
insert into comments
values (6,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.66',
        0, 0, 6, sysdate, sysdate, 4, 2, 1);
insert into comments
values (7,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.77',
        0, 0, 7, sysdate, sysdate, 4, 1, 1);
insert into comments
values (8,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.88',
        0, 0, 8, sysdate, sysdate, 5, 1, 1);
insert into comments
values (9,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.99',
        0, 0, 9, sysdate, sysdate, 4, 2, 1);
insert into comments
values (10,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.1010',
        0, 0, 10, sysdate, sysdate, 5, 2, 1);
insert into comments
values (11,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.11',
        0, 0, 11, sysdate, sysdate, 5, 1, 1);
insert into comments
values (12,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.22',
        0, 0, 12, sysdate, sysdate, 4, 1, 1);
insert into comments
values (13,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.33',
        0, 0, 13, sysdate, sysdate, 4, 1, 1);
insert into comments
values (14,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.44',
        0, 0, 14, sysdate, sysdate, 5, 2, 1);
insert into comments
values (15,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.55',
        0, 0, 15, sysdate, sysdate, 5, 3, 1);
insert into comments
values (16,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.66',
        0, 0, 16, sysdate, sysdate, 4, 2, 1);
insert into comments
values (17,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.77',
        0, 0, 17, sysdate, sysdate, 4, 1, 1);
insert into comments
values (18,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.88',
        0, 0, 18, sysdate, sysdate, 5, 1, 1);
insert into comments
values (19,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.99',
        0, 0, 19, sysdate, sysdate, 4, 2, 1);
insert into comments
values (20,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.1010',
        0, 0, 20, sysdate, sysdate, 5, 2, 1);
insert into comments
values (21,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.11',
        0, 0, 21, sysdate, sysdate, 5, 1, 1);
insert into comments
values (22,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.22',
        0, 0, 22, sysdate, sysdate, 4, 1, 1);
insert into comments
values (23,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.33',
        0, 0, 23, sysdate, sysdate, 4, 1, 1);
insert into comments
values (24,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.44',
        0, 0, 24, sysdate, sysdate, 5, 2, 1);
insert into comments
values (25,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.55',
        0, 0, 25, sysdate, sysdate, 5, 3, 1);
insert into comments
values (26,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.66',
        0, 0, 26, sysdate, sysdate, 4, 2, 1);
insert into comments
values (27,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.77',
        0, 0, 27, sysdate, sysdate, 4, 1, 1);
insert into comments
values (28,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.88',
        0, 0, 28, sysdate, sysdate, 5, 1, 1);
insert into comments
values (29,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.99',
        0, 0, 29, sysdate, sysdate, 4, 2, 1);
insert into comments
values (30,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.1010',
        0, 0, 30, sysdate, sysdate, 5, 2, 1);
insert into comments
values (31,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.11',
        0, 0, 31, sysdate, sysdate, 5, 1, 1);
insert into comments
values (32,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.22',
        0, 0, 32, sysdate, sysdate, 4, 1, 1);
insert into comments
values (33,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.33',
        0, 0, 33, sysdate, sysdate, 4, 1, 1);
insert into comments
values (34,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.44',
        0, 0, 34, sysdate, sysdate, 5, 2, 1);
insert into comments
values (35,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.55',
        0, 0, 35, sysdate, sysdate, 5, 3, 1);
insert into comments
values (36,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.66',
        0, 0, 36, sysdate, sysdate, 4, 2, 1);
insert into comments
values (37,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.77',
        0, 0, 37, sysdate, sysdate, 4, 1, 1);
insert into comments
values (38,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.88',
        0, 0, 38, sysdate, sysdate, 5, 1, 1);
insert into comments
values (39,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.99',
        0, 0, 39, sysdate, sysdate, 4, 2, 1);
insert into comments
values (40,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.1010',
        0, 0, 40, sysdate, sysdate, 5, 2, 1);
insert into comments
values (41,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.11',
        0, 0, 41, sysdate, sysdate, 5, 1, 1);
insert into comments
values (42,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.22',
        0, 0, 42, sysdate, sysdate, 4, 1, 1);
insert into comments
values (43,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.33',
        0, 0, 43, sysdate, sysdate, 4, 1, 1);
insert into comments
values (44,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.44',
        0, 0, 44, sysdate, sysdate, 5, 2, 1);
insert into comments
values (45,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.55',
        0, 0, 45, sysdate, sysdate, 5, 3, 1);
insert into comments
values (46,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.66',
        0, 0, 46, sysdate, sysdate, 4, 2, 1);
insert into comments
values (47,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.77',
        0, 0, 47, sysdate, sysdate, 4, 1, 1);
insert into comments
values (48,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.88',
        0, 0, 48, sysdate, sysdate, 5, 1, 1);
insert into comments
values (49,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.99',
        0, 0, 49, sysdate, sysdate, 4, 2, 1);
insert into comments
values (50,
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias harum incidunt ipsum, nesciunt odit officia quasi quidem quos ut voluptatibus.1010',
        0, 0, 50, sysdate, sysdate, 5, 2, 1);

commit;

select * from comments;



select * from comments where comment_store = 2 order by comment_ref desc, comment_lev, comment_seq;



insert into comments
values ((select nvl(max(comment_id),0)+1 from COMMENTS),
        '사장님이 댓글을 달면 이런식으로 입력이 된다.',
        1, 1, 5, sysdate, sysdate, 4, 2, 1);
insert into comments
values ((select nvl(max(comment_id),0)+1 from COMMENTS),
        '사장님이 댓글을 달면 이런식으로 입력이 된다.',
        1, 1, 8, sysdate, sysdate, 4, 2, 1);
 insert into comments
values ((select nvl(max(comment_id),0)+1 from COMMENTS),
        '사장님이 댓글을 달면 이런식으로 입력이 된다1.',
        1, 1, 11, sysdate, sysdate, 4, 2, 1);
insert into comments
values ((select nvl(max(comment_id),0)+1 from COMMENTS),
        '사장님이 댓글을 달면 이런식으로 입력이 된다2.',
        1, 1, 10, sysdate, sysdate, 4, 2, 1);

