create table Orders_Details
(
    Details_ID       int      not null
        constraint Orders_Details_pk
            primary key
        constraint Orders_OrderDetails
            references Orders,
    Payment_Deadline datetime not null,
    Currency_ID      int      not null
        constraint ExchangeRate_OrderDetails
            references Exchange_Rate,
    Amount           int
)
go

create index OrdersDetails_CurrencyID
    on Orders_Details (Currency_ID)
go

create index OrderValue
    on Orders_Details (Amount)
go

