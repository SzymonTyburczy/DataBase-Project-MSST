create table Participant_Meeting
(
    Course_Meeting_ID int not null
        constraint Participant_Meeting_pk
            primary key
        constraint CourseMeeting_ParticipantMeeting
            references Course_Meeting,
    Participant_ID    int not null
        constraint ParticipantCourse_ParticipantMeeting
            references Participant_Course,
    Attendance        bit
)
go

