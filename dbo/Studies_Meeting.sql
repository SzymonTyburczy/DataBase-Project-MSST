create table Studies_Meeting
(
    Studies_Meeting_ID int not null
        constraint Studies_Meeting_pk
            primary key,
    Studies_ID         int not null,
    Subject_ID         int not null,
    Translator_ID      int,
    Language_ID        int not null
        constraint Language_StudiesMeeting
            references Language
)
go

