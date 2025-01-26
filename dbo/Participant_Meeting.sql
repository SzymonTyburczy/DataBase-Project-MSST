create table Participant_Meeting
(
    Participant_ID    int not null
        constraint Participant_Meeting_Participant_Course_Participant_ID_fk
            references Participant_Course,
    Attendance        bit,
    Course_Meeting_ID int
        constraint Participant_Meeting_Course_Meeting_Course_Meeting_ID_fk
            references Course_Meeting
)
go

