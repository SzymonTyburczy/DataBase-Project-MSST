create table Student_Internship
(
    Student_ID    int not null
        constraint Student_StudentInternship
            references Students,
    Internship_ID int not null
        constraint Internship_StudentInternship
            references Internship,
    Completion    tinyint,
    constraint Student_Internship_pk
        primary key (Student_ID, Internship_ID)
)
go

create index StudentsInternship_Completion
    on Student_Internship (Completion)
go

