create table Translator
(
    Translator_ID int not null
        constraint Translator_pk
            primary key
        constraint Employees_Translator
            references Employees,
    Language_ID   int not null
        constraint Language_Translator
            references Language
)
go

