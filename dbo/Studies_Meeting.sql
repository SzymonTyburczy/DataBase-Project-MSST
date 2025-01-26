create table Studies_Meeting
(
    Studies_Meeting_ID int not null
        constraint Studies_Meeting_pk
            primary key,
    Studies_ID         int not null
        constraint Studies_Meeting_Studies_Details_Studies_ID_fk
            references Studies_Details,
    Subject_ID         int not null
        constraint Studies_Meeting_Subjects_Subject_ID_fk
            references Subjects,
    Translator_ID      int
        constraint Studies_Meeting_Translator_Translator_ID_fk
            references Translator,
    Language_ID        int not null
        constraint Language_StudiesMeeting
            references Language,
    Instructor_ID      int
        constraint Studies_Meeting_Employees_Employee_ID_fk
            references Employees
)
go

create index StudiesMeeting_InstructorID
    on Studies_Meeting (Instructor_ID)
go

create index StudiesMeeting_LanguageID
    on Studies_Meeting (Language_ID)
go

create index StudiesMeeting_Subject
    on Studies_Meeting (Subject_ID)
go

