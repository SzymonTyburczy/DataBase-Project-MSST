create table Internship
(
    Internship_ID int  not null
        constraint Internship_pk
            primary key,
    Studies_ID    int  not null
        constraint Studies_Internship
            references Studies,
    Start_Date    date not null
)
go

