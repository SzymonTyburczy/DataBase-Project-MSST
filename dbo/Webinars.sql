create table Webinars
(
    Webinar_ID    int  not null
        constraint Webinars_pk
            primary key,
    Instructor_ID int  not null,
    Translator_ID int,
    Webinar_Name  nvarchar(80),
    Webinar_Date  date not null,
    Language_ID   int  not null
        constraint Language_Webinars
            references Language
)
go

