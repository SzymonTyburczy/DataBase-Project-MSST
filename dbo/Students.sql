create table Students
(
    Student_ID int not null
        constraint Students_pk
            primary key
        constraint Students_Users_User_ID_fk
            references Users,
    Studies_ID int not null
        constraint Students_Studies_Studies_ID_fk
            references Studies
)
go

create index Students_StudiesID
    on Students (Studies_ID)
go

