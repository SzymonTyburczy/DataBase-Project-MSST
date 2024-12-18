create table Orders
(
    Order_ID     int           not null
        constraint Orders_pk
            primary key,
    Client_ID    int           not null,
    Order_Date   datetime      not null,
    Payment_Link nvarchar(max) not null
)
go

