create table Studies_Online_Sync_Meeting
(
    Studies_Meeting_ID int           not null
        constraint Studies_Online_Sync_Meeting_pk
            primary key
        constraint StudiesMeeting_StudiesOnlineSyncMeeting
            references Studies_Meeting,
    Link_To_Meeting    nvarchar(max) not null
)
go

