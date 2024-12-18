create table Studies_Details
(
    Studies_ID     int           not null
        constraint Studies_Details_pk
            primary key,
    Name           nvarchar(40)  not null,
    Description    nvarchar(max) not null,
    Syllabus       nvarchar(max) not null,
    Coordinator_ID int           not null
        constraint Employees_StudiesDetails
            references Employees
)
go

