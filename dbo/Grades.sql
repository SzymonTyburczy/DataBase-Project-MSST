create table Grades
(
    Student_ID int not null
        constraint Student_Grades
            references Students,
    Subject_ID int not null,
    Studies_ID int not null
        constraint Studies_Grades
            references Studies,
    Grades     int not null,
    constraint Grades_pk
        primary key (Student_ID, Subject_ID, Studies_ID)
)
go

