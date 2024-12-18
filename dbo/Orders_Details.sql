create table Orders_Details
(
    Details_ID       int      not null
        constraint Orders_Details_pk
            primary key,
    Order_ID         int      not null
        constraint Orders_OrderDetails
            references Orders,
    Payment_Deadline datetime not null,
    Currency_ID      int      not null
        constraint ExchangeRate_OrderDetails
            references Exchange_Rate,
    Amount           money    not null
)
go

