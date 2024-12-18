create table Exchange_Rate
(
    Currency_ID int   not null
        constraint Exchange_Rate_pk
            primary key,
    Zloty       money not null,
    Euro        money not null,
    Dolar       money not null,
    Funt        money not null
)
go

