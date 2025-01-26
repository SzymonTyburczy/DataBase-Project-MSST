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
    Price            money        not null,
    Duration         int
)
go

create index StudiesMeeting_Price
    on Studies_Meeting_Details (Price)
go

create index StudiesMeeting_Form
    on Studies_Meeting_Details (Form)
go

create index StudiesMeeting_Date
    on Studies_Meeting_Details (Date)
go

