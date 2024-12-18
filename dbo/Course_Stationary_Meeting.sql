create table Course_Stationary_Meeting
(
    Course_Meeting_ID int          not null
        constraint Course_Stationary_Meeting_pk
            primary key
        constraint CourseMeeting_CourseStationaryMeeting
            references Course_Meeting,
    Room              nvarchar(20) not null,
    Seats_Limit       int          not null
)
go

