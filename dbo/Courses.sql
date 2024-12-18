create table Courses
(
    Course_ID      int          not null
        constraint Courses_pk
            primary key,
    Name           nvarchar(30) not null,
    Description    nvarchar(30) not null,
    Price          money        not null,
    Coordinator_ID int          not null
)
go

