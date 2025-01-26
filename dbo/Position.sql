create table Position
(
    Position_ID   int           not null
        constraint Position_pk
            primary key,
    Position_Name nvarchar(40)  not null,
    Permisstions  nvarchar(max) not null
)
go

