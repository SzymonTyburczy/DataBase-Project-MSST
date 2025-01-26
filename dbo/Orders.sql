create table Orders
(
    Order_ID     int           not null
        constraint Orders_pk
            primary key,
    Client_ID    int           not null
        constraint Orders_Users_User_ID_fk
            references Users,
    Order_Date   datetime      not null,
    Payment_Link nvarchar(max) not null
)
go

create index OrderDate
    on Orders (Order_Date)
go

