create table Course_Meeting
(
    Course_Meeting_ID int          not null
        constraint Course_Meeting_pk
            primary key,
    Course_ID         int          not null
        constraint Courses_CourseMeeting
            references Courses,
    Form              nvarchar(20) not null,
    Date              datetime     not null,
    Instructor_ID     int          not null
        constraint Employees_CourseMeeting
            references Employees,
    Language_ID       int          not null
        constraint Language_CourseMeeting
            references Language,
    Translator_ID     int
        constraint Course_Meeting_Translator_Translator_ID_fk
            references Translator,
    Duration          int
)
go

create index CourseMeeting_Date
    on Course_Meeting (Date)
go

create index CourdeMeeting_InstructorID
    on Course_Meeting (Instructor_ID)
go

