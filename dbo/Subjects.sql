create table Subjects
(
    Subject_ID   int          not null
        constraint Subjects_pk
            primary key,
    Studies_ID   int          not null,
    Subject_Name nvarchar(40) not null
)
go

