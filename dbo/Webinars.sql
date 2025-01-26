create table Webinars
(
    Webinar_ID    int      not null
        constraint Webinars_pk
            primary key,
    Instructor_ID int      not null
        constraint Webinars_Employees_Employee_ID_fk
            references Employees,
    Translator_ID int
        constraint Webinars_Translator_Translator_ID_fk
            references Translator,
    Webinar_Name  nvarchar(80),
    Webinar_Date  datetime not null,
    Language_ID   int      not null
        constraint Language_Webinars
            references Language
)
go

create index Webinars_InstructorID
    on Webinars (Instructor_ID)
go

create index Webinars_WebinarDate
    on Webinars (Webinar_Date)
go

create index WebinarDate
    on Webinars (Webinar_Date)
go

create index WebinarInstructorID
    on Webinars (Instructor_ID)
go

