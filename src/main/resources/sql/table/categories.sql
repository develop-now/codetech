drop table categories cascade constraints;
create table categories
(
    category_id   number(5) primary key,
    category_name varchar2(10) not null
);

insert into categories
values (1, '양식');
insert into categories
values (2, '한식');
insert into categories
values (3, '일식');
insert into categories
values (4, '디저트');
insert into categories
values (5, '커피');

commit;