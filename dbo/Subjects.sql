create table Subjects
(
    Subject_ID   int          not null
        constraint Subjects_pk
            primary key,
    Studies_ID   int          not null
        constraint Subjects_Studies_Studies_ID_fk
            references Studies,
    Subject_Name nvarchar(40) not null
)
go

