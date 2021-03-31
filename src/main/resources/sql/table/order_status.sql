drop table order_status;
create table order_status
(
    order_status_id number(1) primary key,
    status_value    varchar2(20) not null
);

insert into order_status
values (1, 'ordered');      -- 주문이 들어갔을때
insert into order_status
values (2, 'checked');      -- 가게 사장이 주문을 확인 했을때
insert into order_status
values (3, 'processing');   -- 주문을 수락하고 조리에 들어갔을때
insert into order_status
values (3, 'completed');     -- 조리가 끝났을때
insert into order_status
values (3, 'completed');    -- 손님이 픽업을 했을때

commit;