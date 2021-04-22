drop table carts cascade constraints;
create table carts
(
    cart_id       number(5) primary key,
    menu_quantity number(3) default 0,
    created_at    date      default sysdate,
    updated_at    date      default sysdate,
    user_id       number(5) not null,
    menu_id       number(5) not null,
    cart_status   number(3) default 0, --0이면 결제 미완료, 1이면 결제 완료
    constraint fk_carts_user foreign key (user_id) references users (user_id),
    constraint fk_carts_menu foreign key (menu_id) references menus (menu_id)
);

select * from carts where user_id = 17;

commit;