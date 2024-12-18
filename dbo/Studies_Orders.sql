create table Studies_Orders
(
    Details_ID int not null
        constraint Studies_Orders_pk
            primary key
        constraint Studies_Orders_Orders_Details_Details_ID_fk
            references Orders_Details,
    Studies_ID int not null
        constraint Studies_Orders_Studies_Studies_ID_fk
            references Studies
)
go

