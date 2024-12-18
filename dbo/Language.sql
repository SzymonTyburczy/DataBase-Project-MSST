create table Language
(
    Language_ID int          not null
        constraint Language_pk
            primary key,
    Language    nvarchar(20) not null
)
go

