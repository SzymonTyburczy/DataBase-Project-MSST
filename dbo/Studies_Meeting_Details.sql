create table Studies_Meeting_Details
(
    Study_Meeting_ID int          not null
        constraint Studies_Meeting_Details_pk
            primary key
        constraint StudiesMeeting_StudiesMeetingDetails
            references Studies_Meeting,
    Form             nvarchar(20) not null,
    Date             datetime     not null,
    Seat_Limit       int          not null,
    Duration         time         not null,
    Price            money        not null
)
go

