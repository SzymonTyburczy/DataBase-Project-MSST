create table Course_Online_Async_Meeting
(
    Course_Meeting_ID int           not null
        constraint Course_Online_Async_Meeting_pk
            primary key
        constraint CourseMeeting_CourseOnlineAsyncMeeting
            references Course_Meeting,
    Link_To_Meeting   nvarchar(max) not null
)
go

