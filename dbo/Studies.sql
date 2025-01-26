create table Studies
(
    Studies_ID          int   not null
        constraint Studies_pk
            primary key,
    Number_Of_Semesters int   not null,
    Fee                 money not null,
    Seat_Limit          int   not null
)
go

