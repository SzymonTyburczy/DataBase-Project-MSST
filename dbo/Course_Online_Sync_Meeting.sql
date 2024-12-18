create table Course_Online_Sync_Meeting
(
    Course_Meeting_ID int           not null
        constraint Course_Online_Sync_Meeting_pk
            primary key
        constraint CourseMeeting_CourseOnlineSyncMeeting
            references Course_Meeting,
    Link_To_Meeting   nvarchar(max) not null
)
go

