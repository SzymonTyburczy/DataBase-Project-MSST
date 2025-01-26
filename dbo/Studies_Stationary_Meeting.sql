create table Studies_Stationary_Meeting
(
    Studies_Meeting_ID int          not null
        constraint Studies_Stationary_Meeting_pk
            primary key
        constraint StudiesMeeting_StudiesStationaryMeeting
            references Studies_Meeting,
    Room               nvarchar(20) not null
)
go

