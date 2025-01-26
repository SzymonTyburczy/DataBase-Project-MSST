create table Student_Meeting
(
    Student_ID       int  not null
        constraint Student_StudentMeeting
            references Students,
    Study_Meeting_ID int  not null
        constraint StudiesMeeting_Student_Meeting
            references Studies_Meeting,
    Attendance       bit,
    Meeting_Date     date not null,
    constraint Student_Meeting_pk
        primary key (Student_ID, Study_Meeting_ID)
)
go

