drop table comments cascade constraints;
create table comments
(
    comment_id      number(5) primary key,
    comment_content varchar2(200)       not null,
    comment_lev     number(1) default 0,
    comment_seq     number(1) default 0,
    created_at      date      default sysdate,
    updated_at      date      default sysdate,
    comment_writer  number(5)           not null,
    comment_ref     number(5)           not null,
    comment_status  number(1) default 1 not null,
    constraint fk_comment_writer foreign key (comment_writer) references users (user_id),
    constraint fk_comment_store foreign key (comment_ref) references stores (store_id),
    constraint fk_comment_status foreign key (comment_status) references comment_status (comment_status_id)
);

select * from comments;

insert into comments values(16, 't', 0, 0, sysdate, sysdate, 1, 1, 1)



select ab.*, like_count from (

select s1.*, nvl(j1.comment_count, 0) as comment_count
from STORES s1
         left join (
    select s2.store_id as store_id, nvl(count(*), 0) as comment_count
    from stores s2
             join comments c on c.comment_ref = s2.store_id
    group by s2.store_id
) j1 on j1.store_id = s1.store_id

) ab join (

select s1.*, nvl(j1.like_count, 0) as like_count
from STORES s1
         left join (
    select s2.store_id as store_id, nvl(count(*), 0) as like_count
    from stores s2
             join likes c on c.store_id = s2.store_id
    group by s2.store_id
) j1 on j1.store_id = s1.store_id

) bc on ab.store_id = bc.store_id order by comment_count desc;




--
select s1.*, nvl(j1.comment_count, 0) as comment_count, nvl(j2.like_count, 0) as like_count
from STORES s1
         left join (
    select s2.store_id as store_id, nvl(count(*), 0) as comment_count
    from stores s2
             join comments c on c.comment_ref = s2.store_id
    group by s2.store_id
) j1 on j1.store_id = s1.store_id
         left join (
    select s3.store_id as store_id, nvl(count(*), 0) as like_count
    from stores s3
             join likes l on l.store_id = s3.store_id
    group by s3.store_id
) j2 on j2.store_id = s1.store_id;

